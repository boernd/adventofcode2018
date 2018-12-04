# Run it with: elixir day_2_first.exs
# https://adventofcode.com/2018/day/2
defmodule Day2First do
  def run(input) do
    map = input
          |> String.split("\n", trim: true)
          |> Enum.map(fn x -> String.graphemes(x) end)
          |> Enum.map(fn x -> Enum.sort(x) end)
          |> Enum.map(fn x -> Enum.chunk_by(x, fn x -> x end) end)
          |> Enum.map(fn x -> Enum.map(x, fn x -> length(x) end) end)
          |> Enum.map(fn x -> Enum.uniq(x) end)
          |> Enum.flat_map(fn x -> x end)
          |> Enum.reduce(%{two: 0, three: 0}, fn x, %{two: cnt2, three: cnt3} = map ->
            case x do
              2 -> Map.put(map, :two, cnt2 + 1)
              3 -> Map.put(map, :three, cnt3 + 1)
              _ -> map
            end
          end)

      map.two * map.three
  end
end

ExUnit.start()

defmodule Day2FirstTest do
  use ExUnit.Case

  import Day2First

  test "checksum" do
    assert run("""
      abcdef
      bababc
      abbcde
      abcccd
      aabcdd
      abcdee
      ababab
      """) == 12
  end
end
