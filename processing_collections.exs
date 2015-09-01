defmodule MyEnum do
  # Exercise 5
  def all?([], _), do: true
  def all?([head | tail], func), do: _all?(tail, func, func.(head))
  defp _all?([a], func, previous), do: previous and func.(a)
  defp _all?([head | tail], func, previous), do: previous and _all?(tail, func, func.(head))
  defp _all?([], func, previous), do: previous and true

  def each([], _), do: []
  def each([head | tail], func) do
    func.(head)
    [head | each(tail, func)]
  end

  def filter([], _), do: []
  def filter([head | tail], func) do
    if func.(head) do
      [head | filter(tail, func)]
    else
      filter(tail, func)
    end
  end

  # split from Suraj Kurapati
  def split(collection, count) when count < 0 do
    split(collection, max(0, length(collection) + count))
  end
  def split(collection, 0), do: { [], collection }
  def split([head|tail], count) do
    { left, right } = split(tail, count - 1)
    { [head|left], right }
  end
  def split([], _count), do: { [], [] }

  def take([], _count), do: []
  def take(list, count) when count >= 0 do
    {left, _right} = split(list, count)
    left
  end
  def take(list, count) when count < 0 do
    {_left, right} = split(list, count)
    right
  end

  # Exercise 6
  def flatten([]), do: []
  def flatten([head | tail]) when is_list(head) do
    flatten(head ++ tail)
  end
  def flatten([head | tail]), do: [head | flatten(tail)]

  # Exercise 7
  def span(to, to), do: [to]
  def span(from, to) when from < to do
    [from | span(from + 1, to)]
  end
  def span(from, to) when from > to do
    [from | span(from - 1, to)]
  end

  def primes(n) do
    is_prime = fn
      x ->
        nums = for y <- span(1, round(:math.sqrt(x))), y > 1, do: y
        all? nums, &(rem(x, &1) != 0)
    end

    for x <- span(2, n), is_prime.(x), do: x
  end
end

# Exercise 8
defmodule TaxCalculator do
  def orders do
    [
      [ id: 123, ship_to: :NC, net_amount: 100.00 ],
      [ id: 124, ship_to: :OK, net_amount:  35.50 ],
      [ id: 125, ship_to: :TX, net_amount:  24.00 ],
      [ id: 126, ship_to: :TX, net_amount:  44.80 ],
      [ id: 127, ship_to: :NC, net_amount:  25.00 ],
      [ id: 128, ship_to: :MA, net_amount:  10.00 ],
      [ id: 129, ship_to: :CA, net_amount: 102.00 ],
      [ id: 120, ship_to: :NC, net_amount:  50.00 ] ]
  end

  def rates do
    [ NC: 0.075, TX: 0.08 ]
  end

  def calculate(orders, rates) do
    orders
      |> Enum.map fn (order) -> create_amount(order, rates) end
  end

  defp create_amount(order = [id: _, ship_to: state, net_amount: amount ], rates) do
    tax_rate = Keyword.get(rates, state, 0)
    tax_amount = tax_rate * amount
    total_amount = amount + tax_amount

    Keyword.put(order, :total_amount, total_amount)
  end
end
