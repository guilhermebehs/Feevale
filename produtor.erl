-module(produtor). 
-export([gera_produto/1]).

sleep() ->
	Random = rand:uniform(500)+5000,
	timer:sleep(Random).


gera_produto(Buffer) ->
		Produtos = {produto1, produto2, produto3},
		R = rand:uniform(tuple_size(Produtos)),
		P = [element(R, Produtos)],
		Produto = {self(), add, P},
		Buffer ! Produto,
		io:format("~n ~p enviado para o buffer! ~n", [P]),
		sleep(),
	    gera_produto(Buffer).
	
	
	
	
