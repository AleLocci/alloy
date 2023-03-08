run falha { }

sig S{ }
sig R extends S { }
sig P extends S { }

sig F {
     f :  P
}

sig C { 
   c:  R
}

sig Su {
    su: C -> F
}

fact inic
{
  some P //existe um programa com n modulos.
  some R//existe uma especificacao.
  some F
  some C
}

pred corrige[ f: P, r: R ]
{ 
  
   

}
