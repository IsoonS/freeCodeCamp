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
    name character varying(30),
    type character varying(30),
    age_in_billions_of_years integer,
    size_in_light_years numeric(10,2),
    number_of_stars integer NOT NULL,
    has_active_black_hole boolean NOT NULL
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
    name character varying(30),
    planet_id integer NOT NULL,
    diameter_km numeric(10,2) NOT NULL,
    orbital_period_days numeric(10,2),
    surface_temperature_celsius numeric(10,2),
    composition character varying(100),
    has_atmosphere boolean
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
    name character varying(30),
    star_id integer NOT NULL,
    distance_from_star numeric(10,2),
    orbital_period numeric(10,2) NOT NULL,
    surface_temperature numeric(10,2),
    atmosphere_composition character varying(100),
    has_moons boolean
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
-- Name: rocket; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.rocket (
    rocket_id integer NOT NULL,
    name character varying(30),
    manufacturer character varying(50),
    fuel_type character varying(30),
    payload_capacity_kg integer,
    first_flight_date date NOT NULL,
    reusable boolean NOT NULL
);


ALTER TABLE public.rocket OWNER TO freecodecamp;

--
-- Name: rocket_rocket_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.rocket_rocket_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rocket_rocket_id_seq OWNER TO freecodecamp;

--
-- Name: rocket_rocket_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.rocket_rocket_id_seq OWNED BY public.rocket.rocket_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30),
    age_in_millions_of_years integer,
    distance_from_earth integer NOT NULL,
    diameter numeric NOT NULL,
    gimmick text,
    has_life boolean,
    have_been boolean,
    galaxy_id integer
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
-- Name: rocket rocket_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.rocket ALTER COLUMN rocket_id SET DEFAULT nextval('public.rocket_rocket_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'milky way', NULL, NULL, NULL, 3, false);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', NULL, NULL, NULL, 3, false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', NULL, NULL, NULL, 3, false);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', NULL, NULL, NULL, 3, false);
INSERT INTO public.galaxy VALUES (8, 'Whirlpool Galaxy', NULL, NULL, NULL, 3, false);
INSERT INTO public.galaxy VALUES (9, 'Sombrero Galaxy', NULL, NULL, NULL, 3, false);
INSERT INTO public.galaxy VALUES (10, 'Pinwheel Galaxy', NULL, NULL, NULL, 3, false);
INSERT INTO public.galaxy VALUES (11, 'Bode''s Galaxy', NULL, NULL, NULL, 3, false);
INSERT INTO public.galaxy VALUES (12, 'Cigar Galaxy', NULL, NULL, NULL, 3, false);
INSERT INTO public.galaxy VALUES (13, 'Sunflower Galaxy', NULL, NULL, NULL, 3, false);
INSERT INTO public.galaxy VALUES (14, 'Cartwheel Galaxy', NULL, NULL, NULL, 3, false);
INSERT INTO public.galaxy VALUES (7, 'mm', NULL, NULL, NULL, 3, false);
INSERT INTO public.galaxy VALUES (6, 'ka', NULL, NULL, NULL, 3, false);
INSERT INTO public.galaxy VALUES (5, 'ant', NULL, NULL, NULL, 3, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon Earth', 1, 1000000.00, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (2, 'Moon (Earth)', 1, 1000000.00, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'Phobos', 1, 1000000.00, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'Ganymede', 1, 1000000.00, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'Titan', 1, 1000000.00, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'Deimos', 4, 1000000.00, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'Io', 5, 1000000.00, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'Europa', 5, 1000000.00, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'Callisto', 5, 1000000.00, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'Mimas', 6, 1000000.00, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'Enceladus', 6, 1000000.00, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'Tethys', 6, 1000000.00, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'Dione', 6, 1000000.00, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'Rhea', 6, 1000000.00, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'Iapetus', 6, 1000000.00, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'Miranda', 7, 1000000.00, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'Ariel', 7, 1000000.00, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (21, 'Umbriel', 7, 1000000.00, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (22, 'Titania', 7, 1000000.00, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (23, 'Oberon', 7, 1000000.00, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (24, 'Triton', 8, 1000000.00, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (25, 'Charon', 9, 1000000.00, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'Photo', 4, 1000000.00, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'titans', 6, 1000000.00, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'gg', 5, 1000000.00, NULL, NULL, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, NULL, 333.00, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (2, 'Mercury', 1, NULL, 333.00, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (3, 'Venus', 1, NULL, 333.00, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (4, 'Mars', 1, NULL, 333.00, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, NULL, 333.00, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (10, 'Saturn', 1, NULL, 333.00, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (11, 'Uranus', 1, NULL, 333.00, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (12, 'Neptune', 1, NULL, 333.00, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (13, 'Kepler-22b', 1, NULL, 333.00, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (14, 'Proxima Centauri b', 1, NULL, 333.00, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (15, 'TRAPPIST-1e', 1, NULL, 333.00, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (8, 'mars', 1, NULL, 333.00, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (9, 'jupiter', 1, NULL, 333.00, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (7, 'venus', 1, NULL, 333.00, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (6, 'a', 1, NULL, 333.00, NULL, NULL, NULL);


--
-- Data for Name: rocket; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.rocket VALUES (1, 'Falcon 9', NULL, NULL, NULL, '2000-03-20', false);
INSERT INTO public.rocket VALUES (2, 'Atlas V', NULL, NULL, NULL, '2000-03-20', false);
INSERT INTO public.rocket VALUES (3, 'Delta IV', NULL, NULL, NULL, '2000-03-20', false);
INSERT INTO public.rocket VALUES (4, 'Soyuz', NULL, NULL, NULL, '2000-03-20', false);
INSERT INTO public.rocket VALUES (5, 'Ariane 5', NULL, NULL, NULL, '2000-03-20', false);
INSERT INTO public.rocket VALUES (6, 'Long March 5', NULL, NULL, NULL, '2000-03-20', false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'saturn', 5000000, 3842876, 499.832, 'so hot', true, true, 1);
INSERT INTO public.star VALUES (2, 'Sun', 4600, 0, 1392000, 'center of solar system', false, true, 1);
INSERT INTO public.star VALUES (3, 'Sirius', 230, 9, 2.063, 'brightest star in the night sky', false, true, 1);
INSERT INTO public.star VALUES (4, 'Alpha Centauri A', 6000, 4, 1.227, 'part of Alpha Centauri system', false, true, 1);
INSERT INTO public.star VALUES (5, 'Alpha Centauri B', 6000, 4, 0.863, 'part of Alpha Centauri system', false, true, 1);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 6000, 4, 0.141, 'nearest known star to the Sun', false, true, 1);
INSERT INTO public.star VALUES (7, 'Alpha Centauri C', 6000, 4, 1.527, 'part of Alpha Centauri system', false, true, 1);
INSERT INTO public.star VALUES (8, 'Barnard''s Star', 9000, 6, 0.196, 'second nearest known star to the Sun', false, true, 1);
INSERT INTO public.star VALUES (9, 'Wolf 359', 200, 8, 0.0135, 'nearest known star system to the Sun', false, true, 1);
INSERT INTO public.star VALUES (10, 'Lalande 21185', 1000, 8, 0.39, 'seventh nearest known individual star to the Sun', false, true, 1);
INSERT INTO public.star VALUES (11, 'Ross 154', 230, 10, 0.16, 'eleventh nearest known star system to the Sun', false, true, 1);
INSERT INTO public.star VALUES (12, 'Epsilon Eridani', 1000, 11, 0.79, 'one of the nearest stars known to have a planetary system', false, true, 1);
INSERT INTO public.star VALUES (13, 'EZ Aquarii', 1100, 11, 0.31, 'system consisting of four stars', false, true, 1);
INSERT INTO public.star VALUES (14, '61 Cygni', 7000, 11, 0.67, 'one of the stars that move fastest in our sky', false, true, 1);
INSERT INTO public.star VALUES (15, 'Tau Ceti', 5000, 12, 0.79, 'closest single star to the Sun', false, true, 1);
INSERT INTO public.star VALUES (16, 'Groombridge 34', 10000, 12, 0.6, 'binary star system consisting of two red dwarf stars', false, true, 1);
INSERT INTO public.star VALUES (17, 'YZ Ceti', 6000, 12, 0.17, 'fourth-nearest star system to the Sun', false, true, 1);
INSERT INTO public.star VALUES (18, 'Lacaille 9352', 10000, 11, 0.5, 'seventh-nearest known single star to the Sun', false, true, 1);
INSERT INTO public.star VALUES (19, 'UV Ceti', 3000, 9, 0.1, 'variable star system', false, true, 1);
INSERT INTO public.star VALUES (20, 'Kruger 60', 8000, 13, 0.2, 'binary star system', false, true, 1);
INSERT INTO public.star VALUES (21, 'WISE 0855−0714', 1000, 7, 0.05, 'brown dwarf', false, true, 1);
INSERT INTO public.star VALUES (22, 'Denis-P J1048.4−3956', 1000, 11, 0.13, 'brown dwarf', false, true, 1);
INSERT INTO public.star VALUES (23, 'WISE 1506+7027', 1000, 10, 0.1, 'brown dwarf', false, true, 1);
INSERT INTO public.star VALUES (24, '2MASS J10475385+2124234', 1000, 10, 0.1, 'brown dwarf', false, true, 1);
INSERT INTO public.star VALUES (25, '2MASS J00361617+1821104', 1000, 11, 0.1, 'brown dwarf', false, true, 1);
INSERT INTO public.star VALUES (26, '2MASS J21402931+1625183', 1000, 11, 0.1, 'brown dwarf', false, true, 1);
INSERT INTO public.star VALUES (27, '2MASS J07464256+2000321', 1000, 12, 0.1, 'brown dwarf', false, true, 1);
INSERT INTO public.star VALUES (28, '2MASS J04151954−0935066', 1000, 13, 0.1, 'brown dwarf', false, true, 1);
INSERT INTO public.star VALUES (29, '2MASS J08251968+2115521', 1000, 13, 0.1, 'brown dwarf', false, true, 1);
INSERT INTO public.star VALUES (30, '2MASS J20472463−2046047', 1000, 13, 0.1, 'brown dwarf', false, true, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 14, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 25, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: rocket_rocket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.rocket_rocket_id_seq', 6, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 30, true);


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
-- Name: rocket rocket_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.rocket
    ADD CONSTRAINT rocket_pkey PRIMARY KEY (rocket_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: rocket unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.rocket
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: galaxy unique_name1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name1 UNIQUE (name);


--
-- Name: moon unique_name2; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_name2 UNIQUE (name);


--
-- Name: planet unique_name3; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_name3 UNIQUE (name);


--
-- Name: star unique_name4; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_name4 UNIQUE (name);


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

