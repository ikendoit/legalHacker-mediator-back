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
-- Name: feedbacks; Type: TABLE; Schema: public; Owner: ken
--

CREATE TABLE public.feedbacks (
    id integer NOT NULL,
    user_id integer,
    content text,
    date_created timestamp with time zone DEFAULT now(),
    schedule_date date,
    type text
);


ALTER TABLE public.feedbacks OWNER TO ken;

--
-- Name: feedbacks_id_seq; Type: SEQUENCE; Schema: public; Owner: ken
--

CREATE SEQUENCE public.feedbacks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.feedbacks_id_seq OWNER TO ken;

--
-- Name: feedbacks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ken
--

ALTER SEQUENCE public.feedbacks_id_seq OWNED BY public.feedbacks.id;


--
-- Name: feedbacks id; Type: DEFAULT; Schema: public; Owner: ken
--

ALTER TABLE ONLY public.feedbacks ALTER COLUMN id SET DEFAULT nextval('public.feedbacks_id_seq'::regclass);


--
-- Data for Name: feedbacks; Type: TABLE DATA; Schema: public; Owner: ken
--

COPY public.feedbacks (id, user_id, content, date_created, schedule_date, type) FROM stdin;
1	3	\N	2018-09-30 12:36:30.632491-07	2018-09-29	schedule-meet-up
2	4	admin hello world.	2018-09-30 12:38:45.272971-07	\N	mail
3	4	-1 no prank callable.	2018-09-30 12:39:02.553619-07	\N	mail
4	4	+1 helped me avoid my wife for 5 years.	2018-09-30 12:39:23.863851-07	\N	mail
5	4	\N	2018-09-30 12:39:31.98567-07	2019-09-20	schedule-meet-up
6	3	Why did the preliminary block me ?	2018-09-30 21:32:53.805031-07	\N	mail
7	3	+1 great web.	2018-09-30 21:34:19.278602-07	\N	mail
\.


--
-- Name: feedbacks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ken
--

SELECT pg_catalog.setval('public.feedbacks_id_seq', 7, true);


--
-- Name: feedbacks feedbacks_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ken
--

ALTER TABLE ONLY public.feedbacks
    ADD CONSTRAINT feedbacks_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

