defmodule Factorial do
  def of(0), do: 1
  def of(n), do: n * of(n - 1)

  def t_of(n), do: _t_of(n, 1)
  def _t_of(0, acc), do: acc
  def _t_of(n, acc), do: _t_of(n - 1, n * acc)
end
