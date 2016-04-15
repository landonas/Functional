% Author: Landon Soriano
% Date: 02/02/2015

%%
%% person(ID, TASK_CAPABILITIES, AVAILABLE_HOURS)
%%
%%   How many hours each person has available and what classes of
tasks they
%%   are capable of performing.
%%
person(p1, [c,a], 20).
person(p2, [b], 10).
person(p3, [a,b], 15).
person(p4, [c], 30).
%%
%% task(ID, REQUIRED_HOURS, TASK_CLASS)
%%
%%   How long each task requires and what class it falls under.
%%
task(t1, a, 5).
task(t2, b, 10).
task(t3, c, 15).
task(t4, c, 10).
task(t5, a, 15).
task(t6, b, 10).
