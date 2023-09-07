%%%-------------------------------------------------------------------
%%% @author alex
%%% @copyright (C) 2023
%%% @doc
%%% Returns the very first word.
%%% @end
%%% Created : 05. Aug 2023 1:16 PM
%%%-------------------------------------------------------------------
-module(lesson3_task1).
-author("alex").

%% API
-export([               % Input -> Output
  first_word/1          % <<"Basic words that are essential for communication">> -> <<"Basic">>
]).

%% @spec 1. Returns the very first word of the sentence
first_word(Bin) -> word(Bin, <<"">>).
word(String, Word) ->
  case String of
    <<>> -> Word;
    <<$\s, T/binary>> -> word(T, Word);
    <<H, $\s, _/binary>> -> word(<<"">>, <<Word/binary, H>>);
    <<H, T/binary>> -> word(T, <<Word/binary, H>>)
  end.
