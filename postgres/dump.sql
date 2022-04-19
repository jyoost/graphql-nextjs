--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Debian 12.9-1.pgdg110+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)

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

--
-- Name: Role; Type: TYPE; Schema: public; Owner: db
--

CREATE TYPE public."Role" AS ENUM (
    'USER',
    'ADMIN'
);


ALTER TYPE public."Role" OWNER TO db;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Diagram; Type: TABLE; Schema: public; Owner: db
--

CREATE TABLE public."Diagram" (
    id text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    title text NOT NULL,
    description text NOT NULL,
    url text NOT NULL,
    "imageUrl" text NOT NULL,
    category text NOT NULL,
    diagram jsonb NOT NULL
);


ALTER TABLE public."Diagram" OWNER TO db;

--
-- Name: Link; Type: TABLE; Schema: public; Owner: db
--

CREATE TABLE public."Link" (
    id text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    title text NOT NULL,
    description text NOT NULL,
    url text NOT NULL,
    "imageUrl" text NOT NULL,
    category text NOT NULL
);


ALTER TABLE public."Link" OWNER TO db;

--
-- Name: User; Type: TABLE; Schema: public; Owner: db
--

CREATE TABLE public."User" (
    id text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    email text,
    image text,
    role public."Role" DEFAULT 'USER'::public."Role" NOT NULL
);


ALTER TABLE public."User" OWNER TO db;

--
-- Name: _LinkToUser; Type: TABLE; Schema: public; Owner: db
--

CREATE TABLE public."_LinkToUser" (
    "A" text NOT NULL,
    "B" text NOT NULL
);


ALTER TABLE public."_LinkToUser" OWNER TO db;

--
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: db
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public._prisma_migrations OWNER TO db;

--
-- Data for Name: Diagram; Type: TABLE DATA; Schema: public; Owner: db
--

COPY public."Diagram" (id, "createdAt", "updatedAt", title, description, url, "imageUrl", category, diagram) FROM stdin;
\.


--
-- Data for Name: Link; Type: TABLE DATA; Schema: public; Owner: db
--

COPY public."Link" (id, "createdAt", "updatedAt", title, description, url, "imageUrl", category) FROM stdin;
2ef2839a-773c-4e57-8be5-1a3b59599565	2022-04-11 18:38:19.783	2022-04-11 18:41:29.907	Next.js	Fullstack React framework	https://nextjs.org	https://nextjs.org/static/twitter-cards/home.jpg	Open Source
\.


--
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: db
--

COPY public."User" (id, "createdAt", "updatedAt", email, image, role) FROM stdin;
\.


--
-- Data for Name: _LinkToUser; Type: TABLE DATA; Schema: public; Owner: db
--

COPY public."_LinkToUser" ("A", "B") FROM stdin;
\.


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: db
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
351f87cc-2211-47f1-96dc-79a1866d9e56	a2d5683f84872c630a30189953225e11a8709f26eef13693dacb5ed7b782ea75	2022-04-11 17:47:36.079049+00	20220407172905_initial	\N	\N	2022-04-11 17:47:36.053786+00	1
9451e39b-548d-4ba8-8804-c631e84ec89c	49711f7d6a550ac6251905404ab07296d539eaa09258f753df6bc8d0f076d4a3	2022-04-11 17:47:36.089422+00	20220407183158_add_jsonb_field	\N	\N	2022-04-11 17:47:36.080534+00	1
1dc75f4f-cd4b-482d-9a13-c8eb43136b14	140c935ee0ee18aaa30b0785c26ff8ac19aa2ad2a91c3f7178b0931e39e6e9c7	2022-04-11 17:47:36.099081+00	20220411155426_init	\N	\N	2022-04-11 17:47:36.091316+00	1
\.


--
-- Name: Diagram Diagram_pkey; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public."Diagram"
    ADD CONSTRAINT "Diagram_pkey" PRIMARY KEY (id);


--
-- Name: Link Link_pkey; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public."Link"
    ADD CONSTRAINT "Link_pkey" PRIMARY KEY (id);


--
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: User_email_key; Type: INDEX; Schema: public; Owner: db
--

CREATE UNIQUE INDEX "User_email_key" ON public."User" USING btree (email);


--
-- Name: _LinkToUser_AB_unique; Type: INDEX; Schema: public; Owner: db
--

CREATE UNIQUE INDEX "_LinkToUser_AB_unique" ON public."_LinkToUser" USING btree ("A", "B");


--
-- Name: _LinkToUser_B_index; Type: INDEX; Schema: public; Owner: db
--

CREATE INDEX "_LinkToUser_B_index" ON public."_LinkToUser" USING btree ("B");


--
-- Name: _LinkToUser _LinkToUser_A_fkey; Type: FK CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public."_LinkToUser"
    ADD CONSTRAINT "_LinkToUser_A_fkey" FOREIGN KEY ("A") REFERENCES public."Link"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: _LinkToUser _LinkToUser_B_fkey; Type: FK CONSTRAINT; Schema: public; Owner: db
--

ALTER TABLE ONLY public."_LinkToUser"
    ADD CONSTRAINT "_LinkToUser_B_fkey" FOREIGN KEY ("B") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

