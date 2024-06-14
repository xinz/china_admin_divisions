defmodule ChinaAdminDivisions.Gen.Lv1s do
  @moduledoc false
  # 省级

<%= for item <- context.lv1_items do %>
  def code(name) when name == "<%= item["name"] %>" or name == "<%= context.lv1_name_shorter.(item["name"]) %>", do: "<%= item["code"] %>"<% end %>
  def code(_unknown), do: nil

<%= for item <- context.lv1_items do %>
  def name("<%= item["code"] %>"), do: "<%= item["name"] %>"<% end %>
  def name(_unknown), do: nil

  def items(), do: [<%= Enum.join(Enum.reverse(context.lv1_str_items), ",") %>]

<%= for item <- context.lv1_items do %>
  def next(input)
      when input == "<%= item["name"] %>"
      when input == "<%= context.lv1_name_shorter.(item["name"]) %>"
      when input == "<%= item["code"] %>", do: [<%= Enum.join(Enum.reverse(item["subitems"]), ",") %>]<% end %>
  def next(_unknown), do: nil
end
