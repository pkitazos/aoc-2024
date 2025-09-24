defmodule PreProcess do
  def run(filepath) do
    File.read!(filepath)
    |> String.trim()

    # |> String.split("\n")
    # |> String.join("")
  end
end
