--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer,
    games_played integer,
    number_attempts_to_win integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name character varying(22)
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 2, 1, NULL);
INSERT INTO public.games VALUES (2, 1, 1, NULL);
INSERT INTO public.games VALUES (3, 3, 1, NULL);
INSERT INTO public.games VALUES (4, 3, 2, NULL);
INSERT INTO public.games VALUES (5, 4, 1, NULL);
INSERT INTO public.games VALUES (6, 4, 2, NULL);
INSERT INTO public.games VALUES (7, 5, 1, NULL);
INSERT INTO public.games VALUES (8, 6, 1, NULL);
INSERT INTO public.games VALUES (9, 7, 1, NULL);
INSERT INTO public.games VALUES (10, 7, NULL, 5);
INSERT INTO public.games VALUES (11, 8, 1, NULL);
INSERT INTO public.games VALUES (12, NULL, NULL, 5);
INSERT INTO public.games VALUES (13, 9, 1, NULL);
INSERT INTO public.games VALUES (14, 10, 1, NULL);
INSERT INTO public.games VALUES (15, 11, 1, 3);
INSERT INTO public.games VALUES (18, 13, 1, 410);
INSERT INTO public.games VALUES (19, 13, 2, 410);
INSERT INTO public.games VALUES (16, 12, 1, 776);
INSERT INTO public.games VALUES (17, 12, 2, 776);
INSERT INTO public.games VALUES (22, 15, 1, 388);
INSERT INTO public.games VALUES (23, 15, 2, 388);
INSERT INTO public.games VALUES (20, 14, 1, 44);
INSERT INTO public.games VALUES (21, 14, 2, 44);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'test_1');
INSERT INTO public.users VALUES (2, 'test1');
INSERT INTO public.users VALUES (3, 'user_1741899777903');
INSERT INTO public.users VALUES (4, 'user_1741899777902');
INSERT INTO public.users VALUES (5, 'test3');
INSERT INTO public.users VALUES (6, 'test4');
INSERT INTO public.users VALUES (7, 'test6');
INSERT INTO public.users VALUES (8, 'Gabys');
INSERT INTO public.users VALUES (9, 'PIRU');
INSERT INTO public.users VALUES (10, 'prueba');
INSERT INTO public.users VALUES (11, 'otra_prueba');
INSERT INTO public.users VALUES (12, 'user_1741901140068');
INSERT INTO public.users VALUES (13, 'user_1741901140067');
INSERT INTO public.users VALUES (14, 'user_1741901255703');
INSERT INTO public.users VALUES (15, 'user_1741901255702');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 23, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 15, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

