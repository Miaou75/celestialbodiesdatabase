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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(30) NOT NULL,
    is_alive boolean DEFAULT true NOT NULL,
    latin_name text,
    image character varying(30)
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    constellation_id integer,
    is_alive boolean DEFAULT true NOT NULL,
    origin_of_name text,
    image character varying(30)
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
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    is_alive boolean DEFAULT true NOT NULL,
    discoverer text,
    distance_from_planet_in_km numeric,
    year_discovered integer,
    image character varying(30)
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
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_id integer,
    is_alive boolean DEFAULT true NOT NULL,
    has_ring_system boolean,
    density integer,
    nb_of_moons integer,
    image character varying(30)
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
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    is_alive boolean DEFAULT true NOT NULL,
    designation text,
    image character varying(30),
    galaxy_id integer
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (5, 'Aquarius', true, NULL, NULL);
INSERT INTO public.constellation VALUES (6, 'Aries', true, NULL, NULL);
INSERT INTO public.constellation VALUES (7, 'Bootes', true, NULL, NULL);
INSERT INTO public.constellation VALUES (8, 'Capricornus', true, NULL, NULL);
INSERT INTO public.constellation VALUES (9, 'Centaurus', true, NULL, NULL);
INSERT INTO public.constellation VALUES (10, 'Cetus', true, NULL, NULL);
INSERT INTO public.constellation VALUES (11, 'Corna Berenices', true, NULL, NULL);
INSERT INTO public.constellation VALUES (12, 'Leo', true, NULL, NULL);
INSERT INTO public.constellation VALUES (13, 'Ophiuchus', true, NULL, NULL);
INSERT INTO public.constellation VALUES (14, 'Pegasus', true, NULL, NULL);
INSERT INTO public.constellation VALUES (15, 'Sagittarius', true, NULL, NULL);
INSERT INTO public.constellation VALUES (16, 'Taurus', true, NULL, NULL);
INSERT INTO public.constellation VALUES (17, 'Virgo', true, NULL, NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (6, 'Backward Galaxy', 5, true, NULL, NULL);
INSERT INTO public.galaxy VALUES (7, 'Centaurus A', 5, true, NULL, NULL);
INSERT INTO public.galaxy VALUES (8, 'Black Eye Galaxy', 7, true, NULL, NULL);
INSERT INTO public.galaxy VALUES (9, 'Coma Pinwheel Galaxy', 7, true, NULL, NULL);
INSERT INTO public.galaxy VALUES (10, 'Malin 1', 7, true, NULL, NULL);
INSERT INTO public.galaxy VALUES (11, 'Mice Galaxies', 7, true, NULL, NULL);
INSERT INTO public.galaxy VALUES (12, 'Needle Galaxy', 7, true, NULL, NULL);
INSERT INTO public.galaxy VALUES (13, 'Butterfly Galaxies', 13, true, NULL, NULL);
INSERT INTO public.galaxy VALUES (14, 'Sombrero Galaxy', 13, true, NULL, NULL);
INSERT INTO public.galaxy VALUES (15, 'Little Sombrero Galaxy', 10, true, NULL, NULL);
INSERT INTO public.galaxy VALUES (16, 'Milky Way', 11, true, NULL, NULL);
INSERT INTO public.galaxy VALUES (17, 'Wolf-Lundmark-Melotte', 6, true, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, true, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, true, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'Demos', 4, true, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'Io', 5, true, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'Europa', 5, true, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, true, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, true, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'Amalthea', 5, true, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'Himalla', 5, true, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'Thebe', 5, true, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'Mimas', 6, true, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'Enceladus', 6, true, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'Tethys', 6, true, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'Dione', 6, true, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'Rhea', 6, true, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'Titan', 6, true, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'Hyperion', 6, true, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'Iapetus', 6, true, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'Phoebe', 6, true, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'LastMoon', 6, true, NULL, NULL, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 5, true, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (2, 'Mercury', 13, true, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (3, 'Venus', 7, true, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (4, 'Mars', 8, true, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (5, 'Jupiter', 9, true, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (6, 'Saturn', 4, true, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (7, 'Uranus', 2, true, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, true, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (9, 'Ceres', 7, true, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (10, 'Orcus', 11, true, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (11, 'Pluto', 11, true, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (12, 'Haumea', 3, true, NULL, NULL, NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sadalsuud', true, NULL, NULL, 16);
INSERT INTO public.star VALUES (2, 'Hamal', true, NULL, NULL, 16);
INSERT INTO public.star VALUES (3, 'Arcturus', true, NULL, NULL, 16);
INSERT INTO public.star VALUES (4, 'Deneb Algedi', true, NULL, NULL, 16);
INSERT INTO public.star VALUES (5, 'Rigil Kentaurus', true, NULL, NULL, 16);
INSERT INTO public.star VALUES (6, 'Beta Comae Berenices', true, NULL, NULL, 16);
INSERT INTO public.star VALUES (7, 'Regulus', true, NULL, NULL, 16);
INSERT INTO public.star VALUES (8, 'Aldebaran', true, NULL, NULL, 16);
INSERT INTO public.star VALUES (9, 'Diphda', true, NULL, NULL, 16);
INSERT INTO public.star VALUES (10, 'Enif', true, NULL, NULL, 16);
INSERT INTO public.star VALUES (11, 'Kaus Australis', true, NULL, NULL, 16);
INSERT INTO public.star VALUES (12, 'Rasalhague', true, NULL, NULL, 16);
INSERT INTO public.star VALUES (13, 'Spica', true, NULL, NULL, 16);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 17, true);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 17, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 12, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 13, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy galaxy_unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_unique_name UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moon_unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_unique_name UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_unique_name UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_unique_name UNIQUE (name);


--
-- Name: galaxy galaxy_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


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

