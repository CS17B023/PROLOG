/* Royal Family of England 1900-2000 */
/* Based on http://ftp.cac.psu.edu/~saw/royal/r02.html */

female('Queen Victoria').
female('Princess Alexandra of Denmark').
female('Queen Mary').
female('Mrs Simpson').
female('Lady Elizabeth Bowes-Lyon').
female('Queen Elizabeth II').
female('Princess Margaret').
female('Lady Diana Spencer').
female('Princess Anne').

male('Prince Albert').
male('King Edward VII').
male('King Edward VIII').
male('King George V').
male('King George VI').
male('Prince Philip').
male('Prince Charles').
male('Prince Andrew').
male('Prince Edward').
male('Prince William').
male('Prince Henry').

married('Prince Albert', 'Queen Victoria').
married('King Edward VII', 'Princess Alexandra of Denmark').
married('King George V', 'Queen Mary').
married('King Edward VIII', 'Mrs Simpson').
married('King George VI', 'Lady Elizabeth Bowes-Lyon').
married('Queen Elizabeth II', 'Prince Philip').
married('Prince Charles', 'Lady Diana Spencer').

parent('Prince Albert', 'King Edward VII').
parent('Queen Victoria', 'King Edward VII').
parent('King Edward VII', 'King George V').
parent('Princess Alexandra of Denmark', 'King George V').
parent('King George V', 'King Edward VIII').
parent('Queen Mary', 'King Edward VIII'). 
parent('King George V', 'King George VI').
parent('Queen Mary', 'King George VI').
parent('King George VI', 'Queen Elizabeth II').
parent('Lady Elizabeth Bowes-Lyon', 'Queen Elizabeth II').
parent('King George VI', 'Princess Margaret').
parent('Lady Elizabeth Bowes-Lyon', 'Princess Margaret').
parent('Queen Elizabeth II', 'Prince Charles').
parent('Prince Philip', 'Prince Charles').
parent('Queen Elizabeth II', 'Princess Anne').
parent('Prince Philip', 'Princess Anne').
parent('Queen Elizabeth II', 'Prince Andrew').
parent('Prince Philip', 'Prince Andrew').
parent('Queen Elizabeth II', 'Prince Edward').
parent('Prince Philip', 'Prince Edward').
parent('Prince Charles', 'Prince William').
parent('Lady Diana Spencer', 'Prince William').
parent('Prince Charles', 'Prince Henry').
parent('Lady Diana Spencer', 'Prince Henry').




mother(X,Y)   :- parent(X,Y),female(X).
father(X,Y)   :- parent(X,Y),male(X).
sister(X,Y)   :- parent(Z,X),parent(Z,Y),female(X),X\==Y.
brother(X,Y)  :- parent(Z,X),parent(Z,X),male(X),X\==Y.
couple(X,Y)   :- married(X,Y),X\==Y. 
child(X,Y)    :- parent(Y,X), X\==Y.
son(X,Y)      :- child(X,Y), male(X).
daughter(X, Y):- child(X,Y), female(X).
sibling(X, Y) :- child(X,P), child(Y,P), X\=Y.


ancestor(X,Y):- parent(X,Y).
ancestor(X,Y):- parent(X,Z),ancestor(Z,Y).

