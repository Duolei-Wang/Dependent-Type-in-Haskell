module STLC.Syntax where

import Data.HashMap.Strict qualified as Map

data Type
  = TSymbol String
  | TBool
  | TFun Type Type
  deriving (Eq, Show)

data ITerm
  = Ann CTerm Type
  | Var String
  | App ITerm CTerm

data CTerm
  = CTrue
  | CFalse
  | Inf ITerm
  | Lam String CTerm
  | If CTerm CTerm CTerm

data Value
  = VBool Bool
  | VLam (Value -> Value)
  | VNeutral Neutral

data Neutral
  = NVar String
  | NApp Neutral Value

type Context = Map.HashMap String Type
