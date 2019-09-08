defmodule MyEnum do
  # MyEnum.all? [], &(&1 < 4)
  # MyEnum.all? [1, 2, 3], &(&1 < 4)
  # MyEnum.all? [1, 2, 3, 4, 5], &(&1 < 4)
  def all?([], _), do: true
  def all?([head | tail], func), do: func.(head) && all?(tail, func)

  # MyEnum.each [1, 2, 3, 4, 5], &(&1 * 10)
  # MyEnum.filter [1, 2, 3, 4, 5], &(&1 < 4)
  # MyEnum.split [1, 2, 3, 4, 5], 3
  # MyEnum.take [1, 2, 3, 4, 5]. 3
end
