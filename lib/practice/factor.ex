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

  def factor(1) do [] end

  def factor(num) do
    divisors = Enum.reduce(2..num, [], fn(x, acc) -> (
      if (isPrime(x) === true) do
        if (rem(num,x)===0) do
          factor(Kernel.trunc(num/x)) ++ [x]
        else acc
        end
      else acc
      end)
    end)
  end
end
