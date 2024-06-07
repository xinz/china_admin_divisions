defmodule ChinaAdminDivisions.Gen.Lv3x.Part1 do
  @moduledoc false
  # 县级

<%= for {_, items} <- context.lv3_4_items do %>
  <%= for item <- items do %>
  def code(name) when name == "<%= item["lv3_name"] %>", do: "<%= item["lv3_code"] %>"<% end %><% end %>
  def code(_unknown), do: nil

<%= for {_, items} <- context.lv3_4_items do %>
  <%= for item <- items do %>
  def name("<%= item["lv3_code"] %>"), do: "<%= item["lv3_name"] %>"<% end %><% end %>
  def name(_unknown), do: nil

end
