:- module(web_casp,[main/1]).


:- use_module(.(package/local_interface_rt)).


main(_) :-
	Port = 8000,
	open_php_localhost(Port),
	swritef(Msg, 'http://localhost:~d/server/index.html', Port),
	open_html_file(Msg).

swritef(Msg, A, B) :-
	sformat(S, A, B),
	atom_codes(Msg, S).



% :- initialization(main(_)).
