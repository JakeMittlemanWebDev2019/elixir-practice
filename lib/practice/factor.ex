defmodule Practice.Factor do
  def isPrime(y) do
    divisors = Enum.reduce(2..y, [], fn(x, acc) -> (
                    if (rem(y,x)===0) do [x] ++ acc
                    else acc
                    end)
                end)

    if length(divisors) === 1 do
      true
    else
      false
    end
  end

  def factor(numString) do
    {num, _} = Integer.parse(numString)
    factor_h(num)
  end

  def factor_h(1) do [] end

  def factor_h(num) do
    divisors = Enum.reduce(2..num, [], fn(x, acc) -> (
      if (isPrime(x) === true) do
        if (rem(num,x)===0) do
          factor_h(Kernel.trunc(num/x)) ++ [x]
        else acc
        end
      else acc
      end)
    end)
  end
end
