defmodule ChinaAdminDivisions.Gen.Lv3x.Part1 do
  @moduledoc false
  # 县级

<%= for {_, items} <- Map.to_list(context.lv3_items) do %>
  <%= for item <- items do %>
  def code(name) when name == "<%= item["name"] %>", do: "<%= item["code"] %>"<% end %><% end %>
  def code(_unknown), do: nil

<%= for {_, items} <- Map.to_list(context.lv3_items) do %>
  <%= for item <- items do %>
  def name("<%= item["code"] %>"), do: "<%= item["name"] %>"<% end %><% end %>
  def name(_unknown), do: nil

end
