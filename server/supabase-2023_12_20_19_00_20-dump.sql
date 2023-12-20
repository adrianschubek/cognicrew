--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Ubuntu 15.1-1.pgdg20.04+1)
-- Dumped by pg_dump version 16.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP POLICY IF EXISTS "users can update their own profile" ON public.profiles;
DROP POLICY IF EXISTS "user can see their own joined projects" ON public.user_learning_projects;
DROP POLICY IF EXISTS "user can leave projects" ON public.user_learning_projects;
DROP POLICY IF EXISTS "outgoing and incoming friend request can be read" ON public.friends;
DROP POLICY IF EXISTS "allow update if user owns project" ON public.learning_projects;
DROP POLICY IF EXISTS "Users can see their own achievements" ON public.user_achievements;
DROP POLICY IF EXISTS "Enable users to update their own friend requests" ON public.friends;
DROP POLICY IF EXISTS "Enable users to insert their own friend requests" ON public.friends;
DROP POLICY IF EXISTS "Enable user to delete received and sent friend requests " ON public.friends;
DROP POLICY IF EXISTS "Enable update " ON public.sets;
DROP POLICY IF EXISTS "Enable read access for project members" ON public.sets;
DROP POLICY IF EXISTS "Enable read access for owners and members of project" ON public.learning_projects;
DROP POLICY IF EXISTS "Enable read access for all users!" ON public.user_achievements;
DROP POLICY IF EXISTS "Enable read access for all users" ON public.user_achievements;
DROP POLICY IF EXISTS "Enable read access for all users" ON public.tracker;
DROP POLICY IF EXISTS "Enable read access for all users" ON public.public_room_states;
DROP POLICY IF EXISTS "Enable read access for all users" ON public.achievements;
DROP POLICY IF EXISTS "Enable insert for authenticated users only" ON public.learning_projects;
DROP POLICY IF EXISTS "Enable insert " ON public.sets;
DROP POLICY IF EXISTS "Enable delete for users" ON public.sets;
DROP POLICY IF EXISTS "Enable access to project members" ON public.flashcards;
DROP POLICY IF EXISTS "Enable access to authenticated users" ON public.project_ratings;
DROP POLICY IF EXISTS "Enable access for project members" ON public.links;
DROP POLICY IF EXISTS "Enable access for project members" ON public.exercises;
DROP POLICY IF EXISTS "Enable access for all project members" ON public.answers_exercises;
DROP POLICY IF EXISTS "Allows owner to delete the project" ON public.learning_projects;
ALTER TABLE IF EXISTS ONLY public.user_learning_projects DROP CONSTRAINT IF EXISTS user_learning_projects_user_id_fkey;
ALTER TABLE IF EXISTS ONLY public.user_learning_projects DROP CONSTRAINT IF EXISTS user_learning_projects_learning_project_id_fkey;
ALTER TABLE IF EXISTS ONLY public.user_achievements DROP CONSTRAINT IF EXISTS user_achievements_user_id_fkey;
ALTER TABLE IF EXISTS ONLY public.user_achievements DROP CONSTRAINT IF EXISTS user_achievements_achievement_id_fkey;
ALTER TABLE IF EXISTS ONLY public.sets DROP CONSTRAINT IF EXISTS sets_project_id_fkey;
ALTER TABLE IF EXISTS ONLY public.rooms DROP CONSTRAINT IF EXISTS rooms_project_id_fkey;
ALTER TABLE IF EXISTS ONLY public.queue DROP CONSTRAINT IF EXISTS queue_room_id_fkey;
ALTER TABLE IF EXISTS ONLY public.public_room_states DROP CONSTRAINT IF EXISTS public_room_states_room_id_fkey;
ALTER TABLE IF EXISTS ONLY public.project_ratings DROP CONSTRAINT IF EXISTS project_ratings_user_id_fkey;
ALTER TABLE IF EXISTS ONLY public.project_ratings DROP CONSTRAINT IF EXISTS project_ratings_project_id_fkey;
ALTER TABLE IF EXISTS ONLY public.profiles DROP CONSTRAINT IF EXISTS profiles_room_id_fkey;
ALTER TABLE IF EXISTS ONLY public.profiles DROP CONSTRAINT IF EXISTS profiles_id_fkey;
ALTER TABLE IF EXISTS ONLY public.private_room_states DROP CONSTRAINT IF EXISTS private_room_states_room_id_fkey;
ALTER TABLE IF EXISTS ONLY public.player_answers DROP CONSTRAINT IF EXISTS player_answers_user_id_fkey;
ALTER TABLE IF EXISTS ONLY public.player_answers DROP CONSTRAINT IF EXISTS player_answers_room_id_fkey;
ALTER TABLE IF EXISTS ONLY public.links DROP CONSTRAINT IF EXISTS links_learning_project_fkey;
ALTER TABLE IF EXISTS ONLY public.learning_projects DROP CONSTRAINT IF EXISTS learning_projects_owner_id_fkey;
ALTER TABLE IF EXISTS ONLY public.friends DROP CONSTRAINT IF EXISTS friends_user_to_id_fkey;
ALTER TABLE IF EXISTS ONLY public.friends DROP CONSTRAINT IF EXISTS friends_user_from_id_fkey;
ALTER TABLE IF EXISTS ONLY public.flashcards DROP CONSTRAINT IF EXISTS flashcards_set_id_fkey;
ALTER TABLE IF EXISTS ONLY public.exercises DROP CONSTRAINT IF EXISTS exercises_set_id_fkey;
ALTER TABLE IF EXISTS ONLY public.answers_exercises DROP CONSTRAINT IF EXISTS answers_exercises_exercise_fkey;
DROP TRIGGER IF EXISTS update_ratings_trigger ON public.project_ratings;
DROP TRIGGER IF EXISTS "updateLearningProjectsGuard" ON public.learning_projects;
DROP TRIGGER IF EXISTS upd_rooms_tracker_joined ON public.profiles;
DROP TRIGGER IF EXISTS upd_rooms_tracker ON public.rooms;
DROP TRIGGER IF EXISTS guard_profiles_trigger ON public.profiles;
DROP TRIGGER IF EXISTS "addProjectOnCreate" ON public.learning_projects;
DROP INDEX IF EXISTS public.rooms_secret_key_idx;
DROP INDEX IF EXISTS public.profiles_username_case_insensitive_key;
DROP INDEX IF EXISTS public.learning_projects_owner_id_idx;
DROP INDEX IF EXISTS public.flashcards_set_id_idx;
DROP INDEX IF EXISTS public.exercises_set_id_idx;
DROP INDEX IF EXISTS public.btree_socket_room_id_idx;
DROP INDEX IF EXISTS public.answers_exercises_exercise_idx;
ALTER TABLE IF EXISTS ONLY public.user_learning_projects DROP CONSTRAINT IF EXISTS user_learning_projects_pkey;
ALTER TABLE IF EXISTS ONLY public.user_achievements DROP CONSTRAINT IF EXISTS user_achievements_pkey;
ALTER TABLE IF EXISTS ONLY public.user_achievements DROP CONSTRAINT IF EXISTS unique_user_achievement;
ALTER TABLE IF EXISTS ONLY public.tracker DROP CONSTRAINT IF EXISTS tracker_pk;
ALTER TABLE IF EXISTS ONLY public.tracker DROP CONSTRAINT IF EXISTS tracker_key_key;
ALTER TABLE IF EXISTS ONLY public.sets DROP CONSTRAINT IF EXISTS sets_pkey;
ALTER TABLE IF EXISTS ONLY public.rooms DROP CONSTRAINT IF EXISTS rooms_share_code_key;
ALTER TABLE IF EXISTS ONLY public.rooms DROP CONSTRAINT IF EXISTS rooms_pkey;
ALTER TABLE IF EXISTS ONLY public.public_room_states DROP CONSTRAINT IF EXISTS room_states_pkey;
ALTER TABLE IF EXISTS ONLY public.queue DROP CONSTRAINT IF EXISTS queue_pkey;
ALTER TABLE IF EXISTS ONLY public.project_ratings DROP CONSTRAINT IF EXISTS project_ratings_pkey;
ALTER TABLE IF EXISTS ONLY public.profiles DROP CONSTRAINT IF EXISTS profiles_username_key;
ALTER TABLE IF EXISTS ONLY public.profiles DROP CONSTRAINT IF EXISTS profiles_pkey;
ALTER TABLE IF EXISTS ONLY public.private_room_states DROP CONSTRAINT IF EXISTS private_room_states_pkey;
ALTER TABLE IF EXISTS ONLY public.player_answers DROP CONSTRAINT IF EXISTS player_answers_pkey;
ALTER TABLE IF EXISTS ONLY public.links DROP CONSTRAINT IF EXISTS lp_links_pkey;
ALTER TABLE IF EXISTS ONLY public.flashcards DROP CONSTRAINT IF EXISTS lp_flashcards_pkey;
ALTER TABLE IF EXISTS ONLY public.learning_projects DROP CONSTRAINT IF EXISTS learning_projects_pkey;
ALTER TABLE IF EXISTS ONLY public.friends DROP CONSTRAINT IF EXISTS friends_pkey;
ALTER TABLE IF EXISTS ONLY public.exercises DROP CONSTRAINT IF EXISTS exercises_pkey;
ALTER TABLE IF EXISTS ONLY public.answers_exercises DROP CONSTRAINT IF EXISTS answers_exercises_pkey;
ALTER TABLE IF EXISTS ONLY public.achievements DROP CONSTRAINT IF EXISTS achievements_pkey;
DROP TABLE IF EXISTS public.user_rank;
DROP TABLE IF EXISTS public.user_learning_projects;
DROP TABLE IF EXISTS public.user_achievements;
DROP TABLE IF EXISTS public.tracker;
DROP TABLE IF EXISTS public.sets;
DROP TABLE IF EXISTS public.rooms;
DROP TABLE IF EXISTS public.queue;
DROP TABLE IF EXISTS public.public_room_states;
DROP TABLE IF EXISTS public.project_ratings;
DROP TABLE IF EXISTS public.profiles;
DROP TABLE IF EXISTS public.private_room_states;
DROP TABLE IF EXISTS public.player_answers;
DROP TABLE IF EXISTS public.links;
DROP TABLE IF EXISTS public.flashcards;
DROP TABLE IF EXISTS public.exercises;
DROP TABLE IF EXISTS public.answers_exercises;
DROP TABLE IF EXISTS public.achievements;
DROP FUNCTION IF EXISTS public.update_statistics();
DROP FUNCTION IF EXISTS public.update_last_updated();
DROP FUNCTION IF EXISTS public.transfer_project(p_owner_name text, p_project_id bigint);
DROP FUNCTION IF EXISTS public.track(p_key text);
DROP FUNCTION IF EXISTS public.switch_locked_room();
DROP FUNCTION IF EXISTS public.sum_project_ratings(project_id_param bigint);
DROP FUNCTION IF EXISTS public.search_user(search_query text);
DROP FUNCTION IF EXISTS public.remove_user_from_project(p_project_id bigint, p_other_user_id uuid);
DROP FUNCTION IF EXISTS public.quick_join_room(p_share_code bigint);
DROP FUNCTION IF EXISTS public.public_projects();
DROP TABLE IF EXISTS public.learning_projects;
DROP FUNCTION IF EXISTS public.project_members(p_project_id bigint);
DROP FUNCTION IF EXISTS public.list_sets();
DROP FUNCTION IF EXISTS public.list_rooms();
DROP FUNCTION IF EXISTS public.list_room_members();
DROP FUNCTION IF EXISTS public.list_friends_ids_and_names();
DROP FUNCTION IF EXISTS public.list_friends();
DROP TABLE IF EXISTS public.friends;
DROP FUNCTION IF EXISTS public.link_count(p_project_id bigint);
DROP FUNCTION IF EXISTS public.leave_room();
DROP FUNCTION IF EXISTS public.join_room(p_room_id uuid, p_room_code bigint);
DROP FUNCTION IF EXISTS public.invite_user_to_project(p_project_id bigint, p_other_user_id uuid);
DROP FUNCTION IF EXISTS public.handle_new_user();
DROP FUNCTION IF EXISTS public.guard_profiles();
DROP FUNCTION IF EXISTS public.guard_learning_projects();
DROP FUNCTION IF EXISTS public.get_users_rating_for_project(project_id_param bigint, user_id_param uuid);
DROP FUNCTION IF EXISTS public.get_usernames(user_ids uuid[]);
DROP FUNCTION IF EXISTS public.get_user_rank_and_id(user_id_param uuid, project_id_param bigint);
DROP FUNCTION IF EXISTS public.get_user_global_rank_data(project_id_param bigint, user_id_param uuid);
DROP FUNCTION IF EXISTS public.get_user_global_rank(project_id_param bigint, user_id_param uuid);
DROP FUNCTION IF EXISTS public.get_published_learning_projects_with_avg_rating();
DROP FUNCTION IF EXISTS public.get_particular_amount_ratings(project_id_param bigint);
DROP FUNCTION IF EXISTS public.get_distinct_project_groups();
DROP FUNCTION IF EXISTS public."getUsername"(user_id uuid);
DROP FUNCTION IF EXISTS public.flashcard_count(p_project_id bigint);
DROP FUNCTION IF EXISTS public.exercise_count(p_project_id bigint);
DROP FUNCTION IF EXISTS public.delete_friend(p_other_userid uuid);
DROP FUNCTION IF EXISTS public.delete_answers_exercise(answers public.answer_type[]);
DROP FUNCTION IF EXISTS public.create_room(p_project_id bigint, p_code integer, p_name text, p_share_code integer, p_size integer, p_private boolean);
DROP FUNCTION IF EXISTS public.cleanup_rooms();
DROP FUNCTION IF EXISTS public.bullshit_list_room_members();
DROP FUNCTION IF EXISTS public.avg_project_rating(project_id_param bigint);
DROP FUNCTION IF EXISTS public."addProjectOnCreate"();
DROP TYPE IF EXISTS public.answer_type;
DROP SCHEMA IF EXISTS public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: answer_type; Type: TYPE; Schema: public; Owner: supabase_admin
--

CREATE TYPE public.answer_type AS (
	exercise bigint,
	order_position smallint
);


ALTER TYPE public.answer_type OWNER TO supabase_admin;

--
-- Name: addProjectOnCreate(); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION public."addProjectOnCreate"() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$BEGIN INSERT INTO user_learning_projects (learning_project_id, user_id)
VALUES (NEW.id, auth.uid());
RETURN NEW;
END;$$;


ALTER FUNCTION public."addProjectOnCreate"() OWNER TO supabase_admin;

--
-- Name: avg_project_rating(bigint); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION public.avg_project_rating(project_id_param bigint) RETURNS double precision
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$declare
    avg_rating float;

BEGIN
    SELECT AVG(rating) FROM project_ratings WHERE project_id = project_id_param INTO avg_rating;
    RETURN avg_rating;
END;$$;


ALTER FUNCTION public.avg_project_rating(project_id_param bigint) OWNER TO supabase_admin;

--
-- Name: bullshit_list_room_members(); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION public.bullshit_list_room_members() RETURNS TABLE(id uuid, username text)
    LANGUAGE plpgsql STABLE SECURITY DEFINER
    AS $$
begin
    -- check if current user is owner of room
    if not exists (select 1
                   from profiles p
                            join rooms r on p.room_id = r.id
                   where p.id = auth.uid()
                     and r.host = auth.uid()) then
        raise 'You are not the host of this room';
    end if;

    -- return all members of room
    return query select p.id, p.username
                 from profiles p
                 where room_id = (select room_id
                                  from profiles pp
                                  where pp.id = auth.uid());

--     return query SELECT (id, username)::record
--     FROM profiles
--     WHERE room_id = (select room_id from profiles where id = auth.uid());
end;
$$;


ALTER FUNCTION public.bullshit_list_room_members() OWNER TO supabase_admin;

--
-- Name: cleanup_rooms(); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION public.cleanup_rooms() RETURNS void
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


ALTER FUNCTION public.cleanup_rooms() OWNER TO supabase_admin;

--
-- Name: create_room(bigint, integer, text, integer, integer, boolean); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION public.create_room(p_project_id bigint, p_code integer, p_name text, p_share_code integer, p_size integer, p_private boolean) RETURNS record
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


ALTER FUNCTION public.create_room(p_project_id bigint, p_code integer, p_name text, p_share_code integer, p_size integer, p_private boolean) OWNER TO supabase_admin;

--
-- Name: delete_answers_exercise(public.answer_type[]); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION public.delete_answers_exercise(answers public.answer_type[]) RETURNS boolean
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


ALTER FUNCTION public.delete_answers_exercise(answers public.answer_type[]) OWNER TO supabase_admin;

--
-- Name: delete_friend(uuid); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION public.delete_friend(p_other_userid uuid) RETURNS boolean
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


ALTER FUNCTION public.delete_friend(p_other_userid uuid) OWNER TO supabase_admin;

--
-- Name: exercise_count(bigint); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION public.exercise_count(p_project_id bigint) RETURNS bigint
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$declare
    count bigint;

BEGIN
    SELECT count(*) FROM exercises JOIN sets ON set_id = sets.id AND sets.project_id = p_project_id INTO count;
    RETURN count;
END;$$;


ALTER FUNCTION public.exercise_count(p_project_id bigint) OWNER TO supabase_admin;

--
-- Name: flashcard_count(bigint); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION public.flashcard_count(p_project_id bigint) RETURNS bigint
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$declare
    count bigint;

BEGIN
    SELECT count(*) FROM flashcards JOIN sets ON set_id = sets.id AND sets.project_id = p_project_id INTO count;
    RETURN count;
END;$$;


ALTER FUNCTION public.flashcard_count(p_project_id bigint) OWNER TO supabase_admin;

--
-- Name: getUsername(uuid); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION public."getUsername"(user_id uuid) RETURNS text
    LANGUAGE sql STABLE SECURITY DEFINER
    AS $$select username from profiles where id=user_id$$;


ALTER FUNCTION public."getUsername"(user_id uuid) OWNER TO supabase_admin;

--
-- Name: get_distinct_project_groups(); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION public.get_distinct_project_groups() RETURNS TABLE("group" text)
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
begin
    return query
        SELECT DISTINCT learning_projects.group
        FROM learning_projects
        WHERE is_published = TRUE;
end;
$$;


ALTER FUNCTION public.get_distinct_project_groups() OWNER TO supabase_admin;

--
-- Name: get_particular_amount_ratings(bigint); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION public.get_particular_amount_ratings(project_id_param bigint) RETURNS record
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$declare
    ratings_arr record;

BEGIN
    SELECT
    COUNT(CASE WHEN rating = 1 THEN rating END) AS count_One_Star,
    COUNT(CASE WHEN rating = 2 THEN rating END) AS count_Two_Star,
    COUNT(CASE WHEN rating = 3 THEN rating END) AS count_Three_Star,
    COUNT(CASE WHEN rating = 4 THEN rating END) AS count_Four_Star,
    COUNT(CASE WHEN rating = 5 THEN rating END) AS count_Five_Star
    FROM project_ratings WHERE project_id = project_id_param INTO ratings_arr;
    RETURN ratings_arr;
END;
$$;


ALTER FUNCTION public.get_particular_amount_ratings(project_id_param bigint) OWNER TO supabase_admin;

--
-- Name: get_published_learning_projects_with_avg_rating(); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION public.get_published_learning_projects_with_avg_rating() RETURNS TABLE(project_id bigint, name text, description text, created_at timestamp with time zone, tags text, owner_id uuid, is_published boolean, username text, avg_rating numeric)
    LANGUAGE plpgsql SECURITY DEFINER
    SET search_path TO 'public'
    AS $$
BEGIN
    RETURN QUERY
        SELECT lp.id AS project_id,
               lp.name,
               lp.description,
               lp.created_at,
               lp.tags,
               lp.owner_id,
               lp.is_published,
               pr.username,
               COALESCE(AVG(pra.rating), 0) AS avg_rating
        FROM learning_projects lp
        JOIN profiles pr ON lp.owner_id = pr.id
        LEFT JOIN project_ratings pra ON lp.id = pra.project_id
        WHERE lp.is_published IS TRUE
        GROUP BY lp.id, pr.username;
END;
$$;


ALTER FUNCTION public.get_published_learning_projects_with_avg_rating() OWNER TO supabase_admin;

--
-- Name: get_user_global_rank(bigint, uuid); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION public.get_user_global_rank(project_id_param bigint, user_id_param uuid) RETURNS integer
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    user_rank INTEGER;
BEGIN

SELECT ranking_subquery.ranking AS user_rank
    FROM (
        SELECT
            ulp.user_id,
            RANK() OVER (ORDER BY friend_scores DESC)::INTEGER AS ranking
        FROM (
            SELECT
                ulp.user_id,
                SUM((stats -> 'scoreQuiz')::INTEGER + (stats -> 'scoreFlashcards')::INTEGER)::INTEGER AS friend_scores
            FROM
                user_learning_projects AS ulp
            WHERE
                ulp.learning_project_id = '347'
            GROUP BY
                ulp.user_id
        ) AS ulp
    ) AS ranking_subquery
    WHERE ranking_subquery.user_id = '26a397e5-84c7-4cb0-b728-d5b120a8daad';
    RETURN user_rank;
END;
$$;


ALTER FUNCTION public.get_user_global_rank(project_id_param bigint, user_id_param uuid) OWNER TO supabase_admin;

--
-- Name: get_user_global_rank_data(bigint, uuid); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION public.get_user_global_rank_data(project_id_param bigint, user_id_param uuid) RETURNS TABLE(user_id uuid, user_rank integer)
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$

BEGIN
    RETURN QUERY
    SELECT
        ulp.user_id,
        RANK() OVER (ORDER BY friend_scores DESC)::INTEGER AS ranking
    FROM (
        SELECT
            ulp.user_id,
            SUM((stats -> 'scoreQuiz')::INTEGER + (stats -> 'scoreFlashcards')::INTEGER)::INTEGER AS friend_scores
        FROM
            user_learning_projects AS ulp
        WHERE
            (ulp.learning_project_id = project_id_param)
        GROUP BY
            ulp.user_id
    ) AS ulp;

    RETURN;
END;
$$;


ALTER FUNCTION public.get_user_global_rank_data(project_id_param bigint, user_id_param uuid) OWNER TO supabase_admin;

--
-- Name: get_user_rank_and_id(uuid, bigint); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION public.get_user_rank_and_id(user_id_param uuid, project_id_param bigint) RETURNS TABLE(user_id uuid, user_rank integer)
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
BEGIN
    RETURN QUERY
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
            friends f ON ulp.user_id = f.user_to_id OR ulp.user_id = f.user_from_id
        WHERE
            (f.user_from_id = user_id_param OR f.user_to_id = user_id_param) AND
            (learning_project_id = project_id_param)
    ) AS ulp;

    RETURN;
END;
$$;


ALTER FUNCTION public.get_user_rank_and_id(user_id_param uuid, project_id_param bigint) OWNER TO supabase_admin;

--
-- Name: get_usernames(uuid[]); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION public.get_usernames(user_ids uuid[]) RETURNS text[]
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


ALTER FUNCTION public.get_usernames(user_ids uuid[]) OWNER TO supabase_admin;

--
-- Name: get_users_rating_for_project(bigint, uuid); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION public.get_users_rating_for_project(project_id_param bigint, user_id_param uuid) RETURNS integer
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$declare
    user_rating integer;

BEGIN
    SELECT rating FROM project_ratings 
    WHERE (project_id = project_id_param AND user_id = user_id_param) INTO user_rating;
    RETURN user_rating;
END;
$$;


ALTER FUNCTION public.get_users_rating_for_project(project_id_param bigint, user_id_param uuid) OWNER TO supabase_admin;

--
-- Name: guard_learning_projects(); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION public.guard_learning_projects() RETURNS trigger
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


ALTER FUNCTION public.guard_learning_projects() OWNER TO supabase_admin;

--
-- Name: guard_profiles(); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION public.guard_profiles() RETURNS trigger
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


ALTER FUNCTION public.guard_profiles() OWNER TO supabase_admin;

--
-- Name: handle_new_user(); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION public.handle_new_user() RETURNS trigger
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


ALTER FUNCTION public.handle_new_user() OWNER TO supabase_admin;

--
-- Name: invite_user_to_project(bigint, uuid); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION public.invite_user_to_project(p_project_id bigint, p_other_user_id uuid) RETURNS void
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


ALTER FUNCTION public.invite_user_to_project(p_project_id bigint, p_other_user_id uuid) OWNER TO supabase_admin;

--
-- Name: join_room(uuid, bigint); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION public.join_room(p_room_id uuid, p_room_code bigint) RETURNS record
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


ALTER FUNCTION public.join_room(p_room_id uuid, p_room_code bigint) OWNER TO supabase_admin;

--
-- Name: leave_room(); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION public.leave_room() RETURNS void
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


ALTER FUNCTION public.leave_room() OWNER TO supabase_admin;

--
-- Name: link_count(bigint); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION public.link_count(p_project_id bigint) RETURNS bigint
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$declare
    count bigInt;

BEGIN
    SELECT count(*) FROM links WHERE learning_project = p_project_id INTO count;
    RETURN count;
END;$$;


ALTER FUNCTION public.link_count(p_project_id bigint) OWNER TO supabase_admin;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: friends; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.friends (
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_from_id uuid NOT NULL,
    user_to_id uuid NOT NULL
);


ALTER TABLE public.friends OWNER TO supabase_admin;

--
-- Name: TABLE friends; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON TABLE public.friends IS 'All friend connections between users';


--
-- Name: list_friends(); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION public.list_friends() RETURNS SETOF public.friends
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


ALTER FUNCTION public.list_friends() OWNER TO supabase_admin;

--
-- Name: list_friends_ids_and_names(); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION public.list_friends_ids_and_names() RETURNS TABLE(id uuid, username text)
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


ALTER FUNCTION public.list_friends_ids_and_names() OWNER TO supabase_admin;

--
-- Name: list_room_members(); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION public.list_room_members() RETURNS TABLE(id uuid, username text)
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


ALTER FUNCTION public.list_room_members() OWNER TO supabase_admin;

--
-- Name: list_rooms(); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION public.list_rooms() RETURNS TABLE(id uuid, name text, created_at timestamp with time zone, protected boolean, host uuid, hostname text, cursize integer, maxsize integer)
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


ALTER FUNCTION public.list_rooms() OWNER TO supabase_admin;

--
-- Name: list_sets(); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION public.list_sets() RETURNS TABLE(name text, id bigint, type smallint)
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


ALTER FUNCTION public.list_sets() OWNER TO supabase_admin;

--
-- Name: project_members(bigint); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION public.project_members(p_project_id bigint) RETURNS TABLE(user_id uuid, username text)
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


ALTER FUNCTION public.project_members(p_project_id bigint) OWNER TO supabase_admin;

--
-- Name: learning_projects; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.learning_projects (
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


ALTER TABLE public.learning_projects OWNER TO supabase_admin;

--
-- Name: TABLE learning_projects; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON TABLE public.learning_projects IS 'All the data learning projects consist of';


--
-- Name: COLUMN learning_projects."group"; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON COLUMN public.learning_projects."group" IS 'sommersemester xx etc';


--
-- Name: COLUMN learning_projects.is_published; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON COLUMN public.learning_projects.is_published IS 'if project is public allow play/create room and cloning';


--
-- Name: COLUMN learning_projects.owner_id; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON COLUMN public.learning_projects.owner_id IS 'project owner. cannot be set by client (trigger)';


--
-- Name: public_projects(); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION public.public_projects() RETURNS SETOF public.learning_projects
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
begin
    return query
        select * from learning_projects where is_published is true;
end;
$$;


ALTER FUNCTION public.public_projects() OWNER TO supabase_admin;

--
-- Name: quick_join_room(bigint); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION public.quick_join_room(p_share_code bigint) RETURNS record
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


ALTER FUNCTION public.quick_join_room(p_share_code bigint) OWNER TO supabase_admin;

--
-- Name: remove_user_from_project(bigint, uuid); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION public.remove_user_from_project(p_project_id bigint, p_other_user_id uuid) RETURNS void
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


ALTER FUNCTION public.remove_user_from_project(p_project_id bigint, p_other_user_id uuid) OWNER TO supabase_admin;

--
-- Name: search_user(text); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION public.search_user(search_query text) RETURNS record
    LANGUAGE sql SECURITY DEFINER
    AS $$SELECT username, id FROM profiles p WHERE search_query = p.username$$;


ALTER FUNCTION public.search_user(search_query text) OWNER TO supabase_admin;

--
-- Name: sum_project_ratings(bigint); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION public.sum_project_ratings(project_id_param bigint) RETURNS integer
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
declare
    rating_sum integer;

BEGIN
    SELECT COUNT(*) FROM project_ratings WHERE project_id = project_id_param INTO rating_sum;
    RETURN rating_sum;
END;

$$;


ALTER FUNCTION public.sum_project_ratings(project_id_param bigint) OWNER TO supabase_admin;

--
-- Name: switch_locked_room(); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION public.switch_locked_room() RETURNS boolean
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


ALTER FUNCTION public.switch_locked_room() OWNER TO supabase_admin;

--
-- Name: track(text); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION public.track(p_key text) RETURNS void
    LANGUAGE plpgsql
    AS $$
begin -- update the last_updated column if the key already exists, otherwise insert a new row to trigger realtime updates
    insert into tracker (key, last_updated)
    values (p_key, now())
    on conflict (key) DO UPDATE SET last_updated = now() where excluded.key = tracker.key;
end;
$$;


ALTER FUNCTION public.track(p_key text) OWNER TO supabase_admin;

--
-- Name: transfer_project(text, bigint); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION public.transfer_project(p_owner_name text, p_project_id bigint) RETURNS void
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


ALTER FUNCTION public.transfer_project(p_owner_name text, p_project_id bigint) OWNER TO supabase_admin;

--
-- Name: update_last_updated(); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION public.update_last_updated() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    -- FIXME: parameterize the key!
    update tracker set last_updated = now() where key = 'rooms';
    return new;
END;
$$;


ALTER FUNCTION public.update_last_updated() OWNER TO supabase_admin;

--
-- Name: update_statistics(); Type: FUNCTION; Schema: public; Owner: supabase_admin
--

CREATE FUNCTION public.update_statistics() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$BEGIN
PERFORM track('rate');
RETURN COALESCE(NEW, OLD);
END;$$;


ALTER FUNCTION public.update_statistics() OWNER TO supabase_admin;

--
-- Name: achievements; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.achievements (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    name text DEFAULT ''::text,
    description text DEFAULT ''::text,
    icon_name text
);


ALTER TABLE public.achievements OWNER TO supabase_admin;

--
-- Name: TABLE achievements; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON TABLE public.achievements IS 'All the possible achievements';


--
-- Name: achievements_id_seq; Type: SEQUENCE; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.achievements ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.achievements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: answers_exercises; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.answers_exercises (
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    answer text NOT NULL,
    exercise bigint NOT NULL,
    is_correct boolean NOT NULL,
    order_position smallint NOT NULL,
    CONSTRAINT answers_exercises_order_position_check CHECK (((order_position >= 1) AND (order_position <= 6)))
);


ALTER TABLE public.answers_exercises OWNER TO supabase_admin;

--
-- Name: TABLE answers_exercises; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON TABLE public.answers_exercises IS 'One exercise can have up to 4 answers to choose from.';


--
-- Name: exercises; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.exercises (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    question text DEFAULT ''::text NOT NULL,
    priority bigint,
    set_id bigint NOT NULL,
    CONSTRAINT exercises_priority_check CHECK (((priority >= 0) AND (priority <= 10)))
);


ALTER TABLE public.exercises OWNER TO supabase_admin;

--
-- Name: TABLE exercises; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON TABLE public.exercises IS 'All exercises need to be assigned to a learning project.';


--
-- Name: exercises_id_seq; Type: SEQUENCE; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.exercises ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.exercises_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: flashcards; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.flashcards (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    question text,
    answer text,
    priority bigint,
    set_id bigint NOT NULL,
    CONSTRAINT flashcards_priority_check CHECK (((priority >= 0) AND (priority <= 10)))
);


ALTER TABLE public.flashcards OWNER TO supabase_admin;

--
-- Name: TABLE flashcards; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON TABLE public.flashcards IS 'All flashcards need to be assigned to a learning project.';


--
-- Name: learning_projects_id_seq; Type: SEQUENCE; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.learning_projects ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.learning_projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: links; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.links (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    link_url text,
    learning_project bigint,
    title text,
    subtitle text,
    description text
);


ALTER TABLE public.links OWNER TO supabase_admin;

--
-- Name: TABLE links; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON TABLE public.links IS 'All links need to be associated with a learning project.';


--
-- Name: lp_flashcards_id_seq; Type: SEQUENCE; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.flashcards ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.lp_flashcards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: lp_links_id_seq; Type: SEQUENCE; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.links ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.lp_links_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: player_answers; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.player_answers (
    room_id uuid NOT NULL,
    user_id uuid NOT NULL,
    round bigint NOT NULL,
    answer_correct boolean NOT NULL,
    answered_at bigint NOT NULL,
    answer_time bigint NOT NULL,
    answer text NOT NULL
);


ALTER TABLE public.player_answers OWNER TO supabase_admin;

--
-- Name: TABLE player_answers; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON TABLE public.player_answers IS 'submitted player answers for games';


--
-- Name: COLUMN player_answers.round; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON COLUMN public.player_answers.round IS '1...n';


--
-- Name: COLUMN player_answers.answered_at; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON COLUMN public.player_answers.answered_at IS 'unix timestamp in ms';


--
-- Name: COLUMN player_answers.answer_time; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON COLUMN public.player_answers.answer_time IS 'in ms. needed';


--
-- Name: private_room_states; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.private_room_states (
    room_id uuid NOT NULL,
    data json NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.private_room_states OWNER TO supabase_admin;

--
-- Name: TABLE private_room_states; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON TABLE public.private_room_states IS 'quiz/answers data. user answers. hidden from users';


--
-- Name: COLUMN private_room_states.data; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON COLUMN public.private_room_states.data IS 'json';


--
-- Name: profiles; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.profiles (
    id uuid NOT NULL,
    username text NOT NULL,
    room_id uuid,
    user_tags text DEFAULT ''::text NOT NULL,
    user_settings jsonb,
    CONSTRAINT profiles_username_check CHECK (((length(username) < 32) AND (length(username) > 4) AND (username ~ '^[a-zA-Z0-9_äöüÄÖÜ]+$'::text)))
);


ALTER TABLE public.profiles OWNER TO supabase_admin;

--
-- Name: COLUMN profiles.room_id; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON COLUMN public.profiles.room_id IS 'user is in room (is guarded)';


--
-- Name: COLUMN profiles.user_tags; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON COLUMN public.profiles.user_tags IS 'DELETE THIS List of tags associated with the user that represent his interests.';


--
-- Name: project_ratings; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.project_ratings (
    project_id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_id uuid NOT NULL,
    rating smallint NOT NULL
);


ALTER TABLE public.project_ratings OWNER TO supabase_admin;

--
-- Name: project_ratings_id_seq; Type: SEQUENCE; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.project_ratings ALTER COLUMN project_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.project_ratings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: public_room_states; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.public_room_states (
    room_id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    data json NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.public_room_states OWNER TO supabase_admin;

--
-- Name: TABLE public_room_states; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON TABLE public.public_room_states IS 'what game, timer, players can see this';


--
-- Name: COLUMN public_room_states.data; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON COLUMN public.public_room_states.data IS 'public state. use db functions to edit';


--
-- Name: queue; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.queue (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    room_id uuid,
    type text NOT NULL,
    data text
);


ALTER TABLE public.queue OWNER TO supabase_admin;

--
-- Name: TABLE queue; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON TABLE public.queue IS 'queue for ipc';


--
-- Name: COLUMN queue.data; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON COLUMN public.queue.data IS 'parameter';


--
-- Name: rooms; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.rooms (
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


ALTER TABLE public.rooms OWNER TO supabase_admin;

--
-- Name: COLUMN rooms.code; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON COLUMN public.rooms.code IS 'password protection';


--
-- Name: COLUMN rooms.secret_key; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON COLUMN public.rooms.secret_key IS 'realtime channel id';


--
-- Name: COLUMN rooms.is_ingame; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON COLUMN public.rooms.is_ingame IS 'lobby already active/closed';


--
-- Name: COLUMN rooms.max_size; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON COLUMN public.rooms.max_size IS 'max room size';


--
-- Name: COLUMN rooms.is_private; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON COLUMN public.rooms.is_private IS 'friends only';


--
-- Name: COLUMN rooms.share_code; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON COLUMN public.rooms.share_code IS 'shareable code to quick join room';


--
-- Name: sets; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.sets (
    id bigint NOT NULL,
    name text NOT NULL,
    type smallint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    project_id bigint NOT NULL
);


ALTER TABLE public.sets OWNER TO supabase_admin;

--
-- Name: TABLE sets; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON TABLE public.sets IS 'flashcard or exercise sets';


--
-- Name: sets_id_seq; Type: SEQUENCE; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.sets ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.sets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: tracker; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.tracker (
    key text NOT NULL,
    last_updated timestamp with time zone
);

ALTER TABLE ONLY public.tracker REPLICA IDENTITY FULL;


ALTER TABLE public.tracker OWNER TO supabase_admin;

--
-- Name: user_achievements; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.user_achievements (
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    achievement_id bigint NOT NULL,
    user_id uuid NOT NULL
);


ALTER TABLE public.user_achievements OWNER TO supabase_admin;

--
-- Name: TABLE user_achievements; Type: COMMENT; Schema: public; Owner: supabase_admin
--

COMMENT ON TABLE public.user_achievements IS 'All the achievements the user has got.';


--
-- Name: user_learning_projects; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.user_learning_projects (
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    learning_project_id bigint NOT NULL,
    user_id uuid NOT NULL,
    stats jsonb DEFAULT '{"winsQuiz": 0, "scoreQuiz": 0, "timeSpentQuiz": 0, "winsFlashcards": 0, "scoreFlashcards": 0, "timeSpentFlashcards": 0, "timeSpentWhiteboard": 0}'::jsonb
);


ALTER TABLE public.user_learning_projects OWNER TO supabase_admin;

--
-- Name: user_rank; Type: TABLE; Schema: public; Owner: supabase_admin
--

CREATE TABLE public.user_rank (
    ranking integer
);


ALTER TABLE public.user_rank OWNER TO supabase_admin;

--
-- Name: achievements achievements_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.achievements
    ADD CONSTRAINT achievements_pkey PRIMARY KEY (id);


--
-- Name: answers_exercises answers_exercises_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.answers_exercises
    ADD CONSTRAINT answers_exercises_pkey PRIMARY KEY (exercise, order_position);


--
-- Name: exercises exercises_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.exercises
    ADD CONSTRAINT exercises_pkey PRIMARY KEY (id);


--
-- Name: friends friends_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.friends
    ADD CONSTRAINT friends_pkey PRIMARY KEY (user_from_id, user_to_id);


--
-- Name: learning_projects learning_projects_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.learning_projects
    ADD CONSTRAINT learning_projects_pkey PRIMARY KEY (id);


--
-- Name: flashcards lp_flashcards_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.flashcards
    ADD CONSTRAINT lp_flashcards_pkey PRIMARY KEY (id);


--
-- Name: links lp_links_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.links
    ADD CONSTRAINT lp_links_pkey PRIMARY KEY (id);


--
-- Name: player_answers player_answers_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.player_answers
    ADD CONSTRAINT player_answers_pkey PRIMARY KEY (room_id, user_id, round);


--
-- Name: private_room_states private_room_states_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.private_room_states
    ADD CONSTRAINT private_room_states_pkey PRIMARY KEY (room_id);


--
-- Name: profiles profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_pkey PRIMARY KEY (id);


--
-- Name: profiles profiles_username_key; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_username_key UNIQUE (username);


--
-- Name: project_ratings project_ratings_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.project_ratings
    ADD CONSTRAINT project_ratings_pkey PRIMARY KEY (project_id, user_id);


--
-- Name: queue queue_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.queue
    ADD CONSTRAINT queue_pkey PRIMARY KEY (id);


--
-- Name: public_room_states room_states_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.public_room_states
    ADD CONSTRAINT room_states_pkey PRIMARY KEY (room_id);


--
-- Name: rooms rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_pkey PRIMARY KEY (id);


--
-- Name: rooms rooms_share_code_key; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_share_code_key UNIQUE (share_code);


--
-- Name: sets sets_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.sets
    ADD CONSTRAINT sets_pkey PRIMARY KEY (id);


--
-- Name: tracker tracker_key_key; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.tracker
    ADD CONSTRAINT tracker_key_key UNIQUE (key);


--
-- Name: tracker tracker_pk; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.tracker
    ADD CONSTRAINT tracker_pk PRIMARY KEY (key);


--
-- Name: user_achievements unique_user_achievement; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.user_achievements
    ADD CONSTRAINT unique_user_achievement UNIQUE (user_id, achievement_id);


--
-- Name: user_achievements user_achievements_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.user_achievements
    ADD CONSTRAINT user_achievements_pkey PRIMARY KEY (achievement_id, user_id);


--
-- Name: user_learning_projects user_learning_projects_pkey; Type: CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.user_learning_projects
    ADD CONSTRAINT user_learning_projects_pkey PRIMARY KEY (learning_project_id, user_id);


--
-- Name: answers_exercises_exercise_idx; Type: INDEX; Schema: public; Owner: supabase_admin
--

CREATE INDEX answers_exercises_exercise_idx ON public.answers_exercises USING btree (exercise);


--
-- Name: btree_socket_room_id_idx; Type: INDEX; Schema: public; Owner: supabase_admin
--

CREATE INDEX btree_socket_room_id_idx ON public.rooms USING btree (id);


--
-- Name: exercises_set_id_idx; Type: INDEX; Schema: public; Owner: supabase_admin
--

CREATE INDEX exercises_set_id_idx ON public.exercises USING btree (set_id);


--
-- Name: flashcards_set_id_idx; Type: INDEX; Schema: public; Owner: supabase_admin
--

CREATE INDEX flashcards_set_id_idx ON public.flashcards USING btree (set_id);


--
-- Name: learning_projects_owner_id_idx; Type: INDEX; Schema: public; Owner: supabase_admin
--

CREATE INDEX learning_projects_owner_id_idx ON public.learning_projects USING btree (owner_id);


--
-- Name: profiles_username_case_insensitive_key; Type: INDEX; Schema: public; Owner: supabase_admin
--

CREATE UNIQUE INDEX profiles_username_case_insensitive_key ON public.profiles USING btree (upper(username));


--
-- Name: rooms_secret_key_idx; Type: INDEX; Schema: public; Owner: supabase_admin
--

CREATE INDEX rooms_secret_key_idx ON public.rooms USING btree (secret_key);


--
-- Name: learning_projects addProjectOnCreate; Type: TRIGGER; Schema: public; Owner: supabase_admin
--

CREATE TRIGGER "addProjectOnCreate" AFTER INSERT ON public.learning_projects FOR EACH ROW EXECUTE FUNCTION public."addProjectOnCreate"();


--
-- Name: profiles guard_profiles_trigger; Type: TRIGGER; Schema: public; Owner: supabase_admin
--

CREATE TRIGGER guard_profiles_trigger BEFORE INSERT OR DELETE OR UPDATE ON public.profiles FOR EACH ROW EXECUTE FUNCTION public.guard_profiles();


--
-- Name: rooms upd_rooms_tracker; Type: TRIGGER; Schema: public; Owner: supabase_admin
--

CREATE TRIGGER upd_rooms_tracker AFTER INSERT OR DELETE OR UPDATE ON public.rooms FOR EACH STATEMENT EXECUTE FUNCTION public.update_last_updated();


--
-- Name: profiles upd_rooms_tracker_joined; Type: TRIGGER; Schema: public; Owner: supabase_admin
--

CREATE TRIGGER upd_rooms_tracker_joined AFTER DELETE OR UPDATE ON public.profiles FOR EACH STATEMENT EXECUTE FUNCTION public.update_last_updated();


--
-- Name: learning_projects updateLearningProjectsGuard; Type: TRIGGER; Schema: public; Owner: supabase_admin
--

CREATE TRIGGER "updateLearningProjectsGuard" BEFORE UPDATE ON public.learning_projects FOR EACH ROW EXECUTE FUNCTION public.guard_learning_projects();


--
-- Name: project_ratings update_ratings_trigger; Type: TRIGGER; Schema: public; Owner: supabase_admin
--

CREATE TRIGGER update_ratings_trigger AFTER INSERT OR DELETE OR UPDATE ON public.project_ratings FOR EACH STATEMENT EXECUTE FUNCTION public.update_statistics();


--
-- Name: answers_exercises answers_exercises_exercise_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.answers_exercises
    ADD CONSTRAINT answers_exercises_exercise_fkey FOREIGN KEY (exercise) REFERENCES public.exercises(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: exercises exercises_set_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.exercises
    ADD CONSTRAINT exercises_set_id_fkey FOREIGN KEY (set_id) REFERENCES public.sets(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: flashcards flashcards_set_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.flashcards
    ADD CONSTRAINT flashcards_set_id_fkey FOREIGN KEY (set_id) REFERENCES public.sets(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: friends friends_user_from_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.friends
    ADD CONSTRAINT friends_user_from_id_fkey FOREIGN KEY (user_from_id) REFERENCES auth.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: friends friends_user_to_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.friends
    ADD CONSTRAINT friends_user_to_id_fkey FOREIGN KEY (user_to_id) REFERENCES auth.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: learning_projects learning_projects_owner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.learning_projects
    ADD CONSTRAINT learning_projects_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES auth.users(id);


--
-- Name: links links_learning_project_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.links
    ADD CONSTRAINT links_learning_project_fkey FOREIGN KEY (learning_project) REFERENCES public.learning_projects(id);


--
-- Name: player_answers player_answers_room_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.player_answers
    ADD CONSTRAINT player_answers_room_id_fkey FOREIGN KEY (room_id) REFERENCES public.rooms(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: player_answers player_answers_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.player_answers
    ADD CONSTRAINT player_answers_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: private_room_states private_room_states_room_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.private_room_states
    ADD CONSTRAINT private_room_states_room_id_fkey FOREIGN KEY (room_id) REFERENCES public.rooms(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: profiles profiles_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_id_fkey FOREIGN KEY (id) REFERENCES auth.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: profiles profiles_room_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_room_id_fkey FOREIGN KEY (room_id) REFERENCES public.rooms(id);


--
-- Name: project_ratings project_ratings_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.project_ratings
    ADD CONSTRAINT project_ratings_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.learning_projects(id);


--
-- Name: project_ratings project_ratings_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.project_ratings
    ADD CONSTRAINT project_ratings_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id);


--
-- Name: public_room_states public_room_states_room_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.public_room_states
    ADD CONSTRAINT public_room_states_room_id_fkey FOREIGN KEY (room_id) REFERENCES public.rooms(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: queue queue_room_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.queue
    ADD CONSTRAINT queue_room_id_fkey FOREIGN KEY (room_id) REFERENCES public.rooms(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: rooms rooms_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.learning_projects(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: sets sets_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.sets
    ADD CONSTRAINT sets_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.learning_projects(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user_achievements user_achievements_achievement_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.user_achievements
    ADD CONSTRAINT user_achievements_achievement_id_fkey FOREIGN KEY (achievement_id) REFERENCES public.achievements(id);


--
-- Name: user_achievements user_achievements_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.user_achievements
    ADD CONSTRAINT user_achievements_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user_learning_projects user_learning_projects_learning_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.user_learning_projects
    ADD CONSTRAINT user_learning_projects_learning_project_id_fkey FOREIGN KEY (learning_project_id) REFERENCES public.learning_projects(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user_learning_projects user_learning_projects_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: supabase_admin
--

ALTER TABLE ONLY public.user_learning_projects
    ADD CONSTRAINT user_learning_projects_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: learning_projects Allows owner to delete the project; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "Allows owner to delete the project" ON public.learning_projects FOR DELETE TO authenticated USING ((auth.uid() = owner_id));


--
-- Name: answers_exercises Enable access for all project members; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "Enable access for all project members" ON public.answers_exercises TO authenticated USING (( SELECT (EXISTS ( SELECT 1
           FROM public.exercises
          WHERE (answers_exercises.exercise = exercises.id))) AS "exists")) WITH CHECK (( SELECT (EXISTS ( SELECT 1
           FROM public.exercises
          WHERE (answers_exercises.exercise = exercises.id))) AS "exists"));


--
-- Name: exercises Enable access for project members; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "Enable access for project members" ON public.exercises TO authenticated USING (( SELECT (EXISTS ( SELECT 1
           FROM public.sets s
          WHERE (s.id = exercises.set_id))) AS "exists")) WITH CHECK (( SELECT (EXISTS ( SELECT 1
           FROM public.sets s
          WHERE (s.id = exercises.set_id))) AS "exists"));


--
-- Name: links Enable access for project members; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "Enable access for project members" ON public.links TO authenticated USING (( SELECT (EXISTS ( SELECT 1
           FROM public.learning_projects lps
          WHERE (lps.id = links.learning_project))) AS "exists")) WITH CHECK (( SELECT (EXISTS ( SELECT 1
           FROM public.learning_projects lps
          WHERE (lps.id = links.learning_project))) AS "exists"));


--
-- Name: project_ratings Enable access to authenticated users; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "Enable access to authenticated users" ON public.project_ratings TO authenticated USING ((user_id = auth.uid())) WITH CHECK ((user_id = auth.uid()));


--
-- Name: flashcards Enable access to project members; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "Enable access to project members" ON public.flashcards TO authenticated USING (( SELECT (EXISTS ( SELECT 1
           FROM public.sets s
          WHERE (s.id = flashcards.set_id))) AS "exists")) WITH CHECK (( SELECT (EXISTS ( SELECT 1
           FROM public.sets s
          WHERE (s.id = flashcards.set_id))) AS "exists"));


--
-- Name: sets Enable delete for users; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "Enable delete for users" ON public.sets FOR DELETE TO authenticated USING (( SELECT (EXISTS ( SELECT 1
           FROM public.user_learning_projects ulp
          WHERE ((ulp.learning_project_id = sets.project_id) AND (auth.uid() = ulp.user_id)))) AS "exists"));


--
-- Name: sets Enable insert ; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "Enable insert " ON public.sets FOR INSERT TO authenticated WITH CHECK (( SELECT (EXISTS ( SELECT 1
           FROM public.user_learning_projects ulp
          WHERE ((ulp.learning_project_id = sets.project_id) AND (auth.uid() = ulp.user_id)))) AS "exists"));


--
-- Name: learning_projects Enable insert for authenticated users only; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "Enable insert for authenticated users only" ON public.learning_projects FOR INSERT TO authenticated WITH CHECK ((auth.uid() = owner_id));


--
-- Name: achievements Enable read access for all users; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "Enable read access for all users" ON public.achievements FOR SELECT TO authenticated USING (true);


--
-- Name: public_room_states Enable read access for all users; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "Enable read access for all users" ON public.public_room_states FOR SELECT TO authenticated USING (true);


--
-- Name: tracker Enable read access for all users; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "Enable read access for all users" ON public.tracker FOR SELECT TO authenticated USING (true);


--
-- Name: user_achievements Enable read access for all users; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "Enable read access for all users" ON public.user_achievements FOR INSERT TO authenticated WITH CHECK ((user_id = auth.uid()));


--
-- Name: user_achievements Enable read access for all users!; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "Enable read access for all users!" ON public.user_achievements FOR UPDATE TO authenticated USING ((user_id = auth.uid())) WITH CHECK ((user_id = auth.uid()));


--
-- Name: learning_projects Enable read access for owners and members of project; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "Enable read access for owners and members of project" ON public.learning_projects FOR SELECT TO authenticated USING (((auth.uid() = owner_id) OR ( SELECT (EXISTS ( SELECT 1
           FROM public.user_learning_projects up
          WHERE ((up.learning_project_id = learning_projects.id) AND (up.user_id = auth.uid())))) AS "exists")));


--
-- Name: sets Enable read access for project members; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "Enable read access for project members" ON public.sets FOR SELECT TO authenticated USING (( SELECT (EXISTS ( SELECT 1
           FROM public.user_learning_projects ulp
          WHERE ((ulp.learning_project_id = sets.project_id) AND (auth.uid() = ulp.user_id)))) AS "exists"));


--
-- Name: sets Enable update ; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "Enable update " ON public.sets FOR UPDATE TO authenticated USING (( SELECT (EXISTS ( SELECT 1
           FROM public.user_learning_projects ulp
          WHERE ((ulp.learning_project_id = sets.project_id) AND (auth.uid() = ulp.user_id)))) AS "exists")) WITH CHECK (( SELECT (EXISTS ( SELECT 1
           FROM public.user_learning_projects ulp
          WHERE ((ulp.learning_project_id = sets.project_id) AND (auth.uid() = ulp.user_id)))) AS "exists"));


--
-- Name: friends Enable user to delete received and sent friend requests ; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "Enable user to delete received and sent friend requests " ON public.friends FOR DELETE TO authenticated USING (((user_to_id = auth.uid()) OR (user_from_id = auth.uid())));


--
-- Name: friends Enable users to insert their own friend requests; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "Enable users to insert their own friend requests" ON public.friends FOR INSERT TO authenticated WITH CHECK (((user_from_id = auth.uid()) AND (NOT (user_from_id = user_to_id))));


--
-- Name: friends Enable users to update their own friend requests; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "Enable users to update their own friend requests" ON public.friends FOR UPDATE TO authenticated USING (((user_from_id = auth.uid()) AND (NOT (user_from_id = user_to_id)))) WITH CHECK (((user_from_id = auth.uid()) AND (NOT (user_from_id = user_to_id))));


--
-- Name: user_achievements Users can see their own achievements; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "Users can see their own achievements" ON public.user_achievements FOR SELECT TO authenticated USING ((auth.uid() = user_id));


--
-- Name: achievements; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.achievements ENABLE ROW LEVEL SECURITY;

--
-- Name: learning_projects allow update if user owns project; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "allow update if user owns project" ON public.learning_projects FOR UPDATE TO authenticated USING ((auth.uid() = owner_id)) WITH CHECK ((auth.uid() = owner_id));


--
-- Name: answers_exercises; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.answers_exercises ENABLE ROW LEVEL SECURITY;

--
-- Name: exercises; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.exercises ENABLE ROW LEVEL SECURITY;

--
-- Name: flashcards; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.flashcards ENABLE ROW LEVEL SECURITY;

--
-- Name: friends; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.friends ENABLE ROW LEVEL SECURITY;

--
-- Name: learning_projects; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.learning_projects ENABLE ROW LEVEL SECURITY;

--
-- Name: links; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.links ENABLE ROW LEVEL SECURITY;

--
-- Name: friends outgoing and incoming friend request can be read; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "outgoing and incoming friend request can be read" ON public.friends FOR SELECT TO authenticated USING (((user_to_id = auth.uid()) OR (user_from_id = auth.uid())));


--
-- Name: player_answers; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.player_answers ENABLE ROW LEVEL SECURITY;

--
-- Name: private_room_states; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.private_room_states ENABLE ROW LEVEL SECURITY;

--
-- Name: profiles; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;

--
-- Name: project_ratings; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.project_ratings ENABLE ROW LEVEL SECURITY;

--
-- Name: public_room_states; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.public_room_states ENABLE ROW LEVEL SECURITY;

--
-- Name: queue; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.queue ENABLE ROW LEVEL SECURITY;

--
-- Name: rooms; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.rooms ENABLE ROW LEVEL SECURITY;

--
-- Name: sets; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.sets ENABLE ROW LEVEL SECURITY;

--
-- Name: tracker; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.tracker ENABLE ROW LEVEL SECURITY;

--
-- Name: user_learning_projects user can leave projects; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "user can leave projects" ON public.user_learning_projects FOR DELETE TO authenticated USING ((auth.uid() = user_id));


--
-- Name: user_learning_projects user can see their own joined projects; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "user can see their own joined projects" ON public.user_learning_projects FOR SELECT TO authenticated USING ((auth.uid() = user_id));


--
-- Name: user_achievements; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.user_achievements ENABLE ROW LEVEL SECURITY;

--
-- Name: user_learning_projects; Type: ROW SECURITY; Schema: public; Owner: supabase_admin
--

ALTER TABLE public.user_learning_projects ENABLE ROW LEVEL SECURITY;

--
-- Name: profiles users can update their own profile; Type: POLICY; Schema: public; Owner: supabase_admin
--

CREATE POLICY "users can update their own profile" ON public.profiles TO authenticated USING ((auth.uid() = id)) WITH CHECK ((auth.uid() = id));


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT USAGE ON SCHEMA public TO postgres;
GRANT USAGE ON SCHEMA public TO anon;
GRANT USAGE ON SCHEMA public TO authenticated;
GRANT USAGE ON SCHEMA public TO service_role;


--
-- Name: FUNCTION "addProjectOnCreate"(); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public."addProjectOnCreate"() TO postgres;
GRANT ALL ON FUNCTION public."addProjectOnCreate"() TO authenticated;
GRANT ALL ON FUNCTION public."addProjectOnCreate"() TO service_role;


--
-- Name: FUNCTION avg_project_rating(project_id_param bigint); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.avg_project_rating(project_id_param bigint) TO postgres;
GRANT ALL ON FUNCTION public.avg_project_rating(project_id_param bigint) TO authenticated;
GRANT ALL ON FUNCTION public.avg_project_rating(project_id_param bigint) TO service_role;


--
-- Name: FUNCTION bullshit_list_room_members(); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.bullshit_list_room_members() TO postgres;
GRANT ALL ON FUNCTION public.bullshit_list_room_members() TO anon;
GRANT ALL ON FUNCTION public.bullshit_list_room_members() TO authenticated;
GRANT ALL ON FUNCTION public.bullshit_list_room_members() TO service_role;


--
-- Name: FUNCTION cleanup_rooms(); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.cleanup_rooms() TO postgres;
GRANT ALL ON FUNCTION public.cleanup_rooms() TO authenticated;
GRANT ALL ON FUNCTION public.cleanup_rooms() TO service_role;


--
-- Name: FUNCTION create_room(p_project_id bigint, p_code integer, p_name text, p_share_code integer, p_size integer, p_private boolean); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.create_room(p_project_id bigint, p_code integer, p_name text, p_share_code integer, p_size integer, p_private boolean) TO postgres;
GRANT ALL ON FUNCTION public.create_room(p_project_id bigint, p_code integer, p_name text, p_share_code integer, p_size integer, p_private boolean) TO anon;
GRANT ALL ON FUNCTION public.create_room(p_project_id bigint, p_code integer, p_name text, p_share_code integer, p_size integer, p_private boolean) TO authenticated;
GRANT ALL ON FUNCTION public.create_room(p_project_id bigint, p_code integer, p_name text, p_share_code integer, p_size integer, p_private boolean) TO service_role;


--
-- Name: FUNCTION delete_answers_exercise(answers public.answer_type[]); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.delete_answers_exercise(answers public.answer_type[]) TO postgres;
GRANT ALL ON FUNCTION public.delete_answers_exercise(answers public.answer_type[]) TO authenticated;
GRANT ALL ON FUNCTION public.delete_answers_exercise(answers public.answer_type[]) TO service_role;


--
-- Name: FUNCTION delete_friend(p_other_userid uuid); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.delete_friend(p_other_userid uuid) TO postgres;
GRANT ALL ON FUNCTION public.delete_friend(p_other_userid uuid) TO authenticated;
GRANT ALL ON FUNCTION public.delete_friend(p_other_userid uuid) TO service_role;


--
-- Name: FUNCTION exercise_count(p_project_id bigint); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.exercise_count(p_project_id bigint) TO postgres;
GRANT ALL ON FUNCTION public.exercise_count(p_project_id bigint) TO anon;
GRANT ALL ON FUNCTION public.exercise_count(p_project_id bigint) TO authenticated;
GRANT ALL ON FUNCTION public.exercise_count(p_project_id bigint) TO service_role;


--
-- Name: FUNCTION flashcard_count(p_project_id bigint); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.flashcard_count(p_project_id bigint) TO postgres;
GRANT ALL ON FUNCTION public.flashcard_count(p_project_id bigint) TO anon;
GRANT ALL ON FUNCTION public.flashcard_count(p_project_id bigint) TO authenticated;
GRANT ALL ON FUNCTION public.flashcard_count(p_project_id bigint) TO service_role;


--
-- Name: FUNCTION "getUsername"(user_id uuid); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public."getUsername"(user_id uuid) TO postgres;
GRANT ALL ON FUNCTION public."getUsername"(user_id uuid) TO authenticated;
GRANT ALL ON FUNCTION public."getUsername"(user_id uuid) TO service_role;


--
-- Name: FUNCTION get_distinct_project_groups(); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.get_distinct_project_groups() TO postgres;
GRANT ALL ON FUNCTION public.get_distinct_project_groups() TO anon;
GRANT ALL ON FUNCTION public.get_distinct_project_groups() TO authenticated;
GRANT ALL ON FUNCTION public.get_distinct_project_groups() TO service_role;


--
-- Name: FUNCTION get_particular_amount_ratings(project_id_param bigint); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.get_particular_amount_ratings(project_id_param bigint) TO postgres;
GRANT ALL ON FUNCTION public.get_particular_amount_ratings(project_id_param bigint) TO anon;
GRANT ALL ON FUNCTION public.get_particular_amount_ratings(project_id_param bigint) TO authenticated;
GRANT ALL ON FUNCTION public.get_particular_amount_ratings(project_id_param bigint) TO service_role;


--
-- Name: FUNCTION get_published_learning_projects_with_avg_rating(); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.get_published_learning_projects_with_avg_rating() TO postgres;
GRANT ALL ON FUNCTION public.get_published_learning_projects_with_avg_rating() TO anon;
GRANT ALL ON FUNCTION public.get_published_learning_projects_with_avg_rating() TO authenticated;
GRANT ALL ON FUNCTION public.get_published_learning_projects_with_avg_rating() TO service_role;


--
-- Name: FUNCTION get_user_global_rank(project_id_param bigint, user_id_param uuid); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.get_user_global_rank(project_id_param bigint, user_id_param uuid) TO postgres;
GRANT ALL ON FUNCTION public.get_user_global_rank(project_id_param bigint, user_id_param uuid) TO anon;
GRANT ALL ON FUNCTION public.get_user_global_rank(project_id_param bigint, user_id_param uuid) TO authenticated;
GRANT ALL ON FUNCTION public.get_user_global_rank(project_id_param bigint, user_id_param uuid) TO service_role;


--
-- Name: FUNCTION get_user_global_rank_data(project_id_param bigint, user_id_param uuid); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.get_user_global_rank_data(project_id_param bigint, user_id_param uuid) TO postgres;
GRANT ALL ON FUNCTION public.get_user_global_rank_data(project_id_param bigint, user_id_param uuid) TO anon;
GRANT ALL ON FUNCTION public.get_user_global_rank_data(project_id_param bigint, user_id_param uuid) TO authenticated;
GRANT ALL ON FUNCTION public.get_user_global_rank_data(project_id_param bigint, user_id_param uuid) TO service_role;


--
-- Name: FUNCTION get_user_rank_and_id(user_id_param uuid, project_id_param bigint); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.get_user_rank_and_id(user_id_param uuid, project_id_param bigint) TO postgres;
GRANT ALL ON FUNCTION public.get_user_rank_and_id(user_id_param uuid, project_id_param bigint) TO anon;
GRANT ALL ON FUNCTION public.get_user_rank_and_id(user_id_param uuid, project_id_param bigint) TO authenticated;
GRANT ALL ON FUNCTION public.get_user_rank_and_id(user_id_param uuid, project_id_param bigint) TO service_role;


--
-- Name: FUNCTION get_usernames(user_ids uuid[]); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.get_usernames(user_ids uuid[]) TO postgres;
GRANT ALL ON FUNCTION public.get_usernames(user_ids uuid[]) TO authenticated;
GRANT ALL ON FUNCTION public.get_usernames(user_ids uuid[]) TO service_role;


--
-- Name: FUNCTION get_users_rating_for_project(project_id_param bigint, user_id_param uuid); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.get_users_rating_for_project(project_id_param bigint, user_id_param uuid) TO postgres;
GRANT ALL ON FUNCTION public.get_users_rating_for_project(project_id_param bigint, user_id_param uuid) TO authenticated;
GRANT ALL ON FUNCTION public.get_users_rating_for_project(project_id_param bigint, user_id_param uuid) TO service_role;


--
-- Name: FUNCTION guard_learning_projects(); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.guard_learning_projects() TO postgres;
GRANT ALL ON FUNCTION public.guard_learning_projects() TO anon;
GRANT ALL ON FUNCTION public.guard_learning_projects() TO authenticated;
GRANT ALL ON FUNCTION public.guard_learning_projects() TO service_role;


--
-- Name: FUNCTION guard_profiles(); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.guard_profiles() TO postgres;
GRANT ALL ON FUNCTION public.guard_profiles() TO anon;
GRANT ALL ON FUNCTION public.guard_profiles() TO authenticated;
GRANT ALL ON FUNCTION public.guard_profiles() TO service_role;


--
-- Name: FUNCTION handle_new_user(); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.handle_new_user() TO postgres;
GRANT ALL ON FUNCTION public.handle_new_user() TO anon;
GRANT ALL ON FUNCTION public.handle_new_user() TO authenticated;
GRANT ALL ON FUNCTION public.handle_new_user() TO service_role;


--
-- Name: FUNCTION invite_user_to_project(p_project_id bigint, p_other_user_id uuid); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.invite_user_to_project(p_project_id bigint, p_other_user_id uuid) TO postgres;
GRANT ALL ON FUNCTION public.invite_user_to_project(p_project_id bigint, p_other_user_id uuid) TO anon;
GRANT ALL ON FUNCTION public.invite_user_to_project(p_project_id bigint, p_other_user_id uuid) TO authenticated;
GRANT ALL ON FUNCTION public.invite_user_to_project(p_project_id bigint, p_other_user_id uuid) TO service_role;


--
-- Name: FUNCTION join_room(p_room_id uuid, p_room_code bigint); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.join_room(p_room_id uuid, p_room_code bigint) TO postgres;
GRANT ALL ON FUNCTION public.join_room(p_room_id uuid, p_room_code bigint) TO authenticated;
GRANT ALL ON FUNCTION public.join_room(p_room_id uuid, p_room_code bigint) TO service_role;


--
-- Name: FUNCTION leave_room(); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.leave_room() TO postgres;
GRANT ALL ON FUNCTION public.leave_room() TO authenticated;
GRANT ALL ON FUNCTION public.leave_room() TO service_role;


--
-- Name: FUNCTION link_count(p_project_id bigint); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.link_count(p_project_id bigint) TO postgres;
GRANT ALL ON FUNCTION public.link_count(p_project_id bigint) TO anon;
GRANT ALL ON FUNCTION public.link_count(p_project_id bigint) TO authenticated;
GRANT ALL ON FUNCTION public.link_count(p_project_id bigint) TO service_role;


--
-- Name: TABLE friends; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.friends TO postgres;
GRANT ALL ON TABLE public.friends TO anon;
GRANT ALL ON TABLE public.friends TO authenticated;
GRANT ALL ON TABLE public.friends TO service_role;


--
-- Name: FUNCTION list_friends(); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.list_friends() TO postgres;
GRANT ALL ON FUNCTION public.list_friends() TO authenticated;
GRANT ALL ON FUNCTION public.list_friends() TO service_role;


--
-- Name: FUNCTION list_friends_ids_and_names(); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.list_friends_ids_and_names() TO postgres;
GRANT ALL ON FUNCTION public.list_friends_ids_and_names() TO anon;
GRANT ALL ON FUNCTION public.list_friends_ids_and_names() TO authenticated;
GRANT ALL ON FUNCTION public.list_friends_ids_and_names() TO service_role;


--
-- Name: FUNCTION list_room_members(); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.list_room_members() TO postgres;
GRANT ALL ON FUNCTION public.list_room_members() TO authenticated;
GRANT ALL ON FUNCTION public.list_room_members() TO service_role;


--
-- Name: FUNCTION list_rooms(); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.list_rooms() TO postgres;
GRANT ALL ON FUNCTION public.list_rooms() TO authenticated;
GRANT ALL ON FUNCTION public.list_rooms() TO service_role;


--
-- Name: FUNCTION list_sets(); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.list_sets() TO postgres;
GRANT ALL ON FUNCTION public.list_sets() TO anon;
GRANT ALL ON FUNCTION public.list_sets() TO authenticated;
GRANT ALL ON FUNCTION public.list_sets() TO service_role;


--
-- Name: FUNCTION project_members(p_project_id bigint); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.project_members(p_project_id bigint) TO postgres;
GRANT ALL ON FUNCTION public.project_members(p_project_id bigint) TO anon;
GRANT ALL ON FUNCTION public.project_members(p_project_id bigint) TO authenticated;
GRANT ALL ON FUNCTION public.project_members(p_project_id bigint) TO service_role;


--
-- Name: TABLE learning_projects; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.learning_projects TO postgres;
GRANT ALL ON TABLE public.learning_projects TO anon;
GRANT ALL ON TABLE public.learning_projects TO authenticated;
GRANT ALL ON TABLE public.learning_projects TO service_role;


--
-- Name: FUNCTION public_projects(); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.public_projects() TO postgres;
GRANT ALL ON FUNCTION public.public_projects() TO anon;
GRANT ALL ON FUNCTION public.public_projects() TO authenticated;
GRANT ALL ON FUNCTION public.public_projects() TO service_role;


--
-- Name: FUNCTION quick_join_room(p_share_code bigint); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.quick_join_room(p_share_code bigint) TO postgres;
GRANT ALL ON FUNCTION public.quick_join_room(p_share_code bigint) TO authenticated;
GRANT ALL ON FUNCTION public.quick_join_room(p_share_code bigint) TO service_role;


--
-- Name: FUNCTION remove_user_from_project(p_project_id bigint, p_other_user_id uuid); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.remove_user_from_project(p_project_id bigint, p_other_user_id uuid) TO postgres;
GRANT ALL ON FUNCTION public.remove_user_from_project(p_project_id bigint, p_other_user_id uuid) TO anon;
GRANT ALL ON FUNCTION public.remove_user_from_project(p_project_id bigint, p_other_user_id uuid) TO authenticated;
GRANT ALL ON FUNCTION public.remove_user_from_project(p_project_id bigint, p_other_user_id uuid) TO service_role;


--
-- Name: FUNCTION search_user(search_query text); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.search_user(search_query text) TO postgres;
GRANT ALL ON FUNCTION public.search_user(search_query text) TO authenticated;
GRANT ALL ON FUNCTION public.search_user(search_query text) TO service_role;


--
-- Name: FUNCTION sum_project_ratings(project_id_param bigint); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.sum_project_ratings(project_id_param bigint) TO postgres;
GRANT ALL ON FUNCTION public.sum_project_ratings(project_id_param bigint) TO anon;
GRANT ALL ON FUNCTION public.sum_project_ratings(project_id_param bigint) TO authenticated;
GRANT ALL ON FUNCTION public.sum_project_ratings(project_id_param bigint) TO service_role;


--
-- Name: FUNCTION switch_locked_room(); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.switch_locked_room() TO postgres;
GRANT ALL ON FUNCTION public.switch_locked_room() TO anon;
GRANT ALL ON FUNCTION public.switch_locked_room() TO authenticated;
GRANT ALL ON FUNCTION public.switch_locked_room() TO service_role;


--
-- Name: FUNCTION track(p_key text); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.track(p_key text) TO postgres;
GRANT ALL ON FUNCTION public.track(p_key text) TO authenticated;
GRANT ALL ON FUNCTION public.track(p_key text) TO service_role;


--
-- Name: FUNCTION transfer_project(p_owner_name text, p_project_id bigint); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.transfer_project(p_owner_name text, p_project_id bigint) TO postgres;
GRANT ALL ON FUNCTION public.transfer_project(p_owner_name text, p_project_id bigint) TO authenticated;
GRANT ALL ON FUNCTION public.transfer_project(p_owner_name text, p_project_id bigint) TO service_role;


--
-- Name: FUNCTION update_last_updated(); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.update_last_updated() TO postgres;
GRANT ALL ON FUNCTION public.update_last_updated() TO authenticated;
GRANT ALL ON FUNCTION public.update_last_updated() TO service_role;


--
-- Name: FUNCTION update_statistics(); Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION public.update_statistics() TO postgres;
GRANT ALL ON FUNCTION public.update_statistics() TO anon;
GRANT ALL ON FUNCTION public.update_statistics() TO authenticated;
GRANT ALL ON FUNCTION public.update_statistics() TO service_role;


--
-- Name: TABLE achievements; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.achievements TO postgres;
GRANT ALL ON TABLE public.achievements TO anon;
GRANT ALL ON TABLE public.achievements TO authenticated;
GRANT ALL ON TABLE public.achievements TO service_role;


--
-- Name: SEQUENCE achievements_id_seq; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE public.achievements_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.achievements_id_seq TO anon;
GRANT ALL ON SEQUENCE public.achievements_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.achievements_id_seq TO service_role;


--
-- Name: TABLE answers_exercises; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.answers_exercises TO postgres;
GRANT ALL ON TABLE public.answers_exercises TO anon;
GRANT ALL ON TABLE public.answers_exercises TO authenticated;
GRANT ALL ON TABLE public.answers_exercises TO service_role;


--
-- Name: TABLE exercises; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.exercises TO postgres;
GRANT ALL ON TABLE public.exercises TO anon;
GRANT ALL ON TABLE public.exercises TO authenticated;
GRANT ALL ON TABLE public.exercises TO service_role;


--
-- Name: SEQUENCE exercises_id_seq; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE public.exercises_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.exercises_id_seq TO anon;
GRANT ALL ON SEQUENCE public.exercises_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.exercises_id_seq TO service_role;


--
-- Name: TABLE flashcards; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.flashcards TO postgres;
GRANT ALL ON TABLE public.flashcards TO anon;
GRANT ALL ON TABLE public.flashcards TO authenticated;
GRANT ALL ON TABLE public.flashcards TO service_role;


--
-- Name: SEQUENCE learning_projects_id_seq; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE public.learning_projects_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.learning_projects_id_seq TO anon;
GRANT ALL ON SEQUENCE public.learning_projects_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.learning_projects_id_seq TO service_role;


--
-- Name: TABLE links; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.links TO postgres;
GRANT ALL ON TABLE public.links TO anon;
GRANT ALL ON TABLE public.links TO authenticated;
GRANT ALL ON TABLE public.links TO service_role;


--
-- Name: SEQUENCE lp_flashcards_id_seq; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE public.lp_flashcards_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.lp_flashcards_id_seq TO anon;
GRANT ALL ON SEQUENCE public.lp_flashcards_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.lp_flashcards_id_seq TO service_role;


--
-- Name: SEQUENCE lp_links_id_seq; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE public.lp_links_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.lp_links_id_seq TO anon;
GRANT ALL ON SEQUENCE public.lp_links_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.lp_links_id_seq TO service_role;


--
-- Name: TABLE player_answers; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.player_answers TO postgres;
GRANT ALL ON TABLE public.player_answers TO anon;
GRANT ALL ON TABLE public.player_answers TO authenticated;
GRANT ALL ON TABLE public.player_answers TO service_role;


--
-- Name: TABLE private_room_states; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.private_room_states TO postgres;
GRANT ALL ON TABLE public.private_room_states TO anon;
GRANT ALL ON TABLE public.private_room_states TO authenticated;
GRANT ALL ON TABLE public.private_room_states TO service_role;


--
-- Name: TABLE profiles; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.profiles TO postgres;
GRANT ALL ON TABLE public.profiles TO anon;
GRANT ALL ON TABLE public.profiles TO authenticated;
GRANT ALL ON TABLE public.profiles TO service_role;


--
-- Name: TABLE project_ratings; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.project_ratings TO postgres;
GRANT ALL ON TABLE public.project_ratings TO anon;
GRANT ALL ON TABLE public.project_ratings TO authenticated;
GRANT ALL ON TABLE public.project_ratings TO service_role;


--
-- Name: SEQUENCE project_ratings_id_seq; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE public.project_ratings_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.project_ratings_id_seq TO anon;
GRANT ALL ON SEQUENCE public.project_ratings_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.project_ratings_id_seq TO service_role;


--
-- Name: TABLE public_room_states; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.public_room_states TO postgres;
GRANT ALL ON TABLE public.public_room_states TO anon;
GRANT ALL ON TABLE public.public_room_states TO authenticated;
GRANT ALL ON TABLE public.public_room_states TO service_role;


--
-- Name: TABLE queue; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.queue TO postgres;
GRANT ALL ON TABLE public.queue TO anon;
GRANT ALL ON TABLE public.queue TO authenticated;
GRANT ALL ON TABLE public.queue TO service_role;


--
-- Name: TABLE rooms; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.rooms TO postgres;
GRANT ALL ON TABLE public.rooms TO anon;
GRANT ALL ON TABLE public.rooms TO authenticated;
GRANT ALL ON TABLE public.rooms TO service_role;


--
-- Name: TABLE sets; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.sets TO postgres;
GRANT ALL ON TABLE public.sets TO anon;
GRANT ALL ON TABLE public.sets TO authenticated;
GRANT ALL ON TABLE public.sets TO service_role;


--
-- Name: SEQUENCE sets_id_seq; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON SEQUENCE public.sets_id_seq TO postgres;
GRANT ALL ON SEQUENCE public.sets_id_seq TO anon;
GRANT ALL ON SEQUENCE public.sets_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.sets_id_seq TO service_role;


--
-- Name: TABLE tracker; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.tracker TO postgres;
GRANT ALL ON TABLE public.tracker TO anon;
GRANT ALL ON TABLE public.tracker TO authenticated;
GRANT ALL ON TABLE public.tracker TO service_role;


--
-- Name: TABLE user_achievements; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.user_achievements TO postgres;
GRANT ALL ON TABLE public.user_achievements TO anon;
GRANT ALL ON TABLE public.user_achievements TO authenticated;
GRANT ALL ON TABLE public.user_achievements TO service_role;


--
-- Name: TABLE user_learning_projects; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.user_learning_projects TO postgres;
GRANT ALL ON TABLE public.user_learning_projects TO anon;
GRANT ALL ON TABLE public.user_learning_projects TO authenticated;
GRANT ALL ON TABLE public.user_learning_projects TO service_role;


--
-- Name: TABLE user_rank; Type: ACL; Schema: public; Owner: supabase_admin
--

GRANT ALL ON TABLE public.user_rank TO postgres;
GRANT ALL ON TABLE public.user_rank TO anon;
GRANT ALL ON TABLE public.user_rank TO authenticated;
GRANT ALL ON TABLE public.user_rank TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO service_role;


--
-- PostgreSQL database dump complete
--

