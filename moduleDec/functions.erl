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