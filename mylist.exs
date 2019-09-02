# c "mylist.exs"

defmodule MyList do
  # MyList.len [1,2,3,1,1,1]
  def len([]), do: 0
  def len([_head | tail]), do: 1 + len(tail)

  # MyList.square [1, 2, 3, 9]
  def square([]), do: []
  def square([head | tail]), do: [ head*head | square(tail)]

  # MyList.add_1 [1, 2, 3, 9]
  def add_1([]), do: []
  def add_1([head | tail]), do: [ head+1 | add_1(tail)]

  # MyList.map [1, 2, 3, 9], fn (n) -> n*n end
  # MyList.map [1, 2, 3, 9], fn (n) -> n+1 end
  # MyList.map [1, 2, 3, 9], &(&1 + 1)
  def map([], _func), do: []
  def map([head | tail], func), do: [ func.(head) | map(tail, func)]

  # MyList.sum [1, 2, 3, 9]
  def sum(list), do: _sum(list, 0)
  defp _sum([], total), do: total
  defp _sum([head, tail], total), do: _sum(tail, head+total)

  def sum2([head, []]), do: head
  def sum2([head, tail]), do: head+sum2(tail)
end
