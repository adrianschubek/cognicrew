PGDMP  '                     |            postgres     15.1 (Ubuntu 15.1-1.pgdg20.04+1)    16.1 �              0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    5    postgres    DATABASE     p   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C.UTF-8';
    DROP DATABASE postgres;
                postgres    false                       0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    4881                       0    0    DATABASE postgres    ACL     2   GRANT ALL ON DATABASE postgres TO dashboard_user;
                   postgres    false    4881            -            2615    17049 
   _analytics    SCHEMA        CREATE SCHEMA _analytics;
    DROP SCHEMA _analytics;
                postgres    false                        2615    17050 	   _realtime    SCHEMA        CREATE SCHEMA _realtime;
    DROP SCHEMA _realtime;
                postgres    false            "            2615    16457    auth    SCHEMA        CREATE SCHEMA auth;
    DROP SCHEMA auth;
                supabase_admin    false                       0    0    SCHEMA auth    ACL        GRANT USAGE ON SCHEMA auth TO anon;
GRANT USAGE ON SCHEMA auth TO authenticated;
GRANT USAGE ON SCHEMA auth TO service_role;
GRANT ALL ON SCHEMA auth TO supabase_auth_admin;
GRANT ALL ON SCHEMA auth TO dashboard_user;
GRANT ALL ON SCHEMA auth TO postgres;
                   supabase_admin    false    34                        2615    16391 
   extensions    SCHEMA        CREATE SCHEMA extensions;
    DROP SCHEMA extensions;
                postgres    false                       0    0    SCHEMA extensions    ACL     �   GRANT USAGE ON SCHEMA extensions TO anon;
GRANT USAGE ON SCHEMA extensions TO authenticated;
GRANT USAGE ON SCHEMA extensions TO service_role;
GRANT ALL ON SCHEMA extensions TO dashboard_user;
                   postgres    false    31                        3079    29328    pg_cron 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS pg_cron WITH SCHEMA extensions;
    DROP EXTENSION pg_cron;
                   false    31                       0    0    EXTENSION pg_cron    COMMENT     @   COMMENT ON EXTENSION pg_cron IS 'Job scheduler for PostgreSQL';
                        false    2            &            2615    16686    graphql    SCHEMA        CREATE SCHEMA graphql;
    DROP SCHEMA graphql;
                supabase_admin    false            $            2615    16675    graphql_public    SCHEMA        CREATE SCHEMA graphql_public;
    DROP SCHEMA graphql_public;
                supabase_admin    false                       0    0    SCHEMA graphql_public    ACL     �   GRANT USAGE ON SCHEMA graphql_public TO postgres;
GRANT USAGE ON SCHEMA graphql_public TO anon;
GRANT USAGE ON SCHEMA graphql_public TO authenticated;
GRANT USAGE ON SCHEMA graphql_public TO service_role;
                   supabase_admin    false    36                        3079    16565    pg_net 	   EXTENSION     >   CREATE EXTENSION IF NOT EXISTS pg_net WITH SCHEMA extensions;
    DROP EXTENSION pg_net;
                   false    31                       0    0    EXTENSION pg_net    COMMENT     -   COMMENT ON EXTENSION pg_net IS 'Async HTTP';
                        false    4                       0    0 
   SCHEMA net    ACL     �   GRANT USAGE ON SCHEMA net TO supabase_functions_admin;
GRANT USAGE ON SCHEMA net TO anon;
GRANT USAGE ON SCHEMA net TO authenticated;
GRANT USAGE ON SCHEMA net TO service_role;
                   postgres    false    39                        2615    16385 	   pgbouncer    SCHEMA        CREATE SCHEMA pgbouncer;
    DROP SCHEMA pgbouncer;
             	   pgbouncer    false            )            2615    16713    pgsodium    SCHEMA        CREATE SCHEMA pgsodium;
    DROP SCHEMA pgsodium;
                supabase_admin    false            	            3079    16714    pgsodium 	   EXTENSION     >   CREATE EXTENSION IF NOT EXISTS pgsodium WITH SCHEMA pgsodium;
    DROP EXTENSION pgsodium;
                   false    41                       0    0    EXTENSION pgsodium    COMMENT     \   COMMENT ON EXTENSION pgsodium IS 'Pgsodium is a modern cryptography library for Postgres.';
                        false    9                       0    0    SCHEMA public    ACL     �   GRANT USAGE ON SCHEMA public TO postgres;
GRANT USAGE ON SCHEMA public TO anon;
GRANT USAGE ON SCHEMA public TO authenticated;
GRANT USAGE ON SCHEMA public TO service_role;
                   pg_database_owner    false    16            A            2615    16667    realtime    SCHEMA        CREATE SCHEMA realtime;
    DROP SCHEMA realtime;
                supabase_admin    false                       0    0    SCHEMA realtime    ACL     ,   GRANT USAGE ON SCHEMA realtime TO postgres;
                   supabase_admin    false    65                         2615    16505    storage    SCHEMA        CREATE SCHEMA storage;
    DROP SCHEMA storage;
                supabase_admin    false                       0    0    SCHEMA storage    ACL       GRANT ALL ON SCHEMA storage TO postgres;
GRANT USAGE ON SCHEMA storage TO anon;
GRANT USAGE ON SCHEMA storage TO authenticated;
GRANT USAGE ON SCHEMA storage TO service_role;
GRANT ALL ON SCHEMA storage TO supabase_storage_admin;
GRANT ALL ON SCHEMA storage TO dashboard_user;
                   supabase_admin    false    32                        2615    16608    supabase_functions    SCHEMA     "   CREATE SCHEMA supabase_functions;
     DROP SCHEMA supabase_functions;
                supabase_admin    false                       0    0    SCHEMA supabase_functions    ACL     !  GRANT USAGE ON SCHEMA supabase_functions TO postgres;
GRANT USAGE ON SCHEMA supabase_functions TO anon;
GRANT USAGE ON SCHEMA supabase_functions TO authenticated;
GRANT USAGE ON SCHEMA supabase_functions TO service_role;
GRANT ALL ON SCHEMA supabase_functions TO supabase_functions_admin;
                   supabase_admin    false    28            ,            2615    17017    vault    SCHEMA        CREATE SCHEMA vault;
    DROP SCHEMA vault;
                supabase_admin    false                        3079    16702 
   pg_graphql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS pg_graphql WITH SCHEMA graphql;
    DROP EXTENSION pg_graphql;
                   false    38                       0    0    EXTENSION pg_graphql    COMMENT     B   COMMENT ON EXTENSION pg_graphql IS 'pg_graphql: GraphQL support';
                        false    8                        3079    16633    pg_stat_statements 	   EXTENSION     J   CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA extensions;
 #   DROP EXTENSION pg_stat_statements;
                   false    31                        0    0    EXTENSION pg_stat_statements    COMMENT     u   COMMENT ON EXTENSION pg_stat_statements IS 'track planning and execution statistics of all SQL statements executed';
                        false    3                        3079    16403    pgcrypto 	   EXTENSION     @   CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA extensions;
    DROP EXTENSION pgcrypto;
                   false    31            !           0    0    EXTENSION pgcrypto    COMMENT     <   COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';
                        false    6                        3079    16440    pgjwt 	   EXTENSION     =   CREATE EXTENSION IF NOT EXISTS pgjwt WITH SCHEMA extensions;
    DROP EXTENSION pgjwt;
                   false    6    31            "           0    0    EXTENSION pgjwt    COMMENT     C   COMMENT ON EXTENSION pgjwt IS 'JSON Web Token API for Postgresql';
                        false    5            
            3079    17018    supabase_vault 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS supabase_vault WITH SCHEMA vault;
    DROP EXTENSION supabase_vault;
                   false    44    9            #           0    0    EXTENSION supabase_vault    COMMENT     C   COMMENT ON EXTENSION supabase_vault IS 'Supabase Vault Extension';
                        false    10                        3079    16392 	   uuid-ossp 	   EXTENSION     C   CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA extensions;
    DROP EXTENSION "uuid-ossp";
                   false    31            $           0    0    EXTENSION "uuid-ossp"    COMMENT     W   COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';
                        false    7            -           1247    17696 	   aal_level    TYPE     K   CREATE TYPE auth.aal_level AS ENUM (
    'aal1',
    'aal2',
    'aal3'
);
    DROP TYPE auth.aal_level;
       auth          supabase_auth_admin    false    34            E           1247    17837    code_challenge_method    TYPE     L   CREATE TYPE auth.code_challenge_method AS ENUM (
    's256',
    'plain'
);
 &   DROP TYPE auth.code_challenge_method;
       auth          supabase_auth_admin    false    34            *           1247    17690    factor_status    TYPE     M   CREATE TYPE auth.factor_status AS ENUM (
    'unverified',
    'verified'
);
    DROP TYPE auth.factor_status;
       auth          supabase_auth_admin    false    34            '           1247    17685    factor_type    TYPE     E   CREATE TYPE auth.factor_type AS ENUM (
    'totp',
    'webauthn'
);
    DROP TYPE auth.factor_type;
       auth          supabase_auth_admin    false    34            �           1247    508578    achievement_type    TYPE     g   CREATE TYPE public.achievement_type AS (
	id bigint,
	name text,
	description text,
	icon_name text
);
 #   DROP TYPE public.achievement_type;
       public          supabase_admin    false            �           1247    225045    answer_type    TYPE     R   CREATE TYPE public.answer_type AS (
	exercise bigint,
	order_position smallint
);
    DROP TYPE public.answer_type;
       public          supabase_admin    false            �           1247    53172    action    TYPE     o   CREATE TYPE realtime.action AS ENUM (
    'INSERT',
    'UPDATE',
    'DELETE',
    'TRUNCATE',
    'ERROR'
);
    DROP TYPE realtime.action;
       realtime          supabase_admin    false    65            �           1247    53132    equality_op    TYPE     v   CREATE TYPE realtime.equality_op AS ENUM (
    'eq',
    'neq',
    'lt',
    'lte',
    'gt',
    'gte',
    'in'
);
     DROP TYPE realtime.equality_op;
       realtime          supabase_admin    false    65            �           1247    53147    user_defined_filter    TYPE     j   CREATE TYPE realtime.user_defined_filter AS (
	column_name text,
	op realtime.equality_op,
	value text
);
 (   DROP TYPE realtime.user_defined_filter;
       realtime          supabase_admin    false    65    1683            �           1247    53214 
   wal_column    TYPE     �   CREATE TYPE realtime.wal_column AS (
	name text,
	type_name text,
	type_oid oid,
	value jsonb,
	is_pkey boolean,
	is_selectable boolean
);
    DROP TYPE realtime.wal_column;
       realtime          supabase_admin    false    65            �           1247    53185    wal_rls    TYPE     s   CREATE TYPE realtime.wal_rls AS (
	wal jsonb,
	is_rls_enabled boolean,
	subscription_ids uuid[],
	errors text[]
);
    DROP TYPE realtime.wal_rls;
       realtime          supabase_admin    false    65            �           1255    16503    email()    FUNCTION       CREATE FUNCTION auth.email() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.email', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'email')
  )::text
$$;
    DROP FUNCTION auth.email();
       auth          supabase_auth_admin    false    34            %           0    0    FUNCTION email()    COMMENT     X   COMMENT ON FUNCTION auth.email() IS 'Deprecated. Use auth.jwt() -> ''email'' instead.';
          auth          supabase_auth_admin    false    497            &           0    0    FUNCTION email()    ACL     6   GRANT ALL ON FUNCTION auth.email() TO dashboard_user;
          auth          supabase_auth_admin    false    497            �           1255    17667    jwt()    FUNCTION     �   CREATE FUNCTION auth.jwt() RETURNS jsonb
    LANGUAGE sql STABLE
    AS $$
  select 
    coalesce(
        nullif(current_setting('request.jwt.claim', true), ''),
        nullif(current_setting('request.jwt.claims', true), '')
    )::jsonb
$$;
    DROP FUNCTION auth.jwt();
       auth          supabase_auth_admin    false    34            '           0    0    FUNCTION jwt()    ACL     b   GRANT ALL ON FUNCTION auth.jwt() TO postgres;
GRANT ALL ON FUNCTION auth.jwt() TO dashboard_user;
          auth          supabase_auth_admin    false    720            #           1255    16502    role()    FUNCTION        CREATE FUNCTION auth.role() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.role', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'role')
  )::text
$$;
    DROP FUNCTION auth.role();
       auth          supabase_auth_admin    false    34            (           0    0    FUNCTION role()    COMMENT     V   COMMENT ON FUNCTION auth.role() IS 'Deprecated. Use auth.jwt() -> ''role'' instead.';
          auth          supabase_auth_admin    false    547            )           0    0    FUNCTION role()    ACL     5   GRANT ALL ON FUNCTION auth.role() TO dashboard_user;
          auth          supabase_auth_admin    false    547            �           1255    16501    uid()    FUNCTION     �   CREATE FUNCTION auth.uid() RETURNS uuid
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.sub', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'sub')
  )::uuid
$$;
    DROP FUNCTION auth.uid();
       auth          supabase_auth_admin    false    34            *           0    0    FUNCTION uid()    COMMENT     T   COMMENT ON FUNCTION auth.uid() IS 'Deprecated. Use auth.jwt() -> ''sub'' instead.';
          auth          supabase_auth_admin    false    494            +           0    0    FUNCTION uid()    ACL     4   GRANT ALL ON FUNCTION auth.uid() TO dashboard_user;
          auth          supabase_auth_admin    false    494            ,           0    0    FUNCTION job_cache_invalidate()    ACL     Q   GRANT ALL ON FUNCTION cron.job_cache_invalidate() TO postgres WITH GRANT OPTION;
          cron          supabase_admin    false    749            -           0    0 .   FUNCTION schedule(schedule text, command text)    ACL     `   GRANT ALL ON FUNCTION cron.schedule(schedule text, command text) TO postgres WITH GRANT OPTION;
          cron          supabase_admin    false    747            .           0    0 =   FUNCTION schedule(job_name text, schedule text, command text)    ACL     o   GRANT ALL ON FUNCTION cron.schedule(job_name text, schedule text, command text) TO postgres WITH GRANT OPTION;
          cron          supabase_admin    false    751            /           0    0 "   FUNCTION unschedule(job_id bigint)    ACL     T   GRANT ALL ON FUNCTION cron.unschedule(job_id bigint) TO postgres WITH GRANT OPTION;
          cron          supabase_admin    false    748            0           0    0 "   FUNCTION unschedule(job_name name)    ACL     T   GRANT ALL ON FUNCTION cron.unschedule(job_name name) TO postgres WITH GRANT OPTION;
          cron          supabase_admin    false    750            1           0    0 D   FUNCTION algorithm_sign(signables text, secret text, algorithm text)    ACL     Y  REVOKE ALL ON FUNCTION extensions.algorithm_sign(signables text, secret text, algorithm text) FROM postgres;
GRANT ALL ON FUNCTION extensions.algorithm_sign(signables text, secret text, algorithm text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.algorithm_sign(signables text, secret text, algorithm text) TO dashboard_user;
       
   extensions          postgres    false    525            2           0    0    FUNCTION armor(bytea)    ACL     �   REVOKE ALL ON FUNCTION extensions.armor(bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.armor(bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.armor(bytea) TO dashboard_user;
       
   extensions          postgres    false    584            3           0    0 %   FUNCTION armor(bytea, text[], text[])    ACL     �   REVOKE ALL ON FUNCTION extensions.armor(bytea, text[], text[]) FROM postgres;
GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO dashboard_user;
       
   extensions          postgres    false    585            4           0    0    FUNCTION crypt(text, text)    ACL     �   REVOKE ALL ON FUNCTION extensions.crypt(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.crypt(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.crypt(text, text) TO dashboard_user;
       
   extensions          postgres    false    543            5           0    0    FUNCTION dearmor(text)    ACL     �   REVOKE ALL ON FUNCTION extensions.dearmor(text) FROM postgres;
GRANT ALL ON FUNCTION extensions.dearmor(text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.dearmor(text) TO dashboard_user;
       
   extensions          postgres    false    587            6           0    0 $   FUNCTION decrypt(bytea, bytea, text)    ACL     �   REVOKE ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO dashboard_user;
       
   extensions          postgres    false    491            7           0    0 .   FUNCTION decrypt_iv(bytea, bytea, bytea, text)    ACL       REVOKE ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;
       
   extensions          postgres    false    487            8           0    0    FUNCTION digest(bytea, text)    ACL     �   REVOKE ALL ON FUNCTION extensions.digest(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO dashboard_user;
       
   extensions          postgres    false    540            9           0    0    FUNCTION digest(text, text)    ACL     �   REVOKE ALL ON FUNCTION extensions.digest(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.digest(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.digest(text, text) TO dashboard_user;
       
   extensions          postgres    false    474            :           0    0 $   FUNCTION encrypt(bytea, bytea, text)    ACL     �   REVOKE ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO dashboard_user;
       
   extensions          postgres    false    490            ;           0    0 .   FUNCTION encrypt_iv(bytea, bytea, bytea, text)    ACL       REVOKE ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;
       
   extensions          postgres    false    492            <           0    0 "   FUNCTION gen_random_bytes(integer)    ACL     �   REVOKE ALL ON FUNCTION extensions.gen_random_bytes(integer) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO dashboard_user;
       
   extensions          postgres    false    489            =           0    0    FUNCTION gen_random_uuid()    ACL     �   REVOKE ALL ON FUNCTION extensions.gen_random_uuid() FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO dashboard_user;
       
   extensions          postgres    false    493            >           0    0    FUNCTION gen_salt(text)    ACL     �   REVOKE ALL ON FUNCTION extensions.gen_salt(text) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_salt(text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_salt(text) TO dashboard_user;
       
   extensions          postgres    false    544            ?           0    0     FUNCTION gen_salt(text, integer)    ACL     �   REVOKE ALL ON FUNCTION extensions.gen_salt(text, integer) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO dashboard_user;
       
   extensions          postgres    false    545            �           1255    16560    grant_pg_cron_access()    FUNCTION     �  CREATE FUNCTION extensions.grant_pg_cron_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  schema_is_cron bool;
BEGIN
  schema_is_cron = (
    SELECT n.nspname = 'cron'
    FROM pg_event_trigger_ddl_commands() AS ev
    LEFT JOIN pg_catalog.pg_namespace AS n
      ON ev.objid = n.oid
  );

  IF schema_is_cron
  THEN
    grant usage on schema cron to postgres with grant option;

    alter default privileges in schema cron grant all on tables to postgres with grant option;
    alter default privileges in schema cron grant all on functions to postgres with grant option;
    alter default privileges in schema cron grant all on sequences to postgres with grant option;

    alter default privileges for user supabase_admin in schema cron grant all
        on sequences to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on tables to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on functions to postgres with grant option;

    grant all privileges on all tables in schema cron to postgres with grant option;

  END IF;

END;
$$;
 1   DROP FUNCTION extensions.grant_pg_cron_access();
    
   extensions          postgres    false    31            @           0    0    FUNCTION grant_pg_cron_access()    COMMENT     U   COMMENT ON FUNCTION extensions.grant_pg_cron_access() IS 'Grants access to pg_cron';
       
   extensions          postgres    false    711            A           0    0    FUNCTION grant_pg_cron_access()    ACL     �   REVOKE ALL ON FUNCTION extensions.grant_pg_cron_access() FROM postgres;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO dashboard_user;
       
   extensions          postgres    false    711            /           1255    16680    grant_pg_graphql_access()    FUNCTION     j  CREATE FUNCTION extensions.grant_pg_graphql_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
DECLARE
    func_is_graphql_resolve bool;
BEGIN
    func_is_graphql_resolve = (
        SELECT n.proname = 'resolve'
        FROM pg_event_trigger_ddl_commands() AS ev
        LEFT JOIN pg_catalog.pg_proc AS n
        ON ev.objid = n.oid
    );

    IF func_is_graphql_resolve
    THEN
        -- Update public wrapper to pass all arguments through to the pg_graphql resolve func
        DROP FUNCTION IF EXISTS graphql_public.graphql;
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language sql
        as $$
            select graphql.resolve(
                query := query,
                variables := coalesce(variables, '{}'),
                "operationName" := "operationName",
                extensions := extensions
            );
        $$;

        -- This hook executes when `graphql.resolve` is created. That is not necessarily the last
        -- function in the extension so we need to grant permissions on existing entities AND
        -- update default permissions to any others that are created after `graphql.resolve`
        grant usage on schema graphql to postgres, anon, authenticated, service_role;
        grant select on all tables in schema graphql to postgres, anon, authenticated, service_role;
        grant execute on all functions in schema graphql to postgres, anon, authenticated, service_role;
        grant all on all sequences in schema graphql to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on tables to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on functions to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on sequences to postgres, anon, authenticated, service_role;
    END IF;

END;
$_$;
 4   DROP FUNCTION extensions.grant_pg_graphql_access();
    
   extensions          supabase_admin    false    31            B           0    0 "   FUNCTION grant_pg_graphql_access()    COMMENT     [   COMMENT ON FUNCTION extensions.grant_pg_graphql_access() IS 'Grants access to pg_graphql';
       
   extensions          supabase_admin    false    559            C           0    0 "   FUNCTION grant_pg_graphql_access()    ACL     Z   GRANT ALL ON FUNCTION extensions.grant_pg_graphql_access() TO postgres WITH GRANT OPTION;
       
   extensions          supabase_admin    false    559                       1255    16562    grant_pg_net_access()    FUNCTION     @  CREATE FUNCTION extensions.grant_pg_net_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
  BEGIN
    IF EXISTS (
      SELECT 1
      FROM pg_event_trigger_ddl_commands() AS ev
      JOIN pg_extension AS ext
      ON ev.objid = ext.oid
      WHERE ext.extname = 'pg_net'
    )
    THEN
      GRANT USAGE ON SCHEMA net TO supabase_functions_admin, postgres, anon, authenticated, service_role;
      ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;
      ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;
      ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;
      ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;
      REVOKE ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;
      REVOKE ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;
      GRANT EXECUTE ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
      GRANT EXECUTE ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
    END IF;
  END;
  $$;
 0   DROP FUNCTION extensions.grant_pg_net_access();
    
   extensions          postgres    false    31            D           0    0    FUNCTION grant_pg_net_access()    COMMENT     S   COMMENT ON FUNCTION extensions.grant_pg_net_access() IS 'Grants access to pg_net';
       
   extensions          postgres    false    526            E           0    0    FUNCTION grant_pg_net_access()    ACL     �   REVOKE ALL ON FUNCTION extensions.grant_pg_net_access() FROM postgres;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO dashboard_user;
       
   extensions          postgres    false    526            F           0    0 !   FUNCTION hmac(bytea, bytea, text)    ACL     �   REVOKE ALL ON FUNCTION extensions.hmac(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO dashboard_user;
       
   extensions          postgres    false    542            G           0    0    FUNCTION hmac(text, text, text)    ACL     �   REVOKE ALL ON FUNCTION extensions.hmac(text, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO dashboard_user;
       
   extensions          postgres    false    541            H           0    0 U  FUNCTION pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT blk_read_time double precision, OUT blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision)    ACL     �  GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT blk_read_time double precision, OUT blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision) TO postgres WITH GRANT OPTION;
       
   extensions          supabase_admin    false    529            I           0    0 ^   FUNCTION pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone)    ACL     �   GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO postgres WITH GRANT OPTION;
       
   extensions          supabase_admin    false    528            J           0    0 G   FUNCTION pg_stat_statements_reset(userid oid, dbid oid, queryid bigint)    ACL        GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint) TO postgres WITH GRANT OPTION;
       
   extensions          supabase_admin    false    527            K           0    0 >   FUNCTION pgp_armor_headers(text, OUT key text, OUT value text)    ACL     G  REVOKE ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO dashboard_user;
       
   extensions          postgres    false    588            L           0    0    FUNCTION pgp_key_id(bytea)    ACL     �   REVOKE ALL ON FUNCTION extensions.pgp_key_id(bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO dashboard_user;
       
   extensions          postgres    false    583            M           0    0 &   FUNCTION pgp_pub_decrypt(bytea, bytea)    ACL     �   REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO dashboard_user;
       
   extensions          postgres    false    715            N           0    0 ,   FUNCTION pgp_pub_decrypt(bytea, bytea, text)    ACL       REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO dashboard_user;
       
   extensions          postgres    false    717            O           0    0 2   FUNCTION pgp_pub_decrypt(bytea, bytea, text, text)    ACL     #  REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO dashboard_user;
       
   extensions          postgres    false    719            P           0    0 ,   FUNCTION pgp_pub_decrypt_bytea(bytea, bytea)    ACL       REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO dashboard_user;
       
   extensions          postgres    false    716            Q           0    0 2   FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text)    ACL     #  REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO dashboard_user;
       
   extensions          postgres    false    718            R           0    0 8   FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text, text)    ACL     5  REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO dashboard_user;
       
   extensions          postgres    false    582            S           0    0 %   FUNCTION pgp_pub_encrypt(text, bytea)    ACL     �   REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO dashboard_user;
       
   extensions          postgres    false    535            T           0    0 +   FUNCTION pgp_pub_encrypt(text, bytea, text)    ACL       REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO dashboard_user;
       
   extensions          postgres    false    713            U           0    0 ,   FUNCTION pgp_pub_encrypt_bytea(bytea, bytea)    ACL       REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO dashboard_user;
       
   extensions          postgres    false    712            V           0    0 2   FUNCTION pgp_pub_encrypt_bytea(bytea, bytea, text)    ACL     #  REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO dashboard_user;
       
   extensions          postgres    false    714            W           0    0 %   FUNCTION pgp_sym_decrypt(bytea, text)    ACL     �   REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO dashboard_user;
       
   extensions          postgres    false    531            X           0    0 +   FUNCTION pgp_sym_decrypt(bytea, text, text)    ACL       REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO dashboard_user;
       
   extensions          postgres    false    533            Y           0    0 +   FUNCTION pgp_sym_decrypt_bytea(bytea, text)    ACL       REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO dashboard_user;
       
   extensions          postgres    false    532            Z           0    0 1   FUNCTION pgp_sym_decrypt_bytea(bytea, text, text)    ACL        REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO dashboard_user;
       
   extensions          postgres    false    534            [           0    0 $   FUNCTION pgp_sym_encrypt(text, text)    ACL     �   REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO dashboard_user;
       
   extensions          postgres    false    546            \           0    0 *   FUNCTION pgp_sym_encrypt(text, text, text)    ACL       REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO dashboard_user;
       
   extensions          postgres    false    597            ]           0    0 +   FUNCTION pgp_sym_encrypt_bytea(bytea, text)    ACL       REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO dashboard_user;
       
   extensions          postgres    false    596            ^           0    0 1   FUNCTION pgp_sym_encrypt_bytea(bytea, text, text)    ACL        REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO dashboard_user;
       
   extensions          postgres    false    598            &           1255    16671    pgrst_ddl_watch()    FUNCTION     >  CREATE FUNCTION extensions.pgrst_ddl_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  cmd record;
BEGIN
  FOR cmd IN SELECT * FROM pg_event_trigger_ddl_commands()
  LOOP
    IF cmd.command_tag IN (
      'CREATE SCHEMA', 'ALTER SCHEMA'
    , 'CREATE TABLE', 'CREATE TABLE AS', 'SELECT INTO', 'ALTER TABLE'
    , 'CREATE FOREIGN TABLE', 'ALTER FOREIGN TABLE'
    , 'CREATE VIEW', 'ALTER VIEW'
    , 'CREATE MATERIALIZED VIEW', 'ALTER MATERIALIZED VIEW'
    , 'CREATE FUNCTION', 'ALTER FUNCTION'
    , 'CREATE TRIGGER'
    , 'CREATE TYPE', 'ALTER TYPE'
    , 'CREATE RULE'
    , 'COMMENT'
    )
    -- don't notify in case of CREATE TEMP table or other objects created on pg_temp
    AND cmd.schema_name is distinct from 'pg_temp'
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;
 ,   DROP FUNCTION extensions.pgrst_ddl_watch();
    
   extensions          supabase_admin    false    31            _           0    0    FUNCTION pgrst_ddl_watch()    ACL     R   GRANT ALL ON FUNCTION extensions.pgrst_ddl_watch() TO postgres WITH GRANT OPTION;
       
   extensions          supabase_admin    false    550            W           1255    16672    pgrst_drop_watch()    FUNCTION       CREATE FUNCTION extensions.pgrst_drop_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  obj record;
BEGIN
  FOR obj IN SELECT * FROM pg_event_trigger_dropped_objects()
  LOOP
    IF obj.object_type IN (
      'schema'
    , 'table'
    , 'foreign table'
    , 'view'
    , 'materialized view'
    , 'function'
    , 'trigger'
    , 'type'
    , 'rule'
    )
    AND obj.is_temporary IS false -- no pg_temp objects
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;
 -   DROP FUNCTION extensions.pgrst_drop_watch();
    
   extensions          supabase_admin    false    31            `           0    0    FUNCTION pgrst_drop_watch()    ACL     S   GRANT ALL ON FUNCTION extensions.pgrst_drop_watch() TO postgres WITH GRANT OPTION;
       
   extensions          supabase_admin    false    599            )           1255    16682    set_graphql_placeholder()    FUNCTION     r  CREATE FUNCTION extensions.set_graphql_placeholder() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
    DECLARE
    graphql_is_dropped bool;
    BEGIN
    graphql_is_dropped = (
        SELECT ev.schema_name = 'graphql_public'
        FROM pg_event_trigger_dropped_objects() AS ev
        WHERE ev.schema_name = 'graphql_public'
    );

    IF graphql_is_dropped
    THEN
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language plpgsql
        as $$
            DECLARE
                server_version float;
            BEGIN
                server_version = (SELECT (SPLIT_PART((select version()), ' ', 2))::float);

                IF server_version >= 14 THEN
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql extension is not enabled.'
                            )
                        )
                    );
                ELSE
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql is only available on projects running Postgres 14 onwards.'
                            )
                        )
                    );
                END IF;
            END;
        $$;
    END IF;

    END;
$_$;
 4   DROP FUNCTION extensions.set_graphql_placeholder();
    
   extensions          supabase_admin    false    31            a           0    0 "   FUNCTION set_graphql_placeholder()    COMMENT     |   COMMENT ON FUNCTION extensions.set_graphql_placeholder() IS 'Reintroduces placeholder function for graphql_public.graphql';
       
   extensions          supabase_admin    false    553            b           0    0 "   FUNCTION set_graphql_placeholder()    ACL     Z   GRANT ALL ON FUNCTION extensions.set_graphql_placeholder() TO postgres WITH GRANT OPTION;
       
   extensions          supabase_admin    false    553            c           0    0 8   FUNCTION sign(payload json, secret text, algorithm text)    ACL     5  REVOKE ALL ON FUNCTION extensions.sign(payload json, secret text, algorithm text) FROM postgres;
GRANT ALL ON FUNCTION extensions.sign(payload json, secret text, algorithm text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.sign(payload json, secret text, algorithm text) TO dashboard_user;
       
   extensions          postgres    false    595            d           0    0 "   FUNCTION try_cast_double(inp text)    ACL     �   REVOKE ALL ON FUNCTION extensions.try_cast_double(inp text) FROM postgres;
GRANT ALL ON FUNCTION extensions.try_cast_double(inp text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.try_cast_double(inp text) TO dashboard_user;
       
   extensions          postgres    false    517            e           0    0    FUNCTION url_decode(data text)    ACL     �   REVOKE ALL ON FUNCTION extensions.url_decode(data text) FROM postgres;
GRANT ALL ON FUNCTION extensions.url_decode(data text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.url_decode(data text) TO dashboard_user;
       
   extensions          postgres    false    594            f           0    0    FUNCTION url_encode(data bytea)    ACL     �   REVOKE ALL ON FUNCTION extensions.url_encode(data bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.url_encode(data bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.url_encode(data bytea) TO dashboard_user;
       
   extensions          postgres    false    593            g           0    0    FUNCTION uuid_generate_v1()    ACL     �   REVOKE ALL ON FUNCTION extensions.uuid_generate_v1() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO dashboard_user;
       
   extensions          postgres    false    502            h           0    0    FUNCTION uuid_generate_v1mc()    ACL     �   REVOKE ALL ON FUNCTION extensions.uuid_generate_v1mc() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO dashboard_user;
       
   extensions          postgres    false    503            i           0    0 4   FUNCTION uuid_generate_v3(namespace uuid, name text)    ACL     )  REVOKE ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO dashboard_user;
       
   extensions          postgres    false    500            j           0    0    FUNCTION uuid_generate_v4()    ACL     �   REVOKE ALL ON FUNCTION extensions.uuid_generate_v4() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO dashboard_user;
       
   extensions          postgres    false    470            k           0    0 4   FUNCTION uuid_generate_v5(namespace uuid, name text)    ACL     )  REVOKE ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO dashboard_user;
       
   extensions          postgres    false    539            l           0    0    FUNCTION uuid_nil()    ACL     �   REVOKE ALL ON FUNCTION extensions.uuid_nil() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_nil() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_nil() TO dashboard_user;
       
   extensions          postgres    false    495            m           0    0    FUNCTION uuid_ns_dns()    ACL     �   REVOKE ALL ON FUNCTION extensions.uuid_ns_dns() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO dashboard_user;
       
   extensions          postgres    false    496            n           0    0    FUNCTION uuid_ns_oid()    ACL     �   REVOKE ALL ON FUNCTION extensions.uuid_ns_oid() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO dashboard_user;
       
   extensions          postgres    false    499            o           0    0    FUNCTION uuid_ns_url()    ACL     �   REVOKE ALL ON FUNCTION extensions.uuid_ns_url() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO dashboard_user;
       
   extensions          postgres    false    498            p           0    0    FUNCTION uuid_ns_x500()    ACL     �   REVOKE ALL ON FUNCTION extensions.uuid_ns_x500() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO dashboard_user;
       
   extensions          postgres    false    501            q           0    0 8   FUNCTION verify(token text, secret text, algorithm text)    ACL     5  REVOKE ALL ON FUNCTION extensions.verify(token text, secret text, algorithm text) FROM postgres;
GRANT ALL ON FUNCTION extensions.verify(token text, secret text, algorithm text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.verify(token text, secret text, algorithm text) TO dashboard_user;
       
   extensions          postgres    false    518            r           0    0 U   FUNCTION graphql("operationName" text, query text, variables jsonb, extensions jsonb)    ACL       GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO postgres;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO anon;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO authenticated;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO service_role;
          graphql_public          supabase_admin    false    561            s           0    0 V   FUNCTION http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer)    ACL     _  REVOKE ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;
GRANT ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin;
GRANT ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO anon;
GRANT ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO authenticated;
GRANT ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO service_role;
          net          postgres    false    564            t           0    0 c   FUNCTION http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer)    ACL     �  REVOKE ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;
GRANT ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin;
GRANT ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) TO anon;
GRANT ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) TO authenticated;
GRANT ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) TO service_role;
          net          postgres    false    572            �           1255    16386    get_auth(text)    FUNCTION     J  CREATE FUNCTION pgbouncer.get_auth(p_usename text) RETURNS TABLE(username text, password text)
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
BEGIN
    RAISE WARNING 'PgBouncer auth request: %', p_usename;

    RETURN QUERY
    SELECT usename::TEXT, passwd::TEXT FROM pg_catalog.pg_shadow
    WHERE usename = p_usename;
END;
$$;
 2   DROP FUNCTION pgbouncer.get_auth(p_usename text);
    	   pgbouncer          postgres    false    15            u           0    0 !   FUNCTION get_auth(p_usename text)    ACL     �   REVOKE ALL ON FUNCTION pgbouncer.get_auth(p_usename text) FROM PUBLIC;
GRANT ALL ON FUNCTION pgbouncer.get_auth(p_usename text) TO pgbouncer;
       	   pgbouncer          postgres    false    471            v           0    0 ]   FUNCTION crypto_aead_det_decrypt(message bytea, additional bytea, key_uuid uuid, nonce bytea)    ACL     �   GRANT ALL ON FUNCTION pgsodium.crypto_aead_det_decrypt(message bytea, additional bytea, key_uuid uuid, nonce bytea) TO service_role;
          pgsodium          pgsodium_keymaker    false    706            w           0    0 ]   FUNCTION crypto_aead_det_encrypt(message bytea, additional bytea, key_uuid uuid, nonce bytea)    ACL     �   GRANT ALL ON FUNCTION pgsodium.crypto_aead_det_encrypt(message bytea, additional bytea, key_uuid uuid, nonce bytea) TO service_role;
          pgsodium          pgsodium_keymaker    false    707            x           0    0 !   FUNCTION crypto_aead_det_keygen()    ACL     I   GRANT ALL ON FUNCTION pgsodium.crypto_aead_det_keygen() TO service_role;
          pgsodium          supabase_admin    false    700            �           1255    31071    addProjectOnCreate()    FUNCTION     �   CREATE FUNCTION public."addProjectOnCreate"() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$BEGIN INSERT INTO user_learning_projects (learning_project_id, user_id)
VALUES (NEW.id, auth.uid());
RETURN NEW;
END;$$;
 -   DROP FUNCTION public."addProjectOnCreate"();
       public          supabase_admin    false            y           0    0    FUNCTION "addProjectOnCreate"()    ACL     �   GRANT ALL ON FUNCTION public."addProjectOnCreate"() TO postgres;
GRANT ALL ON FUNCTION public."addProjectOnCreate"() TO authenticated;
GRANT ALL ON FUNCTION public."addProjectOnCreate"() TO service_role;
          public          supabase_admin    false    728            �           1255    521316    check_user_achievements()    FUNCTION     (  CREATE FUNCTION public.check_user_achievements() RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    total_quiz_wins INTEGER;
    total_flashcard_wins INTEGER;
    total_time_quiz INTEGER;
    total_time_flashcards INTEGER;
    total_time_whiteboard INTEGER;
    flashcards_count INTEGER;
    exercises_count INTEGER;
    user_row profiles%ROWTYPE;
    learning_project_row user_learning_projects%ROWTYPE;
BEGIN
    -- Loop through all user IDs
    FOR user_row IN (SELECT id FROM profiles)
    LOOP
        -- Check cogni_victory_achievement
        SELECT
            SUM(CAST(stats->'winsQuiz' AS INTEGER)),
            SUM(CAST(stats->'winsFlashcards' AS INTEGER))
        INTO
            total_quiz_wins,
            total_flashcard_wins
        FROM
            user_learning_projects
        WHERE
            user_id = user_row.id;

        -- Check if cogni_victory_achievement is met and record doesn't exist
        IF total_quiz_wins >= 10 AND total_flashcard_wins >= 10
           AND NOT EXISTS (
                SELECT 1 FROM user_achievements WHERE achievement_id = 2 AND user_id = user_row.id
            ) THEN
            -- Insert record into user_achievements table for achievement_id 2
            INSERT INTO user_achievements (achievement_id, user_id) VALUES (2, user_row.id);
        END IF;

        -- Check cogni_hardo_achievement
        SELECT
            SUM(CAST(stats->'timeSpentQuiz' AS INTEGER)),
            SUM(CAST(stats->'timeSpentFlashcards' AS INTEGER)),
            SUM(CAST(stats->'timeSpentWhiteboard' AS INTEGER))
        INTO
            total_time_quiz,
            total_time_flashcards,
            total_time_whiteboard
        FROM
            user_learning_projects
        WHERE
            user_id = user_row.id;

        -- Check if cogni_hardo_achievement is met and record doesn't exist
        IF (total_time_quiz + total_time_flashcards + total_time_whiteboard) / 1000 / 60 / 60 > 250
           AND NOT EXISTS (
                SELECT 1 FROM user_achievements WHERE achievement_id = 3 AND user_id = user_row.id
            ) THEN
            -- Insert record into user_achievements table for achievement_id 3
            INSERT INTO user_achievements (achievement_id, user_id) VALUES (3, user_row.id);
        END IF;

        -- Loop over all learning projects for the given user
        FOR learning_project_row IN (SELECT * FROM user_learning_projects WHERE user_id = user_row.id)
        LOOP
            -- Get count for flashcards
            SELECT COUNT(*) INTO flashcards_count
            FROM flashcards
            JOIN sets ON set_id = sets.id AND sets.project_id = learning_project_row.learning_project_id;

            -- Get count for exercises
            SELECT COUNT(*) INTO exercises_count
            FROM exercises
            JOIN sets ON set_id = sets.id AND sets.project_id = learning_project_row.learning_project_id;

            -- Check conditions for each project and record doesn't exist
            IF flashcards_count > 50 AND exercises_count > 30
               AND NOT EXISTS (
                    SELECT 1 FROM user_achievements WHERE achievement_id = 4 AND user_id = user_row.id
                ) THEN
                -- Insert record into user_achievements table for achievement_id 4
                INSERT INTO user_achievements (achievement_id, user_id) VALUES (4, user_row.id);
                EXIT; -- Exit the loop if any project satisfies the conditions
            END IF;
        END LOOP;
    END LOOP;
END;
$$;
 0   DROP FUNCTION public.check_user_achievements();
       public          supabase_admin    false            z           0    0 "   FUNCTION check_user_achievements()    ACL       GRANT ALL ON FUNCTION public.check_user_achievements() TO postgres;
GRANT ALL ON FUNCTION public.check_user_achievements() TO anon;
GRANT ALL ON FUNCTION public.check_user_achievements() TO authenticated;
GRANT ALL ON FUNCTION public.check_user_achievements() TO service_role;
          public          supabase_admin    false    759            �           1255    85707    cleanup_rooms()    FUNCTION        CREATE FUNCTION public.cleanup_rooms() RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
declare
    candidate_room record;
begin -- cron job -- cleanup all rooms where nobody is inside or they are older than 6 hours
    for candidate_room in select *
                          from rooms r
                          where (not exists (select 1
                                             from profiles p
                                             where p.room_id = r.id))
                             or r.created_at < now() - interval '6 hours'
        loop
            update profiles p
            set room_id = null
            where p.room_id = candidate_room.id;

            delete
            from rooms r
            where r.id = candidate_room.id;
        end loop;
end;
$$;
 &   DROP FUNCTION public.cleanup_rooms();
       public          supabase_admin    false            {           0    0    FUNCTION cleanup_rooms()    ACL     �   GRANT ALL ON FUNCTION public.cleanup_rooms() TO postgres;
GRANT ALL ON FUNCTION public.cleanup_rooms() TO authenticated;
GRANT ALL ON FUNCTION public.cleanup_rooms() TO service_role;
          public          supabase_admin    false    743            �           1255    69636 =   create_room(bigint, integer, text, integer, integer, boolean)    FUNCTION     @  CREATE FUNCTION public.create_room(p_project_id bigint, p_code integer, p_name text, p_share_code integer, p_size integer, p_private boolean) RETURNS record
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
declare
    new_room rooms%rowtype;
begin
    -- check user is member of project or project is published
    if not exists (select 1
                   from user_learning_projects ulp
                   where learning_project_id = p_project_id
                     and user_id = auth.uid()) and
       exists(select 1 from learning_projects where is_published is false and id = p_project_id) then
        raise 'Project not found';
    end if;

    -- if user is in a room, leave it
    perform leave_room();

    -- insert new room
    insert into rooms (project_id, code, name, host, share_code, max_size, is_private)
    values (p_project_id, p_code, p_name, auth.uid(), p_share_code, p_size, p_private)
    returning * into new_room;

    -- link room to user (join)
    update profiles p
    set room_id = new_room.id
    where p.id = auth.uid();

    return new_room;
end;
$$;
 �   DROP FUNCTION public.create_room(p_project_id bigint, p_code integer, p_name text, p_share_code integer, p_size integer, p_private boolean);
       public          supabase_admin    false            |           0    0    FUNCTION create_room(p_project_id bigint, p_code integer, p_name text, p_share_code integer, p_size integer, p_private boolean)    ACL     �  GRANT ALL ON FUNCTION public.create_room(p_project_id bigint, p_code integer, p_name text, p_share_code integer, p_size integer, p_private boolean) TO postgres;
GRANT ALL ON FUNCTION public.create_room(p_project_id bigint, p_code integer, p_name text, p_share_code integer, p_size integer, p_private boolean) TO authenticated;
GRANT ALL ON FUNCTION public.create_room(p_project_id bigint, p_code integer, p_name text, p_share_code integer, p_size integer, p_private boolean) TO service_role;
          public          supabase_admin    false    740            �           1255    225046 -   delete_answers_exercise(public.answer_type[])    FUNCTION       CREATE FUNCTION public.delete_answers_exercise(answers public.answer_type[]) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
     --one of the answers within answers
     declare ans answer_type;
begin

    -- delete answers from answers_exercises
    foreach ans in array answers loop
        --´if answer is not in the table raise error
            if not exists(select 1 from answers_exercises where ans.exercise = answers_exercises.exercise and ans.order_position = answers_exercises.order_position) then
        raise 'row referenced by answers does not exist in answers_exercises';
    end if;
     delete from answers_exercises where ans.exercise = answers_exercises.exercise and ans.order_position = answers_exercises.order_position;
    end loop;


    return true;
end;
$$;
 L   DROP FUNCTION public.delete_answers_exercise(answers public.answer_type[]);
       public          supabase_admin    false    1665            }           0    0 >   FUNCTION delete_answers_exercise(answers public.answer_type[])    ACL     )  GRANT ALL ON FUNCTION public.delete_answers_exercise(answers public.answer_type[]) TO postgres;
GRANT ALL ON FUNCTION public.delete_answers_exercise(answers public.answer_type[]) TO authenticated;
GRANT ALL ON FUNCTION public.delete_answers_exercise(answers public.answer_type[]) TO service_role;
          public          supabase_admin    false    744            0           1255    52977    delete_friend(uuid)    FUNCTION     �  CREATE FUNCTION public.delete_friend(p_other_userid uuid) RETURNS boolean
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
begin
    -- check if current user is friends with other user
    if not exists(select 1 from friends where user_from_id = auth.uid() and user_to_id = p_other_userid) or
       not exists(select 1 from friends where user_to_id = auth.uid() and user_from_id = p_other_userid) then
        raise 'You are not friends with this user';
    end if;

    -- delete both friend pairs (A,B) and (B,A)
    delete from friends where user_from_id = auth.uid() and user_to_id = p_other_userid;
    delete from friends where user_to_id = auth.uid() and user_from_id = p_other_userid;

    return true;
end;
$$;
 9   DROP FUNCTION public.delete_friend(p_other_userid uuid);
       public          supabase_admin    false            ~           0    0 +   FUNCTION delete_friend(p_other_userid uuid)    ACL     �   GRANT ALL ON FUNCTION public.delete_friend(p_other_userid uuid) TO postgres;
GRANT ALL ON FUNCTION public.delete_friend(p_other_userid uuid) TO authenticated;
GRANT ALL ON FUNCTION public.delete_friend(p_other_userid uuid) TO service_role;
          public          supabase_admin    false    560            �           1255    459511    friend_relations()    FUNCTION     �  CREATE FUNCTION public.friend_relations() RETURNS TABLE(friend_array json[], sent_array json[], received_array json[])
    LANGUAGE plpgsql STABLE SECURITY DEFINER
    AS $$
declare
    friend_array   json[];
    sent_array     json[];
    received_array json[];
begin
    --friends
    select ARRAY_AGG(ROW_TO_JSON((SELECT r FROM (SELECT username, id) r)))
    into friend_array
    from friends f1
             join profiles p1 on f1.user_from_id = p1.id
    where (exists (select 1
                   from friends f2
                   where f1.user_from_id = f2.user_to_id
                     and f1.user_to_id = f2.user_from_id))
      and f1.user_to_id = auth.uid();
    -- remove duplicate rows (a,b) (b,a)
    --sent requests
    select ARRAY_AGG(ROW_TO_JSON((SELECT r FROM (SELECT username, id) r)))
    into sent_array
    from friends f1
             join profiles p1 on f1.user_to_id = p1.id
    where (not exists (select 1
                       from friends f2
                       where f1.user_from_id = f2.user_to_id
                         and f1.user_to_id = f2.user_from_id))
      and f1.user_from_id = auth.uid();
    --received requests
    select ARRAY_AGG(ROW_TO_JSON((SELECT r FROM (SELECT username, id) r)))
    into received_array
    from friends f1
             join profiles p1 on f1.user_from_id = p1.id
    where (not exists (select 1
                       from friends f2
                       where f1.user_to_id = f2.user_from_id
                         and f1.user_from_id = f2.user_to_id))
      and f1.user_to_id = auth.uid();
    -- Return the result
    RETURN QUERY SELECT friend_array, sent_array, received_array;
end;
$$;
 )   DROP FUNCTION public.friend_relations();
       public          supabase_admin    false                       0    0    FUNCTION friend_relations()    ACL     �   GRANT ALL ON FUNCTION public.friend_relations() TO postgres;
GRANT ALL ON FUNCTION public.friend_relations() TO anon;
GRANT ALL ON FUNCTION public.friend_relations() TO authenticated;
GRANT ALL ON FUNCTION public.friend_relations() TO service_role;
          public          supabase_admin    false    739            Z           1255    30644    getUsername(uuid)    FUNCTION     �   CREATE FUNCTION public."getUsername"(user_id uuid) RETURNS text
    LANGUAGE sql STABLE SECURITY DEFINER
    AS $$select username from profiles where id=user_id$$;
 2   DROP FUNCTION public."getUsername"(user_id uuid);
       public          supabase_admin    false            �           0    0 $   FUNCTION "getUsername"(user_id uuid)    ACL     �   GRANT ALL ON FUNCTION public."getUsername"(user_id uuid) TO postgres;
GRANT ALL ON FUNCTION public."getUsername"(user_id uuid) TO authenticated;
GRANT ALL ON FUNCTION public."getUsername"(user_id uuid) TO service_role;
          public          supabase_admin    false    602            �           1255    508581    get_achievements()    FUNCTION     �  CREATE FUNCTION public.get_achievements() RETURNS TABLE(achieved_achievements public.achievement_type[], not_achieved_achievements public.achievement_type[])
    LANGUAGE plpgsql STABLE SECURITY DEFINER
    AS $$
begin
    return query
        SELECT ARRAY(
                       SELECT ROW (id, name, description, icon_name)::achievement_type
                       from achievements
                                join user_achievements on achievements.id = user_achievements.achievement_id
                       where user_achievements.user_id = auth.uid()),
               ARRAY(
                       SELECT ROW (id, name, description, icon_name)::achievement_type
                       from achievements
                       where id not in (select achievement_id
                                        from user_achievements
                                        where user_id = auth.uid()));
end;
$$;
 )   DROP FUNCTION public.get_achievements();
       public          supabase_admin    false    1704            �           0    0    FUNCTION get_achievements()    ACL     �   GRANT ALL ON FUNCTION public.get_achievements() TO postgres;
GRANT ALL ON FUNCTION public.get_achievements() TO anon;
GRANT ALL ON FUNCTION public.get_achievements() TO authenticated;
GRANT ALL ON FUNCTION public.get_achievements() TO service_role;
          public          supabase_admin    false    741            �           1255    241422    get_distinct_project_groups()    FUNCTION       CREATE FUNCTION public.get_distinct_project_groups() RETURNS TABLE("group" text)
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
begin
    return query
        SELECT DISTINCT learning_projects.group
        FROM learning_projects
        WHERE is_published = TRUE;
end;
$$;
 4   DROP FUNCTION public.get_distinct_project_groups();
       public          supabase_admin    false            �           0    0 &   FUNCTION get_distinct_project_groups()    ACL     %  GRANT ALL ON FUNCTION public.get_distinct_project_groups() TO postgres;
GRANT ALL ON FUNCTION public.get_distinct_project_groups() TO anon;
GRANT ALL ON FUNCTION public.get_distinct_project_groups() TO authenticated;
GRANT ALL ON FUNCTION public.get_distinct_project_groups() TO service_role;
          public          supabase_admin    false    746            =           1255    384140    get_global_statistics(uuid)    FUNCTION     Z  CREATE FUNCTION public.get_global_statistics(p_user_id uuid) RETURNS TABLE(count_projects bigint, count_exercises bigint, count_flashcards bigint, count_links bigint, count_documents bigint, count_photos bigint, total_time_spent_quiz bigint, total_time_spent_flashcards bigint, total_time_spent_whiteboard bigint)
    LANGUAGE plpgsql SECURITY DEFINER
    AS $_$
DECLARE
    count_projects BIGINT;
    count_exercises BIGINT;
    count_flashcards BIGINT;
    count_links BIGINT;
    count_documents BIGINT;
    count_photos BIGINT;
    total_time_spent_quiz BIGINT;
    total_time_spent_flashcards BIGINT;
    total_time_spent_whiteboard BIGINT;
BEGIN
    -- Count learning projects
    SELECT count(*) INTO count_projects FROM user_learning_projects WHERE user_id = p_user_id;
    
    -- Count exercises
    SELECT count(*) INTO count_exercises FROM exercises
    JOIN sets ON exercises.set_id = sets.id
    JOIN user_learning_projects ON sets.project_id = user_learning_projects.learning_project_id
    WHERE user_id = p_user_id;

    -- Count flashcards
    SELECT count(*) INTO count_flashcards FROM flashcards
    JOIN sets ON flashcards.set_id = sets.id
    JOIN user_learning_projects ON sets.project_id = user_learning_projects.learning_project_id
    WHERE user_id = p_user_id;

    -- Count links
    SELECT count(*) INTO count_links FROM links
    JOIN user_learning_projects ON links.learning_project = user_learning_projects.learning_project_id
    WHERE user_id = p_user_id;

    -- Count documents
    SELECT COUNT(*) INTO count_documents
    FROM 
      storage.objects
      JOIN public.user_learning_projects ON
        CASE 
          WHEN storage.objects.path_tokens[1] ~ '^[0-9]+$'
          THEN CAST(storage.objects.path_tokens[1] AS BIGINT)
          ELSE NULL
        END = public.user_learning_projects.learning_project_id
    WHERE user_id = p_user_id
    AND path_tokens[2] = 'documents';


    -- Count photos
    SELECT COUNT(*) INTO count_photos
    FROM 
      storage.objects
      JOIN public.user_learning_projects ON
        CASE 
          WHEN storage.objects.path_tokens[1] ~ '^[0-9]+$'
          THEN CAST(storage.objects.path_tokens[1] AS BIGINT)
          ELSE NULL
        END = public.user_learning_projects.learning_project_id
    WHERE user_id = p_user_id
    AND path_tokens[2] = 'photos';

    -- Calculate total exercise time
    SELECT SUM((stats->'timeSpentQuiz')::INTEGER)::INTEGER INTO total_time_spent_quiz
    FROM public.user_learning_projects
    WHERE user_id = p_user_id;

    -- Calculate total flashard time
    SELECT SUM((stats->'timeSpentFlashcards')::INTEGER)::INTEGER INTO total_time_spent_flashcards
    FROM public.user_learning_projects
    WHERE user_id = p_user_id;

    -- Calculate total whiteboard time
    SELECT SUM((stats->'timeSpentWhiteboard')::INTEGER)::INTEGER INTO total_time_spent_whiteboard
    FROM public.user_learning_projects
    WHERE user_id = p_user_id;

   

    RETURN QUERY SELECT count_projects, count_exercises, count_flashcards, count_links, count_documents, count_photos, total_time_spent_quiz, total_time_spent_flashcards, total_time_spent_whiteboard;
END;
$_$;
 <   DROP FUNCTION public.get_global_statistics(p_user_id uuid);
       public          supabase_admin    false            �           0    0 .   FUNCTION get_global_statistics(p_user_id uuid)    ACL     E  GRANT ALL ON FUNCTION public.get_global_statistics(p_user_id uuid) TO postgres;
GRANT ALL ON FUNCTION public.get_global_statistics(p_user_id uuid) TO anon;
GRANT ALL ON FUNCTION public.get_global_statistics(p_user_id uuid) TO authenticated;
GRANT ALL ON FUNCTION public.get_global_statistics(p_user_id uuid) TO service_role;
          public          supabase_admin    false    573            �           1255    401182 !   get_project_ratings(uuid, bigint)    FUNCTION     k  CREATE FUNCTION public.get_project_ratings(p_user_id uuid, p_project_id bigint) RETURNS TABLE(user_rating bigint, count_all_ratings bigint, avg_rating double precision, individual_ratings_arr record)
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    user_rating BIGINT;
    count_all_ratings BIGINT;
    avg_rating FLOAT;
    individual_ratings_arr RECORD;
BEGIN
    -- Get user's own rating
    SELECT rating INTO user_rating FROM project_ratings WHERE (project_id = p_project_id AND user_id = p_user_id);
    
    -- Count amount of ratings 
    SELECT COUNT(*) INTO count_all_ratings FROM project_ratings WHERE project_id = p_project_id;

    -- Calculate the average rating of the project
    SELECT AVG(rating) INTO avg_rating FROM project_ratings WHERE project_id = p_project_id;

    -- Count the amounts of individual star ratings
    SELECT
    COUNT(CASE WHEN rating = 1 THEN rating END) AS count_One_Star,
    COUNT(CASE WHEN rating = 2 THEN rating END) AS count_Two_Star,
    COUNT(CASE WHEN rating = 3 THEN rating END) AS count_Three_Star,
    COUNT(CASE WHEN rating = 4 THEN rating END) AS count_Four_Star,
    COUNT(CASE WHEN rating = 5 THEN rating END) AS count_Five_Star
    FROM project_ratings WHERE project_id = p_project_id INTO individual_ratings_arr;


    RETURN QUERY SELECT user_rating, count_all_ratings, avg_rating, individual_ratings_arr;
END;
$$;
 O   DROP FUNCTION public.get_project_ratings(p_user_id uuid, p_project_id bigint);
       public          supabase_admin    false            �           0    0 A   FUNCTION get_project_ratings(p_user_id uuid, p_project_id bigint)    ACL     �  GRANT ALL ON FUNCTION public.get_project_ratings(p_user_id uuid, p_project_id bigint) TO postgres;
GRANT ALL ON FUNCTION public.get_project_ratings(p_user_id uuid, p_project_id bigint) TO anon;
GRANT ALL ON FUNCTION public.get_project_ratings(p_user_id uuid, p_project_id bigint) TO authenticated;
GRANT ALL ON FUNCTION public.get_project_ratings(p_user_id uuid, p_project_id bigint) TO service_role;
          public          supabase_admin    false    762            �           1255    384830 $   get_project_statistics(uuid, bigint)    FUNCTION     r  CREATE FUNCTION public.get_project_statistics(p_user_id uuid, p_project_id bigint) RETURNS TABLE(count_links bigint, count_flashcards bigint, count_exercises bigint, count_documents bigint, count_photos bigint, project_stats json, global_rank bigint, friends_rank bigint)
    LANGUAGE plpgsql SECURITY DEFINER
    AS $_$
DECLARE
    count_links BIGINT;
    count_flashcards BIGINT;
    count_exercises BIGINT;
    count_documents BIGINT;
    count_photos BIGINT;
    project_stats JSON;
    global_rank BIGINT;
    friends_rank BIGINT;
BEGIN
    -- Count links
    SELECT count(*) INTO count_links FROM links WHERE learning_project = p_project_id;
    
    -- Count flashcards
    SELECT count(*) INTO count_flashcards FROM flashcards JOIN sets ON set_id = sets.id AND sets.project_id = p_project_id;

    -- Count exercises
    SELECT count(*) INTO count_exercises FROM exercises JOIN sets ON set_id = sets.id AND sets.project_id = p_project_id;

    -- Count documents
    SELECT COUNT(*) INTO count_documents
    FROM 
      storage.objects
      JOIN public.user_learning_projects ON
        CASE 
          WHEN storage.objects.path_tokens[1] ~ '^[0-9]+$'
          THEN CAST(storage.objects.path_tokens[1] AS BIGINT)
          ELSE NULL
        END = public.user_learning_projects.learning_project_id
    WHERE user_id = p_user_id
    AND learning_project_id = p_project_id
    AND path_tokens[2] = 'documents';

    -- Count photos
    SELECT COUNT(*) INTO count_photos
    FROM 
      storage.objects
      JOIN public.user_learning_projects ON
        CASE 
          WHEN storage.objects.path_tokens[1] ~ '^[0-9]+$'
          THEN CAST(storage.objects.path_tokens[1] AS BIGINT)
          ELSE NULL
        END = public.user_learning_projects.learning_project_id
    WHERE user_id = p_user_id
    AND learning_project_id = p_project_id
    AND path_tokens[2] = 'photos';

    -- Calculate game stats
    SELECT stats INTO project_stats FROM user_learning_projects WHERE (user_id = p_user_id AND learning_project_id = p_project_id);

    -- Calculate the global rank of the user
    SELECT ranking_subquery.ranking INTO global_rank
    FROM (
        SELECT
            ulp.user_id,
            RANK() OVER (ORDER BY individual_score DESC)::INTEGER AS ranking
        FROM (
            SELECT
                ulp.user_id,
                SUM((stats -> 'scoreQuiz')::INTEGER + (stats -> 'scoreFlashcards')::INTEGER)::INTEGER AS individual_score
            FROM
                user_learning_projects AS ulp
            WHERE
                ulp.learning_project_id = p_project_id
            GROUP BY
                ulp.user_id
        ) AS ulp
    ) AS ranking_subquery
    WHERE ranking_subquery.user_id = p_user_id;


    -- Calculate the friends rank of the user
    SELECT ranking_subquery.ranking INTO friends_rank
        FROM (
            SELECT
            ulp.user_id,
            RANK() OVER (ORDER BY individual_score DESC)::INTEGER AS ranking
        FROM (
            SELECT
                DISTINCT ulp.user_id,
                (ulp.stats -> 'scoreQuiz')::INTEGER + (ulp.stats -> 'scoreFlashcards')::INTEGER AS individual_score
            FROM
                user_learning_projects ulp
            JOIN
                friends f ON ulp.user_id = f.user_from_id 
            WHERE
                (f.user_to_id = p_user_id OR f.user_from_id = p_user_id) AND
                (learning_project_id = p_project_id)
            ) AS ulp
        ) AS ranking_subquery
        WHERE ranking_subquery.user_id = p_user_id;

    RETURN QUERY SELECT count_links, count_flashcards, count_exercises, count_documents, count_photos, project_stats, global_rank, friends_rank;
END;
$_$;
 R   DROP FUNCTION public.get_project_statistics(p_user_id uuid, p_project_id bigint);
       public          supabase_admin    false            �           0    0 D   FUNCTION get_project_statistics(p_user_id uuid, p_project_id bigint)    ACL     �  GRANT ALL ON FUNCTION public.get_project_statistics(p_user_id uuid, p_project_id bigint) TO postgres;
GRANT ALL ON FUNCTION public.get_project_statistics(p_user_id uuid, p_project_id bigint) TO anon;
GRANT ALL ON FUNCTION public.get_project_statistics(p_user_id uuid, p_project_id bigint) TO authenticated;
GRANT ALL ON FUNCTION public.get_project_statistics(p_user_id uuid, p_project_id bigint) TO service_role;
          public          supabase_admin    false    742            A           1255    400554    get_public_projects()    FUNCTION     �  CREATE FUNCTION public.get_public_projects() RETURNS TABLE(project_id bigint, project_name text, project_description text, project_created_at timestamp with time zone, project_tags text, project_owner_id uuid, project_is_published boolean, project_owner_name text, project_avg_rating numeric)
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
BEGIN
   RETURN QUERY
      SELECT
            lp.id AS project_id,
            lp.name AS project_name,
            lp.description AS project_description,
            lp.created_at AS project_created_at,
            lp.tags AS project_tags,
            lp.owner_id AS project_owner_id,
            lp.is_published AS project_is_published,
            pr.username AS project_owner_name,
            COALESCE(AVG(pra.rating), 0) AS project_avg_rating
        FROM learning_projects lp
        JOIN profiles pr ON lp.owner_id = pr.id
        LEFT JOIN project_ratings pra ON lp.id = pra.project_id
        WHERE lp.is_published IS TRUE
        GROUP BY lp.id, pr.username;
END;
$$;
 ,   DROP FUNCTION public.get_public_projects();
       public          supabase_admin    false            �           0    0    FUNCTION get_public_projects()    ACL       GRANT ALL ON FUNCTION public.get_public_projects() TO postgres;
GRANT ALL ON FUNCTION public.get_public_projects() TO anon;
GRANT ALL ON FUNCTION public.get_public_projects() TO authenticated;
GRANT ALL ON FUNCTION public.get_public_projects() TO service_role;
          public          supabase_admin    false    577            �           1255    399314    get_recommendations(uuid)    FUNCTION     &  CREATE FUNCTION public.get_recommendations(p_user_id uuid) RETURNS TABLE(project_id bigint, project_name text, project_description text, project_created_at timestamp with time zone, project_tags text, project_owner_id uuid, project_is_published boolean, project_owner_name text, project_avg_rating numeric)
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
BEGIN
   RETURN QUERY
       SELECT
            limited_recommendations.id AS project_id,
            limited_recommendations.name AS project_name,
            limited_recommendations.description AS project_description,
            limited_recommendations.created_at AS project_created_at,
            limited_recommendations.tags AS project_tags,
            limited_recommendations.owner_id AS project_owner_id,
            limited_recommendations.is_published AS project_is_published,
            limited_recommendations.username AS project_owner_name,
            limited_recommendations.avg_rating AS project_avg_rating
FROM(
 SELECT
            recommendations.id,
            recommendations.name,
            recommendations.description,
            recommendations.created_at,
            recommendations.tags,
            recommendations.owner_id,
            recommendations.is_published,
            recommendations.username,
            recommendations.avg_rating,
            recommendations.random_order
    FROM (
       SELECT
    lp.id,
    lp.name,
    lp.description,
    lp.created_at,
    lp.tags,
    lp.owner_id,
    lp.is_published,
    pro.username,
    COALESCE(AVG(pra.rating), 0) AS avg_rating,
    RANDOM() AS random_order
FROM
    learning_projects lp
JOIN project_ratings pra ON lp.id = pra.project_id
JOIN user_learning_projects ulp ON lp.id = ulp.learning_project_id
JOIN profiles pro ON lp.owner_id = pro.id
WHERE
    lp.is_published IS TRUE
    AND ulp.user_id != p_user_id -- user is not member of recommended project 
    AND lp.owner_id != p_user_id -- user is not owner of recommended project
    AND (
        EXISTS ( -- lp tag matches one of user's personal tags
            SELECT 1
            FROM (
                SELECT UNNEST(string_to_array(user_tags, ',')) AS tag
                FROM profiles
                WHERE id = p_user_id
            ) AS user_tags
            WHERE lp.tags LIKE '%' || user_tags.tag || '%'
        )
        OR
        EXISTS ( -- lp tag matches one of lp tags user is already a member of
            SELECT 1
            FROM (
                SELECT UNNEST(string_to_array(lp.tags, ',')) AS tag
                FROM learning_projects lp
                JOIN user_learning_projects ulp ON lp.id = ulp.learning_project_id
                WHERE ulp.user_id = p_user_id
                  AND lp.tags <> ''
            ) AS project_tags
            WHERE lp.tags LIKE '%' || project_tags.tag || '%'
        )
    )
GROUP BY
    lp.id, pro.username
    ) AS recommendations
    ORDER BY
        recommendations.random_order DESC
    LIMIT 3) AS limited_recommendations -- scramble results and limit by 3 
ORDER BY project_avg_rating DESC; -- sort by highest rating desc

END;
$$;
 :   DROP FUNCTION public.get_recommendations(p_user_id uuid);
       public          supabase_admin    false            �           0    0 ,   FUNCTION get_recommendations(p_user_id uuid)    ACL     =  GRANT ALL ON FUNCTION public.get_recommendations(p_user_id uuid) TO postgres;
GRANT ALL ON FUNCTION public.get_recommendations(p_user_id uuid) TO anon;
GRANT ALL ON FUNCTION public.get_recommendations(p_user_id uuid) TO authenticated;
GRANT ALL ON FUNCTION public.get_recommendations(p_user_id uuid) TO service_role;
          public          supabase_admin    false    745            j           1255    53069    get_usernames(uuid[])    FUNCTION     �  CREATE FUNCTION public.get_usernames(user_ids uuid[]) RETURNS text[]
    LANGUAGE plpgsql STABLE SECURITY DEFINER
    AS $$
DECLARE
    result text[][];
begin
    SELECT ARRAY(
                   SELECT (id, username)::record
                   FROM profiles
                   WHERE id = ANY (user_ids)
           )
    INTO result;

    RETURN result;
end;
    -- select username
-- from profiles
-- where id = any (user_ids)
$$;
 5   DROP FUNCTION public.get_usernames(user_ids uuid[]);
       public          supabase_admin    false            �           0    0 '   FUNCTION get_usernames(user_ids uuid[])    ACL     �   GRANT ALL ON FUNCTION public.get_usernames(user_ids uuid[]) TO postgres;
GRANT ALL ON FUNCTION public.get_usernames(user_ids uuid[]) TO authenticated;
GRANT ALL ON FUNCTION public.get_usernames(user_ids uuid[]) TO service_role;
          public          supabase_admin    false    618            i           1255    36929    guard_learning_projects()    FUNCTION     v  CREATE FUNCTION public.guard_learning_projects() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$BEGIN
  IF NOT row_security_active(concat(TG_TABLE_SCHEMA, '.', TG_TABLE_NAME)) THEN
    RETURN NEW;
  END IF;

  IF NEW.owner_id <> OLD.owner_id THEN
    RAISE EXCEPTION 'changing "owner_id" is not allowed by client';
  END IF;

  RETURN NEW;
END;$$;
 0   DROP FUNCTION public.guard_learning_projects();
       public          supabase_admin    false            �           0    0 "   FUNCTION guard_learning_projects()    ACL       GRANT ALL ON FUNCTION public.guard_learning_projects() TO postgres;
GRANT ALL ON FUNCTION public.guard_learning_projects() TO anon;
GRANT ALL ON FUNCTION public.guard_learning_projects() TO authenticated;
GRANT ALL ON FUNCTION public.guard_learning_projects() TO service_role;
          public          supabase_admin    false    617            B           1255    45185    guard_profiles()    FUNCTION     j  CREATE FUNCTION public.guard_profiles() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$BEGIN
  IF NOT row_security_active(concat(TG_TABLE_SCHEMA, '.', TG_TABLE_NAME)) THEN
    RETURN NEW;
  END IF;

  IF NEW.room_id <> OLD.room_id THEN
    RAISE EXCEPTION 'changing "room_id" is not allowed by client';
  END IF;

  RETURN NEW;
END;$$;
 '   DROP FUNCTION public.guard_profiles();
       public          supabase_admin    false            �           0    0    FUNCTION guard_profiles()    ACL     �   GRANT ALL ON FUNCTION public.guard_profiles() TO postgres;
GRANT ALL ON FUNCTION public.guard_profiles() TO anon;
GRANT ALL ON FUNCTION public.guard_profiles() TO authenticated;
GRANT ALL ON FUNCTION public.guard_profiles() TO service_role;
          public          supabase_admin    false    578            �           1255    27608    handle_new_user()    FUNCTION     �   CREATE FUNCTION public.handle_new_user() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$ begin
insert into public.profiles (id, username)
values (
        new.id,
        new.raw_user_meta_data->>'username'
    );
return new;
end;
$$;
 (   DROP FUNCTION public.handle_new_user();
       public          supabase_admin    false            �           0    0    FUNCTION handle_new_user()    ACL     �   GRANT ALL ON FUNCTION public.handle_new_user() TO postgres;
GRANT ALL ON FUNCTION public.handle_new_user() TO anon;
GRANT ALL ON FUNCTION public.handle_new_user() TO authenticated;
GRANT ALL ON FUNCTION public.handle_new_user() TO service_role;
          public          supabase_admin    false    733            �           1255    510958    insert_achievement(bigint)    FUNCTION       CREATE FUNCTION public.insert_achievement(id bigint) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
begin
    if id = 9 then
        insert into user_achievements (achievement_id, user_id)
        values (id, auth.uid());
    end if;
end;
$$;
 4   DROP FUNCTION public.insert_achievement(id bigint);
       public          supabase_admin    false            �           0    0 &   FUNCTION insert_achievement(id bigint)    ACL     %  GRANT ALL ON FUNCTION public.insert_achievement(id bigint) TO postgres;
GRANT ALL ON FUNCTION public.insert_achievement(id bigint) TO anon;
GRANT ALL ON FUNCTION public.insert_achievement(id bigint) TO authenticated;
GRANT ALL ON FUNCTION public.insert_achievement(id bigint) TO service_role;
          public          supabase_admin    false    761            �           1255    53117 $   invite_user_to_project(bigint, uuid)    FUNCTION     U  CREATE FUNCTION public.invite_user_to_project(p_project_id bigint, p_other_user_id uuid) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
begin
    -- check if current user if owner of project
    if not exists (select 1
                   from learning_projects lp
                   where lp.owner_id = auth.uid()
                     and lp.id = p_project_id) then
        raise 'Only project owner can invite users';
    end if;

    -- link project to user
    insert into user_learning_projects (learning_project_id, user_id)
    values (p_project_id, p_other_user_id);
end;
$$;
 X   DROP FUNCTION public.invite_user_to_project(p_project_id bigint, p_other_user_id uuid);
       public          supabase_admin    false            �           0    0 J   FUNCTION invite_user_to_project(p_project_id bigint, p_other_user_id uuid)    ACL     �  GRANT ALL ON FUNCTION public.invite_user_to_project(p_project_id bigint, p_other_user_id uuid) TO postgres;
GRANT ALL ON FUNCTION public.invite_user_to_project(p_project_id bigint, p_other_user_id uuid) TO anon;
GRANT ALL ON FUNCTION public.invite_user_to_project(p_project_id bigint, p_other_user_id uuid) TO authenticated;
GRANT ALL ON FUNCTION public.invite_user_to_project(p_project_id bigint, p_other_user_id uuid) TO service_role;
          public          supabase_admin    false    726            '           1255    69332    join_room(uuid, bigint)    FUNCTION     �  CREATE FUNCTION public.join_room(p_room_id uuid, p_room_code bigint) RETURNS record
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
declare
    new_room rooms%rowtype;
begin
    -- check code is valid for room if room is protected by code
    if exists(select 1
              from rooms
              where id = p_room_id
                and code is not null
                and code <> p_room_code) then
        raise 'Invalid room code';
    end if;

    -- check if room private -> only friends of host can join
    if exists(select 1 from rooms where id = p_room_id and is_private is true) then
        -- check if user is friend of host
        if not exists(select 1
                      from friends
                      where user_from_id = auth.uid()
                        and user_to_id = (select host from rooms where id = p_room_id)
                        and user_from_id = (select host from rooms where id = p_room_id)
                        and user_to_id = auth.uid())
        then
            raise 'Room is private. Only friends of the host can join.';
        end if;
    end if;

    -- check max room size
    if exists(select 1
              from rooms
              where id = p_room_id
                and (select count(*) from profiles where room_id = p_room_id) >= max_size) then
        raise 'Room is full';
    end if;

    -- select all room info (incl secret key)
    select * from rooms where id = p_room_id into new_room;

    -- link room to user
    update profiles p
    set room_id = new_room.id
    where p.id = auth.uid();

    -- not needed tracked by rooms already. track join event for realtime updates
    --perform track('lobby_players'); -- todo: maybe use specific 'lobby_players:123'

    return new_room;
end;
$$;
 D   DROP FUNCTION public.join_room(p_room_id uuid, p_room_code bigint);
       public          supabase_admin    false            �           0    0 6   FUNCTION join_room(p_room_id uuid, p_room_code bigint)    ACL       GRANT ALL ON FUNCTION public.join_room(p_room_id uuid, p_room_code bigint) TO postgres;
GRANT ALL ON FUNCTION public.join_room(p_room_id uuid, p_room_code bigint) TO authenticated;
GRANT ALL ON FUNCTION public.join_room(p_room_id uuid, p_room_code bigint) TO service_role;
          public          supabase_admin    false    551            ?           1255    69425    leave_room()    FUNCTION     �  CREATE FUNCTION public.leave_room() RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
declare
    joinedRoomId uuid;
begin
    select room_id from profiles where id = auth.uid() into joinedRoomId;
    -- check if user is owner of current room
    if exists(select 1
              from rooms r
              where r.id = joinedRoomId
                and host = auth.uid()) then
        -- delete room_id from all users in room (kick all users)
        update profiles set room_id = null where room_id = joinedRoomId;
        -- delete room (close room)
        delete from rooms where id = joinedRoomId;
    else
        -- delete room_id from user (leave room)
        update profiles set room_id = null where id = auth.uid();
    end if;

    -- not needed. already tracked rooms. track join event for realtime updates
    -- perform track('lobby_players'); -- todo: maybe use specific 'lobby_players:123'
end;
$$;
 #   DROP FUNCTION public.leave_room();
       public          supabase_admin    false            �           0    0    FUNCTION leave_room()    ACL     �   GRANT ALL ON FUNCTION public.leave_room() TO postgres;
GRANT ALL ON FUNCTION public.leave_room() TO authenticated;
GRANT ALL ON FUNCTION public.leave_room() TO service_role;
          public          supabase_admin    false    575            �           1259    26804    friends    TABLE     �   CREATE TABLE public.friends (
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_from_id uuid NOT NULL,
    user_to_id uuid NOT NULL
);
    DROP TABLE public.friends;
       public         heap    supabase_admin    false            �           0    0    TABLE friends    COMMENT     K   COMMENT ON TABLE public.friends IS 'All friend connections between users';
          public          supabase_admin    false    433            �           0    0    TABLE friends    ACL     �   GRANT ALL ON TABLE public.friends TO postgres;
GRANT ALL ON TABLE public.friends TO anon;
GRANT ALL ON TABLE public.friends TO authenticated;
GRANT ALL ON TABLE public.friends TO service_role;
          public          supabase_admin    false    433            �           1255    53116    list_friends()    FUNCTION     }  CREATE FUNCTION public.list_friends() RETURNS SETOF public.friends
    LANGUAGE sql STABLE SECURITY DEFINER
    AS $$
select *
from friends f1
where (exists (select 1
               from friends f2
               where f1.user_from_id = f2.user_to_id
                 and f1.user_to_id = f2.user_from_id))
  and f1.user_to_id = auth.uid(); -- remove duplicate rows (a,b) (b,a)
$$;
 %   DROP FUNCTION public.list_friends();
       public          supabase_admin    false    433            �           0    0    FUNCTION list_friends()    ACL     �   GRANT ALL ON FUNCTION public.list_friends() TO postgres;
GRANT ALL ON FUNCTION public.list_friends() TO authenticated;
GRANT ALL ON FUNCTION public.list_friends() TO service_role;
          public          supabase_admin    false    727            �           1255    69417    list_friends_ids_and_names()    FUNCTION     �  CREATE FUNCTION public.list_friends_ids_and_names() RETURNS TABLE(id uuid, username text)
    LANGUAGE sql STABLE SECURITY DEFINER
    AS $$
select id, username
from friends f1 join profiles p1 on f1.user_from_id = p1.id
where (exists (select 1
               from  friends f2
               where f1.user_from_id = f2.user_to_id
                 and f1.user_to_id = f2.user_from_id))
   and f1.user_to_id = auth.uid(); -- remove duplicate rows (a,b) (b,a)
$$;
 3   DROP FUNCTION public.list_friends_ids_and_names();
       public          supabase_admin    false            �           0    0 %   FUNCTION list_friends_ids_and_names()    ACL     !  GRANT ALL ON FUNCTION public.list_friends_ids_and_names() TO postgres;
GRANT ALL ON FUNCTION public.list_friends_ids_and_names() TO anon;
GRANT ALL ON FUNCTION public.list_friends_ids_and_names() TO authenticated;
GRANT ALL ON FUNCTION public.list_friends_ids_and_names() TO service_role;
          public          supabase_admin    false    732            p           1255    69542    list_room_members()    FUNCTION       CREATE FUNCTION public.list_room_members() RETURNS TABLE(id uuid, username text)
    LANGUAGE plpgsql STABLE SECURITY DEFINER
    AS $$
begin
    -- check if current user is owner of room
--     if not exists (select 1
--                    from profiles p
--                             join rooms r on p.room_id = r.id
--                    where p.id = auth.uid()
--                      and r.host = auth.uid()) then
--         raise 'You are not the host of this room';
--     end if;

    -- return all members of room
    return query select p.id, p.username
                 from profiles p
                 where room_id = (select room_id
                                  from profiles pp
                                  where pp.id = auth.uid());
end;
$$;
 *   DROP FUNCTION public.list_room_members();
       public          supabase_admin    false            �           0    0    FUNCTION list_room_members()    ACL     �   GRANT ALL ON FUNCTION public.list_room_members() TO postgres;
GRANT ALL ON FUNCTION public.list_room_members() TO authenticated;
GRANT ALL ON FUNCTION public.list_room_members() TO service_role;
          public          supabase_admin    false    624            �           1255    69565    list_rooms()    FUNCTION     �  CREATE FUNCTION public.list_rooms() RETURNS TABLE(id uuid, name text, created_at timestamp with time zone, protected boolean, host uuid, hostname text, cursize integer, maxsize integer)
    LANGUAGE sql SECURITY DEFINER
    AS $$
select r.id,
       name,
       created_at,
       (case when code is null then false::bool else true::bool end) as "protected",
       r.host,
       p.username                                                    as "hostName",
       (select count(*) from public.profiles where room_id = r.id)   as "curSize",
       r.max_size                                                    as "maxSize"
from rooms r
         join public.profiles p on r.id = p.room_id and p.id = r.host
where r.is_ingame is false
order by created_at desc;
$$;
 #   DROP FUNCTION public.list_rooms();
       public          supabase_admin    false            �           0    0    FUNCTION list_rooms()    ACL     �   GRANT ALL ON FUNCTION public.list_rooms() TO postgres;
GRANT ALL ON FUNCTION public.list_rooms() TO authenticated;
GRANT ALL ON FUNCTION public.list_rooms() TO service_role;
          public          supabase_admin    false    753            �           1255    69638    list_sets()    FUNCTION     �  CREATE FUNCTION public.list_sets() RETURNS TABLE(name text, id bigint, type smallint)
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
begin
    -- check if user is member of project or project is public
    if not exists(select 1
                  from learning_projects lp
                           join public.rooms r on lp.id = r.project_id
                  where r.host = auth.uid()
                    and (
                          lp.is_published is true or lp.id in (select project_id
                                                               from user_learning_projects ulp
                                                               where ulp.user_id = auth.uid())
                      )) then
        raise 'User is not member of project, project is not public or no sets exist.';
    end if;

    return query select s.name, s.id, s.type
                 from sets s
                          join public.learning_projects l on l.id = s.project_id;
end;
$$;
 "   DROP FUNCTION public.list_sets();
       public          supabase_admin    false            �           0    0    FUNCTION list_sets()    ACL     �   GRANT ALL ON FUNCTION public.list_sets() TO postgres;
GRANT ALL ON FUNCTION public.list_sets() TO anon;
GRANT ALL ON FUNCTION public.list_sets() TO authenticated;
GRANT ALL ON FUNCTION public.list_sets() TO service_role;
          public          supabase_admin    false    758            �           1255    69568    project_members(bigint)    FUNCTION     �  CREATE FUNCTION public.project_members(p_project_id bigint) RETURNS TABLE(user_id uuid, username text)
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$

begin
    -- check user is owner of the project
    if not exists(select 1
                  from learning_projects lp
                  where owner_id = auth.uid()
                    and lp.id = p_project_id) then
        raise 'user is not owner of the project';
    end if;

    -- return all project members
    return query select ulp.user_id, p.username
                 from user_learning_projects ulp
                          join profiles p on ulp.user_id = p.id
                 where ulp.learning_project_id = p_project_id;
end;
$$;
 ;   DROP FUNCTION public.project_members(p_project_id bigint);
       public          supabase_admin    false            �           0    0 -   FUNCTION project_members(p_project_id bigint)    ACL     A  GRANT ALL ON FUNCTION public.project_members(p_project_id bigint) TO postgres;
GRANT ALL ON FUNCTION public.project_members(p_project_id bigint) TO anon;
GRANT ALL ON FUNCTION public.project_members(p_project_id bigint) TO authenticated;
GRANT ALL ON FUNCTION public.project_members(p_project_id bigint) TO service_role;
          public          supabase_admin    false    755            �           1259    26976    learning_projects    TABLE     �  CREATE TABLE public.learning_projects (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    name text NOT NULL,
    description text NOT NULL,
    "group" text NOT NULL,
    is_published boolean NOT NULL,
    owner_id uuid DEFAULT auth.uid(),
    tags text,
    CONSTRAINT check_group_format CHECK ((("group" = 'All'::text) OR ("group" ~ '^Summer \d{4}$'::text) OR ("group" ~ '^Winter \d{4}/\d{2}$'::text))),
    CONSTRAINT learning_projects_description_check CHECK ((length(description) < 1000)),
    CONSTRAINT learning_projects_name_check CHECK (((length(name) > 1) AND (length(name) < 100))),
    CONSTRAINT learning_projects_tags_check CHECK ((length(tags) < 250))
);
 %   DROP TABLE public.learning_projects;
       public         heap    supabase_admin    false    494            �           0    0    TABLE learning_projects    COMMENT     Z   COMMENT ON TABLE public.learning_projects IS 'All the data learning projects consist of';
          public          supabase_admin    false    437            �           0    0     COLUMN learning_projects."group"    COMMENT     O   COMMENT ON COLUMN public.learning_projects."group" IS 'sommersemester xx etc';
          public          supabase_admin    false    437            �           0    0 %   COLUMN learning_projects.is_published    COMMENT     v   COMMENT ON COLUMN public.learning_projects.is_published IS 'if project is public allow play/create room and cloning';
          public          supabase_admin    false    437            �           0    0 !   COLUMN learning_projects.owner_id    COMMENT     k   COMMENT ON COLUMN public.learning_projects.owner_id IS 'project owner. cannot be set by client (trigger)';
          public          supabase_admin    false    437            �           0    0    TABLE learning_projects    ACL     �   GRANT ALL ON TABLE public.learning_projects TO postgres;
GRANT ALL ON TABLE public.learning_projects TO anon;
GRANT ALL ON TABLE public.learning_projects TO authenticated;
GRANT ALL ON TABLE public.learning_projects TO service_role;
          public          supabase_admin    false    437            J           1255    85704    public_projects()    FUNCTION     �   CREATE FUNCTION public.public_projects() RETURNS SETOF public.learning_projects
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
begin
    return query
        select * from learning_projects where is_published is true;
end;
$$;
 (   DROP FUNCTION public.public_projects();
       public          supabase_admin    false    437            �           0    0    FUNCTION public_projects()    ACL     �   GRANT ALL ON FUNCTION public.public_projects() TO postgres;
GRANT ALL ON FUNCTION public.public_projects() TO anon;
GRANT ALL ON FUNCTION public.public_projects() TO authenticated;
GRANT ALL ON FUNCTION public.public_projects() TO service_role;
          public          supabase_admin    false    586            �           1255    126746    quick_join_room(bigint)    FUNCTION     K  CREATE FUNCTION public.quick_join_room(p_share_code bigint) RETURNS record
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
declare
    new_room rooms%rowtype;
begin
    -- check max room size
    if exists(select 1
              from rooms
              where share_code = p_share_code
                and (select count(*)
                     from profiles
                     where room_id = (select id
                                      from rooms
                                      where share_code = p_share_code)) >= max_size) then
        raise 'Room is full';
    end if;

    -- select all room info (incl secret key)
    select * from rooms where share_code = p_share_code into new_room;

    -- link room to user
    update profiles p
    set room_id = new_room.id
    where p.id = auth.uid();

    return new_room;
end;
$$;
 ;   DROP FUNCTION public.quick_join_room(p_share_code bigint);
       public          supabase_admin    false            �           0    0 -   FUNCTION quick_join_room(p_share_code bigint)    ACL     �   GRANT ALL ON FUNCTION public.quick_join_room(p_share_code bigint) TO postgres;
GRANT ALL ON FUNCTION public.quick_join_room(p_share_code bigint) TO authenticated;
GRANT ALL ON FUNCTION public.quick_join_room(p_share_code bigint) TO service_role;
          public          supabase_admin    false    754            �           1255    53118 &   remove_user_from_project(bigint, uuid)    FUNCTION     X  CREATE FUNCTION public.remove_user_from_project(p_project_id bigint, p_other_user_id uuid) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
begin
    -- check if current user if owner of project
    if not exists (select 1
                   from learning_projects lp
                   where lp.owner_id = auth.uid()
                     and lp.id = p_project_id) then
        raise 'Only project owner can remove users';
    end if;

    -- unlink project from user
    delete from user_learning_projects where learning_project_id = p_project_id and user_id = p_other_user_id;
end;
$$;
 Z   DROP FUNCTION public.remove_user_from_project(p_project_id bigint, p_other_user_id uuid);
       public          supabase_admin    false            �           0    0 L   FUNCTION remove_user_from_project(p_project_id bigint, p_other_user_id uuid)    ACL     �  GRANT ALL ON FUNCTION public.remove_user_from_project(p_project_id bigint, p_other_user_id uuid) TO postgres;
GRANT ALL ON FUNCTION public.remove_user_from_project(p_project_id bigint, p_other_user_id uuid) TO anon;
GRANT ALL ON FUNCTION public.remove_user_from_project(p_project_id bigint, p_other_user_id uuid) TO authenticated;
GRANT ALL ON FUNCTION public.remove_user_from_project(p_project_id bigint, p_other_user_id uuid) TO service_role;
          public          supabase_admin    false    729            �           1255    53319    search_user(text)    FUNCTION     �   CREATE FUNCTION public.search_user(search_query text) RETURNS record
    LANGUAGE sql SECURITY DEFINER
    AS $$SELECT username, id FROM profiles p WHERE search_query = p.username$$;
 5   DROP FUNCTION public.search_user(search_query text);
       public          supabase_admin    false            �           0    0 '   FUNCTION search_user(search_query text)    ACL     �   GRANT ALL ON FUNCTION public.search_user(search_query text) TO postgres;
GRANT ALL ON FUNCTION public.search_user(search_query text) TO authenticated;
GRANT ALL ON FUNCTION public.search_user(search_query text) TO service_role;
          public          supabase_admin    false    511            �           1255    233230    switch_locked_room()    FUNCTION     C  CREATE FUNCTION public.switch_locked_room() RETURNS boolean
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
declare
    joinedRoomId uuid;
begin
    select room_id from profiles where id = auth.uid() into joinedRoomId;
    -- check if user is owner of current room
    if exists(select 1
              from rooms r
              where r.id = joinedRoomId
                and host = auth.uid()) then
        -- switch locked (ingame) status
        if exists(select 1 from rooms where id = joinedRoomId and is_ingame is true) then
            update rooms set is_ingame = false where id = joinedRoomId;
            return false;
        else
            update rooms set is_ingame = true where id = joinedRoomId;
            return true;
        end if;
    else
        raise 'You are not the owner of this room';
    end if;
end;
$$;
 +   DROP FUNCTION public.switch_locked_room();
       public          supabase_admin    false            �           0    0    FUNCTION switch_locked_room()    ACL       GRANT ALL ON FUNCTION public.switch_locked_room() TO postgres;
GRANT ALL ON FUNCTION public.switch_locked_room() TO anon;
GRANT ALL ON FUNCTION public.switch_locked_room() TO authenticated;
GRANT ALL ON FUNCTION public.switch_locked_room() TO service_role;
          public          supabase_admin    false    756            �           1255    69666    track(text)    FUNCTION     y  CREATE FUNCTION public.track(p_key text) RETURNS void
    LANGUAGE plpgsql
    AS $$
begin -- update the last_updated column if the key already exists, otherwise insert a new row to trigger realtime updates
    insert into tracker (key, last_updated)
    values (p_key, now())
    on conflict (key) DO UPDATE SET last_updated = now() where excluded.key = tracker.key;
end;
$$;
 (   DROP FUNCTION public.track(p_key text);
       public          supabase_admin    false            �           0    0    FUNCTION track(p_key text)    ACL     �   GRANT ALL ON FUNCTION public.track(p_key text) TO postgres;
GRANT ALL ON FUNCTION public.track(p_key text) TO authenticated;
GRANT ALL ON FUNCTION public.track(p_key text) TO service_role;
          public          supabase_admin    false    473            �           1255    292310    transfer_project(text, bigint)    FUNCTION     �  CREATE FUNCTION public.transfer_project(p_owner_name text, p_project_id bigint) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
declare
    new_owner_id uuid;
begin
    -- check if current user is owner of the project
    if not exists(select 1 from learning_projects where id = p_project_id and owner_id = auth.uid()) then
        raise 'Only the project owner can transfer a project';
    end if;

    -- check if new owner exists
    select id from profiles where username = p_owner_name into new_owner_id;
    if new_owner_id is null then
        raise 'User % does not exist. Please check your spelling.', p_owner_name;
    end if;

    -- check if new owner and current user are friends
    if not (exists(select 1 from friends where user_to_id = auth.uid() and user_from_id = new_owner_id) and
            exists(select 1 from friends where user_to_id = new_owner_id and user_from_id = auth.uid())) then
        raise 'User % is not your friend. You can only transfer projects to your friends.', p_owner_name;
    end if;

    -- update owner
    update learning_projects set owner_id = new_owner_id where id = p_project_id;
end;
$$;
 O   DROP FUNCTION public.transfer_project(p_owner_name text, p_project_id bigint);
       public          supabase_admin    false            �           0    0 A   FUNCTION transfer_project(p_owner_name text, p_project_id bigint)    ACL     2  GRANT ALL ON FUNCTION public.transfer_project(p_owner_name text, p_project_id bigint) TO postgres;
GRANT ALL ON FUNCTION public.transfer_project(p_owner_name text, p_project_id bigint) TO authenticated;
GRANT ALL ON FUNCTION public.transfer_project(p_owner_name text, p_project_id bigint) TO service_role;
          public          supabase_admin    false    757            �           1255    69412    update_last_updated()    FUNCTION     �   CREATE FUNCTION public.update_last_updated() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    -- FIXME: parameterize the key!
    update tracker set last_updated = now() where key = 'rooms';
    return new;
END;
$$;
 ,   DROP FUNCTION public.update_last_updated();
       public          supabase_admin    false            �           0    0    FUNCTION update_last_updated()    ACL     �   GRANT ALL ON FUNCTION public.update_last_updated() TO postgres;
GRANT ALL ON FUNCTION public.update_last_updated() TO authenticated;
GRANT ALL ON FUNCTION public.update_last_updated() TO service_role;
          public          supabase_admin    false    730            �           1255    135400    update_statistics()    FUNCTION     �   CREATE FUNCTION public.update_statistics() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$BEGIN
PERFORM track('rate');
RETURN COALESCE(NEW, OLD);
END;$$;
 *   DROP FUNCTION public.update_statistics();
       public          supabase_admin    false            �           0    0    FUNCTION update_statistics()    ACL     �   GRANT ALL ON FUNCTION public.update_statistics() TO postgres;
GRANT ALL ON FUNCTION public.update_statistics() TO anon;
GRANT ALL ON FUNCTION public.update_statistics() TO authenticated;
GRANT ALL ON FUNCTION public.update_statistics() TO service_role;
          public          supabase_admin    false    760            �           1255    53207    apply_rls(jsonb, integer)    FUNCTION     �/  CREATE FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer DEFAULT (1024 * 1024)) RETURNS SETOF realtime.wal_rls
    LANGUAGE plpgsql
    AS $$
    declare
        -- Regclass of the table e.g. public.notes
        entity_ regclass = (quote_ident(wal ->> 'schema') || '.' || quote_ident(wal ->> 'table'))::regclass;

        -- I, U, D, T: insert, update ...
        action realtime.action = (
            case wal ->> 'action'
                when 'I' then 'INSERT'
                when 'U' then 'UPDATE'
                when 'D' then 'DELETE'
                else 'ERROR'
            end
        );

        -- Is row level security enabled for the table
        is_rls_enabled bool = relrowsecurity from pg_class where oid = entity_;

        subscriptions realtime.subscription[] = array_agg(subs)
            from
                realtime.subscription subs
            where
                subs.entity = entity_;

        -- Subscription vars
        roles regrole[] = array_agg(distinct us.claims_role)
            from
                unnest(subscriptions) us;

        working_role regrole;
        claimed_role regrole;
        claims jsonb;

        subscription_id uuid;
        subscription_has_access bool;
        visible_to_subscription_ids uuid[] = '{}';

        -- structured info for wal's columns
        columns realtime.wal_column[];
        -- previous identity values for update/delete
        old_columns realtime.wal_column[];

        error_record_exceeds_max_size boolean = octet_length(wal::text) > max_record_bytes;

        -- Primary jsonb output for record
        output jsonb;

    begin
        perform set_config('role', null, true);

        columns =
            array_agg(
                (
                    x->>'name',
                    x->>'type',
                    x->>'typeoid',
                    realtime.cast(
                        (x->'value') #>> '{}',
                        coalesce(
                            (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                            (x->>'type')::regtype
                        )
                    ),
                    (pks ->> 'name') is not null,
                    true
                )::realtime.wal_column
            )
            from
                jsonb_array_elements(wal -> 'columns') x
                left join jsonb_array_elements(wal -> 'pk') pks
                    on (x ->> 'name') = (pks ->> 'name');

        old_columns =
            array_agg(
                (
                    x->>'name',
                    x->>'type',
                    x->>'typeoid',
                    realtime.cast(
                        (x->'value') #>> '{}',
                        coalesce(
                            (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                            (x->>'type')::regtype
                        )
                    ),
                    (pks ->> 'name') is not null,
                    true
                )::realtime.wal_column
            )
            from
                jsonb_array_elements(wal -> 'identity') x
                left join jsonb_array_elements(wal -> 'pk') pks
                    on (x ->> 'name') = (pks ->> 'name');

        for working_role in select * from unnest(roles) loop

            -- Update `is_selectable` for columns and old_columns
            columns =
                array_agg(
                    (
                        c.name,
                        c.type_name,
                        c.type_oid,
                        c.value,
                        c.is_pkey,
                        pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
                    )::realtime.wal_column
                )
                from
                    unnest(columns) c;

            old_columns =
                    array_agg(
                        (
                            c.name,
                            c.type_name,
                            c.type_oid,
                            c.value,
                            c.is_pkey,
                            pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
                        )::realtime.wal_column
                    )
                    from
                        unnest(old_columns) c;

            if action <> 'DELETE' and count(1) = 0 from unnest(columns) c where c.is_pkey then
                return next (
                    jsonb_build_object(
                        'schema', wal ->> 'schema',
                        'table', wal ->> 'table',
                        'type', action
                    ),
                    is_rls_enabled,
                    -- subscriptions is already filtered by entity
                    (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
                    array['Error 400: Bad Request, no primary key']
                )::realtime.wal_rls;

            -- The claims role does not have SELECT permission to the primary key of entity
            elsif action <> 'DELETE' and sum(c.is_selectable::int) <> count(1) from unnest(columns) c where c.is_pkey then
                return next (
                    jsonb_build_object(
                        'schema', wal ->> 'schema',
                        'table', wal ->> 'table',
                        'type', action
                    ),
                    is_rls_enabled,
                    (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
                    array['Error 401: Unauthorized']
                )::realtime.wal_rls;

            else
                output = jsonb_build_object(
                    'schema', wal ->> 'schema',
                    'table', wal ->> 'table',
                    'type', action,
                    'commit_timestamp', to_char(
                        ((wal ->> 'timestamp')::timestamptz at time zone 'utc'),
                        'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"'
                    ),
                    'columns', (
                        select
                            jsonb_agg(
                                jsonb_build_object(
                                    'name', pa.attname,
                                    'type', pt.typname
                                )
                                order by pa.attnum asc
                            )
                        from
                            pg_attribute pa
                            join pg_type pt
                                on pa.atttypid = pt.oid
                        where
                            attrelid = entity_
                            and attnum > 0
                            and pg_catalog.has_column_privilege(working_role, entity_, pa.attname, 'SELECT')
                    )
                )
                -- Add "record" key for insert and update
                || case
                    when action in ('INSERT', 'UPDATE') then
                        jsonb_build_object(
                            'record',
                            (
                                select
                                    jsonb_object_agg(
                                        -- if unchanged toast, get column name and value from old record
                                        coalesce((c).name, (oc).name),
                                        case
                                            when (c).name is null then (oc).value
                                            else (c).value
                                        end
                                    )
                                from
                                    unnest(columns) c
                                    full outer join unnest(old_columns) oc
                                        on (c).name = (oc).name
                                where
                                    coalesce((c).is_selectable, (oc).is_selectable)
                                    and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                            )
                        )
                    else '{}'::jsonb
                end
                -- Add "old_record" key for update and delete
                || case
                    when action = 'UPDATE' then
                        jsonb_build_object(
                                'old_record',
                                (
                                    select jsonb_object_agg((c).name, (c).value)
                                    from unnest(old_columns) c
                                    where
                                        (c).is_selectable
                                        and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                                )
                            )
                    when action = 'DELETE' then
                        jsonb_build_object(
                            'old_record',
                            (
                                select jsonb_object_agg((c).name, (c).value)
                                from unnest(old_columns) c
                                where
                                    (c).is_selectable
                                    and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                                    and ( not is_rls_enabled or (c).is_pkey ) -- if RLS enabled, we can't secure deletes so filter to pkey
                            )
                        )
                    else '{}'::jsonb
                end;

                -- Create the prepared statement
                if is_rls_enabled and action <> 'DELETE' then
                    if (select 1 from pg_prepared_statements where name = 'walrus_rls_stmt' limit 1) > 0 then
                        deallocate walrus_rls_stmt;
                    end if;
                    execute realtime.build_prepared_statement_sql('walrus_rls_stmt', entity_, columns);
                end if;

                visible_to_subscription_ids = '{}';

                for subscription_id, claims in (
                        select
                            subs.subscription_id,
                            subs.claims
                        from
                            unnest(subscriptions) subs
                        where
                            subs.entity = entity_
                            and subs.claims_role = working_role
                            and (
                                realtime.is_visible_through_filters(columns, subs.filters)
                                or action = 'DELETE'
                            )
                ) loop

                    if not is_rls_enabled or action = 'DELETE' then
                        visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
                    else
                        -- Check if RLS allows the role to see the record
                        perform
                            set_config('role', working_role::text, true),
                            set_config('request.jwt.claims', claims::text, true);

                        execute 'execute walrus_rls_stmt' into subscription_has_access;

                        if subscription_has_access then
                            visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
                        end if;
                    end if;
                end loop;

                perform set_config('role', null, true);

                return next (
                    output,
                    is_rls_enabled,
                    visible_to_subscription_ids,
                    case
                        when error_record_exceeds_max_size then array['Error 413: Payload Too Large']
                        else '{}'
                    end
                )::realtime.wal_rls;

            end if;
        end loop;

        perform set_config('role', null, true);
    end;
    $$;
 G   DROP FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer);
       realtime          supabase_admin    false    65    1677            �           0    0 7   FUNCTION apply_rls(wal jsonb, max_record_bytes integer)    ACL     �   GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO dashboard_user;
          realtime          supabase_admin    false    737            �           1255    53219 C   build_prepared_statement_sql(text, regclass, realtime.wal_column[])    FUNCTION     �  CREATE FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) RETURNS text
    LANGUAGE sql
    AS $$
      /*
      Builds a sql string that, if executed, creates a prepared statement to
      tests retrive a row from *entity* by its primary key columns.
      Example
          select realtime.build_prepared_statement_sql('public.notes', '{"id"}'::text[], '{"bigint"}'::text[])
      */
          select
      'prepare ' || prepared_statement_name || ' as
          select
              exists(
                  select
                      1
                  from
                      ' || entity || '
                  where
                      ' || string_agg(quote_ident(pkc.name) || '=' || quote_nullable(pkc.value #>> '{}') , ' and ') || '
              )'
          from
              unnest(columns) pkc
          where
              pkc.is_pkey
          group by
              entity
      $$;
 �   DROP FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]);
       realtime          supabase_admin    false    65    1680            �           0    0 s   FUNCTION build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[])    ACL     4  GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO postgres;
GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO dashboard_user;
          realtime          supabase_admin    false    504            �           1255    53169    cast(text, regtype)    FUNCTION       CREATE FUNCTION realtime."cast"(val text, type_ regtype) RETURNS jsonb
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    declare
      res jsonb;
    begin
      execute format('select to_jsonb(%L::'|| type_::text || ')', val)  into res;
      return res;
    end
    $$;
 8   DROP FUNCTION realtime."cast"(val text, type_ regtype);
       realtime          supabase_admin    false    65            �           0    0 (   FUNCTION "cast"(val text, type_ regtype)    ACL     �   GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO postgres;
GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO dashboard_user;
          realtime          supabase_admin    false    731            �           1255    53164 <   check_equality_op(realtime.equality_op, regtype, text, text)    FUNCTION     U  CREATE FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) RETURNS boolean
    LANGUAGE plpgsql IMMUTABLE
    AS $$
      /*
      Casts *val_1* and *val_2* as type *type_* and check the *op* condition for truthiness
      */
      declare
          op_symbol text = (
              case
                  when op = 'eq' then '='
                  when op = 'neq' then '!='
                  when op = 'lt' then '<'
                  when op = 'lte' then '<='
                  when op = 'gt' then '>'
                  when op = 'gte' then '>='
                  when op = 'in' then '= any'
                  else 'UNKNOWN OP'
              end
          );
          res boolean;
      begin
          execute format(
              'select %L::'|| type_::text || ' ' || op_symbol
              || ' ( %L::'
              || (
                  case
                      when op = 'in' then type_::text || '[]'
                      else type_::text end
              )
              || ')', val_1, val_2) into res;
          return res;
      end;
      $$;
 j   DROP FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text);
       realtime          supabase_admin    false    65    1683            �           0    0 Z   FUNCTION check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text)    ACL       GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO postgres;
GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO dashboard_user;
          realtime          supabase_admin    false    505            �           1255    53215 Q   is_visible_through_filters(realtime.wal_column[], realtime.user_defined_filter[])    FUNCTION     �  CREATE FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$
    /*
    Should the record be visible (true) or filtered out (false) after *filters* are applied
    */
        select
            -- Default to allowed when no filters present
            $2 is null -- no filters. this should not happen because subscriptions has a default
            or array_length($2, 1) is null -- array length of an empty array is null
            or bool_and(
                coalesce(
                    realtime.check_equality_op(
                        op:=f.op,
                        type_:=coalesce(
                            col.type_oid::regtype, -- null when wal2json version <= 2.4
                            col.type_name::regtype
                        ),
                        -- cast jsonb to text
                        val_1:=col.value #>> '{}',
                        val_2:=f.value
                    ),
                    false -- if null, filter does not match
                )
            )
        from
            unnest(filters) f
            join unnest(columns) col
                on f.column_name = col.name;
    $_$;
 z   DROP FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]);
       realtime          supabase_admin    false    65    1686    1680            �           0    0 j   FUNCTION is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[])    ACL     "  GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO postgres;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO dashboard_user;
          realtime          supabase_admin    false    736            �           1255    53226 *   list_changes(name, name, integer, integer)    FUNCTION     �  CREATE FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) RETURNS SETOF realtime.wal_rls
    LANGUAGE sql
    SET log_min_messages TO 'fatal'
    AS $$
      with pub as (
        select
          concat_ws(
            ',',
            case when bool_or(pubinsert) then 'insert' else null end,
            case when bool_or(pubupdate) then 'update' else null end,
            case when bool_or(pubdelete) then 'delete' else null end
          ) as w2j_actions,
          coalesce(
            string_agg(
              realtime.quote_wal2json(format('%I.%I', schemaname, tablename)::regclass),
              ','
            ) filter (where ppt.tablename is not null and ppt.tablename not like '% %'),
            ''
          ) w2j_add_tables
        from
          pg_publication pp
          left join pg_publication_tables ppt
            on pp.pubname = ppt.pubname
        where
          pp.pubname = publication
        group by
          pp.pubname
        limit 1
      ),
      w2j as (
        select
          x.*, pub.w2j_add_tables
        from
          pub,
          pg_logical_slot_get_changes(
            slot_name, null, max_changes,
            'include-pk', 'true',
            'include-transaction', 'false',
            'include-timestamp', 'true',
            'include-type-oids', 'true',
            'format-version', '2',
            'actions', pub.w2j_actions,
            'add-tables', pub.w2j_add_tables
          ) x
      )
      select
        xyz.wal,
        xyz.is_rls_enabled,
        xyz.subscription_ids,
        xyz.errors
      from
        w2j,
        realtime.apply_rls(
          wal := w2j.data::jsonb,
          max_record_bytes := max_record_bytes
        ) xyz(wal, is_rls_enabled, subscription_ids, errors)
      where
        w2j.w2j_add_tables <> ''
        and xyz.subscription_ids[1] is not null
    $$;
 v   DROP FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer);
       realtime          supabase_admin    false    1677    65            �           0    0 f   FUNCTION list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer)    ACL       GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO dashboard_user;
          realtime          supabase_admin    false    738            �           1255    53163    quote_wal2json(regclass)    FUNCTION     �  CREATE FUNCTION realtime.quote_wal2json(entity regclass) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
      select
        (
          select string_agg('' || ch,'')
          from unnest(string_to_array(nsp.nspname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
        )
        || '.'
        || (
          select string_agg('' || ch,'')
          from unnest(string_to_array(pc.relname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
          )
      from
        pg_class pc
        join pg_namespace nsp
          on pc.relnamespace = nsp.oid
      where
        pc.oid = entity
    $$;
 8   DROP FUNCTION realtime.quote_wal2json(entity regclass);
       realtime          supabase_admin    false    65            �           0    0 (   FUNCTION quote_wal2json(entity regclass)    ACL     �   GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO postgres;
GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO dashboard_user;
          realtime          supabase_admin    false    734            �           1255    53161    subscription_check_filters()    FUNCTION     <
  CREATE FUNCTION realtime.subscription_check_filters() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    /*
    Validates that the user defined filters for a subscription:
    - refer to valid columns that the claimed role may access
    - values are coercable to the correct column type
    */
    declare
        col_names text[] = coalesce(
                array_agg(c.column_name order by c.ordinal_position),
                '{}'::text[]
            )
            from
                information_schema.columns c
            where
                format('%I.%I', c.table_schema, c.table_name)::regclass = new.entity
                and pg_catalog.has_column_privilege(
                    (new.claims ->> 'role'),
                    format('%I.%I', c.table_schema, c.table_name)::regclass,
                    c.column_name,
                    'SELECT'
                );
        filter realtime.user_defined_filter;
        col_type regtype;

        in_val jsonb;
    begin
        for filter in select * from unnest(new.filters) loop
            -- Filtered column is valid
            if not filter.column_name = any(col_names) then
                raise exception 'invalid column for filter %', filter.column_name;
            end if;

            -- Type is sanitized and safe for string interpolation
            col_type = (
                select atttypid::regtype
                from pg_catalog.pg_attribute
                where attrelid = new.entity
                      and attname = filter.column_name
            );
            if col_type is null then
                raise exception 'failed to lookup type for column %', filter.column_name;
            end if;

            -- Set maximum number of entries for in filter
            if filter.op = 'in'::realtime.equality_op then
                in_val = realtime.cast(filter.value, (col_type::text || '[]')::regtype);
                if coalesce(jsonb_array_length(in_val), 0) > 100 then
                    raise exception 'too many values for `in` filter. Maximum 100';
                end if;
            else
                -- raises an exception if value is not coercable to type
                perform realtime.cast(filter.value, col_type);
            end if;

        end loop;

        -- Apply consistent order to filters so the unique constraint on
        -- (subscription_id, entity, filters) can't be tricked by a different filter order
        new.filters = coalesce(
            array_agg(f order by f.column_name, f.op, f.value),
            '{}'
        ) from unnest(new.filters) f;

        return new;
    end;
    $$;
 5   DROP FUNCTION realtime.subscription_check_filters();
       realtime          supabase_admin    false    65            �           0    0 %   FUNCTION subscription_check_filters()    ACL     �   GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO postgres;
GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO dashboard_user;
          realtime          supabase_admin    false    506            �           1255    53196    to_regrole(text)    FUNCTION     �   CREATE FUNCTION realtime.to_regrole(role_name text) RETURNS regrole
    LANGUAGE sql IMMUTABLE
    AS $$ select role_name::regrole $$;
 3   DROP FUNCTION realtime.to_regrole(role_name text);
       realtime          supabase_admin    false    65            �           0    0 #   FUNCTION to_regrole(role_name text)    ACL     �   GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO postgres;
GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO dashboard_user;
          realtime          supabase_admin    false    735            �           1255    17924 *   can_insert_object(text, text, uuid, jsonb)    FUNCTION     �  CREATE FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO "storage"."objects" ("bucket_id", "name", "owner", "metadata") VALUES (bucketid, name, owner, metadata);
  -- hack to rollback the successful insert
  RAISE sqlstate 'PT200' using
  message = 'ROLLBACK',
  detail = 'rollback successful insert';
END
$$;
 _   DROP FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb);
       storage          supabase_storage_admin    false    32            �           1255    16549    extension(text)    FUNCTION     T  CREATE FUNCTION storage.extension(name text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
_filename text;
BEGIN
    select string_to_array(name, '/') into _parts;
    select _parts[array_length(_parts,1)] into _filename;
    -- @todo return the last part instead of 2
    return split_part(_filename, '.', 2);
END
$$;
 ,   DROP FUNCTION storage.extension(name text);
       storage          supabase_storage_admin    false    32            �           0    0    FUNCTION extension(name text)    ACL     K  GRANT ALL ON FUNCTION storage.extension(name text) TO anon;
GRANT ALL ON FUNCTION storage.extension(name text) TO authenticated;
GRANT ALL ON FUNCTION storage.extension(name text) TO service_role;
GRANT ALL ON FUNCTION storage.extension(name text) TO dashboard_user;
GRANT ALL ON FUNCTION storage.extension(name text) TO postgres;
          storage          supabase_storage_admin    false    488            �           1255    16548    filename(text)    FUNCTION     �   CREATE FUNCTION storage.filename(name text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
BEGIN
    select string_to_array(name, '/') into _parts;
    return _parts[array_length(_parts,1)];
END
$$;
 +   DROP FUNCTION storage.filename(name text);
       storage          supabase_storage_admin    false    32            �           0    0    FUNCTION filename(name text)    ACL     F  GRANT ALL ON FUNCTION storage.filename(name text) TO anon;
GRANT ALL ON FUNCTION storage.filename(name text) TO authenticated;
GRANT ALL ON FUNCTION storage.filename(name text) TO service_role;
GRANT ALL ON FUNCTION storage.filename(name text) TO dashboard_user;
GRANT ALL ON FUNCTION storage.filename(name text) TO postgres;
          storage          supabase_storage_admin    false    472            �           1255    16547    foldername(text)    FUNCTION     �   CREATE FUNCTION storage.foldername(name text) RETURNS text[]
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
BEGIN
    select string_to_array(name, '/') into _parts;
    return _parts[1:array_length(_parts,1)-1];
END
$$;
 -   DROP FUNCTION storage.foldername(name text);
       storage          supabase_storage_admin    false    32            �           0    0    FUNCTION foldername(name text)    ACL     P  GRANT ALL ON FUNCTION storage.foldername(name text) TO anon;
GRANT ALL ON FUNCTION storage.foldername(name text) TO authenticated;
GRANT ALL ON FUNCTION storage.foldername(name text) TO service_role;
GRANT ALL ON FUNCTION storage.foldername(name text) TO dashboard_user;
GRANT ALL ON FUNCTION storage.foldername(name text) TO postgres;
          storage          supabase_storage_admin    false    486            �           1255    17911    get_size_by_bucket()    FUNCTION        CREATE FUNCTION storage.get_size_by_bucket() RETURNS TABLE(size bigint, bucket_id text)
    LANGUAGE plpgsql
    AS $$
BEGIN
    return query
        select sum((metadata->>'size')::int) as size, obj.bucket_id
        from "storage".objects as obj
        group by obj.bucket_id;
END
$$;
 ,   DROP FUNCTION storage.get_size_by_bucket();
       storage          supabase_storage_admin    false    32            �           1255    17913 ?   search(text, text, integer, integer, integer, text, text, text)    FUNCTION     F  CREATE FUNCTION storage.search(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
declare
  v_order_by text;
  v_sort_order text;
begin
  case
    when sortcolumn = 'name' then
      v_order_by = 'name';
    when sortcolumn = 'updated_at' then
      v_order_by = 'updated_at';
    when sortcolumn = 'created_at' then
      v_order_by = 'created_at';
    when sortcolumn = 'last_accessed_at' then
      v_order_by = 'last_accessed_at';
    else
      v_order_by = 'name';
  end case;

  case
    when sortorder = 'asc' then
      v_sort_order = 'asc';
    when sortorder = 'desc' then
      v_sort_order = 'desc';
    else
      v_sort_order = 'asc';
  end case;

  v_order_by = v_order_by || ' ' || v_sort_order;

  return query execute
    'with folders as (
       select path_tokens[$1] as folder
       from storage.objects
         where objects.name ilike $2 || $3 || ''%''
           and bucket_id = $4
           and array_length(regexp_split_to_array(objects.name, ''/''), 1) <> $1
       group by folder
       order by folder ' || v_sort_order || '
     )
     (select folder as "name",
            null as id,
            null as updated_at,
            null as created_at,
            null as last_accessed_at,
            null as metadata from folders)
     union all
     (select path_tokens[$1] as "name",
            id,
            updated_at,
            created_at,
            last_accessed_at,
            metadata
     from storage.objects
     where objects.name ilike $2 || $3 || ''%''
       and bucket_id = $4
       and array_length(regexp_split_to_array(objects.name, ''/''), 1) = $1
     order by ' || v_order_by || ')
     limit $5
     offset $6' using levels, prefix, search, bucketname, limits, offsets;
end;
$_$;
 �   DROP FUNCTION storage.search(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text);
       storage          supabase_storage_admin    false    32            @           1255    426692    update_files()    FUNCTION     �  CREATE FUNCTION storage.update_files() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$

DECLARE
    key_to_track text;
BEGIN
    IF COALESCE(new.bucket_id, old.bucket_id) = 'files' THEN
        key_to_track := COALESCE(new.path_tokens[2], old.path_tokens[2]);
    ELSIF COALESCE(new.bucket_id, old.bucket_id) = 'profile-pictures' THEN
        key_to_track := COALESCE(new.path_tokens[1], old.path_tokens[1]);
    ELSE
        key_to_track := COALESCE(new.bucket_id, old.bucket_id);
    END IF;
    RAISE NOTICE 'Key to track: %', key_to_track;
    perform public.track(key_to_track);
    return COALESCE(new, old);
END;
$$;
 &   DROP FUNCTION storage.update_files();
       storage          supabase_admin    false    32            �           0    0    FUNCTION update_files()    ACL     �   GRANT ALL ON FUNCTION storage.update_files() TO postgres;
GRANT ALL ON FUNCTION storage.update_files() TO authenticated;
GRANT ALL ON FUNCTION storage.update_files() TO service_role;
          storage          supabase_admin    false    576            �           1255    17914    update_updated_at_column()    FUNCTION     �   CREATE FUNCTION storage.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW; 
END;
$$;
 2   DROP FUNCTION storage.update_updated_at_column();
       storage          supabase_storage_admin    false    32            
           1255    16632    http_request()    FUNCTION     �  CREATE FUNCTION supabase_functions.http_request() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'supabase_functions'
    AS $$
    DECLARE
      request_id bigint;
      payload jsonb;
      url text := TG_ARGV[0]::text;
      method text := TG_ARGV[1]::text;
      headers jsonb DEFAULT '{}'::jsonb;
      params jsonb DEFAULT '{}'::jsonb;
      timeout_ms integer DEFAULT 1000;
    BEGIN
      IF url IS NULL OR url = 'null' THEN
        RAISE EXCEPTION 'url argument is missing';
      END IF;

      IF method IS NULL OR method = 'null' THEN
        RAISE EXCEPTION 'method argument is missing';
      END IF;

      IF TG_ARGV[2] IS NULL OR TG_ARGV[2] = 'null' THEN
        headers = '{"Content-Type": "application/json"}'::jsonb;
      ELSE
        headers = TG_ARGV[2]::jsonb;
      END IF;

      IF TG_ARGV[3] IS NULL OR TG_ARGV[3] = 'null' THEN
        params = '{}'::jsonb;
      ELSE
        params = TG_ARGV[3]::jsonb;
      END IF;

      IF TG_ARGV[4] IS NULL OR TG_ARGV[4] = 'null' THEN
        timeout_ms = 1000;
      ELSE
        timeout_ms = TG_ARGV[4]::integer;
      END IF;

      CASE
        WHEN method = 'GET' THEN
          SELECT http_get INTO request_id FROM net.http_get(
            url,
            params,
            headers,
            timeout_ms
          );
        WHEN method = 'POST' THEN
          payload = jsonb_build_object(
            'old_record', OLD,
            'record', NEW,
            'type', TG_OP,
            'table', TG_TABLE_NAME,
            'schema', TG_TABLE_SCHEMA
          );

          SELECT http_post INTO request_id FROM net.http_post(
            url,
            payload,
            params,
            headers,
            timeout_ms
          );
        ELSE
          RAISE EXCEPTION 'method argument % is invalid', method;
      END CASE;

      INSERT INTO supabase_functions.hooks
        (hook_table_id, hook_name, request_id)
      VALUES
        (TG_RELID, TG_NAME, request_id);

      RETURN NEW;
    END
  $$;
 1   DROP FUNCTION supabase_functions.http_request();
       supabase_functions          supabase_functions_admin    false    28            �           0    0    FUNCTION http_request()    ACL     _  REVOKE ALL ON FUNCTION supabase_functions.http_request() FROM PUBLIC;
GRANT ALL ON FUNCTION supabase_functions.http_request() TO anon;
GRANT ALL ON FUNCTION supabase_functions.http_request() TO authenticated;
GRANT ALL ON FUNCTION supabase_functions.http_request() TO service_role;
GRANT ALL ON FUNCTION supabase_functions.http_request() TO postgres;
          supabase_functions          supabase_functions_admin    false    522            �           1255    17042    secrets_encrypt_secret_secret()    FUNCTION     (  CREATE FUNCTION vault.secrets_encrypt_secret_secret() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
		BEGIN
		        new.secret = CASE WHEN new.secret IS NULL THEN NULL ELSE
			CASE WHEN new.key_id IS NULL THEN NULL ELSE pg_catalog.encode(
			  pgsodium.crypto_aead_det_encrypt(
				pg_catalog.convert_to(new.secret, 'utf8'),
				pg_catalog.convert_to((new.id::text || new.description::text || new.created_at::text || new.updated_at::text)::text, 'utf8'),
				new.key_id::uuid,
				new.nonce
			  ),
				'base64') END END;
		RETURN new;
		END;
		$$;
 5   DROP FUNCTION vault.secrets_encrypt_secret_secret();
       vault          supabase_admin    false    44            �           1259    17263    billing_accounts    TABLE     \  CREATE TABLE _analytics.billing_accounts (
    id bigint NOT NULL,
    latest_successful_stripe_session jsonb,
    stripe_customer character varying(255),
    user_id bigint,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    stripe_subscriptions jsonb,
    stripe_invoices jsonb,
    "lifetime_plan?" boolean DEFAULT false,
    lifetime_plan_invoice character varying(255),
    default_payment_method character varying(255),
    custom_invoice_fields jsonb[] DEFAULT ARRAY[]::jsonb[],
    lifetime_plan boolean DEFAULT false NOT NULL
);
 (   DROP TABLE _analytics.billing_accounts;
    
   _analytics         heap    supabase_admin    false    45            �           1259    17262    billing_accounts_id_seq    SEQUENCE     �   CREATE SEQUENCE _analytics.billing_accounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE _analytics.billing_accounts_id_seq;
    
   _analytics          supabase_admin    false    389    45            �           0    0    billing_accounts_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE _analytics.billing_accounts_id_seq OWNED BY _analytics.billing_accounts.id;
       
   _analytics          supabase_admin    false    388            �           1259    17423    billing_counts    TABLE       CREATE TABLE _analytics.billing_counts (
    id bigint NOT NULL,
    node character varying(255),
    count integer,
    user_id bigint,
    source_id bigint,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);
 &   DROP TABLE _analytics.billing_counts;
    
   _analytics         heap    supabase_admin    false    45            �           1259    17422    billing_counts_id_seq    SEQUENCE     �   CREATE SEQUENCE _analytics.billing_counts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE _analytics.billing_counts_id_seq;
    
   _analytics          supabase_admin    false    403    45            �           0    0    billing_counts_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE _analytics.billing_counts_id_seq OWNED BY _analytics.billing_counts.id;
       
   _analytics          supabase_admin    false    402            �           1259    17406    endpoint_queries    TABLE     g  CREATE TABLE _analytics.endpoint_queries (
    id bigint NOT NULL,
    name character varying(255),
    token uuid,
    query text,
    user_id bigint,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    source_mapping jsonb DEFAULT '{}'::jsonb NOT NULL,
    sandboxable boolean DEFAULT false,
    cache_duration_seconds integer DEFAULT 3600,
    proactive_requerying_seconds integer DEFAULT 1800,
    max_limit integer DEFAULT 1000,
    enable_auth boolean DEFAULT false,
    sandbox_query_id bigint,
    language character varying(255) NOT NULL
);
 (   DROP TABLE _analytics.endpoint_queries;
    
   _analytics         heap    supabase_admin    false    45            �           1259    17405    endpoint_queries_id_seq    SEQUENCE     �   CREATE SEQUENCE _analytics.endpoint_queries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE _analytics.endpoint_queries_id_seq;
    
   _analytics          supabase_admin    false    45    401            �           0    0    endpoint_queries_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE _analytics.endpoint_queries_id_seq OWNED BY _analytics.endpoint_queries.id;
       
   _analytics          supabase_admin    false    400            y           1259    17108    oauth_access_grants    TABLE     �  CREATE TABLE _analytics.oauth_access_grants (
    id bigint NOT NULL,
    resource_owner_id integer NOT NULL,
    application_id bigint,
    token character varying(255) NOT NULL,
    expires_in integer NOT NULL,
    redirect_uri text NOT NULL,
    revoked_at timestamp(0) without time zone,
    scopes character varying(255),
    inserted_at timestamp(0) without time zone NOT NULL
);
 +   DROP TABLE _analytics.oauth_access_grants;
    
   _analytics         heap    supabase_admin    false    45            x           1259    17107    oauth_access_grants_id_seq    SEQUENCE     �   CREATE SEQUENCE _analytics.oauth_access_grants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE _analytics.oauth_access_grants_id_seq;
    
   _analytics          supabase_admin    false    377    45            �           0    0    oauth_access_grants_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE _analytics.oauth_access_grants_id_seq OWNED BY _analytics.oauth_access_grants.id;
       
   _analytics          supabase_admin    false    376            {           1259    17123    oauth_access_tokens    TABLE     "  CREATE TABLE _analytics.oauth_access_tokens (
    id bigint NOT NULL,
    application_id bigint,
    resource_owner_id integer,
    token character varying(255) NOT NULL,
    refresh_token character varying(255),
    expires_in integer,
    revoked_at timestamp(0) without time zone,
    scopes character varying(255),
    previous_refresh_token character varying(255) DEFAULT ''::character varying NOT NULL,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    description text
);
 +   DROP TABLE _analytics.oauth_access_tokens;
    
   _analytics         heap    supabase_admin    false    45            z           1259    17122    oauth_access_tokens_id_seq    SEQUENCE     �   CREATE SEQUENCE _analytics.oauth_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE _analytics.oauth_access_tokens_id_seq;
    
   _analytics          supabase_admin    false    45    379            �           0    0    oauth_access_tokens_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE _analytics.oauth_access_tokens_id_seq OWNED BY _analytics.oauth_access_tokens.id;
       
   _analytics          supabase_admin    false    378            w           1259    17096    oauth_applications    TABLE     �  CREATE TABLE _analytics.oauth_applications (
    id bigint NOT NULL,
    owner_id integer NOT NULL,
    name character varying(255) NOT NULL,
    uid character varying(255) NOT NULL,
    secret character varying(255) DEFAULT ''::character varying NOT NULL,
    redirect_uri character varying(255) NOT NULL,
    scopes character varying(255) DEFAULT ''::character varying NOT NULL,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);
 *   DROP TABLE _analytics.oauth_applications;
    
   _analytics         heap    supabase_admin    false    45            v           1259    17095    oauth_applications_id_seq    SEQUENCE     �   CREATE SEQUENCE _analytics.oauth_applications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE _analytics.oauth_applications_id_seq;
    
   _analytics          supabase_admin    false    375    45            �           0    0    oauth_applications_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE _analytics.oauth_applications_id_seq OWNED BY _analytics.oauth_applications.id;
       
   _analytics          supabase_admin    false    374            �           1259    17494    partner_users    TABLE     m   CREATE TABLE _analytics.partner_users (
    id bigint NOT NULL,
    partner_id bigint,
    user_id bigint
);
 %   DROP TABLE _analytics.partner_users;
    
   _analytics         heap    supabase_admin    false    45            �           1259    17493    partner_users_id_seq    SEQUENCE     �   CREATE SEQUENCE _analytics.partner_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE _analytics.partner_users_id_seq;
    
   _analytics          supabase_admin    false    45    409            �           0    0    partner_users_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE _analytics.partner_users_id_seq OWNED BY _analytics.partner_users.id;
       
   _analytics          supabase_admin    false    408            �           1259    17485    partners    TABLE     ^   CREATE TABLE _analytics.partners (
    id bigint NOT NULL,
    name bytea,
    token bytea
);
     DROP TABLE _analytics.partners;
    
   _analytics         heap    supabase_admin    false    45            �           1259    17484    partners_id_seq    SEQUENCE     |   CREATE SEQUENCE _analytics.partners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE _analytics.partners_id_seq;
    
   _analytics          supabase_admin    false    45    407            �           0    0    partners_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE _analytics.partners_id_seq OWNED BY _analytics.partners.id;
       
   _analytics          supabase_admin    false    406            �           1259    17362    payment_methods    TABLE     �  CREATE TABLE _analytics.payment_methods (
    id bigint NOT NULL,
    stripe_id character varying(255),
    price_id character varying(255),
    last_four character varying(255),
    brand character varying(255),
    exp_year integer,
    exp_month integer,
    customer_id character varying(255),
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);
 '   DROP TABLE _analytics.payment_methods;
    
   _analytics         heap    supabase_admin    false    45            �           1259    17361    payment_methods_id_seq    SEQUENCE     �   CREATE SEQUENCE _analytics.payment_methods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE _analytics.payment_methods_id_seq;
    
   _analytics          supabase_admin    false    45    397            �           0    0    payment_methods_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE _analytics.payment_methods_id_seq OWNED BY _analytics.payment_methods.id;
       
   _analytics          supabase_admin    false    396            �           1259    17304    plans    TABLE     �  CREATE TABLE _analytics.plans (
    id bigint NOT NULL,
    name character varying(255),
    stripe_id character varying(255),
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    period character varying(255),
    price integer,
    limit_sources integer,
    limit_rate_limit integer,
    limit_alert_freq integer,
    limit_source_rate_limit integer,
    limit_saved_search_limit integer,
    limit_team_users_limit integer,
    limit_source_fields_limit integer,
    limit_source_ttl bigint DEFAULT 259200000,
    type character varying(255) DEFAULT 'standard'::character varying
);
    DROP TABLE _analytics.plans;
    
   _analytics         heap    supabase_admin    false    45            �           1259    17303    plans_id_seq    SEQUENCE     y   CREATE SEQUENCE _analytics.plans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE _analytics.plans_id_seq;
    
   _analytics          supabase_admin    false    393    45            �           0    0    plans_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE _analytics.plans_id_seq OWNED BY _analytics.plans.id;
       
   _analytics          supabase_admin    false    392            u           1259    17081    rules    TABLE     �  CREATE TABLE _analytics.rules (
    id bigint NOT NULL,
    regex character varying(255),
    sink uuid NOT NULL,
    source_id bigint NOT NULL,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    regex_struct bytea,
    lql_string text DEFAULT ''::text NOT NULL,
    lql_filters bytea DEFAULT '\x836a'::bytea NOT NULL
);

ALTER TABLE ONLY _analytics.rules REPLICA IDENTITY FULL;
    DROP TABLE _analytics.rules;
    
   _analytics         heap    supabase_admin    false    45            t           1259    17080    rules_id_seq    SEQUENCE     y   CREATE SEQUENCE _analytics.rules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE _analytics.rules_id_seq;
    
   _analytics          supabase_admin    false    373    45            �           0    0    rules_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE _analytics.rules_id_seq OWNED BY _analytics.rules.id;
       
   _analytics          supabase_admin    false    372            �           1259    17288    saved_search_counters    TABLE       CREATE TABLE _analytics.saved_search_counters (
    id bigint NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    saved_search_id bigint NOT NULL,
    granularity text DEFAULT 'day'::text NOT NULL,
    non_tailing_count integer,
    tailing_count integer
);
 -   DROP TABLE _analytics.saved_search_counters;
    
   _analytics         heap    supabase_admin    false    45            �           1259    17287    saved_search_counters_id_seq    SEQUENCE     �   CREATE SEQUENCE _analytics.saved_search_counters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE _analytics.saved_search_counters_id_seq;
    
   _analytics          supabase_admin    false    45    391            �           0    0    saved_search_counters_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE _analytics.saved_search_counters_id_seq OWNED BY _analytics.saved_search_counters.id;
       
   _analytics          supabase_admin    false    390                       1259    17212    saved_searches    TABLE     �  CREATE TABLE _analytics.saved_searches (
    id bigint NOT NULL,
    querystring text,
    source_id bigint,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    saved_by_user boolean,
    lql_filters jsonb,
    lql_charts jsonb,
    "tailing?" boolean DEFAULT true NOT NULL,
    tailing boolean DEFAULT true NOT NULL
);
 &   DROP TABLE _analytics.saved_searches;
    
   _analytics         heap    supabase_admin    false    45            ~           1259    17211    saved_searches_id_seq    SEQUENCE     �   CREATE SEQUENCE _analytics.saved_searches_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE _analytics.saved_searches_id_seq;
    
   _analytics          supabase_admin    false    45    383            �           0    0    saved_searches_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE _analytics.saved_searches_id_seq OWNED BY _analytics.saved_searches.id;
       
   _analytics          supabase_admin    false    382            o           1259    17051    schema_migrations    TABLE     {   CREATE TABLE _analytics.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);
 )   DROP TABLE _analytics.schema_migrations;
    
   _analytics         heap    supabase_admin    false    45            �           1259    17584 6   schema_migrations_286c7e02_ef59_4427_aa49_2a873d36e1a1    TABLE     �   CREATE TABLE _analytics.schema_migrations_286c7e02_ef59_4427_aa49_2a873d36e1a1 (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);
 N   DROP TABLE _analytics.schema_migrations_286c7e02_ef59_4427_aa49_2a873d36e1a1;
    
   _analytics         heap    supabase_admin    false    45            �           1259    17524 6   schema_migrations_47498229_5dda_4c5b_888a_beb0e74df840    TABLE     �   CREATE TABLE _analytics.schema_migrations_47498229_5dda_4c5b_888a_beb0e74df840 (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);
 N   DROP TABLE _analytics.schema_migrations_47498229_5dda_4c5b_888a_beb0e74df840;
    
   _analytics         heap    supabase_admin    false    45            �           1259    17560 6   schema_migrations_773049a0_b37b_41cc_9169_a035ee907a7a    TABLE     �   CREATE TABLE _analytics.schema_migrations_773049a0_b37b_41cc_9169_a035ee907a7a (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);
 N   DROP TABLE _analytics.schema_migrations_773049a0_b37b_41cc_9169_a035ee907a7a;
    
   _analytics         heap    supabase_admin    false    45            �           1259    17572 6   schema_migrations_86d5aa1a_0d41_4995_90bc_7775bcad81b6    TABLE     �   CREATE TABLE _analytics.schema_migrations_86d5aa1a_0d41_4995_90bc_7775bcad81b6 (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);
 N   DROP TABLE _analytics.schema_migrations_86d5aa1a_0d41_4995_90bc_7775bcad81b6;
    
   _analytics         heap    supabase_admin    false    45            �           1259    17596 6   schema_migrations_abd25a45_5021_427a_8da2_c9602510c8b3    TABLE     �   CREATE TABLE _analytics.schema_migrations_abd25a45_5021_427a_8da2_c9602510c8b3 (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);
 N   DROP TABLE _analytics.schema_migrations_abd25a45_5021_427a_8da2_c9602510c8b3;
    
   _analytics         heap    supabase_admin    false    45            �           1259    17548 6   schema_migrations_bdc54c9d_cdb9_481c_a037_1c10a5143270    TABLE     �   CREATE TABLE _analytics.schema_migrations_bdc54c9d_cdb9_481c_a037_1c10a5143270 (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);
 N   DROP TABLE _analytics.schema_migrations_bdc54c9d_cdb9_481c_a037_1c10a5143270;
    
   _analytics         heap    supabase_admin    false    45            �           1259    17536 6   schema_migrations_c92eca35_8bde_4506_a1c4_5f7ea577f688    TABLE     �   CREATE TABLE _analytics.schema_migrations_c92eca35_8bde_4506_a1c4_5f7ea577f688 (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);
 N   DROP TABLE _analytics.schema_migrations_c92eca35_8bde_4506_a1c4_5f7ea577f688;
    
   _analytics         heap    supabase_admin    false    45            �           1259    17608 6   schema_migrations_c9a01889_2682_44b0_b4f0_5ae165845478    TABLE     �   CREATE TABLE _analytics.schema_migrations_c9a01889_2682_44b0_b4f0_5ae165845478 (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);
 N   DROP TABLE _analytics.schema_migrations_c9a01889_2682_44b0_b4f0_5ae165845478;
    
   _analytics         heap    supabase_admin    false    45            �           1259    17512 6   schema_migrations_f9289a41_9dcf_4964_b7a6_61ed321dd81a    TABLE     �   CREATE TABLE _analytics.schema_migrations_f9289a41_9dcf_4964_b7a6_61ed321dd81a (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);
 N   DROP TABLE _analytics.schema_migrations_f9289a41_9dcf_4964_b7a6_61ed321dd81a;
    
   _analytics         heap    supabase_admin    false    45            �           1259    17461    source_backends    TABLE     �   CREATE TABLE _analytics.source_backends (
    id bigint NOT NULL,
    source_id bigint,
    type character varying(255),
    config jsonb,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);
 '   DROP TABLE _analytics.source_backends;
    
   _analytics         heap    supabase_admin    false    45            �           1259    17460    source_backends_id_seq    SEQUENCE     �   CREATE SEQUENCE _analytics.source_backends_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE _analytics.source_backends_id_seq;
    
   _analytics          supabase_admin    false    405    45            �           0    0    source_backends_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE _analytics.source_backends_id_seq OWNED BY _analytics.source_backends.id;
       
   _analytics          supabase_admin    false    404            �           1259    17322    source_schemas    TABLE        CREATE TABLE _analytics.source_schemas (
    id bigint NOT NULL,
    bigquery_schema bytea,
    source_id bigint,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    schema_flat_map bytea
);
 &   DROP TABLE _analytics.source_schemas;
    
   _analytics         heap    supabase_admin    false    45            �           1259    17321    source_schemas_id_seq    SEQUENCE     �   CREATE SEQUENCE _analytics.source_schemas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE _analytics.source_schemas_id_seq;
    
   _analytics          supabase_admin    false    395    45            �           0    0    source_schemas_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE _analytics.source_schemas_id_seq OWNED BY _analytics.source_schemas.id;
       
   _analytics          supabase_admin    false    394            s           1259    17066    sources    TABLE     t  CREATE TABLE _analytics.sources (
    id bigint NOT NULL,
    name character varying(255),
    token uuid NOT NULL,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    user_id integer NOT NULL,
    public_token character varying(255),
    favorite boolean DEFAULT false NOT NULL,
    bigquery_table_ttl integer,
    api_quota integer DEFAULT 5 NOT NULL,
    webhook_notification_url character varying(255),
    slack_hook_url character varying(255),
    notifications jsonb DEFAULT '{"team_user_ids_for_sms": [], "team_user_ids_for_email": [], "user_text_notifications": false, "user_email_notifications": false, "other_email_notifications": null, "team_user_ids_for_schema_updates": [], "user_schema_update_notifications": true}'::jsonb NOT NULL,
    custom_event_message_keys character varying(255),
    log_events_updated_at timestamp(0) without time zone,
    bigquery_schema bytea,
    notifications_every integer DEFAULT 14400000,
    bq_table_partition_type text,
    lock_schema boolean DEFAULT false,
    validate_schema boolean DEFAULT true,
    drop_lql_filters bytea DEFAULT '\x836a'::bytea NOT NULL,
    drop_lql_string character varying(255),
    v2_pipeline boolean DEFAULT false,
    suggested_keys character varying(255) DEFAULT ''::character varying
);

ALTER TABLE ONLY _analytics.sources REPLICA IDENTITY FULL;
    DROP TABLE _analytics.sources;
    
   _analytics         heap    supabase_admin    false    45            r           1259    17065    sources_id_seq    SEQUENCE     {   CREATE SEQUENCE _analytics.sources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE _analytics.sources_id_seq;
    
   _analytics          supabase_admin    false    371    45            �           0    0    sources_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE _analytics.sources_id_seq OWNED BY _analytics.sources.id;
       
   _analytics          supabase_admin    false    370            }           1259    17201    system_metrics    TABLE     �   CREATE TABLE _analytics.system_metrics (
    id bigint NOT NULL,
    all_logs_logged bigint,
    node character varying(255),
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);
 &   DROP TABLE _analytics.system_metrics;
    
   _analytics         heap    supabase_admin    false    45            |           1259    17200    system_metrics_id_seq    SEQUENCE     �   CREATE SEQUENCE _analytics.system_metrics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE _analytics.system_metrics_id_seq;
    
   _analytics          supabase_admin    false    381    45            �           0    0    system_metrics_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE _analytics.system_metrics_id_seq OWNED BY _analytics.system_metrics.id;
       
   _analytics          supabase_admin    false    380            �           1259    17238 
   team_users    TABLE     l  CREATE TABLE _analytics.team_users (
    id bigint NOT NULL,
    email character varying(255),
    token character varying(255),
    provider character varying(255),
    email_preferred character varying(255),
    name character varying(255),
    image character varying(255),
    email_me_product boolean DEFAULT false NOT NULL,
    phone character varying(255),
    valid_google_account boolean DEFAULT false NOT NULL,
    provider_uid character varying(255),
    team_id bigint,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    preferences jsonb
);
 "   DROP TABLE _analytics.team_users;
    
   _analytics         heap    supabase_admin    false    45            �           1259    17237    team_users_id_seq    SEQUENCE     ~   CREATE SEQUENCE _analytics.team_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE _analytics.team_users_id_seq;
    
   _analytics          supabase_admin    false    387    45            �           0    0    team_users_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE _analytics.team_users_id_seq OWNED BY _analytics.team_users.id;
       
   _analytics          supabase_admin    false    386            �           1259    17226    teams    TABLE       CREATE TABLE _analytics.teams (
    id bigint NOT NULL,
    name character varying(255),
    user_id bigint,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    token character varying(255) DEFAULT gen_random_uuid()
);
    DROP TABLE _analytics.teams;
    
   _analytics         heap    supabase_admin    false    45            �           1259    17225    teams_id_seq    SEQUENCE     y   CREATE SEQUENCE _analytics.teams_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE _analytics.teams_id_seq;
    
   _analytics          supabase_admin    false    385    45            �           0    0    teams_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE _analytics.teams_id_seq OWNED BY _analytics.teams.id;
       
   _analytics          supabase_admin    false    384            q           1259    17057    users    TABLE     �  CREATE TABLE _analytics.users (
    id bigint NOT NULL,
    email character varying(255) NOT NULL,
    provider character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    api_key character varying(255) NOT NULL,
    old_api_key character varying(255),
    email_preferred character varying(255),
    name character varying(255),
    image character varying(255),
    email_me_product boolean DEFAULT true NOT NULL,
    admin boolean DEFAULT false NOT NULL,
    phone character varying(255),
    bigquery_project_id character varying(255),
    api_quota integer DEFAULT 125 NOT NULL,
    bigquery_dataset_location character varying(255),
    bigquery_dataset_id character varying(255),
    valid_google_account boolean,
    provider_uid character varying(255),
    company character varying(255),
    bigquery_udfs_hash character varying(255) DEFAULT ''::character varying NOT NULL,
    bigquery_processed_bytes_limit bigint DEFAULT '10000000000'::bigint NOT NULL,
    "billing_enabled?" boolean DEFAULT false NOT NULL,
    preferences jsonb,
    billing_enabled boolean DEFAULT false NOT NULL,
    endpoints_beta boolean DEFAULT false
);
    DROP TABLE _analytics.users;
    
   _analytics         heap    supabase_admin    false    45            p           1259    17056    users_id_seq    SEQUENCE     y   CREATE SEQUENCE _analytics.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE _analytics.users_id_seq;
    
   _analytics          supabase_admin    false    369    45            �           0    0    users_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE _analytics.users_id_seq OWNED BY _analytics.users.id;
       
   _analytics          supabase_admin    false    368            �           1259    17387    vercel_auths    TABLE     �  CREATE TABLE _analytics.vercel_auths (
    id bigint NOT NULL,
    access_token character varying(255),
    installation_id character varying(255),
    team_id character varying(255),
    token_type character varying(255),
    vercel_user_id character varying(255),
    user_id bigint,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);
 $   DROP TABLE _analytics.vercel_auths;
    
   _analytics         heap    supabase_admin    false    45            �           1259    17386    vercel_auths_id_seq    SEQUENCE     �   CREATE SEQUENCE _analytics.vercel_auths_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE _analytics.vercel_auths_id_seq;
    
   _analytics          supabase_admin    false    399    45            �           0    0    vercel_auths_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE _analytics.vercel_auths_id_seq OWNED BY _analytics.vercel_auths.id;
       
   _analytics          supabase_admin    false    398            �           1259    17875 
   extensions    TABLE       CREATE TABLE _realtime.extensions (
    id uuid NOT NULL,
    type character varying(255),
    settings jsonb,
    tenant_external_id character varying(255),
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);
 !   DROP TABLE _realtime.extensions;
    	   _realtime         heap    supabase_admin    false    14            �           1259    17861    schema_migrations    TABLE     z   CREATE TABLE _realtime.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);
 (   DROP TABLE _realtime.schema_migrations;
    	   _realtime         heap    supabase_admin    false    14            �           1259    17866    tenants    TABLE     �  CREATE TABLE _realtime.tenants (
    id uuid NOT NULL,
    name character varying(255),
    external_id character varying(255),
    jwt_secret character varying(500),
    max_concurrent_users integer DEFAULT 200 NOT NULL,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    max_events_per_second integer DEFAULT 100 NOT NULL,
    postgres_cdc_default character varying(255) DEFAULT 'postgres_cdc_rls'::character varying,
    max_bytes_per_second integer DEFAULT 100000 NOT NULL,
    max_channels_per_client integer DEFAULT 100 NOT NULL,
    max_joins_per_second integer DEFAULT 500 NOT NULL
);
    DROP TABLE _realtime.tenants;
    	   _realtime         heap    supabase_admin    false    14            P           1259    16488    audit_log_entries    TABLE     �   CREATE TABLE auth.audit_log_entries (
    instance_id uuid,
    id uuid NOT NULL,
    payload json,
    created_at timestamp with time zone,
    ip_address character varying(64) DEFAULT ''::character varying NOT NULL
);
 #   DROP TABLE auth.audit_log_entries;
       auth         heap    supabase_auth_admin    false    34            �           0    0    TABLE audit_log_entries    COMMENT     R   COMMENT ON TABLE auth.audit_log_entries IS 'Auth: Audit trail for user actions.';
          auth          supabase_auth_admin    false    336            �           0    0    TABLE audit_log_entries    ACL     t   GRANT ALL ON TABLE auth.audit_log_entries TO dashboard_user;
GRANT ALL ON TABLE auth.audit_log_entries TO postgres;
          auth          supabase_auth_admin    false    336            �           1259    17841 
   flow_state    TABLE     �  CREATE TABLE auth.flow_state (
    id uuid NOT NULL,
    user_id uuid,
    auth_code text NOT NULL,
    code_challenge_method auth.code_challenge_method NOT NULL,
    code_challenge text NOT NULL,
    provider_type text NOT NULL,
    provider_access_token text,
    provider_refresh_token text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    authentication_method text NOT NULL
);
    DROP TABLE auth.flow_state;
       auth         heap    supabase_auth_admin    false    34    1605            �           0    0    TABLE flow_state    COMMENT     G   COMMENT ON TABLE auth.flow_state IS 'stores metadata for pkce logins';
          auth          supabase_auth_admin    false    428            �           0    0    TABLE flow_state    ACL     f   GRANT ALL ON TABLE auth.flow_state TO postgres;
GRANT ALL ON TABLE auth.flow_state TO dashboard_user;
          auth          supabase_auth_admin    false    428            �           1259    17639 
   identities    TABLE     f  CREATE TABLE auth.identities (
    id text NOT NULL,
    user_id uuid NOT NULL,
    identity_data jsonb NOT NULL,
    provider text NOT NULL,
    last_sign_in_at timestamp with time zone,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    email text GENERATED ALWAYS AS (lower((identity_data ->> 'email'::text))) STORED
);
    DROP TABLE auth.identities;
       auth         heap    supabase_auth_admin    false    34            �           0    0    TABLE identities    COMMENT     U   COMMENT ON TABLE auth.identities IS 'Auth: Stores identities associated to a user.';
          auth          supabase_auth_admin    false    419            �           0    0    COLUMN identities.email    COMMENT     �   COMMENT ON COLUMN auth.identities.email IS 'Auth: Email is a generated column that references the optional email property in the identity_data';
          auth          supabase_auth_admin    false    419            �           0    0    TABLE identities    ACL     f   GRANT ALL ON TABLE auth.identities TO postgres;
GRANT ALL ON TABLE auth.identities TO dashboard_user;
          auth          supabase_auth_admin    false    419            O           1259    16481 	   instances    TABLE     �   CREATE TABLE auth.instances (
    id uuid NOT NULL,
    uuid uuid,
    raw_base_config text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);
    DROP TABLE auth.instances;
       auth         heap    supabase_auth_admin    false    34            �           0    0    TABLE instances    COMMENT     Q   COMMENT ON TABLE auth.instances IS 'Auth: Manages users across multiple sites.';
          auth          supabase_auth_admin    false    335            �           0    0    TABLE instances    ACL     d   GRANT ALL ON TABLE auth.instances TO dashboard_user;
GRANT ALL ON TABLE auth.instances TO postgres;
          auth          supabase_auth_admin    false    335            �           1259    17728    mfa_amr_claims    TABLE     �   CREATE TABLE auth.mfa_amr_claims (
    session_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    authentication_method text NOT NULL,
    id uuid NOT NULL
);
     DROP TABLE auth.mfa_amr_claims;
       auth         heap    supabase_auth_admin    false    34            �           0    0    TABLE mfa_amr_claims    COMMENT     ~   COMMENT ON TABLE auth.mfa_amr_claims IS 'auth: stores authenticator method reference claims for multi factor authentication';
          auth          supabase_auth_admin    false    423            �           0    0    TABLE mfa_amr_claims    ACL     n   GRANT ALL ON TABLE auth.mfa_amr_claims TO postgres;
GRANT ALL ON TABLE auth.mfa_amr_claims TO dashboard_user;
          auth          supabase_auth_admin    false    423            �           1259    17716    mfa_challenges    TABLE     �   CREATE TABLE auth.mfa_challenges (
    id uuid NOT NULL,
    factor_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    verified_at timestamp with time zone,
    ip_address inet NOT NULL
);
     DROP TABLE auth.mfa_challenges;
       auth         heap    supabase_auth_admin    false    34            �           0    0    TABLE mfa_challenges    COMMENT     _   COMMENT ON TABLE auth.mfa_challenges IS 'auth: stores metadata about challenge requests made';
          auth          supabase_auth_admin    false    422            �           0    0    TABLE mfa_challenges    ACL     n   GRANT ALL ON TABLE auth.mfa_challenges TO postgres;
GRANT ALL ON TABLE auth.mfa_challenges TO dashboard_user;
          auth          supabase_auth_admin    false    422            �           1259    17703    mfa_factors    TABLE     3  CREATE TABLE auth.mfa_factors (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    friendly_name text,
    factor_type auth.factor_type NOT NULL,
    status auth.factor_status NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    secret text
);
    DROP TABLE auth.mfa_factors;
       auth         heap    supabase_auth_admin    false    1578    1575    34            �           0    0    TABLE mfa_factors    COMMENT     L   COMMENT ON TABLE auth.mfa_factors IS 'auth: stores metadata about factors';
          auth          supabase_auth_admin    false    421            �           0    0    TABLE mfa_factors    ACL     h   GRANT ALL ON TABLE auth.mfa_factors TO postgres;
GRANT ALL ON TABLE auth.mfa_factors TO dashboard_user;
          auth          supabase_auth_admin    false    421            N           1259    16470    refresh_tokens    TABLE     8  CREATE TABLE auth.refresh_tokens (
    instance_id uuid,
    id bigint NOT NULL,
    token character varying(255),
    user_id character varying(255),
    revoked boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    parent character varying(255),
    session_id uuid
);
     DROP TABLE auth.refresh_tokens;
       auth         heap    supabase_auth_admin    false    34            �           0    0    TABLE refresh_tokens    COMMENT     n   COMMENT ON TABLE auth.refresh_tokens IS 'Auth: Store of tokens used to refresh JWT tokens once they expire.';
          auth          supabase_auth_admin    false    334            �           0    0    TABLE refresh_tokens    ACL     n   GRANT ALL ON TABLE auth.refresh_tokens TO dashboard_user;
GRANT ALL ON TABLE auth.refresh_tokens TO postgres;
          auth          supabase_auth_admin    false    334            M           1259    16469    refresh_tokens_id_seq    SEQUENCE     |   CREATE SEQUENCE auth.refresh_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE auth.refresh_tokens_id_seq;
       auth          supabase_auth_admin    false    334    34            �           0    0    refresh_tokens_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE auth.refresh_tokens_id_seq OWNED BY auth.refresh_tokens.id;
          auth          supabase_auth_admin    false    333            �           0    0    SEQUENCE refresh_tokens_id_seq    ACL     �   GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO dashboard_user;
GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO postgres;
          auth          supabase_auth_admin    false    333            �           1259    17770    saml_providers    TABLE     /  CREATE TABLE auth.saml_providers (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    entity_id text NOT NULL,
    metadata_xml text NOT NULL,
    metadata_url text,
    attribute_mapping jsonb,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT "entity_id not empty" CHECK ((char_length(entity_id) > 0)),
    CONSTRAINT "metadata_url not empty" CHECK (((metadata_url = NULL::text) OR (char_length(metadata_url) > 0))),
    CONSTRAINT "metadata_xml not empty" CHECK ((char_length(metadata_xml) > 0))
);
     DROP TABLE auth.saml_providers;
       auth         heap    supabase_auth_admin    false    34            �           0    0    TABLE saml_providers    COMMENT     ]   COMMENT ON TABLE auth.saml_providers IS 'Auth: Manages SAML Identity Provider connections.';
          auth          supabase_auth_admin    false    426            �           0    0    TABLE saml_providers    ACL     n   GRANT ALL ON TABLE auth.saml_providers TO postgres;
GRANT ALL ON TABLE auth.saml_providers TO dashboard_user;
          auth          supabase_auth_admin    false    426            �           1259    17788    saml_relay_states    TABLE     z  CREATE TABLE auth.saml_relay_states (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    request_id text NOT NULL,
    for_email text,
    redirect_to text,
    from_ip_address inet,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    flow_state_id uuid,
    CONSTRAINT "request_id not empty" CHECK ((char_length(request_id) > 0))
);
 #   DROP TABLE auth.saml_relay_states;
       auth         heap    supabase_auth_admin    false    34            �           0    0    TABLE saml_relay_states    COMMENT     �   COMMENT ON TABLE auth.saml_relay_states IS 'Auth: Contains SAML Relay State information for each Service Provider initiated login.';
          auth          supabase_auth_admin    false    427            �           0    0    TABLE saml_relay_states    ACL     t   GRANT ALL ON TABLE auth.saml_relay_states TO postgres;
GRANT ALL ON TABLE auth.saml_relay_states TO dashboard_user;
          auth          supabase_auth_admin    false    427            Q           1259    16496    schema_migrations    TABLE     U   CREATE TABLE auth.schema_migrations (
    version character varying(255) NOT NULL
);
 #   DROP TABLE auth.schema_migrations;
       auth         heap    supabase_auth_admin    false    34            �           0    0    TABLE schema_migrations    COMMENT     X   COMMENT ON TABLE auth.schema_migrations IS 'Auth: Manages updates to the auth system.';
          auth          supabase_auth_admin    false    337            �           0    0    TABLE schema_migrations    ACL     t   GRANT ALL ON TABLE auth.schema_migrations TO dashboard_user;
GRANT ALL ON TABLE auth.schema_migrations TO postgres;
          auth          supabase_auth_admin    false    337            �           1259    17669    sessions    TABLE     �   CREATE TABLE auth.sessions (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    factor_id uuid,
    aal auth.aal_level,
    not_after timestamp with time zone
);
    DROP TABLE auth.sessions;
       auth         heap    supabase_auth_admin    false    34    1581            �           0    0    TABLE sessions    COMMENT     U   COMMENT ON TABLE auth.sessions IS 'Auth: Stores session data associated to a user.';
          auth          supabase_auth_admin    false    420            �           0    0    COLUMN sessions.not_after    COMMENT     �   COMMENT ON COLUMN auth.sessions.not_after IS 'Auth: Not after is a nullable column that contains a timestamp after which the session should be regarded as expired.';
          auth          supabase_auth_admin    false    420            �           0    0    TABLE sessions    ACL     b   GRANT ALL ON TABLE auth.sessions TO postgres;
GRANT ALL ON TABLE auth.sessions TO dashboard_user;
          auth          supabase_auth_admin    false    420            �           1259    17755    sso_domains    TABLE       CREATE TABLE auth.sso_domains (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    domain text NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT "domain not empty" CHECK ((char_length(domain) > 0))
);
    DROP TABLE auth.sso_domains;
       auth         heap    supabase_auth_admin    false    34            �           0    0    TABLE sso_domains    COMMENT     t   COMMENT ON TABLE auth.sso_domains IS 'Auth: Manages SSO email address domain mapping to an SSO Identity Provider.';
          auth          supabase_auth_admin    false    425            �           0    0    TABLE sso_domains    ACL     h   GRANT ALL ON TABLE auth.sso_domains TO postgres;
GRANT ALL ON TABLE auth.sso_domains TO dashboard_user;
          auth          supabase_auth_admin    false    425            �           1259    17746    sso_providers    TABLE       CREATE TABLE auth.sso_providers (
    id uuid NOT NULL,
    resource_id text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT "resource_id not empty" CHECK (((resource_id = NULL::text) OR (char_length(resource_id) > 0)))
);
    DROP TABLE auth.sso_providers;
       auth         heap    supabase_auth_admin    false    34            �           0    0    TABLE sso_providers    COMMENT     x   COMMENT ON TABLE auth.sso_providers IS 'Auth: Manages SSO identity provider information; see saml_providers for SAML.';
          auth          supabase_auth_admin    false    424            �           0    0     COLUMN sso_providers.resource_id    COMMENT     �   COMMENT ON COLUMN auth.sso_providers.resource_id IS 'Auth: Uniquely identifies a SSO provider according to a user-chosen resource ID (case insensitive), useful in infrastructure as code.';
          auth          supabase_auth_admin    false    424            �           0    0    TABLE sso_providers    ACL     l   GRANT ALL ON TABLE auth.sso_providers TO postgres;
GRANT ALL ON TABLE auth.sso_providers TO dashboard_user;
          auth          supabase_auth_admin    false    424            L           1259    16458    users    TABLE       CREATE TABLE auth.users (
    instance_id uuid,
    id uuid NOT NULL,
    aud character varying(255),
    role character varying(255),
    email character varying(255),
    encrypted_password character varying(255),
    email_confirmed_at timestamp with time zone,
    invited_at timestamp with time zone,
    confirmation_token character varying(255),
    confirmation_sent_at timestamp with time zone,
    recovery_token character varying(255),
    recovery_sent_at timestamp with time zone,
    email_change_token_new character varying(255),
    email_change character varying(255),
    email_change_sent_at timestamp with time zone,
    last_sign_in_at timestamp with time zone,
    raw_app_meta_data jsonb,
    raw_user_meta_data jsonb,
    is_super_admin boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    phone text DEFAULT NULL::character varying,
    phone_confirmed_at timestamp with time zone,
    phone_change text DEFAULT ''::character varying,
    phone_change_token character varying(255) DEFAULT ''::character varying,
    phone_change_sent_at timestamp with time zone,
    confirmed_at timestamp with time zone GENERATED ALWAYS AS (LEAST(email_confirmed_at, phone_confirmed_at)) STORED,
    email_change_token_current character varying(255) DEFAULT ''::character varying,
    email_change_confirm_status smallint DEFAULT 0,
    banned_until timestamp with time zone,
    reauthentication_token character varying(255) DEFAULT ''::character varying,
    reauthentication_sent_at timestamp with time zone,
    is_sso_user boolean DEFAULT false NOT NULL,
    deleted_at timestamp with time zone,
    CONSTRAINT users_email_change_confirm_status_check CHECK (((email_change_confirm_status >= 0) AND (email_change_confirm_status <= 2)))
);
    DROP TABLE auth.users;
       auth         heap    supabase_auth_admin    false    34            �           0    0    TABLE users    COMMENT     W   COMMENT ON TABLE auth.users IS 'Auth: Stores user login data within a secure schema.';
          auth          supabase_auth_admin    false    332            �           0    0    COLUMN users.is_sso_user    COMMENT     �   COMMENT ON COLUMN auth.users.is_sso_user IS 'Auth: Set this column to true when the account comes from SSO. These accounts can have duplicate emails.';
          auth          supabase_auth_admin    false    332            �           0    0    TABLE users    ACL     \   GRANT ALL ON TABLE auth.users TO dashboard_user;
GRANT ALL ON TABLE auth.users TO postgres;
          auth          supabase_auth_admin    false    332            �           0    0    TABLE pg_stat_statements    ACL     P   GRANT ALL ON TABLE extensions.pg_stat_statements TO postgres WITH GRANT OPTION;
       
   extensions          supabase_admin    false    350            �           0    0    TABLE pg_stat_statements_info    ACL     U   GRANT ALL ON TABLE extensions.pg_stat_statements_info TO postgres WITH GRANT OPTION;
       
   extensions          supabase_admin    false    349            �           0    0    TABLE decrypted_key    ACL     A   GRANT ALL ON TABLE pgsodium.decrypted_key TO pgsodium_keyholder;
          pgsodium          supabase_admin    false    364            �           0    0    TABLE masking_rule    ACL     @   GRANT ALL ON TABLE pgsodium.masking_rule TO pgsodium_keyholder;
          pgsodium          supabase_admin    false    362            �           0    0    TABLE mask_columns    ACL     @   GRANT ALL ON TABLE pgsodium.mask_columns TO pgsodium_keyholder;
          pgsodium          supabase_admin    false    363            �           1259    26881    achievements    TABLE     �   CREATE TABLE public.achievements (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    name text DEFAULT ''::text,
    description text DEFAULT ''::text,
    icon_name text
);
     DROP TABLE public.achievements;
       public         heap    supabase_admin    false            �           0    0    TABLE achievements    COMMENT     I   COMMENT ON TABLE public.achievements IS 'All the possible achievements';
          public          supabase_admin    false    435            �           0    0    TABLE achievements    ACL     �   GRANT ALL ON TABLE public.achievements TO postgres;
GRANT ALL ON TABLE public.achievements TO anon;
GRANT ALL ON TABLE public.achievements TO authenticated;
GRANT ALL ON TABLE public.achievements TO service_role;
          public          supabase_admin    false    435            �           1259    26884    achievements_id_seq    SEQUENCE     �   ALTER TABLE public.achievements ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.achievements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          supabase_admin    false    435            �           0    0    SEQUENCE achievements_id_seq    ACL     �   GRANT ALL ON SEQUENCE public.achievements_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.achievements_id_seq TO anon;
GRANT ALL ON SEQUENCE public.achievements_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.achievements_id_seq TO service_role;
          public          supabase_admin    false    436            �           1259    27130    answers_exercises    TABLE     Z  CREATE TABLE public.answers_exercises (
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    answer text NOT NULL,
    exercise bigint NOT NULL,
    is_correct boolean NOT NULL,
    order_position smallint NOT NULL,
    CONSTRAINT answers_exercises_order_position_check CHECK (((order_position >= 1) AND (order_position <= 6)))
);
 %   DROP TABLE public.answers_exercises;
       public         heap    supabase_admin    false            �           0    0    TABLE answers_exercises    COMMENT     f   COMMENT ON TABLE public.answers_exercises IS 'One exercise can have up to 4 answers to choose from.';
          public          supabase_admin    false    445            �           0    0    TABLE answers_exercises    ACL     �   GRANT ALL ON TABLE public.answers_exercises TO postgres;
GRANT ALL ON TABLE public.answers_exercises TO anon;
GRANT ALL ON TABLE public.answers_exercises TO authenticated;
GRANT ALL ON TABLE public.answers_exercises TO service_role;
          public          supabase_admin    false    445            �           1259    27056 	   exercises    TABLE     0  CREATE TABLE public.exercises (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    question text DEFAULT ''::text NOT NULL,
    priority bigint,
    set_id bigint NOT NULL,
    CONSTRAINT exercises_priority_check CHECK (((priority >= 0) AND (priority <= 10)))
);
    DROP TABLE public.exercises;
       public         heap    supabase_admin    false            �           0    0    TABLE exercises    COMMENT     a   COMMENT ON TABLE public.exercises IS 'All exercises need to be assigned to a learning project.';
          public          supabase_admin    false    439            �           0    0    TABLE exercises    ACL     �   GRANT ALL ON TABLE public.exercises TO postgres;
GRANT ALL ON TABLE public.exercises TO anon;
GRANT ALL ON TABLE public.exercises TO authenticated;
GRANT ALL ON TABLE public.exercises TO service_role;
          public          supabase_admin    false    439            �           1259    27059    exercises_id_seq    SEQUENCE     �   ALTER TABLE public.exercises ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.exercises_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          supabase_admin    false    439            �           0    0    SEQUENCE exercises_id_seq    ACL     �   GRANT ALL ON SEQUENCE public.exercises_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.exercises_id_seq TO anon;
GRANT ALL ON SEQUENCE public.exercises_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.exercises_id_seq TO service_role;
          public          supabase_admin    false    440            �           1259    27074 
   flashcards    TABLE     )  CREATE TABLE public.flashcards (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    question text,
    answer text,
    priority bigint,
    set_id bigint NOT NULL,
    CONSTRAINT flashcards_priority_check CHECK (((priority >= 0) AND (priority <= 10)))
);
    DROP TABLE public.flashcards;
       public         heap    supabase_admin    false            �           0    0    TABLE flashcards    COMMENT     c   COMMENT ON TABLE public.flashcards IS 'All flashcards need to be assigned to a learning project.';
          public          supabase_admin    false    441            �           0    0    TABLE flashcards    ACL     �   GRANT ALL ON TABLE public.flashcards TO postgres;
GRANT ALL ON TABLE public.flashcards TO anon;
GRANT ALL ON TABLE public.flashcards TO authenticated;
GRANT ALL ON TABLE public.flashcards TO service_role;
          public          supabase_admin    false    441            �           1259    26979    learning_projects_id_seq    SEQUENCE     �   ALTER TABLE public.learning_projects ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.learning_projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          supabase_admin    false    437            �           0    0 !   SEQUENCE learning_projects_id_seq    ACL       GRANT ALL ON SEQUENCE public.learning_projects_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.learning_projects_id_seq TO anon;
GRANT ALL ON SEQUENCE public.learning_projects_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.learning_projects_id_seq TO service_role;
          public          supabase_admin    false    438            �           1259    27113    links    TABLE     �   CREATE TABLE public.links (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    link_url text,
    learning_project bigint,
    title text,
    subtitle text,
    description text
);
    DROP TABLE public.links;
       public         heap    supabase_admin    false            �           0    0    TABLE links    COMMENT     ]   COMMENT ON TABLE public.links IS 'All links need to be associated with a learning project.';
          public          supabase_admin    false    443            �           0    0    TABLE links    ACL     �   GRANT ALL ON TABLE public.links TO postgres;
GRANT ALL ON TABLE public.links TO anon;
GRANT ALL ON TABLE public.links TO authenticated;
GRANT ALL ON TABLE public.links TO service_role;
          public          supabase_admin    false    443            �           1259    27077    lp_flashcards_id_seq    SEQUENCE     �   ALTER TABLE public.flashcards ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.lp_flashcards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          supabase_admin    false    441            �           0    0    SEQUENCE lp_flashcards_id_seq    ACL       GRANT ALL ON SEQUENCE public.lp_flashcards_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.lp_flashcards_id_seq TO anon;
GRANT ALL ON SEQUENCE public.lp_flashcards_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.lp_flashcards_id_seq TO service_role;
          public          supabase_admin    false    442            �           1259    27116    lp_links_id_seq    SEQUENCE     �   ALTER TABLE public.links ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.lp_links_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          supabase_admin    false    443                        0    0    SEQUENCE lp_links_id_seq    ACL     �   GRANT ALL ON SEQUENCE public.lp_links_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.lp_links_id_seq TO anon;
GRANT ALL ON SEQUENCE public.lp_links_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.lp_links_id_seq TO service_role;
          public          supabase_admin    false    444            �           1259    135317    player_answers    TABLE     �   CREATE TABLE public.player_answers (
    room_id uuid NOT NULL,
    user_id uuid NOT NULL,
    round bigint NOT NULL,
    answer_correct boolean NOT NULL,
    answered_at bigint NOT NULL,
    answer_time bigint NOT NULL,
    answer text NOT NULL
);
 "   DROP TABLE public.player_answers;
       public         heap    supabase_admin    false                       0    0    TABLE player_answers    COMMENT     P   COMMENT ON TABLE public.player_answers IS 'submitted player answers for games';
          public          supabase_admin    false    465                       0    0    COLUMN player_answers.round    COMMENT     :   COMMENT ON COLUMN public.player_answers.round IS '1...n';
          public          supabase_admin    false    465                       0    0 !   COLUMN player_answers.answered_at    COMMENT     O   COMMENT ON COLUMN public.player_answers.answered_at IS 'unix timestamp in ms';
          public          supabase_admin    false    465                       0    0 !   COLUMN player_answers.answer_time    COMMENT     H   COMMENT ON COLUMN public.player_answers.answer_time IS 'in ms. needed';
          public          supabase_admin    false    465                       0    0    TABLE player_answers    ACL     �   GRANT ALL ON TABLE public.player_answers TO postgres;
GRANT ALL ON TABLE public.player_answers TO anon;
GRANT ALL ON TABLE public.player_answers TO authenticated;
GRANT ALL ON TABLE public.player_answers TO service_role;
          public          supabase_admin    false    465            �           1259    53025    private_room_states    TABLE     �   CREATE TABLE public.private_room_states (
    room_id uuid NOT NULL,
    data json NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);
 '   DROP TABLE public.private_room_states;
       public         heap    supabase_admin    false                       0    0    TABLE private_room_states    COMMENT     e   COMMENT ON TABLE public.private_room_states IS 'quiz/answers data. user answers. hidden from users';
          public          supabase_admin    false    457                       0    0    COLUMN private_room_states.data    COMMENT     =   COMMENT ON COLUMN public.private_room_states.data IS 'json';
          public          supabase_admin    false    457                       0    0    TABLE private_room_states    ACL     �   GRANT ALL ON TABLE public.private_room_states TO postgres;
GRANT ALL ON TABLE public.private_room_states TO anon;
GRANT ALL ON TABLE public.private_room_states TO authenticated;
GRANT ALL ON TABLE public.private_room_states TO service_role;
          public          supabase_admin    false    457            �           1259    26744    profiles    TABLE     H  CREATE TABLE public.profiles (
    id uuid NOT NULL,
    username text NOT NULL,
    room_id uuid,
    user_tags text DEFAULT ''::text NOT NULL,
    user_settings jsonb,
    CONSTRAINT profiles_username_check CHECK (((length(username) < 32) AND (length(username) > 4) AND (username ~ '^[a-zA-Z0-9_äöüÄÖÜß]+$'::text)))
);
    DROP TABLE public.profiles;
       public         heap    supabase_admin    false            	           0    0    COLUMN profiles.room_id    COMMENT     M   COMMENT ON COLUMN public.profiles.room_id IS 'user is in room (is guarded)';
          public          supabase_admin    false    432            
           0    0    COLUMN profiles.user_tags    COMMENT     �   COMMENT ON COLUMN public.profiles.user_tags IS 'DELETE THIS List of tags associated with the user that represent his interests.';
          public          supabase_admin    false    432                       0    0    TABLE profiles    ACL     �   GRANT ALL ON TABLE public.profiles TO postgres;
GRANT ALL ON TABLE public.profiles TO anon;
GRANT ALL ON TABLE public.profiles TO authenticated;
GRANT ALL ON TABLE public.profiles TO service_role;
          public          supabase_admin    false    432            �           1259    30854    project_ratings    TABLE     �   CREATE TABLE public.project_ratings (
    project_id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_id uuid NOT NULL,
    rating smallint NOT NULL
);
 #   DROP TABLE public.project_ratings;
       public         heap    supabase_admin    false                       0    0    TABLE project_ratings    ACL     �   GRANT ALL ON TABLE public.project_ratings TO postgres;
GRANT ALL ON TABLE public.project_ratings TO anon;
GRANT ALL ON TABLE public.project_ratings TO authenticated;
GRANT ALL ON TABLE public.project_ratings TO service_role;
          public          supabase_admin    false    452            �           1259    30857    project_ratings_id_seq    SEQUENCE     �   ALTER TABLE public.project_ratings ALTER COLUMN project_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.project_ratings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          supabase_admin    false    452                       0    0    SEQUENCE project_ratings_id_seq    ACL     	  GRANT ALL ON SEQUENCE public.project_ratings_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.project_ratings_id_seq TO anon;
GRANT ALL ON SEQUENCE public.project_ratings_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.project_ratings_id_seq TO service_role;
          public          supabase_admin    false    453            �           1259    53001    public_room_states    TABLE     �   CREATE TABLE public.public_room_states (
    room_id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    data json NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);
 &   DROP TABLE public.public_room_states;
       public         heap    supabase_admin    false                       0    0    TABLE public_room_states    COMMENT     X   COMMENT ON TABLE public.public_room_states IS 'what game, timer, players can see this';
          public          supabase_admin    false    456                       0    0    COLUMN public_room_states.data    COMMENT     ^   COMMENT ON COLUMN public.public_room_states.data IS 'public state. use db functions to edit';
          public          supabase_admin    false    456                       0    0    TABLE public_room_states    ACL     �   GRANT ALL ON TABLE public.public_room_states TO postgres;
GRANT ALL ON TABLE public.public_room_states TO anon;
GRANT ALL ON TABLE public.public_room_states TO authenticated;
GRANT ALL ON TABLE public.public_room_states TO service_role;
          public          supabase_admin    false    456            �           1259    233293    queue    TABLE     �   CREATE TABLE public.queue (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    room_id uuid,
    type text NOT NULL,
    data text
);
    DROP TABLE public.queue;
       public         heap    supabase_admin    false                       0    0    TABLE queue    COMMENT     2   COMMENT ON TABLE public.queue IS 'queue for ipc';
          public          supabase_admin    false    467                       0    0    COLUMN queue.data    COMMENT     4   COMMENT ON COLUMN public.queue.data IS 'parameter';
          public          supabase_admin    false    467                       0    0    TABLE queue    ACL     �   GRANT ALL ON TABLE public.queue TO postgres;
GRANT ALL ON TABLE public.queue TO anon;
GRANT ALL ON TABLE public.queue TO authenticated;
GRANT ALL ON TABLE public.queue TO service_role;
          public          supabase_admin    false    467            �           1259    27238    rooms    TABLE     �  CREATE TABLE public.rooms (
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    name text,
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    code integer,
    project_id bigint,
    secret_key uuid DEFAULT gen_random_uuid() NOT NULL,
    is_ingame boolean DEFAULT false NOT NULL,
    host uuid NOT NULL,
    max_size smallint DEFAULT '2'::smallint NOT NULL,
    is_private boolean DEFAULT false NOT NULL,
    share_code integer,
    CONSTRAINT rooms_code_check CHECK (((code >= 0) AND (code < 999999))),
    CONSTRAINT rooms_max_size_check CHECK (((max_size > 0) AND (max_size <= 1000))),
    CONSTRAINT rooms_share_code_check CHECK (((share_code >= 0) AND (share_code < 999999)))
);
    DROP TABLE public.rooms;
       public         heap    supabase_admin    false                       0    0    COLUMN rooms.code    COMMENT     >   COMMENT ON COLUMN public.rooms.code IS 'password protection';
          public          supabase_admin    false    446                       0    0    COLUMN rooms.secret_key    COMMENT     D   COMMENT ON COLUMN public.rooms.secret_key IS 'realtime channel id';
          public          supabase_admin    false    446                       0    0    COLUMN rooms.is_ingame    COMMENT     K   COMMENT ON COLUMN public.rooms.is_ingame IS 'lobby already active/closed';
          public          supabase_admin    false    446                       0    0    COLUMN rooms.max_size    COMMENT     <   COMMENT ON COLUMN public.rooms.max_size IS 'max room size';
          public          supabase_admin    false    446                       0    0    COLUMN rooms.is_private    COMMENT     =   COMMENT ON COLUMN public.rooms.is_private IS 'friends only';
          public          supabase_admin    false    446                       0    0    COLUMN rooms.share_code    COMMENT     R   COMMENT ON COLUMN public.rooms.share_code IS 'shareable code to quick join room';
          public          supabase_admin    false    446                       0    0    TABLE rooms    ACL     �   GRANT ALL ON TABLE public.rooms TO postgres;
GRANT ALL ON TABLE public.rooms TO anon;
GRANT ALL ON TABLE public.rooms TO authenticated;
GRANT ALL ON TABLE public.rooms TO service_role;
          public          supabase_admin    false    446            �           1259    38289    sets    TABLE     �   CREATE TABLE public.sets (
    id bigint NOT NULL,
    name text NOT NULL,
    type smallint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    project_id bigint NOT NULL
);
    DROP TABLE public.sets;
       public         heap    supabase_admin    false                       0    0 
   TABLE sets    COMMENT     >   COMMENT ON TABLE public.sets IS 'flashcard or exercise sets';
          public          supabase_admin    false    454                       0    0 
   TABLE sets    ACL     �   GRANT ALL ON TABLE public.sets TO postgres;
GRANT ALL ON TABLE public.sets TO anon;
GRANT ALL ON TABLE public.sets TO authenticated;
GRANT ALL ON TABLE public.sets TO service_role;
          public          supabase_admin    false    454            �           1259    38292    sets_id_seq    SEQUENCE     �   ALTER TABLE public.sets ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.sets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          supabase_admin    false    454                       0    0    SEQUENCE sets_id_seq    ACL     �   GRANT ALL ON SEQUENCE public.sets_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.sets_id_seq TO anon;
GRANT ALL ON SEQUENCE public.sets_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.sets_id_seq TO service_role;
          public          supabase_admin    false    455            �           1259    69388    tracker    TABLE     �   CREATE TABLE public.tracker (
    key text NOT NULL,
    last_updated timestamp with time zone
);

ALTER TABLE ONLY public.tracker REPLICA IDENTITY FULL;
    DROP TABLE public.tracker;
       public         heap    supabase_admin    false                       0    0    TABLE tracker    ACL     �   GRANT ALL ON TABLE public.tracker TO postgres;
GRANT ALL ON TABLE public.tracker TO anon;
GRANT ALL ON TABLE public.tracker TO authenticated;
GRANT ALL ON TABLE public.tracker TO service_role;
          public          supabase_admin    false    464            �           1259    26864    user_achievements    TABLE     �   CREATE TABLE public.user_achievements (
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    achievement_id bigint NOT NULL,
    user_id uuid NOT NULL
);
 %   DROP TABLE public.user_achievements;
       public         heap    supabase_admin    false                       0    0    TABLE user_achievements    COMMENT     W   COMMENT ON TABLE public.user_achievements IS 'All the achievements the user has got.';
          public          supabase_admin    false    434                        0    0    TABLE user_achievements    ACL     �   GRANT ALL ON TABLE public.user_achievements TO postgres;
GRANT ALL ON TABLE public.user_achievements TO anon;
GRANT ALL ON TABLE public.user_achievements TO authenticated;
GRANT ALL ON TABLE public.user_achievements TO service_role;
          public          supabase_admin    false    434            �           1259    27260    user_learning_projects    TABLE     h  CREATE TABLE public.user_learning_projects (
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    learning_project_id bigint NOT NULL,
    user_id uuid NOT NULL,
    stats jsonb DEFAULT '{"winsQuiz": 0, "scoreQuiz": 0, "timeSpentQuiz": 0, "winsFlashcards": 0, "scoreFlashcards": 0, "timeSpentFlashcards": 0, "timeSpentWhiteboard": 0}'::jsonb
);
 *   DROP TABLE public.user_learning_projects;
       public         heap    supabase_admin    false            !           0    0    TABLE user_learning_projects    ACL     �   GRANT ALL ON TABLE public.user_learning_projects TO postgres;
GRANT ALL ON TABLE public.user_learning_projects TO anon;
GRANT ALL ON TABLE public.user_learning_projects TO authenticated;
GRANT ALL ON TABLE public.user_learning_projects TO service_role;
          public          supabase_admin    false    447            �           1259    53126    schema_migrations    TABLE     y   CREATE TABLE realtime.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);
 '   DROP TABLE realtime.schema_migrations;
       realtime         heap    supabase_admin    false    65            "           0    0    TABLE schema_migrations    ACL     |   GRANT ALL ON TABLE realtime.schema_migrations TO postgres;
GRANT ALL ON TABLE realtime.schema_migrations TO dashboard_user;
          realtime          supabase_admin    false    458            �           1259    53149    subscription    TABLE     �  CREATE TABLE realtime.subscription (
    id bigint NOT NULL,
    subscription_id uuid NOT NULL,
    entity regclass NOT NULL,
    filters realtime.user_defined_filter[] DEFAULT '{}'::realtime.user_defined_filter[] NOT NULL,
    claims jsonb NOT NULL,
    claims_role regrole GENERATED ALWAYS AS (realtime.to_regrole((claims ->> 'role'::text))) STORED NOT NULL,
    created_at timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL
);
 "   DROP TABLE realtime.subscription;
       realtime         heap    supabase_admin    false    1686    735    65    1686            #           0    0    TABLE subscription    ACL     r   GRANT ALL ON TABLE realtime.subscription TO postgres;
GRANT ALL ON TABLE realtime.subscription TO dashboard_user;
          realtime          supabase_admin    false    461            �           1259    53148    subscription_id_seq    SEQUENCE     �   ALTER TABLE realtime.subscription ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME realtime.subscription_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            realtime          supabase_admin    false    461    65            $           0    0    SEQUENCE subscription_id_seq    ACL     �   GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO postgres;
GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO dashboard_user;
          realtime          supabase_admin    false    460            R           1259    16509    buckets    TABLE     X  CREATE TABLE storage.buckets (
    id text NOT NULL,
    name text NOT NULL,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    public boolean DEFAULT false,
    avif_autodetection boolean DEFAULT false,
    file_size_limit bigint,
    allowed_mime_types text[]
);
    DROP TABLE storage.buckets;
       storage         heap    supabase_storage_admin    false    32            %           0    0    TABLE buckets    ACL     �   GRANT ALL ON TABLE storage.buckets TO anon;
GRANT ALL ON TABLE storage.buckets TO authenticated;
GRANT ALL ON TABLE storage.buckets TO service_role;
GRANT ALL ON TABLE storage.buckets TO postgres;
          storage          supabase_storage_admin    false    338            T           1259    16551 
   migrations    TABLE     �   CREATE TABLE storage.migrations (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    hash character varying(40) NOT NULL,
    executed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE storage.migrations;
       storage         heap    supabase_storage_admin    false    32            &           0    0    TABLE migrations    ACL     �   GRANT ALL ON TABLE storage.migrations TO anon;
GRANT ALL ON TABLE storage.migrations TO authenticated;
GRANT ALL ON TABLE storage.migrations TO service_role;
GRANT ALL ON TABLE storage.migrations TO postgres;
          storage          supabase_storage_admin    false    340            S           1259    16524    objects    TABLE     �  CREATE TABLE storage.objects (
    id uuid DEFAULT extensions.uuid_generate_v4() NOT NULL,
    bucket_id text,
    name text,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    last_accessed_at timestamp with time zone DEFAULT now(),
    metadata jsonb,
    path_tokens text[] GENERATED ALWAYS AS (string_to_array(name, '/'::text)) STORED,
    version text
);
    DROP TABLE storage.objects;
       storage         heap    supabase_storage_admin    false    7    31    32            '           0    0    TABLE objects    ACL     �   GRANT ALL ON TABLE storage.objects TO anon;
GRANT ALL ON TABLE storage.objects TO authenticated;
GRANT ALL ON TABLE storage.objects TO service_role;
GRANT ALL ON TABLE storage.objects TO postgres;
          storage          supabase_storage_admin    false    339            \           1259    16621    hooks    TABLE     �   CREATE TABLE supabase_functions.hooks (
    id bigint NOT NULL,
    hook_table_id integer NOT NULL,
    hook_name text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    request_id bigint
);
 %   DROP TABLE supabase_functions.hooks;
       supabase_functions         heap    supabase_functions_admin    false    28            (           0    0    TABLE hooks    COMMENT     k   COMMENT ON TABLE supabase_functions.hooks IS 'Supabase Functions Hooks: Audit trail for triggered hooks.';
          supabase_functions          supabase_functions_admin    false    348            )           0    0    TABLE hooks    ACL     �   GRANT ALL ON TABLE supabase_functions.hooks TO anon;
GRANT ALL ON TABLE supabase_functions.hooks TO authenticated;
GRANT ALL ON TABLE supabase_functions.hooks TO service_role;
          supabase_functions          supabase_functions_admin    false    348            [           1259    16620    hooks_id_seq    SEQUENCE     �   CREATE SEQUENCE supabase_functions.hooks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE supabase_functions.hooks_id_seq;
       supabase_functions          supabase_functions_admin    false    348    28            *           0    0    hooks_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE supabase_functions.hooks_id_seq OWNED BY supabase_functions.hooks.id;
          supabase_functions          supabase_functions_admin    false    347            +           0    0    SEQUENCE hooks_id_seq    ACL     �   GRANT ALL ON SEQUENCE supabase_functions.hooks_id_seq TO anon;
GRANT ALL ON SEQUENCE supabase_functions.hooks_id_seq TO authenticated;
GRANT ALL ON SEQUENCE supabase_functions.hooks_id_seq TO service_role;
          supabase_functions          supabase_functions_admin    false    347            Z           1259    16612 
   migrations    TABLE     �   CREATE TABLE supabase_functions.migrations (
    version text NOT NULL,
    inserted_at timestamp with time zone DEFAULT now() NOT NULL
);
 *   DROP TABLE supabase_functions.migrations;
       supabase_functions         heap    supabase_functions_admin    false    28            ,           0    0    TABLE migrations    ACL     �   GRANT ALL ON TABLE supabase_functions.migrations TO anon;
GRANT ALL ON TABLE supabase_functions.migrations TO authenticated;
GRANT ALL ON TABLE supabase_functions.migrations TO service_role;
          supabase_functions          supabase_functions_admin    false    346            n           1259    17038    decrypted_secrets    VIEW     �  CREATE VIEW vault.decrypted_secrets AS
 SELECT secrets.id,
    secrets.name,
    secrets.description,
    secrets.secret,
        CASE
            WHEN (secrets.secret IS NULL) THEN NULL::text
            ELSE
            CASE
                WHEN (secrets.key_id IS NULL) THEN NULL::text
                ELSE convert_from(pgsodium.crypto_aead_det_decrypt(decode(secrets.secret, 'base64'::text), convert_to(((((secrets.id)::text || secrets.description) || (secrets.created_at)::text) || (secrets.updated_at)::text), 'utf8'::name), secrets.key_id, secrets.nonce), 'utf8'::name)
            END
        END AS decrypted_secret,
    secrets.key_id,
    secrets.nonce,
    secrets.created_at,
    secrets.updated_at
   FROM vault.secrets;
 #   DROP VIEW vault.decrypted_secrets;
       vault          supabase_admin    false    10    9    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    41    41    9    41    9    41    9    41    9    41    9    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    41    41    9    41    9    41    9    41    9    41    44    10    9    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    41    41    9    41    9    41    9    41    9    41    9    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    41    41    9    41    9    41    9    41    9    41    44    10    9    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    41    41    9    41    9    41    9    41    9    41    9    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    41    41    9    41    9    41    9    41    9    41    44    9    41    10    9    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    41    41    9    41    9    41    9    41    9    41    9    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    41    41    9    41    9    41    9    41    9    41    44    10    9    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    41    41    9    41    9    41    9    41    9    41    9    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    41    41    9    41    9    41    9    41    9    41    44    10    9    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    41    41    9    41    9    41    9    41    9    41    9    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    41    41    9    41    9    41    9    41    9    41    44    10    9    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    41    41    9    41    9    41    9    41    9    41    9    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    41    41    9    41    9    41    9    41    9    41    44    10    9    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    41    41    9    41    9    41    9    41    9    41    9    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    9    41    9    41    9    41    41    9    41    41    9    41    9    41    9    41    9    41    44    44            (           2604    17266    billing_accounts id    DEFAULT     �   ALTER TABLE ONLY _analytics.billing_accounts ALTER COLUMN id SET DEFAULT nextval('_analytics.billing_accounts_id_seq'::regclass);
 F   ALTER TABLE _analytics.billing_accounts ALTER COLUMN id DROP DEFAULT;
    
   _analytics          supabase_admin    false    388    389    389            ;           2604    17426    billing_counts id    DEFAULT     ~   ALTER TABLE ONLY _analytics.billing_counts ALTER COLUMN id SET DEFAULT nextval('_analytics.billing_counts_id_seq'::regclass);
 D   ALTER TABLE _analytics.billing_counts ALTER COLUMN id DROP DEFAULT;
    
   _analytics          supabase_admin    false    402    403    403            4           2604    17409    endpoint_queries id    DEFAULT     �   ALTER TABLE ONLY _analytics.endpoint_queries ALTER COLUMN id SET DEFAULT nextval('_analytics.endpoint_queries_id_seq'::regclass);
 F   ALTER TABLE _analytics.endpoint_queries ALTER COLUMN id DROP DEFAULT;
    
   _analytics          supabase_admin    false    401    400    401                       2604    17111    oauth_access_grants id    DEFAULT     �   ALTER TABLE ONLY _analytics.oauth_access_grants ALTER COLUMN id SET DEFAULT nextval('_analytics.oauth_access_grants_id_seq'::regclass);
 I   ALTER TABLE _analytics.oauth_access_grants ALTER COLUMN id DROP DEFAULT;
    
   _analytics          supabase_admin    false    376    377    377                       2604    17126    oauth_access_tokens id    DEFAULT     �   ALTER TABLE ONLY _analytics.oauth_access_tokens ALTER COLUMN id SET DEFAULT nextval('_analytics.oauth_access_tokens_id_seq'::regclass);
 I   ALTER TABLE _analytics.oauth_access_tokens ALTER COLUMN id DROP DEFAULT;
    
   _analytics          supabase_admin    false    378    379    379                       2604    17099    oauth_applications id    DEFAULT     �   ALTER TABLE ONLY _analytics.oauth_applications ALTER COLUMN id SET DEFAULT nextval('_analytics.oauth_applications_id_seq'::regclass);
 H   ALTER TABLE _analytics.oauth_applications ALTER COLUMN id DROP DEFAULT;
    
   _analytics          supabase_admin    false    375    374    375            >           2604    17497    partner_users id    DEFAULT     |   ALTER TABLE ONLY _analytics.partner_users ALTER COLUMN id SET DEFAULT nextval('_analytics.partner_users_id_seq'::regclass);
 C   ALTER TABLE _analytics.partner_users ALTER COLUMN id DROP DEFAULT;
    
   _analytics          supabase_admin    false    409    408    409            =           2604    17488    partners id    DEFAULT     r   ALTER TABLE ONLY _analytics.partners ALTER COLUMN id SET DEFAULT nextval('_analytics.partners_id_seq'::regclass);
 >   ALTER TABLE _analytics.partners ALTER COLUMN id DROP DEFAULT;
    
   _analytics          supabase_admin    false    407    406    407            2           2604    17365    payment_methods id    DEFAULT     �   ALTER TABLE ONLY _analytics.payment_methods ALTER COLUMN id SET DEFAULT nextval('_analytics.payment_methods_id_seq'::regclass);
 E   ALTER TABLE _analytics.payment_methods ALTER COLUMN id DROP DEFAULT;
    
   _analytics          supabase_admin    false    397    396    397            .           2604    17307    plans id    DEFAULT     l   ALTER TABLE ONLY _analytics.plans ALTER COLUMN id SET DEFAULT nextval('_analytics.plans_id_seq'::regclass);
 ;   ALTER TABLE _analytics.plans ALTER COLUMN id DROP DEFAULT;
    
   _analytics          supabase_admin    false    392    393    393                       2604    17084    rules id    DEFAULT     l   ALTER TABLE ONLY _analytics.rules ALTER COLUMN id SET DEFAULT nextval('_analytics.rules_id_seq'::regclass);
 ;   ALTER TABLE _analytics.rules ALTER COLUMN id DROP DEFAULT;
    
   _analytics          supabase_admin    false    372    373    373            ,           2604    17291    saved_search_counters id    DEFAULT     �   ALTER TABLE ONLY _analytics.saved_search_counters ALTER COLUMN id SET DEFAULT nextval('_analytics.saved_search_counters_id_seq'::regclass);
 K   ALTER TABLE _analytics.saved_search_counters ALTER COLUMN id DROP DEFAULT;
    
   _analytics          supabase_admin    false    390    391    391                        2604    17215    saved_searches id    DEFAULT     ~   ALTER TABLE ONLY _analytics.saved_searches ALTER COLUMN id SET DEFAULT nextval('_analytics.saved_searches_id_seq'::regclass);
 D   ALTER TABLE _analytics.saved_searches ALTER COLUMN id DROP DEFAULT;
    
   _analytics          supabase_admin    false    383    382    383            <           2604    17464    source_backends id    DEFAULT     �   ALTER TABLE ONLY _analytics.source_backends ALTER COLUMN id SET DEFAULT nextval('_analytics.source_backends_id_seq'::regclass);
 E   ALTER TABLE _analytics.source_backends ALTER COLUMN id DROP DEFAULT;
    
   _analytics          supabase_admin    false    405    404    405            1           2604    17325    source_schemas id    DEFAULT     ~   ALTER TABLE ONLY _analytics.source_schemas ALTER COLUMN id SET DEFAULT nextval('_analytics.source_schemas_id_seq'::regclass);
 D   ALTER TABLE _analytics.source_schemas ALTER COLUMN id DROP DEFAULT;
    
   _analytics          supabase_admin    false    394    395    395                       2604    17069 
   sources id    DEFAULT     p   ALTER TABLE ONLY _analytics.sources ALTER COLUMN id SET DEFAULT nextval('_analytics.sources_id_seq'::regclass);
 =   ALTER TABLE _analytics.sources ALTER COLUMN id DROP DEFAULT;
    
   _analytics          supabase_admin    false    370    371    371                       2604    17204    system_metrics id    DEFAULT     ~   ALTER TABLE ONLY _analytics.system_metrics ALTER COLUMN id SET DEFAULT nextval('_analytics.system_metrics_id_seq'::regclass);
 D   ALTER TABLE _analytics.system_metrics ALTER COLUMN id DROP DEFAULT;
    
   _analytics          supabase_admin    false    381    380    381            %           2604    17241    team_users id    DEFAULT     v   ALTER TABLE ONLY _analytics.team_users ALTER COLUMN id SET DEFAULT nextval('_analytics.team_users_id_seq'::regclass);
 @   ALTER TABLE _analytics.team_users ALTER COLUMN id DROP DEFAULT;
    
   _analytics          supabase_admin    false    387    386    387            #           2604    17229    teams id    DEFAULT     l   ALTER TABLE ONLY _analytics.teams ALTER COLUMN id SET DEFAULT nextval('_analytics.teams_id_seq'::regclass);
 ;   ALTER TABLE _analytics.teams ALTER COLUMN id DROP DEFAULT;
    
   _analytics          supabase_admin    false    384    385    385                       2604    17060    users id    DEFAULT     l   ALTER TABLE ONLY _analytics.users ALTER COLUMN id SET DEFAULT nextval('_analytics.users_id_seq'::regclass);
 ;   ALTER TABLE _analytics.users ALTER COLUMN id DROP DEFAULT;
    
   _analytics          supabase_admin    false    368    369    369            3           2604    17390    vercel_auths id    DEFAULT     z   ALTER TABLE ONLY _analytics.vercel_auths ALTER COLUMN id SET DEFAULT nextval('_analytics.vercel_auths_id_seq'::regclass);
 B   ALTER TABLE _analytics.vercel_auths ALTER COLUMN id DROP DEFAULT;
    
   _analytics          supabase_admin    false    398    399    399            �           2604    16473    refresh_tokens id    DEFAULT     r   ALTER TABLE ONLY auth.refresh_tokens ALTER COLUMN id SET DEFAULT nextval('auth.refresh_tokens_id_seq'::regclass);
 >   ALTER TABLE auth.refresh_tokens ALTER COLUMN id DROP DEFAULT;
       auth          supabase_auth_admin    false    334    333    334            �           2604    16624    hooks id    DEFAULT     |   ALTER TABLE ONLY supabase_functions.hooks ALTER COLUMN id SET DEFAULT nextval('supabase_functions.hooks_id_seq'::regclass);
 C   ALTER TABLE supabase_functions.hooks ALTER COLUMN id DROP DEFAULT;
       supabase_functions          supabase_functions_admin    false    347    348    348            �          0    17263    billing_accounts 
   TABLE DATA             COPY _analytics.billing_accounts (id, latest_successful_stripe_session, stripe_customer, user_id, inserted_at, updated_at, stripe_subscriptions, stripe_invoices, "lifetime_plan?", lifetime_plan_invoice, default_payment_method, custom_invoice_fields, lifetime_plan) FROM stdin;
 
   _analytics          supabase_admin    false    389   s      �          0    17423    billing_counts 
   TABLE DATA           j   COPY _analytics.billing_counts (id, node, count, user_id, source_id, inserted_at, updated_at) FROM stdin;
 
   _analytics          supabase_admin    false    403   $s      �          0    17406    endpoint_queries 
   TABLE DATA           �   COPY _analytics.endpoint_queries (id, name, token, query, user_id, inserted_at, updated_at, source_mapping, sandboxable, cache_duration_seconds, proactive_requerying_seconds, max_limit, enable_auth, sandbox_query_id, language) FROM stdin;
 
   _analytics          supabase_admin    false    401   As      �          0    17108    oauth_access_grants 
   TABLE DATA           �   COPY _analytics.oauth_access_grants (id, resource_owner_id, application_id, token, expires_in, redirect_uri, revoked_at, scopes, inserted_at) FROM stdin;
 
   _analytics          supabase_admin    false    377   �{      �          0    17123    oauth_access_tokens 
   TABLE DATA           �   COPY _analytics.oauth_access_tokens (id, application_id, resource_owner_id, token, refresh_token, expires_in, revoked_at, scopes, previous_refresh_token, inserted_at, updated_at, description) FROM stdin;
 
   _analytics          supabase_admin    false    379   �{      �          0    17096    oauth_applications 
   TABLE DATA           �   COPY _analytics.oauth_applications (id, owner_id, name, uid, secret, redirect_uri, scopes, inserted_at, updated_at) FROM stdin;
 
   _analytics          supabase_admin    false    375   �{      �          0    17494    partner_users 
   TABLE DATA           D   COPY _analytics.partner_users (id, partner_id, user_id) FROM stdin;
 
   _analytics          supabase_admin    false    409    |      �          0    17485    partners 
   TABLE DATA           7   COPY _analytics.partners (id, name, token) FROM stdin;
 
   _analytics          supabase_admin    false    407   |      �          0    17362    payment_methods 
   TABLE DATA           �   COPY _analytics.payment_methods (id, stripe_id, price_id, last_four, brand, exp_year, exp_month, customer_id, inserted_at, updated_at) FROM stdin;
 
   _analytics          supabase_admin    false    397   :|      �          0    17304    plans 
   TABLE DATA             COPY _analytics.plans (id, name, stripe_id, inserted_at, updated_at, period, price, limit_sources, limit_rate_limit, limit_alert_freq, limit_source_rate_limit, limit_saved_search_limit, limit_team_users_limit, limit_source_fields_limit, limit_source_ttl, type) FROM stdin;
 
   _analytics          supabase_admin    false    393   W|      �          0    17081    rules 
   TABLE DATA              COPY _analytics.rules (id, regex, sink, source_id, inserted_at, updated_at, regex_struct, lql_string, lql_filters) FROM stdin;
 
   _analytics          supabase_admin    false    373   �|      �          0    17288    saved_search_counters 
   TABLE DATA           �   COPY _analytics.saved_search_counters (id, "timestamp", saved_search_id, granularity, non_tailing_count, tailing_count) FROM stdin;
 
   _analytics          supabase_admin    false    391   �|      �          0    17212    saved_searches 
   TABLE DATA           �   COPY _analytics.saved_searches (id, querystring, source_id, inserted_at, updated_at, saved_by_user, lql_filters, lql_charts, "tailing?", tailing) FROM stdin;
 
   _analytics          supabase_admin    false    383   �|      �          0    17051    schema_migrations 
   TABLE DATA           E   COPY _analytics.schema_migrations (version, inserted_at) FROM stdin;
 
   _analytics          supabase_admin    false    367   }      �          0    17584 6   schema_migrations_286c7e02_ef59_4427_aa49_2a873d36e1a1 
   TABLE DATA           j   COPY _analytics.schema_migrations_286c7e02_ef59_4427_aa49_2a873d36e1a1 (version, inserted_at) FROM stdin;
 
   _analytics          supabase_admin    false    416   2�      �          0    17524 6   schema_migrations_47498229_5dda_4c5b_888a_beb0e74df840 
   TABLE DATA           j   COPY _analytics.schema_migrations_47498229_5dda_4c5b_888a_beb0e74df840 (version, inserted_at) FROM stdin;
 
   _analytics          supabase_admin    false    411   e�      �          0    17560 6   schema_migrations_773049a0_b37b_41cc_9169_a035ee907a7a 
   TABLE DATA           j   COPY _analytics.schema_migrations_773049a0_b37b_41cc_9169_a035ee907a7a (version, inserted_at) FROM stdin;
 
   _analytics          supabase_admin    false    414   ��      �          0    17572 6   schema_migrations_86d5aa1a_0d41_4995_90bc_7775bcad81b6 
   TABLE DATA           j   COPY _analytics.schema_migrations_86d5aa1a_0d41_4995_90bc_7775bcad81b6 (version, inserted_at) FROM stdin;
 
   _analytics          supabase_admin    false    415   ˀ      �          0    17596 6   schema_migrations_abd25a45_5021_427a_8da2_c9602510c8b3 
   TABLE DATA           j   COPY _analytics.schema_migrations_abd25a45_5021_427a_8da2_c9602510c8b3 (version, inserted_at) FROM stdin;
 
   _analytics          supabase_admin    false    417   ��      �          0    17548 6   schema_migrations_bdc54c9d_cdb9_481c_a037_1c10a5143270 
   TABLE DATA           j   COPY _analytics.schema_migrations_bdc54c9d_cdb9_481c_a037_1c10a5143270 (version, inserted_at) FROM stdin;
 
   _analytics          supabase_admin    false    413   1�      �          0    17536 6   schema_migrations_c92eca35_8bde_4506_a1c4_5f7ea577f688 
   TABLE DATA           j   COPY _analytics.schema_migrations_c92eca35_8bde_4506_a1c4_5f7ea577f688 (version, inserted_at) FROM stdin;
 
   _analytics          supabase_admin    false    412   d�      �          0    17608 6   schema_migrations_c9a01889_2682_44b0_b4f0_5ae165845478 
   TABLE DATA           j   COPY _analytics.schema_migrations_c9a01889_2682_44b0_b4f0_5ae165845478 (version, inserted_at) FROM stdin;
 
   _analytics          supabase_admin    false    418   ��      �          0    17512 6   schema_migrations_f9289a41_9dcf_4964_b7a6_61ed321dd81a 
   TABLE DATA           j   COPY _analytics.schema_migrations_f9289a41_9dcf_4964_b7a6_61ed321dd81a (version, inserted_at) FROM stdin;
 
   _analytics          supabase_admin    false    410   ʁ      �          0    17461    source_backends 
   TABLE DATA           c   COPY _analytics.source_backends (id, source_id, type, config, inserted_at, updated_at) FROM stdin;
 
   _analytics          supabase_admin    false    405   ��      �          0    17322    source_schemas 
   TABLE DATA           v   COPY _analytics.source_schemas (id, bigquery_schema, source_id, inserted_at, updated_at, schema_flat_map) FROM stdin;
 
   _analytics          supabase_admin    false    395   ł      �          0    17066    sources 
   TABLE DATA           �  COPY _analytics.sources (id, name, token, inserted_at, updated_at, user_id, public_token, favorite, bigquery_table_ttl, api_quota, webhook_notification_url, slack_hook_url, notifications, custom_event_message_keys, log_events_updated_at, bigquery_schema, notifications_every, bq_table_partition_type, lock_schema, validate_schema, drop_lql_filters, drop_lql_string, v2_pipeline, suggested_keys) FROM stdin;
 
   _analytics          supabase_admin    false    371   �      �          0    17201    system_metrics 
   TABLE DATA           `   COPY _analytics.system_metrics (id, all_logs_logged, node, inserted_at, updated_at) FROM stdin;
 
   _analytics          supabase_admin    false    381   �      �          0    17238 
   team_users 
   TABLE DATA           �   COPY _analytics.team_users (id, email, token, provider, email_preferred, name, image, email_me_product, phone, valid_google_account, provider_uid, team_id, inserted_at, updated_at, preferences) FROM stdin;
 
   _analytics          supabase_admin    false    387   S�      �          0    17226    teams 
   TABLE DATA           V   COPY _analytics.teams (id, name, user_id, inserted_at, updated_at, token) FROM stdin;
 
   _analytics          supabase_admin    false    385   p�      �          0    17057    users 
   TABLE DATA           �  COPY _analytics.users (id, email, provider, token, inserted_at, updated_at, api_key, old_api_key, email_preferred, name, image, email_me_product, admin, phone, bigquery_project_id, api_quota, bigquery_dataset_location, bigquery_dataset_id, valid_google_account, provider_uid, company, bigquery_udfs_hash, bigquery_processed_bytes_limit, "billing_enabled?", preferences, billing_enabled, endpoints_beta) FROM stdin;
 
   _analytics          supabase_admin    false    369   Ӆ      �          0    17387    vercel_auths 
   TABLE DATA           �   COPY _analytics.vercel_auths (id, access_token, installation_id, team_id, token_type, vercel_user_id, user_id, inserted_at, updated_at) FROM stdin;
 
   _analytics          supabase_admin    false    399   z�      �          0    17875 
   extensions 
   TABLE DATA           h   COPY _realtime.extensions (id, type, settings, tenant_external_id, inserted_at, updated_at) FROM stdin;
 	   _realtime          supabase_admin    false    431   ��      �          0    17861    schema_migrations 
   TABLE DATA           D   COPY _realtime.schema_migrations (version, inserted_at) FROM stdin;
 	   _realtime          supabase_admin    false    429   &�      �          0    17866    tenants 
   TABLE DATA           �   COPY _realtime.tenants (id, name, external_id, jwt_secret, max_concurrent_users, inserted_at, updated_at, max_events_per_second, postgres_cdc_default, max_bytes_per_second, max_channels_per_client, max_joins_per_second) FROM stdin;
 	   _realtime          supabase_admin    false    430   ��      �          0    16488    audit_log_entries 
   TABLE DATA           [   COPY auth.audit_log_entries (instance_id, id, payload, created_at, ip_address) FROM stdin;
    auth          supabase_auth_admin    false    336   i�      �          0    17841 
   flow_state 
   TABLE DATA           �   COPY auth.flow_state (id, user_id, auth_code, code_challenge_method, code_challenge, provider_type, provider_access_token, provider_refresh_token, created_at, updated_at, authentication_method) FROM stdin;
    auth          supabase_auth_admin    false    428   K�      �          0    17639 
   identities 
   TABLE DATA           q   COPY auth.identities (id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at) FROM stdin;
    auth          supabase_auth_admin    false    419   h�      �          0    16481 	   instances 
   TABLE DATA           T   COPY auth.instances (id, uuid, raw_base_config, created_at, updated_at) FROM stdin;
    auth          supabase_auth_admin    false    335   ��      �          0    17728    mfa_amr_claims 
   TABLE DATA           e   COPY auth.mfa_amr_claims (session_id, created_at, updated_at, authentication_method, id) FROM stdin;
    auth          supabase_auth_admin    false    423   ��      �          0    17716    mfa_challenges 
   TABLE DATA           Z   COPY auth.mfa_challenges (id, factor_id, created_at, verified_at, ip_address) FROM stdin;
    auth          supabase_auth_admin    false    422   Z�      �          0    17703    mfa_factors 
   TABLE DATA           t   COPY auth.mfa_factors (id, user_id, friendly_name, factor_type, status, created_at, updated_at, secret) FROM stdin;
    auth          supabase_auth_admin    false    421   w�      �          0    16470    refresh_tokens 
   TABLE DATA           |   COPY auth.refresh_tokens (instance_id, id, token, user_id, revoked, created_at, updated_at, parent, session_id) FROM stdin;
    auth          supabase_auth_admin    false    334   ��      �          0    17770    saml_providers 
   TABLE DATA           �   COPY auth.saml_providers (id, sso_provider_id, entity_id, metadata_xml, metadata_url, attribute_mapping, created_at, updated_at) FROM stdin;
    auth          supabase_auth_admin    false    426   z>      �          0    17788    saml_relay_states 
   TABLE DATA           �   COPY auth.saml_relay_states (id, sso_provider_id, request_id, for_email, redirect_to, from_ip_address, created_at, updated_at, flow_state_id) FROM stdin;
    auth          supabase_auth_admin    false    427   �>      �          0    16496    schema_migrations 
   TABLE DATA           2   COPY auth.schema_migrations (version) FROM stdin;
    auth          supabase_auth_admin    false    337   �>      �          0    17669    sessions 
   TABLE DATA           `   COPY auth.sessions (id, user_id, created_at, updated_at, factor_id, aal, not_after) FROM stdin;
    auth          supabase_auth_admin    false    420   �?      �          0    17755    sso_domains 
   TABLE DATA           X   COPY auth.sso_domains (id, sso_provider_id, domain, created_at, updated_at) FROM stdin;
    auth          supabase_auth_admin    false    425   iM      �          0    17746    sso_providers 
   TABLE DATA           N   COPY auth.sso_providers (id, resource_id, created_at, updated_at) FROM stdin;
    auth          supabase_auth_admin    false    424   �M      �          0    16458    users 
   TABLE DATA           A  COPY auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, invited_at, confirmation_token, confirmation_sent_at, recovery_token, recovery_sent_at, email_change_token_new, email_change, email_change_sent_at, last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at, phone, phone_confirmed_at, phone_change, phone_change_token, phone_change_sent_at, email_change_token_current, email_change_confirm_status, banned_until, reauthentication_token, reauthentication_sent_at, is_sso_user, deleted_at) FROM stdin;
    auth          supabase_auth_admin    false    332   �M      �          0    29334    job 
   TABLE DATA           n   COPY cron.job (jobid, schedule, command, nodename, nodeport, database, username, active, jobname) FROM stdin;
    cron          supabase_admin    false    449   �g      �          0    29353    job_run_details 
   TABLE DATA           �   COPY cron.job_run_details (jobid, runid, job_pid, database, username, command, status, return_message, start_time, end_time) FROM stdin;
    cron          supabase_admin    false    451   Zh      �          0    16858    key 
   TABLE DATA           �   COPY pgsodium.key (id, status, created, expires, key_type, key_id, key_context, name, associated_data, raw_key, raw_key_nonce, parent_key, comment, user_data) FROM stdin;
    pgsodium          supabase_admin    false    359   ��      �          0    26881    achievements 
   TABLE DATA           T   COPY public.achievements (id, created_at, name, description, icon_name) FROM stdin;
    public          supabase_admin    false    435   ��      �          0    27130    answers_exercises 
   TABLE DATA           e   COPY public.answers_exercises (created_at, answer, exercise, is_correct, order_position) FROM stdin;
    public          supabase_admin    false    445   ��      �          0    27056 	   exercises 
   TABLE DATA           O   COPY public.exercises (id, created_at, question, priority, set_id) FROM stdin;
    public          supabase_admin    false    439   ��      �          0    27074 
   flashcards 
   TABLE DATA           X   COPY public.flashcards (id, created_at, question, answer, priority, set_id) FROM stdin;
    public          supabase_admin    false    441   ��      �          0    26804    friends 
   TABLE DATA           G   COPY public.friends (created_at, user_from_id, user_to_id) FROM stdin;
    public          supabase_admin    false    433   n�      �          0    26976    learning_projects 
   TABLE DATA           u   COPY public.learning_projects (id, created_at, name, description, "group", is_published, owner_id, tags) FROM stdin;
    public          supabase_admin    false    437   ��      �          0    27113    links 
   TABLE DATA           i   COPY public.links (id, created_at, link_url, learning_project, title, subtitle, description) FROM stdin;
    public          supabase_admin    false    443         
          0    135317    player_answers 
   TABLE DATA           s   COPY public.player_answers (room_id, user_id, round, answer_correct, answered_at, answer_time, answer) FROM stdin;
    public          supabase_admin    false    465                   0    53025    private_room_states 
   TABLE DATA           T   COPY public.private_room_states (room_id, data, created_at, updated_at) FROM stdin;
    public          supabase_admin    false    457   3      �          0    26744    profiles 
   TABLE DATA           S   COPY public.profiles (id, username, room_id, user_tags, user_settings) FROM stdin;
    public          supabase_admin    false    432   P                 0    30854    project_ratings 
   TABLE DATA           R   COPY public.project_ratings (project_id, created_at, user_id, rating) FROM stdin;
    public          supabase_admin    false    452   W                0    53001    public_room_states 
   TABLE DATA           S   COPY public.public_room_states (room_id, created_at, data, updated_at) FROM stdin;
    public          supabase_admin    false    456   .                0    233293    queue 
   TABLE DATA           D   COPY public.queue (id, created_at, room_id, type, data) FROM stdin;
    public          supabase_admin    false    467   l      �          0    27238    rooms 
   TABLE DATA           �   COPY public.rooms (created_at, name, id, code, project_id, secret_key, is_ingame, host, max_size, is_private, share_code) FROM stdin;
    public          supabase_admin    false    446   �                0    38289    sets 
   TABLE DATA           F   COPY public.sets (id, name, type, created_at, project_id) FROM stdin;
    public          supabase_admin    false    454   6      	          0    69388    tracker 
   TABLE DATA           4   COPY public.tracker (key, last_updated) FROM stdin;
    public          supabase_admin    false    464   �%      �          0    26864    user_achievements 
   TABLE DATA           P   COPY public.user_achievements (created_at, achievement_id, user_id) FROM stdin;
    public          supabase_admin    false    434   '      �          0    27260    user_learning_projects 
   TABLE DATA           a   COPY public.user_learning_projects (created_at, learning_project_id, user_id, stats) FROM stdin;
    public          supabase_admin    false    447   �)                0    53126    schema_migrations 
   TABLE DATA           C   COPY realtime.schema_migrations (version, inserted_at) FROM stdin;
    realtime          supabase_admin    false    458   �@                0    53149    subscription 
   TABLE DATA           b   COPY realtime.subscription (id, subscription_id, entity, filters, claims, created_at) FROM stdin;
    realtime          supabase_admin    false    461   �A      �          0    16509    buckets 
   TABLE DATA           �   COPY storage.buckets (id, name, owner, created_at, updated_at, public, avif_autodetection, file_size_limit, allowed_mime_types) FROM stdin;
    storage          supabase_storage_admin    false    338   �J      �          0    16551 
   migrations 
   TABLE DATA           B   COPY storage.migrations (id, name, hash, executed_at) FROM stdin;
    storage          supabase_storage_admin    false    340   �K      �          0    16524    objects 
   TABLE DATA           {   COPY storage.objects (id, bucket_id, name, owner, created_at, updated_at, last_accessed_at, metadata, version) FROM stdin;
    storage          supabase_storage_admin    false    339   �N      �          0    16621    hooks 
   TABLE DATA           a   COPY supabase_functions.hooks (id, hook_table_id, hook_name, created_at, request_id) FROM stdin;
    supabase_functions          supabase_functions_admin    false    348   Rf      �          0    16612 
   migrations 
   TABLE DATA           F   COPY supabase_functions.migrations (version, inserted_at) FROM stdin;
    supabase_functions          supabase_functions_admin    false    346   ܍      �          0    17019    secrets 
   TABLE DATA           f   COPY vault.secrets (id, name, description, secret, key_id, nonce, created_at, updated_at) FROM stdin;
    vault          supabase_admin    false    365   <�      -           0    0    billing_accounts_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('_analytics.billing_accounts_id_seq', 1, false);
       
   _analytics          supabase_admin    false    388            .           0    0    billing_counts_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('_analytics.billing_counts_id_seq', 1, false);
       
   _analytics          supabase_admin    false    402            /           0    0    endpoint_queries_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('_analytics.endpoint_queries_id_seq', 3, true);
       
   _analytics          supabase_admin    false    400            0           0    0    oauth_access_grants_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('_analytics.oauth_access_grants_id_seq', 1, false);
       
   _analytics          supabase_admin    false    376            1           0    0    oauth_access_tokens_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('_analytics.oauth_access_tokens_id_seq', 1, false);
       
   _analytics          supabase_admin    false    378            2           0    0    oauth_applications_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('_analytics.oauth_applications_id_seq', 1, false);
       
   _analytics          supabase_admin    false    374            3           0    0    partner_users_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('_analytics.partner_users_id_seq', 1, false);
       
   _analytics          supabase_admin    false    408            4           0    0    partners_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('_analytics.partners_id_seq', 1, false);
       
   _analytics          supabase_admin    false    406            5           0    0    payment_methods_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('_analytics.payment_methods_id_seq', 1, false);
       
   _analytics          supabase_admin    false    396            6           0    0    plans_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('_analytics.plans_id_seq', 1, true);
       
   _analytics          supabase_admin    false    392            7           0    0    rules_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('_analytics.rules_id_seq', 1, false);
       
   _analytics          supabase_admin    false    372            8           0    0    saved_search_counters_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('_analytics.saved_search_counters_id_seq', 1, false);
       
   _analytics          supabase_admin    false    390            9           0    0    saved_searches_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('_analytics.saved_searches_id_seq', 1, false);
       
   _analytics          supabase_admin    false    382            :           0    0    source_backends_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('_analytics.source_backends_id_seq', 9, true);
       
   _analytics          supabase_admin    false    404            ;           0    0    source_schemas_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('_analytics.source_schemas_id_seq', 1, false);
       
   _analytics          supabase_admin    false    394            <           0    0    sources_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('_analytics.sources_id_seq', 9, true);
       
   _analytics          supabase_admin    false    370            =           0    0    system_metrics_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('_analytics.system_metrics_id_seq', 1, true);
       
   _analytics          supabase_admin    false    380            >           0    0    team_users_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('_analytics.team_users_id_seq', 1, false);
       
   _analytics          supabase_admin    false    386            ?           0    0    teams_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('_analytics.teams_id_seq', 1, true);
       
   _analytics          supabase_admin    false    384            @           0    0    users_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('_analytics.users_id_seq', 235, true);
       
   _analytics          supabase_admin    false    368            A           0    0    vercel_auths_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('_analytics.vercel_auths_id_seq', 1, false);
       
   _analytics          supabase_admin    false    398            B           0    0    refresh_tokens_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('auth.refresh_tokens_id_seq', 11946, true);
          auth          supabase_auth_admin    false    333            C           0    0 	   jobid_seq    SEQUENCE SET     5   SELECT pg_catalog.setval('cron.jobid_seq', 1, true);
          cron          supabase_admin    false    448            D           0    0 	   runid_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('cron.runid_seq', 1435, true);
          cron          supabase_admin    false    450            E           0    0    key_key_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('pgsodium.key_key_id_seq', 1, false);
          pgsodium          supabase_admin    false    358            F           0    0    achievements_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.achievements_id_seq', 11, true);
          public          supabase_admin    false    436            G           0    0    exercises_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.exercises_id_seq', 410, true);
          public          supabase_admin    false    440            H           0    0    learning_projects_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.learning_projects_id_seq', 1100, true);
          public          supabase_admin    false    438            I           0    0    lp_flashcards_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.lp_flashcards_id_seq', 1006, true);
          public          supabase_admin    false    442            J           0    0    lp_links_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.lp_links_id_seq', 879, true);
          public          supabase_admin    false    444            K           0    0    project_ratings_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.project_ratings_id_seq', 1, false);
          public          supabase_admin    false    453            L           0    0    sets_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.sets_id_seq', 4561, true);
          public          supabase_admin    false    455            M           0    0    subscription_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('realtime.subscription_id_seq', 904028, true);
          realtime          supabase_admin    false    460            N           0    0    hooks_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('supabase_functions.hooks_id_seq', 1034, true);
          supabase_functions          supabase_functions_admin    false    347            �           2606    17270 &   billing_accounts billing_accounts_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY _analytics.billing_accounts
    ADD CONSTRAINT billing_accounts_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY _analytics.billing_accounts DROP CONSTRAINT billing_accounts_pkey;
    
   _analytics            supabase_admin    false    389            �           2606    17428 "   billing_counts billing_counts_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY _analytics.billing_counts
    ADD CONSTRAINT billing_counts_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY _analytics.billing_counts DROP CONSTRAINT billing_counts_pkey;
    
   _analytics            supabase_admin    false    403            �           2606    17413 &   endpoint_queries endpoint_queries_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY _analytics.endpoint_queries
    ADD CONSTRAINT endpoint_queries_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY _analytics.endpoint_queries DROP CONSTRAINT endpoint_queries_pkey;
    
   _analytics            supabase_admin    false    401            �           2606    17115 ,   oauth_access_grants oauth_access_grants_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY _analytics.oauth_access_grants
    ADD CONSTRAINT oauth_access_grants_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY _analytics.oauth_access_grants DROP CONSTRAINT oauth_access_grants_pkey;
    
   _analytics            supabase_admin    false    377            �           2606    17131 ,   oauth_access_tokens oauth_access_tokens_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY _analytics.oauth_access_tokens
    ADD CONSTRAINT oauth_access_tokens_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY _analytics.oauth_access_tokens DROP CONSTRAINT oauth_access_tokens_pkey;
    
   _analytics            supabase_admin    false    379            �           2606    17104 *   oauth_applications oauth_applications_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY _analytics.oauth_applications
    ADD CONSTRAINT oauth_applications_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY _analytics.oauth_applications DROP CONSTRAINT oauth_applications_pkey;
    
   _analytics            supabase_admin    false    375                       2606    17499     partner_users partner_users_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY _analytics.partner_users
    ADD CONSTRAINT partner_users_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY _analytics.partner_users DROP CONSTRAINT partner_users_pkey;
    
   _analytics            supabase_admin    false    409            �           2606    17492    partners partners_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY _analytics.partners
    ADD CONSTRAINT partners_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY _analytics.partners DROP CONSTRAINT partners_pkey;
    
   _analytics            supabase_admin    false    407            �           2606    17369 $   payment_methods payment_methods_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY _analytics.payment_methods
    ADD CONSTRAINT payment_methods_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY _analytics.payment_methods DROP CONSTRAINT payment_methods_pkey;
    
   _analytics            supabase_admin    false    397            �           2606    17311    plans plans_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY _analytics.plans
    ADD CONSTRAINT plans_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY _analytics.plans DROP CONSTRAINT plans_pkey;
    
   _analytics            supabase_admin    false    393            �           2606    17086    rules rules_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY _analytics.rules
    ADD CONSTRAINT rules_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY _analytics.rules DROP CONSTRAINT rules_pkey;
    
   _analytics            supabase_admin    false    373            �           2606    17296 0   saved_search_counters saved_search_counters_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY _analytics.saved_search_counters
    ADD CONSTRAINT saved_search_counters_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY _analytics.saved_search_counters DROP CONSTRAINT saved_search_counters_pkey;
    
   _analytics            supabase_admin    false    391            �           2606    17217 "   saved_searches saved_searches_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY _analytics.saved_searches
    ADD CONSTRAINT saved_searches_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY _analytics.saved_searches DROP CONSTRAINT saved_searches_pkey;
    
   _analytics            supabase_admin    false    383                       2606    17588 r   schema_migrations_286c7e02_ef59_4427_aa49_2a873d36e1a1 schema_migrations_286c7e02_ef59_4427_aa49_2a873d36e1a1_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY _analytics.schema_migrations_286c7e02_ef59_4427_aa49_2a873d36e1a1
    ADD CONSTRAINT schema_migrations_286c7e02_ef59_4427_aa49_2a873d36e1a1_pkey PRIMARY KEY (version);
 �   ALTER TABLE ONLY _analytics.schema_migrations_286c7e02_ef59_4427_aa49_2a873d36e1a1 DROP CONSTRAINT schema_migrations_286c7e02_ef59_4427_aa49_2a873d36e1a1_pkey;
    
   _analytics            supabase_admin    false    416                       2606    17528 r   schema_migrations_47498229_5dda_4c5b_888a_beb0e74df840 schema_migrations_47498229_5dda_4c5b_888a_beb0e74df840_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY _analytics.schema_migrations_47498229_5dda_4c5b_888a_beb0e74df840
    ADD CONSTRAINT schema_migrations_47498229_5dda_4c5b_888a_beb0e74df840_pkey PRIMARY KEY (version);
 �   ALTER TABLE ONLY _analytics.schema_migrations_47498229_5dda_4c5b_888a_beb0e74df840 DROP CONSTRAINT schema_migrations_47498229_5dda_4c5b_888a_beb0e74df840_pkey;
    
   _analytics            supabase_admin    false    411                       2606    17564 r   schema_migrations_773049a0_b37b_41cc_9169_a035ee907a7a schema_migrations_773049a0_b37b_41cc_9169_a035ee907a7a_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY _analytics.schema_migrations_773049a0_b37b_41cc_9169_a035ee907a7a
    ADD CONSTRAINT schema_migrations_773049a0_b37b_41cc_9169_a035ee907a7a_pkey PRIMARY KEY (version);
 �   ALTER TABLE ONLY _analytics.schema_migrations_773049a0_b37b_41cc_9169_a035ee907a7a DROP CONSTRAINT schema_migrations_773049a0_b37b_41cc_9169_a035ee907a7a_pkey;
    
   _analytics            supabase_admin    false    414                       2606    17576 r   schema_migrations_86d5aa1a_0d41_4995_90bc_7775bcad81b6 schema_migrations_86d5aa1a_0d41_4995_90bc_7775bcad81b6_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY _analytics.schema_migrations_86d5aa1a_0d41_4995_90bc_7775bcad81b6
    ADD CONSTRAINT schema_migrations_86d5aa1a_0d41_4995_90bc_7775bcad81b6_pkey PRIMARY KEY (version);
 �   ALTER TABLE ONLY _analytics.schema_migrations_86d5aa1a_0d41_4995_90bc_7775bcad81b6 DROP CONSTRAINT schema_migrations_86d5aa1a_0d41_4995_90bc_7775bcad81b6_pkey;
    
   _analytics            supabase_admin    false    415                       2606    17600 r   schema_migrations_abd25a45_5021_427a_8da2_c9602510c8b3 schema_migrations_abd25a45_5021_427a_8da2_c9602510c8b3_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY _analytics.schema_migrations_abd25a45_5021_427a_8da2_c9602510c8b3
    ADD CONSTRAINT schema_migrations_abd25a45_5021_427a_8da2_c9602510c8b3_pkey PRIMARY KEY (version);
 �   ALTER TABLE ONLY _analytics.schema_migrations_abd25a45_5021_427a_8da2_c9602510c8b3 DROP CONSTRAINT schema_migrations_abd25a45_5021_427a_8da2_c9602510c8b3_pkey;
    
   _analytics            supabase_admin    false    417            
           2606    17552 r   schema_migrations_bdc54c9d_cdb9_481c_a037_1c10a5143270 schema_migrations_bdc54c9d_cdb9_481c_a037_1c10a5143270_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY _analytics.schema_migrations_bdc54c9d_cdb9_481c_a037_1c10a5143270
    ADD CONSTRAINT schema_migrations_bdc54c9d_cdb9_481c_a037_1c10a5143270_pkey PRIMARY KEY (version);
 �   ALTER TABLE ONLY _analytics.schema_migrations_bdc54c9d_cdb9_481c_a037_1c10a5143270 DROP CONSTRAINT schema_migrations_bdc54c9d_cdb9_481c_a037_1c10a5143270_pkey;
    
   _analytics            supabase_admin    false    413                       2606    17540 r   schema_migrations_c92eca35_8bde_4506_a1c4_5f7ea577f688 schema_migrations_c92eca35_8bde_4506_a1c4_5f7ea577f688_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY _analytics.schema_migrations_c92eca35_8bde_4506_a1c4_5f7ea577f688
    ADD CONSTRAINT schema_migrations_c92eca35_8bde_4506_a1c4_5f7ea577f688_pkey PRIMARY KEY (version);
 �   ALTER TABLE ONLY _analytics.schema_migrations_c92eca35_8bde_4506_a1c4_5f7ea577f688 DROP CONSTRAINT schema_migrations_c92eca35_8bde_4506_a1c4_5f7ea577f688_pkey;
    
   _analytics            supabase_admin    false    412                       2606    17612 r   schema_migrations_c9a01889_2682_44b0_b4f0_5ae165845478 schema_migrations_c9a01889_2682_44b0_b4f0_5ae165845478_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY _analytics.schema_migrations_c9a01889_2682_44b0_b4f0_5ae165845478
    ADD CONSTRAINT schema_migrations_c9a01889_2682_44b0_b4f0_5ae165845478_pkey PRIMARY KEY (version);
 �   ALTER TABLE ONLY _analytics.schema_migrations_c9a01889_2682_44b0_b4f0_5ae165845478 DROP CONSTRAINT schema_migrations_c9a01889_2682_44b0_b4f0_5ae165845478_pkey;
    
   _analytics            supabase_admin    false    418                       2606    17516 r   schema_migrations_f9289a41_9dcf_4964_b7a6_61ed321dd81a schema_migrations_f9289a41_9dcf_4964_b7a6_61ed321dd81a_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY _analytics.schema_migrations_f9289a41_9dcf_4964_b7a6_61ed321dd81a
    ADD CONSTRAINT schema_migrations_f9289a41_9dcf_4964_b7a6_61ed321dd81a_pkey PRIMARY KEY (version);
 �   ALTER TABLE ONLY _analytics.schema_migrations_f9289a41_9dcf_4964_b7a6_61ed321dd81a DROP CONSTRAINT schema_migrations_f9289a41_9dcf_4964_b7a6_61ed321dd81a_pkey;
    
   _analytics            supabase_admin    false    410            �           2606    17055 (   schema_migrations schema_migrations_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY _analytics.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);
 V   ALTER TABLE ONLY _analytics.schema_migrations DROP CONSTRAINT schema_migrations_pkey;
    
   _analytics            supabase_admin    false    367            �           2606    17468 $   source_backends source_backends_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY _analytics.source_backends
    ADD CONSTRAINT source_backends_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY _analytics.source_backends DROP CONSTRAINT source_backends_pkey;
    
   _analytics            supabase_admin    false    405            �           2606    17329 "   source_schemas source_schemas_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY _analytics.source_schemas
    ADD CONSTRAINT source_schemas_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY _analytics.source_schemas DROP CONSTRAINT source_schemas_pkey;
    
   _analytics            supabase_admin    false    395            �           2606    17071    sources sources_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY _analytics.sources
    ADD CONSTRAINT sources_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY _analytics.sources DROP CONSTRAINT sources_pkey;
    
   _analytics            supabase_admin    false    371            �           2606    17206 "   system_metrics system_metrics_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY _analytics.system_metrics
    ADD CONSTRAINT system_metrics_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY _analytics.system_metrics DROP CONSTRAINT system_metrics_pkey;
    
   _analytics            supabase_admin    false    381            �           2606    17247    team_users team_users_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY _analytics.team_users
    ADD CONSTRAINT team_users_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY _analytics.team_users DROP CONSTRAINT team_users_pkey;
    
   _analytics            supabase_admin    false    387            �           2606    17231    teams teams_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY _analytics.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY _analytics.teams DROP CONSTRAINT teams_pkey;
    
   _analytics            supabase_admin    false    385            �           2606    17064    users users_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY _analytics.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY _analytics.users DROP CONSTRAINT users_pkey;
    
   _analytics            supabase_admin    false    369            �           2606    17394    vercel_auths vercel_auths_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY _analytics.vercel_auths
    ADD CONSTRAINT vercel_auths_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY _analytics.vercel_auths DROP CONSTRAINT vercel_auths_pkey;
    
   _analytics            supabase_admin    false    399            F           2606    17881    extensions extensions_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY _realtime.extensions
    ADD CONSTRAINT extensions_pkey PRIMARY KEY (id);
 G   ALTER TABLE ONLY _realtime.extensions DROP CONSTRAINT extensions_pkey;
    	   _realtime            supabase_admin    false    431            A           2606    17865 (   schema_migrations schema_migrations_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY _realtime.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);
 U   ALTER TABLE ONLY _realtime.schema_migrations DROP CONSTRAINT schema_migrations_pkey;
    	   _realtime            supabase_admin    false    429            D           2606    17873    tenants tenants_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY _realtime.tenants
    ADD CONSTRAINT tenants_pkey PRIMARY KEY (id);
 A   ALTER TABLE ONLY _realtime.tenants DROP CONSTRAINT tenants_pkey;
    	   _realtime            supabase_admin    false    430            '           2606    17741    mfa_amr_claims amr_id_pk 
   CONSTRAINT     T   ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT amr_id_pk PRIMARY KEY (id);
 @   ALTER TABLE ONLY auth.mfa_amr_claims DROP CONSTRAINT amr_id_pk;
       auth            supabase_auth_admin    false    423            �           2606    16494 (   audit_log_entries audit_log_entries_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY auth.audit_log_entries
    ADD CONSTRAINT audit_log_entries_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY auth.audit_log_entries DROP CONSTRAINT audit_log_entries_pkey;
       auth            supabase_auth_admin    false    336            =           2606    17847    flow_state flow_state_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY auth.flow_state
    ADD CONSTRAINT flow_state_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY auth.flow_state DROP CONSTRAINT flow_state_pkey;
       auth            supabase_auth_admin    false    428                       2606    17645    identities identities_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_pkey PRIMARY KEY (provider, id);
 B   ALTER TABLE ONLY auth.identities DROP CONSTRAINT identities_pkey;
       auth            supabase_auth_admin    false    419    419            �           2606    16487    instances instances_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY auth.instances
    ADD CONSTRAINT instances_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY auth.instances DROP CONSTRAINT instances_pkey;
       auth            supabase_auth_admin    false    335            )           2606    17734 C   mfa_amr_claims mfa_amr_claims_session_id_authentication_method_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_authentication_method_pkey UNIQUE (session_id, authentication_method);
 k   ALTER TABLE ONLY auth.mfa_amr_claims DROP CONSTRAINT mfa_amr_claims_session_id_authentication_method_pkey;
       auth            supabase_auth_admin    false    423    423            %           2606    17722 "   mfa_challenges mfa_challenges_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY auth.mfa_challenges DROP CONSTRAINT mfa_challenges_pkey;
       auth            supabase_auth_admin    false    422                        2606    17709    mfa_factors mfa_factors_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY auth.mfa_factors DROP CONSTRAINT mfa_factors_pkey;
       auth            supabase_auth_admin    false    421            �           2606    16477 "   refresh_tokens refresh_tokens_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY auth.refresh_tokens DROP CONSTRAINT refresh_tokens_pkey;
       auth            supabase_auth_admin    false    334            �           2606    17652 *   refresh_tokens refresh_tokens_token_unique 
   CONSTRAINT     d   ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_token_unique UNIQUE (token);
 R   ALTER TABLE ONLY auth.refresh_tokens DROP CONSTRAINT refresh_tokens_token_unique;
       auth            supabase_auth_admin    false    334            2           2606    17781 +   saml_providers saml_providers_entity_id_key 
   CONSTRAINT     i   ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_entity_id_key UNIQUE (entity_id);
 S   ALTER TABLE ONLY auth.saml_providers DROP CONSTRAINT saml_providers_entity_id_key;
       auth            supabase_auth_admin    false    426            4           2606    17779 "   saml_providers saml_providers_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY auth.saml_providers DROP CONSTRAINT saml_providers_pkey;
       auth            supabase_auth_admin    false    426            9           2606    17795 (   saml_relay_states saml_relay_states_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY auth.saml_relay_states DROP CONSTRAINT saml_relay_states_pkey;
       auth            supabase_auth_admin    false    427            �           2606    16500 (   schema_migrations schema_migrations_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY auth.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);
 P   ALTER TABLE ONLY auth.schema_migrations DROP CONSTRAINT schema_migrations_pkey;
       auth            supabase_auth_admin    false    337                       2606    17673    sessions sessions_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY auth.sessions DROP CONSTRAINT sessions_pkey;
       auth            supabase_auth_admin    false    420            /           2606    17762    sso_domains sso_domains_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY auth.sso_domains DROP CONSTRAINT sso_domains_pkey;
       auth            supabase_auth_admin    false    425            +           2606    17753     sso_providers sso_providers_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY auth.sso_providers
    ADD CONSTRAINT sso_providers_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY auth.sso_providers DROP CONSTRAINT sso_providers_pkey;
       auth            supabase_auth_admin    false    424            �           2606    17835    users users_phone_key 
   CONSTRAINT     O   ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);
 =   ALTER TABLE ONLY auth.users DROP CONSTRAINT users_phone_key;
       auth            supabase_auth_admin    false    332            �           2606    16464    users users_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY auth.users DROP CONSTRAINT users_pkey;
       auth            supabase_auth_admin    false    332            T           2606    26894    achievements achievements_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.achievements
    ADD CONSTRAINT achievements_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.achievements DROP CONSTRAINT achievements_pkey;
       public            supabase_admin    false    435            b           2606    216856 (   answers_exercises answers_exercises_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.answers_exercises
    ADD CONSTRAINT answers_exercises_pkey PRIMARY KEY (exercise, order_position);
 R   ALTER TABLE ONLY public.answers_exercises DROP CONSTRAINT answers_exercises_pkey;
       public            supabase_admin    false    445    445            Y           2606    27068    exercises exercises_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.exercises
    ADD CONSTRAINT exercises_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.exercises DROP CONSTRAINT exercises_pkey;
       public            supabase_admin    false    439            N           2606    27581    friends friends_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.friends
    ADD CONSTRAINT friends_pkey PRIMARY KEY (user_from_id, user_to_id);
 >   ALTER TABLE ONLY public.friends DROP CONSTRAINT friends_pkey;
       public            supabase_admin    false    433    433            W           2606    26987 (   learning_projects learning_projects_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.learning_projects
    ADD CONSTRAINT learning_projects_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.learning_projects DROP CONSTRAINT learning_projects_pkey;
       public            supabase_admin    false    437            ]           2606    27085    flashcards lp_flashcards_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.flashcards
    ADD CONSTRAINT lp_flashcards_pkey PRIMARY KEY (id);
 G   ALTER TABLE ONLY public.flashcards DROP CONSTRAINT lp_flashcards_pkey;
       public            supabase_admin    false    441            _           2606    27124    links lp_links_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.links
    ADD CONSTRAINT lp_links_pkey PRIMARY KEY (id);
 =   ALTER TABLE ONLY public.links DROP CONSTRAINT lp_links_pkey;
       public            supabase_admin    false    443            �           2606    135433 "   player_answers player_answers_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY public.player_answers
    ADD CONSTRAINT player_answers_pkey PRIMARY KEY (room_id, user_id, round);
 L   ALTER TABLE ONLY public.player_answers DROP CONSTRAINT player_answers_pkey;
       public            supabase_admin    false    465    465    465            x           2606    53032 ,   private_room_states private_room_states_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.private_room_states
    ADD CONSTRAINT private_room_states_pkey PRIMARY KEY (room_id);
 V   ALTER TABLE ONLY public.private_room_states DROP CONSTRAINT private_room_states_pkey;
       public            supabase_admin    false    457            I           2606    26750    profiles profiles_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.profiles DROP CONSTRAINT profiles_pkey;
       public            supabase_admin    false    432            L           2606    27779    profiles profiles_username_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_username_key UNIQUE (username);
 H   ALTER TABLE ONLY public.profiles DROP CONSTRAINT profiles_username_key;
       public            supabase_admin    false    432            r           2606    37194 $   project_ratings project_ratings_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY public.project_ratings
    ADD CONSTRAINT project_ratings_pkey PRIMARY KEY (project_id, user_id);
 N   ALTER TABLE ONLY public.project_ratings DROP CONSTRAINT project_ratings_pkey;
       public            supabase_admin    false    452    452            �           2606    233304    queue queue_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.queue
    ADD CONSTRAINT queue_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.queue DROP CONSTRAINT queue_pkey;
       public            supabase_admin    false    467            v           2606    53012 #   public_room_states room_states_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.public_room_states
    ADD CONSTRAINT room_states_pkey PRIMARY KEY (room_id);
 M   ALTER TABLE ONLY public.public_room_states DROP CONSTRAINT room_states_pkey;
       public            supabase_admin    false    456            e           2606    28863    rooms rooms_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.rooms DROP CONSTRAINT rooms_pkey;
       public            supabase_admin    false    446            h           2606    45883    rooms rooms_share_code_key 
   CONSTRAINT     [   ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_share_code_key UNIQUE (share_code);
 D   ALTER TABLE ONLY public.rooms DROP CONSTRAINT rooms_share_code_key;
       public            supabase_admin    false    446            t           2606    38300    sets sets_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.sets
    ADD CONSTRAINT sets_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.sets DROP CONSTRAINT sets_pkey;
       public            supabase_admin    false    454            �           2606    69668    tracker tracker_key_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.tracker
    ADD CONSTRAINT tracker_key_key UNIQUE (key);
 A   ALTER TABLE ONLY public.tracker DROP CONSTRAINT tracker_key_key;
       public            supabase_admin    false    464            �           2606    69394    tracker tracker_pk 
   CONSTRAINT     Q   ALTER TABLE ONLY public.tracker
    ADD CONSTRAINT tracker_pk PRIMARY KEY (key);
 <   ALTER TABLE ONLY public.tracker DROP CONSTRAINT tracker_pk;
       public            supabase_admin    false    464            P           2606    86183 )   user_achievements unique_user_achievement 
   CONSTRAINT     w   ALTER TABLE ONLY public.user_achievements
    ADD CONSTRAINT unique_user_achievement UNIQUE (user_id, achievement_id);
 S   ALTER TABLE ONLY public.user_achievements DROP CONSTRAINT unique_user_achievement;
       public            supabase_admin    false    434    434            R           2606    86877 (   user_achievements user_achievements_pkey 
   CONSTRAINT     {   ALTER TABLE ONLY public.user_achievements
    ADD CONSTRAINT user_achievements_pkey PRIMARY KEY (achievement_id, user_id);
 R   ALTER TABLE ONLY public.user_achievements DROP CONSTRAINT user_achievements_pkey;
       public            supabase_admin    false    434    434            j           2606    38230 2   user_learning_projects user_learning_projects_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.user_learning_projects
    ADD CONSTRAINT user_learning_projects_pkey PRIMARY KEY (learning_project_id, user_id);
 \   ALTER TABLE ONLY public.user_learning_projects DROP CONSTRAINT user_learning_projects_pkey;
       public            supabase_admin    false    447    447            }           2606    53157    subscription pk_subscription 
   CONSTRAINT     \   ALTER TABLE ONLY realtime.subscription
    ADD CONSTRAINT pk_subscription PRIMARY KEY (id);
 H   ALTER TABLE ONLY realtime.subscription DROP CONSTRAINT pk_subscription;
       realtime            supabase_admin    false    461            z           2606    53130 (   schema_migrations schema_migrations_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY realtime.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);
 T   ALTER TABLE ONLY realtime.schema_migrations DROP CONSTRAINT schema_migrations_pkey;
       realtime            supabase_admin    false    458            �           2606    16517    buckets buckets_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY storage.buckets
    ADD CONSTRAINT buckets_pkey PRIMARY KEY (id);
 ?   ALTER TABLE ONLY storage.buckets DROP CONSTRAINT buckets_pkey;
       storage            supabase_storage_admin    false    338            �           2606    16558    migrations migrations_name_key 
   CONSTRAINT     Z   ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_name_key UNIQUE (name);
 I   ALTER TABLE ONLY storage.migrations DROP CONSTRAINT migrations_name_key;
       storage            supabase_storage_admin    false    340            �           2606    16556    migrations migrations_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);
 E   ALTER TABLE ONLY storage.migrations DROP CONSTRAINT migrations_pkey;
       storage            supabase_storage_admin    false    340            �           2606    16534    objects objects_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT objects_pkey PRIMARY KEY (id);
 ?   ALTER TABLE ONLY storage.objects DROP CONSTRAINT objects_pkey;
       storage            supabase_storage_admin    false    339            �           2606    16629    hooks hooks_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY supabase_functions.hooks
    ADD CONSTRAINT hooks_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY supabase_functions.hooks DROP CONSTRAINT hooks_pkey;
       supabase_functions            supabase_functions_admin    false    348            �           2606    16619    migrations migrations_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY supabase_functions.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);
 P   ALTER TABLE ONLY supabase_functions.migrations DROP CONSTRAINT migrations_pkey;
       supabase_functions            supabase_functions_admin    false    346            �           1259    17360 &   billing_accounts_stripe_customer_index    INDEX     y   CREATE UNIQUE INDEX billing_accounts_stripe_customer_index ON _analytics.billing_accounts USING btree (stripe_customer);
 >   DROP INDEX _analytics.billing_accounts_stripe_customer_index;
    
   _analytics            supabase_admin    false    389            �           1259    17312    billing_accounts_user_id_index    INDEX     i   CREATE UNIQUE INDEX billing_accounts_user_id_index ON _analytics.billing_accounts USING btree (user_id);
 6   DROP INDEX _analytics.billing_accounts_user_id_index;
    
   _analytics            supabase_admin    false    389            �           1259    17441     billing_counts_inserted_at_index    INDEX     f   CREATE INDEX billing_counts_inserted_at_index ON _analytics.billing_counts USING btree (inserted_at);
 8   DROP INDEX _analytics.billing_counts_inserted_at_index;
    
   _analytics            supabase_admin    false    403            �           1259    17440    billing_counts_source_id_index    INDEX     b   CREATE INDEX billing_counts_source_id_index ON _analytics.billing_counts USING btree (source_id);
 6   DROP INDEX _analytics.billing_counts_source_id_index;
    
   _analytics            supabase_admin    false    403            �           1259    17439    billing_counts_user_id_index    INDEX     ^   CREATE INDEX billing_counts_user_id_index ON _analytics.billing_counts USING btree (user_id);
 4   DROP INDEX _analytics.billing_counts_user_id_index;
    
   _analytics            supabase_admin    false    403            �           1259    17420    endpoint_queries_token_index    INDEX     e   CREATE UNIQUE INDEX endpoint_queries_token_index ON _analytics.endpoint_queries USING btree (token);
 4   DROP INDEX _analytics.endpoint_queries_token_index;
    
   _analytics            supabase_admin    false    401            �           1259    17419    endpoint_queries_user_id_index    INDEX     b   CREATE INDEX endpoint_queries_user_id_index ON _analytics.endpoint_queries USING btree (user_id);
 6   DROP INDEX _analytics.endpoint_queries_user_id_index;
    
   _analytics            supabase_admin    false    401            �           1259    17121    oauth_access_grants_token_index    INDEX     k   CREATE UNIQUE INDEX oauth_access_grants_token_index ON _analytics.oauth_access_grants USING btree (token);
 7   DROP INDEX _analytics.oauth_access_grants_token_index;
    
   _analytics            supabase_admin    false    377            �           1259    17139 '   oauth_access_tokens_refresh_token_index    INDEX     {   CREATE UNIQUE INDEX oauth_access_tokens_refresh_token_index ON _analytics.oauth_access_tokens USING btree (refresh_token);
 ?   DROP INDEX _analytics.oauth_access_tokens_refresh_token_index;
    
   _analytics            supabase_admin    false    379            �           1259    17138 +   oauth_access_tokens_resource_owner_id_index    INDEX     |   CREATE INDEX oauth_access_tokens_resource_owner_id_index ON _analytics.oauth_access_tokens USING btree (resource_owner_id);
 C   DROP INDEX _analytics.oauth_access_tokens_resource_owner_id_index;
    
   _analytics            supabase_admin    false    379            �           1259    17137    oauth_access_tokens_token_index    INDEX     k   CREATE UNIQUE INDEX oauth_access_tokens_token_index ON _analytics.oauth_access_tokens USING btree (token);
 7   DROP INDEX _analytics.oauth_access_tokens_token_index;
    
   _analytics            supabase_admin    false    379            �           1259    17106 !   oauth_applications_owner_id_index    INDEX     h   CREATE INDEX oauth_applications_owner_id_index ON _analytics.oauth_applications USING btree (owner_id);
 9   DROP INDEX _analytics.oauth_applications_owner_id_index;
    
   _analytics            supabase_admin    false    375            �           1259    17105    oauth_applications_uid_index    INDEX     e   CREATE UNIQUE INDEX oauth_applications_uid_index ON _analytics.oauth_applications USING btree (uid);
 4   DROP INDEX _analytics.oauth_applications_uid_index;
    
   _analytics            supabase_admin    false    375                        1259    17510 &   partner_users_partner_id_user_id_index    INDEX     z   CREATE UNIQUE INDEX partner_users_partner_id_user_id_index ON _analytics.partner_users USING btree (partner_id, user_id);
 >   DROP INDEX _analytics.partner_users_partner_id_user_id_index;
    
   _analytics            supabase_admin    false    409    409            �           1259    17375 !   payment_methods_customer_id_index    INDEX     h   CREATE INDEX payment_methods_customer_id_index ON _analytics.payment_methods USING btree (customer_id);
 9   DROP INDEX _analytics.payment_methods_customer_id_index;
    
   _analytics            supabase_admin    false    397            �           1259    17376    payment_methods_stripe_id_index    INDEX     k   CREATE UNIQUE INDEX payment_methods_stripe_id_index ON _analytics.payment_methods USING btree (stripe_id);
 7   DROP INDEX _analytics.payment_methods_stripe_id_index;
    
   _analytics            supabase_admin    false    397            �           1259    17092    rules_source_id_index    INDEX     P   CREATE INDEX rules_source_id_index ON _analytics.rules USING btree (source_id);
 -   DROP INDEX _analytics.rules_source_id_index;
    
   _analytics            supabase_admin    false    373            �           1259    17314 ?   saved_search_counters_timestamp_saved_search_id_granularity_ind    INDEX     �   CREATE UNIQUE INDEX saved_search_counters_timestamp_saved_search_id_granularity_ind ON _analytics.saved_search_counters USING btree ("timestamp", saved_search_id, granularity);
 W   DROP INDEX _analytics.saved_search_counters_timestamp_saved_search_id_granularity_ind;
    
   _analytics            supabase_admin    false    391    391    391            �           1259    17359 *   saved_searches_querystring_source_id_index    INDEX     �   CREATE UNIQUE INDEX saved_searches_querystring_source_id_index ON _analytics.saved_searches USING btree (querystring, source_id);
 B   DROP INDEX _analytics.saved_searches_querystring_source_id_index;
    
   _analytics            supabase_admin    false    383    383            �           1259    17336    source_schemas_source_id_index    INDEX     i   CREATE UNIQUE INDEX source_schemas_source_id_index ON _analytics.source_schemas USING btree (source_id);
 6   DROP INDEX _analytics.source_schemas_source_id_index;
    
   _analytics            supabase_admin    false    395            �           1259    17197    sources_name_index    INDEX     U   CREATE UNIQUE INDEX sources_name_index ON _analytics.sources USING btree (id, name);
 *   DROP INDEX _analytics.sources_name_index;
    
   _analytics            supabase_admin    false    371    371            �           1259    17141    sources_public_token_index    INDEX     a   CREATE UNIQUE INDEX sources_public_token_index ON _analytics.sources USING btree (public_token);
 2   DROP INDEX _analytics.sources_public_token_index;
    
   _analytics            supabase_admin    false    371            �           1259    17177    sources_token_index    INDEX     S   CREATE UNIQUE INDEX sources_token_index ON _analytics.sources USING btree (token);
 +   DROP INDEX _analytics.sources_token_index;
    
   _analytics            supabase_admin    false    371            �           1259    17449    sources_user_id_index    INDEX     P   CREATE INDEX sources_user_id_index ON _analytics.sources USING btree (user_id);
 -   DROP INDEX _analytics.sources_user_id_index;
    
   _analytics            supabase_admin    false    371            �           1259    17450    system_metrics_node_index    INDEX     X   CREATE INDEX system_metrics_node_index ON _analytics.system_metrics USING btree (node);
 1   DROP INDEX _analytics.system_metrics_node_index;
    
   _analytics            supabase_admin    false    381            �           1259    17254 %   team_users_provider_uid_team_id_index    INDEX     x   CREATE UNIQUE INDEX team_users_provider_uid_team_id_index ON _analytics.team_users USING btree (provider_uid, team_id);
 =   DROP INDEX _analytics.team_users_provider_uid_team_id_index;
    
   _analytics            supabase_admin    false    387    387            �           1259    17253    team_users_team_id_index    INDEX     V   CREATE INDEX team_users_team_id_index ON _analytics.team_users USING btree (team_id);
 0   DROP INDEX _analytics.team_users_team_id_index;
    
   _analytics            supabase_admin    false    387            �           1259    17483    teams_token_index    INDEX     O   CREATE UNIQUE INDEX teams_token_index ON _analytics.teams USING btree (token);
 )   DROP INDEX _analytics.teams_token_index;
    
   _analytics            supabase_admin    false    385            �           1259    17255    teams_user_id_index    INDEX     S   CREATE UNIQUE INDEX teams_user_id_index ON _analytics.teams USING btree (user_id);
 +   DROP INDEX _analytics.teams_user_id_index;
    
   _analytics            supabase_admin    false    385            �           1259    17176    users_api_key_index    INDEX     L   CREATE INDEX users_api_key_index ON _analytics.users USING btree (api_key);
 +   DROP INDEX _analytics.users_api_key_index;
    
   _analytics            supabase_admin    false    369            �           1259    17257    users_lower_email_index    INDEX     d   CREATE UNIQUE INDEX users_lower_email_index ON _analytics.users USING btree (lower((email)::text));
 /   DROP INDEX _analytics.users_lower_email_index;
    
   _analytics            supabase_admin    false    369    369            G           1259    17887 (   extensions_tenant_external_id_type_index    INDEX     }   CREATE UNIQUE INDEX extensions_tenant_external_id_type_index ON _realtime.extensions USING btree (tenant_external_id, type);
 ?   DROP INDEX _realtime.extensions_tenant_external_id_type_index;
    	   _realtime            supabase_admin    false    431    431            B           1259    17874    tenants_external_id_index    INDEX     ^   CREATE UNIQUE INDEX tenants_external_id_index ON _realtime.tenants USING btree (external_id);
 0   DROP INDEX _realtime.tenants_external_id_index;
    	   _realtime            supabase_admin    false    430            �           1259    16495    audit_logs_instance_id_idx    INDEX     ]   CREATE INDEX audit_logs_instance_id_idx ON auth.audit_log_entries USING btree (instance_id);
 ,   DROP INDEX auth.audit_logs_instance_id_idx;
       auth            supabase_auth_admin    false    336            �           1259    17662    confirmation_token_idx    INDEX     �   CREATE UNIQUE INDEX confirmation_token_idx ON auth.users USING btree (confirmation_token) WHERE ((confirmation_token)::text !~ '^[0-9 ]*$'::text);
 (   DROP INDEX auth.confirmation_token_idx;
       auth            supabase_auth_admin    false    332    332            �           1259    17664    email_change_token_current_idx    INDEX     �   CREATE UNIQUE INDEX email_change_token_current_idx ON auth.users USING btree (email_change_token_current) WHERE ((email_change_token_current)::text !~ '^[0-9 ]*$'::text);
 0   DROP INDEX auth.email_change_token_current_idx;
       auth            supabase_auth_admin    false    332    332            �           1259    17665    email_change_token_new_idx    INDEX     �   CREATE UNIQUE INDEX email_change_token_new_idx ON auth.users USING btree (email_change_token_new) WHERE ((email_change_token_new)::text !~ '^[0-9 ]*$'::text);
 ,   DROP INDEX auth.email_change_token_new_idx;
       auth            supabase_auth_admin    false    332    332                       1259    17743    factor_id_created_at_idx    INDEX     ]   CREATE INDEX factor_id_created_at_idx ON auth.mfa_factors USING btree (user_id, created_at);
 *   DROP INDEX auth.factor_id_created_at_idx;
       auth            supabase_auth_admin    false    421    421            ;           1259    17851    flow_state_created_at_idx    INDEX     Y   CREATE INDEX flow_state_created_at_idx ON auth.flow_state USING btree (created_at DESC);
 +   DROP INDEX auth.flow_state_created_at_idx;
       auth            supabase_auth_admin    false    428                       1259    17831    identities_email_idx    INDEX     [   CREATE INDEX identities_email_idx ON auth.identities USING btree (email text_pattern_ops);
 &   DROP INDEX auth.identities_email_idx;
       auth            supabase_auth_admin    false    419            O           0    0    INDEX identities_email_idx    COMMENT     c   COMMENT ON INDEX auth.identities_email_idx IS 'Auth: Ensures indexed queries on the email column';
          auth          supabase_auth_admin    false    4373                       1259    17659    identities_user_id_idx    INDEX     N   CREATE INDEX identities_user_id_idx ON auth.identities USING btree (user_id);
 (   DROP INDEX auth.identities_user_id_idx;
       auth            supabase_auth_admin    false    419            >           1259    17848    idx_auth_code    INDEX     G   CREATE INDEX idx_auth_code ON auth.flow_state USING btree (auth_code);
    DROP INDEX auth.idx_auth_code;
       auth            supabase_auth_admin    false    428            ?           1259    17849    idx_user_id_auth_method    INDEX     f   CREATE INDEX idx_user_id_auth_method ON auth.flow_state USING btree (user_id, authentication_method);
 )   DROP INDEX auth.idx_user_id_auth_method;
       auth            supabase_auth_admin    false    428    428            #           1259    17854    mfa_challenge_created_at_idx    INDEX     `   CREATE INDEX mfa_challenge_created_at_idx ON auth.mfa_challenges USING btree (created_at DESC);
 .   DROP INDEX auth.mfa_challenge_created_at_idx;
       auth            supabase_auth_admin    false    422            !           1259    17715 %   mfa_factors_user_friendly_name_unique    INDEX     �   CREATE UNIQUE INDEX mfa_factors_user_friendly_name_unique ON auth.mfa_factors USING btree (friendly_name, user_id) WHERE (TRIM(BOTH FROM friendly_name) <> ''::text);
 7   DROP INDEX auth.mfa_factors_user_friendly_name_unique;
       auth            supabase_auth_admin    false    421    421    421            "           1259    17860    mfa_factors_user_id_idx    INDEX     P   CREATE INDEX mfa_factors_user_id_idx ON auth.mfa_factors USING btree (user_id);
 )   DROP INDEX auth.mfa_factors_user_id_idx;
       auth            supabase_auth_admin    false    421            �           1259    17666    reauthentication_token_idx    INDEX     �   CREATE UNIQUE INDEX reauthentication_token_idx ON auth.users USING btree (reauthentication_token) WHERE ((reauthentication_token)::text !~ '^[0-9 ]*$'::text);
 ,   DROP INDEX auth.reauthentication_token_idx;
       auth            supabase_auth_admin    false    332    332            �           1259    17663    recovery_token_idx    INDEX     �   CREATE UNIQUE INDEX recovery_token_idx ON auth.users USING btree (recovery_token) WHERE ((recovery_token)::text !~ '^[0-9 ]*$'::text);
 $   DROP INDEX auth.recovery_token_idx;
       auth            supabase_auth_admin    false    332    332            �           1259    16478    refresh_tokens_instance_id_idx    INDEX     ^   CREATE INDEX refresh_tokens_instance_id_idx ON auth.refresh_tokens USING btree (instance_id);
 0   DROP INDEX auth.refresh_tokens_instance_id_idx;
       auth            supabase_auth_admin    false    334            �           1259    16479 &   refresh_tokens_instance_id_user_id_idx    INDEX     o   CREATE INDEX refresh_tokens_instance_id_user_id_idx ON auth.refresh_tokens USING btree (instance_id, user_id);
 8   DROP INDEX auth.refresh_tokens_instance_id_user_id_idx;
       auth            supabase_auth_admin    false    334    334            �           1259    17658    refresh_tokens_parent_idx    INDEX     T   CREATE INDEX refresh_tokens_parent_idx ON auth.refresh_tokens USING btree (parent);
 +   DROP INDEX auth.refresh_tokens_parent_idx;
       auth            supabase_auth_admin    false    334            �           1259    17745 %   refresh_tokens_session_id_revoked_idx    INDEX     m   CREATE INDEX refresh_tokens_session_id_revoked_idx ON auth.refresh_tokens USING btree (session_id, revoked);
 7   DROP INDEX auth.refresh_tokens_session_id_revoked_idx;
       auth            supabase_auth_admin    false    334    334            �           1259    17850    refresh_tokens_updated_at_idx    INDEX     a   CREATE INDEX refresh_tokens_updated_at_idx ON auth.refresh_tokens USING btree (updated_at DESC);
 /   DROP INDEX auth.refresh_tokens_updated_at_idx;
       auth            supabase_auth_admin    false    334            5           1259    17787 "   saml_providers_sso_provider_id_idx    INDEX     f   CREATE INDEX saml_providers_sso_provider_id_idx ON auth.saml_providers USING btree (sso_provider_id);
 4   DROP INDEX auth.saml_providers_sso_provider_id_idx;
       auth            supabase_auth_admin    false    426            6           1259    17852     saml_relay_states_created_at_idx    INDEX     g   CREATE INDEX saml_relay_states_created_at_idx ON auth.saml_relay_states USING btree (created_at DESC);
 2   DROP INDEX auth.saml_relay_states_created_at_idx;
       auth            supabase_auth_admin    false    427            7           1259    17802    saml_relay_states_for_email_idx    INDEX     `   CREATE INDEX saml_relay_states_for_email_idx ON auth.saml_relay_states USING btree (for_email);
 1   DROP INDEX auth.saml_relay_states_for_email_idx;
       auth            supabase_auth_admin    false    427            :           1259    17801 %   saml_relay_states_sso_provider_id_idx    INDEX     l   CREATE INDEX saml_relay_states_sso_provider_id_idx ON auth.saml_relay_states USING btree (sso_provider_id);
 7   DROP INDEX auth.saml_relay_states_sso_provider_id_idx;
       auth            supabase_auth_admin    false    427                       1259    17853    sessions_not_after_idx    INDEX     S   CREATE INDEX sessions_not_after_idx ON auth.sessions USING btree (not_after DESC);
 (   DROP INDEX auth.sessions_not_after_idx;
       auth            supabase_auth_admin    false    420                       1259    17744    sessions_user_id_idx    INDEX     J   CREATE INDEX sessions_user_id_idx ON auth.sessions USING btree (user_id);
 &   DROP INDEX auth.sessions_user_id_idx;
       auth            supabase_auth_admin    false    420            -           1259    17769    sso_domains_domain_idx    INDEX     \   CREATE UNIQUE INDEX sso_domains_domain_idx ON auth.sso_domains USING btree (lower(domain));
 (   DROP INDEX auth.sso_domains_domain_idx;
       auth            supabase_auth_admin    false    425    425            0           1259    17768    sso_domains_sso_provider_id_idx    INDEX     `   CREATE INDEX sso_domains_sso_provider_id_idx ON auth.sso_domains USING btree (sso_provider_id);
 1   DROP INDEX auth.sso_domains_sso_provider_id_idx;
       auth            supabase_auth_admin    false    425            ,           1259    17754    sso_providers_resource_id_idx    INDEX     j   CREATE UNIQUE INDEX sso_providers_resource_id_idx ON auth.sso_providers USING btree (lower(resource_id));
 /   DROP INDEX auth.sso_providers_resource_id_idx;
       auth            supabase_auth_admin    false    424    424                       1259    17742    user_id_created_at_idx    INDEX     X   CREATE INDEX user_id_created_at_idx ON auth.sessions USING btree (user_id, created_at);
 (   DROP INDEX auth.user_id_created_at_idx;
       auth            supabase_auth_admin    false    420    420            �           1259    17822    users_email_partial_key    INDEX     k   CREATE UNIQUE INDEX users_email_partial_key ON auth.users USING btree (email) WHERE (is_sso_user = false);
 )   DROP INDEX auth.users_email_partial_key;
       auth            supabase_auth_admin    false    332    332            P           0    0    INDEX users_email_partial_key    COMMENT     }   COMMENT ON INDEX auth.users_email_partial_key IS 'Auth: A partial unique index that applies only when is_sso_user is false';
          auth          supabase_auth_admin    false    4230            �           1259    17660    users_instance_id_email_idx    INDEX     h   CREATE INDEX users_instance_id_email_idx ON auth.users USING btree (instance_id, lower((email)::text));
 -   DROP INDEX auth.users_instance_id_email_idx;
       auth            supabase_auth_admin    false    332    332            �           1259    16468    users_instance_id_idx    INDEX     L   CREATE INDEX users_instance_id_idx ON auth.users USING btree (instance_id);
 '   DROP INDEX auth.users_instance_id_idx;
       auth            supabase_auth_admin    false    332            `           1259    44813    answers_exercises_exercise_idx    INDEX     `   CREATE INDEX answers_exercises_exercise_idx ON public.answers_exercises USING btree (exercise);
 2   DROP INDEX public.answers_exercises_exercise_idx;
       public            supabase_admin    false    445            c           1259    28780    btree_socket_room_id_idx    INDEX     H   CREATE INDEX btree_socket_room_id_idx ON public.rooms USING btree (id);
 ,   DROP INDEX public.btree_socket_room_id_idx;
       public            supabase_admin    false    446            Z           1259    44811    exercises_set_id_idx    INDEX     L   CREATE INDEX exercises_set_id_idx ON public.exercises USING btree (set_id);
 (   DROP INDEX public.exercises_set_id_idx;
       public            supabase_admin    false    439            [           1259    44812    flashcards_set_id_idx    INDEX     N   CREATE INDEX flashcards_set_id_idx ON public.flashcards USING btree (set_id);
 )   DROP INDEX public.flashcards_set_id_idx;
       public            supabase_admin    false    441            U           1259    44810    learning_projects_owner_id_idx    INDEX     `   CREATE INDEX learning_projects_owner_id_idx ON public.learning_projects USING btree (owner_id);
 2   DROP INDEX public.learning_projects_owner_id_idx;
       public            supabase_admin    false    437            J           1259    126768 &   profiles_username_case_insensitive_key    INDEX     m   CREATE UNIQUE INDEX profiles_username_case_insensitive_key ON public.profiles USING btree (upper(username));
 :   DROP INDEX public.profiles_username_case_insensitive_key;
       public            supabase_admin    false    432    432            f           1259    45154    rooms_secret_key_idx    INDEX     L   CREATE INDEX rooms_secret_key_idx ON public.rooms USING btree (secret_key);
 (   DROP INDEX public.rooms_secret_key_idx;
       public            supabase_admin    false    446            {           1259    53160    ix_realtime_subscription_entity    INDEX     [   CREATE INDEX ix_realtime_subscription_entity ON realtime.subscription USING hash (entity);
 5   DROP INDEX realtime.ix_realtime_subscription_entity;
       realtime            supabase_admin    false    461            ~           1259    53206 /   subscription_subscription_id_entity_filters_key    INDEX     �   CREATE UNIQUE INDEX subscription_subscription_id_entity_filters_key ON realtime.subscription USING btree (subscription_id, entity, filters);
 E   DROP INDEX realtime.subscription_subscription_id_entity_filters_key;
       realtime            supabase_admin    false    461    461    461            �           1259    16523    bname    INDEX     A   CREATE UNIQUE INDEX bname ON storage.buckets USING btree (name);
    DROP INDEX storage.bname;
       storage            supabase_storage_admin    false    338            �           1259    16545    bucketid_objname    INDEX     W   CREATE UNIQUE INDEX bucketid_objname ON storage.objects USING btree (bucket_id, name);
 %   DROP INDEX storage.bucketid_objname;
       storage            supabase_storage_admin    false    339    339            �           1259    16546    name_prefix_search    INDEX     X   CREATE INDEX name_prefix_search ON storage.objects USING btree (name text_pattern_ops);
 '   DROP INDEX storage.name_prefix_search;
       storage            supabase_storage_admin    false    339            �           1259    16631 .   supabase_functions_hooks_h_table_id_h_name_idx    INDEX     �   CREATE INDEX supabase_functions_hooks_h_table_id_h_name_idx ON supabase_functions.hooks USING btree (hook_table_id, hook_name);
 N   DROP INDEX supabase_functions.supabase_functions_hooks_h_table_id_h_name_idx;
       supabase_functions            supabase_functions_admin    false    348    348            �           1259    16630 '   supabase_functions_hooks_request_id_idx    INDEX     k   CREATE INDEX supabase_functions_hooks_request_id_idx ON supabase_functions.hooks USING btree (request_id);
 G   DROP INDEX supabase_functions.supabase_functions_hooks_request_id_idx;
       supabase_functions            supabase_functions_admin    false    348            �           2620    27609    users on_auth_user_created    TRIGGER     w   CREATE TRIGGER on_auth_user_created AFTER INSERT ON auth.users FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();
 1   DROP TRIGGER on_auth_user_created ON auth.users;
       auth          supabase_auth_admin    false    733    332            �           2620    31082 $   learning_projects addProjectOnCreate    TRIGGER     �   CREATE TRIGGER "addProjectOnCreate" AFTER INSERT ON public.learning_projects FOR EACH ROW EXECUTE FUNCTION public."addProjectOnCreate"();
 ?   DROP TRIGGER "addProjectOnCreate" ON public.learning_projects;
       public          supabase_admin    false    728    437            �           2620    45186    profiles guard_profiles_trigger    TRIGGER     �   CREATE TRIGGER guard_profiles_trigger BEFORE INSERT OR DELETE OR UPDATE ON public.profiles FOR EACH ROW EXECUTE FUNCTION public.guard_profiles();
 8   DROP TRIGGER guard_profiles_trigger ON public.profiles;
       public          supabase_admin    false    432    578            �           2620    85705    rooms upd_rooms_tracker    TRIGGER     �   CREATE TRIGGER upd_rooms_tracker AFTER INSERT OR DELETE OR UPDATE ON public.rooms FOR EACH STATEMENT EXECUTE FUNCTION public.update_last_updated();
 0   DROP TRIGGER upd_rooms_tracker ON public.rooms;
       public          supabase_admin    false    446    730            �           2620    85775 !   profiles upd_rooms_tracker_joined    TRIGGER     �   CREATE TRIGGER upd_rooms_tracker_joined AFTER DELETE OR UPDATE ON public.profiles FOR EACH STATEMENT EXECUTE FUNCTION public.update_last_updated();
 :   DROP TRIGGER upd_rooms_tracker_joined ON public.profiles;
       public          supabase_admin    false    730    432            �           2620    37192 -   learning_projects updateLearningProjectsGuard    TRIGGER     �   CREATE TRIGGER "updateLearningProjectsGuard" BEFORE UPDATE ON public.learning_projects FOR EACH ROW EXECUTE FUNCTION public.guard_learning_projects();
 H   DROP TRIGGER "updateLearningProjectsGuard" ON public.learning_projects;
       public          supabase_admin    false    437    617            �           2620    135401 &   project_ratings update_ratings_trigger    TRIGGER     �   CREATE TRIGGER update_ratings_trigger AFTER INSERT OR DELETE OR UPDATE ON public.project_ratings FOR EACH STATEMENT EXECUTE FUNCTION public.update_statistics();
 ?   DROP TRIGGER update_ratings_trigger ON public.project_ratings;
       public          supabase_admin    false    452    760            �           2620    53162    subscription tr_check_filters    TRIGGER     �   CREATE TRIGGER tr_check_filters BEFORE INSERT OR UPDATE ON realtime.subscription FOR EACH ROW EXECUTE FUNCTION realtime.subscription_check_filters();
 8   DROP TRIGGER tr_check_filters ON realtime.subscription;
       realtime          supabase_admin    false    506    461            �           2620    426693    objects log_updates_on_objects    TRIGGER     �   CREATE TRIGGER log_updates_on_objects AFTER INSERT OR DELETE OR UPDATE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.update_files();
 8   DROP TRIGGER log_updates_on_objects ON storage.objects;
       storage          supabase_storage_admin    false    339    576            �           2620    434847 !   objects update_objects_updated_at    TRIGGER     �   CREATE TRIGGER update_objects_updated_at BEFORE UPDATE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.update_updated_at_column();
 ;   DROP TRIGGER update_objects_updated_at ON storage.objects;
       storage          supabase_storage_admin    false    723    339            �           2606    17271 .   billing_accounts billing_accounts_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY _analytics.billing_accounts
    ADD CONSTRAINT billing_accounts_user_id_fkey FOREIGN KEY (user_id) REFERENCES _analytics.users(id) ON DELETE CASCADE;
 \   ALTER TABLE ONLY _analytics.billing_accounts DROP CONSTRAINT billing_accounts_user_id_fkey;
    
   _analytics          supabase_admin    false    369    389    4285            �           2606    17429 *   billing_counts billing_counts_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY _analytics.billing_counts
    ADD CONSTRAINT billing_counts_user_id_fkey FOREIGN KEY (user_id) REFERENCES _analytics.users(id) ON DELETE CASCADE;
 X   ALTER TABLE ONLY _analytics.billing_counts DROP CONSTRAINT billing_counts_user_id_fkey;
    
   _analytics          supabase_admin    false    403    4285    369            �           2606    17478 7   endpoint_queries endpoint_queries_sandbox_query_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY _analytics.endpoint_queries
    ADD CONSTRAINT endpoint_queries_sandbox_query_id_fkey FOREIGN KEY (sandbox_query_id) REFERENCES _analytics.endpoint_queries(id);
 e   ALTER TABLE ONLY _analytics.endpoint_queries DROP CONSTRAINT endpoint_queries_sandbox_query_id_fkey;
    
   _analytics          supabase_admin    false    4340    401    401            �           2606    17414 .   endpoint_queries endpoint_queries_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY _analytics.endpoint_queries
    ADD CONSTRAINT endpoint_queries_user_id_fkey FOREIGN KEY (user_id) REFERENCES _analytics.users(id);
 \   ALTER TABLE ONLY _analytics.endpoint_queries DROP CONSTRAINT endpoint_queries_user_id_fkey;
    
   _analytics          supabase_admin    false    401    369    4285            �           2606    17116 ;   oauth_access_grants oauth_access_grants_application_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY _analytics.oauth_access_grants
    ADD CONSTRAINT oauth_access_grants_application_id_fkey FOREIGN KEY (application_id) REFERENCES _analytics.oauth_applications(id);
 i   ALTER TABLE ONLY _analytics.oauth_access_grants DROP CONSTRAINT oauth_access_grants_application_id_fkey;
    
   _analytics          supabase_admin    false    375    4297    377            �           2606    17132 ;   oauth_access_tokens oauth_access_tokens_application_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY _analytics.oauth_access_tokens
    ADD CONSTRAINT oauth_access_tokens_application_id_fkey FOREIGN KEY (application_id) REFERENCES _analytics.oauth_applications(id);
 i   ALTER TABLE ONLY _analytics.oauth_access_tokens DROP CONSTRAINT oauth_access_tokens_application_id_fkey;
    
   _analytics          supabase_admin    false    379    375    4297            �           2606    17500 +   partner_users partner_users_partner_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY _analytics.partner_users
    ADD CONSTRAINT partner_users_partner_id_fkey FOREIGN KEY (partner_id) REFERENCES _analytics.partners(id);
 Y   ALTER TABLE ONLY _analytics.partner_users DROP CONSTRAINT partner_users_partner_id_fkey;
    
   _analytics          supabase_admin    false    407    409    4351            �           2606    17505 (   partner_users partner_users_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY _analytics.partner_users
    ADD CONSTRAINT partner_users_user_id_fkey FOREIGN KEY (user_id) REFERENCES _analytics.users(id);
 V   ALTER TABLE ONLY _analytics.partner_users DROP CONSTRAINT partner_users_user_id_fkey;
    
   _analytics          supabase_admin    false    409    369    4285            �           2606    17370 0   payment_methods payment_methods_customer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY _analytics.payment_methods
    ADD CONSTRAINT payment_methods_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES _analytics.billing_accounts(stripe_customer) ON DELETE CASCADE;
 ^   ALTER TABLE ONLY _analytics.payment_methods DROP CONSTRAINT payment_methods_customer_id_fkey;
    
   _analytics          supabase_admin    false    397    389    4323            �           2606    17183    rules rules_sink_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY _analytics.rules
    ADD CONSTRAINT rules_sink_fkey FOREIGN KEY (sink) REFERENCES _analytics.sources(token) ON DELETE CASCADE;
 C   ALTER TABLE ONLY _analytics.rules DROP CONSTRAINT rules_sink_fkey;
    
   _analytics          supabase_admin    false    373    371    4290            �           2606    17087    rules rules_source_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY _analytics.rules
    ADD CONSTRAINT rules_source_id_fkey FOREIGN KEY (source_id) REFERENCES _analytics.sources(id) ON DELETE CASCADE;
 H   ALTER TABLE ONLY _analytics.rules DROP CONSTRAINT rules_source_id_fkey;
    
   _analytics          supabase_admin    false    371    373    4288            �           2606    17315 @   saved_search_counters saved_search_counters_saved_search_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY _analytics.saved_search_counters
    ADD CONSTRAINT saved_search_counters_saved_search_id_fkey FOREIGN KEY (saved_search_id) REFERENCES _analytics.saved_searches(id) ON DELETE CASCADE;
 n   ALTER TABLE ONLY _analytics.saved_search_counters DROP CONSTRAINT saved_search_counters_saved_search_id_fkey;
    
   _analytics          supabase_admin    false    4311    383    391            �           2606    17278 ,   saved_searches saved_searches_source_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY _analytics.saved_searches
    ADD CONSTRAINT saved_searches_source_id_fkey FOREIGN KEY (source_id) REFERENCES _analytics.sources(id) ON DELETE CASCADE;
 Z   ALTER TABLE ONLY _analytics.saved_searches DROP CONSTRAINT saved_searches_source_id_fkey;
    
   _analytics          supabase_admin    false    4288    371    383            �           2606    17469 .   source_backends source_backends_source_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY _analytics.source_backends
    ADD CONSTRAINT source_backends_source_id_fkey FOREIGN KEY (source_id) REFERENCES _analytics.sources(id);
 \   ALTER TABLE ONLY _analytics.source_backends DROP CONSTRAINT source_backends_source_id_fkey;
    
   _analytics          supabase_admin    false    371    4288    405            �           2606    17330 ,   source_schemas source_schemas_source_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY _analytics.source_schemas
    ADD CONSTRAINT source_schemas_source_id_fkey FOREIGN KEY (source_id) REFERENCES _analytics.sources(id) ON DELETE CASCADE;
 Z   ALTER TABLE ONLY _analytics.source_schemas DROP CONSTRAINT source_schemas_source_id_fkey;
    
   _analytics          supabase_admin    false    4288    371    395            �           2606    17178    sources sources_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY _analytics.sources
    ADD CONSTRAINT sources_user_id_fkey FOREIGN KEY (user_id) REFERENCES _analytics.users(id) ON DELETE CASCADE;
 J   ALTER TABLE ONLY _analytics.sources DROP CONSTRAINT sources_user_id_fkey;
    
   _analytics          supabase_admin    false    369    4285    371            �           2606    17248 "   team_users team_users_team_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY _analytics.team_users
    ADD CONSTRAINT team_users_team_id_fkey FOREIGN KEY (team_id) REFERENCES _analytics.teams(id) ON DELETE CASCADE;
 P   ALTER TABLE ONLY _analytics.team_users DROP CONSTRAINT team_users_team_id_fkey;
    
   _analytics          supabase_admin    false    387    385    4314            �           2606    17232    teams teams_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY _analytics.teams
    ADD CONSTRAINT teams_user_id_fkey FOREIGN KEY (user_id) REFERENCES _analytics.users(id) ON DELETE CASCADE;
 F   ALTER TABLE ONLY _analytics.teams DROP CONSTRAINT teams_user_id_fkey;
    
   _analytics          supabase_admin    false    369    385    4285            �           2606    17400 &   vercel_auths vercel_auths_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY _analytics.vercel_auths
    ADD CONSTRAINT vercel_auths_user_id_fkey FOREIGN KEY (user_id) REFERENCES _analytics.users(id) ON DELETE CASCADE;
 T   ALTER TABLE ONLY _analytics.vercel_auths DROP CONSTRAINT vercel_auths_user_id_fkey;
    
   _analytics          supabase_admin    false    369    399    4285            �           2606    17882 -   extensions extensions_tenant_external_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY _realtime.extensions
    ADD CONSTRAINT extensions_tenant_external_id_fkey FOREIGN KEY (tenant_external_id) REFERENCES _realtime.tenants(external_id) ON DELETE CASCADE;
 Z   ALTER TABLE ONLY _realtime.extensions DROP CONSTRAINT extensions_tenant_external_id_fkey;
    	   _realtime          supabase_admin    false    430    431    4418            �           2606    17646 "   identities identities_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;
 J   ALTER TABLE ONLY auth.identities DROP CONSTRAINT identities_user_id_fkey;
       auth          supabase_auth_admin    false    332    419    4236            �           2606    17735 -   mfa_amr_claims mfa_amr_claims_session_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;
 U   ALTER TABLE ONLY auth.mfa_amr_claims DROP CONSTRAINT mfa_amr_claims_session_id_fkey;
       auth          supabase_auth_admin    false    420    4379    423            �           2606    17723 1   mfa_challenges mfa_challenges_auth_factor_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_auth_factor_id_fkey FOREIGN KEY (factor_id) REFERENCES auth.mfa_factors(id) ON DELETE CASCADE;
 Y   ALTER TABLE ONLY auth.mfa_challenges DROP CONSTRAINT mfa_challenges_auth_factor_id_fkey;
       auth          supabase_auth_admin    false    4384    421    422            �           2606    17710 $   mfa_factors mfa_factors_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;
 L   ALTER TABLE ONLY auth.mfa_factors DROP CONSTRAINT mfa_factors_user_id_fkey;
       auth          supabase_auth_admin    false    4236    332    421            �           2606    17679 -   refresh_tokens refresh_tokens_session_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;
 U   ALTER TABLE ONLY auth.refresh_tokens DROP CONSTRAINT refresh_tokens_session_id_fkey;
       auth          supabase_auth_admin    false    334    420    4379            �           2606    17782 2   saml_providers saml_providers_sso_provider_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;
 Z   ALTER TABLE ONLY auth.saml_providers DROP CONSTRAINT saml_providers_sso_provider_id_fkey;
       auth          supabase_auth_admin    false    4395    426    424            �           2606    17855 6   saml_relay_states saml_relay_states_flow_state_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_flow_state_id_fkey FOREIGN KEY (flow_state_id) REFERENCES auth.flow_state(id) ON DELETE CASCADE;
 ^   ALTER TABLE ONLY auth.saml_relay_states DROP CONSTRAINT saml_relay_states_flow_state_id_fkey;
       auth          supabase_auth_admin    false    4413    428    427            �           2606    17796 8   saml_relay_states saml_relay_states_sso_provider_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;
 `   ALTER TABLE ONLY auth.saml_relay_states DROP CONSTRAINT saml_relay_states_sso_provider_id_fkey;
       auth          supabase_auth_admin    false    424    427    4395            �           2606    17674    sessions sessions_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;
 F   ALTER TABLE ONLY auth.sessions DROP CONSTRAINT sessions_user_id_fkey;
       auth          supabase_auth_admin    false    332    4236    420            �           2606    17763 ,   sso_domains sso_domains_sso_provider_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;
 T   ALTER TABLE ONLY auth.sso_domains DROP CONSTRAINT sso_domains_sso_provider_id_fkey;
       auth          supabase_auth_admin    false    425    424    4395            �           2606    216848 1   answers_exercises answers_exercises_exercise_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.answers_exercises
    ADD CONSTRAINT answers_exercises_exercise_fkey FOREIGN KEY (exercise) REFERENCES public.exercises(id) ON UPDATE CASCADE ON DELETE CASCADE;
 [   ALTER TABLE ONLY public.answers_exercises DROP CONSTRAINT answers_exercises_exercise_fkey;
       public          supabase_admin    false    439    4441    445            �           2606    38312    exercises exercises_set_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.exercises
    ADD CONSTRAINT exercises_set_id_fkey FOREIGN KEY (set_id) REFERENCES public.sets(id) ON UPDATE CASCADE ON DELETE CASCADE;
 I   ALTER TABLE ONLY public.exercises DROP CONSTRAINT exercises_set_id_fkey;
       public          supabase_admin    false    4468    454    439            �           2606    38342 !   flashcards flashcards_set_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.flashcards
    ADD CONSTRAINT flashcards_set_id_fkey FOREIGN KEY (set_id) REFERENCES public.sets(id) ON UPDATE CASCADE ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.flashcards DROP CONSTRAINT flashcards_set_id_fkey;
       public          supabase_admin    false    454    4468    441            �           2606    38527 !   friends friends_user_from_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.friends
    ADD CONSTRAINT friends_user_from_id_fkey FOREIGN KEY (user_from_id) REFERENCES auth.users(id) ON UPDATE CASCADE ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.friends DROP CONSTRAINT friends_user_from_id_fkey;
       public          supabase_admin    false    4236    332    433            �           2606    38532    friends friends_user_to_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.friends
    ADD CONSTRAINT friends_user_to_id_fkey FOREIGN KEY (user_to_id) REFERENCES auth.users(id) ON UPDATE CASCADE ON DELETE CASCADE;
 I   ALTER TABLE ONLY public.friends DROP CONSTRAINT friends_user_to_id_fkey;
       public          supabase_admin    false    433    332    4236            �           2606    37247 1   learning_projects learning_projects_owner_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.learning_projects
    ADD CONSTRAINT learning_projects_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES auth.users(id);
 [   ALTER TABLE ONLY public.learning_projects DROP CONSTRAINT learning_projects_owner_id_fkey;
       public          supabase_admin    false    437    332    4236            �           2606    475883 !   links links_learning_project_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.links
    ADD CONSTRAINT links_learning_project_fkey FOREIGN KEY (learning_project) REFERENCES public.learning_projects(id) ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.links DROP CONSTRAINT links_learning_project_fkey;
       public          supabase_admin    false    443    437    4439            �           2606    135422 *   player_answers player_answers_room_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.player_answers
    ADD CONSTRAINT player_answers_room_id_fkey FOREIGN KEY (room_id) REFERENCES public.rooms(id) ON UPDATE CASCADE ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.player_answers DROP CONSTRAINT player_answers_room_id_fkey;
       public          supabase_admin    false    446    4453    465            �           2606    135427 *   player_answers player_answers_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.player_answers
    ADD CONSTRAINT player_answers_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON UPDATE CASCADE ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.player_answers DROP CONSTRAINT player_answers_user_id_fkey;
       public          supabase_admin    false    332    465    4236            �           2606    93918 4   private_room_states private_room_states_room_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.private_room_states
    ADD CONSTRAINT private_room_states_room_id_fkey FOREIGN KEY (room_id) REFERENCES public.rooms(id) ON UPDATE CASCADE ON DELETE CASCADE;
 ^   ALTER TABLE ONLY public.private_room_states DROP CONSTRAINT private_room_states_room_id_fkey;
       public          supabase_admin    false    457    446    4453            �           2606    44876    profiles profiles_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_id_fkey FOREIGN KEY (id) REFERENCES auth.users(id) ON UPDATE CASCADE ON DELETE CASCADE;
 C   ALTER TABLE ONLY public.profiles DROP CONSTRAINT profiles_id_fkey;
       public          supabase_admin    false    4236    332    432            �           2606    335122    profiles profiles_room_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_room_id_fkey FOREIGN KEY (room_id) REFERENCES public.rooms(id) ON DELETE SET NULL;
 H   ALTER TABLE ONLY public.profiles DROP CONSTRAINT profiles_room_id_fkey;
       public          supabase_admin    false    4453    432    446            �           2606    37200 /   project_ratings project_ratings_project_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.project_ratings
    ADD CONSTRAINT project_ratings_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.learning_projects(id);
 Y   ALTER TABLE ONLY public.project_ratings DROP CONSTRAINT project_ratings_project_id_fkey;
       public          supabase_admin    false    452    4439    437            �           2606    37195 ,   project_ratings project_ratings_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.project_ratings
    ADD CONSTRAINT project_ratings_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id);
 V   ALTER TABLE ONLY public.project_ratings DROP CONSTRAINT project_ratings_user_id_fkey;
       public          supabase_admin    false    332    4236    452            �           2606    53020 2   public_room_states public_room_states_room_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.public_room_states
    ADD CONSTRAINT public_room_states_room_id_fkey FOREIGN KEY (room_id) REFERENCES public.rooms(id) ON UPDATE CASCADE ON DELETE CASCADE;
 \   ALTER TABLE ONLY public.public_room_states DROP CONSTRAINT public_room_states_room_id_fkey;
       public          supabase_admin    false    446    4453    456            �           2606    233305    queue queue_room_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.queue
    ADD CONSTRAINT queue_room_id_fkey FOREIGN KEY (room_id) REFERENCES public.rooms(id) ON UPDATE CASCADE ON DELETE CASCADE;
 B   ALTER TABLE ONLY public.queue DROP CONSTRAINT queue_room_id_fkey;
       public          supabase_admin    false    4453    467    446            �           2606    45102    rooms rooms_project_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.learning_projects(id) ON UPDATE CASCADE ON DELETE CASCADE;
 E   ALTER TABLE ONLY public.rooms DROP CONSTRAINT rooms_project_id_fkey;
       public          supabase_admin    false    446    437    4439            �           2606    38352    sets sets_project_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sets
    ADD CONSTRAINT sets_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.learning_projects(id) ON UPDATE CASCADE ON DELETE CASCADE;
 C   ALTER TABLE ONLY public.sets DROP CONSTRAINT sets_project_id_fkey;
       public          supabase_admin    false    437    454    4439            �           2606    86866 7   user_achievements user_achievements_achievement_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_achievements
    ADD CONSTRAINT user_achievements_achievement_id_fkey FOREIGN KEY (achievement_id) REFERENCES public.achievements(id);
 a   ALTER TABLE ONLY public.user_achievements DROP CONSTRAINT user_achievements_achievement_id_fkey;
       public          supabase_admin    false    435    434    4436            �           2606    86871 0   user_achievements user_achievements_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_achievements
    ADD CONSTRAINT user_achievements_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON UPDATE CASCADE ON DELETE CASCADE;
 Z   ALTER TABLE ONLY public.user_achievements DROP CONSTRAINT user_achievements_user_id_fkey;
       public          supabase_admin    false    434    332    4236            �           2606    38256 F   user_learning_projects user_learning_projects_learning_project_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_learning_projects
    ADD CONSTRAINT user_learning_projects_learning_project_id_fkey FOREIGN KEY (learning_project_id) REFERENCES public.learning_projects(id) ON UPDATE CASCADE ON DELETE CASCADE;
 p   ALTER TABLE ONLY public.user_learning_projects DROP CONSTRAINT user_learning_projects_learning_project_id_fkey;
       public          supabase_admin    false    4439    437    447            �           2606    38263 :   user_learning_projects user_learning_projects_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_learning_projects
    ADD CONSTRAINT user_learning_projects_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON UPDATE CASCADE ON DELETE CASCADE;
 d   ALTER TABLE ONLY public.user_learning_projects DROP CONSTRAINT user_learning_projects_user_id_fkey;
       public          supabase_admin    false    332    4236    447            �           2606    16518    buckets buckets_owner_fkey    FK CONSTRAINT     v   ALTER TABLE ONLY storage.buckets
    ADD CONSTRAINT buckets_owner_fkey FOREIGN KEY (owner) REFERENCES auth.users(id);
 E   ALTER TABLE ONLY storage.buckets DROP CONSTRAINT buckets_owner_fkey;
       storage          supabase_storage_admin    false    4236    338    332            �           2606    16535    objects objects_bucketId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT "objects_bucketId_fkey" FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);
 J   ALTER TABLE ONLY storage.objects DROP CONSTRAINT "objects_bucketId_fkey";
       storage          supabase_storage_admin    false    339    4255    338            s           3256    29346    job cron_job_policy    POLICY     M   CREATE POLICY cron_job_policy ON cron.job USING ((username = CURRENT_USER));
 )   DROP POLICY cron_job_policy ON cron.job;
       cron          supabase_admin    false    2    2    2    2    2    2    2    2            t           3256    29361 +   job_run_details cron_job_run_details_policy    POLICY     e   CREATE POLICY cron_job_run_details_policy ON cron.job_run_details USING ((username = CURRENT_USER));
 A   DROP POLICY cron_job_run_details_policy ON cron.job_run_details;
       cron          supabase_admin    false    2    2    2    2    2    2    2    2            j           0    29334    job    ROW SECURITY     /   ALTER TABLE cron.job ENABLE ROW LEVEL SECURITY;          cron          supabase_admin    false    449            k           0    29353    job_run_details    ROW SECURITY     ;   ALTER TABLE cron.job_run_details ENABLE ROW LEVEL SECURITY;          cron          supabase_admin    false    451            �           3256    93958 4   learning_projects Allows owner to delete the project    POLICY     �   CREATE POLICY "Allows owner to delete the project" ON public.learning_projects FOR DELETE TO authenticated USING ((auth.uid() = owner_id));
 N   DROP POLICY "Allows owner to delete the project" ON public.learning_projects;
       public          supabase_admin    false    437    494    437            �           3256    44786 7   answers_exercises Enable access for all project members    POLICY     �  CREATE POLICY "Enable access for all project members" ON public.answers_exercises TO authenticated USING (( SELECT (EXISTS ( SELECT 1
           FROM public.exercises
          WHERE (answers_exercises.exercise = exercises.id))) AS "exists")) WITH CHECK (( SELECT (EXISTS ( SELECT 1
           FROM public.exercises
          WHERE (answers_exercises.exercise = exercises.id))) AS "exists"));
 Q   DROP POLICY "Enable access for all project members" ON public.answers_exercises;
       public          supabase_admin    false    445    439    445    439    445            �           3256    39108 +   exercises Enable access for project members    POLICY     S  CREATE POLICY "Enable access for project members" ON public.exercises TO authenticated USING (( SELECT (EXISTS ( SELECT 1
           FROM public.sets s
          WHERE (s.id = exercises.set_id))) AS "exists")) WITH CHECK (( SELECT (EXISTS ( SELECT 1
           FROM public.sets s
          WHERE (s.id = exercises.set_id))) AS "exists"));
 E   DROP POLICY "Enable access for project members" ON public.exercises;
       public          supabase_admin    false    454    439    454    439    439            �           3256    45123 '   links Enable access for project members    POLICY     }  CREATE POLICY "Enable access for project members" ON public.links TO authenticated USING (( SELECT (EXISTS ( SELECT 1
           FROM public.learning_projects lps
          WHERE (lps.id = links.learning_project))) AS "exists")) WITH CHECK (( SELECT (EXISTS ( SELECT 1
           FROM public.learning_projects lps
          WHERE (lps.id = links.learning_project))) AS "exists"));
 A   DROP POLICY "Enable access for project members" ON public.links;
       public          supabase_admin    false    443    437    437    443    443            �           3256    118492 4   project_ratings Enable access to authenticated users    POLICY     �   CREATE POLICY "Enable access to authenticated users" ON public.project_ratings TO authenticated USING ((user_id = auth.uid())) WITH CHECK ((user_id = auth.uid()));
 N   DROP POLICY "Enable access to authenticated users" ON public.project_ratings;
       public          supabase_admin    false    494    452    494    452    452                       3256    39086 +   flashcards Enable access to project members    POLICY     U  CREATE POLICY "Enable access to project members" ON public.flashcards TO authenticated USING (( SELECT (EXISTS ( SELECT 1
           FROM public.sets s
          WHERE (s.id = flashcards.set_id))) AS "exists")) WITH CHECK (( SELECT (EXISTS ( SELECT 1
           FROM public.sets s
          WHERE (s.id = flashcards.set_id))) AS "exists"));
 E   DROP POLICY "Enable access to project members" ON public.flashcards;
       public          supabase_admin    false    454    441    441    454    441            {           3256    38666    sets Enable delete for users    POLICY       CREATE POLICY "Enable delete for users" ON public.sets FOR DELETE TO authenticated USING (( SELECT (EXISTS ( SELECT 1
           FROM public.user_learning_projects ulp
          WHERE ((ulp.learning_project_id = sets.project_id) AND (auth.uid() = ulp.user_id)))) AS "exists"));
 6   DROP POLICY "Enable delete for users" ON public.sets;
       public          supabase_admin    false    447    454    494    447    454            }           3256    38670    sets Enable insert     POLICY       CREATE POLICY "Enable insert " ON public.sets FOR INSERT TO authenticated WITH CHECK (( SELECT (EXISTS ( SELECT 1
           FROM public.user_learning_projects ulp
          WHERE ((ulp.learning_project_id = sets.project_id) AND (auth.uid() = ulp.user_id)))) AS "exists"));
 -   DROP POLICY "Enable insert " ON public.sets;
       public          supabase_admin    false    454    447    447    494    454            w           3256    31083 <   learning_projects Enable insert for authenticated users only    POLICY     �   CREATE POLICY "Enable insert for authenticated users only" ON public.learning_projects FOR INSERT TO authenticated WITH CHECK ((auth.uid() = owner_id));
 V   DROP POLICY "Enable insert for authenticated users only" ON public.learning_projects;
       public          supabase_admin    false    494    437    437            u           3256    27398 -   achievements Enable read access for all users    POLICY     r   CREATE POLICY "Enable read access for all users" ON public.achievements FOR SELECT TO authenticated USING (true);
 G   DROP POLICY "Enable read access for all users" ON public.achievements;
       public          supabase_admin    false    435            �           3256    53566 3   public_room_states Enable read access for all users    POLICY     x   CREATE POLICY "Enable read access for all users" ON public.public_room_states FOR SELECT TO authenticated USING (true);
 M   DROP POLICY "Enable read access for all users" ON public.public_room_states;
       public          supabase_admin    false    456            �           3256    69395 (   tracker Enable read access for all users    POLICY     m   CREATE POLICY "Enable read access for all users" ON public.tracker FOR SELECT TO authenticated USING (true);
 B   DROP POLICY "Enable read access for all users" ON public.tracker;
       public          supabase_admin    false    464            z           3256    36222 F   learning_projects Enable read access for owners and members of project    POLICY     _  CREATE POLICY "Enable read access for owners and members of project" ON public.learning_projects FOR SELECT TO authenticated USING (((auth.uid() = owner_id) OR ( SELECT (EXISTS ( SELECT 1
           FROM public.user_learning_projects up
          WHERE ((up.learning_project_id = learning_projects.id) AND (up.user_id = auth.uid())))) AS "exists")));
 `   DROP POLICY "Enable read access for owners and members of project" ON public.learning_projects;
       public          supabase_admin    false    437    447    437    447    494    437            |           3256    38585 +   sets Enable read access for project members    POLICY     %  CREATE POLICY "Enable read access for project members" ON public.sets FOR SELECT TO authenticated USING (( SELECT (EXISTS ( SELECT 1
           FROM public.user_learning_projects ulp
          WHERE ((ulp.learning_project_id = sets.project_id) AND (auth.uid() = ulp.user_id)))) AS "exists"));
 E   DROP POLICY "Enable read access for project members" ON public.sets;
       public          supabase_admin    false    447    447    454    454    494            ~           3256    38774    sets Enable update     POLICY     �  CREATE POLICY "Enable update " ON public.sets FOR UPDATE TO authenticated USING (( SELECT (EXISTS ( SELECT 1
           FROM public.user_learning_projects ulp
          WHERE ((ulp.learning_project_id = sets.project_id) AND (auth.uid() = ulp.user_id)))) AS "exists")) WITH CHECK (( SELECT (EXISTS ( SELECT 1
           FROM public.user_learning_projects ulp
          WHERE ((ulp.learning_project_id = sets.project_id) AND (auth.uid() = ulp.user_id)))) AS "exists"));
 -   DROP POLICY "Enable update " ON public.sets;
       public          supabase_admin    false    494    454    454    447    447    494    454    447    447            �           3256    53000 @   friends Enable user to delete received and sent friend requests     POLICY     �   CREATE POLICY "Enable user to delete received and sent friend requests " ON public.friends FOR DELETE TO authenticated USING (((user_to_id = auth.uid()) OR (user_from_id = auth.uid())));
 Z   DROP POLICY "Enable user to delete received and sent friend requests " ON public.friends;
       public          supabase_admin    false    433    494    433    433            �           3256    53113 8   friends Enable users to insert their own friend requests    POLICY     �   CREATE POLICY "Enable users to insert their own friend requests" ON public.friends FOR INSERT TO authenticated WITH CHECK (((user_from_id = auth.uid()) AND (NOT (user_from_id = user_to_id))));
 R   DROP POLICY "Enable users to insert their own friend requests" ON public.friends;
       public          supabase_admin    false    494    433    433    433            �           3256    53114 8   friends Enable users to update their own friend requests    POLICY       CREATE POLICY "Enable users to update their own friend requests" ON public.friends FOR UPDATE TO authenticated USING (((user_from_id = auth.uid()) AND (NOT (user_from_id = user_to_id)))) WITH CHECK (((user_from_id = auth.uid()) AND (NOT (user_from_id = user_to_id))));
 R   DROP POLICY "Enable users to update their own friend requests" ON public.friends;
       public          supabase_admin    false    433    494    433    494    433    433    433            �           3256    45350 6   user_achievements Users can see their own achievements    POLICY     �   CREATE POLICY "Users can see their own achievements" ON public.user_achievements FOR SELECT TO authenticated USING ((auth.uid() = user_id));
 P   DROP POLICY "Users can see their own achievements" ON public.user_achievements;
       public          supabase_admin    false    494    434    434            b           0    26881    achievements    ROW SECURITY     :   ALTER TABLE public.achievements ENABLE ROW LEVEL SECURITY;          public          supabase_admin    false    435            y           3256    31164 3   learning_projects allow update if user owns project    POLICY     �   CREATE POLICY "allow update if user owns project" ON public.learning_projects FOR UPDATE TO authenticated USING ((auth.uid() = owner_id)) WITH CHECK ((auth.uid() = owner_id));
 M   DROP POLICY "allow update if user owns project" ON public.learning_projects;
       public          supabase_admin    false    437    437    437    494    494            g           0    27130    answers_exercises    ROW SECURITY     ?   ALTER TABLE public.answers_exercises ENABLE ROW LEVEL SECURITY;          public          supabase_admin    false    445            d           0    27056 	   exercises    ROW SECURITY     7   ALTER TABLE public.exercises ENABLE ROW LEVEL SECURITY;          public          supabase_admin    false    439            e           0    27074 
   flashcards    ROW SECURITY     8   ALTER TABLE public.flashcards ENABLE ROW LEVEL SECURITY;          public          supabase_admin    false    441            `           0    26804    friends    ROW SECURITY     5   ALTER TABLE public.friends ENABLE ROW LEVEL SECURITY;          public          supabase_admin    false    433            c           0    26976    learning_projects    ROW SECURITY     ?   ALTER TABLE public.learning_projects ENABLE ROW LEVEL SECURITY;          public          supabase_admin    false    437            f           0    27113    links    ROW SECURITY     3   ALTER TABLE public.links ENABLE ROW LEVEL SECURITY;          public          supabase_admin    false    443            �           3256    45879 8   friends outgoing and incoming friend request can be read    POLICY     �   CREATE POLICY "outgoing and incoming friend request can be read" ON public.friends FOR SELECT TO authenticated USING (((user_to_id = auth.uid()) OR (user_from_id = auth.uid())));
 R   DROP POLICY "outgoing and incoming friend request can be read" ON public.friends;
       public          supabase_admin    false    433    433    433    494            q           0    135317    player_answers    ROW SECURITY     <   ALTER TABLE public.player_answers ENABLE ROW LEVEL SECURITY;          public          supabase_admin    false    465            o           0    53025    private_room_states    ROW SECURITY     A   ALTER TABLE public.private_room_states ENABLE ROW LEVEL SECURITY;          public          supabase_admin    false    457            _           0    26744    profiles    ROW SECURITY     6   ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;          public          supabase_admin    false    432            l           0    30854    project_ratings    ROW SECURITY     =   ALTER TABLE public.project_ratings ENABLE ROW LEVEL SECURITY;          public          supabase_admin    false    452            n           0    53001    public_room_states    ROW SECURITY     @   ALTER TABLE public.public_room_states ENABLE ROW LEVEL SECURITY;          public          supabase_admin    false    456            r           0    233293    queue    ROW SECURITY     3   ALTER TABLE public.queue ENABLE ROW LEVEL SECURITY;          public          supabase_admin    false    467            h           0    27238    rooms    ROW SECURITY     3   ALTER TABLE public.rooms ENABLE ROW LEVEL SECURITY;          public          supabase_admin    false    446            m           0    38289    sets    ROW SECURITY     2   ALTER TABLE public.sets ENABLE ROW LEVEL SECURITY;          public          supabase_admin    false    454            p           0    69388    tracker    ROW SECURITY     5   ALTER TABLE public.tracker ENABLE ROW LEVEL SECURITY;          public          supabase_admin    false    464            �           3256    102112 .   user_learning_projects user can leave projects    POLICY     �   CREATE POLICY "user can leave projects" ON public.user_learning_projects FOR DELETE TO authenticated USING ((auth.uid() = user_id));
 H   DROP POLICY "user can leave projects" ON public.user_learning_projects;
       public          supabase_admin    false    494    447    447            x           3256    38288 =   user_learning_projects user can see their own joined projects    POLICY     �   CREATE POLICY "user can see their own joined projects" ON public.user_learning_projects FOR SELECT TO authenticated USING ((auth.uid() = user_id));
 W   DROP POLICY "user can see their own joined projects" ON public.user_learning_projects;
       public          supabase_admin    false    447    494    447            a           0    26864    user_achievements    ROW SECURITY     ?   ALTER TABLE public.user_achievements ENABLE ROW LEVEL SECURITY;          public          supabase_admin    false    434            i           0    27260    user_learning_projects    ROW SECURITY     D   ALTER TABLE public.user_learning_projects ENABLE ROW LEVEL SECURITY;          public          supabase_admin    false    447            v           3256    30853 +   profiles users can update their own profile    POLICY     �   CREATE POLICY "users can update their own profile" ON public.profiles TO authenticated USING ((auth.uid() = id)) WITH CHECK ((auth.uid() = id));
 E   DROP POLICY "users can update their own profile" ON public.profiles;
       public          supabase_admin    false    432    494    432    494    432            �           3256    426749 =   objects Give users access to learning project folder in files    POLICY     t  CREATE POLICY "Give users access to learning project folder in files" ON storage.objects TO authenticated USING (((bucket_id = 'files'::text) AND ( SELECT (EXISTS ( SELECT 1
           FROM public.user_learning_projects ulp
          WHERE (((ulp.learning_project_id)::text = (storage.foldername(objects.name))[1]) AND (auth.uid() = ulp.user_id)))) AS "exists"))) WITH CHECK (((bucket_id = 'files'::text) AND ( SELECT (EXISTS ( SELECT 1
           FROM public.user_learning_projects ulp
          WHERE (((ulp.learning_project_id)::text = (storage.foldername(objects.name))[1]) AND (auth.uid() = ulp.user_id)))) AS "exists")));
 X   DROP POLICY "Give users access to learning project folder in files" ON storage.objects;
       storage          supabase_storage_admin    false    339    339    494    447    339    447    486    494    339    447    447    486    339            �           3256    426741 8   objects Give users access to own profile-pictures folder    POLICY     ?  CREATE POLICY "Give users access to own profile-pictures folder" ON storage.objects TO authenticated USING (((bucket_id = 'profile-pictures'::text) AND ((auth.uid())::text = (storage.foldername(name))[1]))) WITH CHECK (((bucket_id = 'profile-pictures'::text) AND ((auth.uid())::text = (storage.foldername(name))[1])));
 S   DROP POLICY "Give users access to own profile-pictures folder" ON storage.objects;
       storage          supabase_storage_admin    false    339    494    486    494    339    339    339    486    339            �           3256    434846 ;   objects Give users authenticated access to folder 1skn4k9_0    POLICY     �   CREATE POLICY "Give users authenticated access to folder 1skn4k9_0" ON storage.objects FOR SELECT TO authenticated USING ((bucket_id = 'profile-pictures'::text));
 V   DROP POLICY "Give users authenticated access to folder 1skn4k9_0" ON storage.objects;
       storage          supabase_storage_admin    false    339    339            \           0    16509    buckets    ROW SECURITY     6   ALTER TABLE storage.buckets ENABLE ROW LEVEL SECURITY;          storage          supabase_storage_admin    false    338            ^           0    16551 
   migrations    ROW SECURITY     9   ALTER TABLE storage.migrations ENABLE ROW LEVEL SECURITY;          storage          supabase_storage_admin    false    340            ]           0    16524    objects    ROW SECURITY     6   ALTER TABLE storage.objects ENABLE ROW LEVEL SECURITY;          storage          supabase_storage_admin    false    339            �           6104    17442    logflare_pub    PUBLICATION     U   CREATE PUBLICATION logflare_pub WITH (publish = 'insert, update, delete, truncate');
    DROP PUBLICATION logflare_pub;
                supabase_admin    false            �           6104    16387    supabase_realtime    PUBLICATION     Z   CREATE PUBLICATION supabase_realtime WITH (publish = 'insert, update, delete, truncate');
 $   DROP PUBLICATION supabase_realtime;
                postgres    false            �           6106    17443    logflare_pub billing_accounts    PUBLICATION TABLE     K   ALTER PUBLICATION logflare_pub ADD TABLE ONLY _analytics.billing_accounts;
       
   _analytics          supabase_admin    false    4752    389            �           6106    17444    logflare_pub plans    PUBLICATION TABLE     @   ALTER PUBLICATION logflare_pub ADD TABLE ONLY _analytics.plans;
       
   _analytics          supabase_admin    false    4752    393            �           6106    17445    logflare_pub rules    PUBLICATION TABLE     @   ALTER PUBLICATION logflare_pub ADD TABLE ONLY _analytics.rules;
       
   _analytics          supabase_admin    false    4752    373            �           6106    17446    logflare_pub source_schemas    PUBLICATION TABLE     I   ALTER PUBLICATION logflare_pub ADD TABLE ONLY _analytics.source_schemas;
       
   _analytics          supabase_admin    false    4752    395            �           6106    17447    logflare_pub sources    PUBLICATION TABLE     B   ALTER PUBLICATION logflare_pub ADD TABLE ONLY _analytics.sources;
       
   _analytics          supabase_admin    false    4752    371            �           6106    17448    logflare_pub users    PUBLICATION TABLE     @   ALTER PUBLICATION logflare_pub ADD TABLE ONLY _analytics.users;
       
   _analytics          supabase_admin    false    4752    369            �           6106    135294 #   supabase_realtime answers_exercises    PUBLICATION TABLE     M   ALTER PUBLICATION supabase_realtime ADD TABLE ONLY public.answers_exercises;
          public          postgres    false    445    4753            �           6106    135289    supabase_realtime exercises    PUBLICATION TABLE     E   ALTER PUBLICATION supabase_realtime ADD TABLE ONLY public.exercises;
          public          postgres    false    4753    439            �           6106    135290    supabase_realtime flashcards    PUBLICATION TABLE     F   ALTER PUBLICATION supabase_realtime ADD TABLE ONLY public.flashcards;
          public          postgres    false    441    4753            �           6106    135293    supabase_realtime friends    PUBLICATION TABLE     C   ALTER PUBLICATION supabase_realtime ADD TABLE ONLY public.friends;
          public          postgres    false    4753    433            �           6106    135297 #   supabase_realtime learning_projects    PUBLICATION TABLE     M   ALTER PUBLICATION supabase_realtime ADD TABLE ONLY public.learning_projects;
          public          postgres    false    437    4753            �           6106    135295    supabase_realtime links    PUBLICATION TABLE     A   ALTER PUBLICATION supabase_realtime ADD TABLE ONLY public.links;
          public          postgres    false    443    4753            �           6106    135291 $   supabase_realtime public_room_states    PUBLICATION TABLE     N   ALTER PUBLICATION supabase_realtime ADD TABLE ONLY public.public_room_states;
          public          postgres    false    4753    456            �           6106    135287    supabase_realtime sets    PUBLICATION TABLE     @   ALTER PUBLICATION supabase_realtime ADD TABLE ONLY public.sets;
          public          postgres    false    4753    454            �           6106    135288    supabase_realtime tracker    PUBLICATION TABLE     C   ALTER PUBLICATION supabase_realtime ADD TABLE ONLY public.tracker;
          public          postgres    false    4753    464            �           6106    135292 #   supabase_realtime user_achievements    PUBLICATION TABLE     M   ALTER PUBLICATION supabase_realtime ADD TABLE ONLY public.user_achievements;
          public          postgres    false    4753    434            �           6106    135296 (   supabase_realtime user_learning_projects    PUBLICATION TABLE     R   ALTER PUBLICATION supabase_realtime ADD TABLE ONLY public.user_learning_projects;
          public          postgres    false    447    4753            d           826    16665     DEFAULT PRIVILEGES FOR SEQUENCES    DEFAULT ACL     �   ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES TO dashboard_user;
          auth          supabase_auth_admin    false    34            e           826    16666     DEFAULT PRIVILEGES FOR FUNCTIONS    DEFAULT ACL     �   ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS TO dashboard_user;
          auth          supabase_auth_admin    false    34            c           826    16664    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     �   ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES TO dashboard_user;
          auth          supabase_auth_admin    false    34            w           826    29332     DEFAULT PRIVILEGES FOR SEQUENCES    DEFAULT ACL     v   ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA cron GRANT ALL ON SEQUENCES TO postgres WITH GRANT OPTION;
          cron          supabase_admin    false    2            y           826    29331     DEFAULT PRIVILEGES FOR FUNCTIONS    DEFAULT ACL     v   ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA cron GRANT ALL ON FUNCTIONS TO postgres WITH GRANT OPTION;
          cron          supabase_admin    false    2            x           826    29330    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     s   ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA cron GRANT ALL ON TABLES TO postgres WITH GRANT OPTION;
          cron          supabase_admin    false    2            v           826    17048     DEFAULT PRIVILEGES FOR SEQUENCES    DEFAULT ACL     |   ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON SEQUENCES TO postgres WITH GRANT OPTION;
       
   extensions          supabase_admin    false    31            u           826    17047     DEFAULT PRIVILEGES FOR FUNCTIONS    DEFAULT ACL     |   ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON FUNCTIONS TO postgres WITH GRANT OPTION;
       
   extensions          supabase_admin    false    31            t           826    17046    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     y   ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON TABLES TO postgres WITH GRANT OPTION;
       
   extensions          supabase_admin    false    31            n           826    16699     DEFAULT PRIVILEGES FOR SEQUENCES    DEFAULT ACL     �  ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO service_role;
          graphql          supabase_admin    false    38            m           826    16698     DEFAULT PRIVILEGES FOR FUNCTIONS    DEFAULT ACL     �  ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO service_role;
          graphql          supabase_admin    false    38            l           826    16697    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     �  ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO service_role;
          graphql          supabase_admin    false    38            i           826    16679     DEFAULT PRIVILEGES FOR SEQUENCES    DEFAULT ACL     �  ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO service_role;
          graphql_public          supabase_admin    false    36            k           826    16678     DEFAULT PRIVILEGES FOR FUNCTIONS    DEFAULT ACL     �  ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO service_role;
          graphql_public          supabase_admin    false    36            j           826    16677    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     �  ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO service_role;
          graphql_public          supabase_admin    false    36            s           826    16907     DEFAULT PRIVILEGES FOR SEQUENCES    DEFAULT ACL     r   ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium GRANT ALL ON SEQUENCES TO pgsodium_keyholder;
          pgsodium          supabase_admin    false    41            r           826    16906    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     o   ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium GRANT ALL ON TABLES TO pgsodium_keyholder;
          pgsodium          supabase_admin    false    41            p           826    16904     DEFAULT PRIVILEGES FOR SEQUENCES    DEFAULT ACL     x   ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium_masks GRANT ALL ON SEQUENCES TO pgsodium_keyiduser;
          pgsodium_masks          supabase_admin    false    9            q           826    16905     DEFAULT PRIVILEGES FOR FUNCTIONS    DEFAULT ACL     x   ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium_masks GRANT ALL ON FUNCTIONS TO pgsodium_keyiduser;
          pgsodium_masks          supabase_admin    false    9            o           826    16903    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     u   ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium_masks GRANT ALL ON TABLES TO pgsodium_keyiduser;
          pgsodium_masks          supabase_admin    false    9            Y           826    16453     DEFAULT PRIVILEGES FOR SEQUENCES    DEFAULT ACL     �  ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO service_role;
          public          postgres    false            Z           826    16454     DEFAULT PRIVILEGES FOR SEQUENCES    DEFAULT ACL     �  ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO service_role;
          public          supabase_admin    false            X           826    16452     DEFAULT PRIVILEGES FOR FUNCTIONS    DEFAULT ACL     �  ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO service_role;
          public          postgres    false            \           826    16456     DEFAULT PRIVILEGES FOR FUNCTIONS    DEFAULT ACL     �  ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO service_role;
          public          supabase_admin    false            W           826    16451    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     y  ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO service_role;
          public          postgres    false            [           826    16455    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     �  ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO service_role;
          public          supabase_admin    false            g           826    16669     DEFAULT PRIVILEGES FOR SEQUENCES    DEFAULT ACL     �   ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES TO dashboard_user;
          realtime          supabase_admin    false    65            h           826    16670     DEFAULT PRIVILEGES FOR FUNCTIONS    DEFAULT ACL     �   ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS TO dashboard_user;
          realtime          supabase_admin    false    65            f           826    16668    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     �   ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES TO dashboard_user;
          realtime          supabase_admin    false    65            _           826    16508     DEFAULT PRIVILEGES FOR SEQUENCES    DEFAULT ACL     �  ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO service_role;
          storage          postgres    false    32            ^           826    16507     DEFAULT PRIVILEGES FOR FUNCTIONS    DEFAULT ACL     �  ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO service_role;
          storage          postgres    false    32            ]           826    16506    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     }  ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO service_role;
          storage          postgres    false    32            b           826    16611     DEFAULT PRIVILEGES FOR SEQUENCES    DEFAULT ACL     �  ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON SEQUENCES TO service_role;
          supabase_functions          postgres    false    28            a           826    16610     DEFAULT PRIVILEGES FOR FUNCTIONS    DEFAULT ACL     �  ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON FUNCTIONS TO service_role;
          supabase_functions          postgres    false    28            `           826    16609    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     �  ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON TABLES TO service_role;
          supabase_functions          postgres    false    28            �           3466    16683    issue_graphql_placeholder    EVENT TRIGGER     �   CREATE EVENT TRIGGER issue_graphql_placeholder ON sql_drop
         WHEN TAG IN ('DROP EXTENSION')
   EXECUTE FUNCTION extensions.set_graphql_placeholder();
 .   DROP EVENT TRIGGER issue_graphql_placeholder;
                supabase_admin    false    553            �           3466    16561    issue_pg_cron_access    EVENT TRIGGER     �   CREATE EVENT TRIGGER issue_pg_cron_access ON ddl_command_end
         WHEN TAG IN ('CREATE SCHEMA')
   EXECUTE FUNCTION extensions.grant_pg_cron_access();
 )   DROP EVENT TRIGGER issue_pg_cron_access;
                postgres    false    711            �           3466    16681    issue_pg_graphql_access    EVENT TRIGGER     �   CREATE EVENT TRIGGER issue_pg_graphql_access ON ddl_command_end
         WHEN TAG IN ('CREATE FUNCTION')
   EXECUTE FUNCTION extensions.grant_pg_graphql_access();
 ,   DROP EVENT TRIGGER issue_pg_graphql_access;
                supabase_admin    false    559            �           3466    16563    issue_pg_net_access    EVENT TRIGGER     �   CREATE EVENT TRIGGER issue_pg_net_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_net_access();
 (   DROP EVENT TRIGGER issue_pg_net_access;
                postgres    false    526            �           3466    16684    pgrst_ddl_watch    EVENT TRIGGER     j   CREATE EVENT TRIGGER pgrst_ddl_watch ON ddl_command_end
   EXECUTE FUNCTION extensions.pgrst_ddl_watch();
 $   DROP EVENT TRIGGER pgrst_ddl_watch;
                supabase_admin    false    550            �           3466    16685    pgrst_drop_watch    EVENT TRIGGER     e   CREATE EVENT TRIGGER pgrst_drop_watch ON sql_drop
   EXECUTE FUNCTION extensions.pgrst_drop_watch();
 %   DROP EVENT TRIGGER pgrst_drop_watch;
                supabase_admin    false    599            �      x������ � �      �      x������ � �      �   X  x��Z[s�F~f~E�_�*�����qj�����ݤ�R�@)�<���+���Ӻ!@`�=�l�cI��;}�Υ/bm̢6Y,j�&۶$�Xe��23$l˶�5I�]3��/����̏��G$B���P�̉�g�zݑ�>!���}��6~�
V������i�ј��/��Ѹ{um�&?4z���쏭�k��B��9�O������a����dm�����c��JM�s=�����B����ˑ�N����M>;��l�7[S�3:c��lڲI�u�v�-Y��m+}�h++aw0��Fd��K�&���rM��q����vB.,z�u�\�	�(B���V�:9V�����2g!�U1FAHa��s���,�*bP��1��b6#����Τ�Ѓ�>�{��E�����l�������)z��9ꙍw^X��a�Bu�l���nh<����9�UԤ��K}�V�Bݪ���q�b>�nԺM4���6��=�˂픇�l��	S99qo�(��,*���9O�o{se	wsھR�JI�rR>����w8��R>�2?�![�{\�e�;]�8�WA#������x��;�d/ůhe����S�	��4��N�ye���ݏa0Y��`�,��Ց����� ���_����CF��%(��z2��h�^��g�W!y�|2S�fW[zF~����H�|e��eCs4~�{%ё$:�H��fv k��re��;��kd^��1�Y	m1g���a8�B��Կ���#QjbM�,�HTߊ���^����������L�dC�$+�,;��u]'�f��4���,����֖u�9��`ݦˊ�b":2V\�E�\U׹��z��jZG�"`���X�j`"t�A#᲻�#��U�",PYĲa(�lk�����h�\�ª҆A�uK�.aY���+`�0QUtY����^���J
��h�4�uJ$�� )���v��Wd%\\�UGc�����]�0!24��Z�vT&��W<pyאt�@���yUƶFT���v$�B�I1c;� ���";������qװ�QD�#i��ﵸ��9���k�~��lE�o�ڊӳMn=���QM���d�m�C����Y�`��AGWm9=o���dvv�`9,=����<�wd���<X������Ԃ�5�Ur�)��BVD\����$���.���W1;	XP*����J�{�[Ӹ����J}#&����!ئ�4\���)�V�s�(U"m�Jq"��{�I|�14?�?][�Aܽ��Ծ%���?x�Xo��ALV�B���
�GǢd����w�ŷ�6��}�Ǣ�r�o������L�0MM��q�/�4?�ѿ}4�����8�#�h���ʺ��δ���u�"g��p�U��f�ˌ@ߟ�=�E����U�����5��甃�t�����p(^�(�W��ɸW�`Z�3��Ֆ�.��ԅ��{o�f[��,|u�s[��|<��[���y53QB�2��Iߛ������QYѓB-��NU����s����w�C�3�vB̤:U�t�2�^�.A"���	�Ԡ"sJҘI°��Yޘ_Oټ���#);Z|g���D�[bC���'���s"�V��i�g�g!���-h��i(�X��؊����yH����Œ�����a��ɚA1�ǩ����z��+՞O��)����d�m:�q�'Ms*SD��u3`����ܴiY��f�`f)E�k�]�8���"$/�gr7k,��+sVɡe⫖QRʬ͒DdI����J��/��U"y*��YE�%)��PR���0�uO�
��J��f�wH��	R�3��W�Tz������_�`;{`�v�S�+�Vr`���q�=�j���ho��z8���q�x�U<i�9L�n%5��d�B6OKmp��8�{ڽ���a����vDz0*m����+2͇����J���hE�x��c> VZo��@�o~f^�X����7�F{��t������-$9,�N}h��<t���]qY���,oT.ۥ���Z� ��l n��/��F,n�O�	��r�������{3����{b��hRXt�RCi~�M����U���U�מ�0ҍ�U�٣2�S�&����7o� ��/V      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �   X   x�3�t�+I-*(�,N���4202�54�52T04�24�22�*V��X� NC 6�2 <CN#������p�$�$�p��qqq �      �      x������ � �      �      x������ � �      �      x������ � �      �     x���Ir�9C��)r�tq�����h@�{�D�*o�J� ����x�w������W�O_ߞߑ_�A"�|�9�
�ٹ���m��k����c�A0��p?H^;����zF�T/+��������D�oO�����"# %�*dE��c?Hg���'�f
) =����*�Dy��D���O�="r놼h����ж}�I�\�Z�t�gd�E�af��p[PQ��P�������N�q|�v�nۦ.
6�S�W�מ-�Bnl�z�n�Tz�uqGN+�������M_p8�xj8��U��-@����-������{�:"�'�F1<��O)d�xc*�AB1�����[���*n��s4��lܵ}j�CP:؋:�Z��8������d���)'�8��CТtEg`u�� ��p�evL"���M�������AMꪤ�>�̌�T�y)�����4�=>����`T���}1.JYt^���0xu\���s�v��3�E)�D�Sd�02��_L�Q/D����+b�G���m��1�X�z|�@bH���]"���伆r�
�3�k��;��;��
�#_!mo=�����ȥ���Ҷ�M�!�4�*�c\C�
�@�F/�,��\��^�,��T�h�$D0��e3��^#�%!)"�K`�����'��+C,�={lAP�8��arZf��j�n|�p���6�y�� ��� ��fa0��&��t+jN�&Zu
>�0_}����P�[LK ��e��S~�����/S��      �   #   x�3�4202�54�52T04�24�2������� CN�      �   #   x�3�4202�54�52T04�24�2������� CN�      �   #   x�3�4202�54�52T04�24�2������� CN�      �   #   x�3�4202�54�52T04�24�2������� CN�      �   #   x�3�4202�54�52T04�24�2������� CN�      �   #   x�3�4202�54�52T04�24�2������� CN�      �   #   x�3�4202�54�52T04�24�2������� CN�      �   #   x�3�4202�54�52T04�24�2������� CN�      �   #   x�3�4202�54�52T04�24�2������� CN�      �   �   x��λ�0@���S��"��R:銋��11!� ���ݍ�/��'�C�f�5��]z,=����A���
��\UC7ʋ�kz[�δ���M����<7�6��P2��	�yX�m=��:W��_�+5� )�I�S�.	�T�k�u@ɀ9�� r@C쀒w@�@�R�p@�B��G}O��o      �      x������ � �      �     x��O��0��Χ��܉l㿹��C�[SEc{H�D�T[U��lWʪ�[��,�7����`���T�8Ю�Oyw��j/�G%��X��FA�h�J�)9�LrY�� �V�����=�'����M�y�֯�Bx9���c���c�������E�`Ӿ�o�B���������黹��6ӫ���/�w5�ض���y�8�ׄ���)���2�����OK(�狕�B���:}���gW��m$�����72LY坔tJ*� �9�@��U�v��P�R�D]��nX�����B"P�@��jkk�#X��?,�K�y�Lӝ�~PW2)j}����D�G-T%�j���hv�羻�����#�P� J�^?��D�[�k�,�Ű���wd�IQ �4 �{���Z"N��Jfa2���x���L:-q	T��g��D�A��U�	+��Ѹ�����/_�\�!I�J��rr��.����Z��B��Y�g�S��.�p�&N1#��lb��\��Q5�$�vJ+�hK�9�6������      �   8   x�3�4���OO�I,Ju042�3 BCN##c]C]#CC3+Cc+c#lb\1z\\\ ��      �      x������ � �      �   S   x�mȻ�0 �:L�x�!#�A;��s_�(L���m��(pdA�ȼQ$C��ie��ޯ�ɓ�굡���d;�; |~��      �   �   x�}N1� ����#L)���� 	&CQ@��}�ڴKU�:��>��y��r	q��fjlJ�Ȕ��$4�U�	��M
�4F��͝rL
�
�xB=`;�����-�}KT��L�� �u��8�hg���Su�k�V;�f_ۓ2�x-V��p�(D�      �      x������ � �      �     x�m�Ko�0���+P�3)��2H]��Va�h�d9���r^�ë�o� ݰ����|ι�ؖn w�[Q�,��7B��v��SRłI�.;��`qZ�ڰ��RgD*��~�4⤁��s��}P������t9��������$c-&���fF?��ϯܷ��}w��B��41���|$"���W�9��X-�8�ه^�?�����6s�8fg7��[�$$�a�Wi�%O#���p��_�o���/�΍���B�օ=yޯ�=����Z���㰬VU����QV6��:��a̄H2��(��~�
��f�uxɽY����4WLl	Ǚl@����=���� XԔ��A�Uٮ�չ��m;@S7�� C���qk��w��v��i�H      �   x   x�����0�s=EH�$�ؙ%��Qr/������IG_�� ��y�Nۣ����쉳v�4{m_DY=-�Hj�!�Y�2}i�HZ���9���Hі���ﯻ>c�/�N�      �   �   x�m�M�@����l�����D�.�E;D~,and���Ϻ�a��XJU**�Z	P4`胪�PzV�fho�6z�S�ϕK\���x�����$~?�-��󮟎�1�k狱Hʫk���"�=�xye�r�9���el��w7\�v纩�ָ\�� 9�	!o�79�      �      x�ܽ۲e�m-���
�^�pI\������X*�.��8q��V�J���莶�T]2s�{�L�r��O��_~��7ɞ{:s���Ol���]�ɡ�������w����?�a�������������������w�����v����������e����M��?��_9�_���ۯ����?����������~��~}K���7��������߽�0��Oc����O����!���[�����ⶓ�B�{�4��D����z~����?�\)��j�U�/E�߫y�J�;\���-��9��wNs憟e5�sJ�3d�.2����o��w{��_?�ÿ��W��������������ìN���rF�}f�N�*���y�����?�.~�_{�����ۗ�/�F^�v��c�e��d+qk�L�%���jY�������>��_k���YƮ�E�뮉E8�NmQ�s�|������\~U��_���D򅏙��8~K\�%ۋ���G��Q�_����w���o{����g��w=�W��O���Ϝ������~�����.��)��ګ�+U.�r�2K����F�#k���❟��WE^p�۝2f?<���ZN<D��yR�M���5��NAR�W1����'Kt��=mW��fA�Y%�:�2o�\���Z�z�{�t�D����H��{9	a�uz{�S�_����N��g*�uF�p
��6�5�VE���v�`�h�vRJk�k����k�Α��J���s�;�R��8%g�Y�)3,*���F:�'��.Ov�~}�b���2��l9 ߭�4�[BpY�k9s<:�ؗ�^H��"�N��S�]��0Hrn0HH�M���l���X��v� Y!̀.�z��E�z	<hӖ1�x�S��d)�r�Q`�Ԋ�S=�j�^�x�����;E^���v+��1��양�]x��+�a|Z�;Err��zS���}r��,�{N���Y�{� B��;E_��0��O�S��"?n�Zm�������'�b/ʪ��v���Ƒ�pĔq+���QU����ݾ:�I�G�<�!%�][�|Ipܳ��;K>�Ɂ��S��E�eg��f'Ĕ�53*��`&�s�ؓ�[8�_�֫�����(O��Ug�j�k�n|y�';୽���{p�>r�������L�����)O�>�ZkE/R��v�lN�J�q�b�Z&> tk��1��Q�|�}��x�25�vN�'ʷ�k4Ny;�)��}��4h9���$6�d��bYF��y�S��S
5ҋ@;�y=��ic'>�'`ܚ P��?����?�Wz�[�K����`z��[av;�[\Wn��4kZ�7�П/�b_����&�=E:#`����h�iYnٔ��o)߇����T}�����9ϪiL@��X�()Bƣ�B�j,�n�W>,���Ѳ#d���.�2��2ϳ��`�7�^6�F"ϱM&%;�t/����oWʇ�B�ȯ*f�"Z�:�H���z+99�X�=y��B�T�^�,��F[��G�E �� ��06Ӓ�ܳT8�}g�.zᔓ�~��c�}����y�:]֓���/��|Aܦd����)�	�8�I�����U��U$�6ڗ�/e�uƾ(X���ԁ��WҜe�� �߆���^�����K�N�r'�@5�Oo�����ģ6A�R	L4�"2���Na��rH��i� w!��o��ÜUC�9] �������k��3m��]�=��N�!�J����i8e[�i@��3����=};��Wḋ�۝�,/׹���>�6�6��m�=��)�
��.�+��J����F�|�.U����q�R�K�Dn*0A�#��L$���M��m�U�z~��/�ru����[����E �m��5vSyr���2k���^ q��O�ɫS"�q-+�|^�8^�e� a�L�� N=��)�'�j��5������a���T���{��EW�j�,N��� ���>�n��K@n��7W˕��/���O�	D\$�Ƕ�n8%��K �H�ܳ����_��i�
��d�e����"���/$ ��Z.��M`���E��)���-���U�~��HT����dFQ�t�W��a���
4��\O^�E��|(:�1��Ș|z�:���Q;���wa��Cɑ&�d�'"��`1df�u&�Ӣ����c#?�fN)�&\��M%Nkl<#i,�E��=J��X��KsڷN�����U�즪��q ���$��,y3�&� �Y:��WQ܅JC����G����F�b����V����\����9����ܚ���\���c�8"�g�4{�}��#?�)�W9*��Ty}��_V�-+�5՘b	�KQ�зW�6�vG�x�jNы�S�:�h2�T�b
QN�.�g����N�_���e��X�VY����8�<Qy�f�2���t}��%�R����75+���B�Y��H3�lp �X��?#�������������?�����[�f�pT�*���6�!y9 �ZM�k&�f	p���������7�����U%�������8�����P�*�Fyjw@�`fԑ0W�����0�h{��JF OC��N����Qއ��|s;�H�CLS��s�Q�L��myV����W�7����g�ғ����r܎�T&�Qŗ���gOUe�+��E4X��#��=q����;�/�P�c1=���d<h�ų�[�գ'H�����GCV�ѻ�i�<��I����	�̹�6�;{��h��l�E�ȓ�~y�7�M��dϹq����仆�P� q��l���T*����:ÎRVT'O�g��5�8�:����)R�u��MC���Y�oǡ�,�i.��vm�-���)Qi��o�6kѤ�C+[�-0wX+�����?9E_�3��J�m��ád�Aٽp�Ej�1�]�|(�L�o���L|���"�|vh�p:V�^�w|��N�W֛��ZO�}��5�9K2/-��J�{ĥ��k?��fn|q�W���L�j��/M^'��U��>���'�Pk��7�c�ǁ��و(�j�� �M�Լ�Q�%��.���ʲ�`RZ���E	��Is�2��S�D��)x�^n�߳�X��)��t�Xx:�A�Hă�Bq��*�]��o�����U/+��"�X��i��������dUE|�-�%Rv��-�٣��fr5����~ޢ��'1������GG@l��nH*ŋ�@��n��C���˳�M�J�J��lv���<9�6�d������n������s����m'��gIr:E���&�S��~t
חy�z��E���6z���4�GXk����9p���_i/�v% ���\��J��ko�P���u��GO��z;E8��@�덬CY�h�r�`��ӈn��'Om�;=����{��`"m~�]瞫1hVKK<�'�2�����?o�Pp�!�,!s(d7�,e�1t'�ž
{��ۡ�hѠ������_������/��㸇[ܸ6@����Ȗ<{`��p;~�Mѳ��HfZ�`~����s*{�6�{}>����ZnT�  /6-��Q�>��ŻՏ{��S�v� #���% �	��	�B�A��p;���?���d�M���}hȁ��kn9َ�����j\���K��z�j��~�6a��grR1ac:ș�?��G�W�_�,{��pB�|=�d��R󼅟��=�Bt�a_����i�9�vV�Y�C�u*,���E���b��M̫:@%OĽ���yIڊ5]�:=��)��^Z���<�zu��)ԋk/	�w&a�%S�~'e�$��D�0�|ᔾz+���O5J��N;�6�ʿX|�YQ��B��
|�FRt���=찘Z�i�ҴV|ō��xN�W�S������&&L<G+�2�k��p�ȸ���_��bZ�$��@�HC㌠W�}�e=���h��\\4��4R�cY+�+��3*�hKN-�= 	�?�)<%������@Ly%�Q��BtWDB�X�X��a�O,�Eٮ�����tW�ñ    6�����(`�����b��M�F���x�'䇸���@�۶� ���0?ڕ<:�I����(�Kj#��X�&&��T���������.�B[�>��ϛ$WOކ�֐R���7�>>��׸����"7�g�]N�Ig��r١� 0 o�(�w��g��+�F�.�b���C4G���hN1^/D_|ĳ��Y�.7�Q2N�6-�	������m��e�ǟ����~S�x\N�𭘤v�vxַ/��܄~�L�����鐼 �)�щZv�	DM�!<vG�?|����1��f�bmm�)qi��|׾*��uJ.�["N�wGf�7�at��Ffꚜ��,�Mښ�sU��fG@
�5���D�tV��#���TC"(o�{V��)T_%&a�`�8k�Z��P��>����|��N������ /�����xD�!V|�����3U��(@��<�����ˁl������'�D��d����*�}�d���8_�~K�S�Js�Po�,��h����A
�i�'��ϕh����ƍn"�*�p+��EE�^Փ�d̺>T�G�T8�ߔ����1�Dy&�I^z�s�B
���P��9��-7NY�$��g����,ٻ�_֤2�D���b�,X�_	��P@J; 3�6G�<� u xzlE�W�py�r36�:�P��=z�����i����4�N������]Ho.[w?���(���J��I���̹�w��Q��4�����w䐝=�EG���+�,��V)���**�dw��d�i��k�X��f����+(�j2�����d���N�'/N�ᓜ{���#>%�l�&���~',�yk�������팞4+�v�]{׫�&,jd�g��)�/�"7���l�!���L� x�D�G)�g|����n�98/n�7�=�F�m��C�����V�Ң��c���''N��F���i��,��W��y��������$�t.�oheߝ�B����W�~�$e	���O�WlQ�T��TK�u�Ĥ��W# �T�CM?�;��m��n1�6��ڝ�&�4ޡ;0 -Zٲ����-8Eګp!�Yr|��������i��Iυ]m}׾�i�AB�F� .�]�
r�i������d�lf)��J��O4*����LC��'�&h���S_���V�v`�w#�>m-h0G��M�*�s�%��	�nH[ʈ>-�*����)�_�c��n �:�l�!Z`O��<:�g	�,>|S��2�1C SK��U
��z]'�M�������,��f���#�4g	���X�Z�ӵ��jwtt�����U��-������*��AM�z|�L�W�����|��8k�Q���,긃]�ZS��f�cQ�p*�����rn��{K0�»/�Sn��2�,�Ռ��ˆ�o0j�M!��栕8������v����-�:Q6����n��<w��<�`�������ܞ:7�G�`1�j�\D<r�s�$3`T� N��l�l�1����М��f��zsCE&S��Ђ\��V���� ��a��2����Vo�=Yz�\i{��1�4ƞI�<�k�*�v�WU��Ba�-��HuF��+�v,��\�ws#��w�xQq���P��̜�'�Z�=���s���M`_&��|⨌������r4P� �6
�Ъ�����X�q:S2ߜ��{ă��#�R	)*��k_�P�3ۥܨ�墴���@]�:�SNң;&O�O�p��A~������t��9mA�����,	쬜�K_O\��!�_j}�Ro�F�[�f��V��3@�����Ț|�]/��y7�����eV%�aA`({G+���� ߧ��ßZ3��)5�ȩ >�(N��JM�"qnuBf����8���ౚ_���6ŏ����Q�:x�C 3����i���@�����]����w�7��m��!k����y��B:��2��p��z����������/�����!��je�?߆cg���'`��a�!�r�$�δO�a'���$�Y�9�v}ǌ$�~;�{�z�u�5V���D���asgۢ-#e��L>Y�ÚR�����q�)�j:��D����{@#�CX�ϩ�Q�38�n<��3=�����e�ŀ���>�S���)�H�?�i<�pѕ�X�+-'��El�(KF���@��{rQT�����˨x��|r����d!�s _������"�B!A�r3�k�O�Q�Cf�p����F.���B�+�Wc�dy�ޢr�����ˡ�#u0�����?�M/g�j�ogm�#�9Ɵ�hZ�4K�a@=�T}��|�^��o�*����9�6� ܡ��@#ok�.����* ���Yߑ�S1_��1WsM�H�3{>O���Sޓ�n��f(��Cy�����7~�dJ{�\��^h5���5�i(�m"DA+3���`7h��Mϴ������'7ڭIy���֢`��4�����-W[�͜��8�o�|U᳤�9'�!î`/�X��7��Z��S,.v�Mml���Š����@dx�����}:b�wuCL���J�f��dr}v� \*g�ܶ<t��ON�/F��!-W���]��&sZi;������C�xx�ԫ���'zG�h���3MB�����B��wy$W�7
�U(�H׍�QjrvOR�W;��zh��W��"�����>c�0�9B&�ט3�Y�I������ �o�L�,[���8a��-,��Ϥ�����ӢEI�nna��u(.({h�`�t��|h��@��seM~��B�������{$N�PO���2�O����q��)�?&z5���8��=�L-&I2��;�:NΧ��/������nƊ�,=�����H6�2�����=u��)��/CĻQ�=�Vc��	!�C!qx��S���%q�ݸ�R�Dn��ľ�
}�쉻^S��������v�W�[�#\m�ɻh���(��E驋-�R��1Яń
�A�}�ܣDwo�k6~k��%������9�䥙�R�๼2��բ!5KZ�j�{Ymp��)��@,�&�6X�g��9���Ş]�VH��O>��w��v�:z� ��������h(�H�yo8�_�|#=���'aQ��Yi����C��a�C���ԝn(li����3���zK�5�Qx����p��re��4�6����32Ѥ��3>[��C�kt
����4kף!�с�x�9�H�1�*c=�s�'��W&DڋKV�A&��S��H���h�hd`���KV��g��\��EG�n�L4ǇRg�{�c������(�%jx�W�HdR��c��=
v��ijO���)QW�n�`�N�X��<.�1��֦3�.g+��y��(Ά�������ZS���\�6:����m;�ܣa��K�si7��22�c�$��rՆ�PC�eU�9V������W��R.r'��R�����!;�؃��t�Q��ӄ�φA��b��Zi�sBx�ȝ�ͣ��v��X��m,_e�i�K��{�Ns3�#����$��SZ8����m�ɣûr�)� �������A�Ŝ�����ZϜ��G�a��b��M�:Ti��]����ߕ�y5��ѐ���W��"�' ��=���R�}&�QkVk����_dU�4\���Jf���F���j�<7h�_�%j7�S�̎-A5��$�eS�EpU?6}:~�����vs�هu�0�F�6��r'c=�h��tNi�f�7�q�m�!�����)K�D��"��K6���Ɓ�����N�oW�)� `s�Q�/`���B�D^-��t̨4��$�$����݉�ib������M�iq�S�Z3S �yc K �68x�O��!�c��F�qv���������#p&@(,������n`���v����4��j�w>k�ܗ��ȇ?:2xș�Q���ޭ���*X	l���)dm,o�|t�VB	�d$�o�,C�o�J��;�V�J6�`��A��#��N�.�7刳��kM�+q)HC�a�U�n��U�_$#l`�_�K�^�.=e쎸��E�;Fs7    ��|t����-Y����T�Н�T�Ö4��R�8��Wh��U&swxtI�:B��6B�6�J ��K�������$���܌&���y(� 
���ȥs����n�ǺɿH�[.��t�j�Ϩ����=&��)�`�#*�����U(��E
��Z$\�g'�ܓ-FF�5Nn�m'��0
zY�+ľs�S�L1�<*�$��{���犥�����^�v��D]�X�ܓ�ْWZgSA�yn��W��n7¹>O��i�h�X��i�,�g*u�'oP��r��7�uf�?����c�4I����<�@Z���KA�oJK�.E��݃-DՓ���ŧ#�<�\M��;���|s X�a@l��D��l�z U̪D��-���P*��U�UA�o�O�`�j)d�g�+���È�+ ��)T^Դ���\���V�~�<���b<��I+���2=y;�W�������xK{J��);I\+v%Wn��Y��c3\8�Zmy� ��J94m��O6*=����y5����L%;�F+� � �`���ש��ϭIQ��J�zU�+aD/�+�<��$��� ���m�/T��=�Z��~
��{�8	ьPZ�v�ʝt���m��m/+��EaV׃��Ӵ5�RG�МHb��4�:W�'���8��m˪C)m�Q��Ж�4@�ϱ�_|.���#��G��6Ji��j�9����Z�<khz%!�q�.N�7n�f��g��\>���^><ZF�7���+� #�W����Kf��R��E��v�s�F<A�W�I!���[��GD�%�h�:Gl�џ[���)����F�ߦ�I�n�8���Q}eI4�D@��-+��B��*x��9�fvp1�G��0�L����hs���pپĥ� \���T��E5��W�1T�VĬEF�t���?j1|��ԕn@V�eg�S*3��bƋդ��A����?j1ػr�%�T��̧�B�>��}��{�ʇf�t|v]cܿF�����`����'�{��d�*�EKo���y~�Z�5X�����Ѫ-���`-��lLO��]�����W�l�T�(q�HCbT��b�X��1�E�{�hLi/�]����@N�L�3W)�!!���I����ɯv�L�����;��!0��͇J��ql������B/5�|sF�jc��T1��j�����c�P�}���M� L����*�6���Ї�)��Y)��{~?�������������ߢ=-�F1��x�R��vH�?��q��^.��� \��'.#�����>�Pj<Vmiw5�3|W���.�Oq�l���'V�͈�\ki�� ����P�U6U�Nc�9��B��B͘.0��;*�(�S�:�K��-�Y�ma�߉<9�SWʷfW��0�"`�8�����Y$fJ�f��#��n��B}��#��7���S!r�1�:�-���m�b}M�讙�ݵ���X�:wۜ=:DTf2Փ�v�������P-v�d�i��X�k�v
�U�17��T��u��2��V��I�/�-��*g�<�G����9S�M��Ŧ�$t9t���c�����&�%���뼥�4��3@�������fz9��ݘY��m'X�C�(JJt�5[�t����_�"/2~#ԲO�>,i�
];����y8��?�)RC���"2x���ڡ�;CǷ�H@%h{�����P��~SNsz92�Ic�	�Ωo@��5���wE�6�|�p	�qA�|���jjda�G�>~��L����;6������Ҝ��(d�n���c`y�Q��h����9�����u�57m��t��A�Ϙ�r(������B����!��R3�Ȟ��X�s,��z[f�R���$>m1H�٪�(��h�X���U�y,]��������[��N�i���o2���4�Ze�i�{$ �=�`��m��G���N� ��fl�S�[b�T��u�dm��9������>���tә.��W J�I�(��L\b���`���%�e)w5�3j@�-�@�D��m�Ĥ�py�zp��*�fծz���~\[R�����w�*�~)��Z�H��EH�7�4CGo-�^	,	�&�� ��~n�a�1M$�Ę.m7X4I���P�����N8�n�d�YC��=���r3��}�U�٣�4���.P�[ߏ=���$8������:�ř��6��Ƙש�Sa��b`�:;ov�w�l3e&�]�%��\���-���������@�M.+vj"��y�6��l� �Զ?�|v���M���ЇqZ+ �uY�.��9%e�	X��X�͝_�2x|7g���g�Ϋ'fy��'�oڮ4d��>�򫖨�"z�f����]=%�3�V|	��:"C9F1'����v��2y֋��S�\Gsڥ��'�L��V�h��ylO5<t(�ݴ�.�lZC�#ʒ�*V
����c���?�����c�������?�����[�f�P0	5+~��ʽ�q���Д,�Sk�S��8���' �h����4�ˍ�M�-x�9�	���W�5�rJ�o&��_���9̯R�ͱ�YU�̒�)���쌀PeKXI�h��<���^�f�/6�Wd��C���2Tibre����s�������7�7�5ƿ��~�v������	��+�*'��@�̘�{:u�?/��P�[�c'nz�彭�&H}F�Z��J��T��Ss����v��q��5S]���Ѕh�X1��(���3��Jh��~aS[�R�i淴fb-ZSG0L��������m� �7���+8Hp�>f�p���%96F�쳵���蔸���
���"+�aV�d�1�6�����?�M��Tn�4'�VKȃp�k�R�;!�|�)�S��}��ͰD�i���3E-6�"C���\4�fݏfK	�}��um��Q[J���իE��Z�I����S�A�\���+8�����:�imw�{��I�}�b@���nf0,�(@��Z{ϗ�iDn�J{��~�������)���{|Q�|y�H �<����?m1�} ��f���Վ�'�0�<�� �<w���T	����/��7]�v\�9-�,�kk��d��9`X�;ч�[�kj�4q�D<;��ef*#���
Q^����Ђ��N�ȝFr3 v��[֑�O�WFִ)Qd��y���N~k�������\��<k���c�BN�V5f�țk͟�j��$]�+�nC�0�Q��^<��X�ms֨�����2��M�ho]G9�8!k+�@9m���Z=���g���?Q�rS�U��޸%�q7���R�9��[Q�*��g����1�ϒ���P��\l$-x�C��y��zX�b�kn�1?��u�s#=jC=���PD�?����x�7�	��L%6ú��#�{f��G��o�H^�=�t]�6�t� �x�sX�F�`�
��oļ?������5
*1�R��&I%r��~1�}޳���*0ۍ<��i�ϑVT�N�㗜W���?�B�����G^V���)�=$n�y�x��Υ#������#J+<�M�G�l�0n<z��l����`mc�����/��zs��sK�����O��L��?���S~����}�Z-7��^�XqR`����Ø��w�?�x�?��77IuhMˀ��=�2'�y滟9d����>��C��%��F�I����&"�e�[�|���ӟ�_��o�g�ZhV��b�kl�΀:z�Lw��x��}ޓP��Q���S�;�WX��2�ι~<��+���fr��Ւ�5�n+�}�z�c�>7�v��_�ѹY��>�'�]ߞ�W�l;��#ie�	r���>�s�9�BΛo�FUZ��R	�$iQS�2��-$����S ���������H�k�b����G�*D��n�n�gj�q -���&|#lWΩY�J%F6��y��вK�~4O��6��,��n�%��
�y^��V�7 �(�94�x���)�ɓ�C���*X���x��\������>���ŇÏP��ϝ��R��
�s#�}���!����[R����>[��OZ��W�6x��<�����k`ӽ6=Fe����    |1���od_}���ёA'��ՔA��@ذ���N�I�7�"& 6A<X�Xod�yr��el/��V'JLu��a#%�����ڤ�U}���i���7������쐟�P�U%�´�BI�T0��;�F��oapn��i_��_r}5���9�7������Sr�D�sď���l��)d�9}?���;���� ��J�2�V��~�S�E%��D�wm���!�J��Z4i�B��L�Ü"��XzqG�W��MȺ���V2�%!��5l���e����$Zn%�w*�t�&Q���W�}ʨ��N��K��@�;�܏�2���IU�>U.�G��b�ts�7���; ��<i���F�]��eO���)�/��7meuN�b+�㪗�Ա8R����y�Sg��C�a���̰��>|��NF�5kr�C�Dt
�W�T�f���(��)�
v����&�Ax~n��W�-d�U`ƅ��>��xU��!
�mXTF���^�=T1���w�rӫl�C�'�ȼ�Ax5��@�z>|���Tc���ܔ�̍j�i��!][����z���控�~u�|a~)B�Mk�l^�z���3���H)�4FtX���ޗ��N7����-kÛ��:@e���L��d���G�f�\�o/�+�F�I���׬��}�6B��F;&8-�7�EyZ��!��4J�?��S���f���m��,+��Pu�P٬��T=�m��)��"H'��cT^$:|�6.�K`0-�i{<|�H{Q�tSѱs�@#)�h�%�F�nH�~zm��N���d�+�AݳŘ��0qY'�Ĕ�e�S��=t��ON�W	����
p]M����T�T'P�< p��Ni�F�ntI�ڣE��@댣�+%��G���S���j�Ʈ7�"ʫ �Kp� o9f���.}�}�G��!�Lr����cU��1}<�|��N��5d7=;����_�4���c]��M�!�$@���*��P*�O�&��)�����Ȥ�iT���{�b�dmS�!�1���/������B(;�Le�f��4 Q�Rj�˳ϑ<��ܴ����7�IfĔ����a�x[�����}��,ӛv�	:��>�����1�zxLa��V��ıU>
?����uM�hY��f��w��;�_z{ӯ�A�f���Q��} �nK�8��ϓoo���=�v�ǋx2���W�S�VK�/1��}{�aGӜ�XWE�ڹ��|�!9�tzZ�m�\������Կ	�}��-�2=&� �f;x͚i�)>�|�Ni��"72�q�'�u� �ǰR���k�l{n���Y�n�7i��3(=$$�ԁ���9k�mp2,��2"������}�]�5�M��k�W�Ş:��'� lx�~�8�<w����jO�N)���9.~?W9�'��Us��k������g�%-o�]�����ZomI!�7w�,n��u��b���]�'���󔧎��)�%���n���[\����<S��B��G{ru3�(���E.�F�݄��d�Y�5u�R�ڵ���ɧ��q#�����$Ԗ\w�*����9�U��1���K����WBK�-�m%I��#f�d`uj���x�쎪n$�vq�W95.�Z���2�`}��U��jLp/[����lx�`�Gi�!)��v�R�xt~��c+�F�#7��4��~KK(��9u2��𶡯v�1Ջ��VAeSTZ�) ����̣>��N��*vS�_/��!_݆1� �i�6
`y�=zr�Y8%�l�*�"_D�L�ς�{�`�v���m�w� ��C�_U4�h����*x�u�->[ɺ�2S~><y1P�\�\���:����8vȖ	����hT�G��SN	��1܎�����#FDl���ħ���XJQ�!�*_@ω�Rc��a�6.��w�@��Tņ����<�����;����p���Vk{K^���ۇ�Kk��1
�-zJ�6�+��&�E���=��;��n�����b��6x*Eo%�7b�"#�{����}b���"�zS��*��j	�NЕ��n`uy�� E�i�B�L�K��ҙ��g'Ө���.]�Fd~�S�U�t�F��y���*�Hn1�Hme�6�V�O��g���KB'��zA�8�3��9�cI;��}o��z�S�`H��W;�vY�ʎ�~E���C��k��N����n7ћ��h+��6�Cs�Jdq�<מO�C�S����Uu�x�]���N��F�-��8��	��P~�H7*���^NKy��0#���֘-�Co���q���=�y~���1P��X����)��@"�t��2�R���Ԛ���h�q�~r!%˗�/g��֠V)����X�� �t�eA`2b���(��m.��'�xF�������iף�,��}��t��~$�z�y�Yg�T��q����5\�/s�>��K�0�5�K9�^�D!��;����l���C��;��J�ӏ�����`16pG_G�I�裎�zs��.���S ��M_Gl'Ƃ�8 ����MR+8_%x<-H2�7׷Lkz�?'G)�А���pI_�-��b$
;\�o�C�4E"Y{$V�]@���E
�Z���b4��=��т<j�)�+I���ּ�v��٣O�5��zs㠽7!��q��y���ԉ��N�^n�6[���y��́��kc����%�8�	�G�iD���n����[+���l.G�]��mY�B4��k�v���y�Q�N�c�X�-&r�w�d�R9�i�|���*�BZ<��42���^,-{�?����9N�o�xPԌ�';��ycי��ܻ���R���/_R'��"��cFqO��}|����k]4z�)+o wom��?ߥ��	ۢ�5�[! ���
��4Pa�R���b*k�(��Q,��Y�Dz��GϷ�'�����լ/$Op���*Q氈��dρ��hߢ��=�6.�v-Sr�T���}2�IX��FF~t(m1�Nb"�E(������b���V�#
���?�'���.������j�B�Pҕ�O�j4��!�i��mw�s���A�t��[�)�5�}%:B������⮾�w�\KG��b�f���0$�gE�}�d�]N��7�M5�O���g�VR�,Qe�}�̩O���_�$�q.�ҝr�q
�I���x�R�t&��ű�((�͜��>�D^c>V��c|�8��6��}rnqHL�"7����*L� ^����ʩr1����EQ��EQN7�`z�f2I�>CTl&L:O����S)_���g����Zڄ5���vh�T�~�!z4d�SD^V�n�b�>�$f�X�.�N�3f7�C���l}�bWҌk�BEz�}�%�U�~�')ѿ����6���|I�������a0;��'����7W[���O�I���1�g���R�~r���W�1�jE������z��5�槅���U�}^���_�/E��h� ������}���{�����|�B^1g�oJ�u�:��5��C玊���Uumb�gÍ��T#�i7����I~,�!_z`�{iY�g<���S$NȐ//rLLhd���;t�zd���D�$T��g�p
ɫ���i��m5��>X��)L=Ԅʐ�����I{�e��� �	!5!잨/%l�ic�1�H��g�p
�WU�	�"�`2��s=���;�է��}5[)&�]7�����2Bw�N|�igu�Ns=��N{�x�s-~B���Z�=�m7,�\Ϭ�h=�Aj{D܍�~Ͳ���Y�uq�LFq����	����R�|�ɮ&V�)�EW�C6fU�����3�>���j������z�#ˌic+���ǘ!ݓ��#/�]��~Z,}ۍ��7�Nk;$bi�^�<�(&Rtζ6j4��Z�-]�4Z��i�i�TzH8t2=L����D-�M6B�:��<*�t�N(�Z*٪������fs�zS@�m �h���7аѵI]O����KC��"��q���J%�U���S$呥�ȭ�>�1�������y�y��8T���    JM��D�V���������7wK���-�� 'D�M�Wa��+O{6�wsB�4�g�]W��Q�@#a1M����ٛ>��}V
ԩ7)�����Hyu����%���p���}�C��j��Pڣ^I͐M9~q�'��BXʣo!)�}��|�<i^%�K�,�h�t�W�ܑu��5n�fT�:�[�*U ��w���4X�@g�����Ԩ�$�wE�ǙEa�N.���.�r}���p
���y+g9�D�2xL�j�J����M�Loj꺝�2@Jm!�[fO�^��n�����7_͎q�7��d��F�ۋ��X](L�ȣ�-���?��n�^&;���} F-$�C�U`�Y��G��/�1 �b� k�h�fY���
21,��Q�~�a�ͯ"z�2��X�H�gc1l����S.#�>{,�p�TH�^dUw�O�c�+�GǏ�d!}��=:�pL�T6�Qd��Z>ܓ�8)�)diN�%�/v�g����\J�U��������xa|���]-Eez��� �%����y�pI�yim~S W��m=���BPv�9��ne�М��$�c�W-vu�A���:��mF�uN~L0[���S@S�Dg��-K�vNi��P��
QFje�m~7�Ӓ��n�^�ԭgl�A�%��
r��Yj_`"��;�����P�Un�$�B%;�c ���t��R�l�]1�Q��T����%��
��|D�BOl��|'w�y��UT��jgYo�R��D,��Ն!�0�Ng���zb~�(Ԗ�͝t��XKR�xE��� |�NT��W�]��������^e%d���wM�;H�r3���>��Kb�F=����;�z���
XW#Z�}�*����\�٣�ϔ��bhf� �-�:��9-����0���Bf�:�}t!���<�5I��v�n���!��H�t.+��Ɖ恙ȝ{!2�f�8u��N��a��w�R�(��ˠIR��Rc�2��U[k>M]m/�����Z�tg"N�$��4�
����m��Ӑ��  zq�wz㲑=�u�N�r_5�@Y�J��ч��S�\�����)u�`30(���f�4i�=�\�sxD�&jА��4��)���Z��?�}��]7n��x�$��+o��g�'�N��I'���+ۺ�M�T����˥�����H`��H��,wu��}=�D���Eh/�z�����S�J�h�<{`K���d`�G���"2	@�7î�[f~���\�:P�`�x%��jR�(C�Z�^��"�tT���t�[y���_�my�9SÐbj�7�Z�����W������b'��=s�%8j�J/�̔c��3ң���;�9:yPl��xNG�-�^�z�:{������	ѫ��H�	9��	?��5X���IG���!!>���']�s��	l�N���&l��r�瞐7���瓡_AhWoA[-�R�z�eV���F�[����F�x��(��f*���܉CS�y	�1�?�9ĝq�)��Dp��P�������qw�D
Ox�	��cK���-%O ;�6�Wh-�J&[�>���z��'��ƈ��"�A�Y8X�w_��4L�G��1�]�A|�����k����7��ǔ�/�#*3Y	���ł��>4�/������Ͽ_u��>����tW`�		щ�������F�xEJ+�vTQ���M����<.�cv�Z%#db
�U�ۢ�M����������e\N���W�'-��D��4-
������ф@cq~n���S<۠��'<�f���FY�A~��v�� �+I�V�����| =؞r�o4E~L:M����GMJ�_�?�]�/k^�.�ƿ���^�f'�ĢM7(���zIuԾR� �י����S���8yjԕkT*������Lc��ʲY�Ѡ�jۨ�=ZW��HjI:VO�|�+�N幷A�S����z��Ҁٍ�J��c�Z�hr^�o��
�~��(�INɢ&��2��=�ò����b<���b+z��N�J��y�H\C�C4a�#�ʂ�K����7�x���D[�բ�[�X-��wV��YRW<0�|�ÛS�E��H�l�}��R�=�Ԙ��!>�g6��j�a>����#���j㫛a�&4Rk�V'[.�ٛS�CJ�r�Z����^�qF{r<;2�,Y~���|C�����x��R4��7�Zw�����}�����5����l�
b�i1Vg�^��^�#�g_�_=���n9�7X�0�4�{C!����0�g~�G8�r�:;��>=�26ږ���8�5�(O���|�Rz\գVJc��%u�Y7J:�eFmc�xt�x�44=��6��?�q�J���[�H:3�� ��yUD�'- 0m�Q(��e�:r���e��L(�^���=�Q��U�Q~pz	5��G�f�Tn�#�f��T��Nh�0;(횓 EzAJJ�}{�)�a�����+�M����A	��ۤ�����oS�o�����o�/���q����z�:��`T/n��i��uX;嵋�t���V���|��	�̺pq�6v	�0/��x���U��qJ�Wp�L_��G�N\Ģ�E���,� v���9%a��	�gO?�[*���y�:y 0�W/�ɐ_f�'9�T/�������,�;Y�"�pݚ�����'D��J�"Nm`�����lhZ9G

H��[y
�I���\S���4h��Z��^t����	C�á<����ܢ30S�ϟ�Hf2�G{���L�w9��ԣ�l-TxYh״(�JG=�&���Ձ�_�<�)����	�I+2�1o�-h��n�l�s�5�|��!���N�	&�V(�["��Z��iv�L�C���	��&�,'����ӗ���6Z�}�����v����A2w
_`�X��8LU���49t���C h��|���S��pRO8kÅ ^��8&�-/��Ƅ��9�OvK5;y��s�]=>�K>���Lt���G�G�q<��z$yޢ���x���Iw�)K�{��������zc����#F��Rh8.�N;������~'�)����`iN3�jP�獉{^{��4��w��r>�PlWS;H�O� Z���Z�[��4�GOqt��8���i������n��U��]�2Ϭ�f���nf�!���;Y�ơ�������^�[Y���r�	��Җ'�(��4���]T��=��W�Os��F==��,�'��Ȫ����^���Y7��r��=eHG��#�m�㄄E�+y���[EՊ2}��mRY6/R��$Rg��Ա�{�J�c���R�;xO�Ai�Aۊ�r���ݟ��g�la�>��<���T�}Oz���i�[`��'BV��U�F��
�aN���z�.�z�����u[cG�3��=�4]}�����H�Id�r/R%O$ء�t�6��@����:�����v��s������n����?������(��=T�KsW����Ĵ5P�$�飡_FR�M�����J�����Ü�}��'�=Ī�(Q%�]d��%�E-� ViO��{��Z*7MbQW
���ah��{��6���o�����x�)b%U�\-�G=��f���[A?�+߽k�1��d�ym?F�G�\��3C���	[Y��k���m����E��^����8wu�Ԝ�|����O����'�'m�s �P�q�����]y�m�!ck�M����6�c$�An���{B<��PӋ���A�5��u���6u�`���{����R�ݿ��c��S�G���.�����r~y��m�<�6ܔfc����G}�u]9�o9�8�|�����y�8w�m�;�ŷf�^��9�q~��!�pR}��+��<��eᮎj��EdUw��`�(�����A�&�����d?�8����G��?S��_����4hz�Eo+4�B��}/��H٭�3ڷ�W��h����A� :gi�Ve���BT^y%*�s�Tώ֏��w-}1V�չv+�v�g:�����c��H跞-�{a�tGH�Q��U�����    � ,�yG��*������#�C��L����,���XӨ.kc���9�OV����d�Ν�
��/�<�n��^�j���u����an��������f�9�$�"��d�\o�Qr�|?p�7֘m��@��gtI�WN$��Ж�G���?���`AT�tt�jn�3U���݂�a�Xc�E,��s��|���[�N��*Y�%na� ��{
���UZ���\�07}Ϲ��	�H=�΋	ՃDgǸ����.÷�ƠpD��7�+�e��seY��݃��}�ԶN X"e����2~���Uh1=��ɭ,���.���
1/\'�1��������'+���	{!��t�\"o�]=��7�M��I��綋6^��f'k#�HQ�#�d��0�����k��G9�Z��	�a���f� �]0s��
�FY�yC���X�Kc�HK94�=��ɷTs��%�o�+wi4�h�cǓfSOe����������߽�K�ɫ���z���X�iC��|�ʫ�x�v*��oJ��0�|�Y	����8m1��ī�@�^k��=�un�}�C����=x%��_�'��T���,�>�f�t5r�˾yd�|��:�J��,v�y��8�s&�9��t�$�$1OG"���ڊ�S ���� �T�2KO{���gԚ��ÏF��������nE9�&h�Ǣ��
=0�WP��Q�n��Ld���5<<#E���ǆ���������e���;�\��X�Nfx�4P���bG�:vM k��BB曏�?�+�\�1$|P���b��X4���������ʏ�����Q��\�͉��܂��Ip���z�B�������}3��6�����I�'��c��u�fe�/}��.�6�0����	�b^��X��J�G_ɵ�-(~��̔�گx�S���ɝ�/+F'jB�q��z��zj[r��8�-��W�twK��&��ɤǬ�2�����d�����u���oLɽ�\8��8��Kk���t6�ӓ!؇(���_��_~���ї��28��;�Q���
��_Summe�_7a����8�|�q	���	�/=ǥc�1w��2TFK�P�1����7�Ϗ���dҩjB'څ�c��S�9����8�üZ��L��~��KV�j�FÁ���t0�-$w�o#/�=�ӭ;��j6���N8�'�܉k���D!L�&r�9Á���Pj�e<�	�=�A�4w@N�1q��'$����ky0��O�yԬv¢ˬR�$�p�_��z#M��IF�׃��W��W�'�m%h��\�p{�932[�������/��O돞o��֟�ך�ι�¯bG�9\�l�D8FZ�0�vܐ�,/h����0r�fϽD�OP>����N�	�C��"\���e���=�*��y��N~q�RJ'/ F�DԦ���(Srm�>Yw�r
y�գ�O�*�����]N8C�앪�Y�aY����7�Ћ��8
��y�=����$����s�<�>�)5T˪��`��Kr[9U�ȼ�ѐ��f�2����l�x��A��<G������yz=�,��d��p��)^�B4����^i���o}czFv@��x F��?>_�UNF7K�Cms
��(��;x����\֐�)P_��(�h�)�22�S���$E�"�����ՎD|�6�ZI7�d+мW��K4Y�����h�@wHHl���	Π�=�2r��}������������j�>�ܩ�N͡[N�MN�[�۰���Gc|9���8�v�<�*�<��^�.A�7����̼�S���^�Oߋ�o�	B��!E����m-�\�7��D���2���t-�����$Qѡ54���C
���,'=(���P�?8��i95�C��1k.��h8��[K="� ܮK�Z9&I=7O���(��{�fH�F�1O=zP��jō��+#Ǎ,푪�\�U�>����)g�	I�V-5H�hp���ح����OR�:zy�SB�Y3�0l�܁G\J/���F8&kx���g�;ų�dГ�B;8���ѵ� mI}�P*m>���r
8v�%��@+�-]�_��ݢ����M��Nɗ�&�����Cyn�u4��n��т6��A�`�/w
�]$a�D���=A$:�3&���-^6��`.��)^��L|���<��1���d�/b]�l���)Y��t���4����cY�--/Gr}�G'��E�'�4~��<�����ܣS)�Fm�2e~zH��Q~О<o�Jx��W�X��U5-�H���|4v{�(�$z2����Xj�-HI�u����RY�,����4V �r�_��
�1uĽ�;�(,;C_�`���$�L r��g˾'ZM���pJk��v���j�+��9�^(�whɲ�=q�jH_I�� ��l9�[��|��)'N!,�]�<���ʩ�\ي��}mM/�^����IV��	�M4�d+��Mvo�p�G��K_lf'�>k#�ۃHɵz)xM��;&G�c
��
���r�<�Ā:U[	|��r����ܥ�G'"&�(G�)�6�ݞ�d���< �<f���ݚb!t%r&�ѡP)�&C�[W���J={@)��fo������{��wGK����F�X]ɦǚ5<������v�,j�a�)����ڜ:h����J3�gc7w���:<p��c�#Xi$�}{����4�iQ΅�������� f/��qI

ҫ􉶌�{isc+������UE�wLصta��ǮGS�mϕƪܱQ^���C���G��ԙG	�츗��l�$Z�Fhk?�}Ю^�Z���8Vq��������Ĝ&�Q�ʬ��(s̼�G�^���~�1�#%f��=���K�`��n#o;��f>k9R[�c�ٲ5!$���kb7ÓP�I����w4�N�$sHQb`�����i�l}？ǰD>��8�"�.CR��h�GP;bI��������|A9�9�0%\\@A:��6�]��+�ڧ9�^�f�hg��+Q�d#�*ZIM�m��BOvJ�1:�~���b�ȑd����;'Օ�s0�<�)�Қ���+^�WA�Sj(2vN�ŏ��p�Q�!I��r�z�!H��{�W �J��3�b��O�{�)���/G��9gR����C>�Urp�DK~�^c^�}N�L��SV�$�:Li��͝�xNP�|Ǔ��|�/�Ʉ�{LuI�u��ɞ��-K��^��4=zr�F�Bg���|�Ee�T!��7I�,.{�ec>��5�b/�$'m�ج��6Q��ݷK.z�{���[#wJ�Wqtq҄���J���h<��K��B�U���xI���E�
j���6������1B�N=������\-褎H��t[����qyL��p�:|�<��ѝ�eT���@kdK ��8���]/�lt�<}�\7x��������ݺ��蟙��\ǜ�)�/�\N��}��nU�>�m��M��r\��)�e����l�M��u�śWB`�O��O�}� '�[!w���DM��`��ec��`p�i����K�(�Ĕ��V����A�	;u��� � �^#?z�`�kI� ��5��C�`b�Z���Қ:�����X~�S�Kы���XQO�nъ'��恶x
��4���9I|�S��ݵ�9���ެ6N�k�^����8?��|��S���SgZ��[�nG����[3~�m�;%x?�N��P�Rۖ8�j(d쒀��ȣ��S0:�E��-�Kٕ9�n{q���Xߤ�~�g;�B,9DCN��a�<[ʦ~|�x�-����6��o����)�������6/��]�&~|��*Y�$�eD����ɽ��x��ܼgۜ�]���=$�=�H����7E���z�ˀ����}h�N�әRY���ʓ;��)���A�3j���L��D��%iߎ��f����<�)���gO4ŷQo�����eF��eo����۳/��j�W�'-���P8��;�2R�1�R0�ܷ�ߜR_��������*pD�=�t�r��-<��.��9�v��D-�1-��K�ģ��rp.zxFF|q8i]��i*����C��4���_I�<    �)��[�g��(���� 0���~��+w�(�I}�T�/�t4��*R���7)H�wJ��jS٫�������,G��ALi[�l�zp�zh���a w��;���}y���ճ-G�c�D2F�1���#��{|�S�O��<f�\�o�*+�EsW|�Z��Q�r-fx�}n�V.�*]�mPO��q,àu�e��C��h����{�,zˮ�/l�����ϊ���v���	���y���aK��4��ă�I���M@�y�RWh�c����v�ڦ�����?_�^f2�Y�&��w('��pIʨ]M���fk��%_j�'�88�윴� ƪ����u���z����x���.�� j;	*�zKm��/5�%�:޿��v�+|*��/G�MG�&=��jL�d8w*,��^"?`�6�N
r�mU��Z��s�"�F�����!?!��E�/�xI=��K������WJ����,oYd�������B��/�TM����v�9$�ՑVq��`�Q��6���� ��iGۓ�7Y��\7���8�V����~���UN��]���=�7���բ����k-�����)5�	��p��g���I{f��H6�%�<�Gl|0��}*�5�c�<:�jѶ=*�R���my窦��ܐ�9:�ݎ�id^�G���-Aێ!l���P/�d>w���	䗰�����gy��ri�]�k�I�d��2��@p�`���xpq�y�Q��tlw�����)�Ohq�&�|rPF\���ԁu(�P|w
R�U>�5n�~1��m���D��3p�ls��֜Z��`�_���
[�'�h�:�Ԋ9@�=��1o|����s!�t?��՝b1Ȥ���f�u�1�עEkk4�ZM�����/Z5_��B1=O�ęm���B����:����ܦWi��3;��A�����(p$Q{A�.�hI8��&V+��6�����̇TOv�eO-�yWd��z���:-� ��y4̿�Ž��{�.�!9�8G�#SgMe,bO�1�q�<����?=�¡�0�;Ԫ9�
n���=jx]���G�}���*LG�6�r�A��=��5�3�i[�=���x.xq�^��3�`	��&{ޘ4����G�$�*דQE6v���{#�����ZF�eo�"��x��6�3�I�P
w�<ʙ�?�QRo�V-�5��j��1�&)�����h9��֛8}s�V�m������� ����b|=QўC�HȐj��bu�ܴ���?Ȭ۞���v�U��|p쭍�e_Ի-Z�W|�v�x�1��g��-�O��՟	�+�}�%�?�Ӯ�ےV�zg||�����k����7�OS�Y�״�_яP�,���G���?�?������_~��������사���j�����K(���Ԃ$��aN����g��\N0b��Q�:H#����ĽK�_o�?�]�/k^��l�Ŀ�>�<E�t�s�v�3��$��L�,R�='��`A���酻���Q�<6	e��aT��?ʤ��dA	�udxTel���f*0B�w���FA��g��f~�W��h�9�rA<h&y�r����11��Vy��6�l�����q~���Nr���Y� ����0u��7�.��\2>��(��1lT�葹�l�Z"�L^���wN�]��rnc�ƀ3˴��#�cƨ��R����ҡV��9������{��Jɹ\�O���D���AT=ˆ&ܾ��������r)I���`'/�1Zj��VbO`è�ޞ{U��
�S�!v�^x���[ '�$�O�W� ��m����$~�H�Ƅf�g�^v��Ը�|pٻ�8��� �^�����L|"�8h� ���UW�<���產�}�<��Ч��h�=�G�A����=��.��d����Xa?7%ç�8%�N���?S�N�u�gbO��>���{��`��$��Z�$+�KL�[[h�s���B8����w9�j~��|���J�Ib�����C�ι���7��yg�o�/�B)f�ו�l�0�A�S�3}mu��,���V��l�[�i��Y�Ү�����w?�kT~s>��˸ISטI6�I�x>�A����G�����Q�������"��?4«�V���\,0n�������&;�P8Vq� �Zѓ�~ލ�8@3�pX�fkO1:��P�Ic�'�`	ʑ!��Q�h��Ml���?E�7^O(��,S���bXґ�J&��.^p`(?6J<�|y�TNz�F��)�H��d1{�'�\���1f�فx3__*V��'׎���5�J�2C�jv�䘡�nu ~6^3�L��b	�U=4���(Y�tи�J��n���>]��'��5o��HRј��W���\��w�p�yOƗ�{l�#D���G�ǀtw-u�Y���k��"D:y$�< �륊;T��R߸SM��S������O��4��A�D�j���?�X3״-��6�Co�����јZԿ���0��SgO����C��:z.��j����"	�ۓ��eh��r���DIg��y2�2��?�b������YH�5��U������[6}8M|����򪄥�D�ʦ����n~=l���5��5�fk���kO ���'�ｔ����Z2�kI���4�٭�H_ـN*tO}R�%�u80�̽w���T�oN�k�O޹!�2t��cF����!�vͦ*�`>U����G��v���26����إ�R�6�<D�����w��8(� �	��=z�'R\9w�7)M^5n�Ei> >WGJ�Ы�3�Pͬ�gq���ق3v��G�A�췧y3_�ER ��!:>Jג�EK�,p��i��a�9��;�Q�� d��K��nP4���|ҽ�Lxd{d��b��'7�K�:s|Υ��^�������[����Vk���値��a=��tE �=?K�ꎈ�a���tr�'P�����pVCn��m����SU�ۭ�r���/��XPNn�f����^?�3�H���Զ���ο������T�Ls�ȃ��Qs��Ә����o>�Hf�b��f�jO+�pD%�*��E�B�q�)O��!=^�4���8^�١�E~��̿v���ŠRoNM��x�b�?ءC?5��RGp]M��0�h�Q���MY%؄��t�Rgt\$mWgA�!J��μ�'H��7�zo�	�pd0Gt�{��Ǿ� dմ6��6�'�m���l /��yx�.�1ԍq��r&8�j�)�1�o5�4���r��K�$k��Z�M�c�BO�P���o����)W`�5�#��r��k%�z�%e������k���Ƃ1\�������ʕՠPJ���:�P����)2~i��\�+Uѥ�e�hK-APl�����kƇ�It㔋��E�.�qz�\����BY���+y���Z���ً%D��ۙ�{�tf����xJuc�;!u薈W�^�j�!J�Ձ��x���}ֺ�C��k�lJ�a��ڦJ����~r)8\�KF=�j���]��	�	�Yq�F���`z v���*P�G��A��
��C��"Hˢ�ڷ{z���pr��w)s�he4b]��������>�]>	5��"�#}�� W�Zt ��7��n�W��І��)�B�4�h�q��c¥�$S?4���� -{h�ΛS4���N������{������B%�<�����ݾ�[��%���Bx����:��¿8v�BaX��C��5��#�/�3�H��:<Y�Z{��n�N��9���7��D�QZd<���1�t��ƾ�q͚����*���tq�l��]ᠢ�8�f*�9�D�-;���k���@n��x� �I=��Ț}�*V0�J�b�<؋�V��\���z������˒_VO� iQ4�MY�~8�t���s�W�%ˉ�����~��)j�ϰ������S�?z`q8�-YG<Dc�-�ȋG��s�y�}�F�7�1F:�H��e�Jɂ�F�-u��GHhz���w�c9�;���v���a,{�*;�Ck"���G7/��9��F�:���G    ������tKڸG]�u�]��K�-�`�z�	������%���ܴ��!̽��G�	{9\�Iە�:As�o<C���CŨ�宼��G7��dfwm9��-�u�X�����E=�7���^��2�I�7zw0g�`����A�����k��x������p����P�0�	��l8���@}U :N�=��;/� �/�c����Z�}����t���j�S�'�6��!(���y�����$�U�{�}�#�;z�c0i��g��ݓj3�|���w��<��(��^;v���R���x jLe< �G�5��
���~��$Q]Q�7/��P �D�}����Tʁ�2�����>z��7z	Ji��=�V�r���T��18h�H���#���ɋ���Ǌ�7[�����-�h�i+�L��h�䱮���`���3�Bh�V/U�ޤK�a��dU��y�gF_��:�	��g�}�	��T�p׷&�в��,���g�{���-��v"�Q���4���\PWÄ{�#87�;#�;��伊I<��[���{���l��p���{��@�HA��Ҋ�.�6l�z�`̈́34�/r*�[E�����{��9�e��[�X�[z>HZ �˿���f �u�O&�1���]՞*�fF��:��B��S�v��My4r�+y!Ǥ�f\�i.ee��Cy9�.&��N|p%VDB��&�h�A��[eL�h�Y/_<�)�G�@��c�l�Bnh�ͦ�}3���Ҁ�<�]0��%�!���	|ۻdO��o�s�h���d��o*��x�1L��K9�N�<t��$Щ��c���ԝ��b�'� �Hԙ�����t�2�/)n�>��v�@ɞd3��ؿ���jJ4S�U�c����>!��"�	m|�fez����i��Bf���!���k���\� ?;���kƊqW�h�:I��(N�m{@��O#�GsE�e]�}�p�@HV����'T4�����3^�I���꥾��5k�I�l��3������c@�`-'wE�+*{��j�!���c�&{��:����K�:i��qQ64��-[�+�����_�=��t���5*r*R|�����>�ٙ�޽����x�`Z���L6vNX�*]l�/����~�R���
{=;��
Y_�MώtZ����;6�{y������O�t.�h���F��X���~g�#���l��jx//:&]jڬI
������gO��u���u߼����L� �@q���q�1��aWMO#�f.�ׂ��^ۖ�V�d6�쁾��$p�n���s��+��ϼ���)�*��9�����A1bA�Y4��X�C����B -r G ;s�\��}[<��g���>�Di=o~1���IC`�^(yʛe�� ���P�,�������E|�O����]�>�z��[Aԗ]h����K9���uр���������{�IvkA��K�}c�^�}奅��d�!�ivƙlI-�43��UA>f�����b<���X�upN���;N�t�cY\=6^�p�1�z�-����)A�)��¢���a`ͯ�En��.�CݬT;���YvO�b��#�R�������ٛ��e�"����R�Cd�"!�����әw��SJ����'j'���a���y��N�V��zy(�����̅�5[���kR�SJ����@/5Xм�Ź�\A���	IY7��J��+�Џ,}od���tz2I�x���2w�q�TC�{5�hL��L�����KT��\AÑ��9�Y2ɿhN��^������{��0���z�8��%�y�ܱA}(e�^�&��Y�Dq���usL�̝��8A4�j{�KR���O^A�{!͗�6�Mg�Pi��KZ�x��}0��xƓI�}�͐@6��߸-n�{gO)��v{�b�<l�b=�L��EU��*�q�}Nf��`�˾}0��xrlx�T������ӒJoI֦�u�$�Z>�����'�d��S��"�*�ǰ�i�+;��5�㭞p0��Ak��Ą��`��i��o�n����iJ�S�	u��=�֛v	�ɩ3b�Q-�X��͉��/x��ȓ���� �ÿ�'̙*r�5�u����|� S ְ�sO�R��R���4?�+�լ�>x���s��x����`�u�&�r:	)�Q��5׮~���*&oN��ի÷#QPU�D5�̃��U*�׌�"����'/�Uc��]�ԩ�S��-�R��h��]u�}s��w�C=��5ͫ��l�K�<��4jvGxEX�C�+4Z���8�0܎����C!����!�N
*��|{U���7�7EГ#X�����`�
c%��ttl5ߜr��x����1c�[�譓�ߝ�3E�1�u~@g������Nj�RUgKs;8ƹ�&"{z����|����XNx��eB�ԥyDT�8C?�ҩ����G�=���΅���Xq�/��h�1��W��#KC�7!zg��Ճ�(ډH8��B�������L�5s�?��^���:"�\���c��B�g����Ϛ���]�o*��v��	lyb����_�RF�m��GO�v��o�L��M�	�"��%ȈbuϤ�GʻҢ���͛���n���l��r���s�I�g�Bx�g�_��|M���IkŚ�ښ	a���W�I�E���Up�|Rr��,�������1YA�0���Hk��yQ;ߟp��|��*�N�D�Úǂ�b�)��T"V:$Xx����_ڮ��,R/z����(r����0�����A1���rԍ��x([��<�R�"�xQ�o�����"#�z�½q��%�Hȳ��Cu��1c������@|a�Q�y]���9Fq���p�%Ϙ3�;�ۿ�Y��S�gC�'O��i���!�7 J�n~&O�*MD������㵜
��@[��Bs�VN�()�vS:Џi�n���h/�LrrWl�[��Z��ash��q��}w��wƗz�}�Y�p�n��3�=A4���#���0^�%����x� �\t$-�tEy��hyM����`�u��Tի�V~�ݳ�&�E�"��mHz9v���2��2v�eoL�{�ے螁��h�1����>f����!
Ms��t�[�����Ӝuej��9=�;㵜h����`�-�� ��C��Sb�<���n�fjWW=��G���Wm�)��!$��d{��!����[����s.'�;��k����X-u�ݑM�q����R�Q�#uF2\�yҳ�CG�B�|��||U~����xO�'�cХ��S�1i�R�‐7�h����������I�H�9P������b�w�t�|˸���;�+�y�? ���/Jp�9�I �����+�ۭ=\a���\�[�KYiǬ����#�7k!����Z�7[����,'U��٦�{��̽!����*^)�C%i��i��=_8�	�D���$� k������F��n��d�<�}BJ�Nr�h�U^���Ȟk�گL���tX���@|a|� �!�ZXR��E��N��wV�<uע���' ��'s�{�P)E0gB��MG���U[nt J���J��=��p�n���'�8�9t�&�*���]���|Bb��+�QS��Ʒ�!ʙSU���$O X����+�cÓ�RX�����kPs�y�)���G<)�<��{P%��NasR�vqK������83�55��t呌k�
{=����d?�`�B��{o�����ߛ�.��X������*�@�t������iJ������y�Eo�w�
<�u侀��������'�M�.?���� A%H�%��iS��~� �S4��I@O�heI�B�q5�gj��=�W�x��v".���%�I��4�ke�х��� f	n:u��g�{�Ͽ7��I_�A�L��6;.�@��v�m�Q�IA��)$MJXOdLq;*P/b�jD���i;Zd,�����a>F�,��H��܇�    4e���8��!��c�7�3|o��i+q$�)E� ΂���R�ę�%�8|sʛ���䣶[]67A�]b�@v��ݢ5��	���"����\��
'�{d[�R�3F#^�G^A�2<�l�ޏg�'�#n�-G��N�2��>�{����-��g��S���p�p$H��ffL�d�@Ne6��'[��Ɂ�>�f��p���eQ+Z	!�OK_�V�%z���#zs�%��,jN��C�QR�3�B�d����H�Q��-*�)��1���A��7��"x�]��J����K���U����Wk&+誖�8-I����n��7�ҨW���q@�[�vG�2��g�0bcW�y�"T�݄����'��k�^H�E&��u�ɣ�\ �����'W_����'�(�q� 0c(�a��N@��R�}�4�/N�W�'4OU5�V �W{XA�1���f�ˢG`m
�"/=���� �	I8�Jp���b���������x�'2I�V�U��T��9ne���<K���C:o�#�B�p���Jp�Ѯ��Ǡk�k��c���-�OƗr��̞�0�@�c���hO��g�BD�	�|U����q��Ω�y��iԷ�n��æ�i֢�����#j�juY����^B:����}�����1���O�A�����9(!���^( �ne}<�{�����RN�3KhJ�)��/�vŔۦ�s8��4�g�9��{ItP`_l�`�9>��kj�]�)M�	��4��r0� 1�3�^��[$'�����+B�n�1��_��N��A�hH'T7�x�wV�IS���2�l|�|��Z�Z��$ъۑ敠m�|b(m��ȇ�8w\{����'kO�T��^����0��{�-g]�B���a�d8�B���!z����XjbrOe�	2t�;kU�/��Kv������Q{���>���<D�iˆ��H��������B:�95���K^���n���O�_^�Nȍ�Y*+���M��k^vtX��~,���z=�����7z�o�R]PbL�B+�<"��<<C��O��Pw��?��v$8�N���Fԯ��4���	�啌����U?�h����B��G�T٫���,�b<���O����7j5�Ao��(h�6�_q;�v�1���?��]�gq`�&�<n3n�fkATT�����&'s��(b;�Q=�^��c!�4�pX����O�D�ˎZ�`���|�)8̽T6��{az �~o��_o'/�6P���MaG[)c��c<!��uǟ_�=a��ϑ�%���0��=ѓ!����l����M^�F���ھ�[����z��{>��R?�#���	�X��>�$�(����h.����[���]�o���b")X���g�߭��һm��ޢu��KM�IW-2������m �3��*B�d<n?o���F'.�kY+�+���m��w�T��#f��	#��_�Uc�ɶE6hVJc�wI��Uemν�Z��V=��`4S+�ɲk�u��.�	��Ÿq�=�����)5��#ى���J!��7�X�\ ��qQ�Z�����1N	]?�r�%E��p�/��K4�v/u'�=�^T�|�S ?��(W�����J=쀠k�ж��;�F��|,}z���{Ҡ��N�&^Q�x����Y*�:(����5rr=P�T��{I���M������i���c;���Z�)�'���k����`��Y��es_�jx5{��s�BtR=X��ah��Ie7eN�Ƕ���gk��x8�Ͻ1ɲ8�=��b���¯n{�O�B�I��b!*��cp9ŭ�u�5$���m{ޛ���VN^H���x��v��j���!�9W]�m��`��,G��F��g�fQ/ǒ����dPy��U��SM�&~��b$>��?\�ږf��S����s��!��=����
2yY2-i/�Լ2_ب�i��>2���_K.��^Ћರ����P�X��/��ϋ8����6��t5�{�m'$"u�,{�1�[��2K�1��a��c�ϐ��OY_�(���^��M�gӐJ��t�限g_����4
����4����BN6�%�2����Ӥ9ܕ���x���/?�
���A~�+? SiyHϬ^n�}�����i̮�I��	��R�An����S�P��5��ݾ4 OJ��[+� Z���<��'������g��S�Ҧ;%�Q��@�0�2� ��?n��h̩EX3}nv J\1dzʘ��g,8KbN	(��p�΅+-���_$�_�4��V��Wl1k�k���ݸ�:��}��e7�5^(�G��Z�r�E��{/�ؒ�d�Bs�=���'�`~����l�b}z0c#Gr($�vZ�ll�$v���z�"��*)�K\9N�������hP��a��Wt,�$o��䅩�A^_%��[��ռJܞO��o�_���L��p�R���\��c���!Q�y��|�ּr�`�e�W�'#�uc�!��}'����DيyQ�o>��������!�HA���p�d^c%��
Ш~��Q"� �I���h+x������*=�#�F>�͸���d<�Iq,����eU���t��͋` Y��fj���1������̃w�,'�(n^:V2�t+����]��ƭD_�/� A�`��L���n{�ڎ�w�~v�T����oX��8dIU��7@X ��ڞw���h���lGj�i\���&#���֞u2ݿ1�2_�u  ��r��K�䖶�.,��Pk���2 a_�sU����o�W91>��
E��R�U!zvB���js�}_��;��6"������q�Wc���6ub�(���l�ҋc����+�ԇuIG(�!����U����C�^�)N��}l�'���F��(czZ-(B�I�^���)���X{Bi���8H��a[w�Xd���%닲7]NI�F页P:�\������3�����d�������V����Ņ8뉲P�;Rf6�>˕�F�����Nu����NI)RN�\pSV�.�����w���\[#��6�7��)����`�8��D�5t�1�ju/5��қ!�??	�\8O�-ª (�O�� ��"���:����,�w������z}�:��1��̸�:r�ś�{z�� �ȃS�'ʄM�q]�c竝�ɤ%���u���ΗSDߨ>  �z���<͙���y�p>�����_�W�"���(RJG�T*2{DҠ�c���vжNu��^����)�'���d|X�(��mlhc�$e���O��	�k>y�뮭&��=P���4ڥ��xo!��;�1Lm���[u��Z�닀��y��j/�V�����	{di}�M��kS��I�b�H1��쑗��jNN	u�N�)�Qf]_��3��-s�^KL���?/�U<ϴ�#��d{'2�X�M}'��<�n�%�LH��N�L�4Wn�2�O����,%�p���m]?o��=�U��r-��uN���W��f�y�=}�J��DOr�v���j�
�l��U�y�v��:z��D<����D���|�Vt���Pa�yg�T7"v���_i�j��'���.���t
)�9��Ǔ���ܭ�X�}�89���E��n�_z����b����l5�����mc�{�>vFupw���>���)����<��
�OOZ���8���ޞ?�2����������ԋ�����v�N���s�#�O'n�����p��+�^r���Bl�]�� .��r[����<J.�O��Z[#"��u�79���#�PY�?��n<�މ|N��w��MIX{C�+�{�������K�JaOj:�L9������v�i�򳛳�h|">��2�X�ckfؾW`�U����
>�gN����7�B��!��B�����Ҕ�����fK���|�RZ�:
�ho�Hw��WJ�t)u�Bu�Fd}8��ɩO��L8�N��Qܹ���u����,�oƧ�^5 �=��>B^k�    E�zPi�H6��B��,�o�S�N^��wl%��[?��rP+�"�ω"o���/�$�u_�擹F+�Q���BQ�%~k�P�9D�lt��:	�9=�Ď���S�k"�2��a�Vk���xutE�22a<6 P���nuy�!en�{��G������H�t�v�K (�D��6�1���!>2����U���.���%eֲ=�:��]ES��o�LrDsCkZ�	�:%���y�hD1'����0>�a>�J���+D�u���e��ʟ����n�vR|���a�r�r.տ8��c�f�֑?��/v~0�kգ�I�j~��\M�Q.��fY�B��W��t�E����L�Z�N:��ls�WBA�=O;4��U6�=�}���)�!�zp���3�Z�a6lv��F�؇_�eN���>�0���{Oe���j�"D���P�p͈=�%D�S��m)?�������.Ԕv��x��M��(������o�?0�& ]���bG1�9__li��.��%r�1�wOߍ7g�;i��^�ҥ��K��NT��$/A�Tn��٥3� ��̗]���9��f��j��5R�7��h���a2�A*��z��佄]y��'_>-�n���ٌb}��ZZ!�T�ݹ�k LB��SN=Ƶ��/�?�|��m��#�Rl�y����9셲�ji�Q&���;��4>r*G�p"qG�lͥ����Z�fٙ��9��Kvp�$r�S�C���B$�\X
%u��f�[/%��*'(:��ޑ��bTI�!�gㆈ�}�(����M�6ӂR,�ߜ�!��կ�n�x����{��ԕ��o��1��v�P[+a�Y"��n���xl�㗔��$��H����X�?�J�.�����A>y3L8�k��P�D�_���<�f���E?_O���Y��A��+/TC��bs�XR�Ir�k���RK>�G+�U��ěb����^���!�����(
�=^��5�~W�r��0T��jC���I�SB�ډ�Xm\(���o�k�"Р�=�Vj�w��`|ָ֓:����[w�����k�VD��z����V��UA��d ?w���V�K��>�r�{�	�n��~�/�7�%����ʀ �e�TP$�5l�m�������n����g攇U�_׊��@="j��K,��+�_}����N��,�h���U�X~9�Q��<�vf������fTcG�@���k5`�&�!Q̮��>o���gE�o|����K({ZbD�m�(dd&������w�s>��u��mE�>)a�@��M.�R�=��e>��+'�5$��qf\`h ��7�	�`|=�g˩�Q��5	:E��y�ZBH|����ĭ���?0)n�^;��]%�֦a�~d�h�K���v�;�]A��A�Q�F����Tu:_�Wxs��K�@㉦��cZr`[�uV��ŔfZ������ۦ~�ݻ{O������_{qB��Q�	
������:�E���J9�J6F�B�[sQ� �Y����^�⻜��%S�r�2_�����P�_�@�ڬ%͟���m��'��Z l�����_���Đy��E�gv���%s:���\�f�ࠠLz���Xc�M�g��m�k�)��R0/u��Y� h��TZ����W�R�����'����xB�i��DQax�e�����[%.��/�^�T�����MBY�N����@^��8�d0�7��fKK^�h�7� I��ٹ�����#,^��J�N��s���y\ �?�1����
P�w��S1����Z���ʫ���I|�Ch���
qlq`IFEd�#9��7�8��'3�c�2o�8ZBd���I�'ޤ���(\�FOf�D��j�f������sE�y��fH�SG�j=!T�*	?g�#%�ϭz�����4zQ��ߝ�>�"'�4׾҂�&
����m�ս,���3��^C� ��,JD	��;��m��ej{JۜN��ʛA|� E ��9|YH('�{���r�������KT�YO���@���2�c���Y�Zye��N��5�`Ѳ* =��7V�F��P81�����3���8(����#eɂ�`.*��i�Du�>����e~i�\j�u(F�Q�[ue���j)6;ʨ0U��e����=9����&%��um �6�.ë��s-�+���l�l�|p[_es#n	_<��L�B~5��"=�~���Mx��4u;О�{�-��m���O�����'鄩�4�}�&0��&�� ڹ�=��ysn����e0p46��8m�o�:m�c�3���3�E'l�1��PK|�@;��-�
|���s�M��[�_Ə�����T���t�F�ޏ�2�WI2���~���w�9q=�؝�*�֜��V��G7�����}[���|�QJ�"��)���P�hjs��	��ta���V�'���c��'����Ћ��lj�����~�ә��:W��@q^���٘$���D����ܱ���L!�k����9���R4�ݞ9��������p�>Q���G�!�?�!6gsS�lsU���U+��o�ޤlJ'�1�����QԆ�Y1))���eI-�)�K��Nz��b+(�Q��f��ta��+�fj?i��S\��T��; �@�3��2��?���ו7�h͗��u:�r��lG�'+i�响�;��z� @�Aq�5��?�S"�gٕ����*|�d�l�Sw����FM('�@ڋ�Չ�YLy�����Q�*RgA%�:�5��}�2HQ\� ��o��a�I9017����~O�k@�})v���Ow�`<�I$\eN�B,���X�<JY�/U�e[Z�*�����O&ݪ�N�:N��>�K��W��,i�����x]�#�zc��a����C�TC%�:��\i�g�ܾ�t H;x�2�i���d�{�"���i�ڧ���"�\X�U=	β��w=��Y�>�҂7�� ���g~�Ϥ'4HeS�%�Լ�� `�
,��<�s�ƍz��������7��5��v~���{��i���� ^*�;�>J�"{a�Q�� 3rM�]�-1�ACUu�����^�VO�ǘsl�a^u���0��3�Ȗ~��~۫��'	>!�rp�^�_1Mg[���/�^:�U�L{{ݫ��'���#f���t�����H���R�?��{K��2E\E���M������`�"j��#r��̭���N)IN=��ݵ1��m���P:��P5���7�n�=b5.'�Hq��_:�	ل�k�۫/����e��ޝ������i�)qs��P���@U5�T�������m�u�J'�]A��u���ik4�p6oPI_<2�h��r"�ɱT���!�誢u4I@HP뤋��<�w���>'T�N^�8����[36����?�,:f�/ۧ��)�0�emK��p�H�!��ښv�	�U���,~�;
"��I'�n2�}��K�(�l�KN�d�6���ϻS�_9��G,��*�T���/��Z�)F�@*�&/:"!.[A�&��ζw$ʸ8��O~@�.g(�S����_��sB.��q8>�(�t���
/ol��)&��1��Z�~�9a���X�QQ�<𣠈�����w�+W�N�Y�g��Z`�f��G,�NF�������uxo'�"�������/��{oM��a��x 3����=�璽�ix}UE��/Q��n�� �]Z��b�t��$��I�F�H��V|UD��Sp>�"� �ؒЦ�s"��"6 V�X��#!��?����/�/_sC���7����h'�e�3.�-l��r�V�$�p~���ǋl�)ד�?R��ZN����ۢ�SPFI/
 wJzP*�6Cn ��"
�	�x�%�A ����ݱ���-���������$uhe%o_Z�c��'�ꍱH��@�lt�	�>@�|"L*�SL;ɋ>a]NI����*'W�{�H��>�,�`��0roĪ;�m    �ׂ����O��/���o3��wΎ�p����d�~��s_�T�����v���Q�A�m����s�=4�~�fH����J'�Ӫ7���󋋡�XP�U�ⳗķ���orh\�9�j����#���2����aPN�b�7��`{֓y�ƻFTV(�y�#/o��:w���6��_!\�O�����,��'`v�b<�P��T4�Xn�|��x;y���`��,Y��t��
X�"�$+�e��ە#���cO�h���ܘz��m�[ۣ�z��$yS�Kd'sx�"�$�������lC��g�nwz����t�ѥf��H���	ZNL���lK�n�^j3$o.ю�B��),�(�\��)��f��D�|竉w�]e�:!����(�9(6��JB���ٺrEe���Q�����5��}4��UP�M@���+m�6�X������o����=ƿ���\��_Ow����夭҈�$T�[�p�P
��Bx�d��b!~qL������S��l�������ӆ:�~�-���5�R� ��c��z��%>������6��K�,o��#)Uz����ʖ@xH�*�Md����������_�����������������ī�*?�I9�ވt�9�"R*
/TZ��e�6�qL�W7Z�[�����3Z�:�wiх�hl��;T'��$.6���zr�5��/��j&$���Q�.��j���f��?�e�����o��ߺqD�|�H�2�n3d����ch�iXVkY�������7Ο薿{�gR��D�8�:(�0� }�Z�ڝ�t�U��Ɠ'՞GTr��F4_�vI읰+ӧG����5ի{|>���y�D�`T�>�(^�3`�7�Q*i�Lc����|�wn�on�tҝ�WS��8j��R�����g�1��!��QX.�y�*����ބc�%�/��>����5�wa�^�i��;��.N皈triλ��/,'�WQ��_��1=˰v��B/��T�S����t�hbkr�֞���3��>�W����1Dň# ��=zơK��kҁc�@�/v�}p��ށ'�dW�b��$��g4dC�O�5~>{�M��H�ij>�cJ`q����{>(NƉS+���|8�~��7T�� Nkvr�)����U�g��]�1�ӻ�τ�� 9��Qϻ��F�.�J��fk��s�¢�=�4t��e�\��+�����p���i��Q9J�C�ɋA�t)ۃ
���ʕ-V ��>7!�/[�έ���P�r�IWkw�Lz�+���z�@D_�sӁ$�ò����E�ļ���J�$��ťRC\(�P�/�RPƢ��(���q���A;�4��`�t1y�*�Zb��)�Ęѧ����>��T�q�-��z�H3�Ћ΀#�_IRy�g�6`9��zM���1��l�n�rt�ޡ�Fy���b����#+��e8b��\�o�<�3��(#]�K�?-�{�8�2���QM$瘨�&���+-���!�#�ԋ�Q����TΖP9��ں�o�#��!���,O����)�����jX6
ǆ��J��[�}�?��=A�>֒��ܫ5�k�t�)V����b�\�w,z�r�H�LN���,�"�����R�Hu�����%@���7�a��[��u�X�q{�Hp�Z����J��M��|�L?y�(%��P�%9Yr�IDę\7QV��<���w�˛�#c�T����]͹��@5d�t��f��Z��H����d�cJ��YB9��qS%T�@�bϋ�����=�V�"|=y��2�e�� W� aU�g��>�3x�7��pʕ�R [a;��zئ~��F��s���N�!J� ^�#ݒZ��q�}��9Ɛ�\I5h'���D�`�:���'����� tB����Y|+�H��J57��)��/J��Ox2��=S�aT�j.-^t�2*7Αg��/|�@��v�9�R�0>��b
�r�ȭ����/��~�aIO�t;�2j٨z��yH�#���%�m<�t���L\� l���%t�ȋ=�D��9�j�����D��La>@�������4F�6I���PZ1�O�����P-F�?L��~���T��P�_ud�y 23pDa~�N�����A�`@��Xy�#�v�^��ȡm"k��_'K�%�P���aM^ ǋ5  �,9zb`�N+�<<+yw��<2N��u:��X	YF 撧ں�\.�����d�&��j�$q�����Ö�8��λ��G�'�����#;�"_��_zɋ���ګ>zK�Q�sO�J�!f��A�� �4����E��l����������؟V�!v�
�~��S�x��ү�j~wLʙ2��4s���]z���%6?'�:2����H��'�P����:d��m�����J]�ħ��a}����9a�*�)�+�����bs׼l�̕�]�a�Ȣ|ҡ�m�܆����1���l�{k���E�<PN^Ttdނ�9X��̳%�-�"S�=/���>(��V��w+ing��.���C�8��{�S�[�o �;��9� �M�W��v!Dl���ؒ���� �,h��5�P!����l�|�J�c�5k�"��?x��r�|ԫ�@QwH�]�/�PX�{S�]�o2��b��2�	T�N�2�%g��:OA*+�#+��Tr'^�ޕ��vĬ��_��:�sD�]�_W2��P+����q���ꑰ]�� ��PL�"y�PQ@��\$zu��"��wT��, Ҹ�Z5����mZ(�G��^��������aO,�ds����bU�_L��{�6�Ε��L�2ϋ�*D�l'�33�6?
gU���>��)3kkH��\=�eθr�U�~���e���а	[�%m���n������hH{��P��o�4�5�K����E�����z�/	P�XVh�>���9ӊ��خt�٤��r^�*Xh9C�D��c��UN\�ߢ=�����B�"��G,�ߜ�&�c�����\�^���v�
��P�8��<�����!Ҩ�����E�*�}{t3�s�n���;�_2m���7�Ryz���K҃�ϲ�HՃ��>�Gù-h*c��8֫�\��yrV�,���})��=䋲-����b�l��׉�Z/e	T���1�a�Ϣ���_���팩�eqy���<#�����Y��U"p0>{�����G��t����D_�CJN'���J+`P��"���"D"/��̻ߑ�`{�G�Q�KϨ�4��+8�ca�Α�Ȟ�9����$���DGLǫ�=E[�^�f�>�uGVǬў�����h�_�z���Dض�=��Ĳ��4�~��/�Ȕ�[9���:��	K�|��PQ��Y�_.�O�	�t���^��\,o�<�$�;�|�l��4��}~�w��T�%Z�t�gb�ל\�R�k��ES���j�,��^���G�xBK�;�җ7{�35At��1g��5��K��Ň띟p	�X��`e"+�X����<K�՟���}���?��K���:Ȓ�R���g�j�����+#��&;� M���'��}zC���Z�3f@�`,I.�����'�1!�ذ�!aу_��{�>i�'ӹw�'�`>�?�m�Tj���U]�њ�S�:�\�^�����=��儨���!���Y|�81�rMf[�Y���Q?�^�F�)n�澝�k���C�&ԓ3w㏘ŌOƑ��a0P��Ӓ�b��7��ڵ��,B����O�Jjα���{�<�2PM�r�k��͟�6�n��%}r�[���%�YM��{G!���D]4�����]7[���#��<���J�UB�������fy�z�C�E���A����nR�b�C��~]b#�b�a�3������{ 瓙�
�/]r�d��� X-�ސJ궟/���ȕ��čG/�D�����.��pZC�W�\pD!ʷo-�h~�'Ipx�ؐ}X?O��r(kr�%�R��π����=JNV����N3��{;y���;�奴_��2    ����sP��{�H5��$НG����~V�B��en
�O@U;��PXm�8ȵ�?����{�����Z�����G���E���tY�I�,��JhA�g���@�m�sZ�W��k��{����9�@��<)�ULt�Wʮ���g��J_~�T/e�H�n\kD�( T����3��������
�<����ιGN�{�&)�ɥ&�*Ѷ��-K/0ğ.�dq��T����Z`��tq	}��-}#�6F,����OnbN�_jCmކW��ٜ�c�#���(��<��/�@�'���/��C{�ނI��YP�+E�O0�'��V^P>y�˱��W��t��	-�C@�]���wL	��x@t��rRc嵜���X�p>,Y��T���jr����ⰳeG����8����Gܙg��ײ��P�G���v�M*��)����J0�_�߀V��"��W��@��(�YD�D�n�^wJ%\��#_Tk3�6r�������� H�[�o)?Lr=����.)��<�y��
U�A�Ҧؑ5��һ�P�T��R78!��j�N�@�t��y��5�*�9o�^lz�Mq�JK��ב#��F�.M��=�ݼ���#ʓ1����&qQ�T�g��q��ת=~:�}G��/�e}Ts��4�Oa֪~� �ԋ�3,��X��"���'��S{n�CT�zD�����\Fc�*�����΀wb8�G�Aqvʔ������J�f���u��l
���"vpa�H9�&;��,�ߠ-L-��m痹}.o)��'���Q3��7%�d��v�R�y�P��g/����;�ƶ�(� W��e[]4`��Z�<`Ƚ*~}��CQ������x���7t�ZL�90%�p�u��^@�wИ#TF�$��ో
�ż�T�+� 4��C����ڤ��K��N=E�Z2���+G���[�lW:��ƈR$�w#/�9Xɂb���� ����/�����I��A,lVS��Q � !��FT4�p]y�_al��N�}T��	_,V����۴fͥ���@󗝁��A)>J.gՠ�хk�����VB����� OӜ��v��㴩��P�%c�9l{MR��m��sZ�;����\���E�	��������3=�؞,�>�@px���H�dpM6� �[r���b�|�(J��s�/�"��̒O��:v�L8�R��M'y2��iu�K\�5���@�G��knm#��q�>����1�l�y��v�n|q6S��wt|w�f 0v�E��q�Rk����^����g�a)�D\�'R�j�K�8@\��C��]Wj�kl�D�Xc�Ƨ*s���H~�����{W��öH��� �&���T�̨��$W �%DM�O�Sֻӟ$':�^4?���$5���D������];�ΦC�VIwA���L�d���Y�C�~&�DhH~�أ��+�����J~K.7��X���ۈ��P¢��V�7XgȪ�K�H>�ѿ��,�t�r�&>�)��J3�X9Da����o��u��c��D��m��JFp��Ĥn��Z����w�5�A�g�ə¶۷d��z�*yj������G>s�#5=	�F�6�g�۵�w��s2x�I�<P�$ J�TW��WӐ��jYZa��i�I�۲�&'8�K"g����{/s��)��N��JD��9s~6�U�}��Qb�;xM��o�0����M��X]Cdr�����}�/�J�h��2o�!�9{G��irE��\�Y��x@�d�N�C9�o�'�:V65C�����@�&>����:�=�"9 �������v$�J@�ϲ���v�,�r��A�!��L)�yi��h(�|��E&KNG�4Q��8H�j1�IIZ��*�7k�2��� s'ݥ�x�VC��C*	�֐'Q#�F�{���V��۩.�������f�@��`�%X��g��$�������v ��u[qj�!�r,��om�0)��L��΃��t/.X�'/'ѢbZ����6j�6��D�������複H4w���(�>��}pE�I�Nk��o��M�	ϲT98�{~Jq�G���}o����P+�đ>x ���.�qhz���P]$��RXZ)�u���	���>��*�p����������n��
b��=�P�{�}0]OH�m�惗E�_ �Ї�0RҶf:��_�����=�(���w�4�`��p�V�vo+�����
"< �ʾ5��/����,��i�V�֟����#�-�7J����0y(���tIa��P�8�S���nԿ�������`{��<�xaF���,	%��d�ِ�^���r5�����VǞ�>E��p�#~l���j�W|���6�|�Ws���G����0��Ee޿���xIJJ'}���>G���!m� ��*�9ec���`���hq������|r�P�\;\�3o��|�| ��O��� �UZq��f.�y�0D�L���Wx��zr�9,��P߮��9��Ģ&Q??G�eg �y ԇ�|$��KC��տW6s�s���m��L^w:���^)��WB��
~�� nn�������_���vʏH�ju�'�u�	۽����9�@�FWG�
��<�z�$�Me��@͟���s�]<moK�����΀����L�,'Տx���BK�7�L�8��m�i���^�$�޼}|ұ�ZG�?5�E���^�g��ț��:ˉ�QYk<���?�vΕ���Cj�������4�^�%���}��� ��cw�@G?7�F?Dv���9����Q��<�VxB�^��P��(-ۤ4�������}��k_����T�F�G�^��2?s�j����37����;j��#{]��8]��c7(,ќ�)����ew�z�ɣ��=����ڪ�z����ĵ������[9A�	M�(�����
Q9�`����q�r�C��_�E=����O��q�{�b�������3��rY]��.�����O� గK�E@%T��`R?*���6�7�;��	��Fi8#�@\�}�@��pbE�{+�}�]� � ���е�Eg	5��B�y�h|��|�G�,5�z¯1�	�X�����zL1,�D�@I;����G��D�5}���ڑ�{c\E�Q��½�����H�Y��)�h�	�.v��SC���pfC�5����x�Ɠ7��d�E�r�w
���^��zim���d_u�%{��7��E�]�]qIܶ�u��&�|��u�����Nx%��]na6�������6��׸!�ߦD#���	ϔ�L�3�Nu� ��	��L�}�����1�IkxK�\	}��7��S�dRv����K��#���I�'U���'Sj�J)춀���!�~!�`��	�����I���7�%q���*[[�7�9�� �����{R��9[l��8]���j3�8�%�j�vE��|;A���?`��Z`~t�Y��E(�@�7��1�_S�I�}��i�"n)ԕЏ3��-!����P�+���c)G�w�P?�N�(2�r����"��ۼH��B��}���Q3�?��6{*�S\�7�[W�5���{f�����D���T9y��>0+�^�(`�`���m�6#���|����������C�ί�?�ZUW�)���#�����N�ì��O�?���L�K�b�=��P�����b��Ki��c�=8�}���̮qR �@���'��C�����8��_��1T�Vg��ǫ\��Fh~���	�2Ӓ:J~_7� }�Yb\��ޟ���
|�@��E��fH��0ώ�v5��;�K�=eR�F���e9"�룈�F���rV Bb�m
̄�=#���r���m���۰_W_0}N�q��	��2_��f����	�fB�[C�	 	%��-�08�V"^�N�����s�s�]c�M��`�r(Nф���52�7z�G�EO.CM�ˠtv/>��\�$�V��W Y���ZO�@W"N���ψOͳ����L4�=�eǠ8E g�F�.E�    e�"§���Щ��G%�C��w�0��^k����4�����3M6 ����� _y�7����Q$T�4��N��B�8K2�d�d�Q�����p���.�e����`�% �%sN�����?� ��	uh����� �i��Z��o��W���?x�hvj���M L|)4*��W}�2�\��ho��ojoB>6XNƆr�h � �/��挵����,���N�rp28�骽i\lX��P��H�s�{3Xq�j��"9�N��6��ټ-&����F)g�3qy�i��#�,�.��}h������@H����e�r����_� ����0�}�ð��0�;p��wÒ=�r�+���� 1'M����m�0Z��Zk���Z�xr��q�7���ך��A}�x�Y1���@�����Id�Kil�k��Kq��6r���̿[��6[�t��+��Aa�~�GCl�V�TM���w��mG�~`{�Zɕ�<B�����D��Gs���/��s�'�@�Ij��e~�/��6��n2�==0y��D��+6me�W?}��$!�gl���E`���eJ�g3�V�1��� PO��C��,�/�_����|�7�L٧�ƅC�@�h�Lld��C@���TpE ��޴pn����C(������x{���vM'�� ����eG�^P�V�S���f�W@}Sy��0����������A�%z��i�R�c=;t�b<0��jV`tg����������ޠd�3f~������ԜO&�c�Hm��b����
��k�b<�~'/ؙ�@Y�t��A�]{1#s���9S�2��ɰ/΅���Y���>���e��TD��{��+��������'�a�Rj����[��� ���h�.��n������ spx��~��	H�����J]�����!w�ۮt�<ۯQ�E�D�G��G��b�v��|�H?,�x����k�YCva�$͕��a��Q����w<��<P��N.���z_+ts�29 k�#�D�eG��}�G��NZ�4Z#X���t���h9sJ�!����m���-��"{�e5��`��'l��TW�/�|9�eQ��hf�ȝ�8W��~�%��2��A���u�頏���tCx`��Ɗ
 ����0o�$jy�O1���琔w$������[ź��;�T��vMD/��{��	V�ɮ�.����,Wq5��}xz�a�rfd���Q>S�6vE]����-a�Š\ q�\K�'��4yt�F�$8"R����+�2�	f�q�����"-2?x��zd�X��`q!6$N��e]�}lo��|x�^Ȩ^7E��T��� Y��f�]gд�&i��f_���ߒ�`{=a��c,5�Q%T۾��x\ȣ���B��E)^�
,t�:�6O�m���FNjG��	���JNw_�m�'Q��ޔ��9�,01vO���Rb�������=g�Mo�<���7Lt�?@94�:u���㨡'���Wb?x 徾s�n5�E�GE����7w���y����Ũ|]9��A�'ڐ������'����=:ߛ1���'5��j������Kh��?��Q,��D\1�����_���b��ƀA~KDibk<=){���	�6YV|<&o�o��l��A�/;��1?����4�K&N)���FEg�.�d3ʺ7c��b's�s�N\�U�a�ǁ0� �����Zs/�>j>$����|����:B�����ȵ����NG��ȝ��}2'/$[���Ar@"@��Z��Ϲ�n.��e �'�+���%��}D\�%+��s�Qf���q���O2 "�,�6W�"�ټsتHh��r�'��Y�7H|h�O�?g�]�X4p�9�<C�FȂ[�Ӕ���@�}|\����j������zqp2���� ^U1�#�H��&��(��ށ*;�h�(��i(J�W����;a��;����j�y��evj�-թp�|����e6G�S ;��LkR��vt���PCNYYc+�ӯ����e���z�:B�ru�Xre�ĜBE�K��s�����:�O򃳝����YǑq�4���g�\��<~&��%_��SE�Nf�ʘs�8
EJ�uX��I�VS�w��kS{��I�ĥϵ�R�����(� [h/��#��k��]��$'}�Sbn���tFB�؃�u�����G$Kr�	�L'>����a�t}�C�T��>gϯp���vD�@}k�����5̎��慟�G���w�7*�6�O�kWOetÑ^��Q���C�(+$���~0?'=�rc���I���̀R�<�9&Z�e�jh5���ʂ����jOƈ��ʛ�ʡ_�;g'����~��%��-Zi��0��$�RS	2��%���'^$�*�R|,G���G;̨�t���Sl�����mk��^�3�=S���H\ߏ���Փ�uC�0)}9r�u�B��H�?�i<��K+1Lk>��> 2�9Ƽu��b�w�5?�f9�c�,��S���C�b��3ڿ�*��i�oJ�O&�s�X�9��B��@֤�Th��ݲ��o��Y�?��ORĚQs��q��Ypq��m�����hϦ���z�s-��"n�rSc��Ng�O>�f�"� B���~�o��߹M�9������9�b�06����#�ɒb�d8�C�4��K'���qi��M/� /G����\���������v�'6Gz C���>OAT\+�r��5�7h(*�\��{�J�����cE!J'����.W����ɏ}�����V#=0�q ՙ��5'$R���#W�x@�O7����O�Ο�M/��A��/��e�	4N���W@��(�fע6ri��4�K���W$������ͮ�;�����J㵁������Ӎ/a�'�+;�r��b$-5W�BuZlf퀐'�����+�,��u�岢�*S���l�����o��Sǉ�hT����jW�"� C*��Lwٜ8o�@ڿ82�[��S��3��B'Kəb� ��n������g�����?;���r�4$���7ծ4��f9u�? j]�7jW��}�{�o.ɏT"v��m��L�%е�;�?=�v��P�_n�/-[av��n��� ���aE���B[���Ev��ཷB��U�jK	��%8�0Ȅ�E��V�Q��wo5�a�{�Z�y�.y g���(���y"��H]���=7�]�d\H]f5�?Hx`$��H{��R���]�(�?d�r4H�(U�!�*�E�'���Q���}}�3m�������5J9��Ҝ��fy'�u��>m�zZ��F^�#9R�������)�a�#B���#�9�/�n�ke9Q�F��ŗ����Pl	V�yѢ=�<;O{�Ϻi���*������X�E��e���A�� >p9^�(�z2M��B)�c꽤e4��1-���T�m<��~���EQ�0
��"֡��C�kQMa�W%��Ӥ3r�ԙ_�\&�=��H��Jԁ'���Z:�~~��˂Cy#�xHtM����E��4ku�dL������:�}`������5�{~�P��iQQ��v*rZ{���<���0�Iң���4���2�~��%�FK
�l�
,<�����K��w��(�Z�'��S6�X_&;��k#� ��'ٱZ�"�$�˱B �8p۵��K����J>a�ù/����f�-��Y3���H3����5�3o�?�A~K��ѭ'�#���pNz���M =����m��CR�?��n���h�G��$�ӑ�Z�*�a'��2�kc$s�R��c9,����f0�M�\��RNS#��E��oU��I\���i�X�KTdq>�H��� zy�_qt��1���X�'=s�:���X�v $��(,�%F�5s?�5�2�x�q~X&>3�ѹn1����˯��ga��4{�7S�G�O��:'En�g��M��BL������ĭwL�v�y����m    [�����������m�T(������wh<y~I+���u�+�Q;��(*�m�x7�yz*��%��,rEW���Qŵ��>�@Y��&��5��@)�'tޕdDsm'��!I�B6��Ɉ�y��箾�P�� ?r�>C�Ը��+4�m�Q�қswe)��R��@�񠢖�;!i���vN��F�Q6��U��m��뷹�k�V�b@I��DgsH;�VK�ߦ�+y�P�~������¥�/-�t�}�#u�ނ?��<��۱j��LN��=i&�db���h����_����9���x�S��I���&������^3�5̜w��4������ �n�y���n��Qc!�qΫŵF�OY�9�呤d>�Z.̂��_��	�0�r��#}�Q˳w�����m�QdG�~X9\WD�[���Oe�keMΉ�5�BaU<>��LЂ��;�P���ו^�~��J���*'�r�J��P6�MV�{Q���6�ȯ������Nx���F��炙"6�\�rNu��x.4����M���t������Yf|���&�b�7'�G����q8�j�3�Ҷ�;l-!՘bC^%�k�B$�MF�v�#��f,��Gv1`a�t���0K��Wy��6�z�L�{��G���>Z��<\8|���5��/x����5�XK{�$Hu���(y�\R�����W`���!��U���6CD���� &�j�gt�ګܯ��@}�Yp5��y �I��8���RuSzv�������Z�ݥ5<m#`7T��&�������}HK<bIΌ��2 �F���3ز#��ȋyLR/�y@�D%��=��^\�.dq��$~PWb.�W�_���zo�y��q:X�V��{�ے�H��|[�w�$Ync��J��э@���'c����H���L�ߟ�Uʌ��N�ƺb�He��g��&6	,��Z	qr��<|��D',��]��Hhxos�t���q�,�+h߰b�w�F����	��"$��������pq"�P(sNz���>09��[���@�%�#
dD��c)�
�Ы\��,~�O�EIy�!#��Eu�4�5���Z�g�:nc �4;���{_K&k0o^Tl��*u�giZ4ť��vl���G-���5�-��g��O���n�z]EjJGLVr���/(O�&q�u�5a9Ru�������?QK��(|R`.④���Ab\ߚ[���a����1����=�zq� x����v� �^��C���S���z?��8�� �@�X�����i8��JxTUC�?pL޳���,��@j�K����i�:��
�6٣[�YZ��=':x󦀍U���e�\�܁��vqHu0�����A1���ؖRKN^T�ˮ�洸U¼�XFܶ_�k�{��4,S�gB�P�[�\�R9�
�di�|z�|�(@o$^B����-��'^�'�I��\g��kږz�Og���Y U9(���+��� s��Z��tv��|A�w�.���.W�R��br���UY]_u�йa���{|�n�x;�L����5�{�:�{e�'��*c=��,
�5�SJ�'c.ۊ{�,��6��N	������pw�m�NsA�v�2��(������Z��I�o��=���x�cx�a��,��x�ҧS ��Ӣ���R���L���x����: О�' ���=���B���v~]s����	!�c=������=ʌ�7��i�Lǘ5�3��6��$�#�ݝ\��>C*|!�_�K�;!����Yӏm�7�
�]%z����ȺF=�ꏌX�B�J��zU]�_lR���$��+��z�{n�um�8~�̿�N0? R��7k��-�^:W���¯#Kn�h���7��"3���&g3�N�jb��Y J�wawx�0��E���Ɨ-\�r���$�a�g�K%�`��9{?kz�N����.C�y����:4�l���vo���ůG檓^!�iՓI���`�O�]5�)��0���,��+0}�����gob��\H�/*Ec�j������7J�W_]5
��yg�l��:ӧz�A`����G7'���v����\�H�S���9�N��[�#���a�3��D��V<��E�yk
��_�@hq�=km�9<O���!�Q􂑗KO�cޱ���ԃbD�@�}Z�-K�+\�}�@:"_f�ɉ�6��r6��U�h�h�|����()�#Q�t�	�0ڻM.r���m�6�в��anc�'��8Z,��b>ڋl!�[�Brd�U�U���#ؠ"G�A=�\O2&2S�N�CȘv�xuQC�O5N�:_����DN2�$pe��)䝈�p)��,�a�ã/��WO�z%��$c�w�2}�dv��RB�V�+����@�G����V��M+c��y�^*P�h����.x�˒�OD<r�� ���$JQ�J���)�@�Kʯp���z�ӑ�lY�y�>�:΁z��C��	 ���UfOx���,�F��j��l�!z��Z��,8���QOQM��s���CS�$-p�������e�/���_���ü*���y�+ !SMa�AqLdK�l�|�I�8��4�:w��Ň��V�X���q\iNB-J�Dqz��S����0���	��\5��>V��.�f;"[Ǯi�g~� R���N8S6�Ne�:��ӛ�C�����
%��
ց�#��Y���w��Z �z2�I��|h�L�DYΌ"�Bzk�g|���l�(^cJ'#Z���C�ۥ2��}���f��z�����X��I�0Y&s
�zL�q�f&�
�����2�؀�A#G��NgH�Bm'g/(�x�ReI������ rr��R!jn�n�(C���J��퍀��U���M@�!�ʉL���v��)��"K�)���a�����m,���� ��276���y����g�6
~n7�y� G׊ĸ#�.]ܵ�.����m�4����$=�oc�xp�*����i��쬠;(u'u!v�D���/v��"y�Y�x2�L�$�w�u
N��z:h��R$ў⹍J<�F��Z��@J�-[�#�3�M7I��>�0��.�KrG�H�����1��s��.B�	�>��@��s:�[�_,��\"�hn|���b�lD�z{����W�`��^6�%œ��L9'���{mp.�U�F��8����k���R���+�m����!�qҶ�"�
 d/�Gyh�G�S�.]���g��?N�L����ι��,��L���[[y�7���~3��uI�L,4�z�� 6�:kH����JA/)�<�(N4�^�4��mp�]��$��� ��9IN|�|^�헽�j��_���\��/N�X(��Y�ށ|N��!�-�������!:�k4|g�'������q|�;�'��h�Ǫ/�P���AT���ha�����b!6xh�\W�U��Ƚ���P��.�V��d��y�1&!5�Y*�_��M��!}��	�M����(2�N���g��=��
�x{�2�'aO�ȩ��s��3n�yR�/����Q|H29�'��v �Hxb�c� ��sx?(�P<I�nPA�����>��g(#�%T#���'4�[9�A���#���z��e�ǒU������m, Pw�V��6��9Ȉb��#���q��2�A������']eN�6��av��< ��Y��w��ڋ@��,`'b�@�i�WʯY����	^a �\e�twE�k��4.©�`��{�q�P�ךl骗/��mp*�����v;�AR�NT�y�b@B$�
{R,�s/���1
d﯎�����މhk��j`�~~O�$�x}�G��22�g�9�bM|Bq=�r]~U*�b�v���E��#�L�e�K�Ik1���jC���		�'w�qv��։;�_pF�"��C�i��[���a�9f�2�e\Aq�[ID�O��]ˆ�~t�@��*��ȍpJ^~g -�dI�lg����} +ة�j2گ!K~� h(Շ29��ѵQr�_�,���w�    $rC��"���,�k:I�uW�#��ֲ�'Rd�S�ܙ)ݝ��}�za"�r��h�V�m�����l���w���To_��v�'��m���*"�gjc�:p�eW~����5�^��:FLצ��Om��Z�(�4Q�F�?_�f��`ĺ���f%dD��O� @�JQb��5����������6����c�:�DB3!���ϸ}^��.�fI'�,49�_�/�.; 2$r�La��y^|�(�NJ"�iY�	׿�g�~A:] K��Vͻf ��s��b��]�%	�0uŊ�!
�:�W�8ڧU�]�A_���u�1�	a�n�Z.%ĥx�譓M�
{-k��sV�;�_�r��{F��k�&8��j ^q�������H	�	tu�U�EZڂ���#Ae΂�
G�=;p| �?��e��0$?��AHչ��Ps�Tn����x{���RN��k�N������<��ȆK��`3�����֮Gy&͹r�3uB����������������\�8�����N��[��.�wūY+��b��hR7Ó�����~�N�nJ#�#�l��^���x�W��L��
2�lϗ���P��-��,���%7k�;u:�;�j��
��{�϶�`�"'�T��dx:�:�WX1��`����*���/p(�,�Rm }-�LXR�A�8넓NZ�i�;,��P&b1���:�Q	A�fm�	qB������b���9R>i��6�zئ�8Uq���h��M5�t����ά������jۡu��l�$����O"��X?�����I�[ʏx�:����c�|�v-)B��E�r����`�ݮJ`��ْ����d�r�Y���#S�� p4B]��ƪ�;��X@��挔 w��.0�>g_��NyhAdx�]p��h�T$׃J)\̷���'����eI�Z�{�����Y 󉸏�u6/�x�xQ-1Tɳ����K蜽�@.�E�hkyn-N��D{���+����l�_-P�	i���FBT��SO����G>�;�b�usTZp�O�wS�u��:NBƳ�ՓK�`��%$���a���de�>wF���y��w�@D���X�KtԾ� �w��'��j�����"�{o%�>��H}~p�]�`���>#-�3��ºB�_fIV�Z��i����@�`�$�zPD�XA'a�Ǯ��^J��9N����>Z��Ig� �s�fo*�j�>d�ǎ@�������_oy#}���D���^�܁����P���R�S�ڞ�?���N�f�)�Uo*t�m\�Wk[��b��6�/�7�WI|P?�#*q�q+q�S'd��Š��yĚ>����.��'�)���f^=�u|V	�@wz�!�7qb�XN8�Z��i���k�`�%��G�N�^f�j=RB_S� ��W���(!C Uër����6(~2;����Q� y�P,�_�}�ƈ�Df�/@��� *')R�͹�)���X^ӗ�����/���Ҙ9�Q�`Tʫ##p�bk5�F��ÞҘ9��+�f�tx�(w��qp�� \�y���U.z	j6��o}��0~B�@j�'6A��~�C���b��s�xZ��6���!�A	G!��\
Oo3��]�(�JJ�%f��m ����C'�d�SBF8�"�oĖ+I[6���kt[�`�z�T��s��`v.�1�\k�s�3��r�W��.�G��˃�EĈ�����׬-ĝS,������v;)�4��x'2�L�(S�2��y7�c@�*ȋ�\��ߟ������I���h��X�5��w`�`S]6]x\��� �'O*{�e�@�1t�p�Q�d��^2���[2W�|�H�<;}{�ROT��%s������`X
sVJ�K��Sïi0�e��dT�lN��M�U���tGZ�r7@��w�-����a�O��[RF�a�v��vհֈ�W�o�����^M1דˢ�%���3���#h�8c�v5�g{�o���O�[�n.ρ�[�H�b��0&?�����zA	�!�f}>�j[D�d���������@o)�%l}xr=a����ٕ[�
����GL��Z�[��^���M����9^���>x_s
ַG=Ex�e��y�#遨_�4�J]'&���#�z�JN6�������_c��F�>g��F�_�J�������|�+7?;����t4k�e.���G}ξ���#����:������Od�����{��\zv)ve�q���u۟/�K��E�ϟg"^���y	��������=0z��ٰ��+�	�Nߝ5R��\lS1�H��)q��^k��ҿx=�(=�{=5̩r�*._�%Q�dɅ�h����m�k�lo�5�z�Rms*H�}�j��e/N�#N=2��|��9Tw2vNeOh�c��g�D�R�����띊��	�/�NZK�F��,��7��_��t�M�>�$�]�貁����D���"�Q�4ș`��ȕt���D�edR����G�#��f5uTWs��T+@�xu|���	�»��JYtlL^2�
�鬍��:y��T��~���*��1�*@
	)2N�q��gh!#'׼}�}��mp]�=��r��j�W�QB]�8i�.'��zJun�W��Z �Á�W[�� rudQ��܁6�k^�@��m���^<Qwp�3�ۮh�!�vI8 ����\��{����P�'w�s"I&�.a<�8aA+=�j��M$d7�p�e������d'�C8��[��¶J�E��w��X��(ЊF�Q�K�������ia4�����C��,�����F�����Ky2Q0�+�����n~Bk��x4u1����w]�Ij�n�z2��f,6k�*!#��{��'�<)�h�~+��˙�\4����PrƲs�`\�xp�fs���[!�G�|T:�ҹu$�3G!���N��w�^"}^��#����S�z�	h�U�Jh�.����y�H,E+��"��70�9��(����]��k\ ״�b{>K���:+C���ē�@J�o:{y����k�1��:?��U���ۉ�i�vj�X����l �¦>f]��~�)���8&�^>���Y%DV�Bo��j��o>��t?�},`'�
�D���̵׺z��:7��D�����ޢ��?(��a�l�;���ZG��iͅ�T_�jb��4bU'�G. �l�k&gu�NKv`��K��� ��h��'m�Ȗ��k�˥�n3�Ԁ�vC&��W7�r����
Xc'���o^]��.�RO�|a�s�J��j����H��j^JC5���2�1�D�t��Ģ�#�ս�-Y��Ts�z���ɩi���������ɵ2n�-bվ����G,M�T�������wX�k�]e�2���W	�)��A�q��gHM�w��
��Vo�������������Ӛ����I�WG��pI�q���6��ێ��4`e����՗���S�`�?��(9Ǜ"8)���:��B���m����]%N�l�O���m�r�b�bGzI{���f�E���آv�ݸ�X���e�CJ��"Ò�.5 R⑑�>7gÃ�_L�g����$�3&�#p���t��y:;��P���4$����3��0��.=U�������q���~5�(t��Xiǜ���
\',�G�xB3Qq6D���B���t��R�{T�� \���ସ�h�AJ���x�������Z�2��T���m�9�c����-WOY�[ڟVco��-��%���.`M=N|�d=��D��3���UVo��YA���r�ͳ�#F��Nua����E��\��i�;�ߢ\R��'�sN �ѝ%4y�wG�h-���Źu�gŽ̀pwpu�,�{(</wY_�HC�խ?��`��� O�ʉԎ��/����zT�N�R[S˳���2��4c��-�8+��/���z[U�Ay�z:�$�b,�H�|#i"�xsΔW�G���K���������E���򙇌��K�    �7��rce�&�給�p��Q���#MZ�ҝ.v��Z]j�[~0���N����|g;�#V��.���%�V͵�-����r!���jJO�AG�a�),�|䑜]uO#|�ҭUf~X��\�&�MQi"e(��0@���ATd�>>^��'U��Md� 8�Pwt���%N".e���ǟ��O�ÑN���ޫ[������o	@�����H�8��.��m�g]O��U����7�>�&ZM�w�$�����`�ǽ��5�4���q"����L�G��kE� ���܃�a�!�*ȵd~�>~���j>��
��q�f��?�'��
@�?W�W�(.ݗ��e:�\n^^ф��Vxר��k�p����|���k��ȡN�Ԕw���6��4�SI���!�;��w�/<��i�c�RC����p��v&նr��J����OR�d���f�&������j)i��kN_v��q]$eԤ�8���Dr/A]�Im�9��O<�N�`�Y���	�1M��nذ���%Y��c�=�}�#P�~{��r"�7�u�E�)$��s��*1).�|SO��p���T�Qs���A����x�)��Vٽ<�� ��q<�YM�������a�޺Dx��W���)��=��q�UFY(8��X6ǅN��fC�	Lt�6u*oS��d^����Z	+��K�Um�����d��G��Rx7�=����&�/&�J�wͩ�6�]v.���;8Cug��ǧ�Vٌ=W��Z.p�8��
�ǈԡgz�K�Vf�H�$[��x[e�~e�;8�h�¬3�����/�Ļ�R�3Uߵ�΍Ӑ�_��� ���:/�[��~\;��:��M�I��:<�W� A�1��ц>O�}�#@W�F��9��e}wdDM����%ck!�G���+�=~g:���̮Kg� 4�QR����c�-�6��'p�g~�� %�'	x?yP�#N��l���t�u�e����y����鈅}��C���fG����Ea�<�d</�x�#��TB�.����El`ӯ��;s`��c�ڱ�a��̐%�x���a���y����|�vp�f�}�.�~�;�OL�w�o�>���#gH>-*(�ٸ���,���#�g59�b ���XɊz'J�6`��j��և�2��}�G�7N��;�e�Ms-ɛ�?'�6J�Fn9f�\��N����k�'b,�KD2�p~��z�x�y6j�b��T�р<5��HG� �͟ݯ�&6��b�r���U�3�xR;�9Z���}RGd4���uǹ���|�3d/�0b28a����w��ι���9�D���y��v��ТzR%hx�1�Վ�EN��+�{!����35�G���="L�'x(Ղם���e�-]
�ͧ��p9k*ς�����͋�R�;����1�iPY��՗�:�{[VʙOD���	�f�A�p���c�6Q���W�e�B'�x��#�)NY��33n�h�ʐX�����!9Is�K��ŇO��������� ��,�H�]��?�W4�`��p����.!2!V���1B�a������x���)4 �*v���\5���J2�x�)��Wn��ڝ*�D�n���t�,I�@�ek�"#�����/Cdr���s=�Jߥ�]�U��ɘ+�5X�9(�L��\���3�|BG9t�qC2ɂ��Ж��לm���x#9���%gW"9��sy�]�o���B@�y��{/O�8��v$pO^�
�E�r8����sҖ|T��Oz׍G�l�2�<m(#5�l�S3�����(0U'�d���'2o�2�g��D:r0�<�azc��3?�#�nF9nI��.c>!N��S ���KX
��8��E������΢�Ca���N��]FK��M����6%�q'����w@�8�9�q�'�����4�&g,#���`�e��ڳ���X��澼k�f�et�i�2DN�F��A���_l�r�z$e=ɾ�$]���FZA��w���z9	h߯�w��H��Bq�Q)o�/~A9��N{5-�X�|!�mP��X
�0}/�y��a%����C��m�^ά�"�|�]���N������g
��Q\������r��j�bz��UN��5m2����0fKEC�>�n��{�k}\�I��Z+O��p5�#�^��Q�i�ք�����eBAvqء��T�M|�L��kp@h7�N��B���� �����9*�P��K�t��A��Kr�\�����/->���ʃ*ɉNz��h��O��
��+��s�w�l��.�T���,� ��u#3�	��)춧H�U����ɜn�P֓�Z������(�i����m�?]|�������"��ڜ��;[y�����G�6z��e�t�X���,zԛ��g�k�6�(&�E���*�~g�\NH8��4<�XW���E����\3����k}!�᥁S�!��V���M�X�X��6��  B�|�F�.(����mV��WVo`��K��M��xV�wT���v��T:��,	E��"D�H���nݾ�,�H ع�~�h���̝{)�޹}ޠr7H������xס�-V���C�ה�wt)�V˺���ǵ�х�hݹ���%�F�e�K�=�$��W��b�`XY�I���m�!7\�\��2�eƢewD�gq���`�肾����u�D4`@��b��k���mr�A�k�.�ďRj=u0j}��v�hs��T\zUx�(m�&��6���َ''�x��g���V���&���R0~�ۣ�>r��*�`�ru�`�"�E��A��
R/,��	4�ZK�4o��݉v;�YK��X���5E~yP�('(���ZȞ*J_H��\S���;3 �x����PX �K�.���ͱǚZ�g�k���_lH�XN�t8�pN;����D��;��m���"��u�e*��0d�'�XȺ[��x7�X�����(H��G��;��e�#)��`��',�9�t�EI!�N-K�~�n��[��zT_/U����x6��p}A�Mh%��ƗU|���H�LO
쾋N�6w?�2w$�c�ZҞ�7�ޭ������j�X�xV�㪱��0�碎O�"�,���c} ?���[Aj-Ը�+K`z�0Ӡ'�>�{t/3�r�l��cl^e �4W7�^mD۵�A&�U%��&��@"d� 11���y8��tBn�4Ძ}.'}���wk�r�ϻ�[��d�Jp;!�D���#o��Hz�KHWK*'���5Raă�K����X-|l������ OE2�H,�7e�g�6���.�=�?#��	�n���� ���)�B��r���ԋo.��L��E _�F�х���rʰ������D!�^�	��6�Ⱥ>'�b�� z����f�_�>m�����Ŝ
���w���p|{d.�drs	H"d�����<���ݻ�_���m�\i{	��Y���6^�a��k*�_6���Y����צf\Bщ����]̋MYw��!^�M��9�|�lr�'s������'E,��t��ȑ>ϣ� ?��鈆��ڐ;�ռ�����C�XSd���;��^.�
q�> �Ip�3��$�6$�Z�9�N�7��߯]c��X�f] 	�6��ʟL��ػ0Ko���Ć���×�����,��OBJ�'��Ԋ��Η��3��
Pa��4���S�K'y.|RUv���n>_�ߟ�c��"^&�XU�M-�}��Z�8�j'$��D�����������]���\����&9��%:R �H��t�,�1�(�aNTm����[����r�%�ނ���+�1˻��*.?5}M��w����u	O�����+���>�� 4�`@L�nKA��}lϪ�ā����/��W�# �Űa�J�Bze���!�2�t�.��}�p]|����aM�F�,v��u������g���V�$���Ș&�eX��tz� ��UJ=ɟ����9�Rr�����H����I��{�H�"&X��ڲ�*v���    �Ca���v�P�KGim�(jx��\�:ꃽ��$L�H�@11D�xw>ؤ.q��7�����"!ix�������єg[{�B�Wk �s#{���8���e)n[<�!.R���E��:��n^5��ua��##�~���?̐�3��X�!^LĔ%�i[�{3���)wN���&�mR��ؤ���Cb�s�o�wd$;.�f��^�5Pu��YN80�l��]|�5�&6��F�_}#X�|+TWF�����=���*T�o/��.���>�G�c�;_h+�s=��#��ڦ5�����X�����(BH.�m��ǲ�a�em�j�SO��p�p�8+(�*��,��
���w�֓�)2�9�R��S1
-���T����<��B���'=I-��eְ5���%o���aXo�)�W�
�-��J�x4���C��x�Z��&����hƟ�v�V�d-#���W�8ƴ�ͻ:99N�0 ҽO�5�5���mR]:��9�����s�*>"���c@}P�cL��V���c�rt���_8;WB�k��G_����
�&�H��	go��R����"n���H����Q^ts��L)�Zk<!*�lT��`�۲z�f����L�x��vz֫�(J��.�Ҷ��T�ԙ>�Ԫl+[I��_xjc�z�N�����u�P�y#���^Z`�\j����L42F�6�x�AN%�Fh�`�+#�v@qc�p-[�Ip>�����v����Q%�ɫ�������m���y��HV��]џ�	2׍OR��EŪ�ǯ%�t����9���,yu���>���z���Y���z����ϐg!]��t�}Ɵ����?6����_��o�_�]a����Bu�%�֣��e�O}��Z���`�������`|���� �X�;j�]���	�fs�U�X��7^(��
`�=�c]�<�y�� ������ΝtIK�Ê�\K�C]@'n<��Z��I�Z���V_�<S����j�ºNnx��o�`,�I�ȋ���qǰ������ zR�O�R�W�^�6C[>f��l��o:A^����Gr�	�Tl��-HҊ�W\���%����~��s��o�ꡧ���ko��7H��}j I�߂�Oi��X�Ke%츔��7G'Ջ�8G�3���$����,�I�9�43�RV���'M�Mշ2΂;��
�~�k¢������卲��#���w����K(�w�iH8}$��X����n'�k���wN��9�恉�ЛS�;ͦ�Ε*�v���}B'�4�Ko��!�Ix�8�W� �<��d���W�MD}�*���Y��
W��}���q,3���h���&c��V�D�x��N(]��j1�� �H8�\���UAf�^w+pv����=K2m�̡$ϔ`R|'�Ek-qܹ��Z62��60��l�Xe_@B����&�XZGQyMB�X�UMO��z�[T9�H.��\ws{ud��v��;�tc�������Ԫ{���T��� �#jHQ���e�IR��Mr���'H�8ŭ�#�j�h <Pu"��2�護����M>Q������$�>L7����0Jb�!�SOh�K}��"N�m���g�qm�_����G���	�!_BX�-�G�'��i�[o�ҫ�A��� r|�����H�N�6�$Dg
092��w�����;6ËN��X��ӥ� .I�1&Pb↷�^/o�Hq��:gy%*�wC ���F�'��;(��[�q֮�1��7q��3��M�m&�0� �r��0��R�JC��+���F�\r9I���>ʪ���D��{�$����g����o��-���]��ʵ!$Dr�"_F���bV��MW���'Y�.�懔B'4M�-m�K�2L���Yw�' ����W���z�oY���O�l۹�b�4ü��]4h#m,�G�g)�n�v=��l��jkkGx�Zf��,I�/$�n��4v)S<�(�> ��R�߫;	v��\#aϼ�ֿ7C=�6�J�0�����X��F:�����v�>4�|BǓ�5�U
Т���O�uw��/q��gy]��D'�%#�q���༜��f������ײ%��W*��u`��bI5X�k�X��r�{)r�1^���n��x�'׭3m�.���Oձ�֑��n�H�RQA��C�#a'�Y�WۼJ@(@F�
�r_1,�kl&��Q���z�9K| w��BC��ڰO�����:�x)��="�ݶ�5���s�˙q,O]JZ�5���o��v��O�#�sM����F�X�DT�m�;��y��ճ]���T��1�'�M�r��R��y�ɝ2�okד9 ����lD'`�p�9 �>]2ƍ�x��.;و0����R��)���kT��.qGc�)�l	6)~��m�G�g��"{����ũ��h��Q�k�P��:�.*'�r��[��K�D�2c�#3q�\V��h��DO�*�r�.3L���a[�m�(C��;�F�.L�T��`��T�����.�4�=�ԣy���sNzVO�.�#ƅ\�t,�+��ykk�RGp=��=:���F_��%�[����{���ɣ�F}T���g�o����x04٬����.{)�����v������\���O��\P "�[����hK�Z~`��w4�fŪN����yR�\N�f�Ȝr����Us?H��4`�Y}���� ����(���}L��j� y���Mp���?�&e";�*!������VNۼF)}�W�:ri��4}	��w��f&�!b?��$�I^���o�[�˲��P��-Lચx��U7��r��K�)�6�K��KmZNJ�㲉�)���]ESh�{�6r�M��k�D�p���
�RN�Wlqm�J��əa�S�!٬�{������˿$y���_6�\4��'���9�G��$�4�c���Иڳ��6P:�-�J�T����R�H �RWn�������vNz��?ʒ��qՂ�Wl�⦼w1ӳ-�1��r& �C���=�G���0Ԗ�E���6��\�N��)��B�V��+��sYW�Y����/�ŧ\YRr<iS�ټI�B�N,�u�+K��)�6^�<۠v �>8�7JY��ϿO������0��U�q�<�z_}u��T˙g�� 5lg��8��@ ���V�I>�I�>����Mc����s��:e��(ZE���i���}J���@�X}�6�RX:.�H/�"<��M!,H+^�����Ϝ�����m��t��ʰ@���h�slp��eW���l��b�ˊ{'(�~��MIE������i��`�r�RީG�������B�b�;�qP`��!���B��ե�)7+�	�༢��8s�AV��j>彿�~�����ԧ�~�4�K1-+{�{��z���_�#���r�r"�S�b���)��O	y$�j�R׋�O����|Қ��@R��C�'wБ	��"#j��B�0r�FG'�N��w�i�D�T�ѷ\���	��eƚ>X�� ���
��361ID�h9��+����*>�|�'�G��O�@�ڪ�� ��^Qp" ��ql�.�^���Dtr!Sv�O\srR�<|���������n���%������UW, �l��F���,����=��73(��$L�ɽ��,x#	݅ǹ��k�)����E���A%)�>V)��>х�2W�~D�F�}�d|�J·�{�{��ߵPc��.	�P�Ɛh�� �E�k��]&���D�Ħ�SXs;S\�c��uU��l�x������	0�e�lq��6��9Nmc !��/Z����褏"5���qm4�n�z�1�}����t}���{3؉
�K�+̹������m��KH��}��Z=9���?�4���0�Ȟ���}��Ȕ[n�d��n�;��� ����0,��2i�SX[hp�8��bo���~D�G�z*+����Q�������'�)��{voc��G�'���W�[a�WF�܇$Wɪ�fq����!���-b�5g�H������w�݆B8�]��P8�f��    *ȋ� �K�;Qx	[����!��E�/s�t��b������5Ǝ��.>��z�}���q�8��gG�o���:PO	y5��佻�}G#�{#,�J0�_�2#$���r]S�voN�U����I]�f������o(�g1���%C��+� 5'�S�c\�B�0��DW��@�	��u��<�i�C�` q'`�iʸ[��tNz3�s^ ��%�vh�q,&��=���#:/�{�M���P���Wi{vi8�FΥ9�"�u���?n��z$-�&���;�K�l��G�L�͗�Ǆ\����|R*�i��'#��z=;%�9��SJ/R,�f��P�e��H(�纨��&���QĚ���_b|K��-���t�Rljxh��[=DJ�	�q>��lڝ�Pb,'��%�£���� �/&��P?�Q<x_}��!��}3�X�Dv��R^j#���'��U\S�Mo�v�'���=�Z�e�W�ȑ�29f�ޓ�R� ���K25�8�d�`���4f�8�0��dV�z�ނ�̐ �O�ʜ�{x��!�C�k�b�}z��	�%���ȅ� .�V^"xs�'��B�/�0Dس�MO��`��@Y�d���;�y�%�PؽGmN��_�� _�����D''`���F�_�s���vS��%n�O�l��
|���MF�Ma�ߨ�N^2�a�2�QEx���~/G@oI\/=g��'�9�[�
��u�d���9c�������]�eo<M�i��95�����e������ ��Kx,%�|��YV(�W�U��q�1Z���䦞���єƶ4��@�i�F��}�[��63���n3���l}�w���`<Rx�е��D�ܫ������P�G���,��~�����֎��i�\�|&I\~)��!&�c�����~��*<=���y�7℟tek�eG
��d�1�!a���r��55�~�IvE=Rv�&�����VDPo\�s��\&�V��}��F�,xy'��H����S�nlx�[Þ���Q�^w+��F�0b9e��aC,� � 2��5�4;�ק���z�]�g��c;U<������ �;5�UF��c��ٮc/�-����~�$���)�󆩗]�n:���j8%�j1�Yظ�a���à��
���욵2����`� UԩIŽ!TR�`���'%[�Δ�E���^2Dk�P���]��(��J;A�(>���P���Ӓ��-@���)���S�����"~$�+9��Dd�%�k�Y]�M\�l�U��j/*���M$@Z<�4MI&9�Г��Z����!�X@Q�#���鿏?�i��/l�r�����׿��V2"a��Nr�#���N`�K���/�~f����������Y��/8�ׅ��%���dÉ�9�o Bf� ���\Im��ʯײ):	'�l�A���	^�핱���A5�P4�h���J>�ı�{���H�Mw'�<�h
3!5��4�?utRǙ�	����"85���{U���]>�Կ������翬���c����!�o�5J=i���ԍ���(��J(��;��(���SvÆ�+�l�kd���# S���������_o7�r}�i'-#Fզ'xԊwSO
����m�*�ߺ���_���������j��?�-<��RΨ�f��d٥�����{۬���\��k���eo�H�|��EY(ĝ��讟P)�1w�14�0���_ֿ���sm�{l��Ʌw$��)"T��1!��\�i����U�d�Qm�^�;_ѻ���{7c�F�5�W�]V�,x��慁/lB�(ؠz �,�)N�"�"Rn@4M�,����ƽ#X6�GĺO*b��֘|H}:��jp��6�-���$靷B��Fb�t�Dgܹ����m���'-�uLm���l�-����ٕ��sғ* ���u��T��g�RX�f��c���2=�D�'T�����@*�nr��v�2��c��������0$����D:��%d8��Y�a���y�q#Ɵ�������1�o����!އtu�%>�rر �Ts���7��G[�RI;�W�Guz�X�����n���(+�F����F�������6QW2���I�$�b ���n���sЧ�I�2R��
�X�G�r�(Ǳe�?�S,`��xv*��-mn�,���O���ŵ����M��rqQ����Z����^�|P�
Ӊ�m��e�VodT�����ڻD���o|ƽ��E{��r&%�ga�� �����03�	Y�W> $^+�I�F�g�
4�/���`�
��N��V���� }��В�QsSF �=BM�ErM�]�Ì��ˮ�_�*�n��מ�<��Zu"/X�#�ZbyV��1�9S֫1>&;�@D*�b�;l�����v�+�-|o��e��"��;F�Z��}��/׽3
.�!q���%�: qFE�[����$����٥ ęV(��e��A?���S�f��D`$����'�f%d��]��2.}��^k��9
 `����4�s��s�/��+7o�I��:������F��UO��b�tJ����k'�خ!�kBX������^"��^��#Ӆ�U��'"B��a����8�Q{9��+i��ţ��K�{��u�W�Ŵ�g��i���E��^���#�=�<m��zH�}��7!\��h��,�vs����u��o���_�˭�F�ۓ|�8ײ��H���k�QpY������76�����}L�m�'��)e8������ˆ�y�]�(��M�7;'�kŊcr4�X�X�,��jp��� қu��.�_��*H�O#\� ��Q2"��4��ї���6 �l?�F����FE̀ܥ��[�tt��8�S@�%��i����eK�ˉ���d>cL�>Jo#��#L�����Cm_���[|$�r�}��X�"�xW�j	]` �i�� ?6���_^Ƶ�H��]����!���u#��\�������Kj<J.�N�U�o��
�1eL �$=�����Y�gc
��ى��J8ֆ`Z���	f���N�-��M�/�/��Iz �H'Y����3Xw.�v=b��Ewj?^.��_^��6��	����P͂0ѱ���հR�ʲ	�ꅷ��=����r�������NkG���� �(�b�%\����C��Çt�޻�K���CF�����|�&���']T����l`�--D�f���[��b�e��xw�A�W�*3as0��	[���
��C�7�C�C"U� E]H>29�S;�%��%��:�;g�J��i��WM#��7.;������ ��K�q�ފ����f���>���ٙc�<���h5�� }u���� ŗ���>MU�f��U��v�3��3��s���r�ƕ���,�����W��XӶ�e��=~��qX�d�LX��'���*�ԭD$��ko���0+2rӟ������gJ�5���bm ��m�dt�.m���;�C�ڐ�o`���y�����tR^7�J��e4��7��;�QrB�DCZ7��\�/�&LC� S�i��&\Y��l��%j0��"��#�I+�'�?N�I7䲉УLrP��S�k��� i���B��ԭ����ͻ!_m���D�%[$W�{nAFB��jkpw��=��w�(��"���������>*�_&�Bg^�y����4�M,�@'cZ����w�C�@U��m!��0m��w}��>�FU�)����1t����ᳵ�ԇ���_�l�}%�M��+�b@�k��
�?�����w�5�ܥ���q=�({kF��j.��oKXأ��p�˞2����V��Kœx���5SٕN�ů�D֕2F��9�����z"�VJ�#B�:���%-R/R&*��X�K�V�SNœa�ur�޾�����3UWˠ��|��uG_����� 46� #�����y�\��@i��J���c$?J�t�M�G��S���!�m���/4��A�}�����ޝ�%䋦a��!��&-@�Q_��D�����"z����i̊�:'��8(&�!��    hjf�*���%���4��_C�Nӈ,j�zL��F �7*I}������	bh%ZAr�:�h�I�;2�fҺ3����L�n��aH�OF7w��ړ=��@J��S��Y_O-j�V&0�&�Y��4��E��j��j��Ͽ���szz󓎖,�M2��e9�p�1p�U�@��4�~�5nr~�0U�>dU'�,@@0&<r[M�<��#�(�n�>jV.���Z>ҳ�|�H��m̚W�}���_-`t2!����2 :>1#n[.-�b��d��[�Y�8=#��NT�'t�}v��(L�s���o>l;�*S*I�W�����=�ֵ#��0/�"n#4Cf���R���J'�G�.�^N�+���L�7$����V%P_�n��7������	i�\#����%5'q���4��.+�u��O���iU���'�VN��@�3"��ա~/zڃ)�WK�799��U��*N׆!g���:r�7����f��X���]{.������(1[��<������?��>Q��N�����$}��[�${�ve�#�Yz��� 5�L�O�o�Sɻ������v��U�g{=(|2$RW'}p�ln o^���$���:�}.�b�����pNj�'޸��7�LȢ��/���M~+��d�zA��J,|�%�J6X	IQ�N1��Zg[��b{5?��������Q6p�K�r�=4$��l���~�M����;e�F|�SՓm���y($WA�wc__��N#!���d�㖲�&W=LfC��s�q.��0���/���j?�g��0{k>�����C���.:ڌ%�߿K�4W\G���|2����]f�CH74���� �F��ncx��Dq2�������H8E�����O��#@|!�4e>a�N�q��jq��@���A�ѕ��Hi�Wf��O&�Tf��/x�D:Z
%6���7(�Տ$�G�'⁵f������ӯ]�4��N�4R��j�g�t�+3�"�u�/$"�nZ,�\�7Sږ���׏�>����'�Z�;���9.����-\F@�ȩ��#��vҗ��y�����3^ K��{g+���*�֋�A�$=Y��m����ј��6ik2S~��َ���l[�TǛ+U|+&�`-W�2m��3[�����r`�H'�F)��[��:>���w9�@=��:y����F��WgO�t�JFV�sZZ|��w|�B/��H"���x�x ���U{�\ ?��?D}�É9!I��J������]<�j ��I�T��+hw��4�)��4q�x�l�����џ�8[s��H,��<��cl��0������G<���g��p����/��G���=�������$'=��r�.�[h̟����Z�E()5����"�w��D\'�!i(<Jo�å����\��5�(�V�:�B(��jy�(O.�ϟ�g������O�����G)L����!x'ZZY�1L��I��8�x��|�<�I��˴���Q��mP]\)2ɉ�"/��,{[�J��c�=Ǻ�w�oLY❸��8*R��HKM�k@tEB�}�S�/F�����Ƚ��Sa�e|T�|Ftzor�<9�j�c���S[��C���O������y�:��2��k�D:!�5�Z� �R��)>#�qqv*5�bV��m�������9SAzh�'���Ygc���j$xM�5yb����'�������S��$'�~u�PM-t���;TM+�S7�����xc��b���)�*�L���8���*�W����ȵ���Tޕ5���G*YN"r5�j�;8�\$��F4�2�c��̔]z��P�:��r��4v�Ρ��A�{�svE���q���?�A�ۋJ$;���6S��a�߲�+�GfR���sO��Z�������������K��U,��h���:	�?�B����ӏ瀨b"��V6���;�|�>\����UOʍ��o��+N����'%-��k7�����:x��R�8r��,��&�X����P�d�y���
�.�|5iW��A����o��J�sJ'ZgK$o�@&���؂��]�	s�&��p�kΏ;\��y2��q�2- ��U���r� �t�loįl���F6pn�������R�xL�`"󐚀� ���"�8�t�䗄/<I��|���j�<�wƗ��h�u?�X�d!�!�A��F'g۝��G����o��G�"'�Ω#2�ռu
_Y��(~愓�d[^缸A�!H\ӭ܅�bﮧ\�4_ʀ� �b�͆��ҽ�P�I�X���'�_�N�:��"�S-��{��l.
�;i'�^�#�]�_`�fa5Ieυ��Su���f�����a��A۾�,�)��:T% ����v���c�/���pu�M=;�-�?AV�h,��p1퍞�Lإ��*.�*�.	g�:!O��!���.6�*�OH�Yj}�k����*����?��*B�j��ț�m��:�J�m�Q�����V!��p����I^���Ó2��Rb(K�n�{T��*�!�J��򕔣 ~U�r͵��7��ܝi��q��ޱ��|���ņ���#s����l���+tx�e��h�[�	���!�>э <Ӝ*�/�)��{Nd�����X�����I��6I
�@��H늡�\��W��R2��[Բ|�)��h9�����f RW�S�Y_�24 ��������kY�*,����a�>:�23�fآ	�jͫr��x�|��68" �����[�pF2C�s <���[ǭ��86=d>�4�,#~��q�P�h�u%���o\�r��p�����'��PDO'���p��kؕ<�Bc)�_�m��NH貏��L�������,���M
O��z�.�T���?X�Lsx��K�+�4vq-�j�{���z ��vBL�:��sv�x$�|,>�R���.�i+���ˣ ��l���,x� �z�M dhm��]�χǨ'�~��e�F��N/�兟Yź��g3Y��3�k#h��D/";7�.�s�wgੑ\�������|#�p��� 6:�e�m*"���j�l�������ZL>[�%'��N�:������Y�#h�s��T�����|�<]�F���������y�c�t��Bt"ܿ���Oj"�5r����jn�V;>���os)j}�&�s���wS�K
���q�#��Y���L���ya�8�����A�>n�fO�Sk%�4�A0���['X�֪�����BN��A[R6�HRp|^TBOp�[sg�y�wz>�ŀj'dF��6���<"7uV��C
M{�]�x#����tb��נ|�u���@��1"I'�]���9z=�F<�:�\��u��q"_SC��GE����9�O�����(a;�nP|K-�x��F�E��Pߍ�T��VX�Ұ�ݮ샩'�a��~�@r�z�b�'s��ӛp��
'~�;1:i�	���́���������Q�9����6��r��́���gB��Õo�����3ϖ��wbJ.��tM�
�-$�� ��ha_�)�K�2�@�:�o�o3���,׃R/��$��W1DB3�2�̨Պ����b�
#\�t'T?5�22�h��Wj�-KP8�ӎ?n��G1�/V��`2Ӄb�XiE�l� ���'��0���Ե���
��k���/${@��'p��������v~�����ŵ�����V����x�ׅ�Z΁H��U��g����_�S]�Ȅ9\�fW
F@c����xG�(���]\,,�#�&�h�%kN�cpn��~�[���>�ۓ�W�L�{�45$7(3.]��DW l��+O��������8�d�T��ZR���p5{:���O��4�$O���<����T���{���Ņ�4�6� f����?�j���,�B����V	�3�p.����h�z"W|k/�|�j���p��&F�����i����c&���Ǚ����8J@u'�aU���S�kyGWm�u��)x~�~����]�f�\r����@4r�`�����|�R}׮���    ��G�9�@f�Y�5�Db)p{<�#��=�r�dq�h��NƯWiu��K�z2n�#�7G����]��q;�Nv*�,J'E�ɔ{�1��J`?�!��ː�
�l�� 5��K��|D׮c�|
+g�}�D�g��;�F�����}!�e���d���x7
��抱9�J�Mv�~2�M/��Y�r�oD��͔����iz*�Sl��.?���� ��If�d�r � ̛A�a�.5\6���1������T��8"�X���Ҁ{���o	;i��k��g:����b����,'dƱQT/x��d^����a��E�VN�vd���CI=mN�ZzD���.F4����eа		��e�;=�}�Z��Z�C%���I�s�"��º|Ț1�!���m��Nz�R�}!��t2����H��w�?-���G���������r(bl�FB �{e睴�o���<>�IN�f	�$�	��b��OF3܈H�4��F�0�|d��t�O�V��%ʰ�C��(P�Ioj��m��ߩ��+3�IQe���ç3�8��-c��ב׶���!�W�j:!��HJ��"�� V�W�{�R��&~��n�W#����꨾CN��7�����)N�uń�Pm��$��D:(·�yU���"�i�h�4X�b� k�W��], ������q�TkrM��;��I X��g?�N[n���Z1#wd4b���� �b�cT �-n��,�ˑ";�9W�A|��XE��g����x]��m�>�bƫ��D;Dz���wɁ����R�4�5��]�e�p�^�8�d�g�x%��p�#U�Zm0��>'�.����#ևףO���H�:���.5=�BT�Uh�2˫^�gG2t�y�C�Х�
mSdSD�{�H[���׫�f�+'���s�X��Jy��V�ީ`�d�^�U��ىN��'�����K����ex��Iy������|F���LH�Nj�sj�f��Gs��e�m>�ފiߜ��d=/��T���b���q�ɞ����_�Qqz�jbܣ�T��zE 8?�	�	�o����u�J�,�tt����Hw�����<ƶ9�]���mbeWeI�@���@�[����k	�ڮ��HNz�o���s<!���t*[��>s�� �n�D�����NoX/��n�H�r�&ky�H{����w�lt��V����z.�9�C�S�J|pIz��"�V�Qc��1"4�Z&bB������O�.@A��j�=P�[��F��۱���O/
^�� ~ÿ� 푖:#ʌ���|Xc㗖D{���e(|/3h�ᩭ:��s�\+&s�{����7�?q��\�T�&��EB�w��{/6qJ�5�|1]P�{/�?W����]��	'�b��d�T��(Z�Ͳ'�� ��pn��&�?r��U����aZ-�L�Z��C\��Z3%��Z�gU���v��4��K� )ӣ��	�K����KAR�҃��B�m����5��Kq|�ţg3�,ݾn�<�,���n ���mZ�ߚAOJ��
�bH���
�Ef���w���0�)�$�/+�h�U��B�.�O���Z�7��U�o�����e�9|�!����k,H��S��?�Eb������������b��0$�Tḋ�sI�-�k��⭄AiY^�d��N�����f�b��Ƀ�:) nP��+��� �����lY����P�f�GEĭI[B%\��N�h!�>�S����������^����G�4�OTf�sjy;�ʅO}��)D��2�E�U]�O�%?ؠzAK�� v�#B�C+��F9�=��Mn�;����o{��"aW��#!�9�N�^�\��W�٭�;r�*�G�˦��M��~ �O�Фt�ݮC���tE�(>����F��5���|�����l�piM����c�6:���gjI��Omn{A`���B'�L6��&!-+ *>�a櫧VJd���r��sC�=�_������ ����;��"���Л%�V�	���2ܛgs�]�>r�|2ҋ9Ju@�ٜ�:]@Ԙ�k������fs0D���؉r&+�#x�I���.|撥�ٟ�
�4��j�z�?IyqW|b��8#�"��M���lf����ݵ�eW��#fѓRi���>dN��=%��Jsj�.�=i���ǰ��G�@�6�5�:��=1��:��2$"K=i$}��1�1��1?DS:q�������5�/{Ս	[;[h����9����
g�o"�E�^I��^�R�wUn{�#f�6"����Z�--rj�8O1E|]m-��W��F��Wf('�(+�憟3c�������Ε�7j7��}��.�xB	�Leo ���4�-�h���׶!��\��V�z�q}\�[��u��]w6r���RJ�����
�E���Z�?j,Mc��%�1�9ԍ�@��(q���S�����	�&w(#$O�@_@�ŕ�*�Tg����_��^�qΓA$�d��ߢ�.�x����#�+���?�ۀ��&T���A�d%־��]$FUA��Ghk��Z*i>��y�~Ä�o<�fRk*'�!��ۧ� �Y��52�ju������uT�G�i�G(���Xn�2^ƞ{���x��]51�I�+�9V���4��Qgj�=��o�����������o����������?������ͮ9��A	�jg���Rd�6�G̈́[?R&<�}����	����E�5���qd]>�5V	m'��*�#�`���	�e��Ų4<b7�=m��}�o"����k �lF�c��� �au�<4|��Wz�t��.���!��{q���tM�=�7u"Ե-�9��Eݼ�՜�Xq�'��Y~F�sW0��$B��z��E�d@S�%�`b.��T�����3�ľ������XҖ}�a�~�
W���5&ګ�G78�O^tst��A>���Kz��m Yk���|n�
�T�D,���N+�V��s�[|�Nė�O�����5"Y�FNh�,��.�+~�fp�S��k�zv�'s�fｖ��t������'"�a)t�o^?� ��夓�����bk��֣��N$G�y�ڶ�����r����Ɖ�ӹ'��L�a���0�zZU�k��?^ܶQ�N���O+5 0����Bo���Ī����f�3�	��R�����ַ��Š��f.7����|�k��K>�D#~ID�Ӂx�h������-�dWn�w��~=;��\I)Ui�����!N������0Ez=�����"ƍ>Q��Z��æ��W�L)̵c�����r�7f��
[4պ�'���q[�}����������UF7Au��ܘ�@zFZ`@.B�9��:B�yP�H������ꬿ��vL4��/��I�H�R����{K�	�7�ei#=��ID�.���������Ԛy6���p�p��앎fR���a+�V�Q05|t���e�������I ��b*'ʤ44M���k7i�����ON�̑�S�{��_�!�	0�����pci!=f�a��$�b�{�xp�8Sl�dG���{�1C�u��Ȑ{=��v1��W��X ��<�c^���U3 !8�2��M �t��	��+tK�v2�8M�ꖭvɟ�:	��J\w����o��]c9њ�K�pA�yv Z�W���F��X��3{�9�T� �$�e����o2Fh]}�n�Z5�ԧ��{}�9��xpv�{���x#/��RQ�[uJ*E��*D9]�'�Q+�i����\C��/��{{-�И�����r2{�Ԁ��j�6���4\AnUc}�I��Q&(�2�t���D��(��N�U�����Hy�*��Z&��r<٧M�9�����>��1���p�s�7ɳ��ґ�H)#�	,L�� �e'�m����ɑ;���gϚ&�Xz�"�;օP(i;&� j@
o�/��B�OРD���W��!�q�D3�&�;30�5~eM'KY�8��$254�W�p+�,�������GϊX�]uj{��,.+�ՠݩ�W�-�:����0��GA    >���qu �/��q��a��f.__>�=����t���	p���\@&���17"����7���a�1F6s���4��4�,�[�~*>���ȿ��?����CH��^�Jؾ/|�`1�ѣ��/�y!uu�"�y�&�l��z>���Z����/������-�n�����]����/�I�J?*8?���[�.(�5� F푙��0]�����FN�Lݸ�~�w��#%Jt�2,A�v���@H e �Ϸ;�� ���s������o����e��R)�#n�6woK/�aW��n5 3k�rr�Q���v����rB9��+����3�| e�u؄g�����~[.���Ot&x͌�'��
f ����t6�y��j��^f(x�r�}�g��87��*4��L��M��}�Np�$�N�N��h9-�D��l��HaZ���xI�]��7f(|"&��d�&+��13:�t�� ��*�}�i�s˗M�/�,}��1s���	��AGX��D��
�}�$y�ˑXg��\�+k6O�����Z��T.m���k37}#�2Ñީ��*c�f�m�X��<oK�����3�=������kZJv��:5�r�5f�w�`�l������`ja9s]�P�9C��P���Rݶ!��>�p�7�%��ǵ�qB)�q�^��\��|����]��Z��\�W3��L5ֈ4�v ��ƞ�rO�2�e��Sr��>K��{�\z�x�'�2�KQw�lp��'�@!�VD�J����������ϕN:{�ݫ�^�����ɵ]���h����v
��wN�\/��Bv��g�K�ͺG��{1� ���ݭ�/\�m,�v�ЪMp�>+�H
@Y�dמ���}>��=o'_2;�*)��^����"X�94WFZ{̨��=��^U=(S�<��[ed��k���f���{�R�s��;��$,ʣ :�)�ҙ�.��� c� �p.2d�Wa�],`Y�	;��'=u�H.M����@U�>��V1ʊWTJ�W�`�{F<y��H�f��������y����ڗ�$X� �TёB�>�k�pbÏѶ�h�:�p��ֲ䊡H))�<��VJ�ed���\+���4I<�z��U�ª�S�i�H%��k�T��N=���Nd��l�1�G���X�" #�?'����ᯌ	��df%�!/L�N�H�R�'0�m��������_,�{R��p9�}n�G���#��� 
�!��>����|���D���M���(�����j���~����ߙV�B����N�Bq�2���h���=������⫄d79*' 6�+��5����ɯ���(�5�u�Ow��W�1������9P��ea���G�,٩��&P���	��H��b���;M�� ���q: 	�C�����R*%�lKe�[�*x�代�Pޫ�e
�����:��QOzT�� .1����!�D��Śz��Ƹ_���!�G���J�c�0&@���[�DNU ���z�r~;��q��tm.�3��F�qp���N\�)c��Rx��H���d�ێM<:���:J��{M�)h6|ī����I9q��9���`��F����������ɕaEpz����4#��oG\q"�Tѭ #ߛ��۳���eZ+Ҝ%�W�89�{���?˷�7�D�rl�<�.��@�N��9�$����%�ub\�T��BQoщ�j�쒷�&<���P�����;�gxR����rC�/�0�؉��`wk�{���؃w�ು��m=j5$Mo҉��َ�� /Qo�o�{�����ؓ�sZ���qb����4��[�Ȃ��g�A���.��ֈ4�]薾5�����ۼ�6�w���r�@�HK�3���[qC�KM�,9�Z����KHp(�O�)V۱$]��Q��>|5�	Ն)s�/V6��U��W Ǵ����0��bހ�R���>J̣r�݋A����v��%��N��E�[3��0Ppj%;55��9�m�ְ6g[�z�x;��������+�Z�"���p�z) �;kF����Vڷf >��O�26�Uއ-Z�%�rT��>�Xns2�(��)���ޝ��Qssz���	��]47�3��0����Z��^}ώ���%sGy�x7D�VLvq����V�J���eH�˙�i����_-3��%u����	9�340#�nZ6�Q�R����'�c`�t1Qy������&��9�qw�& �cM������m, tґBHY�����p��߂��Fv������@?8>��U���j��݆���ǘfX+�F�{��-���'��K�[��� �p��e,���r&���b��m����iI�d�;!O Bh�����%�J*��8���ǻ����3<��ڒ�T�z2u5�,6`���\���Q/Q_�;d0|͆��8��,+D�4a"��]6I�3Ñ�� {��K�cr�W��"��X���u.�Orq�;��sˢ��'м5�#O�=�Q3�K��,�^���de�1��g����X�1�z��9��o����ř��DW�O���y/�����Es�_��2y��B'�)��E	�Ǻ�g���z(.�1����U����Ѷs˘��R���6v�
�L��(ǀ0J��X%5�{}���o�d��q�(֩���)z�qD�:M	*q8'<R�7�N_-@��K��;Gk5&܂C����I�;�}H���x5��	��);cU���QA����d��.ߚ���Y�bK�����Q�S�� pb�;�[��|��#�#��.�<��d�1|J=2�06�QlR_-���%�X s�7߿��=�Y��H��;����E���d1jF��a�:�.�6$�cSIK8�J�t�A�m7K��9�T'�h#T����٣̜���_-l_���>Y���W��·B* C�Rvθ4k,��!\�5 *��fv�Hn��ΐ)��\L�.����E��Z�h��Wf���l X/��=����{��rL>��^GQ��-�nxy=iO�U,�R� TCԬ���2��:��]��WӁ��]��2�L'�.h0Ț̀����6=	���z�r�T)Sq���Č�J2	�!��������b>Z��=��CD]U+`'.5̕�ȣ���/|��g8"?������Ό�Qq���)�!��"������|� 0�	QnsԾ^�D:9;`ӈa$�~u����o�5���@pT[���YC�Q��_��}&�.D�����_-`鄒����j��굸��jXV�LT�د��֎ Q4ǿ]O�
�F���+P1>�WSJwn�R�\N�U/p��9ɠ�E��K�ү�q�B�S�ɐ9���^6�]E������J>�۲��ȡ�3���"�s�����MUA�;�܁���oI���хw��֜�q������O}k�'d+�����@ڀ�Df�rP ��3�|@;��6�f�b} ����R�0�y2�!W-wY���!������n�_-���Al`�����;��ޢ]�0��������0��8�7�jв�sZ�{��1fL��+}�@�'Z!�[�d�7����</W�ҭ)=��>��	Kc���x�Ջ�����6��:���x��p#|�����̤j�� Ƥ>��$����2�*�.I���^;#W�6s�o*/���E�XXP������ط8I�R��KJ��82܁n���{��`)� KI�N�Њ�"�P�A�g�����QL��Z?��r<)�;��i��?��	p�'wg�ӔR9h5~n!#�sBwJYǓYf�a���Dc�NB�I����=�3CB�t�d"?J��G��Aq��%��yȻ�~1D���Z5�A��M8��%�m��Nx�4����${u��^f�x�T���]/�jqz��q��:�������}1��K��r9�����WX�7^\Y�G��3�����{�A�L�uή)����'x
Z�����.��_!9;�ZI�N*�    �Tj��^�ӭ��C_�Sk�[�]�9��M��W3��	��A����w�>á����.c��^(����c�X)'����:z�K<��{l�U[�ARy��	�[@�J˫Q�}8/�eI���:Pd��Z���j��-G�:�j.�2<�չ��O��8��J�^������0"��[����EΙ{��u�AQ���3=J��]�Q���1�ND��|�c-��=.�W8��F��6yyUu�M�/
��󑴛^�L{@��|�Z��7�.����&��AM���1n�����z�f�	`��o��C��"F̊l:��|���A�X,��4L�#Q�\ܢ./�1���HY�J����*�ja�Ⳋ�t4<�-�+�z�*�_MP��W����L�q76��������Z������q�@F�t� oc!���1'P�0�����5֧�෕cb�]�)��T�#;)��T����d�E���0)S���U��;���:h��s^1�����_�n��|a:7��d}�{�D���u|�s�ZWA�ȫ��V��rO:���G��+$@����J��uy)M<�o�'-�:����xS��\�� oO<B3/�����(�i�-����NF��'����+.��y��m�)����:[�'�����#)��O��ĢtL��,ToB���(7��Uސ�X��#�hB���oAr�@5�Vk���ý���/���bP��#�#z�� e������.�V��+>ՖƜ�"��X ��,b��3�rR��x+j�J�W}�Z�+��5���R�:�s4�G˰��|g5u�������>Tt�/�=�f�C����U;�6(��W7>?0f�����N��p�y�U�dNE`D�z�q���~5(��G�э��Ԑ;�pf�aa�ۻ���Nq^u0�Of��p�Vj���%6̖��.�>��_[AOx7���r�@�@�.�P+�ew�1{��6<�b"O�c"9ؒ����>�Y�� [����{�I��j>�q]�̼վhUo6�B��TX#K�o5��e�=�Y���&�fE���)KT���6y����f >!Y�I)�2��l.v�����V��7���	ȼ��p��HP�gXP�yn�!jnT�{�7� �Z ���8���Bb��.�� P���Ȑ�Ʒ�=�	��(E�d�u��H�8�U|0�8�=R����A�����[��I��S$Mgf�B�/�(@#bfj������n�#�K1�虜H�2_�bJ��QYH1�8���hZ�Wfp���$jl+��� %�Y[Vk5�;�ME��.�h$e�0/)U�x�:Z�GZʴ�K�?���|��k�k��?6'YT�É9CJy=����1�G�ݝ��0��6 ����ؐ|�c�Tz�%o2��kԓ�$�õ��a(;F�)��E���Q�����%+���a���X���u�z׽�D[g.��h��WfpՃ�R-����7߀]��U�!zVE{>�N���/�׏x��Q.T��C�<p	����^�μ�w�̯b��]��y��'���� S��]ĊkL<_'Y��Po�K}��W�pP�e5���͓���}L��Vl�9_V0��\�� 6��1�O�p$�O�B�/�~����ˠx��G.Qh��dۙ�9���w)�xf~^J��}�j���>���B�v,o�o�~=�Vn���ډu~���A��IA����>��
G�{P�,'��pGz������y"hț2��e8GR��vWuȣ՝�'ӷ���b���*�\��h�8�:�W�p�1Y��W6-*��i�0���r9a����~w�.f�<N�?Y����~d�.2ς���hpN����ȇS��~�P�(�g��1W��g��?�?��]<s��F�Kt��|�ey*��$ȥ��Ԟ$|�'��u�Cۉ�j�c��e�X�+
�^m���@�S�>�F��������+>�X��	��5$ڳv��o���1B���6;@LI	X`���G^����xK��D*�w�b��ՙ��J<)���� � X�]\Q�L�y�F�yU��ff����B��ڎ�1'��@v��۳J�e��ϼl"ν�8R,�p�εEŧ�����̱f�9&���9���kyP:�3 @�W ��e
�!q4�%`�����n�d�e'�w�S[�\?�|�����0�q��r����&��Z�z��4�{|s����C�E`�Ⓢ/S��������Pg�J���O��Y�Z���]]c�H���㓉.䢱�o������\�@�6�Xu֟��7y�oZ&]�l��'{�M՗�$�Z|}t2���Z�'fn��@��φ<���(1�$�C/��B ���k�HEce.B���^f`9Zr��sH����1���L�-M�h�׉�#�⮮�1��O���zf|�l��?�w&��L�f�S_�W���)��!
%/K�P�/�ā�Qd�������|��ǟ?����S�`$���hGt��S������|i�W�H2��3-ٛG��2�U��;��-�j9Wz�
 �t�9ᘺ~v7>�4�����B�H�F�j��?�����c�{�6���'�����ݠ�c�~1,-��#�����,�)�>1�����K���\;��Cx.	��� �V�����֟����3f��DɎ�����:��܄4�)�}�|�4k�y̗G�nr~֣q���B��ɴ{�D��{t�3� <e''��L�ꉸ���v���>�|}"�FV�#��P��P���ƭD��N���w�GpZ�$+��^oo��^��n:S�Y���!2�"4d�-�T��9xT~���&��|p��%ҶK�89��n��!���y�|���^���@y�R�Ҵ��5"����q���1'뮢F�wz?�Q�U|�|�A�x�/ �b
ɜ]	�;�$��{�W���e�8(=��--V�6�"_�7�:�ò���>��>�֥KGժ��o�Z�5|R���mtՐZ�f�x����އ/f��v��)��C!ז��{&^�B��4��Y��}`��"���|�y�m��E.䩅o�K�a���{��"�7�_�@|�|Y[I�e#�����/�Xe1\���r�
~Dӣq��Qk)���!��{3K4�.�2�ݽ̀<��Eh��t�OM
���L�k9[�y@f�����?y�G操܂�' f5߽�56�,��t|��ML�5B=���1JN���	L&!�ƍ�i�Ԏ`�_��|�����G҂/�F7�I����e�X�r��^�vٝ�j��NF0>y����
6<��˨�IR�=
r��#f'��r��G;�:G,ЉɥS�D��kaj�-����q����̔��k[2BB��Q�&ͭ�8��x����\@JG1����}9�����>����[gߜ]�DY+"����p�A䍡js�SK�������{Av�h�
�v�M3>Z��e�3eH���t�N���=�e(�j�RN*+���CN>Nψ���\u��� 
�s�}�'��>3����Ԓ}� `{!��ǂ��`�9�B&���Z@O
	�U�v��	p�*��O�x'�g�wnh��f��A�(Ζ~0$�\��=���؝r�B68a������?�DY��7i�X����b^��ɦw�z#�N�)��w˯�^or~�'���X\}'�u� a���,���C~~�p�����0ҽ���Ex��l�"ŕB�F�j��{���WFГ�
�¦x��M�:G���T_�Ў������ �>�5�'3�<¾�8��o ��g$�i��*�㝌`YO ����.��id�Ȁ[�U�j�׋k��C�\�NEΖ	�	�����K9ج)�Mk$+Z���_�]O(͔(uB�(���J�����ם[e�;��0�DN����ɬ_�J�Ph���w�Dn�U��i��U`p#8S|�x����K�!�
��>� ��;QCn5+?]�{z,�e��7L/�h0���{F�k�������L��Hf$p_�S빤�}� GԀ�S�ao+#Sk�    e��>E9�{ţG��R���K�?5/-ϢbcP��=�"�)����#�\��o� �����f���sq�����NO�i���G�Y.���,�,��j�����AD����I�Rq�����qu�ȫ�p�׫E�;��w�߽l!]2 ���ns5��k��+���'��O�" >2����SQ8D�0rk��-��h����O�
���p;qks��Y���������z�v�|I��=j�?H�'��a��r1�R���UQ� �,s��g=�]�oS���SG_�#�U�N]�[޶w�c����.2l������qU�Kڮ��B�]��d�	��ډhq�jru���Z�^�
p�!�3�i��؇OC﷡1����A��f|l�v��� q ��YX���m�\�+��~�fK�+4�n>��-k�%F]�f��3hII��;���-��#��>ԐH
p�x��P.��0'?�6žW��!|}��'2ʜ���Y�z5����') S��; 3^�t��r"3"��2Rl�U>���Wߔ�v�)ר2���v4�����7�#��ګݖ��_��j:R���*�TE�[�N,��Vy1|N�Y\��Gw�A���7�Ȉ8@6�E_$��"�^b��u�nS\���30��٥�L�K�z%�i��RC�y�Y��^\���Kvi�RΤWkڥgv	�����G����ZK^�{��u�o�/gW;� �X�<]I�ʧ1q�+�>+{��L��5�/f��c�}���rB���Q3�`��'i9'o�h����As5/I�識+C�@���~�����zQ�P(���Gmr2q����s��~�5XV��v����C�������j}���W�;�as��%�fެoUAH�r����OϚ��5�?Z�$� �%udܩ�9�=��}�j�ZO_XAN�ώL	�%Ǜ����z�| �xC'��x�-œ�K��xH�Yo�ˉ�%��]_fC��2���k��5c<�����U9'�À� �zO.��&��-�aD=)&x���ïFo�*�hKm���=�הN�Nm��]BO+"���>�9w�dJ��Wq���I�Զ�M(�'��ճ��]����[O`Iލ�m,9�L�P�<���{p(���gv��Ww�nr~�}��ʚ�r���m�s���0-���oD >����S82�рN�՚���"�w����3����f�3H:)'�ena�����RҰhhI�U����O����G�?�*L$�0(�R�$G����r�j�չ����g�;�>�9?��x��AJ\[�B�x�=�=���{d;�ǀ��^I�-�p���يD���\����9?���x�s{WA<➗�#��\w.�ʟv��#����!_R��D���f�?�7�Pd�>P����׳K�'�h�^_B�M_]����{�n����ۂ �=wQ�A�'�*F�UjH����W[<Ҷ�ߨ��+3�P��e+�~E�l-�)-�!y��9�`��MS��M����m��0�35'�E}A Hʖ�|*�~�z��p\N0��s�^�@2�>P]:�XwRݵYu&�&�錭\JZN�D��b��2# .!�uޛϴ@�^pe0*��V\x�|5'�IU}2;#;F�vG2�j1�&�瓙�\��JtO�\���i�'�TXr�?����lf�Y�ͤ���Ѥ��.���ɡ�>ZJ��p2�q<���'N(>r��s��K��u�������U����r�r���߅]=]����C+���=�騮Rg����Z^B./S8�� ���}*>{o��0�l
cJ��F[����'|2�t�yM;6�;����u�X �#YӘ���`�k�#e'�:JKQ�D¹]�E��Y����Q��cp�'3�L�� �/���{�	 ��+�V�sȂ�ř��q��.ԣ>|Z}��$��.,!�2�đb)o�d��v�栚r��\tz��&�nI���b�x����f�.���$G�yc�J�B6�� �8�ޮ�`�*@���D�;�k2���	��%�^Tz���⭖(^a�%��v�T���H�S��0)lf<��7��!���'�Rk�Z���)�E�L09gL��}�m�Y�uY ���K	0�d�iI�e)h)�7>r/4vNu���z+���z2�gɴ��ʣ{t����U��]c��x�7����$9�6q�9|ጀ�Bd�{]�'W#�B�Q�YZ����o|R^�$���F���<�
. ����[�O힣7�b���_�Iz��*Q��}! �do:����f�\����Gv��#�ɴf�V,�=dXv���,���/�����=�<|��dB����](u�������`��ێ��6����Nru�����7T�!:��A(\1���-�z��q%��y ��]]>8#X]ȝ�^Au��>?�����9!+��ȋN�m�I尊wڶ ����p֬o������GW_> ߰�� q� �{�{T�χ������+��rR4���o(��3��{�ŸdE ��6����ݵ�O��ޫ�k���"B�� rС��fm�/�~�o^��s`��bJfo~�N��A���W��x]hUWɵM��򧳗xr��N�W����jO#���jH�������G�9Y ��y�2�]%��U_��?pN[5���{��Og�rĠ��"�qr�����V�s���/�~��ٳ�X^�����"��*G*��p/Ҋ17uy�o������G_#��� ��6$��F��}�J��oo�S���#��;i�Ԕ+>��n��+�d�.N�������D'ݱ�#���&���^�N����y? �}��:}�>\e�׬N�u��n������	$;�A�s����g�G%JՒ/�Ykٽ�rc�e0�� mVu����J�h�(��S��D>_�������Z�l�$O��ENz�+q���0���)XWf_[�uJEp|����������Dh.��{F$�i���c�rز�<�X����d�|D���6r���0(9%`�c�R�N}���@%��J'A"�.��"�
F7����LF��]�873C��Ɍ�e��r�Ԛod:i<�T�6�1�E���/ǒ��Q��E�3�#k���i��(s}����Of��Ð<d-'5��#i+Tϡ=���G��o`��;O��HIbLQ��{�"z&�-^L�N�Ŷ������`'��F`(��60뵅�x��KϬez��pC��C�/K9�,-��S���:/\g�����h��x��0�|2C�'��.���;�I�VkY�p�;��@��Cf���"�H��p:	�#�e9����[y9��薈�Ñ��B'DP��Q4�:U���[B���	��gy_�����-Q_ȺOF�R�V� �N��X��+�k����{�� ���$��$����V���%�p�����F���_k��!�7a�^�����T���v����R��D+��廸�}�i���e2%aN����i+��
\ˮ��:Q�Ff�hY\|���Ccb��к˺W�Jd�2�$�9:�E�;��	brz}�>ukH%\�w�g��f���Z�鶾@?�bU�xB���g�)�N��C"���䦻wWv�/��v�m���u�`-_*�ޤ����S�U�� ��M�ͅ�"��	���R�K@Lt��0\�}������[oz~��i9/ON�u>�'�H-��Ҍ\��[���u
*̡o�y˳z���V�v+_?��������������g���⨙���1��{ѻ�@��z	�����t�\�^��#j�O�*>���I�um�TU�s��N�	��WF�t��$y*o��ݻ<��)����q���z�SROO��� ��:S��3lUo�O�����S@z�a5��Dog8>���O?�EkF�ڷ�ɟn��(E��O�B��М5��ʩ-&�ema	K�m�J�S9*�d�J��ӥ$y�������k�N��!x�]�K�֓A[��:�U.L��'��B��S���'0��n=��TV$�����p�u    +��ik��X�nCn�2�R!�~F�ف5_[�0	#l�D�����xxg�ǧ@�dt7&nÅjŷ��U�BO�����X�O`��B�'�L5���ucu���&nL�a�MH�A�I�J%��6J���������/yj�&Nq�����~H�O���6�Jе.���zoP�Em�n�=�0�E��'7���φ;��9��Hi[q?�p����LGR�;J�AI��2��8��
�,�-���~�%��D-'AiX�\rA�>L�v��-�"u"Q�O7}���턑��ޖ±����KǏݚҬZw�G��!y9�af���!SJ÷p�_���5�ft�N�y�	���'ŻY�w�땮�4x^����� �]��a��7�'#Vq�XZ�Oȗ�|Y���R��w�����=L,&'}3�,O ;PHJH ?sƾ�Y��c5{�V:�F�j�����i�xOk�̣�	=:��a��2����X}K�v�v� X���)�l���,K�P�(�u>�-iZgV��Y�)=�y8��3�I/�$;)k�=�O.�]NU\ζ���\!�˽���o�/Ύ\��{�^W�ٴߖ�6��jbA��*���?�cɗj���Y����w�W�|d�ɂ6���v[~t��#^ѵ"� = �4��v]��tZ�R�\��T����0���J����Sp���cm���n6V���xt�풼gT,��Iͩ��?����8	����7��xt�7���&�C��Ufׂs��a�bN�Xg'8��W.�"�^�<@p�5qY o]���ŷ��L*ȅ�z<�/T���j-�68�kb�7���g��R��/*��BG|荑�l���s�s����Ŵ����QL�DQ��o�
�JHqc���A.֭e��l={�����*E��bӎ����TB֚�"�#2��'�K}��CY�W�D:������eΤ�C�~��1/[��r§U�6�
��Ĥ�L��q�	4,���A���M�-����9"8{u�u���w�I������T��9�9�b� /���.fi��GIeb{<�3���J>�@���$"2&D��y���톜k�7\w�j�}��p�Q5ۗ�i1�ku�og����#�挦�����>2�4S<!nC|�)�
�a\�Q�I
�}-���z�a���yN��2��6��kO�qc\�C{��:u�cYឯg׊Ü0��Mձ�r,��#<E�c�c����ϰ���Q"(�̻ba��?>��a�V3�v����t��n�2܈�|�[�ǐ�!ˡ��+���������_��=��h�g7'��KqM���)���i�NdTh>=�8�	p8w���!�h,�����n`w���)Ҫy��<z��7��*U-'C��+�T��eGu7"9L[\J'�z�a��d`�#ݐ����L��pF�>s�Sq��R�Bv�5}��Io=����B�7�c�|0���Sc���^7q�!z%;�*���v�%�,�GŁp��4�������Bz���lY��|�R�%Z[�t��g<0�o�T�y6�xH5ZȱN��l�(�PjEo2K����cT�/��WY΢��y���S.'�8|i�>��D�#:�J��..�t�\�h��V뫷6h��w�]�*�X��:��:?�u!-�SZ.q7�ą|{���dN�X%�r���ڊ��F:�W9i�m����'�`���(VN������9�
�0�)�q������������U�;�1�Z��D/ż�C1o�m��&�	�RV�~�QY䢲F� ��w̠Px��=�����z��&7��]�;��{��\z�#�J���Z�4L&gp�t���L���[�}Lm�ڴ�����O�#/d~v�|�&}������|ͬ�0b�K�����D�a�DI'Z�}9Ab���µ�������ч �z�a�#�W6�����f�����hz2�ؑdӞ����������4��i#�$�I�9X�3l��IY���|�:(�z�h�{+> �M�AJ�z��2r=?}��a�e�1�J�>[��7Z�"�v�ީ��f��'xJ�/�<�#��e�U�Y�)�¯�J�tb*�ӟ>����������c��IG�\�+F!�M(�'�1	Q�%����s��s	��J*%�'�'�1ً�>�~�|�{��M�*#r��k�wy?�P冩����q ܐ���I�-t�#̅���|�ϧF~���D�{�R)�jt�X'4Y%hm�Wi����1n�G=�.Fd��˵���u�p��ߟ�Y�^�T�'�b�%^�������i��P"Ŝ��=��;�aD^��p"p��*�i�$�4��^xX9kZ^�x�a�ՐY��5{Ϝ�����"2ȍ��E\��jϏ�r��i��uN$E�Y��C�y�3��'�Ҷ�{����Y7���蓉T-��η��X�,#t�7��M����>"��}���0�-#<�h��=e�3�R������L/qT�2�M
�;��Q���ҡ2f����g�Bt2��ZB��H�]�"ͫBWW 2o�,y<�O��j|Գ��k��l0nB2%$E� tG����|�p|���Pf)�Q�-��ElҀm�6kIS�=�\��UN��]pS)��tδ Y���x��#�䫉d��G�d#J��#��V���۞;U���|�8�D�G��R���Md��י}�l�������?��Kc��l8vw&
� ��k5S�T��K��?�K@*���§�5`��ucњk�ˉe�ji���}&M'Re�}�:qc��iU��{�2�4-6��'��0���'B�֐�bx����<�3��E�����/)�L&s�v�r��y��[�����x(��c��O�d�@�O��Vue'o����YB[��55�,E'?�%�e_EODW6ׂO�\R{;�\̰��=������Yb�M,������n-h�v⧯�%/6�ͦ+��c���6%�'Ctm�m���.����_��e��h��"���j:ɟ�jJ�qc|\��+Z�=�3gu��>���I�q_NX\8%������08�Z{/��Gn�
��v�c]+oq���S���IV�3�D�����8;Ц��ӏ:��?�k�`N4H�uR��闢8L�%�>��ڤqVZq��Z6	�
�2�U�N/�)Hxb<1��6z,>Y�]���g�g����Z��	��\gO>�v�����DA7�s�\C���)��ď��=��rR��R	���/�r���vYc�9�.�{��hM�c�Կ��B��#���VA��+yBC@��y;������k��i����0D�H�C����3�v�1S��_�f9���D��_�ƿ����I��:�#�8}�q6ԅ���N�q�g��HΜ �A�� �q��\z�u'��qjE�%�=�݇�f�}8��TF�5�����Ӧ����&L~�}��!�Ep"�C:�8��P>�j^�>0���5�]�6~���'3�QGx*&q
�%�	0V�JlM�z��}��Gi�����kWY!"5�G�.���jS��A�����
Z�A�Ա60��emR|hUG౬�E���`xDe���8�~X�h2R�f�-~i Ͽ�G-���V}1���ѠLk��5�Rˁw*@b�I~"���79�%8��Y[�������%�O�4�-�E���Q!}d�� r��HL{jξ	
Cd�����W�&�k�7���A�Ggd��(�S���F_���l�rfy�>|�Ⱦ��*_V����]9�=Z z��z��y}�'x���W>OC�t��>�+א�.5�HƋ�h��|y�N��(�	0iT�3�H�O'w��+D&� ���� *َ]���B���}����{�����9}X_�8�ƺFY�H�]-����2E$����79��H똶k���3�
� ��t����2u���1�:2Ps�B#��6�Fr�����Ѐ���_���������r�������+o��h{�M���R�$*�Qe��A��x��q�xJZ����c�#[��,�di�v�sia�+�x��~���9M��/����E    ��,Vu��Z��RE�p|E-�%�Q}P8)$R*�np�zr��������B���;1��t�냇�.�xQ%�����8�&�K}���!���Cx\C����o�n��RW�8p��/щ=���������F�y�v��g�>��}F�ϐoV�Q����a��S_s<xT�a��^b��n���c�vs���"� ��^xc|�M�-��HA�u"�(3n�W��v��+#�j�ß��w]w|-�YV���4���)�C�>��4��7<*��-٭��*d����r9Qȵ����iH��2���ҹ����������K:�Jh�HE�6T<V��Z��H�Ӟ���5��z|at�a%`��5�����d����������C K�%�qRw�wS��
Q�W�3bF�+�E�<�/[3_����"%8��DF��G��cR\��P���X8>���]
��g<N���&2�=�ғ�=loV�wCJΫ����@�0��9�Y�
#kJ���&?�N�p�ӻ�6��|��è'k�t�)\��0#35$$N�*��9��Y��HTӃ	�~�z{#�'il�Q��0����48�M1Ш�ϽV�����_,1��Ä<�F��fjl�T����J���0�r6�h6��n&��-[�#��$�ٳ%���&�s�����^��͞�/����hMdF��43�S�e:"[V��.�ť-����NT�][N�d���1��\P*B+w���$'[^>ߝ�o�X<b���{"�&����EmM ��8�^D�Z��xK���}L��|J�OT�JBB �B����x����q�s�^��>��d1U>[�+�e�bta�-	�H�pa�va=H���U}���K��t�ak��e��}hg঴TJ �-�+�szr?� ZOItv�.a����!on���".� ��z����R8��h�D쬦�vI+��,�>��J(x�&���lHީ%����'д62 �͈��u�3n��9���uS�{w3%>@E�P��6\zj���'����<������']��h��0�^��D-Ħ�f��/�n\&ȩRrN���n����q�hF]
Bbߙ� :ƷK�72B��*aӮ��3Q9�6�8�s�F�ZH0��2��%�/�T��z��U<��Jc��#����6�c|wF�g�x�d�}�k�w�qt�plyǠ�G����w|����
�����N��I�Z����s���&�N�F��n�VF8��fY4�S�1"-8�!�	��c�]��/�Z��r�eX�zD��S7������k�uQ�U�{y�~�G�����%��oK#�#��_$%�����v4��N,��!�+�"U��pB��\���j��=.��Wed���M�oYOt$���K��?���4��-���~P�}6W����'���Hs����#)"�Ĉ��E*��]��HN�\U��[���}�`� �1�z�.|�/���+x�;;�
�Ќ��P�ӚѪ�:�PGk�Kd޽&���qi����, o��fCBE2�S������(�D����NfN3Y,�չ}���ۇ���l
��Gā��#ҩS*-� �勌�����b��M�> "��,�\D�����O�;DWMK�uP�g�g������5��o������{�X��:�|qϝ���Rg��O���u�xM��*'lt�ms��@&>�P�^��a.j�D�T�]Ҹ�LN(O[��KE������x��l R����!ч����>X��-��w��#g�
@�5�����~���I�}� 0V ����:B_q�Y�\-��x�ڦ�媉�\T'��+��/�Fi���{y�]Z�h2��{79:QW�l���qJ9�+؜=�R��zLO���\��I9�hX�6�;� �G�	Zs�n���`�.���9���8�h���0� ��zߚ�6�a�介$/��)�d��@���ږ�.Ș�������[�����0�V�12�a��
���H��A�O欉x� ���;�KI;@�u2�<��H�V��F~�@p'3 ܦ�nA����G !��,��רMG��~�pC���^�h��M�����:N�E�v�ap����E��2B.'"�V�qI- yJ������8�p���4o{�_��Zc<QE�"�.@G���2j��ʊT4����{���d�1�O���̰p�V�R�6m�z����̤/g�<�'�Zg�܀ %S.�f+�t�J\��{Y!œQ\��ы�� C�"Dsu���Z��Q��~h����>�.	�G�S��Z�qų6In�����I�]�u+;"����`Z��[�1�dݏ�Ȳ��\Ng�HqR�2���<�0Ĕ��Y�v���u������$˻4O8�9K�K"�i�ml�SI�w0_3����r2�&��X���;H<C�K�;�C���q�����N�o]��w
1���{�!
��Z+=N�\r��U�OhpFL�i���ZY �k pp��yEד��O+H9ZX�=2!`����}��i�RJ�����Ⴚ>��2��A��I�*p��_=��*R��Yx��ڃ��_�P�A��������nY�%Ē���Ǯ_>��U����>��p���:>�G3����sqeů���h���_Ώ�p��?X% ,w���m�-,jZe3����)�kü�;z��+� V��|�V��ed��6}M�{S��������vNk� {�>hM0C� ��=���'��a�׎�_��N�s���Y��T5o
�|������>�ߎD��7׍��`)��}(n�U�o�D����{�w~���{�Z�D�w���;�8��!�j:k��.��e��6�K�ΎHv0�3�ai��2p����D(KL�k���Ƃr1�Z�|B��{ɂ�mWC�S.�+�	o@��2C�'25ՙ��������L���q��q��7[�y�˜m�t��)I=���ܹ���'X\j=x�`	J�n��NF�G<IK����[����
g#`�4W{'~�g��Y��Q��a����;�n��s(��B����*��ٝ�� U�5�Hs��kN��C�{]C.���#��U����Q��Ɍ�sϨq���}u�������:>_��I���Ƚmv�B��}�Y{�zQ��8�EF���W��S9b�*�Wd;�+�M��@� �G�|"�I.�ͪ�'}�:/���k�bg��ȒdǕ��b��j<����W�)}��O�gO�Xbny!~kv�N��K}�� �Ι㚁}�3$q�5k�f͹������N������8L1��I=�� [m��I��Lw�C�<U���ly�*<��&ٿ;�`%p�m�N���7ń��N�XR�*818�f��(3V�;��V &�^'�? ��Q�Fz��CJ���Y޽τh����٩����:7y�̇�x��
���l�#י��kw��C�W|�Z<�#M�is��ȭ�X�6N��}��\��A��3�֏�)
h�u��,�3���
��z���:�C,�R��PR�mG"
�$RC�ܨ�+��K��.8��J�'=f�ղ�ܪO�q���ar_�(!w|�j�m��>�y��S�'4��@P���>h�!����6����ήYOz�Q�c/�z��2�5˔5�)w��z�?��_�\��Ji}�����>P�j:.I�r��w�˞	aa,ZO��z귙Q��\D����doj����|�� ��^-�֗�&}��ǎ�����I~�X��f�Qv�6��W��k�xY�������d�'N�20!n�o~+`���	�PG����;O���{���O�0RDD�Qg�EVH�e)��S�KY(�ǈ�2���=���L=����G�cq�0�����w���Gʌl!��Q؊ 8PS���\ ����K>����_ή|�GkQ��(~�k^.�	>a�2˔Q����{�K�5S9Y��=I��Rd�f��w���X��ǔ�~1˙��Y��5�豀&@�O���V:��G-�29xt�<쓊:Ǯ�
ys�Q��Fk5.�1�͝~/3��������%�Y��    L8��\ �C��D�6�x�>�p.'C�.�fE,(��x|�"�+�GK�A�=*�<{����qQ��@���.�?fv�V�Ő��暳FE�`z�H&G��TVFYc��u���})��k������-��O#p>*+��ok����*~7`�������
?���ř��6��{�v��Zq��2)�DU�T=����  ���ْ�%�/6`�����
|�_i,'�[�1���� JѿÆw�i*Rywg�g�����(�maV?z�8��ꦮ��1�������Ë?��E���˼g�\K쟼z��y�ņ��4��*�4���bF�q����l^0���Q(u�� b���������V����|6���̹�7_t�l� D��41e&���di��B��7����6e+��ZY�N:��9�\-��4){��9M��H�"!LH����;a�3(�%Q�q J�y(u�5<M|6C>��\u$!�UޝM�T;��p�]��.�7�{�>��9�H�dţ�G	��O��ɶ���#iк���gT�G��>�${S�
bj�}-�L�]ٞØ�!ȵ*�{�x�e׸�!�O�m܇�	����!�5}w��^f����eҪ+Ԥ�	�^�Ȓ ����s�~"ۇ�W�n��4���Y�a���_xf9�8�d�����73 �>Yt1Q@T�L>�&���n2W�,��G��N��p<ك�?�u8e�3,u	�Z�$�d��5/�M��/f8i_W��c�Vq`J�sw�e�׼c���v��'<	T�vp5;��F�	m8�VD���s=e=���Oƻ�M|���GfY��V��ZY�sb��j��W.W��h��!����"����WQ�s��9�w~�e�',�q��9���=�(�xh��#��Uk|q�.n[qz�b1�[��º��9!���Č�E;�{�����	9���ϦE��'�MR��r��K##5�/�g�s.I�)�Of@�|�O�;���\�Kcf<���%CLz?��u�������G�@�K�Y��߿����������5�|{[��79���miM*�YE�U��L`+��BR�!|m
��t�%����2��$l��W-� ��-��x['�^f�r2��Z䅗d�
�)��:������WF�`�}	&@J;�o�dvi4����BW8����F~Rh��9J9p���b���ѹ|���
BC�=g{�}p��u��b�2L�f��_��=a8K8�F˭��������
�+\��@��e�D�D��51�m��ſA�UX3�@�='�m�[)�[�ͷ405���Ӄ��/fp��i����g�S����e��sy>f��|v6��FH903�h-�M:#O���~Yr�!o'�2��\D.�u!Z��:Ӧ�Pw�T���I���~��dU��%�dbd��;����(q��#���?�.�4��o|��}טŉߍS����Mm���?9��f��̀��P�M��w
�]RӾz���!�����oe����D���3�!�9����I����!V�GJ���j�'c��+|ⴆ;ؠ���G���e��B��f0�$�r���]kx�e�uBv+]��DO᪁|�*{�-I:� m)[�f�S\���.�'��X>����r>�3x�N���WT ��Bɻ�}��s�{����No/��� �N�T;�;���GqN@/��ku�I��g'9~�O3��N��T56���Z'Z�� �ӧ̯hVNd�wnsm)��M��؃�%d��z��^�oF�x&�	l��f������J3d �R�8���~3��7����4-ˮY۶P #Pp6� e�J���g�~2R�#��辟F�:="��VL꠽iΪ�s{K�bW��A�kφ]�-r�rw-��vJ�/x)�@�����@��[)�z݊\P���+���u�����'������u�����S����������������aoX��f:a��^�K�!�y���0;�C�l�"�x9����A�js٩, z)͹�l�I�&7n�<hn�2�K�y�I'�cn��V�\*�B]]��F�+?F����6��ܧCH��a��ف���4����f�7��
�?bz�Mq9�V�ٻ�Ni��BZ����5j�9��>A�Q�E}(�� <p�3�u�³T�����Ϸ���f���Ȓ��hC\%��𿺏�|B�0�ԣ��w{�ew���ɔ`��x8�ڍ�O�3�6nrK�����N��X�n�W��Oz�q���З�{l ������9,F~�n�g3X:Y�R��aFg]w�/	HX��m<�xNp��S���{<��I�fS��1�o����iSz�6��F�={�,�����`�w���W޺9�>�m˾U��Ћ��$��O�Y:����*�!��2g�I��{w72'>(��Y2�԰��t"	��({//G�������wI)��:#��X)��x�Ш��ݰ�8Y��&��z��;R�Zq��Ε;94'��uDS��荹!�E�0"B݇�����Z�J<��f�i�
v��,�|6��3D)s��R|�!EFR�Աl}l�@��TPw0D�Q餾s��da_V�2K��p�8�"�$�4��l���d��D���}�!,[-��&���=hي/Q����U]D�����'��;�~��y�[��)��͐�	�6\�t�������7����Y��Ws�F��.�Us:h-�m��H��<��j
9�98��ӻՆ;!K<�6|<:�0�p�NN���BL[#[���;<��\ Q1�z�G��r$��)��ks���]�B�,;>	K�4C�vpZ�u��8���J�!n��FȔ����р�uzd��"�W>��X�hw	��U���� ��"�78���2K˻t'I��]�1%�Eئ�V�؞B �f���\_�	'�Fuٌ{�gt��$O���܁����O�,]p����Kq�.N��CX3��4�W$�����BΪ]��I2�;L�N����jf�}���V*�ttv)�/�ZJ�%,m���9�2(���3lg{���C�G���'�cO+����;���\�p����b�Ofp^���T�b�!ۥE]�.��kG��~m��b�~��A�<gD�q�3j�g~��ܼR�<t�:׭e&�p�#�;�ư���}	 -���+ؘ"��$j� �� �8�~�'���(Y���k���r�@��<t����*79��	 �F+S/O����ۏ=Ho�6ʬ�1S�����#!Nn�G ��C�5�VW(�ʰ�f��M��^?���Ms���}>!����-dR�<{��߇���K}UX�P�y�Eq��G�}Q�O��K�K�.���G7����k��v	Vw۹LzV��~Ht,��'}"����{��)�/}�Q(��D�𤱔�f�rR$�a�k��`�\5�Ek4��TZܫX|�[#�K2~���/��P:J����x�q_�%Ȝ��»��&���A���	�НJ�J@r�:�3��?��m���)���ӓ��^��s�%R����i,^��kƝ;%����Da��)�U���s�uM�[�	���OI3��s��,t���U��q�ռJ��u^a���i�sƐ~1B9�rY�� ?����b
�˨����Y�"I^E�h� '�n�$��� ն��8���[;Q��jR<�
Ee�=��$��W�̕x�,_Oo��7���~%��xB��>) ��͕v|�e6s����N�.��~1�x�ː�U�x�2��숑N�O3!���N�o'F�D�DC
�n편Xb%o�tX�d��X{�Mp������w-��[-���.�5)���aK��t[���G���g鄤u!K�=*~�O�Fg)@
�z��,"c|����%Ql	x�I� 8��>n�J)�X��h�7���o��QO
<�bZV��%� F��)eNͺ>a���M���8��d!�"Q���{V� �b�@���yG�+;�1���7�,W^�K1&/"?�4B��ō    ��F`g�JI3�.�J��HE��*9�s��\�۳��#�����IC�҃���*��<��~~��D������g�m6_�l.��i��������M��8�V�/*����c�
�|�`��[3d�-�=!wzw��NF`�'d�V �WC<p�r]���;Ne�-��YI�1�!�H׶��\��k�^��nE���!=���hf��~�J.I���I�7���R����7�� �g�yVkmY�w��[^�^�+U��� 2qט7�V��	����
�����kO#��p�GL����5>gcfx�w�&�G��k�c�2�b���w'q��f��}�o��3G1��AR�|PIE� G�}��fإ���{�M��(_���?�Sꨤm�V��Sq��#y��@:E]�YϹ̐�G�%TʉBXF,�s�
>}���Fݵ��S��IW�o6�|B��yц�J���u��ZX\9����O�K��D��=o�X�F��L�) Y�(�M2 �����j�GTQqC��0"#D����I��`u���^�.S�0�yʏ��3����V�qP�k!�i2���9~��O���R�4u�����`�)MC�*�c��!�*��"�m$�4��W�Sh} }�"&���}2���8�F L=������b܅�����3j=(F�x*��b�)�0S��i?�cm��9�Zn9,*cO;%�c��/F�
��h�y����a��P��Z�C�'���EG[�OQ}�ሓWhO�����:-���"�S��E��H�z�#�A�sw�P�@		�N������pC�q����rb�5u�B�;Gie�I��1|gl׽z����9�	+��)�c
Z[s�,,s)ӥ��ޯ#~π�uz)>�ZK�n�T��6��:�UB��H�\�+�Fo�B���%�(ޥ�"䈳F��M��4i����j]��Tչ41]⢃�1t�f�ıՉ���i��j����ǵ���yb$/�F�T�Q\rf �*���n'w�q���n��܋���x�H�|RU[cG]�k^Ji��		j��O�E���+����&_p�)��i�u~�X�0�s��e�t-s�F9i.�B����|%_����2g��»A�NF8��ռ[Cj�W�}�	ޠ&��������]�{�+'��Q_&=�
)Ų��V����G�y$-)� ��1�ʟ��������3��.*�b�сx�>�ט�p��A�����jh�۵t_C���VzH.@�3��_�;���g�_9	����7r"G��Bo�"[�-#KzL�2C��D/f��'KlĒ�eo9F���V̛��u>&$�4B�#��.3.��X݇��s�t�,͵�,�~���0��K2:�.�Xf��a׊��,o��� �9�}�]�mT��ZO@�2xS��l�ZI��^&�h��'��)��1NvB��"�WX�|���vmAḨa�{o6~:{.'z4��/��k!7� Hł�՛E�C�O��ptY�����'��Y&[L;��.D4`����o�RzW��&��z�R���+���n�-eN���T��?$^<�0C�1��� D��' $�8��.��ᰯ�WR�w��z4�O��1Z��d��e�ưV����O��BʜO�,϶6�P��S��rRĨ����ze�'3$��i$��e,��L�R��a��������ՉaE^�KH'�%C$l����8�e��7���*,w9��e�]�����9�#��D�a�$xY�cذ.3�c�L�ʪ+/s9mZ�%����1�!�X��PO`�\{�;��č_Y��-�$j� B��+ѫ����u�i� ,���ǐfpbD �=z��6��M�48�n���m�Ś�e�ew����a��,D����|-^
��	w4I��\2�S?�	�R�BY��ݥ���?>�,s�F��P+�bi;�t$Ԝ��Zh��>.r(�	�'(�F���Y��sfn$�Z�O��<?��r"DD%��r����a,?53�-q���T�;_ǫ�*/|�r�1����3e��@�f�C������S8��/|2��W��r�L���S{Cɷ��V|}n�YDo���/�-u��i��Y)>/P<���r�|��O�8A�ҥ��=5x�4K
����Is3��W�����G��㑜��X=d2@�H9�ѕ6�atq_��N��,�(D��̯i��2�%��[�(F=YnmȥV�bX''
�����J���׍�;��Of����>�>2޸W��?q�(�R�l�A��j��^��� K���u��A�]x@��֖=��w���2� Gf����j�gGp���5갃�� �e^��U�'5��.�D|�ݴ:��������7�q~�)��D�8Gqv�Ү��
�(̢k1�X����o� p�H|����ă����S���׮AAy>��]��u����܀ѩ�
�(��*�A�.κ*x 2���5��z��>������V��1��\Djp#���w����5��j���pFdC{��������8�>>އ���<������7��\K>ҫ�c����#����ri\H�W�w��79��Y�9��"r�$��\�oZЭkX�擼A�Vd��EN'��6�Jcغ�)��{�;첒�����t`>A�O8�3"B�%��-��-t1�RcY𗏘��>����+�V��+1�H�Lg�*�|�ٴ�9;���q��[<�ǶB}���(��$����c�2����(�T]��IfOV;��%˿���'�Zur��4)p�x�8�^fHG��x��rD�Ј�/��$��^����;��D�̐�ŗ�b' �r��.=o�T���3Цޙ���*~AUN�KwE��$d��B��I�y��v0��GQ>R�����J'C���7��T=L~\�m�kt�V��o�i�$'#�V�()�h��5wF�zM��.���A�-�bv�!���+_����d�}��ݝ��� �_��ђw����Me�����}��;�	u
Vg�K��dh%NQr�E�H�j�!Ϙ�4�5����f�j�AR�T����b���HB6A�p ����߆�������W4'Q=8��T|H�@��P�U�7
��'���ǧ�k=!��k)��.��Tԍ8�>m"�DF�çv�!�G��TI'��������0�o�չ�����U�)��� 7p­縊���H�<���=�Q<�ti�GE���ث�����-i�a�!m�����")��u���Y����/����Saߡ�>�D�~F���	?#V�:~���_��?�Ջ
�"��.ɢ�e�g�Iy�
<�/�A*)���n��W{V�y��ؗ���"��qޡ�O`.�'b��SDHye�>���>���}�`qﰚhרm��ğg?�����i�qd5\ť��gj҅���c��.3䋇�N�M��.x>��K���� ��Q���CF?A�D��rn��
9#=�q�k��s��2�����D�H�$֓G��&��gk�t��GV[({	!��;�;�x/3P�'Ü�ʜ�[M�e�R�6US��hT�,+��7����r�$έ2��l��S���U��� ����H׭-F�1 $��Bg��������w�����*W$i!��ԝb�.o�a��g	\�Y�ԉ���~��{�/�Ā��* �x��=H�[{��?F��2C�1Ϝ���vK���@|p�M��)�"'�A��pQ2���Z��@ �:F@���4͵�K����Ϯw�~pd=�[�d�b˗�+��%#�\C�(-�=�}��#.�Ą=)�}�N`�Z�7?q�[��m<��V.�Iq3��ԓ�i�};cF�����/K����5�S��'#�z2�9�A*���B*N7:c��/-�L(�OA��f��{�eIs�H�Ud{�0 ��&c����#i������~r�W���K�T���"H���[X���PV�z�W)}i�9�I����t�.ޏ��2����1'��9�A軥��p	sl�\nF�|Z�Mf}�x��4$���i�ſ�2d&|�	    �0�Xy�����P����e�%� �c��")��t{���;bѺ��P�9���g;��0:���-��}��/�~	�_u��^m�GǪ1[��]|'B�YTv̊q���O�Y���7#^Cczc�[|ag���v�e{�_)�f텮<{�;����;*��b�u�!K��I7�F����(�����b�P�٦^��ҳj��?kS�b�r3��kP�¤�D�ń��7����F��"����W4"ds��ݻ`/�s�<9␎��o�V����� ���
���|��f�j�L:Vt@G����D����ý�����͸_�&�\�U��̋N(/�Yy��i��/.~QK,��!�TjL"�CA�����xN�������w�Q���G�L��M����D	MK�*����1�WA��c�7l�E�D$�cr#m�,�����Ɨ�o�_���������������?~��+�x���F�:�Ic��x��k������(T/�G|���iA���_��%a�Ƞ�����qӉ�3�,�9r�y��G���������o�����������;LDt��g�ᙫG�躌x�8������Iƾ��/���r�����1 ���#g\Ip�jd����Ik?�)�?��#2�-ӫ�_�qk�co���X�d �2bO*M�eh�vG��7����&wŎ��u7���Ʃ�����j�_�~�{8�+�'����EKC�/�������$���[�Q�B�T���[{m�혟d�)j���dSh]�F�e" Yn�b:�^� ��ᘊ�0�I9�E7�Q�����A�f��w��M��6��Iq�[��#�D[���&�% ���������8�B�5��ݒ1@kmr!���3b���W�G�<�]�	Z8�D�m��R��#�Q��M��2}��ܔN�\N��-�-W3����L������Ke�h��&
��[�Cs�GhN�1�����_`�JW�PVs�F��,���h�8duت�y}��	)T�Jy�g�Y F�S�)H,��g�m9�����Y�/�����u��9�� ]c"L&�#b~,�P�4.�\)��t �9S��	��4cS�ֵm�~K�W��D��oaOn��x c D9���y}���/C
Q�q-7�c1+M���zG��5�� -���1��WA�����Ǜl�'�bg܎C=6/����{�~حH�
�l���{��[ &2 V@c�ז����'�~�v�|e���G�{��eG~I����|����O9��vI����i\J���Q��s*;~5��'<J�&�o�����X�
WD\����t�f��E��ǜ��|��V��V.7�GTk6�H���So��������
_a�~C��:�f'��xI(���_�S��ȿ+��a�OY�w&��ˎ;O_9tbn~�%�g�Z`�R��m|y�O�cv��^�y?�SW�闃wLj���4�SB8�%mJѫ�k�xI"�U�B�<����|T��e&w@h�2#�m`6䌫 LNX]j>��#��_E 1��Ƕ}Kh��<�d4-�s��/%~���G jdF �+��^��J���1��U���D�������
C�+�+/4{*�� B����CCdN��y�����Nw���������M�g��L��:��Y�f��'��3h�o�@|���G���Z�u&�!<Ͼ��y�X�sW�]��n���/�R����kMp�����P69�w��������kMЮL9�'� �e{,г����2�׿Q�Z�rׯ�/�V�K��|qhv9��Uw)K=Z�GE�Uk=��o�������������ۏ����/�3���K��M#�7��QNHzG3��46��HJ�[n�x����~����}n�2p��Z����	�q�I;���롪�G�@9n2'�!LN�t�+-@�]=2
;����?�,|'����y�U�J(k��N���˻vv˧7�����	B�v��P�+R��a�3PBa��٦ż�ݞ��������&����C�Ԑ�22U�H#�>�W��Y_%��iN�3�����'Zc�Y�в�<���A��'{@܍�)��9�$����)4g�rh���Μ��F�#ĻC'\2֎o��|�H�d�C�����TB^���^ܐ�}�L|��[�@����"��#̗� �MO�d�UUO4�h���N4��}��E3B�vE+`m�A��=��u�R�6z�g�4(�ɳ�����
��<I�Zβ3SK#7RKJ���@��>I}Ōоq�=��M�.U�M	a�=�=�h9�7�]�:�i��e�Xn:4��}���4�������ܖ����J!�d7C�g�r�g���Y�Qw�	���YY�/@��\�.��Ia~��ܝ������m��T��3�F�q�xӍ߼�f5�x��Zp-�, .t+3�q��5�W
��Aw|W9֒���ЌS���n������l��kW�T54	n�R/@C��U�3;M\�L\#[B������m
��-���wJ�Cɒ��\W�_Ί��p�T���r�[{���z��qTh��I��)���t�[��w;�����������;_R檖f��|���E�W�]'�m�u��j�Rn೵,#��u�h�Н�
lන�^�!����B���Va���:؂⇊�F�Wd�Miz�FJ�1w�߃�r�� �����@��${<�D�s���􌙇��@��V�,�
�$���^-�7���y���O�+�D��"{��˰a)GU!<���@s&2;�/���|h�3�Ȫ����*]��G�hk����ml��mM_`�~SUS��Z �����4<�dQ��D�i��W��J����Yo�Ӕ����� ��4� ��:+��T�~����9�m� �.��	g�4Y�Y�S��� ����F9#oɀ���E;'��F"����6���D�ԛP�];��	G�5�U��Nx0W�x�D`(�ԛr�<ۄ,��C]�$tq"�������/q��eL ����b�Қ���J��� ���O�e~i�����7�qN2ۮ�j<�p��rD��י:�o�&��L�`j.7��%��,i߱�PC���G��O4�;.�-0���M���������(<�J$�f^cL�}��Sq��z�Zt�
����?$�sV��uгl6�O9�+�lkX|���]b�q�5�!9���y= 0`�-��G��H�}a���p�佻��<��<?0��\n������UJ�\KN���V���3:f�1�EN�v��H�o
�7�ȳ��>Bʠ�����C򿉀ڍ��6dNZ���j�_�>��oKW�[��1h1�X�˪���Vh���/o�� �#o�E��G�r6_&&7O\�����y"Ԁ7���q	�"���M��t���[�y��Q-��E�;1�]FZ��E���_% �7#�mH�;��@�Be�¨�ddB��f��]�-ڌ����rs6<�%&�, D;��?������h<Y!.-��k輒}��!�oB�&�H^i�=%��=��1~�B1��q�V�����NV�Q�]�����Xḛ!&|s��S��f�Iݽ�4*�M+���������*Ƚ7�Ҁ\<����CN=�Bi�%{w���&)��Wn��as�-ܲŭ\J؆������ᅐw`*�rU�)��QХ���B��1[�Sv;���'7���8����$p�R�'�<�(���??0�����(Y�Š��T�;���u[XUGXD���{�w��M����ng�>c�^	�u��T㱷�Υ?���³;F3��[��#�iW߉��d�Mt���s�z����-�W-�o�Ǭ�IGʭ����A�Jc [�3>=�r�߼<�i7��6�E�������w�I3	����#_.������u���j
ylp���''���o�az��y[�20�_��!PwB��Cŀ�{�m�b�^}f` �"�7�A@r�,i�{U#�-���"��    �����2��7\IBP� Ǵr�1�w��E* ^U�,O��D`"�0Bs�LN���-r(Hd�#��Hp]�_Ş�7�����hYkH/ʻ:F:���>=.�-����#� �3-�ªzK=י� ��	k]�b8�<[�'��\'��&�������;�!���O����M�ߑ�-�=���W'ĭ�\��(?=0�[Q�k��|����{�<�A$��Y�A�=����W؜o*�G����.�%��Y�H`ͤ�8��S�+�so^OX� �z���X,G<{:=��K_O�:�E����7yR+��
[̡6��ơ!jX����Q������W9�VZ:9��(���,i7�dy5Ͽ/�|�ڏ�˫��ו��C�(��ģ�r�^gf���?mSHś�Ӽ),4Ƀv��Kh��8��^�Z;�_�1]\����]v�(�Y�VN�㽵����ڨ����旉�՛ލ���@n�E�.��ભ������1�o5:��([n�x�P����=/����!(����;��F��F�i��uM��I,,!�S��y(���/�w�w����ޘ1L91��f452NvO��
��T��6���	�����&�����`��R����K_��VAE���(?~�h�(���0��W�ɕ������y��S���:f�ѥT�~��� ˌ�Ty4����_��J�����w������ёv��n{��w�GS�vuӐ���!5��x�d���"d�Yn�� 0VOWVx�V��$��Ak�&���t�#�h���*����q֑�j(�"�8�Қ��?<05G�R-5�ؚu���'
�C#T5r��4���C�F�k���K�����F<Lf3���y���[�?������HZ�y�Y�z&+)Ϸ�Ήg9	 ��ȫ7}�u])�̕�o@k���4$}������<��ϳ���|c��$ �ف�f(��4������՟���./�jvSV�u�5U��#��K�lۤ��sO?�/�ozH&Vn�@�����\���.%f gr>��m�wŽ�"c�%�݈S�L9����������t��k[�OG��q�xm�榑jbSK��\�w��4C��UO��~�C`$��#[���"��2B1��ᨷ֕tG�Z3��'�L{c��B�I@g�i*cU~b��8t�{�q:=��$oǚ0ݠ�,��*�I��!�A;�c�D�����їɕ��ѝ�/�����S8|5d�v�=Z2�#0�M�ҍS`50�ɜz��p�f-�bkԱ���O�i�(���8-;J�qu� �s�gi�(?��q�I".7�����4�*Fva
[Ho����l:��ǸFXߔqG=��:�4lֱ�b PqS�W&�����5��=��C}�����=�:��f&����_T4��!e̱���u?~��)V_�ţ��J���zQ�H!�|�Ӈ�Q�����g	����ƅ�c:N%Wǵ�Ơ7�8{=�N��BQs��u�7�l�-
ڸ�,+���5����jt����$������;������V��)�.�@���ߗ��h��������� �7&1��������i� �3�����L>��X��f��@�I(�1�=����Y��&
O�D?�����w�ϖC�VTnJ��d9|E���f 1�e;&�m5����W�|�C�������&�L�;���|l��=�3�\]�e���uj���rk~ۧe��9�|*	M�#����/K~��W#Q��6R7�Cf���.�k(zp�o��P�korS�ފ�Kӊ�U>����� �k�[�O�| |��ɼ�GT;KyOz�ҝ��w�!H�?��`yw��E���l��sN�:r ��+��Ҥ�s�y�����Y?8����~8�o`��^	�_�q�A(���n|I^l�o;
.�nj�G����Y5�:]g͟��V��j�V]Za�;P"�Za@��s�c�?� �������5u��1h#�vc��_��99�S�����C����sZ�*R#���e&�AF��'��]Eaz��H#/XkI2���&a���E��}������X������+F/��$q]칍�)���e����5�1���٦�$ġ D9��_R���~�%0�C���xS+m����"���4��x<�����KqY�x���rE�O{/��wܭ����|�'�V�	aZ���#8)0�]ޥ)��G:p��[��;�}+���7�������z��DwmP=�g}��/���2
Ť�S���]���ݓ\�+��p���f ����U~����~Q�8��H��h�=-��)s��� ?]���7�Y���rvM5�#1>2���f;�� ���W.�a+��F��Po�"��j�ط�X�b�	�b��8k����W
�X��0�$c'.~7���ۜ;��@�b����U��kac���	�y���<K4IkԶ{T���nR8?xV��o�ݒ� R7�%aw�Ah�Ҩ��н�+�~Yu����������	=�;v?0)G�#H*՜@�)kŪƃ��~	�������� _��Iy��*���͡�א�cw�B�����K˂�#�/�{S�(�D}�N)�"_Z��ok���.��`�Q�H���2s��ny�|���X����5�Q��ۦ�s���&��Y4lbW<C�����Jr�AN�y�ʴ�+�9�zN�̂O�}F����r3C̝��䴊��	�W�Әm�������v�$��
&5}7��������`1on4�=xT�#0o-9������LK=I��,�*�W�����q���	�YkE/v�^�PDb���(���&2
��u�5?�
�#l�K��fG�Mh�E9�o5k�l�JW���9ƾI~5е|�cZ͙F���pA~s?��	B�ay��^�F_aPt3��}����(9Vu
�����ͳ���S�j�ѕH��t橌VړR����A��y|��oT_"�7c6��#��z4T���$�#b%�y���;0%��J�|5\��$���-��Z\�b�N>����R�_97�7�3�5��	�B��w
����p��"1�)�豺��ךV�'��"��)Tu�1�Mc���{~\��r�ۼ�Lҋ�3j(:��
��.G�!�<>Ôx�j���_�P)1���e8̭�'-�g;0��	z��b�n
�
�ͪG�-�%<2�g�#q-������K`��� C�%7��N�'ǝD=��nǓ*�R��2Tn7�
+��#�0�J��!w���ĥ~�Q�t���"��-fG���k�Pɴ1F<�����¡_�*�����ͮ3E���;��lg�t��mߝ���E܈�!��¸(d�� �-�Ԙ����\sPk$�}j��t�׉�����-���#��0�V����|��?>o����]�1�5ܻ+�GyX�\ڐ7<���u>�9��<:���׌F9%L���:��p�{eM��+���B������5\Z����f�����>J��*����'�K�ۍB�6ffKm\,`�}�`&�iW`�	���C��O�)KǇh4��z�|��,�O~���/�/�N�0w/V	�:=���%���x۝��|��јJȅ���}���8@"�ط%��]��>G/O���[`p+	��oz(������3rωfͲ����15�J�n�w���l����SE���SwE���{y|�R�iQ�o���$��~ny$.EA�O�MMy<�%	b雾�#��KI��#���!��^c�Y�~|u;�����GI-�H*��S�`̌C�VJ���S?͘�B36��DN��z39��>�k싂R�I���vE���F���Ra��n暲��ѫQ�JدR��~z���ђϋ��)zw�۫6-7��Tj�>�O�k�9_2R��q�A�g������Xk��D-F�'��ʠ�d���O�|���JI�E.���B����C���<4B�<�������\�q3�͎��9Ǩ}���0�xB��U����t��-4�$�X6��W,��fc���J-s��k�'D�-0�Z�U�    �mN�i�D��4Ye��|���;0��,��A����b |� 5����,��_V��.V��4{j�3����ˌ�QI�7:�{�� l��M7�8�-���5�-\��M��]�l��K`���j�ih��v/+��B� `;���Փ���ݟ~]#0\^�q3�dD�˨�A��-n���Z�o������n�.�m�g�K�Ԟ1�����f�u�c���Zo<�zۥ�z�ǎ�w���'4�	���_*|e�TB׽$�	��V���5(�H���^�?L��#�_6�
�����l7������Nߢ���0
᠄h9[��x:E�~�Ɯ��Zܸ�Ic�dP̼̙S��%��
�rΓj��H^�%߄A�b�H��p����ϼ�ȩ/�����_R��WA�V<Z���Lz?kUO�-d���!�;?��+����F��8�Y��Sp�����"8#+�yz�c&:��o�%��=Tqj���`X�[�m�E���P}�U������=�DIҴ"0�i�H��?A`�՚]�ݱap�t�&"'�������N�Of"�k�������ڳ�ZB"��h	�-���l!���&|ɗ\ˍ�q�Ĕk��꡴�f/:�8g��Gڷ�_�ە�MeV���B(�W 9��G��u�>�[)s�)0��`&��^V�z���vJ�]izz�)��U�FfV�s'!l.�A��S�mg�̏/b�[A��E\�:"m�$l�_)fq:����0�y�/q)�ՀA�E`v��<T1{w� �uG`�	�%~>#�xrm��'��c.�
�/�2c�iH�`ӄu�(���\�sq)��-�R�����k���k����0F�Yj��Q��9�R��W�[ ��ZÏ�����9j/�
)7�����
r�ł\s�'��\�<E+~~`*���QY�J��f�✨f/F�a�H6y����#�y�����-`D�l���ҽ���'�w`��-�hh́�笚�
��5%\j�����Vyx��G`�+��o�򰿲�\�� 3� ������g�<�O�c�_V������vR�gǭ�	��ۚ��ѳ��;0����Ǎ(|ּ��8@9z
Gr��N;Ϻ��9ƣ�E��,G{���v�f�u�c6[��T�(���1������J_���M��}T���UZ��{��S�e�7T	����J�&6���xM�GLj��y���Ш^������W>�{��iQL������Y=a��7�/���ڤO@o��>���R9;S�q���'k�1T{i ���Qg+��v^�ݖ ����2��}2�C�6�`z��|��O>���0+�C3�AfCN]X�g-B����FLr��F�mP�h*1�d�`�
0���L{��zo�c�+��?ѝ���p*� �LX:�^�=*���2F�]�wd��t6�zx`�O�U��Ej)7S��J[��cf��5.I`N�=u�\�� ���[Ʈ�ԱŶ�O�s���E��Z�N{x��;.�_^W7+����� T�3�U�rd��\�^9����xQ �SG�1L���<'r/�q��W}F��_�,9*�>��PY�"����X�����ۯ(܅��=I��⨪��::qj�ի�E'����S�w�����U�n��Dr����
�� �z�yme�'���Ն���G� 7wf p��$������q1�v�P��܅�p��+�0|���$�Bg����ڦ�Ҙ=��(�_ٲ����2����Zڊ�Y]CtZ�K�a^��5@`��v�ReW9�B`�OO֚�d�����2�L�/|�v�δ���KR-��*s'��Q��3v9��</E���V��;��ӡva���)o#"�?�����J�f��Rg�	�w��E;Q��X���~z`8����՛w�|����7�l�>	]d��y}���G`��������j��,'Z;�@����r
={X��b��d�0n5���ǀ��|�����~3���K��"��RoJr�KY5^��!��r��*���ǣ��_�+��U��Q� ���ONV��U���<�N�`JBT�1��ה5�V/��ò��~���9�߮$���F�-���� �٪9��1�h�|���7�iF7�B�W�^ZȽ{F��������Y����^D���h>kO�B���q��̤�I��#�G1-zS�g��QM�`���
i��Xj<@�m}�ND��HOk\npo>`�K<�0ac	A�{G=����{��K�}�ŭ$��٣��1C�WN��g��dC=����B��^��7J�yK�q���;��Nt�y��1����H�0y��1k�j5 ^�¤نBcØJ������JyyQ��go�9�c��Y����ڹ���oQl�0���� �w�kD"��4{�)����1�㏒~��"鹸�b�U��v��æ����`�,g���[Iپ���`r��8Ea�-bC'����8f�ӫb�\M~���*`][`��G�6in���a�>>�X���K�id]��F#�3�{�es	ϝɏ�1T)s�7#�$��}.^ -F�'	��ȏ?] �#0��
~�s2������ۍM����&�9q�~���ˤݔc�Q������zrלF��s��	vLXz7�)S-+ J�(|>�҇�b�D+���||�ףuL+{��!e�p��~T*n��S��Y���������;_�ʞ���%i��w:���u:��Y��S���x�llv��e]��Ҙg ����͕��ƭ�=��)�!
� ����[�i�z�4.�w@5�4I+�>�(E`�s%��2�@�p�b4 ����) Ź��y�r�~d���茻�9��q��!��)�'�ى�:�t���T����ȯ��:�)���وI픨,`s��]?�/�i�0��5$\�7�E��*�v��>����1���3Z=�݉�/�i�� PmWS�}��r��':㝤�[x�>�rȆe�M�@l�����Y�WȮ�&:ٺ7]O��tgU�zs׶ܝ�x���0�;FWe���j{|U���j��ZJ�Q�{I��[WhE�P0��3�BO/�E`������Ȩy�n�j5YH�o�e)s��`���jiW��B{.�R`�WkG�(��֖����ko��+�-r3���NH��EÏ�%�֢����9��!O#�$�nLsl�m鴨0/��'`�l4}�=~ôh����=��ՕW�Mm
�	h�v�6+ΤU��7��{�J����Bd��S�� ժ��)��p�|z�6�饍n�������.�F�(Y呴�1|���+L�q�z7}P��R0�td�J��""����D��K��/_�\�^:��r#�dC*�`y[�4������y����{��]��i\9j�E<-Tj�+��F~�\4���-z�R}��YӉ�o��H�7N8@�3Mi��;��W�L7@%|�[�d�co�����R�3��,����ٿA`Z�7%I.��3����ɶ������3���9�囗�=�ɞ�S��y�?�<A�����!01��.7}���� ��^�j������xE����@�ˎS�x�A��n��U�:��ɗ������f�l��Qr��.�pr~�iL�^}/�m�������8�}���^<�K����k�sb��
`�J�<k���S�M�dM��_��]��� ǀ���zҨ�TQ�[���Ս��v�n791��"�Kn��K����SQĞn����c��н�v�:�8�8bީ!�����;0��+�MAI��>$,��O�aM��f+��O.^zqv����	��G�Xk��ϧn��hs��ߺ;�Tn9���)M�Pz=vǙ^k��ճ9�&�Z�� �]����J��C���5dw_U�|�8�;0�S�F�s1�}�=\�[�&���;%e�g� ߁���V�&��<�w�TV��ɺ�B���2��)i�j��|3�[��4����E!��|k��c,�p�Vn7P�k��G����y�ή@7^���1�����E�`(�gҶ<��wc.��q|j�g>�V    �p@��7��M�YJ�-q����s���mb���b︀)�+�(���kO?Ƚ�1w�C�� 06�sq���;0��̾�h��ή���~�����.�3��\��bJ�69�i�,�1�ɤ��H=�gss=-S+�l��w`H^����3��Ӫ�_A�9�(�[]�Z�.��1��W�z����N���Rj��g\ޝBG���p�q��_qt�ݼ��:�5��u�~N2ʖ&��G���/�������*v����vzW�-�,���)D�wY9#���iD�޴!�Fܰ-R���9Rgn�����=\���Ѯ!��fzNO��[CVH#��F�;�����?���ɯ�܀�5��e�u��k�pA�i���r�Ň�!0A�_��ݸb�3��J�P��D�U�JO�� ��Գ\d����vO�Cu<M�AW�Տ2�������W��e�2���v^���h)iD�(�,��lj�?x�*�E=��Bl�Ӝ@~����9vM�,��h�e7�X���-�Ȩ$-�-x0� ��2��As���n�� 7U���n{��R��^���s�ۘ�x�� 9/�,7Y��R�6=MG�eG~��5��c!�8�<��0cqە���X�i��ŎAzy�ƶ�KhOk���f��n |�;W��ɗ���^���
.�C����w`X^b���f����'f�����[[��>����Q�\�"0c[T�a-:I�R�n��J��4?�(!0����<�9��橅�+��L�;�CE�&�������S�֛w�l���.�>���W8�Z'Q��=����{�Y�nn���**;*NA�h$@����u�M�/aӛ0��vS�=!�	�7,��3u�`�-_z:% �����ܘ4��o2
+s�(���sjo{��מ�E�1`/�M�Bޅ�vk��&��تj#�+�{"a��1�����!d>����| d����=�W+~բ�%�f4� �SGus�a{�E��'ص{1�I���浦�J�!/�R�Y�3m��fC|=*�a�
dd�[Z�T"gm~/D���W�m��_����Wm�?�/���E={��6M����Y�f���d�Y�w�ߩY~�0�1���|�g�(Z� �(Gӱ	�0�χOa"0�Q`�=\�CF4gO	���*ɒ&�S�r����o�^!0zc�=Ǧ㤉���}��q�"ϣ,)�>�2��Y��_��Q�j��/��98J�ɴ#%t�����&��Ę/P��^�͓���[�Z��������Ssh��bEo� r�9����j�B��e��f[��F��W�#�m퓴P�9-��&@�{r.�I<�Bl���~� %��
e=��QG	q��ܟS�'S^⓾;V�=����~��)��,�0�D���}p��w:�b��s��ep0p
(']������?e�,Ȯ��_�k)63������s�K�i�׽G�HT�3�+�=�M{H��_cO���덫�V�^Fh���)f\�~*��[�V���W��{���7w\<[�Ǝ��"r��H&���Og�v�h����'$S���s4�V\��xp��y<���	/%���'[�p���	�	��W���B�y:V�H��ō�MY �V���\;��Fޞ�
N��O�>@`H�Ho��<�K6+r/�q�7���Bk���Ͻ)����]O'��E�0O_o�p@�i���#�n
��;�[�T�Vp[w
WJ=���ch�/�����Wqp���46��X�Q��og�4v��*!����6�4+q�ej��ێ�T�&�u�T������wO:�r�\Z�^�S���!�{��
���x|`b�!�r�8дn ߔk�� �&���s���l=���F��K��!�g���i�z?n�h�i�y��p�#	??0�/@z���1!�֓i��6S�6��!��������Q���j�1�Õ<�D�=��V�k?)>���y�����fQv� �u�Ӓ�x�ۚ	{��1���	��F��[�ŭtZ� ��uєvZ��Cޓ𥣧?�E`��~#�F ��;��d��[Y�8{G����j�6�l5�$�L9�Pm%r��`}�<i����ڢ��ɉodJq�z�3����n��@���^Wۖ��s�}iQ��E7��8&�*lO����!+�����~�h��ƴ�|�Gڨ��H�dB�u@C��kIc��'�ȾN��I�Y�N�^�@���û��=�Ă��j���>ڬ����4=��*�n������5/7]M%ۦ9h5���XU�4�����^��J�jJ�Y�� m5��=E_�N���j��-���Rh._Y��=V��*h�PX�7M��\����ASګ��70��NQ�-Z��C����kyJ{��*C��lW�\��9,�r��J������@m�=}���Az�笧��N㘅_k�1��R�ᕏ����ί����DHK4y��,�N�KM٦�PA��|��j��T�B:��P��`� �O��Mj���tb��D�^$_6|u�h%��b�|�J�*��b��� �tA�a�n�{Ѡ?mQ--!aD��	�&�7��!&?������lK����6�g���ai:[4uHG|~`*�J�����-��(	����՝��Y�DO��4��F8B�bH���H��Óq���E�ǧW��\�7��d#�Ѣb�oyu�5M/���+j 08I;���ٙ0[�9��SN�Â��	vS�������>q�ڌ���{���Z:�Qڣ��c[y�"����C���i(j�d]gpg�%���z��Q��{�z���\t$8a�k�X���m�؉_5�g?����/����{�^N"$�H�����3�-&y>}�!�"/'�+b��:rr�h~T�?���� �=�J�Z��r3߿OG����� yXI��'�RV�Ӗ�gUy��W����h�Z�S�1
!R���}�r�@����zs��S�<S�0%kf1�Sɳ��Dc��i�&��;��9 aO��S2����{�[�N��Z^̜o�P�%n�Xȶs�SrN��<�%���t'y��ժt���R�+e��V&��sK�z������GDy?"��v3
��8?I���V�5d_�c~|�y���hǿ[F�]�aIa�l繃,f�QK��<�(��c���4*��>.���6�VO�5��2q�X��qǐ���7�ԇ�G��1��<*�_̏/�IT-��0��/n;赢��J^���ۡ���h����X{}��ڍ����2�9��WG��k�^�
��k?��T�M���+=[�>���Ŧ�i)�C6c�{������ �&t5�HEA����p��)��R������4�A����4�����c#|��yL �v��Ơ��~����c��R��su$Ѭ��5�$�VmX.���weT��;�/k���q�7��P ���g�QX�?7���RCج�E`�#0[)���K�ײUJc�AL�g~�ێ���������z�3��K\�T�4�Ǘ=~nC>D���n�4����;�����]�<e��p3}<zw0��G��	̎�$�Y�.9*��ڥՉ�(?Î{	)ukl���':!CSq�l��Ɯ�
2P���10*�8�ܷxND9ʳZ\3'黏ͳVz��;0�hћIS�{��&�}�@|l��R*�$���� �Sq]���&�[!HV[�<�\������Du�e���F�Z��$ǈ���nQ%(�tt^�=���K���MIiRY2d���;��4����=��x9o��P����덊���,SC^� ƨ��(�3h�0��O�p�F\n�y����v�-׷���_�J���� )����/�+�܂o>JiIk�X�Am�U�2���ۺ|�8J�t�!G�
0���<1ّN�������
e�+��Z�Y�^���=Oê�$8d�P���1�`r��ސGB�=�����R�6�D����B��Н���~6�&w�᠐`թ�I �����;0q[�(]����).H,]���0Ns�j�t����~�_E[�aJ�N/1�m9���T���.g�    �fz<��w�OmtcѶst����"0�9u�$@4�} .?�Q��b�|������R0/�T��..`�nZ�������S9'��.X7I�˞:�����t)E�FK{T���#�,jGz��%�M�p�g?�������o��{;�$16�tp?��-��֟����ԗ�|ÞukiѼ�M	mS�6<�a���v��Q5,,�.�m�s´0��o�҇�?��T�x>z~`�Xx8\p��b�����>�g��9	�e��Q5�
�1�r3��skh�U���,�̲�-�y|��!���i�fHHHs�
���70?;��$��Yb}$���ءJK���d��+�R�2A��>>���F�y���=mK��4���<��՗=�V��[@[6�a�����)`n�6{B�Q�{�ꏯ�-S[Q����9��I�ê�{��F%d�k>�+�����Wu�e�����`C�wC�&�
�^��,���t�,W�:ґe \��l�V��s��9������۾U�Q"����Ơ�}2��ГP%,�\�N�<��Ңa��&|A	B=���S>'��H�Ks����~�l�G`�%��� �sX|��	x#崆�C{z�B�;0�@��t�|�L��6r����;#���rL�w�����9ڻ�lx�Mk�P"i�"�t�4g���"6/`x��v��ǻ�p��5K�Τw��#_��7��c<rL�W�)@��YFu���z<�D`���r��\J�;�H�n1k6������*��Op��|�����r���L��h5Y�7�<&�w���z���k�1p�M�^�� ���1(<BFݺ���4�6���},����3G�!hR�ۙ�x��	v��`n7VU�X�60�\IONf� }���3?{4��o�_M�ތb5�>�߈���縐�&ZYlL�<�V�P�l.�.�uo
�K��m���Z2�D<23?��ۢ�����1�Y��D�a�n����6�`�������K���;e[/�$ v�-�&;�-&w�T�;0��f7�%�`C���xW�CR��K�e����H=<0�-���Do^"G��M�a>����c�F��(�zz1<#/P�y% Qڹꎦf��iaRˑ�O�ǔw�wQ���ڝ�P�޳B��B2Wb��}��l�|�u��Wk7�wV#���%�!�p�'
U����K
�d.��x�
�-���tR���%5��e?~ü���o���8��lX垼l\݋�6���g^z��d����f\<s,M�U���4��W��B���0���^��Yƨ5
�34^���*)�(�6���7�D`ޕp��nj�����;���ig7`Ň�6�#�!��۴�^{�p�����%!&KG��=�Z�#�Br�n�:(Kr[H1M�S-��ܽ�f;n%�*�� �D2՛t�)����?��;ʗ:��I��q�O�3�DE}Z!����h5�J����5p��6R��s�7䃉���*��Xʤ3;(�o@�(o���Li�{��c��8I�D��K��5b�����)�Ь鍌�v,�ĪR��1.^���s>��F�_��GQ��D`,�)��=�<��w�"�H�m�~�~��|X��]�z� S��S�q�����K_�n�0�(��ۀF���绵BT�S~
[ʊy}��4�@�碂l��DiGɷ��ʞI|�������%U�7������Ζך��(M.�P�ՠy�_` ��#B��GZ1X=�#]/L�^en&�?��|�������+����lghٜ�m���@
��&�R_�xZvyp�'_�����}�B��G���G���IcԷw�aM`��XJD
��#ݤFj�z���;E������;����#�\�U?��܅%�7&��"�u"��� ��/��o���ʊyZfd�S<qA�:cɑ���������ڍ�A���*��+��Ph�vv=��G
`?Lb7S�5V�C>/�@���ף#�������_�WofW����\sN�b+=]j�х�>����x�G��.�4��Q����A�lfb�����rۼ���jL7#�����8��x�����b�Q<ӱ�ϖ$0��,bn����EŞl=��
P�����[���Ǜ�jl��óbǜV<�F�M�g����_���F�B��}���;e�ģ�2�����G��<����E����#�ʗz��zȍ��	&#Bo�eH`����>����nA�h�1vv�]jr?�����
�t��7�@k�	K��Lo��]�T*��������	�>��3�顛*�jO]�]��.�g�V�&�����`�V�ʍe]z1ߩ��90���y���������7���׶{A�'�O#���Ev��S_��R?+�z�[ʱ�U-J�>Y �e�pK�:���L��O�.������Úwr�����4Y�_�Ɇ��L�q���%�hɑW?��l�͟A�?���������O�5�� �c��.�7����e[�w�Z�q��ڨ`.]�g@�ĳ�{�@W�Q]hG9<w�ù3,�vȧ���^PZ>6�zs�DټcJKSyn-�TJ�4&u{}���Ч
�3��Z���n?sf��Q�3�n�����SI���F�0BF$߼����lt�-O�#��o�I\�cHb7�}Rkvc���'i�2ܭH�0T'S;�'�YE����#
b՜�|lls*dD!�=����� �Cd7Zs[3/!O��x�xH�p��?���⯥���^��aCx��v���$"HF�כg$0���Tn�+�>u��<E��g/i�����Fzԡ8��0�tv�Y�&Q#��v�� o�Ge��k� �Sn"Vx^���#Nі��9Q��S�$��x{��G����J�E���e���1���W�����3�>�@���|��Q�GcbQ�rIQI�8�Aߔ:�����u(�����խ���W�����L���1ua��3�iDi�7���4��CO� &����l�#��N� �0պ��^!�K|�����|c�xڽ������Ub��+!_<���#�l��v�Y�ڽ����}(&��@ s���AqϢT�NK'����H�]!H��?|$0��q"7Z?�GY���LL�غV����	-��`R���&��ں�>"�R��q_�ĭ+$����.0���7i7.d=x�ڨ�������$SТ���w��SY�t�mt.�
V�8I4K��0�iX���z~g?>9�r��.�9Eӊj�J�9�!��fD+����� �%�k���j6`UI��fv�9��6۴��N=�|amzc��T9m��Q��j��Q/Q�3���듒?65-��E����|2�C��9��V6�6����gk�ֆtׂ��i�'-�[��]�^���a# =��G/��ޘ���fҀ�qeG���OQ�R;��*2]��4q�b�&��y^���W}_��)�����:�y�t[�W�kE�g��N	C�y��n�]���E-�!��դ&��OLeq���#�Dj��n;}���0L�nd��u�1� ��nI��ɥ)!�y�����%`�����>ǧ��q8�;K9v�0���� ��cZ�.��n�z���L���<�Z�F�c� ���I$��_����U�8J�d�;-5J�.r��<���)��t������=��p�o�`ڬQH�ۋ� �������`�������b�D!_4jK���볒d�ac�v����.�S�=K쨨K����2<r?�}���Q7vLӛ^2���C n�F�V�@�S8��_��EmN��(�2��櫞3V�
�1W�HK��] �G���XH��.G�,�-"�x�ۭ�ul�ַ��0\?��(�V�-Kvِ�=��u����T�mE}}u�D���͛�͹�`-;�|��p s�6��G�0�!i7㊪�N!N+��1�#��{�~�o|�>Օo�����q�zʣj�edK�s������eИ�Y7U��ӿ'ۙ����f�;[����z�0~Z�D�&�v� ������w���mk���9&.�5�� (��c�����U�[�D%�r��E�    ہ�ǀ��t��Vjdk���\r1Z�q0�:�����>dA�/�cpl��y�����u�r�u�5��?]'0���W&ճ�j#��i���A}'���+{Ƒ��Kxq�k�r8{|u�҃�f7R��z���?)��9M��w�U��%�(����Ԯ´����w`}���R�U�WC�.��g��6~����/lB��������?6����M���Fݸ��\N�CG��®w��v|�;��
�Qn��V��m'��a0��=8�������R�%����!�]�G�e�ï�M��3�'��:�o=�?t��PCw�Ƚ#[1��8���\Ǣ�m���_^q-��͆�R	h���ϣT8&��phh�N���-	-�z#hO��(�GK��=J�YYq�9��u�l�\�����5ml�%�F(�}�����C�o������/B�������$��f�xi����KJ.R�t�󯦚o� ȍք'i'<e�43o��F1�# 9��^�H�!c\�^�AJT�{� ��`!+G�F�/�l��=�~`0eZ�Ջ ���<�{�S1��������/g�O�8 G	kDLIM��*�d���u�k}�^�<z��(7�����˖�#��ŗe�G��5��۹��� ��M>cdSe�;��K`��7�56E����� F��9}3>#;cl͑����^,}1x�o�'���O����|C��l��h%8�deE�:�#x���?��ӔP]��#8�Q �F>�D**�={ܗ,�2�����~�����p6�Z�ԙN�;�J��d�"�^[Z��pn��j���;�:��{a 㛠�M�5��v`�G��9�7)icD�z,�H����/L�������mU�M�\q�(����BY='�k|l��`�*��@]�Pek�P����2�3GR���W��~�����ͧ�3k�U�ޛ`=
H�B��	�U�}�� �A��/v`pA�W�.<H\F�4��Gk�����'��z��È�Nӂ$���{��@��.��p�w_�0��'B/ߴVN��2�kd��3�i'6�No���/0�7�/����-���%�;Q@�Y�}��X�xw�`��a��27�oQ.A`��A�1��ik���X�n��~���o8��J�yt��FE К2�wW�eap��{pӃȞ�)3�st&(b�-9;�z=�yFg�R�W�����qo����&��
�(�{���rۦ�����Ff��kW<�6͔�2�����`|ww�0��8H76��W*�ֲ�<���y�S(��������=���l�]`�N�8�U6��9X��7 ���n�R�.<����91�k�2����iL����F��I�9f�3[�f�b'SxG�2��5d�	~��oSԜD�@�G���ڋ�B4��4&F>�90u�:{���w`V׸Zq�8F����_�k*%������>)��K��T(Ri�A��+?�?�v�� R���<��Sr7틌!@����1-�R�+{q�aS���ߋW�b�R��uʮ���c�����&p���N�wDK��)�W�}ZC�F��g맭]���l�����d �������i�ϳ���k��I�A��"h�E�#י�U��a`䝨�ъ����i5���<�K���X�?�m-�F���C#V��,>��y�v�"���N ��zD�
e���k������m��7��fۈ�e�6{������ȴg��������Rs�����u�=g�'�����Xk
�N��^�W��'�&�y���Tp����7��B6f�}W��l���G�R��2<��V���y�d�RUm�X��Y�Q�"�2�j�C�b-/c�
���s3EH`�A�M�WWһ��cmϲ�dS�ʇ�e�t�zʯ��}�1�v��;
��G=�4�d|�4-(Y�����aP�����E�ah�īM8�[$�X����N3�o/{�7�E`?�����<"ri��F��g����c�nD��4�C�|R�����Һ�X�����>����;�&���5�����ڵ�&'�x��^��I)p��Q3�`��8ڦ␦*9th멎[l��3�ww�>�dWrvk�H��>��7�R�[��r�pԭ~����.8�u�3;@��x{��r��ߝ߳C���4J���<k�#� 3�<�#m�&��ٗxD�+���'0-o��n���)ǘ�M��i:Ӌ/b�( e-�wk�0�����7�g�����tS��%���r�X�~��2R�)5�y:�Kwٔ����٣t.ڴz�2��=]#��
��؟Y�]����V����\�nU挤�~` ?ڌnjȶP��Dx�I���g���r*�mq��^a��3/md��X�t�\����6����?�%�6���?��\�D���������S�F��Z���u͛����[�J��Wﱿw��<k�C�������J�@%R������ F���|c�HY �5
Z:�X�p���~�-J���c�/�a-����~bA��(㪋P��	?j6xU"��_�8T�t�����r6�x�&io'��O�pc:
L�B񖡎�V���%
��߭K� #�ak��s�>��D�=i5�H+Au�R:���	�<�OJm���tլ��\atS���vV��;6h񑗔�Xێ��r�����4ȍ�B�3��tw��ӂW�|m���9���Xz=W��9�-�v�+���ӕ��z	�;�����������ֹ��@��c#�F{&�i�e�; ������~9����e�K� �6xݦ��{�� ����5?�,��f	{��e�eOO���l��z`<G�؍d�D�}J�ឥ�<cvA�:���x�\ ��ԮZX`�5FJ��4bmQ1�!�4J`|�~�M��1���b���cb�2Gd%�Zq��V�*4ޭ�� �A�z���}o߱��:�fd�q�F��R~���0��?䋛���M�2!�4�no�lm��s�ˍ?`�?P�o䀩���G-M�z�6&�2q�i�\��>���~P�otY�����b��sP�2xs�Z#[	:�����G�H�ӛ�l�����N�Q�U�9���t�(��o ȧ5�h�v�َ%M_��x�X�f��k�j������i܅X�g��\p-�`&?����B��P�6=����C���R{���T�@�l��=L�����7X{p�������Ur[%Ǿ��ħ����~o��M�����F7.�Q�9Y��fNHk�O�LG�(s�0y��~�j|e��SR��Tf\�6��d>�;����B��ڛC����=B�"��iv���2�s��SD��xc��jWE<�ȫ�t��;#�,]m�����u�çI�1޴\w��)�f��a�k��O�?�k������ڇ����;Yk18���S�����;��iD��u���1�s&��h�n�k��c#4��O�ō�m�+e�8�Pj�Vr�;���w��-�}� #�1�,^�<H����Ϋ��%%F��y��5*�P�	����y����-�V�����N��n�` ������h��b|��.ʳaV�BC��Ň^.�� C�!�p�����S��t���M�N\�e9K��~`�}��ߘ�pK�=L�$��s��ɐ3�k���[� ����xQ��n�ki)�Ʃ��(��y�eu¿ո���$0�'�Fqv��O��6�c����I�P�!5�?�gߑ��3z���ϊtIfk�3s� x�4�^{�w_�k�Zd�B��	��9I��7 ��$7�XG}�yLƙn�Q�n��'%V�����)%s�x��{�K�:�� �]0bsm����N#5NNj��5r�@��ޙ(yU��]��1�(�92�c�����{�����O��i�,��5�j�ʧ(Ks	)N��ޚѴ��/אz�I�P#���[I�'7��V����2E��`���yt��z��3�\{�)��rl����L+O{��ۯ_(}��87���Anb�ͩRu�٠f-��rz��:Q=��C�������*s��%9��-N��(�"�4_>    *�FX�.��Mލؖ�eK*(�Yg=i͢�;*��Ø�O� d}zHUy>o#��F/=]���� o��g:���.ߴ�ҡu ��xB+���Q����	������c�+���w���C^_���Q�.�Di����Ȝ��v����7��8;gD�|	���[��d+�������֚ި
M��hFr�b�Q�����9V���@���M�����B+�R��6�(6#��6��ۃoct� f�`�Sb��cѸ�t%(��46����9�!�85�1�^ l�B�\Mr�f*�=����_*f��օ �D��X�f�4J�o;�t��۩��
`��E���bSi�^�)e+pj�v��e-������-��{�*7��Gie�H��b�(Ԋʪ��ǖ� �7`��G���Ўs��f�T�X�E����}����l͍�}Z�����y�8�P�X��\DoX���C5���2R��R(gd��i�RS����g]^Oc4�쥡�Ȩ��)f�	���J�#���,�F���i.jHؽ���k#OE0"o���H���,�	��,|��I���ԃg��I��cz������kҘf�7A���yI��t�/&�|�;��B}?0�q�*�XղTJ�'���c+V�8E�GT�oO��\&��o���4����3���S,Qh�9����`�(��t!��9�Q)[��<�iR��Zڤ�z�t` �Y\W���1w��r�9h]���إ�B8ju����~`�1���EqM�xng�Z^�ƂĂ�9�fֿm���3g��E�����f�}A�vi�_�Tp��#���cA7usQ6Ո�� qJīq��������{�?m(0V/)�j��k&�bv;a��w���nG�/�~��;ߴ��t:5>�d�!ʼ5������t��5�F��`�/-I�wH��"���@!8�L���i���ѣλ���am+�ܲٺ}	4Ծ�<g���L��5�u���D��Q�r6!H�֥���ٻ�}�� ?
�<��!��PP%H{��LRfPSAqj����Fh�֮��tqZ��qcD5����!Q�]Og�
��0�b*7����E�wE4�gҨUg+cU�Gi7߭s��|\n������g�yo��9,e7�d0�zg)P`��7}��ib��{{dR;�MUQ�͗+7|��c�7;���=�,����x@���= ���7�1 V�7�m��:AT��I0�˩\ل�����P5kr�7I���QQ�$�f�����c]՜�ۛ���謄v���Ӡ�����(يb=#��gF$��%��?��$�Z[ۍS&�}O�Jb}M��=Q�����D�Q�v������F���Q.�ŉD)�g�߿{��#��17ޥ}[T����1��AO�PD��t��N[4�7��-�-�f��qJ�;b�^S�I���:i��-*��j�c���]J=��q(.�JT�8���a�0Ad���+�6c-]W�l�݂�nhw�˥�`>D`7��Z���$m��$�X���"��;Vkq���C��L��s��{�S����=m��Ή�������u�c�7��V;n9�H
?R=������}�������c���Fu�$�-�b�I�x��Is��?�&��Z��7B�͔cU3}*ݳ�@4b���7��Y;���JՉkm�ёF��^z�Z��S���}g�c6���h�,lQC�`��ˠ}��E���6�O�о��ʃ��8�UǛA^�7���j��((��,��>z�Os�_@�����C�,�wU�����vJ�_��|��n��!��a������ղ�$�ې(�E�a�ǻo�֜��M��ew6�A���Tf��Ñ-��񼝲.Q/�z�Mk�B���1�>S�F��^z֎��wR4����k�<�o�!SqnAR�<"�לn�:�Z��yw��0��H7=����7�� %rlN[nN�noge�'?Ǖ����=�j�d�9�3��R�aF���jT~M�T|�	�J5�<�����u­vz�u�aڪGȸy���$�)+��c3�9�����o_��Gb�72<�s�r�3
a�g�Em~[����M��㿃��Gf���gCp��V�..���^�5UFE�E2��`��sQ�m�J���'�DE���F�-"[	��1�%����q��kﳨ���tƮ��;�D��v`$C+(��*���ǐUpz�'�*���1�E5;��ݺ�0��tJV�������,J�l ����ٖ��<&�ތiG
η*�V�ٴ��r
���"b��䵐8�Yq�`[Q	�*p6��dW���7 �9�(��=��p�--m!�NW�E������ߖ�M���]�i`;�ʬI��b�j�\{���%��8h�y�Y�aZ���Ϙ��Q;���6/�������ʇ���f��O�8(Ǐ��1�~^T�4�G��^��� �Z*���A<3� �J�n̀��g5�[Z�����4�2���0�W+���z��1�h涁��o��|�n��MF��̙��a��^,�|O'h�G��_o`y���������.����a2j�(,µ�>���]����c魧D8�v:���]v=AY��w�|G�A���t�Ϯ+j&����^��iâfl��p���v��9@�H��y� �������N�r{�\��OD�+�ߵV>��V�;g0��g�=�\c��4˜|�᎝�kGF�r�̃�(+��\���w�0��n�<5��R�#�T<u���<�>׮�]�J|�8��_��r�ȯ��L�:=N�Ӈ�3>��MDb_�f�����x���yp�K�8;�k*�+-���l:��9��=p���b�3��]z�aC�X22���V;��{'�����\/��Y��1\�S���K�6��o��#�>Q!��סlw�xR82�1�YW����J}v|;�'Nc�J�v��'؈�Y(m^�~|��olS���g� �9bE%|Anu� �PgsA,��j�&J�?Ji��ip��4��'
��F�}Ę>�[f�ߞ���p�Dn�zD�B�6��Qڒ���6��k)���������9h���b�0�i�K=H]S��ܓ���P�ޔC��Խ��J7~g�jZI�<]L�N�����?��?��o�!�gL�0�w:��-5`H�t~����S�o8-
�Ys����p�Z0.����3��NQe�B��n�ZFZ�Y��X����fkvӷ_P�S'6�zq�������&y��_y��`0c�L�op�D>�a.B���P9��5�OõD�H]Ό������ͮ��Ӄ��Y*~廐���%����o��N`��҈/��+���P�l"�e�D�\��Tn�1�,�Z��odXŷ�ϲ{\�4�H���F�j����� &�ue�����D�4��k��	`dO����=[3d��f|#�x��X�l�Y)R�Q$){l^Fp����~S�b����Tכ�楍#�F=h��8ݒ��Q�aXj+��`�����ԫ�D�V� �0%o�R�|Pљ�0��۟}����p��1�� Ez޾a���f���z�YIV@9������m	��`�r����RVEg��rk��UQg��7��ɪe�J����n��V��̶�!����F�Ǵэ`� mU
�աeo�x+GD�l�������r���	i�ȵR��=�@��ŷ�6w��o��f�-�^ݳ��&�^��0G�=BL�Ҩ�&P�if�^����>�n\�Y�:�}t?�GN�����'BR������=���O��d8�����@�:f���^k�:��(���ͻ�W�enl����Kϋ� �������?��/�����u[n�9�ʩD�J:=�VMa0������ۅ$H��mJ��2Lƶ�qA��,�4r��� �VO����oO�).
����f�"0F9�
�֣�3�$��N��O��_�(c���Aس��a�`sA�lnW�����B�q��r�݁��;�}��C.h��0�v�����b �9��p�kQI�d�5_��7�^��8P    t�N��>�}�݅��1�/��Zf�_<�]g�~��N��ا��i���`��5�w֒G���C�J���DA'zձE8����gK
j�{�U}b��~���Q���û��r
��6leP,����^$������+S��4��rZ��gh1�1����H��t3%�1���Ywi�����Q��)A�{�r{}�u �a1����s��R+�h��Y�gk��+4��8J�<nn�$����G�kqt`oI�����f�9��J�7*B=�mJ;�`m���*q�p&���z�OJ�n7]KT�R~w�_��(�����v�����qpl�7�f��ِ/<�pv���J[�=��Y������'8Ջkwn��ehχ�\�uꜙ�qc}=���w�W�-S�WN�y_�Oں�'�Kk�e��u��mIŘ�:D]u�]p��wiW2����h����Zȣ��J�F�	"�(*s/I�+&���M�s�y�޵$� ���d7��@6NKq�4�V9��慢�Z�����k_3Unϗ)j�^V��8J�JK8RӸ�����
_rd����T�uQ/�ӭ��T*d�b׾��ސ!Og��޵�H���P���k�e��v�׷�.X?N7<`�����S�:2T}��bSͻ�wo�l0NuE��\u���zv-������N�:��DE���;�F�Lڍp��("Ov�F1�wad��1�	�k}w�������.j�������4v��؃�ŇX[���}/`�#[�܌��p��rj}���b�O�2�s�l�=?�pv�C��=�'O��B�o'���3q�6����}��,�ܼt�T�|T�)��=m!5�0����+y���|��ۚ:R�GPZv�[�A���E�&m�U�~`(��Z��@Ǟ��()Y�&Y*�s��=����vo�_kO?>F��X Vǝ=��)6E䜞�y;�G?�	^��� ��1�vӰ�dM�����%���w^��.��w�|�ە��9�@T\���n.��A_]�N~�H����]�C��w��%��X1ŵR��BQ^�z��u�K|5��EgvA�t���c��~*������ ������Do�_<���K?�Dn� �m:�8��DZ�~jT07���ד�ܽ�/An�x���eb
�O���0��ȿv#@�3�-3�dDO7w?"#����V�Z�K��奍�g����/ۭ����qY�X���Ɇp�yR#���lg���C�lfT|�������4"�K:�	9�Բ�૜Z	#PZƻ_������^�-�}b9RR�G��z���������fw�{%R�e7_F��Z���mG�t������4��\�����byAI)@c'_�w�򰊂 �����OC����b6���1���^&Q3j���=c� 4�g���2�.\���-��Q1u�:Ǚ]�o_��Vnr������L���w��NTCVw��!�r(2ݼ��n��k�=�b�FlՐ�#ȣ�.�ڍ"�uX8����Λ��1'ȭN�l$��֩�]��U���Q-88[f�D�/Z+=�0(�ˁ���,��U7	F>�Ed�T^��1�h�s"`���Յ�IWYq��*뙬��SRv]QN�E��z�a���
7~�e1����|	Ӧ펴{V�oOJ I|��ERyۙ�#):R�*�0Bq�Ɗ�����������&���Π0ņG(^cWq�&��_&�3���F,@�(�i9{��8-��4MC嬺l��F;�a��Ů�#�z�BZٔ�_�-N˶���#��oNL`���zU&Nn=�{ ���Q?c,�8�h�,=�o L��6�"Gz��eBk�k���l׊"���__$&,�q��D�WTO\���iA��KlI�����/ �5�ڜo&!h�R�`&#���%���xnnV���c���Q����?N+B�B�Z-�M���k:���~����ڕ�Q�b{H������9b��@O�9�3���=5�ɕqu����V���a��P��p�[�z?����7�Vԙ� ����9NA���?���v�|}�-�-/�gj�3Ֆ7��[���XX����0�
/P��O��v,Kl�����3 �qv,���#��"�1ތ�Q��K���W �T���#e��d��Iv~�"QSݦ
ߌ٨k�a8%�#��,>{C����o��\?D�5��&����%Fl��Y,����[Xηg�!pt�ntzً��s��Q�)�7�<�1�ہ�l�#&��ϖ,����e�A�8��d�����ji`�(|c�!����J�D��2=X��9�z��ׇ�Ƕ	覷�5�	�V��f�+dR[Ҵ��wɿ���w�ma�"`I�X@���>�Bt���� ��ǿ���_����������?@DLa'��u��j H�;�zq�]�E�ݖ���H�~3�F A��5��J���W�(�wg��~{hE~�k�V^T�q4(����H`Ұ������?�0��)ps�����g2�e2�_��6Ξ珷)ߐ����C����~#O��Լb�TH���P��Ͷ_�o�@Ջ=Ѡ֮ϔ���iTx��h�����&.�J�vE�P���j^��`���l����
	�<��]��zf��A�/��R�&����㜾+�>�J����D��^���%e͙�>y�d�w�E�(�oo'`@>5U�o2.�ZG����g�ǧT�+R5)��������_D����ck3�I����1�қjV#�l���t����pԎTyg�?kr�S��)�_��+Ek��ɑ%q�Y��w�|-�D7�'�<"F �)Y�S��8K���E�Ն�4�%��(by��G(�>�殿���.�w��1�rrJ'�K�d8י�kI�P��b�g;�a�Q��v���ʶ�-��G���i��f��F�������7"�{�쁩d���<���;�W��.В84�)��k�A�o��ŧ�⫞r����P�����"�M'4��ɓ7d�H0͈~�Q�W3ͿcA����X<μFM�U)>uf�b�����Տ�_��z[� ��2���)�5Fl�A���|�ѻ[��
L����"k�/(��0r�<6륞�������C�O�E�i2�|����X��De� ���g���0$�|3T k���s=����jU�Ro����|�y�֫�ȶw��j��?��TI�\ףr����w}�	 ��-r1�@)��'|�xvsZ>�Da�QD~��=�a�-W>s�S;��̞-�=Xp�I�}E��n?�F�U9
׋\<��ޞk�6��s�s#���H_���<���F�z�xye������[Y�s�)�W�,���x�y��mzQ�Έ(�`��қF��6��i�~������}ȝ/K���[+2�?-�Z/�;�akh�Պ&_��?v��zsipZo5"��8"�'�Sքq5ֶ��cz�+R7�f*i��rY�/{j�e���[��9�m�W`�ѳ��a
���������(#Ʋ�V���R_�0~T���G�l� 8�:0��a�rv�w�Q�m����	��\Ό�(sd���8J��W��z���KOP���`��1�K��҃���r(�I��s[{���z3M�o�6) ��Xe����i��O��Zbn3���Ǻ=/�0���R}�����C�o�t���)|��O�y��bKO�D���W���2ɹ
R�������+Q��9~�Tlg�p
&�����lHl���O���l�5�G+�Ҷ����Y�9UݯV�M`<oT����#�Q��i�i,[WǬ�d�n;X˻�῀�h"sP-�S�2!{:;=R�#�b���^-��0�������1c���q�P)-F�����ֽ����� ��'�F�)�����2�x�O�?��S�y��} #��s<��E7�}g[RXKz,H���,�}�9_=��`��1�M��{nQ�WM�ҧ�-s�T�]��f�Of�y�0(o�N�7��5u�f9f���n���yl����O��sQK�J?�i��s�����߲o1O�d��W7o��M    �`�����)��N�<1h������S�ޔw|v�@��R^���A�V�9�����D>�b7��ڔ�R��b--��v��p�r�ڷA@����I���'��x�]���*67���a<7��ڕ ֎��T[Y���iz�XD�Y������`�F4�t#88;�i�]�;F#.��_橝*L��vK��4��Q�#�^�R�E"װ�"��f�͆�ۦ+���p�z��E�fLc��49�8�>���Y���C_��ӗu�~t[T�c��|:�[|�3��8tֻǯ����i��ot��G�
UPW^=kz.ZP�l�|�������
�H?�8G\��={?Gd��5R�<���/?��7I	�D�f�n��S7 j9��M��w���C��7�rS+�U�� &{�:$0�4�����ثً�n&;&Ȝ�L�i�����@XV�շ�k0A|%H��8[պ%(L�ڈ��+VuxF�dms\o�����DH7�-ç��'�IcIL���QQ0m�g�w+�~#��z�ʜ<z��i�A'���~�>!²m�c����l�<�p�v3�[e.�<
���c�,z�k�y{C[���w�q�|����~:��;�Ә>�y�-4���G���F7��U�;q=9��"�N3hJ�����Y�����7
�:���V۩?>"��A�E���ٝ�O��.��.G��C�`^��b�خ�����R��X��ь�i��h����K��������w��vF%_���\@�@��,O����|�G��٧��q����A��3*��!"u�X�;N�e�1-����ĳ����� ��N��9,I'�?#���ѳ���ʁtr�-Kj�E-M#� �W������"7b����n�V��$ҎVj��upy�a�W�y���#����#]
t�]u/��w$�5�����7����nnO���l�����5g���8��ﾒ��>ܴ�\��ѕ�$�̊|�ʑކQ|��Ǉ�oW�����"����Q��D�L�M�������Zuxw�� #�!�)g��tG.��c��UfW��)�ݻ[=��� #�7}%�p����"�p���ۼ�q��u>iv���7;F�9r	"���h�t5��|���T>�Jzc��CXv$�ZQ0%KkK����S����@��#�E��\�Gk3�	g��Ɣ��r:Vw�4��O;��10����0�J�őe�:����뤋�����0���C��(�I� 4Wu��t��f��G��ʳ�ijsAU<V��Jp��.��e�(w��+G���M����z�RУ>����qP>9r�Q���z8#��{-���ٍu��9w��#�D.��Ǻ@�������4;��1��q�8��mQҞe�	<�dj�~���} �4�o��}�rN:1��
�'�n��Uy.�����q"�̈́��X$��sM��b���N��V_��<#ە��ae�B��;�$��h>��w��<� }0���e�%�PV������N��USQ8���ʳvSÛ)�H�݇��*���b����vjf��;l
��A��+�u�%+*d\̄(���Z�x���+dό,A�n��8���5d##�k>��C{��_����U�/*�D9��3z��uD�.��D�=��'�1�Qm7�-H��=[���W�(;D?K���,i��WW�uGAh%bv��&���ӡGR~�s ���؆j7�8�Җ:�=	�>�����M�٧�m��7�W���*$H�Z���r��ⳟ)��i�_�O����_��`~d�1g�/����������G�/M|�%�ǯ�|b�]�Q�M9�������8x���.��5���+K3��Q�vq�]s�7�=g���#�g#�C�ާ������E �׍%���\<�i��G�V�����_<J�������?Pj77�A�-*��g���m9����8%���;񾀁t��pڅ�(��6�6�i�᫻Yylw~��� �I��.��F,h��ifñwR�>�،�������"�7~�ܲw�
�H����
���u�G�}K�	�����d;�EOŜ5RY�K�;����*O| �p��a�I�F/��<M�l��H���y���v6�H���5���ӛ���v���uR�d�އ�� ���&�@j����X�j�Y$�zm'�Ok/~z�`8��jx�X�:E8Y�UeD-��Jꖖ�)�-����B`R������[v�Dl�'V�ӗ0}Y;���9f�_�� �֖O(پ�jX̗�>����_zN5�ڋ�Y�`>���r.xE9<R�P�9Q;�~�pl�H����t¼z�75jd둽;�Dn��/��+0�%.�� r���k� /:�=|���(�W��Uvӿ�O��nZKN��cI�S�+�(�K�듒d����?`*u'յ�Y��-���<������4�7WO{:��[D%U==6Ķ�kni���M����}���4�-Y��cZ���4��R��Dh��~�ο 9��W��"C�(�?�\��ÂE�?ܽ�%�m�+��E�'�
��$�������ga�,Y�)KL��f��V_��6�$���Z%��w|��iA�\�8_ܘ���=-�̆'Y�+f�*��ٔ�ǐ-$�����٥+ݒ��Mc,��&jR�4[~w�⏆�1^���ɹ�֜������S*o1�����#����ᄆu"`H�r!��;!�Uo'��ޝ"��a,
x��o|�^�ʪ�f��"���/)>i��=_��`�f�j��Y�| Ĉ����]rvJ-�]R�?���As�c��,;�Nm�H��H�d$�8��2������$�W�_���es� ஭�d�/(:�侭��$�k�!
"�Rn*���VD�������D�$�c��3��Η8 A�t�>�p�yj*#���!�# &b�N�����]b|V��ㆾ������mCfа�Sd~��}������հ�t���/K�f�vlG+�T<����`	��HW/Ҙ:�lRI�=�!b���G�i��y�X�j[C�za���5�,�y4<%�-:բk��#��'��Ս�r�vx�l0��4g�wZd�&���D�.9_�1�5���N���RNc�X���k ����C��@Q�6g*5V�8�6�i6ʳ����k���|S��`LK�&��w��DV��[^/�r��1���`�Fx��v��#3�oh�2�L΀R�&
x1qcfB�q���C����R^����=����͎(r�V�]��@Iy��@ǟ�ԑw���-#�#�nF�kG�=�SYZ�\gp�r�U=�b쇒����~P����\v�bdwP�m����_�E�V([��ޥ���N$D�c'�ОY����;�����F�t�Ր��`�-�G�r
׻h�2�����0��E��$#�T�iv`mwҽ;���Z�;E��ܰ�⛗rJ��*��F��Y���zP��]�~���[QD,'�r
�-D�Ŧ7�y��=��qcZ�zC��pvҠ�o+�]�'�i�<#�-�F(�M��,:\褥�:&}�b_q�����y���ƚ�M~7��S��hp�� 32d59����H	v��S%��ŜYգ�����U`	C�5�r�^ج��
�p��L�T��"�/�|,��]�x������T��;y��u�3QU�(ܘDЪ����e��`�A��.\o��b;M�������h��;��בR��>Y����CS\�Ҕ��W�1y.-ie�mT��# ���!S�7��e���IN�ʍL�0ѨFt ����Z_u�Օ-���ȁ�8�����g]��W"��|���&v��:�t��'�A-H�^^N�Y�������YP�	4��J���I�;e+ߵ�����?��> 2r�N�In;<�
ݬ�.v2B��;�ɒ��)S��77��O�r�� �!�"�pu����<�'�хapYʎ*%"���ZMTFn��<�4����.	1�Ņa��1���������JH���g��ZV�q��Y���Xܓ���ƍ!    ��+�pr�e=�c�&��!̋7:ZʭMIg#)����9'I^�/k3���0�)��W7�+����v�a�my$S�������a�?�<�f�e �e�]��l����8Uu�^E����0F�G����s����w)#�o<%x�˂��u�|布h�\����F`Jb�k9ȳ��u'ޥ�x;*�0�ph6�U�i�"�Nھ�c���KG:Gp,��x����rz�|�|7��h�w�B����vv!�6�<���b���.^���\Ǭ._�=��-5%� ��鍉v�����f�fY��'']u�,�$�QR� �)˪��Z��TT�qۋӪ#�`5�aVˡ�
�Te�8Z�����:S�+�
iWd�S�@�}+\1R�qǧ=�'�a�$w�&ZW=�+��Z/���N�<��5��S�?���_%�le���k#8���r�6�����R�O6�"������r�P5�Ґ
���ۜU7=]�ô ɉM͛}5������ͪ������p�'�����]�q���\�w�瞨�����(Q+c�����R?���E�\�6����#\�\a�݂����~cJ������\��F��D����RRc��u��K���0�>ͨܐ�P�^�!�ڂ�?�fh��e���
E����k��.�	P9��2��h�g��6wyX 䏆��a����i������ ���w��D�.��/��$Q�J/��p���$��c��׺z1���K�e|����1%۱=6 �=��]��I�9�Ly���T�xnW�|�d�(�w[��W8�r8�:�{�u��<��/jW �!�KH[��9��� ;�%B�_�嫗hV�Xr������M"��Ɉ�a�*�}��I��0�]&i,W�9t��6]Bn}:!�͓+����0?�T� V��p�j�q3�#��Q�D�z�s��s���
?݌Կ� )���k��-�L46�u�M��z�os�g�������V�3rZ��/�R?�����a�o�a'�7�ewĚ؁�AmȄl�kx�Q�;t��d��@�T�F��,�3�!�^�&'��ߩ�C}���㟂��&��#A����}#��ٺ%�v�ZZ��`�@�V��"����W$�'���/F��ryXk�	R���'���8s�-�V?��"yn?�����[����"E�7.��7\�B��5��-[�o�%�0L��6-7y�w�$��_�cܘ�o'�_U��)y��c`��S**W-��U�o�X��$g��c�yۖ�}LyL�+ip��g��\z�1�i��j7=G���׫r�	���h���-���[\<Ӡف�}e���RB���F���cf,�.�_XF�g��hHp|?�bE���۹D���c�c$�l�1� H/@��˕0�hb���Y9c�RC|����8��e~`���GA������o�AꍨdT��5e>�z�~c$�$eW3/u��l�TX�Z�c�֯2�lg�ף���r��"|1�b�7�in�}�9�:�MA�|�<����.�?f��fHJ1�BP!��sj/��������B�U�H|�G;iԕ���:oI��nk9���a�O�F�^��a�v<��?��k8dt��X���e�`�d&�a6$�8>6�᱃�=Ƥ����y��o���p�1�A���p,���V;MX���q������0��4�]e�����n�"�ǎV씴� ����.�ƍQυn��תm�ʱa��}�`�Zl�����5��"Un�SCæ��Y1��#�
wZ�V��{�_�� �-j����J�t١��1��2ݼH��5��J5 d.^n�T<{��W��'�$u#M>s/	^y��%#�e�H����Vvn8@rÍi7�H���e�'�޹�a�|���F:}k�!�lAv���>��ZǙ�K����VoX,����AU7@Ӑ�<�Wi�BF�y�+A�S�E�F�dj�e�_�� d�!֙��-��|5FB�ƙ��%�t]V�Cc8Ր>��̴i����5F����&��ms�}���A�C�]r*s�6&��!�U]�n%�~B5m�A���y��u�:�b��;_�B"�yJc�U��4�&Sg,�Li��$���Y�3���L�/J_�
�n-��i�yه�4)��B�>�g��o���X����twpI�n���|5}�o��>^�.�PÔlYn�����_a��D�|�8ڶ�s�Y�.>���@�_�j������ɰ˷�4�a�h�}��پv)�ɵ�O7`r�1��ف�r�ʑ�*T��_��}���,���	W�b9 1�IG-�i�����?��j�F�r//�%���}P�K��ڬ��J��01���7��p)���)�X����� F:{�Q}{��k��\�w�	�^z��hx���:����z#0�|���4�a�H=Ǆ�y�G����k���X��.����
/#�lw`�].����.Um�|z������\t��h�d7�ޅL�'2`ι�՞Oc�s�9�<o�_�(/I94�jkxE��q2 Bv�����ôO�Z��0[�ǂ%{Tq%&�2 ��� -?���5׏V��ғ �+�s�1����/�o��&���m!�?�?-7�"|?p�],���,�M�])�n;�o�`�0��O%�7e�Ӥ���8�;[Q�>i�2�+����O��a}��g�>`�X��U���S����=T��0���7\u��Fs.�
@�Y���*�}�Ѧ������*Y�ཀྵ����"���\��&����#�x%��x�^�b锘x�	p��U����z�0U>���%dֺ|�����n,'G,c��1d�a�Y���O�*��BZ��Z��)�>#R�{�Y�#�����0��:�iiP$!D�ؘh!Z7h�o��Kh���1g���u�#ZO�1�Cx���R\��YLHy�O���RL�UA���|S� ���g�gη[�%���W|3R����D9��+[�j6В���b-�^ObB�3�.x!I|q�m&]��nI�3�3}on���y�[cW�b��frL3u������ѯ�M�PŒ�]L���'7�99 �U�@�"ߜ.zJqw|�4^�t�=��5L��p�7RՑ���!�:����;�=�i�n���#|5�i�ݶ&���xHpWzO�;I���{m�K-��\U����x �4���Fk:d�|����I�t���c"X��H�Ô%���9Z!�m"�a(f0���.[�=�I��*�Nޤ�f�=�
^7L�Z��r��m9���C��� ;�k`a�޶�a����ݐ��}���)s(�֘����w;y�^��Q��(O�CsVͣ�J\�C������K���g�bW�|�����A�����g�"�*�(G����_�0�>��\I��)�ǀ���Z�&A�ؐ/��x넾�P�#�S�0��i�*���[/B
�{(�k������0d�)3�m�����JlQ껎t&�, {��!����~2�|�p��bp*^��!�C�룥.I/�Tמ��ۧ��P�h�[V��f�s�����EzcC��Ͽ$���膧��$����96?94R0�n�P�|̍�Q�Xm�H�m��ɀ��n��7LG�N|���&$<ō��3���0x!oAx�-|�8��f�0P�Z.7Լ�H=c4zzP����h� ��voB~�ր�7[Y�-n�wԂҎ�A�Β�?{Q���o�eDٛ񻮵� "b|D�Qi�D��6dL�o�!���G
�̋����Q�3"���c�9in�a�;�ןҗL?6�]�k`j^�Ei�[��Ő����oSQh���q�r3��m��}���u��Ba"uUګ���v��k�bQ��p=�1eji���8�.'i¥�F�g��g^�����d��oJRCḆ�@G��c�d"�G²�Z���?�J�,���f��Jy:<h���3��j��Z3���|C�a�|��eCj ���`� @�J9�0�:�k~>�g�f�Yo���NÓ�]z �dTbp�V�}����Ң�������L��w��� +K<�W汇�^��T璯$+�Z�)n    ��\��[m�ϱ���~�̕?��&ɗ	L��J�ǎ�r��%��[��Jy�K����G��{�2���f1�SyUN�K�ô7y�����1<��f�h{q�+����d}y"=�3����AC� `n�Iu2�.Z8��3�.c�j-4_gc���S�7RY�q\��b!�Rӱs�����`�)L�xJ�l�]-���/�ڈ���~�S�S��f�S|��yZ5�<9VIz1�b`�6�����Šwnuo7��ֻ?)����6�~ig�쭬�{��+�[�\�)(;�L��xI�8{J6	1��S��5�� ��:S	��:Ҙ����j������_�č�Rn&�+Ӟ�I�V5��5��-1��������n
��p�.}����i��IG0�(�:=�4��T[�ဏ�$�A*+Qoh�u��9���O��a�H��Jc���{R�tSj�g�^�=ζK_�B���+pM�ė��`A��{�������*a��oHrj3x��ɦ�T=��J�鸵U"f���w�^Z֋�C����F���pR���jJ�kBQ�������^�5���qe�dd0� ���G+��������%!_���eQ����ߟE�jd:�l�||�k�e�"�u�Ҭf8ۮ�����!Z��(� ��A)�l����&��2�cf!r�Teç&GJ������%Z7MHm]˦�V����G ��hR߅4����ƒ�~
Wm7�c��)��xI-T��pj!H2�L��3K��}���f�Ň2qK�f�
�I~<��$��ۖ��5��DΟ��U�����'�c�I w��r�}t�����0p1�䪮� َ�V=n�!P��S�8\���Ub髯ր���i�,-_E����Zo��W�ޏ���_��v�e�CESmD��B�'h�,������]q�磵[<���,#Bg^3Qk��k��j*f�y-��J�[�rX�aE��T��I��՘�<�x,�����nS����J��+bZ�pn)�𜦔窯O:H�.�q�v���5�aG�]�E�e��p�^7�ŒI�\.yՁ�"]Wٴ���ɻI��ښ�W���?[��a�Q�N�tA���;����fM�|��xp\S%�7j�>;�P�*b�I�K� ��6�ٰ��D��)�A���
�;'\Lukȫ���i�����N`�o��n*�ŧ_��q�^(���
�Q�~��ľDT�Po|L>Y���Oȫ)Pp �2�Z�����_�H��R�feb��Q��������ʽn�ݸ�a��8��.z��\R��3;iɀJ{�6���<&��c0�J��]D�Yj�6ӌ�:ܰ��}�'>�G��:��0T?�0W7fR��R��3�aM��adj�GПJ���:U�>l�
K�u.'u�����l��������*Si(tg��'ޏI��_ ��mgy\%�k��f¿o$�u���C�݂��iM��-_\^W���f\�*�7��Z�uN*%���$y�����0L��1z�{uS=[%�d�K�r�{XF�kԟJ-)HZ�״�jE#*+UܐdS��l͋��c�� Z���<���bA)|L���@��q���������Ds�!��RGC#�ǩ�K��So�3�:�O|�7��2g[�;����"i��FIk�!�4��]��aj��U�*9^+��w$.˘Hf�ĹO���SC_�H,��vC��\����BѠ;�!i2�qw�2��f�0��H�/&x�\y��ly������{7���J�p�|���� &��U�����D2��.�u���ayoE�z�����s0 Zǔ��C��,@L̖�/���n_U�m	�U"�bB�}4$z�+mC�}@�1M��<��1��Y��0e�<S^��lB�q̯a�>��]5����	,�����^�k��n�zkP}���߽�r��5O�lv�z��dNfþxUF���z<\Q��j(|�ZQ�}B.�iy ���X[���η|�$�v���^Z��]`�� �d�(�c?�z�-�Ҁ�.^��,�w�M��9�0;�L�u��:~��h��(I6��<��a��Ё�8����ǩ���!�Ԙ��+�';$5;��  �4Km3��y����17��[O�Io��d�(���m!?��w_����*W��]0tIez�	vM�!96�`K-�s9�0��J��,�Սt7n̐�\; �2Yz=����"ZC�ͦ�i�Z,zlQ	�|���ڬ��jm}�S<������	KՐDJB#����<�ﱉ���B��z�Q�Tx��oRC�ܓǂ���c�c���0���M�����1�cQE8��8���X���zO)@��\�w��1�����Tp56hsk�ck�j�y�rS�*�'�j��.�b���C�ݭ9���A��I�qC���1
�X�r��?Toη��J��@����p�79�fG@*II5zJ'ƪf>��9�~{���aڧ��M��O;�n�R�A{��ـQ�����c�n7]H��n	�U��ߝ�z�����'_�T�����M_���=���쒐֜�N/��$������ظV�1L�{ �h��R����i5��1��υ��}�xs��T�)�V��g�a6#���L������������?���������O���������1�����&V�j�nQ���L{��Sw�E=�>��J�g��c��	�qQuQ]m��i$�>�%��Y����t�|�=�\4���>}T �
[������X�9��k�_ðj�rC��7�8�&#�jA����i�����=��|C|���IH�����e$$p0Lk�,�|��^@-�7jB"�^5�9b��q�^N���(�0������7"��˘��(8��.1���T*��4v���\��L4FR˔x�&+���R	���C}�����#Q�+1�<�0�ӿv3#(�P`����7L�
�E�i7�`��/�]�}�1Rw7|��V.:�����q���IX� ������&��F�"��۠�qcr�B7]5�AP�I$��V/+��rzΜ_O|CS�?��߈�M�{��.���LEu'ҽ]��V }�N�i��'~�$��l��p���ћ�2�k����o��)x�K�X�F����|)�F�Z�����7�B��?�^��-��礶��!�m *m�K���|�{�},�G!�	Ä��9_	���6��H��#�!���1���f�$l+����ERǇ�`���G�0��R�ܬ��՗��2<����;|x�R=��+kb7�]��YuY91��S5���B߹f~���p�14�)��c��ՓQ�1t<*�᭏�2����a�4j��)�զ��a��0|�7ٴ����o���0L�p+�n�Q�$.=:�e$x��iè��<AS�C�����>�5�9v�
r���r��������U/����ؙF���F�Wkjc"��=��[�?V�8XV#e��T�
@a;��{��7|��I� 2����m��$hYo�i��ԓ �JHk=/d*?����~���j#�W���s�5��6�J�b%`"i�m5�׳���Bjb��(����"!�g�TPcn�s��O��q!#�C��(�dJ��B�%��� 䬩�)���Z_�=�ab�S�M2��"j�â#��ށu֣��T}�����\��#�r�'ځ�m%}׎��E�U�~��|��T��Է��|J	���">�Z�ġ�yb�ڂ��	_�ۤ�M&��=��xJgh⊴c��3�Ά� *	��+w��pMќ��b�%ɡ��MM^�=�a��!�z��А�B��F���K�= ���u��ڌo��6Q�i��c�;�qj.sT&��磒��5��1�#,���1#�w��D'k�����;�Pj0Wk+�n�I!�e�b�_;ơ�ZBTڳP���R�?30�WP���Y�L��py�E+�^KZ����/*���-��ךKR� X��'%�e{,����=���_I��?������_>������Ձ����c�2��i��E8��GruG�9.(��\���    �7�z������`m�Q3�l�|��:����Y#1�^�e���t�SoK�a�|�<��i��n�|����r�?5sC�~��"���z쬱�����0�>9��7��c�@F
�[��$��R�IKv����ezFC]ă���y$�|̈�R
�����g���/!�?�������]?��z3�2hZ'܂ ��J�XT�a�<���3�#��{ZA;\G1�3Ҏ��Z��������\�2	�����n�oːaA,9^��M/ĚC�-Y���!�'8��]��<It��d�Pa�_<?��K<�ɟ<ˊ��H6)��EU|W@���پ������5��*�dY2B�/P v�Nj
��e�^��li!�h�oC�o���3Qٕ)��r�`iWZ�� �k)A���Gr�{M+5��WQ��Q~��Y`��{�Y�2q/)�C�ǃ��X��Mߞr� ( � ^A��5ˎ�Z��lȦ,*��j�oo�|S�#��ra��7��TL��#�c"<����V�˄��K�~�]?R���gis�D�eK��D^�px�*�V�~b�K��i"Zo�f]�t�?Ȭ���,}�q���e��/{�?�ߌM����͛)�y�Q�%u^1���cв��(���I?�U�(��\��U��)[��p���	8kZ�=���ծ�Ow*���j�*7`	��c�%�u�љ�����Vy�g�
W�H�Ye=�V�%���!��l~y*�>�R�ˬ�'�	���s���_��K���?�U��us��(��A�R�\�{O�Ө ���|�K��{�vNs��<��
����n��*�w�	�x�  Ξg����q�ߪ���W�p�t]8�\���hZ<0#\���Qm�"����OC(�5Gi�rc�i\{��Կ��A۴{��N��)������B��x�ˬ�����"�����j��?��N�����n��iu��(�%j1���72L2�i͹���c�+݀��綐I�~�8����[����Xp���0Yf$+5�\��Q[:��fϿ[��Ik��j`��.�,u����ύא��F[[��り�?�=hH��|2��M;�Wa'@r ��!���t-k#xd6�Op-7>Q[j�hP�z�Qq��>��N�=��_��1x��u��MӾS����p�E�t�m�������.�٩�E���q�b������ѾM�n��g/����U�feZJ�kZO�|Iƛ2��Dc�����_È#�P���DEc[�gC��-GC�	p>j|��z�B�K�7�7yi���cy�j.�a�(y=c�7�O%��!��y0�iE%@Xo�%1����`�5���f�߾���တ���:���G�UѺ�ZnGm�N�[(�fȾ�qV�O>y���C��A�-�~|/%�����댶NZ'4�i���?�a$
�q�z#��u��VK$x��|��*>�jz�g�֔K��d����_��荅Nj~w�]��9i�sf�2���U��d,W%C�!I����أ�;��x7���Zc�FC����o�$�$Ě\��O�ER�U�;��a��9��o���N�1��w����O}V�8�o�*&���Ҭ�r
\D��.~Vx.ד���Ǟ�;GP�����jA
G#8��w߼�+���aJ��,�����Ң�?��,t�)�v^V�+��% �����/��R�l�|5.E�/B���	�� ]^��;{�--�\�� �X;HW�(��i�~���+5*��p� �RO:}"�V�)HWF�J��+�Wd��ܔ��R�1pN_�N�$m;�Ҝi��g��~�D?��~S����2"�J��)�W-�<�����,�A�u�=Ĝc'vn�d�_���v.c̕�=�M�Kl1E[�2�w]�L��n9#?����ӗ�V���Y�5Lmu"��))�ő�o%�j����l��t��4��È����)��_w9'�s�=���?��s,���o���F���f��*xO���,@Ɓ�G�AZ�>�놡��~���"��|zOGj�R#�5ׄ�R�^}��6��Fu7�]���p�dܓ~�cA(-w|,O�օ��e�0�"]1y�����Eq*G���f�0i���a��dZ	7������l�<f~�[���:�a$���nm���7f�@�0�dqZN��j�ʱ+T/&��ҡ�-�vn�C� H$�b����4�?#�8�%fhՑh��1ǩ��Y�gw���yc~�*T�]?��� �أNF��-�Č!g�X���p+�{�\�n�D�+wcI�26��6�m���r;os;�0}���L��͜�}K�1���
��<��Яpa�5���ɦUv����Hϣ�Wռ��5�0��q��8��,��.ɣ$uF+4bP��7&����.\̚e�&1Ֆ�F������;ҷV�C ��o�Vܺm2M>�>��7Ku�a�T�x>��@��My��N�P�ܒ#����d��gI��6��0@����Q�2��!������6Q�Ys�E��3r!J�?��dnT�pI���v�j��->v�U5�%���S�>6�ofb��v���>�)�$�&P�ڼ�<�K�/�;��v���de಴����<��Kt�&��O ��gG��7�y� �
�i��:�����䎇���u[	4�(�-�Iޣ�f^��1���h2���]^o��a(��v��He봌��bDэ�����E�|����ydwSl�S�d	��TM}�݊J��>,�O����������B4bt�S2�/�D�����Sf֛R�q\����ӣ
'A��HnG�L���N�O�|����ȶ*�Y�Q	�J0�jΥO�>�R��0����}�fc�tf�d}�5�ى�����q4L��Ӽ�"H#"�O~V��6�JieֽBM��=��Ғ��^�i����ٹyr�{m}��$��Q��p3�@�O�%*-�!�o5q-
Pc_�0�},���D���@��c\����FxJ��|��KSB��f�p�fWM4W�x$���v��������$T�xJ�b��O�w�Nopʛx�����!�����6��v%�o���5FϡF�- mٿ�?�Sҭ��-��`�����K�yJQi��1a���k��P2�y�6{?_E�8Ж�O�kN���7����G��n�G�)����0A�Sp�f���W�=h�b��.�	�y���-�>��t��[}ն~����d.�j��q��D��x=i�PeiTZ:���ٽ�9�w��~F��@�"�-���VZ�9����$?H�s�뛗?X �/�7���],�- ���(��{Y�v~=�;%#����ՃwG�$j'�	|�ݚW�co��~�B��N�� >�X��$=�PM�k�j��9T��CA7�V�MQ�p%$�^�d9��2��A���ˌ�T�F�ǭ6����s�
��DZ:�PHw�����~�������v��rr�},��l�D�t&|�h[�\�녣0�}*7�	�={[Y�,Ҳ�Suߚ�w�A1����S�_�曊ڜ]& ^:�C�|��wZǚ�K���G�;�U��o���{�{�CM�{u�y*g��!��|@�]������g;��Yk�Mީ� �Vr"����(؅�L���|נ��wc&c��E��Rz�k���ӂ�H������\��<�c�|_�l �!�~���V�)�E�'>G��k&�pF:lY��)뗭ԁo|��#9V�p7�R����k�m�ɯW�`a����^�� �(�_˿�T�>�q��
��O��n(�L_U�b_-y���	((�Z�*�;���|I�J�fR�J/{�Y���-�ޏ�A>���>�Q%�=j�B�ˆ�9��
���52��z�.?�uz�JF�����@\��2R4d� ��Z
�h7��'��˿XbI����u����i��)I�9���V�Sy��_�'8D��$v�y�@ԥ�:����i �:�ڤ������ӛ^��:�*�;�� �����-$���|��X}    /�������(@de�AG���M���|P��ab�����@)�nI��.;G3q���h>o���Zr��1�p(��J�1=�FY���&�{�����"\7"�0�C�o��iD��>+��}�^جc�Y��#��8�,��q��_���>W���VÐ~��D%9�7�q���|a�)#dvym/��p��Ǩ�z���>�q��>�(���m%�j�t�����~�ʧe��1Fcg��ʙ�� R��:�j�m��z� �A���"Od������Z���I�4�4՞����a9��/*x�n$q���c;@Mc�J�}�<���=�0��0vEE��+��$ssZ��T����ףS�
2�+��N޶�,�Rop���޽�N��=Ͼ���V�o��^�2I�t�9��c#o��v���7,����p��NHw�d�9�8ѴQ��p�p0�I���Bv�6�JG2�5�Sk4�Sp�^��a*�Sj7�$2��i����|�k{������^��}�R�7ݓ4r�&_cGf��$�� �+���;)1�P���B�I.&�������@����;�0^��MOP	�zx:����k;��rNi���Z8<�A�<6����\AU�ȵ�� �*Y�_7/��񻉓��!m�����y�h��p��C}�ɣ�pS�\��"�\�~V�� �6�i��<��`���ՂQ��io6�Z��8�xY=�n^�ϫT����ь�����h)|5�:��R��j��z��e?Du�!���l��g�7���7�^�"��r��:��&G�ܝ���v��E�4�Q�W�B�@P���]���v�o/��a�ǭ���k�3Wx. A��l��"����w�H���$�WD���K�@|��N�;�vm��Q��S�"���c1�����'#��	_�ʾ�g��a�>ڬ܈M:�{{�g��i1G�OeM�x�g~�0��k�)6e
Z=&��
+1��2�{;��Md���j���Y�іg�#����iT�+��"2���yS������Z���+��!���Q�fڭ�-���A��nQ\��{������I-�����SZ�����<H��8�B��wYH�P�cB�;7&���vǕy��/A�ͩ�h�r�,#�� �� M����Z��<�a�X�Y.��PkHd�|K�����'�2�����F�^5�vo>$٩=���,v>Q.��_�ƈ��\<%oy�hz�Б��S?�C�)o������B\f�<�KK�K��[U�瘏�CC�4���!����/���k�CH�58�\S𜦳Zm��<��_��(�� ��zf�t2%)�~�8�.3�69C���'�	���.�G�Gt�ሱ�����'Ө�>��M��0d�7�ںY�dM�=\F2�"c#��s�|>���X�Z�YoԆ�3$R4�oG�൉�f��}=o��+]��ڡ���xpd�H理�z)�v��0L���u#�9+���bp��"r�a�{Q��
=�zJ�v3�=gG<wj3vCbS�p#�9����O���s��yA(��Pa4�\O�/�)/�d  �iN{���k��T�|a� �h�)���F��%�v��#}���з�"�v��jI��w�&p1g��W�����'#]����b�`���B%P���mKB����/�c�d3��ִ�z�0Q��e�N35>�Y����{�a�+����D뱆�Q<��c-��QY�����.����e%tC�?�"�`����R!��F�_q�OIZ�]s�8b��nuģqzN�d;E���6��aZȧd���Aْ��$��]��?�{p,D[w��?�6����K�|3�<hy������o7n��0����%O�������.`!�n���� ��u,�[˷>�S�5׏#��l�-�{ .�9H�T"y�눁���|^�K)�i��޺�)ޭ{����Z#9����52�Y�m�a(��Xo�+Ӛ�⊘��pK+��y�ǧ�~���������Hԛ��ԹŠO��6o�)�`
Ż̭���K�<��Zh�|L�4i��p�]^�����f��s^{9Ōb��Kf�4��d��ד|��_�o���<��Tڂ�q �X�M�غ���j��a����=���:�62 "K/0���놑��b�7%�
T�z�T$&���4�i��>rF;o� �0A��a��ɕ����T"\G��S-X�f�M�ܹ_et�zIxD�,2S.�QeK!ۅ�M���|P�]D��j����Øu��oƁ(�5�e�Y��/���*�8Yw*0���/G�v|�y��pL*\1��b�Ҥ6��t��T��H]�G��_��t�ܪ_�j�zN�t�
�(n��D���-��z��5\L��p��/�sYp*����$��4���k�?*B7S�ⵝ�[���C�U5�c�k��b?��J��O�zEN��pv��>Cw'�)g�ɹ���inϿ�����C���N�s4�۱�w<��ꎅ �:
���Ԯ��r^����G��riw<9��Vʘ�q���a��7����%�I��s�Z@sϢ�f~����ùސ�ک��ӌt��9�\x���=����y��ε��w�Ybu��:LQ:�D�����p��O���g�e��k��z�d�k)�/;
�Fǫ!jQ�sj�G��U���s�A��t�jgl[����.���C���R�����S�|,Ӎ�ʄU�,���i�!�$�w��(�8��?x5�nbq�+�&i�WY�9y��7�)�硎|���{7�U�֔��џ�21�w�I�أ�_�0��zů]�)�|��Q��s5(�Z�V�����on�Ȏt�����8$�:'�S�(�� ���t���ZD?��ę�6���͵��2�aM��r��&����o�&��p�f�ݳ��Ӣ۪!'T�-�k~�#�Cܠ�j7*j��r�:�Ǡ��D�6��������-\�J7�2�ʜ3-G2SK�H�#>)���핇�aJ��[�i~̹r_����ݨ8�zR�U*�-���n�0������ �U�spE����{���&k�#���5���JW�T*��C�"�ͳ���A@Zpˏ���	)��\�"��Qf�㤱4ؒ'�0�nB�*�������N\��s�.�k�AP�����������j?�Y�X7z���9}�Г�-���Sg�R�/�~���_,⭼OS���bFw�@�'��Vi��������ET"1?����N+����X��A���u���-�G�ҍ����5��#�� u�h�?Fρ>��?������d����^��e%|S�3f�i�=��a}��&�ر�ĮrSi)>kd{i�w���>t׍&����ȇ����e�m��3�/�ieN����<*����W0L����x�LvRk=XӐ����D���y����O�m�qv�P,|]��|z���7v��td��i��|UF�ⷧ���������fP�f+��C/�Z��nIu�������8�2��I�)�����b��������K��������s�7L�,��`��	bI�g��@�H��.�=��\
��g�9�ؾ��a���s��!��Bg^3�2&̒W�q)���fu�V�u�$�Ou}����`�,J�M����Ċ6�MI���E�O�X��;��Zn�M��k�@�!�!&z�F|��b��:��ڜ7+me����A�Ԥ^I���KԊpc
�OǥK>�9�����a���7$�^���ݻ�Z��F�_�Q")���'��1�=={.�ן���tw�ha��p{W����[L��":�ÇWd�Hb����ļ��_�.Ȃ��M���{�Y���{�����껴�{�?�i���~�k���cj'���)���$p���#M_�P	��J7�wPe��%��3%Ѣ���+�����4ʜ�7����������)K�.z��R��fj7?�d@~�j}7�r�e=�e:�0�~=�a��)Y��+B2�����`��J��;���z���    ����]���o�~R�A�\�Ǽ� ,U���>V�n����AW�y��8��׹��l����=��5L�eP�R��"ȗ9��Hƹ�	�O;+2�����P��:���7��6p&�Y� T�KSo��Q��4����xP��T�h.6��a���z��[���>���5L�M�v%aGg���IGc����Y�9�#��?�P�5�jt1�UM��ks?\�#4�T6�!=��ng��q��6f�ٶ�r�4T�PIa����6-���Ȝ������"��n{Ǡ�~���m�)�w禞�a�Є���n�oNx	-���@�9��_��Q4������>^�o�!�
������'��3����u���a�|�2����;�0�v����@�������w�hB��Ft�Ȭ�"=�0̂{���Q�-��7�D2 ��m�Mo�{n�"����H�G��c��e�4`��wƚ?��F6W�sW܂3(��)����Ȅ�8�צ+�fI�8����i�R)�(M��TNg�������5��.��H�Q7Y�S��=8�
�P?�9��z���Hp}�r�q#xw<ҽ&�"�פ �}�N{K��.�t3�X�vEt)S��K��i��ڴj������ɵ���>����(涗��eĘ�#�<Ӫ2��ro������ʍ,��!�v��U֚� �';�U��^L�%���f���f��h�PK�'>���ԉ��a�7� !+|��B�Ք�c�u+�q��0���$ˏab2��!W/��}f�	7�k�DB�Ǡ>�~��k�Ӯ�X��R���%�%1�-�}�׫a�H�|C�{t��ĕ(2�y��D�l��~V��<�ٽO##��JM����Y$ ����,Idϱ�I\G���W�k��+!(�*@˙{�Y���>&�>r�79r�3�ZI3�p�u���f�;���<�i1[�������X"ΡX�J#��M�6������0D����"\�c���T<�Z�%7KZ���0E�l�ȧ���1�����	��H	V�����yEk���A]�BV�J)/�p� ����-&���g}���w���Z��7٩�5�B`;�7F^���sP*>?x�Ԑ�m�Q��ĳ�J��P#ܸ1s�4|  O
�_�0�S�S�h��Ƴ�2�ju�yP�.�I�y��lٯvk0�]Ҙ;6%C=�������Ʊ��5�j�7j��;c(U9'
U�Ɔ�Q�Y��WX��(j�uB����t��� *G��E����N.��_*���E���܇�b�<s�Q���+�x(��u�3^/C����E�YY�c 2�H�cJ��]R�Y�qJ��6��0A[ Mn�-U��rrj�q��-�P9�V��,�w�~(E�9ߨ���6Ӱ�d��'�ޚ$���$��|0���ƺ��ީɶ�{G��j&���ؘ��CY��q�|�PH�"ED�\5��"i�Tu�� 7z�)}K�Rc'���h�JNԆ���r���X{��v��}%}�ʍ�Yܛ@Z����r  ��n����s�&T�nZ,ϭ�s�Uc&aG�1D>�Ok��z���e�ָ�<�>L�t��_�L�*/Mԩu����W�0�>�Zoz ����>)�����h=�<6.�/`.��Yo��\�TO�KV��z�A�}Yi�p�0�q�a. ^�1�/-���(�`�������a8&45.R�S�r��GL�d=�&���������q������Y�f�B�uG:TK��͎���<�}+M�r5�sh��VǷcƩ���-�E�<_�k_p�r#���*d@o�54}HBt�GO�Tc����ɰ� M$�l+�t+���C n�Z�)�������P�I���d�[��'�Ry֕�Y�'W�ax{�0�����ԡ!u^AeR�1��|�]�G*�%U)�t3CW���/i����[��8�j�Vg�y�k!�P���n��nAO�Ğ/͜u�-��|��e�/8���e��� ��fݢ��)iX�:
<�<��;�QEnf�;�u&SҚkl*gn�[ՐA#��$4�Rj��\#�ǃ�h}�ͱ��--<�uڲY�Ztv7�=����bx`�H�#W�{��J%{\���,�@��^���ƴ�b�׆��4� -�:��ǳ� �9\��kk�T�&��� 8�yo��Z�����}E\L�Fsͅ�F/K�cN�L8_$�I��P�i�'ױY�'t%_ȝ�dJ�+{���4:p��e݌��|T����:��\?����=��W� ���{���;�[��|�{ω�̀1�D3*N5���J]ùͿ���#��g����{Б(������/��)��}�z}|Pr �v#x���c���[W���S[�4F"���u����
�4;�@߰DT���ud��|�毧�0L�E��½.��'�TO���:�N[��Q���L~����#g��i���I����d�E(�6�Yc����_�2�T��|�%�� �;EW%�:��|_�U���.�P0��'l7]V�����|��� ��_+�MU��g�0����lZ(�l4� �	����P��h�� [|=K����7�ǳ�n�6aњL�rmE\d��׳?@g�O	
��K!rIz�r�D�Σ�����y??���k�Zn���9Vf:^�y��4g�9�.���p%
�d|CI�~B �..nH�kZv��$����]��#xS98t��e1f5�	�O�v�J]��ma��?���pFu�N;�0q:�#�:�f�,�y�0�~(�|�3��W�!�P���w��<qȌt 6�X�a* ����� m���z�=	�Ә�d>O�vi� �7�t<W�6w�%0Lp!	J���u�Я�8�%i��1t�j��=+oO����"*Q��u��0L�p�7k��^U��u���F�9�FA)z�h�֌�T(Ӎ��V� ��\H��tI�n��O��e/���O1�}�	�_W�i�|p�����<�g��$�P��7Bk�����챃�S���9�[>ڎ!v��*�P\����l]րQ�=�b����_�Z��f:����0� g��[1^�%�����TI3-6S)�*��g�W�'��sʩM�<�({�'i��w3Gܶ�|A���b7$#�ǔN
�k�*D���+O���c�} iwM�}h{�g��|י�7	�5���1S���f��
�H����e$o�/�����_�%u�M�����G$��bƶk�.��Q����؅���)7R���r���K�@󮩟��(�|��y�1F�ǽ�^��fS��%Tt �U�)�=�թ��Os�+�P���l i%��,6xY�@�l�"����|%E����Fq�j�.Α&Y�+iDĖL�lܦ1_�
���Ho��e�BN"~	���:��L��V��׊�ɐy������1yТĴ%��uN>4B���,��l�o`��1�Y���N,����Ӗ�>���������7�u.�����m����Z�4�%��<�k_���^��J�7�J�&� ��P6죌�ߙ�_�0�A��i����AV��ˌ���q8�M��*�0�Т{J����soY�W���_�r�Qf���n��������G����>��G�n�''/����Xe���Zy�?���BT�ܫ"M\�ty(w1�W���??��b��j��D�l|��
��~$SZ��g���yע�RK�7[��}�N#�k�'�h���m��&����t�Y�fV�E�@'�蒖��QI�>���L��R�
@[�ݙU�6��Iy����r��L�z3�sҘ�b�%6�v��F:]۞<���W\��	��n�Y�M��=Rv=Q��xJ��Y����zy~�Ǣ���0sn��C=	�P�nh�!j�5#p�	�o��'s�(��9YJ�p]��%�S�~g��6���r�>%c��TOp/��*֡>��5�p����&����]��{6 �������S���<�_Ø?\���GGcræ�ڙ��$A`X!��Si���{��No�M@�2}�4e|��bxRg�c���g��K�����x�$#bK�    ��sjQ�e����vA�,vŽ�v�JvSm!Bv8�TI!�k%���ۏY4���/�
�B�Iuϐ��!��]��'�����Y�� ���0j�Ӳ(N5��v#,��sh]���~�S	�׹ތ�����`\A5���j*��Xߵ=��j�ވ|o��"���,Bq�k���2��n�0׶໽p���Ax�N�q�eܘ�c���.�ڿ@L���R�f�� �[�=�CxJb5d�5�>��6y|���0�S����2&�v�;彂Q�'���ԅ��e��q���4�a(�+���	q.�S�PPY��n�����8`��<���]����98�a��cJ�-;��d��R7�3�߂����]7r�Y���I>�N��1��J5����ȍ����F�E.�-�X
��)�	NƖ<_���J���U0����g!i��������a�*�fEoj1��ݤ����\�$2JEG�J�/�����!'����d��)KH�P��nAvݶ�Bb04�n��꧹�|��c�e��В)�)�gݵ��|E��g\����+˗Q��ָ1#�͎_ei��W����!��xK7s�
���z�o�
/)�:��ǥ߾����$��Ǎj���h��Y�*�$�ԖE�����~ӐDZ-7Lj�v$=E�����hN6�
���U�`򗷥�g��ehk.$�~��H�:��t*g���Q�����l7��l�����r�	N!��so+��O	��F~#/9��*Ah�w�bŖg�j}�/����pM_�tiWM�6��+�zl���A���б_�!�.xI�o<��Y����@1-��=��@~d����KГ��v��E��C�a���i9M��6f�}�1��+v�TcT��b��an�R_\�"b��f@����D������F� O�M��|1b7�\k[H��D
�Toz��ckr"�0bs�k$G����u���aJ�.���dPr���f<�A����3GC=S
��F�M�����̀2�G�3�m]�/�*ԝ��)�`��1A��A�gG�k�%��|�� �H�hc�!f�dh�ܓ�����)3��ͻh�>�U�aJ�dg ��\O�]2�ʢ���v�xOK����2�y�[����MWI���g�j����4�l�X���LI�n�H�/��HD4fBgf�c��L�6�>�*��8���z���Jy�+���M�Z&�o(�^4�E��.\L����H9�����$�骩c��W�����Ի��9�;���-l��[�=N�5L�Oñ�E��I�=|o�#N�Kr�1�,>'����0`����2�KEP�"���M;�b����%�~cʽ���7{�=�Qup�z�D�Eh����S�_!���(�d��fH%��j�i-�ٵ՜}��o�x��zo!�ذ�k��3�Lek�5/dI{�����"���nHv��J��Z��ٯ)� ژ�T���M���Ҟ�2h�=�L`����4 ��e�	�:7כ~��<}!Xs����<1�8�_~���Un�	b��G>7&4��p�,޹��|j]�=4����;��朜��@.��*�pӽ�������01~'�o���Ֆ��ט �xE�ӡz�Kb�|k,��)�l����L�Ҟu%�.�ԙ|�8�g���{kЪ
���
7��N�����P.���ջ�TB�n:�
|�H�Ɔ�F�qJBZ=��<�w1�K)қ���y���+�F8__�����N��f·�l��η�k-��hiNϳ���q��ôe��1c��{Z��F&<�9R���w���O��ŤC�۶jK�>&ϒ<���m� �>*�o5�!��?t�1,���o�6Z'<=�>�����;��874nm�S�tc��6��/�O������ظ��Rk�֧�B�(!��Qi��NU-]�<�
�)�Z�n�C+��Ms��ڥ���w(:��#�=_���tȥ�^&H�BS��)1�K��Ԗ����K>�|cS�S���6�xe=��PaW��6S��L�sw}>\�0��v�E U`�J�$^8Z���pJѼ��cf��V��l*��k���O��ԅjj�T3�����1��or��������|�3��7=Do�L,߽�Ҫ]1��Rz&	*�����#C�}�ai}~0�|�NT�nF���M)�\9�+�c�O����uy~G?c��z3Cȑ:q����+�]�|�J�6k�wO`�H"%�T|�;U�3�(߾uO��	~D�G�>_
/?TCY������ȓ���Èh<�6��h��0��(�f����S�ߍI�Rb6FV�ߙSVg{\��k� ��+I�}���Z^�(��h�ܞ2�.����ߘ?�T��0[�2��B7o ��JZ��δˢ��&:	�ͬC%_}�J�w� P�:%��*��^�/C�a�c4ho6rZ���M�ܱ���� ��M/�w5�WJ�h��p��'r�>KK��a��~�D��������������~OB�k�����&�1P��t��v�<��J�7}�����Q��X�ۍ4��ܻ�ep�4ʸ�v�|,������R~˱LR�}�h��Iip,������Ӥ��׫�0LT��|�fUx��m5K�d�"����r}��)����7�C�g ���4�� ��Q�����_�)q&:�衵�ƘfiV��	�	�ז���=��oB\~�5j�]��Ȏ��e�n	7��N��=��i��7RsrvLIyZ+8O�0ܰr,h=ݷ��;"�;ЌS�"\�yf,�ź=\�B��~�>̦e��~�է���Ȁ��$�f�'D%m��y6j�<xF?.��uäϙh��i.�W⧥�Vw)��w]a*�FM7�c�vw��?[�؜@í�c�y��a�S�Ӎ�=^YX6�m�D1�[V�������B�r�
P���Z�N�fNǊ�>�%����t�0�m��a�|Ȉ��ai6z��co���u�u�
ηا�"7"�4����>U��B,��g*�T�Gm��:n�Y��Y�m^2I<�:��{����&�_�0�	��������im
=���Txae_�\�.��R؅���,�D�V�.L/n�嶼�v�_ �T� �]�cfn]K,{����a��i	�gL��������I�� �"���pk�uO�CJ`q�/�Y�~�7͋�5���s��d�2@b�	�>�8&�Y`�0Q�b����hdI��dW�K{���ڣ���a���Y7<%�Cu�jm��n�8�7]9�B��0ȭ�C��dM����+Jrr�����;8J���� �<F�i���=���C��������]V��~����`vA�^��#'��s��.�>��o&���-i;� �h��Vj}#��\e=���oJ��@s/k��Z�Oi�"�2�� �{�0�{���Z':�Rs|�]����"s��_gn�]�}�%ɕ�K�A�첪�2Ȋ_�E��l�Kk�0����7�@K̸���9꽹Ɩ�H�K]�6�o�H�g+)����)�ΐ���H�%��[ʵ
�������0J�7E**�H͚Dr>Q��@M�.Qs��~�a�/�f�3�ӖKN�h<%k8S1��,���h��g��u�6$3�I�5c �"��@tA��0��5�v%*�<���_y$�i�o�H	B���Z�*���D�ǐ~�R>��L��p����F=��˛�*7��]�
d	�j���VO�����ƻW��|T�h�UVm7K�r�� ��˪]�cJ���V���<��Թ�٘#�N΄A\��ˬ�'��<5/���bnڳ&�����3D0OH����Qy�h��is��9�/�zߔ��Y#U�~�t���kaD�`N��t ^���*����3�M.6���Q�}q���$��t��+����!1 ��<�s�0~���b����#B%G�N΁�Y��:=�%H-����"S����߄륹#'HjQ�)8f����.�p��7�Oɍn$P��1J��;��Ֆ����~��X������0�i1��̨�p���jj�56rVy��"%p�+    r�9G�S�m-R��N����<���4�0L�)Z��ۙ���	�0��b���lή�s����ۇ�vqc�*�gl�oѹ����8ƚy����,����W��%��Z�4�.A����뷀7}7z�c�G]�\�?�|'6�HPg����阖�O=�'��Ms��$R�Yn%�5�	Q��ȕhg�
���n_f���7�ޣ�lW�|�@b} k�9زK�o��ۧ��v�|y����,�K$�0����S|�O9��p]�5o��j;��2~��<�r�sR�����,+~�+ʩ��-�S��A9����Rqt �o��қ�^�hW�Mbw�J����Cp3��')�N$��2z�2��A��@d�]�S<9p8S.�}�H��Ʌ����Jm .{&��|{��܇���Ss�:T����UV.\-���J������4��:��aJ�xU��1����4�F _N��2�w[����a ��{#;�=���n�S��2I���Q���$��7����� X-�e���_��B&�y6}�~}L�7�xH�6���R�aBK��V�,��z��a��¬񍏙���n�Wܘ�2�0�l\�:�(�p�A��2���R����l��"5|q?ó���������h<�J.#�hbf8���O-y���{&����?�l�O���)�����P��G�e�nl����
�
rU�HfN���g��S�F�?���J�H��jKTq�O�:�$��h����GN͢=-�Ar0#m�R��v���!�?���DJ�_5����U72aI��������f->��6�2;�n���7
�J��x��dP���_�p{}艿��nE�"p��{�Y��3s�0��p$5RX���`я��G�N١���F�̝�4=��џ_g�aJb�q#V�n��y�)3u�?�����3��������-�{g����]����Y����"��!��,Dk掰�����Q��tp$����v�FӒ��§Rlr�^</1v��B�n�ۮ@�:��E��g��l�=g�忀aJ�?��K�MZ�Q����5�"���M�Z��u~	�u���=)q�^Ъ�d���5�w���a**0_$0Z��b@��
�1��>��d���6������A�:��p/�u!��~�I�eNE�^�/�0R?��+��\O?�w5�z��V� s	����w��0퓫#0]d�!�=qE�ٿs��D�NیHu��0�E��ovc΁�m�c�M�Hc�3��C����a��x�ReX��|��h���s����ֿ,���9��;p\k.t3�?甎C{�i#2�dפ�!��_��_��-̠������[H��4I`�2�W��>x�ߦ�*7�x��G��@{h×z��:R�~�H��K*7�@y��hi�1������o6$��??	�8��KLGLp&��PŁF�{�I�����uh�}���%�;�`X)D[��2$�:~�D�������������r�P&���(�Γ���KqM��i#���궱��ݸ�;>��d��^��~�LtjF��\��B��Cg���H&�MY�Zl�����ji���Px"H��yÔ��-7��j�-(��g�р'Ҳ^��I���X�� �P��1���,MH}c�z�do�����{��xS�[�R���w�cf��@�C<9pZ{ǕRN{��!_��j�7�[-S��l�{�[���H_υ����E*,��΀%�{L���za ~x?����.����!���^�]B��	�d�;i�u��uD�@k��Z�-8�fA~|\����1<�34r�v^�� 	��n��OY�b�<�.�Q�}����9�����_ų`����2�{�"��yA2@]���y� ���݇v32�U��-i�P#:p4vZK��"����P����k��)|�:A1��tx\!Fh��tI��0�1���7�r���4��8�� h�T�����^��\���O6e��fZ�BJ--��*�l�I3����\�Ks�q��uv��:��V�B�ž~����B���%?]���a�hA7�M͜�z�/�'���4���q��c�؇S�>8�-v2R'��r��p�,��Z!}���.�ɱwp�^W	�V�3���KK�$��Rf�[��#�S�כ�B�F1�C�*]�����������?��כ�v�yz0X��Q���UW�F�d@�o��a(�9ّ�0d�u���<�� �_�'Q�fs~���oğR|/��<�6��)�S�(���^&ze��
F�Vr��]�����h���	j�z��|P�(v[U����t��C�!}���9/�-:��W0L�h�~����	z�5�t�I+��g>}���Oإ�&r�B�L��	K��gEL2dϔK�am��\��
ݟ�>@$z��+�3�Ќ�\xG8Wk�*;�u����GL�goRo��|3s^#���g ?�>����97"zzz��.H��+�V��Fz�Zw"&�#!R������"�z�lFn�%qz > �Uv�Dí���#S�����p�T�r�b���J�M9�
�zGd�3u�:T�ϞK,�j��.ݱܷ��7{�5��L<��z���!?�$Q��t����!q7vԡ(�����h?�����aD>����"_F6�,��$-^QO�/�M����i�~9lY�fn���갉f��1<�7��ng[u�_�0ȞK��x���QK���U���.9}�����>9��.
Q�7|���� �c��3��<��\�o�� όn�ϳã���K4�W-��P��˦����ěa�ҥg�"VςtY(!b��jݩ�Hmo'$�K������w�݌�
Q��1#A���%j<{��ne(�l�y�BC^H�Bnz�����aA"�g���S㕑*�%�i����%q����3�lj9fŀZ�U���k}�M"���J� ��l��N�N5�t�B�ZL���:��V(�x�$V�q���J�7�;k-�{2�͝�z~����Fx�7�9&y�Hw�[6��F�{)d�ަ#�1L����F<�i�H'%>���������D`z�0����c��i�Y�7��"�wv�K�<�^��)S��Z7Ql���z���uB7'�@�Jn;'"�L���D	�!�2����#	G���Dw~W%:��$~�&���a�#��FPhD�I3���³�@M�k6���:��a
�5W�Y���~���{�q솏T��W:^ӅaB<7�Y�*e�:S�M�;��t��l��>Y��j�1�~B�"ʚ��+����T��95i9����0�}J4olC�8(g�Rrܝ���yl�`��W=#�C�� ^C��u״U����1G��\Z�u��TT~��S�]IP�5���Ҩk.��z�g?�v�oS��0�SJpW^0���h��;F�b�����k���qL	j5�f7d|󈴡'���ZGT�ۃ�#�<d ��o��?�d�/�T|�,��]�O%|�����N�=�m��0L��}Iύ*� *;	����zVJe�n}zC���a���M��]�s�h���ѐ���D6c���7��2��|����ȏNN:LB�̐5� �Ԙt�:��8F����{c���]ݜ�����wu\��}L����<��iH	BY��Gi3�J������<�ڇ[�r��;��р��ˀ�l�V޽�y�y?Wj�8���w��$����z�jr+9Uϫ/�~��=c1NU+��E=��,Z���7����S�g�Z����ع�&WګEr��qa��8���Q���C����ц,V��?��k�klP����DUd䲞�S��l�Hn:�Y�
M��1�+�=���~�M{~�5c�W�\����h�KZ%tD�9WQ��*�����{�C�WTm����Q
_��[·�+�ᙟo��IT|��W}���K�P1F�n��i�4�uxW��6��7'�r��� �#�y�iM�2��O)�#D|Q�-���8�l%Pr&[��f�7��8�F�ץ�,�i��������q٩�>[��۔da�o)��֛h�    sEF��ꂗ,d���0�z�N��S*�J+���vk�!g<���W��Y�NA�Fd�;���D7��V�k]���ƈ�^ȓx!9�	�^�w0�G�]a���גn��qR��Őb��o>���cɟFz����G��Tx� �����r`���m�ˬ����J�8?�"%����'�p�8�jk��p]C�V��)�س�U�ѻ��u��oӒ'w���}L��6g��j��[��y1�w�9�u:Nd��y�!�s�C6��l���K�<b���T�Ι��^��]b ��JE�Z�O&��f�n��'T�t/�5z}��o������j>� Z��jK]�r�2i���o*�o�����	�^���ҹw�	�t.�s	���ا���YV�h�}�^Ы�u��`��s]�놱��?�ݱO�ə��${DkC6��N��#D	,�z)�a�"�F,M����`�FF��z"����N�y���'����s�_Bj9�S���NȲ�~�߯:�0�a3�!H�2�KK�#���U��	o�P�x��`ѸnԮ��[�豭h�#�Œ��!W9-�Q�y���d���%IĎ>��=w��&�z��'o2���'������g��m��Yܭ~U���}��i��w�Fn�|��@���,��	ӺC��[����7S��J��vP�
\n�h$��`n�Z����0�竪C��/�3���L�s�|�w�᩽��0\>�Kыp]����N��&���>��A;W.���0�w��f���{6A���[r�Hs0����W�rHĖ�t�U�Y'I�2��iJ�-.����w�g%���hF�9�9	/&dPw��jNKi�~֚�u��H�Lt��N0H� (��~��]����y��0L�d�m���<#��;N|g�l���)���u	2p� ��0�쫐x҅d�)X�N�4�e��������^��a+3��c0f8_���{�����+���<%iD��t���BJ��u*)Z����u�?R����w�,Q���fJֵ�v�W��{��K��r3�<dւ�3�>�ևO�r,�t�>�lϏƄ]�G4כMt���i� ��8V��H�XO���a�u���I�}�h�C ⾣�=�U�+���m���Dr�v�}u8�TNh�$��3c4�je��|>P��i
�\���O�I��0N��c�o�uZi;X��'u�_�Qv����bN�t��%���>���R�5�w�!W�ϩm�^��W�i�j��+U��V9�ժ\�T�*g��J����Gv���g ����5Gj��o`L�3Oǡh1`���=!V�Qe<�/`�+W�(��v�#�P�B��6�д����<S+|o)79z�t�-��Rj>���J��G�0������*&s!P�f=��r�'5�)1_^���TU��9�G�86�z�;Q�oq�e�/�LA^����}�D�A���\&&#�IZ������RA�c�����h-�*�P��w]�U�9�؂�.���x��]׎4�=�hD����~+��g9�W�H=�X	�N�C��<�ըƔ�|�
�Q/#��BT�=�½�׳;i�K��aڧՒo�4�7�<K���}L�Y}��� 9"����2z������Q�rҰlg����ƈoqכ����|�6<�h��� ���EfmE���uô ��s��p�J�f���%5�բ��s��l�/�~#��l�F)��8�+x�2�դ��. �՟�i���W�>�y,�,��g�I�[jNR�������}����M���As�W#�=u�i�&;�W��MJ��*%(T���i�?R0�O��M���<c<6r2��,��uz�œ^$*�=�bܘU'����y���$����H�;S�}k�5y踍s�����٘��������_����_�߽��D4F�Vr�pXb�4h����8���{&����?�l�O���)�����P��o�xa���t7*J��-=�>-����9�+��FQ��{��������b+�@�̐a �a��f�k�C���Q���6�	Z��b0G �#��*���yJ%>H�~�H��^/R�)���Ӝ1ԶF&�i���Z��g��0AV&W�&V�~��s���>A��㙝z�|����O}No�EЙ�%2Dj	Є0�٨���G �^.|�r�c�D�H�A�S*��͖�rG�?��E{����H���i4 �% ��R}����?���O�?��?��=�N�~��$r-�n�$$�t�Y���H��Mbu�#0��;����F:�Y� &��,j�'�o+�HG����?��m4*�7r�p�'��CM����R����+�C��o��x͠�T�������9�gW��[��A�"��Δ,j'Y��HE���i��%���2��N���|{n�x�
��SnL�Z��)���_�b�-ۇ��Ji��vp��"�D�6�/�LF&4��H7��F�|�eg��Mx@l�q����R��`���]�I�*���2;��b�FR�΋Z��y��0�~$���
�}��rJ��k@�D�����þo�O����0d�'E�n�uUc=n%�"@�s����%'Zȏ_��ȕ[K�v���t��s�6�J{�%��
���0���ht�O)��O�SG�8�������0�~b��.4/��pO�/�v�I�1����4�����7�f1/'�cˣ_Vj9mN�	��-�E��x� l�[�����W3!����8��^�g	�|��o�h�EPG��	�,��L$N����v1�%�Mn�=k/�ҭ3X1�Jcʴ��?�:T�/:|�ٚ�lፐ�u�iǎ�ũ$N]�u���� wF#Z��}�9c�LBj͚��U�ҏt;�SJ�n���t��3����a���m�"N��<��o�"���ϲ\�������w-�Q�)����1(�H��"Q��ݪ�9bWd
���R�m��5�~��Tꕔ�Z����P�Xy��${y�����2y~*W$��{�*�փ����#|\��T���Ec��Yn7�� >�Sm�1�w�z��C�e��|a���1ܙ���c���P��	�,�S+�^�1a�`���/�/���b~�ehm#u�	�w�g�D�z��	c�oF	iV�I�
G	�Hvt�Z��]�u���{�}r!֋���ҷ�,}Y�ۣ�42���7�W�:��!�pQ��f�%9ڌ亄TTp�չi����0��	���9"�WD���C|��Ɂ*n��%�<)fƁ|��w2l��) n�cpc�KjT�0����N��k�%)���0����ڲ=��~t�����/�����������φQ�b�6�7gt�q8ee� ��K.V�z�zA6�w����.�,]�#_�]܂QU�����Ç<�F跜�u�~WOX{���X�$8I^sK�˙,W{\���n�D�fgs�A�x���*:J���I�9e~���5��OL�Й�..z8!� �nd����ʑ���$�ဴ5��7�k/܋Tc��}ZRr���{W��v���i���ZF,�'i�֝������������	�#���P��tF�d�s��X��F1�"ۥ����;c��Jróad6H;=���7�����e�?8���+Z��z�=)��F��K�$�a��w�󬿏I��`���Gh�q)b\a»0�)�	�Rx���H�0�2 �E9+�^���i����NF�m[Y���a�diW���Q2����+�Q.��|$m��ƒǕ�~S>\�nXz�|"��P��N q���v"j���&J��t֗��K�]�;R��]Mt���fx�O��_�o[�{vN�R�Hv�5���1�ɛ$-_�;��qb��� q���j��NH��������=4-h�B� �T��ko����0-[HQ5_��6#��	,2�F��Db_Yl��Z��"-z���sS7:�gŎԩ���ܷ%)gR��v���0�)��t�kW\��1�t ��.�w�g�OI�S�˕D��R*��.:[xJ    �7Ff=ow�~cJ�~pA���$�@;v�<@�u�z;���O�~�%J�%_�`u,s�ǔ��pɁa@����矒��lr�&�ܲ��z��4�H��D�[���/`� ��D�����xOb�l�J"��g�i�������Ñ�f�;R ��_��1�o��|�_�H�������^&�� %�Ěw�Ȧ�Ԧ��!�/��"nMo�x���Jzx�e���B�[9�=5
��oY?��M�rm�ê���wQu�Q�HI�va[�w�`�`,�y@��ߡ��ԃ�x���m� �%y(T�戽7{�\�5�A0̘��w�F����G_�xN���ʵ��_�u�	A��i�E�ﰇa��y��������A�$�7�'�^�
\�-�����SbG�&{΋5�0�e����8����8~���B񐈡��\\
��8�th�����~R�@t�L���z�~��+���.�;u�z��<u�@pC��,���H�BT�ԋ��rE�M0�����=��Y��s>.K�5���1膶�6�Ԣ�Rw�C懃~�v$��[��X�rC�"��E���N�d�B2�xM���_�p0L��Q�	ȃ������5�ƞJ+~�&7=�]�|���GZ�Ֆ�/5����+[���_�.L�\ofG�l���n1xK��06�aπ4�@L���ԡ��)OM�K��;�ad����ۛ�_���y1��h��V	׻c�c�(� %�+;Y^�5KS���}*l0Oʲ�b L�J��-$���l���j�vñ�z;�B���b�h�9��������N�f�qv��U^!8.g!�jʊ���c)l"W�Vϲ�R_��axw�浘���J�Y5H�J�i�Q}�*�q���'�5���_�Z����S0?����e��H}��k�ؑ�t����I�iu�͟�5�-����>N��c���������wݙ�F��^e��L�q��71x�^�����;"��ٞ�M���Z]%U	�dq�v����YR �Jԑl��r8l?o���4�Կ��])b��8U�TL�.Lթ*(��}L�H��Q+>P`���q*�S�ǩt�=��_�g�a���W��7�NE�I� ��|�)��xj��ƀ���BOnׅ�@j�:�\�8b˘��ҿ��b��ܬ�/!����k\a�f��x�3^/D�]?��>_犿��qa�322����6��a�^qAL=c�f\�aZ�,v�.wg����G���#a���+.�3�oI��ْM�xY�7G���a(G�	�ߴ�#kt!h�X�X2/�"��m�#H��^N-;Q��﮲e�F��z�h�
�,��7mx[Ź��,����H6�V�(q�\��$��rx�O�2'�n)I�P�v�\Cd��#�-���N�;�9�I�F�z>#��?M�2����!���8�����c�q>��۾����*z�\��ŀ^��ߍti�5���68�S�y���4B��Y[d�yi����֫��Z�.:���õ�R<)\<�N�w�j��&O���N�? �X�b�y���b�q����L Yi���ޯ���A��;������% �� ��hn���pN1���L�X,�`t=����i��ԩ|�P�܇Nyk�xE4,�RH�wG}�p$}���0��*��Q��R���]�Li��kj)N�ڍaVN+�	E%����c�QW��"�|�����H	Z�є�~�W8_�L�f��*/�l~�x�[�k��&%�8��<�W���(��qԺ�@ү~�a��7�h�áS���)tv�8�0F�ck�����'��nH��Խ��dc����>�
����)A&�/s.�]�d��C�ґ��S��k ��dh���x3�G�s�,; s�%��9�3	�����1ް�'b�K}$a��fcj�Z��R1G�p"�z�0�Wc�ޤJ�C�,2 ]�9Pe/�w��*,6 `��Z�ߚ|8�+j£��˂�;cgK_��\#`���Ir��)SlVm)	-ŦH�JGN�	��]/�:9U�v�#�=r�s���-S�TM�%?��:��xI�> �7"ⵣ��E�LE�}v+a.���j���uF?����7�8z�c�6$��4\��,ǨG��ϧ֔<J_�f�n�U���9���P?ŏβp�Q�׫Ti�H�9�ҍ�$n5;�7r���2&�2#�&�����/ä�b&}�.RH�0����@�2�;S�a��|/Ç[���x�ٲA]��z-bʬ�����>���T���MGh��7nD����G;�r���0D�v�|�" K��$�����D�g�2�~Z*{����X�+�u�ș�qw��h�ϧ������P�}��xv��K_\K�6�$��%�a�y��|7ϮS��\�!��Z��sd/����W��+K/�{|�h�r��l�)�t���D���[����;I/3��rw`�,�#%�`JJyR���Ôr����O���g��aw�D6�o��Ϝ�]�� #�+F�ͯ?	I_V���H�!kL0O�%���R�ᐧ��+��u[ma���Z�w%�u<�\�����c�=W�o)^�0�x�4$ -�y1��,n��Hj��g��sA���4C��������rk#��n�ۜ� ���I�$9"f�I�]�J�8�k�<'@�L;ق��ƣ�kd�\�uvъt3߳�	�
�<�	d��ɽDv���O�<�#7�x-��F�^&���,c��ض�����h�>e��f�p�m����𬵥�Y�%t���W��@�7��Vx՜�>���:n(��*��ۅ�t�̮hs��~ʜ/iI\�H�#D>m{�y�%�a�����<C�����qo9����ρ��`���jN�8��.r�*�N��Pj$o{�>_O��,��3n|�#���?�"�IRW9n��-��z.�����W�]�֕�N������]`l������4|�ެ �^d�h�%�=�e1�U�,��y����;"Ј:���\�����"MǙ���_1��i
W-�H�ꮍK��Z`_O��@�;�̢�3�
$&qnR	���D�㞝V@��
N _}^(�m(�1��W�@�q�x7��g�A��D�G+`�� l�o?���r��>�o�T�o�_�N@��A��L�iΚɩ����g�g)������o�;��N�L�5GnH����hq`���T<��(�����oL�{ə��1�F��	^!W�g\��c�����5���W2�K��(�Ŀ��v��k�Jo��f\����Ĕ��eOO�T�.lp�⏭��֘Y'ݥ�*���q����@��[ ��E��P2�T�DCW�'��,t�a,W�o<�M����P(�,��QV݂ ��>o��l�h����lZNh:�,g��{^������_� �µ�1\�;TA��1�i����.����)��A�du���>��v n�$�s��yx������2�Srj�	X��	���W�S]�U33�FD��C524nX��$s�čy�ҝ@WVG�c0��� ��ۥey]������Z�{��, ��^�iԇ7��0�|�F����^V���ߨ�[:����x��u�\:��q��&��w_\�q*�SF��T 2�y40�<��q�ی?T��Tz������R��p�J�����f�d{�b�7�J0y�Q������g�I�r܆u�KwA����iR�f��Vs���A)��-�~�RX�	w>g�i�/y���n�j�J�9�^�V�5�A^��{��W��߅TO�(�^/�@ςn�������$���#2/��yÿ�]�#�U "e���"r9��:z�.cθ/�S�a,�S��� ����Y�┋�\��VL`������5���?�
ȡ�r�#ţG�=�:���s�Z#t���M�o��`i2Z�x����;9�k[I��0����e3�����uu��,��@��������ŏ_�Ᏺ�����qRLCF`��^�������IT�lHL�$��O沧e    #"B�nN�����"�х^���	0H��{������|y��w�p�g��k9Ջ��<NNZ<�UM�֊�ngD���,�r��(��RRd�����ؾ⬦)k��a4����7[����R�R2��ۗ�fG�+��]�eI��U��6���e���s�*\�ϗ�����Z��;&��-zxq�����g#�0����_V���0�>���)E�~�G�Q=�9����0��.7;5lk�<�v�e2dY/m�b��~C���
D7YsD6�=>$5���,�]ʎ�}o��v��a�X��5ݫ��H�*���L�dX�����_0}γ�e�-���XȈ��V��1�r�i����K��c$vUl�F�;��~ȿ��yԣIX^_���0�V�����=g-R�O�D�y��g7�׫pi�`.-�p�/h��CY�ǡ�
��0)G�Y�z@�N0��^A[��޴hKj\�Z<t�����+c<��a�SQ/
Q�X��.�[�]z" ;�>n���`����ָFZ͒䴵$���% .��g*=�@��ar-�b�����`���hY�vs½�����oL�S��t�8d�$:J�dm!N{�8����QiH�"�|��E��<���Ћ�v ��b�����hN7|�c�� t_5�����6y׺����_�D�)�w����w��&|n8�8�$X>F[���QK"��q����Y�8�Y��	�@�3f�q��O��E�#:�4HEҵ ���0b�8�g���R�Ƿ�����I�e#	�w�D�;o.���� �)�i�b��������F�͚G���K��?�"!^?iT&j���r���9��E��V_p�\��ܴ�e�n��iE���e�|����PIX@(��hA�����������Fϣ.o���rT�jtj)�{��	{h��0�	�)7ʪ���ěA����^��̪]ΒV�u2�W���qv�����6�s⡌/M P|�T�f;{5���*_��&�)�Ӎ*E���U���%�j\#��M�>ݤ��a�#F�f"�dë;K��0�N��	�W?/���n�\r�+~�9I<�)Z#�:Z&(�g/�5�aN���U���I37�³�@�k��h���e��j�@JW=e�x6���Ef)��2c���O���jX]Ʀ7&E���ݡ�ׅ0���������׶�1����$��&rI��j��%
�/`���1���pVWO��N�x��1d�l6:�@un�"��QXɉ�z"�>o��2'%A�+h�ÿ�D(�/?��!y�	}�����7Mn������v�$=Q� �6���8�����P����I��.&���!.��f������'��?����G�G�H��j�[�¥�Xa]�(�{��/�t"��8���K�?�j�O,Zd���P���I�W�?�|#H�Xڎo_Ƣ��S�#�$��c���t�O
M-+��D�������-#~���X�����"ǿg��k�T��'A�nUp�^d��A���B�lK�7�?�������n����#�OK}����gj�fN>Gٯa��̸�����j�'�Q�=�|כ�̾dpӺ�ûo�&g�)��E���p�?-	F���#pY<�d��%,�0�|������r�4⢁�3���J��V@���e��?���tA�p�	��\�)��!���.>�}��iu�ٿh*��˴\L	w[F`��+�=")~�\�a0'kj\�*ճ��H�)���8E"����o|xz���d�M�jTR|xܘ��$�E�GȪ�K���a��#�,�T�p[���G�<�Xf�Vk?�)~8r���z�k�Bd}Г� !.�Y�8���|�Ƭ/5��n�����ԑ+�������B#�Ç�7L���7�o���Z��U���9-�d4������	�&7�I����w��&M��H����A�?�c��C�T�f���.Z�Vܘ��%bS9�ס�|�����a�#�^/S��n�f� 3~p&�MکX�J���H7O	g�!r%�q��7��3=��7�����xc@��{�%#���<��x<�ƽ����2U��x�qy3p��U�H$GRU�8��!s�k�/F> �J�@߶ڊ�
#"����u������=e���Ƭ^y58%�PJ�K��eť	�w�y�K�����s3h+���Z��5N'+-���H!��l~�B��_���V���8�Sh�r����}�%���{����k��s�ץ�	i�z$��O�2w]�gJ����x�����!��s�EZ���tጟ�G1��Q2^�֣�7݅-;�m���bSM����ɧ$�pS���c��)��h|���E����O�K5�7Ř��/#���B�ơ�j?I��]����������:K�Ǿ���� j���Q�~�0	�^e���95�a�$g�e97g�u���ϻM��1t3��JCd����j5gs%����s8��O0�|��U������m������Zz@����Ơݔ�x_�V���wz�K��pms��gs7ҧ������Qi��֛z���f�����ˋ�>�7L�&u)-��#X�]V`�[4c<�@�o�~�F�|������CSu�h������`w���C�$�!f���?�*Za��#�uk��8X�T3W�~�a����JEmm7���92gi�Z�i�{�/�w�@�����9x?����-WҠ;Ij����\�G�o�u�xq�5e��KDW$�6��� ��!�0J��lE��@ϦIr�V*����m-��n��m뛧q���9��5	�{������\^��0�>�Po�����R�̧�u�Sr��`�W�����E�pDk�"X���}"�dɮ /�z��c��Z��O�f7۝d���%QOn^m�۩ s�i�����aRn-eo.|nܩ�5{.?���לv�B���|��{����lZߵ�H���v#׾Y������a R%�+Q��@����d.��zl�*�&[���i(�0����"U��S�����KN�c����dK��>O���䅮Z`x��1����.�+�M��waO�ܦ�⅏��9�����o�>Vn@	��޴S{��ä�#6�(�U�����Uw _Jy��Z麀�y����u�?V��ō�əe�DyZ�T��N��p�bc��>�s^3n�uڮ�D��͹w�V�"TX)|L;*�_��w���Z��C�A䆋0BM��י2�#�b��H�ğ��?����������E��.J+�vt��o���?�ѡ�=�����.���F����|b<s >�)b���lMt�~{z�a��g|c�q�M����H:h_����������Ei��lL��Z/z�'��Yl�3RQĀ��Gഋ}��T��t&��HN�p�'\��OM&���9��R�f��*����Ɂzz |J-���n��a:�?���o��X���(*r/��������̔y{��k�O�_�:���9�+,V������p=���M��a�r��E�#�z�������S�$�w����~^�1�2a6C��@ـ����V�Q� 4����_�ߘ4�+�P{,�>O����m�Oi-,ۥ ����������&/�>Ш�a9�-�K��[8��/��n�L�!����\d)��NP�����u�9����u&w&��\i�pģ�It�ϵ�0{\��<%�dɑj�8�R/�9М}ŞuK�	ox�XoOz�2�|��"%�>����j*�ǁ|���0��ǧ꾆!�X՛���p����0"��W����r��19�PY�f��j8��eQ*�Y��1��BԿtT��� ��f����[|�K����b������z9&C�hb7�vI�t1�\��%]w�Q���y�쐆�(�M��M���=��#��{�1mv�O�כ�_Z��\���L��=��    �Trf��+u�LO��0��u�Pu^��B��wg"�����������~��>�.�$E�}�<��;5WS����ut�ק��0�R��p�[�>�����{NՅaF�^K���ϑ�_��ʆ�^m�7R��!#3ૣX�ۓ#��h�q���n�7�4�H�4ji���#{����d#�e��C�	����RD哓�<U6R�gFZ0mM=&>����;��[/�1�Ϫ����[�@1m�����,x}�0������"S�H���x3�w�)dJӊFҍL���	�ߪ~����A�%U��Գ�64�w`��[Y�^/�@Nr<��1̜�0�&[Cj����H���|=�N���4r�=�$�L�yBH��Tn�"9������!�hMz����5D�^�]��e�.�<rw=���C��QoȜ7y�����9��ƌ$Wڌ���:��7�N:�n޹�()�>sȮ�6���t��S%�N1�M�m�X�۟3IOfn�`��	&��		��iqc���=��A#��y����7��{fs�5�׫a�Y����ϙ�9u��Z�\�R�GJ=�#ߞr���ۧBm7Ηv܋Ƶ���������4m�c��C�a�~�ԫ	�S�$� �J�P��֊�r�2�ל=�J7�� 2&�)��p�\���gR��ל�O�a,x|C�l�d��Er�rݱOe�J�˺ʿ�P��f�İ�*��彑�-NUO\޳o���"��0�DJ����[��xY�n5��Z��F[�|W	%[��U�����P�dbM{ĩTs^����y��o�d�)����ü��dˡ�j�S���@1���I���~C�9�P�x@ܒ��w1	_<�N>��<�\)�����>�G\J5��#g�35y��m�W�,�J$p���Qx�S}Slk�!e���%C^��J��'��o��x[�jS�\i.>3\���WE�sN}�Z��ff��O���64s����{��`,=ޟ��MD��1s��}�2Qs���1�j	3�0^�Ð~ �n4tk\��2��
^R��Na�Jċֲ�S���'�����f�v$�4!�ֳiP�p����'��Z/J��Ef4g~D���*Ӿ�?�,����G%�	<���Ȕ����Oa�|Y��m�C�'<%�4���[��c��D��R�{Up~�I�/�,��E�ĳ�蘢����p1�`�i]�=ߡ��/�e<G��NY5��O|b?8�jR�Uh��|��$ Gl��D��Z����\�݁��2:9Rb�W6�0�*����h����Z��ț"#@j�����<_��}������O�d`aO�>(G��5'r$^�����0���tS����?9*?�٥E�����r�-����a�TD����y��g���c��9j%�����mi����lFH�\:^�Ύa��Պ.�w/�����8+�U����|Ν����_I�QS�F�F��>.}��0�����1sQ8�x@��v��'p�kwŁ��_�$��ǈ\q�|�;Pf�,=ģ�	R��i��y}
$�0���� ;����	f�M��/8��/��z_�`:_m7�7;��BI �ɐN�xX��nLm�� �"հ]��n�W,�Sޘ�u�O���8����4�&q��u9@�f�-�������p�֘����ݷ��y��L)D�g�����OZ���x;��['��\n����Db��fz�CCi��L�Ya?�`<gc�䊄�m�6�#o�I�n\�*�a�B��<3`��Z��Q�zؒf4��۸/�f���9k��a"$���Ħ J����'%M~͖��myu�!�<����^u!�Y�H�l�E�4���b���n9B�*�,�I[;Հ�p�h���ּ��9*�}��}/Y�0��7%]xfe�����KO�@�Y�#��ջ0��.��!��Dr�ͭ�39�\���*�W�7&�v9P����{͠�3;Z9�Rˬ��(+^� 	�P���(C3&��&^����A��w{�u�a� ��0?ogŃ����Mô��KJ��
�[�}��5�X$87ک̹,�S�|�N��U�xt�!�J��7��U��b�/����;��]X��������o&��#�͍�q	2A�3�9K��m�իIj��o�,R9�z�c�3v�C߱��)C\1�PF��W�?����=�/����5)����e��l�&S�&��['a�� sC� ��$[�)\]O��xOVܕ152��G@8��?��F�oNC�EW
5t�\�m�i��j��'&|L����p8v�۝sr��ֈ wg�\�KW�a$����o�G-.�,8씰�4�C��)?L���q�$�A�zscN.��x{ĩ��*�ζ�x�I )��ό�{<��<�_��i��.����O���5Lr�T�Zx�qz|�2sᏼ��]2�W9���8�+�Z�7� 	#�4J��^epQ�����˳�*a�{�����ֿX���y�v�8V��p�KF��Q��N��l����_�`��%��E���}��X��� �,�Ʈ�<s~���P�M�#
�}�n�el�R��	k��3,	6~k��d	�;'��ji�99ɢu�e�y�ǅ���\���0S*Um9��T0Z��J��,�)�����/&iv�7F�#��Җu;���<���kL�2|T]�v�ơʑ�1��1�sr@\��m��c���0��n8���S,��:�;�}�TRj�8X\���ȩ��?�/�M���� F�K-Gq��Ra�=�<o'��7z|�Mo\�Y �Ϥ��~��F��K��p�0L%'mvQ�u�s��F;����S��� ��}��l�_à�ixÏ�3�
ů2����vq�T�X�ˏ=oJ��|3�M$����0��6�J�l���bu?^h���'��k�}�SNˆ��S|X$�H��8��v��k�O<��1k��4��4��xn ����u"����;�qov%5Qa���.�&��81�������:��+5�P�.�]C�C>�>5��"���4��moz�y
C�9��]cU�R�$G��0�g7Ht��p��b�&�R��ݤJ3�?gD�3�}ⲌYˢ]�SK����D��sC,��E�䌆�\�HVo+mEl
h�۟�J��O
��ż\�ה���D+RN�ɣ���SJI����7��s /譌�U�lZ��������v���a8Et��d׻)��1^���5R�8M5nK�͸�5L����"�i�R,�8�C��<(�{�����܆_�@��$e��1�V�����$�q �5mNu=�T��0���n �0:>�~yA��֊�$��}�z=\�~�
(��4�3O-s$�K��u']�V=��g��A����L�Z�Ȧ��`]�"-�w+SS� �����0���f&�:��jeh�!W\�a9d$
ľ��}��Fx�����0��o9Ƶ@-t`��;"���ɮ���)�T�ȭ4����{*r��W�p�û��\E�}�Vw=���&]Ga�	;<�L�U�y?X{����a�W"+~�HV��Iq�ɓ�6%���j����v���PU�R���P	PSs�a�zh��3�0L��|�B�Xؓ�R�����,�^����qa�����!% ��Sb��w��g6h��qmmٵo��:�À|X�n�qs�1�o/p"�I	�/+)*������0���Ս9���N��б��UV��v��_�R�P����Ч�)ҩ(}�qJ��#�Uv����RN�x��.��\,`/�df�;w3��C���ǩo�fI�{i����=���B��=t���5#<���zߚ�korSr�gm�_ōT�=��KIOP��k1���o�.sQ�Kv^�Z��
�gN�8D&0r�|>�1�1�E
9f"�dc��΄��IIKuj>X�̤�l kg3`�|�u�i*Ilr�[���1I�lW՛��-)�Z�k����#@�M�#�A���a�۸���\���X�Zn �l�t���d�s�>N�}JM�F/��J���	����e�U�a��^��@$�3����Ϧ�I��у��*�"(Q����.dF?�G�W3�5    �Oe(�G.@u��1�e,Q���<%l���nԨ�q�*�җ��J.q�s�.~�#��a�CX��{LmT&�YĢҝ���اwlχk���j�o͹�����P�&λ��䴵FJ�<��\<	c��)i�:���_.�%w?ǌc��קsh��+m��~V�e��hhܘ�!��]�,��K�BbK�F�dwM���#�$�[aި���>��T��au�R���K�s��WB�)β��3m�~^L$���Do�o�Aܓ��E��mj�M�88=�4�m��')�[">C2U�҉SB�Gb-4��J�_�`.XT��"�%Z��T�S��7eg	Xl8׎?�0T?R����dڳ~Y���񙂻͸M�d������f8fuݳF@
<2/��z)��w?{f�8��_q�]�[c�%f͔ ���;)8=��������V�t3N�d��S���=�̨D2��P=��q�0�%����Ւ��cg<%�r��+��0�i�����a�O���>Ca��U�^P�)�.�ڮ����E�����Q��^d�J٢�"'���.ݺ��a�1�n}>��T'q`�������������԰�Ѧ���ڳ��U�ބk:L��w�J)]�Q+��d?��jԑ\I��t�*��%��)=�m�'��.��a��JV��ＧV�GP{K�����F���67>�����a� 27��q��ZF�k�&�^Tj �^���}���n��}"��XF_�������l%��ʒ=v�����_�}��U�aYo6�B��ӌ���=���TEw�O)��L.j��W��pqrʗ�,��+>�S�0^G�I��>�'z���vU�T��9|LXǜz�c�������C�>�������98�
�p�X�O)�Y[o�����;����]l��\/�g��B��uz��!i��xi�G�/|�7c M;��>%���$���Q�L{��r>Ɲ�"�޻3͉�����zh\ ��|�!mx�K�_F������b�{���p��#.��1��o�����ft��q��`�[_�U�V:�p=s��&?U�j��m��}h��Ǩe��
vi�?�ư~4�0���;�K�O����]�:�ԭ�<wӗ�*\�M�A��#r~u�a�4�oF�h�o{}��9�Ġ7ٵ{M �%��D�geϋ��jDn��pb���S����eAj\�̚~��
����$27�%�!��U\1�#���`���2M����O;�ҏ~Fr|�]�ׅ��v�����a6r�xC�ny\��kJ�5�|�c�\�2 r}ā�{��նF}�7��v����6%�C���ȗSdx��]�y�� �͍��
�v҅3q����EDa��*�zL 4��1�F��ڋ���D4�WA�Q��=�0L�����Lu�@�$;��h�Kb��ut�o�Y,�|�N������SŁ:���3#�?<_gà}Uo �0�X�t��6[ju�@z�6g5��!Kqw�g��l�����8�y�Z��ܯ��z����j7O��p�	J��ͱ�O�Y�,�~ݛ?_��ߪ~���7�� ��A�%�Î��k$��8N{&����/�:C�YH�����%H��1�#$�������:�'ߐ���7R�p�jǲ�DT�L2Q��j�v-��o?��a�����Ͻ���PL��eR�c� �oש~��?O�]�$ZK�P-0�,߽H�H�>�1�o�oO�}��Q���ڭ�S���$/�2'�Ԋ~�������]CԣR�,K�Yٜ2R�rW)���#x_�p�0��b���C���[��sZx��͒�Cp����ϱK�o�/�r�'���u�e�p#�!�m�\1��9�1^!���{��I#[hoO?����6d�U��I/�O��׎;�F��T�\c ��I7�GJ�n
�$�AXD���0�|��xΗ��n��4�oSCo��ڄ�s����M花\��Sq�Ժ�V�nZ�i�Cx�㓉a�������4qlYާ�AN?��3�\t�A޺������k�����C��Q���/���
����w��a�p�!���&��6S�w�ZږQ��=�,��\� �l�a������\t�Q��8���0,�v�H 2"�N>ɸ;qc�@ޒ�^��<�����m3��t '+�y�S���~&.Q�
9��e_�4���^�q����1�[�����b���e�־�T*�&ZK8��x��[��������^M���������O����������Mҳ�a��dW�����������3�������������m��F���?���r8ˍ\��)��J|y��}� bʴa��{�ӱ?���?�U- 7�O^���̞��8{
�XѬ�p|>��8���G��M���Os��r�I9�"��P�K���1����4}*�ߴ�֐�,�Vs����ҙW��5�\Mz�0 �0sh��Q��!��D8��*S��wd�?�0����tCk�6���h�!yr�@()F���vm�:�7��^�����t9�z�Ms�(� ����<�)i�5���T����í�{l�m�[����3�D�Y��f�ωY^�a��#�lwDFc�xT���zFӾ$͞���!8k_{����N�xT��lK������0@a�q�l-�S����ǒ"{��ƀ�8��0(I<�W��vx� n�/�]�4���:�����0L��>6���\��P,����P�����=�G&�,�REo� Ҭ�v	�
)o�K?]�5�^�V�o�̈́a��V���(�:��q����N�
Gh"���q���a�>(�x1󔓓�}���q`�e7�/q�~�a<P̕^���������TF���q��1����]�`V�!	�C���Kі&9�af�>���|�#�cI�����#/�$ye��(]3��X���y���a���7���:E^̹^�#�qwz��5_ ����7�nX�k=k;�x$|��2����������'5��۟VS�"�3Y(z�^�-�fhF�'��������􆭣�Ys�5b��Gj}R�o$/&D���oL^�C5��1#���^��S�$'5�TA���r���a~���D��\9��1�e�]ؚ{Ak��*=� �/j��m��r��*G��x> ������B���S	p�^��`v��=J�>�@�4��.�+1�wT�S�\Z���eȉ5(B�L\���}CY��z���e�e"� 1����3����\�_�	�p���P��>w�X=�W���ZZn�ڀ�n̗'�n�w��Z�4���t��K
� ��>NBq�~i����wT�5G9<2(%	q�Sܖ)Bw}\��k��Nl�":��;��Jků*������@����W��coN.fV�pMa	�х��xB����ܖ��"����f��9nE�`Ҷ\�=�5j���R���띶0��17*Uv���=����R**��m�~��!�԰�M������Hr��F��!e�p���6y�� �ջȄ��@x�>=��T��	�e-L��zޯޅa�2b��"\�~�5	3�8Űzvݪ�#��z�!C��z�|g��mI�+K�՜�P6�>ԡ�����=�!��Y�m���~��#@��ر�x�x_x�-ǽ�8��;�B��i�U���a&�y�����i��9O7�@���eu��[�a~"����u����5��Q(���������aH�\���R ��Gߞ{����1�)D�,�<�B��$�~�G_ �x4a*}�]��e)���u��0Ld
�r�|% ,�g�a"K2�T�wO�L��|������7u*� *�^j����p�2���Nn���7˿h852����φ��ڴ�|K	�<�v3��w <(:sg<^P�֑��#YZ�y�Kٝ5˵��8�5+���u@�2d���L��z}e���5P=ݴ���4)��Zru�S\uN*2 ry���kl���W�$�ĺ�5
9ogr�iv�:��x��
�f�%����C������    )��L�g�	v�J|ɛ݊-�n%�>FJ[*3Ip�f�O{}^3���t!#O�qa�X�^Z)D={8�E}Jܢ��a�����fb��s�b�wSzs�tfif]���_�L�ޕ5�p)E�&�,|�<�k�M��>_s���^Ao���Vpw��r?)ձ
�/�tڏxIIYM���T�z@8�Qv�*���I3�k�m:}���0U&�Do�������\�ɘJe��&��ɂ��M���D�W*`�G=���r�>5L,u����۞U���H���%GC.���aM�s���&�+o|�/�����5�sPfK���LY�A(6:|������H|�Xc$B{�,r�5�HF�G�F�����~i���"��f@��ˮ�A�K��e�Է8r�����\�$i#�]�8��<U��*j=}�&���0�=@�Mf]g�J�40[1�L(���p�y��~�-�z324m"��s��{��S:�������e�`mrÏ��pU�+�I��7���^��B��up���Z$�7 �A����H�|��dVh{�~~�a�)asS�"���/	�PƎT�	�M9�7�0-�R��-� �ǁKդ-�ԗ6Kx�ڝ�V~�Ն��8�7��X�㜮��ƙ���c�[`a{�4�B�qF��8H���s�l�j���48ӻ,uޯר�0I&[Yobu;Of��֬q ��Mg	E2i���e�T�f2�x'���S-eh�ja�ɽ���^�I*E����"׾�)Z^yDj^&ki7>.��5ԈՁz/n�s/	�{�WF�k��U8��Hٟ��ï�B�z50�r^KM��H�z�a�g��5���a������D���J��A��2���P7r�D��լ9x�N�>�Gat`*�R�*��l9��|�Ns�� ��%��-q���b;��DR I����!������\�A�@j,b�!�V �Ӂ�����������w���(�%�wqw|Ez��g��g>�8��jҘ�ޔt��J�Q9)��,O�����*�����bx��T���B9�V��cY�2��y���˚�$Ϊ���6l�V�BO�{J'�rlͰ���a�圃�
] _�!�P�$�������v{�*1Cr�bЧ>��[�v@!�V������_������MZ��13���Wxc��1(�̹t��M�|��Y� �zQ��XeHi�2YIf6j6�g�$��.�Ok�a�#�~3����ʴ���҉���.�qƉ���۳��pR���'kz/a��1��t�Z��� i��7�� �zJ��B��V��Z%���2�����/��7��w�D\n֔�����r�N^��Y�p�+2�׫a�O�_����
�:r˻%v+���,2{��aX?��.��4J����_R�1V$�Ek�9g�|I���7�*3���� ɶ_#>�$9�>�E�����&}�� WE.nLo����d��i�K�|Y&�e��zJ���O����������f2`S�V,,��v�������)��;�7^�)Rsf(YGM�&�<G���<ON�����\$�Ч�T'5�W�a�]�
o�g���oїMG]ܘ&���K����B��Þ�x���0�'�Nn�Tv4ɀ������>޹M<��!�0�����>��+�2(�{&�Zl�|~ց�;~�Xoj��&��(����*Ng�%��q��-�0��im7�$���B�Z';�s�a��a�&y�ߖ���ٕ8ww&�Q���Uz��F�S��	�`������;R/Uz�k�j�'b6��\���.QI�������L�ۧǅ1N9%ղ��v:�H�߷�H!��(��x���#0fTRڴ���I�ߤ������'�a��	��1XĚy]M�=�Br�#!^�$������h�5��ŖmH#2����l����.bR?]1R�6g2N�v�v�D���skΙp�D�
���$�,��c�����ݑV�/��/��S�n�5��H��=�����bő@���^���t�(ag�p1� g��J]�p������mwD�m+�W	�6HQ���or�ϙ��$��`2��_r�����5�.� ����q�U�H�k����[���Yj9�F�ҹ��9iCk���N�-��T5���r�;��Z�������)|kx���=���p"Ȕ��MIm�����x!P/p9�\W�����#pT'լ';��=f�g�>7tڻ������M*�E�'~J��;��R���V������K#LP�80��N�.�[�%��(T���ԗ#D8�9�����T��+@>80U������#��,	H�~�~����U>���呗��4��[rM�� b�^FM�>YK�>��|�T,�H����_
�m�b�s+�i����k}H�ỉ'd�X��N�}�_���pd�n�n�;)��K[^;R���>xO�M=���Z���1Z��q9z��2���B!�3�ǹ�)�
�׷55�ڨ
�̄7�S9�*J�X�vB3����(��t90��l,g㚄T��h�Et&ǅzI��?H���g��qM+ 'r�y���J���<gN���ņ���7�_�t�z�I������a�00��xʓ���O����0E�T���~o�(갑���)�6� AaYc�(r{R�W	��T$-��Ԣ@*^1��fuV�C<f����*�w�ON�R6{N�m�M����N^�w���� �U;IJ1�r(f�Ѡ�G�zEi�Y�޿�N�����������k��[�����dE���^�K�4�́j�g�?���������Y���?��=�,&*�Iޭ^3��	Z_��P�=�������~�n�	����� �Xj�߁�Zz�ϭ�ϴ��sadw���bS������^������Ή�����lᢪY@�.
?3��M�I�4;��'����i����X����/0T�*�%�Y�����<�l��\���ex��*rw��W�NbÓ���k�a�2�xi���Wi��pqC�wO���d|�倘���k��[�2d:����Z-e\^��}���lz"x���Ѣ�B����Q���"��Z�������l%;�](1)��s[����z&��|:JC���f�z�5���j)��_�B�l���R/2���ځA}�:I=h�@�9�gS�P���������0�vy��t�~�NI�^��R��y�Ѩ���Cc	I1���~q}�)�T�A�As{/l��N��<Y�B������qA��ק��!)��,��5^��E*���Xl!}���f�Z^��J��=��-�Ia@�!w�p�D]�������̏�*�tX��Н���;�����bD�۾{�����c8I�m�E2=�n�H/#=��*Sc����Fu-�z���Q/��5&��6�{�� u��~����$8�w�k��%Z9��l�cT��V�c�~ww[�"��A֓�	�6��"��i�pz�c'���w?��>VNZ��Gal���5r�f�r���,�}�C�s c'��m���:$�y=gw[����w�B�K�|�v�����=�_%(��xI ^T��M��{t�Ư��AN�5�*�Fb�^�j�y����ӓ�>��V�%?UO��f���h���yK<,N�6k����4D�X#Y瓵�-����e��D�1��c�zUq�����C�˔I��,NUl{Hq�WZ�N����"���9��,Ɓ��5�,
o�@~d�qU����b=/�o��}@�OX�D�e�Ly�
L�*Ւv�{5� � &�CBr$��
G��L�x����6�W��
��s@/0��F�'�.uӰI��e`8���	!�*�W�g0���X-?:1e�
~b(���L�^��aY�R���#}�`��bL�:	�N5�	樘:���M��8jk��z'��tB�N�^�s������x��ɏ�Tޘo��� F�p�:�I�bk�螋Y����b���JA���_`��P�3��g��E�� &J5�������~`B���zRBJ]��wh������7/4�*��l���Tbe(�I7f?8J�1� e�:2�L    �;R�+x�Oa�z�QW��NP���K��up��E����/�!��Ed;�1��#UJ��b# �Cw�l��6UX�#Jv��J�6.K\��e��TY�4��1F����arp�r'v��Q%XɆz�6����-�`쑜k=x�W%X[�o3'݅�ʭks�����u54>���z�QRov�E�v�4E��&U��RB������#���rZo�y��70�a����o'E#Ĉؑ5s^��*%ء��d��i�{�V�/����МH�A�h�n�֑��P'�f���w���d�n)�u|�g���qu̽�p�˲�3��[�ǿ{����?^��,�aW����������Z�t����^���ٯ��n'�%����D�
w?�p�4���[��4��Tˎ͉�V�Tf�4K1��=�I��Q�n{ٸ}ÿ�(��K&Cڥ�m���
�mOR�m�|�4�L�x��m,�"��L�[��[v��!Q���J_��N`�ӓv� �u7aL2u���v�?������+��_������������7��(�;<����5�YsznJ)a\i#9S��I+����N$�(�:��N�^�$s��9%����V����!�w���k�1��^�:��o�Va{Qם�{�W��� ���B��M����9�?ktXs"�U�n�����?�*�%x�T%É;w^��P]�7PİoN�Z�
�M(�ă�A�D��`��G�wr���S���1�֕~o����$R�'�ש��`U?]��[��i��g0����?���^���������s�T/�N��ufn0fB�P��M&$�=�E�����`��Q�$`,�B�7xM�r(��s����p��
���/+d����'!���Jԉ��~'�O��w����E�Vz�H�J�������z�s�#��?��3���K9&z��	:�� �E�J�էIXM��k���k����_�v��i%V�9u̱�X,�X-Է��m���Ꮕ �]�GWB9Q�Vj���a�h�-C&�H2�����8�)�	QF�0V�1��2{��TA���60�~6o��@�7�v��h��U<��i��A�ӿ������[Vď�d�G�6�$�BIͳ�nٙg�Fk�޿�������@/��6)1E��<���YaY�0p������O�%T�H=���Vy#^-ȳA���^q�� =y��f�X+t�sتo'D�g�y��l�����~���s�����<hq����" �'�'J����ӟހos����3��צ�G��j���#=վ�"�?Z@�O����c�d(gB��,�>[�p�����d�#-���Cg܆?R���C�x�-V ���=#fׁ]�=t%�*�U���J��\� *�o��3"�k���z!/�l?*����>�'��=&���{���Z���n����`j�x����(O{��	����`pZ�y������v'0$xiq"	�)IO�I�UU�2,�Bm�q�'7?�)�)r&��K�39�@�L�皲�03��?|�1ô�dz�}���ٓq�����\���`$$�O�0ׂ�!�4:�G3:_랤�s,9[������A0>��ҹ檫���O*;|�c��c�έ�ͺf����vV���w�����qX��I���Cf�-l�~x�C�d�g�e[B���qk�SQ,�1GZ�myq/�|u��� =��9U�9�K�͵�^㮰Ys��yw
�]��Cd�rp;(/�'�׿CR�i{]���7�:��N
��,�~Q`���t����tS��c�� 0��9Y*�����&u�Kd�GKU�s��X�0�(�a�쟱�`JL^�x�A���S2jU���N�/.��E��<�~2�@zhqQ0�+���n�2Ф�I>���҂��آ�}�M�cv"�QXRc�e��.ަ���x����8�x^�» +&�;:�͙O�O\���0b�p=Y4��U�T<)��{�]����B����P*���\Xa�J��Н�1$rj:�Γ�Ә}��02�`�$Y�Fef���ds��q�ձ���W�W'���كRtk���t�+�l{�u�}�D�o�胞`O����0�I� 0HM���Sm8��J�S%��OVc�����h;\;�
�{u޻tј3����D�?{ms���, ������a�J�:G��Q��
�X���	0�;x�i{2K�+�OĞ��-��7��PO�,<�Ъ���ёJetΫ=�N��D�7[&}S�a�q\�6���Wg�Ձ�5y%ڳ�j]�v|��(T9ِ\e�L�c̈���}]��R�"~`�)^A�������í'�Z['�_˹�\��0�T�z��6JVK^�P����Ą�4�6�3_����t�W7c�V���%�=+e��̞���2��'|�OVЫgwͽ&g���W�a����=若,>��ⵒ��<XC�d֣V�(	d',8x,��~��T�a*v���p�޷g�=cnr�䱸Ή�w��t}��4@;91��ܢ>�����q5�Y��oV+�z���ރ�ɄT��s�x�8��n��P��̵o1�N}�b? �oJ'N�rg0�j;)XKC�����X�7`�c~�OLT۪�x揩����%EȤ��6h���0_`��rƃ��P�,ݯ�9��+��a��$�f�߀��g91Q���벜�h�g��LA���Ġhx�x�L��T���]�W�0��J1�Ue���66ڿ@�!�1��u�Y�0'/����^��� zey{Vb�2�Q3���&;U����	�'j�W�E{��*;�a>��#+���L�J��0Ң	����|}k��(���%��`Kf/Ͼ)emN�<3��I0u�$mk��a�g�>�T@�<r�i{��L�qC׶����U�ׯ�'��xR	sXS>ѭ���ۖT�8qm�q�t���ty�ᯮN~<��Ikv�m�ؕ��Nj�7z���tE��.�ۣi��V�����w���T	IC.	uN/��̛��?����RO�a�+��	z{����K��ЍE��7[W~ �?ة����e��$N5�e�6)5���!�uw��90WI��HeX�^�fZ�����X;	вZ)���������@�4��������>��3�]��p7,ғ�u!�x�������ݜ4j)�z`0v���̵�]���{˽�J©-Th˼|�����S�}���2`���hP��'f8�Y9�������<���8/����,3�J9c"i۫�5���`���OL��y����3�1�R4|+GBp�+�7ڷ� �d���U���vb���재��9741�T~wҁ)?�>T�ɲ�9���뀕�mB��g;f+��p���٢�����'7i��]v+)cc� ��f]�V]X.6K���1�zR*I'ۡ����p��d� �Nz���5�~H-�Q�cL���AE���F	��eG�EaE����2���!�cEO��f,�҈]�����I�-W�5��O���# �L�t�y��A8z��:�5��ovO{q���s����^�4�#�+,����X�XZ��?����]��Jؓ����Kl�l��pI,���k��z��O�����!:��Ħ���DS=��9���$�����M�!�hA�
1�猾�k��)�v�9yƫhu�ˠ��`~ �d�;%�z�^?h�!S�,��)KH��k"Ǔ/���'�3�y�m"'\����ĴƢ��%�9E =r��6תI��/���4�h��v\��L�q�E�s�r��'���2��ݦ9�L+iW�Z�W�� Gze���{�r*-V��d��N�9|������ ��c(�V��;U6�7_f�k�vȣ�X���L/y��+1�}p
f���#Υ�X_� �/��+�qw����Q*䈱������'�W��^��ի�u���L.�~	���AU�m�i����y��K]�]~����VHD�r�� 1<���"~�����mm���3��Ru�x2����L�    :�^�{��ڃf�}����W���9鈢8������u:��� [G/��nW80:�Y��q�:���,I�<-��32�T����R�{X����zb�Qu��[M;�j! ��`��=�ě��J�jØ�:�j~�8Q�1~N��X�,U&,W<P�y4	�6E=�����m$d�����ʉ�*]`�+Z@�<���[��:8:��)����y��V_.G�_<E��V��{�e�7� ��*'��ɤet���+ Z�<yk�\��5�k�(�11�����X���H�iO@X�S�t8}t�n���L_�V�. xQ{b�Sթ��4k�������2�88��b�,�=���ʉ�4ۃj3LF��S�i��������I.�:c5�� ��� ;�)��ۖ=�W�[�M��
��ӑ'��g٠��z(�	C�)y,}�i_u��6d<�fZ�E��_qR�hQx�pɆR�����)��֧ǜ��OA�+��ʉCl�1�77��ꭎ�ݣ����p�X�z��ZY�D'��Wa~S0 J������Ϊ���A����ډbW�s��Tz:��$�9��n�|�� ��tyP������Ģ��;�-�$<���[�_���^0T=��K/��X�
]Q'�+��z���O�B��a^yY$D;� ��������i������?2 ;������7���rPEi�6��LeǫP�!8�1�����u�Ԙ������s����tHN��\�(-4�,�DkXLTH�� q���"��#v����UO��A��{�j�9D��\�	Vz�mfݷ��� �dy�Ə�٫�Ob�3m���wv��i�t���Uɂ�C�(�	��Ek��a!dSÚh{��R1C-�	ռ���O�ǁl��.W<Uh6?��~��^�.�y�)9���F>9����u!jD1[��ٌ���L�W��u��p��Bv�)��/�&'N1v繵��)�Z�{r�j��6�I-�R�A��@c^����_"+��͞n�x�%o�8Ѹ�mv�+V���vn����Q��d:��V]��$!�Rqj|�a��c��/ L�:]2��S�͚�t8%��i[�lQ�̋5LF;��]Mkߩ���Ǜw|�lXųr^t���0�ZL%sF|�s�����0ƃ�)����Ц~ï��d�1d��qw�w��~lt�Ll]�H��� |��Q���,���N�1۽��L<l���|�0�'0�Nc�i^��wФY(!�y��U�T���W�=��RR��"yHe�")�h��U��?;|��ʼ������:6
�'�[wkQ���x{�Գ�ݼ���M�����6E�
٘�V���דL�!j�R��#-�%1!�t�E)a����t��&�p��f�۫���Km^<@���+9�:�9�i�k�¶���Kj�O��5oO�l�k)�����>Bg0!��A�ﴒHk��nu�?.~�ЀN$H��Ɓx����ٛ�\�P�d?9M����{�a�!�X�0=�pm�-�\��sn�y<N�Ф��}^���	L�"8��ؽ�J�ޚ��I��=s�R�����߀�����.cA�hڇy|�h�7k�5��F�xG��,�� '�09��!%�W����%i�a���+�}C�8�92�oL{�g������^��K�"���3�'cw����Q�d%罝��I�n��ケoTN�C�b�2`zԇar��y6��e����?q���ρG����<��= �9�4�S�����k��<N�,����PZ�7�K깍�^w��k��9�@�dm�`<)����hR�C��A���F�z=���INZ/�m
8��?*#��ӻ�kvJL�b��O`
<Bv�R+�<���,K��NU���TpR����LOy9�Y���j�o�ͫ���D{h�u�Aw��L�J�*Ęe��� v�:CL[��,k�双/0E��$<Rk\����*�f�SמҘ� �߼��	g/!��Hk	Np�Ӓz��u��%����s�jw7|rl��r�0�jWgx9$2jH�pj�v"�F���x}m-Ѧ���DJ$�<c�dU��xYݰ��k,m#���=G?������6�ks{��ՏM� �Բ%�<,9�ח� 0T��#��`3�آ�^�<fh�l5��&s^_+i�*��AI0�#���?�� ���,j�uנ��T�T��>8��;���i2n~b<�#���ZI�$�B'��eG��_Qb�ɺ�U�?�b�y��{��py ���(�κ<Ƭ�I��I�Y�"0(m��-_��R���d����$�+Nc�n�X�I�ziM��m^Oc�ݣeg���8��I��/��۝�&U^k��gk���?�4�zo��:� ��`](r`�+:���R)O5�'��;:�#6m;z��1�V˿����1���3-CC��+��H=[�j|C�5\};�y���0�������W�F�Y)��lIfH���v�����cE��4�%0�h��3��f����(-����C ���{��% �Ұu�Z���m���u��+|g@<�䓬�ֻ�_R��TDr�c(A�㱸,�=]0��u������i��`s��-��Z�Ƙ��%�k�P$%]�VƘ ^$��r��Ry��,&�����J�pM�ԓ�TJ�J����x�1�@�O: � �)+''@i��ت�bP� ��6g�&~���gH���o:y"�quR���$Uy-�F�yR��vz�����7'��!�=������FI�����l@[������A��d�0���}ZXurz7�IM����~��:��R�d��xhY�8�S��Z��)vDF�|��}��3<�n��H�2�A��g���Q��N8\ͣv�i�x"�~l�Pjɋ�±{����M�?@��D2�He2��0x��Nc���/�R\`r��C�ZO���2&������*s�um���Ә�O9�T�g��e�X��fL�I�Y���>����`b9��eN�B�N[��,������8�l��	�#��'+\�o�0
e/��=s3�R��]*zK�,t2ý�d��p�z����?J��X��w]�J��Ā�r���W��9��<�pݙ�+�u=�+�~?��k[�H����E1�ma`�e;�i�;��p����o��k[��c��o�X5m�2p�n7�����I���<'I���yM��h��=t/���y���J��=Ű��M:�'�|��l�����!3�����Z�]�_��<=+i�T��2�냯ģ!�r�ĥ6���&^c�Ɍ_.L(y�J�� 0X�pQ<�IB���=1��m-��prZ7������>q!�؋'���+j�PB�R?6C�p�>�ϻ��$�`h'cf��ed�fL��X�{:J6�_%�� # |��-�&�f���l��fh��v}�*�.������"Q�<S^�˽z�n;�<�M ��yVc,�)'�_�u	a�-(�P�e;����R���{_h�x89y�^����f���P�X�g�%ː���}�%+:;�ʛ��Juu?0�9�ё��Z�Kn]��5!�fՓg�*�cb�A��R�'O��K�bד;}I�l���2���m��k%�������OL�؞E��A�PK�����l;DcJ�{�"}c���-��1d��h�,��v�2���Fi���H��	M�ŷ��L?X@E=��l�b(�B/&*��//�s��Ĕh�p�v\%�ܸ��%W��n�f�O��ڹ���Ů���]f�����`v�U�M���oo���i�؛�H�y�_���x警k���_G�����裘O��
�S�;�+����ii똒C����8�k����|�;[Ԛ"yɈ!>KNF�4���6��	��bv�����A�?�1�q��ٺ��,����o��-�2�A��+�9b�l�gKV�yi�d_�u�C�>`�'Oms����l�d� �!ʣ�|�:�c!��D椄��9&�pi�NI�;�Y0j�U�]�w`�<�N&��5?4^ ��LoѤ1�    ��@��z�Q��ߒv��XY����Z�=;$ެ'Uis��[�{��I5�L@l���������L�9�/طw5	#YW :�m��K%U�݊]5$a&`�c�^(Q���p�B0�` 38��pc/�a��u�d]��v��������^.Vn;M�~��+���	��{����kˇY��j�K"�����ꞹo��������VIO���-�5�c�z������Rn����N�B)xb<��"�¡Vu�W��b<�\Ob�Gqc�M�r#	y�E�X)I���RXs[x}#<�/��<)e���ѷ�R���}gKu�F��y.���B���g��C�LwGV
�� ��w%�<��$��F�r>)��p�0�*տjR|�%j���q�v}�)!d�T���`٠��ẍ́{���^Ѧ��>Ɣ��B�(sp��#Bx=V
����ӆ��Ab���^��S���J�$FFN���3H-�ym�������L���G̷�p�$�a�i ͙�磽����_��1=17�#A�<�4�
M����:�]}7���ā�����d�A�b�c#��W��$�� WF��K~�N����B���d�ɦ!3x��t]|9&�N�N��>"�wyǃ~�)LO1���۷�/Q��Ģ�H�7����ɉ\��Gq�)lV˾^�6��f�G�JN�x�hC#����++MP`��~�ۉ����L�n��S��~�5h^;�\;{u�_cj�4������K�}�.A��yL�w!�U[��� #O�UON��.��S��^�^�*#T��L_�����J5�1��g�(�3��~w����������wy4�α+K��h�xd��P��J��,{=�^
�@��7���ܢ�oP�:��8��g�5u+[5^ 45�mT�S�Oa��q�ϻ0?��������vBW1?�mE�׀��p�V<����u NF|��������XɩC�!I��M�p�|6o�k�����=��8���M�3ڟ����g#�*�'
7L20*��jH�VO���`AS��Y�|���=�r�n�~���%X�Z�4�T���Y��˟!޳��s,��";46���4�@N���K�����W\�� W;9Yt��?Y�b�:�'�n�W�Р�����3+�&���þ}t/�${&���������������_��/����\���lr�ٺ�p&�f�=�h�=P�3��v2����� P�N�s<��Ω7�k*3�z�Ef���`��ٔ
't��xu��I��)-̎[�]V�W��0<l�Nfj$V�AF0gM����8��)����.<��>N�夰�1.�x��D<��r:1���v`,4)����fUm�k���c�͋ĠgQ���h]=��L�G�y�-�;��9�)%�
eyI&XA(�|u���a#���V��U2�J;���e���Ȇ���w(?�)���^�<������b�`���"��u�e��-ʁ�%����՛�5�OHHa�������
��g�`H5;z֭�U-pK�1�Y;:0!%���cþz
���g�'{�4��c��N�	�k�m%Oְ�Z�z
�~�2r>��lTs%DUv�j"���O���O.���h�j3��?=Q�?���F������+�_ ,Q+���]�e�^N�zT��RU�mU�{��\c<*	��̼�>&�C05{wzh�@�8oO�D��TN�o�V��{u��i8͡��W��<&�S��N�oE4�h��|��롩�W��	���յC� R>1Q@gHLю���Zߒ�:�*���w��UOr�1_�O�^C�{Li=�f���Q}���bʾ<��O�ێ� ƚr罤%Y�a�u"�>`1�\F'���.�k�FQ)q��wZ�[�މ� �1,GRў�u�:9V˶�z��ëݻ�O��u��������L3c����5-��0���oy�D@�A��X1	%u�u䖈g-
���m�WO�R� R�X�N�9|���R��Q+�#ooo��hQ�\���$�(%�L[�x����'��3M #O.�'{n�Wn�Rb������!��]`.��,t`����qb��Q��S�=�C)šM<�Ɔ��nq`B	�����I��bK��P��l�Ns1"7Gk�'��A�����Ж�z��0����������Z��/�H(_�I{;�>vAH�Ņ��{j�>Fo�wXJql��J'Y�� ��Cc>�0D�9�� G�� ��Q�|��3��rO=Ϙ{��%�y�,w��I���a���N��h��?N��f���6���r��`<]K�r�Q�����!�a��1��L�gX�0\|9f��ԓ�h'sk�mI�Y$%/�%l�2/;����)ǅ�A��c�x�	I�㼆���NJ�]3���^�� Ƌ���9Y��2̲j^����]z�q^��j��Ik=���%e����O+6(����v����n�r`B]�T8��ka���L���K��T�Q��_��{Jȴ̎M�E==�=J���!�'V������15�����d���c��"��S��d�o����2���a�Gn��c�X�c�#�:-�=p�u}�JbŸ��H���)���]i���c�ڨ�A�z�E�`1�(�A=���^�8���w�N�U�uT��F�ؑ(�?�m`��st�4�q��	Y2�Ǭ������C>26�>.x�X#�ˎ��J�����~�s����Ad5e����b�Px�֡�=z��������S<����ĕ�Oʢ�)';0^&�j��ϼ� �9
e����Z8V�<�� o:Gؐ9�GoHO���7x�@�GM<�5Y�� ��:w-di��Ъ��(��~\g��t`g�1������-(~S3��n'oL�k:2%��&Eĵ �;�my�V��>�[Y��?0����0��i\R�]\��mK��)�W�^�ߏy�%>�˥�9WBi��F+Ί�=�<��ק|��˞�_MQ'zrs��G������d�W����x�� ߔ����Xj[CR�C"�A�4�Y+{)կK!| ���Gj9�gX�C1�^1��?{�P�pcm���/"|/8��y ��j�Z��.�I3�~F�]t�? ��z|r�p2�.V�U����L�������g�>����<�-�Nt ����hʇK����;��������N�w �}7��T+�y<l��}��/�bsZ�!�\�T�����W�OƧ�t:��?�̈N�i1��Q�ǿ�����M� Z&8(I�x�ſ\�g��%ɨ�2/�۴�{e�o~�
e:��J{$�1q�歭{҈-uA���u����%��ڨ���CPp�Tp�^qX����]�.�7勿�@�O֊��`���oAo�^Y�:�������<�:i��!�f�A�o��BQ���s�Č� �Ӕ+\���;r99P�d��Z�(����'�������A�1ׇ@�XO�����ò@#�4��Duz�����z�w0h9yU�sl)kف���#�Ҥ���;���g {OI ��NG��"JmÌ��zj�7�����9�ĄU��x����U�h	�B�c׋�E>���G+���d�XRh��Z,m���:�d��)������r���
l����%M���alް�޽�x��7`�Q>91��z������Q����q�*<������0;�0�L훢0��������%۠!��o��^���P�z4��!��L�!�h�%�8!�e0'^<j�	�����k,�h �M����uT�[��_,��	Lh�����Ϡ�^��78�(-y�gN9H��~`
ƀ�j��HaNWWb]���+�ִUn�f�O`J	ym9�w9�CQ��p�D-�W#'�/���ւ�_�?�����������+�Ӏ�<G7?,ۼ�X�y��0�C�'�ó��0��-����<��R�Z�U��!�O`�p2枇
C�Ph/�A��`�rl��|?01�YA��S�" wMX#Gs����4�뀵V�y�    �7`��B�O��q�,��h��0����OT6�^80�?l'�W����X�~����`��PW|�_��x����Q�a��-&�v��C�E�d�����w�>�a�JT��Dv	�Ys� O�4%���{��릌T���ԃoՓq�ak�%� &�����Q)���/} ��0�q9l�18F�!�@1%F���V u��'0���%#ՙ����i��z��B[�l��+ ��;�J����&?1v�{�0�v�$2�ЋU?�)�dT:R桵��]^���g�	��Aiع�����x�T��r}�;��̘[��Cs��F�\��� >�^\dk��c8k�(�URttRc�<����o啧��J=y<��^�r[Nht�f�ڡ����W�Y��$%;{�TS�f?1���Ǚ:Vo�l�����#}�td���	����j/����ɉ���ǥ���:0��Ӓr�]o}��e&����8*5��qB�����_�Đ�<8���#�$y��{�.���ٚ_��J&'�Ͳ�:=�]B�b��RZ[�=��۟!懽�>+���f���W����^�i�m���q����V/�NƊ)れ���%�W�X���Y�ں��80��9�T'�XP{�9DCc�<cw.aܸ�6�b��.�0�\J=���ێ��N��3�=srNCȓ�/pbBf�X����1,���)]�F-�)s�h3׻��^`r��*�\����%d~w@�ð���7��|C�`8���N]���p��KXX���cU-��J������D��|��lwŠ)��&v��/	�~}����X��gH��s��Xc�|��w�໧
֐�����ay��%(i]{'�~�
p����#s5�>���O��kN�N��<&vk{	)���zBKkw�Ͼ�dz���-XB.F%�C�̀�f/XAE���r���i�'+v~S� �JAO�#�����}�����m�򫄢'��{؈s��1kz�&n�ϑZ���\��?2'S�R�\���&�Ѝ�Y�_�P��z�L\xi�)������l���}��M��P<�dg�OF��x/�j;���zm0sG�©�qw��ť�G��I�A� {��,1�<�����ˀ�z`J���x�9Yo���jIBѮ��_�r�������o	R; F����^�+�g�C��w� i��W�� <���N��&2+���|,B9�*%���+���J
���^�׏�?#�N	����][Ҫ�]�s�ݽx��<a�v�
/#��Ë��t�^\�]������=�S����{�J���B��*\�¤6�~�w`��@���s��^�4-v�D��i�$E�k�z7���������\˜x4OJ�8Z�9�2%�^<�\_[s�$�a����n��R��A��^\��?M�-�lU�	Lq�G!Fw�c�"ݓR��J�n5+��o�����DYt�&,�;5�D���}����؉����!k�p9��GJqk-��{e�Y�6;��Ak^]X��q��EhL˵��a��;�Dm��Nf
K����A^\Ǩ����Uę���%���L-�x̖)/��kH����^>��P���cA��]ICץ�L E�y}��L���ԓ�kbk�99��3%d����=��k��������ĸ|�\��Mk��k�A�b���g&����Y��!�N�ҵ��J:|N��*i꫷��ob�u���D ?L��Ġ�k�W�b�zIP�֮��W���m/0!��h'FQֽ���<fy�������[��/^|5�c��)�A���Cm�l�Ak9����ZWY/#/!��:�=��]øR�}�U��F�dyގ���	�x9g��=�`��D��w}�0���
<�/	�?1-ߘ\8�U`,�F���5L�e�A�lzA:��}� �>l�Nf6'��b�wbD�xQj�,�L��\�v����'ؓ���:Pk�p*��c̶���ۆd*�@�)�A-v��6m1OAi����'��ܤ�e��n=q`8l�����x��s'(
��1��nN��g[v����?ș�e>��E�Q#��*�5�k�Ԛ�Z��]���EO��Pt�N(�p`���-��A�W����)����:pW�	r��w���)k�!'��/�;05�@�
�h�hF=I��ʌ�i�x*X3�%�n�g�K9�VO�y��M1^��M�xӷ]���"ҁ�xp+DY��k��Qն��B[I��c�tR��Vaz��� œ�AVZ��uJ\���Ea<,C�[�������c�	0*���%l�<]��ŏM�	�v�߉}g�x�b1��	ș�R]+�J���Z�i\������W�ɾ�h�l�<t���[����~��R��'��7����������*�e��s�ߧ.�iQu���� �q#�ԓο:�ÿ�`�ض��/en~Z�vnB%����:�����4D,�G��yX{������q�ٚ�2��y���X>�=^�똄'���ָ}k"p�'#��fV��m�4�z���e�9c3K��N���́A}
��Љ�>�S���
����i9�5F����;	F`~b
��9���;����+3�$�@P,�n/>�L�"��X���y�'���W)}��5�]n}c�-�>��'�8�S��kc��i�b��I��������q)��L+���GU�x*�Q�\�1q>�=+�*�u��b����0�49^�=f[H���\�F��ԥ��y�e`r"9l/�:�1���_�\8��۶�{��� &�:��x�w�C��C��UJ���������I
��J�'�w��c�/S,���ٺ�nt����ٺ���"l'B95�"=��FMc�>�a�Ɔ^[{�������Im�a@�^͘�����^`���Ӓ��KȰ����۶�E��k^�RY��Z(�z�0��y�|y_�K1:�Zmuec�	��SA�-����b�|=�s`�!֣�Xұ�$���F�zS8�j�r�<�z��"0�#��\c7�A��낲��YRI5�
c�o�:�'?sp����ᒪǗ�-�b)�o���=� &�S=������>hT/	��ŲQR�-�{�P�/���Iu]4%�s�U��,�w�e�-�y{ס�@^DB��#2f%��d�P�=��LҼXP�}�0��k�����9��4u8�Yu���1��Z�.�z�����@=���(SاV�*�����{7�K˰���w�&�pb}���>�&	�ق�cL8�:k%�6��9�px�UÃ�Է��=-����4��1U�'���ķr�'�J��dl^�xY�y��9}K��0t�\G�!�eG掚qgM�=v�;��a$�n׹2�2����|dfS�Pg5����ړ��N�V�Ҭ�~�`e������n�!VÜ0���0H,�̥\Wu^|?.�d�Ǟ�̀n�1^��&,�i�/����
\/�V����mvv�q��{�^/DR�\͝��7�@۰_��S�3��v�,$�2Of|K"#(2�/�_\��,� �GMY���+���hXu��L 0�Db�|����<Ҙ�c-��f��On��<�^�x)��nƣ��%"	KL���h�9+JFۯ�5���\�ŉ9��[����U�3Nr��e���E@`D~�vc4F�HJ+�U�Y�f`�aȱ@�锷�(�c�'U���� ����K<E�����۽3�`G=��*�*�pB.{/���l�%ܖ�����\��M�?�!?��ǭ��}��7�z�zt��w��m{���O\Xf�՛jm��	m��Þ�6�r�uu?R�ic�?���s�+UY9��PWwo!�>�e_m���o�G����(>���v�)z��nU⮛W�Q����?���vG!��$��s��v@���Xm��*���R�R�4�B:s�xa��1R��#�.*�i|�'0��H0f�j'\%�'����E����M��f�ͿbJt3��[Wŉ��S`�i ہk#`Y�>�u���?���1d�6�u%@��;���>@wem\|z>�O`8.�7���x��[���];ʵ/K��i;o��t��O`���՛6�    ��GB�-9�<̏r��֜��&�Bq1S���#ʅ+��	q�K�;x�jk<nL�'0��]�`v^�)M���6U��\l�����(�bH��P���jM��ct�z<�uy-��N�"0��|#����g��T�k�������������k.'F�'lwҮa-�q�F���F;۲��Lǟ������]z�u&�ϒs���81{����m��7T�1_�;�%��8�n�S��iq��s�S��1��t�j7��� �A;qNBh�"𚼔B��<���C�Sj�&�,m�m�2J�J�����rM�&r��ݢ�
��Kx��U��c�H���������T���3��	{�4�"�����g�K�����P��q�(�{�PP�_{j�@	f�:@��x>�X��qV�)���ר�8C'��M�x��s}z]���BZn�c�ͺ]������_H$7�BM���<&@�_%�	L+�B&4d�(�cv4�J:{�Ȝ6����w<j��ԟi��]�`�Hwg��P�f��\�\u�(��+�����8�;-��^�<�E+�&�
m�t��T�%��`���2�>�G�Z8�O�/3P~W{���q���b�%O9@!8�O��-H�Ծ����I����So4��X���)n���Xl/���;/w@}y�#0H1�!�w�dm�A�a.a̸�b���
C�J�o�	���f��K���ґz�'#�t|cX�5����R�Y�U)_�U��H1���k��$���p�^��l�f@iz3��#���?Q��ľxL3|>7����#�cv��$P�r�3M��h0B5K��k�����+�����3�|?{HHEש��iGs/��^�����u7)W�@vNߵ�t�	�rr�u 겪� Uz�1������/���N��Ӏ1��P`� �55z�/{��S��gzW��81:g*
�8�m$Z�H,����uxo�	�8$�^��-��?	����.�D�Ԟ�Ja�b݅�Z��zĚ�����N3w�e�HY��oH��f��,�����z�Ds��Z���<����57�[��.n��gz\��\�h�K������-f�Yˍ�7m_�U��a�:Ob| �2��׫�|�mm�������ST���c�47-:��1����R�����{��?Q����w�>�\�\��k���[᛫��oy%��a����)�s������ox�{��*�H��:⃢�0��ǖ��:WB` �fǱ�Y���!z#�j���N��
�,z[��O`�+Ÿ����Vq�&6�\(A��#\���:��C	Z���`E�E��81�[�]�����o��f��]���F8V��´r$e��L.g��% ��y�>{��Is���:�\#N�iͣ���|E"0�r������N;�*3�s�Z�ꋵ�E��Z�T+�rc�,��~b@�5�1�W{.a�c��U�А�b7�cR	_�kBxz*Ѣj�wf��[��(폨,�M��r�k�а`|��D���@z)����!�/��v�%��(T�<?_��!������z�o��!.%S
{��Ǔ�r*�r�UFǗFj8#)���~�F`j(���Ϟ��gI�K����mk�m��Ԑi^�IῑRb��F�yd�B�����L�N�TH*�>���!��n�T9{�o�&rpn�Y��y�*���F�W�nn7�G�j�SJ���$���7��5,���k�z�Ԯ����Ɗ�Oq$_���k;y??N�$5�����X �܋�ax�R�k�mh���??6�$�s% �B`(�%��}�jl��a�Y�T	�~`��"�_�8�xq�-�cZ�ns���G��9����J�J�z���$���4'�[I2j�}�����?B`"t��*.^�<`��Q�4JBa�'.:>����R~��n�c2	��l�Ї̖��N��ݧM����E�ᘊs��-�Z�ߤ.�;P��OI�3���'fTk��.�<�-�ȇ�D�p��ԗ����}#!�%$W��ɣQ��G]c��6}-T�S����?��[{-���)�����ז�)l����g@�L9&�s�#�2�H���7s�i}*�������v��l�ҘH����[j5�����������y8z�7�}�v�2�d"GOO2%�ܐ���������|>��"79&���ġ�V<����47������JN�$E���n��� \�'�R�ma#�k��k�\^_�/�=\�Y�� +�5�R����v�c��2߶����Jz��SJ�Ӝ��X��P�oܙ-�<���9����^ֺ��g�=���i�y�_���3��?m��7�׎}na��V*�z��5�`�[^�JM��,7����g�48���Pꡧ�7p��؍|��@���Q֛�P��Ѳ�jqE`z���3$s���!��:����\k�� ��Tx洊$���jN�u��P _󛪄�"�ݓP�u���; �1}���TL�9�\�|L��6��w��\�
k���(�&=�F�����]�qz�ZN��[��p�esNܳ#Ͽ�o�xm�x$�"VSU��2In�[Ok��ގA`p�*�*������$k�6��̍�uԦ<Y�yS>S���f�o��v���rǠ(׏Q��=����W�~��w�ќg ݃����p�8X���\^�A`T��ޤ�iml	y6|�e����$��(���L���*��Mϡ���NK�C�5(5�3!^���Z^o�"0̿bTnF@rg;(<���;��tu����yScė��,w�<�Y&���'ْ�96r���SH�f7�T�-YȄ�PL+!A[NW��w�`�
ޝ�lLI7S-f|�}`��>��0�B������|��K��IsX���i�h���$Қ�m]�i1�\�����;�\�4r���wK�n��=k��1-\ǚ՛eH*�KSzZ���p��;!���x�ϧ�OQ���Y�Vg�pa���
g�Vl�hٞ���)&rk7�W�qͭ�m�3�94�#��;�����G!nWV����������l(r�A�<o�����s�+�1�֑Y�����d�ZIZ(����� �\s�Q�rj��144�%T��n@Ï��+��ɏ��\T�j�5���	�(�q��^6�3sy�C~��x�5��#.�!���Ƅ~OAb�����m_`��H��k��sܘT�ޞ�&��ZU�'���TL��k^K�q��6�Vw��,k��M�1�C����P��2����ܥZ�j���U]<��w��n���~���돔��
�����/��S�Jꊏ�{�����;�_`�~$9�"���\��4���UF����A�Q�i����$ ��=^L<:�1Rd�3&�����vc��XEW�v#�6}��ȩԍ��p���K������*1.1��+�mKgjCo�(�������n�|�)� _���uυH�d�2[�(#�z_2�u����w�Y/���������7�
֘��\{�e�z#0{'"o7ݘ�{�l�F����4|%��8I���=��'0�CƼ2�h��'��N��nw�%�V��.c��Éi?g�������T'y*�4�
��p?Xu�=����R�E��v��$�Sf��N;ICs�;2�{�|�)�s���9'�p��w��f�B���J���ஶC�:}@C�Me�����joV���̟e�,��ݺ�_�dQ��ՖP�(!�X���ۯ�_`�L5�ͤ�Ye�s�!��{�kvKyH�a[]�yj��xPk�����3p��*.a�6��%�k��C���/0���79	��4U��m���H���ܾۜ�y|��r�|�t8�x]��r�c>��ȴ3g�A��z���?�y���l���'��V��E)�MB��-��2�����MϡV5Z��v�#�����#PT����_X�B6�ʣa�y��	�nTL�um�g7��w{5�XA��f���9g�o����GN�e���p��>АRo�F�֗Y�DI�ɩ(��rW�ovUe>�h���	H�\    ��V@�P�����#����xgY[�_�	�h� ���<Z��[�!���C�B�<W�������P"ջ�
�M�07�q���86�H���ܞͯ�a�V�Y*�+O.�3 ]	Z�SH�u���x�@�X��jt3��w���׸J�!���Z�ߦk��-3	b�7�z��Q�k"�$@&�Ҳ�z���c�O -� ��f����E�Gu���(����̹��l�b��J��=�駀0nФL=!$3Q�X�~�&�x��7� J{j�K�'F{���d�9-?nv��|nv.T�"0\�4u���83�!�+*s�� )G�׌s��	�g*i��&����N�������u|�i�8{��jw;7Icūu�#h��Z6#^�_�������MUF���}�C�PM��غ��9�g�����o��hg����1�:NZ���B����RcM�o��ي�'Qc�0ӗ�:I���P�p��_	����!/leL ��1��؟����������ۍ(`�m�x���1� ��NQ>����7��Y��cun^Q���B���X�D�)�6e}>��T%��81c���������--qHA�ַ<�C�?��!�^��5,���Eb���#��>Q�<����"0�Z�F5f�U=�F����u-H9VE��|�E~\kӛ�&�3�����<��a#�5��z/�>Wu\����@Vi}�P3FU�����+�_���J�����\���:G+���q�vK �C���o��e��]�Twh8�0����ΐ}�:����<���b��"�J�m!�\Cݭ- ��4C����&����ͫ����=��x#`d��H64C�8�*�חg#0�3��zc�
���BN���q�L��:�9Ϗ��Ď�j��ۙ�F�-Vk(�Jc�R�-��l�������f�8o���t ��!�4��V}��a��om�z�/��FO ��1�A~&���ɓ�Z���~�)�C~��;�w�ӊM�"�v#4���-���{�16d|�<z�V�$n��!���Ij|V������WȮ���)�ոJ����r]��[n���!�<m֮��ܽ*~��c�B�ń/���9����b6�Ƭ��WI�ap�w�:��oo<p~���s���R�Zo.�(���s�b[��ΨT�W�ǥ̾���+�7.�4d:Ɂ
�)�ă>����Y����qa%3/�7Jf���x���y��8+Mb`�X>����6�������d,�]�Z�b2��T��<�(��%�?�Ud���&�D��TP�S���ʫd� �����i���7CC<	I&�pB
�*���.��ƿ ��13Fʯ���FF�:�C`r���������L��X����sS��@��5�7ܤ�b�cO�[\y��:��֒�Z1� �#�ƝA^�3uَ�[�9��/�c���7�T�V9a��k���aъ�i��������#ܣ�������n8����4�k�(R��<��0��aI���g�5�XS�_"�L{\�g����W�,��6o^ C��>���r�4w�Oұ4K�z~�5&�[&���jt
E%��i�J>b�y��<X���%I������&0:i奒r� !��!�?̬l�����_������/������i�"�]<��[�@��`� �����
Q���?����������1�~�����Aq�BEol�IW?q�a��{M��Ou�2i;����c�����^#��u��Ֆy����7�G����tP+��.�g_��o$�vxpq?	�3������޶�}�󕦅�jU���m��N�/�$�ᤄ'[�S���m�pT��o*Mݨ�Zc�����=u��Ieh��y�C��{�At=g∝�,���!i*�R]���zk[5��,�zs��9 j�'*���M�P��x���D%�rS� =��%914+ha��8��#�������1$���.j|F��z�z���|n!;u���������u��/k�_��*��ӊj:Ԗ�>���ǭ^�P+K˱��5�R��!��˲w�#ϿЇ�a���;	}dY <����8�<��
w����*�k����W�Zq�f P|J�����C�w�Q�kj7�. v�¦��8C1[�WP�h;5@����S$�A���=o��n��5���J�U�!��z}�Y-�/@��%Ȏ�ý��{r�Y�{��f�|Uj!�-�.����6d_T%�	e�`�u�)�:�GC�I�W�$k�]�� �æ-����Mk��u����	��q��:׈7�r`;�2�H������f�%vInU�V�9��G���:���y���?Ϯ=Z�ً�(w���J��Tt�eM D(ܹ��U�C��L�,�/]�K�o����Y���Y�Ͻ���(���Fݱo��bRj�v�{�wH��}`8|:�!��zC��ʥm��OU�#���S��P>���+�_`����|��D�:���G��B%�aF1R+oS�/0"��ڍ�r�{oI3�%�9Q/�Fme������_�S�cMP��K*��&��[F�>m�'��&�]n`L^K������.N�Z�������&�+�x���ʻ��I���w�i���l�j�I�W%��T5ە≉�#&s��y��rM��X�d*o�H}���6�y�TZ-�<��u$�4�=�6��l`��O��`�pd.nRG-���SB��-5j#�o/��=.��Ņ�G�w���KA�J�J�Xol2���/B�������ܨd�VӲ����v�Ӓl��*�����\�f�y�*�֔ONI�!�pZ4r���~�吋�UR�z����)�)I���w�b�4�����=�_�&<�+]�CR^���IW	�T-�f=<1��p�瓯#�s�ȇoliV�WUEU��SSn�t⚽=Oş����	��\#&%�����-�3�k�1���G~�*հ��f7�8��D�!�w�`0��+q�%��{��#�1J8�}&i���$-�'$�D�Vy|������EǷn+%L�G�Y-�l+i�������k��h�F��H�$�]2�[��%��x�5=_�-��R.��W]}�K��xj���<�=_�����*z����&o��*� �h����C�/�r���Fq�5W8Fq�1�u�њ�����p��?iVn6�v;��DRi%`L-�eY�|�����$}�)�W�"��0������>����q)����C�H�T�M;���H/�C2�c�<��s��G}�E����:�xV�SB<(�CC#�6xu�#��i����z�����H�����c���?�G���t&q���^/�_��I�i�w]`Ӑ|%L�ZW��u�\E�x{j�C��Z���M��~b�DC��k�4HBE���ܟ�1��(����E��Ɖ�����|j�r�8L��딀��X8�MU���4�ʈ����h��f$[���_`�"���x��6��}�55�}:"k���ww�c�ŮH�1�eG��� ���H~��G5��4.7~�>jx]�hp�3j��Q�|r�N���8��%�s6���L��Ӓ��ܒ���T���c��<��!��@e7�Jۏ�Sc�*Z����7J�1]��i�[��$��o�|3ϐ���r<D��4�d�h��N}\��i�NNV�����{�U�$<�@���b���c���� ������Č�dj���c�O���-n�z����Z\!�f�H�ѩu����/��;�N"��u��~k�CQ*�i+M.팓x6B�&PB.�>{ˇ��US����v��^R�O���b=�Th�eJ���}��$(�f}3{������#��,
�L~[
��O<���z[�Y���l�`�%�N�/�y�J���yF�)7���1Ј�mff��̌���۪?�|"���ڮ����N��T��PH߶��D���gW�0r��6�\;IK8dY�J�O���)��_%���|5�ײ��L|�~fN-�@��\]�?���F�g�*��0I�������R5Z��"��q��i�s%��\xc��f]    �[�GE�����#��l��~>�T��v�|�)���Z����HdVoG�����|����X�nF���>�|{��pd���:w�k��uJ���j��Q ��������fT��b��N%��:�D`�Q�Ѝ��f���'�{�{ێ�C��زN{�� qQ�œ�M��[��RL�����Z�Ɍ���6��F`,v��j��^x���}� �=�qړ��������q�81���IK�-� - �8#���ӵ|�:fr�{W��#�D��c�r�m�#���e��]�������l\n�p��[j!�{����|�,RoDu�A�]���c��$��0��m�E�y|�B"Ej�7N���P�_5B��aWߵ�Fqz�"4�T�u3�r��$��e� ˣ��>�f��;X%�1�o�z�;-%�X��YM��&������|��L�=_����R���C}�lF)��b��Wl%F��?�u?�u(�k��o��*9���>[���`I��GX�Z���[9��_�lތ�-��T�Z�LѴK#�~��ٚ����Z_`4/b�f�Ut�i	��` �[ƀ1���V���''y����j>YC&q�{[I��]�{x��ׇ6K���LZ��sZ9���U@"�@u' ��2�����5�'�Y��Jso�VC<Fpbb��ǌ\%r���>PU�����0qq��lEi���Y`����X�����9W���'֮�rp&$D��WCE�ܵ�l���me������o��֓�(S֮p$�Y�ؕ;=�ό��M�C��p.)klq�̩���i���[!y>���6�Ųܨ��\�&���eű����U:�����yѪW������Ї$��wj
ⴼ�������������I����V� J(�H�H'm�5(/��x��V��9���M�����ؚX!�9PhV��u��|{��O��������t��ѠXw�=�u���Z�<O[�9 �����RIL��&��eIc��,�)�yZ�Ǒ��|�RHY�J���]Ԁj��RzUz�F�L����F\j���5ţA���fYk!>����������*ea��C	QQ�K���,�wq�����7/2���-��t��Z�Bny����u�?�0R��l�F1<�$*��z����:��ܯFs��d�9_�-�ܸ��j���6�P�m$c˫�����K����|6[�s�kt���C���v����iC�#�
�7��7=�N�s���NNH4�|#��7�@`>�R�76R�X��c��X��@^`7��� 0@�̵܈���OwA`F,R�	�wʌ�XW�3l�>�����2݌/�Q*
|���
�뚼yO�wp�1���M9�������{k$�(�X0�	y���j�q����"0�W\�F"Ҳv_L�pWq�ZȮ�V�ij�Ϗ�����V��iQ�#�����roU�j�+Ұ����j�8�f� �l��^�ZO��&�zg���>C�k����i%����-L�H��g�m��b�����!0�![�=�����(e��Tz�4Xs�1|"� ��RTkj��3sȊ�[�6`L��xy�tq����j�>�v|����aZ� �n��bSs���|�C�XVot���tw��F�*꒚�p����w6�P� -7U�$��~5��F�n\O��x>�|;Fc���ŻZ�6��5�%9��D�E}������|c�7�{��˲�ߵ4�Ib�-5/���j��xB���\����~|#����;��r��j�U���so��Z�]��e�mYR=$���3iZtd*k���`67 f������O��Ĝ��ӴeDϣ����Ö��(1��8 ���jȝD�I>s)=_����*��ŉ�:�쮩M���a�I�M+�f��ok��(��o&�b�-�ZRn�`������M�͵&��5O���SV��kW��#���B1�;I�0�b��k���5�"79fW�^;)���qR���4��=��'0�g�v3�o����R�lOY
f�Y�~!�S����"��1�GMû�6�.Jg��4�����!��z��6C�a����ph.5�����f�mB a;���(J�F>�4��=��$w�'dݼ�G��۸����g���<�*�ͩ�]�dz{�X���r����,��Ͳ��o+;�%���kX����_`�~ս��C+Y�!�x"�����B���S~>�|~d7R<{v��4���#,Ԥ�۲�m
�',���%_t����L)F�[(�q���r��1�&Dr���E�5�!�@FO%מ���Fڥ������_m��l�b�)��(�Aʘi먹�ё�۽�K���X��<���m]Ӗ�����>������<�Z��M_9z���I��7,��0��ː�p|��I-����EI�@sg���4CX���)6
PٲL�����P�*^n�>+�\�J���-��3���ɒ���_ �����1���}�Bꍕ{�9� G%�V�����-?�WD�&��H#9��g�Ļ	n�(���k���C���6���id�-�ҙ�c��'�$u�gs������ ����Ѭ��a�W��W�p��ȭn��A`���X�"�p+E|$_��ܖQ�i�fJ^^O���x��՛�c%���i1b&=PL��Z�s����ߊ����籛5���9f���֞F�I*]��t������Af�+PG5�#q����ج�J�Z��<@XJ,)�b�L��,��"�	����q�$$ޝg��z��>E%�j76�3��*��V{8y��m�1cIy�"}�J�-�L���D4�K[mєٜ�i��p?�w��*ߌ9T�5)	�H�倯�YΝ��<�u
۳���z�t�� ��G� ��^�\}z���ux���S��q2��@�k
9�0�_�1�ig���T�?1�S�,�&.g(�J��+r����¨�+��e��������eM�)�D��;��f�9�<���H?�w-~#������2�r�@�H �����O9�&��B��"0d����p��Q��P�
u]�����y���*7_S��;��?�`�N(ޥ�W��M����j���H1������.�(Ҽ%|�t����p�T��7o�j�O��Ĵ�ճӊ����qi��R�ǛI��4�;��}MM�=��� ?�^�v�Sگ�?7Fle.-[5�ba�299�?q�ě��R��L@17f� JeK:����tӓrg[����C�?���rB|6��4���H%�9{9�"��9 0H�5;��5�R���h~ o��n��ζ';��1V���.���dv����-f�ڜIO��j�{�>�q�?��}�;�f,�B�+�.P��T��S�Z7GQ���,��A�G#�0G�K����!�<?)��P	�7�YB�ʻJM��5vEe&��F�����5�~`>���W�e`���Y���ɹ�wu�<�/J���p�7�1!.ıB���:૶��0!.���N1�M��{�&�X��.�6*�W�w�tv�o��p����
.���5���O�b�h8�.z�/����g�s)��t?��%����f�����U:�|�m�B ��]$�S�hi1��Tk��A$O�3ɀ�^_:a���7�����# (A���iĊ��,O��<�|�>j�8��Y���i6����XHýU�c����6��_-TovD�Co"P�lS!�i k������|<6�Λ�yTn1�_��iH_��e.0�������o��0s��-$ߦ)�S���*���#�ǚo&Y����_|8D������r�s1���|_�*7�J;��d����lYi�ݓ�}�࣏K] 0�W�?/�j�w�Xe�w:ܤ0&��Y>3$Y_o� 0�b̋�xV���%i�V$���_�;��@�<A`$$|��ئZ���8'ߢ�lP%ua߹��O���f��7���i�H�Ĝ���BTi�\����V8�
�T����>�T����j�m]�~��^����S>G%G��e3d�N2sp�H�1    #��&��Q��z�W>IP%��'}��3sh�"��x�m��z����?�c4l`�(�e��O7�,�T�!ǔ�K_�a-������ܬ*�"�j�!��S��Y���Y{������1O��M�m���8'���Up�B��g� �������[�F�� YW�j�pT��M��}�5I��E`���`J�Y��)%y+��V����{".����ɷ�q�v�cζvI�5�A�ۍpk�k�)gT��caA���f�D�`�Z4� �P�.����[��O����y��y�f��Rh��(��*k�����_h���>kW�d&��j��S�1�HIf���z�Q����L౯s�B��Zf'V����"�^W���Cd��ڏ��jS4�Z��D�;A�n�_}fɫ�\��\I[$_��7�`�;�j�X�̰���}��4���J��	��E��������E`b��K�gӱ����F�Gj���Ƚ� HC�57��� 3Br�_�S����/s�+���g��DBq�M�'�7LG~���p�Ŵ|�q�dB�Mk#CQ�a:U{�xv[]��0F?G��(֠փB*qJ��wj�ġ�?%�:�R�����x��r�+9=��Tm/1`>jo���W��o]KT�+��������Av�I�TϘ�l�����
o���.�� ��	����%���k��v��S�Wșn��Z�#Ǔ>��`Jy�dksۋK\� ���!b�Y⪋���N��*ܧQ���y���6���j�$g����c�^E�T��N);���V^�j�������?��>������_��k��h+�>G�ۖ������������?�����������F�~��|3�:���Zʦ���3�"$EA�r�+����6~3;��{xv�����򛼛$Ӿu&��}S���
��i���дZ�����S�����c�l�>���F�veH1u�s$�q1J=����m{��v�q�h�(@ۍ��讴�Lk�J���A����Pk{܈���/�~Ad��)�i�"���$(�>� ٠j����S(fǪ^@[�Qpb$&�TQ2uco�kd[���ğ���%�S�����<�RS�����t��u?�c�f��M�>�����c���[��Hǭ������W�zo^�{��x�oK"�R�s�����������"W]�|8\J��LJ��z�v::��������퇢D7�u�)m �d��3'G�I�Z��62��/_`8#0WF��X
גv��b��@G�-g���o$|F�R�}o�I��02��Q�F(�ϕH:����+o��}�)�g�땒~���bݾ�PY�815JN���go��[��1����8���W-�moC��u
����FY�|��Lo�f�3�������5��)�&s�C�����p��0{�6T��^�f��HrG��NI����s��f�Vn֨i-�~���kA�MCP�k�]���$�1Y��HJ������)�����0�Wn��rma���ҍI��u� ���C]<����^y�l��A`>I�rw�lt����{��x��'f����'�s�^n�T�*���ع/�)����=�Ue?b�7/�
����:���TCU:H9(G��x�x>0�mL�o���Ԧ���@�S�������Ujy{��O`B����6�)���W�m��%�ƤԺfc~���Ujc��j(�o�۫��Et�&(v9E��m>��7�?�E�Ѻs�a[��@4m��+�ُ�*��^������;67�܌Ϙ�l(1-�O���'(r��m�?�i�P���~���J�!k������cu���D9���?9�Ty ͥ3�N�
˦��a&5>�� 0�٤\M��R&P��������FTe�:�q���я��oD,���\��wP�x��P���ّ�_�1a�U�]�r\�����E8�0�^��Pq`��^7D`��*5�y�ܭӠ<��aQ�=T���2no�4�	����3^t�<���섣1�!��-H�6����6I�����ަ���P�x  �U�k|��<Gk{��o��ѯ�������[a2�W�XR�k֬Ş�OE\P�� eotݏ���P�E)��9h�1Ԟ����pћד�ZsV����G7���kR	/���0��p��6�酫� ���#�t��%4�������:�_`b���7�ZY&#&�9&����'��OS����G�*J�"�X���]�F�F�:�Rn��������&�`�U�Y��6x��Ex|�i:H4ȷ��>�ֆ��l�\$�>���4��!�1��"����dm�_��[�GD�k-7㙓F^��ʡ`wR�$=����Ҟٚ��0�Z�ߜ=k<�G�i���J�QV }{���7��dt�G�fӉ�$�^��f|��Pɧ��?/U�F�答4�on�lyH�z?��ɴI[^W@`�y1����T
caj�%֑$�#���+K}~ސ?�f��n��9S/tR��R[؈Xs�z������	���wqb:san�w�����2ͺY�����*� sf��ph�V�����Ï�{��=O|���f����1nԒ�8�{�m��Y� ]NO���ܻ�ׇ�����z3�D�4_!��c�n�X�O��`��O���U���3+k��P��3�iHXC�n�ˬ���D���]o�)r��	�<p�� ��J�z��ەEUr�Y���&3b�n咺s�8[���������7"/g����-�aQ2��Dۛ�>�/��Qq�f/v���k�H�j�$�&�P�@#��J-�2X�MU�-��}k�@/�$ސcP���2�㒻_`P�ٳ^i���p@��P.9��%1��x�R��CR�Iթ��P���Q��g��<����!�^��G	ϬL?F����;𜵰��w$���v���z7��ʏ�9�ʰ��Tjq�]Zj=��m�6��N���K��y��O���T�	��ꩶ���	��z�!<���tS����+�=��{K�w��]���
�E���d�'�R���k����u$����w��C`�`�L�w�(Cu�k�{j,
�4��vr��N	�_�,7 ��{�,.!�4B�d{&K��3/L���r�PRz;RS5�o��RS5��}[�����$Te@�>�Jx�#�$}B�o^d�1^�P�c��p���1�
u��k�f���Y�[�:�X�y���E���]O�����crX9vJN8;�U�7K���W$Z�BTn1�v[���J'�	�/��̧�����<��oB�����шN�Åc�*5`:P�2W�c]�/���+N̍���� ˥�Ɩ�{��e:����W����d�F\i��8��_�wh����;J�1��#�xs�����6�Y�],�I�*QUQ� ۛ����_�k@`���8[�yp�*[@��ǃ[�W�Bpv����
�h4��U�f�o�dD�P,��H#$�z:-|�ާ���;o��:�c>���W옣>y�[����/�򍁐Z�+��9��Цd�W��z�x5�]����7ԟ��*��E`�.������]3θ�����'����"ݼ�웶��v����-�j.���1�0����x��XZ�UE���|$�v�$��y� U�*��Q���iZ?'f�%�Q���H#Y3?�{k����q�D\V��<�j=5���3EzP4��?Dʟ�!oW��G�l��I�p�hɕNj.�_Z��7ɢ�[�U{�<w�J�a��m�2p�4/3<������Wh�w7cC�9��p�˧�m,NͩBm*g��7Z��R��.ro��g癬���ڨ���#���5	Fo|�	OE�q��b��5����j82�&��iDN�4��V�A3����CKSk�|���W8��Ӱ?�tV�Ʀ��f'>-�j�﷩<O���!_:y�g ���w�A*n�������Ǜ���lߝ{�)�V�J��P������#|@�_ܤq�8&#-�-�^���ը����E�c O@n����a�y�S�G�F�^	h/�5�d��S�_�?�;�    �K�{V��鐡�ae�Tt �b�k<o#�����&]����p*Ƿċ~��ֲ(ͦV�αF�z`(,.p��l���yϙ��;
�𲜤Ye�3�����# ��LW��-յB��g���i��d�E��7�\�ެ��H�=֓Lc�����k��l{R���"A���+ݳx�Nu�AH�����&w����'F�P%���v�*�����	i���CcԀ�W�K��A��M��g�KmTQ�{���U"M������8U)�L�n���w����
��é��i��\N{ހ�h�Z�r����󜭧���d! �;Cx��_o�!0�~���<�P��Jv��C63��Z�XT���qLEg���7�j���)��집҃!Б�A����2e������깭�/�s5\��B
$\�.V2���g˷�ֲW�mJ�v�\��I����?l٫�(�������r�n���ƕ�4�d\Ȉ|ҟx�1�n5چ���;U�4("�RL]�R��vF���֕2E��J��K�!�#{IԸ"A�~�0p���7ᚷ �[ȱQ������,�����0���Q
�G�Q|��0�J�b�o#�Y5�]}�/��L4�0K��*$=Nz$1�]p�T9!�و��4~���01N����"A�w�#�FĢ�(� �.�Wx��zT�aD?� {����{9�w-�T�l8߯�讼'���W)X�o�F��wT�vb�8xh0�9U/�����c`��;�i�d�a67���'^�Z;�5v������#�v����(Io�<��+hY~x.d��;��N�j)7:ͪ;�೑�p;��1������U��e�o�Zn�M�)uJ�E���1�Z��C����z'�A��7��y���/b6�����6i8.��}�0����n1�:hو����e��f����>o�В���ܴO�^�58ks(���F��V��^��/	x��n���oO������'V�֎�l�T��>7�h��H�!���R�x��+�>b6�JJ�J���k����%t7������;�sV�]���ǝ�U^/��w���T��`	A���%����)�
�� �~>�AyE����OO�G��8%Ò�K� y>���tm�����:���� �#�̙T�p�B���|a��vU��}�IA�E���ٽ5�������018dt��T/k%�A��w�x�^�{���w	`�O��7��S[�]z�E�s�i�h�nܙ����o��?w���M:�JsM�ӊ�Ҭ��I�6}���]��ȍ�V[I�p��d+!�Ch����-{�)�0���W��6O�δH��ҵ���D�o>O�
�D1ܫ�(�k��=�tjH��9�g�i�-���}=o���	Q�"�U�UG�n��&�Q�u��g�0�ק`$x�r�*�J=����1�G�c��??�
Ð~b�y�v>�M�cΗOi��t���͵��ņa���l�);��6|l��غ��%ڕ��2�Z���Q�4曶R1�w�x�S8�%��$ H،l����n�����$)��-1ib![�!�vpg�w1��±/r��X��i�{+��f�Z�����c���F�z3i暃0��ZBް��l�H��W[�����9G��s��S���$H�YW�h���<y|O�k��JҴ\�?�<t֔O��/$�9�J�J[��F�ԛ)��c���1��z�8$uQ�����k�I�W�JZ����$h]��p�n���������]��i���)A���������)��H+�/�ou$12�C;&�5�/Xg�2�=w?�ߘPI�nƟyo�O���NiY���$3��j��.� ����:M�R��9VE=�؜r_3H�z|`�k���W�f�L$�uSx�?N�Ciiv�\V�ǵ3���Z�;�.���?�%?�E)�Hj^7}Ic��f֡5\ģvb�>��SR�nW�k�)q��#�^E�V^�KZ�mGb$��N'8��)��b������NӅR;|�ǜ�c���5�ly��f_ð\�U�j!��ky�cC��4|�`*u�]u�F�cxK7}ȵ vk�S�j"�DL�"d�8��!��aT�oJ����T���
\'���j�5������a4V,��4��}���z����(�h>�p�+^ٞ�Si췹�����!��%�cCC8q���T��>�~u�r՛>dk�G�2ٔ(�-��P��>erA��o��/k�)ߜ�"{�)Hp� 9v��Zf�Yl�����r�j�H~o�$K9�p�]f4hK\���T��ǧc��)�A���J�N)����+��1�w�H�����!A�A�J���L��J!u�A[�Ζ��������E=�ׯ�ѭ�>�L��c�u@�!I�Һ� K�M��5�Ї��݀H<% �6���PN���l1¹�+y\"�k�oT�z���L]Ɍ�p����k�8a����0��(��z�o냼�ηQ2$0�v'��}H`�|��n6"�)���D�K�׍)"��M6��M��Hj�ء�)�ç8���୥�p[��y{jH�u�\\.*��g��Q2��	���Jn��E��{��%՛�ɲ��n=q�	��p�5g>�]���:�>E��,q<R>1.�j���iH�i1��H����;F�S��M��f]j�Y��H�2��Ɣ�>V��*���uhfz#I��7�q𔂋���y��
��<e�5���כR�Y�f3���g��g����A��:��a�}
ɍVCg�q��ct��s�w|�I�����83��0\?�ٕ���X>�J+� �8�Vl��ms���~�}e�͜YY�b'��%!�c{��ՙͣ���ʗT�"´�d�m���D�Z����.�������|��!�U�ٹ.u�\��h�c��4�s�;׾g�׋�K��q����3���0��c�
Dxyǎ�	?N��5�'�g���,��1���,�	�QR��XѬ�ߦ/�F�{cn�J���k�D_&��'S(�#{�j��/l�o� �oh��;����I,3�mh�1��m=Κ�H̲jQ���Z[�8H6+ ��J���ٟ���0�?���)��]�hj�!���"F�J�\����sl�כ-�<�K#h�VD���j7��)�yt]#��A�x���7Y}$����W]FE��y�����a��J7$��x"*�P�)�I�"�C�����'�`�`4+�o��r���D��$!�dcr��I����7@d�xOIp+j���H�zM�`����������)�M��)��:g�X��{��_��w��c���*�����O�)$��J}{M��aM&��<�n�b�
�fe$�Uw��X=)+�gZs��\˙��a���ܬ\�X�a��Pcr[�덩�1x�n���%��]�!&_u�����f��u,���]4S!^����Sk�|/nL[�6.i~�1$L7f�Kx"�y>�����9��,��2^�9l��PK�v��9Z(�X~�y�e�1�k�ˢ��ĮR0��Y%7��tk6�ޟ/S�WYIK����ۢ�#)�b���c��y����|��k��<����奱`�=��K�=3�M�UH����������u��jB6tf9*�p��)��y���*���E�jg=��^Rvd0Φw⮚�z�}���?!Gqsc��1���Ѷ&�i�1�g���㔉_�h�h-v��d�`�'�����U�.����29����J�f�k�i��#DK�1
0��rN�$�1V_���0��1B7�Y�r<�N�h(��a&<���h���:T"�m>��vS���>7�1�Ȋ#�W#8ߵ�s�F��gan��w���
=�$��W}�Z�l^S��i�U�؛�gg���0���%�ٵ1��#����%��4ׂGO�+p�RI��1v��'iy>*qD�o��u�n�rǩh�d=h�+0J��mH	�e�|�cQ�l�c}Kd"pWG��'ס1���S���	�����$y+�NR1�Q���B{ڙ����ǹ�]8_�sS��1O���1�'2�<MW+�7�`�0L�)l΁�.�    �>�bb��������8��O��O�H�.ӧ�=i���L<�N5WZH�������$?�}����i*%@�D��#�.i(�4��$͞�#�aJHƛ��CN߶y�Dm��n��y��e�)���ߖZ�F샴7׋4�NaZ�ӊ�$�X�;�W�w�i���}o��|ĸ�H{�9C�s�F=
���\jR�;,4�g8������^�wćp��8�,��A&��tbb1�H���h�w���v�'ZV]���H���3�Nk�I���>�5�T,߬����~O�b�˘�~��X�����G�aD?�B��b�ny���G/2%�b���u�������؟]){�&���\�8��j�h^���T��4�)_��v�P������寲Gf*-d�d���_J�ߊot\�:W��]7&�����*J�4Z�i� ��7y��	%4��B�e�=����;&�^w����Kă�iW/��'ĨUU$EϿ$��Ι�4c����� ��-��9�(}ښ[��m�X��4�w��>�C>#���>Y����|��Ǥ��|PG.�1g�3&V(]ө�0��h��8ڗ�^��a$�Ra�(k�!Q��A6z��	^�&R��F��E�_��a���Un\o�}�����=�D=U%@%�e��=L�vg���t_kDi��ax�(G��vf�yBn?r����V���������J�I.Tyj�缾#v��8��C�yTA��8��1��:���S��O�Q$#W��'{_E��~CMip:�`̡��_/R�0\>z'¥֏Z��ũB�x�X�L�Q�����]�~��vC<�G0���d�w�r��� �|2Ӗ��{����H�d�j�X�i�gg4B��}*l��.+��/�������>�k�����ߚ�jgo1�)�%�Vndi)��a��~�D������?��O�����?��������D���. ];H�G�ͣ�t]����%9�L������G� ՛IC�����̛̀�eݩWG�!��y=�H�!�q�|S���pɃL4�]v�2ϝ�lr�sb
�u��7ec��zt��s�jA��֙�KǕ�_/��a���r��EkZ�cč!���:�T����:S�G��h�Y�)��=�,�|`Ã�<؞�{�a�?8��������%�: �{o%�e��z�"'�ifow�IT��
�"�6�A�5�8�jُ��J"_�?*�K>f��т�l���k�G�4?o1T���1*p��n��|d��;����2�S4F�{?�l�G/�U�w)|�����*�n�Ir��"|��.�^o�ɷ�X����?ﳇ�\���"�1噤!�;��>�a"_�6�Zo��zr-I��݈��^Ұ���Y��Ӣ���c�ݔ��KZ�9��jEG���t�����|�Ɉ�nؿ�O��״#ߕ#��;K�G�|�
>��#�f�q���݃�;�$b���f݀����p��_�y+]�*��r������׊��8r��<������q�sx��{*�ZN�פ	P4 ����R�$���]/�]�l�z�=Φ���TOeV�6���:F�)@�E�{T�8�=:|L�]B�g1NWK�̿��Q����
+�|�
 ���?�Os���L�/Ir�p-7��~ ����&�i~W,Q9p��8��["0<-Z�͒�*����Hx�T;�RȄr�9we�nѧ5orc�VN�]�cВ'_�Y8�n���>�|)튩�H�9ҕ]���H���_�k�E���'�� ��fnwe�CI9�D�x�#�j՜?���]��C<���3�]�ۭ�&c�{j�1�������(�͆c�PԂ�=�sħ	ì�d��yH�mԛ�ߨ{��N�;�<�H#�%ծ��\^h�a
#*��<%m����D��#��s���r�%��B�E�FsE8�g^9��@0J,s"��[��/��0j� �ТoD�V,-9������Oi���z�c1ќ�])H�6����3��(��h=��-�W�K�p�����2|q��s�1� l�M�vڙK��7h��T��0Wrޭ�NE���,��#��zLүH]i�_/�^�^�jN�F�j���.�)�tZ(�>�U�a4��fuܖ���x�G��18B������җm�4��'����gIg�r�#�j9�̓��k����{6(�S����T�ZgK�qd�Z{��Z/ �Q;����c��Y����X���p�ì���n�"��i!}~D*����n~ʙ}��if�#�����<� �����;C�Q*t�Rr�ּ���,�X�X��Xc���wv���d&U���&	�1��X)�s:�F��y��E��3r���Jᆸ�-����������;?��j�WT�JL��~յR1�B�}u�B��f��o̷��7s���<7����I��ڗqR^�������-���K�G��Kw:���ؽ���c89����a7�c�8k�{�*�4�Aڳ�.�_�;�~�7��M�6��fDg|������Cf����1*�R�f�(�m��N��i����R��
�~y�2�,/i��+�К�۾��@D�Kߑ���9a�$� ��H{�/�1 I?���(� �%r��糘��Қ�0�n�y3��Hv��B	�f^C~��R���6����.�-��8�PIHkB:kp>v�^ϗ*kԶ���~1Q7�M��AM�4�`ė�q�&��_�0ʟ���!aw|�!���8lr
Η,�z��aڏ,7�vӢ�P�'o_�k$�S˻�\N��0L��i7Q��W�S^�]�2W�霱l�����<�;8��)�H��B�>u��v)�Vω���C0�R˵ސ��Q��q�E5x���|�I�&��>��q�s����Hm��d*�)���W��|���wq3�Q�0?X�c>j���i�����/�ZD%֚o:h��4W��_�a��ǝ�l��<$�/�!|�߰�Z�C@"�&�NNp�m#�a�}z^����]�v�itw��r��)��=�����z�T6�b���[���씿��M��0�U���f{��f?�>J�7-�Z��iL������r���>���l�"U,Q�z#�CEW_L�G��=�!�	o)����}�a$J0!���q5���<weJ	�FI�ȫ���~�w�HDk�b7���x��c����ۦi��WV׷{_���>6;T�6|Η�y�Z?���q �|�J_Ð}2k��AU�M`�5�/*���Ι;���n��4�7S��b�ZM� 4���{��{���S��v�5�|�S�M�ʄ&��םeI�N���:����0�#�"��<M�|Ȳ���^,`A_�	���|��X%�ܮ�����-���h����9:|�M���5LH[��E�.p2�
2���bQ��7�g�M����0�1Q�J�{�� ���6�\��$�v�E���<�k�k��W���-���q��@�5^ɑ�y�AL}{��k�ɍ�Q�����ځs��F�8��q
��YD>��o��rnZz��� Z�4�Rd��q��|S�YL�7�T�r�
��Y�ɰq�z����p��	O�vQ�hƕ��=2j�n=�1� �ӑ�&c�O|����g�:�l7�"��S� �"��L�[�,#y?�m�AV�vC��ZË�-5႐D8��(U������]ȯax�Y�b�����T�˩�� J��yP���a�c<~țߒ�����io�ĎqHj���{�Mx�5���&Z#���<��$��n3�F\���/�c�?"��t!�n��N���sU��,��z/ڷ>�l	�X�C�W8���a#��w@	oQc�m�3ن?_r���4�Vo?���͞ZE.#_F]��Lwm�u兟���5�Ô�N.���lj��t`�c�5�u����/�В��1�I�x;�Uf�P����p�Nd�l�0�v���tgu�]��VN�I�̠��T� ���_���4�p\cN�Ȗ�f�Uq��,�)� `u~���k�O�~���zv$��n�%n�	1�ݨC&��ȿ�a�5r��"��%� ���_u��`�,�k�~�h}櫧T��R���@��C6    i�(���n�4<%k7R���Z�s���+y��:M.����Aɱ���ʍ�I0Z��O"�=��/��Q�M���n��10L��U�va�q*��%�O��@Qt�Jr�ky\%�k.�Z �.�����9��_R%M�˭V$�85dl��`� Z�M�{vW	���"f�Q��smE�|��V(�+�s�Y���%O8�1�@5G�d�.��9��=&��D��P��10��W&v�x�i���G{{��km�1���S�B=7ؤIh�,�1�7���KJ�z��p���Y,.��ӚkĩJ:fʓ��|C�'x0�'��놔��XG���0�{��-۟w�?G|�LO�Ȱ]b�8u���ꩭ%;��|� �Q�s�
�2�N�7� ]�X���ul0���{E�)3�Z,΅V���nx����1��>Ky|�BC�f�u4��[����Ǔ��:p1#C�o|�J�����3�bQlZ�.m��~��=���T�˟������3��O��~��k���n�ꬡI�����RIf�8LT�~��Ã�G2�+�ݧ��|��< so$)�Zs_���t�_ð~
WޣFݿX:G�s�=
����T+�u�O&&�)߬�!w�!(\�w��.���A�/�|��%��>����k��`$�IC��F;9��^�Ƿￆ	=��7D! \�-�+N��V�jHO���/�Tc�<ߌwHg�&5)Q1��|���"c�=�^o��2�nF7�y�~��tp��1��:ʞ�q^���}�O���lN do�up�p�z&PP=�m��Y��|G���si7�]����u�c&���F��r�~>*��>�\��g�V{Gv��˗�4��:Hd����$|�
�Pnt3�Y=j*��<]qw���*J{���z��R�zJ�d���T���K�8P])����po���4L�Td�7��۝����������i+�&� �������XnJPY�qC�cNN�hכ���2"���|������7�Y�-���7Vʒzـ�4��`~~7ӂO�fwBg�ۃ��;D��Zi�h2��zt��}�H��V�!*;+ײ�����7����T\����E'� ��ō�*mu|��/��_��&�� Z+�-��Z�,c4�+�V�\��ɳ��{����3ѿ��?�g��?��8��`�?�~LE����jn����	r���K�%����Ϊ�����a�?�Ѭ��X�<ip� �9��"�k�WI�r�Q�HSra�`cШG��?��c1��zhv��ȕ~D�#Gi��C�Cܳ�	��9��^R�]��i�rc�
tP���`S-��F#ܫ��֏�����a�b�W�m�)��)�7fA��ʼp�F��_}�#K���{�^�M��.K��L�Š���z���bH�L�M��uP�3�7}䃗�R��T��; 0���V)7�^�S.b�X� T���5O��[���B�"X�L�����s�d�|mRח��F���0ɇ��BĹW/5#>i��F��%������|��J��ݬ_9u8߼S�+���R�-�@�c�:�����e����A��3!c	e�GC�Eˏ[{\�'�J��-���(Od�:1��#�!;�ùt������1������l����Z�;&�<� MY%��&q}��,V#��vӰ�4X#�c�p��*i'��4<
�+���!u���y	R�$��Fp4
�ی����wYڸ՛�\nc�/�c����4tpB3b�M�y�5B	^m�7�&�y���K�h�:YN��z^{Dz�����!Cn�����/����&���f���S�nK\���Z�nlK�PP���H툹����y���j�v��"��F����x�1���PC
*����R�S��b�j(�>��s�T��u0͠�5Y�7�am�Un�m��z����T]i�xN�Y*��^�0�c&�������jn8F����{�)�K��O}=��a�bX(���ō�UgKs��Ư:2���i�w[�_��aB9V8�t�4������7ҘVxiݯ��0�Gɟ�,7�p�$U��m3G��d���h�߹o���a�̭�@���{�n3NN�^����:"�a�?�W�o��0��>��z�䚥��\�{����&ɍ���H 8hT�{�,�a&�/kC�0R?������6yV�g|��$��%VF6k���`�O����k��3�%�2�<�|�ȥ��:,A�֜�gӉT.e�-���,q��j��yx�0�&�+߈�-ʳ�����|ۖdP�6���>x�}�fء϶��-m��9
Z��F����r󭅫�p��Ӂ�`ds�J � ���k��:���{l�����[	�nZ�Q�ՂqKSkm�m��0�W���	;jpJM�	͠g[��k�,[^_��a4�c�*�={�i���؟��^[�l�<f���^7L�mQ����1s���";�1��rGB4&���%�0L�6"o�Y���Y$���5��;��2������(��F��#KW�%�#�N�F���If{>�i��T��+�� �;Q�S�ْ9�i8��[��c�����+چ�V���c�ıՇ��yռ�w��R�l�M�̫Z��f}yH#� q���������S�z��3�4�,��ŭ�m����<��`�X=i�/����c?�"}V�s(!���㋞oX�\�]�cJ���3���j��#�h1����j�.��Y\�l-�	j�Y�S:�Ӑ��5���o����b��AB��\��$�'�UsjG�i5`<�<VͽR����c�d\���4NВUOސִR�����t��|%O-յ�	�o�-`�u,q�F���yM]&�1Y�^8_�h����EC��q�:�"{�%\��=}�?�>xG�f)g������p=�N���u�����)��dTox>��  Q]_��ԍ=u6]���(��a�?�{C�6������L�]���?��v�Ƒ�7�OiRʅ�%.y��Si�K˕�!z�q,��/�b)�F�Ҧm�(lf�#anbx�̧/�{�좈�Y�&(��[��L&�R�R�|�(��V�Pȕ�������;s̙9��:�1�/2_W�]Jcj�a]%ٹʩ�H��ll?!�{F�{����&C�Ӏ�od��ik��y/�@
nF��g|�Ak.B7;ףT1@#��+܍�,M�_Ά��z%��S2��Y�:�d{:A)�ÍwIᒫjU��;�0�k�����Z<�>Ct-f|�"0y����x~6F��w�"W��"%��J4ۂb�d�Ǫ��]��k�AU���R���Hv�b�zōJ���3�^s���K��fb���G<�	m�&���9�h���|�+1�w�7��S=H�w�U[�P`vnr�=�q
�������"Z�,ge������P��Zuw~>��Le�72}]������(����T�b$���������؍L�T�@�2ܣo=g�]�č����U�J�ۆ̕n��z�]W��c,����Bt��n����<����DTn�c�b�n@�p�1�%yH�eڢ^��x�qÈ�� �\�5c�Բ}y��E]��2��sl�����%�d�7��Y��Y c��&�ВU��/e��	ͤE6�of|������#HG�!{�Vy�5}?���x�A�u,Df�cG�ը�!����	
Nz�%�J�����qG�w����0J����А�����w��J^��c�̤3'Յ�.���(5�c������T��D7z��9z�F�� M�{�����߷��r�vé��L��h�� /���f�t49����ѯҋ7$e��`���J+�-ܝ�!)5q���ym F��k�p1Z�,u d��v�%Fc�uJ����_�h�U��k�l=�l1��b$��������z�
v)��\ʍ:�F��J�w��b
	d]s�k��z1�a
�g�Y;�_�����$V۸���2�q� /���Z��w^ů6��ǇW��T��q�A��9��Ck�N�j�|��۹�i㔍,�c$��4�    ���������# �9�%V�%���,��#����y/�[T��)�4�I7�-��u���g-����0LP1�����&sWx�@�Q����6'�!ۏ�c^34��"*9ҕٌ !�	�c�`�����6T��죹��Ȟ��#���lO�LOG�/�����g����	
��-j��W��ĩ���sh��#8���)_U"�����:�q�0L��g�	1��^�O{;�����3k�w��  N�Or�h�J��w}���5��OCp��Y{ ]���c����ԉ���[�mo��4����a���# �>b�H� ��MZQ��Yޮ:�0� ;WݶQz�y��s3�� �+i�S���񥿟���yS�3/dt�"������^ZGY%�_��P�T)Y.�j�R̨�ӹ�ơ�)���֟�1�C��"��E�w�`��a����VI�i+\��-b~>���c Oof|���bgkt�S-X%{:p0ӊK��g�������Mo�S:KN��
:��zCF�z���S����_��)I�ݿu.�%�y�P�2<��g�9
׷7O`���՛m�ʣ��g�|��-���T���#'�ϗ,Ʃ�CCWt4
rܤ��O<'�����R�=���o�L7��e	F��"��~� BX����u�.ƿ�S���&�Ek3��-��y�3y?�G���������vQv8v8s���3q*o�&|L��܇���1ILt	�������42�
V���]Ƥ�u��|a���Y� �5��rr�恕��2K��1Χ��7X�?�=��ךK�\h��P�֒ڲ=V,,��{&��?)D���o�����o�����J�ǟ��e'.�n�3ӹ/����{f���?� �.PP�3����{,��Hv�L�� Ύ�����Q�8[�b�Ͼa	�5�FPP;'ͼ�+G�����H��T�z����|�#	�#vl&r����!u�c���k)v�7kH�v����|�3����(����_�h�(�!����q �#��FI=3�CB�f�����+1�zS�l��#�����p��Ҫ�S���9��a�cZCp�0L�}kCrR�Æj��0�]MHo)���OIp�P��)� 0��#t^H�ODo�̭����i���ů�Fe�w*�+s�HiTj��5��F�����X���Ck �':F�nJ���۰^��&h��ȅ]|�}�Ud0�v}CJ'�?3��y|�0V�B楚s��
���4	�D��W�E�̑���׻�0L�Kj�nf�֊���~.ā�����>���ߍ��M�Z�5��K,֎��O� A��{����?�h�����g�/BF��Ґm\�A�ٹ�)7-��l	'����ߎ��'��f�+!P���I����N��Ԗj�LK��[��?x�~���֚o&����{����Ղ	s��a���*�_�o`��*夲�'��^�@D��9|)`�7X�H⏘��p4oB�>�Y�6�5�����)���0��
jʵ�}6��j-u��u�]�q���o�%�P�!����\E�˴Gp��xcd��,z�'�o�#T�Y�-�3�Q�Zb�}� �X)��Lh��-��}���C\�=k,XE���c4v%�M�V��]C�A}����̕k�tҗ�+�s�4p}��i>���P��w �>����wC\�J'�w$tF��{Y98�������~S��ȗ; "�H9�Ў%�b�������`���j3��E�E99 ,uĔ/l��;�x�s�=��@��2C��/b��@L��w$S#X�iӔ�ͥ����ĳ���bs��5�9�w<ʔ���e=�6��,���) ���g�!*;F�$�����߅?£(_u]�xk�F����vp��pvψ�@Pح� ���|�_���v�XM"�y�T.r���$����R� �]c�I���uF�T9��`�%H02����h�.��C���2�ݰ��9\}�@�噉��Û�r~�7��<� t�ڴ.��Cm��H��P�;���P���`7�j�R��0/ê�T�F7��C�B��,rv�Q�E6ݣ�b�e��3ט��gJ��ab�Q��撳�dRb
��Q:�d�ȣ{?զ�!8e�3٘Kf:�c�A@�Z�.Z���7C!-7����!#c!e�{OQ�	:mϣ�z�>�������d��F8���n[*;֚��+5�+m���n��x���4�D�a�ɱ`�U�C�x ��L{��X��0-i�oQ��?�>V	Q��~����#�#;xO�[IӅ����2��o�Q���vV�.�	 X�X�q�^6��J�2�_���i�J�ߤ]��N�[��pVl�7��l���7L�R�r�5ٳ��31��ʚ��(>�s����o��o�lCG�Z	=M���<�~b����r姷�3��9��-u;��Ξ�I(Qi,1�� �oK/�~�fD���7���Y�#
[��ĸz�?�><"��0#A�u�@B�U �s����3<����괼��y���!7��5?+؎��Au�����f��N��a8b������cې��w�>&ד�S��6��>��>�r����ֶ�hDmG����]��N�|����fr�m��{�"���S�9���J_���0����0zյv�l�[���0j@�I�v��卞����q*�fөQ���_Q7��q�Q��ի�/�o��6�|�ҥ�"P)ۊٟ���;�l��8HȂ��57gBdNY#�uʈIFi�J���˄���E�3])tM$/��$֥?�Lbw�*u�o�X[���-� �`�/-)'�rR=0i�����O�h��[�w/�3�:rK�����׎��<{�.�L��a �%��E��U�v��ziZ_9�ȴ�
I39��������qC��4��{�m�Й�5@�Vx�S}���A}P�j��A��b&�G��D���k:���_���D%�T���
Fr;��V�����	a{��2�:��ا!필��� P^�	q�آ�Kܼ��Cэw����*m�.b���8#9�v:T����n>���GѰ��po"S�j%�}'<k�Į����X��Ϸ�`*��oF_�h�x�tjCL:�w�	7�O���[~�0}r�A.�@��� m�֨6	⪒�V����׵��0�Q���0�v������u��6��+�#���Z(�F˧p�R��:��8�h��{wI�tN�ƭ�>��O��I�د�UW�!EW��@�pc��g����up��a�oFc�W�}8F_�'�
o��{�N�yl]�-%%�q��HI���$�I񴒎-����aY���s��]#�k��O��`�H��Ye�͒�O{9$��s�U3i�"��q3ģ�[�U�ol>�b��a4$�s��Im$.��Ny�h�G7�M+j?I��'E�
jr���xR����!=	'c ^Ѡ-M_�Rź0}b���%�ޣMܕ�_!&q<"D�am���y��H�#�C��J�RjL�{Y��{�%<2D�3I��Y�ƀ��RnT#���GS���Σ�m�Ժ1� Y}~�.����J0o+����Fצ��������;��.{�7����	l�wL>�v�ٓn��.�=�c4��Zɔo:��[�9(�hJ�`���!���on@>�Ic`���Ԑ�"���z啶���.��56��Wh���D�M�W�8��m�1��'�kY��_��(A�$�o��9������N{ۃ i�Y:��3fA�H�9�v�SRX�a�I�g%���=)*@��ķ��&��D%�I�T��pJ>
N�}U����ηF��u�����Kuр��1�<W�~�����ySp�(�ߐ#�<�p8��3\��4렽ʙ��7�Z����nyb����p/��ڽQ.�{�/��fu8_����E��2/�V(��ocDj���y��b�+-7_�҆VO�ñH�/ū'�����^���I�A�M�__��Y%U��IFBc�-�� �xo�'�-ڐ��FG>���    :�����6\�5�2(��d���mA�Wr��h�G�����Ǵ�����[ymX���u�)3S$�7���r�
��_|@��Tߵ��wy��g�23ݔ½��ֹӚ�D�^S�\y[�R��1´�qg.ҘA�C�/q�I�-Yo�陎�E�|Ҿ���&�c���w'�?6K�Z��lUC����o���і�&YW����W�bH��M5[u��Y��a���vՇ\r�՞S7���i	��s�I��OIb��PL��MtR
6�Y�h{$��R�M�/���fm!�'7��}�.cմ�4�zqu\���6���_7�G��֜o�4M�x}���ʨEB#p6Ĥö��;�0����z�K�Z\z��@������j���@�Ҩ�����}����	9�"ƴS�&0U�z��Q���B7j�bk�e�]�	��������'>��'e|�����u4���jN��&_!��3�������C�r�u'�b�<��K�;K�4!�u�o��|����v�v6�#B�R�.试�wI�iT��70$��;�q��OG|�������d��i��1�P�7��i��pL�2���,�1^nQ���u�>B�J��S���#*)����l���0��>�
� Cy�7�1T�����^!��n�:�m���<%���)]q�g*#��c�1b�+iO8Шǅ��%�0��]6m�5������Xy�п���4��j���������(�a�3sИ���4{�%H����]����Crާ	F@_Af�}�����B�z9�!���v�5﮼C�
��1z:)L�M��o�93�v��YG��k��c�"���^�7�s��ѺDա��@H��c�H��C"�=��R²S,�����.,�Wfy�}�-��1Ry'��LL�g��a�?˵��`b-"ZwNZY��k'��d�qp���^��P",�z$pa�Rj��4��T�X����JмiD�bL7H)rXVI����!g��1B�<�y2�ӈ��d5_Y��:�#%OGPB�� 	�0��7���J��J��� �6U��gw@�J�%��>Y��f��,򭄷4�[+Tg�1��_o�0Z>�Hi�Y!@��9%�.N�9��Lz���5I���-� B�wLˇ��w�u+����|�A�ԡT���A�'��$|L�+�.$��g���<_ה/�6r������X#P��6$y�&H�N���1�x>ZK&�vE�f�y��i;��Ąb�v�ɵ#��5��������n�!�u᜺�Dm�K
f�^���< ��[�\��佼�	���4f�ƨ��{r�ϯ��W�5�7u�1�V��{#(���0��j�u��RIЀ�Z� (4ƙu���4Զ�^s,��`���}߫��g8�zc溎�2[�M�#�^F�Q��A������(�C5��`☹�q|����o��AV����|���՛��n7���S0d�H�19�zkd������o�^T|���p����Krث�_�*o��5ob��<�Y2��\�<��ɒ`M�-p�&��+�*3"+3��a�#0MK��<��&����)�;C�!��.��F\YE����n�����j���]�7ΐ�g��I4�!W�2�#2)-u�y�+�ĔY��Խ�G�ȱ!�|�R�����w_%s�ן���v3���N�"����Ɖ�6��}ցT_b���'���c���3F�a���Q�}[��J%}=�}��j��d��ϙ,e�!v!
2	YT��]�y?!ЯE�Ro�O�<'`K7J�'�R���Uf��g}_SÛ̬]�5��̑�A{?�d����dx����G��̓~����;����^"0��ҙ;���!������yx]�����Q	��3��nmZ����U-Fc�����Yʩu������a�,#��k�C��N�E�Ω�+��S�y*�ۯ�Ƽ�VA�� ���w�H��"�z�qb�=�T#�&(O�'�S��~^�_P���8�δ�3k�jj��J���p���['1�r�t�O6�����.�Q'�Gs3F���r�b�אxo� ���ּȼ�S����k)�W쪏pQ�7L�M�VMC�C3<i����T�z�nE��(�7��3�C��z�b�7�g����-L����z�M��LR��9�8# 0ROѡ<_�rҢ�7s��hyl(��k� ���}4Bl�A`�����8���������3Z����mJ_� �H��|����g�S�C$�:C=���\�k�d>���x �ވ��j���¡u�m���CW�g�=������"�K%�r$�p������7��������=�Q��y�<����TK���R�wZ��αU������Y�ԛS�P٥YKh��B��;YVܰ	�^�c���%{��em������2ЛzQ]5z{'������ƝL8�aH�D�w��[Z=�a��vrM�y�aj�7}M���{K�C6��]�tW��_/�F��JfW�H�m�i��ܯ!lL��b#zT�y���C���{����F���=��0UH�{O!��k��1o/�3Q�y�>{������2p���{4T�	03��D���S��wP��
�@*m��1�r�Ii�*��?�G`�Fh7֐���%��昺���bӳt���1T�+�Ϙo4�7�<6���C�I"D-U�=wE���?\#0Wɹݨ�h�!������T�gbw�L���|�*�Q
�Z��ϳg�hD'y�/T�!�'��X��=\�I�JNy�Dr�M�-����o	� �z�r���pbbr ���N5�~�+�S)o��Q��h��Lq��U�.�N�	u�$��������[�79��:J�64	�<{��ac���J5v�p/��r��?H���~W�q,Q�2Y����x�m7��j0��+�Ƚ-5)�A{hy�Hĥ}Bu���gCs+�y7j�1���
�Z�{�@�7�5���6�W���PPg'�������CV~{��U�Fvӧ�8s"&�����3��\��Y^ߎ���Qc�؜�)��A$b�b1ʶR��u�k_��7��?vi7���;�]�il��ZcF|Ќ�8z��w�>���ƞ�lW%}��$59V�R�*���)$��]�

xí;�Q���B�-FQ���.�_�F@Q��x�3ѳ۞ �5S-�`TbD�������3��<U��EvN�Z���B.QZBc������~���!o�Ց[��$��2B{ �,�s0~V~=Sz�Qr����ֺ��kZL������&�x����8�(�Fs��	h�U�ω9<�?���f�őu^b�x��Js ��V׳�|O�*Q)�֧�]V��GoU;y�A4��x��� ��(5wħ�����������O�m���#�����_?���^
���礂lc�{[8����E���l���#↓�N(
R۞S������G���'pA�(K4\���xpf� �t;�E9�ͬ��x�+"�!r�����Vm��M}MJ.'�S����7D&vh5��Mձ���IkC]��S�:Sg*R���Mm�!0��Rnx�Z�h!�J��{L'��O� ��R�p�珌EK�Qk7���yH6`�H.T�}����溎���d1m���U��]1��8��u�ԛ�t�o]��;D���V�͙ἫΚ�$D� c�|�Zϐ�g�Q����K����Zv���9�����Ƙ�"�D���S�n���meI^�ߣ��Œ�j�5S׼��5�b����h��o�����k�F�J�Td7?x?n��<ɕ���-��[��}�m�%|��3G�?�yCdb�֮�j��h�Xh���cnI6�L�N���7���	�ސ��w!���-�K��G[�Y1#j�oY�ㆨ��,�o�hBD'8��po�ir������$���>Z�j�Ι3WN#��G�F<Q*�ʱ���e��1/���vq�x���Z*3֌��.Q)�^���^���1'Ө�l����J1q�A���!8�g;6���6��J�����)!����9��qhj��#��?�r�%�    d�7f9[Ɔ�,�9�B�"� [�~D�y<���,����(K��o��8ꩮ젗y}{������k��\rӘ��T ���s�aGE�_�������к@1 ��m�j���*p%�=�*�{�}e4���q���֙̔ ]B4�CM}��<�������t#�XN��^�oTk�9�wߝ��]� ���6�鈗UE%�+�	w�ɱ񏪺��b��O�%��Qc�1A]	Vz"���ۮ7:i��k_���\?�~g�#^���w�u��A��wD	a��O�".f9��<�j���O:���KBU�����绉R\���o�zӦ��Xτ#bK�x
�̴jYȿ��;�O`� ��.��p$d�l$	�Z��1�S���r�'0}�,7�U�v+9�8̮?ε����ݪ���fC1&S������}�x��OQ��� ��D��v����x���M_�,�~��>
^ M�]��!ܩY��]��)ݘrc��u�l��c��m��c���\I��)��U���7��1^��4A��cN��5��qź������|r-�Fۢq��\!mVM�NKb�V�l� ��8����̏�{��f��!��Q��$�̻��5����H�����K�ң%�ӵS�h�n�e�1�\�P����"�
g;�B��b���≿N1�3���1��X�/r�
�Ь�|.�Mb����u�@������Ч�f72R۩Sw��эY�w�gF�����a�7�?R=����>x&OQrI�;��.nyw{wc�	L(�5��I���2bVhh��&8���А\f��d��yVf>�=�uB��C�8̯g+Z��	���"7"�{�9c���@���IaY�dܨ>���ѿc`�z#c�HFY��Y��ZO�1���,/��3%�Vm�7���.6Ҝe}��P����H�^b$6F�Y/�R=r
�oj�Ú 婕|P�B��|�]a�� ����&�T�CP�7i>��J��a Tc��q���v󠟷�^Ù �%�;yˈS'rs��'0�?8�v�+*4��؄�Mڒ)|PfZ�,c��¯;�P�T�j-8�xN��#��dO�}5gP����$�0}���7µ�����j]g�1�d#����w?�?��Ub��.���`�FBc�e�A��Ƒ'w���W`ڧ���_$�\,ӊ٘Jxix�L
q�=��z��x�\o��5�jG-����
B���^�3��7c4P2i�Y��.�P�z86���1�>�c�����,��Gh��F�s��Q�&�:�q��1��n�O`*��o�Tkl�;+<&2�u���������2���S���4� ��R�oS��:/�
�~��f�#��Ή�{,��4Joi5-s@��}&@(\.z����E��b�m�4��U��p����Xb3�'%�%�c%-�1�)�K�9�z]Ӑ�__�-T楰���k64b�wo��ܒw��n%~����Z��{�bT'U�a,
��@R�����s�ƥ^��RA�r��,��ǊM�zx�I��>O\�:z�7��c�:��+�@N�{�I�g�
���5�BRҋ�M����Z�\zAr�h�j:uIGX�;��\n�q� �;a�E���K%�G��l����LK���zd��c�<��s�l�}���>��z��s{��K��3�־m�Az,'pPO�v�����Ϗ�5���ث9k�l��PJ�c������1��]�7����!4� �шK��rj��x}���x8����g�g�8������9w�}��\�	����E&ɨ�k�-��v,H� 2roy}`j졫����F�)��P��.P��x��u�ok���K��I&7?�Z�U�a6ĎB�V��W!���X�v����5/�m�����̑N.��ʩ��ޕ�C�[��^䘱B��8*5���)�Z��B�v����*Yŷ\��#[���T����Z͜&����� ��r�W�wSV�O�aV�Ş������e�$_��n��%o�Cf�hǈ�2kNT94�0���Y(���Yoޔ����y��r��}6��p��/W.x���np�p��k���['�� ��Gv�z�����$߬��&�2r�/>hDx���e���r�`�Z�n��=K�p��[b寎X�
�������60��_��������������!�_����>��� ����sy��Դ�V�A4>�y���w��e�(���g��덇j;�3�N"���ȳ����7d���|��F�ٺW޹��*>�4���Q�B�7Wpţ���.�ǹ������ȡA������zZy�{5��ϴ�.B?�35JJ��n���,u��O���p/��;Sp{���*�~j��Y�	�������k����Z� +�Ce���3P�0�k=���Ә��jSD�?
�����_p�ǿ���?�|�����@D�%h������ⅽ�Z�$HOm��h��[8 �O���+�o�w�=�~t�<;~������i���C��!�K��Ш����61�R��.1�E!��{��e`������04)7�r�$GO,�NЊ	"�����k�	�-@Y��	����$[am�?
����)&��?�������sa(��l�+%��4VRnk���.��`�[�<��?y~�P�Z�$�G*#��c].9m:Ъ��_�4��?��nj�bA�P*-�F���Dcj���j�\ah�F�� Ug#���R�s8T���9u�|���?yjЇ]�'o��7��?��ۼ6Jrc-�l����~��� x.W�!���q`�Q0�@*t���C�*7سB�(��E ��`��^vo��8I�#����˟47�M�F�
�r3N�B��r���v��J��|�O��)�壔ە��wu>`�G�HJ����yZ:�����g
B��.�4�e��S�(Z��]��<��&ȟ67�G��}�0�r�2�O���ud��Lin�����z���0��qӳ�0�-�(��)���@��w���sC��Y�GY�i�
b�n��W9�VK� ~��v^~���� ��L`��@��Vw���Fn0K�hf.���.��"��P[�Y�T�V��Fj��O#��G���
��?Y�f�M,��4��5Vv2$��Ce������z����A�b^��Jy�l!�Xw,� =��A�����}�����	�t�r�gF&{z���ȇS�P�r^D1�@g�xx�_<��� �x�
/I�Қ��bP��R*�&��H�Q�Z��+�����WZ�����]���#��hO�CE-�ZH�m\����!���?������;��/��yޞ2l��$�v\!|�UE�ʤ�þ���O��\n\g9�Ϙ�ъ�|���Q�Ҋ?v��~��ڪ�@X�?��M�%�G�&'��%FiMc�����Օ�^�&�7a�|S���VR+�4�7���Z/�U�?O(��b�%���jTo��J�7�IwA^�����*���?K'� \5�*�%~��qt�4� F��?~��isC��%\Z<�ܨ���MϞ��l< �#z�-�e���g��~�0�}��`ƙ��P��>kN���Qq���� �W%� ߍQ�T06M��1s���:��s����7A��o:}7�=R�9,�w��2u��#�U���b������pl���b�:�KA�e���ˋr�_�����XXE��TA�VRg�뙧�q�w������Z�/b�x��+G赚�ǂ�\�x�4`��Xh�I�O�~��\M�̕k�g��Y,����Y�w�?d�?gjh�.?�n�>^�^-�R_G�����>dp5�kP�?[(~�0p�ѫճ�	�88q���P	!	�#�q��gLOp+�!�_��Ł�Í �Y}4d���Ɔ����wA�����=g�� ��~�pK�&�ev���k&����pI�SP@/�}\{q��_K��b������m6�7K�~ť�t�#,W
]�C�i80QPU���+��c��~�    �_����o�};}4�o*���sh��cp}�w���5�ڛ�AL�f�I�w�mjI��%��s��)ޗ���7�W�%.��wgh�ez#�j���ZWN�8*N�e���}��S�cI�F*����2��_�k��vV��z�������J��P;��RAU�`Y��XQ�{l*��%3@+]a��7���tBF�;��;ۈgӆ{����G�4�q��̏�FA�Ҁd�a�^��~���W`(��pb����1��TsC��B81s����s՜��՚b���j95�,���"ǜ�h�K��B��HA���U"��P�s��ߟ:p8��n���rH�Zsߤ��f�o�P�Snv�����S�X{����J,Tk7B���g�z1��ԛy�5zY�'������j�V�{�/:�����>�c-��x>�3��qt7��Y���Be�R�F��K���ɹt�����@������E��Y�8�G���S>�|�@�����`ygm�?;��|��({J9K��"h̠��D3zd���s�N��rz�%�PU�%W�j �s�4�!��I�p��VPޘ`ܬ/�	L���*��w+}�3�S�+��������{�su������9�����N�|f��� E��X��Z� X�?lm~�IT�u��C�,�(&C�F�x��rZ}��o�	�8��f�)��)������F�+�����f�ʯ�x��fכv��8��r(d�ʒRu� a$��b`��~*\�M�<�9�O�0�\^c&x����bQ��S�{A�nF�5Y����4kr�F�}� ��������g�\�E�.0� �L��Y��s�l��[`�~(����v?�[55N]�>f��x�������� �`�һmD3�Ί�9?4���"�̷_�/\d�r�5WX ��eg��x1� �Vy�x�UB`b�L�J5����%�#f����tO�ت���}U�	A|�����x��s8P
Y���uR�E���P���ۆ0}��I�ȫ��yt�6�xz<�e�8o�~X�FA���b���s풨9�< ȃ�j]o��*�~�T���]pq6n�H4�7T�ȴ������x����^6��1���r�s�?�}C�Iu��U�7�����r3�#T+U����V�e<v�<	���?�p�fk�Η�AXx�X&e:�y�B/���-.��8�7�|Bէ��^��Ө����!:c���_��[\����d�[;�� ����a��iR%�1 �A`@�خ����>Bsw�����A�<���ؿ&�K�{�n��I�u��� z�UGj�uy}��Ɖ1��;�r�%7�+��B&�Ҙ��}rH}�?.�}�k�����}E�2[�0"-�+����2��^�Vx���U���r��U�v�7aMUwi�D�������l��ŉ�y.�>Ҷ���S�g�*�d�G��s/�dS�7�(��Z�h"�c�[�TN�4�/�o��K`<^��(I��jO�;L��������w���3Z��.�\i�S
��U�A�����r
���_%�����.n���gV�GžVwl�q��m��z��rnW��s��j����)̈7>[�k�2}�cu䆋j�+�<C� ���$y&T��_�z}��hR���Z�Ƴ���*Tk�U��:Z��_|�Q{lEnA��j��W�@�!�n 62u�a�/JL4c����d}/�'�]�e8ƆL�U�
i����ju�a�������鰂>��;�F�[T��.$�7Oӵ�6yr�#&��\�H1��˞,�������V�f{{�7�f�]��kEA�;+8-��:H?����8!���T!�c�'�"9�sjĞΐ�m���ge>~�0�_��"vh����y��L�}�c��ˋ69<�[$G�O�'��Er4�u��a�\(?�<���q&��0ȕ�$@�9`��<�Hᶚ�sA��U^$F�{Qb�6��.�$2�i�0S�M!O�F\�M�5�P�v5_�{�c���M�{��$m�<B����/d�[]*�ٌ|
�$ő.
 {�v��	���~iG`���c��f�����S�+6��|O$���0�?Ld�t#^_�.��d��Py��m$���A?����ts��|��	L����^��2J���mt�|��bu���0t��
@L�C����}ڜ䢤�a�ji`�c���@%A �Ӛ���{���P臫k���@!bR���1ކL�(��t��,������j�e�^�T<�#Һ9����� ���ī��ý��T��s�F�|�P:�Ϩ'k-��}�,N������(�n(�d�w(����(���\%��S�z�maX�*a��Bz�k�Ĉ��i��} ��ˬW0͇���qXE`b*�Y��5���P��dr��<o�5�I���+��������O�'���&|�aY�f=� ُjO�(�d��߽����ڍ8*>*��-�5��3�Ĝ��
�?~g������BWΆmd�uό�tv�|Z�ݧ{)����_x��!�~��ƋV�W*1�O�����BE"�k��3."��*_�
��2j�V�����*on�xһ_����?��,�d$W/9������Ԋ&�!ͪ���j�9�e��%7���&P ��ܜڎ��������L��R�.��}nk�\f,F�\�AZ��B=ϑ�������p�!׎,Rrl,� �(Eih��2���\�^� _������<��'<3 �
ZQ^�G}=��
��V���n��S�P���� ���Pī�B��]���y��o�d�7��%��63�K��2~�ȴ�8[����v6��gmr�R��	�8"�uy;��f���|;B`j�X8f�LV��V����x��d�|۷�o���dk7W)�6��5'h"��³f�i��S'���ȇr�y3#=�\�x�H;�o�I����gK�og����ݸR�Cg��0t�<RK�Ia�ƅ�~{����,��L���~@z~����/�-['��;���c��j�n ��-QF���.'��UNn���6���v#O�̋�l���xrI��>���g�[/�	�OT�81���i(B�!�	)&̝�v�6E�މ��ȳu�']lU:�+2V4�;��vO {kVF��9e��n�(Ϩ�N��rhҨY��k:<�k�oKt)7n�+��Q�����Z�.�t�iJ���w�i5՛=(a&8P����;	�r�BnG�H_���[`�nx����=)א[��zӝ�T໦�Z�K�%��I�$i����'�(\���uw��>/��D/�����m��n3t�Y���n�&���VLy�2_ut�٨��S��j�6��$O�u.j�_{KtT�n�O+2'����<wԴ�g%̫��������d(y�9p�AN���9���q�6x���t0Hk`� �q�{͖$��*`��#s�0{����;ޞ���7�B�uTkz֤��^c�r-�������ܡ����[k7;� IȽ�ա1�~���K��ثy��W�����y�R�l�Ԧ#۴�����D��՘�ø�䫧��#i<=�O������+��O�L��,n7�V�P��IN���O;}--8]^ߌ����T/��в?=�Z�.�Z�����b��ɷ����ܬ�tZ��<��{��XI�8$8�;��_�j�.P�E����u�W��<ҏ�1�$�5��R9_�+y༩����x ��h�H;���z�T��]�F�۞Z_�ȿlc �����W�k~�v���MW3��U�4{L �v��"�t������C���������+�'fm���D������(�+W����N@*u'�{�j�s� �H&���^
BPs�r�om�i�t�a#�86�{��]�z=����.�7[Ӈm�K�1Ӈ�1@��M��o���O�9�@�<Ot��F��#mHv�gk �e 4D�V���]�R͉����ͣtd�����y�%��k���ͼ��7��.�_z�Kǟ[O�[ D��%DwƟnA	�    ���X(#_�7]>�@S(<�~\�'�c�����M��qB��>��ެ���p��y����%�Q��������@�s�]4\��M���j�\�&�^�[��֪��Z��Q8��8���c���zH/����I�v6�j��{������1��������ի����Cm�Vi��
��t{�g����	L4&ͯ���z��Y�?@* Ʃ�궦Lz�H��B����&0sd.
�7��p�f��+��*j����:����b�����B��H۩/:��4]�@���X�%�|�;���F��a�W�6�\OI8-e9�5^�\������ƍ.e�QZ��������ޢ۴N����믒������FH��@>I�i���H�E���<���K��:T.�/3�k�t!0�[�驘�P}���*�qn�#v#����#2�81~z�A"_ϟ5�#��r��<�جTS��C��P���-�QR3�빒��w���q�n�|�&I,���C�4�S��G�O	����NWkr?�)?n��ĩ�>S�2t:e>����Gda�7'�Z��?$�t�.� O?�����[�t��dn$LBڃ�nhX��=ϞHʱ�^o�ŃY�(JW�zh{V�k(	Gg�}��O��v�x}�0�q"������pĬ;sFz{L����&�_�,&��:�p%u�?����p��*�pl��e6�y}��gCY�f�3��V��C��N��5�Ք-��둯�&@զ7�?g�ڞj���6z]V�V�O/���*^n�1۬��I�h%�j? L^c�|{�h��B�Q�r�m�����(U�c���̞m�̋�w81�V�n�̋�G/��O�|���3yKu��_/�`� k�ѕju�cg�4,H$B�|d��j��Q^]�k�	������9_���1�]CG�G�Y��#}�pᯁi�7O��� -���M�J��#sR"3O�=��ٞ��v�R��Er�6%վ6P�CLo)O��C!��[�_�)(<�D.�H˽�ūG����z���j�y��5@�Ss̴�_T��Ǻ�z����J���o|d~�4��|7'�S�P���e<��h�c�t�^]���L�@7���% ���[�8m�Ux�����Ư�0
��f�ay9uWK�����[����Y{^�n�~&0\�7��[r�g'0��Ԅ��k�M9�DQ���(�
>t�s��	�-4�:�P�#����s٫�t_�)����M�mL��P���;�xb�박q��[c���x���7t����Q�!�&s%�`GZK�YQ����u���4����5�ǈ#��:R�̩����i�W��T�=.�(�nN��LHʶ�����Q�'F䣅�FhO�j�R��#���r*�F[���6
����k��p㗠K�Rd���^\)~�m�s ��<�F�Jq��[eǁD҈��4?
�mB���zv���*�@x7/$�0�,��e`7N^cm|�첩�w������ެ���J��!;)��LՆ����z}U�P�"U��?<�C�i{�N>q�8�#3��{�����O���E��G.���	Ӓ�qR)��;��?z}`�|Z���L����6�@��M���ckm/���Ϋ�o~��j4�8l ��R����}-W�I{��#���50�#��x����5��j����N��z�� �2#�j]@�
w#M�D����JN��"�f}����+0B�\/rϵ[��|� ���d'�*t�^��J��x���EU�*�စ����2x��Zi�z{���臥�3��ό��t�F�WA	��HE���� 0�>U�� �RE[�=5�5q�E�mǋw����W�Z��f�~�J�w�u�5�U���ܨ�" 5;[io?1Տ3���j=��Pg|�S� �Y�u�i� m���Ƿ�K�����L�S�Pm8:���榍M����"�)�NS��ٸs�DE�!����Y˶ �����<6J3�ɯ�)���=��)��i���G��N�����t%�d<:�FA���L�<���y���(�>(���XI� ٷ�/$g�/��G��k���c��F�Đ�|&jq)8:�������y=Ri�r,3�xI��+c��a�
� �gZc[(�+�[��+0���F����zfN(B1Ō�؋��!|o�g~��՚(�L1/���	����5���)�ڕ��׿D`��o'��@u.�b�#Lv��b���u#0�S+>�Ưf�
j��+ZQ4�JOZ�9mw��jݾL��n����!��-Z���YNʔ�@�|��V��K-7�E�(�T�ૄg�p�Vu,��u^_�<���ڕ�2N�"o`�}�jy��)oS���ni�_�>\�E�	DizܟX�,�yRt��^2���_q��L���(��Q�K��r4�5��F�	� -��zn�<e�7rJ&�N\�z�n���*�]����;�+w�"�H}�?gz�S�0i�H4�Q��_�=͙���Α��4��3wh����TJi 8�z����IQ�m*���(�����p��P�i�~�#�/���W��VNMŢZ�oLçi`\1����/�_r��e������}\�G����1 �S�=���Z��،�8�oH��H�~�Ab���\
n�l����$��Ayn7"#u:Sz~]���SB�,�h�� 0�>D�o�n��y�47Z	�>��Jǧ���5#����[M]p�	�;~H3$_C��f�vХ!3�C᪜�o��J���pɵ���GIgv�I������	DX=�k�*�1��~�"��ZrT���
����@���	�]����-GC�1v=Q����A��(��B�U��eY2��0� :N�T�{�eW!���>5��l����4����Ge/9����;?��׷�'ע7�MZ�e1��h�Ċ��U�O@o�
�[�����>�~e�gN��m���df�[�?F��,�*�X�%��s�ԣ��Q�`N�ݽ�'0�Ҽ\���(QK�zXF��~Y<������_�a�d�6n�$v�v Oq���fO�&�#{����i����G����c՝$�(���z��ܔ���w��'0���t��:<��}}�aq�A^S;�4.�����石"}���ћ����H�e$m��J�c�������W`8���/�|r=fi��wjAJV<q�̱�Ч�{Ƿ<]��aF� �m۠p��E9��Nr$�$��Z����}�>��z���+���z7�۹:�#٘t�뻟8�ßB�f|p?$�_��~\#�ԓb[��Mގm�-K�Vn���m'�ضv|Uq���\*/h�7(��r#U����P�BY���ļ��yDW���&��fTk�����\��N#qK�0�%49:�����	�L���ĺ�M� �9��t 7p pgՙ��EP����w��D6MkJ�tᗝ{������7�J�?�z3�Tu�U��f�z�0�B`*�ʓ���v��AU�o�f�}fV�:Sm��P�{քJ�H�#����B&Rs+7	���=fh�|��C�����_����v��6��i���\�E�S/	���,����7f{D��h���xMA�5�XF�߁XgzT���ɷ��!W܌(������'���iXE�eYF����Iܯ�P��i��S��XO��`(>h�T�x=���_�ux��[o �7�r�8�rĸJ6��d����'�����a[�bb˥XTL~| �i�:m~{Sq)�Ӳ���A)��t����NM�.�b{��'��
n�;��ʹ?��¯�0f���0���tLg�'�?�|c:Xf]-�I�;A���٠i�~��C�_��j�Uc��x�(�5@�=�39������{|�	L���������JN�j�ū���B��8H� 0�0ޮNL�1FE9I91�;�Emz2`^��2���'0$�!�u��8*�)'$_F��eg:��پ�#��v��{�L��4�M��ﴁT<h���*&_q�(�ҍ >���D�<0���YV��d�(�(dlZޗ�1��}�^G    ګ�KeɩI�	%_������CH�7������3h�X�iljIL�}�ɯoƔX�w�r5��j���[		��X��<��h�����M��a*E/po�t�R|��0�4�$
�߅V�����J����H/h���R�g������w���c���NL��x�x�����in� �k�t�E����@`j�5C�\<\[G�n���5�#�v��h��Ӌ��*!0�Q���E�)�{谵��|�+����q��g~=S�a�͵�v��d��C�����ذ48�xd֝U��	A�6���k=�eE�nTb
~",��bȹ������>V۵f�i9��e�&�x�e�+U���+�����(՘r���+O�;Mm1Ȋ�z�D�mM�����@}|��(�8��Sl�&������m���+�����{��_I��y�tr�Pn5��/���_M# �F�`����PF`*߸�[�>������xuC�N��V�J�����˿ͬ^��*d����>�)�GN��I<��.���b I� ��������}�ݿA�����Ui���j3Md�X���6���A�y��C�E ���2R��Ja
��婇�S[`�������|��M�J���Ic�3�I``g�╥�+����YC���S3���k�fD�sŋ��X��;
��+/�_8���y��A��6f����hcv�γ$��sT���0���]M1�l����
��h��Y������~���M
iS�9��X,ۄAO���>Cz�o������p��z�9�A��Rg�i׵��������O�������1�����-�>�.iL�����Y/�+}?*�7]��ΈM��C{o�����__�#oGg�r�;�Dj卪#>�5N������O�k�Y�����F��^C���T`�x�^ed�C�7��O%e�xB���"�b�U@v�`N��Ɗ���k 0��@k7˯M��Ƚ�C/��XK�A|l����WFʧ ����"�ة����_��詯��9�:��E(�E�8�M� #��B1,/B��p�kn[롕����<}p�����w	_0F
 �lN�6;�����W`�#.~�&t��j>a��u�r�=��ߨ���1O`j��ȕ}�)gYM�'ƚ�Ā�����z���W`�c9���`E���q�����{X�622�S��5���P�(����Am�ԣf3@pț)��h��/�'��M`��W�qLtkL�P���6����o��"W�D����(!��.mR"3"�V5�{��	L<����V#ԗ��N��RO�m�ds�csr�wӡ'0�?Bv�J4t��!����s(v�x;4߮��[`Z���.��q�ԯ��Uߩ۞Iߤ��|���W\ڧ:]M�3�J�H��� �B-w�Bv�Y����צ8ݜ2ֵ	�v���p&µ�L�|o��z���C�P�8/�@�N�=@]ҰS���������
�|��:�ٞ5N$�8���S3Ľ���|;_�yK� H���yj;�+���֘)�uj�&��˅�����]��Q�`�yqLhXH�#(H�r����角�E���Xn�� �y��<�e��yxy=y.Ϥis��u� ��l�gܧ�Q�Zپ=�"��O`�|D[iWiVp�p)���(���� $Y�P�s-�ݏ ���܈�X=^�B�-�"�k�:9�ژ�
(�7������ѝ:R�H���:�f-�lfp.}�:��7�b֧?H���Q�"s�IZ�+�j�$_���+F mKL$g�H�SBTW=3s�j�%����'γ�;ъX+�RzR������ /��U�����ʾVKs���T$_ ��zk,i�^n~��TQ�yh����I�cY��ĉ�81�|w//�\x#W	���YY���.3��'��kǏnλ���7L�T 2�x���}���c�����К�v)��k��֪7U)�jX���#<���iv��R�|�4�W`�':K7�Bsp���4{��#Y;Om�|����}L��.�mS��;���[�mK꜍��q/���
�Dz�39�֦��Ӿ���hy\���;���/Н�$߲��>Km=��X����m��"�/4|SC��F���%��'�(ޏ��\���C�6��B���n����-�G�w��ɴ���|�d^0H+T��k|Sش<m��6�
��L=,�;d^�ԗv��ʀw�yGI
�Aܝ�N8��Q]kgݯ�k"0��%&�.@Lok���,+��7%/-#:�����}Z��H�4B���Ԛ��siY��Jj��7��+����2�_�i!�e7r��Z��q���PuY����(7z<f��C{���E:SǜK����C/i�[ �����Y�,v����,M
�>6�id�i�<n����7�����t"���É	���RTN^V�R��I�Y���>rF>A{l	�ȐE�K_�-��r��'0�?Es����dT�9�'�&7`�e!I�)��CW��ƾf��z�;^g�r[*�w��D��yG���}7��R�N�P� ︡NSׄJ��iA�^�b(p��cn���VNt�DWs&�O��̪c�������W��*��Y���.�Nn�$��X�HM�N6i(��~��L��0��lv#풙O�3��(M�i�vR���b���޷��t	���H3�_S��w��Ʊ��V�������O�C��oG���7�8.۳�����Qҵ�w���{��~�ƀ���ݷ%Y���mE�1�xȯى�OiL�i�ј$���[���*S?4
FuuVft���'	8H�]J��[�[��]|U��h�̩v�i��^,��;0�8׀�� ���5�����RQ1.ι�.���W�
���	O��
z�aW�	��	�7�����b�w`,:V��)� ��cx|�̱5G�V�)���8����1�ɛaxㆺ�H��.���q�23��������!'�3�hv�i�P����	r�P��������5��	�sJ������	��5�9��ZS?xv�e������a=���c���Db�s�����
#{��g�#�ƍ�2��%�yi1M2X�Ԥ�7H<~����[�W-j&� �T1i(H���V���ƘO&��2�c�1{�����~�#�_�	�>��,����?$�W�����J)��%{�{��C/	Oj�Ř���琰/�=u�3l��Oe��{/�/��Is�E���II����5�ٓ� OڷS߉O>��W^��9\�2k`�G��&��o �>���ɕ�4[����p͞~��z���6Wn��������_kp�1�9̙��oRn���N���K��^y�ƒ�ύ׉Ԓgi'3�K���]�������x�9H��e�P��7��C2R�iﾡ�z�[�g�Y�� �.#&� T�v���T��֓��"ҁ�����:)�(G����(������5��
��
ד�#���/�4��xm���6�k�u�%���왋�(4xA-=�Tg��h�סbiu�8b�o^����g^���FC��f��u�cTB45��+%�{����hu5�'�+�C�?��1�h��Jo���c��յ��x�zr��,��G*�:��Ԑ9��gk��� � yq]����h�F�+FHj.����S;�s����f�f�H뤇?a<�I��oH��%�dRY�'����l��IE0�̧G�]ď�W��{��R)^Hn�?�:0�;F�&>�z�-���4VB�����x/��
�w`�a(x"xe����>	��Qfj3���M�k�q}qm�xU���Y�F�x�1 ���*a�]g,����(��HE=�&k�I<���$2'�ԝ��W��u}���p���4��0��?��ϕ���Y��2�����p�B[e����h;|�t'�mԕ`K�\�t������� ��<i�!o�1�^��'��V�b�0�ѫk5$����'�=4�I(pF��Fm�d�+���Q+au�X�I}�%���SCxv����^*���Q��0����#�#�E��?1Q�	�@X���b�o�'    ��É�l���H�BJ�bVZ���J�eb�WC>a�[N«t��%�F�`�@9U*��8ϝ�WCLѫ�kA:�k�#��Vx�8���n�����n�q	`�C(����uW��RO�
�yrJ�~�t}����-�Xiм�z�w���'�*����}^|)�Y0l����{�/4`�'�	�K3+]�w�1��+tpGWGs���ggy�!;`���ei����;�\��g��e�P��+f�fj8Kh�P񴤷��0�cj)'���8���m����f��񘷒V��~��x�������n�k��d�;�C�!��C���K���Lr��w���C)ߣp��o�ã����iǅ����#J��ʊ?O��%�x;�i�0'q!0H���t軌��^]��l.H��H�c�6�=�Q㲐v�Um�d�W�dT ���� �pNrbз�.iX�ԣ�FC<ά�x���S/�J�,�ZکhL�P���1$n�U�-{u?0̏Q�k(��/GsKMC�/�-� o�w@8n�O����Rʡ�DNw�4Ж�@�y������ ���N�5�̥'c�ET=���x�6���f���9�ɍr�U�a�q�6����e��v�=yў-[�=�&z��<��A�_^�~`��H��k+m�#�$i+�@�o���v_�y�]{���N��䱶9���]Ü�g�Le�`߾X��w`�1gp'��^�+!D�ˎ��;�2�U��뙊D�.����a)Lq��icw�_LR�0�R�X���Ly+�t�u?F��&gp���z����x��el�.��D�܏���J"�����(���,ՋG��L��	��Ɇ1O�Y�JZ����XM�t{޵B��_]��YO;�����9,�'�0�sL?SY���	`��^��Y�ᇧزT���c��n�+|�������IkwU.J��G|I�[K������$%��Hr�ȶs��m���D���>�5G�o{����DZW=�.���n:�5�d�k���������등�I�X�h�C�
5q`F��Z���g����ƻ��d;���Z�*�wL�H�rEc���F�`���o��������3;&�D����K��%d��w��N���S��J'�c��Q� P�#4q4�,Hb������|"�d����pv6��?VF����h��'������	�Ĺ6OJ��M9�l�{u6s?.Nc�������,����K��4�o��+��6Ã���եj��TS��v��5.�<��X= `����/�{֝ �u�Ԙ�
ۣe�1
����4&�2�	�u����Ta��R��1�ۦ��_G�5!qrw��[Vg�U�Ҹ�k1(N�:9ۦ�� �&k�� ZÖŻ��1���l�݋'�5���%��({�yډ��,[������x>��u�M&��C���G��rPd��[�����F8�Qh㴼����gk��o�:	On�l#��R��c�\s�`���K};Ɋ����	�k\�x��SK͏S��@��U}%+T*�p�Fa���"����	7��R��cXNu�S��sF��[����LY�徵�}h�_�P_�0Ml��ZB�QY�W�=��2��er���{� 5Ӊ"�6*�#|��G��w�pb+Fc���?0��R��<������h힄����>�����M�ݼ��ŀ�'s�#v�)�� �y����u��H�_c̗�
����-M��;W�Z�ܢ�:���Q��ֽ3��y�����>������f��4�B��A�+zƄoFH�J�N��C@���i�Ÿ�����i���jxy���#�����:=�����!�;ZO^e�ѥ_�l�i����hB�i˩���I?�GZ�i�*,�m�'�g#Rb9�Ⱥ����)���]�=#G���ʸ��������'YI�WΞ�f��̙��|s3K�>�R�� 'M��lK{*�G�Ay����9;����${�y��Ov̪�uD����G��8��0��ǒ�|� Ï��!��pTv��u��@�4/K��^�h�~��K^�kN���U��R��
r+^@���ei��N|��K���жv�$�1	���<�\3���/�&�T�ю){0Mgte����Իx] ۲/�C����䚽*<�1YQbpb@Xn��p8�k�Լp�yw_�:�+v�<�'���ߙ�Du�����U��y�78I��:��z*L�֢A
�NA�Ƙ���:�[ӿ~?0�R.G���d#���Hl����%TA2��%�>��#H�n�	򨖄3%��^\�QZ`��f|�=��Z�� ��6wE�W�ģ}(�{�n�T����u�f�nՓ
h-*��˒kf)|\�fӵ�OJ���h���V�pq�DMy:�ݾ>�Y�m�|������D�Ɏ���0����;&癸@�6���o6��,� F��	�<+��/^Ș45,�.o�{�)�;Ƴ���&������=:���g�Y=]�}yS�҃ف9(�&���RH��Gɣ�QH�\>T�C�<)	���[�4f �o���Zz�������ҿ�忬������������"�~�޸��9kh�i�mc)�z�D�����_[��?����=�/��o��f���X0��	On��d]G*��6��a!6�*Zx�<�������00��Ρ��c�1�P�)^"��K�l��\/�0�a<�с>�-���A	���,��T�����ݭ�`��QN�Ӡ�X�=���o����kgn4����n�0��N]A�T%�|�����aӳ��Œ���-���8Z!f[$���#ޅjK�?\�k{�7 ��C$�����^ ���W�Rϥ9u]P�z�MS��90��N4)ȏ��ӊ�AVf�c�ȴ���n0`�Qg���醰4y�7B���q�L�=�)#�C�T�|һ�Zg��Ս�D2,��r'k�iO���+��H�UNz��<Ǣ�}Ø3Y��G�'�e�v�}��	�p�|p��ռ�OREub��z��F_0������"[�p�>����Z�a�M�L҂-�U�ׇ{������*�<�Y]1/=�X��GiJ���ϠU9iQ��FN����D�	$��MU�����q#v$�Xz�
�{3�og#��,ݠ�"�����0=(VN��*�gٓ�?I�Fj&��+b����í�G.O&�rbf�Z,,�G�P��W�4�y���; �_Ή�@�" �'�1CY+��y��7��B��2�������U��L����x�~5�g/9���n��`/!�����H�kk��b����N�x��ʹ��M�^`<[CH�\��eV�"N���ab����{j������/0��� 8�I*����vG��'yN5�c1\_0^[g�#�$f�v!�,^�a*<�&�iF�?$0�d���}Q}�x�Ԗ�א;�u)��qnۼ�A�G���4��U�'�P�\R#_�3^/���^����py�}%'�FHP��L�:�7p뭆��Z��\n���>��H!��J������LSn�t}���������J�?���{q=C)�AI[|9���(��:80N�
{�9 xDsȜ�I}U�}Ǆ����'I�r?,����A��UI9��a���(#%c���/`@[w���O!>���������OR��e�4{�<�˻>�8�3����E�~��V������Ҁ��@���I�'�BgʩK3�HO<�8D�u��K� -gw_���P~���I3jX��9A83R6KV�D�6���Mc^`8�=Չ.CmU7{		�&DASk������q׻/>�أE���\�H�m6J�HL:s]�r;0彦�P� ��w&�M��]_N�LrZ���G�]��/0�<qw�{�j�^.�2}�Px ��C�{���_����uJv4!�SfH�Gsw��,���%�̙������>����xZ���$�w3�N�Ƥ���0+�)zw��١91���=Q��Z��:�ip(=.���%��'�Ұp8V�J��UYI|!�N�    w��FW�,^)�/��j3���Z"D�ZQ_�2i��V�7�<F��u��ʣ��u(�~�_|�<���"�}\ c��ě�w��(o?H�AX��{xq�/����bOa�C�極o����1�&a��5���,W��n��r`J�����A�ls��d�G�;N��jƼ�W��w�|��x��6%U,N�hJ}��a�uu��_k0QBj>�d]��I����I�#��1f�^�/!!� AHN
�=�zb]^)������A���u�g�o �<lY��M)�1��&�DQG�Bκwܒ�}����@9鍙����H�̚��5��&�����r}APB�:^�N��V�ݑIj�
G�n�K*�%W���~` sr�D�CV�1!~��N�Y��c� {�"�X~6�Cn����Z���\i�je�Q�Ϻ�_}d�����������M�4l�Nً���Ӯ���?�k�L�|D�eP3��ē����knUm�_]!�EKU-f/�O��4�n

F�G�L��L���x�M�~�B8�|����x3�O"r^k��7���6�,���62�׵���߮��4J���!=yɜ;@^үnn� C�`+�� �ҔK<��1u4��ȸ� ����?�0<^��xpZv�WGlXQ�E�#kM������>�@t�T���O��<r��yU�E��+`�����Ha/�N��,Ě�(�4bl��K�Ʃ��:�*z�����<h��zƋƶӞ�T�]�v�u(�S�bp�����O�Уv�81Jl9�[�ѫPC��Q æ�o�>�P~D��<���1���гu���������������|�mga�^���L<&6���U0������'���:�1ֳ�� ��:��Z�=!�ӊg�op�8����l����+�CMTG�21�j�0��;潁";����Ѧ@\㇒t��k_k/?�W?��	5�l�O�?lZ���5Z.WL���I�HGG'9� ��
�P�;8Jc��X���0�����$�-Ғ1�y}Y^������2w��3��U5�R	J��7+�ocP����Q�}�P�i����cS��\ې�'�C!���Cb������P�w`2c��j6�� �� �#����ZS��(	&9����͛�q�`E �q�����(mu���Y�0�W��"�m�-�0���~'�R}!:6�Ԕ|��XhZNd���K��J��舝�(9��3�=�8����a�4Ju�[�Zwk~�x�DRv�=ںQ!��Rk�����c��bc r�/��V���ǔoZ�
^9-�E��;�~�zR*�'o�]���PQ����$g5�`���js�0X�,r"/E�պ��;
;��Ö݉�(YמP����,���:f����Uf\�I`h%�N�����I�~vL4 �p��Q��EѼ���1��
���n��0a4]��܅��U
�TC��+�1I��[k��Y�+>N�kW>��
/��Q�xG�����-!r�[�����P}EL��Azu�Һ�����36��(1i�S4��� C������]�a��c�L\�`��;�]��V�"q`�!�ZKʡqN�i���5 �>�'��_Bf�1�i �x%�NR�Ա�Mn#��n�0ag�r��ۓ�򄼹sTC�I��(��<�q�ׇ�!��㤧zq>��s�PpPR�r(t�j�*�ve�0D��wq���̶XO�p�H��T��v^�������$��d��B``�<�s����0L�p���L|����I���b����F���Z}��Ve{��v���o��_K>�'Z�r�����xx-9�� �2�O�s���Xt�)���y[�!:{x�W/�7��ez�hB���d��0[9�Cz�=(Y��*�u����������]��,�$SOB�C8բ����B-cx���{J-'�/C��t�B�Gu��+~�j������G^�T���d�~��{fI��ɾ�ZT �^r��i�c��8����KZ�e�6����K*��:Eݸ���B6����푠ֆ����{� 1'0�$�`���Ǒ���M��$�d=�ަ텧�U}ASR.e���w�{PUN�b|��bZj��D��b"x������w��(!�XNbL.e��>҃ $ww�z��_���0��8z��N�i�=�V��a���7�5��|�)�"��L/�=��$Yh,?J}S��f��iwӻ̏J>rR(�i�y�!/�Ɛ%u
�%�4�-��9���cU�^��U���Pq�k�$%
�Q�����0��B>q�n]��\j+�c$�$��^E�݆�������gx��7���F��CӐ:����彪`��0��^F��'����T����b)���^�������"��j[�E�O�۲>�i�I�y��w���`��o�A�(3k�-A��=O<�BZ���a3�=6�&�!�\,�a�g��bɋ̜��-a�ޜ+��_G^`H�\ODc=�jt�Ϊ��m�,8�K��W��gn��L���h9yY���;-e�{j��V�s��Eݮ?J�#�+� C�0�:�b�����3���~w/�L�\�Dfx5}��
��cB�q*ua��Mo�r��yD44Nn/��i���_�^1�����ae�\�~����.�A#�h2})�<E�U/�[�i�Փ�7 F�Z� �}u��Z�U4z%�e絶�,����y�{����S���[�{
t��������>� '7�Vm�f
P�:�)ً#�{Z�^�����׀G���0i�*v�pަ��_��^ rH���7 �?r2�U��HX���R(y2��9�[�f���;D������Iq�^���:��ߘzϘj���n p;�`�K�L,����Q��Mh{���k�=m�e]�pT^eâP堄\y@i�Ҷʆ�R�!~�E�@lw?ڿ�Py�9qh������c�X�c#����������v+2��dI/� :���5����d���P�����x�a|�J=��X�rxn
eu~Wz�`ˆZ��;��F�';Ɣz�$ �,~r(�.�V��'mc�����=�,t�cf^^-���2��S�!��Hp3U��WJQ�G��]��6�j�dR��sP;��[(�wn�`� ?��|�)Sǘ,�G��S�T<W�9��]>�D;CE=�0���n��+鸥�^Bf	�\/'5[�w3��>�Nd7pݾk|>�v��hu����J������fC,{�V{��p`)�/�0�̌Qve�3 ������POr�̥<��{���=7���yŲ�ｾnޘYZ��9�:�N��iQ�2�Ս�g�o��? ���3�!�o��BZ�h6ȴ�T����a �[�Y)&� �$n�2�����ะ�J�D�c 	C.ig�0Ψ��bʥ�毷	_�M�k��=�I��r.���y{��˿m�;�
p^I�~��ɼ��,�B`���x�)Ç��J�!,���A?���a=���}R�k2���}���^.�r���/��#V�DFW�锥�<?�I��)kk)�yFFj[��z�[`��הOd���3q������u��T6�,�W���?��A_�X, ����s`vI���ós�+/�~��SOrm/�=5vG�Yjӷtl,h`\��30�р[O��0(�J��b7a�ާ'��W��S���k"X3�I�%I#�}f�P�v�o���j�nձ��^����g��b�44c9���R����X���A� ��Z����ם7�����%����m�]iR�ݮ��
�T��vڳ��HJ�s�%�S30Lk����g`J�����6[��]>��l"�U˶���u}�-�˧9�qN�Z��N���ÂI3j�״���O�?C襵2�)�KE_P�}��K�̩`/���7 ƞ`1��(qq@�t3B�.��s�4H/q�(W�F�LL�k>����4��=�n�[l��m���V����
R��r2�'����k �ŋ���kZPV&�=� p�[C{� �p\�*�9�6��6��t�񊲮�1b9���Ѿ�U�J��V{;�&ᡍU=�{�}}�~�=���ew8I(G��    H}UER���}�؝]�?���
tb�^P{!-�ш��wg/��&�ř���b/	H��mU�:�; �w@�F�U_5����`�0�=����?&�M���y9����U�G�r����C?�<Z�� vX���������[*,��D���"]K�
1f�ȫ:�+E���7K�֒�n8:�]+��s�� �ȗ��EL�C�5�[ǽ��9��{�}7�yqA
��#G9�N���z8ʑxmP;{��h��I���HC��S<�;w~����J<6�6���_�������?�����"���Z�d(x/�Sv�?n���d\-�Z1�敽s?������t\��k�xw���$y�6)^c�t��m��w�<����8[�� Ζ��J"�&��']��*r��4V����tA}�J:H�3mgNڐ,{⩻�������h'&W	��'�Ͷ���J)n�}}M�H��&�K�C�υ���Y;�ZF�����J�[7�=5Y�I��;�'~&�ͼd9�ɸ�{ג��><�֥���P��f齮��`��)������Ĉ1l��ψ>�̴t�K}��aK�y�`&g����z�	O����L���E��/�P�Y�<��Ŀӝs���"�CӓR�;;!^���
���Gw����o���t���R�kxtm��o�K�L��?ҙ���ER�%f`�BP!:�ͩ+B������xV8���)'=�ktҫ�2��(�r3����r�u�S����i� *�j���Q���#Z˗w!���!���S����15��?�.�U�hۿ��"_�԰���zry&D��<��n�[��{�<�0n6�����`��}����e�֜��`��9{����X�(�x0%��Ǆt�?Y+���&��aŏL�y�5���x�z��L���N�p�W�x%?BmQN��eM���z&P���WG+��Luq�+�E��=&Yk��.z�+�)�������p�V[tK�TSX�������RN�W!@�>!s�IW
Q�$��o�
��[6&f�N.�
2�����dS�a� w]^�r���/�أJ,'�ȭ�:�/ȡ����D�^�1�LF+�ݽo��)�����"�T<'rJ�L|��%��Xk���_`4<��<�@M�D��|�Ͳ����D�_��-';ƣ��Co%j!�Գ`)fi��~��ؓk=yM�ZcXʓ��a�O�^-�thhQ��T,�C9$.��$�z[X������S��i�2������}�+�~C*C��L|��%/�[��M����_�;0Z��'#�{C�W�>�,��
�k�e����z��? l��N&�W��uBKU;�Q�O|��86S���}�<9����Ղ�J����u�1<B�ɳ�K�Ƽ�~H��D~�ǴYqn�3޽D�v�|gC���;��~�>��O�����:�.s�q��d���STi�˛�=���Jx�)$��J�5M�[�W���+-\��|~����'� �Ǻ�$G\�G3d��8u�{�u�i���x�ZO����d�����T����<��Co�1�N����'�v����x����I8F1]��v`BL`�'�7o�eшί�(%'0�Fv��ó�n?J��Y�#���[�'%�ѫ��$#�iT_쪚���|�5t��'��	�n�����i˗��7��B�Fn�WX<�
�&��;� &n�P��������`�~�������1	�[�Ҍ���'�E�X�S��g`0?�]�I�m���D�Yn4)��nȮW��J�]��a�y�W{�/��pt��!鑈���D�r�����0�m�	.�K�6�Lpy=@�!Ƌ�Ї����`7�b���9�kO�3�����F2h�S5���8o��zț33=���3t�v��PB�6B8Z�s=����_�>�k�`�V��U���
��V�cH��LHh3�mu�\��4Kx:��)[ZX�+����(�QC9���+E���B}ĉ^���|���[��O�L_��Pv�J��YR�^hW_Ւ�4�S��g`Bu����I'Y1nL� �*3&�p���+ޭ�0|����^���_�'-���3�ݣ�8�K���U�ݽ�g�HGڛ��<�ȣ�δq����G�D��U=�1��p�������K�&���|QϘ��2�`��zb��e���7����]�$�L�f���Yw{L+ډ(cm���S�*ZN�<��Ta�F�V�3��8��h>�.���c�hX��ĕa��˽k�:������ؑVr�N�;��YI����y��s���ȑk�# �2�J�F�9� ����i�-��|����"��Y����J�b·H���Fn��Y��Ԗ��,��Mzb�)�<2�W?-�t'oL3Ih��l���'I��	�JN�V������3�T��E�,_��>��{8��,[,|x�|�0r����{��Dj��a��g��&8�
s���p���9i���F�Y��ٚ���~��x않Gj�E�����Vq�%�I�.��y��cυ�O��E���r��:�{�C;�GZ�3W��5��\�,���I��Zo	�1!���������&�o�c���/��ŝ'�;�)�D����+Ao�`6ƺ���~P%��� �-�"��=���!r�a��w_��?&oj�O"���
r�90��o#��B�j��0�p=ѽ�#�ey��\Ɓ�i�)�j���˾�"p`^���K>yZ��$��	_Q�6�1Juλ��_`
=\
�\:���	���KN��zr�ZK�3������(��s�r�o^9B����)��Ե�����k�05���L���f�" ���^=i� {䚛�v����S��sr�p�N/����Z	̏Җ�հ.��n���!��'�jNY�r�]��V_/�G���.��q\J�7������6aoL�H��5�j��eY�3SŻ��?��#Jx�RG�`�S�F}�;����*C�i��[���`y��-� '�Q	_�+K���Ԗ��H}a���v��G��ŕ���%��)Sh'�l�	�G^�1�w����p��Q����!�~�i _O[΂ٌ�/������5���;��T.�i�l�V���%a4w�R.�|�?Ir&�`��F�lðu�WյB*����{�� /�r\������)�D�����=i5����nyGǅ�K�bpb2)S5��I�Ft��V�:��v������*�y�K�#�\��r4�gh*9�&C+@a�;z:~G 4;pYcj���������jF��9~��'�q�3l�Y�9>��3�a��ց��X�?,�������A��;��K���	i�<�Xm�uw��L\�����ڛ�-��=z�<(�Sc?�^8��/��
���'��xީeT��vp�ƽ�,�v�������D����g��@�p��cM�m�/�o�W?���tu����ST�)��� 9�����vy��LɏT�'W�<Ak�+�-ݬ%Y���rf�"S��1F�P�D����6�B^MUOM�i\��ꍡ���>�� ��z	I�T����12u�oj,�:0��Gy1#ua�AvO2V���'6��%l8'���	Y�*'�Q
�ʰ��V��!F��F�O�xs���AO�hLF+&U�t��!�+/�V�u�]��_����Wvr��F���<���+5��A�����l�#�}ǜ\�nq«,��5tJ�z��ĩ�&��ȁ��f��<(mŌY;�]Fo!�[���E:��R.@Gw���;��*q��)�gR<��W���$�<N�'�7w����c���wK�2fŇ'����/!C������%L�w������)���f-��^@y�J�'�Z���1�u$&&|Ǩ��Yc節�o��t`0?V��(uĳPO�='���Go�)KYf/w�zqa}ȀN�J�3�F�d�C>
vK�#���n��d�i�Ph�\�6����RޡY]F��]H�(��k{�p?0�!K��W�{��)f�}�`u`���(�Q'���t`;��g2�������5�(el������O    {�B���fы��_�J��18���2B��{�3����O�r��.{n�Ncx�t��̚��ym��A���1�����'u�M*������V�{w�^~�x����:�C��D��*�f��U6`eW�5�v;�)�#��B�#QÅ�&�6o3��l� �'��r����4���[��CT9��9o'�ðExqF�n�1a,�U�o�� ����:,|x�Qv��Y�d�^[���:����X��jZ��%z�P���LW�~�`L��'��0�e�S�%����%fcY��^z��Q�td1��w��3���e��l��Ԩ��"��J�D�C��>oT��~�8���k%V�uͣ]c(��'Zl%G�eI��+�^Crl�Q��-ۜ�_	!��XOT��Nns��͚���Y�i[ݺ�Ⱥܼ��=��'G��i�TB���]����*����^`ғ綊}c�;����R/S�j��G�����[߉X�z�|�3�&N\֌���@j���N��������ަV�ZӶ�^���
i�zz�4x��lz{u��{�V=�vX����i��	Q/"��:�[R�|�v?�{۩�
�8[��WzjZ�e�+�,K�m���X\;8�?2��]�c�>��R��
X&l��~�{����'���m	��<ƹ��������s`��P5<yWj̍���'^�t�}ˤR�ƃ����0��w����w���	�ԓ���g�^?�x�a���	����H�����mG�CFrBo;��.��%t�o�����b����_a[��HCAN��R�����a�-�r~��H7�������(1����q�xW˹ĈZG
WSm�-��U�y8k��ca>O��֓�. A_;�@�4wGNc�N���ۥP��;�:	`jMp%�H��k8'��̌6P[p{�EF�G#�V��z�a�:����d�Z������q0�0�x50R�T��Im��C�66��<O�b>��^����˴�}?G����űZ�&���(��a�ꃪǫ�]�����UŜD�����9
[��/�^�/z�.Yڠ�{*q�@}rj-D�ױ[���f:��Av�zp���,�W�YtqH�aG3R��ֲ3��� L)Ncr���FXB��� �9��>�%���<`��{��UH�9��NB� Q�K~	�]Ť��4j����Vo�qr`�>*١9 f�e=I��dVJ��(�ӡ�M��nWa#|]�H=�1#c��Y�����S�Ŭ�����G�⎒��䭕{�q�F�Ct���d���?h]��J$1�鑗O�R�����q��ėj�|��}o[ �~����1�\ގ�wH1�h��m�ό���ہ���	S�����ңs�x9����L�J��F�����5dx�Q.'<�&V*=�)�f���eA�%�3�ˁ���T=���_�0ˉpe�1�\=��me��M�9��F'�Х�Q��C�9�������ƾ=]3�Ie��=��4��v�=�� ����nހ��f�?���#�gk�-�N�:��ni������f�9���6�Sk�'����y�hi�;	\1YCK��<��zr�榈~dc��ܢ�W��5��*�m��0C.�m�b���7E�Y>%��1\7U,���M�B���Z��CŨKoop���~�8�%�Ml�!����8���Z����¯�e����WۘCx"��m��5sI�sS�8�v�UO��V�k��%D�y/g��M?G��>�v9�� ٓH>����F���)��k��K�s���D>v\��xD������jJ����9�/�9o��s`�B�8��՞�iG7�hr��ix!8�������HT���xҒ�Զ��W����^<������5�|��7g�pM����!�:���ְ__�▨��\ʉ�Lٴ{�C0B]�dY���$: �֫]o���n
>��I��:	Y=.��֤V4���:��w� ����xU�G�+�x/ڜ�ɉ�/����^MG)k��Y�E e��Ye⮕)�b��i'�%�]��1(�a��+n
��l�e�Ɂ�F?&!���mr�i��R���#��~Z���
n��Ϙ=��{Y�T]p��_��W�KUx�F�DSFAG�7^���V�	��bs�߷w�21�C�kM����_��kk�`�����յ�݃� !��*x� ����Ӡb��gv���LB#�w7!��FV�,��DX�m�Wj����W��d�^�x)wwڕ���ЄF<�\&�\s&)=De�V�G��?a��5��LvJ��Eģb�]V���i7�YGU�5����7E��?\���x��<Cn��c�}��p̖�r���W����lL�4�B��)HR��<ǂT�s��/_`��k s�NC){=�����R[��Eq����_�fAz��5�ֶ��E�vt���Bi�^��F��=;�4'�
ӑ�1kN��F�"���V�r]}���{}v2�5kYPvI��lC~Z^�Q[y�a�w���x|%u�u2��[������z�h2���^M��w����/�)��T�"e��(�wL����e�v6�gͿb|���>:q,\��<��������7��@s��ww$~�ѧV�� ��J����篡�ק��uy)|},q?��$��1D$EQ#~P���:u�<f��p~�N�˜���d���d�%�k�Ж��a�����0���\��zn�-�D��85I�kNu�9o�����> ����H&�[
;=4�i����<��$��{ƈ�1�*�4���vç�>�8Q���z$����NG�~dx��N^��l�,�ѣ�
yzr��Dh����������#�����r�h��Zʹ�CF���x�k9ɪ��*�/�� c�y��]6��Wt�� "��l�{�����R�q*QNLԲ��}�{yx��G(�6�җ��ywՋ��z#�'�&�����K(��P?H�:�i,��h�_��"X��a>	"VF�!r�,& 2���'("�-�\g��Ap֧`�z vh��6v�;yJX+�UZѼ�y�Ax*s=y�\�j�$PgW�K�]N�����xw�a�2I���I|e�IUF��U�ad�wD�:�����~�sP���^�,�L1��ygK�愾{��0_.�~�Q�9׉�x��=�:S�(�����DuRN\�����޶�J�+#P%Y^�T ����髯Q'�As�n
_;�������6tnL��<<E/Q� ��&_>�Y_I`{��N�ٗ-`��%�s�]c�.�,��M#_qOh��V�@w��.3�g�	�-�iN�m��y�A���O4X
qϴ�q��r�Qbܡ��:O3ӗ����?����)�*�N?��2++���]�+��T�W(TƓ�:��ƊR㹛�v�+{��Z���������f+'Әa��-���ׂ�#H��Bh~��'}������*�AN��`��켂�mϫ�C����?����Y���e�Y��?��3л�9�q���I�i�mc4�k��g ��?��_�ϵ����?��3��O�(�o�g L��O����Rv^�0�!�3�tm;�W"Ԉ`��3 ����K�	�읔׆T)z�C]�'lCf�ĭ^}�h����r³�pn�i�V�}=-��[��k|��B�*ۉ:k�Ҥ6I{��8��-t�w�<�X��77��v{H�I�V�8��a�af.%m�T`�Իg��W*L�D=� "z�2T���Z�ӆY/w����c��.e9��*�$7�
��3�ś$�+��{0n\��t���n��)(&cL���r�%iX�	��S�S�̘$z���Up�3�A��QU��XLR��q#`�<;�A���\�jZ?J�GJ�q��s(Đ~,x%�-�<�S��o���=8nyN&�!�ͳ�`�����4LY��m[���գA�S�vc;��NV�@�$3D�Ӳ�KK�����]smMr����b#��_��O[��d�n���Nf�*��R����N�p�>J;w�F�k�(g�
־;w�:{ �7�0AIƎoZ�d�d�	��#*D�m���    ��ar,*@�E�� ����J����Z [���߫u�C��~��1���|#��Z�(�y�h��M
_�	�|��ONC���\���K`��{�����_~;9}05oLO��l�`8�$�A�L[�4J���b�D�_-����;��?`jO�U6K�f��WW������Qo�k�{���c�z��т�5� ��|=H{�r�]��ԩ�`�1�� �T��qȆ����+�C�	�B7K(�|.b*ufG|d<�:�(:К��i��w����bW���[ꑅZZ�3�`��s hMX�_���<:B-(�ME�Ժg��PuK���N�]e��W�)&e *)��˞�W��������+F@<:|=�o�*ݔ�uo��i��������!U ث緿���j)x�Z�^�>��a���j�c���J�%U���4o�On��܆��~�i�U�"��!9�r���j��H���0���
�W�6&���n��{晟�̇.�$�'��x��}fK��xq���o�ؿs��w��l�ӹ��l��C��|֪0}����r+z�}�<�M���2\@aZ�C�������n�O�x�2Gǫ�v������R��:���A`Z� � �g�ീz����C3��q҈��&�em�t���.��ۡ5�mK/r�A�Zx? )#�ٷ�u��'��ox)��� L	o��
������֓2�;�ȴ�ؘ���-����^Z�B;�AS.:�eU2'�9�|{�C�>l�7-I�"��"�9����\`��?���`)
7�2��]e��2��$�z��������vj�yv�Ś��H7�����MR�^Z��f����M�h.�t��r��h����0���-�e �;B���[;c9���炽�.��@�$؋��AK�L�v�T���Aמ.)C�i1�^���"Y�;AYv�E�A�u��nzjR���&�k-�^C��	Q��t`[��{��a�G�"ݴB������p�^����hm.د���%�"��A�C�	��n{�h,��$[���������-��a���Z��b��<v�F�c{�W��ރ�a�`���0�%�CRj6��"�+q�v�6�c���?Qo�g"�E�<#����X
��=���_g��zs)�P�"7�x�����v"�x8��	3j���	�$�iw�����kO�:�2yT�
���U�5���f�_��=����)Nv¥��)<���HK��;W[bÃh_�g�de�f �����&[������.�x-0�lѾ�ya�4xH���ǁg���K!�x*k�`{kwh3b�S�1�j�>�~$P�s*t��0��g� r��\Cv&N���=`Z7�'��r�wo\��0�x��"����s�eu��@hqw�L��l��#�3{�Wc�Ǵ�R�rĪ�҂�V��=G����WO�/ \��m��7��ޚɃ�'���`��޽��0Lk7}ED��byv �(Mi39zG9�� ��'����SG�uN9���5�HdZ	��E�'Q��U<O�{�v�־0�R�ˌ�=w�qh���-���GX�>걨W���T�d�7N��>���E�/�㆗y{�-�i�Xn�k�,غ�����6�;e>�4{�?u���0һ���km\����ycz�;V�w/��2ō��^��`E�)��39;�G-'�P@�U�ޞ;���DL���X�e��,�Zjm���A����y;��<4o�M|�����j���w?>l1t�?�!�|D��&�c�ٱ*9��Ŋ���a�����t�!Pɳ�G���^�T�<˙y��z۹h�{gkD�o/�2�B�()�A�1��ɕT�oŇx���|'C�A�+X0�+-�'��#v���S{z�I؟��ڍav
���˲Gt�4�D�#}�oX����n$����F7����,|&<:�)+;T�l
T;i����]i��P���WY�js�0L�'N6U���������c(�7�gg�ok�i����2��{��_[0��4�7�4^"߿�&;�F��~�e��������F�������̖3�#EF�D�s�@P=��0������;�asX"X]@T}��C�Hw�R�%�d��E:I�R]�K�����e���l�����^�ӽ�}�Zm7rW�s�*E��a�=~9��8���
�p�4�v#��s�S�	�ʌ ��{���:���]�݈��7�(K�8=S�O�8��3�D�<m���?-�F����"�\6��r��ѧ�f�F��-��5xi�FƦ7*aC�g@���K�3�(0�F�]Q��wo��2�ĕ�F7�|=~�8r`�k*~g�Rm�Y�2�y{35sjꑶ+I��1"�sޯf�|�����G�%��B2'�W�z�1�i�����~�@"vD mM��^J!�[�nd�a�
3>�[�+^�J�`���4k�t{}u�!}Z���t�v���N"I�p#3�l�[qwh��SA���LrqcL��6{3���
��#�-������ ?��"����9���̙�sm�l��<M��OI곈�oЭ{�2��A����@`�TR��I��������v���9��}2�Dqx�B�1�/ᖷ�!y�_���fRpC�uT�p��n%�1N�k�v�@��+��<%���4+��U�TV�4�4��}��͍!<�˛U�f�Ln�UH���ӊ�on%%�>&W;�Dh�:A�9�*"ߘV�W`�A���Xy*�G[���j�V��N6%�69e�F����¥a��@*\ %b��e+$���qc���N��0���n�^÷��RJ+{���]}�=\���H��ݡ��-/�R� �S��O�F�{vB��b��-�o�O����5_�rQ��n��;��`�f�?�{Ɲ�?r�_e.�A}���tJX0Xᐍ����}@�n��U��L�唏0�9�	�"�~��;Mߞ�Mô���ȸ��q��55�:Fh��#�k�F��|U���W�0�WZ���	X��J]�Z��ѕt��vՂ0̣�W�fo!��l��5[�`Ys��A5����A�u֋�W�CK8��1�Z�U��&P�C��va�� �t�7��@�Ǉ�ҏ3$W*q���@/Xʳl
7;���b���s�/���m��`?�Ȓ:m�r��V\{���C2�0D�����A���<Hw�n�=%���!6���+?)��q��;�I�f�nj��g�<Z������v�mn���R�iM�y�Q5\�{&
��Z�q)F��E�X;�8���9#������7�����ōQ\?��5�{��z4��L��W3���k�[ H)a*�cf�y݈�_��֧o��l�����ʲ�rd+B�I��>\V�m����jnC1�vU��)D�)8s׎�)�ߏ��������x4�ҕn�(���O:�`�ײF��Ԡ�=��Ji���	7�xl�Z�s&c�^�fq`x v{d&�=�6��P� -�^�9̦�Y����x�^N7#��j7À����"�����e`k�9(P��?y�a0pJJ�2�ՋT��zp�Y���pH�h���X�����c����R�{2w��qO��������Y�J�ݝ_vy�P��'n�ϱJN��n=�I��E<���
/4L&U��r3��w�������C�&����[}wn��0�iPo\/o���ġ�e�[؅�p��<���v�O [�YO���8��V��x�x-�"��m�\��1�*����h�rf!a�Z{���ˑ�5nR���d��0��������&+�Ԅ�\s�Ƞ�>59��wO�?��`%��� �%�z�#���08'�r��~�ƀ/ô �~��ng��*��'��x�1��m��?�`|;����_����z~�^]
n̿�f�S/hsx� �?M��R<Udtċ;���.Ds�{�Vzj{S�������v�7ѫ��I��EnzJ�gRHt�ڱ��ne�/�d�it��J]�&���5��S�}��3&�˻�$yf��6�np|�kk�]�J�    *�/��2^�������q�Wp�p��7FK_��H�&Ӛû3��aH?ʬ7@e��'<�rj��N))�=�"��I\?�B7}*�NX��&1+�DpR�^H�����<T�?$h7Qi¨aK,6=�5�(]f\4�2�
��~�H�[D�����2�̔n��if�u�u����0��?�n����3��0�3|��g�|&���_���&�aI�ދ�c�#뫚B�1��H����7�i���A����)�|zɡ��#�#�����1��r9��0T?������:�sPLR�����(��bc�l`x=���]BC���Ж�Yvͨ4" �A���eEI�O�o��1�7�n�vj+{�J���Շ����n��0���s����ɥ�'�QaHy����!���D�L�	ԛ���q��I�SneW�ܱ޵����U�2�i�JZof�'hmA��(@�`�?F�*Y�Յ�:_��0�ڕ�H���nH:�*VFz`�Cx8(����À~݈,��C�h�:�=mM�ۤ�8[��ȗ������r��.��5k�5�NGc���ƥyw��c�O�|�ͤ���Z��>0��S���5 �f}T���To7��	�f�r�egj�F�̺ S<+���������ӿ��/�������D0��L��h�����(
���m��{&��������_���s�3��O�C=_��U$y���]%�����2����'�����0�-n���#������nƥ|x]�p���ln��-���=��ۋ#��a��7���j��W���
x_ �p,}����b����6�`/
="r���*P���<
{�׆a�"VW�\�@��L���ɩ=�:RZ���0A��n|L]WCO�}s)bN���"ЈX���Bxt�Y�݌}/�$��������V��	�Ϯaz��}���ݬ�2<�yy��2��3.J�� C���ߞ��P�����±�0�ji�S�VK�M�n�Y�Ν�KA[��鲪�-��R(��8B��vN �o��a���_9�vV��`��ET���T��q=3�Ǿ����i��J�yJR��'`������7�/�����۫F��	��FO��6�Vԃ��4��4���ɵ����0�A�ta�xy`]s�E��c���܂5��9���t���X�̠�U[�֙ͨR��xf���F�.�!ʕͱ��nԜ���7�p�)[�������}�>�d(�lF�%��3�'�UFYFG������&�?�aJw
9����óP����|__�H�ȇ�ɨ����"u��nEf�����ݨa���T�>_�ly7��3�#
h�X�!^�������xM�E��������_[s�{�l�,���):�		����(c�lV`OA��ˎC�����~�a��oz����EX�uJ�b���.j��������7+�&fB?B��=s�p�m��k��޽7��0��[o�O='�Dv��lK~�,�S���z��,����W���ȥ�S
��9:ߎ�"
h���6?��Jv3+v�b8o����PqXO��J/_|��կ�˰��IqcF�%6�@��n��Gu���SvRh�w�6;=3h-1�eI9���ނ%� ô���n3����E��tN-mp �S�ø��M�y[ 䛦�ӹn�RV��4�S9�vY��f/���w�a2�op�Y@��%���6^�缕U^����eaIpk �f���KfK9�G�RK�^�����`a���禩}�<��BA3\s��@j%������D��!� r��f�I� 3Y4ˍ�a��嚮�L9�n��2�M��8w�
�s�A��w)dvM��\�����_4���=/��ZX�Gx�@�쵫��y=��܅!��F�Z�� �����A���[�v��VyV>���b��::Z.���FeH& �"�f�^/�����vN��^����>�/�9$�J�/��~��Mk�(�V��3#�.I<%�����A'9@����E�7*��g�!�,7���2������a,�|��YmpؤNJ�w-޺��[1_�~}jSS���E�p�5��~˙�kp�&Z��rg�y+��"�����1m����D��8��셺��4j�oӔ�@��(��sP�SwD�6wq���
䷹����h�c*��h���B�YLs��PF�������w�E����B�/�፲��N(������exN�Xx�����7��7f�*�,�����='�O�^�*V���+��>��}��n���7�$U���#(bv���=M��x��wÀč�z38C�ϬCJJ�����m���:����W�XĜ+"��w�S�3�[1���)SI�#�?		���_��R��o��,��,��:��ʤȀ����ona��0hs�/rQ0���<��dK�Zz�8�VY-��Տ���h�����Rֲ�#�&oV�#^�y5���0\?�YnD��Ter@����E�t�{�]ot��a4�k�@�s�'ə��1�|�,�Ǩ��7��n��"�Mǩ��8����iA�G�"b��*ٟ��_g{����48��>\R�p��������9�N�J�njb�X��x(g���D^�c+���;�y ����2�M�����+��I��~��8��@�/�W��0�E��u��Ã�\~����9'@�
�0^ܐ�a�~��޴�����3<�1���C�l�P}���a�T$�xJ|lm��=]�e�RƎ��6�l}qC��yV�p8��2���=�=0ji�r�=,��ף~��7�|8_=�[ka�P%~X=�К���K?5L�x�7�e��TV�N��34�qz;�k�i�#�a�܈n̺d�p*-�xyIfUv�Y������[�[�F����V�a}��)��)�e�6Y5(���-��l���݃U�\T��@��K\"SF���`�&���������:�����,����x��i����b��7�	�&c%8��5�G鍡���H�jЂ`�PM1��3�2�`�ٹyJ��T5������Ԗ �Y9��`+�{P�]S��=MS."�z�v@
X�|mfɞI�x��w̢��>V�yqC���h5�Q�۷e��<�K�J�ZLbm����Y=�fւ-����A+ ^��J� ��R*�z�֪o���0��Q+���4���"Kw��D6$':A#�ͽ=5�~�To2xt�W֊�	F��ɕL���ٵ;��3�7�G��%��ԧ�aRZ�ݲ�ry;��*������:�╎@D ��Y9�6 `�u�K�qj};U��^��ָ*����#�2�XE뢚����^䓃�7{�v�lᙤ?J�3�ag�6�`�U�E]r_��G�<�]�EZ�G܋�ޅ�gk�d=�yul�3�ż0C���r+�rҁWn�fpZ�U�~�C���
t�EYq�%N����ܐ8.~�:�����0�9���0ı��a�p�ӽ8p- |�2�ۻ��Ł9�odJPVm�3sO��>���{au�?ޘoX�ϳs�o7nd������g'r�Z�i���p��oOfSʹA�[�Ѯ�@`رFXx��4L��I�A�2��n�4�}Dnj�M��aXX����r��?��	��ۡ+e�R�7��ڪC0Bp��R����NQ�g���nҧ5�zI�&�p���'�̤:�W������.�TZNJ]@��`���\�YGm�R�ֽ�|�Y������(��m�Qj�3���D�;G���Y&"���w����1�7%�#ҏ��&;X,�H���k�`(��}�i�����(��yr�*��˹����md}���"�c�~�l�� ��r&y���-`]�ӜN����4L.�lvӞmm����.S
=��ϛq-?�_{{��i8�{#��`�|�@�֮�ua�^m4[��}����"����\uւ�;@V�\���z��=�>� ��G#��(��6�P�ڒ.�-���`.G�����ڿ��" z�$�F7�v
RQ�2ĸ���30��q�0�i�"n    �4�[����y*�܆(��'��~����a�0ߔ�g��kY��LK=��ɜ�Q����ef�&�z��^�� +�r�.�G�m1ź9.�_�z1;�ّo��D�q���*OO���v�^��_��0����<���5��Z8��z��E>��$^��Q/�k�qӷ��A?�~�ta=��x�m���A��֓����"���A�sFs�H��,!���l�<no�d��0�A oCrzw�,��@0b�����a�s����.� #6A��>�Q����Wh�v;���e��,�_8 �R����|e�SD�\'���De��A+^x޾�Ӂr 3T�eXM�m¹���y=��Gw����)�Pg�Qp$�i:�۸��]��ٯ�0�F���%eU�KJ5y$ڭ8���D�g�v��H~��k��f	v��U*�
�`������������#��
YO�h�z��I)��Y���.��O3k7}�w�xI�|��8UR�1C�c ��39������V�ohn��?k9��ԙ�ܼ^,��e�U=��|��]�j<� ���0'5�׮��
�{Z]��1��S��(��Q�=�c�n�9N��K&�([?�O��߱��9����o���i����S9!���B�TalE}=E�g���^_۴�Z�6s�Ɓ�(S���c~�ʈ�ۍ���F�����V��Q9�R�������l�hX�M�(|��a�����@N�E�3v�_��׳g��'�R��C;a�/�R�*H��]2�z!z�)U�Yg��z?�����&O	���:l��^_1�p�����9��A���;��<e����Pe����;dy���ƍl���^"�$|�q ��_��.��z�&�T3��Ȭ�"��d�S+zΜ�O�3rf��"K��8E��5I��5Nn�2�b�����P�d���K��j���
�fn�ԕ:7���hZ�5k X�6?�UA�o[ҿ^�*T�u`��E��\�O�
���+����`���:�\XϧT�W�����&��Ȓ��\�x�mZ�׈E����|�!v�%���>�Cn!����0ǽ7�f�tZ�=�O�T/4����fC�\��U�d�k���qwf�DI���aڧ�anDa�4R4KA���2�3���@:���󓚭��nt	�}	�ĩ,�R6�:�Q(��8��7F3�Ҵa� x��G~�tN����2�1R3�~�a�>�[��;�O�<1xQ�ie���ʻw۝켾��O���z]4u�Rw*Yb<�&@��}ӳ��� �YI�6��Y�9ie݉��,v�Sȉe�u����b���ڍ�'��z��yr�hjX�\�9;O�S�����7�z����ٽ������GE?6���b�i�x��̺F�و�������XsV�������2�V��6�`��Y4�pn�Z��ቹ)� � F����y*>~lԂ;�g&&�vIKj�|;�>�g9-ΐ��r��Q���)�3�o�{^���Ǭ��Y�;��l�ҹ�~܂A%R۾G@j�`��A&C�룵e��Y�S�ԃ<%J�i�VVӈIUf�קc,�1v%���4,h�u�*=Q	 mso=��5��?��7EX���h ݕ���^{�}Nt���#�����3��7��u��1��:p�#����i�xJW>f���rkzz��M��wJ���?f�c�3��v�����Y��]v\��P��n�&Y[�^_U�����(rc�h�������^�z������y�ף�U�Rr�r{��g��1����n�0.�0��a��f��)�
�p��x��q��`'�9����@��{��-������������؃)����o��t3l��MqO���,����Ee� ���6�3E��& 7���6ǔ������������o������MשC ����sO�K��a�{lˈ���0ßp"~3gv�吔�N.H�TF��ډF��ݸi��x���H���c�Uw�Za��6��e'�0�㛔�H�#����䁹k'���M�������צ7Ȗ�*�Ne>KS����覎�������Hx���Ex	���k�]A �g����PF�#�~S3�3��"Ts�q��V7�@�	����c���j#��;3Ӵ�N	��Sf��>]Pm�~�ï
���7B��@j۳HM��^�<�L3���L��;��0��M��
��nF����{[n$5�"��\k.���D�a>��\drE�űJ�͹��č��te^6��\��|r���'�cي�\�ס���:�&����Y�4��Fy�O�zf-^3�2�[�\�}ƚ�U�O�K��!� JӪ�	��<i�8�X񜘼�p���kF�Ӏ�U,\	�c ��:pKhz9�5#�����/m�oN��ZO��R�f}���[�u�)��Y ~��	�E����
۞��cH�k`��>�s����0�A��7��x,�K��}��s��g��c�ش^��EG
s�|5k���8Sq��T�łx�����ʏ�cnj�YHZq�Z4꩟��`ٵ���G���:c�8�u�_ܘ�;�T���c4�M,�O<���o����fz��q� 'z��`ţ2ڰ��>��D8�N ��|����`�Z �R��Q��suARx}��y#@�)�Qt�I�@�a�xT5`M� J���W�2%�VT�7�|t�Pײ���2����1�����e�G���)*	X��-mI�u׽�j[���v�a��"V���w�{Ax�����QZ�UHx�e�@�"���V��_���s�n�.�k�
�n���K�GU�ƿF@]�@�YY8
_� z�מ��m�?�a(�8�f��#Ҵ���C�����%(V_�K���3�������u��kEW
���Y*����`�z��(��F��a��3�����<q�!�k���_/@��X��7J&����,��Z/R��쭵Sg}}f�st�R����K���"�D��*aC<�G�v����#2g�z��7kI���g�W�s�be �:׆G��k�0�'��*���C%[7��Y��D���+p���P�nl-��ō	��f���]+	MJj�����د��s��g�z��ݩ��sv�\-wgd��QX8-^���/Əҍw�\Z���LS�Z;���߮�Ux��?��p#JSsi��s9�ǡʴ����}�>m+ٺ��ojf�&|ٜ񻩆�+BR�U��\�9��&:�����z5-��	�2�#J�C�h])x���{�0L����
Hײ�SH��.�9�Ij�L���*��4ԛ�Ա�#�.%��a	�;Xqǉ�������T丨�00�ށ�ō���#Ζz�0��#ha�ϣ�~%E�����l+P*��=�7h�V�S�Xu��f�4<NE�7&�Q�j�"��w�>��E�)n��g\�^��fEd��²��a�k�zџ�K.E��t3�쎋���;�ᗄ�+�t8@��!�z#��L*�����ƴ��^'�2Զ��}�~5rH��1�7�*Zs+��v)B���S���jJ����ҙJ8&�H�hT��y�����+b��f�A��+�(�dz���9O+=�T1't����?�0�a�z�%���g
]��
��S^C�@�Bįi�\Z�0���Ư��rԲ(�Zv�N:I�m��M������-Ӎ�c|}O=Go�>�a'����������2A�6i����d�,��J��mx�2��*��)Y�R��F�g螞Yg������3�o�e]��x�y*׬�^<�aN��޷f"J�R��1M��O0}�)�)����c��5�sʐcf��\u���}F>@77�y�Ksv��H�c��6��� �)��Xl��XK:�lW2Q<��Vl���w\��eui��x?����LB��%�Yn�ٳ��\u�]�<(7hW�
�6
TR�U�E�N9�J��n��X���Lq�5^Q�	�G�G�)q�H�����`�f\S�7:h3���TA���z���I�4__�������l�����\v5+��s=رӝ�    y}f��!5@�M]�Ϙc�\����Tz�ۂ�:�>]��{d�p���M��U��n�g�D�}`ٽ�����X�?���Fw�VS�h�nR)ѭЦ��(��+�)qx׋,ܮAyI��L��7'۸)��cI�� 7yۥ���w?�w�����(���`j�������oW�`�WdkX�w�2r�JǬ;Жׇ���<�.r*g�v���#������&{Έ� ��S��vTػ���1=YbТ���F���^m[�@���0��5h!�H�	��ԧ���{������0m��Mg�6>c-(��ҙ�{mH1$$o���ù���FH yZ��ybJ��_�R�WD�1^�[�=�RC�W;ֽ3�J�Ns��x�˙"�F{㥧>jP߫�V�d��2�qwܘ����ލ  ����eVv 3]�@���,je�/�j��T�m����)�?�Kh�;��A^��J��Y:�UЬ�
�/�~-E������F	���F+��@�z����㻯�`W+�w e���\�SW
E�������`�,�YG�f��ϾƍFN�X��O�AA�@P��1�v��	Z��$Ha��M�f��GՈ�?�0��ۍ:u [���x�9,�B�V (~�;7�	�i��ܰ>'��G?c��ܾ���O�g�=ZK͑��I�7btDI7�u�0�������]�{u���a�z�z|��`нL���cvN8��d�5ǷG�0FT��z3X3$�u��J�r��{�[s��0�7���Mtv�ٌ���w��;������YKY�se�wOR�;�$R��"�@K$�	�x�������x���kƿc��T9%�v-�;���RiH����gk}����1dswj\���s��� ܋��ڨL�.��W�|��?ծ
��Ʒ�-���B�d�!hl��"�'�~��ͰՉ�#M-�{֍8�8�*�����n	�/���^\�����5Ϙ+���Y(���-��;�;����G��,�q4S�Y�+� 4*�/�`���Q·h���PV��Gْ�V���eh�`\xS?�ލ��0${o���5q��1�+(G�v��ϙbH��w��/��ǽݬ�z���вՃ;�S�X{��H����{c��j����ާ	��3��ZOv�D*�*�������E��o���\.oa��-��lg����r��/�	T������.->Gj�c-=�H��*mK�p"\�����)�g�u�S�,$�>í�!��0S��L.�eKf;)K;3p:��1�,�����2t�aR��"_�S�f�y��-TF��6�,�SDx��x=;�G�/���A[讛�I-:^qm���0[D�Lo_��&c��F��M�&�����p ]�C�m�w~�?J���sC�ꪤ�)��*C���k�h� �c~p��4�K�~Z�.� GPE�
�1]���톡_U>5<��t���A���F��Tz �B:0�}�\��1�U��lˤa��b
�B%q�r`~[��F��$?��h  ��0�ε�����AG�
�[yJmΦw��� |�ܴ�t�˶�R[��k*qI$N5j�/���ۗ�ct�7AIw8%;�8������礼��\�noyC�@���*�s@Ӭ�!EP
�ƙԹ6�wO�>�a�8r�э�[IW|�<]���
qcpI��t����9��JpM�[��NF��R�z�U#^#��ݔy*���2�NE���|�W�q�.�vЃYy�|�Ɨa����MM��������)F�Yd��:���Qa�]��7K��~,������k��{\! ��Ǣ��C�I�P��Nܘ�W��e�lx��P�Ƽ\i�1̣]��7�?��ړ�Y�D /C�r�����)������L4��9̈J(�P��7~�������S}p��H0���N��G5ޓ/�R�Z��M^>5�F�_5]�������-��Vf���]1H���D_3�z�8��� />���2�����P�?q��X��,��\���!M'�"KR�/'�ݹ�˭�q���	˶ʜ������:�%`�Lk�nA(�q�Z-�C�j�7�j"����Y�6
z ��s��;�ʯ�v[6�GܑY��k'"0<4q�'����Q��~���0)�gMoz�d�
D�e�l^�����g���pc0{گ2Q�a0+�)
�[�^�YN�B�Z��^l��F7r��m_^��YR:n):�07����A���n�{��8�=�YNDk�2gp��^m�0��&p����Z� �5K��m�k��9������GC7���>�U��u��&�e�畁lgx�aڃ��Ͷl�6�X�z֮�S\�.�Eg�ü_��Z����F�E])�N��r�S��� �uP~����2��V��9^Hr^|JP�8 �.����7��vD�=$��i����e&}r����ّ�0ƃY�p��NGi���T�ed�Ǆu������t[�[�*��[������&!����zY�Ɂ�������W�xJ��ō	S��Ң�\�g�f���|E(<�x���,�����Ț�J9B�@r�C��w�+7k���׳lԪ��M�Y&�2�˚�py��֚k"��ҳ/�a����ÿ�\r�1#�
�x�x��g������w7��z���H�qc,���D�#S��q��b��&7AI��������bcZ �1Y^O!���I�&(El�#�u�B(��6��]�(b�� �0��M�K�ldVhf^3�Tc�SZM��,��ofx�*:��4.<4�<�:OSf�]����Z���JPAD%�bJ�z�>��lo���,*��g��xh?�.��^�"Z��F)
��2� خ+�o���D�~�,C��S��FY��@�'�.<�<Gd{�ɩ��^_:	�p�^r�q1mW�����H�c�g� ��ǂ�[���_������/������e��5Q B��A@�?:-b�%P��Zn������`y�1�<��o����rQO3"��<K`z �Us�(	4VaUq\qE��8����G����=������T���&�*�b��s�����i�����d�^\���q
�rt!T�2�RW����*�U�B��� d{�)K9���=^��"X��z}���2~��0_d��
��'0Y��d�WmM���� ���=�v��v�wpz�L��T��)�gaL|�w/��2�ǥ���g�� Gˁ��ҳ�baAP�2�S�[��7��'�s�^�w���eX�מu�]Hx��߽���0�6Ѓ��D��4c��G�(�:���젎����/�P+��\j�Rg�Nd��ƕi�/#¿�0�(r_g�9S���=<<8;�EM�H�S�Ư�m��Y('7��g/�iڨG|�l!���٘zS��f�^@�{�K���v�H�_�;c��arCS|��䈴�s���Q��]<X[x�-0��]k��0���i�`�� [��|���3Zm6�����7���k�h��O�薺1(rZ��g�~"c}@α�����\f������R��֤?j|h�����0X?-n��v�տg����qc4�)w�,�&��[U~3L�@��v�|��ƕ��*+�R���\�{8��#4M=M��#�:��o�1�d� ��U=q�Ieh������P�I>k�+@�jX��A�Y��攗�gs	"��^XD��ZH>�����4pd�����2�v�"�8|���/�pM��L�蚩Ps��):�K�5E�:̸/�.�a0����a#����H{�vEXnN"���cN}D��6�^�V��-/L�7�W�1���y���߽���.����͔��(v��S7(��Q��F�~�a�ٸ3~x���l�t�³P����1L��6�/�R1� 7٦ں@�ŵqc n� G=���f�?�0\?LV�����,:,�41NQ�Q� D�e�O0L��.���ш���m�l7��Z/[mخ���	m|��������L)�l��Z(��*	��{m�o�����!O�>�K'�lîed��l������a��=�w1�Sf�Y怲r�w    ����FP2ڵ[���C� קp�����>:N���ㇹJeJX硢h����a���7�z
�JX���vPH����N��P�7�:3�k�X�a-�)5��S�^�4'껗��R^����6��Gٙ���ܭ���`5.�ot+�_[QÅۖLfe[�On��(�=,���3Q�o���o������{�h��_�h��z�qw��5&��+�vn8s�]���A��߳��i�>�籅�=����PS"��Y�
��w��y�?���}�M��P�F�u^V����OpBa�p�|\�ͷ��������/���xÂ��ȥ�����)g������X��M�m�uvo�:���K	VG+����{��o���l{�|�2ߌ_Lo���Z�\�Z�˦a"���;.��1��$�zS����E�wi=%v�+���׿�m��N��y �FU���%�7u�:q� ,]��kUZg�8�%��T���`�?��v,B�ɩ�i�p�	�5s{�.3X���Y��7@�woS\½0H+M{X�B��F��
�������������7�������A��Я����-��6.}�n��Q�W|�BV�Z��Ga��2���-���MMǚ�����������U��M�S�M)x�z�Y�7�Ѱ��gq�)�f{���mQ��n�9|��@;k�n"���\HI���
~�k���"(�� �$�-7'��[駮���#����x+�Y�D�@U����)ѷ��'�N��A 
|��H���-܄չ�VQ)�j��:��|��D08�oV�#U���$79�M��q-��OP��Y�k�̫οo�oV�j�W�dө�Ys��f�׊� �{C�����/��/���n��{<�3��'���ܽK�e9�$���!~��
����VK���s�=3>R�A=�IdXx���4����TuĄ�J�W��Z��0�.tP�"̊��W�҄u;]��
,��M��ߕ~�<���0T\͏�GU�N�9o/准g�D�(&����Ku�^���J�'B�N�%����i�	�ǭ�P���3�������0�4��X~Oyϵ�9*��<Ȏ�Q���7O.�Ƽ�/']�N�t�H��P�fK�g$1�Kk����q��e=9I��N�4�1����;�����پ���r������n��4�9a�
�KdiM)1>�f��_� >%�I?A8���^�M�'�9y�^��X������c-='���Co #a�c���\��b�����	9֮OE����$������x;���7��-��6E8b�r�*�2���C�0�7�G��m��<���GH���!�<���ϸfV�!��@�ƫ�'~�w<��;Ӛ�Q�'��VSC�$��f��7�]��0�-�LtJ"�hЭ�ܽ=�Ԑ�j,{�<�����qj[��#����hGׇīv�p;�^��7����E������ �im�a+����+F��ĩv���pg}B�O��Ò=�,�#i�Zi3M04�%��1~��j��U20�JȁQ__�������6����&�w���?�{�:����H֖S������;�. &���b>{]�g2p����]՜�v�;���l!LAZ���\jjo�]Iu��F�]u��u}��-����8E�	3�A���Ša(�A/'�6n��%��*'�
����a�]�˒[+AQ��|Mp���o`��\Oϲ����`[C1Y)�8����:'���q��'E=Q2х�P�Hz�>��/�9�B}�����cO�����wzI3���B������6���C�Q";�8=���a��]k��
W��	���az��D�,u$-n^QB���B�j[���q�q�'���л�HZgt׸|ЕJ�E�(�u}i�?Ğ���D���x�E�P����� J��c���o��G?��˘1'����'@�3E-y�Je��0��x����AEw�3�^)n�@�i�6�i��}���������%�fW_���;��NV�����˘/;��b��YE��\�.?��|^X��V��N^A�^/r���/6���l��y��c*e��w�?=������_������%��'����k1�f�V�����.ȹ�&�d��1�� ��C�ؚ���m>�MjsY��W::�����;�urN/5���RG�_�����_��C9�F�}�V���{Lz;�W4��U<��?�
_��'~�-�j*�h=S��D���F{0���˗�����-&�O��{�Щ�4�PH"L�T4�9~��*�z�~��O|�j�O�4��V��zq�&�U�̹�ռ;�)Q�HV:���M��s�W8u�-�d�Y�ݏ�` ���;2�3%�d;Lk�	y6,���'����'0���B'~kY3;H�fBG�9&�%Q[���`����onc����`�j���#{K;�x_/9y2Yi[��y]}���W��᤯�9�dO�}Z�UI�� -Y�\a6-��+�#v(��F��gB��~Zj�T_����W��� �\)���iDo0G�V�)�<����������'�Xv	5���We�'�i���U�.�!��1��`�l��'��Um*��m%"��r��?N�_ �����@T$/�b��Z(2�ԛ��g.��w������L�BfB8ai ^�vN��GE���ի��-OA�yG�A�w��� ?8�׋l��ћemE�tN^���2����0R���U�VF1h�gE���3D�꣬�[�R��;鯙E
�Ԫ�n%5V�����р��~�OQ:��m���K��w�k{F���n���u��+A}�_(��a��&��~*1f̃j<�HZNnw����l.���IOf�8�%N�1��H�^�*K	�0LW/�)�R��)~t9&�Ւ���fc����ǃ��SGr�Z�Ǆ�EgJV[O�l�j�W?����P�;1�hJ»&j!H�<q��文�^��`�;8�'���� �;�� �1���n��[��\����J��[�&�鐝:��o3�d�֐���k]_'֐7�b�Dha�E�B�1$�yJ�F�텗�}�͂cV��؋���h�.-�5Q\,P�--yy����a͡�v�n�w��/��\VRٰ��8��z���א�X���$g1�� ���\�[� y�|}N�xL��NxoӺ�����k���9yʇ9:pū�a?� >�5�Im=�/����������݉������T��T�x":�4�J��1ۏ��qM5Sǽ�h��M�~�9��c�����q�o��s0:<)���K�w'��'�zN�D���K�T}U���v�i��r��Q�/w��Y;>��N��'�^Z��1~dZ����<��e��|~�A��z8�e3/
�.��?���pz;�9`���y�f<��7�{�;���@�Զn'�}�N���� �8a�sr�b&eN.B,�v�+��X�;k�v���L���F��Xǀ�
���ZSHby�Pr����{���Z�>R������y~����4�� ?(x�ԫe���Lo�xe�i7�1�e����Lȯ���`���Ҩ�]v����{�^!��Ln���Lt� ��G������`���W��k�����wy������^i�%��1�,`�8�s����:�?��0��Ģ������t�Ua̹$�S�.D�t}��?��b'Ҵ���6�&�ƴc�8^�L��
,��ݰ��
�ȑ~׬��%��?J]Rm�$�9�B`��~3� S���'��iC�y90�r��4m�n�2�m�����i�.���Α���!�N��
Z[��v���y�����j۰�"]?E�{n+��B�h�_Z/F�)��N^YKm}�v'����W�/Ƴ2����׃؈���d�0��?�fTQ�>)aky����1�:@9';q���T�L��hjjs��Z=.��z���隝��!(�	_���5�.H�W�Ž�z}���*���a5�=�K��c�RK$����{����%���;f�J�x��Z�&fh�e    Fdq����w��Փw ��%b��9o���!|@yl�{�9�/")���	�"o]�7�����\5�ٚ�ݪ��p�'B�z4���0К���-��4y��р��?�)��T����(H��6��v�£l�Z�'0aL�g�1K��-�xgm��:�[3���~� ��Ɇ�Z3[��N�"�XL�޷:dk�-�y���TR�Z��`�J*1�א�q�]�����')��y�I�������d����$ȸg.d�\�F�?�yo����sO�:����v8���c��(�!'}y�t��٬Eں[��^�$OAӼbt��nm�M-������$�tG&v�fݷC�핫�P�����ًC���Z1�����!������s�V����y�U�(w�����p>�?넫����Q�R�=��0T�R���$��BC N�~j]��54��5 ?�2=J|������ ����,�aJK�$�d�: 9y���mےoF�U0>��&#{^)a�;��V��FEس�����Qj>�4��ȗ;V����{�����\�n���P����
���nyQH)r�i9��\�����L/0��H��{De�Tzx�����CN�	r�|��F£C�dT>/��16q�h��G���*E=��I� ��@���U(KO Q;5v�"�&і1��##ǥ��%p@�W�m��Ge�R�u�Ce/�r��e SCq���?�;+�Q[h���Aξ'*�&Q��"�����C*|$�ӳz�WX�#��}Ô&�؝�_� �F��r�c6��3�-�(��!�C ۋ�����'�続O4)E�vd	]�*~�z���ȶ��s��̷�ɝ��v���=�=l-Hm?I�T�	�r�x݋��|��ɝ[��I�NmqE#�gM��Sa��w�?����� /�^9�HJ�=؈��e��[��z}1T_��jp��Wfβ|UQ-FR
�X�I�{��L��g��ǊG���E}�ԙ6�¸��f1�;��}K����
'^?{��M�r���\��h�.�p:�חϯL �*'���J�t����G�4J2|Ϭ�/�1� S�b�'O˾�ަo�-��C}o5O�k�B��W�|���z�{[�o��:�aS��Ӷc��G�����M�a3��?����;��̖G�q{�{�U��%>��#��d"s��is�_�8|o���H/y�Ŷ=������H y�: °=D5zM�Ip����\�A|��h��3���f(�R�i��w�s\��j��`zr��9��'�i�.!!�^9���!',|U+���@�G��B$mD�ۘaCh�ٜێe�$�G��/ދ�/@N�æ�!;V[���g��^(�\��34�7��j$pz�������
�O4��l��cj���-�r�J'�h�9Z�:��C�9&����<� ��������c��F�d��B�61-K}��kP�5�oP3<��ő����͑ؾc����f.{8K��6D��QÚ�a1����c*t��q'��� �{�|BߨT�Rb��-�=��9UK����;O}�^��)�����W#5��;	uU���r����hh0�H��U��х���F�6�4(2�AFz�؉�U�*%q;�w�g�K����hXr�%N�љxS��l��@Y�� ��W���I�$J5�^ ���S�&^<H�:Ԛ��c�_���XZ��P���+7�P]|���u�2���|B����q��b�Q�ggu��z����>U
�A���^��ubL�6���c����[��pj���A��f��LԻ�C�k��S�?j^>����IF0�)'t��y�3R�ݓ����i������Ҙ�S=�ՉF��@�:Y�<�̙4�	�ˠ�[5��tВ�4���@�4��.��e�1c�Ē��8��eOI�Z�
hl&�����o�bU%���ź`�I��P�'jFh֘5����]�5����䋃�/` ���HJ��9	C��U�Q�����k��mW����׺Y��v|��'�*���u�D%�.��d�ˡE۠iW������:��Ymp-_�#���$�ɞ�!�v���/`0$��I?æm��v1��ɧ�W����m��j�7.�8*xT&6i�{R^�93�&i��i�'��b��⇄��qo��?Ds���c桑o��[��,|��/`�R�����9:z�r%�����9�������m�~�¨����/��p����1'��uy~�ˍ��L�\���r҃P�H�#�q����z�5�Uũʸ�)�0�)�I��i����A�z�6'h-$�+�M�_��n��H�j'�pV�l;�����N��<���'��͂�����K�k�J��1=x��'WH��SS������:`�;�kO$'��k(�9�W�w�q�Tr��
��p5D� ���*�|�/�B!z{쵦iA_y�K�C�h.t���=#���;�Vm�k�6�T���oF����&ܳy0I��5Qk�g�r4�z���y��'�����oXGM��W%h�I���Ԯ۾0������P^Q)�IR>���Z����i�Z�y���Ņ6���do�6ӞlԐ�(9<}U��^��<����9���͚�y�I���:7���������;���<Ҍ[ݸ�*��)p=)�'j�c��1��:�\��+j�%�Y�83c�,ǅ�x9��ڿ0��|�������="S{��SU�$�M�RF���5�ţ�'bO���n#'�$��(,�w�^s��6/�Px���^�ɘY�8}��Y����x��s��'��}t��	'^/�OJ�e�)+a�x9[%����gR�l�������{�p��Ԇ����w��C��'�m�^���;�1���6�����ѹt�Y:��\S/����w1^\C	;���9)g���B�$KnL^)y� ����]>��8I�D"���]�S}U�	�bx���������p a<�w`۩-��]�z�M��Ox��.��_����r���0:�1'^0��_����"����_zV>y#Pb�&��m�����J �ꛯ四���#s"�<*��Ւc����@5c���m�}^*	�4^*(�3-���$��F8�1�(z:��pH��ɰ�[}-i��ha�T�V"���O��EBg�'�#W.�R�p���h���/��;u?�P���#{Mm�s4�k�>KK���i������DaC��� )aD�}��C��K�����-���&tJ��r�[6Rh
8�����њ�ى�]_8.,�� I�#�襄^;����\�4�����W�1���z'�{�丽�^<�4,ѓ��e*m)7Y���Ό=j�V���F1�#�z��X��8�,H��7�'񥷵�3�Teń�Z���vXذ�x���E�)\�ٗ�3���n{�d/��Ę���pP�(rpE�w�9]r�y+�V�S�%���i�zn�HV��pЩ���,ZS���5"��$�X_�������d5�&O��vX�Y2W����5���2Y�u�~`��
GF�{K-��;u��L����Q������$?�
�_"C|U��Y/M'���jY_E����8�'��Z�o@C���cU+Zdf�d����%p�T�/`�r�'}�e�"��IIBB��$v3��7�Ӕ�ӄ�z�߫�\Q-�����v3�G-׿�H��x�t�MR����� ���~�żW��c�D=  �H����%����k2�-Z�\g�_۠���)ޥ�~��9-M	i�]!٪ã����Դ�>�E%F�s��D��t��[�:%��L��С b�ׇ��v��I��Z��!��B�B�j򪺖���c��ϘO��z�q��1H�m��Ap[�cO��׿��PJ/�O�Ȋy94�.w
���%DoZ�q}�X"#;���`�uО��sox)r���E�=Q�}��ᇍ��WEelC��&�с(�&-F�/^D�_����t"��M[i��}AN���E�%2�Ӊ��7.���9    �8��^��l������%�c�9�S�qv�t���҅���b��Ƌ��<��N`�"6������&F�\��Cb��l�41�jaF�r�	h���~X�/VN����NMjL���P����Zz��38����g��]�	���^nb]k_8�^������? ��1��@,�u��R1
la�c������o�_�
�0x	wXg��}�՝�; ��'!բk]��G�a�gS��}�g�IGL;��:Կ�![�ˁY������b:�M���c��K���H���6�Wm��K��{�A'SuW'gK��v���C���F�n{�I,���� ��Ȗn)�{O���x�V�����S��r�~��?�}u'�sꄡ�(�j��G��iM�Ux`Y�7��~�7�$kv*�yZZ%��J���<RH_E���R90?^^��9��H�G
��_Q�&�wl%�_>���p�vj��8%��SiIc�)��V.���=�s���^��~�< ��8�*�֛����诵���#U��	�z{<À���d�vZT�/e�v�l�{XIOh(��3���c/�ڊ6�˂t��}X/0��Q� �ڨ��������?�:�S����_y}�0�����D�-A����ÈE��x���!^�~��T��O�N<��Uؖ�zå@�&-Q3j���/������z������gg��]�e9��Ǆ���廛`_`�n=��(��,�������B����5=�p5�w.�Ⱦvz*!��كWz]B�kk���d�|���cm[��}�=Q�4�N�G��XWk�kw`x�����B�
�Q���t`�bz"j��b�� �X�,L͜�l �\6�˕v^`�����HG)�kK�<��}��J�T匽	|`v�",���E`����{�R��W@����F+����c��妟1�6�&�A�Ų���y� N�/t�F���ᆡ���6�[ux�[��L}��0Rq��!��!��tEJ݋&2���Џ�^?+��H�VJ�=�Q�;���N~���|?0�2�����S�P��p�R�9����6�)�=|�C�pפ`B�T�����J�L�I@��1��}#0�	��ÿ�n=-&	Gb�Yl᝭��<ov|��S�z��,����,����Z�ek��?E��x-}=���1�+����e�a�wq����5`��ڴ�x�����C��dJ�yL^�.�%���ީXe�]F�K��u��SǾ��d �Y
��+�ƻ%S��;b1�s?0 {K9�ޜk:�ᚔ�
Ys`<[Ͼ����0�h��O�y;[!J��#ƈ=���Ye�����`�9ul��q�khʩx>�.Y'��=]���W������h5�h��^fNd�0?<Wj=U�-3)�5��Q
�6P=��u�kr�T�6:�ȑ�A�5��G����$]�z���w�o��-$l���k7d[��d%��(�<p��5�j�s`�g�Wo�]O�qc��\S�=��[��A�3�޼���F{y��^\�$'���=�'�;�x�uP1�ƃB�*vɘԪ���G��/�$��|������{�9�[��hC�r8��w���k[A�U/��1���Қ��ö"�xu���;��xʡp��:�8��g�*�-5�J����bŻi��B��d\���h�=�9��$U˾\�c����^&�9��!n�J�g���C"z0l^��h��y^�����v"V��蚊�E�����B�y-�t��UʃZ2�+�k#!�Ig�ޞ�B�ٮpwg��&/���P����A�����	k�'{8�f��������b�12{��OCb�v�6��qg+���ֲ/0Ѷ�!�:��7�}@��=�f	�e���
��?&���I��2<�z��QN�{@D�!ޓ,�)����c�	���x�)UwXwgg#я}�j�����+���6x�د���֩�l�l��o]wO���<U�I)�\�����u�ω�n�����|���1 ���Z���<��@Ͼ}�7_P{�o]��K�<q��:��D����xi���q}�V��OT^���y2��	�`�-a�C`i{z�}b�y��OD7�TO�� ��R�	�.HU�E�n��]y!�-�r�ܥǘP�#�ZH�p�_U�X����
�艸�u��w�jt�弓M1������9	¿P���Zar-#+�٣H�bɪ3[���Rey�t?0,�E�Ar���j^3#x�ȫy�����!��7 F�Ր9y��D%z�4��;%z��]���?��\
�>V��
T��
Ԓ�=d#Jj�WZ��� �:��J���[VN/g�EUp�U���cKIZH{)*+� ��h/|r�rC�<}Ǆ(�$/�C6r�1,����Ч
�_/�X���$sV-��@%;Ж�&���p_`�<��4��nz��w����hy��p�.�\n��C�zRĳP֦��0�۾s�������b�~�D�ɝ���%܅�S^�e�1W�1�&�7����G����d��4_��>|��JiXE���_j��O̷�AJ��E-[�ڄBo�\����������h��%�H'�4��E�J�� W���je�b�>WS��*�L�e�|i��^A6�%z9�T_���@��(ԓ{�:�f_P�h�X��W�H}j�pa��`��rX���%L�@�E]��)07G�Ϳ���������������1���0��@�`�W��\F<�Y�N�[m���� �U@/WNY��y~驴�{�/�������iM�hpXK��3u��t�Z���ʾ�N�����_��J~N:�`z���l��=�9=�q��4Ķe���@�(�bf{j�#!�z���{1�0X~�O�fn��Í�``�c���zʴ�B+ܣ�Ǥ�s)���㖘P�W�^�����js�4�^��:�*�I~���i���A�ԓ��	kh�!	�am���5���0��ۨ�w�� �ƚx}8�D��w��(�R��dJj�xR�����A��DŲL[���B�m_�ȼ l�f���c���)j|�1���,-��B�S�[�^�1߲~"P3��}�*ƾlE�s)��M#��y��c���`�g��f>Q��F텤ą�~�u�a�W�k�;j�G@O����bؓ������cA&��wT���$�k�M�ɭ������Dχ���\�y�<J)A��"�C��Ig�hy	�Fxܰ�Ȍ���������1���U ���b�.���ЋH���&R.k7�� �;�D�����JN�����͙���s�����!��#�`r����<L^(��͊׍5��e*s��������L'R�^y�V�5��ّJ2b�s��h��2�+Ep��!�mN�"Y��oKPC��wR�b�[-��v�����P��f���H�sbt��f:'K��*|���O.��ܷf���e�bN.~�Τ�l�AFw{o~��B�Zœ��l���B۬.M����K��խ?�Q������=��hb���7'S�Ӊ�9�P���W�����E�vԁT;f����J%KM<��9=̆�ฺ?��ia�%���R
�xG��H4��TxeFm����l���T��+�<b�'�*Cdi��[Q����F�t����$�aW�7��|[�c�zrs?�rƍ��˂>��� '�����] `��pD=j�6<���h3z<gZm���̫;�~S�����7��i�dͯ�:�_"	�꘵gmW�G|�~��|����h�X�BKRH�����0�������^�������uE�+�ݜg���vd��Փ?�)�"���m���J�c<��>�����C��/��_���h��ʉb�Sщ�)��aVC�o{�+8��;l
�O%�p�3[�lҚ{���ț���@h����7 �F��;�Y�����M�3X�1��ҕ��5���5�m0{�r�T6��T����8
�/�(��ԁ�{�<��%�}��
=�,�    ���un15�S��.���T6���khɲ����ǖ
[d'��7�7���&�%���qu���'Ǽ߉��h�^�!����u]Rt3�"y��/�jȴ�|b,"�3V��>�W���#f��vg� #�Ѫ|�>t�E�iA�Fצ��i�h�ж��5�~�atJ'���-�1!�kh�y.6����iW�0�i|�b�ӷ��ߒ��LOK�ٗ�8պ�!�z��xVB���:��3���q'[��S[GP������*�6HR�r�M��S'K9��������a�$�<�#���d�^�)����{y��ia���;�5m/z$�*�����]���Z/�����*�ClwwN:y9�߾���3^M�������zށ�1��x6ߑ�w�9�u2���X~��b���;�j؏��1r\C�,/��/nD�{������%̉�^�ˈF�}�C�h��2QIn����~6g+')hdř��88��	��M<[O��O>� ?�V81e�m��@�/�1��bʫAh�[�v{�W=�J�u��[c�;:/$�x
�ޞ��S���W^�H+�h�V�yKvSFb��	�������jh\�*�}J!�`����JJ��ھ*���n<X�nπ0L����T��$�L�1�a�kuJ	W���x�E�B`<[8)��S�&�Cǭ�ڢ}EF]�bk�j� ��д8K4��vTکm�����8��E��r�Ղ����Wu�W.��6�{ʞ9:H��e��s.����jU�0X:�q�zIg�;f����w�f�o���I��Xv��^��E~H"V���ȓ���:Z���a<�ƃ��Sk�N`��Trtl��J%y��䟿����#lv2ޛMG��C��;���(yɕ��Y�s����v?- �ĵ�� q+�l�ECO��h�W�׳�W�.�B9�p�=��)����� f�<f-�J׿�0�d�����=\�iiZ����ޚ#���.r�U�Cq�}T&�1ri�I������m��73�~���p�����g�%Y�&�+̲z�&���fA�6�>$�X�';�0�Z�{���xN��v��Tj]�_�axvBe>чϊ�݃�Z�s�/$����h~���z���1E!�dOXN[w�W��{�31�--��ןt6n�o���G��+�$ +�7B
S5A߶f�^��u�+l��Ӕ���E(���οS��ѓ
������	�>R���X�:���lQI\�� �sSkGp�r?.�O��z⡽����O$:n�\!iEQ������0>�*'^
���%�j�P����㼱s������"D'}O�(kufm.,^w+5�]qg�q���S�-p�տ
�Mu�"��jK�-�h��n��O�`$���pbK�(M��(��V́4-nl���K����8�=c1\��^1;��KvS��|Ǩ���NO�LXO&VsY��	�A��׈�UZ*4p(L����P=2�J��}� ��|#��jI� eT�X�����#F>y1��Zm�Ҫ�<[���s<%*��B�>[�;��UO��n�s�Z�<�B/��s��O����~�~T���~�ʹ�4�EqF�$��lQN�մJ���1�o�\��F���� s=��;3��Ç�cl����0��MR:l�*L�e����֠𖕶�j�zi4͡c��0���	��n6OtBf%Ú<�SKPgjNN�F[�J[}�}��?fŬG,߼⁢�	}�5rnb@Xx.�����M^`P�J'=������īA��q�@3����9�����#(p��g�m�t^?"�H�R�Z��1㦻;_`�z]H����iIݣ�d��|U��l�%1��Z�~
�w��[�N�W�Y{�٩=k��{	��"�&N5���gl']�uH۾�=���T�^�r� 0���^`0?E���;Qa�޽J�:�^F���$�J�,w��~��Ĥ�	0@��}�X����^N�A�|���<Y��IL���o��u���UIeJSDT����Eŋ�*'M�G�!��z�0�<��^�d�y�Ƨ�#? �*'R�!�*������9��*�$k�)�S�?Ga���S�e�9+�������=��7[�S^&;�WV䙀O�W��C�R$�})ԯ���?c���]��L�(�l�]tT����5�����%�6k���G���z%��U�o���w�Z�6�^i�N����x|�k���B�'�q�<w��mw�C�c��ӎYx�����>!_
�b�Dqӆ�KA�KX+�H�+�Y���C���������G-'�<���cR���x(��r�A��5�Ev�{R�b�¯U�ă�R�jTIX����*��`�8˿����,';�6g�d!�,aN(ɐ�QîЗ��d�R`��U<��5+
k��Ѝ��������-e��gb��F?k����G�{�R�˖Pտop���΋<Ɩv���q�pp=x�Z���VM���	s�2�{{F��j��f�������|-�Qc�t�,\�e���OO��w�����ҊY��
���ܵH��3�N�e����%_ށ�#䉇��(|CެӠ�r���ąl��u�b������Ju�*���<qIN����E�EN�B��,���0�����!-F��J�QªW�D5٪Y��:�?�/��c��������؆C=T�׀�C��=��ʐ���I/0 ok�I
���Σ�etwI��RW�<�~���D�1��YE�H����Z�iԃs��]�k�o LyJ�}ŵ&��K
"���(2Úb������/.X��19'j��-��+���2�`�:yo�o�w�|���ݶ��b�}��9��>�C�S&9۽������	�ƪ�D�N����TF-Shv�\�~�Ya>��E��"%�6��`�|�w��	����߀�J}��� ����9�C�8d��b�,ލ�zqq[��:��L<�n\	��1e5�����ǻ;S^`�>�'St�R��|��b�1)~��(wtv��~8~�!�џrt��
:��g��=�ZI�p���'9^`D�����	�کA���c�nwm��O�/ꞔ�dĥ��N_F���3�n�1����"���~`�4(�^��iIr�[�(�`Sqe笷�j��l|˦�1+M�s���t�=-n��t���C���_������r��9���>�����'�5BD�yp�5y� ���rwGz�ߜ޲��?��p��))��j���W6mz �ܟ��=L|ҕ�ѣ������NT�*V�kL��^�OE<�!�vp�⩪�����w�o�_I�(��r}=�1�B*hj,�ͧQB#"�@kw`�m4�t�?0����K:��`���D�HOM�%�5��Ϳܭ*�C��r6V�BۋKJ;�s��EI�*��Q�r��0��9��S�N�iX���J}�����ܲ./��&,���ƌP�zyK���zQ_U�x�i�� +	<�Hzc:�1bl;���z@K��)sg2jv�������ʮ�1&�OxJ5;��!��e��-`K?Gw�"�<��E�❵%���7��e+x���6�y��r2�ˍF�XSiķs��$/צ��������4E1�X�����j�`k4PJ�@N�{b��r�ȏ�0>���uO�5ю��2fj�U/����(BQ�e��S���JH4P�ž*�d\�<��W�ѧ�����r��t�)�@���.l��),�~�Bq�_�h��гJ!����PM�Yp�Y��*�B	���D;<D�G4���╺�H{
��J��6��ђp�jL�����
�d�7L�2�Ts�?��|�|��H�a�����	D!��+��F�\L� �ryT��x>z�fMP�@�dR0m�(Mr���2>��þ�O��v(�m��}�d�R�T&i��8����'^��E�� �L�5z��ʉ�;��{�~�(RO^ׇW~�)�
dǣ�E�c�N��v.�[�lN�4`�>&�'�r�ZZ��%��K��ğ
0/��>4r�	=��1j��9��쾜�/�,/=�u��8w_�'W�'�p7�8J�٬�*�N<'���x�;_�mE�t    7�������5m�b�J4Fr}A��ۜ��0< O$l6,DO�5.\b����";���.��Dbܿ���D��3G4p�^bvթ]��Q��1�Ɗ�ГWV��g绀#zrC-�k�$k���l����kJVr���ޖ��jrZ�?rE�X��겵�.7�x�Ax�XO�N��Ds2B�O� Mٓ7�\`B�>[;.�II��MT�5��ӘA���~�<)^u�]�.��x�!/�c�� )qރ9"�fm9�*�w�q�z�e��u�B)'��q׍�O�w�:=Q���z桋��^1y���I#�M�lY��7GwKuԙ�zU]��|�>��x�F��%\��^�ߙ��CZ��\Ҫ֗:�\*����N*a������J6�p��,+K1_?�Yb���g��0�6�^%��6Yj ݫl+�~S^qA�G��T_{�Ħ=�U9�͵�@�z�	鉢�ěK{����D9�cjo���Ȟ���t}{a��B/��ɣ�Zy��5�&ƨ��!:eT�Ì�"Y9��?����POƫL����د���%�3���w@|EY�����Y�?'�*��
�S���B�W��O��������Jv$�>{՚p��gq&�:儹Hּ���U�%�����׉�z.�5Ԥ8á�rj#:��k��{n�M��_0���n��\l���z�,�'N`[�*�!n�Px��"��#3��r��K��	��H�s��K\��F����f0�{.��H6\`�j-�bTF�-	~�OГ�l�]�qI��g�R< �Ji��E-]_�������Ga�:����ɇz@i]J�'�g]��K�_� <
U�A����HQ��Fi�=���m�z��o`����I�d�!�tϿR,1�ޡ�� ������%�/`��Ó����!�U�'���/����-��,������t��1��ND!J�1H���T ����G�_�PXǂ��G �.�i�Z|U�����%pQ�j*��/�&�#��UC�.�-n�x��&������ɋ��(}͌��`v"z@�4C���V��*���Km��\g_7� �FԂ'��e�D��R"	��ESeʞ���7�����N�)�/㙴���$l�\&��od��E�0�4����K#[º|�pLyL�$�E�m���Ψ_@R���0��`����������tZ5.\�W��`S�#��GF��1혴Z+��iUf1_���v`j��Ӌ��J��hRB�NӲ�_�c�4�c��X1�0!�o'ľoޞ�rڹy�<XS�&=��e�z�V�8��@9� U�cr�^-;U�����������{���ѣS����⑥�B���1�^���Ha��vL�UU8(cc�bQ<�l��PWǺ��y������!��#��uSKN٢�V�m��!�'`�1����^#��.n��c���q�<�o����y�k�q�|P'�����h}'��F�a�^J#l�f9�_�xV�)>�-���7;0�ï��Gg9����NO��c�EK�Ѽ�z�3@b��B?��H�������'C�:�*��Aލ�p��|o��y<�D�q�=ih�v�$��?r��=���A�+J����$�1-A[q�-6�rw#0��xY�`�s�i7��e�6�CX���-/~�`a���Aa��E�ĵ�2��z�D]*G�Z����L}�9�d2�qR��SỦ�1y���e�������K1>�18YaO�"`!�ҽ��ݓ��P�_^�/��'%AA��1�B����h��{C�eo��#����Y�:qB<,�����:S��qM;��1L�	>��YO�9Z^����w������& ]���4���u��8�*q�#�AL1��K 
��Д�h�%�m0���^�-N���6K�Z�a����dc��'-����R���8�6�
��5�mcLn�bk��P5�r^Ҵ�n�������u*��EO��F\4���3�MS�N���ʹ�b!<y,yZ��p�s*�ZC}S=dN?-���t�L	R:QY���
W�.�g�N��2EF�dws�0��W�1������e���~HIKZ	%��@��w�0>�Y��Z[����`�?-^yD�|�d���� c:q:y�..�
��[`��s��;��H�ث������71x7<=���O��u�-z ��,���R���8d�Zd�Z�_}�E��S_<��k`��c�_l�]����	%J� :�{|��/�Ky��:t#���qk쓴#�Q��(4�+Z���%_�I�n���Z���JN�D�I�$����ӄ����=R�|���1Yi��|�[4*�V-U#�����o�O`|D�nD'����\e����J�� �;s��?����r�X���t���f����<����y�Ҁ��1���?^���d�����+
O6��	���i�֡����~M}���.�4����6�nQ����a`��c���	������U3]58r~�~v�<ܻꛝ~L�~��7��gp��CQ�s y�VLj�-��Hݯv��50�9W�7��h A���vZ�i|!aCq�w?`D`���T����@��O�9uJ=*������W�=�=p���eh.��yt�&e���W���@��"���7�(�o��p���ct�}��L�nk�̼_}` �������gW&r�.)�Y֨M�k���y���g�[� I�yF�j|m�N-�K�9߬��C�	n�tW@�Z 텗�y��@��?���l�sB���M;�d�'Ri��9qZ������FI�g��R�������W�.Bx���I��eD.���$�����͹�!@��n��=�|�Ҟ����Û�������>�|2��/CĤp�i2ey�0��a)�7��0�S�4G�]���o>������ h�nF,#�RTO���t���Uq���� ��}�囶�cm�rN��<�7cY��������g�ǡ��]�6��;����&Rz����Bj�;`8��1��e���k��AKÊ��#�;���=�i�*�(��E����~�>Z�F�3��3�ɰ����
���
n�-�2�ɞ�x�z@�1��\{��*r6�!����1�+[����'�w���]s�׃��q�Z�Z�t��e'�'�3��bpl�&7{��P&��\ٻԨ�y+�|N%�%M���y�FAV~���W`�P�ƥ��LM�3��;�"�ؙ�x����m�+.�7o�g5>#��tH�Mi�(e�V�pz��Y���\�50���G��/��HV�m���G����%�༛-��{lA�����:�7���=�i��D��W�;Ս#sR����FZ�vh=g;���e`�S%
ɍ��iɀ�Ǫ(=L�PyD��~���˿&���fUwK7�Z�c);��D���l�kl&y{k�W`ZU����H��:�Q���DiZ����v�w�}F>�.7����}G`�䌻�H/5I���4j����2X�T��!M���ŧ��q��-TTI14��K�+0�{78f�a�Xl��k95Hv�Dyq�V�bߠ*�O��`�N(w����ߊszs�k]ǾAU"��0�h��/�k��>
��y����`ӗ+/>�IE0�q�;u�pp���tR}ж���9�ov~����Ks6�춬ۆ�Īb��uh?G�%�t�j7C�H�l<c�F9���!�
ر�Zݵ��*ANBT"������A;EO����Ԗ����������vG����)w.M˱�Lқ�֠G�y`�]3�ͻ�K le%C"_���;��9g����HvM`~3N\��`׃�v�Ro�ůV��N��7��h�X|ċ�������� e)x�
�Ľ��b���]f`�r���g�s����W;���Ț��`�����q	F�b����͝���W�"�B����~j1����&~��>�n�G˖�� � M��^U��?G-� 9>㍡쉒�Ro��tg�eDx
���V���1-���n�t�H��RwRk>��d-�+�@~�����+ԫ�Y0� q�4v?ZʇN�G    �D�zfݾ�vMoP/LZ�� -=�.��8K����y��R����x�F��=}�qes3�{M��� ��"�_��{k7ך9è�.C�+y�(��'��eg�}�����X��|����r�Q��PW.]��&�<�~���ʰ���ޛ��K� ��T��[���y}Q�G�����"0�&�u;�̣�]߶�Q_s�>�`�	@ ��s8�ر��%�
����=���ԙ���_��RśY�dJf��yϮĀv�+5=�,�蠿@'*����p�_k�A�ӗJ�s�M�Y�M;˭���� T��Fc��4�o5~��4�T�S����������h�9���r@-jQY�yH�U_�7��$���/0��8,fy�th�S,�Q��h�6��7��<4b�{�t�Vl�IYm	:��׶�Z������l��(��[�d,�P%�C�0N_�O���Jr�4-g��-/[r��[��>������Oj?cE��ۦ\�E�U�j�5>-	�߈�φ�Ǻ^Z"0�Ǯ��cI�9Q�(��F��~��8J�R���7�R*r4����(�=��£���\���x�
6�F�^�O����å��s�����\���d-E���N]J�B4��`��JӥO*7Ƃ �R�3�vd��z�L_#��J�M�t�5�RD�����A k����T�pA��t�:O9�Zު��1��1Ff�f����ඪ��r�g����t�.��v	"�K�=Zc����g`��p�b����d���IJ��_,rU`�|~~=M�Ķb�n\��Ss�1�,~�![���x��=�Q�v��\po��7�jm@��{�Ds5�J�Cza`?9s��#�<���y�2M�q��=6ٜ=v��/�㐲ް��G�[��Fk��N��Y��Cǎ��I���W�#��U�FJ��A�Ru�l<�����op�?�,7�K3��J�*�T�u�K]V%����?�w	�F�Fĺ��Y�旹��|��q�����/KJ�i^ܘ"DA�˨m��Qc���6���럟%_Y�o�]���λl���c��(��i+��{$���n�"������kφ��Pݑ[�/J�v�][�n{�Ӛ�F�r0Xc�sV'X���(Ij�V�/`L�A<�D4R��1lƏ�GG=~��(�V�]���:g9�0�jN1����N���뫒�M����E�%��2�Y���(�i���Է����L�7�[gk@��4� _+A��`�i�s��S�G"�Y�F� �6G�1��d.#"[T1Jw����iϡ�H�7��s����+�ΨI��mKS��}�����Mk�&�ٓ�!��e?s�ȿk�?2������%l�7-Q>�"��T.�T�s�sE��^�`S�i�Q���Bd�Ez�@N��cE�U��^T�Xl7�"�L�2�0.���]@|�)m|��p�j�ɯd���ndh���(���|�s�?9-us��_5R�f�v�'
��3�T�x�l,>rl�n7�+�p/
�}F�ݓKo-�$ʕ.��1F?�R��7��*�F 903g��r��5_/��˵{���ͅ6��8�QTRO��ut�����x��h�a"�2���z�TO�ƑFf,��ڊc����A`�K�Ol#�3}�M�Sz�^��s��=20�V���ךx��*ǖ�kQs���_�V�v�no��H�Yz���7��R"�AYx�B�f	jq�@��뛔#0��M���\#�Jp��9\"D�O�8YQ|D��.��3V�+�{l�����.A�G��Y� ɻy�oM�G�sx�"0����^F��K*,Ī�6p����iӛmwZ�3ۦ3'!H�=GP-��{�20<�Q�1�i�x	�j��mġ�Ȧ��Ր"0�R�n揜c�P��]�X�ǐ3҄/��@C�]��T�x4k�ǌl9&� qp"^幢�hQ��~咁�O5 ���0���ay�j/6G�Pr������g`�D���D\ X,;f���:���t�o������8ݒ^���f�KP�J���S�\�f;������X����g�9+�F`GJw�bu$�T�����Lk��7
��+v�s(�'�W���o��=^�o����J7���1:�"YJ�H�ub�� ��x-��%������/$��N�wݥ�#)��6��:�:H��ccl�g'�D�<+Y���1�C���o>6�)�m��z�!<�`ؚ�4@ڱo v<A��OC�7�z��<� Ϣ4�A	��z(�x��� �`Meb���!()Gi;���2T��=B��i�����~$�ｏ�9���W,��������U�%�텛߼���}�3
�U�8�R����'c�5޾c"0I"ʍ���� �+��䛋�vxWX���20��Xp#ۗ�9��E)���O��v͇ȉ��k���6��E�o�k�|���j�f�<-=�-�0���o�C�y�U�o^aQK�س�?�Z��N�.�~`�~"�c�]��@ 8ʃ��d��(#- �XM{Z2����ll7�v*�4(����歔@-��ך��F>��WwQ����J!jH��V��l:����.��QA��r����y�����S��μs!�}w&�� �F���=`l��1M-i�Y�J��6��'��9���+7�C��=��RjO�֒K.�v������>P�ݸ#��sX���#"�'Y�,��MHq�^�1#o*7�Ε6�U��3�4�>;����J;�R�j�m���"y<�6�RW�
7k�m��=1��H��HE᪠9�Z�ft��Qxt�������-g�0J��˼�:<r�μ;����E4@�Z�y_��qi�����E&����X:[e��.�a�g$�׏�g`��͝n�gj�}씽R���=��ު������A�4
�x�axd��PP���v-�l��F��J��l�RjY��M�
�xq0R�~���
|7EM�^�_φ�G�������dA�G1��2��Wm���}/����LTko�G	ǲ�3o�KaǠ�%{�>����*ʳ��Z�1?�f�*�()���%�c��h���,c�J��u�cN;�8V՞;�Թ��hK he����1B�v�c�d:]�9-�MK�Q˲F�R̅�A`?lM�f����N_�t�m+��50�z���>t���1�:�1��d^E[�k�c;j6t?`Se��7���qԛ�q�����k�:����W�4f`�oP���&�9J}���s� %�Kw�R�i�
þAUb�`l���n�m�L˞ԅ��H$l�F��}O%?�38n���iYh�#��hsj4�@㜅���F�_��k��w�+x�Yq\�FJ���:��Qk��\?�i��P���hN@�����=��*{�_���`E�[� ��Z�?�4)N�mΪ��p��w������e������_���?����Js� ʰ�>N�r,9ؚ������G�m��_��?��>���w�|��� � �J7�m=�Y@��HJ$ҍ��1p0�^s��@���?u���; Z�������7��Կ��UN���n��[�������-Э���~n����#�»/.�n֨d�\<�l��R��2��E�7�U{{j���G�2�".��b�$��92ΐ�-V&� ��i����䟥c�4�r��,��pꚪx���ȀՃw�q����D������h�,�������vN��� &m	�[x�+.�!�r8>��R<�蹲�Ņ�샪c"����'���3M	 F�a#��$M)S�h�2����A��z,m{���g	�tĎ1)|���1�9�=0� ��;F�x��%��J��;Fчn���;�R0�ŉ�y��cS�@&��}E�Ym�F�)���r�=i����m'�
!e��?��D��g5;�G������7�}�
Tv��K�u������iMzy��W`"�����m)�-#���W��ePdKU�!���+0�!��ܘ��A���t���J	B�\d�� ���1ts�$�{7O=�ؖ���ډ�����h    ���O`�}�ߛ�l�@�=o]��4�����[o3��=���ә��f��1��:��VWZza�fc�%��7�p��l!�/[h�����T��g2���0�>������	��nl��	:�-w�t�.���N�t���O�O` RJ�ވ�컪��I1�J�c�\�h�����<#C��\#�9�K���Z�Jn�7����O\?�h7�=~�����48��ˆ��{��@�/��
L���縱��9��PR���D���w�U	�h��+:O+����U������Rʳ!��aP,�WP�WF�G�����ne)/�e�0k�����KÁ ��p��~E)�f��*C�\<��'/\D����P���j���&�R�Y�XW��LP&4K�*#+�!�Ɔ�^nv��`C����(u���� ڎ�����Gdy7#x��� tS���>�c�CǤw�?d*z��?|&ݏn�l͈L{D�4rb��#�ض�z��w�JQ�c1r�|+�(���Y���S���.�.��<Q�CR�E_�:��2��*�t��#92��:��Uǻ)���~�&\E�'{�#*��i�z쬙N�LA4�#���� �� �+~����\����~�q����i��ތ��7R�i7l��A���K�c:�ÎL;��~F�'��g�ݼ��X;�o������8���F����Ξ�����BZ7�A	�Ls�2"�����'���
D����������������g�b`�3H$�fr��O����>�!�AH���?�l�l����~�8�^��&k��D�ǀz�\%�+���|���ОKZ�X��>�Ծz�fr�h��қ�j����;��`�`���QQe��̮@���i[�H��޿C\�Ci�z�#{/(_�x�.��6؃Y�����/#c�7V�6�bκ��u��b]���Is����9~��!ԊW/�4p�89�
�"���$���1�?Wn�a�s�u*����S�j�����T@Z}�����F�7*�c��%u�fJ���6��'�9���;��`���v�|��"�<c��գ*M����C��9��Y2�zS��9�#iK f����ױ�oܞ��}�*���Vn��e[���H�W�s v@�/����bI>��޸J�ut��v�Z8ˀ����������ҵׁ�f�0�ڠc9����{�q��A`0�n�������PL]}�^����-`�
N�'��)T�� 0��7�fԤ������2I
{��c��\D���H���Ӷ��{���B��Ƥ������X��0~�f�!���H$e�Oՠ��0kT(��\�0����j7&���p@�U��ؾ��*V�(����	��lй���|�C��б`J���8�P�D��oc��<��M.RLzQ����gů!2O�-�/�JxC�މ�F���&I�~� 
2PW�϶�j��n3�'0�� k��Z.pN�J+=�)�R2�٬n���պ=ɗo\�����<aL�o�H9���ɶ��/"0�>�ꕃL��ĻSOy�]LPƌ����+}�>B��1{9)��ES�f��Q��@C���HX��w-����<�t�}eA��~U}Ϡ�v�F��[��ᵋ�4{l��[�S����(�{Ճg��(=J6�n���A�8�N�	F�1HԤ���������!��l���tQ�:�iOO�����}!b �Vł|Y�Tj��_��+_'ݟ�������F����!X�
���������� �P7�ݗ���] 5�Y^�Wp��<CH�ؼM9�8q0&Q���^��]����U7�8h1���f!�����n[�{}�4sF20�ycZQ��i��]��4+yN����_}=�ƏS�a��DM��9��c��E��+joH�L�\����A�T܏��#`�JS��j�v�D�?J�3d���|2��|��d)Ŀ�J_�7&�z��+.�~����q�l�=KԬꁴQ5(�4��5]���nj�Գ=.��q�ȷ��5��U�)��c�����b�Ԃ�/(�sd�"[7��'I�&��+_]�͊�8�R�����6^Sypt:5��ޯ���<b`".7E��b����ƪ�&�;i��RE
���T�i���~<�	�Қ�c�\lܩb}��W`�G���.8��9�,LS�Fт+�_�����&_�IńX̍@4m�55�WNE���e����30�ݒIP���:����JY,"�½��H=6�[��+0�?N,���mvKcD���e�K����.]Z_���y��Hl��1o�&3�4ARt~*�\L�,�%� ���F�tr��M�$쳜S��]���g�:_>����7#�i�%�vf�~�!��C��w�f` �ul�+��=*�(FF&��(���۫�$��A1��Ƨ�J؎���-Mv��,�˭�
LT%&�Q�uI���F0��� ם+��6��$�`Q�n`��9M 6����2N_MFc�W�=}�4���ft�ڦ��CJMkpIy\���@���o"0l��H�G����-�{��q-�M>��薁i9	�j� �}��{T����Q��(��&O��������h����F���$g9fR�O�'%��^ûm����:��W�#���(`P���c��sF������������fǬX=f�N���PF�1C�t8m��	ҨJ>��Anr���CfQ_Ϥ+�� -�a��$����#0�>-������x�k���Fo<e�����h����
�r,��ʷ+���Ά��)K�C{��N�݃��Ѣ*9��M���g�5�һ뗀�q
R�"�[��+0T?؄n�ШKJ4*R$��=pK�X��IS�����M�kh�{�r=�G��c�-���߭���$�x�B����4��4`�ӣL��������>V�Ga�|qC0��k4��fLa��P8���ZR�!ݴ ��Y�/�9;	*A*T���^_�%�۽��q���tHwic�A�|ןuw����W~}R�Wo&:��T+��N����NY��>���>�>���	�/�Ҕ�@5o����n0�l��(Jﶮ�����G.�|��5�|#H�ӭXO��5�/�8��n�|nw�r$�N�%�Ј��^0�o�L���S�#L��7CE�3��z���w�5�ǲ��!������L䘠�xC�+JN�A��&9T�7��Z��?x{�؏��J7�T}OA��!�T���g���w��rI����7��,�.3�b�����Tڊ��ڼ� ��_�~��7j�7��Տ�>J�Td;IN/�޷7T���[����э5��[�c���6�i8r��ʏ�i��'���hh7�ӱ�v���Z
�(�T#A��2����k�>~���V�^j�B;��<EiD���t��8&���%��(������r�b�2xF��4L�y�F�W`�@o �B�+���(����tޓg����_�!�x�z�u���]N.Ŷ<Y:�q��4��mC_:���Ŏ�� ֩�D:#�����P��������oH�Y�f)#{�hr��	K����׷?�� |��Ŏ�l���u>pL��dp��k�'��_;D`�*��_��{���e�t1��1)�o�jN������L$__o��*���{r%k^������DJƷ��F`�~�
�4T	�a�\F��{\��^��z�_߯��UXQn ��s��]��(MbA:���#���_;P�4����S� ����́��W��ހ���se���H7�zu�*��	"@ȭ8�X�$�2��>0�7x*���Kd��%�A �T�������k���*��DDc�igw�o�)�	�ƾ�!�k������T���,�{���F	�yf����תXZG`������f���"p#�tPx�|����xJjz�Lk���ȸ��I�n^]k;���Ӂ+�r0@FQ��c�m�z���MB ����~�&)qdj��ނ�fk|��I{?��G�DnZ��<�	[�đ�s�    T��aVG�����$ ��hN��h⭰���6�m�%�e��~^(�b����������k��.�A�f�gg��3ٺ��K60�^������FgH7�����쁀ꦯ�q��d�.5�w��k��'I1j�E��:;B6_ϗ%��������JK�.g<o��*�lys��Y�y^��h�)իi�z��J���8Sڋպ�lMX���!��$Є��wL82s��)�{�vQ-�nID�;������9OT���AD{�ִ냕wL}<�{�= ����O �q�� �8j�sR����2e��s����<�+#޼e�hU{d�_�mEA�;����5��R-�g��@o&4G 0�Q�V-"P�W>Q�9�NP��]}u�L���Ji���jd�
��lI�-��N]�8��w�cF>�Un�%���y�M������������y�|QP͙#���JZ^��c��:u�ȧh�?����;2�vd�xsɬQLG��#��D�a�cc�i���c@_q�6�+�E�W�ܱ}���R��Mm�����	L���z�VqA��A�*��O�j$�M��6yo��,ȱ�����[��Q��|,=�Α�'{��W���;�
�>u�=Վ��e)YI7�|���g�\�Y�ˇ���s�h��~���f
)/�?S���;.�d)����	g�	�Mcq�L�{?`6��uJ����33����,ȩ�/To����X[��yznv�rS�E�]�S7�o�_�?zե�c�z �t�)t<�<��1�X�[��/W�cn��K��,ͲEv�;1O�5O�+^�9�����Fye��E��{������E�[�}�zp��	���F�g�ed}��8��X��;''�������Zvs^<l/J���Tٌ4��(���{��	����}m�������Sye�)�s�E�=�9������S)��le=}}���6�}ڤ?\F�30�hTo�ٱ�9��|��*��wd��CP�r�˥���p�H�i_��!
u����ǧ���G��__�%�MT�⑸���S4lD���v��mi$2$葯חk���s�B� ��G�6�N�H��؅���{ݾ��A��1��b�ND)�V�X�+�0����і�4D�]遵U����(ăbAS�G��엏,?�A�H��+�����"���Iw����>��N'���ڧr|�Fީ��8N��v��Ӯ9�\i[�o��6m����9�W�k���9�$]�,�j�a��'`/�iH�d���rjnԜVӭm�ud�7�1����4uD���< /�zZ6��}F���I�I��Q��"#`�̜�;Ջ5�8�	'���חk}��Q��e>]vxV���\�!�щ��\q�}8���y�ql���w�	�w�c�A u9��J�n*�,]];�ڽ�r���߁4?�2S�'�d|���:#�����C�6�Y=�W�,c����8� _�
��(׎N��)Z^�����;v��,Ky낺��ն��4����gK���\�/JЏpP�٤����w%M	$�7vy�v�`��c�X�GD
���*���?�>b��$_i�����=��I[[�]4~�}���W`��wc�!b3��3-�,^}�=���7x���w�_�,R�9�u�����\%��댢4��۞�8U���5�0oxk6�[�!���P����-a��%��1_5U�+��|�nj́�&R|�|��z�d?*}L��U���A��ǉ�s���sJ�(_�\�>��nJf��2�..3*Ҷ�5{k�Q���1L��>��FӴ:u��azD�hf��"�6��[-�{����R�?�5��kÝJ�A��6��1�@���Ǚ�!>��H^��G�&�V����1nl��nܖ��A���zsg�X��!�[MŻ��x�,�s�L��j�0B�R�LM�+HmvL���8��f������U�]�[��y���/���� �;����	���.v����NZ��s �(��ĺ�.�=�ۏ�ԕ �7�N��H�%�.~���QE4��Ao�sȸ����mݻ �z4�Q�5�ղqz%3Fy;Qz������ ��>ۖ86=m1(҈ӹ�:]o�w��@jv�0�A7l��'��֊h��E���}�}� �W!p�M+���;`������^D����V���W`�Cl�np���&=��9P?����Du�����	�'�%t�{)
��e��N�KS�%�x=�N��1-(�E`ҵ5ⲋ?��2��ks��@����h����A%@��MXs�`c��]��ֺ����q/<�;T�f���"�^����D�Z����i:U��/�2.�Rvc�,�kN:���֔VƶQ�8�|���;HkŦ�|S�Fc�X�lH��%/`ʪ5N��?��`�pMav���^���+��rrX߁��������'�4q�f��e_L��K�9F	J��4w:@�?0�L!�#���'��5Js�RI	F�f	6؁~����Ol��eWM��9����?�c�HƵ�T:�-��T��5�1��֌H��x������j_��0Ǌ-�č�$l�S3����x>[�p�uf���C_��(7o'L���ˆ���gi�k�� ��:�rNI�ϋ����.�USV��b}Ǒ��G_Ci{�
p�{ǁmw;���5�O-���E*����ӳq��*0��nɐvJ�1P�UX�s��S���p>`s�����`��R3�p��^pw��d�F����%;�.��֪�6��Ie����s�����ßW��?D�����ŝ#o�v����T�nk��_�R�x�w!�i�-���Ѓ�Pm�L��>�����[�@2�z3n7�Y�oH�*#{0[-�����i��|{3s��'�i�6F�'����G���-uX�Dr�8*��c�L>��0�ٵe��j�������vآ��&��W��P�,�Nh�|ә����� ё���+�O(9�~���4M���E��1��)��IJ��1�6|��_O�5Ņ�)��4+�H~Ŏ	|{���g�>���;-�H&w�Wm�<HT8�^���U)M�3�u���b����u�Ȭ~0NM�ˀ�M�Ϩίg8�!8�U�cG��X�+%��bf\�W�ø������e-�"�����P�-�R��8ISV�����\��3�c��k�Ӛ��R/3֞�$4͂ �U�C�o�ER~�j�a�a��+��;�n];�H����%�l��Q���)D������Nicry|�zL�U���iq����[�0��
ņI9��50�
����&E���:�d/&���&Dm~�o<�U%��p�-�eg���r�a�X�1����bu�2�Լ!�]K�fX�C��_�<�@���,-Hr�F���f���HVz�� sg־7��}><#�&w!=/$�{�G����)s/����BG`�>����3�b�h��eF�H�{�~��{�5'BoS�G88@_�ﴦ�n���0x���y�blz#��T��4u}ހ�&N�2!�����O	/LT�j�2n��a�V�!~X�dI3-|�N⭷��d`��Z��4ްϘ���|�(J�ce�-IA�s��}N�պ�]�shG��P��ԉ���-2�9A��H���֞b��o7HJ|wV|�;S�ժ�*�ͯx��D���rT��8��=;�"Ťz�$�O@E��?D`��p#"[k'�@0:$�]�j�dw������y<ocDn��N�:S��s�=F������C��S%O f�~q۽�p�=y��<2Z��Te�h6'��3��|�����3w�{�ޥĎ9
e���S*6&y��x{f�ÕP��<f�D�wUQ���Á. 0���5� ��Hr3=?*�a� x�v=�^%��ӷ�LrHS���ԓ��i��Q�WV��Z [�'"*}�������` �^�q�:[K_�E"{��[��6���Y6 Gf��+�q <��	�8��$[)w���E�%>���@`�'u�ݴ�2AV
�J�Ҙ�⫓DM���Ƀ��ނ�_L�    ������J�4��{��[S�n���|��?D@o������9�</=�T�G����J?�.�4�i���k���N��9s0�-v�lLg��:�׳^�~� ^�c�l�(�V���g�Sٚ�K�o忿`��S[�^zVLzĠl�Ɇ̿������#���ǿ���j�������@HjT�[���O��t�WΘ��n��S���ͭ�s���fb��^��D(����=M0�E�:ξ�_���1+菖ݰ�f��EV��V������Y!�$���,'�wd�F m�o8:�3�9�����Jl[(ҥ���z�~UV�@P�.���\VDV�VmE Npr���i�|��������=�I��?��t#> A2;`+`��s�1F/H$5е�����p�D�$���!׀��Q6unk��<��ߠ��i O�oBpQRE�XO�m9/>)�d��lM�`���	~��+ܨ+�G�O�w���al����5X�	�f�.���H\��H��e1AQNX��*�k"4n2�n�i" z�G]�<ο��BmB���w�Jk,0�����]���G��;p1��y�O�3��:c|�I��S�j�^-���R~Ǜ�u�9<E��ɞ=����#�� �0��q�	L�j�r���\.�E���0��w��`�g� ��c��G���G������y|Z�S�9�`�GYKk�8�?���׵S�x�ȫ1�L:RE��f ;д�^g�:��~���o���d���٬�N��@�t/-P����	/��5.�I@�l�� :ӭ���"�uT+��Y�lo�,�
�,&	������K��Ȯ8cQzN$��9B^���[\�9fz㊭Y%xj�*�P)&"i��O��M�:�l�3&9�OM,�^]ה%��}ٿ��O�����>WZ]�*�1,j+�S6_����&���8֞c/v�!Oj�.���T�x������F�=��7�����Ѧ�3�����.�)N���� ���ŭ9��? ��/�"����I�%|<8o�-�O��f�����v�c6�Y��-+|5��C5G&��W�.�l�r3�a�ܞ����l���G\��vo�F�-.��(;7�3v�+'��$�>�[�̴	w�#�����9Z�7�Nq��y0�!�ވ��ѩQ��LV�G��sd��Uop��x��yrr9�^�(LG׎�,��#?���'�o��Z*l@_�5�|��bUG�+ͭi�q^<��[`�d~��Wye_��C���Y�i���[J��������h�73?@+�
?����qJ��1������A~e�p�W���pP/8 EV(�r��~�F��g�-��%�̍qP޽9��W%�Qz;��G� ���K���[Zmz�쇋����$���O��;������QܧJrU��F��(�fnq�r8��S=/�G�50� �]�O�Z�P�8;��eJ�x�I`A��i�G�)S���z�qLc�?��Yy��!��'����/׏GDƼi�mٷ@	�+3'�Qm�,�ɷ��8��7���� ���P�g[u�9F��թ���Gi�	��*�}����(Yl�]W���x�?瘟�'>k�F���Z��LĂ�n�\��8�ha~��d{n�9�Ѝ�qiH��E��5IWY�=��i־�mU��F;��>��	��Yz���W�[p����v�d�Ʊn �X�n)�@"��`-�uU����"���?����V5���x��m��DJ��%����x���gE��ō&���Ɋ\�J����9�����aLg�;��>JӢ0(^"�֙�Ғ.����Qef��1'fr|7D�j"#�AO`���ͦ��>�#+��bR�jd���#���3)���Z?�������ͤ����7��P�S<(x9�T��f��� /*,]�O[�1g�8��|+����q�^�����b7�Jj�@RS�rs���;c�g���H�3ވf욣ͣ��ڮ�t�E���L@E؄� �@���r#��@ih������9�hY'��V�M��PT%���!����^h�Z:�*��^]���y��z�1֋��g��;��sҏ��lg�}F��w��'X�T�Q��c[�j��#���6����A�}4��f�83p���9��c?��#h!��~=�Ǵ�@l�.ʮ�O�11��,���Ud������ ��'*�P��d�Z��SW$�
�(ǧS�P�P�o��O���w�\��E�7
��+vy
fh����A�Ԇl7q��pe��'�'��@����׿A�I��6mX;�� ��>�V�]��&�Z�� �Q�7�5d_���1M��s��_��M+ ��_jcv�)7�<��ڰڊ����J�)�E�1-U��AU"������0�#G���ldUB.�}D`�y��ߡ\�~��r�l?�ă%�U�f���ʦ{Nv��*嚛�2�e���	oJ���ǁ�W�����l���j��1�T�w9-�o� x���}�H���O�������>=U�'�3���b�,�
�-���>�7�1�QW:�b�`�e°�H��?�@? ?��hq���,Ⱦ'C��P�J"�dL��)�/��-0�I�؛��ᳵձp-��{���r�-~���w��]a��nޠk�c�+��q�0�5F���UH�����~z�,w�u�������ؤ�n�֗"as�;ƣ*�Վ9(C3�d)����i�',���`� ~�Y���w�C��N!�9�G��m���f߆_����c\��X��Z��dꭜWQ��8r��׿@SRH2��n��N�5a:�L�~"b=���7�0l���7W�A9�i`E��z*�-��u�h��^N�#T��T>�rzK[���8E���9d���8^ϔ���~���}�t�6N�r�#��6k����1.���0����H��z�Uv:z�@.j�ȱc��\��s���/�~JU�E9b�q�������g(��l-�yg�~>�SG ��Y��N�?�}����\e������y=��/��x��
���9�]
Tk����yq��a<��"� u7�=��I�dJvH�֯���֓�/����,�nD7V���s b�*���ةVZ6��@���#����Qo�'�m��\�*Z��*�c�����e�iajt%�8{�ݢk�|��2������a/z�@QF>U�o���ƃ����5��=���]q��e"0��u����*֙Rj��wo��k�[�]�^�C����;	�912#��C��I�+�҆��է�w���kQ�Z�]��33�S ���^�Ȝz��.x#	\O���'����p���(>���ʷyv�`%��˖������K�c��NC&�(E)��:���ԀiV�&�fTf$Tm�,S�Dm�:g��z�1��kQ�y^���B�MRio���P��:�kT��z�-����dJ2���ʳ��tJo�K����9}���.�1��>o�KO-�f���L6V枵��i�>����ꕢ���#rtN��lՖ�Z*��|>0��
�P�M���5�,�c�J�,�!�L������Q�L�hC�+a܁�SF��ӢrK�~
�׶����S�'�'np�F�l��)�sL,~D	�y���띅�}�"�\��ȣE-�� �-�}V��=p�~]�%S�C�z�cRk���*7D�PW���ϼ�x���I��H�7U�7�ɂE4��MV����Xg��^.�@!Wћ�m=�Z�V��嘾��>xP�s%�wDa�s����Y6�}���ƀq*}v��o���!I��O	wMF^�g��U�*1��yT]��__��ܜנJ\�LN��UM����j�at�����J��#���.�<��޿�s�JO��z:+��|��+Ũ7FD�(�Ҧ�s�N����6�_�!1�Q`Ջ5�=Z��d!�}����S�S����;��g��|�z'���J|M��yV�,q� ��h�� 0�{��d�=��֌Fd�8J�	��̙�9����"�Qo�F����v��U��[
�kA�x/�Оo���\9W-S\u��,�$2L=����Jy�_�    �9z?�Q�Z��;�́����x~@7���W�'Jvo�b�#���tJ�,�9�z�����I�7S�6�9v�XA�x|ųv��Ei��{}�|G����7W��e�ڋ�hyOSH��������ƍQ����k��p�r�b?�n�Hw��;��_yԋ�}+p�骁{E�TrF�n0��?�/�~���r�I���7�����7F
WkO��'����n����
�B��PR(��,�e;�]��}IU1o�7�y �#�p��vz"Sʭƾ��
�ן�a�2p��Jc����gߩp���V�HE|`��<c45�Z��W!�z��ħ�S��xz��|`ZR%���)��.�g"��e�e�Z�	
��&C�C��}�(C=2Ks�c�M��fo��m#��?O"[n�7�WF�|�3����S��śy�a�n�	�秩Z6�%P�ȴ�ɭ�U� ߔ�E�Q�V:�+�|��*ciz�z�a_��:G�l�9���VD�L������I�JC��������4LP/�;�A]��y����Ԝo�O����}/i���O�g��g��#���^˶2�\L:l�؃'EUj�Vc= �Ҩ��ʾ�G�<{��3�ME���pR�FOߕ�-G�.K���.�~A~��i(r��X�PV\ESv�K Z/ʋ��ڀ~CяW��:���s(=��^|�ׄ~�>ý��`��������}�@p}:ƭ�2����|�2�BmNWVهj�T=w>�������m��7\�ppD��v��o*.�'ǥ���Y����2g�?�.��eG�'�R���M��񮖒�J_�J���0��/;��*���X$X3L9��;�B�׈�>[�_k��|OžÅ�t#�ENs�+;�_��ܗG��F`��|~���q�c��;�'i��W9�����)���f���_-ߟ!~#7�Ylgui=%�zʷX�6g>�D�t��������X�n�Z��(��*��]F�V�6��7�`/���q�nA�-X;ɷ����uv��{*�[�Ƒn��p�t�����Z�>{��O�ݟ7K�����QOnޟ�c�H*>f��F��(He��5�?o���O���4��ԦF3������Xu�2}|��r|����M�d�}�%�O���w	0dX���/H�� ��F~��v+�{
"w�kZ�郈�{�/(׬p����^Y;A��]�(ϑcz-:v�|����	�������o��It�GuJ�$?��󧷡�"���Ъ��oT\r�u���:Z^��ٱ�k��oȯ>Ցo�"���}�ҿO����hY+�1�v�y��g��o0{����3Sp.��b�����)~~��o�p��O�#7��i�y8
��Q���R4����T���E`��ZN1����\l�.gIo���Z�㸵5�']�@�Bs$��g�H�*@Jp������9߃�no�od6���n[A�P��9��n��'f���	�~���Wr��{��	�P�
�e)>14y~�S�������#�z����ن�OGMQ~��D�Q�|#�0Tеb9�G�F1�f�H:���g<�t�ve��6�l�3O5K��,c���s0�瑯�E���a���,=MSUK@�8�����v�����HF�S�7V�ã,�������9X|���V�{��Y�Z�V�)��'��%��
{� ��{���o�1�^�;��wZY-'���[-�g��U�F?N��w��mlM����\�k
0č�_Q߻=߽�J��s�`�}�J��Ԓ,*Q� 6���K�G`r��Ƈq���	Л�3Uu�R��`�q���� ��.�e
G�E}F����h"�	0��|���+���7sʧ���J�B���Ț]k�A=R���O�1b�H�S�G8�|�V�>��$2L����ʯo�Tȡ���|�@�a�8F]q*́�H�m�V�P���L�r6�n����#� ����N���:8���$2��&7[�-@ͥ�N*˺Jq��দv���zI����}�5��PV.���h�`�~^��~m���U	+[\�4x��㣒�5�� �[�~�*e`�ǣ,�,�R���S��sh�KF��(�p��\��X0^�M��p��0�%Dz��Z�#��n}����я5��	r�ذ�a�I�S�ɷ�a�D����(��7�h�����{��wn�����6���{?0i"��/.��9�[�mz��qY5J�A\җǝ�q�.c�ɑM곩��~ɵ��_R0��ݤ��ū#0?_Io�e�@�,}�HN��Z�4	��ק@20�%9�46g෱�(�5.�o/v�b�Q�~���T޻�ƬvHVG��I�v-�x����W�L�&�������	�;+��3�c� 
����'��cN7���TP�+���#(��)����w��'�����:oY�t��$��)R��/6��Q�׃�Ȩ�Hv��}�&ݹ��e�a��0;8��j���u��7�Հ��p����7�/åQm���"U�[�v�"ThD}6>�����I��0���|cS�����'��Tr"�@���ZY}��rF���M[i��)�IG?���:s̢2r��;��G���_p&>��5����3�ĩ�(J@i+�U"�4f1��/cE`�V�+�(<'���Qn�&Fj�A񵠶@}��#��^�f�3���`B�`��e������k��y:�� �4����������5��j�}xǱ�>?��i��tHMI��#g�R�2�~��7�]O��w\Z>�ܨ���m����U:�)�q��@���!�8�<N3F8 rS
I�āe�H��z�?u����n#C��ZH�r��*�-��L�S�iŅ�d<_xZ��"��J���!q�E�	Lof�ou�ǯ�z~�$�>)/w#�1��GhJd��iċ�ىW$�XT��Y��\�f�p�:$WƷ=��z�Ɂv##����Z��Z6e���MY��"�j�UL��?�jߵN��GR#0��V���S:���stJ���R�,��ƀ�|�ɲs���MNG����T܍�l<�j9#[M�y��r\,�i7��1�GCĩ;V�r�N�!
�\V���&�����ͬn��(j#�t��ͭD���������*t�@�u���4	t3+�I����w���te��ǡ��&WJ���S�T��,{�*��{p����r���ՠ����RKK'��PP�֟����5~7�f���@˚��z{�G��S��y=��9�]���G'�Izگ��5�I���V�jL�Wb����r�����Ҋ�Ȏܛo��;��}�<9����8d���2Zޓ8����ll����Ø�N�e��z ў��a�%�F}2,��S�%�y����w�!E/5�e��^�#��}��&���>�����հ�����X�@��\�TF�0�o=|����o���Ũ�O�A�8���:�_g�U���?����w�u���r��R��K��L?������R�9d�j��k�L����Y�zD������ng����qa���-�7GU���7X�T<7�z%BPg�G�#�W��3�R��EK�}{=��bEʸR���zP���*�m?��ف�*���߿��������_����������J?�*.9��#�='��{���(D�����q����O�)����/��@}3z^�H)��z�&A�k���9]�KO��ֆ���7��a���_��A�r�����wA������(��Y�������G�!�q�v��9\�Q`7��Q����	��1��׬~�[�����^ڎ'���E_g	p���~�F`(�~ xލ��Ns��R��(Ur1O5�CK$�?Y���F~�N�Z	o���#�'>�ٴc
�,��Q����c�_��[�T�Vs�8����rv�4���6�!�� ~D�fD�ZDH����YݩD�%���\�>�^)�E��n֞,���F�IY�n�K$�f�0x�/�KF�E�������T{���H8*悯����Oci7��    H���)E]O��8�M�g�i�Ҭ��	�����;�M�az��9��Sb3�<�J���+O�c�8�Fݹ��I�4U=���-Uy�38�o'z�_�LM��ze �(2RLb�^��	�G�6k�7�@�F�z���r|.qav���u�`�:*rjO�ݑ��K�Pܘ�YӞcc0T{�Z:f��(����70k��@P���!6.�\
������㚍�%gM�F�{�U�
4�+3�}_Vt�E$�vK���p����܏��wMW��J�`��Ԗ�a���JKAm7-���&���]�'�"�۳+���'������f�g�&J�gO7��EQۃ�o�����q��!KY�2Ԕj߭`��H1z�8�D�ӱ�Zo�;��DN��P�Y�^��^�W��Z���G���B����&]K[�s^�j��3��O)�^WRىyg���<K��/n�`�ɹ�� �q0��e�H�=�}��+�?8t,7L��Q-I����A���Ny��g���p�O`��iy�W0ս�!Q� �e(AA׊R�ߞN�&�R��z%=����t���y"�t���U,N����u�JaY�n� �"�$��Z,%~H�i2��|���"�"�,�Jl+�� G*;z1�ݵ��5�c��p�)1��Q֦8�,���i�����W%����y�M�Kٱ���(��q�Q���=]�߀��"�(��,l �a��h,�����"���t�����a��7��[����V���F���qE��L��yn���&8e�@0��t���滲��.LZ�����(`}��rfP-b<�����W�Oo�GuY/z�&Uߩe)ykV��Ȟ�ƴ?�?�n7:���9v�,L�<w�5]s
w-����ԒB���h� s������E@��w�h���Í��D��X�u�dz�nN

yr_�)����ŧ��
j�no��rjKR�Ҽ�)QwHgK+����W�Û��\����2�uO����E=����\�7ĥ~ ���~}��Z�g�Ԅb�3Ѷ�4*КϏ(����#�U�m��!�ћ���F�o�.ϓ��Al7��c��M���%��=D�1\r(��끱���e�-*8ch[����]� *ͭ�q\f]��'{K�����79gE�����i��A�N��6'؟V{�����΢�Ar���E�����	e�D��9~�-@J�m��K�����m#�(S�c���[�f2�E~~��R��k\�q�gR��S>z(CK9��T���z� [>�ȕ[��V�������?Q�J֖!
���P� �EE��(��
�;A�9����u�A�Imi��q�1(�H?�C�No��1kG��J�P����,�c��S�T�
E���`#nL�r�l������W�0����D�"ϖ�k���[SGi�1`�h�'_�������6��2�l���~D�7KC�H8ϣ~υo��7�l�ZR���}M���he�Ikw��q�o`*���rh��s�.�[��@y�pD���uk����7����zAS�^Zp�3Oq�����_��[��� �A��:�������K;��M�7��+���|�2'��K��s�gD�Ic��������@&��f�%B!}����g�^X��5��O)c�}ՋܻG�j�=˱˞�X-�77[�냺��JN�7���N�y5n��(�����{�y}8Ü�#�7��D�z��J�s娋�Hòi���׫u&n��wȁ�k���qcF�2�@$>��06�����Ñ�_$�t���=%\r�9W�!ۛ!��n��W�#��ᷛ��-�����y�^f}�r�X':"�ur���D���wZ_�w9=�( L��C�րp����԰���t|/�^���4@P��5b(�a2Z}}C-�:�2^��b5�]F$��I�	��� M�����9]�~���ذ"��w��s]E϶3��<�'��gІ~3_�ŀ�Z�ǩ���Y�=����ߘt\�O�.঳������|~�g{��B�a�A���	�W�Pnp��܍����gg���1����6�_�u:�^?��'���[]�E{n�Pz�W� rH9����j��u��O��F�e"�)eo;�-���T@'S��:θ�'g�nt��
�E��7�����v�����_�҅?��7{�
��
D���Z�?��p�,�<���d���h�ы��"�܊�u�m���ϔ4$8�^︤=�}�n-�^��(�TaH��,�ql!�.���~�s�T���e�HF�%�m�\���.E�28p/�_ޔ���i���H��uB.�$�Y���Eʡ��0hOy�$#D�)ȸ�y��8�2r^Yag����3�/ܘqi���t3t�����)�z��:�#�

������z�y����4"�'\��w��㞻f(�0��/�/�}�s��߃�� k[J��Cb�\���*9,�<N���{%���TN��W����j�~дS���O���I�������0񛬸03��"���e�2�Ǩ�ܼ�X[;M��k��� Q��q`@�Ə;���?���j�1\{6��a,Gt�D�q��Gj~?0���7b����:�����5�8h��!�tF�]�͎"�ޘd��#��!��ғ!�u�-#_ZK���ǭ���lZ-n�e$r%<�e����k:����1�1�Q1�ݼ][9�]�5r��q�!��F}~e1�%)H�̻�h2[�IƗ$�sgq��N�H�畐"0LA�o|ߘaVn�R�P����U������?qi��vW�D*u�8��Y��T,2N������E�70��M�/�4ֲߐ�wj��w�1S���ޛ��檑\�*�J���?��P�yO������X&7j��k�W@��e�tP��:�k�-�z�T�W��M�>��nn*����f-c��G7|>�`ʘ�ҍ�U�ظ�)����	l���wx^�%�>Щuusc�i�W��ۈ��u�,|H��}����í����@,�����.v�rh�$��g��(�?��}��ޔr�G�\���ˌ���E��0���p��a��l˳����g�]��Z��?�P���������#�����9��ŭ�A+F�i�����c��.>uY�����_��o�����H�Wu��E4��+�F��0��\�4rh_�D�B{��~����PSm��&D_ߦ"A��ڋ'-��;w5e��P��mm��ȡo/���̼ �y��u_���Bi���K�����^����2���W07�����!�L��	���FvDL�����Ŀ�,���5��yA����1
�D��r�8D�fm�o#����׃��!��`--56��S��Q贑e��vo���t�v�ڬٕS���{+kՍ#��������޼o�6=>��\�.�̞e^�J��4��b`,�l��K
��~Lʦ)f�V/2�N����/�s}�9��>>u��Jr��ϋwnV��p#�_�)~��07�Ui24=���g�8Ռ��[90� �_��WY���Rv���ZX[*��k���e2��?_�9����딀�L-�j���\�����H��~V�	�}���ߘ��U���A��N�Z4n�����V�70���4�fBeK*9���9��J�=
�xƉ�'Ȝ�=~3p����eZ^8�tR���*���~���E�S��Յ��g�5�wr���.�}�o����}��w{��z:KNc�|����Vg$�=��6��7�Dh{�)M��9�Rm���k���Â1����)�`��CD���R%O5����{.{��?>f����H��ե�5�wƌMV�����Z����%Uk�mp��1�w��a�G���/�1�uc��1��\�,tN��ԓ��ŝH��:�q	���f��ͧ�V��˰T
��J�u�Ff�Q�v����|��ޔk����l��1K�$i��,R���_G@c�W}~�Vjܘ9!8�t�RF�?@����u��# U����y1r-��:���i�9�K��|U�lE����_    �Xc�q�|dխi���CR% �ُoj�F>�+��Ru*��^6FO� )��)S�hm�H��Sɽ�s�����0g��S�8U۳�������M*���\ۍZ%n�uǩ�N}S>=Hj0��k��\� xM�F�e�(�8f���r:�HLQ�a�Ƿ��t��	�>��)x��`��!ـ�<x��w��H�Jȕچ�lC�&����Ne�֔h?�o;�W�&n��4��Tb��-� ��B#9����/�&�ӯ��E;����Y{}M$�X�t*�2%������p|�hu��bX�խ�v++������B�o��/�g�������p�����	�?�&�T���H�7��pl��R��J@�(Sg�E���LR������}hm�_�R�����I� A�7R�߭��������[�5ߌ��w�m�aC�������L���k�_�>�_a`��J�ǂ-3�]3à�E|E��3�z��F� �ތ"�i����ͱ:��j�����/�\`�[io&��lݝf����F��`�?�D�����?q	^l7m�##zj�����,功��U������_nv�����r#�����E\���(cy�ZZ�x�۰��c\�\j��r<5.�y	���>6�t��UY����ٟ��RY�9�N�r�@�o�՘}���z~�9Vo6*;��*qY V��`2�wik(MBP}������K�Y�H��U�iRN�@��T�{�=.~��x�zթ3(m�1��k4e��T�O����C�Q��f�]R^%j4m*�'�n�͵��x{E�'.�S�L��:5(G�9�t,��q�&;=���O�?��J�Y���m6.J�~��/���'��$����"�70���n�I�k��Dڠ���Z���ո-���O�v����hT&oQ�r�!'��Gsx|������l/nN<�=�ɁܶTM�3.k�*M[��S?A��Fn�ǲ����8��2��`���{*���@��*a����ӅA�\c�����M�o �f�r�z}(�i=� ���W�4�
W.g���
�FA�o�nע��kg5J[q4#A|����H�&��$�XR[�ev��!�f��UE�~�	}*��c��S�xiRd�qc|���$��/�pR?��r�c�!k�����G���8d��-i���&P����!�s'usK����3
�5�q�*�� F����i�#Q��uI�ZvrZ�N�ް��m8�z2��LU��z/Q��ݜ��`�F�l������9�|@����ZeI���.���)�i�F�z2�>Ǻ��V��ʆ����.HE�~���N30��ъ+p�P{ ؼ"=�m��J
��."��x\����j�7���Fa-�qO��k�^zFɾ���ο�!�H||1��kL�}Y�Uɽ�����nP)��/���>��oP����wO?-*�Sk�v����7�?���AYF������-Mp&�<l�A=��˧J�v�?�am��mg����#����4��%��A�s����嬹�)&_]�\�J��iܕ�����1�J�7U^e�������e�
���)=�?��4V��E�QO6�gnu�=�W�]� w��� ��E�ٍ
���:&��-U{w��sz� ���W��	~����i���b�i#��S��q�1#ƭ�_P��~ �o|��#v�\@�$����1�1U萶[��]gM�,ճ��a���!:��0����O	sU�8��ŧ46���I6��`�$U��&�@|ϓH�ھ(�ͬ��X��:3��҃��Y;ٙ���O`���o7$��o]"�R�U�[�CT%9ڹ�J�7�v�,7�?�^�����2aJ 8��A��g������|�bk7�:2g�Ν��-%��|%G~A`R�����OgI��8UK�[+}��Ҝ'���u�o`j��d��1��Wň�4%�:����"[� }������I���;�W���{e��g�$�t�� �i���������U���1��V*k{��ō�#�� 0��sc��G��Y���1�&��`����U)���c�a��;�+X#��i�sr����]���ɗ� �T�z�>�@3��ˢ�U�9bh�o��ج�ߘԬ�O)r�Uk�{Ǒ*{�s�0��Na�)ۂ���|)��j���ȳ,�w�[I�ܛ�:�ф1��#.� ǘ/��� 9��(�\A�A���yC߮������G�m�brB3h57��Ut���O`���#Apg�?��8|W����W|�r���30����W�T���&%@^�
�)N��e�Q��������s��nLF��Ze��+q�3J+'.��A��.Qą�Fca(_#E*S�fW�Sa9���$��o�0�i���Mu���w>A�\xM�Q���;�_pc87Hn%,25X� �E��.q�v��jNj����O`�Ǭ���{]T|X/uf��G���"˜o����T� �Y��]#-��Ȭ.��D,�ZZܤQ���Dʽ�7r����Z���Y��Toz�t��|W�`�����&+�A+=�>�`���p ↿ �J�T�+��hÌ�J�J�b=Ï����U�	�7����v�_� ���De����Q��o���7��q�����^mP�t8��"�L3[ܠ䔣1�1�{����i���D�3���ǎ��/H��"���������s�/��?��=�?x���QJ�63�Y���&mH�_��;��߲��ɋN�R��*{���[��҄�=+�e�j�p�Z5��||����ɂ�Mk�Ƒ�r��<ߋ�)���?tj�vF~{�1#�%���o�l��s)���)ɨl��̉����)HW*�iV�{���TG"09����qM���{�?��O��ܙm��\��X?����_�Er��O|����ظ�YR�lq�9���vZ�V�Z������զ���n�n��d��s�Y�Ho����#�k{Z}�'0\?�Q�nF�fS��ek��J$����P�lr��)���}��;w�f'��qEv߁c�~)��z��>�In��� ����'0�߈f7� 7�J�h[K��i����ǽ?~����Q�1��9��Cq*���3�TG�mÂ��H`�4���� ��wc�-��.���ՙR�==�����Rm�-(4w.ϓ�Q���5�6�k}�e\�k���"/����Ͳ�������g���^��	L�~oUo�O�e�D�)}$�;)>0��ݠc���>�mق��ŧ4����@�
/UF6��M������������y|ER���E+� �pp��y>_�rӈ?*��?��z���kdݒoB$ߕFi��Ӎ����0T�\�H]�ҟ�5G�0|�+�/��zU�ۻ�VՋ�;�֝Mہ5�GT%�'���@2�*<����JS�+-�C'���iz��mM�z$��c8���]$�ڇt^R�,uZ/>�,S�Ie��ק_30_�t'�e��K��K�w ]5d�O�#�?|	��e4�"=ʍ�ߠT���#�9�\F|/e������~�/��� �h���=Jd��˭��g��̓tϷǑ3.�o�&W�߸q�Y�%�ߥ��X���`F.�:_&�
������Pwı�Z�cqKLd��ׅϳ��b���~��|V�;R��Y�a�-����O`*|�5��Y���ϒ?N.n2�m����[�6p�	��']@o����X&�Jf �yc":��R��l~��;�G��^4�8�	�,i		m������Ľ==C�a�	w��ᕹ��4��[1��-U{Y]y�Ⱦ��n�O`$7���]&����$7�ᆅg�l:j�Z�W�E1~��=ĥ�ق�����U�{$��%�_���^�� ��Z��8��Xh%p��4��G�}��|��<0��8�RX�>j���A�{��;��v�_pc��
�n����v�.�-��k��幯��{\g!�_�3ov�Fs�yY�"7u�@��Dy����M�wq#0$��7��˩�T0e�멧X ��x�����    ���#�����AdW�'���1GW�10��AH�`��*���7�kT
P� �3zj�����G	oϏ�E`���z3��F�3�tҍsǁ"�q*�M���}*�@��8��N+K+�I��C|E����&�����S��*�7J��O��1Ks�C�iJ���[����͟�ħ�@���'fo;�M�W�����y�瓯�5u/�fD*2���PI��4s�B���;��yJ i�`�7)�k��ے�4u�Q��U�oڝ_6��� ��Q%l��qa�D��� ��5��S��T)��̈́�J�j�� Q���_�Sf@^�����q!KQ��ѱ�+��"�6O�(G�=7�vk�<߿�$`�7��fs�P�97�-2�V3��^6��G參Е/X3��z�w�m�:��ǹ^U��}_-�E��t _��ۦB)0�7D�c?�,	c �q��8 u��Z�3���:���SH��q��fB*�]@*����z�Ŵ�v�Q�N�癒�^d�v�
��-�mOY'i(�\�2a�Jz��|��T�V�F���DG]²fMS�H��ڛI�e�=-���(�$o����Po /�O���`m��Y[���R���V�^�q�^�w-��J�@x�t���R˥�э#�ܠ��c(�	�ħ4�H&�Yv{�*}ǩ�T�H��;x@d[	���A�ay$_C;��W����}��0rM������P�*Y�����3��K~I7==��� 1T*v.���C*-���E��7m͊t!��S���V����l�$��fb3��wnZhb�j�2z�GI�e��<���`:c�S�ŧ��}�:5`���t���Y.6���b4�@�Mn��[�GY�\��RzΈ�	�5NZ��^��wñF���%�b�Y0��8J�^n���u����)�x�ċ�0Lvc���� xw'�n�oe`����1XG]���N*ҡ�G��Ԗ�@����	Am��f�9o��D]W�U�ѭTι*�\�������r�R����{3��m�W�cXT&�v�ϗk��6�ve�{:���,3=,k�8�/����V��cf��dn�ـ#�Xf&��_͓�e;͎P}����q�vŕ�OO��f�s�`��~�,����|~\�	������K��aIۧ��t���W�4g�q���>gj���jg�~8_��>*u�z}D�N������6�[tt���*io�xt�Ϗ���JN3��J޺I�V_�R\ר̶@F�<��#��i�E��{7Fk�A���FN�gc|))fh��E)�"�c��1m���ǜ}֙�J�@�9�F�$�u���'0�T�n(���7���8|P�{j����1��7��.:*�]`����麑=	�����^'�N]bs��n;� > ������L��{=`��ϓ��w�Z�ot�ї�2�3rLӔ��S�Ht�l��G`D>n�D�T��#i���胋����e�ח�R� ����rZ��"�j���k���O��!#0{�+�l�� �9��r����`9�=n���� #0b�)Û�H��	�Z�ǯ<�NX����yU%���)�ԋ����LM���A����Eo����O`�>�W�}�]pΰ���� �/I���P/ju]w�#�b�J�?�4شS!r��p�� 5���Lx��A	�̸1yY|I��>��y��Ps�B�*ޘqϨծ��`DQJWe˞�j�������Ts����M[��L�G�-�}��։}i�����y9��̖����#��(c�,����O{@���<��.��Ѯ�w3PO�@��Sj����X����mG���, .�bTU��9)v��cͶ��z��9F�߳iN��ܘ5W�.��T�SĽv<��y�K%�fR��Sj=n�I[����:�E:�6�~0�7c4E�[c��������9gմ��ǭ+([�_����.20�1jQ�.����R�;0��zE��Th:h�`��G@"0�W,�7�T�{M�{��"0�ME�0��}x��<��?�E�F���3����U��k�O�X�}�M���T��J,�W��]�S�u����H�#�|��E�����9Ҭ��Ь�'�o3� �ivi$E6O�=�zۧ�o��\/>%J<���t��nZ��]�<�c<�̇-0��3��������X���y�߮J�D��G@�]�����������$2�<_E�9�����mH�u�E��mDU��VQ�Ε�3��v���"r3Mu�Q�x�T�)�t����q�u�&���t�'[���z"eԶ�i������������=lx��t��ksS�`�{�B��?��\m�7���-#M(�o�8,rL5�ء�I�70(b��ڴ��)���V�i؜ʶ��h��U��m;�כ}����
��9�+ŎXY���e�yۛ�'0�4��͋|HǈZԣō��(OQgZ�IoO��X�&_5á�0������� o��j��`���[��&��M?f��y�H_q�8D�]h��v:w��#ߖ��&7O�[:��n!�=o�)�Q���=u�㳬��p�ku���\�Wv�*�o�V�v��>�i���-0ٍ���4��'�Ksۣ����P�,��E4ǆn�c���.u�Y��T��n�<����XN�Cg]�^�}/�"&A!s[�����,>�7ąZ|H�v�z��u�ԖOY���.��tM�����70,��0~Ô�r,�f�U�����sr�����vc���R�F1QU+:kv2sZ^�O�Zz[��+��u@���)��m����$�8�s[`���M`��/�1�}����f|73R�)crvc�ǧ�ޝQ�z���<S�(ؙc\�<4F5��Pϱ��1�bڥ��u<�x��A��nLG�k����I�R�@�'*6�y������
]ܘN��H�!�1�Jx<g��<�`�����O`,e�Dn�G1�J�WO�\٥�N����>N���O����(?��a=��N�=�
��:�y�oF`�oT��*���蘭�ѝ�</��#������yd�a���!�ݻ�F0�qi����k:|�B��u�F���U���Ƽ5��v�ņRg�����p�p��/lg)c�sAP�������Z�@�>?nh�L�e����ے�;�@H;A��1������)���{�s���Jz�Sf��\X�����^�� �.�T�o�����C\��[j��5�
��Y#�l�����QP����K�(�n>B��|1(PqE�A���~o�a��n��g�t�0K���{����Ӻ�/�1�Vj7��]m�o%B���I��(�:݆�x�K���:����u.�Q�Z.�p�u�Q������F��ȸ݌߁U�]�|���tY�s���*�O`"ǀ�U3f�"�,���r���*0`y�8*>� 9��V�F�@�{O_L_^���ÍA('�����ur�vcX�8W�r�Y:��q�"�[���_�~vѱ�lC6>"�r��M����3�F���w|�[ׄ1)B7~ţBǲ���ń{���.����BC�W���d�yZو����v
F�}�	��<���G)�x�l��e� Uوa�%KutA{�C����n8��|�΅�C�E ��Uԥ�(��!0��Hr�cN\O�f;;��ʽ���m0��߆���votQ��E2�1J��z�S�.*JV��s^��x�S���������H
�#�bdX�� T��}��iO�p�F ����uRŗ)�R������2�ןg#0⟪��*͍pf������� ��Z���l��eU�N�8F�$O���{�tp�^N�fs��U�;�
pC�T�d�gj��z��G�������<���w�B7�U���_�U�t��]p��T�R�o�X�4�zS��-5��#A�gQ�"�xĸ3��>��Jl��E`�>cZ�DV�鉮e4hjf�^��|3�2�P�+{2^�g���_��N���A$���KD�J�+؍    v|)��9d��K|]#%���L{>.����w��^�>�f#;w�����(K�QQ�M����8���7�Z&E݁�|�d���H?��a Ń�C�#Ԙo�@;����9�zq�Y������C��4�������,'gcv�D���3������oL��|T��\�+`���S�d�k#7p]���O��m�\����6DR�����x0��6��&w��A�ꁭO)���OFV�bJ�Z�,b�Y��"7\���y��`����B狰m�����>���N6�����ϜCj�YbU�-�׳Ta���>^�$��qm/9/��]�x�����G}��.���J�f' <�ME�@Mw�$|Na�:��}^� )g!��?Ai�\W<�H_�`�)Mɩ�6'<�)[|1���,,���)tzp����^�>ܹ���_�P��`72�I�Z��?�p��J_j������0c��J���D�)���Y�b�����[`�Ƿ���qB��G��r����b��ʥ\��Y��O�a,g��FOg�j�Q�*gc�Ia���	4L��I�G���S��Ͳ��t��RO�:����J\]�R���0L�XÛ�?���8g�]jv�*cj"Ҏ��u�0���k���h���Ӓ\˨ɕzᵻ����J��TP���P)�yS�5U��0���+��y�\s
5�sqc���)A���6�Ջ�99H@���J���W.&���
ٷ�\�'ŝ�P|N���3~�\sO���i�ڎ(�3�z�ڂ��~�W4k�O�d���
ܬ��C����#w)	e�!^R�#<����!�;&�~|�z�^E�H���J��\&��Q}���0� ��M�];ڴJnU�����r[-�m-Q^����@KA�n�$���B���:s'�O�1�� ݯ�Sz�!�E�*����779�nx�v4bu���m_�U"�z�|���O�hș�K�*��e��c{�11���n�]%�j�֑Փ�^�h\'m�������0����M���� j��Փx:�mi��G�X��Q��W���)�-��aJ�Q	�㐫�������(a�O]��6�+��6[Pl��z�KO�����D_�k|�}L ;K@��ک m^6V�L��a8|L��YY\��(g�J�(�h�U�����(��|H�\ �F�T��cO���[*�c?�{K?�ߘ�|��.|,�����O%̤e����޳I�U0�!�%8g���w��#R�@ya,�JX��y*�Y���f���XV��lv���L�ة4��~�ف��G�V�0��Q�Kx�\��)[���!f���0�a�+�;T����k�l�@��ˢ Ig�~=��i-3x7�1b,Ud�\3��S�UV�,is_�3�u��w�{���R�݊����t�>�ҵ���&��y�^ �:�����e��Yr��nT��M Ծڣr�"G��s⻒˷Z���!(=5YixĤ�aL�q�0��(:���Sb����H�jH���8X���E6s�0�*�]������(��ZC�#_g����	c�<r#N}�������;���r\W���_o�~�a6��pZ˪����2c�^��\��p=�|5�����0�6�=
{�|1���;�q0��~��Si�]���E.|����v{�*����P����>�=��,�J�Do�\3�*�K�fb�kw
 LCZ���lq���MΠ�s˱\Y�=���q�s�;���>�r�+�͒up���93B�8WYxv�<��_pc"*9՛���刔-�!�������p�y�k�.�-�ҍ �����O!�Av?���N_���z]��T8�H�HS�5�^�[pvHu��Ӏ7t�@z���7�%Y�ѻ�6V*QL���ʕ`�g0O��Ǥ�K�^R������;�1t%�=߅�����Z����i�H3�iu]{C]e���կ��?��>��۾����*�k�#��\�%����f�-8;��ܺ�ft���{J��ˌhʙq�;�E���|���o���Is���g�\^rm�S�o;5�l�7Ǥa�W��Y���h��,�s�����_v ����_�g[��:�}2��7��v��G�Ƈ���SY���|=w�~T�M�f�q1u��=�}u��]���8�;��_�+�a���W͇�Z?9�q妊�NL[%>��h_��`�0�2��7Cgre�hA�<��u�X�&k���}pK����J��m/��ʄ��VS�n��q�hn��w��a�"��h�S�+b�P%���XF'������0�|���T�U�������B8��
��P��/��ǈg��0�M�� �y�c��i	���i���RX��%��&�N�@9H(@쐾ʑ��j���4���������.�6%�2l��)������4}��^��	�����DD�ӥ`�`?nT�1�~#�����.��qH�:r�h�F���i��$�"y�ss�Գ��Ws�wo�l�G������0�w]jS�p��1��"����nO�í�=��n9ko�t�ӥ��mA��N� �z �,s�������6rS�wk�5������h(F����~�]�#�wcmE :;�oA)c߽��8�Wx�&�\�Q�F�U�(n�`C+�f���wp��z�K�J,�p�q	"�h=��T����.�<�d+<���& �L5�gġt�Ӫ��T������*#��O�S>,5�.&���]O����؆Ǎ�e����_��H�dqȠ�l�ąc�.J�y**>DJ_���rt�Y�l��������U�/,�g �LͻȚ����5���&��I������L甈lS��
��V�0ӧV�F��<�,)���#[���	���9�؅�F���	$�s�y0�Ҭe�y� ע��ɒ��WQ)����˜-���ؤ�vx���y#�v��|7\���]�� y���;NUe�@1�'��H��d3��#���5��p9s��}��}�d�A�a���@t�}�C��RS�kY���
0�W���{����-a��;M�����?��#nW�p��n/=�J����j=��o�1��&zQ�'�7s�Iv27]n�Sֽ��ݪ>���d���r;�=U<�	�P[�s�.yP���l<���[o��z#��:�ɮ%�ӝ��C���9M}>�k���t27�nFZH�!�V��S:)�u�&bϯ���?�ET�S] �]�쬷i��̈k7g��z�6C�|-o=�#(�Κ~�aI�i.�M4����1i�9ߴqPi�c%��1��1���ܫ�Z�	�aL��?��n��Aw�`|�F�
�6f��s�ն���K�+��݈���J�+fSC��;%¥�T�s���e��0���7#�}z[nq�LHewC�[�����q��y}-�5'����`���~5�Ʃ�E��2���S�?P?l�Un&��A�Lu��i�SowGX^�M�̞�JôO:��~��\w�B�)|��^q4��դ���|��1������.�q�N���˞�`��p��]����*�a�Yh�r�_��#��M���=�R�V�A���	�4L��:݌�h[��,���[�-nEϩ��Τ�`�0�Ui~�r�QxՆ-%ug��d��ZϷEq��d���DXvP��^��r��N6��^/��a����,��|v.��$Z9p��T7��������jc�*(��t�eq�'e9dz����C���0��j:^���n�+a�j�m��PxH؋�X��>�5�ɪ��� ����#X2f�S�+��� �/$�[}'�7m	]�!R|zRA��]ߙ�ܼNU��<�?>��MrV[U1)k��M�O���o_#������x)0��ȑoT`�v��-C�ך�F�[�K��b�i�H��_Ė M}�����葌�g�VQ����w�~���ޞxw�<R���1�J��Z���3KP_�Y��z\_o��b��(��ɒW����iJr�?�=�_1�o���W�p�X�m;� ���7F    ��|�=C��o�y�ʎ��;�F�Uw�p�ew��'奔�0�Qd�7�w�4��K�J�5NC���ɠ������)O�d7�AǎO��7�{tLs���t�����_��7�7��xh���G�q��p�Ds<�WF��&q����<���܊�だ����o�p��bE�Y�p�����0ģ:*A��@���_��,�*�z����R�B�rZ(���fj�ϗK1Sm�To����@}�
׌ȩ��ŋ�ӧ�v~��|JPo"���|E�Sc�)k��c񐺞�� �30��M�6q�+��Ȋ���
Lֽ�yG�UQ�WjX�[���X�u˕����FF5H����/`�m����7-�m�����k��#k�Ee�g(���p�����^\
	`����l�]ƴ�ص�����}7B9�!�*�7��:EG�.�k����e��=&0�/0L&��&�$^ڨ�#�����yo��)��)�4~j��Ü5��1�)M�f˽fX��<��x�	=#izէ�/��ɶЬ�de���9v�_��>5~��8��ɼJ@��Sz�FXu�/	��<����J��oV6?ݰ�#8�����T�����7L�՚�Ņ�ۂ���l7�3�s�1�X�2��xv�O��bC2����M�"0�M�aAI�"lX�.&��	ڕX�b�f5W0�c�c�n�4`T��Ø�k�!����X��,���m�<#\s0V=X����-E����>Ƕ�R����f�{-���-��|��e91��n�u���X(�Q�ICȻ
'�̧��j�a�qc��U�.b}zQ����8ڡ2��P����XZR%�\"s�u�6�"bܑ�-�[0�w���E��E����v�V��a��%�յ�im���s*^��Enߥ�q�&���G��୔��8�:��Q�<��*#mj7}�b�v�+�T[V�r��8���g{~t��p�ٳp�c��b��ĩX����9<l��� *�r�*|S�4`��Q2�0P��6�u2	Z)���1��� �F7%��7�����l�SCv��V��`�|����p��u�4��� #pw�p9[���5��/0}� on���*�v����#*A+3׆G自�g69�om����6ߩ���2[YV�8��^�}��|L.	���7	<!	&��ʚ	<�%�@�݈�V��|�%g�!(_	����v���|�,�Av,(��2?��qn��&��2�L��J���s⬵}�1N��a2��t�g�n�C<�b��,  ^͞�epN�$�q�a!;��т!Ȼ|�}[���B���u����D��@ T�Q	;�;5��s�$j�[X�(��[�<�5u�0��Eg�&��r�̞��<�S�A��lkx���u��w��nױc;�Y�9A�5�����%l�	̯kW�a RaBo2�tΔ�iq�E�b�ΐk��::���E�0�},~	���M�'x1���QQ˶*߈醙Y�;G�t�!�Z�2[��=�3ZN-jY:�6��'H,[��֛B���KH�=N�Q�@5�q�`|�O�Y.�R����lQn+�v�oj��B�Nۙ�?��7«�;[K��v?ݪ��jsA��:�y~���`��q�cV��{�q�T�ͮ3�J��	��ޯ0`��Ӫ�9���E����yc�;�i4��n���,A����Vɓ���r�Ѧմ��}�������r��l�<K�ݥp�!��TM�:���j�
�����?s��t���k���t9�z��}�"�.|��$辰��xJ[�وY!��0���k_Ä���|%���W[=�Q���b�s|�_������B��*V���WFG�ey��28��@��i���baL��~S��G��8�I��]Fϴ��$�q�T��Drś�5�)s�9U�{Ғ�(�u���	�HJ^Zܗz#.�c�SOA���
�h��}���P{�}���R.|L��/)*q�$���b��w_�?^!�&(dP��JV�K�!�� �&����΄�a49d�^���u��,��G|�<���	��q���ar�/�7�<�K�ܗ1YK����s�h*�<���5�ǡ^���b}���ռ�Sw�w�9uC�_��o}����,+�g��S>�S�-�5�q%�ǫm_�䨒���a&Ym=H�޲NP���@���D��J��؜��Ǥn���+��lN�lJ��hf`���v>�k��J��.����@
w�S[鴥�P��Š�yi����J��� �PΈX�dRd���>�|T�ɉ��7�`o�,��Π$L0J7�"���縌_`l�j7*�:7k_�H���}2+�87/��1��/0�����h\�E�8�.�o�ӊ��^����7L�!}���f�]&�Q�W�pp���'%m?���ǘ�ͨR�}�~K������)����]�%q�yI����(�+�s���������v���T�z3Fp2*�.GF�>/s�,�܎���0Ƅ���ӭA��ʀ/�`J�s��fvŬ�8��؇���O��t0/�'.n�A�>�h}���N��0�>�R�����ƻ�K�z����gĿ�c΀1������aԼ��[g���r,"vA��9bu�:Ĳ��2#OQ��:���Z�E}��)+���N��?����4����-Y"����
pƙe��-̈;=��₍�|�2���>3�j�.�Z.G���24$ �ؙ-�r���tF#�8�L��ɢ�
7�ۋE�^ � "X<�Ƿ�~C��a�&w�S�D�ӊ�|��g�~5�]��d(CA��%�Wi3���4�N�l�O���`�^��o{s.��Ѹ[�O�>/���UF	�����tj}{���0��g.�DW�R��1��-�T>�����|.HrS7�w�e��膰K �9���:�=������M"JEDk��'wpH�s�p1Ӳ#x��z�%��*7��L�5�S�r�;�^�U�J���P�Myd���Wx�\��JV��q�s����Yre� �u�:�	,��r�q&��D��* �'��.-���!5C�i�2���ß��.�yF�K�*�I8�)wN����g�c�2Ե�s]g���>��0�i��I�+��.K%N5�Y�a�\���<���!��sv�4��]6��1�]���O�K�'�����\��z���WN�`ǲ(�E�:q��zGT��G������C(l�&;���흧p��\�x����%�z�y�:���I�^,��T�Y�_`��������6���W*�w��$5���7L�(\������3+��.u��S]*�垯��a�C�)���N
m}K����
��C6�x����[��$�����l������y�@���8r,�/0�TҍX��3!�d�ː�(���mS�f���>kj��]��/�}���S~ ��,�`x��I����v	f�j[��ʣ?�M��90�X����AÀ��(�i_��ێS�Y{Ζ��g�����3|��a���p�5F+����ldn�b�!�58���7C�A��`���;\IQ��o/j��=( L ��z ��j�FzS�t+Ș�7��!�bp��??M��ɡ��7% ;�h��SX�F�����Z�:�M��'`<��������:��u�2���vN]Ϧ�sTa�O�$�xI�>�̽�uf��JIi��-������Y5�� ��~v�����,=�-L]t̸2�W�0��9��@��y��0���`��^H���|�!��^�.m��7�b'��u�Th�\{�K\�w��a�S5-s�{S���.�=��K����v�к��L	��.蠶�o��3�ԛ͉r��&sx�u�I����`�U�Fl7�>��Nx�.���kU����>��L�:�z�Eq16zhl˾� �Sf�C�Qy�A&|�6��j[�lT� �4��=��H�8�����1�|����G�@�r��"�:�CR9�#^	�=_��0|�� �A4#.��W
�̔f+�یӹ�=�R{+@�͍��    �8f��T�ع�:^Vu`�1�~>����cHo2�Mi��#8@�d�F����"y>*a�T7�������L-�j��lt��S7���/�1h��I7��V��[9tr���4ײ��6�����0L�kʺ�E�
�*.�u��S�A	����;X��/xJ>&0�������G|�=�+;��2로�q�J��w�ڍ�����S(h�D���a5_*(�{^F)�!�	� wK��c���Q|J�3�ޱ���ox��w�,���,b:&A�.��9��d���m�s�?�b���I�fE�[t[�<�uo;;���7�+�<���k��j�7e�J�w��L���J����˥�~�Ŵ�� ���S2܃�{�;�x3��{�K��@8+�+��l��n�bnF�0ΟSH�dNf����j������c�ajN���h�2�Y�o'��2�w��:T-����ܭ�o�U�Y�mG�,��{�����Iz�7�����A��t�|�0.�l��SQ@�qڊ�4G]F�ׅ�0��,7Jm���X� \.e��s�p[�u~�H Y��f�ި�,��m���u��x�Co�T���BMݭ�.7�/��;��1;{R_*.�*����x������W�u+y�V���=(�M��چ�<U���<�|(�{n����F���[W���l��3zG����7��W	�]�f���5r5��+��-;�-�n�SD��3.�����7-S*$�:��n����:�ոo��_�4�GP����������V��Ql�h��y�֨9����fe��`=5��z�k�nŲf2���M�G��m�$��k_P�Z�8G�5n����=i����BF�@rUk��;���zi�Yq')�x[A�䟣��3"7�8\�'��Q{��k���n\`�ĺ��uo�.�@ě-��h�2F<�5�6
{�`�������"�����OC��>�3��������맵�o���j�;z�����Z��J'�
T�����<N���U�-�b"f1��T�[�K���L��G���Hy�YtlY�O�2uPK�`9Վ���}<[u�Fsl� �;,��W�ӊ��-�*�f�h�]��f�Yu	�[j���p�2r1�����7#��!�7�b������W8���2f�~�����W��$7?����L�X����CY35�A��|�hfYB�~�|�Սmp|��h��
,�D�7\���0Lv�Y��1�ˤ�*G4�ou(�x�0cO�^�~~�櫄��WCj���PY;�`gR���_�arMc�����lc��Yz�	,M}f�CuC_˴>�n:ҫ���
�Z����
:��j3w��A~�a��Znd����|��@��_��t$����z�j�i��^<%��k��D���^�Z�'8�?_4�,�ܴ�V�c��	Ì��gc�=�l�Wܛ��W�����y0E<��1��\77�9���u�zo��G�=��4h7]�'>çA9߅X=c��9HT��#_����\�@z�2��)J&9On��������1a�T�+�u�g�Ԝ�oqKJw�l�\}ڲ�~���0�N7Cj>�2f���2�\i�,5�#{p{>���ČH��~�5zc;V:�SZ��O-}̚��m��i��W����NT/������t/R]:�#.�kLy�{�5n7�5�����;X�%�Թ�($� O͝%����a�]i������R��r�Z.&	4|�4�<U�J�Z/2�{�����4��#p/�������b����!a����۳L8��%�xܡ���`ܥ��Ti���޴0���%%D-�.qD��RK������8C&��jۋ��c�å`���xN;u�ױ?���v�zj��\�@*�j
��T)�![4G�1���s� ~L���[UM�*+kl�����E1n������1Io�=a�š�#5��©��|	���}�|��R��>}�)���K��^&w��!���b��7����"�Y�'[�879`��#he@��z�.�40��\8�G�����Ez�*���5m1G�&'��f#,�������ma�ɂ\<�� gG8 �M¡ƉƜ���Q
�4F��]'�8��*T��j�Wʪs�M�q��#.-��1M�ƍ����3�]N��nj��e��IO�T�f��ڀ��i�wƄa�>�;��Y�@)�E�(@���⅏9}S��@8�7��a�~�կV-Ȫ�m��m'�K�Ҫ�[���<�ԃt�+��ZY-Kk5��je���0�7~�X[f�5�w�b`�qU(�4�� ���P8_r�#|����m.�~3�����X��p����gx���*��jAi�4�`}W��qA���� k��#x����_���w�e`����tq�������l�ĭ{�/��'E
�f�b��&�TK���2�L�]���y�������]���{$K�=W<j�u��EG�u}^&3�Z/
J���؅x��5����gj�����.C
��4�����\ȭA3%�ch�C��Y	��%�0d'Un>��r��������y��3s�.�-e�{�0h)�J7�����0���0�TZ����Z^+�kq������������������M�AC]w���i�9j�V粲����2Q�������?��������G}���?�ӝ4mv#�Oc}�\��s�g��K]ZHsW,�e<�-�����+i��7h����7�p�-^K0���m�]&JA���d37�t� �&���siMS��r�ԃ��v��k��?f7k�V�͛c�3�'����pp��~��u��0���K���w���Yu�\,12�BQs[R�"{�g��0�q�vc�s��U(�a���]��������ml�5L��C�v�c����] Gl�?� ��E�@�ьz�0�j��7�»i�#pL=�4*n}�����V����k�\V�n�l�xu��N�X�i��u����_�4��d7��pyeI ���g�S���(?f3N��/ӧV� ��="��Rm~�S�;���:٬�<��x��_�Xh�n�X�=u�*���bJT(l��S��4XmpscƊ�7��M�Ծ�	g/З�-g���_�P�4���`q�_aǕ\��;{�qe�Y#d�z�0-,�^؅��-,8d���,ZjP_"ۧZ���|��C��z0Gp �Xf�nl�9�����u�Ns=�b<��A{nP�=����9s�s�e��gXG�[�ޱ\�i����X�u�5�R|�S&�p��v7��0�b��n6�v$��ή�{u�2�E*�5�u��R_�0�K��0G5�r�ݣRu�h9�U�P�8n{=VC͜x�*-&���ʕ��������}�x�A�w^��즥c��!7�Yb-�Yz����}o�������m�Հ��ru��(��.��{��,�o����g�����|}o�T(b�[S��1�Ĥ]-���y���-q�3�h�M���z^3��C�r���z�6�q9�u�
�l�A�ܘ�Z���E�q�6n�����J�8p~���`?�|�}�F��f��@��)����鮲F�mݯ3�4L��9]-;Z���w�w�;�N�E�~FD����07	�^8߶�H��2)�����v�T�^����z����Q�'�ʷ�նS��0��e�Dro�Z�_��5x&���>���:s��SWjC�l��U��&?��Ǹ �ݚin$T�N�>��d��Uz=���ap��;".��s=��֝Q��α�n���<���I��[9q$��Ʃ�&��&���H�ۯ��x�`�n"4W������5��<�¨��}�_��}��oJ����L��ϵ�ϕ�|zy�����?#z�v�uC-H�rvKo5'?�<xz���!a��#���$R���7�	e��X9B|�[���h��a�;���aݾ�R�n=�t���g�����Q%����`J�����ȮQ&b���M��y���������>ܸ��2@=p8Ձ n���w�I��ܽ����R�0W,�̋�޴�(}�l�0�f�xD)f'�����f���m��	�|1�    ���yq��_xZ��2�M^��F�ZHr^D"p��C&��/�_pc8cW����)Kr�i�����	㑁��������jJ�^\c�ya�W�o��@*�GW�~��U���u�p��Iў���q����p`���۾�0P? $7�˳���Δ{�↣��� �<�TZ��Z%���GC�2G�^1�Tl/.O�g���Z���,O�GE�T��O���X=U�\.�|�	��G��������Y��n����s��Y�/&��gT�7�lhK���4L�����b��������c�vS
�C�w,��|a/A	��=��N����n�m����juC��GϵaY3;�pW�:k�&��d��+���@�gY���Z[P�83���0�ǀ�ֆ5�#Dhj*tT㬀��!Z�����S�N�7;���9(�F6���A�r��#s/y\���.�{S���l5������:#�StA �����6�0����Z�W�1!�mq5Kٜ'����qNG�7J��GE�*w������6">��6~���Q�����|��za��Gsl�15Ht0�]�u��n��~�����ެۈ30�TA)���@��QgG���&������酃E��0���38��sz�0ȩ�}��c��*8�.%���l �ڈ������pa��`^��k#Z�J�v@^�*�Ku�����St�݅�*�����S��E� ����}%�6���n�m�Z�fhZ؇�^{���8�Sۼ7�q���K��>�ex���ڮ��Mܻs}{�
�I�]o���$��+s��"���D��}9��w]k��-#�c�TÛ"�2tH���4B�| �h�dǴ���^��X�c/�`]���]2&�C�-^��b�����=I})hWҗ)�@����
��^��~���C%��~�]����&�;p�d)�,N5w\D(,a���7����V�9H��^7���.�̉�N?����1LC�/I��G��~�jP�Q�d���Tjg���;4�{�{�3�]�0���Q��7�g6~>���T�l7:��f�YBj3[0�R[;e�j;ǩ��Z�?��$�vov�pI�b�����\�����G1��u��o$Nj��)�3�H3�hp�Y������0�~�jwBߓ�7�[����ݍ\k�c�������-���;���{�I��@�Fѣ�fu������F����E�\!<��L�U*
��@�V��i�n3���="Z{g�9pe�P@�8Όw����;�J[#��8��'(�5`s�u�8�U�⼏b�;K�N7�#k*C�LJAn>�D��[��6[8��52�0�R��j~W$�e���������s����~��~��/�� )ěyp�9l��d&�����>n�_�b��;���`�"W��ʴ�'AGK���sۮE�]uUY��5���;��*7�r����e��m[	ǣn����6����_���<���a9@��n�&j�9Lv<�l�j$�[�Q���f�'���9�eZ�h��\m����X�����R*�{3g���L/~U~Dr�E���آ\�Z���gp��*����6rf�	�_83���H��/�s3�t����a@>�9�4��-�f�R�B��:e��9��
S��n��[z�8|xX�i��:�mY�W�z w���ƭXg>�K�A����M�u�{eb�d������G��Y`��K���l�Mo�`Gt�V`�7�,�W=�UMשϷk�a�|���EHnջ�c��+�xJ�~���}��}^x/�!�nx�9���@s����m�p������� J6��eD��H��	/^����\�ѽ�X8^/ⷨl�Yo�`;z�3J���_���>ǽ����a�OU��6��řv\Y
K�߷qY�Di�׋�a�p1�z�A�U$)r�z�37p�R�����C���y�8-A�Sf����[
`���;�7�?>ǹ�ɭv�[vO��t���5�칅FuZA�&[��\�����\�K)[8_�ڕ+8,~=�@��r�N7���7�I����KUʶUe��_/��a�ӄ��Ac��0�䖫��r���>��>]�ɖ�����ů�1�눧���SS.,n���k�ӷ�0~]p��W�+(�\��|����m�!:͟w�_�T.s�>�)��sa��'2W0̒��OIR�D��Ű6�,����uVɄy���A�����w�S�U_��o�шʮY%��e8`�gf�WZ�}Ð|����i��fe�f+;y��5���/y^q:Ð2�h���j˧�3�j�%%�N� 3�i?�yU{�x����0�7u8�^fʷ�2R�/s����5^O��w)%2����s�)�a�7�^��Mv�~�`&;p+ۍt��8����no+(��3�Y8�tz]P��;�*����ȣI�I�k;�n�+��Hw�����[��F�j� x��\ 59���v�t����C�Ϗ*��>'Bd�i5#�z�����<U�Po����o�ð}*��ǘ���XFn�	��V-A����v^�A��կt�����X☣Z:v+D�&�k�뉪0�O#����|i%�LI�8U��T켟����Y����r��t���la� Ϧ6`�>"6�ރ�i�D���왆!��>���ˠ�Ek�:�~�i*���]n�/������M�O4?��,4��:Wj��H��M�] 's�&�m�٧�����s�0�����A�!��s�u@&�A��l>G^/��a�>��o�u�s e�w�'���6�]#t�G_�?�DT�T��\؇EJ�~Ro,�zj��ϕ8�5��B��g��^N[�ɰD�E�V����Y�nV��k�x��1 ^ ��S�l3�r�y�DrJɪ��^��[s���Pk#�9щ�&<��va��4�a��s!�n̚~ЂxH�b�U����]���i�
72�{��q�+7]宄�w��v�q� ��֒k��&�Kv�9^�I"#P�~Z!��F������04�zc���0a	�oY)o�t'>}꙽������F�%X���̆�ق45�k�H���\x��߳�GX0R�=w��Ӌ�8�N�:z��gc���?��
���[����o?�}9�T}oiA
^=i_��ʍn�n��%��e,��z���̞�28�?�>j�烙�,�F���������JO�{�k愯w�a�#An�@�VL����xg��z���G�=�.5��s�u�)�bٰO`���]�K+J[�m������+p�=��l�Y��˰0�2r��|~�/c��Bڈ8�T<w�_��t�S�n������l�	�N~%�(��9�t�X�^��Aw���z/YF?Pn2Q��m���ɭȁM����3�.&������эh��1��B|2۽����=7Rծ�ϳ!͹j1�7ygV�9,�4���P��F�g���l&'�@�$=hٴP��I-��1�L3S��~@�1p��f��\ܹZ�_�T�qN�7��&S:��D�C)\�p3�W��r�Ǡ{�����L-b?>�[<�NT��5��un�ԙ��=b�娚,=On���}Xk�م�g=.R�U�#�)��S"H�`���/0Z`��1�ݫG�9��Xg��S�|.6jo�/�m_4L�W�&n��W��y�l�t�T�"�UF��C��&%k~�V��	v8Sd�/#�p�4�A&{�>�sk\��\dU�.�)��a|���bN����Dd��1�7�8k�f��sM�+ �X%<�x}��ٟj��h7�z�4��r�<���x�1{O?Xd>�|�$A����� �Հ
���hG�Q_��f����}�@#ߴ,�:�E6�0o��n�6���yc����]�D����TS��1�)������?�#\e��nE��g����DW׸5���c(r3(���)�]9���ك;�2��9p=���D��]�.�+�E�?/�K�7z"��	fwO�O�}��@��H�U�4�Ag���b�k7�'����/xH�}Z    �������3x�,RP�!m ���Kˊ��_����w�` N=�u
�۪�(����gc��_r��������AϦ(�W�`6V��y�9&��j������J�2�M���2��o�W�v��ۢ,؏��@1�c��r��5�����ϩF`�i/t�C�FeY�z[�R�A!���.�'�'_MI���@��bN+~�dO9��f��>P���0)�����=����ř�����_�a�@ƣ�����N��K�!h�ې#4U[�~AL�T%s�Y�qh�TS�χG��*{�9Z��߯3z��nН̭�gM��p�'S1;H�kS����zz*)�9˅fE.AkX[�@��ө�A�8�}����T��:���z.c�(г�rπ��WO.���~���sS}.��}�܏vN�܎�ɽ�i����>�Z�<��,)���4yL��s�U�_3�0GA��Sq���U=E�W�)[#��T˯�[�F��х��~�3����O�����7��Z+W ����f� \jo�����w��ެ[�xJ�;������L�H� �Ǥ����r�f�ԋ�Q9�\����lsD%��1u۷�Tk�B�יR&��Tћ#{�m�K�-j-YRׁEuO^z��}L���JŮOT��~��Y8��9���د���K���M��9a.~<��[K�N�-�����_��?��jq��Y��4K-�RZ���&d�:U
�4�T3���k�������}��c�b��u ��_���M9�c�o/N���t��IU����_���a�?��f��DL�.�\��s�t���z���w7�ӆi��V�v#rB;�l��\P�2�x�|�h}��S�B����A�P�+� 
<���Km�0;9$Q�EJY}��{����쥺�dmom��;�zD�uV��s��B��_`������M�90�/k�\��2ƪ�h�
W<e�������dz�r����aN��%�@JHT֙�.��a�O�6��M�w�ٺ��LS������z����v��k��2��S��
�%<N5����%|L�J�/0�GHo��4��;[�����mwt�q-�[��(��_�N}&���f� W�ŧlw�m�[䠞궫��6�.���E�\�Ĭ���G8�$����<*U2�u�1���	3�/7-�>TC��ݗ10��Mo��k�$v<>>z�}����[���y�����1���}/s�a*�zK��O�@�|fk��0Ϩ�"X�C�@{W�F�ª#�te/b���,晏%��7�Nl("%Q��OUk�K��Ru�����BG�j��|nnc�r�-��P1=,�&��~�($���@����В=z��5�:x�:�j:yϕ_��<
3�q����qv*
G9m��Ҳ6h����g������n��x�h�{�\�j�s�VQ&�Bg���}�)�S_<���3\@VU��F!��W�^��� ���j|�M5���.I�H@�r��T��y+շ_������Ff��[�rߡ�1K�m��Է�kzn�]��o�/{^�g��G��r=F,�S�=x��c�>1|c�Wrs&�9ۗ&'�ygGb*��̗��+�jo��JF0�ҌUa}N�5��V���~o�1�|��Jǭ�� !�:'I.�_��q��^�����b����c�|s�-!�U@fk�O?�G#�����e�#��$k\o���)1�]�b;�{�ݷ��P~}x��jS����G�Nk&V����a);�����ϻ�<�p��M��T�sUp�s��e����e�d� `J c|��J���O�y�x�F`i�2��2����.�?���f
���3�θ��=&nV����R�w۫}��Gv�
S��mdc�9���n�������9�|q�}�{�r�pp�a�̑����Gok���$HIٚ����3�M���Y��Q1�g.*r>��N<��ojA-L,i��;[C�pT�}�B�b���t�>�����vڼ�x�5
k#��3��2��ۏ����W�i��ĺk��Ƣ�Fٔ�,i�7��Z?�\�����T�$QД�-��B��3h����XW�@scT�'����(��*s��n����r��B�n7�F�Ĭ�"�"��gjo�Mc���.��f�4$�r�ch�1؉�����ĕ�O���O �C��v�@'Iu���1o�!�M���4�'��b�O3j7�����(=�-T1��Vo(�����N5_��ȴ�<��6��)[\e/�����R�lC��g�����74f�v|�ߵ�5b����Y�"+��ri����rq�`�t�|b�ê���N+SG����{8���|cM.��r;��%%���GVM�c]���}往q��Rn�~@Tx���l11m(!!e�|�X�^>�`84���I.��D!�����Z�B�o#Gq�ܙ��>�r_��|c4�Ceb-!j-��%<��E����:��V�oT�����D9�h�łF��J�T��\�����	��ҍ|�J�UIS�������N�)/�^�?y���;�9߸,���QCZ(�h������6�|2��hFƽ�1<v�Z'���Aq�g�;Us�|��r�+C�eJ��	�t��F_�����ֶ���t-�q�^o��'!;��^͡�!#<��
�h������K�P�����6��S�^�8���Ö��i����R?(v���ȘM�ҕ�����=ى(L��_��^�%�%�cW���{����k'�ɞl.K��z~� mfrb��L��%��6'(��*V��믩���Ss���aƈ'�����p�A	�Q��p�`1�$7ϳ^�ԱRr	m+4��mI��L��	y|\X����Il#e顡�`��ɅPA�����뇌�]л2�Ɍ}���E6B��X]f$3���PB*�k�Q�,�G[�LS�A��D�%d6W�a/w����aw7�H����TÈZXB}�7�hk�m[���h��_iUt�E�F��j�d�^���:��2_���e��֛fw:��J�Sֻ%oUO��c��_�h�rT�v3h�;�ªJ��A}����i����(G��'��7c#y����T-��ͽh*����~�n�zk�i �(�*xL��6H���ft�3��<￣j�%�d|s�`��6ÆIi)0��)O�c��� `8����5�V�c��4��h�%yE�ȼ�Š6��K�]r�y8������0%|ܝ[jS5׼���1汎���\r>�9�uF�;$�ܷͬ�����`�d�Dgԍ�G�X�HJ��
B�i̕wB�Y�^�{-Ƴ*K�fMP����/ex����W>��?�¿�b�"��x�@tT*���-Y-�r�x�PZ���������E�C�1�y���3k�I����n� #�aV����L.��{�6��0*��7�볒?����E�9��^Y����S*BS���_�^��
��n��<��U�T�O�D�E;/�g�}���(��;6_�kV��!�$����cNi/IdC��l�� �TYn^�Y�Z�Ժ�00�d�t2�u��I��(}�ѵX���|���[�=�/'�A��uld��~���!��f��A�S�,m�\�r �sr&'[3�c~ 0�U�ܴKQ;�px8����Z]iǄ��]\��
 `J���8\ �������͒�JE���K������ ���Yˍ�jgx���UD�O���DkI�_��V�	
�H�1�� #�����������<��6�� ��o�v��v�2l��E�XP�t��>�)��x�gF�F5�.h�NS[���RHņ�2״�����O���\(H�72IJ�.+y�5j�_�%ާ�q���]``�|j�S��#3�A�1@���MQ�p�<j��v��dl���#�?��-j�%18�5��͇�l{�=\�P�"����!Tű��G;�E�������)�*���0�gOg���c9�=Q[�y��e�p�T�7Y	��$�=����%L��nr��.�я������V0�p�h�b=j��)*#��r�ɟ�\n���IC[�!�1�#����ΊZ��    �zn��H��8I�I��&Iv�����vy:*ŗ��yD�]����6T�G�ʘ'ב�r31����a�仮�2�u�^�IJ;n���$l� �s��p��p�bX$ɜ9��C�{D+&z���aFE@W1&��V)�-Zq�����m^�:Җ�}� +s��1���3L�(�"��hwY����!%n�߈���%�Z�Ԙ�3�d�GB����l��>: ��F|���~Z�[ģ-*���?�#�*Wz�׻%��W��\u�#���H�N1S���ѣWw�V˲^�c4��@{��91���$-T�,t��U���U�./_�O!����k�>�\q�-�'�s��Q�HLd�� x�7�5�ؖ����-z96���Ix�p�8ZLo�u[�Phj!�,=`�8�s�(�zF?0�1�����p��x�<�1|+�X-�r�]�}}u���jW�R�H<8;9�RC�?�o,��׷E�H׹a��HL� !��a�pQ+i��)<�kvX*�=0������_������������M�B�����r�V?���P��+����/�����O����>���˿�����}�~a�x#�QN
�w�1s���P"��<v���I�+ �o�ﷆ�Ѝ��l�����j�P=�S:�`��� ��oV�/p�
�R�%���m�u�p�RN�?I÷g�P��7�8H����m\_a?Y�4nK���ԏ�Td���Ls�4Z�G(>3w ��_-��������_����{���+�mm�oT�z��Vl���*?���~�+ܧ�?�h��xKU�k�F����m��:X�����g���Ģ�aQ5�Ң^����1'�2#��!cMf]�G��o�X��FL�)T�L�G�6c$+�<nfR�����?���5�!�?5k��$���K�3���^�|Eiu��/n������j��吧��MM%-�Q.h��$Y�q�g؉>f�n�����9I���a'�J�]-����C�T��T.{c�sL��d�!G，-��]�bb}�飕���h^��H���,���">\��x���S��``�1%m�����zOO�:����R��E�����f���Mp�'U'�؞��d�H���%*���_I6����&>�$������bݽ�峾**4Ф`J|��E�����Iy����L��3a�􍂣�/�
���]�~WՍb&3������4���~�|�]f�)��G*Lv���3�S4�$�f�j��\͆+~�.����e���B+x�4jQT��e:n"#��I�z3���P�@�d*-��8TS�RF� �[��H�h��L@�F���/*�ӡǌhZ�j S_���L�4�+�X>��<�Gv|�.��2#'����ث��n0��.��Yn:���b��9@�NK� �G�C_��� �5�Z�bS��2�\M�M����w��@���wOS?�$��"�v��t�� ӈ �	j�����y��S�GZL[�L'�d%���@G$����OȖ�����b���b�A�*~�P��$�5}�sh��B����ȣ���yq߃4�e����J`��ʞ��Ey����>�/`�.^�,F�׳�ķ��V2J��Jo�̈�'�o�0���a�j�;~�]����`SD_��� ���M�Jze
Qg�%��!�H<\�=IU-�����{�`Bp�r�i��Q���p͋�s/`)��,�B����R`P
���M�z���)i����KS�5{z�y=0��L�f�w�6���%¸Y�}(ս����_��� ��v�x�^��.��lI]���d�ٴ��6`8Zv�7v��U�N���M��Ǝ��5��rW�/`�SZ��[0i;.�@U,�3{򳲇N�(�4�q����"�H>{k��@+���tn��zơ1��[e�F�W�F��2�1wB��:��㋆�hk�7ww'a��.�H�|��G���w���Mmr0kV�?����5��9�Y.v�,Bٜ���^?	I
;��Y5�9^�D��}��F��;�D�K������ZgŢ6�|�<��Ǖ�ͭ��9��$-!�2�>����yH������<a}�c]u�\��@��r��:�d�ӵ��o�[D����u�z�n+�p��i�3�t�>(����H�Z��g]#4`�����}�O�1��������\���hN+�����,����D��Wʩ�.&��O ��"(MoT�Dg'���a��C�,T�e�C���j1����f�ƣi�y&-1��+]��S���>]?�3�V|�7� ����V@|�F�$]q���z�/���a�����;���g'�\3r�pG�T�OޢK����[�S�ǌ�{x��/	�G���Nz�hg���nc�/`�ǭ��d�Ռ�����\(�y$$���L~^Oc�Q��"��5UCXa����wc(��َ�j�/�h�m��Tn%/vAtݼ�^�� �;$����S�p��_��|�&��a(�n�&W]K�j��5�g��f������A�w���0S��6���K=\?�PKH1~p�g��C�Z=t��z%��@���]���ȧ�t��9�1q4������_N�}�M`Ꮞ�[nf����S�p(��)ʺ��r��=��)�_9�ծt��c�y�E�[R��ڒ��x�+���%.�k����I�����0�:r[z�5�Xǫ�w[Z<�hh!��NE|$B�?#��Bɬz*eQ6�l� J����m�h���+���^Jny{#�v߽o�k�8-��\��Qu8!r����o�¤�s�E��a��>(z���o�� &W�n�Z@8�=}��,+jf{!0�?��o���:�Ήc����A�ߕ�k�]ǻ{
`
}r1��9�h1��}�b�HEQňpz�C�0�U�nRcj��	v̎��
�:}w�� �A�]���c��KE�eE#����?�d���F=���ɟ������@���)���@ح�����)����L�;&d�����L�t���ᴳ��,c�k�r&N�8,"�b���E��D;?�%�X�Ju�Dݏ�� S���ڮ<R�Q�l��S��S?���YϞ��z��0����q�6�����F��JM�.��A�P80���h�Y�ό2gX�Fn�4V.	�%БS�_� ��B�j���P&�b�������UP'g�Zz/�{�)�	�u��:�g�C�����z4C���cge[�~���>-�o�Ј�sja�ң��@5��gCD.���z�y�r�i�N�5Ь����I�&��Q�%��O������X�=�7[ɗ ���9����Ri�r�C�E��R��k ?d��U��kKcWMjR�jj?���r�c��#zo�yG����	65�ko��pѯ���~��u�hϨ����II�^��������ԭ����
��,����[C��i��;����֏����θ�G����A�XSc���6z��L̴Wk�F�u��-[�� ��鳵rZ�[��e�F�'l�o���@'�>vČS4$-�5�f&/WZ�G�d�9I]�g ���zt&e���Y!��v\��`��n:������S?�BX=<���u�v~��n�5�Wՙ�H:c�#A��'mZ޴�����[��I���2��T�I�(��8��J�S�l����co}ލj��\﹎6����`�%$E������z�[�w#�+�����j#~�(��a�ce���z�����̵�Ŏ)\j?ޑ���;��G�t�"]�oq��2HM�ݤk�� a�ǿ��h��U���c�sϠ�:^�oZn�0K��c)���,n�q�a�e�,���
���3�7��t2D{��8�9&V:~e�U,�����/eF��.ha�R��n�+��^��E	k��N�I��_�2�]�+�o���@��J��9d��Aݝ�v&���u���M���^dﾨ"[��i+��ec+�3�v��W�����Fav}��<����C��K�|�Fͻ^}�Z�c�/�4�պ�:2�G��m��Z�;{���G�/`5��C)g�=='��    ٩����b93w�ë53F>���h�Q�p���8J�3���q��]$�����n�K��]?�z�S@dY�pxk��}��
�e2x�s�w��|#�-���l��P��qKfVS_��A���ꎮ/`4���o�
F��VH{�����Sfky��z\<�))n�XJ?;�3¹��9�����A�f�����������sִ,��sƪ\�>]���n�/`�}��pf;�p���o��U׉���ݷ�_����f�[	9(���z�X3x�U�s]��ي��� `��t�f���^�t,�m�C�����_}���ȍ��\�'���~dϥ�Ȫ'di�����_�H��rckV��Y�tFd�a�P�����LdgZ�~��Fۧ�b7��ؐ�W��KfM�;��e������S�i���ƌ��~,,�"��!5	B��������1&6}
!L�hM��H�5�1~�V��cV�5�����_���b�'�������l��l��/�v���+��K?TnF��m�p��:\�I'*kZI'3jk2�p��Kk7w��霰^�VF:i]i����wf�
�,��.�ИH=ϣy����D�Y���1�̻'z$��]	*53�f�)���maA��DR�z�&V���Op�(�a�XꏩM	����F'3ꁷ_���jt%�M(1ם��=I&^VOe6k�렲|?0���s�������0vA=@� �P���#� �q����yn�=�D��\#KN��ڥ���ۯ���Q�v�c��ۨ e�je���c� B������ZEy���wg\<HF��j)k���G�Q��i���Q^����ӪP�"��H{��#�ww ~�L�b�7�1�PgX�q�Q1E6jʳ̝+h��o�K�;|v�
�$��ª��b��J|7�<�h�u��	^	��zu��6��+���%�e�LК�k��R>��U�>����d��G�QD"g�z�}����<�I����k���܁��Uu˫:��%A�� C�s�v�
)��N�����S���Fp��r��_� ��sk7O��6��4����G�,n0�m`a�b��-4zC9�căϊVI5�1u�j�y�7����G=׫�(��!��>v�5\as�3C��F�y\m<�������X!���E�AU�漜�+��W��
L�x��\��]h��d���.K�,I���" T��F�C���ʥ�^�Q6���`w����� )����m{t�_���W���uy�G	��56�������;c����zN� *k;��Ԋ�%��t+k�w`�
�|�(�(G�uؘ)5Z2USױSE���e��E���)���D�)H@�H��xjD�K��V�����Ԙy���̨�jvPې[W��0�����诿�|�~Hk���� X#��*��s�f?�s�.���P�E)�*�F�R�t]s��i,�F�U�:Ʌ���g{�^Mu[vT�'�7tZ��Ec�ݎ79��'��ċvq�b>N�qU�#�ni�OԐ�$�__Xdk���B>s�}��i��j��ǩg��'�g@-�ȍ��"�ZZ�u����3[�2瞽���;�W��n�t�Ap{$%+#���Q���B���w�v��.��Z��yLP�x��4Nh�����ݍ_�_�A�ވlW����(�l}2*�}��j������C��+��2ƺd���p��ZK�X��r��/��1��=4�؛R���\(�9l�$��=<W��n��_��#�ވӄH�ʚ�8����nj*�xx�B��s���S�Ѝ �a�6����(S�I8�?7)��M��I�A= 7���^O�����{t!"�z(5Z�Ӵ?�����3{�$�Np�x��tMC��(y��v��9J���	��a*Wu��C�\�B��i+�Y|׾�����Tb�Y��4Y�(T�����Jr�l"���~���p S8&d�� s���5�Y���7��&QtR��r�/`X>�k�i��e0��TO�Q* �+�%5�:���:�}�׋3�ʣ�����/A�wL�5��N���b��֏k��s���2�(�/���M�o=2Lj��TM�K�����֞�w�<����H[���GV�
��o���7��ųb�f-��E9d��~z���k�h���^dNZ�F�����f�wX{���9{����l������Q���������a��Yx�折y���K1@�d�q:2�4�-ʜ�f�`���=��������p�tװ��Z{3��O�e~�@@��q��_l�A2p,kqc�x��H�8|�������)�m�\o�-FSގ��>����� �*(Wd�h���~��!���F6,�K��!��<C�|�uZjܣ7� 	���#ɫk�Vt�����<�H��eϕK.k�0� GB:$�AS�ȎM��?66~cE������YC�`��v0��E+[>�/��o� ���J(��7�deT��Z���ROA��j�L�M�Ӏ�MC�ܹ��Dvw�)$�	���\��Wl7S�F�;�6䢠�茂�S�#��`���U��XQ��r|!'�s�����N+��Q�f�N�?z�W�E	9U�>���G�9���hAͅt�r��.�P��)���s��T�@��Q�M=!�������ا�ʍ���j���0+�?wߎ��T��λ/�`D?ͳ�̇.�y��T�ѽk��;f�������
ۍdL�c��z�D��ܨ�|�x<��?g�S��G<_�N��M]8��(WM.�`��>d��*����V�Q_�X���Z��2ذ�xW	�6����~9x��Ѝ�r|�ΤQӪ;FR��暤�Q�wE*�~k��F�+��>5� {��W�ML(��gn�W�?`ǀ�"�䛉�<�i4у�ɉ���f�}�y�w?�>� ]T�7��4W�'s��C)1�C?Y���Kj�|�Q c`�10�shD�x8�>�N��Dy��/������d�R�l#TF��jqNVi�i͖�R]ޭ��L��V��d�h����| �&�S\v�~�?��}0�>�jv��Tv7Ę1N�%F�b;i+smAZ��c�W���3�����1���b��&��pg̗7r>�(����0�YD�R[v���1+^u��gz=0��`m7E�p���x^�6���mP����y��3_}��#�^��v=�|-��;j��ӳ�Fg���O��<��.��Y��((�3��K~�"G�|�)�����6K��i��I���&RvC�������|�m������L���P��`&u��E^_Cj���v��j��Q\�5{���S���clg��/`쓽��,`˃HWGs26bKKej��PE�w7�ӯF��\}3��sWg%�b��hX�sP������x�o�n�/�)�t�	� 9�.����V����/��^�vG���HS)�t�Ai�Z��Z�����#L��.*&7[�>�J��j�$J �F+��i�gw�n�0>��4P�^�H�����'S-q�f��ml���%\��Fd��&��PcNGPt�U���U� �~!$gu�铛̃x̔gH_數�#���L�3���y���0�r���@K�n5����Numdh��S�߶����9\0k��7%д��^�S�dV�x���}e���=b�j��n��g=������t�Թ xd'њg�?���ڪ�07�9�Y�-J�z���1`e�w�_������2Xs��	��1�!&�6��F�'��o�<W�L7�4��I�kS9��ʉ�7ICi%����/W��?\�,������Ւ�%2I<s����Kf>���iEۍ�u�7�~ L�%Qfj��ᗷ�<����y��o��H&�C׃G��gN�YO=�kC>�pF]�r3�5��F*FP.���*(�ˠ�����D`�>�1�u#����tb L�^l�3�ὼ�S������A��7�?��gj���<?�'#����Dg���E��Vo�-�k��ԴQ�D9(�,�<q�^��8? ��|r�W�8E3�Q�FVڈ�{g�̪7-�r��&�Y>%��S|�    �ulO���C��e֌�[�����\
}����emu�<{Iur�h��f���:���A���{���,�k��PEcU��w�Z���ۛ7����u�M�`�emM}��OR�R&�{}��蓙���1[�sڒ�|��3�#$�}�������e5�Q/r�����(��d�<�=�T�C�pg�r.��u��	ߴs�N�i��xl��r��4��J�̷WJ_v�^�dnjEQ�P8��HԎ���Ե��������F����j�Ђ���hɧ��[���֚��E?Z-���4/=lsJɁy�O)���4�w��>�H�X���i�����t�f樞��J�Εw<!���`��`�M�B]��%��<��D��N۩Z��h���ʕ"�2U u!O�[��FN��q�6V~{Aj-�Ö������B����{��l�D�"#U,��,��gٚ9_�;��^��oi;��#�:P)m��ݣ`�c���$��L�Y鄴�t��;��kS5W������k5������L� Ǝ ��((�B1�$��Q
��Ҩ��.X�Ns�D0�?����V;ҏ�������k�7�wř��[�D�ܒ���he�))���{-���*��Qǘ�e��&����g�S�DU����Oc�'7�r|w>�c��@^Ģ�}��Z.�V*�G7�����%^�����&"oz*'�����V�&�e����vl�y5�1�Ms��2JT�af��������6�I�����͔'Ө�ׁHS�
9g��|Z�}���#M �K�7s ^�B���Z$���=F��ɋ'����6M��=^�����6/Di�G&	��L`�e��(�����Rb8���Mw��	�\�a^؀IX�6�A	���o�0a��r3}vz�/ ���mO��_)j���_�B�7"�ըN��H��$e��x��4;uY���`�Sk��,;}��Gw��kEFH�A�����H�P��^��>@Gr㴼6��֡��N�b��~�I�~Ջ�����B�+�9r�Ѽ݅�5�������a�q��$�F�+c�d�i�i�_�_Y0���j��)�C�c1���� %/��g:��Ϟ�!z*�����c�ٰMʳafm	�ii�����w. ��$iT�FϪ�9��% SAr
iC&_����S5?��z��r��#�D�}t{��T���]s����0P���l��:2�D��>9v��R�G�=؀�/�8Z�j�+��|T��j�U���%�h�m/�;F���M9���TJ	]���X����s���Dϔ��� �L8~�n�O�H�d�aÛ�~���	��b�F�K�>U��w�͂U	��8#�ee��c��O�Ro��R��J`3�h�N.��|��6f����k�9�ǋ�D9�HP*��DݸJk+*�\`z���Q �֥D�w�8�l0���ew;(	NIsp&���� �Z��w�;�B�9j���|��D-�a%�r��� `T>���E뷜zp\P�H����s�{Խ����1U��7"I`=��D�����2~9i-�M���i��Q)ݸ�.)���nGVʃp������إ����_�>�f��lj3��y��$䵓j��\ֲ����Qz)����b<gt�P�.���%��j�� #]�ˍh���|kN������MwZ�t��p��c��o���N�;��d����I�(:����]SL�ym���9��R�k$����^��=�������5ҵz�z|wF�ei�G��5�("�d��~�l��P�����L�6sj�à*(=�JE���/�4��%��n<]�<Ank4f�$a�#o/˭�����ķ�B�CT�Ƌ����i�Ǡ�U2+5�U��6�l�8���ZP�����[s!�B�L�d�&�显�]��������V妍�W�L�i�4��k��F��������"�|w�y�yt�6(\�pٱx�CH�z��r��C��^	����)�R(aU�����q�V�b?`�p�D፥'\�^g�1�|�+5GcM.]~�#l�;:r�|��<t�=Fj���=�D�E��qN;K����EgwiT�b�3����Nբ3hLI��H�Jا���~`�~����UQ��=Ek^�8J�riyi� r�	�اyᛑO��'ێF䢳�+�蔏�M����bqy�?�3U">g2��dŪ2I�˷R�y?�p�Jru��pUJ<LWd���1&�|u�F��/��z�A��1��1���	����=���U[k�I�9�~`�?�
�F���9���n1U>@|u�4O|�n���KtQ�7�����=�+�,}U��<~ 0��-y�c�3�XFMc�SK��������c����nܔ�U���� ���G�m'l;����^��ࡍCZ쪛a�ʭp��GcP�4f�����tY��7y��K-���s����)�
i��[���d�{��ݸ����T�㦬%�9�2��K��c�Q�s#3�hhX�J}|+3��TK�AF�@�90�� �"|��)gL�}��H��R?Msۧ�����J<����t�.�Vr��`	�wx�0���% S�~�7��䣞�éR���br8�'�Tm�p}�U�>f�7�ihNU	�A��aI�Y��6{��ߞ����rӮ*l���� !���_.1{sZ����8J1�V*j����qр�2w�$e�4:�D��<���7X�x�o֮���|M�m�"9!�6k0e��^������Lf9����>�I��Wo�&c'Z���Sʧx���V*������(��Bl�.�
��c���b57Τ�Vf��j��]�3U�F�g����7",����Е����qtV�WN"԰9���b�y�=�
�ojD�w0T��b��G,�;v�h�s:���������%�_��ɏzV���Nk��ED�֖�@��nu��[�����:�`c��-��X��{K��#Ͼ|`�azdsc`�J��5���(�>�J�E9����y���G��-.�n�֧#X����Q9\([�mtC}S�����5�}��BK�����-�rQ�✏��p��f!���=�x�cR�]����r����f�N"
�Ͳf{����K	)��𹘎�T��K:R��1E�Cʓ���%,gZ�7}���ZI3���`��6�(�czw{�L8�!�8��<z/�(��G/�.c�kX�*����h�(U�'�)+֢9d<-}G��5��������q뺈�`�q}
��͚z%NV�V��N����!�6�ª71fWd�0ɰ큎��m���V5r��?�?����ꍿ���LF.�'�j��o|ɺ��s%y���Lt���t�����>�ōQ�]�L�F�ӫ���&`�>D�|L�ƥ/d%A���"1{Mg�ڇ��?�	ʦBtQ$n�!�R+�C8nF<z5ьd�����|�L�0b��>d���c�,�{�Z�*���	0E>�Mo��F_*�X�砄��	uK/�5�_|��OѰ��1� c��i��zL���uP;�x���x�2��Fݺi��S��qIN�<l��y���.�~7�<�t!�OS������Ǝ��U���Gp���x�i������G�������*۪�os� �0W�ӭ�\�Tw4NR?�+�4�k�!��r+���)-ߴ��oi�h�P"ٕ#ƬԬ�VL��w��<�0�R�~C|�sPB>w�u��Iֵ���s��~@�e���Msvͫt�B������91��:)ޏi�[|�F$4��\�kƷnp���;%9�7�1&�ܟ�F3J%����q����b��/6-��B��$}?�aC��K7ʰsə�}6!W�<u5TN{��%��rQ�/`��͕��P��$�	�cAuj������n�~�!�|o��z���`t�� Qt{����cp���ywG�L���7/���ꇞ����簥Gi=Oo�L����?� YK�����jY����ϳ�'S��Ҽ�^/7t�_��&<,�.p�DA4I��i�z��.պ��e�\ڇ!���nS.��cN>��9���Y�ȋ��t�DJ*t#VN��    �!c�?l��%���.����c����/X;���vc�;�� v��/G�=�<�u�̽��_+0f��f��noe4N����s=$��񓑏ߞ�L���� �F9�9���̕���X���齖���0V�������N3�%Y�F��e���z��e��r�%�*��r���K���Q�`}�$Ě�s��{~�%�������rٲZ��p��o�4+�DaT�y����Ԑ�����8�����q����W#���3~ 0�bn"g���Q0�hȬ����<�؋����*������C�s��5�=�T ��vh���W�߀a�I��c�KZ4��F�l�%�����Tҵ������P3b�Y���HMӞ'g�d�<�zj42X����� ���E��v ?۵� 8D?�w*�.;t����-�1��H���Q��q$V�4��Ծ�����b���3�˥�|�S�[3�évkeZ*g�щ��^|��;0�R�Ŀ6J�%r�!'�@غkIc�Q4W���{�߀!�it3�?*�9}�6fL�ΐ`'��]{���W��7���nLޤd$��Z�٢'�>W�z�s��&�ٸܔ�c��T:"J?���r҉ S���>����%�������$����.e����&�/`�sw���[y�1{O��g"����vp���_��L��R�xY!Ҟ��BHH�y�b��=��Q*���xq�,fދ��,DOg%��&}�!6y�����"����3��c+�\q~0�����M��ə߁i����$9m��xso����qfX�e���c����6�;�D��=�M�8E�s�
+���?�4�rS*M���rR��죄��U�>a���qaڅR)�n��:(/����Ѥ�xِ�s�ެ�0�wT�݌-f�*�0�Rx���i�Be;@j��:_Cɡ;v7������%�5���! *� ��K{��?4���cb�*�(��U��<�^��	E7��b�?IϜk!-7�C���;��C�]z��6��S���I��v�b7�V��c9�({������Z�C} ��v`���˦7���v�U�^���;��U�x�Q�x.5�rAc���9ޓ/
��>R�L�(���F�w`�S�W�F_����q��).6�Sm��r��T[�����^����!쌩�ҿzOB������r?����E?$�]�R���Km�АQ괂�Vwl���+�G�Po�E�(Q�����^Q4��ʾ���=�?J�n��k�����7Q�F�Zj�l=Hǯ���1)������* n�!&d���d�QBc���#Ubͮ���n�w�8;�bL8Zѓ�F26o���������vu.�/�ĭ����n[�\7���^<M�;0�ɖˍ��{�V<I�a\pZZ;S�ç�_�Q����ً�n�!���J���)Q��3�����/���gǷ�oN��$y�jcט	��^R�8��ӥ/�옫�vq��yh�P;������O F�'Z+ohL|q�����>S?+���B����~FK�S�c�Z���є;R�����̤mb������6��SHnd��r�s{$%�w�[:^Ȋ0�7��t�U�RovL�J5�)Ϙe]`�.V�F�jy�I�z~Gѧ\�RndXzy3��H���Z��V�����o�!�0�/����(�$��}Ң˃抷i|�A�=�!����$��W&C�s�e%�-���gz��%�է����(�"�ތ��|tX\ƌ�E2��z�t�-��YD��$h߼����ʈ��.�A`PO':r����7;"�L�����Zֆ��8e���mjfK^��)��� ��ߓU���<3/l��J��I��{�]�KF���; S��7�Ѩ�@XҴx!�;&(,&(�Tڳ���Î�F2*����(є\m�r�%����F1I�����1���C��"+�!S(�qv#��z��O�%���|�0=�R��U/.N��T �W�;�k*���3 Y���o�(���\ɼ�c�Z1�4{Ȁv�k�{�#����R�;}�˕�����X�v�!�7;����槐����#�\��fDYOj��F��j2�R�����.�!�\��*J�pv����:3�I}��ye����=����I@�ܴ���J������5\x%�8��n�9�=� U�� �)�Y�c.r�s�},"#ݽ�y�}n��E��כΗ�Q����+Pj�LG9�W'%���!�T�tL��2#��qʗ���\�\ތ�j��J(���,�cG)Qy�����������ց����*�ŏ���$���L2��r���#݆��1���[>:���\�E��9P
��,���^�ʶ_f����X|�<���8TC�!�m�/C���i���3\���q~�(���I3���1|�
��g����7ˑ�L���|2��s�IF�[�U�ذ8���7�"R�'K�<�\0���5��_%�e �]�����zAF�GR�Y�tIEbB��w��El�����("����Y�x�d�9mBI�;���.
S:y�pD�~sz��Iv����* ���X�7��=Ź�I��`�KWIK�k0b�����ؙ���S�� �'ڄ�g\g?X�#8	7���n��ϻf�7	"0�'0ơkߢ9�^�'y�v(����xN�~�Ľ00��P�?�_�C�k{��=�j��ī�����/�����T�M�+�乤�ԜP������c����y`Bp��H�֥�S�݇����N�MpҬ1��n�i�=0:�xb��������=����oe�A�y.���^40�z�*��Ƞ�jf��%'�5m5O2\����e����d���͒���-�@�������G���>d�U� �(Ieun=�ʵL�JGj�������u
��|��
�%u
�έ����u�me����o:ԨJ�`'�.8�j�A�b)z|�)�����z�1(V��ɠت���1���TV*�/�]��|�U�JD�G��;f��Hy��s�p�"�ZJ�X��YL���8�<�!�KS5�$�q��&Cs�Gp����U�wŹ�aT5����M��7�����h'�Omg�3�WXk�bZ��k�<��o���A��%�����%�ڒr����꬞c����À���NT���P�@q�MV-�$:�5�>���cP,�"N���ځ��s���_a-@�:��|}�NB'����QF�i.�r��ɶp������Ġ��91�lE.���	qf����1Rw�6�z}?F�����\4Zm�oPZ��\��+��\fim�ݏ��u�+��Xh�����h;����#Ǽ%�b�����70T2�'�7ǂg�3���jqdO�e'��L�
^>��	L}��h���W�ps|�3Eg3 ���e޽���=��P%��6�T�/��i�Η<��ڴs�_u6��YT`G��b|q�����i�^ 7�T�����/n�������g�7�����+��v�F{�+��M+�p�]��(0��u"p6;6�t�a�C16gI8Ra��kΗ��/T�3�'���,��@���I��ī��E��_h4\Jѱ��z�F�k�1�AD�A����9��}��ؓ�֣�M6[�dp`t��cҚGG�lR�*�780��zd|��{f��j������r5U��~B��*�U<��_�fC�AxN.�'4z��*1��w��O`�1�x��:��B+��_�G���n�0�/�v���p��|"��<�b����x��dkB��b�뻻�����`9Fɉ!�T ��K��m; ��Η�|�(?�e:ٜ�k�
-y]�D�-��ssh�7����Ɓ���X����Q?���SW��#1f���%�V��"O'��z�z'��P��5�
���^�#0��V�$0���^���cys'�0�0��aVy�����zt���Rwq�\b�d�؃֒�*d�"��^�dS��#s��$12F1��$�X����~{���x�E���V�{Ur��a�!t��o�    Vx�2<����o��X8Y��[nYS��q)�1���Tr���i�-��	�;QHx"E�u ��h�I�-�Ix��DqZ���	�9�r�?��:3�1���;&�_M����n�w�}c�'��Z�ؙB�D_��!�N�FF�|1�L���t"����|��hȦW�:�WdՍK�~��_3�Vy����e��2Q
A��W��#)�������
�w��f>�����gX�uO�;6�RN�Eg|�Jt{�6���ɉ���X��'/����S
	㌃��O�'�c��}��	���?�����1@�r���������3΍���Ea���4�$�`z��x` �\N�f-��S�a���d��]L����ח��zz<xO�v��PpU��:�_��ms��|�C���fM.1���qÓl���T�Wg��=P�%0��'�~�vs������4�K�x�.j���#.�`��uGsq�����x�Mv�V���Gv<0$�M�L�Y+����QKRXԦc��r	��ֵ'Fy���]n-4�<�t�2İ�-鞁o{'�f~����T�y����J����R#P�Ϭs#T�ן��LZ�&�Ժ&'�#\�̑
��C��N���,D�Z��d^r�܋��b�8#�8n;~�ƽ������2щ�C����~���b��9o��Ą4��4��P�!��-ܚ�$�$6��^G8|}~��`�|2���ĢP��c��%�P����<k�'_��K���A��_�,�v}�$j�s@Nk��t@S��e���Å�d8���8n�q�K�Ȫ#a�TS�ڮo,��b�!ˉ�d}��F
.�:�`��ĺf�ڟ���? �p=R�-�Q��n�~P�1���y򄚯��z�V��/Υ��+����o��wk"kJ�?��81(x4�P'����.nO�9v��T�V�8��~����z�Y&~�4�˄�mG�=���
@d"��v �+�.�떂�'gXa���5�S/�Ғ�ڐ�x���X74���B\�^�'��1��PxU��Ja�����e}'��:�ʘuH�,&xvN�06� e��ض�L���;<��48,I�=Ο['�"y������ϋ'+�4Be���z(�wJV��!�Ÿh����Gv��RN�
�� �^H^xfq0b��.|�������b��)f�zLNV�U�픳�m�ۇ��X�9�A���X��<r,+7J=f��9��!R��mL�������,aӵw	ӥ�hǔ`m��#�u}���H���t�9U���E�qB�l�ư)^�7�r[n�>%�I�V_E�����>�L��	;|�<[J��!s��;P��dl�����P�mG�-y�E3�)�۷��x�x�:����X��L�f�:���N� B���f���X�D�q�5�J�E�s/��f3�Y�м~ąc�,[�3�AZ�1�.ѷ��Ο��Ξ����s���d,�)��RtkK��AI�J*�,cc��O��ف�
�;���wƥĖ݌lC�%���Ѓ����_~P���?@=�ZR�ў�!�^��z��4�������p����l��3Dث�DL�������Y���kH�\%s.��S��9�g��K�ѫ�#rbf�u�
�3\�ɗ�?H�*-Bi�:����F�E�ʉ�DY9���y��5i��koET^z����.�O�A�6'T��;��9�uL3�*��M�?�i�?��e:"�Ey������&~b<B5�&�� 0P�8�H$�Q���T��ę*%訶so*� �`y�a��&��%��	i-�Z�Z7���5y��A`�dx��-L� r��jg~lr��WL�7L,�zY9�6�Y��
�PR�;4Q����G�b���T�riN���nƫQL;��dp$s{\�U#�'�#[�l�u��?�B.�SU��q�Y�G��a q�B��;��Hm!�*�a���B�uu��pb��$����2Zt��]�k8S˫'�r$E����s�1�y�����h�c7�X�(0�O)�������.����^w 9���7-��%aY������iW��X���̓U#-�W����yf1���� ��\��5�����H<��"h��1S��ƚg@<���j�[�����Q�%��?:�����y�c-�Tf��F�_�[��k���nO�z��:V�&�{آe#��<�j�m�֞�op(H�Z4��Rt�Y0	�q��Q:�39�v1o�����L�D�f������Y�S�ũ���梋'�?���J��_OF6t��bn�c4-kϻK��?���Ǭԓ��͑��mj����R��&gHX����_~�ȣp�]��5=�}���-9<�r�Y-�g`�D�4�ts瘭u��OM<�I|�T����y�/�R_�"kl9dG�'�=MA,a�d�y�Ae����u�G��q��x4������ԏG�K�lH;�Z�ڌ��W��щ��A���_���yz]y�Ny� ��f����	�"�'j�9r	�[x�X9鰖��̞l�ҋ[�?C9���D�	�PN���zi�j�Xƺ������S(�0�3���0���N�´�k��z���lY����5��$�����5RW^~�Bp{���5����"x��T��vm~N��yՁ˨�:P�'~����%����0��x�Ȳ�?;a��~���B�?0`��ߪ>�1����	���iB�F�{��7n-�O�� fpL����p��Rl�N$Y�v����[�����7��&b	������,�1��^ϟC�?F��A���V�iQ	#���بy3��.^�=0���ɉA+8c�G�r#%���
W�B�˼xS�g`�\s�j�g&	���!��ȗt&n!��:d^<��30Ε�(�H]f��W�����n%'��lt-�[���AG�����k5��J����Ϸ1�P4�o��G���%�剥�P`I��L�1�:��0�L��*�=��#���k��� ��SN�8�*A��s�з�D��$Ǵ6�%���:P_���Y{#y���S��+�	�D�d-��M�[*��z�l3���8�z�[b"J��e��MNC�?����=:��-<�׷6C���]�@����YcQ:������z����G��q�R.'W��g���yO���Iyy.���K-���A�d���R��izJqvMqb��-��{!�������͙��P-��Qn���F ����G!���_�ٿ���?�����{�?�׿'P����?�����M����,Rh:}�o�kLp��L��*�����ӿT�?�����X�-!D��H=�	7��;M��ģ|y���%��=6����T��TĊ�jfzuj�-0�ל3�:jCgA���?�)���W��Y������3t|�lqތ\,��J��'��9���w�/?>���ԨBG3�=ǔ�5��LS���0�T&iw���2����`ż��qYd���Ŗ�w�}�>�#��yP�~W�Uj�xna�)���O�7�������چ���X�a��ߧ<BF���1jFWO+|��5��Q���8�c����U;�*��+����x���'0�b�E���Hi�&�5?~��<�V�6��7���~���� ��X�F��DDa��?ԇunݙ��a��Q��WOJ*r�GZ���U�F�����-�y�������ND���i�p��J�F�F/Q�W,�V��Br�/O8b���zIV^:O�ʒ�����tu'�����@Nju��ީ`���>������B��ײO`��q��2x-�����E��p�Kd䶭���O`Ā$4l����W�� ~��ZY�/U'5�Uw�*��K'9�uX�@��<4YH��<ZkR�����Z.'�a�N�S��%Zy����[�� G�ŪYo`>�PP���Uڣ����j!9���;�^��2��Ջ ��`y�s�y��y�{� 	B�W�d��e4���w�=*a{| r��@\	)$J�3b�r )�ý�o'J1�P�J��9�Oo�i	Ş�y���Z�__�bT�    <\�����C� ����Z��H�*����LL/��f�.[�9��
91��:��՚�g��R�p����\�l;3��
�W��j�v)4fFO�7[��L�'69�$���UG/��[a�*l��ͩy�q��Q�p���$0!<mщi��C��t�4��B-^OnG��J�����娵�v��)�<0�ԚV6Rg���G.?�Ar��r$�7�.�LR�^~���>'$�����_K���3�G��xb�B,Δjx2p�6�}���k2��W�4ȱ\혩�sp�+|�Ճoo6ԚbrX�T
��C{c�}8�������W"�*F�05����w��?��?��s����_V��ŠF�4:QK�5��`Q+=�`$�����1��%�;���L��i�sF��"?�h��x�*��73;_~�����x�=��NY^�Hmo r�i1O���_�|��C=y��Pk)	��Ih����,�u���D/������"N��T�0�&v�YK�c���9.GV���c ~�O���,�4G㜶���[�N�b�w���������F�`�"i�XM go�"��L{�".��f�>����8���+F�r�c��Mk�������ٞ��o�F�9AS:|�2W�ť���SJRX-�ft0Z����5HH8;y�YꟴI��,v ^�)� ?0�u�*r��'.�T������r�iY��-�jOΜ�n�%�o~Љ���~S�Q����x-R��ᬊ;��e��'�29�����a=����S[��UL���"���C�����֙'���(��8�Ƒ`�.8�o�����Ħ��H��{�S�X�g=d%K���z}���ǫ�4 r����HwX_p9Pќ���G�i�C`�qf�'@E��5s������&�*s�$�w�A��� �L�
Ӷ�4�.�hv��"^Y�t4��=���"���d:��~b�0񫰒���)08s���7?���K�"��s1֝���k#ق��m8tN����A�:>r���r6M�9�%��L%��^��^Q�-0�Ă:����aR�:CU?�B��P����~1P��k��Ͱ��`��!�Еk���
c��c5�����\.K�ki��,�"�c#�zn��A`챢��J'��p_Vh����严PQp6$wk�C�ɷ#o�{iWHhޱ�����#��u�����v2���poZi���XSc� y5����ޱ��>�F�Dx�j��-��=�fH���ǆf!��/}ͺC���c8��Vy$�8|��י�*�Шk˾|���K�bJ;��ncs+a��kI��o��\ۋN����x(-D'-��u���`~�����m���+�Y�A��# zp`f�����I$z1 ���;\��=���K}J��R���Rk��n�9����3u����X����~"^E�����5ls�y`�RO�� .���A`�Qe��V~n9��o����'CV���Z3X��7LaU:91V����z�_T����۩"@���va��(��Alu4;��9�[c��{Lh&?0��S��u�ނΆN�ݴ]i;i�����'�P��J�/�S�F�Z�NP�����V��#`��Ӯ�Q���q=I�ч�BzcJ8TNò|�P|��8hf2ۖ�5e>��'k>Y���,��А	���Щ �4��3v�p� �*{��<�1뤺�X(�h��B^�A(�����z	T� ��I;���%�ךf�a8\u�A�!�VyD9�]�9�R��t<�X�IK��]���-]����1�~�{��xI!g�;�S6��p*��ޮǽ{o!{��>�^s�x$Bm�B�,����:��?%r<�;�+tb��br��ٰc�K��(,�v]����WH��8������$&�
vMs��� %�̖�����������	Sº֔��U�'�N(0��+��xO�o�r(>΢ o5P.anO�o�ԣ1���J������אs9z�m=�X詈�TS_�Rq9�u��z�ā|k�"{2%�b�#>��ߧ���(4������'ɗ�P���YC�!�-�*�o����{c`^��|D�WmV8��B\��z32p݅{Y��A�����Y���y@ _�թ��i-�ɠ�r]�O\,8d=�֓�2��C?��!������\v���U�Z9(Jmv.Y$�"ǣRN-�ͭ�H�ؽ��o���da�Gc�0Z��i�x��q:�N;�Y�6�}};FbG�+I>�~a�!?"k،�O�f;��G������9F��p'3�=����J�P�lC?N{]ߎ�P?.G��q�j������nQ+5���og/�� ��z�%�����G�q��с�!��=U������G@$&����	��=ؕ&!*~8}v�*�6���C�q�D[�Z0c1L FޣR�
��&ˬ.�\�����0�:Q&��z��^��ߧ�Z �A�)��TR����^l��kN�J��'f|6�X���M	����OU��6J�/�J�I�aIH��P��ɵ%�BG8�+a�2�����2.��^�z�1NU���ɦ �2k�#ƛ�ť������	W��[�����u'K�^���xR�Ec���B��Q�6�5���'8��k{2�'K����C��Ps��y��hn�w65xNp�$銞pk�=���:S����%m�l5�l����
��b�h��������p]`�]�?��nL�e�����%ͅ��l�?꯻1_Se��@��9aoa	p6\1�$Q�jc�_^e�߾]�D�X��W֚8xu?��p�|���������}%/%'R�
���1l{�>$��p���HV^	���-'R�U�vtl	{��/�Kc�5��<y�=��3~P~���x� �
Ts���̑����N������L��h�'�`����9�Z��0�M�ji�,8c��C`��_�+;).���<�ֹktIe�g��u忥y_nY����E��W�"M9���yq��!/C������;f��;	��1-vb�m�i���Ċs�ҿA`J~�����b�a�X߱��X�����gt~{��n���=�� 0[j��ӊuM-�A��w{�F�o`�����6�gL�m�k��"%��h�E|������5Q٣k_�M���&U�iT��� �O�7�?��N?k^e�,� ���kl���;7/*_޳����@��ex��ǭs'c�&��_��Db���\����'�m�>h[r�U8�Nؘ�_5m������:���dS#�8l!+��F
�2��>5ߠ;���H�f+�!�A��da�LW�����O�+��'�$|[�=�v'�:�f��e�F%o���������;Gp���H]��F-�Z�8���z`By��*�0(#�0�a����O۶s�Z�|���C�B{��PVҢ�N�-�0~aR5Þ����!?1'^Xf���;��Z N��:5���Ʌd*�����ū5�I'+����4b0�:�� =:�d�j[���T@yO������G� �7J-���A����oX�;�ox҅�b��]s�q=�P�n�9U�b*�w�jT$�/9�B9�T!oC�s�<x��~c�/�r���
��vB � z��Ò�9ajKF�Sr�w���q���ꉆ�p�B�3m�m˝tx
���8o΋����T��d�{z��Um�p�X�k4�B{�Qh�y}ے�GG2���)��)�kK6h$�*=�9�,w�|����N6�Ω���T�*k�Q��y�!m�opb
<�'��m9x�v}K�ԁf�_�������)�1�%Ke��H�E���l��f�И���~�(��Df��'�����bjC$�y�ܜm����_����<Kn�U�Ic��ho�-���1��W���k�ͺbj�ҝ(�&�z��p}��� ӑy&����,a?$^�q;+�JmP�y�݊��<@3&�����,��b�Ȭ"�^�{��zTb$�҉c��R��yG���'�2s���<[�_����	:F9
�Z~T�/��\��-琵��ִ]|�~���'    ��L�֛'
ٗ�*s��ޞ~��������Gv���d��m�K�G�zvB �?s�87�7��L�Ss9��-�p�H�r��Em�|C+��:��y��g\@5>�R)��9��)�6bh65>^u-]w�~&�r�Y��Yk��S�!��~�Z� �"���!��{b�D�^�*�%�s$���L�8��+�o���Z�S"�I�lQb����bM����JU��b�![�3��{/���:1��B�|p�in��\Gլ��%��S�R9L){�R0��1zb�ٳ���<�q}UzwT՜�$ߘ�5�3%�,^��9��-�,���w?C�Tg<'���	����!�P�Ґ�ͥ8����W�"0]�MX�S��Te��J^W]	�~�`�|q��L��vB�dČ��̘pؿѴ���L���غ�*y` �r��<i΢Ғ���3�(bê�.�X��g\Й�#9��%��y^�F�3cj��ûB7���L4cǜ���U����cK�Cb��L�]+�����{\������Zg�9a	��^ВF6qxכ�턠�H����M�r<	�ky��_U�����6���~�>
Gӳ���AL����ԋ9(�+i��I�q)�`�|�s���@�:p*�ѠԹ�4׊���o�{`�>f�'�kN��W_��5)?6�^���kR	Wuq
��w9����4z`�/J3z�|���o��/��XNT��L�Z�m�+$:�Q����`��s�?S�!��7�9�/�G	����Y�Н^g�����ͫ8���s�c�dƬèsw6C�uO1Θ�'�Q%H���"���8Z�sR=Zȱ�.ՙ�����o��,[ooRy`�:"��3�J^�Z6?1�������Zk�_O0��	��*�C�V�pL���	�B�X���To�����,z�I�ܨj��Tb��@��,9�u\3���&�;*o5�A�b{�<҆X�.���PM��M��ȷ�B��=�z�9ٿ��[�����'��j)��"�ㄋ�3~&��у~^�Ê'� H��p69 ��$�A7]_���V�N������a�6�J
��k�.EX��Ry`��(�vf�kք�5�´��
�!36�mú�Ác�&�	��z3쐐�M�ft�,��=�fkT�&�B��D�L�&|e�9�a�2S)��b���z)N#�׃r�K�\���y��;-��z�7τ��X��g��\'���$K�*9�r]�L.}8W�|}�~]E�k�$�R��&��x�M4��Ш�����7���`��� �,c�Z$�T��5w'�}�+�ل�I���'����4XErڅb�l�4�t��Tl��R���5rL����Zi���n�sL��M�x�0�?0��0�\z�;u�CN��-��A�C�� �?0��^� �b��է$�Ay�Z���b���l�����r��MV����|�9^a4����j�B���������OY�W��c`΢�2��z=y�А��Q����$���"!SP������N�d�Z� f�!��0�)��d�j�����w���t�n�����@80?��g��������_�@���m��w�/�����u�(��M���Rg�l�/���t����7��'<��1;y2��`f�$�/O�s�jW�Ne�e�?Lx]���p��"��N��UN�,ymZ��(P�w���X��ϷfW9����Yr�y\��Ɏ����Y�d�a���K�>I��!A׎�BN�1����~����W�6~��������ǚ�念��������J���� |8g9)�Ԋn���1c�\Y��n�%~��q����w���U���/��\5
�pR�߷���.�X �l�����0b6<�%��u��G�p�
$�,�!`��{Aӗ
C�����3Q�f��'B��i@����>��`�e9�<����C����ǘ����p�LY��5�~�#�擙	'[s��iZd<�۫�4@�I[�-0��Jp�9��M���_�[�54�9�,;�V�E~�k�������'��]��8���FD�M�[��՝}ԫ���y�=�)^kW�+��^d��
.Ϯ�{z"���+���U��I�YW�ְEC믃%�.��Y�g`�<ӣ��Q�p �4�p�q�ڶ�̑{���߬��	����m��c��m���)tO8S��Y������Ou6q2�����!��M�lJ��u���ꁴ�ÏӔ����k$�V�k��<���*���/�_���\�Oֹ&�6�	��3�p-T�Tl/=ٚ\���	�Ǆ.K�:�
3�����(~w2#K�����-0'���Z�/�tŞ[y]�gOb�@���,��{`��#��ʖw�M�p�,�3B<����f�㟁A~P����]�Qw��*�ɶ�q���(��?0�̅�,�b-M�ĉ�-��qʴ�h��c��#���S̉nm�1��z@�s��m�sF�U�8<��]���O�\NZ�kH�c�T�JǐbT%�q�tY����J���'��p��:��ZZ٩"�b2�-M&%�~=���c�Z{�= ����`����h�����Ҋ��4���eS<����%��-f� ��Tsм�k[��PK�!^�wgO����J����5�+����.6�����P���6�Z(Ǡ'_r�ۦ��Ͳ�@�wo�����+)�Mف��|{��W�ޝ���mwڻ\ϕ8�6�ș�����(Y��n�����f��Հ�o�qT%��?'�~���o�ٞ|ի7�%�B�j~�^�Hʉyf��UJ�$1o�+!����u�o��cb-��\w�R-�D!ܶD����k{��7�1!� �'[(�v�� ��>9�i���ay�c�����$G�M��t�}3z��{2Orë9���ʵ<�$x��Pc����^���+��`�%��
��ʻ���D�.�F�sV�5�V-�&���~�Uۜ����(��έO4}7O�E�SGR3�6�<ǔ���v�t`�<�r"4�yNk�(�d�G&�dymsU��\��X��Xu����=?���i:��?�l��eI2y�5�L��>�KM��OoG��NyԄ2�y���,�m�bK�����p,� �Q��x"��K�3D� Y��G�860����ñ�ӷ�1�(��c)8w��d�}�Y}�^D�Ӣ���q�m,��L4*�vxJl��Ƈy{��S�	���U�:�ϑ{�z�C��#1�����ݎ."0կ���t�+shr��-٩�_ý����-������^E��r�K˱�g	MBC��[��������聁�T���q���w������!QX��͞��&Tc��{��T |�_�5TNV�fVs��[�n������93�-ֽ�H�V8�Q��C#��F�]-e�	�k�~bv�TJ-��!�����h�R̿���~ɯ��#Rw���ً�1�ӷ�Fj��"�����Xo�O���S�w<iY�i3��8ۉ�c� j�����_� ���z��a�|���&&,6ǸlhQ���Xк[�$�y�T�"�¢�Qw^�{��j�i��@k)]?=���8�Q��g�J�
�$���C3oUGs�n���#z\N&E�vZS���i�L��$�)��{۲\?a�)��'}3�����[v�j�ʹyp8�&��� �UR>��w�Z�N�p��PT[kr#՝(�781������.�5��a��rɶ'�~\��bw+���JN�NrL�$�pRL�{���m:17�4��4��?	R�h)y3�Y"��7ß�m�N��Ús�뱭�l1e!8�1���]ߩC����5��NC��^�z�(?�B:��l�<��Z�W�����9f�u����>�Av�[�d�K�r�o+�4u�K'FR^+<�"e]�c$FOD�4���%Gw��P�⁞]0����ј]�<.��
�N�h�k萤P�ꕖtl�4��hײ��w/�H1�b����ѧ��P��;��g����N�Dס:V�'�c��8ԥ(:�KH	�m�����0�~ �����mO�%z�1�z�T�N]y�~}��    7�d����NlՔE��Kj�GB��"�����40�X�(f6R� �k�;��$s�H������ =��'fҳTO0��x8h�{b,9y��\��'��C>20����j�i��*�$ ֦��ż?0�A0	�k�{�616�ȑ���2�})��}z>�����ыt��ҖR�Y�@J*��tL���@�(2=��pM�5^��Z�3HO������9X���T9Y^�Z1�4�s�+h���5M��������k���e�'}�Q6J�9HQ�����m�����{
_sX��o�i�pO���S-ɶc|�@�H���3i�X�3�vb��v����t*1�3R�B''�����r}3��G�'K�6�5g�4�K���t�T��1;��<���S��	S.$�}ə�mO��V�՗KXݮ�����M�o��$⓭ɥ��p���S�
��X7��!�,�۹M}�i�c����*!�b�h'�}'��f<�_������������
ǻa�g�i�۲P���!y�O�ɰ�3�����&~�7&+�P�j^[���~}�*֓8��ô�P �%�MI&{�5���e�*�i�J'�^a���/sȞ�$�C� ���\x��J�*|�7�}�����j.C�T�'Xa�&�ef�+d�v}�f�����C0v]��R��t�������Z�N\Ul;~��=yĮ�LL�ߖ9Hh�n׷�=0!X�ם���H�	����2ǰ�F��o��>hFv�d\k�9"������ ��(ԡ	���z&�Q�������h������g��T��W��zl�������dt�S@�"w����h�f��9_���=�p�Y���j(;�,=F�W�BJ�i�]�b^�cΥփ��	Ժ�%s̒(�E[<�V�*�]�����q�q"C�L1[),Ϝ=7NZ�H��� ����|K9L�%ڭ$�A�SM�lJ�u����׺]긆J�fz�b�u↘��r欞bJ�8q^��a��qd�%x=Z�m�v���,qb�V�sq�R���� ��l��d��qJG�!�ƉQY��Z��ty�ʃ����W	�H���/<~��g�hTz�󗱈���R����ט��lI�K`&p�}��1Bc�uDg	m^߉�)�qҹT96�r��Cl<�fu�\��\�2T�9��f�о35I�h�9/�HE�OM^s�2�w�I@O'�8-�9�d�C����k��h.e��Ǒ=0c�f�'Ǝ9slO%'L#�G�Z�{��6v�6��w5`IƓy���p�H�4Bj�9�U��o?3x=Sz�����i��~�q����0k�m��Չ��~or��bxsT!i�Kt�������J������m����
�X���n�柭���;�5cHSg\��ʼ�8��W9�x"=iR�%o�cXe	b�I`$`��M�E����PO��J�cL6̴�Xɚ̴Z�-؏��I�R�%�UO�Eҗ����P�y���3�l-���oy,���/��?dR4jթ_��g��>�a�*�a��)��$�.Ulx�!i=cƋ�#�������垔?�^.�Hq ���$���@NF��U�a��`��3燩 �i_ �&�%�U��M�$@%�1��E����`�W�f�� [:c�ܫ�"�	�/+����,�L�G������� ebH9Y�~v6�djy��=�>���B���}v�J�J(�G���zy�������LH �g˓�Z�+�j�2E�����z��W��c*���*��f!�)��3$�F���&J��qɯX�%8�X=��X�Y�%�N�<⿷�B�hտ>�6�ݣ����Ü��Y��GI:݁>S�zx��q�+�'0� ��5�U�.�d�K��ZT���.�j�A~u�L�����Ǳ��
����{e�4`�^`H�w����8�7�z�E���u�J������x�b#ڰ�~��pY��9F����JW���b�ڦ�ەi.����70����i�Ay,I��9T	n������,���@x�Y)W�qu����\�πU�j-���U���1��9NT}9n���81UC\���d�Ze���ݳ)o`P�LHO����f3����-�a/�[�=��r3B��ڲa������[�/�2�C��1�8�kkDپ?0%�k9�$���$3�`ٳ��6��͵u��~�hoU29=��O�"	�#����<�������cQ���Ic�mJN3^Ŝ?;��SW]�{^��Wk��婢'��尮W�G¬�h�ja|jÓ�&�[J�y�hqנ�)�^��:9�sS;%�w]�ףmE)xd2<��*5�^�1�8��4�~tx}SׂBV�r�t X�:�iϟ��#�w��hv?���;��t�{�W�M�QL'�w��$�8��F]��Jsɹ�(!���a&�%���Q���.D����W����ݩ�u�!����}!#�p����5����@�gJ�`�"�J;4{�̜;�%]1�P��?0c�����$�������ޓ�2O�����F�O�>�*�1-�1b���9�NE�[�nf�&ʵ����C�ې{�16G^�i��K8���"�̈ /�_�F3�V Z�ZF�KP�����C���&Nd�_�*�J�S�8W��J/%�˭"?�ѧ��E��e���p���Q��L�7�5�2���|��//��%��Kl�8�	#P.��㖞����/;}��|r&����Fwz4b���愋��m��z G? �P}��9m?�p�̿/`[�����VN�z���.��	{�Pm�QC,<�� ��u���������eF�ZN��a�<1-
K�����΃�j뷯z��!}P����BO#��f�)9��4�I�5&���Ȗ��	I���9{�*��N0k�ݬ㪶p_� W|Ȥ��+�j�i�P�k�����ڞ���f�o:л��HTO�[�������g������]3�/��7�ӈ#����MYK,�:h%[U��*R�9�
�������+��H�Xs��U�q�N���k4t���o`Jy��r2� X�O�C��Ř�6?1�)�
�v<�_�9�?@�ZN���cp�x��i�g�*V�7���sd�ȱ	q@�x�LH������	*��L��л瞅�Ĩͱ=��� �-�ޠ�X�M���5��J5^Y�����D�e�z8����q�Ԟ��,<p���.� P6<X �ҳ(f<0�,g��R�����u}w�CC��o9)�ZC��s�%QwmN��d�S6�]O�9����!��,�L�r:Ct����ŝ��_�|c���~�O&9�
k�w� ���O:O̎�p�Ix�t!���������&����*]gM�����+t����T8�Ju�0[�.��?���$�9y�U�|��xU��5O��V-D�W̱�'�G@�Zs��ȏ���z������N�<0K����cz^��t��ěYvP���U�"%�{����xOr��#�wi܀���l{�s��-��ݕ{�b��9m���Oj��D,mm�p�N�~=��]
iӑJYB�W'
����;¬�w�3	�d�=�;���ڂ%K�
�O^���П��h�T���$�Ȉ�s2,]��:�hle�H�rh�S7������-g�:���a D*��A�	�z�o�lm���q}��aǈ����x���2f�2�Kd��˺{����8�Ǩ�כ�#lqW�)Az�p+��b�M��/�e����0���)/���M��*�9������$�;r��|��$��J�x�{$�������?���Z��h�"��Wޒ�����G�}f.��#����'y]�{�,�?�.�;��JHGNkC�8fa{�4�X/�'��7���*�Bd=�ԩ��3�m�x��	�)�۬eb�U�";��a?�h7:�ޗ7��H*0ɉ�9�j����jo炿�w��7�vW�}����A�@�R���;"o#�0�/�Uԅ�p��p�y6�.'�2׮�Hw\�`��i���ƌ�-�F��N�ǝ�>4���w}{��kH�ȕ�L`�    �������ik�xx��Ӿ�I�	H��<r�H} � @�׌6.�=Wc����_�����V?mP��t1+��x��uxo}��r�R�����V�ȵ�nY<�\g���<R�i��w�~�a�_g�����̭��k�]DS��&�����A��.���K���zS���j�;f����jj�&y��2�7��e���9q���X�e���*�N$C�� �[�n����E�I���z ���=�v^��R�l�_���a��F�0r;�tV��[��g��l��W3x\�;C�`C�~3�A�������6�.��LY�=�0b������Ef
��f��]��U���R������i�w)��3;���Z�ș�\�:T����Jp;Q���䗰����C�e���E��a��"݀�wc�gY<��h�����nP�|=�����pJ�m�m9�%g��˥!�����1_�����{��ۗF�N���t���y�D���l)�w�|������;� �"ƑN�MD�lԷ��cQ��F�n����xIv���/g[�c��`�O3��vY�;��3�S���S5~��m)\� ߛA��o�o�5�-<JNk�D0+3':���pc�#U��U��z�^O+�{s��v�;.���I�^��E_���'�D%,������D�5�����sF����V/��C#�Lݩ��wY�m��1��'�L�0�F����.�5h �H[�)�95^�Z��r?c��~��+�ۘ�&\��9S}�G �6gvd�H�;~��� �|uc�X��WI�FZR�ufv���	�|�����CnFR<-��p�9\	����Nq��Hϗc�����M�^k���&�e���0~I��
��F��6�aɒ>�4��͒�{�Ձܹ����gK�5���'w�1�
�/�!=�Zf�&R �C{
�S����7�d�W3p�#9=[�s�(#[��9P��,�s����Z�k�p��!�d��I���]
O"�ɍ+����:zKu<���P�x|`Ì�����q S�W=�����>�c'���Y}ʥp(,��{�!�ֆ������pV���/�*����6k���>�O�2�l�Zzù���[�)�(��p�$@�O�ϖ���*Y7Y��Ǖ�~�}�����Qwב���dpF��S��9lA��_)nL8��]��g�w�]x�d��]ΤA�§�������7��zFx�H�P#ܰ�̙��iqB8H��b�/u�&�z�ct�>�q'I��ײ��,�8=����0��)x�A�p9�!8,Q؈�7���k���e_�����������"�S2�e�Cr�X�ۆ��y7Ғ8�"��i��]�Y����įҸg)���|Dn�w��7��W�w����7�dgn-m�M"&��n�e�8�p.�W�$gU¿�fD���9�8�}�ڒ�Q�f�i�jDSJ#�{ ���(��s��VH������SZ3�5D��N�W��cρ�� 2���yp�r-���.��}pYO
�p�G���o��a7�c��k�΍n�A|�Vf��%�!4�1��j}��x�kD����H���%�x�&��+yN'2�y~J.�$�S[ ���v�����Sr���;�2�%�0Lj�]�V��񯔓z�\�`Eg�/�N��Ը�`�xT�b��5�⤮��wN��˶)�&���څaNø0FkJ0%{���Y�^�H���@ʼ�'�]���i��
)����a�K���9K9�Ӡ��F�O�7W��@��f�,`n�|KΌyv6�_�թfV?N��܌�J�\y����NɎrQl��p=γ�5LRVr�\1��mVz�%rOn�ѽā�������J&�f��E��P�@	#�\m��0B)��q6�ͳ�5����V���],�Z@3\�+���ǱEvP�y>\×����,�0���5�R��I�X�H!)l�8���0������<��(poϹA^�e�Y�=,b]����a�?�\o&9�
�U�;Sk]�t���v.v���|���&��ST{$'�oϾ� ��d¯��<���] <Vb魕=s�k��O9s:ixb?b�?%�ԚQ�]f/ߜR�ܒ�Cz�J����� �~���jg�i��Q)3Ȁ�\d���W+����:�a�z�!cI�l~�v�=n���-�)'k��4�%�z����-�_xbpC�<|Z8JƟ_#�NCJCǄ��=w8Y'D�Ջ��ޖ����2)?H%e%�N��j�����-��ō�[�&����҉l(����#P���+.�B���n�5Q�ˮ� /+<e�Pw:�<���rF?�Zo�m��u���09«����Ԉ���ϗ���O@Q���T���PfM������@9=ǖU��Nژ��#4�p�T[]#��np�|��_�6�ҿ/,��Y�ZC��M.�%a�y�mIE��K,�؞��~]��i��H�e�k9ƚA�=đ����y��4`l7��k��l�N?Y�s/nKK:����y�4�g[�ތ�h<h�Ӓs��a�8DÛn���d��7���ݓw�{d�<kp�X�M��|�_s��!���fl���e��ρ+C�.�+X3�σ[ͽ!�yU�sjP)�H�a^NYT�j��G���2�&�����D�0`�p�-��]�@#��I�ờ�M��>В!�����D�[�d&4f+cؙ�O6��7L�]V��9s��ZD������:�ӥO0�6�����I�q�@��9u$A)�5B��I@�26d��õ��1$j��p�5Ņ���Ur�L9<F)BD��Q�ͪ��^��;9��H%����[�H��{G�~�0��'���U�6s����<��ʼ�l����Bo���eɸ0��:r�HrMb'{MΧ������|�WTj��7iuղ)���@A*KT��:��9R�>��7�U*]%b��10J?��:�ٜ6�O)�H��K.:G�����؂\���wa�A8�1;�ש,G�Õ�̀�A8�u{�,���X4YR�y�竺-�椒��9p�Z��k59ܽp3�����5E�42k߹&�gx��}���*B�<�m`�x3-&͓�!]ofJ4��6SMի����|a�� �W��9������"'��f�S���xJd�oqӵ?mFB(&2�xJ5����PBۭ����G�d��ךKJ�����3L��j{�V���w&���� ���������C��~{��x���Z�c"5΁�ҩF�'�\��3�����FF�K}÷�d[�l������R:��0R�%O���V3���(���28=>�2��{���Z�$N��3�?x~����Pj�]w"+���I8��q*�o	��v.��-0a�a���i�A	R��Tm'7?��"8ޮ�|����n&1��PĈ�2���}�gj�[�9��5��������PS:��,�]O�4����� �p������Mb|���f,j,���6#�m.��*}���g:�e��[�v#
�4��Fl1��ĥ�\oA=���+t��h��/�|�%���ɏ��l$��ӆ�x�c���*�{�DF�E��X��6�נ����k�O$e~�Ł�ǧt)�5���D�/e�P��s���~#�:�����+7�=S�,��f��8|��=�O)�����L�>{0���S�EBSWI��z�_��π,�!k�qgF���z!̮���oy����Y���G��Jzܫ41�p���@�b�ܖ���u�H.�Be��*T�` ��̶�;^K2ۆW�P����7��ɼX�B�޷g��J)�����gg�d���C`r#o���D[N���^6�a�T��~�,I���ۊ{>�S��xJj�ȟ�*�f�6�/�h���^])w7P{ܘ����=�d�N�y'ɷ��züx�� ;��3*Ł:�*"O�H"�����U$kj�7<�ݳ��gf�Y3����1�?���@���Rg�"�lÑ�rc *�*��:�A��o�OC�a��9������!Pz
I����<� �    ���&W̶&�=��ZR�p)��Yx���aq���N~��qW��>[�u*�r�t����eoP�j���,[�SWZ����u��0�>&�aj�IA�u�x|n��a����YV�!�;�r<.S��N�������e����\/c�su7��@�a��Ķ�H����צ? \}���j��Y��UR�1|�8%�� 7�GZ�{d?�.��*7Ï;2A�@�߱
��-�܎�t��s̄]4.Z�T��\g�dp����&� ����oO&��a\#�ތle��*ͳ������C�I{��_g�84�"i]{�ƙ��8�=�qR^�F����/����͠�FJ�'I��j���\�H���.C���2��8��o��n����A����PKx6����Y��*����A����Uy��q4�������x�bO�S"wƒ\V�k��ʙ���Yl=N]��*�iX�L�:��%�0G]�M���T
��2�v��U��e���fW@6�wąj�C6�~ǈ�p�~x��5��\I��3C��Z
��uzN�X�V�K�>�vҁ�@�ɒ0ސ�Ȁz�s�,2��9֜#N�|�IS�O��2u�H�#3nU2ǽ7=��D�Ӛ<�j���溩����,n�i�]i�H���i����rͫ�Ǹ��Kl6��d�#ρ▄�mҥ�����%�m��f:0� ��0��.7�o��xd��=����T��4�.�sD���Vg>��JJ���z���-�B���]�m��T6%؏�ġV�(��7Mn��h����"xߐ��:�lF��6�żG�:��z[����v��ݳ�眔iˑ�FZ6���kb{>(}uC[`��1��Z,%T������y� �T���+�;�T��� ;��w-+�S2#�Ȥ��]�"����Th�ҝI�en/6NNpH��'t7㐹=_��S�7���=�J����8��䌋�s}����l��7�d��V+�������:떍�8���0��(x#��d mH���ҏ��8��ȹ���:<?�0��Jh֚O1�H��-cPreWek��s�]��q�=U�����	�VsY�s�Z��7��X\��i�F. |�t�V���io�W���� �'��LxS�a�-u��Yش�ِ�B��G�ן�R�G�An�]�؃����;3M�r���=0��ٜ��ȭ]nJ�7l���]Xk�*��Y֗���u���A���8@5X��P�-]f��	6�)�~��7T�_uB���D߻a���,��j��3�Zڷ��:����RIF���H���|y��;�xA'΋��z�Lߺ�5`��+�̂�ne*$qDV���z?)T�+=�E��f-��\�۞Ѧ��9�$�N�fX��q>�_��4QH녏	?�]��xJG�G��J,��z}Ԕ���yu�)�n��^*�G����Q�'�s��W��0� �vqc(^Mh�ˋm�lo�mN�dw���ҷv�5 ����v�>SJ�rleX\�A��Ț�-��~���T�|��<�ްJ�7��W��V�;�P��?͍�F�~v�c\�Jї��4޹ �4����]�0��.7��Z�>���52A�2�Kܗ wr ��]�0�$Y:�^���E,b�����㪇��\Y%����y,�9ߐӴN*���SG�j��Rjn� '���CQah�|x]ܘ��g�\bM�pOq���1#�7�x����Z ����OiW/�)�g!���u��4�}L�UE&���e�dO`�S��9��n)��|e�Sw�j��1��p/�g��a|��
]G+�����k.�P3�)�g��#��#պ{�j2��8�Xa��))�0�!�z#��ږ�*eIၤ��A
��,���dGa��	�F7K3inٵ�W��y\�Zv�La^4^�H��G<���9|�W!�9����gK�y��~�����ڲ=tQ��^g%C.0���
 ���C�>�p�����c;_!UY�ҩ�^��9�v�>?��A��U�r9` �Z�]S�cC��Jo}!�<��a���jc����0�8U����E$|pm��^�J�D�dv�p�}�X�)�t-���uSĤ��<{�jR+��tw����1'��a�"%�Z��59~��ɔ�U���m�F�X�E��#��|�vu�"�ה#�7�?���̩� ��k��EM:լ��H	8 ^kp�gm(�0�#\wJ&$�2�}o���y�4�4��[��w+xZdא�ͳ����aS~�����D�)T��f#'On��jRč���[ڲ����0򩭚�pu�y�*H:nI�Ckd��(���i�D�w��NE��Ρ�N�ҵq��[[�k����7l���=��7����kP(�y5����	�����y_E����&�����w�]��U�rqMJ��|@��1r��S��#��#���w=�L�I��i"dU7����A'���e��Wȅ�]��x����?i�n���α��]<g��[-7 �"G=2���~+�ltb=�0w|ƌC��JY�%ρ�-��߷ą!�ѷc�j�{�!��`	�6�.����x~�}��v�P��Ըs�V�⥅vLA�u&���/a�\Ibr\�"��2�����
�|}r®Jr�\L0��ȝ�N��n,�sc�����ia��N�Tl�s�)���q��(�� G8f���s�\����fQ��ª�E����\��F����,z3�Qv��5�ɾ MKs�r�F�6��b�� �V.Z��hk�bX�W6� �D����A�>F�#jo*݌N}�2R���j�3��L6��[��3$Lm��;-�=TheP�Ň���Bll��oLc.I����v�ڃ��5ǥp�ҕk���
\�O�a"ZS�Y[<�\��t����SJ��	"���y}�9����܌K�x9�eԑ�R������Ω��~&���DO���(2��ё������}�?��\�s�m��9Q�h��9�)�e�rD���}/�࡚���pߵ��3�Q#nW/��|������cdM�n�݊l`X��D��$�]��1B��w�d�7�.!��?�&#/K>�@0�`]���ӟ�K�DP"���C_�;�)�I�MsO@J�(�P�
ϳʆa�>�7���=�	ݞ����6�.{Ie�������kvQ��w�T��@1]S�xI�E*^��痃�S}2�h��t
g�z�ݜ�%6��h����s����3!�4	orkoS'YD!��`EZ-Xr~/m���5������/=�3��u1�)Mٿk�}�ƴ��dJ�KM �}��b�s&Pl�=V����;���_P�������?�����Q�4��k�47�/����Q""3��Q)��^O��:�ߙ�o~+#�	R�r��F�'F\����S	����GNn&��<w-�LF��W��C�wf���?��?�R��� YL�bx�sn����Ә�
��)�3�FK�o_��\����7�L�/и��yxǓ;���$��6�z����E�9�5��o�~j�J���4�8�*+��}�����ee�0@�+�\�l�w�nL��st�{���_^A�h�gr�;�
�4�T�w]�jt��C�j�k:��^��l��J�n-��hf��r=5���`���^��B��0���KR����(���dEF��v�=�rm{�_n�o7(��������_��NgD
2��[�NȺvDft��k�_�|�kzO��p��6̉%)ㄅF<�>���Y�����%ͺ�]s�<y�Z��,v��=��5L��ڍU�w*;�ψ�A���Ld��W�����>_��X�e����86�͔���ۅ�xG5[�@�8n���[�7p���[�Rf�/�2����D�7L���,d��Ʃ4w�#�5�}��������\���/O�tvfSg�a����RU��[{����a�'�ެ�ĝ`MzR�,��.mP���#Iz_s��S�U�4)��<�M
���y�O��(��w}~�>J�F�����OD���J\O}̺��͍�aR&    <�͜,S'�8��:"EN�2�A�y2��s_�p��8��$��tf��-˭�w�=r�%븴�7�:�M��G�^�v=9O�ZM��0�T\�m6܀?��3�]<�=�w�E�9/>��I��z����a�ض�l�d�w��L+�{��y�@zj��=a�U��1X�FSt!�0@���S(ҡa�������<��ב=�a��]E��9��s��hE:4:�:�����AK����0����h�qzD���(q�����⥦P�ō!&@N��I�DZ0�rù����O~��?�y�is�6�&9^ȍua�+��0ɨ��6G��S*_F$Z�3�Dی"����'�]�a�Q�nT�Ŗ�Z��P%+�����H�R���5�5���ܠ~	���K@����4�*�5RXF����m���H��l����v�p�H��ê���N��Yد]?nf��_�Rg�<3BiI��8��9�~�uɁO ��:2�Ja��b��N(�O`��)8�0�G�O��v��35�}X�L�c
�^�R��ɟ�Ѕa�T�j$a�X��ƍ�V�w]cX��_����c����s[4ROs��T3\���T+>j�̚G� ���]�����֝�))d�	Vz��yE�F?���)�aU.��J��๴�) �ZYPI~���W�;D�{�U�d�x,��ِ`�=���.)ʌz�
��~���8�W��SE#�3��ׇX�0�i���50w/�Oܘ�`hD�"m�so���r6�9]�7�y�N�h"�h�}ĵQ9�����n�Ǜ*���qZ���n���T�KQf_6f3�?��P��|�� �X] g��2�r��u�̃R�㛤����1Paj.� ��:FqU���@�-���7L��啹�15�rd?��r����țs�~R$�K�$�e�T���� s�ǒ��p��D�u��&赽͹�5��Y�F�Y6��8������%��Zqg~@����t�e-���(")�B4w���=�y�B�ɉ݌n*.:g�CZv�\����bV�h{�%u��1�>�a�3�^=���5'���T�{1�o��a�*��	0�:�U����^��p�͒�����O�����ǉ�3��<��v�����S��/�R��ZD������
�7y���=)����Gkʠl���9"-�^vĢ�=�{Ki�gw��eso��F�7�qu�S	fF�z&�Yu���G�c�6��O�3�+�ll��@�J|J
�Sۮ�9����/F.xc"w6���)8��R��
�q*���;_�!Rh7��7C֗T]#*��ſ)�29���0�|X�J%��q"H�&�x.�uU���CN{~��s�["��̊����P�m2���z��8<M'��S%��n��tE��s�}hD%
��LR�Վ�6�x���&�MWڣn��U��iZ)�<$I>b���A2�q��� x�s�Ha�p�iXzfD����_��^4��_��Ԫ�9g�QO����� 4�Ul5~�I��N��1��@�H+���H).H
W��&K�~��Hj�6!jQi�R�\��R�ܩsyA'D�&0��d�+�MZm7�M�,rF�dKR�7�
x���x>\kvO��\�A#���R-7�����":j�
'��Xnb%	�M��К����r�h�g~U�����n�a�����0W^vV9=9�{i��k�7+���y�_�Hn�x�g!L�kn���H���_O�Y��5��� ��@^��TZ�����Y�[Ƕ�]L��t3�2" �F-�k+�v�h'h5"V@�`����Z��u�(�Ƥ����Ӫ=~���U��U���iPoh)�!�����<�-�A#{l�@{\�k��"*7�d���# �J��;�
�1�<�U��i��ͽ����]l�Z��@��O�D�Б�z�;�ae�W
�s6�v�ڀqP�N���������P&��������"�F�3�8U*Y���"V[uCo�Oe���p��Z���r�Ä爸ӷ�-.#*�z}�!�>H�}��� �k��2�}~1�*Fd�����X�;d��'r�v�Z,�k�9(*�C�棻����k��J��G�4�ٓ��'�Z���d����k�c�����4����
��٩��G���ĩ����vI7����0���͋3#�l�\r�F,��Y��eش�����p�Hx���T�P$��Y����3�h�5R����m�0K����:&��2��E�҉��g)����'
��6wwmAIO����}G֨ZG����[Ci��]��@K��U����٭�Ғ���n�`�>?��-; �VsC���:���C�9-�uKZG���s��}L˭Ƥظ	J�mMy�\QKq�����;��ϻ�'� ȍ��p�"Dg�erܗl%�G�G�s�|���l�ptQ�׸28W�l���D��-�6�����ڧ6nr1�a�T������˞��'��7�,ٻ>/�a��dA���=����)�$	��uS�d}Y�����!�1�W�#��#=nB�O��,;@� M��]��ҥ|Y�	�݆�u�J5�o��)���)L_�%P�x�e��ԺR�����x�T�m9�:-R���.ۣ鮯G�0�'2�v�M��rM!/ɎY_�4�Y�CJc6�緃�.�#�*��m����T�Y��/	����#e���0�ǽ���ay�\�?�����p��?ϕ$_�f70��9A2Up$��QJ���� m��ϻ���_�Q?�X��т}�e�p� �>M���8�.dD��RY`��P�ՓRa����]����ɟ0LDksěɟ�z���HQA,3�{9��yA��yq���ٳ\��_>�P�֔��wL�HE;��ޏ��+z_�f���D������I'�v�r����|��؇�^ܘޮ��G��b���u�C;tZ���S�߰�g��Rᦢ� ���4�o��R]d��vDV?r�����Kf�֘ov��;z�,�i�YFˑ��o���灊�Z����s�6!i%3u��^�㇁��e`��*��"��&�r�ns��0�e��s�C�vHʂ`�$+�ͦՂ*[��3������#4k�*�������^SR���n�S�'q�J���E��� N���u�J�*8�t���^����ڹ��C�6�����|�|5[����1F\�8K����ϲ:1�!M��I�h�W�xJ��\�A�=��d�o��ě�
�X��g�9t��Ϻ�o�V��7̩�@�cT�'l5��}�?j��gv����Tl7�R�U'�����gV[������H�oX�.�#�;qY8@~�8���8m�]����?��6�7������*��{��+G�cP��	�~��Vo��ԕʁ��5�Q{�K�;ě��qM�?���D�ck�r�۞:cz�땺�����i��0�@W��wW��$��ʡ��9���T$����h�v��>��7�ѹ͹�֊'oK2�$��q������.���K�^#�,��� ?���wh-��ऽ#�~�0�Pr�l�nB�`VJ��8��ھ�T{g�]�̟B/	O$�9��Gz�.��ĩf'=�q��!�Kf���N�2 ?;����aTA)k:����xI)��b.Rk�fg�,JY~�*����.>�=�?��݈�)�� -'�Xji�f9gj�9�ݕ��0���A��S�˽Kl�,]�$��rDae��J���.��|À�cH�;;ϞT$�J�԰䫛�ҷ; F>����Oݫ��5%˸�Eay�}��*&^P��߭��"挝�Ϲ��%�?�	�����5�+�ȵ؏�ɜ��P�L�r`�5�?���0�����54�G�ia ܝ]֕FT���ّ��nL�@�|�[Z�{�;��|J3�J�� ���=_��FI���t>3}&C:߾�����`䐭��Q?�&�����iV��h�&�[���8����t��O������x�3{*���k� �=��ڕ���������,F�ZW�l�bC�k    ��$D��Y��4�}���r�ս�QPr���+QI�6�U�y�K�&��\<�5z$�K���I�V�P� ���K�����Br�bpL�,-���nܛU�%;r�5����H�V�h�=#�G�j���Ѻ�\	������ğ�i���������I�1ɻ���
�a���	>�d7�R�*�3�����z<~v"S:�f[c��ki�yvJ>��ʟu�Z�+�Dpv�#�[�U�{�����a\k���̣�DƌX�$�[��2O\���B�F>��o�9yO��[BɊ��ج�7dҪ�@]�ڇA�f�y�6\�]9�P%�a!�⠷9�4��0\�a�t�dER�)P��!`E�EZ��:���đ>c�E �lq�����D�xN�#,��$�R?��nv»�<��%�'${V���9ޘiܦ�R9Yoh�*u�2�`)��VM���n~"&�:��ˇa�CM�f�����M
��
������q�g��H
��N�C��n�n{�\q �v*E�c��&�pu!�.���.�s��g��ux`�?Lӽf�w@8�lS��$<�{d�'�Fj��'zk�X�j����዆�O3՛�J���=��FNܘ8d�֧��'��I{�7��M������l�H�Gݣ��'Fb����/� �p�P�zr��jk�M�*��ԅٱ�*_�V%���;юbI���J}����Y�=�g=?��Y��o���Ǎ�	i��2��� *�����RmG�ݴ���5��
��>����1]N���C���5L,W�v�ґN�j���eS��-��+�_����ET��βv�~ۚ5�Z�o���~�0��L��0��k�B�s8�5q/I�W���Ӹ����q��SV���ƫ9�q�,j3w���_��̟ET�ڽ��r�c�>�⒃�50�e����sM�|�l�Dn6Dv��[ģ*cd_�gyn��Y��a���a���w���<0���vk��GZ�g��M�0(�y�+9�b�~���/X)�t2�9=��u����?K�r�)�KK
�"[�%�\���i�r��3%�`]����D�9u�V�;]��F�I������3�0��Ͳ2R��t�ӈI�0Rm]�&eG{[���a$W�o�.�6ocK	�7F���H!�(рOK"�i��*z#�М�T�ҷ�½S�q����CJl����i���tS
�amE(�	����J�G���#�|�0���ܔ��\�q��l�:;P�M4n,�"��"S�z���(i� ��OIrg���������ڃ���K��7��h}i� �Ya�03�S҈���>�|5Y)j@��2�:�m����^�'��Ȱ	�q@�vަ��eҏCd7W��מ_r�@�4�V"F�,DT����B��v�|�Rf=^A�V"zWbǸ~��MW����{�?����������&��ך+@&�l�68[_���\g����j��������/�����?b��W�k_�8��n&�W�����i�=�.i.��ȱ3�m}�_����?c# ��rWM��CY���@M�a��'�ϗ�4K��ni�F���C��ũ*�B�7q܎�Ksa�X�W���;�mE�Z#��ah[��z�4����o�ěi��Z�,>q��ҾTk��R�<%�7z�w�½�(%���\ IW�����KV���,r�T�㽘G:��v�y�l���m���z~�2�bB�7t?�:h�Y�ڽp5)�{+ �Nx�����%�c?q�2��hP�y�ޡa����h�>��"s�+��56�rj2�o��}���NS��I�}�89�nj��7Z��r�%G�"Y�E��1����^�Rё���V���e�/�a�$av���W�?���KU�������J�3��.����Y�����
��q�P��F�⟛Iq_�=�~���85*��������78{�9.Ύ�5Ӵ1<�p�*�$g�9Zog>_H���5�7�(��N����)$������`8k�>l����"כ�m��ғx��w11�������J���y_�0p䎇d��Z|�H%I�-�5G2���a����K�X��0�!�b=7��{���'��싗�>!����iǫ��ܒI�.N�7Oy͵�ߣ�~��_�8d���𽹡�Hqf֪5K������j�]�#�FD�W�һ�������@=J�qk���$�A�H��|��0c��F�7�c��ŷ�R�������0�bD���=�zV�x�j�ڎ�
hk�+`'1�.��)zS����g��g?�Az�bP��'@�g��K��v���Z%���z]�Yi��t�Ʋ����~�$6񋸣̪�{��a\RF<������K�i���h�
��9��w@�"-�_��A��'��Od�W�5�(�2#Ф�h�ϧs�(��g��@`��!��1'�=����Q�#ӡ�S_o�a>`H���bgoiZ�[j�[a�M�?s��Q?�0n4���a�^�'��[�0��'�!�?�)QB8���yʘ'�A<�3�'ٱ�,�8�������yv�4mv���*�GY�?+�UK3��pb\���z�8���o�f�K��L�օ�q�	�ɏ�f2���5�+�o_�'7N?n�f��5P�l)�4$H�����0��Z�K��T�]K���\\z�ZN*�B;���`F>a�!�5K� ���9�p��2!<a>Ϸ��2`U�Y"ˢu�qY:�����������$����zr�o�D������6rؤ3ՂMv5��o^�iM��+�D�g{�9��p�e0AI����W=? ��е�ETR�N�����xG*�4����2|E��]i��1����Fp�8��2ֶ��2|���=�ǽ�+��Ԥ~�'��}�w�"b?��1����M� Ϧ�S$��",_b)N��<�#c�u��,�!Ò��X�9�ҳxP�N�d��m��ӡ0�~�j������x��:J_a'"�5�v����a�-��5X�C�YZX��떳�!���%���p�j$��b��,���b�_]畫��bn�����a�&����aljI4��v�H!�Vu�%~��4s&W.o����SJ�%�t/��`.��s�r<�_���H:����ç�$aI��Dn=����ۯ�[Fo�{4�L�|0BQ�ԍt1�\�hLS(���r_)3�2�Nb�q�1�T���&�͇7Z�σ~J�r���L��*J���H����������G��Ӥ��(G_�G�)m��130o?��K5����y�K~r��k�s=Xv��9�Ti����M]��ˢLWXǒ�^(y�"U�q*�]m���ϗ�8�o���fk*�Y�l�T	R���e�۳���0�O�Û�ٷM�m��
���\j;����r|�T�	��E`^R ��������k���>_u�T!�5'�/H�Tq�p*�9����E=Ɲ̚�xJd�*�7L���f��&g#��:=`��6hz��[j_�`*c^�Z-�Li�E�@ӊ��#i�{?P��$Z1�~#B!W�/e�Q�����a��/��JQ���W5��E�Lh�F�V?h�`����/Qr�Jz��Y�ȥ�"���#>��e���<_����G��7L|h=qO(��5�N'x�!?B�ޟ���^4R�r1��m���Uj�ߞ������[�RF젛�Z�y�-eqV/k�����t
<�U�=��$�|#I����͕�����y��½Dh��0��>/*��яX�R�g�Y��1+�6y�R�����c8�Z)��EY�p�#�Z�'g �,�x̎j?χkI�N�&=kCO�9W�R�޲u�Z���m� ?�)}�v�9�gn�6��=��4\L� �I9�u�yaO�D��WWh�3k�5(nq �=|���y�I�Ǥ8ۍN�O5Q���������t�C����y��4L�@�zk�+<k��)b���tIǹl����d�?L��d����D�5"��Z�^O��Y��O����_`~&��-ki2�@W��y��O�˗- p�h���m�f|*90�    QZ��¼c�*�g�_�V���Bk��#��4`�
L���.��}�#�n��Y�F$��	������G��"}>�=�1���Jb�J�n|�AH-�oҊ����	yI2$��V{��U>�Dn��E�"�S�ٹ<����rr�j��xN����m����]�T'����C���rF��-���S�$��֮��0�:�,�!�}V�5�/��$q�?�� |���(G���DZ�3��w�+p�����;"��8�cr�k��� 
�h�^jɂ{��>���a��?+;]��l�]
�H��s�j����y�ϕ4;j"�7>�����,+E$�8ԈJ)��v*��g��x��{��E��޶�����m��;�����s�m����O�g�OЀ<G7��&<���r��"wsG�l����o��3��P��^f��~p�q��R'��<��Y���Ե����&�p��"?��,CM�ʕ-��6�������Ӟ4�Y
�f��I��}��q��v����$n&'q���)!fK��Y�1�P��m59k����oX�γS@W���&�J�Xh��w����]w5����W��F0՛����5���b���%�m���>���T�p�c2b�m-��Lo��*����0U�RodU �S�!K������@����+�y6j�ȉmD��!��A8��׳`I��0U����K�PTmp��1�-���ڇi}�{-Q60/vC}������<C,g$�}&c/w��y�K*�k�r���:�9� ��"?�c�;��uQ׶^��!ўV|ȋ3�q	I�����bK�9#����`�4�i^�7��f��=��>j���vY�#�����0��*�����*΂C��6܇�ݸg[S�����d���,��E��½�Ⲵ�#��3���w��0�q�1L)�iv�vr
�x,���[�$���=2F�k-7��e�c�w����Ҏ��ü�X�_O�&��5:7�ͽ�) ܀J]���l���i=�{�{f�)>�
P2'ގ�kP�u�H9@0���J��\��ܘQ�lZ�1����A���͵��ʕ����򐴸�+�J9m�7`8G�8FI��z��:�(u}]��pL.�fJ�˩�i��_˗@
�c�[�����;��#w�սL�I��h@��5�5q�}��A$�u��7Z�|r�Ӥ�)ѡ���ܦv4^�{�Ř���t�!h���9�\=@ސy����yc��n+q�^����<(7�C��PW�]��-� (q�b�옱�"���Ђ!#�t���u�׷��&�I�F�!�#��������w��L1#�v��`�aؑT����/��w��~R�a�e3��H`���؍����	�I�R������2H޾J� *yA�0�;��t,&�Wg�F��#���_R�7��eD�C�I�[����aW�&Խ������!*�f@���D�PhҐ��ԇR�mQ�׿$�gY�"�F�0��)ш�����,Nk Je����3%����� �\3?Y�8!{�ߦVx�bm�aH�_/]��~�x�,>��ds$�|9#U�Sw[�;�x�>S�CȌo�5���S~�|b�qJ�����k�vяi���i���Ө0\��%��:g��u���J�O�iԯ�f��*t��|��NO&��\�<�e�����G���n�ez	���Z-��r�L�j����g}�5��nF*|�ʢ�m'�Mݔ�Sd���,��HE��D�5�-�Χ \��c���Nf�,�w�7�"���7���:Jl�J�D��Ni!�ҙY���?Ä�/K��ŝ��VK��.����3�}nDw�HE��b7㨅k�!u�*R Ġ T��ٵ�\኷���3�e[����n�=%��cp���<XN6�m.�������*s^�k��Cjp��gk�ZFB��r���o�볩��^7�)�@<����;�^�Tf�mod��m|���~�eO�!*s���#��F�u�vw9�;��������h=��+���>GM�z�Lyg_��~9F��CR��*�/�p$i�Ѯr��c.S*/߬o/O�w(M�����5�j�"%�1�m9ͼ6uD���=3F�'�g|Q�C ��9i�X�*5yT�|�<�d��퓺a�8��t�7���|L�{��D�Dב�����.�#˧��J!#��Y��(��q�|Ww�cI���gc3�+����Ju���Z��������ퟢ����f_+z����ܘF��|�X�����L4��SU.����׿�����ނ�E��VNE�F�n��E��-&~�q��g�A0Q���, ��.1��b)��X�ù��|�p���j�|�9{CF��+��������W�/>������%#���چ/<���d��{>A�'��'����\������	4d˫����$��~�'m�%��.���1v�~�S*��&���taFETMx#��{ȞH��=�����9����5���J�UO��LwoIE����;��2�|�	��fO�f�#�Cne�d-8���3���tE�����Xn�(���Q�=��g8���������c� V�d�уyT��b�QMk3���o�E�b��o�HʤP.iY��1w��Hwe�h����P�a�>�l�Jw�*��$.;��)�Iy��`��7`�Jכe��tƢ����㵥�M�{_�z���M��0�?-[��;�,��~�P:3�!'��Uo������0�ɕ��_2�%Au�b�Q	pQ�RG��S����\�f�k��譶�8x#��>�A
���8��ސ{�Z��K��:%��zd9%���6'�:��=M�e�����}.G&��uϑ�JZ���M�Lx����.�7�'R���ʚz);��f)n�����i���.r���V��T�:�� l�H���v��Ce��7&�=�Nf:�B��%������[�_;�Zh�����W���N�Cv��z�D�O�nV�������fo[b2��P%�MxOs�Ỽ|�1��iћ9۽K�:+�J�wO�Q�^sF
���{Ä\w�o�}���0��4q�FA�w�hp��/�/��c��X��}91YO+l2%���'"H!s�Sd������rwah Z[��Z�D�\�&�j{��lyw��CАT�o�zj� /Ԩ��(, O*HK>�����EUw6��AO�ȧ|�0.�1���+.��,�k��RiEۚ��t����ƚ%��G偤���n}D�%{�0�n-�����T ߜ��w7����TICf����CʻBxފ��]_�J�� I���C���"C(tu9�SM�)�P���ԏ�i���(w���Ur=��B�e����ǰIb<-֎k�r���� ƴ��Lu����]7�rrCJYO�ɽ�9ޞC����M�h��I4��Eg	���͍T�~�S
�Ї�]/|�܈c'#s��E1K��V9����?���g�k�Zn0QV���h��T|�v��⻇X���Ok�0D��7v�����hR�ౖ��P��<��!}d��E�A.(Tc0�dep�gNG2��3�[�e��y\��y�)u��鐐'R�E��$0���P����'��ꦘ+xT�H��K�0m/��~�����f�G���6�	�w��о3=S��mّ�Wu��U�M%ߌE�:@����O�ݺ�NN\Ǳ��O/��uvd<*rE��l�%�(��4`��f��m{�����0�sP�#��W�|���szl@�"�^�y�c���E�]@���EA�t�I���������a�#-7��x��6,Ē+�9k:�W�S3�����0��7����oվR��ʻ'?_qiȟs~}*hnK�rèn��+�Q�:��z�����	����Á�ܬ;��~~�y#"Ȗ׈E¬
�b���2���8_�9��+AM:-99��g;g��㍆�Ov#����b1��ngD��C8c�=�Q�����3b8�u��o��=�?�u���7�j��wog?�����r�
���    j���-���!J��F���2� �-�L��JV�*N��I��������E�����,|#�js٩��֔ ��3gI&G��PE UH�����y
v�$A,?N��d�2�ίo�0}�jst6��R��\L﫤�-��A���B��7.�΄w�<WL��䌫�Do���_���4���V��e.�5y����g�8�wH¿�H��73�J��b�	�A�Kk�5��UF�8|����X(�&	,�81�*��@�Nu�vV+l��@m�R�1.b1�up+V҉�X:r�Z@z�6r��^.�����>�z�����nFQ]Br<���s�BB[x�e��.�>���Բ��ف����p/� -�|�n��r@����\����
�F�d9�����<2��Ø6�A����6��ZN,�T�$��\���S?��܈������)�u����Ϻqk���>��4.9�Rٻ�.V�1JA)�| lQwQ��7�1T>�qc.�)����'��#x�
�R>��Щu׬���xp��+2 b�Q�� ѯ�N�=7e�\��;��q����V��LK�S�Gl��G�!V���z�b�W���bS'�H�X.cܗ�4y��b���,!|�,�ɫH�e����c�H�^7h��[8�1L᏶v��r���l#�==��1����U��)l��Y��O�&#�� ]��L}+N�B�R��-$�Hj�Y~��VgDg��_q����%�)[�d����$9&�)&�.|��@pzZ*'�� ���p�+�y�?�����%	�5���_��O���fw,��4�-���;s�J��3�K�v�p��5�A�]�p{+|�df���S^�"��Hxjq��ϙ��OŢ�S�\��Г[~������"P�$���~��O�=�V%u�;��<a�]ʻ��_��Fн��iK&^Q�0��U�h�F�v�&��S��*m_go�%�đWا��������R���]��	}��q�#��ljmF�8`G�p#�9��!�����}��E�e�)��3F�]`k&����u��0
� ��Y��j�Z洪	D��G�7�v7�c�;��2�}$Nz�����R�>���v\�bL��H�n��0��)E��߰7�W[�F�.�$�h*��P�\�|w��1L)��~U��nF���XΗ��S(�=W�sȽ�)�VPO�p|ID��E�;So	��%��"�zl[B*�r��cY���bWX�鉩�)���|�=b���Gە@Kc��Er[X#�HqY+-����a��.�?Hg�&Xo*��ӌ�H!k�/������È}���)ܚdi =Tеq��OڧK�աl�^Q~����)�B���Jg�aZE�F������lv^��(�?�Eo$^& \��$h��{6�ax�5�����u������L��5�9t������dXS���36=�)�R�McLܶs�!�>��D��Bs ���z�K1��B7��le��S>yoF��ɔ������%|��]u���v��Dly�ۭ�Õf�}��JJ0���H}xY����D�����I0��5�&�����0���J�C�Z�������Ǚ�+�N���`�2�͸��Ԛ��,��Dcp��U_�pY���Kd-l7��+��S�㺌��%2ݩ�����{�����<��ڍ�{i4)Z�3�#� =��cd�d#���q,�k�!sjg�Ԇr���4R��|�+���,��U���+��ݐLgzH�!A=�ܺ��f�8_q��1�sс*Sq�i�ڼc�n癪��� {A�go�Ɩo�D�6p8�N�����֢�E{d�op)�>��nF��e�c �iIF�ח���I��9������0�Y�f��i�.މWp�����H�����j�_����k�����K 5F��Sck�t��D'?2��7pĻK6�T��횆lsk=s}=���+���&�fRʀnI� �6[˳7�����0�A�s5>9T��в�o��MK*v���]��G��H������/��H��	i&~7g��n��r&�/�臹��t���W�x@4z�	oӁg�j��m;��h�p]�c���N\� )���3 �jIW�9|��L�_��"ˍJ�f�8��i�m���R���z^Ά�h�k��|uc��<W�DUw�<�*;�zH6�럒F�Z�7:��7��dD�w�ْ���e�l��p���f�+�kʣ�4r��!<��j'_*�����%��nv6���Iڬ�]���Z�8�@�)���Sv �7�=�/�c��D������1c⑵#So��#hAʜo�`���5��/��GbS+2���	������F���5��\Ns<x�M���ש��# ���f)�gߩH�d��>�ITz�����7��bHn���'����i,\��M)� z�7LP9�s�|�!��	�w'��i�@R�i[���>Z[P��+���vj^0�r��.y�9sg`�����f.�*Q�V.:G�k�Z9!
=��H�K���rO5y��3C�ƎX{E�֬v�:	�,�d�NCFMu5������:U�b�F�"#�^��9���p�Jj�M��"\��6~z�䯳��"��H�y�p��(��X��(��Ũ�Rz{a�)��F�j\��:x�vB���8!o�!�^g{{��c���ڍ�����4Oe�k�P�`'&�Lm��-5�3"��dC��`�[���'_�7ZBN=&�je�=}��9�Ͳg/�F͜���]95$�!�f����\��O�7��XXTO�+6�h�&�v2:�����}��bD�j�P�6���h�ud߇�љCT�������
���7���>�A$�Ӹ�!E��h�
O¸���w���|�:�&S��T�N_Ԧ�����ޞ	�a����Y��`�fk�X��<��P�!��v��7�lgiW�S�k�ꖬ
Ô�|Q�X֌+��Ï��U�� ��wZy7c��!Y��g/��p�xEs�_=D����ϵ}�V��(&��ۋp0�f)7�r�mF@�K��K�����O˺��9`�ɍ$"i�S����Z�pSf�1�l���70�S��v��uN�T�C��vj�r:l�1q�o����E��0F^�93�����G�@1��CR����FB����}�WU��gȮ��)Y���>����dH��>�W�xE6�T,H���O1ʪ��\���J��^�M���O�kNKʣ"��OE'Z��y}�NBʬz�7%]��5<����ACY����m�ʕ��I��[���нN.�r�{�ON=&��W���7F�C��*Z㓛�ńK�=�Den�-i��i0��z#��:{�)�K�nW.	�ҩc���띯F��6*73Q�,/38�c�U�������u���O��ٍ�տ�[Ļ��88���<��FETTM�P;� ?c��~������D��KB�k�W�k����W#\S���F"�}���^]ڌ��� 6�>����jv��]$�z��R퍅����s�٣��%�y�S��hwU�)������c�} i*��J]VƄ�_%$�e����~�����c�����H�|h��*٘0�_�n���Ю�m&�kiN�(�M�B����%���������ۍ
Q���ɸ!w.1#WI��5<�Һ����%:#M�ЅB�] ?�}q�i;��{!?��o�1a��������`4��x{Ha(B(!��uZ���0�|��&E�����7ۄa�7tkV��ǥ����'l����CŮ�\{L95��4V�f��n�Xc��]oOv``z@���%�:a��T�(Ë�l)�1:y��O��]B�J�Ys��w_3M�~Yĝ�%�	�AH.U^�a�aX��4�MV.��N	9u�	J�r,�P޹K����D�>����ϲ��Z�6�<)��R[rhy��z��E��2�\���I) \�|��R�`��6i��[����2�l<�u ��p���[���b�G�?з���X�٬���6�bOvB��\��Iy�A
H�~���ј���O-y�]�a���et�#��*�    �-T��|J�7s�}��'2�Qsإ!7��6��&u��{��F5�7�~y����k���{|���p����_�w|�ᦣ}�>#�(��g�@.�h7V����5��>��fS�7��|�5��vHSc�"uD�����Kj��D�u<�٩�G
BK�k����Ry��#!��\�CyYY�Ȅ(��s���RN:Q\��Ȗbᛐ��̚.�U�U�>A3�@��0c�1������Cj74s������q����L�@E���R�M"D���(�����*��"�Ek��p��|���yf]-�j�NɁ�R�8�۳���2~}���7��s��6E�w�|C�B:�Gi:�~�(B�?��7{!���H��zY��ZAIhS����R-A�z#6�zr��j���H*���H�����a�"������`#��Bb�1\���\���^��$:���nn��gs�h8[����}'�Z�+m��'J�����fKޗ�fK� |���y0'�_�t�)�����v�/c"
���#�`���9��[�ŢFU�R������3�ϒ��,��,����3��}@�|#�Iui�)�D���v����N�o�۵C�˵���3|�-%��h�.X�xF���l���_;z8k�i��[�4��H[����������������gCO�#K$�?rS�S����d#�{#�iO�xIs�N��?���	��|�+bk���>$궙��Wl�{�5D^�$�GɱȠAz{S�cK�!�����}b��e엓��0���^�Eʳi�ˆ���g�ƨ�Dp��Mo2ލӾ#�ʀW7�����c^Oi�����>.���/7�t�ԯ��O��;8m���E��>�C�rR�vv�����c�H��y�� Q�0A�+t�$��1Aj�N�! #�N�������G��*nLA������R{.�j���y,�^鸹7��L����i�,�hey}D.��|���3���$j���!�Ie�ZGf�ݣp�ay��Z�∞�j�{
q�0WS �<!����e��#�\ܘ�K
>=��4n3�P�u��y�7�1
�R���k�[?e�����ö^����HE�kV\�׃�!&��ʐ���3�k��m?�x���ȗa�c�ts)�N? %�G�*;.r�cppն��޽>#_HV��<@'���������#?�M)x*>�����0��/f����Ć?�P��{m���N\��j��ᏹ���~�C�3�af<��<�GmP���������E����&��Y�}/����}ʬ]����x($�� ��4���u9�_(������(R���7�R����� M�*�wx��rEp�wO��b|Ջ�RE�:-�f-��(�<v�q�!LG��(�F�؇����S�b}�批d�w[i��*;D��o
J8D��Кmv9���]O��4��j^}�7�p̟"Zn�\��e�`�+5v�s,z����Mk�E/V��0VIڅaj��6c�OixY�)��J���}��1����MP�YՅj�'�B������i%����/��'k���9e��, nQЎ�S�;'ZbR$��r��/��G�U�Qj;���?��1<�7L�ޥ��Nyy�Og����1��Vّ0�ȟ���O�O=��p}�נ�nWK�v.�Fj'��B30�JV��RO� �h����DqmF��*,��"� �:���TG�9���gi�����J��qH�j�����l U��7m�Z��y ۖ-�����XrĜR�6G�]߽���S�,���;�w��@����0!�ʹ���rf�/��ǀ�n6��������y�bS�6y(γ�7�1�>p
Wzd�|�fa�����9d��?2�c���p��Ǹp}͖H%���ѐR�2d!��s�?�� ���{,<��#8��3���z�ԍM�������F�G(�k��ۖ�G�%4�Ն(�w���[�7�ڂ��f)����BH�ᡡ��J�OGN��lH"*��W�K�=��}�kp*A|
���D��X��{�1����+H�.FZ�c(7f(�L.���:P�끯��)�rSq�Լ� ����u ܍)�x�/EI�rh3�)�f�9˚i�=c�2��vK��Zg���sH�i\R盢��g��ZA�+|L�/�H=��D��Z��	����l; ^��6�+��jΫ��nґ�0T>Q����m��+�Nn%��ҙ֜�g]\��S�����,*�7���zM�{(�RMnAjW�m�2^�|k���y�B���'�5:���#3�	��*�ޟԨlru�I"e�V-��ðqNO�(%��]g^N�X�}7�뛲�`��)	.��=�1�yZ���{�G�b�ͼ�E�fv��É���OAv7]{�
1�׏)�3�_�w�t�b��BA��>��������S�����zWV�!&��#5��<�<���J���̯���rbdj�P@i�{�ғ���� 3�������m7e�pI&@/y���� H�R�5-�׷�= ^%������#h媭����߬=�����_�<�$�����SqYT�`[�R���|f����'�-��b�����ͥ-�J���H��zf[�1/�}�H"���L���8��#�^=�^CC��"X[�Ϯ[���+�����;����GA:Y������o�$F�󕪎 ��5�҂�P�|��T�T�� ���(�{S�H	ƨ&�0#]k�-�)/�Ig���p���r�/Z���"<K\�S��A<�	�2U��v�SC���\����U�%�T��4�E'ٍ�������f���>x�ۃ�f��(˒�g)ge����������������������9<s�Y�Z�����,�D��G�������܂���~��n�8-IL�O@�^C ��>�ʚ2��}X�؝Yo�j��m3f�,�j�zx�x�Q�οS-�����B7ȁp\ˈ�	mTY�[̔���Kn��WL���з��Fi! &$�W7����ԣ�(5\:�$Ն��������c�5��L��ƈ�-ɖod���:��(�_�;U���������H�b��#��a�EohU�u��iK��,RsM�����<���_��px�u�m�	)��͘�[_QF�d~p��W��q9�W����	��Uo\��6��O>w�7$N�^r�yx�����P���Z���O��:�4WD�*����
�n��O�7��G �obKޕk����(	��p:��C|x�d�o�i���F���*�b��K������[T~t����S-��zv.rE �h��ε�E�,��zh&�s�w�u�_#�����fQ� 5�S~2�	@�)�����|��G�"�V>�$>'��A�\	_���b.��Ra�F9:~3�2��Ő���V��-'�O���R�8Y����%�:w@�P��p{j��4�@b����?Ïd��:������bB"ظ���D>vR:���5L���L��6�s��l�<0�|��դe��q.��u�1"Ǡk�w]��u¡F�.��%�Od�ﭑ�f��1�.!>gvek�W���z8�f���.�EJ���!R? dŰՠԀO�l������0D�L~ᆁI����gS������rڙ���0L��VnD����9(�=~���K����|�
鯆��O������ׇ%&��D��sXg��z��^Q.r5˹��0L��If� ���$�y�h~��?#1g�O7���X����8լ���^tĊH~}6$_����!qf٦ij�(���2B�*�{^S�w�W� ĨY��T���4�����p�1 ,y��V{��G��֫�?ʋFܘ(+�1b�K�JǷw¯����0��fOr��{�IN�/~�� D;�r�{�a詷\mʘg��R�V鬞B
'e)��N��\�$�z�dS*�)!i��")h�I"	���:�9�7�t��SV��`����ӣ���彋#}�a<(eJ�V�p���=,15��|b�IRi�n\M^�J�%��̢L����sЧI=#<�#s�    ��~�b�o�i2�f>MOL�ļb�2��ནq����Z��<���`n�8�!q��G/����Zr�����n�j&k���B��.�@A@wGbL���$o����i��/���.�#H�J���(�j�="v/��z&��x������;��D�I��fr�� �y�h�뼘�7��Ǭҍa�%؋y��	i�і�j�5�j_��	{#q��	��z�"��� I�F1�����H{����=�_#�_���y�kZGR�J�L=u��(=UY^L���]B�!_)s�����[�cqm�g�.4��ɇ���^h�B5{����[����^k�f�=ә9�Q�l�rT�[��ܬZ������w��Bj�%��8���B���.�/�R��03
=�)jr)�S&7��b��_��Ӳ�;�h����?���b����Q�+{}Pz���d��9�FAҜl?���6��N.G��_���p�t��i3F����ږZ?3��"���>*q�>�"�.j�g�ʬ�ZtGN�H��.��^V��+tϊ(S(_��9�w�j�`e���eKZ���ܖ_�q�n.�7����,�)�S��Kͤ� U_�ŚI���Ө�͍ɶI����eBT2i��/uY{�<ů��g���͌�q��S�������yN&Z� ��x}������r�� �X�4�7F�e˳ۘ��\:�F�Gb��n#5�c��IV;1�Ҧb����kt��Es�i��N1�M� �NR�?�����ļ�ޚ�a�|��f�n"<#��n���-'m�5Z����{�B� � ��4�ک�L��d����u�by��>W��0t�x�^��Ü�x�/]�Rd�#&���c$��������Ȑ�ŎDH�}'8�)Mm�����G�n&�B�r��=�"9�N�KC�՝�>��X�QABp1��Qr��i�Lϊ����ݽ�r~��������jd��%�% �M�d���c���֠6�;���q�ަ+U�`�鱀�;��1��MFc�S�M����,����s{$�wN�Qfo�}X5�8�I�{^��J�L�]��k���aJ� f�~��'����-x"��P�޼X���<��-�ۏ�M��vl��Qah|�?��i�k�Bx-�#�c���8J����9�>�(�I�֒;�*h�+G�8��,��#C�~�@�Û-	k�Ԍ�\FH�zje�T�nJr4��A?C�)�<_fY�S�I���.J��R�Vgѵ�z��������"��x%d
]sM���9�R������\�	[L��P�Z�;xL�j�aP�>��Db]v����(�]ʧd���J�����3�&>|� v!}~=��AU�bzӸNF��i�M_��d���Z����F�~
��MQ�Xm#܀��Fpc� ���y����H-d��o�j;V�z�Ő�%��Μ�hgշw�`��p���H��������H��;Y-��9���1��BgQ$17�m!�PI@&'	�T�G�x"jW����~�|��כrbP.�S���R�fR��(�����������n�.��J��3�l�	tU$����\�Y\�(��������3��1��<9��ݳS�#�*\���OU}��N��rS(5�%��{����E:�R��;s�1�l	4̐<t��%�+���%�g��f9z��Аm}�Ljn�11f�g���������!��am�/�m2F>��j��2b��I��{w�c�}�'���q#1Y7C�f�V�O����8���	
�01���fPy��w�6�J�{j�o[W�+���>���ƼY��֖�]�.�S �5�������_�G]���.�{̲���JLk����fds�X��7���9�Y	�LO7�a�z|$9w�;��7Lh ���½�:�DY�$p�H8��2�j��_�`����/3�+�2R0�j(3tO�2d����K�n�ݿ���ny�c��g��*�K_��,/c������#�UL�b�?�<QN�&e8����Y;#�)���be��S?9T=od=�S�]H��/���U��R��o�_	n�\n6��r�:d
&��1�����O>5���9����4�)'���e��9�:�� �-���H(p�ю����Qc�R�Hϱ9�霥%������Q�7$4r�|�h��-9�|;��?�5��|��+�-(-C��F�
AǂB-N��t�����Y����#��D�7]�"*�`=��1�m�'����8�u�׃�͡Zկ|z�s|$�	4鈝�������_Oj	Ð~�_/����ˣ7Xb *����y]s�ݝ^��3rK�!��ձ8���a�z��'�Z
��v^O�(%�f�c�ō�"c�e�=��<��-�s�����q��OX�i@;�sm��҆���S�U�F���pÈ}��o���MN�X�E�����;Ǌ/�����ʂ��(��Znf9
�H8F /:�9����p-���)��f����<g�O�h��h�6Ϧ���K[�0�T�W����#Ƨ��)�Np�%�3�6B*�oo��aj4�nn�l�[��4�1��z�FMP��o����)b7���e�D-��|�9M��2��.L�E'�f��O�4����^�}��ԡz��h��E�,tscM����j�f_stƼ��æo�]�a�}�%߬���nܘ3cm���P*��Q��^���0��n%����<`��$�!sH!���y}��P�(���0��l��Vh�7ǡ������~���Ԭ7
#�m��()��Z9�ɚ�#<�����c��(�n�JU��NMs���3���F��3m���H(f����[-�vM�g�0���]g�"U�����]�0l�BW<�e���T���ܝ��N������ۻm0�\L󋧴g]ӊ$6������"Ek�����_g�g9ڕ��f�� �dF�SI	)RM���8��'ua��?��j�η�O��C�3�KBN�C2bf�6^�`C���w�Ws<K����l:u��-;��_g�ATrv��w���d���Wd���)�J���8�7�Gk�.�inYb�;��e͌ܚ�������qUF�G����4�
�ܘ��腴��%Z�[� �{��?���������������?���� �h9��H[��Z�럙���_K.�:�'���d�?����ˇr�ֺَq��Q�.�ZZ%����,;��,�/���ߟ���f�R�5�\:��|V,@��S-W�\�<�Ô�Ɯ�V�*������X�4���$ �R+Յ;�~��H��f�q�i�`;bK��d5�2�7n�|�Dޯv�t{/F\�{os����4��t	�Z��xZ�Ðr�rݬB��.+Gy%�f��4J��2 �G\~1���]�'>=ͽSo�`��޽&?Tv����T����%���^k�>tP�+8Վ���B�
ay���|��O}R��c���F�?vD�� Z��*�N�-oU��0�Z.p=i����u�8ϞN��u������B.C���̊���l*�wH��o��;�g ���n�ϵ"������E�<ijiY���J�"Q�'�=����F>�,7��H�6���J�v�4z��㎴�lқI�5�}D��̵43��9%�>pc p+�xWD���6ǯ�i���n�m��yҔ�Du�^}){my����,т�>W�"$�Ln} ܔ���g�s�����\ϛ��~1����+%��@-���ZI=��W�{��̱�s�B�6���U��5�����!�O��Lc�k���崟������t�����D&_�!��ȪgW?�Lr�s����nS-b7�����O��)|�:� '/��{�}~���og')WB��ؽgJ�?x ��v������.��J�Q��������.�zéxUj{�����aH>������O�9��=�=6؁�J/N���E�~5L0�W���.�]��\V<&�:iU�s�2r��ٙ~=�� ��HU|۩;��:_���|�>�a+��e�_Hޘ���LH��&��LC@|!��N�༻��e�mY�쬈��k    bZ5�)-m�EΞ/��0"� ��hb����YLaU����bU e������j7�}��ez7xը��4|�TϡQk��f}�/�x9X
.�2��<NʏМO�9��h�b��10�����˘�����S��ȬI����6�ƈ���G�n����6�X�|��P]����@&e�7��j�T��/��wQM�{�,�BH�XE]����Eٕ?��ސ'�G���gxBz�w:MF ��nL�O+|��d�A���Bj>�{P�����+�x����Nf�y�&���Y�c^<K�I��y�Һ+��p����7�|g��C=�	�CMlP�:{S}6�����oF������-`Y��6������/�L�Z��K�R�8_�P���=V�t,.B@s���i��ɛ��T��'��@8�ei-Md�ep~3�/�)A��Vo����p8�E+ ^��^�%��[���!�������dps�N4�i$㠭j���v��ϻG�È~Zm�F��?�� f�T�#%(m ���������Ԃ�Ȯt�zBqz%>&��FXg幑l=��S�_�1���f�1Nf��~*��h�[��������H�����73'������xzbl��4���z}��AP"U��񭳣
����B�;Z C��c 췚����Ȕn�e��Y�V��l���[��͔����zE�aNncN�tB1I,��9Av��ٻ��'�0�Ǒ)��SW\��7f�Cw)u��s�ƹ��n��ǩ�ͬJA0ڍN�8ߣ5�p$EUtM*o&��0*�R%�,c�c�N<��5Z3�ìC��͋�_�)�mu)�]��3Ϡ}��ڊ���SY�K6ʯ�1%��R)7b~1�a��?�W����8MZT�mԷ'�A2�$�������q��'��c&�e�̭U~�~�S�f�Y���P�>ò8��T&+e�U˪��̾��aOI�j>�i�,P׀c��`�/i��oU��o`�ivӜ�Lm�%�'1\ixT��+5�s�@��~�m�_u8�TnK���iq���/��B��h8C}=T��B�"�L�"EXG��� �R�@���v���Ѩ,�6�[̹�N�=���>1.v����R�|�n�c��ŏ����~���{�Ńs���S�Y�j��*J[U�ԛ��:t�=�b�$�x�O%<1w�~���3�W�tu�7�Έ�Zb[ÇD.^N\���K=�a�#dݼ�F@�������w�K�J�3wӷ7��0|����Mɑ"-�~s�Y�C9ł���:`���R�?��Hwt�%� @�O�i�F)/dw��4��!��FS��d� |@ N���^fG���f0��G�J��~i��L%Y�թ�c�e�TH6NU���톩��B��܎h&�|�A ƍ��F|�=k�_К�/<�L�S->���;`�����s� ���f�f�_S�?j7>���-G&Ԃ⮥�3�qNxM���zS�4�'�H�^�zZ�2�`��'Ud�{Q+r޾���T��@2����qUMJk<]{y9�x��F7��Y�l  -��$6<��S�i:�>6˻� �a4���HU����i�p4ȘS@4���������0Q�mr�c��9��D܀|��@�P��Pm����Ϟ@�]?�W,�������[�����m��*�;c0L���J荾n�خ���{Kx ;y�?5��M��^n�2�}���,�)�g1� r�m �T�
�{ڮ���1L�O��7����ԇ�!�KF?9�.*GEڻ1�c�I�bL���\�r�����8w�iC��d����F|#��!����f�eA�z�OuU�>bI�Z�VM��<�tI�µ�Y���/龁!���_&R�R`���()�Rl���ӽ��/��W?��OU����Ķ�n�4�C�j[�ru�㯴��*�ot�i�:���Zz�e/rs)2���S��~�o`>�^�Ŧ����N�lə�鐢�Z<
N�9rx�&0\s��A�g�WˑV�(�v(�暴���<��XP�`�;fBo�P"o(������oR�����o`�>��,]f!��cA�����F[�����;��/(#0�2h$x���]Q���KZ���sڷG^�������z�{�ݯXP���I%����U��{�]�'0�����O�ŵ�f�E"�p[��d�`:�!�����D��z�a<'��)u��� ���°��)�����_>�7-����9g	�8S����J:�jk��GIR~"=Jn�'�\��ԃ�A���l/U\�J/�8���	|�Po���tY�)��J'~�n�}N�����1�7�%�-`o�e ��g�"׌N�]�����;���'�ϕ�=��Q��yb:#�@6$7��f���辽�F7��@6{�kF?� �ň<�F�ld�`�p�E���qR�����Q":��b8j��Uɖ�/�1i�p�u�mDR*�[l�k�g�9�q������K7�ͥ����k���&�ن��<�ԉo��G`,{\TLo�Yeq��H���\8��a-g-=A)���ײO����ޤ�3��e�rMM$����=2y��%Kr�xi`�6���1KS��"����{Ho��p�m)����"����j��ǑU�Ʋu"xU���� �՝n��6R����0,	gZ|qo[�_�@p�p# ַ	��>)u:�`+A��Ё�ۍ���p�$�����y�|7�ٍk���Up9x2tz���r*��o�3��yc�<#����bm��W 6#.\ �槕�đzm�b�&��_Xk�m�k"���"*;ny�8D�Z?D`ڀ����������GP��xwg;��M�����ը��1T�����	&��z���~l[�TJ�2f碳)�%}�������F��a�<i�;|�G�y���-c�{<���@ ���p�u��i-��E!�� P���zJHğ4�RY��C�N�S���G�Bx�����c��C�MΧ�5�Å1��A���0�_p�X?�ۍ-]��{{
jX�Zl����F9�z���o\�>�U�7dh
���pe�4k�l��"�w}�-ѳ��9��CZњ�!F�ȁ�s��s�>ҩ���v�τp�
=��(:����W�J	���;Ga�hu�� �Id4��\��`���9#p"��82�"Κ׵�z�Ԝu��Z�8-�,��BOA��KJ|���=
�L��/�20�1�z�E��[��>SDa�>s�n�%Vg��o�0���in�bm�K�!WxǢf/ޖ�@�H5� .����w���#6L�~_Q=
N9�c��z=���f`�l|/HG�2,����D=n�������/8I��@)7s'r=���/?�%O��?�P[��A��� ��Mc�������?竻��4=u] �Z ��㒯Bv�*C
|�I���5Γˮ��� x���/�}��ʪw�m�*�a���2*h�:lv;��A�����v��zc:��!<kEj=�٣�(A늳U�/8+���IoЛ���lE�"��t�L�~�j}��jˇҩ����C�,��l5pށ��4�x�5;�>�M����o۩5rfg9I�N]c�q^�~˸�Uk7��G�3c-t9xP�T+���J����؇n�֛�]�k6i,I͈m?�͐�6�y��8HBxc�tv]���k�c����t���k�׻W"0��ob7�vzm����'|:��$�je��U��O��
s#�!��5GY��I����5Q�7�כ4"0X?l�m/�&�C�b�d�0�����J�������O/��n�T���s��98b@�`����;30�ZL.�R�	�,�IF�F=�`Ѱ����kz3���4��f��0����2�>?Úq�OK�ʛ[���e{�]�ON1�X��Cb����0�Q�D��t�T��k/	K_i���0���<!���(#�H���{�o��S�+V5���1*�����f`�a��	w���j/�s�Z�x��Rwۑ���F�'	����}�$�nIN�5-��*�p�D�����1    �z�U�:����yf[���2،+<�j�����#0Tn�F��t
oˀ��+�z+n{�I��`�Y_����qgGK�k唘D@��9����W�Y"��3x��ƇDi��ޭ�2���¼�z?093�`�w��,J=˵��g�o�>Yu�;�58d�+��8-�J��FUJC��3x|� ��#���%2���r�!�|;��`�v�̟W������U��y�Ǫ��"�A�dq�����+�	�'�+'��=g��&{����z�ji����������֨]T%�iU��Y�
���}w�kHc���o��»q≕�U�
-
v-=H�9ɕ	/���<��U �y��4��e格�T΍4�X�"-}��7��7*tN#'���w�C���<Q�[���yi����<\�iHǽ@p��]-E;R�N���/�0պѕ�d�1op)s������X-x���#�RF ���Tg�=[Yq��,]V�\�������/p�d�C�q�5{�r��=$��g����h������pI[w�rZtE�.���z�\�ҵ�;m�HW���綖W�G�Z�c}�B���4c[��3K=��~�C�+��.즉���-�%�Dux�V�pڜgZ���ID�C6Mq�|��k|N,�yFUڒ�x9|"����'0)����1q4�n^���)���ꧭ(����^��A��bJ�ʪ�%l�����K����]{�g������� �^Hst��W}��}"�Fd~�� ���ፓ펬C�h5�k��XM�e�S�����70H��>�F�c얾oտ��'P�E᩸��1�ۍ��}�T�:�[d�NE����8��z�"��?��덼�N�ȔJ�����ʦL�����6}����V��cr;��p$�M��=�k?Z��ow�~#�!�v��m��D#��|7�,��w��W���)���p�^����)h+��5g\#���O����ʄ?�i��$zq�H�F�z�¯l��x	H;�D�n�v�O`�Ʒxsل�[!�!i�qD=v�e�U=(����W����8K��s�����8U��
$�\��b�� Cf���;xM��Z�����X��ud��O��_h�X����M��gj�c1�2h+�������E���^`�^YNʝ����=J�[�RW=R���Y"%�����M6�����!i�5b�ynѵ�/���P�q<� ,��'�(�&�g|����p�p��������#`'�X�M���W�?���15�.������$Q�9�J�ePv��|��|���7*��1g���99v*,L)m�=@M��W�-�����vJ��j_ٿ�XLp���;oU�;F�G��Z@�E=]�{K��(�k ���.�g��;�~C���[��wԗ|&��{�Y���މC�1��_@��@;^��=j�$ke�SdﭗF#P/����s�S����F�|��U�w"QR�;��(֮���ɗ�]L��Bº�_
:�y�8�����E"��'f�'�zs��R|�̶#��D��2{�{1��o[)��%{Xol�*�5{��"
l��W,R�����_���	̷����ս���yG�chi��	���������Tlx�m�ӊ}�h��8)N�u����<��w`��6��et+�#
re��i�=tr����gO��Ȥ-�XR �$�/.�Ex��\�q៟��Oe�3�=:��{�D�G)�aͰ��J�����5�EOBG���T͛�����y�O���#U��1ՋW��V�:��^}6k��H���:q����OW�q����JN7d���Y�����(
��ِ��� _]�.��ŬP`ٔ���W�5��\����o`"�@����;E���T]K�(@!���yp���1�|3ͺ�$f�z�T��buy������M�O`ڧE�����ُ�{GY�+��>�I~t6:�y� 0_Ùv��GH�[�W+j�(�K�qp����6h����0\�,4�S�P�`���Šab��7�a� �r�A��'!��J}��M�9�v������//%�c�����w�t@���(cG����l�q��o`D?$&7\Ip(t=e�B3B$ߚ^Nm��ȯ����PR��J|�5R����(<7ƪF���x�V���r|�M.�k밬H�R�/�0P�U,+6>>�Lp%�ZorL?>8XQ����Y�:�,u��D�y�G	�|������[*]Z�������c��`8ϿN�4�hA!���a�Y�8f,N���QȦ������yJоvLz�H�{FN��8���k ����Y��q��o`�~�7�ڜ�S�CV�^[J7�\c?q���W��1_hA	���r�����?p�r�b:�+M3�߰a��&��Dg������{u��;M�`��5aL�X�Q��i�Fu��K�� M��b�l���F>��7�����F-%����S	�|�b�j�!0퓃 �"��m{RTk��1��	�(����=՟�:�鵈`7ì� ��Ͷ��ʮE��-0�9�����|Xӛ+:�о�l��|�ޛ�%-����~\W�'0��+m��늫ԑ��%��Բ�i2m{=���1�F��%*�F�(�ׄ�J_�˩}VIS����S�N�}�^-�_�x����M��i�}����%�5�:J,�'kTM+��1�J��N��%�ԛ�K�
A�����>���������������Q���v<i�D�� ��xO7���`5-#�"�ް!Z[9�jP��?w�r=�V9{�/H��>( ��l�}S�暖�{�>��a�T�%� ����XF��#�vﯗ�ȉ�Q4��̑�F/t�j�3r��>8�Sk��:S��� ��D�J�����O`��-2��iY�h��"�Rqn��"�8�
���*�Iy��m�u�Fe�Fv��".�������M�/�KfW��~�$a��1I�!Pm�D�ʝ��|���'0�Q@��kj�Bz+{��ZP�,��|ٗ���z`,��"c���v|�s�X�L�X��!�w<���M�QэM��p�U����4.V��p=JSy�珒}�J��{����Uš�ޠ�i2I�}%K�B�*7�V�DtIp�Aix@y��ci+@gk��ch��.Por������lalXz��E1r�j����e{aK������ ���KOc�EXj��tN6���`&�7���j�P6���%U9��,e�7�/LaI�X��۪1���&�q�(�"���޿p��D>��o��'���k���!;���s. �s���x���+ȍ�2�g+���1c%����`�ӌ�?������`o��(;�?�#4�Gq��CY޷�q�۽����| �=o�G:[[�����Fd���,���o?|C�������D�Vꪜ�D��{���"^(c�Ǒ�70�!�|�������g��@/#������֔�F���Ǝ����.%�M���"�ٚ:da�U��$�ߖ���@�Bxp��G�-9��6�uf{az�St�~������O\,ȵA���`�-�C�ƷS��[�Êc4���H1���l絼fs�JE�nc��#Z혆ƿ 0l�n��+�< 0^��i��B�̲���K!L�ꍷ���L���'�������>*�>o��d�eN�G��F�c��U^��汒 ������E��Q���U����#;g�����6e�v7����#�WjõE�;v��G�9��Iyb]Q�޾t�N����W��#!�}B5� o��3�(�
�Z�a�	���j�1XQ��U�C^l��m�i��}�_�-)���yU
g�1�o�r���wd�d��y����ǵy���>Ԙn���%_C��;���ǞEx�l�c=����W�9[�of�rOj9�_)�G���������|b��3�����5x��Uђ�픵���������>��� N}�~�)�j�_9p\��M��Ǖ@#0��
"�7mt#/�%VU�1����S�1����<��|�g�zsE�u��W/���SlFYF�    ���v�G�׫N݉��t���s��A����~�����	D �Fa�T]���A}F>�y������4����C�O`,`�ˍ�t��e��
�G��^>�8&:d�ǥ'���L#-bsqZt�QS��_�W�(<8������ 0��J���6hO)�ՠn�Jgj��H,��������|�c�&6h���.�#��ڎ�Ew���󯉞]���F�����e�Tq�e(�ҫ5K�����j�[%��T�� Hه"0+B�uQN/�i�=>����W�z�9-���������	o��?X=��tr��)Z����I�X����>�������70���l7�5���m6�IU�(ܤ�"���"'��H��U/ ^�x<�_�7�5��h�vЁ.A�����_��J7��_�לE�G��A	�b��{����|&;/��oxbdK��|]�R��8TJ��2A{�@g`���\�Z_i �\�(�%X�������S�?�@�ڥ~�E�1Ы�~hm����b�� i�{m���'0����7���G��3��=˥�д�,���|~ſ*T�;m }i�/O��R��4�)���9���F�g5�v��j/�+ݡ׷��yL0��o"0�2b��ɚ3뎕��,�%�4 �F͡�I�yp��¸��PXuz߅F�'R���N蹌I��m����XV%��C�]���CH�^����Ey�Z�c�~���Ol�+�����P�X�j�9�����t��`�`*�e��EU2�ڐJ[3xb��/���6���'^L�Q�� �j-eGx
K��׈m��L�L �`��f�O�csK����
�J��ص��
��߷>����J�o4l���̎��+i�܆R&��t��g�߸X�+��zR�(��Ϸ��K$�Y���8�Z��*�O\�#xJ7�G�G�bi�?-�5��������[��.�xw���H$���1;�3W���F���#'�\���Fv���*YRF�� D�e;��2.?���Nat��Y��$�@q�j�G�M&C��#�i�|c&�ք9{m�(��#0��	9�լ6~���������:����P�R��P����(�z�S�Un�[��Q�N���ZJh�⤵���x����/�(U�M��mLj`�H�9��&(�� w�)�u���:�b��nz��d�ͤDi��L�a��[�o��U�/֔��@���u@k�s�x���!RMIԜq�O[� 0�m�oz��� 0q���5R��e��W�ao�,�F?U�ޘ ﾑ��nE���9�\���H�e�o�}j����[�G�hZ��3I������/��'^*|�.wÇw�Y��ߐ��;��B�K����la�x�^�$�)�F�"0ԽxR���Z�uэ�~b��ĴPd�&^��ܵ�`�\|�!�?�.��s$��֜��Fe�4>�]\�� �9~h���}C�����쐟a{G��9�m�A���=ڴ��qiA��n|z
�N�C#��4z�58a>?��I�ߔ'��������lJ'��8�@�U�Zl�_�cX>�A�ndZV�ɔK���^�R�f.4���U7� u�w����Hܒ�
�e�b��:�ʞ���l�R�zӉ˧ˉ��YcU�;fW�r�T%��Ж���1&ҋ���zSie��j��Qr�n��6!�C8�I�*����:��d.2O�NZ�Źi������E+#������4%�Y����T�1-p�ft\�O#�րJRo.�l*h���$�<%߈�!˘��y���.�o�Վ�S�Eje��j5R6
v��7��O`/ዊl��|�X���W>��zƉ�{$����_��(�:'�RES+�Fvq�!��g�ϋ�D`�J�i�x�n�N�?3�Q��dM�.���C������J�l@ZW��U�Ӏ��ƌ�Č�/�����������?���_��/Ct�P��So8�} ��l��1}H�Y����ϑ�;��������jЖ-�B�cƇqK��g�y�.���r���Y����֎W�=�!��sK�_��mk�8!�v�r��CN!�&7�;NB`^-u�X�{���m�M���?~IB{p�kB&C�Ψ)8��|��|��l	���5�风u%� �]������D����@MR�]�K�z�Z��Nwk
%��K�}�c=�`�P��W�:kC_��\39O��)9o8������o`���T\HF��"ڧf3����Z��q� ��Qu��CmM�ԧ��īeQ��:'�2b�������r�>�8V�e�*��H63�er@�c���a&NR3��bA]m�UH,_�m���I�^k��8P��l��>���iTOذ�TAH._�	�6�~��%�ڌ��l
�(&Be���e|%#NuǏP_/����
�<�[���6�����A�b-A�|ÉT����Ts��Z��#x?�m�J"���2f��<�򫤥� ��ۊ�۴]$��^�I�(��`��N�y��p9X�7z����3ˮ�R�W6@��`���o�4�Z��9F�D��Z'M���\Q��Ȓ�?̄7��Ԇj�H>V�_��<�`�p��ו�20�i-���5�7�S;�Lkl�E6���U�.��AENq"n���dZ����*�TK��4*�1_������1%�.Uf�=�4��Ă��=���$ٞ�V���*
�\�U�U|t���?e���@�ݛ�~��-5����@��s.��<�t��������*-1\:z��vQ�@����"i>s2u�_��M�&�j�I� ��vO��@H�-������d��dd`䓮67�MmML�VR
*V��@��U[�&����/?V��@�T�p��I*��_���H;���ʜK���܍:Z��?��֕d�A{��;�\}0Yo�O���Qr�7O ��&�_���E)`L2!KO�6�/J?1&��n�Y��)p�)e�q����H��穒� �6��w;czP�=<%$"��gΊ�6�z>�z6
��ܸ��<j<JWN���2�Bj����q�JEm�.�"���EN�e�
b]��$�i���m��L/�uPN冭Ŀ�WQb�R5�i�A�t���D�iM�o�eﺃ\���Ҫ;���"�W�ϛG`�*E1�+q��g++�Y&e}��d�t�J���yO52>|�Z:I���*9��i-�vS7����wտ�>$����ܭZ����g��FiQ�q�����R���E/�Y�b�t[�=��[�Ƚ�`�q`x�ҁ��#Z�oz\F�cQ�g��f�qJ�d��Ci�_Γ�W{��u�d��3��G�c� �="��?Q���������_��?��?ѕ ��7�����zW�fk�C�o�ݔz#0��)�������?&�nZ���Ϝ\8G�n� �9^7Fs'�6��w�Aݖ]ٱ�I諾!�Գ��}8��?������r��m��^�̨�"�~��g9±5+z�R���wn�?`�"�t��ﴵ`���|�Z�U�����A��N��ܗ ��X��8��d����(F#3�(�w�	� ���Te�����V�f�t
�Uc���'�~>0�G��/v̞5PE!�9�ܠ�:Xf�8A>��/f��vL)����`*�ޖ���3�$
?x&NG���H�~vp�F_�ZRSPg�Bb�2v�R�b�g0޾���j*25���2[�������¤ϲO %�X�|����)Yo^H�Tt
�2x�|�A��2�=����;iß��p��?j���ԯ���e���`s��?O�ה���r�_F���:�H��qY�3��v�p��~��	�}�9����C����#�Ҍ���3�F"�X��s��Q:�1�|f��?Lk�C�᰼��Y�\���� ��6�����?��0��u�T�y4��:�N��T�_����*��UG>�=n���O"[���w.p�z:�O��4'!Yw{�G`�}�o,Ŵ.n5r
�)�1�c�¥C ���;���L����q	:Gi42��/Y��7F?��U;�    9�E���#�~�*�j�J��pz�y[,%I�Q	n�ڢ��O/u�vd�_����6��U�H�	�4��/�����ʄ�]���Z�e�={�U�~���X��b�yz���I����� O"�mu<�b ����)ܘ� vOM�Ѽ����V���o9-��|[v���j77t�����w��󂡳�l�HI��8~�(e`�$a��j]��:t�ٲ�-��u��q��Ӵ��]�!�\Н��5vȐt�mel���:g�䷻	".�}2S7������P{�����.��R���z�>�h��f�;�n�G/�3䔾�%��t��y�/����!X0�m.Jin��J����8'���v�G���
�8�Sw�l�No��V�����q,��9��Z����$�ɘSR�HpR5�Sۮ[��iT�.�+`#�1���KX�W+t�Lg� �Z��w����ݢ?���1Mo�'��֝S��҈`��dA�����?k����:m7����rL!��
^�#�V���~�S6��SÍ��Y�ϲ���GV"+�Ō�vk�?�f`��.�f@E�2�<-�_w�m��y�i�����l�=���2O:]Z읮yYGY�g���v�
7
�>�Z�J3�ܞ^Et���qU[��*�``?�5��+B����|��3��T	47���r���4�O`�~7��O)
�@��i`,��ઍ���ݟX�c���(�7��=�6v���[v=�Y�VZq��~ܫ�'.�	��tqok���Ne�)�O/��VSn��$�70Y����
D���C=H .���Ӫ����竣|eЧ�Dd���Ǹ��|���J}�`��S����S��z*&��bMG��Hl�珒����\�>U�YEhF`N�s��d��A��L�������-�slJ��ڎ�3�ݥ�>�R��#��}L�j ���~N���Z�d�:��}h�������\��4{�}X��4JҜ��^��L��������M�vc��8Z0��{e�ί��QJ���N���H%�P,�?�B��)���F{q$� G��d�m�����U��K�74�A�����P���L���W%�qlP��:�s ��l/���n�#�C��I�Y�|�+@�7>�E�Rhcd��rg^dy�l|��W����C�&��.�zN%���A6o��y�E`�&r�l_$�NL#��v�i��tm��i��+D\$0����$qQ^<ǅ���]�Z��t����v�
�B����p+R�M�סk^�Eu��|�i�WYS/��#N:���#�2���hj4}>n��̏v ^�5�C#��G%iyME[��)�����O,�-/�D������"�ov�Gj�_�?��c����jF��o��=_��4�a*��`�%�
 Ak����}��옓wMcJ�n�=�[���^�|٦�/"0 �~���EE.d�r^�[�91@�"��i`˫&1�+š����"����^��2�<*��G��L��J`�5>���!!��PV�9�|_�aͮR��~�{��il��^/�k��J�vD�T��OԨ��w>(x�M�~�~��R��Μ��z��V��?O��D ��&v ���,N�k�X�H���jP�ݧ�KF�_�0��H��Uw[ZU�~rv�m���b��Ϳ�����7���-������Z�O4q�E� �f�|ʶ|8�����8��J�+[��
C ��t9�Ok�'��g�4�	˚�q �^��
�9�����i��
cl���5�!�������Z6���qY����)<&�3Hǚؼ=��:��v˯�[0��Ǖ�T͈�4)�+.G:`�V�����S����"�`�~*_��n����{EٽzQm)W��1[#.`Ӣ�t�4h��/a�v�/un�ӷ�K����X���O�f`R�c�r����/����g�e��B}sE�����?�I��jv���48��Q��#�����\m�Kp��vLRXF��;�1�q�b1=(ll�>�*{��8��ʟvE���Tm�X����m�~�Ns��&X@N� �������? ����t;D��X��]!
�t��Oߝ�&
O�-�M�H�?S֜�*��ƎE����ۑJ�F��^��l|�b(�[Ӵ5��.ˣ"�E�ꧯ�P��o�څ���s`l�%EŇ.���_�
��Uk-�a���):q���(�#���a�T���Oѧ��~��~Ut�m�q�G�b�t�u�6����C�S��~U��.������=���C~Z	�o�	,A�ob��̮��wUr<�M��C���z�����|Ӊ�v�=U��/#ne�Lto`��9�����L�ʁ��5����]x���`����P�J���?�)�d��qvYm�=�Qwv6�=ݧ���i�?��ɡ(<�'�h$jN>���E}����P"6�T��	��j3@i&�Q<�=iTg��o[p�-0Q���^���ŷ�4�<JAKW�e⤳D���|��<{.rL�$Ћ���Ji5٥���P[�T<�J��O�3j7/]������']�(���5�̎Գp������D���V�R��t���3����~����Yb������p�_f�3DG���d~O�po�s0Fz=��_�� 87��X��ݒZ��9�� i��yB��i���f�o�	��J�fSʛ�D�s���x_z����n�Tj��l��Hu0˵� ��<������-���T����T��@!��G�<8��@/$sՍ�ͧ��v�ô=��X��K8o^�h���$%��G-~�"�hp��8����.�#��t�];~��q�׹Pzc����i����;/��ƪ�챕t	?�$��O�ɏ����v
�u��A�5`�K��Q�x>�D\�;y#<�{l�t��4!kD&�g�?�j��g�/��o���Q�N�V��WM��I�}J��߰)����.�1l��8=�s�����͹�4��F����t؋,�bbW� gi�mx�3� Gj-�;	��m���>l��s��`�:V�^)ǜS�Fz�>�R���v:�	�8��Ŏ��w��J���~��~�����==���#�ͨ��i�̋�ƪأ"3�=.��Ǧ���X �l[��\�u%��ƴg�q��u���Ibz��Ǫ�J5,�ʹT�[��*�:�nP_�}��B��q��0���5	Ɗ�I�T���[`�c���]��S�a�
��k�͂��n۞��	��.ʍT^BivR�h�Q�xP��al�*��9�ϊW�ļ!-�Uӗ�v��T�R߮*��~���tdPo�R[�F�zj��G�9�l�!ȶ��a�����󕗚�[50]���n��V[!�Q��c�Ͻ_+rd5���1�y�{���سц=o;@���G����G�6j��E��4��bM gc���ǭ����W��re�ΧĔ?4���6Cr�שu���uq�V�ɣ��C��L��*�HVtv��;�2.-rośG��tD=�+��p`l�(��*Q�QZ��i	�@nv��sa��`����Žg�mo_�����4S��Fo	�Da��N�q�4��Zd����6�׫u&po#�6�Ua-/��f��S��hm�����d3^q�4��v�~r��vsϒC3v����?�u$מ�-��E�*�&O���{d����㰰M��[X��^AIo���u.��f� l)#�O������=��4"�z�cpZ^��"�4��{�-5�t�ްm�~E��� �M��^��V){���I)��}�j�u����|мތ7Kv��ԭN{ӵһ%�m,2>�)�덕��Jk7s3��;�
Z�gi��é�B@}M:o[f` 1\s�p{恚)���M��?�����+��[q30�C5
����2��<�c�W���}&U~�Cv�P�y��t���N�^�kki���]��U�	���^\Eͦ�FDB�j��Ǹ�r*��������' �����H.M
�    �7��Q�*�:.�c�ן�k��cR7;O���cJ�JT��ig	C��C���U& �;��:����5/�0]�����	~E`b�ٕ���Y��̾ �t#o��z����Q#0q��bǬ �Qy��9��$�|�=@���'��>�"���UcQ��2�;Td�9t����%�9k���|�u�4�XUK��T��'(������O�����l�nh�Z��l,��*-��N����T*=�m1߆��<�TOW,��!㯠d+�f?�N��i!�&
�j��_�U��f�|�gK��?�4���ż����I�0����I����M\�����mu�A
 �<¿�~�V�8JUE��������K��i��x�b�U$p��0@��˙�S���>�y��/L%g�q>�h��BP)��9S�(��gA����F]��^<��̞��k"��Q�e�����ߟ���ȧ�!\<��Z��ǖ�x��ޡkph��{"0 A��
۞(͚��B�z��Q6J������#�7�?8[��c���֚��}�u��n��?E�[ﴐtOm�w�?�{�j2.�4V��wy�Πq��*S�$�rG�#���	��]�Gp�����q�=�E�H�d�y�B#`�6�H��V�z席�#��r<�����z받�u~A��ȮQvnڞD�J�H��(;��4�����}��c�87���$6���+Jw�q����F"{�_�R�E�_9n��WW�ۂ$z���V2��[���H�@kW��}����|�:J�<#:�a����߷�W�Ϣ(]@[�0��8J�-��*�4�I�g���
�ӊ*�����:e�i옉��	hk84R��c������K5�_9�H *��I�أ����؇Pn�����R�"Մy.-}y
w�sD��	�\��BWO���Y���º{j-� 1SXgJ�>�`�ߧg�|��ʵI�r�];/$�^D�W;ß���'%Ko�8Rmm!�B�v����1�<��P=��J������њJk6s��`�����L!���Az�O�U��K�V�/n�+��0�=�_,�z�.{�U��G|30�iШ^\5��zJ�>(�O�cr��X>�R{�Q��l�j��%�sh��J�,<�S6(4�]�pu��"����i�l���)�;�x
mA��A��?�`�?$���_����Iq��1-��¦'�Y�?���(��� �H�TZ �����
�Y&��y^�?�o��f|�0�Ij�`K}_^z�'�$�-^����U�SY��Q>g�6��T�hq��f�q�=ҥ�y��W�Wt�b �2�Ǝ��;X�jg�~~�5�j��(5����� E%;�K�q �Z�q��o` ? z���$�-����90RN ߳
���c7�����70RUo��g0ýtaJK�ڊ��w�%{���s�c�٩U/2r\�{�b1el�s�� _��D�(?z�h7Ұ�ہ�y��2����8�n��|ǩ�l9݉�WB-��>s��`��`J�~+�|/n�MnNK��}� 5��,]F9;c�8����mr3�xFR� A�����$S�魃vߛ�牒.�#�ޘ6����5��J�c�����6��,�WL�9ߴ���f�T��ͤj:ԥ�OY�3�9cr�1G��!V�g�$�6��E�J
�����@*��ZS��3��J�<�cn�Ȯ����
-�����*�*�YiD��U���K�mp�V���so�iyeǛ��&�>�5S
O�<x��X������UT���8_y"��E0;�o_H��]Z�û��/��U�FP�:�� t�=�"b��BRsnNq#~����%��1�qح�l{/~��CΠu(q��i�� K�F�OT�\����5�����,I�,ŹP�?c4�9��!�<�&�N�ߙ�sb��	��T�yܫ_��@w7�k�c��4@f�rd]P�q7��Ͳ����a�qoڈ�w�+P��Ǎ�R�MWj�z�w0��Ď���d��n���l��5w�<��4A&u=|-Uݰ]=Nˎ��W9-��N݉�MӰ4Ƕ���)��a%�΃��8�5�R&�Gc-�ÞQK�1�+��E��Y/Q�"�R�GG� qw9���?Y6��C�Q���j�f�R�ƙ����rGy}�p�jۀz�/]ۨ	��N�Q�PP��;s��׫]Ľr�������|k^l
�Ê�]E�Mۋ^，�H�`0��ј���TZ^Q1�V�u��Ŝb���7�e`�Ӓ)]��	��2���	I�9�4�ʄ'���R`����żPk)n3vq;V c��Bh�c��j�������T�O>]�g�%�Dr�i���L�r4#��1=6�jǂ�c�z�q:�t��󴁼^���o�v�.AP�fek����
^L*/�#���wt�Ouc���U{�Y�%	t�m�&[�tY�7�d`�#��ܮ�d���������N��C���E`ҧ����drR}/{_��L��q������v�L�F�ty�U�.EV�t��f������_�k>��\�p'�S�BA���wT��f��ԯ��`��&:j[�b�xH0Ո�9�Գ7l���o�Џ��� wWN������S���7���y.��w1�+�����H�@��b\�L�@wֵ�4�}�E#��l�7�ܢmG`d��g��:��O���[}��1#{��̓Z����RWtnKtwݩh��T�y>�I�T��y�#c�ˤ�cU;�.w,m'`��=C������J�<R����n��qQ9~������%N�q�v�z����r[��4
�G���4�*��,׌��{6%����o��47���S������y� ���
,���^��Vd�t�ft��-�z4=3�~�&�V���=�,ї_Y�Yؙvm35nׇkq	`a�G�cҝ�|��竢уS���,iD����1� ����. 2���#} �
/<%o���G�e���8��(�)IO�9e]>+E\\�Oi+�m
�Io�~�ԇg9�2ѩ�R�pM�W�3�d���Z�}��QyR-v"z�Z�[��=�T�� ��IbX��1�z���i$�'��mR�Ώ0��w� �;���&u8��W(`��Z=I	f�1�b(���m�k �P��=ͺS���ޛ���0�he+�/��Z�����Ls-�#��S��?������_��������_�(!����K��ÀCͭ��6<�!���G&����?�l�������=���3�z��oڎ�N�^�щ��t u�ǆ��3����T���F|�?2Ŀ�ϟ�VN�[��K���B�	n���)�ϼ�`�R��e'?)\�UA���g�EX6�p�$K3����8^�Hzb�|B]��L��	�<}���'�G~��eǯ`~��҉r��k��(���[ށS�c!�&��Cg�����B�i���.\
eo8�Ȉ�	�����5��&+��,�*�f#�Լ��;\+�v��ǃ?�n��<	�����3��Vr��<��oѤ�(47��y�`�˃$��D�8���ʡ�ӕ�ȡ*�r����x�J�k�D�T�/�5��ō���Bo�8�o�#j��f��ŉ��D>Q%��N_��Ã����r߫��"��0L~?⓲�ȴ{�5��'��:iX�ưݷ�OO��q��P>#y�����Ԝ%�ؽvvҟ/�Z؉��H�qg֠��mb��=�A�6��.R�ȯ"kb���"m9����BMS�J�9�yw!��0��TIN��f'��q�Vr��!j�m�v�o��/4��l��t~���J��*VW���0V/��h�\���&��9�H�&v�>��1t�-$�Y�� ��ż3O�^����g��&��˼MxI��������}C���g3O�x��;��X��k�ե8�xJ�,Q"�@8b������C��
m�0��y~$�~�Îm)�4Q��:�8Pw����SUe[C�jȖ��wⲤ�=�+7E��mqo"��@6i�����)��w�
"�z�|kƵ�C��
��v�(�1�m�X�ov�n4���Aߚ[��    =L� ��cHK�6Á��w/���ay*��Q������^�*��z�hb[��)�7���+���%+/�5����w�K�M�O}�~�hB�OZC�'��q��[�r&�at]����룵����XeFѲ},W	L�񙣌);[����u7�-ϵCI�}8���|Ps��f��n�m~�[�������p�8(����,R���zNԇ����Ȱ+��O��?���h���Qo���H+x�#X5ќq�݋S��˔G��OV3#��
�i����p��D�%xf�7E��C-��>�I]D�������\�١�Җ���#�g}�rRwl�����#L.#ou�Pp��w~����e}?{y����T�d��У�í���D�R�liގ<\�B�XMN&!��:g�����j��6C�XS������<I��FD�q1�R���ĩ" ��,.��z{>�!q T��W����� ��˥s(2V��$��b��W���	%@'o�-
*>�����H�֢�H�7�k'F��Q��m�{�Q@N��,)w�+^� s� ���ʒ��&�]��DE�ʫI���o4�>c@֗6�S����ֻ����p���j�|�^�����Z��m����>	�� җ+\;�F�埙�(��W�&�A���F���94��t�^h�Z.�
�-��i�;P�'
���!�{���ľzZӬ��98K�_ �i|Jd����E���$:�`Dh&y����G*ٗ��/��׼��a�bZ�v�/��D�g�> go�8�x>i�L�ם���T�> 8s��˔-^�c�Oo���sZs (��q[�gH%���H�o�h�0���v��i��mg�Ⱥ��`%�3���Y���+�(���"I0S�xJKW���k�m��˓�}L��'�^s��[����H�FV(u�H��r���<�)�����ɓ�R}*��!��S��Y{��\�ܒ���6���(E_���8x߄AT�t}䕽H"��iȤ>`����VDk��+ˌ_���=��3N�Lg�H�L/]����3�r9�����qM��~���©�ΞnLdI5Bw/�^c��ZL�d�6��L���.�#���$0	��rN�'�]2$����:)x?��J�2�p�]S��n�9�1�r�O�V����@��M���*O5�Q��.F�V<���9�C,����RH�䪣�9g��m$�����SZ#yՁ|�����։]���q�%��Q$�'"U9���ߧ��#��nL�<�W$�n���e�T�Ov�W�x����G�=n��F���iA7L~rM|2F�c��Źh��G�|NH)��L����S�\��d&�\6}���+kփI�xOs�R�_�)|Ύ��d�N���\�1�S���_�E���Ĝ�*��7r��ø5ݲc�c�Pi�"^ӭTC\k,���V�]�g1#I<h�	�.��]𬒁Y*�J����Yh\?�øp����D-�}!�6�Oĩ����C�X���.��s�O<0uVq�+d��bHI-��7��A��2T�)��R�M��5�F���.��B64���]�w��Eφ���~��ܓq%'��Ɓu��R��I���O���2�����6�\�������bi�����0���r���v6�d�KA\	��ʡWmD��e�>S]�[O�*��J�A���48پ�7�����ܘ��Q$'-��x��9�6�z����D��缂a(=%�L��*�r���_�3�s�י[�/xOI�N��+�,#�0}�Il�Pcs�'נ�;j���Z)���?WZ�)��2����s������o�KN��鏿�����)�A�y���ʽَ��>CK{���-k��~�=���@G�A����x�
�Sp֚p!d�6C�y����|���<'~v!{�p6\,����l��ӏ�3��������-�0�ڐj�B�j�K��WQ���豌��5�O�i�3h:����J�I��s�{k}q�K���#fO(�p��K����	����#�]��H~��Pnle)�2\š�9��Ԟai�6d����~���O����?i�����oQ��ۇ���-���a �"�/���!�G��kZ���|P9�Sk����ܳ>m¡�jk�i�Ҿ�㰇c�t�����]xC}Q���(���0oNC�O���9�kՓ�0���RC���,���s'\ʸ{q�~}5�
{+�8���u@���1 ����\�r�j�����LFȔNF�[_��v������Uq+ A�Fr�z5���2|�����%�֩��$2k��w	I�J�sF�� �co�,Z�Sk���=\�&/qv��H�d�\��a*��IN�G�F�d��K���"�K;�.�m��g�)?;2��\��)M�;���F��D���~��*#5��g�a��O�N
ap�BT:�(�T{綩��͉S�t���w� �Q�'�v V�)���nx!�S�:T�����}�2ЙJ<�1Ъ-�GgE�BH�j����4�[���0LOJ��AD�RG���U����Nԣ5-c�Չ·a���N3�(��sN!)��f����fo�~#����Im �ZV�xm�z���n�N��7���3"�Li�I^ͱ�d=�����wi�_�:������}F��u'wb������4BO��+RxF�{���]���	e�R�V& ��A��sF&a���\kk_ ׫>��")V�����z{�LIa�ъv�'��.	��G������坚��9}N[�s�����~�Gp0��L� �Τ:��������.WR���i�}7�Ї]� ~:�������k�
`����b��nJ��A����AIeX�78�o���t�QS Uf��n��ø �E9���1�����a��q��%��{ϵ�^(�0�ٲ�����].>��]��_3[R���bn���n�|DX]"72c$�^�ex��;�T]V�oGwn�&!�L�r�6�5��%l,�����#%���}oz�ŉ)���4E���p*�34_�P��5v�{���HNG}�2�j��H}:	>'�0���8�n�����RO�ț�M/�v�9�p(I��\������E?:?����4�ys�������Q]$�%_����0�v9�;un��w���N��
�m���nJ��xm��'U�e�8��.ݗjv��嚯�7.v�ۋ��@�h[�0�aa� 0����k��.��������.tZ����ЕXHՇ�\I���c�ž���1��%��5�����)�+�ɐ5��eT�����z��������gC-z]��p�Pq2�+��n�\�ϰT�x"ɾ'��>[��7�h!\sr�=�Viλ���0��_���%�ΓeHc�v�S�)� �y����D�l�f���@[�7�h�|�Ų�������W���Q�Yt���C�Pҫ�hݨƹ�z�z���]�75r>(���]8mWd�{��US^%5��|�d�\��w����>E�5i�}hY2n��.����r����g��<m���z����f��y�^_�%�yJ����=��ˇ����my��_��7[�}J�!�� �8Yd�_B7&[Ġ���tv\��F�7��G{�	�M}T'�xc'�;��%Z�r>�6�Q�2Es`�����J=.D޴�A��&��0����LGkj�ѵ[�ɪ�+ജd��W��7�>)=Ȉ�%���Y�&��d�jډ����
рJ�[��ǵ���^T�aka��W�I}7 ^,rBD5�7.��Y�L�������	)�����Q�(љJ��,9�t�g�ֻK<���aRzu�I�<��HU �Kt.���v핐`|��S�Ky����5n��:���HA�r�1����C�qbȓZ+E8Z
sNjO�8�w��%�ű�ﲲO]�"Q��w��g�0#J.B^5J:J/S��>F��ݘ�	�Y^�n�����,p/TB-<+V��&�ӕ��-}��-�<^2&��� U�5c�[��0Ȯ3��� �  4f֡ˋ�^�V������Ii\�j�o��(�Nhy{]�ɊS9�r#uF^e���`�wK�}7�K�p>�yߣYI�u;u��1���ØQ<��0����N$c���^���"I�9tC���iIYy�/�c��$��pӎ���R
�H��ph��c҄Id���O��oI(��	��}�n�,q8=�K.d _�H����^߃U�1���G7fr$\���z��+�.$�_b�A}2Ȣ��0W�Z_aV�]ԃ�1�R��K��#��{�"���މ�B��ܝ��i'������b*��d�G3v�ű��`I��LGz��%���x�J��:�b�'�e4)I%p��$?c賭��4����*I��6`����z`d�x?Y��?)4#��`�ٸ��m����������O���v 4�^�L���{M����ӷ���H��)�_s&׶������_�/#�[��G�L'շ݇�.���l�Ec(q�f�i��;�Y�_O�V[�&#5s�VR��PDe҄�H?O��w�Ѕ�
pP�8t�9���>��J}I�K�S�W3o����\�k��������+���������U��7�^(+��I��F�X�rvD� ㇸg�Y2�_�|nV��d;�*���YϷ%Q=�/-�����K�Br�p~ǃ9���b�+y�e�q��-�:���&�zCX���s<�� �� 77��Pi�3���ّ��ݸ9�:�������b���s��u��+�I:,iPj�nbr7Lu�C�9a�/es��a�9���)���t�[��˩>_J�G�N�_�x%e`��{ٖ��En�uj��ƀ?���"�"����\�=1��ڈ�\S�B)�w���v39\>�W����}�9�o� %#�b˺|-��0��H�)y����\���C��F�����h�󵽆!}Ts�nd��t�I�^��mH,Rs���JMwC����0Y9.�Bq
���r
��-��t����ǽ��� �'�eu�<6^�).������v�stE��#��p=)z��V��Ȃ���H��6�)�3�+"�d��҃�N��q�8!�x��I.�:��D�
���b�'��~�;����|E���#��w3����7r�uδ3��o�/D�C��딱G�>��AQx��]D��6�l����%E�KY=5�xwWv1_ N�ZN:Ky�A������M��j	��8�t�K2��Q�d/g��ZF,��Cc�vJB2����O^ð<���:����+E�w��l��ۊK׼���5���[S'�� ���.ū.�wvE�5�z}6��W�����٬w�~���8�.;d�3%�e\���F�Sr�'���=jO�U�Ru�	�㔎r��g�ޑKp�Jc�-I*EƼ�
�U5�
��4��c��õ�t���L�&[��0�H�o�Ho�X�x��o�1��n��|n�����F�Nkg+Ԗk޾�r���k�$���A�JR]N�"|�4ܝ����g��FÐ����P�RR���������4���v���7�c�'=�B8���0iz?��Ժ�;�hk޽��F
p�e9i30��YJqav����a;�r[t�~�#~$�1�����Ug��p�B���w�^�rÔ���|`-\g���xɲ���sCܔ��q��<r5��ȕ��xf@����7����wRJj嚁V���̷�N6f{��s	u�O��J+#ۥJ$_6ៜZ�4pp�L�E����7"ȶC0CY9�&�l�������C�ы��ם����$x�!5UޫH�J��[�g0��3�Nk馰���QܡWG��m�������a��-���I}�-��\�s���n�ڂw�@�?|�t��/f�|2�;�"�9� "��|f�q����̺~8�����u#!�-Lsꓞ`/�,i�������/������_�W[&r9Ҵޕs)/+�S��%��rX�#Mb^?;��	�^�d���N���_:�m��u. �4����������g#�X���9ĦE�n�P&*x�j�[�������d?�������i5�p�+�+�`�.=�j+.�_l���0��N)i9�15�*��$�K�@�N]� #� �*?4�'�1�	7��-�ZE^.�`^9���:O�»�y���O��&m�u���[ؾ;چ����z��-�F�I�u�OR�܋rs�*Ws/�&������`�/`�)��t0�m��pZI%|�X� ��|�l#>!�j�^������rV��tE*�����6�#�L�e�{��o�c�
��I)3Z�qN����KE�,do�����ԇa��բoM��}:��Ҳ��Dܠ���zw��5���'M��Wc<��[Ȏ�V�U���A������0��} U�(����_J���D���!�����g�O2�h���e	��ӿw�-���)�=��p)�g�O:"���Oؤ�/)\�N��8�jpJ���k�sg�'=�Z�+� {��𭚗���M;_�0?��p��"+5���JZ�<��c�yV%3o��=���E�\�	��ص��q���'��|Z[��*��m���:C/��A�(��r�3P��A�)�:Z�Ǻ{�5ŇJԓ��^ZێLlV�'.^�&�6��N�nک��S*�	�]+Z��j�dh ���W�]#��O�]_:�a�q�ޓ�νs�9����l\	�� ���6G�{��5PL~���bSZXݷ��	��B3����/�yq��SU���Nm���9�p�;��ɹEi��|(�ݓ@�a���'MYFO�;/o�ც�{qꡚ|�F驹��S�&��?��"poɡuu՗�G�8�\�d��P�����,�e �J)8v����@��w��d�0Lq#Lt�3�"Zah���^xw���i7)�����ruU�IA;	���w��T�D�4�Sy��e^_�/�:P\��dt�֘�5�#*��p���o:gC&��� ��н?�Q�D�KsB}�&<���Ս ��rl�z9�͇a쉖O�wy/��c/���trr���W�׸>(����|�w_�>���L�V8�]{yձ�ϭ�ݲIF'�I�Ӭ��J��O�ޜ�c��ȶ�P���Ao���O�VKt�������^n���  /Pjcuj{�\�0L����$ۉa�v�m�1��;dqXi���d�����0������{~����+��      �      x������ � �      �   `
  x��Z[S=}���Yw��}��lՖ�0	0	�p����2�7��f�)��@��d�H=\��(&u�fs�E&�H�A�ʕ����{��.w�=��]\�[�������Ϙ��/�7�#
�9u����MFh-�7�/Q�6��q[�E����d��<�`1�B�B�V]����g���Ͽ��^�'ڭ��� ��� 5�&��L���K��\�[�a�wC餾�ݨ�n��U�ך9�	3��]�|B7���9jo�q��D���������&Ç.Ҝ��F�ۡ蒷EK�P��*��aKIB�K�(*\2�1QbKD�l�.�It��S���ۢ�����H�Őo�#�G�B������]J�%f�]���v#Y�~2��q0I���+�N��ǌ-7�Q��}
�T��RYC�95t�N�{؍�d�_tH֓������_<��,]�,�DY��g��D����h���E�+X��l���V,�d��_���VZ�1�dd&,��b0̕L)��z�C餸��(�w�ҖbQ�
W���ջܢ�<G��2�̤ʁ����:��B�̇.�Is�����c�ME�;�W��ڵ�֢c��p�36j&����c�m!�$��E����^�/u���d+���PXQuBq�M�(�rK�+��$�Bd.̀܎t���JC��f7����=��mv'���ڍ=�ku���G��i]���Y���ې8]��.�It������qK��q;Sõ"�:���ّ!���+%�{@YX	�8I]\]��Uu��WWx�~N3��N�$�p���(��Mt t4�0�}p�}����5
D1Ci��v����3Im�d�p��r�,��W�O.�i�s�R1y�9�*�4σ@TC�$��݈�^�D˝�%
�k��A������BF��ǌE�(ef&	�c�PT�H'�=�6��c���g|U4��:$������E9�����pd)E:!yRrPd��/*����0t����nD����_^�x��$���:�=G�D5���U��s�H���7P+�r�UN*Y.m!�=�Yp��n�7��m���Z���)N��fmEۭ��'�Kp$�+�@m,�}��,L:1)��@ӯ�0t�N�{؍��oo����|:�PpWe�A%�?���(]�i�����͜ͅ�0�Vr�"�����iI�%�z�#c��+�N��FG!S1� �yXX5,����32]��Wu������������h�V�2Ψj)2�@[����FǨ���!F:���i����2�L/]��Vw��~�W�lߗxv89�\ .Q����y�|T-��Ҭ���v�W��E��a�V,���������N�dۦ���tD�3YQ��������&8�'����E��B�V�M~9[��ߍ�g�kn���j�����upTɩ�н��V�<.鹂�H���n�ǫ���KG����]���#݉����v����z�jQ�H�8	j�RQ3�Q�w�]�y����\���^���H�F��R�f�D۝�*:��hhϒ������X�^aJ�̅�H󢷃�fw�?���!^?���L�j=�n'EnBc%�k������Y�1QF���%��l]�'_h&p�R��Hs5�`2d�O���ݕ?#�f,���q5Y�m;U,Q�F�  �R��_A�&m4h�=���hN�q�"�7��݈�7�t�_�)@��D�SA��Tl�c��[X�J�:G棠@)�
Yh��Hs��`����|�x���	W �"��4�֍[�r�k(�;�p��z�	%Yg�5�*z8 e��=����^N\���>��ӭ���@Нu4+��H��[y<t�f`�u�%3��rdژą�BH�H�K�`/��,�[�?7 }ɉ[��+
O`�5_EGs��"TA�,ű@5�i����D�K]�y�`7��?>�z��p����n��{J9��Ѱ|�.��:J�u�a��2U���4[�b*��E�'���6��vz��G��T;*&���|�yB5.��-�lkg&Ǚ�
�0��%���Ef�.��)����}ǧ3.�����k"raS��%��cRE�	�p��Z[���Eo�\���]�y���n�^^�e	ܿ�c�q.ЪnN�rʮ��Ts���N8�k,����Dd����2Y�>�2t�f'��>[�~�Ku]���V-��*��/KTo���w�Q	��DS#�$�E$D!��H'�=����v��!{��N��&8JjW.,�R褖�i��^Yp��ԗ�=���u��Z�|� ,쏷���e��/���@)lwPKԉMt���4��M�q�Q��ԏ\r����.�\�:��*��w�Z*��O�o7g�S�"w�ڵ\hQ�pv+��b@�7�F.Ii����ʳE���E�w���|������x�^�����~zy}�,�^�{�-�ɑ��6�h��XE��
�@�K�[�� G%MQ���E�-}{��JdA�36�����".>��D���w�j�0��Z��ZԐ��:���tH��O�9���)]���h{u9�Q�wvd\_ �.U?dF�~��O��8�}��.�D&K1@�ԇC�Ċ3�lɂ�6=t����^|�'I�/N�7uY.�kC4�V������i����z\      �      x������ � �      �      x���ɮd���>Oq��
�,ճd�q� 	����j�N��h�{KE��T�Y)}7�u&�:Mϵ����1W��͉F���c�=ƻ�[H���7���G�׿���?�o�Yފ��%br��>L�;ŚV�Ҏ���Sl�&��Mi-��S�������Xk\�q�.���MB��l�<�����8�bǭ�@���m�ٙƨ>�q�j�a��5a��ٍ�����gM,匔�����B�)�3�?�>�$��s6����jZ
լ<6����vL�c�K�tv�еl�G���c�y��΅�;�}r���*W�g*y_SNƧ�*+�J߉ʎ��?X*GN��2i����M�I;��v���弽Gw��c.��|F_��*���(přN�̢>�u�b/G.��^�9�ׂ�4�0q��Ɯu��`��p˖Ϯ�|D��8Y3��LB�:���	���K��9j�)�=�^(NL�������+3����ho�z��wF��9�R��M�$����{���g��pWu+�����
ʜR�nџkY�c�=ֻ���觷������^�j�d9��i�/�sa�s\)��m�f�Θ-����-���W�E�K��$@���q�R��9]D�tdl��2���i��i+̐cmn��ؖ�Ji�C��)�ީ���r�{�wsd��e:o�g:"���bOV����9l꽰Z�:�%�$f0�C��!��\�j���c���+�Cu=�x�QVچ>U���9�J:-��%�:�79d �3^-�l��3N���ׂ�.rgs��|D��X;f��. �5Ǟ+�lEy�2k���4xR��L����4c[�ċ�M���_��}����$��^ʆ�:K+y�ԝz��ȶͶv�f���+���Z��QB��{˴����[���d���-�C`���e\�;'�zY󐚨� ș
0hP��g�Q��:;�s�W��}�3l�ٸDX
��j��b��')Zy���43Ra�B��rb�tO�"���ڬ�RH��E���=��=�Tv}�Le�.n�5�;�u�9��MN������3֞������.�V=��.�����n�mc����HH�]�Kbl�;��
�FB�Vޛ�Ėۥ�Y>��V�w�n���z�#��;����u��V0E-͹^��(�Ƞ%0U����cٶ�.)&)O}g폮�����,�o��:z�G��`hl ��>�5u��i+p7�l��b�Vgu~*���?���x1��s��`����57TE �eg;�>v�� ��v
]}B�&��^f᤟2�ʏ�{�w���{��O��\���Əe��3;U3`r�tZ<r�0�,>.)�)ˎ2M�oԡo�T6�06.�v��}����Y��N�e��)$h!��!#1FE��_ֲ~�(����:H�\,cZ��۷*�ūϨ��V���Y��Py��4A�?�mnɣ�9��Vt��Z�C[˂��6�Y�8�K2�G
�w�V����U�L9%��̄�S�]e���I����ex��U�"��6�a��WN�^K��Мl>�-���H]O�Z[=AS�bAefʳ�U���GȌ8
,��8j>��g��_��<_`����\GU�vtL	���|V(�\�LFv2T�������!<"i)X��d{�^����9	վQ�q�2���7�;b��?a�u�	]\kAK���Y!�&C����foF���4km�E���PT�^��g�y@�ɘ�� ���ú�MZ`����U�Pq�J���(`���N5�#pN�&ݹ��^�֟EOm�,��V�͞˔����L�!�vVԖ8��-_���6��L��c�'��?��7_goչ�>��Lu�����1�v����ƶ��r%.�K��h��X����zm�ì���7�ҽ��u�L���8�������z����6D�l��({6=O�O_��1������Ǎȭ�MzK�2z�% #ԓ� �9!����%[���>�[*66��������!��`���r!an?�s=QXV]�mc�G'�B[� ����l���bE�ӻ`^���=+�aU��4�{�3I?����TJxK�2z*?� ��0������$�'��$m�Ϣ?��� >�hĐ���%?�)�uv��h�t�_}#���˽	M��B��	�01Q7PU{�z�>���t���%Ư��V��_�;`m} ��Q�^�9oH|=�_o��5���ߡ���3u�kJ��Q~�m&�1��fBqg@�S��^�����j;��	��oչ��\�h�C0�2��l�����~���l*�א�8a�=�.C�~���"�Ή��E���/�'m*�x|��z��haV��ЉY�N#����~��❳�M`q�3����|E�/�/��d��H?ofY�C�N�V;,�Ğ��~$ 0�aM骋�AJie��q��^~� �B<9��}���	��z���zk�#X�/N ׍<b*�H�dZ�Q�A���{o�p�1�������������Y�ݜ�|���H@�V�>�jl���զ�����P�ZѢ�'�/��TBq�:���y[!�9k� ��cr��ͤh���{�ek�4�X��7e#�b��=�3�E��JU]|�L�-�L����EQL�e��}v5柣��ޙu�^��j�%S�����a?*��s�x�@A��t>�g:eL��2��3Ռ�\���굣��=���b�΀��9�ү� ��沾\��=Q�X�����J�+�y:�bA�X(��JZ�����i�\�=�xZ�X0�r���#z +9FFE��R|Л�	OEL�Q�#�4��F�_�_��8}�XY��X�aq�%�|D����b�d8s�ԉq�7N�Z~	n��l��}���V&L�7rh����0��2����9��3�d=���<8	].<<�N���A�,T�ZM�����g~�N�[�%0�W��=}%��Fx4T)�Q-&��]�Q�V���
L��(��~o0�Z�{AE>�ii�"z�ο�(F/�uh��<�� ���PD�I��:i�U:<���kГr60VK�L�-z�SzV2ĹǠ:�N��>�����Z��ZPY�r�E������9��V�|:�C_���y���eCߢwz��J�EJ-3�
�ܓ_5v��Vq
6I`�۱n�$��V��XX�"���yX�f�������ް籖/0Ա�YTF?5$�z�#^��u],�o�d)W0�=[��O�����Qۺ��Ζ}%S�> �@��*�#��z�ʐ[�	j�XE�HTE��x����y�R���$�1Kur�Q騥X�?jd�����	tO}�����h���I"#jn�W��=�r�(L(4O+}�)�^҇O�ڹe�㧗>R�`�#J�5X6�i�{�����^靏�3�4<�Q����I@`�����D^��;qwz+g��-U�<��m��#I��Y/wH��m�Q��-������t���!ܙJGՈX_��=6/��^h�f0<^����j��.hU�Q�Ub��\D�A�8��ն��,�̚�KTt�H��vy�hm@�.�vO!���ЬwZH�K�x��,ղP4�BA�a�j^��=�x���1"�aB���c�_-7�v�IWu��ꄈN6\Q�G�T;��u�7;3�a�H�6�Ԫ1c��	/�bO�LLT1xU�9���X�Ȭ�<���I^��nX0�ߏ�2zRD���ePS���BH��qr)5�4v���~<��`B��QǑT.�>�_�ܹK��<��-��r!꺻i���O���?{��}`���M�m�Y�Dt�X�.��E��.tn@��>�ѳ6��ԐW�	P/�<�-{<C���c'��#����gW$pRη����sA�Wm�f��E:��/١k�,�+t"O��:v�⟇;���գ�z����`�w-�L�EK���&[���E�t2�D��1�F�p�>,���NYH�$�!\��S�4#5�T����ֽ �h�����_��ҹ��|=���oy}	� ��޿	�w��N�7Q[4K�^�;�1w�����m��_LB	�-���=Q|��a�I P  ���]�V����;F>���F����kg��\N�V[���͟}���[�Φ7�s=��{ˢZ���7�Ӗ�~o�6�ʓd=6�4��M�u����ȶU��<��ŴN2$�|��ݟ_G_� ҋa����z�0��PG�������ew1�����m�������C�z#H{׻H�ack�����y����z�[�1�7���2J�?dE;\��4��m����[ojs؊$~���;��~G}�r׾? \F�V�L4K���ޮ4��7#U�PDY�+�:�Pu�Y�SO�Md��W�QTq��ŀ�G\FOa��;�7��ޚⅡw`�v洜?�~;�㿠��      �      x������ � �      �      x������ � �      �      x���׎�J�����zPoΛ��^@���^_?d�s$e��X�.4:�njs{�6 �����sf�ݬ4Sy\=Upo.�f���'���>0}H�I��--l:������� �&�&��C��(LP	�������������$������_q�)�DL:	��?�7�p
�aW�d߁��j��akb@���q]SR[�Ra
f	ӵ|��$�f�qԿ�� ����?�<!�H~�����b	$!f�ka���Egu��b4����qbPχ�qߤ�GLb��i��c҂6`�����_��x̊�fr	''�s���x�2�tl�*�\n
�2�.���'����P��?�!4��2��WP��?X�  b���F�{��6{N��fg���L�'�6��:�g[��Li������.���>!���tǗ�sH�V�J�(w��M�H�D��jJ>D��Mny�6 �7>������`� B (������0HpA ��u��������n�W�M�.D��!�/�TYS8�Q��.ҷ(�%y\c>�NK]�ZM3�I����������A���?&�o`=��^���@� ��P�V5kz)����Y���뺙<]�1�%�F��e�Kގb��Zc$σZӐ�庎KM���a�V�jrWx�+���_����b�Lp
$g��_��M��!��%!\p$3�T�)IĜ�J�1�}�=���N�q)�;�ī����A��m�aI�_��@�+�k)$��(��������/R|�ڐ8�X�����iq�6��({	$v%�)�ca���[-������p8�ܺ�K�2P��BQ� �b�Ė�h m2DLM݊<g�WX�f'�S�S3F�(�V9��I.��� �י����]>0�f��oF��J��"b)���\ŨU�H�sO�93G[�����LI�?a���WQ���� ��1X�F�@|��%5����V�t���ׁ3�M>1�f��j�mUd� "H ��8>�	��d�FW�{�2���n?_ϳ���������+e���M*��Y���g8��#���"�X0�]�WZ�� OP@x����D�򅺽m7A�� I��� 0(ۙg��r��@�}N9���#.l�"�=WG�z%C�3[�����(�z��8"���C'	��<^D��q���]�
^�\���Z,���#��`>8��ƅh��T�3���q���Zx����t��μ��"a���`>(}�-�]+��*^!@܋�j���T�E�)9����6�^�2�?�W>(��@���Q��5(/uj�T �i{˃{kt��^�TUA�9�w.1*����򢋦��x��l�p����IȨ��F�*'ZX|�W�ρ$�@������A�	���d[~~UA�����*�R1�o�v�
��$�r(�s����X8�N�����~���lKM��TT�sC��`�5��,!��%�I����4)F�P��Q�|��z�6)��
9W"�<�_���"�QX czdN9zm���+�ݺ�i?W�!�r�A\�[�Pϔ�
�U�����U�"DykD!��GJ�^)���J��ɘ��K)�)\�UJ�I%���-)�HݚN�Lٱ��w1��v-����.�С�t�J�T�Ő�a`E	��?�B�i*"�����P��0	�Kf��J�M�v=
�c��dO-y����v���[��K�J��lU�Tm�R�Ʒկ�}��O�W�Ό�/�I���6��ow��1��m��K�3t|��@I��pa� _v6"�K֭y���ݕ��+�( &".��(�,[o����y.�?��U���+�3!����QF�SܦL+<w�)(�fQf��(���c�Z��1S���}�IO+�,*ӌ|O	�c��U�Ŕ��r��[��3e�"���
&��I�^^)\�#-ϷM���b��}[�OMO�N��_@���%�ws��'�7�r�V@��P!��Z.��3�YP�867��4�r�mi;��wR�6O�����*RTƫX��s�,Dc��U���\�];��ƌ�	��X�y~4�%�Z�@�*ܱ�� KI1�ʮPO)�g)�<qc���'8Pj )|�(?�j����a���<
�����U��,��~��q�ߎ����{�K���.'0sx`y]��2��a�(%`B�D�s�X�'�� �oJ�ë6�J;�WQ\.R������0��B[E���uaE�|Žl��0��m��g���'����	}� �0FE�T$b"Q#*:��Z���̢�����u&��iҨq�?�E]����j	�"�;�$?�~Diʨc��н�jN�����\�ı�_q՟b��|W
bq�BG��q~j�'�M���|rt�d�Å�t����+{��?"5��_�JJTLM��CT�������Wm���K�#�K9~�Ԁ:�(�H��_gvĸwV�z����Q�_/�d��������d��*��쇇� ��~�)㬥sn8��!]#P,.�橓���ɷk�O�r%�O���A�JR��ЙFT�㫥C��<���N���zy�&=s��w�/������?@�P��Sn�_�B�@� D0��+a��U���>R�Q�H��*.6��-\�{��t2�4�۹�l���qoꏛ$��*|Wq��|S���R��v�T�J�����&�(B�}yT�@�3���P���n��ٶ�B±�J���A�Xr�̔RkT���mR{E�����Ւ0DS�S�*sH�Ԋ'*&20u�匲�,��{d�^�qc*�I� ����Mnf�
�Ei�o��v;s��Q��E��}� 0mQԫ�*���p��y*���6��J��A$TL���Z�C{�䵛���|��v3z����]*�R3����J�6�n��Ba���Z�s��b�FO1H��SA�M>��	i�*�V���J�f��+�K��F�\��%m���dV����-�߼y1ɳ�w*�?�,��"�}U�Pk���L?F���ȓ�b|�^����`^��q�d�Y��mK�]�b�ۃ��⏯�kn��LE��|���1��Y�����x����-�{�\2s)w&������W���Gt���Byc�Q�<ƣ
��*����W�
�0��">l��qf�br4Ľ��1�G~�Nλ���aڲ�����?���K�@�f�*�����]�N�\P�e���V�N�]�>����3_��ؿ�V<�ݼ�&x&�˳=�b݀E,A	ӷ��'u8j8��~��O������=��H�Q��,��	�fJ6�xN�^x��YI��%�Ӯ�r�M:����)�k$q������.^��uћRE���j"�Rѭ�*�A׶-����B		�x���U�tlbl��\]��<�q�W��m�\)-�KR$2��l{�Z8&��b5��Fv��-�P-с�nEض��1I$��R�{�����թ�G�`����?�H]��y����!_����9�e�S1U�|��Q_�Z��>9�ؐ��'
bE�t�g�?%AO+�SΚq�<��|����<v�7N�ُ�q&��4d4T�Sμ�t��Ӣ�,?�+>�	��X�Z�T���O$���h��XT�ȭ�u�V�rڗ�r����"�7�A��o%9(I`A(�]D�_��r�
s�ʨV���ܼl���4K?j{�kl���%�H�qz�M�F��c�z#��V��e��8�
�:��n�ۥ��c��J�"�P�k��"�">�d�R���ʧ˾[ˤ��>�����C}��pDh���C}ʺ ]"��5�<��R�f�d=;��v�f��cS�ИR
]�q��d�B#W8���G�_����N���[�l�<���(�<�/�OCA*܇��.P�㯑��a���S��Fc8��l`m�4����a�^t�/L���k��ܹЯH�V����B�� N��|'�憲��$��lk�imU�]��y���$.��i�NZʃhID%�6{H�������wI$\[Q@� ��u��t8<	��.;����G�P%|�k�o�yH7u)^�a��Ű;����lڵs�ѭ�QܠYY����d����
u=iVI��"t     ������[,j�I�WX�U�;���Y�#`�J��ă�@��#�k��.%(�8��oYKO���tO���a�v��b�|�E2N�; L��p~&�@�g&1$�X�כ���M��[ɉ����|�O@H$7mt��0ea�7\F���5V��N
����?�����]{q�ag���٪��-li�����@]I��)]���1h���A
3���)Y���jZm]o�a+�3�+�S��t^��d��	����E�Gq*2���ynf��^ob�N�+���G���_R�W��&��S86���j7�uOM��|���n�ScV�ﺆg���Ϻ�X��@��:�,����I�y)yԾ�N��M?9��=.��bD��cF�.��}m�Ƶ�\�n5g뾿�tOA8�L��nZ��ע�Łi�g��H�j%zOJ�����"��3H���:�63�y��͒� �aE��G��@5!���ǒ�j� �%���0��|�mM�M�D�? �^Gƚ�!U����<&(���'�|(�2))��gU�$��<�Kj���k���sj�Τ�O�U2c�R�;,�R��=2��H]?!�<�w᫒[(��������������y9����^#�O���Fk=�wokpk)y�	,H��>�1�vҕ��+6T1��m�#E�+���cONh;B��rB�y�����*��z��"�}�������anTL�v��4,�o� #��Db�4\�I�A!`�r�F����_UvC�޺�I�5L���-� �S4P�P12��;y�c���xz�`�\��vw��&}�������*.�L��<���������<9���V�xTW�={�$�<���-G"�|�����SO��v7U���ӱ�����K%�N?���8���D�UK�D20;{1.� �~���� �������m�0�߈d�M��!Yc�il���2�\2�E�v<�@'G��:l�eH�	�C�]�3�V�*(9��t�����p%�\�I%�ꂞg
a��b�Ns�C~��Pf�:s�%�t2's�+�<3[j�YXrOY'�p=buJ�\jC,�Z���J�?H�Q.?���x@�.�zu8x�n�w�op{Ϻ2����fQ�8��,G\�RI��M��>��,.~�h*4��u��G��AY�խr ��L\����Ua�c�^M�rH��<5��s���.#Zmn���S�x�dR�0�-�.��J�M�f��E���-�A<�u-��u�J]X�	0��l3��d�2���`Z�jk9�3X���@�eov��o���K�Z�(X~�������Z��3�/"���<�z�;/ʬ���4�6��{b/�o�����<U���՟��Ⳝ"c�=H+ә.Z��}���~�y�� e8�+y���Y�*���K�w��<���?(�+�������Tn#� F��b��U�1z��������
'3"�&F���e��m�{�A3.�v\����
-
�����0�Jtp��*Q�#���$����u]hJ\��)�`�ݽ_6!�Q��w[��k�h凞qv�@hCS��+g��l�Fd����dc�7�x^/Qo�H�)����(��n��mS���f%��򧺦 DBE� ��Jfs{T,�����4ϱE�6*���Q��~��"���P,T3�Sgv�4<��`��#"�1�I�hW�:��Tm����|4���/j�m/�2� �� �=Wc�mbݕ����1"� ��:��|m�/�1����E�m���٫�鎫��=A�h�>��5F�s����~�3s\`���'���a|j����v"4?F������5�Vv����(/�q�����v�H`���v����+�*��l�o���.Sh�[�楻t���_Oe9�-S�<�$�*/˙����-a���΄)C`�}ښNo��,��ݕ����G��TL>US�W�Ka*�!X�9�����* 5��Q���u�Ss��~l~���T!��B�?�,`�E^��Ǩ a��s�n�|#6��=�d���;�?	��d��#��퉯u���@�S�xB-�Vhўl�6�|V��I���ez7�7��_�r�\�d,�{g�(�/�Ջ�	Bc��!A�B�TF�HR�RoYl$����[q�*�-6����1��e�n��ګmt:��n��?��r��C�Jc���JH"�6st�B���m.��t*��^�Oއ�8{>*�`F�T�V7�,W�y�$O��~ ���Hy�ֆ�g$X����.b�2Ɩ$$��L�=��ힿ�������p`B�2!Tȧ�7h�J�J�!ws8S��´���o�n��Kǹ��#E�e�j`�'f�ȗ^����v��e=��o˃8`	�>*�3bm1�j;$�@�c��W��~;����Ԩp<^>���?���~���B"L/R���h�$�ȍ�l7�4�`��8�s�uoS��I�r&�H���/��~��xI |����j��F���u�F��?���}�̽�ߟ-�s�5$�� �N�7Ka��3/XRd��Q���]�Y.��#7K���>U|��B���JI0%��m�(��X� bcRi���w��i�L_�Z��˯J���z
H_��`H�RH[mѺ���␂��e�*�m����*@3��`wi.3���TX1Z)�׏��A_�#uu&H. ��!s#�"��qdX��T��Ӫѣ�+wr��6m@-H<�>�"O��K����iP-�\������,9���Jm[�~�_�%]*#6w�%V�
���ȴ,:&%.���;���]�;������/f��v��G�~���i��5{���f���'T����qYSתm��s�_��-�c\-V�o5���Ou&��jU$�q��u4h�5[@���Щɂo�v]
��3�Ťa;�������@���l۴)C��-��f%D�)"g���ɲ{��S�]~�C	�!�,������Nw����b�؈�Q�����x�1d�����'�R��SD	�~%��� {-�r�6Sj���Cr�2׼�i�W�9�}N���]S�Ϭ
".�C2e�
��+��d��N�:�Ir6��qa
����=}�|��}���5��Q��Z
NK>#�=7���#�i�>M �
�������9s*_z�}�>�ħ=x�W���Υb�G>"�i|~N�'3���!_�f�<I�����]~I��3*&"����_6F�$�F:c�l>��7w=�4�)�Aĵ'���V)	zEW�,t�$l�8�����^�d�]�8��5#�2u9ʚ�N���|�,-Q�h��&���|�����U>PQ+��b�Q��̭����>�}ga�$_[&k�l�!�ug�,MU���9��cN5��e�/:ōۺ����g��O�_�E�Hk!��B����[�kwQ+�u>��x��>^DČ=�gǙ���q��M�x����`)p0 �������9h�oK��\�s�@j8:l��1�fW��pf�̎��=_'t]�.�����%���P�`����*�/�Ϻ���V��a�s�|�;T��q��.+{Թ�8��*,�Q�v��q��1��T^�m�� �n�ݭ�R��u�:/���:{��Oq��A"�fW�{��{���Ҋ����~u�C�j\��`�%P�>U�Yr����(���
�k�:���Q�Y�#�hƏ���	F�Su��FB��P�@x�Av��Ѱ;(���,��4l_c��a&r۞�H�	�92;��,d�w<x*��P�,��4meQLfK/�R�}?��*"�2����l��\R����
��e1���{��rqP�"1
�P�x�mn^9vvK����#Y|�6Bȫ,���.r.i�ɊЂXGU�����/�-�V��:0k}4
�ٯ7`^GD��H��5b!N��<��b��j�����o7�f�6�^(x�K���y�ze�}ʈ/+���<����t2���j�:�������a"����!��a��Q�"��b5"T�x>�j{~r�~z�
p?�����:�������g|
�z��i�Rƙ��ny 2���;    �¢��z^j3�ĸ�u���y�B��O��$@OY�b��|יC�I�Bϊ!=6+���m;JT�%@8��ݻ��x���٤4'�����rE4���w�;>_�rդ������������U��ӧ��4��_��� Tw^w4F�6��=���W��ޜ���On��0s�Ko+ 
R���T<MՆ�0h$hpz��ɵ*X�@����`ܙ��O����>���)�^D�<f�P��@#*����{������~����̝Q�msW,Z9�=nJ�μ���
�	 
ЧT�,����ԁh�� $��/*�J_1l$n��j2.:C�&c-�i��ް?)��:�f��dPr�'��U��o��uu^wO��_$�.~��Ѫ6�$��lr�T��[�P�M]"�遠��̷����b���_���с�,*շuo״3[>�\��O�f ѥY�
�oDz�}4��[�������k���:ww�7F��O�O���M�R��)��4�{f��e�2&�2�FD��O�wb)L`IyXx���,������š8�ds�I���S"���^�$�2�}V6�K�=~t��.�൰�TW����F`��X�S�Ԝ��\���L��;,����{��ALO�q��ٳ/	�r�5�i�j��}-vhȶ��H��RaԌ�YN0�aϩ8X��jP�n�9��9	� ���z-�e��?�5���)���q�n���6��l���n�k�D���ߌ@��g�&�����2���T|ѦҊ�/���t_�������+N%����oLt��u0͈D����*-�!�r�˦�1=�=1�����`q� ����Y��rg4�4g��v>(���|��s����=��ؗ���o��>�`x��z%�ݹt/��L�R�n�(��M���U��#���n*�4��<�sD~�b�CD�q�+���ܥ�tW(6�U<4gSs�K�&?"d���+?�FD��Y-�F�߶h�? syG����X�R���pr��}P�H�ϯ�!N�k�^���[�S� �M�Qϡ�Ma�#�SZ�Qfʲ���<���wZBIT��A����3�^��Ѩr �
FT
�W��H33��x��i5��ڴȈ|��8ܭ����V�[7H߉�͟���7����<��[��������n[~db���&M�HX�1����ewH�M��<IR���C�t6O@~r�\{l]?Jh�g�T��0H�����aCR�RYB�̵;�^o7)]�q��@����/*���iR+��5���C���穱�U�YIh�0�����h-���[xx���-w�ۤ��>��=6��W.u�Ko�c�C�FD1�s �rYs��}�R����Q�N˙B:�	&�?�)��kuS���� �Q؈�@Ê��kc�^��akl�h���o��j��x�s�M�|��n>�P����.�.���������8��L��d���ϸZ�e�6�3	�I�-�S�x_1�n)[a�q1��!n�:��>�c�>}8�H4�CBJ.�S{A��=Y�0��q7圽�9h�A׺'M؎uB f��IQ�6s��L���GM{����!=�;B��D��Hc����l`e�'�J�{N�������W�J5f���G5���P�\]<�{�RD|K�[X_YU� ��1�'����~y#Q](�7m{�[v���3n���'����=�n�dA+%A	�!JmfT�7Ä�*|��k���Jʖ����1DtH�A0�P^P,z-><�j8,�D�=b��C�6��j���
>%'�\����+U�`���U.T>�ghH�E8����2H�TF�r���$\e�*&�&&y�g!��ʱQp�C���)�y��m�߶藅0?��"�2���k�W��>d�J��p����A˟l��]a�#�<����Q�/���I`�eH_D�;Ƣ3��H��%�ۤ���=�oWy�VW俅m��a����g�H�Ez�4��j�o[�#T��
}��Ӄh.5��q�p΄��C��f�������Ns��S%��~���2��+-X�8�S� ~0���������β�����-�Zd�oe�)��8E�a7� ��73��J�0�㙗/t'���rY��~Z���(	��=hI �2�@#�k��Ic7��B?[��d�Mg+o=��3��#M��_6>�4~��L���]v�_͙vq�?/�O�-�A�I�AU
�ds������6U�"�5h�&|l.:��A�ek��:o�x���ի� �	�>�}J��7qZ}��{a�)&��9r;K�U��$���� ���K��ర�����@�����kcƇ�nr�����%�o�o�D��p��'&�Jė��>n,��3�;d�ٌ���>\;��Q�	H��1A�>�G�%%��\����k!=Oi��T�$���t���/U�,mǷ~���hF���`��&�S�e�9���G������JՃm@�>�X_1V����VjY/������֧j�����3�`��W������.F|�8�������p���V~�nɛ�~��d9F�>�O���C�a�c��Lg�����rF.ו��>^s���Q�3�8$/�A��xB����!91�h� ���f�-n��~M^��y�>��9D�x��}!A"`8!9��:f̓���+I.g�޶�7!��Y{��m�/�-�kR~����b��(��w�ǂ�򠹡~��{F@a�˖��z����E�6����j��6	��N��:�G1��{���������?���S}*Z�  l�D����� #�? ��h^9s�՗{�< LR�-*y����]���W�/Zg��c��c���w!~�s���ҙ��:��L$�h��>qp1�~m�E��X(3��B�\fg����☤R�8�G
ث��)��4F0G�">l��	��{����r�WY��^��~;zZ=S���Řࠊ�!������F\�;��E��� ����.�6n�ү)����b_���r��m�n�&L�2�f]:������7�B�Ӡ��g�^ĩ}lZ��g�]R���ߟlxP���[y�$_E���)ν;A��l՟ଽ�g�2��<��R��l��N��]IN�5'�13�|BhHX��U�0{�������e�'	d����YG��zE;п͈U>�AI�u�.N]J�������/��E�}_�_6V����䫓^_�0=��$܍7�O҇Gc/S�T�OM�H,��;B��OB�\�|zg�k���x~:>N��W��C+�XU��fGa�Y���5ŷλ����F�Fz����Af�F{I+��~���v|�W��/��>���>�E���֩aX��Yp�Dh*:���v��J��Y�y���Ǒx�,����[�z�B���^�N��
n0!����5�e�d�o_RW��/w�"(3(�u*�9_p>����n������K� J�c��X0 �J���}�!R���m��1���)��L��9e��[<�5�h���-��C�(*�j�?�L�t)P�;<$��c���������EK|�P�/�蚃Vw2�B����d���@�_���&��BP8%��J �]9�v��m����uk���O��X�W^��zY`�CFHI��S���M�Vj����N�������:1�J���H(�	��C N�V�/�� �+�G�{�d�F�"�ԃq&�m���J�o�U`\6���	9.\k�a��o^�27bRi+�T��i(�� ��I�9�/�WwҼ��4%�N!����8=�P�)s%G��Y���Q��SR};1x�L�s��_03�c�U݈�9���GU���܏��y?�(�����!N�/X�Mvޝ�Y}�v�bf�n���(�X#���'��%$$<�(�Z��F�Sm^���nor��8���e�'
��8����'�0�_���/+}�9��9δzg6�fr���U�gǞ0jd1�5��:�yc��ab\��S~[�9��������>}O      �+}�<	��~���q�ǌ1;��d��S�%f�z�N�������W<#4Ŕ���G2���I76Njݘ�/9`�+&>_��?>{���_�z�O�㨰9(�D}�8�F��]�}UE�nܩ����G��K &D�W�~�B�g��.���I�4�-�=K$ۛ�69]�N���(x�ȫ��������1�G�����IOGf�`y��d��O`I�+}0p4!	�����q����՝Ɖn�-�v�+��0�>���H��`pU�u����a��qi2+uDgL{���Q>�
ȫm�8��*6# ����qR��%T2����CW�4o%�U�#�=P��1�˒P�NC��Yc$�������c��_J��A�l#��8C3B�}3��s���7��J�c�-}d[8D_B��榆�6�ڣ�&N��S����,{_�Jt�|6zk�����7�=C `.�E}�8��ƥ�:��F��a^+�Z������'
ߌ��ר/}Pu��Z��eBb����֋�3اA�ݿ�G����H�."ދw�����i��.��,%ϛ�O�j���5Ϯ�+kӟ绻��a��l��
ʫOӷ��Uj
��J�l��Gb���~���g$?���`�mE�픈�O����~����0M'��N���]�#�g-���ܶpYԫVk���(֛���fq�v]���:�C��֮{��>�}h)S@^of�i�Vp���Nw��t	���4'B��H���*7�>ABx @@�l>e�ȫ3��
̾�h">l��,�"��5q��4��n�������<\��/�_�5X�
.;P?ֈ�B*�Y:�j�Q�����>)�������8�C�{qL�&��a���Sh |8��Y��ߡ�3qQ'S�T��#���@8k��*�Y�~v;F�$�$�����4�]2�L��������ެ��C�>'~�U�#k�$ @_���W�W�q��_z�	�cRw�;�u
��>�^3�:�7�` ���ϗ��;FHl.�q�g��Ꟛ�A��V�#��Q@���S��ū8�	�5x�ec�OBiѽ���J���T�9������/�&(|�E=VL4���eIZ�|2�����L�|����?l��� �9$ y� A�>m+��������Q�����1��H��<��qc)�@Lқtϩ�&�f'S�m.�]1b������-h�^	&_��r�$����T���ɤ�M��g�[���2� ���$�w�`�4�t˾�L���F�l�d���R{��+�t�y�����J�Ŕ��$Ѵ@�d^!#qJ��M�^y�l���[�����鼟��z��&��e�+P0�W�� �����R�(�/.w�Sp��n��si��mX/�fkE�3�V�'�~��C����� ��`�,�+��q�{4�������3��[ꓠ�ѕI���e�ի� ��p�1::#�9>�_/Er���䲪gZ�K��!^���Q���| ����Pqغ�h$Q�/Sk��	w=����2ѽ< ~'�_`�*�!@�����f�,6�J�3ϵ.���ڻ�z�O��ֲ;�:���>9�gK&s�ף��9{e_�L�ќ0�����X=4D]0��Y�F*������2COG��фi��WWǂ	\�	��x?A l_�ũ�@�t�_�������$�/����L����갘6�>���3U{�������_(iRcL	%6V�����2ID�8�����_�$H#a~�#����ySg3hN��v%Ӧg3y���Wub*�Q"]0/�[�� ��Sa�GS�Q��BB�7]�A�Kϔ��y���M�����j�<V�d�u<ϖ�Y$���#W�O��H�����20,MG(F���C�_G����:^�H��'ҏs���;4%H��	�Meļo�S�*�4vgѨ�+�Kj�j_�6Ɲ����gd��ya�uՕ̄��ň�:K��5����*�ޕ���Gۆ  �ӱ2 �[s�8TC)�3����*��J�K�39ۂ=��X��Fκ���n۬\�x]p��H�4��"j�?]�d�|~�	D(~�%f\��~�ܖѲ5�\S���*��m�R?��=���#LD��Q׏zQ�g������]�랲��X0�����|���!�������,��
D��ec�O���ש��?��9���/3?k�߶}��B[�/�����0�q0�O,�rz��!��|J?h�?��)����\�p�,B�c�d�6W�p�o���=����i�l]'�OG�ȷ��k���x<ĭ�pLq�O��juҾ�Vý"�H��T:����3�$�f>��l��C�� ����8���>f�W��=�gM"���ֻ�>��=��+yz�*X��7��,���I�F�V�+�-����j��˾�[��cT�6'U\�4�1$Bٍ����G�����z�sn����^��(��x>P���_sPOv��E|�X��F�"���&)j�$�:�u��M�g^NP���]c�>h���лvS��>�޲���ϼ��������s4���}���K�q.|Al̝�{ɍ[^Tv�S5�;����+�֟<oD�|�вK �|Fx�8�gƬ�����tnj��nw�9F�Wq��<@q�z�V�Q���$�$#ܗj��Թ��f5t�����rö5��Pٖ*6�)6m�F���
����#�+�y�5����s��$��u���eNd�<@*�*'y���`����(lFK��e�k�{�8��dQ6��C6�n���e]�����o7� h��G����#S}�'���p2����N���zy�&=s��w����+AM�ʾ��i
���n3KQ�
��u�Ө��wJ�T��2�P��i�;J��urml�>N���}*֩i��1^��|zڛ�P�2���vS��S�'Q��w�Q=y�P�'�ɕ���}���ז��:[k�l�Y'K�]��o�_x5��lB�@���]�`.B���ʅW�_��qN&�����q��O�����~ٟǕ���)���7�OB�� �P����!8�O2	U��,6�� ���8M���G!��O(��1f��m����������<��$6�&�w�k=��X���X��e4����s�줶����ܾu-�'�̲�W�/�z�!71j��S87���2���v�_�0e�'^������ ��-v�`��0���Sg�sc���,L�s��٣������8D^�RAP���F�ڰ��������0�%� �����$%yy}�'�N^(��y���ec4/D�b\�΍�e���i��Xbj�}��y ���3A߁heZ�3bL(�	��1��}��R�\o�ey4��W?�:�O	�
���HBj�t������ђRi�������!u^&[�u��ٟ>�B�I�29"��� X�"�d���:�*�����Q
�f�d��"c���<�t/#W�n��05�4�s�їK��PN����/򧴐>U�U�s�Uw����H��SQặ9�]����4H��^2[?Ry7�^}�W�P�p�W�8-B�PE2���S�j)g2��l3S�S�~�@�@u�P�*
O���ac$O�'�����D��ʃ�x��z�^���e�,e:�lo��ʸa�����`���_�N��m9V�o����C��֑t����cTC��4?N|�cHW(�J�;�Fݳ�Ϫ�\՝�^�DA�S�:}�Q� ������On��0s�K�^���j;�z��ίƸ���O�0�?�ӐX��C_�;R���'���,�����[�w���P�����@Bp)������k�$)La�3Vi�@y\}�P����cXf���W��m^{��r�s��~A�i����80�S�����'���}ܨ�{�m���m�=;9qG���{��<C�@I �ðJ<C+�󗍳�@�q�W�Z�"�J��^��N�O��e���_BO�plZ�A'B�c���cc6n���2�y��<�f��[�8���GyBR����=��E    J��3�=TVw�g��s���Ipk�T�߁z�Edt��2ۛ�69g8��l�ln��{� �bG= �[��o��pԊڍ\/ɤ��Uiw]�Y�I2Ɗ��>a$o���z�۪����fr�G!�׾���w[����%T:���U���M��ϤܾwMP��š�I��O�$@��[@w�%uD1w"�>>��@e�mO{�����r�ꕒ��߯�=���9	� X��0I���g�H��ݖ{R�6E*�b8�+��o<�9$_�'
����E E��8s ��7�����
��E��\���/�O|e9���-m����#��IC�;i��t�+�Q3�K��}<�>"��ꕾ��:�a��ac��å<�Ժ���-۷c+_9��@��~$�-�`7��>���J1λ������0T75�'�'	�P�}ToVR��;�t#>l��Q��:^�����͗�U0-���L� ]�UOXk��?�߈/k�~_��;��Rq,���o��b��94\�+}\�qb\���"�L���2nL��ܲ6(g�^������j$?q�"��/@�\�M!9�za�Ŧ��w2��n%{㞓M�V��ۨ��М��1�?#�hbe���0*� �����$ �(D�f�)�F�| �Ⱦۗ�AM�Ќ8�S�~�y�p/�ڝ��.���I㓛P�Ⱦ��+L�k�/�ň�D��N���xǡ��Yy�)�,�������*5���d �9�=3��*�w�K��:�F�������4S�5���E�|��n�h�	��%��+*@~Ak˻hCᔦ���d_͘�+�T/���>���Q@���7��G /�uQoev��-U���sޙ�� V�.�$2���3N������W-�6�L���L��[�4�����X0졡qYBg_�3��ו]enNr77}��o�=M��q�|�;T��q��.+{Թ�O�߃Q�j>�vj��f�s��-^�F�=g�����4*��zY���Z@���D���&�f4���$9�bӔnT�æ��޲t���R�EcyO.�W�0I�)����F����)���[�$E_�Q"$�<��:���q}�9 9��%�N���:@��ю��%
;oPr�lR��80��&G�9�a.��~k6y��e��eZ�h���ɽ���CD9��@�������H�R��d\*t��}'�y�����eX�Z�^��F�'��,� ���2��;�ѭuj�*^�F) 1���rv.A%����O[�~K~2�� * ��y�oF)�
 B�v��J>g�|��R*�ٷ�^wi��I C
«�L��0z60�k���I0�O��6�9'��_܂;��bE_W��s�}SB(�S�f��6Uz�$[��`�\��7�I�*l�p��'O*F�K�=x�RӇ�b` ���*�!�*[��dZ�n�^�����_�~�E���@����	n����?@$�2�x��T��A<���e���"F�{��R����钃�Mř#�|��E��Z�S��u��!`T�j��!tw��c�I�V�@s�|j�����8��H��~�a��A�=" @c��F�-�,y�I/�H�C:-Y�����A~'O�}E �u|"Bp��R�٘_�,��gڟw�{���z�*I��8~�?����y,������t�x��9wظ���萌sKBhT��V�z�9�|8�7�ՠ�~�Y�w�X�QV	Op�px�:B3bʀHg�rP�V�qx�-�2�\���3Ԁ@�j8��P� �/q�`��b��4����t�ZĄ{����!��w�9�^��lO���i?U���m�̆~��V͞)��=�GP���A>__#�l����L�w�W���$��8�������_�MI��i 3���U#4?V�cF*=�{�{�d����Ɨ���3� ��Q��N�4v,	+��:@f�]p�#�A�<�g�)*���|����W��6" �#$'V�xp��=P�_�_�=QH_ė��>��-�1�2�RϹaip�����{���W����I%�,(�D���G�J��q�m�۫�|�n�3g�s̐?�@�&�:7��zF���Ĉ�,���N����C��#�Ԡ ���[���Z��p���)��4/���r�����'���� ܐ�a?��_T�'� �=mT:���+6��}��PBB�5����;�Ӄ���V�8�q�����:�s�������'-�GP������U�!�0��"�z�?��Q��&�Ψ�ۃs�Ծ9�f������=�7L���3J;	;���1.�I$��}"k��{ot�Ik�*�������}���OB���!8q��0�a�u�r�W(������t�#D�W��e} �허+}��7V�U��-f6~}7ǬZ,~���D~��h0�50�~�&">l���6���� �ʾ��&���6F�=�^:��h��R�F��i���֮k�q%�>s��Bz3o��K%�Z���_��du�%_���Wu�a2"N�?��XO�7(���)���|���wH���T�]����f�.�Z��'c5W�bTFݔs���f��]�4a���%L�!m=���ơ�hZ�(!%�a�R-�=��e�4��Қ�5/�b��G����B�"����ֶ��c�������M	e≦T��DW�i��D�U���,	�e��	7���1N��9F�y�]����|r���r��L��)?��Z��z=+�������jre}+�}�����i��羊�|�|��4)���cQ�B)%�<�=����#ƌ�e�s���S�� ��~�:H��bR)Q��I��OTJ\��+��Տ�4���@�eo���o���S�Z�srL�9�Br5pj��۩MWN;��vD�|����fT�@J�X�<����?���ifhY49�u� �eXo�1&G����ה*��ɇ��L/?$�CO1��@ɀ�|�m}�ڈv�O�_��z
�A��$��~�Pjv�����i�������t�3X��t��ȵ*����zya����{�x"�3yi�`A�6��	�:u]0�Ǩ�C��u�ۘ_ƥ����A�� '�5v-�4�r;��j��Ѿ�ڴ>Ezp)�Pа01q�����/|����qf~]�^��O_��λ�7����5
��Tt�BHh�"F�b��G��}�=�4�	z��ǧ�����kq���:��[#Y��:t���.�_�C���U�F	��J�(���O��q�h�q7�+^� ��#C(QQ�bzJO�5�ic�5�W��2��<�c ��h7���
�8՝
�>��� �P!:|�4������@�y���3!�fl�|@��̰��͇S���b��Q�HP@0��|<��j��뺷iڙ5UN�}2·��Rd�.�N}����٤�����l7�e$�������c���VŢs���py-q��S璆�="mGX�L���Ϫ���Į���߂#���q���YXת�YYTV���-	�@��D�Ѕ��fT�2kHB��R�|,fю�r��e��S��͘�5ѥ��&5V�t#��Oe�/;u���A���9����DھD��d�7m��(�}��@4b�N�c�A�ݧ���޶7��ׄy�/�6�?D[�V��/�zB>�����h檽Ef|l^aa�O�q�����ڝ��Tm�R�nu{�W�w
�/`�p4�?�_6>�B��'_���;�%z�f����,�?�x����$ ��H��0�E����??$�́0�''R�{��ۊ-.qv

����g�,|M˫|~��u�[V`?������4��Ƙ�J��e�2�X�u�/N�Wx�N>�D�WJ� =��.H� #!�RD�#>���ac���tهޯNm�&���U����q�*!"x8�Q�����!�:�ݶ5:�W��1�)2�X|T��W���Vc��ӛ�t�:�ETP�{�P�55f�9������B����d�}�}-�Cx�su�ݻ�<4_D`�C'&0���    �����?����MD8��a�ç�m�NuU�^��ufv��@�Ұ��[�)��l@��G��}7$�|�dj��M���|y�Ƴ6��ʏ3����C'�<yN��K��3��٨k�a�j#���h�f�N�m zf��V&�2k����	�p�G���IB!�|ħ	������]���_�C�t�ZΥТ_���2������T�ߞ���
�ǔ�Ǟcͩ!tG2#�7v/�]5y��t1��߫��I2Ʃv)�0z���y;k�؃ܰ�d�L���#��c�܍H�X���P�C�*��ŗ�
�hTl�Q{՟*��۾�9!Ӟ�Ʈ�.�����,�k����RY����֦�i�eD<!D�Jh���	v�+������������~N�K�%6�����F��N?�X%:.ц�����c�+�?�U��2�J;e��6.��X9V���Y�ꍉ�;���W9?k��~�2�%�಩;L�v��%0�08�4k�c�;^ڴT&�/6-� �'sLh���+)3�4��o~C����^W]��me��`9������f��_�ֵ�:�㤻imZ�Ch�o�1e���pT�๦�	��BL�dO�9�6_�2)ċ���Se/�C,�9���!eO���=��<[�땡.�m;���w��Y��;��+Q�:�_Wɏ����Q����T�2u���U��~�8�0%��|߇ʎ3Ǳ~���//W�=k��w�U8*v�s�=݌�x�f�x��PI��t�r�R%�6�Mi���
O`�
ʙ�{0܀5����f��rkr�����Q�HB�o���s��LB�bFu]VjF12�O�I�1���4���f�(ӫ���Y�jmO���<��m�Lb�^`�?TP�+=���*"S��ucԿ�TN�9����E�f+�v�u�K������
	���n�é� ��J�|O��IdzrUz������k��[$�G�N�Ӿg�Ih:?��T�q��L�BY0��s�4���oS�Z�/9aht�+c��e���'�r1	j� #�� ﵖݝ���Qߢܴ<������T)�
��
j�ǁ�Sq�!�cs�����U�?W3�GTN�+/�p��`�df�P_"=3x{".�-GE���-7��sh�m�q�f�e�i]�u(>�4q���Y�;�@|�
��)����0�P�J���g�Ҩ��=bd���.����/�X�Mr�s ڇ0���P�!D�0-WE0ٞiY.4-o[:�t�_��t;Ă��qmW�O^;����ʟޖ�Jp _���C����A�oa-��=
<	[�$�����I��XMF���b��j�%�~u��/��BE@�9TPT�)-��\yD]���Q� �O�� ���1�/�5Nv�k�\�6�o�}~��&���'���q&y- N���������2�3��sV�-�[ɪ�^��u(hЏ$Ń�e*�a/�v��:����4��+��#lZ�y&@>��p9u~i���F��UKv��w���z���/G-�*<7E 	���#J1�(Q	�z&�l�p�,���@Eԣ���/D�Th.�ע�=U��mO9e���HEϦ���Yf>�.���r%#��?�v��3�3��#<���:K�S[BD-h��Z���Fk9�k���`�{� �Q/3<�f���g~�����̄*M��� Kc�)}���qqr��o^��)|~�4E��UXw��H
l(�I ��)��|�R���q� ���� �ǅ� �'�\�3�{����4
��J� }���T�CXٶ�L���~OBLL�1��ؾ��G~v�YU����u_|<������r�2T�O��ÞO�Wi��Q���K�
�L%� �K���<d��S��>������f���\�KF��`"�8��TGwC���̖�v�����L˷]%5�P�K7����C��:BP���]�"�ڟPJ���!�:����2��Y�|E��KJX��{h�d�L��2�鲣��ѫf�H e�^���:~���u,�t|KE����)�mۚxR)���r���.~ �����=
��	BŋP�x�E��f�m&�>�����r���VHB"�`�^�ja!�v�_O}�{۔BųۖO�, ��#��L�V�q�H�'��vQr�E���?d0�����S�1eܰ��L�r��ML��o"����,��7l3j�����e����lO���}Fop����ա����.UNu�&V����.l�YU�n���!4�_g��R��Vi�5���礦��VO�!u��W��)q��v�Y�̹;�|���I����l)�=�J�Akf]X�˶X^��)9h����8 ��0��ŏI��9�+DT*a��o�*)�)UO�����y����CO�=a���R=���]�oΚ�do��rY�}	��#"U+)����$�n� 	)	�15W�r��~�j�j��E9g�4� '۩o˕���m�vs�.��6�U8hH�GnAozoo�����S`<�����8N�S��]�p4@��}D�9��� _0�MxB��ŏ�l��I$�]��������>�-�.*�8�3�E@Q����=���EO${�"4'��1I��j;/6�J�3͵N����u.|2��S^�� ��0�I/=ؠ���Qv�����YMK�n����+����@�dQ�����!� ��&�[�B���	@*�c�d
�y'Y��gh���)�\ҍ�$(��)��NA<$Ri|��G�*=����|gֹ'���$j�^��&�\���~�h����%}�g_� �?��$�j
�P=ەڴ�Z���r��8��u���Jd���#9�g
a�*� w��� s��.�un�A��$�]w�u��/Y"�( >��W��?k|� T顁�k���?���x� W����>�=>��K~�JX��t#"��"4������?��&�;�|����z}|�>��Nc'5)znfU�f�|�T�n�*�yj����d�@\�*�q"�y�i*��72�������sP�J/�(�~�8�c�?M"�KmX� �cM���W$�i���^����N1NʪۦIK*�����m�v����ʵ�L�r��p�`�tS���/x>]�k���ֵK��֨9%p~2,� i*�B�
T��Ut\L!��9*�3K�4`�LrT$�f�0�d��G�
�d�?= ��Po��2�[h2���>���C*yj��n��1G��Z�����3*�d���ò ���S��}��y0n���e��;.+�4�s��Hvpr�w��q����;��%H�~^`����5tlR�*ךw��N���0|u��SӳԽ @a9:�v}���=��}P����	�$���~���E<�kE�1��!���ϥ�꺅F��/S�'	�`�s�T�yq�˳u9�V-�(�,��C�,*&��%���p�N?i5�E!i d;6�	�2�*	妍ԟ��Ôu[�C���qY�wK�|�����U&� ��>�)��7��^IL�d{��u��kKK*<R���Λ��q�8�:*#�o�(�z�yWA�U�^�6�'�'%�e�~��N�T���Cn�N���?"����k�����#ʟ|ĭ����*c��*Q6P��Ս�����&}�}��o��3\ҀyB݀�糈�qzt@a��ysވ@��Se@O1筿�Y2�1�6@�1�,���uy�]���v�:ygi�,��魂B���@������D���l���Ϋ=_�U�cO+��xٌsi�^Zc,J�[e��N��n�3�D���wT,��9���qne�4�ż��­��i��� ��9����,U���W�Ӄ���V��� 7ctn"j�y��Ţ
Jε��X���#Z5����L`.���8ot�(��Ø���;�P��3��4��O��S$j��ͭ��P	� z���H���%gPN����9*�k�A��qnƺ=u�͑>a���R�d�g���x�ZL�o}F�J>�rkF��)��,��R�ON�za�TC6zi��d��UϽ����'-F�ZO� M�A��$��ƉO��r�-gzxS�f* �	  mf�ۭW^���$D ���Q��#����<�Gܐ��r�d�Y�?�*����\G}*J1U��@O%�6������c"�������]1v�Ψ�y�1�^B�+]P�q0��I�s����V��G4���P:�AnUk�+�������(Xi�@݊+�WJ�`cVH
+��oϱ�;P��������lJ��g ;�mPX�q���;#躇K���T��K�����_+(��X��`���0,������Fn7`�I��AK�������@ �M%�?�_6V|T�$�ک.VOT��WJ��.�t�'Ip�!�����4tH��E��.TAaƹ��q�؇`!�$b�{�	��UQ	|�wg����;���q�Ҙ\�Ȳ2sZB~�����5+�_$�G@�v@d�r�l&�44*_6F|�y��z8U��y���tq�J����S���6�a F|�8�qn,��U<t�(ըV+�]zRi�o*���M��{@4��)BS���ƉO0c�7�~{gy��(ǅ�,O��������d�g*�
�7��Ɗ�~2=jΪ�]˫�M�[s�#|�0D� z.�����F|�X�	��R��3����Aix!�����^��\�*����U��+>i��#ZO~��^��}w����A ���xB�����6Nx*�ޤR�cm;�k�_][���v�#�Gp����r	*P�Y��]c��e�ޥZv	�t��T�0G��z����z�z��g�\ć�2�u�z4�����<7]����#�� `Ϸ�kvM�����6���
���`����u���ə�R�#x7 �ËQ��ɐې�0������T#�;fU�Y&_��[�̵�K����>)UV��9�4�9J;���\9���2��s�*���ͮ�\��������򻑐��_h{8Ead�91ʏCj|1�?NR���딤�d_�[���n$D�ӓ��yQ��] ���91ʏ#a���X�?f�qՁ ����	Q���	"��p#'N������r"��n�)���4ɤ/�O��O@�G��=p*��� 6�P�8Ň�!�,��'pZ$�j5[�����VB��G	��L���)?3U|�:�b��s;�m�����;	�a�9�ρAb��fҧ�����=�/�k�;k�<^��0-疟��		tO~���r�Ud�/Bsb�6�y��j�K׫��v�0ȝ/���VB�=�͎��J��>Bsb�1<�ڮ7S���_p�v�C�?�7�=�wM0G�%��_���*?j�In{�zʳ��Jd�%�z�`r'!	�x�4��`Q	��EhN��cƥ:f���S�
p�n�`����n$��|�z�$�&cЇ�������q�5\���]k��/F�'��V@=��ܫO"2�wE(N���hw���`�3�'{?�Z�>�>o$��ֽ~�&�0䖎Л8�ǡQ�ri�s�K��߹�S��z�� �^|<��"���l�P�8�Ǒa�����ګ�S�A~��V��^~!!���Q�O�ned��xI���*?l��]��������_x��r�&���78���G�]#������%"�l�{��U7�F�
w�}�ϓJ���R���w��$��H�,��y�0����
���H6�Ǌym�
�.�j�{_=�pH�1�C���V���+<fL63{�ηf�Ԟ�U���v��S�;�A"��xq�K @ ���D���='���i��}�V��_��G��Ovw{�5�d����s���)?��f�'{�R*�l��g�ߗ������΄D:��'�f$�o��I��T��s�_muK�Kc3�����~���U؈F�T��6�qc�
}����i��@ <t;�4�)�Y��@����8�F�rj~.�-w�^NS1�0���]��x�j����@����A���~�a�,F�h�ŏ�4f�Z�k�w.�y��H��z?���`=/���uHH�D\�8�c8��!l�F��]z�����y' ��Z�H�'�?+<#'N�ah���Q}o�/~�����q��L~7�I=���U�Of�8���E������r^�&�n漧�� ~�����#��ƊutI��µ�E��^�ؖp�~�~��=/:�ǚeF�?�}#.F��I����Zs�_	�X�j�zc��D~�"�1��{���
�iXu�МX�G������~�I���x�m��p+!���p�H�6��p�(Bsb�7&4�l8��h��,fg���I�p+!��3>B���������Q�_J�j���Ӄ��n]d��D׷�OɃ^)+�AZ��Ƀ����*?iT���_[2`�'[�;t6��[�3^I����V��`�I$D���9�F���~��z����Aqz���6i~t�n$D_�S�)e	y��e0Bq��Q!���+ ̨���mj����8��E���0�/�����o"Bq~%��M���������      �      x������ � �      �      x������ � �      �     x�U�ّ�0���R�$�l�ql�3�C����F�����7=��`N�����ML"Zb��)�e�7�)�yF�M�EW��sq�D���Ɏg�	�H��0Tz�}����N�f��'=l�Uا� �v]Zpj
_�W��͆��/*�F�;s���ɰs
��Ʀ�k"��`�j�i�.�F�ɓ�[�����Z��83O����\Ԃ�4jǋnj8��N���0�ܿ��M+�gu��n$j*t��L�&w�Y4�b��纮%�:      �   �  x��ZK�c9�\�N�1�@� �O�~Ws��8��+(嫜��ª�"�p��I9R����!G���հʘ[4�ٸqi�tI�yhȣ~�k��#S���yc�(*_1?D$�,�K���'���Z�߈��1��QR5��jk%�]����J��X����b�����s�P�m�<e��G�c`��� {��)G�OB��	m��c!j�xxԪ���h}��i�{�<�&�����KC��N̖k/�?Gr��E��H鞓D�?	�]�Hh���09�{�j���Q)	չ-�E
n�*4s��w؝PG�Y��UBxd��H���B��#!���	�N`HK֨���s�U��-Q*C{Fq&*d�B���,���Bi�ˑ)>��FL�M�5z$��^ق2�-�Т� c��[�%�6㴁Ã��x�QhV%��-vܛ��9�5*Q�H�%z$�X�%�=�B���a�'�b�r�z��a�M��_���FS�ug3yu҇ĻXDW�
���P伌WqPDo{�c�B��I�v�D7��%#�$hkm+q�ˑPL_�b�h�̙���2x��Ͼ�хcU�/��Ѯ$\"�(G�V4}���RXd�����L�"ܕ)��\�E�4�]b�P�Z�1t[���V����3����h�e�'��B7h����w���A�禯e�i�Q��顥��s	�h��m�	�l2D�Zx�� t��_��rg�@�˄��GB]�H��B�����Ǟ2	�����z� w�Efp�������c�/��=WJt��K�Hh0��#KqZ'�*���4��$�Ņk�8��<�F�|%����őz�X+���E�d��f[��9��}���9�0m�x���@�O\Y�t��;`�HIJ��9����_�GBd�N�i�2�G��J �Қ�Ҩt�MUZ!U2��l���[�Q{=2yafs���K���kQma��.��L�MdE�c�r�kp�H�K���Ր�OՙRZ�`(}�<�_�E�l�9d)xu��τIJkO���^۱��=�����G�4b�����w"9]$�=y:U��esP�����0� 1�H�b�L₠w���c�{����wI5^$�=��5�6�g��Ҙ�h0��������<��+@��+�~=+TwI���+:��B�w��::&}��)i�!��ȺT�hw+�d�1��R�5�^��K�T�=M�	��sy���
��^��:�^�=�����AhkL�|4��EOj��2�rA�hB{<��K45�[�s��H�ԇw�qPX`k���0�_h!���󨿌����H��;TGޒB_�C*,ul��7+]1Sr	_�����#!Y��.k!���8�F��AR)�nB�Es���^S���.�g���I0+�3pV���6�F���Y0�e�0JIb�����=�܄!qu'9]*j t/���-v<�Ɋ����P���T�kkZ�n6ڜcJ -��2��Ġ��*5h۟
���Tɛ�Ƙ��s=��.vю��J�t�ͱJ앖����ȝ�8pTΦ�C�N��
=������\����^�#���e��c����.1��*�{�ڭL���A��7���#���ˠ吥@�@���J3�`X���^���詅�#������
�k�Bq���{�f����k S�4��.zJ�+�����c��S�n��H�@cz�Pp`/̖IP$��Gz�����=դ��ꯣ'�`�I:kW��?�\��V��j0Ho���rW��^}�����64(�C@���_�<�%�C����L&Q||oZ�VL�ih\Gτj5�a�gHX��^y��l	��fB��ɅE�l���e�ɯ2|,FP���)���
]�I���]/*�G�{��}=+%L�k��v���\���J��n��m�c�����h�� �(6�3,����MR�I�]GO2�]�֒��T+��7�D�ud砷Xھ�B��N��|��u���164��(�A#H��)v��Ѓ-�+�0Õ��B�}w!l~E�?5H��|��Fz��e��)� w_u�c)�V����%����1���	%���,Fy��O�5v���I}�����of7Wa���!\��8��Q.H�
�%IVN���{sXQ�O�|��GBt(c�P�+i*9 ��h�b���K� -�_����>��S)=��;�Q�e���;��8ڇ�EF����&z*E���0� �rO��;�{*TY-�ӄ�`x��}�bє��p�$q�Ea�!L���O1�I��,�	=EOM[�W	�ڷ� ���-Q�i���G	�#ƻ���*�=7���"�%0�K kO8ֹ��]�Ew��c~=��Y��ͮ�V�mв��.�B�>M(�m�_�E�tsɆ	�TR_��?V!����bKa�?M�<��o:�'O/"��Ў�1���*�қo���?Lԇ�� �L�)z&���8�h����Rp�
�T�%���x�<"A��ך�7�C�r�]C���ʬA��A��*y��aB�4�
�/ѓ�A�i얼B:U�v(�";��ھ�4���,�	=EO�X���	���,3t�9D���%y���GV�@�W��9x�t/iab�Է�W�FeA�m�%������)�8��D��T< �y�at��|-^r*�ㄸ�4!�K��@�����遯�*`���2u�hh��j1���fq�Q���Y���e�HȄz4���UQ!�������乫r���o�g�25��!,# �p�a�pP)H��>L�]��$W=�={LIv;��Ru��[V���\T�����D%~D��j�:zz2 +�B�^T�Ղͅ�x;6YM��M��m���jU~M�"�$�m��!(Y�F�m��B���d}��F��n�Lծ1�=yZR,P�n���v�)7���)e�f�:����7�glA
A�&��&������ɛ2_D%vǳ��4X��'�7��h-����c� F�e0��;x���c�o	����^�O{��la�M�
�s$�޶t��:��GƏw�Cy�B��sp`7��+\�s��ab���lɻ�����:�휯z��{r���r��nN�fX���>Kk�4�0!����:���8+����Ҟ���5�qF���o������Hr�fs����ϳ�2z^�'a5�}�&�7s஫����H��LA1������o��m��1�X�5	�w��9&h�7�^������aӟ��*x��5�לZ�и:f_ڶUu�o�����CrO���E�u�d����j���yY脉�q�,���������&ݫZ,�u��=�X�#V(W��� ��`��5�/-Q����/�W�i�~'ϯ.�����܇4\�����K/�g������LH�H�_�.T�iUu=����?��?��f<      �      x������ � �      �      x������ � �      �      x��|YW#���s�_Qk��v:�O�<����۫���<���]��w�m�6.��)��!U(B�"�P(Z}D{���`ڊ�pFP�0Q�V>D�xJ�ELp�ÌG�53�n绑�~�_b����c���+Zs�B44�d�-{��#�q�Z�7z�K^�ھ/���\��l޴'�����0�0���)קXǌ`"�@��*����~�?�jI�����۠7i:?����_�c�����Ϗ��{����?0z<���t�UoН��� �_��۩�d2���!A?	=E���Xa��^K�.��|��t,�3�"Mt�Ij�0Ō)������f��#���%�<}1sո.��j���Ty��o�J�r2����M��F�<�.�ٰ:�������S�bI8�9��E���r3�����'��i�m��z��@�)f1ט�#@#��D"	�@�X��pc�y��
�ƙN��4vm��v|��x0?�ĝ�ژ�<��w��VB���N��p�_�K�O������c����j4�B��b�Vj�ݬ�ARh�����)��8�D����N⭑�&Qby����qG�{ǝ�-�a����ڦ��5�v��bi<N�.l�6��kWη2d��{���%{qs%+��]3����צj�E{�A"S���ޏ���	�>�������z=k����I�>���#�8;>���,�(�bCT��F> �4V2};����C�1��o�m��WO����:��Q�(�H��drIs,�ȇ<.'���x����S*c����l�&	�]tRe��R�mx�墚�M�ٖˏh�x��h$#C<�R��H:jL�xx8�j���m��4����Nnڜ�	���7��&�)���><���y%�k��|Z{��T���`����r�X�jN%�aǘN��NZ��AJY+��	��sG�E�ꐼ��"7��,b�\��UOM�a�T��+�OLs�M��R䷳Q$�	JKIb�a�C� ΃�$��9�`9�w�m��),�O�D�����՜�#�c
�	�I�<uT�s}xo,��l����=�W.)�.k\���y�l��Θ����>�n��f�X{|=OhyRݱ�Vh�{�]�fHp}۝�>�Y�d���W�}��P)��\I����j��`"��_kT���]"$�l*w���)�p�V�z ��;4�Ӈq/n__������F����c��5��EfV#f�M�S�c�һ��Ϲ�GSD�M� -���\W3)�tz�s]�!�1|+&���"X1�}����HS��� :�f��c�c�ɂ�FA��\}r��ٗ;�М�L�VU���k�x.�M�6���FFb��s�����3�%<+�~����5;�/d�H��~����16b	��!
T�`�Z���;��洏F�OwYmГ��r�����&S�?��4,'��\�:w���S�ߘ��Hc������X#E��O��8@m��٭�c��=�n-�L�k �,I#K#P�B,8��0Z�:i�v������x~W��চ��>����{��ޫ����2�UX��n��\��7%� eF1EJ��1}�H�o'aKx�j}AgC,�e�9�I#�Q�iG !H�� �*�u���<��_�v�.<�wo�p5=�5s�~�Ң���^c���h�⼐ϔ��m�=��o�N��^���h�ɟ��h��qb�J��8��T�o'��O5���|+Q6,`�]$U""F�Q�Q!Q�;��Q�;_���>��~-��F��q�)Z���1�D���b��n����y>�hQ�wWAcM���Y����㐹�^{�Y�)��Dl-��pn�3NJ�#
�(�"+#<��d�j�(����_w2t����x�8��q?�,n�:�V��Ë�f7�	{Õ�n��*�Ө4�W���K�Lӄ�S���������Kt�z�Eg=E|��j��A���\%���
�1�	&!IB��FS9J�X~�n�^C����=�G��.�/Xy��m�,����S5q��2+�҉,W�WΊP̤"�R��h��8������j/c�@�_��Q��]or�9���iν@�{'�A��N毻 �|l�j�0�vY>{}~�x���E���WK��>i5�ׁO��'"g�ߣizR ���@2F�>�� �R�w ��Q��~�@�ї"�?�Y�bH����F��w^iȄ(���A���%� M�����e�bm��V͞�^TǗ��>�)5��z�*c{����5y�������-���y�4,#$�Q-hO��T�7.n)$^�,h-$C� Q	���<�	�d��$��
$47
��.$�ߑ�\O�� �d�f���)l򍒭���3��ݏ�*�g�x���{�׬w������<�$f�}R�C �GzZ���L�!��ೖC�+���Q��e��A�Ej��Q���p�`�~W:���u�v���]���伤�b8�c7�\\���<����B���j�nzG�|��JP���)�9��h5Z#|$�Y�/z��k�K6��(Ǆ;� ���!b� �֊GD#�����K��v����H՚���Т퓋���������_��A�����bt�R<պ�]M�)c��i��Y��J��Z)���TH`�˰7Q���a��$r.!ZEVI�C&�R>)��f�f�8�u������6������YY�u
�1Z=(?�z��]���x����5���Ϻ��ON�}8�l�����<�[�ޚS�z��P�������IO�����H���e��Wv� �[�]�y�W�r�b�Y�/���.ș���:����sw��F�E��nX�y��R;ЧX�RB���f�u!�!���1M�b�b:+��ƞ�`���v��A5G�Rs#\�+�	Gyd�@���I��; ��C����S}�Wg7�r��3�|޳���Z����-Z7�#�jT��P.��s~1o݄Ox���)��IU���l�H�o�=4;��bo�k��N���\�	��gy�G�)��#��Ga�&J,r)?��2�[pH"�ׇ���ix��g��A���e/4�j���ϯ��Sr�0ًi�������w��6��Z.;=(d>_J���db���l��'�K%�\:
1�BЄq�g��8����]��%E�'P�KJa0�Zp�|
ւcF�W�oC���f�mv���R��7`G:=c)W���a�����LdZ3��W9n1A��9��M�����$��yV���N�o����?zZ�x��~q6G�p_����EŜ��SX�\�U�{
�~�[�)O�캆�xޕ�φT��/VINᓣ�#��1��MMQj�NA��"Hum���9-=L�n7_<zm\t�����vrA����������$7�ʓ�� �IU��gm�mٟ��)W1�Z�/\иA�t�a�[�����7Z� ��:ak��-���~"u��r��ѩ�B9����N��R�*�w��K�c�(��$��.X����Q+L��@�%|�TR	GI��Q��������D�#NH�q&�A��n�U������\gh����-:E9��g7/�����R����r߉j��k����� @���M�����h�p���<3��}v�.��6����d�� ,
(
��lrH��GY��Nہ��������d4D{��u���_�W�6�у���}<�S�o�/�ŗJ8�W�g:@xA�|e��sgO�v9ъ|�<NC�P'�*��.����
B�ôDx��rr&]P� �h$/H�4&H��9�q�ɯ��%��~`u���4�Dj��C��&\��L%�]x����Z.	a�R�˨��=��y����Sa$Ȧ��:"��+%�,�$T�; D	"�Q�SZl	�Kx�Xd=d8�  ���꧙v8�3�������tqf�1����꟏J���xS�q���Q��O{��*S���Z��Zg�&�4�8R��"It`�d�ȅ�6|c�����E��R1�1�6���c���[.�&n��	�S��� <
  �S��1N�-��jG��]K"#+�����9���Ib�c��FD}��F�~�+�(����^}�k�3*̘�I��r�����Yy�mR�;A�!�;s+D�����l���A貰�HP.���؊�T$��i��:�>x�A�����5#gm_��x
�G�1XX��g����$-�&,P1.x�顦8�"W��7��+x�r����8՟�j8��b��L��<��?��/Nx�Dn���)+Z���������,L�`�$Ö�X{��B9�Sgb�k��i�@�z}�X�]����p?焴����~�c ���[Uo�����*b����Z�3X� H����pd��X˯��Ǖ���k��K��ɛ8>g����(ɽ�j(5�dre��y^w�'4t�yKK��('�FЃ}�[�9P�oׇ��fg�Lm�D���d
ȅH;P��Qu��76��T �iQ��ea� )�	lp"�p�.�����&0����n��x~����a�=%���L�T�w�s��L�~��5I�ލ:�I���4�C��)�a��>��o��c�r-��ϫ{u{3�ՄB�p�mq���V��jfҪP>@��s�p���xz��;����uL��g6��}5&Is�z%w��bN2xp�Q����wR��>_��W��I�A�\�'/�4�+	Q`i��E�a��'� ��I'Ry/E _��wؓ�ECD�zI�/O�c�«�]��q��sJ��V�|�)�H��bl6m��`]V��A �0�E����S���@��M,���kl{֚ʧDe�ջ�Ʌ�1���N��xh��[�tr#M�|C���ߧg~�a��!#g��D�C�gB*�%lt�QHm	�/����2;���ױD|ݛ|,�{�1���gĻ�d㩖��'D{��ZFA� b�#�/ � "i��sc4_!�M�]���_�a��$��kU�z;�<\�C�'���3�Ƀ���V SЖ �`b6Pk5�Nq�R�4^%XXI��o�{�^�"&\jvT/�ˏ���V} C-��z7b�}F�o������,���c �Y�HH�0e�RF���W�'w�^��i6L���%�VΎc9"u/���8�UŸ�L�;���e��Tgw�Ҕ	(*žR�j e1VZ�j;�Fh���ߓU{���e�!,��F����i�۽�������}�@S��:�a
�H,!)��:�4���2��G���m�O��2���?�z���<˷����o��2�O�t�����8�'d�.P|훝��6��Ɛ���#��2=\�C�G60ư_mz}�%�+�@,1֙�Q _�}꯭t,(�!��C?1]� �+wm�]ZNH9�i̶ϊ?���~TQ��v�eA ���k{o]`�:#;N`C��� �eU�)�ȅ�(qV�A��)��1�炂Ø� ,��G����ID�BQz�{�HX��Fq� [�)bX�_�a{���`�&��e���y�\e�pRV*?��5���ݚ��L�GsۮYT*�l/o�����x��HG��/C ��W��So�"�����+�f_p%�D#��7ĐR��I/�����K_Ԑ �L�]�!��Aۇ,�I��1�������0:����'ϝ�վ�%���.�g���$=�r��v﹔ԯ���i'N{��1���64������az�{E�䮄I]��K6d��� :1��"�x6%`G�)o�B���͵�7"8�_�����W��C�vrv��B��;.D��o���l,p����"�*�x�7>�Y+K",�+�T-��m�6F�q �U%a��s��e~�b�%�~��:i�7��^o����sm���T��[��=J+!6�D9�;`Hh�M[��
b"��P���|�F��7��4�[���� ���!T1ӓ�v2:�Oy58/���X6�d�,4)�o����ޤ�p�.�O2/���b���RP�#ȉ�WW�>b�H��._�o�)����T��wLpS"��h%�;o0O;&����Sv����,q.�<�T���Tz]�M��ʊî4}u�k{�=�����缒�$�����#ߖ����nx�ߣ�.��Y9�v�.�s�W_ҷ�,ۨ0��b�����p����Pħ/k��(k�p"��3�IR�J�l�K��T��׋�oW�B�l!���k�&��IȢ�M�v�a���`H�$d؁R�V��7��n���О�e�Va!�ZV�34=5�������5*���w�|�jڅ��#���S�c���LB����sV '��q퀡�4�'�pX<��,};���9,��}	�!�@p�
[�0ou�h��������^ӛ���rg<�^ܸ�{m^�܌+��S�����\�´=�zx�w�.�z�K<��
�	�s��(�0����=�B%��c�BQ-(���O�|�Ez�Z)N�z泡�N�؜V2$��w�|*��0�q����v�%o�J"�0l��I8���U�#�'�?��|s�2~=��^�o��(F���t�)L�
�N�q�EO.�����ozڴ��%����q�˃|B ���f�c ��`K4}Q�eZ=��'-2S�����^����oJ�ź�g��S.��:������_���/M�      �   V   x�3�4PЂ@��Ԝ�����ļ҂�����bMΜ��Ĝ���NS� +�(����� 1)�85>1%73���3Ə+F��� 6�      �      x���MϮ9n&�~�+��6]�DR�E�x��$/�h�(w�v*iW5��Ǚ�~^�u�@w�<۰ͷ�֣~�ꫵW�8��?��������O�����O�������w߿~���Ͽ���o�������������_����������}�ݫ~��{���׵���Z�S)뿾)�'��R�,��-�_�W�蜸���w�@X�I���x5��������L���|,�Kg���E �Z_��ZE+���<�a(灜�A��W��<F��
ҭ7Be�>V��u��mp�Q��mp��p|�\�Q[����u-UJ�~܈��3���l��x*�	������%�	�N�QM��;}�	(���G���lj��W�n/�CM��������Q(��K[an�^\)MI������Q�^Z���x���Oc�֩�����/K����X�� f���v�jmQ]�qԏE4|�Y!�y�=��� �F�ڪ/���Z{�;ٹ��y�t]M��*����yWs�W�o}eo�-��^�x���n��LS3YPX��ďK}i+�TKn����j�kUy{Vk'���g>֩��KQ�x'L�@7s���3�D��ڰG��I��X�z�����}�C�}<����^׭���2!�~y�]�"�S�^��Z��<U���Yr��}�t��mۯ��b-8�Z����O�ki��Ǉ�Z߯�v-s/T1�5Ptt�t�7�O��z��D&]�I�>^O�����f*�݊¬y��Օ,���U�b��1ik�ϴ�S��`�,�����L�h�-��s5w�G�|ɸ*]AX�j��W��j�޴�����J���ע�&F���:����)`��V�M����k��(���ibb>V!j�S�q�S<���q5� �T�ۅ{��k��ۊ-���BiZS�^�G:�e�M�qVr˳�1SOC-����J���Cu�h
Ȼ��v%�4����������7Ĵ�X�c���q����f��r,�Su��P�oV�[[4c&�@��G�!8��y�*z��B\Fg�D�I�M˼��,O�N8� h��{楰Y�	=�[ᾚ���ҶB��b���*TZ��I���/翤�MK� ���)[W��	�R��(N�z]Ms���.�ăya��;��2]�L� �E�X�H��;fHi�xN:�v5qH�h������Ėb��&��],,Ź��\�e�\
�%�։|<��pݠ�Ut�}X�{a�n���XAa��z/,����Wa�e�?BS����i,�r-¤��}-�5�*O\�eEVl3�"L
�w,B����B,� �=����.��*$��iѝC�4@\Ds[�++$m�r�55��N=j,g�W�w�_RE�{Ղ�a�<W᥸��UL��J��[ݖ�a�N�v���:��5�g�[�dX��cm뫾b�L�^-P�\�#�JG��	FQ�y�h���z;w�I�bV�N�u��'Z]��Ji�N���o������F^���O���X�2�tIz5Wx�z�|��B>f��*D��@���J�E�����\��h'������Tn���Rn��a��9�r6�$��3��V��?$���,z�A�3ytHEa}�ӱ�ńĽ�·*����%����@i�)���#�^'�Db���$o�'2[�p��7qԜ&�^?��	+ɫ	��sY��n�pt�P����,y�k9wK�H.�
�Ω6���=37�gn&�x7]���x/�M%�Ų �A�/Hg�z�I�����\S����eӭ'�Z߷���A/Sc}d/�"�v�C�~�֛c��1S�E��]zS���ޫXs�ᘷ�< ��N-w��6�(�ڸ�,V�L}� �Ik��>_+n���O�y�z��[J�c+&�^R��O����rSƽ�Z�@b���DU�E�զJ������Dc����i��>�ؘ/y��c��K�N�w��2_m���%h��a�ԕI��F�)m&��|y��ǣ]N������6��s��VX8��v�X��z^���X�H��8�+n�8�!���V��se�Hg̺{)���Oi�ky�|�����Z/?Ϛ�qԏY�U�5�K~��
�VD�IW���P�s%�q�qٙ}^
ˤ��j7i�.�եy����eķE�f��SCS�p��&%��?�J���mP�?����9�����'���d��T�{����s�	����[�"ӊ�;�ȴ�����d�n�oe��Qs����)���y�I�Սbo�!��<xHƢfz���M������ω���S}o�Ċ�]���/K�sݔ�Ͱ��u㮔�����T	�Ӭ��!tW{)���"7�zޑ�ˎ,"�ꇔ��[ŧ�=�:�I��c�F��.��zbo�|G�&�R�3qRh�tZ�s �� ?� p����iZ�p=�L�χ�r����5��/��~A���:ǵ��)8�*�R]�#�3B�̻�M��˼����A����
��:�f�
U�;�|Q��m�Lڙ%�P�I�j뻭��RX����4(���[����=Z킊U�����j)������������������O?����㧟����?��g������'e{Ll� pOh��3=�eghjݼ����'��?�������ӟ���o���?�n���o�������O��'�����?�?�������w�������������������?������������w������E���7��/������w������������?���ߏ���םg�5�������~���־��?f�<���w?��������?��Ͽ���������������?������+����;9ȟ?��gY��'���O��?���O?��?����_}��ϟ>������O�~�����_�����o��/������o>������7���������o��������O�����_�ͧ_Z{������>����w�����v������"������?�v:��?|���O�i���-���v���Բ���1�C�][�|u_�M��G�t��
/u�E�)*P���5`��:㥀mh�V^�8�)o]=��Q�W7��m�^�Kb~�f�t����hc&�I��#��Z]�2�08�^�n�w¡_��o�AAN,��Qx�����$e����y9�-�=�()�n_�Dۉ{�.V��-��	�;m�'y��k�蜎^0���^H�Hf�4�y����<`��g L���;��ts��Nڧ�S˨�<<��f�/��*�:G�ީh��a���1�R�`p+ےX����D�`����h��j�e�R�SA�rmM�v3^�S���+��H�����}ٳ�&H��[�-}��h[��u��`]�EZ��^�t�Q�{1���2/�o`��}']5W���_��y��<�Ky�D���,�c�	�nS�������y����|�K<�`�$68����g-�s��V'��D� I����|�~��Y�CR�����ɝ/K��^�q�8���`�qy�*������K
����ҺB@��SohO&�L��hw���9�g1�/�I�SJ�{*.�n]�L�]�
/���;Q)�7D�s$,��F����.B�����$�^�d.�\��C��=�"����x�_�v�\�8�Ȅ���c�1v{i�C���F����՛��Mm�g:g4�Q1���SU�̒2�,ǣ��~9�X�������rL~z��;�nR䩶�IS~j*�Y83�T�I��`&^ -S+��Te&7���oT ��y�T���pbF�K�}ڝ����z�����ůjq_,�D������+��,�]��	���&��R���`�4L&����oVt��`�!�v�!���Xc$��m�ᠿ,���fd�sEv��|�_��~�g����>Hw���Ϗ��޺��n�3�9gtzL����n�n��s�_o��[���f:j�!b�DZ1��($N��f=.3�8I]���s����׫���o�jm��ɤCJ
�Z;��_�?���}�u�^��l�ͼI��*;�I�����J��TPڵ�/��_��_/����o��1�r��PG[��cn�:�"x�!%�"� �0~�*|�    ��ݷN�K.�7$k��2Ԙ؛M�϶ľ�C��	�.\%�kn������5�^.w�Bd�y��!�ޜ��&O�3��w�Dej�Ћ1��<�o��-�I�+�y��NS�|�Яo��ܯ�����9�:
�n=x���=�UoG��*,�[�mHS8z��=��R	��!on�g?�����~~�����M��u@y��!S��T�/H�2H����k\5vP�K���0R˯��%.�ͩ�=56�)��G����6�뉘�q�=��$K�}��-)���<L�֠3�%h������e�U�B�e��1$�VNO;zh�;��MF�a&"��X0L�ҥ=�^�3���K:�l��n%/]Cm	��C��p�e\w�X��Zb����i(�Q��������*.�!���^:K��Z�v�����������^o�H�s��H`��`�R�׵p�I�{�	�Y�_���v�~i�jReA�Y%�r�z�N:�&3���zu��~y)�ܦui�g�%��D'��!EA���]S�v�Vӏ錰�^Z+��z؞��D�aM��5 f��-��뺜�������h�P�&ͤX0���h$�����vR��g���D̜q�����yu�*���@[�#I4�x7��JU/|�%���hq�Kk�i&-S���Rf"I���0 B�L��3��diOy���q5�jB4T��yb�s������K�L�6��bJ�<����
5��8�*����y��hDw���ǩFm,���܏s�5��`;aAdn�d��a.7A!�n�JA��m��C��y&��ॹL:@鮟����|ݺ�VZ��t-R�1_�
�8|K;1\����FU�yk�n8 �16iު����=~wx�*ոCsS��
�p&2u���	��j�N�{x��f�2��;(b��I��U�a��80e[�ND�X����DP��{��_�
���#zd��2��:��+k�*=9m$�bz��B�K�h]���$��]]\˧t4ҫ!`�%��tX]��Ȕ/oҡ�EM�Ět�$.�����s�̨7�	�gZ���-�ǽ�� {ȿ䋱�c��
U'��S��07SO��e���D�T�^�x-Ú�N�R�z^�uK�z�Q�I?���ti$l\��jҎ�7��M��̓����j
TH��y��y�c���ס�l��GϷ�-�35�;)ݤ�mbb.vz:��b����}CR6��dNܛ.�����f8����a�I,�Ls1�#A���MJ]ݝ!e�D��yĥ�z%��Ҧ��d�y���N��sHihd2��0�V0��b��2TJ��E-_ �D<�F�椨��m%��&.ý�6����!�]�)�$�z3��,��0))��Z�x�U�y��_����Ҵ4�-��D�]/ﱿ/k���ұN%ޘ}�hii�pP:�l��m�K�oO�zT\&��Ğ29�@����t���"�3��.>ǥ��UuR���Hr>�}��j�M%�zO�2�VI��=*l�f(X � ]Q��rf[^x�[�<��+F#�0UU��8��:|���[W�t)�������	8v��:\Z�o�/XnE-���P���}ňco�
��ly��}y��֥C
��)
�
0Z�f臐j��{�VM*�6�ٻ�6�x1L��AW����ˉ9�'sS����̄#;W_��!���2PoƐttbu���R)���^�\�|�o���~�.6���%����v2Wk��d���oh�?�/�߻�?Ņ�uҁp۴��ZǾ�q�y]�!���}&�Z�y�N��M�Ԡ�p(�)��!���%��'�5��-��/	u@�Xw爌�N��� �.0�F$6)0K��ohﺌ�)0��]"�t�낚tV5(�L���.�\~���p5E��$��#��Ξhd�;�PFEm�C�����Zv��\��u(&%%�ز��e`�W��1��N�"C�����|(Ň�t�5�'U����6#�kH��k\/�jN�k�H�<�:�H��Sy)��T*���n�y3̶J�7����� �^�R�)�!.�I��Z�m�+��8*GoMR%0ߞҥ�5��/yz�UM�C_�!��_����䡷ˇ��oKE^Y�q�I��0WQ�n�_��1Ʌqؖ��^�Q{mҢ$1[֖� /��Z�Ր��<$L�vc[��S�[a�B��������x5�t�tM��`���q�h(�e����
#/4/-?�E�#��x�F����^O���v�L�#}%�54�����2,*��1$4����!��F`!=����B��x�-H������~��z5�{i����u��lx<�\�P����VC���W�+�ढB�=A����!��={��{��Ig��_�y�<_9|�J#>�uբZ�?5�L��;;E�C���r�a�m}o�'��2Q* -{]�Bs��H!���	�w�Ƴ��  unjvе���"�D�k�,(��w<y}�ވJG�
�@!�X���5�c�!H*U(���UDz�ӹ�Q�(�Xz�(+׵>Ԏ��R�eҹ;�@�8�Z��\�Z˔�A� �J�gRe4Ro��
x�\l��6wǎ�n�O�ͷ"L�Kk��#�I	gAX���)��ݰ^ò�B�㕲�C�g�	<��v�HB¦�f���6b<����ρ�GV���7����H�T���ϴ��F0��4F}��ٵo���i�|�G��y��S�:�C��r_�k�P0��I��y��פ������4+�u-|�j'���$���Zs����,E����WZ���n����Es�b��2v����~~����vRjZY�]��f��ћoYj��ۣe�vEeH��}���1[������D�ѳ����q�T��OWj�G*����/Uo�����rp��i?� M�"�y��m,dڻ�xCUZ���XAV��{�]cr�6��0��Ւ<��\g˕m�u vk��d��
�T7\�|� �G)��M�	sOĘ��6g��[-x������Z�h۝�FS8�zV~��sUM�����ƻIebr�,������ͨі�I0V�S���0��hZƠ+L�d�z�۲�P0������Sm1��6s��A�*�c�|�6)��"�&�!��{=�P�^���UﱹG���Ĩ�����H�,���Լ�ю�4l��t�uͦ���^���u����ė�ˬ6�?�k��N���u�{���}=eVR��˥t�y�(%��+^-i3.�Mw�IxG��E�eS+2f��ł�����,\v�iJ+a=�_F��!�Jj�$2�)X���RMTzX�I�����M[j.�wX�z'Nʽj��A��p�S��^.�O���%$�#��oD�n�j���`��M�Y��-ZZ#�����;ʰ��L�<x{108T�uVи<P���|�Z�N����"@A5������n���u;̟�H�t��̚�~�:��!.äM'<�
�|b���l+�6ä��H>�5k���!��W�Z�I'li���:�0����i�X�hL|�u�Aʼ��V	>K|�Ը�*��y;pnR�,�	{��=���QH��ȵ�eK|�M+G���L_|Ҥc�Q�
�)��Ď8�g�n�5j7�U�̉�8���
X�u"&m�[2Pf]FO�  g���V��S2Ґ�k�����f��᦬�L�Q�����#&+��ee�f��y7��f�O/����g�����c��eʮ�����y�30��s#�`���x �3���jW\�[딗~�k/��񤀛����,� i�<��ǐ�����zV=��i3P�=�f�#E�b�mu(��u̼��~l5��C�H���|�P�a�(��xi[^о�}f���)�2��5���(�������������z=
 �J��s7$���[ԞNʊ�Ҫ�1Ϭ�^�C����B��4HL,���,���t�&T����� ?Qʸ�X(��yty�=�%NZ��=�.�`Y��YF�7hq�G��rJ7�\�*Sy���sD��#Z�yX|@e8��}��}\w�1���aHOD���]/{tu�<P�B��e�9Sg߻j    �TX����Ht�зCL��xvd��	j�-Sax�B�˖����z`���?�A��ЊpH�QM/���g������Ka�!�hҥ=Gbr��sC������ߣ�Y�M�-Tp��Bź�"L;��ht�O�ڣ]uh�{0�^� ��
ׅ�X��2�biX�B4��m<��˼�מj���zIL�Љ�U������\�{֤�念�$՝�XM|�x�F��
��B�mPeDP�����aFT��t靆6�>zGixPvD����`��Z��':��w��l��,塏�`��R�����a�+�����_�E�c��2[�i��G{f�V5�)��-���5�;F�nR��t3��G'�d�1�K q3��,�ׁ�0Z���%�z]��L'l�����-�&�IC�:�*L:�v�x1d�r�7��l��#q5�6w���,���U�)�N�
� �:���pCW>ŔFQ�!��&���V�Ң9�ݎM_+.�V; �s�N��f��A�2�)�T�v���*�~�J��f�D鹜i�Go�����I�P�*�ɣ&:�tL�U��Ὦ
zAY<�Ԫ�9����x5\��P��&�c6��P߹4*�F���Q�Wt�9�a�����b'JgQ�&�ޅ]<�;���0)Om��^�@ �r P=��iS:��h뉭ڞٽ5,ס��Pe�a��y�3�~x��0)~<Z^F�i�e��F#��Bn;�D�i�S�����x3<���j��͞XY�.S�v)�#�u�d�J�,��]m\��� �o��k�P��p�!0���Z��w�G��-�S��:B��b��6aIcN}�~��!��e��\�m�i��+�56�R�N���D�����
�"��*�!]���2��@��e�|xc*��LT*��������A��u7�S��N/aEg�@W�J=�������j8�TRdx-�؆�w�>	�0DzH��3a�%YZ�'��zf�e�B^��B٣?,�j�~
f����P\
���
�����?y��y�:M #�\��=̻ī��L��WRI����ht�k~h��m�Q�I3�.�z9��L�C��Tf�Ĥ��;g�
̰�:���'����v�����H��艨��i���`��uw�Q���Z�AO�J��IG�ćts��>�Wʥ�M
uϿS�§>UGݲ��������cL})BR;�������1|M��u7�T�a����<S2{˲�3:]&��ݺ�	��]M��[{P�t��+"�犒���~�^?|?/��5�C)����� ^��Z05CN���h��1h��uYRU3�;��eդk��x(*�+^_i]��^��/�@���� ��!��ydp`<'�h�~���9���}�ʄ�u5T*5ƽ2�i�e�9~�~�P��@ž]��Y$]�]wل���l��,C��<�6�8�|H�]ػ(Ɖ�q0���t4�6d�rf�:����+�`u�=z���A�M4���)h��f8�,��Z{��K�iΩ��UTي�
i��l����u���=h׋�8�0�Sf���@�PC����35)Z`��g�*D�夤�0���+��\�o#�Ѩ5�3�	�bQROč~]j�d���+B��Jb����G�^�µ����C�Ē�La3.�r��w� �g�ø��Ec7S�`���5h��U�fL�-��M�����8իd�P��T��^�$�
D�D-��IG�؛� 7#q�`��Jjk�x*�b >Іy����yP��{ЄP��[b�i:+�x?M�ԕz�2� yz�:#�����Te�9���|�[\�	G��*ԥ�[/�I��C����{���
���Vr�!iۍʄş8����I��Rlo�kY�lΕ�����'F�!裭�Q2��G%Xv5V�g'1���V	���L)����V����c&��O�G
�*�2�!���oҸ�ޛni���Tsm�H����<�#��y�@�����b$6��E�2�TgX�I�1����m<�pA�a��RXOc/��e����jZ��i|FO�7��i�|}(l0jO��`�n}���X� ��|��R���D�4��Ĭ��\�3�߽tT尣."m��U�)�V\�V6xs��:������Χ	%4Է������>�~�n�C:s�y�'8J�j	�ͻJ���G ���ÌE�r]��l��Hj� �l�2dl�8��<ֹ���x�3�.��/c�p$PUאF��kZ�����3q�<�c��<'�{�%���9����n��C�^K�d��cn�yo�I�T�&9qHL��Q�z&��Q�6�-��׼̼(��309��j�W�8q�z޴6��ęVꚛ����8��><��Ii�����痩@- jx���������<����'�nC>��U*C@�0o�ե�grH�����z��'*�dۉ'bo�L�ou�a�t3�m�n�Ϥ��Ғ}m���@?�r�C?M�EX�y���)�o�K�M�3�,}��N�C�K��D�bӠ������ ǉ,/�q� �����Ճ����CZei/^�*X��dLrU_������U q2�Ě�q���t!����)��|&������Jii�o>��T7�A���C�n��Szrs/�K�����2Lʠ�3W��%-�!w�1�]�ˣ�7��Ϟ�!?���z=]�S*�y{KeN]��n���!����y�<R��j���k;�L���&9�̷j�G�Z<��C�8.g��a�ȇ�a�Z�3�u3��7����{�E��L��ueԫ1:8Ӽ��4n��	�6M*z��^P�<ƕ{t4MmC���4W����W
�I�.CHj^9��#��W�̷�2`��딮�Eґt��!E������p�:�{���/HY���)�ݩՁ(���S��ޫx�n����>k�^������]��Җqr�ƲSJ�;�Ĕ���O!(��PL�|��R&I��X�P�k=R	�5������nH#c�C��}�z����(B�"P��{�&^�,�R9��U��h��tpU���F�#�y�+Y3y�^OW?5���{7��"��5��^6�f�躜n.lg�{�Q���VF�r��B��wB��+�!�VO��CdrH��j�*j�\�l�z=�6.�y�K��4�YuW�񑰺<P���a��b8��v�x��D���ٯ�V@�IW�X��uF-y͟� ���a�}9[[�3ҥz�O��r:)k*�קqRM������)Qw�V�O��pL�皋�t�~R�����
U%�"�v[s�)�s���Y����� ��r�2�	�2�� M�)��������NjV3����������k'����p�YvJE��G�){��̗�cR u1ֽ(����#cB%�'�B����"�z����CZ�x3��]��ն��+@3���LHJiyEV�u++�qYgv�lz=�4-qK������pRfM�,g�L�!��;�?)�<m�Ay0��{]6�z�&��H]F]����`\gtw�W���������4�V;��\�β�G@ Sո��דz���^�^�
�O�*\9)f���ƊBV1"�z�&�5��sz=�5 1����(��4)+Xn>�By�q��V��yG�%��#,@߈y͆��Vg��)�}��w�M�&�p��dE=��Y}?z-�ק"����l�o`R?�L3m��Ulq���
rGK�H7����z'�ںh���,����\a��>���㹞2�5�X�f`��;�jX���&vf��UH�u���tR�����Pru
���t���%xNM{B=�T�#��U�W�=o�Z>Tl3�|�Ɇ�z���1&�4�-�xN)�6�W8 c'��p����!%�����M�2����ɉ�	P��|��U��\�.�T�>������G�Peb�萮�ho�r�9�1�s�Kr����^����H���k���ӯX>C�
��$ԃ�~ \˰�ZH�2��kbB� y�X �t�̵�@�&y$D��G���pX���I�%�.< @�<��!]    Q�~(cJ3B^�	�9g>�ai]e+�ޥj�:{���!T��X��9O,)$X�����}���.P�3��G���JA��=er1�,O�ҁ7	��RFM��G&�N=)È�)�1Tg�JO�R����Ą�Z�Z�{�<�#�r2��R��g��O����J�[���`b|�s�둘tEq�י�7��3^=�%��C�t�ek�����:bN�A����dpK���@�z�O�]�s�}�8�yz�`�D�Yu��o��guŊ�;(>�S���Zw���L����SI�1Z4)(kE_�!�ҙ�p���ǈ�Ia����J�9{��e�B�|P��5�)�����%bB�
��?�Un�`q&����8�Z�aR ���+�ęE��*M��8�4��e<�G�����>����<7�Q��Œ��]����L����	B񒪹\�Լ��I?Lͳ$ɶT?CSY���NLJcG�<Ȇ��	������k��gH�������5�_���4���_X!]�c=P�e��S�a��eg�UCe��`�-c��p�d�ӻ�35��bHWY�{�T� �Q}:�m��^������(L9��1������S��*����NjGI�A��#��B�l�.���ց��L��m�\��˳U��C�z-J�@���G�%��.(��J/z���t�bU�u��A�����-�l�k����sH��L�����F��v����2�Dt�(BmWä}wH��1#s+��=!tCxi+;`�H䎓ϼU#|��P���V�	a�M��+�'^z셠s$��279�%���M��<�sn/g��)8������]OW]�4b�7G��y��+vݨ'&�W:�۵���cvXA��\���k��Ï6�2f���Z"ߐ�cHrH'lЎ�B3�=�t�|�PS<�B|�W!� �aV:���}$�Z4z8"RwÃ�ކ�UKt�B������]m�0��uY���O<Ӡ�|��([\�I�o}Ȱb+�1s���י8�"b����aϑˈ����U{?����U(����
O����n�ў�A�����l��2��l����ɾ~`z�S:���t�$�́-.����n�i�LV��?�!��2��;	�8&�q�~�ɱxJAX��4�L���` `<��}?�)��X-9�R��w�C�}���iy�N?�!z�v<��Pէ��`b�Q�u&��ӫ��6N�M��y�,�ڵ>�xY��w�6�H�;�5Ŷm
i�2��D �jx����HܚY.9�-経��upr�x�zb�_?�m5�$?V!�:�[a=�U��\�t��=R+܊U�x2o��eI�C:�x$q	R�
�gTB�C:�􂖗�ř&�����ṏh������!E�s��#n�џ?I,����Y�C�]�V��ֽ̫ᒜ�F�ǣD�:��Vp��h�e׭�:_ZÁhZ�$l����xu���x),WC���Qen�8|�Y��r`*M��p�M����W����7k�͐�	$V�c�BF�r5��7�<�#��M��VUi�*Z"��8 �J0��F�A�825�������E�s�� �R/�#Y���Cʓ�	�6����8@�C�)�U=��'v�#� ����3����s�t�UR-��nW��,�����hʲ(0~-�'b�h�j��=�6Y!�.�	��:��ٯ�pϤU]dR�L�@{}�F�vdTg�xAI�fT��z�ǝ�OMLS�8)��h�Z�|��k�������kd��͗F(�'05�BB:�q�1_!�1ķ_I���q�����9��^�剾�yK��æ�k&E+"�u;S��1�C�"�Ј����lx[I�o+e��Ȥ�r;�K:/�7\�d�sWD`�9�ft]�|��mԨ/\kFӆ�)0���^:��9y)J�^���
�c�2�z���J���Yr�3&㰛���0i�g=���Dƴ�3��tq	�m����J�2��@b:��_֡�e8��9uS����Mt-&�)�Ω$�Y�\�铜[f�t��^����D��y�^.����]E}�Hd=x�'��p���"�6�Y5���{��I�;=�,C��8����ay:�b8�6e]���z��<rol�/Kkkz$��Ls�iBb�|��+W��G��z�`�[W�܌C*��cm����<s q,.zio�~N�6l�������)���K*5�sJ⌴�^J�u+�~�%Ӕ��'\������┄��WҔ3eYpi7<��)���'�`bÌgslW���Y��jZf?�t#_0�c�R\�k��-�LJ��ZGF�R������Gbb��Q��U�b���U@�p�t!b?�F�"�!ubgo=�/c�!�����g�;k��	�n8��|�\��f�4߯y��J��N逪�Uژ}?>l8�h�����6Ay�y7�3}��9t�y)��ѳ��fVn���g¼T(~�s��K�}�����O�l��q҃���J�'=���v/���i�3����<w�����q㥍��0MA]�L�oz��Q ���r�g"��K�f>�yj�����"śT���$�r�m����$B�OW�˛����O)�C�I�<�E�uHAi���QIl�.�դ{=n�I�k�&�c�y��\p��;)[X (Y��8�Y�H�qH������-�͗�!��N:6���!���|���ipԟNJUC$鈝��*�;Q����z��Sb;%&U�Q/o�kq�j�h��H�`b�o��j�Rz5�Ҡ%5�w�b��5���DjY�n��\�y;���iכ���<��zg���:�9)�u=��-+x�n��,�wCz���/��t��.9���t�H�X4O�+���-����!���pj�Õ�Qi-���� �8��.2�hל�cN�y)��y�V���"�H5龜3���+*p��K��*]���8���g��N�S�~2�4G
�C�,�Jq���g���k^�W>�z۸_�p3�S]a���z$<n�.��lz&�4�=����\��)���t�7�4T~�Ńs��V�F���<�3��:Z��t�
��X�'�����ӝ�t�O)u�	z_v��4�.T�.����rJ��<�)r�p/�Q�U��R,m�[7�ta�ŤӒ~C�҉|�-Ыõ&]�~'�7I�1���g�ј8!�͢,7�j�b���\:ã
�f�h��4����8]�S:�ƨ�H$�]�)�{}��(&���3�L�!��( ��1���'�M�z��3$8�܇^z�����)��0/ӉaR��"��⼶"o��y�8� ���lj�Ɗ�g�p��\G����S��P��%H�y�@�ȋg�ުL���9_�y;��YϮ�S:4x�;�nQ��4�H�wJ���0�/yh�͓�6������Ŀ,I^T~���1���~�����Ĉ�&�7��Nv=�"�ey���s)ԳI��R�3Xj𔷌��c���Ĥ˼�e��R�������ƫa�.&}/c�~���B�Qwy�剝���7]!�n�1^Q']{0�Y��r�Ӳ����\��Ѫ��3He������GM�_7��Ru-"��$����;�y<ibiC4��^��a���5�U)!��0麟��2K�r�=�w��Cʴ�����#�_��]��E,�3։L��L�����H���UMѳ�cՖV�k��N��y=�z��k;}�8����f�T��q^33C��}]�ti.�vP�*p�3�H����!e�ԣ@Js"n�|���F� % �����y�έEx���pxӠ!��Jc��U�_%���YiU�	K��$��s���8�KS�EC�y9��PV�z�i&�E3;2q#m-y׳�>d�R�f8�DШU�)�@\LӐ��9�R��~����'`]��Q��N��eA�E��h�-��@�b�-�,��̉����PF�b��D{7�X�0�f��:A�Q���T*��+fʻ��c�b��5mw�PcA�&�U��1����
E�ތ&�~�.����/�4\u�ј�ozj�;5�W��@�1�DG���    �X��V��̸&eE�d��-o�Z>TԺr�aS��9�C�2<��W�1.����nU^>׋���'����a��8���'�C���*8��Z5�%Xʜ�z�����I;kݤɤq"^D��`���RD�HM �3;���a��"Q��IR���\pr����o���
� �:0�;�Ѭ�̸
����m�;<;#�hEab�KT�\m�m�#����K��ȷ��d���\?_�W.�5��C�a�g���
����0<)�<�
>�4_G�h���~��ڶ�I��O�E����sA��#��%@��bI��:����r���ݭ�˿h��D�>z�,��π�%��
��� KuJ�x���#�D</)���!��+{�B4i��
��:�ʇ����\D�2<�J�#Lr�Q�kt�qHM-�܊>�-솗���}7���%ֲ��;Yo).��z�Q���A��>Eq3\����;Hfꙸ:Q���W��Ԝ��@{���:�F�K�;g�w2V���g��N)Y&�G�$?�uYr����|[�m�<�9�\D����RV�F�Մ�0�~���E��ØԶ���yG�g���zSo�%���LBX��LQ�(�TI�϶9aD�ϤX�����&u�L���=���?�H�>@C���Wãc�#�����W��t��$o�t�I�<4�v0��y�R�
�>�'].A�2���$.Í�T{�^�Ho"�n8����鴂�����yC]�ˬ����A8[��w�C�b?���w����(�<�М�Y�d�*�� P��>�R�C�D@�v_d桸]��C��vy�q�P^d�W��4��A��3AȰ�t�kFn1t�m�
5��p�˹y�↳���k�_�ePJbf�>�BѼz~��e�=)�=����3)�Z��NWȘ��� �zJQ��d
��ϴj��Yo�_ϖ�&i�}$]x�2/��x�۶Z��*���C�R3ɇ�\a�Ô�=���ʔ��<G�!�tH;k!^z�S�*��a$���0i\ s���Qʮ{��y]0��|e&�S�S�]n�./%l���0(���94����!]~��;��gL�%ը�~'��=nB�"#{yO����Z��z�$���4�Ӥ���^8��ʪ���蹛�ǵ�7u��$�2/��}�Xz>����՘/�ld�m:���4ንM����<�X���,�� ^��y���25E�&���7����M&�Ff��t^��r�̹�h�U<�����G��V�)O�����������m9rю8)��"�)THyp��d[���V�z�<�D�N>� nי��w�8s�Tw��ҥ����N�aȃgm�{o��Ih�;3?�����Zo�WQ��4U�8����Kh�,I��@/�j�O4Ѝc\W`$���c9�;��/m����*3�����TCxtH����@;�yK[��B)��c���樒�)�)�v��Q��;i/;B�뫗�V�J�Ď�C
�����َ�G�9[�'D�)�S��4�&�¢��Qj�i�.���'ߖ8�)+����lӶ���b!�>`�:)Y�s-`���`�E �ξF=j�ި�n��YJ��7��b��!E�\,K��+8�H����K�t�;�b�Cjm��㨚�B�>ayQ2i����&���Kq�8���1E��*���R�ä�ބ��Kb����1�2\W5���t"G�|�R��C�j�W���H�ъ9Cb�.���4��<�T9~����Atz�Ʈ?�L�~ ��z��v"3+O%�o��l:6�R�a\����Y�G;n��(
q�E@Q���P�2n���C��4�ˑ����{J��5�Q_��h�~��T|Ai��:Ԅ�%��dP)�kd�|ϊf�o&�8����
%f����T�r:��i4;��>�^C6�J%�u,*�Q_3���!�H^�' ����,�:��'����s�p�8�奢;�{r������!�g�*�|g""e����_��Q�T��2�VY%�[T4q�kR�`={��b-5�c���� �R-����B"G�8@�ɅxH�<�Z�̮%��<�����Cq�Km���q�� ~���Xħ���*�o�F��B�rH�]Q�QhH,q�#19�[����2]YJba�Hk�q&}���Q����~̸c�l���gT�z��$�����A:�=(/�<��y�1G�⤳�K����p�m���~�Y�w���9,�C��k&E�nVYJ�vybx�����I�`WP�{bs�8�,F|,N�l �'=q�axF7���C:�>Y�; �w$�;wä�fWod��K:��82�S:x��N�l����
�:���M�
?N�DP���ѯď�*�ޏ*Y���4:�ԡ���J�ZU)v�"N췟':�ɞtJ�[�c�ĉ����)��@;4~C�����i�=�
����`&G�2�?hƅ��Z}X�[Il%���(t�2v��c,�g�<Y��]]�bҮ�`|a"��#N=>X��6-��WhO���s 	O�^���Α�Ϥ=�4�'�#�� �1)s��Lp����>A����!��ը�zf�z��
!�?*����B&�gAl#�{)ts�:	�A�*�����m�Ħz>���g L� �"�T<f�}0�K�x��:�9<uH�n�!#2��	z��
�-uM6\�zH,��9:=�ƈ�^^ڊ��B}�G���p���)�h~�
�$ҧ˾��u�1��T�V�Ś)���$�U���R�������sOZ���/�G���O�}��v@��z)�j���$�y*~<$��RC�z,�e��T�J��4Xh��8 �.����v�W��_��]�'��H���������QlzP��;��*o+L���̠Ʌ�k�[q��lIc7`H,����3v�pT��Y��kݕ���d�=�O�T�M�fT�ND"��Zm�]q�m���.otb"g"��藇�\c��!�l�U1;�/��rB�v����Fb�iz׏�_�Z���,k��������K��8s?�����+l��������iV|j�S��<�w��Ө�1Q
�HsA��7tW�ͬLAX��A�Cʦ���26$U;U`J���GÚ�%V��n����P���q�o���SR���]"�˽�GO�e51|c(�p�u��&M@	&��l@g��pY'>-�Tz���8��,�8R�ü0��"J�]��к1DbK·�51u�<���%��Ԛt���:dP�qf�o.��+.��f�pR��ɼ�I�N���pm��
%�9vK�^���浆g!g��[�Q=��I�Z'zN�i��W'�����`�q,��#F�Kd���:��`T+� kR^�M�䆥���)JG�O��yI[�4�@qN:�JN+~[�$�W~�p���x�x��P:k�H��b�굶M:)�;P��h2�稃�tG
�唎�����O����L�'��!]N Y���:�տ��Zgl�5u����K��z"�<������G�e��'�dȗ���v��h������S�=��=a%O��ݳ�^������r��'sH�eю�_m����zL,�
�#̬��Do�u��α.�����z�u� C���b������nm���R\���c�b�|b���/H;�*u��51U�Fۊή{�R�7u2���\µ�n�y��Q�:imA���	-�EO������>�M�U���S����c�pH��Q���:��cq�����;�@E�*#����� �ln=���x$����u�s>'{)`5&�PXSz<T;�:�;��I�)��H���_5��AJ��h��%E���~�h��I�Q5���&��������V<O�F��LZnN~�Ӥ�:�B�:�U!wԔ}5�Q�?Y���a��$����>.G�I����>��e&1�P}ݚ8��P;����KP�y,v��u,&M��$�m�ru�12�ä�����"�M���;X��к)#hE�C�{��k�g,nq���B}3P��c�(�X�    �;��=Lꆿ�g����[j�H��}A:�?m�ʐ���Si~ש�~�a���H����+u��'�2b�눂��V<@q;�!f�c�I�2$�Ƕ(:��~�ti1u��c����^DWZ%���Z�����ܤ��# �J��}i��
mW�v���?W�<c��I'v�)O��"��u��\�ť��M@��'�SR@z���m^J�M7�i��iSs�!7�U4OyK[������k�Ϯ��c�"Z?Ҡ�7U:�d�/q;|�P<'���\+�3��(���Y���t��S�A�D�\�w�Bȥ��-��a��Z�/.v��D���(����R���\��$��[��H)E��N�z]Q'�b9l�ZYqE��p����_�2����~���
5Z�[(�G�6��jR
~��\g̻B?~A:�edV�`j�㩌;���T��t��Pj�(�u����AI�^ɠw�'�_�6�Rlͪ_�j�e�%Ѫ�����Xxkd��������Q&��ԥѥoO�1�5��U7��Q&\��q�̩�Ezmk����b7�ygJ�t�3�

[h�)��u4?�.���C:�����u8tk����l�{�/�)I���n�Z���:�O���:{
�~�el�e��ʄ��{�wҶ�_rm�����0��e_��G�2��C�|�^
uZ��t16J},��@6w��0_P��S�u�m���� �Ћ�[{���=q��'
�cq��-����r
<��bE(ݨ�� ]�t�&�t*)�a�/y�?�B?M�� X�P�L��^R�%�":(7�m�����:v�y.P������-&e�4���;8[K0�p(S�4� `����0c�c�rH�?��e��0S&t�}o)_:ݤ�*�q��M^$�G��ҥ�c�#����T��9Fƥ;�F[m��I�O��	[�_�f�9��0)���
�@>�s��S��OQZaa«��i���. `���	�;*cT���%S|)N6м0Aΐ�D�*���q3�t���6�9�ت�|o��Q���rGU`2l$����%l9^GV'L��3����zm���
o��ع"IJ\�q��S9u+��2{��p=��/ݜ҆J��.�3:�i��,�K�;�tZ!K�f^R+n�R��p�鼎1^�3v�?�J���Ť�t��c��H|�xm͊'��
��$1�l�?��9��E��xbM�w�}w1Ԩ�<d�4M�P[͖���Q������U�6����ڵ�S��k�7�.�#��P���x�R��.���D������
��~��r��C���U88�j)�))�@��6aSƮ��a�ں,4�v��V���`i���0�rޮe�%�7�/��+}�iaQJ�t�]wa�=�^*M%��h�%z˻x�BŨ	��f�	v>&���qc�?�Uk�0�g�7��8
�rN�&�]�r�E՞;��]A'ġ��V�����ܬ�/�ä+0����l�9S���KV
8��7�dlN��_�6e�W��d�xKM:Q� Z�Bq
���`�ڡo���d[��L�J�K�^�ԤXu,p�nY�B���i�B��:ذ&SXs��Xh�e8�eK�K��3W�UG�T��V�?��x�%։�+K(!w�g�ێ)���7�^��3��t2[zrH*?��R��ؾfh���e����0opb��`ŧ��͛�&������1�pH�����Y��C�/����k?L�t�5|���w\+Co�*L�րԞy��V<�k+_��R׬)�&}$<�9j0W]wA�ʃ�y9�m<}���tY{},�\OI���D��KULS��0J��n��M��RV$fX��������϶��RqH�X��|�M��?J��N:��:��t����\�UH���x�����Jf>��u}Or���+�P����Q�x,n��.����"4�z&N|-�e|���R���i*]�4O��I��JN��iP^��t����O�X��,�z,�5��g �� �Q�)�]:�f�����|=��K��H�P��H�W�`_�U��}��/i�
\��>y����{_��Z�0Os�療��u�
U$�3{/Qm���G9�ҽ��PF���-�%'<
p=�aN�E'�ү�Ht��_T1�{��Zls�-��U/����0&pHiL;������[�K���-ښ(���,�i��X�d��5_\a��j���!��fN:Z.�~ߖ˱�z�k�����n���փQ�!��Y�!�Y�,e\��ʰ���ȡ��9�"�N�I[�b?�_�����X�_����L��M&F)�"gL�f�l�I[�C��#�\#���!.YJ핃���������ڠ��藤'��M��cL`��xt�n�!�܉�R2��訸&�G�]��S�t�����ku,����OU�V�\�0�,N:�?MZk��F�C����B�8���M�}�ϺqT�_��{�����U��Vq��6����K
��g��H�Y/m+�ٛ��U
v��Fjp\V�I�!b�D����Sq�b�����26��|,������#�}���oEڠ2'����'��V\;�~p{�{2�jWf�c�s�P�tai�)�!:׸
�7eиd�)�W��+�@��p�����xQM,����l����ެ���ܻ�����p�Kт��LWbm?�*����x+:_��ͫ��c���	p/�X<	;(�t�.c���t�ɋT��sR��*��&���y���ᤳ�c���T����q=Z�6f���J�8z�](���2�&�F�.L��簞�;l��;h���u��L�^�G�{L�z��l�~��J��Y��d9��el)J7�־��'�=YQ1�<��,o,�W%H|+�G��e��ٖ��.�q�c@�;�d���bL�����͡��vT��D������I�
Q9�!�ub@|�X�2��	܃K�(4�{�a��D�8��5�����Xj�����i�K3^�j��uT�WI\�g楠I)��r�7��X�G|��K�N����7�φ/X����W�v=�#�q�5���,mE�D���8%�Io�-�� �-ͽ����c}�.?Y(�Y�Sw��k�-��e� )������n�?"H�|�	�hZ��X���:�(�����G� m�*/�D�0Oq/Z�Wԅլ�TK���&�LV�39�c:}.욉u��;;jk�5)XPu��%16|1���� �m�&�<+;� \�Q}�\�r�n����ԗ�&��^��I;hE��RK���+��X�ߤd�� ����z� �k|�Q�+ӵ(�ʊ���gD�9�k��X��VL!x?�����w������Z:eV�$�ߦ��>ƥ�T�Br��^<S0��"���Ɨys���gV!�ܻ9 �8;^�VgY$T��=�OȖqY8?\k�Bg	3w;|��ǈśa���E0%���YV�ױ���_�]2�����E����@R[9�L�
%�lM~-X��v�DX�&���0�s���j
(�z�U�u�<F�j�'e�	#X�LtĦ�b�u,N��خ�IP3��ø�6b|藍(�5`[6�S�P��d��6xH���]��Kb���]�m��Cڋ�l�^#1���\{\����UYP��%q�w����5�Ó:�a�C[su��#�wr�!�ѴC�W`M<˺�Fqn���j�0��؝��:�g��K�ms���~JR�A\���;X�%�*P��n%����:�]���K4�c��o�R��:��]a�T}�W����rP$������W`G�:�<tfbEBA��b٫(����JТ�XN��B�:�������V��B�83���� ���TL
 ]��GjE�e��2n�ô+���J]Ǿ�+h��:LJLV�0��X�`�ÛV��R�Tݏ)���t�������T@_A�+��<� ��t]ϳ��e��J"*1!�GW|�?�����Wˉj����u*����n,g�9s3<&B�W��it�M�v���p\��0ρ�S�ڻ?�.�;>�s,����5�y�x�|T1xƇP��Q0�hrj=��!�!� c�2Q�ؗ   '��5ءDM{/�z^�T�F�R1-����|(~j���qJ�n��W����|��.��4}��Z0g����?�Dg?�ͰTp).�<K/r���A�TJL&,�&�����#��KG!�J=8�C�-�� ��:�׸�4�T�3�s��6q\z�:��
�(<��؜V���aԤ���P*P�����u\��e�9`������*�^��I+���M_�jj��]�D�ܤպ����3c��ǲQ�:)T�zM۫����z���	9}
q�#�^��9���������^}&f��w5�Y<7�`�/�����{]J%�~R�7M��4���YU�8�^޹JG1.X�uC2��e��|�T���Y��
_|�@�{J��I�X���أ@)��ٓ�Y�
q�
^R��09��C(�v&$�iY�v���0O�0��m�yS��%{��m�����C�4�:�U��H���~����;�@dyJy���2�P2��=(&�Q7�bH ˕�+�]g�k;0(6�O3V^� �����pB��	��j��zK�yk�:\���<x�����'��)��|@�9Uw���O��C�
i�^.���l������:�t��CP)��W���`ҕr1)��._m鰚�<��@�N)w-7ayZ�����f�Z`r:�h�~�2'x�1X71�"wJY>N(�F�� ���j���{�(�>=��AyÑ��vR�xG��P!�Q�y�M)ȗ�t��'��)���,V�b^�Z���!�$[=�+����5K�c�d�z�RG5OR�u;J�Uo̡{�
�wG��&L�@9��^8:�&E��56x�t>'.ñ�q�4�I�C�1�1/1X=�z�@1��A�ر�����K\��0�����AX�c��T���a�pKv4�c�k�����L�2�`����N�A'_��)m��z'/!`��a.f)���6�^��#�n��X
tR�tt�	C� /#o��zV{���g��Y aKT�� �*g��RS��替����� 5�zL      �      x������ � �      �   �  x��Sˎ�0<g��9���d��ap�KH+��IOb6q��!|=mg_ڽpɝ�����<�e^�V�,@��<�Z4��n��Rf��[�Mȭ�cAI���P��R˹�\Ҷ�}j�y�G���g�S"uP�(K)�����	������-��>�z�xG6@��k��~�UB��C����{L���٪B(�T*R~t`�0R�s���eP�t@g��"�I���ž����/l���7������T���C}H�	�]}�]]��r�Xe�yq(+!Y5�f���:��y�A�?'�A� ˠk��Y친��<P�*�W5�G؏�Oz���Ȯˤ�	kO���m���2��#V�ۖ˾[<mt�=�ڃ*y}�KQ�:�<�M���}�:&��SIE,�c��Pd3�֌	}��*������}�1[*%�67W+/�����ޙ��uM�.l���8�y&�q�I;C��y��)�kQTMU4[���E'���?<�(m?�8���r�I����-�q��4L�.�6��wď��>���1&<�/	+�g�(�.�\����PR�"��ʰ��9��a���Nx��8�=-!�-�
����ǭ����c��O���~�$N�u�ꢎ�خS���m���Õ�G���]wK���1�v�q��C�U���#K��ʽLQ�������~s�h8o�a��.����?x=�:      �   $  x�}XM�۸=k~ʗ\b���쬓)gו�ny/�P�5ʡ(ٞ_�F���c�.ˏ@����k.ԒÒ�y. �����/�^����f�,ē�B.A,A2�q��qɵ��鸐�/�Hk0.r!r%2�8(����|Y(�&�5a)�>�dJ;�d�~.`4�	��m<�\I�a!��q��ϥ�53�֞p�@�����`s�3�<�qA�@�[������yf��N���ʅ4jjMܟg �m7��@�2㥰�(�0?BbC*�N{�V��K�`�/ߢm�Mf��_��S��p+�x�S���X��^��-��oꢺ�&�O	��|}-���N�^^\.y2.��D�?�+��\Z�0GE��gYU�޳
�hX]*v��_"���"�>����	QϹϔ���i�ay�?U� �2$^����xC���g���!�L,�_����T�zNW�C�]^�@Z�L�@/
��g��:���*�?��`�%���bA�&�p�bW&������Lծ<����~+��̈4��%�?eqb�7�|�W����:>ڣ�ℹG� Ǫ�tؗ�X7�e�k�)^˪)N�������աڱAH�KSV�2@�y��ʎ�Sĵ�W產f' �K�Ts)���9�%�L����'�.]��y�@*#���98�.Rk
r	-T�@���i-H�ri3���$)�&��p�;�O/���H�k�D,�����V�v����Cj������).�������s}� ����gzN	���|*�Gތ�����n��ط�>�xl3T�����z��)��)��ԕ�<
D�9K|D���8���<�j����i�����.=�^�_�.6�æ��kY�C�B씹t��Rj�睔��f�N	n($C�z8�9�ʗ�KBʙͅ��;�.!Ռ^����񊺰=���l{�I��
[�氦oWe��,�s:�o��e������bUV��|B�a;��:��i�*���S��w�g�-kT!қ���ma���34FRR�s��J� ���v.�*�㠃��0������c��B���ʅ��Ӝ�[!����%��2�C�޹tq���'�ń3��6V�{&�ޣ}8A�V+6�����q��Ʉ�K�y�(׌c�8�.�z�{0�TP�Mf�W��u�-s` rN��)4�Q��c��j�FM[��3@�<I1Xv}� >��V�6��ͥ�z��r�_ɪ��e5P�V�4 ���0���V
b#���) �+��U��0��Pj;�?��%:�nB{6�X;���mO>��l_g����'���GnE�ۿ����8TcN�S��1l�*��Ǆ���U$d�&B:H���Cz86�	��4r(��}���r�#�o���:�v����n�4oo��0`�v�Rh������H\�Q�Q<1��N����3��s�������Ñ��G�� �ug �G 32���l;��b<)&�B���l�=������sB�����̨�q��Dg���#���h�X�:#��!O(��K�6p�W�v!AFax>l���-f��bi>���TEs�S>6��oo��5�QZ"2�t��|E��ðB0A89J��<�ɴ��Aev�/t�0������CJz{����s���?��z�?�
vHOӻw�3Y�xVVŊ���d����yK�g��a(�*1T�2�ƅz�P1����'O�2TNp^��P�dcw%�1�Cy)zB�����E�<�T�Z�w���zT1��i�k�ܞ"֏�,�1�BOY�����9M���s@�Ε(�޵��ж����4q({FGyN���.��x,���@�'�8��9�?CO�,�H:;#���&�L�s���Z1O:-�����t%���`���.�RfR�P��3&���}�?)��_��[�@?>.��3vׇ̨�F��l�ʝDv��$���K܂��*N�!��?��V�G�(�Ҫe�:<D���ǄY
�OZ�<w�w��9�>��+o}:�7;˨�K �6��Q��"ٹ9[�����Vwn헋��.�݃����������;      �   �  x�}V�n�T}n��0OU����[�Q	xA�E ^\Ǎ�I��q2m���X�8MW �V���Ͼ�����KV7�7�q.)'�9e$ѵ�W�ĵ�W投Yh�#\{#� ����$;�\��_�M_�4� �H�s6Y cǈ�W����< D�Z(�O8gh�If�/}��v�03�{K�MD[5m%6Ŧ�!���y���icl��[',j���rBzάw���H�!�ʵˈɓAj)�Ts���d�x5��SŜz�4�V�2�T8A�d@�j�4!�(��'5�j@���q��+�i��/���U��	�k�.v�A'.�Ш�f�	�3��F�#\y7��Kd�yR�Gf�e6�#�}�_:��p��fsC�,�K!�"U��?�y
��Pֹr�R6�|R���Z�S�uFgVJ�&����0�2#}����(��j���:�	T/�Ѵb���SWFqH�^�hvb�+��Jt���}�^w��v%�}����I
~£)���5>u�(�V�š����˯��O||~����o�űX�%м�`��O�����#ɜF�ă�u��)�E��]�
Pٞ�$}�!��)�6��j7$p�w��XAPY������>��C�{10Դ<�q�8C*m8L5�)�':���(*c�&\�Q�H3��?B��I��ny�j��=@6�2�it�~vrj3EF$cA6�2-��J�������U]���FdҬ�<ׂ�t�a��m���W<=�0^X!��S��p�h�#VO��`��A:��T���C�P��q����p�Ii�7�����a0�8�0+o6�Fa��~1$/�,#[�#��I,��8���Fx��M�50{B�Z�y�-�ܷ	��d}Vr�����g��qeS%w�a�^k�얕�N~(Ň�o�C.R��������f�h J��O�X�5tS�8��Ųjŏ�~���1Y7Q��U�� XR�Lظcr<w�_H�`^�t�NMů�~���.ڲZw��/��0�/Q\�������%s+�Ͷ��Ɔ�,;d߉m7CW�Ī����D���JT��nW!��}�nV�}����P�K�Vl�s\K��^����� X�f�7^+�Ow#@"�M]P!27�xG`�.M���u˦|:������Y��������.f(�v�,�>�Ű�1���~�W�>�Z�j�g�P����@�����W�X,�\�D�      �   �  x��Wێ�F}�������_,�b�q;l �%�DJrBR�����>��?��M](�ءG#�U��U�N�vV'�r�����3J3NSŬf��ɻꯢ���L��KT"�R3�Ep/�a&�,.����{ƒ��nW�E3cL=���}���c�alΌm&x�h�c��7��e1����a���A	s���)�N2|>�����US���#}K����U��Wu�&|$+?o;�D;�g�rY�1����q٫���e^�F1O}�H�����\%?$v�lq��L��ZɄ������=��[V�Q|�Q�RJ#uL�z�SԊ��-��"|�I�Rv�����n����v�Y��W����%��ٱj�}\�e��26&���n;�u�n|6D�ܙ�Q��vR�-k�?�w�#Y{#�"�L�T8al��ʓ�W��3�"�ɧ�/Jr�wyC
��:G}7u{����w��! ���3�QLfʤN)��A��v��z��V��Z���|�|��u�\:�42N���� <���
o7_��ݗ��frbn��\(��1��y�����u��^L��n�K��GD��˾L��'zș�Ԇ�Iɭ��#��}p���}|Ưz����~->�� ӌ���d<���$��%��w�xV./R�t&mj��.V�fK^�{�Mߖ�s�{�z ���+�\(�m����򾯰p0 �j^�~N^oCc���M��7 ����w�s ����9h&h�Ҍ��	@�.�j|G>W_���w3����<}wX�NxK�\���ܿz�|lېT�f���>�e̦Tr6�`��P �gZ<5�6B8*Gc~4����O�N#�?6Y�"&Pk����5Bq�Fp}`�P8�=5���ʌ���1V�� _�
:���O늧���� ظ.?�ˎК��Rp1d��'�0d�=��:J��`3r�Mn��<y�߷�:z�績�T�PT�M�%�ż���	����
l��.Z�޷w�'s_W~�IՐWmq��Y�������bC]5T�ր��T͊����������Γe�g�o�|��ö�-�_�6ϱ�d�E�4�@��P���+tY{ߐ۶C/W�C
�ǸA�Y��* {������K~	��1N�̉gN&�k�),@�.����Ǿ�|m���EU$?�����o�"[�����V>�+���8�A�t�}��}V-L0�y	�C��moq�uayXM���&��@0A����i�Ln�`-)�Q��� 9�։������� _4������[�δ�����Q�iv"�e>��ݘ�gE?� ��plƵ0��I%S���L�u�-��9k���h�c���(d�Sm'�J�f�8�`���b���ţ��b��ey��R�b?��*o�W՜�b�D��D�@P�:1R_�AQ�Fkw��4�(;r����}��st��ϋ�C<�	21@hc~vn��}����Yy�����q��1J�������L�x �:!�(^��Qߣ��$�8х��iK�^L7��v�'��2_���^<_%�Pr���bA.��OcU�Z����7R^�R	xTlj�lԥ���8�rjy)��m���;'�UaA-���c�0TP��ؤ}T-s��E��$
=�;d�oZ�r>Tm3
K~��m?~�v��[tl�	&1G���]E��L���H��A��Y������|������w� ��o��5���n���C-�	�T0p��r�<�XI�������i��yh��+/9�]���z����6��T�<�ױ!����P�V%��ܯ�u�2b�	S��0�g1��w�mO�.�0��$��2?f�?�h�C�O�B����O�����!Õ�2b�fH�_��nU�OY��MYd]���/�eٯ�]�E Jp��S�B��o$�+�h����%��X.$9.Z�S���ڦJ8��^��k#B�I�8�h�)
V�gu��}�c��ɏ�bs���$�A��S�ea�I�"\/�RʹVv���
�`�lΒl�B��v�!��{$w~��2_�0Ǎn�^���$�Ve����EY"��D�$X��^P��w.*��b�«����r���sʉ��Wi�fp��_�^�V{k^a�;���G�u�E��u��T�\/G|c's��p30������ PJ�"l���MԄNAW���b��|����G��_��l�D�3%      �   ?  x���Kr$)���S�~B�<�lx$�?�i��텲"^�e>�GOL@ ���!z@�@$R����s�^��Ps�a����k��喴�*�xt��}H:�:[���#/HgCE-Esvs:HC>�C	�>4 ��=�R1!s%௜r`�XkAust�9ǔ v`����#ʬg����G�H)�T���')����"l
�i���',Y���A|$Ӎ�pڜ"5Q
9���fo�y��'(�g�w�@L�rs<ҿő15���y���a�5aٜ�K��r�H7鋎��0t֩'L�)o�#)fbUt��1�+'Tbɹ��?����>"�qPg �����+��O>X�d���c�椀��P������.���u��M;b5;�͐���d��_�쭬4��� Kh�tkrN���������^�x�p�?�,�� �T�b˭I.h��,��BV0�^�$`~�~.N�h�	2]��\e.�l2Si����l�Ӏ�����h�u�v�skV��F�s$�2Es}�c}���O�ts�8�/���D"�p�O�~Ux����ŭ�����\ֿkYM]�~��`%tߏǘ8A�Z�?���X��_]��Bnaj��Mz]=�܄�T�Aܜ����r��mOP��I*Ta7�=���*���8xV�>9e׃����\��U��^��<{B���֍�#��k��Ʃ ��nuǁ��)���c��j�;N5�O���iu�x��!P�B�M������c�w��JW�����R	�Z�m~HY6r���w�a�������1�<� ��!�����l��<͚�_���s������o��}��Hw[�+O=�ͳ~J������2�u{�7^��n)�R�A���l���Ԙ���K�G׃�1b��օjSȕ>J��y�P�r����q�9�)��׹�׳g*CQ�Ո�ޣ����9��l�����ĵ6���J�����͡}?hk�D륅����m�˹�S�fke���L���)�^�AI7�u?��ᗉ�9��F�I��<��tK��j=��p��� ����G�Y�������x��o��p��0Ϯ��\��d��ǔ?ہ��*��)߻��r�q��	��g�tw8�n��N[ėy�ZB7=-0G>�TJ�|x5�+�)W�o�c�pt����u��]B���ɱ��@����ơ��k)�yo�E$ߩ3��#�m���7���$\��E�rj,6Q�_6�-0�ey�I�(�nw<��;�ds-��ȟ�Pe�!�"�ʽ��t�:�����'����5�<
���������
0�~�]V�+;�j��m��$��p�?0L���I�c����������      �      x��]ɒ#Gr=_�4tP!'��Lfc\�G�ZӤ�6F3Z&2d!T#��N��t�7�[���D�Q�@���U��&���x�<��Lr�F�0>�t�d��%�ED�����}S���h�iߏf�F�TMfd2��N��rRۊO��&��	k���^Ps)�%��Q���p?]l���~�f���Ū[7E���~6�ۯV���1 ��SBAu��L"�tbD�LLS���\r�F?7��b
b/����4�i�&�C;�(����L�8���4��QS31vVOZQI�4Vϸ��:��Kj/�.�an��/��j�U���_��wn�v�!��M5fD<�QQPy��%U�b�Z��o���l.���`��=l��~��n�k�&`vӶ�`��dZK1T�I�0:�d���Paf�hL5?����KX?4e���VCw�����觟~z&��M�^rZJk�ts��������Ad�2x�I�Z6`��D7���Ӗ��������0`9MI4#�m��������&�9�@;u�$�%եJK��L�ѳ��2�RPu)�P�0LKg�_m6u����M�[��aX�O���EIቹ�a����>߬V�u7�v�f]����f�,X��S#0��'4�IF�艩���YC4ig��LHEk��Z���R�3+�V_.��������m��i�)ڙ�Lj��Rؒ)řt����v�E;L�eXBak5e�L*�L���5�l�����&Ba��%�ר�%�%[��
�n:8�`��sl��$���d��?��ѧ��t���hH0�RtQ ��}�h�%T2Z�����6@1�`�8Z����iz�ݸ�&-,����d���DiaZT�6+��eĥpH
ި��fq?�z��_7m�o�8��[��[��PL��lv���t�Y7�����-�O���J�ӕ�����JcàW��'�����т�KI0�C�u�����,��O��������@���խ�	N�D�MjV�Ț2R���P8�3:왔���6�����nh�6���͹:���Ȱ\�ԒY��؟�XU��qt{�j�&��5m�)lR�ؖ4�4�	/N@�ٚ�Prf�"�w�m�?��C����n9�Ϗ�hw�}�k�mq+��t^���.#��?����fr�L����h��+!a�ک ��LZ�'&�2��+���J�������b651�aj%7:��vs�.w�D��զh�U�٦��l�԰w#Z�ZL�fbem�8$d'U�zV3ΘB��O�f��]�M,�a>a
��?$��-����ظD�.v��o���o���	�gA�XnVu�� '�o�<��VM3m� w�HP�{X%ݘ�n���>�_og}�~h�ſ}�u����6A��+dF3�}��!vt��]Ǚ�b�N멪a�m3���B�@{��1��39�1�"*�uH��%5���B���|?	5gR"S�(1�3�	�O�����*�n���f����Oח�f�`��Dw6�`�լfSb���� Gӄ�Ha�@�wI�kS��i�.���aI�; u
��rÕ����@e���z7���|[�����T������Qep�?]w���gO���a^�)�o�)�ߚ2}�Z��q�N�D���\�vSw}[|(�#9<w�#rH(&�K� ���)�B>��b���cPR��uΦ[�t�~���Z��@$�w�X��4���kU;���Nx�b��0(����ɒ���2YE�����(;�L)N���%�w��?� d%*fGkF��,���~��ף?�� Uo�����-<�1���(���B	OqǴ`��'����[�O�#0 VOkfp�,��zRC�s�*x �xՎ���r̥<$+��¤d%��+�+
,
@�#'�P�B%P��а@��������)�r%(��s��d$&�]�I��)M�"~ZUճ=�_:�N0�42�>T��#3��UϚL�Ǯ��(X:#@��Q������!c�o�. ���n���]�ë���_��b�T�J]@�1o�muQ���>�'<�Mi=I^Jb��7�럢��~�i<.sQJc�#���¢bX��	1�v��g*�����@�f��>�E�I�*��:Ҽ��Ay~��p���!r�YX�����C<��	������[�!.0����^�i4?wt��\eO�H�l��/Y��^�C�r�yrUB/�B~B-�󞟴�X��&����S:6��1���y�z���tl��'P;e�o���S	 �;���J� '	�������~�o�-ځ����Q �# ��~�~��Q�E X
`��
��kϏ�'���` ��@d���%�8$�	������b/����T	 �FZj��टw^�\�
�Sh(5_g�S�a��3��
��z9�E�O�d|�Ӕa���G[��b�`�RԾ�L ���z���JJQ^��N ����r�2�lR <��<N��~, 	���P�E��m�����=�%��B�5�ac)-�0�>3*xG��h9����ג��c((����`)��&���~���A�bˈ�Ae�E D�5./��P�23�	 s�L"�51s-�I����t`�h�-���*c|���6b�� @�<[C��iIN�_��/���� ��%P;nn�
;�u��u��[K-<�{�6�Ч8��o�8��Èk�r�-��o�瑝�ǫ��B�9����I�wf�z<˘+[G$^��T0��]�������U=%�Ί�{6/���FD+[ܷ����,��G�3�s�RI��p"�ܙB�PI������Ng=_a�z�8�2)�w;�R�J�uԅJӧ��/Z��Y��Č��U��k���(�o�@��������E�m���@���g;�M����ğ��؆��-�5ŘQ;6K�f�����c���tl��E���5����^ؑT�~�3��AU�S@��7w��
wТ-��K�^�Ǵ!����7�U��ï�v=T�v]�џ 8E�.�b],ݭ�Ϻ�t���kTj��][|����v[�6�m��tQ���\,N��a<�P�����ԍo-}
7��0w���f$΄��z߽F����B��ᱜ�L�\��f[|���3��L����Y�_|V�Wu�]�l�>[<�c�!�F1C��U�$W�rg��;����QrRRK�Z��p�����dLyLB,&&J�"���E����q�Y��GU`�����~���f{��4�H
���F�����>/�ˈ����kO���h���q֝��6���`�Ríۏo�v��2g�i�+?.��*n��������������a:�Xy`�/�'.������ŋ���i�9��Z�Rn<	�pRl�ә�r.�WD�"�L2�/y�e[O�Ћ�xNk�.s'li��p���o7���b.��8��Y�Q*ZϦ�5�p^̅sZ ��u
��>�M��t����Ɗ���@YL|� �,ٗ����q`�����X/KŴ<̰��a���;?�p�7��v�`<�������y1�i�%�p�K�~9���Jv���b.��8��QzI%�}�#_hg��a-�����h���3d�)c����w��{8/��9��b�Z�=�R�J���ս��b.������Ȭ�����2l���y�L�r�������>@� ꒀ�sk��x09���
&��l�C-���p`�)���j!���b.��8��ilIiΙ��U}�~�Ἐ� N��Q[b��mN�޴!<9���� �ĩ����5W�z���n��j\���%��nC�"� �ـNm�xj������?r��K�+��\<�p�r�4�S�c��l�[�Ἐ� .�>�w�F�nհ����b.���t���8g�&r�����y1�i��HC0��q��G���<�3�����!�3w� E_l*�U�6ئ�M� ���1Zrc�Igp��5�ם���pi&பƖb�����x1�@-@K��1qZYJ;������� � .M���(��^lE��^̅sZ ������F����uhr�s�� ;  �t9�cZ�s�_�պ��E��H�Y��X��Ƹ�8^��U�u5]����'�_�*��5���fs���b�B9-�;����B�ȅ��n�΋�
� �$
,w5��32�^��ͼ��¨5V�$*G�eq��,t�܋��� �$j�93$��ҍ�3r6�qj���D�,�oz�Y}ߊ�&����� 1����Hi�R�[����hs���qJd#J[��=�2�L^̅sZ ��)��]u
�(>���	���y���م;F��2�b�_rv7Ʃb��hJ�A,
�|[m`�s��X�՘h��E���͗�Ћ�xN�N�S���`�$���n�yz1� .M3¸���F��=ǜ^̅sZ �z���s;���bΉ��j�u�^���&.��>X�c�5�wR4o��������r(�aW��z��v;z����f�s*E��g�����ge˧W���1\��E��E_��Ų�/�a?���y4fl���V����<� g.�6���I���O����ۛ�ue�<zw"ſ�^����zJ~�^̝��+y��NAɵ�J��zu7x0/�9- K�x:!@%��q5�z=�Kx9�L85�M�l��ǡ����6 z1�â��l#�˴�F�zةy����]̡���OR��P��xVͰ�ڋ�pN���p0;B����B�w�Q����� .�{��7ؒ�q~�n�΋�pN�R�>�(�D�x�jB�ȋً�Zc�S˔
�45TG�7��:�\/f�
j\j� ��@��]ч��N�渠X)��D�D��"/�ښ����W� �"�����.T`^�.P�Ҡ	pP)Q3.��&�l��]���P����ԖG5�J��mB̉�0����⢴��_^.��	��8�r�K�LwM�m9Ы�9E�Ӑ௄hSD�d����,Px/f;;j��q���A��%�5�hG��i�}���B_?<���� Z �N���&L�=������ȩ"�D|�Rr�:��PB<���Q�i�3����Q�d
�.Ph5�x8u
�]UJT=T� ���� .0x�C�mJ�#��������S�4��d��%�Q��M(1����pit�k�������ն����Cc�+�F�:���� ~�mnB��bv�� �$�`]���/��It1����ꨩ?�G*���4����b]�5��̥��됊��]���|S���1�_�$�X�u
��"?�w�!�C^̮�P�N���&�-"^-�:αml��4���%��4Qk�I�ugJ�)e��R��>�-��*n���}j=/f��Q�R��oXH�Gq����R��.��mU(=��p���숉Z �z~=�P2�Lj���� 1u<��B�w9�T�B��젉Z �z����+����8/��9-�K3:w���R&����*x��g�Z ��s��ʰ���L�u�/��שb[��F��_��*��4���Qk�i[2�RJIc8��~&��`N���߾�J��������?j\^�b6�O��gs-n��bv�D-�KËp��!��8����>\H�b��������mu�u��-	�$/fw�P��؂w�5����4�Ꭲ�� .�-��
�.��q�zsͶ�/����j\[��ۢ�R6>��(%BG܋�h�hih4��"xw��?^��b6�D-�;�+�RqK��;Y/�ov;1�f7j�5;�+��Y�����!dY/fGM�����
ke�H����CB);�`��W���&R�
o`^�n�����>�J���{6��y1�LP�N�tU���`���m�9����Ɣ�ù�y�>9E(��5q�u��o���Ө5���E�H���4��oK|�M߷m{�1�rKy�B|x��¬��,W?�z�/�u�.Z��u�Y�_A��U4��J�.k�
�?�l�O�>�!wl��/������O�mW�/�;���E���.����}���j���o�|�Y��-�(@Vd���cj�9�����`*>�PP�S�b6�A���o+94�1`���#&�ײ�ދٗ	P�X
�Ϩ,��(쬪^?�	rvsީ���R���TRJ#׼ӻu`�^�����/�!e�.��n΋ٝ:Ԃ�ã�C��ɀ��11�L��A/fS'Ԃ�'���V�s&NQ��y�:/f_�C��V�o�X��M�mՄ������P�X']���6e�y�+�	Iы٧~�56�+�D�܋\�?���>�a����Q�%�������r?��ߋ����ן����Ż�-޴�m�v�w� �7�P�?rY���m�nY�Z��p��Il7}��9?�0��E�w���a�U������:�`c+i<�����"u��(�zE_eE�8z��.�/�۸}q��?����}���VE���4�B�Q��U���ʾƄ���Gp_���Q�ޗ�[��r�/WW??�5g}��MU��Fve��%\��zϟ��w�ǆ>�B��/�V���&�"�f7�������qZ �����EkL��؇i/f'Y�O=�p�s_'��������|A)���7N"ّ���9P��ĝ7]���o����$pbZ�%e�����~(��{/�h��t �>>���*\h�b����Rr�]���R�`_���m�*����'`���XM��V����	�Rؓ5��珳�MXr/f�/j�L���!T��ü��΋�WQ�T
�p���q3]���z��<�h:Es��֪��˿���pb��\8�5�����l���      �   �  x��W[r�H�n����h����T*6U!NlW��y̤�4HXH�P�Z�s�0���
;F������F}8}����S.z��8�̆J��f�U�7JQ\U�2<9Y���>��z��8_���j�\�x����T���7H��]�q�&>şk�6J+���t���(��Ͽ�����(���}�I��q��/*���|�o�,�vOP�!��4D*N��N��,�g� b@f��W��j^�����Y�4��*��j����z\oޯ`������澇+:���Q�\F�lG@rRM8�\��}D�I����w��2b�����,����fa�g�<��s�q��
ё����>��ۿ�D��*�������8J��}�'��~��)��	DGĝ�(ˢ�G?�@~��z\`�C�Bሲ�ӢԦÝ@��tT����恡;a!c��)'�m�|��iP�u\� ֏��Ld(QB)�Z ��d�'ID�b���̠�,C��@��AT%�J���m�5 �q3a�r��҆B�Ԭ]XQ�ȟ��.^���fy�L^�/XV���7�L�e���K�d���ctFt�P�ZН͂böb�s?G��|���!����̙��7@�Y`�E`f���8g�N>�q�$�h��4�f�>�G脹�jJ[s.�O��l4�7���b�c?�����u�&_}�EdQ��F4�3�a���Ԟ�!5�Q)�3i!�@��A�9Į.�p�iߔcJ�\�X���?�iT��n�OÐ^j!�C�S�J��ƭ��?�[�8j��d���I��aD�<
���oj�����������%��
9��ū��o�������f��$�]Q��%�B��bG�W�,F�q<��X��̅L�L�����sF*��I�z|����B7���L�}9.�e���v6P��%��� 0j o����ڟ;�_��ݯ��؎8p�A�R���ϋ֍���]�E�8�P6d`b`@�u��O��������L�; ���pB5���n�Y\�!l=�<^D���;�+�vsG���?��BY�p"N �J�e��J5[r
�L$uD+K;��R��1�=`}x��0�)TRNgb��hC��;���{H
s,mZN�2;�
��!`wX�+I3�@l� �0o�)h�!\vWwqu���CI�9l��P��p�4?�X�m`8EAb����L��v�.��J7U�3u�	%�vڮr	�T����L�i54NN�6>E�L��E�$�� �ֵk      
      x������ � �            x������ � �      �   �  x�}V�n��}���?�Ծ<�m�62�y�H����jQ�Mڭn����
� ӂ(A�a��,4��`{P>��%�*�4�ű+��P�p���߯���_|�)&��mR��*ߌV��S��`=�J9^�����U��;�%���I9���eE�:%]SƓS�r�oO��;�Xkl��R�FyD�V� �uq�3's��{�r�Y���֚����W�t��&E���xN��m6)+4�pJ�x�-!H�"�)\q{�Ǘ�ט8%-�e]0��T�UH��R[&MW\��=�櫑f�*�I�R	�)�zs�ɭ���an�q仡�*��w�Ș��[�X�/���!�.K�&(i��RkTZ��7X0_a��Ky��N3�+I�ʾ��;L�T����@{������u�y��8m��v���O�4�z��r��e��iSq˿�����9����������Gٞ6���8���v���|�.7]��.+&9���Xg���]��c���do��n����B��҅I���U��2Pn9�z����)qXE��'�I���TY���$�bI\>=���c�Δ�  ^T��/Sl�js޻����Y�Y�dX�`d���ʄ�rp�����<�M���<�E���Z�����9o�O�����Sj��a�ASy�Sw��kl�o�a� �w�8�
�v�5��`|줲!��1@�RL!ߨ���+{gL��Lt-�Ij����r����c7�,������r]��J��r��c>��w��~���tz��e>�	tz��·����$N�
�����,˩4��E�![G2�Χ��T�
/F�X�b,�.���D=��R�����sJb-���<NP�0s�b��E�U?ƺ;.�R"�b5/LM*S�^;k�M�Rh�M�������u�03ސ��I�}�u;�<�Y�It��_���tfz�y����e6��
�C'X# ��6Tl(��?����J���jdN�EUMELy¡E?|�W��؆V�l��G�Y����,.{~��g�SB65x�^r���{��>�l@�N�]�e����]���Í(�B�Q%�/%�V��Ou�gW�:�3tD8(�� �vn��j��!B[]Ti������(��\4L��ۇ�q�_��'F�.-�1��,Uh��\�����n<�U��@�N��U��������U�:T�E'EVP]���K%v�@E�Ї��/�eŰ��`����c�pL�AYdy"S������/�uv�b��x ���W�N[��o������Bv6i�b4�� �����s�}�鰿����H#�q���ࣇÙ[- ^����G��ȏr�����M�`x#�-A�@)��@��#zB��-�fm�:�;���P]k�P=�=fD�a{���Z�S����n�M��C�k�p���-��Q�<���`��.���^�x
������,���f0x���R0�E^�`S�^P:'g�]�I%<���²�`И�p�l��:�y�t��_>����y���|�          �  x���K�1D��SxH�W"u�lZ���G�I�� �n�+�x&�U%q�'��~'hJ%����z0h����t�d~���]iN��7�������7(+��Y��:�D����H^S����0�ƛV_ I��5����N��Ws&�nIPc��[���D.�˸��߫���F��D�^ a-/�ը6�LU�4�6&~i-���i�%�����rZ3i��h<�?it��h�gh��c�4;zh-�v}]׏�@�c|�O�}���sh@���* ��C�Ak"�/-P�Ę�9�;����DZ�Hf���imT�
��Zc��P���^�LFM2:�^)n�	v��>���o��:P�W��Z�F�/_�5����;V�/�/_��(��|% ���֘ZvW�:��}�15A�f]B#�T�=�4؏��n?@Q"bY������$zst��z�����ٸZ]%����X��F~���p@�� ����+��?:-6mZ�V�;��h5#����Z�Vɪf|���G��ր�����ZL/��܁�j��#�J睽&�oP�0n�Tr�څ�7E������i���d3�z�j�5u���05����&��1
gG����~�#�{Pb5�X�ܮ8����e�q~��FZ�tC�&�s��[d�=^~�P#�����k�Ώվ�~�t��aHA.��w޶�lM	�         .  x�}�1o� ���WD�5�!6�ҪR�U�6�sj�1)`EQ��^7�V		�>�ݻ��Aa(G%�hԚ�V5��L��, �qAP�%/jY�R�X���gr��	} �Ǚt�Ԥ�m��ZS�4Pa���jE�%�V�m!INƀ~�{LG�#0Hb^\���~Ĝ����YN��{�KW��0��]}����h��ಝJ=␼{g�)9�~[}u���&-���776Ň���y��=b���ҿ��3=n�p�G����g��;=lRD(�dP�����/|N1n�`Wv��?_2V�S�
*���}��,��M��            x������ � �      �   �   x��1�1 �����'#�q61�=�DAI�ll	���?���"12'��ҎJ��HE~����o~���L��cO��w����:P�u�-lC�ީǬ�. �!��:,#U���V�c�k����'�!Jd*k�i�Q7l]{�9�F.��}��aY���05         �  x��ZMs#Ǒ=7~Eo�hOGeV�NVh�k���e���� ���a:�Ml_V5�n��ÛEI�˪��|��dm�v��UT�a���KMn�qL��R��Sy##��7��lW�4�ד�ٶ�}�m�ow��8�1�6<vil\�c��T�F��Z��˴HW�'�ב�o(��U<��:W}���+Xyc�%=�U�z�&(ֹ8bk����\&A���9�|j�#�������i,<��XBїCp��6ݓS���EO��\�7�.l���b�L�D�\ko�fs���s�[�o�d��l����($�Nb�w77]����x���å!T���C�<XD�)����f;)�	)z*6nĜ�����i0��$�-n/Nw&�%X�� �����$�d�	(���bz�[_��&�M��=�6�����ds���kȒ�98�����:'�e�$�lm����no'�?ԛ�zV�y�]m��|��7�?f�u}?Y�?�ݮV�b�/��7��8�A��ȑ�t>�b
7��y���"s�ac����&!0%���{�հo��ll�&S�2�%�X+TXj��ݯ���/f�b��� �c��(q�~�E�������G��~�lvg�m��1'ćs�������� ��F��"M�U�s%P=�!c��B�6������'Mk�l��,[w:�����b�t��K�?��?M�M��14Y��~��W��5�-��4�\�Y5���U�]#
�u�6�5t���-K�3�����t761�&���)�sl�2��1��dH��3�U�����u�?��1�>�眩��]���^쇄]l�u6��u-��f�����秡�f���ަcQr����p��������h�9Fx�R?҈�\_�^0H�$||9Q��lv?%i�1�	�Z��`��7:�ѻxmVb^�~�E�R��&�K)�Է��M�K��X���+j�d4���H�xD��ZM��i�A��
�ǣ�Q��'p/����p�J��3�h�I��A�B����s���ȹ�X���K�<R5ᬶS%�Am���Q�f����H�0栩L�����`g�l��35��?�j��<�]/6�J>F�4b\��7@��
��"�<����K�az�K˨��E�I�0������mB��q�a�7�m�i���s�4�G��wEhS!T�IRBUS��jx=���GԗgX}XH޴��4T}3�_�h�6Sj"$��
���#�<ڴ-ƍ
vU����v�f���)��sBt�&�nbil`c�^�	a�F_����".���^�o��ɾ[�E4�ljX�x�	�s��4A��8�ŕ����������b��`�͓�=���~�|^>��>ᕿn��JX
Y�#��_��t�`�-O�p*��L�����{�l�#���t�ə2��Ѻ���!�-��y�g]��N�\� 84&&)SE�(C`p#�8>�]�}\ҪfYk?��L�8��}uvb�ъ��]���#ƸE����TzhL,��o����oұ�YLU��!4*����4(���j̍I�w���W�j�� N��~�ue�	������],���9�ڬg���XzrJ�[lN-��g������y�ٶE�7�ǃN�s2�@�����z�'�ۻ��^��lH���ĥ"�0��մ:��w�%*��$
F��k��?��Q̃�
��tl�t�ց�I�05t��Ǣ�8퇍wȢ�X4C�K���E�S"�QR�W��hm��Ѝ[ �����sv0�.W*f#'�88�L����@9#@͈1m(�>�!�{op�v�����H�dI�!\�,9�cޒ4�����1~-N9��dJ)q@�/���tj�!�d��v��!�/k�I�%t~%[��J-��@4��Q>�i*
,�N�.hɥ�o������:3���B��������	)�bA��J/��TB�$_:I���Fg(k0޴��i�KIcv��E�z�W4*RtC'�ag%��`"<�-h4�
��0lr�NR.vZ�tݧ�;B1,z���VW*��V)B�vyC�aW���81��+R �\r�H�cA'- A|,�\B:~�,��ْ�"5�����K4#����P�d{R.�h-Z�! �6�"���;R�|�Yj��@� 	�Sj@d�_v�A�:��,�%��� Ԃmu-�_w6de)�͚��9��R�bգ�㏿�,��xڼ��x�-������k���e��ꘔ<��;�ɲ �_M.���|0'��A9����gӼD�z5߯����!;������,ꁹ���J��w:�LvC�"��0�t�������p����K.�������w]���$���8(E� ��!((�'��� e�Z̖CZ��c�2ѫ�ز�͆�u���c��j4���)X5��ۻ�]���2Es�
�����.��A�@�	E�h�&�v�CY��/R^ސ?��7�����7�%�~:���M��3[�<˂�
���bK����c)7+��(�":���n��Ų�1�b��x�����~>�f���U	,�A3
��IT?/��?v%�]kql@�C	��J��$��zq5�L�S֟Y�W��{cڈ��w����nq��0�6j]Q�SR�ѯ���jP ���]���iq��=[�+�GxBy̆ǥ=l������ò�/��6x��t��LU��e��:h;(���]��I�4��v�������J�9,�0�A���������M�KNw���+u� �a`d�i)�u0Rs�ss�7;��>}碤_��Ft� Y$�u%���_^��$�/�ă��|����S��X|���˞�jIZ���wi�<�e�m�Cj*�g���(��EoR��BH��厞�5j�vW\r 	yN��͞��s��d�s#{NU��r�t�EI'Y�l�e,�N�Sf������i��.�����K�ZrJ���[-���\�;rY�xQ�v���#��q�4ų�Ϸ��-:�p�F� �͜ �nw�����{**�/7��/�B���� ܿY������+�f�u�+��Ec ���ܜ?��KX���LYtID�`���ji1v��;���m�'P���u��K*٪`������ot3�+|P%��.9ʣ~S4 ��H?$T<���J� �rw�\EC�t��\]�AeQ��㓕Y?�u������<HT����UI���zT�wL(_��a�����A���s�z�t�~Nw��|D��.!.��]}���^�r�.)��u@De����ح]���ͿV����$��%Ɍj�6C�,�T>?�9V�7[�:ċ1y$�y�����|ޢ�~�����R����������iqI�t��Ճ��=Q�ػ[��s|�U��d��#�>T���݂S��q�8d����N�Q`LEY�-׋���2��cS#z��6�����2y,��KMˌ%�,��L׃ƴUA��Q�C�����_!��yq�N������qPX7�����~ج����.�����n���
>&��!D�K�D~C�#]�K��Ql^��H'��dr]�y�-�[�kw;�wX6�S*�J��[k�2Ug�ut���fH���7H�Z��lQ��-c 0=��N�tcוӛς���Pfעk�dz1���>�>�Aު?���efz�A�j�~��Х���C:|&9��B�wmx�(�M�����f��k�F-�JD�w���ڮO�zE�����cF[.����P��b��+������>��{&u��6��8��$��+e��R K�5�yǕ�=l�6�[��8Sǉ�V���$��-��=0��E��r^J� ��W�?2m�<[!����8$��1��W��7K����KM�K�xa�A�5nzM�_#=JOm�ۈ؃�F(�Qݐ�Wm1P�]�ܣ_��F,9r/��+���ϧ���W��j/����=�^�2����c�av��w-�hx	���~ߐ�n���h��ݢ�=      	     x�m��N�0E��+�G���x�%,�8q,*R���c�����G�^�T��+��Ɍ�E��[%+�bSe}! q�l$L�I���+��o����AR{���agp�'YJq�st��bB����D&q�C�#A�����p\1 #h�H,�#D�Μ��c�tX.��/ޔ*I��J ���Ἤ�c�Z���)�cb�����e��m��=����?����F'Ob�w��g�iڪ�o���e�� ��D⃐ڭ�[�G�G�)Q�;�ޏ��a���jL      �   �  x���;��8�c�η� y�M����-�x�l���U���" N�	�E��JS&����qPK�J�*�E�d�{��S�'��І�	!n}	�@o�YxC�K���H㚫a!��C�s�C�Ӓ�iyZ:����}�Jh/�&� 29�7�u�����ćE1��1�C?��M|!l
j7�)s�1��Du�$8!u�3 �ة�σ��Zi(�
T,o
>�1��<��`��a�z,]����A)����ŭ��_B���6������A4� _aۉI�Z�k��pu�~|��-��1d(����c�q.J����I�J���BV��#D7�ä́�R/)���u�ɐJ����}�1�W�
��؋�y���\/�wJ`C�b��Z���γ)���n$�.)��XY��kIp.08N9j�qcm`�ìX�ܐo��	����~��o�"����hO�U���KJ4�a�g�Q���9�!]i�2�s��~7��T������ϥ�����ū>��c�̵R���PRz<��LT��e��X�5�Z,�a�!�h$M�i�c�b9��,?�,-l!��\�y�?��{�8��w��_���m�P#�w���}�!��@�/�tڣl	���}��q&?C���_��و��l�E�Ў�r5����#���(������|�����      �      x��}͎�In�Z��l����`0�{�o��_x {|����n2"�T�:k�R��+(4�LZ� �!�� �3ё�(u�J��� >��'<�M.����\�Z����z�3�K=�˧�����ӟ����O����g������?��6�̐���O�~���s��_��V��?���/�z9���/Ͽ��O���7��W��������]����5px� �G����fTZ�D��n7=T��A.g8����U�Hp��������0d�S#�O��3�Q��������W?�A�����p�����vg���L^�Cc���{>�����y�\Ηr��������`��bw���kx��`���'P�^�×���?��߷# �1$�gL+�7B���x�c�p�'t��v�̉U�͉���-���P�[e2�~L�W�����γnLՅv��r����
R�~8�-���g�@u��GFF�9�������ځ�_�U|�W�W���&�g�#գ�V+[mAO>���J��A*^��z\�|EV���V�lNJDp�="���?��|c�����#��Χp���Ѯ��t%<��v�kE���[���ŉL��u��dA��@R���� f���5dq�>9�S���C*�rM4�v���)���F�p$;"oU�vn�:;�p"��9~@���=c�t�{9C��;��a���O|����.�*X���͛�c�YL�+x���a�p!��+�w�����W}+,�'�:=�
dqE�L�G$ۓ��Ax|�E�j����O��kT�p�RLm�ԦG&�a�UR�[8#��}#��8��`G8+6<O�,q����D6�Fb����| di��,$,IZp������'9��t�h�3�_%���z�x�\�'�_�����a���0L~ Y\�Ґ���8��"�j��  �@v�C=i9��
��������^qp�=X�AO�)���\���nEj�Џ���=¯w�n�2�i�kX��B��ekzd�A�(Z$i�Y��r�/���iHFj=b��\���!X�ޢ���:2�7R��ۭ�^3xTCJ#ƌ�t/�����J���Q��ɑ�G5��X��bB�7A�LP=xM����R>x��Q��+�^*��;���|��O�Թ�Gz���^h�����g�d.�ԫ�n�5V\�ʛ)9��O��љKt��d㑢��W������S��C2�D}<\P���Hd�.�Ł�LJm6Cp���WT�����#܍� Ꮛ�%�4F~�ǉ���/��P)���mf����Gv�[��H��f�<~�Z���J�[���.���x^`3�ֽ�3���Ǉ���bd3���I�G�,#l�;G.4{��2�M�#�ud��/�k�*=@ܰ@v�0apd����Z�t/إ<�i>eU"��xrd�=�`X���k�v�~z �P�ȉl��Pϧ���E�6C��A��̛[!�L2��?�d�)�1�Mwd,x�~�CW��J��BCV���j��j>���/4f��&�A�:2\�4&2
ވHeG���F����8���g �d�n �w�,�-�UX-��K�����M_4Nd��H�x�kF>��4#x�)HD1��f�W|�k��䌔͹r]Kܳ�\n�V����)�>za������������7��^�#IڦE���7��ǽa�{!k�zҼ�������6��-d�@����zd�ٵ
�	(��v���Ho�b�Oq��vd���B���
�|#@�Rq#���j�)K�Lt�V�*S'4�,�#"m��mo�����v����!�S���� 39~��~�x����FF6�	�$b�����'aGc�f-���?�,0��%��� �lv_2Z�k�ZT+]��h��gGF���,��aj��C�Ld �O�� r�8�c���hd�?���=
K����:�UZe��5�A/�z�Q|r8э�q$���`W�.��E��� K&Ҽ~�/�=�s̎Z�+�"����![�f7+����S��K[��$����R5y#���ÆK��m1�#\�@;���#^��Ⱦ����]pY��
q���m�	{�\�'���(_m�uTk�3B2���O�y� s)a��l�^�Y��n�eج,��Ih�h��B�?�A����>�_
�Pґ0�T��,�J+D ˙���.���;,�?�V�u��\ޯ� ~Q?�o��1����S��y�:1q0���n?�U��F��G�Ɂ=k��F5=�>��>ἾnN��7��=�MXr��X�a8�����L}3D�q�f����r�7+9:ڑ������M"��a���b���6���.�C�ڟ5q߸�����l��5+��/XA�S�"h����8�O'��h�o"�!�J��Ol�b�6!�Z�x�+�ul|D+��&��� YgK�,�I��� w`�ٌ�ٹ��mY��%��r�bo�G!Add�LÛ�.�#�@Y�#���Je-Y��Ր��`:ddA�����iE�B"��&���d�����+�V�����U��6�\����k�i�Fh�1HcG�F�nmKʛhA6[#N{���χ`���Z���ڑq0��|,��͌�M��e�j-�v�����S�.	F�~�
���ϝ��O-�]�|�|ZR47�e��POY�cR./jW��\���6�ݾTxx�p=�T��1��Q �ƂS��|��"Z�ؾ��n�����6��Z��QV����OwF���� �E�s4{S�^	��ڞd,���3���
+�:��f@#Z���Ls�Q��g]�Ґe/7��.��bd��h`���j!Y�U]qjܳ�@-��Brj�mT�E�����ʨ�B���5[ �>�h�H�za�N�=M$�C���S0�x
�n�t?���L��T�Y�GY���TL��6->�|��C�Sa�2dC�*�[��(��@��y5��Uw��KZi�.���U�^� �Y&6e#Qƞ��$y�g,�i8��l��Y���<�p�iT\�[�[_��6E�>�<���@V2�Uñ::��n�,���q�g�W�� ���o�r�P�b�@��f{;D�z�w�����?_��Nu#%�Kj�.�V�H=m�4|�{f�0��Z�B��o��c��c��O�������]�3�%����|�=-�{5YK]�N���S�H��?���ف�KE6G�3���#3|�3��k�k��~��ں��v]�F+�l�}�oo�H�H�<�d��m�9(�X�{)��\������w �%���Fs$���ZW���6��!�uL��%�Oc͒ݐ
P�tl��<�O�I�ڧH|�ݔ��ڭI���N�D6�:�gduc ݑ�-.����?*���-�����&H�;��R�e)A7�0FN2�����%Q���G�6��	��LQW�Od�|&-G��ث��k���d�s��L����t{ S�oܧ�
��]7��ܾ	iu�����=�����V7B�#ؾ@}��A�7%ܪ��uǧ����(%��~�����BRy	�P�ȃ�ދ�B��4�����2HqΝ�`����(Oe���.xPx�p͘���x�^�f�,d��d���@�[��N�x���r�ĸ������4�Ȩ���� �� �U^���"�wq#"9s2���D`�e�'+�L8�.ތܵ-�L͊��q60E�a��9� �s�[�H��?�a �HlA�i��eHj�n�J6N�2���F��e��rL��@�
��|�0E)����@�VG�c�U(�p�ٴP}�$+�|��]��HxFذ�X�Ӻ
�6������@Y�ȥ]�������8��iE��6ŕ�
	d܂{?�eb�ui�m65y~?k+�J1���n�#�L��Vv���i�H����PN��ʕ�M^A�ƞ'�p!<���)}���Wf0�cY��צ�N����
�Whr X+�?�Ȱ-b�@�(WV!��,X����B���Yо<ĔUؾ�X]��V�*^_K��V�勭���h�f65s�Y��,����l�����x~�U8H ي���$[���� �  �#5�+��-�AZ�ǽX��� �k�S��G����A2���	dkp̅��Y .]����!ڨ �G���쑎xf.�o+uҐ�a��lґ�f��)H]��4`�*��t
Rנ �F~"����5.PI} ��Z �i\���0n��l [����b��V`Yc�B"k��T#�6[���]U���������L����p����j��@�j�3kj�H�F���!6��}����P���,��'.Y��^�԰�HB�ta?MU�NH�~�}F�rP�Gk���_�խQ�r�9FA琾
�bn=X�H��*�=�vdh����b3�tmSU�"6�Z�gdM%<�w�h��k���ZR��D�����ٵ�qZus-�����Ӟ�˔r$��c��]��rM�f���q<��*�\�V`��*u����Ca<7����@���6+}��`�)(X���ހe0�k|F���) �׭,�;��O$Eu��URn�X������O�l�LK��2^���s� �*��,��+�f�5Џ�h�R�'�U�Y��&({F��ĳ@�{�̭������T:��Q+X��w������4.Sߑ�tQ�J8`����e��;�'B�e��/]��h�Zc䝲���6G�e���-�lt�Ȗ���6-b��D�h��Sr�V�����K.�0�=��͑���9G��� #������{�����V�'�u�f�����-pouS��5p\��f�F��㬽3�,�tH�g�6�[�2�����i�>#�MDt���B���������[D��I�r&Yj����Fv8э�*�2�6��Xr�8�Y�m�4�da�}!d��)u��D6�=�7�5��@@��9_A��a3�Tw�M��>A�\k��Mh��Fv��nen[Ͻ��O2Hչ)��/�hX_���_AԗY�o��j��/]�
����B��\�4���!�rdܘ�}l�����D&V��vd�3�2�G[u"�X����9�����
3�6�W��<�M�AM����q+ŋ-�����j�>V��/�Ņ5.Z�.ڠ��Ӯ5�c"� ʮ�h���f-hM[0$/�l�7y����;BS�j)��Tx&���#+jwd]�ȍ�#�
��m(X�R�"bw +�3�X�D�IP��k� b쭑	r;��u<�����#�*d���szEܧ��VH�>D\�#��[h����J�
~+�p�V~���uؕp�گ�
��fC5{�����7�x=mGF�A�l#�DM��8{��0���E�zڊ<s��#k�%S8����GC��}$d�:YS��kՎl�ݑI�Y�28k/�չ�/vd��1f����z4%�@M�J�o)��z �K���>2��5������\��@Z.�����O�ޱD^��,�12��D�ˮw8pʰ�y@���L��G>��oȔ�o�JdU� +�� �{��]H�A0"5F���r=�\��)?j��kděVE�Dv=a:C����ϝw�8�AV��|td�4t� ]���F"����9;��rn֋�p�׫��R{����YdFg.���YN�Bx8�_�W���fW��Kvr1��un��2��:���w�:�����d�V��Ns�[��k`A��+�&����P�,�oŉ��K��3��ѰM��o�2��ܚ"_#��F+�M���{B&�@��l	��}�$ؕ��<}gd%�fd�D8�V�M=t��O�����?�� {$+�         �   x����m1��*��$%���%���=�5}<HQD����%(^�����/}�,�:#��'��:"�x@"�����d)��[��$��i!}����U����t�mY��o�h��2�	F�l3��
�t�O�ud��3�v1�a-+"� ��ɡ��/CD����ҙ: @E��>�#�i���V�F&g�l���券K&���s]�b���         J	  x��\�r�]��¥URet��W�T>!�dJ��3�������=M:�d%�.�E���j����>A#i?�7���*�R�1���!+1�Z���M�^��~��u;������ח��/�����ϗd(���Ջ�f._���V����˛z�zS�Gwq�{�ٖ��������͝|`�&vޢ��C��f�v|s���ޯs��Ӕ���e�& Z������voR�ݸ�fU	�(J�}hIU��א�?�n���W����z��h3��G�^on���?vu�[on���z}F@��Bp^Q,Y�
Zt2�`(������=�%�G����n��e]j߮�U��������>�ovu�p~��7Ӳ���{�����6���WV�#j,_��\5�K����7}���4�I�֙�t�Q)��*��yFM����0�F[O��z: ä�(�'��aA��^�� �O6�C��t#&J����ؘ77��Z�k�D�V'E�M%gY�T1�����A�7Y�_��/��z� )�`G
�����.�X`����<u|�=R<azf�`���<
 ��0��/���X emcE�d�Y�(_�� c���[��O�W����f�bI ��ѡ6J(�)��l��|�_}�W�e?ƀY�_��9����!�L�r�l�?;���b@n}��A�r@�hkn
,iE!�J)�TQ��СP>%p�$0�.�` ���n.����������J(��p��\�Ɂ�\����R��U���0���84u��"-�\p @1��0�Q�E�Ϯ*?S;�����9�E;������Ed:�4�*�� �����#aQ�_�#H��P��(�;ř��"�e�B��K��F
�حȍ�h&���Pع A��H��7N���R��+�C�DtN�� "q8���es������������<�Ȍ����MA���.Z[*��hy,';�xD�Cpf �v1a@Tw}�]����GK�p���z���"Q�/���ᆗHq����ɯ4�V�;ؠ� ��Brp;�$��ۆ¢�
ڮ�>���
(�q��%�,����Ln�0�� ��N+LӠs�*���H�dkT)���pjVڍB���*�D8 �6�_z�������ҁ	��G�:� �����<с虁t�Uk:�����B�ݽ�%]-��̔!�A�г�ѐ0{jGY���e'�@}F�ˁ>��>�q��y��FA5jqJ86��A�`N^��<jk��
� �ܛ�2C1��9��K/X	w�
�86�_S�:6���ӹ�XQ+S� ش˔��^��$2v�~�gbgQny�Ubo��ՔHSvm0�������͊��Č��2p3�9X�Č�'{�1�!��0��Hl�����J�M��o[�g	\�UO�c�d����e�V�lh��>��Z^d�y��t/JO���RF��8�h2������l��=Ԉ��gP
3��4G�ø -,�{�-$՜7h�$���� ��	B��������h��3������'"�Ekmu*e�"���>��Lk͐%+;}�D����0{�1T8C4�-Sz�$�
D*r!�`��D����(���X��I�봝� ����?><<�RC���Gl1�?9[��K�Zآ1� ^4=� �%���laVz����^d���D2�A?[�s���&>f�S�ɦC�YD���7$v��!%`�5&w`X��XcƐ��Ƀ�\e��ϙ�"s��Q��X`�0p�� �HC0��OP��O����^׸�]��x%����%�}F�����yoy��D�<���b�s7�N�T�`[�Q8�t�����l�wN8ي����鋲4ꜭ>w��Ў��	��N8��wµTK^S`o���
g�%�L�PO�|p+�F���ޗ3�L���"2έl!��J�
��p"@�=?YcK�u��-�ę�?���ޏ�#b�X�qZ*�F�s%�?r����� �9�zbxڏ���ޖE\�	)� �|0����4�Gwϭqι�wq6�(bM�2|���s[�)B��w_zp"���ȜE�5oJ.-�3A���>emx�8�� ��������z]�7�Q�I/������K���	��|����Y�U"7�"�1[��G�E����LW��<��+��P�q[����g�L]?�+"���LC'> ,� ��zbB�V�FA1�P;Sܩ�Nk0&�/���� ���t�d�~��>$�B r�
$!�G������9����຾����z������ UX��0�6ӏD�������?%�O|�X��������      �   �   x�KL��L-K�M�+)�LD���q��*X�Y�[�ZXh�-�L�Ǖ���Z�	!15��25�3�074��4]6nhAQ>�D݂���"���VYZ���YZX�b�
M��=... 
G3      �   *  x�u�]��F���S����=K��l�=�x�-ovs�О�f��/ @_u�S?ﶼ��3��i�,;��&��[����9��! ��"��e�%���P���%�5l%�aZ�u_���>���C��D�'5�B1�h�s�Z�l�f�>x�Oo�-�t��oSj51�b��*ByXML%�j�Rc}�m�)�9N�����e�0��P�������^83�ѩ�'`,%�9����o[�u�w�T�6���F�H�[�=����_J��	�"T���_y;ؿ.,�۲n�����4��B�!+��m��L�R��T�@�kQ,B 1��~z�b�O�\���~�h(,��Ì,�#d�2b$�&�	87*s��?�r\��lB?s�i'm��,CEVz
�M@a�i�ߖ���4}
����ԓ�CÁņVhV:�d��;xB�6���G��O"���VMH�B�C��5��o����3��� wg��z8��f_�q��[S?_��?��/W7ъ�:G�U�t�.��a����7�w�_��:����ZƑ�h�LFn=��	����� ��,�N!��c��px��ү\������`N="�Q9'_2�	�Q*���C5{�n�����t��"�w��8��w��Y����+݈�#A�,�s���($�j���Sq�>��y�]�/'��-�/ Xch���|7��H�n�pEO4c��ΏUjj���*_�|�!�ϵ6/��NjM��sBʣA����h;�B�:�2�������<R�my��S�Eb�5S��w:4_�ڹ�"*����k�<��2��?fO��      �      x��\]o�r}��
c_β�U����)	DO�~�ε-����&���h$M�zl�XB|���tu��s�d�jw��f�F܈��aM`�\�=Tʯr}�����o�����n���7�[����s�ow?���_^�eg����l�]	mEIg���/�:�����/���Kj��������M)�:�p���/���/����7,~���C�����_�O���|����7��ߚ/��{�0��6��n>�~�y??�!���o�?8o������M{7��6�c�>�9����5xZ��?��}��������ͷ|��M�Ѱ���*G<o�h*�a$G1e�b�c�֓�i�(')-��7�XM
�C=R��W�_�w���W��Ooono��J��!�n����WTJ�ښIZ��h���<s�X|݃�ƺ��]q�r�M�����FHV���}�S�^C"�j�>���I��� �u��� �X�b�)��p�u}tj�&y�F�/�c�&���������mu��m��� N1N��6:��K������[�<�l?}|���{M�J�ʆmGvɣF��B�1S���{PrIm��G�b[��)欮����\�� T�����ױ�.aW��Iəb}7~��j�6>�ƌk�> �jj��&6����M�c��8�����B�	�/�x]e��ca$˞(�)�л�9���Z����x�2����_qc�B����0>\}Fn\)�b�i�����7�O�k��6�}�ՔA��ɠ�cc���n��=��a	#�$�����x�8f��0�x�\�&��ɽ�E>fM�P�̺EzE~��?������-C�hU���(�Jqt_�M���H"�+e��#H�\�{���֑oGZ&�|��PLW�%i����:#gE�x�^�I�'C�JjI(�W�>�L0ͧw������ĉ�$F����`� �`�g�'z}�:b�i��$?L�QA�.&S�FSVJ1����P�Fp�fX�Y���cu�{ک�9'��@�Sp;��w�Ϧ�L�.4QL�B�rk)�	��2��p��-�2�u��ţq���	�ժӦ��Ѵ�$�z��s>����_��9w�:�%�T��	��	��V{�cTǖ6u�hC��Z�9grc�h�=����=���d�,�w2�ԩ��M,rJ�Z�A�"=^0�2��Y��5���4�`raf!�(������� TY�����u�
X9N�	MQ��E� � -n�����R)�(�
�0��P5��"+r�PQt�]ʫd;c�o�������7�(U�T� yTz�Դb�+�Zr
�o��'�W&gd� 4�Ut��z!�����[�M�E^�)0���&�h�m�����o������ؾ&���oc �鐆s�_9{e�f�<��w�nm���,�w�֦pH[�+��Kp����}��������w��v����OF�ץ��ִ������f� �)j5.�q�A���w���r��Oi&N0�r�V.]R�a6��I\�''E��d�ˏ`q�{	��� ���y�uX�G�ؠZ�P#0&12[͹8�)al�*j��hZA����j�d��=�!a�9����'(j(0N����w�d'�5\o1��R�\0��J�B���ƴ�$�[���#5���M�}����g����h�ukd$H
�6q��`nJF�U�=$�S5C�t$N�'�Y.�r
PV��m2�!A����R}��C��՚���)V	C��G.3��^	o�O>.�`�.H��[���Y;p/9�r� &w���0y��B]���ꧬ[�<������Z�a8�ʽ�j�fX�5��P��~:�8Ȃ����vwo%$�!A.�F�V��u����m}D6�]0��o�0��������f:@b�!{���\��ܭ�}�����V����Q��X\GZ. h��K��(~XX]X�66�K�ra���\�=��s6<z,cB����1rHvLd�Q6���5���� Q���)�=e��V�`tV�v�蒉��9m2�!H�"�a�g�g)�H�@�Dw��3�S���'�)Q��<>]zj`x���V��6��2���#$�EEDA�;� .i�'����?�%�V�1�ѿ	/1�K����F�~�TEY��5��3r]���,�&y�������B��+G�u�ۛ?����|�_��0��k�Wh�B���R���9x۩���;Bz*#J�m_��^�^�� �uX��>��fs���a�E���F�6�Z6�AIk��S�P�Li)�]mǯ��@�|���_O��4x��̿t�>!��܆�������D�G�@�,$3�u����5�نL���	�hR���#�D`� = �m���-2UBQ� �I�p��sI���ߞ�$Ή���/]@�9Uxt�TJU��=��=�Q�^��	����	W\��]��KaS�E~ty4Pg�D�8���(S�%G�)C��|���O�����&E>��3F��4���(��M(��Qɀ2:���ˢ�t�)�k�����,�@�C�7�c����x��,C
ʋ�����Z(�Mv~�R�psG+������FE����\��?�@Ŷ�K��#�Az;Bu��U��w|,�����3�2#=���_��F����x�����<&��%TȽ�qs����2f�'Mڄ&HiD�6�ĥ����t�'�&�x���貦��K�F�@#�f)�@ЃQ�1&�'/�Ɍ�DG~�KҒh��� F��	%�O��wz߁��W+P�&u�d�yO�P�ڔ`��Ģ�^Д 
��⏝���%v��Am�����9d_FI��dS�-7�Gm%hۗiI ��@y�����C�w�@�q��>�o���ᖘ!�!w� 	�&�,>d��b���p1C��#U��ݛ���}|s�+�]� ͒iեe��dt�
�՜�o����%̦m�>�#��B��� �uT��*.�kdFAIp��sD����6"�uvJF"�Vc�P�����3/Q��?��9�Hڪ��M����G��Q�d��7�XC�Th�b5�����	����@׋���'M
	տ�f��M]���f4X���otnW�^������R��K�����?O���(�O��ѥ(J��s!&�A\D�r����#��]���c�zn�-8L7�hr������՗28gdÍ��Ԑ�d@���@#5�2ۡ����6{p-gX����sR��r����~KQ�����h�3��c�^�Ԝ� ��j�A����﮽�����Os��Z�d��m٧�Iɶ0�0PQQ���L��5�F�=`���Q"��K��kJ�[�=;=�����.���["J/l�DL��ju��Ē�7��W�v�����˟Ȋ���ކP���J2��5(?�[��ܿQ���> wvj�y��M��I(�׵ݳ0���$s�t
w�2������l��a�*/]6R���cr���A����s�(��������Cħ��c�p
��5AR0�r6��v��	��qޠؑ���<;7pL�أ�PY5��{8]:�ss�� �����"�얘�]�@z����s�@�3W�܋o�u4���R�^�(��+�zj_i:]���a�<�N6f���	�:D_��ƻXànP@@�bR���9`�:ƤI�� ��'	���˴:sMvp"�{d�ֻ-5�T�S9��������	o#\2}c���uz-�Q(ڍEgJ۬#&I��&� D���i���d�L���-��n�4%=V1g�.�#��	��]�4m���b���ЎJ$�}��sn��G��޽�����,��� /���d�kt��K��ޠ�9��h|�P
s�!z�+��d��C�=�]��(���ʌ�.�����K�o,1r������:W����:�|�s-���P<���s��i�">�����D�C^�0~-�~/��^�JqJ��bʹ�?s^}hx͈i���ʫ��4[��V��*X��Q)�64�Gs+|�n��0	��p&��B�+p���D��\�y��Ff�z�>b]�<�R� |  ���$���� C�:h�lQ`Ԧ4���"@�42nߴ�;ej9�Ѳ��������so�;4n� jI�{0�?�\�"���Nޕ�&ܾ��:�)��:^�C3]�a���	��yF��9�����*(j�o��c���������^\R��ܦ�h!Q摯��K���w'.�>�vj�=�YZ�q�lty��2�f�ܲ��7�%��HrS>^���i�S�ޟ����l{���ٙ,����V�ћ�=4J����o:[��=����o�@�9�����A�XK�}�����巑��z�����&���v���C~Ź�PJϵD���^�T�!�f��@	����A'�y��X�x���B�P%q����TL%��ET9��C�H-?����bw)���9ͅOt��џ�U�����<X��w{�8�TzTS�-~�����7�C��o�U�y���9S����)s�e+B�gv/����|b?�7��']��ظ:�m���� ��v�=B���rF���y4���9��s�vz S�Q�,F(n��x�]L��nY�Q�����X)�R.�#r꘬p�y���ryr���E�-�{gw���X<\��	�s��̻ �\�gj���
�~��I�b��\�+�f�P�����-���t=EH5����zr��џ��=�x�%�6inJ��)��n-˩e�u#����Es�*��*1�l�C?=��=��O��y���	:Mܖ\G\�`t�q�El�UR�n(

��o��~�+�BB����c�~����}���l�|�%B�<9&�p�0n��D\6}�j�a���p���>��<d��s��!��s��:�����x��O{��1�;��~��J�}Oor��8M&�\B�I��{��6�Q�o��m�p~�#8��9��8����q�z���ݟZ�sr�@�1��˟���N���Ϙo�a�K�$����J�ZϹ�hC�n{�2�-�l�YѠ�i��W���Hx&;pc� ��b8���!|x}��[f��K�P�5�'\N���ҝ:(���S�#��URZ`��[K�!g�k唣���*[��<���3F~������8\=��c$<\� |�eDOV[�M)���E?���2�\{*����<Z�c����¯.��������L�bK6�X�8̆�jNM�I@�eO����{cu��&����<��6� ��|c���BtNOb���?��yu�I��C�%�(�Z�H���"��V�2j�1�LXŰ̳Y#	2o�����[I�����p��O@����9k�g�pꉣ�_�ЧRg^4��V��� ��,M{�7<OZ)�R���(�e�'�g���� ��N�w���+:�џ?��|�E��H����1��n����Dx�	3z�m��y�T[�N*�y~�u�W��\���P�=�9<�ld�������ؿ��w�4�o�`t���yW��p���l{��Y+G+����+���A��>\�DR�m�hń2�pax�TN�6�$�����0�t��i�l���P�Y:��� $П�%��;B���(?_-;w)�������)h�y�e���=�qG��|���d���$�]�81���Y��:OP޽�k�@��%P���`��jd�\�d�iRv�0W4>��}϶��>�yۧ�k�+�`h`j���v��������?=����2?���$j�V{�͢��*���'�*��3�t��㍜@���'x*V��n�g�C�&XF0v�W�2��6)gc��C>΄��4(��Z��)�ߓY��=ko#�޿N~�j������KF��4��>�Cۀr(9�6 ��x���'��� �u�����*�	��v�j�b?_�]�< �zQ��m��l���f      �      x���ˮ$;�]��_Qs�4��G~K�@j@��C�~��Ip߸��E�����$��:k[�����_����������QKm�!�2�)�W��T?�����(���;����ɧ�%�R�F���g���6�=�/ �>��bH�"㗖��2e�Ϡ�������L��X��:z���gQO�}��"�)��W�
�=� �~�Ϳ�~�P�~�����eyD���g�]�rH�+ ��=���_���%0�����җ?8i��50��*���n��N���)�.8���U0�*���?q��e0h��>C'~)��#w�=�_�*>��Y�!@�_�?u����# mz����T"D�U�/m�5�v��I B �+ڐV�M�O%B8�W��L�J�=�a�ޯ�����_ןJ|p��Ois��P����~�̏�-��T� ��t��`�O%>4k��IC�9����\�N}�*�����}}D��N�<�&��g)��k��c6o�<�&���5��~�6J������	ȟ��ik�מv���Pm����M{�{�\��O���6��-�I�i7#�n��X;����)��Ծ���v3��Z=�R��~�͈���A���Q/O��F �����Y�N�p���{to_{}:5�a�����J��ړ�t ѥ��t�꯺�ҧSt;�W+�獧 C�h�{����t�C��j�t%F\}=���m�[K��_��(��{'c�n��͗�G��~X����H�Qb�a�n{ic�V%6 �fC�mE���Q�C��
��O����$�$��Õ����;��@�F�}W���G�����V��[��Q�8�>E0
�PףTŃ�=�R�gP#�>M���FyB�Mӛ��4�D��
�7Rf���F}Bm�R�gc&��h� B8�1��?��� B��
H�3-JL.��O������ B8�>3�1�3�jM�L���C�D��G�|����L"İ�J�`EG��i�g#���B(�T�ve�3����f�g�>��FOo|0�h1 ��Ĉa�B#�����������倰�f�g#���D���Ą��~\��x�Ĉiª5�sƘw�g#��:�9��ʌ��~1�R�RF��<���t�9%�g#�/W?��F��곈ޠ��� �5Z�Yw#@`P�'^�*�;�gݍ�1��#Wќf,}�݈���FL3�x����%\#�xz�Yw#�ӫ��h<����an2����Ok?�n��IF���w���w#�l�+,���ٜBuFLR�}7� ���,�W�;��lb�C�ISZ�7w�gS#��O�Rܢ�ϦB�A�1��Ƴ�`]�̢�gS��Vo`���^Ϧ> �q͚۶`�1�uj����� �J,{|����� #R`��lY�H��@�-�֎)l
�#b���X�;j΁ #j�?�֪�)0b�cb���;� Fi64E�U$�/�� ��HL���[�� "� Bg����Y�G1(a���k�y׹�\�Z'�1�Z-����0 ���6[F�n��C�C0w��+��/��#/9;��{�$6>@g0��Ï{����G�>��~���0d������hw�����_g�/��ۈ��e���a@͚�ZG������eo�̊a�u~Բq\�mןX�:A�5ײ2��\�;�#�ڤG�m��u��R��o����9�K��:�,[4}�$:�b#u�H��M_g�A�+�|bi�i5��ėj��G�K��u�Jr-	Ca���L1����17�p�:U|�����zj����x���눑L��ɢS65|�)1-��E��[�}i�����a��~�b�\�/�0*YeDW��t�+�+>���rAN�sE��Ǥ9�b[��R�t��Tշ��_H���-�*�~�+:Խi�)-L���[U��������u�T�d[,x[��lT���g�1W[��tѩn]#F1��V�:_\f���4dDlj��u�x���u�x� �u�x�l��nƉ��I㙂�Y㑲V�:m<Sp�:o<Sp�:q<Sp�:s<Sp�:u<Sp�:w<Sp�:y<Sp�:{<S�z��n\�G�����L����L���$�L���,�L��^g�gJA}�F��v�MP_�����h�������ڍ.��v�WP_������p���L����37��_�ܸn9Sp���L����#����k7n\���)�q�s���u̙��]0g
n\���)�q�s���u'̙�׭0g
n\7��7��aΔ�
�ڍ7��a�ܸn�9Sp�#�L��떘37�{b�ܸn�9Sp�+�L��붘#5��u_̙�׍1gʶ�}�Ƅ׭1g
n\�Ɯ)�q�s���5=Sp�D�'
n��D���7H
z���AO� 9色��_��lG��n,�A��7Hz��ICO� i艂$=Pn�4�D����(�A��7Hz��ICO�m7�ڍ7Hz��ICO� i艂$=�"r�8���1�A"�#?H*z� �E�!���-��G`��t�A��1XB�&��D�G������1X�7RR�%#&X�7rR�%#(ۺ��%K�FTj���J�N4|���i�>-;��}\*v����T�h�������S���G�b��Lŏ8|oI�%ߧ��`����4X�}n*�|�J�%�'�b���N�<|���y�><;��}z*v����T���ޒ^�}oI`�[�+��-���X��%߇��a��)�tX�}�*�|��J�%���a��I������%�g�����0U�|�����TQX�}�*
K�TEa����(,�>R�%�g�2`����;Z��%�|�ʀ%��2`����X�}�*�|�ʀ%�g�2`���X�}�*�|�ʄ%��2����LX�}�*�|�ʄ%�g�2a��!�LX�}�*�����چ�Q1��Mq����Um?b)*y������Vs�#N=ʂ$!h��P�� 	OZ�m �,��<�n'u�$v�ܷ�����.�������$�ak�v�O��!ZY�����Vc���e���ڑ�Gv�y�Gx�
L�g���,(���ߩCx�ګ���x|��pC����A��8s?���H��O\��e���Ex�
��0Թ[��v��*b��]Y�aC��@?���ip���vjS?�����. �t;��Fu�H 	�]�j�%<w��6z���u
,�k_v�n��,5Kx��6W�2����j4$m�عY,ṫV??l��cp�%<wU;���7�?��SK���MjiI-���b���:�5�y"��Ů�ӵͬɂ�����~V��w`��Ů���Y�c���-��Ůj&�����?69$a�k`��k���-��Ů�}$�S�D 	�]O$a��	��D�IX�z�`	�]X�%,v=a��Ů'�������Zik&�J�5r*,a�����0�Xq6���⭙�5�3�-�����6D��k9n������Y*	0�8��C��J˰���Yq��Z����1�QZ��2,u=a����Ï05;�^�g�3,u=a��,u��v���6F%1l|t�'�j��%b��y��+�N�����Y�j	�	�~�����a��	`���}�-�y��Z������ZX������0X�RW����G����a��	�%,uv*7��,�ՠa�k`��aX��d�%,u�Z���QK��`	K]���*}��r),a��	�%,uu��
^��#a	K]O,a���姰>6u��b
KX���\}o��Ua	K]gF��,CR�����Z�"����KX�:��Fʘ.�c�KX�:���uT��#V��Zb��p�f��:`	K]�����x��Ł�:`	K]̃E�iKX���Ø5)H�BW�0./c��$a��	�$,t��|���V����5�	%5�6�GX��'5��\�W0j�$K��������Y�3��p@W:��?�����A�N;�c��L�#,r�>��)�Ⱥu��N�,�Э����08�"�i��    ���i�#,q�Y!���qF�.H�W�Г��&'1H�"��G���լ��_�$�L-��Y1<*�Ӽ���h~��ã� �8g�-�A�:�`oL��A�z�!<��EӭIX�:�?Z���$,s�"G�j�Ԝ�-X�Bי���5K�nX�RW�gQ��ٳ��%,ul~���?��%,u��[0ȑ#�KX�z�`	K]����p�V6�Z�'KX�:�IŨ\e%IX��uۢ���IX��X�$c���6$a��c�?����
$a���}Y0�V��\��zC�a���bAZ�)%?��������N�%�$X������:f��d��b�5�#�!D���$IX�:�| Ye�O����1�o�%�A����jg�����ձn�Qi;>M`	]��1F�mC�(� ����'��������y��b��t��:��N*J�
$a���R�my��IX�|�T>sj��M�+��1��Zu�������A��.�P\?#h�̯��e����cVC L�qI�d�����4H�2��������B��:V��c��&��}:�\O,a��cVau��>X�B�KX躼je��u�(eժ��`�����-P�%,tl[!��&�KX�l�lk�h�c��,a��)0FNPd%IX�z���\��Vh#��f�Q�6�n��[S`���o=��0�e�j�����F/��;���(��x��߿=i���T��5�1K��^�QE�O��dM,��qF���q�������5`T�>�����nuH���*�[Rg~7H��e!�U��#k �IX�z� 	K\C�#�'KX��Uy���`	K\�Fw��K��KSK��h��EWjſY��~�ڭ�u`��%�'���u�,rk��jV�%���&'iٹYp��:f?����Yp��~�ʵG]B��W�&�k����*���50�]�d�A4���$~��ͥ:^�x����5�e��$���*�I�:/z��M����m+�ai�Q�/M�aik`룪;;�CXܺ���V0�N���ug���H�q@��}EV[m\I���5�a��r��0���'<�r���Zb���l&�6a�[O��"@�a�g��5�ۄ$,o=a�����[L[��y����'���u�eV�p�h��((���mI��R#�G3	��;�`[��3G':��,���CX�j�6�������	jȟ��5A���6���?��!,l�Y�z�����`[�hVwmy�aak`h�e��,8��V�}�j�w� 	[��R�]Ïֳ�ذ���'���u�q��m���ϸ0yJ�7,!a��X�~s,�	ц%$l=bv'�ݒ�0�ư.V;ۆ%$l=b������x�H�yo����z�d��kϼ��mXB�V�ƣ�V��b4�!Y��!$j5ȇ0�g,��AH�j���U�f�^ IZ�6��K�AH�Z�0n��^��UN�$��M˧0]��@���ǁ�$ge����/��|�Ѓ�Gz��հ�ъ�c�Ab�AH��CM��1\�CH��	�CWb0����k�-��9��CH̚X�L�켷���Ջ[�1Y���F�q��k
Ů6��Xy`v�B� p�ĬG����0�ba���B�1XBb����V�����������s�?�%�������&��W)�i��ĬG���50��,sG!�^a	�Y��]�E-�%3LOаJ����Ĭ��U{9��������&�?�/�{dz�%$g��U����A�7HBr֠��ܺ2��?�䬉Ȳ�Lb
�K�6�qI��\1J*�M`\�?��K���B�<ԛݔ�%����o+����� ���U`\�#c��)F���%`�����}{˚�H`		Z�,!A�ݫ뇉&&45o~�%$h=b����k��5�2�.��a		Z��D�(ǆ̮v��D}?`�*9UXB��*��v��AA��e�6ڄ$+$!9��$$g5L=�*{��#!	�Y�$!A�an����	IH�z� 		Z�;�Z���H 		ZO�ݻH����~�_n�͋\�?0XB�V����MNںݾH��#KH�X�6af���F��1XB����r���wv#�Z�,!Y�a;n���n�����	KH��]t�Zr�8a		[����I,���K�9*���d�'
����(���x-k���������V����R�>��Z�!a�avW�#���	GH�z�!qk`�6Ҷ��/8B��#GH��ٳ���I�"�����M�ܒ�v���0��w
�����R�Y��f8B��#GH��/��]�#$l=a����߰���7!Y뉂!$j�7J�{�5aQ뿰��.�CX�����Iʶ�~��!�F����¬-^�CX��o�b_w�0��?�.+s�CX��'�����1;���n�u�P���'��������Q@w�����#,m��m��70H���fwBSKD��q��� KX�z�`	�[��Y��+wi�%,o=`KX�Z����`�2c7�
,a��	�%,quL0m��㈂
,a��c�5g:)��%���n����$,puʒ�:�ܰ
$a��-����7fW�SI,�T(9�������A�fWն�QO+ay�S"��Z���V8��V�����*�8`ԑ?18�����e��ՠ�[���g�B�*��7�LY�9F+aik��8ӡ:��V(����l!�LY�~y�Hk�=��5b��>0��X�#,mu�˄�\��GX�ja|`g;vC�GX�����:����[�;���Nm��,m�n��<X�M�qI��p�j��$j-��y{?m�x �1
���Q;�_�����;�;�0��M�3!��b<{�e\�7�m�.ͮ�7`Ԑ� V��EX�Z3Yǳ��Qڡ�Z��Zvu)-�EX��`�<Uc�v(¢�f#;�.h#�#,jm>h�w�k����Z���C��W��Z�m����xX���E��Y���cͪ��e���Om�q �(0bI���5nxz�i��e���A�6㠍*,aY�cj[D�iUX²���m���`	�Z�mt�z[�j6[
KX��|^�t]+�_Ta	�Z[^#.�s�#��پ2�Ry5�d���=���%� 6�u�~g�������4&P��K~4?���b��| �Su�.�nЍc�p���}u�L��~��-4_I�v�6O?�Z6 ���l8�� ��*�-O=��%ƙ�Yl,��.��)�S`���P��	G�Pxfy󸀢NX�k�{�S��N�b���(j�QvR}�I&̯d�i2�su�b�ӣ�o}�S_�Q���nZ�������aZ�����C���fU�������ǐ9[
Xq�����v�/�^�.�Ĳ8��Ay�����fAP\�u��Kf��j]�����pA�R���S0���U=��;�`Ƶ�!;mV�F&ֵ̦��[ۄ�[�l3Ը��NE���<���a�d@M���(����#�<� 5���Ku�-l��SP����gQz��;OC��j�E٘/�R�q]Wʫ!៤�G���K�	����Jp㺪�R�pc��Cp㺨��2+�rPp㺦ꔍ�
��e�1�Z�%U��W�Ƥ27�B��* �W��:r	(��Ϣ#F�]Ⱦ1�OȾ�]��-M�u�D@w/j~�8��Jw+����7�5�1jZ�eԀ��j�cԴ���yO�{�e�~]A};�#;Vy��u�ԙ��1�^��C�����1�u�4������1�u�4����[8��Lו�3%��Am��`�R$56h���:�Q���SN4]�M���.�����Fy6j���$J�U��6]M_
}�V�S�q�u��ڶ�4��Ը.��T�s�-_8]WL��:GU����P�bz���u��Cu|/)Y�j\��/e;��ȱ����?����~N��җ��[}O����^
�y�f�5f{�n�"n���v���n\WK�������/��J9,���V�0{'�<�7�K�A���Xs�y�q])=Sp�P� p  Rm}Tdf!�q]'})k�0t��fp�LԶ�B��pi#��*陂�ER��]�(9G36r���)9]�H_����6r����)�q] ��c�����g
n\�G_�#;�8����uu���܍7���g
n\G_ʊUj���7�k�/e�z�YͥÍ��hP-�oni�~��a�8&w��tn\WF�ܸ.����j��D27��g
n\�E_
�M���P7�ˢg
n\�ϗjT-s)ܸF�g
n\��j�٭�*ܸ��Gj��k��R^2o�پ7���50��e�5���):"�� Ը�?��P�{(Ը�gJ�}M@��M�h ��� ��������W�z�dc��j�NmP\��{5цF=�Y@q5~�W�{P3�t欀��g�U_���j�NuP\��%Jt�x�j�4(;��r�`��� �ABP�|����� ��$�Oô+�Z��DA�e�6՚�B� hPM���/H��nX�sh�3Y��D�'
^��(�ߊ�Z��n�� xAЀ �^=��-�AP�u;:c��޾/�AФ��Æ�'o�Aиήوa��N0�$�FE=��g,�l�AР�
������$=Q0�$�q�^��dۑ�n�AP������g�NrC���(�AP��0
&�+ָ6� 	艂$5j�n��)��d�Gv�Ԏ����>~1)Ѓ�����4�������0e��Z
�`Y�S6G�\�/���݋�U�W`�C��ᴓ�='H�",l~���~M
a��c�d۾�� 	�ESk�J�0�$,��o�M��A��:֬\�y��@��0H²��"��Ͻ�M�%,�^#�F�-*���g�tԯ���{5�bX��Q҆a��?��������\���a�@��:�	��g���TH�"�IXFڽ\�e�I�����=�\bZ�^�Y!	KI��P+Wf+��i��Ť�-[�M[R!	�IC=0����TH�n�y�8o������%��)f�bu#�$,*=a��e�ݗ���Y��J�%,,=a�����6$[Ղ2F���������v�Yl�VT�r�KX`z�`	KL�m��R�{�u�����1낭�D�o��̴���Z{n\��
�[�W9b�[K~7X�RS�����z׃:,a�i����62�QF{�a	�M��/�V)�1��KXpz�`	KN{��*�K�tX¢�KXv���̪��5���������E�vڮܝKX|�����.OB����p�ڢa��
IX~�X�/���($a����%?���14�*c�;� 	�PO$a��\k�.��#!	Q���hA���($a)�c��V����O!	�Q�V�8f�p�Ũ~�U����[P!	�Q�/�h�<H�)0"�z���)�����$,Il
����aQ�S�b~nk����jւ�Z�Cp����n�.?M���>"Ip�Su�o��K�&F��_ƹI��#��e��/\�Z�YK�6�z�7�qT���V�|��)�QS�T&Z!�K����QW�W��V�>~�ٌ��T��
�cϹ���Q[������9��fKX�K�v|�,+����BV�����ta9kp�-=֏e�/,jU��:�n��s1_X�꜠��UF�=1_Xު~ 3	��2]X�K\5�a���e�/,sU��]��Y�O���RW�SZ�n?\��$�|a���><��F3]X�XC[�+=,Ӆe���6M蒻ܗ���W��b��a�l̖��X���Rr��L����l�����6]X�~�]�u�f%ӅŰ������Q�m�� �9������¢������'r�.,�u��W[Q��<�űj�SkG�J���:gG��̅���d5��v�Z��eշ�Xi�ݳy���e����<��y�����]      �   P   x����,�L��4202�54�52T04�24�24�326�4��60��XXZ�Ǘ�$��Ƨ%������ �q�      �      x������ � �     