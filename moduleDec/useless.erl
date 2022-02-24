% module def
-module(useless).

% export def, list of functions with respective arity (# of parameters unary, binary, n-ary) 
% ie -export([Function1/Arity, Function2/Arity, ..., FunctionN/Arity])
-export ([add/2, hello/0, greet_and_add_two/1]).

% function syntax: Name(Args) -> Body.
% Name has to be an atom
% Body can be one or more Erlang expressions seperated by commas.
% THERE IS NO RETURN!!!!!!  No, really, the last logical expression executed has its value auto-returned to caller.
add(A,B) ->
    A + B.

%% Shows greetings.
%% io:format/1 is the standard function used to output text.
hello() ->
    io:format("Hello, world!~n").

greet_and_add_two(X) ->
    hello(),
    add(X,2).