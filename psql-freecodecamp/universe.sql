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
-- Name: astroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.astroid (
    name character varying(20) NOT NULL,
    size integer NOT NULL,
    astroid_id integer NOT NULL
);


ALTER TABLE public.astroid OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(20) NOT NULL,
    galaxy_id integer NOT NULL,
    size numeric,
    num_planets integer,
    has_life boolean NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying(20) NOT NULL,
    moon_id integer NOT NULL,
    planet_id integer,
    mass integer,
    diameter integer,
    orbit integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    name character varying(20) NOT NULL,
    planet_id integer NOT NULL,
    star_id integer,
    mass integer,
    atmosphere text,
    habitable boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying(20) NOT NULL,
    star_id integer NOT NULL,
    galaxy_id integer,
    mass integer,
    age integer,
    size integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: astroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.astroid VALUES ('Ceres', 940000, 1);
INSERT INTO public.astroid VALUES ('Vesta', 525000, 2);
INSERT INTO public.astroid VALUES ('Pallas', 510000, 3);
INSERT INTO public.astroid VALUES ('Hygiea', 434000, 4);
INSERT INTO public.astroid VALUES ('Interamnia', 320000, 5);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milky Way', 1, 100000, 8, true);
INSERT INTO public.galaxy VALUES ('Andromeda', 2, 200000, 10, false);
INSERT INTO public.galaxy VALUES ('Triangulum', 3, 50000, 5, false);
INSERT INTO public.galaxy VALUES ('Messier 81', 4, 80000, 4, false);
INSERT INTO public.galaxy VALUES ('Messier 87', 5, 120000, 6, false);
INSERT INTO public.galaxy VALUES ('Sombrero', 6, 60000, 3, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Luna', 1, 3, 734767, 3474, 384400);
INSERT INTO public.moon VALUES ('Phobos', 2, 4, 108, 22, 9376);
INSERT INTO public.moon VALUES ('Deimos', 3, 4, 148, 12, 23463);
INSERT INTO public.moon VALUES ('Io', 4, 5, 894, 3642, 421700);
INSERT INTO public.moon VALUES ('Europa', 5, 5, 480, 3121, 671034);
INSERT INTO public.moon VALUES ('Ganymede', 6, 5, 1480, 5262, 1070412);
INSERT INTO public.moon VALUES ('Callisto', 7, 5, 1080, 4820, 1882709);
INSERT INTO public.moon VALUES ('Titan', 8, 6, 1350, 5150, 1221870);
INSERT INTO public.moon VALUES ('Enceladus', 9, 6, 108, 252, 238020);
INSERT INTO public.moon VALUES ('Mimas', 10, 6, 375, 396, 185520);
INSERT INTO public.moon VALUES ('Rhea', 11, 6, 2490, 763, 527040);
INSERT INTO public.moon VALUES ('Triton', 12, 7, 2140, 2705, 354800);
INSERT INTO public.moon VALUES ('Charon', 13, 7, 159, 1207, 19571);
INSERT INTO public.moon VALUES ('Phoebe', 14, 8, 293, 106, 12947920);
INSERT INTO public.moon VALUES ('Dione', 15, 8, 1100, 562, 377400);
INSERT INTO public.moon VALUES ('Miranda', 16, 8, 659, 235, 129780);
INSERT INTO public.moon VALUES ('Iapetus', 17, 8, 1810, 1469, 3561300);
INSERT INTO public.moon VALUES ('Hyperion', 18, 8, 562, 360, 1481010);
INSERT INTO public.moon VALUES ('Ariel', 19, 9, 1350, 1158, 191240);
INSERT INTO public.moon VALUES ('Umbriel', 20, 9, 1170, 1169, 266000);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Mercury', 1, 1, 330, 'None', false);
INSERT INTO public.planet VALUES ('Venus', 2, 1, 4868, 'Carbon dioxide, nitrogen', false);
INSERT INTO public.planet VALUES ('Earth', 3, 1, 5973, 'Nitrogen, oxygen, argon', true);
INSERT INTO public.planet VALUES ('Mars', 4, 1, 642, 'Carbon dioxide, nitrogen', false);
INSERT INTO public.planet VALUES ('Jupiter', 5, 2, 1898600, 'Hydrogen, helium', false);
INSERT INTO public.planet VALUES ('Saturn', 6, 2, 568460, 'Hydrogen, helium', false);
INSERT INTO public.planet VALUES ('Uranus', 7, 3, 86832, 'Hydrogen, helium, methane', false);
INSERT INTO public.planet VALUES ('Neptune', 8, 3, 102430, 'Hydrogen, helium, methane', false);
INSERT INTO public.planet VALUES ('Kepler-22b', 9, 4, 4105, 'Unknown', true);
INSERT INTO public.planet VALUES ('HD 40307g', 10, 5, 9100, 'Unknown', true);
INSERT INTO public.planet VALUES ('Gliese 581d', 11, 5, 6850, 'Unknown', true);
INSERT INTO public.planet VALUES ('Proxima Centauri b', 12, 6, 13200, 'Unknown', true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Sun', 1, 1, 1989, 4600, 109);
INSERT INTO public.star VALUES ('Sirius', 2, 1, 2500, 2500, 1);
INSERT INTO public.star VALUES ('Alpha Centauri A', 3, 1, 2500, 6000, 1);
INSERT INTO public.star VALUES ('Alpha Centauri B', 4, 1, 2000, 6000, 1);
INSERT INTO public.star VALUES ('Proxima Centauri', 5, 1, 123, 6000, 1);
INSERT INTO public.star VALUES ('Betelgeuse', 6, 2, 11800, 10000, 1000);
INSERT INTO public.star VALUES ('Rigel', 7, 2, 17100, 10000, 78);
INSERT INTO public.star VALUES ('Vega', 8, 1, 2600, 4550, 2);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 1, false);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 1, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 1, false);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 1, false);


--
-- Name: astroid astroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astroid
    ADD CONSTRAINT astroid_name_key UNIQUE (name);


--
-- Name: astroid astroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astroid
    ADD CONSTRAINT astroid_pkey PRIMARY KEY (astroid_id);


--
-- Name: astroid astroid_size_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astroid
    ADD CONSTRAINT astroid_size_key UNIQUE (size);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

