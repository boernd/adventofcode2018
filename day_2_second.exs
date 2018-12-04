# Run it with: elixir day_2_second.exs
# https://adventofcode.com/2018/day/2
defmodule Day2Second do
  def run(input) do
    map = input
          |> String.split("\n", trim: true)

    #Implement me!
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
