defmodule MyString do
  @ascii_range ?\s..?~
  def printable?(str) when is_binary(str), do: true
  def printable?(list) when is_list(list), do: Enum.all?(list, &(Enum.member?(@ascii_range, &1)))
  def printable?(_), do: false
end
