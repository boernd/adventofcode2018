# Run it with: elixir day_2_second.exs
# https://adventofcode.com/2018/day/2
defmodule Day2Second do
  def run(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(fn x -> String.codepoints(x) end)
    |> similiar_boxids
    |> Enum.reverse
    |> List.to_string
  end

  defp similiar_boxids([head | tail]) do
    Enum.find_value(tail, fn x -> close_to_one(x, head) end) ||
      similiar_boxids(tail)
  end

  defp close_to_one(list1, list2) do
    close_to_one(list1, list2, [], 0)
  end

  defp close_to_one([head | tail1], [head | tail2], acc, diffcnt) do
    close_to_one(tail1, tail2, [head | acc], diffcnt)
  end

  defp close_to_one([_ | tail1], [_ | tail2], acc, diffcnt) do
    close_to_one(tail1, tail2, acc, diffcnt + 1)
  end

  # Return truthy string in case of single diff
  defp close_to_one([], [], acc, 1) do
    acc
  end

  # Return falsy nil in case of no match
  defp close_to_one([], [], _, _) do
    nil
  end
end

ExUnit.start()

defmodule Day2SecondTest do
  use ExUnit.Case

  import Day2Second

  test "checksum" do
    assert run("""
      abcde
      fghij
      klmno
      pqrst
      fguij
      axcye
      wvxyz
      """) == "fgij"
  end
end
