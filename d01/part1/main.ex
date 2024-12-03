defmodule Part1 do
  def solve(data) do
    data
    |> Enum.map(&Enum.sort/1)
    |> Enum.zip_reduce(0, fn [a, b], acc ->
      acc + abs(a - b)
    end)
  end
end
