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
-- Name: meetings; Type: TABLE; Schema: public; Owner: ken
--

CREATE TABLE public.meetings (
    date timestamp with time zone,
    note text,
    user_id integer,
    question_id integer,
    allow boolean,
    id integer NOT NULL
);


ALTER TABLE public.meetings OWNER TO ken;

--
-- Name: meetings_id_seq; Type: SEQUENCE; Schema: public; Owner: ken
--

CREATE SEQUENCE public.meetings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.meetings_id_seq OWNER TO ken;

--
-- Name: meetings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ken
--

ALTER SEQUENCE public.meetings_id_seq OWNED BY public.meetings.id;


--
-- Name: meetings id; Type: DEFAULT; Schema: public; Owner: ken
--

ALTER TABLE ONLY public.meetings ALTER COLUMN id SET DEFAULT nextval('public.meetings_id_seq'::regclass);


--
-- Data for Name: meetings; Type: TABLE DATA; Schema: public; Owner: ken
--

COPY public.meetings (date, note, user_id, question_id, allow, id) FROM stdin;
\N	\N	6	12	f	3
2019-01-03 12:12:25.277-08	null	3	16	t	7
\N	\N	3	13	t	4
\N	\N	8	14	t	5
\N	\N	3	17	t	8
\N	\N	3	18	f	9
\N	\N	3	15	f	6
\N	\N	3	19	f	10
\N	\N	4	22	\N	13
\N	\N	4	23	\N	14
2018-09-18 07:23:41.279-07	null	4	11	t	2
\N	\N	3	24	\N	15
2018-09-19 07:10:43.205-07	null	3	10	f	1
\N	\N	4	21	t	12
\N	\N	3	20	f	11
\.


--
-- Name: meetings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ken
--

SELECT pg_catalog.setval('public.meetings_id_seq', 15, true);


--
-- Name: meetings meetings_question_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ken
--

ALTER TABLE ONLY public.meetings
    ADD CONSTRAINT meetings_question_id_fkey FOREIGN KEY (question_id) REFERENCES public.questions(id);


--
-- Name: meetings meetings_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ken
--

ALTER TABLE ONLY public.meetings
    ADD CONSTRAINT meetings_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

