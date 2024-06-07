defmodule Mix.Tasks.Cad.Gen.Lv1 do
  use Mix.Task

  @repo_dir "Administrative-divisions-of-China/dist"
  @priv_path :code.priv_dir(:china_admin_divisions)
  @repo_dist_path Path.absname(@repo_dir, @priv_path)

  alias ChinaAdminDivisions.Helper

  def run(_args) do
    generate()
  end

  defp load_data() do
    content = File.read!("#{@repo_dist_path}/provinces.json")
    Jason.decode!(content)
  end

  defp generate() do
    items = load_data()

    {names_group, shorter_names_group, codes_group} =
      Enum.reduce(items, {[], [], []}, fn p, {ns, ans, cs} ->
        name = p["name"]
        {[name | ns], [Helper.make_lv1_name_shorter(name) | ans],
          [p["code"] | cs]}
      end)

    source = "priv/templates/cad_gen/lv1s.ex"
    target = "lib/gen/lv1s.ex"

    file_content =
      source
      |> EEx.eval_file(context: %{
        items: items,
        name_shorter: &Helper.make_lv1_name_shorter/1,
        group_set: {Enum.reverse(names_group), Enum.reverse(shorter_names_group), Enum.reverse(codes_group)}
      })
      |> Code.format_string!()

    Mix.Generator.create_file(target, file_content, [])
  end

end
