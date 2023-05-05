--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
    year integer NOT NULL,
    round character varying NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
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
-- Name: games_opponent_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_opponent_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_opponent_id_seq OWNER TO freecodecamp;

--
-- Name: games_opponent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_opponent_id_seq OWNED BY public.games.opponent_id;


--
-- Name: games_winner_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_winner_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_winner_id_seq OWNER TO freecodecamp;

--
-- Name: games_winner_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_winner_id_seq OWNED BY public.games.winner_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: games winner_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN winner_id SET DEFAULT nextval('public.games_winner_id_seq'::regclass);


--
-- Name: games opponent_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN opponent_id SET DEFAULT nextval('public.games_opponent_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (33, 2018, 'Final', 866, 867, 4, 2);
INSERT INTO public.games VALUES (34, 2018, 'Third Place', 868, 869, 2, 0);
INSERT INTO public.games VALUES (35, 2018, 'Semi-Final', 867, 869, 2, 1);
INSERT INTO public.games VALUES (36, 2018, 'Semi-Final', 866, 868, 1, 0);
INSERT INTO public.games VALUES (37, 2018, 'Quarter-Final', 867, 870, 3, 2);
INSERT INTO public.games VALUES (38, 2018, 'Quarter-Final', 869, 871, 2, 0);
INSERT INTO public.games VALUES (39, 2018, 'Quarter-Final', 868, 872, 2, 1);
INSERT INTO public.games VALUES (40, 2018, 'Quarter-Final', 866, 873, 2, 0);
INSERT INTO public.games VALUES (41, 2018, 'Eighth-Final', 869, 874, 2, 1);
INSERT INTO public.games VALUES (42, 2018, 'Eighth-Final', 871, 875, 1, 0);
INSERT INTO public.games VALUES (43, 2018, 'Eighth-Final', 868, 876, 3, 2);
INSERT INTO public.games VALUES (44, 2018, 'Eighth-Final', 872, 877, 2, 0);
INSERT INTO public.games VALUES (45, 2018, 'Eighth-Final', 867, 878, 2, 1);
INSERT INTO public.games VALUES (46, 2018, 'Eighth-Final', 870, 879, 2, 1);
INSERT INTO public.games VALUES (47, 2018, 'Eighth-Final', 873, 880, 2, 1);
INSERT INTO public.games VALUES (48, 2018, 'Eighth-Final', 866, 881, 4, 3);
INSERT INTO public.games VALUES (49, 2014, 'Final', 882, 881, 1, 0);
INSERT INTO public.games VALUES (50, 2014, 'Third Place', 883, 872, 3, 0);
INSERT INTO public.games VALUES (51, 2014, 'Semi-Final', 881, 883, 1, 0);
INSERT INTO public.games VALUES (52, 2014, 'Semi-Final', 882, 872, 7, 1);
INSERT INTO public.games VALUES (53, 2014, 'Quarter-Final', 883, 884, 1, 0);
INSERT INTO public.games VALUES (54, 2014, 'Quarter-Final', 881, 868, 1, 0);
INSERT INTO public.games VALUES (55, 2014, 'Quarter-Final', 872, 874, 2, 1);
INSERT INTO public.games VALUES (56, 2014, 'Quarter-Final', 882, 866, 1, 0);
INSERT INTO public.games VALUES (57, 2014, 'Eighth-Final', 872, 885, 2, 1);
INSERT INTO public.games VALUES (58, 2014, 'Eighth-Final', 874, 873, 2, 0);
INSERT INTO public.games VALUES (59, 2014, 'Eighth-Final', 866, 886, 2, 0);
INSERT INTO public.games VALUES (60, 2014, 'Eighth-Final', 882, 887, 2, 1);
INSERT INTO public.games VALUES (61, 2014, 'Eighth-Final', 883, 877, 2, 1);
INSERT INTO public.games VALUES (62, 2014, 'Eighth-Final', 884, 888, 2, 1);
INSERT INTO public.games VALUES (63, 2014, 'Eighth-Final', 881, 875, 1, 0);
INSERT INTO public.games VALUES (64, 2014, 'Eighth-Final', 868, 889, 2, 1);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (866, 'France');
INSERT INTO public.teams VALUES (867, 'Croatia');
INSERT INTO public.teams VALUES (868, 'Belgium');
INSERT INTO public.teams VALUES (869, 'England');
INSERT INTO public.teams VALUES (870, 'Russia');
INSERT INTO public.teams VALUES (871, 'Sweden');
INSERT INTO public.teams VALUES (872, 'Brazil');
INSERT INTO public.teams VALUES (873, 'Uruguay');
INSERT INTO public.teams VALUES (874, 'Colombia');
INSERT INTO public.teams VALUES (875, 'Switzerland');
INSERT INTO public.teams VALUES (876, 'Japan');
INSERT INTO public.teams VALUES (877, 'Mexico');
INSERT INTO public.teams VALUES (878, 'Denmark');
INSERT INTO public.teams VALUES (879, 'Spain');
INSERT INTO public.teams VALUES (880, 'Portugal');
INSERT INTO public.teams VALUES (881, 'Argentina');
INSERT INTO public.teams VALUES (882, 'Germany');
INSERT INTO public.teams VALUES (883, 'Netherlands');
INSERT INTO public.teams VALUES (884, 'Costa Rica');
INSERT INTO public.teams VALUES (885, 'Chile');
INSERT INTO public.teams VALUES (886, 'Nigeria');
INSERT INTO public.teams VALUES (887, 'Algeria');
INSERT INTO public.teams VALUES (888, 'Greece');
INSERT INTO public.teams VALUES (889, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 64, true);


--
-- Name: games_opponent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_opponent_id_seq', 1, false);


--
-- Name: games_winner_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_winner_id_seq', 1, false);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 889, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

