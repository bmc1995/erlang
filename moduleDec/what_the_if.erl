%What the if
% `If`s act like guards and share same syntax but outside functions head.  `If` clauses are called `Guard Patterns`
% Erlang if's are unlike others

-module(what_the_if).
-export([heh_fine/0, oh_god/1, insert/2, beach/1]).

% Always crashes, Erlang can't find a way to have a guard succeed (needs to return something).
heh_fine() ->
    if
        1 =:= 1 ->
            works
    end,
    % No clause will ever match, guard is false.
    if
        1 =:= 2; 1 =:= 1 ->
            works
    end,
    if
        1 =:= 2, 1 =:= 1 ->
            fails
    end.

oh_god(N) ->
    if
        N =:= 2 -> might_succeed;
        %% this is Erlang's if's `else!`
        true -> always_does
    end.

%%% case...of

% if func below provided with X arg and
% param2 is empty list: return list containing X
% param2 is list and
%     contains X arg: return list
%     doesn't contain X arg: return list with X at its head
insert(X, []) ->
    [X];
insert(X, Set) ->
    case lists:member(X, Set) of
        true -> Set;
        false -> [X | Set]
    end.

% if `if` is like a guard, case ... of expression is like a whole function head. complex pattern matching for each arg, can have guards.
beach(Temperature) ->
    case Temperature of
        {celsius, N} when N >= 20, N =< 45 ->
            'favorable';
        {kelvin, N} when N >= 293, N =< 318 ->
            'scientifically favorable';
        {fahrenheit, N} when N >= 68, N =< 113 ->
            'favorable in the US';
        _ ->
            'avoid beach'
    end.


%%% Which to use?
%%
%%% `if` was added as a short way to have guards without needing to write the whole pattern matching part when not needed.
%%% difference is minimal, represented same way at lower level so performance isn't really something to consider.
%%% think about what is more readable/maintainable.