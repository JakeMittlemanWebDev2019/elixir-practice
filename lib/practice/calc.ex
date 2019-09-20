defmodule Practice.Calc do
  def parse_float(text) do
    {num, _} = Float.parse(text)
    num
  end

  # Split the expression into tokens
  def calc(expr) do
    expr
    |> String.split(~r/\s+/)
    |> calc([], [])
  end

  # Given two operands and an operator, evaluate the
  # expression
  def evaluateExpression(operand1, op, operand2) do
    case op do
      "+" -> operand1 + operand2
      "-" -> operand1 - operand2
      "/" -> operand1 / operand2
      "*" -> operand1 * operand2
    end
  end

  def getPrecedence(operator) do
    case operator do
      "+" -> 1
      "-" -> 1
      "*" -> 2
      "/" -> 2
    end
  end

  # Decide if the tok (the one from the string)
  # is lower precedence than the operator (from the stack)
  def lowerPrecedence(tok, operator) do

    # return if the string op is lower precedence than the stack op
    getPrecedence(tok) < getPrecedence(operator)
  end

  # Handles the case that an operator is seen in
  # the input string
  def handleOperator(tok, operands, operators) do

    # if we don't have any operators, push to the stack
    if (length(operators) === 0) do
      {operands, [tok] ++ operators}

    # otherwise...
    else

      # if we've found a lower precedence operator
      if (lowerPrecedence(tok, hd operators)) do
        # evaluate the expression and push to the appropriate stack
        op = hd operators
        operand1 = hd operands
        operand2 = hd tl operands

        newVal = evaluateExpression(operand1, op, operand2)
        tail = tl tl operands
        handleOperator(tok, [newVal] ++ tail, tl operators)

      # if it's a higher precedence, push to the operators stack
      else
        {operands, [tok] ++ operators}
      end
    end
  end

  # check if we've found an operator
  def isOperator(op) do
    if (op === "+" || op === "-" || op === "/" || op === "*") do
      true
    else
      false
    end
  end

  # When we've scanned the whole input string, continue to
  # pop operators and evaluate expressions until we've
  # exhausted all the operators
  def calc(list, operands, operators) when length(list) === 0 do
    if (length(operators) === 0) do
      hd operands
    else
      # evaluate the expression
      operator = hd operators
      operand1 = hd operands
      operand2 = hd tl operands
      val = evaluateExpression(operand1, operator, operand2)
      operandRest = tl tl operands
      operatorRest = tl operators

      # call the function again with smaller stacks
      calc([], [val] ++ operandRest, operatorRest)
    end
  end

  # the main loop
  def calc(list, operands, operators) do
    tok = hd list


    case isOperator(tok) do
      # if it's not an operator
      # append to the operands stack
      false -> (rest = tl list
              calc(rest, [parse_float(tok)] ++ operands, operators))

      # if it IS an operator,
      # handle the operator by calling the handleOperator function
      # and then recurse with the new stack
      true -> ({operands, operators} = handleOperator(tok, operands, operators)
                rest = tl list
                calc(rest, operands, operators))

    end
  end
end
