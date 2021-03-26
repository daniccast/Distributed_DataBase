alter session set nls_date_language = 'ENGLISH';

col parameter format a25
col value format a30
select parameter, value
from nls_session_parameters;

