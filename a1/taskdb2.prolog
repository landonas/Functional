% Author: Landon Soriano
% Date: 02/02/2015
% Class: ICS 313

%% Data base for the list of people who can work, follows the 
%% following format: 
%% 
%% person(ID, TASK_CAPABILITIES, AVAILABLE_HOURS)
%%
%%   How many hours each person has available and what classes of
%%   tasks they are capable of performing.
%%
person(p1, [a,b], 20).
person(p2, [b,c], 10).
person(p3, [a,c], 15).
person(p4, [c], 30).

%% Data base for tasks that are available to be done.
%% Follows the following format: 
%%
%% task(ID, REQUIRED_HOURS, TASK_CLASS)
%%
%%  How long each task requires and what class it falls under.
%%  
%%
task(t1, a, 5).
task(t2, b, 10).
task(t3, c, 15).
task(t4, c, 10).
task(t5, a, 15).
task(t6, b, 10).



