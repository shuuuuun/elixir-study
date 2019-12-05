#!/usr/bin/env elixir

dict_stream = File.stream!("dict.txt")
{:ok, word_list} = File.read("word_list.txt")
word_list = word_list |> String.split

# dict_stream
#   |> Stream.with_index
#   |> Stream.map(fn {line, i} -> "#{i}: #{line}" end)
#   |> Enum.take(3)
#   |> IO.inspect

dict_stream
  |> Stream.map(fn line ->
      target = line |> String.trim;
      # IO.inspect {word_list, line, target};
      exact_match = Enum.any?(word_list, fn word -> target == word end);
      partial_match = Enum.any?(word_list, fn word -> String.contains?(target, word) end);
      # [exact_match, partial_match].map(&to_string/1).join(", ")
      [exact_match, partial_match] |> Enum.map(&to_string/1) |> Enum.join(", ")
    end)
  # |> Stream.map(&to_string/1)
  # |> Stream.map(&(&1 <> "\n"))
  |> Stream.map(&IO.puts/1)
  # |> Stream.into(File.stream!("temp-ex.csv"))
  |> Stream.run
