rem primero crea usuario 
rem otorgale privilegios 
drop user sergio cascade;
create user sergio identified by sergio
default tablespace users;
grant connect, resource  to sergio;