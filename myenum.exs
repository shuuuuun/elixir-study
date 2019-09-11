defmodule MyEnum do
  # MyEnum.all? [], &(&1 < 4)
  # MyEnum.all? [1, 2, 3], &(&1 < 4)
  # MyEnum.all? [1, 2, 3, 4, 5], &(&1 < 4)
  def all?([], _), do: true
  def all?([head | tail], func), do: func.(head) && all?(tail, func)

  # MyEnum.each [1, 2, 3, 4, 5], &(&1 * 10)
  def each(list, func), do: _each(list, [], func)
  defp _each([], acc, _), do: acc
  defp _each([head | tail], acc, func), do: _each(tail, acc ++ [func.(head)], func)

  # MyEnum.filter [1, 2, 3, 4, 5], &(&1 < 4)
  def filter(list, func), do: _filter(list, [], func)
  defp _filter([], acc, _), do: acc
  defp _filter([head | tail], acc, func) do
    if func.(head) do
      _filter(tail, acc ++ [head], func)
    else
      _filter(tail, acc, func)
    end
  end

  # MyEnum.split [1, 2, 3, 4, 5], 3
  def split(list, index), do: _split(list, index, [])
  defp _split([], _, acc), do: {acc, []}
  defp _split(list, 0, acc), do: {acc, list}
  defp _split([head | tail], num, acc), do: _split(tail, num-1, acc ++ [head])

  # MyEnum.take [1, 2, 3, 4, 5], 3
  def take(list, index), do: _take(list, index, [])
  defp _take([], _, acc), do: acc
  defp _take(_, 0, acc), do: acc
  defp _take([head | tail], num, acc), do: _take(tail, num-1, acc ++ [head])
end
