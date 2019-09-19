defmodule Practice.Factor do

  list = [1]

  def isPrime(y) do
    divisors = []
    Enum.each(2..y, fn i ->
      case rem(y, i) === 0 do
        divisors ++ i
      end

    if length(divisors) === 1 do
      true
    else
      false
    end
  end

  def factor(x) do
    Enum.each(2..x, fn f -> 
      case isPrime(f) === true do
        case rem(x, i) === 0:
          list ++ [i]
          factor(x/2)
        end
      end
    list    
  end
end
