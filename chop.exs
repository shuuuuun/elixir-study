defmodule Chop do
  def guess(actual, range) do
    min..max = range
    middle = div(max - min, 2)
    IO.puts "Is it #{middle}"
  end

  defp helper(actual, range, guess) do
  end
end
