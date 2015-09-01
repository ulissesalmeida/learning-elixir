# Exercises Functions - 1

list_concact = fn (list_1, list_2) -> list_1 ++ list_2 end

list_concact.([1, 2, 3], [4, 2])

sum = fn(a, b, c) -> a + b + c end

sum.(4, 6, 8)

pair_tuple_to_list = fn({a, b}) -> [a, b] end

pair_tuple_to_list.({4, 2})

# Exercises Functions - 2

_fizzbuzz = fn
  0, 0, _ -> "FizzBuzz"
  0, _, _ -> "Fizz"
  _, 0, _ -> "Buzz"
  _, _, c -> c
end

fizzbuzz = fn
  n -> _fizzbuzz.(rem(n, 3), rem(n, 5), n)
end

IO.puts "FizzBuzz of 11: #{fizzbuzz.(10)}"
IO.puts "FizzBuzz of 11: #{fizzbuzz.(11)}"
IO.puts "FizzBuzz of 12: #{fizzbuzz.(12)}"
IO.puts "FizzBuzz of 13: #{fizzbuzz.(13)}"
IO.puts "FizzBuzz of 14: #{fizzbuzz.(14)}"
IO.puts "FizzBuzz of 15: #{fizzbuzz.(15)}"
IO.puts "FizzBuzz of 16: #{fizzbuzz.(16)}"


# Exercise: Functions - 4
prefix = fn
  pref -> fn
    value -> "#{pref} #{value}"
  end
end

mrs = prefix.("Mrs")
IO.puts mrs.("Smith")
IO.puts prefix.("Elixir").("Rocks")

#Exercise: Functions - 5

Enum.map(Enum.map([1, 2, 3, 4], &(&1 + 2)), &IO.inspect/1)
