module Exp where

type Exp
  = Num {value: Float}
  | Unary {op: Float -> Float, operand: Exp}
  | Binary
      { op: Float -> Float -> Float
      , left: Exp
      , right: Exp
      }

eval: Exp -> Float
eval e =
  case e of
    Num {value} ->
      value
    Unary {op, operand} ->
      op (eval operand)
    Binary {op, left, right} ->
      op (eval left) (eval right)