#!/bin/bash
# очистка сесии модх и преобразование типа таблицы 
set -e
create_query="$(mysql $@ -e 'show create table modx_session' |cat | sed '1d; s/InnoDB/MyISAM/')"
mysql $@ -e "drop table modx_session; $create_query;"
