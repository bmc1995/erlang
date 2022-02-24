% Syntax in functions
-module(functions).
-compile(export_all). %% replace with -export() later, for God's sake!

%function clauses must be seperated by semicolons - together form a function declaration. final clause ends with .
% function(X) ->
%   Expression;
% function(Y) ->
%   Expression;
% function(_) ->
%   Expression.

greet(male, Name) -> 
    io:format("Hello, Mr. ~s!~n", [Name]);
greet(female, Name) -> 
    io:format("Hello, Mrs. ~s!~n", [Name]);
greet(_, Name) -> 
    io:format("Hello, ~s!~n", [Name]).

head([H|_]) -> H.

second([_,S|_]) -> S.

% first 'X' param is unbound, automatically takes value of arg1. on second param sees X is already bound and checks to see if 2nd arg matches (think pattern matching & immutability)
% 2nd clause takes any args
same(X,X) -> 
    true;
same(_,_) ->
    false.

valid_time({Date = {Y,M,D}, Time = {H,Min,S}}) ->
    io:format("The Date tuple (~p) says today is: ~p/~p/~p,~n", [Date,Y,M,D]),
    io:format("The Time tuple (~p) says the time is: ~p:~p:~p.~n", [Time,H,Min,S]);
valid_time(_) ->
    io:format("Stop feeding me wrong data!~n").