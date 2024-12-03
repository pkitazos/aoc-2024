defmodule Part1 do
  def solve([]), do: 0
  def solve([head | tail]), do: is_safe(head) + solve(tail)

  defp is_safe(list) do
    cond do
      is_ascending(list) and all_gradual_change(list) -> 1
      is_descending(list) and all_gradual_change(list) -> 1
      true -> 0
    end
  end

  defp is_ascending(list), do: Enum.sort(list) == list

  defp is_descending(list), do: Enum.sort(list, :desc) == list

  defp all_gradual_change([]), do: true
  defp all_gradual_change([_]), do: true

  defp all_gradual_change([a, b | rest]) do
    1 <= abs(a - b) and abs(a - b) <= 3 && all_gradual_change([b | rest])
  end
end
