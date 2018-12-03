# Run it with: elixir day_1_second.exs
# https://adventofcode.com/2018/day/1
defmodule Day1Second do
  def run(input) do
    input
    |> String.split("\n", trim: true)
    |> Stream.cycle()
    |> Enum.reduce_while({0, []}, fn x, {current_frequency, seen_frequencies} ->
      new_frequency = current_frequency + String.to_integer(x)
      if new_frequency in seen_frequencies do
        {:halt, new_frequency}
      else
        {:cont, {new_frequency, [new_frequency | seen_frequencies]}}
      end
    end)
  end
end

ExUnit.start()

defmodule Day1SecondTest do
  use ExUnit.Case

  import Day1Second

  test "first frequency seen twice" do
    assert run("""
      +7
      +7
      -2
      -7
      -4
      """) == 14
  end
end
