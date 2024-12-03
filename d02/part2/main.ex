defmodule Part2 do
  def test() do
    IO.inspect(solve([7, 6, 4, 2, 1]))
    # IO.inspect(solve([1, 2, 7, 8, 9]))
    # IO.inspect(solve([9, 7, 6, 2, 1]))
    # IO.inspect(solve([1, 3, 2, 4, 5]))
    # IO.inspect(solve([8, 6, 4, 4, 1]))
    # IO.inspect(solve([1, 3, 6, 7, 9]))
    :ok
  end

  def solve([a, b, c | rest]) do
    opts = if a - b > 0, do: [:asc], else: [:desc]

    if is_gradual(a - b) do
      solve([b, c | rest], opts, 0)
    else
      solve([c | rest], opts, 1)
    end
  end

  def solve([], _, _), do: 0
  def solve(_, _, 2), do: 0

  def solve([a, b], [:asc], _skip_count) do
    if is_gradual(a - b) and b > a, do: 1, else: 0
  end

  def solve([a, b], [:desc], _skip_count) do
    if is_gradual(a - b) and b < a, do: 1, else: 0
  end

  def solve([a, b, c | rest], [:asc], skip_count) do
    if a - b > 0, do: 0

    case is_gradual(a - b) do
      true -> is_ascending([a, b]) && solve([b, c | rest], [:asc], skip_count)
      false -> is_ascending([a, c]) && solve([b, c | rest], [:asc], skip_count + 1)
    end
  end

  def solve([a, b, c | rest], [:desc], skip_count) do
    if b - a > 0, do: 0

    case is_gradual(a - b) do
      true -> is_descending([a, b]) && solve([b, c | rest], [:desc], skip_count)
      false -> is_descending([a, c]) && solve([b, c | rest], [:desc], skip_count + 1)
    end
  end

  defp is_ascending(list), do: Enum.sort(list) == list

  defp is_descending(list), do: Enum.sort(list, :desc) == list

  defp is_gradual(x), do: abs(x) |> in_range

  defp in_range(x), do: x >= 1 && x <= 3
end
