defmodule Practice.Calc do
  def parse_float(text) do
    {num, _} = Float.parse(text)
    num
  end

  def calc(expr) do
    expr
    |> String.split(~r/\s+/)
    |> calc([], [])
  end

  def evaluateExpression(operand1, op, operand2) do
    case op do
      "+" -> operand1 + operand2
      "-" -> operand1 - operand2
      "/" -> operand1 / operand2
      "*" -> operand1 * operand2
    end
  end

  def lowerPrecedence(tok, operator) do
    tok_val = 0
    op_val = 0
    case tok do
      "+" -> tok_val = 1
      "-" -> tok_val = 1
      "*" -> tok_val = 2
      "/" -> tok_val = 2
    end

    case operator do 
      "+" -> op_val = 1
      "-" -> op_val = 1
      "*" -> op_val = 2
      "/" -> op_val = 2
    end

    tok_val < op_val

  end

  def handleOperator(tok, operands, operators) do

    if (length(operators) === 0) do
      operators = [tok] ++ operators
    else 

      if (lowerPrecedence(tok, hd operators)) do
        op = hd operators
        operand1 = hd operands
        operand2 = hd tl operands

        newVal = evaluateExpression(operand1, op, operand2)
        operands = newVal ++ tl operands
      else
        operators = tok ++ operators
      end
    end

    {operands, operators}

  end

  def calc(list, operands, operators) when length(list) === 0 do
    hd operands
  end

  def calc(list, operands, operators) do
    tok = hd list
    case is_float(Float.parse(tok)) do
      true -> operands = [parse_float(tok)] ++ operands
      false -> {operands, operators} = handleOperator(tok, operands, operators)
    
    end

    list = tl list
    
    calc(list, operands, operators)

    # Hint:
    # expr
    # |> split
    # |> tag_tokens  (e.g. [+, 1] => [{:op, "+"}, {:num, 1.0}]
    # |> convert to postfix
    # |> reverse to prefix
    # |> evaluate as a stack calculator using pattern matching
  end
end
