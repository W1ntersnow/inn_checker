defmodule Euler.Helpers do
  @weight_individual [3, 7, 2, 4, 10, 3, 5, 9, 4, 6, 8, 0]
  @weight_legal [2, 4, 10, 3, 5, 9, 4, 6, 8, 0]

  def check_inn(value) do
    case value |> String.replace(~r/[^\d]/, "") |> String.length do
      10 -> checkLegal(value)
      12 -> checkIndividual(value)
      _ -> false
    end
  end

  def checkLegal(value) do
    list_value = string_as_list(value)

    check_sum = get_checksum(list_value, @weight_legal)
    check_digit = value |> String.at(9) |> String.to_integer
    calc_sum = check_sum |> check_sum_rem
    if check_digit == calc_sum do
      true
    else
      false
    end
  end

  def checkIndividual(value) do
    list_value = string_as_list(value)
    tail_inn = Enum.drop(list_value, -1)
    [_ | tail_weight] = @weight_individual
    checksum_one = get_checksum(tail_inn, tail_weight)

    checksum_two = get_checksum(list_value, @weight_individual)
    res_one = checksum_one |> check_sum_rem
    res_two = checksum_two |> check_sum_rem

    digit_at_ten = value |> String.at(10) |> String.to_integer
    digit_at_eleven = value |> String.at(11) |> String.to_integer

    if res_one == digit_at_ten and res_two == digit_at_eleven do
      true
    else
      false
    end
  end

  def get_checksum(inn_chars, weights) do
    list = Enum.zip(inn_chars, weights) |> Enum.map(fn {x, y} -> x * y end)
    Enum.sum(list)
  end

  def check_sum_rem(checksum), do: checksum |> rem(11) |> rem(10)

  def string_as_list(string), do: string |> String.graphemes |> Enum.map(&String.to_integer/1)

  def get_text_value(value) do
    case value do
      true -> "корректен"
      _ -> "некорректен"
    end
  end
end
