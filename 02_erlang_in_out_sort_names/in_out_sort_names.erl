-module(in_out_sort_names).
-export([main/0]).

main() ->
    {ok, Names} = file:read_file("names.txt"),
    NamesList = re:split(binary_to_list(Names), "\r?\n", [{return, list}]),
    SortedNames = lists:sort(NamesList),
    io:format("The names are:~n"),
    print_names(SortedNames),
    ok.

print_names([]) ->
    ok;
print_names([Name | Rest]) ->
    io:format("~s~n", [Name]),
    print_names(Rest).