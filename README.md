# README

I'm learning PLT related. So I'll learn how to do some "formalization" of Type System in Haskell.

## STLC

I've found some materials, but the de Bruijn indices it used is a little bit confused, XD. So I just made one use String as unique identifier.

About the bi-directional type check, it's just solved the complex writing when we write lambda abstraction like $\lambda x:_T1_ . body$. As the annotation of x could be hidden when we write x as String(the unique Variable), it also cause the problem that every time we define a lambda abs. term, we need find a new name for the bounded var.

> Maybe tomorrow I'll have enough time to learn the special de Bruijn indices there. (Actually, I can easily make it use some global counter, but the material says it's a waste.) -- 24.10.29, D.W.
