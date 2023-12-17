The *.sql files contain the DDL of the entire `public` scheme (= our code).

You can restore the latest scheme dump with `psql -U postgres -d postgres -f <file>`.