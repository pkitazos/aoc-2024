defmodule PreProcess do
  def run(filepath) do
    File.read!(filepath)
    |> String.trim()
    |> String.split(["\n", "   "])
    |> Enum.map(&String.to_integer/1)
    |> Enum.chunk_every(2)
    |> Enum.map(&List.to_tuple/1)
    |> Enum.unzip()
    |> Tuple.to_list()
  end
end
