defmodule Part2 do
  def solve([left, right]) do
    counts = Enum.frequencies(right)
    Enum.reduce(left, 0, fn x, acc -> acc + x * Map.get(counts, x, 0) end)
  end
end
