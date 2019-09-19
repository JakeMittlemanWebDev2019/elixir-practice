defmodule Practice.Palindrome do
  def palindrome?(x) do 
    # remove spaces from word or phrase
    expected = (String.split(x) |> Enum.join())
    
    # split join and reverse and check
    String.split(x)
    |> Enum.join()
    |> String.reverse()
    |> Kernel.===(expected) 
  end
end
