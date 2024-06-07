defmodule ChinaAdminDivisions.Gen.Lv3x.<%= context.module %> do
  @moduledoc false
  # 县级/Sub
  
<%= for item <- context.items do %>
  def next(input) when input == "<%= item["lv3_name"] %>" or input == "<%= item["lv3_code"] %>", do: [<%= Enum.join(item["lv4_items"], ",") %>] <% end %>
  def next(_), do: nil

end
