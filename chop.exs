# c "chop.exs"
# Chop.guess(273, 1..1000)

defmodule Chop do
  def guess(actual, min..max) do
    check(actual, min, max)
  end

  defp check(actual, min, max) do
    middle = div(max - min, 2) + min
    IO.puts "Is it #{middle}"
    helper(actual, min..max, middle)
  end

  defp helper(actual, _range, guess) when actual === guess do
    IO.puts "#{guess}"
  end

  defp helper(actual, min.._max, guess) when actual < guess do
    max = guess - 1
    check(actual, min, max)
  end

  defp helper(actual, _min..max, guess) when actual > guess do
    min = guess + 1
    check(actual, min, max)
  end
end
