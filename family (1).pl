  male(ali).
  male(veli).
  female(zeynep).
  female(sumeyye).
  parent(ali,ayse).  
  parent(ali,ahmet).
  parent(zeynep,ayse).
  parent(zeynep,ahmet).
  married(ali,sumeyye).
  parent(ali,kaan).
  parent(sumeyye,kaan).

  father(X,Y):-parent(X,Y), male(X).
  mother(X,Y):-parent(X,Y), female(X).
  son(X,Y):-father(Y,X),male(X).
  son(X,Y):-mother(Y,X),male(X).
  daughter(X,Y):-father(Y,X),female(X).
  daughter(X,Y):-mother(Y,X),female(X).
  sibling(X,Y):- mother(Z,X) , mother(Z,Y),father(K,X) , father(K,Y).  
  step_father(X,Y) :- male(Y), \+parent(X,Y), married(Y,Z), parent(X,Z). 
  step_parent(X,Y) :- \+parent(X,Y), married(Y,Z), parent(X,Z).
  sister(X,Y) :- female(X), mother(M, X), father(F, X), mother(M, Y),father(F, Y).
  aunt(X,Y) :- female(X),sister(X,M),mother(M,Y).
  grandparent(X,Y) :- parent(X,_),parent(_,Y).
  grandfather(X,Y) :- male(X),parent(X,_),parent(_,Y).
  ancestor(X, Y) :- parent(X, Y).
  ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).
  relative(X,Y) :- ancestor(X,Z), ancestor(Y,T).
  brotherinlaw(X,Y):-married(X,Z),sibling(Z,Y),male(X).
  sisterinlaw(X,Y):-married(X,Z),sibling(Z,Y),female(X).
  motherinlaw(X,Y):-married(Y,Z),mother(X,Z),female(X).
  fatherinlaw(X,Y):-married(Y,Z),father(X,Z),male(X).
  soninlaw(X,Y):-married(X,Z),daughter(Z,Y),male(X).
  daughterilaw(X,Y):-married(X,Z),son(Z,Y),female(X).
