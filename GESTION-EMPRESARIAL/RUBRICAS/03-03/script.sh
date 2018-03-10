#! /bin/bash
dbname="test1"
username="postgres"
puerto="5432"

usuarios =`psql -X -A -d $dbname -U $username -h localhost -p $puerto -t -c "SELECT COUNT(*) FROM res_users"`

if [ $usuarios -gt 3]; then
    psql -X -A -d $dbname -U $username -h localhost -p $puerto -t -c "INSERT INTO total_users (numero) values $usuarios"