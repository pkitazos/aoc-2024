defmodule Part1 do
  def solve(data) do
    ~r/mul\((\d+),(\d+)\)/
    |> Regex.scan(data, capture: :all_but_first)
    |> Enum.map(fn [a, b] ->
      with n1 <- String.to_integer(a),
           n2 <- String.to_integer(b) do
        n1 * n2
      end
    end)
    |> Enum.sum()
  end
end
