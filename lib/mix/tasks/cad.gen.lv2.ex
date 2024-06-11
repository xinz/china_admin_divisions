defmodule Mix.Tasks.Cad.Gen.Lv2 do
  use Mix.Task

  @repo_dir "Administrative-divisions-of-China/dist"
  @priv_path :code.priv_dir(:china_admin_divisions)
  @repo_dist_path Path.absname(@repo_dir, @priv_path)

  alias ChinaAdminDivisions.Helper

  def run(_args) do
    generate()
  end

  defp read_pca_code() do
    content = File.read!("#{@repo_dist_path}/pcas-code.json")
    Jason.decode!(content)
  end

  defp generate() do
    pca_code = read_pca_code()
    {lv1lv2_items, lv2lv3_items, lv3lv4_items, lv4_items, lv1_items, lv1_names, lv1_shorter_names, lv1_codes} =
      Enum.reduce(pca_code, {[], [], [], [], [], [], [], []}, fn p, {pcs0, cas0, lv3_4_acc, lv4_acc, lv1_items, lv1_names, lv1_shorter_names, lv1_codes} ->
        lv1_name = p["name"]
        lv1_code = p["code"]

        {lv2_items, lv2_3_items, lv3_4_items, lv4_items} =
          Enum.reduce(p["children"], {[], [], [], []}, fn lv2_item, {l2s, l2_3s, lv3_4s, l4s} ->
            lv2_name = lv2_item["name"]
            {lv2_name, lv2_shorter_name} = 
              case lv2_name do
                "市辖区" ->
                  {"#{lv1_name}/#{lv2_name}", "#{Helper.make_lv1_name_shorter(lv1_name)}/#{lv2_name}"}
                "县" ->
                  # 重庆市下属区分"市辖区"和"县"
                  # see: https://www.stats.gov.cn/sj/tjbz/tjyqhdmhcxhfdm/2023/50.html
                  {"#{lv1_name}/#{lv2_name}", "#{Helper.make_lv1_name_shorter(lv1_name)}/#{lv2_name}"}
                "省直辖县级行政区划" ->
                  # 4290
                  # see: https://www.stats.gov.cn/sj/tjbz/tjyqhdmhcxhfdm/2023/42.html
                  {"#{lv1_name}/#{lv2_name}", "#{Helper.make_lv1_name_shorter(lv1_name)}/#{lv2_name}"}
                "自治区直辖县级行政区划" ->
                  # 6590
                  # see: https://www.stats.gov.cn/sj/tjbz/tjyqhdmhcxhfdm/2023/65.html
                  {"#{lv1_name}/#{lv2_name}", "#{Helper.make_lv1_name_shorter(lv1_name)}/#{lv2_name}"}
                _ ->
                  {lv2_name, Helper.make_lv2_name_shorter(lv2_name)}
              end
            lv2_code = lv2_item["code"]

            {lv3_items, lv3_4_items, lv4_items} =
              Enum.reduce(lv2_item["children"], {[], [], []}, fn item, {lv3_acc, lv3_4_acc, lv4_acc} ->
                lv3_name = item["name"]
                lv3_code = item["code"]

                lv4_items =
                  Enum.map(item["children"], fn item ->
                    ~s{%\{"name" => "#{item["name"]}", "code" => "#{item["code"]}"\}}
                  end)

                {
                  [~s{%\{"name" => "#{lv3_name}", "code" => "#{lv3_code}"\}} | lv3_acc],
                  [
                    %{
                      "lv3_name" => lv3_name,
                      "lv3_code" => lv3_code,
                      "lv4_items" => lv4_items
                    } | lv3_4_acc
                  ],
                  [item["children"] | lv4_acc],
                }
              end)

            {
              [
                ~s{%\{"name" => "#{lv2_name}", "code" => "#{lv2_code}"\}} | l2s
              ],
              [
                %{
                  "lv2_name" => lv2_name,
                  "lv2_code" => lv2_code,
                  "lv2_shorter_name" => lv2_shorter_name,
                  "lv3_items" => Enum.reverse(lv3_items)
                }
                | l2_3s
              ],
              [lv3_4_items | lv3_4s],
              [{lv2_code, lv4_items} | l4s]
            }
          end)

        {
          [
            %{
              "lv1_name" => lv1_name,
              "lv1_code" => lv1_code,
              "lv2_items" => Enum.reverse(lv2_items)
            } | pcs0
          ],
          [
            Enum.reverse(lv2_3_items) | cas0
          ],
          [
            {lv1_code, Enum.reverse(lv3_4_items)} | lv3_4_acc
          ],
          [
            lv4_items | lv4_acc
          ],
          [
            %{"name" => lv1_name, "code" => lv1_code} | lv1_items
          ],
          [
            lv1_name | lv1_names
          ],
          [
            Helper.make_lv1_name_shorter(lv1_name) | lv1_shorter_names
          ],
          [
            lv1_code | lv1_codes
          ]
        }
      end)

    source = "priv/templates/cad_gen/lv2d.ex"
    target = "lib/gen/lv2d.ex"

    file_content =
      source
      |> EEx.eval_file(context: %{
        #lv1_2_items: lv1lv2_items,
        lv2_3_items: List.flatten(lv2lv3_items) |> Enum.reverse(),
        #lv1_name_shorter: &Helper.make_lv1_name_shorter/1,
        #lv2_name_shorter: &Helper.make_lv2_name_shorter/1
      })
      |> Code.format_string!()

    Mix.Generator.create_file(target, file_content, [])

    source = "priv/templates/cad_gen/lv1s.ex"
    target = "lib/gen/lv1s.ex"
    file_content =
      source
      |> EEx.eval_file(context: %{
        lv1_items: Enum.reverse(lv1_items),
        lv1_2_items: lv1lv2_items,
        lv1_name_shorter: &Helper.make_lv1_name_shorter/1,
        #lv2_name_shorter: &Helper.make_lv2_name_shorter/1,
        group_set: {Enum.reverse(lv1_names), Enum.reverse(lv1_shorter_names), Enum.reverse(lv1_codes)}
      })
      |> Code.format_string!()

    Mix.Generator.create_file(target, file_content, [])


    source = "priv/templates/cad_gen/lv3x.submodule.ex"
    formatted_lv3lv4_items =
      for {key, items} <- lv3lv4_items do
        target = "lib/gen/lv3x/m#{key}.ex"

        items = List.flatten(items) |> Enum.reverse()

        file_content =
          source
          |> EEx.eval_file(context: %{
            items: items,
            module: "M#{key}"
          })
          |> Code.format_string!()

        Mix.Generator.create_file(target, file_content, [])
        {key, items}
      end

    source = "priv/templates/cad_gen/lv3x.part1.ex"
    target = "lib/gen/lv3x.part1.ex"
    file_content =
      source
      |> EEx.eval_file(context: %{
        lv3_4_items: formatted_lv3lv4_items,
      })
      |> Code.format_string!()

    Mix.Generator.create_file(target, file_content, [])

    source = "priv/templates/cad_gen/lv3x.part2.ex"
    target = "lib/gen/lv3x.part2.ex"
    lv3_4_to_part2 = Enum.map(formatted_lv3lv4_items, fn {key, items} ->
      {
        key,
        Enum.reduce(items, [], fn i, acc ->
          [i["lv3_name"] | acc]
        end)
      }
    end)
    file_content =
      source
      |> EEx.eval_file(context: %{
        kv_items: lv3_4_to_part2
      })
      |> Code.format_string!()

    Mix.Generator.create_file(target, file_content, [])

    source = "priv/templates/cad_gen/lv3x.ex"
    target = "lib/gen/lv3x.ex"
    file_content =
      source
      |> EEx.eval_file()
      |> Code.format_string!()

    Mix.Generator.create_file(target, file_content, [])

    lv4_items = List.flatten(lv4_items)
    source = "priv/templates/cad_gen/lv4xg.submodule.ex"
    for {key, items} <- lv4_items do
      target = "lib/gen/lv4xg/m#{key}.ex"
      file_content =
        source
        |> EEx.eval_file(context: %{
          items: List.flatten(items),
          module: "M#{key}"
        })
        |> Code.format_string!()
      Mix.Generator.create_file(target, file_content, [])
    end
  end
end
