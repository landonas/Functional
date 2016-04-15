% Author: Landon Soriano
% Date: 02/02/2015

%%  recurses throughout the list to find possible matches.
%% follows the people, task, result format)
%% will look for empty parts of list and see if it is possible
%% to add a task with that person.

schedule([], X, Y).
schedule([Elem | Rest], X, [Elem | Result]) :-
	schedule(Rest, X, Result).

%% nth(Index,  % the index number, starts from 0
%     List,   % the list
%     Elem)   % the element of List at index position
% nth is true if Elem is the Index th element of List

%% stopping condition as we are entering an empty list
%% so we wil stop. 

nth(0, [FirstElement | RestOfList], FirstElement).
nth(N, [_ | RestOfList], Elem) :-
	N > 0,
	M is N-1,
	nth(M, RestOfList, Elem).
