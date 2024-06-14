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

  def generate() do
    {lv1, lv2, lv3, lv4} = read_pca_code() |> loop_items(1)

    # lv1
    source = "priv/templates/cad_gen/lv1s.ex"
    target = "lib/gen/lv1s.ex"
    lv1_items_literal =
      Enum.map(lv1, fn item ->
        ~s{%\{"name" => "#{item["name"]}", "code" => "#{item["code"]}"\}}
      end)
    file_content =
      source
      |> EEx.eval_file(context: %{
        lv1_items: lv1,
        lv1_str_items: lv1_items_literal,
        lv1_name_shorter: &Helper.make_lv1_name_shorter/1
      })
      |> Code.format_string!()

    Mix.Generator.create_file(target, file_content, [])

    # lv2
    source = "priv/templates/cad_gen/lv2d.ex"
    target = "lib/gen/lv2d.ex"

    file_content =
      source
      |> EEx.eval_file(context: %{
        lv2_items: lv2,
        lv2_name_shorter: &Helper.make_lv2_name_shorter/1
      })
      |> Code.format_string!()

    Mix.Generator.create_file(target, file_content, [])

    # lv3
    source = "priv/templates/cad_gen/lv3x.submodule.ex"
    lv3_kv_items =
    for {key, items} <- Map.to_list(lv3) do
      #IO.puts "key:#{key}"
      #IO.inspect items
      target = "lib/gen/lv3x/m#{key}.ex"

      file_content =
        source
        |> EEx.eval_file(context: %{
          items: items,
          module: "M#{key}"
        })
        |> Code.format_string!()

      Mix.Generator.create_file(target, file_content, [])

      {
        key,
        Enum.reduce(items, [], fn i, acc ->
          [i["name"] | acc]
        end)
      }
    end

    source = "priv/templates/cad_gen/lv3x.part1.ex"
    target = "lib/gen/lv3x.part1.ex"
    file_content =
      source
      |> EEx.eval_file(context: %{
        lv3_items: lv3,
      })
      |> Code.format_string!()

    Mix.Generator.create_file(target, file_content, [])

    source = "priv/templates/cad_gen/lv3x.part2.ex"
    target = "lib/gen/lv3x.part2.ex"
    file_content =
      source
      |> EEx.eval_file(context: %{
        kv_items: lv3_kv_items
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

    # lv4
    source = "priv/templates/cad_gen/lv4xg.submodule.ex"
    for {key, items} <- Map.to_list(lv4) do
      target = "lib/gen/lv4xg/m#{key}.ex"
      file_content =
        source
        |> EEx.eval_file(context: %{
          items: items,
          module: "M#{key}"
        })
        |> Code.format_string!()
      Mix.Generator.create_file(target, file_content, [])
    end
  end
   
  # {
  #   [
  #     %{"code" => "1", "name" => "name", "subitems" => [~s%{...}, ~s%{...}]}
  #   ],
  #   [
  #     %{"code" => "2", "name" => "name", "subitems" => [~s{}, ~s{}]}
  #   ],
  #   [
  #     %{"code" => "3", "name" => "name", "subitems" => [~s{}, ~s{}], #dynamic_lv1_name}
  #   ],
  #   [
  #     %{"code" => "4", "name" => "name", #dynamic_lv2_name}
  #   ]
  # }
  #
  def loop_items(items, index, acc \\ {[], [], %{}, %{}}) do
    do_loop_items(items, acc, index)
  end

  defp do_loop_items([], {l1, l2, l3, l4}, 1) do
    {l1, l2, l3, l4}
  end
  defp do_loop_items([], {parent_subitems, {l1, l2, l3, l4}, _parent_item}, 2) do
    {parent_subitems, {l1, l2, l3, l4}}
  end
  defp do_loop_items([], {parent_subitems, {l1, l2, l3, l4}}, 3) do
    {parent_subitems, {l1, l2, l3, l4}}
  end
  defp do_loop_items([], {parent_subitems, {l1, l2, l3, l4}}, 4) do
    {parent_subitems, {l1, l2, l3, l4}}
  end
  defp do_loop_items([item | rest], {l1, l2, l3, l4}, 1) do
    children = item["children"] || []
    {subitems, {l1, l2, l3, l4}} = loop_items(children, 2, {[], {l1, l2, l3, l4}, item})
    do_loop_items(rest, {[ %{"code"=> item["code"], "name" => item["name"], "subitems" => subitems} | l1], l2, l3, l4}, 1)
  end
  defp do_loop_items([item | rest], {acc, {l1, l2, l3, l4}, parent_item}, 2) do
    item_name = item["name"]
    item_name = if Helper.lv2_name_can_skip_to_next?(item_name), do: "#{parent_item["name"]}/#{item_name}", else: item_name
    p_subitem = ~s{%\{"name" => "#{item_name}", "code" => "#{item["code"]}"\}}
    children = item["children"] || []
    {subitems, {l1, l2, l3, l4}} = loop_items(children, 3, {[], {l1, l2, l3, l4}})
    do_loop_items(rest, {[p_subitem | acc], {l1, [%{"code" => item["code"], "name" => item_name, "subitems" => subitems} | l2], l3, l4}, parent_item}, 2)
  end
  defp do_loop_items([item | rest], {acc, {l1, l2, l3, l4}}, 3) do
    item_code = item["code"]
    p_subitem = ~s{%\{"name" => "#{item["name"]}", "code" => "#{item_code}"\}}
    children = item["children"] || []
    {subitems, {l1, l2, l3, l4}} = loop_items(children, 4, {[], {l1, l2, l3, l4}})
    lv1_item_code = String.slice(item_code, 0..1)
    new_item = %{"name" => item["name"], "code" => item_code, "subitems" => subitems}
    l3 = Map.update(l3, lv1_item_code, [new_item], fn existed -> [new_item | existed] end)
    do_loop_items(rest, {[p_subitem | acc], {l1, l2, l3, l4}}, 3)
  end
  defp do_loop_items([item | rest], {acc, {l1, l2, l3, l4}}, 4) do
    item_code = String.pad_trailing(item["code"], 12, "0")
    p_subitem = ~s{%\{"name" => "#{item["name"]}", "code" => "#{item_code}"\}}
    lv2_item_code = String.slice(item_code, 0..3)
    new_item = %{"name" => item["name"] , "code" => item_code}
    l4 = Map.update(l4, lv2_item_code, [new_item], fn existed -> [new_item | existed] end)
    do_loop_items(rest, {[p_subitem | acc], {l1, l2, l3, l4}}, 4)
  end

end
