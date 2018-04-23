-module(main). 
-import(buffer,[recMensagem/2]).
-import(produtor,[gera_produto/1]).
-import(consumidor,[consome_produto/1]).
-export([start/0]).

 
 start() -> 

   Pid_buffer = spawn(buffer, recMensagem, [[], 0]),
   Pid_produtor = spawn(produtor, gera_produto, [Pid_buffer]),
   Pid_produtor1 = spawn(produtor, gera_produto, [Pid_buffer]),
   Pid_produtor2 = spawn(produtor, gera_produto, [Pid_buffer]),
   Pid_consumidor1 = spawn(consumidor, consome_produto, [Pid_buffer]),  
   Pid_consumidor2 = spawn(consumidor, consome_produto, [Pid_buffer]),  
   Pid_consumidor3 = spawn(consumidor, consome_produto, [Pid_buffer]).  
   
   