defmodule ChinaAdminDivisions.Gen.Lv3x.<%= context.module %> do
  @moduledoc false
  # 县级/Sub
  
<%= for item <- context.items do %>
  def next(input) when input == "<%= item["name"] %>" or input == "<%= item["code"] %>", do: [<%= Enum.join(Enum.reverse(item["subitems"]), ",") %>] <% end %>
  def next(_), do: nil

end
