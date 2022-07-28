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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millons_of_years integer,
    minimal_distance_vs_sun integer,
    has_photo boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_number_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_number_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_number_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_number_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_number_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    has_photo boolean,
    mass integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_number_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_number_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_number_id_seq OWNER TO freecodecamp;

--
-- Name: moon_number_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_number_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_from_earth_mm_km numeric(10,1),
    what_neil_degrasse_tyson_said text,
    has_life boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_number_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_number_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_number_id_seq OWNER TO freecodecamp;

--
-- Name: planet_number_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_number_id_seq OWNED BY public.planet.planet_id;


--
-- Name: satelites; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.satelites (
    satelites_id integer NOT NULL,
    name character varying(30) NOT NULL,
    pizza boolean,
    beso character varying(5),
    cantidad integer
);


ALTER TABLE public.satelites OWNER TO freecodecamp;

--
-- Name: satelites_satelites_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.satelites_satelites_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.satelites_satelites_id_seq OWNER TO freecodecamp;

--
-- Name: satelites_satelites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.satelites_satelites_id_seq OWNED BY public.satelites.satelites_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    is_m_star boolean,
    galaxy_id integer,
    has_photo boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_number_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_number_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_number_id_seq OWNER TO freecodecamp;

--
-- Name: star_number_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_number_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_number_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_number_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_number_id_seq'::regclass);


--
-- Name: satelites satelites_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satelites ALTER COLUMN satelites_id SET DEFAULT nextval('public.satelites_satelites_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_number_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'A galaxy', 100, 998, NULL);
INSERT INTO public.galaxy VALUES (2, 'B Galaxy', 85, 20, NULL);
INSERT INTO public.galaxy VALUES (3, 'C Galaxy', 5, 73, NULL);
INSERT INTO public.galaxy VALUES (4, 'D Galaxy', 15, 86, NULL);
INSERT INTO public.galaxy VALUES (5, 'E Galaxy', 13, 13, NULL);
INSERT INTO public.galaxy VALUES (6, 'F Galaxy', 13, 150, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, '1 m', 1, NULL, NULL);
INSERT INTO public.moon VALUES (2, '2 m', 2, NULL, NULL);
INSERT INTO public.moon VALUES (3, '2 m', 2, NULL, NULL);
INSERT INTO public.moon VALUES (4, '2 m', 2, NULL, NULL);
INSERT INTO public.moon VALUES (5, '2 m', 2, NULL, NULL);
INSERT INTO public.moon VALUES (6, '2 m', 2, NULL, NULL);
INSERT INTO public.moon VALUES (7, '2 m', 2, NULL, NULL);
INSERT INTO public.moon VALUES (8, '2 m', 2, NULL, NULL);
INSERT INTO public.moon VALUES (9, '2 m', 2, NULL, NULL);
INSERT INTO public.moon VALUES (10, '2 m', 2, NULL, NULL);
INSERT INTO public.moon VALUES (11, '2 m', 2, NULL, NULL);
INSERT INTO public.moon VALUES (12, '2 m', 2, NULL, NULL);
INSERT INTO public.moon VALUES (13, '2 m', 2, NULL, NULL);
INSERT INTO public.moon VALUES (14, '2 m', 2, NULL, NULL);
INSERT INTO public.moon VALUES (15, '2 m', 2, NULL, NULL);
INSERT INTO public.moon VALUES (16, '2 m', 2, NULL, NULL);
INSERT INTO public.moon VALUES (17, '2 m', 2, NULL, NULL);
INSERT INTO public.moon VALUES (18, '2 m', 2, NULL, NULL);
INSERT INTO public.moon VALUES (19, '2 m', 2, NULL, NULL);
INSERT INTO public.moon VALUES (20, '2 m', 2, NULL, NULL);
INSERT INTO public.moon VALUES (21, '2 m', 2, NULL, NULL);
INSERT INTO public.moon VALUES (22, '2 m', 2, NULL, NULL);
INSERT INTO public.moon VALUES (23, '2 m', 2, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'A planet', 10.1, 'nothing', true, 1);
INSERT INTO public.planet VALUES (2, 'B Planet', 100.2, 'I like it', false, 2);
INSERT INTO public.planet VALUES (3, 'C planet', 110.1, 'nothing', true, 1);
INSERT INTO public.planet VALUES (4, 'D Planet', 180.2, 'I dont like it', false, 2);
INSERT INTO public.planet VALUES (5, 'F planet', 110.1, 'nothing', true, 1);
INSERT INTO public.planet VALUES (6, 'E Planet', 180.2, 'I dont like it', false, 2);
INSERT INTO public.planet VALUES (7, 'G planet', 110.1, 'nothing but a G thing', true, 4);
INSERT INTO public.planet VALUES (8, 'H Planet', 180.2, 'I dont like it', false, 3);
INSERT INTO public.planet VALUES (9, 'H planet', 110.1, 'nothing', true, 4);
INSERT INTO public.planet VALUES (10, 'I Planet', 180.2, 'I dont like it', false, 3);
INSERT INTO public.planet VALUES (11, 'J planet', 110.1, 'nothing', true, 4);
INSERT INTO public.planet VALUES (12, 'K Planet', 180.2, 'I dont like it', false, 3);
INSERT INTO public.planet VALUES (13, 'L planet', 110.1, 'nothing', true, 4);
INSERT INTO public.planet VALUES (14, 'M Planet', 180.2, 'I dont like it', false, 3);


--
-- Data for Name: satelites; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.satelites VALUES (1, 'Este', true, 'rico', 5);
INSERT INTO public.satelites VALUES (2, 'Este', true, 'rico', 5);
INSERT INTO public.satelites VALUES (3, 'Este', true, 'rico', 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'A Star', true, 1, NULL);
INSERT INTO public.star VALUES (2, 'B Star', false, 2, NULL);
INSERT INTO public.star VALUES (3, 'C Star', true, 1, NULL);
INSERT INTO public.star VALUES (4, 'D Star', false, 3, NULL);
INSERT INTO public.star VALUES (5, 'E Star', true, 5, NULL);
INSERT INTO public.star VALUES (6, 'F Star', false, 6, NULL);


--
-- Name: galaxy_number_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_number_id_seq', 6, true);


--
-- Name: moon_number_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_number_id_seq', 23, true);


--
-- Name: planet_number_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_number_id_seq', 14, true);


--
-- Name: satelites_satelites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.satelites_satelites_id_seq', 3, true);


--
-- Name: star_number_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_number_id_seq', 6, true);


--
-- Name: galaxy galaxy_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_id UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_id UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_id UNIQUE (planet_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: satelites satelites_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satelites
    ADD CONSTRAINT satelites_pkey PRIMARY KEY (satelites_id);


--
-- Name: satelites satelites_satelites_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satelites
    ADD CONSTRAINT satelites_satelites_id_key UNIQUE (satelites_id);


--
-- Name: star star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_id UNIQUE (star_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_near_planet_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_near_planet_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_near_star_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_near_star_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_which_galaxy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_which_galaxy_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

