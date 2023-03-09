run falha { }

sig S{ }

sig CT {
    caso_de_teste: S->S
}

sig R extends CT{ }//casos de teste que satisfazen R

sig F extends CT{ }

sig P extends CT{ falha: some F }//casos de teste que rodam em P

sig M extends R{ correcao: some F}

fact
{
 all f : F, p : P | f in p.falha
}

fact
{
 all f : F, m : M | f in m.correcao
} 

pred inic
{
  some P //existe um programa com n modulos.
  some R//existe uma especificacao.
  some F
  some M
}

pred remove_falha[ f: F, p: P, m: M ]
{
  f in p.falha
  f in m.correcao
  P'.falha = P.falha - f
  P' = P + m
} 

fact trans {
  always (inic or some  f: F, p: P, m: M  | remove_falha[f,p,m] )
}




