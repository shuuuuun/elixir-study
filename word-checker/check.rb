#!/usr/bin/env ruby

dict = File.read('dict.txt').split("\n")
word_list = File.read('word_list.txt').split("\n")

exact_match = dict.map do |line|
  word_list.any? do |word|
    line == word
  end
end

partial_match = dict.map do |line|
  word_list.any? do |word|
    line&.include? word
  end
end

result = {
  exact_match: {
    total: exact_match.count,
    true: exact_match.select{|v| v}.count,
    false: exact_match.select{|v| !v}.count,
  },
  partial_match: {
    total: partial_match.count,
    true: partial_match.select{|v| v}.count,
    false: partial_match.select{|v| !v}.count,
  }
}

puts result
