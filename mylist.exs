# c "mylist.exs"
# docker run -it --rm -v $PWD:/app elixir iex app/mylist.exs

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
  defp _sum([head | tail], total), do: _sum(tail, head+total)

  def sum2([head | []]), do: head
  def sum2([head | tail]), do: head+sum2(tail)

  # MyList.reduce [1, 2, 3, 4], 0, &(&1+&2)
  def reduce([], value, _), do: value
  def reduce([head | tail], value, func) do
    reduce(tail, func.(head, value), func)
  end

  # MyList.mapsum [1, 2, 3], &(&1 * &1)
  def mapsum([], _), do: 0
  def mapsum([head | tail], func), do: func.(head)+mapsum(tail, func)

  def max([head | tail]), do: _max(tail, head)
  defp _max([], value), do: value
  defp _max([head | tail], value) do
    # _max(tail, head > value ? head : value)
    val = if head > value, do: head, else: value
    _max(tail, val)
  end

  # MyList.caesar 'ryvkve', 13
  # def caesar(list, n), do: map(list, &(&1 + n))
  def caesar(list, n) do
    map(list, fn (v) ->
      # a 97
      # z 122
      res = v + n
      if res > 122, do: res - 122 + 97 + 1, else: res
    end)
  end

  def span(from, to) when from == to, do: [from]
  def span(from, to) when from < to, do: [from | span(from+1, to)]
  def span(from, to) when from > to, do: [from | span(from-1, to)]

  # 2からnまでの素数のリストを返す
  # span 関数とリスト内包表記で書く
  # MyList.prime_num 30
  def prime_num(n) do
    # span(2, n) |> Enum.filter(fn x ->
    #   span(2, x) |> Enum.all?(fn y -> x == y || rem(x, y) != 0 end)
    # end)
    for x <- span(2, n), span(2, x) |> Enum.all?(fn y -> x == y || rem(x, y) != 0 end), do: x

    # Enum使わずはにできないかな?
    # for x <- span(2, n), y <- span(2, x), x > y, rem(x, y) != 0, do: {x, y}
    # for x <- span(2, n) do
    #   # for y <- span(2, x), x > y, rem(x, y) != 0, do: {x, y}
    #   for y <- span(2, x), x == y || rem(x, y) != 0, do: x
    # end
  end

  # MyList.flatten [1, [2, 3, [4]], 5, [[[6]]]]
  def flatten(list), do: _flatten(list, []) |> Enum.reverse
  defp _flatten([], acc), do: acc
  defp _flatten([head | tail], acc), do: _flatten(tail, _flatten(head, []) ++ acc)
  defp _flatten(val, acc), do: [val | acc]
end
