Follow these steps https://supabase.com/docs/guides/self-hosting/docker.

 Copy the `.env.example` to `.env` and fill in the values. Don't use the default one provided in the guide, because it may have changed in newer versions.
Also use this `docker-compose.yml` instead of the one provided in the guide for the same reason.

Then run `docker-compose up -d` to start the server.

The \*.sql files contain the DDL of the entire `public` scheme (= our code).

You can restore the latest scheme dump with `psql -U postgres -d postgres -f <file>`.
