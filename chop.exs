# c "chop.exs"
# Chop.guess(273, 1..1000)

defmodule Chop do
  def guess(actual, min..max) do
    middle = div(max - min, 2) + min
    IO.puts "Is it #{middle}"
    check(actual, min..max, middle)
  end

  defp check(actual, _range, value) when actual === value do
    IO.puts "#{value}"
  end

  defp check(actual, min.._max, value) when actual < value do
    max = value - 1
    guess(actual, min..max)
  end

  defp check(actual, _min..max, value) when actual > value do
    min = value + 1
    guess(actual, min..max)
  end
end
