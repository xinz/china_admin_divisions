defmodule ChinaAdminDivisions.Gen.Lv4xg.<%= context.module %> do
  @moduledoc false

<%= for item <- context.items do %>
  def name("<%= item["code"] %>"), do: "<%= item["name"] %>"<% end %>
  def name(_unknown), do: nil

end
