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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    type text,
    size integer NOT NULL,
    num_stars integer,
    has_black_hole boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying NOT NULL,
    planet_id integer,
    diameter integer,
    orbital_period integer,
    is_inhabited boolean NOT NULL,
    has_water boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying NOT NULL,
    star_id integer,
    distance_from_star numeric,
    radius integer NOT NULL,
    has_atmosphere boolean,
    num_moons integer,
    planet_type_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    name character varying NOT NULL,
    description text,
    habitable boolean NOT NULL
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_type_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_type_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_type_planet_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying NOT NULL,
    galaxy_id integer,
    temperature integer,
    luminosity numeric,
    is_binary boolean NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_type_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 100000, 200000000, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 120000, 250000000, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 50000, 40000000, false);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 70000, 60000000, false);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Elliptical', 80000, 30000000, false);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 'Elliptical', 90000, 35000000, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (21, 'Moon', 3, 3475, 27, false, true);
INSERT INTO public.moon VALUES (22, 'Phobos', 4, 22, 0, false, false);
INSERT INTO public.moon VALUES (23, 'Deimos', 4, 12, 1, false, false);
INSERT INTO public.moon VALUES (24, 'Europa', 9, 3122, 4, false, true);
INSERT INTO public.moon VALUES (25, 'Titan', 10, 5150, 16, false, true);
INSERT INTO public.moon VALUES (26, 'Ganymede', 9, 5262, 7, false, true);
INSERT INTO public.moon VALUES (27, 'Callisto', 9, 4821, 17, false, false);
INSERT INTO public.moon VALUES (28, 'Triton', 13, 2707, -6, false, true);
INSERT INTO public.moon VALUES (29, 'Titania', 12, 1578, 9, false, true);
INSERT INTO public.moon VALUES (30, 'Oberon', 12, 1523, 14, false, true);
INSERT INTO public.moon VALUES (31, 'Rhea', 11, 764, 5, false, true);
INSERT INTO public.moon VALUES (32, 'Iapetus', 11, 1436, 79, false, false);
INSERT INTO public.moon VALUES (33, 'Dione', 11, 561, 3, false, true);
INSERT INTO public.moon VALUES (34, 'Enceladus', 11, 252, 1, false, true);
INSERT INTO public.moon VALUES (35, 'Miranda', 13, 236, 1, false, false);
INSERT INTO public.moon VALUES (36, 'Ariel', 12, 579, 3, false, true);
INSERT INTO public.moon VALUES (37, 'Umbriel', 12, 585, 4, false, true);
INSERT INTO public.moon VALUES (38, 'Tethys', 11, 531, 2, false, true);
INSERT INTO public.moon VALUES (39, 'Charon', 14, 606, 6, false, false);
INSERT INTO public.moon VALUES (40, 'Nereid', 13, 170, 360, false, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 0.39, 2440, false, 0, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 0.72, 6052, true, 0, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 1, 6371, true, 1, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 1.52, 3390, true, 2, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 5.2, 69911, true, 79, 2);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 9.58, 58232, true, 82, 2);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 19.2, 25362, true, 27, 3);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 30.05, 24622, true, 14, 3);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 5, 0.0485, 1, true, 0, 1);
INSERT INTO public.planet VALUES (10, 'Wolf 1061c', 6, 0.0843, 1, true, 0, 1);
INSERT INTO public.planet VALUES (11, 'Gliese 667 Cc', 2, 0.123, 2, true, 0, 1);
INSERT INTO public.planet VALUES (12, 'Kepler-22b', 2, 0.85, 2, true, 0, 1);
INSERT INTO public.planet VALUES (13, 'Kepler-186f', 2, 0.35, 1, true, 1, 1);
INSERT INTO public.planet VALUES (14, 'Kepler-452b', 2, 1.05, 2, true, 0, 1);
INSERT INTO public.planet VALUES (15, 'Trappist-1d', 2, 0.0281, 1, true, 2, 1);
INSERT INTO public.planet VALUES (16, 'LHS 1140 b', 2, 0.0875, 1, true, 0, 1);


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, 'Terrestrial', 'Rocky planets with solid surfaces', true);
INSERT INTO public.planet_type VALUES (2, 'Gas Giant', 'Large planets primarily composed of gases', false);
INSERT INTO public.planet_type VALUES (3, 'Ice Giant', 'Planets composed mainly of elements heavier than hydrogen and helium', false);
INSERT INTO public.planet_type VALUES (4, 'Dwarf Planet', 'Celestial bodies that orbit the sun but are not considered planets', false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 5778, 1, false);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 6, 5790, 1.519, false);
INSERT INTO public.star VALUES (3, 'Alpha Centauri B', 6, 5260, 0.5, false);
INSERT INTO public.star VALUES (4, 'Sirius', 1, 9940, 25.4, false);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 6, 3042, 0.0017, false);
INSERT INTO public.star VALUES (6, 'Epsilon Eridani', 1, 5084, 0.34, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 40, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 16, true);


--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_type_planet_type_id_seq', 4, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


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
-- Name: planet_type planet_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_name_key UNIQUE (name);


--
-- Name: planet_type planet_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_pkey PRIMARY KEY (planet_type_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_planet_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_type_id_fkey FOREIGN KEY (planet_type_id) REFERENCES public.planet_type(planet_type_id);


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

