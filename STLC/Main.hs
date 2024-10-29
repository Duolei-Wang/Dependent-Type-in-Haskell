module STLC.Main where

import Data.HashMap.Internal.Array qualified as Map
import Data.HashMap.Strict qualified as HashMap
import STLC.Evaluator (infer)
import STLC.Syntax (ITerm (Var), Type (TSymbol))

initCtx :: HashMap.HashMap String Type
initCtx = HashMap.fromList [("x", TSymbol "T1")]

varx :: ITerm
varx = Var "x"

main :: IO ()
main = do
  print $ infer initCtx varx
