% --------------------------------------------------------------
% ---------------------- Find in the tree ----------------------
% --------------------------------------------------------------
declare
fun {Find X T}
  case T 
  of leaf then notfound
  [] tree(key:Y value:V left:T1 right:T2) andthen X==Y then found(V)
  [] tree(key:Y value:V left:T1 right:T2) andthen X < Y then {Find X T1}
  [] tree(key:Y value:V left:T1 right:T2) andthen X > Y then {Find X T2}
  end
end

T=tree(key:33 value:raiz
      left:tree(key:25 value:niv1Izq
               left:tree(key:10 value:niv2IzIz left:leaf right:leaf)
               right:tree(key:26 value:niv2IzDe left:leaf right:leaf))
      right:tree(key:45 value:niv1Der
               left:tree(key:38 value:niv2DeIz left:leaf right:leaf)
               right:tree(key:48 value:niv2DeDe left:leaf right:leaf)))
{Browse {Buscar 10 T}}


% --------------------------------------------------------------
% ---------------------- Add into the tree ---------------------
% --------------------------------------------------------------
declare
fun {Add X V T}
  case T
  of leaf then tree(key:X value:V left:leaf right:leaf)
  [] tree(key:Y value:W left:T1 right:T2) andthen X==Y then tree(key:X value:V left:T1 right:T2)
  [] tree(key:Y value:W left:T1 right:T2) andthen X < Y then tree(key:Y value:W left:{Add X V T1} right:T2)
  [] tree(key:Y value:W left:T1 right:T2) andthen X > Y then tree(key:Y value:W left:T1 right:{Add X V T2})
  end
end

T=tree(key:33 value:raiz
      left:tree(key:25 value:niv1Izq
               left:tree(key:10 value:niv2IzIz left:leaf right:leaf)
               right:tree(key:26 value:niv2IzDe left:leaf right:leaf))
      right:tree(key:45 value:niv1Der
               left:tree(key:38 value:niv2DeIz left:leaf right:leaf)
               right:tree(key:48 value:niv2DeDe left:leaf right:leaf)))

{Browse {Insert 35 niv3DeIzIz T}}


% --------------------------------------------------------------
% -------------------- Delte from the tree ---------------------
% --------------------------------------------------------------
declare
fun {Delete X T}
  case T
  of leaf then leaf
  [] tree(key:Y value:W left:T1 right:T2) andthen X==Y then {DeleteNode T}
  [] tree(key:Y value:W left:T1 right:T2) andthen X < Y then tree(key:Y value:W left:{Delete X T1} right:T2)
  [] tree(key:Y value:W left:T1 right:T2) andthen X > Y then tree(key:Y value:W left:T1 right:{Delete X T2})
  end
end

fun {DeleteNode X}
  case X
  of tree(key:Y value:W left:leaf right:leaf) then leaf
  [] tree(key:Y value:W left:T1 right:leaf) then T1
  [] tree(key:Y value:W left:leaf right:T2) then T2
  [] tree(key:Y value:W left:T1 right:T2) then tree(key:Y value:W left:T1 right:{DeleteMin T2})
  end
end

fun {DeleteMin X}
  case X
  of tree(key:Y value:W left:leaf right:T2) then T2
  [] tree(key:Y value:W left:T1 right:T2) then tree(key:Y value:W left:{DeleteMin T1} right:T2)
  end
end


T=tree(key:33 value:raiz
      left:tree(key:25 value:niv1Izq
               left:tree(key:10 value:niv2IzIz left:leaf right:leaf)
               right:tree(key:26 value:niv2IzDe left:leaf right:leaf))
      right:tree(key:45 value:niv1Der
               left:tree(key:38 value:niv2DeIz left:leaf right:leaf)
               right:tree(key:48 value:niv2DeDe left:leaf right:leaf)))

{Browse {Delete 45 T}}
    
    