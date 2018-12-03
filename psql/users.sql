--
-- PostgreSQL database dump
--

-- Dumped from database version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: users; Type: TABLE; Schema: public; Owner: ken
--

CREATE TABLE public.users (
    id integer NOT NULL,
    last_name text,
    first_name text,
    address text,
    phone text,
    email text,
    password text
);


ALTER TABLE public.users OWNER TO ken;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: ken
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO ken;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ken
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: ken
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: ken
--

COPY public.users (id, last_name, first_name, address, phone, email, password) FROM stdin;
5	testee	tester1	wut, my home ?	919193333333	919193333333	123456
6	testtest	tester2	222 at 222 address	232632222	232632222	123456
7	testtest	tester2	222 at 222 address	232632222	232632222	123456
3	nnngguyen	ken	viet name	1232222123	ken@gmail	123456
8	test3	test3	333 399 3833	213123123123	213123123123	123456
9	test3	test3	333 399 3833	213123123123	213123123123	123456
4	add add	why admin	me my place	12322123	admin@mediatorauto	123456
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ken
--

SELECT pg_catalog.setval('public.users_id_seq', 9, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: ken
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

