# Run it with: elixir day_3_second.exs
# https://adventofcode.com/2018/day/3
defmodule Day3Second do
  def run(input) do
    claims = input
             |> String.split("\n", trim: true)
             |> Enum.map(&parse_claim/1)

    [id, _, _, _, _] = non_overlapping_claim(claims)
    id
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

  defp non_overlapping_claim(parsed_claims) do
    overlaps = overlapping_inches(parsed_claims)

    Enum.find(parsed_claims, fn [id, left, top, width, height] ->
      Enum.all?((left + 1)..(left + width), fn l ->
        Enum.all?((top + 1)..(top + height), fn t ->
          Map.get(overlaps, {l, t}) == [id]
        end)
      end)
    end)
  end
end

ExUnit.start()

defmodule Day3SecondTest do
  use ExUnit.Case

  import Day3Second

  test "non overlapping claim" do
    assert run("""
      #1 @ 1,3: 4x4
      #2 @ 3,1: 4x4
      #3 @ 5,5: 2x2
      """) == 3
  end
end

