# Run it with: elixir day_1_first.exs
# https://adventofcode.com/2018/day/1
defmodule Day1First do
  def run(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.reduce(0, fn (x, acc) -> String.to_integer(x) + acc end)
  end
end

ExUnit.start()

defmodule Day1FirstTest do
  use ExUnit.Case

  import Day1First

  test "frequency changes" do
    assert run("""
      -1
      +3
      -2
      +100
      """) == 100
    assert run("\n-1\n+3\n-2\n+100") == 100
    assert run("\n-1\n+3\n-2\n+100\n") == 100
  end
end
