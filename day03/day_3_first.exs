# Run it with: elixir day_3_first.exs
# https://adventofcode.com/2018/day/3
defmodule Day3First do
  def run(input) do
    overlaps = input
               |> String.split("\n", trim: true)
               |> Enum.map(&parse_claim/1)
               |> overlapping_inches()

    cords = for {key, val} <- overlaps, length(val) > 1, do: key
    length(cords)
  end

  defp parse_claim(claim) do
    claim
    |> String.split(["#", " @ ", ",", ": ", "x"], trim: true)
    |> Enum.map(&String.to_integer/1)
  end

  defp overlapping_inches(parsed_claims) do
    Enum.reduce(parsed_claims, %{}, fn [id, left, top, width, height], acc ->
      Enum.reduce((left + 1)..(left + width), acc, fn l, acc ->
        Enum.reduce((top + 1)..(top + height), acc, fn t, acc ->
          Map.update(acc, {l, t}, [id], fn x -> [id | x] end)
        end)
      end)
    end)
  end
end

ExUnit.start()

defmodule Day3FirstTest do
  use ExUnit.Case

  import Day3First

  test "overlapping inches" do
    assert run("""
      #1 @ 1,3: 4x4
      #2 @ 3,1: 4x4
      #3 @ 5,5: 2x2
      """) == 4
  end
end

