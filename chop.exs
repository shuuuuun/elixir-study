defmodule Chop do
  def guess(actual, range) do
    min..max = range
    middle = div(max - min, 2) + min
    IO.puts "Is it #{middle}"
    helper(actual, range, middle)
  end

  defp helper(actual, range, guess) when actual === guess do
    IO.puts "#{guess}"
  end

  defp helper(actual, range, guess) when actual < guess do
    min..max = range
    middle = div(actual - min, 2) + min
    IO.puts "Is it #{middle}"
    helper(actual, range, middle)
  end

  defp helper(actual, range, guess) when actual > guess do
    min..max = range
    middle = div(max - actual, 2) + actual
    IO.puts "Is it #{middle}"
    helper(actual, range, middle)
  end
end
