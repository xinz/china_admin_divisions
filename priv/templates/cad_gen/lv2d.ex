defmodule ChinaAdminDivisions.Gen.Lv2d do
  @moduledoc false
  # 地级

<%= for item <- context.lv2_3_items do %>
  def code(name)
  when name == "<%= item["lv2_name"] %>" <%= if not String.contains?(item["lv2_name"], "/") do %>or name == "<%= item["lv2_shorter_name"] %>" <% end %>, do:
  "<%= item["lv2_code"] %>"<% end %>
  def code(_unknown), do: nil

<%= for item <- context.lv2_3_items do %>
  def name("<%= item["lv2_code"] %>"), do: {"<%= item["lv2_name"] %>", "<%= item["lv2_shorter_name"] %>"}<% end %>
  def name(_unknown), do: nil

<%= for item <- context.lv2_3_items do %>
  def next(input) when input == "<%= item["lv2_name"] %>" or input == "<%= item["lv2_shorter_name"] %>" or input == "<%= item["lv2_code"] %>", do: [<%= Enum.join(item["lv3_items"], ",") %>]<% end %>
  def next(_unknown), do: nil
end
