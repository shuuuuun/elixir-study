# c "chop.exs"
# Chop.guess(273, 1..1000)

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
    max = guess - 1
    middle = div(max - min, 2) + min
    IO.puts "Is it #{middle}"
    helper(actual, min..max, middle)
  end

  defp helper(actual, range, guess) when actual > guess do
    _min..max = range
    min = guess + 1
    middle = div(max - min, 2) + min
    IO.puts "Is it #{middle}"
    helper(actual, min..max, middle)
  end
end
