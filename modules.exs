# Exercise - 1
defmodule Times do
  def double(n), do: n * 2

  def triple(n), do: n * 3

  def quadruple(n), do: double(double(n))
end

defmodule Factorial do
  def of(0), do: 1
  def of(n) when n > 0 do
    n * of(n-1)
  end
end

# Exercise - 4
defmodule Sum do
  def up_to(1), do: 1
  def up_to(n), do: n + up_to(n-1)
end

# Exercise - 5

defmodule GCD do
  def of(x, 0), do: x
  def of(x, y), do: of(y, rem(x, y))
end

# Exercise - 6

defmodule Chop do
  # 1 .. 1000
  # 1000 -1 = 999
  def guess(number, range), do: guess_it(halfway(range), number, range)

  def guess_it(guess, number, range) when guess == number do
    IO.puts guess_message(guess)
    guess
  end

  def guess_it(guess, number, first .. last) when guess > number do
    IO.puts guess_message(guess)

    new_range = first .. guess

    guess_it(halfway(new_range), number, new_range)
  end

  def guess_it(guess, number, first .. last) when guess < number do
    IO.puts guess_message(guess)

    new_range = guess .. last

    guess_it(halfway(new_range), number, new_range)
  end

  def guess_message(guess), do: "Is it #{guess}."

  def halfway(first .. last), do: first + div(last - first, 2)
end

# Exercise 7

IO.puts :erlang.float_to_list(7.5, [{:decimals, 4}, :compact])
IO.puts System.get_env()["PATH"]
IO.puts Path.extname("modules/test/lol.ppt")
System.cwd
System.cmd("ls")
