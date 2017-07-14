:- module(local_interface_rt,[
	open_html_file/1,
	open_php_localhost/1
			     ]).


:- use_package(foreign_interface).


:- true pred open_html_file(+Path) :: term + foreign_low(open_html_file_c).
:- true pred open_php_localhost(+Port) :: term + foreign_low(open_php_localhost_c).

:- use_foreign_source([
	'local_interface.c'
		      ]).


