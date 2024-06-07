defmodule ChinaAdminDivisions.Gen.Lv3x do
  @moduledoc false
  # 县级
  #
  alias __MODULE__.{Part1, Part2}

  defdelegate code(input), to: Part1
  defdelegate name(input), to: Part1

  defdelegate next(input), to: Part2
end
