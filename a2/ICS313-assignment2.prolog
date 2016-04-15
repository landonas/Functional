
%%   author: Landon Soriano
%%    02/18/2015
%%    
%%   contains code from: http://learnfrommike.blogspot.com/2012/09/solving-missionaries-and-cannibals.html

s(NumOfHusbands,NumOfWives,RiverSide).


%%   functor_name: move
%%    This functor moves people from one side (left) to the other side (right) of the river.
%%
%%   contains code from: http://learnfrommike.blogspot.com/2012/09/solving-missionaries-and-cannibals.html

move(s(H1, CW1, left), s(MH2, W2, right),H,W) :-
        % obviously we cannot move more people then we have
        H1 - H >= 0,
        W1 - W >= 0,
        % calculate people on each side of the river after move
        H2 is 3-H1+H,
        W2 is 3-W1+W,
        H3 is H1-H,
        W3 is W1-W,
        % check exersize constraint
        noConvertion(H2, W2),
        noConvertion(H3, W3).

% moves other way (right to left)
move(s(H1, W1, right), s(H2, W2,left ),H,W) :-
       % obviously we cannot move more people then we have
       H1 - H >= 0,
       W1 - W >= 0,
       % calculate people on each side of the river after move
       H2 is 3-H1+H,
       W2 is 3-W1+W,
       H3 is H1-H,
       W3 is W1-W,
       % check exersize constraint 
       noConvertion(H2, W2),
       noConvertion(H3, W3).


%%  functor_name: noConvertion
%%   to make sure that there is no conversion
%%   need to ensure that we have an equal number of 
%%   husbands and wives or , the number of husbands
%%    is greater then husbands.
%%
%%   contains code from: http://learnfrommike.blogspot.com/2012/09/solving-missionaries-and-cannibals.html

noConvertion(X,X).
noConvertion(X,Y):-Y>X ;Y=0.


%%  functor_name: goal
%%   goal state, final call so that we know everyone has made it to the 
%%   other side. 
%%
%%   contains code from: http://learnfrommike.blogspot.com/2012/09/solving-missionaries-and-cannibals.html

goal(s(3,3,3,right)).


%%  functor_name: breadthfirst
%%   search that will help solve the jealous husband problem.
%%   will go through all scenarios in order to give the final 
%%   solution. 
%%
%%   contains code from: http://learnfrommike.blogspot.com/2012/09/solving-missionaries-and-cannibals.html

% breadthfirst( [ Path1, Path2, ...], Solution):
%   Solution is an extension to a goal of one of paths

breadthfirst( [ [Node | Path] | _], [Node | Path])  :-
  goal( Node),!.

breadthfirst( [Path | Paths], Solution)  :-
  extend( Path, NewPaths),
  append( Paths, NewPaths, Paths1),
  breadthfirst( Paths1, Solution).
extend( [Node | Path], NewPaths)  :-
  findall( [NewNode, Node | Path],
         ( sail(X,Y),move( Node, NewNode,X,Y), not member( NewNode, [Node | Path] ) ),
         NewPaths).


%%  functor_name: sail
%%   functor that allows for movement of the boat from one side to another. 
%%
%%   contains code from: http://learnfrommike.blogspot.com/2012/09/solving-missionaries-and-cannibals.html
sail(2, 0).
sail(0, 2).
sail(1, 0).
sail(0, 1).
sail(1, 1).
