fizzbuzz = fn
  0, 0, _ -> "FizzBuzz"
  0, _, _ -> "Fizz"
  _, 0, _ -> "Buzz"
  _, _, n -> n
end

# IO.puts fizzbuzz.(0, 1, 2)
# IO.puts fizzbuzz.(1, 0, 1)
# IO.puts fizzbuzz.(1, 1, 1)
# IO.puts fizzbuzz.(0, 0, 1)


func2 = fn
  n -> fizzbuzz.(rem(n, 3), rem(n, 5), n)
end

IO.puts func2.(10)
IO.puts func2.(11)
IO.puts func2.(12)
IO.puts func2.(13)
IO.puts func2.(14)
IO.puts func2.(15)
IO.puts func2.(16)
IO.puts func2.(17)
