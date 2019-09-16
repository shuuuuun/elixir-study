defmodule MyString do
  @ascii_range ?\s..?~
  def printable?(str) when is_binary(str), do: true
  def printable?(list) when is_list(list), do: Enum.all?(list, &(Enum.member?(@ascii_range, &1)))
  def printable?(_), do: false

  def anagram?(word1, word2) when is_binary(word1) and is_binary(word2) do
    anagram?(String.to_charlist(word1), String.to_charlist(word2))
  end
  def anagram?(word1, word2) when is_list(word1) and is_list(word2) do
    Enum.sort(word1) == Enum.sort(word2)
  end

  # MyString.calculate('123 + 27') => 150
  def calculate(str) do
    # String.split(str)
    str
    |> Enum.chunk_by(&(&1 == ?\s))
    |> Enum.reject(&(&1 == ' '))
    # TODO: wip calculate
  end
end

defmodule Parse do
  def number([ ?- | tail ]), do: _number_digits(tail, 0) * -1
  def number([ ?+ | tail ]), do: _number_digits(tail, 0)
  def number(str), do: _number_digits(str, 0)

  defp _number_digits([], value), do: value
  defp _number_digits([digit | tail], value)
  when digit in '0123456789' do
    _number_digits(tail, value*10 + digit - ?0)
  end
  defp _number_digits([non_digit | _], _) do
    raise "Invalid digit '#{[non_digit]}'"
  end
end
