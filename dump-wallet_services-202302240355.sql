--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9
-- Dumped by pg_dump version 13.6

-- Started on 2023-02-24 03:55:08

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
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 2865 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 207 (class 1259 OID 33581)
-- Name: source_of_funds; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.source_of_funds (
    id bigint NOT NULL,
    name text
);


ALTER TABLE public.source_of_funds OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 33579)
-- Name: source_of_funds_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.source_of_funds_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.source_of_funds_id_seq OWNER TO postgres;

--
-- TOC entry 2866 (class 0 OID 0)
-- Dependencies: 206
-- Name: source_of_funds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.source_of_funds_id_seq OWNED BY public.source_of_funds.id;


--
-- TOC entry 209 (class 1259 OID 33592)
-- Name: transactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transactions (
    id bigint NOT NULL,
    source_of_fund_id bigint,
    user_id bigint,
    destination_id bigint,
    amount bigint,
    description text,
    category text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone
);


ALTER TABLE public.transactions OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 33590)
-- Name: transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transactions_id_seq OWNER TO postgres;

--
-- TOC entry 2867 (class 0 OID 0)
-- Dependencies: 208
-- Name: transactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transactions_id_seq OWNED BY public.transactions.id;


--
-- TOC entry 203 (class 1259 OID 33554)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name text,
    email text,
    password text
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 33552)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 2868 (class 0 OID 0)
-- Dependencies: 202
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 205 (class 1259 OID 33565)
-- Name: wallets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wallets (
    id bigint NOT NULL,
    user_id bigint,
    number text,
    balance bigint
);


ALTER TABLE public.wallets OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 33563)
-- Name: wallets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.wallets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wallets_id_seq OWNER TO postgres;

--
-- TOC entry 2869 (class 0 OID 0)
-- Dependencies: 204
-- Name: wallets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.wallets_id_seq OWNED BY public.wallets.id;


--
-- TOC entry 2711 (class 2604 OID 33584)
-- Name: source_of_funds id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.source_of_funds ALTER COLUMN id SET DEFAULT nextval('public.source_of_funds_id_seq'::regclass);


--
-- TOC entry 2712 (class 2604 OID 33595)
-- Name: transactions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions ALTER COLUMN id SET DEFAULT nextval('public.transactions_id_seq'::regclass);


--
-- TOC entry 2709 (class 2604 OID 33557)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 2710 (class 2604 OID 33568)
-- Name: wallets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallets ALTER COLUMN id SET DEFAULT nextval('public.wallets_id_seq'::regclass);


--
-- TOC entry 2857 (class 0 OID 33581)
-- Dependencies: 207
-- Data for Name: source_of_funds; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.source_of_funds (id, name) FROM stdin;
1	topup
2	transfer
3	witdraw
\.


--
-- TOC entry 2859 (class 0 OID 33592)
-- Dependencies: 209
-- Data for Name: transactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transactions (id, source_of_fund_id, user_id, destination_id, amount, description, category, created_at, updated_at, deleted_at) FROM stdin;
1	1	1	1	5000000	Top Up from topup	Top Up	2023-02-24 01:35:45.326078+07	2023-02-24 01:35:45.326078+07	\N
2	\N	2	1	60000	transfer agus	Receive Money	2023-02-24 02:04:01.326103+07	2023-02-24 02:04:01.326103+07	\N
3	\N	1	2	60000	transfer agus	Send Money	2023-02-24 02:04:01.326622+07	2023-02-24 02:04:01.326622+07	\N
4	\N	1	1	50000		Witdraw Money	2023-02-24 02:05:31.495738+07	2023-02-24 02:05:31.495738+07	\N
5	\N	1	1	50000		Witdraw Money	2023-02-24 02:05:35.013538+07	2023-02-24 02:05:35.013538+07	\N
\.


--
-- TOC entry 2853 (class 0 OID 33554)
-- Dependencies: 203
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, password) FROM stdin;
1	fauzi	fauzi@user.com	$2a$04$BCOdU/jL1iyPYnnQXis.2Os.HXsjD7/Mxon4kwwPmbnWGFCl83fia
2	agus	agus@user.com	$2a$04$bGSUiGlIy1ysFJntMkCLoO0NiTb9rjeN9/Pedlpe0lFT3dr.RW5EO
\.


--
-- TOC entry 2855 (class 0 OID 33565)
-- Dependencies: 205
-- Data for Name: wallets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wallets (id, user_id, number, balance) FROM stdin;
2	2	100002	60000
1	1	100001	4840000
\.


--
-- TOC entry 2870 (class 0 OID 0)
-- Dependencies: 206
-- Name: source_of_funds_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.source_of_funds_id_seq', 3, true);


--
-- TOC entry 2871 (class 0 OID 0)
-- Dependencies: 208
-- Name: transactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transactions_id_seq', 5, true);


--
-- TOC entry 2872 (class 0 OID 0)
-- Dependencies: 202
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- TOC entry 2873 (class 0 OID 0)
-- Dependencies: 204
-- Name: wallets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.wallets_id_seq', 2, true);


--
-- TOC entry 2718 (class 2606 OID 33589)
-- Name: source_of_funds source_of_funds_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.source_of_funds
    ADD CONSTRAINT source_of_funds_pkey PRIMARY KEY (id);


--
-- TOC entry 2721 (class 2606 OID 33600)
-- Name: transactions transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 33562)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 33573)
-- Name: wallets wallets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallets
    ADD CONSTRAINT wallets_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 1259 OID 33616)
-- Name: idx_transactions_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_transactions_deleted_at ON public.transactions USING btree (deleted_at);


--
-- TOC entry 2723 (class 2606 OID 33601)
-- Name: transactions fk_transactions_source_of_fund; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT fk_transactions_source_of_fund FOREIGN KEY (source_of_fund_id) REFERENCES public.source_of_funds(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 2724 (class 2606 OID 33606)
-- Name: transactions fk_transactions_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT fk_transactions_user FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 2725 (class 2606 OID 33611)
-- Name: transactions fk_transactions_wallet; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT fk_transactions_wallet FOREIGN KEY (destination_id) REFERENCES public.wallets(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 2722 (class 2606 OID 33574)
-- Name: wallets fk_wallets_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wallets
    ADD CONSTRAINT fk_wallets_user FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


-- Completed on 2023-02-24 03:55:08

--
-- PostgreSQL database dump complete
--

