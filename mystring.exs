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
end
