%%%-------------------------------------------------------------------
%%% @author alex
%%% @copyright (C) 2023
%%% @doc
%%% Maps String to List of Words.
%%% @end
%%% Created : 05. Aug 2023 1:16 PM
%%%-------------------------------------------------------------------
-module(lesson3_task2).
-author("alex").

%% API
-export([               % Input -> Output
  words/1               % <<"Mama Dada Hi Hello Bye More No">> -> <<"Mama","Dada","Hi","Hello","Bye","More","No">>
]).
-import(lesson3_task1, [first_word/1]).
-import(lesson2_task05, [reverse/1]).

%% @spec 1. String to list of words
words(Bin) ->
  reverse(to_list_of_bins(Bin, [])).

to_list_of_bins(String, List_of_strings) ->
  Trimmed_String = trim(String),
  Word = first_word(Trimmed_String),
  L = len(first_word(Word)),
  case Trimmed_String of
    <<>> ->
      List_of_strings;
    <<X:L/binary, Rest/binary>> when X =:= Word ->
      to_list_of_bins(Rest, [X | List_of_strings])
  end.

trim(Bin) ->
  case Bin of
    <<$\s, Rest/binary>> -> trim(Rest);
    _ -> Bin
  end.

len(L) ->
  cnt(L, 0).
cnt(L, N) ->
  case L of
    <<_, T/binary>> -> cnt(T, N + 1);
    _ -> N
  end.
