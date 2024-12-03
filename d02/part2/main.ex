defmodule Part2 do
  def solve([]), do: 0

  def solve([head | tail]) do
    cond do
      is_safe(head) -> 1 + solve(tail)
      is_sorta_safe(head) -> 1 + solve(tail)
      true -> solve(tail)
    end
  end

  defp is_sorta_safe(row) do
    count =
      sub_lists(row)
      |> Enum.filter(&is_safe/1)
      |> Enum.count()

    count > 0
  end

  defp is_safe(list) do
    cond do
      is_ascending(list) and all_gradual(list) -> true
      is_descending(list) and all_gradual(list) -> true
      true -> false
    end
  end

  defp sub_lists([]), do: []
  defp sub_lists([_]), do: []

  defp sub_lists(list) do
    0..(length(list) - 1)
    |> Enum.map(fn skip_idx ->
      list
      |> Enum.with_index()
      |> Enum.filter(fn {_, idx} -> idx != skip_idx end)
      |> Enum.map(fn {elem, _} -> elem end)
    end)
  end

  defp dir(a, b) when a < b, do: :asc
  defp dir(a, b) when a > b, do: :desc
  defp dir(a, b), do: nil

  defp is_ascending(list), do: Enum.sort(list) == list
  defp is_descending(list), do: Enum.sort(list, :desc) == list

  defp all_gradual([]), do: true
  defp all_gradual([_]), do: true

  defp all_gradual([a, b | rest]) do
    is_gradual(a - b) && all_gradual([b | rest])
  end

  defp is_gradual(x), do: abs(x) |> in_range

  defp in_range(x), do: x >= 1 && x <= 3
end
