defmodule PreProcess do
  def run(filepath) do
    File.read!(filepath)
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(&String.split(&1, " "))
    |> Enum.map(&Enum.map(&1, fn x -> String.to_integer(x) end))
  end
end
