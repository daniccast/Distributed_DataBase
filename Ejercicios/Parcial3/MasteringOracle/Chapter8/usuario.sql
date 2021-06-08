Select tablespace_name from dba_tablespaces
order by tablespace_name;

create user mastering identified by oracle
default tablespace users
temporary tablespace temp;

grant connect, resource to mastering;


connect mastering/oracle
