defmodule StringFun do
  # Exercise 1
  def ascii?(str) do
    Enum.all? str, &_ascii?/1
  end

  defp _ascii?(c) when c in ?\s..?~ do
    true
  end
  defp _ascii?(_), do: false

  # Exercise 2
  def anagram?(word1, word2), do: Enum.empty?(word1 -- word2) and Enum.empty?(word2 -- word1)

  # Exercise 4
  def calculate(str) do
    {first_number, _ } = :string.to_integer(extract_number(str))
    operation = extract_operation(str)
    {last_number, _} = :string.to_integer(Enum.reverse(extract_number(Enum.reverse(str))))
    do_calculate(operation, first_number, last_number)
  end

  defp extract_number(expression) do
    Enum.take_while expression, fn (c) -> Enum.member?('0123456789', c) end
  end
  defp extract_operation(expression) do
    Enum.find expression, fn (c) -> Enum.member?('+-/*', c) end
  end
  defp do_calculate(?+, num_1, num_2), do: num_1 + num_2
  defp do_calculate(?-, num_1, num_2), do: num_1 - num_2
  defp do_calculate(?*, num_1, num_2), do: num_1 * num_2
  defp do_calculate(?/, num_1, num_2), do: div(num_1, num_2)

  # Exercise 5
  def center(list) do
    longest_word = Enum.max_by list, &String.length/1
    longest_length = String.length(longest_word)

    Enum.map(list, fn (w) -> do_center(w, longest_length) end)
      |> Enum.each(&IO.puts/1)
  end

  defp do_center(word, longest_length) do
    word_length = String.length(word)

    String.rjust(word, word_length + div(longest_length, 2) - div(word_length, 2))
  end

  def capitalize_sentences(setences) do
    String.split(setences, ". ")
      |> Enum.map(&String.capitalize/1)
      |> Enum.join ". "
  end

  def parse_orders
    order="""
      123,:NC,100.00
      """
  end

  def parse_order(order)
  end
end
