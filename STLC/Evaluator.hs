module STLC.Evaluator where

import Data.HashMap.Strict qualified as Map
import STLC.Syntax

infer :: Context -> ITerm -> Either String Type
infer ctx iterm = case iterm of
  Ann cterm t -> do
    t' <- check ctx cterm t
    return t
  Var var -> do
    case Map.lookup var ctx of
      Nothing -> Left $ "Unbounded Variable: " ++ var
      Just t -> return t
  App ilhs crhs -> do
    tf <- infer ctx ilhs
    case tf of
      TFun ta tb -> do
        check ctx crhs ta
        return tb
      _ -> Left "Except a Function Type."

check :: Context -> CTerm -> Type -> Either String ()
check ctx cterm t = case (cterm, t) of
  (CTrue, TBool) -> return ()
  (CFalse, TBool) -> return ()
  (Inf iterm, t) -> do
    t' <- infer ctx iterm
    if t == t'
      then return ()
      else Left "Type mismatch."
  (Lam var cterm, TFun ta tb) -> do
    let ctx' = Map.insert var ta ctx
    check ctx' cterm tb
  (If cond tbranch fbranch, t) -> do
    check ctx cond TBool
    check ctx tbranch t
    check ctx fbranch t
