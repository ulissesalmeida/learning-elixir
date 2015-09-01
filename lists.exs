defmodule MyList do
  # Exercise - 0
  def sum([]), do: 0
  def sum([head | []]), do: head
  def sum([head | tail]), do: head + sum(tail)

  # Exercise - 1
  def map([], _fun), do: []
  def map([head | tail], fun), do: [fun.(head) | map(tail, fun)]

  def mapsum(list, fun), do: list |> map(fun) |> sum

  # Exercise - 2

  def reduce([], value, _fun), do: value
  def reduce([head | tail], value, fun), do: reduce(tail, fun.(head, value),  fun)

  def max([head | tail]) do
    max = fn(a, b) ->
      cond do
        a > b -> a
        b >= a -> b
      end
    end
    reduce(tail, head, max)
  end

  # Exercise - 3

  def caesar(list, n) do
    add_n = &(&1 + n)
    keep_characters = fn(value, list) ->
      cond do
        value <= 122 -> list ++ [value]
        value > 122 -> list
      end
    end

    list |> map(add_n) |> reduce([], keep_characters)
  end

  # Exercise - 4

  def span(to, to), do: [to]
  def span(from, to), do: [from | span(from + 1, to)]
end
