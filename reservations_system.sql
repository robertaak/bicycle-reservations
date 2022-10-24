--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Ubuntu 14.5-2.pgdg22.04+2)
-- Dumped by pg_dump version 14.5 (Ubuntu 14.5-2.pgdg22.04+2)

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
-- Name: bicycle_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bicycle_types (
    id bigint NOT NULL,
    type character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- Name: bicycle_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bicycle_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bicycle_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bicycle_types_id_seq OWNED BY public.bicycle_types.id;


--
-- Name: bicycles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bicycles (
    id bigint NOT NULL,
    bicycle_type_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- Name: bicycles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bicycles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bicycles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bicycles_id_seq OWNED BY public.bicycles.id;


--
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- Name: jobs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.jobs (
    id bigint NOT NULL,
    queue character varying(255) NOT NULL,
    payload text NOT NULL,
    attempts smallint NOT NULL,
    reserved_at integer,
    available_at integer NOT NULL,
    created_at integer NOT NULL
);


--
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: personal_access_tokens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.personal_access_tokens (
    id bigint NOT NULL,
    tokenable_type character varying(255) NOT NULL,
    tokenable_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    token character varying(64) NOT NULL,
    abilities text,
    last_used_at timestamp(0) without time zone,
    expires_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;


--
-- Name: reservations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.reservations (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    bicycle_id bigint NOT NULL,
    date date NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


--
-- Name: reservations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.reservations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: reservations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.reservations_id_seq OWNED BY public.reservations.id;


--
-- Name: scheduled_notifications; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.scheduled_notifications (
    id integer NOT NULL,
    target_id character varying(255),
    target_type character varying(255) NOT NULL,
    target text NOT NULL,
    notification_type character varying(255) NOT NULL,
    notification text NOT NULL,
    send_at timestamp(0) without time zone NOT NULL,
    sent_at timestamp(0) without time zone,
    rescheduled_at timestamp(0) without time zone,
    cancelled_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    meta json
);


--
-- Name: scheduled_notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.scheduled_notifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: scheduled_notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.scheduled_notifications_id_seq OWNED BY public.scheduled_notifications.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
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
-- Name: bicycle_types id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bicycle_types ALTER COLUMN id SET DEFAULT nextval('public.bicycle_types_id_seq'::regclass);


--
-- Name: bicycles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bicycles ALTER COLUMN id SET DEFAULT nextval('public.bicycles_id_seq'::regclass);


--
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);


--
-- Name: reservations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reservations ALTER COLUMN id SET DEFAULT nextval('public.reservations_id_seq'::regclass);


--
-- Name: scheduled_notifications id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.scheduled_notifications ALTER COLUMN id SET DEFAULT nextval('public.scheduled_notifications_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: bicycle_types; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.bicycle_types (id, type, created_at, updated_at) FROM stdin;
1	Cube REACTION HYBRID ROOKIE SL 400 Teamline	\N	\N
2	Cube Nuride Hybrid Pro 625 grey´n´blue	\N	\N
3	Cube Nuride Hybrid Performance 625 Allroad Wave darkred´n´red	\N	\N
4	Cube Compact Sport Hybrid 500 black´n´polarsilver	\N	\N
\.


--
-- Data for Name: bicycles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.bicycles (id, bicycle_type_id, created_at, updated_at) FROM stdin;
1	1	\N	\N
2	1	\N	\N
3	2	\N	\N
4	2	\N	\N
5	3	\N	\N
6	3	\N	\N
7	4	\N	\N
8	4	\N	\N
\.


--
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.jobs (id, queue, payload, attempts, reserved_at, available_at, created_at) FROM stdin;
9	default	{"uuid":"ce5258fd-09c3-4c43-9a04-83ced1b51cf3","displayName":"App\\\\Mail\\\\ReservationReminder","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\\\Mail\\\\SendQueuedMailable","command":"O:34:\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\":14:{s:8:\\"mailable\\";O:28:\\"App\\\\Mail\\\\ReservationReminder\\":3:{s:11:\\"reservation\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":5:{s:5:\\"class\\";s:22:\\"App\\\\Models\\\\Reservation\\";s:2:\\"id\\";i:6;s:9:\\"relations\\";a:1:{i:0;s:4:\\"user\\";}s:10:\\"connection\\";s:5:\\"pgsql\\";s:15:\\"collectionClass\\";N;}s:2:\\"to\\";a:1:{i:0;a:2:{s:4:\\"name\\";s:14:\\"Liene Liepiņa\\";s:7:\\"address\\";s:24:\\"darbinieks12@uznemums.lv\\";}}s:6:\\"mailer\\";s:8:\\"failover\\";}s:5:\\"tries\\";N;s:7:\\"timeout\\";N;s:17:\\"shouldBeEncrypted\\";b:0;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:19:\\"chainCatchCallbacks\\";N;s:5:\\"delay\\";N;s:11:\\"afterCommit\\";N;s:10:\\"middleware\\";a:0:{}s:7:\\"chained\\";a:0:{}s:3:\\"job\\";N;}"}}	0	\N	-86400	1666593206
10	default	{"uuid":"4f3ba146-3128-4b5c-8298-dd9c0d21a841","displayName":"App\\\\Mail\\\\ReservationReminder","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\\\Mail\\\\SendQueuedMailable","command":"O:34:\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\":14:{s:8:\\"mailable\\";O:28:\\"App\\\\Mail\\\\ReservationReminder\\":3:{s:11:\\"reservation\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":5:{s:5:\\"class\\";s:22:\\"App\\\\Models\\\\Reservation\\";s:2:\\"id\\";i:7;s:9:\\"relations\\";a:1:{i:0;s:4:\\"user\\";}s:10:\\"connection\\";s:5:\\"pgsql\\";s:15:\\"collectionClass\\";N;}s:2:\\"to\\";a:1:{i:0;a:2:{s:4:\\"name\\";s:14:\\"Liene Liepiņa\\";s:7:\\"address\\";s:24:\\"darbinieks12@uznemums.lv\\";}}s:6:\\"mailer\\";s:8:\\"failover\\";}s:5:\\"tries\\";N;s:7:\\"timeout\\";N;s:17:\\"shouldBeEncrypted\\";b:0;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:19:\\"chainCatchCallbacks\\";N;s:5:\\"delay\\";N;s:11:\\"afterCommit\\";N;s:10:\\"middleware\\";a:0:{}s:7:\\"chained\\";a:0:{}s:3:\\"job\\";N;}"}}	0	\N	-86400	1666593890
11	default	{"uuid":"4cf11819-2a89-4065-a616-2f211d61d70f","displayName":"App\\\\Mail\\\\ReservationReminder","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\\\Mail\\\\SendQueuedMailable","command":"O:34:\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\":14:{s:8:\\"mailable\\";O:28:\\"App\\\\Mail\\\\ReservationReminder\\":3:{s:11:\\"reservation\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":5:{s:5:\\"class\\";s:22:\\"App\\\\Models\\\\Reservation\\";s:2:\\"id\\";i:8;s:9:\\"relations\\";a:1:{i:0;s:4:\\"user\\";}s:10:\\"connection\\";s:5:\\"pgsql\\";s:15:\\"collectionClass\\";N;}s:2:\\"to\\";a:1:{i:0;a:2:{s:4:\\"name\\";s:14:\\"Liene Liepiņa\\";s:7:\\"address\\";s:24:\\"darbinieks12@uznemums.lv\\";}}s:6:\\"mailer\\";s:8:\\"failover\\";}s:5:\\"tries\\";N;s:7:\\"timeout\\";N;s:17:\\"shouldBeEncrypted\\";b:0;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:19:\\"chainCatchCallbacks\\";N;s:5:\\"delay\\";N;s:11:\\"afterCommit\\";N;s:10:\\"middleware\\";a:0:{}s:7:\\"chained\\";a:0:{}s:3:\\"job\\";N;}"}}	0	\N	-86400	1666594417
12	default	{"uuid":"1fa16dac-e7ce-4a5c-bb2c-f0226b3b6488","displayName":"App\\\\Mail\\\\ReservationReminder","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\\\Mail\\\\SendQueuedMailable","command":"O:34:\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\":14:{s:8:\\"mailable\\";O:28:\\"App\\\\Mail\\\\ReservationReminder\\":3:{s:11:\\"reservation\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":5:{s:5:\\"class\\";s:22:\\"App\\\\Models\\\\Reservation\\";s:2:\\"id\\";i:9;s:9:\\"relations\\";a:1:{i:0;s:4:\\"user\\";}s:10:\\"connection\\";s:5:\\"pgsql\\";s:15:\\"collectionClass\\";N;}s:2:\\"to\\";a:1:{i:0;a:2:{s:4:\\"name\\";s:14:\\"Liene Liepiņa\\";s:7:\\"address\\";s:24:\\"darbinieks12@uznemums.lv\\";}}s:6:\\"mailer\\";s:8:\\"failover\\";}s:5:\\"tries\\";N;s:7:\\"timeout\\";N;s:17:\\"shouldBeEncrypted\\";b:0;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:19:\\"chainCatchCallbacks\\";N;s:5:\\"delay\\";N;s:11:\\"afterCommit\\";N;s:10:\\"middleware\\";a:0:{}s:7:\\"chained\\";a:0:{}s:3:\\"job\\";N;}"}}	0	\N	-86400	1666594438
13	default	{"uuid":"1a7f21e0-193d-4bf8-b73c-d67f452d998a","displayName":"App\\\\Mail\\\\ReservationReminder","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\\\Mail\\\\SendQueuedMailable","command":"O:34:\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\":14:{s:8:\\"mailable\\";O:28:\\"App\\\\Mail\\\\ReservationReminder\\":3:{s:11:\\"reservation\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":5:{s:5:\\"class\\";s:22:\\"App\\\\Models\\\\Reservation\\";s:2:\\"id\\";i:18;s:9:\\"relations\\";a:1:{i:0;s:4:\\"user\\";}s:10:\\"connection\\";s:5:\\"pgsql\\";s:15:\\"collectionClass\\";N;}s:2:\\"to\\";a:1:{i:0;a:2:{s:4:\\"name\\";s:14:\\"Liene Liepiņa\\";s:7:\\"address\\";s:24:\\"darbinieks12@uznemums.lv\\";}}s:6:\\"mailer\\";s:8:\\"failover\\";}s:5:\\"tries\\";N;s:7:\\"timeout\\";N;s:17:\\"shouldBeEncrypted\\";b:0;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:19:\\"chainCatchCallbacks\\";N;s:5:\\"delay\\";N;s:11:\\"afterCommit\\";N;s:10:\\"middleware\\";a:0:{}s:7:\\"chained\\";a:0:{}s:3:\\"job\\";N;}"}}	0	\N	-86400	1666594974
14	default	{"uuid":"8336a1a0-f4b9-4fd3-9836-c227483f9be7","displayName":"App\\\\Mail\\\\ReservationReminder","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\\\Mail\\\\SendQueuedMailable","command":"O:34:\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\":14:{s:8:\\"mailable\\";O:28:\\"App\\\\Mail\\\\ReservationReminder\\":3:{s:11:\\"reservation\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":5:{s:5:\\"class\\";s:22:\\"App\\\\Models\\\\Reservation\\";s:2:\\"id\\";i:19;s:9:\\"relations\\";a:1:{i:0;s:4:\\"user\\";}s:10:\\"connection\\";s:5:\\"pgsql\\";s:15:\\"collectionClass\\";N;}s:2:\\"to\\";a:1:{i:0;a:2:{s:4:\\"name\\";s:14:\\"Liene Liepiņa\\";s:7:\\"address\\";s:24:\\"darbinieks12@uznemums.lv\\";}}s:6:\\"mailer\\";s:8:\\"failover\\";}s:5:\\"tries\\";N;s:7:\\"timeout\\";N;s:17:\\"shouldBeEncrypted\\";b:0;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:19:\\"chainCatchCallbacks\\";N;s:5:\\"delay\\";N;s:11:\\"afterCommit\\";N;s:10:\\"middleware\\";a:0:{}s:7:\\"chained\\";a:0:{}s:3:\\"job\\";N;}"}}	0	\N	-86400	1666595087
15	default	{"uuid":"81ffd1c0-7bbc-449e-b822-43aee5931c7d","displayName":"App\\\\Mail\\\\ReservationReminder","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\\\Mail\\\\SendQueuedMailable","command":"O:34:\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\":14:{s:8:\\"mailable\\";O:28:\\"App\\\\Mail\\\\ReservationReminder\\":3:{s:11:\\"reservation\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":5:{s:5:\\"class\\";s:22:\\"App\\\\Models\\\\Reservation\\";s:2:\\"id\\";i:42;s:9:\\"relations\\";a:1:{i:0;s:4:\\"user\\";}s:10:\\"connection\\";s:5:\\"pgsql\\";s:15:\\"collectionClass\\";N;}s:2:\\"to\\";a:1:{i:0;a:2:{s:4:\\"name\\";s:14:\\"Liene Liepiņa\\";s:7:\\"address\\";s:24:\\"darbinieks12@uznemums.lv\\";}}s:6:\\"mailer\\";s:8:\\"failover\\";}s:5:\\"tries\\";N;s:7:\\"timeout\\";N;s:17:\\"shouldBeEncrypted\\";b:0;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:19:\\"chainCatchCallbacks\\";N;s:5:\\"delay\\";N;s:11:\\"afterCommit\\";N;s:10:\\"middleware\\";a:0:{}s:7:\\"chained\\";a:0:{}s:3:\\"job\\";N;}"}}	0	\N	-86400	1666597449
16	default	{"uuid":"7b70aa1b-f6fa-4599-9233-ede9c96c3445","displayName":"App\\\\Mail\\\\ReservationReminder","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\\\Mail\\\\SendQueuedMailable","command":"O:34:\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\":14:{s:8:\\"mailable\\";O:28:\\"App\\\\Mail\\\\ReservationReminder\\":3:{s:11:\\"reservation\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":5:{s:5:\\"class\\";s:22:\\"App\\\\Models\\\\Reservation\\";s:2:\\"id\\";i:48;s:9:\\"relations\\";a:1:{i:0;s:4:\\"user\\";}s:10:\\"connection\\";s:5:\\"pgsql\\";s:15:\\"collectionClass\\";N;}s:2:\\"to\\";a:1:{i:0;a:2:{s:4:\\"name\\";s:11:\\"Liene Liepa\\";s:7:\\"address\\";s:24:\\"darbinieks11@uznemums.lv\\";}}s:6:\\"mailer\\";s:8:\\"failover\\";}s:5:\\"tries\\";N;s:7:\\"timeout\\";N;s:17:\\"shouldBeEncrypted\\";b:0;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:19:\\"chainCatchCallbacks\\";N;s:5:\\"delay\\";N;s:11:\\"afterCommit\\";N;s:10:\\"middleware\\";a:0:{}s:7:\\"chained\\";a:0:{}s:3:\\"job\\";N;}"}}	0	\N	-86400	1666599417
17	default	{"uuid":"0d16f833-5b3f-494d-8580-5a0fd9ed9cbd","displayName":"App\\\\Mail\\\\ReservationReminder","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\\\Mail\\\\SendQueuedMailable","command":"O:34:\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\":14:{s:8:\\"mailable\\";O:28:\\"App\\\\Mail\\\\ReservationReminder\\":3:{s:11:\\"reservation\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":5:{s:5:\\"class\\";s:22:\\"App\\\\Models\\\\Reservation\\";s:2:\\"id\\";i:50;s:9:\\"relations\\";a:1:{i:0;s:4:\\"user\\";}s:10:\\"connection\\";s:5:\\"pgsql\\";s:15:\\"collectionClass\\";N;}s:2:\\"to\\";a:1:{i:0;a:2:{s:4:\\"name\\";s:11:\\"Liene Liepa\\";s:7:\\"address\\";s:24:\\"darbinieks11@uznemums.lv\\";}}s:6:\\"mailer\\";s:8:\\"failover\\";}s:5:\\"tries\\";N;s:7:\\"timeout\\";N;s:17:\\"shouldBeEncrypted\\";b:0;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:19:\\"chainCatchCallbacks\\";N;s:5:\\"delay\\";N;s:11:\\"afterCommit\\";N;s:10:\\"middleware\\";a:0:{}s:7:\\"chained\\";a:0:{}s:3:\\"job\\";N;}"}}	0	\N	-86400	1666599778
18	default	{"uuid":"2a20ce38-8a91-4fc1-a946-381aebe64761","displayName":"App\\\\Mail\\\\ReservationReminder","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\\\Mail\\\\SendQueuedMailable","command":"O:34:\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\":14:{s:8:\\"mailable\\";O:28:\\"App\\\\Mail\\\\ReservationReminder\\":3:{s:11:\\"reservation\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":5:{s:5:\\"class\\";s:22:\\"App\\\\Models\\\\Reservation\\";s:2:\\"id\\";i:53;s:9:\\"relations\\";a:1:{i:0;s:4:\\"user\\";}s:10:\\"connection\\";s:5:\\"pgsql\\";s:15:\\"collectionClass\\";N;}s:2:\\"to\\";a:1:{i:0;a:2:{s:4:\\"name\\";s:14:\\"Maija Ozoliņa\\";s:7:\\"address\\";s:24:\\"darbinieks16@uznemums.lv\\";}}s:6:\\"mailer\\";s:8:\\"failover\\";}s:5:\\"tries\\";N;s:7:\\"timeout\\";N;s:17:\\"shouldBeEncrypted\\";b:0;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:19:\\"chainCatchCallbacks\\";N;s:5:\\"delay\\";N;s:11:\\"afterCommit\\";N;s:10:\\"middleware\\";a:0:{}s:7:\\"chained\\";a:0:{}s:3:\\"job\\";N;}"}}	0	\N	-86400	1666600185
51	default	{"uuid":"6c760e30-44f4-438d-bd8d-cb4dd590cdf8","displayName":"App\\\\Mail\\\\ReservationReminder","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"failOnTimeout":false,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"Illuminate\\\\Mail\\\\SendQueuedMailable","command":"O:34:\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\":14:{s:8:\\"mailable\\";O:28:\\"App\\\\Mail\\\\ReservationReminder\\":3:{s:11:\\"reservation\\";O:45:\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\":5:{s:5:\\"class\\";s:22:\\"App\\\\Models\\\\Reservation\\";s:2:\\"id\\";i:86;s:9:\\"relations\\";a:1:{i:0;s:4:\\"user\\";}s:10:\\"connection\\";s:5:\\"pgsql\\";s:15:\\"collectionClass\\";N;}s:2:\\"to\\";a:1:{i:0;a:2:{s:4:\\"name\\";s:11:\\"Maija Ozola\\";s:7:\\"address\\";s:24:\\"darbinieks15@uznemums.lv\\";}}s:6:\\"mailer\\";s:8:\\"failover\\";}s:5:\\"tries\\";N;s:7:\\"timeout\\";N;s:17:\\"shouldBeEncrypted\\";b:0;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:19:\\"chainCatchCallbacks\\";N;s:5:\\"delay\\";N;s:11:\\"afterCommit\\";N;s:10:\\"middleware\\";a:0:{}s:7:\\"chained\\";a:0:{}s:3:\\"job\\";N;}"}}	0	\N	-86400	1666600477
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.migrations (id, migration, batch) FROM stdin;
1	2014_10_12_000000_create_users_table	1
2	2014_10_12_100000_create_password_resets_table	1
3	2019_02_25_231036_create_scheduled_notifications_table	1
4	2019_08_19_000000_create_failed_jobs_table	1
5	2019_12_14_000001_create_personal_access_tokens_table	1
6	2021_09_10_130000_add_meta_to_scheduled_notifications	1
7	2022_10_09_080317_create_bicycle-types_table	1
8	2022_10_09_080330_create_bicycles_table	1
9	2022_10_09_080344_create_reservations_table	1
10	2022_10_09_193339_add_soft_deletes_to_reservations_table	1
11	2022_10_17_170144_create_jobs_table	2
12	2022_10_24_055923_create_reservations_table	3
13	2022_10_24_060120_add_soft_deletes_to_reservations_table	4
14	2022_10_24_060214_add_soft_deletes_to_reservations_table	5
\.


--
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: reservations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.reservations (id, user_id, bicycle_id, date, created_at, updated_at, deleted_at) FROM stdin;
7	16	5	2022-11-17	2022-10-24 06:44:50	2022-10-24 06:44:56	2022-10-24 06:44:56
1	16	1	2022-10-27	2022-10-24 06:33:26	2022-10-24 06:49:45	2022-10-24 06:49:45
8	16	2	2022-10-27	2022-10-24 06:53:37	2022-10-24 06:53:48	2022-10-24 06:53:48
9	16	1	2022-10-28	2022-10-24 06:53:58	2022-10-24 06:54:16	2022-10-24 06:54:16
12	7	3	2022-10-25	\N	\N	\N
13	8	4	2022-10-25	\N	\N	\N
14	9	5	2022-10-25	\N	\N	\N
15	10	6	2022-10-25	\N	\N	\N
16	11	7	2022-10-25	\N	\N	\N
17	12	8	2022-10-25	\N	\N	\N
18	16	4	2022-10-24	2022-10-24 07:02:54	2022-10-24 07:02:54	\N
19	16	5	2022-10-24	2022-10-24 07:04:47	2022-10-24 07:04:50	2022-10-24 07:04:50
42	16	5	2022-10-26	2022-10-24 07:44:09	2022-10-24 07:44:09	\N
48	15	4	2022-10-26	2022-10-24 08:16:56	2022-10-24 08:16:56	\N
50	15	6	2022-10-28	2022-10-24 08:22:58	2022-10-24 08:22:58	\N
53	20	7	2022-10-27	2022-10-24 08:29:45	2022-10-24 08:29:45	\N
86	19	6	2022-10-26	2022-10-24 08:34:37	2022-10-24 08:34:37	\N
\.


--
-- Data for Name: scheduled_notifications; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.scheduled_notifications (id, target_id, target_type, target, notification_type, notification, send_at, sent_at, rescheduled_at, cancelled_at, created_at, updated_at, meta) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (id, name, email, password, remember_token, created_at, updated_at) FROM stdin;
5	Jānis Bērziņš	darbinieks1@uznemums.lv	$2y$10$jCjjMcNOndgZeIpkL8QDkOmTo4qOcTqohfghTQuT9DA/c8g6Rby62	\N	2022-10-13 17:34:48	2022-10-13 17:34:48
6	Jānis Bērzs	darbinieks2@uznemums.lv	$2y$10$o11un7M0pc34U9eXiHepEu/ZSN957a32hcqTWUc10HWFqHWJkgNM2	\N	2022-10-13 17:36:39	2022-10-13 17:36:39
7	Juris Liepa	darbinieks3@uznemums.lv	$2y$10$LWD2LPX3fct.bZ.ZITtWKetAbEnKBVdIk.L1qN1u8sQ.Gw0OnD0Ja	\N	2022-10-13 17:37:03	2022-10-13 17:37:03
8	Juris Liepiņš	darbinieks4@uznemums.lv	$2y$10$crlsGsRWQWFNrmdHiXiWTuwmT6gewBlUMbjf7kUg6spSz4uxlX5EO	\N	2022-10-13 17:37:54	2022-10-13 17:37:54
9	Pēteris Kalns	darbinieks5@uznemums.lv	$2y$10$Dqs3iQVEzU/kZmb0HTNoyeDecY2zJKL0vFV90P1hLHzqmCzleHEf6	\N	2022-10-13 17:38:39	2022-10-13 17:38:39
10	Pēteris Kalniņš	darbinieks6@uznemums.lv	$2y$10$PPc.a8Q.N2bE65D4a2wPz.ELsngNHjGFjtqM2NFlE7yR8vBt1ufIS	\N	2022-10-13 17:39:06	2022-10-13 17:39:06
11	Mārtiņš Ozols	darbinieks7@uznemums.lv	$2y$10$ffcpscPfDIgeVXaA5NEHvuNxxmljqaeJA4o8HqTILFA/CnXzQHzBy	\N	2022-10-13 17:40:22	2022-10-13 17:40:22
12	Mārtiņš Ozoliņš	darbinieks8@uznemums.lv	$2y$10$uxUOwjWTW8J2w9oQBzDCmeEkGb2KmEJDtft2bhHqXBea9XyTaKLHK	\N	2022-10-13 17:40:48	2022-10-13 17:40:48
13	Anna Bērza	darbinieks9@uznemums.lv	$2y$10$klBpppSZGSDLxefSSZ7D1uf0EDG7yGoAkIP18UztyrfsewMjaqR7S	\N	2022-10-13 17:41:17	2022-10-13 17:41:17
14	Anna Bērziņa	darbinieks10@uznemums.lv	$2y$10$gR1oW62c.ODBZ//L4ozkVOw3DlibtJT0GiYcb.e57anPsXAeV9xUe	\N	2022-10-13 17:42:01	2022-10-13 17:42:01
15	Liene Liepa	darbinieks11@uznemums.lv	$2y$10$pJI0fQU2ViFT.T84k0nWlOo5QbSE0b0tx5XymVhDOy.ts7E3ngnTS	\N	2022-10-13 17:42:38	2022-10-13 17:42:38
16	Liene Liepiņa	darbinieks12@uznemums.lv	$2y$10$CCwDg6v/rHFzqIX6cypRuumBp9TWHTK5ZGUNVQN6XQwOTAJJaK0bG	\N	2022-10-13 17:43:18	2022-10-13 17:43:18
17	Māra Kalna	darbinieks13@uznemums.lv	$2y$10$Pt//uR5ujz.nj9kvgXRO8Os9hK8mSZr1vylXb3DVYbc/5v2Qo4Pce	\N	2022-10-13 17:44:05	2022-10-13 17:44:05
18	Māra Kalniņa	darbinieks14@uznemums.lv	$2y$10$t8trT3Jsu6c8rDUp4NZCue6ds0UmWlres/Scu85nHu755kvPkyAni	\N	2022-10-13 17:44:35	2022-10-13 17:44:35
19	Maija Ozola	darbinieks15@uznemums.lv	$2y$10$NA52rNYeDIV3pT7dXig.UO8P9BzYmn1HDbip6vvsNHUJcYRqBUbZ.	\N	2022-10-13 17:47:37	2022-10-13 17:47:37
20	Maija Ozoliņa	darbinieks16@uznemums.lv	$2y$10$CaSRjEv13aAxMdUnFy6LtOhTbw8u6k9DVqfD5UnSa4ycd.xykLr..	\N	2022-10-13 17:48:02	2022-10-13 17:48:02
\.


--
-- Name: bicycle_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bicycle_types_id_seq', 4, true);


--
-- Name: bicycles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bicycles_id_seq', 8, true);


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.jobs_id_seq', 51, true);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.migrations_id_seq', 14, true);


--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 1, false);


--
-- Name: reservations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.reservations_id_seq', 86, true);


--
-- Name: scheduled_notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.scheduled_notifications_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 20, true);


--
-- Name: bicycle_types bicycle_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bicycle_types
    ADD CONSTRAINT bicycle_types_pkey PRIMARY KEY (id);


--
-- Name: bicycles bicycles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bicycles
    ADD CONSTRAINT bicycles_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: personal_access_tokens personal_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);


--
-- Name: personal_access_tokens personal_access_tokens_token_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);


--
-- Name: reservations reservations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reservations
    ADD CONSTRAINT reservations_pkey PRIMARY KEY (id);


--
-- Name: scheduled_notifications scheduled_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.scheduled_notifications
    ADD CONSTRAINT scheduled_notifications_pkey PRIMARY KEY (id);


--
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: jobs_queue_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);


--
-- Name: personal_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);


--
-- Name: bicycles bicycles_bicycle_type_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bicycles
    ADD CONSTRAINT bicycles_bicycle_type_id_foreign FOREIGN KEY (bicycle_type_id) REFERENCES public.bicycle_types(id) ON DELETE CASCADE;


--
-- Name: reservations reservations_bicycle_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reservations
    ADD CONSTRAINT reservations_bicycle_id_foreign FOREIGN KEY (bicycle_id) REFERENCES public.bicycles(id) ON DELETE CASCADE;


--
-- Name: reservations reservations_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reservations
    ADD CONSTRAINT reservations_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

