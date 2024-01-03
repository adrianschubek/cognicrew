PGDMP      (                 |            postgres     15.1 (Ubuntu 15.1-1.pgdg20.04+1)    16.1 �              0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            	           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            
           1262    5    postgres    DATABASE     p   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C.UTF-8';
    DROP DATABASE postgres;
                postgres    false                       0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    4874                       0    0    DATABASE postgres    ACL     2   GRANT ALL ON DATABASE postgres TO dashboard_user;
                   postgres    false    4874            -            2615    17049 
   _analytics    SCHEMA        CREATE SCHEMA _analytics;
    DROP SCHEMA _analytics;
                postgres    false                        2615    17050 	   _realtime    SCHEMA        CREATE SCHEMA _realtime;
    DROP SCHEMA _realtime;
                postgres    false            "            2615    16457    auth    SCHEMA        CREATE SCHEMA auth;
    DROP SCHEMA auth;
                supabase_admin    false                       0    0    SCHEMA auth    ACL        GRANT USAGE ON SCHEMA auth TO anon;
GRANT USAGE ON SCHEMA auth TO authenticated;
GRANT USAGE ON SCHEMA auth TO service_role;
GRANT ALL ON SCHEMA auth TO supabase_auth_admin;
GRANT ALL ON SCHEMA auth TO dashboard_user;
GRANT ALL ON SCHEMA auth TO postgres;
                   supabase_admin    false    34                        2615    16391 
   extensions    SCHEMA        CREATE SCHEMA extensions;
    DROP SCHEMA extensions;
                postgres    false                       0    0    SCHEMA extensions    ACL     �   GRANT USAGE ON SCHEMA extensions TO anon;
GRANT USAGE ON SCHEMA extensions TO authenticated;
GRANT USAGE ON SCHEMA extensions TO service_role;
GRANT ALL ON SCHEMA extensions TO dashboard_user;
                   postgres    false    31                        3079    29328    pg_cron 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS pg_cron WITH SCHEMA extensions;
    DROP EXTENSION pg_cron;
                   false    31                       0    0    EXTENSION pg_cron    COMMENT     @   COMMENT ON EXTENSION pg_cron IS 'Job scheduler for PostgreSQL';
                        false    2            &            2615    16686    graphql    SCHEMA        CREATE SCHEMA graphql;
    DROP SCHEMA graphql;
                supabase_admin    false            $            2615    16675    graphql_public    SCHEMA        CREATE SCHEMA graphql_public;
    DROP SCHEMA graphql_public;
                supabase_admin    false                       0    0    SCHEMA graphql_public    ACL     �   GRANT USAGE ON SCHEMA graphql_public TO postgres;
GRANT USAGE ON SCHEMA graphql_public TO anon;
GRANT USAGE ON SCHEMA graphql_public TO authenticated;
GRANT USAGE ON SCHEMA graphql_public TO service_role;
                   supabase_admin    false    36                        3079    16565    pg_net 	   EXTENSION     >   CREATE EXTENSION IF NOT EXISTS pg_net WITH SCHEMA extensions;
    DROP EXTENSION pg_net;
                   false    31                       0    0    EXTENSION pg_net    COMMENT     -   COMMENT ON EXTENSION pg_net IS 'Async HTTP';
                        false    4                       0    0 
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
                   false    41                       0    0    EXTENSION pgsodium    COMMENT     \   COMMENT ON EXTENSION pgsodium IS 'Pgsodium is a modern cryptography library for Postgres.';
                        false    9                       0    0    SCHEMA public    ACL     �   GRANT USAGE ON SCHEMA public TO postgres;
GRANT USAGE ON SCHEMA public TO anon;
GRANT USAGE ON SCHEMA public TO authenticated;
GRANT USAGE ON SCHEMA public TO service_role;
                   pg_database_owner    false    16            A            2615    16667    realtime    SCHEMA        CREATE SCHEMA realtime;
    DROP SCHEMA realtime;
                supabase_admin    false                       0    0    SCHEMA realtime    ACL     ,   GRANT USAGE ON SCHEMA realtime TO postgres;
                   supabase_admin    false    65                         2615    16505    storage    SCHEMA        CREATE SCHEMA storage;
    DROP SCHEMA storage;
                supabase_admin    false                       0    0    SCHEMA storage    ACL       GRANT ALL ON SCHEMA storage TO postgres;
GRANT USAGE ON SCHEMA storage TO anon;
GRANT USAGE ON SCHEMA storage TO authenticated;
GRANT USAGE ON SCHEMA storage TO service_role;
GRANT ALL ON SCHEMA storage TO supabase_storage_admin;
GRANT ALL ON SCHEMA storage TO dashboard_user;
                   supabase_admin    false    32                        2615    16608    supabase_functions    SCHEMA     "   CREATE SCHEMA supabase_functions;
     DROP SCHEMA supabase_functions;
                supabase_admin    false                       0    0    SCHEMA supabase_functions    ACL     !  GRANT USAGE ON SCHEMA supabase_functions TO postgres;
GRANT USAGE ON SCHEMA supabase_functions TO anon;
GRANT USAGE ON SCHEMA supabase_functions TO authenticated;
GRANT USAGE ON SCHEMA supabase_functions TO service_role;
GRANT ALL ON SCHEMA supabase_functions TO supabase_functions_admin;
                   supabase_admin    false    28            ,            2615    17017    vault    SCHEMA        CREATE SCHEMA vault;
    DROP SCHEMA vault;
                supabase_admin    false                        3079    16702 
   pg_graphql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS pg_graphql WITH SCHEMA graphql;
    DROP EXTENSION pg_graphql;
                   false    38                       0    0    EXTENSION pg_graphql    COMMENT     B   COMMENT ON EXTENSION pg_graphql IS 'pg_graphql: GraphQL support';
                        false    8                        3079    16633    pg_stat_statements 	   EXTENSION     J   CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA extensions;
 #   DROP EXTENSION pg_stat_statements;
                   false    31                       0    0    EXTENSION pg_stat_statements    COMMENT     u   COMMENT ON EXTENSION pg_stat_statements IS 'track planning and execution statistics of all SQL statements executed';
                        false    3                        3079    16403    pgcrypto 	   EXTENSION     @   CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA extensions;
    DROP EXTENSION pgcrypto;
                   false    31                       0    0    EXTENSION pgcrypto    COMMENT     <   COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';
                        false    6                        3079    16440    pgjwt 	   EXTENSION     =   CREATE EXTENSION IF NOT EXISTS pgjwt WITH SCHEMA extensions;
    DROP EXTENSION pgjwt;
                   false    6    31                       0    0    EXTENSION pgjwt    COMMENT     C   COMMENT ON EXTENSION pgjwt IS 'JSON Web Token API for Postgresql';
                        false    5            
            3079    17018    supabase_vault 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS supabase_vault WITH SCHEMA vault;
    DROP EXTENSION supabase_vault;
                   false    44    9                       0    0    EXTENSION supabase_vault    COMMENT     C   COMMENT ON EXTENSION supabase_vault IS 'Supabase Vault Extension';
                        false    10                        3079    16392 	   uuid-ossp 	   EXTENSION     C   CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA extensions;
    DROP EXTENSION "uuid-ossp";
                   false    31                       0    0    EXTENSION "uuid-ossp"    COMMENT     W   COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';
                        false    7            (           1247    17696 	   aal_level    TYPE     K   CREATE TYPE auth.aal_level AS ENUM (
    'aal1',
    'aal2',
    'aal3'
);
    DROP TYPE auth.aal_level;
       auth          supabase_auth_admin    false    34            @           1247    17837    code_challenge_method    TYPE     L   CREATE TYPE auth.code_challenge_method AS ENUM (
    's256',
    'plain'
);
 &   DROP TYPE auth.code_challenge_method;
       auth          supabase_auth_admin    false    34            %           1247    17690    factor_status    TYPE     M   CREATE TYPE auth.factor_status AS ENUM (
    'unverified',
    'verified'
);
    DROP TYPE auth.factor_status;
       auth          supabase_auth_admin    false    34            "           1247    17685    factor_type    TYPE     E   CREATE TYPE auth.factor_type AS ENUM (
    'totp',
    'webauthn'
);
    DROP TYPE auth.factor_type;
       auth          supabase_auth_admin    false    34            |           1247    225045    answer_type    TYPE     R   CREATE TYPE public.answer_type AS (
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
       realtime          supabase_admin    false    65    1678            �           1247    53214 
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
       auth          supabase_auth_admin    false    34                       0    0    FUNCTION email()    COMMENT     X   COMMENT ON FUNCTION auth.email() IS 'Deprecated. Use auth.jwt() -> ''email'' instead.';
          auth          supabase_auth_admin    false    496                       0    0    FUNCTION email()    ACL     6   GRANT ALL ON FUNCTION auth.email() TO dashboard_user;
          auth          supabase_auth_admin    false    496            �           1255    17667    jwt()    FUNCTION     �   CREATE FUNCTION auth.jwt() RETURNS jsonb
    LANGUAGE sql STABLE
    AS $$
  select 
    coalesce(
        nullif(current_setting('request.jwt.claim', true), ''),
        nullif(current_setting('request.jwt.claims', true), '')
    )::jsonb
$$;
    DROP FUNCTION auth.jwt();
       auth          supabase_auth_admin    false    34                        0    0    FUNCTION jwt()    ACL     b   GRANT ALL ON FUNCTION auth.jwt() TO postgres;
GRANT ALL ON FUNCTION auth.jwt() TO dashboard_user;
          auth          supabase_auth_admin    false    719            #           1255    16502    role()    FUNCTION        CREATE FUNCTION auth.role() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.role', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'role')
  )::text
$$;
    DROP FUNCTION auth.role();
       auth          supabase_auth_admin    false    34            !           0    0    FUNCTION role()    COMMENT     V   COMMENT ON FUNCTION auth.role() IS 'Deprecated. Use auth.jwt() -> ''role'' instead.';
          auth          supabase_auth_admin    false    547            "           0    0    FUNCTION role()    ACL     5   GRANT ALL ON FUNCTION auth.role() TO dashboard_user;
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
       auth          supabase_auth_admin    false    34            #           0    0    FUNCTION uid()    COMMENT     T   COMMENT ON FUNCTION auth.uid() IS 'Deprecated. Use auth.jwt() -> ''sub'' instead.';
          auth          supabase_auth_admin    false    493            $           0    0    FUNCTION uid()    ACL     4   GRANT ALL ON FUNCTION auth.uid() TO dashboard_user;
          auth          supabase_auth_admin    false    493            %           0    0    FUNCTION job_cache_invalidate()    ACL     Q   GRANT ALL ON FUNCTION cron.job_cache_invalidate() TO postgres WITH GRANT OPTION;
          cron          supabase_admin    false    745            &           0    0 .   FUNCTION schedule(schedule text, command text)    ACL     `   GRANT ALL ON FUNCTION cron.schedule(schedule text, command text) TO postgres WITH GRANT OPTION;
          cron          supabase_admin    false    743            '           0    0 =   FUNCTION schedule(job_name text, schedule text, command text)    ACL     o   GRANT ALL ON FUNCTION cron.schedule(job_name text, schedule text, command text) TO postgres WITH GRANT OPTION;
          cron          supabase_admin    false    747            (           0    0 "   FUNCTION unschedule(job_id bigint)    ACL     T   GRANT ALL ON FUNCTION cron.unschedule(job_id bigint) TO postgres WITH GRANT OPTION;
          cron          supabase_admin    false    744            )           0    0 "   FUNCTION unschedule(job_name name)    ACL     T   GRANT ALL ON FUNCTION cron.unschedule(job_name name) TO postgres WITH GRANT OPTION;
          cron          supabase_admin    false    746            *           0    0 D   FUNCTION algorithm_sign(signables text, secret text, algorithm text)    ACL     Y  REVOKE ALL ON FUNCTION extensions.algorithm_sign(signables text, secret text, algorithm text) FROM postgres;
GRANT ALL ON FUNCTION extensions.algorithm_sign(signables text, secret text, algorithm text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.algorithm_sign(signables text, secret text, algorithm text) TO dashboard_user;
       
   extensions          postgres    false    525            +           0    0    FUNCTION armor(bytea)    ACL     �   REVOKE ALL ON FUNCTION extensions.armor(bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.armor(bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.armor(bytea) TO dashboard_user;
       
   extensions          postgres    false    583            ,           0    0 %   FUNCTION armor(bytea, text[], text[])    ACL     �   REVOKE ALL ON FUNCTION extensions.armor(bytea, text[], text[]) FROM postgres;
GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO dashboard_user;
       
   extensions          postgres    false    584            -           0    0    FUNCTION crypt(text, text)    ACL     �   REVOKE ALL ON FUNCTION extensions.crypt(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.crypt(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.crypt(text, text) TO dashboard_user;
       
   extensions          postgres    false    543            .           0    0    FUNCTION dearmor(text)    ACL     �   REVOKE ALL ON FUNCTION extensions.dearmor(text) FROM postgres;
GRANT ALL ON FUNCTION extensions.dearmor(text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.dearmor(text) TO dashboard_user;
       
   extensions          postgres    false    586            /           0    0 $   FUNCTION decrypt(bytea, bytea, text)    ACL     �   REVOKE ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO dashboard_user;
       
   extensions          postgres    false    490            0           0    0 .   FUNCTION decrypt_iv(bytea, bytea, bytea, text)    ACL       REVOKE ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;
       
   extensions          postgres    false    486            1           0    0    FUNCTION digest(bytea, text)    ACL     �   REVOKE ALL ON FUNCTION extensions.digest(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO dashboard_user;
       
   extensions          postgres    false    540            2           0    0    FUNCTION digest(text, text)    ACL     �   REVOKE ALL ON FUNCTION extensions.digest(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.digest(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.digest(text, text) TO dashboard_user;
       
   extensions          postgres    false    473            3           0    0 $   FUNCTION encrypt(bytea, bytea, text)    ACL     �   REVOKE ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO dashboard_user;
       
   extensions          postgres    false    489            4           0    0 .   FUNCTION encrypt_iv(bytea, bytea, bytea, text)    ACL       REVOKE ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;
       
   extensions          postgres    false    491            5           0    0 "   FUNCTION gen_random_bytes(integer)    ACL     �   REVOKE ALL ON FUNCTION extensions.gen_random_bytes(integer) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO dashboard_user;
       
   extensions          postgres    false    488            6           0    0    FUNCTION gen_random_uuid()    ACL     �   REVOKE ALL ON FUNCTION extensions.gen_random_uuid() FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO dashboard_user;
       
   extensions          postgres    false    492            7           0    0    FUNCTION gen_salt(text)    ACL     �   REVOKE ALL ON FUNCTION extensions.gen_salt(text) FROM postgres;
GRANT ALL ON FUNCTION extensions.gen_salt(text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_salt(text) TO dashboard_user;
       
   extensions          postgres    false    544            8           0    0     FUNCTION gen_salt(text, integer)    ACL     �   REVOKE ALL ON FUNCTION extensions.gen_salt(text, integer) FROM postgres;
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
   extensions          postgres    false    31            9           0    0    FUNCTION grant_pg_cron_access()    COMMENT     U   COMMENT ON FUNCTION extensions.grant_pg_cron_access() IS 'Grants access to pg_cron';
       
   extensions          postgres    false    710            :           0    0    FUNCTION grant_pg_cron_access()    ACL     �   REVOKE ALL ON FUNCTION extensions.grant_pg_cron_access() FROM postgres;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO dashboard_user;
       
   extensions          postgres    false    710            /           1255    16680    grant_pg_graphql_access()    FUNCTION     j  CREATE FUNCTION extensions.grant_pg_graphql_access() RETURNS event_trigger
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
   extensions          supabase_admin    false    31            ;           0    0 "   FUNCTION grant_pg_graphql_access()    COMMENT     [   COMMENT ON FUNCTION extensions.grant_pg_graphql_access() IS 'Grants access to pg_graphql';
       
   extensions          supabase_admin    false    559            <           0    0 "   FUNCTION grant_pg_graphql_access()    ACL     Z   GRANT ALL ON FUNCTION extensions.grant_pg_graphql_access() TO postgres WITH GRANT OPTION;
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
   extensions          postgres    false    31            =           0    0    FUNCTION grant_pg_net_access()    COMMENT     S   COMMENT ON FUNCTION extensions.grant_pg_net_access() IS 'Grants access to pg_net';
       
   extensions          postgres    false    526            >           0    0    FUNCTION grant_pg_net_access()    ACL     �   REVOKE ALL ON FUNCTION extensions.grant_pg_net_access() FROM postgres;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO dashboard_user;
       
   extensions          postgres    false    526            ?           0    0 !   FUNCTION hmac(bytea, bytea, text)    ACL     �   REVOKE ALL ON FUNCTION extensions.hmac(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO dashboard_user;
       
   extensions          postgres    false    542            @           0    0    FUNCTION hmac(text, text, text)    ACL     �   REVOKE ALL ON FUNCTION extensions.hmac(text, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO dashboard_user;
       
   extensions          postgres    false    541            A           0    0 U  FUNCTION pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT blk_read_time double precision, OUT blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision)    ACL     �  GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT blk_read_time double precision, OUT blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision) TO postgres WITH GRANT OPTION;
       
   extensions          supabase_admin    false    529            B           0    0 ^   FUNCTION pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone)    ACL     �   GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO postgres WITH GRANT OPTION;
       
   extensions          supabase_admin    false    528            C           0    0 G   FUNCTION pg_stat_statements_reset(userid oid, dbid oid, queryid bigint)    ACL        GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint) TO postgres WITH GRANT OPTION;
       
   extensions          supabase_admin    false    527            D           0    0 >   FUNCTION pgp_armor_headers(text, OUT key text, OUT value text)    ACL     G  REVOKE ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO dashboard_user;
       
   extensions          postgres    false    587            E           0    0    FUNCTION pgp_key_id(bytea)    ACL     �   REVOKE ALL ON FUNCTION extensions.pgp_key_id(bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO dashboard_user;
       
   extensions          postgres    false    582            F           0    0 &   FUNCTION pgp_pub_decrypt(bytea, bytea)    ACL     �   REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO dashboard_user;
       
   extensions          postgres    false    714            G           0    0 ,   FUNCTION pgp_pub_decrypt(bytea, bytea, text)    ACL       REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO dashboard_user;
       
   extensions          postgres    false    716            H           0    0 2   FUNCTION pgp_pub_decrypt(bytea, bytea, text, text)    ACL     #  REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO dashboard_user;
       
   extensions          postgres    false    718            I           0    0 ,   FUNCTION pgp_pub_decrypt_bytea(bytea, bytea)    ACL       REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO dashboard_user;
       
   extensions          postgres    false    715            J           0    0 2   FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text)    ACL     #  REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO dashboard_user;
       
   extensions          postgres    false    717            K           0    0 8   FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text, text)    ACL     5  REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO dashboard_user;
       
   extensions          postgres    false    581            L           0    0 %   FUNCTION pgp_pub_encrypt(text, bytea)    ACL     �   REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO dashboard_user;
       
   extensions          postgres    false    535            M           0    0 +   FUNCTION pgp_pub_encrypt(text, bytea, text)    ACL       REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO dashboard_user;
       
   extensions          postgres    false    712            N           0    0 ,   FUNCTION pgp_pub_encrypt_bytea(bytea, bytea)    ACL       REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO dashboard_user;
       
   extensions          postgres    false    711            O           0    0 2   FUNCTION pgp_pub_encrypt_bytea(bytea, bytea, text)    ACL     #  REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO dashboard_user;
       
   extensions          postgres    false    713            P           0    0 %   FUNCTION pgp_sym_decrypt(bytea, text)    ACL     �   REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO dashboard_user;
       
   extensions          postgres    false    531            Q           0    0 +   FUNCTION pgp_sym_decrypt(bytea, text, text)    ACL       REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO dashboard_user;
       
   extensions          postgres    false    533            R           0    0 +   FUNCTION pgp_sym_decrypt_bytea(bytea, text)    ACL       REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO dashboard_user;
       
   extensions          postgres    false    532            S           0    0 1   FUNCTION pgp_sym_decrypt_bytea(bytea, text, text)    ACL        REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO dashboard_user;
       
   extensions          postgres    false    534            T           0    0 $   FUNCTION pgp_sym_encrypt(text, text)    ACL     �   REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO dashboard_user;
       
   extensions          postgres    false    546            U           0    0 *   FUNCTION pgp_sym_encrypt(text, text, text)    ACL       REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO dashboard_user;
       
   extensions          postgres    false    596            V           0    0 +   FUNCTION pgp_sym_encrypt_bytea(bytea, text)    ACL       REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO dashboard_user;
       
   extensions          postgres    false    595            W           0    0 1   FUNCTION pgp_sym_encrypt_bytea(bytea, text, text)    ACL        REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) FROM postgres;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO dashboard_user;
       
   extensions          postgres    false    597            &           1255    16671    pgrst_ddl_watch()    FUNCTION     >  CREATE FUNCTION extensions.pgrst_ddl_watch() RETURNS event_trigger
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
   extensions          supabase_admin    false    31            X           0    0    FUNCTION pgrst_ddl_watch()    ACL     R   GRANT ALL ON FUNCTION extensions.pgrst_ddl_watch() TO postgres WITH GRANT OPTION;
       
   extensions          supabase_admin    false    550            V           1255    16672    pgrst_drop_watch()    FUNCTION       CREATE FUNCTION extensions.pgrst_drop_watch() RETURNS event_trigger
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
   extensions          supabase_admin    false    31            Y           0    0    FUNCTION pgrst_drop_watch()    ACL     S   GRANT ALL ON FUNCTION extensions.pgrst_drop_watch() TO postgres WITH GRANT OPTION;
       
   extensions          supabase_admin    false    598            )           1255    16682    set_graphql_placeholder()    FUNCTION     r  CREATE FUNCTION extensions.set_graphql_placeholder() RETURNS event_trigger
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
   extensions          supabase_admin    false    31            Z           0    0 "   FUNCTION set_graphql_placeholder()    COMMENT     |   COMMENT ON FUNCTION extensions.set_graphql_placeholder() IS 'Reintroduces placeholder function for graphql_public.graphql';
       
   extensions          supabase_admin    false    553            [           0    0 "   FUNCTION set_graphql_placeholder()    ACL     Z   GRANT ALL ON FUNCTION extensions.set_graphql_placeholder() TO postgres WITH GRANT OPTION;
       
   extensions          supabase_admin    false    553            \           0    0 8   FUNCTION sign(payload json, secret text, algorithm text)    ACL     5  REVOKE ALL ON FUNCTION extensions.sign(payload json, secret text, algorithm text) FROM postgres;
GRANT ALL ON FUNCTION extensions.sign(payload json, secret text, algorithm text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.sign(payload json, secret text, algorithm text) TO dashboard_user;
       
   extensions          postgres    false    594            ]           0    0 "   FUNCTION try_cast_double(inp text)    ACL     �   REVOKE ALL ON FUNCTION extensions.try_cast_double(inp text) FROM postgres;
GRANT ALL ON FUNCTION extensions.try_cast_double(inp text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.try_cast_double(inp text) TO dashboard_user;
       
   extensions          postgres    false    517            ^           0    0    FUNCTION url_decode(data text)    ACL     �   REVOKE ALL ON FUNCTION extensions.url_decode(data text) FROM postgres;
GRANT ALL ON FUNCTION extensions.url_decode(data text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.url_decode(data text) TO dashboard_user;
       
   extensions          postgres    false    593            _           0    0    FUNCTION url_encode(data bytea)    ACL     �   REVOKE ALL ON FUNCTION extensions.url_encode(data bytea) FROM postgres;
GRANT ALL ON FUNCTION extensions.url_encode(data bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.url_encode(data bytea) TO dashboard_user;
       
   extensions          postgres    false    592            `           0    0    FUNCTION uuid_generate_v1()    ACL     �   REVOKE ALL ON FUNCTION extensions.uuid_generate_v1() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO dashboard_user;
       
   extensions          postgres    false    502            a           0    0    FUNCTION uuid_generate_v1mc()    ACL     �   REVOKE ALL ON FUNCTION extensions.uuid_generate_v1mc() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO dashboard_user;
       
   extensions          postgres    false    503            b           0    0 4   FUNCTION uuid_generate_v3(namespace uuid, name text)    ACL     )  REVOKE ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO dashboard_user;
       
   extensions          postgres    false    500            c           0    0    FUNCTION uuid_generate_v4()    ACL     �   REVOKE ALL ON FUNCTION extensions.uuid_generate_v4() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO dashboard_user;
       
   extensions          postgres    false    469            d           0    0 4   FUNCTION uuid_generate_v5(namespace uuid, name text)    ACL     )  REVOKE ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO dashboard_user;
       
   extensions          postgres    false    539            e           0    0    FUNCTION uuid_nil()    ACL     �   REVOKE ALL ON FUNCTION extensions.uuid_nil() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_nil() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_nil() TO dashboard_user;
       
   extensions          postgres    false    494            f           0    0    FUNCTION uuid_ns_dns()    ACL     �   REVOKE ALL ON FUNCTION extensions.uuid_ns_dns() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO dashboard_user;
       
   extensions          postgres    false    495            g           0    0    FUNCTION uuid_ns_oid()    ACL     �   REVOKE ALL ON FUNCTION extensions.uuid_ns_oid() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO dashboard_user;
       
   extensions          postgres    false    499            h           0    0    FUNCTION uuid_ns_url()    ACL     �   REVOKE ALL ON FUNCTION extensions.uuid_ns_url() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO dashboard_user;
       
   extensions          postgres    false    498            i           0    0    FUNCTION uuid_ns_x500()    ACL     �   REVOKE ALL ON FUNCTION extensions.uuid_ns_x500() FROM postgres;
GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO dashboard_user;
       
   extensions          postgres    false    501            j           0    0 8   FUNCTION verify(token text, secret text, algorithm text)    ACL     5  REVOKE ALL ON FUNCTION extensions.verify(token text, secret text, algorithm text) FROM postgres;
GRANT ALL ON FUNCTION extensions.verify(token text, secret text, algorithm text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.verify(token text, secret text, algorithm text) TO dashboard_user;
       
   extensions          postgres    false    518            k           0    0 U   FUNCTION graphql("operationName" text, query text, variables jsonb, extensions jsonb)    ACL       GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO postgres;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO anon;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO authenticated;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO service_role;
          graphql_public          supabase_admin    false    561            l           0    0 V   FUNCTION http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer)    ACL     _  REVOKE ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;
GRANT ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin;
GRANT ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO anon;
GRANT ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO authenticated;
GRANT ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO service_role;
          net          postgres    false    564            m           0    0 c   FUNCTION http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer)    ACL     �  REVOKE ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;
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
    	   pgbouncer          postgres    false    15            n           0    0 !   FUNCTION get_auth(p_usename text)    ACL     �   REVOKE ALL ON FUNCTION pgbouncer.get_auth(p_usename text) FROM PUBLIC;
GRANT ALL ON FUNCTION pgbouncer.get_auth(p_usename text) TO pgbouncer;
       	   pgbouncer          postgres    false    470            o           0    0 ]   FUNCTION crypto_aead_det_decrypt(message bytea, additional bytea, key_uuid uuid, nonce bytea)    ACL     �   GRANT ALL ON FUNCTION pgsodium.crypto_aead_det_decrypt(message bytea, additional bytea, key_uuid uuid, nonce bytea) TO service_role;
          pgsodium          pgsodium_keymaker    false    705            p           0    0 ]   FUNCTION crypto_aead_det_encrypt(message bytea, additional bytea, key_uuid uuid, nonce bytea)    ACL     �   GRANT ALL ON FUNCTION pgsodium.crypto_aead_det_encrypt(message bytea, additional bytea, key_uuid uuid, nonce bytea) TO service_role;
          pgsodium          pgsodium_keymaker    false    706            q           0    0 !   FUNCTION crypto_aead_det_keygen()    ACL     I   GRANT ALL ON FUNCTION pgsodium.crypto_aead_det_keygen() TO service_role;
          pgsodium          supabase_admin    false    699            �           1255    31071    addProjectOnCreate()    FUNCTION     �   CREATE FUNCTION public."addProjectOnCreate"() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$BEGIN INSERT INTO user_learning_projects (learning_project_id, user_id)
VALUES (NEW.id, auth.uid());
RETURN NEW;
END;$$;
 -   DROP FUNCTION public."addProjectOnCreate"();
       public          supabase_admin    false            r           0    0    FUNCTION "addProjectOnCreate"()    ACL     �   GRANT ALL ON FUNCTION public."addProjectOnCreate"() TO postgres;
GRANT ALL ON FUNCTION public."addProjectOnCreate"() TO authenticated;
GRANT ALL ON FUNCTION public."addProjectOnCreate"() TO service_role;
          public          supabase_admin    false    727            �           1255    85707    cleanup_rooms()    FUNCTION        CREATE FUNCTION public.cleanup_rooms() RETURNS void
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
       public          supabase_admin    false            s           0    0    FUNCTION cleanup_rooms()    ACL     �   GRANT ALL ON FUNCTION public.cleanup_rooms() TO postgres;
GRANT ALL ON FUNCTION public.cleanup_rooms() TO authenticated;
GRANT ALL ON FUNCTION public.cleanup_rooms() TO service_role;
          public          supabase_admin    false    739            �           1255    69636 =   create_room(bigint, integer, text, integer, integer, boolean)    FUNCTION     �  CREATE FUNCTION public.create_room(p_project_id bigint, p_code integer, p_name text, p_share_code integer, p_size integer, p_private boolean) RETURNS record
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
declare
    new_room rooms%rowtype;
begin
    -- check user is member of project
    if not exists (select 1
                   from user_learning_projects ulp
                   where learning_project_id = p_project_id
                     and user_id = auth.uid()) then
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
       public          supabase_admin    false            t           0    0    FUNCTION create_room(p_project_id bigint, p_code integer, p_name text, p_share_code integer, p_size integer, p_private boolean)    ACL     �  GRANT ALL ON FUNCTION public.create_room(p_project_id bigint, p_code integer, p_name text, p_share_code integer, p_size integer, p_private boolean) TO postgres;
GRANT ALL ON FUNCTION public.create_room(p_project_id bigint, p_code integer, p_name text, p_share_code integer, p_size integer, p_private boolean) TO anon;
GRANT ALL ON FUNCTION public.create_room(p_project_id bigint, p_code integer, p_name text, p_share_code integer, p_size integer, p_private boolean) TO authenticated;
GRANT ALL ON FUNCTION public.create_room(p_project_id bigint, p_code integer, p_name text, p_share_code integer, p_size integer, p_private boolean) TO service_role;
          public          supabase_admin    false    753            �           1255    225046 -   delete_answers_exercise(public.answer_type[])    FUNCTION       CREATE FUNCTION public.delete_answers_exercise(answers public.answer_type[]) RETURNS boolean
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
       public          supabase_admin    false    1660            u           0    0 >   FUNCTION delete_answers_exercise(answers public.answer_type[])    ACL     )  GRANT ALL ON FUNCTION public.delete_answers_exercise(answers public.answer_type[]) TO postgres;
GRANT ALL ON FUNCTION public.delete_answers_exercise(answers public.answer_type[]) TO authenticated;
GRANT ALL ON FUNCTION public.delete_answers_exercise(answers public.answer_type[]) TO service_role;
          public          supabase_admin    false    740            0           1255    52977    delete_friend(uuid)    FUNCTION     �  CREATE FUNCTION public.delete_friend(p_other_userid uuid) RETURNS boolean
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
       public          supabase_admin    false            v           0    0 +   FUNCTION delete_friend(p_other_userid uuid)    ACL     �   GRANT ALL ON FUNCTION public.delete_friend(p_other_userid uuid) TO postgres;
GRANT ALL ON FUNCTION public.delete_friend(p_other_userid uuid) TO authenticated;
GRANT ALL ON FUNCTION public.delete_friend(p_other_userid uuid) TO service_role;
          public          supabase_admin    false    560            Y           1255    30644    getUsername(uuid)    FUNCTION     �   CREATE FUNCTION public."getUsername"(user_id uuid) RETURNS text
    LANGUAGE sql STABLE SECURITY DEFINER
    AS $$select username from profiles where id=user_id$$;
 2   DROP FUNCTION public."getUsername"(user_id uuid);
       public          supabase_admin    false            w           0    0 $   FUNCTION "getUsername"(user_id uuid)    ACL     �   GRANT ALL ON FUNCTION public."getUsername"(user_id uuid) TO postgres;
GRANT ALL ON FUNCTION public."getUsername"(user_id uuid) TO authenticated;
GRANT ALL ON FUNCTION public."getUsername"(user_id uuid) TO service_role;
          public          supabase_admin    false    601            �           1255    241422    get_distinct_project_groups()    FUNCTION       CREATE FUNCTION public.get_distinct_project_groups() RETURNS TABLE("group" text)
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
       public          supabase_admin    false            x           0    0 &   FUNCTION get_distinct_project_groups()    ACL     %  GRANT ALL ON FUNCTION public.get_distinct_project_groups() TO postgres;
GRANT ALL ON FUNCTION public.get_distinct_project_groups() TO anon;
GRANT ALL ON FUNCTION public.get_distinct_project_groups() TO authenticated;
GRANT ALL ON FUNCTION public.get_distinct_project_groups() TO service_role;
          public          supabase_admin    false    742            =           1255    384140    get_global_statistics(uuid)    FUNCTION     Z  CREATE FUNCTION public.get_global_statistics(p_user_id uuid) RETURNS TABLE(count_projects bigint, count_exercises bigint, count_flashcards bigint, count_links bigint, count_documents bigint, count_photos bigint, total_time_spent_quiz bigint, total_time_spent_flashcards bigint, total_time_spent_whiteboard bigint)
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
       public          supabase_admin    false            y           0    0 .   FUNCTION get_global_statistics(p_user_id uuid)    ACL     E  GRANT ALL ON FUNCTION public.get_global_statistics(p_user_id uuid) TO postgres;
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
       public          supabase_admin    false            z           0    0 A   FUNCTION get_project_ratings(p_user_id uuid, p_project_id bigint)    ACL     �  GRANT ALL ON FUNCTION public.get_project_ratings(p_user_id uuid, p_project_id bigint) TO postgres;
GRANT ALL ON FUNCTION public.get_project_ratings(p_user_id uuid, p_project_id bigint) TO anon;
GRANT ALL ON FUNCTION public.get_project_ratings(p_user_id uuid, p_project_id bigint) TO authenticated;
GRANT ALL ON FUNCTION public.get_project_ratings(p_user_id uuid, p_project_id bigint) TO service_role;
          public          supabase_admin    false    757            �           1255    384830 $   get_project_statistics(uuid, bigint)    FUNCTION     r  CREATE FUNCTION public.get_project_statistics(p_user_id uuid, p_project_id bigint) RETURNS TABLE(count_links bigint, count_flashcards bigint, count_exercises bigint, count_documents bigint, count_photos bigint, project_stats json, global_rank bigint, friends_rank bigint)
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
       public          supabase_admin    false            {           0    0 D   FUNCTION get_project_statistics(p_user_id uuid, p_project_id bigint)    ACL     �  GRANT ALL ON FUNCTION public.get_project_statistics(p_user_id uuid, p_project_id bigint) TO postgres;
GRANT ALL ON FUNCTION public.get_project_statistics(p_user_id uuid, p_project_id bigint) TO anon;
GRANT ALL ON FUNCTION public.get_project_statistics(p_user_id uuid, p_project_id bigint) TO authenticated;
GRANT ALL ON FUNCTION public.get_project_statistics(p_user_id uuid, p_project_id bigint) TO service_role;
          public          supabase_admin    false    738            @           1255    400554    get_public_projects()    FUNCTION     �  CREATE FUNCTION public.get_public_projects() RETURNS TABLE(project_id bigint, project_name text, project_description text, project_created_at timestamp with time zone, project_tags text, project_owner_id uuid, project_is_published boolean, project_owner_name text, project_avg_rating numeric)
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
       public          supabase_admin    false            |           0    0    FUNCTION get_public_projects()    ACL       GRANT ALL ON FUNCTION public.get_public_projects() TO postgres;
GRANT ALL ON FUNCTION public.get_public_projects() TO anon;
GRANT ALL ON FUNCTION public.get_public_projects() TO authenticated;
GRANT ALL ON FUNCTION public.get_public_projects() TO service_role;
          public          supabase_admin    false    576            �           1255    399314    get_recommendations(uuid)    FUNCTION     =  CREATE FUNCTION public.get_recommendations(p_user_id uuid) RETURNS TABLE(project_id bigint, project_name text, project_description text, project_created_at timestamp with time zone, project_tags text, project_owner_id uuid, project_is_published boolean, project_owner_name text, project_avg_rating numeric)
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
            AND ulp.user_id != p_user_id
            AND lp.owner_id != p_user_id
            AND lp.tags IN (
                SELECT DISTINCT tag
                FROM (
                    SELECT UNNEST(string_to_array(user_tags, ',')) AS tag
                    FROM profiles
                    WHERE id = p_user_id

                    UNION ALL

                    SELECT UNNEST(string_to_array(lp.tags, ',')) AS tag
                    FROM learning_projects lp
                    JOIN user_learning_projects ulp ON lp.id = ulp.learning_project_id
                    WHERE ulp.user_id = p_user_id
                      AND lp.tags <> ''
                ) AS combined_tags
            )
        GROUP BY
            lp.id, pro.username
    ) AS recommendations
    ORDER BY
        recommendations.random_order DESC
    LIMIT 3) AS limited_recommendations
ORDER BY project_avg_rating DESC;

END;
$$;
 :   DROP FUNCTION public.get_recommendations(p_user_id uuid);
       public          supabase_admin    false            }           0    0 ,   FUNCTION get_recommendations(p_user_id uuid)    ACL     =  GRANT ALL ON FUNCTION public.get_recommendations(p_user_id uuid) TO postgres;
GRANT ALL ON FUNCTION public.get_recommendations(p_user_id uuid) TO anon;
GRANT ALL ON FUNCTION public.get_recommendations(p_user_id uuid) TO authenticated;
GRANT ALL ON FUNCTION public.get_recommendations(p_user_id uuid) TO service_role;
          public          supabase_admin    false    741            i           1255    53069    get_usernames(uuid[])    FUNCTION     �  CREATE FUNCTION public.get_usernames(user_ids uuid[]) RETURNS text[]
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
       public          supabase_admin    false            ~           0    0 '   FUNCTION get_usernames(user_ids uuid[])    ACL     �   GRANT ALL ON FUNCTION public.get_usernames(user_ids uuid[]) TO postgres;
GRANT ALL ON FUNCTION public.get_usernames(user_ids uuid[]) TO authenticated;
GRANT ALL ON FUNCTION public.get_usernames(user_ids uuid[]) TO service_role;
          public          supabase_admin    false    617            h           1255    36929    guard_learning_projects()    FUNCTION     v  CREATE FUNCTION public.guard_learning_projects() RETURNS trigger
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
       public          supabase_admin    false                       0    0 "   FUNCTION guard_learning_projects()    ACL       GRANT ALL ON FUNCTION public.guard_learning_projects() TO postgres;
GRANT ALL ON FUNCTION public.guard_learning_projects() TO anon;
GRANT ALL ON FUNCTION public.guard_learning_projects() TO authenticated;
GRANT ALL ON FUNCTION public.guard_learning_projects() TO service_role;
          public          supabase_admin    false    616            A           1255    45185    guard_profiles()    FUNCTION     j  CREATE FUNCTION public.guard_profiles() RETURNS trigger
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
          public          supabase_admin    false    577            �           1255    27608    handle_new_user()    FUNCTION     �   CREATE FUNCTION public.handle_new_user() RETURNS trigger
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
          public          supabase_admin    false    732            �           1255    53117 $   invite_user_to_project(bigint, uuid)    FUNCTION     U  CREATE FUNCTION public.invite_user_to_project(p_project_id bigint, p_other_user_id uuid) RETURNS void
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
          public          supabase_admin    false    725            '           1255    69332    join_room(uuid, bigint)    FUNCTION     �  CREATE FUNCTION public.join_room(p_room_id uuid, p_room_code bigint) RETURNS record
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
          public          supabase_admin    false    726            �           1255    69417    list_friends_ids_and_names()    FUNCTION     �  CREATE FUNCTION public.list_friends_ids_and_names() RETURNS TABLE(id uuid, username text)
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
          public          supabase_admin    false    731            o           1255    69542    list_room_members()    FUNCTION       CREATE FUNCTION public.list_room_members() RETURNS TABLE(id uuid, username text)
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
          public          supabase_admin    false    623            �           1255    69565    list_rooms()    FUNCTION     �  CREATE FUNCTION public.list_rooms() RETURNS TABLE(id uuid, name text, created_at timestamp with time zone, protected boolean, host uuid, hostname text, cursize integer, maxsize integer)
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
          public          supabase_admin    false    749            �           1255    69638    list_sets()    FUNCTION     �  CREATE FUNCTION public.list_sets() RETURNS TABLE(name text, id bigint, type smallint)
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
          public          supabase_admin    false    755            �           1255    69568    project_members(bigint)    FUNCTION     �  CREATE FUNCTION public.project_members(p_project_id bigint) RETURNS TABLE(user_id uuid, username text)
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
          public          supabase_admin    false    751            �           1259    26976    learning_projects    TABLE     �  CREATE TABLE public.learning_projects (
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
       public         heap    supabase_admin    false    493            �           0    0    TABLE learning_projects    COMMENT     Z   COMMENT ON TABLE public.learning_projects IS 'All the data learning projects consist of';
          public          supabase_admin    false    437            �           0    0     COLUMN learning_projects."group"    COMMENT     O   COMMENT ON COLUMN public.learning_projects."group" IS 'sommersemester xx etc';
          public          supabase_admin    false    437            �           0    0 %   COLUMN learning_projects.is_published    COMMENT     v   COMMENT ON COLUMN public.learning_projects.is_published IS 'if project is public allow play/create room and cloning';
          public          supabase_admin    false    437            �           0    0 !   COLUMN learning_projects.owner_id    COMMENT     k   COMMENT ON COLUMN public.learning_projects.owner_id IS 'project owner. cannot be set by client (trigger)';
          public          supabase_admin    false    437            �           0    0    TABLE learning_projects    ACL     �   GRANT ALL ON TABLE public.learning_projects TO postgres;
GRANT ALL ON TABLE public.learning_projects TO anon;
GRANT ALL ON TABLE public.learning_projects TO authenticated;
GRANT ALL ON TABLE public.learning_projects TO service_role;
          public          supabase_admin    false    437            I           1255    85704    public_projects()    FUNCTION     �   CREATE FUNCTION public.public_projects() RETURNS SETOF public.learning_projects
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
          public          supabase_admin    false    585            �           1255    126746    quick_join_room(bigint)    FUNCTION     K  CREATE FUNCTION public.quick_join_room(p_share_code bigint) RETURNS record
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
          public          supabase_admin    false    750            �           1255    53118 &   remove_user_from_project(bigint, uuid)    FUNCTION     X  CREATE FUNCTION public.remove_user_from_project(p_project_id bigint, p_other_user_id uuid) RETURNS void
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
          public          supabase_admin    false    728            �           1255    53319    search_user(text)    FUNCTION     �   CREATE FUNCTION public.search_user(search_query text) RETURNS record
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
          public          supabase_admin    false    752            �           1255    69666    track(text)    FUNCTION     y  CREATE FUNCTION public.track(p_key text) RETURNS void
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
          public          supabase_admin    false    472            �           1255    292310    transfer_project(text, bigint)    FUNCTION     �  CREATE FUNCTION public.transfer_project(p_owner_name text, p_project_id bigint) RETURNS void
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
          public          supabase_admin    false    754            �           1255    69412    update_last_updated()    FUNCTION     �   CREATE FUNCTION public.update_last_updated() RETURNS trigger
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
          public          supabase_admin    false    729            �           1255    135400    update_statistics()    FUNCTION     �   CREATE FUNCTION public.update_statistics() RETURNS trigger
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
          public          supabase_admin    false    756            �           1255    53207    apply_rls(jsonb, integer)    FUNCTION     �/  CREATE FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer DEFAULT (1024 * 1024)) RETURNS SETOF realtime.wal_rls
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
       realtime          supabase_admin    false    65    1672            �           0    0 7   FUNCTION apply_rls(wal jsonb, max_record_bytes integer)    ACL     �   GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO dashboard_user;
          realtime          supabase_admin    false    736            �           1255    53219 C   build_prepared_statement_sql(text, regclass, realtime.wal_column[])    FUNCTION     �  CREATE FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) RETURNS text
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
       realtime          supabase_admin    false    65    1675            �           0    0 s   FUNCTION build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[])    ACL     4  GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO postgres;
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
          realtime          supabase_admin    false    730            �           1255    53164 <   check_equality_op(realtime.equality_op, regtype, text, text)    FUNCTION     U  CREATE FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) RETURNS boolean
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
       realtime          supabase_admin    false    65    1678            �           0    0 Z   FUNCTION check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text)    ACL       GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO postgres;
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
       realtime          supabase_admin    false    65    1681    1675            �           0    0 j   FUNCTION is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[])    ACL     "  GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO postgres;
GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO dashboard_user;
          realtime          supabase_admin    false    735            �           1255    53226 *   list_changes(name, name, integer, integer)    FUNCTION     �  CREATE FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) RETURNS SETOF realtime.wal_rls
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
       realtime          supabase_admin    false    1672    65            �           0    0 f   FUNCTION list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer)    ACL       GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO postgres;
GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO dashboard_user;
          realtime          supabase_admin    false    737            �           1255    53163    quote_wal2json(regclass)    FUNCTION     �  CREATE FUNCTION realtime.quote_wal2json(entity regclass) RETURNS text
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
          realtime          supabase_admin    false    733            �           1255    53161    subscription_check_filters()    FUNCTION     <
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
          realtime          supabase_admin    false    734            �           1255    17924 *   can_insert_object(text, text, uuid, jsonb)    FUNCTION     �  CREATE FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) RETURNS void
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
          storage          supabase_storage_admin    false    487            �           1255    16548    filename(text)    FUNCTION     �   CREATE FUNCTION storage.filename(name text) RETURNS text
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
          storage          supabase_storage_admin    false    471            �           1255    16547    foldername(text)    FUNCTION     �   CREATE FUNCTION storage.foldername(name text) RETURNS text[]
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
          storage          supabase_storage_admin    false    485            �           1255    17911    get_size_by_bucket()    FUNCTION        CREATE FUNCTION storage.get_size_by_bucket() RETURNS TABLE(size bigint, bucket_id text)
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
       storage          supabase_storage_admin    false    32            �           1255    426692    update_files()    FUNCTION     �   CREATE FUNCTION storage.update_files() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    perform public.track('files');
    return new;
END;
$$;
 &   DROP FUNCTION storage.update_files();
       storage          supabase_admin    false    32            �           0    0    FUNCTION update_files()    ACL     �   GRANT ALL ON FUNCTION storage.update_files() TO postgres;
GRANT ALL ON FUNCTION storage.update_files() TO authenticated;
GRANT ALL ON FUNCTION storage.update_files() TO service_role;
          storage          supabase_admin    false    497            �           1255    17914    update_updated_at_column()    FUNCTION     �   CREATE FUNCTION storage.update_updated_at_column() RETURNS trigger
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
   _analytics          supabase_admin    false    45    403            �           0    0    billing_counts_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE _analytics.billing_counts_id_seq OWNED BY _analytics.billing_counts.id;
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
   _analytics          supabase_admin    false    401    45            �           0    0    endpoint_queries_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE _analytics.endpoint_queries_id_seq OWNED BY _analytics.endpoint_queries.id;
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
   _analytics          supabase_admin    false    379    45            �           0    0    oauth_access_tokens_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE _analytics.oauth_access_tokens_id_seq OWNED BY _analytics.oauth_access_tokens.id;
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
   _analytics          supabase_admin    false    409    45            �           0    0    partner_users_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE _analytics.partner_users_id_seq OWNED BY _analytics.partner_users.id;
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
   _analytics          supabase_admin    false    397    45            �           0    0    payment_methods_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE _analytics.payment_methods_id_seq OWNED BY _analytics.payment_methods.id;
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
   _analytics          supabase_admin    false    391    45            �           0    0    saved_search_counters_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE _analytics.saved_search_counters_id_seq OWNED BY _analytics.saved_search_counters.id;
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
   _analytics          supabase_admin    false    383    45            �           0    0    saved_searches_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE _analytics.saved_searches_id_seq OWNED BY _analytics.saved_searches.id;
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
   _analytics          supabase_admin    false    45    405            �           0    0    source_backends_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE _analytics.source_backends_id_seq OWNED BY _analytics.source_backends.id;
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
   _analytics          supabase_admin    false    45    371            �           0    0    sources_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE _analytics.sources_id_seq OWNED BY _analytics.sources.id;
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
   _analytics          supabase_admin    false    45    381            �           0    0    system_metrics_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE _analytics.system_metrics_id_seq OWNED BY _analytics.system_metrics.id;
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
   _analytics          supabase_admin    false    45    385            �           0    0    teams_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE _analytics.teams_id_seq OWNED BY _analytics.teams.id;
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
   _analytics          supabase_admin    false    45    399            �           0    0    vercel_auths_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE _analytics.vercel_auths_id_seq OWNED BY _analytics.vercel_auths.id;
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
       auth         heap    supabase_auth_admin    false    34    1600            �           0    0    TABLE flow_state    COMMENT     G   COMMENT ON TABLE auth.flow_state IS 'stores metadata for pkce logins';
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
       auth         heap    supabase_auth_admin    false    1570    34    1573            �           0    0    TABLE mfa_factors    COMMENT     L   COMMENT ON TABLE auth.mfa_factors IS 'auth: stores metadata about factors';
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
       auth          supabase_auth_admin    false    34    334            �           0    0    refresh_tokens_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE auth.refresh_tokens_id_seq OWNED BY auth.refresh_tokens.id;
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
       auth         heap    supabase_auth_admin    false    34    1576            �           0    0    TABLE sessions    COMMENT     U   COMMENT ON TABLE auth.sessions IS 'Auth: Stores session data associated to a user.';
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
            public          supabase_admin    false    443            �           0    0    SEQUENCE lp_links_id_seq    ACL     �   GRANT ALL ON SEQUENCE public.lp_links_id_seq TO postgres;
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
       public         heap    supabase_admin    false            �           0    0    TABLE player_answers    COMMENT     P   COMMENT ON TABLE public.player_answers IS 'submitted player answers for games';
          public          supabase_admin    false    465            �           0    0    COLUMN player_answers.round    COMMENT     :   COMMENT ON COLUMN public.player_answers.round IS '1...n';
          public          supabase_admin    false    465            �           0    0 !   COLUMN player_answers.answered_at    COMMENT     O   COMMENT ON COLUMN public.player_answers.answered_at IS 'unix timestamp in ms';
          public          supabase_admin    false    465            �           0    0 !   COLUMN player_answers.answer_time    COMMENT     H   COMMENT ON COLUMN public.player_answers.answer_time IS 'in ms. needed';
          public          supabase_admin    false    465            �           0    0    TABLE player_answers    ACL     �   GRANT ALL ON TABLE public.player_answers TO postgres;
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
       public         heap    supabase_admin    false            �           0    0    TABLE private_room_states    COMMENT     e   COMMENT ON TABLE public.private_room_states IS 'quiz/answers data. user answers. hidden from users';
          public          supabase_admin    false    457            �           0    0    COLUMN private_room_states.data    COMMENT     =   COMMENT ON COLUMN public.private_room_states.data IS 'json';
          public          supabase_admin    false    457            �           0    0    TABLE private_room_states    ACL     �   GRANT ALL ON TABLE public.private_room_states TO postgres;
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
       public         heap    supabase_admin    false            �           0    0    COLUMN profiles.room_id    COMMENT     M   COMMENT ON COLUMN public.profiles.room_id IS 'user is in room (is guarded)';
          public          supabase_admin    false    432            �           0    0    COLUMN profiles.user_tags    COMMENT     �   COMMENT ON COLUMN public.profiles.user_tags IS 'DELETE THIS List of tags associated with the user that represent his interests.';
          public          supabase_admin    false    432                        0    0    TABLE profiles    ACL     �   GRANT ALL ON TABLE public.profiles TO postgres;
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
       public         heap    supabase_admin    false                       0    0    TABLE project_ratings    ACL     �   GRANT ALL ON TABLE public.project_ratings TO postgres;
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
            public          supabase_admin    false    452                       0    0    SEQUENCE project_ratings_id_seq    ACL     	  GRANT ALL ON SEQUENCE public.project_ratings_id_seq TO postgres;
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
       public         heap    supabase_admin    false                       0    0    TABLE public_room_states    COMMENT     X   COMMENT ON TABLE public.public_room_states IS 'what game, timer, players can see this';
          public          supabase_admin    false    456                       0    0    COLUMN public_room_states.data    COMMENT     ^   COMMENT ON COLUMN public.public_room_states.data IS 'public state. use db functions to edit';
          public          supabase_admin    false    456                       0    0    TABLE public_room_states    ACL     �   GRANT ALL ON TABLE public.public_room_states TO postgres;
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
       public         heap    supabase_admin    false                       0    0    TABLE queue    COMMENT     2   COMMENT ON TABLE public.queue IS 'queue for ipc';
          public          supabase_admin    false    467                       0    0    COLUMN queue.data    COMMENT     4   COMMENT ON COLUMN public.queue.data IS 'parameter';
          public          supabase_admin    false    467                       0    0    TABLE queue    ACL     �   GRANT ALL ON TABLE public.queue TO postgres;
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
    CONSTRAINT rooms_max_size_check CHECK (((max_size > 0) AND (max_size <= 100))),
    CONSTRAINT rooms_share_code_check CHECK (((share_code >= 0) AND (share_code < 999999)))
);
    DROP TABLE public.rooms;
       public         heap    supabase_admin    false            	           0    0    COLUMN rooms.code    COMMENT     >   COMMENT ON COLUMN public.rooms.code IS 'password protection';
          public          supabase_admin    false    446            
           0    0    COLUMN rooms.secret_key    COMMENT     D   COMMENT ON COLUMN public.rooms.secret_key IS 'realtime channel id';
          public          supabase_admin    false    446                       0    0    COLUMN rooms.is_ingame    COMMENT     K   COMMENT ON COLUMN public.rooms.is_ingame IS 'lobby already active/closed';
          public          supabase_admin    false    446                       0    0    COLUMN rooms.max_size    COMMENT     <   COMMENT ON COLUMN public.rooms.max_size IS 'max room size';
          public          supabase_admin    false    446                       0    0    COLUMN rooms.is_private    COMMENT     =   COMMENT ON COLUMN public.rooms.is_private IS 'friends only';
          public          supabase_admin    false    446                       0    0    COLUMN rooms.share_code    COMMENT     R   COMMENT ON COLUMN public.rooms.share_code IS 'shareable code to quick join room';
          public          supabase_admin    false    446                       0    0    TABLE rooms    ACL     �   GRANT ALL ON TABLE public.rooms TO postgres;
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
       public         heap    supabase_admin    false                       0    0 
   TABLE sets    COMMENT     >   COMMENT ON TABLE public.sets IS 'flashcard or exercise sets';
          public          supabase_admin    false    454                       0    0 
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
            public          supabase_admin    false    454                       0    0    SEQUENCE sets_id_seq    ACL     �   GRANT ALL ON SEQUENCE public.sets_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.sets_id_seq TO anon;
GRANT ALL ON SEQUENCE public.sets_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.sets_id_seq TO service_role;
          public          supabase_admin    false    455            �           1259    69388    tracker    TABLE     �   CREATE TABLE public.tracker (
    key text NOT NULL,
    last_updated timestamp with time zone
);

ALTER TABLE ONLY public.tracker REPLICA IDENTITY FULL;
    DROP TABLE public.tracker;
       public         heap    supabase_admin    false                       0    0    TABLE tracker    ACL     �   GRANT ALL ON TABLE public.tracker TO postgres;
GRANT ALL ON TABLE public.tracker TO anon;
GRANT ALL ON TABLE public.tracker TO authenticated;
GRANT ALL ON TABLE public.tracker TO service_role;
          public          supabase_admin    false    464            �           1259    26864    user_achievements    TABLE     �   CREATE TABLE public.user_achievements (
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    achievement_id bigint NOT NULL,
    user_id uuid NOT NULL
);
 %   DROP TABLE public.user_achievements;
       public         heap    supabase_admin    false                       0    0    TABLE user_achievements    COMMENT     W   COMMENT ON TABLE public.user_achievements IS 'All the achievements the user has got.';
          public          supabase_admin    false    434                       0    0    TABLE user_achievements    ACL     �   GRANT ALL ON TABLE public.user_achievements TO postgres;
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
       public         heap    supabase_admin    false                       0    0    TABLE user_learning_projects    ACL     �   GRANT ALL ON TABLE public.user_learning_projects TO postgres;
GRANT ALL ON TABLE public.user_learning_projects TO anon;
GRANT ALL ON TABLE public.user_learning_projects TO authenticated;
GRANT ALL ON TABLE public.user_learning_projects TO service_role;
          public          supabase_admin    false    447            �           1259    53126    schema_migrations    TABLE     y   CREATE TABLE realtime.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);
 '   DROP TABLE realtime.schema_migrations;
       realtime         heap    supabase_admin    false    65                       0    0    TABLE schema_migrations    ACL     |   GRANT ALL ON TABLE realtime.schema_migrations TO postgres;
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
       realtime         heap    supabase_admin    false    1681    734    65    1681                       0    0    TABLE subscription    ACL     r   GRANT ALL ON TABLE realtime.subscription TO postgres;
GRANT ALL ON TABLE realtime.subscription TO dashboard_user;
          realtime          supabase_admin    false    461            �           1259    53148    subscription_id_seq    SEQUENCE     �   ALTER TABLE realtime.subscription ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME realtime.subscription_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            realtime          supabase_admin    false    461    65                       0    0    SEQUENCE subscription_id_seq    ACL     �   GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO postgres;
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
       storage         heap    supabase_storage_admin    false    32                       0    0    TABLE buckets    ACL     �   GRANT ALL ON TABLE storage.buckets TO anon;
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
       storage         heap    supabase_storage_admin    false    32                       0    0    TABLE migrations    ACL     �   GRANT ALL ON TABLE storage.migrations TO anon;
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
       storage         heap    supabase_storage_admin    false    7    31    32                       0    0    TABLE objects    ACL     �   GRANT ALL ON TABLE storage.objects TO anon;
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
       supabase_functions         heap    supabase_functions_admin    false    28                       0    0    TABLE hooks    COMMENT     k   COMMENT ON TABLE supabase_functions.hooks IS 'Supabase Functions Hooks: Audit trail for triggered hooks.';
          supabase_functions          supabase_functions_admin    false    348                       0    0    TABLE hooks    ACL     �   GRANT ALL ON TABLE supabase_functions.hooks TO anon;
GRANT ALL ON TABLE supabase_functions.hooks TO authenticated;
GRANT ALL ON TABLE supabase_functions.hooks TO service_role;
          supabase_functions          supabase_functions_admin    false    348            [           1259    16620    hooks_id_seq    SEQUENCE     �   CREATE SEQUENCE supabase_functions.hooks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE supabase_functions.hooks_id_seq;
       supabase_functions          supabase_functions_admin    false    348    28                       0    0    hooks_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE supabase_functions.hooks_id_seq OWNED BY supabase_functions.hooks.id;
          supabase_functions          supabase_functions_admin    false    347                        0    0    SEQUENCE hooks_id_seq    ACL     �   GRANT ALL ON SEQUENCE supabase_functions.hooks_id_seq TO anon;
GRANT ALL ON SEQUENCE supabase_functions.hooks_id_seq TO authenticated;
GRANT ALL ON SEQUENCE supabase_functions.hooks_id_seq TO service_role;
          supabase_functions          supabase_functions_admin    false    347            Z           1259    16612 
   migrations    TABLE     �   CREATE TABLE supabase_functions.migrations (
    version text NOT NULL,
    inserted_at timestamp with time zone DEFAULT now() NOT NULL
);
 *   DROP TABLE supabase_functions.migrations;
       supabase_functions         heap    supabase_functions_admin    false    28            !           0    0    TABLE migrations    ACL     �   GRANT ALL ON TABLE supabase_functions.migrations TO anon;
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
       vault          supabase_admin    false    10    9    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    41    9    41    41    9    41    9    41    9    41    9    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    41    9    41    41    9    41    9    41    9    41    44    9    41    10    9    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    41    9    41    41    9    41    9    41    9    41    9    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    41    9    41    41    9    41    9    41    9    41    44    10    9    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    41    9    41    41    9    41    9    41    9    41    9    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    41    9    41    41    9    41    9    41    9    41    44    10    9    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    41    9    41    41    9    41    9    41    9    41    9    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    41    9    41    41    9    41    9    41    9    41    44    10    9    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    41    9    41    41    9    41    9    41    9    41    9    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    41    9    41    41    9    41    9    41    9    41    44    10    9    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    41    9    41    41    9    41    9    41    9    41    9    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    41    9    41    41    9    41    9    41    9    41    44    10    9    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    41    9    41    41    9    41    9    41    9    41    9    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    41    9    41    41    9    41    9    41    9    41    44    10    9    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    41    9    41    41    9    41    9    41    9    41    9    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    9    41    9    41    41    9    41    9    41    9    41    41    9    41    9    41    9    41    44    44                        2604    17266    billing_accounts id    DEFAULT     �   ALTER TABLE ONLY _analytics.billing_accounts ALTER COLUMN id SET DEFAULT nextval('_analytics.billing_accounts_id_seq'::regclass);
 F   ALTER TABLE _analytics.billing_accounts ALTER COLUMN id DROP DEFAULT;
    
   _analytics          supabase_admin    false    389    388    389            3           2604    17426    billing_counts id    DEFAULT     ~   ALTER TABLE ONLY _analytics.billing_counts ALTER COLUMN id SET DEFAULT nextval('_analytics.billing_counts_id_seq'::regclass);
 D   ALTER TABLE _analytics.billing_counts ALTER COLUMN id DROP DEFAULT;
    
   _analytics          supabase_admin    false    402    403    403            ,           2604    17409    endpoint_queries id    DEFAULT     �   ALTER TABLE ONLY _analytics.endpoint_queries ALTER COLUMN id SET DEFAULT nextval('_analytics.endpoint_queries_id_seq'::regclass);
 F   ALTER TABLE _analytics.endpoint_queries ALTER COLUMN id DROP DEFAULT;
    
   _analytics          supabase_admin    false    400    401    401                       2604    17111    oauth_access_grants id    DEFAULT     �   ALTER TABLE ONLY _analytics.oauth_access_grants ALTER COLUMN id SET DEFAULT nextval('_analytics.oauth_access_grants_id_seq'::regclass);
 I   ALTER TABLE _analytics.oauth_access_grants ALTER COLUMN id DROP DEFAULT;
    
   _analytics          supabase_admin    false    376    377    377                       2604    17126    oauth_access_tokens id    DEFAULT     �   ALTER TABLE ONLY _analytics.oauth_access_tokens ALTER COLUMN id SET DEFAULT nextval('_analytics.oauth_access_tokens_id_seq'::regclass);
 I   ALTER TABLE _analytics.oauth_access_tokens ALTER COLUMN id DROP DEFAULT;
    
   _analytics          supabase_admin    false    378    379    379                       2604    17099    oauth_applications id    DEFAULT     �   ALTER TABLE ONLY _analytics.oauth_applications ALTER COLUMN id SET DEFAULT nextval('_analytics.oauth_applications_id_seq'::regclass);
 H   ALTER TABLE _analytics.oauth_applications ALTER COLUMN id DROP DEFAULT;
    
   _analytics          supabase_admin    false    375    374    375            6           2604    17497    partner_users id    DEFAULT     |   ALTER TABLE ONLY _analytics.partner_users ALTER COLUMN id SET DEFAULT nextval('_analytics.partner_users_id_seq'::regclass);
 C   ALTER TABLE _analytics.partner_users ALTER COLUMN id DROP DEFAULT;
    
   _analytics          supabase_admin    false    409    408    409            5           2604    17488    partners id    DEFAULT     r   ALTER TABLE ONLY _analytics.partners ALTER COLUMN id SET DEFAULT nextval('_analytics.partners_id_seq'::regclass);
 >   ALTER TABLE _analytics.partners ALTER COLUMN id DROP DEFAULT;
    
   _analytics          supabase_admin    false    406    407    407            *           2604    17365    payment_methods id    DEFAULT     �   ALTER TABLE ONLY _analytics.payment_methods ALTER COLUMN id SET DEFAULT nextval('_analytics.payment_methods_id_seq'::regclass);
 E   ALTER TABLE _analytics.payment_methods ALTER COLUMN id DROP DEFAULT;
    
   _analytics          supabase_admin    false    396    397    397            &           2604    17307    plans id    DEFAULT     l   ALTER TABLE ONLY _analytics.plans ALTER COLUMN id SET DEFAULT nextval('_analytics.plans_id_seq'::regclass);
 ;   ALTER TABLE _analytics.plans ALTER COLUMN id DROP DEFAULT;
    
   _analytics          supabase_admin    false    393    392    393                       2604    17084    rules id    DEFAULT     l   ALTER TABLE ONLY _analytics.rules ALTER COLUMN id SET DEFAULT nextval('_analytics.rules_id_seq'::regclass);
 ;   ALTER TABLE _analytics.rules ALTER COLUMN id DROP DEFAULT;
    
   _analytics          supabase_admin    false    373    372    373            $           2604    17291    saved_search_counters id    DEFAULT     �   ALTER TABLE ONLY _analytics.saved_search_counters ALTER COLUMN id SET DEFAULT nextval('_analytics.saved_search_counters_id_seq'::regclass);
 K   ALTER TABLE _analytics.saved_search_counters ALTER COLUMN id DROP DEFAULT;
    
   _analytics          supabase_admin    false    390    391    391                       2604    17215    saved_searches id    DEFAULT     ~   ALTER TABLE ONLY _analytics.saved_searches ALTER COLUMN id SET DEFAULT nextval('_analytics.saved_searches_id_seq'::regclass);
 D   ALTER TABLE _analytics.saved_searches ALTER COLUMN id DROP DEFAULT;
    
   _analytics          supabase_admin    false    383    382    383            4           2604    17464    source_backends id    DEFAULT     �   ALTER TABLE ONLY _analytics.source_backends ALTER COLUMN id SET DEFAULT nextval('_analytics.source_backends_id_seq'::regclass);
 E   ALTER TABLE _analytics.source_backends ALTER COLUMN id DROP DEFAULT;
    
   _analytics          supabase_admin    false    405    404    405            )           2604    17325    source_schemas id    DEFAULT     ~   ALTER TABLE ONLY _analytics.source_schemas ALTER COLUMN id SET DEFAULT nextval('_analytics.source_schemas_id_seq'::regclass);
 D   ALTER TABLE _analytics.source_schemas ALTER COLUMN id DROP DEFAULT;
    
   _analytics          supabase_admin    false    395    394    395                       2604    17069 
   sources id    DEFAULT     p   ALTER TABLE ONLY _analytics.sources ALTER COLUMN id SET DEFAULT nextval('_analytics.sources_id_seq'::regclass);
 =   ALTER TABLE _analytics.sources ALTER COLUMN id DROP DEFAULT;
    
   _analytics          supabase_admin    false    370    371    371                       2604    17204    system_metrics id    DEFAULT     ~   ALTER TABLE ONLY _analytics.system_metrics ALTER COLUMN id SET DEFAULT nextval('_analytics.system_metrics_id_seq'::regclass);
 D   ALTER TABLE _analytics.system_metrics ALTER COLUMN id DROP DEFAULT;
    
   _analytics          supabase_admin    false    380    381    381                       2604    17241    team_users id    DEFAULT     v   ALTER TABLE ONLY _analytics.team_users ALTER COLUMN id SET DEFAULT nextval('_analytics.team_users_id_seq'::regclass);
 @   ALTER TABLE _analytics.team_users ALTER COLUMN id DROP DEFAULT;
    
   _analytics          supabase_admin    false    387    386    387                       2604    17229    teams id    DEFAULT     l   ALTER TABLE ONLY _analytics.teams ALTER COLUMN id SET DEFAULT nextval('_analytics.teams_id_seq'::regclass);
 ;   ALTER TABLE _analytics.teams ALTER COLUMN id DROP DEFAULT;
    
   _analytics          supabase_admin    false    385    384    385            �           2604    17060    users id    DEFAULT     l   ALTER TABLE ONLY _analytics.users ALTER COLUMN id SET DEFAULT nextval('_analytics.users_id_seq'::regclass);
 ;   ALTER TABLE _analytics.users ALTER COLUMN id DROP DEFAULT;
    
   _analytics          supabase_admin    false    368    369    369            +           2604    17390    vercel_auths id    DEFAULT     z   ALTER TABLE ONLY _analytics.vercel_auths ALTER COLUMN id SET DEFAULT nextval('_analytics.vercel_auths_id_seq'::regclass);
 B   ALTER TABLE _analytics.vercel_auths ALTER COLUMN id DROP DEFAULT;
    
   _analytics          supabase_admin    false    399    398    399            �           2604    16473    refresh_tokens id    DEFAULT     r   ALTER TABLE ONLY auth.refresh_tokens ALTER COLUMN id SET DEFAULT nextval('auth.refresh_tokens_id_seq'::regclass);
 >   ALTER TABLE auth.refresh_tokens ALTER COLUMN id DROP DEFAULT;
       auth          supabase_auth_admin    false    333    334    334            �           2604    16624    hooks id    DEFAULT     |   ALTER TABLE ONLY supabase_functions.hooks ALTER COLUMN id SET DEFAULT nextval('supabase_functions.hooks_id_seq'::regclass);
 C   ALTER TABLE supabase_functions.hooks ALTER COLUMN id DROP DEFAULT;
       supabase_functions          supabase_functions_admin    false    347    348    348            �          0    17263    billing_accounts 
   TABLE DATA             COPY _analytics.billing_accounts (id, latest_successful_stripe_session, stripe_customer, user_id, inserted_at, updated_at, stripe_subscriptions, stripe_invoices, "lifetime_plan?", lifetime_plan_invoice, default_payment_method, custom_invoice_fields, lifetime_plan) FROM stdin;
 
   _analytics          supabase_admin    false    389   yL      �          0    17423    billing_counts 
   TABLE DATA           j   COPY _analytics.billing_counts (id, node, count, user_id, source_id, inserted_at, updated_at) FROM stdin;
 
   _analytics          supabase_admin    false    403   �L      �          0    17406    endpoint_queries 
   TABLE DATA           �   COPY _analytics.endpoint_queries (id, name, token, query, user_id, inserted_at, updated_at, source_mapping, sandboxable, cache_duration_seconds, proactive_requerying_seconds, max_limit, enable_auth, sandbox_query_id, language) FROM stdin;
 
   _analytics          supabase_admin    false    401   �L      �          0    17108    oauth_access_grants 
   TABLE DATA           �   COPY _analytics.oauth_access_grants (id, resource_owner_id, application_id, token, expires_in, redirect_uri, revoked_at, scopes, inserted_at) FROM stdin;
 
   _analytics          supabase_admin    false    377   U      �          0    17123    oauth_access_tokens 
   TABLE DATA           �   COPY _analytics.oauth_access_tokens (id, application_id, resource_owner_id, token, refresh_token, expires_in, revoked_at, scopes, previous_refresh_token, inserted_at, updated_at, description) FROM stdin;
 
   _analytics          supabase_admin    false    379   8U      �          0    17096    oauth_applications 
   TABLE DATA           �   COPY _analytics.oauth_applications (id, owner_id, name, uid, secret, redirect_uri, scopes, inserted_at, updated_at) FROM stdin;
 
   _analytics          supabase_admin    false    375   UU      �          0    17494    partner_users 
   TABLE DATA           D   COPY _analytics.partner_users (id, partner_id, user_id) FROM stdin;
 
   _analytics          supabase_admin    false    409   rU      �          0    17485    partners 
   TABLE DATA           7   COPY _analytics.partners (id, name, token) FROM stdin;
 
   _analytics          supabase_admin    false    407   �U      �          0    17362    payment_methods 
   TABLE DATA           �   COPY _analytics.payment_methods (id, stripe_id, price_id, last_four, brand, exp_year, exp_month, customer_id, inserted_at, updated_at) FROM stdin;
 
   _analytics          supabase_admin    false    397   �U      �          0    17304    plans 
   TABLE DATA             COPY _analytics.plans (id, name, stripe_id, inserted_at, updated_at, period, price, limit_sources, limit_rate_limit, limit_alert_freq, limit_source_rate_limit, limit_saved_search_limit, limit_team_users_limit, limit_source_fields_limit, limit_source_ttl, type) FROM stdin;
 
   _analytics          supabase_admin    false    393   �U      �          0    17081    rules 
   TABLE DATA              COPY _analytics.rules (id, regex, sink, source_id, inserted_at, updated_at, regex_struct, lql_string, lql_filters) FROM stdin;
 
   _analytics          supabase_admin    false    373   1V      �          0    17288    saved_search_counters 
   TABLE DATA           �   COPY _analytics.saved_search_counters (id, "timestamp", saved_search_id, granularity, non_tailing_count, tailing_count) FROM stdin;
 
   _analytics          supabase_admin    false    391   NV      �          0    17212    saved_searches 
   TABLE DATA           �   COPY _analytics.saved_searches (id, querystring, source_id, inserted_at, updated_at, saved_by_user, lql_filters, lql_charts, "tailing?", tailing) FROM stdin;
 
   _analytics          supabase_admin    false    383   kV      �          0    17051    schema_migrations 
   TABLE DATA           E   COPY _analytics.schema_migrations (version, inserted_at) FROM stdin;
 
   _analytics          supabase_admin    false    367   �V      �          0    17584 6   schema_migrations_286c7e02_ef59_4427_aa49_2a873d36e1a1 
   TABLE DATA           j   COPY _analytics.schema_migrations_286c7e02_ef59_4427_aa49_2a873d36e1a1 (version, inserted_at) FROM stdin;
 
   _analytics          supabase_admin    false    416   �Y      �          0    17524 6   schema_migrations_47498229_5dda_4c5b_888a_beb0e74df840 
   TABLE DATA           j   COPY _analytics.schema_migrations_47498229_5dda_4c5b_888a_beb0e74df840 (version, inserted_at) FROM stdin;
 
   _analytics          supabase_admin    false    411   �Y      �          0    17560 6   schema_migrations_773049a0_b37b_41cc_9169_a035ee907a7a 
   TABLE DATA           j   COPY _analytics.schema_migrations_773049a0_b37b_41cc_9169_a035ee907a7a (version, inserted_at) FROM stdin;
 
   _analytics          supabase_admin    false    414   
Z      �          0    17572 6   schema_migrations_86d5aa1a_0d41_4995_90bc_7775bcad81b6 
   TABLE DATA           j   COPY _analytics.schema_migrations_86d5aa1a_0d41_4995_90bc_7775bcad81b6 (version, inserted_at) FROM stdin;
 
   _analytics          supabase_admin    false    415   =Z      �          0    17596 6   schema_migrations_abd25a45_5021_427a_8da2_c9602510c8b3 
   TABLE DATA           j   COPY _analytics.schema_migrations_abd25a45_5021_427a_8da2_c9602510c8b3 (version, inserted_at) FROM stdin;
 
   _analytics          supabase_admin    false    417   pZ      �          0    17548 6   schema_migrations_bdc54c9d_cdb9_481c_a037_1c10a5143270 
   TABLE DATA           j   COPY _analytics.schema_migrations_bdc54c9d_cdb9_481c_a037_1c10a5143270 (version, inserted_at) FROM stdin;
 
   _analytics          supabase_admin    false    413   �Z      �          0    17536 6   schema_migrations_c92eca35_8bde_4506_a1c4_5f7ea577f688 
   TABLE DATA           j   COPY _analytics.schema_migrations_c92eca35_8bde_4506_a1c4_5f7ea577f688 (version, inserted_at) FROM stdin;
 
   _analytics          supabase_admin    false    412   �Z      �          0    17608 6   schema_migrations_c9a01889_2682_44b0_b4f0_5ae165845478 
   TABLE DATA           j   COPY _analytics.schema_migrations_c9a01889_2682_44b0_b4f0_5ae165845478 (version, inserted_at) FROM stdin;
 
   _analytics          supabase_admin    false    418   	[      �          0    17512 6   schema_migrations_f9289a41_9dcf_4964_b7a6_61ed321dd81a 
   TABLE DATA           j   COPY _analytics.schema_migrations_f9289a41_9dcf_4964_b7a6_61ed321dd81a (version, inserted_at) FROM stdin;
 
   _analytics          supabase_admin    false    410   <[      �          0    17461    source_backends 
   TABLE DATA           c   COPY _analytics.source_backends (id, source_id, type, config, inserted_at, updated_at) FROM stdin;
 
   _analytics          supabase_admin    false    405   o[      �          0    17322    source_schemas 
   TABLE DATA           v   COPY _analytics.source_schemas (id, bigquery_schema, source_id, inserted_at, updated_at, schema_flat_map) FROM stdin;
 
   _analytics          supabase_admin    false    395   7\      �          0    17066    sources 
   TABLE DATA           �  COPY _analytics.sources (id, name, token, inserted_at, updated_at, user_id, public_token, favorite, bigquery_table_ttl, api_quota, webhook_notification_url, slack_hook_url, notifications, custom_event_message_keys, log_events_updated_at, bigquery_schema, notifications_every, bq_table_partition_type, lock_schema, validate_schema, drop_lql_filters, drop_lql_string, v2_pipeline, suggested_keys) FROM stdin;
 
   _analytics          supabase_admin    false    371   T\      �          0    17201    system_metrics 
   TABLE DATA           `   COPY _analytics.system_metrics (id, all_logs_logged, node, inserted_at, updated_at) FROM stdin;
 
   _analytics          supabase_admin    false    381   }^      �          0    17238 
   team_users 
   TABLE DATA           �   COPY _analytics.team_users (id, email, token, provider, email_preferred, name, image, email_me_product, phone, valid_google_account, provider_uid, team_id, inserted_at, updated_at, preferences) FROM stdin;
 
   _analytics          supabase_admin    false    387   �^      �          0    17226    teams 
   TABLE DATA           V   COPY _analytics.teams (id, name, user_id, inserted_at, updated_at, token) FROM stdin;
 
   _analytics          supabase_admin    false    385   �^      �          0    17057    users 
   TABLE DATA           �  COPY _analytics.users (id, email, provider, token, inserted_at, updated_at, api_key, old_api_key, email_preferred, name, image, email_me_product, admin, phone, bigquery_project_id, api_quota, bigquery_dataset_location, bigquery_dataset_id, valid_google_account, provider_uid, company, bigquery_udfs_hash, bigquery_processed_bytes_limit, "billing_enabled?", preferences, billing_enabled, endpoints_beta) FROM stdin;
 
   _analytics          supabase_admin    false    369   E_      �          0    17387    vercel_auths 
   TABLE DATA           �   COPY _analytics.vercel_auths (id, access_token, installation_id, team_id, token_type, vercel_user_id, user_id, inserted_at, updated_at) FROM stdin;
 
   _analytics          supabase_admin    false    399   �_      �          0    17875 
   extensions 
   TABLE DATA           h   COPY _realtime.extensions (id, type, settings, tenant_external_id, inserted_at, updated_at) FROM stdin;
 	   _realtime          supabase_admin    false    431   	`      �          0    17861    schema_migrations 
   TABLE DATA           D   COPY _realtime.schema_migrations (version, inserted_at) FROM stdin;
 	   _realtime          supabase_admin    false    429   �a      �          0    17866    tenants 
   TABLE DATA           �   COPY _realtime.tenants (id, name, external_id, jwt_secret, max_concurrent_users, inserted_at, updated_at, max_events_per_second, postgres_cdc_default, max_bytes_per_second, max_channels_per_client, max_joins_per_second) FROM stdin;
 	   _realtime          supabase_admin    false    430    b      �          0    16488    audit_log_entries 
   TABLE DATA           [   COPY auth.audit_log_entries (instance_id, id, payload, created_at, ip_address) FROM stdin;
    auth          supabase_auth_admin    false    336   �b      �          0    17841 
   flow_state 
   TABLE DATA           �   COPY auth.flow_state (id, user_id, auth_code, code_challenge_method, code_challenge, provider_type, provider_access_token, provider_refresh_token, created_at, updated_at, authentication_method) FROM stdin;
    auth          supabase_auth_admin    false    428   �      �          0    17639 
   identities 
   TABLE DATA           q   COPY auth.identities (id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at) FROM stdin;
    auth          supabase_auth_admin    false    419   �      �          0    16481 	   instances 
   TABLE DATA           T   COPY auth.instances (id, uuid, raw_base_config, created_at, updated_at) FROM stdin;
    auth          supabase_auth_admin    false    335   1      �          0    17728    mfa_amr_claims 
   TABLE DATA           e   COPY auth.mfa_amr_claims (session_id, created_at, updated_at, authentication_method, id) FROM stdin;
    auth          supabase_auth_admin    false    423   N      �          0    17716    mfa_challenges 
   TABLE DATA           Z   COPY auth.mfa_challenges (id, factor_id, created_at, verified_at, ip_address) FROM stdin;
    auth          supabase_auth_admin    false    422   �%      �          0    17703    mfa_factors 
   TABLE DATA           t   COPY auth.mfa_factors (id, user_id, friendly_name, factor_type, status, created_at, updated_at, secret) FROM stdin;
    auth          supabase_auth_admin    false    421   &      �          0    16470    refresh_tokens 
   TABLE DATA           |   COPY auth.refresh_tokens (instance_id, id, token, user_id, revoked, created_at, updated_at, parent, session_id) FROM stdin;
    auth          supabase_auth_admin    false    334   -&      �          0    17770    saml_providers 
   TABLE DATA           �   COPY auth.saml_providers (id, sso_provider_id, entity_id, metadata_xml, metadata_url, attribute_mapping, created_at, updated_at) FROM stdin;
    auth          supabase_auth_admin    false    426   My      �          0    17788    saml_relay_states 
   TABLE DATA           �   COPY auth.saml_relay_states (id, sso_provider_id, request_id, for_email, redirect_to, from_ip_address, created_at, updated_at, flow_state_id) FROM stdin;
    auth          supabase_auth_admin    false    427   jy      �          0    16496    schema_migrations 
   TABLE DATA           2   COPY auth.schema_migrations (version) FROM stdin;
    auth          supabase_auth_admin    false    337   �y      �          0    17669    sessions 
   TABLE DATA           `   COPY auth.sessions (id, user_id, created_at, updated_at, factor_id, aal, not_after) FROM stdin;
    auth          supabase_auth_admin    false    420   �z      �          0    17755    sso_domains 
   TABLE DATA           X   COPY auth.sso_domains (id, sso_provider_id, domain, created_at, updated_at) FROM stdin;
    auth          supabase_auth_admin    false    425   �      �          0    17746    sso_providers 
   TABLE DATA           N   COPY auth.sso_providers (id, resource_id, created_at, updated_at) FROM stdin;
    auth          supabase_auth_admin    false    424   +�      �          0    16458    users 
   TABLE DATA           A  COPY auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, invited_at, confirmation_token, confirmation_sent_at, recovery_token, recovery_sent_at, email_change_token_new, email_change, email_change_sent_at, last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at, phone, phone_confirmed_at, phone_change, phone_change_token, phone_change_sent_at, email_change_token_current, email_change_confirm_status, banned_until, reauthentication_token, reauthentication_sent_at, is_sso_user, deleted_at) FROM stdin;
    auth          supabase_auth_admin    false    332   H�      �          0    29334    job 
   TABLE DATA           n   COPY cron.job (jobid, schedule, command, nodename, nodeport, database, username, active, jobname) FROM stdin;
    cron          supabase_admin    false    449   ]�      �          0    29353    job_run_details 
   TABLE DATA           �   COPY cron.job_run_details (jobid, runid, job_pid, database, username, command, status, return_message, start_time, end_time) FROM stdin;
    cron          supabase_admin    false    451   á      �          0    16858    key 
   TABLE DATA           �   COPY pgsodium.key (id, status, created, expires, key_type, key_id, key_context, name, associated_data, raw_key, raw_key_nonce, parent_key, comment, user_data) FROM stdin;
    pgsodium          supabase_admin    false    359   ��      �          0    26881    achievements 
   TABLE DATA           T   COPY public.achievements (id, created_at, name, description, icon_name) FROM stdin;
    public          supabase_admin    false    435   ��      �          0    27130    answers_exercises 
   TABLE DATA           e   COPY public.answers_exercises (created_at, answer, exercise, is_correct, order_position) FROM stdin;
    public          supabase_admin    false    445   ��      �          0    27056 	   exercises 
   TABLE DATA           O   COPY public.exercises (id, created_at, question, priority, set_id) FROM stdin;
    public          supabase_admin    false    439   ,      �          0    27074 
   flashcards 
   TABLE DATA           X   COPY public.flashcards (id, created_at, question, answer, priority, set_id) FROM stdin;
    public          supabase_admin    false    441   �      �          0    26804    friends 
   TABLE DATA           G   COPY public.friends (created_at, user_from_id, user_to_id) FROM stdin;
    public          supabase_admin    false    433   �      �          0    26976    learning_projects 
   TABLE DATA           u   COPY public.learning_projects (id, created_at, name, description, "group", is_published, owner_id, tags) FROM stdin;
    public          supabase_admin    false    437   �      �          0    27113    links 
   TABLE DATA           i   COPY public.links (id, created_at, link_url, learning_project, title, subtitle, description) FROM stdin;
    public          supabase_admin    false    443   =+                0    135317    player_answers 
   TABLE DATA           s   COPY public.player_answers (room_id, user_id, round, answer_correct, answered_at, answer_time, answer) FROM stdin;
    public          supabase_admin    false    465   �/      �          0    53025    private_room_states 
   TABLE DATA           T   COPY public.private_room_states (room_id, data, created_at, updated_at) FROM stdin;
    public          supabase_admin    false    457   �/      �          0    26744    profiles 
   TABLE DATA           S   COPY public.profiles (id, username, room_id, user_tags, user_settings) FROM stdin;
    public          supabase_admin    false    432   �/      �          0    30854    project_ratings 
   TABLE DATA           R   COPY public.project_ratings (project_id, created_at, user_id, rating) FROM stdin;
    public          supabase_admin    false    452   �5      �          0    53001    public_room_states 
   TABLE DATA           S   COPY public.public_room_states (room_id, created_at, data, updated_at) FROM stdin;
    public          supabase_admin    false    456   +8                0    233293    queue 
   TABLE DATA           D   COPY public.queue (id, created_at, room_id, type, data) FROM stdin;
    public          supabase_admin    false    467   H8      �          0    27238    rooms 
   TABLE DATA           �   COPY public.rooms (created_at, name, id, code, project_id, secret_key, is_ingame, host, max_size, is_private, share_code) FROM stdin;
    public          supabase_admin    false    446   e8      �          0    38289    sets 
   TABLE DATA           F   COPY public.sets (id, name, type, created_at, project_id) FROM stdin;
    public          supabase_admin    false    454   �8                0    69388    tracker 
   TABLE DATA           4   COPY public.tracker (key, last_updated) FROM stdin;
    public          supabase_admin    false    464   �D      �          0    26864    user_achievements 
   TABLE DATA           P   COPY public.user_achievements (created_at, achievement_id, user_id) FROM stdin;
    public          supabase_admin    false    434   �D      �          0    27260    user_learning_projects 
   TABLE DATA           a   COPY public.user_learning_projects (created_at, learning_project_id, user_id, stats) FROM stdin;
    public          supabase_admin    false    447   �G      �          0    53126    schema_migrations 
   TABLE DATA           C   COPY realtime.schema_migrations (version, inserted_at) FROM stdin;
    realtime          supabase_admin    false    458   \                0    53149    subscription 
   TABLE DATA           b   COPY realtime.subscription (id, subscription_id, entity, filters, claims, created_at) FROM stdin;
    realtime          supabase_admin    false    461   �\      �          0    16509    buckets 
   TABLE DATA           �   COPY storage.buckets (id, name, owner, created_at, updated_at, public, avif_autodetection, file_size_limit, allowed_mime_types) FROM stdin;
    storage          supabase_storage_admin    false    338   �^      �          0    16551 
   migrations 
   TABLE DATA           B   COPY storage.migrations (id, name, hash, executed_at) FROM stdin;
    storage          supabase_storage_admin    false    340   s_      �          0    16524    objects 
   TABLE DATA           {   COPY storage.objects (id, bucket_id, name, owner, created_at, updated_at, last_accessed_at, metadata, version) FROM stdin;
    storage          supabase_storage_admin    false    339   �b      �          0    16621    hooks 
   TABLE DATA           a   COPY supabase_functions.hooks (id, hook_table_id, hook_name, created_at, request_id) FROM stdin;
    supabase_functions          supabase_functions_admin    false    348   ?z      �          0    16612 
   migrations 
   TABLE DATA           F   COPY supabase_functions.migrations (version, inserted_at) FROM stdin;
    supabase_functions          supabase_functions_admin    false    346   ɡ      �          0    17019    secrets 
   TABLE DATA           f   COPY vault.secrets (id, name, description, secret, key_id, nonce, created_at, updated_at) FROM stdin;
    vault          supabase_admin    false    365   )�      "           0    0    billing_accounts_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('_analytics.billing_accounts_id_seq', 1, false);
       
   _analytics          supabase_admin    false    388            #           0    0    billing_counts_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('_analytics.billing_counts_id_seq', 1, false);
       
   _analytics          supabase_admin    false    402            $           0    0    endpoint_queries_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('_analytics.endpoint_queries_id_seq', 3, true);
       
   _analytics          supabase_admin    false    400            %           0    0    oauth_access_grants_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('_analytics.oauth_access_grants_id_seq', 1, false);
       
   _analytics          supabase_admin    false    376            &           0    0    oauth_access_tokens_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('_analytics.oauth_access_tokens_id_seq', 1, false);
       
   _analytics          supabase_admin    false    378            '           0    0    oauth_applications_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('_analytics.oauth_applications_id_seq', 1, false);
       
   _analytics          supabase_admin    false    374            (           0    0    partner_users_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('_analytics.partner_users_id_seq', 1, false);
       
   _analytics          supabase_admin    false    408            )           0    0    partners_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('_analytics.partners_id_seq', 1, false);
       
   _analytics          supabase_admin    false    406            *           0    0    payment_methods_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('_analytics.payment_methods_id_seq', 1, false);
       
   _analytics          supabase_admin    false    396            +           0    0    plans_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('_analytics.plans_id_seq', 1, true);
       
   _analytics          supabase_admin    false    392            ,           0    0    rules_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('_analytics.rules_id_seq', 1, false);
       
   _analytics          supabase_admin    false    372            -           0    0    saved_search_counters_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('_analytics.saved_search_counters_id_seq', 1, false);
       
   _analytics          supabase_admin    false    390            .           0    0    saved_searches_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('_analytics.saved_searches_id_seq', 1, false);
       
   _analytics          supabase_admin    false    382            /           0    0    source_backends_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('_analytics.source_backends_id_seq', 9, true);
       
   _analytics          supabase_admin    false    404            0           0    0    source_schemas_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('_analytics.source_schemas_id_seq', 1, false);
       
   _analytics          supabase_admin    false    394            1           0    0    sources_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('_analytics.sources_id_seq', 9, true);
       
   _analytics          supabase_admin    false    370            2           0    0    system_metrics_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('_analytics.system_metrics_id_seq', 1, true);
       
   _analytics          supabase_admin    false    380            3           0    0    team_users_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('_analytics.team_users_id_seq', 1, false);
       
   _analytics          supabase_admin    false    386            4           0    0    teams_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('_analytics.teams_id_seq', 1, true);
       
   _analytics          supabase_admin    false    384            5           0    0    users_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('_analytics.users_id_seq', 201, true);
       
   _analytics          supabase_admin    false    368            6           0    0    vercel_auths_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('_analytics.vercel_auths_id_seq', 1, false);
       
   _analytics          supabase_admin    false    398            7           0    0    refresh_tokens_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('auth.refresh_tokens_id_seq', 7341, true);
          auth          supabase_auth_admin    false    333            8           0    0 	   jobid_seq    SEQUENCE SET     5   SELECT pg_catalog.setval('cron.jobid_seq', 1, true);
          cron          supabase_admin    false    448            9           0    0 	   runid_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('cron.runid_seq', 1208, true);
          cron          supabase_admin    false    450            :           0    0    key_key_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('pgsodium.key_key_id_seq', 1, false);
          pgsodium          supabase_admin    false    358            ;           0    0    achievements_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.achievements_id_seq', 11, true);
          public          supabase_admin    false    436            <           0    0    exercises_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.exercises_id_seq', 407, true);
          public          supabase_admin    false    440            =           0    0    learning_projects_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.learning_projects_id_seq', 818, true);
          public          supabase_admin    false    438            >           0    0    lp_flashcards_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.lp_flashcards_id_seq', 582, true);
          public          supabase_admin    false    442            ?           0    0    lp_links_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.lp_links_id_seq', 431, true);
          public          supabase_admin    false    444            @           0    0    project_ratings_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.project_ratings_id_seq', 1, false);
          public          supabase_admin    false    453            A           0    0    sets_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.sets_id_seq', 2846, true);
          public          supabase_admin    false    455            B           0    0    subscription_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('realtime.subscription_id_seq', 659760, true);
          realtime          supabase_admin    false    460            C           0    0    hooks_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('supabase_functions.hooks_id_seq', 1034, true);
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
   _analytics            supabase_admin    false    375            �           2606    17499     partner_users partner_users_pkey 
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
   _analytics            supabase_admin    false    383                       2606    17588 r   schema_migrations_286c7e02_ef59_4427_aa49_2a873d36e1a1 schema_migrations_286c7e02_ef59_4427_aa49_2a873d36e1a1_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY _analytics.schema_migrations_286c7e02_ef59_4427_aa49_2a873d36e1a1
    ADD CONSTRAINT schema_migrations_286c7e02_ef59_4427_aa49_2a873d36e1a1_pkey PRIMARY KEY (version);
 �   ALTER TABLE ONLY _analytics.schema_migrations_286c7e02_ef59_4427_aa49_2a873d36e1a1 DROP CONSTRAINT schema_migrations_286c7e02_ef59_4427_aa49_2a873d36e1a1_pkey;
    
   _analytics            supabase_admin    false    416            �           2606    17528 r   schema_migrations_47498229_5dda_4c5b_888a_beb0e74df840 schema_migrations_47498229_5dda_4c5b_888a_beb0e74df840_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY _analytics.schema_migrations_47498229_5dda_4c5b_888a_beb0e74df840
    ADD CONSTRAINT schema_migrations_47498229_5dda_4c5b_888a_beb0e74df840_pkey PRIMARY KEY (version);
 �   ALTER TABLE ONLY _analytics.schema_migrations_47498229_5dda_4c5b_888a_beb0e74df840 DROP CONSTRAINT schema_migrations_47498229_5dda_4c5b_888a_beb0e74df840_pkey;
    
   _analytics            supabase_admin    false    411                       2606    17564 r   schema_migrations_773049a0_b37b_41cc_9169_a035ee907a7a schema_migrations_773049a0_b37b_41cc_9169_a035ee907a7a_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY _analytics.schema_migrations_773049a0_b37b_41cc_9169_a035ee907a7a
    ADD CONSTRAINT schema_migrations_773049a0_b37b_41cc_9169_a035ee907a7a_pkey PRIMARY KEY (version);
 �   ALTER TABLE ONLY _analytics.schema_migrations_773049a0_b37b_41cc_9169_a035ee907a7a DROP CONSTRAINT schema_migrations_773049a0_b37b_41cc_9169_a035ee907a7a_pkey;
    
   _analytics            supabase_admin    false    414                       2606    17576 r   schema_migrations_86d5aa1a_0d41_4995_90bc_7775bcad81b6 schema_migrations_86d5aa1a_0d41_4995_90bc_7775bcad81b6_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY _analytics.schema_migrations_86d5aa1a_0d41_4995_90bc_7775bcad81b6
    ADD CONSTRAINT schema_migrations_86d5aa1a_0d41_4995_90bc_7775bcad81b6_pkey PRIMARY KEY (version);
 �   ALTER TABLE ONLY _analytics.schema_migrations_86d5aa1a_0d41_4995_90bc_7775bcad81b6 DROP CONSTRAINT schema_migrations_86d5aa1a_0d41_4995_90bc_7775bcad81b6_pkey;
    
   _analytics            supabase_admin    false    415            
           2606    17600 r   schema_migrations_abd25a45_5021_427a_8da2_c9602510c8b3 schema_migrations_abd25a45_5021_427a_8da2_c9602510c8b3_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY _analytics.schema_migrations_abd25a45_5021_427a_8da2_c9602510c8b3
    ADD CONSTRAINT schema_migrations_abd25a45_5021_427a_8da2_c9602510c8b3_pkey PRIMARY KEY (version);
 �   ALTER TABLE ONLY _analytics.schema_migrations_abd25a45_5021_427a_8da2_c9602510c8b3 DROP CONSTRAINT schema_migrations_abd25a45_5021_427a_8da2_c9602510c8b3_pkey;
    
   _analytics            supabase_admin    false    417                       2606    17552 r   schema_migrations_bdc54c9d_cdb9_481c_a037_1c10a5143270 schema_migrations_bdc54c9d_cdb9_481c_a037_1c10a5143270_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY _analytics.schema_migrations_bdc54c9d_cdb9_481c_a037_1c10a5143270
    ADD CONSTRAINT schema_migrations_bdc54c9d_cdb9_481c_a037_1c10a5143270_pkey PRIMARY KEY (version);
 �   ALTER TABLE ONLY _analytics.schema_migrations_bdc54c9d_cdb9_481c_a037_1c10a5143270 DROP CONSTRAINT schema_migrations_bdc54c9d_cdb9_481c_a037_1c10a5143270_pkey;
    
   _analytics            supabase_admin    false    413                        2606    17540 r   schema_migrations_c92eca35_8bde_4506_a1c4_5f7ea577f688 schema_migrations_c92eca35_8bde_4506_a1c4_5f7ea577f688_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY _analytics.schema_migrations_c92eca35_8bde_4506_a1c4_5f7ea577f688
    ADD CONSTRAINT schema_migrations_c92eca35_8bde_4506_a1c4_5f7ea577f688_pkey PRIMARY KEY (version);
 �   ALTER TABLE ONLY _analytics.schema_migrations_c92eca35_8bde_4506_a1c4_5f7ea577f688 DROP CONSTRAINT schema_migrations_c92eca35_8bde_4506_a1c4_5f7ea577f688_pkey;
    
   _analytics            supabase_admin    false    412                       2606    17612 r   schema_migrations_c9a01889_2682_44b0_b4f0_5ae165845478 schema_migrations_c9a01889_2682_44b0_b4f0_5ae165845478_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY _analytics.schema_migrations_c9a01889_2682_44b0_b4f0_5ae165845478
    ADD CONSTRAINT schema_migrations_c9a01889_2682_44b0_b4f0_5ae165845478_pkey PRIMARY KEY (version);
 �   ALTER TABLE ONLY _analytics.schema_migrations_c9a01889_2682_44b0_b4f0_5ae165845478 DROP CONSTRAINT schema_migrations_c9a01889_2682_44b0_b4f0_5ae165845478_pkey;
    
   _analytics            supabase_admin    false    418            �           2606    17516 r   schema_migrations_f9289a41_9dcf_4964_b7a6_61ed321dd81a schema_migrations_f9289a41_9dcf_4964_b7a6_61ed321dd81a_pkey 
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
   _analytics            supabase_admin    false    399            >           2606    17881    extensions extensions_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY _realtime.extensions
    ADD CONSTRAINT extensions_pkey PRIMARY KEY (id);
 G   ALTER TABLE ONLY _realtime.extensions DROP CONSTRAINT extensions_pkey;
    	   _realtime            supabase_admin    false    431            9           2606    17865 (   schema_migrations schema_migrations_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY _realtime.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);
 U   ALTER TABLE ONLY _realtime.schema_migrations DROP CONSTRAINT schema_migrations_pkey;
    	   _realtime            supabase_admin    false    429            <           2606    17873    tenants tenants_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY _realtime.tenants
    ADD CONSTRAINT tenants_pkey PRIMARY KEY (id);
 A   ALTER TABLE ONLY _realtime.tenants DROP CONSTRAINT tenants_pkey;
    	   _realtime            supabase_admin    false    430                       2606    17741    mfa_amr_claims amr_id_pk 
   CONSTRAINT     T   ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT amr_id_pk PRIMARY KEY (id);
 @   ALTER TABLE ONLY auth.mfa_amr_claims DROP CONSTRAINT amr_id_pk;
       auth            supabase_auth_admin    false    423            �           2606    16494 (   audit_log_entries audit_log_entries_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY auth.audit_log_entries
    ADD CONSTRAINT audit_log_entries_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY auth.audit_log_entries DROP CONSTRAINT audit_log_entries_pkey;
       auth            supabase_auth_admin    false    336            5           2606    17847    flow_state flow_state_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY auth.flow_state
    ADD CONSTRAINT flow_state_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY auth.flow_state DROP CONSTRAINT flow_state_pkey;
       auth            supabase_auth_admin    false    428                       2606    17645    identities identities_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_pkey PRIMARY KEY (provider, id);
 B   ALTER TABLE ONLY auth.identities DROP CONSTRAINT identities_pkey;
       auth            supabase_auth_admin    false    419    419            �           2606    16487    instances instances_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY auth.instances
    ADD CONSTRAINT instances_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY auth.instances DROP CONSTRAINT instances_pkey;
       auth            supabase_auth_admin    false    335            !           2606    17734 C   mfa_amr_claims mfa_amr_claims_session_id_authentication_method_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_authentication_method_pkey UNIQUE (session_id, authentication_method);
 k   ALTER TABLE ONLY auth.mfa_amr_claims DROP CONSTRAINT mfa_amr_claims_session_id_authentication_method_pkey;
       auth            supabase_auth_admin    false    423    423                       2606    17722 "   mfa_challenges mfa_challenges_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY auth.mfa_challenges DROP CONSTRAINT mfa_challenges_pkey;
       auth            supabase_auth_admin    false    422                       2606    17709    mfa_factors mfa_factors_pkey 
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
       auth            supabase_auth_admin    false    334            *           2606    17781 +   saml_providers saml_providers_entity_id_key 
   CONSTRAINT     i   ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_entity_id_key UNIQUE (entity_id);
 S   ALTER TABLE ONLY auth.saml_providers DROP CONSTRAINT saml_providers_entity_id_key;
       auth            supabase_auth_admin    false    426            ,           2606    17779 "   saml_providers saml_providers_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY auth.saml_providers DROP CONSTRAINT saml_providers_pkey;
       auth            supabase_auth_admin    false    426            1           2606    17795 (   saml_relay_states saml_relay_states_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY auth.saml_relay_states DROP CONSTRAINT saml_relay_states_pkey;
       auth            supabase_auth_admin    false    427            �           2606    16500 (   schema_migrations schema_migrations_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY auth.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);
 P   ALTER TABLE ONLY auth.schema_migrations DROP CONSTRAINT schema_migrations_pkey;
       auth            supabase_auth_admin    false    337                       2606    17673    sessions sessions_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY auth.sessions DROP CONSTRAINT sessions_pkey;
       auth            supabase_auth_admin    false    420            '           2606    17762    sso_domains sso_domains_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY auth.sso_domains DROP CONSTRAINT sso_domains_pkey;
       auth            supabase_auth_admin    false    425            #           2606    17753     sso_providers sso_providers_pkey 
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
       auth            supabase_auth_admin    false    332            L           2606    26894    achievements achievements_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.achievements
    ADD CONSTRAINT achievements_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.achievements DROP CONSTRAINT achievements_pkey;
       public            supabase_admin    false    435            Z           2606    216856 (   answers_exercises answers_exercises_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.answers_exercises
    ADD CONSTRAINT answers_exercises_pkey PRIMARY KEY (exercise, order_position);
 R   ALTER TABLE ONLY public.answers_exercises DROP CONSTRAINT answers_exercises_pkey;
       public            supabase_admin    false    445    445            Q           2606    27068    exercises exercises_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.exercises
    ADD CONSTRAINT exercises_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.exercises DROP CONSTRAINT exercises_pkey;
       public            supabase_admin    false    439            F           2606    27581    friends friends_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.friends
    ADD CONSTRAINT friends_pkey PRIMARY KEY (user_from_id, user_to_id);
 >   ALTER TABLE ONLY public.friends DROP CONSTRAINT friends_pkey;
       public            supabase_admin    false    433    433            O           2606    26987 (   learning_projects learning_projects_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.learning_projects
    ADD CONSTRAINT learning_projects_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.learning_projects DROP CONSTRAINT learning_projects_pkey;
       public            supabase_admin    false    437            U           2606    27085    flashcards lp_flashcards_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.flashcards
    ADD CONSTRAINT lp_flashcards_pkey PRIMARY KEY (id);
 G   ALTER TABLE ONLY public.flashcards DROP CONSTRAINT lp_flashcards_pkey;
       public            supabase_admin    false    441            W           2606    27124    links lp_links_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.links
    ADD CONSTRAINT lp_links_pkey PRIMARY KEY (id);
 =   ALTER TABLE ONLY public.links DROP CONSTRAINT lp_links_pkey;
       public            supabase_admin    false    443            |           2606    135433 "   player_answers player_answers_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY public.player_answers
    ADD CONSTRAINT player_answers_pkey PRIMARY KEY (room_id, user_id, round);
 L   ALTER TABLE ONLY public.player_answers DROP CONSTRAINT player_answers_pkey;
       public            supabase_admin    false    465    465    465            p           2606    53032 ,   private_room_states private_room_states_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.private_room_states
    ADD CONSTRAINT private_room_states_pkey PRIMARY KEY (room_id);
 V   ALTER TABLE ONLY public.private_room_states DROP CONSTRAINT private_room_states_pkey;
       public            supabase_admin    false    457            A           2606    26750    profiles profiles_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.profiles DROP CONSTRAINT profiles_pkey;
       public            supabase_admin    false    432            D           2606    27779    profiles profiles_username_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_username_key UNIQUE (username);
 H   ALTER TABLE ONLY public.profiles DROP CONSTRAINT profiles_username_key;
       public            supabase_admin    false    432            j           2606    37194 $   project_ratings project_ratings_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY public.project_ratings
    ADD CONSTRAINT project_ratings_pkey PRIMARY KEY (project_id, user_id);
 N   ALTER TABLE ONLY public.project_ratings DROP CONSTRAINT project_ratings_pkey;
       public            supabase_admin    false    452    452            ~           2606    233304    queue queue_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.queue
    ADD CONSTRAINT queue_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.queue DROP CONSTRAINT queue_pkey;
       public            supabase_admin    false    467            n           2606    53012 #   public_room_states room_states_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.public_room_states
    ADD CONSTRAINT room_states_pkey PRIMARY KEY (room_id);
 M   ALTER TABLE ONLY public.public_room_states DROP CONSTRAINT room_states_pkey;
       public            supabase_admin    false    456            ]           2606    28863    rooms rooms_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.rooms DROP CONSTRAINT rooms_pkey;
       public            supabase_admin    false    446            `           2606    45883    rooms rooms_share_code_key 
   CONSTRAINT     [   ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_share_code_key UNIQUE (share_code);
 D   ALTER TABLE ONLY public.rooms DROP CONSTRAINT rooms_share_code_key;
       public            supabase_admin    false    446            l           2606    38300    sets sets_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.sets
    ADD CONSTRAINT sets_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.sets DROP CONSTRAINT sets_pkey;
       public            supabase_admin    false    454            x           2606    69668    tracker tracker_key_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.tracker
    ADD CONSTRAINT tracker_key_key UNIQUE (key);
 A   ALTER TABLE ONLY public.tracker DROP CONSTRAINT tracker_key_key;
       public            supabase_admin    false    464            z           2606    69394    tracker tracker_pk 
   CONSTRAINT     Q   ALTER TABLE ONLY public.tracker
    ADD CONSTRAINT tracker_pk PRIMARY KEY (key);
 <   ALTER TABLE ONLY public.tracker DROP CONSTRAINT tracker_pk;
       public            supabase_admin    false    464            H           2606    86183 )   user_achievements unique_user_achievement 
   CONSTRAINT     w   ALTER TABLE ONLY public.user_achievements
    ADD CONSTRAINT unique_user_achievement UNIQUE (user_id, achievement_id);
 S   ALTER TABLE ONLY public.user_achievements DROP CONSTRAINT unique_user_achievement;
       public            supabase_admin    false    434    434            J           2606    86877 (   user_achievements user_achievements_pkey 
   CONSTRAINT     {   ALTER TABLE ONLY public.user_achievements
    ADD CONSTRAINT user_achievements_pkey PRIMARY KEY (achievement_id, user_id);
 R   ALTER TABLE ONLY public.user_achievements DROP CONSTRAINT user_achievements_pkey;
       public            supabase_admin    false    434    434            b           2606    38230 2   user_learning_projects user_learning_projects_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.user_learning_projects
    ADD CONSTRAINT user_learning_projects_pkey PRIMARY KEY (learning_project_id, user_id);
 \   ALTER TABLE ONLY public.user_learning_projects DROP CONSTRAINT user_learning_projects_pkey;
       public            supabase_admin    false    447    447            u           2606    53157    subscription pk_subscription 
   CONSTRAINT     \   ALTER TABLE ONLY realtime.subscription
    ADD CONSTRAINT pk_subscription PRIMARY KEY (id);
 H   ALTER TABLE ONLY realtime.subscription DROP CONSTRAINT pk_subscription;
       realtime            supabase_admin    false    461            r           2606    53130 (   schema_migrations schema_migrations_pkey 
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
   _analytics            supabase_admin    false    375            �           1259    17510 &   partner_users_partner_id_user_id_index    INDEX     z   CREATE UNIQUE INDEX partner_users_partner_id_user_id_index ON _analytics.partner_users USING btree (partner_id, user_id);
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
   _analytics            supabase_admin    false    369    369            ?           1259    17887 (   extensions_tenant_external_id_type_index    INDEX     }   CREATE UNIQUE INDEX extensions_tenant_external_id_type_index ON _realtime.extensions USING btree (tenant_external_id, type);
 ?   DROP INDEX _realtime.extensions_tenant_external_id_type_index;
    	   _realtime            supabase_admin    false    431    431            :           1259    17874    tenants_external_id_index    INDEX     ^   CREATE UNIQUE INDEX tenants_external_id_index ON _realtime.tenants USING btree (external_id);
 0   DROP INDEX _realtime.tenants_external_id_index;
    	   _realtime            supabase_admin    false    430            �           1259    16495    audit_logs_instance_id_idx    INDEX     ]   CREATE INDEX audit_logs_instance_id_idx ON auth.audit_log_entries USING btree (instance_id);
 ,   DROP INDEX auth.audit_logs_instance_id_idx;
       auth            supabase_auth_admin    false    336            y           1259    17662    confirmation_token_idx    INDEX     �   CREATE UNIQUE INDEX confirmation_token_idx ON auth.users USING btree (confirmation_token) WHERE ((confirmation_token)::text !~ '^[0-9 ]*$'::text);
 (   DROP INDEX auth.confirmation_token_idx;
       auth            supabase_auth_admin    false    332    332            z           1259    17664    email_change_token_current_idx    INDEX     �   CREATE UNIQUE INDEX email_change_token_current_idx ON auth.users USING btree (email_change_token_current) WHERE ((email_change_token_current)::text !~ '^[0-9 ]*$'::text);
 0   DROP INDEX auth.email_change_token_current_idx;
       auth            supabase_auth_admin    false    332    332            {           1259    17665    email_change_token_new_idx    INDEX     �   CREATE UNIQUE INDEX email_change_token_new_idx ON auth.users USING btree (email_change_token_new) WHERE ((email_change_token_new)::text !~ '^[0-9 ]*$'::text);
 ,   DROP INDEX auth.email_change_token_new_idx;
       auth            supabase_auth_admin    false    332    332                       1259    17743    factor_id_created_at_idx    INDEX     ]   CREATE INDEX factor_id_created_at_idx ON auth.mfa_factors USING btree (user_id, created_at);
 *   DROP INDEX auth.factor_id_created_at_idx;
       auth            supabase_auth_admin    false    421    421            3           1259    17851    flow_state_created_at_idx    INDEX     Y   CREATE INDEX flow_state_created_at_idx ON auth.flow_state USING btree (created_at DESC);
 +   DROP INDEX auth.flow_state_created_at_idx;
       auth            supabase_auth_admin    false    428                       1259    17831    identities_email_idx    INDEX     [   CREATE INDEX identities_email_idx ON auth.identities USING btree (email text_pattern_ops);
 &   DROP INDEX auth.identities_email_idx;
       auth            supabase_auth_admin    false    419            D           0    0    INDEX identities_email_idx    COMMENT     c   COMMENT ON INDEX auth.identities_email_idx IS 'Auth: Ensures indexed queries on the email column';
          auth          supabase_auth_admin    false    4365                       1259    17659    identities_user_id_idx    INDEX     N   CREATE INDEX identities_user_id_idx ON auth.identities USING btree (user_id);
 (   DROP INDEX auth.identities_user_id_idx;
       auth            supabase_auth_admin    false    419            6           1259    17848    idx_auth_code    INDEX     G   CREATE INDEX idx_auth_code ON auth.flow_state USING btree (auth_code);
    DROP INDEX auth.idx_auth_code;
       auth            supabase_auth_admin    false    428            7           1259    17849    idx_user_id_auth_method    INDEX     f   CREATE INDEX idx_user_id_auth_method ON auth.flow_state USING btree (user_id, authentication_method);
 )   DROP INDEX auth.idx_user_id_auth_method;
       auth            supabase_auth_admin    false    428    428                       1259    17854    mfa_challenge_created_at_idx    INDEX     `   CREATE INDEX mfa_challenge_created_at_idx ON auth.mfa_challenges USING btree (created_at DESC);
 .   DROP INDEX auth.mfa_challenge_created_at_idx;
       auth            supabase_auth_admin    false    422                       1259    17715 %   mfa_factors_user_friendly_name_unique    INDEX     �   CREATE UNIQUE INDEX mfa_factors_user_friendly_name_unique ON auth.mfa_factors USING btree (friendly_name, user_id) WHERE (TRIM(BOTH FROM friendly_name) <> ''::text);
 7   DROP INDEX auth.mfa_factors_user_friendly_name_unique;
       auth            supabase_auth_admin    false    421    421    421                       1259    17860    mfa_factors_user_id_idx    INDEX     P   CREATE INDEX mfa_factors_user_id_idx ON auth.mfa_factors USING btree (user_id);
 )   DROP INDEX auth.mfa_factors_user_id_idx;
       auth            supabase_auth_admin    false    421            |           1259    17666    reauthentication_token_idx    INDEX     �   CREATE UNIQUE INDEX reauthentication_token_idx ON auth.users USING btree (reauthentication_token) WHERE ((reauthentication_token)::text !~ '^[0-9 ]*$'::text);
 ,   DROP INDEX auth.reauthentication_token_idx;
       auth            supabase_auth_admin    false    332    332            }           1259    17663    recovery_token_idx    INDEX     �   CREATE UNIQUE INDEX recovery_token_idx ON auth.users USING btree (recovery_token) WHERE ((recovery_token)::text !~ '^[0-9 ]*$'::text);
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
       auth            supabase_auth_admin    false    334            -           1259    17787 "   saml_providers_sso_provider_id_idx    INDEX     f   CREATE INDEX saml_providers_sso_provider_id_idx ON auth.saml_providers USING btree (sso_provider_id);
 4   DROP INDEX auth.saml_providers_sso_provider_id_idx;
       auth            supabase_auth_admin    false    426            .           1259    17852     saml_relay_states_created_at_idx    INDEX     g   CREATE INDEX saml_relay_states_created_at_idx ON auth.saml_relay_states USING btree (created_at DESC);
 2   DROP INDEX auth.saml_relay_states_created_at_idx;
       auth            supabase_auth_admin    false    427            /           1259    17802    saml_relay_states_for_email_idx    INDEX     `   CREATE INDEX saml_relay_states_for_email_idx ON auth.saml_relay_states USING btree (for_email);
 1   DROP INDEX auth.saml_relay_states_for_email_idx;
       auth            supabase_auth_admin    false    427            2           1259    17801 %   saml_relay_states_sso_provider_id_idx    INDEX     l   CREATE INDEX saml_relay_states_sso_provider_id_idx ON auth.saml_relay_states USING btree (sso_provider_id);
 7   DROP INDEX auth.saml_relay_states_sso_provider_id_idx;
       auth            supabase_auth_admin    false    427                       1259    17853    sessions_not_after_idx    INDEX     S   CREATE INDEX sessions_not_after_idx ON auth.sessions USING btree (not_after DESC);
 (   DROP INDEX auth.sessions_not_after_idx;
       auth            supabase_auth_admin    false    420                       1259    17744    sessions_user_id_idx    INDEX     J   CREATE INDEX sessions_user_id_idx ON auth.sessions USING btree (user_id);
 &   DROP INDEX auth.sessions_user_id_idx;
       auth            supabase_auth_admin    false    420            %           1259    17769    sso_domains_domain_idx    INDEX     \   CREATE UNIQUE INDEX sso_domains_domain_idx ON auth.sso_domains USING btree (lower(domain));
 (   DROP INDEX auth.sso_domains_domain_idx;
       auth            supabase_auth_admin    false    425    425            (           1259    17768    sso_domains_sso_provider_id_idx    INDEX     `   CREATE INDEX sso_domains_sso_provider_id_idx ON auth.sso_domains USING btree (sso_provider_id);
 1   DROP INDEX auth.sso_domains_sso_provider_id_idx;
       auth            supabase_auth_admin    false    425            $           1259    17754    sso_providers_resource_id_idx    INDEX     j   CREATE UNIQUE INDEX sso_providers_resource_id_idx ON auth.sso_providers USING btree (lower(resource_id));
 /   DROP INDEX auth.sso_providers_resource_id_idx;
       auth            supabase_auth_admin    false    424    424                       1259    17742    user_id_created_at_idx    INDEX     X   CREATE INDEX user_id_created_at_idx ON auth.sessions USING btree (user_id, created_at);
 (   DROP INDEX auth.user_id_created_at_idx;
       auth            supabase_auth_admin    false    420    420            ~           1259    17822    users_email_partial_key    INDEX     k   CREATE UNIQUE INDEX users_email_partial_key ON auth.users USING btree (email) WHERE (is_sso_user = false);
 )   DROP INDEX auth.users_email_partial_key;
       auth            supabase_auth_admin    false    332    332            E           0    0    INDEX users_email_partial_key    COMMENT     }   COMMENT ON INDEX auth.users_email_partial_key IS 'Auth: A partial unique index that applies only when is_sso_user is false';
          auth          supabase_auth_admin    false    4222                       1259    17660    users_instance_id_email_idx    INDEX     h   CREATE INDEX users_instance_id_email_idx ON auth.users USING btree (instance_id, lower((email)::text));
 -   DROP INDEX auth.users_instance_id_email_idx;
       auth            supabase_auth_admin    false    332    332            �           1259    16468    users_instance_id_idx    INDEX     L   CREATE INDEX users_instance_id_idx ON auth.users USING btree (instance_id);
 '   DROP INDEX auth.users_instance_id_idx;
       auth            supabase_auth_admin    false    332            X           1259    44813    answers_exercises_exercise_idx    INDEX     `   CREATE INDEX answers_exercises_exercise_idx ON public.answers_exercises USING btree (exercise);
 2   DROP INDEX public.answers_exercises_exercise_idx;
       public            supabase_admin    false    445            [           1259    28780    btree_socket_room_id_idx    INDEX     H   CREATE INDEX btree_socket_room_id_idx ON public.rooms USING btree (id);
 ,   DROP INDEX public.btree_socket_room_id_idx;
       public            supabase_admin    false    446            R           1259    44811    exercises_set_id_idx    INDEX     L   CREATE INDEX exercises_set_id_idx ON public.exercises USING btree (set_id);
 (   DROP INDEX public.exercises_set_id_idx;
       public            supabase_admin    false    439            S           1259    44812    flashcards_set_id_idx    INDEX     N   CREATE INDEX flashcards_set_id_idx ON public.flashcards USING btree (set_id);
 )   DROP INDEX public.flashcards_set_id_idx;
       public            supabase_admin    false    441            M           1259    44810    learning_projects_owner_id_idx    INDEX     `   CREATE INDEX learning_projects_owner_id_idx ON public.learning_projects USING btree (owner_id);
 2   DROP INDEX public.learning_projects_owner_id_idx;
       public            supabase_admin    false    437            B           1259    126768 &   profiles_username_case_insensitive_key    INDEX     m   CREATE UNIQUE INDEX profiles_username_case_insensitive_key ON public.profiles USING btree (upper(username));
 :   DROP INDEX public.profiles_username_case_insensitive_key;
       public            supabase_admin    false    432    432            ^           1259    45154    rooms_secret_key_idx    INDEX     L   CREATE INDEX rooms_secret_key_idx ON public.rooms USING btree (secret_key);
 (   DROP INDEX public.rooms_secret_key_idx;
       public            supabase_admin    false    446            s           1259    53160    ix_realtime_subscription_entity    INDEX     [   CREATE INDEX ix_realtime_subscription_entity ON realtime.subscription USING hash (entity);
 5   DROP INDEX realtime.ix_realtime_subscription_entity;
       realtime            supabase_admin    false    461            v           1259    53206 /   subscription_subscription_id_entity_filters_key    INDEX     �   CREATE UNIQUE INDEX subscription_subscription_id_entity_filters_key ON realtime.subscription USING btree (subscription_id, entity, filters);
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
       auth          supabase_auth_admin    false    732    332            �           2620    31082 $   learning_projects addProjectOnCreate    TRIGGER     �   CREATE TRIGGER "addProjectOnCreate" AFTER INSERT ON public.learning_projects FOR EACH ROW EXECUTE FUNCTION public."addProjectOnCreate"();
 ?   DROP TRIGGER "addProjectOnCreate" ON public.learning_projects;
       public          supabase_admin    false    727    437            �           2620    45186    profiles guard_profiles_trigger    TRIGGER     �   CREATE TRIGGER guard_profiles_trigger BEFORE INSERT OR DELETE OR UPDATE ON public.profiles FOR EACH ROW EXECUTE FUNCTION public.guard_profiles();
 8   DROP TRIGGER guard_profiles_trigger ON public.profiles;
       public          supabase_admin    false    577    432            �           2620    85705    rooms upd_rooms_tracker    TRIGGER     �   CREATE TRIGGER upd_rooms_tracker AFTER INSERT OR DELETE OR UPDATE ON public.rooms FOR EACH STATEMENT EXECUTE FUNCTION public.update_last_updated();
 0   DROP TRIGGER upd_rooms_tracker ON public.rooms;
       public          supabase_admin    false    446    729            �           2620    85775 !   profiles upd_rooms_tracker_joined    TRIGGER     �   CREATE TRIGGER upd_rooms_tracker_joined AFTER DELETE OR UPDATE ON public.profiles FOR EACH STATEMENT EXECUTE FUNCTION public.update_last_updated();
 :   DROP TRIGGER upd_rooms_tracker_joined ON public.profiles;
       public          supabase_admin    false    432    729            �           2620    37192 -   learning_projects updateLearningProjectsGuard    TRIGGER     �   CREATE TRIGGER "updateLearningProjectsGuard" BEFORE UPDATE ON public.learning_projects FOR EACH ROW EXECUTE FUNCTION public.guard_learning_projects();
 H   DROP TRIGGER "updateLearningProjectsGuard" ON public.learning_projects;
       public          supabase_admin    false    437    616            �           2620    135401 &   project_ratings update_ratings_trigger    TRIGGER     �   CREATE TRIGGER update_ratings_trigger AFTER INSERT OR DELETE OR UPDATE ON public.project_ratings FOR EACH STATEMENT EXECUTE FUNCTION public.update_statistics();
 ?   DROP TRIGGER update_ratings_trigger ON public.project_ratings;
       public          supabase_admin    false    756    452            �           2620    53162    subscription tr_check_filters    TRIGGER     �   CREATE TRIGGER tr_check_filters BEFORE INSERT OR UPDATE ON realtime.subscription FOR EACH ROW EXECUTE FUNCTION realtime.subscription_check_filters();
 8   DROP TRIGGER tr_check_filters ON realtime.subscription;
       realtime          supabase_admin    false    506    461            �           2620    426693    objects log_updates_on_objects    TRIGGER     �   CREATE TRIGGER log_updates_on_objects AFTER INSERT OR DELETE OR UPDATE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.update_files();
 8   DROP TRIGGER log_updates_on_objects ON storage.objects;
       storage          supabase_storage_admin    false    339    497            �           2620    17915 !   objects update_objects_updated_at    TRIGGER     �   CREATE TRIGGER update_objects_updated_at BEFORE UPDATE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.update_updated_at_column();
 ;   DROP TRIGGER update_objects_updated_at ON storage.objects;
       storage          supabase_storage_admin    false    339    722            �           2606    17271 .   billing_accounts billing_accounts_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY _analytics.billing_accounts
    ADD CONSTRAINT billing_accounts_user_id_fkey FOREIGN KEY (user_id) REFERENCES _analytics.users(id) ON DELETE CASCADE;
 \   ALTER TABLE ONLY _analytics.billing_accounts DROP CONSTRAINT billing_accounts_user_id_fkey;
    
   _analytics          supabase_admin    false    4277    389    369            �           2606    17429 *   billing_counts billing_counts_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY _analytics.billing_counts
    ADD CONSTRAINT billing_counts_user_id_fkey FOREIGN KEY (user_id) REFERENCES _analytics.users(id) ON DELETE CASCADE;
 X   ALTER TABLE ONLY _analytics.billing_counts DROP CONSTRAINT billing_counts_user_id_fkey;
    
   _analytics          supabase_admin    false    403    369    4277            �           2606    17478 7   endpoint_queries endpoint_queries_sandbox_query_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY _analytics.endpoint_queries
    ADD CONSTRAINT endpoint_queries_sandbox_query_id_fkey FOREIGN KEY (sandbox_query_id) REFERENCES _analytics.endpoint_queries(id);
 e   ALTER TABLE ONLY _analytics.endpoint_queries DROP CONSTRAINT endpoint_queries_sandbox_query_id_fkey;
    
   _analytics          supabase_admin    false    401    4332    401            �           2606    17414 .   endpoint_queries endpoint_queries_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY _analytics.endpoint_queries
    ADD CONSTRAINT endpoint_queries_user_id_fkey FOREIGN KEY (user_id) REFERENCES _analytics.users(id);
 \   ALTER TABLE ONLY _analytics.endpoint_queries DROP CONSTRAINT endpoint_queries_user_id_fkey;
    
   _analytics          supabase_admin    false    369    401    4277            �           2606    17116 ;   oauth_access_grants oauth_access_grants_application_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY _analytics.oauth_access_grants
    ADD CONSTRAINT oauth_access_grants_application_id_fkey FOREIGN KEY (application_id) REFERENCES _analytics.oauth_applications(id);
 i   ALTER TABLE ONLY _analytics.oauth_access_grants DROP CONSTRAINT oauth_access_grants_application_id_fkey;
    
   _analytics          supabase_admin    false    377    4289    375            �           2606    17132 ;   oauth_access_tokens oauth_access_tokens_application_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY _analytics.oauth_access_tokens
    ADD CONSTRAINT oauth_access_tokens_application_id_fkey FOREIGN KEY (application_id) REFERENCES _analytics.oauth_applications(id);
 i   ALTER TABLE ONLY _analytics.oauth_access_tokens DROP CONSTRAINT oauth_access_tokens_application_id_fkey;
    
   _analytics          supabase_admin    false    4289    375    379            �           2606    17500 +   partner_users partner_users_partner_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY _analytics.partner_users
    ADD CONSTRAINT partner_users_partner_id_fkey FOREIGN KEY (partner_id) REFERENCES _analytics.partners(id);
 Y   ALTER TABLE ONLY _analytics.partner_users DROP CONSTRAINT partner_users_partner_id_fkey;
    
   _analytics          supabase_admin    false    4343    409    407            �           2606    17505 (   partner_users partner_users_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY _analytics.partner_users
    ADD CONSTRAINT partner_users_user_id_fkey FOREIGN KEY (user_id) REFERENCES _analytics.users(id);
 V   ALTER TABLE ONLY _analytics.partner_users DROP CONSTRAINT partner_users_user_id_fkey;
    
   _analytics          supabase_admin    false    409    369    4277            �           2606    17370 0   payment_methods payment_methods_customer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY _analytics.payment_methods
    ADD CONSTRAINT payment_methods_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES _analytics.billing_accounts(stripe_customer) ON DELETE CASCADE;
 ^   ALTER TABLE ONLY _analytics.payment_methods DROP CONSTRAINT payment_methods_customer_id_fkey;
    
   _analytics          supabase_admin    false    4315    389    397            �           2606    17183    rules rules_sink_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY _analytics.rules
    ADD CONSTRAINT rules_sink_fkey FOREIGN KEY (sink) REFERENCES _analytics.sources(token) ON DELETE CASCADE;
 C   ALTER TABLE ONLY _analytics.rules DROP CONSTRAINT rules_sink_fkey;
    
   _analytics          supabase_admin    false    4282    373    371            �           2606    17087    rules rules_source_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY _analytics.rules
    ADD CONSTRAINT rules_source_id_fkey FOREIGN KEY (source_id) REFERENCES _analytics.sources(id) ON DELETE CASCADE;
 H   ALTER TABLE ONLY _analytics.rules DROP CONSTRAINT rules_source_id_fkey;
    
   _analytics          supabase_admin    false    4280    371    373            �           2606    17315 @   saved_search_counters saved_search_counters_saved_search_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY _analytics.saved_search_counters
    ADD CONSTRAINT saved_search_counters_saved_search_id_fkey FOREIGN KEY (saved_search_id) REFERENCES _analytics.saved_searches(id) ON DELETE CASCADE;
 n   ALTER TABLE ONLY _analytics.saved_search_counters DROP CONSTRAINT saved_search_counters_saved_search_id_fkey;
    
   _analytics          supabase_admin    false    391    4303    383            �           2606    17278 ,   saved_searches saved_searches_source_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY _analytics.saved_searches
    ADD CONSTRAINT saved_searches_source_id_fkey FOREIGN KEY (source_id) REFERENCES _analytics.sources(id) ON DELETE CASCADE;
 Z   ALTER TABLE ONLY _analytics.saved_searches DROP CONSTRAINT saved_searches_source_id_fkey;
    
   _analytics          supabase_admin    false    4280    371    383            �           2606    17469 .   source_backends source_backends_source_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY _analytics.source_backends
    ADD CONSTRAINT source_backends_source_id_fkey FOREIGN KEY (source_id) REFERENCES _analytics.sources(id);
 \   ALTER TABLE ONLY _analytics.source_backends DROP CONSTRAINT source_backends_source_id_fkey;
    
   _analytics          supabase_admin    false    371    4280    405            �           2606    17330 ,   source_schemas source_schemas_source_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY _analytics.source_schemas
    ADD CONSTRAINT source_schemas_source_id_fkey FOREIGN KEY (source_id) REFERENCES _analytics.sources(id) ON DELETE CASCADE;
 Z   ALTER TABLE ONLY _analytics.source_schemas DROP CONSTRAINT source_schemas_source_id_fkey;
    
   _analytics          supabase_admin    false    371    395    4280            �           2606    17178    sources sources_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY _analytics.sources
    ADD CONSTRAINT sources_user_id_fkey FOREIGN KEY (user_id) REFERENCES _analytics.users(id) ON DELETE CASCADE;
 J   ALTER TABLE ONLY _analytics.sources DROP CONSTRAINT sources_user_id_fkey;
    
   _analytics          supabase_admin    false    4277    371    369            �           2606    17248 "   team_users team_users_team_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY _analytics.team_users
    ADD CONSTRAINT team_users_team_id_fkey FOREIGN KEY (team_id) REFERENCES _analytics.teams(id) ON DELETE CASCADE;
 P   ALTER TABLE ONLY _analytics.team_users DROP CONSTRAINT team_users_team_id_fkey;
    
   _analytics          supabase_admin    false    387    385    4306            �           2606    17232    teams teams_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY _analytics.teams
    ADD CONSTRAINT teams_user_id_fkey FOREIGN KEY (user_id) REFERENCES _analytics.users(id) ON DELETE CASCADE;
 F   ALTER TABLE ONLY _analytics.teams DROP CONSTRAINT teams_user_id_fkey;
    
   _analytics          supabase_admin    false    385    4277    369            �           2606    17400 &   vercel_auths vercel_auths_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY _analytics.vercel_auths
    ADD CONSTRAINT vercel_auths_user_id_fkey FOREIGN KEY (user_id) REFERENCES _analytics.users(id) ON DELETE CASCADE;
 T   ALTER TABLE ONLY _analytics.vercel_auths DROP CONSTRAINT vercel_auths_user_id_fkey;
    
   _analytics          supabase_admin    false    369    4277    399            �           2606    17882 -   extensions extensions_tenant_external_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY _realtime.extensions
    ADD CONSTRAINT extensions_tenant_external_id_fkey FOREIGN KEY (tenant_external_id) REFERENCES _realtime.tenants(external_id) ON DELETE CASCADE;
 Z   ALTER TABLE ONLY _realtime.extensions DROP CONSTRAINT extensions_tenant_external_id_fkey;
    	   _realtime          supabase_admin    false    4410    431    430            �           2606    17646 "   identities identities_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;
 J   ALTER TABLE ONLY auth.identities DROP CONSTRAINT identities_user_id_fkey;
       auth          supabase_auth_admin    false    4228    332    419            �           2606    17735 -   mfa_amr_claims mfa_amr_claims_session_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;
 U   ALTER TABLE ONLY auth.mfa_amr_claims DROP CONSTRAINT mfa_amr_claims_session_id_fkey;
       auth          supabase_auth_admin    false    423    420    4371            �           2606    17723 1   mfa_challenges mfa_challenges_auth_factor_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_auth_factor_id_fkey FOREIGN KEY (factor_id) REFERENCES auth.mfa_factors(id) ON DELETE CASCADE;
 Y   ALTER TABLE ONLY auth.mfa_challenges DROP CONSTRAINT mfa_challenges_auth_factor_id_fkey;
       auth          supabase_auth_admin    false    4376    422    421            �           2606    17710 $   mfa_factors mfa_factors_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;
 L   ALTER TABLE ONLY auth.mfa_factors DROP CONSTRAINT mfa_factors_user_id_fkey;
       auth          supabase_auth_admin    false    332    421    4228                       2606    17679 -   refresh_tokens refresh_tokens_session_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;
 U   ALTER TABLE ONLY auth.refresh_tokens DROP CONSTRAINT refresh_tokens_session_id_fkey;
       auth          supabase_auth_admin    false    4371    420    334            �           2606    17782 2   saml_providers saml_providers_sso_provider_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;
 Z   ALTER TABLE ONLY auth.saml_providers DROP CONSTRAINT saml_providers_sso_provider_id_fkey;
       auth          supabase_auth_admin    false    4387    424    426            �           2606    17855 6   saml_relay_states saml_relay_states_flow_state_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_flow_state_id_fkey FOREIGN KEY (flow_state_id) REFERENCES auth.flow_state(id) ON DELETE CASCADE;
 ^   ALTER TABLE ONLY auth.saml_relay_states DROP CONSTRAINT saml_relay_states_flow_state_id_fkey;
       auth          supabase_auth_admin    false    428    4405    427            �           2606    17796 8   saml_relay_states saml_relay_states_sso_provider_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;
 `   ALTER TABLE ONLY auth.saml_relay_states DROP CONSTRAINT saml_relay_states_sso_provider_id_fkey;
       auth          supabase_auth_admin    false    4387    427    424            �           2606    17674    sessions sessions_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;
 F   ALTER TABLE ONLY auth.sessions DROP CONSTRAINT sessions_user_id_fkey;
       auth          supabase_auth_admin    false    420    4228    332            �           2606    17763 ,   sso_domains sso_domains_sso_provider_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;
 T   ALTER TABLE ONLY auth.sso_domains DROP CONSTRAINT sso_domains_sso_provider_id_fkey;
       auth          supabase_auth_admin    false    4387    425    424            �           2606    216848 1   answers_exercises answers_exercises_exercise_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.answers_exercises
    ADD CONSTRAINT answers_exercises_exercise_fkey FOREIGN KEY (exercise) REFERENCES public.exercises(id) ON UPDATE CASCADE ON DELETE CASCADE;
 [   ALTER TABLE ONLY public.answers_exercises DROP CONSTRAINT answers_exercises_exercise_fkey;
       public          supabase_admin    false    4433    439    445            �           2606    38312    exercises exercises_set_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.exercises
    ADD CONSTRAINT exercises_set_id_fkey FOREIGN KEY (set_id) REFERENCES public.sets(id) ON UPDATE CASCADE ON DELETE CASCADE;
 I   ALTER TABLE ONLY public.exercises DROP CONSTRAINT exercises_set_id_fkey;
       public          supabase_admin    false    4460    439    454            �           2606    38342 !   flashcards flashcards_set_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.flashcards
    ADD CONSTRAINT flashcards_set_id_fkey FOREIGN KEY (set_id) REFERENCES public.sets(id) ON UPDATE CASCADE ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.flashcards DROP CONSTRAINT flashcards_set_id_fkey;
       public          supabase_admin    false    454    4460    441            �           2606    38527 !   friends friends_user_from_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.friends
    ADD CONSTRAINT friends_user_from_id_fkey FOREIGN KEY (user_from_id) REFERENCES auth.users(id) ON UPDATE CASCADE ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.friends DROP CONSTRAINT friends_user_from_id_fkey;
       public          supabase_admin    false    4228    433    332            �           2606    38532    friends friends_user_to_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.friends
    ADD CONSTRAINT friends_user_to_id_fkey FOREIGN KEY (user_to_id) REFERENCES auth.users(id) ON UPDATE CASCADE ON DELETE CASCADE;
 I   ALTER TABLE ONLY public.friends DROP CONSTRAINT friends_user_to_id_fkey;
       public          supabase_admin    false    332    433    4228            �           2606    37247 1   learning_projects learning_projects_owner_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.learning_projects
    ADD CONSTRAINT learning_projects_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES auth.users(id);
 [   ALTER TABLE ONLY public.learning_projects DROP CONSTRAINT learning_projects_owner_id_fkey;
       public          supabase_admin    false    437    4228    332            �           2606    27202 !   links links_learning_project_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.links
    ADD CONSTRAINT links_learning_project_fkey FOREIGN KEY (learning_project) REFERENCES public.learning_projects(id);
 K   ALTER TABLE ONLY public.links DROP CONSTRAINT links_learning_project_fkey;
       public          supabase_admin    false    437    443    4431            �           2606    135422 *   player_answers player_answers_room_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.player_answers
    ADD CONSTRAINT player_answers_room_id_fkey FOREIGN KEY (room_id) REFERENCES public.rooms(id) ON UPDATE CASCADE ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.player_answers DROP CONSTRAINT player_answers_room_id_fkey;
       public          supabase_admin    false    465    446    4445            �           2606    135427 *   player_answers player_answers_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.player_answers
    ADD CONSTRAINT player_answers_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON UPDATE CASCADE ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.player_answers DROP CONSTRAINT player_answers_user_id_fkey;
       public          supabase_admin    false    332    4228    465            �           2606    93918 4   private_room_states private_room_states_room_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.private_room_states
    ADD CONSTRAINT private_room_states_room_id_fkey FOREIGN KEY (room_id) REFERENCES public.rooms(id) ON UPDATE CASCADE ON DELETE CASCADE;
 ^   ALTER TABLE ONLY public.private_room_states DROP CONSTRAINT private_room_states_room_id_fkey;
       public          supabase_admin    false    457    446    4445            �           2606    44876    profiles profiles_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_id_fkey FOREIGN KEY (id) REFERENCES auth.users(id) ON UPDATE CASCADE ON DELETE CASCADE;
 C   ALTER TABLE ONLY public.profiles DROP CONSTRAINT profiles_id_fkey;
       public          supabase_admin    false    332    4228    432            �           2606    335122    profiles profiles_room_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_room_id_fkey FOREIGN KEY (room_id) REFERENCES public.rooms(id) ON DELETE SET NULL;
 H   ALTER TABLE ONLY public.profiles DROP CONSTRAINT profiles_room_id_fkey;
       public          supabase_admin    false    432    4445    446            �           2606    37200 /   project_ratings project_ratings_project_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.project_ratings
    ADD CONSTRAINT project_ratings_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.learning_projects(id);
 Y   ALTER TABLE ONLY public.project_ratings DROP CONSTRAINT project_ratings_project_id_fkey;
       public          supabase_admin    false    452    4431    437            �           2606    37195 ,   project_ratings project_ratings_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.project_ratings
    ADD CONSTRAINT project_ratings_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id);
 V   ALTER TABLE ONLY public.project_ratings DROP CONSTRAINT project_ratings_user_id_fkey;
       public          supabase_admin    false    452    4228    332            �           2606    53020 2   public_room_states public_room_states_room_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.public_room_states
    ADD CONSTRAINT public_room_states_room_id_fkey FOREIGN KEY (room_id) REFERENCES public.rooms(id) ON UPDATE CASCADE ON DELETE CASCADE;
 \   ALTER TABLE ONLY public.public_room_states DROP CONSTRAINT public_room_states_room_id_fkey;
       public          supabase_admin    false    4445    456    446            �           2606    233305    queue queue_room_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.queue
    ADD CONSTRAINT queue_room_id_fkey FOREIGN KEY (room_id) REFERENCES public.rooms(id) ON UPDATE CASCADE ON DELETE CASCADE;
 B   ALTER TABLE ONLY public.queue DROP CONSTRAINT queue_room_id_fkey;
       public          supabase_admin    false    446    467    4445            �           2606    45102    rooms rooms_project_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.learning_projects(id) ON UPDATE CASCADE ON DELETE CASCADE;
 E   ALTER TABLE ONLY public.rooms DROP CONSTRAINT rooms_project_id_fkey;
       public          supabase_admin    false    446    437    4431            �           2606    38352    sets sets_project_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sets
    ADD CONSTRAINT sets_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.learning_projects(id) ON UPDATE CASCADE ON DELETE CASCADE;
 C   ALTER TABLE ONLY public.sets DROP CONSTRAINT sets_project_id_fkey;
       public          supabase_admin    false    437    454    4431            �           2606    86866 7   user_achievements user_achievements_achievement_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_achievements
    ADD CONSTRAINT user_achievements_achievement_id_fkey FOREIGN KEY (achievement_id) REFERENCES public.achievements(id);
 a   ALTER TABLE ONLY public.user_achievements DROP CONSTRAINT user_achievements_achievement_id_fkey;
       public          supabase_admin    false    434    4428    435            �           2606    86871 0   user_achievements user_achievements_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_achievements
    ADD CONSTRAINT user_achievements_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON UPDATE CASCADE ON DELETE CASCADE;
 Z   ALTER TABLE ONLY public.user_achievements DROP CONSTRAINT user_achievements_user_id_fkey;
       public          supabase_admin    false    434    4228    332            �           2606    38256 F   user_learning_projects user_learning_projects_learning_project_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_learning_projects
    ADD CONSTRAINT user_learning_projects_learning_project_id_fkey FOREIGN KEY (learning_project_id) REFERENCES public.learning_projects(id) ON UPDATE CASCADE ON DELETE CASCADE;
 p   ALTER TABLE ONLY public.user_learning_projects DROP CONSTRAINT user_learning_projects_learning_project_id_fkey;
       public          supabase_admin    false    447    437    4431            �           2606    38263 :   user_learning_projects user_learning_projects_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_learning_projects
    ADD CONSTRAINT user_learning_projects_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON UPDATE CASCADE ON DELETE CASCADE;
 d   ALTER TABLE ONLY public.user_learning_projects DROP CONSTRAINT user_learning_projects_user_id_fkey;
       public          supabase_admin    false    4228    332    447            �           2606    16518    buckets buckets_owner_fkey    FK CONSTRAINT     v   ALTER TABLE ONLY storage.buckets
    ADD CONSTRAINT buckets_owner_fkey FOREIGN KEY (owner) REFERENCES auth.users(id);
 E   ALTER TABLE ONLY storage.buckets DROP CONSTRAINT buckets_owner_fkey;
       storage          supabase_storage_admin    false    338    332    4228            �           2606    16535    objects objects_bucketId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT "objects_bucketId_fkey" FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);
 J   ALTER TABLE ONLY storage.objects DROP CONSTRAINT "objects_bucketId_fkey";
       storage          supabase_storage_admin    false    338    4247    339            k           3256    29346    job cron_job_policy    POLICY     M   CREATE POLICY cron_job_policy ON cron.job USING ((username = CURRENT_USER));
 )   DROP POLICY cron_job_policy ON cron.job;
       cron          supabase_admin    false    2    2    2    2    2    2    2    2            l           3256    29361 +   job_run_details cron_job_run_details_policy    POLICY     e   CREATE POLICY cron_job_run_details_policy ON cron.job_run_details USING ((username = CURRENT_USER));
 A   DROP POLICY cron_job_run_details_policy ON cron.job_run_details;
       cron          supabase_admin    false    2    2    2    2    2    2    2    2            b           0    29334    job    ROW SECURITY     /   ALTER TABLE cron.job ENABLE ROW LEVEL SECURITY;          cron          supabase_admin    false    449            c           0    29353    job_run_details    ROW SECURITY     ;   ALTER TABLE cron.job_run_details ENABLE ROW LEVEL SECURITY;          cron          supabase_admin    false    451            �           3256    93958 4   learning_projects Allows owner to delete the project    POLICY     �   CREATE POLICY "Allows owner to delete the project" ON public.learning_projects FOR DELETE TO authenticated USING ((auth.uid() = owner_id));
 N   DROP POLICY "Allows owner to delete the project" ON public.learning_projects;
       public          supabase_admin    false    437    493    437            y           3256    44786 7   answers_exercises Enable access for all project members    POLICY     �  CREATE POLICY "Enable access for all project members" ON public.answers_exercises TO authenticated USING (( SELECT (EXISTS ( SELECT 1
           FROM public.exercises
          WHERE (answers_exercises.exercise = exercises.id))) AS "exists")) WITH CHECK (( SELECT (EXISTS ( SELECT 1
           FROM public.exercises
          WHERE (answers_exercises.exercise = exercises.id))) AS "exists"));
 Q   DROP POLICY "Enable access for all project members" ON public.answers_exercises;
       public          supabase_admin    false    445    445    439    445    439            x           3256    39108 +   exercises Enable access for project members    POLICY     S  CREATE POLICY "Enable access for project members" ON public.exercises TO authenticated USING (( SELECT (EXISTS ( SELECT 1
           FROM public.sets s
          WHERE (s.id = exercises.set_id))) AS "exists")) WITH CHECK (( SELECT (EXISTS ( SELECT 1
           FROM public.sets s
          WHERE (s.id = exercises.set_id))) AS "exists"));
 E   DROP POLICY "Enable access for project members" ON public.exercises;
       public          supabase_admin    false    454    439    439    439    454            z           3256    45123 '   links Enable access for project members    POLICY     }  CREATE POLICY "Enable access for project members" ON public.links TO authenticated USING (( SELECT (EXISTS ( SELECT 1
           FROM public.learning_projects lps
          WHERE (lps.id = links.learning_project))) AS "exists")) WITH CHECK (( SELECT (EXISTS ( SELECT 1
           FROM public.learning_projects lps
          WHERE (lps.id = links.learning_project))) AS "exists"));
 A   DROP POLICY "Enable access for project members" ON public.links;
       public          supabase_admin    false    443    443    437    443    437            �           3256    118492 4   project_ratings Enable access to authenticated users    POLICY     �   CREATE POLICY "Enable access to authenticated users" ON public.project_ratings TO authenticated USING ((user_id = auth.uid())) WITH CHECK ((user_id = auth.uid()));
 N   DROP POLICY "Enable access to authenticated users" ON public.project_ratings;
       public          supabase_admin    false    493    452    452    493    452            w           3256    39086 +   flashcards Enable access to project members    POLICY     U  CREATE POLICY "Enable access to project members" ON public.flashcards TO authenticated USING (( SELECT (EXISTS ( SELECT 1
           FROM public.sets s
          WHERE (s.id = flashcards.set_id))) AS "exists")) WITH CHECK (( SELECT (EXISTS ( SELECT 1
           FROM public.sets s
          WHERE (s.id = flashcards.set_id))) AS "exists"));
 E   DROP POLICY "Enable access to project members" ON public.flashcards;
       public          supabase_admin    false    441    454    441    441    454            s           3256    38666    sets Enable delete for users    POLICY       CREATE POLICY "Enable delete for users" ON public.sets FOR DELETE TO authenticated USING (( SELECT (EXISTS ( SELECT 1
           FROM public.user_learning_projects ulp
          WHERE ((ulp.learning_project_id = sets.project_id) AND (auth.uid() = ulp.user_id)))) AS "exists"));
 6   DROP POLICY "Enable delete for users" ON public.sets;
       public          supabase_admin    false    447    493    454    454    447            u           3256    38670    sets Enable insert     POLICY       CREATE POLICY "Enable insert " ON public.sets FOR INSERT TO authenticated WITH CHECK (( SELECT (EXISTS ( SELECT 1
           FROM public.user_learning_projects ulp
          WHERE ((ulp.learning_project_id = sets.project_id) AND (auth.uid() = ulp.user_id)))) AS "exists"));
 -   DROP POLICY "Enable insert " ON public.sets;
       public          supabase_admin    false    447    493    447    454    454            o           3256    31083 <   learning_projects Enable insert for authenticated users only    POLICY     �   CREATE POLICY "Enable insert for authenticated users only" ON public.learning_projects FOR INSERT TO authenticated WITH CHECK ((auth.uid() = owner_id));
 V   DROP POLICY "Enable insert for authenticated users only" ON public.learning_projects;
       public          supabase_admin    false    437    493    437            m           3256    27398 -   achievements Enable read access for all users    POLICY     r   CREATE POLICY "Enable read access for all users" ON public.achievements FOR SELECT TO authenticated USING (true);
 G   DROP POLICY "Enable read access for all users" ON public.achievements;
       public          supabase_admin    false    435            ~           3256    53566 3   public_room_states Enable read access for all users    POLICY     x   CREATE POLICY "Enable read access for all users" ON public.public_room_states FOR SELECT TO authenticated USING (true);
 M   DROP POLICY "Enable read access for all users" ON public.public_room_states;
       public          supabase_admin    false    456                       3256    69395 (   tracker Enable read access for all users    POLICY     m   CREATE POLICY "Enable read access for all users" ON public.tracker FOR SELECT TO authenticated USING (true);
 B   DROP POLICY "Enable read access for all users" ON public.tracker;
       public          supabase_admin    false    464            �           3256    86784 2   user_achievements Enable read access for all users    POLICY     �   CREATE POLICY "Enable read access for all users" ON public.user_achievements FOR INSERT TO authenticated WITH CHECK ((user_id = auth.uid()));
 L   DROP POLICY "Enable read access for all users" ON public.user_achievements;
       public          supabase_admin    false    493    434    434            �           3256    86785 3   user_achievements Enable read access for all users!    POLICY     �   CREATE POLICY "Enable read access for all users!" ON public.user_achievements FOR UPDATE TO authenticated USING ((user_id = auth.uid())) WITH CHECK ((user_id = auth.uid()));
 M   DROP POLICY "Enable read access for all users!" ON public.user_achievements;
       public          supabase_admin    false    493    493    434    434    434            r           3256    36222 F   learning_projects Enable read access for owners and members of project    POLICY     _  CREATE POLICY "Enable read access for owners and members of project" ON public.learning_projects FOR SELECT TO authenticated USING (((auth.uid() = owner_id) OR ( SELECT (EXISTS ( SELECT 1
           FROM public.user_learning_projects up
          WHERE ((up.learning_project_id = learning_projects.id) AND (up.user_id = auth.uid())))) AS "exists")));
 `   DROP POLICY "Enable read access for owners and members of project" ON public.learning_projects;
       public          supabase_admin    false    447    437    493    437    437    447            t           3256    38585 +   sets Enable read access for project members    POLICY     %  CREATE POLICY "Enable read access for project members" ON public.sets FOR SELECT TO authenticated USING (( SELECT (EXISTS ( SELECT 1
           FROM public.user_learning_projects ulp
          WHERE ((ulp.learning_project_id = sets.project_id) AND (auth.uid() = ulp.user_id)))) AS "exists"));
 E   DROP POLICY "Enable read access for project members" ON public.sets;
       public          supabase_admin    false    454    447    447    493    454            v           3256    38774    sets Enable update     POLICY     �  CREATE POLICY "Enable update " ON public.sets FOR UPDATE TO authenticated USING (( SELECT (EXISTS ( SELECT 1
           FROM public.user_learning_projects ulp
          WHERE ((ulp.learning_project_id = sets.project_id) AND (auth.uid() = ulp.user_id)))) AS "exists")) WITH CHECK (( SELECT (EXISTS ( SELECT 1
           FROM public.user_learning_projects ulp
          WHERE ((ulp.learning_project_id = sets.project_id) AND (auth.uid() = ulp.user_id)))) AS "exists"));
 -   DROP POLICY "Enable update " ON public.sets;
       public          supabase_admin    false    454    454    447    447    493    454    447    447    493            }           3256    53000 @   friends Enable user to delete received and sent friend requests     POLICY     �   CREATE POLICY "Enable user to delete received and sent friend requests " ON public.friends FOR DELETE TO authenticated USING (((user_to_id = auth.uid()) OR (user_from_id = auth.uid())));
 Z   DROP POLICY "Enable user to delete received and sent friend requests " ON public.friends;
       public          supabase_admin    false    433    493    433    433            �           3256    53113 8   friends Enable users to insert their own friend requests    POLICY     �   CREATE POLICY "Enable users to insert their own friend requests" ON public.friends FOR INSERT TO authenticated WITH CHECK (((user_from_id = auth.uid()) AND (NOT (user_from_id = user_to_id))));
 R   DROP POLICY "Enable users to insert their own friend requests" ON public.friends;
       public          supabase_admin    false    433    433    433    493            �           3256    53114 8   friends Enable users to update their own friend requests    POLICY       CREATE POLICY "Enable users to update their own friend requests" ON public.friends FOR UPDATE TO authenticated USING (((user_from_id = auth.uid()) AND (NOT (user_from_id = user_to_id)))) WITH CHECK (((user_from_id = auth.uid()) AND (NOT (user_from_id = user_to_id))));
 R   DROP POLICY "Enable users to update their own friend requests" ON public.friends;
       public          supabase_admin    false    493    433    433    433    493    433    433            {           3256    45350 6   user_achievements Users can see their own achievements    POLICY     �   CREATE POLICY "Users can see their own achievements" ON public.user_achievements FOR SELECT TO authenticated USING ((auth.uid() = user_id));
 P   DROP POLICY "Users can see their own achievements" ON public.user_achievements;
       public          supabase_admin    false    434    493    434            Z           0    26881    achievements    ROW SECURITY     :   ALTER TABLE public.achievements ENABLE ROW LEVEL SECURITY;          public          supabase_admin    false    435            q           3256    31164 3   learning_projects allow update if user owns project    POLICY     �   CREATE POLICY "allow update if user owns project" ON public.learning_projects FOR UPDATE TO authenticated USING ((auth.uid() = owner_id)) WITH CHECK ((auth.uid() = owner_id));
 M   DROP POLICY "allow update if user owns project" ON public.learning_projects;
       public          supabase_admin    false    437    493    493    437    437            _           0    27130    answers_exercises    ROW SECURITY     ?   ALTER TABLE public.answers_exercises ENABLE ROW LEVEL SECURITY;          public          supabase_admin    false    445            \           0    27056 	   exercises    ROW SECURITY     7   ALTER TABLE public.exercises ENABLE ROW LEVEL SECURITY;          public          supabase_admin    false    439            ]           0    27074 
   flashcards    ROW SECURITY     8   ALTER TABLE public.flashcards ENABLE ROW LEVEL SECURITY;          public          supabase_admin    false    441            X           0    26804    friends    ROW SECURITY     5   ALTER TABLE public.friends ENABLE ROW LEVEL SECURITY;          public          supabase_admin    false    433            [           0    26976    learning_projects    ROW SECURITY     ?   ALTER TABLE public.learning_projects ENABLE ROW LEVEL SECURITY;          public          supabase_admin    false    437            ^           0    27113    links    ROW SECURITY     3   ALTER TABLE public.links ENABLE ROW LEVEL SECURITY;          public          supabase_admin    false    443            |           3256    45879 8   friends outgoing and incoming friend request can be read    POLICY     �   CREATE POLICY "outgoing and incoming friend request can be read" ON public.friends FOR SELECT TO authenticated USING (((user_to_id = auth.uid()) OR (user_from_id = auth.uid())));
 R   DROP POLICY "outgoing and incoming friend request can be read" ON public.friends;
       public          supabase_admin    false    493    433    433    433            i           0    135317    player_answers    ROW SECURITY     <   ALTER TABLE public.player_answers ENABLE ROW LEVEL SECURITY;          public          supabase_admin    false    465            g           0    53025    private_room_states    ROW SECURITY     A   ALTER TABLE public.private_room_states ENABLE ROW LEVEL SECURITY;          public          supabase_admin    false    457            W           0    26744    profiles    ROW SECURITY     6   ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;          public          supabase_admin    false    432            d           0    30854    project_ratings    ROW SECURITY     =   ALTER TABLE public.project_ratings ENABLE ROW LEVEL SECURITY;          public          supabase_admin    false    452            f           0    53001    public_room_states    ROW SECURITY     @   ALTER TABLE public.public_room_states ENABLE ROW LEVEL SECURITY;          public          supabase_admin    false    456            j           0    233293    queue    ROW SECURITY     3   ALTER TABLE public.queue ENABLE ROW LEVEL SECURITY;          public          supabase_admin    false    467            `           0    27238    rooms    ROW SECURITY     3   ALTER TABLE public.rooms ENABLE ROW LEVEL SECURITY;          public          supabase_admin    false    446            e           0    38289    sets    ROW SECURITY     2   ALTER TABLE public.sets ENABLE ROW LEVEL SECURITY;          public          supabase_admin    false    454            h           0    69388    tracker    ROW SECURITY     5   ALTER TABLE public.tracker ENABLE ROW LEVEL SECURITY;          public          supabase_admin    false    464            �           3256    102112 .   user_learning_projects user can leave projects    POLICY     �   CREATE POLICY "user can leave projects" ON public.user_learning_projects FOR DELETE TO authenticated USING ((auth.uid() = user_id));
 H   DROP POLICY "user can leave projects" ON public.user_learning_projects;
       public          supabase_admin    false    447    493    447            p           3256    38288 =   user_learning_projects user can see their own joined projects    POLICY     �   CREATE POLICY "user can see their own joined projects" ON public.user_learning_projects FOR SELECT TO authenticated USING ((auth.uid() = user_id));
 W   DROP POLICY "user can see their own joined projects" ON public.user_learning_projects;
       public          supabase_admin    false    447    493    447            Y           0    26864    user_achievements    ROW SECURITY     ?   ALTER TABLE public.user_achievements ENABLE ROW LEVEL SECURITY;          public          supabase_admin    false    434            a           0    27260    user_learning_projects    ROW SECURITY     D   ALTER TABLE public.user_learning_projects ENABLE ROW LEVEL SECURITY;          public          supabase_admin    false    447            n           3256    30853 +   profiles users can update their own profile    POLICY     �   CREATE POLICY "users can update their own profile" ON public.profiles TO authenticated USING ((auth.uid() = id)) WITH CHECK ((auth.uid() = id));
 E   DROP POLICY "users can update their own profile" ON public.profiles;
       public          supabase_admin    false    493    432    432    493    432            �           3256    426742 =   objects Give users access to learning project folder in files    POLICY     r  CREATE POLICY "Give users access to learning project folder in files" ON storage.objects TO authenticated WITH CHECK (((bucket_id = 'files'::text) AND ( SELECT (EXISTS ( SELECT 1
           FROM public.user_learning_projects ulp
          WHERE (((ulp.learning_project_id)::text = (storage.foldername(objects.name))[1]) AND (auth.uid() = ulp.user_id)))) AS "exists")));
 X   DROP POLICY "Give users access to learning project folder in files" ON storage.objects;
       storage          supabase_storage_admin    false    339    447    493    447    339    339    485            �           3256    426741 8   objects Give users access to own profile-pictures folder    POLICY     ?  CREATE POLICY "Give users access to own profile-pictures folder" ON storage.objects TO authenticated USING (((bucket_id = 'profile-pictures'::text) AND ((auth.uid())::text = (storage.foldername(name))[1]))) WITH CHECK (((bucket_id = 'profile-pictures'::text) AND ((auth.uid())::text = (storage.foldername(name))[1])));
 S   DROP POLICY "Give users access to own profile-pictures folder" ON storage.objects;
       storage          supabase_storage_admin    false    339    493    493    339    339    485    339    485    339            T           0    16509    buckets    ROW SECURITY     6   ALTER TABLE storage.buckets ENABLE ROW LEVEL SECURITY;          storage          supabase_storage_admin    false    338            V           0    16551 
   migrations    ROW SECURITY     9   ALTER TABLE storage.migrations ENABLE ROW LEVEL SECURITY;          storage          supabase_storage_admin    false    340            U           0    16524    objects    ROW SECURITY     6   ALTER TABLE storage.objects ENABLE ROW LEVEL SECURITY;          storage          supabase_storage_admin    false    339            �           6104    17442    logflare_pub    PUBLICATION     U   CREATE PUBLICATION logflare_pub WITH (publish = 'insert, update, delete, truncate');
    DROP PUBLICATION logflare_pub;
                supabase_admin    false            �           6104    16387    supabase_realtime    PUBLICATION     Z   CREATE PUBLICATION supabase_realtime WITH (publish = 'insert, update, delete, truncate');
 $   DROP PUBLICATION supabase_realtime;
                postgres    false            �           6106    17443    logflare_pub billing_accounts    PUBLICATION TABLE     K   ALTER PUBLICATION logflare_pub ADD TABLE ONLY _analytics.billing_accounts;
       
   _analytics          supabase_admin    false    4745    389            �           6106    17444    logflare_pub plans    PUBLICATION TABLE     @   ALTER PUBLICATION logflare_pub ADD TABLE ONLY _analytics.plans;
       
   _analytics          supabase_admin    false    4745    393            �           6106    17445    logflare_pub rules    PUBLICATION TABLE     @   ALTER PUBLICATION logflare_pub ADD TABLE ONLY _analytics.rules;
       
   _analytics          supabase_admin    false    373    4745            �           6106    17446    logflare_pub source_schemas    PUBLICATION TABLE     I   ALTER PUBLICATION logflare_pub ADD TABLE ONLY _analytics.source_schemas;
       
   _analytics          supabase_admin    false    4745    395            �           6106    17447    logflare_pub sources    PUBLICATION TABLE     B   ALTER PUBLICATION logflare_pub ADD TABLE ONLY _analytics.sources;
       
   _analytics          supabase_admin    false    4745    371            �           6106    17448    logflare_pub users    PUBLICATION TABLE     @   ALTER PUBLICATION logflare_pub ADD TABLE ONLY _analytics.users;
       
   _analytics          supabase_admin    false    4745    369            �           6106    135294 #   supabase_realtime answers_exercises    PUBLICATION TABLE     M   ALTER PUBLICATION supabase_realtime ADD TABLE ONLY public.answers_exercises;
          public          postgres    false    445    4746            �           6106    135289    supabase_realtime exercises    PUBLICATION TABLE     E   ALTER PUBLICATION supabase_realtime ADD TABLE ONLY public.exercises;
          public          postgres    false    439    4746            �           6106    135290    supabase_realtime flashcards    PUBLICATION TABLE     F   ALTER PUBLICATION supabase_realtime ADD TABLE ONLY public.flashcards;
          public          postgres    false    441    4746            �           6106    135293    supabase_realtime friends    PUBLICATION TABLE     C   ALTER PUBLICATION supabase_realtime ADD TABLE ONLY public.friends;
          public          postgres    false    433    4746            �           6106    135297 #   supabase_realtime learning_projects    PUBLICATION TABLE     M   ALTER PUBLICATION supabase_realtime ADD TABLE ONLY public.learning_projects;
          public          postgres    false    437    4746            �           6106    135295    supabase_realtime links    PUBLICATION TABLE     A   ALTER PUBLICATION supabase_realtime ADD TABLE ONLY public.links;
          public          postgres    false    4746    443            �           6106    135291 $   supabase_realtime public_room_states    PUBLICATION TABLE     N   ALTER PUBLICATION supabase_realtime ADD TABLE ONLY public.public_room_states;
          public          postgres    false    4746    456            �           6106    135287    supabase_realtime sets    PUBLICATION TABLE     @   ALTER PUBLICATION supabase_realtime ADD TABLE ONLY public.sets;
          public          postgres    false    4746    454            �           6106    135288    supabase_realtime tracker    PUBLICATION TABLE     C   ALTER PUBLICATION supabase_realtime ADD TABLE ONLY public.tracker;
          public          postgres    false    464    4746            �           6106    135292 #   supabase_realtime user_achievements    PUBLICATION TABLE     M   ALTER PUBLICATION supabase_realtime ADD TABLE ONLY public.user_achievements;
          public          postgres    false    4746    434            �           6106    135296 (   supabase_realtime user_learning_projects    PUBLICATION TABLE     R   ALTER PUBLICATION supabase_realtime ADD TABLE ONLY public.user_learning_projects;
          public          postgres    false    4746    447            \           826    16665     DEFAULT PRIVILEGES FOR SEQUENCES    DEFAULT ACL     �   ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES TO dashboard_user;
          auth          supabase_auth_admin    false    34            ]           826    16666     DEFAULT PRIVILEGES FOR FUNCTIONS    DEFAULT ACL     �   ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS TO dashboard_user;
          auth          supabase_auth_admin    false    34            [           826    16664    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     �   ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES TO dashboard_user;
          auth          supabase_auth_admin    false    34            o           826    29332     DEFAULT PRIVILEGES FOR SEQUENCES    DEFAULT ACL     v   ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA cron GRANT ALL ON SEQUENCES TO postgres WITH GRANT OPTION;
          cron          supabase_admin    false    2            q           826    29331     DEFAULT PRIVILEGES FOR FUNCTIONS    DEFAULT ACL     v   ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA cron GRANT ALL ON FUNCTIONS TO postgres WITH GRANT OPTION;
          cron          supabase_admin    false    2            p           826    29330    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     s   ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA cron GRANT ALL ON TABLES TO postgres WITH GRANT OPTION;
          cron          supabase_admin    false    2            n           826    17048     DEFAULT PRIVILEGES FOR SEQUENCES    DEFAULT ACL     |   ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON SEQUENCES TO postgres WITH GRANT OPTION;
       
   extensions          supabase_admin    false    31            m           826    17047     DEFAULT PRIVILEGES FOR FUNCTIONS    DEFAULT ACL     |   ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON FUNCTIONS TO postgres WITH GRANT OPTION;
       
   extensions          supabase_admin    false    31            l           826    17046    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     y   ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON TABLES TO postgres WITH GRANT OPTION;
       
   extensions          supabase_admin    false    31            f           826    16699     DEFAULT PRIVILEGES FOR SEQUENCES    DEFAULT ACL     �  ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO service_role;
          graphql          supabase_admin    false    38            e           826    16698     DEFAULT PRIVILEGES FOR FUNCTIONS    DEFAULT ACL     �  ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO service_role;
          graphql          supabase_admin    false    38            d           826    16697    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     �  ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO service_role;
          graphql          supabase_admin    false    38            a           826    16679     DEFAULT PRIVILEGES FOR SEQUENCES    DEFAULT ACL     �  ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO service_role;
          graphql_public          supabase_admin    false    36            c           826    16678     DEFAULT PRIVILEGES FOR FUNCTIONS    DEFAULT ACL     �  ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO service_role;
          graphql_public          supabase_admin    false    36            b           826    16677    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     �  ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO service_role;
          graphql_public          supabase_admin    false    36            k           826    16907     DEFAULT PRIVILEGES FOR SEQUENCES    DEFAULT ACL     r   ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium GRANT ALL ON SEQUENCES TO pgsodium_keyholder;
          pgsodium          supabase_admin    false    41            j           826    16906    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     o   ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium GRANT ALL ON TABLES TO pgsodium_keyholder;
          pgsodium          supabase_admin    false    41            h           826    16904     DEFAULT PRIVILEGES FOR SEQUENCES    DEFAULT ACL     x   ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium_masks GRANT ALL ON SEQUENCES TO pgsodium_keyiduser;
          pgsodium_masks          supabase_admin    false    9            i           826    16905     DEFAULT PRIVILEGES FOR FUNCTIONS    DEFAULT ACL     x   ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium_masks GRANT ALL ON FUNCTIONS TO pgsodium_keyiduser;
          pgsodium_masks          supabase_admin    false    9            g           826    16903    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     u   ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium_masks GRANT ALL ON TABLES TO pgsodium_keyiduser;
          pgsodium_masks          supabase_admin    false    9            Q           826    16453     DEFAULT PRIVILEGES FOR SEQUENCES    DEFAULT ACL     �  ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO service_role;
          public          postgres    false            R           826    16454     DEFAULT PRIVILEGES FOR SEQUENCES    DEFAULT ACL     �  ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO service_role;
          public          supabase_admin    false            P           826    16452     DEFAULT PRIVILEGES FOR FUNCTIONS    DEFAULT ACL     �  ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO service_role;
          public          postgres    false            T           826    16456     DEFAULT PRIVILEGES FOR FUNCTIONS    DEFAULT ACL     �  ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO service_role;
          public          supabase_admin    false            O           826    16451    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     y  ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO service_role;
          public          postgres    false            S           826    16455    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     �  ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO service_role;
          public          supabase_admin    false            _           826    16669     DEFAULT PRIVILEGES FOR SEQUENCES    DEFAULT ACL     �   ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES TO dashboard_user;
          realtime          supabase_admin    false    65            `           826    16670     DEFAULT PRIVILEGES FOR FUNCTIONS    DEFAULT ACL     �   ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS TO dashboard_user;
          realtime          supabase_admin    false    65            ^           826    16668    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     �   ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES TO dashboard_user;
          realtime          supabase_admin    false    65            W           826    16508     DEFAULT PRIVILEGES FOR SEQUENCES    DEFAULT ACL     �  ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO service_role;
          storage          postgres    false    32            V           826    16507     DEFAULT PRIVILEGES FOR FUNCTIONS    DEFAULT ACL     �  ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO service_role;
          storage          postgres    false    32            U           826    16506    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     }  ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO service_role;
          storage          postgres    false    32            Z           826    16611     DEFAULT PRIVILEGES FOR SEQUENCES    DEFAULT ACL     �  ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON SEQUENCES TO service_role;
          supabase_functions          postgres    false    28            Y           826    16610     DEFAULT PRIVILEGES FOR FUNCTIONS    DEFAULT ACL     �  ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON FUNCTIONS TO service_role;
          supabase_functions          postgres    false    28            X           826    16609    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     �  ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA supabase_functions GRANT ALL ON TABLES TO postgres;
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
                postgres    false    710            �           3466    16681    issue_pg_graphql_access    EVENT TRIGGER     �   CREATE EVENT TRIGGER issue_pg_graphql_access ON ddl_command_end
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
                supabase_admin    false    598            �      x������ � �      �      x������ � �      �   X  x��Z[s�F~f~E�_�*�����qj�����ݤ�R�@)�<���+���Ӻ!@`�=�l�cI��;}�Υ/bm̢6Y,j�&۶$�Xe��23$l˶�5I�]3��/����̏��G$B���P�̉�g�zݑ�>!���}��6~�
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
�34^���*)�(�6���7�D`ޕp��nj�����;���ig7`Ň�6�#�!��۴�^{�p�����%!&KG��=�Z�#�Br�n�:(Kr[H1M�S-��ܽ펦9n%x+{z!~�d��[����g���_��O���չ��XǓpU:3+�v�DJ�9�Մ+���N��%�H.6�ߐ&:v��H�c)���ȿ����3�v3��g��z�-r�$�u�.�ֈɺ��w�lC��72R�5���Jنs"ĸx�#8_��ؗ��E��r�����V���ț�]��"q�U�y�Ex �azw�c��L�COa��J C��.q|��u�����X/�o������
QO�)l)+z��1F�(!J��
�;��Q%�Vl�*{z$�oￃ��T��ޔ����/u��ִGir��B��{��Z ���&�8�Њ��)7�za�P�*s3���.�ί}�ݽ^��յg;C��|hl3͟R��6Y0����Ӳ˃�=�����c�=X?�N>��v`L����kӄ��2P"RP]�&5Rk@ԻD%�)"�h��w�F�a�/��a8�.,��1����i�� �lA�~�4�0WV��2#�⑈2�K�����o|����n(Z�؝&Vi�^aG�B����q}�8R ��a��������y1��L�-���Ŵ^�����z3�j����"�sZ[��Rӏ.��ц�w�#<��Mop��j(m�w
g3��ԝ����=�D�Uc��8����i��#�M����♎�}�$��ds3<lHgo(*�d�� V�j��\_�z���.H<�LUcõ���;��i4Rm�>;�G�����_4j:7�#'���)0'�����dh$=z^����LE/b�-�ɧP�����CnT܆H0z{/C��x%�a����w�G�E�����R��ɟ7�7�W��S��7��ZcNX��gz[��J�R�7�U��M��q���M�TV{���=tQ>�2�4�H���LS��Tn�(;��ҋ�Nm|΁���t�k�&�/����%�(����<y�}��$<.�kl��z����Y9��R����jQ��9�1-{�[ZoЁ�O�`��|�u�&�,�Xw>ּ�K�olX����x ��M6d�f��{Ĭ/�DK���!Dgm�������bm���/�%�� �c��.�7����e[�w�Z�q��ڨ`.]�g@�ĳ�{�@W�Q]hG9<w�ù3,�vȧ���^PZ>6�zs�DټcJKSyn-�TJ�4&u{}���Ч
�3��Z���n?sf��Q�3�n�����SI���F�0BF$߼����lt�-O�#��o�I\�cHb7�}Rkvc���'i�2ܭH�0T'S;�'�YE����#
b՜�|lls*dD!�=����� �Cd7Zs[3/!O��x�xH�p��?���⯥���^��aCx��v���$"HF�כg$0���Tn�+�>u��<E��g/i�����Fzԡ8��0�tv�Y�&Q#��v�� o�Ge��k� �Sn"Vx^���#Nі��9Q��S�$��x{��G����J�E���e���1���W�����3�>�@���|��Q�GcbQ�rIQI�8�Aߔ:�����u(�����խ���W�����L���1ua��3�iDi�7���4��CO� &����l�#��N� �0պ��^!�K|�����|c�xڽ������Ub��+!_<���#�l��v�Y�ڽ����}(&��@ s���AqϢT�NK'����H�]!H��?|$0��q"7Z?�GY���LL�غV����	-��`R���&��ں�>"�R��q_�ĭ+$����.0���7i7.d=x�ڨ�������$SТ���w��SY�t�mt.�
V�8I4K��0�iX���z~g?>9�r��.�9Eӊj�J�9�!��fD+����� �%�k���j6`UI��fv�9��6۴��N=�|amzc��T9m��Q�C5k����ә����I����i�"��uw>��l��ae+[�Cu�����kC�k�m�4����-Y�.}�Tb�������^oL^yd3i������iq�(w��������Ho�8\1E�R�<�|Qҫ>���@�^�~{q�<B�-
�+ߵ�F��CS�������\����������|��jR���&���NF�["5E�^�����|���72H�:��!�=�[�a{riJ�k����D)r	خ�_�9����)mjN��R���*L���:�a��V�`�[�^a`2Ӹr?��V|���1�o�cR��j��'�:s��;��G%�NK�ҩ�Dz;��G��E�F�#=]��*�G�l��4��cL�5
)x{� |Ђ�_��X@�԰RQl�(�F�bI�x}V�l>ll�.�R?�w�g�u�?s��U�G����s6�Ǝiz�KF�#�R�qr�-���Js
ǲ�돒<��ͩ���YFcQ��|�s�jQ�1�ii��$�!�H����列%��C��v�u���m����� ��r�e�j�e�.ҿG��5������������;�yӷ9w�eG�O�`��F�"����w F?D"�f\Q���)��i�1�}�aw��o���Ч��ʹt�#�"SOyT����l�q����_��S8릡�y{��d;sa�]��,}g�>�^��O�(������"TS1������s��m��z9��Ţ�F� �9�r�Vs򷪕a딨Z�{    ;0�p��.� �3�J�l�S�K.F+�6�fYG�>И�Ї,���u��4<�35���<��Y���Ɛ�����><�J���zVY-�`�^2��3<��D~}E`�8ҕ|	/n{�Vg���Vz����A*^�2���G#��8��q�n��C����R�����U��7��� �Ͼ�\R*֠��j�@�e������� ����M��/��������>�`0"��ӨW�ރ�I|ӑvz���k��������Ao��c����B=y�	~bL�pΦ>�y=?�TlIk�vqHb�Q9e���+q�f����j���D���0���-r��V̠�N��1ױ(x���W\�hr�a�T�ef��(�	;�,ڥ��kfKB���ړ�g�g�40=ݣdn��מ���_�[���uK�j�Q#��f\2 k����������?���/��=~���(�y�MRoFN���y�����"e.A�:�j��6��hMx�v�S�I��1�ֺk�=�#��Ŏ2�����DռG`��rDo��"��@��#�S��Y�x B��.�#�7;s�|<���a���r6�!�T�pq��FĔ�����AJƉ0@�ZG^�ַ�ȣWIi�rӐl�ݼlI=r_\|YP�|D]^#ؾ��J�A� ����3F6UF�S��xcYcS�?o��`>���7�3�3��)�������fq����$���7���V��V�SHV�Q����=�����#�>M	�Eo^9�s0m��O���ݳ�}��.3�7��L�^gC��O�餸�Π�jLf+��뵥�~@� �濨�k?���#h�0�	ʡ�d�QcYo�TK��z��6Fĭ�b�d{�>�����y���� L��V��tʥW��.M�*���sr���&��� �>�2xQ�uUv��aK�\/;s$�|~5.�G�?j��|�q9��QZ��	֣�4(�>��]���N0���b� ԑz���etL#��}����]@>�0}�~�7�=�8�4-H���G�t�RY�|�n ?�~"��Mk��H�)s�F��>�vb��fY�ޮ�� {S���(�X��y��[��Eݷi���w��?6�,sc!>��&�Y#?��FzM�e�1_��k����T���A�Q:hT�)3�~we�Pv���7=��ف�2;Gg�"�В#�s��Әgt*�zu��OK�9z�lb����ҺG�>/�mz��l-Mnd�v�Sh�L�)��)*�@��ww�|���tc�x��X�a-Kȓ:�i��>������(�| ��܃{�������4�3[eCl��5�~`</��(u^��3��i!��c��.��|���Ƥ����Lnd��T�c�:�j6*v25�w�-��_C���Ǹ^�6E�It�
D!Px4�L��(!D��_Oc�`�C�S7��'��|p� fEq��7�ct��|}𕼦R���9n�퓂��0�D�M�"�F$�7 ���cnW�Q�"%{���[=%wӾ�x��^��(5��6%�Ϝ�Y���(��ԮSv=��[\,/6�ە7@u��#Z��NO��������0�>[?m�ڜ��fC�w.$0�{[��{��??�~;s����'%�"��a�o����=#�D�H�V��78- �H�A0n��X�\��7�J��	nk�5�4o�����f�`��Oț�����t>�#bT(�U\��o�վo����@�j���XQVi���h���L{Vl���9�/�,5�I�J��]��s�}��x驍�� �$���|�~0|"k����iO��)�q��(ac��w�� ˦8 j|+W
s��Z��;�Js�<O��lU������3�>�W$WF^�w~U��el��@!X{|�L��o�eS�Օ�n��X۳�&ٔ��!�C�.ݻ����/c`��ݼ������QFO)�)_+MJ�zy{�C�$�`.t�xZ�4�jN���$��"��L���� ��M��D��O�`)ig,��\�����A���`�d�95���P*�Ԯ?������0V�)���O`��γI1���a��v-��I�0ް�W}{R
\�}��99���8��J�z���%���ݷ0ٕ���7��C��j�!Q
r��X���Տ1����g�� wf�Qo/4RCNv��3;DH�M�Tz;0ϳ�9�0�ϣ8�&o�ξ�#�w�Xi��\=9�iy{�vC|GO9��lL�1�^|�D)k!�[7�є�%��?���t��Z4,)�����3�Zm��ߔ�rLѨ���)X��˦�|Mg��sѦ������9GP��������5$��u�Pt�pv�2g$����ftSC���%pN�.>�w��S��o���
�P�yi##_�Ċ�����m��3���?����������\�D���������S�F��Z���u͛����[�J��Wﱿw��<k�C�������J�@%R������ F���|c�HY �5
Z:�X�p���~�-J���c�/�a-����~bA��(㪋P��	?j6xU"��_�8T�t�����r6�x�&io'��O�pc:
L�B񖡎�V���%
��߭K� #�ak����vV%�;�->��kۑ=^���s� 72�
u��`��=�o��z�ŵzS��0��c�w\��f����ٲ���WUv�W�%,��r�/`"� �:W�b�E8������|��U��� �'�JnzV�[Yg�9</.��E�<
��nS����L<���w��i5�=w��2Ȳ����|6�z=0�ceM�F6`��>��Y�̓1fG�\uZg���k� �K��]�q��k���jiFڢjJS<i���������c<�G��j���Ĳe��JE��(+�fUh�[�������U�޾cUuu�I���K�<�ZW;��r��/`�-~��uT���N��"?q�����q�9���0���7���GT���&5[Rsbb/w��5��#���F�dm��[l�|��Ro.Zkd+A��7�����ys�������ɺJ7��p��t�o ȧ5��v�َ%M_��x
9�f��k�j������i܅X�g��\p-�`&?���埡��K���:����n�r��J����5~�����0�����`���/�n��'rlT�m�}
>�u�^g�{oo����T7�qB�b�ɪ�6��^Z+~�g:zE�K���/��T�+C���W��2��d�5&�Yd����`߰�k�͡������b���4_�WIm�й�޿)"�Tc�17i��"��=�>��f�9vFY���uU��|���O�t$�i;��S
�A�&#�8 4{�L2������5-յ/ow���bpf�ӧ ���m�w�҈��26�1s	b��L���8�(k�Fh�{����� �WN��qH��4n�w6����1[���F�c*v#ڻ�y�4��A��WcA5J�l�l/jT���7S>��[�ݣ���3� [���ڏ78����<��|��+�,����9;��g�4m<���Y��\����CT�F�,�u��R9�X�5e��(�r
�d���H�XU�1x�Vs�.�I8M�H!�!����ݷ�=6�'��G��t��R��Su4rQ����������I`@N m|.��h��H�md���$U����CjV�Ͼ#7�W������&����(��A�
ti½�j�Rל7��Q�z7<��s���Co@�I&n�3����L�m31� �
�5OJ�*�;�S,J<��z{�L��1�� �e	0bsm����N#u>N��5��^���SyU��]��1�(�96�c���Q�{�����O��i,��5�j�ʧ(K�)N��ޚѴ��/�Qz�I�L#���[I�'7��ب���2E��h���y���z��3�\{�)��rt����L;O���ۯ_(}�	�87��Anb�ͩRu�٠f-��rz��:Q=��C�������*s��%9��-N��(�"�4_>.�fP�6��U܍���eK��a g=iO��;*��Ø�G� d}zHU    �:o#��F/=]���� o���gB���,ߴ�ҡu ��xB+���Q����	������_�+���w���C^_���Q�.�DiR���ȜP�v��6.n�o0_qvΈ��<2LK����V��t����5�Q֙hmь��\�&5Q�5�s���)X��3���i�V�>}�QlF�m0շ��>�(t����Ď�Ǧpq�JPf�iln���s C�qj|cB�@�j����40�TT{,x�m��T ��K����Z��e�4���L�����w{0�ڇ"~�t���4'/ǔ�8uF;����}_�������k��{ˣ��S�T�1QjEeU��c�o L�0��#ȉ�rhG�9Q@3J�^����k����w�f��F��B,�g�Dz�<E�� }�Sp.�7,����!�ґn��IO9�3��e�4%�)zp���.��1�v��Po��e�}Δ�yZe��Y%�pIk��#�a��45$���� 5���"��G|�҆o�'KSaB�+��p��,55�,������(*����4���ME��9�")u����⏑�v�~����#�v��$�Z�J�~�;;}lŪ��������!ջ$6�����0���|f�Qz
��:G:���E��.�=�9G7*e�0M
UZK�4_�`0����4�.�Q�3�K�X�t�ZG�5��L6�27�(�ɣ����V�+�X�X<��c����Ms�|�!`�l߷�7�u� �@�,@��/(��.-���
n�_|d�> x,�n�#ʦud"N�t5.{��?~y/����%ED�⛿�[�	���N'�qF m�����˂�`��7�) �N�o�@2�eޚQ�B��i:_�� #�Qp�������9���M���t��	b&K^�4�s��Q��}�����en�lݾj�u��ruo&y���ȍ:��v"o�9�$R��G���]e���b���Y�Ɣ�D�e(���Ku&)3���8��S�v#�_k�CS�8-}�D��1����zʐ(vӲ��G��r��l1��MQ�٢��"��3i�*������ۣ����z�F>.7�O�O��{�����[���W2k����(0T�>��41�ؽ=R���]��*����˕��I�1�cc�B�pw�T< �]��{��������jd� *�s$���T�l���z�h��5��$M���(�(rf�W�VNﱮjN���^��TVB�I��i��gi�q�lE1���	��3#��ۏ����ՆW�A����)���'V%�����EA�~`"ƨk�邋dtf�zY�J�v�(��D��3��_�=���I��ξ-*����^���^(��Y�^�g�-ԛ�R��r�D	�8���x��ݤ��rM�4���x5�1Nc�.��D�8�M%�M��_���� 2���z����+K��n�|74��;���\0"���c����Ik�(	<Vu0��"��Z���C9�&�7S���%���Dm�#qO[�s�,�6z7��t�C�����Վ[N9�TO��t��|n��1�p�������:wY��j�Ѥl<����^�� �MM�э�!�fʱ��^��ق\ 1F�ݛm��� Zoj��ĵ���G#�h/�F����ut�﾿�ǒ0���o4W��!v0��eR>f�"�Pj��Zh�Qs��@r����͠�\�Ʒ�j��((��,��^r�Os��@�����C�,�wU�����vJ�_��|��n��!��a������ղ�$>mH��"ǰ���7	�k��ŦՋ��;�Ϡ� �d*3q����D�x�N����S=�5e!�S����)J#Tl/=kGd�;)�o�x��vJ�7�吩8�� �S�kN�Xi��弻q��h�����h���OB�96�-7
�M���� ��Ǖ����=�jE�9�3��R�aF���jT~M�T|�	�J5�<�����u­vz�u�aZ�Gȸy���$�)+��c3�9�����o_��Gb�72<�s�r�3
a�g�Em~�����_���A��#3]e�!�	��B+���e�՚*���"��^0Dҹ��Y�|���]�"^F]��������~���Hb~�8H��Y�G��:c�Q⇝M��};0���F}W�c�*8=�R�h�آ��o�n��	^�n:%�Hϋ�R���xSM�%�6��rk�l��^�Zoƴ#�[�M+�l�t�H9q�]��L�Z��`�,�8R�����D8E�]����� Üm�|�}D8I�����{�����e��m��oK����.�4��\e֤o�k�|5��=ʁ���[*ZU���֛����8J��i���9�k��-|�\�|8)o�����r�8C��EMc{Ğ	��y0����(t�3S
b�d���X|V���5zy�0�A�+���{�M���fnh�`����g�V�d�aZϜ9�MF���R��t�6z������QA�z�������@ CZ{:LF-�E���'{����vz,�����N��c��ˮ'(���n}�/`�(9��4���uE@�ē�����R?mXԌ��.�/>b�n��9hi�=o �?46P=��4*�w˵>�`�D��]k���*m%0�s���>Yp����5&���O����ة�vd�,��<��r�������+%�!�t-pc�iz��c�^���ћ��&�^�78J�s7R;�����;9\��+-
��l:��y��]p���Z�3��]ź;��42���V;���%����\/�uY��5[�S���K������wQD�+)�t�B�-_O�'FB�V!J��:+����̗8�A+��EV�`#¯�f��:9\��Q���MU�۟��1���ӹ��BY�.��srT�Śp(��(�����*��O�|(��=v�c�8:l�~{V���T�ѫma�2��Qڒ���6��k)�%������MI��c�b-U7Ď	`����j���0���%����`�)	��)�����l��*մS�y������7��˵�1���C��S!��ĝN��jKң=u߿)2�T�G���fF��h#8��Kc�����l��S�����ڶ���i�{/��t<�ٚ���t�ԉM�^�꺴A����I޸�Wީ-��)��$�jD��3uŁ9T�ex��S�p-Q<R�3#d��b�<�j�+���a"�B��W�6b-�iI�1���ou��4���
��D!T-�g�(Q?W;�6���C�#�?�)R�����=MR����Ƣڵ��e>��l]��jl7�,Ѩ���ڳ�b��*� 9o������H)�~8V5gV��mI�����ʥ�T����2��z�亴q٨->��1���������o���W�^�� j�#��)y��
���Μ�������tiT�_�1�)�����0-0S@��;��I�@7\��nK0��R���^F�*:��̗�k=����:�E��,LV-{6��#�e���"�d����70R?��nD;h�jPh��-���[9� g���%e���s�wLHkD�����i��]�->2h��=b���:��ͦzu�Һ�0{��k�1J�L�@駙�{	�?�G�(GX�qr�fQ����~�"��+m��O����y�7X{0Ӌ����pb{��mpu�J{	�֪u��1P�92"�+ժ�dG�H��Q� �VO���=�oO.)2	����9��"8DI����գ�3�$��N`�O�f_l���CFD� �Y���d0��$6�+���q!�8G|��@�Ύ�>r�?4Gn�]�I�[���-��l�w��7�$Q�V�����FQĪ�ʁ�ߩ�~�'������4�e�QK�ltK ���#�����[
�4w�Iȭ׹�R����Zr	xtH^˾�(jD���'����liD@�x�@��/B�}�o^SE2���p���ZN^�j����պaӡ�+C$0�a�zcB�`e
���%_���<�-�>ƒ�ߛ>�^�$!�u�3�    .��8�8J#V5��.�^�d��~X����<k�9s�0�`�@3�����8�X�����Q
�qS!�I6�Ǉ�G�kqt`oI'����
W�9��J�5*B=�mJ;�dl���*q�p&���z�OF�n7�;T�R�u�%[��(�����v�����q�k�7W��ِ�ϐn���J{�=��Y������'8Ջkwn��eh����L�uꜙ�qc}=���w�W�-S�WNHy_�O�{�7�Kk�e��u�	^I吋�dD]u�]p��wi[1����h����ȣ��J�F�"�(*s/�y��k�]6nR�s����I'��W&��d�)Ma�Szk^(J�uq����5�P��z����eEz������#�m+{�\_��� GV�l}qM%�[��=]�jNfBVN+ v�K��M	�t^�Q�]���̏��ػF9QV�mwx};i�����t��y�,=u�#C���.� 6ռ|���&�T��X�Uפ��gײ��!��`씪#HLT��߽c`�~�����"�d'i�{F��������w�ތ/ώ��袶nQ	̼oMcǌ`0�=�^|k��z���sdk��qL.��>��8PL�Iq�~Κ�ͻg���l�Xz��x���Q���d�U|�p�ކx���7�0��u��7�������J;EqOĘ���d�x}��Ta�I�mM��"(-;��� ���"_���,~?0�u�|�F�c�a}���A�,��A�H˾�?��}��鯵�/�_\,��ξ���"rNO����/j|�a��k�iXh�&I���y�ea�;��Z؇���F������Jap�l�'*�A�Y7�	堯.K'�\��F�~̮F�|�ȻU˒|j��;fA��}�(/}=U���%��v��3��RBZ݊�1}A?py{��H �~���H�7�/��Bz��/�"7j��6��l�wb�o?5*��O��I���� �R<�~�21ɧ�����X�_�aqę�i��������I�}�� -]�����F爳��Rϗ�R�݃�D�R,���d�;��<��X~�4�`_͇f���� 3�u�0�iD�7�t r,f�e9$�W9�F��6�w�}c*r3��[p��r"��4X-��#gC[�0���[u�u���8\�J�:�n�"���&�ͷE�2������#r�j�����%���|��%��*
��~��F>]�j�������r�P��C{�Dm̨�V���L�����v�ꥭlI퍊�sԉ8�쪰~����r���%�v�ez�G���wt������oPI�C�y��u�p��t��]��o�4�`������Amm��n����!��=w�,Ď9Anu�d� q/��`������8�j��ٲ0c� j|�Z�%�AY^���g�7��H0��."{��H���2Xพ��� �.��u�ʊ�7WY�dM�t����r�/zw��뇤U��5�.�y�=��HИ6�hw�ݳ�~{RH�[�P/�v��ΜI�:V���5Vd��_,$0���Uw��6�����V�)6<B���s6~�2�1_��7��E�M��#�o��N�<RΪ���o�Ə[슋0B��*��M){���l+
=�������?ήWe����9��il�3�"�����ҳ���k� r�w�Z&��ڮ���v�(�͌��Eb�Bw�xAT xq��9|M+�-^b�H��\o��I��|3	A���3i��QF�� �ss�*�>������^p��pZ���jqoR�_�i������?ծTz�c@ZŤcT���z:�a�!��\�M��c�Վ��t�Kԇ�x�Pߺ���-儈gĸ�
(��\����q

m�������smirxQ=S���������� t���*��\@+��Tx�zg|H�cYb#5�F�^|�G��Xx}#GEbc�ϣ|{�Ae� ���G�6%��迓���E���M��Qט;�p� G��Y|�i��:���6p�]D�@"蛬ԾƖ�9F�d�U5�4���p�=����w���^��#ĎZO���y�A��e�1�M�d�<�LOk�"�il�'kD��GWK7E��i}6V�� *�����B��	���>�<��H@7�=�LеR�&03��ڒ�wɿ���w5^a�"`I�X@���>�Bt���� ���_�)�6����_rq����)�7b�NvV�Iv'T/n����H�������o�݈D#�Z�]]��W#����,�U�o��qM�Ƌ���<����	L��1����7 ��6n��R��w�L�����L�;�k������6��\���x�o��@��Wl�
	2�ꖳ����m #��z�'��uaᙒ�#0-�
�mԗ{����hQ�	5�*��	��
ʶ�(]_���ȣ>(^�Ex�giT��Ǣ-�i"�L>����ë��wz0���:k�PR֜�H{�YT�ҡ��v� �SS%�&!��uD9�=p|Fq|JŽ"U�R�)a�^��xV�G�\�~;�6�C�X�U<����T�Af[�_���`�����v��;��Y����τR��W��~ݗ"K�t(Q���Z$%�n�!N�yD�@�S���/�q�.�*��M��i�#J��Q��#�=�H�}��]��]��vuc8��N���p.�3U/֒H������v����3.��j�͕m�Zn�����x�恍V�W��7AoDh�>�90�S&ȸ:�yJ]Ww���	\�%qh&7R���L���ŧ�⫞r����P�����"�M'4��ɓ7d�H0͈~�Q�W3�?��� ���O,g^���֪�:�W����F����/`R�-^ SQV�~P���#6� H]����ݭW �>�q��HÚz�
j6��-��x��k�d`8�A�E�P��vc���,_=��85�";Q�5Ȫb��_=m�I������\O�h��XU/�ԛ�3ƻ���q^��j6��]7��-�O�<�A�,���\��i9�]�a�G�b�\���AJ���I�?�ݜ�2Q�v���G}�g���9(�S;��̞-�=Xp�I�}E��nO�F�U9
׋\<��ޞk�6��s�s#���H_���<���F�z�xye������[Y�s�)�W�,��|\��<��6���lgD�X0xk�M��e���w����kor���,j�֊�����^���5��jE�/\�#�Ft��48���Ug����)k¸k[���1=���u3�4�H�,H��=���]��-u��6���`�l�f�F�n=�5}<�*=��������x��0�U�7;�Q4�%����mX���x�w[�|#�AB�y�3c+ʜ��<1�Rd��:�����o���T�(�gA��e����%��j�����֞"���LS�۰M
 �;�@h9C`�e��S�����L�0�/�K+��G`�T_?���������ۿ����?����<�e��'m"�Q��+��V��\�N�U��o� ꕨX�?u*��w8��NlzY6$�����'�Nn��ࣕ�Xi[s����,����W��&0���*]�OǑ��˴�4���c�b�u������_�}4���	Ʃs����=��)�p�D�i�w	`~@�x�_Ę�{��8@��#U� �{X�����I[ C�\��͔}���S�R�o�'�eE�)����>���9
�uq����ɾ�-)�%=�^Nl�>Μ��N`0G`��&]wڽ���+��G��󖹍s*�og���3�<i��M������}��U�g��`�<� p�K�ف�Q񹨥C��4�������oٷ���l2p�����񍦆�f�z�����B{�s�����?y���Xo�;>;���J)����i�����x�S�"W����J�@mJK�SL���NU�wEj�~�c�� ���zYޤ��G���Q���XE��U��0��j�Jk��o��,��x�4=_,"�����n�� F0G#V���4�.�	��T    �/��N��w��|�����(�V�I)�"��k�i�KN��f��mӕ�Pv�A��f�"f3��Cd�S�Z���n�/`��˺J?�-*ۈ1�j��->���:����/`�}Zp��d�3�BԕW�����9-�k�>�>B>��7�O'��c�A����ziMŀ3����ˏ��MR�.�ق�[����Zor7�p!��������
k�j;��ޤ	�!��?bC�>�j�����Ŏ	2g ���G�ţ�+#��_���L_	s3�V�n	
S�6�|�U�Q"Y����/cţ(� ҍh���-�I�+i,��r9*
����n%�/`?^/P�S��@/�8M1�Dݛ��'DX�M��߰�M���nf~��E�G��1]�#|l�E�B<sM8oohK`�|�N=����cs6�O���`'p��\"ﾅ�������&����`'�'��ZĐ�iM��0�;�|c�|�F�rB�C7�j;��Gdb~�1�5�(��=�� �����W��H�q���S�`�ut���]
}��Bp1��:ʹ-5���ci>�!;��������Ψ�qv�ȕ�R��iS5���H�=��6N���3�|F��Ao�H0����a�sL���X�x�s�;�_��ߩ���Â�t��3����={�N�H'��ⰤfXԂ�4p�a�h�)Rp#�.��z�`��l��K"�h�6Z���!~�7M�=R���n>ҥ@G�U��xG�Y����y��i.�����d =϶L�)^s�X��S��+�/`��M�͵ l�]�L����7z��m�g�??~�:�_�n���Əڌ$�eJn�%��������Ъû+����M9C�;ri�[�c��2�r?N�������A��+��;=���3��Ǆw�李�/���y�H���>��1��q��K��D[�����H��w��T��w²{ �Պ�)YZ[rO����A.����=Z��M8��7��ӱ�c���~�	`$w����T��Wj/�,s��t��t^']TGﾨ���r���cF��H
���S������0`�?s��HU��7HS���J�U���u��/G��&�^9j��o
ď7כ���Q�(�f���ɑ{��Mw��a^�k��|�n���΁��}�A$�p�>�Z6/�w�E?��ىܸ��٥������l�B��,;M�I'S{��0���a|�f�c�s҉��T�<�t��D��s��=��n&0�"��k28/{�(mtZu��z���ٮ$O+{�����&�X�F�u���郱_�.#,1����w��wwz������l�@T����L�F��>t�V���}[\V��S3{��aS���\q�k/YQ!�
`&D!8um��ģ]__!{fd	w_ę�|�@�i �]���{���;�?�J|Q!$���E�ѓ��#�tY�0%��Q_=�I�j�y�hA�N���fp����G�Y �Y"�ddIc6��: �;
B+���7	�oh%�`�=������6T�Q�і��)��IH��4l�� l��>�o�N��s��`�fPi ARך��������<-���C����pX���?�Ye��鋺&d�`郲�s<�Q�K�cI��&���ut�kSN)�8�+*;��'m��k�
������#oC��]\�s��Ek�Y%������P��i?�r�~�����uc��C$=�i!3��U�tok��R$0�#�a�����bp�ʬ��/�{[Nk�38NIy���N�/` ]/>�v�7J���MEw��A�C۝_|��W`@>I��0�a���=�l8�N��G�����2����>.bx�G�-{7� ��м���Qgx�ܷd�� �9�J��p��]��Q�Y#�Ž��C_k*���ķ Ǎ��j��q�����6��A��M/���|����Fr/H���Ǟ��մ��n��'��>����ζ�D��~F�3bU��f� 뵝83<������p�����ju�p���ʈZ����--�S�5[|��������-b��3�s�쬉��O�j�/a�6�vp��s6̊�:����-�P�}3԰�//Z}4gݯ���jT�;F���|_k�\��rx�*��s�:v|����4�z�ǵ=�y+�<oj���#{wN����_,��0�%.�� r���k� /:�=|���(�W��Uvӿ�O��nZKN��cI�S�+�(�K�듒d����?`*u'յ�Y��-���<������4�7WO{:��[D%U==6Ķ�kni���M�`ڏ�>��n�ז,��J�1-�xh�KC�Qs"��s�w\��@ ��c��о��+���`�P��}�`4%�A��b��{��"۩lx�)��M��gc}}�i��|o�>��cЭ�Cc,��VbQu���������^�����ڽq-j)�d�� t�\�	�����|��J��uĨ!�˥���(b�i���X�{�� ���w��n	~+H� ���_�uǱ3ትg/�����dK:a�3v�R�/G�"���d���[Y���UĠ�|"�%�'������,��{CM�8��@��݃����K��N�e�K��'�<�a.|���e�ة������Dg6X�����a���j�K5�lNܵ��,�E��ܷ���}�0D!BDR�Me�t܊�Z[=�=��h��c�}f��$���.�G�7OMe��0�x��D�Չ�ü~�K��J0w�����2��`��"�`�̯��o��?8U�6��u��e�ьԎ��he�����\�#��V��ESǔM*i��2D�������8-?o�]mk�T/C=�ء�0��7������E�Zt��uD ��dq��1ZN�o��AV�����N��Մ����a��%�4&��T�i�_�i�=��~r���aX(\5�R(*��L��
��ƚ#�Fy��v��ab-�՚o�T��ii�ۤ:�N}֚�j;�c��%_n�<&#����Ϟ�sd��MY���P�}�D/��/n�lAh=N��qc��Y]�kU�[��җ��En�J�k�()���s�]�:���s=ߠ�a�~$�ͨC�s�B��x*KK����Q�`���]��Pr�v��j���A��*�����`���K�h�
e+�׻�Q�Չ��x��d��#��z~�_��V2�(���<�����VN�z�Zf}\�=�bv#������d�j�6���N�w'~�^�w�ȳ�VV|�RNI�x@��Ҩܑ�!�ax��_J�"��ٯ�vq+���D_N����h����3{�GP9nL�Ro��NT�m��k��Ӏ!��gd�E���@��:�E���4\Ǥ�S�+���:�?o���XS����z*�#N�dF��&��]��|)�.�~�����3�zt��4�A�:�
l!aȾ�\���U�?[�n֝	�j�T�#�ş�������z~��
�{'O���Bs&�������Z5<#�������#��Ӆ�my�Rl������p��ug�:R
��'k֛�uh�K]���
:&ϥ%�l��J~~��p1d*�f0�,�6=��_�q �I&Ո��/`�x@�n۠����C�9pgX�S����J�雏�=��n�P'�N5��9��z����i3k_ݽ���?�j�!���V��|<��p�l��WB9=��]�@Fn�i7�m�']����NF��sV Y�;�a*}��/��Ɛ�	Z���9d^���n[�?_x�G�d 9�0.K�Q�D��PZ�ɂ��mv�����a��%!F��0��#�8����\	�~��̞_�
6��1�~��{2������1���sE0N�⻬�}̗�$�:D�y�FGK��)�l$%ߵ{;�$�+��b�a�5�
��Ս��7��Ca�k[�p&�Tj����a�!��w�}YbWxD.ۨ��2NU�WQk��!���������������%�]�H�O	�F베yy�0_9� �+c������X��Z�l�d݉w)4    ގJ?#�zUy��H���o�n;�ґ�˽=���a�܂�?�8�dE4Z������/`��]H�+�?%��ا�����37��1����w��KMI�, j}zc�]�}(g�ٱY�g��IW!#�t�<�pʲjy�V��0��b���ƴ�G5XMa��r(�*Uk�~��h$���n�ʺA���:v�
W�8D��iO��~���]���U���+�������;��k������p���AI2[ٱ��C��Ne>���ͪ����T��M�����rz�\)TF�4� t�6g�MOW6�0-HrbS�f_�롹pE8v�*�'o�i"\��=��|~�b�E�n�0W��'��*��$G(J��n�����0}jQ�׫�(E�����'B�w� �a�ߘR~+����&�ᮑ�f<�)���4����w�:��o2��O3*7d0Ե�i�|�� ����:��zYd�C�BQ�C�a77���lT �69������]��a�~��n$eZ�űF��o&@��l.�K=�����2�ET��K35�*�!Ik��o���^����bi�7yL�vl�H@qO�vW�p�tNC&S^/��0�>���"/$�����ηN�N��y}=�)������<eH����`j�"��u����!A��%��+��lx;+m��|�{2bm���
m��iR�0�~�I˕a��M�P�[AD�Nn��J}�?3�O<"6����\�c܌��jg�.���^�Ŝ����B�O7#�o,@J7��%Ě{*��ot"��h�mG����\l�Yn��r�����FnB���W�gZz�?�4�������X;9����r2�|�ߕ,��a��
�H�%sF7d ׋��1�;t�Os��a�S�|�D�ap�#hvCW��od�1[�$�WK��L��*�_d�b1"U���#��a_��H�O[.k���0A�]Z��2��ga��Š��Ǣ]$��g�ןR��ck�"r�S�H�&�����k]�2��R�e+^�m���)�Ѧ�&��d��|��=�����v:%��}�}JE�%�R�*�M���䬔�tl8o��	� �i~%���ғK�<F4��S���hv^�zU�~!A��V���{��g4;�!�O�,s�^J�A4 ����hV"ř��EC�k �H���	���R��!�5�b;���##1Ps�v��>f �H�z���AL���2+�b�]jH�������ǵ���#�y�!�\8��p��9H���j@�P��̧u@��o�D���j�Ξ���
�wAy��U��l��zT��[ΟZ�/F^�<��5�M�O"�AY'�)�O��9إ��L��Ii�#F^V*D�~qN��վ��u�P�R����o��h'��2Q�-i��m-g�ף5#�)٨��k�:l֎��Gz�{���+������̤7̆ă��g�F1<v�ǘ��S{=��-��7�9H�r>��R��j�	딂P=��?&t?C��"��LS���Q���ъ��6�vvz��Ը1���Z�M�R96�C[��LR�-;�����F�[��{jhش��0+&^x�P�N+�J�|����E��S��.;�4f�qYB��I^����A�����M��g��Ju����n��g� �+oS��a��ir5����-Hn�1��� )�޵L���;�0L�Q��H�om7��-��5��g�^�8�p鯗��0������:�r5X"ȣ�h2��*�Q�h=�|%�r*����H�L��,��V�l>��:s0�E^���H��83߰����*�th��GC\�6m;c����}\��d��mn����?�|w�KNe���d��<$���kBtíd�OH��M9�=�^<ϓ��QG]��y�_H@$7Oi�����F�d�e��)�6B��p�?�c~�q��)S�E@�WCAҭE c=-8/�Ж� E�^����l����_Ԟ#�.��Mڃ���/�7����%j`��-�0���+��݃�G�6}N�1��ŧ�H�\mB���;v�vЀ��#,ͺ��9��.�>�6���L�5w=;p�RN�@9r[Ł���\�O��v���~�=�
[,G$&#;�e:m��xy��a��\-�hV��E���A~z��J{�:Y���]I�&f�q���.��4;�KTW�{�HgO?�oot~�C�����"5���KO�o��P�57}[o��A��t��� ��瘐2��p��s��������^�eĜ�̳kÅ���^u�� �E��͞O�s�_Q��.=��͒�߻���D�9������i�wn7����kS �%)�&Xm�h;<N@�N�_��a��)T]f��X��a�*�ĄT ��s���������*rSzdtesN:�w�~#��-^�dZ;�-������FW��N��%3��%��+%�m��m����D���r���B��G~g+*�'�cUrų#�p�7�������|��7�yj}x�}V����~��B��N ��Hc΅SHv�!� P2Z���c<��1x3�@}RE K�7�vܘ]$�+���uS�od��7/��T,�/2�c���2ܜa�C����2]q���Z׃�\��BRЍ���e��:��1��!kv���\�Z_H��Tk<��gD
�r�;�/pc�~2�p�Z�=-�$���-D�� M��^t	��\?��W������aDB�)6��vo�v\��z=�	)��i��S�	�*�v�b�oj��V�,����v˵�2c���oF��V�('#xe+\�Z��w^����IL(yf�O�"$�/��ͤˑ�-�yf|��m�m��=�yk�
[�5�L�i������=�����j�X򼋩�q��ft#'`�JH]��EO)�o�Ƌ���]������f@�:�]��5�_G�rz:b'W�'<��#�1��&=2͹���9x	�J�I�s')��|�v��#5�����}<� �F��hM������5c#8��n��|Lk�)�a�R���6G+���MD�5�f���e+��<I�Re�ɛt���L�[��)Q�A�Vn�-�!w�t(#�s�d�Cym,����0�W�2����O�]8e���q!��n'����:�a��I�ahΪy��SɀKuht�cuX �u����P�
���]_8�"Hp�c�W���PD]%������F�Ǵ�+�58%�0��XˡB�$H��%^o��W*�q���5�[��=}�EHar�r���6"����"|3eƹ�U�T��#J}בΤ�e`�;��?�O�otΰQN�r;�w�|}�ԥ �ő���s_�p�4�*m{˪Q�l�p��u���HolW����?���4������ڙ�!9��'�Fj ���*5���q1
���m]<�S������ۉ��0ф�����r�9� �-O���g��q�,�*Y�冚w�g,�FBj�vR�a$2���Mȯa���f+���-�ZP��>��Y��g/��������({3~׵�DD����#*�h�ӆ����6��0��HA�y�֞3
xC�5|L?'��0�r���S�����f��pL��(�^b�@<��}p�9���a*
͖�?�\n���S��Ԃ1��1R(L��J{��]��|S,�1|�G=�L-�/���$�A�׈�\��+����̚�MIj�#�P�Hr{��Ld�HX�Q+������[��W ;���RG���錯����̴��5_Ð|�=�$mِ� �=%X)йRN!̸��O�Y��l֛A ���d�F�H(��Uf��y����p&�+��6:���]pt9�����y��+�չ�+�J���b��?���G�V[�s,��8��8s�O3�I�e��R��c��gk�}���R����"��l�F�ޫ�>k(�Y̻�T^�S��0�M^/$�43O�=�^��J�;!��-Y_��D��a~�7 �a�A�����L����!�Z���ؾ�!�Ĕ�̈́TG�y��<(��XȲ�t윣�`    �%�c
S�.�R/�eWKc�0ㆣ�A�K�6bk+�_��T�q����b�V)O�U�^�������=�@1��G�ۍ����O�+$����'�_��5{+��^t���*Wb
�΁9�"^�.Ğ�� �MBL�u�ԯ�}���0�Fd��T�Ģ��4&�<��Z�-����0qc���	�ʴgn��U��vM�zK�:��A��zk�~�:���74\�K_�D�k!�Cd}k�!
�N�%��?�Vn8�c�"��s��J���D]paN���Sja.Ro���sp�Է�ǔ���z��e����W��?��
\� �e��G��XЩz�����|-�
C�������dz�i-U1��k:nm��Y����ݺ������&��8����p1��䬵���P*b�~��uͮyu\�$L- ��"��Jcjwz>��xIF�׮�|Y�l�n��gQ��N6[6����b�D��v��4�ζk��ƾ}i�ָ<J1�zP�-�hq���L�ĘY���U��Ƒ�Gng�>� �p��MR[ײ��*|5��`$ڄ�w!�>�罱d���U���e�aJj%^Rs9�Z�*������|72�w�Lܒ���z���,ɫ�e��DM�2��|Յ�}20�	��Xp�ݮ��y�>��s@0\L#��k6@D���U�c�c�T>�c�u�X��5 %-�BZ-K�W�r�����U����8c��0�]nYn�P��TQ祐�	� �!e~f�mW��h-��j*7�Й�L�Z���ڽ���n^��矒���VnXѫ#U�r�>cD5f&��$��d6y���T�h���Rż򊁘��[
�!<�)eƹ��Ңi\�]D�ydymؑC�p��Dr�p��4\��c�d�BRn�K^u�H�B6-��z�n�}����U*���ֆ8{a��kT��/]P0�B�a�"�Y�6�w1�T�����"�:��XlR��3 ���w6�q6ѯa
}�����By�ΉS��j'��tZ�����[𥛊o��Wb i�*��y�=�B{Լ߾1�/U ��O;=��j
�@���֩������0�>��Y�X��D�j�p=b����r/��9o7�a� -�e���Ǫ(�>;��NE2����Mg};�	��L��vQi����4#{�7�#f��ÉO��z�N�5�<�Ս�ԣ��9��bX�7~��Z�������NU�[��!E��I���q���.�oc��a8�:��T
�����cꅆ�Hiz�YW��ڥ����n�8�u� �mZ�.m���)�����M�a��J��{��I�.{��'{�S�i���^�T�VIg���B��������RE
�Vo�5m�Z����J7$����4[��y�X�1��v�y2O+%�XP
��� xd�=�l<���`� �\n�`��ѐ���q*����[��L���_�������ٖ�N"iz$�HZp�QҚz�:��xW�k��?f���ƄJ�׊����2&�� q�SG������0�m����:ש!�8�P4�NzH���C���㼙0�� ��I'W�#!�A޻��"�l����灒\/�����,�I<qUj�,)-����|�.�kB�[��ި$�������1%��Pj-����w����W�p[BgUŇ��P~����E�P}xLSi4O.n��m�A���0�DY&ϔ�:9�P{\�k�Oi�|W�k:=z���1�W�����T�/:�w��j��=�ݶ, ��ǰ/^�Q>����WAT"�
ߺV�u���KcZ���6֖����-_)ɥ�@kd1���V�ag H'�.
�؏��l�4�D���D�'��]zS�w�;�N:�v�n��_�0�?Zj�J���7O�a�(<t`� �Gp���q���aH>5f|o��G��I�΁��' (�R���r����+A�ͯ����Fқ�1Y<%�Ak7q[�����W*飭��w�]R�}�]�yH��6�R��\�?���n6���iu#ݍ3�'�Hy�L�^O}{�������~��dڥ�[T�-��d�6ko��Z[_/�e��~�a�R5$��Ј5}�lD1��{l"C��h���.��h�5&5���P9��`l�������z/#�+�yӅ,�#�;nL�XTNc7N�}/�:8��S
� h-W{��h4B��E�j�!�\G�����ؚ�Zl^�ܔ����	��"�����swkNl�zP�h|�a.|�;V��"�����A`|��+9����!�(���Bά��JRR��҉���F���{���^��a���~GfFS�������T~�^�z6`T+�yD �p����M����[�Ft�,�w'!��ck������0�?��j`�W�<sO�"8�$�5'���6	��u��o%6��oS��o����g�sZpLg�s���.��d+�vJ����C��b��Ĉ��=�����3��������/��������_����������{��{��0�ź����[�:�j0��bQτ�O��������Bc\T]TW�vZE�v���kI�Cl�3��:y|-꺳O@���|�{�g9>�a������0�Z��#�ƍ&ΩɈ�ZP--mi��*B����o�8&�_�=|�}��:b		�ǚ9�>���P��M���ȹWMk�X f����f)>�(���a������2���
���K��{?� ��x=��]b�;o7���2%�5��
"3�T����P�ch��H��J�!�BD0�����nf�
��u��	R� �h7�����e���>F�5��E��a��1�tS\0i �����st��Ј]$`#{~�9nL.T覫F=�8�D�Z�J��ee>]Nϙ��ohJ�4����sϐ�6Ԑ����D��R�
@�����0-���o�$���5U��:z�p�C�r�1S���15�{)���0�Q��""%�ȃW�4���FR���=׫q������V�7��D��xI�z��w�`��e��( $>�`����0�!�� ��&�)��a$0��27<�45�임m�S�4�H��p,���HC�>V���uе��p=VF�G5��#y�o]j��õ|�cM즲kx<�.Kx3'F3q��@��R�;�̯��a9�&7�y���z2
9��G�܂!���U�|~�;ßF�}1�ڔ9��Z &����&��~Z;�mZ��in%�M#v#*��ĥG��̂��:m���'��a�}�5���'��B�"�NRA<�<U�5�#����a4��%_9_C ;��8Z]�H�jMmL�1��2��o���j�j�,�wv��V(l'�x/���_<)D���������� -�?-�zD�T	i��L�ǖ�x�ԏ�Z�c��*���cn��#3�\�S�L$m����z�ZHM,_�T7RV$$����
j̍��b����:.�a�|��E�Li;Z�7q��555��PR�뵧0L�xj�If�XDCmxXtD���;p��z�����q�0���7{�S΂��@;p����ڑ��ȼj�������כ�v��O)�c��7�0�TħY˞8�<O,U[��8�K�p�Զ�$���G}O�M\�v�rp���p`D%AZ~�u�\<�)���\B�$9x���뵧0�|8$R/�u=s 2�P����p)�� �|�n��U�����&�  M�ypa�?N�e����|T��q!�f>fs�堳�9f��N}���dV�=�yJ�jm�э;)D��RT�k�8�YK�J{���\��g�� ՛��U���	�'X��a赤!�Y������}��$e
�%�ARR[�ǲ܏�߳����;�p����������g���_5C�r�:�q3�xQ�9M����H�����5�������3��FUO�z_#���=jF����\�W};�a$&��,7S�N�b�mi<�c!,�O���t=m�ۍ��a�?�Yn���`nhԏ\$cv�O�rQO��5��]V���'G5�f2{,�H~K��D�X��=i�Ns�~�L�h��x��_"��0`��1TJ!U9bY��̶��%�����/�ٖ����    �VofPM�[��A�@�+��8l���u�0�sO+h��(��}F�Q�Z��a��|������F�!��۸^��m2,�%�+q���Xsh�%k��3��g��[�'��s��*L���G��ui�G�s?��gY16�&�7�����
h1��c!�w��5��|��^�,�_�P��T�������m�� 6[Z��Z�[��!��%* ��  EQn,�J��w-%�{��B.{�i密��**���w�]�% vܼ�(�@�R-1�x<8PZ�����)	���5č\��������(�ˆlʢ2����6��0�?�o(�Y}0)NŴa�:B�1&��(�;mտL�������#E��n{�6�Ld�X����O���W�"ku�'���d��&���o�5N���̺z��җ�KY�~���s������߼�r�g�]R���?-k������ɑ�3_��Mͥ�\�=��Ek�
�*@�����U�ù�_��tW�^@񛱯֭r�P�9[b?Qw������o���`q���U�sh[B:Z��|��G���-���*~��`A�8�oh���
�4�����X�Y7G�{��p|�$,%�պ��>�
�[�����X�m�4�̣~����L��馚�ҋq���� ��y�j�;O������|~� Mׅ���h莦�3 3��h�զ�+��^���4�"_s��p)7֘Ƶw<�A�ˉ�M����_�r��?�-�݌Ǻ��z�;{�N+�j�M𙭖j��\^���du3WO���Fi/Q������a�ѐLkε���\���u�l8��L*�s�)�O���o�(łS��.���2#aX�\�"h����>L5{��"�OZ����%n�4��Y�Jzf4<7^C�mm5��*�����!�G��x�75�>O\�� �����;ӵ����ِ��k��
�0�RSD�:�S���ح��w���L�
ԏ�Cܬ��n���Z�.o��/2��ms�%oW'�v��N�/Jt\��+m�T7��m�w�^�<{�.Lm�*7+�RJ]�z���K2ޔ]$���_W��F��r�0L&*��<RϬ�l9"N��Q��o�h���]r�Y�	�K3�v'<���Tp	D���C��~*�U��΃�=H+*�z�/��x�Ш�m��a�>�+n7���n$�v��p�u&�y|��>����-�r�8j3�up��BA�5C����}�ɳ?N�5��h����{)y���~�Xg�u�:��M�ߜD��#Q@��ԋo,�1R{p�k���v�I��3[�
��1�c�*�IY�0��.y�9u��)<&�ł+�0bԵ�|���� !���1N�m�Hj��t�q�7�C}��R��I9�[b�����b����
)���pmRo�ͪ/��FA�����g��r=��x{�G��`�A��������14���x��۹�_���O)�D}Q�i�K�+-���R�{;/+����O7��ǳ�!�_�p3��9[\��^$�$X'�L�ϣ!&:�~w� �[�s���c� ]zO�����h�Q)��Hh�z��0q���NA�2�Vr�_��" S榬h�c蚾��;H�v�9��������~����<W}�eD� �S¯Zjy�c�t?�G��I"�\7+�C�9�B��AV�ݶ_i�2�\y���_��&O�F.�s{�5�,)w��m�����ӗ�V�����5Lmu"���(�ő�o%�j����l��t��m��E�����)��_w9'�s�=������s,K��o���D���f�*xO��5~Ɓ�G�Z�>�놡�� ���+��|zOGj3#�5ׄ�R�^}��6�!�U$AbWnv \z+�����BJ@��S�u���0̷EWl0k�hQ��ő�y�����KZ���c�"*��^�͐��C�1��1�#�����?{�`ɟj�|�&[�8x@kǍ�8��H#�%Y���븚��$�
Ջ)��t(wK���+ R IC�����8���ȇ+NsE:>u$Z-��q*$|��ٝ�$d�_ޘ��
g�O�|3�1���rr�;1c�WG�%V�97���^��I*W��;��X��LŃ��o[+-������?C��|3W}<A3�l�Rv���B�2O�)�+\��i��.��w�g��&�1�k� ��h�U5��z�?�j\�%�Cd�F*ˣƿK�(I��
�V(���	�"��fY�IL���Q�+Agm��������G�����n�L���Pm�,��R]eX#�2���9Pb�3�0�S=�2��HrCm/�&���Y�i�M��5Pba.�F����gj���D�� �M�}��{����X��Os8�%,\��>�D��%u���xUw	h�u�ԠP��Y�ؤ��-!�}F;	�	���6�,�����x�,�]� Y�,m�8��!!vD����I�����ّv��n�(�C��z�h:	`�"�����|�V5�wd���W3�v�"�_8��k�g��[ a�.���:R�:-#79#� Ot�cwv=g�<�e��n����T�F�T.US�p���x�˿�S�f�Eo�YpG,g�i�N���˃3�:����|wu���u�b#i;����I�2���+�ry>�ӯΑ+߬,�3���l��FTB�l��s�SF��3��0L(J�vEa�YƘ3�LQߝ�|vbd���l�+R�S�|�4o��҈�����i�͠Z�u�P�{}�3����W�*e���@+Bvn���ÞE[��I�wԿ��,Pp�So�Jy�A��[M\����c�b70Q�(0&i�D�׭� ���9?��hh���p�/\��U�U�%��j9�]�yt�/�c�!��.�R��Ǉ��ݡ���&^e�!+~�rfh���M����CM��:�14GA�s(��F@[��jp���#�j��o��0�xIT���%��<�(�4��ˈ0W����d(��<����*GhKڧ�5��\����#�f7ޣڔP2���a� �)��T�Ib��+�To��l���<y�䖃��h�:{έ�j[��\�s����|Ը���Jl}���f(�4*-��������lV?#{�-P�aK������F�k?��A��\����&���ͮ�n�Kp�G�#l-�'�^֡�_OǂNC�G/�$u����Q,�ډx���a������¶_�P��S)7��$>,	G�=���ꚦ��zU{��PPzST2\	�>���.YNx@A<�eDw�����2�%U�Ѻq��c�a���3��N>�>�/s���1��쪡Q��}��8J0ryә�)�m�s���0����& ��me̳H�:N�}kr�9Ŭ��:0L�m�o*jsv��x�pE����ikj/�_���pW��Q�VV$��55��橜�{�`��v�֫�מ�,dk�g�E7y�ނ�Y��x��7�`�2���]��>�ߍ��5J��3K鹯a��7L�"��+s3�7#p)2Np���Fp^��t����a@���[�o�x�q��Qf����	#�e]���_�NJ��r��X��xJ��ڎ_�]N�9&�^u�a��C��F0z1��h-��R������+�?9S����2}�M�}��9�&���k9�<�|+��%	:��IA+��f񞪶�z?0�����LF������
Q.n�P�+;O�dȜSD�������5j��|JV�7q�*�0|Hѐ�H�j)���p�����/�b�%��W�i����}�$���k�[�O�y|	��)��u�uhQ�뜃��� ��k��z�W�c<ZLozA>�ȫ�����ׂ�Bn� ��Z���Zc��pӛ���� ��5e�SZ�6��:K�A����~��fJ �``L�@$垺���5[7���a�7b�k����Xf���+���e�S����W��/�b9�nH��P� +���v������
6w_�6�ǘv���Ȱ>��$r���WA'������_�0�.D7QIN�y\b�E8_X�Bs��]^��~}���1��^$x�Or\��O4
��z[I�Z+]�z    }����i�D.n���Yh�rf`%�d�N�Zt9��#�a��䆀}������4����$�j�!�;M����$�xX���
^�I���4��PӘ�Rt_;Og~/#0�]Q��
�(���ܜ�^x�!b-z���Ô�����J(���m������o4�w���eϳo�a���<f�׶L�9-�iN}�������C��~�2=; m��UG%YwN�N4mz=\�0�{Ro@d��^��≌p������ïW�`����+���{�k};��k���l�`������b�T�M���\���ؑY�Dx/�%#������NJ�:�Fv�v��bR���&��p6�<d!P���-C��dr��T���Ϊ���N:��SZE$��D�o$��w��9W�@�4r��1@�JV����B���E�f�n���xH��wph�by.����D_j�(:��5����0W��Ճ�= ��i�8�?$�?�z�`��z�@�ۂ��V�43^V϶�W��*տ�G�"����#��,���U��cR�3�P-�R��쇨�>�Ϲ��������f �3���+^D�SR\����ނ���>�._�h�F7�����R��j����U�֎���W0L���a4u�|�
� �ӓ�_�#���<���rS�D���z�pv��Ϙa�Ixgծm<?�!_~JSd�y}�!�3z�? ��b�4�X���l�0�G��ѡI�uoO�L�1-���ɡ�i����y}�b7ŦLA����\a%�[ZFzoG��	���yZ���{�"�/p#��L{���3��te�^D�>s<�c�wqQ]�FR�k_��l��ީ�Um����2��Ԙ����p��:늞|���,h�N:���i�*σd��#-dz�|�u�$���1&���qc��q�;���~	r`mN�F㠕cd	H�Xh������2������J�r���ZC"�[r̥`��8��1�h�m�o� 7���1ߴ{�!�N��M�d��r�M��
7F�c���)y�kE�c��L���!�Ly�H5~��h�23��1_Zz_�(dߪj(<�|�R����g�M�d~�vw\�B*���暂�4��j+u�Q��B��@�fp  ֻ0�W��)qHaW����u�9��R~�?)O؟�`v�=z=�� G��nE?�'<�F��<?l*�!c�����r&k:-���2�Y��&����9���b��z�6��!��A};��Md(�7���y����]����%���#+D@z?%��K�K��ab�^�!�Y�����k����܋J~�U�1�S
����9;��S��� ����5�J����l�B�E�"���x:�|	O	x�%� Ms��ܷ_È}�*���E�N����T6R/i�s(n���\���1��Kǭ�UK��S7���8����n��]�?�:]ƎksP�w*���o[JL��I��'���/��m���b..�u��q��͂����+�_�t�&Z�5���)� kQ��B}.|vy���-+�
�1A�5�GGܘ�:(�m7������0xJ҂���떈�w�#��s:'�)�t��1$�B>%;��ʖ�%&�$�r^8�)�؃c!�����,�ɴ�8�G_^��A�A�[LM�T}�qSOĦ��M�.y��G�o,�v�w���$��@L?�c	���X��q�¯a�~A�f�nq�pY�Aʦ�^G��>h��]J�M;����M�n�{��T�ɹ�4'����Jo�o|C1.�zè\��<W���g�[Z���ȫ=>��0-\�o�4�HE��T���-}r��y��M	�P(�en��^:�)0���BCG�c2�I[V�C��:,,5�4˕����)f|��\�0c��&�]h����0�?��|# N��y���|��zoB�ֵ�V�c@?\��ռ�5�%H�q��Yz��(w^7�^S�)�U���"1���aM����3�y{�	����MM�d�6�H��:w�j�"�ָ0�m�����*���K�#d��pa�*[
�.o:�����"�h�W[Χn�DƬS�3D9��.��
=a����fP�o�i ȺcP�|}~�8�������cRh����p#�&�	���&��,F�<z-�: �_�{�V���Ps�s��sVFqcx�$
�4mٶ׃u��b�Ą�����kȂS�����{\ 1����w\�0�Q��"����R��>2���G�X�����$Vڗ88
�+rr���C�x��;�O9�L�%�4Ls{��Hԯ��F��wZ ���܎%/��DUw,�ױP�E?�v54��:V��<�E�K���ɑֶR�l���}X��לgN/qOz�ט�s֚ �{�6�녨0�|�����Nm��f���̑���eG��0��/�[�hu��<H�C����a�2���{&���o�������?�p�;�_CP���;&�\K|�Q(�4:^Q���SS<�?���;����Rn�KW;c�����ti���o��������0�c�nT&��g!Ƹx�L#�%�н{F�_�������t�[]Q6I���2�ɣhp�g��Ny?u��߻Q�ⵦ4����P��I�ظN��}����+~��Ly�f����A!�ڶ�����~sFv��M�݌�!��99�G9e�F�����p�"�a<%�|�I�Wm�%�h�k��G4�����~��0�����7�e����V!8���hA ?]�����T�PQ�唐cՁp=��&b�)�fnϏ��o��T�Q�)HW�i9��ZrG@���I����o�<|S���M�cΕ���|��Fũԓ2�R�l��>v�1$���>��:��+R<�n'��6Y��\��)���gV��P�R�LG��ol����҂[~���NH)��jy�2['����<���tBU��P4E�7�w�����K�p�^S���'|�Ζ�h�$�}�U�a$�rź����飄�Llɐ̘֞:k�R~��������bo�}���N�3�*=	��J����x�0�}X��/�����$e~wZ��.����4�Z��[��oɷ 8�n$���p�Idy���D#�1z������OM�F�+j�u�]V�7EN;cfp���#K���m2���@�*7���F��v� �){�A��w�h�x;�0�|�j�)Zf�)<���V�4ziiϣ2|�ô�]�����d'�փ5�KM4x��_�k�t��g�����kɧW�~cOG��F��We4<!~{��k���oj%�i�B�9�r��햤QW��N�_�K���!Ӹ��R�y�:p)�!Z�(�{+������0<�zÄ�3��*�8R�Z����1�=��*�?#p�N7�c���C%��z�����#�1*m*oW�&֔�n���,��Έ5�S����6�4ܾ�]�-)ћ�t|��b�}�8|L(�/nV�ʺ��7����I���:2������x��K�|3�q(����OP`�!{����\��|�V��٩C�$���`izSG*[�{�I�~�{�����������iR�~�o�����JhZ�Z��~R�E�BJ������a
�:��;
WC2+���g:(�U�.���0L��r��-�9	�7�����������)K��Vy���J��n�^��sN���c9�r���ez�a��:"�a
�)Y�j#	1|��(�W��(1�c?�_��B����.�n�v������7۱DǭD�H"��<՟\h�k\���v��_rG�U>0J�>�"�DfE���8�u"M@��`9Ӕ��{��Ə�cC�=������<�Q<������l�]��=��5LrF@�Rg6�ȗ)��a���'^v��g�#�C�j�RNP߰ۈ3Y����*{I�*Z�UX��<�IK�7P��@k�b����8�8�)K]�ײ�����0-�-�J��f��s�"<g��J���(��R��0�8���LS;0m$U�����-ޑɩ�w��D���A�����)��T2�@%H�&�9�/�R�;;    ��E���{簟|����6��һ���ȰhB�Q�l�SF�-0�G��T���ׁR}��tco�7��k9�`�������Y�M�k�z��a�$m�Mݍvz��l��O����m�f<���1L@P�Y��̳�u�aV����l5��C�8�>���+�t�-��"��͜��Q:�ܥs^>-0��;c��t#+�K܂3 �!UV�۽#�∿^�n����Q/��3+�eiZS�Q��o�Fl�zZv���6��5�&�kA�0ܓ�	�� �s������iaN��7:/��tO9R����$@l�.�������$)܌��ف]#���'��r�`���T��߿��M�����AD���m/��q䨴Gf3h��xďK]��+�8{�j�a�'����U�V:G�v��#�^Ll��r��v3�����H�P+^g|O Ā�3��놑߈��鲋�WJu�A�-\�J�0
E���%�1L�V��t<���0�N���6I��u����!���1z��:���-K�K"�Xv@7W�&2.�W�0�a�zC@{d��۴ 3�y��D��f�~��zا��G��/��
t�qN +Z<<Ka�sl4�k)��a���J�r���s�>Eմh9sƷ=c1/����I����d�M��|�^�H��s%c%����N��<�c4g+*����/�v ik����(�"צM���8���0 �_Fz��1�S��0�)�V���aP�lK��kj��fl�^�dp����C#^ٚy�z��m�`hWjY�b`��yc">uˉ?�z��U^w��� n��&;m��f ���˨+{?�PMZ��/�0-ebo��h��2�HE�7f�S�� ���F�0�~0~�ݛ�4[nt�L����S��v����ȗ��e�~�_z�c�\�ܹ-�
R�� ��6�����(�Q�3�ɚ��9Y��2v�ᚵ�e�r��aY5-��S�܅�"�n��P �Ñ��c�w����*�pV��m����tTg-;���6r�6����s��e(����dռ�9�2P@�&GvL!����5��ی(_���>+�T[��1�Ԣ��Tc[��j�64�����j�9�(g%�	�eXN�M�%ro)�� \�~>sVts]�f��x[۽G���/�~an�͸CU��q-�PH�"E��p-mj.lD)㸕&�-L�F�?�o��[�d_���S���ET�������X{Ƨ��^7�~em��Y��1 -��4^�%r�@6{�Ԩ��s���ݨ�X�[f����L��>c
]U=C_/uӷ�Jz��0��qc�~�#�TuI��9��~~�2��!�v��e�� �2X;�<���c���C�iR�fN�3ƅa.�dJ�x�.����P�/�|�0F�� x}��>kfGh�Ge$3a��U�#�cRW�"%�9e	�Iu�!�57�h]����̳߯�wH��Rg%�K%$��P�2��)dD���D�V���j������]��oǌJ_Pś.�(v�/�����I@�@o�%um�Sx!����r����ɴG�fؖ]e�"TS"*@J@�UN�������-d����7�3	�$O���l��gq�����ً�i��nnL���Yg��t�)��cQ��W���y�b_Rt����G�R�L~�p+a"g����G��Z� #_��vKRt'���{Y����F�,$ϧ�_ft���L]6oa����Y���m��)����Qɾc��f����3	���rS�F���{�YdБ	��K�\��ntǀ��d%Z�ksl�>RO*��:�l�_�Ƥ��Mv�c�Œ(<0�H�G���ֽ��=.�f�
(>��V5�����(�r�UY��� ��$�C�!}6elR����/{C}4��k���21��1g�4zY��s�8��F�X�OO�}��|r��5��$��C<,mU�q-���y��[#t?�<�j��nd��br���:	|%��{{��y|�	|[�Z/|�Ҝ�)`L2ь��ve��p���(z��%��ٓ��Fr��H��V��Dї̢B��>c�>>�5��4���{�11N���+�RɨE�D�H�u�^WH�p���M3�G�;,�����u$dih>h����0L�d��½.��'��N���z�]�ţj�@���D��5�r3�^���'�g�H�4Cq/Mf�A��������ԛ,��_�%�*���9��}Y�`����� ?��tY-ΰ���g���<�c��?��7Eh��%�a8}�T�X�s����'�RJ�\�f�u%���Y"cV�U�nx�g��@Nabi�$P����3���v�����������G�{��/'鉈�i􂻞����g�0�Z��M�S�8�p��ë�n����w��s��1fA�n(I���&��Ԇ�R�V��"�/`�xj��T���ɲ���$�Kާ;	I���˶a���wE8��}��a��8=���3pr�*���+�0���gƧ��R����w��4�5ҁ\�|~`!�� ����-��'v�N=�^8�Ә�x>O�v�l��U6�Y�.=`I&�"	*�T�:��+�$����8[�힕�������DT:,P��L{i�֛5ָ^M��"m�	W����rth��5�KB�p�%<�����F.$���t.��Z���)�����~������ �m�FR�'Gx���E��q�A�K��e/�7#���*v���N�N��[��	��=��=�U)���E���͖e%�GR̹�#��{�ӧ�z}'&㟀�W��c��߶2ŭ7���	#�m3�X0�D�B�	/B�|�2�;O2���k��[�#n�~� K���d���)�~�J�B���+Mq��1�>�0�]Ӈv�������m���I�����:�4��T�Y�q9��d��<�kH/�k]��/�:�{�@�'��aN�����D�+`�h���lJ؅��Sn�.=��ٶ�/��w)�h/��1��caƏ{#�p�j����	Td�k�K�=��)��Os�+��쪭l�0��,7xI�@���pt�����J
g˧�Ӎ��$]��L�����Ȉ�:�Mc�>敆�O�#�ك���!r��+�(�R��#B�B�����a"2W��;41���%���-��#U���̦^���s�eE�v!��W/�����<{5	�)w�o%�\ �K���n�Rpj�0K=�<�ӯ�p��.|o�C;�J�&G�I ũl��#ߙ�_�0�a��{�(�C׉�Z�ˌ���q�p�Z8+k���f�*�E�޼R���=�����̶��Vդ\|�R &?��l5�	?:�t#4�8N-M����<�u��4}*�ԛBT�ڛD��R��x��E�^����5��q&�ݎ�W�L�L��4V��u��L�c�j���N���P��V�uߊ9�4ҿb|G�8��P�d�0�.: tV!)Y�,	t���e��d�/�c�>j�n��*� �_�5�J���|�K�:�k���aR��]n��dNsC����a�.�ܑN7ݓ���|��˜ �vC�B:��Q����e��đ?���T���3=���3�vQo4���4$놤���j�pB�2*���i`Xҿ�,�3\c	�b�@�a��c��Z�O�����j$�S�����*֩>�[Z5��{�?�c���|��{6�N�,�E<��c�pi�=�6�3'��I`���B>�%��&�m��5p@8�)6z�黕��?�Ó23S��)�8��]�cq�o�W�W�$�[�e 	<'�[���o�Ȟٮ�Wt��d7����G�*!�yM���6|�1�亡��)�Oi{��NO����<�ww�o�*�&b ���9ZY�T3�nw�e�#w�K�6�W�1��:��ۺ�����+���&��V�����q��c���v#��"�ޒZ�Ɓz�en˄ն�_�0�V�����|M��r��iQ�svN�A�%_��I\?��o�8,ྶ�K=O���,��3�4��~�>HD7<�9��R�JFm�����4g\    �=�a�1�|P�� �WN����\O�SAe-�['���8�0�%�p0"�wMP7в)9��H��nG�]Ǌd��Rw�g�_������v�gQ))�S|(=����e<�Z��9����#�"��f.�xR� u'c��/C�o�f��J��a�S	� �R�8Rk?c��H������Pnj1��V֝�#��"���@o���s�_�P�h�7ݝ�U�TN�h9�͑]�THL����A���֛�T焝-3����rJ��^e7����n�>T�
\D�݈���ݶ�el�����"^�矒� �[�a�����x�XP�{}�g�"�<g�x\��k�O��8n4K��#e��\��ܴ2�����~��DZ�&��z$�d�!µ�ݑZl��2���(���_ޖ���f�A�\�X��>#��Ug�q �
��G%��N<��ސ4�9V�&��-�&���z�]W�ןR&�/(�����g
'�i�ɋ�[�=�������5|e�Y���:�`�+�zn�$�@!��!c��C�]�%q��0<f;;P̨m'��2V�rZ�ã�^��$=	��`7X]qzp2��`}��!_����/��ʾl7K5N)��=�A�P��V$"v�����5@�m�Gj}��ȑ'�-��|%P�nص5]�^���REnzǱ5� �0L���;�HS�����s_�`� a|�b2&Prc��ƦxJ�)���3�F=SJ��'<�M2�������e|�f�ۺ�_�)5��;��S:�l3��$�'%9��8Z_;).���׋a�Q�b�L�֩�pܛ�6y�޼yg���ۣ�aL����/:דic�� gx��2F���I��;{���WC��t��A:�4�/������@\gy�͔�o�����a�({H$̒��3���J�l:�<�*�w^���F=���*u�N�U|}צM����(�^4�e��.&���l���Z�Sg��tՔ1*��U�~��c�]I����m���f[�G�⛉=N�5�G�X��J�����{�*��������z60����w�F_h9�K��Dȥ�ڍZ�C���M?���'���Sڛ���uͬ:x�z�.Ȱl�|�)����;
;^-�ʈ��Lm��i���E[�>�����JBx��zo
!�ܰ�k�B�ƙpK���Ȓ�ޏ�g���?*�7�v����ZN��o%� ẗT���f��4Ҟ�2i�=�L�qc<�#�w� 1�fY��C�`]�妟/��N_�I� z?�8�x�'?����ET��&��o���@ޘ��C�{�6H��uK������l=��jq8^��.H*{���qa�ar���,T����si�ZN��xEPˁv�3���-O�)�l�����H���*�k���f������_�mI�� W�V��p3%�d��h
^A��@øPޯ޵��bP���b�X��J7f���i�<V��x���w,1�Ho:;�N+`L��{R�(Χ���y~�~H�#��L��^[m�|뽦���9��6���ZO?��T��1c�Y뽬i�F�xJs�APw���&��)�Ť�m[D������'��t�����G%���6�\�1
��ۣ��	M/��]�ߟ��䞪��sC��x�H77���f�V�����my��Hn\��R�ȭ���S�I=����&�]��
��OC����u�Z���6� x5�Pf�{T���T�����0I�)4�
Q|H�Rtqj��#����$�����d����'U�E��Β26���]��a�V��"��a�ȕ27(��h=��t�)Y�����<�孱�l*�ޛ��|ɧDv���6�����p�5oU�\I	�D]r43�o��
�𛞢7�&�w���sLC�8��3f�w�Pd��pXҞL��މ��ͨX�]ʩ�r�"p�)�u1���w��0�\�$7�19R*�]Ys��[ _�Z�f�z�$�I$כ�/x�fs��[��;��G�\���p���B7]�p"�<��FD�i�q�T�ͯØ0eɷ��M֜&��՜t@��^%�Μ�:��Җ_�0%9]�H����Z�f9�gK���������߈>B�ra�͑Yd{�0n�|�bY��+l\�|P��D��uh�oZ�w�]�ԣMN"�uW���e�4L��ڛ�E8�t��)�;v1��6�X���QWC�w��Qzs�K�;��#n������T_�g�����c���������i�ߓ�� ܉�_�M��(P?�r��v���(��M_�5�{u��8p���w�{�x�E9�2n�����v}~���$�7�A,j&�A�,�z2��V�Ocu�׫�a��$��z�f�i��mL5K�b�E̙�-����I�0҇�����1��>#��ZI�#2��&m`���p��RgFBg=4:�4+�č�^⠭���iiχ`������f��m�l)�G�%�=E���M�ӡRdϿ�a�c��Fj���))/k%�	!��i����zG��qc�.�5�3si-����Ș���"��iU���øg��%g{d@�8��xO�D#Oϳ	A�y�4�|�S=�I�*Q�Q9Ҍ�W�GK%k���k0ר�fzL��^r�'��͉hXu���?n���FL���f^ �����HU�5�����Aˁ�o��*wX6k9���$V,�z��f���q���78�Xm�L�N�xI޿��.3���/��Fh�Y��$9,�ʨ}�=ks��q[�)Ui7�u����P��p}ȋu�iR�ßԭ��(U�7)kC�%o����k�%�@PJ��]����������..LG��U�7�.������Y�沧[���0��,������������A.b�"�@��N��qk\���)�`q�/�I�~�7͋D�s�3�\�I��I5@b�	�|�QNqd���0 Ɋ=�t���\ŷ�Ż9�F}��З�Y��0�{v���[<%��Cu^Z�Ѵ[`�目�	U�0L���)�a�f����>��������R8��nhiACg�m���=�l��݉"X���w��vU�/��2�y���q�9����mh�9A��$�B��z3	t`x�"z"��#œ[I���j���K��)֛��k�3��̟�v�
�q��0�}ä�u��^�p6��F47�c���s��3��]�>�%�K�I��e5K1�� [|Ɩ%r�4���
�|׏Pn���&5뽵��(ӱ-=C�����l��x:��N��ԚK��������Ϗ�}#@~S��[��\5�D�T���w���x~�3#�|I7������kYG�)�ƩR�a$eq��Dkҟ�|�%ېDqO����-���b�h����a�k��JT�i"�+R��HV�q���� �1�ϭ%���������%�|����r���7��p-_�L��E��@唫���t���~
�Qڽ��磒d�����,���;���s/�u	��J�Z��xJ_�s�7�1��M��d$�G��:��g�=A��Լa�$�OsӞ5�;!^����)�yR��x;Џ��8Fr�N������|)9g�S��f����1�1��L��9�b�hſwi��@ �6K��Ihs�=��c��&��&�����{��@���93���e���8��� f��e;>'|�����e/��°����0M>�I�&\/�=r�"��l�cV|X}�����Q����U�Fb@� �c੄IY��t11]��c�cjd}7e�������z%�ڊ���Y���eJ� W�s���Z��2�Loo��Xl��\�a�~�՛5�3g�3K Ôc��ϓ���l�u��n�o����ƌ��gn�kv����Ec�:��K\�}Ȉ�W��Xs�{�ug� U�0����o���1�{ԍ�J���Q�Nl.���=ꓩ�1��O;�'���Ms��$��YU,.IMvR�pP�J�k�
���n_f%LM�E��a�+�_G3"�>k��ؼ���ے����]8_�$q��,�s&�a_'nL�WL��>��u�yC �Kw��i8~    ��<��r�:�z~��s�5~�+ʩ��-�2��&�TV[��r�##P���!Hq-�i��Vr5Ļ)�����{Ɓp3��')�N$��2z{�Yr ���A/�'����a�~����x�`�4�˞�f:���	�!�b��i5y��|��U������h9GdG��N��0�Ǜ�͍���h���|=9Ew�˴�mվ_/;�a�a`�ٱ�ufOv���큁"���n�xJ�Dj|�@�g�`i�pk��Wʄ>Ϧ�i_S��m<�d�-�+E���0�%��Mpq���u&	/̔n|�\�%w�ōYZ����Em�쿀�M&�D7��KȒ.
v��C_���3��E~���P��q�Js��<��&g�3i_�4������3ѿ��?�9�6���Oy����?�=��}>*�,3ı���5"��+�$W�)��e�ޣ����>�?`�����o�T'��h�W��ԯ�(\�v�=���O�,�,O��r0�l�k��ƿg������H��F�7���ڎL����\�)�p���'������?�����(�L��QrR����wP������'���!�E��]���=g�:%�X/�#�a$Vx��aX>�7�>ܩ����F�]���}t���I~��Hn܈��
��2��ap�N��	�j���(������m������O�hb�u�{��'��w}(�De�5k���������t�Hd�	�-{*X\y�w���{��`ڥ}n�u�@�2��E����8���{N�忀a�~����%Mem=K�=ٳf�9tr���m�_�0I�nz�"���$ޫ����S������K�ѧ���FZwYP�'�Bn���%��W���6U��S����A�6ڪ�^�I��Hn����p.sJ$����b�ۧi�"����#u�ђ^�gme0g� r��zg=���<�E&��3���$�wJ)�j�6E�:�<���aD,�ݘs��jx�J9�&k�1�{���۱��i� ����}�p�N�h�X�9����?�_^�؜��8n�"����9�ǡ=Ŵ#2�bפ��4@j���Y�n�0��r��wה&]eX$�p�/�p}���MaR�x'����;��H�ڑ�0��:6�~#.)�,ա9`�e�1����EO����d���8d=E���/1=b�g���Zh$���U!\��_�����͐�5��
+G
���Xɷ��3����%G��O��������V�g��$���y���x)�黲:mi�h�m�7���O�#!�r/��{��3�֒Q�E.�q!��g����$L⛲�in�hY'��fe@<	C�����7�L-zR�TO�V[դ���AG<Q����O��Gc�0X�@C���xdu��D��Գ�x������C�Ǜ���g�Z'���< |�����g�8D<�z;�����o�'��BM��j6:��uk��k���3%�O�ɋT��{t
X��s2��ґ����L�=�b(�o]!����uۘ�w�N"�Pd���� ���sh��U+Y��ib���%�~�q,��R!rC=�S��a"	bԛh�kΗ�ۥ1��W,|/���ѵ�n�*�%��M�1�Ke��0�c$Ѕ�q��� (�w�>����W��6�YS�脣��ZzNȲ���T����[k�A|G2Jr*#l����ea�M2�.��&`L�o�Ͳ�jlt�̶w��s �Qi��Z{oǧ+�?�i��&��Lp�H�Y�^-LŶ�2��:�5��4�GW�_g�p"Wg_�-R���9\��"���w�\�.K��0��h7�M�͜��0��怊���P4R��8��1L��	�͝��!LB9��p/��)�<�T�b���;�p���5rÙ�g��	��<�8{���n�,����(��p��tN�{�WDgv��.���0����T�����`��;g�ҋ7Y����}��(I�I	�C�^gz �$��41I���EF��Ԫ9=�{�7����P�x[����S�����!;�L�ʞ�1����d��õ�"'��c���Ӽ%�z>(A��	�e�n2R�!Y�"}�q;L䴨jv�`��?Ɣ�v�^�n�2]Ĥ��Ⳟ����=œv��D�]ț	�9��¶ֳEL�Ȟ�b�a:VS�B���'��h��v�74�.��A�Zk��;�u����GL�gWn7RK����Q����3"?�>�F�\ ����K$�
튪�f`ý@C�;��	5�Am��x�d=�l�o�%����-���&n�l=a�bo�����9�Mg���a�*�U(�Gd�3e�6D�Ϟ1�s��j��X�k��=�V�����Aҟ��a�H��3$�gM����ٕO�{�Jv�������n�m�ˑ.+6G���+�%��gd>=i��i_[b��T�<l"�g��U������R��0LdϨpc�X��-yP3(q�ŧ�}�V ��a�Sso�eu�O�p�-I��́1�g�����&@����M�y��(.�l�f�j���7Q�oo�a8K�^�X�r��%"v�^i����zRBk�O��]���ftU��J	�Y����W(�ChW�ϻMy	r�c%�(\�%��]Q/J�F����ه~/�4p���]���9+��Xc)i�{���$i��'P��V�W�wiY���
w�r�����m��4�gH��j7��s�g�0���0݋�m� ���5�/t��z�A�c\g�tk�^ܑ(-r��Xߦ#�1�Ո�d �)�B��2�c��ёg��5��"�~3�:��fՆ�|g'r�QG���<ٞ�u�& Rś�����Iݜ�Q���Z �V`���'Ja�G�t���HLY����]�+���}8��~�&���a�#��FPhd�	3������Ժ�q���.�����RM8��'�#l��הr7|���h�ڐ���n&%������y�,(�w�Mim�l��>���j�1LD��	�(k�N���37HrS��kQ֚�,����4�}0��7�)U��3y))�N�Y�<6xP��W=���FW O#X�[������c�YU{��*�o�}���9e��f]s�{i'{��H��6��_��䮼`�I���K��9R�{XP"�ν=�m>�c0���n���a�!��KI~�Q�oO������}ô��H���LE'�E�Z��T�G��R�ɲ'�-כ�i߱�$�Q��Jh��E�)}��
n�ڧk�O������8��f)	�I���f����|�i�/Cl�'�M����"�8E�,�&M�O�Ii��1�C�^��� ���p*�E��ͩ����x������1�
7|���G#%HeQ:����*��c��[���a@?����F�i}l�F���Ʋ��m�S����fT�Z�_8�]�r������䆵4��/
�6g{�r��������H+�;ߜ�g-=�����'�s��Wګ�Ug��0���L��Q����|�%y�!�Z�����|���"��ds<��Ƞ�G��|�ʿd� |ӡ��x 5]N�ư�2���v��6��Q�4�}�])s!-Z;�9(^����S�\(�_��;�_�H*\Q���z�2�R�*�%���^��v[Ҝd��Jz���Rz�1wH��ڻN�H#_�w�m����p��0�r� |M�;�pj�E��&���SJ�ča ����1v�j*&����Ɩ�]mw��}ð~����`�}O+�K���.}�ը�MI����Z���>WfD��.y�R�(YS�7����=��0�*��ت[#g<����ו�����w���;L��Ykǥ���ča.�;��	�^�wa��]a����׊lK��qJ��吢Z�/>���c���J��ȳ��9^-Ib�e@�O���v~�U�a�aޚ�T��+�̀��g a�q,��|�n�I+����j�����:��o��z���}L��6'��j�JZ7�n^N8ԝ�q*u�'�M�<���_	s�C*�����K�:r    
�T֮��^��� Е�B��k<��뚩�1��T���{A�^�׷!�#��d�0��19�u�ܤW��99!��	S�~����6����	`��c��z�ܻ��I�t,��s	����i$z3��:�sG������}�$/�6��I��a�7�����Z�x-��hm�Mj߅��Q�y���J��F,M\��@0�EF���y�]���y���O���gei_B�9�C����"����~������A�8P�hQ����WEn�xSt������e�ZA���5e��V6�#�LŒ!$)W9����y���d����3���}��z��Lh�di��d�1�'�������Q��,�־���������a�o�|��ne��##3p�vI�x�;n��םo���+y�Ia��r�HGù�o։�m^���K��S�zUuh�x���L�I�7K�����]�xj��a�OsD��h]�^�|˛����>��6���
m��w�y��{5�< Ii�kq�P@j2����+�%rȈ-7,�ܚ�Y�p�2���J�[��D�_��k?+9�~���<��x1)��s�VjY����l�Ø0@��7����$�$s�֓��O��QM���y��0�����>��<�h�=N��²���CW��GkL2p�$��0����Ȋd� Y��Z�u²\�y��~[��.�ΰU�R�1�k8_oT�{絇��+ܘ0!�<%V���r"<�K)]�=�T��4����u�?�x�?;��,+P���	�u�E�jmw���}��Û����a$��I���n�Ǌs�sO}~4&��>,��l��1����'�@�8P<����N�����0�Iꂛ��}��E ������5h+���m��N |�v�}�p$Oj�$��3s4&\ժ<��|����v��խ�	R�)NE���:�����yR���%��KDs�8V@��|�䰅r��������r�����uʕ��s��֠�w��tS�J�_o�5J�w��W2ռ��^���~d�]"?
�3����5ej��70����P0�0w���^"V��xAx�_�.�+W�(&�u�G���:�lC�Z�%<ΐ�Y@�0���E�Yȑ3�[�B�J��P�����=Nz��P�^p�� Yh<W��s����r��O���S5N����،�k�z���,�e���� �����,90[� ���5.+ܨ��"�\*�9��ȝ��֜�R`�|ׅ���)Ŗ�w)�7�K���H#���@2*��W����u�g9�W�z�X%�;)���W��*t�0�QǑ�T)��L���׳;H�K��a�����d�f�
ϒ3CI�9R3��l}��� �9�����8z���# �S�G��a��07��3�_t���D��|�h<�l��S	�G#�odֆ���F�Z\��7��/��l��P@�����4{qc��M���+�Me�$�H��D�_A+���9��Ѭ��h�����xH7\��l�\�����H�iQnco��|�ھ�T�|�$�j���k��^��Q�I�k��ʦ%%v�t� `��:��G
&ⓧvs����}��1�95��,��uz�œ����^|Qܘ�&����y���$ M���Fd�ϝ��ξ5�V<u��9
u���z6�_���������}�����w��6��4�*�D8,�b�4F�4D'2�D�����8���?��?��>���������;!�0���t7*J��ͽ&�>�0����9�u]�|��!�{���6�ސYl4���g���Ye�ް`��W[(EM>n�|3�PZ�CG ���d-���y��H�~�p���.R�ɼ�ʜ9�[2�������Y�4L��񕢉a�o�{�\]�'��r<�C�^���"R����"��dv��4��?��l��zy���{�߻��1�爼�:G��a�������Qzs����Z�Q��@��G������L��q�����_��?��;m���'l��SV�ٓ���!gug�NGZ��$�QG=��g��X@o����N��rԲy�����d�Y�:�����F$��s�yj��:���I?~D�7h�ߪ�
����.?Z3�����>'��B3����R{�uH�t��\o��Ù�e��r�nif��4�:֤Tz�C�����v3�^ՕVoaý����6@�d�A�/]��V�fv%�4�4=q�U��Y�M�K>�"��Zd&nL�E㍎��eg���fd��[���"H�_�0�qv�������Q*yF�E"u^�u��y��0��z�[*��1���B��뀰���D8��a�>)�w��P}���[s��zt��	T:����+9�)?~Q�ޣ6R-��8d��h�J:	P�I�҇Q�����>���"N��{�k����i���]h]q�C��x6�`�0Id�Ȧ�3�׫�i�ā�f�]a�9�R5�6�g;Wњ�6��_�e��	W<[l�4	f�|�t��"���';]�ϳ�a�\�7K4�2	h�����,���H��[D������]*���ޫtL�n�Ɋ�V+�����lC���×�M-eo��ݠ�.;w��~"q�,ڽ������0��/<L����Y�3!Rk�b ^���~��y���w�5`�M�٨RG��_5�ֱ�:�$�ԙϓ�3���$���r�L��xZHW-�)�\���1�(Y[�H����&e����{����^�kr�R	�+)ݵR1�FB�r��z$��KnD4�����\�w�zU�m'�G��6(W���uXq��	��	>/�͒K4jUo�)�z�9^��Ǎ�{w�w�xH7��z�7�8w�F�{�7C����^�dB0��!P�:�I�$�T�~�|��
��K���MG�N3��!�m��E�0L�C�%�� &@A���Q��*����u���{F?���)�k���,}Y�۳�4*���+��y�'C��V���M�I��:3�Ɣ�J�67���z^�0����o�#���d���N��MF���mY���'�L�x _��`�GI��嘸1�X'���M���$�Ͼ�\\*V�oahD<]�ǲڏ��3�������������l�- �R�y8�K��K�D�sɨanǬcd��0��zQg������-M�L�5rC��!O����o�E�������a� '�[����j��,�0-�M Q���\: ��IE�D�u7�9�LoZ����ɩ�:s��,�JD���.;�C��"|����a(!m�>�ō���W܋�r��|Z�5}���|�������4��o���񅕳ݺk_�>]BJ���N�q 7L`�	��Ng����1����e��G��x�����φ���A����m���+�k�]����1����9*��ol�M`��HrVډ�n{���1���o#X���=�K#f��+�.jɄe�sA��1�4�iu�@���Y�!-�s#���i�f�,�}�|*�@)��(5��k��,��|�:u���qe�����솥�㕯�=ա��8�m; ��rD?�I�RiW��3&m�|y&�[[8�)3~'�{������a� ��p���79�m5���??4�G����ca��N�iR/�$����yBˌ/���\�e��P�矒f�4�en�'���\:-7c4������抇�y�V�c� ҕ�o�W�z`ڜ�9�h��B1w�g�O�����J�iW��vԿT^G<%�7�g;o��~c�Jr3!(5��8��E!O��M��!����S��*f}�ERƒ1W�ܑ->a��K�l4�J��u��7�ҩZ%�ī�ȕ��C�����"�C���z�.��W�V�'6������AS���k���lv�E{�Y�y �g׫�Z�o���_�pR����)���8p$�Rw�*�RNn*�!�/��'U�Z'�e懗=<qj���!��o�N�a��*mtS�[���eU�nk�2p��ఝ���-��@�vҍFq����)n@Г=���6m�?��<e�P=b����o�    0̘�{�޽��C��=��@��J���)_#rk�#�F�/ ��Q�o3�a�.�/Զ��)���n��7�'�����o�����/���{G���M�\IFa:�e��]e8����x���e��I�V�/.�uP�a>������v ���{{����i�j�����q~G�g��K�n𞓘i��H�X*�`��1�S��%���di�^Nr��Ҝ�k�~�s�p�]Ӕ6hV�S�)5R~�؇K���z~��U��m��"� �|vR�D2�D2���髾��0��v��iӭ��3w�[�J^P�O����Ba��q�Yd�kj�"��V"��|!������v!���v3@	gӠ�.�l���ܬ�c�#=�5 �/��� 7u�q�����g�S�]�0�������u_�0}��y1��Zĩ,L׻s�a�<6GJ��T~=X��D$*@7̝����<��
3��.�2)k��Dz�ހm_JS��7Ds���=��9P���a����G������?`��g�O��+GxV�^)U�*�܌��+Wkg�tn�ϊ�a"�p܉��b6�ƅg�d�/��=F�����C�����:#Ӛ�%:'nL��a�⺖U���mf��arQ��=M6�'��ՙr@}�,3h=[`my�;��0�1�+�g;��fI�,+QG���� �~�0�U�4�Կ��])b��8U�TL�.Lթ**��}d$\F���=��ZEI�T(��?�S�":{��^�N�؇��(x�f;e � � ���|���V<���qcP�f�Г�t�^0th��KC.q�eL�q���X�67��KȾ����+�њ��w<��BTإ��k���nsſ��qa�322����6�q�^qi-�䌭��Ӡ�
�g�[�t��;����]wn���W�?7Ⱥ�~͛�&Fp�8�ӧj���=#�MȈ_��H}���YY��֎��{4x�=�!��Z�R��:��T)��-�d���ws$K*��r䝠�M[>�F�V�%�%�`.㱟�F;�����tի%�*[&k���'a�Ʃ@�r`}ӆ���[�P�ߌDa�mu�g��{=\o�U����-�)j�n�k�LZz� �eU�	|�=�0	���P�g��iX��09 5;��s�ґ�p��|;�ǅi�W�>VEo�k������.� �f����|�<�|��Fh���K�̺"#/M"RS6�z���{�Eg��|���KG#����)EZM��\��ԚI	�+P=�|=�<5�>\ܘ	 �#M:C<)�5R�$���r�cg<�xr�D�����٘���?R�(e{�!���W��0��a��:�ʘK���L���ET����TO�5��=@R���9J�P�wÀ5�Kܗ)��pM-ZAZ�1��i�:��d�>=|L�� �juS$����0)A�7�*��
�˞	��R"P���O�L�|��ߤ�v����3R�1�0N��Z�H�u��o5��Fm{8tj��"=վN\�T��cl�\�w�a�$!�S���B�ޙ����T��g�Va�x}=%Ä�e�彋B��z(2$O��)}��5��x2��xJYw��u���9k��9����M�L���o؅�1銪=��0EA��1�f-|e)��#U8�J�o�ܫ�VoR��!E�.����;rm0��-�oM>	�5����eAro�����e����__�$�������8����E�bS�L�#����r���F�����9�h���vJ�Ԓ��{�f��$l �%�����"R&�"�>��0qok��z�:��H�n�w�ױJ�cf�We�c�#`��SkJ%�/r37ƪ\���cqa���GgY���׫Ti�H�9�ҍ�"n5;�7r���2&�2#�&����/ä�`&}�.RH�0����@�2�;S�a��|/Ç[���x�ٲA]���+bj������>���T���MGh��7nD��s�G;�r���0D�v�|�" K��$��$���D�g�+��2�~Z�[����X�-�u�ș�qw��h�ϧ������P�}��xv��K_\K�6�$��%�a�y��|7ϮS��\�!��Z��sd/����W*��+K/�{|�h����l��yt���D���[����9I/3��rw`�,�#u�`JJyR���Ôr����O��g��aw�D6�o��g��ȀZ���#��ן�����D]�Ð5&�'%v�Dvl)S��p����~ɺ�������;��:e.HEW\����K��TĮaF�i����<��[\��s$�G؉������b�!��TD�GTk���pd��m�x�����g��݌�ڮ^%r��5S��~��lAM����5��.�:�hE������{�x�2����^";F���{����\���m�P/R�l��ÿNl������v4}��a~3C���@W�Pdx��ҿ�,q�����+�[ ��a+�jNm�_zo7�QI�Sx�����K�ffW��k�V?eN���$.L$Å"��=�����0���\uRy�!�J��츷��T���Ί�0L�5'm^k��lw�XC(5�7��v���Ba��7��q	s�䟎D�Ĥ��7Q��z=
�`���+�.u�J�'yVRR�.06b����Bg>\oV�W/2S�̒���*qY����	ꋆ��hD��Vj��P���Z������ܯ��r�4��s�Au�ƥ�w-��'�e��WfQ���~�87���f"�q�N+�JO'��H-�6��z��W �8{���J�3�ST"���C�K �ѷ���qM��ӷ��7�/k' �̠�}��	gM����W|�3h���e���G���7M��a�f��#7�e���	�80h����W�m���7�����͘Z�c�?����3��бJE�������+��� �A?��m8�����m��?u�9E���4U�������3뤻�]%��b�a0�?x�2htsD�UسhÜJF��h�������n�0��*����)P��
��X>ʪ[dq����-�WTCЗM�	MǓ��q���pZ��<�k�\�v3����p�j ȑ7F"3�6R�b�%>z}8e��0H�̣nR������č�$w��:��U��٘_��|JN�"�;a��a��{��j�cF�׈���a�fC&���[�dΔ�1OQ�����~P_��y��,�;\�cT�X�t��1�$�|��+r"m��������v��#��J]1:#��xKG�����.�K'�=n�ݤ���1N�|ʨ��
D�;�Ɨ��=|��*��J�`1�252_
�n�B�3�_���l�_����Y	&�5��ӓ� 8��>�Z�۰Nz�.H�<�?M����j�]8<(%;�e�o[
+7���?-��%�¿��R�bVi;��k܊�F<���{���ʃ񻐪����E��YЭ9��ϕ{⚄X{D�?o����b�j@�l}"��SD.�<\g@��e���er�0�%y!`J����v�8�^�r�K_Њ	l�C_�}��0��&�7����G[�9��V�x�x��XG��y�_k��;���ͼl!MF��#�{'�}wm+is&U��09�l�r3����NZ����Ȃ�0��y��y����0�Q6��rW#��<N�i����>�"�Y?�0Ɂ����	�d����\��lDD����"����C��_7��k6�9���p/��v`�[�/O��n��7x-�zq��Ù����B�G����Z���ȵݔ�Rnr�QJ����_�W��4eM_7�f�5~�~��9h��-%(%3�	߰}�lv$���ە�_���[�QE��m���ZvMўȁ8'����|�l����E��c���R���K
�[z6r>��e5���c`|�a�ܑRT0��z��S�s^l��)��r�Sö��s�kg�P&C������� ��8��0�.�@tÐ5Gd��CR����ܥ�L��v�o7�~�    ?�E���^ӽ�lq���2<��TL�%���,���<{@[�ق�nۍ����;l5�#(7��ۘ�޿\?FbWŦmԹS��1��K�G=����ez�?k��M]�O�s�"51��H��'p1:|v#y�
������W���=�8�%]pj� *�rd�����Cn�����M����5���A����2��z�>���ՌE��r��ڥ'�C8�#�f�.��i�In��a`��,IN[K��,�Q��9z������&w��.va�H+��f{O��n7'�[��Cx���Ir��.��DGɽ��-ĩ`�"Ga<�z!*�RDv����h5�7�!z�Z�N �<P��Ѻ}� �醏cWc����`�;��&�ZW}|��k�H!��.�ҁ9��=�nRۄ������hk�?4�`Id��1�vS�?k�5~58�@�\v�l<�s������b�@�7��H�d�ݑF'���:Ʊ���3x�}�H��]8���ۄ����.@d�rڮXk>�g��g��u��{4���$�O��H���ߴ*�?5�_p9�NɜBċ�@|+�/�
Z.�anZ���e7��"�^�����y>g��Xr�$, xb����\����\����d���Q���sg9*q5:��Q����sф�=��f���eU�@�M�� �vRd/c�Sf�.gI��:���UW�8�Jx���9�PƗ&(�r*W�����z{�/CI���F�"�{�*�Ƌג
n5������Z�n���0��v3�v��՝���]c'e|�Ϋ���y7L.9�?$�|���r-��3��ٚ���]�ͪ�Rf������Y�YJ ��5�i����q��?�
r�W�����Z<�f�\��"��j~�1���'A�p5�.cӊ��cp��P�߅0���������׶�1����$��&rI��j��%
�/`���1���pVWO��N�x��1d�l6:�@un�"��QXɉ�z"�>o��2'%A�+h�ÿ�D(�/?��!y�	}�����7Mn������v�$=Q� �6���8�����P����I��.&���!.��f������'��?����G�G�H��j�[�¥�Xa]�(�{��/�t"��8~����k���?-2��m�Sg��ʫ�R�$X,mǷ/cQx\�)�Ic��1�E��'����ot��w���ZO���c�\�֏w�\��߳���A*~Ɠ h7���F/�v� i��d!a���ןs��j�om7[�Wđ�ڧ��\�@h�35g� '�����0�rf\S��f��w���(ٞI��MRf_2�i]��ݷ������"�H�d8ތ����|��,S�E���F>Iy}��S9}q�@��x�^��n+����2W���
�M� m8�~O������j	��ar�����_4�h�eZ.���-#0o���?L.��0��55�����Y�{$��lq�"�`��7><���ar��妌b��*)><n��X�ܢ�#dU�%ׇ��0�}��n���U���@��x�� ,3j���?9�M[���Y!�>��Z��,�w��G{>\c֗��E�]���V�ȕ�IIKZXu!����c��&Rr��7�`D����T`ω�I2�O���r��Ä�U����\ƻx
r��JE$�q��� �ǟ�1��!D�t��vt-b+n���������j>_�_��0�a���}x� xH3^�?�
��&�T��?%��c$����������8���z������e���V��1 gsݽ�����q��q<X�^�}|G�*qe��8���g�^ɪC$�#��O�ϐ�����#��q �o[mEa�����N������|Ձr֞��wqcV���A(%ۿ�َ�����;�<�\K��¹�� x�e�Y������Pq{���W6�j!��/�TI+L�V��)�r9C�a�>Ԓ�����_��Lo�5��9��Rw҄�xN=���'�C����3��M�pS�YK^���ݹ�"-ԁ�l��p�ߟG1��Q2^�֣�7݅-;�m���bSM����ɧ$�pS���c��)��h|���E����O�K5�7Ř��/#���B�ơ�j?I��]����������:K�Ǿ���� j���Q�~�0	�^e���95�a�$g�e97g�u���ϻM��1t3��JCd����j5gs%����s8��O0�|��U������m������Zz@����Ơݔ�x_�V���wz�K��pms��gs7ҧ������Qi��֛z���f�����ˋ�>�7L�&u)-��#X�]V`�[4c<�@�o�~�F�|������CSu�h������`w���C�$�!f���?�*Za��#�uk��8X�T3W�~�a����JEmm7���92gi�Z�i�{�/�w�@�����9x?����-WҠ;Ij����\�G�o�u�xq�5e��KDW$�6��� ��!�0J��lE��@ϦIr�V*����m-��n��m뛧q���9��5	�{������\^��0�>�Po�����R�̧�u�Sr��`�W�����E�pDk�"X���}"�dɮ /�z��c��Z�O�f7۝d���%QOn^m�۩ s�i�����aRn-eo.|nܩ�5{.?���לv�B���|��{����lZߵ�H���v#׾Y������a R%�+Q��@����d.��zl�*�&[���i(�0����"U��S�����KN�c����dK��>O���䅮Z`x��1����.�+�M��waO�ܦ�⅏��9�����o�>Vn@	��޴S{��ä�#6�(�U�����Uw _Jy��Z麀�y����u�?V��ō�əe�DyZ�T��N��p�bc��>�s^3n�uڮ�D��͹w�V�"TX)|L;*�_��w���Z��C�A䆋0BM��י2�#�b��H��O{˟K���vb����"�x�w;	:��7v��yP���P����WIA�M����L>1�9 �1��g�&:e�=���0����f�p=>D(-��תEl�E����!�ar�Eڢ7�g�֋���d[�ˌ�G1`��8�b� lx#��#�	�&�S�#��	���S���u�xο�T�Y>:�
�>�br�� ��E˽���~����'�o-�G4�6�J�܋�2x���693e@�ޱ����W���w���J� �(���9\��v��k����v���`d�3�=��T?��ݪo:����o�L�͐n$P6���0�!;�Us> lmb���oL�?�o�=�S����p�6�������vY~��D��|�rhTְ����%O�-�������7L&���MQ�2�Qy'�	��ONa�朁����:�;U]��a8�Q
ۍ�:����e���.���b����G���hξbϺ��7�h��'�F>̌t�H{J��c5��@�Zd��H��Su_�����S��C8w|H|�s�Ϋԍ{�d9�ܘ`��v��Y5��ֲ(ˬR���L!�_:����G��z3��K�->�%��tj1�S�
ǃ��~�����D4�R���i:�F��񊒮�L��}��<_vH��G�妇v̦�\��J�b�ڽ�6;Ƨ����/��X�f��G`&�yݞ�qcj*93J䕺^���e������:/�\!���3��uj��Fit��|��b�p�WwC֢ӾTI۝��)��l�::��SuaO��\��-Z��O���=���0�I/�%I�����/�SeC]�6���a䐑��Q���ɑ�m�����q7����H�Z�4LD둽��GP��2��!��]�U[)���I�C�*)�3#-�����y|������՘�g�S���ͭg����t�UG|�>mva�T
t�)q$C�D<���;�2�iE#�F��~��oU?
T������EP��i�;0oxޭ�o���    a �9���fN�S��!��ˈ`T��Y���[�a�c9���yz&��<!��v*�V��}YD�w�E�&��p�s�"e/��|�2r�D��z}�!���(�7dΛ����c���	cF�+m�	��h������|'�L7��j��I�9d�J�KA}���~�����6},��ϙ�'37n0q����_ô�1M�͞M� ��M�Q�i�w�=�����U�0�,S�����Ŝ�Ni-\.�
��#��͑oO9�s{|��S���K;�E�Zz�WDc{�]�Sk���1^�!�0T?M��ީj�y�|�(|�/kEr�tχk��[�]e ��\�o.qw�3�r�k��'��0�<�!s6k���"�pO��ا��2[��e]��I(�~�NbXs�k���H
���'���7�z\�k�H"��h{�-��r��[�?���b-�v_�-x����-}�*xч��Fi�E2��=�T�9/�ac���7F��ה���S�a�VF��PO��)��Q���|�$��e�!o�q�I< n�{⻘�/]'����
�f�H����l�#����䑳񙚼m����+x�m%�b���(<�ĩ�)��Ԑ���
�֒!��S�a���7e�~��l�)g�4��{|ǫ��9����d-nx3���'��c��R���=EZ0	��χk��&�_��9��F����I�o����L�̇aH? f7�5��c�Df/��Z�0L%�Ek��)��V�z~�|{3i;ȉ��Q��4��g�I��i��q����"3�3?"W�j�i��/��i�磒��ٍ\GdJkn��'wOȰX�,Qжۡ����݈��-R�1�~I"PB)yݽ*8�ވ$̗d��"U��ptLQP��u��n0˴�\�����wȗ��2�#��i�����'>��E5)��*��K��m�#�|�]"\{-�B[[�����u�)��+�i�H�rn�f4q��n�R-�K�M� �R�`��|�/��a�>�@W�WwߧG2���~��#�Ӛ9/��[�i�XC�)�Yn������"��{�p9��j��^u�0~*"����<}h��`M�汋�����������4�~P�nf6#$G.�hgG�0�Y�jEӊ���u�K���*�WZI>�N�HF�������]#S�S���e�`n�\ܘ�(K<�Hf;��8�5����z�/D�|�cD�8R�ȿ(�Y��Q�)[�4�@��>�i��|Su���r�3��&qc����u���a0����}v�$ �dH�b<,Ձv7���y��U�jX�.sp��+��)o�L���'\�T���@UF���� _3R��B�u�b{s8bkL\q����ۅl�<otL&���pγ�|p��'-��j����
E.7CCKr"1lrD3=ʡ�4�B�\����w0��1drE��V�7椃|7�e�ɰ}!L|�0��i���(�=lI3����m܎�I��CҜ5{�0�L�jbS �Q�v���&�fK~�����|��ar������,E�r6�"G�O	s1�����	��H�o�ۤ��j@~�G��Zzk^���>�뾗��]�u𛒃.<���Nvg{�'G �ެƑ���]�@A�Ȁl"���V��z.S`u�ѫ���j�(���LԽfPڙ�
W�eV�T��	�O��a(	��otL������|�
�׈��� ��:	�0}�n������U`DȦaZR�%%B{�������|,����\٩t�x'��*I<�w����?%H�߃�zW1|���Z�ŉY�.�ch�wy{}�7�����H��� ��眥��6���$�{�7L�k��1�;��XY��!��{(�k��՟�����y��E���]	zS��_V�g�)n�뭓0L����u� xn�-���'|�	�'+�ʘ���# �[��{��7	�!֢+�:b.ж�4\M���>�r�ՋB8;���ι�S]kD���3a.�ǥ��0��TJ�7��GvJXtš[��&���8F� S��1'AwO�=�T�|yng[���$��I�g�vÉ�=�^O�/Cʊ4�z����|�觿]v�&9u*�M-��8=�|���G���.�ūYmh��u-��R��n%�x�2��}�z���َU�0���Z�_W]�_,��ͼ�k;s+}z8�%����L'FD���h�/~0�퍒}�]�޾Av,^��\�����hc�s���[@o��&S���>Y7�2�y�{s܄�����5�p��ތ����s���d�:�2��<���_�@.��vc�)����q*-GN%��l��q�@a���4����Nei˺��� \�}����5�>��W�V�P�H�W��99 .L�6��1_ba�J7~k�)�w���>y*)5i,.�x|�T�Ə����&��Hd#������G����s���`�=�֦7.���g�fr��xI�a���A8�&���6�(ͺιLS��[��ǩd�Ln ���m6̯a��4����h��w�Z��e��m*U���Ǟ7%�r��&�N�c�Vrr�V6N�a��/�}��a�ވ�5ƾ�)�e���)>,�C��]N}���5�'� �ܘ5EL�S��c<7���؂�:����渿7�����v�u�V�s�a����[�iqx���`�n��!�!�e���yN�CZV��vö7=��<��Ԝ�㮱�v)|��YNƳ$��Y��n1Q)Y�nR��ʟ3"u\���>qYƬeѮĩ%v~�S"�䅹!��ȢUrFCO�B$�7���"6����G%��'�v�b^.�kJ}�E�)�������z�)��B�P|����9��VF�*P���^����Qz����0�"��n���{� �����S����t�f���IN�ɍ�Y�4y)�`��!�I��=B[E�qnïa�~Z��\�i�A���l�8z6���g��e�Dj7 o�[����I�kkEg���y��Q�r��nvD�ۙ��9ीKﺓ�r����3�_� ~�Xn�N�ad�qc�.�S�ﻕ�)y��x{��kJ~3�`�T�24��+��0�2b����sX#<�ݎ���r�r��Z��
:�G��}�dW	�f�T*K����Y	d�=9�
�+q����W{�"ɍ�e���]P����0̄�X&�����=^@Y��0d�+�?u$+EƤ8���g���C5���i��wqc��S�q�B|���9�k=���R�هj�I!e,��sN��ZS�QlH�{vo���{ru|�����)1W���3�z���6���ڷqޅa@>,H7ø���8��ǈ�����q|{�k�O�t���j��Vi'�w�Xl�*�EL
;��O)�a�}�]n�Sה�T��ø
�s��*;���O)�a<�w}�.��s2�ϝ����ҡN����7_��޽4�����{!΁͞:ZZܚ�w�x�oM�5�7�)9������F�tÞ�٥��'�������z����%;�x-Zk�3�V"�N>�֘����"�3	�F��ajgB�[��$��:�?��cfR�o6�����E����4�$69�-}��Ř$h�����S�k-�rmqZ���&�Ǡ�s�0��m�nrk���q�R-7�O�N:�rz���9_
'�>��z��e�o%R�r��a�LԲ�*m�0�^/߅a ��E��gS֤G
���xJui��m��z2�����Ռo�SJ�P�#nLnK�uD��O	[.��5j'E��ʩ���K��A₋��e�V����S�	9f��t�d�i0�����2�F�Z�[s��w{�)԰��ne;9m��<�(O��X�xJ���x;{fŗ���k���1�X����p�j@�J[�����j�( 7&g��{8���R8��X���&���DSj|�2��V�7j �ϯC&1|XݮT~&���:���b��li�L����I����:G�����}�Zzc�*N�<�v����IJ�薈ϐ�@U�t���X���R    ��0�Uo��uI��!5��T���M�Yε�0ՏTc��*���_��v��k|��n3nS$�?�0�12��Y]������<�^
���Ϟه��7���W�d���Xa�Y3% n%�N
N���G�y���9�+݌S5���nqO"3*��TOxe~\�1c��'�p��oG��YO����
�c6Li���s��/�F���P�+~WG��|J�K��k���qQ��a�~��ٵF��ȉ�E>�K���rXh��[�O"-�I�f*����e|�?s���+5l|����|��l�qU�7��$�];�RJ�Gv��w��"��G��u�WR�0ݻJ�n�d�DJ�d�	����<n�ﮒU��;���ޒ�+�7{��sø͍�/�'�w&����fܳ���Z�	���W��z_)i��'r�H�.�ї��0���5[I���d�]������0D��|UvX֛����l�4���d�z;Uѝ~�S��!3���/�U1\����F�"K(���T;�בo�z�O�����]�*�$w�1�^��-7�p<?퐆����7�1�Az��0�-�S
��[}~�:�γ}b`�m-�K����D�a���DH�&5^��Q�K߄��H�3�OI�� x'���#D)����<���qg�Ȯ��Lsbr�d1�E�Hj �xH^��Ѭym7>&�������9�8���x���?�)�]�pi&��֗�k�1���+\�\��y���O�Z�t[@6q�Z.�1jm����Aں��1���{#̧&{�N���$,�g��:u�>����
�{Sv�}�Ȃ�_]i��'���9���^�%`β1�Mv�^�y�l2��YY��"k���[??����a�v�ԡ��}Y��'��_:}��;�}?��či�EnHuvWL�ȿ�:�$+�L�2���������_d��ua���/�a��\0��9�[W���Rf+_��>��ć�\Gq����iG���_���d=�]��)5�M���a%)����xq{Ǆa��psc*�a��t�L�Cis�QX�|�J��npL�~��b��F'M�� ۨT����m�w���VV��I _��F�pM�%1��:��7�,e��J'p��F@��ĩ�@�����n������a�>��7 o�[�[�|K�-���J =@��� Ð��;ߌ�RV6�vY�v�ʼx_���]���=�c�[����z8��C��Xħq�,`�C��͟/m�oU?_���p��[� ݒ�aGr�5��C�=������^���,��@�c�$������\xǯ��pׅ�oHZ��)G8@�cY]"*e&�(�l�H�@巟��0@�|���^sF��rL(&��2��1m�w׷�T������.^�%~�q��^�y�}�Ș�7Ϸ';�A�(�\�������)Ws�{�x��yjE?�\���J֮!�Q)l�%߬lN)�A�������a�}���U��Q�!R��-I��9-���fIơ�э�Y���X��Ҏ7�j9�z�o�:�2����6]������I��н�٤�-���������P�U����PvŤ�ߧ��߂kǇ����q�j.�1 }����#%B7�M�� ,�pz��F>^k<���NC�FL����!���}mB̹����&t�X��©�dj]w+c7-�4�!<����0����ChxC�8�,��R� ��WΙu.:� o��x��X�5]��p�ѡV�(u`��]���n����_��0L8����@K�\o���;[-m˨^�Ӟ�J�r.�W O�	�0�h�k�G.��Z���~�_�k�h�R$�Z'�dܝ�1q o��/	Ht�FO�춙\M:�����<��|EP
?��f���q���]�|�P���͸F@��٘ȭKO���a������fk�i*�z�%�n<��-}�TI�W�mc���n������m�������_������&���0�L��Q��@G�G���R}����������������?h�������q9��F�B�Pk%��e�>g1e�0�ƽ��؟������U- 7�O^���̞��8{
�XѬ�p|>��8���G��M���9�H�Ԥ�
O��z(�%������v�>��o�DkH_�d��QBux�̫����O�&�o��E��	4�����xJ"��d��Kw�;��`�O�_���sXO`�͐<9I ��_U
[���	���a��T/����
zI��B��9�/�D�{F�x���4�p�]
*n�\��V�=��6ŭX}Zܙg"��,�x�L����,��0C��9��ј5U�.��Ѵ/I�g���j����e%,��,^��0��ҥ�=��5P��fg�:[K�Թ%B�D0���Ȟk�1�>�E�5J��U��c��#�[�y�8M-���=��z2�,톏Mƶ�:��)�;��;���b�c��	%K�Tћ-��4k�]�B�[��O�xM�W�U��{3a��Ukb7
���c��g����Q����y���k�
3^�<��dw_Et��lw��Cܧ`s���.d�b;)0�Qs�w�=t�#�|�}� �UoHB�P���`�R��I�lX�����=���@�X��ߴ~l�ȋ#I^Yz�=J�̅�=V�arަ|�e����ͬ��N�s�W�H{ܝ�5�c��i�� Ä�M���Z��� 	�+�����l4>��I�����Ք�����L�޺b˵Z��IE:������A2�a��u�\g�-��ƑZ��ɋ	�������P�/n�Hg������&�I��8#U���|�{��l��#��1W�(iLv}ׂ ��^���J�%勚?|[*���
đ$7^�@:�|������n��Tܪ��g8�]#j�ҰO<�#�|�K��J��Uu�T+��s��jr"B�P%���g_�P���(��s��s�5@��)}�Le�6�+��f�0���b7�c����#V��U���3���#�6`����I���]�ƳV+�r1�%�c��B6l���G��_�j�����e�Q�JIB���e��]u��[���g��(��Z�+�ʥ�,n�#�/����0�؛Ӆ���"\SX�sta`<%�P�bk#�e�<�Ȭ�j���d�[�<��-W�Gf�Zp���<��z�-C-|����D��{ �2G�) � ���
'�u@��c�>5�r�'���93R���%�~wH;�/��M^/9 d�.2�vE/��O��#�l�GyjYS�����wa����4�שlMǌ�N1��]���g�^rÐ~���8�Yuy[R�ʒ|5�*�M>�u�?�)�w��F�f{gV�E��������� v�:^/��� A�FK�q�&��l�λ��0t�i��>�y�I�B^�F,�jwZ�g�����*P|�>s�@���a������4�{]lx�xM��c����c#��u� >עo����Qķ�}+#a�q
�1=ϻ�A�$	����W <%M�J�}�=eY�o4{�` ����8_� ��a�ȒL;��ݓ!�x=�*af�c�M�
-�
`��Z�0z�:������j�7���%����/N�� 䫆�f񳡰c �6m?�R�/�y���Lk������T:�u�ī�H��x�Rvg�r-�b�k��&drP�Y���2S;�^_Y���sTO7��88M�黖\�W�����\�9��'���,	9��d�B�Ùd�ݨθ{����F�B��.A���+���p1�-:0EJ�0���~�]�_�f�bK�[ɱ��Җ���L��8��^���0Ņ�7]��Aj\8��V
Q�gQ����}X�0a��j�ܾ���ݔ�\:�YڂY�ľ���3S�weM"\J�	��6<O��@���8=�WЛ%�����a���OJu���6��#^RRVS�>7U�Na�]�J%#bҌ�Z%B�N_��>L��D�ћ)��luy��'!G2�R٪j���|�D���pSs�8Q�J�%�Qo#���OKݯ?%��gU��<R�qzk�ѐK'�rXS��������_��K��j{kM    ����R-`'A�{i���_�jb�r=_%���4˄�cM1��u�Ѵ�t����_F?�y��x�7��+{����{���-�\�}�4�4�"I��Ht�A+N59Oթ��ZO���7��aPr�Y�ټR��/��VL-ʨ�9~���߸fK�ތM�H�vD眥�>����gşi�ǥs�#X����`3\U�x��0č�e����P�z!�����Hk��t�{*�$߹y��^���`�hJ�������1�K�9*���ՆgBmS���0L��Ԯh8 �q�R5i �%��^�v糕_o�!�:�/3օ�8�����q&p+�X�X؞���|��n�?�:��3[�!).��.K���5�0L��V֛XݎƓ��0�5+C3t�YB�L��� Y!����.�I�w�TF�ZX�{r/��s�J��&��ȵ��G��W�Z��I�Gڍ�K7~5bu�ދ3��K����Q�w�ĩ7R��g��+�а^�����RSn9��wX����y����|��%��Ej=���ҿd�>��1ԍ�'<�|5k^���@X������J}D�5[��>_���  �+y�x0�GK�B9����'�H��G"��a��%���8�uz-�˄XsH���t`Ag�z���}������� l2�f��]�_�^3�Y5B���7N췚4f�7%]2�RnT@N�5˓��"箨
�y|g�A�����.Ud'�P�9���X��Lfx^=����%��j�r���۽�����҉�[3l���yc9�`�B����n�+�3�c�u����s��ݞ�JL�Їܯ����V�P���%ew����/�}ä4w�Vof̌�y� ��+p�(s.��g�<�*y�= �^�5�'VR�LV������Y1�|���Ӛi����L%���2�@/�t"e��Ku�q������g!����Ǭ�ɚ�K�%p��,��i{wH��59@��҂$�)��"�V��4��' p������]:��5��'ﮧ�������m�)\�������C�������0��²����nI���62?�̞G�a֏i����4�R�$��T~�Ɂq�Z�y�Y=�DR���������x1�0h��׈O=I���e�e�>�I_�(�U����&<��4Y.hE���,_�IcY����a����%�f񽳲��ԦK�p�]uEb�|)<��a������䍗s�ԜJ�QӪ�*ϑ`{=ϓ��a$�1�5�)>�I���xX�j����������[�e�цF7�	�6��,k�;���j�g':���7C�ɥ��:��D2�n%������wn��}�0�D�s�����ʱJGz鞉d�[<��u ���)֛Zx`��q5ʬ�v����Yeɨ}D��zK?�iZ��&��${��������|�dnزI^﷥a��fv%�ݝ	m�3zfm����9�T��@�0�k"7>f����K��������M�9W��'��DT���%u?2����qa�SNI�,쫝�3R����5RH��1�|�>^d������6-��Bg�7i$oƩ�`�`E�=i�-a�f^W�eϧ����H�/I�a?.�1�u͡�{�e҈̸=�<v������OW����ن�S�� ��&Q�:��ܚs&�#Q�B181	#�l�X�l-+bw���۾�~�K"�T�zM; 0Rnwϸ0;�2��Gq$�0����D���:�$J�Y)\L5���RW)\�tȭ�緊�0�@�tō�3��9�h�%��ep�mYn�?_��T"@"���so�)c.pL�CI��u <O\�I%@Л����)�6��X�m��,{|���7�G�U�$`����3�+G�{�{�S����E���}̡��)Etm�]���\�^:��g�64�pa2X�z�t��e̲1Y�Ƭe��U�!�^��
�pұ�
F�[u^�p#Xs�N�U	��]����$|3Swx^�+�5]/�������-��D_%��� EQ$�/�Ʌ>gד&�� O�]��;8HJ�@�t��nwǵWI�"E��	9"��eԄ듵��3�O�'KŲ��ؿ���P�)��1����J��*�և��ƜxB6�%y��j����z�GF�����"��`9���嵳!%]�����ԃ��Q����#��X���|.Ә��!r:#�q��`�R�@�|}[S㭍���Lx�>�c��t��k'4��ϩ��^+�K�c��r6�IH�z��XDgr\��$���tZ���״p"����������s��,�Ql���~���A�'ː�ۯK.aOS���<���dz��STJ�j9��F��iz����n��5�"�'%.q���HE�2��I-
��c�kVg59�c����R}w���$)eñ����Ж�$Y��a���5y����_%����!�bV~t*�W�ƙ���{����O����������?��5�P��LVd�� �dM�A���6�P����n�����տ��s���C�?�b��B>����5󨚠��
���y,�\��������o����h�%�������L;1�8gF�q����!6�x8Y-�ſ�9��hi��.����Ё�3O�Ԝ�H���,x�P�l�f<����=�=��C���Y��]�ژ;΃����E��]�g�"w�}���!6<�LݽvF)s�ǐ~�f7�y���L��X�������ϱ)C��}^9���R��Ua,܇�Mͦ'�'�h-��!�Z�!,%m�/��u�j�L��V��م�b1�:��X��ѫאa2m�˧�4�@�l����[s]���r���1(��F��-U�"sߞ�ԧ��ԃ�C6u
��N��ql�o* ��i�O���d�d��<-E����zn=4��C�����BO��4���&{�Kȓe/d�ߩdn|}�~�����b�^��xY��ڋ��':kmV��u{�D�h��#:��tr����A�U1I�ʍ/��z������I�eo�ݩn�αs�j��-F������^`8?�;��t݆yQ$�C����d�2ғߩ25��z`jT�"�Go��b]c��Klcq��^YRG��G�|K��y�^��]��#+��<F%��m�>V�ww��/��^d=Y��m��-����G�1Vq�jh|�C���`夵I{�V��^X#'m)7��2�w?��00v�|�q��-���CB��sv�y��z}/�!�$ �'m����c�U�����E%�ݤ�G�^`�*I��$]��h$������G���<=9��k%�Q�S�d��kFܞ��@,�������m�v��nLC��5�u>Y��2Kn\VlM��=�W��]O�>D�L�� ��TŶ��x������N/2j����b�^[��ɢ���G&��wQ���,-������:�����H4]�Δ������R-i�W�
�~`2=$$G�A-�p�M������oS|�m� ^>�Cox2�R7���:!^�ӻ؛®2z�{S_!����P���'�b�Q����Ai�u*E�^>�W��Z�� �Ԭ�p�Ts�`������������wBO�J'�����8�	�ω舧ڝ�M��vY�`�	���$-�&��(�����)+���d�| �&��:9 x�[[$�o`�$P�ؠ;Y���&��j�'%���y��j�(J}��@Ӫ�Z���J%V&�2�tc��c����(���A	RV�#��t�#���'�V�'uU[�%�=�$�Q�{\��@ٻ��r�^DV��c�:R�$�A*6"?;��pG��ooS��<�d'Y��l#���UZ�W�=�L�%L� \c$��&W)wbG�yL�U��l��ai�..߲� �ɹփ�pU��%a��1s�](���6����Z^WC���٬�%�f�1[4iLS��hR��!%t�<P؉�>2��-���ޘ���|����m��vR4B��Y3�=�R�*�KVj��F`n���Z <�͉�7��F�i�/u��k�9�~W��K6~�rX��xf�)I    W��+�,k?C迵���KJ�����ɲv5`���9�����H��X��U��������p�]�{�L��pq��gK��u;Oc��A��؜�i�JeO�#�S����'9�k���� �d2�]J�6������V�$���ʗKӽ�����Q;���*�k�$�UO�e'+^��A{���(�f�1=i��Xw�$SW�
m��3������2������������#�����sH���Q�5�Wঔƕ6�3��P���}1�~+�D2�1��3��D�%M2��Sr.��a}}m�?��~��
H=��c����q
���i�u���0~5�z� Z�,�K�ԜM��S��F�5'[u��J�:��ïB�Y�wIU2��s����xE�V���U��߄rK<�[�Nt�f�x�{'�Z?:E�n]�����Y�L"ex�1~�z�V��5������:~������<���������> 0��A��d�]g�c&4�L��t`B�Z��_<�a9%�Aƒ*�{��� ��b�8��.��xl�Q?Y��BfN��|qr�y�D����w��4<~��� �	_l�Ǌ��D~�_�78�>���S�7>:9��c�'ʙ���p^���D^}�Ā��J���?���� Oj'
�Vb�S���Œ��B}�ئ[���Xb��}t%�Eo�L�戦�r0dar�$Cy�Z�3�W ��eTac�+��
Nzi�j��g`�&��|�kGO��{Zųʜ&��g�?���O�_O�eE�8I�z�nSMb!��<���Q��qj�v�����o�휏�r�l��Pt�S`��p��e���0�� ���D^B���S�1l�a�7�Ղ<t?�����o ГW,/`��B�?���vB�|֚��Y���߾��� x=G���σfW��L/b~bax���L�Q1���6��o�=c9�m�y���^1h1"�S�+�� R�����o>�:&N�Bp&�����賅�
�?*K�N�=��=<t��m�#����0d���b���3b�p�%�CW2��X����!᫤�� �����Q�:#��f�����O��3�r�j�o��C@x2�X�cB�=����?��(���6/�q� ����בYN��w隠�WO!�ŞG���o�kwC�'��`�����YU�X �R(Ԗ�Ǿxr����"g�ΰ �T�1�C���z�)��1�|���'0c0L;N��� �ч�!�=��=q�H��o^� FB"����s-RI�cx4���IJ=ǒ��:���+?���.�k��j�����÷:vj=����:ܬk�	ymg���{��H��g�%:��$�=d����f�:DO�z6[�%t�<�;�Rs�ږ�2�W�����8�Se��+����\��5�
��1ʚw��ص	=DV� ���R��q�x��1$5Z��W�e��~���'.hq`� �Ȣ��lO��x
I7��1�� �����x��[lRǿDn{�Te���0�͎��c�R>&�����䅏g��h;%�Ve-�����	X�ȃ�'S��3�m��V- M����_,.-ۉ0�-Z�w�T8f'b�%5�]f:��m�O`J��(9y������!���aҽ�3ۜ�����[H��!�
ד��A�_�JœR���5ܡ<� ,��YL��o;�΅��T�
ݩC"��c�<�8��� #!	�O��hTfƞ�O�0�g����P�^{%��z�qr`��=(E�֩L�ɶ��Qg�7K���>�	�d��n��1
��ďͰ:Ն�|�$!<Ub��d5v	�
=��õ��0�W�K�9s���I����6'��� Oό�l��ު$�sT/� ��
(� 3��ߑ�'�T�B��D�j�B���!?1 �D��#�Z���TF��c��M�x�e�'0�6>�5�m��9�xu�Y�\�W�=��u�k�'0�B���Uv�4<ƌQi:?�w��(E/� �����p�y.�19;0�zҨ�u�����ŋ��cO5�Gnk�d��E��?H�JL�KChaCp=���z��L'~u3�~`%�^��ڳR�X����Q��-�>�A}�w�d�zv��kr�[1y%F<��Ӂ�X��*^+�QI`˃5tNf=j%��@v��B���J��b'��}{V�3�f!�N��Xz�L�w^Ad��Ӑ[�-z�s����W���f���g���=��LH�Z<W��#����1
���\��q���.����t�4�+wp3q�������4�[i;��Ea~�>���D����g��+:�^R�L�m���{
�щ/g<1 �����*�߾��	vmNrn����xV��ڼ�.�i��~f�􊠭L�������dxJ8���x�
�no��@^U&�8�oc���r��!|P\7�es�B���륾<��	�W��g%f/#59�l�S���^X{���hp��y�Z���{ᡲ#擙:��ٹ�$�Dqm�1#-��[�y�׷����2~]B< �d���;�R���D�3�ߘS�LҶf��q���J� $�#皶G�47tmK8*�^Ez��~���'�0�5��:��mI���F^�H��-M������7A�����fG�&ы]9�|�'!h�KW�����=:�VQNm�o���O��4�P���˼Y���A�H-�ּ�i���W�0l��ĉ	�X��z�u�0����{<=Q_��L�T��YFi�R#
�{�"p^w���cq����T����i����Z̜��� -���ˁA�*X!�H�I!M�P�+>���x�=��U��p�"=�Yb���.=�*��{��I�6���c�����\{��J(����[ݠ$��B������_`
?�?E>�wΜ-�؎� %�~b�Ӛ�c�Ln��9�;����R��a��2�3&���
\3���/0\��:ِk��>�S.E÷r$g�Rz�};�`�A68��W�[h'����*X�sC3O�w� ���C��,[�ӺY�X9�&y�c�r�k��-?q)�h�pr����e��2�0f��.j�5lՅ�b��O`�s�'��t��L�<�M&��׹]_���59Ɣ=�T��ha� ��]v�]Vt���Y)�?1�=V��n�R-��E+�L�됤�r�Y�^����=�ϔN��I�CQa�WJ!�3[��f����1��?�̜�ENc<�����K��%Q��E[ �S�����-���=Yj9i��v�����ĲoM��گW�1�4P�*��m��qI�@l�nO4�SN���*z�@º����T���C>x�蛼�.���a�쑓g��V'�����@N�p�P��g����2E����$ܾ&p<�"<�z|�8ӝW�&r�Uj�!X�ALk,���A�]��Wr�#��js��$���,Lck���o�j���pX�9','�:}�j�/�Z�m�S˴�v�+�`}�-� p�W�����H!��b�-oH�?��׏�|^b�9�bNj����Se��eV�m�<��Y/������"s���a�x�o1�\z��5�	����rwwq^`Jy��A�K����y�z����LZ�Z_7�o����`�	T��怙IZ���0��������oŀDԞ� '�b�����H*◪K��Z��&�]>#��|,U׊'��ݏL!��cz�U�GY�=h�ڧHq�q?0~�����(����i�
�X��ɿ�u����v���s�UK>7�өLΒ$���^�8#�K幉J� ���U_`,�'UWX�մ��r`J��ٓI������6��Ѱ�ӫ槌E����%A�ReB�r���ˑG��lS�#��FB��j�_��xo��Ƹ���7 d>�3ٹ���p����ٚrKЙ���^a�E�r����S�	k��wp^{3q <�r��LZF��W��������V�5I�Xs`���]�2�z{독 ��@P�4l����?u<@��G��|    ᶹn���i����'f?U��[K����`��LP-3��Ӿ.��B@���H��x=A�=��1ô`��8�6/m!�]�\�7 ��B�3V3�0����"J�mٓze���$<� :�1y"�Qx�
������0T��G�����Uǟo�@�#m��Z�=�'���g�l(�����m}z̙����\��8�����qS*�ޡ�����=z|}����u �ך1N���Ot�z�7����@��PHꬺϯ�~/��(v�N:�ZI����KAR��m��'�:�O��뉟x�K,�ȹC٢Z@��cj�ػ��e���C���D�"����ua���'��<@��/�敗EB�sR>Y���l	��Я�`Z��#�ӫ޾ZJ}�o/,U��l�K�Tv�
��c#x���Z��G��o�8�}=��<N����h���B���M���D�4���Y_/2����1bw��\��\t/����C4��%��`���f�}K��RN�'j�蛽ژ�$6�:��j�xg��~��OG	�]���,�>D�2�p�^���B65���'N/3�2�P����!P��N{���r�S�f�L�'x�P�U�b���C;�k䓃)��1Z�F��N����4{E�_���x dO�r�(�Rhr�cw�[۞�B����'��F�o�����,�4�;4�Uyk����!�"�������^�&���.�fgL�b%qP��+�h��P����H��*l��eOK,��F��6�?6x����%�I<ՉѬ�I��Q�����5�Kh��X��7`����:�Մ����Z�[y�yW�GʆU<+�E�| ��T2g�G>g^�ǋHc<��y=aѡ�mz���'0�J+�IVC�,wgqW�� ��F'�����ŋT��8�N��r����ѱ��x���V�j�7�}��4Ǝ��L}M��R��W�MUzn}�ۃ/�*%E�)��Tv(�⌦�_%�!��÷i����Onߡ�@Ыc��x2�u��/َ�GM={��{	��d�O���iS�0���Yn�m/}=����+��=Ң_2O@�_��߀�OLGmoRG@��a���z��N������h������#�ֽ&)�(l�Za���6��Y_��d������mN�#tR<��N+���y�Vg����7	�D�dKl���~n��y��
%qH�����)�70F�r��������b��|?疚��M�����j>���*B�#���;�d���Z�3�)��:.�����i8�B1���}��ǎFkq�F[��o��w4>����rR!
�SaJRbyE�ͭ^��־{�q�b�'0D���#S�ƴg|X��.�*�!����ʽ�(�/ �<13|2vW`�Z���JVr��)͑�t�/o[:.��@�>4/+�Q�G}�&w��gs,PF���,��x�ޜ��ӹ�#ڛcN�<1�ZKh-��������Ȳ`z�.;A��-q����ۨ��u����/0��N��Ɠ�L�&�81�^D�-m���;��T ���ڦ�#1���B1�<a9��f���/���#dG.�"ˣ˪ɲ� �dP��X�N'��{��𔗓]��)��F�V�Ѽ��lM���Zgtwm��䨔���A�YP���
Ba'�3Ĵuoɲ�\���S�	I�#�ƕA_y9�k�;u�9!�����+���p�ˉ����>-���Y'�[Қ��8ǩvw�ׁ!��QO.'C�vu��C"�����k'Rj�������m�(�O�DB��3�JV%x����H���6�j��s����h3M�6��I\��2I-[��Ò�z}� C��o9"x� 6SM�-���c�&�V�oj2����F�"^��:0bZ��S�R[�J͢F^w��M�J�Z�დ	��Q����&��'Ƴ82]4J�+t�J]vT��%v���_U�#-������/����ˉB��c�J���.�$��+��F������.��\Ov��0k�Ar��4���������y���4��=ZvP*��;�Di/� ���oR嵦�q}��P+*���A��+���`jօ"������_�*��T�zb>h챣�9bӶ�'�# �l���긾c?�1�r04�i��̍Գ����7P�շ�wo	| ��	:y�l�ʑ�"q�̖d�D�n��jx�>V��LS�X�!��<Ëmf�i��Ғ=n�:0;�G�Z��-�Q�p��j�6��\w��"�w�L>�Jk���%/LE$G;�T1�����u S�['9I�Y�6k6gM�B9K��i�~Xr�& �h.
ERҕhe�	��EҨ)g?(U���b�~���9!;���$O=)O�T`��Z	����
t������rrb �vȎ��,��Nisvl�Ln�t`������'�gP'u�[HR��l��'�: n�wL�Oɱps�K��Ë��<m��ɫ�-������m4ZN&Y3J�ۧ�U� �w���䬬N��罯�i.O�+���Պ#A�8U�u�b�@d��W�>���?Ã���֚�$��!��d�Wx�0��u�0��%�<j��F�'��������.�'o����\N$c��P&cZ����4��H8��a+e��&�
;��D�j�!c�H)��y�b1�X���Kp=�ɡ��c@�KU{���\f���h�ԝ��ќ�	����Q&��ay^�T.���İ��ɢ, <�=������0<ba�y��U���P&���G�37C*�_ߥ��T�B'�1ܫI�`�Wj1�XO���J��z~Gѥ�T��Ax*�\�|����ȣםɼ�^���'�S���Պ4���]�����Z�S�Va��;�ǘ�i�朼��=Ɖ���5Q�І�.W�v���'0�O(����m�sҐ��٘WѴK�.�C����~`�������T��sQk:�ѤC{rη8�&x�*2�*�O^۬�ݥ{��0�ӳ���N�ܡ+s�>�J<*b)K\j��?j�1���������� ��	Ń�$��
�����֒'�u���J�ٰ�∽x��@;��&%* �c`3Dw�����OB�	�v2fN_F�:`��������a#�U�ʿ 01�G����j"iv�����oo�m�`�7�B�"h���.e��3���k��������g5�K�r��eQ[�fт���^�S<=�)����������w�5�+�nf	9QՋz�X�������]��󱃉��Y��TW�Ӛs9�������Z��jV=y��R
1&��N,��z���,v=�ӗ���f[Q+#�������V��/�^?���d��Y$9q�	�4�IJ,�ֱC4���W.�7����;CV��R�m7/�Jm��d[��dX|;����T��!���-�!�*�b�bj���2=��OL�V�o��U"1ˍ[�]�q%[��g���T	����	�!!>Q쪭O�e����9	f��_�ڤ��+��vo8�f��Y�4�7�eZّ�g��j걖nl�ud���OJ�>��$)�0;չ�(�B��9ٚ���)9�z�폳���H�'��E�)���"��d�J�i�^k�_ ���)f'z��y4�s'�j��[�~��	k���߂ +���a�B�3!V��}�d����!�PA��Z�/0��z��F0W�9�a���J���<�ȗ��;0�*NdNJH�c�����Ժ���f[%��}p��#P�d�[�C����MC�^��0����-9aw�����^���ñC��zR�6Ǹ����	O�T3��F�/��k��!*�D����}{W�0�u��Ѧ{x�TR�ح�U�p@6`�>���H� '+�0���1��fMmQ7O�Ůo�:0�O<�����b����7	�2�˘@���7��I��|�5�(��_���$j1�![�����,�o�q`H�l��Dٸ��B^�9f>���9)a�JP*喯���+��'��S{+2 �(�waU�{(Ɠm��$�~'1vؤ
!7���\����t�_)�U0���7��Һ�ɓR��    }[,{}�w�T�j�[�����a{(��O�q?d�twd���1/�yW�s�^ARym�*�BIQ��R��&�WY��o�l�ǘBfL娯	����L��GЙk�umZ+��cL�I*d�2W	:"��c��]�^*Y+=m��$֯�u`�>�	�Q��Nbd��
�1��bp���mQa��y���X�|�|{wK¡�ƘҜ�z>�ۿi���u`�c�sC?�sM����ێ����w���N�X:��N�T-�^:�0biy%+MR�
re4��$�����*$�l�0If���l�1c��q�I����cҁQ�d�d��#��w<���´!�c
�}���K,��$|Cعz��ȅ�y�0�B�f���j��`�|d���G�64R��1Z����k﷿�809? �̄�&^1����[��ε�W0��1��I�xZ:	�}���G���Ǆx�\���� 0��Z����BJ=����Հ�2B�����<�\��T���|��"<Cpi�w�<Q{���y�K(]p�G�����TˉF�WA6�	(�Doʲ��@���*��-���c���vXS��2�U�@S��F�=��������3�m��?h'!t���V��0y�)
�n�����Y���d�[�Ϳ8�X�%��:�"����
��G`�&������)�]���*��_*��?C���_���x�0R�B|�p�$��/��h��j	4e�E�����C�� G���?��Z���%�N�J��\�����=��>���A)�Cccx�G�N
�d���d���|��� r��3�E�����/F��yR�Vz�*y�_>��k��?<��G��N�gB��>MO�?�^������O���߁z����&'���+g�i��ܣ����:�j'ڿx��D9�s��z#��2Ӫ�\dV-�I��� F_�M�pB�{�W�X�$O����e�e�~u���V�d�FbEd$s��zlߊ�i�+����/���ZN
��^����@ē�.�S����n�� �Bc��~ LhV�����]?�ڼHzN����i�dxDˑ�򺳏��j�R�P��d����Ww�>��6R9in��Z%�d�C�qy^VI��l���z���:_�U���K�0kM-�� F��/R�\mQ֫ߢ�\b� Y��\�-������A-��쮐�~�� ��Q��g݊^�������R"}a�<6쫧�>�)�`q�~��M�l?)��ྲྀ�V��dk��ի��>��w+#�=m�F5�QBTe����&Bi��)\����(�Vp�q�6���s�5��
AIm���,mM������R9Y`�5Z�j�����A��+U��V5��ב?���1ƣ� ���+�cB<S�w��č��tM�!/N���ař�W������!�{E�z;�s`�>X�$�VD��a�̷{����ڞ���^];0� ��t������-ɬ����~~��~�X��� ��4�5d�ǔ��nVyz����.��������`�)Wp�KZ�՘�^� b��#L	�et2��:�½�n�'+y�E:����`P�r$��Z��cE�l˩�=^;�jѽ��d��~���WG�O��+[���43�n�z��]ӂj�z/���O$��tY���PR�?QGn�x�R��]��&{���D)�
"���(�t�÷x�-����>���v� ��z�ek��HR��P�δ��w��y"�=�0��bx��&}�6+%���?=��������Bƫ��'V9�?>��cp>�R��mlh���&���IYh��(��je�hɆ�4#rs��/pb�zY�	m٫����^o��X�
𥉉/���������c�daZ\�90������c�v{���橬t��r_;4�cj�A��3�� p�l� 0\��'��=�+��󌹧�Zr���r��~;�+v\���dύV����4ˎ�g�1!n�.�/��� �ӵT*',����v~�̄[q�U����cF�K=y�v2�FߖT�ER�YB�v.󲳯�n�r\HT;:0��ǘ��?�kH��襤�5Ði����`��M���k*�,���m��ڥ�=�����F۟�֓�?]RV�����b�R�k�aG�[���I &�uJ�-�v[{�$�@�y�Լ�N���N�NL���L�����Q��s/ѣ����xbUY;.��Sc�Z@�>@֚N`<�z*��<�a=M6O�V�_-c�H���y䶚=��eI0�:b���I�r�G_׷�$V�ډ��ј��hڕK|19&��Zd��_$	����]`y	�� ��;,z���\�XG�jaԁ`���1�3@���8GWJ����%�y���}��1�70�#c���G�5B��h��d�A�9@�M�9W���DVS�Zk�+�	�GjZڣwXK=��^:0�#���O\���,ڞr��Ea�P���=����nY�`��P6:�=��c��c��s�������\n�g��x��#_�Uzp�I�s�B��j
�Z��B{���qVQNL�p�C�=��Xт�75�����v����P��#S��=oRD\`�ږGlE���u��S ����,��5!���ŕ�޶���z��u�����^Q�ߺ\z�s%��h��Xу���~}��;й���u�'7G�x���)K�x��n��[�~��MY�_aP<�w�ՠ�5T U>$�4LS����R���w �޾I~���!~�%:�C���w	7�ƻJ�� ������"���&���<p겞4���g��E���۫�'�
'��b�ZE�٫�Th{����[A{f�S~���������D�/�ˌ�|��/x��<�i��$} �ws,O��pp1��Ö�ާ��b,6��R�uI�aN�/:���d|ZM�3+�s^���4+�:��{��o��	�e���$�w�P���v�^���)���M+�Wf����0P����G���a�ں'��Rtj1�]�_K}P2����y�8gL���I{��u�~S��+D�d���:J����?����ӫ��:A�m�C����Rl&4��\M �Z�=�N̈�9M��5:���!��� MF�����2��@Iy"��!�o$\s}DN��d�/��<,4bH��NT���^�߮�7���W�a;����>�<R.M��xX�c��1�p�G�d�����q���,��6�x�_N���y���ﾟ�IL�QE���p�_�^U���)�8�q��]����RN�=A�%�aH���f�!�Q��M���R?�)٫-'�ϭ�6�+,^�4�������ˀ�'
F5�������;��[iG�£\�_�	��s�tо)
�kM<�+{Y���������L��A�GS�BY�4�r���Z��2YCq�ţ��� =�l��B^�����(�yYG�0�q�1�����Fj8�A�������Ғ�x攳���p���`��V=Q���tu%֥1��>�bjMQ��n6�����ז~�s�;�[�K��5rr��J�m-����.O����^���29��st�ò�k��u1��7��} �1d.zb;<[�SI�b����3�/��5[��nB���'c�y���0����^�΁�,�&��Ә��;/rׄ5r4��ML�Xk����~F/��d��β�@�����^0�-�D�`���C!��v�|�X����W�kN�Nu��G�N��k�=u�� �b�^a��9$_$I��m�x����DEOLd���5���tMSR�=��M�n�H���K?@=�V=��6[`�ZI�K���Ji|��0�3���fC�c�B	cPbTJ+�hP7/}C�1@>�Z2R��I�-�Fzn���!�%�V-�0�@�����yij�cg���k�J"s�xP��BOF�#�aZ�
����zV�@�����ܬ��	��H��,��C�>Ɍ�    U N=4��ao��u^`������A�Ɗ�1��֌�Z%EG'5��*���FP^yj�ԓ�ͱ��u@�!��F�niV�Z��ˁa{U���IR���H5Ej�S(y��c���&����>��JG�Oܝ�n����;�9���h�~\Z�ۉ�C�8-)'��֧�\fb?k)��R��'�*�iL�N����`�*�<`�@���J�I�W�R)_�����dr2��,[����%d*Fj!/���e��x���qa~�+등r��jfJ��?�����!�f�&yX���hh�2�d��2.�i�\blp%��-q^�������۝�Mu���C44F@�3v�ƍkn�)6��R} #Oɥԃ�<�혈�脏=S�3'�4�<i��'&df�EO����r�)	��%m�Ҟ2�6s�{��&GAP��R�Z��I^B�w�=K��q�_�'0�-�Ե��GH���e��=V������~^��I�xϧn�vW�RM�kb��"�p�ק�ب�uj>z���:(�5��w�{g�{�`i����G+YX��ֵw���`�1��n�82W��cL~�Z��ۼ�$Y�Ԉ�cb����B�-�'��v���L�G���т%�bTb)��1���i��Tt�l/�0��x�b�7e����t=Bxj::طJ��^ަz�!�J(z2�็�8'1���k�����ߝ��U*��#s2.u�51͡a�1kҐ�h��U!��	U��'�ą������ˏiͰ���{��ޗ��T��Iv�{�D`�;��Ү�S)����3w4/�jw7|_\J}�t�
�W�����3Y���ޠ�������������<���$�J-�U�/Wy��y�l����� !�`T�_�����}V=Ġ߬�q��v�~�£��d�j� ��Y���"���Ra빂�����*9�{�X�3��-޵%����<��݋'��j'��2r�1��1���L���uQٵph*��?ŉ��κG��M-�*T���R�5*Lj��}�?���<�ml�AM�b�O���6OR����w�_ *�(��X�͵̉G�ԉ��S+Sr������5�M��:����v�+��T�x��E���Ѥ���V%���1Hpbt�-1�)�=)�
�D �V�R��fa�O`�>P�N�EWk��ScM4{m����\���������|���Z=�W�o�c:���Յ�_ '�\Q�ƴ\�F�ѿCO�V� ��d��d�\������u�:�[E��Y�ZbZ���BP��l��2������y���Aխn=��=ѕ4t]�PT�קk���Y�H=Y�&�Ɲ��<�1SB�ٙ�9݃xo����-/�O����5zߴ�+���)�x{f����u����� ]{)�D����?����zK��&��Z��O��S��Nza��x
!&A���k�Za��\������vbe�k�P�P��c�ǘ��M/�Ŝ����Wc:����JK:�f�F����yY���p��2�r`"��Sߓ^��5�K �ݷ_��kI����X����;��s&9�#�F~N�}�w
�n���x������Ʌ�]��Ƣjd��X�d]vDͦ�c�ާ
`��V�dfsr-�|'Fd���ɒ��� �Un'x�N�x�=)	���&W�B�<�l����mH��ĘR�b'Yi���v��:��qbJ�Mj\�I����öۉ��J���<wr���cZ�v�T\}�ew/�:0����Z�^d�1ҞѨ�ZC��M�y୅.�Uz�)N�P��	E@���N�b(�y�}?0��RN��w�� ��}w�z���Bq|���Sc
������V�aԓ�̨�F���5sXB�v}V���cj�d`�����e^+���D�7}�u̱�n/"��Bt����&�Um+�/��Ց��=&O'E�n��,P<�d��[��5�PH�[��2t��uΛ�?�)�@8֝ ���JX�ӵ�^���@m7����wV�7/������	.յ�����՝ƅ
��q�*~՜�� P����C�8K˱�^�@���*�~�y{�;�z��7{0�;�Ǟ��\V�97�}��U�,Qn� 072H=���s�1��v�m?1N�R�槅�o�&T�Z�Nج�y���MC�"{h��U�7i8oo>���,;��ب��C��ո�Ix�m�۷&{2mfu*��Hs�ǙhYv�36����t.���ԧ@H�h�;��i����I��S[c4��P���@a�'�������Cl�r0#J�a	E��A������*҉ɀ��p�N��{b09���W�^���7��R�Hz���8��6��f+�?����o�x ��{ʹ��|T������΅�3ݳ�]��,Ɓɯ� #N���c��$AX�͕hT�H]Z���:0�Q&'����)����,�U΅�޻m�w=�`¯���z��1d�;��]�ԽpL}�ݡ���~��`����|B|wZ0v�2ły���N�F�}ܞ���L/�v"�S�)ңJj�46���&ll赵�]���!{�����T�%ь�]�Q����X<-I��������m�^D�����/������
sJ�����5����VW6���>����r�qx,&��<Fb=Z�%K KR?�lt�7���-�Γ��19*9r��5v��]�.(�J�%�T��0ֹ���Cx�C1wP+I�1.�z|	Mђ,֐b�Ƌn݃~`�>�S�I��I@��`[X,%5A����7�
��B8X�T׵A�P"�<�_%��~g_��ђ��wJ��E$<81"cVҙH�Ր��#I�$͋����:�Z���HS��Uwj��cx��X�rO��^�_Y/�2�}j���J�~L߱wS��K��}�^`�=` '�7�z�ci��-8<ƄΪ�VBjo����P5<�I}+����SQ���JMc�Se!|r?.N|+�z"�4�K���אU���!�ӷ�C�u��[vd�wV���cǾSjF�,��v�+�-S���Gf6%u�P�����=���m�-�J�V	*A��Fb5�	�,�?
��Ē�\�uU�����L�y���H�6��k��F���1ɿ���rlE >��*��щ|�	8���b}_��T�v�τc�LD"��������+ ͹BYr���b!�R,g=��M�O1HXb���[6�e����v����"�Q=81�z�#�\��h������2�n�"80D��91����=(ʹg	ga�{e��o���"�Wu�>T��Y8ojI��St�O�}���C����y%�
TƓ�0��f���l%ܖ���S`2�qw�����~ܬ���zHx;[���q�6;��8r�x�")�b��N�m�m؆�~��)�^X�VY�'���%��G'��x��ڶ����ą�g�_���f��F=�I�ic*'�YW�#��6�-?g�R��s�O0 �pu���SP�Q�Ֆoy�&}D�ɍ�#)��m������i�V%�yuu>ݏ��_kwr�K�I8781ld �0�����۪���*U.�JC*�3��֊� ��=>��Rp`��w#�1�4qcV��v�U�x��\��,��t9j�����+�D7�� �uU�;�����1����]���c��nC�i�^Wd)��S]�tW�V�ŧ������x�\�gʽ%�\ݵ�\��d����V�Ow�Fڏ[�iSQ�;}$�ݒ�N���(W�mͩo�`".�3�+K>�\�r<���/�亃G.�����$�ɻ���a�՘�D.�}�hS5pk��Y�7��/�T���ZϨִ,�I8F��X��R��T)ca��7���}6��He��֊���L�y�m���X�*��rqbd�v'����iTΩn��-;O�t�	La��o��ޥ�\g�0�,9�<���k�<�V1��|S@���3_�I>���=uޜ��=7=����Kw�v3�<���$��!��K)t��#?�>�'0�?��nr̒Ѧ���f.��ر�    A�k���781 �n"-�-��P����g��qP�N=��d��1�ZK��MU�=SZ��M�-r	� �N|6��끩ߎU���Ry�'U�����`v��i��s�źg��r��{�*��3�pB�zL�$���:ק����H ��f:Fڬ��P�jlL��Drs)Ԕ����c��UP�����-dBC��b:fG���7��i��_��ǣ���A�����E���pw�%k���u�U��RO��b��n����@���S�����5�#Z�j=��&K��OE,Q���fy!? c�T��#�d@�2�w��y!�ZA|/^�2Q�ca�Įxނ��O�H�띄���?�Fs��U{؛��X���b���rԗ�Q>��B}IֶTm�ƌ)F�Ny�0����������p`n�\��d� �*���~22N�7��^o|=.5��Z��E`XuڎSQ�>��fKH�<���uZ��m��7/>:r��ŚN��4��s��mq�'0B?f�!L�)�p8��X�#T�4>i�~�Z[�ҋq���k9S������Tt�z͞v4�r�1��E�LYw�r5	d��]KK��P/'\��.�
P������h81��*��d@,!>�f�
 _3P������.9�y�wU��s������F�U��2�x�\�������CB��N/���#�p	��O�2M4I����`1�,v�](��IQ�G��H����4sW\����<��&���n���2q��ߨwL4�p;�u�i��y�/^s�ѱ�����{�ǅJ�{�־D�~����b���z��%�AZe!���$�"-�}�*����VK�x!��!���!:E\I86@KsӢ��#�~_+��lM,�i����u��m�zW�΅��z�F`(����J9��W����zߞrk1�!��~`�|q�������:�∔O�#>(z�~ly�s%&,��ov;����7���~�d�{��ˢ�uo�&�R���, �9k�ob3ʵ���N;¥�ȯ��?����9L�V�[��S��P�5 �>�����!�iV�����:i�c�^8 L+GR־��r�|�*qPR@ߛ��7)�4G����5�ę�<�����W$�-ܨ��Y�S�2c�<�q�%��X�ZT_��o@�r)7V���1�'T]�#@y���?��_%	)+v3;&��5�&���-���yg�ɻ����;�����2���(�f	�W�Ot�	��bY����b�i7^r~��A%���%�b�8?@zK����z�Rr0��W�y<�*��.�_et|i��3�b!�![��qo��"��X��I�z�4�����	ٶ��v�L������'%�n�ΑG�)4���Y���N����S������M��w�v�i"� �&���\��۠>�~`�~���v�z4�V:��а(�N��|S{_�����F�7N��
��i�X�G��:𑚽�����TaLRc���PH� �����'.�~��܆v�+��cCaLb?W�� �2]�O�Wx����V��H�`���x(�Վc���b:���6��k}��.��(���D�tQ�GQM(Js�N��$��ڧ:��{�#&B�������f��]�A�$&|���i��?�)����f8&���N��	}�lɫ����}�T{��Y���H17^�B�5��M��U����8� �}~2�aF�V��R��1���|�LdG>M}�nH�|އ1R\Br�_��<%ٱ~�5���i��BU:u�-����`QZ����2�Q�k�Xxm9�R�F�oz~$��cr<]0+�1�4�?ڐ|3'���b��i1�h7�͖+���[��J��V�J(����|������|��Gk�(CL&r4���!S��y���o+��	��(r�cr�PJ
n�sIM�JsY�nN���OR�	��F�y�Z��|�*U��6b�6
�������b��uq�����[�^!ՠ��k)i�>�J+�m��?����W?�d;�9���%?�Ɲ�bO��J������M�e�� �p�����֞g���:�?Cj�Ӧjz�{����mm�2�'�^��y����u�����q�r��a�|�H�ch��z�}�i�������:e�y�-a�8-k�W�N`O8C2G~~R���ڍεFX�1NL��`N�8@�X���4^�1�5��JH(��=	�]�z��;c�'~�O����s����$[m��1zW
ȵ����y�"k��o�:��U���$-��EQ�z7X6��=;�����׶�G�n+b5U��*��;p�������W�2�����L�f �`����]Gmʓ���1�3uo�n��֨k��I)�p��p��<ݣ���~���1`��x��y�=8:���	�ɀ���X����FA���M���摐g��_�[�M2N��I=ϔj(����z9:�T=ԹP�R�:ⵁ�O����/��+F�f$w��*9Ѿc�IW�QNn��G15F|ɽ��bqg�SP�e�[�~�-��c#w��<��@1 hv3M% ��ݒŀLx� Ŵ��tU���� F��ݙK����t#0%��b�7����>c,D�*����wȼ��4�����ƈ�o�L"��������ũ��Ϻ#� ʥqL#�Xjy���6OݳVz���u�Y�Y��¸4��U(^!'?�ҋ,����|��u���`�5l�pV�!�h߭p�h�&���yj�b"�v|���* ��?�C�=R(�S}<�{?}�ve�Y:��i�zH<φ2 qT����o�?�2sm�e�Ѹ�lL����"z	�Ϳ����5�e�@*�Fk�CC#��[Bu��4�����r8��Ȉ�E�ޫ�X�����b�X�e�13��9���YӛN8��2�g�[ �*`L�w�$f���������]���0:ǍI������i�U|�=M����浴G�iksA�iu�.AȲ��4�8�I��_,�,��]���f_��S}'|�f�k��[�_`��H�n�0K�����>u����ȹ��>��y���F�g@�q�3p(�Jk�_K#���\e��k��՟���M�����ģ�� EF8cr9>�o76�Utui7��`�wH���J��'˸��tm���~q!����Ͻ�ٶt��0�F��)�L���f��B?�
Y�\��J/��2R�'�%�Y硿��	x����Qi�Iɡ��|��`�IzϵWY���7#�w�!�vӍٻ�̖h䉯� I�W"_��$��ۃ�?d�+c��;�p"�I�v�Z�jU��2��;���sƉ��J>;0\Ou���MS�@��w��U�ۓ_`�{�!e\�iG�|O"�1e��鴓44�#�G��"?'Pȋ�Caq��
x{��jf(��j��~\�{�j�1��ӷ�4��TF�^P�a��fu>�[���Y���nޭ{>��eI��]m	��a����
����T��L:�U��<���Ǽf�����յ������n�;�h���m3��_Һ�)>D����J|�s�`iPLS�k��n�4ܬ����ٟ�w� +g�7M������,'�1f��L;s6䏯W|�)��ޛg�:�6���}B�kUN^�R�$�آo/C�	��<��j�P��Ia�=b�8k��0E�>�n��E)dc�<����IL�`��F�^��zv��~�Wc�d�n�XۚsV�6[O����P�ډ	W)��!��n�j}��N������N-�qu��fWU���������ŉiDE��H<R�<�w����e���V���ͣuH��P�J8$�/��s�ɾ�>�aj%R�ۭ�>۔9scG�H��c��4��������i囥���+1ҕ��u?5�DZ7����	d��?�F7�yמ{�ap����M�x��m�f}�2�� � �|S�w���&�Od�*-;�W:<���B� �o&���^4zT�N��I�Q_ʜ?�,�@ ��j��~
�M��B2�!�����oR�Gk�y���Ǡf����qb��A��H�����f'��f�B�/�eN <IS�@Q�+�3��    ��2���r�{�8�+��yơ��o�l�1�$[z�ȿ|^�w���W���v�s�4V�Zg�_0���e3��unސ����T�a�81���?�.
�$�΋��~�C~��?+\�f?�vF��+�N@S��Uω1*�߿��)5֔�������}�0�� 3}YN���Y������ ǈ���<��� ��V��1���Y[�|��̏��݈��F���^�s`���c�����|���o<V���E}-�jۈUH$����oS��s�@URP��3��M�O�8o
����j}��;�CR�9Y��R(�\$,9�.��΃�y~�,SP�EoTcf[�Ci�\)�]ׂ�sa�Q���g�Q�ǵ6��l�8cp�^��Ë��!6�]s�����s�P�U��ld��W	5cT%}@�	��[��}���z(8Εl̮s���^��j��;�)������P�^ �%Nu��C�������'�ә��#�o� ��/r�t�R�5��J��;J3���!��op`�ߺ�߼*����#ی7F�dC34�3��|}y6�?C��0�Q� �(�tHjg�$�Ωs���H8I숪�+�	i�b��r�4(%��Rjϖ��i?k^n����@q�kI�"O��ni�w�|��f�7���@�m���gr^�<y������>0�7�c�~�;�ش.h7B3����r=���!0cC�7ʣ��a�J��20o/���gU+��ay*�|���k��ҸQ��;щ9 �U���V�����f�J��ݫ�W}�>.�ZL���^(�S�O�� fcn`�j�x���}ǨCh�����y>�j8*���"���ON<W,��|����J�{y\��K���z���JC���0��O<�s�+ښ�|��P2�b|�dVH{��j�'�$6��c\�_lC`�L�{/�Nƒ�5O� &�KNKu��s���^���XEf ����yk��A$zI�9u�M��J�ҽ^/I��m|34T���d�'� ��(M���n���3C`��Z)�od$��7&��I1���عJ+���q��/0�H17�ZD(ZSkp�M�(�9�Dm�����믳,�l-��3�`82l��:S��ȿ�M�C��b-1�H�~�J5l��[��O|���&��a)���!0�?�=�Y;ẻ�/�3�i�O�ƌ"�.ϣ	.���K}�X��5%�%�T���|V�y?�x%�2	i��2�쓈�-GOs�^�$K�T����XcR�e���F��P�P⌞���#�whʃU�>_��/�?o�n��V^*)7+! �n����ʶ���o��?�����Ͽ�������!���C9�0
DH� ������������?��������������)T��ƚt�Q��68����T�*����׎��;����5�~Qg�Zm���y�p�^���M��^o�}�%\�F�k����=���Xk�*�m+�٧=_iZ(�V%��0j�vY� ��K�NJx��<�i=/چ�G�����ԍ��5��m�SwZ�T��=��?D`
J��D�s&��I��!�|����,յzݯ��U�;�r�7W���6z�a��!�~8Ѥz u���OL�Wr+7U	���[�S@���H��� ?Bm�>̬C���� �g$?Q�W���h���S��\L�_n�N�P',p����
�R�=�x��Cm���Qah����
���;�]�*�|b	�,{w=��}8�\�{���G�����Ύ��ázp�p7����9�.{u�h�0 %����	�:�z��E��v3�b7,l�{�3��|%��S�i�� 0E��J*��: �F;1�Ps껯�_5�m�ׇ���� �_P�����>����'w��e�שl��W��A�B��*�L��nC�EU�P�A	V�Zg�⯳�p4ԟ�|�I�V�u�
">l�
�Iٴf]\������m��W�N�s�xc-��s)3���|��i�Zb��QUlu��x4�i�s���j����ڣ���ȍ�w�ʛ��QZMEG _��@��?_�<t����"i�҅�d���q`�NO��Uz������)�ߙ�o�[�6.&���1m�.�G}�����ç#RL�7Ti�\ڦ���P�=:�=�z�h?�B���OJ�W�J������~,TBf!��6U�#!����(�!����4Ӊ�P���Rh�V��M���h�a�101�>����l��ؠ�e���f~{��a`�����$Q�:[���ĬO�Ml�_�~`B�������{�$z|�Q�ƌ?��&��|U��OU�])���:b2G	���ǩ(״���O������i���H��r�#�^GBI3@��Sh����{��|&G��&uԢ=,>%��q�R�6��r@�����_\�~|Wo����$����6@!s�I�"���~�)��.ɍA�aj5-���n�8-���q���q�/0�q���n�׮2jM������!W�E#7���Z�x\%%�7^�K����dhx�+6Jc��:k���_`��ҕ8$�%���t��J�Rk���-�}>�j0��@17�|�v���f5|UUT%�=5��H'����T���Po�5bR�j8��!�b83�v���|��R�kv#��C�iN����x�X �ȸ��|Q�ع7
<r1��S��g�F�*H�ByB�@�k��G�����(*_t|�R�d`���R϶��Z�X��Ͻ���VoT�dNB�%#໵�^b ύ�^�����BЮx.�Z{��'��ɱD�����(O��s�����x�M��^�����Jk�����N	��V9~_�1��"�!�^̀lw[s�c�p�ZgM�)��-o�|����f�f�o�#�N$�V�Ԓ\��������O���~�Aq.��	C.+!����C����r��z>0�N�ݴcz�͌��=�!�>��3�Z>g�{Է_���(�P��gu?%ăB>44rl�W�>�؞��H߯w|��̏$[��:�1Vۀ���{�X-/�Jgg����r����TћVx�F0�W¤�p��?Q��Ud����8�ɨ�P�11���'N44���H�$T$�}�����1��r�ohqZ�m��Xo�Jɧ�*�����l�N	H����T���*A���X��=�onF��!�?��F*��؍׮�l���g;�aQS#ܧ#���:�qw�/01^�D�qZp�Qv���_ �j�����xT�+I�r��裆�%p�W:��.E�'7�;?�c�_"?g���Q�$j;-��J�-ih�I��>v.ϳ�bTv��X=5����*n}�4�u��7@�5^O�i�f�7�I��,�C���A3OV�f*��ǵ�����d�y����|P�L�s�\)V�>�����~��0�\.N�X�K��|:��4����֭�Z�?���1hF�dqя�Zg��O�Bz���$B�]w��6=d������8�g#�k% ��|hz�Q�1�[�Q�a��N�%��T*^,�C�A�F_��z���W�M��n��7�g�)��!�0��\��P��䷥@��c�\��U��N<��v]r� ���g����G`�!�r#�y�H�fF`F���H;������'"я���j[�{�D+I�0J
��m+�Y@��F`p�
#7�l���������@����Dy�b���U���W#x-Kλ��gp�g��B�L���u����_`�~������i�*U�ŉ�!b|G	��:W��ͅ7֛i�չU�qDP��i��1�@m϶���sL��>kɗڐ�i�J�(H��Df�v�����'ˏU�fԌ,��ɷ�G���s����=^������� ��~jm�AE�(���T⭯�H&���=n&�[{ҹG����:�1~�-��	�_<�������� ��Zq�H��E�̘x�l�q�j�b���f���~�H1��	���X�=�휱��A`J����czH��d`�!���Ј3RNi�?]�'�c&W�weZ<�HT	9�-��f:�Y�=�uh�� A� �^�Ƶ��:@����    �W�z��ap�"�FT't���J;ָJ��	s��V_Ԟ�w-$R��|ㄙi%`�*�U#��v�]�n��-B�I]�0#,7�MBY
�<z�+�#nV��U�������R�E(�մ �nr�^xO=������4������/U�/�1ԗ�f�r�+vh�|�Vb�*��]��]���^��f���S���ŉ���{�%�e;?����H�����޲��A��e�M�4bꗸ��)�>��FC�"f�n�YE�����@	�n+�e��g��r�7[9���5dG����=�%����1�~}h���Ϥe��1����lZ$�A	Tw��-��z�\#0�qb�勪4��n5�c'&F�{����U"�Z��U%^�W��V��Ȼ�f�k�����O��q��/0�|b��(gBbA�jx5TD�];~�ּQay�Vq�������o=9�2�`�
GbN���]����̈K	�Di1�yq` �璲��Ϝ:O��V�ʽ��So	k�\,ˍ��͕j����]V�9}N^��8�џ�zE��x}H��x�� N˛�||�����ّ1���(��n���B�Ԍt�&>�P��b _A���o��ߟ#����$ 
	�����ҙ�f5��\G?Ϸ�K�TʐNo���>�/N��uG�3YW\�����K����,��$�hR�[�4�	�r�R����j�7/E���u���M�5�A���)�W��m����9q�i$�ɥV�)ZS<$�^ j���S��J��>`鍱;����R6�9����hm���z�|}�z3�"sK/�Ү1Jg��%*�����\G�##%����l�s�I"�B��ǐ*[)����z`4�:I�����bύk����l�	��F2��j��<������_��-�g��8Q�F���9$
�o7�^^�6�?���c�
~ӳ�T=GOn��Ds�7po�qc
��_ �|c#e]���L�0���� �-��v�����\ˍ��>�tf�"u� x��X�uU9������/(����������P��ɛ�4{����ޔ�x+��K�ڼ�FR��p��W8ɮf�k�� S��n$"-k'��4] ww����n՝�����~mm�o�u9�.�O�!�6P%���"��j�*��Z��n&�
��&��������hk2*�w����S!0D���I.�Q��.n����4\|&��O-���*��U�у��K�R�I�wJ�5'�'R����*E���o�03��h�%�j�tO���QLw�y�-���k7�W	O���0�F..65W9y��9d�ua�F7�YKwǍiԁ��.�Y	�]|�Q��|g�	u�rS�NAR�m�W�*m�����������Ϸc4&�X�\��uj�,`^C�AQ���i`J.[�Ǚ��/ .��g1�{�aa�G� �,��]KÛ$V�R��ݟ���'T��E+���7�n�)�S�-����^�{~>�ְh����L]fޖ%�C����<��EG����>�1�fsb�L^-���@�	�;M[�A�<����8l�/�s���9^!���I��:��3���%ɾ~��]���C��ڔؽ�\���D��o6���f��B ��fB*���%�
<J�X�4�\kr{^��	<e����qUQ;�X�(�����13*vy�&I���ZS)r�cvu�赓2~'��()�J����S��~�j7# ���-oaK1� 5����`֞���/0EZ�x.��Lq�$1�[l��t��L��q��/0��7~l3���J��RS�hѨ!j��&�c����Tn�Nc��S]1��A�q�zB��;z�k��{��H�yV��p̣��ڜ�OХO���1���qP��.�_`J����,������!�PB�����;�u���F�W��>䱒�R�'��0>N,<.���?��s�g�Gv�!ųg�M��@1� 9�BM�ٱ-[ߦ���?�\�E�΀zۨ��b���r�8�1*w�1�~`B$'+�\$_�4`�Tr��/;iT�]J[�O�}���Vn�1ͦ.���1*��������y�݋���)�En�S�O��5m��^���3���h��7�Eܴ�7��<�4M�{�º	ɸ�����Ԣ���\��4w�i�I3�əb� �-˴<��Q}a	���f��ȕ�$/�,���<3���,ɽQ��O`�π�o�I��'/��X��SpT"i�,��|���CyEd.jR�4�S�}�L���f����L�v�z`<��Xj����F��R,��96*z�0KR�}67�����	R/����j8&-q�z|�	'	߁��v�F| ��.r�R�G�J�mi��AQj�����K9�HZ�Y:1Qr���#f������;�:�����H�mp�YS����c6[j�i䘤�e�N'�@�d��uT�<���ˌ�
K��e1)����Ē.���]��.��I�O�JB��yv!��w��ST�vc�9È�R��k�����;Ѧ3���/ҧ����̈́{nKDQ���M��i�������8��͘C�p[����$Z�*�%��y;M��^���=k?��7Jg�~trL�u��է7![�^�waά?��'3;$���s���v�XM��S>eȒo�r��O�b� WM��Nq/�ڽ�z\��K�!p]n���Z�$�BO4ڽ8o���y�s}�������7b:kok��)�<!�Tkp���{������C�`�-�..Cv�i	�O�.%�P�Uz�����~Q�r��5eɾ� �C��]j�{ezܴ�ѯ�;)э����iKJ����'�[�WH��޾LA�.~������!�LL��pP=;�
Q��FЁ�*��x���H��[n�������/���uk�/0��*�sc�V�ҲU�.�.���>���@���.:�sc��T�p��s�iH7=)w&����/!0���� <.'�g�Is8��qPҘ��c,�����[��M_�-�(ˉ��V8���l{�싟ce�Q��RnLFagٸ?�[�bv�͙��Y�����s����a�����^i��l1!T�B���Mšy=05�us��j�b��z�1�	s�J���=������Px�%�+��$H1]cWTf2Zn�ښϿ[���SoZ�ye_��۟5����kxWW����T?��z��B+kЊ��jN����#0����or�U�j��|E�yWIgw��KW�o���R�	nP�x���-f��s��G��^^�|F`P�9��opL��X	;
a�M`��0�\���'�+R��E�=���#�1M�&>�D�t>�������J(�~�	h{�N1��F���/��]�����S��ЍC����n�f�8���4�[�a=&�_nC`J��B�fG?�� �6��0��v�Y*>������cC�I��G�C��U�������Q��|?0�m\�{o����N!
3���B��m��:e���r��: 0���f�U��
m�ŇC4q9(ٮ+�:�|�����r��)Mf((̖���=����
>�������Үf@�yW�U�x��M:cB;њ�3C���v)Ƽ؍gu[�[��jEA"N}0���c�����FB�m��:(�s�-*���UR��ka}��H�l6*z�� ʝ��tJ̙QiH/�A����^o�#0��J�(��I�O���������[z=0�sTr��Y�1C��$3��43�io�el��|�S�UR�y�<3�f/�o�������'����9F���r�Q���tO�rO�rL	��5��x]�	����ͪR)ҭ�R�;���K8��אM>�����T^)�$��{h^�s-�^W)��x�� r*?�!�_L@��n4�u5ϩG����<��Y���Z��	���j�R���"�k��m�'���<�|k��a�<�lk��X��������r�A5=0�,�oVOd��ES�� %�\8@������k!��H�7�J>�g�a�P8.�F���쬲�)����)�    �vq�Nf����f _�=���Ԑd����E`������:�,iY�evb�.�,��u�ɯ?D�X��؜�6E�e�N4?����g��J�e>ϕ�E�ŉ�z#� ���v���[^��٧�M������H���\_4������zP&�ۺ�|6k�L__�@`T~�V/��K�d1�[sp�h0#$���>��_��2g�2�^�|vJK$�����q�Yp�t��[��_L˷�L&T�ش62��S�'Q�g�ե�c��q�؋bj=(���p�<q��IZ�Sr��op`@!՘ol�Z�:.)�M����8`J����v�)��ֵD����Yk��L?d���J��������}����FY�z���K�����XRpH���-o�/0�����8��=r<�SA�Y���H�6��������"��%��������R�}eO�N�w��o��/0��Mr��!��<f�U�LU/1�������i����@����������/������u��v�荶�s��mi� �����
Q���?����������1�~���o�@�Z�7c��騫�lN/>�+BRtA ��b�����n#�7�cͼ�gw�/x*(�ɻI�0�[gRy�7�O`@��\П��+M�u��I�?ujN=<V���J\_`�iW�S'~�0G���ԣ�P	m޶g�o7X����x���J�ʹv��q���	��Ǎؾ���r���GF���<!r��A��������m�/0�bv��4a�%'FbH%�Q7���F�E�/M�	���_2�8ul^�-lͣ(5EY�H�;:OH_��9�|`V��T�#MN�-�y<F�I����t���}ϿA`H~��敾�ڍg��$R9!ՠ='Z@��YA�L�?.r��͇å$�̤DO���h���;���>���_�~(Jt�`^7���K&@�<sr�d��	h#s�=���3se�+��p-i�Y)6<�t�(��q�8��F�g�+��f��Z#s�Ei���\�������x��RV�^)�w�]-��k���Q�d�$�a�}F��ݼ���*��
m|�B��6$}]�pNm�k���'I���ov?�.�_���_s��rj�0w�1�JϟGY
�ǛaCe@<P�m���$w����D�K~>�XLafk�f�����'I<���4%�V�e ��7�J��������Y�kϘ�^/�
�y�6�/�Ʃ�+ݘԭ^��i�=����8���E������-wW�F��<-��W�=pb��!Q�|�m1�A��O5������ҝ�ʎ��S\U��'�}#�R� ^>[ϩ#m��H5T����r�ڊ���!�Ƥ�F��Om������8��O*̫]���^�&�=��l���y|U�&��^��mLZ@�k6���1Z\�6���2�& ��ZYD�j�b�Sd9���瓯��c\��;�p�Ea�DӦ*�Ҙ���R���_�^K��cs�����͆�R�԰y�@|�"���&����a��Z퇎0��<�D�vH+��ϑ9V'^�J�CL��s�cL��\:3�T��l:	fR����M����!e%��
�8�xjDU��3�_(���X��F��:���U�{%�W���	�u�Z%�5.���X��_�Z��군�69��qCF�R�����:������C�N��/���H����?�E�s���N8#`�Kނ�ks����o��ϐ�`>���m
.]%� _E�����s��g}������MQڙ��.�%&}���%վf�Z���T�՚P�F��hXaZu�yP�r�����C�y���>�
�y=Y��1gn	O�xts�ṻ&���|���xoӛ^����N�1RLG�i]BcɎ�}?���&fY?Jpc��e2b�ޑcª�yz��M�4��|��x$��T/r��.��5md�`���-�VO�Z^��l���Q����j�w�YD�0������DÀ|�����amX�V�E��C�i�J�,"�(r���O�v�U����5AD���r3�9i����
v'��@�3�j/,홭����e��ٳ��|��&@��$e�'����JF7~�m6��N��5
o�W�
�|���Ru_`�~�J�A��&���ɖ�T���)�L���u�F��#�1��L�0�^b�@2>2[麲������k����9�3�B'���(�����5����������Ƞz'�3�yw�z��-Ӭ��������	2g����hŉ���j9�����.�����h�	���F-I����@�������4�ښϽ�x}�??q�7�@M�N���;��v���4��\A �|��X�aZ�\n<����E8<�p���5�薽�jϯMD`����F�"W\�`���b89��T�7�]��PT%�e>InB�0#��V.�;ǈ�ŀ^q� 0l?л|#�r���azߢ�%CNN���i ���r�G��o�b*྽�����J�oB�
4�����: �E�T%�Ҹ۷&�BaO�9�[j,?.���=�&X$9a��YX�؍G,��>$şT��%h{��H{�[�Γ�.��N�e��p�����c�P��J��Y� x��A���hg�ʯ�q�~��(���+OA��oХ���*��6o#������d��7,�Ժ[Iu��m�:��j[�Z��y���3�~�`K7�Y1=aq�B��ૺ��{׊�%�����_d�J�J�{�(�*�	˱�-�\G�||W�;����t�|G�2PGͱ渧Ƣ�I3�m'�o�� ����r�*��7��"���J#�O�g��4�?���Y+W%���!5Us��� `�|�'5U#zݷ�O`��NBU6�퓪��92Kr�'d`��E���	�?�|7�3�P���PiK=���E�s���G�L�_t|o��DZɺ8&��c�䄳3[��q����|E��)D�FSi����Tqb� �r��|���]��<�&T������=\86�R��.s9���r-Q�����|(��\���ali��J_���Ɋ{�~`�~NVoĕ���#���y��P�Y��D��<�7�_HO\m�u�����P����h���u������7��tz{<��J0p�,g��yj�� �F�
X�n����M�A
�Қ�4B򯗡��g�}J���h��j�s�0��ϫ{Ŏ9ꓗ������)��5�蝃8mJ6|�*�7�W�ܕϙo{C�	���_f�R|���Ϙ�E�n��1�+�;iy}�
�Q�	.��+�ξi��\�a�;:xa�r��✟������닥5�YU$m�a�Gl�J+�P��R����,���sb���Q�Ei��42�5��F���7�J�e�1ȳ��S�8:S��E���C����v5�|t̆l�
���\��2��e<�,Z�5Z���s\���
�&p/�N�2�c����}~�xw36:�s~��|z���Ԝ*Ԧr��|ӡ�>/��"�v�yv��Z�.�ʩ��iz;�����iQ��a��w�p�T�9�*��]c�o�����#�~`�ȝF�M��	m�4��=�4�fʧ��A`�{����;1�SKg�hljv��B!���~�����j����o��q����FZ�}<�a��P�q�yܼ��ݹ��b10i5>�$��j,��/+!0R����Mg�c2���R�ذ�]�\�z-=?_�<�t�f����֟�>5}j�핀�r^I�_?1%�E�����A�g�؜�V&1NE�.6���6R��/nҕ�X�r|K�跊j-��lju�k����� ��͆�Ξ��i~.�� /�I��Q�9�^�JL0໋�p�)�R]+�z�n�o*�N��_��ϕ��
-��c=�4VOiػF��϶'!���-TIJQ���=���TG<��I�ꝑnr��=<b�UBY�iǬ�(����i=4F�x���o����}V��FE����q\%���Щ��S������FN� xgϞl�.>���Q�V�����Ɛ�5+7J9�<��z�9NL���3    �g����S�����	5�H��dW��=d3�ک5��E(z��Pt���z�pm����r��~)=Y4[h�.SV�/)�z���۪�R<Ws�U-�@µ��b%�}�|�Ja-{�ކ�di'������K
Y�Ö��߀|�JL�W�V{#*)S�C*(vzIlb��O(��ɷ��M��]P�[رq��Q�#S{J]�����Q�G�q|�l�h%Y����FVMyW�K�y/͟&U���q�S�p����4�U �F��������8�V��E�~� G ��E�8y/�^���@�zUB`����]Kew:��-���H���@�]eO)�'_�P����6�pwb�8thh�K�N�D���c��]�y>�£�����$��u���^�/w�k	�[	�Jc޵!��D�S�IC�c�F�������Үj$�������:��!�\��5v������#�v���� ��7f�EY��������������Jt�3Ьڰ�	>����{:�^4^/;�0�|�T��49�ꔴI���1�Z��C����z'�A��7��y���/b6�����,m��0����0xJ��7�ť�3񀖍X=1I�\vjk�j-���	-�s�>1XD:!>kp��P2O˭�9�^��/	x��n���oO������'V�֎�lǥ6{}n�Q��H�!���R�x��+�>b6�J������5}�`�r7������;�sV�]���ǝ)�^/��w���T��`	A���%�+�Y�S���|�|�[�0 ����v?=m1�%���(\r	b���K�V=�;�\'�"+�|�H.s&;��y2_>�H��� t�}�IA�E���ٽ�k	ϯ�abp��MS��.J%�s�ߍ��rx��}�K è|*g��Ş�����$A�ν�Q�Y�qg�v$2�g�-����n�6�F�5-
2�-�Ya�b&5�����Ct�#7[m!$E��z,D[		B��\�ny��O	���g���y� v�UT~.][_�J�B����Ya�(�{��s�2��N	�rN�Yjڴ�����c?�|rAT��|�|�Q�K_�D<���nu�,fz}��A�H W�������](��ip�8Z�����qV��!�ܐ�l�3�4U�9_v<��(�\cM�k?ϋ�Hm�vSvum��|ϱuݿK�+����k��F�Әo�Jd��y�S8��Fh $lF����^��G~g���dR<&�J1ib![�!�vpg�w1�M���@}���i�{+�R	��Ƶ�����c���V\�f��5aLO�Bް��l�H���
+?N��?r�-���ԩ��#��=	�c֕<�o绨�O���&��4����㜇Κ����7G[I�����a$�K��Y8���	��գ�!Kem��!��Q���j]I붠�+54	Z�k@%�������7F�c$~�_��1��v_��$y��0�h(O�n�<F�|�|�#���1��|�:����s������JZ�f��G��)��`��#��/+/A2s��|���QP�Y.��tkI[:Ǫ�'�S�k��Y��#% �ՠY;	a�^C��S�PZ��%�"}\;�k�ء�#���OZ1!J�[�3[��a ^���uÔ/ib����:Ԡ��x�N�q���q(��6q����Ǟ>��U�nd�"NiIȷ�!���;���Pl��o��Tdz3̚{�.%��'|�I=&Zi��f�[4���\թ����'�16T������Ӑ������0��[��C��[K�ĩF ��A�D!�����FO���>N�O�����u���uR������x0�Ɗ)Ls�n�g���'��DaF�I���X���|�Jc��?�����f�|s����zP?j����յ�Uo���Q��e�)Q�[ סpg}�dB��o��/+�͔o�K���$8U�;~S��x����w�_._����$��ĩv�Ѡ��,9-��b������|��+];-٭&v^Ѡō���0�����<$h?
���7C Sx������-Eg�iC�spq��E=�ׯ�ѭ�>�L��c�: ���ki�$�Ro�#��H�n@$�@H\B(��Ic���[����������<����LM�dFh�ii��� N���3c?�|ļ����(ޏ�R��J2$0�v'��}H`�|��n6"�Ki7�
�S�׍)"��M6��M�����؁֔��S���kB�V�!���eޞ���N����xF}�%�)9�N�r�$��_�0��K�Ro�'�z˻��a<$8�ל��vi��0L���v��e�H�ĸ��-^��!u����*�켞��0Z>��=nz6�R���b��Fz�&5�|�1z��D��uhfz#I��7�q𔂋���9��_d�pͿ�a�#���n@ֽ�L�B���L��Lc�9pg��!a�!��h5tF�>Fw�9�lq�g�д���ǙY�����ͮ$EM���VZ����A_�b#���ag<o��C�(�o��h)nX��{��d��] �4��l}�~G_R���.��e�Ig�~�l﩯M�������|��!�U�ٹ�:V��x��1[z�9͝k_�s�׋����8�Mas�]}A��1s��	"��cG߄'������`k����E�I���(��"#���m���aD�7榫t��FN���C�dJI�Ȟ�������\$��yG�;8��/��aF��9���Ya�YV%��뮵G�A��9X	�@Tr-Z����C�!�ޫ��B�<��чV��DA\k����N��0�cK��4h��sΰ4�f�aET� ۫v���2�G�5���7�z��G*}U8_��˨�}4�CԞ�10�~Q���OD�
0�-2_	9�B��N~~�	F3�|#�`���g�"H�J6&�̽H�9�����lo��)	nER�IZ�)p L��>>���>�;R��M��)��:g�X��{��_������J-�Z���L���|�\B2��Է�thk2q���ucF|c����V��Sb��V�)δ�,B�ҙ��a���nV�},�0Qe���������<g����%��]�!&_u�����f��u,���]4*��-�F�֨�^ܘ�rmLi~�1$L7f�Kx"�y>�����9,Y�2^�9l��PK�v��9Z(�X~�y�e�1�k��*Q��]�`�ųJn��8�l��?_�����R����ۢ�#)�b���c��y����|��k��<������X����ϔzόk�yQ��x��a�>�W�񽎞�S]���Y�J8'�jm���<P�R�5�i��YG񶃗�́��pWʹg�a��'�(nn�q>#F�7��den��Y�dz�2�km��.����̀����(m"f�������+��kF�va��;�	 Z"�Q���sr.�c��J8��#�?녎g۩prf�{�V&u�סR)��'Sn7U�����4&Yqc$�j�wm�ܧ����0�O���n��T$��W}�Z�l^��i�U�؛�g����a�4�'K��kcnG��[Tn��p\=��Z(Y����$9Ϣ�|T�$�&�� �=���R��*c$�@\�QڟoC�0H�,K�>F���&=ַD&wu�{{r�?%�.�p��J{
!�[)v������<�����_��a�>�U���r�����Đo�z*&���j�zS	����Masdw�]X�	f��vƘ�2����?�R?�"��0L�2�,�'e�	v���B������_�����&N7�TZ [aG�`�����
7 %i��C!ov�9}��=Si�v[M΋�҆Si�ߖZ�F샴7׋4��6�Iֱ�w��8��Ʃ���`���1�H{�9C�s�Vz����j�2K찔�<�q�=����EzW���(N&��l�	�7��X6��1�jl�]�Ҫk�p� IДz��i0I�l�磵Fѡ�����@��iY�p���/��R����Q`я��s���V�%��E��[�T���|�    ~���R��=N���N.I�g�t4�Y� ~=������v�P������寲3Q�x��]��׃��.������Y�.����N�L%�2Z�i� ��7y�;.>Jh��:-��{V]��w0L��R/|/×�3�	ҮN��/�Q�F�&H��I�s�@Ќ�򟖨$I[@�s|7P��5�>��ƱB�i��..�>��!���p��S��UXGp���Ǥ��|
��\c6ΐgL:�P�.���,O�ɞ�h_�z1�� J�rQ��C�*Ճl���M�2�*'�<�>�DO)�ܸ^�}�����=�D=U-�J�i��=L�vg���t_kDi��ax���^�m���	u����	�����3Z�S�!�G���\J婹����h��>�En(zͣ
��8\�������9}չ�~���2�"�b7>��"M�AH5u���Ă1��o�H�0}�N�K�5��ũB�x�X�L���/�H���������N����I�i�ޒX��\��>����E�] �U�xǚN=;+#�NNڧ�&�m�[Y����������������^k�R;{��O�-��r+��"!�����L��q�����������������OH�N4�Mu��AR<R��<�J�5|�o[�cͤ����_�T�z3i��tc�Iid�%Y֝zu���=���/�o
r��.y�����]��M&;'��_7L��l�z�P�.Y���ZP� �ufw�2���E�0r6+�.�R��ʚ��qc
Џl|	��R����:C�#���h�Y/S{xY�)�$(��Ay�=/����T~�c|��gi�Yb�P��F)/#�uo����|����Xf)��Vx	��`��9�AV�~��U�R�B\��1�d��dkD�_)���y�P�_�ƨ��V�Y>�q�������L^�1����?`��=z���rꆳ�E�n�Ir��"|�ئ�^o�ɷ�X����?ﳇ�\��|��LҐ��Y��0�/q�g�7�{�zr��J�h7bc�S���6k�yZt��y����v+C�lJ�;GWWM�t��z�� ��_W�/?Ya����Sb�5��w���Β��=�����}�}�,7η4�w� ���t�b���f݀����p��_�yk��1����w�'3������J�c���p����ޔ{O� ��PG�.� ECR�z�]j��0ߠ�Ur�9[�z��)~�'�S���y~����i
Pp���-Ne��c�� ߳���K�_�ƨ~Zn~��V>������?�Os���\�_>��p-7��~ ����&�i~W,:p�d���-	���v�d�htז	o�j�S
�P&�sW�_�Ɣ�i͛��ѩ�k|���׀uγ��~�O/_J;2��1G��i�q�;i�<�ź��QD~�}Ҿ��Xn�vWF�?%)�(Ord�Q�����;=�%h?�C��n �� qF�[<�v����Z��m���f�pMZ�f�1�G(j�ٞ�9�ӄaVz2��<$�6���oT�=�x��js���%ծ��L�4�0ĈJ�7OI���G�!�>�����*��\xI}�Pe���\N��A�s� �����[��/��0j� �ТoD�F��N�[S_X���V��z�c1ќ�])H�6����3��J�9�z0{[:�`��a����L��Iڙr�: [o����̔��Z���p�Jλ�����J�6��zb�ȿ�$�^�I������"���Us:5�T�Dov�Mq/��r��]%F��Ь���2X�*1Wģ��OA�������/�5��'����gIg�r�#�j9�̳ï�oz'�1L؀�S����T�ZgK�qd�Z{��Z� ֨�����c��Y����X���p�ì���n�"��)}~D*����n~�̾��43�Ym�y��h�A��9?����h�r�Rr�ּ�����B,�,B2���@�#��̤ʲq��$A9+ExN�Ԋn~��v��\㢾B�W�����?�RԀ����r��sY���J�S0�_u�D#�:B辯P(�1ӌ ������c��fn�j�sû���$��}'��P�y_+K��тo^��n{�
�t/'R����6br/^~�S��a7�c�8k�{N�g4F���K���N�_�a��bԆ�،�/�c�>�>pȬeg�n�ʇ��l���i�`�1m�a��va8�RG~���_���-��K�r�� �fhĶ/k5Q��w$D��uN1�x��_�����	7 �'�(=�-�~Kq��糘��Қ�0�n�ysI9B�켓�.P����|��~}omzõ+"]x[*3�TC%!�	���ء��/U֨m�W��b�n���I��i���/���Md3��a�?���7B6���nC�Ǎq��Η,�z+�yôY>n��M�~r@���}E�j��LN-��2���/`*��n�R�����4�(e���9c٢����<�;8��K��>ʫ��}�#�=Y�R���=�ׇ:`D��k�!c�����
�j�����j��Ml���|#�aǉ.|�A�#�����z�|k_���y�wpL2���PGm�p�`!���] �gOh�}�%����ETb������OsL��f�L|���v��C���g�1��8R�h���ηm$2\p����a�~WK�	�etw��r��)]�NL�kp=O*��Oa���[���씿��M��0�U���f{��f?�|��ߴ*��3Ҙx5A[���h�U�}6��l�"U,QS��)��/.�E������{|�����0�?LH7}k\?m$�]�B!�(	y�Z���{'0�D��,v3��΁w�9�<�~�m����yeu}�G�5�ǐ����)$��s���k����4�����y;(}S�Y)_LUbe��Q�� M\w�܁/�/pc�}�y���-.&��D�I�6�o�)���N�����0�N�7u*�2��*�p�i�,I�ɾ�Y��=>F��Qd�7S���,� ����� nKχk�U��튻�[>��nY���,|����G��o�۾�	i�brCQ�	NfBF[Y�!�w��̼�y���5LlLT����p2�dJ�����S�d;oR��4χ����U�+s� {q��;�l�WrdwsS��%���cr�|���<��|A;p.FiT��������E������-�ԣ����*��@�"�H�\��,�~��7�T�2m���,�d�8��=M��r���	O�vQ�hƕ��=�Ґ�z�1� �ӑ�&�2�k�����m�Z�r��(����=��(rp�����iY�����dUn7���5���R&���i�R���0�݅�� 0�U��R�h$1��r�>+���b�?N���0�1?�͈/徽�sxGڛ#�c�4AP��&<����Az��ԕ�<��$��n3�V����/�c�?"��t!I7��N����p�I��z'�[W��a,�!I�N�Bg�Hu��P@�[��q[�L��ϗ,�!��՛��`?o��V��HǗB�k7�]�y]y�a�c���0D��ᒊr�M���t��溎���E�[ZhI\ܘ�$W���*�B��[Kn�s/�؄a<�jc����\���F'�ˇ�qfP��R�An�Ͽ$�)lir#�Ɯ��-u�֫�@�Y�S�A���8a��0E>����?��H|��K�>b4һQ�L��� Xk,�\	"E3K�A�[ÿ�@�`�,�k�~�h}櫧D	K[)��c�
��!�4[�y�7F������y��9��EWr¯z�L%�3��ʱ����F�$-��'�=��/�������^Oc`��U�va�q*��%�����p�(:X-r�+=��5ӧ���S2���0G>�K��Ƀ�`��ʣ?N?�?��~����U�0qu���n�~y�����{mTb�B<盥��]�S������ԥ=�>G�G ����(�0
�t���t�2�3/��{�Nc�6>��[_�hÍ!oO)K��&MB�f!��,�1�N}h�׻m�1~G*r�X\�G��5׈SQ:fʓ��|C�'x0L�N�    7�)�� �����0�{��-۟w�?G|�LO�dئ�$B=���zjk��亞��0�a�7C�0@ƣ�iǍ!�k�Y��F6�z��$����bq�����W�H�����I��?��yH�
��I��Jo���0L?�,��ׁ�1��c�SD�=X�4���r`S»��k�����L4����L���������?�=f�=��J�8�w�4PgM2��mŌ�J2����a���{f��?�8_��>}QH�1~�̽IyԚ��~�;���[P��5��d�,M΁� ���S���ڟ0LL|
R�Y�C�CP����>�\�٩샌_��d�K��1|p�����!�H���Pӭ��lj{�3߾�&�l�d�!���Bl�^q*xG7J�!=o�Ͽ�SR�%�|3�!�y�Ԥ��k�g�+2��CJ��V���u�r���G�H�7�쫃�d����|m�K}R�՛�	��ͺ��W�
��b��%��w�WL�0S��1�R'��Ә0�(�贲{(���R�Qڇ�������j���5t�2^�� �X����_�����Oɭ�LcV��J�{��OW�`��e�����v=C��T���<Yju8��1��*TW��558���d9?S?��`�v/��I��NRc�󴕨IA o����][k,7%�,����1'�s���C�F
2"���|������7�Y�Ė�L�+eI�6 ��6؟��ô�ӿٝ�����{����V&�L��'{�.R?E������+�t %p����$-�Z �:�_�����]���V�wi1d�r}�7�,�Z�o�O�Ӛ%��d� Z!sAj��g	��K���:�D����g�m����?�p�ł����1�b_p��qB B�2$�qfG�&�%�S�g��e�Aް�ʬ��X�<ip� Xr��ĒcB��JR���J#M�!�u��A�]�OU�پ�E�C��D��#�9JC���➽��Y����%�ɛ�ҍa*�+�9��J��F#ܫ��֏�����a�b�W�m�!B~r����$$o�q���hT�%��acd�7�c��kB�	��e�S�X�Zϯ�Z�W)�I�IR��ҧ��ƍ�_��e������z ���*t3����h0u�� &�%	@�
�Y�4~�_�[�V���>���s�L��M��ҵ�A��~~��)�a#�A�8��T3�s���nd�L�2[�z���Q)����+/�7�T�
*끧�{K$��X��_�)�"cmYnj-v���L�X��D�������ǭ=��B%Q�J"7�٤p�N��;�ùt������1�������]-��wL�y���J��������b��T�M�~��`�`l���1C���t���Qhx\��k�Pu�����;�)H�k���[��Q@��f�t�w��ei�Vo�s��տ�-F
7 ���	Ÿ7����H�H�j+zCmrΙ�J��$�F�˩�㇃�מ� �ritEȐ[�������ΐ>i�9�of��?��t�������wPk!ߍm�
��]a�k��|�߽�J�.��\����v��1yL/I)Ԑ�
��<��%�v�~5��>��s�T��u0Y�A�k�^o��0� 	�܈۴��&1O��҈�:�&�T��~a8�L���ߛ����p��C��SF����z~��Ű���7bV�-�������R��mY}��	�X�|�u�Yw��=8��ؾjy#�i�K�~]���?�,7�p�$U��m3G��2|�t����7���0L��n�R�	�@ӽ�'��/�y�����:"�a�?�?��7W\�G�Ae=��䚥ڋ�^�z�!M�"7�kc�R`��FU���rf�����1$#��Y���Yl�gE|��H��(�b��hd��z[	�Q��h^8_���	:�Y����Q�c�G.]��`	����n�p�N�r)��"_�K�si�J�<�o�XȕoD�Vɳ�����|ۖdP�6�弉_<�aJ�(0�ͰC�m�[�>b4s8�R��������[W��a�]�0���8@�A�%��Z�:���{lДҗ��B�e}GUW�-M��U�5��_�0_1:<��F$<��)5-&4��m�W��\�f���J5�!�W���{LC��sb"4zm1���ԑ��n�ZR����1s�N�R��ii�#!Q���o�}�7ìG��$I����5��;��2������ �v��ۑ��+m���M'J#Og�"�=�Ǵ�C�Dp���a �J�S�ْ9��p>!����J-f[�+چ�V���c�ıՇ��yռ�w��R�l�M�̫Z��f}yH#� q����������|%��cg.@��&�Rlr�&�݆f���K�ab��U����֎�|N��E9攄��Ҏ��|����炟�C���7fE�U��#�h1����j�.��Y\�l-�	j�Y�S:��!��	5���o����]1��(R����ޒ>���S;�O� �yD�j�ԛ�=֪A�u8�J�-Y��iM�Z��O|��1B�J�Z�+�	�o�-`�u,q+��V��5ua�(�d!�p������N��T;tE��K���{��h��囥�%�i5����:U�{ڂ��ը���1B���J���p`��T����n쩳�NQ�}�������sN%�6g�|��Y}��6���a�~�	х�-Ly�ډZ��r�dV��8qI�xJRb)�F�Ҧ�R�����=���3N�{�좈�Y�MPr��9䡿L&.�ii�|� }^+JJȕ�������;s̙9��:�1�/2_W�](�1�ް�ٹʩ�H)_��~BT��Z�>���&SڧY�����6���ނ��*\�U�������H�ٹT� ����p72�4)~9����J8��dxv��u��t$�ṘoJᒫjU��;�0Ӈ5�����J�v�!�3��L�u��1�����������&�qW�f[P,Q.�X5ָK��`��!��~�S���.bR�\��1R�>>��q��k"?r�0՚o&6���x��bMAis�1g)�������p|ê?Ճ�']�%	fw�&��c���O��OI/��L:��W�p�2���<W���ϧ1��G��L_�%68��J���|M��Ca$���������؍L�����e�G�z���7]�>����k�����w]5���@�&
�5��xY��|T�&�R�F<.f�47�1N�C�.�-��]��kF7�䢮��Ti�����u�ʠ�ϱ��>�c�L��c�&f�{fh�=�D��CKV5ÿШ��I��l����v5k1�˹G���C�TZ�����vT��o:�ױ�q��V�~��wo;'(8��/�EP"jW/)��!���aP����А�����w��Z���c��EgN��]p�Qj��lk��ϗ����n�.s� �\ft�xT45�Uz���.�>������2ޣͶ�� ~ƛq����y���]�~�^�!)�H�s��VZ��h��I�����U���a� Xs���'�] !kܘ�S����)乯��j�l��7B/���:z��b���H8#������*�B��Lt�NQ�x+���;Wd1�CY�Ls�y^/��0\��Yn�N��+�9��6ni,��Lf#�%}Z��Ϋ��&z�������*�4�>�<G��yh��	_%�7<����6Nيq���������u�=���w��A�(Ŋ���]�%"Sv��u}>�a�|IUo��L3,�t�P��;�� >+�S^�ׄa�j���(�n2�n�jp��
��Z񘨷9�m�~�󚡱�Qɑ��f2ېp�9���\�@�oC��a�}4W�ٳ�!s$�X��⩟��h�K�9���ٯa�~���f�������Hq�>j�Z0�N��@��a�+�*@�Y��^�#N���z֙���"?����k�R?��j̬-��E; 4�*��j�"0�Ϋ��v��kɟ��rC�� �8���l�Ɂ�SY�+o�������0    �)DW��G 
�}�"��AN�����ޮ:�0%H v��m�z�y��s3�� ��4�K�X����O�ا���ksg^��ZE滃#p3���Z�ׯpcJ�T�,�q*�F)fTō�L�qhiJY��r�����C��"��E�w�`��a����VI�i+\��-b~>���1��73�uyo��5:ʩ��=8�i���/�(��Z覂7�Β���ά�ސѸ��������0xJ�p�oF�i���:O�t�@�����<q}{����1���lCV��)k��N�dS���9q}��`1N����(���&��~�yQ����\,U��Qɾ�6��f�V)R#H� �SS?m !,�Z�^g�a�+8e9ߐl��{��L�b�|��L���Q���v���ab��J�(;;��b��L��[�	� �+���8sLC]x��3�� �ڀ�FFS�աcx�1K�^w�0��3� �5��rr�恕
�2K��1·V����ʞ��kͥ	~.4�G�B+��l�u���ƿ��"N������������j%����Oweډ	٭ p��a:�U��9'��~G���d��T���R�}>��<Sk<
g�O�zNè~�����g߰��c�(���f�ܕ���zNKd9U���g�0�t$�yĎ�D��6�.y��S�~#�a�z����a�`�ZN���9��^�:UW��F�G����]�>BJjP�9�� tʬ�}��|-\��-[�ӑ�w�S��p��Ҫ�C{�����0�1�!8_�v�ڐ�r�P�p&���������?8J��)� 0��#t^�&�����[o'?.��0�ɯ�F�2��D�+sR��4ji��5��F�����X�j�5 ���d7%���mX����4B���.��>��*2i;��aI'�?3��y|�0V�B楚s��
���4	�D��W�E�̑���׻�0�%5m7�ukņ��j��@����li����F�4F��Vr�)i������	` �:�B����gm����?�l�E�h��O��Ed��ې�r��r��>̖pi�y�������`f�-���:��6щP��ږ�2�%��-����b?�|�vk�7	����=������j��9)fXj���WF�XG���N�<�5��"
���K� �S���G���_QG�&��s���oS]s}�Qk[��o�3h���.���g�1~+��R/���0�2���r�����U�|��
܂,$���a<�^��<����o�t�vf���R���+ea�Ȅ��۲��7�_�@0��mг�* �H���Ss�ƮTbS��St��!����?��n��5h:˗�+�s�4p}��i>���P��� @�Tf��	��N��H���uwZ98�������~S��ȗ; "�H9�Ў��d�������`���j3��E�E99 �:b�6p�vC��9�o��c��^փWa��@�ғ�H�F��]��n.���f ids�
E���˜�;�e�s�U���I����F�n
�4��Yw�ʎ��)�t�|����w��(諮ko-�(_֑���7g��H�n�(������ݰm��RBd8���E.�C���e��7 fטv���f3D��"UNl9�A;	&B&9�hM���EVH��WF��a����՗	� ^���;�K_�O����)�3@A��mZ�G�6R�H��P�;���P���`7�j�R��0/ê�T�F�2�9�C冂�I�Y��r�F)�l�G	�Ū�J�=f"ט��gJ��a��z����%g�Ʉb
�竕t:e�ȣ{?զ�!8X�~g�bc.��hL��G��Z�*+��R���f��t3JQiM)��{��M�i��x��w�C�o9��}M@F�i��u�mK�c�)� ��p�my��w�5���Wf�Ԑ]܇�'ǂ�W�I���3�9�w���aZ��ߢH��}�Dы��W���Ԏ�@�=un��Ka�6��,�F�Ӳ�UX��j ����@�6��/���4�RAv⛴�` Ӳ���� ����r~[yx����>��9ޚ�YBֹ0��ʚ��(>�s����o��o�lCG�4
=M���<�~b����r姷�3Li�s�7[�v��=x�P��Xb�	AB��^���0�J9��o�3F�lx�BQ�Bh���|������O�p�\��M	i������gxb�!\��iy��y�(?)BnD?vk~V�﵃�,$��#˅�z?���������mC���F��\O:%�*�I��1��1������em۩��=q��<�>�+�ɿ���4j&7�{�*�P*�;���:P���e�����18��W]kW�o��5k���e�n������0�>^(�l:��e+�Wԍ�g\{ԣ}����߷���,_�tKx�	��m��OCP
�Ul��8HȂ��57gBdNY#������=k�L��/��fA���J�k"y�E�X���{0�ܝ���d�abmE�&V�� D�y����L�z,`��e�џv���(�^&�R��-5��_;�����]&|�j�7� ZKv�*U���V%�Ҵ�r�i��fr ��7�ǃ㆐�iH���ۊ�3k���.�{/�����y�z��\��L��c�]u�tF�<���{��^T���
Fr;��V�����	a{��2�:��ا!필��� P^�	q�آ�[�y[��D7޵��Ui���E��Vg$�N�T�4����_R�Av��Md*U���w³�H�Z�{8���|K	v)�)R���kmϓNm�I'���=�f�ix[y�/`.�}�<@e�)�G[�5*�M���r�ӊў�����?����ܮVJ-O]���b7p%w�qyY�7�(}��bo��<ƉE�߻)��9-x�Z�<�?%&Ec�ZV]�!]iV�	pÍq2��NZ����0�)|3�����c��~���昻/׉����m)!(!0�p���$���$�I񴒎-����aY���s��]#�k��_�	��%���h�M�ϧ��n�9�*��e�"��q3ģ�[�U�ol>�b��a4$�s+7��H\���Ώn$�������$���/���ܬ��4����<�a����1�h�R�׫T�.\>1�s�|��&�����8"�0�6�Q�y��H�#��!�L%:Q�	}�ka�';Q�+�(uf��|�1���F5hH|4�Y��y%u[9�n0P�>?|l��A�����*)�����;(��A��k���Fz����+5�1�M���gC��9{���XÅ��}��pY�\�M��1�����LIc���8$�������7i,ݣ��^�12R���V�~���~!\c��B�7&Zm:�Z���o;�Y5u8�^iQ]���Q �$�o��9������N{ۃ i�I���3fA�X�s�������)�P�h�J�e�P{� �d ���r��w�J�eW+���HxI>�Ҿ�*������q]�F��X�N���ʀ��1�<W�~�����ySp�(�ߐ#�<�p8��3\�i�Q��3W�n�w�ʍ���.�E>)��^���{+�f��_.��0�p�j7�Y#E��2/��P���ƈ������W&����:���S�p,R�K����mrp���|��(�M�__��Y��E�$#�1�LE�J�����m�Hx�#�m�n������6\�5e%����y�ۂ�r��h�G�����Ǵ�����[ymX���u�)3S$�7���r�
��_|@��Tߵ��7=_��@��ܔ½��ֹӚ�D�^I������7�B�6;��E3��P�K�B�%��:=�#m}�i�e�����F�S�?6)u*-�}��!~YG�7�0}��I֕GY�3�E_�p���f�nSb<�0�ڮ��Kδ�s��154-=��@c�<ˠ_�)I,�_�I��K9�J	6�Ii�=�4�e�ԗUF����Ó�a�>|�X5--|��:.��`�p�į�    �LUk�7b������o	�Q��F�l�I�m��wDa�:2J�F���<�zR
D �S理��j���@%j��EP��\b|���S�&0U�z��Q���Rn����<1��8��ѕ��{��O|\�O�x�����u4���jN��&_!��3�������C/t�u'�b�<��)Ɉ��l����y]Ϸ�\�~���ƣ�����D���}��F5�}� C�+�����t�g8��oH��^ɐ�H���)0L��pY�%<�1�|�A��/
�(���:c)�J��S���#*)����l���0��>�
� C��ohc
U��E�B��݂uX%�n��xJ*�S��(υF���c�"VҞp�Q���K\a�h�*l�Zk���{%���ޡd��i��jL���������(�a�3sИ���4{��EU_�.�ԏ_�!9�S�#�� �R��SR��C)�z9�)�CU�Fk�]y��22Cb�tR���"�{�0sf�����:�t^;�� чD�v��<���Gk��CU���e���#��� �dJ	�Y�3�/`�]X��.��X�J[,Xc��N6a�8�>�L�D�k����J"ZwNZY��k'��d�qp�����DH�z$pa�7F%�=�<VEj��4oњ��R���E��]Y#��\�X#�BJ=�o��C���t�#Y�W�%��H�����2H*Lĥ�#�1�7# �e�/	@i��P���h!]��A	v�OV�7���#]Ã�A���Ftk���vp��[0��G�B�)� ?�hݿ# ����$�C��E�޷.A��wr�EP,�P<���!���l��
x���<_s� u��w9A�䓖��iyۅ$Hp�h���uM�bk+.�]��kʱ܆$���ip52��Gk	�DjW$of�W����HL(vi'�\;[�?�:�,��f��QΩ��J�f��`v��������Dߚr%��{y�%e$8��4�17F%oޓk~~M�|��[�zS��o����1�Rɭ�9]V����U*	�\k�T�8��T=�����k��?lev���w��ޘ������bSiň��H9j�>�2=�S��>�f�L3�rRBrn�H��7�� ����w����O�7��
�.O��}" ���뭑���Bj0��F����5ȣ1�C`���j�|US;u���o���"7�]�O�v��Jz���� �}��E���eHΓڪIklC���&nR����|RcʌZh���t�ؠ}>!�+�iȬ�w_����oL��Z��}�k�S�X��Tg��D�j�>ˀ*�ߘ����\ۍz�iː��#��C�� �o+r?*\�O|���J��d����-e�Av�`8���-����E%*7c�Ǌ̉������H��P�i%��ܽ��`9�$�*�ׁ$�����M}��n/vƻ�<���f�W'\�]x���Uم;y�A�<��}���d�����'f�Z��&s����'�S��{ׯW 0l�D����ܻ�Vخ��-y`d�/TFl@�C"0έ���s���n�=���>�Zc'$�\K6�݃+��� �ۉ������=�����������Dۤ�w���wF9���L:�B�X����7��;���+��T��[��Y6�R���<EB�8�v����*��Jq1�i�gt.�~XB�MIQ����{v{\�o��l�����Q5��o��zH0��M�����|�"�Avfv���y�y&m�#��c+)]�ؕ_��O�Ī�UJ�"욉�I_�G!p��w+�+�z�=	���z��л�泬�I6ZY_�^��Y�Y|P��Z��� �ao=�� #�����_N�w5}!�d��*M��]~��� �1ks��/�L�'��>o��#0�wD�{��omiY���1��=_��*�q'�����Pm�#'�Rv���^H�'"o�Z�Kza׺��C���^f�{�5��om���K%ʲ%�p񑡅���N;���Y������(P�<B�d�zS���߅B�wZ�4�֙���kn�\�����م��k��D�i+h,�a�^�c^�d�%{��e.�I����4^�Z*e�L��N8��M���;�pl]�|�̓���Լ}���vrM�y�0Uᓾ&��\��e.��v�����7^/�F�J�G�H�u$�a-���.lL�٢�{T�yq{������=��E%^]�I|�ʥ��i96��˵��L���[�5���0߯Rp�����WT�0�o"@`�-���;(ڜ	L ��G`It��Ph�L9���=0�#�kȡ���t�vsM[q��=˔��1��+�ϘO4�����\�I<D5d�5VF�������d\O�QJ*]�H�+�S%.��͐"���u�0UJz��ɵzQ�G��16P�v��_�d]�'���X$�=\�A�JFq�D��M�Mꙥ���7�w�R>R�uD�81>�	��S0�v��
�SJ�w�(�M�7�N��8���Rx;����C��5���&�c5响�\]�[��v���
�R׾�.�W��m��d��;��$���~+(�}k �id��C�D[Ox}�$`D>Wf�{k��R J�V/���K}\u�����Ě\���cf=�"r���� 9_ 0\�v4ud�<Bڮ��F81m����ѻ�x{��U�Jzҧ�8c &��)��F �1Ym#]ߎ!��)�r"�9$��H�z�d��B^��&�m��o�FlROd�5J+->�����3❆������}(�ʉ=�^
2^P�ʫ~'��6��"iʹv��B����X@O�uC5�@1������"�uX)���o�պ��rb&�W]�1GgJ��L�I�wD��'��af=�����Ȋak�5_��%
S��:��x}���������
b �,���;R�,kt�ϊ�3�W%&9Z�����[���f�.vܩ
 ޲|��� Ŝh�W0��q��{b6�`�#��Q[2d��O��/�s�Tit`��'���U%J	�z���l��� �F�j��=��+�4�S��i�g�i����n�����?V��;2�.О,��]����%ת�>�wH�6Z����x�?.�[��D�'�S��Pqr@	P������5��?�7D����,Q��VS�ƍ3�I�	�A�}�Lӟ��\s!�#�}�N�jK���̔��`�];E��))�!2�C[��T��J��KCWh��И�$m��?�ڼ!0���Nx�Yi"�J��O'��O� Ì��t��GF�%S��RP��%*��e$���>BZ�ns�{��4�O���rԭ2�W�;�w�,�*9�nKz��"�ワ�xrf8�\FJ�f���P�Q�������yEd�1�'����j���>�WC��C�cPGd�h�@`8?0�O�Mg�`��=��XL�!7\�b%.��f�(�m^����¦��m䩰���J��#���̓�m�K�;�V�'ܦ�j����G��07DƷi�h�*g�v����,W:�dQ��h�?�!0�>*��4��Rw!��o�_Zv?�4U�*Q��ee�b��diTyi��Dt�3�p����К3��$i�R}J��q�{��9�PQ��DY�U������׼8�T��U�Q��ZC�flu�b���<d�z����L�|�e��l�}(���Yu�V��-��>�W�D\\*E���[��䢬�_I��(�&���cR�������O�rȷ�5'X�s�������~D�y=�8�,���u�F��x����<��^Ƒ���������p����P/�J	 ��e>��vT��zOgv����B� � ���	�[|%i�W�+]}�Tl��WF=0�1I�;(s��L��E���Ի�m�}���=7S\��Ĵ�f_��m�Z��μ�j��v!�}Z��#�f�"�0�qN��M��,�L�e���or�}��xbL��B��HG��k�v�;��f�ח�ע���r����nl�.V�H6�n�(!,t��/�Bn���CmI�c����    ����P�n;Fa�q7Q�k���U����Z��"���1�43�\E&��|��� ���6���� .W�n{݇�๓Ц�.�!}#�׌r2X�h�} ���Z��$�T��j���n� 0�c2Y,�o��f���%�	�v�Edl�<|��\O��[e
��ʫ�҄ۅ\�%ʟ�+]�$ލI'���2�.�p�i!�(�D1W*�yA`@�2���伏��9,P&����[2�_�V�r�70$O�)��c�7��:�K��W�t�Ӓ����H�.���':�}��}z3�����J����+[�s�������=7��ɥGS��k�`��]��ت}��J����A��������`m����F�6��1p�_�Or�
���lL�Mb�����YA�s��aK��X�D�@r�y�t�wc&����d6�t�����#�" ߾sj�G0�e �иqX���-��w76����Y���T��!�g�z��� g�@*�˨9}�C80�v2���{����j�P`g�:v��QSI�zB�>��)ɉ��y�<��Q��o��F&K7��x�=�G`���'2����k��ˮ� ��]��	"u=Sbh-U�d����B#͏���Л����'F|c���AQ�[vB�5�[�<�7��k����r�+���񟤘�y�`���&M�G5�?������̏�'�qikٝ	�^���Ո85"S�q�w��������둯��(��&�oҦH�2��i*�&���D\	P��PkY���b��-�;Z�e��*�닒|cz���'µ}㾬]�3�:WcjA�7�M�w?迁�Ub��.���`��FB}�e�N���Ƒ;6�[\�#0�I����7&�4}6&��F �Biui^O�^����~�+�.Jw��Q
���n�kr�T�o�G1Ȥ�d�O�D0Bj���w0����?��/C`���Qo0j���n��7	�i�-)����!���L�|ҥ�}i^�Xa>�Q�]�5��ޡ�~q`8=�0|2,?v�m��^���Z��4����|h�#0�VN4�_�}6��|鯇�Z��4zĹ��w��e���v��^�O�.�Y{C4П��}����%VU>yR�bܚ���C��ݑ��99��j��2/�%�^�^܁�WN(p����5X�<�*ė[|���	��#�7�.F�C��Ƣ`K!D1�Ŷ�sP�VN� ��Ҙ����,#X��	�7�6�^�c�ƅ���G{2��-�>=]	d{�w� e�R������.)i���[K�9#�������-a�)a��pbD@ c:YǱ��u���>.��������M���0��;�u�B���?�G�'X���s����y��s}��S��3r�m!.�����A-�ܤ4� \�>�f�@f�N`o��TA!0s,��B���u��\?�P]�����劺c-�!ԓ �Q�K䲒�s�v�������?��؊jZ��3J����ߴ`�7�m]n��F��;�� �DT�܈�	u�	�{�7]��{�E�v�,J�)�4W�u�.P�P�P&m�ok��ԇ%ߊ$�����q&�u�c�Ш�t�*��d�F�'+\�_�ĉ)��TpbF;&]Fi��w���껰9�ϊ�������Ui�I�.���*!0�J��-�z�*��u*�Wq5GW���~���H��#��!�Y�G7+���P��ӮS�H�bO�g��5S\�� jގue�(�kFa�������ٸ��)�B�]������u��騫�Cd�\��{`b=�1�w�J�eL�:)��p��G�X6�>���<�$�d�x��t0��k�|�A����%�+����5�<9=�G�(���o-��}���Z\�ύ��m`������/��[����?��}����������zC�y.kq�"9L�Uw�x�۲��4?����X9�P��l�}��A�[�q���0���q=�go��`䓭��+��Z�۝V.��B��3��.��y��c��`j��X�G� �qf|Z0aCz�5����^���3m��E�gw&{I�>�m9����9�n����%Cqgn�WZ��v�1k|� �� ��,�谛u�ġI��t��|R��cη��B�rŧ>ڦ�������_���;�w���������������K�E�N������j�� -�S��^k���$|�0�x2��rk����}����}6@�wFJ|�@ȷh��Q�r��[EQKQ*��du���v�>�����E���0TI'�r6%zO,n�N��	"��b����k�	�-@Y��	���$�a���������OF���ۿ�����Z�;2��H�s������ߕڥL7�����/���G���H�������C80g�E{Z�6�U���X ۓI�fNTK �D�ҩ�J_�!T��A͙�_��+5�(�(��T|A0�T��U)Tp��s���&�'O�e��#���"��ǟ�}��B�@n�	܂��^��S�_�`1��w�Bā�GI�H�(#�R0�U�A�WF��b
V�i�e�l���D�"Uw�i�����7a�*�˹U9���yl�װJ�!3�?�7|�ܠo�LO�X��=��ѹ{���w(���Yƞ�^~� $�� I�^&j+�����ޙ[�ō�����i���������<��K�e[hF��#7D
c����M�7a�G�{%`K�Qҝi�BM�ю�ɿw��乡z���),�i�bY;n�FWٞf� �~�u��v^>en�5EN&0L]�\@��Gb!7���JdN9�~npg_f�5���*G�H�xjh�O݃�z�SM�_��,
v2�&��~%�ъ��&dH6u��fǙ����A�|^��Hy�t"��,_�Azl1�z�fEy�Z���߄��:X�l#"��
=��Z��!��D8�Q��!Йs��+ s ����%���Cjյ�J�-��7AH�DBp�4��}����o�zU2�Vk}����ӳ�eS���4WQsG��RjW-�i�I~������b������+�%8�'��C�N.)HN��_�`U��53�i_�'G�|;��Y��3&�@4}-p�G��5K�;��?�͟�* �� 8|�e������}�QZC�)ѶZ�BD�I�&O��F��VS�ɟf��W�`4Rm)�,��	�|B��bz��J�D)(վZ��r!��ص��j�����O��FS�6�6~U�B�)tJ��B:*���?mn��XܥŢʉ�M�V�^#�܀�`�{�!��-u)3��'����<C� �8��	e��h#� Z�R�������y�*��N��%+���ir���ЙC��aF���o� r2ߴ۪*��ڢ?X�	�4i�ѫ;�ԫ,3p3��!���M�"H4�c�Qk�.=�I���.�����I�1q�b �;jE��^�8��M��_?��ׂ�����V���"�cz�q�KЀYl���	�?%՟27���M�șs(��߻X��
2GZB���)������S|�ݤ>�s9Z6 ��6�@��m0��$�נ�P|�0p:ѫ�٢����9q��tW	!q�����gLop+�!���b��C��O�Z������?���� ����@�#zq v�E����H�2��}�I��D��D��z0�c�%S��U��q)V��HM1�b�r�d�G\�K��r��e����j����ڌ��>L�������_��#�o���P��C��ct-Qp�/�vQ��Wq��z�9����0s<H"�⪣�@��q[|n9��4��f��_��K|g��K�U¯�l��y�`���ĕzR�7���L�G�ȉT<�~�=Dv�����>%�X�V�Z/޹���Z�tPw��i`��*����5�n̨��7��b���ah�#��Q)-l��F;��ǎ��ٴ�^}��$��������0�׎y� 7Wi@2���.�Ji],��r{:�����N���wȱ"�F!����,��c���jM>x�H�d���I��B��c�[4�Y��D��HA���U?    �@�+�������q8j�݆���lK�mQi�A�߆!���RSc�i�$��d΁m&_�.M	����g���~1���y��[��R�������E��&���/:��������ډ}ͧ�x����'��˪�`f5�V&*���6R$Bem��Y�?r����#���w��� �)jgq����ݒ?2��������O��r��)i�����kL�>�GV[�+��Խ��<.���rL1�Q�Vk��tN%tßm��	���b�K`�S�9�յjj3��r�]i�������?����������c<�s��%؈�}/���Ur�k `�(X�R�ȓ(!��.�Y�PL� ����e�|����~��x2�It'|؉Owr��u�҂�ѾY��#0檦��I�L�yl�O��2Ne�P�b� �H��b`�ĥ<���"\�U�'���ON�>�꬛��X��G`r/����O��M�G�Į(�%���嶬�}�D��d�=�⬃Sű2�9f� �u:�1��7[���"	;�2�j�{�ʮ�ϡI+�28����� ��l�ZӅh���Yq��G	����N����!��̛N^��t��@7|;����/�dP3�_%�Ḡ�T�2��MB�>bsFo�d��ܭ�?V�O����'��Cc݀RH�5���H%����.d�c[� ��p<2	�q��҃=�����z�g��T�ō�)���#�V�^��Uw���5��S,%��{��W�$Y�A�q%\��[$�l�dږ�*��]<j�#0n��Nr�R�9����ς����<���U����&{`(����L%�W����:�������l����01p�����C��>����9�qA���?�J�>ɧ��M�z͖���Ӗ�v�K���H���P�:�'AD�U�����Aٕ|z ��b=R_��[wA���-��
��UR;u����c����S�{��䛘���(k��ޫ�Tgmr}��ƉQ>�;�4c�%V�O,��L��>j[kG���?.�>�9���g�6�u�����
�*�>#om�^�Vx��ŵI)N������o�%�R�$���f��?�w�N̈cj���8���?�g�)Jܥݟ{�G k�x���5�Yw	�~lV�ރ�!����e�fK�_c��,'DI���[P��a�)��~�Y����~��lh��fZ�ՇO)D�W-Q*-�٦��e����i=�I���|��kEw��6)�K�s_O��Q@��h�^}.�Q��2Ł��&�{�qvW��p`�)��pP�ˌ+WA� y<��)�@�q�>�<����M�Z�T�ZyT����jm���^�{Mk���W^�ǚ��?k���nX��+��H�n��E	��f�zp����y��+���X�A�J�A!52�C��V�F��,?v��ћ��c�"ͮ��DU��B*��i:�V�����)z�[Z�Eo�/� _�d'��ýiK��A�.(H���	���`�T�sN��'�D�'UHs_e�b��s�1Tb���:�R��2�+(��6I��%����<|�c��n>���Ms��^c����ɧ7����2����&�}߶�{�	~9Ғ(�lXݚ�����VR`LHz6�Eb���۸�n}O� O"#P��r3U��������i�^�\�	��0ԣ�����#VN�o���}p���"��nHj�Hݷ:e�'�q'$�A�!]$ �6t�b*������Ҏ�������d��q��Cl�7���o$���0�?Ld���o�'i<x,�u��Cɲ�A߃�U�aj<Ҿ|��L��(����ص���}c�]���H����Ц���������z0g�d�T��K���n���Jө�b�p�U�Ŏ!k�b��P��Ы{g��y ��BE���#�w��(�`� pu㫄�N�{ޱ�t���`2rԈ�ٺ�I�7E�!��C	ʔą�v_�*��壷�\P&����B��Z	��*y踻���;R��T�.�n�� ��L��+ܽ(���x}�6/ב�Nl�먕 �~(���. D�=m[k��A�N����UTf	#oo�W���jQ�Wow/v|�Z;�GŞ��D�
�y�梐cԙ�x������Nt��W{��Pw�J{�ƻ]m�����{���C��D��'�d3(�T`ܟ`�%�˅�D���h�3."O����uzP�9PM��WMA�3o�Iy�ݯ���O�>"�������GEQ���.Us���j���U��%'3�l)�6L ��������lyo�ہ��>1eփ]��\.��A;&|P���P,����l�#0ENȵ!���S���5JQ�%E��eEN�%��K�z |7�����������z��C~�r��dy5����A��>֌�`L�(�Y[��Ǯ�'�����#���<zr��Ō:lⳢ��22���fj<˺�y`�X��&�,u ý� n�]����ޮ�4ngCLΏ�k��t11[�nW��O��$o�ȷm��~������\���(�9�1@�-�9Bs�>y�N�<�ɻ�m�%�����{w����v;{���#"z��T��edw{vSS�=T�u�&f���ۛ��w��dZ�fi��L���V�^u�ܱ�?8�^�}�U�� Hv�@	�}�Ś��*�c]Z�h6qc`(F�D+2/��C�j��)�dtA^�u�f���W=81��͡(B�"��)���V�:��މ��Ȼ
t⩜tfڮ�ѧ7��NW {sdF�
��MU��N�w�e�aF�e)���]�枖�X�|��X�I:q\h����t��u�P�y��Z���{���-�d���u����	��r�B.黀�^���#0J'<i6�q�
g��Z-+����j�պ>,�[����ɲX�F�����;#m��)�̨U�}^
��^ד7 �Z)�U�Q���l�{l7q�b���^��Gݵ�s�����t7Ȃ�2&�������"L'���&���u�_jZX#��嵯��ɩ��3)F{t�W� �{�ga�X<��YUR+����֚��N���
�la˘.N����{g`��2';񇞈cԆjM�P,�e�8��r�6b�{��Ձߑw��do$	��ڋ�}oťJq�R��׬���j����j<R�S�}K��mA��0d�� �z��6J���.K�qӴ��[vʞGB{�Q�����f!_˼>�"0�IQLO��h� ��<0��U��ۜ
Z��\ߌ���dd�Aɮ羛�`��MJ��z�Ƃ�U�H�ٞ~#W��l)�v\��Rh��!�)w^��~=���<D@1�z��V:~��{��Gڶ�B>�Db�r=Uʮ�V�[�H"7.J),{m e��%D������)e�G+z"Z�t���ʐY{�����m�v�k~�v���IW3JQ�ja4�J 0ugI�6i������G���������q���G起�@����cd��3�L�k# ��uǽ��`)gKB�H\�Ͻ� �$�$0�=VkC���J�ql8�$Ӛ�y=�#ǽ&��lo��P.����5��m��5�|����|Z��%j��M'�,iC��<kM  @,�A ��L��~�4�Iu~�ƓG�,�8�i����0R��/�j��j�����o���_z �Sß[v_��[ D��ɅWğnB	���G�Ձ�[�6�DR�}�6~\m;��R�����M��8��o�O�XN��HpM�G���YA�W�ɰ��\)��1=�2\� ���Jŝ�_	J��Z��s��Z�/�[�r"�?r�S70<{i`�#� f�������^�) �Iݩ��u/@Uoe�h����/岹�<�������W!�c���:���`��;�my�u���oL�� �)Di��һD��T@�C��tt�H�|���X=	��S�]�;��d�-�E�����Wkk��!�lÚ�
Uu�"u�6i�CY����C|��J���֧U��u�޺�zH�iIӸ�~�{�G`�#	��m�j=��˾�5��z�i�Vf��j    �_��-����D�Tӎ|���+Ր���R�v���.��%Сt�|��XIv'�#-$-�
*�/�{{C�)����~Ī^֋cpD\J'�vK=3H�����~�N^����G5tTԧQ��(�	�z�T��ڍRN�8xե6A��G:�p�!	%֝ֈ[��u�t��5�m.!����ġ�6B���0����(���%�����7���MȻ�J x<l�f}���O�qD�9�0qiV��^ܞ�,��l�$m�f�q{`��jFQ:b׽�w%8���wf̆o� ��{�듯���������6x�gݙ#��cؕ��R)�z��>AG���+���stmv\��&O�����s���
'{�q�:���/��pj�V�\Y��^�|�7r��d�g�N�B�͕�z��C��aɟ�@`��b��T3�a*��SR��d٧^����G��S�ґͼR���$�a�f�:R�I�+�PMEO�S!�&�/�o��:�U{�l\v�^�A}VS�#����*���H�"X��1��*F=]]�s�q�:��<�9����>ҝ]G�{
���#�{��{`�S���m����Bd��"\%���9I�����|�g���nO�RNzQ���	������j�C��PȾ{��#0	�G��A~��%ŷX6o���g�Y�2kd�v��G`r��v􃊜�{9����\��if �n�������F��Lܢ���4�B�*�޽��4m�/V8ͫ+�G`�!�)�芿Tܠ ��#0��U��,<�`����#0�O�W�4LK;���!��7SCvc��1���mݏ�8��R����^̧�25�*�V-�@QnW�y`���>t�c�����5��P�=�W���W7�>�ʣ9���[��� ��ݽ�P��-�͚��r�������\N�P}rc�]�M����JN�FF�Jח���ͩ|d�(s��G�KM"�d�Wn��\%�O��'{�6�+������1�҆����81"OId'�@k0em�#�7u�kWaVZe3�u�Q���]+$���2eu��Dfq��W?s�6�ё���1����R�h�f�q ��}��?�vWr�6���y=�6�4f ��d���2�)˾6�e4Y��ݣ��S+'��Ľ��~�r�Gr�9B�nl-�4��J��ZT���n�^�i��
6p�*8�!3�{��{`�s�xн�ĞKz�s�i��`��R��N#�����V|���Ꞩ<`D���rhͷ�V�Tsu_�|�=0��t��K�K��.����� Zרm�{h�{`�#��x�U[��JH��1T9T�]{�:l���@�eF�Ѻ@��ݍJ�s̢��b!Um�n{���= 1�sՌ$q(X��)A��U��[���S�c�U����3�NLyM�#x�n%� �y{�������3���𧥰G�o%(E�SO�Yg��I�d�z�|S�R#���ή�3�/�oݖ���*�_���5��+�Z��ָ�W��Kl��E jV�To?1�ǘ�	��y��ɷc|�S� ���ʔ]�A�������K����:U�Q�aS�8:���Ƣ�M���C��z���Ǩ�؍{�"GG����i�����1���RUN��DWh��?{�`i��x,n=�Z��!F|(5	")���Q�ӡ���SP�-([�?y`��Ӊ��
�}���d�����[ϖʜ���\}`L���с��@U=.	G�5�f�9�6W��#��*�2��Nn��G�ō�A����/u��w�:~պ� ��vWڜ��Eȧ��[�b߄����/p��Zœ)橼�9 ����z�r�<ř[!K��w ? ��d�q�N�Tg�*���$`�eVA ��?�끩O������+��;OoE5��,-�����q��u�0�g=a+2.� [So��F�!R\!��nX����N,�Q!5�W	��v�5�>��澾*�oc��#Se��IV������n?�C\Z�����ɾ�>��E	Di��_�L	���w�����Ϗ��[&�|T��^��)H�ћ��P�܄��d��[�G�H�'rJ*-\����J���*3i�Ru]����(�K)FRokw�9�\�:�YHSD�ن�t�64g*����(Upk?1c�L����* �^|�5I��A�J�ڥ'
���`��O8K�(մ�������R�'��`C���CR��>����a(��j����-Ƈ4҉G.~��m����V��\�Y7+��ƦƐ|]��D�Dq(��	����TWpK�e%�����属����ԩ�L��}]��N�1��~;�A`2=DO�n�Z��4;7��޷�Rç�9��t���U�:��wt���H���۷� �IEf�9��U9>A�C�+���%W;�R�)��������M�4z���Q pc:��A���cɱ�M7~�?��4M�m�Dd@ʬ	u%,��E}��Yq�9m��~�EIo*?��HX�e����LhyS��͒���`�L}�3���Bi�{ݡ'1�ޏ��^r�[��?�H|�)��o�'�TNܛJ;��8ey� V��	��6���@�EJ91w��z|��\����F�ڿD`�Q��d9�fYI�-)�4���-܈�Gs�w�&���=�Z:2B�)D5���2Z8T��������/����8��X��<�U�W-4���-�7���
�)��\Nv�(��3� nEɻ��"���Z�+0۸�켁q�Xܤ�=�nQ-%����;v��^�r�-�?�=Ί,�$5��7�,3"y���Ԏώ3H�i��������ks�I_���y���ߩ:)���a#��Cv��oz�l�aF9 �ui'w�-�����`H�A�Up�&���e�=��z��3���ZS��1Sz�>6�l.w?q|��D�d|p%�$�_[�~�=��|[�mUnǶޖ��DM'��eqH�;���67|U2����2/h�(��t"UbT�������X���y9����]��M�L���H1'Z�����F��a��kr4�;~����4��5���Ae�
@Ӏ����Kq].���w|�����)�8�0W� L�~ٱm�����Ň�]O��rYc�i�jG�� �6�L5��J��&z`P��;j���2B���wShk�J�H�=�t{c��
�������w�s�Շk�u|u�Z��������?���z��V�i���\�D�QK�z�,�����g{D,�h���X���kD������������7��"W��(۠�l�P����S׌��2�Z[��I܏���;iǴ�-�XO��)A/��^C�dyS羾���7� <�	n�����q�t�iJ�bӮO����	�a�Y}b �_T���u�]-��������h�d|P�>��VCC�1�Zi�������M2C�<�����ՑƌF񞃶��Q��@�OL�ȳF�ar#�:c�~7hjo�_�{��#0��V56ɍ�WL��[��B݃C�>h�3X���o`2=jEON5ɈYbع����o��&�yS���������cT��퓸�_Ԇ�QP�.�C�pv���o�QiFa!�22pW�N+�n�����'�#E�M������kR�}�v��Nsn/ؗ��|��)(K'���
������nG�!딥�=����ix��<b��Z�a��.�)�*-�|�%���w,!e����c�Ϡ�|�����Q��lSv���|��J��Iݙ����LH�źw�Up�F�,��$�SJ� ��F�΂o)�M*7�\�V����z��R� ��R��Z(�=\�~S0�@��c���NL}H,��ÿ�Rr�4S�P�j9j���T
~��-ց�d�k��k:x�ֆl]]�ѲG���'�R�=�%��*!0����A�I���ն�|�T%vE)�Nu�x=S�n�͹�z��d��]�P�W����8X�G.+����m*�#�z6�źR�)�����!�de����Zm���л�������ůT.)$�^ј��z��}f�8�>@\x���    (�Y��j�%P2�C��u=ȯ�S��'��k'��I�LAjƺ\@�
�Ӳ������$C�<x:�I(��뗠��_M% J�`�{a`("0�O\�5r�T�j�*uC�Q�*`�������˿U5��,���Ć�(>�%)��Gv�ˍ$���[�y�b�vT1����{2|�^a��ڬ�վ@�����Ҩ��YGȶ�*�|��m��^���~}7�|�@r�e��
&c� ���}�Bs�:� G������|��I��$�cQ��O?'�����g���r��	���(''����z�����M�>��};`�;
���7��!��j����$�j�ۘ��(Ad8��5�,�Tw�� ��Î*k�v''����2�Y��ߴ��M�-'(�M�ǀʣ�l�=^pҜkwi)߾�%�(R���n{���mr�i�����j�{��p������c�B2�#�:���+�>�{�ԍ_�{^nW��'~���t��:�7ijt��9w0��~�}	�܎��u�43����U�G|0k��I��J��d�tV�d7�{�산$�$����L=��e|��Pz2��!�^�/��w_d�u�P��XQi�zm�}[h�d��J_�w���C�n�݉���o_~E`$=	@����Dw�hI�n�;zm������!@��dl'-��������m|Ze�˱��7�xw�������hv�{%�%|��I�p�8D]lȿ����o��GL��Mh�������z��-Zث,|cW�Ƽ���Q�#;�(C���N�Vŉ7�{I.V����&��Gc�'����v��3�����f.ddN;��5���P~
����Fm�Լf3@p �!�
��h��/�]�$0��+X�'��O�P��I� V����Ƿ����*�ر[/�K���KH���%�=��Ɵ}���~��K,vu���whu��c��cp���������2uE\pOu�����;�X�4n�������Wz�{�������t�P�TV�q���G\꓍���W������l6�\-w�B6����u�cS�N�)��ȶ��w&µ�HIm-�u=I|ס�(�� A;=@]*n��i���%,\�ݭ5�y��:� ��ٷ']?��C3Ľ��|;�ϼ��
 �Gr��<����[��֘
s�U6�˅޸$��r"0�+m-JaL�}��>��.厠0 ��Zc�)O&�'��<Rs��@�A���H1�ye�Y��n�z��I�jt��A^q�>��Os�(��}�{
I��o`�<Rj�WidpAw)���(��� �4Q�cN��G���@1'�%���6�w��Hm%�28d�=(��=������ѝ�C&O������38W�\���ǔ�����6��s$��X]rABɽ +���$_*��#F u�O$GmH�C\�� e��9�_�(q~��Z�@8��߉���R����B����m�/ �|��x2�28��Y�;#0�ϡ��S�����>cO�B'� �5���a�/+R81'f��V���o`$�*z� <Msm�e���s����x5�?���O"�G�ns��f�5�F	81>k�ͱi���@�_o��*��Ov���s�;Ұ�:�V(��1.�F�L}��t�ފ �>:�E �D��}$���z헏�#0��Gp�AUB���dܝ����[�tIh���q��K|�@"-ˉ��s-a�]?���hy\�����w��NN�oZu[)�:�^�/�PU�a�����d�987w	�jA]/��+�0�/E0�}��=1�ɣ�XV�:0����B% ��q`ޞ/}�������`͍or���͛��Y�="��Q6��
����RO]�.Wk(I�<���v��ճ�ܸ�����>1����iu.wiF���`�FD��5ߡ�ܧ����
쑤��I]HK}�WB�������ŗ�x������F�q���7\�e��뇣\o��}3��
ǃ��G�c�/M���n�����`���3̻�2�� �E���z}��B�%��c��V"n_ 0�p�#b�i{����~�(�85Ǟ�R��I�j>��޲{�N�o	�H�I�K��5�t�}���O*1���X^�"��,��'f	��xS]�xQ4�'�2���}�J$�����ή��� �f��yG���}'������-�<�qE��V*��ZBu=�!ǽ��9�w����p�mۻ�#X�}��E.�O��ݵo����P��T�eq-�%����u�Z��VK��XA�¢��{�	>��FәUO�]"�y��IJ���hJk��v�K\@�@��4�[�������]@ߚ�\�(�N������v(~�vT��D ��E}�=���&ߡ 
eN���t�����p.Y�I�%�:w��;�r�>��v��d�^,��k`��H'�AH����z���k�g�Kb�i����+�&�Y�N��Z�F�����	(Щ� ��(����_c>�j'O9%]2�70Ǯn�85}�(b�x����dzLR=yScro\WW+�Gy�!N%�ȹ7��}�����!'��F4�Ŵ����BﳇsqՊ���D�3V�����9e�R]O-yf`k2c��Z��xv�e�ɏ�����౐����Ps&�����F�e~��Tw>�lܤ)!0�,�i��6��z�V:}���	W����ۖ-�m�~�?�q!PO�'^�	{F3�%���nK��k���ᑺ���J��H A���ȭʫ5S{��4$\^G��x���c̆'�c�uT��1H��=�dhy�I���/�����R������+�B`k�E��]ǒ�ʽO��C/	Oj�Ř���琰/�=u�3l��Oe��{/�/��Is�E���II����5�ٓ� OڷS߉O>��W^��9\�2k`�G��&��o �>���ɕ�4[����p͞~��z���6Wn��������_kp�1�9̙��oRn���N���K��^y�ƒ�ύ׉Ԓgi'3�K���]����+0Ձ�s�����:!�o��d�&��}C��̷FϘ�8:A�]FL�A����!ߩL/�'��E����G|MuR�Q�*'?@)�QZ{+!L+k�Ώ�'SGh�_�il���;��m��h��K:}}�3=Qh��Zz�ΰ���C���Zq�߼�!@C�ϼ�;)"����9�\C�dǨ�hj�WJ�\{���"jXO\W2��LOc��,����=�-"Ǵ�k��b��$�Y�Tru4f�!s�k��j�1�A�A���o����4W���\���k��v�����yͤ���I�xR���ߐ:5K�ɤ�Or������`6��O�.��%�������R���0��u`�w�M|V� [2�٣i��qk;m��^�}��_�ч����9����$l�G���ܒ�6����ŵ��U��~g9��� ,�'���v�y��o��ۢ��#�D���&����ȜXRw���3^�ZT��������vҘ*à ��>>W��v�g9��,�� Sĳ���m�1��ã��ӝ��QW�-�r�c��W���Ӓ`��3����8{IF���FXы�>�0F��Ր�:xVڞ���&��eц������~`�G��9ԉc�&�=�DCfO�ٝz�^x���G�v����SX�L�X�M^��DQx'�a9Nbd�����p�
'$�͢�#U))�Yi���*��e�]_0���o9	��yB��}t�=��T���<w�^1E�n��D�c�-k�4G[�Y�dN���qV�c[���%����jh��])b���J=�*���)�����vԧ��xb�=@�����"��ī8�k�;�y}�f��9:�������h�)��&�/ͬtE��a�����]��+����1f��qN��.�-���&��r=��W��Bg������,��CU�Ӓ�~�������xf4��ӊ�)�:��!f�c�JZ�~��K����wv���%g�1�5�xfe�\GQ���.�dz2ɑ_���Y�h�|��m��!�2�    ��1.~,�Nh�R�(�++.\�<����4��ݜą� =�z��ҡ�2��{u�k�� �#͎�7�0���G��B��W�1�54_Ut�Q] �c�����wT�9�A�A�$��a1S�~��8���(����x9pTBf)���NEc��N�!q+�ro٫���a~���XC�(|�8��[jB~l��x�� ��qsr���ܞ�R�$r�륁�4B�kOݷ�40����$[#�\�q2�\D��n��l#/�m�� �>�3�����+_��p�G*a#���X^F]l7�` ѓ��ٲuN��n��AI�#M�����[ �DG/��pX[is�� I[�B}��������#��kvw�.�%���)m�%��,<�d*+��Ţt�sw���u�Bt������*3\��P���H4�B*��W��6v'��$���.���~n���G��I]�c�+kr��Aʩ����G�\Ɔo@��1�PO4����ڭ$���XP�"���R�x���D������l󔛵����Y��d�A�G�]+�y����@��D��a\Oz`���b�z2�C8��3���Ο �z�E;�~x�-K�:��;�0��F����08zY���vW墤9yD����d���	��k���AR"�1�$'�l;ם߶K��MT�q{�sX�p�������YO�uՃ�b����^cM��6-OQ�_��`�>��T�e��:4�P�fD?����y��o�k�A	M���n����}Ǆ�T(W4VO��a��Z�>��h�q�{P*�>�c"I�:0�����^Bvm y�ѯ�$�? ?�x�t"<6p�[� �=BG��Ѐ$��yL�� P�'RJ6x�<� g�1a�Q��ce�>:��	^���x"9HJ^?��H�k�4[ؔc�f�W�`3���4�O�Q	Yj���R�ف�����L#�V��R�`�0<��\]�֚I55}agM]���c����7 ��a�z���	�g�	rX'H���=P��p���NcB-��^��~�JMf)5J�C�m�ދJ��uD_'w'M�eufZ5-����d���m�~��0o�ƚ��5lY�8o�C+�Vڽx�Z��\_B�����xm̲�ZM�����N^[��d:4� z�k.A���i\qi�c�6N��plz}��h�6����&�H�60R�
+5L=���0v���tз��ؑ{;Z�ะ�e���p=���8�Z	��^�W�B�� Wj�i^/B�;����p��,u�/@��0���Q�!8�:g�[��Y��͔�X�[[�ۇ��� �� �����%���xe�C_*S_Y&7���WR3�(�i��:�'`zyd�|�'�b4&�|��S S_+5��C/��N@���I(J�:�#�py��T���{_`�Yx�|2:�`��B(�_�WJ+�^���5�|�����9��N�sY�%�-�!��[)U<|`�;3ܝw^`���+髍�i�OC/�;$޺��aL�a�$�t��i:�zۚ�Z���z���jK����w���0?"��8����3���r����PV]���F��X��O�&t�ֱ���ڜ�#y�噖�r��v}�x6"%������y���
��%�3r� ���K/�{�)�ɨz��{��	i������n�w�0'1���/E��r��;�̶��2p~���N*쟳sk��N���~.�dǬ�]G�J�~�Z����	c�x,��w�0�ha:��Geg/[��dI�d���6�7���P����	\%/�yx��!���.*_�����w��T8�mk7O�Ð��Ϡ:�#��1�?��k�N%혲�tFWv	�
J����-��:��	�;O�٫��%'��/���K�ǚw�����b'�#{������JT7zz�꡸Q坝�~�����3�z����4n-� ��i�I*:�s�5���C^*�rdL^@6��n|��ƈI�1YB$�\���>�d���� �jI8S"i�ŵ�ְ�l���S���)ks�Pd�y�k@<ڇ�����M���^'n��V=���֢"�,i�f��ǥm6]���$��\��n�.mGOԔ����3�u��ʗ�}��OHt��Z��3�����cr���j#{���fS~�>�����bTΜPͳR������IS�b������c<��lr�OHܣc*б9yv����ؗ7e�� =���Ri��xY�*�D[+q�<ڰa����C�/0T0���`��ULc0����?���:�x��)+��O�e������e��^�g�����{�~笡�i���X���G����O��������{Ɵ���������`4z��2��ɺ�T6ym�%n�Bl�U���y������a`8)�Cӱ�cΡzS�D�՗2�f-Թ^�aR�x$�#|�Z��O5��V5-�Yv��:���Y/��[?��S���L�AU��{B��߲�����h�?e��
a�����"�J�&��ۓæg'j�%��Z ��q�B04̶
.H8GG�Ֆ������o L��H�I� )Z� ��?l����Ks꺠,�����0�s`<�hR�h-����̸ǎ14�i�����`���N��ai�o�bw�Ι�{@S6F�;������w���Fӫ'V�dX
�$N֚Ӟ���Wp�������Qy�E)#��1g�U�@NH�h�����X���$a�y������>�3�n9��`:6s�빭E�.�&}"9�V�	�2�f�8�*�[F��	�1�fka9�/*NU�y���b^
z��
ۏҔ��78J�A�rҢ�A+�����I��!Hb!������4F�Hб����f2
��F`�Y�AE.yqazP��4��U�ϲ''-~����L,�5WĘ����[��\�Lj� �̪�XX��0��I��4i��8��w �.�����E lOJc��V$%�*�o�����%d cd��'�ɫ��8J!~_w�l�j��^r.s��:I/0�^Bb����Y����j������z�l��iiw�>��x����=���ˬ�E�0ǥ��dq�9�Ԯ�����_`<[3zAp��T6�����F�90N�8�j��b��"`���,G:I�*��B�2Y"�h�TxxM�ӌnH`��Z�I�2����*�-U�!w��<Rhu�ܶy��K%��3��iN]�JO�����F�>g�^\#w���݁�� �JN̍��z!��u�o��[���<k��4�L}�ёB(5��#4�3:��1�)��ܘ��Z����cG���yg��z�R�����r���Qn�up`���4s@���9œ4�����	a���O���~X�,z̓�ɫ�r���V��QFJ�^+^�����/0�B|bU�%|cgM����
���i��x�-�w3|pq~g'tы��8��F�E��H�ݓ�/0N|�ΔS	�f�"�x�q�Z�汗VZ���
���8���f԰4�9r�pf�l��h�(<-l`w��Ƽ�p�{�]�ڪn��wM����{1����w_:|p�G�=藹�1�44^�l�d��t�*�Y�v`�{MU�J= !�L�)��ӻ����IA�6���{_`Jy�6���Ք�\Je�f��@�9:��&Ck����?��hB�̐8����Y{sK��3gry[�}̫��j��I��f؝�IKy=�aV.S�����Csb,'{z��#���'juh��Pz\N}�78J�;TO.6�a�p��'����B����n㍮�Y�RR_���f��7��D������	d�`��o�y���\͕G��K�PN�H��y.��Ez�� �H͉79�>�Q2�~�ă�:��S�4��2_>c��Ş�J'���Kk�4%��c8M�f-k_�Y�^9�~I������Ƀ~�2��-�$�0�95v�|#ՌyW���&�D�$'�4�mJ�X��yє�&K��������`���|�ɺ6,'1�x�- ��.
G�Ac�b�^_BB�A����{�ĺ�RR��ѓ�����.�P� yز�ɛR^cN�M:�����&�u�%7�Y��r�3�Õ���51uk��M��?_�����nu�(��߭\�#3��p���6�T�    K�
��� <�,��`��,�cB�8:�����%#,ƾ0�TE8��l:���ȉ�ٵ,yI��h��l���uU����{'��������i��	��I��%�]���?�k�L�|D�eP3��ē����knUm�_]!�EKU-f/�O��4�n

F�G�L��L���x�M�~�B8�|����x3�O"r^k��7���6�,���62������߮��4J���!=yɜ;@^үnn� C�`+�� �ҔK<��1u4��ȸ� ����?�0<^��xpZv�WGlXQ�E�#kM������>�@t�T���O��<r��yU�E��+`�����Ha/�N��,Ě�(�4bl��K�Ʃ��:�*z�����<h��zƋƶӞ�T�]�v�u(�S�bp�����O�Уv�81Jl9�[�ѫPC��Q æ�o�>�P~D��<���1���гu���������������|�mga�^���L<&6���U0������'���:�1ֳ�� ��:��Z�=!�ӊg�op�8����l����+�CMTG�21�j�0��;潁";����Ѧ@\㇒t��k_k/?�W?��	5�l�O�?lZ���5Z.WL���I�HGG'9� ��
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
eu~Wz�`ˆZ��;��F�';Ɣz�$ �,~r(�.�V��'mc�����=�,t�cf^^-���2��S�!��Hp3U��WJQ�G��]��6�j�dR��sP;��[(�wn�`� ?��|�)Sǘ,�G��S�T<W�9��]>�D;CE=�0���n��+鸥�^Bf	�\/'5[�w3��>�Nd7pݾk|>�v��hu����J������fC,{�V{��p`)�/�0�̌Qve�# ������POr�̥<��{���=7���yŲ�ｾnޘYZ��9�:�N��iQ�2�Ս�G�o��? ���3�!�o��BZ�h6ȴ�T����a �[�Y)&� �$n�2�_���ะ�J�D�c 	C.ig�0Ψ��bʥ�毷	_�M�wk��=�I��r.���y{��˿m�;�
p^I�~��ɼ��,�B`���x�)Ç��J�!,���A?���a=���}R�k2���}���^.�r���/��#V�DFW�锥�<?�I��)kk)�yFFj[��z�[`��הOd���3q������u��T6�,�W���?��A_�X, ����s`vI���ós�+/�~��SOrm/�=5vG�Yjӷtl,h`\��30�р[O��0(�J��b7a�ާ'��W��S���k"X3�I�%I#�}f�P�v�o���j�nձ��^����g��b�44c9���R����X���A� ��Z����ם7�����%����m�]iR�ݮ��
�T��vڳ��HJ�s�%�S30Lk����g`J�����6[��]>��l"�U˶���u}�-�˧9�qN�Z��N���ÂI3j�״���O�?C襵2�)�KE_P�}��K�̩`/���7 ƞ`1��(qq@�t3B�.��s�4H/q�(W�F�LL�k>����4��=�n�[l��m���V����
R��r2�'����k �ŋ���kZPV&�=� p�[C{� �p\�*�9�6��6��t�񊲮�1b9���Ѿ�U�J��V{;�&ᡍU=�{�}}�~�=���ew8I(G��H}UER���}�؝]�?���
tb�^P{!-�ш��wg/��&�ř���b/	H��mU�:�; �w@�F�U_5����`�0�=����?&�M���y9����U�G�r����C?�<Z�� vX���������[*,��D���"]K�
1f�ȫ:�+E���7K�֒�n8:�]+��s�� �ȗ��EL�C�5�[ǽ��9��{�}7�yqA
��#G9�N���z8ʑxmP;{��h��I���HC��S<�;w~����J<6�6���_�������?�����"���Z�d(x/�Sv�?n���d\-�Z1�敽s?������t\��k�xw���$y�6)    ^c�t��m��w�<����8[�� Ζ��J"�&��']��*r��4V���tA}�J:H�3mgNڐ,{⩻�������h'&W	��'�Ͷ���J)n�}}M�H��&�K�]�υ���Y;�ZF�����J�[7�=5Y�I��;�'~&�ͼd9�ɸ�{ג��><�֥���P��f齮��`��)������Ĉ1l��ψ>�̴t�K}��aK�y�`&g����z�	O����L���E��/�P�Y�<��Ŀӝs���"�CӓR�;;!^���
���Gw����o���t���R�kxtm��o�K�L��?ҙ���ER�%f`�BP!:�ͩ+B������xV8���)'=�ktҫ�2��(�r3����r�u�S����i� *�j���Q���#Z˗w!���!���S����15��?�.�U�hۿ��"_�԰���zry&D��<��n�[��{�<�0n6�����`��}����e�֜��`��9{����X~/�x0%��Ǆt�?Y+���&��aŏL�y�5���x�z��L���N�p�W�x%?BmQN��eM���z&P���WG+��Luq�+�E��=&Yk��.z�+�)�������p�V[tK�TSX�������RN�W!@�>!s�IW
Q�$��o�
��[6&f�N.�
2�����dS�a� w]^�r���/�أJ,'�ȭ�:�/ȡ����D�^�1�LF+�ݽo��)�����"�T<'rJ�L|��%��Xk���_`4<��<�@M�D��|�Ͳ����D�_��-';ƣ��Co%j!�Գ`)fi��~��ؓk=�,�-��K����[�w^����z�>1��N,�ʐ><�FΦl�ǖ�q�36����^2����P�a�@Ck�"�fG�mq5�>]�+_����Um8Wn�j�8J��1�u �f�^_A�o�� �9p�ZpPI�޷�;�G�y�R�s����ב	��H0���*��u�ۏh�nۃ�lȵ�}�E�/�ԇ�I��Y<Z��]�V��m��vK*�ty�G�Z5R	O|u�sXi���q���JV}}��s 8<�����<P��dB��X��f���h��NQ[�[����ԇ�zV&;�̦g�2�gP,幈tnz;��w�$=ư{Mm����a�t�$��.uR|;0�����ғ��7�h���j��N#;���[K�%KT�v�4�|��D5�V��l�Q}��j�~;���2��hn'p���-_���<��
=���X<�
�$��;� &ncP��������!�~�������1	�[�֋���'�E�X�S��g`0?�]�I�i���H�Yn<���jH�W��J�]��"�y�W{����ptV�������D�r�����0�m�	.�K�6�Lpy=@�!Ƌ�Ї���wQ7�b���Y�kO�3��R��F2h�S5��B8o�����33=х�3t�7��X@�6B<Y�s=����_���~>�j�`�V��U���
��V�cȖ�L�H3�iu�\��4K��9��)[ZX�+����(�QC9���+E���B�É^���|���[��ϳL�?��Nv�J��YR�^hW_Ւ���S��g`By����I7U1nL� �.3&�p����+�n�0|���^���_�'-d�3�ݣ��8�K���U����g�HGڛ��@�ȣ�δq����G�D��U=�1��p�������K�&���|QϘ��R�`��zbN&xe���7D�����]�$�L�f���yo{L+ډ0am���S�*ZN�<��Ta�F�V�#��H�_�|��?9oǠ'а��'ö��{�u��m1�lO�#��,b%t�`�0��%5*���M���q��"G�y���-��6(M!hC4�;G����3��X��be�VO�b*�a �"�sT���g��S[���D;31�}�d�Ȉ^��H�ҝ�1�$�[3���ן$	�&�+9�GX���Z0[H���L�S�v�X�|�=��HT���લl��M���sj�l��9Z����]~��B���*��`��=R��A�sR�g�Ngk�v����W*)����7[Ź��'��ȫ��{�=�>1�����ɋ��e��hq�r�a�[�xg�r�Q�8J`*'�r$kh�%Ǆ$ڼ�z@�������q�+�У6�I���i
�;z���JЛ1�������G�s>(��h˷�h��+�x���A�Ǩ���ė�љ���DA�8��j�b���c���ڻ��o ="\O�_��pY^8:�q`dZj�;��Xk����פ��O��/ɡaGF洍g���A���7��B��'���w�7<��<���������R��w���� >
x�޴���W�=/4�`��1u-s��*���L��$'����ټH�a)�WO?���f�]>��C����\�,���i�%�V�%i5��麛���p�W�ɴ�SA��`�(������f{���oc�J��i�辷M�S����oM��gY���T��{�.���d��+���Qy�N*���k���6h/0X�hK>�I~T�[��ʒx9��ei�R_�2������QE>yq��<evI����I;[r��y�ݽ�/0ct���vȶ�n��Ӗ�`6#�˿x����a����Ρ9�˽A�2ۧհ;yIX͝����>_`�O���X3�Q��0-��Uu���p��^�7 ��������s~J1������iOZ�|��[��q�����-�T��uR���&�ե�z)C�]���tp(+{^��H,VD�FG��M���JN���
P������"��	��15��g���JE{X������œy�8��ʬ��z�噇�08Ny��]p��_\b��TO� �K�C�%�Cz��4K�m�6���G�&�W
���o�Mʊ\�=r
ǩ��I/���r���Gٓ^�<�T��:��d;�l��j�z�����K�z�Z`ю�3z�f�f8Iᱦ�6��?Fܯ@A9��M1᧨�St[��9rb/K-b������VO�py���W�z�YK������E���c���艈{'�m�%����zӸj��C˗Z}�	'<;�w}���L�3c:d����X,�/�s`�Տ�bF�¶;��d�0��Ol"�'K�pN�� ��UN��`�a!����C�.����`���t;���"�3И�VL���<�C�W^ꭔ�(�6�n�`	[I���r��"�-y*{E�WjL#j��<c����G���9����WY|!j�.��d�S?�Mz{�aO�'�yPڊ�4v4���B(�s��퇋t��}c/.�>\���*38�w��U�7S2�Ϥx�$��IBy0�ODo��ɓ��^+�y��d̊O���90^B����&E�K�2÷��1�S����ZJ�� �򺀕�O�����c��*HLL��QOO���S-m�~���`~��I=P�g��+zN
A��S���2^���������^g�$�ɺ�|�FG^���.��
OΘ��v9��m6�É��C���=��jQ�K��z�~`^S�
'/�X� �	R�������`K�+Q@�Nv{��>"v&�N���p\�8\� ����m֝����b�P�ԝXz�8��S�W5�֕SF��z�q���1��WN��e�M�i��DnҒY��4���=���8�qybP���N �9��5��jt����/�p�#Q[��Ƒ���_�ߌļ���*����n�1~�pR�|$j�pq�����mҐM$�W`_�����W�ƞtyk~�*��5|���d{�/Έ���1&���*|��S q�^\���0���:��L�k�ہ�7]g��}k�RMkָ�A�j�5=�������i5���d�f�,wJ�DV��c��l,�a�K�ہ�8J���,&����}�9bU�_��T���P��Z)��hu(r���q�G��b�y�Ī��y��c�Qb�o�D���h�,)~��kH��4jݹe����+    !�Y�j���m.��Y�<�9m�[7Y�8~�����(9 4-�9,J��I�~���ʼ\����A =yn��7־Sm��I(�25�Ʃ{$/������'�w:�k��e͘���N�T�{�����+�m�`��(�5m��e�o������J�WY�Ȧ�W���kՓk��ٿ}�����"�	��%�˧n����J� �J���������y�4�J0K��{�v=0��㏌�i�G��j��c���������� ?�%��Cd�x��C�9�qngc��kF�y�|���{8TOޕs���9nĉ�%a�2������e���۟F��q���@����m"�'W;�H�~>b�P�bc�+��/��k?��䇌��v,+�]R-J��S�	��	���F�/�-�k�� '�b���R���qK�������&�����-J�cihm$��r.1�֑��T[j˷�Uk�����X�ϓ�����H��N!�!�ݑӘ�S��;�vi� ���NF�Z\I1����#-3��ܞxQ��0Ñ�H��*��pؽ{g~��Y@�ָ��A�A�x�x �@.^�*�<tR�i��P��ͷ?���B���:�W.c��2�q����5�Aq�V�I��7ʁa|B�����z�m��>|U1'��`�u��Vn�K��0�z�K�6h��J\"P��Z��u��s����qz����$�%��d]Rj�ь�㥵�Lv�;�S�Ә��d��Pm39@a����hI5w4X���1z�j����3H�_BdW1ik+��}�m���o���Jvh�eYO�(:����(J�t(|Ӱ��U�_�z)Rv���){�}��|tE�T�@1�sz9}�Q���d5>yk��aC�����c=,7t�C���I�|z�哣Tg%�~v��:�3�@)t��Ƚ�>���xE@�'�����R�D&����G��3�����v`j�w����#t�-���7^�<!y�=S��c��z��(y�z��	����JOy�+�f�{YPj�D��r`�#�.UO�>��ŗ1�r"\�yL(W�"y[��rSi7F�G���#tiy��oAÐe�j��}�=1��oO�L�FR���pO�6��z�4C7�&����7 �Y�w/�������m���N���[+�� ������aN++�M��Z�ɫ!�t;ZZ�NWL�В)7�,�ܯ�)�٘� ���U'y�<�
|�(-̐��F۷�/��Mj�O����Mˬ�|S�P�7&��e��P1����8z��0�9i�k��>A��p���8N�v��ko����+{i������6����p�;y�\R���3�}���@�s�U�Z�Ar	a��٫cS��Qk��]N��5@�$�O���?��%�ho�=���!�R��\��|,���'%�d����-�-f��@��d���������0N��c�gg�э,���p^��n�N��+��E�"��$(�m8G�:Gky�;*��.'�`z}�j�i����,\S����x�G������5���¯�%j<!3�r�%S6�^��P�&Y��=�ȳ�j�[�F������hRj�NBV�K�5�M,m���s��6�/�)4^C�7ő�/ދ6g�Cr"��W��E�����5��,�"�2�Ѭ2q��~1C´��Ԓ����7��7���U6�2��@D���F���69�[L)�P���Q?-|���mn�g���Nν�s�.8�Я��+vƆ�*<a�{�)����/
�K��\��]g����;c��աrҵ���̿ʯpU�^0M�NY��Z��A
}��V<i ��pv�iP1��3;R�[&�ֻ���u#�~��N",x�6�+�l~�^�����g2V�[���;�JX�phB#�].�S�9���2��M+�#o��0�}��M�&;�r���Q���.+Ɗ{��ʬ�*��S��"D�.�RO��r�!��g	Ǳ�>��8f�|���̫fz��6��g�J���$)BM�cA��9�ݗ�/0��5�9x������MN��S���vҢ8`EK���_3� =P�\k�YƢX;:{�o�	����[/w_� #O���x���v��H��5']I�]`ʌn�q����Շ�>;�욵,(��QC�!?-�Ҩ����λ[�^`<��:�:��-�^�{�x=M4���e�&VV��{�_`��D~�t��j� ��;&F�^��R�����_1�J�ΆJ�8�hm���?}S�kyGn���z�9Gѻ;?��S��z�xJ֊@%��Q݋��P��S������
|�x
�"����?(fIW�:f�~`8?
l'�e���\�R�ib�����phKU�0}�J�fa~r.rb=�p�qK��F��$�5�������D�FG��n$�-�����4��LUsy�vw�=cDטЂNxw��S\y	�(WGO=�Z�n�#h?2<`h'�Xk������d�<=9�g"�Y[k
�w����ǑX{��U9Q4�V�f��!#�`k�嵜dU�mݗw�}�1O�<f�.�o�+��gp���6�=�~�zq)�8�('&j��H���<�B��#�T�`���μ�����y��{�U�~_�%��h��P�4L]��	�k�N�0�+���wS��ڍ]��\� 8�S0W= �	;4�j�ĝ<����*�h�w_��� <����y.vZ�T��+�%N�.��e�`���� ���|�$���*#�٪��02sZ�;�zx���L\���9�w�Re�xBi���%MsB�=�m�/^?K�(���f�R�H��G���kt�:)'�K�r͉�jo�S%�ɕ��,/�K*�NMm�ܿ��ר�9�7�������NZf:7��b���(s��̀�/�Ƭ�$�=�j'��������9ٮ1Q�L���צ���'4zt+y�;y��\���������4'�	��伆� �{��',��gZѸ�^
9�(1�Pix�������|�N���xr�C�i�������x��Ю���~H��+*��l�WkcE)���MN���={l-^��}}���O���ḭv����kA��U�d!4?G͓�|G�g��X� '�B�掋tv^Aٶ�U�!BV`���ǟ��_�?��Y�_ֿ��5z� 3g2�·3�4M�m�F{�2��?��?���\�����S��>�O��o���f~"<�$��N��*e��SY�;3J׶y%B��?��?�4ѐp���IymH��g;ѵy"�6d�I�������= ;�.'<�	��6�h������r�m��˹�/T�����f.Mj��gρs��B�xw�S�U�zs�ok������g��P��n�f�RҶIK�{F,py���TO4�3� "�g^!C�q��<m��rw�:��BQ���RHr3��{<�X�I�2ظ���oO�����b�b2�${�y �'^��e�Ы8e=5όI���Z�1�~�@;U�j��$e�7b&�ɳ�!�o�%�����z��~=�B���R�W��r�s9����/�y݃��d¿�<�
F�zk�NÔ�=ݶ��*_=�0�k7�/��d�4N2C49-k��ī�-Cկ^�}��� �&��$}�w�ʎ���+p憯�"�u���o��X����7��󖆕P�u^�V���1������ ��p�v��1pC��qF�
�rj�C�F��fP�vR� �e/Љ*>v�4���OSc�&�5�/��W��m����,<i���s[%�Ca��guέ����R#�df:2����Z���-@*̴��5�È\�2�����G>a�^�S��?,R�-Y�^�i]�	\]�z����T2)'��mzśJ	��B=��/RK(Aк�R���
��Pr�1�0����~�rO,� ��wF�_1���+��O־8o��ܽ��eIn�*�q���Ĉ�-�R�`���_U���1��ƹ�VuU^Z�N0#ȵxY\���^9c��;�ք����_ˣ#Ԃ�T�O�{�YU���;�Z�A��U��x���aR���;�i}�x�i��<�b�C��������ѡ�M�_�6��&    NQxz�����8�
�{����a>�@�"�]WK�K�Gx� 3�X��~,��y=Ti?$���ݐ���mW��R��;�8�J�Cd�7$Zn��vS�tc��r���\!�j���5��̱��y�>�!E��~	���9^E*o��R}:^\����k9�_9���Hn�����fx��u�!uǀa>kU����Ɔ���܊�z�)�uS�ᵇ�P���y�Ѐi��-p���0�����j<����v�������{�� �/Ȅ��)x-����j�Ќ�|�4��	EgY[�&����j�vhM�f�Rċ\a�9��@�He�-g��K�L�/E�=�)��ܱ�Q=<���zR�qG��� s����a�4���Kk]h��8h�E�z��J�d0ǜo�}H�؇��f�%�^�Q�5'�q�����=�wp#,E�Y�����S&Փ�TO 5:�>����_N4�N?XS\�f|!W�V@�IJ�K�Z��Ҍ���ս�iͥ�[.�͵� �f�Q�E��DsG��Wwk�a,�#�\���E� H�{��7hi�����O�_1���%e7m F�+�SP$�q'(�n�h�0�����@OM�T�d�x�e��b��;8!j�r��c��{/3L�W��V�^�������K?���/�����վDP�"5�s��@#�P��m����`�6�y�a?�"�^�똫e� ֈ�cgn$>���}����=xa��nSY�<$�f�/�p�hwns;v���S�&?p&r`�Qt�3�������}�� ��uv��7�b�-�p��Gj�9��a'"���ߞ0��l��M��v���ZZ��ԩ(�GE�p���QE_��P�o��e.��c�~NΪ��da'\��þލ��s�%6<�� �%�}&NVvm���|Mm��W�����c����-ڷ`�3/l6�)<~;�,�op)$Oemlo�mFlq�6�Am�ߏ*qN���3�LD�֓�`��ĉ��L���d�u^���K�&O��]�Ӗ�t�T��n�-�0�m|}D~f��j�}�6S
bR�X�]ZP��꒵��>���x��k�����͓��s�[3y0"�5��ڻ�B|���b���ȂXU,���)m�OG�(Z8�o`�ė���p꨼�)�Sp�f�L+�ֱ�H����'���N���PJq����s"�Y���+�G=�Jpx�j�,��I�!�'ӵH��q��2oO��a >-��p��[Wѓ2"t��|��G�f��S����!�������%��H=��7��a�cU���/�P���:	VD�"�9��#�q�r��[������K�NĔ۾0��X&J�2����,d�Z�����0�C�&����{i�6˩�pA���C����GD�o�M0f�K��H_��o*��m1��K�*yv�S�ۋ�ʰ�g93��Zo;�z/�l�������R��%�"�;��Y�!�2�J��a��p�����aH>hv��v�������b��P�P{joB�;	�s\�1�NA�1{Y���&��t�o��ɛ_э�_lht�Z�\��g£#���C�˦@��v��^ޕ���@
U��~�ՠa�6G
ô~�0�dS��)���Z����}��F��l����mM2-�#��U�9 q/���c&דf�&��K����d��Ȗ��L���r߽�7��3ts��=���rz�Ȩ���{��������s�=x�1lK����V�p(Z�#U�7�ğ���H'�T�w�϶7��ޠ������~Z��k�W��W��F�|�Z�耕w"����O����rWa��F�n|8bN�sJ?�Y�ķp��_��~����Y�fei�g
�R�)G�zf`��<����2�������\���f�S��2"�����h�����/-Cو���F%l��_})p��҈�+�8��m_���2�覟���4N��皊�٦T�~V��~��L͜�z��J*n�H���Y7�'��y�#�l	h����	앰^�F�oڷs���_#�Ȃ�@[ӡ��RH���s��gػ�����<�a�9�Z=�^_��H�!�F1ݷ�e�HR�2��<��V����T�3�� �\�Sl��^�L����Hw��m'��~*ȏb���Ey+B�x�>s�8�\�(��j2OSy�S��,� �t�^�̡e�n�>0(�ruҾa��Ƅa�~��-y�{�E���Q^��t�K���|H��W�;���ШC��1�o�2�[�{d��ڼ�0���
n7O���6͊>i�,�� ͻ�M��i�~scOo��fէ�/��uR:2~ZQ��[II����=�N�bά��7�Uz�X%B��3V�Jq���n&�Z��#��M�,�MNY��Q�x{o�pi��1�
HE���`�
�m-�CA��mu�ƷS�0a�����æ����^��}W�e��;<�~{w�<%t�p�T0H�ԧ�!�QG񞝐���v����z@7=m�W��\Tph�[-�x!XA��φ�5�NN�����2���>¿Z\:%,�p�����a�>�J7��*Al��r�G��̈́A�s?LН�o�ͦaڇ�v_d\}�8Y�J#4S����{��z��?*~Z�+U�ܫ�Av���g��t-[��J��z�jA�Q݊+s���Dv6�Κ�[���9�� �������Ơ�:�ō٫�ס%M֘s-�Xd(ˡ�z�0�O x��M{���Cr���+��x�T	fx�,�ك6��ɍpƉg��W�9ؗ�G��6]f���dI�6T��Y+�=�R�!�`��e�ii� �����U��;�7ў���������ԕ����<��+�I�f�nj��g�<Z������v�mn���R�iM�y�Q5\�{&
��Z�q)F��E�X;�8���9#������7�����ōQ\?��5�{��z4��L��W3���k�[ H)a*�cf�y݈�_��֧o��l�����ʲ�rd+B�I��>\V�m����jnC1�vU��)D�)8s׎�)�ߏ����S���x4�ҕn�(���O:�`�ײF��Ԡ�=��Ji���	7�xl�Z�s&c�^�fq`x v{d&�=�6��P� -�^�9̦�Y����x�^N7#��j7À����"�����e`k�9(P��?x�a0pJJ�2�ՋT��zp�Y���pH�h���X�����c����R�{2w��qO��������Y�J�ݝ_vy�P��'n�ϱJN��n=�I��E<��O��&�*x�m��l��zVE���!AG��劭�;7�e�4�7��7��|�Pݲ�-�ByF8�t��]��'��߬'[lk�lw��k��a��x�}��6_.s���S��F�n�W9��0L�=p���H�7���n2�e�p���t��m��KjB}��VdP�m����Ȼ'�È|��E�G�uؒxJ=̑���	��b�re�|c��aZc�Hh7���t~}x�LI���|�UןE0~9��������z~�^]
n̿�f�S/hsx� �&�_w)�*2:�ŝDku��ҽn+=��)����?m�y�]��M�*9�xR!�(G�����]�v���[���.vݬ�R���Iffm�f�T���������0I���������ZzW�ҨJ���l������`�8���a`�\(�.�����2�ɴ�����cҏ2�PY��	�����g���SJ�`��b׏��M��ED��h�I̊=�����6�>��	�MT�0j��M�h�0J��ͪ���'��0��Q��1�G��93��zn��Ai]w��q�0��O3��bk��0�����)�I+7���=��eX���l��������-E��*���j�?��{�a4A����=%�O/9�Qx�|$q��9?�z^.g���G��\8_[�w�I�����{]l̕��1��Kh�W����=ˮ�F$_#�vܻ�(I����>F�&�M@�Nme�Q��y ���PA���- �F�S5�n�    rX=���;*)�;#>X;D�|~���):�zS77�4Izʭ��J�;ֻ6?�wy�
X�b2MUI����-(t�l�ǈS%K��PU��R&�5C������I�[��H�v%}�<�cЏA��E�~(-Yg����|���c�����a�6�Z��[.��%��fm���i�h�:Ѹ4��|C�iA�o���8[�����]qc�� �쯏J�����fq0���PN��Lm��h�YW `�g��|��/�u����}�m�����_��0�i[-7��Ҵ� E�й��D�����8���?����}�_��1��e~�"ɣ�l�*1=�Tg/�YL�xD>����h��q�����_�^�f\ʇ�eAW�n����ݲYa/ݓ��8O���x3�ڬVO}M�����B	��'�i]��(Ϛ�@�7�`s���#"��(��j�ϣ���qm&(bu5���$<H �͔:,�q��J�C�#�����8Q����ԅq5���7ב"�4�*,��ůo-�G�������"�N�I�o�m|m̝������;�g�9���
-�#����-�
:㲠dl2������0���Mo!klS|p���8�m���T�6������E�n�.����R	-��9�#4ʮh����v���8���mg�9�<\D�9J�@U��3s{���ii��	�ԛ�$��}�)j����|���[�P����jO���n��:jShE=�O�xJ�
,��\k���:#�`K����57Y�::�Q�
^0�-X�����0��/H鹎���X��k�ٌ*Ei��gF`z{m$���\�@�[j�Fͩ�m�z�	���E�,��ޱ���SC������uy���$��(��ԃ��� ����$��9lB�N!��6�vx�U5���i�p��"5p~�R�� C�ÿ�����a3��5Жj�狔-��s��`Dm#C9ċU��x=��	�(7S�`qz���kkΠxO�Mݕ�0�>E�9!�rS��: e�"��
�)h�{�qȔS�8�70�_�Mo�YC��Y�˶NibZl6�`��6�_1"U���f���L�G޼g.7�픣�va��ۻ��~�}�z��X��ĝ�.���`��O�ű�a*Z[^U��9��j�Wt�C{jC�_=G��qZDm_���W�nf�ώP��5�}*�) z �U��⋏a���Uu��1)n�ȱĆ�?�����Q�z��݅څ�ݧ�N�ZK�qYR���9���`I��0-"���L��D=bQj!�SK���6�0���dg�����t�[��U{.��T�]���"�흸i����dPh�E�f���W�9oe�W;G�|cYF�@���p���R��ѳ���G������|}3X�i��ij�}O�P�ל�9�Zɶ4~������0$@��t�6)df!�f�>L?]�u�)����!�T&����n]!�tn6Ȝ�.e������^����pqv��柔�祳P���H��vu�p3�x��0�H�@��C ��-�983H�1w��nC^��!��Q�Y̕b[GG˅���Ш�D_����%\@3B|����	��������Ǵ�3��]����ӏa�~�ime�*wf��%���� ��=�$�c�opc�s���F����#D��档4�U&�"#��z��4�eځo6�1���iA	���[��}+���ٯOmj�u X�����8�o9SqN��@+�W��:�o��D� 7���:>�♨��c��Pw\�F���b���wEuTcJpꎨ��.ns[��6W>���|LE��PYH<�i.������\������/;8C?�3�lx�,l��
��<#<�z�� :V��������3\G�S�IyԞ��wF/`�+�ys���Z\�>�f7Uy��s��Q��1��rg���A^<z��a@��@��!�g�!%%��������u��_\g��01�!����L�VL��}�T�C�'!�_�(���[��Mڀa��~�%r]rQ�P{[���-,��c��E.
fT�G2�la�VK�G��#�eR��c��q� �ͶRT�Z�r����
z�K�"��:���1ˍH@@�A#��LH_��(��u����̓F�6��:'Qz��J�N����}��i}�����(��t�
������ј�x� ."F����ԟ�:���?�D7��M��
��{P��P�oN�`o��qv�T�vS;���C9��'��[Ѯ�0����F>�(7��3��Ppb&�R��[�4��ٿ8_��a,^�\���#��9��n��)�sN��a��!�w�@�(5�i����=>gxc^#����0;�����0�H~�����z�<�Х�!h�Um���ↄ��N�p�Pe� �zz{`��p�"{Xh-\�G��3 (Po�p0�z����8-�J�m� BkK�/.��a���*Ro���Y�������'fh���v��i�#�a�܈n̺d�p*-�xyIfUv�Y������[�[�F����V�a}��)��)�e�6Y5(���-��l���݃U�\T��@��K\"SF���`�&���������:�����,����x��i����`��7�	�&c%8��5�G鍡���H�jЂo`�PM1��3�2�`�ٹyJ��T5������Ԗ �Y9��`+�{P�]S��=MS."�z�v@
X�|mfɞI�x��w̢��>V�yqC���h5�Q�۷e��<�K�J�ZLbm����Y=�fւ-����A+ ^��J� ��R*�z�֪o���0��Q+���4���"Kw��D6$':A#�ͽ=F?b�7<:�+kE�#\��J�X����Z�����#\�TR�S�0)-�n�b����fa����i�p_�JG "SO���A0ƺ�%�8����*a��m�LrSk\���ʑPg��uQMEnx}/����=h�U6��L����ⰳh�K��*��.�/C�#@��.��"��#�E|��5S����:���K���b^�!��Q��M9��+��H38��c���x��Q�颬8���vj�Qn��d��ş��cq�태�}o����0F���^���E���
�����72%(���e���'IQ��������o�/X�ϳs�o7nd������g'r�Z�i���p��oOfSʹA�[�Ѯ�@`رFXx��4L��I�A�2��n�4�}Dnj�M��aXX����r��?��	��ۡ+e�R�7��ڪC0Bp��R����NQ�g���nҧ5�zI�&�p���'�̤:�W������.�TZNJ]@��`���\�YGm�R�ֽ�|�Y�����Do�6�(5�S�["������,�זw����1�7%�#ҏ��&;X,�H���k�`(��}�i�����(��yr�*��˹����md}��"�c�~�l�� ��r&y���-`]�ӜN����4L.�lvӞmm����.S
=��ϛq-?�=�O�4�߽��q\0S>[ @
k�⺰@�6�����uzVS؍]�t�:kA� �K.H��W=S�A���]��BoNG�[(�QmIÖY�V0�����fi��C�I �h�k�z;��`b\Nw���퍸i��x7}ܭ�U��<AnC�Zt���d�Y��wð|�oJ˳n򊵬UW
�����dNj�({�
�2�OP��h��i��I9|ף䶘bݜ�w�����7�t"��8v�VM����IJ;p/�每�aN�|C�aO��q-Ln���"��n����s��ƃ���^Ǡ�x?�����I<�6���oo�I���r��O� �9�9}�D}�e�N6|�7k2�n� �7�!9�;W�SW �V��V��0�9U��S���F�� �Xv�(K��T�+�J�~}e��ͿJ�/ �Y)�Q�L���)"R��x�~}"��d�/<o���@9��ڲ���6�\p����ѣ;Hlp�T���(8�4�m�J��d���c    J�@p�*�%���<�V���x�~"�3|�PD$���������ȉ��*�tQ�}��s��C�S��U��D��'}�p����ɬZ��Fڧ���>S��z�$�@��k�*�����1��ޙ���^i�M�a+�747�����l�Lun^/�|�2���Ei����N5Q ]�a���k׈Is��=��������o�M�����1r������%w���S/��X|���`�7�P���|������[�f�A�0����"�3��\���m�^-O��� �@m���چ��1?ge���Fao_�J`�`�L+�v���W)������p�p4���b>t�0�I}�p '�"�;�/P���3g��])@�ڡ���M�����I���.��z�=ۇ�*ެ3hj�����l��z
�n�MX��qB�J�r�{�V� �k�Ν�u��mh�e�2��p�+dy���ƍl���^"�$|�q ��_��.��z�&�T3��Ȭ�"��d�S+zΜ�O�3rf��"K��8E��5I��5Nn�2�b�����P�d���K��0L�H�v37u�J��U`x
4-�5�[��oЪ ٷ-�_�Z*a�:0A����T.ȧr����V���QwQ0C�k�G.��S��+�L�CG��GdIWk�}��6-��kĢLÁeu>��;Ғ�7�Jl	�!7����T�i��ޛK���D:����$�#�!«ِ>bx�"YG�d�yܝ�;QR����`��ia�Q�8�T�Rh<����"�;�������f+��]�a_�>q*������g�
.4�z���̸4m�. ���_+�S!`#���C��L��o�O�Vo:�N�S'O^>FZg�����v';�/?���� x�DM�ԝJ���	P!v��l�}=�{VR=��7sVsNZ�Cw���<���rbq]v}}���D8�v���:ÿ.k�\9��5�k�Γ���ow�M���aavo���E�6����BÏM5y�Xn�?��)����`6�b0G����2֜��8k=���:�U���@8ع}�5�[D�V0�Exbn���0��s��E�����N|Ǚ�	�]RĒZ8ߎ�O�YN�3d���6C{��'eJ�����`u�1��+G�*�N�7�t��`P�Զ���) o�����hmYkt���=�`�E�>F�(Æ��4bR������t��]I!!,K�a��J�GT@��[��~M����M�&�-Hwe���.��^�F�]w��A�1�E:Fj��n�Ͳ}]'|L���\��x��&��A ��ܚ���,i��%�R�����Y�_��qF���B��,F�.;.En��t�i���q���*�����L����
4{z��f��g/G�E@b����<��Q�*y)9a��W�������|7h��F�0J~�	b��}�xJ8sm��
�8Z]�Ɯ�����~��o�JýZܖ�sm��TT��s�v����~c�7A\���x���'��}��b��Z���vlvə"�z��w�e�c�J�?K_|
�Ym���l�/������MשC ����sO�K��a�{lˈ���0ßp"~3gv�吔�N.H�TF��ډF��ݸi��x���H���c�Uw�Za��6��e'�0�㛔�H�#����䁹k'���M�������צ7Ȗ�*�Ne>KS����覎�������Hx���Ex	���k�]A �g����PF�#�~S3�3��"Ts�q��V7�@�	����c���j#��;3Ӵ�N	��Sf��>]Pm�~�Ï
���7B��@j۳HM��^�<�L3���L��;��0��M��
��nF����{[n$5�"��\k.���D�a>��\drE�űJ�͹��č��te^6��\��|r���'�cي�\�ס���:�&����Y�4��Fy�O�zf-^3�2�[�\�}ƚ�U�w�K��!� JӪ�	��<i�8�X񜘼�p���kF�Ӏ�U,\	�c ��:pKhz9�5#�����/m�oN��ZO��R�f}���[�u�)��Y ~��	�E����
۞��cH�k`��>�s����0�A��7��x,�K��}��s��g��c�ش^��EG
s�|5k���8Sq��T�łx�����ʏ�cnj�YHZq�Z4꩟��`ٵ���G���:c�8�u�_ܘ�;�T���c4�M,�O<���o����fz��q� 'z��`ţ2ڰ��>��D8�N ��|����`�Z �R��Q��suARx}��y#@�)�Qt�I�@�a�xT5`M� J���W�2%�VT�7�|t�Pײ���2����1�����e�G���)*	X��-mI�u׽�j[���v�a��"V���w�{Ax�����QZ�UHx�e�@�"���V��_���s�n�.�k�
�n�|�K�GU�ƿF@]�@�YY8
_� z�מ��m�?��a(�8�f��#Ҵ���C�����%(V_�K���3�������u��kEW
���Y*����`�z��(��F��a��3�����<q�!�k���_/@��X��7J&����,��Z/R��쭵Sg}}f�st�R����K���"�D��*aC<�G�v����+Fd���
�o֒J`����q)�L�� lu������a�NpUt���J�n|����<eW�����#��ZDы 5�͎ω�V������;
�_���\-�n�&s�S!X����Z>���ѣ�pZ�$z=������m��j����J�v4-_�\[��v�	~
��F����@-�u�r8�C�imk;K�x}�V�u;h����rM��9�WS�W��ƫH׹�s,��Mt���q��jZ���e�G�<�o��ѺR𤭯��a�\'�"��e#���9%\rsv��<�N��UVI5$h�7O�c�G�1\Jf'�0@w���׋�#Eǩ�qQa`���a��G�-+��[a��G��0��G��J�n�A���V.�<Tr?{�)n�8Z�~��$���B7̰ix��4oL��8լE*-�}���NSܦ�ϸ@����8��Ly�e�#��:�c�:���?i�\�1�f��+��w�;�/	Wv�p���C �F�1�+�T,-�Ǎi���N�e�m���^�j�vc&o�U��Vz�R��㩧�y��ՔpQ���3�pLȑ�Ѩ���p;e�q�W���f1͔�^mW2Q>)��n;ws�Vz��bN�4%����a��^��'J�������0�ק���*��_?Ҩ���a|���_k��eQ*���ԝt�\�0;���ۭ	|�[�Q����z���)y}��Nhk�ӏ��'��ke�^m�^[��YP%�����ej�Uz�S��S�4�����==�Κ��#\��gP%��˺��'�,�T�Y��xJ�� ��o�D8�����c�Z7��`�TRpS:����,D;kJ�!�
�@7ʹ���5�0�|�nnL����A���l+mlX#A(S�����+V`-鐲]�D�ʃZ�Y�{w�q)�եy;D4�A�A�X{3	�ҖT/d��g�^:r-HԱwm� �|ܠ]�+��(PI�ST	�;�+�8t���p`��3�a�xE�&�a����="1K��G�-�qM������3�SY��w���|}�:�F7+�5�w�WDs�լT����`�Nw^���ˆ� �7Mt->c�Us�F�/R��nj��t�?C�_3 �{mMo2��:Fv�?�x$�����h�Uu��"���M7��+����G3w�J��n�6�&'E�^�XiOi�û^d�v*�K
ef2ȵ��9��M���X� K�ظ��.�'���	����\G!\]S�����L~���8 ���"[�:����T:f�؁��>�lX�Iv�S9k��%Q��P�X�'h7�sF�&��\����}������,D�5�$��zh۲�ܕoĄQO�AAFJOh<�>%�m_5�s߯���	h[n:���kA9'�ά��hC�!!y��΅_�7B�#�
� �Sr-0�Z����"Z����*��j�ڱ�URt�����    {\�ti6��/=�Q��^-�b'��	���Ɯ]�E�nq�oh�/�����ҥdQ+#'}�T�p��l�$�_O	��]b@���yg2�R�Wj��ҩ�B��fmUx}��k)�\�_���6J��7Z�F � �k�o ��}�D �Z�(��0��2��R(*�$�ž��~ð�`���:7���5n4r���(N~�
����ԏ���d�M�zt%A
�p�o�4��8�F����h��nԩ���k�aA�ǰ@�ݹ�w0L�(�߈0��9��=�	3�������xJ=���Zj��Or��� J������7VD��2ܫc}=�À|�k��/���eR�0O�s�q$ۭ9�=*�a0�R5כ��!���HV�sd�sOܚ#���7�1ğl����f���������Ԍ�Z�ڝ+#��x���9&��:�YZ"yO�$���E�����{�/_3�e�P6w_D��)��k����JC�Ew?>[���=̏a ��S���Ǵ�������^\���Fert�_~U����S�J��:h|���.�Nfr�����,��w�*�[�8>�Բ�g݈��c�"��xL��p��}��Ņ�~N�]�R0Kk��^݂o��s��a�~Tn̒�A3՝رr	@�����(`���|��?� �e�{x�-9jU��^�ƅ7�3����1�G�'��!-\ǈ㹂r�n����)���~7y�2�}���*0����k -�Q=�s=e���Ɉ���y�`̞Z�78��4�xs��V�ɎÝH�S���8�~�{�M��ٜ��-�w�Ń�m�LXځ�^.��e� �*vS�ߕإ��H�b���)sW��m��ND��0_��5%�l���q�����g�u�#$��`�Y��E�l�l'�`igNg �>f�E~�;�\��1L�6R��|��,0���%�����{�oP�g����墘�=h�us9�E�+�M��f��������olWݨ�ڠI�d<�cy��krH���n��/��G���@�cn�Y]��?�VZe��4pM�/�x��ћf���B�_����uAA?�P��0��ʧ����1޽!H��ݨ�J�_Hf��ϗk�<����p}�m�t"XL�bR�$�\�o�ۈ^��\ �й��R�?;���T�{+O������z�c�Ou�����{ٶYjˑ�`M%.�ĩF��EZ{y��a�.�&(��dg�ߝ�Y>�Wt����-�aH���Z%q�! h��2�J���8�:�&�����0LG�7��s+���KW��^!n.���|}ցr;�:_	�	r�a�ܩ��;�]
S�j�k}}��2O��Cfةh�C0���J=���z0+����2L8_3���S�9"��|1;Ũ4�,R�C����!*ùK��f�x#p�t� P|�xς+�{�X�c� �bh7��uЉ��J#�����@ܘ�+?�y���F��uQ{x#��h�ehZ��X}=%x��V����V3�Qi��^��������~���@C�7�sA��S���G��䋵ԥV�n��OM?���i�WM�m�b+ƹ3zdǻ��#8eW��)�#�����6�jtt��Ob���.��8"8T�'��+�`5Kj(W�uH�ɧȒ��Izw.��r�x��w²�2��o*j���q	��?Ӛ�[J ܴV�C�Ч�㍤�H��b�}���� ����ν��ݖ��w�FV,��ǉM��c�){T�ꆴ߽E�1L��Yӛ�(���p�F9���9B+����$��̞��L�q�̊x����t�ӫh���ۧ�э���Aۗ��v�G���[��6̍����=C x��s�^v0�b}�њ�������C�0�}�	�`���V'�h��z@ۀq�-i��):{���ͼ8��zd�))A�m��I`��ye ��n���;�t�-۰�9V+���+���Kg���0��㻖):5�QwQW�@ʥS��\�ԁk��,�m�oparr��n�U!�n�����RԂ.���|���1��.�Qg	0jff��@�I�l2�~v�%��`�7ܺ��QZ-q5g��1a�}��`��9ݖ��J7����sDk�I0(d�^�lr�n���� �Q!�R�vqc�v���+��٨���%_
�:�?��9˩���:�f�R�!�\<�P��]�������,����t�i�	����6\'��暈~����BD�i��>���//�h��Ʃ%9^��Y*�A�b(�ݍ$���''�f�KE�922�����z��?>�	�MP�8~;������,�ؘ@fL��S�G()hR�	J���}��J"�����.@�߾�������Z62+43��i���)���@���73<z@�ofu��i��)��.��`\���G%�? �]1%�h=Z�j�7s�a�p�3�R<�o`�T	�p��v��vrcl��Ok~"\�^�!C���t���{��p�r�#����T|t[�/��a8|/�߸��+M��ay��1sγn���c���a��/�u����}�m�����_�( !U� ��	����Qp-�C�L���B���:�7��=��\�ӌ�."��H�@՜8J��UXUW\��.N�~������@��O~j��fq��I�e�S��9�E�}���4LD��{�Z/.Ep�8{9:��`w��+RD�W����K!�opZ �=蔥Nt��Gn�}�X����|?AZ�/��m�	��,�J�«����{��g ���=�v��v�wpz�L��T��)�gaL|�w/��2�ǥ���g�� Gˁ��ҳ�baAP�2�S�[��7��'�s�^�w���eX�מu�]Hx��߽���0�6Ѓ��D��4c��G�(�:���젎����/�P+��\j�Rg�Nd��ƕi�O#¿�0�(r_g�9S���=<<8;�EM�H�S�Ư�m��Y('7��g/�iڨG|�n!�5�1�����⽀��-W���aA���zw��7�䆦�7�i��r����]�x���[`h}��ޗa>-y�&(��+�=�,~���jg��l{u��o���*tѢ����-ucP�6�4	p�R#�D4�����cSA����:���+N���ӭI~���xu���a�~�[�L�햫!�b9e���h�S�6YM�W���f��� �������+cUVF�?���pJkGh��z�YGVu����)��#E�9%���\����Et�7��#Юj�LGvL.A-M'h⎃���o	�2�����D���*-g����]Sh��Ì���ri��x����܊�gwU����h <o�<���G%̌K���Ɔc��0�`88P������~���/�<�G�7�f:[ ���&vLUؠ�zFY��#P����d���ީ�r�ǳ���
�B��G��0ͫ[U�����_d\j�b %��ƍ��1x� �n��1�p�0Y�Z������DR�8E<F���9��0-���n(#J�/�I��v�Sj�l��յ�?��O�z���954�)e��^
%34e ��w����0�	n}3������)[�k�g*�m�}�{�*�BO�Y�o�k�����p��fp&���v��u�����"��"���0��^����8����70��a�_%����U|��=���(yķS)"��������HV�bt�-��a䔹�)͉��E�_���X��J��9��Qv&��eNs�(a0XM���+����v8�pᶃ���1[@�%�jK���L����?�[���������?�F��`�~y��e����[��Fb���r�h��l�7��~�����̞T�q�)���,Z���ɻ�w����'�_y�`��ԺѮ_�ׂU�<����PX&,��l�-�C�� �44�p��ް�>r���j���D�'�Yt��}�?h|�h�k�����eO���J楦��k��M���m`��m�Q���M�q���\�Z�˦a"���;.�0��$�zS I  �읞YI烻��23ӕ�V���e[e'I�<�R��Y��� ���J��D�.A��*�3f��ϲ;?u��o0͟�OK����,$�	wιHX37(�2�Ո�u���sx���AZi��
��gE~�-+��?��_�v����?��g��_���=�C���Yn��x?۸����>Gq_�Y}k���¨_�Ү6��
44k�ܱ���Nf���U�~q7aAM@ʡԛ	��e?�KN�6ۣ�<<h����&���~v�}$�ӱ��&2z���ʅĐd�W��y-�b�ppL�r{��|��~�
�mm�1⟶���B�e��@�TU��2u�I*�x딡�J���ߊ�~ ��MX��j���f*�cq�χ]O���&��e�j{亳'��&��i�8��Լ	J^<r`��y�����?� ��z�l:�4k����Z��to�8�e������ͤo�grF����t�9%�֭�C�u��7i.�V�`��a��IM�N�ѽ�����l����a�)�B���ɄW���	*?-�V.��r��x�ְ��g_][��x.�����>�Ȭƴ�q3�������	��ɮ��{�U�X[�r=��TL�}�������zӕ��Nˠ;�rs�d�	D������]D?jl7/���E\V>"Fm%ۚ�n���7>���Z|q*���mx��BY��Q����e/����f͹���
`7���S���UE�����������F>���s������a$ϸ�afղ�L���I�1�`@γۧ!���
�JI��Y�{�&�-�T�[��~�K�[!��T���n̕���X�F��Ԣ#�-�7Ϻ�nď����]Knm)�g/\�ml������>�Dz�^3��Y2�D���*:���z^V?K�+��#D�{�p���.�yǣ�A�����6=!�X�Ӗ:@MU��,��fɧo`������� -�-���SNɧNu���Tt?0^ڲ0���95��G�W펡�O��Yn^�ƥ���rb��j^֦�*Dᐧ~>V\�&.ћWԾ�	��Wz�	�n8,�c�i��Ԏ�s_i��y�l
���DO���Z�������?k������o�590��U��X �\{��x��P�n/�3��̲�	��
��f={_H+i����wc6��w�����u	q�'��Ҡ@(�=�;Nm��f��d��]�>�����p�8�d��s���t��2�Â��퓨�F�H��\a0hk���z7M�lY*,���L�b9�`�E���~eO�!n����j�`�(����yMt���a�	r��!�
{��^�g6Q��*�]<�_�P�����w{��
��n��!�^�V�Uw��o^���%�z�q4G<AI�Vr``{���I��i���1�/$<�|d���Z�0��U��~�d��Bq
�E޹�39����g���!�b� �8C2�ͮo���+g��<�a�c��_���
�q[
\?���*v�'Ø�����/���u�S�OZ����'��\Dd�X��|��S�����.c�R�pc<Y���O�a�~]�������j�3J���Tdv�_�1o���`@�Y,���v�?����^X�b�����D����4�s=�ͶR~A�J=[�S� �Rv�v���G��r�������YsH�)���7Z��JZ9�>����Vr~I�^���h` ��Q3`Pͬ<䃨Cb�T��� ��x�#S��>���/M/�������1
h���f�~'z9X�|-�>p|� �q���?��ގ� ��F�@�U�"�^�����?6v�>>>��GO�      �      x������ � �      �   ^
  x��Z[S=}���Yw��}��lՖ�0	0	�p����2�7��f�)��@��d�H=\��(&u�fs�E&�H�A�ʕ����{��.w�=��]\�[�������Ϙ��/�7�#
�9u����MFh-�7�/Q�6��q[�E����d��<�`1�B�B�V]����g���Ͽ��^�'ڭ��� ��� 5�&��L���K��\�[�a�wC餾�ݨ�n��U�ך9�	3��]�|B7���9jo�q��D���������&Ç.Ҝ��F�ۡ蒷EK�P��*��aKIB�K�(*\2�1QbKD�l�.�It��S���ۢ�����H�Őo�#�G�B������]J�%f�]���v#Y�~2��q0I���+�N��ǌ-7�Q��}
�T��RYC�95t�N�{؍�d�_tH֓������_<��,]�,�DY��g��D����h���E�+X��l���V,�d��_���VZ�1�dd&,��b0̕L)��z�C餸��(�w�ҖbQ�
W���ջܢ�<G��2�̤ʁ����:��B�̇.�Is�����c�ME�;�W��ڵ�֢c��p�36j&����c�m!�$��E����^�/u���d+���PXQuBq�M�(�rK�+��$�Bd.̀܎t���JC��f7����=��mv'���ڍ=�ku���G��i]���Y���ې8]��.�It������qK��q;Sõ"�:���ّ!���+%�{@YX	�8I]\]��Uu��WWx�~N3��N�$�p���(��Mt t4�0�}p�}����5
D1Ci��v����3Im�d�p��r�,��W�O.�i�s�R1y�9�*�4σ@TC�$��݈�^�D˝�%
�k��A������BF��ǌE�(ef&	�c�PT�H'�=�6��c���g|U4��:$������E9�����pd)E:!yRrPd��/*����0t����nD����_^�x��$���:�=G�D5���U��s�H���7P+�r�UN*Y.m!�=�Yp��n�7��m���Z���)N��fmEۭ��'�Kp$�+�@m,�}��,L:1)��@ӯ�0t�N�{؍��oo����|:�PpWe�A%�?���(]�i�����͜ͅ�0�Vr�"�����iI�%�z�#c��+�N��FG!S1� �yXX5,����32]��Wu������������h�V�2Ψj)2�@[����FǨ���!F:���i����2�L/]��Vw��~�W�lߗxv89�\ .Q����y�|T-��Ҭ���v�W��E��a�V,���������N�dۦ���tD�3YQ��������&8�'����E��B�V�M~9[��ߍ�g�kn���j����C�J{j,��[4�zEY=�\dv~�"�T������`�{Z���(@ȅ�lm�*:P�ב�Q��Q���V�Z.)�@]�y��`�[������C~���Ѝ�@!Հ����v����z�j�H#@d�"�@�/p�P9�H���6�e�F���+M�R��D��*:��hP&�9��S�q%�,��)5t���v������驪x��3�
���F�	��خ���GN�X�D��>����5D�f '-y���4W��'z�tx8�]�3�k���W��ܶS��mt�.�h�T~4h�=���h.�q�"�7��݈�7�t�_�)@"�zL�SA��Tl�c��KY�J�:�G棠@)�
��i;t�f���nw'O���:ߟ�.@����i.lS��\$�J�N�3��D��f`I���q=����҇|�f/'�o�x�S������ �κ����[y<t�f~�u� �Ku2X��ȴ1�酐8t�fW��^t�Y��:oo> ����W���-�*:��d��
�d)��QLW_�'r�r�"��g�����h0��������t�%!�-�D7G�2��h�k�(=�-�aP?X S��-m�<�T<ơ�4O��3m�[�����>)��[L����j\��3:&Ut � W����,zC׷H�h��"ͻ�v�//T����1�8'\�͉PN�5i����Mtt�I_6wut����նW&k��gQ�.���:�g���s����Jj]��X�v~Y�z�v(�3��$Uir���S����b�"���������Q ȫN��J�;]���(M�]��K��Z:d�1${e��S_~�����n�����?��C^�m���f���A-Q'6ѱvB�����"�J��>��2$I]�yf�`�;�����k��>>ݾݜ�N�	ukԮ��B����YG��ĸ)4�HJӀP�`�4s[>]�yG��n�������x�����8�輪׷�������
l�z���Ut�����O�vd8*i���.�lq;؋�T"K�\����O��q�y�%�����#T;�	4���ע�̈י�h�CRl�4�������Ci~-��^]Nq��d\_ �.U?dF~?��'T|�i�@G}"ӡ H�áVbřI6�d�S��Hs��`/>����$���Û�,v�5�r���@�6:�{���r�zC      �      x������ � �      �   �  x�}�ˮ$9�D��_�����o����nt70�?������Y�E!+7D�43z�4�����B7a�nJk�읲-y9��b���_��>��6��ڿ��?����8d�fZ)��(���ib3�Q}���5���0.'g�Џ�ٍ���e��5�u�[~������bNA�D~�g�������B�9�Qb6��jZ
լ<��C��b�n��7�R�0=�WFsa�ǲ��`�3��r�����������D��T�,SH��j��L�������)9漬��	�SK�&�6b��籞��B��#��;	�E��=S�;��r2>-NY���;�곀�4B�G�8�֤CN��f�I;Kh��*��8�Q�j}��;���3��J�6hR�P�n�*��{9r��/ʗE�fp�a�Xk�9������̎�7�|D��]3��L6�����J͡��U����R0{p{��5��JI� �"e揎�
�3�I���Ն�5��L����%ӷ<�>�8c�����f����iZ#����Y<��gˈ��V���Prxm�������Y#RA
8�4ۍ�]�6`mUY�	�����A�������莖�G�W� d������~�M��t?L�~����M����W��l�qв,���]l��ހ���i1N`f����M�Jǎ-������J�8kl[�y���>��g����ϔ	�+�^RX�9�L%ߦ�}�c�,%yn�'�Sm���)s��{ᴞuܔ��;��!z�1���\�i�B��c:IU�g��D���~����mtO�9�J:-��6�:�791+e���-�l��3NK��ׁ����r�7�|D��87fa"�)ӵ	�<8I��ʒ��?ր���ߒc�)�?��uUl�90�V�/�>���3�E�'+�E��=���^�N=�|d�f[�Ԥ��)���Z>�цX����J�o�-�Lg�FaDo��!�Yņe$읓�^�<lMܫ�2 
é&c�'<���@��=����G���p(��6���5�V����=I�Uֲ���
�̙#!�	z�5�T�ZI!ݦ���|��sO&�]���Y2A���y\���)����yZ�g-���y`xXV�ܔ�t>�W�;�����d>�j�F�1�m�m�usY�!nzs;�A,Q������MȔ��:w�{����>�᫂$ڻ��{�\��Y���{�M� c��Jlc�Y�R�U�9P���'I�M���"�`��EeC�� @-9���F�#�d)�a�6��\!x^�KC`���=����t�Yї���[��������ki"���A�\rI)�k�t^������b��y�pV��o.�%x�͆몆\T� ��h�h�0c�퀸�j���ZO�w���0�?����<}zJ��m6o�k&��H/~y�ࢃK����3�v<�/�������f�f�&;�!P盻	�L�Ԓn�y�^3�1V�߯�/����*�t��ܙF�+�Ֆ�\QE��h�ot4i/�mn��'37����^3�R�	Ko��sA�M��a�������~���_��a#�Azj�.j��>`q�/�!?���%��/��L��f�"�V3��r���$�����t� ������8C���|/F,'.�x[����V����*c<Z�8��Ï2��=r���Sx���L��(����u�/���/�D��9*ބ�m�*UFLZ{�F:�NFC�uؑ��xv|�s�_;����O��Q�j8u�֫�θ��V���U����tu�s���tP��ͣ�9��VDR��/���X�`������p�Gh%l�M�>�/�@��VL��G�@B�����цE?ϪU"g�,�D�X[��8��́�r���&��^�S#H�u�� ��u;:S�vf�4�f0���!A�3��)�Ʈa}��Y]_n�y�^�@��?��������4��:ܝ?�� UA���[1���Pz�)���_���qg	ї7���ɴ�S���LI���r����qgcϢ��(��ɭ��OUs7O��11�o��-�L���A�De*2&�X�bԖ�Z����\���fTQ�����<m:���ic_l��tޢrB�T	~���*�d4)�1M����P��2,v�z&����/y��Y��/OS��캏� 2*ل/P�pe/�trs�8�󼫒B�[��A�X�a�l���0�����x��o���@ϣw��]:����$�ߔ^�<d�ڸ@T���(�㵴�c%׋]�eY~�� �� ��]���7��Yu�E% L���RA��m��l����lZŌ�c!�u4��KN`����[]��8*�=`�-pHҤ'+����2��Q��J%m����A�zMy�?CT�[u�q�>�W�Ď��hl��7��n��(Be��6�����Z0n���9��E��xT�G��H:S��W��G/�:��,��S��F�2d�:V-�*�كj�!8��&Y����(�ќ	.�g���]�%�=K�Y�~|�7G� 進�vw;l�����QQ�_���?��M�H��ג��4�ɽ�>z�&��~u������n�:�����R�tiH��y��¤tˁ�j�YX����������^��)^w��t���'-�0Z̝���:��yWyN��M�+�sN������:��1��p�����Z��"���5���M�E찞j�G����&������w�i��[������QIզ�۹�^�`W]��g��������;5�u���v'�bfb�+��� ����$����@z�cy[��G�mN$�M��!/���*�(�Gl� c����q0�t�2u�ܧ�-��Ւ������pYο���z ${�S�7=c��b
.8a.�`���TV��~�o5+5��cb��ͷ�߰s�Wo�h���Jul/�9��h�i��P�eR��xf�$�{'�H�n�zŮ_����Z}�2�m�|}y��I��$��Z���\w#�[�e�FgU}g2=5螮�������+�]�s�k����K!�Q&�J�J&�-��o;�Æ�T9�'xWY_РFW�)v��)y�=1�6����� �*d@D��V���M���3�2+g��ʖ�:�L_b]��N��o�y�>�IE��aʠ���9�ؼw��`��$Mۤ�މ�kW��^���.{#0��S�M:o�ʡD��rZ���^�I~�5����� ����x�{$�`Ķ�Eq�����p66��3�+�P�]�"	j�L@ܩ��	���	���x�\vБ���u�~g������rI�u�g���?�W�¬�j"}��o3��6�.*��]/Q��+���S{���;��P��9���G+�j�-��dre�O�z��i@�t�j#�����cKu�T�{�]]�Bk�׾�r��U��33��U�ک���I�im�`d-�;暳�rm�B�M�Vh�����3A�%����tb���:�=x�9m��\��\Fy��[F�*i��i�)���KxOQ���3u�]��^�Js��n>��6�Z$1��.�yE����1;w�{�#sK�K�1��9���z}��,����W?�J'ߖ�#z9m�H���=�J���E�1=�ʥc;!��W�W;-����lW��g��U�N�� �3z��;!"�/#��q�Rd�ȰS� Y��ˤ�ò؞��Z<��[�⮹�T�����ξ�%�/�f�Z6[�s]��{ʄ&G��N�������{�3H\�����e޵�.�%?Z�+P���o���4]���G֨��b�}GVk�a�P�p�l�tD5�|�1�@T�.�-^}EϏ`\b�nkn�W�c_�eꥭ�%\����^"c#P-��c��c���d�/�)K]r���v�@�!Nr��n���HN��o�j� 7F�Sն��������q�?@4�Z      �      x������ � �      �      x������ � �      �      x���׎"K�
羊��W�����{�%��=W�Gd���rT�sifi4�<�z ���?���93�nV��<��*�7v3^䓆K}f�>��$RӖ6�[�DJJ�@ aB��C��(LP	���O}��>�k�e{�@FL�	��-�4��IG ����
������Y1�L.��{�_�OPf��\�@��¢��8�|�I�8���P��0�ChB�
 �#(��?X�  b���F�{��6{N��fg���L�'�6��:�g[��� S�>5f.#�����'5V���Rs�܊U��N���ii3Q`ZD��H�Rx��-#�D��Gx�� ���D �<����	.\�������=�m�⊹��ŀH]�)��%1���u���E�/�q!��(;-u��j5��&��fV��o����J�@�P���O��?��$A�!'�j��R-ϗ����u3y�&c�%�F��e�Kގb��Zc$σZӐ�庎KM� Q�m������
`)A��}+��@r�_x��+�	���K�� �L, �<ŉ�S�q]�|�cy��0.�r�؂xub�rw0���M�6'�#MIm�n�
S0K���c��ǜ,@�h�-�D>Bч��J@�._~A����!qX�����iq�6��(}$v%�ı0�������I�G�	Yn]ޅ����PhD�@L��*������h�i�[��lw�
k���q�j��!`�7��)��|W��"�E����JC�ao�Kwp>��u�貹z��ƣZ �����,��C,E U?����it�i7g�hKVC������#N��l3�ʊ�QZ$�������=������w@�*�����:p��'J�A�Q_������L@	�3B�G>������ju�U�S~����yvQ���>w���T��C�iCe<=˷������:�(�����'�C�*�C������t���,�u{�n�>.�W�`P(�3�$;��-���rl�_z$B#w��*x]sQȦ�k�pO����A�8���G4< �r&��8���j�y~������:󆛋��O��A�(}�=m�be�	�=����dO0吐cJ*�C#�M����O����̉� ���Q�Mu*(�k���
�b{˃{kt��^�TUN�9�w.12'����򢋦��x��l�p����IȨ�)��M��,��+�Á$J�؃��o�� M�Vv�?��ϧʈ�H�^����&�mG��MM,�r�0w~�`.��s�� yj_�7��N����TGHy=>71$ʒ,��a��%$ܷ�3�<�H%��"���
�U��qۤ��ʱ�\���_���")QX czdN9zm���+�ݺ�i?�(�E��J��
GԗPϔ�r�����U�����A�#��SE�_q2�{)�1�K�
Y<�!��Z:���ԭ��ϔ�+y,n����b
jJ��@�^)Va�B� ��OP��CR(��G(O�!{	�1`:(&��6-̤iۮGu,b��BA��Ԓw���lǙ���ݽ����\������j!�m|[�*�w��$�?P��Qٚ����L�������0=��m"s)~���R(�f.l����Ad}ɺ5o򺻒xĔ���D��Z[� ܶl����A��\N��U ���3��S�s���)���S��
R������B!Ƣ���c���/����V�YT���bRǴ����)�/��*��T�9S�'(&��%�O��r��p����ۦ�`��le�-_E��R�D�_@�ǿ�B��9X���u�Z+���jx�q-�s��J-((��M�+���`[ڎ���
��b����SEE���>W�B�26m_E�@�J�Uѧ#~�`���Z���G�]rq��d��z���
��0z�B�)�C�c�9��PH�E��T��'<�t�P�B��(�R�RWI��W��8"�\��q��-��z��'��]N`��@�B��"��j�L(�H��o�+�� �M�8ՊXI��*�*�EJV���&�9R���N<H��������õmU{�����$��Z�OR�ƨ��BL�.jD�#�\ҘY��������Τ>8M5���">��k�>X�UKh	�>p �����KSJ����TS�u�Ǖ��:`'����U_ń������o�������O����]�����/�]�(3�	V���_"5��_�m�S��LG����K�j�8�ZM ��49Bʑ��ᷠ
��L�"��(�m.�sùw隊��X��I]k��۹اl�"�S胀�+��Tz-46Y��r�*�W�r4�������TMz�&�ﾟ6��
L� ec��O��>��
�����]�o��#�o%�*�Sv���p���V�2�d"�ir�s��lu����7HlI�{�쨫lS���RŊv�TD��M����Lp���P��gJ[)P�|%��4ض�R�؊�l�K�����53���s�{��^Q�=~?���Q���(�)y�9�]NE� ���rFY{���=2Z/Ѹ1��$����Y�&7�e�٢4ڷ�u���|����j��e������*��G���49W�iD��\���gSq�k��<�Cx�f�>�,���݌���tu��3U�t�k���M�[h)W�m���\���2���? ��SR��T�eϿ��s}i�*�fK��J�f��+�K��F�\��fɈ!���u���p�{�K�����Q�B�S���<�o~<ݲ�v]�Td~x�wY��m������8�'{�?�R���%3�rg�I��_.�~�gSEDgK JP(��ҧ9��1�q� ����Α|���	�0���#<�VL����8���/���y����L�
2'\6z��s]@��UZ���]�N�\P�e���V�N�it�>����3_��ؿ�V<�ݼ�g~��O��p!�����ĽƉGU�?@���~rP����{Ľ�ɨJ��E�=�3śT<{�/Dެ���i�J9�&��\p�S��y2���y��u�d/Y��M�\?��3�e)�ρ�� ` ��kۖ`߽K��X�ܔ��N
����Ĺ:qjy�5��[��m�\)-�K(�I��_-��k���t#;��:6TV�!ړչl��I&�$P!u���<`5�Lo<jG���>�H�>ӎ����!_�O��9�e�LU�|��Q7e-��M�sRlH����b::�T��O�rPt�J攱f��A��r���n���):�Q3��L�&��F�Jʙ��N�Z��G����!�*SXK�::C2����X|�)u��@n��p����2�Ӿ,�s��G)���>���@�HBy`�"b��"�W�[UF�:����es���Y�Q��_eT�oeS(�D*�ѝB�4�`k�5�Z�/��ĩUXׁ}v�����#��;x�]1��v��������J��&(�.�n-��w�����/�Ƈ|�jwDh��� ��.HgN��f�'��R*�쐬gG����lul�SJ�S�ҞLih�
GW���ܰ��ىs_{�b�����4?咇����B����`��ʜc�U����=U�h4���vK��^��E��̝����0�ϩo}�4muR�5��� ��w��an(��L�>϶��V9ڔ��6��L�b������,8��DT�o�]T�_����Dµ�	�^'xJ�Ó���s�IyTQ̧nKݝ�!]�ҹ\%��.��.�ms��
f�i��uF�FFEp�fe῟1y�5^:�)�	/�I%E�O���3&�rc�[��t��w�����:5f/�;�����H^O#'F�!hd/��n��-'�^a!Vi�x"�G��� �W�?@�A<�	c��7�R��n�e-=���=������N؋���ɀzL� ��?����� c��\o�f��6��Cl%'B�
bT���n�Hn�h�aJ�
�-�;�vD�� Wv@P������WN���ڋ�;���h�Vݐ`KK׈�$\"�    {,O1�t�A[ �ؿu1n�O�Z�V�j�z[[)�y_�<�Y�����7�P��a�x��g؍���v���l�כ�����n����=ȗ�U�rM��n
�.#�>N+Σ&>��v���NJp��"��X-�0�t�X��kk7���t�9[��n����n�[�w�Sf_�	���g��H�j%zOJ�����"� 3H���:�63�y��͒� �aE���O#�ARH&(�1煾ʧ�e	eRe�J�߶�æ�v���I�#c�ʊ~ |A/�	
  �;��LJʃ��gU�$��<�Kj���k���95dgR��*��V)��f������N�D���T�-�O{m�uZũ&I�}}@��C�_��?:&��'�xT��J=�?��=W$���"x$>x���h�����Ϝ�5�\|�]*�wj�?ͯ0��jЧJŀ?�&(d8��#�jb�nA,*��A�\��T7a�*�w�ͬ3�_�V�yr��!Yc�il���2�\2�E��E�Ѝ�	���*2�o)��x(��U�8#o����s/MW+y_W"˵�T�A��	y��o*�iO�;䷩s�Që[��]q��anu�y;Б���D��3�1e/���I�O��r�yun��6����
�){<I�ȇ*xJV��n��iӳ�<�|ѫ:�'de��5/&�?$_х�>�@ ����6h�Kf-S����5����8��qO`�����{sʓr�i���@{���3��J���M�X���>��xS3Z�H,�w֤H�� ��%�|A9Sq��H��l��d�ζ}��Hq �m'7$��r/{�#-�x�u�_���G~Ճg(�7�Q��==e*�a�3q�<�z�;/ʬ���4�և�C)/�R�+�Z���i�pZ��Y��T��Șu��t��V�l��s�_m��oRx�4$|��)gE9]�� �q�1�(��샀�_HM�"{����Mه@�"B�#R�D��|@��(��Ba?�mb4ߺ�z�Ƹ�D1�n�u�,��v��Qf��ae9�<-}J���>h���R��1ї�1t�)�
���2s��e�
BU�}�<��W���V�y)�s��:4�r��ΦoD&{mON�0��]N������&���2K������@XbS�P��I	����?�H(���#�ln����9}���9�(�F�8�
1��,�Z�O
�B5C;�qf�Q����( ���� b��Qڌ���Tm����A4���/j�m+�R���������袮`�f���{���Fv��v�6ܗĘN�}آ��"��e�٫���Μ�m8��!��5F�s����~�3s\`���'�� a|+���+t6��l���(JN��O[�����E>�����^��Q�ʧ�Bx*�([��<����gɈ�?���}�r�ݬӟ��n��c�#��ǁ�W���T9� �/x�{b��qٸ�A-G��j���}t�۷ɧ� �[�)SA��[$.���2R�f�������I�2+����}��3���83z�z��qgd����K'yj�������A�)��I�`zRr�=<SA1� ��he
�ɼl��M�<�_Wf��(׀D���Oec��M����Ù��U|x�uK�\:�N{m���=������"_z%�����I˗I"�͹࠰�B]*�3b�&Ƥ%$�@�c��W��~;����Ԩp<^>���Z��nm��~��N0����4��=�ֽA�����v�K3N�q�?��׽M�.&�ʙ�"�o��~���Ž��4�sb�oR2��M G��?���}�̽o�5�s�#�G@��G�����b4�"�<��gܐ��r�d�Yz|���)��Y��H� N'	��7Э!f������.�e��۟
+F+������2ȣC�`�b=�b�`�}Ođa�J(S�VO�F�z��Ɂ޺ejA�)�a@<�-���+���!Bi�o���@QB)qN���R��O�Wl��tbsW)*e�9���I嘔��Ж�m��d����|�D��}1�Ʒ��P<�w8��̘�eㄿ��D8��}?O��h�d��ai�dٽ�V����.���@΀6Ԙ%�:|V#T�Hzǃ���迹�>��hTk�v��!^~Yu{Ǉ����g�X`�� �OIЪ��� K���Laϕ��Cr�2׼�i�W�9�}J� s	t�J���gR�j��������Lٞ贮�#�$g�N�S�-�{`6��`�=�R�2�C���n����|�A��2\!al���Wpu�N��_�ϙS��K�S��':�A�����~P�ieXx��6��ş̸c O�|ɚ��$���Znv�%>�gʥ"��ӈ���d�Hg��'#���Ǖ�]3���-pm	�Q6+����T�2:Iu�f;�tg{�C�f��S�Y��I����e�m���b�u��(}4�����KC���a�#2U�%�"�g����^#��b�o�|,�g�k�dm��5d���K�8��P(�2;v��|��uͺx�~���4���ϯ��SQ�E>�]64�f���s��P�j�M溬�Q�&b�'�	\7�������M��V̵����g�yѣ>EA��
XU�)���|���C�%��p����L�噵9⏺7��EW+��)!�_s
!A8�����N�8v�T��ep���k��Z̤An�s)�<q�#�c�B6ip�s���,�������Ej2[��\�:���w�RP�'a����é����b����u���L�g�_�ˮtŋ�(�Ca㍶�y���-8^[�x��!����A��\Ұ�9B
b��q#g9T_�[>��jau&`���6����G_k#"8�	$��_}Q����3\L3^-��^����جߦ��[�O���	�����7+���<����t2���j�:�������*G�y7���z���	�(܍Q����J�4��|��������~8���M���9���Oq�|�T��n�P��3�B��@d*M�wJ�E'����f2�q�!=��=�i+&t���g�a�n�ަ
��7��h�K%<�AnLo�$�B�\�"с�� ��+�Ɲi.��U=e�~-}��{ѫ�ҝ�ET�c�	�SWz�|���ǂ~`��V�#��b��ҋ^pE��y��)[QXr��O5��6"e��|���1��B�v	,]_;rZ��[�yS��a�k�"��²�A�@&}$�A#Uh����'���k
#��o��R{*�vH�~��4�T�(l���Q���"q�S�Z�c�_.���f�ꀃ�����s��Y��ې� �_�pp���)��%g��a�llS9ʶy��v��Zre��zSS����6��T���G���:6���>���h���c��_����h���)��˕6���z��W�z�*�kK��:���l�E�T>��T���@ʺ�8�,tf�3L���n;����d�Lzp��~��G���
�+(�eP��WL�W�PڝK��{ϴ*��Gv��������`�GyB4�_�E��n+�F�߶h�? syG����X��~�f�qXR�A��|?�6�8y��{aĒrnO���6F=�:4��7wFLia�Ĳ���<�K�dʃ0ֻ��t�S|�2���,���]{�us0�]7*�����k��;�T��ea�:Zi.�Xy� �F�/e)]�ff�5��bm�j���i��d�����oل�{V��E�ف�����%�Y=9=���$9HM�>����<�ɋIڋb� 	�<I�WD�ө .!(��Ƕ!)\�,!X�ڝs����.�8g� ���`}$����;Mj�U�f~�?Ġ�y�ף�E�	=�V�"b��l��C�o�����m,o�R��HW�Ն0N_ue�C�6}�yH�-��� �'=�kR����ܬz%�-n�wl�Ou￣��!ҥ.�i��pMD9>F��m�7m{�[v���3n���G�=�ʱ�9�0�D���8\\1��z���˃3B�?���|p��,�I�Q��X�0G��r�ڴ;��O��a������Aw�	J��    5�ѽC��K(�� )l�L�i��1	w�i	W�0�	
�B䷉eʱQp�C���)�y��m�߶藝�~įE�%Y��i�-Ɗ�R!7��o��j��'�kW���"�A�|޳��OcC.C|�q�!*��H��%�ۤ���=�oWyy|?YI�c��KH��sأOQ�^�&��&�m��m�v�oڮ�;-u:����ǅ�9�/��+,�X�=���%����˧JN�����e�W,X����m ��iq�������ng�@����Y-2��_:|B��Q�%���9��{��0�㙗/t'���rY��~Z��?�ÿQ��F@bڼ�{��4vC�+��%�Kf��p�����/����a$���wq���C\JÙ�ӑ��P��3��<^.����.�:٥~>�f&���D2�����%���U�hEk��M��\t��� ��2uu~�v���ūU#�p��G�z�kwn���S�Kd��L19̑�YZ�:�W&�7�_��_ (=
)��.��F�۽��jnv]^C0>4v����Fo��}C���e�����*~�#n6V|�Xdwg�wȦ��1.M}�v����c&���'|TkRgI�EX��V[�yJ
|%r&65�C<]ST�������T��O�U�g��O��椎�a��k����z�	���Y�4�c�'����R�z��7����>U���[מH�2��Nu-.hf�K/F�l��7�Ī(�9�n�G����[�f��!?iC�|�'��z�?�`h"�t����h�֛�SΨ��Rr��k�qy߫|����~�Ro�J�ή�{#8'F�1 �$V��̺�M�Яɋ�:�ߧ�3�(�����A����c�<������rv�!���m�~s���/�6���D:� �W���V(F[��Z(�.�XP�u��1�L��E �ٲ�\�7�������;�8[��~P�_�.�/x���Z:�]R�O�Ã�!�<˩OQ�<��QJ�Z�"$?V�c�V�V�����uS�#R�T��򈀽��4+�Q��K��z����	��{����r�WY��^��~ە~��S��s��z��"ݭ�#�clE,r�����fQu�5��}�~�~���U����r��m�n�&L�2�f]:�x/���7�.,�Av,d���S� 0ش�y�..���/�ae9��_�y�o��W|A�"%	B�WLaw�lF�X�V�	��+{v-S0Yq��ߏd��U/�@|��p�����(��ɟ��`U���l���,�~��b�ާ��Pm;��[�/B2b�OjP�i���S�Rkp�o����K��G! ���:���X�a#Y�W'���az�%�I�o�x���^Z��֟�H���w���ɞ�<�����&�L����t|���OD���T��xu��B��z��`�w�ݕ;��*��6��#����%�l��a���3\}D��"z���P�2�	�#�0���qbU/�X�2����S����1����T9���N�)]!@���S�*4�\/��J�@��Iy�&�ccS ��'�)sm�۾m���A��?�Y!|��i�{O�oʟ~-�/��3fT�A���9�[��RJ�e��� ����µv�Hq�������A�HL�
��(Hy�`��I��r_ί�y�iJx�Brqo&�>8��%s%G��Y���Q��SR}�Uy�ٳ+��u�֑���>VY�Q�����Q[<7��D�8�	�Pbq�C�X�Mvޝ�Y}�v�bf�n��}�%Ӏ�@�+>D
�D�a���X��h�s����Mn4���y?�򄀾�'��R����^~��X�c�K��8��M��|��]7����
�=/V���%D�k?w���<`b\��S~[�9��������>�'���-U�+���
��"n6N|���L�;�Yb����ޏ����� ����ү먛�76Njݘ�/9`�+&>_��߼?!`��W|B������T�@/�b�'�α�b�.����ݸS]g�׏�� &D�WxR�b��@|M G]l����n��Y"��Զ���u���������t��%�������F��w&<�����ד%��,�`���%BCAa_�̈��4vJWw'��lNەEw�G�h�G R�Z��ӏ+�	�W�.6N|�ȌK�Y�#:cڻ����h�	{>  ��E? �u��CX`ۣ�5Nt�X�A%s��;t�N�V�0Z�>����x$�g�Jubj��k�Q���]�G狿$Y�s_��F8�q�f��fޯ�X}ot���Ǽ[�H�<P������h��v&��(���9u[c:{3˞����,��*1�����:솑	����5N|ܸ4RG��h�=�k�R����B���`�M�|?�����!��i�-�AL&$F>?���n�-�}���~��G��Z���"�\���F�i/��F�B��R�Z�M��'���o�"|cI\п�$��Tx@�C��@Nl�Э�o��<�oHY�����W�)�g�*����uz��sbE>������@��݈|O�s������ܟ���|�m9�4�|��Ѽ���x�m$�G����4jR?��Wȅ0�����i�M�v��e�ɶ�����]��,�r����Yߓ�X�M�q"$����r#�Q� �g�)�Y'W$�[��q�1��EF�j�;�i*W�\�;�O?�|X�&_:q�Tk0���Z��8礡DƠt��.�J?g�s�}�R ���9�'q�}W��M��pF����0=i���;+��;�w&.�aꓜ��z������u�3� �P�"�v��<@aH2ώ��IJ��%��h>k�?�4��Fq�(�sاO��΋I*�'���+/�L9���tǤ��w��>K{�L��k�R(�`C �K���1)ƽE\R�2��v?�?5E�����G��!��y�\�m���1��A"n6�7q�4���f�L�s�U��VC��F�n��"�Nz%�1R��ʟ�h�6ì?��&���y�����g
	@^��Њ���2|�#�s⣟2u8�]?Nx�������
g���Wr�Go�=���\��L	���wň}D���}� ��w"p����D�M��E�,�c�Zj/ve��5��w"<#���#�7�=�1��.����S� h�lR�ʳf��o��v~F�N��0(h�U�0M(�Ş��a�ĪwE	�B��t)j������)�Lg�I̎�4j�6,��Y����u+�}?��D!��?��g0�N0�|��J?`��M�k����z�L�����Sy���_��PowR\n%��K1Z�4@$s|4�^��P���eUϴ�'��B�t"Y�p)�֍{F0N|�Sa:5��F#���~�Z+PM�����
�u���_V����[���wv���f�,6�J�3ϵ.���ڻƺ Z��ֲ;�:���>9�gK&s�p�	�9{%�<J�P��k�C��(~ ��/���a1l�+| ��g�����o��D/h� ��ƒ����y�+�ʈZ��Sz�$"}���|?�pM���$$�1�;W�g8go��`�D�`^��f�A~?��N���@�!'�Ҡ��[��W#gD� �@`��&�3�oϳ�cI*������@��{���"�$�)���U���;�Fe]_R+V�b�1�,�O�=��o���+n�;�c�k���Uk2���u�U=�+����P@�G�_ �o5�}=���	�7�|w(�.��|�l����?����k��m�������;�������HL���!���5�c�e{��m-[��5U9̬��}�/���'6��A�~	�W:�?k��,u��2]��m4Ă�l�5�c�������w��s��7+>͟�2_�N�~d��w;�XO�?��,aR|7��}��G���*�H�����,?����ˇ�~�{� a�0Ǡ�W��q��ޞɏ�>0�}8�7MP۞����m����'���0�ͼs�:�r�8�>��'� 2��I��KZ��p#��S��-�������@e���    0�o�d����_�r�X�5�,�[�R�$����Wx��E��O��=�^".6N|�[�~�p�(�gg�9�.��oW�P�Z%�O;1R�DȻ7+>b�n���sk<u'�bp�F�O����[p�����"�5Vt�h{B�Ѣ��$E���S��n�?���e��ϧ���A����޵�j���������|�����)6���A֞k�')�m����s�bc���Kn�򢲻������ x�����7�oŻ�g�U��8pf��j�N����v7�����֞ h~䘡׷��.���8#[i��Թ��f5t�����rö�h�P�lK����g#S�p| ���o�R�[#�Z:=�mN��Z�n~�;ӡ�a�*&y�v�֥*�1A�6KK��e�k�{�8��dQ6�\V&02v�l�݆��˺`-�3Ƚ_�_�3�
�K�h�h�;����J�]��vڞ���S5陛l�����]�j��V�Eݦ)�~��,������ �Q�u������N	����S��(%�ɵ�M�x8���g���X�W&�x]v��io�BQ�LV^�M-���D����O�n�I(ٓaA��G>��"��2���1�����À �oģnqf�15�4@���/��R�>������B�W�`��5]�}#'N���(�I�o�se'��~�'�v��vyD�Ruק8�ˏ���������=�7��չ]F���n3�+�������6����Ề��	rƽ��Y��Xv�=S�ܱy��>�����@!��@����y'��׻��+
c[��`���>OR����y�m������i��ƊO3����.�l�e�6Z�G�Q�}��Aג^g�P (�߽k��������Ġ �_�6�krМ����Kf����_��˪��T)R�)W���[�2���S�j)g2��l3S�S���@����L({��]�?_l��)�x)���t0�ޖ�a�,�W%O {��tM�*JP=���|���cH/U-�J�;�Fݳ�Ϫ�\՝ߞCy~��e ��È��{C���j;�z��ίƸ���O��>�ѓ�X��B����51y0���p���n��۷Ι��k��=u@�_�t��dH(%	����ϝ�y�
7*�^j���~ہk�NN���#|��t>
�G��}�)�`��f���	5n�jY�\Dc_i=�k��)���{`@I_�'�_��u{���p~�\Ĩ[��l�>n{�ie���y&�r���҇�7�t�OH�_�:��t}3���hv����=��+�q�-���x��Na$o���z�۪����fr�~������;����ӵ*Bʁ	�3B,beNitS�A.�3)��]�wq(~b�������g u��34�}������c�}<�z��n�Y�WJ�/��Ý?=����%<Ś���#|L�~Y�KMq�@�w[�I�^�����7����ry��|Q.(� �u�"nH�`�8�2*��xY��[aعH�3���a����	��c�x��zu��sN�F�k��2�I�+^錚y\�6������W|Xg�1�>7}�6N�Ky��uQg�[�o�V�0r>���๵�k�A0��`q���#�yw�6���z������}����G�X�T�1+�bc�G���xuZ[c?7_V�����g<��ЧLW����s�7k�����Mڝ�Y�8�^U�7����O<�;�׭;�������8���s?��ʙ�Wl�����O��#��w��/ ���2��i��j�A�^r�ɔ�����{N6�����
��~+�	��e��݈�i����*��� }���xD��W�d�ɟFI?��d���C���#$#N�T�c:�˫v�}�Kp|b��dA�#�o�E��z���a}�`�9!�|k'��^����ف���g��[�`�����Ј���'`�K?n����%�N��Qru��zu1��b��%bQ��̅���Z}�q�o[2�_[-�]��pJSag�e��fLދY�p��9��w�Z��&s]V��s�h�T�*}��z�=�akH�\ĉO��}�W�#��{�Yf�[���[_�;^�CD�V/ ў7��TXD�I��El�k����f�!�U�� N�}�������upJ�N:a��70+>f�K%Ϸ��K&7g��A���l/���p�_A�n�^k&͈���0n�8�$h�4wΧ�<]���?�yC����3hk�8!�[����yqE��#�Ȗ}�<Ф�n���!����G��G 
������S(�#l��`�8��Q��[=�L�x��`��W������@�����g��P968|;%�qb��z,g�rP�V�qx�-�-Us���2� �7�<C�Q(�;����8��n}̻��u����[��p/s#���@�1�N��<��cVU"$#V��F��n�E2��[=4{���v'�� #���F�l���q��Y�һ�+�cw��w�B����g	�/����h�C+�peF���*�H�Gvϣuo�,: 7>����yx��[�N��:Az%	}ӈ��X�3�.8��� _�3����D>P��j�h���`��/�sb�ǣV;|��~)�<��@!����BƖ옋S����.GX�u�}|Ok1("��:PIy��Rĺ�X��|�!` ���_hH$c����7p����<���;���>	��bP�~�a�&��u�X�k�.��}"k��{ot�Ik�*������^����|�(�������>vCXlݭ\���g/��>و�����/l=���N#.6V|��7V�U��-f6~}7ǬZ,~��� �x���L�l�O�k�M���
�G%�>���|�5&�E".6ơaq���q4�J�d#��4�׏�E/Wń�6�l�uuT�01�\W�b�4����n[��V9'Ν.(x1eZ�V�9�]���7;y�7�}���.�P&�-%������k�צ��mOwk��}~����t�S{bĘ���m.��t*��^�Oއɷw���ET�'2�O�����~����Kå��@�eov��o���K�Z���L9��:���l�E�T>���OVk|HG�P�i�_�i����B��wظ��I�\�㊽9�I��j`�Ǡ+�~ۚ�ډv@&����~B'�!O���Y��C��(����/w3����^ms�ӱ��p���K�F�U���zw �����4���!�մ��W�y�F�I�/I������[xx���-w�ۤ���lheT�f�!N�k�^���[�S� ��k�%��O��9C
=4�<E4���S�$����I�[K�f���R�|��>w>u�!$��/lIS�C�Hhص����x��v } ��6rQ����sޡ���2�w�?���T��P��B�w�#��b��_�����?�/��gۏ��}�.�8��q��^��`�ĕ��mOǸ�4l� =Ab2�S�:� �k
�*�K���?��~�'|��e�����o͐�G��>�f�VX�����F��@i��)k
3��5}B�B=EJ���3ϙ|�)OE���<�*,�A,<�>)mH��)��W"�P���
7z��u!v<����7+��������%���¢H�{{�I�\��S��c�TɏC����WX�1����jr;��yP[���\[7?Ƃ�p�C �?NN��,��!u�&�<E�ئD��CǑ��嘶�"�Z��Nhy��6�M�a��(�͸^D�#��S�������S1�Y�� A�����_��%K�j[w;��l,
����ǔ�G�`�g,O�
�*L�J^�{�̈́p�m*�.�t���5h��U�=��^���L2�w�O�XeB� �	�˩^�|L��1]B���J�A�M_�Y�g���[%
2LT�f���f]t���d�l/�<�n ������
�� +M±�l�Pt��� t/�P�L��~W&����,d;��r�-������~�oM��O�|U��*��R����L�f�r�,_�_�JD�4=�R    ���YvwQ��Ν�֧z,X=(f?�ʗSM�<*)gaG[_��Vn�T��z����R~)ݷ����3��w��m�}N
�K!��/�Z'@�f.UX\*�������b2����>
3z�u�Ҟ�i�����iR����z�	4.�Ov��T�0���3¶
��U��2�#B;������2�bGy̳�Q4ֳ�lk}J��U���r��©G%����ՉϹ)��  !*蕒`�{�"�Ke�6S�S)��V��$N����G���`��S-������$�U/��n뗋 �-���"��89o���+d��}��r�9�Q.��/�ڷ$�͡�i���Kd
Ș:.��
��_��`[t�w�^��稓�%��=ic��n����S�9��+��P92�ʇAԴ=e���_�d��u[�z���Ӂ��`~�~N�����^��A��(M�|����2�lSX�4}�s��_�F��pZm�M_�gGO���Ji��}AN(���y��T�>��6��**� i
�Kx\����d��ͤ����w�̀k\��9I~�� =ͤ7}��l�˩¢R��4�"V��^�� �j�ٶ#�����u9��j4��?����<Fe 	�O>�˩���bR�(F#{�$����AEJ~<���B�j:s���|��A6�����Xp���1����*,�|_(����)#R_`+T�m�U�ސf@/��¥��C�K�Ck�?���n�/�'�9�z�f*�G���+�t�cZ�/L���Fз|��܅��u�eOɭ����^��?�.�Our� D�"��8�vߦR؈��Z�)Q��M%&����o�0�'s9��Ģ�#~�r/O�EWL�,,�G�����7Α0]e��$����Iw��o�|G��iDE��2�
����}%#RQŦ���p,H|�:���H�M_��Z����2�R�j����!y�
�s�P �v���S�;�U��k2��Ki+el[����]���{i�~�r��x��<�lo��ԛ�P����k��{(5�#���Q�#�0����HI�����.�\ֿ|B��ߜ��Q#>@��h�A�a����8;��i��)�.^��:ќ����戈|yvE>h�R����M��n�9��☼� �;��=?�F\l�UfN�ѩn*ٛ����.�h\5>�は>]�Q!ً������;Ô���2��=ߣ��/o�d�7N���ߩ�˕��=��vs�n��v�qX'׏w+kK|~�'��=�k�<��N��<IR���C�t6O@�J?�ll�-~�/�b!<�( ����H]v[�e{{~����s����,�:�r?PԷ|�������'�D�P�"8'N��4�����t|	J$1��Y�߻LJ(�;��k3�����,�2V����A%�zE��.��O ��R��_���f,|�sa�� N �>��*���y��w�L��d���T`���_>[�px7������h���C�El�o�/֯[��ܲ�J�Yz��b�6ʫ_���Q 8|U�?��|����v(j}�{�X��A����|/[��ߠ3Ɔ�h�+�[�w��醝A�j4f��
	���H9��JДvS�da�y�
�-����u���,��0x>(KDN���,�Kb�f��}�������RREA:T�qS��Ǡ��e������p�@��Q��&�[����E��x>�j{~r�~z�
p?�f��0D�خ��y�U��{i�Z����n1��Me^��=!��$J ��:���?����9�.�����r�Q�Q�wsm��{������nR,_'���QxP%�>AfM��=��O/�^��̈́����D��8�(`��1��Ȁ���<�T(��m?�z��>Iz���s�,�ϝ\��q�2�p
�k���O�'3��^��.�g����{1ҳ^4| ,�f���!W�r��w5h��fv��{��۳z!]��Y������<��gܐ��r�d�Yz��.C��k	�ДL��S��_P�%
I�͹Ԯbs@�S��`���ﶅz	xHH�_�a�eHB �e����<����r�ix�^5�n[E?j,����?�T�ĵ
��O���A�,�F���=Ba;j���	�Cp���.9ֺ2y.k�_��~ B�_��4�b��'��������4ۭ���6��'xf)��0�f����C�$)OL`�&6���K�L�CM�b�S WC�Y�|�Fa�۠����zڌF官8Wg�޽<+��_ľ�"��!�ù���� N�~*]� ��5���S��|{�
�Bh0��<u���z0%�_Yv�G�|
�1�|�v�),�}�r�� v,�k,ȸS��_t�ӭYm����~����
J�+�;40������+�QׂϞ��۱�-@ �44�"l��a�_ㄙ!K��#uS��}�}\'�AS��V|��l����x˳�n����?�ޜ)�q�W�_#����t���{ʫ��ٯڋ���Mp�����Pi�b�]-xHØ���=8�0p�M&�y��Gp��?7��X?@q(f��$d9;z<�z?�Z�Ђ�K+��z�B�����]���|�����)!�f�&J��|��E�O� �{�F�5��̶7���ٟ�SF	���?xJI��(�Q��
�h��C��ztN�:��qa�+/_9#�<�C�r�N�)��ƒX�G=����'��5�>��ְA�V�gd�?@�
dF���yD}�RL��d�	��M{T>u�0�p�j�[T���tQ�X��I~��K������
���3���}�}M��Y�K�U�,�����W�2; �S����4����Պ��Ln�\9�CkZ?N=�9��n"|�!�u��J�&��3Z=(V+<H/[��flj斧o{p#�Z��<�@D����'��#ai�b`���0�z�����8�Ovy����/Ю��rvʯ���	O@����f���~��򖹻�D�suFS��Q�1��g>���۪{ȶ\��t��8d�?5r:* PB^�1y�E�a$�X��0�ԧ�s�wP?4�W8��K�_'��	{�}f�C����xW�Vx}�O���4�uRURs���P1 $v�f�A[%N�3r����G)' 3�ب:Z�v�ݺ��}+���C�L�_��C����4���X)�:��8P�g����ّ��}ee����g�?��#I7�7�µǤ8����ȟ�(�b��y���ۯK���{��q"��"��Ĉ?Ξ�|���~��������\�5�#O�yw�,~�cc��7𘴈%�4 W!�����+������W!��e���>o�!�C_=�	��<���N��I�ʭ�^6���J�&�]�2�w���[��d�x�U!����_*[��Yuf����l�i��������>y��L��%p
�h���i~+߭�Y��N�eЊ�M��=1�q�* ���ЏL���?�o�l�՞����H���ۺޒ���g��E�0��OÃ�r��G�����ҵ���Z�ǅ4�̿'�L���;�'��ì0���B9Z���.����٩[�U0�y���CE�Zʯ8(��r-���7g�&���X�PB�����D�=1d�7��܂�4�3�@�
�h��G��w[��u�b�������d�{&��/ˋ!=F�����Ae�{�h����,����!U����ԺF6I��L�x�� ��4F
o^��I��@��T�ոbổ��X��N5���A��(}fp�'�����x�TG'}&��S���z%;:���S'	>��8Z���e�Wc<j4��ʟf�C}V�ߏ�E�x3�_�K7������$!�ki��$zF��VI1�����F����c�/�j߬m���� 0!���B�!.µG1�Z�Qp��L�9WS����m���>�g��h�E��2Ÿj����[���z�����e���a�yjY?����$�F��À>ź��b쯙�=n\+}�v��z��R� �  �{"�G��˯�	b���������1@�bfz�j�\v�����wHpm��Eԏ]�L�"�x`�.+S�ɪG�����wZ];skxîKS�I���`�������mn?^"
D��wyp���83pxn��Z�)�jX�-f��|]��qf]<�<�
P���=|���T�j�������>���nqB<�][O���?^"�xY^�$�4#���P!��\��a����L�s=���U#Oq�"��DTVb���)���>t6Ne[ϕ���ڙ.����H�{���'W���S����Պ�:�e��o���"�c�Qn��<��
����]潆4f���Ṩbbh�'Fw��?�*��p91��{�?,*���Sa����WE����	9!r����Ec[���y;�>�HP<����֥4�uW������Y���9�ܪᙅ۴��$���(X<z��=
b�����bfhէ	��m�����mV��2�J0I��̐0�+>B�6��Dï
�h��x�ݝ���ӓ�5&u�$���/���/�Yc(�wW(G+T��rV�2��{�w�x��!��{b����,C>&ďM��;�B9Z�k�?�{v��K��]^^�fn�I%�O�7�8��	gx2��N�R��	��� �Q.b��sj�B|
�h��KqQ^N��Jv}��G�en��&�>�20z�Ov�#i$ģnB!��`oF%�7����y㳗������"��0������?����_��/\��      �      x������ � �      �      x������ � �      �     x�U�ّ�0���R�$�l�ql�3�C����F�����7=��`N�����ML"Zb��)�e�7�)�yF�M�EW��sq�D���Ɏg�	�H��0Tz�}����N�f��'=l�Uا� �v]Zpj
_�W��͆��/*�F�;s���ɰs
��Ʀ�k"��`�j�i�.�F�ɓ�[�����Z��83O����\Ԃ�4jǋnj8��N���0�ܿ��M+�gu��n$j*t��L�&w�Y4�b��纮%�:      �   _  x��ZM�,7�\�O��%(��:Ĝ`6�]}�_��?Uuڃ.�fw�I��y������B�5���Q�Sn�s��R,d-M���|y�=˃�S�1����$�_$���A�?�����������[����������&y��5�>Fpm% �k	����RZ��9��_�O�gJ�$�\~'�W�#!n�u��-TȽ���!�^�,�g��5�ME�!�F�#!m���Q��GJ�(�����L|E'��V�o�GB�M�&��qi�/M�P�j�����N|�SKhِPXVX��X1�6��FG�BW��K>[v=��KXep�-x��2���:�G���5A�Z�B)=��bJi�ۑ)>�/'&��	�G���PiS<3�Q%���sN�Ƨ�c���wC�F�P�h`[�jl ��)O�ˢ���ޢGB@�K�VWR���@�s�^�{԰Ѣ��ܿ�k^S�ը�������K=bL�O�{��������]G�l#�J9��&���"~,]�4�0�b[Ĕ9f`JUFm%�s��~E�M!��'���Pd��3o����kGˤ�A8�j�6C�h����Y��
Vg��H�Q��9��3�%,�g�n�������&�f�B<�N��r��H�p�eX�\�(Ka.L�� ���(ϸ�rS${C�M��1n+��!�9�����a���̑�4���޿F��8'����#�/����7��-T��w��繅�2������J���J�|0 M]�����;����/�L�M�%z$�#x����0��М���A����l)2&�m�`���O_��է�~�?�.)��.�����ଉGּ�4�d(�
fEg����%Z	,#m&�fhT�ź�7G�E�~��7�s-�:�� ����Ƨ��a�,�|������|�e�[�w�8�4%�(��#%^���o�#!�g'�H>my�Q�c�}�aF3�B��Ղ/�_MR��K��~d�sU��Bo�Գ�I����L2��jUu Ed6X��s���K:��Y��Ğ*#�4�a(}�� �Lv=�~t��=��C}�� 
����U=0k+V�q�"Ԅx-[qY�,�Q��!yR���t��[�H�W�Ȑ�X1��f0¢�m�ŏ;��{Y^`�����6b���E�g������]}���`|87<<�	&�Ò+O�}��F��o��{�d�T���$��~-L�=y�
�RPG����o٭[õ����%Ʋ�{Sl+­"J�i�[�u�1Ǽ�=�^�4�k�بk�B8��
��m��+tF�=��d�KKB�b����Äv8:�&�=ꩬ����,��K���9��i�įl��oz��*+#э�Ixch��'����J}��9��䁬s��p'2�H��W_o(!��eBvCeo�S-�4 �5,W�lx�������R��3O��S�I�(	9�㯢GBٲCzᬽ�d������F��}�0-��y�o�K�tՌMT�}�,�3:R%�ר���H2��E�x��c�� ܡrM�o�*���[�ow$���6z�����R65�f)�����ز��2��ܳcK����葐�J���L"OpF�� \�ږ�?jY�\5�^�==Y'��q,�B��;��R�Ɔ�w+�&����D��D��'���!4�P�0ZFY.�Äb�1���oѳes��Cw�mH���gX4���(g�)�����*)��n�g�g�9�o�_x#?W�<�~��qKT�:�����k��X%ġ[�µך�m�B?���N��{��2,E��mQp욀�@�/K���?F��v�GB3��F�b/TWn�[b�'��L�J��Ұ��e���m��c1#�����4j 	��o��[����y��=XQ�Bʐ��G�9�Bs�`n�h����`�O8�<��8������"���e���"�6zb�t��O�=m0�	2�n� �?���|�"�[�o�S-�	KC?��M�D	�l��Pz8���^U����_������-�]]�V�����=1T	����e_et����ho�l����WU��2p�r�������뽌̾i|�Q&��2ŉ}��m���"�fs�
�0ۋ'���i��Y,B��
x`7zP�CG�[�� ���Po�Yh-�஗L�m�c���a¦)����>zN��F:aW�<�!0�`ڸ�l�VY~�[h�}�.��c;��j����%��Əa�Y���f����d��m�U/������	���<+�:�.�� �:�k0�����0!���N.fxI�6�r���
(F�`�`�}���A�h��W.��#�aQ^y�>zV��B��}���Ǿ�ƶӚӈ��m���ri ���<Va�)V8?�0f����Q�}=��3z��,�_J�B���$�9ú��#b��ʀ���\~[迉�;H�a<"���y�T-��a���7O��{�L��Fٯ!�
_����KxI�K�n�/-#��Iaz.���.C�*9*f�3i�۔�Jw��-z.EА�-^�v��9(V<LY��>��d�b��z��K�\���0�lq_���7���m����~7w� (������U޾;�+䵉Uy����d�i�Y�O���*��5�[�t�����[� 6:6j�<��?�C��a��^� ������!+�E���2�$�[�-��;��쳋*����\�o�K��-lH�/6	����98C�4����iB�|���~��Z#5�D�r��4�K��^��>���o�����D���Z�l,8i��cR��Z4p-}���|��o�G_�>����԰��C�J�:5��UW���<�M���|'�ߢ��h0��=��c��6S t6{�ԓ}��������-z޾v�o/s�N���v�u9����,`�hTQL�u�G������5d���B*Π��(j-�g�#ŭ	՞*Wֈ��n�GB%�"��Y�_�u�h-D�n)�\�-ЗfF�&$%�3���	�:,`�u��g�8�k��b�ԫ����� ~&G����Fϱ�޴����<V��mW]�ˀ���Ät����NG1����п�?����l���      �      x������ � �      �      x������ � �      �      x��|YW#���s�_Qk��v:�O�<b&c���%�$x��p���i���]�1U�7�
E�SD|
%Boў/�?��"!E�1LT���4�k��0�q��ƭČ���n�G�_����&�������]�M�/Yx�^dn�tҮ��~��ǎ���$W8;[��I����� B#�#Lbr��)�1#�H����?>>�/�GS-i:���z��-�����wM�������������FOF~�3]����{�R����~;�L�3�?$�'��H�+,��k����C�/�B��E�`�]�)�N8Im� ��1E�at�~��j��a�7��Ӈ�/f��ׅ3V+u�q�u^-U�'��
j��wO�Tɓ޲٘�j�OM�O�O�:E*��ßC�X4y��)'1�i�]|2+���ٖ	1�����bs��:4�+J$"��4�E�	1�Ga��Ah��vZIs�v�e'������3QnJܽ�O��}){{Yp�%��(_x�N
��9<����nQyJy�0֘�����fT(�]l�J����i��m��bv��)�9Q�C�xkd�I�X��#xd����q�`{ح�����-ͼ�@�X�L��ۿ	g�ڕ�����~<�|�^T�d5��`��וA}�&=�$b0�����!�?���_�b��$��~ߚ!&�7���BR�O|���+Ύ�h�$2J�X�Ui ���(��F��NG�ٮ�Z̻�J�c��ꑶ;9Y���w�ry��d@��4����rR�O���e@<݈�RK��f�lgk4AH�*�Wzmó-Ռn�϶X~D������D#�I�8ؐb�G�Qc�ģ��Ax�vگ�8-C�A����f�9��l~P&7�Ψ�f���?����+�T�����姚�'�o����;�8�B0Ts*�`;�t��w�2�R�ZfO��;�-�T��]���a� �`#��o�zj2 ;�V]�b�� o�'�"���")wMPZJ�K�q'	5��!�ÌhC�tLa�(�|B&���̬�$ �P�N�N"橣%���{c����_���푿rI��X���V�sv�|n�<�E��ts'�Ä�Z�����iJ��ڎ ��a��ѿ���h��G�����>�}�<��j��*�1�+	6Y�4 L��q�k�J���A�d���s]<�.߮]E�v��|v?�ǝ��]3߳�����{9�<tY�\d�ubv�9e8�!�k����z4E�ۤq�J����m&�N�q�k9$:�o�raTˀ#F��tbWi�rDg�
"�]xrl(rl>]2�,ht�kL+��}�U����oT�x9�6ͧ��f���ka$&L1|0��͑�>3Y���o��J0�f�����IЏ��1�F,��t!D�J��Yk��{��Қи���.kMz�r]����Z��d����F�d����R�ΰ�<�A���/E���ৄ�)J�x����Ԇn{��Z8&������`A��$�r���4�4b�U!,D�"!��1I��h�V{ךݪO���)n��$��j��=���읺��Ȝ�Q�z�J�^Q~z���T��S��)�w��9#A�����Y�����t6� &y�<,G9Nx��P� UV�80(���o�� :�|�ҳ��߾�����d�ʝ�rD��R���,�����y!�)/��w^��^��_�1�\�?#��ђ��Ģ7�~��VS��(o?����Dٰ�w�T����FAprD�D�s�p"F	�~�
�����|���E�Phg��x4�FHb$���j��s����8�E5�U\�5QB�?��m4EL�̭���Z.H��%bk9>�sK�qR"QHG!Y��Q�%�V�Dd��zӑ�E�g'��I�X��IuyS(7H����5���W�U��<�&��ҢQ���/i2MNN���z���/���Y���L�}Ƴ~�>�&�[p�<��*�r�D&X�,�$	�=L�(�Ż�Fe�����`xܾ��M�`�y`�79���/������(J'�\#_9+B1���?H�֣"�X֓*������~A0WG!D�wU����R�9�y���85\��4��Y>��ҴN�e�������O�g�kwW+�j���]>�ꎈ���~���I�G�g �A�(�Лb�(�rD����!�	@�b�C"����62ހ��JC&D)��-��n?�hf^�/{kS�����6�|���L��r�CV��;�xȿ���S����}�h�ְ��åa!��jA{rՕb�qq+� ��gAkA �G �J�,�O$C�&��V� ��Qȕv!����z6������'�-a�o�l���i�F�n|U�=���������n�;׷�]M�)%1�쓪h=Z��Л^{�y�	1��|�r�u���� *�*8AZ�H��7*Q�#�0�Iǿ�B��_o��糋��d���TG�&�ƙ�+qґ�Wq�T�>�_�X��ut�';��陟Қ�?H��Fk��d?oz�K����Z�R�9(=�1��N'�E�!u��3������H�-%�p�Qd�]|D�~;V�V�rڴsr�2��C/3��J�e6̕�:^����g�z���);e,�8���>��b]	�6@o���m*$0�e��(ŎQ�K��Vb9���	�"����	�!�p�����_�y�������d~�����R�ᬬ_���섌��Y#����v��\B<T�a暭��g]���y�>}�G�m�y��-co̓��=�R(��Ǩ�e�K{Q0��(��B�6i~|��}՚�j�	N�!_�W��B�g��gmZ����U�3�]�+��jV��P.��S~�hW�g逐�����P������`�$�vk�}�ۿ.���ޟ�4@lΕV�7���Z��s#��1<��	��a��I��V匲�#Շo|����g{�W�z�f�y�+M�6ȹ���7����s����ǋe��*��:�})��S�b)���.�a�ѰmUʘ��u�Q�C��Kւ!�^z�#��el"��s@%�i� rIT����fn���{Z ���"+��I�1������L<-B"4ky�<[�Y������j���q0*|z
�.bX��/�=@��!�7�v�yWjǻmIE����:����3u�C��W\�pq)y��2xupH"�ׇ+;M��f����5/���%;��ͺ���5;���s:�4^/���s�ɹ�N^š��$m"H��BZz�\a{4��n~���I��1_p��F��9��W#��`j� #1�Ǩ�(J�q���SA*j#�'�i�a�fv����K��i��\w��{ʗ_��ϩmw��iM�<��N����8�P��h��9�|ຉԟ���Ӹa���QҜX����6Z�P�yO1���-��H�O����b�1�X�|gK�� �����-#�r0@+��;P�@�V�D�L �\I�m��8���=�J*�!���"���?�?����h0Ƅ��g"��(�Y�)��7[�l���5q�^��R�[���hpVy�'�>��vt�ԙ�NԚ��Yg0�v\R����J��\}k4����`����}�]*
4u�nI��1ؠ�AXP0�)�����#�U�A�y�vhǄb�����6)!�����{���4�լC*�"�Wu]��A�{��]�e��\烪��넧>
�S�@YA����Ӻ`���y�:9���t�`�Ko-d��P�["<I`99�.(b�J4��p	��њ�9�t������mG�vćR�yR[��rp�vɢo�Y�����Α��rpIە�]F���̓�NOQH��4 ���{ꈠ^rD���4�O�w@�D����"��X��z��p�@:$��<if]�~����77]���'�g�&���R;k.^'T��e\�e*jؚ�YyVc���_ks_����֮�Gʑ!V$��yB�� �3B ���o,�bx���r]˥2�4[�a�����[.�&n��	�c����S��1��-��jG��aI"#+�����9GEb��ح��b�R�=F�Ym��c�&���}��ߘ�  
  ���
3�n�l���<�@�V^`ۿ k���NPldO�
�h )�"�� g�,f�,l0�K���:��9,I�j�����ư�{�i�ޚ�3��o>l<��u���ˁ?IZ�L"X$�b\���SGq���1��o��W���2{s�uj0�pv�u��L��"�<N�/Nx�D*���mƆ��X��[B�k��a0w�jZ�b����)�u���Vl���{C4�	D���D���Z�/�sN�?�ϝ�<�>���D� A
ETr1��QZ/ �,Iyv��6��?��+~�I���R�h�� k�&����w;Nr/�J�F3�^>|Z4��	��F�~��6O��A6"n��@)�}|�h���;djK$B%�%S@.D�"
.��co�A�hO��,k!���D���MJ	��&0���r�xh>=-����(����r.*��mo�\�*Sl\/�-�o�₎���F	��$kJy�辏f�ۥ���k;Ȏ����^���ۄB�p�mq>J*��f&� ��!�N[��^PM���;����;o\�������Wc�4�mTs��gs��Û��׽�ш����������4�*�MN����r2}~�!^iH�K�),2�=1aN:��{)�J,���x�-"R��H�|y���^��۟g�9�dLm�7����(�f�n{�e��PcXD�[�8E����t����+��N�v��|LTvV�]�\x� �2��J��v)���'i��
�������^��Ӈ���i�	�	����G!M�$��8No���D
�_��u��p����h_D{�����Z
v����!:j�����TZ�����M(c�ύ�|�P��Dv9�)~)G�kT �ē^�][����4s�	m��"��L���&S��Z�LA[�(���@��D:A0�YHJ}��x�`aqp4$	CZ���YzK��p��Q!���>�">	j�}�)��3|��p�է�x��_��g�O"!�ÔJ��r�_Q��������0����Z9;��4�@��d^��3��Xۗ�&S�ݝKS&���J	o(����V��j��;�=y�����0���l`4��ץM����ϵ�l��C�r`$�n���Db��I��I�a�G�i�=���m�~����T�I5ZO���xT�ie�/�A��+@��T>��E�za&⼧�y�@�ݵouw�[��dHB����yJuz���l<`�a���~"�K* Wd�Xb�3�� ����_[�XP>=%A?F~jz�	�W2�.;~����r�)1Ҙm�~<M;��ۇ.��@h4[��޺�ZuFv�����>�˪�S��/Q��)� S%�b���11AXX-��.|'�!ϓ�b�"����y$�N��8�����1,į�3Znn0SI�g�Z�v�&WY=����O�N��{��4����v��
8ۏ'��F���:.�4��5�*m����p��_ı$Ǫ �}�7y�&ѝ�!���� fHzsUF(���\�&��d*(�9\�>e�OzЋ�W��T{ 7��y���6?y�f��N�ԋ.���]ϒ��"W�.:��RҸ�U;��=�8=%D�2M4h�)/= ��/��80�[�}&um�o]ؐ��c�`k%K��4O;�1�E*�K����0e�a�{�������h�_�y5#�i6[-9z�Ǿ#;��Vx�ߡ�6��Y9�q�.Nr�}��+(Ҫ�)��\l]�猧S�X����">��Ԍ(k�p"��3�I��i�O�9��Q2�ͷb�ە���-�	�\���B����U(A�FZ��'��J�z[��5j��'���#����&�(�H���A�=�o�XJ�Z�~x�o�{��Ǫ�-4�L��d����hBw�!�����'V  �$�v\�wC ��A���w̝���[�X�\�e���C�`	J�2^qE��wf�u��'���W�4�M3ju��x�X~�P��N�����>���8i�c�z��Ԥ����z.#����y��9�<�?���Z��A��w �c_�����.�5/��[�~�B��o>H�N�����(�܅��|��3d�e�`��%D!��&xG�)o�B)����R��)���^=by���7�'gW�<t^z��P��M��'�/o/�Z�J�'�s�m�L��AՊ(1���FocD�3�z�Tz�I=��=�5�����y������ݮ<�m�T�a�L) ,5;Fp��>B6���
��0ou�h�����	��[ӟ���rw2�^T�	�N*��R4����53=!פ0�̮��K��Ǻ�3	����@W1�.���3j(�#+Ty;V.$�傢�+)R/�=���G=��Pz��i%C�o��T�nI��'� &l�R �|��*�$�ੁ�'�p�n��S���{�x��:e�rv��.^�ȗq�.r���iS�Qf�N��EO.����\l���&mҋ1S�����S|B �� f�c ���h��-�������L��/���)-�n����t)�gZ\'sQ����_�L�4_      �   V   x�3�4PЂ@��Ԝ�����ļ҂�����bMΜ��Ĝ���NS� +�(����� 1)�85>1%73���3Ə+F��� 6�      �      x���MϮ�m&�~�+�u�d}��E�x��$/�`��#��[�n�3�>����b�N���$�6_�]O}��/������?��/?~���ӟ���?�����w������>���o���?|���?��~����W#���~���Ͽ{�����_��'��T����R&��Xʗ�P;6����^T���E\�! ���-�8�?V��J%o�	��v�'��R�:�{�^�eY�������I�<�S:��*P�c�̭h���F�LN�cu��H�w0!n�����FT9��kI�S�u-M�z��q#^���yݞ ���0LJ��>������%�	��j�jbKgoj��K��T0��(�*�ۋ��&�kVʻ���Σ��/�2'~\����Ҕ�^=����¥�R����:�,OC~+�gf~뗥�D�c'DS6"�T��� Fu��X|,�(�y�~�_σ�ii�.
�&jm9����籥r5��W�_}�]Mv�[���~�(J�����n�|�L�A-��	'׏KA]�U�TK�=�Q﫹]+�˳����3�|ȩ���(z�[Z�}�L���3��G��I��X�<N�7k�>�C�>�_�ei��zBU&��/��K\�sj�~�/q�Z�SU��ΒO��sK��e�X�B�y-��$�����Ǉ���C�]��S̲�]'��fV����'�>n�ǿ��x�Ȕ'�����m*	oE��9RY�JR8u�!�ڨ�B��,���ט-�zL���Y��p�hŭ����#_2n�I%�Km�����zsg2aԛ&��?��#s��Χ�Bz`���c+d�&enŎ���W��451�P��[�q��l�@���Ք=�R}n�˯q��
ziiZS��G��2�[�qVz������a�J���g[Zۇ�n�)(�bj6d�+A�1=� �Ϗ7Z���Z�c���W��Z��#u�1��X����߆
��X0��-ej���jC*��7�����q^�D�IŦe^�����P�N8)� �_s��K�sd@L=�[D��jVq,
�m�~�,���U�`�$������T���24������+�}B���i���܎7��r�x0/R]��]\�KS��#��EH,���W��mH��xNʰ\�:4s4Ru7~h$��5^�-�ѻZ�)��\�΢��K�ɉ|<��q�ܠ�U�}�j���Nu���X���-�^�,��/#�bK�����J8�{ [c�V�El)���E{����E쬈�6#.bKI��EhV����c�
=��-C.��*4�F5Ӣ;�R4@\��X�	I��̴��h˩G��,���k'�K��y�v.F�s^Z���Xk<V}^p[�ja[���e�W�yyM���c�N�Ex;�K_u��3:�D ���ä��؉YUi�-}A�xjŬ���up�yb)x턋�2�r�%y�R$�؟���ex�Iv5%<��3_����Wӄ��*��-��ο/�R�,�V���G(SU�U��=:�W?O��g����ijrx![
�i���Yt�A��3ytHUa}��!ʂ)q/��Pe����t	�ږ���hS2��Gb'�D����$o�'y/\AT��5���&�"y5!�~.k�)��-}~(��Do��굞�N�h.ފ-e6��������ǻ�R7���-z��\k��d���q���Ի�{�zĻ/�M�=y����z��#{��Rh�;�����R����/�iR��*Dc�^����S�����X�����e�p90�TA(*�-\��/��F���z�/Wo'�DI}�BbR�%�j��_>���κ�b�$H��JT��(�[m�����t�>ΑhL�Pϡ+�"��a����k���Ͻ�;�d}�I��B1��K�PG!\�jKk_�`�m&��|}���/��U�-gsh���s��9������`Mm��y��c�#���J��q CS���`�re�H9fݽ�������a^-_��H����f�:��DķB��N,��;W [=,'���㡊s��q�q��>/���W5f��U�ԇ�ҼQy{��eѵY����tg&P܊-mVh���mP�>����9��`�|��5�p2_�o*�=zXN�'���(�V����Nwd
�Z��o2K��[�ר9]kͲ�)��y�I�ӍH���Zmsh�2=opy���y)һ��9Ғ~���X+�u=]���Ř�������=Nnܕ���q�5{�%�Y��)tW{)�i�kEoF�yGB.;"D����j}�3/�3��[|�ިb�e�WO�-��ٜ���L��p�NA;'�=�Dg��!Os�m<�z♐��r���N<-�8_����;�h�k3v��ԱV��x&F�3g��˼� �j(�M�ϼ<��6E�Uli�a7�I��h��狠�n/��:�t�jb:�|W-��:�,%9�ѠS5G�2\�M3^У�u_P�j��� ߾8C_�!�aݽ:C����s���o���,����?���?���?~�����ß~��o���}Z���m�n&�~����t������?�o����?��O�����}���O?���w����}���o���?������O���� �ӧ���������O������?|���?~���?��?����������w��{���v��������������;���&��_}����Ͽ��Ͽ��������O.���������Ͽo��o���s~�黟�D���>�(������w�~���z}��|�?����ǿ�?�Q��_���Ӄ���~֕��o��$�z���O������o����?���~���������=��|�_�?e}�������?~�E�����_�7�_������Y������O�����_�ͧ_�=�������|�ݷ��?�.���?��_����O�����d��)��w��D��tl�o���9�Z�/9�v�c\�%�Ww�l�.u�JoVᥣWn�a
���U�0Fh��R��4ˋ'4����1j����M=�=Z���%1?X�f��D;�H͖�c&�I��k�ڋ-���,Ø��b��:�N8�	��Q$�:Kmt��r�]�#�����/N��5��c��ι�š�h;q/��U�W'���Nq�$O�vb-�:����	��i�u/�i$�Q���|m���I�u/t��jb������w��6O������q���m�Ka�
���;U͕8lS}�q�y)�`L,˒(X�,5o3��'�R���Fl���Ġ%&�ȧ��˵�ҹoF��Խp (rk<�]���g{��I�5�O�����kkm���r,�"�bKŌ�݋��?̼�����;�覹�V6��x�k��5�Y^��$j��r�|�-e��0�S3���np����*�A����\�Y��ܚ��̪$�#����C/߫_�i��!��WB��ɝ/K	�]�q3q��:;P��˳4i��ݬ�J
����ҺB@�Y�nhQO&�L����N�G�s$�8b�km�T'�Oi�� U<:�*���
����;1)�7D�s$S������ė����̿m
�UJ�2���.␊�c�Rt�?����W��5�7;���=3��}��^�0̫�7�<����Woj���s6��Ѥu�<���,)ו�x��<�_i��������r����;���u��*Ԧ��T��9gL�l���dҋ3��yK�3��L��ͅ
���:�j�N�y�ا�I]����o������u�v��h��M*�A�r��<Mзʙ�Dp��CZy�������}y���D=�Rk�ک�k�mc�7���4:�`FG<%���O����Kw8˥].��t���j��c请��[�́`2G�gK+�5�:�]�����[���-mf���v��A"I��-
��2� ���w���\�����������z��J�m a2�6~��^��O�u_oݺW�7��f~Kg����&1�<��W���ne|��Z��z��\��N+7`\0P��&��5�Q�(�W�֬�� (�~�*|����ߝ#    �\�7$[��`jL��n�϶ľ�CZ�%��r�����׻������{�܍�������yI��x�j������%�G{͚E�<�/�Ֆ�㍕��Ae�)>A��7���WV���x�T�ª[�k"nOw���WaiK+�jCb��%�{��#�6
��t��9�e(��L����Sl�?��6/�
u��x-�C{L����~A:�^F�.�����W��C�ia)�נ�Z~u�/q	nNe��1VV�D��*l@j���Yߣ<%]J�K�֒2
\籥s7��|)�nf%���J^ظ�z8�Q�h%{z��C��!ݛ�:RO���:|G`�a
䐊�䵌g#��t�;���[�K�a�-��E���y5�xo���,6�*�Db�o�4-�Q����MeKU\;�H��ε�;�~��>����^/�H�s��H`��`����Z8���=��c�����j��1vU�4�QV�y(y�sxxԣ�p���LRĀ�Ы�6����Kk�eZEýf�\�p���I�|G1h���7%j�/5����� �����D汛J�k< �:)�V[�U.�b�%�c�'!�:�I��Z0`����S��j`�>��V0?�4�N��G�k��u#���bK���5<�6�w�I[3���]�h?�/�ᦙ�L���R8�$h�pP��y�C�'��D����gn�ø��na���cO�yϕ����/m��t�k��ɓ�3_*tK7��bZ$��aBk#�;��%��!��R��=jP?�1�d*"3&�1v����B�`��ƭˬ��^9�Lz�����AFw��'���ݵ$ahWL���H[�(0q���6�
�<�v5�����rc�V���h���w��heF5���̦a��ʉL���2�V�Ǻݝ���6�3�2��;Z�z=�ܦ=V��I����E�NĤ�V����DP��{��_�*���#(z$fb�_{�~YXaZܪ=98W��􄾐�2i�]�S�?�{W���S:���P0�H]:v]%2�����a�E�@b��+����Z���s���n(*��̴&�[H�{)� ;*�_��X��b����x�l[� s�z"�N[$�'⤪��2�Kk^��.�6�z^�uIA��b�B�稐��g�F�8�z�[�+��(zE�i|P�S���R��@��+��Ь�u$��V�������ۘ�ę�+)����51˞�1 �x������s�D�=v	F�N�7�I�/���X6��b�#��;oi���-�$�?���땸�
��H}��"x��NH��9�mXd2��0�V�G~�õ�6�����H=�3W�Is�j��8��O[��^#��z:v���'+ 	���,��q[ڌ�J�ybU�2����]Z��&ű����n��{���B��� r*����W�DKװ
�3�b�Q�VM�d*qtx�Gŵ��B��Sx�=*>"㐊�Zx!�J���8������V�I�j������!?u�w+��{J��]�J {T��7S����D���a/�V�GW5�hD���TEU'Pg8���[*�a-���y�}�%��V��ĭ��y s>j�q�.1�X[!�rg̳�ӗ �.R2OU���h��a���uH�x�"�@�+l�ٻ����bl!UZ�)�r�q��qy�3�'�(IHQt13�8�����o�IG�n��ttbu`TER)�ۜk,��|�o���~�.���xɚ�̋HT;mW��A�q���1��}���� ��x(.��EHG�m�%��n��F|]�C���L�����:鮻6�S���ah�Dچ���K�;�8jP'V,Q�ߦ��G��;Gd�uR�� +�.͙��I.x�O���mS`"1�t��҉���fP�3�����r��"�J���X�����9k�������l�QU�Pt�"s�v���ŵ�eK��z*l��%y���u��:�D����͑�P���eֶ=c��G6#�kH��k\/�jN�[�i��Lu�-��Sy)�-�lTѱ��.�fl۪��x3�����fS<p��'ec��m�+��8�G���J`�=���-�R_s�q��wL5���iW���d*Lz�~�<yeu��ތkOJ����%�����$W�Ὄ(���z�ڻh�%���mH�2j��p4��7-	S�}�-�j�)��Za�=��y;�s]�r�N*6��*M��s���hZh�8�c�+\���y�h��.B�?�k,*��Ƚ��fx��T#{%�5�yΎ~ȏp�k;*��1GMi��	�C;����N�4TR��G��	_w3�����!�����%�k����<�lx<���<y���!��Ԯ\���
]�����i���נ��'[��R]��`|���+��P��ŴFj���w<����R�	�i����<ܷ�D���et�
�]�#�d?u�g@����h�Vl�%���s��;���_oĤ�^�z��U,xh7�c�!H�U(���UDz�ӹ�Q�(��M��kY�.�}륜�8��:�H�fZ�����j�)�AJЪ�	�h��Н*��s�A�ȫcGk7����V��x) -YOJ8���{�pOwc������"�!$u�s/i�IH�t������#�F�8���}�^ud��<�qa��G�fUu���Ƌ�a�G�5��Ȫ}W������~�Az��B\w*��9t*-����A���R�{5�����};���u-|�`(\Z��kw����_�V�Q���WZ���n�
Fm�N[,�W��k��~�?�Ң�v҆VY䮎NV����oY ���hͺ"��2��龏~����-'���("��YMT��B꼜OWj�u�T�ҟ�T��H��f�~>�E:��X�w�xCM
�ȅiH@�����tט�Ѧ:�n����:[�lׁ�[��"���^J!���O�#�(���ASz���Lq�6g��v,�q�3$�ఴh۝�F��d=+�������b`'��jR�:1ɐ����^��m����z*6�l5���-c�+L��y�˲�(��������7��Lq�=sN���RU��������Y+���$��p��\�1�V�������Q	�����H)k��@���c ��?�'ԺeS�kbV/��׺��{d��R1�h�'��:e޿ֵ`�q/�#T���YIM
g*.��9�y��M��)�jI�qyo��O�w��s�dhC$6꬙g�c��'_nƖ�7X����6�V�z" ��b�C:��Q��d$�`i�E5���2��[j���4Qs�����(�;q���2\BXn�˞�s�2\�g�Ȥ*KHbG�o�]��}6fR�����-�W���WGY��5�<O�^��Cj�:4�Z��?߿�������}TE53����c�LC��v:�?C��ڹ�8k�����Ѩ�q[�6�QA����l'J8xmƖξF��3M Y���9�Үel)�B���v	#��m.v:M���ė_�-�����*�g��Ձ�����y;tn6�,�	{��=���QJ��ȵ�eK|��*GU��L_�|����(����cbG��\�۹�q�U�<�qrY	X�u"[�s�dT�u=����.m�o��;:��#i�6��N�ٮe�)k;�g��$f�������e��č��y7����^�0�k�@C�UN7�K&.�PV�*.���?#<��8�#wm�@�i�=�^q�o�3^z	�^-�OƓ.N�/Kw汒���4F=��� ��	v"�i3P�=_&м#�-�}��U�L��yas��!��CZ-���A����B����S�(^к
�A�3]q��S^��V�x�q���������F��됎�v=
 �J��s$���1jO'��Q�U��<�z�z�%�C�¯j����E��a$�I�C:�%T�~L��� ?Q:�cU��OM�W�ס�C\�Pg�ϵ�<X����C;�ґ0.����UN�ڍ��2����&�h�|D�V�>�23��}��}\w�1���ihOD����^��j�<�-%��u�9Sg߻j�TY��    ����pU�������V�SԼ10Sax��J�-�R������5h���j��V�C:g5�6ž����k��Rn�,�vi�HL�{~n�v��by���fD�{�}]�µPM[EQ���ttu�T�Ѯ:��Y�`\m��b��p]س����T	�,,�����z����מ�u'�zIL��39�N�w��|���ાgMk��n:��f���ćZ���W�:�%dYUG�L���aD�aȖ���ihC�w��eG���D�5��r�6�\q�Si}�U�m������z�LF���T~�j�+iGm�hH�w�:�����Ls渗��h϶��Jj�Y��M�]��hڷ��4ی��щ=��mDq3��Y��*��,���Kp�:�x&���}}�&���e�j�0�*���u�zM�"�zo����y����jsW*��E�����b.1���`W�$|H�74��ʧl�Qk��gj�����B�9�ݎh���M+� �s����f��A�2�)�Tﳭ$�U<��&�2�f՞KNC<z��N����ڜ< �	n��Ը���:��H��l�_�߈W�Xm�I���i�C}�ҚRQ@���*F}]Q��:ƻ�L?)v���Y5��.-q���75\q[:�Z t���,��� T��C�F�RYm=�U�3�#�rʖ6�:� >i�C���q[�Z�x(M��i�e����Fhk;�W����i<O�����fx�#�j+�fO�,v�)��/��� V�K'�d�x�U����d}C���Ru���q]O��U}�y4Ј?m��a���!���mʒ6g�[�c����T�:Al�HL�v_a�ظ~H+,8�i#�[+����X�T4W[�`M�����������LL�����R����A��u7��z'/A�3S������|�`Ģx5�����Nz�
IlC�+O�'��>�L��$�5zb�g�C�҇���ј@�O���)l#.?�Ň�R�e��%PS�{7�|�}7\�l�@G�gI,~�0����3��^H%1K��Q�k~ha���Ӥ�N�k�}\&ޡ����Tf�Ĥ�����3,���_c&����v�������艨�����t��2�.��j=�Vp��b�a�ҁݔ��n�T7�'�J�������V���O�Q��#��-m���@��fM})B�9V��	wc��Z���pR�Y�2�?y�d8�����-x�n<g2_bW� ���.����ڴ�Z5ו����~>.�~^Z��(�`bS��x@T�nl��yS�w���}�&�֡.KZ�Ԇcb'��Y5��#�I�F�U�FC��C�W����q Л��t`���!��yd��P������M��,����;(����0���f�X�L#,{��c���n�T��ѵ��E���u�M�y�НM�@C�e(���=ϰ�Ag��܅�T��8q7f�ʡ���4oC(9s�y=��t®[ԶFod[��D#om���o��rY�;�%���0�S�K�� �Zm�8����Ձ{�����`��2���n�@�!V�R�kع�-j����'E��͜�&��%��\�o#�h����ZB��Z��q�_���22�`�4��� ������̔H�N�Kj��8.�ruu�

����c�7lNM���5h��q3�-��7�s�[���!���*Y8��f��5J"��A4��U8�����*��H)`�X�Am񉧲.F��a���>��El���X�&�*�<&&��9�j��sKE]���.s&H��8��y)4�1��0���ẻq[8p5���_H�'�^��No�I��WK�[=�K�h8���[U(�ġo�tOL�_�V|�]�*�+/5�$�#�*��R�U2��٣�]������D��2���V��s����~
�UӺX���5�����xu�2sA෦������B\?��kE�<���iD��y �XZC]��F��#A�m��R9�5����6��m�GP�F�����i�et�L��{�@WM�{�1���S�M�`╀��¦F������K_��Pb�+���!Uk�Ndh�
$f=��\�P���a׺R� ����S�V\��l��U���$6���?`���jhho�*r\�������9��]杞�(-��+g4�&��G����c�>�u1\��QkZ#����^Vg��J���y+K؜x�UQ]�2&G����HUrM��?�`<'����&�gb�w�����#Zx��f|?������3q�-��flig3j���t�<�C��g��; ��O��y�yU
��g`rH�Z�W�8+�z޴��ę��-7���8�6}x�J'=���=�w�_��N���ڹ�u�����.���G��B��<��`	�� L5o�ʁ���Zz1oG^k鉅�y����o�p[ou�a�t3�/�P�=�-�F)��W�8�7��V��p�Gd����� 
%Lqp�.��g��}��N�C��u�b�.n��Dcdj.߃'��T��W�4��>��.�f)��Z���*X���@2&��u��.�'�Hv�|�ӟ.�UҀu=u�7��<ݽR�_�đV4K��S)Hu3�{`X<�r#��`��ͽ�.��E=�el�$�'�/i����A�R\%���=�B��k�p��T���"De���_���C���K�O	�H����������f������|��t��O���xg��a�臜a�Z�3���	�������^�`q��L��5�jW�:8Ӽ�鴉��	k6M+z��A5�q�M.��^DsAK- y��q�@�t�i�P��+�A9�*�c��6[ɡp^�4��>�#�܍CZ'�2��䧅����i�w� �������; D0��T���V�0��5<����n�������¿+�^�2NN��XvJ[[LjJPB��w�)u�"ʖ��Z�4	+�5��H%���C
��nh#լ�œKv�^/`�(J��P��{�&^�Yh=�z$���1/Ɯm�9�qJ�d{%�7<G��t��Q0߫���<��z��=�ծ����Vf����<�68�9�z
����]3<�"���!��VQT�<7�lOe��Ȗ��u�r�/�mD��<.X񑲺(<P���a�r1���V�xW��D�d��W�I@�ŖJ�X։(u���O8H'õ8dۺ���:� ]��|R�5^N'��
��4�S�Iu�_p==%�
�@��[�������v�~R��]�����[ b���C�h�9w$�=!YP~� ��t�n*�>�Q�2<@�	;��z��"��Q���A�:�L�!�Kq)�L�?<��9.�I����V)j����o�y�9[Jd.�܋��>82&��{�D�B���+/2��]< �R(F��\�v�gWq)�'2W����w�3iZJ�+���b�5qfw0��TҴ�1,����z]'���:�lpb�f��<���i�b�����a��纥TV��K"�5������j���:�5SwY2zÓ\�rY��N���j�e��^?�؋����T��I\�+G�3N:�bE%
���D��ƛ�pNȮ�|J��x�f從[:,�+Tiy�q��P���XJ�#�@ߵ�5�'ą:Ξ�S��j]�ʛF3o� �H;֓���>��k/Q y}*�����ѕ��Lf⇞Ib��S�#T������_�"w`bF=6Go�;q������Ȃ�kXp�@b���t����z�(�H,b�/���;� 3��W���{C����NZ�%��� � Wo��r/���ϩ�`O�G��p�z4m��y�����7��GoٰRoW>�Ym��\
<	������I�2���DpHYv^�D��&s��J��D����(�K�*��\
�.�T�>�!fDtz�8T�X;:���xf6fxnu�@ư
�q)�e(�M��"��cT���q������R�x� �D�2�k-͊:��!1!|��G,�S:�B�'P�I	���X���k�q���_��(�i��D��f�    �$S=���{HA4�R�k�$/t����!�\Ґ���9O,�$X���R�}����P�Xꥣ����8�x^=ez1�,O��o��M;��Zr\y<2Av�|#r���a:C�Tzb�
,�x&[8������*��X������[�l���>�O@�C��n3�ڮS�#:���]�dK%�[��ߴ<�q���G��R9�����eg: �`Ĝ��(k�ԧ&�11>jb ��?]w�͑v���魃]r�v�U��&o}V+f6�\�5�ٝR�6fݵ3cf����O%�c���d�]C��3���{������S�CZb�ٓ���
��A�JF��Y+7=J�z�&�
��?aWnI�ȉ�4r �pߌ-%�l�TpŞ8��YX�)<>'������(121�6[�t�>�:�Xr��k��y����40�Τ/���uJ�N�aj��h�lK�3,����]�dK�X�(�abd�|jg��쥲J�3�v��`]��n�˼6�!Y�S�_��.��x�4���ADهX^v�[ݨlOi����&�{����G�L��U��������6�O�mS���)70����O�`�u$Ltz�2\e1 0R�	E�(�C?���Z����UH�@ 7���6T.G����j�H��wT���G�m֩�\P�%Vz�G��|�N*���k-�2=%n�teS\5��ϡ=Ҝ=�lF�I���/ʌ��G+^y�-��Cz����[�m���XV,0u�"�;N?�V�􍨡BaRkBE{�Gb���{!�9���M�l�hG�&�^�R����4���r��]q��i�`��FÚ�÷��_wù�]7@��D�qhG�#^���i=Ve�U���U�?��p~m!��1{���R��=�$��i�v	��H�l��5�C���k�<�Ohw�G�0a�͢��#"u7<(�mX]���*�mGOgh��n5̾;)�u�����3����G�q[j}�C�������q�3q��"b >%��E��8ˈ����`������$o����K(x�V'GȺ>��D��)ޕ��2����+�ޘ�ɾ~`z�Sʼ@7=�:�as �E�/(����O�gb�ڏ�������2�M��k��G��<9O)Yk�N�r��d? ��C9���3af��Ւ�.E�So���� 퐞#���G3Dݎ��[5���)51ۏ�`�u&��Q��L�M��y�,e�Z
[,�/󝸪�I|'��c�6Y�H��=$B�#^�����ƭ�咓ْ�e��w���!�@�=~�H�S�l�j��cگ-�֓^�H�uH�F��Z�V��ɼ�~�5$�)[�H��Uh?��"R��.hy�_�i�=�>���}�� �P������PTt=םz��Gy��O�G!*@�%8��[ت�2ʺ�y5\�!z<%b�CN(�Iϣ��]�ȭ�Kk8� K�4[!�#����щ����4��*s3���p��ˁ���q��
���W�����7k��Ъ	%V�cЙBF�N�Ƶ*�d^�܏T�6�C��4t��8��L�!�#����]��CA����E�4��^�ԑ,�\�!�<�	�6����8@�C�)e0O��z䉝��H��6�C�l�2$LN��A��\�]��{�Ô�V8���>�5��J�AE��,*�f�D�5ذ�tOV��<j���d����@1ե@&%1��	��3�ڑ�1��ƋJb5�j&��w�Ζ�n�qR�#��5�y����;-����kd���K#-�'��XiJ:�q��y�H��z%]�v2Oĵ#�ޣ��l�\≾ļ��N�a��ZŖ�]D�r;S��1�ӮE80�a�3ۑ��8���o+�c|����v:i�t^�o����sWD���n3���g�T��6 �ך��P�
���K����G^Z��z�B�G��1q�zJh|�����ߧ��gL�a7+Ƌ���Ϛ�!�1�W���..���N^Yi.C������X���PʘmS��&�&:�	�C��ʩ($�Y�\�I�[f�TNa�BAH!���O���erҐC�U�k��AփW�[iq���-�~�&3�&|����~n)�ӣ�24n���OvO��ċ�یu]���YA>rol�/Kю��iN<MH�O�w�*c�yl����<��fR}��@V4Oqy��6cq�K;���
m������ƟS���&T �sJV���^�ʴ����,�����麞{���XdM��4����nx��SJ�s]ϩ���3���N��	�8ͥմ�~.v#_��ziյԸh*�Ru�~�##x�bm~��
wYGbb��Qc^�pŊ�N�VA��q�B�Z���!݄*�\�8{�d���󘼠�.(>#߉�X|Z���pNW]��z5���i�z�+hx�j�t�m�6�D�o6�8�5x���"(K�wC=ӧϡ��Kk)=k/jf�N�8�J񳞫v_����ʬ�n��2.�Gn�v�+AOz���v/qv�t*Z�;��7^�W��u�2}?����P<'�h�D�E�f>�yj�mڄk��M��pp��r�m���+�%B���5���CZa��Y�k�v��"�:�d4����$��Ke�v������-N�֌�y�j��gt��t�f�R�4g�#y�!�RMe�GOm�E_r��;�XȆ��C
���X	ӘQ:i��#�9U��D��G7xK������[bR� 0py�^�O6���LFb���6�0V{HEi��@Ѡ%5�w�32�z)"Y�Q{"�,s7\ڏ.＝�������a���Жwp�@Oi�}CY�II��M�"��uC7��(е�;Tg"��<Fà]a�K�Wsw��$V,�S�j���Cq˘l��vE�C�2���t�wL
�s��2�%NzL�*�O�kN�1������y_,Ge�N�SJ�5��dN��|e�
\aOb��Z�+��<w�#���z:�d��� �H)���`�W��pƦ�|F���j��!��6��7S��
���G����vA�ʨhg"�1Z�SEO��t�����a�^���<P��;d��:ƅ�
��y��k���t�
���߳�����ӝ�t�Oi��.v��4�.��.�QW�%k�<��r�t/�Q�S�r)D���Mv���rʖ�N�MK'�b�W�k7�T��No�%�H�!�$ј8a�Ţ�7��G����^ʥ3<�`�L Wy@"�9������F-��@"y��h��ٵl���|��1i-� �O�� �J�3��'�M"f�	N���.F{�����)�o��Y�">����V@�gي��
�$q�A4�RF�iC"g�Nӟ��9�~J+YT��z��C��y�L�[թ�u=��@���y�pv�R6�`�;!�(�~n�H�wJŎ��0�/yh���h�F[rHG]��
�/�$/������2|��覸�k�Ĉӌ7��Nv;���ey�����lR>��t�Sk�-o���C�x�g��b��2��R���������Ү&}-C\�F���B�Qwy��e�§�7]�۾�z��:��/��^⺧e�񠿔îѪ�Z3H
e"qt�{��&�_7��Ru+"MmHl���w8����=�X�6k�B�úџ��W��7cK�~�:��)gړ]��}���!�mq1�D���D�׺)������b-[gȉ�b`&^GY�O$�C�`)���X�iu=�tu���yHǮW(����g����=n�K@���O��������\[��l���r�����!��R�
)=q��C��1j��Fd1R�;���x�+_*��M��H�*]3�.X~��2�@�zH�pn4,ю�L��5������2�V�r��T��0H�z�i[ڋevt�F�Z�'�>��
��pR�dQ��[�<\u1���7��/H�e��1�Y=�8��'e�̝��[gހz�����Wl��p*�����]H�#x1nu���n�D��L��wåNj�Q��N6���3�]QϱN��$�k��6�6ẵ\E�IC��KA)
�f�R����.�3���p�Eڎ����(��w �W��P_1�FG ����w��:����Ӑ8�    w������e�L�mN�P�O���Ax����Ů�Z���z�<�E��⊳���8�����ĝp(q��R�c��\�b)�ܽ����9�.'���&��ƉxH��(!'쥵��)�uf'=z�k#�����z6���i.:9��;����?	���:0�;ۣ��p\���ş(�����:Z�G���R$�7にM��td�(4y)�G��?�Q���Kp�|�W.�5�یŤ���yτ�i�{[��\azR<y��|�˼��!�P_7�����m�I��O)s�#��o�\Ѓ�}Ј��r	�y�Z�9�:�ш��`�S���U��8jbzܓ��^�/K�!�O��%��
��h�ꔲx��Q�#�D</iu�CJ}U���h�,���u�)Q15�9z�"m�D����(��ݙuhM-��Z}җ0솗vY��_kYtN���7����]�N{�Q���}�O��.P��[6;ifꙸ:v�g�H��9�@{���:��K�;gh�d�::ĉ�g�$�	���L��j%�I�벜�R�拸���s�������?�ӌZ/TV����|G�����f�uj��w$���h'��)����LM��>�V�M�(�^M�$��g�d����Z������u�L�5�'{��Y.h�<}���'���G�4G��c[S��p��P$9ZpҫN"塁����|�Ҫ�u(JO*.A�2�ã�I\����	�j"�����)n�1�_��.h)~�zi�7����q�5�_6�TR���V&����i��wҖ��(�y�!�۬�dWݪ��@��k��
\�≀�ٵ�z� 3ŵ�֐�>���#�AJy��^�.ou���Τ6�KMǺF�:1����ؠf�!\�rn��+C]�&V�m$�$fV���VZ4������2՞-�=�h�]�ߖ�i�Uީ������
0����T��C���L��S8����,)��Iבt�1˼�޶u����u*��I?��!��:L����2��-ϑ+�"��i�V�מ�Էڎ��0Վ�p��@�(�Q�{�2�.���|u&����2�r���򺼴U���R�QI}&ΡA��C*~��;��gL�K���U��zܔ�EG��j;��{h�k'՛%��fvJl�h�&m@���q}�4%�NF��O�8�e8o���H3/��}���|H�����W�ldj�t>1E���+o-.!|y����m�f����>�?$��)z7E=�Ϧ�V7�����v��V���eΕFc��!��4g>��Z�<��x(�cb���8rю8i���ɬTHyp�x��
�C
0��ˊg�hۛ;h�u&.(��u|΢����l��r`�vNm�<xVl����z$[Z�-z�9�^�D�s�c�WQ��4A�8e�Rڂ<K�}<�K���t��FZxN<��K�S{�R���ޫ�X����m>-� �G�TԄm��i�[�:J-'�8��/�*��:��i��%�޸���"$(^�$�*T*%vLRz���%��v�=Z��N��SJu�J{im�*vT ��_��rA��|[�T��x�{�NzȲL�<��Rb|��#tҶK�� F�{�}G $gQ�ni�Vl7$r�R`�u��ؤqH+Y.vj��+8�H����Kk�dwTb���Ԋ��㨚�X���(��Hl��\�Jq3�Kq�8���`U���cSE������R�o2��Kc�����q������t"G�~�R��C�P�ć�U�����8Z19$6�x�[qhS=�ѥ���_,��V�W궱�G3����.ձ���mV�
J��l:6�R�a��W���̬ڣ7�uI�8�CQЄDԮ~�3�z��Z��s�r$fe���q�xG�tS_�v��f>_P=��5�XI�)@��>�#Q G�����>�@i��~46�v9��i�>��>�^C7~�Jzױ�TG}���W�<f }���.k��p��y�?ID�֟�ǈ�Z^���<�g 'Ѫ��k`�=���lV��LD��>�&���8U�+��k%�UB����r|�[J�g�u�R��&}���"�/Hg���bc)��h���B<�n�P֡�k�e6�/��v�P��׽
E�J�8\�r�?��7{��>���H�X|�m�
��!�}EIG�)��5��$G��w1���te)�u��#�
�J�m��c�z��y��ǌ{��ֻ9�Y�}�^kbx尿�A�e?*�Z���6g�+Nʅ��tE����0��.�𳦙zG
��c�u@������N�(�lK�vybxł���IqLW��!����qY��X��2HaOz�����n-�c)�=Y�;h��H܍�Vh�D܍-���⍌�wI�O��@F}J�d���<���v:&е�t��I�k"(��q��W���	@m�hV�1O�S9@��X���M�֮]ĉ��|���I�t��� ����>zx�u;���U��rb��G�y`O:�JAb��jZ0�#ǘ�4�ƅ�����BcIl%f�k:��t��c��3p��^ۮ�S��n���U�ߨ�����RD�)�.�}K�n��hx���w��}&���$�Ȋ�!]'��sl�u����	rs�A7����3�|*�$>TR�vC�8����YqD�a/���ޔ� S���8�놢;16ϧU�����Y$��Ǭ�vG��G{A�s�8��)R�{?tDf�z��躥��f¾�fv������K�8��y�8<ޞ�^�_,�R"}���[�y'm�VM���[N��Ѣ*u�^�n�� ���{�Px��,D%��cJ'�����vP��zi-����p�<?�P�Ü��0X�
���R&���`]��J� �t�X��v��*�m�|����ʞHs�"��j ���v��^����G�y�t�ʛ�)�v�4�PV�q�׋=w�X�&%�����3v�p���Ht�����V��̷g����l(p"	Dk��]q�meړo�k"g�<\��/ݹ�u��ds�ʶ�u�ˬ�����(
l$f�؃�~� �����?�a������ޱ�/H�������܏�gM��+,���m+���iV|j��7y4o�٧���(��HsQ�·���f�a�S�j���J��N:�VaCS������jo�hX3�DP�n,3�\N��W�滰�=%�h�@p�h���r/%��S�����M(J�R�u����,��$�ـ>��S�˲8��iAQ��
�X��Y�8�c{aJ7�Z���<�`Ā֍!�����&����X��vK��}�C%pf����z�e�\@�;�SN
�5���5	�i�-$�0���X��:�cB����i����l�{kg@T��p�	��s*z慴t�yiuǍ1�����<�`ĩ��D�Z\��!�ˀS�5[^�M�䆥���iՎx�Z��%m�ӨSk��L��$�(�<D^���]��~��-Y����!o�G��� �I'����:P���u���rJG�J�����$��%��d?����V���\��uM�#�]uQ���5O�<P�vcKɀ�eC<�D�������u;���aڃ�k�Ğ
O�)����<��v�2�{j^~�:�1O>�C�-��X�E��������d瀪��(3��NA���. �>Ǻ�7����֡�,��&7����Ĩ�}w+Z���иf܏����Y�滿 �L����T�gE�ή{jR�7m:���\B�x7�,�fT�N��Z�@�9	�\d���r=j��i k�Ų�3u~�?��ts=�s�#L=7X�g��!�V,�	Lt<X�gs�)mu;JGE�,v�{]�|��=��*l��PRz<L;�uଗ�p@ՆH@��8�l���_�� ��e`}���I��7~���ʖ6��ʓM$`��wQm��[�<a-(8�ؙ�ܜ�`�I�u([J�6���; �A�L�k�|��_�J�8��h����K��>.G�I盋�}.�Lb�|ݺ�P�R��ڒ�A]��P;]ǲ��kO�Y���;��Ѹ[Z���(�b˛@Ӎw�h��uSF���C�{��k�g,�8�}H	�����W�=�]���[� �  ��@��!�yKw.���a_��O�S��{*��q���'�:�^���#<�|y�N:\�SFs�uDx�8�Z�g�'�cQ�I�2$�ǲUu������!TF�)����:�JzK�Zֽ� ��IG�fTb��3��IAi� ؅��J��1��\��-O��"��u��\�ť��MA���)) ;���ȗs�ͅw�EcڔĜ}��w�S�RD؎�lr^�yvmq��h�H��߀v��_�v�Fj�T��4PV���Z���c�+��9]���3(�����BZ
��C�}�p:�9����Ͽ��z<�R��1%�`���o�JRn����@)��(s���+ꄵ��r�H\��9�:_��R�#�rE[
F��ܝ
ݴ��P�Lm(]����Θw�~��t��e�Y�RS��Oeܹ��{?�k/�R�>�@v��-�J��2�z�x������¦[Zw�K[m���$Z��)+�x,�
���������V���xK]]��l�p�)=����t]�u�l�E{m!g`�~�ɼ3�N*ጹ���u
,k�'�5`?�qHG���j�R�:�u��������/�)I����~-c�%`�Sy��S�0�C.c�Y�o�NH���y��)m{�%�ֻy>� 'B����H[}H<O��K	x��h#�����
m�]}A:�/�Tس�41ھ�'����t�A/jL�$Q�{�Z�'��⤣���:S�A��@��Ry��Ô��Kʔ�] ���R� ���<�b��\�~�`�t��ι��Y��.�����Z���C���+�t�)�$v��1Z8�b�M��kL�ҩo��{:�K���������hҥÜ4w�~�K���7�=��fwm�+(�Gˁ8�k���.�O��D:ӫ������<�F���-4HZ�=���u�Q�סH�g�b{{�z�'��(Q�cG����=*�D����hGc��p	����{�]���3�m��X���-U��mUX"���:� ���	ബ��8\O��O��0�Fu!��4+�1��K�:)���g����$�^ ^'eg��x��1k����X���o�6���1��A~8�Y���}�`� x$FN���ʈ��o֛�\�6��Lm�]LBu��h�I*'�<����W��/|ٸ$蘢����kIo�z��%}�t�9�|�,�<䨗*u��>����D�O�⻩��R���}��r�n�C���]�p�U�S��)� ��2a�cF���R�n���=��,�|F-�-ގ-5�WYFy�D�F��3�GE�J=DskeJ��]w���A/�&��u�g^3�n8��v�\���C�N9�f�AF��	�r$xuHi���_�\ zY�-W�Pڕ��)W��]�S���7ʲ�z�h	.��>����T���ݹ��o�����p>��      �      x������ � �      �   �  x�eTˎ�0<g��9���d��ap�KHH+oғ�M��vv_Oۙ}h������:y�˼x��kY��*y��hvu�4/��.����6�[�Ƃ���	=�n�#�+��sI��|Ԯ�"��a��/��D�*Q�R6�=ѥ���/a��[z�}�
:&��l�׼������� 2���Y��(��U�P̩T��:���a��Q;ˠ0����E��h���.̎~c 0 �d���|�K>@%�8j?�ч����ѵ�'�5эO*��U������USl�p�����`��8!�Y���❫��̓�	���u�ꢎ��F}��gNG���z�pK�q�<T��eBW�*�W�^E؏�Oz����3�I[�(=뗶e��2��#���ۖˌO]~ϧ���C^�RT�η����=e�<&�N�	xM<��"���񈂙Pd3�֌	}�Ԫ}W�~���H��rSi�^]���YH�1�����/��+-h��b�f��Pbl�0rF�ZUS�P�w1Fɯ����<J�J"N&�*�2����5.�㚆��%�7�t�B�a��&�f��ý�0XՀjb(e)�]����ϋ�7!��.9����B6�t�9?�����a�H���Y�b�K����B���r��
[�9����z�Y@dM����W\�=D�	h	icb��g��Q�e�Y�D��U�Q�/qqq�����      �   �  x�}XM�۸=k~ʗ=��B����N\N֕�ny/�p$jDEC9%����h�?ז����h��~��܂؂dr�ra2.���=盏���~s؈'A@�
�8����d��7�3;ݮmu�vE[]jv�4�=�lw�ۦ�W;���l��e�
������{�ng����x)��~9�u�^/��5�~i�{��3�Xy��߆]o�C�T���ܴ�r%ep�7t�ص���V�7�����{+��94E�T׶�we����xl��9�\@��s�6�\l�����́g11T�� ��S|.�̼�Z{���5�m���g^y��A�@3��]�YJ�<�Nr��4�+7Ҩ%��?� ���~s��*3^
����!s�s�3���" �B�?4x���U�%6ܙ���4���q/c�
�'���T"�z��}�?%������,�!9$� ^���mS��r�K��qa���knp/�4AՖÖ��O�pH+�	Я��}��Sy�4-���e]�jwd5�ղ��jL��Z"`�{5]/�V_pA�ꀃ& x�}��5�n/כ1< �ʐ�����;"�($�����e�f�E���<,�+�\s�dނ1���X�{��̇��Z��[��P���_eqf���|9�?]C�ii��R���Ky��ׂ���|�Wԯ噵���[٦5j�\K:��<�D���5{ Up�8�
f1�\#W%(O�ں�����TF���9	��59���V��A�M=&H�ri3���T8�L(:S�yI�N���	�r"=\��*�.ض�|ʳP�yf�F������Z����x�4��i�BYJ딀ت~��lG��X��Ap:����]�[�\�xl3�r\���}��E}9'�B�*�yl,�wX���e�����={ޗuq+*���bsl_�t��Rj2�N�wU�P�7UC�� y�,���/ŗ��+����w�]B�i��\2�5^�A��ݝtH�r ��q�A:�ψ�?�8 p&j��;̲]�P��r�S%QxK|�*$��2vcC�љ�8���tUf�%�l���H{O+5�<6G��"j���K�qI�Ȅ��%Ἃ7-��}�8�.����909��곘��1CY0b�!�&�,z��%�=N��c���ct�cb�q��^���X4�<C�驠�"]YD�_���d�\�	�+�i� �à�<_b�W� �a�%��&Ŀ�k�8��c��1S�R��,ZQ���h��G�C�<y��O�i%�11��S.�P�r:�N���8��؉T<�����(�p����pL!�f�x��I����J��5?� Aͣ���n,B��փycd��L%�I/P��~���|0I@�M����*+�� Rz��9���� �'#g))�� cx�.��Ylf/��`"�0"��$��ɠ�1Ѥ^��~�'&NoZ�%B�!�ɯx�jC��9p����=�g�D�Q1��1� �;Ͻ�`nN�tsi��Q��ϧn��+4S>���x!���>���Q�+��*}���vV�>j�a���8�����
��G.R�@�Rb�$���b�G)C�^�~�����[�|đ֪�J�y�}TILU1a�����E��G�40S?��/��?����?%���P%SS���X��f���z<vT[)S>I;���JQ	�u��L��k���(Sbdq�9 ��<�Jʜv�@8<>ڢ[|IO-�7MN�U*)3)@(��ŷ��΂"G��4�O�(6z��o��5l�+�O�N�Z��Ȧ� G.�(B~�5��8�Ũ{=���q��(�=.̋o�tQ�~ꉾ�����'i�p���T�q�u���:�X��@�cU�(%b�݊�S�)� ?�)ح���I�4�Oc�l/E\��v�:=O�Ξ���8#b�      �   ~  x�}Vێ�D}N���'��XU�wK�@/hAH�O≽$v�8�ˏ�A��;3�ǣE�XVr����SU#�B�oYn�KI\r(���|C�`�n�Y؅h�d�S8nJ�Edk�$�����~}Z��Y/�a �%QD�� _�h"�q׬��Bb9.��p2��H�T���������g6�1�M��붫ծ�U)$�R����߲�֥�_�m�j`�ڰQKFz)\�b2�ׄ�H�!�.�/X8pxB" �iJ���A�SJʩSN3G���B��:^��P{�Z�6����	�,�s�Ƥ������SɊ,�Xdwϲ[���&Ó�n��I]�IDL@�����Y���.޻�A���,��U�����&T[���,�̖�)<�v��R|%���J˅�B�ȍ�l���</�a*�Ծ��ų�j�U��r�������I�8y%Π"H_ag�
D�C]2���D7��%{�2�dԤ��Zb&�GS��=���UW�j�?���~��߷�F�~_�GU�(�	�vUm�Po��wjUu��Nu������F٭�����y����7IY"�/�nБ��8@�4$�d� Q��ݶ���
VVo���o�0J�v�J1���Z\��o�a���h.��3G�:բ�M=�'�V}wh��P�Uu�2]5�Ruc���~��?ݘ]��O� v�.��:� x�{����	���pP�~�ƾ>��Pםz���(T`�U�a�@p����m�M3��8⧱�։�9�|X����SՅ�o!ic%N[ۤ1'�%���u!^l�/ƌ�&�τh��G�!;_*�o�� ���ռ;O���9.�y���8ty
��q8%���S�:3u
�&:y��!�pw��zW5գ[���1X9�7f��7���#���]��)m]��C��OMb���!�:��P0���'�ss8Z^�Q�@ں�*�!�.h3Ck�֡�r�h�7XP���??;5�����L�]Su�>=�
Ûkި��V�
�X�i��8���y��׵B��T�����ݏ�ʪ��~�ʟ����J����+�?�|U�߯���Og����iD1��v�s�F3�̀^�����c��'�C��l��8kuvZ����"���pg"_V�},�_�r���h�      �   �  x��Wێ�8}���yڇ$Y���h�'�d2�N�L�E^d�ݖ����N���_�Ӽ�����EVg�m�ݶSE�Ω:B'�I���;&T.�\�TKG$�s�|Y?^%�~U�z��D
��\8���ҥZ}�s�P0&�����r�S�	A"X��k�.�?����K�u�T�)�"#����r���у�.5�������%�}9z�{�Rp&��+��qJP<y���X_5%�W�[V��/���7�#��˶�M�áiA�e].d�	qZ�
���^&�'r!��H�
e���s�<K2؉��I�R�R��*!�C�Xճ=��[��Q��ѤJ�L�X��6	�{�s")D�eH��G���,�$���f���[�0q���R�tfc:-�wÐ\w��7a+`���V"K�3���ݭ�]�︍��PpJ&%#�~k?�w���	�#�+�k�J'3�b�*�־��E����j��xW4�D}��a[��7�U���;`iE!a�tP���26��Y� }> ��eD!�`�~��I��5�ȉ���g�d��j*�y<��~�'��g�o�����f�h��y�(�m����;�D�P|��m�3 ��Sѣ��}t���>>�W������M�*"b���L��{;5}�`���f�&W6���΍fo��5��o���{`}`�j]W`b(�]���E�WX8 y5/EQ�`ow���b�צE������w�s`����<�<�FH����	@ 0|���}���5y���fX��k���qm;=,���r�#h>x�|nېT���P)raS�H�@�$E�* 3#��M����јN�J�+��qnxd��"�T�*���9 o��6��8��a!�Sc�J8��1:ce��'�T�I}t^W>5�<�hR���i]q�ք�
=�w1dzN�:PT��Z�:Z�&C�1&f�u�6�+��]�o7u�Dw"3��9�TjnFu�u�,���s<_*�A�N�챝�-����ڳ��+��Yհ7my���zdu�ڲUW�
�@�m�ܲ~[�uhb%�}��_���U��M�g���}�î�-��@��o���h�v`7Űn��W`Y�o�]ہ���&.�B���?c�`dZ�M=L����𺏙��&{�D9�)KA����bJ��9^�PR�q�|�����lK[Ve�K�+�O�.��>v+޻�A��*���v�3ϔ����"3��x�0F{�X���ζ	:&,��I����*4NJd1?��$��`�8���`� 	�urd�1���<䋧�9Ņ_��[��Hq�0��@CG�3���n���u��&��(�A
��r�ǀ0�e6�'�JQG��ڙ-�G3s6���p�����B�@�I��N�U\,�i��V�	!T��c��ra�<�������Ų*��M�d��1�z��,4(ŝ[F�U��������;��{���f��l��e���{%.΂e1@�
�87� ~ ��h�Ey��H(���"F%�tP�O6�Zڠ?���4sӰ��+=��8��۶�X=h�Dg�]�?�A�I�Oɧ{��*�͋zJ�lC���bj*���D�@�5��0Tfnz@J��i�t���c�TDe��H�>�����W�u�4]�G�B0��E�-��mF���؇�����ma��m0�9B�\�w�q&
�c�� �^e�ꡪ�~�a(vШ>��Y��|��L����X>�-�Os��8�����D��0����=�9��8�#�A@��L�W^
(�����4�ʲ��Ą|6��_�9a��	|��\D�!�F"����a׳��-w�!�2�')�v]�2BO3�vL��|0��=��L}�Y��6p.I)y��0`��p��Z�)�@�1H����`���5���n�Q����8]xl���V�@u�Tu ��O�j{��gx�ߠ�t!�7��'��RF�;�<d���n�kn�7�i�p���j�ݭG_����(=!-*�+T Rj�1ڎ���_%2��%ν>�N��Z��Q_^��Ū���t�X�)[�      �   �  x���Mr39���)���
H�g��~Z�? �7qf���U�ll�W��(Ā�v��� �_ ����{h6,p�5(�V�J.��l���Co1K��0T9�E��>鿜|�Ĕ�Pg爭`^} \�$���O!-<����ICe��9����Y�#�eL�t�аC8�l�A�p��a�P���[���F���{��h�]�)3���U�P��l��*4�y�&Gr\�e���^�}qJ,��6g'�_8M�+gKHZk�!��	`��g?��M��e��m��/�V��v��}����A�g�rc.����w��v>;���EeMt��w�4����#�
���H�GkU�͇1�b��~�����t��q�O)�d唠܋s��V�4$��Q���A8�,���q�G�p�Oʗ_7��|�`~���KV��0��rM%�w9S)nۺ���Ѓ�!�Ht�)dۜ[���#k.d�Hy{.��-= �\�AIO����ˇ.���(�4�v>��G.��⠹^��{�KV�XGt���W}�J�f>�r},ۘ{����.���m'�ŗ��}�E���%q�r�qt���-Mp�l��F��7��ٰ��\O/̞O�TϛW�EIN�J���N0/�=���Q_����`k���j�5�����Zg�jdm�nز�5R,��O����n_��
�}��rR��
��G܎�8��*�����{빭tG�r�|�'�2�O���w��A�g��]�F,/L~�,�o�ŀt;#�y�3��M��Y��΀�H~r|��&�U;G��g���|P�L���t�^�{�p�w�i�_�`�г�:s�?G�O2��~v��Wx��o��>���M�:��(�<}x)v?�g��V��$��;��z�&���v���!��p����i[�[]�¸�d7[�v�[e�&i����$x>�8l���3�K.��j�z&j8˵�p�Q��H�d�* ݟ
[m�w�����
M      �      x��\�r$�r}�����?�]��p��s�F��#ي�P���bo�������_�����ę �F�Fv�C����I�����8gF�Q:c�`�~Q*���'B&o����L>[�&�I+�&s2�Sig�P9�m�gM�Im��Z)&�à�Ԝq�lic}7�7��j{q?ys��6źߴE����|>y�^w�� Ț6���L��D�ffD��L[���\r�&�|?��b
bϩ8��4�i�&�c7�)����\�9������3QS33v^�:QIֶVϹ���:��sjϹ.�an쟊/��z�W���?������OC�_�Ք�FEA�9��T��Qj��V����X�����aw�]O��������	�]����̚Z���JΪ��Y%�V��
3�'S��������!(K�ߴj����l��M~���g"����>�9����I7��{o��?4"���U�c3!���t˫�i:�s�GsÀ�4%ьP�y�&?�z��w&�9�@;u�$�9եJK��L�ɳ��2�RPu.�P�0LKg�_o�u��ӣ���0L�ð?1�%�O����l��v����M�﷛b��o��e���b��F`(�N��IF�ꙩ���yK4�梳LHEk��Z���R�gVn��Z��m��w�׻�z�]�c�@�Ըɹ�%S�3鼷߯�ɗ���ʰ��֪a��*�L���5�|�����&Ba��%�ר�%�%W�����|0��9�a�j�NƜ3q�r����3����	�R�.J �U�O���JC&�nw��<�(�lG��>��$D7.���Br�J2�]3SZC�����Ú1ZPr.	F6a�n��E�]�����W�l��b��Vw���3v6�5�N+k�Hi�j���x�$$!�/�Ҁ�0��e����O�I�Ha��<�԰�ޕ~�C��V��J��ad�F���RKf�[�/�~��j]=�n`�Y�Ռ1��m3��9f����HkI��g�o�kH�%װ����������
gV_�����hG����˩��`O��Ȣ%(�1m��O_�a��T�E/�L�DvV		��5���2i���|J���1+���k�z!,fS�&�Vr��ϝ��e��7@��ۢ�����~�~�R��Oh]kѴ���ڀqHH
�����1+D��7�v��w}�M,�ag
���?�Ӿ+�!�<����~S췫U7����p���v]��B1���ڦjۦ�3��Y-`�a�tk��5����V�����C�9+����.�Ъ�M�v@� ��LhcVݮ�=�_��(E�l��Q5,�mX�6ڻ��.���f�0��N!���Ԕ��
�C���sNd D��Mb>e�n��eA'�WC߸u.��d�nX �/�\�@�9�n�l>CB<�y�b������	��8��	���r÷���8���%Q�$\ �)�F@�W�����4��~(�s���]��Q��6��E7���٦_W+`]��	4R#L�0e�a�2�ؔ�3�zʸ�C&P	� ڗD��wۺ_u���)=r�SG?�d�b�e���7<e\���0L�tp$�%5�Z�l�3m�.����^�u�*DB浌VIV��V��tƓs��q��D	��}�L���W�����p΢\�h+�88U�
�T�oqT&�dЈ��`�iZ��>��ݏ�N����ZB �^h�ю�?��l@1>*g�;��=�����n��f�����i��|��Y�̡Q��U7���)���{����6�/l������A�#'�X] �J �v�a�!�R������)�r���s��d$&���I��)M�"~VUճ=�_:�N0�42�>T��#3��UO�L�Ǯ��(X:#P أ�i9y	cuc����Y �[��~��V�.�W��ϊ�����:�bࢫw�Y�������Sڔ���$j�@�[��OQ��r���2�"��9��+,*�%����a���4؏�
dl^�0��.�H�V�%�o�E<���+����+���t���G�4�&�>[Ro	������rw٥����m<:s�(|zE�gC$�@T`��!M�'�<����D!?��h�O:����I0q4>Ô�=i�g�.���e:�������w=O�k��~��h+����I(8�"�,0~�_�����WH�~� ��c���ha�x �Xln���������{% �/�k2A	>	�x��­u��PB��z~��*D�HK����h��h��xPȟBC��:�0c@LYD�}z�,;(�F��\�q?���OS�O�ӟpl���JQ�2 2��?0�"} �<����| � ��1��e6٤ x�y�J�!�T *�#���f!�x~�m�᩷{ZKJE�*Ab Ki��1��Q�;�$G�a�8���H��4CAi����2 K6),��l�<
[F(�P/  �qy	$�ʗ��L �kg����k�@�7����ҁ�s�E�d�����,��ۈy�� ���l��Ӓ���<��;-�6�OK�v�� v>�&��j��[K-<�{�.����G&=��k'YZdF.p~^ף���P�ؒ�ʘ�Z��%�k�T0��[v�Э���ki�XO@��t8�T�J*HƇ�sQ`&�h&���V��V����'�_��a����fW���v?�	��FaO �/�y)������z�?+�jx�ʘ09p,�a�FJB_\H��0�J���ua�kl|7>&d���i��@K) ��O��-�S�a���SǶ�ؾ�b��3�Oې���O���c�dl��^BeJ>uMO�6�?d��O_���a�UI�o	=��A-~T��@@Mxz��$�p�+:��x�D,�`��7��7�u����v�f�.�M!'�@$��[�)æX�����}���*u�b����ߛM�+����Y���ۜ+[)�=e�r�P������'�J���`I�JO+_5��w<,!�sBū�K��C�c��ꈈ`}_߿����,�<���#�^��7K������Ǯ��ՇT$�`�/"X����:���>b�q˒2*8���x��H��Jٷ����#椋S�����${��C����6�{J�n�%~�u�G�8閊��(v�q�&��Oq��b}��.ݯ�.����r�����-��A!�=1o�������\��� f@頋�k��AiO)7��y8)v�f���� Ѧ���L��Eq��͵�b.�Ӛb��	[õ9�Y�JV����y1�iK�,6ר��F�ٮlM=�s��������fq�n.<^�s��T�t�±%����D@�7���&�SB�sFE��9b��TL����;�ϋ��sZ g?��e�� '><l�΋�pNk�(��kbo.e_{8/��9-��	�ZOBiAx�����!����� -�:$m9e�p1����j�=�s��T�t-�
 P`���L�>�����b.����Z
�TdVzO��6��tX����>w�����_�{��@��pn�?a&Ƿ7��䜘mr�prF �p#��n.�y8/��9-�S)�F��9g2
��������b.��8=����hۜ�+Ӆ��\@��#��� ��\E�)���MPN�P�pi<tuTI����U�����9ЩMO�6�N��'x�~)aE���� .�AN��s
�Z���m�<�s���ۇp��H��[v��p^̅sZ �nw����D�@���p^̅sZS%�p`�Pp���كyJg >#�=�KC0g�ЂZ��`խ���l�D-�cc8FKnL88ξ��6���]� .��!^1�
���x1�@-@K�QqZYJ7�j����j\�/QN#*r�؉����� .M�c���F�����*�� ��y5���rǴ>�����M�]���@N�R��5�=f��Yxʮ�l�f���J��!>�U�un���V��܅rZ 7����B�ȅ��n�΋�
� n���B� g  ���H�f^�vaԚ*9����jY���
V����Z 7���qG���.u+w�̃�M� �!Q �6���|q^�w"�� �"z5@L�" 2�ge���#����Db.���4N	�lDi�b�|M�%�s���qJ(|�+ґ�5|AB����j� .uv�l,��ǽ}�7���ݍqj���;"�b����U� �\@�6Ujd�aҰ�p�����b.����yj������Rw�m0O/fá��iF��a���^x����y1�i\��(C�jx\����	Ŝ��9Ԛ*9�^9/��Q�۬���\0�`ij��#R�6fw�W�*�/g'���f�G(Ixl��w��Ћٜ� .��	.rr�ްW���b69G-�KC���HE1���aϋ�pN��Pp0;B����B\�C����Z � .�c����Z���,=�s����)�s�FY%�<[��6T�^�^LԚ*�Z�Tx���:r�a��o�b������	p@������>��tR6g%�J�`�Jb:W��l�i`,AΎ+NӔ��U\o���ڋ�$� .� Wi��1�_��P�{1�����R��%Lj�#ι�����pbvC� nU\����k�G���x<f9��_w����6���� ь%�4$�+!�Q�w�X!�0��J��lgG��:�]=pN�(ѯG8�OC����,��ã;����pl�o�`����z�|/A�&�N�G�<��� �1��x���� �.�4/fq�����k5�x85���.�4Z��C�p^̦��pi�q0�a;�#���3w�9��sj������$2��Cu�%���� .�.x���8��j���y1���ʦ������[�.w�MH�^̮gQ�F���M+�w�+�������TGM��A=R	/f�����B�u��p3���oB*�bv�� nX�A����Q`�ػPE~�ﮇPy1��C-@����#"^-+_� �Z��7ʕM]�s� U$1Gk�އ3./fGlԚj��<�qJ�x���9�,/��*����}
M/f7<Q�R����%p����bp��s�&�1�ʣ��Џ�bv�F-�K]���A('#&5� �z5@L���J�P1�^s�#x1;b���nϭ{��Fp���΋�pN�R�ǃ!dP)����2�/f�� .��=N`�!"��i�t�/���کb[�������w�r/f�Ԛj���t��R�N��j&��[EN����J%����
����2j\^�r5�ט�g{%nC������Z ���;��1�`W�}����loG-�K������Y�[�X^�n�����o%kp&��-ioÅ7/f/&j\[�E
P�m�����BSЋٍ%��4��K�E	ut|ԷUJ�v���P���hܽ)$��Tw�x�Ë�T� nW����d���&���k¨5�lW�;��*>��ٯ��e��5Q�F1E��(�Zw���Ç��P�NA�X��"��������̋�}x��Q@���Tݷ�g�>����� nP�{1�6������1�����Ak���iʽ��Ji	�!���j�u�ݧ��s*���J�!{Ƶgo~�m��og��WQ��
����v��D�7Ҵ{��""/n�T��q|Yՙ{��[�n(�~��⫡�}��6]��v�m��S)Z���۾�\���^*:l��p�v�RZ��*��:[V��j�� _�r/m$�J�p���6z�s�q+���:�������]_mξ�Z��Ѽ��-���̽���jk�v��-˜��=/dM.Bx�bv0C-�3Gp�Qj�,Lŧ7Py�Ox1�!��T�wj$BK�����
�Gިp,��'obx���J?�Xr���SD#��1�B%�4�1wz�	%�����p*�c���BH?����"�y1���Z wd,��s�ߙ8ѻ�!���}���Z�1��00����]Ն���짛P�X']A��Vd���K��ϋ�g��5վA'f�⫎��/���?��a9����/����j��ꩡ���e�R`!Ʌ�迹��z�s�K9�N�����      �   V  x���Yn�F������@���Al#;��ϒ䁢Z"e��E�}���\,E�c��XBbJ��b����jrk�\L�p����%�(��/����6exv����SQW�̓�X���*N�7﮲���ʛ��B�h����=����g�k���
�y�X�qe0<����"�g�<ʗ~�.�O�
�qe��V8���|��<��v�!2������8U�G�/.�b�u"�L��Y5ͪn��
��2}=�S�«iR�������x���������z>k�M�4g�Ґ�j¹��g$�D��&��$RF��R��\d�l��&^�|B�6�s��rq�����'X��/��q��x�O���J<.�z��p9��]�T���Gk?��G�������c��Q����'/G ��&\`�C�Bሲ���w]��Y=[��:_�d!c��)'��A���4��:�k�]&�T�Hd(QB)�z�O�c���4"�v��Ҏ��<G� o ��@Uɸ�������_��I���҆Bbj�7V�2�g��%;W}����L�=�Y^���rSfq��np��]q�na��s��P6��5/T��DQ*�6�v�0�cU!��_��A@����W~����
�:D@�Ҏ3g� ��-·��<0zO�\��6\�x�z�l�dM�K@Ga�+����!50Q
�F).��Q@+Ы.W�p=�8���o!��9�sN����a��1HJ��5�H��~E	��I�}�`322��4owR��O��㋬���/+tWϪ�Х/�m���"ߏƎ�	��7�:��=��h��ɧ@�~A�?TTu#����[�g�C3�Xv@N�攎���<�g/�Ms���:jAvЕ��m#�j��Eʅ��H���A�2	��J�Kr
�9��:�+KG`� @���)�~�c
3xvp!�Dq&6�>*������X*̩����iv�J
�<���X��$�w�\��	��y��(A��q�)�su[�uǊ�96c08S���G#����V)��8���A��=��|�_�I�J���r	)������Q�fN�>�#���=��/��Qc+_            x������ � �      �      x������ � �      �   �  x��V�nG=��"���� 	�8��� ��j�"ű)ʲ��y�e�$@2�(�PS��hC�эhB�GSm�&�_��X�tԇ�_����݄�ՖQ���17�%�D�����t.<}l�>�qs-�ٕF6ކ`�b88ot�9�����a�t-��Y���\ɚ࢚�^`���Q$�s���HC�uN�y�i��96<�54F�k�x��.=�v�S�\��,��%ހmk��HU%�s�N��y{��3��*nӲ�C��|��&>�������f�;vF)�	Q�ae�EK�n�{�������ڎð��ғ	� E��ĕ�� ��^׋�� ��h� [7��d�R5X ,�2��>}Z���׬є���<��f�f�x�_v�������Uj8�`�ÌF)S!�]nn��n��|��� ��ȔӒ�K/9��\6>��ĕ������u��ԥǬ�W�����C;�\�R��ۚ��h�raY�so݇�O��I�=e+��R��m26�\��F�~��<�K�)��"��L��M�Y��}pӏ����o]Z] θ0�b��Axx�j(-����~~����fsR����W ����ow�o�������w�+u�9K[V��d)ڤ�Ԧ�������<�w���[���{=6zZ��w,!`{l�e�����r,�ބ��~c���GSš�,���EZ���^���n�+H�v�	����V�DT1�]i�_��¤x�����5x������9������<�t|<·�x�VJ8�u�rX���3�(�=�Ҧ߿��5)')p���=�sA.U}]%b���K%1\�d�|6�#$9��'#h��~z��v���A�;sU��1�a�`y!�؇�~�w�����=�}���8��_~���w\�+�9���PЂI�� ���J'�����Y��WI�X?v0� Sƨ���&�r��=���u�u�(.��e�0ia�f)�š�%����j����!Z�(Ȳ{G�PF���`�Od��Z"��Af �� *#�8�y#��M�FH�mQ�0���R�����Ƕӫ�e�(��k>�@4aA�&gq
�DI*��N��vs�ݭ�dd��>/ޕp���h5��Tjmz��n�WIPd�h�z�+���%a�=��o��5�)6u��a��.F�/����J#�����G��ֈ��a��֌6�hSK4q��68�%����a�]�;9�'2|�ȊZ^��]kӻ����Q)�2-b���ǘ� � Aqw!M���M�]��	A�&��ç ��]A���#?ʝ����V�k
wb���9���2�X�� t#\Wl9��F�yL�AƖ�g�'��>���v�k�<|���Z�����XP�Mc�.�j^ �!�ao�b�:���щT��ӓ������/^�����      �   �  x���K��0���)�/$�)�:K7����2�$�va^����r# NH	�NДJV1t�p;�`в��;&�h����!�Ҝ^�n��/�;JSoP2VB��R+u.�H)I����.>��a�7r~��A	�GK�0�V_ I��܉k<����a�UƜɵ[� ����&r�^�M7U��hM�J#�D�E/�����FTq�*xD�?�*BtZ"	���4m���LZ�<����#��M��v}L��bG���b�+F�Hv��	����|� H��@$�z�8hM$��
��:�z�A1��HK�Lᙞ�F�_��((�5f�
�8R���C�ɨIF��+�gڑ`���3�����i��|�ZM�/�����i1{.��i�U~�u��*Rϰ�>����*Lc,xi��h�+��/-��}�15A�f]Bl�T�=�4؏��4-o���y�4#�������U��<�3����eg=�b"x�M��TE�*�?kk"�A�~�J���_h��(:׈d����uE���d3L=b5�:�Y&�aj��#�"?m����Y-pI췊0܃��j�v%��H�Q���1:U�t�e��Z�-���G<�Zt���k�K���j_���_Q?@��jHA.�A���۶���|      �      x������ � �            x������ � �      �      x������ � �      �   �  x��YMs�=/~��mM��|��l�$;�SI�r!�A�d���0�r���]�J�ɮ׳=���� Yۼ\o5lؾ ~�Ғ[r\��|��O�4�Ȃ�7��Ch���~�������C4�&���.-��|L����67��X���d�sd��;J$l����ٹ�1-��;+bC(�rH >���\N��KqGI�e|p���z{;���$Y2w�Do�Ϝ�»|�����d�$��z[�-���0���;���&sg��3Ѡ��8�i��v��ĮC��/>#M!4��ޞ�P z�yOa:���x<RBR��ˑ��rwpw�s,��d�� ZDL�䙬���\�֫����`���'��?~������Yב%kseX1�K���N>B�f�$�lmZ�PK4���Ip�9�1(װ�w	%!q�����K�g�rgc6����Lg�PI	�4������}\��b��� ���d��������*,br������pփW\rB"��V�������hk;q�&G8�F9�yjr��ґ�N2��W�\�N�����d�%gٺ�xj^�ޮk�;�H����t�|w}sw�m����������'�F��cQ`���R̮����ԿYo�m;��Zca�p�ĥ"y���ty�[��9b�xzJ%��Lgc,#�i�Nd5@&*zA���'�Ϳ��O���~�خ�������f�b筳)L���0��ڰy�)>��`[������ٔ[�'��|��`n��V��Z!W��Ns�2��ӂ�\a��0h�$|� Q�c߿�A�J0�C���|z{	��~�ِ�Yƭ�������澍]�R�ܷC���;`7P��X��ԭ�@KFs�y@��#iP�V��j~���H�����ӏ�H3�����tRj�Fm	i�sj~�3-k�P���CՏs�\h^�߷?<=�~��@��3�{;�bɞ׶���ѧ�5�k��2���ꆎv�a�8�_�g.��Ò���*>�ؼgLau`3�|X�H^w�r���z�m�pE����B<��'�0���f��K�zu��Qu:Jlg=�v�%�H7� bЕ�}�۷���_w�w���#T(k���נ2�
oW�c�����ɛ!֚�@�7����!�`	��%T],i�����Q����ܨ`��}�?�kp�.QBL�l��l>�9O*KK�p�?6�Z���p*�P�0qc3����˾�~�3cX�v�MdO��1'���I�ڎ��XRɠ"Lο��{Zo6,y0S���W��������^Ui`2~���;G0�0�%��	��a"�T��� ��Z��=O6��:�f�8�D��*|:�-o��50xӺd=M�̲�
��I
Ep&Y�����x�f~��LiY�	���p9��}svb�%��*^���#����n?zhL,���X�bDoґ"-(����vSC����Xط�!�77U0w&??��_o�n@y� �xa������<AILXh�g|��!��詇ݶu�,)�&���TQ��E�2�y�{�v?���ь]��d�(Р>0$���]?���� {UF}����ą��{�ݴ�� w�%*Z�4#r�<�|� � �@@�M�hl�Ka�:5��b�8���w��XC�%��%עԩ Q����Oc�(�,������݃�;;x���@-Ʉ����71��8 �LT4��t<��}�����:��z)�9����XB�<Yr����a0x�Â���Z�j �*q@���QL�!(�d�A�,Q�K��}=�ηd�_n�D��EiA�,��
��b����T�vAK�b�-Iw�{�u��3�uER�|�t��LH1��:tW�	��%�2I�U=K�Ϭ��4x���z����"Հv̊�xT�P�&�z���.������	��lr�&�J��Җ>�� B	,f��/���*��R�*�v�-Oˮ���81���� ���n���cA'%� >}.!���l��9��bU���F}�b������o�U�'V��g���`	�v�H@!�3+k���ɪ�r�}.���)�/�|�������K���.И����k=;�U�X�(�9�v|�B����(�Gc�FfFIW~���s{����P�Da;�>g%5/�3����^�\r���hT}�=̥�j �vn��X�J0B_�B5(��'l�v��u/�M�P+�6�e\�@c���K���oq�,�Fe��G�e\\وm^ޯ���,�ʲj̴|�+ۼZmV۪[�ӄ�<'A0�\�ޡ�#� ڷ�!��`�C�����0b�(v��@�_��)C3F*��>x���,�!/�О���F��gD���k��� O��eP��ND3|j^mn���'�����:�_�|{_��8���1;΂�և�e_�:���8N-"FxX�7U���f}(XV��6R0�|0�rP�L%Imzoެ�O�V�ry�җ@�����Q00Gb��<6�?������ͤ�Z��Sˠ�.���IK��U���ҊN��z�F~�܈Fi���f_��|�4�R�ܼ�k�W�Jt^rY��(~_��'Ƽ9�|C��\?:"��AEh���3 v7�{��b�����r��}F��1wH�S�~���%�?\j��O�؃���̠h�����m����νA�Y����w�JI����Tr��h�Q�{��\�`h��P��+у.�� 2�c��p](!��I2�AZ'�ӫF�x�E��A]��o��y	��V�1h��A��t�М��.ק7�L|s9���ߠ�@<�:	W�uJ+aDJ8Y/˧�7Tl�X8\���_��hO� 5�3�H>gg}�u��2,�C�\n�j�b�㩆XF��������� �����g-����C�Po䬸�0Y�]�g)�.�Cy�ȳ�Qy�<��T��?�������\m��j���5�ݗ���5�����ns1�L�8��FPh����L�z#cQ��@}���}xf~������n�X�n垖         X   x�U�;
�0�ڜ�^^v���Yl,"J zD������������'eQ���dLo����C��"�?�gy%�L�D���c^���      �   �  x���;�#9Dm�)�/H䗙�Y����G�dWMkf�dJ��qBLHo��T��2� /|���*X�tPUI.r$[����z~���0!���~4�E@�7DB���@�\�e�J�j��O�%��0�t A����!���HM�d"r��z��ךKHŐ��X�,��F��,ntS�c����IpB�Vg2@R�S�IC���4�l*�o
��1��<���`��a�z,]��������6����y�h�A����I�Z�m��pu�~|B�dKcoJ�;Yz�0AS*��g�|���X�ʵ�eG����E����!���V�!e�'��H�t��j8Տ�R��Lh(��T�^�q&C*IG$����^I+| ��<�4�lQ�Zn?��l?��w���U�)
wi	7��[�]�gG�.������)8��\+UG���~2Q�����m-q�� �^�>:�6Ļo�ٍ��gv�(Vdy�P�,yג�\`p�r���ĭD
�M/�;?��X��X��J%�M�}e��>�(�R�1g�j�o)O� ��֠fT�5� �1�p`��K<�4�1S1��Hg�w�xǳ�{�ە�4�F���\{���׼q�R2�(ѽL�^����b~A������bv�S#a?���i�Y��V�ͽ�ݵ��{^c~�3�i��"I}�����~v�L      �      x��]ˎ\9r]W�0[;�x���7��0�g��1��;��M�JY��Z-�%Pe�y�D0����#�Q�����q}����r����AP�ک��g&jR�vy��?��������������?�r��_o۟⓿�����۟�6?mJ�����O�_�x9���������O��O��jn/���?�����/�u����D"��G�����T!�=����MU.~�����p�3���t�~�^!|���/oS'�/��£���Ԋ��?=�3���pm'<��~��|��I�zm�����sy ��w�x� lGG��x1��ş.���b�8��z��y����������zy�O��+xa���ןO�7�7����>��L+���DJ��c�q����#��x#�A3��D�A���RMx(G�R���8��n����<ka�MhcO��_����A��缅���.P���=##���5��м��-�[�G�R[��ƛ����Z�kwz��)m�Ft0{փT�����������]�����Xxh̛G���`�ޮ�V	����\�����������v>^��J`3=�����ޮz�(�����~0��my&�Z*��f�;�l?�����6�,��Q=���|p$;ȕ�h�a��E O��k�7��{ȏȥjա�Y��,R3"��bh8���U����Ϩ-���ć���\��5�w,����phH���#�A���O��m�4ܩ�$�c�-�����@�Q��T(�|�@���X��Cі�}0өQ=ݙ������d� �Z0�b��@vύ��(f� ܙ5�� �sd��;���N�Cׯ�m�di��*$,hh�`�!C�INt:]Apf�wрY�+^/����P��ː+�q��[��i����g]҆l��8������i���H z���
�L	�Vn5m��Ȯ~�'�<_���,�vz��B7���5h���:��0����N��óWd����32��A�����l��q˩B+�F�8��{G+5��A�[�����ѿk����Gn��k>�����y�K~F�q��WA
�K�J2�j� �xF�h�6ss�sd���(���\��Ə�B��'��G��V���t>��;O�ݟe�pa�������m7�,B��5�����r�z=�?�G�s8�r�XH�J|��kd�Uq=*Wj4����;��¡+$c�f��Ү�������ɼAm���uH���[�jN�![@�id�H����q��mv�F	�Ofwn��6����[�5%ݰ}����F�Q�#�´�\@�����
�?�̀�H3:�h�/�	�l9��S����� q�Y���Zo�k�ӳ��{wG���ATgm���Y��u�_*���k��ٽ9td��[m{0�{v[�d�f�'j��)�s������
����[>>)d�.���|���~�������#��O�������Oㆌ�@Ce"�|�����-�������W����i�޶�����@�Y�^D0��@����DF���6d0H6)��#;k��x�Q�T3���h���fxj�̋�ت� }O�V`-��(�&h�O�'��uf�E�AqC����Yn �HYnj���Өy͠e���� �l���c���+�+۬\�A6ALXX��oɂ]�3l�Br!D�3Ÿ�|y*�u���5�F�;o��u�d.��3=Zu���n�r�5>�����_7�7m��
�=B�_�P�H�>�L�Nh6-C8�{[�.�u�N�:�{����Ǡ���N��� |���w��Bx�L�xEv�?2N���j�K����^T���:��Øa��!#(V�-tx�3����$�î��ܠA滮d�� ��Ɍ�kZ��֫sUz^�5��.=�(>9��F	��/��_9+�n�]#�ޤ���pg�m-̱wd�S	9ˡ��jk�B�4+!a���^L\�+bDg��wn�-�	=i�������m1J�ϖr������_Ѭ�:�y�,b���(��������~!�g+���Z�x��5��^K�!���MԦ���^�
�,X�`��y�����7х�h� �̿dY� �C�_3�����7�e��S|�M'a@6�1�"���F�Z����홊�q��v����ĽNjaX�r�P	g.Ն�WA���Jx9�-L�q���C��x��^�B5>���;>r<&�Fo3	A��Y�'�$_����H������^ �V��d��'�6d����-�*�߫� c+�v�6�����r ����}��'��H��^mA�1#S��pe�S}���7�d��Jk`�~���S� �V�I����ϗtӅ8�VD���v(w�2���z�k��q(��Y(-����l�I ��?{�~f����_�������oD���2������,�,_���5�oD�Hd5ݵ���H�Ɏ,'&� �d���d��G+ꘁ ���^�����@rn��X�Tp>�`d�;�l�E]�O�����C4dk��^��\Du�l?ݲ�.8B�^!���������Y`rֈͤ/�`T�рv>��e-n��1���{$ka��8�A�� k��QF�m��K���~PV4�qe��θg6�9�e���ԍ�FW��������KYTeĝ�@t�=�ٔg�a�wV�?3���xj0-���LsMQZ�.yvdYt�}���|�
2�\`ܳ�@�9����D��=�D�}Z?��B�Mdk��s����"�8������BE�u�u�e�D����Q0ەfU~��GA>�zum��tz���m��+��H��>�z�+R�+e�᷐���3�)H��A�*���:֗���>Ϸ5�mN�TX �Ց�$r��0�
d�|��j��5�m����?i��S�
7�:��-	td�Y!Q���"�ힱ�`P�l�yVl��\��,Z��Qq����KE��^�F'����Od���:��щl�y�A27�c(��Y�� �܋��s��#��x���ۨ3Vk��5Su���r������}� �W��h|�p(��a++�!�}�����r��9�9�b`B}�P\�1cD+.�,�șI&%�9Gk�/����F2�nQ��ݵof?�����7���V�z�؝wU��%��G�i�z*�Ѭl_���:��Y��=�ޗ����jocLB�Z��5.`i*41����G� �e"[�Z�S��(B���ƭ��^����Mu��d"�,�u6�ޗ���Y2H�TwڛLa�:�b��^iC��W���֛�	��r�D�磊/���  �!��ŗ�Z0���ھ��[R$��nzk�Ð_E8ҧ��P���/�>&J�H��W��wy���;���8�m۩G{̊"2ݑ�]_}D�G�И��� ����#x�1��\�D9�y��:3�Bd����;2���Σ��h��Y�
4�1��h�Q���I+J4U���G��8����d[���	d���l�c8�����S\1:��ȫ�,��=ˁ-�*��r]^(�:���,�8�w���X��E��d�u��~�Z�
[�m�#2��2��+F��B���m��;�1�y��4YE\e-�pbm�l��s8]ɕ�4�cҳ���49�W����Ӹ���`��u�G�l�0���@$��� ю��(�@F����F�t	"��v�]E��d���ͩ���	f�����O�*
Dzco#�Q�d��Id�P�1��t"~��ø� ��D5��3�lȸ;3}
f�ϨH�f�e��)!?`�3[F��>��F��*D���c�<O�*D1g��`f��V� �,���ܢ�F�N"�|����a[E�hߢ\���[k��Q�nkǊc��*$�������|��4f�iC]�*$��Df�Q�W� �L���΂	_F�X�7#�6v�/�Az�ٚ�Mdkh̽�9c�1Β+_C�tdJ�-���� �KB�S���f�kh��L��!��w]C�` � :  ?�&u�����ȂA�d"[C�d^\u�,�����4�Un���!A�W}G�Ɠ��#��Z �i\E��V�\1O>��"A�~�p�
c4��1�>���:�pN��"A���\��s�{[F����ל�0X�-#AZ�*�L,�x�#�ZL�l��e<u�
����n��3���Έc���*�-�1d��d��LRU��,�����Z�۠F�e��fuS���١ө9�>�4j[%���
�f�~[E�'�C1W�	ⶊ�ܢSX�Fm��*��5{�UDFɄ�*�=q��ƊS�UH�k&ILu��U�0ww,�S\���99��Y�Ȗa��Щq��V��d��W��x���C�6�+.W�g9���l����Yn�棈�q֗>Y�1I���*�?���7��q�d��G�`�*�,�1'5�ir��Џ�rGΤ��2�LzE{����L�Jr²���0�i?����=K��e���UThs���*q��&�RM��û����\���I\}���Wm���*?��&��~;�n�d��%�˜���_�s���{�t��Q{����bmq�ބ_Z{qJ�PoN�bls�E._��l�;2/"��7W.�}�Y-�Vِ�}�Y�J�s�| =ߨ�Nt���Jp���f���o��]#��7������-�̋�Ҙ���v�Z����sT(��T�+�R��y=�ǥ��h��~�r.m�Ui]u1��g9���O#�ޔ����ڠ�G�!Dַ7
c��o�:�
�_��!υG��f�ڼ{{��`�c�*ۜ�貀���Ȏ���[�m��������o�v�K��4�o��p$��}��GdVK�{�t]B�}Ɯ�ܑ-� 5',U�Y����1�$�͛�����
��نlfLdR@��]���,��vY]A��� _a(g&�����FWdc�Fs�i�<�uT��Qq\�!��2��H��I�+�l����0��u>G�0UoC�i�&��
��:2��Y���4�{B� �'S>�YH�H4&Gy��/�ȨK��5!�E��Q;�wd�)�5�66�%�g2�w�,�d��j�"�V��[�駟�Deq�      �   �   x����m1��*��$%���%���=�5}<HQD����%(^�����/}�,�:#��'��:"�x@"�����d)��[��$��i!}����U����t�mY��o�h��2�	F�l3��
�t�O�ud��3�v1�a-+"� ��ɡ��/CD����ҙ: @E��>�#�i���V�F&g�l���券K&���s]�b���         �  x��K��0���)^�@dH�^Ϊ(z���A@��D��Q��A�^�c �4��)�4���ѕ-u��Zd �3!�ބ�K%��9���T�/N��a�C�����9f�Kv����!-"���M��r�;�C�L#��s��d�C�q�n$��\i����yZN�i>`?3..�k=�J�$��J�,R<��[ԵU�iX�kǔЎ9�5ЖRV��ƧK�ሷ�u��L��z��V��K���/�i1�0�������ؖiD�����Qscx��h�Th`�;�T����K^H�V1�z���K7^�'��nI�3��	��C!�\2Ie��Z>H�S|�U����nL"���� �&��&	w�"�gNS]Z+� pJ���g�������o�p��>���/�P4�	�Ҕ44�����y�����FA�]i
���+
*��+��
G?w�,wZm�������      �   �   x�KL��L-K�M�+)�LD���q��*X�Y�[�ZXh�-�L�Ǖ���Z�	!15��25�3�074��4]6nhAQ>�D݂���"���VYZ���YZX�b�
M��=... 
G3      �   *  x�u�]��F���S����=K��l�=�x�-ovs�О�f��/ @_u�S?ﶼ��3��i�,;��&��[����9��! ��"��e�%���P���%�5l%�aZ�u_���>���C��D�'5�B1�h�s�Z�l�f�>x�Oo�-�t��oSj51�b��*ByXML%�j�Rc}�m�)�9N�����e�0��P�������^83�ѩ�'`,%�9����o[�u�w�T�6���F�H�[�=����_J��	�"T���_y;ؿ.,�۲n�����4��B�!+��m��L�R��T�@�kQ,B 1��~z�b�O�\���~�h(,��Ì,�#d�2b$�&�	87*s��?�r\��lB?s�i'm��,CEVz
�M@a�i�ߖ���4}
����ԓ�CÁņVhV:�d��;xB�6���G��O"���VMH�B�C��5��o����3��� wg��z8��f_�q��[S?_��?��/W7ъ�:G�U�t�.��a����7�w�_��:����ZƑ�h�LFn=��	����� ��,�N!��c��px��ү\������`N="�Q9'_2�	�Q*���C5{�n�����t��"�w��8��w��Y����+݈�#A�,�s���($�j���Sq�>��y�]�/'��-�/ Xch���|7��H�n�pEO4c��ΏUjj���*_�|�!�ϵ6/��NjM��sBʣA����h;�B�:�2�������<R�my��S�Eb�5S��w:4_�ڹ�"*����k�<��2��?fO��      �      x��\�n\�r}v�1�	{��ś�< OI z
0��V�m��$'A�=��[��c�,!��l5k�ŪZ�X䈡v[ĸ�٨є6�����C��&��W���c�t��;�|��������k��͟�卐X�l��
]X�P��������~���r���?�����bm)�"�=E��b�#�������o�z���A�����~����ϟ?\�|su����z�o�כ/=��R��Oןn�\�������w��'���כ�nW㪷9�h�����߅����������;;���|���|���?]�i���񾙣�R��Քы��ƈ�'�i�8'--��7�ę2~�{��K��ߌ�������o���ʁ�e����?>�wo����5�\�F�E=���aE����bȾ%{!�º}"f�G��7�@����}�j�.$�����=,�T��d��G ��|��8m�|�5��	����(�h%ԔM�ڍ�o&�XM���Q���T-�m|-5�S���z]�pK_k��o���e|���n�c�-�'�A-�ҏ�1� �����}�҃c��Zdd�)�%8Xb��&80����^�J��<̾�M���؂���hJ������J��7��@Ms�> �jj�.Ml8�#k���DN&�������1��V�6������eO�e�z�]֜���P^�������j��W<؋��4��Mf߆Q�T�i.�@YL���Q�g�5�ʻ&���Δ�b��A��b���N��;Յ%����+S�n�M��}���s�3Y�ܫⱸ���[�.��m`�q:p�!{�a��:%?,G_9��k��i튬�� ���~I��#{O9��H�����Ʌ�k�SR(�;WKr��wdm���@���ZM"�{.��P(o>��`��W���/��ȉ;P�tA����y����O���ۈ�v� %�a"�
��j2�j\ʎS����Q#���$�Zkr�a��=�
�{p;�O�;Qk���v�Ϲ�X����d]pq�W�]f@q�-2yxĚZ��JZbb����D|�8M�<2U��~�m����J����<�1���
�y
�' [���т��e�N5k��å�[���Z�W�W�@�J���/�����>����[֋�4�>B�8>�o��K���O>�����]���� � �Y����ڌ@6������B�Gϱ��'?����8�M��8:?yH��MAl�i��s�s8 8EW�� �f�Z��,Y�N��q��(	�]���sF��f�Q�%�*��(ZmfBX�b�5X���#K�}�~�mX\�NbC����1I2�O�b�C����l!uR0�Ā3�]�O�y,Ij����3sϘi�z<�R�O9�nJz�iz��3��EP<p���IvH�r4sX���������%Z��)�.��'Dݽ'x
��35�Tݮ@��2�ACى�1�sf�µ�d�
O�%����E��~,����>Vk-����U�\��h�O�S(�:���p�.T�XB>.��3FH�A�-g-�����8�v�%��#�kDG��#S�++���/��Xc�W�ᵖf,�J���ع\�� �E��qXz�FF�e������Б�0�r�>�� .4\�� G�=����)��6Jg�.1����;�l�G΃�g�c)q����]�їq�j�A|�����
��
{�OzD;���Z=8f�� �,���h
:l2!8H�`yY^�������ݗ�uU^��w����`E���.E�@\�:wU.ݲ%B�\B��<^�G;�&.ws� �l� �@� ��m4>΂	RZ�e,ҷ�d"����Li	2�wG�bX���������#`����;���%�gR�m@�X���!F�N#�$V��B2ݦws�(u��R� ��D�>D��#�D��n��Q��U�hIÔgA8�]@�V��/���iH�\�ާ����K:�S�0��E��ݐ�A�D�k]0��1���`�w�����B۔)�@)�Fh�&$�h�hp���A��'C�:���W'�K�T9-C��|����x���0�-G9�g�.�Q��ʱJ��Wy�y���������A/���d�P@��:�L-����z�vY���`���!�b�u�������`���巏��4*:E���޿t�
A*�$IF΃k��DVPqh�u��'e��eZjO�z��*oF������嶒���}	<���,� �]�Z��I�mBS�4f('�ĥ\_��t�g�O���[���eNi#��2��F�8���Ztc�	���b2-=Q?���D�]������E@F��zB�v$z߁�q�@�@�L����q=S�&uS	kLJH���A��h�7/O�ع�]���҂��}%�:��Gn�W��H�uTЭ��3T6��{?d}K�pF��ۊ�D���[b)�Q�pJO"|�\3���јA��|�z����էwk�b~+r�i�Lr6-s�sF�`Y�E����Ā�Qì���ΐ^)1_��J���	b���(H)*�"�G5#�
D�Wީ"f�)!KFbWļP�#��г,Q���\]�F$�W���οt�HJ�~c�5�I�S�%8m�+�A�_�i�v����I!!�w��T�m���6�!�X�~�fWy)�!h|�f~��p�R��ͧ��'� }I���7~���.EkC�҃ڈ�eHgr+�?�*C����ν�G�r�P�&G�zu��Y=��R�,3&ٹ"<���Dn
�X�i�6�������W;���7%w����z�O���{+N��g�.�j{�1Y�i{g�HF�[h�B[A(_u��_>X|��=��@($S4A⤜M��V=��X�M�nƎE��N �i�MG|�)����i�1����� ���Ϊ�?��[ڳ����3F���[OdB��j�^|K�F�H��;��^��7���ڸO�ݱ��2�{=$��7�,��C�`��켍5�&�� ��Ba�*�l��crI���;ƙ�N:�w�. �.[p�(=
P�JM%U�NW"������8��c?�h����x�`y�3����s;	en5y3�N8g��ڌ+)�N��_��,�nXr>��2<�0<2���B���uOɹ wHJ�I���џ��?-��ӷ��0_\O���BTLl�'�L�I;��ك�����$�%#��s��?��8Y>N�W�����)`������;��v��V��X�-%5�r����i�"%fJ�9J;�Z�z`c#@�42b��=L�eU�������}��4%���\�n�t~�貚T;G�d��v�����4CzҊ�"t�.%��n�E��}�����x�s{Ir`F�4�$��d�wU��vB��əT����l�;�Zz�l�h�:�	�I<�BZ��=otٯ�q�Ti�b� �ZK���d]����S�}[���mu�`�6��
/���ܺ��;��gW�4Yv�u���h	�LQgr��>�[�����^}8�_~�e[d�1���y�$�|+gᤔ�k� n�'�B���MCO�N�j�E'$(��w���n&��]�qڍ(�*SYiV!��'�Z�k�H����%��^��.iVz��}��?�W���)����*|7�F8�N�G�<`�_D���#�ߜ7]B��F�W�q�AK�9S�	��!kTt���^�g���`�|���`�~B�(1�NW��oi,���)AC��9#�"VL�mwF,i�A
� �+�#7?���Vw��^ �(?cpIV
��l�BN��%��j�Eʓ�_p�W���췖��a{��T���o�S��Z3�ԚZx �B��9ۘ�dõ�l�A��)�U��K{8^�^^��<�jf�|
~ң}���|p�xd�sNd;(���t3��S���4Ij�պ�ZS���lfCƜG`���Ȥ��i�������q����a���v�6��/>ct�q�E)Ī)N5	h�3ti_�
!P��e|5\>�*��>N"���Nl��p�! }  �MP�$=$���N���D��ё�)1W#mv#"�p�O���~��YҞ�䦎f�����GԞ3�ҍv�Z����Sz�)���z�ȿ�r�����mxf�F7�AOL��i��KŌވk�x�c�;�gU<�2N���9�����!���:Ic�!=�$�^�4�z�H{��O{����mr���4U{mB1G�zH�d�+ɤ�*k"iw�q�gM����v��)5�ȘL��'�v.#�L�rx>GP_�l7�:c�''��v���v��2r�tl��-r�%�)t8$� �[�Y2%J�u�>lAR~���f���H��9y��O��ۻ߂0;0t�c	��&��Y�#����"q�blP�
uy8 ����,��S�����S�
�)�,	�1��cxg�v�70��b����1�"5��ȋ���\�+ߒ�|��}E�̋ �C��#�<���~�:g#�F���џ�;��Y՟����ւ�t�4L��;|�K˞w�����<.�"8�29O�F<�%��=\�ֺ�X}��OKrM�.�~��08�pT�Z���⢚�V#�C��,�ՈΣ#)"o%#Pc�.�0�#��e1<�+&m����1�3�đ�?�ЧRg\4�#Jj�j@>\,dm�W⸓y����n�"��OI�W[)�#_:��>T�l��F��zk��롾TE��1�ȡ)jdk"�R3z�m����G4X��C$dM�ƚc{Z��>����y=U���Bu��CeG��7���x�,�m���cS�}��Ϥ�;�If�)ٱ*�8�/ݙ}��O�N����DI ku��-a�QHHS�'�C��Ė���3rh�}W`��R��%%�\C��ROzi�D�����-q��R����j������g�.;60a�O�TP�,]����*��D�j��h�u�_�G�n;���'��m�̺y(�x�7i��f��\��+¿;0��y,�c-� L'|��P��H�ti��,C��Fڳn����\�����Ng.��yf�yh�fx��=�l�Z<���g�ΓM�<��/����6��N�c7u����e���|�����n���XR�5Z$�r�ց/�s�I^x�̌ɪ�g\�'��c���@�X=cty�%Q���V��2V��y`ؑ0���B�m��^�'���V
'�?�,{�����0_M�i;�Z�6{�c��3���5d̃��n���l���ޣ8o��x����~��׻;8�<��s��or����MB�ܱ���jK�^��Vs*�(�R����u}}ʋ��&�p�R�� �ӟ8���gC�JL���+5������1�Nh�Ly6���.����УԒ�/nH�)��`�q�4��=�A��pae/�)w�<{tyAQ�hhi�����[�':G�����vLE�X��Q0�IΣ��O܎y?����38Л=!B֤�A@Ί��P�w�:��x�y�1v��f:��}i���`>FV���% ��9H��{��e�ӹ�KE�=��K��1����C˳�|}.W��^���}�n��Y��y�Yh��f-��x���uWs�aVҡB�FRM)#;M�|gwS���m�K�������B�B�������"���s]�|�NҊ�*@}E����ws�:�AI ު�Ś|�B�4G��O�,@H�Ud�����hI����S�y
X��l�¬���Z�ĳG�m��ԯ��5_AР� �|���>z�_�-��;CO�Uo�>?��p2�"���:��ufQ����\��ͣo<o��������"�绍���J���/^��#�C��3�"�y	�YBl��=b,=n�y�R�G8}�S����� �'?u�)�4��mF��'��j<�'������~�����y      �      x���ˮ$;�]��_Qs�4��G~K�@j@��C�~��Ip߸��E�����$��:k[�����_����������QKm�!�2�)�W��T?�����(���;����ɧ�%�R�F���g���6�=�/ �>��bH�"㗖��2e�Ϡ�������L��X��:z���gQO�}��"�)��W�
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