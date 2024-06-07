defmodule ChinaAdminDivisions.Gen.Lv3x.Part2 do
  @moduledoc false
  # 县级

<%= for {key, items} <- context.kv_items do %>
  def next(input) when input in <%= Jason.encode!(items) %>, do: ChinaAdminDivisions.Gen.Lv3x.M<%= key %>.next(input) <% end %>
end
