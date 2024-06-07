defmodule ChinaAdminDivisions.Gen.Lv1s do
  @moduledoc false
  # 省级

<%= for item <- context.lv1_items do %>
  def code(name) when name == "<%= item["name"] %>" or name == "<%= context.lv1_name_shorter.(item["name"]) %>", do: "<%= item["code"] %>"<% end %>
  def code(_unknown), do: nil

<%= for item <- context.lv1_items do %>
  def name("<%= item["code"] %>"), do: {"<%= item["name"] %>", "<%= context.lv1_name_shorter.(item["name"]) %>"}<% end %>
  def name(_unknown), do: nil

  <% {names, shorter_names, codes} = context.group_set %>
  def names(), do: <%= Jason.encode!(names) %>
  def shorter_names(), do: <%= Jason.encode!(shorter_names) %>
  def codes(), do: <%= Jason.encode!(codes) %>

<%= for item <- context.lv1_2_items do %>
  def next(input)
      when input == "<%= item["lv1_name"] %>"
      when input == "<%= context.lv1_name_shorter.(item["lv1_name"]) %>"
      when input == "<%= item["lv1_code"] %>", do: [<%= Enum.join(item["lv2_items"], ",") %>]<% end %>
  def next(_unknown), do: nil
end
