defmodule Practice.Factor do

  def factor(x) do
    factor_helper(x, [1])
  end

  def isPrime(y) do
    divisors = []
    Enum.each(2..y, fn i ->
      if rem(y, i) === 0 do
        divisors ++ [i]
      end
    end)

    if length(divisors) === 1 do
      true
    else
      false
    end
  end

  def factor_helper(1, acc) do
    acc
  end

  def factor_helper(x, acc) do
    x = Integer.parse(x)
    Enum.each(2..x, fn f -> 
      if isPrime(f) === true do
        if rem(x, f) === 0 do
            acc = acc ++ [f]
            factor_helper(x/f, acc)
        end
      end
    end)
  5
  end
end
