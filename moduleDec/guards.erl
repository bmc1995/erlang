% Guards
% Additional clauses that can go in a functions head to make pattern matching more expressive (by itself it's not enough to represent range of value or certain types of data)
-module(guards).
-compile(export_all). %% replace with -export() later, for God's sake!

old_enough(X) when X >= 16 -> true;
old_enough(_) -> false.


right_age(X) when X >= 16, X =< 104 ->
    true;
right_age(_) ->
    false.
 % comma acts similar to `andalso` semicolon acts similar to `orelse`
wrong_age(X) when X < 16, X > 104 ->
    true;
wrong_age(_) ->
    false.
 % , and ; will catch exceptions as they happen while andalso/orelse will not.
 % however, only andalso/orelse can be nested inside guards 
 % (A orelse B) andalso C -valid guard 
 % (A; B), C -invalid guard
 % guards cannot accept user-defined functions because of side-effects

 % Erlang is not a purely functional language (like Haskell is) - relies on side-effects alot: I/O, send msgs between actors, throw errors when you want.
 % Erlang decided it just doesn't trust you.  Give it some love.