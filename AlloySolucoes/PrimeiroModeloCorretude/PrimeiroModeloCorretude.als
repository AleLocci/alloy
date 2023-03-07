run corretuderelativa { } for 4
//run corretuderelativa {eventually no R} for 4//sem especificação não há refinamento

sig S { }
var sig P in S { }
var sig R in S { }

fact inic
{
  no P //P não refina R
  some R//Existem especificações, pelo menos uma.
}

pred corretude//condição do refinamento
{
   no P and
   after some P and //P é construido e refine r em R
   R' = R - P and// Removo especificação refinada
   P' = (P & R)
   //S' = S
}

pred refina[ r : R ]//refino
{
   not (r in P)
   r in R
   P' = P + r 
   R' = R - r //Ally faz diferente
   //S' = S
}

fact trans
{
   //always ((some r: R | refina[r]) or (no R)) //consistente
   always (corretude or (some r: R | refina[r]) or (no R))//será um magic path???
   //always(corretude or (some r: R | refina[r])) //inconcistente
}
