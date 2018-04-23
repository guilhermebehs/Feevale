-module(buffer). 
-export([recMensagem/2]).
-import(lists,[member/2]).

 recMensagem(Lista, Tam_lista) ->
 
 receive
         {Pid ,add, Produto} ->
		    if 
			   Tam_lista < 20 ->
				   io:fwrite("~n Buffer recebeu ~p de ~p~n Lista atualizada: ~p~n", [Produto, Pid, lists:append(Lista,Produto)]);
			   true ->	   
				   io:fwrite("Buffer cheio!")
			end,	   
			
			if 
			   Tam_lista < 20 ->
				   recMensagem(lists:append(Lista, Produto),Tam_lista+1);
			   true ->	   
				   recMensagem(lists:append(Lista, Produto), Tam_lista)
			end;
			
		 {Pid,retira, Produto} ->
			Verif = member(Produto, Lista), 		
		    if
			    Verif == true ->
			         io:fwrite("~nBuffer vendeu ~p para ~p ! ~n Lista atualizada: ~p ~n", [Produto,Pid,lists:delete(Produto,Lista)]); 
				true ->
				     io:fwrite("~n ~p em falta na lista ~n", [Produto])	
             end,			 
			 if
				 Verif == true ->
				     recMensagem(lists:delete(Produto,Lista), Tam_lista-1); 
				 true ->
				     recMensagem(lists:delete(Produto,Lista), Tam_lista)	
             end;
			 
		  Other ->
			recMensagem(Lista, Tam_lista)
		  end.
		  


