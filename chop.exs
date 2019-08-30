defmodule Chop do
  def guess(actual, range) do
    min..max = range
    middle = div(max - min, 2) + min
    IO.puts "Is it #{middle}"
    helper(actual, range, middle)
  end

  defp helper(actual, _range, guess) when actual === guess do
    IO.puts "#{guess}"
  end

  defp helper(actual, range, guess) when actual < guess do
    min.._max = range
    middle = div((guess - 1) - min, 2) + min
    IO.puts "Is it #{middle}"
    helper(actual, min..guess, middle)
  end

  defp helper(actual, range, guess) when actual > guess do
    _min..max = range
    middle = div(max - (guess + 1), 2) + guess
    IO.puts "Is it #{middle}"
    helper(actual, guess..max, middle)
  end
end
