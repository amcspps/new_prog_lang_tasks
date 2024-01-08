-module(in_out_sort_names).
-export([main/0]).

main() ->
    {ok, Names} = file:read_file("names.txt"),
    NamesList = re:split(binary_to_list(Names), "\r?\n", [{return, list}]),
    SortedNames = lists:sort(NamesList),
    
    io:format("Where to store sorted values (console/file)? "),
    Destination = read_destination(),
    
    case Destination of
        console ->
            io:format("The names are:~n"),
            print_names(SortedNames, console),
            ok;
        {file, _Filename} ->  
            FullFilename = filename:absname("out.txt"),
            io:format("The names are:~n"),
            print_names(SortedNames, {file, FullFilename}),
            ok
    end.

read_destination() ->
    case io:get_line("") of
        "console\n" ->
            console;
        "file\n" ->
            {file, "out.txt"};
        _ ->
            io:format("Invalid input. Using console as default.~n"),
            console
    end.

print_names([], console) ->
    ok;
print_names([], {file, Filename}) ->
    file:close(io:format("Sorted names written to ~s~n", [Filename]));
print_names([Name | Rest], Destination) ->
    case Destination of
        console ->
            io:format("~s~n", [Name]),
            print_names(Rest, Destination);
        {file, Filename} ->
            file:write_file(Filename, Name ++ "\n", [append]),
            print_names(Rest, Destination)
    end.