-- An astract syntax and denotational semantics of
-- a little language

import ElmTest exposing (runSuite, suite, defaultTest, assertEqual)
import Dict exposing (Dict, insert, get)
import List exposing (map)
import Maybe exposing (withDefault)

type Exp
  = Literal Int
  | Var String
  | Plus Exp Exp

type Command
  = Assign String Exp
  | Read String
  | Print Exp
  | Seq Command Command

type alias Input = List Int
type alias Output = List Int
type alias Store = Dict String Int
type alias State = (Store, Input, Output)

eval: Exp -> Store -> Int
eval e store =
  case e of
    Literal n -> n
    Var v -> withDefault 0 (get v store)
    Plus e1 e2 -> eval e1 store + eval e2 store

exec: Command -> Maybe State -> Maybe State
exec c state =
  case state of
    Nothing -> Nothing
    Just (store, infile, outfile) ->
      case c of
        Assign v e -> Just (insert v (eval e store) store, infile, outfile)
        Read v -> case infile of
          [] -> Nothing
          (x::rest) -> Just (insert v x store, rest, outfile ++ [x])
        Print e -> Just (store, infile, outfile ++ [eval e store])
        Seq c1 c2 -> exec c2 (exec c1 state)

main =
  let
    p0 = Print (Literal 5)
    p1 = Print (Plus (Literal 8) (Var "x"))
    run com = exec com (Just (Dict.empty, [], []))
  in
    runSuite <| suite "Test execution" <| map defaultTest
      [ Just (Dict.empty, [], [5]) `assertEqual` (run p0)
      , Just (Dict.empty, [], [8]) `assertEqual` (run p1)
      ]