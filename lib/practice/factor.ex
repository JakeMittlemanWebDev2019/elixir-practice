defmodule Practice.Factor do

  # the first function called
  def factor(numString) do

    # if it's a string, parse it
    # otherwise just call factor_h
    try do
      {num, _} = Integer.parse(numString)
      factor_h(num)
    rescue
      e in FunctionClauseError -> factor_h(numString)
    end
  end

  # check to see if the number is a prime number
  def isPrime(y) do
    # get a list of divisors of y
    divisors = Enum.reduce(2..y, [], fn(x, acc) -> (
                    if (rem(y,x)===0) do [x] ++ acc
                    else acc
                    end)
                end)

    # if there's only 1 divisor (itself)
    # return true, false otherwise
    if length(divisors) === 1 do
      true
    else
      false
    end
  end



  def factor_h(1) do [] end

  # main loop
  def factor_h(num) do
    # get a list of divisors
    Enum.reduce(2..num, [], fn(x, acc) -> (
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
