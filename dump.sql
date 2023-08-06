--
-- PostgreSQL database dump
--

-- Dumped from database version 14.8 (Ubuntu 14.8-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.8 (Ubuntu 14.8-0ubuntu0.22.04.1)

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
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    token text NOT NULL,
    "userId" integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: urls; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.urls (
    id integer NOT NULL,
    url text NOT NULL,
    owner integer NOT NULL,
    "shortUrl" text NOT NULL,
    "visitCount" integer DEFAULT 0 NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: urls_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.urls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: urls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.urls_id_seq OWNED BY public.urls.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: urls id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls ALTER COLUMN id SET DEFAULT nextval('public.urls_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions VALUES (7, '2f8dd30f-0665-412d-996b-0574ce520990', 1, '2023-08-06 17:18:19.583213');
INSERT INTO public.sessions VALUES (8, 'fd784549-5bee-4eec-b4bc-09ff409b8dda', 2, '2023-08-06 19:41:08.279479');
INSERT INTO public.sessions VALUES (9, '07249274-2457-4218-90ec-142473a2221f', 3, '2023-08-06 19:42:32.29236');


--
-- Data for Name: urls; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.urls VALUES (3, 'https://stackoverflow.com/questions/56367863/react-joi-uri-validation-optional', 1, 'bzRDOIB9', 0, '2023-08-06 17:55:00.47315');
INSERT INTO public.urls VALUES (4, 'https://stackoverflow.com/questions/56367863/react-joi-uri-validation-optional', 1, 'EC78Wb6E', 0, '2023-08-06 18:07:23.194219');
INSERT INTO public.urls VALUES (1, 'https://stackoverflow.com/questions/56367863/react-joi-uri-validation-optional', 1, 'Rgys66sq', 2, '2023-08-06 17:53:31.375899');
INSERT INTO public.urls VALUES (2, 'https://stackoverflow.com/questions/56367863/react-joi-uri-validation-optional', 1, 'XFOLaGJp', 1, '2023-08-06 17:53:34.552503');
INSERT INTO public.urls VALUES (6, 'https://www.datacamp.com/tutorial/count-sql-function?utm_source=google&utm_medium=paid_search&utm_campaignid=19589720824&utm_adgroupid=143216588537&utm_device=c&utm_keyword=&utm_matchtype=&utm_network=g&utm_adpostion=&utm_creative=665485585140&utm_targetid=dsa-1947282172981&utm_loc_interest_ms=&utm_loc_physical_ms=1001655&utm_content=dsa~page~community-tuto&utm_campaign=230119_1-sea~dsa~tutorials_2-b2c_3-row-p2_4-prc_5-na_6-na_7-le_8-pdsh-go_9-na_10-na_11-na-ltsjul23&gclid=Cj0KCQjwib2mBhDWARIsAPZUn_lk26odlrIXp5EC_pUMtN_v5ub98aRjfiJp3KPBbTv4vFgNnvaeS1YaAs93EALw_wcB', 1, '38UXfhri', 0, '2023-08-06 19:40:00.135494');
INSERT INTO public.urls VALUES (7, 'https://www.datacamp.com/tutorial/count-sql-function?utm_source=google&utm_medium=paid_search&utm_campaignid=19589720824&utm_adgroupid=143216588537&utm_device=c&utm_keyword=&utm_matchtype=&utm_network=g&utm_adpostion=&utm_creative=665485585140&utm_targetid=dsa-1947282172981&utm_loc_interest_ms=&utm_loc_physical_ms=1001655&utm_content=dsa~page~community-tuto&utm_campaign=230119_1-sea~dsa~tutorials_2-b2c_3-row-p2_4-prc_5-na_6-na_7-le_8-pdsh-go_9-na_10-na_11-na-ltsjul23&gclid=Cj0KCQjwib2mBhDWARIsAPZUn_lk26odlrIXp5EC_pUMtN_v5ub98aRjfiJp3KPBbTv4vFgNnvaeS1YaAs93EALw_wcB', 1, 'SoEawc47', 0, '2023-08-06 19:40:03.689238');
INSERT INTO public.urls VALUES (8, 'https://www.notion.so/bootcampra/Projeto-17-Shortly-API-34ff4484a1274eed901c5a2bd1e23722', 2, 'n7PiYztb', 0, '2023-08-06 19:42:02.935768');
INSERT INTO public.urls VALUES (9, 'https://www.notion.so/bootcampra/Projeto-17-Shortly-API-34ff4484a1274eed901c5a2bd1e23722', 2, 'aT8IYhir', 0, '2023-08-06 19:42:04.033971');
INSERT INTO public.urls VALUES (10, 'https://www.trivago.com.br/en-US?cip=5503080040912&cip_tc=12891-101-101_privacy_1691359528400800001&cip_ext_id=1691359528400800001&mfadid=adm&rl=en-US', 3, 'LS6qECJm', 0, '2023-08-06 19:43:16.841742');
INSERT INTO public.urls VALUES (11, 'https://www.trivago.com.br/en-US?cip=5503080040912&cip_tc=12891-101-101_privacy_1691359528400800001&cip_ext_id=1691359528400800001&mfadid=adm&rl=en-US', 3, 'RjKKuAfE', 0, '2023-08-06 19:43:17.810346');
INSERT INTO public.urls VALUES (12, 'https://www.trivago.com.br/en-US?cip=5503080040912&cip_tc=12891-101-101_privacy_1691359528400800001&cip_ext_id=1691359528400800001&mfadid=adm&rl=en-US', 3, 'rLvcacUA', 0, '2023-08-06 19:43:57.601423');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'Breno', 'breno@mail.com', '$2b$10$pDqZp2.gScdeZkb.se32t.eevdu46y4raMEci5V/3UIvpphMfdenm', '2023-08-06 16:55:56.658526');
INSERT INTO public.users VALUES (2, 'Jane Doe', 'jane@mail.com', '$2b$10$fPf9AKL1pWd0IGnJCQuRJuYVfMmnOaSkvUfWybdclcsduxlHk0xn2', '2023-08-06 19:38:37.080357');
INSERT INTO public.users VALUES (3, 'John Doe', 'john@mail.com', '$2b$10$zjQxjfWOQWjDB6LNy09yaeJ2J.m.WSS82X54naKWs41I4fvzx1qGS', '2023-08-06 19:39:06.230753');


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 9, true);


--
-- Name: urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.urls_id_seq', 12, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 3, true);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_token_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_token_key UNIQUE (token);


--
-- Name: urls unique_shorts; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT unique_shorts UNIQUE ("shortUrl");


--
-- Name: urls urls_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT "sessions_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: urls urls_owner_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_owner_fkey FOREIGN KEY (owner) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

