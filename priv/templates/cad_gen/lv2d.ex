defmodule ChinaAdminDivisions.Gen.Lv2d do
  @moduledoc false
  # 地级

<%= for item <- context.lv2_items do %>
  def code(name)
  when name == "<%= item["name"] %>" <%= if not String.contains?(item["name"], "/") do %>or name == "<%= context.lv2_name_shorter.(item["name"]) %>" <% end %>, do:
  "<%= item["code"] %>"<% end %>
  def code(_unknown), do: nil

<%= for item <- context.lv2_items do %>
  def name("<%= item["code"] %>"), do: "<%= item["name"] %>"<% end %>
  def name(_unknown), do: nil

<%= for item <- context.lv2_items do %>
  def next(input) when input == "<%= item["name"] %>" or input == "<%= item["code"] %>", do: [<%= Enum.join(Enum.reverse(item["subitems"]), ",") %>]<% end %>
  def next(_unknown), do: nil
end
