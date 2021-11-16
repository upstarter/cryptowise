--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.23
-- Dumped by pg_dump version 9.6.23

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

SET default_with_oids = false;

--
-- Name: accounts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.accounts (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    type character varying(255) DEFAULT 'basic'::character varying NOT NULL,
    status character varying(255) DEFAULT 'registered'::character varying NOT NULL,
    active boolean DEFAULT false NOT NULL,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


--
-- Name: accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.accounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.accounts_id_seq OWNED BY public.accounts.id;


--
-- Name: credentials; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.credentials (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    source character varying(255) DEFAULT 'password'::character varying NOT NULL,
    token character varying(255) NOT NULL,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


--
-- Name: credentials_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.credentials_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: credentials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.credentials_id_seq OWNED BY public.credentials.id;


--
-- Name: daily_market_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.daily_market_history (
    id bigint NOT NULL,
    symbol character varying(255),
    date date,
    close numeric,
    open numeric,
    high numeric,
    low numeric,
    volumefrom numeric,
    volumeto numeric,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    token_id bigint
);


--
-- Name: daily_market_history_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.daily_market_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: daily_market_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.daily_market_history_id_seq OWNED BY public.daily_market_history.id;


--
-- Name: groupings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.groupings (
    id bigint NOT NULL,
    member_id integer NOT NULL,
    member_type character varying(255) NOT NULL,
    group_id integer NOT NULL,
    group_type character varying(255) NOT NULL,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


--
-- Name: groupings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.groupings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: groupings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.groupings_id_seq OWNED BY public.groupings.id;


--
-- Name: groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.groups (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    short_desc character varying(255) NOT NULL,
    type character varying(255),
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


--
-- Name: groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.groups_id_seq OWNED BY public.groups.id;


--
-- Name: leads; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.leads (
    id bigint NOT NULL,
    full_name character varying(255),
    email character varying(255) NOT NULL,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


--
-- Name: leads_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.leads_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: leads_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.leads_id_seq OWNED BY public.leads.id;


--
-- Name: ontologies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ontologies (
    id bigint NOT NULL,
    subject_id integer,
    representation_id integer,
    perspective_id integer,
    constraint_id integer,
    context_id integer,
    context_type integer,
    class_id integer,
    class_type character varying(255),
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


--
-- Name: ontologies_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ontologies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ontologies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ontologies_id_seq OWNED BY public.ontologies.id;


--
-- Name: portfolios; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.portfolios (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


--
-- Name: portfolios_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.portfolios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: portfolios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.portfolios_id_seq OWNED BY public.portfolios.id;


--
-- Name: portfolios_tokens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.portfolios_tokens (
    id bigint NOT NULL,
    token_id bigint NOT NULL,
    weight integer DEFAULT 0,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    user_id bigint NOT NULL,
    portfolio_id integer
);


--
-- Name: portfolios_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.portfolios_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: portfolios_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.portfolios_tokens_id_seq OWNED BY public.portfolios_tokens.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.posts (
    id bigint NOT NULL,
    type character varying(255) NOT NULL,
    parent_id integer,
    title character varying(255),
    description text,
    body text,
    active boolean DEFAULT false NOT NULL,
    is_public boolean DEFAULT false NOT NULL,
    status character varying(255),
    user_id bigint NOT NULL,
    thread_id bigint NOT NULL,
    cached_votes_for_total integer,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- Name: proposals; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.proposals (
    id bigint NOT NULL,
    type character varying(255) NOT NULL,
    title character varying(255) NOT NULL,
    description character varying(255),
    active boolean DEFAULT false NOT NULL,
    is_public boolean DEFAULT false NOT NULL,
    station character varying(255) NOT NULL,
    status character varying(255),
    user_id bigint NOT NULL,
    cached_votes_for_total integer,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


--
-- Name: proposals_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.proposals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: proposals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.proposals_id_seq OWNED BY public.proposals.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.roles (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


--
-- Name: strategies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.strategies (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    short_desc character varying(255) NOT NULL,
    long_desc text,
    type character varying(255) NOT NULL,
    tagging_id bigint,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


--
-- Name: strategies_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.strategies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: strategies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.strategies_id_seq OWNED BY public.strategies.id;


--
-- Name: systems; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.systems (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    short_desc character varying(255),
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


--
-- Name: systems_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.systems_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: systems_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.systems_id_seq OWNED BY public.systems.id;


--
-- Name: taggings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.taggings (
    id bigint NOT NULL,
    tagged_id integer,
    topic_id integer,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


--
-- Name: taggings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.taggings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: taggings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.taggings_id_seq OWNED BY public.taggings.id;


--
-- Name: tags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tags (
    id bigint NOT NULL,
    name character varying(255),
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tags_id_seq OWNED BY public.tags.id;


--
-- Name: threads; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.threads (
    id bigint NOT NULL,
    type character varying(255) NOT NULL,
    title character varying(255),
    description text,
    body text,
    active boolean DEFAULT false NOT NULL,
    is_public boolean DEFAULT false NOT NULL,
    status character varying(255),
    topic_id bigint,
    user_id bigint NOT NULL,
    cached_votes_for_total integer,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


--
-- Name: threads_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.threads_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: threads_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.threads_id_seq OWNED BY public.threads.id;


--
-- Name: tokens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tokens (
    id bigint NOT NULL,
    symbol character varying(255) NOT NULL,
    name character varying(255),
    site character varying(255),
    description text,
    img_url character varying(255),
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    token_info jsonb
);


--
-- Name: tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tokens_id_seq OWNED BY public.tokens.id;


--
-- Name: tokens_tags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tokens_tags (
    id bigint NOT NULL,
    token_id bigint,
    tag_id bigint,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


--
-- Name: tokens_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tokens_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tokens_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tokens_tags_id_seq OWNED BY public.tokens_tags.id;


--
-- Name: topics; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.topics (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    description text NOT NULL,
    slug character varying(255),
    weight integer DEFAULT 100 NOT NULL,
    parent_id integer,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


--
-- Name: topics_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.topics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: topics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.topics_id_seq OWNED BY public.topics.id;


--
-- Name: topics_threads; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.topics_threads (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    thread_id bigint NOT NULL,
    topic_id bigint NOT NULL,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


--
-- Name: topics_threads_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.topics_threads_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: topics_threads_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.topics_threads_id_seq OWNED BY public.topics_threads.id;


--
-- Name: topics_tokens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.topics_tokens (
    id bigint NOT NULL,
    topic_id bigint NOT NULL,
    token_id bigint NOT NULL,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


--
-- Name: topics_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.topics_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: topics_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.topics_tokens_id_seq OWNED BY public.topics_tokens.id;


--
-- Name: user_groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_groups (
    id bigint NOT NULL,
    member_id integer NOT NULL,
    member_type character varying(255) NOT NULL,
    group_id integer NOT NULL,
    group_type character varying(255) NOT NULL,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


--
-- Name: user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.user_groups_id_seq OWNED BY public.user_groups.id;


--
-- Name: user_portfolios; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_portfolios (
    id bigint NOT NULL,
    portfolio_id bigint NOT NULL,
    user_id bigint NOT NULL,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


--
-- Name: user_portfolios_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.user_portfolios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_portfolios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.user_portfolios_id_seq OWNED BY public.user_portfolios.id;


--
-- Name: user_profiles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_profiles (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


--
-- Name: user_profiles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.user_profiles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_profiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.user_profiles_id_seq OWNED BY public.user_profiles.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying(255) NOT NULL,
    first_name character varying(255),
    last_name character varying(255),
    nickname character varying(255),
    phone character varying(255),
    avatar_url character varying(255),
    terms_accepted boolean,
    confirmation_token character varying(255),
    confirmation_sent_at timestamp(0) without time zone,
    confirmed_at timestamp(0) without time zone,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp(0) without time zone,
    sign_in_count integer DEFAULT 0,
    last_sign_in_ip character varying(255),
    last_sign_in_at timestamp(0) without time zone,
    current_sign_in_ip character varying(255),
    current_sign_in_at timestamp(0) without time zone,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
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
-- Name: users_roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users_roles (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    role_id bigint NOT NULL,
    user_profile_id bigint NOT NULL,
    active boolean DEFAULT false NOT NULL,
    type character varying(255) DEFAULT 'basic'::character varying NOT NULL,
    status character varying(255) DEFAULT 'initial'::character varying NOT NULL,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


--
-- Name: users_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_roles_id_seq OWNED BY public.users_roles.id;


--
-- Name: users_tokens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users_tokens (
    id bigint NOT NULL,
    token_id bigint NOT NULL,
    user_id bigint NOT NULL,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


--
-- Name: users_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_tokens_id_seq OWNED BY public.users_tokens.id;


--
-- Name: users_topics; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users_topics (
    id bigint NOT NULL,
    topic_id bigint NOT NULL,
    user_id bigint NOT NULL,
    inserted_at timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL
);


--
-- Name: users_topics_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_topics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_topics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_topics_id_seq OWNED BY public.users_topics.id;


--
-- Name: accounts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.accounts ALTER COLUMN id SET DEFAULT nextval('public.accounts_id_seq'::regclass);


--
-- Name: credentials id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.credentials ALTER COLUMN id SET DEFAULT nextval('public.credentials_id_seq'::regclass);


--
-- Name: daily_market_history id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.daily_market_history ALTER COLUMN id SET DEFAULT nextval('public.daily_market_history_id_seq'::regclass);


--
-- Name: groupings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.groupings ALTER COLUMN id SET DEFAULT nextval('public.groupings_id_seq'::regclass);


--
-- Name: groups id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.groups ALTER COLUMN id SET DEFAULT nextval('public.groups_id_seq'::regclass);


--
-- Name: leads id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.leads ALTER COLUMN id SET DEFAULT nextval('public.leads_id_seq'::regclass);


--
-- Name: ontologies id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ontologies ALTER COLUMN id SET DEFAULT nextval('public.ontologies_id_seq'::regclass);


--
-- Name: portfolios id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.portfolios ALTER COLUMN id SET DEFAULT nextval('public.portfolios_id_seq'::regclass);


--
-- Name: portfolios_tokens id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.portfolios_tokens ALTER COLUMN id SET DEFAULT nextval('public.portfolios_tokens_id_seq'::regclass);


--
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- Name: proposals id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.proposals ALTER COLUMN id SET DEFAULT nextval('public.proposals_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: strategies id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strategies ALTER COLUMN id SET DEFAULT nextval('public.strategies_id_seq'::regclass);


--
-- Name: systems id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.systems ALTER COLUMN id SET DEFAULT nextval('public.systems_id_seq'::regclass);


--
-- Name: taggings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.taggings ALTER COLUMN id SET DEFAULT nextval('public.taggings_id_seq'::regclass);


--
-- Name: tags id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tags ALTER COLUMN id SET DEFAULT nextval('public.tags_id_seq'::regclass);


--
-- Name: threads id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.threads ALTER COLUMN id SET DEFAULT nextval('public.threads_id_seq'::regclass);


--
-- Name: tokens id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tokens ALTER COLUMN id SET DEFAULT nextval('public.tokens_id_seq'::regclass);


--
-- Name: tokens_tags id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tokens_tags ALTER COLUMN id SET DEFAULT nextval('public.tokens_tags_id_seq'::regclass);


--
-- Name: topics id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.topics ALTER COLUMN id SET DEFAULT nextval('public.topics_id_seq'::regclass);


--
-- Name: topics_threads id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.topics_threads ALTER COLUMN id SET DEFAULT nextval('public.topics_threads_id_seq'::regclass);


--
-- Name: topics_tokens id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.topics_tokens ALTER COLUMN id SET DEFAULT nextval('public.topics_tokens_id_seq'::regclass);


--
-- Name: user_groups id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_groups ALTER COLUMN id SET DEFAULT nextval('public.user_groups_id_seq'::regclass);


--
-- Name: user_portfolios id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_portfolios ALTER COLUMN id SET DEFAULT nextval('public.user_portfolios_id_seq'::regclass);


--
-- Name: user_profiles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_profiles ALTER COLUMN id SET DEFAULT nextval('public.user_profiles_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: users_roles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_roles ALTER COLUMN id SET DEFAULT nextval('public.users_roles_id_seq'::regclass);


--
-- Name: users_tokens id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_tokens ALTER COLUMN id SET DEFAULT nextval('public.users_tokens_id_seq'::regclass);


--
-- Name: users_topics id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_topics ALTER COLUMN id SET DEFAULT nextval('public.users_topics_id_seq'::regclass);


--
-- Data for Name: accounts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.accounts (id, user_id, type, status, active, inserted_at, updated_at) FROM stdin;
13	14	basic	registered	f	2019-10-31 20:52:51	2019-10-31 20:52:51
14	15	basic	registered	f	2019-12-11 12:36:37	2019-12-11 12:36:37
15	18	basic	registered	f	2019-12-11 17:34:43	2019-12-11 17:34:43
16	19	basic	registered	f	2019-12-11 22:34:32	2019-12-11 22:34:32
17	20	basic	registered	f	2019-12-12 06:52:10	2019-12-12 06:52:10
18	21	basic	registered	f	2019-12-31 22:57:00	2019-12-31 22:57:00
19	22	basic	registered	f	2020-01-12 01:40:33	2020-01-12 01:40:33
20	23	basic	registered	f	2020-01-14 01:58:36	2020-01-14 01:58:36
21	24	basic	registered	f	2020-01-22 09:10:07	2020-01-22 09:10:07
22	26	basic	registered	f	2020-02-19 01:18:35	2020-02-19 01:18:35
23	28	basic	registered	f	2020-04-20 22:49:46	2020-04-20 22:49:46
24	29	basic	registered	f	2020-05-02 06:40:30	2020-05-02 06:40:30
25	31	basic	registered	f	2020-05-03 12:57:36	2020-05-03 12:57:36
26	32	basic	registered	f	2020-06-04 23:24:43	2020-06-04 23:24:43
27	34	basic	registered	f	2020-06-19 02:10:41	2020-06-19 02:10:41
28	38	basic	registered	f	2020-06-20 22:18:20	2020-06-20 22:18:20
29	40	basic	registered	f	2020-07-04 14:50:09	2020-07-04 14:50:09
30	41	basic	registered	f	2020-08-01 13:20:35	2020-08-01 13:20:35
31	44	basic	registered	f	2020-09-17 16:03:30	2020-09-17 16:03:30
32	45	basic	registered	f	2020-09-18 17:12:45	2020-09-18 17:12:45
33	46	basic	registered	f	2020-09-19 18:11:24	2020-09-19 18:11:24
34	47	basic	registered	f	2020-09-21 00:20:15	2020-09-21 00:20:15
35	49	basic	registered	f	2020-09-22 09:58:30	2020-09-22 09:58:30
36	50	basic	registered	f	2020-09-28 16:10:16	2020-09-28 16:10:16
37	51	basic	registered	f	2020-10-19 04:15:34	2020-10-19 04:15:34
38	52	basic	registered	f	2020-11-01 23:51:10	2020-11-01 23:51:10
39	54	basic	registered	f	2020-12-05 13:05:24	2020-12-05 13:05:24
40	55	basic	registered	f	2021-01-05 19:38:04	2021-01-05 19:38:04
41	56	basic	registered	f	2021-01-10 14:19:09	2021-01-10 14:19:09
42	57	basic	registered	f	2021-01-23 18:45:06	2021-01-23 18:45:06
43	59	basic	registered	f	2021-01-28 06:00:21	2021-01-28 06:00:21
44	60	basic	registered	f	2021-01-30 19:55:27	2021-01-30 19:55:27
45	61	basic	registered	f	2021-02-10 19:00:59	2021-02-10 19:00:59
46	62	basic	registered	f	2021-02-23 08:10:20	2021-02-23 08:10:20
47	63	basic	registered	f	2021-03-03 14:06:40	2021-03-03 14:06:40
48	65	basic	registered	f	2021-03-08 19:58:47	2021-03-08 19:58:47
49	66	basic	registered	f	2021-03-20 11:11:42	2021-03-20 11:11:42
50	67	basic	registered	f	2021-03-20 22:07:24	2021-03-20 22:07:24
51	68	basic	registered	f	2021-03-21 10:24:16	2021-03-21 10:24:16
52	69	basic	registered	f	2021-03-24 17:32:37	2021-03-24 17:32:37
53	70	basic	registered	f	2021-03-29 21:46:10	2021-03-29 21:46:10
54	71	basic	registered	f	2021-04-07 21:47:45	2021-04-07 21:47:45
55	72	basic	registered	f	2021-04-16 08:29:18	2021-04-16 08:29:18
56	73	basic	registered	f	2021-04-18 20:35:44	2021-04-18 20:35:44
57	74	basic	registered	f	2021-04-21 03:28:06	2021-04-21 03:28:06
58	75	basic	registered	f	2021-05-02 05:11:05	2021-05-02 05:11:05
59	76	basic	registered	f	2021-05-23 00:12:25	2021-05-23 00:12:25
60	77	basic	registered	f	2021-06-12 00:25:25	2021-06-12 00:25:25
61	78	basic	registered	f	2021-06-30 18:25:06	2021-06-30 18:25:06
62	79	basic	registered	f	2021-07-09 20:09:50	2021-07-09 20:09:50
63	80	basic	registered	f	2021-07-20 06:48:00	2021-07-20 06:48:00
64	81	basic	registered	f	2021-08-24 05:28:09	2021-08-24 05:28:09
65	82	basic	registered	f	2021-08-24 17:56:53	2021-08-24 17:56:53
66	83	basic	registered	f	2021-09-01 04:12:33	2021-09-01 04:12:33
67	84	basic	registered	f	2021-09-01 19:39:08	2021-09-01 19:39:08
68	85	basic	registered	f	2021-09-03 03:51:33	2021-09-03 03:51:33
69	86	basic	registered	f	2021-09-04 04:31:33	2021-09-04 04:31:33
70	87	basic	registered	f	2021-09-12 12:57:02	2021-09-12 12:57:02
71	88	basic	registered	f	2021-09-12 22:02:55	2021-09-12 22:02:55
72	89	basic	registered	f	2021-09-18 18:18:50	2021-09-18 18:18:50
73	90	basic	registered	f	2021-09-20 04:04:48	2021-09-20 04:04:48
74	91	basic	registered	f	2021-09-29 09:38:30	2021-09-29 09:38:30
75	92	basic	registered	f	2021-10-04 01:19:56	2021-10-04 01:19:56
76	93	basic	registered	f	2021-10-04 07:26:09	2021-10-04 07:26:09
77	94	basic	registered	f	2021-10-06 23:02:50	2021-10-06 23:02:50
78	96	basic	registered	f	2021-10-10 00:52:21	2021-10-10 00:52:21
79	97	basic	registered	f	2021-10-21 18:04:48	2021-10-21 18:04:48
80	98	basic	registered	f	2021-10-27 17:58:05	2021-10-27 17:58:05
81	99	basic	registered	f	2021-11-02 09:49:06	2021-11-02 09:49:06
82	100	basic	registered	f	2021-11-04 16:46:25	2021-11-04 16:46:25
\.


--
-- Name: accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.accounts_id_seq', 82, true);


--
-- Data for Name: credentials; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.credentials (id, user_id, source, token, inserted_at, updated_at) FROM stdin;
13	14	password	$argon2id$v=19$m=131072,t=8,p=4$mz/GHFLySz1np/Omm/zGQQ$yXxER4TfawMzmE5wVaJegYSyE+9k0CQ3e62mFcJwENs	2019-10-31 20:52:51	2019-10-31 20:52:51
14	15	password	$argon2id$v=19$m=131072,t=8,p=4$9HgoiG0pJ7VfksKu1KIikw$/N3pv6KwbI4uIgk4MBzLDFPCCvateMgTjdqNNj5+5Z0	2019-12-11 12:36:37	2019-12-11 12:36:37
15	18	password	$argon2id$v=19$m=131072,t=8,p=4$/OnvYQyV8+kB72Lirt/blA$Qhp5m8xdcjs4QPd6Dz13V4IWBaOcZ4Yp/5k4uPWxujg	2019-12-11 17:34:43	2019-12-11 17:34:43
16	19	password	$argon2id$v=19$m=131072,t=8,p=4$5mgzMzLTJpBg+5+ab/lYiA$r6Ff+i3hsXulUIHiTXVsknVV/EFU0gup7dDIRqrevdA	2019-12-11 22:34:32	2019-12-11 22:34:32
17	20	password	$argon2id$v=19$m=131072,t=8,p=4$BdL3rEJsywFiE9BD8cn4Rw$FK15gjmGJuGzYR624l+OBbQ8mSeC29u0l9HZ8U+a2rA	2019-12-12 06:52:10	2019-12-12 06:52:10
18	21	password	$argon2id$v=19$m=131072,t=8,p=4$M+/KAsxv/QTmZKGr0mYpmA$4K3V2EUonpSeNJcMP7qIVuy3sGgRVQbRvVmZ3bDecSo	2019-12-31 22:57:00	2019-12-31 22:57:00
19	22	password	$argon2id$v=19$m=131072,t=8,p=4$2oYiv5FAEzb158aaPtoUrg$Wdn9/5icNhGVxlbGC9FlO4HovpWUyfcFoJLmVTRx6B8	2020-01-12 01:40:33	2020-01-12 01:40:33
20	23	password	$argon2id$v=19$m=131072,t=8,p=4$ZMxqd42dfeKgym8r5sPjpQ$aXFYVFqOGdSfdh0tNsgWJIjHO+7SpyASjN27DNtWZWU	2020-01-14 01:58:36	2020-01-14 01:58:36
21	24	password	$argon2id$v=19$m=131072,t=8,p=4$aiVnEo/Zh34rC2d0K0zxSQ$f+eEKb6XZIw8xP2h0hLwHUxsvDuiCCVjdcbHNMdLRYg	2020-01-22 09:10:07	2020-01-22 09:10:07
22	26	password	$argon2id$v=19$m=131072,t=8,p=4$nJjonowQa+bt+dmx6Kzjcg$DfW/gScHnnqjITkEqDtBouYIbzN+Xb4HzRUzG9MXh/s	2020-02-19 01:18:35	2020-02-19 01:18:35
23	28	password	$argon2id$v=19$m=131072,t=8,p=4$MywM0DPkY9Ch0KE2QvUIqw$plMxJRhNPqSCQVsQ1oOdhJeAxHt6BGm1o0fWEAojYE0	2020-04-20 22:49:46	2020-04-20 22:49:46
24	29	password	$argon2id$v=19$m=131072,t=8,p=4$djwt3Foy4agIdhGSHgVqrA$jDS7m7qnvnMnuz9yC9M3OhCn9xK2lQP9++UT33x+OqE	2020-05-02 06:40:30	2020-05-02 06:40:30
25	31	password	$argon2id$v=19$m=131072,t=8,p=4$LtTuis1pIGdWqt5e8IW8TA$Oz6dq51DMjHibE26hUdds8/EMCyuIWdsqxYZC2G5jUM	2020-05-03 12:57:36	2020-05-03 12:57:36
26	32	password	$argon2id$v=19$m=131072,t=8,p=4$x93ym7BGAChmxEzddUb6yA$UZDx0/x3w6aUkHcdxEPtKfqSsrcAeeJBQTeQwvBa5fY	2020-06-04 23:24:43	2020-06-04 23:24:43
27	34	password	$argon2id$v=19$m=131072,t=8,p=4$JPuH81K2V4NhKRGAskoC7g$EozAzfMgD+gk1xHKZnpylwxeMy7OMWSk0+cpkODh1Ec	2020-06-19 02:10:41	2020-06-19 02:10:41
28	38	password	$argon2id$v=19$m=131072,t=8,p=4$JagnzLqxQxbPpB74pFUJGw$O0D1bPB0F525vvCW0PD2y+vGDHCVJHiVVzbOqS2yVNg	2020-06-20 22:18:20	2020-06-20 22:18:20
29	40	password	$argon2id$v=19$m=131072,t=8,p=4$vISPj99fvggvWHm2wBxAYg$B6Y8LUqSU4ufUWYG+qAwNvbl3aCKtHr4Z0FqxdQ7VQM	2020-07-04 14:50:09	2020-07-04 14:50:09
30	41	password	$argon2id$v=19$m=131072,t=8,p=4$B3LSCMaVnQrBe3dL1uIMCg$qiwOsO7VVoiE08I2Kz58MwlrjMqlbfacYU3NIECU4mE	2020-08-01 13:20:35	2020-08-01 13:20:35
31	44	password	$argon2id$v=19$m=131072,t=8,p=4$94wNyVPiXyDc2i2+UgnwPQ$jwsJ3yQiw44xU3x9SU53h0wiqZtnGL6TMbws718JUeQ	2020-09-17 16:03:30	2020-09-17 16:03:30
32	45	password	$argon2id$v=19$m=131072,t=8,p=4$DosuAjdQB7ktZGhtES4iyg$MmJ9Ls6YxPgCTR5ne22YICETQ8VnicAezC2RihfyCMo	2020-09-18 17:12:45	2020-09-18 17:12:45
33	46	password	$argon2id$v=19$m=131072,t=8,p=4$Y9O9vDkhnKBC4+vBU7q7ww$4AIkaNGabj7Om5imiknIdzUvyO7PxJJ9syy2ODNFnW4	2020-09-19 18:11:24	2020-09-19 18:11:24
34	47	password	$argon2id$v=19$m=131072,t=8,p=4$DNsUS2zymDDV7I5xkqPYvQ$2rGDH3g9jCzyeNtB35J5kix5vXSgEmQvsFI2iGIzvjY	2020-09-21 00:20:15	2020-09-21 00:20:15
35	49	password	$argon2id$v=19$m=131072,t=8,p=4$TrEO5v0IJjWU1p0PofvYMA$rvCTb2QOsgW2Ssy3hsWwALnqA9/m2diIENewogsEoIg	2020-09-22 09:58:30	2020-09-22 09:58:30
36	50	password	$argon2id$v=19$m=131072,t=8,p=4$4K7AH+Z0VDKccLh15j0kcw$BZxj8ipP8l4oBwR0LBqemFV20h5/dGcpqxhu6SeBdqo	2020-09-28 16:10:16	2020-09-28 16:10:16
37	51	password	$argon2id$v=19$m=131072,t=8,p=4$ZEWmdV6pyfKi7hzYPYAxcA$6OuKOj7CfgsXpiSOpsl2lTmEJ0TF4iwHAjd+EKTAFu4	2020-10-19 04:15:34	2020-10-19 04:15:34
38	52	password	$argon2id$v=19$m=131072,t=8,p=4$LmfznKdxfyhVKQlk5eoUFg$luIWIa0ww2WpVzWEWgym0LM96hEtCbg1nVHHD61b5r0	2020-11-01 23:51:10	2020-11-01 23:51:10
39	54	password	$argon2id$v=19$m=131072,t=8,p=4$W8uGvY3MHX/jVhbbiOXLwQ$qBLMGYfUxAnIrWcytCD5c5aOwD6TYRjKvUrGvmpLsgQ	2020-12-05 13:05:24	2020-12-05 13:05:24
40	55	password	$argon2id$v=19$m=131072,t=8,p=4$yAhE1N8QcJZ7uttfFoVWjQ$Z9EhpNX2uPltJwZuff1Sh7ydSMnMv+WwmQQu19Fed8k	2021-01-05 19:38:04	2021-01-05 19:38:04
41	56	password	$argon2id$v=19$m=131072,t=8,p=4$PxxIfEN37GnuInFgs5vHfg$5eDy16fg+AbfYDer0Hah3jCZpP60QX0ui6CwNhrDHuk	2021-01-10 14:19:09	2021-01-10 14:19:09
42	57	password	$argon2id$v=19$m=131072,t=8,p=4$sCK47D/WU5WwE7/7gcqiYA$r6DsfLO6GYOIPSRnbF90ntlCvuSo09738be1ayvrJZI	2021-01-23 18:45:06	2021-01-23 18:45:06
43	59	password	$argon2id$v=19$m=131072,t=8,p=4$IRDCmx8VhtIqWx35wg7HJQ$eE6uHdtS0sI+lLwf/rilEk9gMacF/sIqaZ/J0yqXIxc	2021-01-28 06:00:21	2021-01-28 06:00:21
44	60	password	$argon2id$v=19$m=131072,t=8,p=4$RQSsikUGJUFHJOL8P8VBHg$mV0D6IOhF9g0J66wbK//TD5gqNyZM8jqwAzyN/dta5o	2021-01-30 19:55:27	2021-01-30 19:55:27
45	61	password	$argon2id$v=19$m=131072,t=8,p=4$iTREBeFnJeVAKojzi98eFg$/w6Vh+QfYWQQliLzDEluiIxzm37VnS771HYQ3R6PSvo	2021-02-10 19:00:59	2021-02-10 19:00:59
46	62	password	$argon2id$v=19$m=131072,t=8,p=4$fl6ElWwVG60s8Gk1pmmJcA$ZnVU4wL28I7yheS87PRLdjXYx5BNkxXowFO/1qY2Rrc	2021-02-23 08:10:20	2021-02-23 08:10:20
47	63	password	$argon2id$v=19$m=131072,t=8,p=4$ZIJGt6D6weq03N6+BNqo/Q$DFBnnCvlm9u7IYCoQCsc8qyS4po3DuFCriQh3NDZhLg	2021-03-03 14:06:40	2021-03-03 14:06:40
48	65	password	$argon2id$v=19$m=131072,t=8,p=4$l1qxYLv8lNf74X1+P1TgXQ$YzSyTd+FMcaWYu5KUpAo3H8ciqhXtP2f65xwMLD1Ots	2021-03-08 19:58:47	2021-03-08 19:58:47
49	66	password	$argon2id$v=19$m=131072,t=8,p=4$7JlJnmbMR+BjvyTbZiYCvg$vgW4PS55NE28lo426VB2an6CySfLhkzJsULnxg+k7ko	2021-03-20 11:11:42	2021-03-20 11:11:42
50	67	password	$argon2id$v=19$m=131072,t=8,p=4$ewIazyRXadoVponjfhe2Tg$SAhn8jqxMasrrrK+iQDD3kz0OQqlaXKAXglhiHNiiOE	2021-03-20 22:07:24	2021-03-20 22:07:24
51	68	password	$argon2id$v=19$m=131072,t=8,p=4$qHdrZylsKgP5DRxoVk7J3g$ZmwxdVt+fd45+pUq2WGkLvtJAiQ+p1nbpWiPu1fDVps	2021-03-21 10:24:16	2021-03-21 10:24:16
52	69	password	$argon2id$v=19$m=131072,t=8,p=4$yhqMcc6INrIAreZ5rT128Q$Jaktyj7zcjQDyWmfiy3+G36cToPbYjr2WhZbYR/N7Xw	2021-03-24 17:32:37	2021-03-24 17:32:37
53	70	password	$argon2id$v=19$m=131072,t=8,p=4$rcfZKuX4xxQMMoG13ISdUA$dR6VlZcHpp7/DeEGNCdTzo0RBat6F+1W9I6IljtB7m0	2021-03-29 21:46:10	2021-03-29 21:46:10
54	71	password	$argon2id$v=19$m=131072,t=8,p=4$eklYjgZTaJRtZYkua2QxUw$z6gTRGRdURfKzXhKqt5lOF4oub950ytvDfq2HnSlU8A	2021-04-07 21:47:45	2021-04-07 21:47:45
55	72	password	$argon2id$v=19$m=131072,t=8,p=4$hq283QB6Uamyp9YpTlFOXQ$Y80Xiz1ee4ygTFLuJfHpnVkJykUPPhkEcmoE5wHGZls	2021-04-16 08:29:18	2021-04-16 08:29:18
56	73	password	$argon2id$v=19$m=131072,t=8,p=4$+gQCQ+JnH57nlzBnyvCleg$5qQ+rrM6okeZ1NKBcRXEoyIDZfxIAWXdlPmbwc/kL+M	2021-04-18 20:35:44	2021-04-18 20:35:44
57	74	password	$argon2id$v=19$m=131072,t=8,p=4$uFgsrLHcmUawDSSSG9+gog$uW5kpEJiXUjiLULnGCTURjucQkpzPlqWih0GvAMhAFk	2021-04-21 03:28:06	2021-04-21 03:28:06
58	75	password	$argon2id$v=19$m=131072,t=8,p=4$sUZIkfxM2AsOhxz9g65XSA$WxBfkmQCPIP/aFofNpDwRVBeCfCZtsOmCMo4Pt2scxQ	2021-05-02 05:11:05	2021-05-02 05:11:05
59	76	password	$argon2id$v=19$m=131072,t=8,p=4$UKLVpxlVLBgdKxL4IzozTw$FEwJhbjAJV/FCNKwZKjlu+WLT9C2tJ/qbXoEhEAup/E	2021-05-23 00:12:25	2021-05-23 00:12:25
60	77	password	$argon2id$v=19$m=131072,t=8,p=4$1FU4VjaXE89Q9Mrxdc3xcg$0fLT86t1Hdq38vmH9eeCbhepDbN9tIlcI3KFHg6yoCM	2021-06-12 00:25:25	2021-06-12 00:25:25
61	78	password	$argon2id$v=19$m=131072,t=8,p=4$c77iidF9hqmPGR1k8k/BAw$4RsLKcZNnsAJZbqBa49gbF22aRTBOvtcp3cB72odSmw	2021-06-30 18:25:06	2021-06-30 18:25:06
62	79	password	$argon2id$v=19$m=131072,t=8,p=4$tmjTjVKOVnqfJKJ3Rc2Tvw$RQTUle1WCkKsPszj5e02Ph9rEUZA+o0MTEPPGyORiS8	2021-07-09 20:09:50	2021-07-09 20:09:50
63	80	password	$argon2id$v=19$m=131072,t=8,p=4$3uMwxX3/Vg57k75iK4X7tA$kk0qH62f90EjAleWcssqar8u6gUsNqKwwAcxH13DmLs	2021-07-20 06:48:00	2021-07-20 06:48:00
64	81	password	$argon2id$v=19$m=131072,t=8,p=4$m/f3nd5yjVF2ZNb7LgWPKw$6JVLTcoUqW6e36uGGz2LzzTaz9rXcdaq9NRUwBQyL7c	2021-08-24 05:28:09	2021-08-24 05:28:09
65	82	password	$argon2id$v=19$m=131072,t=8,p=4$P0NoDdHQXu1RDhfo9gGOTg$vhgstHHz27bEOS+IDlcu8S9H4AVjzKFX8Qf7S/ucFCM	2021-08-24 17:56:53	2021-08-24 17:56:53
66	83	password	$argon2id$v=19$m=131072,t=8,p=4$Yddamb0ru9VpMVvWMFn4Xg$+6ufae8WssCmweMT6ihQenpKSM5RVG6mkoVpVJgQE9Y	2021-09-01 04:12:33	2021-09-01 04:12:33
67	84	password	$argon2id$v=19$m=131072,t=8,p=4$tooWpgUXfXD07WH1sXanYg$6QaOrpVvy+qW4HQz03uzA+gLVTMP4yB42ORsVf1nnmc	2021-09-01 19:39:08	2021-09-01 19:39:08
68	85	password	$argon2id$v=19$m=131072,t=8,p=4$Py/QoXs0zdHqxBg7NNrbog$H32a1cME45RNe6GyaujWc9zz+H5q1JgqG0I46QKIKqs	2021-09-03 03:51:33	2021-09-03 03:51:33
69	86	password	$argon2id$v=19$m=131072,t=8,p=4$wjgoArQZW3Fi5sdf5RxwlA$g46lFZudIAGwX6WubCKphiVJPwhT04Iw/UpCaEWDS8U	2021-09-04 04:31:33	2021-09-04 04:31:33
70	87	password	$argon2id$v=19$m=131072,t=8,p=4$8iNesolVBAoRDEpNVqRMkA$0g87/LifxKBWT/9OM/HD5iz1wT5ZTorNQiSN66Y9gxo	2021-09-12 12:57:02	2021-09-12 12:57:02
71	88	password	$argon2id$v=19$m=131072,t=8,p=4$tN1P5NyNYpqQH60ZeDMqHQ$gk5g6r8ogJFGCCpEMTkmGYWn+nXKwgk7VA3TVRmUvG8	2021-09-12 22:02:55	2021-09-12 22:02:55
72	89	password	$argon2id$v=19$m=131072,t=8,p=4$Pn/Dk8DgLBybGmWSrUjyfQ$p/J26KwXNNF2BA3CdACThTfQjboVgMiHcAL57Q84Xys	2021-09-18 18:18:50	2021-09-18 18:18:50
73	90	password	$argon2id$v=19$m=131072,t=8,p=4$jvg6da8AYQbktWen1+Lw0g$OIr2tPhyt9yqq2M52f7bwsnNVjpzcS+iAk1SCg1fOUQ	2021-09-20 04:04:48	2021-09-20 04:04:48
74	91	password	$argon2id$v=19$m=131072,t=8,p=4$VywH/jQ7TTHTERDjOBWhhw$W6tLRXVdIsewGiN2lGbPuQm1xHcCTXJoggZ8XBMu3mQ	2021-09-29 09:38:30	2021-09-29 09:38:30
75	92	password	$argon2id$v=19$m=131072,t=8,p=4$d3pCZF0x8tMbmYYnAEJSxg$D+yr8nj2DsNDQlY7ila/LmSCHg4b7OThO2osPVuCnpo	2021-10-04 01:19:56	2021-10-04 01:19:56
76	93	password	$argon2id$v=19$m=131072,t=8,p=4$AnPnyKynsynMQb/CrdPtAg$SPax1oRJvBXcTKgNzljroFzIgqKMHa8pIdLLQh4Zsrg	2021-10-04 07:26:09	2021-10-04 07:26:09
77	94	password	$argon2id$v=19$m=131072,t=8,p=4$bjkk2dzpNjKJoCsgChOStA$mhQi0JYuFcJlZkm+x7hBH26Z+kr0DZFMNaKjLjTCjBc	2021-10-06 23:02:50	2021-10-06 23:02:50
78	96	password	$argon2id$v=19$m=131072,t=8,p=4$HFfceSUmLrByLfUUzxDVZw$fGM3M8UdKtMYcIH0wxuVLWVKmeN8z2noFA1mMwEoTTY	2021-10-10 00:52:21	2021-10-10 00:52:21
79	97	password	$argon2id$v=19$m=131072,t=8,p=4$d30TkwlGLLkwRyQqHpPdAw$iToj8gVS3cE9E5NbWphPv9RdyGZ93+MjR7blG3B8QJ8	2021-10-21 18:04:48	2021-10-21 18:04:48
80	98	password	$argon2id$v=19$m=131072,t=8,p=4$j+BSc4veujuasAcCBTKkZw$u8LbZHyEPK+/+mANDqGEJ2E/4vmE1qMWKbwTYXTNQHo	2021-10-27 17:58:05	2021-10-27 17:58:05
81	99	password	$argon2id$v=19$m=131072,t=8,p=4$1ZIXWQIIsozByvUbEbkC6g$6Ym3z+ewlZNJHlxRr4yT2y9GsaYHyrH1d1r7z5LU1qA	2021-11-02 09:49:06	2021-11-02 09:49:06
82	100	password	$argon2id$v=19$m=131072,t=8,p=4$IJdIPh7SORJ0ipLWTPxH7w$SZcQFoyIaJoSgYdvKwLgcaxUVmF339DuqlbEnK0C3Ug	2021-11-04 16:46:25	2021-11-04 16:46:25
\.


--
-- Name: credentials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.credentials_id_seq', 82, true);


--
-- Data for Name: daily_market_history; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.daily_market_history (id, symbol, date, close, open, high, low, volumefrom, volumeto, inserted_at, updated_at, token_id) FROM stdin;
10807	ATOM	2020-06-26	2.62	2.622	2.655	2.496	435869.71	1121840.21	2021-05-09 17:34:36	2021-05-09 17:34:36	3
2196	ZRX	2021-04-22	1.497	1.638	1.787	1.482	16639138.32	27252626.82	2021-05-09 17:34:36	2021-05-09 17:34:36	6
10808	ATOM	2020-06-27	2.43	2.62	2.719	2.293	659833.81	1671566.88	2021-05-09 17:34:36	2021-05-09 17:34:36	3
2256	OCN	2020-06-20	0.0003433	0.0003202	0.0003685	0.0003159	46069803.32	15817.38	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2642	BTC	2020-07-10	9288.57	9238.95	9317.31	9128.71	24422.31	224680670.05	2021-05-09 17:34:36	2021-05-09 17:34:36	7
3129	BCH	2020-11-08	270.89	254.03	280.65	262.22	103523.22	28043352.53	2021-05-09 17:34:36	2021-05-09 17:34:36	8
2548	OCN	2021-04-08	0.001519	0.001532	0.001623	0.001436	20430396.29	31038.07	2021-05-09 17:34:37	2021-05-09 17:34:37	2
4579	EOS	2020-10-25	2.709	2.663	2.741	2.622	921342.25	2474562.95	2021-05-09 17:34:36	2021-05-09 17:34:36	9
270486	ZRX	2021-05-02	1.87	1.94	1.959	1.796	11387400.71	21562951.24	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2613	BTC	2020-06-11	9268.13	9891.84	9970.77	9093.42	86717.5	827582593.73	2021-05-09 17:34:36	2021-05-09 17:34:36	7
4580	EOS	2020-10-26	2.633	2.709	2.749	2.596	1163579.89	3115207.9	2021-05-09 17:34:36	2021-05-09 17:34:36	9
67494	ANT	2021-04-24	7.502	8.158	8.069	7.447	766570.37	5751089.72	2021-05-09 17:34:37	2021-05-09 17:34:37	14
295920	BTC	2021-05-10	55870.01	58294.18	59587.03	54239.16	71168.05	4067497161.41	2021-05-11 23:35:07	2021-05-11 23:35:07	7
146352	ANT	2021-04-29	9.972	9.28	10.21	8.761	833047.77	8306762.53	2021-05-09 17:34:37	2021-05-09 17:34:37	14
1204	SJCX	2020-08-05	0.0004701	0.0004478	0.0004701	0.0004701	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
2550	OCN	2021-04-10	0.001515	0.001467	0.001579	0.001494	8515665.9	12901.34	2021-05-09 17:34:37	2021-05-09 17:34:37	2
392	DOT	2020-05-17	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
2643	BTC	2020-07-11	9237.13	9288.57	9302.22	9188.13	11785.42	108899834.63	2021-05-09 17:34:36	2021-05-09 17:34:36	7
159190	XTZ	2021-05-01	5.822	5.619	5.896	5.5	2903922.35	16528659.57	2021-05-07 19:24:31	2021-05-07 19:24:31	5
2557	OCN	2021-04-17	0.002434	0.002717	0.002666	0.002295	23773084.08	57861.56	2021-05-09 17:34:37	2021-05-09 17:34:37	2
3130	BCH	2020-11-09	264.38	270.89	269.9	260.24	93584.44	24741472.16	2021-05-09 17:34:36	2021-05-09 17:34:36	8
2558	OCN	2021-04-18	0.002958	0.002434	0.003272	0.002174	36372092.15	107591.09	2021-05-09 17:34:37	2021-05-09 17:34:37	2
291604	ETH	2021-05-08	3916.25	3483.96	3959.92	3454.89	669610.72	2489085350.71	2021-05-09 23:34:40	2021-05-09 23:34:40	10
393	DOT	2020-05-18	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
1214	SJCX	2020-08-15	0.0004744	0.000471	0.0004744	0.0004744	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
394	DOT	2020-05-19	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
1226	SJCX	2020-08-27	0.0004532	0.0004587	0.0004532	0.0004532	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1561	ETH	2020-07-27	322.23	311.28	359.78	316.6	2306242.74	743147491.93	2021-05-07 19:24:30	2021-05-07 19:24:30	10
301464	ZRX	2021-05-20	1.158	0.993	1.198	0.8927	29913953.61	31766205.31	2021-05-21 23:37:26	2021-05-21 23:37:26	6
1625	ETH	2020-09-29	359.92	354.01	360.59	350.49	301692.93	107212650.86	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1228	SJCX	2020-08-29	0.0004592	0.0004614	0.0004592	0.0004592	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
4581	EOS	2020-10-27	2.672	2.633	2.696	2.629	572214.54	1520389.46	2021-05-09 17:34:36	2021-05-09 17:34:36	9
10837	ATOM	2020-07-26	3.816	3.919	3.924	3.739	611581.27	2333757.99	2021-05-09 17:34:36	2021-05-09 17:34:36	3
3131	BCH	2020-11-10	257.42	264.38	265.39	255.89	95700.83	24635671.45	2021-05-09 17:34:36	2021-05-09 17:34:36	8
10857	ATOM	2020-08-15	6.077	6.108	6.356	5.927	763787.02	4667109.96	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10872	ATOM	2020-08-30	7.638	7.276	7.899	7.243	749964.06	5699641.98	2021-05-09 17:34:36	2021-05-09 17:34:36	3
4584	EOS	2020-10-30	2.51	2.638	2.646	2.422	2200356.19	5554657.69	2021-05-09 17:34:36	2021-05-09 17:34:36	9
306014	OCN	2021-05-29	0.0007975	0.0009408	0.0009342	0.0007747	135678126.81	108203.71	2021-05-30 23:39:28	2021-05-30 23:39:28	2
306450	OCN	2021-05-30	0.0008115	0.0007975	0.0008832	0.0007638	127324010.32	103329.72	2021-05-31 20:39:41	2021-05-31 20:39:41	2
1229	SJCX	2020-08-30	0.0004687	0.0004592	0.0004687	0.0004687	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
2644	BTC	2020-07-12	9300.95	9237.13	9339.99	9169.13	16385.5	151649367.79	2021-05-09 17:34:36	2021-05-09 17:34:36	7
10884	ATOM	2020-09-11	5.349	5.315	5.39	5.061	601367.64	3153644.18	2021-05-09 17:34:36	2021-05-09 17:34:36	3
2648	BTC	2020-07-16	9133.23	9193.22	9216.53	9029.17	27882.77	254255550.28	2021-05-09 17:34:36	2021-05-09 17:34:36	7
1346	SJCX	2020-12-25	0.0009883	0.000949	0.0009883	0.0009883	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1406	SJCX	2021-02-23	0.001956	0.002165	0.001956	0.001956	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1683	ETH	2020-11-26	520.22	569.4	576.94	482.39	1576644.23	810828523.33	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1684	ETH	2020-11-27	518.83	520.22	531.01	494.78	648018.44	332244579.12	2021-05-07 19:24:30	2021-05-07 19:24:30	10
3132	BCH	2020-11-11	257.28	257.42	267.02	254.93	207403.57	53361199.16	2021-05-09 17:34:36	2021-05-09 17:34:36	8
4690	EOS	2021-02-13	5.562	4.761	5.565	4.498	25390976.22	128547593.3	2021-05-09 17:34:36	2021-05-09 17:34:36	9
1685	ETH	2020-11-28	537.99	518.83	548.25	507.33	469956.47	248369034.48	2021-05-07 19:24:30	2021-05-07 19:24:30	10
3133	BCH	2020-11-12	259.93	257.28	270.53	258.62	276073.98	71758829.68	2021-05-09 17:34:36	2021-05-09 17:34:36	8
1686	ETH	2020-11-29	576	537.99	576.77	531.08	419301.11	231983170.72	2021-05-07 19:24:30	2021-05-07 19:24:30	10
159200	EOS	2021-05-01	6.618	6.448	6.654	6.297	4621801.59	29915736.06	2021-05-09 17:34:36	2021-05-09 17:34:36	9
10938	ATOM	2020-11-04	4.388	4.477	4.478	4.216	201515.47	875102.02	2021-05-09 17:34:36	2021-05-09 17:34:36	3
3134	BCH	2020-11-13	259.04	259.93	262.96	250.06	271313.14	70280684.74	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3135	BCH	2020-11-14	255.29	259.04	261.72	254	286924.7	73247883.64	2021-05-09 17:34:36	2021-05-09 17:34:36	8
287484	EOS	2021-05-05	8.737	6.347	8.84	6.218	30539320.44	237505416.55	2021-05-09 17:34:36	2021-05-09 17:34:36	9
287485	EOS	2021-05-06	11.47	8.737	12.84	8.427	57906855.64	612432249.63	2021-05-09 17:34:36	2021-05-09 17:34:36	9
395	DOT	2020-05-20	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
396	DOT	2020-05-21	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
398	DOT	2020-05-23	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
399	DOT	2020-05-24	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
1407	SJCX	2021-02-24	0.00199	0.001956	0.00199	0.00199	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1413	SJCX	2021-03-02	0.00194	0.001985	0.00194	0.00194	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
311700	BTC	2021-06-10	36680.78	37391.58	38387.2	35821.05	63052.49	2338112083.52	2021-06-11 23:42:18	2021-06-11 23:42:18	7
316858	DOT	2021-06-21	15.74	20.63	20.78	15.3	3502455.36	61073976.66	2021-06-22 22:44:50	2021-06-22 22:44:50	4
323448	ZRX	2021-07-05	0.6938	0.7237	0.7242	0.6717	4272460.98	2975175.96	2021-07-06 23:48:03	2021-07-06 23:48:03	6
328572	XTZ	2021-07-16	2.409	2.575	2.641	2.404	3448097.22	8717673.55	2021-07-17 23:50:32	2021-07-17 23:50:32	5
1122	SJCX	2020-05-15	0.0003725	0.0003917	0.0003725	0.0003725	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
453	DOT	2020-07-17	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
510	DOT	2020-09-12	5.157	4.653	5.299	4.506	859992.15	4243582.65	2021-05-09 17:34:36	2021-05-09 17:34:36	4
1491	ETH	2020-05-18	214.68	206.76	216.43	207.29	1411667.72	303053831.14	2021-05-07 19:24:30	2021-05-07 19:24:30	10
4650	EOS	2021-01-04	2.822	2.796	3.124	2.608	16223653	46571437.39	2021-05-09 17:34:36	2021-05-09 17:34:36	9
3167	BCH	2020-12-16	312.6	288.71	319	305.34	412743.81	129021726.9	2021-05-09 17:34:36	2021-05-09 17:34:36	8
1514	ETH	2020-06-10	248.01	244	250.3	242.38	354039.1	86962964.42	2021-05-07 19:24:30	2021-05-07 19:24:30	10
2239	OCN	2020-06-03	0.000313	0.0003139	0.000335	0.0003081	62117015.46	19444.91	2021-05-09 17:34:37	2021-05-09 17:34:37	2
109	XTZ	2020-08-08	3.383	3.083	3.485	3.031	7868365.3	26041186.01	2021-05-07 19:24:31	2021-05-07 19:24:31	5
8960	ANT	2020-06-09	1.068	1.079	1.106	1.029	9843.94	10512.77	2021-05-09 17:34:37	2021-05-09 17:34:37	14
1575	ETH	2020-08-10	395.71	390.32	399.28	390.95	956341.34	378431781.83	2021-05-07 19:24:30	2021-05-07 19:24:30	10
280366	FIL	2021-05-04	140.87	160.36	160.46	136.41	424430.74	62732800.51	2021-05-07 19:24:30	2021-05-07 19:24:30	13
295922	BCH	2021-05-10	1321.91	1429.77	1571.74	1207.83	289978.98	413100512.75	2021-05-11 23:35:07	2021-05-11 23:35:07	8
291606	SJCX	2021-05-08	0.002358	0.002295	0.002358	0.002358	0	0	2021-05-09 23:34:40	2021-05-09 23:34:40	11
1123	SJCX	2020-05-16	0.0003755	0.0003725	0.0003755	0.0003755	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
61	XTZ	2020-06-21	2.586	2.614	2.625	2.575	768736.42	2000303.04	2021-05-07 19:24:31	2021-05-07 19:24:31	5
133202	ANT	2021-04-27	8.949	8.607	9.208	8.636	576939.8	5163288.41	2021-05-09 17:34:37	2021-05-09 17:34:37	14
67506	EOS	2021-04-24	5.097	5.581	5.595	5.037	5613296.07	29450618.3	2021-05-09 17:34:36	2021-05-09 17:34:36	9
2311	OCN	2020-08-14	0.000535	0.0005185	0.0005569	0.0004911	19659573.95	10517.52	2021-05-09 17:34:37	2021-05-09 17:34:37	2
96	XTZ	2020-07-26	2.99	3.063	3.114	2.966	4715740.51	14256151.82	2021-05-07 19:24:31	2021-05-07 19:24:31	5
2328	OCN	2020-08-31	0.0005643	0.0005706	0.0006034	0.00056	31246928.42	17633.58	2021-05-09 17:34:37	2021-05-09 17:34:37	2
1962	ZRX	2020-08-31	0.613	0.637	0.6389	0.6111	4411485.45	2736930.2	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1965	ZRX	2020-09-03	0.4464	0.5583	0.5735	0.4413	9656226.87	4860959.76	2021-05-09 17:34:36	2021-05-09 17:34:36	6
97	XTZ	2020-07-27	2.827	2.99	2.99	2.657	10550361.2	29849392.39	2021-05-07 19:24:31	2021-05-07 19:24:31	5
2610	BTC	2020-06-08	9782.58	9750.7	9801.19	9658.72	32766.08	318606275.83	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2329	OCN	2020-09-01	0.0005377	0.0005643	0.0006186	0.0005234	24008473.22	12908.52	2021-05-09 17:34:37	2021-05-09 17:34:37	2
159210	ANT	2021-05-01	9.92	9.981	10.15	9.695	755749.58	7497112.87	2021-05-09 17:34:37	2021-05-09 17:34:37	14
2330	OCN	2020-09-02	0.0005102	0.0005377	0.0005322	0.0004838	34674776.98	17691.17	2021-05-09 17:34:37	2021-05-09 17:34:37	2
511	DOT	2020-09-13	5.311	5.157	5.479	4.788	963290.46	4974461.6	2021-05-09 17:34:36	2021-05-09 17:34:36	4
10843	ATOM	2020-08-01	4.089	3.797	4.137	3.797	1126154.84	4538725.1	2021-05-09 17:34:36	2021-05-09 17:34:36	3
1966	ZRX	2020-09-04	0.5147	0.4464	0.5261	0.4259	8769023.67	4213718.21	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1967	ZRX	2020-09-05	0.4303	0.5147	0.5246	0.4047	9594707.49	4301064.94	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1968	ZRX	2020-09-06	0.4603	0.4303	0.47	0.4112	7027635.1	3128189.87	2021-05-09 17:34:36	2021-05-09 17:34:36	6
10845	ATOM	2020-08-03	3.853	3.909	4.071	3.797	776126.64	3074369.3	2021-05-09 17:34:36	2021-05-09 17:34:36	3
1124	SJCX	2020-05-17	0.0003868	0.0003755	0.0003868	0.0003868	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
2684	BTC	2020-08-21	11527.35	11863.43	11882.67	11494.52	63548.27	745059089.73	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2704	BTC	2020-09-10	10345.68	10228.85	10493.32	10221.37	43679.85	452098495.16	2021-05-09 17:34:36	2021-05-09 17:34:36	7
10942	ATOM	2020-11-08	4.816	4.625	4.938	4.566	261972.23	1261452.5	2021-05-09 17:34:36	2021-05-09 17:34:36	3
1602	ETH	2020-09-06	352.69	335.24	360.31	316.82	958760.77	327280613.14	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1603	ETH	2020-09-07	353.7	352.69	358.54	323.67	693531.32	238264362.56	2021-05-07 19:24:30	2021-05-07 19:24:30	10
301466	ETH	2021-05-20	2772.84	2442.89	2996.39	2162.9	2086633.64	5492948402.81	2021-05-21 22:37:25	2021-05-21 22:37:25	10
10943	ATOM	2020-11-09	5.14	4.816	5.202	4.678	469890.78	2346290.55	2021-05-09 17:34:36	2021-05-09 17:34:36	3
3289	BCH	2021-04-17	991.53	1105.5	1172.9	990.93	739610.67	733342998.91	2021-05-09 17:34:36	2021-05-09 17:34:36	8
1604	ETH	2020-09-08	337.45	353.7	356.57	325.75	655015.89	222558039.13	2021-05-07 19:24:30	2021-05-07 19:24:30	10
10961	ATOM	2020-11-27	5.366	5.34	5.454	5.094	624651.27	3286900.96	2021-05-09 17:34:36	2021-05-09 17:34:36	3
110	XTZ	2020-08-09	3.698	3.383	3.78	3.276	11163552.6	39968272.69	2021-05-07 19:24:31	2021-05-07 19:24:31	5
1177	SJCX	2020-07-09	0.0003696	0.0003776	0.0003696	0.0003696	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
146330	ZRX	2021-04-29	1.673	1.709	1.764	1.598	10439142.98	17461648.65	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1178	SJCX	2020-07-10	0.0003715	0.0003696	0.0003715	0.0003715	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
2705	BTC	2020-09-11	10398.5	10345.68	10412.6	10215.49	25800.65	266084892.24	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2706	BTC	2020-09-12	10448	10398.5	10486.76	10282.43	17704.47	184001054.5	2021-05-09 17:34:36	2021-05-09 17:34:36	7
111	XTZ	2020-08-10	4.252	3.698	4.326	3.543	14888327.75	58430066.01	2021-05-07 19:24:31	2021-05-07 19:24:31	5
2730	BTC	2020-10-06	10603.9	10795.11	10801.66	10533.32	30869.62	329346366.4	2021-05-09 17:34:36	2021-05-09 17:34:36	7
306428	BTC	2021-05-30	35662.59	34611.58	36481.62	33400.65	37522.16	1325408340.1	2021-05-31 23:39:42	2021-05-31 23:39:42	7
67510	BCH	2021-04-24	772.57	840.51	840.94	749.82	107541.84	85192663.84	2021-05-09 17:34:36	2021-05-09 17:34:36	8
78579	BCH	2021-04-25	759.55	772.57	806.63	716.82	97513.89	74791960.67	2021-05-09 17:34:36	2021-05-09 17:34:36	8
233	XTZ	2020-12-10	2.106	2.173	2.183	2.078	1406978.21	2989662.72	2021-05-07 19:24:31	2021-05-07 19:24:31	5
78580	BCH	2021-04-26	849.61	759.55	850.39	752.32	128288.95	105039970.47	2021-05-09 17:34:36	2021-05-09 17:34:36	8
133162	BCH	2021-04-27	890.89	849.61	892.64	830.88	102241.11	88731375.2	2021-05-09 17:34:36	2021-05-09 17:34:36	8
2736	BTC	2020-10-12	11539.76	11375.51	11725.28	11223.99	41705.77	478557074.68	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2739	BTC	2020-10-15	11508.31	11429.3	11607.59	11269.05	33044.49	377801262.9	2021-05-09 17:34:36	2021-05-09 17:34:36	7
1179	SJCX	2020-07-11	0.0003695	0.0003715	0.0003695	0.0003695	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
271086	SJCX	2021-05-03	0.002288	0.002265	0.002288	0.002288	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
311702	BCH	2021-06-10	601.52	633.29	639.04	589.35	66647.48	40937386.52	2021-06-11 19:42:16	2021-06-11 19:42:16	8
316860	ANT	2021-06-21	4.764	9.424	8.378	3.362	700346.6	3336254.62	2021-06-22 23:44:50	2021-06-22 23:44:50	14
323450	ANT	2021-07-05	3.569	3.762	3.643	3.556	846016.42	3019538.75	2021-07-06 23:48:03	2021-07-06 23:48:03	14
328574	ATOM	2021-07-16	11.11	11.46	13.17	10.98	3760753.63	44988192.65	2021-07-17 22:50:31	2021-07-17 22:50:31	3
2385	OCN	2020-10-27	0.0002463	0.0002516	0.0002705	0.0002463	82501097.47	20318.49	2021-05-09 17:34:37	2021-05-09 17:34:37	2
512	DOT	2020-09-14	5.362	5.311	5.609	5.089	1223223.79	6593945.48	2021-05-09 17:34:36	2021-05-09 17:34:36	4
4576	EOS	2020-10-22	2.671	2.612	2.706	2.611	1362161.33	3632799.43	2021-05-09 17:34:36	2021-05-09 17:34:36	9
3048	BCH	2020-08-19	292.95	303.46	302.24	285.54	318035.25	93168686.23	2021-05-09 17:34:36	2021-05-09 17:34:36	8
112	XTZ	2020-08-11	4.011	4.252	4.429	3.764	14849724.4	60832257.38	2021-05-07 19:24:31	2021-05-07 19:24:31	5
2649	BTC	2020-07-17	9156.79	9133.23	9183.08	9080.61	20542.6	187710134.42	2021-05-09 17:34:36	2021-05-09 17:34:36	7
1120	SJCX	2020-05-13	0.0003727	0.0003528	0.0003727	0.0003727	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
513	DOT	2020-09-15	5.059	5.362	5.445	5.056	961102.03	5054563.43	2021-05-09 17:34:36	2021-05-09 17:34:36	4
1690	ETH	2020-12-03	616.55	598.26	623.7	586.55	520711.18	316868104.63	2021-05-07 19:24:30	2021-05-07 19:24:30	10
3440	FIL	2020-09-14	38.22	37.32	39.13	37.6	36.55	1396.86	2021-05-07 19:24:30	2021-05-07 19:24:30	13
159194	DOT	2021-05-01	36.93	36.54	37.37	35.84	764745.65	28073100.58	2021-05-09 17:34:36	2021-05-09 17:34:36	4
1700	ETH	2020-12-13	590.72	568.26	595.05	563.87	346124.44	201829035.68	2021-05-07 19:24:30	2021-05-07 19:24:30	10
133164	ATOM	2021-04-27	23.08	22.1	23.42	21.8	1517450.94	34280556.87	2021-05-09 17:34:36	2021-05-09 17:34:36	3
9164	ANT	2020-12-30	3.025	2.982	3.239	3.005	186598.04	564410.96	2021-05-09 17:34:37	2021-05-09 17:34:37	14
1121	SJCX	2020-05-14	0.0003917	0.0003727	0.0003917	0.0003917	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
4453	EOS	2020-06-21	2.516	2.538	2.556	2.512	485116.02	1228270.99	2021-05-09 17:34:36	2021-05-09 17:34:36	9
2672	BTC	2020-08-09	11686.34	11770.77	11802.93	11533.93	19874.64	231830330.42	2021-05-09 17:34:36	2021-05-09 17:34:36	7
1184	SJCX	2020-07-16	0.0003653	0.0003677	0.0003653	0.0003653	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
2673	BTC	2020-08-10	11897.41	11686.34	12074.31	11640.41	56105.27	667803525.71	2021-05-09 17:34:36	2021-05-09 17:34:36	7
250	XTZ	2020-12-27	2.001	1.978	2.141	1.878	6402327.03	12890683.51	2021-05-07 19:24:31	2021-05-07 19:24:31	5
2694	BTC	2020-08-31	11657.81	11716.54	11775.27	11586.36	26331.03	307926585.75	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2737	BTC	2020-10-13	11427.29	11539.76	11561.69	11314.56	33529.75	383360256.66	2021-05-09 17:34:36	2021-05-09 17:34:36	7
291608	ANT	2021-05-08	10.33	10.72	11.04	10.23	721975.13	7459974.58	2021-05-09 23:34:40	2021-05-09 23:34:40	14
9184	ANT	2021-01-19	3.996	4.384	4.402	3.963	716528.64	2863052.29	2021-05-09 17:34:37	2021-05-09 17:34:37	14
295924	ETH	2021-05-10	3949.77	3927.06	4210.05	3712.47	1190037.55	4805160991.1	2021-05-11 23:35:09	2021-05-11 23:35:09	10
1185	SJCX	2020-07-17	0.0003663	0.0003653	0.0003663	0.0003663	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
3163	BCH	2020-12-12	267.93	259.34	274.89	267.74	152748.78	40925265.03	2021-05-09 17:34:36	2021-05-09 17:34:36	8
4454	EOS	2020-06-22	2.59	2.516	2.608	2.513	1304451.19	3352062.05	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4577	EOS	2020-10-23	2.642	2.671	2.685	2.603	737020.68	1953813.15	2021-05-09 17:34:36	2021-05-09 17:34:36	9
2386	OCN	2020-10-28	0.000241	0.0002463	0.0002488	0.0002333	52571427.14	12671.68	2021-05-09 17:34:37	2021-05-09 17:34:37	2
3164	BCH	2020-12-13	275.84	267.93	279.87	270.86	152623.21	42099987.57	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3441	FIL	2020-09-15	39.98	38.22	39.98	38.41	45.6	1822.88	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3165	BCH	2020-12-14	276.98	275.84	279.48	267.92	169383.22	46915306.14	2021-05-09 17:34:36	2021-05-09 17:34:36	8
2387	OCN	2020-10-29	0.0002403	0.000241	0.0002442	0.0002325	80729823.4	19397.34	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2388	OCN	2020-10-30	0.0002335	0.0002403	0.0002411	0.0002258	107599724.34	25122.77	2021-05-09 17:34:37	2021-05-09 17:34:37	2
4578	EOS	2020-10-24	2.663	2.642	2.673	2.618	412752.89	1094223.55	2021-05-09 17:34:36	2021-05-09 17:34:36	9
3166	BCH	2020-12-15	288.71	276.98	299.41	275.88	314660.83	90846705.57	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3195	BCH	2021-01-13	496.42	451.95	543.89	491.18	406049.71	201570258.25	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3196	BCH	2021-01-14	526.64	496.42	529.38	505.5	384421.53	202452735.22	2021-05-09 17:34:36	2021-05-09 17:34:36	8
2740	BTC	2020-10-16	11326.25	11508.31	11545.35	11224.89	29300.16	332320579.31	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2389	OCN	2020-10-31	0.0002321	0.0002335	0.0002398	0.0002282	100323454.58	23280.66	2021-05-09 17:34:37	2021-05-09 17:34:37	2
251	XTZ	2020-12-28	2.119	2.001	2.242	1.984	4800469.25	10105378.75	2021-05-07 19:24:31	2021-05-07 19:24:31	5
298	XTZ	2021-02-13	5.364	5.012	5.376	4.598	18599888.35	93792253.42	2021-05-07 19:24:31	2021-05-07 19:24:31	5
2745	BTC	2020-10-21	12813.11	11921.78	13236.39	11900.51	103080.18	1296152945.69	2021-05-09 17:34:36	2021-05-09 17:34:36	7
3442	FIL	2020-09-16	46.68	39.98	46.95	38.44	235.79	11006.03	2021-05-07 19:24:30	2021-05-07 19:24:30	13
1186	SJCX	2020-07-18	0.0003671	0.0003663	0.0003671	0.0003671	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1411	SJCX	2021-02-28	0.00181	0.001848	0.00181	0.00181	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
78945	FIL	2021-04-25	134.07	133.81	136.86	131.95	161945.85	21688654.13	2021-05-07 19:24:30	2021-05-07 19:24:30	13
1729	ETH	2021-01-11	1088.37	1255.72	1259.54	912.42	3649323.14	3831991768.04	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1730	ETH	2021-01-12	1050.04	1088.37	1149.87	1007.68	1521509.38	1647583878.23	2021-05-07 19:24:30	2021-05-07 19:24:30	10
301468	ATOM	2021-05-20	16.91	13.83	17.43	12.17	3748251.67	57238397.15	2021-05-21 23:37:26	2021-05-21 23:37:26	3
2390	OCN	2020-11-01	0.0002419	0.0002321	0.0002577	0.0002339	129936000.32	31426.18	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2391	OCN	2020-11-02	0.0002225	0.0002419	0.0002417	0.0002187	115153159.47	25620.86	2021-05-09 17:34:37	2021-05-09 17:34:37	2
78946	FIL	2021-04-26	154.39	134.07	154.53	133.79	349695.1	51213534.3	2021-05-07 19:24:30	2021-05-07 19:24:30	13
146332	FIL	2021-04-29	149.83	151.06	152.1	147.31	165563.01	24770457	2021-05-07 19:24:30	2021-05-07 19:24:30	13
159188	FIL	2021-05-01	164.58	164.19	167.57	161.33	175418.66	28745354.31	2021-05-07 19:24:30	2021-05-07 19:24:30	13
286752	FIL	2021-05-05	152.58	140.87	154.81	139.78	357720.65	53682670.4	2021-05-07 19:24:30	2021-05-07 19:24:30	13
306430	ANT	2021-05-30	4.127	3.983	4.311	4.063	162826.65	671980.27	2021-05-31 23:39:42	2021-05-31 23:39:42	14
311704	FIL	2021-06-10	73.36	77.71	79.14	71.53	358586.06	26981166.83	2021-06-11 19:42:16	2021-06-11 19:42:16	13
133166	SJCX	2021-04-27	0.002203	0.002162	0.002203	0.002203	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
270494	SJCX	2021-05-02	0.002265	0.002314	0.002265	0.002265	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
299	XTZ	2021-02-14	4.858	5.364	5.652	4.727	13567604.43	70251136.27	2021-05-07 19:24:31	2021-05-07 19:24:31	5
300	XTZ	2021-02-15	4.537	4.858	4.965	3.84	18237535.78	80985192.48	2021-05-07 19:24:31	2021-05-07 19:24:31	5
284192	SJCX	2021-05-07	0.002295	0.002258	0.002295	0.002295	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
316862	ETH	2021-06-21	1887.89	2243.6	2259.39	1870.01	1396642.92	2759117557.28	2021-06-22 23:44:50	2021-06-22 23:44:50	10
323452	FIL	2021-07-05	56.09	58.77	58.77	54.82	140492.51	7953338.95	2021-07-06 23:48:03	2021-07-06 23:48:03	13
328576	EOS	2021-07-16	3.653	3.665	3.832	3.534	2876781.63	10613215.84	2021-07-17 23:50:31	2021-07-17 23:50:31	9
1182	SJCX	2020-07-14	0.0003702	0.0003695	0.0003702	0.0003702	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
4586	EOS	2020-11-01	2.518	2.527	2.541	2.463	762671.26	1911709.43	2021-05-09 17:34:36	2021-05-09 17:34:36	9
10800	ATOM	2020-06-19	2.6	2.641	2.648	2.584	496915.96	1292196.51	2021-05-09 17:34:36	2021-05-09 17:34:36	3
2175	ZRX	2021-04-01	1.962	1.881	2.07	1.838	16772546.93	32763369.4	2021-05-09 17:34:36	2021-05-09 17:34:36	6
400	DOT	2020-05-25	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
295926	ATOM	2021-05-10	25.37	28.78	29.89	23.83	2099789.51	57023236.39	2021-05-11 23:35:08	2021-05-11 23:35:08	3
159208	BCH	2021-05-01	1006.63	995.92	1031.13	977.18	112055.61	112265011.39	2021-05-09 17:34:36	2021-05-09 17:34:36	8
8994	ANT	2020-07-13	1.446	1.393	1.525	1.392	63570.49	91559.62	2021-05-09 17:34:37	2021-05-09 17:34:37	14
133168	FIL	2021-04-27	152.16	154.39	155.09	148.53	256607.59	39104451.95	2021-05-07 19:24:30	2021-05-07 19:24:30	13
1564	ETH	2020-07-30	335.3	318.14	339.86	318.07	1201599.1	402895123.47	2021-05-07 19:24:30	2021-05-07 19:24:30	10
454	DOT	2020-07-18	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
113	XTZ	2020-08-12	4.364	4.011	4.467	3.634	14509935.53	60021413.99	2021-05-07 19:24:31	2021-05-07 19:24:31	5
4587	EOS	2020-11-02	2.435	2.518	2.549	2.41	1177073.12	2900478.06	2021-05-09 17:34:36	2021-05-09 17:34:36	9
2258	OCN	2020-06-22	0.0003382	0.0003349	0.0003625	0.0003358	19843942.79	6710.96	2021-05-09 17:34:37	2021-05-09 17:34:37	2
234	XTZ	2020-12-11	2.078	2.106	2.114	2.045	1661372.54	3458458.09	2021-05-07 19:24:31	2021-05-07 19:24:31	5
8995	ANT	2020-07-14	1.372	1.446	1.446	1.356	61067.12	84368.19	2021-05-09 17:34:37	2021-05-09 17:34:37	14
455	DOT	2020-07-19	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
159196	ZRX	2021-05-01	1.94	1.803	2.021	1.77	17698718.66	33540046.24	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2647	BTC	2020-07-15	9193.22	9256.07	9272.57	9160.89	23480.12	216386874.26	2021-05-09 17:34:36	2021-05-09 17:34:36	7
291610	XTZ	2021-05-08	6.986	7.096	7.304	6.824	5613507.93	39739905.4	2021-05-09 23:34:40	2021-05-09 23:34:40	5
2674	BTC	2020-08-11	11389.01	11897.41	11940.4	11138.6	62677.5	724227264.93	2021-05-09 17:34:36	2021-05-09 17:34:36	7
1183	SJCX	2020-07-15	0.0003677	0.0003702	0.0003677	0.0003677	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
2259	OCN	2020-06-23	0.000338	0.0003382	0.0003429	0.0003307	10269585.47	3471.04	2021-05-09 17:34:37	2021-05-09 17:34:37	2
1624	ETH	2020-09-28	354.01	357.67	368.15	352.09	338025.49	122046214.19	2021-05-07 19:24:30	2021-05-07 19:24:30	10
4588	EOS	2020-11-03	2.368	2.435	2.443	2.264	1155699.27	2698833.59	2021-05-09 17:34:36	2021-05-09 17:34:36	9
2719	BTC	2020-09-25	10694.12	10742.98	10762.38	10562.14	33843.79	360929423.35	2021-05-09 17:34:36	2021-05-09 17:34:36	7
468	DOT	2020-08-01	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
4617	EOS	2020-12-02	3.061	2.999	3.086	2.97	1627386.72	4932777.37	2021-05-09 17:34:36	2021-05-09 17:34:36	9
469	DOT	2020-08-02	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
301486	EOS	2021-05-20	6.651	5.705	7.025	5.131	22733699.87	141951387.57	2021-05-21 23:37:29	2021-05-21 23:37:29	9
2720	BTC	2020-09-26	10734.23	10694.12	10822.99	10658.15	13794.51	148097714.06	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2721	BTC	2020-09-27	10781.47	10734.23	10810.35	10612.42	13820.35	148127427.26	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2746	BTC	2020-10-22	12990.25	12813.11	13197.69	12700.74	57124.85	739591002.3	2021-05-09 17:34:36	2021-05-09 17:34:36	7
4622	EOS	2020-12-07	2.952	2.998	3.008	2.908	1074483.46	3185884.08	2021-05-09 17:34:36	2021-05-09 17:34:36	9
1726	ETH	2021-01-08	1216.98	1225.5	1273.69	1067.33	1767634.41	2103290577.04	2021-05-07 19:24:30	2021-05-07 19:24:30	10
301	XTZ	2021-02-16	4.552	4.537	4.889	4.309	8672784.46	39770037.65	2021-05-07 19:24:31	2021-05-07 19:24:31	5
470	DOT	2020-08-03	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
302	XTZ	2021-02-17	4.609	4.552	4.768	4.189	8045728.29	36486883.37	2021-05-07 19:24:31	2021-05-07 19:24:31	5
1187	SJCX	2020-07-19	0.0003686	0.0003671	0.0003686	0.0003686	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
471	DOT	2020-08-04	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
1727	ETH	2021-01-09	1279.96	1216.98	1307.77	1173.77	997317.78	1234090079.14	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1188	SJCX	2020-07-20	0.0003666	0.0003686	0.0003666	0.0003666	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
2260	OCN	2020-06-24	0.0003167	0.000338	0.0003284	0.0003073	18288997.41	5791.32	2021-05-09 17:34:37	2021-05-09 17:34:37	2
4626	EOS	2020-12-11	2.696	2.743	2.748	2.653	3809122.04	10249093.22	2021-05-09 17:34:36	2021-05-09 17:34:36	9
2261	OCN	2020-06-25	0.0003137	0.0003167	0.0003183	0.000309	9096918.09	2853.45	2021-05-09 17:34:37	2021-05-09 17:34:37	2
303	XTZ	2021-02-18	4.841	4.609	4.993	4.506	7383721.01	35116227.39	2021-05-07 19:24:31	2021-05-07 19:24:31	5
10873	ATOM	2020-08-31	7.207	7.638	7.816	7.166	640131.41	4778070.97	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10874	ATOM	2020-09-01	7.229	7.207	7.645	7.014	615258.5	4506169.9	2021-05-09 17:34:36	2021-05-09 17:34:36	3
2262	OCN	2020-06-26	0.0003098	0.0003137	0.0003144	0.0003029	7399674.45	2292.2	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2263	OCN	2020-06-27	0.0003025	0.0003098	0.000318	0.0002981	12360858.4	3739.28	2021-05-09 17:34:37	2021-05-09 17:34:37	2
10895	ATOM	2020-09-22	4.204	4.078	4.27	4.034	386063.7	1610545.04	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10971	ATOM	2020-12-07	5.097	5.216	5.226	5.081	247467.22	1273866.67	2021-05-09 17:34:36	2021-05-09 17:34:36	3
304	XTZ	2021-02-19	4.973	4.841	5.106	4.573	6984582.84	34159739.47	2021-05-07 19:24:31	2021-05-07 19:24:31	5
1189	SJCX	2020-07-21	0.0003757	0.0003666	0.0003757	0.0003757	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
10972	ATOM	2020-12-08	4.739	5.097	5.137	4.645	561767.61	2771699.89	2021-05-09 17:34:36	2021-05-09 17:34:36	3
1216	SJCX	2020-08-17	0.000492	0.0004767	0.000492	0.000492	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
301470	OCN	2021-05-20	0.0007209	0.0007084	0.0008041	0.00061	87167228.73	62842.2	2021-05-21 23:37:25	2021-05-21 23:37:25	2
1777	ETH	2021-02-28	1422.58	1460.23	1469.7	1294.05	1156430.89	1583883301.69	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1784	ETH	2021-03-07	1726.33	1651.48	1734.52	1631.59	449616.47	750450852.99	2021-05-07 19:24:30	2021-05-07 19:24:30	10
280370	XTZ	2021-05-04	5.497	6.009	6.059	5.428	6335102.45	36230689.95	2021-05-07 19:24:31	2021-05-07 19:24:31	5
146334	EOS	2021-04-29	5.892	5.959	6.047	5.618	4341590.12	25352960.76	2021-05-09 17:34:36	2021-05-09 17:34:36	9
2265	OCN	2020-06-29	0.0002985	0.000297	0.0003122	0.0002962	13239444.24	3951.93	2021-05-09 17:34:37	2021-05-09 17:34:37	2
514	DOT	2020-09-16	5.074	5.059	5.281	4.969	562683.69	3086350.68	2021-05-09 17:34:36	2021-05-09 17:34:36	4
1463	SJCX	2021-04-21	0.002152	0.00226	0.002152	0.002152	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
306432	ATOM	2021-05-30	12.56	12.08	13.1	11.3	1302267.66	16143527.31	2021-05-31 23:39:42	2021-05-31 23:39:42	3
311706	ANT	2021-06-10	4.312	4.705	4.732	4.272	191127.85	857669.25	2021-06-11 23:42:18	2021-06-11 23:42:18	14
311730	DOT	2021-06-10	22.67	23.2	24.56	22.1	1124009.71	26342900.1	2021-06-11 23:42:18	2021-06-11 23:42:18	4
316864	XTZ	2021-06-21	2.49	3.075	3.097	2.484	5407957.25	14711880.3	2021-06-22 23:44:50	2021-06-22 23:44:50	5
9148	ANT	2020-12-14	2.979	3.004	3.018	2.909	74395.66	220593.05	2021-05-09 17:34:37	2021-05-09 17:34:37	14
4623	EOS	2020-12-08	2.802	2.952	2.962	2.748	2191112.52	6235789.09	2021-05-09 17:34:36	2021-05-09 17:34:36	9
423	DOT	2020-06-17	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
424	DOT	2020-06-18	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
425	DOT	2020-06-19	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
4624	EOS	2020-12-09	2.812	2.802	2.887	2.669	4584899.27	12837270.81	2021-05-09 17:34:36	2021-05-09 17:34:36	9
1790	ETH	2021-03-13	1921.18	1767.77	1943.37	1728.87	592461.56	1104075445.89	2021-05-07 19:24:30	2021-05-07 19:24:30	10
10775	ATOM	2020-05-25	2.61	2.495	2.621	2.508	801715.33	2092828.96	2021-05-09 17:34:36	2021-05-09 17:34:36	3
1200	SJCX	2020-08-01	0.0004725	0.0004541	0.0004725	0.0004725	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
426	DOT	2020-06-20	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
427	DOT	2020-06-21	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
2449	OCN	2020-12-30	0.0002408	0.0002341	0.0002483	0.0002333	445998548.48	107400.73	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2450	OCN	2020-12-31	0.0002433	0.0002408	0.0002506	0.0002285	354560140.42	86250.12	2021-05-09 17:34:37	2021-05-09 17:34:37	2
1217	SJCX	2020-08-18	0.0004783	0.000492	0.0004783	0.0004783	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1792	ETH	2021-03-15	1794.83	1848.69	1891.24	1735.53	781036.17	1403489044.83	2021-05-07 19:24:30	2021-05-07 19:24:30	10
295928	FIL	2021-05-10	135.64	146.61	149.36	129.92	452942.44	63550475.06	2021-05-11 23:35:08	2021-05-11 23:35:08	13
4636	EOS	2020-12-21	2.929	3.132	3.273	2.905	6562260.2	19971535.65	2021-05-09 17:34:36	2021-05-09 17:34:36	9
10820	ATOM	2020-07-09	3.788	3.553	3.797	3.405	1424707.42	5140914.11	2021-05-09 17:34:36	2021-05-09 17:34:36	3
3007	BCH	2020-07-09	238.18	243.44	240.86	234.3	248453.92	59176787.21	2021-05-09 17:34:36	2021-05-09 17:34:36	8
10974	ATOM	2020-12-10	4.663	4.804	4.822	4.656	290417.13	1375359.75	2021-05-09 17:34:36	2021-05-09 17:34:36	3
2585	BTC	2020-05-14	9793.19	9317.44	9937.97	9263.29	97176.37	936692997.58	2021-05-09 17:34:36	2021-05-09 17:34:36	7
232	XTZ	2020-12-09	2.173	2.153	2.199	2.038	4466041.45	9541616.26	2021-05-07 19:24:31	2021-05-07 19:24:31	5
428	DOT	2020-06-22	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
1277	SJCX	2020-10-17	0.0004547	0.0004531	0.0004547	0.0004547	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1278	SJCX	2020-10-18	0.0004605	0.0004547	0.0004605	0.0004605	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1851	ZRX	2020-05-12	0.3563	0.3423	0.3825	0.3317	18624790.82	6652502.74	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2451	OCN	2021-01-01	0.0002411	0.0002433	0.0002484	0.0002338	267696713.44	64541.14	2021-05-09 17:34:37	2021-05-09 17:34:37	2
429	DOT	2020-06-23	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
1279	SJCX	2020-10-19	0.0004703	0.0004605	0.0004703	0.0004703	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
2490	OCN	2021-02-09	0.0007797	0.0006486	0.00117	0.0006557	414315378.68	323042.53	2021-05-09 17:34:37	2021-05-09 17:34:37	2
295956	SJCX	2021-05-10	0.002235	0.002332	0.002235	0.002235	0	0	2021-05-11 23:35:09	2021-05-11 23:35:09	11
1852	ZRX	2020-05-13	0.349	0.3563	0.375	0.3427	14729188.63	5231678.93	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2586	BTC	2020-05-15	9311.69	9793.19	9841.71	9149.13	84280.62	798930933.92	2021-05-09 17:34:36	2021-05-09 17:34:36	7
4637	EOS	2020-12-22	2.901	2.929	2.952	2.768	3004136.48	8609370.69	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4638	EOS	2020-12-23	2.312	2.901	2.912	1.958	16284982.9	39178495.22	2021-05-09 17:34:36	2021-05-09 17:34:36	9
2701	BTC	2020-09-07	10379.08	10260.37	10411.92	9893.68	41648.61	422137373.09	2021-05-09 17:34:36	2021-05-09 17:34:36	7
1280	SJCX	2020-10-20	0.0004769	0.0004703	0.0004769	0.0004769	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
2703	BTC	2020-09-09	10228.85	10128.54	10349.09	9989.63	33984.18	346738492.44	2021-05-09 17:34:36	2021-05-09 17:34:36	7
242	XTZ	2020-12-19	2.328	2.329	2.393	2.303	2573868.27	6055786.21	2021-05-07 19:24:31	2021-05-07 19:24:31	5
249	XTZ	2020-12-26	1.978	2.028	2.044	1.925	3677613.97	7319865.62	2021-05-07 19:24:31	2021-05-07 19:24:31	5
1281	SJCX	2020-10-21	0.0005125	0.0004769	0.0005125	0.0005125	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
2544	OCN	2021-04-04	0.001641	0.001447	0.00189	0.001474	29224503.47	47943.67	2021-05-09 17:34:37	2021-05-09 17:34:37	2
3008	BCH	2020-07-10	238.34	238.18	242.62	236.67	238916.54	56944492.53	2021-05-09 17:34:36	2021-05-09 17:34:36	8
280396	BCH	2021-05-04	951.33	1015.58	1054.81	934.46	198525.11	195364115.26	2021-05-09 17:34:36	2021-05-09 17:34:36	8
2729	BTC	2020-10-05	10795.11	10675.52	10799.53	10627.77	23891.17	255950434.22	2021-05-09 17:34:36	2021-05-09 17:34:36	7
79678	OCN	2021-04-26	0.002003	0.001811	0.002307	0.001901	49486241.55	99099.71	2021-05-09 17:34:37	2021-05-09 17:34:37	2
318	XTZ	2021-03-05	3.758	3.662	3.861	3.444	5665994.64	20921470.28	2021-05-07 19:24:31	2021-05-07 19:24:31	5
146336	XTZ	2021-04-29	5.245	5.253	5.434	5.103	2634410.78	13830913.99	2021-05-07 19:24:31	2021-05-07 19:24:31	5
270498	XTZ	2021-05-02	5.61	5.822	5.862	5.46	2387567.66	13439276.05	2021-05-07 19:24:31	2021-05-07 19:24:31	5
301472	BTC	2021-05-20	40597.4	36771.87	42520.03	35009.25	139648.53	5531454912.79	2021-05-21 22:37:25	2021-05-21 22:37:25	7
10989	ATOM	2020-12-25	4.906	4.958	5.052	4.752	445300.34	2175399.29	2021-05-09 17:34:36	2021-05-09 17:34:36	3
1793	ETH	2021-03-16	1805.64	1794.83	1819.57	1716.2	624327.03	1108536467.78	2021-05-07 19:24:30	2021-05-07 19:24:30	10
2731	BTC	2020-10-07	10672.67	10603.9	10679.76	10554.41	19601.45	208253472.75	2021-05-09 17:34:36	2021-05-09 17:34:36	7
133170	ETH	2021-04-27	2667.93	2534.9	2681.47	2485.34	607149.72	1576533318.02	2021-05-07 19:24:30	2021-05-07 19:24:30	10
306434	ZRX	2021-05-30	0.9385	0.8999	0.989	0.8438	6313382.65	5895676.31	2021-05-31 23:39:42	2021-05-31 23:39:42	6
2733	BTC	2020-10-09	11058.78	10929.4	11109.32	10839.3	32665.61	359802403.01	2021-05-09 17:34:36	2021-05-09 17:34:36	7
311742	EOS	2021-06-10	5.076	5.34	5.471	4.931	4598005.87	23793402.75	2021-06-11 23:42:18	2021-06-11 23:42:18	9
311708	ATOM	2021-06-10	12.83	13.94	14.06	12.57	1079083	14315476.62	2021-06-11 19:42:16	2021-06-11 19:42:16	3
11005	ATOM	2021-01-10	6.421	6.561	7.163	5.922	2775868.26	18424046.14	2021-05-09 17:34:36	2021-05-09 17:34:36	3
4641	EOS	2020-12-26	2.608	2.666	2.693	2.526	4584251.34	11967181.76	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4642	EOS	2020-12-27	2.713	2.608	2.865	2.474	7641466.53	20563138.24	2021-05-09 17:34:36	2021-05-09 17:34:36	9
693	DOT	2021-03-14	36.49	37.15	37.96	36.29	674142.75	24949645.01	2021-05-09 17:34:36	2021-05-09 17:34:36	4
703	DOT	2021-03-24	30.27	34.22	36.1	28.42	2184599.07	71084667.45	2021-05-09 17:34:36	2021-05-09 17:34:36	4
316866	BTC	2021-06-21	31652.62	35602.26	35760.61	31284.7	111039.05	3650731161.39	2021-06-22 23:44:50	2021-06-22 23:44:50	7
323454	ATOM	2021-07-05	13.56	12.32	13.97	11.95	2578194.78	33584827.44	2021-07-06 23:48:03	2021-07-06 23:48:03	3
328578	BTC	2021-07-16	31401.76	31867.46	32256.94	31046.14	25602.04	812765644.4	2021-07-17 23:50:31	2021-07-17 23:50:31	7
328588	DOT	2021-07-16	12.04	13.09	13.3	12.02	1125812.21	14157518.81	2021-07-17 23:50:31	2021-07-17 23:50:31	4
337716	BCH	2021-08-05	548.77	545.44	550.69	523.25	90826.09	48897279.13	2021-08-06 23:55:08	2021-08-06 23:55:08	8
2592	BTC	2020-05-21	9059.11	9509.45	9566.81	8811.54	87116.97	798218781.95	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2593	BTC	2020-05-22	9170.74	9059.11	9265.04	8936.82	44400.9	405255700.32	2021-05-09 17:34:36	2021-05-09 17:34:36	7
4589	EOS	2020-11-04	2.35	2.368	2.375	2.295	475550.68	1111659.09	2021-05-09 17:34:36	2021-05-09 17:34:36	9
146	XTZ	2020-09-14	2.614	2.625	2.7	2.54	2191779.06	5758603.17	2021-05-07 19:24:31	2021-05-07 19:24:31	5
444	DOT	2020-07-08	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
1952	ZRX	2020-08-21	0.6924	0.6121	0.9675	0.6121	154822224.41	121488033.32	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1977	ZRX	2020-09-15	0.4489	0.4736	0.4788	0.4456	3836160.52	1762610.94	2021-05-09 17:34:36	2021-05-09 17:34:36	6
10844	ATOM	2020-08-02	3.909	4.089	4.244	3.468	617246.65	2450572.16	2021-05-09 17:34:36	2021-05-09 17:34:36	3
445	DOT	2020-07-09	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
2425	OCN	2020-12-06	0.000277	0.0002806	0.000283	0.000271	163477017.83	45281.34	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2436	OCN	2020-12-17	0.000283	0.0002806	0.0002894	0.0002637	297155196.52	84092.07	2021-05-09 17:34:37	2021-05-09 17:34:37	2
446	DOT	2020-07-10	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
147	XTZ	2020-09-15	2.502	2.614	2.677	2.502	2677828	6890934.5	2021-05-07 19:24:31	2021-05-07 19:24:31	5
2735	BTC	2020-10-11	11375.51	11301.57	11434.1	11284.09	17795.07	202131016.49	2021-05-09 17:34:36	2021-05-09 17:34:36	7
1630	ETH	2020-10-04	352.61	346.32	353.57	348.34	336496.16	118652727.18	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1631	ETH	2020-10-05	353.76	352.61	357.64	353.32	392691.17	138916761.21	2021-05-07 19:24:30	2021-05-07 19:24:30	10
3009	BCH	2020-07-11	236.56	238.34	238.04	235.55	122914.67	29077050.7	2021-05-09 17:34:36	2021-05-09 17:34:36	8
4590	EOS	2020-11-05	2.442	2.35	2.49	2.35	898150.91	2167310.2	2021-05-09 17:34:36	2021-05-09 17:34:36	9
1986	ZRX	2020-09-24	0.3822	0.3406	0.3874	0.3376	4229435.64	1527042.15	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2741	BTC	2020-10-17	11367.65	11326.25	11410.01	11270.69	9901.25	112306061.3	2021-05-09 17:34:36	2021-05-09 17:34:36	7
4714	EOS	2021-03-09	4.169	3.897	4.183	3.853	6131738.83	24648169.04	2021-05-09 17:34:36	2021-05-09 17:34:36	9
1148	SJCX	2020-06-10	0.0003957	0.0003912	0.0003957	0.0003957	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
10859	ATOM	2020-08-17	5.918	6.244	6.328	5.916	757831.53	4630448.97	2021-05-09 17:34:36	2021-05-09 17:34:36	3
301474	SJCX	2021-05-20	0.001624	0.001471	0.001624	0.001624	0	0	2021-05-21 23:37:26	2021-05-21 23:37:26	11
1995	ZRX	2020-10-03	0.3765	0.39	0.3947	0.3759	3093365.91	1194027.47	2021-05-09 17:34:36	2021-05-09 17:34:36	6
11042	ATOM	2021-02-16	25.13	22.5	26.67	22.26	7247395.07	179390504.29	2021-05-09 17:34:36	2021-05-09 17:34:36	3
1149	SJCX	2020-06-11	0.0003707	0.0003957	0.0003707	0.0003707	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
67512	ETH	2021-04-24	2216.56	2369.67	2370.67	2159.64	545795.93	1232014469.73	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1150	SJCX	2020-06-12	0.0003786	0.0003707	0.0003786	0.0003786	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
2437	OCN	2020-12-18	0.0003011	0.000283	0.0003142	0.0002815	218154645.94	65684.84	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2468	OCN	2021-01-18	0.0002768	0.0002714	0.0002894	0.0002642	393713813.32	108991.09	2021-05-09 17:34:37	2021-05-09 17:34:37	2
295930	ZRX	2021-05-10	1.74	1.954	2.024	1.657	15023501.01	28149932.13	2021-05-11 23:35:08	2021-05-11 23:35:08	6
291614	OCN	2021-05-08	0.001841	0.001951	0.002389	0.001762	52286732.29	96240.92	2021-05-09 23:34:40	2021-05-09 23:34:40	2
3125	BCH	2020-11-04	241.25	244.43	248.61	238.27	113967.46	27494389.79	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3118	BCH	2020-10-28	268.64	264.6	279.94	253.89	170475.78	45797007.92	2021-05-09 17:34:36	2021-05-09 17:34:36	8
159204	OCN	2021-05-01	0.001975	0.002026	0.002181	0.001946	34888463.86	68905.62	2021-05-09 17:34:37	2021-05-09 17:34:37	2
3119	BCH	2020-10-29	267.49	268.64	275.17	263.99	166280.94	44479073.38	2021-05-09 17:34:36	2021-05-09 17:34:36	8
1996	ZRX	2020-10-04	0.3761	0.3765	0.3814	0.3643	2248508.2	841670.15	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1997	ZRX	2020-10-05	0.3769	0.3761	0.3812	0.371	2199514.06	827021.28	2021-05-09 17:34:36	2021-05-09 17:34:36	6
3126	BCH	2020-11-05	249.75	241.25	270.5	249.29	125723.87	31400129.85	2021-05-09 17:34:36	2021-05-09 17:34:36	8
1151	SJCX	2020-06-13	0.000379	0.0003786	0.000379	0.000379	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1201	SJCX	2020-08-02	0.0004425	0.0004725	0.0004425	0.0004425	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1998	ZRX	2020-10-06	0.3518	0.3769	0.3779	0.3485	3945822.22	1425029.93	2021-05-09 17:34:36	2021-05-09 17:34:36	6
311710	ZRX	2021-06-10	0.9317	0.966	0.9838	0.9124	5780002.5	5496915.71	2021-06-11 23:42:18	2021-06-11 23:42:18	6
447	DOT	2020-07-11	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
3127	BCH	2020-11-06	258.18	249.75	259.12	247.27	108677.9	28058532.73	2021-05-09 17:34:36	2021-05-09 17:34:36	8
448	DOT	2020-07-12	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
449	DOT	2020-07-13	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
2742	BTC	2020-10-18	11513.33	11367.65	11513.68	11357.25	11528.41	131886570.58	2021-05-09 17:34:36	2021-05-09 17:34:36	7
502	DOT	2020-09-04	5.127	5.717	5.984	4.571	1250630.31	6504986.68	2021-05-09 17:34:36	2021-05-09 17:34:36	4
306436	FIL	2021-05-30	68.37	68.25	69.45	65.33	587344.31	39759775.73	2021-05-31 23:39:42	2021-05-31 23:39:42	13
3128	BCH	2020-11-07	254.03	258.18	263.97	245.57	112151.33	28489723.76	2021-05-09 17:34:36	2021-05-09 17:34:36	8
503	DOT	2020-09-05	4.136	5.127	5.304	3.576	3095552.76	13619253.64	2021-05-09 17:34:36	2021-05-09 17:34:36	4
520	DOT	2020-09-22	4.171	4.062	4.213	3.903	741756.37	3020252.26	2021-05-09 17:34:36	2021-05-09 17:34:36	4
280374	ZRX	2021-05-04	1.681	1.903	1.904	1.651	17582668.67	31022983.06	2021-05-09 17:34:36	2021-05-09 17:34:36	6
316868	OCN	2021-06-21	0.0004909	0.000718	0.000623	0.0004909	39979058.83	19623.78	2021-06-22 23:44:50	2021-06-22 23:44:50	2
2784	BTC	2020-11-29	18199.23	17739.9	18347.24	17543.55	27161.16	489679989.73	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2786	BTC	2020-12-01	18792.03	19686.87	19911.79	18194.17	91108.23	1743191338.61	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2796	BTC	2020-12-11	18034.86	18250.47	18295.1	17598.13	45166.17	809318887.79	2021-05-09 17:34:36	2021-05-09 17:34:36	7
1202	SJCX	2020-08-03	0.0004494	0.0004425	0.0004494	0.0004494	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1203	SJCX	2020-08-04	0.0004478	0.0004494	0.0004478	0.0004478	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
311750	SJCX	2021-06-10	0.001467	0.001496	0.001467	0.001467	0	0	2021-06-11 23:42:18	2021-06-11 23:42:18	11
323456	ETH	2021-07-05	2196.71	2323.27	2323.53	2159.57	364621.13	817032182.71	2021-07-06 23:48:02	2021-07-06 23:48:02	10
328580	BCH	2021-07-16	438.37	455.7	456.27	436.8	146610.86	64269592.99	2021-07-17 23:50:31	2021-07-17 23:50:31	8
337722	OCN	2021-08-05	0.001217	0.000954	0.001386	0.0009619	49097706.24	59730.74	2021-08-06 23:55:08	2021-08-06 23:55:08	2
337718	XTZ	2021-08-05	3.222	3.175	3.27	3.076	4509024.34	14397192.1	2021-08-06 23:55:08	2021-08-06 23:55:08	5
342906	DOT	2021-08-16	24.49	23.17	25.69	22.85	5120979.56	125935798.67	2021-08-17 23:57:39	2021-08-17 23:57:39	4
342902	BTC	2021-08-16	45927.4	47015.94	48064.42	45681.1	28459.99	1332377363.69	2021-08-17 23:57:39	2021-08-17 23:57:39	7
133174	ZRX	2021-04-27	1.824	1.525	1.889	1.509	32303849.39	56973202.32	2021-05-09 17:34:36	2021-05-09 17:34:36	6
146340	ETH	2021-04-29	2758.46	2750.91	2799.55	2672.02	617743.29	1693692607.67	2021-05-07 19:24:30	2021-05-07 19:24:30	10
136	XTZ	2020-09-04	2.747	2.574	2.854	2.443	5473792.87	14504152.46	2021-05-07 19:24:31	2021-05-07 19:24:31	5
450	DOT	2020-07-14	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
506	DOT	2020-09-08	4.272	4.59	4.623	4.119	866043.27	3743432.2	2021-05-09 17:34:36	2021-05-09 17:34:36	4
2469	OCN	2021-01-19	0.0002735	0.0002768	0.0003009	0.0002599	315384859.39	86267.22	2021-05-09 17:34:37	2021-05-09 17:34:37	2
507	DOT	2020-09-09	4.697	4.272	4.791	4.139	952095.97	4327914.11	2021-05-09 17:34:36	2021-05-09 17:34:36	4
1215	SJCX	2020-08-16	0.0004767	0.0004744	0.0004767	0.0004767	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
508	DOT	2020-09-10	4.582	4.697	4.892	4.447	969541.68	4510647.87	2021-05-09 17:34:36	2021-05-09 17:34:36	4
10926	ATOM	2020-10-23	5.367	5.448	5.499	5.169	376881.5	2018942.24	2021-05-09 17:34:36	2021-05-09 17:34:36	3
4593	EOS	2020-11-08	2.539	2.501	2.563	2.49	371211.71	939655.78	2021-05-09 17:34:36	2021-05-09 17:34:36	9
518	DOT	2020-09-20	4.679	4.932	4.975	4.413	705466.13	3279490.65	2021-05-09 17:34:36	2021-05-09 17:34:36	4
295932	DOT	2021-05-10	36.54	40.35	41.85	32.61	1610557	61145378.02	2021-05-11 23:35:08	2021-05-11 23:35:08	4
2596	BTC	2020-05-25	8901.48	8718.49	8977.43	8639.46	43894.32	386241517.98	2021-05-09 17:34:36	2021-05-09 17:34:36	7
1271	SJCX	2020-10-11	0.000455	0.0004521	0.000455	0.000455	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1640	ETH	2020-10-14	379.11	381.21	384.25	377.28	478125.8	181262215.14	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1641	ETH	2020-10-15	377.7	379.11	383.69	377.36	591728.69	223497544.12	2021-05-07 19:24:30	2021-05-07 19:24:30	10
301476	ANT	2021-05-20	5.026	4.486	5.261	4.441	1151529.89	5787541	2021-05-21 23:37:25	2021-05-21 23:37:25	14
291616	FIL	2021-05-08	148.32	150.45	154.25	146.36	276219.08	41441853.55	2021-05-09 23:34:40	2021-05-09 23:34:40	13
11035	ATOM	2021-02-09	15.09	14.19	15.5	13.81	2975643.4	43521859.86	2021-05-09 17:34:36	2021-05-09 17:34:36	3
688	DOT	2021-03-09	38.23	34.99	38.9	34.56	1451028.05	53238281.26	2021-05-09 17:34:36	2021-05-09 17:34:36	4
11036	ATOM	2021-02-10	15.01	15.09	15.48	13.57	2961839.87	43646378.01	2021-05-09 17:34:36	2021-05-09 17:34:36	3
1272	SJCX	2020-10-12	0.0004616	0.000455	0.0004616	0.0004616	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
11037	ATOM	2021-02-11	17.68	15.01	18.38	14.81	4061763.35	67795882.41	2021-05-09 17:34:36	2021-05-09 17:34:36	3
2470	OCN	2021-01-20	0.0002756	0.0002735	0.0003031	0.0002618	364907072.55	100550.14	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2471	OCN	2021-01-21	0.0002556	0.0002756	0.0002556	0.0002112	340348468.65	87007.6	2021-05-09 17:34:37	2021-05-09 17:34:37	2
4594	EOS	2020-11-09	2.497	2.539	2.559	2.463	514632.4	1297023.54	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4595	EOS	2020-11-10	2.501	2.497	2.528	2.481	440946.15	1104024.22	2021-05-09 17:34:36	2021-05-09 17:34:36	9
3143	BCH	2020-11-22	288.44	303.75	306.32	280.51	484634.22	139787280.63	2021-05-09 17:34:36	2021-05-09 17:34:36	8
2583	BTC	2020-05-12	8821.18	8568.88	8975.74	8541.95	66073.43	580579256.62	2021-05-09 17:34:36	2021-05-09 17:34:36	7
1273	SJCX	2020-10-13	0.0004571	0.0004616	0.0004571	0.0004571	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1274	SJCX	2020-10-14	0.0004572	0.0004571	0.0004572	0.0004572	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
11038	ATOM	2021-02-12	21.15	17.68	22.22	17.28	5823692.79	117682014.68	2021-05-09 17:34:36	2021-05-09 17:34:36	3
1275	SJCX	2020-10-15	0.0004603	0.0004572	0.0004603	0.0004603	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1305	SJCX	2020-11-14	0.000643	0.0006533	0.000643	0.000643	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
2472	OCN	2021-01-22	0.0002469	0.0002556	0.0002963	0.0002469	396644050.58	97936.18	2021-05-09 17:34:37	2021-05-09 17:34:37	2
301482	FIL	2021-05-20	88.89	65.66	95.56	61.29	1456826.9	119544959.97	2021-05-21 23:37:25	2021-05-21 23:37:25	13
2584	BTC	2020-05-13	9317.44	8821.18	9407.67	8807.57	68248.72	622255318.55	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2597	BTC	2020-05-26	8844.5	8901.48	9011.53	8705.66	39855.17	352930782.24	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2480	OCN	2021-01-30	0.0002621	0.0002758	0.0002897	0.0002621	198909442.47	52129.49	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2615	BTC	2020-06-13	9474.65	9464.23	9492	9363.89	16597.62	156509665.57	2021-05-09 17:34:36	2021-05-09 17:34:36	7
162	XTZ	2020-09-30	2.198	2.228	2.237	2.138	2054605.12	4493943.6	2021-05-07 19:24:31	2021-05-07 19:24:31	5
306438	DOT	2021-05-30	20.46	19.85	21.29	18.48	1132696.81	22966389.85	2021-05-31 22:39:42	2021-05-31 22:39:42	4
4601	EOS	2020-11-16	2.584	2.498	2.607	2.487	1525926.71	3920099.94	2021-05-09 17:34:36	2021-05-09 17:34:36	9
2542	OCN	2021-04-02	0.001281	0.00124	0.001387	0.001281	8774817.23	11237.7	2021-05-09 17:34:37	2021-05-09 17:34:37	2
4618	EOS	2020-12-03	3.085	3.061	3.136	3.013	1466735.7	4515650.73	2021-05-09 17:34:36	2021-05-09 17:34:36	9
2616	BTC	2020-06-14	9333.7	9474.65	9479.56	9251.02	19334.41	181308843.48	2021-05-09 17:34:36	2021-05-09 17:34:36	7
142118	EOS	2021-04-28	5.959	6.056	6.223	5.698	6840467.78	40589238.08	2021-05-09 17:34:36	2021-05-09 17:34:36	9
2635	BTC	2020-07-03	9066.46	9092.8	9127.05	9047.38	21807.46	198428092.21	2021-05-09 17:34:36	2021-05-09 17:34:36	7
317	XTZ	2021-03-04	3.662	3.848	3.97	3.561	5249856.4	19803898.93	2021-05-07 19:24:31	2021-05-07 19:24:31	5
2651	BTC	2020-07-19	9216.02	9177.22	9238.3	9113.41	12797.83	117297958.15	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2543	OCN	2021-04-03	0.001447	0.001281	0.001688	0.001206	21849001.04	31607.13	2021-05-09 17:34:37	2021-05-09 17:34:37	2
3144	BCH	2020-11-23	322.12	288.44	325.24	286.27	500138.71	161103763.41	2021-05-09 17:34:36	2021-05-09 17:34:36	8
701	DOT	2021-03-22	35.24	36.7	35.73	34.23	2522067.32	88871895.75	2021-05-09 17:34:36	2021-05-09 17:34:36	4
311712	XTZ	2021-06-10	3.27	3.509	3.543	3.2	3263307.69	11015369.49	2021-06-11 23:42:18	2021-06-11 23:42:18	5
67504	XTZ	2021-04-24	4.454	4.823	4.828	4.406	3722993.16	17113727.34	2021-05-07 19:24:31	2021-05-07 19:24:31	5
133176	XTZ	2021-04-27	5.434	5.233	5.491	5.153	4032449.94	21576709.1	2021-05-07 19:24:31	2021-05-07 19:24:31	5
3168	BCH	2020-12-17	310.84	312.6	339.59	303.31	543395.75	168908023.9	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3169	BCH	2020-12-18	313.72	310.84	322.28	310.94	349552.61	109661060.78	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3172	BCH	2020-12-21	313.41	349.19	364.32	310.23	883765.9	276978527.86	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3173	BCH	2020-12-22	323.52	313.41	329.24	313.75	485325.05	157012692.91	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3183	BCH	2021-01-01	342.38	342.45	357.37	339.74	248477.7	85074080.92	2021-05-09 17:34:36	2021-05-09 17:34:36	8
316870	FIL	2021-06-21	46.19	63.16	63.67	44.95	1115414.56	58888421.17	2021-06-22 22:44:50	2021-06-22 22:44:50	13
323458	BTC	2021-07-05	33702.79	35287.97	35290.8	33151.51	31526.39	1072690410.4	2021-07-06 23:48:03	2021-07-06 23:48:03	7
328582	ANT	2021-07-16	3.357	3.461	3.473	3.357	311680.2	1046263.1	2021-07-17 23:50:31	2021-07-17 23:50:31	14
337720	BTC	2021-08-05	40888.18	39738.56	41409.14	37330.04	59748.14	2357831521.97	2021-08-06 23:55:07	2021-08-06 23:55:07	7
342904	ETH	2021-08-16	3147.63	3311.12	3337.45	3137.59	372474.25	1207480563.4	2021-08-17 23:57:40	2021-08-17 23:57:40	10
2617	BTC	2020-06-15	9429.65	9333.7	9498.69	8909.5	66872.84	616170633.01	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2933	BCH	2020-04-26	246.6	238.41	248.98	242.82	509868.96	125732271.67	2021-04-26 23:28:51	2021-04-26 23:28:51	8
451	DOT	2020-07-15	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
2481	OCN	2021-01-31	0.0002891	0.0002621	0.0002891	0.0002497	241811135.12	69912.34	2021-05-09 17:34:37	2021-05-09 17:34:37	2
509	DOT	2020-09-11	4.653	4.582	4.732	4.323	714122.5	3219497.24	2021-05-09 17:34:36	2021-05-09 17:34:36	4
2482	OCN	2021-02-01	0.0002887	0.0002891	0.0003162	0.0002887	234092194.22	67572.98	2021-05-09 17:34:37	2021-05-09 17:34:37	2
19	XTZ	2020-05-10	2.565	2.811	2.814	2.364	8535995.93	21855680.79	2021-05-07 19:24:31	2021-05-07 19:24:31	5
13	XTZ	2020-05-04	2.784	2.743	2.852	2.593	5015708.17	13668795.87	2021-05-03 03:13:20	2021-05-03 03:13:20	5
1722	ETH	2021-01-04	1043.16	978.69	1163.36	889.78	2903509.97	2941908637.58	2021-05-07 19:24:30	2021-05-07 19:24:30	10
535	DOT	2020-10-07	3.859	3.753	3.884	3.601	598386.4	2252215.41	2021-05-09 17:34:36	2021-05-09 17:34:36	4
1276	SJCX	2020-10-16	0.0004531	0.0004603	0.0004531	0.0004531	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
4619	EOS	2020-12-04	2.847	3.085	3.139	2.8	3235107.97	9643118.86	2021-05-09 17:34:36	2021-05-09 17:34:36	9
1731	ETH	2021-01-13	1129.84	1050.04	1136.66	985.32	1182504.51	1262994625.32	2021-05-07 19:24:30	2021-05-07 19:24:30	10
10790	ATOM	2020-06-09	3.121	3.154	3.184	3.089	281252.74	882170.56	2021-05-09 17:34:36	2021-05-09 17:34:36	3
2931	BCH	2020-04-24	237.97	237.78	240.45	236.17	426222.71	101429988.66	2021-04-24 20:28:41	2021-04-24 20:28:41	8
3010	BCH	2020-07-12	237.36	236.56	239.22	235.22	120578.11	28620449.61	2021-05-09 17:34:36	2021-05-09 17:34:36	8
536	DOT	2020-10-08	4.122	3.859	4.171	3.648	843340.7	3311579.81	2021-05-09 17:34:36	2021-05-09 17:34:36	4
537	DOT	2020-10-09	4.263	4.122	4.349	4.015	790964.03	3322881.66	2021-05-09 17:34:36	2021-05-09 17:34:36	4
563	DOT	2020-11-04	4.102	4.029	4.15	3.9	212893.72	851391.38	2021-05-09 17:34:36	2021-05-09 17:34:36	4
1282	SJCX	2020-10-22	0.0005196	0.0005125	0.0005196	0.0005196	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1284	SJCX	2020-10-24	0.000525	0.0005175	0.000525	0.000525	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
2618	BTC	2020-06-16	9526.7	9429.65	9585.17	9383.33	39887.07	378768702.55	2021-05-09 17:34:36	2021-05-09 17:34:36	7
295934	ANT	2021-05-10	9.157	10.23	9.95	9.006	989375.38	9059803.99	2021-05-11 23:35:09	2021-05-11 23:35:09	14
1309	SJCX	2020-11-18	0.0007115	0.0007073	0.0007115	0.0007115	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1310	SJCX	2020-11-19	0.000713	0.0007115	0.000713	0.000713	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
291618	EOS	2021-05-08	10.35	10.38	11.21	9.621	17253072.73	178602551.89	2021-05-09 23:34:40	2021-05-09 23:34:40	9
2934	BCH	2020-04-27	243.05	246.6	249.35	239.07	677817.36	164740165.06	2021-04-27 14:21:33	2021-04-27 14:21:33	8
4620	EOS	2020-12-05	3.012	2.847	3.013	2.824	1112214.87	3254128.01	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4621	EOS	2020-12-06	2.998	3.012	3.034	2.913	938747.75	2789239.28	2021-05-09 17:34:36	2021-05-09 17:34:36	9
2932	BCH	2020-04-25	238.41	237.97	242.41	237.8	384656.79	91704949.34	2021-04-24 20:28:41	2021-04-24 20:28:41	8
142128	FIL	2021-04-28	151.06	152.16	155.8	147.05	271975.63	40922676.91	2021-05-07 19:24:30	2021-05-07 19:24:30	13
146366	OCN	2021-04-29	0.002041	0.002146	0.002234	0.001931	32080759.82	65485.18	2021-05-09 17:34:37	2021-05-09 17:34:37	2
1311	SJCX	2020-11-20	0.0007469	0.000713	0.0007469	0.0007469	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
4639	EOS	2020-12-24	2.668	2.312	2.689	2.252	11593643.46	28972116.65	2021-05-09 17:34:36	2021-05-09 17:34:36	9
26	XTZ	2020-05-17	2.623	2.63	2.689	2.602	2620267.6	6932100.16	2021-05-07 19:24:31	2021-05-07 19:24:31	5
10871	ATOM	2020-08-29	7.276	7.57	7.604	7.276	555114.73	4139746.28	2021-05-09 17:34:36	2021-05-09 17:34:36	3
1732	ETH	2021-01-14	1232.11	1129.84	1246.36	1087.39	1151856.9	1349158455.8	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1733	ETH	2021-01-15	1169.06	1232.11	1255.19	1069.37	1395002.47	1643038085.27	2021-05-07 19:24:30	2021-05-07 19:24:30	10
4640	EOS	2020-12-25	2.666	2.668	2.743	2.545	8010305.4	21115078.22	2021-05-09 17:34:36	2021-05-09 17:34:36	9
1734	ETH	2021-01-16	1228.52	1169.06	1293.2	1152.92	1020332.59	1250938805.76	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1775	ETH	2021-02-26	1446.1	1481.88	1563.11	1400.53	1036113.25	1529005290.71	2021-05-07 19:24:30	2021-05-07 19:24:30	10
27	XTZ	2020-05-18	2.755	2.623	2.769	2.618	3615787.7	9854468.84	2021-05-07 19:24:31	2021-05-07 19:24:31	5
10940	ATOM	2020-11-06	4.884	4.508	4.951	4.471	621019.47	2931888.61	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10941	ATOM	2020-11-07	4.625	4.884	5.163	4.513	314172.68	1529653.32	2021-05-09 17:34:36	2021-05-09 17:34:36	3
4648	EOS	2021-01-02	2.632	2.64	2.724	2.565	6161474.96	16170704.18	2021-05-09 17:34:36	2021-05-09 17:34:36	9
2930	BCH	2020-04-23	237.78	233.33	245.05	237.11	507832.28	120754232.17	2021-04-23 22:23:54	2021-04-23 22:23:54	8
137	XTZ	2020-09-05	2.484	2.747	2.83	2.319	6557164.72	16529831.1	2021-05-07 19:24:31	2021-05-07 19:24:31	5
2619	BTC	2020-06-17	9459.13	9526.7	9550.06	9243.06	34516.51	325191529.46	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2640	BTC	2020-07-08	9439.2	9257.32	9471.65	9236.9	37422.23	350318105.76	2021-05-09 17:34:36	2021-05-09 17:34:36	7
142	XTZ	2020-09-10	2.575	2.53	2.662	2.53	2588183.81	6721067.8	2021-05-07 19:24:31	2021-05-07 19:24:31	5
2641	BTC	2020-07-09	9238.95	9439.2	9441.67	9171.37	30177.18	280648694.08	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2677	BTC	2020-08-14	11774.52	11790.68	11863.43	11657.2	37248.83	437825096.08	2021-05-09 17:34:36	2021-05-09 17:34:36	7
218	XTZ	2020-11-25	2.6	2.673	2.968	2.48	15712842.58	43094318.59	2021-05-07 19:24:31	2021-05-07 19:24:31	5
3147	BCH	2020-11-26	271.72	313.47	291.47	263.13	562747.46	152910924.53	2021-05-09 17:34:36	2021-05-09 17:34:36	8
2855	BTC	2021-02-08	46437.41	38868.82	46606.82	38063.87	138485.21	5944522159.67	2021-05-09 17:34:36	2021-05-09 17:34:36	7
219	XTZ	2020-11-26	2.248	2.6	2.661	2.108	14709907.74	33980271.87	2021-05-07 19:24:31	2021-05-07 19:24:31	5
301478	BCH	2021-05-20	819.05	696.72	866.4	617.3	343893	263621133.15	2021-05-21 23:37:25	2021-05-21 23:37:25	8
306440	EOS	2021-05-30	6.03	6.019	6.369	5.548	3876047.32	23317339.18	2021-05-31 23:39:42	2021-05-31 23:39:42	9
3148	BCH	2020-11-27	265.73	271.72	274.82	265.04	311884.04	82877242.24	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3149	BCH	2020-11-28	276.39	265.73	288.27	274.08	285454.66	78896140.38	2021-05-09 17:34:36	2021-05-09 17:34:36	8
11006	ATOM	2021-01-11	5.724	6.421	6.43	5.001	2372569.42	13185502.42	2021-05-09 17:34:36	2021-05-09 17:34:36	3
11007	ATOM	2021-01-12	5.712	5.724	6.141	5.506	1639399.87	9537073.02	2021-05-09 17:34:36	2021-05-09 17:34:36	3
311714	ETH	2021-06-10	2471.56	2610.64	2624.05	2428.83	403228.88	1018177774.01	2021-06-11 23:42:18	2021-06-11 23:42:18	10
1337	SJCX	2020-12-16	0.0008541	0.0007777	0.0008541	0.0008541	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
316872	BCH	2021-06-21	456.21	556.45	559.4	455.22	125213.39	61905661.12	2021-06-22 23:44:50	2021-06-22 23:44:50	8
323460	SJCX	2021-07-05	0.001348	0.001412	0.001348	0.001348	0	0	2021-07-06 23:48:03	2021-07-06 23:48:03	11
328584	OCN	2021-07-16	0.0009385	0.001074	0.001089	0.0009198	22764881.29	21365.41	2021-07-17 23:50:31	2021-07-17 23:50:31	2
2607	BTC	2020-06-05	9622.02	9794.55	9846.54	9611.19	41806.08	406449067.36	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2268	OCN	2020-07-02	0.0002876	0.0003027	0.000299	0.0002876	9654407.65	2777.02	2021-05-09 17:34:37	2021-05-09 17:34:37	2
28	XTZ	2020-05-19	2.832	2.755	2.838	2.634	4416984.8	12141607.4	2021-05-07 19:24:31	2021-05-07 19:24:31	5
1218	SJCX	2020-08-19	0.0004704	0.0004783	0.0004704	0.0004704	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
2621	BTC	2020-06-19	9301.83	9380.67	9419.99	9239.58	31669.73	295439171.8	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2269	OCN	2020-07-03	0.0002994	0.0002876	0.0002994	0.0002859	6300094.52	1886.56	2021-05-09 17:34:37	2021-05-09 17:34:37	2
1222	SJCX	2020-08-23	0.0004661	0.0004668	0.0004661	0.0004661	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
8996	ANT	2020-07-15	1.388	1.372	1.401	1.358	65628.58	90380.6	2021-05-09 17:34:37	2021-05-09 17:34:37	14
1707	ETH	2020-12-20	638.17	658.7	661.05	621.84	477979.98	308930175.05	2021-05-07 19:24:30	2021-05-07 19:24:30	10
452	DOT	2020-07-16	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
3367	FIL	2020-07-03	17.86	14.94	20.61	14.81	603.65	10781.75	2021-05-07 19:24:30	2021-05-07 19:24:30	13
472	DOT	2020-08-05	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
295936	OCN	2021-05-10	0.001619	0.001806	0.001896	0.00158	35486473.35	57467	2021-05-11 23:35:07	2021-05-11 23:35:07	2
146358	ATOM	2021-04-29	22.22	22.95	23	21.17	1357185.19	30089438.45	2021-05-09 17:34:36	2021-05-09 17:34:36	3
3369	FIL	2020-07-05	27.06	22.57	35.14	21.48	611.41	16546.4	2021-05-07 19:24:30	2021-05-07 19:24:30	13
8997	ANT	2020-07-16	1.406	1.388	1.413	1.373	77705.33	108111.94	2021-05-09 17:34:37	2021-05-09 17:34:37	14
8998	ANT	2020-07-17	1.348	1.406	1.413	1.34	143713.08	193654.17	2021-05-09 17:34:37	2021-05-09 17:34:37	14
2622	BTC	2020-06-20	9359.18	9301.83	9394.04	9179.1	19608.75	182464228.19	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2623	BTC	2020-06-21	9292.81	9359.18	9418.22	9282.53	13199.69	123480945.26	2021-05-09 17:34:36	2021-05-09 17:34:36	7
1223	SJCX	2020-08-24	0.0004703	0.0004661	0.0004703	0.0004703	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
3370	FIL	2020-07-06	25.72	27.06	27.85	20.03	308.57	7937.37	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3037	BCH	2020-08-08	305.33	302.51	308.87	301.8	205601.93	62777213.19	2021-05-09 17:34:36	2021-05-09 17:34:36	8
1225	SJCX	2020-08-26	0.0004587	0.0004532	0.0004587	0.0004587	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
159202	ATOM	2021-05-01	23.78	22.74	24.45	22.48	1702491.8	39954660.68	2021-05-09 17:34:36	2021-05-09 17:34:36	3
473	DOT	2020-08-06	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
127	XTZ	2020-08-26	3.37	3.437	3.51	3.302	3737818.24	12760440.3	2021-05-07 19:24:31	2021-05-07 19:24:31	5
2624	BTC	2020-06-22	9691.61	9292.81	9774.79	9283.26	41271.48	393567343.68	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2625	BTC	2020-06-23	9624.3	9691.61	9720.11	9580.47	30724.93	296221140.11	2021-05-09 17:34:36	2021-05-09 17:34:36	7
1306	SJCX	2020-11-15	0.0006386	0.000643	0.0006386	0.0006386	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
2392	OCN	2020-11-03	0.0002135	0.0002225	0.000229	0.0002096	74596172.61	15925.8	2021-05-09 17:34:37	2021-05-09 17:34:37	2
301480	XTZ	2021-05-20	4.199	3.625	4.505	3.196	16027739.78	63154413.81	2021-05-21 23:37:26	2021-05-21 23:37:26	5
2646	BTC	2020-07-14	9256.07	9237.89	9279.57	9109.7	25865.27	238308476.7	2021-05-09 17:34:36	2021-05-09 17:34:36	7
1708	ETH	2020-12-21	607.9	638.17	647.83	596.6	785220.42	486584732.86	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1709	ETH	2020-12-22	637.23	607.9	637.85	587.94	564395.67	347239331.3	2021-05-07 19:24:30	2021-05-07 19:24:30	10
3038	BCH	2020-08-09	300.11	305.33	307.47	295.66	208904.81	62693422.13	2021-05-09 17:34:36	2021-05-09 17:34:36	8
1347	SJCX	2020-12-26	0.001058	0.0009883	0.001058	0.001058	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1348	SJCX	2020-12-27	0.00105	0.001058	0.00105	0.00105	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
214	XTZ	2020-11-21	2.398	2.107	2.398	2.059	11875010.07	26789897.72	2021-05-07 19:24:31	2021-05-07 19:24:31	5
3398	FIL	2020-08-03	19.21	19.15	20.02	18.09	46.22	887.95	2021-05-07 19:24:30	2021-05-07 19:24:30	13
215	XTZ	2020-11-22	2.277	2.398	2.437	2.17	7925366.59	18178122.99	2021-05-07 19:24:31	2021-05-07 19:24:31	5
216	XTZ	2020-11-23	2.623	2.277	2.662	2.276	11733703.32	29580931	2021-05-07 19:24:31	2021-05-07 19:24:31	5
3402	FIL	2020-08-07	19.89	19.26	19.89	18.8	157.21	3126.74	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3039	BCH	2020-08-10	302.55	300.11	307.67	299.46	254250.78	76923862.39	2021-05-09 17:34:36	2021-05-09 17:34:36	8
474	DOT	2020-08-07	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
475	DOT	2020-08-08	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
1710	ETH	2020-12-23	585.25	637.23	638.29	552.44	839668.75	506935177.53	2021-05-07 19:24:30	2021-05-07 19:24:30	10
689	DOT	2021-03-10	37.6	38.23	39.53	36.32	1464243.37	55743304.5	2021-05-09 17:34:36	2021-05-09 17:34:36	4
1711	ETH	2020-12-24	612.32	585.25	614.84	565.82	503685.19	295864857.77	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1712	ETH	2020-12-25	626.83	612.32	633.8	604.38	473363.94	292795859.77	2021-05-07 19:24:30	2021-05-07 19:24:30	10
2857	BTC	2021-02-10	44854.95	46509.57	47349.86	43743.99	72992.8	3326890835.4	2021-05-09 17:34:36	2021-05-09 17:34:36	7
306442	BCH	2021-05-30	661.72	651.87	688.61	617.32	127188.97	83840477.47	2021-05-31 20:39:41	2021-05-31 20:39:41	8
311716	OCN	2021-06-10	0.0008156	0.0008876	0.000865	0.0007909	54068023.2	44098.68	2021-06-11 22:42:18	2021-06-11 22:42:18	2
3403	FIL	2020-08-08	21.31	19.89	23.54	19.87	203.88	4343.68	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3061	BCH	2020-09-01	292.08	273.73	294.71	277.3	268823.81	78519305.26	2021-05-09 17:34:36	2021-05-09 17:34:36	8
8999	ANT	2020-07-18	1.395	1.361	1.403	1.345	35371.91	48064.7	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9007	ANT	2020-07-26	2.239	2.212	2.303	2.068	184325.81	412677.17	2021-05-09 17:34:37	2021-05-09 17:34:37	14
217	XTZ	2020-11-24	2.673	2.623	2.826	2.496	14583766.09	38907066.2	2021-05-07 19:24:31	2021-05-07 19:24:31	5
3404	FIL	2020-08-09	20.79	21.31	21.74	19.73	240.14	4992.51	2021-05-07 19:24:30	2021-05-07 19:24:30	13
142114	ANT	2021-04-28	9.28	8.949	9.296	8.605	514990.38	4779038.45	2021-05-09 17:34:37	2021-05-09 17:34:37	14
247	XTZ	2020-12-24	2.06	1.859	2.084	1.794	6510753.49	12466134.59	2021-05-07 19:24:31	2021-05-07 19:24:31	5
690	DOT	2021-03-11	36.91	37.6	38.07	35.93	1341374.1	49225572.73	2021-05-09 17:34:36	2021-05-09 17:34:36	4
316874	ZRX	2021-06-21	0.6027	0.791	0.7971	0.6011	10346633.57	6983897.34	2021-06-22 23:44:50	2021-06-22 23:44:50	6
3062	BCH	2020-09-02	263.98	292.08	281.41	254.63	303171.81	80029888.9	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3063	BCH	2020-09-03	214.48	263.98	236.76	211.73	407117.05	87318867.77	2021-05-09 17:34:36	2021-05-09 17:34:36	8
691	DOT	2021-03-12	35.99	36.91	37.47	34.46	1063545.42	37918934.15	2021-05-09 17:34:36	2021-05-09 17:34:36	4
323462	DOT	2021-07-05	15.24	15.99	15.99	14.77	933252.71	14229261.82	2021-07-06 23:48:03	2021-07-06 23:48:03	4
328586	FIL	2021-07-16	45.81	47.26	48.31	45.27	151399.28	7076125.18	2021-07-17 23:50:31	2021-07-17 23:50:31	13
328620	ETH	2021-07-16	1877.05	1918.17	1964.79	1850.35	358403.19	682133152.13	2021-07-17 23:50:31	2021-07-17 23:50:31	10
1404	SJCX	2021-02-21	0.002299	0.002236	0.002299	0.002299	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1414	SJCX	2021-03-03	0.002016	0.00194	0.002016	0.002016	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
10885	ATOM	2020-09-12	5.612	5.349	5.725	5.186	562385.52	3088653.58	2021-05-09 17:34:36	2021-05-09 17:34:36	3
1415	SJCX	2021-03-04	0.001935	0.002016	0.001935	0.001935	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
2409	OCN	2020-11-20	0.000245	0.0002595	0.0002807	0.000245	142700127.14	34962.44	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2410	OCN	2020-11-21	0.0002651	0.000245	0.0002706	0.0002596	146890564.68	38938.46	2021-05-09 17:34:37	2021-05-09 17:34:37	2
29	XTZ	2020-05-20	2.818	2.832	2.891	2.716	3781349.66	10688654.64	2021-05-07 19:24:31	2021-05-07 19:24:31	5
2628	BTC	2020-06-26	9158.07	9241.32	9289.32	9041.42	40519.91	371373315.29	2021-05-09 17:34:36	2021-05-09 17:34:36	7
10886	ATOM	2020-09-13	5.305	5.612	5.86	5.109	557911.92	3044408.64	2021-05-09 17:34:36	2021-05-09 17:34:36	3
476	DOT	2020-08-09	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
2629	BTC	2020-06-27	9007.14	9158.07	9190.27	8867.34	28152.32	254990739.33	2021-05-09 17:34:36	2021-05-09 17:34:36	7
8946	ANT	2020-05-26	1.016	1.038	1.042	0.9702	13281.19	13496.78	2021-05-09 17:34:37	2021-05-09 17:34:37	14
1725	ETH	2021-01-07	1225.5	1210.59	1290.46	1151.6	1601329.3	1957429185.72	2021-05-07 19:24:30	2021-05-07 19:24:30	10
2630	BTC	2020-06-28	9120.39	9007.14	9189.74	8946.05	19775.94	179558602.81	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2631	BTC	2020-06-29	9187.07	9120.39	9234.33	9026.42	31119.19	283764928.26	2021-05-09 17:34:36	2021-05-09 17:34:36	7
1735	ETH	2021-01-17	1233.73	1228.52	1269.49	1166.6	783042.23	957632921.26	2021-05-07 19:24:30	2021-05-07 19:24:30	10
2411	OCN	2020-11-22	0.0002688	0.0002651	0.0002856	0.0002576	179207544.55	48171.85	2021-05-09 17:34:37	2021-05-09 17:34:37	2
477	DOT	2020-08-10	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
8927	ANT	2020-05-07	1.223	1.023	1.223	1.041	44591.49	54537.12	2021-05-07 19:24:30	2021-05-07 19:24:30	14
10887	ATOM	2020-09-14	5.377	5.305	5.539	5.128	425517.88	2278221.45	2021-05-09 17:34:36	2021-05-09 17:34:36	3
478	DOT	2020-08-11	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
3296	FIL	2020-04-23	0	0	0	0	0	0	2021-04-23 22:51:51	2021-04-23 22:51:51	13
1756	ETH	2021-02-07	1614.64	1679.14	1694.5	1494.84	929611.92	1480130359.34	2021-05-07 19:24:30	2021-05-07 19:24:30	10
479	DOT	2020-08-12	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
3000	BCH	2020-07-02	219.77	223.95	221.59	219.23	216450.18	47569900.21	2021-05-09 17:34:36	2021-05-09 17:34:36	8
295938	XTZ	2021-05-10	6.199	7.106	7.258	5.929	7643772.26	50939742.25	2021-05-11 23:35:10	2021-05-11 23:35:10	5
480	DOT	2020-08-13	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
3001	BCH	2020-07-03	220.95	219.77	222.58	218.96	206759.58	45683452.74	2021-05-09 17:34:36	2021-05-09 17:34:36	8
36	XTZ	2020-05-27	2.709	2.693	2.76	2.681	1281491.44	3475638.44	2021-05-07 19:24:31	2021-05-07 19:24:31	5
2506	OCN	2021-02-25	0.0006076	0.0006501	0.0006372	0.0005631	81226656.12	49350.94	2021-05-09 17:34:37	2021-05-09 17:34:37	2
1757	ETH	2021-02-08	1752.87	1614.64	1779.25	1565.98	1166827.02	1975321767.53	2021-05-07 19:24:30	2021-05-07 19:24:30	10
37	XTZ	2020-05-28	2.831	2.709	2.849	2.682	2369580.18	6546805.2	2021-05-07 19:24:31	2021-05-07 19:24:31	5
38	XTZ	2020-05-29	2.875	2.831	2.901	2.798	2457700.97	7014177.97	2021-05-07 19:24:31	2021-05-07 19:24:31	5
1416	SJCX	2021-03-05	0.001951	0.001935	0.001951	0.001951	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1788	ETH	2021-03-11	1827.06	1795.63	1846.24	1726.09	537879.47	964788578.61	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1417	SJCX	2021-03-06	0.001956	0.001951	0.001956	0.001956	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
248	XTZ	2020-12-25	2.028	2.06	2.115	1.979	3697318.36	7548560.55	2021-05-07 19:24:31	2021-05-07 19:24:31	5
481	DOT	2020-08-14	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
482	DOT	2020-08-15	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
159192	ETH	2021-05-01	2947.8	2775.96	2954.54	2757.04	458591.96	1319269388.69	2021-05-07 19:24:30	2021-05-07 19:24:30	10
2507	OCN	2021-02-26	0.0006074	0.0006076	0.0006218	0.0005495	51056211.15	31009.6	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2508	OCN	2021-02-27	0.0005695	0.0006074	0.0006133	0.0005695	52549572.87	29926.44	2021-05-09 17:34:37	2021-05-09 17:34:37	2
1438	SJCX	2021-03-27	0.002235	0.002202	0.002235	0.002235	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
10992	ATOM	2020-12-28	5.378	4.834	5.56	4.793	1172979.87	6174684.8	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10993	ATOM	2020-12-29	5.623	5.378	5.693	5.031	1912129.11	10219916.37	2021-05-09 17:34:36	2021-05-09 17:34:36	3
309	XTZ	2021-02-24	3.539	3.55	3.899	3.36	10496762.79	38362089.5	2021-05-07 19:24:31	2021-05-07 19:24:31	5
3002	BCH	2020-07-04	225.45	220.95	226.27	222.52	201103.78	45338173.91	2021-05-09 17:34:36	2021-05-09 17:34:36	8
8947	ANT	2020-05-27	0.9527	1.016	1.081	0.938	30667.57	29216.32	2021-05-09 17:34:37	2021-05-09 17:34:37	14
270508	ANT	2021-05-02	9.541	9.92	9.768	9.258	565402.59	5394540.85	2021-05-09 17:34:37	2021-05-09 17:34:37	14
301484	DOT	2021-05-20	29.03	25.08	31.3	21.22	4401169.45	119842378.26	2021-05-21 23:37:25	2021-05-21 23:37:25	4
10996	ATOM	2021-01-01	5.88	6.483	6.515	5.652	2331963.48	14140812.54	2021-05-09 17:34:36	2021-05-09 17:34:36	3
306444	SJCX	2021-05-30	0.001427	0.001384	0.001427	0.001427	0	0	2021-05-31 23:39:42	2021-05-31 23:39:42	11
2509	OCN	2021-02-28	0.0005406	0.0005695	0.0005975	0.0005264	63086781.21	34103.48	2021-05-09 17:34:37	2021-05-09 17:34:37	2
491	DOT	2020-08-24	4.562	4.053	4.807	3.85	155436.25	672466.57	2021-05-09 17:34:36	2021-05-09 17:34:36	4
2632	BTC	2020-06-30	9136.47	9187.07	9200.99	9068.77	23376.63	213905502.74	2021-05-09 17:34:36	2021-05-09 17:34:36	7
1460	SJCX	2021-04-18	0.00225	0.002402	0.00225	0.00225	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
2633	BTC	2020-07-01	9238.89	9136.47	9299.67	9097.33	29846.4	274835041.39	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2634	BTC	2020-07-02	9092.8	9238.89	9267.84	8954.67	37657.49	343433369.43	2021-05-09 17:34:36	2021-05-09 17:34:36	7
3003	BCH	2020-07-05	222.4	225.45	224.31	219.32	199952.15	44470251.07	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3004	BCH	2020-07-06	242.37	222.4	243.12	228.72	339268.09	82228069.91	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3005	BCH	2020-07-07	237.91	242.37	241.25	236.06	252698.02	60120175.37	2021-05-09 17:34:36	2021-05-09 17:34:36	8
11039	ATOM	2021-02-13	20.26	21.15	22.11	19.19	3108982.12	63605583.8	2021-05-09 17:34:36	2021-05-09 17:34:36	3
312178	DOT	2021-06-11	20.96	22.67	23.19	20.52	741235.76	16261669.81	2021-06-12 23:42:31	2021-06-12 23:42:31	4
312196	ATOM	2021-06-11	11.94	12.83	12.94	11.56	820086.6	10096506.33	2021-06-12 23:42:31	2021-06-12 23:42:31	3
671	DOT	2021-02-20	38.99	34.81	42.2	34.71	3562417.12	138201796.01	2021-05-09 17:34:36	2021-05-09 17:34:36	4
678	DOT	2021-02-27	33.49	31.44	35.65	31.37	2216063.09	75287931.11	2021-05-09 17:34:36	2021-05-09 17:34:36	4
316936	SJCX	2021-06-21	0.001266	0.001424	0.001266	0.001266	0	0	2021-06-22 22:44:50	2021-06-22 22:44:50	11
316876	ATOM	2021-06-21	9.53	11.99	12.1	9.495	1758780.76	18430476.8	2021-06-22 23:44:50	2021-06-22 23:44:50	3
516	DOT	2020-09-18	5.254	5.348	5.453	5.104	618776.66	3235953.12	2021-05-09 17:34:36	2021-05-09 17:34:36	4
2578	BTC	2020-05-07	9999.93	9153.2	10064.33	9042.52	125991.41	1213223439.69	2021-05-07 19:24:30	2021-05-07 19:24:30	7
2579	BTC	2020-05-08	9808.18	9999.93	10041.73	9728.64	91540.3	907665361.58	2021-05-07 19:24:30	2021-05-07 19:24:30	7
1410	SJCX	2021-02-27	0.001848	0.001853	0.001848	0.001848	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1412	SJCX	2021-03-01	0.001985	0.00181	0.001985	0.001985	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
2576	BTC	2020-05-05	9029.75	8881.65	9119.13	8781.58	60185.36	538111122.64	2021-05-04 22:03:21	2021-05-04 22:03:21	7
3387	FIL	2020-07-23	20	20.7	21.33	19.91	9.812	196.24	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3388	FIL	2020-07-24	20.06	20	21.13	18.12	132.6	2659.36	2021-05-07 19:24:30	2021-05-07 19:24:30	13
159212	SJCX	2021-05-01	0.002314	0.00231	0.002314	0.002314	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
2266	OCN	2020-06-30	0.0003	0.0002985	0.0003293	0.0002346	6585625.59	1975.83	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2267	OCN	2020-07-01	0.0003027	0.0003	0.0003096	0.0002981	7762508.22	2349.52	2021-05-09 17:34:37	2021-05-09 17:34:37	2
79677	OCN	2021-04-25	0.001811	0.001995	0.00209	0.001788	33740552.08	61113.22	2021-05-09 17:34:37	2021-05-09 17:34:37	2
146896	OCN	2021-04-30	0.002026	0.002041	0.00211	0.00186	38973152.59	78977.18	2021-05-09 17:34:37	2021-05-09 17:34:37	2
291624	ZRX	2021-05-08	1.958	2.017	2.065	1.914	11568542.99	23012936.06	2021-05-09 23:34:39	2021-05-09 23:34:39	6
54	XTZ	2020-06-14	2.588	2.698	2.702	2.552	1204453.49	3165769.92	2021-05-07 19:24:31	2021-05-07 19:24:31	5
55	XTZ	2020-06-15	2.628	2.588	2.684	2.431	3624216.94	9228477.34	2021-05-07 19:24:31	2021-05-07 19:24:31	5
295940	EOS	2021-05-10	9.275	10.52	11.01	8.267	23647560.71	234459268.26	2021-05-11 23:35:08	2021-05-11 23:35:08	9
2580	BTC	2020-05-09	9541.13	9808.18	9912.22	9525.77	59814.44	580103588.21	2021-05-09 17:34:36	2021-05-09 17:34:36	7
11040	ATOM	2021-02-14	19.14	20.26	20.7	18.52	2322669.41	45472442.27	2021-05-09 17:34:36	2021-05-09 17:34:36	3
3015	BCH	2020-07-17	222.69	224.13	225.17	222.14	85939.93	19138232.24	2021-05-09 17:34:36	2021-05-09 17:34:36	8
2573	BTC	2020-05-02	8981.11	8829.12	9013.29	8768.81	36139.66	321429140.42	2021-05-01 22:04:03	2021-05-01 22:04:03	7
9010	ANT	2020-07-29	1.938	2.046	2.212	1.922	64622.94	125235.37	2021-05-09 17:34:37	2021-05-09 17:34:37	14
270510	EOS	2021-05-02	6.531	6.618	6.697	6.199	5100127.47	33107243.37	2021-05-09 17:34:36	2021-05-09 17:34:36	9
2608	BTC	2020-06-06	9671.46	9622.02	9728.4	9536.15	22979.04	221180782.78	2021-05-09 17:34:36	2021-05-09 17:34:36	7
3016	BCH	2020-07-18	224.57	222.69	226.4	223.1	77456.34	17394104.86	2021-05-09 17:34:36	2021-05-09 17:34:36	8
504	DOT	2020-09-06	4.784	4.136	4.91	3.742	1596989.44	7068395.91	2021-05-09 17:34:36	2021-05-09 17:34:36	4
3389	FIL	2020-07-25	19.29	20.06	21.4	17.62	52.39	1010.64	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3017	BCH	2020-07-19	227.91	224.57	228.65	222.84	106715.61	24321786.74	2021-05-09 17:34:36	2021-05-09 17:34:36	8
11041	ATOM	2021-02-15	22.5	19.14	24.98	14.8	8663403.25	179454401.67	2021-05-09 17:34:36	2021-05-09 17:34:36	3
2577	BTC	2020-05-06	9153.2	9029.75	9408.99	8924.06	88912.83	818515486.36	2021-05-04 22:03:21	2021-05-04 22:03:21	7
11072	ATOM	2021-03-18	22.11	20.89	24.49	20.53	3653892.07	82944037.02	2021-05-09 17:34:36	2021-05-09 17:34:36	3
56	XTZ	2020-06-16	2.618	2.628	2.674	2.565	1863922.55	4873544.92	2021-05-07 19:24:31	2021-05-07 19:24:31	5
1724	ETH	2021-01-06	1210.59	1103.19	1214.12	1059.19	2484714.82	2817165249.56	2021-05-07 19:24:30	2021-05-07 19:24:30	10
9011	ANT	2020-07-30	2.277	1.938	2.303	1.936	57495.59	130928.32	2021-05-09 17:34:37	2021-05-09 17:34:37	14
57	XTZ	2020-06-17	2.677	2.618	2.693	2.551	1825791.04	4792638.34	2021-05-07 19:24:31	2021-05-07 19:24:31	5
9012	ANT	2020-07-31	2.306	2.277	2.384	2.275	30505.57	70337.83	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9013	ANT	2020-08-01	2.634	2.306	2.664	2.398	87970.63	231729.56	2021-05-09 17:34:37	2021-05-09 17:34:37	14
302070	SJCX	2021-05-21	0.001494	0.001624	0.001494	0.001494	0	0	2021-05-22 22:37:39	2021-05-22 22:37:39	11
11096	ATOM	2021-04-11	23.43	21.03	23.48	20.73	1377885.5	30165549.18	2021-05-09 17:34:36	2021-05-09 17:34:36	3
11097	ATOM	2021-04-12	22	23.43	23.74	21.23	1977561.6	44601090.23	2021-05-09 17:34:36	2021-05-09 17:34:36	3
9014	ANT	2020-08-02	2.448	2.63	2.646	2.346	64261.59	157291.25	2021-05-09 17:34:37	2021-05-09 17:34:37	14
3390	FIL	2020-07-26	18.04	19.29	19.75	18.04	7.067	127.52	2021-05-07 19:24:30	2021-05-07 19:24:30	13
517	DOT	2020-09-19	4.932	5.254	5.255	4.81	586930.39	2948011.15	2021-05-09 17:34:36	2021-05-09 17:34:36	4
58	XTZ	2020-06-18	2.659	2.677	2.782	2.56	4801857.26	12872452.43	2021-05-07 19:24:31	2021-05-07 19:24:31	5
519	DOT	2020-09-21	4.062	4.679	4.702	3.937	1385633.51	5730393.19	2021-05-09 17:34:36	2021-05-09 17:34:36	4
615	DOT	2020-12-26	5.187	5.217	5.282	5.087	444859.61	2308325.86	2021-05-09 17:34:36	2021-05-09 17:34:36	4
3391	FIL	2020-07-27	18.31	18.04	20.93	16.73	31.5	576.74	2021-05-07 19:24:30	2021-05-07 19:24:30	13
616	DOT	2020-12-27	5.143	5.187	5.41	4.925	1444002.45	7564376.34	2021-05-09 17:34:36	2021-05-09 17:34:36	4
59	XTZ	2020-06-19	2.62	2.659	2.716	2.609	2204701.83	5863521.42	2021-05-07 19:24:31	2021-05-07 19:24:31	5
679	DOT	2021-02-28	33.82	33.49	34.65	29.78	2172651.76	69695379.53	2021-05-09 17:34:36	2021-05-09 17:34:36	4
2581	BTC	2020-05-10	8735.05	9541.13	9556.85	8228.22	133597.2	1159765920.88	2021-05-09 17:34:36	2021-05-09 17:34:36	7
11098	ATOM	2021-04-13	23.89	22	25.19	21.37	1889542.35	44129513.41	2021-05-09 17:34:36	2021-05-09 17:34:36	3
60	XTZ	2020-06-20	2.614	2.62	2.657	2.534	1894875.33	4932563.14	2021-05-07 19:24:31	2021-05-07 19:24:31	5
11099	ATOM	2021-04-14	27.07	23.89	27.09	22.77	3276037.42	80387129.83	2021-05-09 17:34:36	2021-05-09 17:34:36	3
2582	BTC	2020-05-11	8568.88	8735.05	9164.84	8228.58	144898.27	1259789388.45	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2612	BTC	2020-06-10	9891.84	9779.7	9990.4	9708.63	40206.35	395005942.58	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2860	BTC	2021-02-13	47222.32	47435.54	48171.46	46291.19	33281.25	1571324550.44	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2894	BTC	2021-03-19	58060.21	57643.32	59453.32	56283.37	41182.41	2397999967.37	2021-05-09 17:34:36	2021-05-09 17:34:36	7
680	DOT	2021-03-01	35.68	33.82	35.69	33.11	1262144.99	43655679.42	2021-05-09 17:34:36	2021-05-09 17:34:36	4
302036	ZRX	2021-05-21	1.041	1.158	1.219	0.9029	41295843.94	45326405.77	2021-05-22 23:37:39	2021-05-22 23:37:39	6
684	DOT	2021-03-05	33.63	35.29	35.29	31.44	1568379.33	52154861.63	2021-05-09 17:34:36	2021-05-09 17:34:36	4
306446	ETH	2021-05-30	2386.91	2278.58	2475.92	2182.6	976153.03	2311564285.7	2021-05-31 21:39:41	2021-05-31 21:39:41	10
312180	XTZ	2021-06-11	3.135	3.27	3.367	3.085	2596846.77	8375359.85	2021-06-12 23:42:31	2021-06-12 23:42:31	5
316878	EOS	2021-06-21	3.533	4.512	4.524	3.511	9373091.32	36524880.51	2021-06-22 22:44:50	2021-06-22 22:44:50	9
323908	BTC	2021-07-06	34237.66	33702.79	35096.65	33558.75	32844.8	1123145329.6	2021-07-07 23:48:16	2021-07-07 23:48:16	7
323476	EOS	2021-07-05	3.815	4.062	4.062	3.767	2129058.26	8292457.64	2021-07-06 23:48:03	2021-07-06 23:48:03	9
79	XTZ	2020-07-09	2.532	2.655	2.655	2.463	4594736	11679844.23	2021-05-07 19:24:31	2021-05-07 19:24:31	5
80	XTZ	2020-07-10	2.542	2.532	2.591	2.418	2589135.24	6455000.89	2021-05-07 19:24:31	2021-05-07 19:24:31	5
2501	OCN	2021-02-20	0.0007277	0.0007047	0.0007469	0.0006703	29836569.13	21713.43	2021-05-09 17:34:37	2021-05-09 17:34:37	2
1856	ZRX	2020-05-17	0.3734	0.3834	0.3923	0.3707	10091996.82	3868310.66	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1530	ETH	2020-06-26	229.5	232.33	230.87	229.23	765340.24	175646529.66	2021-05-07 19:24:30	2021-05-07 19:24:30	10
146898	XTZ	2021-04-30	5.619	5.245	5.652	5.133	3427707.63	18775258.01	2021-05-07 19:24:31	2021-05-07 19:24:31	5
2502	OCN	2021-02-21	0.0007934	0.0007277	0.0008321	0.000716	147973061.22	117402.92	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2503	OCN	2021-02-22	0.0007112	0.0007934	0.0008001	0.0006934	136609354.67	97160.4	2021-05-09 17:34:37	2021-05-09 17:34:37	2
142110	OCN	2021-04-28	0.002146	0.002054	0.002283	0.002036	31348029.71	67263.77	2021-05-09 17:34:37	2021-05-09 17:34:37	2
8948	ANT	2020-05-28	1.027	0.9527	1.112	0.8312	15695.07	16117.97	2021-05-09 17:34:37	2021-05-09 17:34:37	14
8949	ANT	2020-05-29	1.058	1.027	1.113	1.01	21448.28	22700.53	2021-05-09 17:34:37	2021-05-09 17:34:37	14
433	DOT	2020-06-27	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
1573	ETH	2020-08-08	397.56	379.57	397.58	376.32	300976.24	116573197.91	2021-05-07 19:24:30	2021-05-07 19:24:30	10
8975	ANT	2020-06-24	1.418	1.326	1.422	1.255	36023.69	51085.29	2021-05-09 17:34:37	2021-05-09 17:34:37	14
8950	ANT	2020-05-30	1.067	1.058	1.127	1.066	9621.69	10266.11	2021-05-09 17:34:37	2021-05-09 17:34:37	14
8976	ANT	2020-06-25	1.447	1.418	1.599	1.354	100717.61	145757.59	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9162	ANT	2020-12-28	2.977	2.901	3.229	2.947	342360.45	1019221.93	2021-05-09 17:34:37	2021-05-09 17:34:37	14
296462	EOS	2021-05-11	14.53	9.275	14.53	8.784	56991648.57	683659643.51	2021-05-12 23:35:21	2021-05-12 23:35:21	9
291634	BCH	2021-05-08	1400.49	1343.71	1478.88	1349.8	343523.19	481100369.42	2021-05-09 23:34:39	2021-05-09 23:34:39	8
515	DOT	2020-09-17	5.348	5.074	5.421	5.054	789689.25	4148194.41	2021-05-09 17:34:36	2021-05-09 17:34:36	4
1857	ZRX	2020-05-18	0.3709	0.3734	0.3843	0.365	10785014.65	4038569.59	2021-05-09 17:34:36	2021-05-09 17:34:36	6
704	DOT	2021-03-25	29.84	30.27	31.23	28.39	1930867.25	57564021.74	2021-05-09 17:34:36	2021-05-09 17:34:36	4
2598	BTC	2020-05-27	9204.62	8844.5	9222.3	8820.55	42022.36	381475134.6	2021-05-09 17:34:36	2021-05-09 17:34:36	7
302052	BTC	2021-05-21	37350.39	40597.4	42252.07	33552.8	120589.87	4573692788.95	2021-05-22 23:37:39	2021-05-22 23:37:39	7
707	DOT	2021-03-28	32.24	32.64	33.2	31.24	618859.37	20006640.02	2021-05-09 17:34:36	2021-05-09 17:34:36	4
2600	BTC	2020-05-29	9424.62	9579.71	9601.43	9344.8	40183.32	379875666.16	2021-05-09 17:34:36	2021-05-09 17:34:36	7
1499	ETH	2020-05-26	201.04	204.2	203.69	199.97	932530.14	187471648.97	2021-05-07 19:24:30	2021-05-07 19:24:30	10
10821	ATOM	2020-07-10	4.055	3.788	4.192	3.569	2678021.24	10405316.01	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10822	ATOM	2020-07-11	3.924	4.055	4.466	3.875	3174952.14	13300459.69	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10823	ATOM	2020-07-12	4.027	3.924	4.169	3.902	1335886.07	5376843.08	2021-05-09 17:34:36	2021-05-09 17:34:36	3
9165	ANT	2020-12-31	3.051	3.025	3.19	2.978	163794.47	499703.14	2021-05-09 17:34:37	2021-05-09 17:34:37	14
302038	XTZ	2021-05-21	3.667	4.199	4.389	3.161	13789750.59	51418875.91	2021-05-22 23:37:39	2021-05-22 23:37:39	5
306448	XTZ	2021-05-30	3.284	3.201	3.442	3.034	4438258.45	14672805.23	2021-05-31 23:39:42	2021-05-31 23:39:42	5
708	DOT	2021-03-29	34.37	32.24	34.92	31.71	1041556.8	35348613.44	2021-05-09 17:34:36	2021-05-09 17:34:36	4
312182	BTC	2021-06-11	37339.98	36680.78	37665.85	35981.84	43119.67	1596038876.7	2021-06-12 23:42:31	2021-06-12 23:42:31	7
1500	ETH	2020-05-27	208.3	201.04	211.98	206.46	800718.49	166790102.34	2021-05-07 19:24:30	2021-05-07 19:24:30	10
711	DOT	2021-04-01	37.44	37.06	38.96	36.05	1099982.56	41390175.65	2021-05-09 17:34:36	2021-05-09 17:34:36	4
280362	ATOM	2021-05-04	21	22.97	23.28	20.93	1872595.66	41410435.91	2021-05-09 17:34:36	2021-05-09 17:34:36	3
284922	ATOM	2021-05-05	24.88	21	24.89	20.67	2817662.46	65397372.02	2021-05-09 17:34:36	2021-05-09 17:34:36	3
284923	ATOM	2021-05-06	25.54	24.88	27.08	24.18	4849663.04	124196784.11	2021-05-09 17:34:36	2021-05-09 17:34:36	3
1501	ETH	2020-05-28	220.33	208.3	220.33	212.09	1004011.96	221217298.51	2021-05-07 19:24:30	2021-05-07 19:24:30	10
317346	BTC	2021-06-22	32537.58	31652.62	33312.87	28908.07	129940.61	4060734244.07	2021-06-23 23:45:04	2021-06-23 23:45:04	7
1574	ETH	2020-08-09	390.28	397.56	400.32	384.27	333210.44	130828493	2021-05-07 19:24:30	2021-05-07 19:24:30	10
317368	ANT	2021-06-22	6.758	4.764	7.861	4.123	1698147.22	11476172.93	2021-06-23 23:45:04	2021-06-23 23:45:04	14
284924	ATOM	2021-05-07	28.67	25.54	32.16	25.04	1803372.72	51464862.49	2021-05-09 17:34:36	2021-05-09 17:34:36	3
3030	BCH	2020-08-01	319.64	301.19	322.36	310.9	343468.4	109787642.51	2021-05-09 17:34:36	2021-05-09 17:34:36	8
2594	BTC	2020-05-23	9186.19	9170.74	9311.34	9101.08	23636.66	217819517.42	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2595	BTC	2020-05-24	8718.49	9186.19	9307.11	8707.14	45736.61	412753415.47	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2601	BTC	2020-05-30	9699.78	9424.62	9735.73	9340.45	24640.28	235049817.45	2021-05-09 17:34:36	2021-05-09 17:34:36	7
714	DOT	2021-04-04	44.31	41.35	45.07	40.7	685417.77	29792299.09	2021-05-09 17:34:36	2021-05-09 17:34:36	4
3153	BCH	2020-12-02	294.55	288.08	300.12	291.28	178755.46	52651568.22	2021-05-09 17:34:36	2021-05-09 17:34:36	8
2602	BTC	2020-05-31	9450.47	9699.78	9703.51	9400.25	22242.38	212143031.97	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2603	BTC	2020-06-01	10211.23	9450.47	10359.02	9421.6	44485.42	435270237.66	2021-05-09 17:34:36	2021-05-09 17:34:36	7
3031	BCH	2020-08-02	283.67	319.64	311.66	274.49	489693.39	138910413.11	2021-05-09 17:34:36	2021-05-09 17:34:36	8
2604	BTC	2020-06-02	9523.75	10211.23	10232.25	9344.53	82606.91	812990990.27	2021-05-09 17:34:36	2021-05-09 17:34:36	7
3162	BCH	2020-12-11	259.34	265.73	263.31	258.62	186007.19	48239344.01	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3287	BCH	2021-04-15	866.86	815.12	877.75	798.9	175742.4	146257527.36	2021-05-09 17:34:36	2021-05-09 17:34:36	8
2605	BTC	2020-06-03	9666.06	9523.75	9666.25	9408.56	33114.73	316212538.78	2021-05-09 17:34:36	2021-05-09 17:34:36	7
3288	BCH	2021-04-16	1106.21	866.86	1174.22	821.43	586712.19	581286777.88	2021-05-09 17:34:36	2021-05-09 17:34:36	8
323464	OCN	2021-07-05	0.0007469	0.001278	0.001274	0.0007029	63584910.19	47490.39	2021-07-06 23:48:03	2021-07-06 23:48:03	2
67500	DOT	2021-04-24	29.06	32.26	32.39	28.59	845771.29	25673042.96	2021-05-09 17:34:36	2021-05-09 17:34:36	4
80044	DOT	2021-04-26	33.43	29.83	33.49	29.81	1613408.5	52117450.51	2021-05-09 17:34:36	2021-05-09 17:34:36	4
323920	BCH	2021-07-06	511.82	504.86	525.73	500.57	46726.84	24002200.13	2021-07-07 23:48:16	2021-07-07 23:48:16	8
328640	ZRX	2021-07-16	0.6179	0.6709	0.6763	0.6139	4794318.74	3077303.3	2021-07-17 18:50:29	2021-07-17 18:50:29	6
337712	ATOM	2021-08-05	13.03	12.81	13.24	12.41	1382740.37	17696946.03	2021-08-06 23:55:08	2021-08-06 23:55:08	3
343408	EOS	2021-08-17	5.06	5.52	5.686	5.009	9246825.34	49615849.25	2021-08-18 23:57:54	2021-08-18 23:57:54	9
296464	ANT	2021-05-11	9.8	9.157	10.31	9.017	830761.89	8141713.01	2021-05-12 23:35:21	2021-05-12 23:35:21	14
1249	SJCX	2020-09-19	0.0004433	0.0004375	0.0004433	0.0004433	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
2636	BTC	2020-07-04	9142.2	9066.46	9195.91	9052.4	16185.04	147598290.89	2021-05-09 17:34:36	2021-05-09 17:34:36	7
146900	DOT	2021-04-30	36.54	35.97	36.8	35.11	1007349.57	36328621.5	2021-05-09 17:34:36	2021-05-09 17:34:36	4
271054	XTZ	2021-05-03	6.009	5.61	6.098	5.596	3977153.93	23442983.49	2021-05-07 19:24:31	2021-05-07 19:24:31	5
10824	ATOM	2020-07-13	3.865	4.027	4.351	3.753	2305583.9	9411271.43	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10825	ATOM	2020-07-14	3.959	3.865	4.038	3.806	1537248.61	6051071.74	2021-05-09 17:34:36	2021-05-09 17:34:36	3
4525	EOS	2020-09-01	3.477	3.211	3.554	3.156	3248364.85	10977178.63	2021-05-09 17:34:36	2021-05-09 17:34:36	9
10841	ATOM	2020-07-30	3.715	3.63	3.768	3.588	371954.43	1377645.39	2021-05-09 17:34:36	2021-05-09 17:34:36	3
4526	EOS	2020-09-02	3.106	3.477	3.499	2.957	3791512.29	12023701.28	2021-05-09 17:34:36	2021-05-09 17:34:36	9
7688	ATOM	2021-04-22	18.78	19.62	21.55	18.59	2657449.72	52978748.77	2021-05-09 17:34:36	2021-05-09 17:34:36	3
1461	SJCX	2021-04-19	0.002227	0.00225	0.002227	0.002227	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1910	ZRX	2020-07-10	0.4104	0.4256	0.4284	0.3982	12639347.71	5178596.9	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1949	ZRX	2020-08-18	0.5664	0.5624	0.6096	0.5388	15419411.29	8810950.44	2021-05-09 17:34:36	2021-05-09 17:34:36	6
142122	ZRX	2021-04-28	1.709	1.824	1.851	1.623	18999190.2	32537316.22	2021-05-09 17:34:36	2021-05-09 17:34:36	6
4527	EOS	2020-09-03	2.621	3.106	3.16	2.52	4043652.42	11587210.23	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4543	EOS	2020-09-19	2.706	2.694	2.737	2.684	659087.74	1785950.95	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4507	EOS	2020-08-14	3.263	3.141	3.296	3.092	3617297.15	11563865.94	2021-05-09 17:34:36	2021-05-09 17:34:36	9
2393	OCN	2020-11-04	0.0002174	0.0002135	0.0002658	0.0002094	84187872.11	18305.51	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2637	BTC	2020-07-05	9081.44	9142.2	9152.87	8935.9	17548.22	159006413.09	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2614	BTC	2020-06-12	9464.23	9268.13	9548.13	9238.24	40820.42	384322097.92	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2638	BTC	2020-07-06	9347.05	9081.44	9372.09	9067.64	36844.23	340664721.17	2021-05-09 17:34:36	2021-05-09 17:34:36	7
292134	FIL	2021-05-09	146.61	148.32	149.78	140.94	330579.73	47832105.16	2021-05-10 23:34:57	2021-05-10 23:34:57	13
1606	ETH	2020-09-10	368.09	351.15	377.54	350.44	674808.42	248139178.76	2021-05-07 19:24:30	2021-05-07 19:24:30	10
2620	BTC	2020-06-18	9380.67	9459.13	9480.04	9276.18	25143.4	236301644.47	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2626	BTC	2020-06-24	9292.94	9624.3	9664.38	9206.05	49186.2	461570781.81	2021-05-09 17:34:36	2021-05-09 17:34:36	7
1607	ETH	2020-09-11	373.99	368.09	375.31	356.15	441319.3	161816528.74	2021-05-07 19:24:30	2021-05-07 19:24:30	10
8977	ANT	2020-06-26	1.362	1.447	1.512	1.289	46061.76	62727.14	2021-05-09 17:34:37	2021-05-09 17:34:37	14
3018	BCH	2020-07-20	222.88	227.91	227.19	221.23	112377.49	25046548.25	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3019	BCH	2020-07-21	230.41	222.88	231.91	228.06	131317.94	30256457.03	2021-05-09 17:34:36	2021-05-09 17:34:36	8
292118	ETH	2021-05-09	3927.06	3916.25	3982.33	3730.53	623594.65	2421772525.96	2021-05-10 23:34:58	2021-05-10 23:34:58	10
3032	BCH	2020-08-03	297.05	283.67	299.63	287.05	272967.43	81083954.51	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3142	BCH	2020-11-21	303.75	259.36	304.13	258.3	406244.03	123398222.44	2021-05-09 17:34:36	2021-05-09 17:34:36	8
9026	ANT	2020-08-14	6.144	6.659	7.258	5.501	1112203.83	6833318.64	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9027	ANT	2020-08-15	5.997	6.144	6.601	5.62	1071598.7	6426244.63	2021-05-09 17:34:37	2021-05-09 17:34:37	14
302040	FIL	2021-05-21	76.78	88.89	94.84	68.24	1570096.52	124361176.54	2021-05-22 22:37:39	2021-05-22 22:37:39	13
1608	ETH	2020-09-12	388.04	374.03	388.14	369.96	698082.56	270883063.04	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1609	ETH	2020-09-13	366.28	388.04	383.85	357.71	1034609.9	378959151	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1610	ETH	2020-09-14	377.26	366.28	382.82	370.75	1111989.07	419514214.33	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1611	ETH	2020-09-15	364.16	377.26	382.28	362.54	872072.14	317572911.45	2021-05-07 19:24:30	2021-05-07 19:24:30	10
306886	BCH	2021-05-31	703.06	661.72	711.68	635.35	136131.36	92528295.03	2021-06-01 23:39:56	2021-06-01 23:39:56	8
1612	ETH	2020-09-16	365.09	364.16	370.9	363.23	779983.24	284764527.24	2021-05-07 19:24:30	2021-05-07 19:24:30	10
4508	EOS	2020-08-15	3.719	3.263	3.852	3.263	8831958.55	31434377.06	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4571	EOS	2020-10-17	2.526	2.538	2.55	2.508	387084.75	977568.02	2021-05-09 17:34:36	2021-05-09 17:34:36	9
2627	BTC	2020-06-25	9241.32	9292.94	9335.65	9000.53	47297.43	435446758.27	2021-05-09 17:34:36	2021-05-09 17:34:36	7
312184	EOS	2021-06-11	4.918	5.076	5.388	4.859	5538550.11	28191839.54	2021-06-12 23:42:32	2021-06-12 23:42:32	9
144	XTZ	2020-09-12	2.6	2.574	2.638	2.493	2071524.35	5304231.22	2021-05-07 19:24:31	2021-05-07 19:24:31	5
145	XTZ	2020-09-13	2.625	2.6	2.741	2.531	3014470.49	7930504.82	2021-05-07 19:24:31	2021-05-07 19:24:31	5
157	XTZ	2020-09-25	2.21	2.155	2.279	2.101	3191229.83	7000272.63	2021-05-07 19:24:31	2021-05-07 19:24:31	5
158	XTZ	2020-09-26	2.17	2.21	2.243	2.142	2190553.47	4787695.8	2021-05-07 19:24:31	2021-05-07 19:24:31	5
159	XTZ	2020-09-27	2.177	2.17	2.225	2.101	1903517.8	4120781.66	2021-05-07 19:24:31	2021-05-07 19:24:31	5
160	XTZ	2020-09-28	2.247	2.177	2.366	2.177	3132035.28	7120167.81	2021-05-07 19:24:31	2021-05-07 19:24:31	5
161	XTZ	2020-09-29	2.228	2.247	2.28	2.135	2437528.9	5400195.66	2021-05-07 19:24:31	2021-05-07 19:24:31	5
3106	BCH	2020-10-16	250.31	262.27	261.52	246.23	290606.28	72741694.27	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3112	BCH	2020-10-22	268.38	258.95	275.52	262.4	303887.45	81556877.75	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3113	BCH	2020-10-23	270.65	268.38	275.43	266.38	214524.61	58060275.65	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3150	BCH	2020-11-29	285.55	276.39	288.82	278.81	230743.62	65887898.96	2021-05-09 17:34:36	2021-05-09 17:34:36	8
2639	BTC	2020-07-07	9257.32	9347.05	9378.69	9208.31	25836.94	239497399.36	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2687	BTC	2020-08-24	11756.4	11651.52	11827.45	11594.64	39119.97	459366140.6	2021-05-09 17:34:36	2021-05-09 17:34:36	7
317348	XTZ	2021-06-22	2.372	2.49	2.658	2.125	11645027.76	27506559.66	2021-06-23 22:45:04	2021-06-23 22:45:04	5
323512	XTZ	2021-07-05	2.834	3.041	3.041	2.798	2301889.69	6670093.24	2021-07-06 23:48:02	2021-07-06 23:48:02	5
323912	EOS	2021-07-06	3.881	3.815	4.007	3.788	1873275.75	7267354.65	2021-07-07 23:48:16	2021-07-07 23:48:16	9
328642	SJCX	2021-07-16	0.001256	0.001275	0.001256	0.001256	0	0	2021-07-17 23:50:31	2021-07-17 23:50:31	11
337724	ANT	2021-08-05	3.929	3.81	4.265	3.876	764126.47	3001898.6	2021-08-06 23:55:08	2021-08-06 23:55:08	14
342908	SJCX	2021-08-16	0.001837	0.001881	0.001837	0.001837	0	0	2021-08-17 23:57:40	2021-08-17 23:57:40	11
342900	BCH	2021-08-16	673.98	703.74	714.36	673.79	63560	44194717.3	2021-08-17 23:57:40	2021-08-17 23:57:40	8
343372	FIL	2021-08-17	69.41	73.31	74.65	69.03	630783.53	45722177.36	2021-08-18 23:57:53	2021-08-18 23:57:53	13
3427	FIL	2020-09-01	50.06	54.69	56.94	41.54	420.08	21027.66	2021-05-07 19:24:30	2021-05-07 19:24:30	13
292136	BTC	2021-05-09	58294.18	58943.13	59276.99	56350.98	45716.87	2645394205.33	2021-05-10 23:34:53	2021-05-10 23:34:53	7
3657	FIL	2021-04-19	155.18	156.73	164.87	150.69	308666.51	48650621.4	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3658	FIL	2021-04-20	153.99	155.18	158.01	145.4	297179.79	44940659.53	2021-05-07 19:24:30	2021-05-07 19:24:30	13
1675	ETH	2020-11-18	478.76	482.73	495.03	458.58	699555.59	334999694.91	2021-05-07 19:24:30	2021-05-07 19:24:30	10
280364	OCN	2021-05-04	0.001783	0.001887	0.001815	0.001621	38357808.29	68376.61	2021-05-09 17:34:37	2021-05-09 17:34:37	2
1676	ETH	2020-11-19	471.82	478.81	482.16	468.97	887917.88	418935834.36	2021-05-07 19:24:30	2021-05-07 19:24:30	10
292120	DOT	2021-05-09	40.35	39.91	40.54	38.2	1480839.52	58355601.73	2021-05-10 23:34:54	2021-05-10 23:34:54	4
10842	ATOM	2020-07-31	3.797	3.715	3.841	3.707	338291.59	1280912.99	2021-05-09 17:34:36	2021-05-09 17:34:36	3
9101	ANT	2020-10-28	3.104	3.338	3.626	3.085	284282.7	882300.52	2021-05-09 17:34:37	2021-05-09 17:34:37	14
3659	FIL	2021-04-21	148.12	153.99	158.79	147.35	257852.67	39585809.43	2021-05-07 19:24:30	2021-05-07 19:24:30	13
9134	ANT	2020-11-30	3.431	3.289	3.634	3.333	309882.1	1063336.08	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9135	ANT	2020-12-01	3.322	3.426	3.643	3.156	230983.37	775837.47	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9143	ANT	2020-12-09	3.068	3.093	3.22	3.038	317790.15	975030	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9144	ANT	2020-12-10	3.033	3.068	3.084	2.997	189530.52	574889.3	2021-05-09 17:34:37	2021-05-09 17:34:37	14
179	XTZ	2020-10-17	2.189	2.167	2.222	2.152	927816.51	2029455.33	2021-05-07 19:24:31	2021-05-07 19:24:31	5
10846	ATOM	2020-08-04	4.019	3.853	4.053	3.832	506934.45	1999619.6	2021-05-09 17:34:36	2021-05-09 17:34:36	3
9145	ANT	2020-12-11	2.905	3.033	3.014	2.866	232999.03	676959.1	2021-05-09 17:34:37	2021-05-09 17:34:37	14
165	XTZ	2020-10-03	2.113	2.089	2.145	2.072	1392019.64	2941213.82	2021-05-07 19:24:31	2021-05-07 19:24:31	5
2650	BTC	2020-07-18	9177.22	9156.79	9205.94	9125.92	11952.82	109563331.59	2021-05-09 17:34:36	2021-05-09 17:34:36	7
10847	ATOM	2020-08-05	4.155	4.019	4.216	3.951	595278.55	2441870.45	2021-05-09 17:34:36	2021-05-09 17:34:36	3
296466	BTC	2021-05-11	56747.52	55870.01	56928.37	54490.38	42949.94	2395231325.24	2021-05-12 23:35:21	2021-05-12 23:35:21	7
10875	ATOM	2020-09-02	6.653	7.229	7.314	6.387	787556.14	5317359.18	2021-05-09 17:34:36	2021-05-09 17:34:36	3
2652	BTC	2020-07-20	9164.42	9216.02	9224.76	9136.9	18729.9	171877002.63	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2998	BCH	2020-06-30	222.2	225.18	224.76	220.83	146467.88	32545009.2	2021-05-09 17:34:36	2021-05-09 17:34:36	8
10897	ATOM	2020-09-24	4.481	3.841	4.548	3.8	567601.19	2399714.55	2021-05-09 17:34:36	2021-05-09 17:34:36	3
2653	BTC	2020-07-21	9392.83	9164.42	9435.55	9162.25	34505.35	337645738.93	2021-05-09 17:34:36	2021-05-09 17:34:36	7
10898	ATOM	2020-09-25	4.798	4.481	4.801	4.352	533779.47	2434950.42	2021-05-09 17:34:36	2021-05-09 17:34:36	3
302042	OCN	2021-05-21	0.0005602	0.0007209	0.0007064	0.0005602	88229147.98	49430.19	2021-05-22 23:37:39	2021-05-22 23:37:39	2
166	XTZ	2020-10-04	2.115	2.113	2.151	2.088	1543998.47	3275146.97	2021-05-07 19:24:31	2021-05-07 19:24:31	5
2999	BCH	2020-07-01	223.95	222.2	227.74	222.93	204061.46	45699705.5	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3071	BCH	2020-09-11	225.54	227.6	228.97	225.13	201844.84	45524784.61	2021-05-09 17:34:36	2021-05-09 17:34:36	8
1976	ZRX	2020-09-14	0.4736	0.4891	0.4925	0.4707	3959316.47	1908647.4	2021-05-09 17:34:36	2021-05-09 17:34:36	6
9146	ANT	2020-12-12	2.965	2.904	3.083	2.956	86985.77	257928.52	2021-05-09 17:34:37	2021-05-09 17:34:37	14
146902	ZRX	2021-04-30	1.803	1.673	1.822	1.631	10599641.51	18395057.17	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1560	ETH	2020-07-26	311.47	305.67	319.07	300.43	731791.27	226259900.31	2021-05-07 19:24:30	2021-05-07 19:24:30	10
2645	BTC	2020-07-13	9237.89	9300.95	9336.42	9201.18	25872.33	240081841.21	2021-05-09 17:34:36	2021-05-09 17:34:36	7
9147	ANT	2020-12-13	3.004	2.965	3.167	2.995	102558.19	308126.02	2021-05-09 17:34:37	2021-05-09 17:34:37	14
2662	BTC	2020-07-30	11113.66	11112.04	11182.76	10875.14	45655.22	503563543.58	2021-05-09 17:34:36	2021-05-09 17:34:36	7
3066	BCH	2020-09-06	227.88	225.53	232.81	225.01	341981.23	77931646.29	2021-05-09 17:34:36	2021-05-09 17:34:36	8
9160	ANT	2020-12-26	2.864	2.866	3.097	2.83	267935.88	767386.93	2021-05-09 17:34:37	2021-05-09 17:34:37	14
3114	BCH	2020-10-24	276.04	270.65	280.64	272.63	170394.37	47036090.25	2021-05-09 17:34:36	2021-05-09 17:34:36	8
306888	ETH	2021-05-31	2707.38	2386.91	2718.67	2274.99	871042.27	2183404966.43	2021-06-01 23:39:56	2021-06-01 23:39:56	10
1665	ETH	2020-11-08	454.74	435.82	460.03	432.87	169586.34	75984233.86	2021-05-07 19:24:30	2021-05-07 19:24:30	10
2663	BTC	2020-07-31	11352.72	11113.66	11454.11	10981.87	54108.77	608151203.91	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2671	BTC	2020-08-08	11770.77	11603.82	11811.4	11534.87	23238.62	271582305.12	2021-05-09 17:34:36	2021-05-09 17:34:36	7
3115	BCH	2020-10-25	271.39	276.04	274.52	268.39	144875.7	39317465.64	2021-05-09 17:34:36	2021-05-09 17:34:36	8
2675	BTC	2020-08-12	11570.19	11389.01	11621.05	11182.8	37568.86	430758054.54	2021-05-09 17:34:36	2021-05-09 17:34:36	7
3116	BCH	2020-10-26	259.69	271.39	273.15	258.38	188736.88	49012999.98	2021-05-09 17:34:36	2021-05-09 17:34:36	8
1666	ETH	2020-11-09	444.45	454.74	458.75	434.54	230777.2	103452706.39	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1667	ETH	2020-11-10	450.86	444.45	455.07	439.44	206511.07	92709328.95	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1677	ETH	2020-11-20	510.43	471.89	514.38	471.19	759082.86	379278054.3	2021-05-07 19:24:30	2021-05-07 19:24:30	10
2676	BTC	2020-08-13	11790.68	11570.19	11795.34	11284.57	42205.26	487564726.98	2021-05-09 17:34:36	2021-05-09 17:34:36	7
1776	ETH	2021-02-27	1460.23	1446.1	1526.93	1426.45	585399.45	867562033.49	2021-05-07 19:24:30	2021-05-07 19:24:30	10
312186	BCH	2021-06-11	576.98	601.52	610.98	570.04	55260.92	32787433.53	2021-06-12 23:42:32	2021-06-12 23:42:32	8
317350	ETH	2021-06-22	1880.83	1887.89	1998.75	1705.78	1703182.02	3161540297.98	2021-06-23 23:45:04	2021-06-23 23:45:04	10
1785	ETH	2021-03-08	1834.48	1726.33	1842.9	1666.76	687732.85	1199163171.81	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1830	ETH	2021-04-22	2401.35	2357.59	2644.5	2310.62	1338689.99	3319342457.7	2021-05-07 19:24:30	2021-05-07 19:24:30	10
3157	BCH	2020-12-06	286.61	289.65	294.17	286.61	140092.92	40152665.39	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3158	BCH	2020-12-07	283.88	286.61	288.68	282.54	154188.86	43771884.17	2021-05-09 17:34:36	2021-05-09 17:34:36	8
7762	ETH	2021-04-23	2369.67	2401.35	2441.96	2096	1532966.63	3462302445.7	2021-05-07 19:24:30	2021-05-07 19:24:30	10
3159	BCH	2020-12-08	267.71	283.88	271.55	261.84	154398	41333367.83	2021-05-09 17:34:36	2021-05-09 17:34:36	8
323516	BCH	2021-07-05	504.86	527.04	527.04	487.94	53300.01	27122517.86	2021-07-06 23:48:03	2021-07-06 23:48:03	8
323928	ANT	2021-07-06	4.047	3.569	4.208	3.619	1828008.27	7397750.97	2021-07-07 23:48:16	2021-07-07 23:48:16	14
329044	BCH	2021-07-17	436.61	438.37	446.07	432.19	90944.06	39706676.57	2021-07-18 23:50:46	2021-07-18 23:50:46	8
337742	ETH	2021-08-05	2829.23	2725.72	2844.03	2536.51	676232.43	1840893881.29	2021-08-06 23:55:07	2021-08-06 23:55:07	10
10955	ATOM	2020-11-21	5.936	5.28	5.955	5.271	965216.35	5427935.35	2021-05-09 17:34:36	2021-05-09 17:34:36	3
146904	FIL	2021-04-30	164.19	149.83	165	149.71	311329.22	49477199.76	2021-05-07 19:24:30	2021-05-07 19:24:30	13
142120	XTZ	2021-04-28	5.253	5.434	5.552	5.081	4051216.69	21407004.97	2021-05-07 19:24:31	2021-05-07 19:24:31	5
1232	SJCX	2020-09-02	0.0004559	0.0004771	0.0004559	0.0004559	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
11000	ATOM	2021-01-05	6.221	6.049	6.395	5.649	2264401.87	13735997.91	2021-05-09 17:34:36	2021-05-09 17:34:36	3
2421	OCN	2020-12-02	0.0002812	0.0002697	0.0002812	0.0002632	170108890.19	47831.59	2021-05-09 17:34:37	2021-05-09 17:34:37	2
296468	ATOM	2021-05-11	26.98	25.37	27.1	23.9	1725229.02	43892996.36	2021-05-12 23:35:21	2021-05-12 23:35:21	3
302044	ETH	2021-05-21	2435.86	2772.84	2939.92	2107.47	1890815.86	4714736714.8	2021-05-22 23:37:39	2021-05-22 23:37:39	10
8990	ANT	2020-07-09	1.336	1.34	1.352	1.302	43709.73	58394.11	2021-05-09 17:34:37	2021-05-09 17:34:37	14
8991	ANT	2020-07-10	1.391	1.337	1.457	1.332	39816.11	55396.13	2021-05-09 17:34:37	2021-05-09 17:34:37	14
1678	ETH	2020-11-21	552.26	510.43	553.11	503.09	741748	392076756.29	2021-05-07 19:24:30	2021-05-07 19:24:30	10
9136	ANT	2020-12-02	3.424	3.322	3.565	3.32	536194.16	1836027.7	2021-05-09 17:34:37	2021-05-09 17:34:37	14
1233	SJCX	2020-09-03	0.000407	0.0004559	0.000407	0.000407	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1286	SJCX	2020-10-26	0.0005228	0.0005216	0.0005228	0.0005228	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
8992	ANT	2020-07-11	1.385	1.391	1.404	1.317	19432.6	26907.27	2021-05-09 17:34:37	2021-05-09 17:34:37	14
2698	BTC	2020-09-04	10467.33	10174.62	10638.71	10020.02	54204.6	562742223.01	2021-05-09 17:34:36	2021-05-09 17:34:36	7
292122	OCN	2021-05-09	0.001806	0.001841	0.001964	0.001728	48403907.31	87439.12	2021-05-10 23:34:57	2021-05-10 23:34:57	2
2699	BTC	2020-09-05	10167.97	10467.33	10570.95	9880.05	60292.64	614402772.13	2021-05-09 17:34:36	2021-05-09 17:34:36	7
1679	ETH	2020-11-22	560.01	552.26	581.05	513.33	964066.75	530834818.6	2021-05-07 19:24:30	2021-05-07 19:24:30	10
2700	BTC	2020-09-06	10260.37	10167.97	10361.12	10019.56	29450	300644746.65	2021-05-09 17:34:36	2021-05-09 17:34:36	7
306890	BTC	2021-05-31	37290.83	35662.59	37512.8	34202.86	50306.62	1821662523.97	2021-06-01 23:39:56	2021-06-01 23:39:56	7
1680	ETH	2020-11-23	609.13	560.01	610.75	550.31	1068086.27	628512665.29	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1689	ETH	2020-12-02	598.26	586.23	604.64	576.61	532202.31	314984220.64	2021-05-07 19:24:30	2021-05-07 19:24:30	10
142126	ETH	2021-04-28	2750.91	2667.93	2761.78	2560.07	823472.94	2211100347.39	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1303	SJCX	2020-11-12	0.0006523	0.0006283	0.0006523	0.0006523	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
271058	ETH	2021-05-03	3431.41	2951.98	3455.66	2951.85	1138802.12	3650014191.34	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1304	SJCX	2020-11-13	0.0006533	0.0006523	0.0006533	0.0006533	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
280372	ETH	2021-05-04	3241.09	3431.41	3531.04	3185.01	1452703.51	4856094057.96	2021-05-07 19:24:30	2021-05-07 19:24:30	10
3006	BCH	2020-07-08	243.44	237.91	248.35	241.17	269436.44	65590790.02	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3065	BCH	2020-09-05	225.53	230.6	229.8	218.1	415627.93	93734727.73	2021-05-09 17:34:36	2021-05-09 17:34:36	8
1308	SJCX	2020-11-17	0.0007073	0.0006689	0.0007073	0.0007073	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
3067	BCH	2020-09-07	228.86	227.88	232.49	226.37	274206.16	62754469.15	2021-05-09 17:34:36	2021-05-09 17:34:36	8
4522	EOS	2020-08-29	3.132	3.118	3.206	3.088	1980601.85	6251853.66	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4523	EOS	2020-08-30	3.265	3.132	3.274	3.131	1733631.61	5560965.71	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4582	EOS	2020-10-28	2.655	2.672	2.746	2.625	712517.57	1908172.69	2021-05-09 17:34:36	2021-05-09 17:34:36	9
2688	BTC	2020-08-25	11330.56	11756.4	11767.64	11130.36	50836.08	583786229.48	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2689	BTC	2020-08-26	11466.89	11330.56	11542.65	11259.23	27168.29	309986442.65	2021-05-09 17:34:36	2021-05-09 17:34:36	7
11001	ATOM	2021-01-06	6.698	6.221	6.972	5.883	2501776.98	16210516.3	2021-05-09 17:34:36	2021-05-09 17:34:36	3
3070	BCH	2020-09-10	227.6	224.32	229.36	223.36	166645.24	37929283.18	2021-05-09 17:34:36	2021-05-09 17:34:36	8
11002	ATOM	2021-01-07	6.263	6.698	6.861	5.987	2456494.09	16115937.13	2021-05-09 17:34:36	2021-05-09 17:34:36	3
2690	BTC	2020-08-27	11331.02	11466.89	11591.64	11135.52	40978.91	464957172.93	2021-05-09 17:34:36	2021-05-09 17:34:36	7
8993	ANT	2020-07-12	1.393	1.387	1.496	1.354	53190.16	73867.44	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9137	ANT	2020-12-03	3.37	3.424	3.54	3.341	174484.31	588084.47	2021-05-09 17:34:37	2021-05-09 17:34:37	14
142132	SJCX	2021-04-28	0.002195	0.002203	0.002195	0.002195	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
9138	ANT	2020-12-04	3.201	3.37	3.321	3.167	193800.26	620363.84	2021-05-09 17:34:37	2021-05-09 17:34:37	14
11003	ATOM	2021-01-08	5.946	6.263	6.346	5.672	1987118.16	11899344.92	2021-05-09 17:34:36	2021-05-09 17:34:36	3
11004	ATOM	2021-01-09	6.561	5.946	6.738	5.827	2335498.67	15039345.49	2021-05-09 17:34:36	2021-05-09 17:34:36	3
9140	ANT	2020-12-06	3.459	3.285	3.632	3.24	146258.24	505870.63	2021-05-09 17:34:37	2021-05-09 17:34:37	14
2691	BTC	2020-08-28	11535.21	11331.02	11553.81	11289.07	30815.36	353027933.9	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2692	BTC	2020-08-29	11480.48	11535.21	11585.98	11433.8	16305.87	187746012.8	2021-05-09 17:34:36	2021-05-09 17:34:36	7
9142	ANT	2020-12-08	3.093	3.399	3.276	3.071	246881.28	763606.31	2021-05-09 17:34:37	2021-05-09 17:34:37	14
2693	BTC	2020-08-30	11716.54	11480.48	11718.98	11470.07	16398.78	190649396.2	2021-05-09 17:34:36	2021-05-09 17:34:36	7
9158	ANT	2020-12-24	2.79	2.652	2.856	2.707	191952.31	535540.4	2021-05-09 17:34:37	2021-05-09 17:34:37	14
3072	BCH	2020-09-12	230.27	225.54	230.38	225.15	162888.21	37508906.64	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3117	BCH	2020-10-27	264.6	259.69	273.74	261.59	138571.27	36665449.18	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3120	BCH	2020-10-30	261.96	267.49	271.73	258.7	285853.58	74881773.46	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3121	BCH	2020-10-31	262.26	261.96	268.48	261.02	145463.85	38150046.07	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3124	BCH	2020-11-03	244.43	257.58	267.43	244.01	168441.84	41172994.48	2021-05-09 17:34:36	2021-05-09 17:34:36	8
2722	BTC	2020-09-28	10699	10781.47	10951.6	10649.18	32269.15	350615325.76	2021-05-09 17:34:36	2021-05-09 17:34:36	7
306916	DOT	2021-05-31	23.33	20.46	23.43	19.12	1882928.91	40198744.28	2021-06-01 23:39:56	2021-06-01 23:39:56	4
3161	BCH	2020-12-10	265.73	268.97	269.01	261.53	140999.48	37467346.71	2021-05-09 17:34:36	2021-05-09 17:34:36	8
312188	ETH	2021-06-11	2355.09	2471.56	2497.64	2322.3	408138.02	988630797.95	2021-06-12 23:42:32	2021-06-12 23:42:32	10
317352	ZRX	2021-06-22	0.576	0.6027	0.6443	0.4997	18579908.12	10581679.34	2021-06-23 22:45:04	2021-06-23 22:45:04	6
323906	XTZ	2021-07-06	2.869	2.834	2.984	2.807	2283427.84	6611628.76	2021-07-07 23:48:16	2021-07-07 23:48:16	5
329046	ATOM	2021-07-17	11.02	11.11	11.5	10.73	1409239.57	15634412.6	2021-07-18 23:50:45	2021-07-18 23:50:45	3
329092	BTC	2021-07-17	31546.64	31401.76	31966.25	31194.16	27922.98	881285396.92	2021-07-18 23:50:45	2021-07-18 23:50:45	7
296470	DOT	2021-05-11	38.72	36.54	38.73	35.61	987434.94	36808954.29	2021-05-12 23:35:22	2021-05-12 23:35:22	4
4524	EOS	2020-08-31	3.211	3.265	3.297	3.198	972559.76	3157255.87	2021-05-09 17:34:36	2021-05-09 17:34:36	9
1387	SJCX	2021-02-04	0.001479	0.001507	0.001479	0.001479	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
2219	OCN	2020-05-14	0.0002745	0.0002758	0.0002968	0.0002643	354238251.56	97232.02	2021-05-09 17:34:37	2021-05-09 17:34:37	2
9128	ANT	2020-11-24	4.04	4.163	4.439	3.946	621347.71	2510397.01	2021-05-09 17:34:37	2021-05-09 17:34:37	14
1878	ZRX	2020-06-08	0.3188	0.3219	0.3226	0.3158	2909326.46	928510.84	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2220	OCN	2020-05-15	0.0002842	0.0002745	0.0003037	0.000255	428110287.87	121664.23	2021-05-09 17:34:37	2021-05-09 17:34:37	2
9129	ANT	2020-11-25	3.696	4.04	4.013	3.627	416880.62	1540984.63	2021-05-09 17:34:37	2021-05-09 17:34:37	14
271060	ZRX	2021-05-03	1.903	1.87	1.969	1.85	10441255.53	19920545.28	2021-05-09 17:34:36	2021-05-09 17:34:36	6
9187	ANT	2021-01-22	3.37	3.426	3.753	3.327	546153.22	1840601.26	2021-05-09 17:34:37	2021-05-09 17:34:37	14
2658	BTC	2020-07-26	9942.01	9708.41	10140.55	9659.08	42161.94	417337407.31	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2221	OCN	2020-05-16	0.0002767	0.0002842	0.0002968	0.0002687	305396176.8	84504.28	2021-05-09 17:34:37	2021-05-09 17:34:37	2
10743	ATOM	2020-04-23	2.421	2.394	2.458	2.373	2093668.45	5069330.75	2021-04-23 22:51:51	2021-04-23 22:51:51	3
292124	ANT	2021-05-09	10.23	10.33	10.5	9.828	488513.17	4997796.8	2021-05-10 23:34:53	2021-05-10 23:34:53	14
2659	BTC	2020-07-27	11042.94	9942.01	11397.48	9935.51	128836.3	1363674374.42	2021-05-09 17:34:36	2021-05-09 17:34:36	7
10764	ATOM	2020-05-14	2.531	2.544	2.602	2.495	1661874.01	4206758.19	2021-05-09 17:34:36	2021-05-09 17:34:36	3
1388	SJCX	2021-02-05	0.001532	0.001479	0.001532	0.001532	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
2222	OCN	2020-05-17	0.0002856	0.0002767	0.0003043	0.0002711	172738391.85	49339.68	2021-05-09 17:34:37	2021-05-09 17:34:37	2
3392	FIL	2020-07-28	20.78	18.31	21.25	16.97	80.93	1682.06	2021-05-07 19:24:30	2021-05-07 19:24:30	13
9191	ANT	2021-01-26	4.006	3.876	4.195	3.697	508501.24	2037073.9	2021-05-09 17:34:37	2021-05-09 17:34:37	14
4585	EOS	2020-10-31	2.527	2.51	2.557	2.5	1346169.12	3404591.59	2021-05-09 17:34:36	2021-05-09 17:34:36	9
2660	BTC	2020-07-28	10933.26	11042.94	11253.39	10590.98	85478.78	938667838.04	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2661	BTC	2020-07-29	11112.04	10933.26	11348.53	10854.04	61949.48	689206497.21	2021-05-09 17:34:36	2021-05-09 17:34:36	7
9244	ANT	2021-03-20	7.077	7.054	7.78	6.949	838614.98	5934662.87	2021-05-09 17:34:37	2021-05-09 17:34:37	14
2685	BTC	2020-08-22	11670.42	11527.35	11686.02	11379.06	49538.11	572197825.57	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2223	OCN	2020-05-18	0.0002834	0.0002856	0.0003006	0.0002727	169349846.8	48001.13	2021-05-09 17:34:37	2021-05-09 17:34:37	2
4602	EOS	2020-11-17	2.718	2.584	2.755	2.578	3619028.72	9696820.59	2021-05-09 17:34:36	2021-05-09 17:34:36	9
2224	OCN	2020-05-19	0.0002769	0.0002834	0.0003005	0.0002704	246646051.12	68289.56	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2686	BTC	2020-08-23	11651.52	11670.42	11713.62	11521.6	33405.25	388308826.36	2021-05-09 17:34:36	2021-05-09 17:34:36	7
1389	SJCX	2021-02-06	0.001571	0.001532	0.001571	0.001571	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1390	SJCX	2021-02-07	0.001555	0.001571	0.001555	0.001555	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1434	SJCX	2021-03-23	0.002174	0.002164	0.002174	0.002174	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1435	SJCX	2021-03-24	0.002092	0.002174	0.002092	0.002092	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
271070	FIL	2021-05-03	160.36	162.62	164	158.04	253367.12	40723825.32	2021-05-07 19:24:30	2021-05-07 19:24:30	13
1451	SJCX	2021-04-09	0.002324	0.002323	0.002324	0.002324	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
302046	DOT	2021-05-21	24.46	29.03	31.01	20.05	4876956.64	120066885.71	2021-05-22 23:37:39	2021-05-22 23:37:39	4
2225	OCN	2020-05-20	0.0002749	0.0002769	0.0002896	0.0002644	238970813.2	65693.91	2021-05-09 17:34:37	2021-05-09 17:34:37	2
1791	ETH	2021-03-14	1848.69	1921.18	1931.77	1837.82	367039.57	690832715.33	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1794	ETH	2021-03-17	1823.03	1805.64	1838.35	1742.81	629261.22	1129204045.53	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1796	ETH	2021-03-19	1809.76	1776.16	1840.66	1734.36	324695.13	584649417.76	2021-05-07 19:24:30	2021-05-07 19:24:30	10
3181	BCH	2020-12-30	359.1	352.13	382.21	355.05	331270.52	118958532.26	2021-05-09 17:34:36	2021-05-09 17:34:36	8
1797	ETH	2021-03-20	1805.49	1809.76	1868.98	1800.95	272549.21	500262459.33	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1808	ETH	2021-03-31	1919.08	1841.4	1947.27	1772.26	574695.62	1070069136.01	2021-05-07 19:24:30	2021-05-07 19:24:30	10
10801	ATOM	2020-06-20	2.616	2.6	2.632	2.566	421649.37	1103124.44	2021-05-09 17:34:36	2021-05-09 17:34:36	3
3297	FIL	2020-04-24	0	0	0	0	0	0	2021-04-24 20:28:41	2021-04-24 20:28:41	13
10802	ATOM	2020-06-21	2.602	2.616	2.611	2.565	452984.35	1178583.11	2021-05-09 17:34:36	2021-05-09 17:34:36	3
306892	XTZ	2021-05-31	3.604	3.284	3.61	3.164	5179941.83	17556445.9	2021-06-01 23:39:56	2021-06-01 23:39:56	5
10939	ATOM	2020-11-05	4.508	4.388	4.591	4.289	203447.92	911529.95	2021-05-09 17:34:36	2021-05-09 17:34:36	3
3182	BCH	2020-12-31	342.45	359.1	360.13	339.56	296688.47	101602084.47	2021-05-09 17:34:36	2021-05-09 17:34:36	8
312190	ZRX	2021-06-11	0.8637	0.9317	0.9492	0.8521	5845412.14	5265362.41	2021-06-12 23:42:32	2021-06-12 23:42:32	6
11044	ATOM	2021-02-18	23.06	23.87	24.97	22.77	2840197.39	67471654.64	2021-05-09 17:34:36	2021-05-09 17:34:36	3
11056	ATOM	2021-03-02	18.88	18.71	20.47	18.02	2574432.19	49683154.93	2021-05-09 17:34:36	2021-05-09 17:34:36	3
80776	ATOM	2021-04-26	22.1	18.69	22.81	18.53	2037531.43	43095752.73	2021-05-09 17:34:36	2021-05-09 17:34:36	3
3197	BCH	2021-01-15	491.52	526.64	499.61	482.69	433374.17	213010629.42	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3198	BCH	2021-01-16	489.94	491.52	494.27	471.93	317316.65	155467241.53	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3232	BCH	2021-02-19	719.9	704.69	742.75	680.64	157892.83	112805496.71	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3233	BCH	2021-02-20	680.76	719.9	748.18	632.31	194640.14	137545879.74	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3235	BCH	2021-02-22	629.63	707.24	710.73	532.86	257621.32	162098403.68	2021-05-09 17:34:36	2021-05-09 17:34:36	8
4603	EOS	2020-11-18	2.64	2.718	2.734	2.451	3428836.63	8942433.4	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4604	EOS	2020-11-19	2.638	2.64	2.699	2.562	1912391.78	5038343.93	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4605	EOS	2020-11-20	2.782	2.638	2.828	2.637	3851488.07	10592233.02	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4606	EOS	2020-11-21	3.228	2.782	3.254	2.695	9942794.91	29783885.94	2021-05-09 17:34:36	2021-05-09 17:34:36	9
280376	EOS	2021-05-04	6.347	6.813	7.079	6.234	15495065.63	102116473.7	2021-05-09 17:34:36	2021-05-09 17:34:36	9
317354	OCN	2021-06-22	0.0005642	0.0004909	0.0005642	0.0004326	69898522.13	39440.17	2021-06-23 23:45:04	2021-06-23 23:45:04	2
323910	SJCX	2021-07-06	0.00137	0.001348	0.00137	0.00137	0	0	2021-07-07 23:48:16	2021-07-07 23:48:16	11
329088	DOT	2021-07-17	12.29	12.04	12.73	11.74	1005115.43	12191423.94	2021-07-18 23:50:45	2021-07-18 23:50:45	4
329048	ANT	2021-07-17	3.448	3.39	3.513	3.336	51525.91	176662.49	2021-07-18 23:50:45	2021-07-18 23:50:45	14
296472	ZRX	2021-05-11	1.865	1.74	1.885	1.665	16831019.39	29859383.13	2021-05-12 23:35:29	2021-05-12 23:35:29	6
142116	DOT	2021-04-28	34	34.84	35.37	32.59	970224.46	32798789.64	2021-05-09 17:34:36	2021-05-09 17:34:36	4
2226	OCN	2020-05-21	0.0002641	0.0002749	0.00028	0.0002502	174031898.36	45959.18	2021-05-09 17:34:37	2021-05-09 17:34:37	2
292126	ZRX	2021-05-09	1.954	1.958	1.999	1.836	12291714.51	23616431.88	2021-05-10 23:34:54	2021-05-10 23:34:54	6
2707	BTC	2020-09-13	10332.36	10448	10578.97	10224.4	28905.77	299956975.1	2021-05-09 17:34:36	2021-05-09 17:34:36	7
10826	ATOM	2020-07-15	4.04	3.959	4.136	3.864	915777.53	3650406.82	2021-05-09 17:34:36	2021-05-09 17:34:36	3
2712	BTC	2020-09-18	10937.89	10945.14	11040.66	10823.93	22774.38	248821618.73	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2228	OCN	2020-05-23	0.0002976	0.0002902	0.0003121	0.0002749	104582470.84	31128.76	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2724	BTC	2020-09-30	10779.42	10841.29	10850.12	10666.17	29556.58	317604086.65	2021-05-09 17:34:36	2021-05-09 17:34:36	7
10827	ATOM	2020-07-16	4.072	4.04	4.305	3.754	1640308.32	6553460.31	2021-05-09 17:34:36	2021-05-09 17:34:36	3
9077	ANT	2020-10-04	3.537	3.529	3.604	3.477	40435.75	143032.57	2021-05-09 17:34:37	2021-05-09 17:34:37	14
3329	FIL	2020-05-26	0	0	0	0	0	0	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3330	FIL	2020-05-27	0	0	0	0	0	0	2021-05-07 19:24:30	2021-05-07 19:24:30	13
10828	ATOM	2020-07-17	4.145	4.072	4.256	3.953	1129072.62	4641595.73	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10829	ATOM	2020-07-18	4.363	4.145	4.503	4.091	1548461.19	6746795.36	2021-05-09 17:34:36	2021-05-09 17:34:36	3
2960	BCH	2020-05-23	234.34	234.86	236.82	232.78	185272.19	43416630.7	2021-05-09 17:34:36	2021-05-09 17:34:36	8
2725	BTC	2020-10-01	10622.79	10779.42	10926.47	10454.66	39457.33	422940486.72	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2229	OCN	2020-05-24	0.0002757	0.0002976	0.0002957	0.0002657	152390139.76	42013.41	2021-05-09 17:34:37	2021-05-09 17:34:37	2
9243	ANT	2021-03-19	7.054	6.739	7.368	6.677	961128.24	6780101.86	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9273	ANT	2021-04-18	8.808	10.37	9.843	7.875	933080.6	8218809.07	2021-05-09 17:34:37	2021-05-09 17:34:37	14
4427	EOS	2020-05-26	2.504	2.527	2.536	2.458	5504927.9	13814398.87	2021-05-09 17:34:36	2021-05-09 17:34:36	9
302048	BCH	2021-05-21	688.96	819.05	851.19	605.92	306250.31	217550328.45	2021-05-22 23:37:39	2021-05-22 23:37:39	8
4583	EOS	2020-10-29	2.638	2.655	2.677	2.605	587492.35	1553394.72	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4627	EOS	2020-12-12	2.767	2.696	2.788	2.681	1148857.41	3160483.25	2021-05-09 17:34:36	2021-05-09 17:34:36	9
2230	OCN	2020-05-25	0.000298	0.0002757	0.0003102	0.0002694	86762180.2	25853.92	2021-05-09 17:34:37	2021-05-09 17:34:37	2
1818	ETH	2021-04-10	2133.82	2066.55	2195.55	2057.75	415765.82	889892660.09	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1819	ETH	2021-04-11	2150.54	2133.82	2163.6	2113.71	208018.65	445144430.2	2021-05-07 19:24:30	2021-05-07 19:24:30	10
3331	FIL	2020-05-28	0	0	0	0	0	0	2021-05-07 19:24:30	2021-05-07 19:24:30	13
4646	EOS	2020-12-31	2.593	2.612	2.656	2.513	4333614.49	11179572.15	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4647	EOS	2021-01-01	2.64	2.593	2.734	2.571	4495835.89	11889011.72	2021-05-09 17:34:36	2021-05-09 17:34:36	9
2726	BTC	2020-10-02	10576.64	10622.79	10668.49	10388.07	33798.95	355424408.51	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2231	OCN	2020-05-26	0.0003015	0.000298	0.0003196	0.0002835	85335190.46	25732.4	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2240	OCN	2020-06-04	0.0003164	0.000313	0.0003212	0.0003066	11124403.19	3519.26	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2241	OCN	2020-06-05	0.0003169	0.0003164	0.0003193	0.0003049	9250001.98	2931.38	2021-05-09 17:34:37	2021-05-09 17:34:37	2
80409	ETH	2021-04-25	2322.14	2216.56	2357.02	2166.7	692277.45	1563493601.18	2021-05-07 19:24:30	2021-05-07 19:24:30	10
80410	ETH	2021-04-26	2534.9	2322.14	2542.23	2306.94	742616.36	1831381585.37	2021-05-07 19:24:30	2021-05-07 19:24:30	10
10838	ATOM	2020-07-27	3.603	3.816	3.928	3.309	1519042.39	5549963.28	2021-05-09 17:34:36	2021-05-09 17:34:36	3
3332	FIL	2020-05-29	0	0	0	0	0	0	2021-05-07 19:24:30	2021-05-07 19:24:30	13
306894	ANT	2021-05-31	4.993	4.126	5.664	4.277	1962684.94	9800161.14	2021-06-01 23:39:56	2021-06-01 23:39:56	14
2727	BTC	2020-10-03	10552.04	10576.64	10602.28	10507.49	10469.92	110570157.37	2021-05-09 17:34:36	2021-05-09 17:34:36	7
4655	EOS	2021-01-09	3.63	3.114	3.743	3.015	14625715.98	51129292.75	2021-05-09 17:34:36	2021-05-09 17:34:36	9
312192	SJCX	2021-06-11	0.001494	0.001467	0.001494	0.001494	0	0	2021-06-12 23:42:32	2021-06-12 23:42:32	11
4692	EOS	2021-02-15	4.709	5.071	5.247	4.114	27385445.16	127803610.55	2021-05-09 17:34:36	2021-05-09 17:34:36	9
2728	BTC	2020-10-04	10675.52	10552.04	10699.94	10534.5	10487.7	111420779.07	2021-05-09 17:34:36	2021-05-09 17:34:36	7
3020	BCH	2020-07-22	240.15	230.41	240.15	232.52	190482.9	45744030.93	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3021	BCH	2020-07-23	238.65	240.15	242.98	238.26	211476.95	50468870.96	2021-05-09 17:34:36	2021-05-09 17:34:36	8
1230	SJCX	2020-08-31	0.0004663	0.0004687	0.0004663	0.0004663	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1231	SJCX	2020-09-01	0.0004771	0.0004663	0.0004771	0.0004771	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
3022	BCH	2020-07-24	235.41	238.65	237.9	234.27	164677.28	38767200.43	2021-05-09 17:34:36	2021-05-09 17:34:36	8
1258	SJCX	2020-09-28	0.000428	0.0004313	0.000428	0.000428	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
10839	ATOM	2020-07-28	3.76	3.603	3.797	3.561	763041.45	2810758.8	2021-05-09 17:34:36	2021-05-09 17:34:36	3
1452	SJCX	2021-04-10	0.002391	0.002324	0.002391	0.002391	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1453	SJCX	2021-04-11	0.002399	0.002391	0.002399	0.002399	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1464	SJCX	2021-04-22	0.002069	0.002152	0.002069	0.002069	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
10840	ATOM	2020-07-29	3.63	3.76	3.861	3.616	521038.92	1961037.65	2021-05-09 17:34:36	2021-05-09 17:34:36	3
146908	EOS	2021-04-30	6.448	5.892	6.458	5.791	6639724.2	41441670.73	2021-05-09 17:34:36	2021-05-09 17:34:36	9
3333	FIL	2020-05-30	0	0	0	0	0	0	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3334	FIL	2020-05-31	0	0	0	0	0	0	2021-05-07 19:24:30	2021-05-07 19:24:30	13
146916	SJCX	2021-04-30	0.00231	0.002143	0.00231	0.00231	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
3335	FIL	2020-06-01	0	0	0	0	0	0	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3023	BCH	2020-07-25	251.25	235.41	252.71	239.22	248721.75	62492247.72	2021-05-09 17:34:36	2021-05-09 17:34:36	8
317356	DOT	2021-06-22	14.65	15.74	16.95	13.04	4334787.99	64363190.36	2021-06-23 23:45:04	2021-06-23 23:45:04	4
3024	BCH	2020-07-26	247.75	251.25	260.68	245.77	241459.23	59822704.77	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3336	FIL	2020-06-02	0	0	0	0	0	0	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3025	BCH	2020-07-27	268.9	247.75	283.47	266.02	408505.6	109845353.92	2021-05-09 17:34:36	2021-05-09 17:34:36	8
323914	ZRX	2021-07-06	0.7127	0.6938	0.7466	0.6917	8493770.92	6091816.7	2021-07-07 23:48:16	2021-07-07 23:48:16	6
329050	XTZ	2021-07-17	2.408	2.409	2.481	2.374	2656373.43	6438427.02	2021-07-18 23:50:46	2021-07-18 23:50:46	5
337746	EOS	2021-08-05	4.191	4.112	4.218	3.946	4895170.64	20147938.26	2021-08-06 23:55:07	2021-08-06 23:55:07	9
2732	BTC	2020-10-08	10929.4	10672.67	10957.42	10541.2	39280.36	423807796.12	2021-05-09 17:34:36	2021-05-09 17:34:36	7
10781	ATOM	2020-05-31	2.727	2.823	2.797	2.656	1171182.15	3194354.93	2021-05-09 17:34:36	2021-05-09 17:34:36	3
2734	BTC	2020-10-10	11301.57	11058.78	11485.43	11057.98	26181.83	296925751.27	2021-05-09 17:34:36	2021-05-09 17:34:36	7
1391	SJCX	2021-02-08	0.001857	0.001555	0.001857	0.001857	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
4628	EOS	2020-12-13	2.853	2.767	2.901	2.755	2270075.76	6444336.73	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4644	EOS	2020-12-29	2.636	2.763	2.786	2.501	5101756.07	13366763.61	2021-05-09 17:34:36	2021-05-09 17:34:36	9
686	DOT	2021-03-07	35.11	33.38	35.32	33.38	636522.27	21895007.26	2021-05-09 17:34:36	2021-05-09 17:34:36	4
270500	DOT	2021-05-02	36.66	36.93	37.18	35.55	460639.83	16788909.28	2021-05-09 17:34:36	2021-05-09 17:34:36	4
9178	ANT	2021-01-13	3.292	3.165	3.631	3.256	250872.97	825906.8	2021-05-09 17:34:37	2021-05-09 17:34:37	14
2227	OCN	2020-05-22	0.0002902	0.0002641	0.0003068	0.0002695	161533872.51	46875.84	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2367	OCN	2020-10-09	0.0002814	0.0002634	0.0003179	0.0002594	147892608.17	41611.91	2021-05-09 17:34:37	2021-05-09 17:34:37	2
10782	ATOM	2020-06-01	2.864	2.727	2.934	2.805	927788.18	2657503.95	2021-05-09 17:34:36	2021-05-09 17:34:36	3
2738	BTC	2020-10-14	11429.3	11427.29	11550.25	11298.88	22758.2	259711904.03	2021-05-09 17:34:36	2021-05-09 17:34:36	7
284556	DOT	2021-05-05	40.45	34.8	40.76	34.58	1780310.17	68275953.01	2021-05-09 17:34:36	2021-05-09 17:34:36	4
284557	DOT	2021-05-06	41.57	40.45	43.88	38.09	2141074.61	87460507.74	2021-05-09 17:34:36	2021-05-09 17:34:36	4
10809	ATOM	2020-06-28	2.51	2.43	2.559	2.394	302084.53	751844.92	2021-05-09 17:34:36	2021-05-09 17:34:36	3
2743	BTC	2020-10-19	11756.88	11513.33	11821.95	11417.11	39224.67	456404609.75	2021-05-09 17:34:36	2021-05-09 17:34:36	7
296474	SJCX	2021-05-11	0.00227	0.002235	0.00227	0.00227	0	0	2021-05-12 23:35:21	2021-05-12 23:35:21	11
10810	ATOM	2020-06-29	2.642	2.51	2.677	2.47	636600.23	1643598.71	2021-05-09 17:34:36	2021-05-09 17:34:36	3
2368	OCN	2020-10-10	0.0002745	0.0002814	0.0002856	0.0002745	93845843.44	25756.1	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2489	OCN	2021-02-08	0.0006486	0.0004682	0.0007011	0.0005083	223452510.48	144922.78	2021-05-09 17:34:37	2021-05-09 17:34:37	2
133178	OCN	2021-04-27	0.002054	0.002003	0.002241	0.001974	43079310.07	88498.09	2021-05-09 17:34:37	2021-05-09 17:34:37	2
271064	OCN	2021-05-03	0.001887	0.001948	0.002265	0.001853	32683084.21	61681.98	2021-05-09 17:34:37	2021-05-09 17:34:37	2
302050	ANT	2021-05-21	4.191	5.026	4.833	3.903	724730.93	3037139.88	2021-05-22 22:37:38	2021-05-22 22:37:38	14
306896	SJCX	2021-05-31	0.001492	0.001427	0.001492	0.001492	0	0	2021-06-01 23:39:56	2021-06-01 23:39:56	11
302054	EOS	2021-05-21	5.57	6.651	6.913	4.855	20185642.24	116710620.82	2021-05-22 23:37:39	2021-05-22 23:37:39	9
312194	FIL	2021-06-11	70.77	73.36	74.05	69.69	281348.03	20383876.31	2021-06-12 23:42:32	2021-06-12 23:42:32	13
10811	ATOM	2020-06-30	2.596	2.642	2.671	2.562	294435.45	769674.21	2021-05-09 17:34:36	2021-05-09 17:34:36	3
2708	BTC	2020-09-14	10678.31	10332.36	10753.33	10259.62	34032.31	359274837.28	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2709	BTC	2020-09-15	10786.7	10678.31	10936.89	10632.26	34224.45	369481767.48	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2710	BTC	2020-09-16	10957.1	10786.7	11094.7	10670.02	34093.35	372894154.99	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2711	BTC	2020-09-17	10945.14	10957.1	11047.25	10755.99	26980.75	293584349.54	2021-05-09 17:34:36	2021-05-09 17:34:36	7
323916	OCN	2021-07-06	0.00072	0.0007469	0.0008594	0.0006968	68993829.77	49676.61	2021-07-07 22:48:16	2021-07-07 22:48:16	2
10812	ATOM	2020-07-01	2.657	2.596	2.68	2.577	363590	956123.73	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10813	ATOM	2020-07-02	2.656	2.657	2.79	2.607	554182.99	1489940.52	2021-05-09 17:34:36	2021-05-09 17:34:36	3
8981	ANT	2020-06-30	1.381	1.35	1.658	1.286	41956.57	57921.91	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9008	ANT	2020-07-27	1.976	2.241	2.522	1.92	123892.44	244759.67	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9009	ANT	2020-07-28	2.032	1.965	2.034	1.913	93075.79	189112.13	2021-05-09 17:34:37	2021-05-09 17:34:37	14
2713	BTC	2020-09-19	11083.61	10937.89	11173.88	10898.63	17491.35	193207449.76	2021-05-09 17:34:36	2021-05-09 17:34:36	7
9015	ANT	2020-08-03	2.471	2.436	2.521	2.43	31111.51	76861.52	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9016	ANT	2020-08-04	2.501	2.487	2.536	2.34	23388.94	58502.34	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9017	ANT	2020-08-05	2.768	2.506	2.782	2.593	51775.54	143294.39	2021-05-09 17:34:37	2021-05-09 17:34:37	14
317358	FIL	2021-06-22	49.34	46.19	52.01	42.61	1289878.24	61669112.72	2021-06-23 22:45:04	2021-06-23 22:45:04	13
317376	SJCX	2021-06-22	0.001302	0.001266	0.001302	0.001302	0	0	2021-06-23 22:45:04	2021-06-23 22:45:04	11
2714	BTC	2020-09-20	10921.85	11083.61	11083.9	10775.23	21791.13	237773866.86	2021-05-09 17:34:36	2021-05-09 17:34:36	7
329052	ZRX	2021-07-17	0.6275	0.6179	0.6321	0.5991	3813943.59	2350110.99	2021-07-18 23:50:45	2021-07-18 23:50:45	6
2715	BTC	2020-09-21	10418.14	10921.85	10992.25	10319.73	44906.88	473754186.1	2021-05-09 17:34:36	2021-05-09 17:34:36	7
10814	ATOM	2020-07-03	2.684	2.656	2.802	2.641	542005.42	1481921.08	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10848	ATOM	2020-08-06	4.181	4.155	4.249	4.124	484977.33	2032362.9	2021-05-09 17:34:36	2021-05-09 17:34:36	3
2716	BTC	2020-09-22	10534.73	10418.14	10576.92	10365.99	28764.85	301280976.85	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2717	BTC	2020-09-23	10238.09	10534.73	10546.48	10166.62	26680.48	277589382.46	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2718	BTC	2020-09-24	10742.98	10238.09	10792.17	10213.75	29020.54	304956298	2021-05-09 17:34:36	2021-05-09 17:34:36	7
10849	ATOM	2020-08-07	4.016	4.181	4.201	3.902	412241.06	1674349.7	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10850	ATOM	2020-08-08	4.438	4.016	4.447	3.983	489026.89	2064910.18	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10858	ATOM	2020-08-16	6.244	6.077	6.378	5.788	1056780.97	6433968.16	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10860	ATOM	2020-08-18	5.828	5.918	6.165	5.533	724814.81	4224597.39	2021-05-09 17:34:36	2021-05-09 17:34:36	3
2744	BTC	2020-10-20	11921.78	11756.88	12047.73	11688.39	48504.61	576128149.71	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2747	BTC	2020-10-23	12937.2	12990.25	13031.82	12732.62	32269.84	416662855.54	2021-05-09 17:34:36	2021-05-09 17:34:36	7
337748	FIL	2021-08-05	57.86	56.46	58.19	55.02	293418.04	16543684.59	2021-08-06 23:55:08	2021-08-06 23:55:08	13
342928	ZRX	2021-08-16	1.028	1.063	1.112	1.015	8753555.39	9273109.14	2021-08-17 23:57:39	2021-08-17 23:57:39	6
342910	OCN	2021-08-16	0.001102	0.001192	0.001165	0.001102	5835067.64	6428.32	2021-08-17 23:57:40	2021-08-17 23:57:40	2
342946	FIL	2021-08-16	73.31	73.13	75.87	72.36	637399.59	47190137.35	2021-08-17 23:57:40	2021-08-17 23:57:40	13
343360	SJCX	2021-08-17	0.001787	0.001837	0.001787	0.001787	0	0	2021-08-18 23:57:54	2021-08-18 23:57:54	11
343358	BCH	2021-08-17	638.76	673.98	690.33	637.96	75113.49	50111029.16	2021-08-18 23:57:53	2021-08-18 23:57:53	8
348984	OCN	2021-08-29	0.001097	0.001104	0.001097	0.001064	4750304.65	5209.19	2021-08-30 23:00:39	2021-08-30 23:00:39	2
505	DOT	2020-09-07	4.59	4.784	4.825	4.022	1478749.8	6524917.06	2021-05-09 17:34:36	2021-05-09 17:34:36	4
2702	BTC	2020-09-08	10128.54	10379.08	10443.72	9855.68	54770.65	553186747.41	2021-05-09 17:34:36	2021-05-09 17:34:36	7
3363	FIL	2020-06-29	13.13	12.1	13.72	12	190.89	2506.07	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3368	FIL	2020-07-04	22.57	17.86	22.86	16.79	410.02	9255.01	2021-05-07 19:24:30	2021-05-07 19:24:30	13
1858	ZRX	2020-05-19	0.3596	0.3709	0.3713	0.358	9999355.4	3627954.3	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2751	BTC	2020-10-27	13646.02	13069.43	13783.14	13060.64	44978.37	603406480.39	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2752	BTC	2020-10-28	13285.97	13646.02	13855.57	12906.15	32501.89	434942187.78	2021-05-09 17:34:36	2021-05-09 17:34:36	7
1198	SJCX	2020-07-30	0.0004445	0.0004445	0.0004445	0.0004445	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1199	SJCX	2020-07-31	0.0004541	0.0004445	0.0004541	0.0004541	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
43	XTZ	2020-06-03	3.042	2.9	3.066	2.841	2388024.35	7051455.22	2021-05-07 19:24:31	2021-05-07 19:24:31	5
1307	SJCX	2020-11-16	0.0006689	0.0006386	0.0006689	0.0006689	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1506	ETH	2020-06-02	237.81	248.44	238.67	230.19	1514339.16	360122023.75	2021-05-07 19:24:30	2021-05-07 19:24:30	10
292156	XTZ	2021-05-09	7.106	6.986	7.16	6.503	4911686.17	33605331.39	2021-05-10 23:34:54	2021-05-10 23:34:54	5
9085	ANT	2020-10-12	3.718	3.853	3.912	3.687	108979.4	405197.47	2021-05-09 17:34:37	2021-05-09 17:34:37	14
3420	FIL	2020-08-25	32.75	32.33	35.12	31.16	722.49	23658.17	2021-05-07 19:24:30	2021-05-07 19:24:30	13
1507	ETH	2020-06-03	244.65	237.81	245.13	239.52	642061.77	157079114.17	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1889	ZRX	2020-06-19	0.3315	0.3311	0.3424	0.3245	4731403.13	1580658.32	2021-05-09 17:34:36	2021-05-09 17:34:36	6
9086	ANT	2020-10-13	3.617	3.718	3.701	3.552	120959.7	437479.46	2021-05-09 17:34:37	2021-05-09 17:34:37	14
64	XTZ	2020-06-24	2.621	2.781	2.857	2.581	4755672.99	12860645.08	2021-05-07 19:24:31	2021-05-07 19:24:31	5
1334	SJCX	2020-12-13	0.0007668	0.0007526	0.0007668	0.0007668	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
9157	ANT	2020-12-23	2.652	2.923	2.907	2.612	299190.97	793342.84	2021-05-09 17:34:37	2021-05-09 17:34:37	14
1335	SJCX	2020-12-14	0.000771	0.0007668	0.000771	0.000771	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
65	XTZ	2020-06-25	2.572	2.621	2.646	2.523	3249379.06	8412090.66	2021-05-07 19:24:31	2021-05-07 19:24:31	5
1338	SJCX	2020-12-17	0.0009129	0.0008541	0.0009129	0.0009129	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
2753	BTC	2020-10-29	13462.18	13285.97	13643.6	12985.56	41497.54	555737562.11	2021-05-09 17:34:36	2021-05-09 17:34:36	7
9163	ANT	2020-12-29	2.982	2.977	3.133	2.949	185812.61	554153.6	2021-05-09 17:34:37	2021-05-09 17:34:37	14
4693	EOS	2021-02-16	4.649	4.709	4.969	4.413	15809287.3	74093937.58	2021-05-09 17:34:36	2021-05-09 17:34:36	9
66	XTZ	2020-06-26	2.481	2.572	2.579	2.441	3940522.24	9862907.99	2021-05-07 19:24:31	2021-05-07 19:24:31	5
1455	SJCX	2021-04-13	0.002542	0.002394	0.002542	0.002542	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
9177	ANT	2021-01-12	3.165	3.352	3.268	3.068	383283.09	1212978.5	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9185	ANT	2021-01-20	4.008	3.996	4.161	3.831	367046.04	1471159.36	2021-05-09 17:34:37	2021-05-09 17:34:37	14
2754	BTC	2020-10-30	13565.95	13462.18	13674.89	13132.53	56364.21	756044940.71	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2755	BTC	2020-10-31	13803.41	13565.95	14077.8	13432.24	43579.77	600104833.89	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2756	BTC	2020-11-01	13761.72	13803.41	13897.02	13630.22	20841.63	286724152.06	2021-05-09 17:34:36	2021-05-09 17:34:36	7
4694	EOS	2021-02-17	4.842	4.649	4.888	4.434	10705840.68	50563352.93	2021-05-09 17:34:36	2021-05-09 17:34:36	9
67	XTZ	2020-06-27	2.315	2.481	2.493	2.267	3921064.35	9323350.85	2021-05-07 19:24:31	2021-05-07 19:24:31	5
75	XTZ	2020-07-05	2.29	2.326	2.332	2.219	2351529.93	5338060.03	2021-05-07 19:24:31	2021-05-07 19:24:31	5
76	XTZ	2020-07-06	2.439	2.29	2.477	2.268	3802181.26	9040436.62	2021-05-07 19:24:31	2021-05-07 19:24:31	5
1859	ZRX	2020-05-20	0.3597	0.3596	0.3849	0.3511	13656010.6	5009246.91	2021-05-09 17:34:36	2021-05-09 17:34:36	6
292130	BCH	2021-05-09	1429.77	1400.28	1431.46	1284.72	124161.49	168541976.91	2021-05-10 23:34:59	2021-05-10 23:34:59	8
1860	ZRX	2020-05-21	0.324	0.3597	0.3666	0.3066	24109783.59	8047031.68	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2759	BTC	2020-11-04	14157.73	14023.78	14258.9	13539.13	30406.02	423118194.37	2021-05-09 17:34:36	2021-05-09 17:34:36	7
1861	ZRX	2020-05-22	0.3339	0.324	0.3491	0.3195	23337993.48	7723157.19	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1862	ZRX	2020-05-23	0.3267	0.3339	0.34	0.324	7217328.45	2389465.32	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1508	ETH	2020-06-04	243.35	244.56	246.39	236.28	372652.43	90413005.89	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1509	ETH	2020-06-05	240.08	243.35	247.73	239.25	307295.41	74553973.27	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1950	ZRX	2020-08-19	0.5146	0.5664	0.5934	0.4985	16207818.77	8625494.07	2021-05-09 17:34:36	2021-05-09 17:34:36	6
296476	XTZ	2021-05-11	7.134	6.199	7.248	5.926	10687073.07	70661688.89	2021-05-12 23:35:21	2021-05-12 23:35:21	5
302072	ATOM	2021-05-21	13.57	16.91	17.56	11.47	4401247.95	62289505.37	2021-05-22 23:37:39	2021-05-22 23:37:39	3
1510	ETH	2020-06-06	242.08	240.08	244.48	238.02	191703.01	46231144.22	2021-05-07 19:24:30	2021-05-07 19:24:30	10
306898	ZRX	2021-05-31	1.02	0.9385	1.022	0.8883	8697900.87	8351813.53	2021-06-01 22:39:56	2021-06-01 22:39:56	6
1511	ETH	2020-06-07	244.75	242.08	245.34	234.97	350970.89	84241162.44	2021-05-07 19:24:30	2021-05-07 19:24:30	10
10930	ATOM	2020-10-27	5.151	5.151	5.327	5.074	238094.98	1239764.96	2021-05-09 17:34:36	2021-05-09 17:34:36	3
312198	ANT	2021-06-11	10.28	4.31	23.31	4.275	2963911.06	30457038.89	2021-06-12 23:42:32	2021-06-12 23:42:32	14
11050	ATOM	2021-02-24	19.56	20.27	21.37	18.84	2646722.91	53386190.09	2021-05-09 17:34:36	2021-05-09 17:34:36	3
317360	ATOM	2021-06-22	9.006	9.53	10.57	7.855	2957236.01	27023965.03	2021-06-23 23:45:04	2021-06-23 23:45:04	3
1512	ETH	2020-06-08	246.47	244.75	247.67	241.15	268906.97	65548033.56	2021-05-07 19:24:30	2021-05-07 19:24:30	10
11051	ATOM	2021-02-25	17.8	19.56	20.61	17.58	2006749.64	38425833.7	2021-05-09 17:34:36	2021-05-09 17:34:36	3
11052	ATOM	2021-02-26	18.87	17.8	18.99	16.12	2958100.86	52067341.67	2021-05-09 17:34:36	2021-05-09 17:34:36	3
77	XTZ	2020-07-07	2.509	2.439	2.592	2.403	5901413.47	14720044.91	2021-05-07 19:24:31	2021-05-07 19:24:31	5
11053	ATOM	2021-02-27	19.18	18.87	20.95	18.62	2364589.36	46462373.4	2021-05-09 17:34:36	2021-05-09 17:34:36	3
11054	ATOM	2021-02-28	17.67	19.18	19.23	16.52	1941907.47	34278120.44	2021-05-09 17:34:36	2021-05-09 17:34:36	3
285654	ZRX	2021-05-05	1.882	1.681	1.894	1.662	14597678.84	26361749.26	2021-05-09 17:34:36	2021-05-09 17:34:36	6
323918	ETH	2021-07-06	2322.63	2196.71	2349.66	2194.97	371318.48	852673341.75	2021-07-07 23:48:16	2021-07-07 23:48:16	10
329054	ETH	2021-07-17	1899.96	1877.05	1918.93	1849.84	279072.61	526262391.22	2021-07-18 23:50:45	2021-07-18 23:50:45	10
337714	ZRX	2021-08-05	0.8883	0.869	0.9204	0.8395	12940568.95	11444460.5	2021-08-06 23:55:07	2021-08-06 23:55:07	6
342896	EOS	2021-08-16	5.52	5.701	5.927	5.451	8253662.08	47331742.02	2021-08-17 23:57:39	2021-08-17 23:57:39	9
1349	SJCX	2020-12-28	0.001082	0.00105	0.001082	0.001082	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
8971	ANT	2020-06-20	1.239	1.26	1.285	1.204	17600.47	21809.72	2021-05-09 17:34:37	2021-05-09 17:34:37	14
2571	BTC	2020-04-30	8637.56	8784.96	9460.77	8416.64	161267.28	1439132256.65	2021-04-30 16:52:27	2021-04-30 16:52:27	7
1350	SJCX	2020-12-29	0.001094	0.001082	0.001094	0.001094	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
10791	ATOM	2020-06-10	3.114	3.121	3.143	3.029	297995.34	918473.16	2021-05-09 17:34:36	2021-05-09 17:34:36	3
3160	BCH	2020-12-09	268.97	267.71	271.76	266.93	187381.4	50400694.7	2021-05-09 17:34:36	2021-05-09 17:34:36	8
10803	ATOM	2020-06-22	2.689	2.597	2.719	2.593	274190.21	731922.87	2021-05-09 17:34:36	2021-05-09 17:34:36	3
2568	BTC	2020-04-27	7787.41	7701.35	7790.33	7639.98	48551.15	374439201.77	2021-04-27 14:21:33	2021-04-27 14:21:33	7
2569	BTC	2020-04-28	7760.32	7787.41	7791.85	7671.26	38507.32	297442241.62	2021-04-27 14:21:33	2021-04-27 14:21:33	7
2570	BTC	2020-04-29	8784.96	7760.32	8952.44	7733.02	157978.19	1324299206.24	2021-04-27 14:21:33	2021-04-27 14:21:33	7
1351	SJCX	2020-12-30	0.001156	0.001094	0.001156	0.001156	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
296478	OCN	2021-05-11	0.001588	0.001619	0.001797	0.001546	54282049.53	86180.77	2021-05-12 22:35:21	2021-05-12 22:35:21	2
2575	BTC	2020-05-04	8881.65	8907.19	8968.9	8537.49	64835.52	568639005.2	2021-05-04 22:03:21	2021-05-04 22:03:21	7
2567	BTC	2020-04-26	7701.35	7546.92	7705.3	7497.88	33092.14	251857766.26	2021-04-26 23:28:51	2021-04-26 23:28:51	7
8972	ANT	2020-06-21	1.282	1.239	1.3	1.215	8815.87	11305.54	2021-05-09 17:34:37	2021-05-09 17:34:37	14
8973	ANT	2020-06-22	1.289	1.282	1.362	1.289	11651.77	15018.95	2021-05-09 17:34:37	2021-05-09 17:34:37	14
1352	SJCX	2020-12-31	0.001159	0.001156	0.001159	0.001159	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
10804	ATOM	2020-06-23	2.772	2.689	2.836	2.648	629862.83	1742448.39	2021-05-09 17:34:36	2021-05-09 17:34:36	3
2270	OCN	2020-07-04	0.0003073	0.0002994	0.0003096	0.0003004	8994421.77	2764.13	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2574	BTC	2020-05-03	8907.19	8981.11	9197.48	8735.78	59476.78	534161419.79	2021-05-03 03:13:20	2021-05-03 03:13:20	7
1513	ETH	2020-06-09	244	246.47	249.85	235.78	311413.28	75833901.79	2021-05-07 19:24:30	2021-05-07 19:24:30	10
8974	ANT	2020-06-23	1.326	1.289	1.488	1.28	29032.54	38503.78	2021-05-09 17:34:37	2021-05-09 17:34:37	14
270502	OCN	2021-05-02	0.001948	0.001975	0.002066	0.001889	32152205.68	62642.36	2021-05-09 17:34:37	2021-05-09 17:34:37	2
292132	SJCX	2021-05-09	0.002332	0.002358	0.002332	0.002332	0	0	2021-05-10 23:34:57	2021-05-10 23:34:57	11
286020	OCN	2021-05-05	0.001729	0.001783	0.002047	0.001729	28738105.98	49692.25	2021-05-09 17:34:37	2021-05-09 17:34:37	2
302544	OCN	2021-05-22	0.0008729	0.0005602	0.001011	0.0005053	152638249.83	133233.56	2021-05-23 20:37:51	2021-05-23 20:37:51	2
9018	ANT	2020-08-06	2.753	2.768	3.036	2.723	160478.5	441845.46	2021-05-09 17:34:37	2021-05-09 17:34:37	14
286021	OCN	2021-05-06	0.001781	0.001729	0.001816	0.001676	18898824.2	33654.79	2021-05-09 17:34:37	2021-05-09 17:34:37	2
286022	OCN	2021-05-07	0.001951	0.001781	0.002021	0.001742	28941821.38	56466	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2566	BTC	2020-04-25	7546.92	7509.44	7708.4	7445.98	30165.48	227962632.37	2021-04-24 20:28:41	2021-04-24 20:28:41	7
1515	ETH	2020-06-11	230.21	248.01	250.31	225.86	684189.54	163068331.34	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1516	ETH	2020-06-12	237.54	230.21	239.28	228.19	381138.07	89734985.04	2021-05-07 19:24:30	2021-05-07 19:24:30	10
9019	ANT	2020-08-07	3.109	2.76	3.109	2.755	89393.49	254437.41	2021-05-09 17:34:37	2021-05-09 17:34:37	14
3236	BCH	2021-02-23	516.53	629.63	633.41	439.6	438338.3	224958569.16	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3252	BCH	2021-03-11	549.77	546.97	594.86	547.63	264615.87	145477202.43	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3275	BCH	2021-04-03	531.08	580.97	573.03	527.32	232180.43	123306985.47	2021-05-09 17:34:36	2021-05-09 17:34:36	8
146364	BCH	2021-04-29	880.77	910.85	915.12	859.4	89965.9	79643867.03	2021-05-09 17:34:36	2021-05-09 17:34:36	8
2757	BTC	2020-11-02	13571.24	13761.72	13828.48	13221.65	33465.17	453096297.52	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2760	BTC	2020-11-05	15599.92	14157.73	15739.47	14114.37	42121.25	625288741.44	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2761	BTC	2020-11-06	15590.62	15599.92	15948.88	15219.57	34543.56	538014394.46	2021-05-09 17:34:36	2021-05-09 17:34:36	7
1517	ETH	2020-06-13	238.21	237.54	238.71	234.61	158809.72	37591086.28	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1518	ETH	2020-06-14	231.61	238.21	238.57	229.98	302824.94	70815323.17	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1519	ETH	2020-06-15	230.98	231.61	233.75	218.29	677321.32	153345723.13	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1520	ETH	2020-06-16	235.35	230.98	236	228.88	293247.62	68381514.54	2021-05-07 19:24:30	2021-05-07 19:24:30	10
271088	BCH	2021-05-03	1015.58	973.8	1048.8	972.94	128352.87	130069735.51	2021-05-09 17:34:36	2021-05-09 17:34:36	8
306924	FIL	2021-05-31	72.6	68.37	72.9	66.39	626417.59	43566124.88	2021-06-01 23:39:56	2021-06-01 23:39:56	13
2023	ZRX	2020-10-31	0.3222	0.3257	0.3357	0.3214	1713964.15	564283.34	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2025	ZRX	2020-11-02	0.329	0.3381	0.354	0.329	2507603.64	862650.77	2021-05-09 17:34:36	2021-05-09 17:34:36	6
67492	ZRX	2021-04-24	1.328	1.475	1.475	1.315	10573279.7	14597480.6	2021-05-09 17:34:36	2021-05-09 17:34:36	6
285288	BCH	2021-05-05	1455.03	951.33	1482.44	941.04	515116.82	642948145.95	2021-05-09 17:34:36	2021-05-09 17:34:36	8
306920	EOS	2021-05-31	6.635	6.03	6.678	5.746	3958765.53	24380896.96	2021-06-01 22:39:56	2021-06-01 22:39:56	9
2762	BTC	2020-11-07	14838.16	15590.62	15765.02	14427.34	25695.27	388303730.2	2021-05-09 17:34:36	2021-05-09 17:34:36	7
10805	ATOM	2020-06-24	2.677	2.772	2.877	2.635	443296.45	1220412.52	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10806	ATOM	2020-06-25	2.622	2.677	2.687	2.549	297901.75	785076.22	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10896	ATOM	2020-09-23	3.841	4.204	4.297	3.806	664326.34	2698196.8	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10931	ATOM	2020-10-28	4.815	5.151	5.151	4.729	270662.29	1320652.77	2021-05-09 17:34:36	2021-05-09 17:34:36	3
2763	BTC	2020-11-08	15488.25	14838.16	15653.89	14739.11	18706.65	285202500.11	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2764	BTC	2020-11-09	15335.03	15488.25	15812.23	14833.13	32088.79	492570531.42	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2765	BTC	2020-11-10	15313.73	15335.03	15476.99	15099.11	23031.66	352628988.82	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2766	BTC	2020-11-11	15707.08	15313.73	15983.03	15288.76	45852.83	717920492.19	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2768	BTC	2020-11-13	16332.85	16306.53	16482.62	15975.8	42676.28	694320640.17	2021-05-09 17:34:36	2021-05-09 17:34:36	7
306900	ATOM	2021-05-31	13.94	12.56	13.96	11.93	1097186.01	14459161.62	2021-06-01 23:39:56	2021-06-01 23:39:56	3
10936	ATOM	2020-11-02	4.618	4.748	4.876	4.568	473885.72	2231942.18	2021-05-09 17:34:36	2021-05-09 17:34:36	3
312200	OCN	2021-06-11	0.0008243	0.0008156	0.0008478	0.0007536	50922550.22	41974.52	2021-06-12 23:42:31	2021-06-12 23:42:31	2
317374	BCH	2021-06-22	443.99	456.21	477.46	388.07	180519.8	77812529.03	2021-06-23 23:45:04	2021-06-23 23:45:04	8
323922	DOT	2021-07-06	16.13	15.24	16.18	15.2	1097059.31	17211872.96	2021-07-07 22:48:16	2021-07-07 22:48:16	4
421	DOT	2020-06-15	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
2001	ZRX	2020-10-09	0.3897	0.3677	0.3946	0.3618	3724260.25	1423524.19	2021-05-09 17:34:36	2021-05-09 17:34:36	6
9021	ANT	2020-08-09	3.31	3.12	3.465	3.057	83743.37	277154.67	2021-05-09 17:34:37	2021-05-09 17:34:37	14
296480	FIL	2021-05-11	143.24	135.64	143.51	134.02	340339.6	46998334.41	2021-05-12 23:35:22	2021-05-12 23:35:22	13
2010	ZRX	2020-10-18	0.3891	0.3844	0.3971	0.3835	1207461.2	471494.71	2021-05-09 17:34:36	2021-05-09 17:34:36	6
3064	BCH	2020-09-04	230.6	214.48	237.61	219.08	269993.47	62259219.79	2021-05-09 17:34:36	2021-05-09 17:34:36	8
2011	ZRX	2020-10-19	0.3894	0.3891	0.3999	0.3829	1507226.51	592057.21	2021-05-09 17:34:36	2021-05-09 17:34:36	6
302546	BCH	2021-05-22	630.26	688.96	722.05	600.77	240517.23	158669286.79	2021-05-23 23:37:52	2021-05-23 23:37:52	8
78	XTZ	2020-07-08	2.655	2.509	2.695	2.483	5382729.72	14086298.71	2021-05-07 19:24:31	2021-05-07 19:24:31	5
9025	ANT	2020-08-13	6.723	4.999	10.89	4.564	480590.37	3231021.26	2021-05-09 17:34:37	2021-05-09 17:34:37	14
81	XTZ	2020-07-11	2.686	2.542	2.732	2.513	4887343.49	12942057.37	2021-05-07 19:24:31	2021-05-07 19:24:31	5
306912	OCN	2021-05-31	0.0008122	0.0008115	0.0009476	0.0008122	109604702.6	89022.47	2021-06-01 23:39:56	2021-06-01 23:39:56	2
285289	BCH	2021-05-06	1509.12	1455.03	1606.36	1272.32	483812.75	691960694.14	2021-05-09 17:34:36	2021-05-09 17:34:36	8
285290	BCH	2021-05-07	1342.36	1509.12	1510.71	1273.79	246641.03	342631598.63	2021-05-09 17:34:36	2021-05-09 17:34:36	8
2012	ZRX	2020-10-20	0.3643	0.3894	0.3901	0.3553	5442007.66	2014466.54	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1180	SJCX	2020-07-12	0.000372	0.0003695	0.000372	0.000372	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
82	XTZ	2020-07-12	2.819	2.686	2.838	2.582	6078434.58	16483139.59	2021-05-07 19:24:31	2021-05-07 19:24:31	5
1181	SJCX	2020-07-13	0.0003695	0.000372	0.0003695	0.0003695	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1267	SJCX	2020-10-07	0.0004269	0.0004242	0.0004269	0.0004269	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1268	SJCX	2020-10-08	0.0004372	0.0004269	0.0004372	0.0004372	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1339	SJCX	2020-12-18	0.0009254	0.0009129	0.0009254	0.0009254	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
3478	FIL	2020-10-22	23.82	26.7	27.07	22.45	304596.38	7256740.25	2021-05-07 19:24:30	2021-05-07 19:24:30	13
1353	SJCX	2021-01-01	0.001176	0.001159	0.001176	0.001176	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
4428	EOS	2020-05-27	2.569	2.504	2.577	2.501	2044985.88	5153435.83	2021-05-09 17:34:36	2021-05-09 17:34:36	9
3479	FIL	2020-10-23	24.04	23.82	25.72	20.87	412216.52	9908579.41	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3480	FIL	2020-10-24	25.9	24.04	26.82	22.62	421283.46	10910337.75	2021-05-07 19:24:30	2021-05-07 19:24:30	13
4651	EOS	2021-01-05	2.894	2.822	2.957	2.714	6260631.78	17787581.31	2021-05-09 17:34:36	2021-05-09 17:34:36	9
69	XTZ	2020-06-29	2.411	2.373	2.445	2.347	1732297.43	4141613.06	2021-05-07 19:24:31	2021-05-07 19:24:31	5
4652	EOS	2021-01-06	3.376	2.894	3.461	2.853	18587525.19	59407219.82	2021-05-09 17:34:36	2021-05-09 17:34:36	9
2769	BTC	2020-11-14	16075.95	16332.85	16334.29	15720.61	28331.05	452657737.75	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2770	BTC	2020-11-15	15964.7	16075.95	16156.82	15796.03	17966.53	286912254.78	2021-05-09 17:34:36	2021-05-09 17:34:36	7
4653	EOS	2021-01-07	3.196	3.376	3.454	3.054	15601755.22	51133523.02	2021-05-09 17:34:36	2021-05-09 17:34:36	9
70	XTZ	2020-06-30	2.358	2.411	2.416	2.354	1378258.97	3280798.35	2021-05-07 19:24:31	2021-05-07 19:24:31	5
4654	EOS	2021-01-08	3.114	3.196	3.255	2.891	10336578.05	31822540.07	2021-05-09 17:34:36	2021-05-09 17:34:36	9
1354	SJCX	2021-01-02	0.001288	0.001176	0.001288	0.001288	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
2013	ZRX	2020-10-21	0.375	0.3643	0.3865	0.3634	3336641.78	1258182.18	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2771	BTC	2020-11-16	16721.46	15964.7	16876.48	15877.77	41641.22	685608661.41	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2772	BTC	2020-11-17	17681.54	16721.46	17857.37	16563.5	62123.13	1072294334.69	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2067	ZRX	2020-12-14	0.3867	0.3957	0.3987	0.3823	2751181.82	1068507.75	2021-05-09 17:34:36	2021-05-09 17:34:36	6
71	XTZ	2020-07-01	2.4	2.358	2.455	2.335	1932584.12	4643722	2021-05-07 19:24:31	2021-05-07 19:24:31	5
2773	BTC	2020-11-18	17786.27	17681.54	18466.1	17260.91	80691.42	1441862086	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2776	BTC	2020-11-21	18704.06	18672.78	18966.12	18359.06	37702.81	705040526.65	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2777	BTC	2020-11-22	18430.59	18704.06	18757.55	17635.18	43464.62	796767991.89	2021-05-09 17:34:36	2021-05-09 17:34:36	7
1355	SJCX	2021-01-03	0.001323	0.001288	0.001323	0.001323	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
72	XTZ	2020-07-02	2.334	2.4	2.406	2.281	2694365.38	6343626.07	2021-05-07 19:24:31	2021-05-07 19:24:31	5
1356	SJCX	2021-01-04	0.001281	0.001323	0.001281	0.001281	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
9031	ANT	2020-08-19	5.247	5.758	5.806	5.082	575432.2	3019567.29	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9032	ANT	2020-08-20	5.36	5.247	5.531	5.047	540559.23	2897342.16	2021-05-09 17:34:37	2021-05-09 17:34:37	14
73	XTZ	2020-07-03	2.273	2.334	2.346	2.264	3463396.03	7963301.26	2021-05-07 19:24:31	2021-05-07 19:24:31	5
74	XTZ	2020-07-04	2.326	2.273	2.355	2.268	2053013.83	4750119.59	2021-05-07 19:24:31	2021-05-07 19:24:31	5
9065	ANT	2020-09-22	3.28	3.238	3.306	2.971	73152.91	234969.43	2021-05-09 17:34:37	2021-05-09 17:34:37	14
83	XTZ	2020-07-13	2.906	2.819	3.162	2.741	18794447.3	55570507.34	2021-05-07 19:24:31	2021-05-07 19:24:31	5
9066	ANT	2020-09-23	3.099	3.28	3.312	3.039	54943.82	173917.15	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9067	ANT	2020-09-24	3.35	3.111	3.402	3.18	231606.63	775803.73	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9078	ANT	2020-10-05	3.558	3.536	3.627	3.519	36977.55	131568.65	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9082	ANT	2020-10-09	3.665	3.415	3.68	3.382	117193.95	429501.73	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9083	ANT	2020-10-10	3.663	3.665	3.812	3.645	128437.46	470445.72	2021-05-09 17:34:37	2021-05-09 17:34:37	14
312624	BTC	2021-06-12	35541.78	37339.98	37445.32	34655.21	40619.14	1450138289.51	2021-06-13 23:42:45	2021-06-13 23:42:45	7
313098	ANT	2021-06-13	4.986	6.028	7.101	4.69	1057302.14	5272152.42	2021-06-14 19:42:58	2021-06-14 19:42:58	14
9084	ANT	2020-10-11	3.853	3.663	3.867	3.556	119482.21	460351.24	2021-05-09 17:34:37	2021-05-09 17:34:37	14
317380	EOS	2021-06-22	3.388	3.533	3.765	3.051	14421820.11	48592954.61	2021-06-23 23:45:04	2021-06-23 23:45:04	9
323924	ATOM	2021-07-06	13.13	13.56	14.04	12.83	1040624.11	13875222.2	2021-07-07 23:48:16	2021-07-07 23:48:16	3
329058	EOS	2021-07-17	3.658	3.653	3.778	3.587	2532455.97	9291357.14	2021-07-18 23:50:45	2021-07-18 23:50:45	9
9118	ANT	2020-11-14	3.289	3.49	3.479	3.239	175240.36	576389.97	2021-05-09 17:34:37	2021-05-09 17:34:37	14
329094	SJCX	2021-07-17	0.001262	0.001256	0.001262	0.001262	0	0	2021-07-18 22:50:45	2021-07-18 22:50:45	11
337710	DOT	2021-08-05	19.13	19.15	19.44	17.88	3022073.96	57151121.17	2021-08-06 23:55:07	2021-08-06 23:55:07	4
342912	ANT	2021-08-16	5.012	5.073	5.257	4.971	79099.25	406667.26	2021-08-17 23:57:40	2021-08-17 23:57:40	14
1114	SJCX	2020-05-07	0.0004	0.0003661	0.0004	0.0004	0	0	2021-05-07 19:24:30	2021-05-07 19:24:30	11
3436	FIL	2020-09-10	34	31.91	34	32.01	30.2	1026.68	2021-05-07 19:24:30	2021-05-07 19:24:30	13
8921	ANT	2020-05-01	1.007	0.9959	1.023	0.9173	18318.59	18438.02	2021-05-01 22:04:06	2021-05-01 22:04:06	14
2962	BCH	2020-05-25	230.64	222.93	234.55	227.17	193119.51	44540571.4	2021-05-09 17:34:36	2021-05-09 17:34:36	8
1116	SJCX	2020-05-09	0.0003816	0.0003923	0.0003816	0.0003816	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1117	SJCX	2020-05-10	0.0003494	0.0003816	0.0003494	0.0003494	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1118	SJCX	2020-05-11	0.0003428	0.0003494	0.0003428	0.0003428	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1115	SJCX	2020-05-08	0.0003923	0.0004	0.0003923	0.0003923	0	0	2021-05-07 19:24:30	2021-05-07 19:24:30	11
11100	ATOM	2021-04-15	27.83	27.07	28.38	25.97	2538582.49	68823616.53	2021-05-09 17:34:36	2021-05-09 17:34:36	3
8922	ANT	2020-05-02	0.9996	1.007	1.162	0.9529	12969.62	12964.4	2021-05-01 22:04:06	2021-05-01 22:04:06	14
1100	SJCX	2020-04-23	0.0004494	0.0004281	0.0004494	0.0004494	0	0	2021-04-23 22:44:41	2021-04-23 22:44:41	11
2723	BTC	2020-09-29	10841.29	10699	10863.02	10641.03	31167.43	334584439.48	2021-05-09 17:34:36	2021-05-09 17:34:36	7
8924	ANT	2020-05-04	0.9193	0.954	0.9708	0.8835	35399.82	32541.31	2021-05-04 22:03:21	2021-05-04 22:03:21	14
1119	SJCX	2020-05-12	0.0003528	0.0003428	0.0003528	0.0003528	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1373	SJCX	2021-01-21	0.001234	0.00142	0.001234	0.001234	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1386	SJCX	2021-02-03	0.001507	0.001421	0.001507	0.001507	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
8925	ANT	2020-05-05	0.9274	0.9193	0.959	0.8832	6439.22	5971.44	2021-05-04 22:03:21	2021-05-04 22:03:21	14
3437	FIL	2020-09-11	33.47	34	34.27	31.72	47.48	1589.29	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3438	FIL	2020-09-12	36.15	33.47	37.17	33.63	60.2	2176.23	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3439	FIL	2020-09-13	37.32	36.15	37.58	35.57	37.76	1409.22	2021-05-07 19:24:30	2021-05-07 19:24:30	13
1863	ZRX	2020-05-24	0.3017	0.3267	0.3352	0.3016	9140286.44	2913261.93	2021-05-09 17:34:36	2021-05-09 17:34:36	6
296482	ETH	2021-05-11	4178.02	3949.77	4182.26	3770.53	790117.42	3146654572.85	2021-05-12 23:35:21	2021-05-12 23:35:21	10
2963	BCH	2020-05-26	228.1	230.64	229.43	225.27	139266.07	31766542.52	2021-05-09 17:34:36	2021-05-09 17:34:36	8
2422	OCN	2020-12-03	0.0002836	0.0002812	0.0003206	0.0002774	195457145.94	55434.19	2021-05-09 17:34:37	2021-05-09 17:34:37	2
9119	ANT	2020-11-15	3.22	3.289	3.343	3.163	165389.07	532566.03	2021-05-09 17:34:37	2021-05-09 17:34:37	14
2964	BCH	2020-05-27	232.97	228.1	237.76	232.6	143934.97	33532376.27	2021-05-09 17:34:36	2021-05-09 17:34:36	8
2779	BTC	2020-11-24	19157.16	18385.74	19419.49	18117.78	74142.3	1403472685.29	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2780	BTC	2020-11-25	18725.76	19157.16	19488.81	18519.89	59989.48	1141495120.46	2021-05-09 17:34:36	2021-05-09 17:34:36	7
8942	ANT	2020-05-22	1.057	0.9838	1.115	0.9831	34278.5	36245.62	2021-05-09 17:34:37	2021-05-09 17:34:37	14
8982	ANT	2020-07-01	1.353	1.381	1.459	1.32	33267.19	45027.05	2021-05-09 17:34:37	2021-05-09 17:34:37	14
307364	XTZ	2021-06-01	3.668	3.604	3.697	3.439	5510674.98	19675719.12	2021-06-02 23:40:10	2021-06-02 23:40:10	5
11101	ATOM	2021-04-16	25.52	27.83	28.16	24.13	2532229.17	65376473.66	2021-05-09 17:34:36	2021-05-09 17:34:36	3
11102	ATOM	2021-04-17	24.4	25.52	27.49	24.33	1452023.94	37571892.79	2021-05-09 17:34:36	2021-05-09 17:34:36	3
7687	ATOM	2021-04-21	19.62	21.3	21.53	19.4	2245310.46	45962547.97	2021-05-09 17:34:36	2021-05-09 17:34:36	3
2781	BTC	2020-11-26	17175.86	18725.76	18907.31	16270.37	129609.34	2220672632.83	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2965	BCH	2020-05-28	240.07	232.97	242.56	236.43	189205.75	45422157.56	2021-05-09 17:34:36	2021-05-09 17:34:36	8
8926	ANT	2020-05-06	1.019	0.9274	1.055	0.9077	34227.92	34869.73	2021-05-04 22:03:21	2021-05-04 22:03:21	14
2782	BTC	2020-11-27	17155	17175.86	17479.12	16462.87	61052.47	1034426524.1	2021-05-09 17:34:36	2021-05-09 17:34:36	7
302548	DOT	2021-05-22	22.08	24.46	24.63	20.42	2288458.22	51282835.48	2021-05-23 23:37:52	2021-05-23 23:37:52	4
128	XTZ	2020-08-27	3.224	3.37	3.418	3.108	6508584.64	21168141.97	2021-05-07 19:24:31	2021-05-07 19:24:31	5
2974	BCH	2020-06-06	253.3	256.04	258.81	252.62	94930.97	24045591.06	2021-05-09 17:34:36	2021-05-09 17:34:36	8
2975	BCH	2020-06-07	253.62	253.3	258.1	251.37	111091.82	28174630.47	2021-05-09 17:34:36	2021-05-09 17:34:36	8
313088	XTZ	2021-06-13	3.306	3.14	3.322	3.005	2829445.01	8915901.66	2021-06-14 23:43:00	2021-06-14 23:43:00	5
129	XTZ	2020-08-28	3.264	3.224	3.314	3.139	3032534.93	9872642.65	2021-05-07 19:24:31	2021-05-07 19:24:31	5
130	XTZ	2020-08-29	3.354	3.264	3.437	3.217	2730636.56	9085926.63	2021-05-07 19:24:31	2021-05-07 19:24:31	5
2976	BCH	2020-06-08	255.42	253.62	257.48	253.86	70846.5	18095837.17	2021-05-09 17:34:36	2021-05-09 17:34:36	8
146918	ATOM	2021-04-30	22.74	22.22	23.46	21.75	1282733.42	29288000.55	2021-05-09 17:34:36	2021-05-09 17:34:36	3
9089	ANT	2020-10-16	3.21	3.298	3.413	3.18	217259.79	697373.35	2021-05-09 17:34:37	2021-05-09 17:34:37	14
180	XTZ	2020-10-18	2.229	2.189	2.242	2.184	823028.55	1824364.39	2021-05-07 19:24:31	2021-05-07 19:24:31	5
181	XTZ	2020-10-19	2.19	2.229	2.248	2.179	1683626.97	3718279.91	2021-05-07 19:24:31	2021-05-07 19:24:31	5
9090	ANT	2020-10-17	3.24	3.21	3.283	3.175	67440.16	218491.3	2021-05-09 17:34:37	2021-05-09 17:34:37	14
265	XTZ	2021-01-11	2.332	2.766	2.769	2.069	17158154.95	40204809.46	2021-05-07 19:24:31	2021-05-07 19:24:31	5
2783	BTC	2020-11-28	17739.9	17155	17893.95	16895	34697.03	605284901.68	2021-05-09 17:34:36	2021-05-09 17:34:36	7
1392	SJCX	2021-02-09	0.00186	0.001857	0.00186	0.00186	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
10869	ATOM	2020-08-27	7.29	7.715	7.913	6.9	1079134.63	7901567.9	2021-05-09 17:34:36	2021-05-09 17:34:36	3
1393	SJCX	2021-02-10	0.001794	0.00186	0.001794	0.001794	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
312626	ZRX	2021-06-12	0.852	0.8637	0.8909	0.8041	6160417.64	5216234.36	2021-06-13 23:42:46	2021-06-13 23:42:46	6
9166	ANT	2021-01-01	3.227	3.051	3.289	3.062	287439.58	927540.39	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9167	ANT	2021-01-02	3.11	3.227	3.559	2.962	387712.37	1205623.98	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9168	ANT	2021-01-03	3.065	3.11	3.225	2.958	409540.14	1255369.63	2021-05-09 17:34:37	2021-05-09 17:34:37	14
1101	SJCX	2020-04-24	0.0006008	0.0004494	0.007509	0.0004506	305	0.1832	2021-04-24 20:28:41	2021-04-24 20:28:41	11
9183	ANT	2021-01-18	4.384	4.899	5.127	4.311	1303722.57	5715230.17	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9241	ANT	2021-03-17	6.863	6.865	7.275	6.751	1033679.31	7094036.19	2021-05-09 17:34:37	2021-05-09 17:34:37	14
317822	ATOM	2021-06-23	9.606	9.006	10.49	8.589	1635844.76	16023624.4	2021-06-24 23:45:18	2021-06-24 23:45:18	3
323926	FIL	2021-07-06	56.98	56.09	58.3	56.01	203235.18	11555788.41	2021-07-07 23:48:16	2021-07-07 23:48:16	13
329096	OCN	2021-07-17	0.000874	0.0009385	0.001197	0.000874	65723837.71	57441.42	2021-07-18 23:50:45	2021-07-18 23:50:45	2
329056	FIL	2021-07-17	45.6	45.81	46.13	45.17	98468.39	4489433.14	2021-07-18 20:50:44	2021-07-18 20:50:44	13
4659	EOS	2021-01-13	2.77	2.595	2.793	2.524	8083291.04	21761882.54	2021-05-09 17:34:36	2021-05-09 17:34:36	9
2423	OCN	2020-12-04	0.0002668	0.0002836	0.0002782	0.0002555	151616056.67	40451.91	2021-05-09 17:34:37	2021-05-09 17:34:37	2
9056	ANT	2020-09-13	4.96	4.794	5.352	4.469	151433.63	751127.19	2021-05-09 17:34:37	2021-05-09 17:34:37	14
2789	BTC	2020-12-04	18665	19448.44	19541.62	18603.79	42234.35	804366524.28	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2790	BTC	2020-12-05	19156.84	18665	19178.4	18514.92	20517.48	388466883.76	2021-05-09 17:34:36	2021-05-09 17:34:36	7
1522	ETH	2020-06-18	231.14	233.74	232.92	229.45	1183501.49	273554189.76	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1227	SJCX	2020-08-28	0.0004614	0.0004532	0.0004614	0.0004614	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
296484	BCH	2021-05-11	1550.42	1321.91	1550.72	1302.25	230586.24	325616006.97	2021-05-12 23:35:21	2021-05-12 23:35:21	8
1436	SJCX	2021-03-25	0.002053	0.002092	0.002053	0.002053	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
2791	BTC	2020-12-06	19378.94	19156.84	19417.33	18885.88	21172.5	405708588.31	2021-05-09 17:34:36	2021-05-09 17:34:36	7
10870	ATOM	2020-08-28	7.57	7.29	7.846	7.135	942561.29	7101646.28	2021-05-09 17:34:36	2021-05-09 17:34:36	3
101	XTZ	2020-07-31	2.845	2.81	2.9	2.788	2986226.78	8514258.42	2021-05-07 19:24:31	2021-05-07 19:24:31	5
1450	SJCX	2021-04-08	0.002323	0.002238	0.002323	0.002323	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
302550	ANT	2021-05-22	3.892	4.191	4.297	3.642	648689.68	2524452.24	2021-05-23 23:37:52	2021-05-23 23:37:52	14
280404	SJCX	2021-05-04	0.00213	0.002288	0.00213	0.00213	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1533	ETH	2020-06-29	227.84	224.82	228.76	224.35	986194.45	224693888.65	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1613	ETH	2020-09-17	389.54	365.09	394.57	364.04	1409168.77	548924125.68	2021-05-07 19:24:30	2021-05-07 19:24:30	10
10937	ATOM	2020-11-03	4.477	4.618	4.618	4.33	174953.57	777464	2021-05-09 17:34:36	2021-05-09 17:34:36	3
284190	SJCX	2021-05-05	0.0023	0.00213	0.0023	0.0023	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
284191	SJCX	2021-05-06	0.002258	0.0023	0.002258	0.002258	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
8983	ANT	2020-07-02	1.404	1.353	1.419	1.304	12382.61	17384.3	2021-05-09 17:34:37	2021-05-09 17:34:37	14
11008	ATOM	2021-01-13	6.243	5.712	6.246	5.532	875705.42	5229850.93	2021-05-09 17:34:36	2021-05-09 17:34:36	3
11009	ATOM	2021-01-14	6.463	6.243	6.585	6.134	1418983.35	9042935.26	2021-05-09 17:34:36	2021-05-09 17:34:36	3
1614	ETH	2020-09-18	384.47	389.54	391.69	379.76	1017844.84	391327582.63	2021-05-07 19:24:30	2021-05-07 19:24:30	10
11013	ATOM	2021-01-18	9.538	8.543	9.839	8.532	3241255.6	29725545.47	2021-05-09 17:34:36	2021-05-09 17:34:36	3
302580	SJCX	2021-05-22	0.0015	0.001494	0.0015	0.0015	0	0	2021-05-23 23:37:55	2021-05-23 23:37:55	11
1723	ETH	2021-01-05	1103.19	1043.16	1133.9	975.69	2076858.97	2209100382.41	2021-05-07 19:24:30	2021-05-07 19:24:30	10
85	XTZ	2020-07-15	3.225	2.963	3.229	2.86	13739355.86	41669506.6	2021-05-07 19:24:31	2021-05-07 19:24:31	5
4660	EOS	2021-01-14	2.81	2.77	2.856	2.693	7912200.05	21958295.12	2021-05-09 17:34:36	2021-05-09 17:34:36	9
8984	ANT	2020-07-03	1.351	1.404	1.403	1.273	89117.22	120388.68	2021-05-09 17:34:37	2021-05-09 17:34:37	14
1728	ETH	2021-01-10	1255.72	1279.96	1350.09	1163.66	1503199.13	1931453689.24	2021-05-07 19:24:30	2021-05-07 19:24:30	10
11014	ATOM	2021-01-19	8.913	9.538	10.18	8.84	2760418.97	25977398.1	2021-05-09 17:34:36	2021-05-09 17:34:36	3
307366	BTC	2021-06-01	36683.51	37290.83	37910.19	35733.52	44444.78	1626268789.21	2021-06-02 19:40:07	2021-06-02 19:40:07	7
307398	DOT	2021-06-01	22.82	23.33	23.53	21.73	1231693.4	27720774.2	2021-06-02 23:40:10	2021-06-02 23:40:10	4
1786	ETH	2021-03-09	1872.1	1834.48	1872.1	1799.85	512339.31	939208423.11	2021-05-07 19:24:30	2021-05-07 19:24:30	10
8985	ANT	2020-07-04	1.38	1.351	1.386	1.286	30563.47	42192.02	2021-05-09 17:34:37	2021-05-09 17:34:37	14
313100	ETH	2021-06-13	2509.7	2369.62	2549.74	2310.29	364534.68	882400625.24	2021-06-14 23:43:00	2021-06-14 23:43:00	10
1787	ETH	2021-03-10	1795.63	1872.1	1878.68	1758.02	725975.31	1320531852.38	2021-05-07 19:24:30	2021-05-07 19:24:30	10
80043	DOT	2021-04-25	29.83	29.06	31.26	28.14	892783.35	26422612.67	2021-05-09 17:34:36	2021-05-09 17:34:36	4
8986	ANT	2020-07-05	1.364	1.38	1.396	1.316	29575.77	40342.31	2021-05-09 17:34:37	2021-05-09 17:34:37	14
8987	ANT	2020-07-06	1.363	1.364	1.457	1.322	51929.96	70770.14	2021-05-09 17:34:37	2021-05-09 17:34:37	14
2793	BTC	2020-12-08	18323.52	19181.41	19295.38	18227.31	46151.65	866543428.89	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2794	BTC	2020-12-09	18549.92	18323.52	18639.24	17669.15	57997.45	1057335071.17	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2795	BTC	2020-12-10	18250.47	18549.92	18554.32	17920.56	37500.96	684802762.09	2021-05-09 17:34:36	2021-05-09 17:34:36	7
86	XTZ	2020-07-16	3.097	3.225	3.331	2.958	16557634.83	52079323.84	2021-05-07 19:24:31	2021-05-07 19:24:31	5
1789	ETH	2021-03-12	1767.77	1827.06	1842.03	1722.01	548553.31	972065732.17	2021-05-07 19:24:30	2021-05-07 19:24:30	10
312628	ANT	2021-06-12	4.266	4.393	5.392	3.839	347434.22	1502957.04	2021-06-13 23:42:45	2021-06-13 23:42:45	14
87	XTZ	2020-07-17	3.171	3.097	3.227	3.006	6320489.81	19759698.75	2021-05-07 19:24:31	2021-05-07 19:24:31	5
88	XTZ	2020-07-18	3.011	3.171	3.171	2.934	7402218.31	22446452.44	2021-05-07 19:24:31	2021-05-07 19:24:31	5
2797	BTC	2020-12-12	18814.98	18034.86	18948.78	18033.05	26150.36	484239535.46	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2811	BTC	2020-12-26	26445.7	24707.98	26780.61	24494.27	62923.13	1611547513.19	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2812	BTC	2020-12-27	26249.27	26445.7	28340.08	25805.96	91052.09	2463390777.21	2021-05-09 17:34:36	2021-05-09 17:34:36	7
146912	ETH	2021-04-30	2775.96	2758.46	2799.6	2727.7	422851.03	1166672092	2021-05-07 19:24:30	2021-05-07 19:24:30	10
89	XTZ	2020-07-19	2.987	3.011	3.057	2.891	4462530.96	13220031.47	2021-05-07 19:24:31	2021-05-07 19:24:31	5
270496	ETH	2021-05-02	2951.98	2947.8	2985.05	2856.3	343732.99	1007547549.64	2021-05-07 19:24:30	2021-05-07 19:24:30	10
11015	ATOM	2021-01-20	8.909	8.913	9.509	7.978	2447577.24	21444970.89	2021-05-09 17:34:36	2021-05-09 17:34:36	3
11016	ATOM	2021-01-21	7.16	8.909	8.953	7.072	1947920.15	15478030.1	2021-05-09 17:34:36	2021-05-09 17:34:36	3
182	XTZ	2020-10-20	2.056	2.19	2.192	2.043	2921693.01	6157863.76	2021-05-07 19:24:31	2021-05-07 19:24:31	5
8988	ANT	2020-07-07	1.346	1.363	1.418	1.251	49941.06	67221.38	2021-05-09 17:34:37	2021-05-09 17:34:37	14
8989	ANT	2020-07-08	1.34	1.346	1.42	1.313	67391.75	90329.64	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9081	ANT	2020-10-08	3.415	3.313	3.458	3.294	141127.82	482013.25	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9186	ANT	2021-01-21	3.426	4.008	3.651	3.284	459326.64	1573817.2	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9242	ANT	2021-03-18	6.739	6.863	6.767	6.306	825688.96	5563908.45	2021-05-09 17:34:37	2021-05-09 17:34:37	14
317824	ANT	2021-06-23	5.53	6.758	8.177	4.287	1298499.77	7180746.17	2021-06-24 23:45:19	2021-06-24 23:45:19	14
324390	ETH	2021-07-07	2317.12	2322.63	2408.53	2294.71	327127.26	771174149.51	2021-07-08 23:48:30	2021-07-08 23:48:30	10
329494	BTC	2021-07-18	31806.3	31546.64	32446.17	31131.67	25079.04	796652696.45	2021-07-19 23:50:59	2021-07-19 23:50:59	7
291622	ATOM	2021-05-08	29.48	28.67	31.4	26.93	562076.79	16205053.97	2021-05-09 23:34:40	2021-05-09 23:34:40	3
286753	FIL	2021-05-06	153.69	152.58	165.75	149.85	477649.24	75189124.64	2021-05-07 23:24:32	2021-05-07 23:24:32	13
297038	EOS	2021-05-12	10.35	14.53	14.89	10.18	41299463.19	525063431.59	2021-05-13 23:35:35	2021-05-13 23:35:35	9
493	DOT	2020-08-26	6.093	5.566	6.553	5.125	693382.68	4123483.16	2021-05-09 17:34:36	2021-05-09 17:34:36	4
67516	ATOM	2021-04-24	18.47	20.51	20.52	18.37	1178287.39	22676994.51	2021-05-09 17:34:36	2021-05-09 17:34:36	3
4625	EOS	2020-12-10	2.743	2.812	2.814	2.704	1110667.84	3069027.31	2021-05-09 17:34:36	2021-05-09 17:34:36	9
534	DOT	2020-10-06	3.753	4.166	4.182	3.605	1251374.8	4822801.82	2021-05-09 17:34:36	2021-05-09 17:34:36	4
538	DOT	2020-10-10	4.246	4.263	4.483	4.236	564260.45	2460754.13	2021-05-09 17:34:36	2021-05-09 17:34:36	4
1437	SJCX	2021-03-26	0.002202	0.002053	0.002202	0.002202	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
4649	EOS	2021-01-03	2.796	2.632	2.848	2.579	8262468.9	22618205.35	2021-05-09 17:34:36	2021-05-09 17:34:36	9
183	XTZ	2020-10-21	2.133	2.056	2.179	2.044	2829999.35	6038752.2	2021-05-07 19:24:31	2021-05-07 19:24:31	5
2823	BTC	2021-01-07	39479.41	36849.86	40365.87	36340.01	124086.76	4753170180.55	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2824	BTC	2021-01-08	40636.24	39479.41	41964.96	36640.51	118077.27	4705592327.36	2021-05-09 17:34:36	2021-05-09 17:34:36	7
133184	EOS	2021-04-27	6.056	5.863	6.105	5.747	6928457.28	41272444.68	2021-05-09 17:34:36	2021-05-09 17:34:36	9
539	DOT	2020-10-11	4.249	4.246	4.331	4.171	341087.58	1449530.81	2021-05-09 17:34:36	2021-05-09 17:34:36	4
540	DOT	2020-10-12	4.31	4.249	4.448	4.188	708012.69	3077504.29	2021-05-09 17:34:36	2021-05-09 17:34:36	4
2271	OCN	2020-07-05	0.0003238	0.0003073	0.0003352	0.0003056	29344050.59	9501.68	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2825	BTC	2021-01-09	40236.66	40636.24	41400.48	38783.61	55591.28	2241901362.12	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2510	OCN	2021-03-01	0.0006443	0.0005406	0.0007543	0.0005657	86285844.33	55594.91	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2826	BTC	2021-01-10	38202.08	40236.66	41427.88	35283.65	103220.32	3983391028.78	2021-05-09 17:34:36	2021-05-09 17:34:36	7
9253	ANT	2021-03-29	9.312	9.271	10.27	9.209	871437.02	8115150.72	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9254	ANT	2021-03-30	11.79	9.33	13.84	9.327	311785.01	3603122.94	2021-05-09 17:34:37	2021-05-09 17:34:37	14
2828	BTC	2021-01-12	34058.4	35496.03	36620.28	32522.98	115232.53	3999535589.05	2021-05-09 17:34:36	2021-05-09 17:34:36	7
302552	ATOM	2021-05-22	12.26	13.57	13.7	11.57	2281151.11	28921418.25	2021-05-23 23:37:53	2021-05-23 23:37:53	3
80775	ATOM	2021-04-25	18.69	18.47	19.66	17.69	976135.25	18258543.34	2021-05-09 17:34:36	2021-05-09 17:34:36	3
286386	ANT	2021-05-05	9.339	8.599	9.54	9.006	519063.48	4847594.73	2021-05-09 17:34:37	2021-05-09 17:34:37	14
2829	BTC	2021-01-13	37380.85	34058.4	37809.67	32405.89	91979.17	3198683391.78	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2830	BTC	2021-01-14	39155.58	37380.85	40093.43	36751.89	74972.21	2895085049.06	2021-05-09 17:34:36	2021-05-09 17:34:36	7
142130	ATOM	2021-04-28	22.95	23.08	24.13	21.9	2452475.87	56620072.3	2021-05-09 17:34:36	2021-05-09 17:34:36	3
270504	ATOM	2021-05-02	23.14	23.78	23.92	22.32	1001866.62	23073892.68	2021-05-09 17:34:36	2021-05-09 17:34:36	3
271102	ATOM	2021-05-03	22.97	23.14	23.77	22.49	1332619.24	30895008.06	2021-05-09 17:34:36	2021-05-09 17:34:36	3
286387	ANT	2021-05-06	9.787	9.339	9.86	9.002	825624.58	8080414.51	2021-05-09 17:34:37	2021-05-09 17:34:37	14
292128	ATOM	2021-05-09	28.79	29.51	29.7	26.73	1878381.64	54070466.67	2021-05-10 23:34:53	2021-05-10 23:34:53	3
307368	EOS	2021-06-01	6.299	6.635	6.749	6.074	4083361.23	25791975.73	2021-06-02 23:40:10	2021-06-02 23:40:10	9
541	DOT	2020-10-13	4.256	4.31	4.346	4.13	329423.91	1400077.81	2021-05-09 17:34:36	2021-05-09 17:34:36	4
102	XTZ	2020-08-01	3.044	2.845	3.078	2.827	5615355.49	16677304	2021-05-07 19:24:31	2021-05-07 19:24:31	5
103	XTZ	2020-08-02	2.889	3.044	3.14	2.693	8054310.21	23740854.09	2021-05-07 19:24:31	2021-05-07 19:24:31	5
104	XTZ	2020-08-03	3.075	2.889	3.089	2.842	6154641.35	18510546.24	2021-05-07 19:24:31	2021-05-07 19:24:31	5
312630	XTZ	2021-06-12	3.14	3.135	3.236	2.925	2861101.79	8784353.63	2021-06-13 23:42:45	2021-06-13 23:42:45	5
317856	SJCX	2021-06-23	0.001347	0.001302	0.001347	0.001347	0	0	2021-06-24 23:45:18	2021-06-24 23:45:18	11
312634	EOS	2021-06-12	4.825	4.918	4.918	4.587	3965710.54	18880662.94	2021-06-13 23:42:46	2021-06-13 23:42:46	9
10771	ATOM	2020-05-21	2.512	2.701	2.575	2.494	1515185.99	3805819.93	2021-05-09 17:34:36	2021-05-09 17:34:36	3
11033	ATOM	2021-02-07	13.86	12.08	14	11.47	4404997.38	56660689.23	2021-05-09 17:34:36	2021-05-09 17:34:36	3
11034	ATOM	2021-02-08	14.19	13.86	15.04	13.29	4272744.48	61009314.16	2021-05-09 17:34:36	2021-05-09 17:34:36	3
11043	ATOM	2021-02-17	23.87	25.13	25.86	22.49	3718211.28	89374088.6	2021-05-09 17:34:36	2021-05-09 17:34:36	3
2831	BTC	2021-01-15	36790.17	39155.58	39695.43	34396.19	89468.27	3288447634.87	2021-05-09 17:34:36	2021-05-09 17:34:36	7
184	XTZ	2020-10-22	2.193	2.133	2.245	2.126	2361283.05	5208805.7	2021-05-07 19:24:31	2021-05-07 19:24:31	5
11055	ATOM	2021-03-01	18.71	17.67	18.89	17.54	1632973.88	29873067.12	2021-05-09 17:34:36	2021-05-09 17:34:36	3
185	XTZ	2020-10-23	2.219	2.193	2.267	2.165	2067991.49	4575289.41	2021-05-07 19:24:31	2021-05-07 19:24:31	5
542	DOT	2020-10-14	4.197	4.256	4.372	4.077	524458.45	2234392.8	2021-05-09 17:34:36	2021-05-09 17:34:36	4
186	XTZ	2020-10-24	2.222	2.219	2.242	2.195	1296217.49	2879811.23	2021-05-07 19:24:31	2021-05-07 19:24:31	5
2832	BTC	2021-01-16	36025.26	36790.17	37942.44	35395.88	54226.28	1995053500.31	2021-05-09 17:34:36	2021-05-09 17:34:36	7
286388	ANT	2021-05-07	10.63	9.802	12.56	9.706	232300.17	2593812.55	2021-05-09 17:34:37	2021-05-09 17:34:37	14
317826	ZRX	2021-06-23	0.6426	0.576	0.6661	0.5552	9345452.4	5877298.73	2021-06-24 22:45:18	2021-06-24 22:45:18	6
549	DOT	2020-10-21	4.143	3.914	4.249	3.901	642567.53	2628790.73	2021-05-09 17:34:36	2021-05-09 17:34:36	4
324392	XTZ	2021-07-07	2.876	2.869	2.964	2.821	2606892.81	7597619.29	2021-07-08 23:48:30	2021-07-08 23:48:30	5
324396	BCH	2021-07-07	509.57	511.85	521.76	502.79	114184.07	58184443.32	2021-07-08 23:48:30	2021-07-08 23:48:30	8
329502	ETH	2021-07-18	1891.96	1899.96	1993.26	1881.84	291029.97	563444548.7	2021-07-19 23:50:59	2021-07-19 23:50:59	10
226	XTZ	2020-12-03	2.406	2.391	2.452	2.378	2311405.19	5577176.84	2021-05-07 19:24:31	2021-05-07 19:24:31	5
227	XTZ	2020-12-04	2.28	2.406	2.435	2.225	3586952.37	8368774.2	2021-05-07 19:24:31	2021-05-07 19:24:31	5
228	XTZ	2020-12-05	2.323	2.28	2.333	2.241	1356348.84	3110399.95	2021-05-07 19:24:31	2021-05-07 19:24:31	5
229	XTZ	2020-12-06	2.325	2.323	2.34	2.256	1841548.49	4242979.14	2021-05-07 19:24:31	2021-05-07 19:24:31	5
230	XTZ	2020-12-07	2.276	2.325	2.328	2.228	1701697.87	3869499.63	2021-05-07 19:24:31	2021-05-07 19:24:31	5
329496	OCN	2021-07-18	0.0009271	0.000874	0.001078	0.0008514	29349908.25	27209.14	2021-07-19 22:50:59	2021-07-19 22:50:59	2
337744	SJCX	2021-08-05	0.001636	0.00159	0.001636	0.001636	0	0	2021-08-06 23:55:08	2021-08-06 23:55:08	11
342898	XTZ	2021-08-16	3.639	3.739	3.892	3.615	4494375.84	16877416.94	2021-08-17 23:57:40	2021-08-17 23:57:40	5
2792	BTC	2020-12-07	19181.41	19378.94	19411.51	18909.97	24908.46	477334574.93	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2822	BTC	2021-01-06	36849.86	34038.29	36973.76	33404.2	108190.73	3788317475.74	2021-05-09 17:34:36	2021-05-09 17:34:36	7
4572	EOS	2020-10-18	2.548	2.526	2.556	2.521	308084.68	782384.77	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4573	EOS	2020-10-19	2.584	2.548	2.612	2.527	586042.57	1506434.57	2021-05-09 17:34:36	2021-05-09 17:34:36	9
2977	BCH	2020-06-09	254.27	255.42	256.72	252.9	62213.89	15819262.68	2021-05-09 17:34:36	2021-05-09 17:34:36	8
39	XTZ	2020-05-30	2.924	2.875	2.962	2.824	2764122.16	8006735.48	2021-05-07 19:24:31	2021-05-07 19:24:31	5
1681	ETH	2020-11-24	604.98	609.12	645.6	590.23	2001953.72	1211148193.21	2021-05-07 19:24:30	2021-05-07 19:24:30	10
297040	OCN	2021-05-12	0.001296	0.001588	0.001448	0.00122	38001893.53	49244.32	2021-05-13 23:35:35	2021-05-13 23:35:35	2
40	XTZ	2020-05-31	2.804	2.924	2.961	2.772	3149889.89	8992415.03	2021-05-07 19:24:31	2021-05-07 19:24:31	5
302554	ZRX	2021-05-22	0.9601	1.041	1.05	0.899	17190529.65	16665855.89	2021-05-23 23:37:52	2021-05-23 23:37:52	6
1854	ZRX	2020-05-15	0.3822	0.3433	0.4199	0.34	46453205.82	18113157.89	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1855	ZRX	2020-05-16	0.3834	0.3822	0.4117	0.3818	14018185.76	5480901.7	2021-05-09 17:34:36	2021-05-09 17:34:36	6
3145	BCH	2020-11-24	347.32	322.12	381.61	327.59	774360.57	268950379.48	2021-05-09 17:34:36	2021-05-09 17:34:36	8
1682	ETH	2020-11-25	569.4	605.05	606.1	554.92	688409.44	404296921.42	2021-05-07 19:24:30	2021-05-07 19:24:30	10
287486	EOS	2021-05-07	10.38	11.47	13.26	9.573	39342083.1	443363213.69	2021-05-09 17:34:36	2021-05-09 17:34:36	9
292138	EOS	2021-05-09	10.52	10.35	11.09	9.139	16575937	166673405.57	2021-05-10 23:34:53	2021-05-10 23:34:53	9
3146	BCH	2020-11-25	313.47	347.32	354.48	302.8	608994.31	190900972.8	2021-05-09 17:34:36	2021-05-09 17:34:36	8
41	XTZ	2020-06-01	2.961	2.804	2.996	2.78	2853825.36	8297954.85	2021-05-07 19:24:31	2021-05-07 19:24:31	5
1224	SJCX	2020-08-25	0.0004532	0.0004703	0.0004532	0.0004532	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
9087	ANT	2020-10-14	3.44	3.617	3.617	3.415	105808.65	364004.96	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9088	ANT	2020-10-15	3.298	3.44	3.472	3.266	122537.8	404164.18	2021-05-09 17:34:37	2021-05-09 17:34:37	14
1439	SJCX	2021-03-28	0.002231	0.002235	0.002231	0.002231	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
3151	BCH	2020-11-30	317.35	285.55	326.01	298.26	396123.26	125710645.23	2021-05-09 17:34:36	2021-05-09 17:34:36	8
42	XTZ	2020-06-02	2.9	2.961	3.128	2.734	4503626.41	13214290.53	2021-05-07 19:24:31	2021-05-07 19:24:31	5
9091	ANT	2020-10-18	3.324	3.24	3.394	3.274	62125.91	206500.21	2021-05-09 17:34:37	2021-05-09 17:34:37	14
1454	SJCX	2021-04-12	0.002394	0.002399	0.002394	0.002394	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
9092	ANT	2020-10-19	3.241	3.324	3.405	3.213	78472.12	254357.32	2021-05-09 17:34:37	2021-05-09 17:34:37	14
2787	BTC	2020-12-02	19226.19	18792.03	19337.16	18350	47787.81	903817773.96	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2788	BTC	2020-12-03	19448.44	19226.19	19608.49	18888.12	38699.87	747088833.15	2021-05-09 17:34:36	2021-05-09 17:34:36	7
291511	XTZ	2021-05-06	7.577	6.61	8.06	6.45	16138314.38	118346429.8	2021-05-07 23:24:32	2021-05-07 23:24:32	5
45	XTZ	2020-06-05	2.936	2.999	3.02	2.915	1742800.87	5165099.71	2021-05-07 19:24:31	2021-05-07 19:24:31	5
286754	FIL	2021-05-07	150.45	153.69	154.96	147.16	228070.22	34655073.74	2021-05-08 23:24:46	2021-05-08 23:24:46	13
52	XTZ	2020-06-12	2.669	2.615	2.76	2.59	2854803.72	7662859.81	2021-05-07 19:24:31	2021-05-07 19:24:31	5
2845	BTC	2021-01-29	34252.08	33443.87	38631.5	31996.08	169454.57	6015929349.68	2021-05-09 17:34:36	2021-05-09 17:34:36	7
307370	BCH	2021-06-01	691.07	703.06	720.59	668.99	96709.05	66706757.28	2021-06-02 23:40:10	2021-06-02 23:40:10	8
84	XTZ	2020-07-14	2.963	2.906	3.055	2.667	10175935.45	29403485.53	2021-05-07 19:24:31	2021-05-07 19:24:31	5
715	DOT	2021-04-05	45.82	44.31	45.84	41.85	844708.77	36947337.67	2021-05-09 17:34:36	2021-05-09 17:34:36	4
716	DOT	2021-04-06	43.31	45.82	46.24	41.65	811311.87	35557096.98	2021-05-09 17:34:36	2021-05-09 17:34:36	4
291512	XTZ	2021-05-07	7.096	7.577	8.413	6.774	14258674.45	107923034.58	2021-05-08 23:24:46	2021-05-08 23:24:46	5
2424	OCN	2020-12-05	0.0002806	0.0002668	0.0002866	0.0002747	144456314.57	40540.47	2021-05-09 17:34:37	2021-05-09 17:34:37	2
312632	ETH	2021-06-12	2369.62	2355.09	2452.14	2259.36	379128.5	891766601.89	2021-06-13 23:42:46	2021-06-13 23:42:46	10
2545	OCN	2021-04-05	0.001707	0.001641	0.001918	0.001602	35104860.65	59933.17	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2546	OCN	2021-04-06	0.001605	0.001707	0.001901	0.001584	26379762.22	42348.5	2021-05-09 17:34:37	2021-05-09 17:34:37	2
291510	XTZ	2021-05-05	6.61	5.497	6.716	5.418	10839382.1	68236217.73	2021-05-07 19:24:31	2021-05-07 19:24:31	5
2547	OCN	2021-04-07	0.001532	0.001605	0.001552	0.001336	13922102.17	21329.5	2021-05-09 17:34:37	2021-05-09 17:34:37	2
317828	BTC	2021-06-23	33678.64	32537.58	34831.93	31790.02	60338.69	2037061709.14	2021-06-24 23:45:18	2021-06-24 23:45:18	7
9093	ANT	2020-10-20	2.906	3.222	3.211	2.847	953270.24	2770214.35	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9127	ANT	2020-11-23	4.163	3.933	4.356	3.911	722977.51	3009416.69	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9149	ANT	2020-12-15	3.06	2.964	3.14	2.967	342187.54	1047150.16	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9151	ANT	2020-12-17	3.106	3.128	3.38	2.955	484491.99	1504879.28	2021-05-09 17:34:37	2021-05-09 17:34:37	14
324394	OCN	2021-07-07	0.000672	0.00072	0.0007415	0.000672	24765463.18	16641.52	2021-07-08 23:48:30	2021-07-08 23:48:30	2
9152	ANT	2020-12-18	3.149	3.106	3.237	3.133	176946.39	557160.14	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9153	ANT	2020-12-19	3.198	3.149	3.372	3.19	153862.7	491987.82	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9154	ANT	2020-12-20	3.138	3.198	3.231	3.011	188363.12	590997.94	2021-05-09 17:34:37	2021-05-09 17:34:37	14
3152	BCH	2020-12-01	288.08	317.35	305.56	276.24	446873.91	128736249.26	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3231	BCH	2021-02-18	704.69	717.22	729.82	690.78	117818.18	83675115.67	2021-05-09 17:34:36	2021-05-09 17:34:36	8
717	DOT	2021-04-07	39.56	43.31	43.46	37.79	1271484.93	50784638.05	2021-05-09 17:34:36	2021-05-09 17:34:36	4
2846	BTC	2021-01-30	34317.82	34252.08	34906.15	32858	46326.31	1574213551.44	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2847	BTC	2021-01-31	33143.22	34317.82	34381.7	32214.08	35337.11	1176981986.93	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2848	BTC	2021-02-01	33535.94	33143.22	34714.34	32340.24	48144.6	1623291067.04	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2849	BTC	2021-02-02	35524.43	33535.94	36004.47	33459.48	51377.38	1789698965.07	2021-05-09 17:34:36	2021-05-09 17:34:36	7
9155	ANT	2020-12-21	2.881	3.098	3.103	2.815	346899.83	1017873.93	2021-05-09 17:34:37	2021-05-09 17:34:37	14
329968	DOT	2021-07-19	11.43	12.65	12.73	11.36	963148.41	11373547.94	2021-07-20 23:51:13	2021-07-20 23:51:13	4
329498	BCH	2021-07-18	438.61	436.61	448.79	438.61	102654.64	45025236.37	2021-07-19 23:50:59	2021-07-19 23:50:59	8
338200	XTZ	2021-08-06	3.36	3.222	3.363	3.151	2936553.73	9554507.44	2021-08-07 23:55:21	2021-08-07 23:55:21	5
338222	ANT	2021-08-06	4.145	3.929	4.228	4.089	536229.45	2222720.07	2021-08-07 23:55:21	2021-08-07 23:55:21	14
1864	ZRX	2020-05-25	0.3202	0.3017	0.3279	0.2998	8714915.05	2761814.48	2021-05-09 17:34:36	2021-05-09 17:34:36	6
3184	BCH	2021-01-02	354.56	342.38	380.97	349.41	374680.99	132847669.8	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3579	FIL	2021-01-31	22.27	22.05	22.59	22.04	173514.05	3867666.34	2021-05-07 19:24:30	2021-05-07 19:24:30	13
4408	EOS	2020-05-07	2.764	2.656	2.793	2.594	2349790.68	6370555.46	2021-05-07 19:24:30	2021-05-07 19:24:30	9
4409	EOS	2020-05-08	2.753	2.764	2.824	2.702	1943560.48	5369996.63	2021-05-07 19:24:30	2021-05-07 19:24:30	9
4410	EOS	2020-05-09	2.753	2.753	2.835	2.735	1372698.47	3826833.97	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4411	EOS	2020-05-10	2.449	2.753	2.753	2.287	3712161.58	9075201.99	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4412	EOS	2020-05-11	2.402	2.449	2.493	2.282	2295938.86	5497749.54	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4506	EOS	2020-08-13	3.141	3.025	3.149	2.922	2613154.93	7956440	2021-05-09 17:34:36	2021-05-09 17:34:36	9
1340	SJCX	2020-12-19	0.0009538	0.0009254	0.0009538	0.0009538	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
3580	FIL	2021-02-01	22.62	22.27	24.01	22.04	459096.73	10529246.07	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3185	BCH	2021-01-03	424	354.56	434.59	354.44	310842.31	121639951.06	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3186	BCH	2021-01-04	405.97	424	466.67	379.33	276684.18	115154859.29	2021-05-09 17:34:36	2021-05-09 17:34:36	8
611	DOT	2020-12-22	5.155	4.879	5.171	4.802	784618.96	3950199.01	2021-05-09 17:34:36	2021-05-09 17:34:36	4
9022	ANT	2020-08-10	3.545	3.31	3.6	3.193	105733.21	374869.5	2021-05-09 17:34:37	2021-05-09 17:34:37	14
1521	ETH	2020-06-17	233.74	235.31	234.96	232.6	744081.13	173917879.04	2021-05-07 19:24:30	2021-05-07 19:24:30	10
30	XTZ	2020-05-21	2.64	2.818	2.851	2.567	3610733.14	9740114.19	2021-05-07 19:24:31	2021-05-07 19:24:31	5
1532	ETH	2020-06-28	224.82	220.77	226.37	222.36	713590.85	160427791.91	2021-05-07 19:24:30	2021-05-07 19:24:30	10
3581	FIL	2021-02-02	22.49	22.62	22.92	22.34	201638.3	4553359.87	2021-05-07 19:24:30	2021-05-07 19:24:30	13
1865	ZRX	2020-05-26	0.3483	0.3202	0.3629	0.318	31626758.82	10899024.61	2021-05-09 17:34:36	2021-05-09 17:34:36	6
612	DOT	2020-12-23	4.72	5.155	5.187	4.595	555847.67	2705112.1	2021-05-09 17:34:36	2021-05-09 17:34:36	4
613	DOT	2020-12-24	5.131	4.72	5.197	4.642	673809.23	3360425.43	2021-05-09 17:34:36	2021-05-09 17:34:36	4
9023	ANT	2020-08-11	3.758	3.545	3.952	3.375	193361.23	726723.68	2021-05-09 17:34:37	2021-05-09 17:34:37	14
3187	BCH	2021-01-05	419.35	405.83	449.99	409.82	394635.67	165491152.04	2021-05-09 17:34:36	2021-05-09 17:34:36	8
1554	ETH	2020-07-20	236.17	239.16	239.1	234.61	613442.59	144874959.58	2021-05-07 19:24:30	2021-05-07 19:24:30	10
9024	ANT	2020-08-12	4.999	3.763	5.645	3.845	397693.77	1987921.19	2021-05-09 17:34:37	2021-05-09 17:34:37	14
550	DOT	2020-10-22	4.27	4.143	4.337	4.128	661939.49	2826053.69	2021-05-09 17:34:36	2021-05-09 17:34:36	4
1341	SJCX	2020-12-20	0.0009387	0.0009538	0.0009387	0.0009387	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1866	ZRX	2020-05-27	0.3349	0.3483	0.3538	0.3281	14864718.53	5053628.54	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2883	BTC	2021-03-08	52405.02	50964.18	52408.08	49341.09	48084.28	2445827949.75	2021-05-09 17:34:36	2021-05-09 17:34:36	7
1867	ZRX	2020-05-28	0.3332	0.3349	0.3471	0.331	7794253.82	2619057.2	2021-05-09 17:34:36	2021-05-09 17:34:36	6
3188	BCH	2021-01-06	454.36	419.35	482.73	443.3	511377.72	232348953.81	2021-05-09 17:34:36	2021-05-09 17:34:36	8
1342	SJCX	2020-12-21	0.0009091	0.0009387	0.0009091	0.0009091	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1868	ZRX	2020-05-29	0.3322	0.3332	0.3429	0.3282	7991761.82	2686627.48	2021-05-09 17:34:36	2021-05-09 17:34:36	6
555	DOT	2020-10-27	4.68	4.707	4.937	4.655	607883.53	2916451	2021-05-09 17:34:36	2021-05-09 17:34:36	4
31	XTZ	2020-05-22	2.799	2.64	2.861	2.602	3693014.79	10180457.52	2021-05-07 19:24:31	2021-05-07 19:24:31	5
1555	ETH	2020-07-21	245.87	236.16	247	235.78	392196.91	95966343.65	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1556	ETH	2020-07-22	264.18	245.62	267.71	247.97	899421.54	237610574.74	2021-05-07 19:24:30	2021-05-07 19:24:30	10
614	DOT	2020-12-25	5.217	5.131	5.272	5.045	739452.99	3835417.79	2021-05-09 17:34:36	2021-05-09 17:34:36	4
2884	BTC	2021-03-09	54928.7	52405.02	54933.93	51888.98	53740.22	2898199576.25	2021-05-09 17:34:36	2021-05-09 17:34:36	7
3582	FIL	2021-02-03	23.07	22.49	23.45	22.4	296385.64	6784938.45	2021-05-07 19:24:30	2021-05-07 19:24:30	13
297042	BTC	2021-05-12	49504.08	56747.52	58005.44	49182.89	74345.74	4035173480.67	2021-05-13 21:35:34	2021-05-13 21:35:34	7
1343	SJCX	2020-12-22	0.0009529	0.0009091	0.0009529	0.0009529	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
302582	BTC	2021-05-22	37491.5	37350.39	38841.92	35287.71	74964.98	2808008188.27	2021-05-23 23:37:53	2021-05-23 23:37:53	7
1831	ZRX	2020-04-22	0.1716	0.1694	0.1733	0.1687	2039289.26	348337.19	2021-04-22 21:03:21	2021-04-22 21:03:21	6
9130	ANT	2020-11-26	3.275	3.696	3.409	3.032	789678.58	2586542.05	2021-05-09 17:34:37	2021-05-09 17:34:37	14
138	XTZ	2020-09-06	2.551	2.484	2.63	2.342	4347653.2	10990958.45	2021-05-07 19:24:31	2021-05-07 19:24:31	5
1344	SJCX	2020-12-23	0.0009296	0.0009529	0.0009296	0.0009296	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
2890	BTC	2021-03-15	55665.01	58998.89	60589.17	54857.68	75161.15	4297382088.92	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2899	BTC	2021-03-24	52303.02	54355.45	57202.53	51685.15	62596.16	3420695083.54	2021-05-09 17:34:36	2021-05-09 17:34:36	7
3583	FIL	2021-02-04	22.92	23.07	23.31	22.71	339293.87	7796694.53	2021-05-07 19:24:30	2021-05-07 19:24:30	13
302556	XTZ	2021-05-22	3.441	3.667	3.741	3.254	9026560.73	31553212.81	2021-05-23 22:37:52	2021-05-23 22:37:52	5
2916	BTC	2021-04-10	59784.8	58106.85	61193.5	57885.43	38726.18	2322058695.22	2021-05-09 17:34:36	2021-05-09 17:34:36	7
270488	BCH	2021-05-02	973.8	1006.63	1011.21	952.73	75711.13	74240627.43	2021-05-09 17:34:36	2021-05-09 17:34:36	8
1345	SJCX	2020-12-24	0.000949	0.0009296	0.000949	0.000949	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1557	ETH	2020-07-23	275.65	264.32	280.97	260.56	840629.82	227497042.4	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1559	ETH	2020-07-25	305.67	279.6	309.39	279.6	744498.83	218403404.71	2021-05-07 19:24:30	2021-05-07 19:24:30	10
3584	FIL	2021-02-05	24.51	22.92	25.73	22.82	952930.01	23100728.03	2021-05-07 19:24:30	2021-05-07 19:24:30	13
9156	ANT	2020-12-22	2.923	2.864	3.085	2.921	212229.58	620372.82	2021-05-09 17:34:37	2021-05-09 17:34:37	14
307372	ETH	2021-06-01	2634.23	2707.38	2742.61	2529.17	719587.48	1882287507.52	2021-06-02 23:40:10	2021-06-02 23:40:10	10
139	XTZ	2020-09-07	2.561	2.551	2.59	2.362	3725757.04	9241748.63	2021-05-07 19:24:31	2021-05-07 19:24:31	5
140	XTZ	2020-09-08	2.502	2.561	2.647	2.401	4423201.18	11076891.63	2021-05-07 19:24:31	2021-05-07 19:24:31	5
141	XTZ	2020-09-09	2.53	2.502	2.6	2.413	2828376.32	7144981.6	2021-05-07 19:24:31	2021-05-07 19:24:31	5
556	DOT	2020-10-28	4.367	4.68	4.768	4.258	218266.9	977321.13	2021-05-09 17:34:36	2021-05-09 17:34:36	4
557	DOT	2020-10-29	4.057	4.367	4.398	3.899	447375.09	1840596.95	2021-05-09 17:34:36	2021-05-09 17:34:36	4
1969	ZRX	2020-09-07	0.4594	0.4603	0.4834	0.4185	6522755.63	2940816.91	2021-05-09 17:34:36	2021-05-09 17:34:36	6
307394	ZRX	2021-06-01	1.027	1.02	1.053	0.9843	7006160.11	7122580.15	2021-06-02 23:40:10	2021-06-02 23:40:10	6
646	DOT	2021-01-26	17.13	17.23	17.79	16.03	1519207.51	25722158.59	2021-05-09 17:34:36	2021-05-09 17:34:36	4
647	DOT	2021-01-27	15.51	17.13	17.13	15.06	2143485.47	33822997.17	2021-05-09 17:34:36	2021-05-09 17:34:36	4
648	DOT	2021-01-28	16.9	15.51	17.49	15.29	1709570.56	28826567.54	2021-05-09 17:34:36	2021-05-09 17:34:36	4
682	DOT	2021-03-03	37.06	36.2	38.69	36.19	1194041	44830023.94	2021-05-09 17:34:36	2021-05-09 17:34:36	4
1843	ZRX	2020-05-04	0.204	0.2069	0.2073	0.1926	3907554.16	782427.45	2021-05-04 22:03:21	2021-05-04 22:03:21	6
1110	SJCX	2020-05-03	0.0003563	0.0003592	0.0003563	0.0003563	0	0	2021-05-03 03:13:20	2021-05-03 03:13:20	11
683	DOT	2021-03-04	35.29	37.06	38.41	34.35	1248964.83	45175658.11	2021-05-09 17:34:36	2021-05-09 17:34:36	4
1357	SJCX	2021-01-05	0.001362	0.001281	0.001362	0.001362	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
9131	ANT	2020-11-27	3.15	3.275	3.35	3.119	292790.8	922190.89	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9192	ANT	2021-01-27	3.502	4.006	3.867	3.468	435972.89	1526643.24	2021-05-09 17:34:37	2021-05-09 17:34:37	14
1844	ZRX	2020-05-05	0.2064	0.204	0.2069	0.2	2125943.44	432728.63	2021-05-04 22:03:21	2021-05-04 22:03:21	6
1846	ZRX	2020-05-07	0.3002	0.2098	0.3535	0.206	55106814.82	14992367.92	2021-05-07 19:24:30	2021-05-07 19:24:30	6
1848	ZRX	2020-05-09	0.4251	0.3939	0.4897	0.3684	63023131.24	27097277.96	2021-05-09 17:34:36	2021-05-09 17:34:36	6
9193	ANT	2021-01-28	3.896	3.502	4.298	3.833	476568.55	1856811.56	2021-05-09 17:34:37	2021-05-09 17:34:37	14
1565	ETH	2020-07-31	346.94	335.3	351.71	340.13	1351347.36	468835268.22	2021-05-07 19:24:30	2021-05-07 19:24:30	10
163	XTZ	2020-10-01	2.193	2.198	2.3	2.132	2692453.2	5989554.13	2021-05-07 19:24:31	2021-05-07 19:24:31	5
1111	SJCX	2020-05-04	0.0003553	0.0003563	0.0003553	0.0003553	0	0	2021-05-03 03:13:20	2021-05-03 03:13:20	11
1583	ETH	2020-08-18	422.19	431.28	426.14	415.73	762840.88	322064343.35	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1849	ZRX	2020-05-10	0.398	0.4251	0.4672	0.3412	63689966.57	26048816.97	2021-05-09 17:34:36	2021-05-09 17:34:36	6
9194	ANT	2021-01-29	3.747	3.896	4.031	3.361	653675.58	2449438.46	2021-05-09 17:34:37	2021-05-09 17:34:37	14
164	XTZ	2020-10-02	2.089	2.193	2.209	2.021	3687962.95	7702849.89	2021-05-07 19:24:31	2021-05-07 19:24:31	5
9195	ANT	2021-01-30	4.029	3.747	4.118	3.686	391135.64	1575851.1	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9196	ANT	2021-01-31	4.189	4.029	4.451	3.785	772065.09	3234414.6	2021-05-09 17:34:37	2021-05-09 17:34:37	14
1112	SJCX	2020-05-05	0.0003612	0.0003553	0.0003612	0.0003612	0	0	2021-05-03 03:13:20	2021-05-03 03:13:20	11
1845	ZRX	2020-05-06	0.2098	0.2064	0.218	0.203	6670606.57	1423141.28	2021-05-04 22:03:21	2021-05-04 22:03:21	6
3237	BCH	2021-02-24	527.52	516.53	563.92	496.27	213828.34	114298785.42	2021-05-09 17:34:36	2021-05-09 17:34:36	8
1847	ZRX	2020-05-08	0.3939	0.3002	0.525	0.2991	104874750.12	40699967.93	2021-05-07 19:24:30	2021-05-07 19:24:30	6
2891	BTC	2021-03-16	56925.01	55665.01	56936.04	53269.13	62540.93	3441195999.4	2021-05-09 17:34:36	2021-05-09 17:34:36	7
3238	BCH	2021-02-25	499.2	527.52	557.83	494.1	136135.36	71856066.38	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3239	BCH	2021-02-26	484.91	499.2	508.34	457.34	152975.67	74397667.94	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3253	BCH	2021-03-12	538.49	549.77	561.91	528.36	242311.68	130483567.33	2021-05-09 17:34:36	2021-05-09 17:34:36	8
1850	ZRX	2020-05-11	0.3423	0.398	0.4042	0.3344	29783900.26	11026021.36	2021-05-09 17:34:36	2021-05-09 17:34:36	6
3416	FIL	2020-08-21	27.62	30.71	30.12	25.83	221.99	6131.26	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3417	FIL	2020-08-22	28.32	27.62	28.88	26.15	214.99	6089.4	2021-05-07 19:24:30	2021-05-07 19:24:30	13
1622	ETH	2020-09-26	354.23	352.05	355.52	348.76	517452.21	183296884.19	2021-05-07 19:24:30	2021-05-07 19:24:30	10
3254	BCH	2021-03-13	593.63	538.49	616.08	568.73	322452.95	191416939.34	2021-05-09 17:34:36	2021-05-09 17:34:36	8
2913	BTC	2021-04-07	55951.98	58010.35	58628.19	55467.58	50347.59	2855410824.81	2021-05-09 17:34:36	2021-05-09 17:34:36	7
1623	ETH	2020-09-27	357.73	354.23	361.72	353.42	548129.55	196081931.5	2021-05-07 19:24:30	2021-05-07 19:24:30	10
2914	BTC	2021-04-08	58084.46	55951.98	58150.23	55711.07	25461.84	1458096433.7	2021-05-09 17:34:36	2021-05-09 17:34:36	7
3255	BCH	2021-03-14	552.58	593.63	578.19	552.47	220408.72	121794244.79	2021-05-09 17:34:36	2021-05-09 17:34:36	8
2915	BTC	2021-04-09	58106.85	58084.46	58881.94	57694.22	21314.29	1241735091.75	2021-05-09 17:34:36	2021-05-09 17:34:36	7
1562	ETH	2020-07-28	317.5	322.23	320.45	311.49	1676214.68	532201296.09	2021-05-07 19:24:30	2021-05-07 19:24:30	10
82971	BTC	2021-04-25	49120.97	50115.99	50576.4	47073.07	44241.37	2176241676.28	2021-05-09 17:34:36	2021-05-09 17:34:36	7
1563	ETH	2020-07-29	318.14	317.5	326.47	317.03	1074624.83	341878677.37	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1626	ETH	2020-09-30	359.82	359.82	361.43	355.4	519993.66	187102579.35	2021-05-07 19:24:30	2021-05-07 19:24:30	10
291620	DOT	2021-05-08	39.96	39.91	41.36	38.76	3007503.22	120190180.92	2021-05-09 23:34:40	2021-05-09 23:34:40	4
297044	BCH	2021-05-12	1232.41	1550.42	1640.92	1202.74	296048.15	432880898.3	2021-05-13 23:35:35	2021-05-13 23:35:35	8
4645	EOS	2020-12-30	2.612	2.636	2.666	2.538	3339048.32	8653592.54	2021-05-09 17:34:36	2021-05-09 17:34:36	9
302558	ETH	2021-05-22	2297.03	2435.86	2486.25	2158.17	1421431.75	3320459994.89	2021-05-23 23:37:53	2021-05-23 23:37:53	10
1113	SJCX	2020-05-06	0.0003661	0.0003612	0.0003661	0.0003661	0	0	2021-05-03 03:13:20	2021-05-03 03:13:20	11
307374	SJCX	2021-06-01	0.001467	0.001492	0.001467	0.001467	0	0	2021-06-02 23:40:10	2021-06-02 23:40:10	11
4661	EOS	2021-01-15	2.762	2.81	2.932	2.581	9664382.26	26705641.2	2021-05-09 17:34:36	2021-05-09 17:34:36	9
3418	FIL	2020-08-23	31	28.32	32.2	27.53	396.47	12292.43	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3419	FIL	2020-08-24	32.33	31	35.27	31.03	256.33	8287.17	2021-05-07 19:24:30	2021-05-07 19:24:30	13
4662	EOS	2021-01-16	2.778	2.762	2.882	2.707	7607198.31	21350150.93	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4663	EOS	2021-01-17	2.765	2.778	2.808	2.683	3994742.54	10996318.66	2021-05-09 17:34:36	2021-05-09 17:34:36	9
274038	EOS	2021-05-03	6.813	6.531	6.884	6.524	7196008.53	48455147.21	2021-05-09 17:34:36	2021-05-09 17:34:36	9
558	DOT	2020-10-30	4.086	4.057	4.158	3.921	515247.45	2087270.35	2021-05-09 17:34:36	2021-05-09 17:34:36	4
143	XTZ	2020-09-11	2.574	2.575	2.627	2.471	2030037.65	5147734.52	2021-05-07 19:24:31	2021-05-07 19:24:31	5
559	DOT	2020-10-31	4.183	4.086	4.272	4.067	219549.3	920496.11	2021-05-09 17:34:36	2021-05-09 17:34:36	4
645	DOT	2021-01-25	17.23	17.99	19.11	17.08	1823309.94	33031579.31	2021-05-09 17:34:36	2021-05-09 17:34:36	4
685	DOT	2021-03-06	33.38	33.63	34.19	32.07	736108.62	24434456.14	2021-05-09 17:34:36	2021-05-09 17:34:36	4
133198	DOT	2021-04-27	34.84	33.43	34.98	33.22	972042.45	33155971.33	2021-05-09 17:34:36	2021-05-09 17:34:36	4
284558	DOT	2021-05-07	39.91	41.57	42.67	38.42	1188987.68	48734438.43	2021-05-09 17:34:36	2021-05-09 17:34:36	4
312636	DOT	2021-06-12	20.76	20.96	21.24	19.57	1153196.01	23614642.91	2021-06-13 23:42:46	2021-06-13 23:42:46	4
317832	OCN	2021-06-23	0.0005118	0.0005642	0.0006103	0.0004331	104684397.24	53580.15	2021-06-24 23:45:18	2021-06-24 23:45:18	2
324398	BTC	2021-07-07	33880.79	34237.66	35066.82	33807.42	21784.2	752074468.65	2021-07-08 23:48:30	2021-07-08 23:48:30	7
3293	BCH	2021-04-21	910.49	941.77	999.13	900.68	159536.1	152019086.68	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3294	BCH	2021-04-22	854.67	910.49	971.08	842.47	205356.24	187444543.48	2021-05-09 17:34:36	2021-05-09 17:34:36	8
1219	SJCX	2020-08-20	0.0004745	0.0004704	0.0004745	0.0004745	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
4413	EOS	2020-05-12	2.44	2.402	2.468	2.397	1104518.02	2692184.43	2021-05-09 17:34:36	2021-05-09 17:34:36	9
1877	ZRX	2020-06-07	0.3219	0.3252	0.3283	0.3107	3480071.67	1114466.78	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2026	ZRX	2020-11-03	0.326	0.329	0.3297	0.3202	1270317.28	412249.56	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2027	ZRX	2020-11-04	0.318	0.326	0.326	0.3063	1480810.5	468605.75	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1668	ETH	2020-11-11	463.91	450.86	476.65	449.95	507733.44	236182074.76	2021-05-07 19:24:30	2021-05-07 19:24:30	10
2587	BTC	2020-05-16	9387.08	9311.69	9584.9	9224.32	37023.76	348262438.61	2021-05-09 17:34:36	2021-05-09 17:34:36	7
4664	EOS	2021-01-18	2.815	2.765	2.834	2.704	3553514.89	9866727.58	2021-05-09 17:34:36	2021-05-09 17:34:36	9
9132	ANT	2020-11-28	3.285	3.15	3.397	3.248	480254.12	1577841.04	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9133	ANT	2020-11-29	3.289	3.285	3.372	3.23	141048.95	463853.7	2021-05-09 17:34:37	2021-05-09 17:34:37	14
1669	ETH	2020-11-12	462.78	463.91	470.4	452.69	419454.5	193184163.08	2021-05-07 19:24:30	2021-05-07 19:24:30	10
44	XTZ	2020-06-04	2.999	3.042	3.081	2.914	2873204.35	8661243.36	2021-05-07 19:24:31	2021-05-07 19:24:31	5
2588	BTC	2020-05-17	9670.56	9387.08	9885.55	9334.23	52271.64	505834872.59	2021-05-09 17:34:36	2021-05-09 17:34:36	7
1671	ETH	2020-11-14	461.03	476.87	477.76	452.26	303539.72	140465129.76	2021-05-07 19:24:30	2021-05-07 19:24:30	10
270490	FIL	2021-05-02	162.62	164.58	166.83	156.48	138358.82	22164283.26	2021-05-07 19:24:30	2021-05-07 19:24:30	13
1672	ETH	2020-11-15	448.51	461.03	463.02	440.46	256400.31	115840989.63	2021-05-07 19:24:30	2021-05-07 19:24:30	10
32	XTZ	2020-05-23	2.758	2.799	2.833	2.727	1568290.04	4354690.68	2021-05-07 19:24:31	2021-05-07 19:24:31	5
297046	FIL	2021-05-12	126.96	143.24	145.74	124.57	498099.29	68429084.55	2021-05-13 23:35:36	2021-05-13 23:35:36	13
1220	SJCX	2020-08-21	0.0004611	0.0004745	0.0004611	0.0004611	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1358	SJCX	2021-01-06	0.001474	0.001362	0.001474	0.001474	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
4665	EOS	2021-01-19	2.793	2.815	2.93	2.787	6176356.81	17665630.12	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4666	EOS	2021-01-20	2.777	2.793	2.825	2.66	4167353.38	11424367.14	2021-05-09 17:34:36	2021-05-09 17:34:36	9
33	XTZ	2020-05-24	2.648	2.758	2.83	2.645	2009494.21	5512148.15	2021-05-07 19:24:31	2021-05-07 19:24:31	5
2589	BTC	2020-05-18	9722.73	9670.56	9943.74	9476.37	62325.78	606235218.3	2021-05-09 17:34:36	2021-05-09 17:34:36	7
9139	ANT	2020-12-05	3.285	3.189	3.367	3.22	85964.79	282368.73	2021-05-09 17:34:37	2021-05-09 17:34:37	14
280378	ANT	2021-05-04	8.599	9.883	9.222	8.423	690618.5	5938571.37	2021-05-09 17:34:37	2021-05-09 17:34:37	14
142146	BCH	2021-04-28	910.85	890.89	930	853.92	135090.5	120386192.53	2021-05-09 17:34:36	2021-05-09 17:34:36	8
146906	BCH	2021-04-30	995.92	880.77	1000.18	869.99	143868.29	137045942.88	2021-05-09 17:34:36	2021-05-09 17:34:36	8
34	XTZ	2020-05-25	2.735	2.648	2.742	2.628	1562512.67	4227825.48	2021-05-07 19:24:31	2021-05-07 19:24:31	5
2028	ZRX	2020-11-05	0.3485	0.318	0.3486	0.3144	1735646.3	577966.25	2021-05-09 17:34:36	2021-05-09 17:34:36	6
4681	EOS	2021-02-04	3.027	3.071	3.15	2.988	6669904.39	20383568.55	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4682	EOS	2021-02-05	3.316	3.027	3.379	3.014	12362738.48	39364441.92	2021-05-09 17:34:36	2021-05-09 17:34:36	9
2590	BTC	2020-05-19	9780.2	9722.73	9890.69	9471.96	60720.68	587660019.81	2021-05-09 17:34:36	2021-05-09 17:34:36	7
302560	EOS	2021-05-22	5.109	5.57	5.686	4.92	11230277.9	59410279.77	2021-05-23 23:37:53	2021-05-23 23:37:53	9
4689	EOS	2021-02-12	4.761	4.586	4.843	4.243	15631525.14	71557817.62	2021-05-09 17:34:36	2021-05-09 17:34:36	9
2029	ZRX	2020-11-06	0.3771	0.3485	0.3794	0.3451	3784685.66	1387063.33	2021-05-09 17:34:36	2021-05-09 17:34:36	6
62	XTZ	2020-06-22	2.68	2.586	2.707	2.574	1762487.62	4699915.56	2021-05-07 19:24:31	2021-05-07 19:24:31	5
2591	BTC	2020-05-20	9509.45	9780.2	9832.94	9323.82	61892.78	593918718.08	2021-05-09 17:34:36	2021-05-09 17:34:36	7
1673	ETH	2020-11-16	461.01	448.45	471.55	458.84	662300.65	305327654.61	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1674	ETH	2020-11-17	482.71	461.01	495.61	475.46	1029579	496984004.02	2021-05-07 19:24:30	2021-05-07 19:24:30	10
2030	ZRX	2020-11-07	0.3496	0.3771	0.3999	0.3408	4037037.5	1515391.04	2021-05-09 17:34:36	2021-05-09 17:34:36	6
238	XTZ	2020-12-15	2.233	2.225	2.261	2.182	1841193.85	4114517.96	2021-05-07 19:24:31	2021-05-07 19:24:31	5
302574	FIL	2021-05-22	72.18	76.78	77.37	66.83	839556.61	60682798.64	2021-05-23 23:37:52	2021-05-23 23:37:52	13
239	XTZ	2020-12-16	2.372	2.233	2.376	2.202	3373088.96	7731679.55	2021-05-07 19:24:31	2021-05-07 19:24:31	5
2599	BTC	2020-05-28	9579.71	9204.62	9619.34	9112.3	56625.62	530613444.11	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2031	ZRX	2020-11-08	0.3665	0.3496	0.3774	0.3461	1784140.11	648127.81	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2065	ZRX	2020-12-12	0.3916	0.3563	0.4051	0.3561	10050075.07	3902113.39	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2066	ZRX	2020-12-13	0.3957	0.3916	0.4049	0.3862	3449986.47	1361471.81	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2606	BTC	2020-06-04	9794.55	9666.06	9877.89	9470.9	43080.32	418578381.27	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2609	BTC	2020-06-07	9750.7	9671.46	9806.21	9410.33	39020.91	374577294.36	2021-05-09 17:34:36	2021-05-09 17:34:36	7
1687	ETH	2020-11-30	616.14	576	616.29	571.15	896172.25	535467109.2	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1688	ETH	2020-12-01	586.23	616.14	636.06	566.47	1268939.21	762366851.43	2021-05-07 19:24:30	2021-05-07 19:24:30	10
287118	ETH	2021-05-05	3528.86	3241.09	3549.08	3208.25	884171.46	2987271855.25	2021-05-07 19:24:30	2021-05-07 19:24:30	10
285655	ZRX	2021-05-06	2.053	1.882	2.099	1.836	27914291.98	55277306.58	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1359	SJCX	2021-01-07	0.001579	0.001474	0.001579	0.001579	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1360	SJCX	2021-01-08	0.001625	0.001579	0.001625	0.001625	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1361	SJCX	2021-01-09	0.001609	0.001625	0.001609	0.001609	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1362	SJCX	2021-01-10	0.001528	0.001609	0.001528	0.001528	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1363	SJCX	2021-01-11	0.00142	0.001528	0.00142	0.00142	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
240	XTZ	2020-12-17	2.299	2.372	2.437	2.273	5645202.95	13342578.91	2021-05-07 19:24:31	2021-05-07 19:24:31	5
241	XTZ	2020-12-18	2.329	2.299	2.346	2.258	2590315.95	5972224.94	2021-05-07 19:24:31	2021-05-07 19:24:31	5
1364	SJCX	2021-01-12	0.001362	0.00142	0.001362	0.001362	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
307376	FIL	2021-06-01	69.16	72.6	73.04	68	528878.12	36909385.63	2021-06-02 20:40:09	2021-06-02 20:40:09	13
312638	ATOM	2021-06-12	11.61	11.94	12.08	10.93	847697.6	9762427.46	2021-06-13 23:42:46	2021-06-13 23:42:46	3
317834	BCH	2021-06-23	472.65	443.99	485.61	429.68	92102.17	42997344.23	2021-06-24 23:45:18	2021-06-24 23:45:18	8
324400	SJCX	2021-07-07	0.001355	0.00137	0.001355	0.001355	0	0	2021-07-08 23:48:30	2021-07-08 23:48:30	11
9141	ANT	2020-12-07	3.391	3.459	3.439	3.317	95316.42	323184.62	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9159	ANT	2020-12-25	2.866	2.79	3.175	2.854	211533.14	606280.56	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9189	ANT	2021-01-24	4.239	3.712	5.023	3.729	1234192.8	5231551.43	2021-05-09 17:34:37	2021-05-09 17:34:37	14
10761	ATOM	2020-05-11	2.398	2.51	2.489	2.355	1643394.39	3940616.52	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10762	ATOM	2020-05-12	2.486	2.398	2.529	2.431	1635405.45	4065276.15	2021-05-09 17:34:36	2021-05-09 17:34:36	3
1480	ETH	2020-05-07	212.3	199.08	222.3	210.7	2774249.13	588968967.49	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1221	SJCX	2020-08-22	0.0004668	0.0004611	0.0004668	0.0004668	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1234	SJCX	2020-09-04	0.0004187	0.000407	0.0004187	0.0004187	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1269	SJCX	2020-10-09	0.0004424	0.0004372	0.0004424	0.0004424	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1479	ETH	2020-05-06	199.08	205.43	211.16	198.81	1716962.14	341816428.45	2021-05-03 02:16:33	2021-05-03 02:16:33	10
702	DOT	2021-03-23	34.22	35.26	36.25	33.79	892608.96	31144922.8	2021-05-09 17:34:36	2021-05-09 17:34:36	4
10744	ATOM	2020-04-24	2.751	2.425	2.839	2.419	867851.05	2333533.23	2021-04-24 20:20:48	2021-04-24 20:20:48	3
280402	DOT	2021-05-04	34.8	37.27	37.93	34.51	1432428.48	51541215.97	2021-05-09 17:34:36	2021-05-09 17:34:36	4
285656	ZRX	2021-05-07	2.017	2.053	2.224	1.95	26164626.44	55314525.88	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1481	ETH	2020-05-08	211.46	212.3	212.45	207.84	1911364.63	404185499.74	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1333	SJCX	2020-12-12	0.0007526	0.0007214	0.0007526	0.0007526	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1336	SJCX	2020-12-15	0.0007777	0.000771	0.0007777	0.0007777	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
4708	EOS	2021-03-03	3.831	3.671	4.065	3.649	7478367.22	29070886.15	2021-05-09 17:34:36	2021-05-09 17:34:36	9
2664	BTC	2020-08-01	11812.42	11352.72	11874.77	11240.98	63746.48	741252933.72	2021-05-09 17:34:36	2021-05-09 17:34:36	7
63	XTZ	2020-06-23	2.781	2.68	2.792	2.636	3081808.29	8419673.26	2021-05-07 19:24:31	2021-05-07 19:24:31	5
1482	ETH	2020-05-09	210.19	211.46	210.29	205.13	1808538.64	380138715.1	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1483	ETH	2020-05-10	187.72	210.19	199.16	186.84	2661983.34	499697462.27	2021-05-07 19:24:30	2021-05-07 19:24:30	10
9198	ANT	2021-02-02	4.167	4.249	4.522	4.121	349448.02	1456155.36	2021-05-09 17:34:37	2021-05-09 17:34:37	14
146914	ANT	2021-04-30	9.981	9.972	11.14	9.83	920379.76	9185921.26	2021-05-09 17:34:37	2021-05-09 17:34:37	14
4739	EOS	2021-04-03	5.414	6.254	6.477	5.213	17880263.07	104890770.77	2021-05-09 17:34:36	2021-05-09 17:34:36	9
68	XTZ	2020-06-28	2.373	2.315	2.43	2.286	2232228.31	5286625.86	2021-05-07 19:24:31	2021-05-07 19:24:31	5
98	XTZ	2020-07-28	2.84	2.827	2.898	2.728	5381109.83	15309288.42	2021-05-07 19:24:31	2021-05-07 19:24:31	5
4740	EOS	2021-04-04	6.289	5.414	6.298	5.339	10407445.31	60992470.03	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4741	EOS	2021-04-05	6.693	6.289	7.064	5.843	19495245.85	126167178.27	2021-05-09 17:34:36	2021-05-09 17:34:36	9
2611	BTC	2020-06-09	9779.7	9782.58	9884.83	9604.13	38753.41	376816490.4	2021-05-09 17:34:36	2021-05-09 17:34:36	7
1484	ETH	2020-05-11	185.77	187.72	186.46	179.86	2203062.33	409270199.69	2021-05-07 19:24:30	2021-05-07 19:24:30	10
4742	EOS	2021-04-06	6.64	6.693	7.083	6.204	15730983.44	104021565.4	2021-05-09 17:34:36	2021-05-09 17:34:36	9
10763	ATOM	2020-05-13	2.544	2.486	2.648	2.532	1434061.57	3648382.42	2021-05-09 17:34:36	2021-05-09 17:34:36	3
2665	BTC	2020-08-02	11063.5	11812.42	12106.89	10694.22	63507.01	721639453.44	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2666	BTC	2020-08-03	11234.73	11063.5	11476.29	10945.66	42060.85	473995003.36	2021-05-09 17:34:36	2021-05-09 17:34:36	7
10765	ATOM	2020-05-15	2.474	2.531	2.492	2.412	1704195.38	4216181.93	2021-05-09 17:34:36	2021-05-09 17:34:36	3
2667	BTC	2020-08-04	11194.18	11234.73	11415.16	11021.07	35052.44	393301819.23	2021-05-09 17:34:36	2021-05-09 17:34:36	7
10766	ATOM	2020-05-16	2.552	2.474	2.571	2.484	1640743.27	4187984.56	2021-05-09 17:34:36	2021-05-09 17:34:36	3
243	XTZ	2020-12-20	2.27	2.328	2.36	2.238	2729831.9	6283369.91	2021-05-07 19:24:31	2021-05-07 19:24:31	5
2668	BTC	2020-08-05	11752.05	11194.18	11791.62	11095.47	48146.58	555395574.17	2021-05-09 17:34:36	2021-05-09 17:34:36	7
297048	DOT	2021-05-12	34.52	38.72	42.44	33.97	2270741.6	88437558.59	2021-05-13 23:35:35	2021-05-13 23:35:35	4
303038	ZRX	2021-05-23	0.797	0.9601	0.9871	0.6271	28042733.05	21693763.47	2021-05-24 23:38:06	2021-05-24 23:38:06	6
307378	ATOM	2021-06-01	13.75	13.94	14.49	13.39	1153087.78	15991903.72	2021-06-02 23:40:10	2021-06-02 23:40:10	3
1485	ETH	2020-05-12	190.1	185.77	192.39	188.33	1333854.19	253560918.33	2021-05-07 19:24:30	2021-05-07 19:24:30	10
2669	BTC	2020-08-06	11771.27	11752.05	11909.81	11577.8	49916.86	587033759.68	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2670	BTC	2020-08-07	11603.82	11771.27	11912.62	11350.42	55865.16	651142052.53	2021-05-09 17:34:36	2021-05-09 17:34:36	7
244	XTZ	2020-12-21	2.183	2.27	2.313	2.123	4331490	9494351.15	2021-05-07 19:24:31	2021-05-07 19:24:31	5
1531	ETH	2020-06-27	220.77	229.5	226.62	218.42	869943.51	192053080.2	2021-05-07 19:24:30	2021-05-07 19:24:30	10
10767	ATOM	2020-05-17	2.546	2.552	2.662	2.538	1668266.41	4247162.71	2021-05-09 17:34:36	2021-05-09 17:34:36	3
245	XTZ	2020-12-22	2.183	2.183	2.194	2.078	2942040.65	6348354.6	2021-05-07 19:24:31	2021-05-07 19:24:31	5
1456	SJCX	2021-04-14	0.002519	0.002542	0.002519	0.002519	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1558	ETH	2020-07-24	279.6	275.65	287.68	268.61	612547.5	170698826.04	2021-05-07 19:24:30	2021-05-07 19:24:30	10
7744	SJCX	2021-04-23	0.002047	0.002069	0.002047	0.002047	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
78213	SJCX	2021-04-25	0.001965	0.002005	0.001965	0.001965	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
246	XTZ	2020-12-23	1.859	2.183	2.201	1.598	8530312.45	16642001.56	2021-05-07 19:24:31	2021-05-07 19:24:31	5
1576	ETH	2020-08-11	378.94	395.84	398.33	366.89	550483.67	211575268.55	2021-05-07 19:24:30	2021-05-07 19:24:30	10
10768	ATOM	2020-05-18	2.594	2.546	2.663	2.585	1993713	5171568.71	2021-05-09 17:34:36	2021-05-09 17:34:36	3
146362	SJCX	2021-04-29	0.002143	0.002195	0.002143	0.002143	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
312640	FIL	2021-06-12	69.6	70.77	71.27	66.21	331818.85	22852200.58	2021-06-13 23:42:45	2021-06-13 23:42:45	13
10769	ATOM	2020-05-19	2.614	2.594	2.636	2.576	1939234.1	5069532.99	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10770	ATOM	2020-05-20	2.701	2.614	2.703	2.556	2284480.03	6169853.99	2021-05-09 17:34:36	2021-05-09 17:34:36	3
2697	BTC	2020-09-03	10174.62	11397.9	11469.2	10017.43	82662.97	894736678.62	2021-05-09 17:34:36	2021-05-09 17:34:36	7
313090	DOT	2021-06-13	22.07	20.76	22.39	19.94	1260663.67	26525131.55	2021-06-14 19:42:58	2021-06-14 19:42:58	4
317836	DOT	2021-06-23	15.8	14.65	16.8	14.31	1917487.69	30429173.52	2021-06-24 22:45:18	2021-06-24 22:45:18	4
324402	ZRX	2021-07-07	0.7889	0.7127	0.8273	0.7038	13356079.51	10495677.44	2021-07-08 23:48:30	2021-07-08 23:48:30	6
329500	FIL	2021-07-18	46.86	45.6	47.42	45.55	72720.73	3401124.84	2021-07-19 22:50:59	2021-07-19 22:50:59	13
146338	DOT	2021-04-29	35.97	34	35.97	33.02	877899.57	29890756.59	2021-05-09 17:34:36	2021-05-09 17:34:36	4
125	XTZ	2020-08-24	3.68	3.517	3.808	3.446	5813578.68	21464262.4	2021-05-07 19:24:31	2021-05-07 19:24:31	5
1879	ZRX	2020-06-09	0.3486	0.3188	0.3499	0.3141	15928145.39	5373466.23	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1880	ZRX	2020-06-10	0.3873	0.3486	0.4282	0.3482	42038417.4	16159499.93	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1918	ZRX	2020-07-18	0.4184	0.3969	0.4299	0.387	12704089.57	5244687.21	2021-05-09 17:34:36	2021-05-09 17:34:36	6
3321	FIL	2020-05-18	0	0	0	0	0	0	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3322	FIL	2020-05-19	0	0	0	0	0	0	2021-05-07 19:24:30	2021-05-07 19:24:30	13
99	XTZ	2020-07-29	2.784	2.84	2.95	2.756	3579731.23	10215560.02	2021-05-07 19:24:31	2021-05-07 19:24:31	5
100	XTZ	2020-07-30	2.81	2.784	2.854	2.74	3011843.22	8426354.69	2021-05-07 19:24:31	2021-05-07 19:24:31	5
105	XTZ	2020-08-04	3.247	3.075	3.312	3.074	10021483.72	32056165.48	2021-05-07 19:24:31	2021-05-07 19:24:31	5
106	XTZ	2020-08-05	3.115	3.247	3.262	3.083	4559994.81	14482068.8	2021-05-07 19:24:31	2021-05-07 19:24:31	5
1736	ETH	2021-01-18	1258.31	1233.73	1260.68	1183.78	663535.05	813409622.3	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1771	ETH	2021-02-22	1778.07	1935.14	1937.57	1446.99	1512841.22	2656835977.99	2021-05-07 19:24:30	2021-05-07 19:24:30	10
2758	BTC	2020-11-03	14023.78	13571.24	14071.54	13300.84	21969.7	300271386.78	2021-05-09 17:34:36	2021-05-09 17:34:36	7
1881	ZRX	2020-06-11	0.3355	0.3873	0.4021	0.3296	21635823.72	7878177.61	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1772	ETH	2021-02-23	1578.19	1778.07	1781.51	1360.96	2496275.35	3829356462.28	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1882	ZRX	2020-06-12	0.3559	0.3355	0.3781	0.3311	9854439.22	3544457.06	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1773	ETH	2021-02-24	1625.17	1578.19	1713.25	1500.94	1086421.38	1769603424.19	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1911	ZRX	2020-07-11	0.4361	0.4104	0.4434	0.4081	14497853.57	6195022.24	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2767	BTC	2020-11-12	16306.53	15707.08	16348.99	15476.25	67322.57	1074746061.94	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2774	BTC	2020-11-19	17824.64	17786.27	18172.87	17365.08	48224.86	859856045.56	2021-05-09 17:34:36	2021-05-09 17:34:36	7
1912	ZRX	2020-07-12	0.4278	0.4361	0.443	0.4152	8441137.75	3585670.91	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2775	BTC	2020-11-20	18672.78	17824.64	18814.87	17764.07	51122.68	939934212.29	2021-05-09 17:34:36	2021-05-09 17:34:36	7
287119	ETH	2021-05-06	3491.74	3528.86	3607.98	3381.46	778852.98	2723700342.59	2021-05-07 23:24:32	2021-05-07 23:24:32	10
1913	ZRX	2020-07-13	0.4011	0.4278	0.4288	0.3954	13664853.14	5618400.44	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2785	BTC	2020-11-30	19686.87	18199.23	19850.23	18199.03	77985.3	1493787961.07	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2814	BTC	2020-12-29	27360.78	27039.45	27383.6	25864.25	55477.49	1479551411.61	2021-05-09 17:34:36	2021-05-09 17:34:36	7
1774	ETH	2021-02-25	1481.88	1625.17	1672.23	1459.54	803691.98	1278762281.98	2021-05-07 19:24:30	2021-05-07 19:24:30	10
297058	ZRX	2021-05-12	1.647	1.865	2.037	1.612	25586311.63	48434684.74	2021-05-13 22:35:34	2021-05-13 22:35:34	6
2859	BTC	2021-02-12	47435.54	48006.18	48930.99	46243.85	59549.61	2831634659.58	2021-05-09 17:34:36	2021-05-09 17:34:36	7
297050	ATOM	2021-05-12	22.93	26.98	27.8	22.35	2399606.86	62462953.11	2021-05-13 23:35:35	2021-05-13 23:35:35	3
2861	BTC	2021-02-14	48652.87	47222.32	49642.39	47096.92	37853.59	1841963034.08	2021-05-09 17:34:36	2021-05-09 17:34:36	7
1816	ETH	2021-04-08	2081.11	1964.18	2084.31	1950.13	305197.37	619720134.67	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1817	ETH	2021-04-09	2066.55	2081.11	2100	2049.84	300783.89	624512595.28	2021-05-07 19:24:30	2021-05-07 19:24:30	10
303040	OCN	2021-05-23	0.0008184	0.0008729	0.001238	0.0007345	110882836.19	90751.2	2021-05-24 23:38:06	2021-05-24 23:38:06	2
287120	ETH	2021-05-07	3483.96	3491.74	3592.46	3360.6	578858.34	2017976762.42	2021-05-08 23:24:45	2021-05-08 23:24:45	10
4691	EOS	2021-02-14	5.071	5.562	5.608	4.874	19173294.81	100207539.96	2021-05-09 17:34:36	2021-05-09 17:34:36	9
681	DOT	2021-03-02	36.2	35.68	37.9	34.43	1825853.11	66030132.29	2021-05-09 17:34:36	2021-05-09 17:34:36	4
712	DOT	2021-04-02	40.99	37.44	41.33	36.64	836501.62	32718466.04	2021-05-09 17:34:36	2021-05-09 17:34:36	4
1914	ZRX	2020-07-14	0.395	0.4011	0.4049	0.3808	12410327.81	4872597.31	2021-05-09 17:34:36	2021-05-09 17:34:36	6
713	DOT	2021-04-03	41.35	40.99	46.7	40.91	1759057.32	77170065.2	2021-05-09 17:34:36	2021-05-09 17:34:36	4
312642	OCN	2021-06-12	0.0008057	0.0008243	0.0008531	0.000782	42836926.87	34512.46	2021-06-13 23:42:46	2021-06-13 23:42:46	2
313096	ZRX	2021-06-13	0.8962	0.852	0.9014	0.8102	5805283.68	4940410.72	2021-06-14 23:43:00	2021-06-14 23:43:00	6
1919	ZRX	2020-07-19	0.4201	0.4184	0.4306	0.4043	8890572.47	3728164.66	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2862	BTC	2021-02-15	47936.51	48652.87	49031.74	45910	52683.57	2502097939.18	2021-05-09 17:34:36	2021-05-09 17:34:36	7
1920	ZRX	2020-07-20	0.3961	0.4201	0.4274	0.3948	7203769.27	2951930.63	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1933	ZRX	2020-08-02	0.3797	0.3992	0.4098	0.3632	7252259.75	2808272.9	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2892	BTC	2021-03-17	58909	56925.01	58975.28	54156.11	62035.71	3493543493.16	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2893	BTC	2021-03-18	57643.32	58909	60077.79	57022.2	54289.71	3178687259.25	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2912	BTC	2021-04-06	58010.35	59119.56	59464.31	57369.44	26304.15	1535666142.46	2021-05-09 17:34:36	2021-05-09 17:34:36	7
1934	ZRX	2020-08-03	0.3823	0.3797	0.3922	0.3748	3748813.03	1441307.15	2021-05-09 17:34:36	2021-05-09 17:34:36	6
114	XTZ	2020-08-13	4.144	4.364	4.49	3.949	10784271.94	45277878.91	2021-05-07 19:24:31	2021-05-07 19:24:31	5
115	XTZ	2020-08-14	4.116	4.144	4.24	4.014	7162217.2	29349716.38	2021-05-07 19:24:31	2021-05-07 19:24:31	5
1935	ZRX	2020-08-04	0.3975	0.3823	0.4079	0.382	7624398.78	3016143.42	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1936	ZRX	2020-08-05	0.3979	0.3975	0.4102	0.3918	5223791.83	2098480.55	2021-05-09 17:34:36	2021-05-09 17:34:36	6
307388	OCN	2021-06-01	0.000843	0.0008122	0.001001	0.0007639	126529341.1	106658.36	2021-06-02 21:40:09	2021-06-02 21:40:09	2
317858	ETH	2021-06-23	1968.56	1880.83	2044.91	1827.2	714905.63	1416402416.38	2021-06-24 23:45:18	2021-06-24 23:45:18	10
1937	ZRX	2020-08-06	0.4134	0.3979	0.4174	0.3861	6582597.54	2655564.66	2021-05-09 17:34:36	2021-05-09 17:34:36	6
317838	EOS	2021-06-23	3.674	3.388	3.807	3.264	5372011.31	19452602.4	2021-06-24 23:45:18	2021-06-24 23:45:18	9
1938	ZRX	2020-08-07	0.3934	0.4134	0.4295	0.3853	9150074.85	3738215.57	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2748	BTC	2020-10-24	13126.13	12937.2	13167.31	12886.47	20932.05	273005904.67	2021-05-09 17:34:36	2021-05-09 17:34:36	7
324416	ANT	2021-07-07	3.936	4.029	4.151	3.93	51354.01	206243.78	2021-07-08 23:48:30	2021-07-08 23:48:30	14
324404	FIL	2021-07-07	56.43	56.98	58	56.37	176578.41	10130005.03	2021-07-08 22:48:30	2021-07-08 22:48:30	13
329992	BCH	2021-07-19	414.97	438.42	441.31	413.86	54048.06	22999579.28	2021-07-20 22:51:12	2021-07-20 22:51:12	8
329508	ATOM	2021-07-18	10.98	11.02	11.56	10.76	908518.57	10108549.33	2021-07-19 22:50:59	2021-07-19 22:50:59	3
338210	FIL	2021-08-06	64.17	57.86	64.96	57.22	632601.53	38546196.7	2021-08-07 23:55:21	2021-08-07 23:55:21	13
338208	ATOM	2021-08-06	13.59	13.03	14.03	12.74	1224834.97	16485269.09	2021-08-07 23:55:21	2021-08-07 23:55:21	3
1109	SJCX	2020-05-02	0.0003592	0.0003532	0.0003592	0.0003592	0	0	2021-05-01 22:04:03	2021-05-01 22:04:03	11
8953	ANT	2020-06-02	1.062	1.115	1.076	1.018	25738.46	27331.62	2021-05-09 17:34:37	2021-05-09 17:34:37	14
1809	ETH	2021-04-01	1967.67	1919.08	1982.01	1888.82	452661.12	878675921.08	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1810	ETH	2021-04-02	2134.46	1967.67	2144.04	1949.57	575612.31	1171559202.46	2021-05-07 19:24:30	2021-05-07 19:24:30	10
2678	BTC	2020-08-15	11860.91	11774.52	11981.62	11697.88	31094.75	369258184.57	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2679	BTC	2020-08-16	11917.97	11860.91	11934.96	11701.22	22029.01	260716863.02	2021-05-09 17:34:36	2021-05-09 17:34:36	7
235	XTZ	2020-12-12	2.135	2.078	2.16	2.072	2016040.71	4291933.69	2021-05-07 19:24:31	2021-05-07 19:24:31	5
2257	OCN	2020-06-21	0.0003349	0.0003433	0.0003736	0.0003349	102395002.16	34293.12	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2680	BTC	2020-08-17	12301.19	11917.97	12474.73	11775.66	56064.01	682170133.05	2021-05-09 17:34:36	2021-05-09 17:34:36	7
10863	ATOM	2020-08-21	5.605	6.307	6.693	5.598	1459047.22	9027290.99	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10864	ATOM	2020-08-22	6.423	5.605	6.483	5.396	1576374.51	9656790.73	2021-05-09 17:34:36	2021-05-09 17:34:36	3
237	XTZ	2020-12-14	2.225	2.23	2.266	2.176	1659419.7	3691550.55	2021-05-07 19:24:31	2021-05-07 19:24:31	5
1811	ETH	2021-04-03	2009.19	2134.46	2138.57	2002.95	465878.89	966547451.67	2021-05-07 19:24:30	2021-05-07 19:24:30	10
2394	OCN	2020-11-05	0.0002168	0.0002174	0.0002293	0.0002126	64167027.75	13910.31	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2395	OCN	2020-11-06	0.0002327	0.0002168	0.000251	0.0002282	53037393.51	12343.03	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2681	BTC	2020-08-18	11956.69	12301.19	12397.4	11855.24	49904.68	604246043.52	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2682	BTC	2020-08-19	11760.37	11956.69	12021.8	11592.2	50094.06	590122894.96	2021-05-09 17:34:36	2021-05-09 17:34:36	7
1963	ZRX	2020-09-01	0.602	0.613	0.6326	0.5976	5559987.16	3408054.66	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1812	ETH	2021-04-04	2076.62	2009.19	2092.26	1981.36	268891.15	549224714.37	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1175	SJCX	2020-07-07	0.0003703	0.0003739	0.0003703	0.0003703	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
10865	ATOM	2020-08-23	8.532	6.423	8.603	6.335	8075657.74	61384766.58	2021-05-09 17:34:36	2021-05-09 17:34:36	3
2199	OCN	2020-04-24	0.0003397	0.0003565	0.0003716	0.0002891	268072393.03	91074.11	2021-04-24 20:28:41	2021-04-24 20:28:41	2
1873	ZRX	2020-06-03	0.3301	0.3249	0.335	0.3245	5163936.94	1703475	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2683	BTC	2020-08-20	11863.43	11760.37	11888.72	11679.03	43209.58	510502416.84	2021-05-09 17:34:36	2021-05-09 17:34:36	7
1813	ETH	2021-04-05	2107.73	2076.62	2130.42	2003.31	350641.1	729654195.02	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1964	ZRX	2020-09-02	0.5583	0.602	0.6051	0.518	7799205.91	4389154.67	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2695	BTC	2020-09-01	11926.69	11657.81	12062.06	11540.42	45202.86	537292263.85	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2696	BTC	2020-09-02	11397.9	11926.69	11954.28	11219.19	53717.87	618129314.2	2021-05-09 17:34:36	2021-05-09 17:34:36	7
199	XTZ	2020-11-06	2.093	1.885	2.1	1.88	2316158.32	4680671.71	2021-05-07 19:24:31	2021-05-07 19:24:31	5
8954	ANT	2020-06-03	1.132	1.062	1.16	1.067	7770.78	8795.71	2021-05-09 17:34:37	2021-05-09 17:34:37	14
1814	ETH	2021-04-06	2112.29	2107.73	2150.74	2045.94	469974.9	990663666.13	2021-05-07 19:24:30	2021-05-07 19:24:30	10
200	XTZ	2020-11-07	2.022	2.093	2.213	1.959	2819326.15	5915309.67	2021-05-07 19:24:31	2021-05-07 19:24:31	5
1176	SJCX	2020-07-08	0.0003776	0.0003703	0.0003776	0.0003776	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1270	SJCX	2020-10-10	0.0004521	0.0004424	0.0004521	0.0004521	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1970	ZRX	2020-09-08	0.4331	0.4594	0.463	0.4129	3626798.27	1590474.19	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2396	OCN	2020-11-07	0.0002441	0.0002327	0.0002484	0.0002223	59899834.98	14619.11	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2197	OCN	2020-04-22	0.0002819	0.0002616	0.0002965	0.0002636	265018050.28	74703.71	2021-04-22 21:03:21	2021-04-22 21:03:21	2
2412	OCN	2020-11-23	0.000268	0.0002688	0.0002924	0.0002619	165636122.82	44393.33	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2518	OCN	2021-03-09	0.0006927	0.0006604	0.0007114	0.000674	78206905.18	54172.12	2021-05-09 17:34:37	2021-05-09 17:34:37	2
8955	ANT	2020-06-04	1.095	1.132	1.194	1.095	18540.74	20302.68	2021-05-09 17:34:37	2021-05-09 17:34:37	14
2519	OCN	2021-03-10	0.0006644	0.0006927	0.0007003	0.0006285	85789266.03	56996.94	2021-05-09 17:34:37	2021-05-09 17:34:37	2
8956	ANT	2020-06-05	1.076	1.095	1.106	1.065	8402.05	9038.44	2021-05-09 17:34:37	2021-05-09 17:34:37	14
1951	ZRX	2020-08-20	0.6121	0.5146	0.6878	0.5053	38330800.05	23009349.68	2021-05-09 17:34:36	2021-05-09 17:34:36	6
305	XTZ	2021-02-20	4.64	4.973	5.144	4.351	11037038.6	53650016.75	2021-05-07 19:24:31	2021-05-07 19:24:31	5
2549	OCN	2021-04-09	0.001467	0.001519	0.001653	0.001467	11726330.42	17205.46	2021-05-09 17:34:37	2021-05-09 17:34:37	2
297060	XTZ	2021-05-12	5.936	7.134	7.331	5.868	10576553.28	71250223.63	2021-05-13 23:35:35	2021-05-13 23:35:35	5
201	XTZ	2020-11-08	2.091	2.022	2.153	1.985	2078959.31	4314176.72	2021-05-07 19:24:31	2021-05-07 19:24:31	5
1971	ZRX	2020-09-09	0.4597	0.4331	0.4734	0.4214	3966246.22	1801346.99	2021-05-09 17:34:36	2021-05-09 17:34:36	6
297052	ETH	2021-05-12	3811.29	4178.02	4379.79	3777.24	1321151.72	5489764411.82	2021-05-13 21:35:34	2021-05-13 21:35:34	10
202	XTZ	2020-11-09	2.113	2.091	2.153	2.03	1201602.62	2509538.48	2021-05-07 19:24:31	2021-05-07 19:24:31	5
8957	ANT	2020-06-06	1.095	1.076	1.102	1.056	16988.11	18598.74	2021-05-09 17:34:37	2021-05-09 17:34:37	14
8958	ANT	2020-06-07	1.1	1.095	1.115	1.064	7266.33	7992.08	2021-05-09 17:34:37	2021-05-09 17:34:37	14
203	XTZ	2020-11-10	2.154	2.113	2.191	2.098	1975918.81	4235721.11	2021-05-07 19:24:31	2021-05-07 19:24:31	5
8959	ANT	2020-06-08	1.079	1.1	1.136	1.058	11475.57	12382.35	2021-05-09 17:34:37	2021-05-09 17:34:37	14
303042	ETH	2021-05-23	2098.57	2297.03	2382.3	1736.21	2464645.1	4985757879.79	2021-05-24 22:38:06	2021-05-24 22:38:06	10
2198	OCN	2020-04-23	0.0003565	0.0002819	0.0003676	0.0002674	429285526.2	153042.69	2021-04-23 22:51:51	2021-04-23 22:51:51	2
308	XTZ	2021-02-23	3.55	4.276	4.295	2.929	24030264.04	83293394.19	2021-05-07 19:24:31	2021-05-07 19:24:31	5
307392	ANT	2021-06-01	4.809	4.993	5.026	4.681	451418.28	2170964.48	2021-06-02 22:40:09	2021-06-02 22:40:09	14
2062	ZRX	2020-12-09	0.3815	0.379	0.3843	0.3584	5986177.95	2242787.98	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2063	ZRX	2020-12-10	0.3699	0.3815	0.3828	0.3649	3564780.22	1320552.17	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2749	BTC	2020-10-25	13041.21	13126.13	13346.7	12910.39	28208.48	368884232.62	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2750	BTC	2020-10-26	13069.43	13041.21	13241.79	12797.05	35322.99	460984686.3	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2778	BTC	2020-11-23	18385.74	18430.59	18761.66	18010.51	48994.17	902518528.75	2021-05-09 17:34:36	2021-05-09 17:34:36	7
313086	ATOM	2021-06-13	12.54	11.61	12.54	11.31	525802.26	6265255.43	2021-06-14 23:43:00	2021-06-14 23:43:00	3
312644	BCH	2021-06-12	579.99	576.98	591.51	548.17	60246.37	34298790.27	2021-06-13 23:42:45	2021-06-13 23:42:45	8
317830	XTZ	2021-06-23	2.686	2.372	2.784	2.287	5137751.46	13368182.46	2021-06-24 23:45:18	2021-06-24 23:45:18	5
329510	SJCX	2021-07-18	0.001272	0.001262	0.001272	0.001272	0	0	2021-07-19 23:50:59	2021-07-19 23:50:59	11
2895	BTC	2021-03-20	58101.34	58060.21	59911.7	57837.79	28696.46	1687922804.56	2021-05-09 17:34:36	2021-05-09 17:34:36	7
1874	ZRX	2020-06-04	0.326	0.3301	0.3329	0.3196	4667498.42	1529194.91	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1394	SJCX	2021-02-11	0.00192	0.001794	0.00192	0.00192	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
4615	EOS	2020-11-30	3.261	3.034	3.283	3	5608341.16	17661090.18	2021-05-09 17:34:36	2021-05-09 17:34:36	9
2896	BTC	2021-03-21	57374.95	58101.34	58621.34	55635.61	34236.52	1958214099.07	2021-05-09 17:34:36	2021-05-09 17:34:36	7
1395	SJCX	2021-02-12	0.001897	0.00192	0.001897	0.001897	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1875	ZRX	2020-06-05	0.3204	0.326	0.3287	0.3203	3113434.42	1009564.87	2021-05-09 17:34:36	2021-05-09 17:34:36	6
81141	XTZ	2021-04-25	4.452	4.454	4.795	4.24	3915566.71	17652615.87	2021-05-07 19:24:31	2021-05-07 19:24:31	5
4616	EOS	2020-12-01	2.999	3.261	3.337	2.924	6603255.75	20662128.97	2021-05-09 17:34:36	2021-05-09 17:34:36	9
81142	XTZ	2021-04-26	5.233	4.452	5.348	4.403	5950089.02	29801638.25	2021-05-07 19:24:31	2021-05-07 19:24:31	5
78214	SJCX	2021-04-26	0.002162	0.001965	0.002162	0.002162	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
4656	EOS	2021-01-10	3.065	3.63	3.922	2.862	36303619.5	120211911.77	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4657	EOS	2021-01-11	2.669	3.065	3.073	2.384	24797079.77	66705372.82	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4658	EOS	2021-01-12	2.595	2.669	2.772	2.533	7890697.37	20965791.21	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4683	EOS	2021-02-06	3.216	3.316	3.328	3.139	7161207.93	23090101.57	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4684	EOS	2021-02-07	3.444	3.216	3.596	3.033	19470259.08	65313712.12	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4685	EOS	2021-02-08	3.601	3.444	3.601	3.352	10282921.1	35842875.9	2021-05-09 17:34:36	2021-05-09 17:34:36	9
1876	ZRX	2020-06-06	0.3252	0.3204	0.3285	0.3176	3245912.54	1048873.19	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1953	ZRX	2020-08-22	0.7267	0.6924	0.8395	0.6191	48039463.46	35246452.89	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1577	ETH	2020-08-12	387.19	378.94	389.5	366.09	433691.32	165583849.9	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1584	ETH	2020-08-19	407.85	422.38	426.84	394.63	593539.86	242013764.61	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1599	ETH	2020-09-03	382.46	439.83	450.71	374.19	1147290.59	473102908.76	2021-05-07 19:24:30	2021-05-07 19:24:30	10
4686	EOS	2021-02-09	4.17	3.601	4.315	3.491	24582663.66	96432427.19	2021-05-09 17:34:36	2021-05-09 17:34:36	9
142112	BTC	2021-04-28	54877.94	55073.48	56461.55	53886.63	42647.15	2339383717.48	2021-05-09 17:34:36	2021-05-09 17:34:36	7
307882	ETH	2021-06-02	2706.52	2634.23	2801.72	2553.06	590403.58	1593115620.38	2021-06-03 23:40:24	2021-06-03 23:40:24	10
146328	BTC	2021-04-29	53581.58	54877.94	55217.24	52399.42	43948.76	2359198137.55	2021-05-09 17:34:36	2021-05-09 17:34:36	7
1954	ZRX	2020-08-23	0.7228	0.7267	0.7988	0.6903	21915935.6	16165874.2	2021-05-09 17:34:36	2021-05-09 17:34:36	6
146910	BTC	2021-04-30	57757.97	53581.58	57984.34	53089.93	48771	2719315702.2	2021-05-09 17:34:36	2021-05-09 17:34:36	7
4687	EOS	2021-02-10	4.132	4.17	4.541	3.667	29437349.48	121045314.84	2021-05-09 17:34:36	2021-05-09 17:34:36	9
159198	BTC	2021-05-01	57843.16	57757.97	58498.65	57057.4	26146.3	1511783659.93	2021-05-09 17:34:36	2021-05-09 17:34:36	7
1955	ZRX	2020-08-24	0.7297	0.7228	0.7595	0.7003	12029069.87	8705941.93	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1956	ZRX	2020-08-25	0.6483	0.7297	0.7335	0.6012	14926570.53	9906989.89	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1368	SJCX	2021-01-16	0.001441	0.001472	0.001441	0.001441	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1600	ETH	2020-09-04	385.91	382.46	400.18	364.11	622038.92	239570368.52	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1381	SJCX	2021-01-29	0.00137	0.001338	0.00137	0.00137	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1601	ETH	2020-09-05	335.24	385.91	394.66	310.93	1499688.45	522017043.23	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1670	ETH	2020-11-13	476.87	462.78	477.97	458.1	408493.75	191393679.41	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1815	ETH	2021-04-07	1964.18	2112.29	2128.54	1931.07	623594.91	1252547038.35	2021-05-07 19:24:30	2021-05-07 19:24:30	10
297054	ANT	2021-05-12	8.223	9.8	8.757	8.208	719232.91	5913984.44	2021-05-13 23:35:35	2021-05-13 23:35:35	14
1382	SJCX	2021-01-30	0.001373	0.00137	0.001373	0.001373	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
4688	EOS	2021-02-11	4.586	4.132	4.678	4.008	18425008.87	80451659.25	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4715	EOS	2021-03-10	3.994	4.169	4.191	3.897	5549915.64	22424421.48	2021-05-09 17:34:36	2021-05-09 17:34:36	9
79311	EOS	2021-04-25	5.004	5.097	5.46	4.631	7916447.75	40039109.7	2021-05-09 17:34:36	2021-05-09 17:34:36	9
1957	ZRX	2020-08-26	0.6593	0.6483	0.6936	0.6171	9821935.71	6463892.8	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1958	ZRX	2020-08-27	0.6079	0.6593	0.6782	0.5823	8649973.12	5363474.46	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1959	ZRX	2020-08-28	0.6389	0.6079	0.647	0.5938	6034472.51	3791927.49	2021-05-09 17:34:36	2021-05-09 17:34:36	6
303044	BTC	2021-05-23	34716.84	37491.5	38304.55	31157.18	131584.71	4494413873.1	2021-05-24 23:38:06	2021-05-24 23:38:06	7
312682	SJCX	2021-06-12	0.001422	0.001494	0.001422	0.001422	0	0	2021-06-13 23:42:46	2021-06-13 23:42:46	11
1960	ZRX	2020-08-29	0.6437	0.6389	0.6683	0.6223	6729649.61	4359618.11	2021-05-09 17:34:36	2021-05-09 17:34:36	6
324422	EOS	2021-07-07	3.823	3.881	3.98	3.818	1587231.49	6220808.22	2021-07-08 22:48:30	2021-07-08 22:48:30	9
1961	ZRX	2020-08-30	0.637	0.6437	0.6524	0.626	4980850.24	3181096.74	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1972	ZRX	2020-09-10	0.4707	0.4597	0.499	0.4548	5153132.02	2445547.94	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1973	ZRX	2020-09-11	0.5305	0.4707	0.5343	0.4706	13168354.64	6693541.02	2021-05-09 17:34:36	2021-05-09 17:34:36	6
79312	EOS	2021-04-26	5.863	5.004	5.894	4.94	9317088.53	51576664.63	2021-05-09 17:34:36	2021-05-09 17:34:36	9
1383	SJCX	2021-01-31	0.001326	0.001373	0.001326	0.001326	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1384	SJCX	2021-02-01	0.001341	0.001326	0.001341	0.001341	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1385	SJCX	2021-02-02	0.001421	0.001341	0.001421	0.001421	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
317894	FIL	2021-06-23	58.77	49.34	59.14	47.55	746003.5	40863536.1	2021-06-24 23:45:19	2021-06-24 23:45:19	13
329504	DOT	2021-07-18	12.65	12.29	12.93	12.29	1697033.15	21516581.12	2021-07-19 23:50:59	2021-07-19 23:50:59	4
1974	ZRX	2020-09-12	0.5148	0.5305	0.5346	0.5072	7636563.82	3968665.6	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1975	ZRX	2020-09-13	0.4891	0.5148	0.5148	0.4691	5635911.96	2776797.08	2021-05-09 17:34:36	2021-05-09 17:34:36	6
338212	OCN	2021-08-06	0.001157	0.001217	0.001735	0.001128	80980884.52	93690.35	2021-08-07 23:55:21	2021-08-07 23:55:21	2
343366	XTZ	2021-08-17	3.404	3.639	3.802	3.383	4762932.08	17283302.79	2021-08-18 23:57:54	2021-08-18 23:57:54	5
348992	EOS	2021-08-29	5.06	5.006	5.245	4.976	6257946.41	31804506.84	2021-08-30 23:00:39	2021-08-30 23:00:39	9
348994	SJCX	2021-08-29	0.001952	0.001957	0.001952	0.001952	0	0	2021-08-30 20:00:38	2021-08-30 20:00:38	11
354936	ETH	2021-09-10	3209.41	3424.24	3513.41	3149.58	522874.87	1736829807.16	2021-09-11 23:03:23	2021-09-11 23:03:23	10
354464	ZRX	2021-09-09	1.068	1.006	1.077	0.9855	16451688.99	16949514.06	2021-09-10 23:03:10	2021-09-10 23:03:10	6
354932	BCH	2021-09-10	628.88	661.21	673.85	618.58	56598.74	36429463.39	2021-09-11 23:03:24	2021-09-11 23:03:24	8
46	XTZ	2020-06-06	2.925	2.936	2.969	2.905	1192221.83	3490190.43	2021-05-07 19:24:31	2021-05-07 19:24:31	5
47	XTZ	2020-06-07	2.888	2.925	2.939	2.813	1922325.4	5522104.87	2021-05-07 19:24:31	2021-05-07 19:24:31	5
1853	ZRX	2020-05-14	0.3433	0.349	0.3671	0.3374	15510386.76	5414726.89	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1869	ZRX	2020-05-30	0.3376	0.3322	0.3416	0.3282	6174151.89	2072887.29	2021-05-09 17:34:36	2021-05-09 17:34:36	6
3347	FIL	2020-06-13	0	0	0	0	0	0	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3348	FIL	2020-06-14	0	0	0	0	0	0	2021-05-07 19:24:30	2021-05-07 19:24:30	13
1238	SJCX	2020-09-08	0.0004051	0.0004152	0.0004051	0.0004051	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
560	DOT	2020-11-01	4.222	4.183	4.222	4.113	140526.43	585992.26	2021-05-09 17:34:36	2021-05-09 17:34:36	4
2798	BTC	2020-12-13	19169.05	18814.98	19414.65	18733.67	30902.88	592021817.57	2021-05-09 17:34:36	2021-05-09 17:34:36	7
8978	ANT	2020-06-27	1.272	1.362	1.352	1.167	64437.49	81952.13	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9028	ANT	2020-08-16	6.11	5.997	6.371	5.984	454560.23	2777519.02	2021-05-09 17:34:37	2021-05-09 17:34:37	14
561	DOT	2020-11-02	4.037	4.222	4.264	3.97	368720.47	1517243.65	2021-05-09 17:34:36	2021-05-09 17:34:36	4
1239	SJCX	2020-09-09	0.0004092	0.0004051	0.0004092	0.0004092	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
562	DOT	2020-11-03	4.029	4.037	4.066	3.898	244601.53	966553.87	2021-05-09 17:34:36	2021-05-09 17:34:36	4
649	DOT	2021-01-29	16.82	16.9	17.78	16.01	1726571.52	29023887.45	2021-05-09 17:34:36	2021-05-09 17:34:36	4
652	DOT	2021-02-01	16.46	16.13	16.56	15.68	953818.19	15356999.6	2021-05-09 17:34:36	2021-05-09 17:34:36	4
2799	BTC	2020-12-14	19274.69	19169.05	19339.6	19001.22	23827.71	456841099.92	2021-05-09 17:34:36	2021-05-09 17:34:36	7
48	XTZ	2020-06-08	2.948	2.888	2.959	2.864	1635093.39	4772069.38	2021-05-07 19:24:31	2021-05-07 19:24:31	5
9029	ANT	2020-08-17	6.167	6.11	6.374	5.773	574598.31	3543310.21	2021-05-09 17:34:37	2021-05-09 17:34:37	14
297056	SJCX	2021-05-12	0.00198	0.00227	0.00198	0.00198	0	0	2021-05-13 23:35:35	2021-05-13 23:35:35	11
3189	BCH	2021-01-07	448.88	454.36	493.1	448.88	778631.15	349512644.92	2021-05-09 17:34:36	2021-05-09 17:34:36	8
9030	ANT	2020-08-18	5.758	6.167	6.472	5.657	826199.47	4757539.03	2021-05-09 17:34:37	2021-05-09 17:34:37	14
2800	BTC	2020-12-15	19441.96	19274.69	19553.23	19060.06	42331.4	819839290.04	2021-05-09 17:34:36	2021-05-09 17:34:36	7
3286	BCH	2021-04-14	815.12	746.5	845.01	746.11	361721.74	290349785.93	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3349	FIL	2020-06-15	0	0	0	0	0	0	2021-05-07 19:24:30	2021-05-07 19:24:30	13
2801	BTC	2020-12-16	21352.13	19441.96	21527.36	19299.86	95374.74	1949841494.52	2021-05-09 17:34:36	2021-05-09 17:34:36	7
1240	SJCX	2020-09-10	0.0004138	0.0004092	0.0004138	0.0004138	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1241	SJCX	2020-09-11	0.0004159	0.0004138	0.0004159	0.0004159	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1242	SJCX	2020-09-12	0.0004179	0.0004159	0.0004179	0.0004179	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1820	ETH	2021-04-12	2137.79	2150.54	2200.09	2102.81	321554.58	690437458.28	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1821	ETH	2021-04-13	2298.66	2137.79	2314.02	2136.24	542269.51	1214602558.5	2021-05-07 19:24:30	2021-05-07 19:24:30	10
9033	ANT	2020-08-21	4.92	5.36	5.214	4.797	432804.19	2129341.64	2021-05-09 17:34:37	2021-05-09 17:34:37	14
10866	ATOM	2020-08-24	8.204	8.532	8.56	7.677	2843649.45	22933863.38	2021-05-09 17:34:36	2021-05-09 17:34:36	3
3350	FIL	2020-06-16	0	0	0	0	0	0	2021-05-07 19:24:30	2021-05-07 19:24:30	13
2813	BTC	2020-12-28	27039.45	26249.27	27461.63	26085.96	52027.49	1402005893.58	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2815	BTC	2020-12-30	28889.61	27360.78	28990.2	27360.09	70752.88	1993721842.2	2021-05-09 17:34:36	2021-05-09 17:34:36	7
9179	ANT	2021-01-14	3.27	3.292	3.602	3.223	281578.12	920727.36	2021-05-09 17:34:37	2021-05-09 17:34:37	14
3443	FIL	2020-09-17	46.59	46.68	46.9	46.46	36.88	1718.37	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3444	FIL	2020-09-18	44.42	46.59	46.56	41.56	174.28	7741.3	2021-05-07 19:24:30	2021-05-07 19:24:30	13
9180	ANT	2021-01-15	3.348	3.27	3.481	2.965	453669.91	1519010.88	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9181	ANT	2021-01-16	3.493	3.348	3.606	3.273	426602.71	1490127.19	2021-05-09 17:34:37	2021-05-09 17:34:37	14
303046	SJCX	2021-05-23	0.001389	0.0015	0.001389	0.001389	0	0	2021-05-24 23:38:06	2021-05-24 23:38:06	11
90	XTZ	2020-07-20	2.77	2.987	2.991	2.744	5851397.64	16726608.03	2021-05-07 19:24:31	2021-05-07 19:24:31	5
2827	BTC	2021-01-11	35496.03	38202.08	38266.42	30308.4	240328	8100819368.26	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2833	BTC	2021-01-17	35839.51	36025.26	36860.67	33854.83	50913.3	1806688237.48	2021-05-09 17:34:36	2021-05-09 17:34:36	7
91	XTZ	2020-07-21	3.025	2.77	3.077	2.748	6034597.41	17799991.03	2021-05-07 19:24:31	2021-05-07 19:24:31	5
3445	FIL	2020-09-19	44.36	44.42	45.01	42.12	28.73	1274.37	2021-05-07 19:24:30	2021-05-07 19:24:30	13
92	XTZ	2020-07-22	3.11	3.025	3.138	2.923	3949647.16	11924341.62	2021-05-07 19:24:31	2021-05-07 19:24:31	5
10867	ATOM	2020-08-25	8.389	8.204	8.861	7.783	3625941.87	30228291.79	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10868	ATOM	2020-08-26	7.715	8.389	8.678	7.659	2315147.05	18668205.13	2021-05-09 17:34:36	2021-05-09 17:34:36	3
653	DOT	2021-02-02	17.18	16.46	17.61	16.06	1746696.28	29567752.31	2021-05-09 17:34:36	2021-05-09 17:34:36	4
654	DOT	2021-02-03	20.89	17.18	20.96	16.78	3110983.67	58540246.55	2021-05-09 17:34:36	2021-05-09 17:34:36	4
3446	FIL	2020-09-20	42.02	44.36	43.85	41.5	48.86	2052.92	2021-05-07 19:24:30	2021-05-07 19:24:30	13
655	DOT	2021-02-04	19.72	20.89	21.72	19	2321550.78	47715508.03	2021-05-09 17:34:36	2021-05-09 17:34:36	4
3447	FIL	2020-09-21	40.48	42.02	40.71	39.59	19.04	770.83	2021-05-07 19:24:30	2021-05-07 19:24:30	13
307884	FIL	2021-06-02	70.04	69.16	72.03	68.22	305127.81	21409748.49	2021-06-03 23:40:24	2021-06-03 23:40:24	13
313138	BCH	2021-06-13	613.91	579.99	615.12	559.12	55156.99	32352655.11	2021-06-14 23:43:00	2021-06-14 23:43:00	8
313092	OCN	2021-06-13	0.0008031	0.0008057	0.0008784	0.0008031	42270426.3	33947.55	2021-06-14 23:43:00	2021-06-14 23:43:00	2
318288	ETH	2021-06-24	1989.01	1968.56	2034.57	1886.17	448512.52	882504031.49	2021-06-25 23:45:32	2021-06-25 23:45:32	10
318764	ZRX	2021-06-25	0.6026	0.6619	0.6824	0.5944	8342824.74	5288948.63	2021-06-26 23:45:46	2021-06-26 23:45:46	6
1245	SJCX	2020-09-15	0.0004315	0.0004271	0.0004315	0.0004315	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
670	DOT	2021-02-19	34.81	31.05	35	29.56	1968599.06	64464534.56	2021-05-09 17:34:36	2021-05-09 17:34:36	4
1246	SJCX	2020-09-16	0.0004383	0.0004315	0.0004383	0.0004383	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1247	SJCX	2020-09-17	0.0004378	0.0004383	0.0004378	0.0004378	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
324424	ATOM	2021-07-07	12.94	13.13	13.51	12.83	885620.62	11710886.27	2021-07-08 22:48:30	2021-07-08 22:48:30	3
2850	BTC	2021-02-03	37677.34	35524.43	37704.8	35413.72	63974.93	2340630205.42	2021-05-09 17:34:36	2021-05-09 17:34:36	7
1248	SJCX	2020-09-18	0.0004375	0.0004378	0.0004375	0.0004375	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
329506	ANT	2021-07-18	3.476	3.448	3.668	3.442	143140.56	504609.83	2021-07-19 22:50:59	2021-07-19 22:50:59	14
3122	BCH	2020-11-01	268.08	262.26	269.18	259.96	128125.81	34347750.05	2021-05-09 17:34:36	2021-05-09 17:34:36	8
1283	SJCX	2020-10-23	0.0005175	0.0005196	0.0005175	0.0005175	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
2802	BTC	2020-12-17	22822.17	21352.13	23698.98	21240.41	140483.08	3194654467.93	2021-05-09 17:34:36	2021-05-09 17:34:36	7
1457	SJCX	2021-04-15	0.002529	0.002519	0.002529	0.002529	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
650	DOT	2021-01-30	16.56	16.82	17.08	16.15	1014219.09	16758417.85	2021-05-09 17:34:36	2021-05-09 17:34:36	4
651	DOT	2021-01-31	16.13	16.56	17.51	15.68	1141986.09	18811421.25	2021-05-09 17:34:36	2021-05-09 17:34:36	4
1458	SJCX	2021-04-16	0.002457	0.002529	0.002457	0.002457	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1459	SJCX	2021-04-17	0.002402	0.002457	0.002402	0.002402	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
12	XTZ	2020-05-03	2.743	2.837	2.879	2.677	3185589.71	8844171.06	2021-05-03 03:13:20	2021-05-03 03:13:20	5
11	XTZ	2020-05-02	2.837	2.798	2.868	2.776	2464932	6965322.04	2021-05-01 22:04:03	2021-05-01 22:04:03	5
687	DOT	2021-03-08	34.99	35.11	35.56	33.5	860637.1	29598482	2021-05-09 17:34:36	2021-05-09 17:34:36	4
2851	BTC	2021-02-04	36983.42	37677.34	38741.89	36199.19	73775.45	2767003411.51	2021-05-09 17:34:36	2021-05-09 17:34:36	7
705	DOT	2021-03-26	33.18	29.84	33.37	29.83	970501.95	30855367.65	2021-05-09 17:34:36	2021-05-09 17:34:36	4
706	DOT	2021-03-27	32.64	33.18	33.49	31.13	814241.94	26560013.21	2021-05-09 17:34:36	2021-05-09 17:34:36	4
3123	BCH	2020-11-02	257.58	268.08	266.95	256.09	224272.95	57768705.33	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3154	BCH	2020-12-03	292.5	294.55	300.48	290.17	175770.71	51413730.25	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3155	BCH	2020-12-04	279.79	292.5	294.72	275.87	299310.3	83743534.98	2021-05-09 17:34:36	2021-05-09 17:34:36	8
2852	BTC	2021-02-05	38310.24	36983.42	38343.92	36626.5	45243.69	1705038314	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2853	BTC	2021-02-06	39267.01	38310.24	40989.11	38247.96	66494.6	2642530408.41	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2854	BTC	2021-02-07	38868.82	39267.01	39721.59	37408.16	53823.4	2076904733.5	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2856	BTC	2021-02-09	46509.57	46437.41	48209.59	45051.46	98670.48	4610214635.38	2021-05-09 17:34:36	2021-05-09 17:34:36	7
709	DOT	2021-03-30	34.02	34.35	35.12	33.69	1963090.98	66778224.8	2021-05-09 17:34:36	2021-05-09 17:34:36	4
710	DOT	2021-03-31	37.06	33.97	38.23	33.31	1472839.78	53433355.41	2021-05-09 17:34:36	2021-05-09 17:34:36	4
2858	BTC	2021-02-11	48006.18	44854.95	48664.81	44032.66	72251.82	3377367971.59	2021-05-09 17:34:36	2021-05-09 17:34:36	7
1870	ZRX	2020-05-31	0.3164	0.3376	0.3391	0.3133	6037262.99	1978725.85	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1871	ZRX	2020-06-01	0.3341	0.3164	0.3362	0.3139	6486958.13	2131600.39	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1872	ZRX	2020-06-02	0.3249	0.3341	0.3569	0.3116	17339614.72	5797314.44	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2897	BTC	2021-03-22	54095.36	57374.95	58431.44	53795.78	51098.9	2865346861.49	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2898	BTC	2021-03-23	54355.45	54095.36	55836.27	52984.36	44780.24	2444787014.61	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2900	BTC	2021-03-25	51336.09	52303.02	53199.52	50406.31	69776.36	3617760373.16	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2144	ZRX	2021-03-01	1.356	1.205	1.378	1.205	1496473.85	1956742.76	2021-05-09 17:34:36	2021-05-09 17:34:36	6
3156	BCH	2020-12-05	289.65	279.79	289.84	284.1	136453.34	39523903.8	2021-05-09 17:34:36	2021-05-09 17:34:36	8
2145	ZRX	2021-03-02	1.361	1.356	1.429	1.285	2023223.63	2750909.34	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2917	BTC	2021-04-11	59980.45	59784.8	60673.37	59218.25	20365.62	1218894531.01	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2918	BTC	2021-04-12	59845.76	59980.45	61233.29	59421.37	31804.9	1913098388.79	2021-05-09 17:34:36	2021-05-09 17:34:36	7
82972	BTC	2021-04-26	54062.29	49120.97	54389.71	48843.41	61603.5	3254396664.97	2021-05-09 17:34:36	2021-05-09 17:34:36	7
133200	BTC	2021-04-27	55073.48	54062.29	55490.94	53357.59	40602.56	2220077233.11	2021-05-09 17:34:36	2021-05-09 17:34:36	7
270492	BTC	2021-05-02	56623.51	57843.16	57934.82	56092.72	21671.56	1230710822.31	2021-05-09 17:34:36	2021-05-09 17:34:36	7
297602	ANT	2021-05-13	8.151	8.223	8.658	7.967	591209.37	4818887.51	2021-05-14 23:35:49	2021-05-14 23:35:49	14
303048	DOT	2021-05-23	17.94	22.08	23.46	13.88	5814094.8	101454969.9	2021-05-24 23:38:07	2021-05-24 23:38:07	4
3170	BCH	2020-12-19	318.09	313.72	332.63	315.94	352510.85	112129670.35	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3171	BCH	2020-12-20	349.33	318.32	367.84	310.58	312454.18	108472694.09	2021-05-09 17:34:36	2021-05-09 17:34:36	8
307886	ATOM	2021-06-02	14.86	13.75	15.35	13.58	1500003.4	22003806.31	2021-06-03 22:40:23	2021-06-03 22:40:23	3
10772	ATOM	2020-05-22	2.649	2.512	2.68	2.616	902336.27	2390323.43	2021-05-09 17:34:36	2021-05-09 17:34:36	3
2146	ZRX	2021-03-03	1.464	1.361	1.529	1.34	3243278.28	4697120.66	2021-05-09 17:34:36	2021-05-09 17:34:36	6
10773	ATOM	2020-05-23	2.592	2.649	2.642	2.584	580541.75	1504774.67	2021-05-09 17:34:36	2021-05-09 17:34:36	3
2147	ZRX	2021-03-04	1.374	1.464	1.498	1.357	1636592.99	2348214.63	2021-05-09 17:34:36	2021-05-09 17:34:36	6
9034	ANT	2020-08-22	5.338	4.92	5.58	4.687	738141.49	3940236.26	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9035	ANT	2020-08-23	6.154	5.338	6.382	5.163	1093357.58	6728886.49	2021-05-09 17:34:37	2021-05-09 17:34:37	14
10774	ATOM	2020-05-24	2.495	2.592	2.535	2.479	2659207.98	6635394.56	2021-05-09 17:34:36	2021-05-09 17:34:36	3
9051	ANT	2020-09-08	4.033	4.541	4.462	3.957	459173.26	1851930.53	2021-05-09 17:34:37	2021-05-09 17:34:37	14
14	XTZ	2020-05-05	2.754	2.784	2.835	2.702	2637066.65	7274806.91	2021-05-03 03:13:20	2021-05-03 03:13:20	5
10776	ATOM	2020-05-26	2.579	2.61	2.599	2.555	1522029.76	3925641.84	2021-05-09 17:34:36	2021-05-09 17:34:36	3
9052	ANT	2020-09-09	4.614	4.033	4.641	4.003	549726.7	2536567.76	2021-05-09 17:34:37	2021-05-09 17:34:37	14
107	XTZ	2020-08-06	3.229	3.115	3.39	3.104	6795685.14	22112572.01	2021-05-07 19:24:31	2021-05-07 19:24:31	5
108	XTZ	2020-08-07	3.083	3.229	3.288	2.973	5441365.05	17028237.14	2021-05-07 19:24:31	2021-05-07 19:24:31	5
10777	ATOM	2020-05-27	2.604	2.579	2.721	2.604	2143306.46	5581705.85	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10778	ATOM	2020-05-28	2.668	2.604	2.789	2.668	1872829.54	4996396.45	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10779	ATOM	2020-05-29	2.68	2.668	2.693	2.638	828833.84	2221112.24	2021-05-09 17:34:36	2021-05-09 17:34:36	3
15	XTZ	2020-05-06	2.653	2.754	2.808	2.645	2509214.88	6870741.41	2021-05-03 03:13:20	2021-05-03 03:13:20	5
2148	ZRX	2021-03-05	1.344	1.374	1.391	1.292	1412846.85	1896567.63	2021-05-09 17:34:36	2021-05-09 17:34:36	6
271062	BTC	2021-05-03	57195.07	56623.51	58963.84	56531.6	41015.04	2371465902.34	2021-05-09 17:34:36	2021-05-09 17:34:36	7
9053	ANT	2020-09-10	4.611	4.614	4.78	4.386	500721.76	2308862.87	2021-05-09 17:34:37	2021-05-09 17:34:37	14
313102	SJCX	2021-06-13	0.001561	0.001422	0.001561	0.001561	0	0	2021-06-14 21:42:59	2021-06-14 21:42:59	11
313094	BTC	2021-06-13	39017.37	35541.78	39374.68	34802.24	46353.98	1727291768.5	2021-06-14 23:43:00	2021-06-14 23:43:00	7
318290	DOT	2021-06-24	16.22	15.8	16.65	14.75	1143709.79	18246500.78	2021-06-25 23:45:32	2021-06-25 23:45:32	4
9234	ANT	2021-03-10	5.159	5.406	5.527	5.118	497100.46	2564517.67	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9235	ANT	2021-03-11	5.098	5.159	5.385	4.992	684715.68	3490429.78	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9236	ANT	2021-03-12	5.983	5.098	6.058	5.017	997439.03	5967952	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9237	ANT	2021-03-13	5.613	5.983	6.907	5.613	860749.85	4831600.42	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9238	ANT	2021-03-14	5.854	5.613	5.882	5.31	698392.14	4088708.75	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9239	ANT	2021-03-15	6.786	5.854	7.42	5.298	1619778.28	10991110.35	2021-05-09 17:34:37	2021-05-09 17:34:37	14
3234	BCH	2021-02-21	706.88	679.2	737.34	686.77	248224.49	175465023.06	2021-05-09 17:34:36	2021-05-09 17:34:36	8
9240	ANT	2021-03-16	6.865	6.786	8.032	6.797	2936291.99	20158103.18	2021-05-09 17:34:37	2021-05-09 17:34:37	14
297604	ATOM	2021-05-13	23.52	22.93	25.31	21.74	2366712.22	55598652.09	2021-05-14 23:35:52	2021-05-14 23:35:52	3
93	XTZ	2020-07-23	3.189	3.11	3.235	3.042	6704508.14	21007933.42	2021-05-07 19:24:31	2021-05-07 19:24:31	5
94	XTZ	2020-07-24	3.035	3.189	3.198	3.008	4231434.79	13083205.63	2021-05-07 19:24:31	2021-05-07 19:24:31	5
4574	EOS	2020-10-20	2.529	2.584	2.586	2.506	622626.48	1580234.74	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4575	EOS	2020-10-21	2.612	2.529	2.659	2.525	2049621.23	5353044.99	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4695	EOS	2021-02-18	4.823	4.842	4.985	4.667	7813055.56	37972606.51	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4696	EOS	2021-02-19	5.23	4.823	5.37	4.646	13497459.75	68980099.88	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4697	EOS	2021-02-20	4.839	5.23	5.448	4.514	15988586.42	81515295.65	2021-05-09 17:34:36	2021-05-09 17:34:36	9
95	XTZ	2020-07-25	3.063	3.035	3.118	3.023	3605823.09	11068186.03	2021-05-07 19:24:31	2021-05-07 19:24:31	5
126	XTZ	2020-08-25	3.437	3.68	3.706	3.297	5013487.11	17522999.86	2021-05-07 19:24:31	2021-05-07 19:24:31	5
131	XTZ	2020-08-30	3.388	3.354	3.434	3.331	2603931.53	8805135.48	2021-05-07 19:24:31	2021-05-07 19:24:31	5
132	XTZ	2020-08-31	3.246	3.388	3.468	3.244	3621802.07	12126978.94	2021-05-07 19:24:31	2021-05-07 19:24:31	5
133	XTZ	2020-09-01	3.445	3.246	3.521	3.193	4853727.72	16421105.41	2021-05-07 19:24:31	2021-05-07 19:24:31	5
134	XTZ	2020-09-02	3.142	3.445	3.471	2.979	4828452.97	15251875.34	2021-05-07 19:24:31	2021-05-07 19:24:31	5
135	XTZ	2020-09-03	2.574	3.142	3.143	2.472	8093479	23020021.58	2021-05-07 19:24:31	2021-05-07 19:24:31	5
4698	EOS	2021-02-21	5.102	4.839	5.363	4.736	8749115.9	44276659.22	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4699	EOS	2021-02-22	4.688	5.102	5.302	4.12	25601358.57	121087387.56	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4700	EOS	2021-02-23	3.852	4.688	4.716	3.192	39123152.15	152054188.9	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4713	EOS	2021-03-08	3.897	3.832	3.923	3.738	4320144.08	16588673.22	2021-05-09 17:34:36	2021-05-09 17:34:36	9
2014	ZRX	2020-10-22	0.381	0.375	0.3924	0.375	2402493.2	924348.11	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2015	ZRX	2020-10-23	0.3766	0.381	0.3885	0.3704	2468254.48	934891.05	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2016	ZRX	2020-10-24	0.3794	0.3766	0.385	0.3735	1408311.93	534734.22	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2017	ZRX	2020-10-25	0.3686	0.3794	0.3795	0.3669	1437322	533977.46	2021-05-09 17:34:36	2021-05-09 17:34:36	6
291612	BTC	2021-05-08	58943.13	57374.33	59521.69	56985.44	37728.82	2211507566.18	2021-05-09 23:34:39	2021-05-09 23:34:39	7
324450	DOT	2021-07-07	16.86	16.13	17.66	16.11	1570075.95	26434254.92	2021-07-08 22:48:30	2021-07-08 22:48:30	4
318292	ANT	2021-06-24	3.556	3.521	3.763	3.431	128961.14	459853.21	2021-06-25 23:45:32	2021-06-25 23:45:32	14
329530	ZRX	2021-07-18	0.6238	0.6275	0.6537	0.6102	3023694.58	1910678.54	2021-07-19 23:50:59	2021-07-19 23:50:59	6
313174	FIL	2021-06-13	73.19	69.6	73.74	68.67	177535.61	12642117.15	2021-06-14 23:43:00	2021-06-14 23:43:00	13
307888	BCH	2021-06-02	698.07	691.07	715.89	675.18	77851.84	54213720.03	2021-06-03 21:40:23	2021-06-03 21:40:23	8
303050	ANT	2021-05-23	3.376	3.892	3.694	3.059	691613.7	2335034.95	2021-05-24 23:38:06	2021-05-24 23:38:06	14
2018	ZRX	2020-10-26	0.3573	0.3686	0.3826	0.3533	2872875.06	1048526.58	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2019	ZRX	2020-10-27	0.3614	0.3573	0.3717	0.3567	1461871.3	531550.95	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2020	ZRX	2020-10-28	0.3371	0.3614	0.3646	0.3309	2007937.6	688201.49	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2021	ZRX	2020-10-29	0.337	0.3371	0.3457	0.328	2020014.96	682622.91	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2022	ZRX	2020-10-30	0.3257	0.337	0.3435	0.317	2628711.65	857438.16	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2024	ZRX	2020-11-01	0.3381	0.3222	0.3412	0.3204	2368051.31	779782.44	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2068	ZRX	2020-12-15	0.3912	0.3867	0.4016	0.3859	2390982.34	945537.76	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2069	ZRX	2020-12-16	0.4146	0.3912	0.4156	0.3822	5477023.67	2193752.88	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2070	ZRX	2020-12-17	0.407	0.4146	0.4271	0.3981	7937550.45	3284371.63	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2071	ZRX	2020-12-18	0.4125	0.407	0.4293	0.3988	8130743	3379216.18	2021-05-09 17:34:36	2021-05-09 17:34:36	6
280368	BTC	2021-05-04	53244.07	57195.07	57226.81	53108.04	64556.47	3556756117.3	2021-05-09 17:34:36	2021-05-09 17:34:36	7
287850	BTC	2021-05-05	57506.88	53244.07	57944.11	52978.89	56998.25	3200062630.96	2021-05-09 17:34:36	2021-05-09 17:34:36	7
313566	ATOM	2021-06-14	13.24	12.54	13.39	12.22	870759.1	11141669.72	2021-06-15 22:43:14	2021-06-15 22:43:14	3
343374	ATOM	2021-08-17	16	15.8	17.44	15.09	3120012.68	51569404.78	2021-08-18 23:57:53	2021-08-18 23:57:53	3
329958	ETH	2021-07-19	1818.6	1891.96	1918.43	1806.49	409977.3	755083019.62	2021-07-20 23:51:13	2021-07-20 23:51:13	10
338214	ZRX	2021-08-06	0.8961	0.8883	0.9028	0.8582	5766675.88	5088500.32	2021-08-07 22:55:21	2021-08-07 22:55:21	6
287851	BTC	2021-05-06	56441.94	57506.88	58392.76	55299.4	50632.92	2878647496.02	2021-05-09 17:34:36	2021-05-09 17:34:36	7
287852	BTC	2021-05-07	57374.33	56441.94	58695.29	55311.16	42812.69	2439662460.45	2021-05-09 17:34:36	2021-05-09 17:34:36	7
318762	BCH	2021-06-25	452.04	486.7	496.77	449.7	64166.89	30081775.16	2021-06-26 23:45:46	2021-06-26 23:45:46	8
343370	ANT	2021-08-17	4.734	5.012	5.168	4.701	140928.49	700256.13	2021-08-18 23:57:54	2021-08-18 23:57:54	14
348996	ETH	2021-08-29	3225.3	3246.78	3287.2	3154.86	186146.45	598363684.17	2021-08-30 23:00:39	2021-08-30 23:00:39	10
343368	ETH	2021-08-17	3011.96	3147.63	3292.09	2994.41	516276.32	1624081267.21	2021-08-18 23:57:53	2021-08-18 23:57:53	10
354976	ANT	2021-09-10	5.427	5.869	5.876	5.306	612391.74	3323587.82	2021-09-11 23:03:23	2021-09-11 23:03:23	14
360142	BTC	2021-09-21	40709.59	42925.46	43625.93	39767.17	70924.75	2972565920.07	2021-09-22 23:05:56	2021-09-22 23:05:56	7
365362	BTC	2021-10-02	47669.02	48164.35	48347.69	47468.49	16062.18	769022184.37	2021-10-03 23:08:30	2021-10-03 23:08:30	7
364906	ANT	2021-10-01	4.708	4.307	4.816	4.607	229072.61	1078378.45	2021-10-02 20:08:15	2021-10-02 20:08:15	14
370206	XTZ	2021-10-12	7.103	6.902	7.279	6.616	14740438.91	102710095.82	2021-10-13 22:10:48	2021-10-13 22:10:48	5
375708	XTZ	2021-10-23	6.736	6.704	6.817	6.635	3047776.35	20476327.29	2021-10-24 22:13:20	2021-10-24 22:13:20	5
375710	ETH	2021-10-23	4168.96	3971.95	4171.67	3937.93	206808.72	839766245.34	2021-10-24 23:13:20	2021-10-24 23:13:20	10
1369	SJCX	2021-01-17	0.001434	0.001441	0.001434	0.001434	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
10830	ATOM	2020-07-19	4.205	4.363	4.501	3.955	1394447.71	5956350.72	2021-05-09 17:34:36	2021-05-09 17:34:36	3
8943	ANT	2020-05-23	1.034	1.057	1.104	1.026	15188.34	15710.29	2021-05-09 17:34:37	2021-05-09 17:34:37	14
1370	SJCX	2021-01-18	0.001465	0.001434	0.001465	0.001465	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
10831	ATOM	2020-07-20	3.885	4.205	4.256	3.859	927243.61	3766624.9	2021-05-09 17:34:36	2021-05-09 17:34:36	3
1374	SJCX	2021-01-22	0.00132	0.001234	0.00132	0.00132	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
8944	ANT	2020-05-24	1.011	1.034	1.323	0.9712	51048.48	51627.62	2021-05-09 17:34:37	2021-05-09 17:34:37	14
1375	SJCX	2021-01-23	0.001284	0.00132	0.001284	0.001284	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1376	SJCX	2021-01-24	0.001291	0.001284	0.001291	0.001291	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1377	SJCX	2021-01-25	0.001291	0.001291	0.001291	0.001291	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1378	SJCX	2021-01-26	0.001301	0.001291	0.001301	0.001301	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1379	SJCX	2021-01-27	0.001217	0.001301	0.001217	0.001217	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
271052	DOT	2021-05-03	37.27	36.66	38.3	36.64	1321185.37	49555480.7	2021-05-09 17:34:36	2021-05-09 17:34:36	4
2803	BTC	2020-12-18	23135.57	22822.17	23271.54	22345.87	59658.48	1362467582.47	2021-05-09 17:34:36	2021-05-09 17:34:36	7
1380	SJCX	2021-01-28	0.001338	0.001217	0.001338	0.001338	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
8929	ANT	2020-05-09	1.216	1.236	1.25	1.202	29888.36	36358.56	2021-05-09 17:34:37	2021-05-09 17:34:37	14
8945	ANT	2020-05-25	1.038	1.011	1.162	0.9783	26117.11	27107.28	2021-05-09 17:34:37	2021-05-09 17:34:37	14
4406	EOS	2020-05-05	2.77	2.772	2.829	2.713	982229.89	2721585.8	2021-05-04 22:03:21	2021-05-04 22:03:21	9
8930	ANT	2020-05-10	1.019	1.24	1.136	1.019	17548.92	17889.02	2021-05-09 17:34:37	2021-05-09 17:34:37	14
8931	ANT	2020-05-11	1.032	1.035	1.049	0.9889	77856.93	80319.86	2021-05-09 17:34:37	2021-05-09 17:34:37	14
8932	ANT	2020-05-12	1.23	1.032	1.348	1.054	135165.66	166225.7	2021-05-09 17:34:37	2021-05-09 17:34:37	14
2804	BTC	2020-12-19	23844.72	23135.57	24114.51	22755.03	53911.52	1268054141.3	2021-05-09 17:34:36	2021-05-09 17:34:36	7
10832	ATOM	2020-07-21	4.016	3.885	4.057	3.781	848450.96	3339778.71	2021-05-09 17:34:36	2021-05-09 17:34:36	3
2805	BTC	2020-12-20	23467.06	23844.72	24252.16	23095.72	42981.99	1014224949.67	2021-05-09 17:34:36	2021-05-09 17:34:36	7
10833	ATOM	2020-07-22	4.015	4.016	4.087	3.902	478996.01	1903661.1	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10834	ATOM	2020-07-23	3.962	4.015	4.104	3.924	531550.37	2140393.05	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10835	ATOM	2020-07-24	3.834	3.962	3.97	3.795	489503.45	1908833.34	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10836	ATOM	2020-07-25	3.919	3.834	3.958	3.783	575379.2	2221997.55	2021-05-09 17:34:36	2021-05-09 17:34:36	3
718	DOT	2021-04-08	41.35	39.56	41.6	39.26	558638.18	22662462.3	2021-05-09 17:34:36	2021-05-09 17:34:36	4
719	DOT	2021-04-09	40.77	41.35	41.95	40.23	1903255.74	77591484.57	2021-05-09 17:34:36	2021-05-09 17:34:36	4
297606	EOS	2021-05-13	10.62	10.35	11.64	9.45	31506933.53	330254027	2021-05-14 23:35:49	2021-05-14 23:35:49	9
2806	BTC	2020-12-21	22727.13	23467.06	24077.7	22015.91	75934.38	1750627321.07	2021-05-09 17:34:36	2021-05-09 17:34:36	7
720	DOT	2021-04-10	41.6	40.77	42.32	40.57	2530179.27	105251064.84	2021-05-09 17:34:36	2021-05-09 17:34:36	4
307890	XTZ	2021-06-02	3.811	3.668	3.872	3.577	3914435.48	14721515.77	2021-06-03 23:40:24	2021-06-03 23:40:24	5
2807	BTC	2020-12-22	23823.32	22727.13	23833.23	22378.26	49685.46	1149767378.59	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2808	BTC	2020-12-23	23239.5	23823.32	24082.98	22641.37	66161.63	1552020951.78	2021-05-09 17:34:36	2021-05-09 17:34:36	7
8933	ANT	2020-05-13	1.441	1.23	1.479	1.234	110637.84	159420.11	2021-05-09 17:34:37	2021-05-09 17:34:37	14
721	DOT	2021-04-11	41.32	41.59	41.85	40.01	434643.97	17725796.99	2021-05-09 17:34:36	2021-05-09 17:34:36	4
303052	EOS	2021-05-23	4.311	5.109	5.328	3.587	20737020.41	90277761.73	2021-05-24 23:38:08	2021-05-24 23:38:08	9
8928	ANT	2020-05-08	1.217	1.233	1.238	1.161	43123.36	52489.54	2021-05-07 19:24:30	2021-05-07 19:24:30	14
722	DOT	2021-04-12	40.47	41.3	41.27	39.52	3005800.86	121637856.22	2021-05-09 17:34:36	2021-05-09 17:34:36	4
723	DOT	2021-04-13	42.95	40.47	43.46	40.91	5001513.62	214797329.31	2021-05-09 17:34:36	2021-05-09 17:34:36	4
318294	BTC	2021-06-24	34649.84	33678.64	35267.23	32340.83	38755.56	1311147481.02	2021-06-25 23:45:32	2021-06-25 23:45:32	7
313176	EOS	2021-06-13	5.091	4.825	5.128	4.663	2802714.53	13695274.25	2021-06-14 22:42:59	2021-06-14 22:42:59	9
318754	FIL	2021-06-25	52.12	57.14	57.85	50.39	431296.43	22920447.43	2021-06-26 23:45:46	2021-06-26 23:45:46	13
2809	BTC	2020-12-24	23724.2	23239.5	23778.56	22716.45	39804.23	923848542.66	2021-05-09 17:34:36	2021-05-09 17:34:36	7
3481	FIL	2020-10-25	38.71	25.9	39.72	25.18	634734.23	24568220.69	2021-05-07 19:24:30	2021-05-07 19:24:30	13
329970	ZRX	2021-07-19	0.5843	0.6238	0.6271	0.5785	3405693.1	2025354.66	2021-07-20 23:51:13	2021-07-20 23:51:13	6
2810	BTC	2020-12-25	24707.98	23724.2	24776.64	23417.43	49655.15	1199894883.01	2021-05-09 17:34:36	2021-05-09 17:34:36	7
16	XTZ	2020-05-07	2.72	2.653	2.807	2.615	3631423.2	9855424.12	2021-05-07 19:24:31	2021-05-07 19:24:31	5
187	XTZ	2020-10-25	2.167	2.222	2.249	2.158	1476247.8	3244984.04	2021-05-07 19:24:31	2021-05-07 19:24:31	5
188	XTZ	2020-10-26	2.092	2.167	2.183	2.06	1845426.36	3901302.59	2021-05-07 19:24:31	2021-05-07 19:24:31	5
189	XTZ	2020-10-27	2.085	2.092	2.133	2.064	1423627.18	2991141.17	2021-05-07 19:24:31	2021-05-07 19:24:31	5
190	XTZ	2020-10-28	2.004	2.085	2.117	1.943	1756176.09	3538314.8	2021-05-07 19:24:31	2021-05-07 19:24:31	5
1365	SJCX	2021-01-13	0.001495	0.001362	0.001495	0.001495	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1366	SJCX	2021-01-14	0.001566	0.001495	0.001566	0.001566	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
191	XTZ	2020-10-29	1.934	2.004	2.051	1.898	1734616.14	3402615.92	2021-05-07 19:24:31	2021-05-07 19:24:31	5
192	XTZ	2020-10-30	1.906	1.934	1.967	1.797	3778027.11	7046439.38	2021-05-07 19:24:31	2021-05-07 19:24:31	5
193	XTZ	2020-10-31	1.979	1.906	2.022	1.897	2068541.09	4052919.79	2021-05-07 19:24:31	2021-05-07 19:24:31	5
324860	XTZ	2021-07-08	2.695	2.876	2.896	2.621	3716226.76	10111886.18	2021-07-09 23:48:44	2021-07-09 23:48:44	5
329532	EOS	2021-07-18	3.64	3.658	3.774	3.564	1355877.96	4970621.27	2021-07-19 23:50:59	2021-07-19 23:50:59	9
338216	EOS	2021-08-06	4.317	4.191	4.353	4.103	4953862.57	20896492.27	2021-08-07 22:55:21	2021-08-07 22:55:21	9
343362	DOT	2021-08-17	23.56	24.49	27.36	23.11	6452527.39	164549608.17	2021-08-18 23:57:53	2021-08-18 23:57:53	4
348998	DOT	2021-08-29	25.73	25.97	26.47	25.3	1984861.05	51366178.65	2021-08-30 23:00:39	2021-08-30 23:00:39	4
354940	SJCX	2021-09-10	0.001794	0.001856	0.001794	0.001794	0	0	2021-09-11 23:03:24	2021-09-11 23:03:24	11
354930	BTC	2021-09-10	44853.1	46392.85	47026.67	44198.27	35701.24	1631276774.64	2021-09-11 23:03:24	2021-09-11 23:03:24	7
1396	SJCX	2021-02-13	0.001889	0.001897	0.001889	0.001889	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1397	SJCX	2021-02-14	0.001946	0.001889	0.001946	0.001946	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1398	SJCX	2021-02-15	0.001917	0.001946	0.001917	0.001917	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1399	SJCX	2021-02-16	0.001967	0.001917	0.001967	0.001967	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
252	XTZ	2020-12-29	2.04	2.119	2.173	1.979	5879705.7	12107473.66	2021-05-07 19:24:31	2021-05-07 19:24:31	5
1400	SJCX	2021-02-17	0.002086	0.001967	0.002086	0.002086	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1401	SJCX	2021-02-18	0.002064	0.002086	0.002064	0.002064	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1402	SJCX	2021-02-19	0.002237	0.002064	0.002237	0.002237	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
10851	ATOM	2020-08-09	5.28	4.438	5.5	4.306	2801503.98	14145898.58	2021-05-09 17:34:36	2021-05-09 17:34:36	3
4407	EOS	2020-05-06	2.656	2.77	2.822	2.621	1405698.91	3871445.87	2021-05-04 22:03:21	2021-05-04 22:03:21	9
253	XTZ	2020-12-30	1.99	2.04	2.075	1.959	4206289.33	8435007.45	2021-05-07 19:24:31	2021-05-07 19:24:31	5
10852	ATOM	2020-08-10	5.473	5.28	5.874	5.104	2259079.56	12296317.3	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10853	ATOM	2020-08-11	4.915	5.473	5.577	4.702	1314708.59	6676813.03	2021-05-09 17:34:36	2021-05-09 17:34:36	3
254	XTZ	2020-12-31	2.013	1.99	2.023	1.94	3099116.3	6156068.07	2021-05-07 19:24:31	2021-05-07 19:24:31	5
289	XTZ	2021-02-04	2.966	3.051	3.176	2.857	9728738.66	29245671.25	2021-05-07 19:24:31	2021-05-07 19:24:31	5
290	XTZ	2021-02-05	3.474	2.966	3.522	2.96	17212933.8	56489209.47	2021-05-07 19:24:31	2021-05-07 19:24:31	5
291	XTZ	2021-02-06	3.176	3.474	3.514	3.092	9656798.28	31171071.03	2021-05-07 19:24:31	2021-05-07 19:24:31	5
292	XTZ	2021-02-07	3.314	3.176	3.466	3.065	11092384.08	36356883.04	2021-05-07 19:24:31	2021-05-07 19:24:31	5
293	XTZ	2021-02-08	3.414	3.314	3.439	3.213	7286331.65	24446453.35	2021-05-07 19:24:31	2021-05-07 19:24:31	5
294	XTZ	2021-02-09	3.773	3.414	3.883	3.192	18289783.09	65283795.68	2021-05-07 19:24:31	2021-05-07 19:24:31	5
1403	SJCX	2021-02-20	0.002236	0.002237	0.002236	0.002236	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1405	SJCX	2021-02-22	0.002165	0.002299	0.002165	0.002165	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1408	SJCX	2021-02-25	0.001883	0.00199	0.001883	0.001883	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1409	SJCX	2021-02-26	0.001853	0.001883	0.001853	0.001853	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
8963	ANT	2020-06-12	1.149	1.084	1.253	1.039	99625.51	114465.48	2021-05-09 17:34:37	2021-05-09 17:34:37	14
295	XTZ	2021-02-10	3.847	3.773	3.901	3.458	12542134	46598299.2	2021-05-07 19:24:31	2021-05-07 19:24:31	5
351	XTZ	2021-04-07	5.522	6.16	6.476	5.383	9913939.39	57526839.94	2021-05-07 19:24:31	2021-05-07 19:24:31	5
8964	ANT	2020-06-13	1.217	1.149	1.242	1.114	17122.5	20846.52	2021-05-09 17:34:37	2021-05-09 17:34:37	14
8965	ANT	2020-06-14	1.154	1.217	1.2	1.111	22914.65	26435.38	2021-05-09 17:34:37	2021-05-09 17:34:37	14
8966	ANT	2020-06-15	1.173	1.154	1.236	1.084	24950.9	29268.61	2021-05-09 17:34:37	2021-05-09 17:34:37	14
303054	XTZ	2021-05-23	2.92	3.441	3.602	2.462	17564459.63	50820131.07	2021-05-24 23:38:06	2021-05-24 23:38:06	5
313552	BTC	2021-06-14	40526.63	39017.37	41025.42	38755.79	68729.09	2740589573.6	2021-06-15 23:43:14	2021-06-15 23:43:14	7
10854	ATOM	2020-08-12	5.914	4.915	6.01	4.866	2212513.74	12336039.27	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10855	ATOM	2020-08-13	6.101	5.914	6.545	5.466	2839476.77	17228041.66	2021-05-09 17:34:36	2021-05-09 17:34:36	3
352	XTZ	2021-04-08	6.159	5.522	6.235	5.442	4572983.96	27039284.1	2021-05-07 19:24:31	2021-05-07 19:24:31	5
10856	ATOM	2020-08-14	6.108	6.101	6.585	5.95	1586023.52	9909113.68	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10861	ATOM	2020-08-19	5.659	5.828	5.931	5.304	763106.83	4314108.7	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10862	ATOM	2020-08-20	6.307	5.659	6.373	5.555	1284894.77	7878436.93	2021-05-09 17:34:36	2021-05-09 17:34:36	3
318786	ANT	2021-06-25	4.802	4.252	5.586	3.659	1455362.32	6989038.03	2021-06-26 23:45:45	2021-06-26 23:45:45	14
10876	ATOM	2020-09-03	4.983	6.653	6.744	4.932	881620.89	5194940.89	2021-05-09 17:34:36	2021-05-09 17:34:36	3
297608	SJCX	2021-05-13	0.001988	0.00198	0.001988	0.001988	0	0	2021-05-14 23:35:50	2021-05-14 23:35:50	11
307892	BTC	2021-06-02	37576.98	36683.51	38225.18	35935.34	39948.44	1494571249.19	2021-06-03 23:40:24	2021-06-03 23:40:24	7
10877	ATOM	2020-09-04	5.497	4.983	5.658	4.761	651122.65	3450958.2	2021-05-09 17:34:36	2021-05-09 17:34:36	3
724	DOT	2021-04-14	42.5	42.95	43.98	40.47	4962901.03	210927672.29	2021-05-09 17:34:36	2021-05-09 17:34:36	4
725	DOT	2021-04-15	43.48	42.49	44.37	41.37	844162.18	36166766.13	2021-05-09 17:34:36	2021-05-09 17:34:36	4
2816	BTC	2020-12-31	28972.4	28889.61	29301.67	27957.13	66915.03	1924969475.46	2021-05-09 17:34:36	2021-05-09 17:34:36	7
9245	ANT	2021-03-21	7.229	7.077	7.533	6.73	688784.59	4979391.66	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9246	ANT	2021-03-22	6.767	7.229	7.297	6.654	899388.97	6086461.54	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9247	ANT	2021-03-23	6.452	6.767	6.865	6.229	930436.75	6003170.39	2021-05-09 17:34:37	2021-05-09 17:34:37	14
318750	OCN	2021-06-25	0.0004707	0.0004774	0.0004888	0.0004345	74991918.61	35296.46	2021-06-26 23:45:46	2021-06-26 23:45:46	2
2817	BTC	2021-01-01	29388.94	28972.4	29666.33	28748.21	50841.73	1487306218.52	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2818	BTC	2021-01-02	32203.64	29388.94	33257.29	29036.26	119214.75	3750440817.91	2021-05-09 17:34:36	2021-05-09 17:34:36	7
1367	SJCX	2021-01-15	0.001472	0.001566	0.001472	0.001472	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1371	SJCX	2021-01-19	0.001437	0.001465	0.001437	0.001437	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1372	SJCX	2021-01-20	0.00142	0.001437	0.00142	0.00142	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
8967	ANT	2020-06-16	1.287	1.173	1.455	1.168	45921.12	59103.11	2021-05-09 17:34:37	2021-05-09 17:34:37	14
8968	ANT	2020-06-17	1.392	1.287	1.731	1.229	22427.66	31227.91	2021-05-09 17:34:37	2021-05-09 17:34:37	14
8969	ANT	2020-06-18	1.261	1.392	1.381	1.211	30066.93	37907.24	2021-05-09 17:34:37	2021-05-09 17:34:37	14
324862	ANT	2021-07-08	3.629	3.94	3.902	3.626	1254144.22	4551653.96	2021-07-09 23:48:44	2021-07-09 23:48:44	14
318296	OCN	2021-06-24	0.0004774	0.0005118	0.000537	0.0004774	112078733.29	53502.17	2021-06-25 23:45:32	2021-06-25 23:45:32	2
329534	XTZ	2021-07-18	2.43	2.408	2.494	2.387	1870805.07	4563961.83	2021-07-19 23:50:59	2021-07-19 23:50:59	5
329960	ANT	2021-07-19	3.572	3.476	3.605	3.288	76858	263647.72	2021-07-20 22:51:13	2021-07-20 22:51:13	14
338220	BCH	2021-08-06	557.11	548.77	560.94	537.7	67282.85	37031749.11	2021-08-07 22:55:21	2021-08-07 22:55:21	8
338218	SJCX	2021-08-06	0.001714	0.001636	0.001714	0.001714	0	0	2021-08-07 23:55:21	2021-08-07 23:55:21	11
343364	OCN	2021-08-17	0.001024	0.001102	0.001054	0.0009939	8793036.28	9004.65	2021-08-18 23:57:54	2021-08-18 23:57:54	2
342894	ATOM	2021-08-16	15.8	15.92	16.68	15.51	2062479.29	33090410.25	2021-08-17 23:57:39	2021-08-17 23:57:39	3
348978	ANT	2021-08-29	4.957	4.884	4.987	4.795	281419.74	1395137.47	2021-08-30 23:00:39	2021-08-30 23:00:39	14
10878	ATOM	2020-09-05	4.916	5.497	5.665	4.575	983837.72	4995707.08	2021-05-09 17:34:36	2021-05-09 17:34:36	3
2280	OCN	2020-07-14	0.0004063	0.0004551	0.0004616	0.0003967	79190230.23	32178.44	2021-05-09 17:34:37	2021-05-09 17:34:37	2
10879	ATOM	2020-09-06	5.184	4.916	5.35	4.468	723082.7	3622868.34	2021-05-09 17:34:36	2021-05-09 17:34:36	3
2281	OCN	2020-07-15	0.0004077	0.0004063	0.0004125	0.0003982	27850960.97	11354.79	2021-05-09 17:34:37	2021-05-09 17:34:37	2
10880	ATOM	2020-09-07	5.053	5.184	5.256	4.595	483993.62	2380177.04	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10881	ATOM	2020-09-08	4.941	5.053	5.161	4.747	615913.69	3068347.41	2021-05-09 17:34:36	2021-05-09 17:34:36	3
2142	ZRX	2021-02-27	1.333	1.315	1.399	1.293	1701599.93	2314472.58	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1426	SJCX	2021-03-15	0.002227	0.00236	0.002227	0.002227	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
2282	OCN	2020-07-16	0.0003855	0.0004077	0.0004018	0.0003714	21821746.58	8411.33	2021-05-09 17:34:37	2021-05-09 17:34:37	2
303056	FIL	2021-05-23	65.15	72.18	74.75	55.5	1435939.63	91556193.3	2021-05-24 23:38:08	2021-05-24 23:38:08	13
2283	OCN	2020-07-17	0.0003957	0.0003855	0.0004306	0.0003817	60519468.74	23948.1	2021-05-09 17:34:37	2021-05-09 17:34:37	2
1469	ETH	2020-04-26	197.62	194.41	199.85	196.46	1268339.41	250644973.85	2021-04-26 23:28:51	2021-04-26 23:28:51	10
8970	ANT	2020-06-19	1.26	1.261	1.302	1.205	11555.3	14564.28	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9054	ANT	2020-09-11	4.443	4.611	4.651	4.163	303772.65	1349746.65	2021-05-09 17:34:37	2021-05-09 17:34:37	14
10882	ATOM	2020-09-09	5.316	4.941	5.488	4.888	698408.19	3648870.88	2021-05-09 17:34:36	2021-05-09 17:34:36	3
2863	BTC	2021-02-16	49184.63	47936.51	50561.53	47068.63	66072.59	3237085085.6	2021-05-09 17:34:36	2021-05-09 17:34:36	7
1427	SJCX	2021-03-16	0.002277	0.002227	0.002277	0.002277	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1428	SJCX	2021-03-17	0.002356	0.002277	0.002356	0.002356	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1429	SJCX	2021-03-18	0.002306	0.002356	0.002306	0.002306	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
297610	ETH	2021-05-13	3718.99	3811.29	4045.28	3546.6	1632743.76	6173576604.52	2021-05-14 23:35:51	2021-05-14 23:35:51	10
10883	ATOM	2020-09-10	5.315	5.316	5.564	5.183	419302.57	2255716.17	2021-05-09 17:34:36	2021-05-09 17:34:36	3
1430	SJCX	2021-03-19	0.002322	0.002306	0.002322	0.002322	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
4419	EOS	2020-05-18	2.665	2.621	2.746	2.61	10350687.3	27693050.62	2021-05-09 17:34:36	2021-05-09 17:34:36	9
1431	SJCX	2021-03-20	0.002324	0.002322	0.002324	0.002324	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
2864	BTC	2021-02-17	52154.91	49184.63	52622.68	48967.72	67133.49	3423930178.2	2021-05-09 17:34:36	2021-05-09 17:34:36	7
307894	EOS	2021-06-02	6.377	6.299	6.546	6.126	2640381.81	16796408.41	2021-06-03 22:40:24	2021-06-03 22:40:24	9
313554	BCH	2021-06-14	641.58	613.91	641.58	599.29	71931.46	44364833.46	2021-06-15 23:43:14	2021-06-15 23:43:14	8
2865	BTC	2021-02-18	51591.61	52154.91	52550.6	50874.81	42530.26	2205232619.94	2021-05-09 17:34:36	2021-05-09 17:34:36	7
1432	SJCX	2021-03-21	0.002295	0.002324	0.002295	0.002295	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
9055	ANT	2020-09-12	4.795	4.443	4.891	4.324	338527.4	1623099.14	2021-05-09 17:34:37	2021-05-09 17:34:37	14
2866	BTC	2021-02-19	55933.47	51591.61	56331.09	50766.83	72433.44	3893034056.64	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2867	BTC	2021-02-20	55900.84	55933.47	57528.16	54140.61	52924.57	2974872569.57	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2868	BTC	2021-02-21	57469.95	55900.84	58348.75	55516.07	33823.01	1934005633.01	2021-05-09 17:34:36	2021-05-09 17:34:36	7
9150	ANT	2020-12-16	3.128	3.06	3.436	3.083	367243.8	1148770.57	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9161	ANT	2020-12-27	2.901	2.864	2.966	2.662	397985.12	1154373.49	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9182	ANT	2021-01-17	4.86	3.494	5.385	3.489	289127.65	1405062.79	2021-05-09 17:34:37	2021-05-09 17:34:37	14
1433	SJCX	2021-03-22	0.002164	0.002295	0.002164	0.002164	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
2272	OCN	2020-07-06	0.0003312	0.0003238	0.0003506	0.0003264	14790722.14	4898.85	2021-05-09 17:34:37	2021-05-09 17:34:37	2
9248	ANT	2021-03-24	8.175	6.452	9.969	6.051	6877853.98	56226195.11	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9249	ANT	2021-03-25	10.14	8.228	13.86	8.08	531062.36	5678055	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9250	ANT	2021-03-26	9.882	10.12	12.19	9.668	5058858	49993909.65	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9251	ANT	2021-03-27	10.02	9.882	10.84	9.631	2408939.98	24128826.41	2021-05-09 17:34:37	2021-05-09 17:34:37	14
2273	OCN	2020-07-07	0.0003231	0.0003312	0.0003375	0.0003183	10807487.22	3492.14	2021-05-09 17:34:37	2021-05-09 17:34:37	2
9252	ANT	2021-03-28	9.271	10.02	10.1	9.237	1181358.57	10952143.59	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9269	ANT	2021-04-14	10.46	11.01	11.02	10.2	548954.91	5744627.41	2021-05-09 17:34:37	2021-05-09 17:34:37	14
2143	ZRX	2021-02-28	1.205	1.333	1.344	1.136	1916823.45	2312660.85	2021-05-09 17:34:36	2021-05-09 17:34:36	6
84069	ZRX	2021-04-25	1.341	1.328	1.459	1.262	10368603.55	14111990.6	2021-05-09 17:34:36	2021-05-09 17:34:36	6
84070	ZRX	2021-04-26	1.525	1.341	1.545	1.331	11640267.98	17165791.46	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2819	BTC	2021-01-03	33063.48	32203.64	34789.34	32010.59	93510.99	3132759314.54	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2820	BTC	2021-01-04	32030.55	33063.48	33622.7	28493.29	124909.68	3901979149.92	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2821	BTC	2021-01-05	34038.29	32030.55	34487.44	29985.29	93735.47	3037657026.2	2021-05-09 17:34:36	2021-05-09 17:34:36	7
17	XTZ	2020-05-08	2.755	2.72	2.82	2.69	3625989.14	9990968.24	2021-05-07 19:24:31	2021-05-07 19:24:31	5
18	XTZ	2020-05-09	2.811	2.755	2.967	2.721	4763703.04	13565156.17	2021-05-07 19:24:31	2021-05-07 19:24:31	5
1940	ZRX	2020-08-09	0.4378	0.421	0.4487	0.4153	13295231.51	5749752.5	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2072	ZRX	2020-12-19	0.4241	0.4125	0.4341	0.4121	5692723.79	2426371.68	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2869	BTC	2021-02-22	54121.17	57469.95	57540.74	48194.31	130806.33	6995162441.1	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2274	OCN	2020-07-08	0.0003385	0.0003231	0.0003608	0.0003311	22767060.16	7707.58	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2275	OCN	2020-07-09	0.0003341	0.0003385	0.0003534	0.0003292	15594515.59	5209.67	2021-05-09 17:34:37	2021-05-09 17:34:37	2
9270	ANT	2021-04-15	11.18	10.46	11.36	10.35	659017.36	7367550.28	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9271	ANT	2021-04-16	10.31	11.18	10.87	10.12	577134.21	5947756.79	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9272	ANT	2021-04-17	10.37	10.31	10.57	9.927	538998.9	5587088.87	2021-05-09 17:34:37	2021-05-09 17:34:37	14
271066	ANT	2021-05-03	9.883	9.541	10.03	9.5	458679.02	4533266.07	2021-05-09 17:34:37	2021-05-09 17:34:37	14
318298	ATOM	2021-06-24	10.37	9.606	10.7	9.021	1118584.37	11113276.69	2021-06-25 23:45:32	2021-06-25 23:45:32	3
324864	ETH	2021-07-08	2114.51	2317.12	2324.72	2084.63	766987.58	1669543858.83	2021-07-09 23:48:44	2021-07-09 23:48:44	10
329984	XTZ	2021-07-19	2.286	2.43	2.449	2.266	2695624.4	6338319.89	2021-07-20 22:51:12	2021-07-20 22:51:12	5
329956	BTC	2021-07-19	30847.55	31806.3	31907.17	30487.11	38060.99	1179342118.61	2021-07-20 23:51:13	2021-07-20 23:51:13	7
9106	ANT	2020-11-02	3.002	3.062	3.06	2.952	604912.76	1815922.87	2021-05-09 17:34:37	2021-05-09 17:34:37	14
2369	OCN	2020-10-11	0.0002733	0.0002745	0.0002808	0.0002696	97256870.51	26581.47	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2370	OCN	2020-10-12	0.0002708	0.0002733	0.0002863	0.0002631	108824062.87	29473.58	2021-05-09 17:34:37	2021-05-09 17:34:37	2
9107	ANT	2020-11-03	2.865	3.002	3.122	2.855	62013.83	177673.24	2021-05-09 17:34:37	2021-05-09 17:34:37	14
8979	ANT	2020-06-28	1.318	1.272	1.4	1.247	64038.17	84395.67	2021-05-09 17:34:37	2021-05-09 17:34:37	14
8980	ANT	2020-06-29	1.35	1.318	1.393	1.311	22895.72	30920.65	2021-05-09 17:34:37	2021-05-09 17:34:37	14
3393	FIL	2020-07-29	19.88	20.78	21.12	19.26	12.3	244.52	2021-05-07 19:24:30	2021-05-07 19:24:30	13
10890	ATOM	2020-09-17	5.063	5.123	5.21	4.873	490454.66	2480838.44	2021-05-09 17:34:36	2021-05-09 17:34:36	3
9020	ANT	2020-08-08	3.124	3.139	3.612	3.112	131827.59	411832.88	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9068	ANT	2020-09-25	3.781	3.35	3.814	3.307	331188.54	1252369.87	2021-05-09 17:34:37	2021-05-09 17:34:37	14
3394	FIL	2020-07-30	19.72	19.88	19.88	18.58	47.6	938.46	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3395	FIL	2020-07-31	20.65	19.72	20.65	18.54	7.273	150.19	2021-05-07 19:24:30	2021-05-07 19:24:30	13
303058	ATOM	2021-05-23	11.68	12.26	13.09	8.62	3445397.68	36301224.76	2021-05-24 23:38:06	2021-05-24 23:38:06	3
297612	XTZ	2021-05-13	6.125	5.936	6.416	5.738	10890649.65	65909005.68	2021-05-14 23:35:51	2021-05-14 23:35:51	5
3396	FIL	2020-08-01	18.9	20.65	21.49	18.9	25.56	483.08	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3397	FIL	2020-08-02	19.15	18.9	20.12	16.72	37.46	717.39	2021-05-07 19:24:30	2021-05-07 19:24:30	13
9079	ANT	2020-10-06	3.351	3.558	3.53	3.306	80080.71	268337.04	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9080	ANT	2020-10-07	3.313	3.351	3.413	3.198	243861.01	807861.97	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9102	ANT	2020-10-29	3.056	3.104	3.314	3.016	195387.36	597087.14	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9111	ANT	2020-11-07	2.898	3.046	3.159	2.846	250951.55	727230.65	2021-05-09 17:34:37	2021-05-09 17:34:37	14
4443	EOS	2020-06-11	2.516	2.761	2.776	2.452	2650626.96	6895235.61	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4471	EOS	2020-07-09	2.651	2.683	2.728	2.584	1766779.35	4701279.15	2021-05-09 17:34:36	2021-05-09 17:34:36	9
397	DOT	2020-05-22	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
3465	FIL	2020-10-09	38.6	39.03	39.49	37.1	38.57	1488.61	2021-05-07 19:24:30	2021-05-07 19:24:30	13
1941	ZRX	2020-08-10	0.48	0.4378	0.4999	0.4143	22769188.39	10676159.57	2021-05-09 17:34:36	2021-05-09 17:34:36	6
3466	FIL	2020-10-10	38.04	38.6	39.44	36.61	54.04	2055.74	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3467	FIL	2020-10-11	40.46	38.04	41.17	36.89	49.04	1984.29	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3635	FIL	2021-03-28	125.19	132.55	133.71	120.64	991910.77	125375600.65	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3660	FIL	2021-04-22	145.93	148.12	157.7	144.61	313127.55	46676209.51	2021-05-07 19:24:30	2021-05-07 19:24:30	13
1948	ZRX	2020-08-17	0.5624	0.6092	0.6381	0.5501	29336330.88	17246604.23	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2885	BTC	2021-03-10	55893.31	54928.7	57396.59	53054.34	70138.56	3898251700.72	2021-05-09 17:34:36	2021-05-09 17:34:36	7
9112	ANT	2020-11-08	3.101	2.898	3.11	2.997	123731.77	383661	2021-05-09 17:34:37	2021-05-09 17:34:37	14
2886	BTC	2021-03-11	57809.41	55893.31	58142.77	54314.65	59202.98	3340389094.49	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2887	BTC	2021-03-12	57256.22	57809.41	58069.58	55089.68	54282.31	3079097934.08	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2888	BTC	2021-03-13	61179.79	57256.22	61749.15	56103.32	57862.75	3439594034.95	2021-05-09 17:34:36	2021-05-09 17:34:36	7
307896	ZRX	2021-06-02	1.148	1.027	1.232	1.02	31555876.25	36260531.41	2021-06-03 23:40:24	2021-06-03 23:40:24	6
9113	ANT	2020-11-09	3.09	3.101	3.101	2.987	66033.56	204044.26	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9114	ANT	2020-11-10	3.247	3.09	3.459	3.083	438408.26	1423297.13	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9115	ANT	2020-11-11	3.569	3.247	3.65	3.305	515990.79	1841389.8	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9116	ANT	2020-11-12	3.194	3.569	3.71	3.193	447459.16	1429385.57	2021-05-09 17:34:37	2021-05-09 17:34:37	14
2889	BTC	2021-03-14	58998.89	61179.79	61674.66	58980.95	34886.85	2105197604.06	2021-05-09 17:34:36	2021-05-09 17:34:36	7
1440	SJCX	2021-03-29	0.002305	0.002231	0.002305	0.002305	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
313556	XTZ	2021-06-14	3.35	3.306	3.354	3.19	2639742.6	8671578.07	2021-06-15 20:43:12	2021-06-15 20:43:12	5
324866	BCH	2021-07-08	490.9	509.32	510.77	479.73	49097.14	24209499.4	2021-07-09 23:48:44	2021-07-09 23:48:44	8
318300	BCH	2021-06-24	486.7	472.65	495.4	456.06	59392.16	28652545.45	2021-06-25 21:45:31	2021-06-25 21:45:31	8
2345	OCN	2020-09-17	0.0003583	0.0003433	0.0003739	0.0003505	62989857.02	22571.21	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2346	OCN	2020-09-18	0.0003539	0.0003583	0.0003693	0.0003423	78504097	27781.6	2021-05-09 17:34:37	2021-05-09 17:34:37	2
7736	FIL	2021-04-23	138.88	145.93	147.8	129.36	587058.23	79816213.41	2021-05-07 19:24:30	2021-05-07 19:24:30	13
329962	ATOM	2021-07-19	9.955	10.98	11.06	9.92	1783749.03	18353377.68	2021-07-20 23:51:13	2021-07-20 23:51:13	3
318756	EOS	2021-06-25	3.541	3.921	4.023	3.509	4490833.91	16769163.99	2021-06-26 23:45:45	2021-06-26 23:45:45	9
67508	FIL	2021-04-24	133.81	138.88	139.22	131.56	234362.3	31637249.46	2021-05-07 19:24:30	2021-05-07 19:24:30	13
51	XTZ	2020-06-11	2.615	2.89	2.908	2.51	5273618.06	14351538.96	2021-05-07 19:24:31	2021-05-07 19:24:31	5
2347	OCN	2020-09-19	0.0003507	0.0003539	0.0003622	0.0003468	53632553.17	18807.74	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2348	OCN	2020-09-20	0.0003302	0.0003507	0.0003451	0.0003228	75562096.52	24953.88	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2349	OCN	2020-09-21	0.0002994	0.0003302	0.0004593	0.0002756	154754969.62	46328.56	2021-05-09 17:34:37	2021-05-09 17:34:37	2
348988	BCH	2021-08-29	659.56	646.64	692.33	646.64	92606.53	62166264.41	2021-08-30 23:00:39	2021-08-30 23:00:39	8
338204	BTC	2021-08-06	42852.18	40888.18	43363.62	39895.05	48254.57	2009167763.65	2021-08-07 22:55:21	2021-08-07 22:55:21	7
343410	ZRX	2021-08-17	0.9902	1.028	1.104	0.9815	11485668.15	11971282.85	2021-08-18 23:57:54	2021-08-18 23:57:54	6
354926	XTZ	2021-09-10	6.182	5.578	6.853	5.32	59959464.9	368013390.54	2021-09-11 23:03:23	2021-09-11 23:03:23	5
360148	ANT	2021-09-21	4.531	4.915	4.775	4.515	387196.51	1754378.62	2021-09-22 23:05:56	2021-09-22 23:05:56	14
360196	BCH	2021-09-21	504.22	541.09	551.9	497.93	110371	58527837.66	2021-09-22 23:05:56	2021-09-22 23:05:56	8
365398	SJCX	2021-10-02	0.001907	0.001927	0.001907	0.001907	0	0	2021-10-03 23:08:30	2021-10-03 23:08:30	11
364912	SJCX	2021-10-01	0.001927	0.001753	0.001927	0.001927	0	0	2021-10-02 23:08:16	2021-10-02 23:08:16	11
370668	ANT	2021-10-13	4.611	4.466	4.705	4.472	297672.5	1372663.22	2021-10-14 23:11:02	2021-10-14 23:11:02	14
375712	FIL	2021-10-23	64.8	65.97	66.36	63.94	218734.85	14233308.75	2021-10-24 22:13:20	2021-10-24 22:13:20	13
382466	ZRX	2021-11-05	1.194	1.196	1.238	1.163	8542429.68	10243251.19	2021-11-06 23:16:17	2021-11-06 23:16:17	6
1605	ETH	2020-09-09	351.15	337.45	359.2	331.01	547236.41	190044274.6	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1441	SJCX	2021-03-30	0.002351	0.002305	0.002351	0.002351	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
4561	EOS	2020-10-07	2.647	2.696	2.717	2.594	2466739.64	6545487.65	2021-05-09 17:34:36	2021-05-09 17:34:36	9
1978	ZRX	2020-09-16	0.4287	0.4489	0.4489	0.4244	4026022.35	1753248.93	2021-05-09 17:34:36	2021-05-09 17:34:36	6
297614	BTC	2021-05-13	49700.6	49504.08	51377.99	47029.73	119769.29	5919941739.84	2021-05-14 23:35:49	2021-05-14 23:35:49	7
9069	ANT	2020-09-26	3.639	3.734	3.784	3.497	26280.46	95203.53	2021-05-09 17:34:37	2021-05-09 17:34:37	14
3068	BCH	2020-09-08	222.42	228.86	226.27	221.51	170061.82	37825615.7	2021-05-09 17:34:36	2021-05-09 17:34:36	8
1476	ETH	2020-05-03	210.12	214.11	213.68	208.96	1285181.25	270043070.91	2021-05-03 02:16:33	2021-05-03 02:16:33	10
123	XTZ	2020-08-22	3.579	3.39	3.619	3.271	6001628.42	20803642.28	2021-05-07 19:24:31	2021-05-07 19:24:31	5
231	XTZ	2020-12-08	2.153	2.276	2.362	2.101	4007044.27	8994362.04	2021-05-07 19:24:31	2021-05-07 19:24:31	5
9070	ANT	2020-09-27	3.353	3.613	3.68	3.293	78785.95	264181.6	2021-05-09 17:34:37	2021-05-09 17:34:37	14
3069	BCH	2020-09-09	224.32	222.42	226.77	223.7	166332.75	37311543	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3073	BCH	2020-09-13	222.15	230.27	230.1	220.18	166947.9	37086764.79	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3074	BCH	2020-09-14	225.95	222.15	232.15	223.82	199905.53	45169262.14	2021-05-09 17:34:36	2021-05-09 17:34:36	8
9071	ANT	2020-09-28	3.374	3.354	3.474	3.235	240604.55	811911.54	2021-05-09 17:34:37	2021-05-09 17:34:37	14
1471	ETH	2020-04-28	196.88	196.71	197.73	194.78	1050050.29	206733185.38	2021-04-28 19:33:32	2021-04-28 19:33:32	10
1979	ZRX	2020-09-17	0.4405	0.4287	0.4528	0.4276	3350346.61	1475249.3	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1467	ETH	2020-04-24	187.66	185.73	188.49	186.01	1279874.65	240182435.87	2021-04-24 20:10:32	2021-04-24 20:10:32	10
1468	ETH	2020-04-25	194.41	187.66	195.62	188.14	1560059.44	303289064	2021-04-24 20:10:32	2021-04-24 20:10:32	10
1474	ETH	2020-05-01	212.16	206.44	215.08	210.75	1609809.5	341543226.1	2021-05-01 22:04:03	2021-05-01 22:04:03	10
9072	ANT	2020-09-29	3.7	3.374	3.852	3.399	553288.58	2047240.93	2021-05-09 17:34:37	2021-05-09 17:34:37	14
10888	ATOM	2020-09-15	4.869	5.377	5.448	4.801	743460.53	3777701.56	2021-05-09 17:34:36	2021-05-09 17:34:36	3
9073	ANT	2020-09-30	3.669	3.7	3.706	3.493	194822.82	714866.21	2021-05-09 17:34:37	2021-05-09 17:34:37	14
1470	ETH	2020-04-27	196.71	197.62	199.9	194.06	1311828.77	258049806.65	2021-04-27 14:15:28	2021-04-27 14:15:28	10
1472	ETH	2020-04-29	215.58	196.88	228.15	212.95	2233529.7	481510851.06	2021-04-28 19:33:32	2021-04-28 19:33:32	10
10889	ATOM	2020-09-16	5.123	4.869	5.191	4.691	382163.43	1887224.68	2021-05-09 17:34:36	2021-05-09 17:34:36	3
1475	ETH	2020-05-02	214.11	212.16	216.98	213.57	836942.72	179197523.23	2021-05-01 22:04:03	2021-05-01 22:04:03	10
10891	ATOM	2020-09-18	4.968	5.063	5.207	4.778	596588.28	2969010.56	2021-05-09 17:34:36	2021-05-09 17:34:36	3
1473	ETH	2020-04-30	206.44	215.58	212.92	204.02	2277805.97	470224989.05	2021-04-30 16:57:54	2021-04-30 16:57:54	10
1980	ZRX	2020-09-18	0.4151	0.4405	0.4413	0.4092	5727460.91	2440146	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1981	ZRX	2020-09-19	0.4295	0.4151	0.4297	0.4036	2939800.38	1221178.79	2021-05-09 17:34:36	2021-05-09 17:34:36	6
9074	ANT	2020-10-01	3.779	3.669	4.009	3.54	194796.74	736044.63	2021-05-09 17:34:37	2021-05-09 17:34:37	14
1982	ZRX	2020-09-20	0.3952	0.4295	0.4297	0.3868	3533583.39	1424538.17	2021-05-09 17:34:36	2021-05-09 17:34:36	6
9075	ANT	2020-10-02	3.528	3.779	3.778	3.378	181563.73	640623.49	2021-05-09 17:34:37	2021-05-09 17:34:37	14
303060	BCH	2021-05-23	553.74	630.26	659.62	468.85	386780.65	211886289.68	2021-05-24 23:38:06	2021-05-24 23:38:06	8
1477	ETH	2020-05-04	206.76	210.12	210.32	202.24	1539124.39	318236765.14	2021-05-03 02:16:33	2021-05-03 02:16:33	10
10904	ATOM	2020-10-01	5.141	5.374	5.593	4.969	1019037.49	5396864.77	2021-05-09 17:34:36	2021-05-09 17:34:36	3
1983	ZRX	2020-09-21	0.3679	0.3952	0.407	0.3493	6946437.05	2596046.93	2021-05-09 17:34:36	2021-05-09 17:34:36	6
10905	ATOM	2020-10-02	4.904	5.141	5.269	4.65	1158496.88	5677810.44	2021-05-09 17:34:36	2021-05-09 17:34:36	3
1478	ETH	2020-05-05	205.43	206.76	211.66	205.34	981821.87	201692537.2	2021-05-03 02:16:33	2021-05-03 02:16:33	10
10906	ATOM	2020-10-03	5.01	4.904	5.139	4.871	368346.57	1855822.79	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10907	ATOM	2020-10-04	5.321	5.01	5.389	4.866	775714.47	4033045.22	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10908	ATOM	2020-10-05	5.362	5.321	5.416	5.177	606359.32	3204167.81	2021-05-09 17:34:36	2021-05-09 17:34:36	3
9076	ANT	2020-10-03	3.525	3.528	3.658	3.517	100531.54	354417.57	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9117	ANT	2020-11-13	3.49	3.194	3.579	3.175	482280.55	1683318.29	2021-05-09 17:34:37	2021-05-09 17:34:37	14
10909	ATOM	2020-10-06	4.733	5.362	5.394	4.678	869387.95	4368140.5	2021-05-09 17:34:36	2021-05-09 17:34:36	3
1984	ZRX	2020-09-22	0.3803	0.3679	0.39	0.3517	4145225.33	1545727.85	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1985	ZRX	2020-09-23	0.3406	0.3803	0.3889	0.3361	5715103.7	2066456.65	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1994	ZRX	2020-10-02	0.39	0.3984	0.3992	0.3567	5983929.05	2260505.14	2021-05-09 17:34:36	2021-05-09 17:34:36	6
318302	ZRX	2021-06-24	0.6619	0.6426	0.6814	0.6099	4732509.53	3091167.67	2021-06-25 23:45:32	2021-06-25 23:45:32	6
324868	BTC	2021-07-08	32874.01	33880.79	33934.31	32108.68	47884.76	1573967671.27	2021-07-09 23:48:44	2021-07-09 23:48:44	7
313558	FIL	2021-06-14	74.86	73.19	77.69	71.9	341544.59	25356966.56	2021-06-15 23:43:14	2021-06-15 23:43:14	13
1999	ZRX	2020-10-07	0.3576	0.3518	0.3618	0.3369	7041027.84	2463351.9	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2000	ZRX	2020-10-08	0.3677	0.3576	0.3729	0.3392	6660164.2	2357073.52	2021-05-09 17:34:36	2021-05-09 17:34:36	6
307898	ANT	2021-06-02	4.84	4.809	5.028	4.772	488929.73	2366378.35	2021-06-03 23:40:24	2021-06-03 23:40:24	14
10910	ATOM	2020-10-07	4.878	4.733	4.935	4.567	653352.59	3126763.89	2021-05-09 17:34:36	2021-05-09 17:34:36	3
329994	FIL	2021-07-19	44.66	46.86	47.09	44.4	130502.32	5928030.09	2021-07-20 23:51:13	2021-07-20 23:51:13	13
329964	OCN	2021-07-19	0.0008911	0.0009271	0.001018	0.0008366	30354529.59	27049.35	2021-07-20 23:51:13	2021-07-20 23:51:13	2
338202	ETH	2021-08-06	2892.36	2829.23	2949.04	2722.76	529985.83	1504317443.59	2021-08-07 23:55:21	2021-08-07 23:55:21	10
343356	BTC	2021-08-17	44684.43	45927.4	47100.97	44438.79	37125.87	1700658063.3	2021-08-18 23:57:53	2021-08-18 23:57:53	7
348982	XTZ	2021-08-29	5.881	5.634	6.127	5.402	24849825.75	145314564.92	2021-08-30 23:00:39	2021-08-30 23:00:39	5
354924	OCN	2021-09-10	0.0009307	0.000993	0.001091	0.0008024	8342321.41	7764.44	2021-09-11 23:03:24	2021-09-11 23:03:24	2
354934	FIL	2021-09-10	82.46	88.6	91.77	78.81	841242.93	70972272.09	2021-09-11 23:03:24	2021-09-11 23:03:24	13
360150	ETH	2021-09-21	2760.2	2966.51	3103.63	2677.64	906870.89	2632590191.67	2021-09-22 23:05:56	2021-09-22 23:05:56	10
360158	OCN	2021-09-21	0.0008281	0.0008306	0.0008557	0.0007729	13512596.87	11189.24	2021-09-22 23:05:56	2021-09-22 23:05:56	2
364902	EOS	2021-10-01	4.277	3.938	4.292	3.909	5205715.34	21516153.3	2021-10-02 23:08:17	2021-10-02 23:08:17	9
365374	DOT	2021-10-02	32.04	31.96	33.4	31.55	2826431.66	91851280.76	2021-10-03 23:08:30	2021-10-03 23:08:30	4
313560	ANT	2021-06-14	6.634	4.986	9.479	4.693	1455176.72	9653946.97	2021-06-15 23:43:14	2021-06-15 23:43:14	14
297616	BCH	2021-05-13	1255.97	1232.41	1345.02	1134.19	361952.4	448303477.19	2021-05-14 23:35:50	2021-05-14 23:35:50	8
1466	ETH	2020-04-23	185.73	183.02	194.8	184.68	2006279.73	372633155.6	2021-04-23 22:51:51	2021-04-23 22:51:51	10
4643	EOS	2020-12-28	2.763	2.713	2.889	2.685	4137178.54	11514086.4	2021-05-09 17:34:36	2021-05-09 17:34:36	9
604	DOT	2020-12-15	5.25	4.897	5.293	4.849	502478.16	2561954.11	2021-05-09 17:34:36	2021-05-09 17:34:36	4
605	DOT	2020-12-16	5.369	5.25	5.373	5.127	547783.53	2873776.89	2021-05-09 17:34:36	2021-05-09 17:34:36	4
606	DOT	2020-12-17	5.346	5.369	5.738	5.271	1290812.04	7052635.34	2021-05-09 17:34:36	2021-05-09 17:34:36	4
307900	OCN	2021-06-02	0.000839	0.000843	0.001001	0.000812	56628107.1	47512.18	2021-06-03 23:40:24	2021-06-03 23:40:24	2
1486	ETH	2020-05-13	199.86	190.1	202.28	196.78	1243792.44	248583222.72	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1615	ETH	2020-09-19	385.27	384.47	389.7	382.61	646138.01	248935189.81	2021-05-07 19:24:30	2021-05-07 19:24:30	10
303518	ANT	2021-05-24	4.09	3.376	4.097	3.561	711296	2908927.59	2021-05-25 23:38:20	2021-05-25 23:38:20	14
10780	ATOM	2020-05-30	2.823	2.68	2.974	2.779	820148.37	2315259.41	2021-05-09 17:34:36	2021-05-09 17:34:36	3
324870	ATOM	2021-07-08	11.88	12.94	12.98	11.67	1397671.74	17025019.49	2021-07-09 23:48:44	2021-07-09 23:48:44	3
10783	ATOM	2020-06-02	2.756	2.864	2.801	2.725	1196468.28	3297727.29	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10784	ATOM	2020-06-03	2.908	2.756	2.947	2.834	919679.21	2674260.13	2021-05-09 17:34:36	2021-05-09 17:34:36	3
1616	ETH	2020-09-20	371.02	385.27	380.84	369.05	717282.81	266122857.13	2021-05-07 19:24:30	2021-05-07 19:24:30	10
10785	ATOM	2020-06-04	3.106	2.903	3.153	2.89	796513.26	2443297.39	2021-05-09 17:34:36	2021-05-09 17:34:36	3
1617	ETH	2020-09-21	340.19	371.06	376.42	332.74	675272.56	235743740.73	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1618	ETH	2020-09-22	344.25	340.19	346.8	335.89	387847.54	132686320.89	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1619	ETH	2020-09-23	320.19	344.25	344.61	314.7	492135.39	163392957.36	2021-05-07 19:24:30	2021-05-07 19:24:30	10
10786	ATOM	2020-06-05	3.1	3.106	3.22	3.039	545680.14	1712528.51	2021-05-09 17:34:36	2021-05-09 17:34:36	3
1620	ETH	2020-09-24	349.18	320.19	352.84	317.14	530250.06	178780604.82	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1621	ETH	2020-09-25	352.02	349.18	358.04	338.01	455676.68	158007481.04	2021-05-07 19:24:30	2021-05-07 19:24:30	10
10787	ATOM	2020-06-06	3.061	3.1	3.152	3.049	258922.23	800778.53	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10788	ATOM	2020-06-07	3.02	3.061	3.109	2.897	388486.54	1158696.63	2021-05-09 17:34:36	2021-05-09 17:34:36	3
348986	ATOM	2021-08-29	21.22	21.33	22.41	20.37	798913.58	17136422.94	2021-08-30 22:00:39	2021-08-30 22:00:39	3
10789	ATOM	2020-06-08	3.154	3.02	3.159	3	283206.15	870296.17	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10892	ATOM	2020-09-19	4.939	4.968	5.042	4.864	381651.32	1890781.03	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10893	ATOM	2020-09-20	4.664	4.939	5.093	4.539	576140.05	2759445.82	2021-05-09 17:34:36	2021-05-09 17:34:36	3
2929	BCH	2020-04-22	233.33	219.91	235.11	227.76	309325.84	72174350.83	2021-04-22 21:03:21	2021-04-22 21:03:21	8
607	DOT	2020-12-18	5.363	5.346	5.577	5.253	809008.2	4329637.79	2021-05-09 17:34:36	2021-05-09 17:34:36	4
365376	OCN	2021-10-02	0.0004767	0.0004816	0.0004767	0.0004767	39734657.66	18941.12	2021-10-03 22:08:30	2021-10-03 22:08:30	2
10894	ATOM	2020-09-21	4.078	4.664	4.737	3.961	996812.79	4272543.09	2021-05-09 17:34:36	2021-05-09 17:34:36	3
608	DOT	2020-12-19	5.343	5.363	5.573	5.29	411818.71	2239359.93	2021-05-09 17:34:36	2021-05-09 17:34:36	4
10973	ATOM	2020-12-09	4.804	4.739	4.884	4.572	593647.59	2816851.3	2021-05-09 17:34:36	2021-05-09 17:34:36	3
4629	EOS	2020-12-14	2.845	2.853	2.864	2.801	1138010.85	3222388.25	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4630	EOS	2020-12-15	2.865	2.845	2.903	2.809	1876078.5	5387649.56	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4631	EOS	2020-12-16	3.103	2.865	3.112	2.821	3727968.85	11112054.89	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4632	EOS	2020-12-17	3.042	3.103	3.248	2.958	15414865.6	47710615.73	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4633	EOS	2020-12-18	3.064	3.042	3.13	2.98	2350333.56	7176726.63	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4634	EOS	2020-12-19	3.056	3.064	3.121	3.036	1829406.27	5642329.72	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4635	EOS	2020-12-20	3.132	3.056	3.329	3.006	6596128.73	21019444.12	2021-05-09 17:34:36	2021-05-09 17:34:36	9
609	DOT	2020-12-20	5.19	5.343	5.437	5.074	467387.09	2451861.07	2021-05-09 17:34:36	2021-05-09 17:34:36	4
610	DOT	2020-12-21	4.879	5.19	5.439	4.781	1281602.86	6484817.85	2021-05-09 17:34:36	2021-05-09 17:34:36	4
2406	OCN	2020-11-17	0.0002558	0.0002533	0.0002703	0.000251	132574000.1	33918.65	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2407	OCN	2020-11-18	0.000249	0.0002558	0.0002585	0.0002442	144614785.31	36002.6	2021-05-09 17:34:37	2021-05-09 17:34:37	2
9120	ANT	2020-11-16	3.267	3.22	3.394	3.252	96517.61	315359.06	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9121	ANT	2020-11-17	3.349	3.267	3.794	3.306	360799.51	1208275.59	2021-05-09 17:34:37	2021-05-09 17:34:37	14
318748	ETH	2021-06-25	1810.27	1989.01	2019.45	1791.99	882983.22	1653237866.52	2021-06-26 23:45:45	2021-06-26 23:45:45	10
329966	EOS	2021-07-19	3.434	3.64	3.681	3.409	2549805.97	8959134.59	2021-07-20 23:51:13	2021-07-20 23:51:13	9
343820	ZRX	2021-08-18	0.9657	0.9902	1.021	0.927	8255216.39	8022821.38	2021-08-19 23:58:08	2021-08-19 23:58:08	6
338206	DOT	2021-08-06	20.43	19.13	20.81	18.45	3276855.94	64869914.83	2021-08-07 23:55:21	2021-08-07 23:55:21	4
318304	EOS	2021-06-24	3.921	3.674	3.926	3.522	5287304.08	19933554.37	2021-06-25 23:45:32	2021-06-25 23:45:32	9
343858	BCH	2021-08-18	632.53	638.76	654.93	620.6	65444.61	41786098.81	2021-08-19 23:58:08	2021-08-19 23:58:08	8
354938	EOS	2021-09-10	4.568	4.813	5.052	4.459	10133156.75	47820029.1	2021-09-11 23:03:24	2021-09-11 23:03:24	9
370672	DOT	2021-10-13	41.69	35.16	43.26	33.63	9475939.45	370389475.37	2021-10-14 23:11:02	2021-10-14 23:11:02	4
360152	ZRX	2021-09-21	0.8438	0.9037	0.9447	0.8261	9925474.79	8815895.34	2021-09-22 23:05:56	2021-09-22 23:05:56	6
364900	ZRX	2021-10-01	0.9806	0.9143	0.9885	0.8842	10612063.34	10014620.95	2021-10-02 23:08:17	2021-10-02 23:08:17	6
375716	BCH	2021-10-23	629.11	623.95	637.83	614.58	52399.43	32886075.93	2021-10-24 22:13:20	2021-10-24 22:13:20	8
370682	ETH	2021-10-13	3607.55	3490.61	3613.53	3413.15	280470.44	983041094.72	2021-10-14 23:11:02	2021-10-14 23:11:02	10
382460	BCH	2021-11-05	598.39	596.3	633.28	592.56	89748.19	54404590.25	2021-11-06 23:16:17	2021-11-06 23:16:17	8
382468	EOS	2021-11-05	4.507	4.543	4.6	4.46	3726353.21	16858732.37	2021-11-06 22:16:17	2021-11-06 22:16:17	9
382472	ATOM	2021-11-05	36.79	37.53	38.97	36.38	1773666.68	66719646.05	2021-11-06 22:16:17	2021-11-06 22:16:17	3
387176	BCH	2021-11-14	679.36	665.99	679.63	658.01	36771.36	24556799.24	2021-11-15 21:18:20	2021-11-15 21:18:20	8
3086	BCH	2020-09-26	221.45	216.66	224.13	214.04	119372.74	26434754.84	2021-05-09 17:34:36	2021-05-09 17:34:36	8
2109	ZRX	2021-01-25	0.5202	0.5485	0.5645	0.514	8638833.86	4720720.33	2021-05-09 17:34:36	2021-05-09 17:34:36	6
10792	ATOM	2020-06-11	2.759	3.114	3.132	2.73	490833.88	1434456.07	2021-05-09 17:34:36	2021-05-09 17:34:36	3
2110	ZRX	2021-01-26	0.5441	0.5202	0.5555	0.4969	11378548.47	6011043.26	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2111	ZRX	2021-01-27	0.5856	0.5441	0.6092	0.5093	44676636.35	25379849.6	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2112	ZRX	2021-01-28	0.6107	0.5856	0.6797	0.5789	43859823.19	27466468.1	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2149	ZRX	2021-03-06	1.373	1.344	1.407	1.319	681323.61	927188.64	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2408	OCN	2020-11-19	0.0002595	0.000249	0.0002926	0.0002407	168888996.08	43833.37	2021-05-09 17:34:37	2021-05-09 17:34:37	2
303520	DOT	2021-05-24	23.25	17.94	23.49	17.15	3322099.9	68466765.38	2021-05-25 23:38:19	2021-05-25 23:38:19	4
303534	SJCX	2021-05-24	0.001554	0.001389	0.001554	0.001554	0	0	2021-05-25 23:38:20	2021-05-25 23:38:20	11
324872	FIL	2021-07-08	53.88	56.43	56.45	52.86	187523.94	10362809.45	2021-07-09 23:48:44	2021-07-09 23:48:44	13
313562	EOS	2021-06-14	5.296	5.091	5.322	4.956	3215563.27	16531728.9	2021-06-15 23:43:14	2021-06-15 23:43:14	9
297618	OCN	2021-05-13	0.001264	0.001296	0.001488	0.001153	54589718.07	69026.33	2021-05-14 23:35:49	2021-05-14 23:35:49	2
1487	ETH	2020-05-14	203.31	199.86	210.06	200.66	1956532.07	397775930.68	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1488	ETH	2020-05-15	194.71	203.31	197.59	192.57	1559838.38	303712134.51	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1489	ETH	2020-05-16	200.6	194.71	201.92	195.91	1222798.74	245295750.07	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1490	ETH	2020-05-17	206.76	200.6	208.01	202.69	1035920.54	214183380.54	2021-05-07 19:24:30	2021-05-07 19:24:30	10
9122	ANT	2020-11-18	3.178	3.349	3.561	3.088	498073.79	1583080.95	2021-05-09 17:34:37	2021-05-09 17:34:37	14
10793	ATOM	2020-06-12	2.858	2.759	2.924	2.734	285119.66	810790.71	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10794	ATOM	2020-06-13	2.867	2.858	2.897	2.817	237986.22	679603.32	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10795	ATOM	2020-06-14	2.751	2.867	2.87	2.716	287786.32	806552.55	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10796	ATOM	2020-06-15	2.708	2.751	2.769	2.537	505642.34	1337601.55	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10797	ATOM	2020-06-16	2.725	2.714	2.81	2.707	580255.47	1581400.99	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10798	ATOM	2020-06-17	2.698	2.721	2.734	2.653	236702.88	636681.69	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10799	ATOM	2020-06-18	2.641	2.702	2.68	2.636	498845.94	1317332.8	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10815	ATOM	2020-07-04	2.785	2.684	2.785	2.681	319140.1	874127.85	2021-05-09 17:34:36	2021-05-09 17:34:36	3
9123	ANT	2020-11-19	3.077	3.178	3.198	3.044	287680.55	885058.67	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9124	ANT	2020-11-20	3.159	3.077	3.309	3.131	392741.89	1240842.23	2021-05-09 17:34:37	2021-05-09 17:34:37	14
10816	ATOM	2020-07-05	2.942	2.785	2.993	2.751	1236723.7	3557301.35	2021-05-09 17:34:36	2021-05-09 17:34:36	3
1492	ETH	2020-05-19	214.68	214.68	216.63	213.31	997340.42	214104443.63	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1493	ETH	2020-05-20	209.87	214.68	210.54	206.83	895429.22	187926919.47	2021-05-07 19:24:30	2021-05-07 19:24:30	10
307902	DOT	2021-06-02	25.95	22.82	26.84	22.68	2200182.89	55545349.62	2021-06-03 23:40:24	2021-06-03 23:40:24	4
1494	ETH	2020-05-21	198.56	209.85	211.42	191.63	576319.94	115900478.36	2021-05-07 19:24:30	2021-05-07 19:24:30	10
10817	ATOM	2020-07-06	3.019	2.942	3.128	2.921	1170486.48	3538906.76	2021-05-09 17:34:36	2021-05-09 17:34:36	3
2073	ZRX	2020-12-20	0.3959	0.4241	0.4241	0.3888	5905011.96	2393997.2	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1495	ETH	2020-05-22	207.35	198.58	208.27	200.2	983282.11	203883969.7	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1496	ETH	2020-05-23	206.78	207.35	209.35	206.32	765519.54	158295000.8	2021-05-07 19:24:30	2021-05-07 19:24:30	10
318306	XTZ	2021-06-24	2.825	2.686	2.842	2.575	3469778.89	9465803.29	2021-06-25 23:45:32	2021-06-25 23:45:32	5
2074	ZRX	2020-12-21	0.3774	0.3959	0.4056	0.3694	5902073.84	2282814.44	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2075	ZRX	2020-12-22	0.3751	0.3774	0.3882	0.356	7765943.64	2902551.78	2021-05-09 17:34:36	2021-05-09 17:34:36	6
318758	BTC	2021-06-25	31593.86	34649.84	35494.5	31290.25	91636.1	3027434524.39	2021-06-26 23:45:46	2021-06-26 23:45:46	7
1497	ETH	2020-05-24	199.91	206.78	201.75	196.17	966301.7	193178180.87	2021-05-07 19:24:30	2021-05-07 19:24:30	10
2094	ZRX	2021-01-10	0.5273	0.5435	0.5892	0.4538	49238918.19	25916578.98	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2095	ZRX	2021-01-11	0.4373	0.5273	0.5283	0.3793	40347585.47	17645310.58	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1498	ETH	2020-05-25	204.2	199.91	206.78	203.67	984408.69	201016206.46	2021-05-07 19:24:30	2021-05-07 19:24:30	10
3606	FIL	2021-02-27	38.04	35.12	38.74	35.08	333616.97	12387159.51	2021-05-07 19:24:30	2021-05-07 19:24:30	13
2096	ZRX	2021-01-12	0.4275	0.4373	0.4641	0.4102	16983236.3	7392432.83	2021-05-09 17:34:36	2021-05-09 17:34:36	6
3607	FIL	2021-02-28	35.97	38.04	38.35	34.89	322240.02	11665803.29	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3608	FIL	2021-03-01	38.58	35.97	39.51	35.74	381644.05	14394614.46	2021-05-07 19:24:30	2021-05-07 19:24:30	13
2097	ZRX	2021-01-13	0.5061	0.4275	0.5452	0.4275	36725178.82	18305338.63	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2098	ZRX	2021-01-14	0.5043	0.5061	0.5232	0.4781	18754597.11	9338105.19	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2099	ZRX	2021-01-15	0.5158	0.5043	0.5565	0.4607	23260683.55	11831035.82	2021-05-09 17:34:36	2021-05-09 17:34:36	6
348990	FIL	2021-08-29	73.68	74	75.45	72.53	146386.75	10845807.33	2021-08-30 23:00:39	2021-08-30 23:00:39	13
329990	SJCX	2021-07-19	0.001234	0.001272	0.001234	0.001234	0	0	2021-07-20 22:51:13	2021-07-20 22:51:13	11
343822	BTC	2021-08-18	44714.54	44684.43	46024.97	44240.9	30513.78	1377529230.43	2021-08-19 23:58:08	2021-08-19 23:58:08	7
354928	ATOM	2021-09-10	29.37	26.83	30.44	24.62	3438555.54	95173040.39	2021-09-11 23:03:23	2021-09-11 23:03:23	3
338684	BTC	2021-08-07	44617.96	42852.18	44731.51	42473.57	50446.88	2199730007.61	2021-08-08 23:55:35	2021-08-08 23:55:35	7
370674	ZRX	2021-10-13	1.028	0.9992	1.029	0.9735	4756471.38	4766432.28	2021-10-14 22:11:02	2021-10-14 22:11:02	6
364910	OCN	2021-10-01	0.0004816	0.0004383	0.0004816	0.0004816	37516338.56	18069.5	2021-10-02 23:08:17	2021-10-02 23:08:17	2
360154	SJCX	2021-09-21	0.001628	0.001717	0.001628	0.001628	0	0	2021-09-22 21:05:55	2021-09-22 21:05:55	11
375718	ATOM	2021-10-23	35.69	34.05	37.16	33.78	2265094.58	80656138.99	2021-10-24 23:13:20	2021-10-24 23:13:20	3
375728	OCN	2021-10-23	0.0006131	0.0006069	0.001226	0.0006131	245508980.61	150529.14	2021-10-24 23:13:21	2021-10-24 23:13:21	2
382474	SJCX	2021-11-05	0.002441	0.002458	0.002441	0.002441	0	0	2021-11-06 23:16:21	2021-11-06 23:16:21	11
382470	ANT	2021-11-05	5.041	5.21	5.207	5.021	241460.44	1217162.02	2021-11-06 23:16:17	2021-11-06 23:16:17	14
387198	SJCX	2021-11-14	0.00262	0.002576	0.00262	0.00262	0	0	2021-11-15 22:18:21	2021-11-15 22:18:21	11
1502	ETH	2020-05-29	220.63	220.33	221.95	216.77	1038042.57	229023699.89	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1503	ETH	2020-05-30	243.66	220.63	248.02	226.3	1647126.21	401336258.16	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1504	ETH	2020-05-31	231.54	243.66	239.95	231.16	1215884.5	281521659.77	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1505	ETH	2020-06-01	248.44	231.54	257.73	247.01	1476844.58	366906124.23	2021-05-07 19:24:30	2021-05-07 19:24:30	10
313564	DOT	2021-06-14	25.87	22.07	26.04	21.25	2633673.45	62981165.02	2021-06-15 19:43:12	2021-06-15 19:43:12	4
3087	BCH	2020-09-27	229.43	221.45	232.34	219.73	150526.97	34535354.8	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3103	BCH	2020-10-13	253.57	239.8	256.09	237.23	329803.58	83628809.96	2021-05-09 17:34:36	2021-05-09 17:34:36	8
318768	SJCX	2021-06-25	0.001264	0.001386	0.001264	0.001264	0	0	2021-06-26 23:45:46	2021-06-26 23:45:46	11
297620	FIL	2021-05-13	117.77	126.96	128	86.49	1674214.7	190078785.8	2021-05-14 23:35:49	2021-05-14 23:35:49	13
297624	ZRX	2021-05-13	1.608	1.647	1.769	1.466	32370176.71	52516223.46	2021-05-14 23:35:51	2021-05-14 23:35:51	6
3104	BCH	2020-10-14	259.22	253.57	260.13	251.67	265748.95	68886519.08	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3105	BCH	2020-10-15	262.27	259.22	267.68	258.94	259484.53	68056145.5	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3136	BCH	2020-11-15	240.27	255.29	259.43	237.08	227043.67	54551495.38	2021-05-09 17:34:36	2021-05-09 17:34:36	8
318308	SJCX	2021-06-24	0.001386	0.001347	0.001386	0.001386	0	0	2021-06-25 23:45:32	2021-06-25 23:45:32	11
3137	BCH	2020-11-16	249.15	240.27	259.18	244.97	246130.42	61323333.59	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3138	BCH	2020-11-17	254.97	249.15	268.41	252.67	184013.11	46917419.08	2021-05-09 17:34:36	2021-05-09 17:34:36	8
303522	ZRX	2021-05-24	0.9866	0.797	0.9962	0.7835	23963886.73	21384831.9	2021-05-25 23:38:20	2021-05-25 23:38:20	6
3139	BCH	2020-11-18	245.98	254.97	258.43	239.76	208308.61	51240608.89	2021-05-09 17:34:36	2021-05-09 17:34:36	8
307904	SJCX	2021-06-02	0.001503	0.001467	0.001503	0.001503	0	0	2021-06-03 21:40:23	2021-06-03 21:40:23	11
3140	BCH	2020-11-19	245.09	245.98	250.97	242.59	187117.97	45860518.73	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3141	BCH	2020-11-20	259.36	245.09	267.77	252.46	231330.16	59998927.1	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3190	BCH	2021-01-08	437.65	448.88	464.88	429.53	730798.61	319835696.01	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3191	BCH	2021-01-09	576.19	437.65	587.05	424.5	962743.48	554722175.27	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3192	BCH	2021-01-10	600.92	576.19	616.58	520.31	1311153.1	787896440.48	2021-05-09 17:34:36	2021-05-09 17:34:36	8
388170	FIL	2021-11-16	57.53	60.83	60.94	56.29	281145.39	16342302.42	2021-11-16 04:18:24	2021-11-16 04:18:24	13
330418	BTC	2021-07-20	29795.55	30847.55	31063.88	29320.09	43333.42	1291958152.32	2021-07-21 23:51:27	2021-07-21 23:51:27	7
3193	BCH	2021-01-11	477.78	600.92	566.16	462.16	1271553.73	607518571.81	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3194	BCH	2021-01-12	451.95	477.78	478.86	450.93	616031.77	278418618.9	2021-05-09 17:34:36	2021-05-09 17:34:36	8
10818	ATOM	2020-07-07	3.243	3.019	3.281	2.968	1032709.67	3254220.49	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10819	ATOM	2020-07-08	3.553	3.243	3.576	3.163	1673195.98	5722932.03	2021-05-09 17:34:36	2021-05-09 17:34:36	3
2413	OCN	2020-11-24	0.0002783	0.000268	0.0002844	0.0002662	168765498.04	46971.32	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2414	OCN	2020-11-25	0.0002904	0.0002783	0.0003018	0.0002562	165267178.89	47992.6	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2415	OCN	2020-11-26	0.0002601	0.0002904	0.0002757	0.0002445	211422311.58	54993.06	2021-05-09 17:34:37	2021-05-09 17:34:37	2
349460	DOT	2021-08-30	26.03	25.73	27.55	24.37	4525827.35	117324426.55	2021-08-31 23:00:53	2021-08-31 23:00:53	4
324900	SJCX	2021-07-08	0.001315	0.001355	0.001315	0.001315	0	0	2021-07-09 19:48:42	2021-07-09 19:48:42	11
365382	FIL	2021-10-02	69.72	71.51	74	68.39	740032.47	52693434.91	2021-10-03 20:08:29	2021-10-03 20:08:29	13
375730	BTC	2021-10-23	61313.09	60693.59	61733.43	59705.11	16232.5	990360071.85	2021-10-24 23:13:20	2021-10-24 23:13:20	7
2416	OCN	2020-11-27	0.000249	0.0002601	0.0002594	0.0002439	156288722.68	38921.89	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2417	OCN	2020-11-28	0.0002529	0.000249	0.000269	0.0002529	149896145.62	37902.03	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2418	OCN	2020-11-29	0.0002592	0.0002529	0.0002822	0.0002592	150954454.43	39127.39	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2419	OCN	2020-11-30	0.0002711	0.0002592	0.0002834	0.0002649	159589057.24	43264.85	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2420	OCN	2020-12-01	0.0002697	0.0002711	0.0002814	0.0002462	181076012.49	48830.01	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2433	OCN	2020-12-14	0.0002756	0.0002895	0.0003108	0.0002697	213991191.47	58972.66	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2434	OCN	2020-12-15	0.0002887	0.0002756	0.0002887	0.000271	198989662.09	57446.98	2021-05-09 17:34:37	2021-05-09 17:34:37	2
9125	ANT	2020-11-21	3.501	3.159	3.505	3.159	370096.65	1295856.42	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9126	ANT	2020-11-22	3.937	3.497	4.45	3.527	216989.28	854258.65	2021-05-09 17:34:37	2021-05-09 17:34:37	14
365368	BCH	2021-10-02	552.01	543.78	557.25	536.75	131529.33	72605143.96	2021-10-03 22:08:29	2021-10-03 22:08:29	8
324874	OCN	2021-07-08	0.0006344	0.000672	0.0007401	0.0006132	55224641.47	35031.92	2021-07-09 23:48:44	2021-07-09 23:48:44	2
343824	ATOM	2021-08-18	17.99	16	18.53	15.03	2672003.4	44186015.74	2021-08-19 23:58:08	2021-08-19 23:58:08	3
333168	ETH	2021-07-26	2228.67	2194.34	2430.27	2175.42	755760.16	1749133447.44	2021-07-27 23:52:50	2021-07-27 23:52:50	10
375720	EOS	2021-10-23	4.748	4.612	4.77	4.584	2927092.29	13735975.74	2021-10-24 23:13:20	2021-10-24 23:13:20	9
360156	EOS	2021-09-21	3.881	4.185	4.309	3.79	10134702.16	41407396.77	2021-09-22 23:05:56	2021-09-22 23:05:56	9
354994	ZRX	2021-09-10	1.007	1.068	1.109	0.9741	15527866.32	16246727.24	2021-09-11 23:03:24	2021-09-11 23:03:24	6
338686	ZRX	2021-08-07	0.9329	0.8961	0.9378	0.8822	9577688.3	8696874.73	2021-08-08 21:55:34	2021-08-08 21:55:34	6
382476	OCN	2021-11-05	0.0006102	0.0006145	0.0006102	0.0006102	38090598.67	23242.75	2021-11-06 23:20:07	2021-11-06 23:20:07	2
370676	BTC	2021-10-13	57369	56010.9	57768.98	54279.61	34054.43	1906230334	2021-10-14 23:11:02	2021-10-14 23:11:02	7
387662	ATOM	2021-11-15	31.46	31.92	33.7	31.3	1572317.64	51243160.81	2021-11-16 04:18:24	2021-11-16 04:18:24	3
2379	OCN	2020-10-21	0.0002623	0.0002508	0.0002701	0.0002544	108825474.29	28542.55	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2380	OCN	2020-10-22	0.0002653	0.0002623	0.0002819	0.0002611	108889402.67	28886.18	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2461	OCN	2021-01-11	0.0002612	0.0002763	0.0003047	0.0002394	351198431.8	91736.12	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2462	OCN	2021-01-12	0.000252	0.0002612	0.0002625	0.0002415	387286302.52	97599.87	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2463	OCN	2021-01-13	0.0002599	0.000252	0.0002825	0.0002599	405794103.7	105450.95	2021-05-09 17:34:37	2021-05-09 17:34:37	2
9169	ANT	2021-01-04	3.338	3.065	4.042	2.968	426045.1	1421961.02	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9170	ANT	2021-01-05	3.31	3.338	3.666	3.231	508764.68	1683951.73	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9171	ANT	2021-01-06	3.467	3.31	3.836	3.448	460941.91	1598009.47	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9172	ANT	2021-01-07	3.479	3.467	4.216	3.369	817903.66	2845425.99	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9173	ANT	2021-01-08	3.308	3.479	4.478	3.271	470461.15	1556377.83	2021-05-09 17:34:37	2021-05-09 17:34:37	14
1585	ETH	2020-08-20	416.04	407.85	419.09	402.63	594336.14	245429680.33	2021-05-07 19:24:30	2021-05-07 19:24:30	10
10899	ATOM	2020-09-26	4.598	4.798	4.816	4.457	264504.05	1228322.02	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10900	ATOM	2020-09-27	4.722	4.598	4.79	4.521	356605.42	1666764.83	2021-05-09 17:34:36	2021-05-09 17:34:36	3
2127	ZRX	2021-02-12	1.806	1.769	2.025	1.71	71091806.08	130758486.64	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2128	ZRX	2021-02-13	1.89	1.806	1.928	1.653	39447252.45	71672288.42	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2129	ZRX	2021-02-14	1.801	1.89	2.012	1.684	44315362.89	81675480.39	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2130	ZRX	2021-02-15	1.617	1.801	1.817	1.436	26928176.9	43075796.25	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2131	ZRX	2021-02-16	1.585	1.617	1.704	1.509	9210041.65	15065327.22	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1591	ETH	2020-08-26	386.02	383.34	393.33	377.76	338689.99	130709996.59	2021-05-07 19:24:30	2021-05-07 19:24:30	10
10901	ATOM	2020-09-28	4.827	4.722	5.188	4.722	950087.7	4727930.11	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10902	ATOM	2020-09-29	5.309	4.827	5.389	4.801	1160043.09	5943869.18	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10903	ATOM	2020-09-30	5.374	5.309	5.593	5.202	2005038.02	10862480.41	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10911	ATOM	2020-10-08	5.032	4.878	5.124	4.622	574547.02	2822812.46	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10918	ATOM	2020-10-15	5.764	5.738	5.906	5.502	565642.65	3204616.23	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10919	ATOM	2020-10-16	5.409	5.764	5.841	5.327	504755.79	2778105.2	2021-05-09 17:34:36	2021-05-09 17:34:36	3
1586	ETH	2020-08-21	387.98	416.04	418.78	385.2	833269.52	335992540.64	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1587	ETH	2020-08-22	395.46	387.98	397.18	379.8	704832.42	274291152.47	2021-05-07 19:24:30	2021-05-07 19:24:30	10
297622	DOT	2021-05-13	40.04	34.52	41.89	33.09	3916476.47	150816010.74	2021-05-14 23:35:49	2021-05-14 23:35:49	4
1592	ETH	2020-08-27	382.99	385.98	387.86	377.32	841628.48	322334008.91	2021-05-07 19:24:30	2021-05-07 19:24:30	10
10920	ATOM	2020-10-17	5.439	5.409	5.523	5.294	339685.59	1841244.75	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10921	ATOM	2020-10-18	5.769	5.439	5.794	5.42	285598.42	1604416.66	2021-05-09 17:34:36	2021-05-09 17:34:36	3
9174	ANT	2021-01-09	3.497	3.308	3.587	3.204	487886.4	1706319.5	2021-05-09 17:34:37	2021-05-09 17:34:37	14
1593	ETH	2020-08-28	395.54	382.99	398.08	388.28	713748.95	282317937.64	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1594	ETH	2020-08-29	398.95	395.54	404.11	392.52	623460.61	248727540.47	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1595	ETH	2020-08-30	429.18	398.95	430.11	407.15	990688.35	425180515.49	2021-05-07 19:24:30	2021-05-07 19:24:30	10
2321	OCN	2020-08-24	0.0005549	0.0005705	0.0006039	0.0005508	27036790.95	15003.28	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2322	OCN	2020-08-25	0.000529	0.0005549	0.0005443	0.000506	22313991.52	11804.31	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2344	OCN	2020-09-16	0.0003433	0.000346	0.0003542	0.000336	80048332.91	27478.88	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2371	OCN	2020-10-13	0.0002822	0.0002708	0.0002861	0.000267	117522517.42	33169.95	2021-05-09 17:34:37	2021-05-09 17:34:37	2
9175	ANT	2021-01-10	3.797	3.497	3.808	3.297	425106.69	1614089.6	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9176	ANT	2021-01-11	3.352	3.797	3.809	3.305	532614.13	1785074.98	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9188	ANT	2021-01-23	3.712	3.37	3.863	3.233	558686.15	2073621.04	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9190	ANT	2021-01-25	3.876	4.239	4.364	3.747	713999.41	2767647.3	2021-05-09 17:34:37	2021-05-09 17:34:37	14
1588	ETH	2020-08-23	390.72	395.46	397.58	383.56	400399.03	156583241.04	2021-05-07 19:24:30	2021-05-07 19:24:30	10
303556	ETH	2021-05-24	2648.77	2098.57	2675.29	2081.99	1906727.17	4567480766.29	2021-05-25 23:38:19	2021-05-25 23:38:19	10
303524	FIL	2021-05-24	74.56	65.15	75	62.76	1240758.52	85085461.47	2021-05-25 23:38:19	2021-05-25 23:38:19	13
308376	ZRX	2021-06-03	1.189	1.148	1.232	1.094	10784350.34	12610813.87	2021-06-04 23:40:37	2021-06-04 23:40:37	6
313588	OCN	2021-06-14	0.0008263	0.0008031	0.0008779	0.0008263	43158209.44	35660.7	2021-06-15 23:43:14	2021-06-15 23:43:14	2
10922	ATOM	2020-10-19	5.503	5.769	5.784	5.462	458258.69	2573068.75	2021-05-09 17:34:36	2021-05-09 17:34:36	3
1589	ETH	2020-08-24	408.03	390.72	410.39	387.72	668668.61	269045578.82	2021-05-07 19:24:30	2021-05-07 19:24:30	10
2464	OCN	2021-01-14	0.0002587	0.0002599	0.0002957	0.0002587	402027890.47	104021.94	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2465	OCN	2021-01-15	0.0002572	0.0002587	0.0002806	0.0002455	385703975.61	99200.44	2021-05-09 17:34:37	2021-05-09 17:34:37	2
1596	ETH	2020-08-31	434.14	429.18	436.58	420.61	1167183.52	506717370.21	2021-05-07 19:24:30	2021-05-07 19:24:30	10
2466	OCN	2021-01-16	0.0002703	0.0002572	0.0002826	0.000258	443716386.39	119925.18	2021-05-09 17:34:37	2021-05-09 17:34:37	2
313568	ETH	2021-06-14	2582.12	2509.7	2608.81	2462.27	388978.97	985454994.26	2021-06-15 23:43:14	2021-06-15 23:43:14	10
1597	ETH	2020-09-01	475.99	434.14	483.63	442.6	1764604.57	839941536.91	2021-05-07 19:24:30	2021-05-07 19:24:30	10
2467	OCN	2021-01-17	0.0002714	0.0002703	0.0002838	0.0002591	435738713.94	118268.46	2021-05-09 17:34:37	2021-05-09 17:34:37	2
1598	ETH	2020-09-02	439.83	475.81	481.22	421.58	892744.77	399846874.92	2021-05-07 19:24:30	2021-05-07 19:24:30	10
318310	FIL	2021-06-24	57.14	58.77	59.28	54.22	495548.16	28116127.68	2021-06-25 23:45:32	2021-06-25 23:45:32	13
318752	XTZ	2021-06-25	2.524	2.825	2.877	2.487	4247644.22	11186584.17	2021-06-26 23:45:45	2021-06-26 23:45:45	5
324876	EOS	2021-07-08	3.598	3.823	3.838	3.527	2367755.04	8658683.26	2021-07-09 21:48:43	2021-07-09 21:48:43	9
330420	DOT	2021-07-20	10.97	11.43	11.54	10.38	1726025.69	18759167.45	2021-07-21 23:51:27	2021-07-21 23:51:27	4
333170	BTC	2021-07-26	37269.52	35369.93	40553.85	35270.24	100269.43	3840983132.28	2021-07-27 22:52:49	2021-07-27 22:52:49	7
338688	DOT	2021-08-07	20.98	20.43	21.68	20.04	2978394.29	61971041.85	2021-08-08 23:55:35	2021-08-08 23:55:35	4
343826	DOT	2021-08-18	23.9	23.56	25.17	22.61	4396456.91	105639594.99	2021-08-19 23:58:08	2021-08-19 23:58:08	4
349462	ETH	2021-08-30	3228.46	3225.3	3348.62	3146.73	412458.94	1341591930.15	2021-08-31 23:00:52	2021-08-31 23:00:52	10
2397	OCN	2020-11-08	0.0002501	0.0002441	0.0002728	0.0002456	77573835.98	19401.76	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2398	OCN	2020-11-09	0.0002533	0.0002501	0.0002578	0.0002444	58653902.61	14859.17	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2399	OCN	2020-11-10	0.000275	0.0002533	0.0002795	0.0002525	60573240.58	16659.13	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2400	OCN	2020-11-11	0.0002552	0.000275	0.000283	0.0002552	83391160.78	21277.3	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2401	OCN	2020-11-12	0.0002638	0.0002552	0.0003147	0.0002499	135760261.02	35811.47	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2426	OCN	2020-12-07	0.000278	0.000277	0.000278	0.0002662	133851531.08	37213.28	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2435	OCN	2020-12-16	0.0002806	0.0002887	0.0003125	0.0002742	220028771.78	61741.31	2021-05-09 17:34:37	2021-05-09 17:34:37	2
9197	ANT	2021-02-01	4.249	4.189	4.608	4.058	667060.67	2834343.19	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9255	ANT	2021-03-31	10.82	11.77	11.84	10.58	955317.32	10334679.32	2021-05-09 17:34:37	2021-05-09 17:34:37	14
10912	ATOM	2020-10-09	5.158	5.032	5.296	4.933	556791.4	2861083.31	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10913	ATOM	2020-10-10	5.544	5.158	5.719	5.157	720024.18	3939133.18	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10914	ATOM	2020-10-11	6.085	5.544	6.264	5.424	1892248.67	11208768.75	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10915	ATOM	2020-10-12	5.968	6.085	6.25	5.787	883061.19	5328097.71	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10916	ATOM	2020-10-13	6.014	5.968	6.189	5.818	615669.38	3680720.88	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10917	ATOM	2020-10-14	5.738	6.014	6.139	5.638	519935.97	3043569.76	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10923	ATOM	2020-10-20	5.032	5.503	5.51	5.002	600621.33	3168902.81	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10924	ATOM	2020-10-21	5.242	5.032	5.49	5.006	453546.66	2409509.13	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10925	ATOM	2020-10-22	5.448	5.242	5.585	5.235	313143.87	1704954.42	2021-05-09 17:34:36	2021-05-09 17:34:36	3
2132	ZRX	2021-02-17	1.562	1.585	1.601	1.422	8885998.8	13313034.18	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2133	ZRX	2021-02-18	1.609	1.562	1.634	1.517	4854885.59	7745367.05	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2186	ZRX	2021-04-12	2.129	2.128	2.185	2.036	7209582.56	15150634.78	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2187	ZRX	2021-04-13	2.301	2.129	2.397	2.092	16022959.82	36378682.81	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2188	ZRX	2021-04-14	2.157	2.301	2.343	2.059	15347662.93	33395022.83	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2189	ZRX	2021-04-15	2.203	2.157	2.245	2.104	9532993.4	20793699.71	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2190	ZRX	2021-04-16	2.078	2.203	2.214	1.98	13662253.87	28464159.08	2021-05-09 17:34:36	2021-05-09 17:34:36	6
10927	ATOM	2020-10-24	5.548	5.367	5.6	5.244	415240.3	2234923.64	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10928	ATOM	2020-10-25	5.297	5.548	5.658	5.252	255129.33	1392815.78	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10929	ATOM	2020-10-26	5.151	5.297	5.369	4.996	505944.14	2606115.49	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10932	ATOM	2020-10-29	4.641	4.815	4.864	4.541	310271.94	1455497.8	2021-05-09 17:34:36	2021-05-09 17:34:36	3
303526	BCH	2021-05-24	753.88	553.74	760.56	539.98	305217.8	195955587.17	2021-05-25 23:38:19	2021-05-25 23:38:19	8
2191	ZRX	2021-04-17	2.036	2.078	2.201	2.031	8341302.16	17621466.58	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2192	ZRX	2021-04-18	1.765	2.036	2.044	1.541	30132172.11	52218331.3	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2193	ZRX	2021-04-19	1.588	1.765	1.866	1.573	12099152.34	20546711.16	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2194	ZRX	2021-04-20	1.705	1.588	1.762	1.45	17989711.46	28826606.18	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2195	ZRX	2021-04-21	1.638	1.705	1.806	1.627	12068516.98	20586563.56	2021-05-09 17:34:36	2021-05-09 17:34:36	6
298132	SJCX	2021-05-14	0.001996	0.001988	0.001996	0.001996	0	0	2021-05-15 23:36:03	2021-05-15 23:36:03	11
2381	OCN	2020-10-23	0.000258	0.0002653	0.0002662	0.000258	104303730.44	26913.4	2021-05-09 17:34:37	2021-05-09 17:34:37	2
10933	ATOM	2020-10-30	4.628	4.641	4.714	4.349	493329.57	2225849.44	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10934	ATOM	2020-10-31	4.619	4.628	4.806	4.593	322100.27	1519151.26	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10935	ATOM	2020-11-01	4.748	4.619	5.008	4.548	837494.33	3950048.66	2021-05-09 17:34:36	2021-05-09 17:34:36	3
2382	OCN	2020-10-24	0.0002681	0.000258	0.0002723	0.0002599	104801160.83	28101.17	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2383	OCN	2020-10-25	0.000256	0.0002681	0.0002682	0.0002519	113109641.43	28952.56	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2384	OCN	2020-10-26	0.0002516	0.000256	0.0002634	0.0002437	101612816.38	25564.81	2021-05-09 17:34:37	2021-05-09 17:34:37	2
308378	EOS	2021-06-03	6.53	6.377	6.696	6.23	4746118.32	30648587.84	2021-06-04 23:40:37	2021-06-04 23:40:37	9
324878	ZRX	2021-07-08	0.841	0.7889	0.841	0.7094	8420107.8	6402943.71	2021-07-09 22:48:43	2021-07-09 22:48:43	6
313574	ZRX	2021-06-14	0.91	0.8962	0.9338	0.8674	4749741.49	4294383.36	2021-06-15 23:43:14	2021-06-15 23:43:14	6
318760	ATOM	2021-06-25	9.084	10.37	10.7	8.865	1445169.27	13906155.49	2021-06-26 23:45:46	2021-06-26 23:45:46	3
338690	ETH	2021-08-07	3162.43	2892.36	3172.52	2866.96	583050.09	1777496501.94	2021-08-08 21:55:34	2021-08-08 21:55:34	10
333172	OCN	2021-07-26	0.0008692	0.0009655	0.001003	0.0008246	28847316.83	25073.55	2021-07-27 23:52:50	2021-07-27 23:52:50	2
10951	ATOM	2020-11-17	5.295	5.089	5.431	5.077	714522.52	3749933.85	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10952	ATOM	2020-11-18	5.118	5.295	5.334	4.944	791924.6	4065250.5	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10953	ATOM	2020-11-19	5.101	5.118	5.215	4.996	452471.42	2311545.17	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10954	ATOM	2020-11-20	5.28	5.101	5.457	5.083	785630.38	4171427.83	2021-05-09 17:34:36	2021-05-09 17:34:36	3
343828	EOS	2021-08-18	4.982	5.06	5.173	4.736	7478033.19	37227117.53	2021-08-19 21:58:07	2021-08-19 21:58:07	9
330422	ETH	2021-07-20	1786.52	1818.6	1840.59	1720.11	640378.57	1129313606.55	2021-07-21 23:51:27	2021-07-21 23:51:27	10
349464	XTZ	2021-08-30	5.391	5.881	6.007	5.288	20287388.92	113444104.31	2021-08-31 23:00:53	2021-08-31 23:00:53	5
360160	ATOM	2021-09-21	30.38	33.71	37.15	28.86	9589905.96	322910152.54	2021-09-22 23:05:56	2021-09-22 23:05:56	3
354922	DOT	2021-09-10	29.19	29.83	32.65	28.02	6637958.21	201729129.97	2021-09-11 23:03:23	2021-09-11 23:03:23	4
365370	ZRX	2021-10-02	0.9744	0.9806	1.014	0.9639	5946839.26	5895172.64	2021-10-03 21:08:29	2021-10-03 21:08:29	6
370678	FIL	2021-10-13	68.26	69.72	70.71	60.83	881367.09	58355124.96	2021-10-14 23:11:02	2021-10-14 23:11:02	13
375722	DOT	2021-10-23	43.95	43.48	44.76	43.08	2359606.4	103514212.39	2021-10-24 23:13:20	2021-10-24 23:13:20	4
382464	FIL	2021-11-05	63.56	62.49	64.5	61.54	391577.38	24673462.46	2021-11-06 23:16:17	2021-11-06 23:16:17	13
388174	EOS	2021-11-16	4.491	4.809	4.809	4.456	4033564.42	18587399.53	2021-11-16 04:18:24	2021-11-16 04:18:24	9
387664	BTC	2021-11-15	63614.06	65509.06	66335.42	63442.58	25263.23	1639253320.63	2021-11-16 04:18:24	2021-11-16 04:18:24	7
9260	ANT	2021-04-05	13.08	11.38	13.53	11.46	1536242.84	20098908.77	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9262	ANT	2021-04-07	11.1	12.54	12.41	10.57	1130480.94	12542999.89	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9263	ANT	2021-04-08	12.13	11.1	12.39	11.43	778109.2	9436935.8	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9264	ANT	2021-04-09	12.23	12.13	12.97	11.63	886064.64	10832743.85	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9265	ANT	2021-04-10	11.65	12.23	12.65	11.35	697128.19	8118810	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9266	ANT	2021-04-11	11.22	11.65	11.69	10.89	496246.42	5566070.63	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9267	ANT	2021-04-12	10.54	11.22	11.71	10.25	681464.37	7181842.83	2021-05-09 17:34:37	2021-05-09 17:34:37	14
2991	BCH	2020-06-23	240.61	241.22	242.92	239.07	128148.51	30833492.62	2021-05-09 17:34:36	2021-05-09 17:34:36	8
9268	ANT	2021-04-13	11.01	10.54	11.5	10.35	603667.35	6645368.64	2021-05-09 17:34:37	2021-05-09 17:34:37	14
84435	ANT	2021-04-25	7.85	7.502	8.085	7.304	554704.83	4354172.76	2021-05-09 17:34:37	2021-05-09 17:34:37	14
84436	ANT	2021-04-26	8.607	7.85	8.85	8.277	612844.82	5274581.67	2021-05-09 17:34:37	2021-05-09 17:34:37	14
2992	BCH	2020-06-24	232.7	240.61	235.95	231.49	136851.86	31844773.34	2021-05-09 17:34:36	2021-05-09 17:34:36	8
2993	BCH	2020-06-25	232.33	232.7	234.18	230.94	101170.8	23504686.68	2021-05-09 17:34:36	2021-05-09 17:34:36	8
2994	BCH	2020-06-26	230.6	232.33	231.79	229.04	124540.09	28718969.99	2021-05-09 17:34:36	2021-05-09 17:34:36	8
2995	BCH	2020-06-27	216.26	230.6	227.34	210.41	196122.42	42413715.28	2021-05-09 17:34:36	2021-05-09 17:34:36	8
2996	BCH	2020-06-28	222.54	216.26	224.27	217.43	155214.88	34541133.84	2021-05-09 17:34:36	2021-05-09 17:34:36	8
2997	BCH	2020-06-29	225.18	222.54	226.28	221.5	154784.83	34853687.36	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3026	BCH	2020-07-28	289.62	268.9	294	263.93	525190.47	152106744.45	2021-05-09 17:34:36	2021-05-09 17:34:36	8
313592	SJCX	2021-06-14	0.001621	0.001561	0.001621	0.001621	0	0	2021-06-15 20:43:13	2021-06-15 20:43:13	11
303528	XTZ	2021-05-24	3.535	2.92	3.608	2.84	13734593.42	45156470.01	2021-05-25 23:38:20	2021-05-25 23:38:20	5
324894	DOT	2021-07-08	15.32	16.86	16.88	15.01	1107306.51	17418662.42	2021-07-09 23:48:44	2021-07-09 23:48:44	4
3027	BCH	2020-07-29	288.14	289.62	295.8	284.25	313291.6	90270336.95	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3028	BCH	2020-07-30	291.96	288.14	298.85	284.51	288095.94	84111294.53	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3029	BCH	2020-07-31	301.19	291.96	304.48	295.85	291316.62	87740971.56	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3033	BCH	2020-08-04	288.25	297.05	298.21	285	259150.66	74700212.73	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3034	BCH	2020-08-05	293.8	288.25	305.55	291.8	314449.03	92385518.08	2021-05-09 17:34:36	2021-05-09 17:34:36	8
330424	ZRX	2021-07-20	0.5473	0.5843	0.5955	0.5244	7643826.6	4176919.38	2021-07-21 23:51:27	2021-07-21 23:51:27	6
330490	XTZ	2021-07-20	2.154	2.286	2.333	2.105	3623299.8	7892063.71	2021-07-21 23:51:27	2021-07-21 23:51:27	5
370680	XTZ	2021-10-13	7.3	7.103	7.32	6.852	7335914.49	52147708.04	2021-10-14 23:11:04	2021-10-14 23:11:04	5
308380	OCN	2021-06-03	0.0008568	0.000839	0.0009425	0.0008282	45451440.61	38942.93	2021-06-04 22:40:37	2021-06-04 22:40:37	2
365836	ATOM	2021-10-03	38.77	38.62	40.76	37.85	2209325.77	86648689.19	2021-10-04 23:08:43	2021-10-04 23:08:43	3
3035	BCH	2020-08-06	309.11	293.8	316.41	291.1	402373.95	124379240.19	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3036	BCH	2020-08-07	302.51	309.11	319.57	287.89	474925.19	143670373.12	2021-05-09 17:34:36	2021-05-09 17:34:36	8
318766	DOT	2021-06-25	14.44	16.22	16.71	14.42	1192119.42	18166802.14	2021-06-26 23:45:46	2021-06-26 23:45:46	4
298134	EOS	2021-05-14	11.17	10.62	11.67	10.53	12589424.52	139981920.77	2021-05-15 23:36:03	2021-05-15 23:36:03	9
333174	ANT	2021-07-26	3.626	3.678	3.887	3.511	383219.55	1389535.54	2021-07-27 21:52:49	2021-07-27 21:52:49	14
10956	ATOM	2020-11-22	5.489	5.936	5.978	5.26	900589.98	5011621.37	2021-05-09 17:34:36	2021-05-09 17:34:36	3
2438	OCN	2020-12-19	0.0002964	0.0003011	0.0003294	0.0002964	234224396.08	69427.62	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2439	OCN	2020-12-20	0.0002808	0.0002964	0.0002936	0.0002744	162932722.96	45750.66	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2440	OCN	2020-12-21	0.0002736	0.0002808	0.0002857	0.0002614	213944802.64	58525.67	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2441	OCN	2020-12-22	0.0002868	0.0002736	0.0002931	0.0002804	213185581.51	61131.71	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2457	OCN	2021-01-07	0.0002696	0.0002784	0.0002941	0.0002574	227909303.78	61446.63	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2458	OCN	2021-01-08	0.0002677	0.0002696	0.0002921	0.0002556	386780077.26	103554.8	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2459	OCN	2021-01-09	0.0002816	0.0002677	0.0003584	0.0002816	409733424.7	115377.33	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2460	OCN	2021-01-10	0.0002763	0.0002816	0.0002888	0.0002511	352903563.23	97492.57	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2473	OCN	2021-01-23	0.0002592	0.0002469	0.0002838	0.0002468	407543507.12	105619.38	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2486	OCN	2021-02-05	0.0003443	0.0003035	0.0003615	0.0003099	287998005.96	99156.56	2021-05-09 17:34:37	2021-05-09 17:34:37	2
383578	OCN	2021-11-07	0.000633	0.0006153	0.000633	0.000633	61386553.95	38859.4	2021-11-08 23:21:09	2021-11-08 23:21:09	2
349466	BTC	2021-08-30	46993.31	48794.26	48878.11	46872.47	29046.26	1392617744.31	2021-08-31 23:00:52	2021-08-31 23:00:52	7
365408	ANT	2021-10-02	4.987	4.697	5.077	4.653	51106.63	249393.8	2021-10-03 23:08:30	2021-10-03 23:08:30	14
338692	BCH	2021-08-07	584.12	557.11	590.47	554.26	73997.82	42543712.42	2021-08-08 22:55:34	2021-08-08 22:55:34	8
338716	ATOM	2021-08-07	14.02	13.59	14.36	13.48	1221367.06	16988184.24	2021-08-08 23:55:35	2021-08-08 23:55:35	3
355420	BTC	2021-09-11	45166.12	44853.1	45987.63	44741.98	14599.26	662298068.85	2021-09-12 23:03:37	2021-09-12 23:03:37	7
343830	FIL	2021-08-18	67.47	69.41	70.01	66.07	590984.31	40249310.53	2021-08-19 23:58:08	2021-08-19 23:58:08	13
360144	DOT	2021-09-21	26.38	28.15	30.35	25.52	8689727.13	244807883.06	2021-09-22 23:05:56	2021-09-22 23:05:56	4
375724	SJCX	2021-10-23	0.002453	0.002428	0.002453	0.002453	0	0	2021-10-24 22:13:20	2021-10-24 22:13:20	11
383032	EOS	2021-11-06	4.448	4.507	4.549	4.239	4127920.71	18225293.59	2021-11-07 23:16:31	2021-11-07 23:16:31	9
383018	ETH	2021-11-06	4521.41	4480.09	4532.21	4330.7	200179.03	889268557.48	2021-11-07 23:16:31	2021-11-07 23:16:31	10
383560	ETH	2021-11-07	4617.13	4521.41	4638.45	4507.27	162615.74	745891590.35	2021-11-08 23:16:44	2021-11-08 23:16:44	10
387666	ETH	2021-11-15	4561.38	4627.5	4769.78	4542.39	249920.05	1163390034.39	2021-11-16 02:18:23	2021-11-16 02:18:23	10
388172	ETH	2021-11-16	4396.52	4561.38	4564.74	4313.54	137162.29	605100436.11	2021-11-16 02:18:23	2021-11-16 02:18:23	10
371	DOT	2020-04-26	0	0	0	0	0	0	2021-04-26 23:28:51	2021-04-26 23:28:51	4
4591	EOS	2020-11-06	2.534	2.442	2.544	2.439	908412.59	2265449.41	2021-05-09 17:34:36	2021-05-09 17:34:36	9
9206	ANT	2021-02-10	5.49	5.842	5.791	5.158	679140.81	3728650.03	2021-05-09 17:34:37	2021-05-09 17:34:37	14
4592	EOS	2020-11-07	2.501	2.534	2.625	2.459	981362.28	2513841.58	2021-05-09 17:34:36	2021-05-09 17:34:36	9
370	DOT	2020-04-25	0	0	0	0	0	0	2021-04-24 20:28:41	2021-04-24 20:28:41	4
9207	ANT	2021-02-11	6.246	5.49	6.61	5.866	937795.66	5857100.34	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9208	ANT	2021-02-12	6.926	6.246	7.03	6.058	890466.26	6167003.19	2021-05-09 17:34:37	2021-05-09 17:34:37	14
3075	BCH	2020-09-15	235.26	225.95	241.41	227.71	402408.01	94669674.24	2021-05-09 17:34:36	2021-05-09 17:34:36	8
9209	ANT	2021-02-13	7.131	6.926	7.423	6.328	1172407.78	8359936.12	2021-05-09 17:34:37	2021-05-09 17:34:37	14
2046	ZRX	2020-11-23	0.4392	0.3977	0.4403	0.3909	9311115.44	3901392.02	2021-05-09 17:34:36	2021-05-09 17:34:36	6
3076	BCH	2020-09-16	230.87	235.26	239.19	229	228765.61	52814223.51	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3077	BCH	2020-09-17	233.02	230.87	237.4	229.96	197970.05	46131383.05	2021-05-09 17:34:36	2021-05-09 17:34:36	8
9210	ANT	2021-02-14	6.539	7.131	7.458	6.296	948763.21	6203911.14	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9211	ANT	2021-02-15	5.954	6.539	6.462	5.316	1135766.39	6762028.87	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9212	ANT	2021-02-16	5.73	5.954	6.197	5.494	860624.69	4931387.56	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9261	ANT	2021-04-06	12.54	13.08	14.6	12.1	1793124.43	22478673.55	2021-05-09 17:34:37	2021-05-09 17:34:37	14
3078	BCH	2020-09-18	234.18	233.02	238.01	232.54	180713.63	42319558.52	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3079	BCH	2020-09-19	233.31	234.18	239.96	232.76	208673.25	48685553.98	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3080	BCH	2020-09-20	226.19	233.31	231.87	224.55	170947.63	38666903.16	2021-05-09 17:34:36	2021-05-09 17:34:36	8
2047	ZRX	2020-11-24	0.464	0.4392	0.4779	0.4155	21998823.2	9945576.15	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2048	ZRX	2020-11-25	0.4436	0.464	0.5287	0.425	27608144.05	13433615.53	2021-05-09 17:34:36	2021-05-09 17:34:36	6
298136	ATOM	2021-05-14	25.88	23.52	25.88	23.41	1488312.59	36595052.49	2021-05-15 23:36:03	2021-05-15 23:36:03	3
2049	ZRX	2020-11-26	0.4084	0.4436	0.4578	0.3681	17860911.64	7130601.74	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2050	ZRX	2020-11-27	0.4033	0.4084	0.4247	0.3842	7110827.29	2860265.79	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2051	ZRX	2020-11-28	0.4153	0.4033	0.4296	0.3928	6346105.46	2630921.89	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1523	ETH	2020-06-19	228.83	231.14	229.94	227.06	554941.24	126984439.23	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1524	ETH	2020-06-20	228.93	228.83	231.36	228.36	444965.44	101863954.88	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1525	ETH	2020-06-21	227.95	228.93	229.07	227.02	398016.61	90728932.75	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1526	ETH	2020-06-22	243.3	227.83	246.8	227.39	541373.26	129354691.96	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1527	ETH	2020-06-23	243.11	243.26	243.78	240.9	633854.34	154096213.24	2021-05-07 19:24:30	2021-05-07 19:24:30	10
314012	ETH	2021-06-15	2543.6	2582.12	2639.89	2507.88	343235.2	884043051.65	2021-06-16 23:43:28	2021-06-16 23:43:28	10
1252	SJCX	2020-09-22	0.0004214	0.0004167	0.0004214	0.0004214	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
3081	BCH	2020-09-21	212.53	226.19	217.32	209.3	153489.65	32621163.91	2021-05-09 17:34:36	2021-05-09 17:34:36	8
275	XTZ	2021-01-21	2.458	2.912	2.932	2.425	8208324.09	21448237.24	2021-05-07 19:24:31	2021-05-07 19:24:31	5
1528	ETH	2020-06-24	234.56	243.16	249.14	230.99	530864.61	126699284.93	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1529	ETH	2020-06-25	232.35	234.56	235.12	227.36	363467.6	84427974.15	2021-05-07 19:24:30	2021-05-07 19:24:30	10
319228	ETH	2021-06-26	1830.94	1810.27	1851.36	1717.91	575329.88	1021387751.81	2021-06-27 23:46:00	2021-06-27 23:46:00	10
276	XTZ	2021-01-22	2.919	2.458	3.113	2.304	16402287.57	46032478.85	2021-05-07 19:24:31	2021-05-07 19:24:31	5
303530	EOS	2021-05-24	5.651	4.311	5.651	4.184	17452506.35	84523412.56	2021-05-25 23:38:19	2021-05-25 23:38:19	9
277	XTZ	2021-01-23	3.167	2.919	3.398	2.831	19523844.34	62982682.43	2021-05-07 19:24:31	2021-05-07 19:24:31	5
278	XTZ	2021-01-24	3.046	3.167	3.295	2.912	7820553.66	24362608.91	2021-05-07 19:24:31	2021-05-07 19:24:31	5
3082	BCH	2020-09-22	220.18	212.53	220.18	213.96	167404.85	36858506.31	2021-05-09 17:34:36	2021-05-09 17:34:36	8
279	XTZ	2021-01-25	2.921	3.046	3.181	2.907	6501656.82	19900585.03	2021-05-07 19:24:31	2021-05-07 19:24:31	5
303538	OCN	2021-05-24	0.00098	0.0008184	0.001351	0.0009536	105225524.35	103125.74	2021-05-25 23:38:20	2021-05-25 23:38:20	2
1253	SJCX	2020-09-23	0.0004095	0.0004214	0.0004095	0.0004095	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
10957	ATOM	2020-11-23	5.814	5.489	5.921	5.44	1148239.82	6564184.31	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10958	ATOM	2020-11-24	5.963	5.814	6.416	5.667	2018954.52	12208824.73	2021-05-09 17:34:36	2021-05-09 17:34:36	3
1254	SJCX	2020-09-24	0.0004297	0.0004095	0.0004297	0.0004297	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1255	SJCX	2020-09-25	0.0004278	0.0004297	0.0004278	0.0004278	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
307	XTZ	2021-02-22	4.276	4.678	4.686	3.603	15811819.07	65668421.04	2021-05-07 19:24:31	2021-05-07 19:24:31	5
1256	SJCX	2020-09-26	0.0004294	0.0004278	0.0004294	0.0004294	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
10959	ATOM	2020-11-25	5.911	5.963	6.482	5.722	1609546.56	9989865.45	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10975	ATOM	2020-12-11	4.71	4.663	4.864	4.487	850174.95	3988211.04	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10976	ATOM	2020-12-12	5.07	4.71	5.109	4.703	694681.93	3425412.99	2021-05-09 17:34:36	2021-05-09 17:34:36	3
1257	SJCX	2020-09-27	0.0004313	0.0004294	0.0004313	0.0004313	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
308382	SJCX	2021-06-03	0.001569	0.001503	0.001569	0.001569	0	0	2021-06-04 23:40:37	2021-06-04 23:40:37	11
314048	OCN	2021-06-15	0.000814	0.0008263	0.0008394	0.0007885	41541458.71	33812.75	2021-06-16 22:43:28	2021-06-16 22:43:28	2
325788	ZRX	2021-07-10	0.7907	0.838	0.8559	0.7747	10637899.81	8655305.07	2021-07-11 23:49:11	2021-07-11 23:49:11	6
330426	FIL	2021-07-20	41.22	44.66	45.08	40.97	236611.59	10046015.57	2021-07-21 22:51:27	2021-07-21 22:51:27	13
325322	ANT	2021-07-09	3.695	3.629	3.816	3.681	346850.72	1281543.71	2021-07-10 22:48:57	2021-07-10 22:48:57	14
333176	ATOM	2021-07-26	11.38	11.46	12.43	11.32	2098106.52	25076372.72	2021-07-27 23:52:50	2021-07-27 23:52:50	3
338694	EOS	2021-08-07	4.596	4.317	4.65	4.285	4442767.96	20022355.38	2021-08-08 23:55:35	2021-08-08 23:55:35	9
343832	ETH	2021-08-18	3013.52	3011.96	3125.9	2952.86	382354.88	1162842776.74	2021-08-19 23:58:08	2021-08-19 23:58:08	10
349468	FIL	2021-08-30	71.16	73.68	74.26	70.99	182442.92	13280218.02	2021-08-31 23:00:53	2021-08-31 23:00:53	13
355422	DOT	2021-09-11	31.57	29.19	32.08	28.29	4591750.59	139229633.18	2021-09-12 23:03:37	2021-09-12 23:03:37	4
360146	FIL	2021-09-21	69.43	74.07	76.59	68.25	443623.68	32482053.1	2021-09-22 23:05:56	2021-09-22 23:05:56	13
365824	BTC	2021-10-03	48234.05	47669.02	49185.34	47137.07	18588.83	895606844.23	2021-10-04 23:08:44	2021-10-04 23:08:44	7
1691	ETH	2020-12-04	567.67	616.55	620.5	566.14	622236.62	369234314.74	2021-05-07 19:24:30	2021-05-07 19:24:30	10
383	DOT	2020-05-08	0	0	0	0	0	0	2021-05-07 19:24:30	2021-05-07 19:24:30	4
3083	BCH	2020-09-23	207.73	220.18	213.98	205.58	123127.5	25577379.75	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3084	BCH	2020-09-24	216.36	207.73	221.63	216.15	103861.64	22471880.12	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3085	BCH	2020-09-25	216.66	216.36	217.73	212.6	144484.48	31304422.28	2021-05-09 17:34:36	2021-05-09 17:34:36	8
10960	ATOM	2020-11-26	5.34	5.911	6.317	5.003	1733526.29	9579259.02	2021-05-09 17:34:36	2021-05-09 17:34:36	3
1285	SJCX	2020-10-25	0.0005216	0.000525	0.0005216	0.0005216	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
355424	ATOM	2021-09-11	27.28	29.37	30.85	26.74	1297897.52	37447713.76	2021-09-12 23:03:37	2021-09-12 23:03:37	3
360172	XTZ	2021-09-21	4.678	5.272	5.528	4.488	21413489.58	107937781.65	2021-09-22 23:05:56	2021-09-22 23:05:56	5
370684	ATOM	2021-10-13	34.61	33.45	34.95	31.67	2868150.93	95486319.8	2021-10-14 22:11:02	2021-10-14 22:11:02	3
370670	BCH	2021-10-13	593.42	587.52	594.37	571.8	58335.77	34085304.89	2021-10-14 23:11:02	2021-10-14 23:11:02	8
330428	SJCX	2021-07-20	0.001192	0.001234	0.001192	0.001192	0	0	2021-07-21 22:51:27	2021-07-21 22:51:27	11
349470	ATOM	2021-08-30	22.18	21.22	23.88	19.52	1024991.61	22239486.73	2021-08-31 23:00:53	2021-08-31 23:00:53	3
343860	SJCX	2021-08-18	0.001789	0.001787	0.001789	0.001789	0	0	2021-08-19 22:58:08	2021-08-19 22:58:08	11
343834	OCN	2021-08-18	0.001055	0.001024	0.001055	0.001025	1201354.19	1267.11	2021-08-19 23:58:08	2021-08-19 23:58:08	2
325324	ZRX	2021-07-09	0.838	0.841	0.9044	0.7669	30890474.91	25892556.09	2021-07-10 23:48:58	2021-07-10 23:48:58	6
375714	ZRX	2021-10-23	1.014	1.003	1.023	0.9861	3223511.01	3245334.37	2021-10-24 23:13:20	2021-10-24 23:13:20	6
303532	ATOM	2021-05-24	14.51	11.68	14.51	11.15	1082855.23	13585527.75	2021-05-25 23:38:20	2021-05-25 23:38:20	3
308384	ATOM	2021-06-03	16.67	14.86	17.21	14.67	2166958.38	35340577.48	2021-06-04 23:40:37	2021-06-04 23:40:37	3
298138	BCH	2021-05-14	1297.72	1255.97	1362.94	1226.06	132639.48	171124024.47	2021-05-15 23:36:03	2021-05-15 23:36:03	8
388166	DOT	2021-11-16	41.3	44.75	44.76	41.08	1653079.54	70497414.61	2021-11-16 04:18:24	2021-11-16 04:18:24	4
338696	FIL	2021-08-07	69.33	64.17	70.84	63.78	862767.38	58690597.09	2021-08-08 23:55:35	2021-08-08 23:55:35	13
338720	SJCX	2021-08-07	0.001785	0.001714	0.001785	0.001785	0	0	2021-08-08 23:55:35	2021-08-08 23:55:35	11
314014	ZRX	2021-06-15	0.8947	0.91	0.9583	0.8874	5542671.89	5110911.66	2021-06-16 22:43:28	2021-06-16 22:43:28	6
333178	XTZ	2021-07-26	2.84	2.89	3.116	2.826	7284070.68	21655882.46	2021-07-27 23:52:50	2021-07-27 23:52:50	5
333230	EOS	2021-07-26	3.684	3.66	3.998	3.634	5627728.59	21613609.9	2021-07-27 23:52:50	2021-07-27 23:52:50	9
387668	BCH	2021-11-15	666.09	679.36	686.15	665.45	43045.67	29012023.84	2021-11-16 04:18:24	2021-11-16 04:18:24	8
319230	XTZ	2021-06-26	2.543	2.524	2.619	2.392	3058251.75	7631171.18	2021-06-27 23:45:59	2021-06-27 23:45:59	5
383022	ATOM	2021-11-06	36.24	36.79	37.06	34.3	1650196.92	59072960.32	2021-11-07 23:16:31	2021-11-07 23:16:31	3
365826	FIL	2021-10-03	69.1	69.72	70.86	67.67	458507.74	31841277.3	2021-10-04 23:08:43	2021-10-04 23:08:43	13
1534	ETH	2020-06-30	225.49	227.84	227.32	224.21	760908.56	171575809.95	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1535	ETH	2020-07-01	231.06	225.49	231.62	227.28	822437.95	190036327.93	2021-05-07 19:24:30	2021-05-07 19:24:30	10
3174	BCH	2020-12-23	275.16	323.52	315.82	270.74	556881.19	153229022.51	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3175	BCH	2020-12-24	296.79	275.16	298.69	278.28	439060.93	130308780.14	2021-05-09 17:34:36	2021-05-09 17:34:36	8
1536	ETH	2020-07-02	226.59	231.06	227.96	224.96	1457284.01	330209737.79	2021-05-07 19:24:30	2021-05-07 19:24:30	10
4458	EOS	2020-06-26	2.481	2.479	2.512	2.387	775401.82	1908883.73	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4459	EOS	2020-06-27	2.332	2.481	2.483	2.22	1431241.04	3357592.44	2021-05-09 17:34:36	2021-05-09 17:34:36	9
1537	ETH	2020-07-03	225.12	226.59	226.66	224.76	1163308.98	261884352.33	2021-05-07 19:24:30	2021-05-07 19:24:30	10
4460	EOS	2020-06-28	2.369	2.332	2.425	2.307	642024.47	1517197.28	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4461	EOS	2020-06-29	2.38	2.369	2.415	2.325	744501.59	1763740.2	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4462	EOS	2020-06-30	2.369	2.38	2.388	2.346	414713.11	981117.02	2021-05-09 17:34:36	2021-05-09 17:34:36	9
3176	BCH	2020-12-25	318.98	296.79	327.63	307.61	447379.86	142705237.5	2021-05-09 17:34:36	2021-05-09 17:34:36	8
303550	BTC	2021-05-24	38837.76	34716.84	39945.35	34467.32	106765.14	3981461441.04	2021-05-25 23:38:19	2021-05-25 23:38:19	7
3177	BCH	2020-12-26	323.17	318.98	347.76	321.05	529947.79	171261348.1	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3178	BCH	2020-12-27	337.57	323.17	350.95	304.23	764269.5	257991101.65	2021-05-09 17:34:36	2021-05-09 17:34:36	8
325776	BTC	2021-07-10	33515.13	33804.2	34253.5	33030.16	19345.51	651899496.99	2021-07-11 23:49:11	2021-07-11 23:49:11	7
314016	XTZ	2021-06-15	3.273	3.35	3.392	3.212	2478555.49	8196454.91	2021-06-16 23:43:28	2021-06-16 23:43:28	5
319232	ANT	2021-06-26	4.122	4.802	4.975	3.447	962830.83	3969191.01	2021-06-27 22:45:59	2021-06-27 22:45:59	14
319258	OCN	2021-06-26	0.000476	0.0004707	0.0005127	0.0004577	35297815.17	16803.33	2021-06-27 22:45:59	2021-06-27 22:45:59	2
298140	ANT	2021-05-14	8.476	8.151	8.546	8.162	329602.01	2793694.9	2021-05-15 23:36:03	2021-05-15 23:36:03	14
2150	ZRX	2021-03-07	1.417	1.373	1.424	1.355	985900.33	1370123.37	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2151	ZRX	2021-03-08	1.421	1.417	1.472	1.368	1206115.12	1711710.4	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2152	ZRX	2021-03-09	1.472	1.421	1.474	1.392	1134118.84	1622078.5	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1538	ETH	2020-07-04	229.19	225.12	229.56	226.73	1114755.74	255496390.55	2021-05-07 19:24:30	2021-05-07 19:24:30	10
10962	ATOM	2020-11-28	5.447	5.366	5.541	5.231	409619.05	2225096.66	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10963	ATOM	2020-11-29	5.434	5.447	5.545	5.318	378083.71	2045421.76	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10969	ATOM	2020-12-05	5.264	5.061	5.303	4.978	385700.34	1992943.43	2021-05-09 17:34:36	2021-05-09 17:34:36	3
1539	ETH	2020-07-05	228.03	229.19	228.4	225.58	1020069.83	232611581.25	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1540	ETH	2020-07-06	241.81	228.03	241.9	233.86	2113903.04	511159054.2	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1541	ETH	2020-07-07	239.39	241.81	240.69	233.56	1358166.45	325137300.06	2021-05-07 19:24:30	2021-05-07 19:24:30	10
10970	ATOM	2020-12-06	5.216	5.264	5.289	5.09	256307.71	1330197.17	2021-05-09 17:34:36	2021-05-09 17:34:36	3
1542	ETH	2020-07-08	247.02	239.39	248.82	241.45	1807293.64	446444658.34	2021-05-07 19:24:30	2021-05-07 19:24:30	10
10990	ATOM	2020-12-26	4.807	4.906	4.963	4.729	370769.36	1800985.82	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10991	ATOM	2020-12-27	4.834	4.807	5.021	4.554	676798.04	3275860.44	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10997	ATOM	2021-01-02	5.412	5.88	5.895	5.249	2165216.94	12002274.93	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10998	ATOM	2021-01-03	5.83	5.412	5.911	5.284	1739693.4	9761201.01	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10999	ATOM	2021-01-04	6.049	5.83	6.285	5.273	3290834.23	19216052.45	2021-05-09 17:34:36	2021-05-09 17:34:36	3
11011	ATOM	2021-01-16	9.029	7.913	9.597	7.555	4581577.49	39619473.02	2021-05-09 17:34:36	2021-05-09 17:34:36	3
1543	ETH	2020-07-09	242.15	247.02	242.98	238.64	838047.44	202935600.75	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1552	ETH	2020-07-18	235.85	232.77	237.87	233.1	449014.83	105902192.47	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1553	ETH	2020-07-19	239.16	235.85	239.52	235.28	493756.5	118084690.77	2021-05-07 19:24:30	2021-05-07 19:24:30	10
11012	ATOM	2021-01-17	8.543	9.029	9.202	8.016	2584956.58	22096768.11	2021-05-09 17:34:36	2021-05-09 17:34:36	3
2153	ZRX	2021-03-10	1.395	1.472	1.486	1.359	1097010.38	1549605.36	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2154	ZRX	2021-03-11	1.376	1.395	1.405	1.334	748236.49	1027239.24	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2155	ZRX	2021-03-12	1.336	1.376	1.387	1.298	6212719.93	8350281.96	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2156	ZRX	2021-03-13	1.393	1.336	1.419	1.29	6438754.38	8869603.25	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2157	ZRX	2021-03-14	1.33	1.393	1.399	1.309	4804843.62	6476142.36	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2177	ZRX	2021-04-03	1.727	1.963	1.964	1.713	10288253.49	18999053.88	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2178	ZRX	2021-04-04	1.835	1.727	1.86	1.692	6703286.07	11965934.46	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2179	ZRX	2021-04-05	1.805	1.835	1.864	1.732	8404044.17	15135955.11	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2180	ZRX	2021-04-06	1.923	1.805	1.939	1.746	12335888.74	22622866.15	2021-05-09 17:34:36	2021-05-09 17:34:36	6
308386	ANT	2021-06-03	5.057	4.84	5.151	4.947	412300.7	2084882.26	2021-06-04 23:40:37	2021-06-04 23:40:37	14
325326	XTZ	2021-07-09	2.752	2.695	2.797	2.581	2139408.5	5743707.45	2021-07-10 23:48:57	2021-07-10 23:48:57	5
330430	BCH	2021-07-20	398.79	414.97	422.07	384.85	67912.06	26979677.37	2021-07-21 23:51:27	2021-07-21 23:51:27	8
333180	BCH	2021-07-26	481.98	455.23	517.81	453.66	129085.1	64207279.04	2021-07-27 23:52:50	2021-07-27 23:52:50	8
343836	ANT	2021-08-18	4.688	4.734	4.897	4.567	111123.99	522718.79	2021-08-19 22:58:07	2021-08-19 22:58:07	14
338698	ANT	2021-08-07	4.424	4.145	4.734	4.249	614589.25	2718863.4	2021-08-08 23:55:35	2021-08-08 23:55:35	14
343846	XTZ	2021-08-18	3.347	3.404	3.468	3.239	3949353.63	13289318.89	2021-08-19 21:58:07	2021-08-19 21:58:07	5
349472	EOS	2021-08-30	4.82	5.06	5.077	4.802	5225350.44	25810445.9	2021-08-31 23:00:53	2021-08-31 23:00:53	9
355426	FIL	2021-09-11	81.67	82.46	84.97	80.19	370188.96	30614614.39	2021-09-12 23:03:37	2021-09-12 23:03:37	13
360604	BTC	2021-09-22	43576.15	40709.59	44012.22	40589.07	42391.1	1807576533.35	2021-09-23 23:06:10	2021-09-23 23:06:10	7
361100	ATOM	2021-09-23	41.5	39.81	43.41	38.84	6896219.96	282265247.07	2021-09-24 22:06:23	2021-09-24 22:06:23	3
365828	OCN	2021-10-03	0.0004823	0.0004767	0.0009647	0.0004823	133913523.21	64591.92	2021-10-04 23:08:44	2021-10-04 23:08:44	2
365874	BCH	2021-10-03	571.57	552.01	577.36	553.24	131743.45	75301063.83	2021-10-04 23:08:44	2021-10-04 23:08:44	8
370686	EOS	2021-10-13	4.597	4.491	4.612	4.376	4844396.11	21789008.58	2021-10-14 23:11:02	2021-10-14 23:11:02	9
375726	ANT	2021-10-23	4.731	4.649	4.763	4.651	121503.35	574822.39	2021-10-24 23:13:20	2021-10-24 23:13:20	14
1566	ETH	2020-08-01	387.45	346.94	391.23	358.51	1864945.57	722568267.48	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1567	ETH	2020-08-02	371.93	387.41	414.95	344.45	1275109.75	483607413.35	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1568	ETH	2020-08-03	386.25	371.95	394.79	376.48	1562985.54	603703192.02	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1569	ETH	2020-08-04	389.79	386.1	402.84	381.18	672905.11	263396168.06	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1570	ETH	2020-08-05	400.98	389.67	410.38	397.57	1158334.39	464468861.15	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1571	ETH	2020-08-06	395.04	400.98	403.28	392.92	924612.7	365262534.14	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1572	ETH	2020-08-07	379.57	395.07	398.38	365.09	621342.96	238575183.71	2021-05-07 19:24:30	2021-05-07 19:24:30	10
333182	SJCX	2021-07-26	0.001491	0.001415	0.001491	0.001491	0	0	2021-07-27 22:52:49	2021-07-27 22:52:49	11
3041	BCH	2020-08-12	284.86	281.54	290.64	280.81	260626.61	74241595.15	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3042	BCH	2020-08-13	296.06	284.86	298.19	285.45	259992.81	76974504.75	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3043	BCH	2020-08-14	293.66	296.06	297.31	290.83	258288.93	75848230.61	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3044	BCH	2020-08-15	302.33	293.66	307.32	292.37	304957.83	92199302.3	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3045	BCH	2020-08-16	308.44	302.33	314.16	300.93	301958.59	93135220.83	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3046	BCH	2020-08-17	318.6	308.44	328.93	314.54	377818.72	120373354.38	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3047	BCH	2020-08-18	303.46	318.6	313.86	300.23	273550.52	83011857.51	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3050	BCH	2020-08-21	282.72	294.67	305.35	281.6	194328.61	56921852.38	2021-05-09 17:34:36	2021-05-09 17:34:36	8
325794	SJCX	2021-07-10	0.001341	0.001352	0.001341	0.001341	0	0	2021-07-11 21:49:10	2021-07-11 21:49:10	11
308388	BCH	2021-06-03	718.51	698.07	735.3	688.38	72203.59	51583072.81	2021-06-04 23:40:37	2021-06-04 23:40:37	8
3051	BCH	2020-08-22	286.66	282.72	287.49	276.34	217797.58	61698073.61	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3052	BCH	2020-08-23	284.62	286.66	288.18	279.18	114535.47	32542865.14	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3053	BCH	2020-08-24	290.89	284.62	294.78	282.2	127161.46	36850607.56	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3179	BCH	2020-12-28	360.71	337.57	377.74	340.43	557453.1	201076824.5	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3180	BCH	2020-12-29	352.13	360.71	370.74	344.75	421870.2	148554519.79	2021-05-09 17:34:36	2021-05-09 17:34:36	8
10964	ATOM	2020-11-30	5.574	5.434	5.674	5.35	501354.04	2771079.12	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10965	ATOM	2020-12-01	5.267	5.574	5.71	5.13	746396.8	4034859.88	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10966	ATOM	2020-12-02	5.516	5.267	5.549	5.205	518265.21	2783588.73	2021-05-09 17:34:36	2021-05-09 17:34:36	3
4709	EOS	2021-03-04	3.751	3.831	3.925	3.64	5637803.21	21336911.98	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4710	EOS	2021-03-05	3.699	3.751	3.754	3.56	5236417.09	19134762.72	2021-05-09 17:34:36	2021-05-09 17:34:36	9
2232	OCN	2020-05-27	0.0003125	0.0003015	0.0003542	0.0003021	127427730.52	39822.44	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2233	OCN	2020-05-28	0.0003084	0.0003125	0.0003437	0.0002996	97233503.93	29988.76	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2234	OCN	2020-05-29	0.000311	0.0003084	0.0003242	0.0002956	130311962.8	40525.67	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2235	OCN	2020-05-30	0.0003191	0.000311	0.000358	0.0003045	172136263.02	54924.67	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2236	OCN	2020-05-31	0.0003105	0.0003191	0.000343	0.0002897	184951100.56	57430.68	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2237	OCN	2020-06-01	0.0003177	0.0003105	0.0003475	0.0003053	171966488.3	54635.27	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2238	OCN	2020-06-02	0.0003139	0.0003177	0.0003306	0.0002925	335218030.64	105228.02	2021-05-09 17:34:37	2021-05-09 17:34:37	2
319234	DOT	2021-06-26	14.52	14.44	14.96	13.65	1094956.18	15531025.6	2021-06-27 23:45:59	2021-06-27 23:45:59	4
319278	ATOM	2021-06-26	9.584	9.084	9.593	8.667	956145.17	8670975.55	2021-06-27 23:46:00	2021-06-27 23:46:00	3
298142	XTZ	2021-05-14	6.477	6.125	6.516	6.048	4966339.43	31377771.99	2021-05-15 23:36:03	2021-05-15 23:36:03	5
388168	BCH	2021-11-16	619.13	666.09	666.1	617.33	30901.81	19677297.44	2021-11-16 04:18:24	2021-11-16 04:18:24	8
304020	BCH	2021-05-25	719.16	753.88	792.92	671.98	276679.08	198108785.01	2021-05-26 22:38:33	2021-05-26 22:38:33	8
365834	ETH	2021-10-03	3420.14	3389.48	3488.52	3344.87	218924.04	748590158.94	2021-10-04 23:08:44	2021-10-04 23:08:44	10
314018	BTC	2021-06-15	40161.86	40526.63	41307.06	39526.69	48248.1	1943860792.12	2021-06-16 23:43:28	2021-06-16 23:43:28	7
365830	ZRX	2021-10-03	1.004	0.9744	1.051	0.9619	7500142.02	7573934.4	2021-10-04 23:08:47	2021-10-04 23:08:47	6
349474	ANT	2021-08-30	4.679	4.957	4.779	4.593	280517.29	1312575.15	2021-08-31 23:00:53	2021-08-31 23:00:53	14
361086	ETH	2021-09-23	3154.62	3078.88	3177.43	3037.12	336516.23	1048023991.37	2021-09-24 23:06:24	2021-09-24 23:06:24	10
325328	ETH	2021-07-09	2145.67	2114.51	2186.26	2048.12	594562.44	1261710486.51	2021-07-10 22:48:57	2021-07-10 22:48:57	10
355428	ZRX	2021-09-11	1.03	1.007	1.047	0.9889	5714549.63	5819372.78	2021-09-12 22:03:37	2021-09-12 22:03:37	6
330432	EOS	2021-07-20	3.263	3.434	3.542	3.157	3547527.92	11681713.31	2021-07-21 22:51:27	2021-07-21 22:51:27	9
338718	OCN	2021-08-07	0.001297	0.001157	0.001391	0.001138	38166966.83	49487.15	2021-08-08 22:55:35	2021-08-08 22:55:35	2
387690	ANT	2021-11-15	5.816	5.458	6.006	5.237	617108.32	3588853.52	2021-11-16 04:18:24	2021-11-16 04:18:24	14
344302	ETH	2021-08-19	3184.74	3013.52	3187.36	2963.91	348727.03	1067409385.98	2021-08-20 23:58:21	2021-08-20 23:58:21	10
360606	DOT	2021-09-22	31.61	26.38	31.99	25.94	6877684.82	203416087.39	2021-09-23 23:06:10	2021-09-23 23:06:10	4
383026	BCH	2021-11-06	588.21	598.39	602.74	577.72	39760.38	23429449.01	2021-11-07 23:16:31	2021-11-07 23:16:31	8
376248	DOT	2021-10-24	42.3	43.95	44.16	41.33	2630708.22	112046910.88	2021-10-25 22:13:33	2021-10-25 22:13:33	4
383566	XTZ	2021-11-07	6.375	6.443	6.467	6.306	2186148.02	13921740.39	2021-11-08 23:16:45	2021-11-08 23:16:45	5
376236	ETH	2021-10-24	4082.08	4168.96	4185.96	3963.11	222789.38	904114100.2	2021-10-25 23:13:34	2021-10-25 23:13:34	10
370688	OCN	2021-10-13	0.0005737	0.0005601	0.0005737	0.0005737	10219592.45	5862.88	2021-10-14 22:11:02	2021-10-14 22:11:02	2
387672	DOT	2021-11-15	44.75	46.39	47.47	44.61	2261593.12	104220911.66	2021-11-16 04:18:24	2021-11-16 04:18:24	4
3199	BCH	2021-01-17	479.53	489.94	490.64	475.59	264185.08	126685369.86	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3200	BCH	2021-01-18	509.06	479.53	512.72	480.49	288204.24	146713324.19	2021-05-09 17:34:36	2021-05-09 17:34:36	8
304022	OCN	2021-05-25	0.0009205	0.00098	0.001083	0.0009205	90315349.87	83139.49	2021-05-26 23:38:33	2021-05-26 23:38:33	2
298144	DOT	2021-05-14	48.06	40.04	48.08	39.51	2108668.88	91955584.18	2021-05-15 23:36:03	2021-05-15 23:36:03	4
308390	BTC	2021-06-03	39229.66	37576.98	39482.46	37199.92	41098.93	1586641442.02	2021-06-04 23:40:37	2021-06-04 23:40:37	7
314020	ATOM	2021-06-15	12.96	13.24	13.58	12.64	689723.03	9061324.94	2021-06-16 23:43:28	2021-06-16 23:43:28	3
325330	BCH	2021-07-09	503.94	490.9	509.82	471.48	46648.2	22930076.25	2021-07-10 23:48:57	2021-07-10 23:48:57	8
387674	ZRX	2021-11-15	1.227	1.277	1.298	1.223	4416629.35	5555074.71	2021-11-16 04:18:24	2021-11-16 04:18:24	6
330434	ANT	2021-07-20	3.12	3.578	3.468	3.039	1050495.96	3277120.98	2021-07-21 23:51:27	2021-07-21 23:51:27	14
3219	BCH	2021-02-06	458.83	447.95	490.38	446.36	260829.98	122990201.42	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3223	BCH	2021-02-10	494.75	515.33	516.28	473.22	600902.91	297296773.91	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3224	BCH	2021-02-11	530.47	494.75	551.59	523.75	418214.16	221849349.89	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3229	BCH	2021-02-16	706.38	715.65	744.23	669.64	226699.88	160208394.57	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3230	BCH	2021-02-17	717.22	706.38	727.46	676.13	171188.76	121437873.49	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3240	BCH	2021-02-27	484.26	484.91	501.69	474.22	79090.2	38835094.86	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3241	BCH	2021-02-28	460.73	484.26	485.66	432.25	127182.47	57890089.74	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3242	BCH	2021-03-01	501.76	460.73	506.78	458.73	104420.58	50335842.76	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3243	BCH	2021-03-02	517.76	501.76	549.65	494.88	160072.5	83237564.87	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3244	BCH	2021-03-03	522.24	517.76	555.81	512.12	107661.25	57523484.52	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3245	BCH	2021-03-04	505.44	522.24	538.58	493.23	98033.54	50197969.8	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3246	BCH	2021-03-05	498.71	505.44	506.67	473.17	93619.32	45871599.65	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3247	BCH	2021-03-06	500.54	498.71	505.16	482.69	45234.51	22380609.81	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3248	BCH	2021-03-07	515.76	500.66	527.99	509.23	109053.48	56245150.39	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3249	BCH	2021-03-08	529.25	516.71	529.77	501.94	76376.79	39425247.6	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3250	BCH	2021-03-09	545.61	529.25	547.27	523.81	90087.54	48469816.28	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3251	BCH	2021-03-10	547.08	545.61	568.14	517.42	125465.03	68419276.32	2021-05-09 17:34:36	2021-05-09 17:34:36	8
10967	ATOM	2020-12-03	5.503	5.516	5.654	5.369	357444.9	1971190.68	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10968	ATOM	2020-12-04	5.061	5.503	5.539	5.004	596728.91	3164576.92	2021-05-09 17:34:36	2021-05-09 17:34:36	3
4711	EOS	2021-03-06	3.724	3.699	3.772	3.604	2296277.03	8486927.47	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4712	EOS	2021-03-07	3.832	3.724	3.845	3.717	2575234.58	9714898.67	2021-05-09 17:34:36	2021-05-09 17:34:36	9
344304	BCH	2021-08-19	660.08	632.53	660.1	620.1	44359.56	28314689.68	2021-08-20 23:58:22	2021-08-20 23:58:22	8
319280	BTC	2021-06-26	32307.35	31593.86	32680.58	30190.9	58331.1	1826363014.48	2021-06-27 23:45:59	2021-06-27 23:45:59	7
319236	ZRX	2021-06-26	0.6005	0.6026	0.6234	0.5694	5803694.37	3449883.81	2021-06-27 23:45:59	2021-06-27 23:45:59	6
376250	BTC	2021-10-24	60863.56	61313.09	61481.25	59529.34	19158.07	1158838824.68	2021-10-25 23:13:34	2021-10-25 23:13:34	7
370690	SJCX	2021-10-13	0.002295	0.00224	0.002295	0.002295	0	0	2021-10-14 23:11:04	2021-10-14 23:11:04	11
338750	XTZ	2021-08-07	3.425	3.36	3.534	3.306	4615989.97	15827504.35	2021-08-08 23:55:35	2021-08-08 23:55:35	5
333184	FIL	2021-07-26	49.05	48.99	52.96	48.81	638866.19	32574874.9	2021-07-27 23:52:50	2021-07-27 23:52:50	13
376238	ATOM	2021-10-24	34.26	35.69	36.02	33.49	1834319.89	63523933.7	2021-10-25 23:13:34	2021-10-25 23:13:34	3
376272	FIL	2021-10-24	62.58	64.8	65.1	61.29	262288.77	16560545.72	2021-10-25 23:13:34	2021-10-25 23:13:34	13
365832	XTZ	2021-10-03	8.698	7.338	8.924	7.333	32599777.01	270704089.37	2021-10-04 23:08:44	2021-10-04 23:08:44	5
355430	BCH	2021-09-11	636.39	628.39	639.55	629.16	74229.07	47238684.68	2021-09-12 23:03:37	2021-09-12 23:03:37	8
325780	DOT	2021-07-10	15.29	15.68	15.99	15.05	548280.99	8435075.22	2021-07-11 23:49:11	2021-07-11 23:49:11	4
361106	SJCX	2021-09-23	0.001796	0.001743	0.001796	0.001796	0	0	2021-09-24 21:06:23	2021-09-24 21:06:23	11
349476	OCN	2021-08-30	0.001065	0.001097	0.001162	0.001065	22561850.29	24037.21	2021-08-31 23:00:53	2021-08-31 23:00:53	2
383028	ZRX	2021-11-06	1.241	1.194	1.241	1.156	9380477.84	11320733.16	2021-11-07 21:16:30	2021-11-07 21:16:30	6
383020	BTC	2021-11-06	61529.76	61019.66	61594.16	60130.85	15432.25	939530051.87	2021-11-07 23:16:31	2021-11-07 23:16:31	7
360608	XTZ	2021-09-22	5.579	4.678	5.625	4.515	17161827.21	88273671.18	2021-09-23 23:06:10	2021-09-23 23:06:10	5
388176	ATOM	2021-11-16	29.2	31.46	31.46	29.03	1205262.33	36099463.22	2021-11-16 04:18:24	2021-11-16 04:18:24	3
383576	SJCX	2021-11-07	0.002532	0.002461	0.002532	0.002532	0	0	2021-11-08 23:16:45	2021-11-08 23:16:45	11
174	XTZ	2020-10-12	2.345	2.252	2.388	2.232	3046894.29	7041578.92	2021-05-07 19:24:31	2021-05-07 19:24:31	5
175	XTZ	2020-10-13	2.403	2.345	2.456	2.32	2954720.42	7055048.22	2021-05-07 19:24:31	2021-05-07 19:24:31	5
176	XTZ	2020-10-14	2.279	2.403	2.423	2.237	2582071.91	6003748.95	2021-05-07 19:24:31	2021-05-07 19:24:31	5
177	XTZ	2020-10-15	2.241	2.279	2.306	2.212	1998586.69	4492514.67	2021-05-07 19:24:31	2021-05-07 19:24:31	5
1465	ETH	2020-04-22	183.02	171.03	183.59	177.67	1563646.41	286183673.61	2021-04-22 21:03:20	2021-04-22 21:03:20	10
178	XTZ	2020-10-16	2.167	2.241	2.277	2.156	1947449.39	4280260.44	2021-05-07 19:24:31	2021-05-07 19:24:31	5
298146	OCN	2021-05-14	0.001346	0.001264	0.00151	0.001306	70310058.55	94668.48	2021-05-15 23:36:03	2021-05-15 23:36:03	2
308392	ETH	2021-06-03	2856.01	2706.52	2889.66	2663.83	630583.32	1767131489.54	2021-06-04 23:40:37	2021-06-04 23:40:37	10
304024	ZRX	2021-05-25	0.9783	0.9866	1.029	0.8885	13355232.28	12710110.1	2021-05-26 22:38:33	2021-05-26 22:38:33	6
11010	ATOM	2021-01-15	7.913	6.463	8.467	6.447	8985673.44	69203968.49	2021-05-09 17:34:36	2021-05-09 17:34:36	3
11017	ATOM	2021-01-22	8.006	7.16	8.484	6.602	2060258.12	15749457.16	2021-05-09 17:34:36	2021-05-09 17:34:36	3
11018	ATOM	2021-01-23	8.337	8.006	8.687	7.85	1329340.63	11103684.97	2021-05-09 17:34:36	2021-05-09 17:34:36	3
11019	ATOM	2021-01-24	8.24	8.337	8.791	7.886	1257459.93	10480549.8	2021-05-09 17:34:36	2021-05-09 17:34:36	3
11020	ATOM	2021-01-25	7.744	8.24	8.548	7.678	1271376.51	10382439.79	2021-05-09 17:34:36	2021-05-09 17:34:36	3
4596	EOS	2020-11-11	2.502	2.501	2.541	2.496	904489.25	2273998.82	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4597	EOS	2020-11-12	2.462	2.502	2.505	2.438	970134.23	2398938.21	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4598	EOS	2020-11-13	2.598	2.462	2.642	2.459	1868103.72	4794707.3	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4599	EOS	2020-11-14	2.538	2.598	2.606	2.497	1110091.54	2822232.86	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4600	EOS	2020-11-15	2.498	2.538	2.547	2.469	753553.95	1886578.7	2021-05-09 17:34:36	2021-05-09 17:34:36	9
1578	ETH	2020-08-13	424.97	387.19	431.71	377.01	812446.96	326856513.91	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1579	ETH	2020-08-14	438.51	424.97	444.64	418.03	721487.48	310718163.89	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1580	ETH	2020-08-15	432.57	438.48	442.89	424.74	958093.71	414440093.31	2021-05-07 19:24:30	2021-05-07 19:24:30	10
2284	OCN	2020-07-18	0.0004056	0.0003957	0.0004127	0.0003986	27865272.52	11303.4	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2285	OCN	2020-07-19	0.0004019	0.0004056	0.0004139	0.0003947	15630757.2	6281.84	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2288	OCN	2020-07-22	0.0004335	0.0004573	0.0004969	0.0004282	66038651.64	28626.75	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2289	OCN	2020-07-23	0.0004273	0.0004335	0.0004658	0.0004217	68099411.43	29095.98	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2290	OCN	2020-07-24	0.0004334	0.0004273	0.0004362	0.0004138	15668087.77	6790.24	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2291	OCN	2020-07-25	0.000431	0.0004334	0.0004738	0.0004249	10071527.68	4340.78	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2292	OCN	2020-07-26	0.0004236	0.000431	0.0004579	0.0004111	17472375.68	7401.28	2021-05-09 17:34:37	2021-05-09 17:34:37	2
11022	ATOM	2021-01-27	6.99	7.744	7.758	6.78	1373927.62	9892526.81	2021-05-09 17:34:36	2021-05-09 17:34:36	3
11023	ATOM	2021-01-28	8.057	6.99	8.519	6.829	2388712.53	18971793.02	2021-05-09 17:34:36	2021-05-09 17:34:36	3
11024	ATOM	2021-01-29	7.992	8.057	8.527	7.7	1776043.63	14307772.53	2021-05-09 17:34:36	2021-05-09 17:34:36	3
11025	ATOM	2021-01-30	8.067	7.992	8.309	7.759	1160476.89	9315194.89	2021-05-09 17:34:36	2021-05-09 17:34:36	3
11068	ATOM	2021-03-14	18.46	19.36	19.52	18.45	703501.02	13292613.65	2021-05-09 17:34:36	2021-05-09 17:34:36	3
11069	ATOM	2021-03-15	19.86	18.46	21.05	17.93	2081867.6	40757163.44	2021-05-09 17:34:36	2021-05-09 17:34:36	3
11070	ATOM	2021-03-16	21.03	19.86	22.04	18.59	2281191.68	46775329.31	2021-05-09 17:34:36	2021-05-09 17:34:36	3
11071	ATOM	2021-03-17	20.89	21.03	21.63	19.57	1442341.86	29599135.03	2021-05-09 17:34:36	2021-05-09 17:34:36	3
2293	OCN	2020-07-27	0.0003933	0.0004236	0.0004385	0.0003869	20929907.91	8232.06	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2294	OCN	2020-07-28	0.0004	0.0003933	0.0004191	0.0003746	26667926.22	10667.5	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2295	OCN	2020-07-29	0.0004042	0.0004	0.0004138	0.000366	9912442.41	4006.64	2021-05-09 17:34:37	2021-05-09 17:34:37	2
1581	ETH	2020-08-16	433.85	432.63	436.95	412.94	430834.33	183747481.55	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1582	ETH	2020-08-17	431.26	433.85	447	420.72	508591.11	220294114.98	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1627	ETH	2020-10-01	353.21	359.82	359.37	350.66	679105.54	239865351.68	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1628	ETH	2020-10-02	345.83	353.09	354.28	334.71	405076.24	138979278.48	2021-05-07 19:24:30	2021-05-07 19:24:30	10
4607	EOS	2020-11-22	3.063	3.228	3.3	2.909	6544925.16	20189048.71	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4608	EOS	2020-11-23	3.379	3.063	3.397	2.99	8453939.93	27390598.16	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4609	EOS	2020-11-24	3.594	3.379	3.766	3.335	14377125.57	50819564.67	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4610	EOS	2020-11-25	3.427	3.594	3.888	3.302	10736687.43	38486196.54	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4611	EOS	2020-11-26	2.958	3.427	3.526	2.714	12129743.78	36469246.79	2021-05-09 17:34:36	2021-05-09 17:34:36	9
1629	ETH	2020-10-03	346.32	345.96	349.91	344.31	403367.62	139693448.38	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1632	ETH	2020-10-06	340.85	353.84	355.32	336.93	324629.12	112291749.41	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1633	ETH	2020-10-07	341.91	340.85	342.87	333.27	341462.64	115694720.97	2021-05-07 19:24:30	2021-05-07 19:24:30	10
325332	SJCX	2021-07-09	0.001352	0.001315	0.001352	0.001352	0	0	2021-07-10 22:48:57	2021-07-10 22:48:57	11
314022	FIL	2021-06-15	72.6	74.86	75.85	71.63	300424.87	22131863.67	2021-06-16 23:43:28	2021-06-16 23:43:28	13
4612	EOS	2020-11-27	2.876	2.958	3.033	2.76	4191558.6	12094519.56	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4613	EOS	2020-11-28	2.998	2.876	3.073	2.829	3423513.8	10153152.92	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4614	EOS	2020-11-29	3.034	2.998	3.099	2.908	2483235.28	7422207.81	2021-05-09 17:34:36	2021-05-09 17:34:36	9
319238	FIL	2021-06-26	53.03	52.12	53.26	50.02	306330.24	15861992.04	2021-06-27 23:45:59	2021-06-27 23:45:59	13
325790	ANT	2021-07-10	3.616	3.695	3.683	3.61	130072.01	470377.14	2021-07-11 23:49:11	2021-07-11 23:49:11	14
330436	ATOM	2021-07-20	9.462	9.955	10.16	8.966	2040319.86	19243493.31	2021-07-21 23:51:27	2021-07-21 23:51:27	3
333186	ZRX	2021-07-26	0.6754	0.6585	0.725	0.6556	7074371.28	4936050.04	2021-07-27 22:52:50	2021-07-27 22:52:50	6
339610	XTZ	2021-08-09	3.287	3.181	3.345	3.108	3062729.62	10034479.76	2021-08-10 23:56:03	2021-08-10 23:56:03	5
339236	BTC	2021-08-08	43827.75	44617.96	45310.33	43300.59	39433.62	1745878741.47	2021-08-09 23:55:48	2021-08-09 23:55:48	7
339150	ATOM	2021-08-08	13.14	14.02	14.22	13.02	689316.16	9350705.66	2021-08-09 23:55:49	2021-08-09 23:55:49	3
344306	BTC	2021-08-19	46761.49	44714.54	47044.06	43982.21	33300.5	1511027965.43	2021-08-20 23:58:21	2021-08-20 23:58:21	7
349478	BCH	2021-08-30	632.8	659.56	665.26	630.88	63508.32	41029710.17	2021-08-31 23:00:53	2021-08-31 23:00:53	8
2309	OCN	2020-08-12	0.0004879	0.000485	0.0005111	0.000484	20222067.86	9865.53	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2310	OCN	2020-08-13	0.0005185	0.0004879	0.000612	0.00051	53765791.71	27875.6	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2331	OCN	2020-09-03	0.0003825	0.0005102	0.0004437	0.000371	58154917.05	22241.93	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2332	OCN	2020-09-04	0.0003898	0.0003825	0.0004206	0.0003319	38528650.62	15017.28	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2333	OCN	2020-09-05	0.0003486	0.0003898	0.0003788	0.0003218	71806583.69	25035.34	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2334	OCN	2020-09-06	0.0003668	0.0003486	0.0003809	0.0003527	35174265.78	12901.84	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2335	OCN	2020-09-07	0.0003537	0.0003668	0.0003785	0.0003466	42719336.5	15109.83	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2336	OCN	2020-09-08	0.0003476	0.0003537	0.0003543	0.0003307	26555685.23	9230.05	2021-05-09 17:34:37	2021-05-09 17:34:37	2
1634	ETH	2020-10-08	351.2	341.91	353.4	334.35	295984.38	102219748.95	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1635	ETH	2020-10-09	365.41	351.2	368.51	347.19	336130.72	120746450.13	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1636	ETH	2020-10-10	370.88	365.41	378.52	365.2	253908.73	94915521.94	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1637	ETH	2020-10-11	374.37	370.8	376.42	371.75	405554.05	151826472.42	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1638	ETH	2020-10-12	386.91	374.4	395.22	365.82	369132.22	140830030.43	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1639	ETH	2020-10-13	381.41	386.91	387.82	374.78	255939.5	97704716.98	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1642	ETH	2020-10-16	365.58	377.82	379.9	361.57	318744.72	117467322.34	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1643	ETH	2020-10-17	368.65	365.72	369.11	366.27	322825.81	119010667.66	2021-05-07 19:24:30	2021-05-07 19:24:30	10
11084	ATOM	2021-03-30	19.98	20.26	20.62	19.45	1014993.14	20240909.54	2021-05-09 17:34:36	2021-05-09 17:34:36	3
11085	ATOM	2021-03-31	19.1	19.98	20.1	18.21	1017618.34	19485866.81	2021-05-09 17:34:36	2021-05-09 17:34:36	3
11086	ATOM	2021-04-01	19.48	19.1	19.8	18.94	993194.15	19213079.04	2021-05-09 17:34:36	2021-05-09 17:34:36	3
11087	ATOM	2021-04-02	20.32	19.48	20.39	19.16	985119.15	19470814.58	2021-05-09 17:34:36	2021-05-09 17:34:36	3
319240	BCH	2021-06-26	460.06	450.53	464.26	451.01	119142.39	54812250.48	2021-06-27 21:45:58	2021-06-27 21:45:58	8
304026	ANT	2021-05-25	4.395	4.09	4.595	3.846	726183.61	3191833.11	2021-05-26 20:38:32	2021-05-26 20:38:32	14
1644	ETH	2020-10-18	378.44	368.65	379.59	372.8	359498.81	136049864.63	2021-05-07 19:24:30	2021-05-07 19:24:30	10
11088	ATOM	2021-04-03	20.07	20.32	22.55	19.86	2502120.9	53358150.19	2021-05-09 17:34:36	2021-05-09 17:34:36	3
11089	ATOM	2021-04-04	21.56	20.07	21.93	19.66	991803.84	20716994.54	2021-05-09 17:34:36	2021-05-09 17:34:36	3
11090	ATOM	2021-04-05	21.43	21.56	22.19	20.21	1206878.27	25783529.9	2021-05-09 17:34:36	2021-05-09 17:34:36	3
11091	ATOM	2021-04-06	21.65	21.43	23.18	21.05	2068715.24	45322985.36	2021-05-09 17:34:36	2021-05-09 17:34:36	3
298148	ZRX	2021-05-14	1.706	1.608	1.769	1.592	10140632.54	17005861.97	2021-05-15 22:36:03	2021-05-15 22:36:03	6
308394	DOT	2021-06-03	26.97	25.95	28.62	25.7	2223669.03	60283378.61	2021-06-04 23:40:37	2021-06-04 23:40:37	4
330438	OCN	2021-07-20	0.0007861	0.0008911	0.0009647	0.0007682	24494027.36	19253.99	2021-07-21 22:51:27	2021-07-21 22:51:27	2
2296	OCN	2020-07-30	0.0004023	0.0004042	0.0004325	0.0003855	22850742.04	9192.85	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2297	OCN	2020-07-31	0.0003988	0.0004023	0.00043	0.0003988	15640305.59	6237.85	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2298	OCN	2020-08-01	0.0004184	0.0003988	0.0004726	0.0004145	15488197.81	6480.31	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2299	OCN	2020-08-02	0.0004017	0.0004184	0.00045	0.0003719	46054762.7	18499.48	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2300	OCN	2020-08-03	0.0004054	0.0004017	0.000417	0.0003938	25888429.21	10495.3	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2301	OCN	2020-08-04	0.000421	0.0004054	0.0004366	0.0003937	33578217.97	14135.53	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2337	OCN	2020-09-09	0.0003582	0.0003476	0.0003652	0.0003476	62608436.6	22424.65	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2339	OCN	2020-09-11	0.0003815	0.0003828	0.0003964	0.0003703	94647416.34	36105.13	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2340	OCN	2020-09-12	0.000384	0.0003815	0.0004073	0.0003762	86949628.18	33388.76	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2341	OCN	2020-09-13	0.0003627	0.000384	0.0004103	0.000348	105097332.9	38115.3	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2342	OCN	2020-09-14	0.0003659	0.0003627	0.0003848	0.0003546	82233841.95	30091.24	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2343	OCN	2020-09-15	0.000346	0.0003659	0.0003533	0.0003351	70858762.62	24515.75	2021-05-09 17:34:37	2021-05-09 17:34:37	2
1645	ETH	2020-10-19	379.41	378.44	384.42	373.04	257142.52	97474550.54	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1646	ETH	2020-10-20	368.74	379.39	386.03	367.91	859418.6	316902577.83	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1647	ETH	2020-10-21	391.46	368.83	401.78	368.19	731278.91	283451951.4	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1648	ETH	2020-10-22	414.5	391.46	421.25	391.34	567385.97	232628091.79	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1649	ETH	2020-10-23	409.57	414.5	419.47	401.93	330934.12	136314943.28	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1650	ETH	2020-10-24	412.55	409.59	418.85	410.45	455908.25	188086893.4	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1651	ETH	2020-10-25	406.36	412.55	411.97	406.1	415309.34	168766807.67	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1652	ETH	2020-10-26	393.11	406.3	411.39	382.64	405412.22	160975600.73	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1653	ETH	2020-10-27	403.74	393.11	410.25	390.4	264061.94	105902450.86	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1654	ETH	2020-10-28	388.77	403.74	409.35	381.06	192392.15	75394842.45	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1655	ETH	2020-10-29	387.54	388.77	393.98	380.87	249693.18	97143305.34	2021-05-07 19:24:30	2021-05-07 19:24:30	10
314024	ANT	2021-06-15	6.354	6.634	9	4.595	1345100.22	8546237.17	2021-06-16 22:43:28	2021-06-16 22:43:28	14
325334	BTC	2021-07-09	33804.2	32874.01	34076.49	32274.31	25677.95	853165387.13	2021-07-10 23:48:57	2021-07-10 23:48:57	7
333188	DOT	2021-07-26	13.93	13.73	15.27	13.66	4584950.5	67144577.37	2021-07-27 23:52:50	2021-07-27 23:52:50	4
344308	ATOM	2021-08-19	18.71	17.99	20.39	17.83	3196237.25	61458639.41	2021-08-20 23:58:21	2021-08-20 23:58:21	3
339616	BCH	2021-08-09	592.09	556.03	600.47	543.8	74048.43	43234669.93	2021-08-10 23:56:03	2021-08-10 23:56:03	8
339152	XTZ	2021-08-08	3.181	3.425	3.488	3.161	2651393.39	8803119.74	2021-08-09 23:55:48	2021-08-09 23:55:48	5
349480	SJCX	2021-08-30	0.00188	0.001952	0.00188	0.00188	0	0	2021-08-31 23:00:53	2021-08-31 23:00:53	11
355434	ANT	2021-09-11	5.484	5.42	5.741	5.39	48188.06	268761.06	2021-09-12 22:03:37	2021-09-12 22:03:37	14
360612	FIL	2021-09-22	74.55	69.43	75.01	68.67	397937.41	28586345.89	2021-09-23 23:06:10	2021-09-23 23:06:10	13
361102	ZRX	2021-09-23	0.9956	0.971	0.997	0.936	6632069.19	6423762.34	2021-09-24 23:06:24	2021-09-24 23:06:24	6
365838	SJCX	2021-10-03	0.001929	0.001907	0.001929	0.001929	0	0	2021-10-04 23:08:45	2021-10-04 23:08:45	11
371144	ANT	2021-10-14	4.578	4.611	4.687	4.424	152014.7	695898.75	2021-10-15 23:11:16	2021-10-15 23:11:16	14
376252	SJCX	2021-10-24	0.002435	0.002453	0.002435	0.002435	0	0	2021-10-25 22:13:34	2021-10-25 22:13:34	11
67496	BTC	2021-04-24	50115.99	51178.03	51223.86	48769.48	33894.94	1695108976.06	2021-05-09 17:34:36	2021-05-09 17:34:36	7
298150	ETH	2021-05-14	4080.13	3718.99	4176.42	3696.24	681070.26	2713948078.85	2021-05-15 23:36:03	2021-05-15 23:36:03	10
304028	ATOM	2021-05-25	13.93	14.51	14.92	12.43	502960.45	6826485.53	2021-05-26 23:38:33	2021-05-26 23:38:33	3
308430	XTZ	2021-06-03	3.876	3.811	3.986	3.724	3481234.41	13413070.27	2021-06-04 23:40:37	2021-06-04 23:40:37	5
325336	OCN	2021-07-09	0.0006437	0.0006344	0.0007081	0.0006437	41087403.37	26448	2021-07-10 23:48:57	2021-07-10 23:48:57	2
1656	ETH	2020-10-30	382.76	387.54	392.05	374.08	379042.31	144640027.44	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1657	ETH	2020-10-31	386.77	382.83	392.57	385.67	547916.74	211918605.81	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1658	ETH	2020-11-01	396.75	386.77	397.71	385.6	850038.51	337253108.32	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1659	ETH	2020-11-02	383.61	396.49	404.39	378.67	347549.1	135741837.5	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1660	ETH	2020-11-03	388.18	383.66	398.14	388.18	341553.65	132583691.44	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1661	ETH	2020-11-04	402.66	388.17	408.58	377.14	254271.89	100082927.23	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1662	ETH	2020-11-05	416.89	402.66	420.74	397.1	257653.91	105310367.9	2021-05-07 19:24:30	2021-05-07 19:24:30	10
339154	ANT	2021-08-08	4.331	4.424	4.549	4.258	346290.73	1499805.32	2021-08-09 23:55:49	2021-08-09 23:55:49	14
330926	SJCX	2021-07-21	0.001286	0.001192	0.001286	0.001286	0	0	2021-07-22 21:51:40	2021-07-22 21:51:40	11
344310	FIL	2021-08-19	70.48	67.47	70.51	66.31	274171.07	18635299.02	2021-08-20 23:58:22	2021-08-20 23:58:22	13
330876	ETH	2021-07-21	1994.98	1786.52	2030.25	1755.61	582170.14	1115295604.75	2021-07-22 23:51:41	2021-07-22 23:51:41	10
319242	EOS	2021-06-26	3.571	3.541	3.656	3.355	2798476.75	9715256.34	2021-06-27 23:45:59	2021-06-27 23:45:59	9
1663	ETH	2020-11-06	456.32	416.89	458.22	415.41	374046.51	164108426.67	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1664	ETH	2020-11-07	435.82	456.32	468.04	426.27	353304.45	158253714.77	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1692	ETH	2020-12-05	596.93	567.79	599.99	580.64	750251.2	447845298.9	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1693	ETH	2020-12-06	602.3	596.93	610.44	599	659997.39	397514748.44	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1694	ETH	2020-12-07	591.36	602.3	602.49	587.53	645874.83	381946393.32	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1695	ETH	2020-12-08	554.82	591.53	595.17	549.12	537079.56	307106189.41	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1696	ETH	2020-12-09	573.44	554.82	577.8	530.82	749281.63	418399444.97	2021-05-07 19:24:30	2021-05-07 19:24:30	10
11021	ATOM	2021-01-26	7.744	7.744	7.954	7.381	844683	6501289.57	2021-05-09 17:34:36	2021-05-09 17:34:36	3
11026	ATOM	2021-01-31	8.162	8.067	8.889	7.704	2054152.83	17022675.48	2021-05-09 17:34:36	2021-05-09 17:34:36	3
11027	ATOM	2021-02-01	9.286	8.162	9.286	7.844	2703245.26	23338838.13	2021-05-09 17:34:36	2021-05-09 17:34:36	3
11028	ATOM	2021-02-02	8.901	9.286	9.329	8.722	2448775.39	21992441.52	2021-05-09 17:34:36	2021-05-09 17:34:36	3
11029	ATOM	2021-02-03	9.317	8.901	9.439	8.765	2097346.11	19068692	2021-05-09 17:34:36	2021-05-09 17:34:36	3
11030	ATOM	2021-02-04	9.164	9.317	9.517	8.666	2286534.99	20798196.36	2021-05-09 17:34:36	2021-05-09 17:34:36	3
11031	ATOM	2021-02-05	12.22	9.164	12.92	9.03	5526103.58	61681714.11	2021-05-09 17:34:36	2021-05-09 17:34:36	3
11032	ATOM	2021-02-06	12.08	12.22	13.65	11.28	4969789.23	60811662.23	2021-05-09 17:34:36	2021-05-09 17:34:36	3
11045	ATOM	2021-02-19	22.87	23.06	23.51	21.48	2352898.3	52988728.43	2021-05-09 17:34:36	2021-05-09 17:34:36	3
11046	ATOM	2021-02-20	21.61	22.87	24.49	20.33	3564028.36	82112350.69	2021-05-09 17:34:36	2021-05-09 17:34:36	3
11047	ATOM	2021-02-21	21.63	21.61	22.64	20.84	1944768.34	41943817.2	2021-05-09 17:34:36	2021-05-09 17:34:36	3
1697	ETH	2020-12-10	558.36	573.44	575.27	548.52	354098.49	198710326.68	2021-05-07 19:24:30	2021-05-07 19:24:30	10
11092	ATOM	2021-04-07	19.55	21.65	22.09	18.74	2117922.31	42699914.25	2021-05-09 17:34:36	2021-05-09 17:34:36	3
11093	ATOM	2021-04-08	20.53	19.55	20.64	19.48	971472.95	19590606.08	2021-05-09 17:34:36	2021-05-09 17:34:36	3
11094	ATOM	2021-04-09	21.38	20.53	21.51	20.5	834709.5	17566385.55	2021-05-09 17:34:36	2021-05-09 17:34:36	3
11095	ATOM	2021-04-10	21.03	21.38	22.63	20.56	1226901.25	26649148.96	2021-05-09 17:34:36	2021-05-09 17:34:36	3
4717	EOS	2021-03-12	3.788	3.955	3.993	3.682	6260861.23	23929543.2	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4718	EOS	2021-03-13	4.283	3.788	4.384	3.685	8024412.79	32481997.83	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4719	EOS	2021-03-14	3.928	4.283	4.383	3.927	6007617.44	24809404.51	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4720	EOS	2021-03-15	3.816	3.928	4.031	3.721	8300750.58	32015137.65	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4721	EOS	2021-03-16	4.066	3.816	4.129	3.673	7250649.57	28510190.33	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4722	EOS	2021-03-17	4.086	4.066	4.091	3.856	3956569.23	15730283.22	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4723	EOS	2021-03-18	4.143	4.086	4.325	4.06	6634131.24	27725135.39	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4724	EOS	2021-03-19	4.142	4.143	4.268	4.03	4156876.83	17382318.05	2021-05-09 17:34:36	2021-05-09 17:34:36	9
314026	EOS	2021-06-15	5.191	5.296	5.394	5.109	2980789.1	15622656.11	2021-06-16 23:43:28	2021-06-16 23:43:28	9
360614	ETH	2021-09-22	3078.88	2760.2	3090.16	2738.86	525831.56	1546061749.14	2021-09-23 23:06:10	2021-09-23 23:06:10	10
1698	ETH	2020-12-11	544.14	558.36	560.35	535.92	569602.04	310867291.92	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1699	ETH	2020-12-12	568.26	544.14	574.11	543.48	297399.48	166540219.65	2021-05-07 19:24:30	2021-05-07 19:24:30	10
333632	ATOM	2021-07-27	11.72	11.38	11.79	11.03	1306630.71	14900474.07	2021-07-28 22:53:03	2021-07-28 22:53:03	3
355436	EOS	2021-09-11	4.672	4.568	4.788	4.553	5158645.7	24208172.18	2021-09-12 23:03:37	2021-09-12 23:03:37	9
349482	ZRX	2021-08-30	1.046	1.096	1.117	1.036	6812120.65	7319137.98	2021-08-31 23:00:53	2021-08-31 23:00:53	6
371662	ETH	2021-10-15	3868.16	3791.23	3902.04	3735.27	381684.12	1458863383.96	2021-10-16 23:11:30	2021-10-16 23:11:30	10
361096	DOT	2021-09-23	33.46	31.61	33.61	30.4	4762740.94	151610714.84	2021-09-24 23:06:24	2021-09-24 23:06:24	4
365850	DOT	2021-10-03	32.11	32.04	32.69	31.32	2556837.39	81891479.57	2021-10-04 23:08:45	2021-10-04 23:08:45	4
371146	SJCX	2021-10-14	0.002294	0.002295	0.002294	0.002294	0	0	2021-10-15 22:11:16	2021-10-15 22:11:16	11
371194	OCN	2021-10-14	0.0005736	0.0005737	0.0005736	0.0005736	3192643.09	1831.27	2021-10-15 23:11:21	2021-10-15 23:11:21	2
376242	EOS	2021-10-24	4.744	4.748	5.086	4.657	11804422.94	57367808.12	2021-10-25 23:13:34	2021-10-25 23:13:34	9
376244	XTZ	2021-10-24	6.477	6.736	6.743	6.279	4540305.37	29423990	2021-10-25 23:13:34	2021-10-25 23:13:34	5
383598	ATOM	2021-11-07	35.72	36.24	36.49	35.49	1009496.54	36317690.99	2021-11-08 23:16:45	2021-11-08 23:16:45	3
383030	FIL	2021-11-06	61.85	63.56	63.72	58.17	471033.66	28850339.99	2021-11-07 23:16:31	2021-11-07 23:16:31	13
383564	ZRX	2021-11-07	1.219	1.241	1.252	1.201	4087618.6	4969585.18	2021-11-08 23:16:45	2021-11-08 23:16:45	6
387676	EOS	2021-11-15	4.809	4.958	5.097	4.765	3664607.64	18142766.32	2021-11-16 04:18:24	2021-11-16 04:18:24	9
1701	ETH	2020-12-14	586.35	590.72	591.45	575.93	277062.65	162125862.95	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1702	ETH	2020-12-15	589.17	586.35	596.93	579.25	293205.54	172371762.61	2021-05-07 19:24:30	2021-05-07 19:24:30	10
236	XTZ	2020-12-13	2.23	2.135	2.269	2.127	2612719.25	5702480.41	2021-05-07 19:24:31	2021-05-07 19:24:31	5
11048	ATOM	2021-02-22	21.15	21.63	21.69	16.33	4261513.95	83349331.29	2021-05-09 17:34:36	2021-05-09 17:34:36	3
1703	ETH	2020-12-16	637.74	589.17	638.73	581.3	808780.64	497086861.72	2021-05-07 19:24:30	2021-05-07 19:24:30	10
2372	OCN	2020-10-14	0.0002729	0.0002822	0.0002843	0.0002653	134785501.75	36784.15	2021-05-09 17:34:37	2021-05-09 17:34:37	2
11049	ATOM	2021-02-23	20.27	21.15	23.8	15.22	8163848.94	160491786.33	2021-05-09 17:34:36	2021-05-09 17:34:36	3
1704	ETH	2020-12-17	643.16	637.74	675.88	627.08	1349219.92	878651645.58	2021-05-07 19:24:30	2021-05-07 19:24:30	10
11057	ATOM	2021-03-03	21.43	18.88	22.1	18.59	3306745.52	67501700.21	2021-05-09 17:34:36	2021-05-09 17:34:36	3
11058	ATOM	2021-03-04	18.83	21.43	21.84	18.15	3147187.99	62890560.78	2021-05-09 17:34:36	2021-05-09 17:34:36	3
2373	OCN	2020-10-15	0.0002645	0.0002729	0.000272	0.0002569	95849998.63	25349.83	2021-05-09 17:34:37	2021-05-09 17:34:37	2
11059	ATOM	2021-03-05	18.7	18.83	19.47	17.94	1648480.42	30777611.12	2021-05-09 17:34:36	2021-05-09 17:34:36	3
11060	ATOM	2021-03-06	18.93	18.7	19.09	18.24	799925.19	14972287.91	2021-05-09 17:34:36	2021-05-09 17:34:36	3
11061	ATOM	2021-03-07	19.49	18.93	19.5	18.65	873715.18	16652178.09	2021-05-09 17:34:36	2021-05-09 17:34:36	3
11062	ATOM	2021-03-08	19.4	19.49	19.84	18.57	1586167.01	30279601.18	2021-05-09 17:34:36	2021-05-09 17:34:36	3
11063	ATOM	2021-03-09	21.11	19.4	21.2	19.06	1691253.65	34037334.44	2021-05-09 17:34:36	2021-05-09 17:34:36	3
11064	ATOM	2021-03-10	19.61	21.11	21.29	19.11	1413547.25	28269727.37	2021-05-09 17:34:36	2021-05-09 17:34:36	3
11065	ATOM	2021-03-11	19.33	19.61	19.74	18.61	927030.22	17869224.59	2021-05-09 17:34:36	2021-05-09 17:34:36	3
1705	ETH	2020-12-18	654.55	643.16	664.2	629.63	528429.46	341755740.38	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1706	ETH	2020-12-19	658.7	654.55	669.79	646.4	514459.89	338530489.08	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1713	ETH	2020-12-26	636.07	626.83	651.93	615.66	551377.41	350294888.79	2021-05-07 19:24:30	2021-05-07 19:24:30	10
11066	ATOM	2021-03-12	18.56	19.33	19.46	17.76	1206872.15	22413453.66	2021-05-09 17:34:36	2021-05-09 17:34:36	3
304030	ETH	2021-05-25	2707.49	2648.77	2755.91	2387.23	1514977.65	3915916814.09	2021-05-26 23:38:33	2021-05-26 23:38:33	10
1714	ETH	2020-12-27	683.98	636.07	714.04	625.57	1251438.81	842878848.15	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1715	ETH	2020-12-28	729.59	683.98	746.88	681.29	1077695.67	781168475.41	2021-05-07 19:24:30	2021-05-07 19:24:30	10
2374	OCN	2020-10-16	0.0002559	0.0002645	0.0002632	0.0002449	124705205.96	31912.81	2021-05-09 17:34:37	2021-05-09 17:34:37	2
1716	ETH	2020-12-29	731.55	729.59	739.39	688.87	708399.11	507583628.28	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1717	ETH	2020-12-30	752.53	731.55	758.27	717.54	670985.03	495447971.32	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1718	ETH	2020-12-31	737.15	752.53	755.68	722.92	548855.97	405487796.36	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1719	ETH	2021-01-01	730.6	737.15	749.71	717.14	436164.48	320856381.75	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1720	ETH	2021-01-02	774.9	730.6	788.27	716.71	904953.39	688632713.33	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1721	ETH	2021-01-03	978.69	774.9	1011.81	770.07	2200163.67	1987810339.53	2021-05-07 19:24:30	2021-05-07 19:24:30	10
2375	OCN	2020-10-17	0.0002506	0.0002559	0.0002617	0.0002469	104230198.87	26120.13	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2376	OCN	2020-10-18	0.0002649	0.0002506	0.0002914	0.0002536	147054297.78	38955.86	2021-05-09 17:34:37	2021-05-09 17:34:37	2
319274	SJCX	2021-06-26	0.001292	0.001264	0.001292	0.001292	0	0	2021-06-27 23:45:59	2021-06-27 23:45:59	11
2377	OCN	2020-10-19	0.000258	0.0002649	0.0002694	0.0002504	109952671.31	28367.66	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2378	OCN	2020-10-20	0.0002508	0.000258	0.0002582	0.0002434	107088342.9	26858.23	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2402	OCN	2020-11-13	0.000267	0.0002638	0.0003386	0.0002623	187849671.45	50164.73	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2403	OCN	2020-11-14	0.0002582	0.000267	0.0002766	0.0002536	115163206.14	29732.47	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2404	OCN	2020-11-15	0.0002377	0.0002582	0.0002557	0.0002332	115329554.18	27415.02	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2405	OCN	2020-11-16	0.0002533	0.0002377	0.0002672	0.0002395	125096931.52	31692.18	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2474	OCN	2021-01-24	0.0002506	0.0002592	0.0002924	0.0002506	293530395.85	73570.75	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2475	OCN	2021-01-25	0.0002505	0.0002506	0.0002505	0.0002241	357355504.11	89520.88	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2476	OCN	2021-01-26	0.0002463	0.0002505	0.0002736	0.0002463	368255839.3	90693.9	2021-05-09 17:34:37	2021-05-09 17:34:37	2
325792	EOS	2021-07-10	3.967	4.215	4.424	3.875	6032502.72	24744837.72	2021-07-11 23:49:11	2021-07-11 23:49:11	9
314028	BCH	2021-06-15	627.62	641.58	649.89	616.86	59961.08	37952223.82	2021-06-16 23:43:28	2021-06-16 23:43:28	8
11067	ATOM	2021-03-13	19.36	18.56	19.86	17.88	1002032.4	19158281.5	2021-05-09 17:34:36	2021-05-09 17:34:36	3
330878	FIL	2021-07-21	46.19	41.22	47.81	40.07	269172.73	12110913.3	2021-07-22 21:51:40	2021-07-22 21:51:40	13
298152	FIL	2021-05-14	120.7	117.77	124.92	114.03	735268.16	87510847.14	2021-05-15 23:36:03	2021-05-15 23:36:03	13
11081	ATOM	2021-03-27	18.7	18.95	19.21	18.03	752870.75	14082036.05	2021-05-09 17:34:36	2021-05-09 17:34:36	3
391	DOT	2020-05-16	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
325338	EOS	2021-07-09	4.215	3.598	4.308	3.459	9167714.56	36899396.91	2021-07-10 23:48:57	2021-07-10 23:48:57	9
308434	FIL	2021-06-03	89.45	70.04	94.02	69.48	1471908.13	123477932.25	2021-06-04 22:40:37	2021-06-04 22:40:37	13
333634	BTC	2021-07-27	39496.69	37269.52	39535.5	36422.45	58179.65	2197490232.78	2021-07-28 23:53:04	2021-07-28 23:53:04	7
339622	SJCX	2021-08-09	0.001852	0.001753	0.001852	0.001852	0	0	2021-08-10 23:56:03	2021-08-10 23:56:03	11
339156	FIL	2021-08-08	64.58	69.33	69.47	63.46	371256.25	24470170.69	2021-08-09 23:55:49	2021-08-09 23:55:49	13
349940	XTZ	2021-08-31	5.177	5.391	5.595	5.012	12750788.37	67638083.04	2021-09-01 23:01:07	2021-09-01 23:01:07	5
344312	DOT	2021-08-19	26.58	23.9	26.81	23.23	3405378.67	83790730.07	2021-08-20 23:58:21	2021-08-20 23:58:21	4
350426	DOT	2021-09-01	33.2	31.36	33.81	29.67	2613068.37	81702164.08	2021-09-02 23:01:21	2021-09-02 23:01:21	4
349976	ZRX	2021-08-31	1.065	1.046	1.082	1.024	6125706.63	6462314.61	2021-09-01 23:01:07	2021-09-01 23:01:07	6
355438	SJCX	2021-09-11	0.001807	0.001794	0.001807	0.001807	0	0	2021-09-12 22:03:37	2021-09-12 22:03:37	11
361094	OCN	2021-09-23	0.0009148	0.0008621	0.001167	0.0008833	30436116.46	27844.17	2021-09-24 23:06:24	2021-09-24 23:06:24	2
360616	OCN	2021-09-22	0.0008621	0.0008281	0.001016	0.0008621	18049665.33	15560.37	2021-09-23 22:06:10	2021-09-23 22:06:10	2
365856	EOS	2021-10-03	4.638	4.327	4.865	4.227	8702913.59	40132718.65	2021-10-04 23:08:44	2021-10-04 23:08:44	9
371148	ZRX	2021-10-14	1.035	1.028	1.046	1.009	4454212.73	4580320.28	2021-10-15 23:11:16	2021-10-15 23:11:16	6
371678	FIL	2021-10-15	67.26	70.36	70.38	65.15	526598.17	35638985.2	2021-10-16 23:11:30	2021-10-16 23:11:30	13
1737	ETH	2021-01-19	1367.65	1258.31	1439.37	1252.78	1607009.53	2197247666.73	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1738	ETH	2021-01-20	1377.75	1367.65	1408.06	1234.88	1362169.39	1802865032.38	2021-05-07 19:24:30	2021-05-07 19:24:30	10
11082	ATOM	2021-03-28	19.31	18.7	19.86	18.44	905503.65	17411824.72	2021-05-09 17:34:36	2021-05-09 17:34:36	3
11083	ATOM	2021-03-29	20.26	19.31	20.98	19.05	1039832.09	20802441.68	2021-05-09 17:34:36	2021-05-09 17:34:36	3
2477	OCN	2021-01-27	0.0002359	0.0002463	0.0002483	0.0002111	462283822.31	109046.7	2021-05-09 17:34:37	2021-05-09 17:34:37	2
1739	ETH	2021-01-21	1111.49	1377.75	1389.04	1086.55	1941246.58	2374156404.45	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1740	ETH	2021-01-22	1234.56	1111.49	1275.45	1044.92	1781416.3	2068128154.63	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1741	ETH	2021-01-23	1234.1	1234.56	1272.57	1197.55	617746.69	766118780.58	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1742	ETH	2021-01-24	1392.45	1234.1	1400.2	1221.78	1164242.17	1540273353.15	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1743	ETH	2021-01-25	1318.47	1392.45	1475.49	1296.02	1477949.16	2072432387.85	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1744	ETH	2021-01-26	1368.22	1318.47	1378.06	1246.49	1325006.34	1749379399.61	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1745	ETH	2021-01-27	1241.51	1368.22	1374.39	1207.77	1409050.67	1798477778.92	2021-05-07 19:24:30	2021-05-07 19:24:30	10
2478	OCN	2021-01-28	0.0002528	0.0002359	0.0002662	0.0002395	478458103.87	120977.27	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2479	OCN	2021-01-29	0.0002758	0.0002528	0.000331	0.0002482	249703468.63	68874.71	2021-05-09 17:34:37	2021-05-09 17:34:37	2
319730	FIL	2021-06-27	56.18	53.03	56.5	52.71	215496.65	11700000.19	2021-06-28 23:46:14	2021-06-28 23:46:14	13
319700	ETH	2021-06-27	1983.33	1830.94	1984.58	1808.2	583203.44	1092710033.78	2021-06-28 23:46:14	2021-06-28 23:46:14	10
314030	SJCX	2021-06-15	0.001606	0.001621	0.001606	0.001606	0	0	2021-06-16 23:43:28	2021-06-16 23:43:28	11
304032	BTC	2021-05-25	38387.36	38837.76	39842.9	36509.09	66530.67	2529569055.97	2021-05-26 22:38:33	2021-05-26 22:38:33	7
298154	BTC	2021-05-14	49887.96	49700.6	51554.66	48910.06	42891.66	2156016499.66	2021-05-15 23:36:03	2021-05-15 23:36:03	7
349942	BTC	2021-08-31	47159.26	46993.31	48252.74	46713.72	29947.56	1418199668.83	2021-09-01 23:01:06	2021-09-01 23:01:06	7
330880	ZRX	2021-07-21	0.6347	0.5473	0.6563	0.5306	8206356.35	4987481.97	2021-07-22 23:51:41	2021-07-22 23:51:41	6
365890	ANT	2021-10-03	4.95	4.987	5.072	4.843	49700.71	245937.97	2021-10-04 23:08:44	2021-10-04 23:08:44	14
308836	XTZ	2021-06-04	3.557	3.876	3.9	3.365	4263396.25	15203568.74	2021-06-05 23:40:50	2021-06-05 23:40:50	5
360618	BCH	2021-09-22	547.98	504.22	548.21	497	76398.37	40305506.72	2021-09-23 23:06:10	2021-09-23 23:06:10	8
361098	XTZ	2021-09-23	6.21	5.579	6.588	5.509	20724205.1	126455368.41	2021-09-24 23:06:24	2021-09-24 23:06:24	5
1746	ETH	2021-01-28	1330.78	1241.51	1361.36	1220.48	1035138.63	1368788914.36	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1747	ETH	2021-01-29	1379.13	1330.78	1442.14	1287.5	1622581.39	2215293756.32	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1748	ETH	2021-01-30	1379.35	1379.13	1406.51	1326.9	585864.43	798440634.01	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1749	ETH	2021-01-31	1314.18	1379.35	1381.53	1283.77	492089.73	653725686.92	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1750	ETH	2021-02-01	1374.57	1314.18	1377.77	1271.68	585469.21	774664819.38	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1751	ETH	2021-02-02	1513.9	1374.57	1549.2	1361.84	1325932.08	1932069095.73	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1752	ETH	2021-02-03	1667.22	1513.9	1670.87	1510.16	1156693.15	1832159523.59	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1753	ETH	2021-02-04	1597.44	1667.22	1697.97	1558.06	1172256.64	1921213581.05	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1754	ETH	2021-02-05	1721.48	1597.44	1762.23	1592.92	963997.03	1626954142.52	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1755	ETH	2021-02-06	1679.14	1721.48	1744.33	1648.46	765790.73	1293997066.53	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1758	ETH	2021-02-09	1772.05	1752.87	1824.66	1710.46	894749.11	1573102089.36	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1759	ETH	2021-02-10	1743	1772.05	1838.93	1680.58	959891.91	1691442085.33	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1760	ETH	2021-02-11	1787.69	1743	1818.43	1705.77	589410.57	1043919213.74	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1761	ETH	2021-02-12	1844.84	1787.69	1867.1	1741.17	750882.93	1354431182.3	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1762	ETH	2021-02-13	1817.48	1844.84	1875.55	1765.87	522573.28	950428277.14	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1765	ETH	2021-02-16	1782.83	1779.4	1825.9	1726.66	608093.81	1081268304.83	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1766	ETH	2021-02-17	1851.14	1782.83	1856.88	1734.79	565395.25	1021991301.71	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1767	ETH	2021-02-18	1939.61	1851.14	1950.03	1850.93	624859.46	1193546506.61	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1768	ETH	2021-02-19	1957.47	1939.61	1973.92	1891.32	603867.66	1170439220.78	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1769	ETH	2021-02-20	1915.12	1957.47	2038.52	1819.36	968370.26	1903964736.95	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1770	ETH	2021-02-21	1935.14	1915.12	1975.88	1885.62	413929.05	802733653.42	2021-05-07 19:24:30	2021-05-07 19:24:30	10
355432	ETH	2021-09-11	3266.43	3209.41	3347.75	3201.4	284401.72	931672905.38	2021-09-12 23:03:37	2021-09-12 23:03:37	10
344340	SJCX	2021-08-19	0.00187	0.001789	0.00187	0.00187	0	0	2021-08-20 23:58:21	2021-08-20 23:58:21	11
325778	BCH	2021-07-10	497.36	503.68	501.72	487.31	76816.12	38205613.36	2021-07-11 23:49:12	2021-07-11 23:49:12	8
344314	EOS	2021-08-19	5.255	4.982	5.257	4.815	5437816.26	27105532.11	2021-08-20 23:58:22	2021-08-20 23:58:22	9
325340	FIL	2021-07-09	55.28	53.88	55.51	52.79	117159.75	6387602.76	2021-07-10 23:48:57	2021-07-10 23:48:57	13
339158	DOT	2021-08-08	19.67	20.98	21.2	19.22	1840565.92	37144974.5	2021-08-09 23:55:49	2021-08-09 23:55:49	4
333636	ETH	2021-07-27	2301.98	2228.67	2319.63	2152.97	503449.86	1127164753.79	2021-07-28 23:53:04	2021-07-28 23:53:04	10
339626	ZRX	2021-08-09	0.9562	0.9311	0.9637	0.8914	6290029.07	5937760.94	2021-08-10 23:56:03	2021-08-10 23:56:03	6
350428	ANT	2021-09-01	5.28	5.107	5.558	5.128	630829.14	3330528.73	2021-09-02 23:01:21	2021-09-02 23:01:21	14
371150	BTC	2021-10-14	57359.21	57369	58514.76	56854.38	28061.61	1617497364.76	2021-10-15 23:11:16	2021-10-15 23:11:16	7
371664	OCN	2021-10-15	0.0006168	0.0005736	0.0006168	0.0006168	19507366.4	12033.11	2021-10-16 23:11:30	2021-10-16 23:11:30	2
371214	XTZ	2021-10-14	7.137	7.3	7.41	7.047	5168836.75	37324953.62	2021-10-15 23:11:16	2021-10-15 23:11:16	5
383040	OCN	2021-11-06	0.0006153	0.0006102	0.0006153	0.0006153	54177215.3	33335.11	2021-11-07 23:20:30	2021-11-07 23:20:30	2
376246	ZRX	2021-10-24	0.9948	1.014	1.022	0.973	4817505.35	4791573.09	2021-10-25 23:13:34	2021-10-25 23:13:34	6
383034	XTZ	2021-11-06	6.443	6.477	6.824	6.241	3965191.11	25789334.84	2021-11-07 23:16:31	2021-11-07 23:16:31	5
383568	ANT	2021-11-07	4.964	4.941	5.143	4.959	133837.7	664312.92	2021-11-08 23:16:45	2021-11-08 23:16:45	14
387678	OCN	2021-11-15	0.0006361	0.0006551	0.001272	0.0006361	341247331.87	217081.28	2021-11-16 04:23:59	2021-11-16 04:23:59	2
388178	SJCX	2021-11-16	0.002471	0.002545	0.002545	0.002457	0	0	2021-11-16 03:18:23	2021-11-16 03:18:23	11
422	DOT	2020-06-16	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
521	DOT	2020-09-23	4.003	4.171	4.323	3.946	819417.8	3367696.48	2021-05-09 17:34:36	2021-05-09 17:34:36	4
35	XTZ	2020-05-26	2.693	2.735	2.759	2.653	1943928.95	5253219.27	2021-05-07 19:24:31	2021-05-07 19:24:31	5
49	XTZ	2020-06-09	2.908	2.948	2.962	2.872	1902443.1	5524271.47	2021-05-07 19:24:31	2021-05-07 19:24:31	5
273	XTZ	2021-01-19	2.875	3.032	3.219	2.873	9448377.92	28722544.76	2021-05-07 19:24:31	2021-05-07 19:24:31	5
522	DOT	2020-09-24	4.391	4.003	4.473	3.969	721979.45	3074665.14	2021-05-09 17:34:36	2021-05-09 17:34:36	4
523	DOT	2020-09-25	4.424	4.391	4.536	4.249	698420.37	3075035.43	2021-05-09 17:34:36	2021-05-09 17:34:36	4
1778	ETH	2021-03-01	1571.49	1422.58	1572.92	1413.28	800017.26	1205752163.07	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1779	ETH	2021-03-02	1488.67	1571.49	1604.11	1456.73	590267.55	906296855.1	2021-05-07 19:24:30	2021-05-07 19:24:30	10
274	XTZ	2021-01-20	2.912	2.875	2.949	2.645	8189931.73	23004638.05	2021-05-07 19:24:31	2021-05-07 19:24:31	5
543	DOT	2020-10-15	4.097	4.197	4.197	4.022	415421.2	1712300.54	2021-05-09 17:34:36	2021-05-09 17:34:36	4
1780	ETH	2021-03-03	1568.65	1488.67	1657.11	1477.82	577883.81	917252731.88	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1781	ETH	2021-03-04	1538.37	1568.65	1625.02	1505.61	657432.27	1023294046.59	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1782	ETH	2021-03-05	1529.75	1538.37	1549.35	1443.48	708293.26	1053353462.19	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1099	SJCX	2020-04-22	0.0004281	0.0004113	0.0004281	0.0004281	0	0	2021-04-22 21:03:20	2021-04-22 21:03:20	11
1783	ETH	2021-03-06	1651.48	1529.75	1670.56	1514.5	730694.87	1162129783.44	2021-05-07 19:24:30	2021-05-07 19:24:30	10
544	DOT	2020-10-16	3.914	4.097	4.152	3.824	410940.2	1621933.09	2021-05-09 17:34:36	2021-05-09 17:34:36	4
298692	ZRX	2021-05-15	1.554	1.706	1.725	1.536	16827199.29	27140874.72	2021-05-16 23:36:17	2021-05-16 23:36:17	6
545	DOT	2020-10-17	3.969	3.914	3.984	3.869	127966.06	504261.26	2021-05-09 17:34:36	2021-05-09 17:34:36	4
548	DOT	2020-10-20	3.914	3.989	4.145	3.869	591625.82	2348018.45	2021-05-09 17:34:36	2021-05-09 17:34:36	4
2427	OCN	2020-12-08	0.0002774	0.000278	0.000283	0.0002497	172674604.58	47901.66	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2428	OCN	2020-12-09	0.0002695	0.0002774	0.0003097	0.000258	191319995.37	51563.95	2021-05-09 17:34:37	2021-05-09 17:34:37	2
298676	EOS	2021-05-15	10.24	11.17	11.94	10.13	19344779.74	209569985.05	2021-05-16 23:36:17	2021-05-16 23:36:17	9
314032	DOT	2021-06-15	23.97	25.87	25.99	23.56	1265222.93	30967576.46	2021-06-16 22:43:28	2021-06-16 22:43:28	4
325784	ETH	2021-07-10	2110.47	2145.67	2190.77	2075.55	254162.69	539204127.95	2021-07-11 23:49:11	2021-07-11 23:49:11	10
325388	ATOM	2021-07-09	13.17	11.88	13.67	11.43	2055436.62	26287232.07	2021-07-10 23:48:57	2021-07-10 23:48:57	3
330882	DOT	2021-07-21	12.32	10.97	12.85	10.68	3556310.42	42779524.24	2021-07-22 23:51:41	2021-07-22 23:51:41	4
2429	OCN	2020-12-10	0.0002624	0.0002695	0.000268	0.0002513	199697166.59	52406.37	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2430	OCN	2020-12-11	0.0002612	0.0002624	0.0002612	0.0002503	201089282.11	52521.95	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2431	OCN	2020-12-12	0.0002614	0.0002612	0.0002898	0.0002614	207802969.12	54319.61	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2432	OCN	2020-12-13	0.0002895	0.0002614	0.0003013	0.0002658	193417969.65	55985.37	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2491	OCN	2021-02-10	0.0009587	0.0007797	0.001203	0.0007495	174456962.22	167243.17	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2492	OCN	2021-02-11	0.0008938	0.0009587	0.001073	0.0008402	126671547.99	113224.73	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2511	OCN	2021-03-02	0.0005657	0.0006443	0.0006252	0.0005508	60029169.37	33958.18	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2512	OCN	2021-03-03	0.0005647	0.0005657	0.0006118	0.000549	66610079.39	37615.64	2021-05-09 17:34:37	2021-05-09 17:34:37	2
366282	EOS	2021-10-04	4.597	4.638	4.735	4.341	7850127.97	35609808.01	2021-10-05 23:08:58	2021-10-05 23:08:58	9
2513	OCN	2021-03-04	0.0006923	0.0005647	0.0008307	0.0005384	143172904.17	99113.81	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2514	OCN	2021-03-05	0.0006119	0.0006923	0.0007496	0.0005966	102572520.98	62764.13	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2515	OCN	2021-03-06	0.000611	0.0006119	0.0006606	0.000611	37781471.24	23086.28	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2516	OCN	2021-03-07	0.0006215	0.000611	0.000656	0.0006215	36089022.14	22428.56	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2517	OCN	2021-03-08	0.0006604	0.0006215	0.0006971	0.0006421	63522502.78	41951.07	2021-05-09 17:34:37	2021-05-09 17:34:37	2
339606	BTC	2021-08-09	46292.61	43827.75	46476.01	42818.07	49016.22	2219734084.88	2021-08-10 23:56:02	2021-08-10 23:56:02	7
333638	ZRX	2021-07-27	0.7106	0.6754	0.7555	0.6571	9141972.34	6523178.82	2021-07-28 21:53:03	2021-07-28 21:53:03	6
355494	OCN	2021-09-11	0.0009473	0.0009307	0.001111	0.0008819	17172988.44	16267.37	2021-09-12 23:03:37	2021-09-12 23:03:37	2
304038	FIL	2021-05-25	72.04	74.56	79.37	66.19	1587219.08	112301193.3	2021-05-26 23:38:33	2021-05-26 23:38:33	13
304034	SJCX	2021-05-25	0.001535	0.001554	0.001535	0.001535	0	0	2021-05-26 23:38:34	2021-05-26 23:38:34	11
344316	ANT	2021-08-19	4.812	4.677	4.961	4.709	345931.14	1664536.7	2021-08-20 23:58:21	2021-08-20 23:58:21	14
319702	EOS	2021-06-27	3.773	3.571	3.779	3.491	2510119.05	9049019.97	2021-06-28 23:46:13	2021-06-28 23:46:13	9
308838	ETH	2021-06-04	2691.17	2856.01	2859.2	2554.63	697975.45	1870054033.42	2021-06-05 23:40:50	2021-06-05 23:40:50	10
339160	ZRX	2021-08-08	0.9311	0.9329	1.048	0.9129	14646449.26	14356615.36	2021-08-09 23:55:48	2021-08-09 23:55:48	6
360620	ZRX	2021-09-22	0.971	0.8438	0.9723	0.825	10429363.81	9500976.4	2021-09-23 23:06:10	2021-09-23 23:06:10	6
350430	FIL	2021-09-01	78.65	75.95	78.79	75.32	511968.43	39491174.01	2021-09-02 23:01:20	2021-09-02 23:01:20	13
349944	BCH	2021-08-31	636.65	632.06	639.95	628.16	104742.15	66684090.84	2021-09-01 23:01:06	2021-09-01 23:01:06	8
360610	ANT	2021-09-22	5.159	4.531	5.251	4.767	623253.31	3215623.2	2021-09-23 23:06:10	2021-09-23 23:06:10	14
383036	ANT	2021-11-06	4.941	5.041	5.086	4.884	138897.64	686270.98	2021-11-07 21:16:30	2021-11-07 21:16:30	14
376254	OCN	2021-10-24	0.0006086	0.0006131	0.0006086	0.0006086	25667654.22	15622.25	2021-10-25 23:13:43	2021-10-25 23:13:43	2
371668	DOT	2021-10-15	43.31	40.74	44.19	39.47	6702887.87	278549059.07	2021-10-16 23:11:30	2021-10-16 23:11:30	4
366764	OCN	2021-10-05	0.000515	0.0004928	0.000515	0.000515	39314610.82	20248.7	2021-10-06 23:09:16	2021-10-06 23:09:16	2
371152	ATOM	2021-10-14	33.82	34.61	35.69	33.48	2216832.03	76635911.37	2021-10-15 23:11:16	2021-10-15 23:11:16	3
383574	BTC	2021-11-07	63302.78	61529.76	63309.57	61406.56	14937.9	929571983.79	2021-11-08 23:16:44	2021-11-08 23:16:44	7
388160	ANT	2021-11-16	5.245	5.83	5.83	5.242	9580.27	52079.52	2021-11-16 04:18:24	2021-11-16 04:18:24	14
387670	FIL	2021-11-15	60.83	62.57	63.42	60.25	217959.71	13481684.09	2021-11-16 04:18:24	2021-11-16 04:18:24	13
2442	OCN	2020-12-23	0.0002575	0.0002868	0.0002751	0.0002517	209021834.81	53825.21	2021-05-09 17:34:37	2021-05-09 17:34:37	2
50	XTZ	2020-06-10	2.89	2.908	2.931	2.855	2061317.46	5963433.13	2021-05-07 19:24:31	2021-05-07 19:24:31	5
1795	ETH	2021-03-18	1776.16	1823.03	1849.5	1759.7	406758.7	735764945.49	2021-05-07 19:24:30	2021-05-07 19:24:30	10
524	DOT	2020-09-26	4.334	4.424	4.468	4.225	441138.05	1923990.9	2021-05-09 17:34:36	2021-05-09 17:34:36	4
53	XTZ	2020-06-13	2.698	2.669	2.723	2.642	1238392.89	3321579.64	2021-05-07 19:24:31	2021-05-07 19:24:31	5
525	DOT	2020-09-27	4.301	4.334	4.365	4.127	358805.19	1524178.92	2021-05-09 17:34:36	2021-05-09 17:34:36	4
526	DOT	2020-09-28	4.405	4.301	4.585	4.256	790501.68	3497885.3	2021-05-09 17:34:36	2021-05-09 17:34:36	4
527	DOT	2020-09-29	4.495	4.405	4.6	4.354	517520.28	2328779.09	2021-05-09 17:34:36	2021-05-09 17:34:36	4
528	DOT	2020-09-30	4.35	4.495	4.495	4.25	417783.66	1818566.07	2021-05-09 17:34:36	2021-05-09 17:34:36	4
2443	OCN	2020-12-24	0.0002633	0.0002575	0.0002817	0.0002572	184239051.94	48509.7	2021-05-09 17:34:37	2021-05-09 17:34:37	2
529	DOT	2020-10-01	4.35	4.35	4.582	4.239	745297.28	3273188.11	2021-05-09 17:34:36	2021-05-09 17:34:36	4
530	DOT	2020-10-02	4.121	4.35	4.359	3.907	986676.7	4026892.62	2021-05-09 17:34:36	2021-05-09 17:34:36	4
531	DOT	2020-10-03	4.07	4.121	4.13	4.036	294634.39	1205043.56	2021-05-09 17:34:36	2021-05-09 17:34:36	4
1833	ZRX	2020-04-24	0.1858	0.1759	0.1899	0.1754	6782352.35	1240856.23	2021-04-24 20:28:41	2021-04-24 20:28:41	6
1834	ZRX	2020-04-25	0.1844	0.1858	0.1892	0.1807	3868087.91	715532.35	2021-04-24 20:28:41	2021-04-24 20:28:41	6
532	DOT	2020-10-04	4.18	4.07	4.194	4.021	519446.08	2133813.97	2021-05-09 17:34:36	2021-05-09 17:34:36	4
533	DOT	2020-10-05	4.166	4.18	4.242	4.111	343983.72	1438116.78	2021-05-09 17:34:36	2021-05-09 17:34:36	4
551	DOT	2020-10-23	4.266	4.27	4.478	4.192	444682.58	1922405.15	2021-05-09 17:34:36	2021-05-09 17:34:36	4
552	DOT	2020-10-24	4.36	4.266	4.432	4.24	315063.3	1373024.22	2021-05-09 17:34:36	2021-05-09 17:34:36	4
553	DOT	2020-10-25	4.332	4.36	4.446	4.261	305267.03	1327153.41	2021-05-09 17:34:36	2021-05-09 17:34:36	4
554	DOT	2020-10-26	4.707	4.332	4.749	4.293	906323.73	4136629.65	2021-05-09 17:34:36	2021-05-09 17:34:36	4
564	DOT	2020-11-05	4.23	4.102	4.301	4.027	216471.15	911823.6	2021-05-09 17:34:36	2021-05-09 17:34:36	4
567	DOT	2020-11-08	4.375	4.239	4.431	4.143	262628.33	1135970.73	2021-05-09 17:34:36	2021-05-09 17:34:36	4
568	DOT	2020-11-09	4.34	4.375	4.456	4.253	157181.07	684420.04	2021-05-09 17:34:36	2021-05-09 17:34:36	4
569	DOT	2020-11-10	4.42	4.34	4.499	4.307	218222.85	961537.84	2021-05-09 17:34:36	2021-05-09 17:34:36	4
570	DOT	2020-11-11	4.454	4.42	4.627	4.42	560487.09	2524316.24	2021-05-09 17:34:36	2021-05-09 17:34:36	4
2444	OCN	2020-12-25	0.0002695	0.0002633	0.0002758	0.0002633	198919652.25	53616.19	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2445	OCN	2020-12-26	0.0002608	0.0002695	0.0002735	0.0002481	209720905.17	54692.84	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2446	OCN	2020-12-27	0.0002531	0.0002608	0.0002873	0.0002462	143676329.99	36360.54	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2447	OCN	2020-12-28	0.0002481	0.0002531	0.0002699	0.0002481	174522828.49	43292.24	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2448	OCN	2020-12-29	0.0002341	0.0002481	0.0002634	0.0002268	181180235.86	42413.57	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2452	OCN	2021-01-02	0.0002635	0.0002411	0.0002712	0.0002402	236267087.39	62248.34	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2453	OCN	2021-01-03	0.0002545	0.0002635	0.0003621	0.0002447	268526234.95	68329.02	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2454	OCN	2021-01-04	0.0002504	0.0002545	0.0002921	0.0002399	188359121.01	47157.29	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2455	OCN	2021-01-05	0.0002537	0.0002504	0.0002758	0.0002427	276169799.8	70073.59	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2456	OCN	2021-01-06	0.0002784	0.0002537	0.0002905	0.0002663	173624324.45	48343.21	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2551	OCN	2021-04-11	0.001634	0.001515	0.001677	0.001484	25626691.45	41884.53	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2561	OCN	2021-04-21	0.002145	0.002193	0.002381	0.002122	31807053.4	68239.07	2021-05-09 17:34:37	2021-05-09 17:34:37	2
304040	EOS	2021-05-25	5.7	5.651	5.997	5.072	12435065.88	69459337.71	2021-05-26 23:38:33	2021-05-26 23:38:33	9
2562	OCN	2021-04-22	0.001993	0.002145	0.002281	0.001969	40244411.99	80211.96	2021-05-09 17:34:37	2021-05-09 17:34:37	2
7746	OCN	2021-04-23	0.002085	0.001993	0.002227	0.001635	42840744.82	89336.22	2021-05-09 17:34:37	2021-05-09 17:34:37	2
308874	BCH	2021-06-04	671.38	718.51	719.54	643.74	95794.85	64323560.2	2021-06-05 22:40:50	2021-06-05 22:40:50	8
308840	BTC	2021-06-04	36861.5	39229.66	39273.49	35617.03	49661.48	1837944242.33	2021-06-05 23:40:50	2021-06-05 23:40:50	7
298694	ETH	2021-05-15	3644.04	4080.13	4133.56	3634.39	690233.62	2665190551.47	2021-05-16 23:36:16	2021-05-16 23:36:16	10
298678	OCN	2021-05-15	0.001239	0.001346	0.001312	0.001203	60098674.53	74460.67	2021-05-16 23:36:17	2021-05-16 23:36:17	2
319734	BTC	2021-06-27	34713.81	32307.35	34754.5	32031.15	60403.96	2002954688.79	2021-06-28 23:46:13	2021-06-28 23:46:13	7
67498	OCN	2021-04-24	0.001995	0.002085	0.002327	0.001818	44629627.68	89031.82	2021-05-09 17:34:37	2021-05-09 17:34:37	2
319704	ANT	2021-06-27	3.704	4.122	6.193	3.506	1993356.04	7383318.07	2021-06-28 23:46:13	2021-06-28 23:46:13	14
330884	OCN	2021-07-21	0.0008379	0.0007861	0.0009576	0.000798	45537357.62	38155.37	2021-07-22 23:51:41	2021-07-22 23:51:41	2
304036	DOT	2021-05-25	22.18	23.25	24.21	19.67	2345633.53	50705264.54	2021-05-26 23:38:33	2021-05-26 23:38:33	4
571	DOT	2020-11-12	4.409	4.454	4.472	4.326	402547.95	1764690.59	2021-05-09 17:34:36	2021-05-09 17:34:36	4
572	DOT	2020-11-13	4.545	4.409	4.59	4.383	332721.08	1491012.51	2021-05-09 17:34:36	2021-05-09 17:34:36	4
573	DOT	2020-11-14	4.47	4.545	4.547	4.364	182320.08	813839.68	2021-05-09 17:34:36	2021-05-09 17:34:36	4
339620	ATOM	2021-08-09	13.63	13.14	14.02	12.67	840480.01	11475351.07	2021-08-10 23:56:02	2021-08-10 23:56:02	3
314472	FIL	2021-06-16	69.64	72.6	72.6	68.6	358909.95	25182710.84	2021-06-17 23:43:42	2021-06-17 23:43:42	13
325392	DOT	2021-07-09	15.68	15.32	15.89	14.84	1120562.16	17288062.56	2021-07-10 23:48:57	2021-07-10 23:48:57	4
325786	XTZ	2021-07-10	2.784	2.752	2.836	2.696	2117587.83	5838568.88	2021-07-11 23:49:11	2021-07-11 23:49:11	5
333672	FIL	2021-07-27	49.59	49.05	49.9	47.32	339724.17	16506853.17	2021-07-28 23:53:04	2021-07-28 23:53:04	13
333640	ANT	2021-07-27	4.23	3.626	4.676	3.778	1363236.97	5766622.57	2021-07-28 23:53:04	2021-07-28 23:53:04	14
339162	OCN	2021-08-08	0.001205	0.001297	0.001386	0.001145	36208708.24	43649.6	2021-08-09 23:55:49	2021-08-09 23:55:49	2
344328	ZRX	2021-08-19	1.027	0.9657	1.027	0.9278	5768156.77	5612168.17	2021-08-20 23:58:22	2021-08-20 23:58:22	6
349946	DOT	2021-08-31	31.36	26.03	31.93	25.68	8426475.44	244674060.09	2021-09-01 23:01:07	2021-09-01 23:01:07	4
350456	EOS	2021-09-01	5.313	5.045	5.333	4.909	6513066.29	33508868.64	2021-09-02 23:01:20	2021-09-02 23:01:20	9
355510	XTZ	2021-09-11	6.118	6.182	6.946	6.05	26159211.72	170008917.37	2021-09-12 22:03:37	2021-09-12 22:03:37	5
361092	ANT	2021-09-23	5.194	5.159	5.517	5.091	440469.96	2287898.21	2021-09-24 23:06:24	2021-09-24 23:06:24	14
360622	EOS	2021-09-22	4.304	3.881	4.342	3.81	6322150.48	26175079.58	2021-09-23 23:06:10	2021-09-23 23:06:10	9
366284	XTZ	2021-10-04	8.331	8.698	9.138	8.185	28356057.73	243285655.89	2021-10-05 23:08:58	2021-10-05 23:08:58	5
116	XTZ	2020-08-15	4.072	4.116	4.312	3.91	9238733.66	38054509.36	2021-05-07 19:24:31	2021-05-07 19:24:31	5
117	XTZ	2020-08-16	4.243	4.072	4.388	4.011	8557166.56	36010267.81	2021-05-07 19:24:31	2021-05-07 19:24:31	5
3428	FIL	2020-09-02	43.12	50.06	50.62	41.03	162.38	7001.54	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3380	FIL	2020-07-16	18.82	19.57	19.76	16.22	240.03	4518.23	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3381	FIL	2020-07-17	19.43	18.82	22.06	18.87	91.42	1776.36	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3382	FIL	2020-07-18	20.04	19.43	24.16	18.54	174.54	3498.31	2021-05-07 19:24:30	2021-05-07 19:24:30	13
118	XTZ	2020-08-17	4.039	4.243	4.255	4.021	5427572.96	22461524.71	2021-05-07 19:24:31	2021-05-07 19:24:31	5
3383	FIL	2020-07-19	21.18	20.04	23.13	19.45	103.45	2190.91	2021-05-07 19:24:30	2021-05-07 19:24:30	13
492	DOT	2020-08-25	5.566	4.562	5.775	4.533	172598.24	891296.29	2021-05-09 17:34:36	2021-05-09 17:34:36	4
119	XTZ	2020-08-18	3.841	4.039	4.169	3.74	6615830.4	26009518.83	2021-05-07 19:24:31	2021-05-07 19:24:31	5
120	XTZ	2020-08-19	3.635	3.841	3.931	3.493	7082185.04	26433288.12	2021-05-07 19:24:31	2021-05-07 19:24:31	5
298696	XTZ	2021-05-15	5.789	6.477	6.52	5.747	5339270.3	32452127.64	2021-05-16 23:36:18	2021-05-16 23:36:18	5
304054	XTZ	2021-05-25	3.661	3.535	3.754	3.264	10352585.47	36484504.02	2021-05-26 23:38:33	2021-05-26 23:38:33	5
121	XTZ	2020-08-20	3.859	3.635	3.94	3.507	7425415.5	28019764.52	2021-05-07 19:24:31	2021-05-07 19:24:31	5
1798	ETH	2021-03-21	1783.94	1805.49	1817.33	1747.94	343447.52	612374090.22	2021-05-07 19:24:30	2021-05-07 19:24:30	10
298680	BTC	2021-05-15	46775.29	49887.96	50710.05	46606.18	53332.47	2591003797.63	2021-05-16 23:36:17	2021-05-16 23:36:17	7
672	DOT	2021-02-21	39.58	38.99	40.54	38.07	1251848.24	48954543.55	2021-05-09 17:34:36	2021-05-09 17:34:36	4
673	DOT	2021-02-22	37.64	39.58	39.75	19.81	3991946.25	140192564.81	2021-05-09 17:34:36	2021-05-09 17:34:36	4
674	DOT	2021-02-23	34.59	37.64	37.76	26.54	4997599.59	161726713.15	2021-05-09 17:34:36	2021-05-09 17:34:36	4
675	DOT	2021-02-24	33.7	34.59	36.88	31.91	2357222.87	81741925.63	2021-05-09 17:34:36	2021-05-09 17:34:36	4
1799	ETH	2021-03-22	1682.05	1783.94	1807.19	1657.58	496567.29	861293326.85	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1800	ETH	2021-03-23	1668.69	1682.05	1721.69	1652.19	392868.19	664606148.51	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1801	ETH	2021-03-24	1583.24	1668.69	1740.3	1546.93	773811.51	1282635340.24	2021-05-07 19:24:30	2021-05-07 19:24:30	10
676	DOT	2021-02-25	31.19	33.7	35.27	30.9	1874336.12	62631991.56	2021-05-09 17:34:36	2021-05-09 17:34:36	4
3384	FIL	2020-07-20	21.66	21.18	22.82	20.38	40.34	873.58	2021-05-07 19:24:30	2021-05-07 19:24:30	13
67502	SJCX	2021-04-24	0.002005	0.002047	0.002005	0.002005	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1802	ETH	2021-03-25	1586.98	1583.24	1621.59	1549.08	532202.27	845403275.47	2021-05-07 19:24:30	2021-05-07 19:24:30	10
2483	OCN	2021-02-02	0.0003028	0.0002887	0.0003331	0.0003028	84459829.23	25572.75	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2484	OCN	2021-02-03	0.0003001	0.0003028	0.0003334	0.0003001	193380780.96	58033.5	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2485	OCN	2021-02-04	0.0003035	0.0003001	0.0003035	0.0002875	289506756	87869.24	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2487	OCN	2021-02-06	0.0003694	0.0003443	0.0003862	0.0003358	291837760.8	107808.02	2021-05-09 17:34:37	2021-05-09 17:34:37	2
1803	ETH	2021-03-26	1699.89	1586.98	1700.19	1586.8	398023.77	653006855.68	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1804	ETH	2021-03-27	1713.94	1699.89	1732.36	1667.18	240514.86	409407275.39	2021-05-07 19:24:30	2021-05-07 19:24:30	10
2488	OCN	2021-02-07	0.0004682	0.0003694	0.0004844	0.0003552	396085994.7	185465.52	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2493	OCN	2021-02-12	0.000904	0.0008938	0.001015	0.0008486	127757172.43	115488.86	2021-05-09 17:34:37	2021-05-09 17:34:37	2
122	XTZ	2020-08-21	3.39	3.859	3.916	3.335	10159136.49	36704854.56	2021-05-07 19:24:31	2021-05-07 19:24:31	5
124	XTZ	2020-08-23	3.517	3.579	3.623	3.365	3820635.25	13380476.3	2021-05-07 19:24:31	2021-05-07 19:24:31	5
3385	FIL	2020-07-21	20.83	21.66	22.2	19.07	118.53	2469.37	2021-05-07 19:24:30	2021-05-07 19:24:30	13
677	DOT	2021-02-26	31.44	31.19	33.58	28.01	3132791.78	95855334.92	2021-05-09 17:34:36	2021-05-09 17:34:36	4
2494	OCN	2021-02-13	0.0009087	0.000904	0.0009451	0.0008724	119606484.08	108691.2	2021-05-09 17:34:37	2021-05-09 17:34:37	2
3386	FIL	2020-07-22	20.7	20.83	22.59	19.75	81.74	1691.68	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3429	FIL	2020-09-03	39.94	43.12	41.19	38.32	83.51	3335	2021-05-07 19:24:30	2021-05-07 19:24:30	13
1805	ETH	2021-03-28	1686.74	1713.94	1725.59	1662.16	203653.93	345610376.43	2021-05-07 19:24:30	2021-05-07 19:24:30	10
700	DOT	2021-03-21	36.7	37.24	37.84	36.41	2732927.98	100290307.33	2021-05-09 17:34:36	2021-05-09 17:34:36	4
2495	OCN	2021-02-14	0.0008474	0.0009087	0.0009015	0.0007933	136651960.7	115797.67	2021-05-09 17:34:37	2021-05-09 17:34:37	2
308872	SJCX	2021-06-04	0.001474	0.001569	0.001474	0.001474	0	0	2021-06-05 21:40:50	2021-06-05 21:40:50	11
2496	OCN	2021-02-15	0.0007473	0.0008474	0.0008719	0.0006406	120523949.38	90073.33	2021-05-09 17:34:37	2021-05-09 17:34:37	2
1806	ETH	2021-03-29	1816.48	1686.74	1840.88	1676.68	485643.56	861718830.25	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1807	ETH	2021-03-30	1841.4	1816.48	1859.58	1786.81	321661.61	588402836.48	2021-05-07 19:24:30	2021-05-07 19:24:30	10
2497	OCN	2021-02-16	0.0007666	0.0007473	0.0008201	0.000731	139048563.94	106596.98	2021-05-09 17:34:37	2021-05-09 17:34:37	2
3430	FIL	2020-09-04	43.92	39.94	43.94	41.07	15.51	681.21	2021-05-07 19:24:30	2021-05-07 19:24:30	13
2498	OCN	2021-02-17	0.000759	0.0007666	0.0009071	0.0007405	170605241.34	129483.82	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2499	OCN	2021-02-18	0.0007758	0.000759	0.000834	0.0007758	132153095.75	102530.19	2021-05-09 17:34:37	2021-05-09 17:34:37	2
3431	FIL	2020-09-05	38.29	43.92	42.66	38.29	56.13	2149.36	2021-05-07 19:24:30	2021-05-07 19:24:30	13
314474	OCN	2021-06-16	0.000805	0.000814	0.0008287	0.0007577	33406933.05	26893.18	2021-06-17 21:43:41	2021-06-17 21:43:41	2
308842	OCN	2021-06-04	0.0008343	0.0008568	0.000915	0.0008074	41684926.56	34776.18	2021-06-05 18:40:48	2021-06-05 18:40:48	2
319706	XTZ	2021-06-27	2.623	2.543	2.628	2.457	2153377.32	5459482.54	2021-06-28 23:46:13	2021-06-28 23:46:13	5
3458	FIL	2020-10-02	40.58	40.9	41.15	39.88	33.46	1357.89	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3459	FIL	2020-10-03	39.34	40.58	41.15	38.73	72.14	2837.84	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3460	FIL	2020-10-04	34.86	39.34	39.8	34.58	252.93	8816.02	2021-05-07 19:24:30	2021-05-07 19:24:30	13
2500	OCN	2021-02-19	0.0007047	0.0007758	0.0008026	0.0006851	91407123.23	64413.61	2021-05-09 17:34:37	2021-05-09 17:34:37	2
325774	OCN	2021-07-10	0.0006542	0.0006437	0.0007176	0.000612	16270539.98	10644.93	2021-07-11 23:49:10	2021-07-11 23:49:10	2
330946	BCH	2021-07-21	430.33	398.79	435.34	392.61	52296.26	21858688.38	2021-07-22 23:51:41	2021-07-22 23:51:41	8
330886	XTZ	2021-07-21	2.396	2.154	2.436	2.104	3318340.26	7734370.37	2021-07-22 23:51:41	2021-07-22 23:51:41	5
333642	DOT	2021-07-27	14.39	13.93	14.54	13.38	3414696.15	47670207.43	2021-07-28 23:53:04	2021-07-28 23:53:04	4
339164	EOS	2021-08-08	4.296	4.596	4.665	4.233	2796877.2	12363110.02	2021-08-09 23:55:49	2021-08-09 23:55:49	9
344334	XTZ	2021-08-19	3.638	3.347	3.647	3.289	5521705.53	19047434.33	2021-08-20 22:58:21	2021-08-20 22:58:21	5
194	XTZ	2020-11-01	1.996	1.979	2.011	1.935	1469134.78	2897142.53	2021-05-07 19:24:31	2021-05-07 19:24:31	5
195	XTZ	2020-11-02	1.9	1.996	2.07	1.88	1633931.96	3198225.55	2021-05-07 19:24:31	2021-05-07 19:24:31	5
196	XTZ	2020-11-03	1.87	1.9	1.914	1.812	1271848.03	2369754.68	2021-05-07 19:24:31	2021-05-07 19:24:31	5
197	XTZ	2020-11-04	1.874	1.87	1.909	1.785	1344829.82	2487691.07	2021-05-07 19:24:31	2021-05-07 19:24:31	5
198	XTZ	2020-11-05	1.885	1.874	1.977	1.821	1773609.96	3359297.88	2021-05-07 19:24:31	2021-05-07 19:24:31	5
204	XTZ	2020-11-11	2.125	2.154	2.2	2.114	2849641.45	6140014.21	2021-05-07 19:24:31	2021-05-07 19:24:31	5
205	XTZ	2020-11-12	2.075	2.125	2.155	2.046	2429984.48	5079152.53	2021-05-07 19:24:31	2021-05-07 19:24:31	5
206	XTZ	2020-11-13	2.154	2.075	2.156	2.067	2371504.68	5027107.26	2021-05-07 19:24:31	2021-05-07 19:24:31	5
207	XTZ	2020-11-14	2.102	2.154	2.164	2.055	1698744.42	3565289.07	2021-05-07 19:24:31	2021-05-07 19:24:31	5
208	XTZ	2020-11-15	2.016	2.102	2.112	1.983	2229059.45	4544439.53	2021-05-07 19:24:31	2021-05-07 19:24:31	5
209	XTZ	2020-11-16	2.083	2.016	2.1	1.998	2415889.73	4965545.67	2021-05-07 19:24:31	2021-05-07 19:24:31	5
210	XTZ	2020-11-17	2.147	2.083	2.157	2.074	3086639.54	6559251.27	2021-05-07 19:24:31	2021-05-07 19:24:31	5
211	XTZ	2020-11-18	2.087	2.147	2.19	2.015	3860082.12	8081449.18	2021-05-07 19:24:31	2021-05-07 19:24:31	5
212	XTZ	2020-11-19	2.078	2.087	2.144	2.022	3203332.04	6685352.36	2021-05-07 19:24:31	2021-05-07 19:24:31	5
213	XTZ	2020-11-20	2.107	2.078	2.152	2.065	4536591.69	9545828.1	2021-05-07 19:24:31	2021-05-07 19:24:31	5
220	XTZ	2020-11-27	2.252	2.248	2.339	2.157	4696809.63	10565467.6	2021-05-07 19:24:31	2021-05-07 19:24:31	5
221	XTZ	2020-11-28	2.324	2.252	2.432	2.208	3851718.73	9009821.14	2021-05-07 19:24:31	2021-05-07 19:24:31	5
222	XTZ	2020-11-29	2.364	2.324	2.439	2.276	2915556.32	6871470.95	2021-05-07 19:24:31	2021-05-07 19:24:31	5
223	XTZ	2020-11-30	2.489	2.364	2.56	2.334	4540836.25	11119331.72	2021-05-07 19:24:31	2021-05-07 19:24:31	5
224	XTZ	2020-12-01	2.327	2.489	2.553	2.214	5788131.73	13765195.4	2021-05-07 19:24:31	2021-05-07 19:24:31	5
225	XTZ	2020-12-02	2.391	2.327	2.416	2.291	1942908.97	4595162.71	2021-05-07 19:24:31	2021-05-07 19:24:31	5
308844	ATOM	2021-06-04	15.08	16.67	17.12	14.05	1767426.77	26940766.51	2021-06-05 23:40:50	2021-06-05 23:40:50	3
349950	OCN	2021-08-31	0.001065	0.001065	0.001134	0.001031	1855041.93	1975.44	2021-09-01 23:01:06	2021-09-01 23:01:06	2
319708	DOT	2021-06-27	15	14.52	15.01	14.07	1050374.32	15272557.88	2021-06-28 23:46:14	2021-06-28 23:46:14	4
356380	ANT	2021-09-13	5.575	6.033	5.93	5.462	365408.49	2037101.7	2021-09-14 23:04:05	2021-09-14 23:04:05	14
314476	BTC	2021-06-16	38345.41	40161.86	40487.98	38122.04	48107.62	1883613058.48	2021-06-17 23:43:42	2021-06-17 23:43:42	7
349948	EOS	2021-08-31	5.045	4.82	5.099	4.757	6552140.73	32468763.79	2021-09-01 23:01:07	2021-09-01 23:01:07	9
325782	ATOM	2021-07-10	14.42	13.17	14.5	12.97	1445775.69	19804316.88	2021-07-11 23:49:11	2021-07-11 23:49:11	3
376256	ANT	2021-10-24	4.53	4.731	4.774	4.459	254379.11	1152356.39	2021-10-25 23:13:34	2021-10-25 23:13:34	14
339166	BCH	2021-08-08	556.17	584.05	578.09	554.86	89867.26	49981846.72	2021-08-09 23:55:49	2021-08-09 23:55:49	8
344338	OCN	2021-08-19	0.001115	0.001055	0.001178	0.001083	2299845.29	2563.54	2021-08-20 23:58:21	2021-08-20 23:58:21	2
330888	BTC	2021-07-21	32139.48	29795.55	32814.13	29513.88	48925.57	1538668590.41	2021-07-22 23:51:41	2021-07-22 23:51:41	7
361084	EOS	2021-09-23	4.377	4.304	4.39	4.196	4240261.77	18254818.87	2021-09-24 23:06:24	2021-09-24 23:06:24	9
333684	BCH	2021-07-27	502.29	481.98	503.89	468.27	70558.51	34455107.86	2021-07-28 21:53:03	2021-07-28 21:53:03	8
360654	SJCX	2021-09-22	0.001743	0.001628	0.001743	0.001743	0	0	2021-09-23 23:06:10	2021-09-23 23:06:10	11
333644	OCN	2021-07-27	0.0008517	0.0008692	0.0009438	0.0008517	60913281.81	51881.83	2021-07-28 23:53:04	2021-07-28 23:53:04	2
304516	EOS	2021-05-26	6.437	5.7	6.506	5.556	8513778.08	52025451.74	2021-05-27 23:38:48	2021-05-27 23:38:48	9
355914	ETH	2021-09-12	3405.32	3266.43	3471.17	3232.65	277383.04	936318554.79	2021-09-13 23:03:51	2021-09-13 23:03:51	10
298682	ANT	2021-05-15	7.704	8.476	8.275	7.629	503082.79	3875694.61	2021-05-16 23:36:17	2021-05-16 23:36:17	14
366286	BTC	2021-10-04	49276.91	48234.05	49501.21	46944.28	34394	1664027525.19	2021-10-05 23:08:58	2021-10-05 23:08:58	7
371154	DOT	2021-10-14	40.74	41.69	42.48	39.33	5858068	239662297.04	2021-10-15 23:11:16	2021-10-15 23:11:16	4
387694	XTZ	2021-11-15	5.72	5.826	5.962	5.679	2574224.96	14984825.86	2021-11-16 04:18:24	2021-11-16 04:18:24	5
339608	DOT	2021-08-09	20.58	19.67	21.27	18.74	2746861.76	56241596.5	2021-08-10 23:56:03	2021-08-10 23:56:03	4
366770	ETH	2021-10-05	3516.09	3384.5	3546.36	3366.32	297318.27	1026457702.21	2021-10-06 23:09:11	2021-10-06 23:09:11	10
350418	BCH	2021-09-01	656.04	636.98	657.13	626.08	61262.83	39345881.58	2021-09-02 23:01:21	2021-09-02 23:01:21	8
383038	SJCX	2021-11-06	0.002461	0.002441	0.002461	0.002461	0	0	2021-11-07 23:16:31	2021-11-07 23:16:31	11
371666	BTC	2021-10-15	61684.96	57359.21	62889.98	56885.66	62053.36	3737889743.83	2021-10-16 23:11:30	2021-10-16 23:11:30	7
1839	ZRX	2020-04-30	0.1985	0.2137	0.2205	0.1947	7419153.82	1540231.31	2021-04-30 16:57:54	2021-04-30 16:57:54	6
2246	OCN	2020-06-10	0.0003547	0.0003318	0.0003968	0.0003348	66433269.72	23560.84	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2247	OCN	2020-06-11	0.0003016	0.0003547	0.0003338	0.0003016	23711170	7150.7	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2264	OCN	2020-06-28	0.000297	0.0003025	0.0003105	0.000297	8678812.69	2577.49	2021-05-09 17:34:37	2021-05-09 17:34:37	2
1840	ZRX	2020-05-01	0.2137	0.1985	0.2142	0.1984	4108153.24	852723.7	2021-05-01 21:17:55	2021-05-01 21:17:55	6
1841	ZRX	2020-05-02	0.2145	0.2137	0.2183	0.2099	4259304.45	913175.06	2021-05-01 21:17:55	2021-05-01 21:17:55	6
3461	FIL	2020-10-05	36.48	34.86	38.61	34.97	35.45	1293.1	2021-05-07 19:24:30	2021-05-07 19:24:30	13
1835	ZRX	2020-04-26	0.1992	0.1844	0.2005	0.1841	7660305.87	1480700.98	2021-04-26 23:28:51	2021-04-26 23:28:51	6
3462	FIL	2020-10-06	37.83	36.48	40.14	34.35	63.65	2408.18	2021-05-07 19:24:30	2021-05-07 19:24:30	13
1842	ZRX	2020-05-03	0.2069	0.2145	0.2156	0.203	2970982.64	622884.15	2021-05-03 03:13:20	2021-05-03 03:13:20	6
3463	FIL	2020-10-07	38.17	37.83	38.19	35.97	34.25	1307.17	2021-05-07 19:24:30	2021-05-07 19:24:30	13
2520	OCN	2021-03-11	0.000676	0.0006644	0.0007308	0.0006577	86142672.69	58233.5	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2521	OCN	2021-03-12	0.001308	0.000676	0.00152	0.0006541	225496869.03	294983.68	2021-05-09 17:34:37	2021-05-09 17:34:37	2
1836	ZRX	2020-04-27	0.2067	0.1992	0.219	0.1966	20803424.27	4322768.25	2021-04-27 14:15:28	2021-04-27 14:15:28	6
1837	ZRX	2020-04-28	0.2046	0.2067	0.2086	0.1982	8643466.48	1756333.95	2021-04-27 14:15:28	2021-04-27 14:15:28	6
2522	OCN	2021-03-13	0.001133	0.001308	0.002286	0.000999	166934168.26	189219.25	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2523	OCN	2021-03-14	0.001313	0.001133	0.00135	0.001035	117917477.02	154774.93	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2524	OCN	2021-03-15	0.001131	0.001313	0.001274	0.001023	106192801.49	120076.76	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2525	OCN	2021-03-16	0.001174	0.001131	0.0013	0.001101	96024545.28	112700.74	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2526	OCN	2021-03-17	0.001112	0.001174	0.001276	0.001057	83161260.06	92479.34	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2527	OCN	2021-03-18	0.001119	0.001112	0.001208	0.001048	57521642.73	64365.61	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2528	OCN	2021-03-19	0.001158	0.001119	0.001231	0.001104	65090119.52	75390.4	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2529	OCN	2021-03-20	0.001246	0.001158	0.001499	0.001101	79119568.63	98566.22	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2530	OCN	2021-03-21	0.001267	0.001246	0.001374	0.001177	41110830.57	52070.87	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2531	OCN	2021-03-22	0.001228	0.001267	0.001312	0.001177	63122132.6	77507.45	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2534	OCN	2021-03-25	0.001222	0.001045	0.00127	0.0009839	38403799.14	46928.47	2021-05-09 17:34:37	2021-05-09 17:34:37	2
314478	XTZ	2021-06-16	3.115	3.273	3.327	3.09	2677386.84	8522392.66	2021-06-17 23:43:42	2021-06-17 23:43:42	5
319710	ZRX	2021-06-27	0.6379	0.6005	0.6382	0.5838	3405731.22	2059060.68	2021-06-28 23:46:14	2021-06-28 23:46:14	6
344816	ANT	2021-08-20	5.136	4.812	5.353	5.037	920432.92	4727273.93	2021-08-21 20:58:34	2021-08-21 20:58:34	14
339168	ETH	2021-08-08	3013.75	3162.43	3190.38	2949.65	367430.19	1126677955.27	2021-08-09 23:55:48	2021-08-09 23:55:48	10
325868	FIL	2021-07-10	54.26	55.28	55.97	53.56	109571.07	5979632.95	2021-07-11 21:49:10	2021-07-11 21:49:10	13
304518	BCH	2021-05-26	764.5	719.16	789.35	708.18	187941.86	140373139.87	2021-05-27 23:38:48	2021-05-27 23:38:48	8
2535	OCN	2021-03-26	0.001105	0.001222	0.001394	0.001088	28283544.64	31251.29	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2536	OCN	2021-03-27	0.001148	0.001105	0.001165	0.00108	8284294.43	9513.19	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2537	OCN	2021-03-28	0.001198	0.001148	0.001214	0.001113	17830288.7	21353.29	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2538	OCN	2021-03-29	0.001253	0.001198	0.001381	0.001235	21982473.3	27552.2	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2539	OCN	2021-03-30	0.001234	0.001253	0.001289	0.001215	4849780.18	5983.36	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2540	OCN	2021-03-31	0.001324	0.001234	0.001401	0.001267	12686746.59	16799.35	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2541	OCN	2021-04-01	0.00124	0.001324	0.001397	0.00124	10341707.47	12819.91	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2552	OCN	2021-04-12	0.00248	0.001634	0.002608	0.001625	162833921.72	403801.49	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2553	OCN	2021-04-13	0.002023	0.00248	0.00285	0.002	102641935.95	207626.24	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2554	OCN	2021-04-14	0.001921	0.002023	0.002164	0.001848	37841038.39	72699.05	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2559	OCN	2021-04-19	0.002315	0.002958	0.002899	0.002207	29101695.32	67364.46	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2560	OCN	2021-04-20	0.002193	0.002315	0.003125	0.002169	48597503.68	106550.17	2021-05-09 17:34:37	2021-05-09 17:34:37	2
308846	EOS	2021-06-04	6.02	6.53	6.541	5.787	6508260.11	39562273.74	2021-06-05 23:40:51	2021-06-05 23:40:51	9
308868	ZRX	2021-06-04	1.068	1.189	1.189	1.021	8655456.57	9404077.83	2021-06-05 23:40:51	2021-06-05 23:40:51	6
298684	DOT	2021-05-15	43.55	48.06	49.72	42.84	2830327.08	132964949.2	2021-05-16 23:36:17	2021-05-16 23:36:17	4
330890	ATOM	2021-07-21	10.45	9.462	10.7	9.122	1464893.83	14770986.72	2021-07-22 23:51:41	2021-07-22 23:51:41	3
360658	ATOM	2021-09-22	39.81	30.38	40.17	29.38	8937422.2	316376659.41	2021-09-23 23:06:10	2021-09-23 23:06:10	3
326256	BCH	2021-07-11	497.98	497.36	509.63	495.93	52142	25965924.59	2021-07-12 23:49:24	2021-07-12 23:49:24	8
361088	BTC	2021-09-23	44893.87	43576.15	44994.17	43108.42	32439.53	1431595636.14	2021-09-24 23:06:24	2021-09-24 23:06:24	7
349952	ANT	2021-08-31	5.12	4.677	5.538	4.643	141124.82	712310.51	2021-09-01 23:01:07	2021-09-01 23:01:07	14
333646	SJCX	2021-07-27	0.00158	0.001491	0.00158	0.00158	0	0	2021-07-28 23:53:04	2021-07-28 23:53:04	11
333662	XTZ	2021-07-27	2.861	2.84	2.93	2.744	3866315.36	10885078.93	2021-07-28 23:53:04	2021-07-28 23:53:04	5
344772	FIL	2021-08-20	73.11	70.48	73.69	69.79	319010.87	22849186.71	2021-08-21 23:58:36	2021-08-21 23:58:36	13
345252	XTZ	2021-08-21	3.695	3.729	3.832	3.634	4085290.35	15266246.01	2021-08-22 22:58:49	2021-08-22 22:58:49	5
355916	DOT	2021-09-12	35.82	31.57	36.48	30.67	7398098.94	249978803.55	2021-09-13 23:03:51	2021-09-13 23:03:51	4
356392	XTZ	2021-09-13	7.175	7.03	7.886	6.345	46143381.84	334227254.95	2021-09-14 23:04:05	2021-09-14 23:04:05	5
371670	BCH	2021-10-15	625.24	598.53	636.72	585.95	125078.64	77366104.41	2021-10-16 22:11:29	2021-10-16 22:11:29	8
366288	ANT	2021-10-04	4.761	4.949	5.076	4.753	149582.05	712106.63	2021-10-05 23:08:58	2021-10-05 23:08:58	14
366762	EOS	2021-10-05	4.733	4.597	4.789	4.551	6955962.43	32465376.16	2021-10-06 23:09:12	2021-10-06 23:09:12	9
371156	EOS	2021-10-14	4.624	4.597	4.734	4.56	4320105.99	19996820.73	2021-10-15 21:11:15	2021-10-15 21:11:15	9
376240	BCH	2021-10-24	617.43	629.11	633.06	605.86	40620.99	25208448.65	2021-10-25 22:13:34	2021-10-25 22:13:34	8
383024	DOT	2021-11-06	52.04	51.85	52.44	49.04	3034146.18	154293899.73	2021-11-07 22:16:30	2021-11-07 22:16:30	4
387698	SJCX	2021-11-15	0.002545	0.00262	0.002545	0.002545	0	0	2021-11-16 03:18:23	2021-11-16 03:18:23	11
388162	XTZ	2021-11-16	5.364	5.72	5.722	5.301	1909105.69	10436141.52	2021-11-16 04:18:24	2021-11-16 04:18:24	5
1235	SJCX	2020-09-05	0.0004067	0.0004187	0.0004067	0.0004067	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
2313	OCN	2020-08-16	0.0006074	0.0005408	0.0006421	0.000538	51568196.01	31322.01	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2314	OCN	2020-08-17	0.0005995	0.0006074	0.0006469	0.0005606	22633055.82	13567.42	2021-05-09 17:34:37	2021-05-09 17:34:37	2
4393	EOS	2020-04-22	2.626	2.523	2.659	2.51	1369240.2	3565261.82	2021-04-22 21:03:20	2021-04-22 21:03:20	9
3328	FIL	2020-05-25	0	0	0	0	0	0	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3432	FIL	2020-09-06	37.75	38.29	40.31	36.92	63.88	2411.34	2021-05-07 19:24:30	2021-05-07 19:24:30	13
2315	OCN	2020-08-18	0.0005575	0.0005995	0.0005998	0.0005364	43181516.81	24075.49	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2316	OCN	2020-08-19	0.0005506	0.0005575	0.0005628	0.0005139	50576848.05	27847.49	2021-05-09 17:34:37	2021-05-09 17:34:37	2
3433	FIL	2020-09-07	33.92	37.75	38.18	32.37	155.4	5270.99	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3434	FIL	2020-09-08	31.35	33.92	34.73	29.47	56.12	1759.24	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3435	FIL	2020-09-09	31.91	31.35	33.21	31.5	26.54	847	2021-05-07 19:24:30	2021-05-07 19:24:30	13
546	DOT	2020-10-18	4.111	3.969	4.122	3.959	231971.24	943618.5	2021-05-09 17:34:36	2021-05-09 17:34:36	4
2317	OCN	2020-08-20	0.0005325	0.0005506	0.0005617	0.0005117	42593082.38	22682.15	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2318	OCN	2020-08-21	0.000485	0.0005325	0.0005199	0.000485	24542103.98	11902.31	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2319	OCN	2020-08-22	0.0005141	0.000485	0.0005378	0.0004864	21088250.43	10841.43	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2320	OCN	2020-08-23	0.0005705	0.0005141	0.0006525	0.000504	127478241.43	72720.12	2021-05-09 17:34:37	2021-05-09 17:34:37	2
3482	FIL	2020-10-26	33.85	38.71	40.75	32.09	429688.91	14544893.85	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3483	FIL	2020-10-27	35.18	33.85	39.52	33.58	220877	7770329.07	2021-05-07 19:24:30	2021-05-07 19:24:30	13
1822	ETH	2021-04-14	2431.86	2298.66	2446.07	2282.77	691403.42	1631081340.89	2021-05-07 19:24:30	2021-05-07 19:24:30	10
547	DOT	2020-10-19	3.989	4.111	4.117	3.96	297778.45	1203310.98	2021-05-09 17:34:36	2021-05-09 17:34:36	4
3568	FIL	2021-01-20	22.35	22.69	23.06	21.74	426811.57	9551600.54	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3592	FIL	2021-02-13	41.58	42.71	44.71	39.8	888131.33	37733939.88	2021-05-07 19:24:30	2021-05-07 19:24:30	13
1823	ETH	2021-04-15	2517.08	2431.86	2545.89	2401.07	531393.8	1311251415.24	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1824	ETH	2021-04-16	2425.96	2517.08	2547.4	2306.2	691735.22	1677614061.1	2021-05-07 19:24:30	2021-05-07 19:24:30	10
255	XTZ	2021-01-01	2.011	2.013	2.132	1.976	5423920.51	11131360.63	2021-05-07 19:24:31	2021-05-07 19:24:31	5
692	DOT	2021-03-13	37.15	35.99	38.23	34.73	1157199.32	42718845.07	2021-05-09 17:34:36	2021-05-09 17:34:36	4
1825	ETH	2021-04-17	2318.01	2425.96	2496.71	2315.76	439527.77	1057642278.34	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1826	ETH	2021-04-18	2240.96	2318.01	2339.37	1976.71	1237429.53	2686887831.66	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1827	ETH	2021-04-19	2163.36	2240.96	2281.08	2071.54	712383.89	1554224533.41	2021-05-07 19:24:30	2021-05-07 19:24:30	10
694	DOT	2021-03-15	34.3	36.47	35.65	33.89	4109425.25	140933612.86	2021-05-09 17:34:36	2021-05-09 17:34:36	4
1828	ETH	2021-04-20	2332.45	2163.36	2348.17	2055.51	861229.69	1886717479.23	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1829	ETH	2021-04-21	2357.59	2332.45	2469.05	2238.47	834316	1971928079.96	2021-05-07 19:24:30	2021-05-07 19:24:30	10
695	DOT	2021-03-16	35.41	34.3	36.04	34.27	3325015.21	117748925.63	2021-05-09 17:34:36	2021-05-09 17:34:36	4
696	DOT	2021-03-17	36.13	35.41	38.52	35.96	3740968.92	135157053.48	2021-05-09 17:34:36	2021-05-09 17:34:36	4
697	DOT	2021-03-18	35.34	36.13	36.15	35.19	2131729.3	75325411.92	2021-05-09 17:34:36	2021-05-09 17:34:36	4
698	DOT	2021-03-19	38.18	35.35	38.87	34.62	1211324.28	45401377.07	2021-05-09 17:34:36	2021-05-09 17:34:36	4
699	DOT	2021-03-20	37.25	38.18	40.03	37.19	1013695.15	39673673.47	2021-05-09 17:34:36	2021-05-09 17:34:36	4
1887	ZRX	2020-06-17	0.3415	0.343	0.3468	0.3337	3465114.92	1180156.33	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1888	ZRX	2020-06-18	0.3311	0.3415	0.3427	0.3292	3496811.81	1169589.09	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1890	ZRX	2020-06-20	0.3499	0.3315	0.3596	0.331	8471278.95	2930027.87	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1891	ZRX	2020-06-21	0.3462	0.3499	0.3577	0.3426	6011138.96	2108167.94	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1892	ZRX	2020-06-22	0.355	0.3462	0.3637	0.3459	6193396.32	2195461.74	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1893	ZRX	2020-06-23	0.3633	0.355	0.3672	0.3496	5269920.63	1887368.76	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1894	ZRX	2020-06-24	0.3438	0.3633	0.3751	0.3335	8306054.74	2927147.76	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1895	ZRX	2020-06-25	0.3347	0.3438	0.3478	0.3301	5604143.79	1891470.54	2021-05-09 17:34:36	2021-05-09 17:34:36	6
308848	FIL	2021-06-04	87.93	89.45	97.86	84.78	1581842.22	142612843.69	2021-06-05 23:40:50	2021-06-05 23:40:50	13
304520	ETH	2021-05-26	2888.94	2707.49	2912.07	2648.47	1102350.01	3067471922.96	2021-05-27 23:38:47	2021-05-27 23:38:47	10
314480	EOS	2021-06-16	4.862	5.191	5.231	4.818	3244711	16180412.59	2021-06-17 23:43:42	2021-06-17 23:43:42	9
330892	EOS	2021-07-21	3.5	3.263	3.571	3.211	3035204.28	10432279.08	2021-07-22 23:51:41	2021-07-22 23:51:41	9
298698	ATOM	2021-05-15	24.5	25.88	28.73	24.46	3189609.29	85826980.74	2021-05-16 23:36:17	2021-05-16 23:36:17	3
298686	FIL	2021-05-15	110.39	120.7	122.89	110.03	701928.38	81224804.48	2021-05-16 23:36:17	2021-05-16 23:36:17	13
319712	ATOM	2021-06-27	10.08	9.584	10.08	9.427	1196973.67	11611325.64	2021-06-28 22:46:13	2021-06-28 22:46:13	3
319736	BCH	2021-06-27	477.66	460.06	497.8	474.88	108180.45	51673692.88	2021-06-28 23:46:13	2021-06-28 23:46:13	8
1896	ZRX	2020-06-26	0.3513	0.3347	0.3629	0.3321	8171172.04	2865663.04	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1897	ZRX	2020-06-27	0.3329	0.3513	0.3661	0.3176	10098317.27	3470671.66	2021-05-09 17:34:36	2021-05-09 17:34:36	6
333648	EOS	2021-07-27	3.76	3.684	3.788	3.605	2948409.99	10901504.88	2021-07-28 21:53:03	2021-07-28 21:53:03	9
326244	ATOM	2021-07-11	14.07	14.42	14.79	13.88	1453552.8	20895091	2021-07-12 23:49:24	2021-07-12 23:49:24	3
339170	SJCX	2021-08-08	0.001753	0.001785	0.001753	0.001753	0	0	2021-08-09 23:55:49	2021-08-09 23:55:49	11
339614	FIL	2021-08-09	67.71	64.58	68.13	61.63	396597.91	26573334.58	2021-08-10 23:56:03	2021-08-10 23:56:03	13
344774	ATOM	2021-08-20	18.98	18.71	19.97	18.42	680154.8	13125088.9	2021-08-21 23:58:35	2021-08-21 23:58:35	3
345240	BTC	2021-08-21	48867.87	49336.45	49809.82	48330.03	22928.52	1125508731.91	2021-08-22 23:58:49	2021-08-22 23:58:49	7
350420	ATOM	2021-09-01	25.41	22.87	25.98	22.13	1274085.32	30527495	2021-09-02 23:01:21	2021-09-02 23:01:21	3
349954	FIL	2021-08-31	75.95	71.16	77.82	70.47	591669.2	44408476.47	2021-09-01 23:01:07	2021-09-01 23:01:07	13
356384	EOS	2021-09-13	4.744	4.883	4.946	4.491	9733272.46	45535572.95	2021-09-14 23:04:05	2021-09-14 23:04:05	9
355918	ZRX	2021-09-12	1.063	1.03	1.076	0.9873	6578815.27	6832085.11	2021-09-13 21:03:50	2021-09-13 21:03:50	6
361090	FIL	2021-09-23	74.69	74.55	75.58	71.88	332868.73	24562027.84	2021-09-24 23:06:24	2021-09-24 23:06:24	13
366290	BCH	2021-10-04	551.9	571.57	583.93	548.94	126016.6	69548736.96	2021-10-05 23:08:58	2021-10-05 23:08:58	8
2338	OCN	2020-09-10	0.0003828	0.0003582	0.0003865	0.0003534	90183710.95	34523.55	2021-05-09 17:34:37	2021-05-09 17:34:37	2
256	XTZ	2021-01-02	1.999	2.011	2.059	1.95	6158999.77	12348039.84	2021-05-07 19:24:31	2021-05-07 19:24:31	5
257	XTZ	2021-01-03	2.134	1.999	2.23	1.955	10611150.91	22207368.85	2021-05-07 19:24:31	2021-05-07 19:24:31	5
258	XTZ	2021-01-04	2.333	2.134	2.364	2.017	13297433.87	29430243.5	2021-05-07 19:24:31	2021-05-07 19:24:31	5
259	XTZ	2021-01-05	2.381	2.333	2.461	2.139	10965927.35	25545180.62	2021-05-07 19:24:31	2021-05-07 19:24:31	5
260	XTZ	2021-01-06	2.648	2.381	2.743	2.298	12649273.53	32257562.75	2021-05-07 19:24:31	2021-05-07 19:24:31	5
261	XTZ	2021-01-07	2.531	2.648	2.796	2.409	12373536.61	32288073.44	2021-05-07 19:24:31	2021-05-07 19:24:31	5
4444	EOS	2020-06-12	2.598	2.516	2.621	2.487	1033654.74	2652175.76	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4445	EOS	2020-06-13	2.604	2.598	2.619	2.555	507030.16	1311592.55	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4446	EOS	2020-06-14	2.567	2.604	2.608	2.529	758597.94	1944726.77	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4447	EOS	2020-06-15	2.533	2.567	2.568	2.425	1555848.25	3881263.03	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4448	EOS	2020-06-16	2.554	2.533	2.566	2.523	721314.9	1835108.69	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4449	EOS	2020-06-17	2.57	2.554	2.603	2.521	1021730.14	2623008.06	2021-05-09 17:34:36	2021-05-09 17:34:36	9
262	XTZ	2021-01-08	2.458	2.531	2.573	2.252	8619011.35	20685956.88	2021-05-07 19:24:31	2021-05-07 19:24:31	5
263	XTZ	2021-01-09	2.646	2.458	2.697	2.419	6421025.13	16517853.34	2021-05-07 19:24:31	2021-05-07 19:24:31	5
264	XTZ	2021-01-10	2.766	2.646	2.95	2.401	15628094.83	42094738.89	2021-05-07 19:24:31	2021-05-07 19:24:31	5
4450	EOS	2020-06-18	2.538	2.57	2.574	2.499	647838.88	1644351.52	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4451	EOS	2020-06-19	2.524	2.538	2.547	2.502	637720.82	1610782.76	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4452	EOS	2020-06-20	2.538	2.524	2.557	2.465	955666.01	2401524.22	2021-05-09 17:34:36	2021-05-09 17:34:36	9
1925	ZRX	2020-07-25	0.3944	0.3878	0.3997	0.3841	4361012.75	1712264.95	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1926	ZRX	2020-07-26	0.3853	0.3944	0.3966	0.3797	4228826.49	1633679.63	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1927	ZRX	2020-07-27	0.3674	0.3853	0.3886	0.3423	13435837.04	4888607.07	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1928	ZRX	2020-07-28	0.3834	0.3674	0.3869	0.3627	7788998.54	2939990.4	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1929	ZRX	2020-07-29	0.3845	0.3834	0.4115	0.3826	11241529.22	4491187.76	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1930	ZRX	2020-07-30	0.3888	0.3845	0.3939	0.3796	3934302.32	1528352.39	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1931	ZRX	2020-07-31	0.3814	0.3888	0.3925	0.3781	3893883.53	1500471.09	2021-05-09 17:34:36	2021-05-09 17:34:36	6
308850	ANT	2021-06-04	4.49	5.057	4.836	4.398	547103.51	2456347.42	2021-06-05 23:40:50	2021-06-05 23:40:50	14
1932	ZRX	2020-08-01	0.3992	0.3814	0.4085	0.379	8788720.52	3453755.48	2021-05-09 17:34:36	2021-05-09 17:34:36	6
314482	BCH	2021-06-16	593.33	627.62	627.63	590.49	61655.6	37474364.96	2021-06-17 21:43:41	2021-06-17 21:43:41	8
326246	DOT	2021-07-11	15.48	15.29	15.7	15.16	249783.51	3855649.1	2021-07-12 23:49:24	2021-07-12 23:49:24	4
304522	SJCX	2021-05-26	0.001572	0.001535	0.001572	0.001572	0	0	2021-05-27 23:38:48	2021-05-27 23:38:48	11
319714	OCN	2021-06-27	0.0004958	0.000476	0.0005553	0.0004958	39735254.34	19702.03	2021-06-28 23:46:13	2021-06-28 23:46:13	2
319756	SJCX	2021-06-27	0.001389	0.001292	0.001389	0.001389	0	0	2021-06-28 23:46:14	2021-06-28 23:46:14	11
334532	DOT	2021-07-29	15.26	14.54	15.38	14.28	2668522.65	39701831.97	2021-07-30 19:53:29	2021-07-30 19:53:29	4
1236	SJCX	2020-09-06	0.0004104	0.0004067	0.0004104	0.0004104	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1237	SJCX	2020-09-07	0.0004152	0.0004104	0.0004152	0.0004152	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1250	SJCX	2020-09-20	0.0004369	0.0004433	0.0004369	0.0004369	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
345242	ATOM	2021-08-21	22.09	18.98	23.89	18.57	1706286.37	37775345.33	2021-08-22 23:58:50	2021-08-22 23:58:50	3
1251	SJCX	2020-09-21	0.0004167	0.0004369	0.0004167	0.0004167	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1259	SJCX	2020-09-29	0.0004337	0.000428	0.0004337	0.0004337	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1260	SJCX	2020-09-30	0.0004312	0.0004337	0.0004312	0.0004312	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1261	SJCX	2020-10-01	0.0004249	0.0004312	0.0004249	0.0004249	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1262	SJCX	2020-10-02	0.0004231	0.0004249	0.0004231	0.0004231	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
344776	ETH	2021-08-20	3286.5	3184.74	3301.32	3179.27	373266.47	1211687408.42	2021-08-21 23:58:35	2021-08-21 23:58:35	10
1263	SJCX	2020-10-03	0.0004221	0.0004231	0.0004221	0.0004221	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1264	SJCX	2020-10-04	0.000427	0.0004221	0.000427	0.000427	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1265	SJCX	2020-10-05	0.0004318	0.000427	0.0004318	0.0004318	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1266	SJCX	2020-10-06	0.0004242	0.0004318	0.0004242	0.0004242	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
344796	DOT	2021-08-20	28.14	26.58	28.46	26.13	2366547.25	64597813.01	2021-08-21 23:58:35	2021-08-21 23:58:35	4
298688	BCH	2021-05-15	1170.63	1297.72	1335.45	1162.1	129163.44	159149046.12	2021-05-16 23:36:23	2021-05-16 23:36:23	8
334080	ETH	2021-07-28	2301.12	2301.98	2346.53	2245.77	384405.14	883372200.32	2021-07-29 23:53:17	2021-07-29 23:53:17	10
326278	SJCX	2021-07-11	0.00137	0.001341	0.00137	0.00137	0	0	2021-07-12 20:49:22	2021-07-12 20:49:22	11
330944	ANT	2021-07-21	3.285	3.12	3.461	3.253	671797.63	2206623.35	2021-07-22 23:51:41	2021-07-22 23:51:41	14
339604	ANT	2021-08-09	4.586	4.331	4.87	4.471	554535.5	2542958.92	2021-08-10 23:56:04	2021-08-10 23:56:04	14
349956	ATOM	2021-08-31	22.87	22.18	26.21	21.62	1828221.3	43953636.28	2021-09-01 23:01:07	2021-09-01 23:01:07	3
356460	ZRX	2021-09-13	1.012	1.063	1.066	0.945	6917614.98	6886893.65	2021-09-14 23:04:04	2021-09-14 23:04:04	6
350424	XTZ	2021-09-01	5.422	5.177	5.506	5.01	8928067.16	47031976.68	2021-09-02 23:01:21	2021-09-02 23:01:21	5
355920	BTC	2021-09-12	46049.72	45166.12	46403.5	44765.82	16366.41	747181260.09	2021-09-13 23:03:51	2021-09-13 23:03:51	7
366292	ETH	2021-10-04	3384.5	3420.14	3437.69	3281.47	306098.91	1029946380.56	2021-10-05 23:08:57	2021-10-05 23:08:57	10
361104	BCH	2021-09-23	552.76	547.98	553.95	533.02	57643.28	31373219.29	2021-09-24 23:06:24	2021-09-24 23:06:24	8
366776	SJCX	2021-10-05	0.00206	0.001971	0.00206	0.00206	0	0	2021-10-06 23:09:12	2021-10-06 23:09:12	11
371158	FIL	2021-10-14	70.36	68.26	71.89	67.24	511912.12	35898243.77	2021-10-15 22:11:16	2021-10-15 22:11:16	13
376728	ETH	2021-10-25	4220.26	4082.08	4235.57	4069.68	273786.47	1140017638.98	2021-10-26 23:13:47	2021-10-26 23:13:47	10
377230	ATOM	2021-10-26	43.24	35.29	43.38	35.06	7254475.03	287674136.87	2021-10-27 23:14:01	2021-10-27 23:14:01	3
376734	DOT	2021-10-25	44.51	42.3	44.77	42.12	2858517.08	125116537.75	2021-10-26 23:13:47	2021-10-26 23:13:47	4
378300	DOT	2021-10-28	41.83	40.38	43.11	39.89	4488453.04	188062207.67	2021-10-29 23:14:29	2021-10-29 23:14:29	4
377222	XTZ	2021-10-26	6.819	6.627	7.175	6.624	8194534.06	56527784.32	2021-10-27 23:14:01	2021-10-27 23:14:01	5
378286	ETH	2021-10-28	4288.22	3924.31	4294.39	3897.1	487099.05	2020610386.22	2021-10-29 23:14:28	2021-10-29 23:14:28	10
8920	ANT	2020-04-30	0.9959	1.059	1.049	0.9173	20839.45	20754.23	2021-04-30 16:57:54	2021-04-30 16:57:54	14
8923	ANT	2020-05-03	0.9579	0.9937	1.049	0.9533	8540.57	8180.79	2021-05-03 03:13:22	2021-05-03 03:13:22	14
2084	ZRX	2020-12-31	0.3553	0.36	0.37	0.3474	7626965.64	2719445.26	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2085	ZRX	2021-01-01	0.3758	0.3553	0.3761	0.3516	7812442.72	2844486.54	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2086	ZRX	2021-01-02	0.3607	0.3758	0.3986	0.3582	15882836.13	5979547.15	2021-05-09 17:34:36	2021-05-09 17:34:36	6
8918	ANT	2020-04-28	0.9817	1.012	1.013	0.8901	14711.86	14442.35	2021-04-28 19:33:32	2021-04-28 19:33:32	14
8919	ANT	2020-04-29	1.059	0.9817	1.12	0.8762	17734.41	18773.43	2021-04-28 19:33:32	2021-04-28 19:33:32	14
2087	ZRX	2021-01-03	0.3925	0.3607	0.396	0.3579	18435476.57	6959518.48	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2088	ZRX	2021-01-04	0.3956	0.3925	0.4229	0.3613	19147726.48	7510149.05	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2089	ZRX	2021-01-05	0.4457	0.3956	0.4562	0.383	25961645.99	10988957.4	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2090	ZRX	2021-01-06	0.4613	0.4457	0.4974	0.4273	31687846.45	14817227.73	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2091	ZRX	2021-01-07	0.438	0.4613	0.4913	0.4296	23414982.01	10919846.58	2021-05-09 17:34:36	2021-05-09 17:34:36	6
8916	ANT	2020-04-26	1.002	1.031	1.059	1	5722.04	5858.47	2021-04-26 23:26:51	2021-04-26 23:26:51	14
2092	ZRX	2021-01-08	0.44	0.438	0.464	0.3988	14822325.3	6426289.82	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2093	ZRX	2021-01-09	0.5435	0.44	0.6443	0.4259	80190593.77	44311528.26	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1287	SJCX	2020-10-27	0.0005458	0.0005228	0.0005458	0.0005458	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1288	SJCX	2020-10-28	0.0005314	0.0005458	0.0005314	0.0005314	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
314484	ETH	2021-06-16	2367.7	2543.6	2554.51	2351.52	403684.37	986488084.54	2021-06-17 23:43:42	2021-06-17 23:43:42	10
345238	ANT	2021-08-21	5.412	5.084	5.59	5.076	64267.57	346105.69	2021-08-22 23:58:49	2021-08-22 23:58:49	14
1289	SJCX	2020-10-29	0.0005385	0.0005314	0.0005385	0.0005385	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1290	SJCX	2020-10-30	0.0005426	0.0005385	0.0005426	0.0005426	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
334082	DOT	2021-07-28	14.54	14.39	14.76	13.95	2539196.91	36610828.71	2021-07-29 23:53:17	2021-07-29 23:53:17	4
1291	SJCX	2020-10-31	0.0005521	0.0005426	0.0005521	0.0005521	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1292	SJCX	2020-11-01	0.0005505	0.0005521	0.0005505	0.0005505	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1293	SJCX	2020-11-02	0.0005428	0.0005505	0.0005428	0.0005428	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
308870	DOT	2021-06-04	25.03	26.97	27	23.64	2080462.56	52019940.76	2021-06-05 23:40:50	2021-06-05 23:40:50	4
320172	ZRX	2021-06-28	0.7017	0.6379	0.7165	0.6304	8803712.04	6003116.97	2021-06-29 22:46:27	2021-06-29 22:46:27	6
298690	SJCX	2021-05-15	0.001871	0.001996	0.001871	0.001871	0	0	2021-05-16 23:36:17	2021-05-16 23:36:17	11
339612	EOS	2021-08-09	4.541	4.296	4.564	4.16	2675798.45	11930077.91	2021-08-10 23:56:02	2021-08-10 23:56:02	9
366294	OCN	2021-10-04	0.0004928	0.0004823	0.0009855	0.0004928	135136221.2	66590.95	2021-10-05 23:08:58	2021-10-05 23:08:58	2
344778	ZRX	2021-08-20	1.058	1.027	1.061	1.008	7242873.32	7509115.96	2021-08-21 23:58:35	2021-08-21 23:58:35	6
304524	FIL	2021-05-26	74.55	72.04	74.9	70.34	952419.42	69105414.96	2021-05-27 23:38:48	2021-05-27 23:38:48	13
8917	ANT	2020-04-27	1.012	1.012	1.036	0.9501	13183.36	13346.35	2021-04-27 14:21:33	2021-04-27 14:21:33	14
371674	EOS	2021-10-15	4.644	4.624	4.734	4.45	7694025.13	35361192.75	2021-10-16 23:11:30	2021-10-16 23:11:30	9
326248	XTZ	2021-07-11	2.841	2.784	2.889	2.736	2767332.14	7779357.2	2021-07-12 21:49:23	2021-07-12 21:49:23	5
8914	ANT	2020-04-24	0.9875	1.024	1.079	0.976	62429.97	61648.95	2021-04-24 20:28:41	2021-04-24 20:28:41	14
8915	ANT	2020-04-25	0.9758	0.977	1.047	0.9758	16284.42	15890.61	2021-04-24 20:28:41	2021-04-24 20:28:41	14
350422	OCN	2021-09-01	0.001072	0.001065	0.001187	0.001072	1419075.61	1521.49	2021-09-02 23:01:21	2021-09-02 23:01:21	2
266	XTZ	2021-01-12	2.292	2.332	2.451	2.196	6290404.71	14638634.92	2021-05-07 19:24:31	2021-05-07 19:24:31	5
267	XTZ	2021-01-13	2.501	2.292	2.502	2.228	5348886.64	12740818.26	2021-05-07 19:24:31	2021-05-07 19:24:31	5
268	XTZ	2021-01-14	2.553	2.501	2.623	2.406	7635378.64	19158011.26	2021-05-07 19:24:31	2021-05-07 19:24:31	5
269	XTZ	2021-01-15	2.711	2.553	2.9	2.454	13943258.05	37081138.57	2021-05-07 19:24:31	2021-05-07 19:24:31	5
270	XTZ	2021-01-16	2.86	2.711	3.184	2.694	20525390.85	60784452.3	2021-05-07 19:24:31	2021-05-07 19:24:31	5
271	XTZ	2021-01-17	2.974	2.86	3.113	2.687	10144983.44	29638864.31	2021-05-07 19:24:31	2021-05-07 19:24:31	5
272	XTZ	2021-01-18	3.032	2.974	3.114	2.846	7134118.42	21366615.87	2021-05-07 19:24:31	2021-05-07 19:24:31	5
296	XTZ	2021-02-11	4.114	3.847	4.32	3.806	15476536	63461111.26	2021-05-07 19:24:31	2021-05-07 19:24:31	5
297	XTZ	2021-02-12	5.012	4.114	5.456	4.012	25619751.72	121307175.38	2021-05-07 19:24:31	2021-05-07 19:24:31	5
319	XTZ	2021-03-06	3.875	3.758	4.01	3.717	4339880.03	16813938.41	2021-05-07 19:24:31	2021-05-07 19:24:31	5
320	XTZ	2021-03-07	4.195	3.875	4.208	3.825	5091761.58	20450745.96	2021-05-07 19:24:31	2021-05-07 19:24:31	5
321	XTZ	2021-03-08	4.398	4.195	4.489	4.056	6648685.07	28534450.17	2021-05-07 19:24:31	2021-05-07 19:24:31	5
331804	XTZ	2021-07-23	2.686	2.501	2.692	2.497	3264746.61	8469553.07	2021-07-24 22:52:08	2021-07-24 22:52:08	5
8913	ANT	2020-04-23	1.053	0.9904	1.117	1.005	47935.76	50475.81	2021-04-23 22:44:41	2021-04-23 22:44:41	14
350496	ZRX	2021-09-01	1.122	1.065	1.133	1.035	9069483.89	9909632.3	2021-09-02 23:01:21	2021-09-02 23:01:21	6
331320	BCH	2021-07-22	442.18	430.35	443.47	429.58	107610.06	47582988.81	2021-07-23 23:51:54	2021-07-23 23:51:54	8
371160	ETH	2021-10-14	3791.23	3607.55	3826.21	3589.52	394599.77	1472924368.3	2021-10-15 23:11:16	2021-10-15 23:11:16	10
361584	DOT	2021-09-24	30.85	33.46	33.53	28	7070718.13	217132527.9	2021-09-25 23:06:38	2021-09-25 23:06:38	4
349978	ETH	2021-08-31	3435.17	3228.46	3480.11	3190.71	572973.24	1922788188.74	2021-09-01 23:01:06	2021-09-01 23:01:06	10
355922	ATOM	2021-09-12	35.05	27.28	35.22	26.01	1985351.3	62528495.43	2021-09-13 23:03:51	2021-09-13 23:03:51	3
366778	ZRX	2021-10-05	1.027	0.9726	1.031	0.9598	7478183.2	7397176.26	2021-10-06 23:09:12	2021-10-06 23:09:12	6
366314	ZRX	2021-10-04	0.9726	1.004	1.005	0.9365	6704325.93	6526690.73	2021-10-05 23:08:57	2021-10-05 23:08:57	6
366758	ATOM	2021-10-05	36.72	36.77	38.33	35.4	2463419.59	90450125.6	2021-10-06 23:09:12	2021-10-06 23:09:12	3
376764	OCN	2021-10-25	0.0006309	0.0006086	0.0006309	0.0006309	28720976.44	18119.79	2021-10-26 23:14:10	2021-10-26 23:14:10	2
376730	BTC	2021-10-25	63089.04	60863.56	63709.97	60658.35	24693.91	1549308691.98	2021-10-26 23:13:48	2021-10-26 23:13:48	7
378288	BTC	2021-10-28	60610.11	58464.42	62252.08	58145.43	51251.1	3090102767.38	2021-10-29 23:14:29	2021-10-29 23:14:29	7
383570	BCH	2021-11-07	601	588.16	612.52	600.49	66700.15	40086562.92	2021-11-08 23:16:45	2021-11-08 23:16:45	8
388158	ZRX	2021-11-16	1.125	1.227	1.227	1.122	5716376.52	6689728.93	2021-11-16 04:18:24	2021-11-16 04:18:24	6
353	XTZ	2021-04-09	6.824	6.159	6.884	6.009	7286860.69	47347660.91	2021-05-07 19:24:31	2021-05-07 19:24:31	5
354	XTZ	2021-04-10	6.563	6.824	7.204	6.248	7944539.38	53326655.13	2021-05-07 19:24:31	2021-05-07 19:24:31	5
355	XTZ	2021-04-11	6.446	6.563	6.68	6.295	3712310.69	24111887.48	2021-05-07 19:24:31	2021-05-07 19:24:31	5
356	XTZ	2021-04-12	6.282	6.446	6.504	6.096	3077471.48	19353992.88	2021-05-07 19:24:31	2021-05-07 19:24:31	5
357	XTZ	2021-04-13	6.558	6.282	6.668	6.102	3967969.02	25474595.26	2021-05-07 19:24:31	2021-05-07 19:24:31	5
358	XTZ	2021-04-14	6.57	6.558	6.902	6.171	6184784.82	40472433.05	2021-05-07 19:24:31	2021-05-07 19:24:31	5
304526	BTC	2021-05-26	39295.08	38387.36	40854.81	37855.81	66483.59	2607759779.42	2021-05-27 23:38:47	2021-05-27 23:38:47	7
1942	ZRX	2020-08-11	0.4422	0.48	0.4818	0.4201	12796340.12	5719506.28	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1943	ZRX	2020-08-12	0.4627	0.4422	0.4649	0.4095	13229403.69	5839318.96	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1944	ZRX	2020-08-13	0.4501	0.4627	0.4757	0.4267	11683393.93	5302021.98	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1945	ZRX	2020-08-14	0.5394	0.4501	0.5537	0.4436	23350822.12	11663107.54	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1946	ZRX	2020-08-15	0.4972	0.5394	0.5528	0.4921	21046097.29	10929333.06	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1947	ZRX	2020-08-16	0.6092	0.4972	0.6496	0.4813	45919057.92	25807929.49	2021-05-09 17:34:36	2021-05-09 17:34:36	6
309326	ETH	2021-06-05	2629.76	2691.17	2816.78	2553.73	570354.57	1523173179.92	2021-06-06 23:41:03	2021-06-06 23:41:03	10
2350	OCN	2020-09-22	0.0002995	0.0002994	0.0003133	0.0002892	91473028.43	27395.94	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2351	OCN	2020-09-23	0.0002882	0.0002995	0.0002978	0.0002722	78048670.07	22491.36	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2352	OCN	2020-09-24	0.0002898	0.0002882	0.0003143	0.0002828	80219092.32	23249.05	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2353	OCN	2020-09-25	0.0002851	0.0002898	0.0002992	0.0002781	108471451.27	30929.14	2021-05-09 17:34:37	2021-05-09 17:34:37	2
359	XTZ	2021-04-15	6.799	6.57	6.919	6.375	4590115.78	30698692.59	2021-05-07 19:24:31	2021-05-07 19:24:31	5
360	XTZ	2021-04-16	7.203	6.799	7.474	6.551	11562674.01	81864160.11	2021-05-07 19:24:31	2021-05-07 19:24:31	5
361	XTZ	2021-04-17	7.076	7.203	7.671	6.974	6051085.53	44395402.68	2021-05-07 19:24:31	2021-05-07 19:24:31	5
362	XTZ	2021-04-18	6.187	7.076	7.169	5.267	15039083.31	90687204.39	2021-05-07 19:24:31	2021-05-07 19:24:31	5
2354	OCN	2020-09-26	0.0002834	0.0002851	0.0002975	0.0002798	114357352.71	32405.21	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2355	OCN	2020-09-27	0.0002861	0.0002834	0.0003076	0.0002826	120633602.55	34517.62	2021-05-09 17:34:37	2021-05-09 17:34:37	2
334	XTZ	2021-03-21	4.173	4.359	4.424	4.05	3288254.91	13841503.6	2021-05-07 19:24:31	2021-05-07 19:24:31	5
335	XTZ	2021-03-22	4.057	4.173	4.416	4.034	4052247.37	17063714.41	2021-05-07 19:24:31	2021-05-07 19:24:31	5
336	XTZ	2021-03-23	4.132	4.057	4.239	3.955	3439827.49	14050716.21	2021-05-07 19:24:31	2021-05-07 19:24:31	5
337	XTZ	2021-03-24	3.988	4.132	4.52	3.858	7311600.24	31133852.76	2021-05-07 19:24:31	2021-05-07 19:24:31	5
334084	BCH	2021-07-28	511.26	502.29	519.04	490.34	88197.29	44705377.77	2021-07-29 23:53:17	2021-07-29 23:53:17	8
349980	SJCX	2021-08-31	0.001886	0.00188	0.001886	0.001886	0	0	2021-09-01 23:01:07	2021-09-01 23:01:07	11
299218	BCH	2021-05-16	1168.19	1170.63	1281.7	1098.82	151843.01	178244688.42	2021-05-17 23:36:32	2021-05-17 23:36:32	8
299256	ANT	2021-05-16	7.694	7.704	8.326	7.555	827211.46	6364740.76	2021-05-17 23:36:36	2021-05-17 23:36:36	14
338	XTZ	2021-03-25	3.923	3.988	4.077	3.753	5616426.08	21939836.89	2021-05-07 19:24:31	2021-05-07 19:24:31	5
339	XTZ	2021-03-26	4.195	3.923	4.203	3.916	2643636.62	10851131.18	2021-05-07 19:24:31	2021-05-07 19:24:31	5
340	XTZ	2021-03-27	4.108	4.195	4.237	4.022	2333368.89	9635741.63	2021-05-07 19:24:31	2021-05-07 19:24:31	5
341	XTZ	2021-03-28	4.223	4.108	4.32	4.073	3071810.71	12942286.78	2021-05-07 19:24:31	2021-05-07 19:24:31	5
342	XTZ	2021-03-29	4.59	4.223	4.629	4.183	5513591.26	24494791.35	2021-05-07 19:24:31	2021-05-07 19:24:31	5
343	XTZ	2021-03-30	4.56	4.59	4.788	4.548	5157044.03	24113271.63	2021-05-07 19:24:31	2021-05-07 19:24:31	5
344	XTZ	2021-03-31	4.826	4.56	4.88	4.227	4863329.74	22115461.42	2021-05-07 19:24:31	2021-05-07 19:24:31	5
347	XTZ	2021-04-03	4.766	5.298	5.405	4.74	4021389.04	20674572.62	2021-05-07 19:24:31	2021-05-07 19:24:31	5
348	XTZ	2021-04-04	5.133	4.766	5.2	4.677	2270401.02	11302421.22	2021-05-07 19:24:31	2021-05-07 19:24:31	5
356394	SJCX	2021-09-13	0.001798	0.001842	0.001798	0.001798	0	0	2021-09-14 23:04:05	2021-09-14 23:04:05	11
350416	ETH	2021-09-01	3829.18	3435.17	3841.79	3385.05	596759.09	2152466889.63	2021-09-02 23:01:20	2021-09-02 23:01:20	10
371660	ANT	2021-10-15	5.031	4.571	5.179	4.493	175988.37	851192.39	2021-10-16 23:11:30	2021-10-16 23:11:30	14
344780	BCH	2021-08-20	694.13	660.08	700.01	652.92	58976.77	39702010.55	2021-08-21 20:58:34	2021-08-21 20:58:34	8
314486	ZRX	2021-06-16	0.8669	0.8947	0.9404	0.8568	4543021.41	4031598.46	2021-06-17 23:43:42	2021-06-17 23:43:42	6
331798	ANT	2021-07-23	3.374	3.346	3.529	3.343	1070072.25	3610298.98	2021-07-24 20:52:07	2021-07-24 20:52:07	14
349	XTZ	2021-04-05	6.1	5.133	6.457	4.974	13634652.48	79528562.5	2021-05-07 19:24:31	2021-05-07 19:24:31	5
350	XTZ	2021-04-06	6.16	6.1	6.792	5.863	11043118.58	69101647.52	2021-05-07 19:24:31	2021-05-07 19:24:31	5
331322	DOT	2021-07-22	13.16	12.32	13.33	11.81	2694009.04	34125127.34	2021-07-23 23:51:54	2021-07-23 23:51:54	4
320174	DOT	2021-06-28	15.77	15	16.01	14.63	1075238.39	16419700.61	2021-06-29 23:46:27	2021-06-29 23:46:27	4
339618	ETH	2021-08-09	3164.94	3013.75	3187.64	2895.74	544267.07	1685075164.66	2021-08-10 23:56:02	2021-08-10 23:56:02	10
326250	EOS	2021-07-11	4.073	3.967	4.171	3.837	3491384.26	14103081.05	2021-07-12 23:49:24	2021-07-12 23:49:24	9
326314	ETH	2021-07-11	2140.45	2110.47	2173.19	2081.93	158610.1	337296664.18	2021-07-12 23:49:24	2021-07-12 23:49:24	10
366296	DOT	2021-10-04	31.17	32.11	32.12	30.08	2630294.63	81830410.82	2021-10-05 23:08:57	2021-10-05 23:08:57	4
366774	DOT	2021-10-05	31.4	31.17	32.14	30.57	2466411.85	77357983.05	2021-10-06 23:09:11	2021-10-06 23:09:11	4
361586	ETH	2021-09-24	2930.86	3154.62	3160.27	2745.73	727870.33	2116848129.48	2021-09-25 23:06:37	2021-09-25 23:06:37	10
355924	EOS	2021-09-12	4.883	4.672	4.945	4.577	6398527.53	30887371.23	2021-09-13 21:03:50	2021-09-13 21:03:50	9
377220	EOS	2021-10-26	4.715	4.813	4.933	4.657	6909654.3	33139129.23	2021-10-27 23:14:01	2021-10-27 23:14:01	9
371176	BCH	2021-10-14	598.53	593.42	607.96	590.8	53580.52	32099842.41	2021-10-15 23:11:16	2021-10-15 23:11:16	8
376742	BCH	2021-10-25	621.87	617.16	639.72	618.21	75920.78	47212754.28	2021-10-26 23:13:49	2021-10-26 23:13:49	8
378292	EOS	2021-10-28	4.403	4.153	4.495	4.136	6888760.57	30013064.68	2021-10-29 23:14:29	2021-10-29 23:14:29	9
376732	ZRX	2021-10-25	1.011	0.9948	1.019	0.9902	5052892.96	5086059.68	2021-10-26 23:13:47	2021-10-26 23:13:47	6
378290	XTZ	2021-10-28	6.154	5.887	6.266	5.809	7422407.29	44857280.56	2021-10-29 23:14:29	2021-10-29 23:14:29	5
383572	DOT	2021-11-07	52.23	52.04	53.5	51.38	2252975.06	118206177.88	2021-11-08 23:16:45	2021-11-08 23:16:45	4
388164	BTC	2021-11-16	60720.2	63614.06	63614.53	60536.08	18434.37	1139937414.13	2021-11-16 04:18:24	2021-11-16 04:18:24	7
4499	EOS	2020-08-06	3.089	3.054	3.177	3.002	2450741	7549622.09	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4500	EOS	2020-08-07	3.01	3.089	3.246	2.816	3168165.46	9644396.06	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4501	EOS	2020-08-08	3.064	3.01	3.088	2.975	1051960.73	3189067.12	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4502	EOS	2020-08-09	3.03	3.064	3.083	2.938	1638259.41	4943691.41	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4503	EOS	2020-08-10	3.24	3.03	3.297	3.029	3944847.21	12510371.18	2021-05-09 17:34:36	2021-05-09 17:34:36	9
2938	BCH	2020-05-01	254.98	250.32	258.78	252.87	446376.23	113819236.58	2021-05-01 21:17:55	2021-05-01 21:17:55	8
4504	EOS	2020-08-11	3.005	3.24	3.297	2.886	3844103.78	11857304.74	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4505	EOS	2020-08-12	3.025	3.005	3.048	2.891	1794107.13	5394533.26	2021-05-09 17:34:36	2021-05-09 17:34:36	9
1294	SJCX	2020-11-03	0.000561	0.0005428	0.000561	0.000561	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1295	SJCX	2020-11-04	0.0005663	0.000561	0.0005663	0.0005663	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1296	SJCX	2020-11-05	0.000624	0.0005663	0.000624	0.000624	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
8934	ANT	2020-05-14	1.261	1.438	1.514	1.19	48179.32	60771.61	2021-05-09 17:34:37	2021-05-09 17:34:37	14
8935	ANT	2020-05-15	1.058	1.261	1.199	1.028	42444.44	44898.07	2021-05-09 17:34:37	2021-05-09 17:34:37	14
8936	ANT	2020-05-16	1.155	1.058	1.166	1.04	39883.09	46049.45	2021-05-09 17:34:37	2021-05-09 17:34:37	14
8937	ANT	2020-05-17	1.096	1.155	1.19	1.096	18669.13	20455.29	2021-05-09 17:34:37	2021-05-09 17:34:37	14
1297	SJCX	2020-11-06	0.0006236	0.000624	0.0006236	0.0006236	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1298	SJCX	2020-11-07	0.0005935	0.0006236	0.0005935	0.0005935	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1299	SJCX	2020-11-08	0.0006195	0.0005935	0.0006195	0.0006195	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1300	SJCX	2020-11-09	0.0006134	0.0006195	0.0006134	0.0006134	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1301	SJCX	2020-11-10	0.0006125	0.0006134	0.0006125	0.0006125	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1302	SJCX	2020-11-11	0.0006283	0.0006125	0.0006283	0.0006283	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
2356	OCN	2020-09-28	0.0002832	0.0002861	0.0002903	0.0002797	116610305.18	33024.97	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2357	OCN	2020-09-29	0.0002807	0.0002832	0.0002915	0.0002771	127762115.81	35867.63	2021-05-09 17:34:37	2021-05-09 17:34:37	2
8938	ANT	2020-05-18	1.147	1.096	1.179	1.101	18809.09	21579.33	2021-05-09 17:34:37	2021-05-09 17:34:37	14
8939	ANT	2020-05-19	1.118	1.147	1.235	1.111	7222.45	8073.81	2021-05-09 17:34:37	2021-05-09 17:34:37	14
8940	ANT	2020-05-20	1.084	1.118	1.155	1.059	21138.55	22915.82	2021-05-09 17:34:37	2021-05-09 17:34:37	14
8941	ANT	2020-05-21	0.9838	1.084	1.09	0.9693	21618.13	21268.33	2021-05-09 17:34:37	2021-05-09 17:34:37	14
2939	BCH	2020-05-02	261.26	254.98	261.98	256.59	426639.01	111463916.76	2021-05-01 21:17:55	2021-05-01 21:17:55	8
2941	BCH	2020-05-04	246.2	252.07	251.35	244.96	609318.43	150013794.1	2021-05-04 22:03:21	2021-05-04 22:03:21	8
2942	BCH	2020-05-05	247.05	246.2	252.11	246.96	528600.66	130592886.31	2021-05-04 22:03:21	2021-05-04 22:03:21	8
299220	BTC	2021-05-16	46490.71	46775.29	49808.83	43918.69	79337.9	3693969204.75	2021-05-17 23:36:31	2021-05-17 23:36:31	7
2935	BCH	2020-04-28	241.81	243.05	243.13	239.95	618887.86	149654245.82	2021-04-28 19:33:32	2021-04-28 19:33:32	8
2936	BCH	2020-04-29	258.01	241.81	276.55	255.82	802676.56	207102010.85	2021-04-28 19:33:32	2021-04-28 19:33:32	8
148	XTZ	2020-09-16	2.472	2.502	2.537	2.416	2863519.37	7095319	2021-05-07 19:24:31	2021-05-07 19:24:31	5
304528	DOT	2021-05-26	24.55	22.18	24.76	21.68	2237112.45	52382010.45	2021-05-27 23:38:47	2021-05-27 23:38:47	4
309328	ATOM	2021-06-05	14.89	15.08	16.33	14.25	948213.54	14525476.59	2021-06-06 23:41:03	2021-06-06 23:41:03	3
326252	BTC	2021-07-11	34249.3	33515.13	34595.69	33335.4	15724.2	533337900.01	2021-07-12 23:49:24	2021-07-12 23:49:24	7
334572	ANT	2021-07-29	4.023	3.967	4.071	3.914	466148.27	1875345.84	2021-07-30 23:53:31	2021-07-30 23:53:31	14
149	XTZ	2020-09-17	2.471	2.472	2.562	2.442	2319605.7	5771644.11	2021-05-07 19:24:31	2021-05-07 19:24:31	5
2940	BCH	2020-05-03	252.07	261.26	263.65	250.11	633056.78	159576823.67	2021-05-03 03:13:20	2021-05-03 03:13:20	8
150	XTZ	2020-09-18	2.39	2.471	2.516	2.325	4589756.04	11056181.61	2021-05-07 19:24:31	2021-05-07 19:24:31	5
151	XTZ	2020-09-19	2.319	2.39	2.391	2.264	3589134.3	8330461.17	2021-05-07 19:24:31	2021-05-07 19:24:31	5
152	XTZ	2020-09-20	2.22	2.319	2.389	2.162	3924100.2	8934942.44	2021-05-07 19:24:31	2021-05-07 19:24:31	5
320176	BTC	2021-06-28	34487.11	34713.81	35292.57	33890.86	41259.21	1424168416.33	2021-06-29 23:46:27	2021-06-29 23:46:27	7
320204	OCN	2021-06-28	0.000521	0.0004958	0.0005626	0.0004584	54481975.79	28382.39	2021-06-29 23:46:27	2021-06-29 23:46:27	2
314494	ANT	2021-06-16	5.065	6.354	6.066	4.617	761302.4	3856323	2021-06-17 23:43:42	2021-06-17 23:43:42	14
153	XTZ	2020-09-21	1.976	2.22	2.266	1.927	6111089.97	12421266.02	2021-05-07 19:24:31	2021-05-07 19:24:31	5
154	XTZ	2020-09-22	2.11	1.976	2.193	1.966	5556764.99	11709453.92	2021-05-07 19:24:31	2021-05-07 19:24:31	5
2937	BCH	2020-04-30	250.32	258.01	264.4	246.52	865819.17	216728814.57	2021-04-30 16:57:54	2021-04-30 16:57:54	8
344782	BTC	2021-08-20	49336.45	46761.49	49377.5	46652	36326.2	1742574002.38	2021-08-21 23:58:35	2021-08-21 23:58:35	7
155	XTZ	2020-09-23	1.954	2.11	2.15	1.918	5370906.25	10854662.8	2021-05-07 19:24:31	2021-05-07 19:24:31	5
156	XTZ	2020-09-24	2.155	1.954	2.18	1.936	3854122.03	7988326.68	2021-05-07 19:24:31	2021-05-07 19:24:31	5
2358	OCN	2020-09-30	0.0002807	0.0002807	0.0002951	0.0002771	124514155.44	34949.98	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2359	OCN	2020-10-01	0.0002789	0.0002807	0.0002931	0.0002719	130612630.3	36433.23	2021-05-09 17:34:37	2021-05-09 17:34:37	2
331324	ATOM	2021-07-22	11.38	10.45	11.62	10.19	1625438.9	17910039	2021-07-23 23:51:54	2021-07-23 23:51:54	3
339624	OCN	2021-08-09	0.001298	0.001205	0.001393	0.001266	18843098.33	24451.28	2021-08-10 23:56:03	2021-08-10 23:56:03	2
334086	ATOM	2021-07-28	11.6	11.72	11.96	11.4	1247886.54	14543490.38	2021-07-29 23:53:17	2021-07-29 23:53:17	3
334538	ATOM	2021-07-29	11.79	11.6	11.88	11.33	808499.18	9386271.32	2021-07-30 23:53:31	2021-07-30 23:53:31	3
350414	BTC	2021-09-01	48840.01	47159.26	49062.05	46544.74	31823.8	1520961266.36	2021-09-02 23:01:20	2021-09-02 23:01:20	7
355926	XTZ	2021-09-12	7.03	6.118	7.228	5.91	24292440.93	161110669.81	2021-09-13 23:03:51	2021-09-13 23:03:51	5
355948	OCN	2021-09-12	0.0009535	0.0009473	0.0009875	0.0009194	18034250.48	17195.47	2021-09-13 23:03:51	2021-09-13 23:03:51	2
356378	BTC	2021-09-13	44958.56	46049.72	46821.84	43511.3	42623.67	1909473369.72	2021-09-14 23:04:04	2021-09-14 23:04:04	7
361588	FIL	2021-09-24	63.36	74.69	74.96	60.25	857509.64	55387858.12	2021-09-25 23:06:37	2021-09-25 23:06:37	13
366766	BCH	2021-10-05	595.05	550.94	599.95	549.32	82324.13	47399404.51	2021-10-06 23:09:12	2021-10-06 23:09:12	8
366298	ATOM	2021-10-04	36.77	38.77	38.78	36.06	3667296.5	136997609.51	2021-10-05 23:08:58	2021-10-05 23:08:58	3
371672	ZRX	2021-10-15	1.024	1.035	1.036	0.978	7938466.19	7990811.84	2021-10-16 23:11:30	2021-10-16 23:11:30	6
3	XTZ	2020-04-24	2.718	2.496	2.769	2.496	8760227.52	23433200.67	2021-04-24 20:20:48	2021-04-24 20:20:48	5
4	XTZ	2020-04-25	2.866	2.718	2.89	2.643	6017326.08	16769277.91	2021-04-24 20:20:48	2021-04-24 20:20:48	5
8951	ANT	2020-05-31	1.059	1.067	1.079	1.002	12588.9	13336.65	2021-05-09 17:34:37	2021-05-09 17:34:37	14
10	XTZ	2020-05-01	2.798	2.757	2.949	2.752	4961612.32	14091537.11	2021-05-01 22:04:03	2021-05-01 22:04:03	5
8952	ANT	2020-06-01	1.115	1.059	1.161	1.077	28962.26	32294.84	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9000	ANT	2020-07-19	1.381	1.395	1.412	1.361	63339.92	88007.64	2021-05-09 17:34:37	2021-05-09 17:34:37	14
2	XTZ	2020-04-23	2.496	2.336	2.583	2.312	8638962.43	21234891.71	2021-04-23 22:51:50	2021-04-23 22:51:50	5
6	XTZ	2020-04-27	2.748	2.767	2.788	2.558	5470645.28	14625861.92	2021-04-27 14:21:33	2021-04-27 14:21:33	5
9001	ANT	2020-07-20	1.362	1.381	1.395	1.287	64609.13	87916.96	2021-05-09 17:34:37	2021-05-09 17:34:37	14
2946	BCH	2020-05-09	265.05	260.7	272.4	253.03	853924.13	226334803.52	2021-05-09 17:34:36	2021-05-09 17:34:36	8
5	XTZ	2020-04-26	2.767	2.866	2.866	2.729	4966907.38	13857138.39	2021-04-26 23:28:51	2021-04-26 23:28:51	5
2563	BTC	2020-04-22	7135.41	6855.11	7165.43	6831.44	43780.72	308254465.67	2021-04-22 21:03:20	2021-04-22 21:03:20	7
2947	BCH	2020-05-10	233.58	265.05	244.06	229.56	1036458.36	242091007.08	2021-05-09 17:34:36	2021-05-09 17:34:36	8
2948	BCH	2020-05-11	235.3	233.58	235.82	222.11	907138.13	213450912.62	2021-05-09 17:34:36	2021-05-09 17:34:36	8
2949	BCH	2020-05-12	233.76	235.3	244.26	231.11	426344.23	99662768.66	2021-05-09 17:34:36	2021-05-09 17:34:36	8
2950	BCH	2020-05-13	240.11	233.76	247.19	236.66	256599.12	61612124.73	2021-05-09 17:34:36	2021-05-09 17:34:36	8
2951	BCH	2020-05-14	242.58	240.11	252.76	241.01	433906.73	105255930.09	2021-05-09 17:34:36	2021-05-09 17:34:36	8
2564	BTC	2020-04-23	7489.25	7135.41	7731.56	7041.2	81106.87	599195847.97	2021-04-23 22:23:54	2021-04-23 22:23:54	7
9002	ANT	2020-07-21	1.662	1.378	1.802	1.365	135342.91	224917.63	2021-05-09 17:34:37	2021-05-09 17:34:37	14
2565	BTC	2020-04-24	7509.44	7489.25	7607.28	7408.35	51734.5	389027134.45	2021-04-24 20:28:41	2021-04-24 20:28:41	7
2952	BCH	2020-05-15	235.12	242.58	236.8	229.72	342241.18	80467805.28	2021-05-09 17:34:36	2021-05-09 17:34:36	8
2953	BCH	2020-05-16	236.74	235.12	239.18	234.58	288713.03	68350545.65	2021-05-09 17:34:36	2021-05-09 17:34:36	8
4528	EOS	2020-09-04	3.006	2.621	3.224	2.59	3532257.74	10417940.84	2021-05-09 17:34:36	2021-05-09 17:34:36	9
9	XTZ	2020-04-30	2.757	2.939	3.047	2.694	8878026.74	25643549.96	2021-04-30 16:57:54	2021-04-30 16:57:54	5
4529	EOS	2020-09-05	2.937	3.006	3.156	2.783	5198047.41	15530522.2	2021-05-09 17:34:36	2021-05-09 17:34:36	9
7	XTZ	2020-04-28	2.756	2.748	2.812	2.663	4759168.86	13129990.56	2021-04-28 19:33:32	2021-04-28 19:33:32	5
4530	EOS	2020-09-06	2.905	2.937	3.028	2.818	1488003.82	4329961.34	2021-05-09 17:34:36	2021-05-09 17:34:36	9
9003	ANT	2020-07-22	1.675	1.662	2.103	1.667	121154.67	202965.59	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9004	ANT	2020-07-23	1.813	1.68	1.848	1.685	75609.79	137112.96	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9005	ANT	2020-07-24	1.914	1.813	1.947	1.769	102874.69	196888.38	2021-05-09 17:34:37	2021-05-09 17:34:37	14
8	XTZ	2020-04-29	2.939	2.756	3.013	2.751	8327578.67	24014699.88	2021-04-28 19:33:32	2021-04-28 19:33:32	5
4531	EOS	2020-09-07	2.856	2.905	2.939	2.672	2409700.9	6781184.92	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4532	EOS	2020-09-08	2.767	2.856	2.864	2.68	1449982.35	3998554.72	2021-05-09 17:34:36	2021-05-09 17:34:36	9
9006	ANT	2020-07-25	2.212	1.92	2.258	2.099	118781.11	262759.71	2021-05-09 17:34:37	2021-05-09 17:34:37	14
299222	EOS	2021-05-16	10.12	10.24	11.22	9.429	13180239.61	134745261.33	2021-05-17 23:36:34	2021-05-17 23:36:34	9
309330	ANT	2021-06-05	5.006	4.498	5.666	4.443	239283.59	1176234.42	2021-06-06 23:41:04	2021-06-06 23:41:04	14
4533	EOS	2020-09-09	2.752	2.767	2.815	2.701	831278.52	2304112.42	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4534	EOS	2020-09-10	2.781	2.752	2.845	2.746	1454022.44	4052801.78	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4550	EOS	2020-09-26	2.569	2.548	2.608	2.511	681490.19	1749738.42	2021-05-09 17:34:36	2021-05-09 17:34:36	9
304554	ANT	2021-05-26	5.344	4.395	5.816	4.452	1393190.29	7445391.25	2021-05-27 23:38:47	2021-05-27 23:38:47	14
304530	XTZ	2021-05-26	3.929	3.661	3.966	3.594	9283407.69	35372431.11	2021-05-27 23:38:47	2021-05-27 23:38:47	5
4551	EOS	2020-09-27	2.591	2.569	2.603	2.53	485790.96	1249202.05	2021-05-09 17:34:36	2021-05-09 17:34:36	9
1987	ZRX	2020-09-25	0.4057	0.3822	0.412	0.3707	5866201.25	2322360.26	2021-05-09 17:34:36	2021-05-09 17:34:36	6
320178	EOS	2021-06-28	3.848	3.773	3.944	3.692	2195553.37	8335793.31	2021-06-29 22:46:27	2021-06-29 22:46:27	9
314498	SJCX	2021-06-16	0.001534	0.001606	0.001534	0.001534	0	0	2021-06-17 21:43:41	2021-06-17 21:43:41	11
326254	OCN	2021-07-11	0.0008348	0.0006542	0.0008776	0.0006207	43189030.23	36053.14	2021-07-12 23:49:24	2021-07-12 23:49:24	2
314540	ATOM	2021-06-16	13.42	12.96	13.47	12.33	933445.68	12035398.32	2021-06-17 23:43:42	2021-06-17 23:43:42	3
2945	BCH	2020-05-08	260.7	252.4	261.98	247.36	593914.93	154834468.22	2021-05-07 19:24:30	2021-05-07 19:24:30	8
1988	ZRX	2020-09-26	0.3911	0.4057	0.4126	0.3841	2328526.99	932813.76	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2360	OCN	2020-10-02	0.0002732	0.0002789	0.0002905	0.0002732	118084855.7	32261.46	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2361	OCN	2020-10-03	0.0002771	0.0002732	0.0002805	0.0002736	97574187.19	27033.51	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2362	OCN	2020-10-04	0.0002751	0.0002771	0.0002821	0.0002716	122915151.73	33811.82	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2363	OCN	2020-10-05	0.0002725	0.0002751	0.0002795	0.0002654	108989399.06	29694.9	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2364	OCN	2020-10-06	0.000259	0.0002725	0.0002659	0.0002488	101178556.86	26209.9	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2365	OCN	2020-10-07	0.0002599	0.000259	0.0002633	0.000253	93038082.76	24176.09	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2366	OCN	2020-10-08	0.0002634	0.0002599	0.0002739	0.0002564	97916127.25	25791.11	2021-05-09 17:34:37	2021-05-09 17:34:37	2
331326	ZRX	2021-07-22	0.6414	0.6347	0.6415	0.6112	4512667.41	2820644.78	2021-07-23 23:51:55	2021-07-23 23:51:55	6
320200	BCH	2021-06-28	501.25	477.12	518.19	472.6	90267.6	44493479.84	2021-06-29 23:46:27	2021-06-29 23:46:27	8
331796	BTC	2021-07-23	33637.92	32299.47	33637.93	32012.62	23478.17	765209760.41	2021-07-24 23:52:08	2021-07-24 23:52:08	7
334088	OCN	2021-07-28	0.0008514	0.0008517	0.0009435	0.0008284	40176372.66	34206.74	2021-07-29 22:53:17	2021-07-29 22:53:17	2
334180	ANT	2021-07-28	3.967	4.23	4.435	3.932	850139.21	3372139.82	2021-07-29 23:53:17	2021-07-29 23:53:17	14
334530	ETH	2021-07-29	2383.24	2301.12	2398.97	2268.67	288398.83	669545747.5	2021-07-30 23:53:31	2021-07-30 23:53:31	10
340068	BTC	2021-08-10	45601.03	46292.61	46707.56	44663.2	35319.34	1609844198.85	2021-08-11 23:56:16	2021-08-11 23:56:16	7
345250	OCN	2021-08-21	0.001226	0.001117	0.001291	0.001097	9205083.81	11286.39	2021-08-22 23:58:49	2021-08-22 23:58:49	2
344784	SJCX	2021-08-20	0.001973	0.00187	0.001973	0.001973	0	0	2021-08-21 20:58:34	2021-08-21 20:58:34	11
350442	SJCX	2021-09-01	0.001954	0.001886	0.001954	0.001954	0	0	2021-09-02 23:01:22	2021-09-02 23:01:22	11
355928	FIL	2021-09-12	83.8	81.67	87.03	80.73	330688.3	27644270.31	2021-09-13 23:03:51	2021-09-13 23:03:51	13
1312	SJCX	2020-11-21	0.0007482	0.0007469	0.0007482	0.0007482	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1313	SJCX	2020-11-22	0.0007372	0.0007482	0.0007372	0.0007372	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1314	SJCX	2020-11-23	0.0007354	0.0007372	0.0007354	0.0007354	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1315	SJCX	2020-11-24	0.0007663	0.0007354	0.0007663	0.0007663	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1316	SJCX	2020-11-25	0.000749	0.0007663	0.000749	0.000749	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1317	SJCX	2020-11-26	0.000687	0.000749	0.000687	0.000687	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1318	SJCX	2020-11-27	0.0006862	0.000687	0.0006862	0.0006862	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1319	SJCX	2020-11-28	0.0007096	0.0006862	0.0007096	0.0007096	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1320	SJCX	2020-11-29	0.000728	0.0007096	0.000728	0.000728	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1321	SJCX	2020-11-30	0.0007875	0.000728	0.0007875	0.0007875	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1331	SJCX	2020-12-10	0.00073	0.000742	0.00073	0.00073	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1332	SJCX	2020-12-11	0.0007214	0.00073	0.0007214	0.0007214	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
320180	FIL	2021-06-28	56.4	56.18	57.89	54.93	255550.19	14420426.65	2021-06-29 23:46:27	2021-06-29 23:46:27	13
334090	FIL	2021-07-28	49.57	49.59	50.94	48.38	399468.25	19840083.85	2021-07-29 18:53:15	2021-07-29 18:53:15	13
371676	ATOM	2021-10-15	33.07	33.82	34.15	32.23	2428120.38	80787690.51	2021-10-16 23:11:30	2021-10-16 23:11:30	3
363	XTZ	2021-04-19	5.464	6.187	6.429	5.34	7260808.53	42462348.33	2021-05-07 19:24:31	2021-05-07 19:24:31	5
364	XTZ	2021-04-20	5.709	5.464	5.713	4.956	9178179.47	48881266.02	2021-05-07 19:24:31	2021-05-07 19:24:31	5
365	XTZ	2021-04-21	5.334	5.709	5.834	5.253	4535358.65	25269430	2021-05-07 19:24:31	2021-05-07 19:24:31	5
366	XTZ	2021-04-22	4.938	5.334	5.757	4.868	6741649.11	35935002.94	2021-05-07 19:24:31	2021-05-07 19:24:31	5
7752	XTZ	2021-04-23	4.823	4.938	5.069	4.055	13163690.3	59378841.6	2021-05-07 19:24:31	2021-05-07 19:24:31	5
331800	ETH	2021-07-23	2125.57	2024.74	2131.09	1997.36	352598.68	724351214.33	2021-07-24 23:52:08	2021-07-24 23:52:08	10
340096	OCN	2021-08-10	0.001162	0.001298	0.001288	0.001162	6988398.33	8123.44	2021-08-11 23:56:16	2021-08-11 23:56:16	2
340070	XTZ	2021-08-10	3.266	3.287	3.348	3.185	4141296.92	13568250.08	2021-08-11 23:56:16	2021-08-11 23:56:16	5
345246	SJCX	2021-08-21	0.001955	0.001973	0.001955	0.001955	0	0	2021-08-22 23:58:49	2021-08-22 23:58:49	11
355912	ANT	2021-09-12	6.033	5.488	6.295	5.595	449071.98	2709032.7	2021-09-13 23:03:51	2021-09-13 23:03:51	14
361590	BCH	2021-09-24	513.52	552.76	556.35	479.63	105940.12	54257395.83	2021-09-25 23:06:38	2021-09-25 23:06:38	8
366332	SJCX	2021-10-04	0.001971	0.001929	0.001971	0.001971	0	0	2021-10-05 23:08:58	2021-10-05 23:08:58	11
304532	ZRX	2021-05-26	1.15	0.9783	1.156	0.9672	18022077.64	19447266.76	2021-05-27 23:38:48	2021-05-27 23:38:48	6
331328	XTZ	2021-07-22	2.501	2.396	2.509	2.338	2323907.18	5636739.06	2021-07-23 23:51:55	2021-07-23 23:51:55	5
309332	BCH	2021-06-05	649.25	671.38	688.37	635.07	75296.3	49841393.94	2021-06-06 23:41:04	2021-06-06 23:41:04	8
314514	DOT	2021-06-16	23.02	23.97	24.55	22.53	1276109.31	29860333.11	2021-06-17 23:43:42	2021-06-17 23:43:42	4
299252	SJCX	2021-05-16	0.00186	0.001871	0.00186	0.00186	0	0	2021-05-17 23:36:31	2021-05-17 23:36:31	11
299224	OCN	2021-05-16	0.001291	0.001239	0.001399	0.001148	73031119.34	94284.99	2021-05-17 23:36:34	2021-05-17 23:36:34	2
344786	EOS	2021-08-20	5.462	5.255	5.479	5.189	4465534.61	23777762.18	2021-08-21 23:58:35	2021-08-21 23:58:35	9
326258	ZRX	2021-07-11	0.7962	0.7907	0.7996	0.7629	4016434.59	3146756.29	2021-07-12 19:49:22	2021-07-12 19:49:22	6
350916	EOS	2021-09-02	5.259	5.313	5.389	5.177	6450967.71	34120144.32	2021-09-03 22:01:34	2021-09-03 22:01:34	9
350896	ETH	2021-09-02	3787.7	3829.18	3837.51	3724.1	360090	1360330757.88	2021-09-03 23:01:34	2021-09-03 23:01:34	10
356390	ATOM	2021-09-13	35.77	35.05	38.84	30.34	2952292.64	103368224.98	2021-09-14 23:04:04	2021-09-14 23:04:04	3
383562	FIL	2021-11-07	62.59	61.85	62.66	61.16	216501.75	13419121.59	2021-11-08 23:16:45	2021-11-08 23:16:45	13
378294	ZRX	2021-10-28	0.9771	0.9309	0.9891	0.9202	12069333.96	11592361.9	2021-10-29 23:14:29	2021-10-29 23:14:29	6
388180	OCN	2021-11-16	0.0006065	0.0006361	0.0006361	0.0006047	22101508.99	13404.83	2021-11-16 04:23:59	2021-11-16 04:23:59	2
376736	EOS	2021-10-25	4.813	4.744	4.849	4.715	3067322.54	14729352.11	2021-10-26 23:13:47	2021-10-26 23:13:47	9
3464	FIL	2020-10-08	39.03	38.17	41.35	37.18	36.73	1433.53	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3471	FIL	2020-10-15	61.77	20.46	121.41	15.89	391154.97	24159725.75	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3472	FIL	2020-10-16	44.43	61.77	74.16	39.03	676295.13	30049739.51	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3473	FIL	2020-10-17	42.46	44.43	50.62	40.45	259334	11010847.77	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3474	FIL	2020-10-18	32.49	42.46	43	31.94	269901.31	8769260.16	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3475	FIL	2020-10-19	33.82	32.49	35.12	30.71	438078.45	14817803.7	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3476	FIL	2020-10-20	31.25	33.82	34.57	30.22	143121.79	4472124.48	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3477	FIL	2020-10-21	26.7	31.25	33.58	26.52	175829.07	4695079.48	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3225	BCH	2021-02-12	577.25	530.03	581.15	511.04	216008.53	117782045.9	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3226	BCH	2021-02-13	668.31	577.25	668.97	542.19	371715.76	227389560.52	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3227	BCH	2021-02-14	722.92	668.31	752	651.62	451875.59	316619620.95	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3228	BCH	2021-02-15	715.65	722.92	773.37	602.71	508283.99	355621798.75	2021-05-09 17:34:36	2021-05-09 17:34:36	8
320206	ANT	2021-06-28	3.518	3.704	3.99	3.314	1421122.2	4999060.56	2021-06-29 22:46:27	2021-06-29 22:46:27	14
320182	XTZ	2021-06-28	2.702	2.623	2.736	2.565	1983041.91	5284465.14	2021-06-29 23:46:27	2021-06-29 23:46:27	5
331808	ATOM	2021-07-23	11.45	11.38	11.54	10.69	1296552.32	14485461.01	2021-07-24 23:52:08	2021-07-24 23:52:08	3
4552	EOS	2020-09-28	2.564	2.591	2.634	2.557	850943.02	2215222.52	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4553	EOS	2020-09-29	2.602	2.564	2.604	2.558	490466.64	1265852.95	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4554	EOS	2020-09-30	2.578	2.602	2.603	2.558	474786.29	1223667.33	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4555	EOS	2020-10-01	2.548	2.578	2.628	2.492	1592311.8	4102023.09	2021-05-09 17:34:36	2021-05-09 17:34:36	9
1989	ZRX	2020-09-27	0.3949	0.3911	0.4028	0.3744	2748625.98	1070303.72	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1990	ZRX	2020-09-28	0.4126	0.3949	0.44	0.3949	8467293.95	3563252.65	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1991	ZRX	2020-09-29	0.4078	0.4126	0.4175	0.3848	6620746.55	2652364.33	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1992	ZRX	2020-09-30	0.4096	0.4078	0.4106	0.3875	2473734.18	992684.78	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1993	ZRX	2020-10-01	0.3984	0.4096	0.4306	0.3891	4444244.37	1812981.43	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2286	OCN	2020-07-20	0.0004156	0.0004019	0.0004274	0.000392	16462258.26	6842.4	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2287	OCN	2020-07-21	0.0004573	0.0004156	0.0004991	0.0004254	63282619.13	28940.29	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2312	OCN	2020-08-15	0.0005408	0.000535	0.0005581	0.0005062	26509656.82	14336.09	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2323	OCN	2020-08-26	0.000525	0.000529	0.0005443	0.0005057	22354222.83	11735.68	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2324	OCN	2020-08-27	0.0005365	0.000525	0.0006284	0.0005173	57358497.4	30770.08	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2325	OCN	2020-08-28	0.0005458	0.0005365	0.0007041	0.0005379	96146410.92	52481.06	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2326	OCN	2020-08-29	0.0005543	0.0005458	0.0005862	0.0005424	20920551.74	11596.64	2021-05-09 17:34:37	2021-05-09 17:34:37	2
344818	XTZ	2021-08-20	3.729	3.638	3.732	3.586	4026278.45	14772842.01	2021-08-21 23:58:35	2021-08-21 23:58:35	5
304550	OCN	2021-05-26	0.0009534	0.0009205	0.00104	0.0009245	113600862.22	108301.4	2021-05-27 23:38:48	2021-05-27 23:38:48	2
334092	XTZ	2021-07-28	2.81	2.861	2.899	2.763	2649864.62	7504262.96	2021-07-29 22:53:17	2021-07-29 22:53:17	5
3450	FIL	2020-09-24	42.02	40.58	43.29	41.07	138.5	5819.19	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3451	FIL	2020-09-25	41.2	42.02	41.82	40.88	38.02	1566.59	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3452	FIL	2020-09-26	41.21	41.2	41.36	41.04	53.63	2210.02	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3453	FIL	2020-09-27	41.4	41.21	41.58	41.22	36.34	1504.51	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3454	FIL	2020-09-28	40.65	41.4	42.96	40.36	80.66	3278.47	2021-05-07 19:24:30	2021-05-07 19:24:30	13
2327	OCN	2020-08-30	0.0005706	0.0005543	0.000665	0.000562	49221315.72	28086.82	2021-05-09 17:34:37	2021-05-09 17:34:37	2
314946	ETH	2021-06-17	2372.31	2367.7	2458.97	2306.4	364787.43	866421709.08	2021-06-18 23:43:55	2021-06-18 23:43:55	10
309334	DOT	2021-06-05	23.79	25.03	26.39	22.97	1076337.29	26457269.39	2021-06-06 23:41:03	2021-06-06 23:41:03	4
299226	FIL	2021-05-16	107.78	110.39	116.09	100.12	877310.37	94743476.27	2021-05-17 23:36:31	2021-05-17 23:36:31	13
331330	ANT	2021-07-22	3.346	3.285	3.379	3.275	330573.56	1106173.54	2021-07-23 23:51:54	2021-07-23 23:51:54	14
340072	ETH	2021-08-10	3141.67	3164.94	3233.77	3053.01	484015.04	1519739099.13	2021-08-11 23:56:16	2021-08-11 23:56:16	10
326260	FIL	2021-07-11	55.1	54.26	55.76	53.98	41194.25	2258042.8	2021-07-12 23:49:24	2021-07-12 23:49:24	13
345244	ZRX	2021-08-21	1.07	1.058	1.087	1.026	7665486.02	8080155.12	2021-08-22 22:58:49	2021-08-22 22:58:49	6
3455	FIL	2020-09-29	42.16	40.65	42.19	37.6	72.45	3054.62	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3456	FIL	2020-09-30	42.07	42.16	43.28	41.89	38	1598.74	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3457	FIL	2020-10-01	40.9	42.07	42.36	39.79	98.6	4032.52	2021-05-07 19:24:30	2021-05-07 19:24:30	13
334534	OCN	2021-07-29	0.0008818	0.0008514	0.0009771	0.000858	33119745.66	29204.95	2021-07-30 22:53:31	2021-07-30 22:53:31	2
366334	FIL	2021-10-04	69.7	69.1	70.67	65.71	540155.14	36744390.02	2021-10-05 23:08:58	2021-10-05 23:08:58	13
331852	BCH	2021-07-23	455.79	442.18	463.87	452.43	139585.37	63622148.45	2021-07-24 20:52:07	2021-07-24 20:52:07	8
371680	XTZ	2021-10-15	6.845	7.137	7.145	6.741	7218810.85	49925777.41	2021-10-16 23:11:36	2021-10-16 23:11:36	5
361592	BTC	2021-09-24	42848.41	44893.87	45143.18	40807.2	58266.89	2485627074.25	2021-09-25 23:06:37	2021-09-25 23:06:37	7
350898	OCN	2021-09-02	0.001061	0.001072	0.001098	0.001061	1750970.76	1857	2021-09-03 23:01:34	2021-09-03 23:01:34	2
355946	BCH	2021-09-12	647.06	636.47	655.18	623.74	36785.56	23679118.26	2021-09-13 23:03:51	2021-09-13 23:03:51	8
378296	FIL	2021-10-28	58.15	55.36	59.23	54.67	628606.14	35858980.94	2021-10-29 23:14:29	2021-10-29 23:14:29	13
376738	ATOM	2021-10-25	35.29	34.26	35.55	34.16	1692310.76	59203233.13	2021-10-26 23:13:47	2021-10-26 23:13:47	3
383592	EOS	2021-11-07	4.603	4.448	4.603	4.425	3200397.07	14444218.61	2021-11-08 23:16:45	2021-11-08 23:16:45	9
345264	BCH	2021-08-21	676.29	694.13	700.1	672.21	46375.03	31848011.98	2021-08-22 23:58:49	2021-08-22 23:58:49	8
345254	DOT	2021-08-21	27.89	28.14	29.35	27.54	1408157.28	40026231.38	2021-08-22 23:58:49	2021-08-22 23:58:49	4
350900	BTC	2021-09-02	49280.77	48840.01	50374.89	48632.7	32516.15	1615790894.94	2021-09-03 23:01:34	2021-09-03 23:01:34	7
384080	ETH	2021-11-08	4810.97	4617.13	4823.95	4616.63	295621.95	1401093512.37	2021-11-09 23:16:58	2021-11-09 23:16:58	10
384102	OCN	2021-11-08	0.0006755	0.000633	0.0006755	0.0006755	36002595.46	24319.44	2021-11-09 23:21:38	2021-11-09 23:21:38	2
361594	ATOM	2021-09-24	42.59	41.5	44.44	35.92	7817554.06	312009904.61	2021-09-25 22:06:37	2021-09-25 22:06:37	3
366760	FIL	2021-10-05	70.99	69.7	72.95	68.53	461089.17	32641081.28	2021-10-06 23:09:12	2021-10-06 23:09:12	13
334094	EOS	2021-07-28	3.917	3.76	4.014	3.687	5343227.08	20791796.25	2021-07-29 23:53:17	2021-07-29 23:53:17	9
309336	FIL	2021-06-05	88.13	87.93	93	85.85	544708.47	48457359.81	2021-06-06 23:41:04	2021-06-06 23:41:04	13
304556	ATOM	2021-05-26	15.21	13.79	15.22	14	1630369.74	24793352.12	2021-05-27 23:38:48	2021-05-27 23:38:48	3
344826	OCN	2021-08-20	0.001117	0.001115	0.00115	0.001085	472672.08	528.17	2021-08-21 23:58:35	2021-08-21 23:58:35	2
320184	SJCX	2021-06-28	0.001379	0.001389	0.001379	0.001379	0	0	2021-06-29 22:46:27	2021-06-29 22:46:27	11
326262	ANT	2021-07-11	3.815	3.616	3.922	3.689	669561.03	2554624.42	2021-07-12 22:49:23	2021-07-12 22:49:23	14
299228	DOT	2021-05-16	42.5	43.55	46.68	39.34	2310331.4	97162504.84	2021-05-17 23:36:34	2021-05-17 23:36:34	4
355950	SJCX	2021-09-12	0.001842	0.001807	0.001842	0.001842	0	0	2021-09-13 22:03:50	2021-09-13 22:03:50	11
340074	ZRX	2021-08-10	0.9741	0.9562	0.9889	0.9221	7675531.62	7359360.09	2021-08-11 22:56:16	2021-08-11 22:56:16	6
331332	ETH	2021-07-22	2024.74	1994.98	2046.29	1949.15	382331.84	764626427.4	2021-07-23 23:51:54	2021-07-23 23:51:54	10
314948	BTC	2021-06-17	38082.3	38345.41	39537.42	37386.57	41591.09	1599770630.8	2021-06-18 23:43:55	2021-06-18 23:43:55	7
376740	ANT	2021-10-25	4.564	4.53	4.751	4.554	225567.15	1029599.46	2021-10-26 23:13:48	2021-10-26 23:13:48	14
378298	ATOM	2021-10-28	38.05	36.77	40.67	36.16	3617155.21	140421952.24	2021-10-29 23:14:29	2021-10-29 23:14:29	3
371682	SJCX	2021-10-15	0.002467	0.002294	0.002467	0.002467	0	0	2021-10-16 21:11:29	2021-10-16 21:11:29	11
1544	ETH	2020-07-10	241.22	242.15	243.55	238.81	534225.39	128868072.5	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1545	ETH	2020-07-11	239.24	241.22	240.35	237.49	434730.97	104005761.96	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1546	ETH	2020-07-12	242.66	239.24	242.94	238.85	564517.75	136986885.16	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1547	ETH	2020-07-13	239.54	242.66	242.96	237.14	699226.6	167491682.32	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1548	ETH	2020-07-14	240.47	239.54	241.77	239.08	555917.92	133683082.42	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1549	ETH	2020-07-15	238.47	240.47	239.3	236.08	511304.02	121931757.09	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1550	ETH	2020-07-16	233.61	238.42	239.17	230.11	354658.04	82733057.02	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1551	ETH	2020-07-17	232.77	233.54	234.87	231.67	513009.25	119410906.81	2021-05-07 19:24:30	2021-05-07 19:24:30	10
299230	XTZ	2021-05-16	5.684	5.789	6.223	5.355	6068360.91	35186397.5	2021-05-17 23:36:32	2021-05-17 23:36:32	5
309338	XTZ	2021-06-05	3.43	3.557	3.69	3.275	2846484.07	9883652.55	2021-06-06 23:41:03	2021-06-06 23:41:03	5
304980	FIL	2021-05-27	71.35	74.55	74.56	69.06	537134.42	38424430.65	2021-05-28 23:39:01	2021-05-28 23:39:01	13
2134	ZRX	2021-02-19	1.553	1.609	1.631	1.508	14804596.89	22960198.84	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2135	ZRX	2021-02-20	1.533	1.553	1.692	1.469	19254074.4	30844948.52	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2136	ZRX	2021-02-21	1.722	1.533	1.751	1.494	10265081.84	16275816.02	2021-05-09 17:34:36	2021-05-09 17:34:36	6
314950	ATOM	2021-06-17	13.61	13.42	14.67	13.29	1795602.97	25121330.64	2021-06-18 23:43:55	2021-06-18 23:43:55	3
2137	ZRX	2021-02-22	1.559	1.722	1.925	1.321	22014638.87	37757365.83	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2138	ZRX	2021-02-23	1.581	1.559	1.884	1.182	9809481.66	15235433.45	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2139	ZRX	2021-02-24	1.524	1.581	1.667	1.428	2456139.06	3769216.31	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2140	ZRX	2021-02-25	1.395	1.524	1.583	1.383	1559028.48	2326988	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2248	OCN	2020-06-12	0.0003183	0.0003016	0.0003326	0.0003064	23821363.5	7582.43	2021-05-09 17:34:37	2021-05-09 17:34:37	2
3484	FIL	2020-10-28	33.67	35.18	35.53	32.4	100323.56	3377557.98	2021-05-07 19:24:30	2021-05-07 19:24:30	13
2249	OCN	2020-06-13	0.0003192	0.0003183	0.0003263	0.0003121	17026609.66	5434.92	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2250	OCN	2020-06-14	0.0003173	0.0003192	0.0003382	0.0003034	23634871.28	7499.48	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2251	OCN	2020-06-15	0.0003118	0.0003173	0.0003188	0.0003026	23469880.73	7318.45	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2252	OCN	2020-06-16	0.0003201	0.0003118	0.0003271	0.000313	10852206.6	3473.53	2021-05-09 17:34:37	2021-05-09 17:34:37	2
3485	FIL	2020-10-29	32.62	33.67	34.76	32.17	119777.34	3907000.54	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3486	FIL	2020-10-30	29.28	32.62	32.87	28.64	248809.91	7283989.76	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3487	FIL	2020-10-31	31.33	29.28	32.18	28.92	138463.77	4338587.87	2021-05-07 19:24:30	2021-05-07 19:24:30	13
2141	ZRX	2021-02-26	1.315	1.395	1.415	1.249	2634844.87	3507447.41	2021-05-09 17:34:36	2021-05-09 17:34:36	6
3502	FIL	2020-11-15	27.75	29.29	29.22	27.62	89561.08	2485019.81	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3503	FIL	2020-11-16	27.51	27.75	29.1	27.19	99548.22	2738253.15	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3504	FIL	2020-11-17	29.14	27.51	31.23	28.87	158580.81	4620914.44	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3505	FIL	2020-11-18	28.83	29.14	29.92	27.6	113066.32	3259876.54	2021-05-07 19:24:30	2021-05-07 19:24:30	13
2253	OCN	2020-06-17	0.0003156	0.0003201	0.0003319	0.0003132	13920312.17	4392.92	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2254	OCN	2020-06-18	0.0003145	0.0003156	0.0003191	0.0003099	10316947.7	3244.54	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2255	OCN	2020-06-19	0.0003202	0.0003145	0.0003339	0.000311	23850586.85	7636.81	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2181	ZRX	2021-04-07	1.71	1.923	1.94	1.595	16054886.35	27940161.69	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2182	ZRX	2021-04-08	1.852	1.71	1.86	1.705	6209348.5	11154220.56	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2183	ZRX	2021-04-09	2.155	1.852	2.365	1.826	34540575.81	73947172.33	2021-05-09 17:34:36	2021-05-09 17:34:36	6
3506	FIL	2020-11-19	28.88	28.83	29.82	28.43	47712.55	1377743.62	2021-05-07 19:24:30	2021-05-07 19:24:30	13
2184	ZRX	2021-04-10	2.181	2.155	2.368	2.084	19545882.93	43676751.73	2021-05-09 17:34:36	2021-05-09 17:34:36	6
9057	ANT	2020-09-14	5.541	4.96	5.989	5.011	1141358.05	6324236.49	2021-05-09 17:34:37	2021-05-09 17:34:37	14
331334	BTC	2021-07-22	32299.47	32139.48	32604.4	31738.48	24409.69	785311959.3	2021-07-23 23:51:54	2021-07-23 23:51:54	7
3507	FIL	2020-11-20	29.07	28.88	30.81	28.87	91910.49	2672161.33	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3508	FIL	2020-11-21	29.96	29.07	31.01	28.73	180958.57	5422225.24	2021-05-07 19:24:30	2021-05-07 19:24:30	13
9058	ANT	2020-09-15	4.341	5.541	5.876	4.327	1253640.77	5441513.11	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9059	ANT	2020-09-16	4.399	4.341	4.598	4.259	483457.86	2126864.39	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9060	ANT	2020-09-17	4.305	4.399	4.612	4.216	352262.69	1516393.5	2021-05-09 17:34:37	2021-05-09 17:34:37	14
3509	FIL	2020-11-22	28.95	29.96	29.97	28.62	85741.6	2482601.46	2021-05-07 19:24:30	2021-05-07 19:24:30	13
2185	ZRX	2021-04-11	2.128	2.181	2.25	2.031	10476909.02	22251857.63	2021-05-09 17:34:36	2021-05-09 17:34:36	6
9061	ANT	2020-09-18	4.313	4.305	4.523	4.252	290158.34	1251397.8	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9062	ANT	2020-09-19	4.221	4.313	4.378	4.112	308202.23	1300810.26	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9063	ANT	2020-09-20	3.757	4.221	4.193	3.725	385979.47	1450169.8	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9064	ANT	2020-09-21	3.171	3.757	3.706	2.971	903782.28	2866148.31	2021-05-09 17:34:37	2021-05-09 17:34:37	14
320186	ATOM	2021-06-28	10.9	10.08	10.9	9.924	891622.07	9200433.74	2021-06-29 23:46:27	2021-06-29 23:46:27	3
340076	BCH	2021-08-10	592.65	592.09	606.29	573.84	77735.66	45783923.19	2021-08-11 22:56:16	2021-08-11 22:56:16	8
326696	OCN	2021-07-12	0.001464	0.0008348	0.001545	0.0007725	184243864.01	269672.88	2021-07-13 22:49:37	2021-07-13 22:49:37	2
340100	DOT	2021-08-10	20.62	20.58	21.41	20.1	3711256.6	76669454.76	2021-08-11 23:56:16	2021-08-11 23:56:16	4
334096	BTC	2021-07-28	40030.01	39496.69	40906.09	38809.89	66747.14	2662886395.8	2021-07-29 23:53:17	2021-07-29 23:53:17	7
345248	ETH	2021-08-21	3226.59	3286.5	3310.73	3208.73	213473.54	697445564.75	2021-08-22 23:58:49	2021-08-22 23:58:49	10
350902	FIL	2021-09-02	77.41	78.65	79.6	77.07	327195.14	25621108.41	2021-09-03 23:01:34	2021-09-03 23:01:34	13
356376	DOT	2021-09-13	34.85	35.82	38.01	31.7	12617579.67	446081062.59	2021-09-14 23:04:06	2021-09-14 23:04:06	4
361596	XTZ	2021-09-24	7.004	6.21	7.394	5.807	35870075.43	235361722.58	2021-09-25 23:06:37	2021-09-25 23:06:37	5
366768	BTC	2021-10-05	51504.27	49276.91	51885.03	49087.72	40687.89	2049372160.16	2021-10-06 23:09:12	2021-10-06 23:09:12	7
372182	BTC	2021-10-16	60877.77	61684.96	62341.46	60153.79	22943.96	1404879137.37	2021-10-17 23:11:43	2021-10-17 23:11:43	7
372204	OCN	2021-10-16	0.0006088	0.0006168	0.0006088	0.0006088	30916271.6	18821.14	2021-10-17 23:11:44	2021-10-17 23:11:44	2
3530	FIL	2020-12-13	30.04	30.01	30.4	29.88	167453.89	5040800.33	2021-05-07 19:24:30	2021-05-07 19:24:30	13
1104	SJCX	2020-04-27	0.0003115	0.0006931	0.002336	0.0001557	839	0.2613	2021-04-27 14:21:33	2021-04-27 14:21:33	11
1102	SJCX	2020-04-25	0.007396	0.0006008	0.007396	0.0006038	1645	12.17	2021-04-24 20:28:41	2021-04-24 20:28:41	11
2876	BTC	2021-03-01	49635.07	45261.03	49812.2	45058.98	65660.6	3146266419.71	2021-05-09 17:34:36	2021-05-09 17:34:36	7
1103	SJCX	2020-04-26	0.0006931	0.007396	0.007547	0.0006931	401	0.2779	2021-04-26 23:28:51	2021-04-26 23:28:51	11
2877	BTC	2021-03-02	48501.21	49635.07	50221.14	47097.84	43281.84	2105387914.68	2021-05-09 17:34:36	2021-05-09 17:34:36	7
4556	EOS	2020-10-02	2.481	2.548	2.556	2.421	1367779.68	3385414.27	2021-05-09 17:34:36	2021-05-09 17:34:36	9
3531	FIL	2020-12-14	29.36	30.04	30.2	29.04	201616.69	5972792.4	2021-05-07 19:24:30	2021-05-07 19:24:30	13
20	XTZ	2020-05-11	2.427	2.565	2.597	2.27	5184953.95	12714701.12	2021-05-07 19:24:31	2021-05-07 19:24:31	5
4557	EOS	2020-10-03	2.48	2.481	2.505	2.473	296336.26	737179.41	2021-05-09 17:34:36	2021-05-09 17:34:36	9
2276	OCN	2020-07-10	0.0005234	0.0003341	0.0005886	0.0003256	181411788.58	94955.59	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2277	OCN	2020-07-11	0.000433	0.0005234	0.000567	0.0004163	216393357.44	93707.52	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2278	OCN	2020-07-12	0.0004031	0.000433	0.0004517	0.0004007	52453628.86	21144.81	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2279	OCN	2020-07-13	0.0004551	0.0004031	0.0004719	0.0003952	147922177.07	67320.42	2021-05-09 17:34:37	2021-05-09 17:34:37	2
1838	ZRX	2020-04-29	0.2137	0.2046	0.215	0.2027	6887952.56	1440161.98	2021-04-27 14:15:28	2021-04-27 14:15:28	6
9094	ANT	2020-10-21	3.024	2.906	3.13	2.976	1109475.45	3354651.07	2021-05-09 17:34:37	2021-05-09 17:34:37	14
4558	EOS	2020-10-04	2.519	2.48	2.535	2.468	514207.67	1291333.05	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4559	EOS	2020-10-05	2.529	2.519	2.54	2.494	485789.13	1222123.02	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4560	EOS	2020-10-06	2.696	2.529	2.975	2.49	7265412.71	20002561.57	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4562	EOS	2020-10-08	2.61	2.647	2.657	2.507	2770632.72	7206102.04	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4563	EOS	2020-10-09	2.646	2.61	2.658	2.585	975885.38	2566192.53	2021-05-09 17:34:36	2021-05-09 17:34:36	9
9095	ANT	2020-10-22	3.179	3.009	3.184	3.009	268464.28	853371.21	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9096	ANT	2020-10-23	3.342	3.179	3.4	3.12	283443.74	947177.93	2021-05-09 17:34:37	2021-05-09 17:34:37	14
21	XTZ	2020-05-12	2.511	2.427	2.587	2.416	2450457.9	6193930.54	2021-05-07 19:24:31	2021-05-07 19:24:31	5
9097	ANT	2020-10-24	3.314	3.342	3.402	3.293	153336.8	508211.49	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9098	ANT	2020-10-25	3.166	3.314	3.312	3.155	146198.45	462923.62	2021-05-09 17:34:37	2021-05-09 17:34:37	14
309340	ZRX	2021-06-05	1.042	1.068	1.14	1.01	5279778.02	5651196.76	2021-06-06 23:41:03	2021-06-06 23:41:03	6
299232	ETH	2021-05-16	3586.18	3644.04	3879.08	3350.54	1031364.39	3696212448.72	2021-05-17 23:36:31	2021-05-17 23:36:31	10
9099	ANT	2020-10-26	3.023	3.166	3.195	3.007	80915.67	244604.77	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9100	ANT	2020-10-27	3.338	3.023	3.635	3.144	524960.59	1752222.11	2021-05-09 17:34:37	2021-05-09 17:34:37	14
326698	ETH	2021-07-12	2032.88	2140.45	2168.12	2007.79	343756.4	713106274.89	2021-07-13 23:49:37	2021-07-13 23:49:37	10
304982	ATOM	2021-05-27	14.48	15.27	15.3	13.64	578988.46	8417837.62	2021-05-28 23:39:01	2021-05-28 23:39:01	3
320208	ETH	2021-06-28	2083.8	1983.33	2143.6	1961.83	638008.18	1308344183.96	2021-06-29 23:46:27	2021-06-29 23:46:27	10
334098	ZRX	2021-07-28	0.7072	0.7106	0.7254	0.6897	4544266.3	3215861.9	2021-07-29 21:53:16	2021-07-29 21:53:16	6
4564	EOS	2020-10-10	2.642	2.646	2.721	2.638	1305055.18	3508190.4	2021-05-09 17:34:36	2021-05-09 17:34:36	9
1107	SJCX	2020-04-30	0.0003455	0.0003514	0.0003455	0.0003455	0	0	2021-04-30 16:57:57	2021-04-30 16:57:57	11
314952	FIL	2021-06-17	68.87	69.64	72.04	67.08	337284.81	23543247.65	2021-06-18 23:43:56	2021-06-18 23:43:56	13
340078	FIL	2021-08-10	66.72	67.71	69.74	65.04	456408.29	30771276.07	2021-08-11 23:56:16	2021-08-11 23:56:16	13
331336	FIL	2021-07-22	45.58	46.19	46.94	44.6	197416.81	8984915.18	2021-07-23 23:51:54	2021-07-23 23:51:54	13
1108	SJCX	2020-05-01	0.0003532	0.0003455	0.0003532	0.0003532	0	0	2021-05-01 22:04:03	2021-05-01 22:04:03	11
1105	SJCX	2020-04-28	0.0003104	0.0003115	0.0003104	0.0003104	756	0.2347	2021-04-28 19:33:34	2021-04-28 19:33:34	11
22	XTZ	2020-05-13	2.572	2.511	2.592	2.49	1741669.23	4449376.98	2021-05-07 19:24:31	2021-05-07 19:24:31	5
23	XTZ	2020-05-14	2.55	2.572	2.617	2.5	2250323.94	5747452.39	2021-05-07 19:24:31	2021-05-07 19:24:31	5
24	XTZ	2020-05-15	2.487	2.55	2.554	2.443	2666242.61	6666263.9	2021-05-07 19:24:31	2021-05-07 19:24:31	5
1106	SJCX	2020-04-29	0.0003514	0.0003104	0.0003514	0.0003514	0	0	2021-04-28 19:33:34	2021-04-28 19:33:34	11
25	XTZ	2020-05-16	2.63	2.487	2.664	2.473	3604087.9	9300433.27	2021-05-07 19:24:31	2021-05-07 19:24:31	5
4565	EOS	2020-10-11	2.66	2.642	2.689	2.62	771720.69	2049131.37	2021-05-09 17:34:36	2021-05-09 17:34:36	9
430	DOT	2020-06-24	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
431	DOT	2020-06-25	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
432	DOT	2020-06-26	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
434	DOT	2020-06-28	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
435	DOT	2020-06-29	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
436	DOT	2020-06-30	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
437	DOT	2020-07-01	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
438	DOT	2020-07-02	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
439	DOT	2020-07-03	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
440	DOT	2020-07-04	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
441	DOT	2020-07-05	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
361598	EOS	2021-09-24	4.033	4.377	4.391	3.79	11171791.42	45251494.26	2021-09-25 23:06:37	2021-09-25 23:06:37	9
345274	EOS	2021-08-21	5.361	5.462	5.647	5.318	4723726.82	25781054.54	2021-08-22 22:58:49	2021-08-22 22:58:49	9
350904	BCH	2021-09-02	664.68	656.04	674.16	653.58	54403.88	36173749.79	2021-09-03 22:01:34	2021-09-03 22:01:34	8
356382	FIL	2021-09-13	78.06	83.8	84.56	73.05	559703.02	44286824.73	2021-09-14 23:04:04	2021-09-14 23:04:04	13
366772	ANT	2021-10-05	4.931	4.761	5.315	4.861	283304.33	1396978.98	2021-10-06 23:09:22	2021-10-06 23:09:22	14
372184	DOT	2021-10-16	41.69	43.31	44.74	41.28	4991361.02	215072070.91	2021-10-17 23:11:43	2021-10-17 23:11:43	4
376758	XTZ	2021-10-25	6.627	6.477	6.718	6.422	4505382.26	29622727.82	2021-10-26 23:13:47	2021-10-26 23:13:47	5
378302	ANT	2021-10-28	4.463	4.393	4.594	4.376	192133.22	857437.22	2021-10-29 23:14:29	2021-10-29 23:14:29	14
384084	FIL	2021-11-08	64.27	62.59	64.95	62.26	406598.68	25833305.68	2021-11-09 23:16:58	2021-11-09 23:16:58	13
334132	SJCX	2021-07-28	0.001601	0.00158	0.001601	0.001601	0	0	2021-07-29 23:53:17	2021-07-29 23:53:17	11
456	DOT	2020-07-20	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
457	DOT	2020-07-21	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
458	DOT	2020-07-22	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
459	DOT	2020-07-23	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
483	DOT	2020-08-16	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
484	DOT	2020-08-17	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
485	DOT	2020-08-18	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
486	DOT	2020-08-19	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
487	DOT	2020-08-20	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
488	DOT	2020-08-21	2.848	2.869	3.218	2.848	44664.81	206111.81	2021-05-09 17:34:36	2021-05-09 17:34:36	4
489	DOT	2020-08-22	4.512	2.848	4.524	2.8	412163.59	1564976.41	2021-05-09 17:34:36	2021-05-09 17:34:36	4
490	DOT	2020-08-23	4.053	4.512	4.512	3.73	72324.75	295346.26	2021-05-09 17:34:36	2021-05-09 17:34:36	4
331338	SJCX	2021-07-22	0.001292	0.001286	0.001292	0.001292	0	0	2021-07-23 23:51:55	2021-07-23 23:51:55	11
372186	FIL	2021-10-16	66.5	67.26	69.21	66.11	351902.63	23768749.11	2021-10-17 23:11:43	2021-10-17 23:11:43	13
350906	DOT	2021-09-02	31.82	33.2	33.2	31.37	1593318.95	51429505.29	2021-09-03 23:01:35	2021-09-03 23:01:35	4
350930	ANT	2021-09-02	7.079	5.284	8.71	5.225	434626.6	3147040.96	2021-09-03 23:01:35	2021-09-03 23:01:35	14
309342	SJCX	2021-06-05	0.001422	0.001474	0.001422	0.001422	0	0	2021-06-06 23:41:04	2021-06-06 23:41:04	11
356386	OCN	2021-09-13	0.0009199	0.0009535	0.001018	0.0008871	12995552.49	11954.76	2021-09-14 23:04:05	2021-09-14 23:04:05	2
361600	ZRX	2021-09-24	0.9181	0.9956	0.9978	0.8402	9193050.59	8371912.37	2021-09-25 23:06:38	2021-09-25 23:06:38	6
334544	EOS	2021-07-29	3.967	3.917	3.98	3.804	1949907.98	7564059.17	2021-07-30 23:53:31	2021-07-30 23:53:31	9
314954	SJCX	2021-06-17	0.001523	0.001534	0.001523	0.001523	0	0	2021-06-18 23:43:56	2021-06-18 23:43:56	11
376760	FIL	2021-10-25	63.93	62.58	65.36	62.31	328509.8	20983694.06	2021-10-26 23:13:47	2021-10-26 23:13:47	13
320680	ETH	2021-06-29	2165.61	2083.8	2245.38	2075.64	455104.86	990499298.9	2021-06-30 23:46:41	2021-06-30 23:46:41	10
320654	OCN	2021-06-29	0.0005197	0.000521	0.0006064	0.0005197	23394144.66	12159.02	2021-06-30 23:46:41	2021-06-30 23:46:41	2
299234	ZRX	2021-05-16	1.57	1.554	1.699	1.475	15171632.55	24231785.18	2021-05-17 23:36:34	2021-05-17 23:36:34	6
340080	SJCX	2021-08-10	0.001824	0.001852	0.001824	0.001824	0	0	2021-08-11 22:56:16	2021-08-11 22:56:16	11
331812	SJCX	2021-07-23	0.001346	0.001292	0.001346	0.001346	0	0	2021-07-24 22:52:08	2021-07-24 22:52:08	11
304984	ETH	2021-05-27	2742.48	2888.94	2891.49	2641.48	825746.35	2281995472.98	2021-05-28 23:39:01	2021-05-28 23:39:01	10
331828	OCN	2021-07-23	0.000829	0.0008301	0.0008927	0.000829	45161585.87	37437.7	2021-07-24 23:52:08	2021-07-24 23:52:08	2
367296	BTC	2021-10-06	55345.85	51504.27	55656.67	50439.32	64415.98	3444996109.53	2021-10-07 23:09:25	2021-10-07 23:09:25	7
326700	FIL	2021-07-12	52.51	55.1	55.44	52.18	187359.95	10046756.76	2021-07-13 23:49:37	2021-07-13 23:49:37	13
378304	BCH	2021-10-28	579.04	548.85	592.16	544.45	75209.05	42794838.48	2021-10-29 23:14:29	2021-10-29 23:14:29	8
366794	XTZ	2021-10-05	7.936	8.331	8.537	7.711	14113963.71	114479629.76	2021-10-06 23:09:11	2021-10-06 23:09:11	5
345278	FIL	2021-08-21	78.4	73.11	78.73	71.55	562428.24	41852929.84	2021-08-22 23:58:49	2021-08-22 23:58:49	13
384086	XTZ	2021-11-08	6.488	6.375	6.564	6.294	5481443.14	35240272.89	2021-11-09 23:16:58	2021-11-09 23:16:58	5
299236	ATOM	2021-05-16	24.3	24.5	26.64	22.65	1822801.87	44832264.42	2021-05-17 23:36:31	2021-05-17 23:36:31	3
3532	FIL	2020-12-15	29.15	29.36	29.8	29.02	218163.46	6401687.14	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3533	FIL	2020-12-16	28.41	29.15	29.57	27.83	224245.76	6490207.64	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3560	FIL	2021-01-12	21	21.66	21.99	20.94	189495.31	4060777.99	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3561	FIL	2021-01-13	21.69	21	21.92	20.94	184838	3966405.79	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3562	FIL	2021-01-14	21.55	21.69	22.31	21.38	311755.21	6779168.58	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3563	FIL	2021-01-15	21.52	21.55	22.24	21.23	295258.75	6387058.09	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3564	FIL	2021-01-16	22.83	21.52	24.97	21.5	814074.54	18720438.43	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3565	FIL	2021-01-17	24.32	22.83	26.09	22.41	1360936.48	33337889.4	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3566	FIL	2021-01-18	23.72	24.32	24.89	23.51	588053.86	14128441.44	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3567	FIL	2021-01-19	22.69	23.72	24.21	22.69	543475.99	12766592.11	2021-05-07 19:24:30	2021-05-07 19:24:30	13
578	DOT	2020-11-19	4.757	4.688	4.85	4.548	431893.15	2036900.96	2021-05-09 17:34:36	2021-05-09 17:34:36	4
579	DOT	2020-11-20	5.238	4.757	5.476	4.753	1678072.59	8817210.64	2021-05-09 17:34:36	2021-05-09 17:34:36	4
8961	ANT	2020-06-10	1.128	1.068	1.694	0.8499	244891.45	276156.68	2021-05-09 17:34:37	2021-05-09 17:34:37	14
8962	ANT	2020-06-11	1.084	1.128	1.494	1.022	139498.81	151268.49	2021-05-09 17:34:37	2021-05-09 17:34:37	14
320688	SJCX	2021-06-29	0.001436	0.001379	0.001436	0.001436	0	0	2021-06-30 21:46:40	2021-06-30 21:46:40	11
320656	BTC	2021-06-29	35901.41	34487.11	36624.75	34243.82	44215.51	1578253520.29	2021-06-30 23:46:41	2021-06-30 23:46:41	7
326702	BTC	2021-07-12	33088.51	34249.3	34658.46	32660.38	31074.01	1039311244.06	2021-07-13 23:49:37	2021-07-13 23:49:37	7
331340	EOS	2021-07-22	3.566	3.5	3.58	3.427	1658372.54	5836808.46	2021-07-23 23:51:55	2021-07-23 23:51:55	9
345710	XTZ	2021-08-22	3.803	3.695	3.883	3.676	3519668.49	13282880.77	2021-08-23 22:59:02	2021-08-23 22:59:02	5
305008	SJCX	2021-05-27	0.001542	0.001572	0.001542	0.001542	0	0	2021-05-28 23:39:01	2021-05-28 23:39:01	11
304986	DOT	2021-05-27	23.9	24.55	24.94	21.82	1628958.65	38454974.06	2021-05-28 23:39:01	2021-05-28 23:39:01	4
340086	EOS	2021-08-10	4.598	4.541	4.715	4.409	3606799.29	16459456.81	2021-08-11 23:56:16	2021-08-11 23:56:16	9
340082	ANT	2021-08-10	4.583	4.586	4.619	4.468	258895.37	1186492.5	2021-08-11 23:56:16	2021-08-11 23:56:16	14
361602	SJCX	2021-09-24	0.001714	0.001796	0.001714	0.001714	0	0	2021-09-25 23:06:38	2021-09-25 23:06:38	11
356444	BCH	2021-09-13	614.58	647.06	660.03	592.82	99089.92	61490601.69	2021-09-14 23:04:04	2021-09-14 23:04:04	8
321116	XTZ	2021-06-30	3.042	2.974	3.044	2.753	4324644.72	12522752.7	2021-07-01 23:46:54	2021-07-01 23:46:54	5
356388	ETH	2021-09-13	3285.4	3405.32	3429.17	3121.17	523307.23	1700713421.4	2021-09-14 23:04:05	2021-09-14 23:04:05	10
350908	SJCX	2021-09-02	0.001971	0.001954	0.001971	0.001971	0	0	2021-09-03 23:01:37	2021-09-03 23:01:37	11
331806	EOS	2021-07-23	3.635	3.566	3.661	3.458	1480766.36	5255394.89	2021-07-24 23:52:08	2021-07-24 23:52:08	9
309344	BTC	2021-06-05	35538.4	36861.5	37911.76	34846.16	39864.17	1444088532.56	2021-06-06 23:41:04	2021-06-06 23:41:04	7
378306	SJCX	2021-10-28	0.002424	0.002339	0.002424	0.002424	0	0	2021-10-29 23:14:29	2021-10-29 23:14:29	11
314956	XTZ	2021-06-17	3.371	3.115	3.434	3.112	5394079.15	18042321.76	2021-06-18 23:43:56	2021-06-18 23:43:56	5
334528	BTC	2021-07-29	40030.52	40030.01	40633.62	39281.83	31540.85	1257968294.92	2021-07-30 22:53:30	2021-07-30 22:53:30	7
372188	ETH	2021-10-16	3829.61	3868.16	3968.29	3804.18	256819.08	995972602.42	2021-10-17 23:11:43	2021-10-17 23:11:43	10
384088	ANT	2021-11-08	5.124	4.964	5.297	5.011	210730.69	1079700.24	2021-11-09 23:16:59	2021-11-09 23:16:59	14
377226	BTC	2021-10-26	60315.68	63089.04	63290.04	59868.68	28107.19	1738003094.57	2021-10-27 23:14:01	2021-10-27 23:14:01	7
376762	SJCX	2021-10-25	0.002524	0.002435	0.002524	0.002524	0	0	2021-10-26 23:13:50	2021-10-26 23:13:50	11
367262	ETH	2021-10-06	3576.08	3516.09	3626.63	3345.21	447259.09	1577043616.23	2021-10-07 23:09:25	2021-10-07 23:09:25	10
384094	SJCX	2021-11-08	0.002702	0.002532	0.002702	0.002702	0	0	2021-11-09 23:16:59	2021-11-09 23:16:59	11
331802	ZRX	2021-07-23	0.6508	0.6414	0.6529	0.6063	2828616.76	1785467.31	2021-07-24 23:52:08	2021-07-24 23:52:08	6
305012	BCH	2021-05-27	749.64	764.5	806.91	701.59	160764.57	120977845.16	2021-05-28 23:39:02	2021-05-28 23:39:02	8
304988	OCN	2021-05-27	0.000905	0.0009534	0.0009599	0.0008502	111634172.65	101030.98	2021-05-28 23:39:02	2021-05-28 23:39:02	2
299760	ETH	2021-05-17	3280.73	3586.18	3590.01	3117.41	1474599.06	4924404061.32	2021-05-18 23:36:45	2021-05-18 23:36:45	10
299778	ZRX	2021-05-17	1.468	1.57	1.573	1.395	19051012.35	28217776.81	2021-05-18 23:36:46	2021-05-18 23:36:46	6
350928	ZRX	2021-09-02	1.119	1.122	1.143	1.093	8590721.1	9603057.87	2021-09-03 23:01:34	2021-09-03 23:01:34	6
314958	EOS	2021-06-17	4.871	4.862	5.08	4.757	2242740.59	11023848.19	2021-06-18 23:43:56	2021-06-18 23:43:56	9
350910	XTZ	2021-09-02	5.298	5.422	5.442	5.215	5565625.45	29663185.38	2021-09-03 23:01:34	2021-09-03 23:01:34	5
361644	OCN	2021-09-24	0.0008206	0.0009148	0.0009086	0.0008206	11533665.93	9465	2021-09-25 23:06:37	2021-09-25 23:06:37	2
309346	OCN	2021-06-05	0.0008152	0.0008343	0.0009204	0.0007626	62008880.51	50551.23	2021-06-06 23:41:04	2021-06-06 23:41:04	2
372190	BCH	2021-10-16	624.9	625.24	647.84	623.84	66675.71	42399704.55	2021-10-17 23:11:44	2021-10-17 23:11:44	8
320658	EOS	2021-06-29	4.112	3.848	4.291	3.846	3652654.55	15009357.29	2021-06-30 23:46:41	2021-06-30 23:46:41	9
326704	ANT	2021-07-12	3.633	3.815	3.779	3.627	624285.37	2268102.66	2021-07-13 22:49:37	2021-07-13 22:49:37	14
367264	ZRX	2021-10-06	1.037	1.027	1.063	0.9543	10626288.23	10852580.44	2021-10-07 23:09:25	2021-10-07 23:09:25	6
367292	ANT	2021-10-06	4.691	4.931	5.318	4.651	462957.13	2171784.79	2021-10-07 23:09:27	2021-10-07 23:09:27	14
345742	BCH	2021-08-22	672.48	676.29	689.73	653.24	36258.41	24322414.7	2021-08-23 22:59:03	2021-08-23 22:59:03	8
345712	ATOM	2021-08-22	21.89	22.09	24.63	21.03	1328957.62	29842380.72	2021-08-23 23:59:03	2021-08-23 23:59:03	3
334536	XTZ	2021-07-29	2.85	2.81	2.865	2.74	2269334.75	6362254.84	2021-07-30 23:53:31	2021-07-30 23:53:31	5
356884	EOS	2021-09-14	4.857	4.744	4.879	4.707	4780274.28	22973770.34	2021-09-15 22:04:18	2021-09-15 22:04:18	9
340104	ATOM	2021-08-10	14.1	13.63	14.38	13.47	1156738.97	16132060.2	2021-08-11 22:56:16	2021-08-11 22:56:16	3
356838	FIL	2021-09-14	80.81	78.06	81.88	77.49	269493.16	21409096.42	2021-09-15 23:04:18	2021-09-15 23:04:18	13
331342	OCN	2021-07-22	0.0008301	0.0008379	0.0009111	0.0008099	21751559.5	18056.91	2021-07-23 23:51:55	2021-07-23 23:51:55	2
377224	ZRX	2021-10-26	1.068	1.011	1.098	1.006	11170040.42	11896519.64	2021-10-27 23:14:01	2021-10-27 23:14:01	6
384098	DOT	2021-11-08	53.39	52.23	53.88	51.7	3528359.29	187100580.77	2021-11-09 20:16:57	2021-11-09 20:16:57	4
378308	OCN	2021-10-28	0.0006061	0.0005846	0.0006061	0.0006061	27639060.06	16752.06	2021-10-29 23:16:34	2021-10-29 23:16:34	2
384090	BCH	2021-11-08	638.4	600.92	642.56	599.83	92876.95	57665749.37	2021-11-09 23:16:58	2021-11-09 23:16:58	8
3405	FIL	2020-08-10	20.87	20.79	21.89	20.08	123.39	2574.91	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3406	FIL	2020-08-11	20.72	20.87	20.8	19.22	90.25	1869.67	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3407	FIL	2020-08-12	20.97	20.72	21.05	20.81	177.67	3724.88	2021-05-07 19:24:30	2021-05-07 19:24:30	13
320660	XTZ	2021-06-29	2.974	2.702	2.989	2.698	3313532.4	9574820.02	2021-06-30 21:46:40	2021-06-30 21:46:40	5
384092	ZRX	2021-11-08	1.264	1.219	1.278	1.19	8751395.38	10747963.54	2021-11-09 23:16:58	2021-11-09 23:16:58	6
305004	EOS	2021-05-27	7.016	6.437	7.668	6.061	14775017.26	102364746.4	2021-05-28 23:39:01	2021-05-28 23:39:01	9
304990	XTZ	2021-05-27	3.857	3.929	4.167	3.585	7859885	30580338.75	2021-05-28 23:39:02	2021-05-28 23:39:02	5
372192	XTZ	2021-10-16	6.904	6.845	7.137	6.835	4780293.68	33198777.9	2021-10-17 23:11:44	2021-10-17 23:11:44	5
378804	ETH	2021-10-29	4417.4	4288.22	4459.9	4268.45	479793.58	2095769732.29	2021-10-30 23:14:42	2021-10-30 23:14:42	10
326730	ATOM	2021-07-12	13.01	14.07	14.14	12.77	1356894.75	18061843.05	2021-07-13 23:49:37	2021-07-13 23:49:37	3
326706	ZRX	2021-07-12	0.7527	0.7962	0.7962	0.7388	5196893.52	3961534.03	2021-07-13 23:49:37	2021-07-13 23:49:37	6
299762	ATOM	2021-05-17	21.08	24.3	24.3	20.63	2696267.83	59929880.69	2021-05-18 23:36:44	2021-05-18 23:36:44	3
299780	XTZ	2021-05-17	5.175	5.684	5.684	5.041	7714469.72	40826724.61	2021-05-18 23:36:47	2021-05-18 23:36:47	5
377228	ETH	2021-10-26	4129.95	4220.26	4295.04	4094.55	307683.57	1291728236.29	2021-10-27 23:14:01	2021-10-27 23:14:01	10
321106	ETH	2021-06-30	2276.14	2165.61	2287.05	2089.55	518346.72	1128164730.61	2021-07-01 23:46:54	2021-07-01 23:46:54	10
334540	SJCX	2021-07-29	0.001601	0.001601	0.001601	0.001601	0	0	2021-07-30 23:53:31	2021-07-30 23:53:31	11
309348	EOS	2021-06-05	5.778	6.02	6.219	5.641	4106969.21	24200651.07	2021-06-06 23:41:04	2021-06-06 23:41:04	9
314960	DOT	2021-06-17	22.48	23.02	23.98	22.01	838627.58	19407898.73	2021-06-18 23:43:55	2021-06-18 23:43:55	4
350926	ATOM	2021-09-02	24.17	25.41	25.74	23.54	642547.09	15699172.08	2021-09-03 23:01:35	2021-09-03 23:01:35	3
356840	ATOM	2021-09-14	34.17	35.77	37.81	32.78	1472311.44	51428955.87	2021-09-15 22:04:18	2021-09-15 22:04:18	3
331794	DOT	2021-07-23	13.4	13.16	13.52	12.33	2387160.62	31025040.53	2021-07-24 23:52:08	2021-07-24 23:52:08	4
356888	OCN	2021-09-14	0.0009621	0.0009199	0.001065	0.0009277	12313297.86	11846.55	2021-09-15 23:04:18	2021-09-15 23:04:18	2
340542	ETH	2021-08-11	3163.42	3141.67	3274.22	3123.08	429196.89	1379418397.59	2021-08-12 23:56:30	2021-08-12 23:56:30	10
345714	BTC	2021-08-22	49289.71	48867.87	49512.19	48119.98	16835.81	822323898.98	2021-08-23 23:59:03	2021-08-23 23:59:03	7
361646	ANT	2021-09-24	4.752	5.194	4.975	4.495	431238.44	2049197.06	2021-09-25 23:06:37	2021-09-25 23:06:37	14
379340	OCN	2021-10-30	0.0006189	0.0006228	0.001238	0.0006189	277508205.4	171755.13	2021-10-31 23:18:03	2021-10-31 23:18:03	2
367266	FIL	2021-10-06	71.87	70.99	74.7	66.69	667883.25	47270375.56	2021-10-07 23:09:25	2021-10-07 23:09:25	13
4414	EOS	2020-05-13	2.522	2.44	2.556	2.424	4084819.7	10242164.73	2021-05-09 17:34:36	2021-05-09 17:34:36	9
368	DOT	2020-04-23	0	0	0	0	0	0	2021-04-23 22:51:50	2021-04-23 22:51:50	4
345	XTZ	2021-04-01	5.121	4.826	5.34	4.743	9651916.66	48478114.14	2021-05-07 19:24:31	2021-05-07 19:24:31	5
346	XTZ	2021-04-02	5.298	5.121	5.373	4.965	4901796.51	25267163.07	2021-05-07 19:24:31	2021-05-07 19:24:31	5
1915	ZRX	2020-07-15	0.3896	0.395	0.4095	0.3868	7052620.61	2817816.42	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1916	ZRX	2020-07-16	0.4005	0.3896	0.402	0.3674	12492211.42	4804578.73	2021-05-09 17:34:36	2021-05-09 17:34:36	6
9103	ANT	2020-10-30	3.09	3.056	3.1	2.926	256864.29	793793.73	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9104	ANT	2020-10-31	3.096	3.09	3.209	3.034	278023.29	860789.26	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9105	ANT	2020-11-01	3.062	3.096	3.157	3.033	234949.37	719410.91	2021-05-09 17:34:37	2021-05-09 17:34:37	14
369	DOT	2020-04-24	0	0	0	0	0	0	2021-04-24 20:28:41	2021-04-24 20:28:41	4
304992	BTC	2021-05-27	38538.84	39295.08	40408.95	37211.84	46474.62	1804036815.09	2021-05-28 23:39:01	2021-05-28 23:39:01	7
310268	XTZ	2021-06-07	3.488	3.837	4.139	3.443	11260341.51	43772165.55	2021-06-08 23:41:32	2021-06-08 23:41:32	5
3408	FIL	2020-08-13	28.66	20.97	29.19	21.36	522.25	14969.33	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3409	FIL	2020-08-14	28.49	28.66	28.62	21.84	341.78	9738.79	2021-05-07 19:24:30	2021-05-07 19:24:30	13
1917	ZRX	2020-07-17	0.3969	0.4005	0.4137	0.3806	10740085.03	4300266.99	2021-05-09 17:34:36	2021-05-09 17:34:36	6
310304	OCN	2021-06-07	0.0007779	0.0008133	0.0009076	0.000752	53899311.97	41930.22	2021-06-08 23:41:33	2021-06-08 23:41:33	2
1442	SJCX	2021-03-31	0.002352	0.002351	0.002352	0.002352	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1443	SJCX	2021-04-01	0.002349	0.002352	0.002349	0.002349	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1444	SJCX	2021-04-02	0.00236	0.002349	0.00236	0.00236	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
299764	DOT	2021-05-17	38.7	42.54	39.85	36.98	4150668.54	160614586.89	2021-05-18 23:36:45	2021-05-18 23:36:45	4
1445	SJCX	2021-04-03	0.002283	0.00236	0.002283	0.002283	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1446	SJCX	2021-04-04	0.002329	0.002283	0.002329	0.002329	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1447	SJCX	2021-04-05	0.002365	0.002329	0.002365	0.002365	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1448	SJCX	2021-04-06	0.00232	0.002365	0.00232	0.00232	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1449	SJCX	2021-04-07	0.002238	0.00232	0.002238	0.002238	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1462	SJCX	2021-04-20	0.00226	0.002227	0.00226	0.00226	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
2504	OCN	2021-02-23	0.0007575	0.0007112	0.0009311	0.0005839	222163040.49	168295.43	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2505	OCN	2021-02-24	0.0006501	0.0007575	0.0008126	0.0006013	127757258.64	83050.91	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2532	OCN	2021-03-23	0.001151	0.001228	0.001335	0.001118	47522544.4	54717.27	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2533	OCN	2021-03-24	0.001045	0.001151	0.001108	0.001029	15054839.91	15731.38	2021-05-09 17:34:37	2021-05-09 17:34:37	2
9036	ANT	2020-08-24	6.875	6.154	7.401	6.21	1950081.95	13407091.72	2021-05-09 17:34:37	2021-05-09 17:34:37	14
3410	FIL	2020-08-15	28.56	28.49	29.63	25.67	170.23	4861.95	2021-05-07 19:24:30	2021-05-07 19:24:30	13
367	DOT	2020-04-22	0	0	0	0	0	0	2021-04-22 21:03:21	2021-04-22 21:03:21	4
3411	FIL	2020-08-16	32.74	28.56	33.92	28.7	305.52	10002.32	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3412	FIL	2020-08-17	26.77	32.74	33.79	25.71	171.6	4593.28	2021-05-07 19:24:30	2021-05-07 19:24:30	13
334542	FIL	2021-07-29	49.38	49.57	49.76	48.52	195929.52	9609241.63	2021-07-30 22:53:30	2021-07-30 22:53:30	13
3413	FIL	2020-08-18	27.23	26.77	27.69	23.76	108.87	2964.03	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3414	FIL	2020-08-19	30.58	27.23	33.22	26.35	311.99	9539.71	2021-05-07 19:24:30	2021-05-07 19:24:30	13
309806	ANT	2021-06-06	5.556	5.006	6.657	4.8	316691.54	1806590.9	2021-06-07 19:41:15	2021-06-07 19:41:15	14
334582	BCH	2021-07-29	538.41	510.38	550.42	503.18	146629.15	78946673.09	2021-07-30 23:53:31	2021-07-30 23:53:31	8
9037	ANT	2020-08-25	7.27	6.875	7.428	6.477	2100680.16	15271287.87	2021-05-09 17:34:37	2021-05-09 17:34:37	14
3415	FIL	2020-08-20	30.71	30.58	32.79	30.62	115.99	3562.57	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3468	FIL	2020-10-12	46.93	40.46	47.05	40.35	204.5	9597.64	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3469	FIL	2020-10-13	30.87	46.93	51.42	28.57	844.31	26059.72	2021-05-07 19:24:30	2021-05-07 19:24:30	13
9038	ANT	2020-08-26	9.615	7.27	11.81	7.245	4230526.65	40676459.86	2021-05-09 17:34:37	2021-05-09 17:34:37	14
3470	FIL	2020-10-14	20.46	30.87	38.46	18.52	2756.18	56387.16	2021-05-07 19:24:30	2021-05-07 19:24:30	13
9039	ANT	2020-08-27	8.348	9.615	10.19	7.294	3816383.88	31857502.71	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9040	ANT	2020-08-28	7.915	8.315	8.583	7.523	291193.13	2304722.4	2021-05-09 17:34:37	2021-05-09 17:34:37	14
305014	ZRX	2021-05-27	1.102	1.15	1.188	1.025	13955607.23	15609976.67	2021-05-28 23:39:01	2021-05-28 23:39:01	6
9041	ANT	2020-08-29	7.382	7.915	8	7.178	248131.6	1831608.94	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9042	ANT	2020-08-30	8.937	7.382	9.422	7.697	291980.98	2609405.75	2021-05-09 17:34:37	2021-05-09 17:34:37	14
326708	XTZ	2021-07-12	2.813	2.841	2.951	2.763	2976654.2	8526332.42	2021-07-13 23:49:37	2021-07-13 23:49:37	5
314962	ANT	2021-06-17	11.01	5.065	18.36	4.962	2762090.5	30420010.72	2021-06-18 23:43:56	2021-06-18 23:43:56	14
334560	ZRX	2021-07-29	0.7568	0.7072	0.777	0.6881	7103262.18	5261307.12	2021-07-30 23:53:31	2021-07-30 23:53:31	6
320662	ANT	2021-06-29	3.723	3.518	3.888	3.622	874084.15	3254194.5	2021-06-30 23:46:41	2021-06-30 23:46:41	14
340544	EOS	2021-08-11	4.758	4.598	4.975	4.591	4864073.51	23300264.88	2021-08-12 20:56:29	2021-08-12 20:56:29	9
321118	FIL	2021-06-30	60.39	64.5	65.32	56.4	461756.3	27946733.87	2021-07-01 23:46:54	2021-07-01 23:46:54	13
331810	FIL	2021-07-23	47.38	45.58	47.47	44.94	152835.38	7056598.3	2021-07-24 23:52:08	2021-07-24 23:52:08	13
351446	XTZ	2021-09-03	5.312	5.298	5.483	5.121	7186376.05	38091547.02	2021-09-04 23:01:48	2021-09-04 23:01:48	5
351408	BTC	2021-09-03	50019.51	49280.77	51056.15	48362.56	38496.86	1926045807.12	2021-09-04 23:01:48	2021-09-04 23:01:48	7
345716	OCN	2021-08-22	0.001167	0.001226	0.001232	0.001135	6333274.32	7390.89	2021-08-23 23:59:03	2021-08-23 23:59:03	2
356842	DOT	2021-09-14	37.37	34.85	38.77	34.09	8143317.71	300191642.47	2021-09-15 23:04:18	2021-09-15 23:04:18	4
362060	ETH	2021-09-25	2925.34	2930.86	2968.99	2805.35	341606.33	992935823.56	2021-09-26 23:06:51	2021-09-26 23:06:51	10
362048	BTC	2021-09-25	42721.91	42848.41	42992.94	41710.08	16514.92	702558634.37	2021-09-26 23:06:51	2021-09-26 23:06:51	7
362550	XTZ	2021-09-26	6.527	6.831	7.079	6.433	13391915.27	91022391.35	2021-09-27 23:07:05	2021-09-27 23:07:05	5
362532	ATOM	2021-09-26	39.87	39.49	41.68	35.5	4380983.07	170195389.21	2021-09-27 23:07:04	2021-09-27 23:07:04	3
367268	ATOM	2021-10-06	35.16	36.72	36.86	33.01	3162052.14	111482673.6	2021-10-07 23:09:25	2021-10-07 23:09:25	3
372194	ATOM	2021-10-16	33.1	33.07	34.63	32.9	1768863.79	59491581.8	2021-10-17 23:11:44	2021-10-17 23:11:44	3
309808	BTC	2021-06-06	35798.57	35538.4	36453.81	35264.34	27469.69	986275148.28	2021-06-07 23:41:17	2021-06-07 23:41:17	7
1590	ETH	2020-08-25	383.34	408.03	409.1	370.38	657420.71	256111120.78	2021-05-07 19:24:30	2021-05-07 19:24:30	10
4415	EOS	2020-05-14	2.624	2.522	2.65	2.471	9881125.68	25266888.21	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4416	EOS	2020-05-15	2.585	2.624	2.663	2.533	13118849.98	34156459.8	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4417	EOS	2020-05-16	2.632	2.585	2.687	2.571	12566949.43	33116361.21	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4418	EOS	2020-05-17	2.621	2.632	2.671	2.596	9094399.24	23990010.07	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4429	EOS	2020-05-28	2.613	2.569	2.623	2.52	978738.89	2520405.36	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4430	EOS	2020-05-29	2.615	2.613	2.671	2.591	1170428.75	3086437.07	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4431	EOS	2020-05-30	2.772	2.615	2.777	2.6	939518.51	2536117.62	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4455	EOS	2020-06-23	2.572	2.59	2.601	2.558	743453.87	1916577.65	2021-05-09 17:34:36	2021-05-09 17:34:36	9
1832	ZRX	2020-04-23	0.1759	0.1716	0.18	0.1694	4116258.03	719096.21	2021-04-23 22:51:51	2021-04-23 22:51:51	6
351410	ETH	2021-09-03	3939.79	3787.7	4026.86	3712.13	517330.35	2016700978.59	2021-09-04 23:01:48	2021-09-04 23:01:48	10
304994	ANT	2021-05-27	4.888	5.348	6.349	4.734	125758.27	638301.52	2021-05-28 23:39:02	2021-05-28 23:39:02	14
362050	ANT	2021-09-25	4.752	4.74	4.999	4.626	51224.57	247750.11	2021-09-26 22:06:51	2021-09-26 22:06:51	14
4456	EOS	2020-06-24	2.501	2.572	2.6	2.459	1557719.44	3913100.19	2021-05-09 17:34:36	2021-05-09 17:34:36	9
299766	ANT	2021-05-17	6.89	7.694	7.474	6.759	504158.94	3473629.16	2021-05-18 23:36:45	2021-05-18 23:36:45	14
362062	FIL	2021-09-25	60.47	63.36	63.92	58.84	598160.78	36840910.87	2021-09-26 22:06:51	2021-09-26 22:06:51	13
4457	EOS	2020-06-25	2.479	2.501	2.53	2.436	826402.19	2050483.13	2021-05-09 17:34:36	2021-05-09 17:34:36	9
404	DOT	2020-05-29	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
2555	OCN	2021-04-15	0.00214	0.001921	0.002467	0.001938	68141378.9	145789.71	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2556	OCN	2021-04-16	0.002717	0.00214	0.002911	0.001989	62277884.87	169213.7	2021-05-09 17:34:37	2021-05-09 17:34:37	2
9043	ANT	2020-08-31	8.19	8.934	8.918	7.786	2160812.63	17696216.02	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9044	ANT	2020-09-01	7.401	8.19	8.711	7.327	2035895.74	15066669.11	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9045	ANT	2020-09-02	6.342	7.401	7.24	5.972	1305030.06	8276228.62	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9046	ANT	2020-09-03	4.88	6.342	5.675	4.878	712451.75	3476584.83	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9047	ANT	2020-09-04	5.546	4.88	5.836	4.794	461862.1	2561298.51	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9048	ANT	2020-09-05	4.326	5.546	5.44	4.059	638659.38	2763141.44	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9049	ANT	2020-09-06	4.761	4.328	4.867	4.091	154047.95	733470.82	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9050	ANT	2020-09-07	4.541	4.729	4.971	4.228	480670.56	2182651.71	2021-05-09 17:34:37	2021-05-09 17:34:37	14
314964	BCH	2021-06-17	598.76	593.33	620.63	584.09	54425.9	32865512.51	2021-06-18 23:43:55	2021-06-18 23:43:55	8
320664	DOT	2021-06-29	16.26	15.77	17.05	15.75	1291929.16	21276369.96	2021-06-30 22:46:40	2021-06-30 22:46:40	4
320686	ZRX	2021-06-29	0.7267	0.7017	0.7496	0.6946	7244765.13	5228941.65	2021-06-30 22:46:41	2021-06-30 22:46:41	6
378808	DOT	2021-10-29	44.11	41.83	44.38	41.6	4116895.8	178115378.9	2021-10-30 23:14:42	2021-10-30 23:14:42	4
367270	DOT	2021-10-06	32.24	31.4	33.07	29.14	4819838.59	151327826.95	2021-10-07 21:09:24	2021-10-07 21:09:24	4
321114	OCN	2021-06-30	0.0005008	0.0005197	0.0005463	0.000478	19257059.33	9642.99	2021-07-01 23:46:54	2021-07-01 23:46:54	2
310280	FIL	2021-06-07	82.05	87	92.09	80.16	574585.33	50616677.39	2021-06-08 23:41:33	2021-06-08 23:41:33	13
3421	FIL	2020-08-26	33.04	32.75	35.55	33.04	647.21	21381.3	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3422	FIL	2020-08-27	37.25	33.04	39.89	32.64	329.41	12268.9	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3423	FIL	2020-08-28	42.1	37.25	50.25	37.92	352.56	14844.02	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3424	FIL	2020-08-29	43.63	42.1	49.66	41.23	190.6	8315.08	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3425	FIL	2020-08-30	56.26	43.63	57.22	44.52	214.46	12066.13	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3426	FIL	2020-08-31	54.69	56.26	64.12	44.71	646.55	35357.74	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3448	FIL	2020-09-22	40.27	40.48	41.17	40.03	23.26	936.78	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3449	FIL	2020-09-23	40.58	40.27	41.27	39.06	28.69	1164.35	2021-05-07 19:24:30	2021-05-07 19:24:30	13
310306	EOS	2021-06-07	5.191	5.85	5.966	5.089	7215655.44	39934264.28	2021-06-08 23:41:33	2021-06-08 23:41:33	9
378810	ZRX	2021-10-29	1.051	0.9771	1.066	0.9665	11291106.49	11575426.9	2021-10-30 23:14:42	2021-10-30 23:14:42	6
340546	BTC	2021-08-11	45556.69	45601.03	46763.89	45360.51	30818.26	1421598811.69	2021-08-12 23:56:30	2021-08-12 23:56:30	7
377232	FIL	2021-10-26	62.81	63.93	65.34	62.05	449911.95	28758429.17	2021-10-27 23:14:01	2021-10-27 23:14:01	13
332252	ANT	2021-07-24	3.531	3.354	3.613	3.341	37364.69	128482.17	2021-07-25 23:52:22	2021-07-25 23:52:22	14
326710	EOS	2021-07-12	4.191	4.073	4.377	4.046	7381426.63	31232019.77	2021-07-13 23:49:38	2021-07-13 23:49:38	9
356844	BCH	2021-09-14	640.47	614.58	642.72	609.44	48273.65	30326028.47	2021-09-15 23:04:18	2021-09-15 23:04:18	8
334992	FIL	2021-07-30	51.29	49.38	51.35	48.69	184631.89	9184883.7	2021-07-31 23:53:45	2021-07-31 23:53:45	13
345718	ANT	2021-08-22	5.301	5.412	5.479	5.14	45693.18	240973.63	2021-08-23 22:59:03	2021-08-23 22:59:03	14
345746	FIL	2021-08-22	77.17	78.4	79.02	75.15	309683.42	23913807.97	2021-08-23 23:59:03	2021-08-23 23:59:03	13
372196	SJCX	2021-10-16	0.002435	0.002467	0.002435	0.002435	0	0	2021-10-17 23:11:44	2021-10-17 23:11:44	11
379334	ZRX	2021-10-30	1.152	1.051	1.352	1.021	38396879.41	44640928.08	2021-10-31 23:14:55	2021-10-31 23:14:55	6
384096	EOS	2021-11-08	4.86	4.603	4.89	4.587	6244689.24	29567190.75	2021-11-09 23:16:59	2021-11-09 23:16:59	9
9256	ANT	2021-04-01	11.78	10.82	12.56	10.56	1206914.93	14219150.56	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9257	ANT	2021-04-02	11.67	11.78	13.5	11.46	1447873.15	16893475.29	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9274	ANT	2021-04-19	8.062	8.808	9.07	7.968	763407.61	6154958.53	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9275	ANT	2021-04-20	8.39	8.062	8.898	7.723	689854.19	5787645.49	2021-05-09 17:34:37	2021-05-09 17:34:37	14
7697	ANT	2021-04-21	8.646	8.39	9.405	7.931	925659.01	8003416.52	2021-05-09 17:34:37	2021-05-09 17:34:37	14
7698	ANT	2021-04-22	8.223	8.646	9.501	8.171	1220268.34	10034388.57	2021-05-09 17:34:37	2021-05-09 17:34:37	14
7742	ANT	2021-04-23	8.158	8.223	8.419	7.482	937810.22	7650447.56	2021-05-09 17:34:37	2021-05-09 17:34:37	14
382	DOT	2020-05-07	0	0	0	0	0	0	2021-05-07 19:24:30	2021-05-07 19:24:30	4
320666	FIL	2021-06-29	64.5	56.4	66.25	56.21	412202.04	24896258.96	2021-06-30 23:46:41	2021-06-30 23:46:41	13
321110	ATOM	2021-06-30	12.04	11.64	12.04	11.04	1070873.7	12409075.44	2021-07-01 23:46:54	2021-07-01 23:46:54	3
305450	BTC	2021-05-28	35680.92	38538.84	38879.6	34733.76	85345.66	3104364367.82	2021-05-29 23:39:15	2021-05-29 23:39:15	7
378	DOT	2020-05-03	0	0	0	0	0	0	2021-05-03 02:16:33	2021-05-03 02:16:33	4
3488	FIL	2020-11-01	31.61	31.33	31.94	30.65	58830.43	1859669.36	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3489	FIL	2020-11-02	29.72	31.61	31.42	29.34	76168.65	2263809.63	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3490	FIL	2020-11-03	28.95	29.72	30.8	28.65	67916.07	1965836.21	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3491	FIL	2020-11-04	28.82	28.84	29.29	28.24	14616.94	418193.56	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3492	FIL	2020-11-05	29.39	28.92	32.21	29.13	34448.45	1012448.53	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3493	FIL	2020-11-06	31.77	29.39	33.35	28.64	87212.48	2771061.74	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3496	FIL	2020-11-09	31.21	30.73	32.59	30.13	55206.88	1722829.29	2021-05-07 19:24:30	2021-05-07 19:24:30	13
376	DOT	2020-05-01	0	0	0	0	0	0	2021-05-01 22:04:04	2021-05-01 22:04:04	4
377	DOT	2020-05-02	0	0	0	0	0	0	2021-05-01 22:04:04	2021-05-01 22:04:04	4
4509	EOS	2020-08-16	3.884	3.719	3.945	3.53	6929739.71	26191107.89	2021-05-09 17:34:36	2021-05-09 17:34:36	9
3497	FIL	2020-11-10	30.43	31.22	31.26	30.34	31204.55	957623.69	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3498	FIL	2020-11-11	30.11	30.41	31.63	29.69	74945.04	2256630.56	2021-05-07 19:24:30	2021-05-07 19:24:30	13
4510	EOS	2020-08-17	3.781	3.884	3.915	3.686	4127672.65	15782664.92	2021-05-09 17:34:36	2021-05-09 17:34:36	9
3499	FIL	2020-11-12	29.56	30.11	31.65	29.07	146629.49	4334915.96	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3500	FIL	2020-11-13	29.2	29.56	30.25	29.12	74225.62	2167620.86	2021-05-07 19:24:30	2021-05-07 19:24:30	13
4515	EOS	2020-08-22	3.367	3.248	3.38	3.166	1634560.92	5333780.4	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4516	EOS	2020-08-23	3.324	3.367	3.386	3.231	1107898.41	3681100.14	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4517	EOS	2020-08-24	3.388	3.324	3.424	3.29	1300369.89	4390134.84	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4518	EOS	2020-08-25	3.126	3.388	3.392	3.026	4293412.79	13674956.39	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4519	EOS	2020-08-26	3.12	3.126	3.168	3.066	1360252.4	4248702	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4520	EOS	2020-08-27	2.981	3.12	3.15	2.86	2655474.07	7964974.96	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4521	EOS	2020-08-28	3.118	2.981	3.177	2.945	1490959.6	4603527.35	2021-05-09 17:34:36	2021-05-09 17:34:36	9
3501	FIL	2020-11-14	29.29	29.2	29.55	28.68	88369.34	2588371.63	2021-05-07 19:24:30	2021-05-07 19:24:30	13
384	DOT	2020-05-09	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
385	DOT	2020-05-10	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
386	DOT	2020-05-11	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
387	DOT	2020-05-12	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
379	DOT	2020-05-04	0	0	0	0	0	0	2021-05-04 22:03:21	2021-05-04 22:03:21	4
388	DOT	2020-05-13	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
389	DOT	2020-05-14	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
380	DOT	2020-05-05	0	0	0	0	0	0	2021-05-04 22:03:21	2021-05-04 22:03:21	4
390	DOT	2020-05-15	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
9217	ANT	2021-02-21	5.833	5.663	5.925	5.676	572565.09	3339886.64	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9218	ANT	2021-02-22	5.303	5.833	6.478	5.18	1481439.47	7856567.49	2021-05-09 17:34:37	2021-05-09 17:34:37	14
381	DOT	2020-05-06	0	0	0	0	0	0	2021-05-04 22:03:21	2021-05-04 22:03:21	4
375	DOT	2020-04-30	0	0	0	0	0	0	2021-04-30 16:57:54	2021-04-30 16:57:54	4
9219	ANT	2021-02-23	4.433	5.303	4.878	4.122	1175511.2	5210649.89	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9220	ANT	2021-02-24	4.738	4.433	4.785	4.39	963619.53	4565685.29	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9221	ANT	2021-02-25	4.382	4.738	4.607	4.184	791594.59	3469142.34	2021-05-09 17:34:37	2021-05-09 17:34:37	14
314966	OCN	2021-06-17	0.0008066	0.000805	0.0008303	0.0007829	32637623.49	26325.03	2021-06-18 23:43:56	2021-06-18 23:43:56	2
309810	ATOM	2021-06-06	15.1	14.89	15.4	14.49	438849.5	6551959.79	2021-06-07 21:41:16	2021-06-07 21:41:16	3
299768	EOS	2021-05-17	9.144	10.12	10.14	8.632	18968261.51	174937635.67	2021-05-18 23:36:46	2021-05-18 23:36:46	9
334994	ETH	2021-07-30	2463.61	2383.24	2471.75	2318.5	417083.79	998308862.77	2021-07-31 22:53:45	2021-07-31 22:53:45	10
332254	BTC	2021-07-24	34282.56	33637.92	34519.75	33429.09	20217.05	686017155.75	2021-07-25 23:52:22	2021-07-25 23:52:22	7
340548	XTZ	2021-08-11	3.45	3.266	3.56	3.262	5123360.18	17668826.92	2021-08-12 23:56:30	2021-08-12 23:56:30	5
326712	BCH	2021-07-12	479.45	497.98	489.05	475.81	83934.23	40242477.24	2021-07-13 23:49:37	2021-07-13 23:49:37	8
332288	SJCX	2021-07-24	0.001371	0.001346	0.001371	0.001371	0	0	2021-07-25 23:52:22	2021-07-25 23:52:22	11
345720	ETH	2021-08-22	3241.65	3226.59	3274.41	3130.12	203966.43	653906471.77	2021-08-23 23:59:03	2021-08-23 23:59:03	10
326748	SJCX	2021-07-12	0.001324	0.00137	0.001324	0.001324	0	0	2021-07-13 23:49:37	2021-07-13 23:49:37	11
351412	FIL	2021-09-03	77.67	77.41	79.2	75.77	329377.53	25537571.54	2021-09-04 22:01:48	2021-09-04 22:01:48	13
356846	BTC	2021-09-14	47129.01	44958.56	47263.56	44776.37	26751.25	1237183544.6	2021-09-15 23:04:18	2021-09-15 23:04:18	7
362520	BTC	2021-09-26	43201.79	42721.91	43928.49	40825.4	26727.07	1140118139.14	2021-09-27 23:07:04	2021-09-27 23:07:04	7
362052	BCH	2021-09-25	517.61	513.52	523.25	502.6	62406.51	32105011.68	2021-09-26 23:06:51	2021-09-26 23:06:51	8
367272	XTZ	2021-10-06	7.749	7.936	8.512	7.165	19614247.55	154175688.1	2021-10-07 23:09:25	2021-10-07 23:09:25	5
372198	ANT	2021-10-16	4.8	5.037	4.993	4.771	249430.66	1197320.09	2021-10-17 23:11:44	2021-10-17 23:11:44	14
377234	ANT	2021-10-26	4.803	4.564	5.038	4.542	98278.07	474075.14	2021-10-27 22:14:01	2021-10-27 22:14:01	14
379328	DOT	2021-10-30	42.73	44.11	44.32	42.14	2224165.23	95847031.71	2021-10-31 23:14:56	2021-10-31 23:14:56	4
373	DOT	2020-04-28	0	0	0	0	0	0	2021-04-28 19:33:32	2021-04-28 19:33:32	4
374	DOT	2020-04-29	0	0	0	0	0	0	2021-04-28 19:33:32	2021-04-28 19:33:32	4
1763	ETH	2021-02-14	1802.96	1817.48	1852.06	1786.75	423533.72	772757223.36	2021-05-07 19:24:30	2021-05-07 19:24:30	10
1764	ETH	2021-02-15	1779.4	1802.96	1836.25	1661.33	919696.6	1616101004.74	2021-05-07 19:24:30	2021-05-07 19:24:30	10
3510	FIL	2020-11-23	29.18	28.95	29.42	28.46	104606.54	3052227.34	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3511	FIL	2020-11-24	29.79	29.18	32.15	29.02	190296.52	5668816.07	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3512	FIL	2020-11-25	30.99	29.79	34.44	28.89	357298.5	11073085.26	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3513	FIL	2020-11-26	29.94	30.99	31.07	27.77	188788.12	5651848.87	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3514	FIL	2020-11-27	29.97	29.94	31.46	29.54	75223.56	2254433.92	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3517	FIL	2020-11-30	30.39	30	30.84	29.89	58876.8	1789826.27	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3518	FIL	2020-12-01	30.41	30.4	31.35	28.98	133495.22	4058989.52	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3519	FIL	2020-12-02	30.57	30.41	32.22	30.38	79524.5	2431035.5	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3520	FIL	2020-12-03	30.48	30.57	31.58	30.24	65504.17	1996285.79	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3523	FIL	2020-12-06	29.33	29.83	30.05	29.01	37683.88	1105240.64	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3524	FIL	2020-12-07	30.5	29.34	34.51	28.98	289282.13	8822654.23	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3525	FIL	2020-12-08	29.96	30.5	30.18	28.9	146789.83	4397669.94	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3526	FIL	2020-12-09	30.51	29.9	31.4	25.5	265855.02	8139058.46	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3527	FIL	2020-12-10	30.59	30.51	38.63	30.31	1088725.45	35519833.05	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3528	FIL	2020-12-11	29.87	30.59	30.79	29.51	577042.3	17408640.33	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3529	FIL	2020-12-12	30.01	29.87	30.36	29.76	247616.81	7452437.78	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3555	FIL	2021-01-07	22.06	22	23.01	21.8	454516.71	10168402.01	2021-05-07 19:24:30	2021-05-07 19:24:30	13
9108	ANT	2020-11-04	2.772	2.865	2.943	2.745	67162.87	186181.09	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9109	ANT	2020-11-05	2.861	2.772	3.159	2.836	80673.4	230808.64	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9110	ANT	2020-11-06	3.046	2.861	3.173	2.858	173202.53	527645.43	2021-05-09 17:34:37	2021-05-09 17:34:37	14
305480	ATOM	2021-05-28	12.69	14.48	14.58	12.05	1202956.23	15734730.85	2021-05-29 23:39:15	2021-05-29 23:39:15	3
309812	ETH	2021-06-06	2710.99	2629.76	2745.12	2615.9	345624.87	930314354.19	2021-06-07 23:41:17	2021-06-07 23:41:17	10
3556	FIL	2021-01-08	21.62	22.06	22.3	21.2	227371.54	4927075.46	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3557	FIL	2021-01-09	22.1	21.62	22.7	21.38	182067.91	4025841.4	2021-05-07 19:24:30	2021-05-07 19:24:30	13
314998	ZRX	2021-06-17	0.8748	0.8669	0.8989	0.8513	2265448.81	1984281.4	2021-06-18 23:43:55	2021-06-18 23:43:55	6
299770	FIL	2021-05-17	99.37	107.78	107.89	93.5	1144398.22	115039571.06	2021-05-18 23:36:44	2021-05-18 23:36:44	13
340550	ZRX	2021-08-11	0.9929	0.9741	1.043	0.9551	11393092.97	11421427.48	2021-08-12 20:56:29	2021-08-12 20:56:29	6
334996	BCH	2021-07-30	552.81	538.41	579	552.81	141366.49	78149467.36	2021-07-31 22:53:45	2021-07-31 22:53:45	8
372200	ZRX	2021-10-16	1.004	1.024	1.034	0.9933	5270282.14	5328021.19	2021-10-17 23:11:44	2021-10-17 23:11:44	6
3558	FIL	2021-01-10	23.46	22.1	24.38	22.03	732597.89	17014904.07	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3559	FIL	2021-01-11	21.66	23.46	23.54	20.77	454928.41	9857922.9	2021-05-07 19:24:30	2021-05-07 19:24:30	13
340558	ATOM	2021-08-11	14.58	14.1	15.45	14.09	1706158.01	25439132.13	2021-08-12 23:56:30	2021-08-12 23:56:30	3
326722	DOT	2021-07-12	14.88	15.48	15.64	14.43	741324.32	11067548.41	2021-07-13 23:49:37	2021-07-13 23:49:37	4
372	DOT	2020-04-27	0	0	0	0	0	0	2021-04-27 14:21:33	2021-04-27 14:21:33	4
356848	XTZ	2021-09-14	7.12	7.175	7.99	6.841	26562734.67	196860953.64	2021-09-15 23:04:18	2021-09-15 23:04:18	5
310296	ANT	2021-06-07	4.779	5.542	5.199	4.755	609849.38	2914373.21	2021-06-08 23:41:33	2021-06-08 23:41:33	14
320668	ATOM	2021-06-29	11.64	10.9	12.88	10.84	1832361.48	21715512.15	2021-06-30 23:46:41	2021-06-30 23:46:41	3
351414	BCH	2021-09-03	713.69	664.68	721.42	651.45	115787.09	80276836.21	2021-09-04 23:01:49	2021-09-04 23:01:49	8
362054	OCN	2021-09-25	0.0008191	0.0008206	0.0008776	0.0008191	13088637.26	10720.84	2021-09-26 23:06:51	2021-09-26 23:06:51	2
332256	ATOM	2021-07-24	11.43	11.45	11.78	11.09	967932.28	11078401.69	2021-07-25 23:52:22	2021-07-25 23:52:22	3
305452	XTZ	2021-05-28	3.397	3.857	3.92	3.268	10343511.56	36340601.99	2021-05-29 21:39:14	2021-05-29 21:39:14	5
345722	DOT	2021-08-22	27.72	27.89	28.51	26.58	1161106.03	32119121.1	2021-08-23 23:59:03	2021-08-23 23:59:03	4
362554	ZRX	2021-09-26	0.8969	0.9074	0.9632	0.8169	11744491.55	10458940.24	2021-09-27 23:07:04	2021-09-27 23:07:04	6
378856	ANT	2021-10-29	4.573	4.463	4.763	4.525	243080.58	1111705.69	2021-10-30 23:14:42	2021-10-30 23:14:42	14
367274	SJCX	2021-10-06	0.002214	0.00206	0.002214	0.002214	0	0	2021-10-07 23:09:25	2021-10-07 23:09:25	11
378812	SJCX	2021-10-29	0.002491	0.002424	0.002491	0.002491	0	0	2021-10-30 23:14:45	2021-10-30 23:14:45	11
377236	DOT	2021-10-26	44.87	44.51	46.13	43.37	4781014.98	213487089.02	2021-10-27 22:14:01	2021-10-27 22:14:01	4
377242	OCN	2021-10-26	0.0006032	0.0006309	0.0006032	0.0006032	31610874.55	19066.31	2021-10-27 23:14:38	2021-10-27 23:14:38	2
384100	ATOM	2021-11-08	36.65	35.72	36.92	35.01	2030800.77	73542094.28	2021-11-09 23:16:58	2021-11-09 23:16:58	3
3569	FIL	2021-01-21	21.3	22.35	22.72	20.94	379143.67	8260818.7	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3585	FIL	2021-02-06	24.25	24.51	25.3	23.78	477410.78	11676630.94	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3586	FIL	2021-02-07	24.09	24.25	24.67	23.73	256960.17	6188544.63	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3587	FIL	2021-02-08	27.76	24.09	28.82	23.86	1075724.62	27892213.53	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3588	FIL	2021-02-09	44.24	27.76	51.73	27.1	4875622.6	183814233.95	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3589	FIL	2021-02-10	39.9	44.24	45.56	35.49	3244055.09	133548234.92	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3593	FIL	2021-02-14	47.11	41.58	52.33	41.25	1632355.86	76971466.5	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3594	FIL	2021-02-15	43.01	47.11	50.57	36.45	967974.8	42256039.25	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3595	FIL	2021-02-16	41.92	42.94	46.19	40.81	585225.53	24535567.83	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3596	FIL	2021-02-17	43.21	41.92	45.3	41.85	493725.06	21331454.14	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3609	FIL	2021-03-02	38.21	38.58	38.97	37.25	312941.23	11932887.73	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3610	FIL	2021-03-03	42.1	38.21	44.85	38.11	705471.38	29316312.48	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3611	FIL	2021-03-04	40.79	42.1	43.19	39.86	331242.1	13684765.91	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3626	FIL	2021-03-19	83.02	79.54	85.86	75.84	728393.37	58982917.92	2021-05-07 19:24:30	2021-05-07 19:24:30	13
327158	OCN	2021-07-13	0.0009703	0.001464	0.001494	0.0009315	54696037.17	53071.84	2021-07-14 23:49:51	2021-07-14 23:49:51	2
315912	ANT	2021-06-19	10.03	9.918	12.28	7.313	816062.5	8184734.19	2021-06-20 23:44:23	2021-06-20 23:44:23	14
377238	SJCX	2021-10-26	0.002413	0.002524	0.002413	0.002413	0	0	2021-10-27 23:14:03	2021-10-27 23:14:03	11
332258	ETH	2021-07-24	2185.98	2125.57	2199.99	2107.47	371801.43	800523696.67	2021-07-25 23:52:22	2021-07-25 23:52:22	10
332280	EOS	2021-07-24	3.67	3.635	3.741	3.618	1857542.86	6823633.59	2021-07-25 23:52:22	2021-07-25 23:52:22	9
310282	BTC	2021-06-07	33582.86	35798.57	36790.39	33367.12	52209.55	1850311020.63	2021-06-08 23:41:32	2021-06-08 23:41:32	7
305454	ETH	2021-05-28	2412.36	2742.48	2761.88	2334.05	1350168.83	3418586712.49	2021-05-29 21:39:14	2021-05-29 21:39:14	10
340552	DOT	2021-08-11	21.4	20.62	22.46	20.57	5099199.91	110039248.5	2021-08-12 23:56:30	2021-08-12 23:56:30	4
362558	SJCX	2021-09-26	0.001728	0.001709	0.001728	0.001728	0	0	2021-09-27 23:07:05	2021-09-27 23:07:05	11
384082	BTC	2021-11-08	67549.14	63302.78	67755.46	63302.78	39774.17	2614939972.01	2021-11-09 23:16:58	2021-11-09 23:16:58	7
315436	BTC	2021-06-18	35830.29	38082.3	38201.23	35158.89	60242.99	2207651943.63	2021-06-19 23:44:09	2021-06-19 23:44:09	7
356890	ZRX	2021-09-14	1.064	1.012	1.067	0.9835	6036362.89	6131866.66	2021-09-15 22:04:18	2021-09-15 22:04:18	6
356850	ANT	2021-09-14	5.99	5.575	6.127	5.802	302566.52	1812402.86	2021-09-15 23:04:18	2021-09-15 23:04:18	14
372202	EOS	2021-10-16	4.563	4.644	4.714	4.534	3975727.79	18343616.02	2021-10-17 23:11:44	2021-10-17 23:11:44	9
309814	XTZ	2021-06-06	3.837	3.43	3.957	3.408	6101438.62	22625598.56	2021-06-07 23:41:17	2021-06-07 23:41:17	5
309834	EOS	2021-06-06	5.85	5.778	5.95	5.72	2264153.01	13186011.49	2021-06-07 23:41:17	2021-06-07 23:41:17	9
367276	BCH	2021-10-06	616.97	595.05	625.2	562.62	132069.84	79631417.79	2021-10-07 23:09:25	2021-10-07 23:09:25	8
367300	OCN	2021-10-06	0.0005535	0.000515	0.0005535	0.0005535	38632887.67	21381.7	2021-10-07 23:09:30	2021-10-07 23:09:30	2
351444	DOT	2021-09-03	33.59	31.82	33.98	31.04	1675605.57	55217096.95	2021-09-04 23:01:48	2021-09-04 23:01:48	4
351416	EOS	2021-09-03	5.674	5.259	5.741	5.132	11846634.48	65364008.31	2021-09-04 23:01:48	2021-09-04 23:01:48	9
362056	DOT	2021-09-25	29.85	30.85	32.22	29.47	3642394.78	111655783	2021-09-26 23:06:51	2021-09-26 23:06:51	4
299772	OCN	2021-05-17	0.001148	0.001291	0.001247	0.00105	65327203.76	75012.32	2021-05-18 23:36:45	2021-05-18 23:36:45	2
320682	BCH	2021-06-29	523.07	501.25	547.04	500.08	76724.25	40461024.66	2021-06-30 23:46:41	2021-06-30 23:46:41	8
334998	EOS	2021-07-30	4.068	3.967	4.076	3.786	2741743.45	10756771.93	2021-07-31 23:53:45	2021-07-31 23:53:45	9
345738	EOS	2021-08-22	5.418	5.361	5.546	5.207	4430162.13	23861986.88	2021-08-23 23:59:03	2021-08-23 23:59:03	9
335014	OCN	2021-07-30	0.0008869	0.0008818	0.0009854	0.0008623	55109256.89	48876.38	2021-07-31 23:53:45	2021-07-31 23:53:45	2
345724	SJCX	2021-08-22	0.001972	0.001955	0.001972	0.001972	0	0	2021-08-23 23:59:03	2021-08-23 23:59:03	11
378814	BCH	2021-10-29	594.05	579.19	598.6	585.39	99494.14	59104542.12	2021-10-30 23:14:42	2021-10-30 23:14:42	8
378806	XTZ	2021-10-29	6.566	6.154	6.775	6.077	6828293.62	43269757.8	2021-10-30 23:14:42	2021-10-30 23:14:42	5
379354	XTZ	2021-10-30	6.308	6.566	6.787	6.176	6737687	43858811.25	2021-10-31 23:14:56	2021-10-31 23:14:56	5
4701	EOS	2021-02-24	3.893	3.852	4.141	3.679	10731153.41	42127633.57	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4702	EOS	2021-02-25	3.67	3.893	4.096	3.626	7484374.76	29106548.94	2021-05-09 17:34:36	2021-05-09 17:34:36	9
3494	FIL	2020-11-07	30.05	31.77	31.61	28.68	99519.69	2990295.39	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3495	FIL	2020-11-08	30.73	30.05	31.77	30.5	28636.2	879952.86	2021-05-07 19:24:30	2021-05-07 19:24:30	13
4703	EOS	2021-02-26	3.553	3.67	3.769	3.402	9884606	35402843.56	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4704	EOS	2021-02-27	3.677	3.553	3.841	3.546	5954073.01	22094317.36	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4705	EOS	2021-02-28	3.482	3.677	3.7	3.252	7973044.48	27439516.5	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4706	EOS	2021-03-01	3.708	3.482	3.762	3.459	5172982.54	18706835.01	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4707	EOS	2021-03-02	3.671	3.708	3.845	3.567	5736491.32	21173723.92	2021-05-09 17:34:36	2021-05-09 17:34:36	9
460	DOT	2020-07-24	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
461	DOT	2020-07-25	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
463	DOT	2020-07-27	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
464	DOT	2020-07-28	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
465	DOT	2020-07-29	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
466	DOT	2020-07-30	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
467	DOT	2020-07-31	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
2158	ZRX	2021-03-15	1.329	1.33	1.373	1.258	7411442.69	9857679.51	2021-05-09 17:34:36	2021-05-09 17:34:36	6
315438	ETH	2021-06-18	2233.57	2372.31	2377.33	2135.22	531451.42	1193362399.58	2021-06-19 20:44:08	2021-06-19 20:44:08	10
2159	ZRX	2021-03-16	1.423	1.329	1.439	1.282	9767101.22	13350363.85	2021-05-09 17:34:36	2021-05-09 17:34:36	6
340554	BCH	2021-08-11	620.94	592.36	621.39	591.78	155673.28	96663406.05	2021-08-12 22:56:30	2021-08-12 22:56:30	8
309816	DOT	2021-06-06	24.14	23.79	24.47	23.59	579972.64	13942795.15	2021-06-07 23:41:17	2021-06-07 23:41:17	4
2201	OCN	2020-04-26	0.0003066	0.0003071	0.0003342	0.0002967	260863795.77	79970.14	2021-04-26 23:28:51	2021-04-26 23:28:51	2
321108	DOT	2021-06-30	16.38	16.26	16.61	15.11	996321.45	15810584.38	2021-07-01 23:46:54	2021-07-01 23:46:54	4
315476	BCH	2021-06-18	563.07	598.76	599.3	545.57	61500.26	35187144.63	2021-06-19 23:44:11	2021-06-19 23:44:11	8
315908	ZRX	2021-06-19	0.7899	0.8162	0.8306	0.7865	2295341.04	1859133.65	2021-06-20 23:44:23	2021-06-20 23:44:23	6
1190	SJCX	2020-07-22	0.0003815	0.0003757	0.0003815	0.0003815	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
351440	OCN	2021-09-03	0.001064	0.001061	0.001103	0.001064	1765991.91	1878.56	2021-09-04 23:01:48	2021-09-04 23:01:48	2
2200	OCN	2020-04-25	0.0003071	0.0003397	0.0003538	0.0002955	274355996.51	84264.66	2021-04-24 20:28:41	2021-04-24 20:28:41	2
299774	SJCX	2021-05-17	0.001742	0.00186	0.001742	0.001742	0	0	2021-05-18 23:36:52	2021-05-18 23:36:52	11
335000	BTC	2021-07-30	42231.83	40030.52	42301.76	38346.18	42436.67	1698014609.78	2021-07-31 23:53:45	2021-07-31 23:53:45	7
1191	SJCX	2020-07-23	0.0003846	0.0003815	0.0003846	0.0003846	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
305456	DOT	2021-05-28	21.38	23.9	26.19	20.11	3701648.13	82958418.63	2021-05-29 23:39:15	2021-05-29 23:39:15	4
384594	ETH	2021-11-09	4732.07	4810.97	4841.12	4710	278323.93	1331650830.12	2021-11-10 23:17:12	2021-11-10 23:17:12	10
327160	EOS	2021-07-13	3.888	4.191	4.209	3.79	4162117.6	16450574.24	2021-07-14 23:49:51	2021-07-14 23:49:51	9
327194	SJCX	2021-07-13	0.001309	0.001324	0.001309	0.001309	0	0	2021-07-14 23:49:51	2021-07-14 23:49:51	11
332260	FIL	2021-07-24	49.59	47.38	51.3	46.44	354591.09	17309309.17	2021-07-25 23:52:22	2021-07-25 23:52:22	13
1192	SJCX	2020-07-24	0.000382	0.0003846	0.000382	0.000382	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1193	SJCX	2020-07-25	0.0003883	0.000382	0.0003883	0.0003883	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1194	SJCX	2020-07-26	0.0003977	0.0003883	0.0003977	0.0003977	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1195	SJCX	2020-07-27	0.0004417	0.0003977	0.0004417	0.0004417	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1196	SJCX	2020-07-28	0.0004373	0.0004417	0.0004373	0.0004373	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1197	SJCX	2020-07-29	0.0004445	0.0004373	0.0004445	0.0004445	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
9199	ANT	2021-02-03	4.261	4.167	4.45	4.182	684917.3	2918642.99	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9200	ANT	2021-02-04	4.508	4.261	4.719	4.135	587259.86	2647531.23	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9201	ANT	2021-02-05	5.961	4.508	6.972	4.662	2034314.36	12126697.1	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9202	ANT	2021-02-06	5.49	5.961	6.141	5.042	1120282.36	6149821.38	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9203	ANT	2021-02-07	5.193	5.49	5.554	4.866	658341.48	3418684.59	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9204	ANT	2021-02-08	5.624	5.193	6.576	5.512	725367.33	4079154.21	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9205	ANT	2021-02-09	5.842	5.624	5.888	5.302	701325.76	4096865.96	2021-05-09 17:34:37	2021-05-09 17:34:37	14
356852	SJCX	2021-09-14	0.001885	0.001798	0.001885	0.001885	0	0	2021-09-15 22:04:18	2021-09-15 22:04:18	11
345748	ZRX	2021-08-22	1.123	1.07	1.128	1.029	10284209.61	11225727.01	2021-08-23 22:59:03	2021-08-23 22:59:03	6
362058	ZRX	2021-09-25	0.9074	0.9181	0.923	0.8709	5523561.95	4972946.21	2021-09-26 22:06:51	2021-09-26 22:06:51	6
362526	OCN	2021-09-26	0.0007354	0.0008191	0.0008886	0.0007354	5825990.04	4284.49	2021-09-27 23:07:05	2021-09-27 23:07:05	2
351418	ANT	2021-09-03	7.267	7.079	8.448	6.744	283288.32	2137238.63	2021-09-04 22:01:48	2021-09-04 22:01:48	14
379332	EOS	2021-10-30	4.484	4.493	4.521	4.358	5300735.76	23600471.37	2021-10-31 23:14:56	2021-10-31 23:14:56	9
372696	BTC	2021-10-17	61520.54	60877.77	61698.1	59050.3	23336.32	1414498881.98	2021-10-18 23:11:57	2021-10-18 23:11:57	7
378816	BTC	2021-10-29	62282.5	60610.11	62967.45	60269.97	35214.62	2168021242.77	2021-10-30 23:14:45	2021-10-30 23:14:45	7
367298	EOS	2021-10-06	4.742	4.733	4.913	4.377	9235047.42	43333972.78	2021-10-07 21:09:24	2021-10-07 21:09:24	9
377240	BCH	2021-10-26	611.74	621.45	632	600.59	53146.21	32862165.52	2021-10-27 23:14:01	2021-10-27 23:14:01	8
310272	ZRX	2021-06-07	0.9536	1.061	1.083	0.9454	5992232.49	6142605.22	2021-06-08 23:41:32	2021-06-08 23:41:32	6
309818	BCH	2021-06-06	656.36	649.25	669.95	645.14	53922.38	35449003.67	2021-06-07 19:41:15	2021-06-07 19:41:15	8
340556	ANT	2021-08-11	4.765	4.583	4.884	4.549	488358.08	2327138.46	2021-08-12 23:56:30	2021-08-12 23:56:30	14
335002	DOT	2021-07-30	15.81	15.26	15.85	14.44	2964082.54	44884150.91	2021-07-31 23:53:45	2021-07-31 23:53:45	4
305458	BCH	2021-05-28	689.09	749.64	761.29	653.68	190175.88	132501957.29	2021-05-29 23:39:15	2021-05-29 23:39:15	8
315440	FIL	2021-06-18	65.67	68.87	68.95	63.54	203976.73	13520029.18	2021-06-19 23:44:09	2021-06-19 23:44:09	13
356878	ETH	2021-09-14	3436.05	3285.4	3437.3	3272.39	309350.29	1035256383.1	2021-09-15 23:04:18	2021-09-15 23:04:18	10
2165	ZRX	2021-03-22	1.417	1.459	1.569	1.4	11320209.28	16948713.76	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2166	ZRX	2021-03-23	1.496	1.417	1.528	1.352	11970687.82	17260522.52	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2167	ZRX	2021-03-24	1.368	1.496	1.6	1.335	14067962.69	20986922.63	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2168	ZRX	2021-03-25	1.31	1.368	1.398	1.262	13982027.56	18473344.68	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2169	ZRX	2021-03-26	1.387	1.31	1.397	1.309	5358935.91	7346561.79	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2170	ZRX	2021-03-27	1.415	1.387	1.439	1.351	7970043.57	11167198.25	2021-05-09 17:34:36	2021-05-09 17:34:36	6
4405	EOS	2020-05-04	2.772	2.839	2.847	2.631	2158468.73	5879860.27	2021-05-04 22:03:21	2021-05-04 22:03:21	9
2171	ZRX	2021-03-28	1.454	1.415	1.481	1.386	8448977.77	12187136.21	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2172	ZRX	2021-03-29	1.596	1.454	1.6	1.449	12767451.97	19489982.68	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2173	ZRX	2021-03-30	1.844	1.596	1.924	1.554	34543989.9	60381075.22	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2174	ZRX	2021-03-31	1.881	1.844	1.993	1.759	27599817.43	52039095.91	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1205	SJCX	2020-08-06	0.0004709	0.0004701	0.0004709	0.0004709	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1206	SJCX	2020-08-07	0.0004642	0.0004709	0.0004642	0.0004642	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
4395	EOS	2020-04-24	2.709	2.681	2.742	2.668	1110930.48	3011021.36	2021-04-24 20:20:48	2021-04-24 20:20:48	9
4396	EOS	2020-04-25	2.701	2.709	2.804	2.659	1548110.46	4210140.48	2021-04-24 20:20:48	2021-04-24 20:20:48	9
4401	EOS	2020-04-30	2.825	3.004	3.113	2.751	3838367.3	11239385.29	2021-04-30 16:52:27	2021-04-30 16:52:27	9
1207	SJCX	2020-08-08	0.0004708	0.0004642	0.0004708	0.0004708	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
4398	EOS	2020-04-27	2.745	2.743	2.819	2.682	1766360.17	4831817.52	2021-04-27 14:21:33	2021-04-27 14:21:33	9
1208	SJCX	2020-08-09	0.0004675	0.0004708	0.0004675	0.0004675	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1209	SJCX	2020-08-10	0.0004759	0.0004675	0.0004759	0.0004759	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1210	SJCX	2020-08-11	0.0004556	0.0004759	0.0004556	0.0004556	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
4402	EOS	2020-05-01	2.873	2.825	2.932	2.825	1464930.9	4219323	2021-05-01 22:04:06	2021-05-01 22:04:06	9
4403	EOS	2020-05-02	2.942	2.873	2.949	2.858	1014889.85	2942464.47	2021-05-01 22:04:06	2021-05-01 22:04:06	9
4404	EOS	2020-05-03	2.839	2.942	3.012	2.772	1594798.9	4601077.69	2021-05-03 03:13:20	2021-05-03 03:13:20	9
4394	EOS	2020-04-23	2.681	2.626	2.77	2.585	1858838.62	4971170.38	2021-04-23 22:51:50	2021-04-23 22:51:50	9
1211	SJCX	2020-08-12	0.0004628	0.0004556	0.0004628	0.0004628	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1212	SJCX	2020-08-13	0.0004716	0.0004628	0.0004716	0.0004716	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1213	SJCX	2020-08-14	0.000471	0.0004716	0.000471	0.000471	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
299776	BTC	2021-05-17	43552.14	46490.71	46665.19	42130.83	134127.17	5896147491.21	2021-05-18 23:36:46	2021-05-18 23:36:46	7
332262	BCH	2021-07-24	459.04	455.79	468.3	454.93	96563.38	44326789.84	2021-07-25 23:52:22	2021-07-25 23:52:22	8
4399	EOS	2020-04-28	2.769	2.745	2.779	2.69	1235493.3	3380788.55	2021-04-28 19:33:32	2021-04-28 19:33:32	9
4400	EOS	2020-04-29	3.004	2.769	3.083	2.755	4439450.9	12922772.25	2021-04-28 19:33:32	2021-04-28 19:33:32	9
327162	FIL	2021-07-13	50.96	52.51	53.02	50.37	162293.77	8404801.53	2021-07-14 23:49:51	2021-07-14 23:49:51	13
321112	BTC	2021-06-30	35056.39	35901.41	36090.37	34062.04	39796.96	1388243727.19	2021-07-01 22:46:54	2021-07-01 22:46:54	7
379326	ATOM	2021-10-30	37.3	39.53	39.57	36.22	1792461.97	67829053.45	2021-10-31 23:14:56	2021-10-31 23:14:56	3
372698	FIL	2021-10-17	63.69	66.5	67.11	61.29	459094.44	29527925.91	2021-10-18 23:11:57	2021-10-18 23:11:57	13
367746	DOT	2021-10-07	33.98	32.28	52.14	31.66	79554667.31	2703227531.46	2021-10-08 23:09:38	2021-10-08 23:09:38	4
362082	ATOM	2021-09-25	39.49	42.59	43.1	38.82	3282692.36	133994954.1	2021-09-26 23:06:51	2021-09-26 23:06:51	3
362064	SJCX	2021-09-25	0.001709	0.001714	0.001709	0.001709	0	0	2021-09-26 23:06:51	2021-09-26 23:06:51	11
346242	EOS	2021-08-23	5.592	5.418	5.704	5.371	4837590.74	26871927.1	2021-08-24 22:59:17	2021-08-24 22:59:17	9
346174	ETH	2021-08-23	3322.71	3241.65	3378.69	3234.59	376372.05	1251116527.27	2021-08-24 23:59:17	2021-08-24 23:59:17	10
4397	EOS	2020-04-26	2.743	2.701	2.78	2.676	883918.94	2407055.88	2021-04-26 23:26:51	2021-04-26 23:26:51	9
377750	ZRX	2021-10-27	0.9309	1.068	1.077	0.9241	14519910.28	14132492.93	2021-10-28 23:14:15	2021-10-28 23:14:15	6
351420	ATOM	2021-09-03	24.12	24.17	24.93	23.18	638990.2	15428326.67	2021-09-04 23:01:48	2021-09-04 23:01:48	3
377768	SJCX	2021-10-27	0.002339	0.002413	0.002339	0.002339	0	0	2021-10-28 23:14:15	2021-10-28 23:14:15	11
362530	ANT	2021-09-26	4.519	4.763	4.817	4.376	566009.24	2557743.25	2021-09-27 23:07:05	2021-09-27 23:07:05	14
378818	EOS	2021-10-29	4.493	4.403	4.543	4.377	3606133.09	16115525.89	2021-10-30 23:14:43	2021-10-30 23:14:43	9
378836	ATOM	2021-10-29	39.53	38.05	41.01	38.02	2977328.62	117351899.37	2021-10-30 23:14:44	2021-10-30 23:14:44	3
385140	BCH	2021-11-10	664.06	717.38	728.9	647.18	155269.38	108394520.64	2021-11-11 23:17:26	2021-11-11 23:17:26	8
385120	ATOM	2021-11-10	32.17	35.82	37.26	28.54	4249506.93	145056059.08	2021-11-11 23:17:26	2021-11-11 23:17:26	3
384596	BCH	2021-11-09	717.38	638.4	730.7	637.32	208445.73	142862909.85	2021-11-10 23:17:12	2021-11-10 23:17:12	8
4725	EOS	2021-03-20	4.33	4.142	4.501	4.127	7732703.17	33863248.9	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4726	EOS	2021-03-21	4.156	4.33	4.417	4.12	5819381.99	24608149.3	2021-05-09 17:34:36	2021-05-09 17:34:36	9
335004	ANT	2021-07-30	4.015	4.023	4.333	4.014	324285.53	1301862.99	2021-07-31 21:53:44	2021-07-31 21:53:44	14
315906	BTC	2021-06-19	35515.38	35830.29	36443.26	34863.17	44782.25	1601193146.33	2021-06-20 23:44:23	2021-06-20 23:44:23	7
384598	DOT	2021-11-09	50.77	53.39	53.4	50.53	3151815.7	163484322.13	2021-11-10 23:17:12	2021-11-10 23:17:12	4
379324	BTC	2021-10-30	61891.91	62282.5	62371.52	60774.38	15917.35	979987095.61	2021-10-31 23:14:55	2021-10-31 23:14:55	7
305460	FIL	2021-05-28	66.77	71.35	71.82	64.94	1007330.06	67911269.61	2021-05-29 23:39:15	2021-05-29 23:39:15	13
357306	ZRX	2021-09-15	1.083	1.064	1.084	1.031	5770451.64	6093609.41	2021-09-16 23:04:32	2021-09-16 23:04:32	6
372700	ZRX	2021-10-17	0.991	1.004	1.024	0.9573	4866028.24	4835488.79	2021-10-18 23:11:58	2021-10-18 23:11:58	6
332264	XTZ	2021-07-24	2.817	2.686	2.821	2.651	3395024.68	9245353.58	2021-07-25 21:52:21	2021-07-25 21:52:21	5
378820	OCN	2021-10-29	0.0006228	0.0006061	0.001246	0.0006228	257403837.94	160317.55	2021-10-30 23:17:42	2021-10-30 23:17:42	2
351422	ZRX	2021-09-03	1.178	1.119	1.178	1.086	8422281.49	9631726.56	2021-09-04 22:01:48	2021-09-04 22:01:48	6
362076	XTZ	2021-09-25	6.831	7.004	7.5	6.791	22843867.86	163804350.22	2021-09-26 23:06:51	2021-09-26 23:06:51	5
309840	FIL	2021-06-06	87	88.13	89.02	86.02	245241.45	21414401.79	2021-06-07 23:41:17	2021-06-07 23:41:17	13
309820	OCN	2021-06-06	0.0008133	0.0008152	0.0008946	0.0007862	54822765.49	44587.19	2021-06-07 23:41:17	2021-06-07 23:41:17	2
346204	ZRX	2021-08-23	1.16	1.123	1.184	1.096	8058323.31	9197187.42	2021-08-24 23:59:17	2021-08-24 23:59:17	6
346176	BCH	2021-08-23	678.12	672.48	694.54	664.57	64062.78	43589144.21	2021-08-24 23:59:17	2021-08-24 23:59:17	8
299782	BCH	2021-05-17	1068.14	1168.19	1168.59	990.62	277142.97	296303812.81	2021-05-18 23:36:46	2021-05-18 23:36:46	8
321120	SJCX	2021-06-30	0.001402	0.001436	0.001402	0.001402	0	0	2021-07-01 21:46:54	2021-07-01 21:46:54	11
340576	OCN	2021-08-11	0.00117	0.001162	0.001392	0.001076	28499539.37	33357.72	2021-08-12 22:56:30	2021-08-12 22:56:30	2
367748	XTZ	2021-10-07	7.608	7.749	8.068	7.425	10273531.25	79238155	2021-10-08 23:09:38	2021-10-08 23:09:38	5
327164	ATOM	2021-07-13	12.11	13.01	13.75	11.8	1743716.75	22302917.22	2021-07-14 23:49:51	2021-07-14 23:49:51	3
357808	ZRX	2021-09-16	1.143	1.083	1.247	1.057	32824489.66	38109841.03	2021-09-17 23:04:46	2021-09-17 23:04:46	6
315442	EOS	2021-06-18	4.559	4.871	4.889	4.41	3499456.38	16250602.83	2021-06-19 23:44:09	2021-06-19 23:44:09	9
377752	XTZ	2021-10-27	5.887	6.819	6.89	5.665	13232722.46	81536367.36	2021-10-28 23:14:14	2021-10-28 23:14:14	5
3300	FIL	2020-04-27	0	0	0	0	0	0	2021-04-27 14:21:33	2021-04-27 14:21:33	13
3301	FIL	2020-04-28	0	0	0	0	0	0	2021-04-27 14:21:33	2021-04-27 14:21:33	13
3302	FIL	2020-04-29	0	0	0	0	0	0	2021-04-27 14:21:33	2021-04-27 14:21:33	13
3304	FIL	2020-05-01	0	0	0	0	0	0	2021-05-01 22:04:04	2021-05-01 22:04:04	13
3305	FIL	2020-05-02	0	0	0	0	0	0	2021-05-01 22:04:04	2021-05-01 22:04:04	13
3306	FIL	2020-05-03	0	0	0	0	0	0	2021-05-03 03:13:20	2021-05-03 03:13:20	13
9222	ANT	2021-02-26	4.127	4.382	4.322	4.036	836804.35	3453145.5	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9223	ANT	2021-02-27	4.218	4.127	4.265	4.018	719875.29	3036576.32	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9224	ANT	2021-02-28	3.81	4.218	4.155	3.72	797679.44	3039217.3	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9225	ANT	2021-03-01	4.355	3.81	4.366	4.122	542616.43	2363353.59	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9226	ANT	2021-03-02	5.356	4.356	6.065	4.13	157060.04	788113.78	2021-05-09 17:34:37	2021-05-09 17:34:37	14
305462	ZRX	2021-05-28	0.9654	1.102	1.124	0.9249	14123734.85	14234339.99	2021-05-29 23:39:15	2021-05-29 23:39:15	6
309830	ZRX	2021-06-06	1.061	1.042	1.079	1.032	2874429.66	3031812.1	2021-06-07 23:41:17	2021-06-07 23:41:17	6
300332	ATOM	2021-05-18	22.87	21.08	23.41	20.8	2455064.04	54617928.83	2021-05-19 23:36:58	2021-05-19 23:36:58	3
300342	XTZ	2021-05-18	5.745	5.175	5.952	5.101	8263676.43	47051871.05	2021-05-19 23:37:01	2021-05-19 23:37:01	5
494	DOT	2020-08-27	5.656	6.093	6.797	5.245	393736.69	2325682.07	2021-05-09 17:34:36	2021-05-09 17:34:36	4
495	DOT	2020-08-28	6.17	5.656	6.35	5.52	1609961.67	9746485.64	2021-05-09 17:34:36	2021-05-09 17:34:36	4
496	DOT	2020-08-29	6.148	6.17	6.566	6.02	1183643.98	7526399.84	2021-05-09 17:34:36	2021-05-09 17:34:36	4
3303	FIL	2020-04-30	0	0	0	0	0	0	2021-04-30 16:52:27	2021-04-30 16:52:27	13
497	DOT	2020-08-30	5.86	6.148	6.218	5.269	1005329.49	5985353.59	2021-05-09 17:34:36	2021-05-09 17:34:36	4
498	DOT	2020-08-31	6.293	5.86	6.477	5.759	962334.19	5953036.21	2021-05-09 17:34:36	2021-05-09 17:34:36	4
3312	FIL	2020-05-09	0	0	0	0	0	0	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3313	FIL	2020-05-10	0	0	0	0	0	0	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3314	FIL	2020-05-11	0	0	0	0	0	0	2021-05-07 19:24:30	2021-05-07 19:24:30	13
499	DOT	2020-09-01	6.255	6.293	6.861	6.144	1277798.72	8262846.76	2021-05-09 17:34:36	2021-05-09 17:34:36	4
500	DOT	2020-09-02	6.128	6.255	6.44	5.599	1097196.13	6611614.72	2021-05-09 17:34:36	2021-05-09 17:34:36	4
3299	FIL	2020-04-26	0	0	0	0	0	0	2021-04-26 23:26:50	2021-04-26 23:26:50	13
501	DOT	2020-09-03	5.717	6.128	6.366	5.605	1313509.4	7937978.45	2021-05-09 17:34:36	2021-05-09 17:34:36	4
3298	FIL	2020-04-25	0	0	0	0	0	0	2021-04-24 20:28:41	2021-04-24 20:28:41	13
726	DOT	2021-04-16	41.46	43.47	43.08	40.86	4302394.06	178386802.12	2021-05-09 17:34:36	2021-05-09 17:34:36	4
727	DOT	2021-04-17	42.15	41.43	48.3	41.42	1396252.53	62507405.97	2021-05-09 17:34:36	2021-05-09 17:34:36	4
728	DOT	2021-04-18	37.41	42.15	42.66	32.19	2762515.1	102965669.4	2021-05-09 17:34:36	2021-05-09 17:34:36	4
321138	ANT	2021-06-30	3.698	3.723	3.716	3.5	786614.86	2909255.06	2021-07-01 23:46:54	2021-07-01 23:46:54	14
3315	FIL	2020-05-12	0	0	0	0	0	0	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3316	FIL	2020-05-13	0	0	0	0	0	0	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3317	FIL	2020-05-14	0	0	0	0	0	0	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3318	FIL	2020-05-15	0	0	0	0	0	0	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3319	FIL	2020-05-16	0	0	0	0	0	0	2021-05-07 19:24:30	2021-05-07 19:24:30	13
315444	DOT	2021-06-18	21.38	22.48	22.56	20.24	960545.72	20508222.2	2021-06-19 23:44:09	2021-06-19 23:44:09	4
315490	OCN	2021-06-18	0.0007371	0.0008066	0.0008041	0.0007371	38542432.47	28408.78	2021-06-19 23:44:09	2021-06-19 23:44:09	2
315902	SJCX	2021-06-19	0.001421	0.001433	0.001421	0.001421	0	0	2021-06-20 22:44:23	2021-06-20 22:44:23	11
3320	FIL	2020-05-17	0	0	0	0	0	0	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3590	FIL	2021-02-11	40.32	39.9	42.92	36.96	1447151.25	57951101.37	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3591	FIL	2021-02-12	42.71	40.32	44.82	35.87	1360794.6	57491091.12	2021-05-07 19:24:30	2021-05-07 19:24:30	13
729	DOT	2021-04-19	34.8	37.41	38.73	34.02	1079407.85	39002550.24	2021-05-09 17:34:36	2021-05-09 17:34:36	4
730	DOT	2021-04-20	35.48	34.8	35.77	31.6	1660299.59	55984106.2	2021-05-09 17:34:36	2021-05-09 17:34:36	4
731	DOT	2021-04-21	33.79	35.48	36.33	33.1	1471933.49	51166616.77	2021-05-09 17:34:36	2021-05-09 17:34:36	4
732	DOT	2021-04-22	32.98	33.79	36.74	32.42	1768937.53	60821426.91	2021-05-09 17:34:36	2021-05-09 17:34:36	4
7768	DOT	2021-04-23	32.26	32.98	33.45	26.59	2040150.71	61579225.39	2021-05-09 17:34:36	2021-05-09 17:34:36	4
9213	ANT	2021-02-17	6.118	5.73	6.123	5.617	609214.69	3727035.93	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9214	ANT	2021-02-18	6.351	6.118	6.413	5.969	638057.66	4052257.74	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9215	ANT	2021-02-19	5.979	6.351	6.93	5.963	630126.31	3767706.65	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9216	ANT	2021-02-20	5.663	5.979	6.166	5.557	573711.04	3248785.11	2021-05-09 17:34:37	2021-05-09 17:34:37	14
332284	DOT	2021-07-24	13.78	13.4	14.07	13.14	2177325.69	29579583.9	2021-07-25 22:52:22	2021-07-25 22:52:22	4
315932	FIL	2021-06-19	64.79	65.67	66.84	64.31	118036.59	7734604.31	2021-06-20 23:44:24	2021-06-20 23:44:24	13
305482	SJCX	2021-05-28	0.001427	0.001542	0.001427	0.001427	0	0	2021-05-29 21:39:14	2021-05-29 21:39:14	11
310276	ATOM	2021-06-07	13.47	15.1	15.78	13.31	1218357.12	18077403.78	2021-06-08 23:41:32	2021-06-08 23:41:32	3
335006	ATOM	2021-07-30	12.14	11.79	12.18	11.44	1300240.14	15359209.14	2021-07-31 23:53:45	2021-07-31 23:53:45	3
340578	SJCX	2021-08-11	0.001822	0.001824	0.001822	0.001822	0	0	2021-08-12 23:56:30	2021-08-12 23:56:30	11
327166	DOT	2021-07-13	14.18	14.88	15.08	14.03	625757.87	9024183.4	2021-07-14 23:49:51	2021-07-14 23:49:51	4
346178	ANT	2021-08-23	5.472	5.299	5.502	5.239	451610.68	2471248.47	2021-08-24 22:59:17	2021-08-24 22:59:17	14
332266	ZRX	2021-07-24	0.6581	0.6508	0.6767	0.6435	3397479.72	2238040.56	2021-07-25 22:52:21	2021-07-25 22:52:21	6
351424	SJCX	2021-09-03	0.002001	0.001971	0.002001	0.002001	0	0	2021-09-04 23:01:55	2021-09-04 23:01:55	11
357308	BTC	2021-09-15	48148.45	47129.01	48457.3	46725.15	26904.97	1282942628.56	2021-09-16 23:04:32	2021-09-16 23:04:32	7
362078	EOS	2021-09-25	4.015	4.033	4.098	3.909	4555834.33	18307181.71	2021-09-26 23:06:58	2021-09-26 23:06:58	9
367750	ETH	2021-10-07	3587.74	3576.83	3615.71	3444.64	3897305.28	13982502202.33	2021-10-08 23:09:39	2021-10-08 23:09:39	10
372702	ANT	2021-10-17	4.839	4.8	5.243	4.826	388777.14	1881372.54	2021-10-18 23:11:57	2021-10-18 23:11:57	14
377770	OCN	2021-10-27	0.0005846	0.0006032	0.0005846	0.0005846	70927212.85	41467.18	2021-10-28 23:15:28	2021-10-28 23:15:28	2
377754	ETH	2021-10-27	3924.31	4129.95	4308.89	3921.73	579703.87	2371617544.49	2021-10-28 23:14:15	2021-10-28 23:14:15	10
378834	FIL	2021-10-29	60.19	58.15	62.89	57.92	766253.12	45994341.8	2021-10-30 23:14:43	2021-10-30 23:14:43	13
321588	EOS	2021-07-01	3.929	4.14	4.206	3.855	2417245.37	9647888.7	2021-07-02 23:47:08	2021-07-02 23:47:08	9
9227	ANT	2021-03-03	5.161	5.356	6.446	4.988	195463.84	1077351.3	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9228	ANT	2021-03-04	5.349	5.14	5.364	4.823	1359958.71	7274459.45	2021-05-09 17:34:37	2021-05-09 17:34:37	14
332286	OCN	2021-07-24	0.0008088	0.000829	0.0008525	0.0008088	23198758.94	18763.45	2021-07-25 23:52:22	2021-07-25 23:52:22	2
3323	FIL	2020-05-20	0	0	0	0	0	0	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3324	FIL	2020-05-21	0	0	0	0	0	0	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3325	FIL	2020-05-22	0	0	0	0	0	0	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3326	FIL	2020-05-23	0	0	0	0	0	0	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3327	FIL	2020-05-24	0	0	0	0	0	0	2021-05-07 19:24:30	2021-05-07 19:24:30	13
9229	ANT	2021-03-05	5.073	5.349	5.409	4.999	727549.07	3690593.41	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9230	ANT	2021-03-06	5.021	5.073	5.148	4.987	301663.86	1514741.89	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9231	ANT	2021-03-07	5.044	5.021	5.275	5.006	428270.82	2160384.12	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9232	ANT	2021-03-08	5.356	5.044	5.586	5.072	546018.28	2924360.91	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9233	ANT	2021-03-09	5.406	5.356	5.614	5.285	498101.72	2692505.47	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9258	ANT	2021-04-03	10.7	11.67	11.87	10.42	849374.18	9084778.29	2021-05-09 17:34:37	2021-05-09 17:34:37	14
9259	ANT	2021-04-04	11.38	10.7	12.02	10.76	1001722.95	11395677.03	2021-05-09 17:34:37	2021-05-09 17:34:37	14
315936	EOS	2021-06-19	4.47	4.559	4.702	4.457	1947762.27	8898744.25	2021-06-20 22:44:23	2021-06-20 22:44:23	9
327168	BTC	2021-07-13	32737.47	33088.51	33335.54	32206.14	25562.97	837278173.94	2021-07-14 23:49:51	2021-07-14 23:49:51	7
309836	SJCX	2021-06-06	0.001432	0.001422	0.001432	0.001432	0	0	2021-06-07 23:41:17	2021-06-07 23:41:17	11
340580	FIL	2021-08-11	71.86	66.72	74.04	66.71	778799.52	55348990.48	2021-08-12 23:56:30	2021-08-12 23:56:30	13
305464	OCN	2021-05-28	0.0009408	0.000905	0.001158	0.0006996	122725646.64	115462.79	2021-05-29 21:39:14	2021-05-29 21:39:14	2
385118	BTC	2021-11-10	64926.06	66939.24	68978.64	63196.25	50591.31	3365466815.36	2021-11-11 23:17:26	2021-11-11 23:17:26	7
300334	ETH	2021-05-18	3377.65	3280.73	3564.97	3242.5	979392.26	3346074529.75	2021-05-19 23:36:58	2021-05-19 23:36:58	10
300344	BCH	2021-05-18	1090.73	1068.14	1166.6	1053.34	123680.83	136699311.6	2021-05-19 23:36:59	2021-05-19 23:36:59	8
385122	OCN	2021-11-10	0.0006493	0.0006694	0.0006493	0.0006493	22132037.94	14369.46	2021-11-11 23:22:30	2021-11-11 23:22:30	2
321148	EOS	2021-06-30	4.14	4.112	4.3	3.836	4725957.7	19046043.71	2021-07-01 22:46:54	2021-07-01 22:46:54	9
321178	ZRX	2021-06-30	0.7419	0.7267	0.7419	0.6715	7180733.81	5091764.89	2021-07-01 23:46:55	2021-07-01 23:46:55	6
310278	BCH	2021-06-07	596.32	656.36	669.81	591.2	80617.11	51438727.17	2021-06-08 23:41:32	2021-06-08 23:41:32	8
335008	ZRX	2021-07-30	0.7789	0.7568	0.7793	0.7182	4539053.61	3404091.89	2021-07-31 23:53:45	2021-07-31 23:53:45	6
335098	XTZ	2021-07-30	2.967	2.85	2.97	2.767	2978176.96	8544495.88	2021-07-31 23:53:45	2021-07-31 23:53:45	5
357310	FIL	2021-09-15	86.34	80.81	87.45	80.17	642202.46	54436573.96	2021-09-16 22:04:32	2021-09-16 22:04:32	13
351926	ETH	2021-09-04	3887.01	3939.79	3969.89	3835.04	230192.53	898914227.68	2021-09-05 23:02:01	2021-09-05 23:02:01	10
346180	BTC	2021-08-23	49521.06	49289.71	50513.83	49048.25	30374.33	1515250474.77	2021-08-24 23:59:17	2021-08-24 23:59:17	7
384602	ANT	2021-11-09	5.267	5.138	5.697	5.119	130050.08	699348.57	2021-11-10 23:17:12	2021-11-10 23:17:12	14
377756	ATOM	2021-10-27	36.77	43.24	43.47	35.66	5179929.55	200549642.12	2021-10-28 21:14:14	2021-10-28 21:14:14	3
315488	SJCX	2021-06-18	0.001433	0.001523	0.001433	0.001433	0	0	2021-06-19 23:44:09	2021-06-19 23:44:09	11
372704	ETH	2021-10-17	3846.66	3829.61	3918.06	3651.37	275172.94	1045896725.37	2021-10-18 22:11:57	2021-10-18 22:11:57	10
315446	XTZ	2021-06-18	3.095	3.371	3.382	2.999	3919686.93	12390220.65	2021-06-19 23:44:11	2021-06-19 23:44:11	5
367752	BTC	2021-10-07	53797.21	55343.24	55359.77	53391.93	33806.76	1836529821.85	2021-10-08 23:09:38	2021-10-08 23:09:38	7
362522	EOS	2021-09-26	3.977	4.015	4.257	3.678	10750479.94	42627814.24	2021-09-27 23:07:04	2021-09-27 23:07:04	9
352422	ZRX	2021-09-05	1.312	1.245	1.312	1.215	10860882.1	13652297.69	2021-09-06 23:02:15	2021-09-06 23:02:15	6
352416	ETH	2021-09-05	3952.33	3887.01	3982.63	3835.93	212345.73	832602701.76	2021-09-06 23:02:15	2021-09-06 23:02:15	10
357780	ANT	2021-09-16	6.057	6.163	6.439	5.956	476073.83	2883357.72	2021-09-17 21:04:45	2021-09-17 21:04:45	14
379330	SJCX	2021-10-30	0.002476	0.002491	0.002476	0.002476	0	0	2021-10-31 23:14:55	2021-10-31 23:14:55	11
379322	ETH	2021-10-30	4323.94	4417.4	4433.67	4241.44	219463.6	948358418.96	2021-10-31 23:14:56	2021-10-31 23:14:56	10
379336	ANT	2021-10-30	4.472	4.574	4.692	4.414	40158.54	182036.43	2021-10-31 23:14:56	2021-10-31 23:14:56	14
2954	BCH	2020-05-17	240.51	236.74	244.76	239.15	262832.87	63213099.65	2021-05-09 17:34:36	2021-05-09 17:34:36	8
2955	BCH	2020-05-18	248.22	240.51	251.43	240.05	303463.24	75326038.99	2021-05-09 17:34:36	2021-05-09 17:34:36	8
2956	BCH	2020-05-19	246.85	248.22	251.74	246.75	264617.41	65321402.52	2021-05-09 17:34:36	2021-05-09 17:34:36	8
2957	BCH	2020-05-20	239.54	246.85	241.44	238.21	213135.7	51055174.68	2021-05-09 17:34:36	2021-05-09 17:34:36	8
2958	BCH	2020-05-21	227.93	239.54	230.37	224.58	277856.43	63331040.2	2021-05-09 17:34:36	2021-05-09 17:34:36	8
2959	BCH	2020-05-22	234.86	227.93	235.6	228.9	226615.62	53223545.36	2021-05-09 17:34:36	2021-05-09 17:34:36	8
582	DOT	2020-11-23	5.914	5.515	5.949	5.425	1165071.63	6697489.79	2021-05-09 17:34:36	2021-05-09 17:34:36	4
305474	EOS	2021-05-28	6.122	7.016	7.068	5.837	8365569.65	52680295.3	2021-05-29 23:39:15	2021-05-29 23:39:15	9
315448	ATOM	2021-06-18	12.41	13.61	13.62	11.95	1065915.61	13514957.49	2021-06-19 23:44:09	2021-06-19 23:44:09	3
310270	ETH	2021-06-07	2593.12	2710.99	2847.92	2574.68	635977.9	1734370558.93	2021-06-08 23:41:33	2021-06-08 23:41:33	10
3337	FIL	2020-06-03	0	0	0	0	0	0	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3338	FIL	2020-06-04	0	0	0	0	0	0	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3339	FIL	2020-06-05	0	0	0	0	0	0	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3340	FIL	2020-06-06	0	0	0	0	0	0	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3341	FIL	2020-06-07	0	0	0	0	0	0	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3342	FIL	2020-06-08	0	0	0	0	0	0	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3295	FIL	2020-04-22	0	0	0	0	0	0	2021-04-22 21:03:21	2021-04-22 21:03:21	13
3343	FIL	2020-06-09	0	0	0	0	0	0	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3344	FIL	2020-06-10	0	0	0	0	0	0	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3345	FIL	2020-06-11	0	0	0	0	0	0	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3346	FIL	2020-06-12	0	0	0	0	0	0	2021-05-07 19:24:30	2021-05-07 19:24:30	13
583	DOT	2020-11-24	5.734	5.914	6.086	5.605	1583394.03	9308443.58	2021-05-09 17:34:36	2021-05-09 17:34:36	4
584	DOT	2020-11-25	5.31	5.734	5.838	5.125	1103029.86	6103444.21	2021-05-09 17:34:36	2021-05-09 17:34:36	4
585	DOT	2020-11-26	4.808	5.31	5.378	4.452	2050170.85	9824853.31	2021-05-09 17:34:36	2021-05-09 17:34:36	4
586	DOT	2020-11-27	4.815	4.808	5.073	4.516	360408.17	1731073.59	2021-05-09 17:34:36	2021-05-09 17:34:36	4
587	DOT	2020-11-28	4.903	4.815	4.954	4.678	385238.44	1869955.11	2021-05-09 17:34:36	2021-05-09 17:34:36	4
588	DOT	2020-11-29	5.191	4.903	5.204	4.814	577725.52	2891437.49	2021-05-09 17:34:36	2021-05-09 17:34:36	4
315898	BCH	2021-06-19	552.64	563.07	581.66	552.05	43278.96	24545207.56	2021-06-20 23:44:23	2021-06-20 23:44:23	8
341044	SJCX	2021-08-12	0.001777	0.001822	0.001777	0.001777	0	0	2021-08-13 22:56:44	2021-08-13 22:56:44	11
341008	EOS	2021-08-12	4.665	4.758	5.087	4.541	7406245.66	34957126.19	2021-08-13 23:56:44	2021-08-13 23:56:44	9
327170	ETH	2021-07-13	1940.61	2032.88	2046.08	1917.9	407842.5	808408679.47	2021-07-14 23:49:51	2021-07-14 23:49:51	10
362556	DOT	2021-09-26	28.86	29.85	30.01	26.78	5139119.27	147547743.61	2021-09-27 23:07:05	2021-09-27 23:07:05	4
335022	SJCX	2021-07-30	0.001689	0.001601	0.001689	0.001689	0	0	2021-07-31 23:53:45	2021-07-31 23:53:45	11
321594	BTC	2021-07-01	33543.11	35056.39	35065.41	32757.33	36889.93	1238732543.23	2021-07-02 21:47:07	2021-07-02 21:47:07	7
351928	ZRX	2021-09-04	1.245	1.178	1.247	1.16	9908432.13	11924490.94	2021-09-05 23:02:02	2021-09-05 23:02:02	6
357312	ATOM	2021-09-15	34.05	34.17	35.31	32.69	793543.1	26743777.36	2021-09-16 23:04:33	2021-09-16 23:04:33	3
300336	BTC	2021-05-18	42886.02	43552.14	45819.36	42309.39	71930.7	3159184422.64	2021-05-19 23:36:58	2021-05-19 23:36:58	7
300348	DOT	2021-05-18	40.62	38.7	42.29	37.61	5648865.53	229441945.75	2021-05-19 23:37:06	2021-05-19 23:37:06	4
332698	ETH	2021-07-25	2194.34	2185.98	2197.07	2109.21	225699.63	486982701.92	2021-07-26 23:52:36	2021-07-26 23:52:36	10
352430	ATOM	2021-09-05	25.76	24.42	26.2	23.83	584118.3	14585492.62	2021-09-06 23:02:15	2021-09-06 23:02:15	3
357778	BCH	2021-09-16	639.36	653.17	655.16	626.6	73053.79	46808341.41	2021-09-17 23:04:46	2021-09-17 23:04:46	8
346182	FIL	2021-08-23	79.85	77.17	82.3	76.76	486673.66	38980624.64	2021-08-24 22:59:17	2021-08-24 22:59:17	13
321176	BCH	2021-06-30	526.66	523.07	533.86	499.07	54912.1	28306438.25	2021-07-01 23:46:54	2021-07-01 23:46:54	8
305506	ANT	2021-05-28	4.11	4.898	4.578	4.011	811285.66	3334742.64	2021-05-29 23:39:15	2021-05-29 23:39:15	14
384600	EOS	2021-11-09	5.206	4.86	5.379	4.839	20280459.42	103898010.23	2021-11-10 23:17:12	2021-11-10 23:17:12	9
384604	SJCX	2021-11-09	0.002678	0.002702	0.002678	0.002678	0	0	2021-11-10 23:17:12	2021-11-10 23:17:12	11
377758	DOT	2021-10-27	40.38	44.87	45.74	39.07	6231568.41	262907655.16	2021-10-28 23:14:15	2021-10-28 23:14:15	4
372706	DOT	2021-10-17	42.1	41.69	42.84	39.6	3718715.61	154760628.58	2021-10-18 23:11:57	2021-10-18 23:11:57	4
367766	ANT	2021-10-07	4.737	4.691	4.875	4.478	1922208670.67	9105203262.92	2021-10-08 23:09:38	2021-10-08 23:09:38	14
367754	FIL	2021-10-07	71.5	71.84	72.79	68.48	2337709.84	167138053.08	2021-10-08 23:09:39	2021-10-08 23:09:39	13
357342	ETH	2021-09-15	3615.22	3436.05	3617.68	3361.88	317503.69	1104834751.1	2021-09-16 23:04:32	2021-09-16 23:04:32	10
362524	ETH	2021-09-26	3064.21	2925.34	3116.4	2742.73	389358.67	1144546427.35	2021-09-27 23:07:05	2021-09-27 23:07:05	10
379338	BCH	2021-10-30	585.44	594.05	603.38	583.15	74877.87	43836169	2021-10-31 23:14:56	2021-10-31 23:14:56	8
310274	DOT	2021-06-07	21.69	24.14	25.28	21.29	1338033.21	31488678.61	2021-06-08 23:41:32	2021-06-08 23:41:32	4
300338	SJCX	2021-05-18	0.001715	0.001742	0.001715	0.001715	0	0	2021-05-19 23:36:58	2021-05-19 23:36:58	11
300346	EOS	2021-05-18	9.333	9.144	10.03	8.965	10995060.85	103323846.64	2021-05-19 23:37:16	2021-05-19 23:37:16	9
341042	ZRX	2021-08-12	0.9528	0.9929	1.025	0.9098	9011383.33	8635972.64	2021-08-13 23:56:44	2021-08-13 23:56:44	6
332700	DOT	2021-07-25	13.73	13.78	13.83	13.1	2066816.2	27769381.23	2021-07-26 23:52:36	2021-07-26 23:52:36	4
305978	BCH	2021-05-29	651.87	689.09	720.75	619.08	153599.95	102377291.83	2021-05-30 23:39:28	2021-05-30 23:39:28	8
305960	FIL	2021-05-29	68.25	66.77	69.82	64.77	958581.96	64314815.41	2021-05-30 23:39:29	2021-05-30 23:39:29	13
315450	ANT	2021-06-18	9.918	11.01	16.88	4.131	2321591.1	23025132.56	2021-06-19 22:44:09	2021-06-19 22:44:09	14
315910	ATOM	2021-06-19	11.9	12.41	12.71	11.82	548350.63	6767120.5	2021-06-20 23:44:23	2021-06-20 23:44:23	3
321578	FIL	2021-07-01	56.73	60.39	60.44	55.23	220947.37	12585706.93	2021-07-02 23:47:08	2021-07-02 23:47:08	13
335442	ETH	2021-07-31	2531.75	2463.61	2553.71	2422.41	257758.42	638035305.39	2021-08-01 23:53:59	2021-08-01 23:53:59	10
341010	ETH	2021-08-12	3047.29	3163.42	3239.16	2981.32	512136.49	1580516998.17	2021-08-13 23:56:44	2021-08-13 23:56:44	10
3351	FIL	2020-06-17	0	0	0	0	0	0	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3352	FIL	2020-06-18	0	0	0	0	0	0	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3353	FIL	2020-06-19	0	0	0	0	0	0	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3354	FIL	2020-06-20	0	0	0	0	0	0	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3355	FIL	2020-06-21	0	0	0	0	0	0	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3356	FIL	2020-06-22	0	0	0	0	0	0	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3357	FIL	2020-06-23	0	0	0	0	0	0	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3358	FIL	2020-06-24	0	0	0	0	0	0	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3359	FIL	2020-06-25	17.95	18.55	18.84	16.97	63.07	1131.89	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3360	FIL	2020-06-26	16.5	17.95	19.9	16.4	294.72	4863.72	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3361	FIL	2020-06-27	14	16.5	16.23	12.31	394.98	5528.57	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3362	FIL	2020-06-28	12.1	14	14.7	11.91	175.59	2125.12	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3364	FIL	2020-06-30	13.57	13.13	13.7	12.41	123.36	1673.71	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3365	FIL	2020-07-01	13.4	13.57	14.03	13.01	151.94	2035.45	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3366	FIL	2020-07-02	14.94	13.4	15.12	13.18	369.93	5526.56	2021-05-07 19:24:30	2021-05-07 19:24:30	13
2961	BCH	2020-05-24	222.93	234.34	224.41	219.36	171547.08	38243297.49	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3011	BCH	2020-07-13	231.96	237.36	236.21	226.14	218488.72	50681390.26	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3012	BCH	2020-07-14	230.2	231.96	232.51	228.44	178449.59	41078820.97	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3013	BCH	2020-07-15	227.26	230.2	228.82	226.25	149863.7	34057484.71	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3014	BCH	2020-07-16	224.13	227.26	225.96	218.74	159940.05	35847277.71	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3040	BCH	2020-08-11	281.54	302.55	292.24	276.3	245933.65	69239256.56	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3049	BCH	2020-08-20	294.67	292.58	296.12	289.13	137969.14	40424283.09	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3054	BCH	2020-08-25	275.9	290.97	281	271.48	202354.61	55829462.06	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3055	BCH	2020-08-26	274.86	275.9	279.56	274.75	128366.31	35282937.68	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3056	BCH	2020-08-27	264.69	274.86	273.98	263.11	208003.9	55057098.76	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3057	BCH	2020-08-28	268.89	264.69	272.35	267.04	124194.09	33394020.43	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3058	BCH	2020-08-29	268.3	268.89	271.28	265.66	106543.33	28585449.46	2021-05-09 17:34:36	2021-05-09 17:34:36	8
401	DOT	2020-05-26	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
402	DOT	2020-05-27	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
600	DOT	2020-12-11	4.617	4.802	4.802	4.547	256783.2	1192348.82	2021-05-09 17:34:36	2021-05-09 17:34:36	4
601	DOT	2020-12-12	4.735	4.617	4.797	4.617	211777.28	1001229.08	2021-05-09 17:34:36	2021-05-09 17:34:36	4
602	DOT	2020-12-13	4.885	4.735	5.842	4.735	513856.4	2560737.02	2021-05-09 17:34:36	2021-05-09 17:34:36	4
603	DOT	2020-12-14	4.897	4.885	5.011	4.836	289271.6	1414655	2021-05-09 17:34:36	2021-05-09 17:34:36	4
617	DOT	2020-12-28	6.586	5.143	6.677	5.112	3472851.01	21064050.96	2021-05-09 17:34:36	2021-05-09 17:34:36	4
618	DOT	2020-12-29	7.534	6.586	7.678	6.177	4585961.46	31090517.43	2021-05-09 17:34:36	2021-05-09 17:34:36	4
619	DOT	2020-12-30	7.236	7.534	7.661	7.054	2609067.97	19197043.64	2021-05-09 17:34:36	2021-05-09 17:34:36	4
626	DOT	2021-01-06	10.1	9.743	10.45	9.478	2081164.76	20802639.95	2021-05-09 17:34:36	2021-05-09 17:34:36	4
627	DOT	2021-01-07	9.657	10.1	10.69	9.433	3854410.07	38689711.1	2021-05-09 17:34:36	2021-05-09 17:34:36	4
628	DOT	2021-01-08	9.309	9.657	9.821	8.809	2552191.53	23620493.84	2021-05-09 17:34:36	2021-05-09 17:34:36	4
629	DOT	2021-01-09	9.774	9.309	9.84	8.924	1363896.29	12921322.61	2021-05-09 17:34:36	2021-05-09 17:34:36	4
630	DOT	2021-01-10	9.307	9.774	10	8.631	1703353.1	16096743.9	2021-05-09 17:34:36	2021-05-09 17:34:36	4
327172	ANT	2021-07-13	3.506	3.633	3.631	3.503	485481.31	1702186.33	2021-07-14 23:49:50	2021-07-14 23:49:50	14
341502	EOS	2021-08-13	5.161	4.665	5.163	4.61	5499222.46	26946187.96	2021-08-14 23:56:58	2021-08-14 23:56:58	9
341060	BCH	2021-08-12	606.13	621.18	649.51	592.93	82341.48	51032866.26	2021-08-13 22:56:44	2021-08-13 22:56:44	8
352434	ANT	2021-09-05	6.882	6.881	7.374	6.856	384707.58	2647601.75	2021-09-06 22:02:15	2021-09-06 22:02:15	14
351930	FIL	2021-09-04	95.06	77.67	96.65	77.52	918381.09	79631014.03	2021-09-05 23:02:02	2021-09-05 23:02:02	13
341470	BTC	2021-08-13	47832.93	44425.52	47890.79	44260.38	34442.64	1595718853.28	2021-08-14 23:56:58	2021-08-14 23:56:58	7
346184	ATOM	2021-08-23	21.76	21.89	23.12	21.28	4398873.6	96899832.04	2021-08-24 22:59:17	2021-08-24 22:59:17	3
357774	XTZ	2021-09-16	6.952	6.901	7.039	6.464	13128400.02	88318831.43	2021-09-17 23:04:46	2021-09-17 23:04:46	5
357314	BCH	2021-09-15	652.89	640.95	655.3	643.74	95656.19	62453255.14	2021-09-16 23:04:32	2021-09-16 23:04:32	8
362528	FIL	2021-09-26	55.85	60.47	60.69	50.02	1280116.98	71160429.31	2021-09-27 23:07:05	2021-09-27 23:07:05	13
367756	EOS	2021-10-07	4.722	4.744	4.842	4.553	7457335.25	35015290.46	2021-10-08 23:09:39	2021-10-08 23:09:39	9
372716	XTZ	2021-10-17	6.626	6.904	6.976	6.371	5755793.87	38567168.9	2021-10-18 23:11:57	2021-10-18 23:11:57	5
372708	ATOM	2021-10-17	32.43	33.1	34.26	31.19	1556540.53	51014358.12	2021-10-18 23:11:57	2021-10-18 23:11:57	3
377760	EOS	2021-10-27	4.153	4.715	4.771	3.872	12730836.29	54379984.73	2021-10-28 23:14:15	2021-10-28 23:14:15	9
379356	FIL	2021-10-30	61.3	60.19	61.46	57.43	331424.38	19565385.4	2021-10-31 23:14:56	2021-10-31 23:14:56	13
332702	BTC	2021-07-25	35369.93	34282.56	35382.63	33892.36	22685.72	781929775.48	2021-07-26 23:52:36	2021-07-26 23:52:36	7
3059	BCH	2020-08-30	279.44	268.3	279.79	272.76	153799.29	42977593.47	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3060	BCH	2020-08-31	273.73	279.44	280.37	273.26	118451.42	32423159.81	2021-05-09 17:34:36	2021-05-09 17:34:36	8
321580	BCH	2021-07-01	497.11	526.9	504.15	490.74	217319.52	108031465.41	2021-07-02 23:47:08	2021-07-02 23:47:08	8
315464	ZRX	2021-06-18	0.8162	0.8748	0.8827	0.7824	3968724.17	3289768.95	2021-06-19 23:44:09	2021-06-19 23:44:09	6
300340	FIL	2021-05-18	100.18	99.37	106.07	96.94	743138.48	75401811.65	2021-05-19 23:37:03	2021-05-19 23:37:03	13
352436	BCH	2021-09-05	765.08	709.06	767.34	699.29	76034.87	55366663.88	2021-09-06 23:02:15	2021-09-06 23:02:15	8
305962	ATOM	2021-05-29	12.08	12.69	14.35	11.42	2216160.87	28750390.21	2021-05-30 23:39:29	2021-05-30 23:39:29	3
327174	BCH	2021-07-13	465.2	479.45	477.31	465.2	111089.79	51678909.06	2021-07-14 23:49:51	2021-07-14 23:49:51	8
346186	OCN	2021-08-23	0.001163	0.001167	0.001196	0.00113	975954.69	1134.99	2021-08-24 23:59:17	2021-08-24 23:59:17	2
357316	OCN	2021-09-15	0.00094	0.0009621	0.001157	0.00094	13075705.23	12290.6	2021-09-16 23:04:33	2021-09-16 23:04:33	2
3371	FIL	2020-07-07	25.03	25.72	27.77	22.34	234.57	5871.71	2021-05-07 19:24:30	2021-05-07 19:24:30	13
403	DOT	2020-05-28	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
405	DOT	2020-05-30	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
3372	FIL	2020-07-08	24.9	25.03	26.49	23.34	179.52	4470.16	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3373	FIL	2020-07-09	25.65	24.9	27.33	23.56	281.04	7207.92	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3374	FIL	2020-07-10	25.97	25.65	26.94	25.4	124.69	3238.3	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3375	FIL	2020-07-11	24.88	25.97	26.21	24.13	70.13	1745.17	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3376	FIL	2020-07-12	24.87	24.88	27.55	23.25	351.41	8739.83	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3377	FIL	2020-07-13	24.91	24.87	24.94	24.51	318.81	7943.02	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3378	FIL	2020-07-14	20.4	24.91	24.96	19.84	214.06	4366.9	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3379	FIL	2020-07-15	19.57	20.4	22.06	19.56	198.93	3893.53	2021-05-07 19:24:30	2021-05-07 19:24:30	13
406	DOT	2020-05-31	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
407	DOT	2020-06-01	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
3399	FIL	2020-08-04	19.3	19.21	20.15	18.36	94.93	1832.03	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3400	FIL	2020-08-05	18.64	19.3	21.14	18.33	74.04	1380.01	2021-05-07 19:24:30	2021-05-07 19:24:30	13
408	DOT	2020-06-02	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
409	DOT	2020-06-03	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
3401	FIL	2020-08-06	19.26	18.64	19.54	18.34	81.62	1571.82	2021-05-07 19:24:30	2021-05-07 19:24:30	13
410	DOT	2020-06-04	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
411	DOT	2020-06-05	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
412	DOT	2020-06-06	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
413	DOT	2020-06-07	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
414	DOT	2020-06-08	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
415	DOT	2020-06-09	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
416	DOT	2020-06-10	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
417	DOT	2020-06-11	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
418	DOT	2020-06-12	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
419	DOT	2020-06-13	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
420	DOT	2020-06-14	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
442	DOT	2020-07-06	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
443	DOT	2020-07-07	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
1243	SJCX	2020-09-13	0.0004133	0.0004179	0.0004133	0.0004133	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1244	SJCX	2020-09-14	0.0004271	0.0004133	0.0004271	0.0004271	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
310302	SJCX	2021-06-07	0.001343	0.001432	0.001343	0.001343	0	0	2021-06-08 23:41:33	2021-06-08 23:41:33	11
379856	ETH	2021-10-31	4290.1	4323.94	4395.57	4170.69	265619.86	1135939130.48	2021-11-01 23:15:09	2021-11-01 23:15:09	10
377762	FIL	2021-10-27	55.36	62.81	63.2	52.2	862681.59	49489028.53	2021-10-28 23:14:15	2021-10-28 23:14:15	13
351932	BTC	2021-09-04	49935.29	50019.51	50549.35	49501.12	16795.12	839888927.54	2021-09-05 23:02:01	2021-09-05 23:02:01	7
362534	BCH	2021-09-26	504	517.61	519.81	482.22	68865.51	34798140.17	2021-09-27 23:07:05	2021-09-27 23:07:05	8
351962	DOT	2021-09-04	32.38	33.59	34.14	32.06	848443.64	28063960.71	2021-09-05 23:02:02	2021-09-05 23:02:02	4
335444	ATOM	2021-07-31	12.58	12.14	12.93	11.89	1331835.98	16564462.33	2021-08-01 23:53:59	2021-08-01 23:53:59	3
367758	ZRX	2021-10-07	1.027	1.037	1.041	0.9945	8600165.24	8737901.44	2021-10-08 23:09:39	2021-10-08 23:09:39	6
335914	BCH	2021-08-01	526.29	545.39	537.06	521.51	134089.88	70570703.6	2021-08-02 23:54:12	2021-08-02 23:54:12	8
341012	FIL	2021-08-12	68.42	71.4	71.42	66.18	444891.94	30371897.55	2021-08-13 22:56:44	2021-08-13 22:56:44	13
385106	ETH	2021-11-10	4632.98	4732.07	4865.94	4488.21	453846.25	2133668813.42	2021-11-11 23:17:26	2021-11-11 23:17:26	10
372710	EOS	2021-10-17	4.412	4.563	4.6	4.23	4818429.53	21351931.69	2021-10-18 23:11:57	2021-10-18 23:11:57	9
384608	ATOM	2021-11-09	35.82	36.65	37.94	35.54	2229224.39	81546471.27	2021-11-10 23:17:12	2021-11-10 23:17:12	3
384614	OCN	2021-11-09	0.0006694	0.0006755	0.0006694	0.0006694	30329563.22	20302.38	2021-11-10 23:22:05	2021-11-10 23:22:05	2
310748	XTZ	2021-06-08	3.45	3.488	3.604	3.082	11638761.75	38734862.23	2021-06-09 23:41:49	2021-06-09 23:41:49	5
315896	DOT	2021-06-19	20.25	21.38	21.62	20.23	805731.51	16886324.4	2021-06-20 23:44:23	2021-06-20 23:44:23	4
300350	OCN	2021-05-18	0.001115	0.001148	0.00125	0.001047	75562683.4	84224.02	2021-05-19 23:36:58	2021-05-19 23:36:58	2
341014	ANT	2021-08-12	4.607	4.752	4.665	4.465	161355.69	743353.79	2021-08-13 23:56:44	2021-08-13 23:56:44	14
321612	SJCX	2021-07-01	0.001342	0.001402	0.001342	0.001342	0	0	2021-07-02 21:47:07	2021-07-02 21:47:07	11
321582	XTZ	2021-07-01	2.948	3.042	3.064	2.84	2327919.25	6849752.29	2021-07-02 23:47:08	2021-07-02 23:47:08	5
372712	OCN	2021-10-17	0.0006152	0.0006088	0.00123	0.0006152	162682254.77	100083	2021-10-18 23:11:58	2021-10-18 23:11:58	2
351934	ATOM	2021-09-04	24.42	24.12	25.46	23.77	583569.8	14258501.91	2021-09-05 23:02:01	2021-09-05 23:02:01	3
367760	SJCX	2021-10-07	0.002152	0.002214	0.002152	0.002152	0	0	2021-10-08 23:09:39	2021-10-08 23:09:39	11
305964	ETH	2021-05-29	2278.58	2412.36	2573.27	2208.58	1080128.04	2557596064.82	2021-05-30 23:39:28	2021-05-30 23:39:28	10
335446	BCH	2021-07-31	545.39	552.81	550.78	538.76	99244.41	54127163.63	2021-08-01 23:53:59	2021-08-01 23:53:59	8
377764	BTC	2021-10-27	58464.42	60315.68	61473	58128.18	45852.35	2719093218.08	2021-10-28 23:14:15	2021-10-28 23:14:15	7
341500	XTZ	2021-08-13	3.592	3.35	3.595	3.303	4152060.8	14573076.61	2021-08-14 23:56:58	2021-08-14 23:56:58	5
346188	SJCX	2021-08-23	0.001981	0.001972	0.001981	0.001981	0	0	2021-08-24 23:59:17	2021-08-24 23:59:17	11
327176	XTZ	2021-07-13	2.809	2.813	2.916	2.768	3856393.01	10971007.53	2021-07-14 23:49:51	2021-07-14 23:49:51	5
362978	ETH	2021-09-27	2927.73	3064.21	3166.17	2925.7	362312.15	1109513874.46	2021-09-28 23:07:18	2021-09-28 23:07:18	10
332704	OCN	2021-07-25	0.0009655	0.0008088	0.001097	0.0008119	38148661.73	36832.9	2021-07-26 23:52:36	2021-07-26 23:52:36	2
357810	FIL	2021-09-16	84.74	86.34	90.62	82.28	617935.55	53442293.54	2021-09-17 23:04:46	2021-09-17 23:04:46	13
335906	OCN	2021-08-01	0.0008692	0.0008608	0.0008947	0.0008181	23219571.42	20181.97	2021-08-02 23:54:13	2021-08-02 23:54:13	2
357318	XTZ	2021-09-15	6.901	7.12	7.639	6.734	17323720.32	124104727.47	2021-09-16 22:04:32	2021-09-16 22:04:32	5
357782	ETH	2021-09-16	3569.26	3615.22	3673.8	3484.59	398716.08	1431008091.48	2021-09-17 23:04:46	2021-09-17 23:04:46	10
379858	ZRX	2021-10-31	1.184	1.152	1.667	1.135	104937802.77	144374247.82	2021-11-01 23:15:09	2021-11-01 23:15:09	6
384610	ZRX	2021-11-09	1.309	1.264	1.449	1.249	34085898.03	46222120.6	2021-11-10 23:17:12	2021-11-10 23:17:12	6
385138	DOT	2021-11-10	46.82	50.77	52.01	42.54	6513228.74	315421422.88	2021-11-11 23:17:26	2021-11-11 23:17:26	4
385116	EOS	2021-11-10	4.847	5.206	5.392	4.548	14202567.84	72477833.25	2021-11-11 23:17:26	2021-11-11 23:17:26	9
3612	FIL	2021-03-05	40.45	40.79	40.79	38.39	225227.08	8896141.93	2021-05-07 19:24:30	2021-05-07 19:24:30	13
565	DOT	2020-11-06	4.584	4.23	4.644	4.213	263426.15	1179126.9	2021-05-09 17:34:36	2021-05-09 17:34:36	4
566	DOT	2020-11-07	4.239	4.584	4.858	4.103	399077.1	1762229.97	2021-05-09 17:34:36	2021-05-09 17:34:36	4
574	DOT	2020-11-15	4.371	4.47	4.499	4.312	202281.8	893146.21	2021-05-09 17:34:36	2021-05-09 17:34:36	4
575	DOT	2020-11-16	4.489	4.371	4.591	4.348	460970.86	2071778.27	2021-05-09 17:34:36	2021-05-09 17:34:36	4
576	DOT	2020-11-17	4.855	4.489	4.933	4.489	1141143.39	5484329.31	2021-05-09 17:34:36	2021-05-09 17:34:36	4
577	DOT	2020-11-18	4.688	4.855	4.947	4.525	548040.08	2587333.05	2021-05-09 17:34:36	2021-05-09 17:34:36	4
580	DOT	2020-11-21	5.781	5.238	5.82	5.139	1113974.32	6110674.68	2021-05-09 17:34:36	2021-05-09 17:34:36	4
581	DOT	2020-11-22	5.515	5.781	5.838	5.211	899268.73	4980503.78	2021-05-09 17:34:36	2021-05-09 17:34:36	4
589	DOT	2020-11-30	5.377	5.191	5.447	5.142	618330.5	3283838.42	2021-05-09 17:34:36	2021-05-09 17:34:36	4
590	DOT	2020-12-01	5.091	5.377	5.539	4.994	904045.7	4718349.9	2021-05-09 17:34:36	2021-05-09 17:34:36	4
591	DOT	2020-12-02	5.465	5.091	5.55	5.011	504203.3	2694519.76	2021-05-09 17:34:36	2021-05-09 17:34:36	4
592	DOT	2020-12-03	5.407	5.465	5.574	5.333	469664.14	2563534.17	2021-05-09 17:34:36	2021-05-09 17:34:36	4
593	DOT	2020-12-04	5.025	5.407	5.433	4.965	545783.23	2839676.22	2021-05-09 17:34:36	2021-05-09 17:34:36	4
3613	FIL	2021-03-06	40.39	40.45	40.88	38.98	367797.6	14803135.01	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3614	FIL	2021-03-07	41.43	40.39	41.74	40.32	144840.47	5956419.17	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3615	FIL	2021-03-08	41.56	41.43	41.94	40.61	302958.07	12470957.21	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3616	FIL	2021-03-09	42	41.56	42.51	41.19	314308.05	13122574.3	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3617	FIL	2021-03-10	42.51	42	44.17	41.12	294587.08	12503423.11	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3624	FIL	2021-03-17	88.45	63.58	116.98	62.57	2519602.76	222193039.97	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3625	FIL	2021-03-18	79.54	88.45	89.82	73.99	2001604.43	164202143.6	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3627	FIL	2021-03-20	81.93	83.02	85.9	81.41	508398.03	42179177.56	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3628	FIL	2021-03-21	80.61	81.93	83.19	80.34	385223.2	31412531.01	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3629	FIL	2021-03-22	76.34	80.61	81.34	75.27	494272.89	38657228.14	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3630	FIL	2021-03-23	82.41	76.34	85.5	73.38	728137.71	58069352.9	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3631	FIL	2021-03-24	85.92	82.41	94.79	79.77	818157.93	71739789.59	2021-05-07 19:24:30	2021-05-07 19:24:30	13
300352	ZRX	2021-05-18	1.601	1.468	1.704	1.45	18743127.46	30051413.62	2021-05-19 23:36:58	2021-05-19 23:36:58	6
300354	ANT	2021-05-18	7.05	6.89	7.149	6.716	500691.89	3530108.99	2021-05-19 23:36:59	2021-05-19 23:36:59	14
335448	EOS	2021-07-31	4.07	4.068	4.197	4.004	3459876.85	14118977.74	2021-08-01 23:53:59	2021-08-01 23:53:59	9
321584	ANT	2021-07-01	3.491	3.677	3.692	3.391	70590.7	248155.32	2021-07-02 23:47:08	2021-07-02 23:47:08	14
351936	OCN	2021-09-04	0.001205	0.001064	0.001205	0.001049	8064494.61	9717.5	2021-09-05 23:02:01	2021-09-05 23:02:01	2
310824	BCH	2021-06-08	596	596.32	605	544.11	136519.39	78978344.3	2021-06-09 23:41:48	2021-06-09 23:41:48	8
310750	OCN	2021-06-08	0.0007779	0.0007779	0.001004	0.0007277	79586433.67	61907.21	2021-06-09 23:41:50	2021-06-09 23:41:50	2
305966	BTC	2021-05-29	34611.58	35680.92	37307.1	33666.06	60616.25	2127790128.94	2021-05-30 23:39:28	2021-05-30 23:39:28	7
3515	FIL	2020-11-28	29.96	29.97	31.36	29.79	52665.06	1577986.92	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3516	FIL	2020-11-29	30.01	29.96	31.03	29.85	34136.68	1024459.87	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3570	FIL	2021-01-22	22.28	21.3	23.2	20.69	818209.88	18081155.38	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3571	FIL	2021-01-23	22.72	22.28	23.55	21.77	368107.28	8374576.42	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3572	FIL	2021-01-24	22.74	22.72	23.19	22.45	156826.76	3571539.02	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3573	FIL	2021-01-25	22.43	22.74	23.03	22.36	217420.93	4938160.61	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3574	FIL	2021-01-26	22.21	22.43	22.73	21.82	187855.63	4170584.89	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3575	FIL	2021-01-27	21.47	22.21	22.23	21.2	229894.66	4991987.89	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3576	FIL	2021-01-28	21.95	21.46	23.85	21.67	269244.52	5909705.02	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3577	FIL	2021-01-29	22.29	21.94	22.94	21.9	309689.12	6904506.62	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3578	FIL	2021-01-30	22.05	22.29	22.59	21.98	207312.23	4600666.53	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3632	FIL	2021-03-25	90.92	85.92	96.04	85.05	823370.43	74287320.72	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3633	FIL	2021-03-26	124.31	90.92	128.94	90.92	1525952.96	167333562.33	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3634	FIL	2021-03-27	132.55	124.31	139.57	119.75	1596514.92	208655644.88	2021-05-07 19:24:30	2021-05-07 19:24:30	13
315900	ETH	2021-06-19	2166.61	2233.57	2278.35	2164.05	321968.53	715881808.7	2021-06-20 23:44:23	2021-06-20 23:44:23	10
332706	FIL	2021-07-25	48.99	49.59	50.14	47.17	390538.69	18943997.92	2021-07-26 21:52:35	2021-07-26 21:52:35	13
346190	DOT	2021-08-23	27.87	27.72	28.63	27.35	1528764.39	42915173.62	2021-08-24 23:59:17	2021-08-24 23:59:17	4
341476	ETH	2021-08-13	3324.26	3047.29	3328.83	3035.99	447889.8	1440675493.43	2021-08-14 23:56:58	2021-08-14 23:56:58	10
327178	ZRX	2021-07-13	0.7143	0.7527	0.7545	0.7048	3863146.34	2805195.27	2021-07-14 23:49:51	2021-07-14 23:49:51	6
341016	BTC	2021-08-12	44425.52	45556.69	46214.21	43786.4	35460.2	1588850342.27	2021-08-13 23:56:44	2021-08-13 23:56:44	7
352438	SJCX	2021-09-05	0.002071	0.001997	0.002071	0.002071	0	0	2021-09-06 23:02:35	2021-09-06 23:02:35	11
335904	DOT	2021-08-01	18.42	16.79	19.88	16.58	6137799.86	115048736.5	2021-08-02 23:54:13	2021-08-02 23:54:13	4
357776	BTC	2021-09-16	47764.47	48148.45	48498.51	47050.55	25702.33	1229076140.65	2021-09-17 23:04:46	2021-09-17 23:04:46	7
357320	SJCX	2021-09-15	0.001926	0.001885	0.001926	0.001926	0	0	2021-09-16 22:04:32	2021-09-16 22:04:32	11
362980	XTZ	2021-09-27	6.04	6.527	6.675	6.01	11295884.36	71591440.66	2021-09-28 22:07:18	2021-09-28 22:07:18	5
367764	OCN	2021-10-07	0.000538	0.0005534	0.001076	0.000538	158189409.44	85101.49	2021-10-08 23:09:41	2021-10-08 23:09:41	2
367762	BCH	2021-10-07	611.67	617.63	627.81	589.08	1023925.94	626309159.77	2021-10-08 23:09:38	2021-10-08 23:09:38	8
372714	SJCX	2021-10-17	0.002461	0.002435	0.002461	0.002461	0	0	2021-10-18 23:11:58	2021-10-18 23:11:58	11
377766	BCH	2021-10-27	548.85	611.74	619.12	534.36	123994.76	70603281.56	2021-10-28 23:14:15	2021-10-28 23:14:15	8
379860	ANT	2021-10-31	4.677	4.45	4.767	4.411	218195.81	1020568.34	2021-11-01 23:15:09	2021-11-01 23:15:09	14
385108	XTZ	2021-11-10	5.778	6.298	6.472	5.331	10488518.06	61948677.37	2021-11-11 23:17:26	2021-11-11 23:17:26	5
384612	FIL	2021-11-09	66.68	64.27	69.43	63.55	944681.3	62882460.03	2021-11-10 23:17:12	2021-11-10 23:17:12	13
631	DOT	2021-01-11	8.295	9.307	9.32	7.194	3975607.66	31474804.13	2021-05-09 17:34:36	2021-05-09 17:34:36	4
167	XTZ	2020-10-05	2.144	2.115	2.167	2.08	1522864.06	3242405.6	2021-05-07 19:24:31	2021-05-07 19:24:31	5
168	XTZ	2020-10-06	2.064	2.144	2.245	2.04	3936475.3	8358066.17	2021-05-07 19:24:31	2021-05-07 19:24:31	5
169	XTZ	2020-10-07	2.067	2.064	2.127	2.035	3726358.69	7743632.36	2021-05-07 19:24:31	2021-05-07 19:24:31	5
170	XTZ	2020-10-08	2.114	2.067	2.15	2.01	3406562.61	7098769.02	2021-05-07 19:24:31	2021-05-07 19:24:31	5
171	XTZ	2020-10-09	2.197	2.114	2.238	2.077	3457252.39	7491390.97	2021-05-07 19:24:31	2021-05-07 19:24:31	5
172	XTZ	2020-10-10	2.211	2.197	2.284	2.193	3076580.19	6900596.01	2021-05-07 19:24:31	2021-05-07 19:24:31	5
173	XTZ	2020-10-11	2.252	2.211	2.314	2.19	2972067.87	6694520.67	2021-05-07 19:24:31	2021-05-07 19:24:31	5
632	DOT	2021-01-12	8.303	8.295	8.716	7.927	1118487.65	9263668.03	2021-05-09 17:34:36	2021-05-09 17:34:36	4
3088	BCH	2020-09-28	225.86	229.43	230.35	223.93	258804.99	58452631.35	2021-05-09 17:34:36	2021-05-09 17:34:36	8
633	DOT	2021-01-13	10.94	8.303	11.61	7.974	4512553.62	44993136.25	2021-05-09 17:34:36	2021-05-09 17:34:36	4
2943	BCH	2020-05-06	241.55	247.05	252.08	240.91	550192.88	132900712.13	2021-05-04 22:03:21	2021-05-04 22:03:21	8
1322	SJCX	2020-12-01	0.0007517	0.0007875	0.0007517	0.0007517	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
3089	BCH	2020-09-29	229.08	225.86	232.11	227.88	247583.27	56715498.48	2021-05-09 17:34:36	2021-05-09 17:34:36	8
1323	SJCX	2020-12-02	0.000769	0.0007517	0.000769	0.000769	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
3090	BCH	2020-09-30	228.09	229.08	230.57	226.91	221171.68	50447607.44	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3091	BCH	2020-10-01	228.07	228.09	228.39	224.03	164480.68	37513322.73	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3092	BCH	2020-10-02	219.78	228.07	227.19	216.5	239033.01	52535291.45	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3093	BCH	2020-10-03	218.74	219.78	221.17	218.11	141374.18	30924723.83	2021-05-09 17:34:36	2021-05-09 17:34:36	8
1324	SJCX	2020-12-03	0.0007779	0.000769	0.0007779	0.0007779	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1325	SJCX	2020-12-04	0.0007466	0.0007779	0.0007466	0.0007466	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1326	SJCX	2020-12-05	0.0007663	0.0007466	0.0007663	0.0007663	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1327	SJCX	2020-12-06	0.0007752	0.0007663	0.0007752	0.0007752	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1328	SJCX	2020-12-07	0.0007673	0.0007752	0.0007673	0.0007673	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1329	SJCX	2020-12-08	0.0007329	0.0007673	0.0007329	0.0007329	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
300906	FIL	2021-05-19	65.66	100.18	101.72	57.08	1513574.95	119791669.08	2021-05-20 23:37:12	2021-05-20 23:37:12	13
10745	ATOM	2020-04-25	2.877	2.751	2.97	2.67	825295.75	2340911.03	2021-04-24 20:20:48	2021-04-24 20:20:48	3
310752	EOS	2021-06-08	5.055	5.191	5.255	4.509	13114929.69	64259939.98	2021-06-09 23:41:49	2021-06-09 23:41:49	9
335450	XTZ	2021-07-31	3.036	2.967	3.103	2.923	3738009.79	11318098.77	2021-08-01 23:53:59	2021-08-01 23:53:59	5
327640	ATOM	2021-07-14	11.75	12.11	12.24	11.03	1731499.43	20121425.17	2021-07-15 23:50:04	2021-07-15 23:50:04	3
3094	BCH	2020-10-04	220.98	218.74	223.23	219.6	128413.86	28377313.93	2021-05-09 17:34:36	2021-05-09 17:34:36	8
341498	OCN	2021-08-13	0.001263	0.001219	0.00133	0.001197	4474170.95	5651.86	2021-08-14 19:56:56	2021-08-14 19:56:56	2
3095	BCH	2020-10-05	221.84	220.98	224.32	220.98	152526.06	33836306.49	2021-05-09 17:34:36	2021-05-09 17:34:36	8
10944	ATOM	2020-11-10	5.091	5.14	5.282	4.921	473599.04	2410493.35	2021-05-09 17:34:36	2021-05-09 17:34:36	3
315904	XTZ	2021-06-19	3.032	3.095	3.176	3.023	2089778.46	6497172.63	2021-06-20 22:44:23	2021-06-20 22:44:23	5
305968	SJCX	2021-05-29	0.001384	0.001427	0.001384	0.001384	0	0	2021-05-30 23:39:28	2021-05-30 23:39:28	11
2944	BCH	2020-05-07	252.4	241.55	266	248.5	471033.77	118888091.33	2021-05-07 19:24:30	2021-05-07 19:24:30	8
321586	ATOM	2021-07-01	11.05	12.04	12.07	10.72	963890.73	10789513.6	2021-07-02 21:47:07	2021-07-02 21:47:07	3
332708	EOS	2021-07-25	3.66	3.67	3.697	3.553	1956637.77	7086031.87	2021-07-26 21:52:35	2021-07-26 21:52:35	9
3521	FIL	2020-12-04	29.04	30.48	29.98	28.69	88893.68	2581716.04	2021-05-07 19:24:30	2021-05-07 19:24:30	13
10945	ATOM	2020-11-11	5.042	5.091	5.298	5.023	587444.05	3024782.48	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10946	ATOM	2020-11-12	5.037	5.042	5.315	4.947	1152891.4	5929998.87	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10947	ATOM	2020-11-13	5.22	5.037	5.264	5.025	624955.48	3228194.66	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10948	ATOM	2020-11-14	5.053	5.22	5.249	4.997	458997.55	2339229.05	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10949	ATOM	2020-11-15	4.979	5.053	5.127	4.867	386136.34	1930928.39	2021-05-09 17:34:36	2021-05-09 17:34:36	3
3522	FIL	2020-12-05	29.88	29.04	30.23	29.62	38550.06	1152055.84	2021-05-07 19:24:30	2021-05-07 19:24:30	13
10950	ATOM	2020-11-16	5.089	4.979	5.184	4.935	471494.48	2403826.09	2021-05-09 17:34:36	2021-05-09 17:34:36	3
594	DOT	2020-12-05	5.188	5.025	5.191	4.885	330129.18	1670944.13	2021-05-09 17:34:36	2021-05-09 17:34:36	4
595	DOT	2020-12-06	5.135	5.188	5.201	5.011	180353.85	918907	2021-05-09 17:34:36	2021-05-09 17:34:36	4
596	DOT	2020-12-07	5.059	5.135	5.152	5.015	122762.71	623511.54	2021-05-09 17:34:36	2021-05-09 17:34:36	4
597	DOT	2020-12-08	4.734	5.059	5.069	4.704	696625.22	3362304.21	2021-05-09 17:34:36	2021-05-09 17:34:36	4
598	DOT	2020-12-09	4.876	4.734	4.939	4.623	599604.16	2871091.54	2021-05-09 17:34:36	2021-05-09 17:34:36	4
599	DOT	2020-12-10	4.802	4.876	4.911	4.751	324895.39	1570221.15	2021-05-09 17:34:36	2021-05-09 17:34:36	4
328110	OCN	2021-07-15	0.001074	0.001336	0.001285	0.0009399	46113492.48	49533.97	2021-07-16 23:50:18	2021-07-16 23:50:18	2
335896	XTZ	2021-08-01	2.956	3.036	3.179	2.908	5092174.22	15750784.94	2021-08-02 23:54:12	2021-08-02 23:54:12	5
341468	DOT	2021-08-13	22.74	20.76	22.75	20.54	3137661.56	68441721.19	2021-08-14 23:56:58	2021-08-14 23:56:58	4
341018	DOT	2021-08-12	20.76	21.33	21.33	19.96	1399969	28717951.38	2021-08-13 22:56:44	2021-08-13 22:56:44	4
346222	XTZ	2021-08-23	4.314	3.803	4.428	3.781	14713613.35	60972429.53	2021-08-24 23:59:17	2021-08-24 23:59:17	5
351938	ANT	2021-09-04	6.88	7.267	7.309	6.842	76089.17	538072.5	2021-09-05 23:02:02	2021-09-05 23:02:02	14
357322	ANT	2021-09-15	6.163	5.99	6.688	6.014	464278.37	2861348.34	2021-09-16 23:04:32	2021-09-16 23:04:32	14
357784	DOT	2021-09-16	35.54	36.47	36.95	34.09	4013522.62	141568139.05	2021-09-17 21:04:45	2021-09-17 21:04:45	4
362982	OCN	2021-09-27	0.0004219	0.000432	0.0008438	0.0004219	60187115.34	25391.45	2021-09-28 23:07:18	2021-09-28 23:07:18	2
367784	ATOM	2021-10-07	36.68	35.15	37.98	32.77	2809029.49	101154215.43	2021-10-08 23:09:39	2021-10-08 23:09:39	3
372754	BCH	2021-10-17	612.05	624.9	628.43	590.5	60902.78	37266535.96	2021-10-18 23:11:58	2021-10-18 23:11:58	8
377790	ANT	2021-10-27	4.393	4.81	4.664	4.378	196232.15	862051.08	2021-10-28 23:14:15	2021-10-28 23:14:15	14
379862	XTZ	2021-10-31	6.357	6.308	6.558	6.02	6757470.53	42510480.79	2021-11-01 23:15:09	2021-11-01 23:15:09	5
310754	ATOM	2021-06-08	13.59	13.47	13.84	12.04	1616934.1	21029422.29	2021-06-09 23:41:49	2021-06-09 23:41:49	3
357324	DOT	2021-09-15	36.47	37.37	38.04	35.59	3648810.46	133405587.01	2021-09-16 23:04:32	2021-09-16 23:04:32	4
315934	OCN	2021-06-19	0.0007583	0.0007371	0.00078	0.0006933	52554300	39852.64	2021-06-20 23:44:23	2021-06-20 23:44:23	2
368292	OCN	2021-10-08	0.0005395	0.000538	0.0005395	0.0005395	56784502.39	30634.84	2021-10-09 23:09:52	2021-10-09 23:09:52	2
368270	FIL	2021-10-08	79.5	71.45	81.26	70.62	700464.18	53716384.18	2021-10-09 23:09:52	2021-10-09 23:09:52	13
321590	OCN	2021-07-01	0.0004851	0.0005008	0.0005062	0.000464	15014691.33	7284.18	2021-07-02 23:47:08	2021-07-02 23:47:08	2
351940	XTZ	2021-09-04	5.404	5.312	5.596	5.244	5722003.73	30915159.11	2021-09-05 23:02:02	2021-09-05 23:02:02	5
634	DOT	2021-01-14	14.47	10.94	14.65	10.89	4894426.04	59902486.24	2021-05-09 17:34:36	2021-05-09 17:34:36	4
635	DOT	2021-01-15	13.2	14.47	14.92	11.78	5088115.43	69419655.77	2021-05-09 17:34:36	2021-05-09 17:34:36	4
636	DOT	2021-01-16	18	13.2	19.43	13.18	7409774.4	122644664.73	2021-05-09 17:34:36	2021-05-09 17:34:36	4
656	DOT	2021-02-05	20.87	19.72	21.4	19.39	2248458.18	46509286.6	2021-05-09 17:34:36	2021-05-09 17:34:36	4
657	DOT	2021-02-06	20.4	20.87	21.4	19.87	1304224.46	26602912.17	2021-05-09 17:34:36	2021-05-09 17:34:36	4
658	DOT	2021-02-07	19.8	20.4	20.82	18.34	1828344.28	35862150.96	2021-05-09 17:34:36	2021-05-09 17:34:36	4
659	DOT	2021-02-08	23.02	19.8	23.71	19.22	2916289.44	64298988.24	2021-05-09 17:34:36	2021-05-09 17:34:36	4
660	DOT	2021-02-09	23.12	23.02	24.13	22.28	1734653.77	40194496.65	2021-05-09 17:34:36	2021-05-09 17:34:36	4
661	DOT	2021-02-10	23.6	23.12	24.84	22.06	2317582.9	54349307.5	2021-05-09 17:34:36	2021-05-09 17:34:36	4
662	DOT	2021-02-11	25.02	23.6	25.72	23.27	2260166.51	56329950.86	2021-05-09 17:34:36	2021-05-09 17:34:36	4
663	DOT	2021-02-12	28.69	25.02	29.76	24.54	2312393.38	63172930	2021-05-09 17:34:36	2021-05-09 17:34:36	4
664	DOT	2021-02-13	27.98	28.69	30.23	27.29	2352783.82	67103006.76	2021-05-09 17:34:36	2021-05-09 17:34:36	4
665	DOT	2021-02-14	26.93	27.98	29.4	26.47	1512717.97	41975006.49	2021-05-09 17:34:36	2021-05-09 17:34:36	4
666	DOT	2021-02-15	27.84	26.93	29.55	23.42	2700543.24	72517914.11	2021-05-09 17:34:36	2021-05-09 17:34:36	4
667	DOT	2021-02-16	30.06	27.84	30.98	26.85	2681474.87	79417285.1	2021-05-09 17:34:36	2021-05-09 17:34:36	4
668	DOT	2021-02-17	32	30.06	32.4	29.65	1915882.18	59158073.26	2021-05-09 17:34:36	2021-05-09 17:34:36	4
669	DOT	2021-02-18	31.05	32	32.61	30.6	1083778.6	34071469.23	2021-05-09 17:34:36	2021-05-09 17:34:36	4
351964	EOS	2021-09-04	5.696	5.674	5.886	5.557	11510725	65776716.66	2021-09-05 23:02:02	2021-09-05 23:02:02	9
327642	DOT	2021-07-14	13.8	14.18	14.21	13.19	1010151.99	13883017.46	2021-07-15 22:50:04	2021-07-15 22:50:04	4
341478	BCH	2021-08-13	654.85	606.13	655.56	602.05	79621.59	50269015.92	2021-08-14 22:56:58	2021-08-14 22:56:58	8
347134	ETH	2021-08-25	3228.86	3172.57	3248.84	3080.23	309242.57	982903687.8	2021-08-26 23:59:45	2021-08-26 23:59:45	10
335452	BTC	2021-07-31	41474.72	42231.83	42373.59	41065.61	25355.65	1056705603.97	2021-08-01 23:53:59	2021-08-01 23:53:59	7
373218	BTC	2021-10-18	62038.16	61520.54	62662.72	59925.93	50489.09	3113486441.7	2021-10-19 23:12:11	2021-10-19 23:12:11	7
373250	SJCX	2021-10-18	0.002482	0.002461	0.002482	0.002482	0	0	2021-10-19 23:12:11	2021-10-19 23:12:11	11
305970	EOS	2021-05-29	6.019	6.122	6.805	5.743	7192260.37	45208010.6	2021-05-30 23:39:28	2021-05-30 23:39:28	9
300908	ATOM	2021-05-19	13.83	22.87	23.48	9.891	6293472.65	104445716.54	2021-05-20 23:37:12	2021-05-20 23:37:12	3
384636	XTZ	2021-11-09	6.298	6.488	6.624	6.248	6226958.29	40062548.06	2021-11-10 22:17:11	2021-11-10 22:17:11	5
332736	SJCX	2021-07-25	0.001415	0.001371	0.001415	0.001415	0	0	2021-07-26 22:52:35	2021-07-26 22:52:35	11
332710	ZRX	2021-07-25	0.6585	0.6581	0.6614	0.6321	2159365.44	1390478.34	2021-07-26 23:52:36	2021-07-26 23:52:36	6
341020	ATOM	2021-08-12	14.08	14.67	14.73	13.57	653155.69	9129896.02	2021-08-13 23:56:44	2021-08-13 23:56:44	3
373706	ATOM	2021-10-19	35.02	31.88	35.38	31.45	3637314.97	123019315.46	2021-10-20 22:12:25	2021-10-20 22:12:25	3
335910	SJCX	2021-08-01	0.001595	0.001659	0.001595	0.001595	0	0	2021-08-02 23:54:13	2021-08-02 23:54:13	11
368820	EOS	2021-10-09	4.997	4.647	5.066	4.614	5313477.95	25882820.9	2021-10-10 22:10:06	2021-10-10 22:10:06	9
362984	BTC	2021-09-27	42187.51	43201.79	44360.41	42139.24	25137.24	1091806397.4	2021-09-28 23:07:18	2021-09-28 23:07:18	7
357788	OCN	2021-09-16	0.000928	0.00094	0.0009637	0.0008923	16826087.48	15614.74	2021-09-17 23:04:46	2021-09-17 23:04:46	2
346660	OCN	2021-08-24	0.00111	0.001163	0.00111	0.00111	607062.81	674.08	2021-08-25 23:59:31	2021-08-25 23:59:31	2
352428	EOS	2021-09-05	6.298	5.696	6.329	5.525	13711052.71	81948157.71	2021-09-06 23:02:15	2021-09-06 23:02:15	9
368786	XTZ	2021-10-09	7.622	7.296	7.634	7.206	4742610.2	35242308.54	2021-10-10 23:10:06	2021-10-10 23:10:06	5
379864	DOT	2021-10-31	42.77	42.73	43.38	41.07	3392772.7	143053289.49	2021-11-01 22:15:09	2021-11-01 22:15:09	4
316376	BTC	2021-06-20	35602.26	35515.38	36139.95	33377.82	56525.29	1964614466.35	2021-06-21 23:44:36	2021-06-21 23:44:36	7
341022	OCN	2021-08-12	0.001219	0.001202	0.00131	0.001158	3635251.91	4431.07	2021-08-13 23:56:44	2021-08-13 23:56:44	2
328	XTZ	2021-03-15	3.833	3.933	4.052	3.74	3132467.69	12170576.31	2021-05-07 19:24:31	2021-05-07 19:24:31	5
329	XTZ	2021-03-16	4.042	3.833	4.047	3.689	3074279.52	11979056.52	2021-05-07 19:24:31	2021-05-07 19:24:31	5
330	XTZ	2021-03-17	4.407	4.042	4.451	3.844	5951835.66	25171002.61	2021-05-07 19:24:31	2021-05-07 19:24:31	5
331	XTZ	2021-03-18	4.262	4.407	4.577	4.227	6131490.31	26839583.32	2021-05-07 19:24:31	2021-05-07 19:24:31	5
332	XTZ	2021-03-19	4.228	4.262	4.348	4.117	3009261.03	12824710.08	2021-05-07 19:24:31	2021-05-07 19:24:31	5
333	XTZ	2021-03-20	4.359	4.228	4.606	4.208	4593617.71	20351002.25	2021-05-07 19:24:31	2021-05-07 19:24:31	5
3096	BCH	2020-10-06	219.71	221.84	227.03	216.11	216581.09	47585639.44	2021-05-09 17:34:36	2021-05-09 17:34:36	8
310756	ANT	2021-06-08	4.627	4.779	4.824	4.474	742041.73	3433574.85	2021-06-09 23:41:48	2021-06-09 23:41:48	14
3097	BCH	2020-10-07	223.17	219.71	224.98	218.9	206739.07	46137034.07	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3098	BCH	2020-10-08	233.89	223.17	236.84	227.77	294702.03	68927610.25	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3099	BCH	2020-10-09	237.21	233.89	241.74	235.88	326952.1	77556579.34	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3100	BCH	2020-10-10	237.45	237.21	244.23	236.2	263306.37	62521040.57	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3101	BCH	2020-10-11	239.23	237.45	242.98	236.95	252594.36	60427384.72	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3102	BCH	2020-10-12	239.8	239.23	243.6	239.22	194393.96	46614935.4	2021-05-09 17:34:36	2021-05-09 17:34:36	8
637	DOT	2021-01-17	17.1	18	18.39	16.32	3983196.86	68986691.14	2021-05-09 17:34:36	2021-05-09 17:34:36	4
638	DOT	2021-01-18	16.58	17.1	18.19	12.59	2666032.79	45042566.98	2021-05-09 17:34:36	2021-05-09 17:34:36	4
639	DOT	2021-01-19	16.42	16.58	17.5	15.93	2241573.28	37678193.6	2021-05-09 17:34:36	2021-05-09 17:34:36	4
640	DOT	2021-01-20	18	16.42	18.21	14.77	4055014.36	66791927.51	2021-05-09 17:34:36	2021-05-09 17:34:36	4
641	DOT	2021-01-21	15.95	18	18.14	14.98	3845919.96	63167947.76	2021-05-09 17:34:36	2021-05-09 17:34:36	4
642	DOT	2021-01-22	17.22	15.95	18.04	14.79	3056030.21	50587092.46	2021-05-09 17:34:36	2021-05-09 17:34:36	4
643	DOT	2021-01-23	18.75	17.22	18.79	16.84	2215467.04	39768799.41	2021-05-09 17:34:36	2021-05-09 17:34:36	4
644	DOT	2021-01-24	17.99	18.75	18.75	17.31	1444666.38	25875777.47	2021-05-09 17:34:36	2021-05-09 17:34:36	4
1883	ZRX	2020-06-13	0.3641	0.3559	0.3829	0.3554	8528421.49	3163092.83	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1884	ZRX	2020-06-14	0.3554	0.3641	0.383	0.3524	8203416.26	3004875.27	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1885	ZRX	2020-06-15	0.3443	0.3554	0.3567	0.3208	10998292.25	3728566.18	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1886	ZRX	2020-06-16	0.343	0.3443	0.3553	0.3383	4849920.88	1677599.85	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1898	ZRX	2020-06-28	0.3322	0.3329	0.3433	0.3227	3967195.47	1311949.58	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1899	ZRX	2020-06-29	0.3458	0.3322	0.3474	0.3276	4878872.74	1637905.56	2021-05-09 17:34:36	2021-05-09 17:34:36	6
321592	ETH	2021-07-01	2109.29	2276.14	2277.05	2074.67	499798.16	1069055464.26	2021-07-02 23:47:08	2021-07-02 23:47:08	10
300910	OCN	2021-05-19	0.0007084	0.001115	0.000855	0.0006352	59586072.71	42213.04	2021-05-20 23:37:12	2021-05-20 23:37:12	2
1900	ZRX	2020-06-30	0.3357	0.3458	0.3464	0.3333	2412624.64	818059.36	2021-05-09 17:34:36	2021-05-09 17:34:36	6
347138	OCN	2021-08-25	0.00113	0.00111	0.001162	0.001098	815760.46	921.89	2021-08-26 23:59:45	2021-08-26 23:59:45	2
341480	ANT	2021-08-13	5.025	4.59	5.025	4.59	90387.36	439333.06	2021-08-14 19:56:56	2021-08-14 19:56:56	14
332730	XTZ	2021-07-25	2.89	2.817	2.906	2.723	4005820.35	11279096.62	2021-07-26 21:52:35	2021-07-26 21:52:35	5
305972	DOT	2021-05-29	19.85	21.38	22.27	18.81	1932457.82	39632953.42	2021-05-30 23:39:28	2021-05-30 23:39:28	4
332712	ATOM	2021-07-25	11.46	11.43	11.62	11	833651.41	9395418.19	2021-07-26 23:52:36	2021-07-26 23:52:36	3
327644	BCH	2021-07-14	467.24	465.21	478.12	444.33	54775.45	25290799.52	2021-07-15 23:50:04	2021-07-15 23:50:04	8
357812	SJCX	2021-09-16	0.001911	0.001926	0.001911	0.001911	0	0	2021-09-17 23:04:47	2021-09-17 23:04:47	11
306	XTZ	2021-02-21	4.678	4.64	4.802	4.511	4496279.76	21065320.87	2021-05-07 19:24:31	2021-05-07 19:24:31	5
310	XTZ	2021-02-25	3.335	3.539	3.846	3.299	7342288.22	26343959.14	2021-05-07 19:24:31	2021-05-07 19:24:31	5
311	XTZ	2021-02-26	3.468	3.335	3.8	3.175	9279183.95	32031937.97	2021-05-07 19:24:31	2021-05-07 19:24:31	5
312	XTZ	2021-02-27	3.643	3.468	3.858	3.468	6100616.52	22234558.99	2021-05-07 19:24:31	2021-05-07 19:24:31	5
313	XTZ	2021-02-28	3.425	3.643	3.673	3.193	5990139.89	20312543.12	2021-05-07 19:24:31	2021-05-07 19:24:31	5
314	XTZ	2021-03-01	3.634	3.425	3.689	3.398	4660213.18	16606701.63	2021-05-07 19:24:31	2021-05-07 19:24:31	5
315	XTZ	2021-03-02	3.688	3.634	3.805	3.493	5572351.54	20270439.81	2021-05-07 19:24:31	2021-05-07 19:24:31	5
316	XTZ	2021-03-03	3.848	3.688	4	3.667	6546241.97	25518708.69	2021-05-07 19:24:31	2021-05-07 19:24:31	5
346662	DOT	2021-08-24	25.11	27.87	28.17	24.45	2320921.21	61725069.79	2021-08-25 23:59:31	2021-08-25 23:59:31	4
335454	ZRX	2021-07-31	0.8186	0.7789	0.8673	0.766	15095758.94	12507218.64	2021-08-01 23:53:59	2021-08-01 23:53:59	6
352426	DOT	2021-09-05	34.43	32.38	34.76	32.03	950450.19	31735237.34	2021-09-06 23:02:15	2021-09-06 23:02:15	4
352420	BTC	2021-09-05	51784.16	49935.29	51890.18	49499.28	21382.07	1084416553.08	2021-09-06 23:02:15	2021-09-06 23:02:15	7
351942	BCH	2021-09-04	709.06	713.69	734.59	697.85	67613.97	48168193.45	2021-09-05 23:02:02	2021-09-05 23:02:02	8
362986	ATOM	2021-09-27	37.23	39.87	40.74	36.64	3051969.21	117349209.24	2021-09-28 23:07:18	2021-09-28 23:07:18	3
357346	EOS	2021-09-15	5.104	4.857	5.155	4.774	4423629.47	22066012.48	2021-09-16 23:04:32	2021-09-16 23:04:32	9
351944	SJCX	2021-09-04	0.001997	0.002001	0.001997	0.001997	0	0	2021-09-05 23:02:09	2021-09-05 23:02:09	11
368272	BTC	2021-10-08	53949.29	53796.22	56047.91	53666.09	29127.91	1592265868.06	2021-10-09 23:09:52	2021-10-09 23:09:52	7
373220	FIL	2021-10-18	63.48	63.69	65.05	61.38	368733.63	23212760.66	2021-10-19 23:12:11	2021-10-19 23:12:11	13
368792	ATOM	2021-10-09	35.17	35	36.15	34.61	1434101.31	50768414.45	2021-10-10 22:10:06	2021-10-10 22:10:06	3
373698	XTZ	2021-10-19	6.746	6.55	6.892	6.512	6750864.36	45494313.99	2021-10-20 23:12:25	2021-10-20 23:12:25	5
379866	EOS	2021-10-31	4.639	4.484	4.773	4.447	8369743.55	38390070.43	2021-11-01 23:15:09	2021-11-01 23:15:09	9
379878	OCN	2021-10-31	0.0006135	0.0006189	0.001227	0.0006135	160412373.66	98412.59	2021-11-01 23:18:20	2021-11-01 23:18:20	2
384606	BTC	2021-11-09	66939.24	67549.14	68514.26	66312.42	32745.53	2209551778.82	2021-11-10 23:17:12	2021-11-10 23:17:12	7
385112	SJCX	2021-11-10	0.002597	0.002678	0.002597	0.002597	0	0	2021-11-11 22:17:26	2021-11-11 22:17:26	11
1901	ZRX	2020-07-01	0.3362	0.3357	0.3439	0.3315	3088957.84	1044376.14	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1902	ZRX	2020-07-02	0.3444	0.3362	0.359	0.3338	8735866.3	3023441.08	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1903	ZRX	2020-07-03	0.3802	0.3444	0.4	0.3425	25748739.91	9805336.45	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1904	ZRX	2020-07-04	0.3865	0.3802	0.429	0.3745	21382676.02	8626368.99	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1905	ZRX	2020-07-05	0.4202	0.3865	0.421	0.3604	14438920.47	5539816.56	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1906	ZRX	2020-07-06	0.3997	0.4202	0.4234	0.3875	20065856.19	8122086.9	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1907	ZRX	2020-07-07	0.4087	0.3997	0.4269	0.3913	14596641.42	5973887.92	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1908	ZRX	2020-07-08	0.4482	0.4087	0.4786	0.4054	39393862.25	17613424.22	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1909	ZRX	2020-07-09	0.4256	0.4482	0.45	0.4041	15914259.92	6861138.69	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1921	ZRX	2020-07-21	0.401	0.3961	0.4098	0.394	4363306.11	1742895.58	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1922	ZRX	2020-07-22	0.4008	0.401	0.4085	0.3946	4360400.21	1750952.1	2021-05-09 17:34:36	2021-05-09 17:34:36	6
335898	ZRX	2021-08-01	0.7803	0.8186	0.845	0.7756	5646302.14	4638127.49	2021-08-02 23:54:13	2021-08-02 23:54:13	6
310758	ETH	2021-06-08	2509.23	2593.12	2621.22	2310.58	1049561.45	2594319741.23	2021-06-09 23:41:49	2021-06-09 23:41:49	10
341474	ATOM	2021-08-13	15.22	14.08	15.33	13.88	1146027.78	16823611.79	2021-08-14 23:56:58	2021-08-14 23:56:58	3
332724	BCH	2021-07-25	454.86	459.04	473.96	454.15	94578.6	43019766.61	2021-07-26 23:52:36	2021-07-26 23:52:36	8
1923	ZRX	2020-07-23	0.3936	0.4008	0.41	0.3893	5010070	2006311.44	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1924	ZRX	2020-07-24	0.3878	0.3936	0.3966	0.3839	5006462.67	1947256.42	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1939	ZRX	2020-08-08	0.421	0.3934	0.4259	0.3906	8270643.23	3430272.83	2021-05-09 17:34:36	2021-05-09 17:34:36	6
1330	SJCX	2020-12-09	0.000742	0.0007329	0.000742	0.000742	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
346664	SJCX	2021-08-24	0.001908	0.001981	0.001908	0.001908	0	0	2021-08-25 20:59:30	2021-08-25 20:59:30	11
328116	ZRX	2021-07-15	0.6709	0.7162	0.7214	0.6531	5656935	3822659.18	2021-07-16 23:50:18	2021-07-16 23:50:18	6
352418	XTZ	2021-09-05	5.567	5.404	5.596	5.269	6999695.56	38029838.23	2021-09-06 23:02:15	2021-09-06 23:02:15	5
352424	FIL	2021-09-05	113.63	95.06	120.25	91.95	1529092.37	165703975.63	2021-09-06 23:02:15	2021-09-06 23:02:15	13
379868	BCH	2021-10-31	597	585.38	604.37	575.05	54135.46	31974258.09	2021-11-01 22:15:09	2021-11-01 22:15:09	8
357786	ATOM	2021-09-16	37.18	34.05	37.2	31.27	1404069.7	48157251.45	2021-09-17 23:04:46	2021-09-17 23:04:46	3
379872	ATOM	2021-10-31	37.22	37.3	37.74	35.27	2142052.58	78571867.73	2021-11-01 23:15:09	2021-11-01 23:15:09	3
341024	XTZ	2021-08-12	3.35	3.45	3.608	3.225	4595069.98	15641416.14	2021-08-13 23:56:44	2021-08-13 23:56:44	5
316378	FIL	2021-06-20	63.16	64.79	64.95	59.98	297586.15	18482077.54	2021-06-21 20:44:35	2021-06-21 20:44:35	13
321596	DOT	2021-07-01	15.21	16.38	16.4	14.87	629063.03	9721434.44	2021-07-02 23:47:08	2021-07-02 23:47:08	4
335456	FIL	2021-07-31	52.05	51.29	52.84	50.41	344654.69	17754733.93	2021-08-01 22:53:58	2021-08-01 22:53:58	13
300912	DOT	2021-05-19	25.08	40.64	41.37	20.01	7052859.26	214129215.19	2021-05-20 23:37:12	2021-05-20 23:37:12	4
305974	ANT	2021-05-29	3.983	4.103	4.343	3.682	245927.37	979518.35	2021-05-30 23:39:29	2021-05-30 23:39:29	14
362988	BCH	2021-09-27	488.64	504	515.34	488.34	58290.9	29310499.17	2021-09-28 23:07:18	2021-09-28 23:07:18	8
327646	ZRX	2021-07-14	0.7162	0.7143	0.7211	0.6658	4313793.27	2984773.8	2021-07-15 22:50:04	2021-07-15 22:50:04	6
347140	EOS	2021-08-25	5.213	5.063	5.25	4.911	4511696.4	23065445.63	2021-08-26 23:59:45	2021-08-26 23:59:45	9
385134	ANT	2021-11-10	4.821	5.265	5.13	4.694	231168.15	1114556.25	2021-11-11 21:17:25	2021-11-11 21:17:25	14
385110	FIL	2021-11-10	63.64	66.68	69.62	58.65	999306.23	66235703.11	2021-11-11 22:17:25	2021-11-11 22:17:25	13
373222	DOT	2021-10-18	41.18	42.1	43.26	40.28	3869354.97	161019099.1	2021-10-19 23:12:11	2021-10-19 23:12:11	4
373254	ANT	2021-10-18	4.663	4.839	4.9	4.613	301550.68	1406066.92	2021-10-19 23:12:12	2021-10-19 23:12:12	14
368274	ETH	2021-10-08	3562.84	3588.2	3669.37	3536.08	261572.12	944018845.76	2021-10-09 23:09:52	2021-10-09 23:09:52	10
2002	ZRX	2020-10-10	0.3952	0.3897	0.4075	0.3889	3538828.47	1414117.7	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2003	ZRX	2020-10-11	0.3908	0.3952	0.398	0.3848	2573830	998772.67	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2004	ZRX	2020-10-12	0.3952	0.3908	0.409	0.3799	3112410.19	1231890.83	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2005	ZRX	2020-10-13	0.4174	0.3952	0.4277	0.3909	4975430.84	2065875.99	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2006	ZRX	2020-10-14	0.3872	0.4174	0.434	0.3706	6721630.24	2686850.24	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2007	ZRX	2020-10-15	0.3978	0.3872	0.3988	0.3669	3856134.18	1477371.17	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2008	ZRX	2020-10-16	0.3894	0.3978	0.41	0.3804	4329553.87	1722545.12	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2009	ZRX	2020-10-17	0.3844	0.3894	0.3954	0.3741	2707692.19	1036241.56	2021-05-09 17:34:36	2021-05-09 17:34:36	6
310760	BTC	2021-06-08	33409.38	33582.86	34061.09	31034.35	88483.79	2890313261.68	2021-06-09 23:41:49	2021-06-09 23:41:49	7
379874	BTC	2021-10-31	61349.75	61891.91	62420.57	60022.06	19359.29	1181933822.61	2021-11-01 23:15:09	2021-11-01 23:15:09	7
379870	FIL	2021-10-31	64.41	61.3	66.83	59.3	1172433.31	73848837.36	2021-11-01 23:15:09	2021-11-01 23:15:09	13
316414	ETH	2021-06-20	2243.6	2166.61	2276.61	2043.74	491490.81	1057105893.49	2021-06-21 23:44:36	2021-06-21 23:44:36	10
316380	OCN	2021-06-20	0.000718	0.0007583	0.0008974	0.0006955	56224339.69	40366.38	2021-06-21 23:44:37	2021-06-21 23:44:37	2
300914	ETH	2021-05-19	2442.89	3377.65	3441.2	1947.97	3555126.89	9657968555.96	2021-05-20 23:37:12	2021-05-20 23:37:12	10
300922	BCH	2021-05-19	696.72	1090.73	1110.78	491.9	493630.82	401010152.12	2021-05-20 23:37:12	2021-05-20 23:37:12	8
368276	ZRX	2021-10-08	1.081	1.027	1.109	1.011	12705308.69	13584386.92	2021-10-09 21:09:51	2021-10-09 21:09:51	6
328154	ETH	2021-07-15	1918.17	1994.22	2039.24	1881.4	443146.82	858515598.28	2021-07-16 23:50:18	2021-07-16 23:50:18	10
373696	FIL	2021-10-19	62.97	63.48	64.08	62.07	249368.44	15749742.05	2021-10-20 23:12:25	2021-10-20 23:12:25	13
332732	ANT	2021-07-25	3.671	3.531	3.671	3.442	57674.89	204048.33	2021-07-26 23:52:36	2021-07-26 23:52:36	14
305976	XTZ	2021-05-29	3.201	3.397	3.563	3.05	7754067.93	25307132.75	2021-05-30 23:39:29	2021-05-30 23:39:29	5
373224	ATOM	2021-10-18	31.88	32.43	32.65	31.07	1620277.81	51635645.72	2021-10-19 23:12:11	2021-10-19 23:12:11	3
385114	ZRX	2021-11-10	1.207	1.309	1.433	1.193	31652431.84	41788582.66	2021-11-11 23:17:26	2021-11-11 23:17:26	6
327648	BTC	2021-07-14	32820.5	32737.47	33099.2	31601.99	27262.01	883070516.73	2021-07-15 23:50:04	2021-07-15 23:50:04	7
368788	SJCX	2021-10-09	0.002199	0.002158	0.002199	0.002199	0	0	2021-10-10 23:10:06	2021-10-10 23:10:06	11
357790	EOS	2021-09-16	5.021	5.104	5.184	4.878	5277556.5	26649534.25	2021-09-17 23:04:46	2021-09-17 23:04:46	9
362990	FIL	2021-09-27	59.03	55.85	63.06	54.77	1008869.04	60632633.25	2021-09-28 23:07:18	2021-09-28 23:07:18	13
321630	ZRX	2021-07-01	0.6899	0.7419	0.7672	0.6777	6375906.68	4615255.82	2021-07-02 23:47:08	2021-07-02 23:47:08	6
346666	FIL	2021-08-24	74.43	79.85	80.3	72.42	448245.99	34279568.37	2021-08-25 23:59:31	2021-08-25 23:59:31	13
352432	OCN	2021-09-05	0.001146	0.001205	0.001304	0.001067	19951356.01	22867.76	2021-09-06 22:02:15	2021-09-06 22:02:15	2
335458	SJCX	2021-07-31	0.001659	0.001689	0.001659	0.001659	0	0	2021-08-01 21:53:58	2021-08-01 21:53:58	11
341472	FIL	2021-08-13	74.51	68.42	74.79	68.33	529422.14	37457503.57	2021-08-14 23:56:58	2021-08-14 23:56:58	13
3107	BCH	2020-10-17	244.97	250.31	252.48	242.7	200361.44	49083114.49	2021-05-09 17:34:36	2021-05-09 17:34:36	8
4535	EOS	2020-09-11	2.788	2.781	2.821	2.721	1470409.35	4095566.04	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4536	EOS	2020-09-12	2.807	2.788	2.83	2.744	1145957.99	3194115.06	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4537	EOS	2020-09-13	2.722	2.807	2.826	2.676	1442345.23	3959064.48	2021-05-09 17:34:36	2021-05-09 17:34:36	9
335912	ETH	2021-08-01	2556.41	2531.75	2698.09	2513.63	541191.87	1405547764.41	2021-08-02 23:54:12	2021-08-02 23:54:12	10
305988	ZRX	2021-05-29	0.8999	0.9654	1.007	0.8467	7427749.7	6821270.46	2021-05-30 23:39:29	2021-05-30 23:39:29	6
310762	SJCX	2021-06-08	0.001336	0.001343	0.001336	0.001336	0	0	2021-06-09 23:41:49	2021-06-09 23:41:49	11
4538	EOS	2020-09-14	2.731	2.722	2.765	2.691	971782.3	2655973.36	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4539	EOS	2020-09-15	2.708	2.731	2.784	2.701	2203985.17	6019674.92	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4540	EOS	2020-09-16	2.715	2.708	2.754	2.591	1948769.19	5200775.05	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4541	EOS	2020-09-17	2.741	2.715	2.779	2.699	1223895.77	3349724.48	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4542	EOS	2020-09-18	2.694	2.741	2.755	2.656	1432317.39	3898505.07	2021-05-09 17:34:36	2021-05-09 17:34:36	9
2032	ZRX	2020-11-09	0.354	0.3665	0.369	0.3431	1730357.16	617634.22	2021-05-09 17:34:36	2021-05-09 17:34:36	6
322054	ATOM	2021-07-02	11.8	11.05	11.81	10.53	1075653.69	11990522.37	2021-07-03 20:47:20	2021-07-03 20:47:20	3
280	XTZ	2021-01-26	2.908	2.921	3.012	2.756	5334193.38	15344861.59	2021-05-07 19:24:31	2021-05-07 19:24:31	5
281	XTZ	2021-01-27	2.802	2.908	2.94	2.628	7277731.29	20230247.37	2021-05-07 19:24:31	2021-05-07 19:24:31	5
282	XTZ	2021-01-28	3.001	2.802	3.094	2.723	8909877.76	26551225.71	2021-05-07 19:24:31	2021-05-07 19:24:31	5
2033	ZRX	2020-11-10	0.3873	0.354	0.3901	0.3531	3854823.12	1460998.35	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2034	ZRX	2020-11-11	0.3652	0.3873	0.3942	0.3652	4252792.97	1612505.77	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2035	ZRX	2020-11-12	0.3607	0.3652	0.374	0.3584	2360294.75	864080.61	2021-05-09 17:34:36	2021-05-09 17:34:36	6
347136	ANT	2021-08-25	5.172	4.949	5.179	4.767	74594.72	370513.18	2021-08-26 23:59:46	2021-08-26 23:59:46	14
335460	OCN	2021-07-31	0.0008608	0.0008869	0.0009367	0.0008355	26041074.41	22416.03	2021-08-01 23:53:59	2021-08-01 23:53:59	2
341504	ZRX	2021-08-13	1.06	0.9528	1.06	0.9216	11100510.81	11223353.58	2021-08-14 21:56:57	2021-08-14 21:56:57	6
283	XTZ	2021-01-29	2.914	3.001	3.061	2.817	7180365.01	21108807.85	2021-05-07 19:24:31	2021-05-07 19:24:31	5
284	XTZ	2021-01-30	2.896	2.914	3.02	2.806	5610441	16290962.13	2021-05-07 19:24:31	2021-05-07 19:24:31	5
2572	BTC	2020-05-01	8829.12	8637.56	9066.47	8631.39	70407.63	620133839.66	2021-05-01 22:04:03	2021-05-01 22:04:03	7
285	XTZ	2021-01-31	2.845	2.896	2.952	2.738	4971007.14	14172390.37	2021-05-07 19:24:31	2021-05-07 19:24:31	5
286	XTZ	2021-02-01	2.92	2.845	2.934	2.759	5167430.28	14718115.07	2021-05-07 19:24:31	2021-05-07 19:24:31	5
287	XTZ	2021-02-02	2.911	2.92	2.962	2.835	3873033.95	11249189.85	2021-05-07 19:24:31	2021-05-07 19:24:31	5
288	XTZ	2021-02-03	3.051	2.911	3.182	2.889	9911378.87	30209320.46	2021-05-07 19:24:31	2021-05-07 19:24:31	5
341482	SJCX	2021-08-13	0.001913	0.001777	0.001913	0.001913	0	0	2021-08-14 23:56:58	2021-08-14 23:56:58	11
346668	ETH	2021-08-24	3172.57	3322.71	3359.79	3150.96	310672.97	1008586226.64	2021-08-25 22:59:31	2021-08-25 22:59:31	10
368278	ATOM	2021-10-08	35	36.68	36.92	34.77	1691966.91	60855323.34	2021-10-09 23:09:52	2021-10-09 23:09:52	3
327650	FIL	2021-07-14	49.64	50.96	51.2	48.17	342324.85	17061078.41	2021-07-15 23:50:04	2021-07-15 23:50:04	13
300916	ANT	2021-05-19	4.486	7.05	6.104	3.832	1133383.27	5084547.92	2021-05-20 23:37:12	2021-05-20 23:37:12	14
300924	EOS	2021-05-19	5.705	9.333	9.477	4.293	45368809.73	303914364.63	2021-05-20 23:37:21	2021-05-20 23:37:21	9
362992	DOT	2021-09-27	27.73	28.86	30.24	27.62	3603469.96	104271211.78	2021-09-28 23:07:18	2021-09-28 23:07:18	4
316382	ATOM	2021-06-20	11.99	11.9	12.4	11.06	834626.74	9805662.69	2021-06-21 23:44:36	2021-06-21 23:44:36	3
385628	ZRX	2021-11-11	1.314	1.207	1.339	1.185	15952300.23	20137428.18	2021-11-12 23:17:39	2021-11-12 23:17:39	6
352918	BTC	2021-09-06	52693.32	51784.16	52766.16	51035.68	25623.3	1328373298	2021-09-07 23:02:28	2021-09-07 23:02:28	7
352956	XTZ	2021-09-06	5.595	5.567	5.766	5.405	8566561.71	47751531.7	2021-09-07 23:02:29	2021-09-07 23:02:29	5
358256	BTC	2021-09-17	47297.98	47764.47	48172.36	46770.31	18941.92	899242093.44	2021-09-18 23:05:00	2021-09-18 23:05:00	7
373226	ETH	2021-10-18	3746.14	3846.66	3894.27	3677.52	361513.63	1365253107.8	2021-10-19 23:12:11	2021-10-19 23:12:11	10
373712	ANT	2021-10-19	4.626	4.663	4.916	4.589	245881.75	1137418.11	2021-10-20 23:12:25	2021-10-20 23:12:25	14
379876	SJCX	2021-10-31	0.002454	0.002476	0.002454	0.002454	0	0	2021-11-01 22:15:09	2021-11-01 22:15:09	11
1	XTZ	2020-04-22	2.336	2.151	2.349	2.136	4726707.8	10740841.18	2021-04-22 21:03:21	2021-04-22 21:03:21	5
335908	ATOM	2021-08-01	12.33	12.58	13.44	12.16	1516626.04	19576545.65	2021-08-02 23:54:12	2021-08-02 23:54:12	3
327652	XTZ	2021-07-14	2.717	2.809	2.818	2.542	3382307.61	8993614.13	2021-07-15 23:50:04	2021-07-15 23:50:04	5
310764	FIL	2021-06-08	76.07	82.05	83.7	70.57	1163003.82	87564851.8	2021-06-09 23:41:49	2021-06-09 23:41:49	13
322082	BTC	2021-07-02	33804.54	33543.11	33968.47	32715.18	33082.4	1102040372.36	2021-07-03 23:47:21	2021-07-03 23:47:21	7
322056	ETH	2021-07-02	2155.65	2109.29	2159.25	2018.32	411011.61	855546242.98	2021-07-03 23:47:21	2021-07-03 23:47:21	10
347192	BTC	2021-08-25	48996.44	47690.54	49257.74	47135.07	25061.09	1208134772.96	2021-08-26 23:59:46	2021-08-26 23:59:46	7
335462	ANT	2021-07-31	4.03	4.015	4.108	3.918	1161772.64	4682058.22	2021-08-01 23:53:59	2021-08-01 23:53:59	14
346670	BTC	2021-08-24	47690.54	49521.06	49859.97	47580.66	28718.08	1399185980.56	2021-08-25 23:59:31	2021-08-25 23:59:31	7
2036	ZRX	2020-11-13	0.387	0.3607	0.3877	0.3594	4017470.08	1503512.92	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2037	ZRX	2020-11-14	0.3742	0.387	0.387	0.3609	3466585.46	1285492.44	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2038	ZRX	2020-11-15	0.3596	0.3742	0.3787	0.3515	3066074.28	1118616.98	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2039	ZRX	2020-11-16	0.3719	0.3596	0.3814	0.3571	4275561.73	1588307.52	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2040	ZRX	2020-11-17	0.3832	0.3719	0.3891	0.3715	5570121.51	2120421.87	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2041	ZRX	2020-11-18	0.3654	0.3832	0.3847	0.3551	5008514.91	1842238.78	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2042	ZRX	2020-11-19	0.3648	0.3654	0.374	0.3559	4943588.54	1812140.53	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2043	ZRX	2020-11-20	0.3748	0.3648	0.3822	0.3648	4067651.9	1530142.61	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2044	ZRX	2020-11-21	0.4168	0.3748	0.4251	0.3748	18066140.87	7273798.25	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2045	ZRX	2020-11-22	0.3977	0.4168	0.428	0.3835	8457329.23	3397853.15	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2052	ZRX	2020-11-29	0.4152	0.4153	0.42	0.4054	4106369.82	1691014.46	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2053	ZRX	2020-11-30	0.4282	0.4152	0.4324	0.4052	5488483.36	2313777.31	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2054	ZRX	2020-12-01	0.3993	0.4282	0.4492	0.3916	9647903.34	4022558.82	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2055	ZRX	2020-12-02	0.4271	0.3993	0.4316	0.3946	4909876.44	2053817.41	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2056	ZRX	2020-12-03	0.4307	0.4271	0.4361	0.4189	3843772.1	1646335.67	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2057	ZRX	2020-12-04	0.3925	0.4307	0.4371	0.3898	7601336.68	3151028.22	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2058	ZRX	2020-12-05	0.4084	0.3925	0.4128	0.3901	3303095.49	1338476.22	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2059	ZRX	2020-12-06	0.4001	0.4084	0.4112	0.3947	3624334.15	1456091.2	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2060	ZRX	2020-12-07	0.4044	0.4001	0.4135	0.3977	2034632.65	825741.32	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2061	ZRX	2020-12-08	0.379	0.4044	0.4071	0.3725	4037740.66	1567736.72	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2064	ZRX	2020-12-11	0.3563	0.3699	0.3715	0.346	4952193	1763339.42	2021-05-09 17:34:36	2021-05-09 17:34:36	6
341936	BTC	2021-08-14	47102.03	47832.93	48136.25	46049.28	23828.49	1120499538.82	2021-08-15 23:57:12	2021-08-15 23:57:12	7
380372	BTC	2021-11-01	60960.98	61349.75	62482.31	59554.88	31925.65	1955088666.05	2021-11-02 23:15:23	2021-11-02 23:15:23	7
380378	DOT	2021-11-01	50.03	42.77	51.62	41.79	8203938.59	389934884.95	2021-11-02 23:15:23	2021-11-02 23:15:23	4
328120	BTC	2021-07-15	31867.46	32820.5	33188.54	31133.75	33647.48	1073939852.55	2021-07-16 23:50:18	2021-07-16 23:50:18	7
300918	BTC	2021-05-19	36771.87	42886.02	43564.34	29925.2	290986.06	11120220854.77	2021-05-20 23:37:11	2021-05-20 23:37:11	7
300926	XTZ	2021-05-19	3.625	5.745	5.837	2.924	22681516.07	96671000.27	2021-05-20 23:37:12	2021-05-20 23:37:12	5
358258	BCH	2021-09-17	621.3	639.36	647.59	613.4	71587.43	45094502.39	2021-09-18 23:05:00	2021-09-18 23:05:00	8
316384	DOT	2021-06-20	20.63	20.25	20.99	18.92	1213805.96	24158909.81	2021-06-21 23:44:36	2021-06-21 23:44:36	4
352920	DOT	2021-09-06	34.35	34.43	35.02	32.53	1787865.4	60983885.52	2021-09-07 23:02:29	2021-09-07 23:02:29	4
385630	EOS	2021-11-11	4.924	4.847	5.024	4.796	5154385.47	25358935.89	2021-11-12 23:17:40	2021-11-12 23:17:40	9
368280	SJCX	2021-10-08	0.002158	0.002152	0.002158	0.002158	0	0	2021-10-09 22:09:52	2021-10-09 22:09:52	11
362994	SJCX	2021-09-27	0.001688	0.001728	0.001688	0.001688	0	0	2021-09-28 22:07:18	2021-09-28 22:07:18	11
368796	ZRX	2021-10-09	1.117	1.081	1.119	1.051	9433095.83	10242746.56	2021-10-10 23:10:06	2021-10-10 23:10:06	6
373228	BCH	2021-10-18	611.47	612.05	619.04	598.83	46503.64	28363564.87	2021-10-19 23:12:11	2021-10-19 23:12:11	8
2654	BTC	2020-07-22	9537.24	9392.83	9551.87	9289.85	29959.04	281661129.12	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2655	BTC	2020-07-23	9615.21	9537.24	9675.5	9458.25	43462.72	415079930.39	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2656	BTC	2020-07-24	9550.23	9615.21	9647.83	9477.19	33810.92	323092524.09	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2657	BTC	2020-07-25	9708.41	9550.23	9744.72	9536.76	24211	233301043.7	2021-05-09 17:34:36	2021-05-09 17:34:36	7
327654	ETH	2021-07-14	1994.22	1940.61	2019.42	1866.25	389974.78	758228459.63	2021-07-15 22:50:04	2021-07-15 22:50:04	10
10748	ATOM	2020-04-28	2.803	2.769	2.847	2.742	1754952.18	4919633.58	2021-04-28 19:33:32	2021-04-28 19:33:32	3
10749	ATOM	2020-04-29	2.931	2.803	3.093	2.878	1694314.19	4966848.16	2021-04-28 19:33:32	2021-04-28 19:33:32	3
3108	BCH	2020-10-18	249.49	244.97	251.11	247.31	141157.83	35218012.03	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3109	BCH	2020-10-19	249.95	249.49	254.89	248.78	163579.59	40886926.07	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3110	BCH	2020-10-20	240.94	249.95	253.7	237.96	197504.67	47586612.01	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3111	BCH	2020-10-21	258.95	240.94	269.84	255.75	302551.97	78346726.1	2021-05-09 17:34:36	2021-05-09 17:34:36	8
10759	ATOM	2020-05-09	2.746	2.813	2.826	2.742	1433520.78	3936458.1	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10750	ATOM	2020-04-30	2.743	2.931	2.882	2.696	1647701.48	4520289.41	2021-04-30 16:57:54	2021-04-30 16:57:54	3
10753	ATOM	2020-05-03	2.779	2.882	2.909	2.725	184522.49	519504.38	2021-05-03 03:13:20	2021-05-03 03:13:20	3
10754	ATOM	2020-05-04	2.767	2.775	2.823	2.701	1285678.47	3557199.51	2021-05-03 03:13:20	2021-05-03 03:13:20	3
10755	ATOM	2020-05-05	2.708	2.767	2.76	2.69	1644561.02	4453843.57	2021-05-03 03:13:20	2021-05-03 03:13:20	3
10756	ATOM	2020-05-06	2.628	2.708	2.644	2.566	1709778.92	4493504.18	2021-05-03 03:13:20	2021-05-03 03:13:20	3
10751	ATOM	2020-05-01	2.826	2.743	2.91	2.796	1516874.85	4286223.25	2021-05-01 22:04:03	2021-05-01 22:04:03	3
10746	ATOM	2020-04-26	2.814	2.875	2.973	2.803	1767675.5	4974962.54	2021-04-26 23:26:51	2021-04-26 23:26:51	3
10752	ATOM	2020-05-02	2.874	2.826	2.893	2.831	768898.01	2209730.61	2021-05-01 22:04:03	2021-05-01 22:04:03	3
310766	ZRX	2021-06-08	0.9553	0.9536	0.9688	0.8295	11411759.72	10297636.1	2021-06-09 23:41:48	2021-06-09 23:41:48	6
10760	ATOM	2020-05-10	2.516	2.749	2.749	2.358	458387.38	1151258.5	2021-05-09 17:34:36	2021-05-09 17:34:36	3
2076	ZRX	2020-12-23	0.3326	0.3751	0.3821	0.3102	12750231.93	4455909.58	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2077	ZRX	2020-12-24	0.3642	0.3326	0.3705	0.3211	8232218.17	2827631.28	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2078	ZRX	2020-12-25	0.3584	0.3642	0.3799	0.3536	5985961.66	2181361.25	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2079	ZRX	2020-12-26	0.3537	0.3584	0.3677	0.3501	5828410.59	2093865.44	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2080	ZRX	2020-12-27	0.3732	0.3537	0.4369	0.3537	28956414.46	11483461.15	2021-05-09 17:34:36	2021-05-09 17:34:36	6
322088	ZRX	2021-07-02	0.692	0.6899	0.6973	0.655	4400676.81	2961336.95	2021-07-03 23:47:22	2021-07-03 23:47:22	6
322058	OCN	2021-07-02	0.0004742	0.0004851	0.0005174	0.0004742	15848026.81	7515.82	2021-07-03 23:47:22	2021-07-03 23:47:22	2
335900	EOS	2021-08-01	3.942	4.07	4.233	3.86	4548554.86	18645615.57	2021-08-02 23:54:13	2021-08-02 23:54:13	9
316386	ZRX	2021-06-20	0.791	0.7899	0.7987	0.7251	3873627.12	2955617.03	2021-06-21 23:44:36	2021-06-21 23:44:36	6
2081	ZRX	2020-12-28	0.3772	0.3732	0.3951	0.3674	9757541.62	3732604.81	2021-05-09 17:34:36	2021-05-09 17:34:36	6
300920	ZRX	2021-05-19	0.993	1.601	1.64	0.8001	49248147.45	59352357.3	2021-05-20 23:37:12	2021-05-20 23:37:12	6
368282	BCH	2021-10-08	596.17	611.61	617.73	588.36	64388.87	38882341.55	2021-10-09 22:09:52	2021-10-09 22:09:52	8
10747	ATOM	2020-04-27	2.769	2.814	2.849	2.723	1770172.76	4901067.76	2021-04-27 14:21:33	2021-04-27 14:21:33	3
347132	DOT	2021-08-25	25.98	25.11	26.55	24.53	2000467.62	51603032.53	2021-08-26 23:59:45	2021-08-26 23:59:45	4
10757	ATOM	2020-05-07	2.725	2.628	2.818	2.693	1582546.75	4311976.37	2021-05-07 19:24:30	2021-05-07 19:24:30	3
10758	ATOM	2020-05-08	2.813	2.725	2.839	2.706	1358779.06	3822900.43	2021-05-07 19:24:30	2021-05-07 19:24:30	3
328114	EOS	2021-07-15	3.665	3.798	3.916	3.565	2186124.97	8064829.86	2021-07-16 23:50:18	2021-07-16 23:50:18	9
2082	ZRX	2020-12-29	0.3651	0.3772	0.3835	0.3476	11970754.89	4319213.67	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2083	ZRX	2020-12-30	0.36	0.3651	0.3718	0.3485	5132348.86	1838820.79	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2100	ZRX	2021-01-16	0.5278	0.5158	0.5657	0.4977	16499172.36	8863938.81	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2101	ZRX	2021-01-17	0.5948	0.5278	0.6308	0.512	31767380.3	18214478.27	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2102	ZRX	2021-01-18	0.5845	0.5948	0.628	0.5667	16335114.91	9712938.88	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2103	ZRX	2021-01-19	0.5412	0.5845	0.5996	0.5337	15078135.29	8580917.7	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2104	ZRX	2021-01-20	0.5588	0.5412	0.5622	0.4989	17055386.34	9042690.32	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2105	ZRX	2021-01-21	0.4636	0.5588	0.5621	0.4577	17138804.55	8571204.72	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2106	ZRX	2021-01-22	0.5104	0.4636	0.5376	0.4331	15353409.88	7494927.7	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2107	ZRX	2021-01-23	0.5634	0.5104	0.5825	0.4981	15341893.58	8316268.61	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2108	ZRX	2021-01-24	0.5485	0.5634	0.5789	0.5232	20008373.21	11064988.06	2021-05-09 17:34:36	2021-05-09 17:34:36	6
373252	EOS	2021-10-18	4.421	4.412	4.565	4.355	5937863.26	26351060.33	2021-10-19 22:12:11	2021-10-19 22:12:11	9
335464	DOT	2021-07-31	16.79	15.81	17.02	15.53	3214641	52374335.2	2021-08-01 21:53:58	2021-08-01 21:53:58	4
346672	ANT	2021-08-24	4.949	5.489	5.542	4.947	112739.82	586250.41	2021-08-25 22:59:31	2021-08-25 22:59:31	14
352922	OCN	2021-09-06	0.0011	0.001146	0.001179	0.0011	3949929.71	4344.73	2021-09-07 23:02:29	2021-09-07 23:02:29	2
341938	OCN	2021-08-14	0.001176	0.001263	0.001372	0.001176	20475021.61	24078.94	2021-08-15 23:57:12	2021-08-15 23:57:12	2
358260	ZRX	2021-09-17	1.082	1.143	1.146	1.058	9933553.96	10847530.01	2021-09-18 23:05:00	2021-09-18 23:05:00	6
362996	ANT	2021-09-27	4.356	4.528	4.867	4.356	55718.13	257664.07	2021-09-28 23:07:18	2021-09-28 23:07:18	14
380380	EOS	2021-11-01	4.642	4.639	4.719	4.462	5866440.31	27068273.31	2021-11-02 21:15:22	2021-11-02 21:15:22	9
368780	DOT	2021-10-09	36.33	33.32	36.91	33	3795712.11	134006396.46	2021-10-10 22:10:06	2021-10-10 22:10:06	4
373230	ZRX	2021-10-18	0.9693	0.991	0.998	0.9514	4712532.54	4577770.5	2021-10-19 23:12:11	2021-10-19 23:12:11	6
380374	ATOM	2021-11-01	37.33	37.22	38.18	34.71	2869924.98	105408154.29	2021-11-02 23:15:23	2021-11-02 23:15:23	3
380388	OCN	2021-11-01	0.0006096	0.0006135	0.001219	0.0006096	53988646.85	32912.01	2021-11-02 23:18:40	2021-11-02 23:18:40	2
385632	BTC	2021-11-11	64820.8	64926.06	65585.68	64130.37	21475.67	1393819061.45	2021-11-12 23:17:39	2021-11-12 23:17:39	7
2113	ZRX	2021-01-29	0.6006	0.6107	0.6284	0.5751	29144622.5	17496932.7	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2114	ZRX	2021-01-30	0.6552	0.6006	0.6556	0.5777	18686501.1	11536445.97	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2115	ZRX	2021-01-31	0.7088	0.6552	0.7945	0.6298	62940253.38	44304032.77	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2116	ZRX	2021-02-01	0.6849	0.7088	0.7096	0.6433	17650702.03	11876030.91	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2117	ZRX	2021-02-02	0.685	0.6849	0.6919	0.6598	9622907.98	6463042.87	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2118	ZRX	2021-02-03	0.7698	0.685	0.7734	0.6711	19814043.3	14117449.4	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2119	ZRX	2021-02-04	1.037	0.7698	1.214	0.7238	127515560.83	121017743.23	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2120	ZRX	2021-02-05	1.597	1.037	2.16	1.001	292435468.51	439291472.56	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2121	ZRX	2021-02-06	1.45	1.597	1.677	1.325	88283308.38	129818691.73	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2122	ZRX	2021-02-07	1.414	1.45	1.5	1.259	51606589.8	70229112.95	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2123	ZRX	2021-02-08	1.473	1.414	1.669	1.41	61353635.91	94633545.57	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2124	ZRX	2021-02-09	1.518	1.473	1.575	1.427	31303158.67	47282480.99	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2125	ZRX	2021-02-10	1.506	1.518	1.631	1.378	35235750.76	53441991.23	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2126	ZRX	2021-02-11	1.769	1.506	1.83	1.466	51568481.67	84928014.76	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2160	ZRX	2021-03-17	1.445	1.423	1.447	1.337	7929475.27	11072725.47	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2161	ZRX	2021-03-18	1.516	1.445	1.744	1.419	37974982.8	61119984.25	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2162	ZRX	2021-03-19	1.558	1.516	1.653	1.457	10499531.94	16337103.98	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2163	ZRX	2021-03-20	1.501	1.558	1.624	1.49	7871945.69	12297513.42	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2164	ZRX	2021-03-21	1.459	1.501	1.525	1.417	7826937.12	11541342.41	2021-05-09 17:34:36	2021-05-09 17:34:36	6
2176	ZRX	2021-04-02	1.963	1.962	2.034	1.88	9174398.29	17881092.96	2021-05-09 17:34:36	2021-05-09 17:34:36	6
7740	ZRX	2021-04-23	1.475	1.497	1.542	1.264	27160376.64	37058897.44	2021-05-09 17:34:36	2021-05-09 17:34:36	6
310768	DOT	2021-06-08	21.69	21.69	22.28	19.63	2028295.64	42743781.01	2021-06-09 23:41:49	2021-06-09 23:41:49	4
335894	BTC	2021-08-01	39870.76	41474.72	42584.65	39471.54	33625.25	1385907257.88	2021-08-02 23:54:12	2021-08-02 23:54:12	7
380376	ZRX	2021-11-01	1.243	1.184	1.3	1.107	27646395.44	33171026.72	2021-11-02 21:15:22	2021-11-02 21:15:22	6
373232	XTZ	2021-10-18	6.55	6.626	6.671	6.381	4573120.21	29812679.57	2021-10-19 23:12:12	2021-10-19 23:12:12	5
380382	ANT	2021-11-01	4.698	4.677	4.757	4.601	201861.56	948398.64	2021-11-02 23:15:23	2021-11-02 23:15:23	14
347130	SJCX	2021-08-25	0.00196	0.001908	0.00196	0.00196	0	0	2021-08-26 23:59:45	2021-08-26 23:59:45	11
358262	ETH	2021-09-17	3398.82	3569.26	3593.71	3354.35	341255.81	1178191137.34	2021-09-18 23:05:00	2021-09-18 23:05:00	10
328112	ATOM	2021-07-15	11.46	11.75	12.06	10.66	1653713.43	18459589.37	2021-07-16 23:50:18	2021-07-16 23:50:18	3
316388	EOS	2021-06-20	4.512	4.47	4.534	4.11	4076077.65	17599765.08	2021-06-21 23:44:37	2021-06-21 23:44:37	9
341940	XTZ	2021-08-14	3.699	3.592	3.718	3.469	4851616.3	17589808.58	2021-08-15 23:57:12	2021-08-15 23:57:12	5
322060	FIL	2021-07-02	57.18	56.73	57.4	54.96	109317.63	6148272.26	2021-07-03 23:47:21	2021-07-03 23:47:21	13
341972	DOT	2021-08-14	22.87	22.74	23.47	21.8	2433834.38	54935863.95	2021-08-15 23:57:12	2021-08-15 23:57:12	4
300928	SJCX	2021-05-19	0.001471	0.001715	0.001471	0.001471	0	0	2021-05-20 23:37:12	2021-05-20 23:37:12	11
368284	XTZ	2021-10-08	7.296	7.601	7.794	7.234	6726782.78	50428271.56	2021-10-09 23:09:52	2021-10-09 23:09:52	5
327656	OCN	2021-07-14	0.001336	0.0009703	0.001436	0.0009173	34681220.51	46338.53	2021-07-15 23:50:04	2021-07-15 23:50:04	2
352924	ETH	2021-09-06	3928.4	3952.33	3971.74	3872.94	247435.33	971327540.19	2021-09-07 23:02:28	2021-09-07 23:02:28	10
346674	BCH	2021-08-24	637.73	678.12	683.41	634.87	58709.24	38632106.27	2021-08-25 22:59:31	2021-08-25 22:59:31	8
385634	SJCX	2021-11-11	0.002593	0.002597	0.002593	0.002593	0	0	2021-11-12 23:17:41	2021-11-12 23:17:41	11
373700	EOS	2021-10-19	4.461	4.421	4.516	4.368	3874874.98	17209867.17	2021-10-20 23:12:25	2021-10-20 23:12:25	9
362998	ZRX	2021-09-27	0.8523	0.8969	0.9292	0.8515	5650378.25	5063553.91	2021-09-28 23:07:18	2021-09-28 23:07:18	6
3534	FIL	2020-12-17	28.48	28.41	29.45	28.31	118366.82	3404865.11	2021-05-07 19:24:30	2021-05-07 19:24:30	13
462	DOT	2020-07-26	0	0	0	0	0	0	2021-05-09 17:34:36	2021-05-09 17:34:36	4
1125	SJCX	2020-05-18	0.0003889	0.0003868	0.0003889	0.0003889	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
3535	FIL	2020-12-18	28.47	28.48	28.84	28.34	111449.87	3180582.43	2021-05-07 19:24:30	2021-05-07 19:24:30	13
1126	SJCX	2020-05-19	0.0003912	0.0003889	0.0003912	0.0003912	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1127	SJCX	2020-05-20	0.0003804	0.0003912	0.0003804	0.0003804	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1128	SJCX	2020-05-21	0.0003624	0.0003804	0.0003624	0.0003624	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1129	SJCX	2020-05-22	0.0003668	0.0003624	0.0003668	0.0003668	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1130	SJCX	2020-05-23	0.0003674	0.0003668	0.0003674	0.0003674	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1131	SJCX	2020-05-24	0.0003487	0.0003674	0.0003487	0.0003487	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1132	SJCX	2020-05-25	0.0003561	0.0003487	0.0003561	0.0003561	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1133	SJCX	2020-05-26	0.0003538	0.0003561	0.0003538	0.0003538	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1134	SJCX	2020-05-27	0.0003682	0.0003538	0.0003682	0.0003682	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1135	SJCX	2020-05-28	0.0003832	0.0003682	0.0003832	0.0003832	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1136	SJCX	2020-05-29	0.000377	0.0003832	0.000377	0.000377	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1137	SJCX	2020-05-30	0.000388	0.000377	0.000388	0.000388	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1138	SJCX	2020-05-31	0.000378	0.000388	0.000378	0.000378	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1139	SJCX	2020-06-01	0.0004084	0.000378	0.0004084	0.0004084	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1140	SJCX	2020-06-02	0.000381	0.0004084	0.000381	0.000381	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1141	SJCX	2020-06-03	0.0003866	0.000381	0.0003866	0.0003866	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1142	SJCX	2020-06-04	0.0003918	0.0003866	0.0003918	0.0003918	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
3536	FIL	2020-12-19	28.25	28.47	28.92	28.1	93848.69	2673977.33	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3537	FIL	2020-12-20	28.36	28.25	28.48	27.94	65719.35	1853575.26	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3538	FIL	2020-12-21	24.97	28.36	28.39	24.04	315205.14	8164657.99	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3539	FIL	2020-12-22	24.61	24.97	25.53	24.33	562810.84	13933813.86	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3540	FIL	2020-12-23	22.27	24.61	25	21.23	285946.42	6646631.48	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3541	FIL	2020-12-24	23.7	22.27	24.44	21.89	324069.56	7449464.53	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3542	FIL	2020-12-25	24.34	23.7	24.55	23.11	283578.64	6730815.71	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3543	FIL	2020-12-26	23.55	24.34	26.05	23.31	112153.34	2641199.48	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3544	FIL	2020-12-27	22.22	23.55	23.67	22.2	141424.41	3253255.85	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3545	FIL	2020-12-28	21.94	22.22	23.08	21.9	243280.84	5461219.63	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3546	FIL	2020-12-29	20.43	21.94	22.22	19.96	301637.2	6273871.74	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3547	FIL	2020-12-30	21.49	20.43	21.99	20.22	245474.36	5253480.16	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3548	FIL	2020-12-31	24.34	21.49	26.39	21.09	573636.34	13697149.35	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3549	FIL	2021-01-01	22.27	24.34	25	21.98	274021.06	6370363.72	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3550	FIL	2021-01-02	21.77	22.27	23.22	21.38	218147.91	4845367.89	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3551	FIL	2021-01-03	21.46	21.77	21.97	20.96	275143.01	5900119.28	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3552	FIL	2021-01-04	21.46	21.46	23.03	20.95	315689.71	6904150.89	2021-05-07 19:24:30	2021-05-07 19:24:30	13
1143	SJCX	2020-06-05	0.0003849	0.0003918	0.0003849	0.0003849	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
3553	FIL	2021-01-05	21.67	21.46	22.46	21.01	290703.56	6275838.08	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3554	FIL	2021-01-06	22	21.67	22.63	21.57	306078.42	6714119.74	2021-05-07 19:24:30	2021-05-07 19:24:30	13
327658	SJCX	2021-07-14	0.001313	0.001309	0.001313	0.001313	0	0	2021-07-15 22:50:04	2021-07-15 22:50:04	11
311236	DOT	2021-06-09	23.2	21.69	23.43	20.41	1650410.61	36243191.18	2021-06-10 23:42:04	2021-06-10 23:42:04	4
311286	ANT	2021-06-09	4.715	4.627	5.197	4.689	1263772.85	5958787.86	2021-06-10 23:42:05	2021-06-10 23:42:05	14
347128	XTZ	2021-08-25	5.101	3.963	5.425	3.96	30120696.91	143341789.58	2021-08-26 23:59:45	2021-08-26 23:59:45	5
335902	FIL	2021-08-01	53.9	52.05	58.26	51.63	843238.02	47159421.33	2021-08-02 23:54:12	2021-08-02 23:54:12	13
346676	XTZ	2021-08-24	3.963	4.314	4.47	3.901	11771519.9	49388538.57	2021-08-25 23:59:31	2021-08-25 23:59:31	5
341942	ANT	2021-08-14	5.167	5.022	5.421	4.884	468312.75	2419815.39	2021-08-15 21:57:11	2021-08-15 21:57:11	14
328160	DOT	2021-07-15	13.09	13.8	14.1	12.75	1153951.44	15217318.39	2021-07-16 23:50:18	2021-07-16 23:50:18	4
316390	ANT	2021-06-20	9.424	10.03	11.08	6.864	607668.7	5726620.13	2021-06-21 23:44:36	2021-06-21 23:44:36	14
1144	SJCX	2020-06-06	0.0003869	0.0003849	0.0003869	0.0003869	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1145	SJCX	2020-06-07	0.00039	0.0003869	0.00039	0.00039	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
322062	XTZ	2021-07-02	2.955	2.948	2.977	2.752	2165783.28	6178791.24	2021-07-03 23:47:21	2021-07-03 23:47:21	5
1146	SJCX	2020-06-08	0.0003913	0.00039	0.0003913	0.0003913	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
341970	BCH	2021-08-14	692.25	654.85	692.71	642.87	63831.7	42260871.22	2021-08-15 23:57:12	2021-08-15 23:57:12	8
1147	SJCX	2020-06-09	0.0003912	0.0003913	0.0003912	0.0003912	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
363000	EOS	2021-09-27	3.831	3.977	4.113	3.827	5806308.06	23034259.28	2021-09-28 22:07:18	2021-09-28 22:07:18	9
352926	ATOM	2021-09-06	25.12	25.76	27.08	23.87	752909.73	19384147.94	2021-09-07 23:02:29	2021-09-07 23:02:29	3
368286	DOT	2021-10-08	33.32	33.98	34.49	33.05	2679733.39	90405640.68	2021-10-09 23:09:52	2021-10-09 23:09:52	4
358264	ATOM	2021-09-17	33.43	37.18	38.01	32.54	1441967.06	50884748.11	2021-09-18 23:05:00	2021-09-18 23:05:00	3
368794	ETH	2021-10-09	3576.4	3562.84	3633.84	3539.3	135476.06	486436966.61	2021-10-10 23:10:06	2021-10-10 23:10:06	10
373234	OCN	2021-10-18	0.0006204	0.0006152	0.0006204	0.0006204	54255691.86	33659.23	2021-10-19 23:12:12	2021-10-19 23:12:12	2
373710	SJCX	2021-10-19	0.002571	0.002482	0.002571	0.002571	0	0	2021-10-20 22:12:25	2021-10-20 22:12:25	11
380394	XTZ	2021-11-01	6.244	6.357	6.38	6.055	4336575.73	27012647.95	2021-11-02 23:15:23	2021-11-02 23:15:23	5
380384	FIL	2021-11-01	63.88	64.41	64.51	60.72	381875.98	23996857.72	2021-11-02 23:15:23	2021-11-02 23:15:23	13
385636	BCH	2021-11-11	676.65	664.06	680.75	658.94	64484.45	43364423.32	2021-11-12 23:17:40	2021-11-12 23:17:40	8
311238	BCH	2021-06-09	633.29	596	635.14	566.74	94603.54	56977660.43	2021-06-10 23:42:04	2021-06-10 23:42:04	8
380386	SJCX	2021-11-01	0.002438	0.002454	0.002438	0.002438	0	0	2021-11-02 23:15:23	2021-11-02 23:15:23	11
316392	SJCX	2021-06-20	0.001424	0.001421	0.001424	0.001424	0	0	2021-06-21 23:44:37	2021-06-21 23:44:37	11
327660	ANT	2021-07-14	3.64	3.506	3.653	3.426	1263617.01	4599304.92	2021-07-15 23:50:04	2021-07-15 23:50:04	14
363994	XTZ	2021-09-29	5.637	5.469	6.075	5.347	11473347.83	65252688.3	2021-09-30 23:07:47	2021-09-30 23:07:47	5
352928	ZRX	2021-09-06	1.291	1.312	1.314	1.241	9247325.39	11858682.81	2021-09-07 23:02:29	2021-09-07 23:02:29	6
358266	FIL	2021-09-17	85.79	84.74	86.67	80.61	461275.26	38613076.14	2021-09-18 21:04:59	2021-09-18 21:04:59	13
346678	ATOM	2021-08-24	19.68	21.76	22.26	19.37	3009482.1	63769531.73	2021-08-25 23:59:31	2021-08-25 23:59:31	3
341944	EOS	2021-08-14	5.49	5.161	5.555	5.046	9067263.94	48050333.64	2021-08-15 21:57:11	2021-08-15 21:57:11	9
3201	BCH	2021-01-19	508.45	509.06	524.62	494.44	411203.48	209075989.36	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3202	BCH	2021-01-20	497.73	508.45	514.06	491.69	347408.15	172915231.85	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3203	BCH	2021-01-21	418.5	497.73	437.01	415.11	351766.05	147215101.85	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3204	BCH	2021-01-22	440.99	418.5	453.86	435.71	341342.91	150527836.1	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3205	BCH	2021-01-23	431.52	440.99	434.41	420.93	233652.31	100826106.88	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3206	BCH	2021-01-24	440.03	431.52	441.96	430.02	258372.58	113690726.73	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3207	BCH	2021-01-25	432.49	440.03	449.27	425.07	294469.7	127354793.6	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3208	BCH	2021-01-26	427.92	432.49	442.22	425.64	237094.03	101456661.63	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3209	BCH	2021-01-27	378.46	427.92	403.71	370.25	332036.42	125663413.96	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3210	BCH	2021-01-28	405.91	378.76	415.45	371.53	121748.72	48023472.27	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3211	BCH	2021-01-29	406.91	406.01	429.18	381.91	552973.88	225013206.24	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3212	BCH	2021-01-30	417.3	406.91	423.48	398.43	354832.21	148073145.82	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3213	BCH	2021-01-31	400.04	417.3	406.67	393.08	207105.82	82850335.83	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3214	BCH	2021-02-01	414.84	400.04	435.97	398.74	375797.73	155895771.65	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3215	BCH	2021-02-02	430.56	414.84	443.34	424.87	309006.94	133044820.36	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3216	BCH	2021-02-03	446.85	430.56	463.81	446.48	288055.19	128718398.52	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3217	BCH	2021-02-04	421.61	446.85	443.43	417.17	354827.12	149599012.63	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3218	BCH	2021-02-05	447.85	421.61	453.21	434.44	269446.81	120670866.19	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3220	BCH	2021-02-07	445.44	458.64	461.76	443.49	350622.4	156180076.81	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3221	BCH	2021-02-08	484.81	445.44	540.07	482.02	454616.79	220401202.26	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3222	BCH	2021-02-09	515.33	484.81	519.05	479.05	586237.44	302103415.88	2021-05-09 17:34:36	2021-05-09 17:34:36	8
1152	SJCX	2020-06-14	0.0003733	0.000379	0.0003733	0.0003733	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1153	SJCX	2020-06-15	0.0003772	0.0003733	0.0003772	0.0003772	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1154	SJCX	2020-06-16	0.0003811	0.0003772	0.0003811	0.0003811	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1155	SJCX	2020-06-17	0.0003784	0.0003811	0.0003784	0.0003784	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1156	SJCX	2020-06-18	0.0003752	0.0003784	0.0003752	0.0003752	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1157	SJCX	2020-06-19	0.0003721	0.0003752	0.0003721	0.0003721	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1158	SJCX	2020-06-20	0.0003744	0.0003721	0.0003744	0.0003744	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1159	SJCX	2020-06-21	0.0003717	0.0003744	0.0003717	0.0003717	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1160	SJCX	2020-06-22	0.0003877	0.0003717	0.0003877	0.0003877	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1161	SJCX	2020-06-23	0.000385	0.0003877	0.000385	0.000385	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1162	SJCX	2020-06-24	0.0003717	0.000385	0.0003717	0.0003717	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1163	SJCX	2020-06-25	0.0003697	0.0003717	0.0003697	0.0003697	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1164	SJCX	2020-06-26	0.0003663	0.0003697	0.0003663	0.0003663	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1165	SJCX	2020-06-27	0.0003603	0.0003663	0.0003603	0.0003603	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1166	SJCX	2020-06-28	0.0003648	0.0003603	0.0003648	0.0003648	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1167	SJCX	2020-06-29	0.0003675	0.0003648	0.0003675	0.0003675	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1168	SJCX	2020-06-30	0.0003655	0.0003675	0.0003655	0.0003655	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1169	SJCX	2020-07-01	0.0003696	0.0003655	0.0003696	0.0003696	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1170	SJCX	2020-07-02	0.0003637	0.0003696	0.0003637	0.0003637	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1171	SJCX	2020-07-03	0.0003627	0.0003637	0.0003627	0.0003627	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1172	SJCX	2020-07-04	0.0003657	0.0003627	0.0003657	0.0003657	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1173	SJCX	2020-07-05	0.0003633	0.0003657	0.0003633	0.0003633	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1174	SJCX	2020-07-06	0.0003739	0.0003633	0.0003739	0.0003739	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
322064	DOT	2021-07-02	15.31	15.21	15.45	14.65	678506.05	10169924.93	2021-07-03 23:47:21	2021-07-03 23:47:21	4
335926	ANT	2021-08-01	3.866	4.03	3.999	3.841	727907.08	2814283.56	2021-08-02 23:54:13	2021-08-02 23:54:13	14
363482	EOS	2021-09-28	3.685	3.831	3.959	3.657	5314008.87	20153989.09	2021-09-29 22:07:32	2021-09-29 22:07:32	9
368288	EOS	2021-10-08	4.647	4.721	4.829	4.588	4669980.1	22025734.37	2021-10-09 22:09:52	2021-10-09 22:09:52	9
373702	DOT	2021-10-19	41.36	41.18	41.63	40.05	3264006.11	133686335.29	2021-10-20 23:12:25	2021-10-20 23:12:25	4
385638	DOT	2021-11-11	47.49	46.82	49.45	45.6	3663542.28	175206377.17	2021-11-12 23:17:40	2021-11-12 23:17:40	4
328108	ANT	2021-07-15	3.461	3.64	3.566	3.448	919643.04	3182706.29	2021-07-16 23:50:18	2021-07-16 23:50:18	14
373704	OCN	2021-10-19	0.0006428	0.0006204	0.0006428	0.0006428	54001957.82	34714.6	2021-10-20 23:12:29	2021-10-20 23:12:29	2
322066	BCH	2021-07-02	495.91	497.11	504.03	490.84	94094.2	46662499.54	2021-07-03 23:47:22	2021-07-03 23:47:22	8
368798	OCN	2021-10-09	0.0005497	0.0005395	0.0005497	0.0005497	20385538	11205.53	2021-10-10 22:10:06	2021-10-10 22:10:06	2
341946	ATOM	2021-08-14	15.56	15.22	15.77	14.73	1138141.48	17317365.7	2021-08-15 23:57:12	2021-08-15 23:57:12	3
346680	EOS	2021-08-24	5.063	5.592	5.694	4.896	8565113.68	45461711.03	2021-08-25 23:59:31	2021-08-25 23:59:31	9
311240	FIL	2021-06-09	77.71	76.07	78.77	70.97	666899.23	49975337.76	2021-06-10 22:42:04	2021-06-10 22:42:04	13
316394	XTZ	2021-06-20	3.075	3.032	3.116	2.881	2616425.68	7835745.86	2021-06-21 23:44:36	2021-06-21 23:44:36	5
352930	EOS	2021-09-06	6.223	6.298	6.423	5.903	13639606.24	84599201.1	2021-09-07 23:02:29	2021-09-07 23:02:29	9
363514	ANT	2021-09-28	4.1	4.32	4.327	4.065	408771.66	1675935.62	2021-09-29 23:07:32	2021-09-29 23:07:32	14
327662	EOS	2021-07-14	3.798	3.888	3.925	3.595	3409534.02	12796630.31	2021-07-15 23:50:04	2021-07-15 23:50:04	9
363484	ATOM	2021-09-28	33.69	37.23	37.86	33.37	3769479.09	133740215.01	2021-09-29 23:07:32	2021-09-29 23:07:32	3
347126	ZRX	2021-08-25	1.152	1.062	1.174	1.016	10047977.35	11081761.99	2021-08-26 23:59:45	2021-08-26 23:59:45	6
336348	ATOM	2021-08-02	12.48	12.33	12.76	12.11	848939.91	10570942.8	2021-08-03 23:54:27	2021-08-03 23:54:27	3
358268	XTZ	2021-09-17	6.109	6.952	6.971	6.047	15832277.82	100899291.19	2021-09-18 23:05:00	2021-09-18 23:05:00	5
368290	ANT	2021-10-08	4.859	4.737	4.921	4.635	274243.2	1332606	2021-10-09 23:09:52	2021-10-09 23:09:52	14
385640	ATOM	2021-11-11	32.96	32.17	34	31.75	2158734.57	71308202.18	2021-11-12 23:17:42	2021-11-12 23:17:42	3
380404	BCH	2021-11-01	587.36	597.36	594.13	576.39	81512.45	47877074.57	2021-11-02 23:15:24	2021-11-02 23:15:24	8
1418	SJCX	2021-03-07	0.002039	0.001956	0.002039	0.002039	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1419	SJCX	2021-03-08	0.002096	0.002039	0.002096	0.002096	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1420	SJCX	2021-03-09	0.002197	0.002096	0.002197	0.002197	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1421	SJCX	2021-03-10	0.002236	0.002197	0.002236	0.002236	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1422	SJCX	2021-03-11	0.002312	0.002236	0.002312	0.002312	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1423	SJCX	2021-03-12	0.00229	0.002312	0.00229	0.00229	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1424	SJCX	2021-03-13	0.002447	0.00229	0.002447	0.002447	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
1425	SJCX	2021-03-14	0.00236	0.002447	0.00236	0.00236	0	0	2021-05-09 17:34:37	2021-05-09 17:34:37	11
341948	ZRX	2021-08-14	1.069	1.06	1.096	1.014	10950206.31	11585955.12	2021-08-15 23:57:12	2021-08-15 23:57:12	6
322068	EOS	2021-07-02	3.925	3.929	4.003	3.747	3882439.25	14915712.1	2021-07-03 23:47:21	2021-07-03 23:47:21	9
311242	BTC	2021-06-09	37391.58	33409.38	37528.42	32435.18	92280.57	3249553573.38	2021-06-10 23:42:04	2021-06-10 23:42:04	7
316396	BCH	2021-06-20	556.45	552.64	560.64	514.5	56870.13	30529400.04	2021-06-21 23:44:37	2021-06-21 23:44:37	8
368782	BCH	2021-10-09	615.14	596.17	624.64	592.29	60699.07	37201489.3	2021-10-10 23:10:06	2021-10-10 23:10:06	8
352932	BCH	2021-09-06	784.96	765.08	802.35	741.99	112591.23	87326550.56	2021-09-07 23:02:29	2021-09-07 23:02:29	8
347190	FIL	2021-08-25	76.51	74.43	77.92	72.42	435315.6	32831263.08	2021-08-26 22:59:45	2021-08-26 22:59:45	13
347156	ATOM	2021-08-25	20.02	19.68	20.86	18.65	461276.18	9143471.15	2021-08-26 23:59:45	2021-08-26 23:59:45	3
373708	BCH	2021-10-19	618.54	611.47	624.83	599.85	58369.29	35764231.45	2021-10-20 23:12:25	2021-10-20 23:12:25	8
380408	ETH	2021-11-01	4322.79	4290.1	4383.1	4153.91	331343.91	1425220983.08	2021-11-02 23:15:23	2021-11-02 23:15:23	10
336350	BTC	2021-08-02	39158.53	39870.76	40446.6	38698.01	33109.34	1308894644.03	2021-08-03 23:54:27	2021-08-03 23:54:27	7
346682	ZRX	2021-08-24	1.062	1.16	1.188	1.038	10631749.07	11804688.82	2021-08-25 23:59:31	2021-08-25 23:59:31	6
363486	ZRX	2021-09-28	0.8159	0.8523	0.8694	0.8118	5592201.77	4691904.55	2021-09-29 20:07:31	2021-09-29 20:07:31	6
328118	FIL	2021-07-15	47.26	49.64	50.3	46.26	172618.35	8305646.07	2021-07-16 23:50:18	2021-07-16 23:50:18	13
385642	ETH	2021-11-11	4722.68	4632.98	4781.36	4579.28	222355.2	1045035758.02	2021-11-12 23:17:39	2021-11-12 23:17:39	10
358270	ANT	2021-09-17	5.841	6.057	6.002	5.728	249853.07	1459466.87	2021-09-18 23:05:00	2021-09-18 23:05:00	14
4463	EOS	2020-07-01	2.379	2.369	2.404	2.357	635749.46	1515094.4	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4464	EOS	2020-07-02	2.36	2.379	2.388	2.308	988690.52	2327439.77	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4465	EOS	2020-07-03	2.419	2.36	2.456	2.353	1070801.34	2589253.79	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4480	EOS	2020-07-18	2.504	2.497	2.519	2.484	330734.23	828742.64	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4481	EOS	2020-07-19	2.585	2.504	2.611	2.473	1184823.68	3026843.17	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4482	EOS	2020-07-20	2.566	2.585	2.616	2.539	1052204.52	2714458.54	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4483	EOS	2020-07-21	2.625	2.566	2.636	2.56	1109556.9	2901226.23	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4484	EOS	2020-07-22	2.667	2.625	2.672	2.584	1136182.16	2998526.18	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4485	EOS	2020-07-23	2.659	2.667	2.692	2.636	1715873.54	4572675.99	2021-05-09 17:34:36	2021-05-09 17:34:36	9
2834	BTC	2021-01-18	36623.04	35839.51	37429.24	34784.4	43063.97	1554686784.02	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2835	BTC	2021-01-19	35932.79	36623.04	37867.53	35917.28	48457.45	1787957383.29	2021-05-09 17:34:36	2021-05-09 17:34:36	7
373730	ZRX	2021-10-19	0.9674	0.9693	0.9874	0.9461	4341069.86	4182373.39	2021-10-20 23:12:25	2021-10-20 23:12:25	6
358272	EOS	2021-09-17	5.251	5.021	5.515	4.952	12269206.58	64522653.87	2021-09-18 21:04:59	2021-09-18 21:04:59	9
2836	BTC	2021-01-20	35501.38	35932.79	36409.96	33519.59	66302.02	2316775667.92	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2837	BTC	2021-01-21	30840.3	35501.38	35619.6	30067.14	125586.98	4042427455.09	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2838	BTC	2021-01-22	33008.02	30840.3	33857.39	28817.3	109210.12	3418228006.19	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2839	BTC	2021-01-23	32107.29	33008.02	33484.73	31430.15	39813.32	1287618530.17	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2840	BTC	2021-01-24	32283.66	32107.29	33090.99	30957.56	33650.76	1079875602.62	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2841	BTC	2021-01-25	32275.27	32283.66	34881.18	31937.09	59529.49	1989618039.07	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2842	BTC	2021-01-26	32516.52	32275.27	32943.69	30853.17	59770.06	1909630282.43	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2843	BTC	2021-01-27	30423.05	32516.52	32580.05	29236.73	102257.23	3149650799.32	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2844	BTC	2021-01-28	33443.87	30423.05	33880.92	29905.53	76993.1	2463162479.45	2021-05-09 17:34:36	2021-05-09 17:34:36	7
347158	BCH	2021-08-25	650.82	637.73	658.86	627.22	56943.61	36477687.2	2021-08-26 23:59:46	2021-08-26 23:59:46	8
341950	ETH	2021-08-14	3266.71	3324.26	3332.19	3208.8	232982.78	761182928.57	2021-08-15 23:57:12	2021-08-15 23:57:12	10
336352	ZRX	2021-08-02	0.8171	0.7803	0.8233	0.7562	4592715.44	3656873.98	2021-08-03 23:54:27	2021-08-03 23:54:27	6
311244	ATOM	2021-06-09	13.94	13.59	14.01	12.63	1125364.23	15193141.26	2021-06-10 22:42:04	2021-06-10 22:42:04	3
322086	SJCX	2021-07-02	0.001352	0.001342	0.001352	0.001352	0	0	2021-07-03 23:47:22	2021-07-03 23:47:22	11
328122	BCH	2021-07-15	455.7	467.04	460.17	443.6	135049.52	61542698.03	2021-07-16 23:50:17	2021-07-16 23:50:17	8
328138	SJCX	2021-07-15	0.001275	0.001313	0.001275	0.001275	0	0	2021-07-16 23:50:18	2021-07-16 23:50:18	11
352934	SJCX	2021-09-06	0.002108	0.002071	0.002108	0.002108	0	0	2021-09-07 23:02:45	2021-09-07 23:02:45	11
385644	XTZ	2021-11-11	5.867	5.778	6.051	5.707	5058628.34	29858650	2021-11-12 23:17:40	2021-11-12 23:17:40	5
380884	BTC	2021-11-02	63260.05	60960.98	64283.57	60677.48	36009.96	2260756044.28	2021-11-03 23:15:37	2021-11-03 23:15:37	7
368784	BTC	2021-10-09	54968.04	53949.29	55485.2	53696.32	14593.95	799607238.61	2021-10-10 23:10:06	2021-10-10 23:10:06	7
363488	BTC	2021-09-28	41056.79	42187.51	42781.24	40924.13	31946.42	1335757058.57	2021-09-29 23:07:32	2021-09-29 23:07:32	7
380896	ETH	2021-11-02	4593.15	4322.79	4603.64	4287.58	419178.03	1870280986.16	2021-11-03 23:15:38	2021-11-03 23:15:38	10
381418	BCH	2021-11-03	611.29	598.6	618.96	590.33	66076.15	40004291.76	2021-11-04 23:15:51	2021-11-04 23:15:51	8
363996	DOT	2021-09-29	27.26	26.33	28.57	26.12	3585087.58	98603998.93	2021-09-30 23:07:47	2021-09-30 23:07:47	4
363976	SJCX	2021-09-29	0.001662	0.001642	0.001662	0.001662	0	0	2021-09-30 23:07:47	2021-09-30 23:07:47	11
373714	ETH	2021-10-19	3877.45	3746.14	3888.54	3733.6	291414.08	1110236475.25	2021-10-20 23:12:25	2021-10-20 23:12:25	10
4486	EOS	2020-07-24	2.6	2.659	2.659	2.578	1019852.07	2659502.78	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4487	EOS	2020-07-25	2.731	2.6	2.749	2.598	1643786.2	4426904.06	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4488	EOS	2020-07-26	2.716	2.731	2.805	2.689	1961145.42	5385264.97	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4489	EOS	2020-07-27	2.853	2.716	2.933	2.649	4424470.98	12372822.44	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4490	EOS	2020-07-28	3.004	2.853	3.08	2.782	3844225.37	11267371.92	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4491	EOS	2020-07-29	3.027	3.004	3.153	2.957	2994774.16	9211601.86	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4492	EOS	2020-07-30	3.053	3.027	3.105	2.962	1582118.67	4795600.28	2021-05-09 17:34:36	2021-05-09 17:34:36	9
352946	FIL	2021-09-06	106.29	113.63	118.55	103.94	1130130.55	125875178.81	2021-09-07 23:02:29	2021-09-07 23:02:29	13
322120	ANT	2021-07-02	3.699	3.48	3.904	3.512	130851.19	484031.04	2021-07-03 23:47:22	2021-07-03 23:47:22	14
2870	BTC	2021-02-23	48898.7	54121.17	54164.35	44983.39	165758.08	8016450648.12	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2871	BTC	2021-02-24	49738.17	48898.7	51399.55	47015.55	74972.28	3729774704.65	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2872	BTC	2021-02-25	47082.87	49738.17	52086.34	46728.88	73102.42	3643008748.86	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2873	BTC	2021-02-26	46324.5	47082.87	48438.38	44153.46	90519.05	4204800171.81	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2874	BTC	2021-02-27	46191.39	46324.5	48362.8	45063.84	39013.78	1831237567.32	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2875	BTC	2021-02-28	45261.03	46191.39	46645.9	43061.92	62249.5	2776726256.13	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2878	BTC	2021-03-03	50392.55	48501.21	52625.39	48176.64	51572.27	2615513552.66	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2879	BTC	2021-03-04	48363.74	50392.55	51792.65	47516.91	61387.71	3024053725.58	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2880	BTC	2021-03-05	48775.37	48363.74	49467.19	46311.43	60955.82	2907395734.68	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2881	BTC	2021-03-06	48892.8	48775.37	49185.32	47099.07	25116.42	1214194643.85	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2882	BTC	2021-03-07	50964.18	48892.8	51455.54	48892.8	32958.26	1658558074.88	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2901	BTC	2021-03-26	55055.43	51336.09	55083.9	51275.54	46165.63	2461374478.26	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2902	BTC	2021-03-27	55863.73	55055.43	56606.78	53991	27392.29	1514783182.02	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2903	BTC	2021-03-28	55781.01	55863.73	56561.55	54717.97	24145.77	1345583216.95	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2904	BTC	2021-03-29	57626.1	55781.01	58413.9	54910.57	51547.9	2950020309.68	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2905	BTC	2021-03-30	58781.54	57626.1	59402.27	57055.21	35315.45	2064647135.86	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2906	BTC	2021-03-31	58793.8	58781.54	59818.5	56918.81	46494.48	2727194335.71	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2907	BTC	2021-04-01	58730.82	58793.8	59469.45	57949.11	28027.66	1648724834.05	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2908	BTC	2021-04-02	58987.8	58730.82	60061.51	58458.46	29748.03	1765524921.41	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2909	BTC	2021-04-03	57074.97	58987.8	59770.87	56958.04	25104.9	1470430519.81	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2910	BTC	2021-04-04	58219.43	57074.97	58493.73	56493.38	19002.99	1093079652.2	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2911	BTC	2021-04-05	59119.56	58219.43	59235.68	56833.44	24696.26	1439529332.47	2021-05-09 17:34:36	2021-05-09 17:34:36	7
381410	XTZ	2021-11-03	6.32	6.266	6.495	6.059	7542848.81	47278139.21	2021-11-04 23:15:51	2021-11-04 23:15:51	5
328156	XTZ	2021-07-15	2.575	2.717	2.75	2.525	2616004.29	6812382.57	2021-07-16 23:50:18	2021-07-16 23:50:18	5
347568	ZRX	2021-08-26	1.048	1.152	1.168	1.022	9816493.34	10577619.29	2021-08-27 23:59:59	2021-08-27 23:59:59	6
341952	SJCX	2021-08-14	0.001884	0.001913	0.001884	0.001884	0	0	2021-08-15 19:57:10	2021-08-15 19:57:10	11
363490	OCN	2021-09-28	0.0004106	0.0004219	0.0008211	0.0004106	90733135.58	37252.11	2021-09-29 20:07:31	2021-09-29 20:07:31	2
341974	FIL	2021-08-14	72.51	74.51	75.04	70.29	575374.62	41978552.25	2021-08-15 23:57:12	2021-08-15 23:57:12	13
358274	DOT	2021-09-17	33.02	35.54	36.94	32.23	4240177.44	145887047.94	2021-09-18 23:05:00	2021-09-18 23:05:00	4
311246	XTZ	2021-06-09	3.509	3.45	3.533	3.228	5099110.64	17376920.74	2021-06-10 23:42:04	2021-06-10 23:42:04	5
336354	BCH	2021-08-02	543.52	526.29	559.18	515.72	190266.29	103413609.36	2021-08-03 23:54:27	2021-08-03 23:54:27	8
380898	BCH	2021-11-02	598.6	587.44	608.75	583.07	43519.75	25939190.88	2021-11-03 23:15:37	2021-11-03 23:15:37	8
380886	ANT	2021-11-02	4.823	4.698	4.965	4.823	276952.57	1335727.35	2021-11-03 23:15:37	2021-11-03 23:15:37	14
363522	DOT	2021-09-28	26.33	27.73	28.37	26.16	3233213.37	88174590.52	2021-09-29 23:07:32	2021-09-29 23:07:32	4
363962	ANT	2021-09-29	4.27	4.1	4.27	4.123	194938.2	832435.51	2021-09-30 22:07:46	2021-09-30 22:07:46	14
368790	ANT	2021-10-09	4.922	4.859	5.277	4.844	928578.89	4570825.57	2021-10-10 23:10:06	2021-10-10 23:10:06	14
373728	BTC	2021-10-19	64283.97	62038.16	64468.7	61410.11	42983.11	2706420467.09	2021-10-20 22:12:25	2021-10-20 22:12:25	7
385646	FIL	2021-11-11	62.81	63.64	64.48	61.74	327225.15	20751665.99	2021-11-12 23:17:41	2021-11-12 23:17:41	13
380916	SJCX	2021-11-02	0.00253	0.002438	0.00253	0.00253	0	0	2021-11-03 22:15:37	2021-11-03 22:15:37	11
368818	FIL	2021-10-09	76.96	79.5	80.63	75.2	512164.48	39761308.8	2021-10-10 23:10:06	2021-10-10 23:10:06	13
322	XTZ	2021-03-09	4.47	4.398	4.588	4.349	4763859.65	21220922.9	2021-05-07 19:24:31	2021-05-07 19:24:31	5
323	XTZ	2021-03-10	4.147	4.47	4.481	4.066	5102751.2	21655043.37	2021-05-07 19:24:31	2021-05-07 19:24:31	5
324	XTZ	2021-03-11	4.122	4.147	4.193	3.946	3279059.28	13440179.88	2021-05-07 19:24:31	2021-05-07 19:24:31	5
374228	ZRX	2021-10-20	1.003	0.9674	1.005	0.9566	5280612.06	5219057.04	2021-10-21 23:12:39	2021-10-21 23:12:39	6
342410	DOT	2021-08-15	23.17	22.87	23.35	21.87	1629844.87	36841230.2	2021-08-16 23:57:26	2021-08-16 23:57:26	4
363520	SJCX	2021-09-28	0.001642	0.001688	0.001642	0.001642	0	0	2021-09-29 22:07:32	2021-09-29 22:07:32	11
325	XTZ	2021-03-12	3.967	4.122	4.145	3.817	3739750.16	14874849.71	2021-05-07 19:24:31	2021-05-07 19:24:31	5
326	XTZ	2021-03-13	4.165	3.967	4.234	3.805	3324660.17	13549105.96	2021-05-07 19:24:31	2021-05-07 19:24:31	5
322528	XTZ	2021-07-03	3.027	2.955	3.027	2.878	1398427.29	4159175.61	2021-07-04 22:47:35	2021-07-04 22:47:35	5
363492	BCH	2021-09-28	474.59	488.64	499.18	473.11	70526.57	34393738.31	2021-09-29 23:07:32	2021-09-29 23:07:32	8
347570	BTC	2021-08-26	46852.22	48996.44	49358.2	46456.68	34276.36	1618461768.41	2021-08-27 23:59:58	2021-08-27 23:59:58	7
374258	ANT	2021-10-20	4.84	4.626	4.861	4.669	248368.79	1202105.19	2021-10-21 23:12:39	2021-10-21 23:12:39	14
352952	ANT	2021-09-06	6.85	6.882	7.166	6.761	468163.59	3206982.2	2021-09-07 23:02:29	2021-09-07 23:02:29	14
336356	XTZ	2021-08-02	3.129	2.956	3.306	2.891	4997026.59	15724430.31	2021-08-03 23:54:27	2021-08-03 23:54:27	5
358276	SJCX	2021-09-17	0.001892	0.001911	0.001892	0.001892	0	0	2021-09-18 21:04:59	2021-09-18 21:04:59	11
327	XTZ	2021-03-14	3.933	4.165	4.187	3.929	2356667.17	9561992.66	2021-05-07 19:24:31	2021-05-07 19:24:31	5
10977	ATOM	2020-12-13	5.196	5.07	5.382	5.06	960716.01	5042000.81	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10978	ATOM	2020-12-14	5.229	5.196	5.322	5.035	539997.37	2791018.61	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10979	ATOM	2020-12-15	5.29	5.229	5.36	5.065	453940.04	2379953.61	2021-05-09 17:34:36	2021-05-09 17:34:36	3
4420	EOS	2020-05-19	2.654	2.665	2.666	2.571	10194366.66	26822177.35	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4421	EOS	2020-05-20	2.596	2.654	2.678	2.54	8576076.96	22527834.05	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4422	EOS	2020-05-21	2.459	2.596	2.614	2.409	10077290	25484010.15	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4423	EOS	2020-05-22	2.594	2.459	2.637	2.442	10115463.27	25593508.02	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4424	EOS	2020-05-23	2.563	2.594	2.622	2.544	8373392.55	21596092.94	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4425	EOS	2020-05-24	2.494	2.563	2.613	2.494	7216789.21	18522385.59	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4426	EOS	2020-05-25	2.527	2.494	2.548	2.448	8197824.9	20616574.35	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4493	EOS	2020-07-31	3.096	3.053	3.146	3.016	1550569.63	4769924.2	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4494	EOS	2020-08-01	3.307	3.096	3.328	3.074	3581276.06	11509141.45	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4495	EOS	2020-08-02	2.943	3.307	3.486	2.614	6129756.87	18869332.99	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4496	EOS	2020-08-03	3.048	2.943	3.122	2.905	2212953.48	6707551.74	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4497	EOS	2020-08-04	3.035	3.048	3.1	2.962	1691764.39	5134676.95	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4498	EOS	2020-08-05	3.054	3.035	3.1	3.005	1435249.76	4382530.6	2021-05-09 17:34:36	2021-05-09 17:34:36	9
381436	SJCX	2021-11-03	0.002517	0.00253	0.002517	0.002517	0	0	2021-11-04 23:15:57	2021-11-04 23:15:57	11
311248	ZRX	2021-06-09	0.966	0.9553	0.9828	0.9232	9025974.87	8610699.82	2021-06-10 23:42:04	2021-06-10 23:42:04	6
620	DOT	2020-12-31	9.268	7.236	9.517	7.154	4446072.77	36731355.71	2021-05-09 17:34:36	2021-05-09 17:34:36	4
621	DOT	2021-01-01	8.294	9.268	9.435	8.103	3264947.44	28445476.78	2021-05-09 17:34:36	2021-05-09 17:34:36	4
622	DOT	2021-01-02	9.218	8.294	9.831	7.918	4307596.99	38331200.26	2021-05-09 17:34:36	2021-05-09 17:34:36	4
623	DOT	2021-01-03	10.15	9.218	10.5	8.854	3734346.74	35777130.35	2021-05-09 17:34:36	2021-05-09 17:34:36	4
624	DOT	2021-01-04	9.513	10.15	10.53	8.722	3301504.16	31811034.74	2021-05-09 17:34:36	2021-05-09 17:34:36	4
625	DOT	2021-01-05	9.743	9.513	10.08	9.04	1982150.57	19151881.65	2021-05-09 17:34:36	2021-05-09 17:34:36	4
2302	OCN	2020-08-05	0.0004332	0.000421	0.0004733	0.0004172	59471647.65	25763.69	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2303	OCN	2020-08-06	0.0006242	0.0004332	0.0006835	0.0004148	230370420.33	143799.66	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2304	OCN	2020-08-07	0.0004745	0.0006242	0.0006263	0.0004669	184875089.18	87716.3	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2305	OCN	2020-08-08	0.0005606	0.0004745	0.0005924	0.000493	76243767.21	42739.18	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2306	OCN	2020-08-09	0.0004879	0.0005606	0.0005503	0.0004879	38170457.62	18621.46	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2307	OCN	2020-08-10	0.0005146	0.0004879	0.0005344	0.0004671	39658646.4	20408.02	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2308	OCN	2020-08-11	0.000485	0.0005146	0.0005381	0.0004623	57686988.36	27980.68	2021-05-09 17:34:37	2021-05-09 17:34:37	2
363966	ETH	2021-09-29	2850.87	2807.44	2949.74	2784.02	354249.16	1015388802.44	2021-09-30 23:07:47	2021-09-30 23:07:47	10
385648	ANT	2021-11-11	5.017	4.821	5.085	4.751	164879.1	827219.87	2021-11-12 23:17:40	2021-11-12 23:17:40	14
380888	XTZ	2021-11-02	6.266	6.244	6.363	6.138	4622973.39	28919985.81	2021-11-03 22:15:37	2021-11-03 22:15:37	5
4566	EOS	2020-10-12	2.647	2.66	2.686	2.613	1197156.52	3178916.73	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4567	EOS	2020-10-13	2.64	2.647	2.664	2.613	354521.59	936244.99	2021-05-09 17:34:36	2021-05-09 17:34:36	9
10980	ATOM	2020-12-16	5.491	5.29	5.512	5.159	906844.26	4890596.8	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10981	ATOM	2020-12-17	5.363	5.491	5.731	5.276	789165.42	4359566.43	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10982	ATOM	2020-12-18	5.331	5.363	5.447	5.213	493361.17	2629533.11	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10983	ATOM	2020-12-19	5.293	5.331	5.439	5.26	631502.75	3381744.79	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10984	ATOM	2020-12-20	5.033	5.293	5.351	4.912	596132.63	3077462.8	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10985	ATOM	2020-12-21	5.035	5.033	5.152	4.804	703548.38	3509452.54	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10986	ATOM	2020-12-22	4.945	5.035	5.103	4.731	581858.97	2869173.95	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10987	ATOM	2020-12-23	4.396	4.945	4.999	4.242	1047421.41	4842176.27	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10988	ATOM	2020-12-24	4.958	4.396	4.998	4.227	787096.28	3662645.46	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10994	ATOM	2020-12-30	5.434	5.623	5.772	5.387	1592910.54	8908216.6	2021-05-09 17:34:36	2021-05-09 17:34:36	3
10995	ATOM	2020-12-31	6.483	5.434	6.506	5.247	2671193.64	15901131.68	2021-05-09 17:34:36	2021-05-09 17:34:36	3
4432	EOS	2020-05-31	2.675	2.772	2.772	2.65	1635305.46	4453498.37	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4433	EOS	2020-06-01	2.821	2.675	2.836	2.665	1039655.48	2842011.68	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4434	EOS	2020-06-02	2.677	2.821	2.896	2.62	2662968.73	7327600.83	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4435	EOS	2020-06-03	2.695	2.677	2.705	2.635	1192327.95	3179748.13	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4436	EOS	2020-06-04	2.722	2.695	2.748	2.671	1117137.04	3040492.29	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4437	EOS	2020-06-05	2.815	2.722	2.866	2.711	1729136.22	4830823.14	2021-05-09 17:34:36	2021-05-09 17:34:36	9
347572	DOT	2021-08-26	23.95	25.98	26.38	23.28	3451088.68	84793844.7	2021-08-27 23:59:59	2021-08-27 23:59:59	4
342412	EOS	2021-08-15	5.701	5.49	5.707	5.128	5146896.12	27817755.69	2021-08-16 23:57:26	2021-08-16 23:57:26	9
4438	EOS	2020-06-06	2.798	2.815	2.843	2.775	1078556.54	3031344.81	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4439	EOS	2020-06-07	2.811	2.798	2.826	2.733	929431.1	2582482.19	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4440	EOS	2020-06-08	2.787	2.811	2.819	2.755	689513.22	1915504.16	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4441	EOS	2020-06-09	2.753	2.787	2.801	2.69	1383550.18	3798850.94	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4442	EOS	2020-06-10	2.761	2.753	2.782	2.733	848257.89	2335379.26	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4544	EOS	2020-09-20	2.672	2.706	2.706	2.627	506441.49	1350386.19	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4545	EOS	2020-09-21	2.507	2.672	2.69	2.503	1009567.43	2587752.57	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4546	EOS	2020-09-22	2.574	2.507	2.587	2.496	523612.57	1332812.43	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4547	EOS	2020-09-23	2.442	2.574	2.58	2.393	1004757.56	2493401.11	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4548	EOS	2020-09-24	2.535	2.441	2.671	2.518	3102169.99	7864146.11	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4549	EOS	2020-09-25	2.548	2.535	2.563	2.467	1081876.61	2729647.59	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4568	EOS	2020-10-14	2.611	2.64	2.653	2.586	580323.53	1516207.85	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4569	EOS	2020-10-15	2.599	2.611	2.631	2.585	963505.22	2508049.68	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4570	EOS	2020-10-16	2.538	2.599	2.612	2.496	1232342.26	3152311.92	2021-05-09 17:34:36	2021-05-09 17:34:36	9
374230	ATOM	2021-10-20	35.92	35.02	36.89	33.52	2301988.69	80987425.01	2021-10-21 23:12:39	2021-10-21 23:12:39	3
322530	ANT	2021-07-03	3.708	3.671	3.808	3.631	1182725.32	4385067.19	2021-07-04 23:47:35	2021-07-04 23:47:35	14
336358	DOT	2021-08-02	18.01	18.42	18.86	17.57	3351916.58	61160358.06	2021-08-03 23:54:27	2021-08-03 23:54:27	4
381414	BTC	2021-11-03	62929.93	63260.05	63553.52	61057.89	29618.09	1852233940.61	2021-11-04 23:15:50	2021-11-04 23:15:50	7
311250	OCN	2021-06-09	0.0008876	0.0007779	0.0009398	0.0007832	69792584.57	61949.13	2021-06-10 22:42:04	2021-06-10 22:42:04	2
380890	ATOM	2021-11-02	37.06	37.33	38.39	36.32	2335575.75	87182115.18	2021-11-03 23:15:37	2021-11-03 23:15:37	3
358278	OCN	2021-09-17	0.0009177	0.000928	0.0009517	0.0008497	13609566.91	12489.25	2021-09-18 23:05:00	2021-09-18 23:05:00	2
363964	ZRX	2021-09-29	0.8334	0.8159	0.8665	0.8113	4612280.54	3874956.62	2021-09-30 23:07:47	2021-09-30 23:07:47	6
363494	XTZ	2021-09-28	5.469	6.04	6.268	5.432	15491055.4	90790957.47	2021-09-29 23:07:32	2021-09-29 23:07:32	5
369240	XTZ	2021-10-10	6.974	7.622	8.093	6.935	8758699.09	66112485.49	2021-10-11 23:10:20	2021-10-11 23:10:20	5
353422	XTZ	2021-09-07	4.404	5.595	5.712	3.934	18039910.53	86280511.34	2021-09-08 23:02:43	2021-09-08 23:02:43	5
385650	OCN	2021-11-11	0.0006482	0.0006493	0.0006482	0.0006482	8174439.73	5298.74	2021-11-12 23:22:51	2021-11-12 23:22:51	2
374232	ETH	2021-10-20	4162.49	3877.45	4168.74	3829.95	427521.45	1719887383.03	2021-10-21 23:12:39	2021-10-21 23:12:39	10
311252	EOS	2021-06-09	5.34	5.055	5.4	4.778	7684594.81	39169582.47	2021-06-10 23:42:04	2021-06-10 23:42:04	9
369242	ZRX	2021-10-10	1.045	1.117	1.128	1.033	6477647.94	7029736.33	2021-10-11 23:10:20	2021-10-11 23:10:20	6
386144	ZRX	2021-11-12	1.325	1.314	1.43	1.24	19073957.11	25589874.99	2021-11-13 23:17:54	2021-11-13 23:17:54	6
363496	ETH	2021-09-28	2807.44	2927.73	2970.52	2791.15	413892.02	1193298638.31	2021-09-29 23:07:32	2021-09-29 23:07:32	10
322576	OCN	2021-07-03	0.0008463	0.0004742	0.0009354	0.00049	37846378.93	32030.47	2021-07-04 23:47:35	2021-07-04 23:47:35	2
322532	DOT	2021-07-03	15.52	15.31	15.74	15.04	494434.97	7647823.6	2021-07-04 23:47:36	2021-07-04 23:47:36	4
336360	OCN	2021-08-02	0.0009651	0.0008692	0.0009912	0.0008347	18037993.08	17408.88	2021-08-03 21:54:26	2021-08-03 21:54:26	2
342414	BTC	2021-08-15	47015.94	47102.03	47390.93	45595.22	18032.86	836663894.85	2021-08-16 23:57:25	2021-08-16 23:57:25	7
358736	DOT	2021-09-18	34.88	33.02	35.89	32.54	3784197.75	131402256.85	2021-09-19 23:05:14	2021-09-19 23:05:14	4
353424	DOT	2021-09-07	27.9	34.35	35.66	23.63	11890755.01	354088163.31	2021-09-08 23:02:43	2021-09-08 23:02:43	4
386660	BTC	2021-11-13	64409.56	64156.3	64967.34	63406.98	12719.98	815997863.99	2021-11-14 23:18:07	2021-11-14 23:18:07	7
381428	ANT	2021-11-03	5.051	4.823	5.056	4.769	311963.87	1575849.76	2021-11-04 23:15:51	2021-11-04 23:15:51	14
381406	EOS	2021-11-03	4.708	4.7	4.874	4.523	7481819.32	35049352.31	2021-11-04 23:15:51	2021-11-04 23:15:51	9
380892	FIL	2021-11-02	64.62	63.88	66.43	63.47	503727.28	32724937.81	2021-11-03 23:15:37	2021-11-03 23:15:37	13
347602	SJCX	2021-08-26	0.001874	0.00196	0.001874	0.001874	0	0	2021-08-27 23:59:59	2021-08-27 23:59:59	11
347574	XTZ	2021-08-26	4.438	5.101	5.113	4.314	20209343.81	93902308.98	2021-08-27 23:59:59	2021-08-27 23:59:59	5
11073	ATOM	2021-03-19	22.19	22.11	23.16	21.48	1453677.84	32600400.02	2021-05-09 17:34:36	2021-05-09 17:34:36	3
11074	ATOM	2021-03-20	20.89	22.19	22.71	20.73	1121083.02	24625231.1	2021-05-09 17:34:36	2021-05-09 17:34:36	3
11075	ATOM	2021-03-21	20.52	20.89	21.26	19.95	992400.48	20547888.25	2021-05-09 17:34:36	2021-05-09 17:34:36	3
11076	ATOM	2021-03-22	19.21	20.52	21.2	18.96	1116791.59	22499433.99	2021-05-09 17:34:36	2021-05-09 17:34:36	3
11077	ATOM	2021-03-23	18.73	19.21	19.87	18.71	1066552.25	20568091.74	2021-05-09 17:34:36	2021-05-09 17:34:36	3
11078	ATOM	2021-03-24	17.45	18.73	19.78	16.5	1258071.32	23037700.2	2021-05-09 17:34:36	2021-05-09 17:34:36	3
11079	ATOM	2021-03-25	17.12	17.45	17.99	16.67	1554839.31	26900437.64	2021-05-09 17:34:36	2021-05-09 17:34:36	3
11080	ATOM	2021-03-26	18.95	17.12	18.98	17.06	1090257.28	19677712.45	2021-05-09 17:34:36	2021-05-09 17:34:36	3
11103	ATOM	2021-04-18	21.46	24.4	24.76	17.75	3728807.35	78683945.89	2021-05-09 17:34:36	2021-05-09 17:34:36	3
11104	ATOM	2021-04-19	19.28	21.46	22.27	18.92	1896637.81	38647289.03	2021-05-09 17:34:36	2021-05-09 17:34:36	3
11105	ATOM	2021-04-20	21.3	19.28	21.61	17.7	2963773.61	57595385.79	2021-05-09 17:34:36	2021-05-09 17:34:36	3
7734	ATOM	2021-04-23	20.51	18.78	20.54	16.63	2932114.47	54212834.22	2021-05-09 17:34:36	2021-05-09 17:34:36	3
4716	EOS	2021-03-11	3.955	3.994	4.047	3.816	4827589.13	19041814.46	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4727	EOS	2021-03-22	4.079	4.156	4.348	4.002	6294179.01	26343436.31	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4728	EOS	2021-03-23	4.09	4.079	4.266	4.04	4272070.77	17663559.68	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4729	EOS	2021-03-24	3.695	4.09	4.304	3.457	10422220.21	40300309.49	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4730	EOS	2021-03-25	3.678	3.695	3.781	3.532	6565741.66	24143139.58	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4731	EOS	2021-03-26	4.185	3.678	4.187	3.676	7307063.96	29247819.69	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4732	EOS	2021-03-27	4.092	4.185	4.199	3.982	3030707.49	12403336.15	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4733	EOS	2021-03-28	4.113	4.092	4.212	4.035	3456140.91	14280445.85	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4734	EOS	2021-03-29	4.28	4.113	4.314	4.066	6015362.37	25499433.96	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4735	EOS	2021-03-30	4.338	4.28	4.409	4.209	4046463.15	17430632.44	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4736	EOS	2021-03-31	4.804	4.338	4.903	4.072	13907369.21	62009894.41	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4737	EOS	2021-04-01	5.591	4.804	5.971	4.71	24339467.3	130099374.68	2021-05-09 17:34:36	2021-05-09 17:34:36	9
311284	ETH	2021-06-09	2610.64	2509.23	2626.22	2407.88	719386.66	1819177646.94	2021-06-10 23:42:04	2021-06-10 23:42:04	10
374234	DOT	2021-10-20	44.41	41.36	45.2	41.1	4159150.68	180132380.39	2021-10-21 22:12:39	2021-10-21 22:12:39	4
359212	FIL	2021-09-19	83.48	84.31	85.16	81.59	199151.28	16637093.92	2021-09-20 23:05:28	2021-09-20 23:05:28	13
363968	ATOM	2021-09-29	33.85	33.69	36.61	32.61	3289411.57	113645020.42	2021-09-30 23:07:47	2021-09-30 23:07:47	3
363498	FIL	2021-09-28	55.3	59.03	59.57	55.1	617757.29	35358890.54	2021-09-29 23:07:32	2021-09-29 23:07:32	13
4466	EOS	2020-07-04	2.461	2.419	2.495	2.416	907041.86	2234967.79	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4467	EOS	2020-07-05	2.411	2.461	2.472	2.33	736179.9	1771294.72	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4468	EOS	2020-07-06	2.615	2.411	2.639	2.403	2885119.55	7330681.93	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4469	EOS	2020-07-07	2.557	2.615	2.628	2.526	1056006.4	2710269.46	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4470	EOS	2020-07-08	2.683	2.557	2.704	2.544	2039449.81	5406640.18	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4472	EOS	2020-07-10	2.624	2.651	2.651	2.575	842753.99	2202566.29	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4473	EOS	2020-07-11	2.621	2.624	2.639	2.593	391922.4	1026056.91	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4474	EOS	2020-07-12	2.618	2.621	2.656	2.573	1178775.78	3081128.65	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4475	EOS	2020-07-13	2.554	2.618	2.647	2.457	2113490.24	5445869.1	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4476	EOS	2020-07-14	2.56	2.554	2.575	2.506	740951.15	1886095.52	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4477	EOS	2020-07-15	2.539	2.56	2.567	2.499	918837.75	2330737.48	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4478	EOS	2020-07-16	2.501	2.539	2.572	2.441	1243052.76	3090675.05	2021-05-09 17:34:36	2021-05-09 17:34:36	9
336362	EOS	2021-08-02	4.028	3.942	4.157	3.894	3242234.11	13096858.17	2021-08-03 23:54:27	2021-08-03 23:54:27	9
353426	ATOM	2021-09-07	21.01	25.12	27.42	17.66	1711073.06	39019736.14	2021-09-08 23:02:43	2021-09-08 23:02:43	3
380894	EOS	2021-11-02	4.7	4.642	4.794	4.582	3840780.2	18065784.92	2021-11-03 22:15:37	2021-11-03 22:15:37	9
342416	ETH	2021-08-15	3311.12	3266.71	3323.3	3115.33	311469.23	999629719.78	2021-08-16 23:57:26	2021-08-16 23:57:26	10
4479	EOS	2020-07-17	2.497	2.501	2.52	2.476	430595.95	1075629.14	2021-05-09 17:34:36	2021-05-09 17:34:36	9
322534	ETH	2021-07-03	2227.18	2155.65	2238.77	2113.24	233568.59	511756918.09	2021-07-04 23:47:35	2021-07-04 23:47:35	10
4738	EOS	2021-04-02	6.254	5.591	6.35	5.369	18373932.59	107978389.11	2021-05-09 17:34:36	2021-05-09 17:34:36	9
386664	ZRX	2021-11-13	1.299	1.325	1.335	1.277	6140258.03	7995307.59	2021-11-14 23:18:08	2021-11-14 23:18:08	6
369244	OCN	2021-10-10	0.000547	0.0005497	0.000547	0.000547	103958183.17	56865.38	2021-10-11 23:10:20	2021-10-11 23:10:20	2
347576	OCN	2021-08-26	0.001083	0.00113	0.001176	0.001083	7478358.75	8097.32	2021-08-27 23:59:59	2021-08-27 23:59:59	2
358738	ATOM	2021-09-18	40.71	33.43	41.42	32.72	2337035.6	88542938.67	2021-09-19 23:05:14	2021-09-19 23:05:14	3
386146	BTC	2021-11-12	64156.3	64820.8	65466	62315.02	32742.19	2090846686	2021-11-13 23:17:53	2021-11-13 23:17:53	7
374264	EOS	2021-10-20	4.827	4.461	4.888	4.446	6334993.22	29659334.73	2021-10-21 22:12:38	2021-10-21 22:12:38	9
2966	BCH	2020-05-29	238.25	240.07	240.14	235.62	196976.22	46930449.85	2021-05-09 17:34:36	2021-05-09 17:34:36	8
2967	BCH	2020-05-30	252.58	238.25	253.55	244.53	212620.97	53704287.51	2021-05-09 17:34:36	2021-05-09 17:34:36	8
2968	BCH	2020-05-31	238.72	252.58	247.22	237.96	245847.54	58688447.48	2021-05-09 17:34:36	2021-05-09 17:34:36	8
2969	BCH	2020-06-01	253.54	238.72	261.2	251.91	234095.45	59353693.63	2021-05-09 17:34:36	2021-05-09 17:34:36	8
2970	BCH	2020-06-02	251.05	253.54	252.86	236.09	497449.79	124882804.85	2021-05-09 17:34:36	2021-05-09 17:34:36	8
2971	BCH	2020-06-03	253.15	251.05	255.67	251.41	208509.12	52784940.99	2021-05-09 17:34:36	2021-05-09 17:34:36	8
2972	BCH	2020-06-04	256.32	253.15	263.67	253.19	158560.7	40642813.53	2021-05-09 17:34:36	2021-05-09 17:34:36	8
2973	BCH	2020-06-05	256.04	256.32	257.39	250.94	140545.61	35985572.36	2021-05-09 17:34:36	2021-05-09 17:34:36	8
2978	BCH	2020-06-10	257.29	254.27	261.74	254.91	121106.26	31159037.06	2021-05-09 17:34:36	2021-05-09 17:34:36	8
2979	BCH	2020-06-11	234.55	257.1	258.21	231.23	73054.35	17841648.54	2021-05-09 17:34:36	2021-05-09 17:34:36	8
2980	BCH	2020-06-12	240.86	234.48	242.57	238.59	100687.47	24252052.57	2021-05-09 17:34:36	2021-05-09 17:34:36	8
2981	BCH	2020-06-13	240.85	240.86	242.27	239.33	78676.59	18948910.76	2021-05-09 17:34:36	2021-05-09 17:34:36	8
2982	BCH	2020-06-14	237.26	240.85	237.73	235.12	84166.48	19969562.42	2021-05-09 17:34:36	2021-05-09 17:34:36	8
2983	BCH	2020-06-15	235.74	237.26	240.64	233.95	145495.9	34299385.34	2021-05-09 17:34:36	2021-05-09 17:34:36	8
2984	BCH	2020-06-16	237.5	235.74	239.02	235.79	123319.12	29288368.81	2021-05-09 17:34:36	2021-05-09 17:34:36	8
2985	BCH	2020-06-17	240.26	237.5	241.59	235.34	142150.98	34153464.83	2021-05-09 17:34:36	2021-05-09 17:34:36	8
2986	BCH	2020-06-18	235.92	240.26	239.02	234.52	100114.47	23619391.25	2021-05-09 17:34:36	2021-05-09 17:34:36	8
2987	BCH	2020-06-19	233.29	235.92	234.41	231.62	140835.03	32855389.56	2021-05-09 17:34:36	2021-05-09 17:34:36	8
2988	BCH	2020-06-20	232.76	233.29	235.94	231.55	96244.43	22402123.65	2021-05-09 17:34:36	2021-05-09 17:34:36	8
2989	BCH	2020-06-21	230.28	232.76	231.67	229.9	61765.47	14223094.98	2021-05-09 17:34:36	2021-05-09 17:34:36	8
2990	BCH	2020-06-22	241.22	230.28	245.59	239.77	128775.84	31063845.49	2021-05-09 17:34:36	2021-05-09 17:34:36	8
386666	BCH	2021-11-13	665.99	668.51	670.53	655.99	34696.08	23039239.75	2021-11-14 23:18:07	2021-11-14 23:18:07	8
347600	ANT	2021-08-26	4.64	5.172	5.172	4.626	82565.58	398177.52	2021-08-27 23:59:59	2021-08-27 23:59:59	14
347578	ATOM	2021-08-26	17.96	20.02	20.3	17.74	509014.84	9484413.64	2021-08-27 23:59:59	2021-08-27 23:59:59	3
322536	FIL	2021-07-03	58.84	57.18	59.89	56.66	102968.12	6007359.52	2021-07-04 23:47:35	2021-07-04 23:47:35	13
386148	ETH	2021-11-12	4668.7	4722.68	4807.7	4510.48	326957.09	1521700733.37	2021-11-13 23:17:54	2021-11-13 23:17:54	10
311290	SJCX	2021-06-09	0.001496	0.001336	0.001496	0.001496	0	0	2021-06-10 23:42:04	2021-06-10 23:42:04	11
381404	ETH	2021-11-03	4604.4	4593.15	4669.63	4457.12	402513.51	1842855559.04	2021-11-04 23:15:50	2021-11-04 23:15:50	10
336378	FIL	2021-08-02	54.46	53.9	55.95	53.14	354655.41	19390078.43	2021-08-03 21:54:26	2021-08-03 21:54:26	13
336364	ETH	2021-08-02	2608.44	2556.41	2666.13	2507.76	490026.06	1270507490.79	2021-08-03 23:54:27	2021-08-03 23:54:27	10
374236	XTZ	2021-10-20	7.014	6.746	7.127	6.573	6753492.98	46481427.85	2021-10-21 23:12:39	2021-10-21 23:12:39	5
363970	BCH	2021-09-29	485.14	474.59	498.06	471.94	66825.66	32420596.81	2021-09-30 23:07:47	2021-09-30 23:07:47	8
4743	EOS	2021-04-07	5.888	6.64	7.045	5.729	20060313.72	125569421.3	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4744	EOS	2021-04-08	6.445	5.888	6.466	5.809	8386069.35	51831306.64	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4745	EOS	2021-04-09	6.201	6.445	6.596	6.075	6849478.97	43229332.59	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4746	EOS	2021-04-10	6.618	6.201	6.755	6.154	8738781.2	56330079.99	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4747	EOS	2021-04-11	6.727	6.618	7.056	6.554	8248360.35	56094391.92	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4748	EOS	2021-04-12	6.474	6.727	6.862	6.292	7354958.4	48240830.54	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4749	EOS	2021-04-13	7.386	6.474	7.532	6.421	13189830.91	93818304.4	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4750	EOS	2021-04-14	7.662	7.386	8.064	7.043	19538245.57	148814802.47	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4751	EOS	2021-04-15	7.884	7.662	7.92	7.285	7467471.26	56932732.48	2021-05-09 17:34:36	2021-05-09 17:34:36	9
374268	OCN	2021-10-20	0.0006602	0.0006428	0.0006602	0.0006602	80156948.63	52920.44	2021-10-21 23:12:44	2021-10-21 23:12:44	2
353428	BTC	2021-09-07	46856.31	52693.32	52919.24	43904.42	83874.09	4055873734.71	2021-09-08 23:02:42	2021-09-08 23:02:42	7
353460	BCH	2021-09-07	672.52	784.96	787.93	586.38	210883.85	145562154.93	2021-09-08 23:02:43	2021-09-08 23:02:43	8
358740	BCH	2021-09-18	630.83	621.3	638.27	615.08	50130	31543850.33	2021-09-19 23:05:14	2021-09-19 23:05:14	8
342418	FIL	2021-08-15	73.13	72.51	74.48	70.19	454978.22	32776542.89	2021-08-16 21:57:25	2021-08-16 21:57:25	13
359198	ETH	2021-09-19	3328.85	3435.76	3456.34	3282.08	202593.78	681616160.46	2021-09-20 23:05:28	2021-09-20 23:05:28	10
380918	ZRX	2021-11-02	1.314	1.243	1.446	1.231	35530772.96	46917048.69	2021-11-03 23:15:37	2021-11-03 23:15:37	6
380900	DOT	2021-11-02	51.68	50.03	53.36	48.1	6414551.7	327353040.92	2021-11-03 23:15:37	2021-11-03 23:15:37	4
369246	DOT	2021-10-10	34.44	36.33	37.46	34.13	3398729.61	122231307.01	2021-10-11 23:10:20	2021-10-11 23:10:20	4
4752	EOS	2021-04-16	8.505	7.884	8.73	7.081	26696375.75	213772720.64	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4753	EOS	2021-04-17	7.792	8.505	8.834	7.6	13567073.13	111461106.61	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4754	EOS	2021-04-18	7.292	7.792	7.929	5.887	24067170.93	162775581.85	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4755	EOS	2021-04-19	6.602	7.292	7.5	6.497	12486157.89	86290299.45	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4756	EOS	2021-04-20	6.698	6.602	6.854	6.072	9727655.77	62734712.56	2021-05-09 17:34:36	2021-05-09 17:34:36	9
369248	ETH	2021-10-10	3416.49	3576.4	3604.88	3409.77	194957.07	685931826.8	2021-10-11 23:10:20	2021-10-11 23:10:20	10
358742	XTZ	2021-09-18	6.405	6.109	6.727	5.909	13986599.11	88996214.41	2021-09-19 23:05:14	2021-09-19 23:05:14	5
347580	EOS	2021-08-26	4.739	5.213	5.273	4.654	7159116.43	35048669.04	2021-08-27 23:59:59	2021-08-27 23:59:59	9
322538	ZRX	2021-07-03	0.7032	0.692	0.7141	0.6682	3439139.12	2381216.14	2021-07-04 23:47:35	2021-07-04 23:47:35	6
363972	EOS	2021-09-29	3.748	3.685	3.869	3.639	3129521.5	11796515.36	2021-09-30 23:07:47	2021-09-30 23:07:47	9
359200	ATOM	2021-09-19	44.24	40.71	44.54	37.81	1826444.9	74901408.33	2021-09-20 20:05:26	2021-09-20 20:05:26	3
386150	DOT	2021-11-12	45.93	47.49	47.73	44.08	3922340.56	179922626.34	2021-11-13 23:17:54	2021-11-13 23:17:54	4
380902	OCN	2021-11-02	0.0006326	0.0006096	0.0006326	0.0006326	68333359.28	43227.72	2021-11-03 23:19:01	2021-11-03 23:19:01	2
342420	XTZ	2021-08-15	3.739	3.699	3.761	3.555	2978942.62	10916161.33	2021-08-16 23:57:26	2021-08-16 23:57:26	5
374238	BTC	2021-10-20	66021.02	64283.97	66980.66	63543.7	45364.94	2978059285.56	2021-10-21 23:12:39	2021-10-21 23:12:39	7
353430	EOS	2021-09-07	4.881	6.223	6.256	4.366	32603055.52	173687926.73	2021-09-08 23:02:43	2021-09-08 23:02:43	9
336366	SJCX	2021-08-02	0.001566	0.001595	0.001566	0.001566	0	0	2021-08-03 23:54:27	2021-08-03 23:54:27	11
336440	ANT	2021-08-02	3.818	3.866	3.876	3.76	512865.52	1958098.34	2021-08-03 23:54:27	2021-08-03 23:54:27	14
386674	FIL	2021-11-13	62.93	62.9	63.66	62.24	175805.71	11057157.95	2021-11-14 23:18:07	2021-11-14 23:18:07	13
381408	ATOM	2021-11-03	38.48	37.06	38.61	35.56	4038257	148944633.65	2021-11-04 23:15:53	2021-11-04 23:15:53	3
386152	BCH	2021-11-12	668.51	676.65	684.24	647.1	84853.5	56587025.91	2021-11-13 23:17:54	2021-11-13 23:17:54	8
363974	OCN	2021-09-29	0.0004154	0.0004106	0.0004154	0.0004154	56495211.71	23467.79	2021-09-30 23:07:47	2021-09-30 23:07:47	2
322540	EOS	2021-07-03	4.052	3.925	4.063	3.855	1163432.95	4629153.36	2021-07-04 22:47:35	2021-07-04 22:47:35	9
336812	ETH	2021-08-03	2508.21	2608.44	2632.24	2447.32	478917.91	1201033361.49	2021-08-04 23:54:41	2021-08-04 23:54:41	10
347582	BCH	2021-08-26	606.35	650.82	656.33	605.25	69640.25	43267664.08	2021-08-27 23:59:59	2021-08-27 23:59:59	8
381402	FIL	2021-11-03	64.02	64.62	65.92	61.55	475494.85	30390252.18	2021-11-04 23:15:51	2021-11-04 23:15:51	13
342422	ATOM	2021-08-15	15.92	15.56	15.96	14.9	967478.47	14909936.13	2021-08-16 23:57:26	2021-08-16 23:57:26	3
374240	BCH	2021-10-20	644.56	618.54	648.62	605.48	74374.38	46918764.84	2021-10-21 23:12:39	2021-10-21 23:12:39	8
358744	OCN	2021-09-18	0.0009277	0.0009177	0.000962	0.0008933	12223598.36	11339.28	2021-09-19 23:05:14	2021-09-19 23:05:14	2
353432	ZRX	2021-09-07	1.015	1.291	1.291	0.9159	22363778.75	24433240.46	2021-09-08 23:02:43	2021-09-08 23:02:43	6
369250	ATOM	2021-10-10	32.42	35.17	35.19	32.13	1547588.94	52387472.87	2021-10-11 23:10:20	2021-10-11 23:10:20	3
363992	BTC	2021-09-29	41539.43	41056.79	42603.18	40790.67	26354.27	1100252801.68	2021-09-30 23:07:47	2021-09-30 23:07:47	7
359206	BCH	2021-09-19	609.1	630.83	647.13	603.16	68772.82	42894271.3	2021-09-20 22:05:27	2021-09-20 22:05:27	8
322542	ATOM	2021-07-03	11.8	11.8	12.19	11.54	662881.06	7850471.77	2021-07-04 23:47:35	2021-07-04 23:47:35	3
386676	SJCX	2021-11-13	0.002576	0.002566	0.002576	0.002576	0	0	2021-11-14 23:18:08	2021-11-14 23:18:08	11
353434	ETH	2021-09-07	3433.48	3928.4	3947.45	3170.57	1057330.56	3755934253.91	2021-09-08 23:02:42	2021-09-08 23:02:42	10
342424	ANT	2021-08-15	5.068	5.167	5.167	4.96	323248.17	1638324.63	2021-08-16 21:57:25	2021-08-16 21:57:25	14
336814	XTZ	2021-08-03	3.052	3.129	3.202	2.975	3546375.34	10845626.97	2021-08-04 23:54:41	2021-08-04 23:54:41	5
336842	OCN	2021-08-03	0.0008528	0.0009651	0.0009782	0.0008277	18837533.09	16064.49	2021-08-04 23:54:41	2021-08-04 23:54:41	2
347638	ETH	2021-08-26	3093.62	3228.86	3251.2	3059.7	294003.64	917871423.67	2021-08-27 23:59:58	2021-08-27 23:59:58	10
347598	FIL	2021-08-26	72.29	76.51	78.75	71.46	428599.14	31957755.07	2021-08-27 23:59:59	2021-08-27 23:59:59	13
381412	DOT	2021-11-03	53.36	51.68	54.59	49.13	5505864	285796547.2	2021-11-04 23:15:51	2021-11-04 23:15:51	4
374242	SJCX	2021-10-20	0.002641	0.002571	0.002641	0.002641	0	0	2021-10-21 23:12:39	2021-10-21 23:12:39	11
358746	BTC	2021-09-18	48312.46	47297.98	48808	47066.47	15782.18	761079785.11	2021-09-19 22:05:14	2021-09-19 22:05:14	7
358766	ZRX	2021-09-18	1.115	1.082	1.133	1.059	6473110.96	7139266.96	2021-09-19 22:05:14	2021-09-19 22:05:14	6
386154	ANT	2021-11-12	5.702	5.017	5.784	4.936	668455.3	3811244.94	2021-11-13 23:17:53	2021-11-13 23:17:53	14
369252	BTC	2021-10-10	54700.24	54968.04	56473.63	54131.52	23094.98	1276001425.96	2021-10-11 23:10:20	2021-10-11 23:10:20	7
3256	BCH	2021-03-15	523.68	552.85	567.77	515.24	126376.57	67487906.47	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3257	BCH	2021-03-16	529.12	523.7	556.39	527.13	249996.04	132277396.68	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3258	BCH	2021-03-17	541.43	529.12	559.11	538.13	145003.55	78509651.84	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3259	BCH	2021-03-18	527.96	541.43	531.07	521.27	162955.68	86033293.39	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3260	BCH	2021-03-19	532.68	528.29	550.61	517.39	62207.52	33268867.77	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3261	BCH	2021-03-20	536.1	532.41	542.49	529.42	171931.75	92172794.14	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3262	BCH	2021-03-21	523.72	536.1	534.05	521.71	152422.56	79826521.13	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3263	BCH	2021-03-22	509.2	523.72	512.45	487.56	275814.67	140444726.17	2021-05-09 17:34:36	2021-05-09 17:34:36	8
348038	ATOM	2021-08-27	20.48	17.96	20.57	17.28	655199.45	12551894.11	2021-08-28 23:00:12	2021-08-28 23:00:12	3
4511	EOS	2020-08-18	3.585	3.781	3.825	3.547	2915093.86	10711025.22	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4512	EOS	2020-08-19	3.351	3.585	3.63	3.222	4516953.98	15325675.43	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4513	EOS	2020-08-20	3.444	3.351	3.463	3.351	2574275.3	8778065.89	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4514	EOS	2020-08-21	3.248	3.444	3.627	3.233	5335787.91	18360020.93	2021-05-09 17:34:36	2021-05-09 17:34:36	9
3264	BCH	2021-03-23	510.51	509.2	531.92	505.13	386776.21	197451725.31	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3265	BCH	2021-03-24	474.18	510.51	497.14	449.6	436923.55	207180050.36	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3266	BCH	2021-03-25	473.22	474.22	482.54	451.58	100190.8	47050279.09	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3267	BCH	2021-03-26	505.9	473.32	515.04	488.73	210942.84	106716899.57	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3268	BCH	2021-03-27	500.54	505.9	514.62	495.9	275645.54	137971348.68	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3269	BCH	2021-03-28	497.18	500.54	503.42	493.1	284697.27	141544690.37	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3270	BCH	2021-03-29	518.17	497.18	529.7	512.41	231714.93	120068626.93	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3271	BCH	2021-03-30	525.68	518.17	534.09	523.27	203037.16	106733246.77	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3272	BCH	2021-03-31	541.55	525.68	544.43	516.97	428836.77	232236420.63	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3273	BCH	2021-04-01	555.83	541.55	558.06	531.87	452622.17	251580292.98	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3274	BCH	2021-04-02	580.97	555.83	592.83	549.24	287755.7	167177671.38	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3276	BCH	2021-04-04	560.71	531.08	565.6	538.36	175037.48	98145498.27	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3277	BCH	2021-04-05	646.73	560.74	647.03	553.9	162438.07	98189163.41	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3278	BCH	2021-04-06	662.48	647.36	663.64	621.87	479160.95	317433682.23	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3279	BCH	2021-04-07	616.59	662.48	673.66	598.69	416648.41	256901584.61	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3280	BCH	2021-04-08	643.58	616.59	651.13	627.89	266687.58	171633677.13	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3281	BCH	2021-04-09	630.46	643.58	648.47	626.39	182083.32	114796126.57	2021-05-09 17:34:36	2021-05-09 17:34:36	8
348546	DOT	2021-08-28	25.97	26.53	26.73	25.46	2467819.14	64085206.13	2021-08-29 23:00:26	2021-08-29 23:00:26	4
353436	ANT	2021-09-07	5.716	6.85	6.129	5.271	762292.61	4357622.7	2021-09-08 23:02:42	2021-09-08 23:02:42	14
381416	ZRX	2021-11-03	1.237	1.314	1.317	1.187	12475088.93	15484586.59	2021-11-04 23:15:52	2021-11-04 23:15:52	6
342426	OCN	2021-08-15	0.001192	0.001176	0.001225	0.001192	1610654.28	1919.91	2021-08-16 23:57:26	2021-08-16 23:57:26	2
369254	FIL	2021-10-10	69.88	76.96	77.09	69.08	456598.95	33433098.44	2021-10-11 22:10:20	2021-10-11 22:10:20	13
336816	ATOM	2021-08-03	12.12	12.48	12.65	11.79	950558.77	11519701.92	2021-08-04 23:54:40	2021-08-04 23:54:40	3
336860	ANT	2021-08-03	3.699	3.818	3.74	3.644	452047.46	1672130.61	2021-08-04 23:54:41	2021-08-04 23:54:41	14
3282	BCH	2021-04-10	672.58	630.46	680.95	636.11	304888.17	205061380.49	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3283	BCH	2021-04-11	689.78	672.58	713.77	674.78	263444.48	181717462.29	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3284	BCH	2021-04-12	670.87	689.78	688.82	654.11	213021.32	142909819.49	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3285	BCH	2021-04-13	745.54	670.87	751.9	702.32	305312.61	227623059.53	2021-05-09 17:34:36	2021-05-09 17:34:36	8
336898	EOS	2021-08-03	4.023	4.028	4.093	3.871	2513053.25	10044933.15	2021-08-04 23:54:41	2021-08-04 23:54:41	9
359204	ANT	2021-09-19	5.966	6.116	7.013	5.924	90150.71	573708.66	2021-09-20 23:05:28	2021-09-20 23:05:28	14
359252	DOT	2021-09-19	33.84	34.88	34.88	33.06	2574111.75	87368003.11	2021-09-20 23:05:28	2021-09-20 23:05:28	4
363998	FIL	2021-09-29	57.06	55.3	58.51	55.24	442479.94	25284934.02	2021-09-30 23:07:47	2021-09-30 23:07:47	13
322544	SJCX	2021-07-03	0.001387	0.001352	0.001387	0.001387	0	0	2021-07-04 23:47:35	2021-07-04 23:47:35	11
322558	BTC	2021-07-03	34682.84	33804.54	34944.91	33333.05	17319.23	595117204.83	2021-07-04 23:47:35	2021-07-04 23:47:35	7
348060	BCH	2021-08-27	635.97	606.35	636.42	597.37	55268.92	34022449.6	2021-08-28 22:00:12	2021-08-28 22:00:12	8
374244	FIL	2021-10-20	67.11	62.97	68.2	62.53	428909.16	28361198.24	2021-10-21 22:12:39	2021-10-21 22:12:39	13
386156	ATOM	2021-11-12	32.07	32.96	32.96	30.58	2483978.78	79290380.29	2021-11-13 23:17:53	2021-11-13 23:17:53	3
358748	FIL	2021-09-18	84.31	85.79	87.35	82.67	287935.7	24505623.49	2021-09-19 22:05:14	2021-09-19 22:05:14	13
386672	ANT	2021-11-13	5.585	5.718	6.314	5.564	103904.49	616409.95	2021-11-14 22:18:07	2021-11-14 22:18:07	14
2209	OCN	2020-05-04	0.0002918	0.0002878	0.0003021	0.0002752	353190474.44	103055.82	2021-05-04 22:03:21	2021-05-04 22:03:21	2
2210	OCN	2020-05-05	0.0002918	0.0002918	0.0003082	0.0002774	235449630.66	68699.87	2021-05-04 22:03:21	2021-05-04 22:03:21	2
2211	OCN	2020-05-06	0.0002827	0.0002918	0.0002987	0.0002688	249148047.99	70439.63	2021-05-04 22:03:21	2021-05-04 22:03:21	2
2212	OCN	2020-05-07	0.0003079	0.0002827	0.0003547	0.0002782	386342842.04	118969.06	2021-05-07 19:24:30	2021-05-07 19:24:30	2
2213	OCN	2020-05-08	0.0003004	0.0003079	0.0003258	0.0002771	309822464.03	93066.58	2021-05-07 19:24:30	2021-05-07 19:24:30	2
386158	FIL	2021-11-12	62.9	62.81	65.48	61.14	431893.06	27244767.34	2021-11-13 23:17:53	2021-11-13 23:17:53	13
2214	OCN	2020-05-09	0.000292	0.0003004	0.0003194	0.0002794	292477770.1	85414.92	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2208	OCN	2020-05-03	0.0002878	0.0003041	0.0003088	0.0002794	343704873.09	98912.14	2021-05-03 03:13:21	2021-05-03 03:13:21	2
2215	OCN	2020-05-10	0.0002649	0.000292	0.000293	0.0002573	448987053.83	118916.2	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2202	OCN	2020-04-27	0.0003089	0.0003066	0.0003267	0.0002853	360467271.94	111364.42	2021-04-27 14:21:33	2021-04-27 14:21:33	2
2206	OCN	2020-05-01	0.000301	0.000297	0.0003243	0.0002841	263742911.74	79389.68	2021-05-01 22:04:04	2021-05-01 22:04:04	2
2207	OCN	2020-05-02	0.0003041	0.000301	0.0003212	0.0002891	266984955.88	81188.26	2021-05-01 22:04:04	2021-05-01 22:04:04	2
2216	OCN	2020-05-11	0.0002584	0.0002649	0.0002881	0.0002454	448623495.48	115912.29	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2217	OCN	2020-05-12	0.000264	0.0002584	0.0002811	0.0002564	247490442.68	65327.82	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2218	OCN	2020-05-13	0.0002758	0.000264	0.0002938	0.0002678	230677773.9	63619.32	2021-05-09 17:34:37	2021-05-09 17:34:37	2
374704	ETH	2021-10-21	4062.76	4162.49	4373.21	4015.24	585122.78	2439959842.9	2021-10-22 23:12:53	2021-10-22 23:12:53	10
358750	ETH	2021-09-18	3435.76	3398.82	3541.73	3370.5	257719.94	892082275.54	2021-09-19 23:05:14	2021-09-19 23:05:14	10
2203	OCN	2020-04-28	0.0003071	0.0003089	0.0003268	0.0002776	258543595.53	79399.15	2021-04-28 19:33:32	2021-04-28 19:33:32	2
2204	OCN	2020-04-29	0.0003039	0.0003071	0.0003427	0.0002975	481416721.51	146314.82	2021-04-28 19:33:32	2021-04-28 19:33:32	2
2205	OCN	2020-04-30	0.000297	0.0003039	0.0003259	0.0002847	512454512.76	152213.75	2021-04-30 16:57:54	2021-04-30 16:57:54	2
369256	BCH	2021-10-10	585.45	615.14	623.14	582.76	52205.78	31561641.73	2021-10-11 23:10:20	2021-10-11 23:10:20	8
364428	ETH	2021-09-30	3000.83	2850.87	3048.78	2838.28	359598.28	1074045517.68	2021-10-01 23:08:02	2021-10-01 23:08:02	10
322582	BCH	2021-07-03	505.33	495.91	514.69	501.17	113297.6	57252560.51	2021-07-04 22:47:35	2021-07-04 22:47:35	8
336818	FIL	2021-08-03	54.22	54.46	55.06	52.76	251649.62	13558265.21	2021-08-04 23:54:41	2021-08-04 23:54:41	13
348598	XTZ	2021-08-28	5.634	5.242	5.689	5.024	12423277.53	65604299.78	2021-08-29 23:00:26	2021-08-29 23:00:26	5
353438	FIL	2021-09-07	84.34	106.29	110.85	72.96	1558325.23	145102732.51	2021-09-08 23:02:43	2021-09-08 23:02:43	13
381420	OCN	2021-11-03	0.0006293	0.0006326	0.0006293	0.0006293	62965938.82	39624.42	2021-11-04 23:19:23	2021-11-04 23:19:23	2
342428	SJCX	2021-08-15	0.001881	0.001884	0.001881	0.001881	0	0	2021-08-16 21:57:25	2021-08-16 21:57:25	11
348040	XTZ	2021-08-27	5.242	4.438	5.515	4.256	22272544.89	110945366.36	2021-08-28 23:00:12	2021-08-28 23:00:12	5
375208	BCH	2021-10-22	623.95	623.48	637.01	612.55	55055.23	34482381.47	2021-10-23 23:13:07	2021-10-23 23:13:07	8
386678	ATOM	2021-11-13	32.51	32.07	33.16	31.95	1042848.05	33918149.39	2021-11-14 23:18:07	2021-11-14 23:18:07	3
364456	ATOM	2021-09-30	36.22	33.85	36.28	33.48	3693863.04	128204873.5	2021-10-01 23:08:03	2021-10-01 23:08:03	3
358752	ANT	2021-09-18	6.116	5.834	7.015	5.834	75400.7	476713.07	2021-09-19 23:05:14	2021-09-19 23:05:14	14
323026	ANT	2021-07-04	3.766	3.703	3.913	3.628	42494.29	162036.22	2021-07-05 22:47:49	2021-07-05 22:47:49	14
322990	FIL	2021-07-04	58.77	58.84	60.57	58.03	80736.02	4791523.07	2021-07-05 23:47:49	2021-07-05 23:47:49	13
353440	OCN	2021-09-07	0.0009614	0.0011	0.00103	0.000927	3798640.71	3651.92	2021-09-08 23:02:43	2021-09-08 23:02:43	2
353442	SJCX	2021-09-07	0.001874	0.002108	0.001874	0.001874	0	0	2021-09-08 23:02:59	2021-09-08 23:02:59	11
374706	FIL	2021-10-21	63.62	67.11	68.15	63.36	544121.65	35861108.25	2021-10-22 22:12:53	2021-10-22 22:12:53	13
359214	SJCX	2021-09-19	0.00189	0.001932	0.00189	0.00189	0	0	2021-09-20 23:05:28	2021-09-20 23:05:28	11
336820	DOT	2021-08-03	17.38	18.01	18.53	16.83	2436603.09	42686530.36	2021-08-04 23:54:40	2021-08-04 23:54:40	4
336896	ZRX	2021-08-03	0.8576	0.8171	0.8583	0.7764	9215003.27	7582741.61	2021-08-04 23:54:41	2021-08-04 23:54:41	6
348042	OCN	2021-08-27	0.001114	0.001083	0.001147	0.001114	1553086.19	1729.82	2021-08-28 23:00:12	2021-08-28 23:00:12	2
342430	ZRX	2021-08-15	1.063	1.069	1.075	1.007	5672489.22	5892654.02	2021-08-16 23:57:26	2021-08-16 23:57:26	6
369274	EOS	2021-10-10	4.582	4.997	5.016	4.563	5508191.29	26376419.16	2021-10-11 22:10:20	2021-10-11 22:10:20	9
369258	SJCX	2021-10-10	0.002188	0.002199	0.002188	0.002188	0	0	2021-10-11 22:10:20	2021-10-11 22:10:20	11
386160	XTZ	2021-11-12	5.769	5.867	5.993	5.539	4832600.43	27797194.56	2021-11-13 23:17:53	2021-11-13 23:17:53	5
381900	DOT	2021-11-04	53.91	53.36	55.09	52.22	4361981.84	232985507.27	2021-11-05 23:16:04	2021-11-05 23:16:04	4
381922	OCN	2021-11-04	0.0006145	0.0006293	0.0006145	0.0006145	90730312.65	55752.39	2021-11-05 23:19:44	2021-11-05 23:19:44	2
348586	BCH	2021-08-28	646.71	635.2	647.2	626.65	89391.92	57810457.11	2021-08-29 19:00:24	2021-08-29 19:00:24	8
364430	ANT	2021-09-30	4.307	4.27	4.506	4.247	300756.33	1295390.37	2021-10-01 23:08:03	2021-10-01 23:08:03	14
354462	XTZ	2021-09-09	5.578	4.336	5.687	4.264	27307202.7	140619338.09	2021-09-10 23:03:10	2021-09-10 23:03:10	5
364432	XTZ	2021-09-30	6.072	5.637	6.091	5.593	10204895.77	60092116.58	2021-10-01 23:08:02	2021-10-01 23:08:02	5
336822	BTC	2021-08-03	38189.3	39158.53	39779.45	37679.22	38225.1	1466921591.54	2021-08-04 23:54:41	2021-08-04 23:54:41	7
359242	XTZ	2021-09-19	6.521	6.405	6.937	6.115	13931657.47	91317094.35	2021-09-20 20:05:26	2021-09-20 20:05:26	5
386162	EOS	2021-11-12	4.856	4.924	5.104	4.669	7291959.89	35812314.62	2021-11-13 23:17:54	2021-11-13 23:17:54	9
359210	BTC	2021-09-19	47251.76	48312.46	48376.3	46864.5	14044.93	668723282.36	2021-09-20 23:05:28	2021-09-20 23:05:28	7
358754	SJCX	2021-09-18	0.001932	0.001892	0.001932	0.001932	0	0	2021-09-19 22:05:14	2021-09-19 22:05:14	11
348540	ZRX	2021-08-28	1.081	1.111	1.112	1.061	4186566.16	4535048.29	2021-08-29 22:00:26	2021-08-29 22:00:26	6
348584	SJCX	2021-08-28	0.001957	0.001964	0.001957	0.001957	0	0	2021-08-29 22:00:26	2021-08-29 22:00:26	11
322992	BTC	2021-07-04	35287.97	34682.84	35945.36	34390.95	15950.93	563891553.21	2021-07-05 23:47:49	2021-07-05 23:47:49	7
342432	BCH	2021-08-15	703.74	692.25	709.06	673.73	66616.39	46121249.47	2021-08-16 23:57:26	2021-08-16 23:57:26	8
353930	ETH	2021-09-08	3499.69	3433.48	3560.94	3217.86	659844.07	2254428180.74	2021-09-09 22:02:56	2021-09-09 22:02:56	10
386668	DOT	2021-11-13	47.1	45.93	47.54	44.9	2161531.91	100151381.43	2021-11-14 21:18:06	2021-11-14 21:18:06	4
348044	DOT	2021-08-27	26.53	23.95	26.75	23.48	2860015.44	71567194.2	2021-08-28 22:00:12	2021-08-28 22:00:12	4
374726	OCN	2021-10-21	0.0006228	0.0006602	0.001246	0.0006228	222300808.49	138457.75	2021-10-22 23:12:54	2021-10-22 23:12:54	2
374708	BTC	2021-10-21	62283.96	66021.02	66645.73	62076.16	62097.42	3962470063.85	2021-10-22 23:13:03	2021-10-22 23:13:03	7
369296	ANT	2021-10-10	4.606	4.922	5.111	4.594	392203.03	1806607.65	2021-10-11 23:10:20	2021-10-11 23:10:20	14
381902	BTC	2021-11-04	61448.47	62929.93	63102.86	60745.84	23030.57	1420765190.91	2021-11-05 23:16:04	2021-11-05 23:16:04	7
4757	EOS	2021-04-21	6.331	6.698	6.848	6.237	5796429.91	38044328.25	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4758	EOS	2021-04-22	5.859	6.331	6.817	5.614	11268389.82	70716384.31	2021-05-09 17:34:36	2021-05-09 17:34:36	9
7750	EOS	2021-04-23	5.581	5.859	5.991	4.461	19678325.59	101756623.13	2021-05-09 17:34:36	2021-05-09 17:34:36	9
381904	ATOM	2021-11-04	37.53	38.48	39.23	36.16	2139692.8	80592111.58	2021-11-05 23:16:04	2021-11-05 23:16:04	3
370204	FIL	2021-10-12	69.72	73.5	73.53	66.18	499797.37	34714779.01	2021-10-13 22:10:48	2021-10-13 22:10:48	13
348046	ZRX	2021-08-27	1.111	1.048	1.111	1.004	6923294.78	7300450.04	2021-08-28 23:00:12	2021-08-28 23:00:12	6
336824	BCH	2021-08-03	538.32	543.42	551.53	522.42	62984.79	33667125.02	2021-08-04 23:54:40	2021-08-04 23:54:40	8
364434	BTC	2021-09-30	43829.34	41539.43	44106.6	41436.79	33984.98	1469981944.79	2021-10-01 23:08:02	2021-10-01 23:08:02	7
359208	EOS	2021-09-19	4.91	5.468	5.506	4.859	6453279.46	33071053.52	2021-09-20 23:05:28	2021-09-20 23:05:28	9
348536	EOS	2021-08-28	5.006	5.093	5.106	4.882	4111300.67	20500690.35	2021-08-29 23:00:26	2021-08-29 23:00:26	9
322994	DOT	2021-07-04	15.99	15.52	16.57	15.18	563743.47	8990493.3	2021-07-05 23:47:49	2021-07-05 23:47:49	4
353932	BTC	2021-09-08	46073.45	46856.31	47362.35	44475.76	45638.83	2105187289.07	2021-09-09 23:02:56	2021-09-09 23:02:56	7
354466	EOS	2021-09-09	4.813	4.742	4.949	4.659	9387208.85	45256571.19	2021-09-10 23:03:10	2021-09-10 23:03:10	9
354438	OCN	2021-09-09	0.000993	0.00105	0.001027	0.000993	2599079.26	2580.96	2021-09-10 23:03:10	2021-09-10 23:03:10	2
354446	SJCX	2021-09-09	0.001856	0.001843	0.001856	0.001856	0	0	2021-09-10 23:03:13	2021-09-10 23:03:13	11
369710	ZRX	2021-10-11	1.017	1.045	1.076	0.9911	5813706.61	6009822.32	2021-10-12 23:10:34	2021-10-12 23:10:34	6
358760	EOS	2021-09-18	5.468	5.251	5.499	5.105	6243028.76	33263940.18	2021-09-19 23:05:14	2021-09-19 23:05:14	9
374710	XTZ	2021-10-21	6.656	7.014	7.144	6.607	7357962.37	50684333.26	2021-10-22 23:12:53	2021-10-22 23:12:53	5
386164	SJCX	2021-11-12	0.002566	0.002593	0.002566	0.002566	0	0	2021-11-13 23:17:54	2021-11-13 23:17:54	11
386166	OCN	2021-11-12	0.0006416	0.0006482	0.0006416	0.0006416	19496225.91	12508.06	2021-11-13 23:23:11	2021-11-13 23:23:11	2
3307	FIL	2020-05-04	0	0	0	0	0	0	2021-05-03 03:13:20	2021-05-03 03:13:20	13
3308	FIL	2020-05-05	0	0	0	0	0	0	2021-05-03 03:13:20	2021-05-03 03:13:20	13
3309	FIL	2020-05-06	0	0	0	0	0	0	2021-05-03 03:13:20	2021-05-03 03:13:20	13
3290	BCH	2021-04-18	975.46	991.8	1016.34	818.64	403206.53	368898216.82	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3291	BCH	2021-04-19	892	974.76	1014.49	885.87	458620.2	409087091.41	2021-05-09 17:34:36	2021-05-09 17:34:36	8
3292	BCH	2021-04-20	941.77	892.36	973.09	831.47	248377.04	225211437.98	2021-05-09 17:34:36	2021-05-09 17:34:36	8
7766	BCH	2021-04-23	840.51	854.67	873.36	693.19	286887.56	225044037.19	2021-05-09 17:34:36	2021-05-09 17:34:36	8
322996	ETH	2021-07-04	2323.27	2227.18	2387.73	2190.78	297638.95	690333030.43	2021-07-05 22:47:49	2021-07-05 22:47:49	10
323028	SJCX	2021-07-04	0.001412	0.001387	0.001412	0.001412	0	0	2021-07-05 22:47:49	2021-07-05 22:47:49	11
3310	FIL	2020-05-07	0	0	0	0	0	0	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3311	FIL	2020-05-08	0	0	0	0	0	0	2021-05-07 19:24:30	2021-05-07 19:24:30	13
2242	OCN	2020-06-06	0.0003147	0.0003169	0.000322	0.0003123	6370416.35	2004.8	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2243	OCN	2020-06-07	0.0003304	0.0003147	0.0003696	0.0003133	52533041.55	17357.57	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2244	OCN	2020-06-08	0.0003352	0.0003304	0.0003451	0.0003278	11975493.94	4014.18	2021-05-09 17:34:37	2021-05-09 17:34:37	2
2245	OCN	2020-06-09	0.0003318	0.0003352	0.0003367	0.0003172	13950580.52	4629.36	2021-05-09 17:34:37	2021-05-09 17:34:37	2
336826	SJCX	2021-08-03	0.001528	0.001566	0.001528	0.001528	0	0	2021-08-04 23:54:41	2021-08-04 23:54:41	11
369712	XTZ	2021-10-11	6.902	6.974	7.389	6.645	8545387.81	60042350.77	2021-10-12 23:10:34	2021-10-12 23:10:34	5
359202	ZRX	2021-09-19	1.067	1.115	1.122	1.046	5636078.79	6105850.86	2021-09-20 23:05:28	2021-09-20 23:05:28	6
374712	SJCX	2021-10-21	0.002491	0.002641	0.002491	0.002491	0	0	2021-10-22 23:12:53	2021-10-22 23:12:53	11
353934	XTZ	2021-09-08	4.336	4.404	4.514	3.906	10328500.47	44166763.52	2021-09-09 23:02:56	2021-09-09 23:02:56	5
381920	ANT	2021-11-04	5.199	5.042	6.447	5.02	224308.05	1256853.26	2021-11-05 23:16:05	2021-11-05 23:16:05	14
381906	SJCX	2021-11-04	0.002458	0.002517	0.002458	0.002458	0	0	2021-11-05 23:16:10	2021-11-05 23:16:10	11
348048	ETH	2021-08-27	3275.87	3093.62	3282.69	3057.59	334369.04	1066589734.58	2021-08-28 23:00:12	2021-08-28 23:00:12	10
386658	ETH	2021-11-13	4645.64	4668.7	4705.5	4587.56	133116.8	619103766.42	2021-11-14 23:18:07	2021-11-14 23:18:07	10
370188	ANT	2021-10-12	4.466	4.553	4.623	4.217	536852.54	2397749.42	2021-10-13 23:10:48	2021-10-13 23:10:48	14
364464	BCH	2021-09-30	502.83	485.14	505.96	482.23	49311.31	24518457.67	2021-10-01 23:08:02	2021-10-01 23:08:02	8
364436	FIL	2021-09-30	60.07	57.06	61.18	56.84	549583.2	32579126.61	2021-10-01 23:08:03	2021-10-01 23:08:03	13
375212	ATOM	2021-10-22	34.05	34.31	36.14	33.64	3218067.37	111734386.26	2021-10-23 23:13:07	2021-10-23 23:13:07	3
323016	ZRX	2021-07-04	0.7237	0.7032	0.7419	0.6813	2658709.49	1912871.52	2021-07-05 23:47:49	2021-07-05 23:47:49	6
322998	EOS	2021-07-04	4.062	4.052	4.186	3.953	2112409.49	8645036.78	2021-07-05 23:47:49	2021-07-05 23:47:49	9
364438	DOT	2021-09-30	28.6	27.26	28.97	27.13	2744124.76	77227257.2	2021-10-01 23:08:03	2021-10-01 23:08:03	4
381908	XTZ	2021-11-04	6.347	6.32	6.486	6.104	4228921.07	26606528.58	2021-11-05 23:16:04	2021-11-05 23:16:04	5
375210	BTC	2021-10-22	60693.59	62283.96	63731.17	60017.23	40476.42	2504718475.2	2021-10-23 23:13:07	2021-10-23 23:13:07	7
359246	OCN	2021-09-19	0.0008988	0.0009277	0.001032	0.0008988	16891333.7	15181.75	2021-09-20 22:05:28	2021-09-20 22:05:28	2
370194	BTC	2021-10-12	56010.9	57498.8	57646.93	54098.22	33966.65	1913353762.18	2021-10-13 23:10:48	2021-10-13 23:10:48	7
370196	ETH	2021-10-12	3490.61	3544.14	3548.55	3404.55	302081.99	1052426344.65	2021-10-13 23:10:48	2021-10-13 23:10:48	10
369714	EOS	2021-10-11	4.556	4.582	4.757	4.432	5296340.58	24299877.49	2021-10-12 21:10:33	2021-10-12 21:10:33	9
348050	EOS	2021-08-27	5.093	4.739	5.093	4.626	5627156.9	27362462.14	2021-08-28 23:00:12	2021-08-28 23:00:12	9
337250	EOS	2021-08-04	4.112	4.023	4.152	3.928	2313381.73	9390860.63	2021-08-05 22:54:54	2021-08-05 22:54:54	9
353956	DOT	2021-09-08	27.74	27.9	28.85	25.27	7926653.71	218902257.05	2021-09-09 23:02:56	2021-09-09 23:02:56	4
353936	EOS	2021-09-08	4.742	4.881	4.965	4.425	12795714.89	60196914.38	2021-09-09 23:02:56	2021-09-09 23:02:56	9
374714	ZRX	2021-10-21	1.005	1.003	1.089	0.9952	13489805.35	13874346.51	2021-10-22 23:12:53	2021-10-22 23:12:53	6
386662	EOS	2021-11-13	5.01	4.856	5.071	4.797	3465676.22	17160827.09	2021-11-14 23:18:07	2021-11-14 23:18:07	9
370198	DOT	2021-10-12	35.16	34.14	35.42	32.09	4437371.42	149212106.16	2021-10-13 23:10:48	2021-10-13 23:10:48	4
348544	ANT	2021-08-28	4.884	4.881	4.941	4.825	228531.33	1116161.41	2021-08-29 23:00:26	2021-08-29 23:00:26	14
364440	EOS	2021-09-30	3.938	3.748	3.949	3.726	3785116.45	14723074.86	2021-10-01 23:08:03	2021-10-01 23:08:03	9
323000	BCH	2021-07-04	526.5	505.33	539.2	507.79	134298.68	70707786.64	2021-07-05 23:47:49	2021-07-05 23:47:49	8
353938	ATOM	2021-09-08	20.63	21.01	21.87	18.53	856324.98	17481746.07	2021-09-09 23:02:56	2021-09-09 23:02:56	3
337252	DOT	2021-08-04	19.15	17.38	19.57	17.11	3426350.09	63599307.1	2021-08-05 23:54:54	2021-08-05 23:54:54	4
386670	XTZ	2021-11-13	5.896	5.769	5.988	5.665	2837138.57	16542292.61	2021-11-14 23:18:07	2021-11-14 23:18:07	5
369716	ATOM	2021-10-11	32.04	32.42	34.4	31.01	1821688.52	59242109.24	2021-10-12 23:10:34	2021-10-12 23:10:34	3
359664	ETH	2021-09-20	2966.51	3328.85	3344.34	2926.56	865746.04	2668637203.19	2021-09-21 23:05:42	2021-09-21 23:05:42	10
348052	FIL	2021-08-27	75.18	72.29	75.71	70.45	285884.68	20911286.74	2021-08-28 22:00:12	2021-08-28 22:00:12	13
381910	BCH	2021-11-04	596.3	611.29	613.33	587.2	42907.61	25789144.94	2021-11-05 23:16:04	2021-11-05 23:16:04	8
374716	ATOM	2021-10-21	34.31	35.92	36.78	33.84	3273266.83	115315115.07	2021-10-22 23:12:53	2021-10-22 23:12:53	3
354442	BCH	2021-09-09	661.21	662.16	673.29	656.28	59371.89	39549267.78	2021-09-10 23:03:10	2021-09-10 23:03:10	8
4667	EOS	2021-01-21	2.544	2.777	2.784	2.497	5318490.44	13922867.63	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4668	EOS	2021-01-22	2.629	2.544	2.68	2.433	5678159.84	14558616.65	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4669	EOS	2021-01-23	2.705	2.629	2.78	2.576	5052911.34	13603807.01	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4670	EOS	2021-01-24	2.718	2.705	2.775	2.651	3709107.18	10074680.72	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4671	EOS	2021-01-25	2.649	2.718	2.77	2.633	4654553.17	12645835.19	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4672	EOS	2021-01-26	2.631	2.649	2.674	2.557	3203686.58	8367573.14	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4673	EOS	2021-01-27	2.507	2.631	2.631	2.459	3796382.48	9644242.7	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4674	EOS	2021-01-28	2.712	2.507	2.797	2.483	6433996.26	17263431.2	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4675	EOS	2021-01-29	2.728	2.712	2.907	2.654	8380797.73	23175569.04	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4676	EOS	2021-01-30	2.934	2.728	3.097	2.69	11785440.87	34251086.72	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4677	EOS	2021-01-31	2.932	2.934	3.071	2.807	11250948.46	32928025.25	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4678	EOS	2021-02-01	3.058	2.932	3.279	2.897	18562907.16	57317533.56	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4679	EOS	2021-02-02	3.003	3.058	3.077	2.96	5686039.79	17134303.92	2021-05-09 17:34:36	2021-05-09 17:34:36	9
4680	EOS	2021-02-03	3.071	3.003	3.143	2.99	6155982.98	18869909.72	2021-05-09 17:34:36	2021-05-09 17:34:36	9
348054	SJCX	2021-08-27	0.001964	0.001874	0.001964	0.001964	0	0	2021-08-28 23:00:12	2021-08-28 23:00:12	11
323002	ATOM	2021-07-04	12.32	11.8	12.45	11.52	577165.8	7019142.91	2021-07-05 21:47:48	2021-07-05 21:47:48	3
374718	DOT	2021-10-21	42.84	44.41	45.51	41.96	5059115.35	221167862.93	2021-10-22 23:12:53	2021-10-22 23:12:53	4
353968	BCH	2021-09-08	662.16	672.52	679.58	644.79	75763.73	50206112.49	2021-09-09 23:02:56	2021-09-09 23:02:56	8
353940	FIL	2021-09-08	88.19	84.34	93.94	76.01	1445635.43	123843448.19	2021-09-09 23:02:56	2021-09-09 23:02:56	13
387174	ATOM	2021-11-14	31.92	32.51	33.23	31.12	924242.64	29555138.2	2021-11-15 23:18:21	2021-11-15 23:18:21	3
375206	XTZ	2021-10-22	6.704	6.656	6.899	6.559	4239264.16	28510852.91	2021-10-23 23:13:07	2021-10-23 23:13:07	5
369718	BTC	2021-10-11	57498.8	54700.24	57825.98	54448.68	31803.75	1805863526.52	2021-10-12 23:10:34	2021-10-12 23:10:34	7
3597	FIL	2021-02-18	43.32	43.24	44.38	42.49	397253.27	17194657.72	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3598	FIL	2021-02-19	43.15	43.32	43.64	41.26	431118.39	18222514.02	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3599	FIL	2021-02-20	43.08	43.15	49.03	42.1	1215538.01	55015098.21	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3600	FIL	2021-02-21	44.74	43.08	45.96	42.51	428895.94	19034167.5	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3601	FIL	2021-02-22	39.39	44.74	44.74	27.9	1163061.68	45629582.44	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3602	FIL	2021-02-23	35.51	39.39	39.45	31.53	1419060.53	49947761.71	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3603	FIL	2021-02-24	36.55	35.51	38.14	34.41	547240.36	20175725.64	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3604	FIL	2021-02-25	34.9	36.55	37.45	34.79	334022.15	12046802.01	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3605	FIL	2021-02-26	35.12	34.9	36.44	33.27	401176.16	13986965.92	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3618	FIL	2021-03-11	42.22	42.51	43.11	41.71	209376.38	8843809.76	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3619	FIL	2021-03-12	44.06	42.22	45	41.97	429956.98	18712580.98	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3620	FIL	2021-03-13	49.43	44.06	51.97	43.55	713302.54	34561804.46	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3621	FIL	2021-03-14	53.9	49.43	57.07	49.4	1029653.3	56239724.62	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3622	FIL	2021-03-15	53.27	53.9	56.16	52.08	537014.88	28982319.92	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3623	FIL	2021-03-16	63.58	53.27	63.88	50.78	806613.1	47048268	2021-05-07 19:24:30	2021-05-07 19:24:30	13
337254	BTC	2021-08-04	39738.56	38189.3	39961.11	37526.24	34035.77	1318983897.48	2021-08-05 23:54:54	2021-08-05 23:54:54	7
337318	SJCX	2021-08-04	0.00159	0.001528	0.00159	0.00159	0	0	2021-08-05 23:54:54	2021-08-05 23:54:54	11
364442	OCN	2021-09-30	0.0004383	0.0004154	0.0004383	0.0004383	46842930.84	20530.95	2021-10-01 23:08:02	2021-10-01 23:08:02	2
364462	ZRX	2021-09-30	0.9143	0.8334	0.9143	0.8289	8923000.9	7793415.83	2021-10-01 23:08:02	2021-10-01 23:08:02	6
370202	BCH	2021-10-12	587.52	601.59	601.59	568.41	62488.83	36504623.75	2021-10-13 23:10:48	2021-10-13 23:10:48	8
359666	XTZ	2021-09-20	5.272	6.521	6.553	5.09	25025149.51	140986004.85	2021-09-21 23:05:42	2021-09-21 23:05:42	5
381912	ETH	2021-11-04	4536.99	4604.4	4608.55	4423.44	302900.12	1369081687.71	2021-11-05 23:16:04	2021-11-05 23:16:04	10
386680	OCN	2021-11-13	0.0006441	0.0006416	0.0006441	0.0006441	15015055.9	9671.13	2021-11-14 23:23:32	2021-11-14 23:23:32	2
3636	FIL	2021-03-29	127.25	125.19	130.28	123.85	428585.36	54590767.11	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3637	FIL	2021-03-30	149.7	127.25	153.57	124.68	850298.43	120363521.98	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3638	FIL	2021-03-31	190.81	149.7	197.8	145.31	1926460.75	334777980.99	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3639	FIL	2021-04-01	185.67	190.81	237.55	181.26	2435935.81	501965222.66	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3640	FIL	2021-04-02	172.01	185.67	205.74	160.7	1542172.44	279439262.05	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3641	FIL	2021-04-03	178.27	172.01	181	162.63	809610.26	140310837.48	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3642	FIL	2021-04-04	182.86	178.27	193.91	175.18	714184.32	132209415.13	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3643	FIL	2021-04-05	176.49	182.86	187.14	171.35	471080.76	83745430.88	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3644	FIL	2021-04-06	165.61	176.49	178.84	164.21	465883.44	79520672.83	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3645	FIL	2021-04-07	156.27	165.61	166.48	135.67	1237160.6	183900876.56	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3646	FIL	2021-04-08	154.16	156.27	158.93	146.63	468070.82	71503877.38	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3647	FIL	2021-04-09	171.96	154.16	175.59	152.99	657020.02	109800252.58	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3648	FIL	2021-04-10	174.5	171.96	188.75	170.61	498560.98	89810797.89	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3649	FIL	2021-04-11	178.64	174.5	183.98	172.99	256482.72	45591506.47	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3650	FIL	2021-04-12	168	178.64	181.3	159.74	404013.96	68214779.65	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3651	FIL	2021-04-13	164.36	168	169.33	160.03	358839.25	59217131.87	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3652	FIL	2021-04-14	168.21	164.36	178.47	161.27	589265.47	98693410.78	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3653	FIL	2021-04-15	171.01	168.21	174.87	167.93	320563.52	54784484.96	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3654	FIL	2021-04-16	183.22	171.01	195.19	171.01	978638.45	178732681.78	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3655	FIL	2021-04-17	180.96	183.22	192.48	176.55	353123.66	65070330.71	2021-05-07 19:24:30	2021-05-07 19:24:30	13
3656	FIL	2021-04-18	156.73	180.96	183.07	137.41	773379.63	120808074.96	2021-05-07 19:24:30	2021-05-07 19:24:30	13
375214	DOT	2021-10-22	43.48	42.84	46.36	42.74	4981154.7	221826302.16	2021-10-23 23:13:07	2021-10-23 23:13:07	4
348056	BTC	2021-08-27	49088.1	46852.22	49166.31	46376.81	27872.76	1331637984.84	2021-08-28 23:00:12	2021-08-28 23:00:12	7
364460	SJCX	2021-09-30	0.001753	0.001662	0.001753	0.001753	0	0	2021-10-01 23:08:03	2021-10-01 23:08:03	11
354440	ETH	2021-09-09	3424.24	3499.69	3567.91	3395.5	471809.78	1646622795.7	2021-09-10 23:03:10	2021-09-10 23:03:10	10
374720	BCH	2021-10-21	623.48	644.56	655.75	621.37	104268.27	66685209.9	2021-10-22 23:12:53	2021-10-22 23:12:53	8
359668	OCN	2021-09-20	0.0008306	0.0008988	0.001009	0.000801	14825814.93	12314.66	2021-09-21 23:05:42	2021-09-21 23:05:42	2
369720	BCH	2021-10-11	601.59	585.45	618.07	577.77	59846.43	36099498.23	2021-10-12 23:10:34	2021-10-12 23:10:34	8
381914	FIL	2021-11-04	62.49	64.02	64.5	61.18	310889.19	19465292.86	2021-11-05 22:16:04	2021-11-05 22:16:04	13
337256	ETH	2021-08-04	2725.72	2508.21	2770.24	2458.12	450683.38	1182974472.34	2021-08-05 23:54:54	2021-08-05 23:54:54	10
323004	XTZ	2021-07-04	3.041	3.027	3.108	2.914	1839906.2	5606616.58	2021-07-05 23:47:49	2021-07-05 23:47:49	5
353942	ZRX	2021-09-08	1.006	1.015	1.046	0.8865	27965319.39	27548282.71	2021-09-09 22:02:56	2021-09-09 22:02:56	6
387162	BTC	2021-11-14	65509.06	64409.56	65509.06	63616.33	14680.72	947303706.23	2021-11-15 23:18:21	2021-11-15 23:18:21	7
381916	EOS	2021-11-04	4.543	4.708	4.758	4.441	5482761.04	25059120.09	2021-11-05 23:16:04	2021-11-05 23:16:04	9
375216	ANT	2021-10-22	4.649	4.755	4.687	4.563	218026.73	1013634.39	2021-10-23 23:13:12	2021-10-23 23:13:12	14
354436	DOT	2021-09-09	29.83	27.74	31.84	27.02	7226838.86	213747710.79	2021-09-10 23:03:10	2021-09-10 23:03:10	4
348542	OCN	2021-08-28	0.0009784	0.0009818	0.0009784	0.0009784	15161388.82	14833.57	2021-08-29 21:00:25	2021-08-29 21:00:25	2
369744	FIL	2021-10-11	73.5	69.88	74.68	69.01	597331.49	43078507.82	2021-10-12 23:10:34	2021-10-12 23:10:34	13
369722	SJCX	2021-10-11	0.0023	0.002188	0.0023	0.0023	0	0	2021-10-12 23:10:34	2021-10-12 23:10:34	11
323024	OCN	2021-07-04	0.001278	0.0008463	0.001417	0.0007434	52305325.02	66835.67	2021-07-05 23:47:49	2021-07-05 23:47:49	2
370200	EOS	2021-10-12	4.491	4.556	4.556	4.269	7289534.59	32205061.85	2021-10-13 22:10:48	2021-10-13 22:10:48	9
337258	ATOM	2021-08-04	12.81	12.12	12.91	11.96	1030130.02	12883526.62	2021-08-05 23:54:54	2021-08-05 23:54:54	3
364890	ETH	2021-10-01	3310.63	3000.83	3334.03	2969.29	464652.73	1480674960.09	2021-10-02 23:08:16	2021-10-02 23:08:16	10
374722	ANT	2021-10-21	4.755	4.84	4.755	4.56	183649.19	873321.75	2021-10-22 23:12:53	2021-10-22 23:12:53	14
353944	ANT	2021-09-08	5.456	5.694	5.939	4.965	132422.14	723326.19	2021-09-09 22:02:56	2021-09-09 22:02:56	14
359670	ANT	2021-09-20	4.915	5.973	5.43	4.902	654041.56	3214591.49	2021-09-21 23:05:42	2021-09-21 23:05:42	14
348058	ANT	2021-08-27	4.881	4.619	4.958	4.757	288429.22	1407773.93	2021-08-28 23:00:12	2021-08-28 23:00:12	14
387164	FIL	2021-11-14	62.57	62.93	63.46	61.04	203172.81	12640575.99	2021-11-15 23:18:21	2021-11-15 23:18:21	13
387180	OCN	2021-11-14	0.0006551	0.0006441	0.0006551	0.0006551	28322246.11	18553.64	2021-11-15 23:23:55	2021-11-15 23:23:55	2
337300	FIL	2021-08-04	56.46	54.22	57.3	54.01	292928.49	16338836.97	2021-08-05 23:54:54	2021-08-05 23:54:54	13
337260	ANT	2021-08-04	3.81	3.699	3.934	3.8	355276.44	1353650.54	2021-08-05 23:54:56	2021-08-05 23:54:56	14
364892	BCH	2021-10-01	543.64	502.83	544.67	500.87	71534.06	37657910.34	2021-10-02 22:08:16	2021-10-02 22:08:16	8
369724	DOT	2021-10-11	34.14	34.44	36.08	33.27	3231391.78	112070670.12	2021-10-12 23:10:34	2021-10-12 23:10:34	4
365364	ETH	2021-10-02	3389.48	3310.63	3469.12	3260.49	258224.73	869122812.18	2021-10-03 23:08:30	2021-10-03 23:08:30	10
374724	EOS	2021-10-21	4.668	4.827	4.948	4.593	7549033.71	36104478.77	2021-10-22 22:12:53	2021-10-22 22:12:53	9
387166	XTZ	2021-11-14	5.826	5.896	6.064	5.696	2291226.09	13461274.16	2021-11-15 23:18:21	2021-11-15 23:18:21	5
359680	EOS	2021-09-20	4.185	4.91	4.929	4.088	13400022.42	59425505.69	2021-09-21 21:05:41	2021-09-21 21:05:41	9
353964	OCN	2021-09-08	0.00105	0.0009614	0.00119	0.0009799	12143395.67	12749.44	2021-09-09 23:02:56	2021-09-09 23:02:56	2
348534	BTC	2021-08-28	48918.9	49088.1	49306.47	48386.9	12815.36	626553869.3	2021-08-29 23:00:26	2021-08-29 23:00:26	7
353946	SJCX	2021-09-08	0.001843	0.001874	0.001843	0.001843	0	0	2021-09-09 23:03:06	2021-09-09 23:03:06	11
359672	BTC	2021-09-20	42925.46	47251.76	47340.49	42552.63	64374.41	2849781014.82	2021-09-21 23:05:41	2021-09-21 23:05:41	7
359702	SJCX	2021-09-20	0.001717	0.00189	0.001717	0.001717	0	0	2021-09-21 23:05:42	2021-09-21 23:05:42	11
381918	ZRX	2021-11-04	1.196	1.237	1.266	1.152	11007452.64	13131646.82	2021-11-05 23:16:04	2021-11-05 23:16:04	6
375196	ZRX	2021-10-22	1.003	1.005	1.032	0.9856	6004791.2	6063876.31	2021-10-23 23:13:07	2021-10-23 23:13:07	6
337276	XTZ	2021-08-04	3.175	3.052	3.188	2.995	1986360.75	6138378.76	2021-08-05 23:54:54	2021-08-05 23:54:54	5
337262	OCN	2021-08-04	0.000954	0.0008528	0.001036	0.0008995	15934838.88	15201.87	2021-08-05 23:54:54	2021-08-05 23:54:54	2
387168	DOT	2021-11-14	46.39	47.1	47.82	45.05	1394494.01	64483493.56	2021-11-15 23:18:21	2021-11-15 23:18:21	4
364894	BTC	2021-10-01	48164.35	43829.34	48470.13	43304.82	53577.95	2498575570.28	2021-10-02 23:08:16	2021-10-02 23:08:16	7
364904	FIL	2021-10-01	71.51	60.07	73.31	59.64	687873.76	45048872.3	2021-10-02 23:08:16	2021-10-02 23:08:16	13
382454	ETH	2021-11-05	4480.09	4536.99	4573.58	4446.48	227363.23	1023750022.65	2021-11-06 23:16:17	2021-11-06 23:16:17	10
375198	FIL	2021-10-22	65.97	63.62	66.9	63.62	439503.75	28683950.22	2021-10-23 23:13:07	2021-10-23 23:13:07	13
370186	ZRX	2021-10-12	0.9992	1.017	1.017	0.938	7012760.69	6882388.44	2021-10-13 23:10:48	2021-10-13 23:10:48	6
370208	SJCX	2021-10-12	0.00224	0.0023	0.00224	0.00224	0	0	2021-10-13 23:10:48	2021-10-13 23:10:48	11
348538	ETH	2021-08-28	3246.78	3275.87	3287.97	3212.9	135749.78	440641512.36	2021-08-29 23:00:26	2021-08-29 23:00:26	10
354430	ANT	2021-09-09	5.84	5.456	6.308	5.456	175991.98	1038628.17	2021-09-10 23:03:10	2021-09-10 23:03:10	14
369726	ANT	2021-10-11	4.553	4.606	4.865	4.504	702620.82	3199264.44	2021-10-12 23:10:34	2021-10-12 23:10:34	14
359700	FIL	2021-09-20	74.07	83.48	83.66	71.5	601687.73	46331000.74	2021-09-21 23:05:42	2021-09-21 23:05:42	13
359674	ATOM	2021-09-20	33.71	44.24	44.73	33.3	11948406.5	454708352.58	2021-09-21 23:05:42	2021-09-21 23:05:42	3
369728	ETH	2021-10-11	3544.14	3416.49	3622.59	3374.5	261644.17	924487424.69	2021-10-12 23:10:34	2021-10-12 23:10:34	10
387178	ETH	2021-11-14	4627.5	4645.64	4694.35	4517.53	172936.08	793795679.01	2021-11-15 22:18:21	2021-11-15 22:18:21	10
387170	ANT	2021-11-14	5.458	5.573	5.68	5.458	278156.85	1518057.64	2021-11-15 23:18:21	2021-11-15 23:18:21	14
354432	ATOM	2021-09-09	26.83	20.63	28.42	20.45	3124233.56	78105249	2021-09-10 23:03:10	2021-09-10 23:03:10	3
354444	FIL	2021-09-09	88.6	88.19	94.13	85.14	1050934.99	94567741.48	2021-09-10 23:03:10	2021-09-10 23:03:10	13
348548	ATOM	2021-08-28	21.33	20.48	21.43	19.54	530903.79	10887139.76	2021-08-29 23:00:26	2021-08-29 23:00:26	3
348560	FIL	2021-08-28	74	75.18	75.43	72.95	156706.63	11592016.38	2021-08-29 23:00:26	2021-08-29 23:00:26	13
382456	BTC	2021-11-05	61019.66	61448.47	62621.97	60789.16	20540.56	1262030165.48	2021-11-06 23:16:17	2021-11-06 23:16:17	7
337264	BCH	2021-08-04	545.44	538.32	552.26	525	66083.08	35557460.65	2021-08-05 23:54:56	2021-08-05 23:54:56	8
382462	XTZ	2021-11-05	6.477	6.347	6.86	6.236	8585504.06	56853751.72	2021-11-06 23:16:17	2021-11-06 23:16:17	5
375200	ETH	2021-10-22	3971.95	4062.76	4168.19	3892.38	365507.01	1474774578.95	2021-10-23 23:13:06	2021-10-23 23:13:06	10
359698	ZRX	2021-09-20	0.9037	1.067	1.067	0.8761	14420577.25	13784295.22	2021-09-21 23:05:42	2021-09-21 23:05:42	6
359676	BCH	2021-09-20	541.09	609.1	609.36	531.34	146184.03	81926572.23	2021-09-21 23:05:42	2021-09-21 23:05:42	8
370192	ATOM	2021-10-12	33.45	32.04	34.38	29.93	3123273.05	100897158.17	2021-10-13 23:10:48	2021-10-13 23:10:48	3
364908	ATOM	2021-10-01	37.88	36.22	38.58	34.78	3543165.98	131369672.06	2021-10-02 22:08:16	2021-10-02 22:08:16	3
364896	DOT	2021-10-01	31.96	28.6	32.32	28.5	5222355.75	159639852.05	2021-10-02 23:08:16	2021-10-02 23:08:16	4
365366	XTZ	2021-10-02	7.338	6.691	7.77	6.528	21817402.47	159123414.04	2021-10-03 23:08:30	2021-10-03 23:08:30	5
2919	BTC	2021-04-13	63558.48	59845.76	63682.32	59811.31	52964.84	3299086696.94	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2920	BTC	2021-04-14	62964.27	63558.48	64859.81	61312.98	64272.96	4066819695.96	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2921	BTC	2021-04-15	63233.03	62964.27	63826.89	62038.33	34089.46	2146219571.03	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2922	BTC	2021-04-16	61416.41	63233.03	63567.11	60048.13	57540.3	3544777400.64	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2923	BTC	2021-04-17	60056.07	61416.41	62541.21	59712.92	34261.66	2093039585.66	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2924	BTC	2021-04-18	56246.82	60056.07	60393.33	52785.1	112545.94	6264051811.58	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2925	BTC	2021-04-19	55680.11	56246.82	57590.64	54291.08	48650.49	2732647682.18	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2926	BTC	2021-04-20	56496.06	55680.11	57101.05	53429.73	55866.75	3091319805.6	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2927	BTC	2021-04-21	53803.25	56496.06	56801.94	53640.81	41813.35	2312255459.33	2021-05-09 17:34:36	2021-05-09 17:34:36	7
2928	BTC	2021-04-22	51717.61	53803.25	55458.61	50519.78	84222.11	4488994737.96	2021-05-09 17:34:36	2021-05-09 17:34:36	7
7738	BTC	2021-04-23	51178.03	51717.61	52112.75	47495.24	105510.21	5241192198.03	2021-05-09 17:34:36	2021-05-09 17:34:36	7
354434	BTC	2021-09-09	46392.85	46073.45	47335.29	45572.3	32273.7	1499767099.51	2021-09-10 23:03:10	2021-09-10 23:03:10	7
375204	SJCX	2021-10-22	0.002428	0.002491	0.002428	0.002428	0	0	2021-10-23 23:13:07	2021-10-23 23:13:07	11
375202	EOS	2021-10-22	4.612	4.668	4.786	4.554	4907974.01	23000383.55	2021-10-23 23:13:07	2021-10-23 23:13:07	9
375218	OCN	2021-10-22	0.0006069	0.0006228	0.0006069	0.0006069	26433263.84	16043.3	2021-10-23 23:13:07	2021-10-23 23:13:07	2
370190	OCN	2021-10-12	0.0005601	0.000575	0.0005601	0.0005601	7627972.12	4272.5	2021-10-13 22:10:48	2021-10-13 22:10:48	2
337278	ZRX	2021-08-04	0.869	0.8576	0.8742	0.8247	9959225.17	8480842.97	2021-08-05 22:54:54	2021-08-05 22:54:54	6
348980	ZRX	2021-08-29	1.096	1.081	1.12	1.066	5926866.64	6496114.31	2021-08-30 20:00:38	2021-08-30 20:00:38	6
382458	DOT	2021-11-05	51.85	53.91	53.95	50.63	3129319.73	162958596.59	2021-11-06 23:16:17	2021-11-06 23:16:17	4
348976	BTC	2021-08-29	48794.26	48918.9	49653.49	47841.49	18983.79	924625515.76	2021-08-30 23:00:39	2021-08-30 23:00:39	7
387172	ZRX	2021-11-14	1.277	1.299	1.305	1.241	5858465.56	7411446.24	2021-11-15 23:18:21	2021-11-15 23:18:21	6
387188	EOS	2021-11-14	4.958	5.01	5.087	4.832	3560715	17634503.86	2021-11-15 23:18:21	2021-11-15 23:18:21	9
365372	EOS	2021-10-02	4.327	4.277	4.462	4.196	4406752.36	19078412.07	2021-10-03 23:08:30	2021-10-03 23:08:30	9
359678	DOT	2021-09-20	28.15	33.84	33.91	26.71	8999697.15	267994778.14	2021-09-21 23:05:42	2021-09-21 23:05:42	4
364898	XTZ	2021-10-01	6.691	6.072	6.851	6.012	19500261.18	126977779.7	2021-10-02 23:08:16	2021-10-02 23:08:16	5
365396	ATOM	2021-10-02	38.62	37.88	41.62	37.19	2502300.29	98555655.86	2021-10-03 23:08:30	2021-10-03 23:08:30	3
369730	OCN	2021-10-11	0.000575	0.000547	0.000575	0.000575	24723171.14	14215.53	2021-10-12 20:10:33	2021-10-12 20:10:33	2
\.


--
-- Name: daily_market_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.daily_market_history_id_seq', 388262, true);


--
-- Data for Name: groupings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.groupings (id, member_id, member_type, group_id, group_type, inserted_at, updated_at) FROM stdin;
\.


--
-- Name: groupings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.groupings_id_seq', 1, false);


--
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.groups (id, name, short_desc, type, inserted_at, updated_at) FROM stdin;
\.


--
-- Name: groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.groups_id_seq', 1, false);


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.leads (id, full_name, email, inserted_at, updated_at) FROM stdin;
\.


--
-- Name: leads_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.leads_id_seq', 1, false);


--
-- Data for Name: ontologies; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ontologies (id, subject_id, representation_id, perspective_id, constraint_id, context_id, context_type, class_id, class_type, inserted_at, updated_at) FROM stdin;
\.


--
-- Name: ontologies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ontologies_id_seq', 1, false);


--
-- Data for Name: portfolios; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.portfolios (id, name, description, inserted_at, updated_at) FROM stdin;
1	The WiseMind Portfolio	The WiseMind Portfolio. Cryptoassets selected by the wisdom of the crowd.	2019-12-11 17:29:14	2019-12-11 17:29:14
\.


--
-- Name: portfolios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.portfolios_id_seq', 1, false);


--
-- Data for Name: portfolios_tokens; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.portfolios_tokens (id, token_id, weight, inserted_at, updated_at, user_id, portfolio_id) FROM stdin;
\.


--
-- Name: portfolios_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.portfolios_tokens_id_seq', 1, false);


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.posts (id, type, parent_id, title, description, body, active, is_public, status, user_id, thread_id, cached_votes_for_total, inserted_at, updated_at) FROM stdin;
\.


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.posts_id_seq', 1, false);


--
-- Data for Name: proposals; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.proposals (id, type, title, description, active, is_public, station, status, user_id, cached_votes_for_total, inserted_at, updated_at) FROM stdin;
1	Genesis	Investment Strategy/System MarketPlace	Provide a marketplace where trading system developers and investment strategists can sell trading systems and strategies. 	f	t	Generalist	initial	19	\N	2019-12-12 06:49:47	2019-12-12 06:49:47
2	Genesis	Financial Data Structure (FDS) Marketplace	Provide a Financial Data Structure (FDS) Marketplace where traders and investors can purchase datasets curated by blockchain-enabled Proof of Accuracy.	f	t	Generalist	initial	18	\N	2019-12-16 03:28:15	2019-12-16 03:28:15
3	Genesis	Engineer	I need a support	f	t	Generalist	initial	41	\N	2020-08-01 13:21:45	2020-08-01 13:21:45
4	Genesis	Engineer	I need a support	f	t	Generalist	initial	41	\N	2020-08-01 13:22:24	2020-08-01 13:22:24
5	Genesis	Login	Cannot login	f	t	Generalist	initial	50	\N	2020-09-28 16:26:42	2020-09-28 16:26:42
\.


--
-- Name: proposals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.proposals_id_seq', 5, true);


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.roles (id, title, inserted_at, updated_at) FROM stdin;
1	curator	2019-12-11 17:29:24	2019-12-11 17:29:24
2	strategist	2019-12-11 17:29:24	2019-12-11 17:29:24
3	analyst	2019-12-11 17:29:24	2019-12-11 17:29:24
4	engineer	2019-12-11 17:29:24	2019-12-11 17:29:24
5	tpm	2019-12-11 17:29:25	2019-12-11 17:29:25
\.


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.roles_id_seq', 5, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.schema_migrations (version, inserted_at) FROM stdin;
20180308050356	2019-10-21 01:48:00
20180813000940	2019-10-21 01:48:00
20180816020411	2019-10-21 01:48:01
20180821171627	2019-10-21 01:48:02
20180821172735	2019-10-21 01:48:02
20180915164407	2019-10-21 01:48:03
20181016204116	2019-10-21 01:48:04
20190304062121	2019-10-21 01:48:04
20190304065834	2019-10-21 01:48:05
20190306062820	2019-10-21 01:48:06
20190306062837	2019-10-21 01:48:07
20190306075340	2019-10-21 01:48:07
20190308043020	2019-10-21 01:48:08
20190308044458	2019-10-21 01:48:09
20190308050927	2019-10-21 01:48:09
20190626054408	2019-10-21 01:48:10
20190626054499	2019-10-21 01:48:11
20190626054509	2019-10-21 01:48:11
20190701134704	2019-10-21 01:48:12
20191103173504	2019-12-11 17:28:26
20191108161324	2019-12-11 17:28:27
20191109033254	2019-12-11 17:28:27
20191109230347	2019-12-11 17:28:28
20191118000750	2019-12-11 17:28:29
20191205043040	2019-12-11 17:28:30
20210207212412	2021-02-25 04:19:58
20210207212545	2021-02-25 04:19:59
20210219001149	2021-02-25 04:19:59
20210304194045	2021-04-22 20:59:40
20210305203711	2021-04-22 20:59:40
20210307191911	2021-04-22 20:59:40
20210307192038	2021-04-22 20:59:40
\.


--
-- Data for Name: strategies; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.strategies (id, name, short_desc, long_desc, type, tagging_id, inserted_at, updated_at) FROM stdin;
\.


--
-- Name: strategies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.strategies_id_seq', 1, false);


--
-- Data for Name: systems; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.systems (id, name, description, short_desc, inserted_at, updated_at) FROM stdin;
\.


--
-- Name: systems_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.systems_id_seq', 1, false);


--
-- Data for Name: taggings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.taggings (id, tagged_id, topic_id, inserted_at, updated_at) FROM stdin;
\.


--
-- Name: taggings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.taggings_id_seq', 1, false);


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tags (id, name, inserted_at, updated_at) FROM stdin;
\.


--
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tags_id_seq', 1, false);


--
-- Data for Name: threads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.threads (id, type, title, description, body, active, is_public, status, topic_id, user_id, cached_votes_for_total, inserted_at, updated_at) FROM stdin;
\.


--
-- Name: threads_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.threads_id_seq', 5, true);


--
-- Data for Name: tokens; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tokens (id, symbol, name, site, description, img_url, inserted_at, updated_at, token_info) FROM stdin;
1	DFN	DFINITY (DFN)	https://dfinity.org	DFINITY, a global internet computer that aims to reinvent the internet as a\n      computer that runs secure software with superpowers, is developing the ICP protocol (Internet Computer Protocol) that makes\n      it possible for independent data centers to combine the capacity of millions of\n      standardized computers to add native, universal, secure and seamless serverless\n      cloud functionality to the Internet - in much the same way TCP/IP protocols\n      combine private networks to provide the public Internet connectivity we rely on\n      today. Adding cloud functionality\n      to the Internet using a secure crypto-based protocol provides a tamperproof\n      environment where hackproof and unstoppable software can be created. The\n      objective of the DFINITY project is to enable the Internet to natively host the\n      world's next generation of software systems, mass market Internet services, and\n      data	\N	2019-12-11 17:29:00	2019-12-11 17:29:00	\N
15	BLXR	BLOXROUTE (BLXR)	https://bloxroute.com	BLOXROUTE (BLXR) is a Blockchain Distribution Network (BDN), a first-of-its-kind security token that distributes revenues associated with the cryptocurrencies using bloXroute's Blockchain Distribution Network (BDN) to the wider blockchain community. We believe that the BLXR token gives the project a business model which aligns incentives for a broad base of network participants.	\N	2019-12-11 17:29:03	2019-12-11 17:29:03	\N
3	ATOM	COSMOS (ATOM)	https://cosmos.network	COSMOS is building customizable, interoperable ecosystem of connected blockchains.	\N	2019-12-11 17:29:01	2021-05-01 20:27:12	{"id": 3794, "name": "Cosmos", "tags": ["platform", "cosmos-ecosystem", "content-creation", "interoperability", "binance-chain", "polychain-capital-portfolio", "dragonfly-capital-portfolio", "hashkey-capital-portfolio", "1confirmation-portfolio", "paradigm-xzy-screener", "exnetwork-capital-portfolio"], "symbol": "ATOM", "btc_price": null, "usd_price": "23.95", "volume_7d": "6430009475.48", "max_supply": null, "volume_24h": "605463642.30", "volume_30d": "29749768671.27", "platform_id": null, "last_updated": "1970-01-01T00:33:41Z", "total_supply": "268551865.76", "platform_name": null, "market_cap_btc": null, "market_cap_usd": "5047452442.25", "percent_change_1h": null, "percent_change_7d": "25.86", "circulating_supply": "210767262.76", "percent_change_24h": "6.15", "percent_change_30d": "23.80", "percent_change_60d": null, "percent_change_90d": null}
5	XTZ	TEZOS (XTZ)	https://tezos.com	TEZOS is an open-source platform for assets and applications backed by a global community of validators, researchers, and builders.	\N	2019-12-11 17:29:02	2021-05-01 20:27:12	{"id": 2011, "name": "Tezos", "tags": ["platform", "enterprise-solutions", "smart-contracts", "binance-chain", "polychain-capital-portfolio", "boostvc-portfolio", "winklevoss-capital"], "symbol": "XTZ", "btc_price": null, "usd_price": "5.84", "volume_7d": "2872087537.19", "max_supply": null, "volume_24h": "188320503.15", "volume_30d": "20222936133.20", "platform_id": null, "last_updated": "1970-01-01T00:33:41Z", "total_supply": "768284455.62", "platform_name": null, "market_cap_btc": null, "market_cap_usd": "4486577968.38", "percent_change_1h": null, "percent_change_7d": "29.39", "circulating_supply": "768284455.62", "percent_change_24h": "4.67", "percent_change_30d": "10.30", "percent_change_60d": null, "percent_change_90d": null}
8	BCH	BITCOIN CASH (BCH)		In mid-2017, a group of developers wanting to increase bitcoin's block size limit prepared a code change. The change, called a hard fork, took effect on 1 August 2017.\n      BCH is aiming to be the fork of bitcoin that is most cash like for use in payments systems.	\N	2019-12-11 17:29:02	2021-05-01 20:27:12	{"id": 1831, "name": "Bitcoin Cash", "tags": ["mineable", "pow", "sha-256", "marketplace", "medium-of-exchange", "store-of-value", "enterprise-solutions", "payments", "binance-chain"], "symbol": "BCH", "btc_price": null, "usd_price": "996.05", "volume_7d": "49271591753.40", "max_supply": "21000000.00", "volume_24h": "3376559750.60", "volume_30d": "202310176261.99", "platform_id": null, "last_updated": "1970-01-01T00:33:41Z", "total_supply": "18724531.25", "platform_name": null, "market_cap_btc": null, "market_cap_usd": "18650559665.68", "percent_change_1h": null, "percent_change_7d": "26.44", "circulating_supply": "18724531.25", "percent_change_24h": "1.33", "percent_change_30d": "78.71", "percent_change_60d": null, "percent_change_90d": null}
11	SJCX	STORJ (SJCX)	https://storj.io	Storj Labs is the provider of the Storj decentralized cloud storage network, and the company behind STORJ token, a cryptocurrency on the Ethereum blockchain that powers digital storage and data retrieval on its cloud storage platform.	\N	2019-12-11 17:29:02	2021-05-01 20:27:12	{"id": 549, "name": "Storjcoin X", "tags": ["platform", "distributed-computing"], "symbol": "SJCX", "btc_price": null, "usd_price": "0.09", "volume_7d": "0.00", "max_supply": null, "volume_24h": "0.00", "volume_30d": "0.00", "platform_id": null, "last_updated": "1970-01-01T00:33:40Z", "total_supply": "500000000.00", "platform_name": null, "market_cap_btc": null, "market_cap_usd": "0.00", "percent_change_1h": null, "percent_change_7d": "-17.81", "circulating_supply": "0.00", "percent_change_24h": "0.00", "percent_change_30d": "0.00", "percent_change_60d": null, "percent_change_90d": null}
14	ANT	ARAGON (ANT)	https://aragon.one	Aragon is an open-source software project that allows for the creation and management of decentralized organizations.	\N	2019-12-11 17:29:03	2021-05-01 20:27:12	{"id": 1680, "name": "Aragon", "tags": ["platform", "cosmos-ecosystem", "enterprise-solutions", "dao", "substrate", "polkadot", "governance", "boostvc-portfolio", "placeholder-ventures-portfolio"], "symbol": "ANT", "btc_price": null, "usd_price": "9.84", "volume_7d": "637357955.92", "max_supply": null, "volume_24h": "60822529.54", "volume_30d": "2049899540.92", "platform_id": null, "last_updated": "1970-01-01T00:33:41Z", "total_supply": "39609523.81", "platform_name": "Ethereum", "market_cap_btc": null, "market_cap_usd": "389783512.59", "percent_change_1h": null, "percent_change_7d": "26.91", "circulating_supply": "39609522.81", "percent_change_24h": "-1.50", "percent_change_30d": "-20.00", "percent_change_60d": null, "percent_change_90d": null}
6	ZRX	0x (ZRX)	https://0x.org	0x is an open protocol that enables the peer-to-peer exchange of assets on the\nEthereum blockchain. Anyone in the world can use 0x to service a wide variety of\nmarkets ranging from gaming items to financial instruments to assets that could\nhave never existed before.	\N	2019-12-11 17:29:02	2021-05-01 20:27:12	{"id": 1896, "name": "0x", "tags": ["platform", "decentralized-exchange", "defi", "dao", "substrate", "polkadot", "polkadot-ecosystem", "polychain-capital-portfolio", "governance", "blockchain-capital-portfolio", "boostvc-portfolio", "fabric-ventures-portfolio", "kinetic-capital", "placeholder-ventures-portfolio", "pantera-capital-portfolio"], "symbol": "ZRX", "btc_price": null, "usd_price": "1.94", "volume_7d": "1360051482.22", "max_supply": "1000000000.00", "volume_24h": "249464642.39", "volume_30d": "5870880587.28", "platform_id": null, "last_updated": "1970-01-01T00:33:41Z", "total_supply": "1000000000.00", "platform_name": "Ethereum", "market_cap_btc": null, "market_cap_usd": "1514449125.24", "percent_change_1h": null, "percent_change_7d": "44.03", "circulating_supply": "781547659.17", "percent_change_24h": "8.55", "percent_change_30d": "0.40", "percent_change_60d": null, "percent_change_90d": null}
9	EOS	EOSIO (EOS)	https://eos.io	EOSIO (EOS), is built for public or private blockchain networks, customizable to suit your business needs.	\N	2019-12-11 17:29:02	2021-05-01 20:27:12	{"id": 1765, "name": "EOS", "tags": ["medium-of-exchange", "enterprise-solutions", "smart-contracts", "binance-chain", "fenbushi-capital-portfolio", "galaxy-digital-portfolio"], "symbol": "EOS", "btc_price": null, "usd_price": "6.46", "volume_7d": "25813013030.30", "max_supply": null, "volume_24h": "1722362110.67", "volume_30d": "136542290705.44", "platform_id": null, "last_updated": "1970-01-01T00:33:41Z", "total_supply": "1029180957.68", "platform_name": null, "market_cap_btc": null, "market_cap_usd": "6156501331.93", "percent_change_1h": null, "percent_change_7d": "24.12", "circulating_supply": "953013879.44", "percent_change_24h": "1.61", "percent_change_30d": "14.11", "percent_change_60d": null, "percent_change_90d": null}
10	ETH	ETHEREUM (ETH)	https://www.ethereum.org	Ethereum is a global, open-source platform for decentralized applications. On Ethereum, you can write code that controls digital value, runs exactly as programmed, and is accessible anywhere in the world.	\N	2019-12-11 17:29:02	2021-05-01 20:27:12	{"id": 1027, "name": "Ethereum", "tags": ["mineable", "pow", "smart-contracts", "ethereum", "coinbase-ventures-portfolio", "three-arrows-capital-portfolio", "polychain-capital-portfolio", "binance-labs-portfolio", "arrington-xrp-capital", "blockchain-capital-portfolio", "boostvc-portfolio", "cms-holdings-portfolio", "dcg-portfolio", "dragonfly-capital-portfolio", "electric-capital-portfolio", "fabric-ventures-portfolio", "framework-ventures", "hashkey-capital-portfolio", "kinetic-capital", "huobi-capital", "alameda-research-portfolio", "a16z-portfolio", "1confirmation-portfolio", "winklevoss-capital", "usv-portfolio", "placeholder-ventures-portfolio", "pantera-capital-portfolio", "multicoin-capital-portfolio", "paradigm-xzy-screener"], "symbol": "ETH", "btc_price": null, "usd_price": "2927.99", "volume_7d": "154666380116.33", "max_supply": null, "volume_24h": "28287130339.26", "volume_30d": "1750484484775.97", "platform_id": null, "last_updated": "1970-01-01T00:33:41Z", "total_supply": "115699031.31", "platform_name": null, "market_cap_btc": null, "market_cap_usd": "338765810565.76", "percent_change_1h": null, "percent_change_7d": "29.19", "circulating_supply": "115699031.31", "percent_change_24h": "5.89", "percent_change_30d": "47.78", "percent_change_60d": null, "percent_change_90d": null}
2	OCN	OCEAN (OCN)	https://oceanprotocol.com	OCEAN is a Decentralized Data Exchange Protocol to Unlock Data for AI.\nOcean Protocol is kickstarting a Data Economy by breaking down data silos and equalizing access to data for all.	\N	2019-12-11 17:29:01	2021-05-01 20:27:12	{"id": 2458, "name": "Odyssey", "tags": ["platform", "sharing-economy"], "symbol": "OCN", "btc_price": null, "usd_price": "0.00", "volume_7d": "21223233.32", "max_supply": null, "volume_24h": "908950.27", "volume_30d": "93687090.41", "platform_id": null, "last_updated": "1970-01-01T00:33:41Z", "total_supply": "10000000000.00", "platform_name": "Ethereum", "market_cap_btc": null, "market_cap_usd": "15912506.16", "percent_change_1h": null, "percent_change_7d": "4.96", "circulating_supply": "8000000000.00", "percent_change_24h": "-1.19", "percent_change_30d": "54.04", "percent_change_60d": null, "percent_change_90d": null}
13	FIL	FILECOIN (FIL)	https://filecoin.io	Filecoin (⨎) is an open-source, public, cryptocurrency and digital payment system intended to be a blockchain-based cooperative digital storage and data retrieval method. 	\N	2019-12-11 17:29:03	2021-05-01 20:27:12	{"id": 2280, "name": "Filecoin", "tags": ["mineable", "distributed-computing", "filesharing", "storage", "polychain-capital-portfolio", "blockchain-capital-portfolio", "boostvc-portfolio", "dcg-portfolio", "hashkey-capital-portfolio", "a16z-portfolio", "winklevoss-capital", "pantera-capital-portfolio"], "symbol": "FIL", "btc_price": null, "usd_price": "162.33", "volume_7d": "40156932168.65", "max_supply": "2000000000.00", "volume_24h": "1143434917.92", "volume_30d": "84116821020.98", "platform_id": null, "last_updated": "1970-01-01T00:33:41Z", "total_supply": "69126063.00", "platform_name": null, "market_cap_btc": null, "market_cap_usd": "11221574457.32", "percent_change_1h": null, "percent_change_7d": "21.03", "circulating_supply": "69126063.00", "percent_change_24h": "1.40", "percent_change_30d": "-15.79", "percent_change_60d": null, "percent_change_90d": null}
4	DOT	POLKADOT (DOT)	https://polkadot.network	POLKADOT is empowering blockchain networks to work together under the protection of shared security. A united network of state machines,\n      the platform enables autonomous economies to develop within fairer peer-to-peer digital jurisdictions.	\N	2019-12-11 17:29:01	2021-05-01 20:27:12	{"id": 6636, "name": "Polkadot", "tags": ["substrate", "polkadot", "binance-chain", "polkadot-ecosystem", "three-arrows-capital-portfolio", "polychain-capital-portfolio", "blockchain-capital-portfolio", "boostvc-portfolio", "cms-holdings-portfolio", "coinfund-portfolio", "fabric-ventures-portfolio", "fenbushi-capital-portfolio", "hashkey-capital-portfolio", "kinetic-capital", "1confirmation-portfolio", "placeholder-ventures-portfolio", "pantera-capital-portfolio", "exnetwork-capital-portfolio"], "symbol": "DOT", "btc_price": null, "usd_price": "37.09", "volume_7d": "23885849736.43", "max_supply": null, "volume_24h": "1610639900.98", "volume_30d": "94731331051.09", "platform_id": null, "last_updated": "1970-01-01T00:33:41Z", "total_supply": "1069856787.36", "platform_name": null, "market_cap_btc": null, "market_cap_usd": "34655438037.80", "percent_change_1h": null, "percent_change_7d": "23.42", "circulating_supply": "934332672.50", "percent_change_24h": "3.52", "percent_change_30d": "-2.17", "percent_change_60d": null, "percent_change_90d": null}
7	BTC	BITCOIN (BTC)	https://www.bitcoincash.org	Bitcoin is a cryptocurrency, a form of electronic cash. It is a decentralized digital currency without a central bank or single administrator. Bitcoin is often call "Digital Gold" due to the core teams focus on the properties of\n      decentralized systems that support a cryptocurrency being classifed as a 'Store of Value'	\N	2019-12-11 17:29:02	2021-05-01 20:27:12	{"id": 1, "name": "Bitcoin", "tags": ["mineable", "pow", "sha-256", "store-of-value", "state-channels", "coinbase-ventures-portfolio", "three-arrows-capital-portfolio", "polychain-capital-portfolio", "binance-labs-portfolio", "arrington-xrp-capital", "blockchain-capital-portfolio", "boostvc-portfolio", "cms-holdings-portfolio", "dcg-portfolio", "dragonfly-capital-portfolio", "electric-capital-portfolio", "fabric-ventures-portfolio", "framework-ventures", "galaxy-digital-portfolio", "huobi-capital", "alameda-research-portfolio", "a16z-portfolio", "1confirmation-portfolio", "winklevoss-capital", "usv-portfolio", "placeholder-ventures-portfolio", "pantera-capital-portfolio", "multicoin-capital-portfolio", "paradigm-xzy-screener"], "symbol": "BTC", "btc_price": null, "usd_price": "57694.52", "volume_7d": "4417936980097.79", "max_supply": "21000000.00", "volume_24h": "43342825873.56", "volume_30d": "18919491751604.33", "platform_id": null, "last_updated": "1970-01-01T00:33:41Z", "total_supply": "18696293.00", "platform_name": null, "market_cap_btc": null, "market_cap_usd": "1078673725326.28", "percent_change_1h": null, "percent_change_7d": "13.65", "circulating_supply": "18696293.00", "percent_change_24h": "1.39", "percent_change_30d": "-2.57", "percent_change_60d": null, "percent_change_90d": null}
\.


--
-- Name: tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tokens_id_seq', 15, true);


--
-- Data for Name: tokens_tags; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tokens_tags (id, token_id, tag_id, inserted_at, updated_at) FROM stdin;
\.


--
-- Name: tokens_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tokens_tags_id_seq', 1, false);


--
-- Data for Name: topics; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.topics (id, name, description, slug, weight, parent_id, inserted_at, updated_at) FROM stdin;
1	Crypto Economics	Cryptoeconomics refers to the combinations of cryptography, computer networks\n       and game theory which provide secure systems exhibiting some set of economic\n       dis/incentives.	\N	100	\N	2019-10-21 01:48:13	2019-10-21 01:48:13
2	Cryptoasset Fundamental & Technical Analysis	Fundamental, Technical, and Sociotechnical analysis of crypto systems, networks, and assets.	\N	100	\N	2019-10-21 01:48:14	2019-10-21 01:48:14
3	Artificial Intelligence	Categorical breakdown of the current crop of key AI use cases by\n      startups and the socio-technological implications of future developments.	\N	100	\N	2019-10-21 01:48:14	2019-10-21 01:48:14
111	Behavioral Finance & Investing Psychology	Psychological and Socio-technological aspects of financial & capital markets.	\N	100	\N	2019-10-21 01:48:14	2019-10-21 01:48:14
4	Crypto Career Development	The current and future titles and roles\n      involving crypto technologies and business practices.	\N	100	\N	2019-10-21 01:48:14	2019-10-21 01:48:14
123	Crypto Research	The companies & research driving the frontiers of the CryptoCosm.	\N	100	\N	2019-10-21 01:48:14	2019-10-21 01:48:14
124	Quantum Computing	The companies & research driving future directions in Quantum Computing.	\N	100	\N	2019-10-21 01:48:14	2019-10-21 01:48:14
125	CRISPR	The companies & research driving future directions in CRISPR gene editing technology.	\N	100	\N	2019-10-21 01:48:14	2019-10-21 01:48:14
126	Service Mesh	A service mesh is a configurable, low‑latency infrastructure layer\n      designed to handle a high volume of network‑based interprocess communication\n      among application infrastructure services using application programming\n      interfaces (APIs).	\N	100	\N	2019-10-21 01:48:14	2019-10-21 01:48:14
130	Data Protocols & MarketPlaces	Data Protocols and MarketPlaces in the Crypto Ecosystem.	\N	100	\N	2019-10-21 01:48:15	2019-10-21 01:48:15
131	General Crypto Platforms, Frameworks, API's, Products	Platforms, Frameworks, and API's offered by the Crypto Ecosystem.	\N	100	\N	2019-10-21 01:48:15	2019-10-21 01:48:15
149	Mixed Reality	Assets focusing on enabling, or being used within, virtual reality or augmented\nreality platforms.	\N	100	\N	2019-10-21 01:48:15	2019-10-21 01:48:15
132	Distributed & Decentralized Systems Engineering	Emerging best practices, products, open source tooling for building next-gen\n    internet systems and institutions.	\N	100	\N	2019-10-21 01:48:15	2019-10-21 01:48:15
147	Edge Computing	Edge computing is a distributed computing paradigm which brings\n`    computation and data storage closer to the location where it is needed, to\n    improve response times and save bandwidth. On the Edge, device and sensor endpoints are where most of the\n    computation takes place, whereas in Fog computing, the bulk of computation takes place in LAN proxies/gateways nearby the\n     edge devices for which the computation is being performed.	\N	100	132	2019-10-21 01:48:15	2019-10-21 01:48:15
148	Fog Computing	Edge computing is a distributed computing paradigm which brings\ncomputation and data storage closer to the location where it is needed, to\nimprove response times and save bandwidth.	\N	100	132	2019-10-21 01:48:15	2019-10-21 01:48:15
5	Crypto Macro Economy	The Crypto Economy. A.K.A 'The Cryptocosm'. Includes crypto\n    economic sectors and their analysis.	\N	100	1	2019-10-21 01:48:16	2019-10-21 01:48:16
6	Crypto Economic Sectors	The sectors of the crypto economy.	\N	100	5	2019-10-21 01:48:17	2019-10-21 01:48:17
7	Crypto Micro Economy	The 'Firm' or 'Entity' level analysis of crypto projects. Includes\n    strategic policies, protocols, crypto-economic primitives, governance models,\n    token/incentive engineering, token distribution models.	\N	100	1	2019-10-21 01:48:17	2019-10-21 01:48:17
8	Mechanism Design	A field in economics and game theory that takes an engineering\n      approach to designing economic mechanisms or incentives, toward\n      desired objectives, in strategic settings, where players act\n      rationally.	\N	100	7	2019-10-21 01:48:18	2019-10-21 01:48:18
9	Consensus Protocols	A consensus algorithm is a process in computer science used to achieve\n      agreement on a single data value among distributed processes or systems.\n      Consensus algorithms are designed to achieve reliability in a network involving\n      multiple unreliable nodes. Essentially, tools for solving the double spend problem in the distributed ledger space.	\N	100	7	2019-10-21 01:48:18	2019-10-21 01:48:18
10	Crypto Economic Primitives	Protocol based incentives systems that are uniquely enabled by tokens. Also\n      referred to as “tokenized economic games”. They enable the coordination and\n      allocation of capital to achieve a shared goal via the use of various economic\n      and cryptographic mechanisms. Examples include curation markets, token curated registries,\n      token bonding curves, etc..	\N	100	7	2019-10-21 01:48:18	2019-10-21 01:48:18
11	Crypto Governance Models	The concerted efforts by which cooperation and decision-making can be achieved,\n      collectively, and action can be taken accordingly when necessary to ensure the\n      integrity of the ecosystem. Because governance and social consensus takes time,\n      and is an emergent property, creating a sound ecosystem that can interoperate\n      well to perceive that emergent consensus & signaling is paramount.	\N	100	7	2019-10-21 01:48:18	2019-10-21 01:48:18
12	Smart Contracts	Systems which move digital assets according to arbitrary pre-specified rules.	\N	100	7	2019-10-21 01:48:18	2019-10-21 01:48:18
13	Incentive Engineering	Primitive building blocks and current best practices for designing and\n      implementing crypto networks.	\N	100	7	2019-10-21 01:48:19	2019-10-21 01:48:19
14	Open Network Business Models	Existing & Emerging business models enabled by crypto networks.	\N	100	7	2019-10-21 01:48:19	2019-10-21 01:48:19
112	Token Distribution Models	Existing & Emerging distribution models enabled by crypto networks.	\N	100	7	2019-10-21 01:48:19	2019-10-21 01:48:19
128	Competitive Strategy	Frameworks which descend from Michael Porter's Five Forces, etc..	\N	100	7	2019-10-21 01:48:19	2019-10-21 01:48:19
127	Go To Market Strategy	Go to Market Strategies & Tactics for crypto networking entities.	\N	100	7	2019-10-21 01:48:19	2019-10-21 01:48:19
144	Aragon		\N	100	11	2019-10-21 01:48:19	2019-10-21 01:48:19
145	Colony		\N	100	11	2019-10-21 01:48:19	2019-10-21 01:48:19
146	Tezos		\N	100	11	2019-10-21 01:48:19	2019-10-21 01:48:19
16	Portfolio Optimization	The process of selecting the best portfolio (asset\n      distribution), out of the set of all portfolios being considered, according\n      to some objective.	\N	100	17	2019-10-21 01:48:21	2019-10-21 01:48:21
17	Investing Strategy	A set of rules, behaviors or procedures, designed to guide an\n      investor's selection of an investment portfolio or trading system.	\N	100	2	2019-10-21 01:48:21	2019-10-21 01:48:21
129	Trading Strategy	A set of rules, behaviors or procedures, designed to guide an\n      investor's selection of an investment portfolio or trading system.	\N	100	2	2019-10-21 01:48:21	2019-10-21 01:48:21
54	Privacy	Privacy-focused decentralized currencies incorporate technology designed to\nmake it difficult or impossible for 3rd parties to track the flow of coins from\none transactor to the next.	\N	100	6	2019-10-21 01:48:26	2019-10-21 01:48:26
18	Global Tactical Asset Allocation	A top-down investment strategy that attempts to exploit\n      short-term mis-pricings among a global set of assets. The strategy focuses\n      on general movements in the market rather than on performance of individual securities.	\N	100	17	2019-10-21 01:48:21	2019-10-21 01:48:21
19	Trading Systems & Methods	A computer program that creates orders and automatically\n      submits them to a market center or exchange. The program will automatically\n      generate orders based on predefined set of rules using a trading strategy\n      which is often based on technical analysis but can also be based on input\n      from other electronic sources.	\N	100	17	2019-10-21 01:48:21	2019-10-21 01:48:21
20	Crypto Asset Taxonomy	Classification of cryptoassets into narrowly defined subsets\n      for the purpose of analysis. For example, equity-like offerings, or\n      fixed-income, derivatives, commodity-linked assets, currencies etc..	\N	100	2	2019-10-21 01:48:22	2019-10-21 01:48:22
21	Token Valuation Frameworks	Emerging and Existing token valuation frameworks.	\N	100	90	2019-10-21 01:48:22	2019-10-21 01:48:22
22	Advertising	Decentralized advertising platforms incentivize new markets through\nad-network-specific onchain tokens.	\N	100	6	2019-10-21 01:48:22	2019-10-21 01:48:22
23	Alternative Medicine	Assets focusing on alternative medicine, including assets and coins targeted at\nthe cannabis industry.	\N	100	6	2019-10-21 01:48:23	2019-10-21 01:48:23
24	Blockchain Application Development	Application development platforms use onchain tokens to incentivize development\nof blockchain-based ecosystems(platforms) and tools.	\N	100	6	2019-10-21 01:48:23	2019-10-21 01:48:23
25	Artificial Intelligence Sector	Assets focusing on AI, using blockchain-based incentives.	\N	100	6	2019-10-21 01:48:23	2019-10-21 01:48:23
26	Asset Management	Asset management platforms offer ways to manage onchain assets.	\N	100	6	2019-10-21 01:48:23	2019-10-21 01:48:23
27	Content Creation	Content creation chains incentivize content-creation by fostering a\nmicropayment market between content-consumers and publishers.	\N	100	6	2019-10-21 01:48:24	2019-10-21 01:48:24
28	Crowdfunding Platforms	Crowdfunding platforms raise money via a native blockchain token\nand allocate to projects, often through community vote (either onchain or\nthrough a Foundation).	\N	100	6	2019-10-21 01:48:24	2019-10-21 01:48:24
29	Crypto Collectibles	Crypto Collectibles are non-fungible tokens designed to be unique and\ntradable.	\N	100	6	2019-10-21 01:48:24	2019-10-21 01:48:24
30	Currencies	Decentralized currencies operate as money and stores of value. They are\nglobally accessible and controlled by no single entity or group.	\N	100	6	2019-10-21 01:48:24	2019-10-21 01:48:24
31	dApp Networks	Decentralized Application (dApp) networks provide access to many\n      dApps with unique services on top.	\N	100	6	2019-10-21 01:48:24	2019-10-21 01:48:24
32	Decentralized Exchanges	Decentralized exchange platforms allow the conversion of one cryptoasset to\nanother without a middleman mediating the transaction. They do not require a third\n  party to store your funds, thus reducing intermediary risk signicantly	\N	100	6	2019-10-21 01:48:24	2019-10-21 01:48:24
33	Derivatives (Options & Futures)	Options & Futures contracts allow one to buy or sell a given amount of\nsecurities based on future events.	\N	100	6	2019-10-21 01:48:24	2019-10-21 01:48:24
34	Developer Tools	Projects within this category are primarily used by developers as the building\nblocks for decentralized applications.	\N	100	6	2019-10-21 01:48:24	2019-10-21 01:48:24
35	Distributed Computation Markets	Distributed computation assets create a market for CPU/GPU power distributed\nglobally across participating computers.	\N	100	6	2019-10-21 01:48:25	2019-10-21 01:48:25
36	Distributed Storage Markets	Distributed storage assets create a market for storage space\ndistributed globally across participating computers.	\N	100	6	2019-10-21 01:48:25	2019-10-21 01:48:25
37	Energy Markets	Energy market cryptoassets enable more efficient trading and\n    allocation of energy-grid resources without reliance on a traditional\n    middleman.	\N	100	6	2019-10-21 01:48:25	2019-10-21 01:48:25
38	Exchange Platforms	Not to be confused with decentralized exchange platforms this\n    sector refers to tokens that exist primarily on centralized exchanges for\n    use on those exchanges.	\N	100	6	2019-10-21 01:48:25	2019-10-21 01:48:25
39	Exchange Traded Funds (ETF's)	An ETF is a basket of securities that you can buy or sell\n    through a brokerage firm on an exchange	\N	100	6	2019-10-21 01:48:25	2019-10-21 01:48:25
40	Gambling Industry	Gaming/Gambling industry assets often use properties of\n    blockchains to achieve provably-fair gambling; a property unique to\n    blockchain-based gaming platforms.	\N	100	6	2019-10-21 01:48:25	2019-10-21 01:48:25
41	Gaming (non-gambling)	Assets focusing on enabling, or being used within, gaming platforms.	\N	100	6	2019-10-21 01:48:25	2019-10-21 01:48:25
42	General Purpose Platform	General purpose decentralized compute platforms operate as a\n    global computer, capable of executing arbitrary code - called smart\n    contracts or 'dapps'.	\N	100	6	2019-10-21 01:48:25	2019-10-21 01:48:25
43	Hedge Funds	A hedge fund is an actively managed basket of securities which\n    are permitted to short sell securites and construct advanced models &\n    systems including using derivatives(options, etc..) to manage risk and\n    return.	\N	100	6	2019-10-21 01:48:25	2019-10-21 01:48:25
44	Identity & Reputation	Decentralized identity and reputation systems use blockchain\n    networks to create identity records that aren't controlled by any single entity or group with reputation mechanisms for quality assurance.	\N	100	6	2019-10-21 01:48:26	2019-10-21 01:48:26
45	Internet of Things Sector	Internet-of-Things assets incentivize participation in IOT networks.	\N	100	6	2019-10-21 01:48:26	2019-10-21 01:48:26
46	Interoperability	Interoperability-focused blockchains provide services that can link one chain\nto another. These are often intended as core chains or platforms on which wider\necosystems of more use-case-specific chains can operate together.	\N	100	6	2019-10-21 01:48:26	2019-10-21 01:48:26
47	Lending Platforms	Blockchain lending platforms generally\ncollaterize loans using on-blockchain assets, but may offer other loans or\nlending functions using blockchain networks.	\N	100	6	2019-10-21 01:48:26	2019-10-21 01:48:26
48	Memes	Meme tokens. an element of a culture or system of behavior that may be\nconsidered to be passed from one individual to another by nongenetic means,\nespecially imitation.	\N	100	6	2019-10-21 01:48:26	2019-10-21 01:48:26
49	Misc	Very specific-focus assets which likely do not fit into a broader category.	\N	100	6	2019-10-21 01:48:26	2019-10-21 01:48:26
50	Onchain Governance	Onchain Governance assets incorporate the ability for various stakeholders to\ndirectly signal or vote for certain outcomes with respect to development of the\nprotocol/asset itself.	\N	100	6	2019-10-21 01:48:26	2019-10-21 01:48:26
51	Payment Platforms	Payment platforms are focused on payments, often for a specific use or\nindustry. Some blockchain-based payment platforms attempt to integrate multiple\nblockchain assets into one platform for ease of payment, possibly employing\nsmart-contracts for more complex applications.	\N	100	6	2019-10-21 01:48:26	2019-10-21 01:48:26
53	Prediction Markets	Decentralized prediction markets use onchain-assets to create economic\nincentives to correctly predict the outcome of events.	\N	100	6	2019-10-21 01:48:26	2019-10-21 01:48:26
52	Possible Scams	These assets show signs of being scams, and are either currently under\ninvestigation, or are 'near scams' where no explicit intent to decieve is known\nto OCFX, yet there's sufficient obvious misleading/improper conduct present to warrant this\nclassification.	\N	100	6	2019-10-21 01:48:26	2019-10-21 01:48:26
55	Scams	Scam chains are released with intentionally misleading or false\ninformation. Coins we list under this category must have well-documented\nhistories showing intent to deceive, and/or exhibit extraordinary claims with\nconsistent inability to produce evidence justifying such claims. Other coins &\nblockchain assets may also be scams. This list is not exhaustive.	\N	100	6	2019-10-21 01:48:26	2019-10-21 01:48:26
56	Timestamping Services	Timestamping services underpin decentralized digital-rights management by using\nthe permanence and irrefutability of blockchains to prove that a piece of\ncontent existed at a certain time.	\N	100	6	2019-10-21 01:48:26	2019-10-21 01:48:26
57	Mixed, Virtual & Augmented Reality	Assets focusing on enabling, or being used within, virtual reality or augmented\nreality platforms.	\N	100	6	2019-10-21 01:48:27	2019-10-21 01:48:27
58	Decentralized Apps (Dapps)	A decentralized application (Dapp, dApp or DApp) is an application that\n      is run by many users on a decentralized network with trustless protocols.\n      They are designed to avoid any single point of failure. They typically\n      have tokens to reward users for providing computing power.	\N	100	7	2019-10-21 01:48:27	2019-10-21 01:48:27
59	Cryptocurrencies	A digital currency in which encryption techniques are used\n      to regulate the generation of units of currency and verify the transfer\n      of funds, operating independently of a central bank.	\N	100	5	2019-10-21 01:48:28	2019-10-21 01:48:28
60	Crypto Regulation	A rule or directive made and maintained by an authority.	\N	100	5	2019-10-21 01:48:28	2019-10-21 01:48:28
61	Crypto Compliance	The act or process of complying to a desire, demand, proposal, or regimen or to\n  coercion.	\N	100	7	2019-10-21 01:48:28	2019-10-21 01:48:28
62	CryptoCloud	Crypto cloud computing is a secure cloud computing architecture. Cloud\n      computing is a large-scale distributed computing model that is driven by\n      economies of scale. It integrates a set of abstracted, virtualized,\n      dynamically-scalable, and managed resources, such as computing power, storage,\n      platforms, and services.	\N	100	123	2019-10-21 01:48:28	2019-10-21 01:48:28
63	Sustainability	Sustainable development is development that meets the needs of the\n      present without compromising the ability of future generations to meet\n      their own needs.	\N	100	5	2019-10-21 01:48:28	2019-10-21 01:48:28
64	Security	How, where, when, and why to store your cryptoassets, and how to protect yourself\n      from hackers.	\N	100	7	2019-10-21 01:48:28	2019-10-21 01:48:28
65	Network Ownership Effects	A network ownership effect describes when the utility of the service and\n      the value of ownership of the service increases for existing users when\n      new users join.	\N	100	7	2019-10-21 01:48:29	2019-10-21 01:48:29
66	Social Impact	A significant, positive change that addresses a pressing social challenge.	\N	100	5	2019-10-21 01:48:29	2019-10-21 01:48:29
67	ERC-XXX (Ethereum Request for Comments)	ERC stands for Ethereum Request for Comments, like the IETF's RFC\n    (https://www.ietf.org/rfc.html). An RFC is authored by engineers and computer\n    scientists in the form of a memorandum describing methods, behaviors, research,\n    or innovations applicable to the working of the Internet and Internet-connected\n    systems. It is submitted either for peer review or to convey new concepts,\n    information, or (occasionally) engineering humor	\N	100	7	2019-10-21 01:48:29	2019-10-21 01:48:29
68	DeFi (Decentralized Finance)	Decentralized finance is driving a more open economy.\n      One in which the people in a democracy can take control of their financial system\n      by building and using the tools to take control of their assets out of the hands of rent seeking\n      intermediaries and into their own, so they can make better decisions about them. It keeps\n      risk at the edge and not at the center of the financial system.	\N	100	\N	2019-10-21 01:48:29	2019-10-21 01:48:29
69	Game Theory	Simply put, game theory is the study of logical decision making made\n      by players within the defined parameters of a system (game, scenario,\n      etc). It uses mathematical models and can be applied to economics,\n      psychology, logic, computer science, distributed systems, and more.\n      Game theory can be seen as a microcosm of human behavior under set\n      circumstances wherein certain incentive structures and mechanisms can\n      lead to predictable and honest behavior by players.	\N	100	5	2019-10-21 01:48:29	2019-10-21 01:48:29
70	Robotics	An interdisciplinary branch of engineering and science that includes\n      mechanical engineering, electronics engineering, computer science, and\n      others.	\N	100	7	2019-10-21 01:48:29	2019-10-21 01:48:29
71	Internet of Things	The network of physical devices, vehicles, home appliances, and other items\n      embedded with electronics, software, sensors, actuators, and connectivity which\n      enables these things to connect and exchange data, creating opportunities for\n      more direct integration of the physical world into computer-based systems,\n      resulting in efficiency improvements, economic benefits, and reduced human\n      exertions.	\N	100	7	2019-10-21 01:48:29	2019-10-21 01:48:29
90	Fundamental Analysis	The valuation of a business based on intrinsic factors like current financial metrics,\n    quality of management, and economic forecasting. Extrinsic factors like the macro-economic environment are also taken into account.	\N	100	17	2019-10-21 01:48:30	2019-10-21 01:48:30
91	Technical Analysis	The valuation of a financial asset based on statistical measures and algorithms.	\N	100	17	2019-10-21 01:48:31	2019-10-21 01:48:31
92	Hybrid Analysis (Tech/Fundamental)	A combination of technical and fundamental analysis, usually in some interesting combination.	\N	100	17	2019-10-21 01:48:31	2019-10-21 01:48:31
93	Trend Following	An investment approach in which the central tendency of the movement in a financial asset is the principal factor.	\N	100	91	2019-10-21 01:48:31	2019-10-21 01:48:31
94	Price Driven TA	Technical Analysis where the price (and possibly its' first and second derivatives) is the focus of decision making activities.	\N	100	91	2019-10-21 01:48:31	2019-10-21 01:48:31
95	Indicator & Oscillator Driven TA	Technical Analysis where the focus is on (generally first-order) functions of price and its' corralaries.	\N	100	91	2019-10-21 01:48:31	2019-10-21 01:48:31
96	Volatility Based Indicators	Indicators derived from the magnitude of deviations in price	\N	100	91	2019-10-21 01:48:31	2019-10-21 01:48:31
97	Momentum Based Indicators	Indicators derived from the rate of change in price.	\N	100	91	2019-10-21 01:48:31	2019-10-21 01:48:31
98	Trend Based Indicators	Indicators dervied from the general direction or trajectory of price.	\N	100	91	2019-10-21 01:48:32	2019-10-21 01:48:32
99	Volume Based Indicators	Indicators based on and derived from the number of transactions over some period.	\N	100	91	2019-10-21 01:48:32	2019-10-21 01:48:32
100	Moving Averages	The central tendency in price over some period of time.	\N	100	91	2019-10-21 01:48:32	2019-10-21 01:48:32
101	Digital Signal Processing (DSP)	The decomposition of various financial asset time series into their component waveforms and analysed accordingly.	\N	100	91	2019-10-21 01:48:32	2019-10-21 01:48:32
102	Sentiment	The psychological and sociological world in which market participants operate.	\N	100	91	2019-10-21 01:48:32	2019-10-21 01:48:32
103	Elliot Wave	A theory based on collective impulses and their corresponding market patterns.	\N	100	91	2019-10-21 01:48:32	2019-10-21 01:48:32
104	Charting	The visual representations of financial data.	\N	100	91	2019-10-21 01:48:32	2019-10-21 01:48:32
105	Breadth	A measurement of aggregate conditions in markets the ratio of increasing to decreasing products is analysed.	\N	100	91	2019-10-21 01:48:32	2019-10-21 01:48:32
106	AI & Machine Learning (Technical Analysis)	The analysis of markets using models and algorithms based on brain functions.	\N	100	91	2019-10-21 01:48:33	2019-10-21 01:48:33
107	Backtesting	Evaluating assets over specific time periods by running tests, including injection of anomalies for tuning models.	\N	100	91	2019-10-21 01:48:33	2019-10-21 01:48:33
119	Risk Management	The prudent use of rationality in ones decision making processes in relation to finances. Careful evaluation of the risk/reward of a particular offering.	\N	100	2	2019-10-21 01:48:33	2019-10-21 01:48:33
120	Analytical Software Tools	The models, programs, frameworks, and products used to optimize a program of trading or investing.	\N	100	2	2019-10-21 01:48:33	2019-10-21 01:48:33
122	Swing Trading	Taking market positions over short to medium term periods (usually a few days to a few weeks).	\N	100	91	2019-10-21 01:48:33	2019-10-21 01:48:33
114	Discounted Cash Flow (DCF)	A method of financial asset valuation which discounts future cash flows.	\N	100	21	2019-10-21 01:48:34	2019-10-21 01:48:34
115	Net Present Value (NPV)	A method of financial asset valuation which determines the present value taking into account future earnings.	\N	100	21	2019-10-21 01:48:34	2019-10-21 01:48:34
116	Equation of Exchange	A method of financial asset valuation which is based on the velocity of money.	\N	100	21	2019-10-21 01:48:35	2019-10-21 01:48:35
113	Neural Networks	Algorithms which mimic human brain activity	\N	100	106	2019-10-21 01:48:35	2019-10-21 01:48:35
79	Fungible Tokens	Tokens which are perfectly interchangeable with other identical tokens. Do not need a central counterparty to confirm their authenticity.	\N	100	20	2019-10-21 01:48:37	2019-10-21 01:48:37
80	Utility Tokens	Tokens whose intended purpose is to provide access to an infrastructure or service via the blockchain.	\N	100	79	2019-10-21 01:48:37	2019-10-21 01:48:37
81	Payment Tokens	Tokens whose intended use is to provide a means of payment or value exchange.	\N	100	79	2019-10-21 01:48:37	2019-10-21 01:48:37
82	Asset-security Tokens	Umbrella term used to describe tokens which either confer a financial claim on\nan issuer or an asset which grants explicit governance rights to a token holder.	\N	100	79	2019-10-21 01:48:38	2019-10-21 01:48:38
83	Platform Tokens	These are tokens that are used to gain access to\n      general purpose decentralized networks for a wide range of possible\n      applications. As such, these platform utility tokens exhibit considerably\n      less centrality. Work Tokens include REP, MKR, KEEP, CIVIC, 0X, BAT, GOLEM, LPT, NUMERAIRE, ETH, EOS.\n      Usage Tokens include BTC, BTCash, LTC, NEM, IOTA, MNR, ETH, BAT, KIN, RNDR.	\N	100	80	2019-10-21 01:48:38	2019-10-21 01:48:38
84	Non-Platform Tokens	These tokens are open networks designed for a specific application or use\n      case. Decentralized exchange tokens are an example. Represents the\n      majority of current assets in the ecosystem.	\N	100	80	2019-10-21 01:48:38	2019-10-21 01:48:38
85	General Network Tokens	Open Networks designed for a specific application or use case.	\N	100	84	2019-10-21 01:48:38	2019-10-21 01:48:38
86	Defined Non-Platform Tokens	Defined Non-platform based utility tokens are similar to a\n    consumer token as the intended use is to provide access to a particular\n    (defined) set of goods or a service. The tokens here are used on the network\n    of a single project. However, they can become more “general” over time.	\N	100	84	2019-10-21 01:48:38	2019-10-21 01:48:38
87	Collateralized Tokens	Tokens that are collateralized by fiat (e.g. TrueUSD collateralized by USD)\nor non-fiat assets (e.g. Digix collateralized by gold).	\N	100	82	2019-10-21 01:48:38	2019-10-21 01:48:38
88	Tokenized Securities	Allow bonds, stocks, equities and commodities to be traded as digital tokens.\nTraditional legal frameworks and pricing methodologies exist for these assets.	\N	100	82	2019-10-21 01:48:38	2019-10-21 01:48:38
89	Share-like Tokens	Tokens that offer the rights to specific cash-flows (e.g. from centralized\nexchanges).	\N	100	82	2019-10-21 01:48:38	2019-10-21 01:48:38
72	Non-Fungible Tokens	Tokens that are unique and hence not interchangeable with any other\ntoken. Do not need a central counterparty to confirm their authenticity.	\N	100	20	2019-10-21 01:48:39	2019-10-21 01:48:39
73	Personal Tokens	Non Fungible Tokens that pertain to an attribute which is specific to a single entity; not\nmerely tokens that are unique, but tokens that are unique to a unique person, such as reputation and identity.	\N	100	72	2019-10-21 01:48:40	2019-10-21 01:48:40
74	Identity Tokens	Digital assets that represent the identity of specific individuals.	\N	100	73	2019-10-21 01:48:40	2019-10-21 01:48:40
75	Reputation Tokens	Digital assets that represent the reputation of specific individuals.	\N	100	73	2019-10-21 01:48:40	2019-10-21 01:48:40
76	Non-Personal Tokens	NFTs that are not unique to a particular entity	\N	100	72	2019-10-21 01:48:40	2019-10-21 01:48:40
77	Collectible Tokens	Tokens which are unique and not interchangeable with any other token can be digitally scarce and attract the\n    attention of collectors.	\N	100	76	2019-10-21 01:48:40	2019-10-21 01:48:40
78	Membership Tokens	NFT's that represent membership in some collective entity.	\N	100	76	2019-10-21 01:48:41	2019-10-21 01:48:41
133	Proof of Work	BTC, ETH, LTC, DOGE	\N	100	9	2019-10-21 01:48:41	2019-10-21 01:48:41
134	Proof of Stake	Decred, ETH, Peercoin	\N	100	9	2019-10-21 01:48:42	2019-10-21 01:48:42
135	Delegated Proof of Stake (DPoS)	Steemit, EOS, Bitshares	\N	100	9	2019-10-21 01:48:42	2019-10-21 01:48:42
136	Proof of Authority	POA.Network, Ethereum Kovan testnet, Vechain	\N	100	9	2019-10-21 01:48:42	2019-10-21 01:48:42
137	Proof of Weight (PoWeight)	Algorand, Filecoin, Chia	\N	100	9	2019-10-21 01:48:42	2019-10-21 01:48:42
138	Byzantine Fault Tolerance (BFT)	Sacrifices Decentralization for cheaper and faster transactions.\n    Centralized and closed membership. 1 recomended validator list chosen\n    by authority. Hyperledger, Stellar, Dispatch, Ripple	\N	100	9	2019-10-21 01:48:42	2019-10-21 01:48:42
139	Practical Byzantine Fault Tolerance (PBFT)	Decentralized alternative to BFT. Hyperledger Fabric	\N	100	9	2019-10-21 01:48:43	2019-10-21 01:48:43
140	Federated Byzantine Agreement (FBA)	No recommended validator, each validator chooses validators they\n    trust. Open membership network. Quorum slices allow for open membership decentralization.\n    Network allows growing decentralization. Stellar, Ripple	\N	100	9	2019-10-21 01:48:43	2019-10-21 01:48:43
141	Directed Acyclic Graph (DAG)	Iota, Hashgraph, Raiblocks/Nano	\N	100	9	2019-10-21 01:48:43	2019-10-21 01:48:43
142	Hybrid Proof of Work/Stake	PoW/PoS algorithms allow PoW minting to take place before switching to PoS, ETH (with Casper)	\N	100	9	2019-10-21 01:48:43	2019-10-21 01:48:43
143	Proof of Coordination	Covee	\N	100	9	2019-10-21 01:48:43	2019-10-21 01:48:43
15	Factor Investing	Factor investing is a strategy that chooses securities on\n      attributes that are associated with higher\n       returns. There are two main\n      types of factors that have driven returns of stocks, bonds, and other\n      assets; m\n      acroeconomic factors and style factors.	\N	100	17	2019-10-21 01:48:20	2021-02-07 17:19:07
150	Trend Analysis	As the adage goes, "The trend is your friend".\n        A trading approach where direction of movement of a financial asset is\n        the 1st and principal factor in trading decisions.	\N	100	129	2021-02-25 04:39:31	2021-02-25 04:39:31
151	Momentum Trading	Those assets showing greatest velocity and acceleration in change offer immense reward.	\N	100	129	2021-02-25 04:39:31	2021-02-25 04:39:31
152	Volatility Trading	High volatility brings high rewards. How to capture delta and find the\n    assets with the most potential movement in the near term.	\N	100	129	2021-02-25 04:39:31	2021-02-25 04:39:31
153	Day Trading	Finding cyclicality and recurring patterns for short term returns in 1-2 days.	\N	100	129	2021-02-25 04:39:31	2021-02-25 04:39:31
154	Swing Trades	Finding cyclicality and recurring patterns for the medium term returns. 1-2 weeks	\N	100	129	2021-02-25 04:39:31	2021-02-25 04:39:31
155	Earnings Trading	Using volatility around earnings to capture market value.	\N	100	129	2021-02-25 04:39:31	2021-02-25 04:39:31
156	Event Trading	Using volatility around important economic, geo-political, and other events to capture market value.	\N	100	129	2021-02-25 04:39:31	2021-02-25 04:39:31
157	Monte Carlo Simulation	Using statistical probabilities to simulate trading outcomes and find optimal control and prediction\n      of important risk factors.	\N	100	119	2021-02-25 04:39:31	2021-02-25 04:39:31
158	Types of Risk	Types of risk in financial risk management.	\N	100	119	2021-02-25 04:39:31	2021-02-25 04:39:31
159	Market Risk	Credit risk management is a profession that focuses on reducing and preventing losses by understanding and measuring the probability of those losses.	\N	100	158	2021-02-25 04:39:31	2021-02-25 04:39:31
160	Equity Risk	the risk that stock prices in general (not related to a particular company or industry) or the implied volatility will change	\N	100	158	2021-02-25 04:39:31	2021-02-25 04:39:31
161	Interest Rate Risk	Interest rate risk is the risk that interest rates or the implied volatility will change. The change in market rates and their impact on the probability of a bank, lead to interest rate risk.	\N	100	158	2021-02-25 04:39:31	2021-02-25 04:39:31
162	Currency Risk	Currency risk is the risk that foreign exchange rates or the implied volatility will change, which affects, for example, the value of an asset held in that currency	\N	100	158	2021-02-25 04:39:31	2021-02-25 04:39:31
163	Commodity Risk	Commodity risk is the risk that commodity prices (e.g. corn, copper, crude oil) or implied volatility will change.	\N	100	158	2021-02-25 04:39:31	2021-02-25 04:39:31
164	Foreign Exchange Risk	A foreign exchange hedge (also called a FOREX hedge) is a method used by companies to eliminate or "hedge" their foreign exchange risk resulting from transactions in foreign currencies (see foreign exchange derivative). This is done using either the cash flow hedge or the fair value method.	\N	100	158	2021-02-25 04:39:31	2021-02-25 04:39:31
168	Value at Risk	Value at risk (VaR) is a measure of the risk of loss for investments. It estimates how much a set of investments might lose (with a given probability), given normal market conditions, in a set time period such as a day. VaR is typically used by firms and regulators in the financial industry to gauge the amount of assets needed to cover possible losses.	\N	100	158	2021-02-25 04:39:31	2021-02-25 04:39:31
169	Risk Pools	A risk pool is one of the forms of risk management mostly practiced by insurance companies. Under this system, insurance companies come together to form a pool, which can provide protection to insurance companies against catastrophic risks such as floods or earthquakes.	\N	100	158	2021-02-25 04:39:31	2021-02-25 04:39:31
170	Liquidity Risk	This is the risk that a given security or asset cannot be traded quickly enough in the market to prevent a loss (or make the required profit).	\N	100	158	2021-02-25 04:39:31	2021-02-25 04:39:31
171	Inflation Risk	Inflationary risk is the risk that inflation will undermine an investment's returns through a decline in purchasing power. Bond payments are most at inflationary risk because their payouts are generally based on fixed interest rates and an increase in inflation diminishes their purchasing power	\N	100	158	2021-02-25 04:39:31	2021-02-25 04:39:31
172	Business Risk	Business risk is the exposure a company or organization has to factor(s) particular to it that will lower its profits or lead it to fail. Anything that threatens a company's ability to achieve its financial goals is considered a business risk.	\N	100	158	2021-02-25 04:39:31	2021-02-25 04:39:31
173	Legal Risk	Businesses do not operate in a vacuum and that, in the exploitation of opportunities and their engagement with other businesses, their activities tend to become subjects of legal liabilities and obligations	\N	100	158	2021-02-25 04:39:31	2021-02-25 04:39:31
174	Technological Risk	Information technology risk, IT risk, IT-related risk, or cyber risk is any risk related to information technology	\N	100	158	2021-02-25 04:39:31	2021-02-25 04:39:31
175	Reputational Risk	The potential loss to financial capital, social capital and/or market share resulting from damage to a firm's reputation.	\N	100	158	2021-02-25 04:39:31	2021-02-25 04:39:31
176	Sector Risk	Sector risk is the risk that one sector (like health care or technology) will fall in price at the same time because of an event that affects the entire industry.	\N	100	158	2021-02-25 04:39:31	2021-02-25 04:39:31
177	Operational Risk	Operational risk means the risk that a company or individual has to face due their own operation and decisions made for the investment.	\N	100	158	2021-02-25 04:39:31	2021-02-25 04:39:31
178	Automata	A concurrent multi-agent system for building trading systems on Elixir and OTP	\N	100	120	2021-02-25 04:39:31	2021-02-25 04:39:31
179	Keras	The high level package for Tensorflow™ that makes deep learning easy in python	\N	100	120	2021-02-25 04:39:31	2021-02-25 04:39:31
183	PyTorch	The high level package that makes deep learning easy in python	\N	100	120	2021-02-25 04:39:31	2021-02-25 04:39:31
184	Neural Nets	Algorithms which mimic human brain activity	\N	100	106	2021-02-25 04:39:31	2021-02-25 04:39:31
185	Architecture Search	Algorithms which mimic human brain activity	\N	100	106	2021-02-25 04:39:31	2021-02-25 04:39:31
186	Reinforcement Learning Systems	Algorithms which mimic human brain activity	\N	100	106	2021-02-25 04:39:31	2021-02-25 04:39:31
187	Multi-Agent Learning Systems	Algorithms which mimic human brain activity	\N	100	106	2021-02-25 04:39:31	2021-02-25 04:39:31
188	Evolutionary Computation	Algorithms which mimic human brain activity	\N	100	106	2021-02-25 04:39:31	2021-02-25 04:39:31
189	Genetic Algorithms	Algorithms which mimic the natural selection process	\N	100	190	2021-02-25 04:39:31	2021-02-25 04:39:31
190	Genetic Programming	In artificial intelligence, genetic programming (GP) is a technique of evolving programs, starting from a population of unfit (usually random) programs, fit for a particular task by applying operations analogous to natural genetic processes to the population of programs.	\N	100	190	2021-02-25 04:39:31	2021-02-25 04:39:31
191	Monte Carlo Methods	Algorithms which utilize statistical sampling to improve accuracy, precision, correctness	\N	100	106	2021-02-25 04:39:31	2021-02-25 04:39:31
192	Neuroevolution	Backpropagation-free form of architecture search for evolving generations of feed-forward neural networks	\N	100	106	2021-02-25 04:39:31	2021-02-25 04:39:31
165	Model Risk	Financial risk measurement, pricing of financial instruments, and portfolio selection are all based on statistical models. If the model is wrong, risk numbers, prices, or optimal portfolios are wrong. Model risk quantifies the consequences of using the wrong models in risk measurement, pricing, or portfolio selection.	\N	100	158	2021-02-25 04:39:31	2021-02-25 04:39:31
180	ScikitLearn	The package that makes many scientific and ML tasks easy in python	\N	100	120	2021-02-25 04:39:31	2021-02-25 04:39:31
166	Shape Risk	Shape risk in finance is a type of basis risk when hedging a load profile with standard hedging products having a lower granularity.	\N	100	158	2021-02-25 04:39:31	2021-02-25 04:39:31
181	Julia Lang	The high level language for high performance scientific computing	\N	100	120	2021-02-25 04:39:31	2021-02-25 04:39:31
167	Volatility Risk	Volatility risk is the risk of a change of price of a portfolio as a result of changes in the volatility of a risk factor. It usually applies to portfolios of derivatives instruments, where the volatility of its underlying is a major influencer of prices.	\N	100	158	2021-02-25 04:39:31	2021-02-25 04:39:31
182	Spark	The system level component that made streaming AI relevant	\N	100	120	2021-02-25 04:39:31	2021-02-25 04:39:31
193	Global CryptoAssets	Cryptoassets currently available on exchanges worldwide	\N	100	\N	2021-02-25 16:12:22	2021-02-25 16:12:22
194	DFINITY (DFN)	DFINITY, a global internet computer that aims to reinvent the internet as a\n      computer that runs secure software with superpowers, is developing the ICP protocol (Internet Computer Protocol) that makes\n      it possible for independent data centers to combine the capacity of millions of\n      standardized computers to add native, universal, secure and seamless serverless\n      cloud functionality to the Internet - in much the same way TCP/IP protocols\n      combine private networks to provide the public Internet connectivity we rely on\n      today. Adding cloud functionality\n      to the Internet using a secure crypto-based protocol provides a tamperproof\n      environment where hackproof and unstoppable software can be created. The\n      objective of the DFINITY project is to enable the Internet to natively host the\n      world's next generation of software systems, mass market Internet services, and\n      data	\N	100	193	2021-02-25 17:00:43	2021-02-25 17:00:43
195	OCEAN (OCN)	OCEAN is a Decentralized Data Exchange Protocol to Unlock Data for AI.\nOcean Protocol is kickstarting a Data Economy by breaking down data silos and equalizing access to data for all.	\N	100	193	2021-02-25 17:00:43	2021-02-25 17:00:43
196	COSMOS (ATOM)	COSMOS is building customizable, interoperable ecosystem of connected blockchains.	\N	100	193	2021-02-25 17:00:43	2021-02-25 17:00:43
197	POLKADOT (DOT)	POLKADOT is empowering blockchain networks to work together under the protection of shared security. A united network of state machines,\n      the platform enables autonomous economies to develop within fairer peer-to-peer digital jurisdictions.	\N	100	193	2021-02-25 17:00:43	2021-02-25 17:00:43
198	TEZOS (XTZ)	TEZOS is an open-source platform for assets and applications backed by a global community of validators, researchers, and builders.	\N	100	193	2021-02-25 17:00:43	2021-02-25 17:00:43
199	0x (ZRX)	0x is an open protocol that enables the peer-to-peer exchange of assets on the\nEthereum blockchain. Anyone in the world can use 0x to service a wide variety of\nmarkets ranging from gaming items to financial instruments to assets that could\nhave never existed before.	\N	100	193	2021-02-25 17:00:43	2021-02-25 17:00:43
200	BITCOIN (BTC)	Bitcoin is a cryptocurrency, a form of electronic cash. It is a decentralized digital currency without a central bank or single administrator. Bitcoin is often call "Digital Gold" due to the core teams focus on the properties of\n      decentralized systems that support a cryptocurrency being classifed as a 'Store of Value'	\N	100	193	2021-02-25 17:00:43	2021-02-25 17:00:43
201	BITCOIN CASH (BCH)	In mid-2017, a group of developers wanting to increase bitcoin's block size limit prepared a code change. The change, called a hard fork, took effect on 1 August 2017.\n      BCH is aiming to be the fork of bitcoin that is most cash like for use in payments systems.	\N	100	193	2021-02-25 17:00:43	2021-02-25 17:00:43
202	EOSIO (EOS)	EOSIO (EOS), is built for public or private blockchain networks, customizable to suit your business needs.	\N	100	193	2021-02-25 17:00:43	2021-02-25 17:00:43
203	ETHEREUM (ETH)	Ethereum is a global, open-source platform for decentralized applications. On Ethereum, you can write code that controls digital value, runs exactly as programmed, and is accessible anywhere in the world.	\N	100	193	2021-02-25 17:00:43	2021-02-25 17:00:43
204	STORJ (SJCX)	Storj Labs is the provider of the Storj decentralized cloud storage network, and the company behind STORJ token, a cryptocurrency on the Ethereum blockchain that powers digital storage and data retrieval on its cloud storage platform.	\N	100	193	2021-02-25 17:00:43	2021-02-25 17:00:43
205	GOLEM (GNT)	GOLEM is the provider of peer-to-peer computing power analogous to cloud compute platforms such as EC2 and GCE.	\N	100	193	2021-02-25 17:00:43	2021-02-25 17:00:43
206	FILECOIN (FIL)	Filecoin (⨎) is an open-source, public, cryptocurrency and digital payment system intended to be a blockchain-based cooperative digital storage and data retrieval method. 	\N	100	193	2021-02-25 17:00:43	2021-02-25 17:00:43
207	ARAGON (ANT)	Aragon is an open-source software project that allows for the creation and management of decentralized organizations.	\N	100	193	2021-02-25 17:00:43	2021-02-25 17:00:43
208	BLOXROUTE (BLXR)	BLOXROUTE (BLXR) is a Blockchain Distribution Network (BDN), a first-of-its-kind security token that distributes revenues associated with the cryptocurrencies using bloXroute's Blockchain Distribution Network (BDN) to the wider blockchain community. We believe that the BLXR token gives the project a business model which aligns incentives for a broad base of network participants.	\N	100	193	2021-02-25 17:00:43	2021-02-25 17:00:43
\.


--
-- Name: topics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.topics_id_seq', 1, false);


--
-- Data for Name: topics_threads; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.topics_threads (id, user_id, thread_id, topic_id, inserted_at, updated_at) FROM stdin;
\.


--
-- Name: topics_threads_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.topics_threads_id_seq', 1, false);


--
-- Data for Name: topics_tokens; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.topics_tokens (id, topic_id, token_id, inserted_at, updated_at) FROM stdin;
1	193	1	2021-02-25 17:00:29	2021-02-25 17:00:29
2	193	2	2021-02-25 17:00:29	2021-02-25 17:00:29
3	193	3	2021-02-25 17:00:29	2021-02-25 17:00:29
4	193	4	2021-02-25 17:00:29	2021-02-25 17:00:29
5	193	5	2021-02-25 17:00:29	2021-02-25 17:00:29
6	193	6	2021-02-25 17:00:29	2021-02-25 17:00:29
7	193	7	2021-02-25 17:00:29	2021-02-25 17:00:29
8	193	8	2021-02-25 17:00:29	2021-02-25 17:00:29
9	193	9	2021-02-25 17:00:29	2021-02-25 17:00:29
10	193	10	2021-02-25 17:00:29	2021-02-25 17:00:29
11	193	11	2021-02-25 17:00:29	2021-02-25 17:00:29
13	193	13	2021-02-25 17:00:29	2021-02-25 17:00:29
14	193	14	2021-02-25 17:00:29	2021-02-25 17:00:29
15	193	15	2021-02-25 17:00:29	2021-02-25 17:00:29
\.


--
-- Name: topics_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.topics_tokens_id_seq', 15, true);


--
-- Data for Name: user_groups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.user_groups (id, member_id, member_type, group_id, group_type, inserted_at, updated_at) FROM stdin;
\.


--
-- Name: user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.user_groups_id_seq', 1, false);


--
-- Data for Name: user_portfolios; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.user_portfolios (id, portfolio_id, user_id, inserted_at, updated_at) FROM stdin;
\.


--
-- Name: user_portfolios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.user_portfolios_id_seq', 1, false);


--
-- Data for Name: user_profiles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.user_profiles (id, user_id, inserted_at, updated_at) FROM stdin;
1	18	2019-12-11 17:34:41	2019-12-11 17:34:41
2	19	2019-12-11 22:34:31	2019-12-11 22:34:31
3	20	2019-12-12 06:52:09	2019-12-12 06:52:09
4	21	2019-12-31 22:56:59	2019-12-31 22:56:59
5	22	2020-01-12 01:40:31	2020-01-12 01:40:31
6	23	2020-01-14 01:58:34	2020-01-14 01:58:34
7	24	2020-01-22 09:10:06	2020-01-22 09:10:06
8	26	2020-02-19 01:18:34	2020-02-19 01:18:34
9	28	2020-04-20 22:49:44	2020-04-20 22:49:44
10	29	2020-05-02 06:40:28	2020-05-02 06:40:28
11	31	2020-05-03 12:57:34	2020-05-03 12:57:34
12	32	2020-06-04 23:24:41	2020-06-04 23:24:41
13	34	2020-06-19 02:10:38	2020-06-19 02:10:38
14	38	2020-06-20 22:18:18	2020-06-20 22:18:18
15	40	2020-07-04 14:50:08	2020-07-04 14:50:08
16	41	2020-08-01 13:20:33	2020-08-01 13:20:33
17	44	2020-09-17 16:03:28	2020-09-17 16:03:28
18	45	2020-09-18 17:12:44	2020-09-18 17:12:44
19	46	2020-09-19 18:11:22	2020-09-19 18:11:22
20	47	2020-09-21 00:20:13	2020-09-21 00:20:13
21	49	2020-09-22 09:58:29	2020-09-22 09:58:29
22	50	2020-09-28 16:10:15	2020-09-28 16:10:15
23	51	2020-10-19 04:15:33	2020-10-19 04:15:33
24	52	2020-11-01 23:51:08	2020-11-01 23:51:08
25	54	2020-12-05 13:05:23	2020-12-05 13:05:23
26	55	2021-01-05 19:38:02	2021-01-05 19:38:02
27	56	2021-01-10 14:19:07	2021-01-10 14:19:07
28	57	2021-01-23 18:45:04	2021-01-23 18:45:04
29	59	2021-01-28 06:00:19	2021-01-28 06:00:19
30	60	2021-01-30 19:55:26	2021-01-30 19:55:26
31	61	2021-02-10 19:00:58	2021-02-10 19:00:58
32	62	2021-02-23 08:10:19	2021-02-23 08:10:19
33	63	2021-03-03 14:06:39	2021-03-03 14:06:39
34	65	2021-03-08 19:58:45	2021-03-08 19:58:45
35	66	2021-03-20 11:11:41	2021-03-20 11:11:41
36	67	2021-03-20 22:07:22	2021-03-20 22:07:22
37	68	2021-03-21 10:24:14	2021-03-21 10:24:14
38	69	2021-03-24 17:32:35	2021-03-24 17:32:35
39	70	2021-03-29 21:46:09	2021-03-29 21:46:09
40	71	2021-04-07 21:47:44	2021-04-07 21:47:44
41	72	2021-04-16 08:29:16	2021-04-16 08:29:16
42	73	2021-04-18 20:35:42	2021-04-18 20:35:42
43	74	2021-04-21 03:28:04	2021-04-21 03:28:04
44	75	2021-05-02 05:11:03	2021-05-02 05:11:03
45	76	2021-05-23 00:12:23	2021-05-23 00:12:23
46	77	2021-06-12 00:25:24	2021-06-12 00:25:24
47	78	2021-06-30 18:25:04	2021-06-30 18:25:04
48	79	2021-07-09 20:09:49	2021-07-09 20:09:49
49	80	2021-07-20 06:47:59	2021-07-20 06:47:59
50	81	2021-08-24 05:28:07	2021-08-24 05:28:07
51	82	2021-08-24 17:56:51	2021-08-24 17:56:51
52	83	2021-09-01 04:12:32	2021-09-01 04:12:32
53	84	2021-09-01 19:39:07	2021-09-01 19:39:07
54	85	2021-09-03 03:51:31	2021-09-03 03:51:31
55	86	2021-09-04 04:31:31	2021-09-04 04:31:31
56	87	2021-09-12 12:57:01	2021-09-12 12:57:01
57	88	2021-09-12 22:02:53	2021-09-12 22:02:53
58	89	2021-09-18 18:18:49	2021-09-18 18:18:49
59	90	2021-09-20 04:04:46	2021-09-20 04:04:46
60	91	2021-09-29 09:38:28	2021-09-29 09:38:28
61	92	2021-10-04 01:19:54	2021-10-04 01:19:54
62	93	2021-10-04 07:26:07	2021-10-04 07:26:07
63	94	2021-10-06 23:02:49	2021-10-06 23:02:49
64	96	2021-10-10 00:52:19	2021-10-10 00:52:19
65	97	2021-10-21 18:04:47	2021-10-21 18:04:47
66	98	2021-10-27 17:58:03	2021-10-27 17:58:03
67	99	2021-11-02 09:49:04	2021-11-02 09:49:04
68	100	2021-11-04 16:46:23	2021-11-04 16:46:23
\.


--
-- Name: user_profiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.user_profiles_id_seq', 68, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (id, email, first_name, last_name, nickname, phone, avatar_url, terms_accepted, confirmation_token, confirmation_sent_at, confirmed_at, reset_password_token, reset_password_sent_at, sign_in_count, last_sign_in_ip, last_sign_in_at, current_sign_in_ip, current_sign_in_at, inserted_at, updated_at) FROM stdin;
14	bobenny77@gmail.com	\N	\N	bobenny	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	2019-10-31 20:52:49	2019-10-31 20:52:49
15	scottthomas10001@gmail.com	\N	\N	scottyP	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	2019-12-11 12:36:35	2019-12-11 12:36:35
18	ericsteen1@gmail.com	\N	\N	upstarter	\N	\N	t	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	2019-12-11 17:34:41	2019-12-11 17:34:41
19	freddyfingers@fred.com	\N	\N	ericsteen1@gmail.com	\N	\N	t	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	2019-12-11 22:34:31	2019-12-11 22:34:31
20	rubycoder1@gmail.com	\N	\N	elixir_coder	\N	\N	t	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	2019-12-12 06:52:09	2019-12-12 06:52:09
21	luisherrera722@gmail.com	\N	\N	luuisss	\N	\N	t	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	2019-12-31 22:56:59	2019-12-31 22:56:59
22	CEYSCEYS2013@GMAIL.COM	\N	\N	CEYS2020	\N	\N	t	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	2020-01-12 01:40:31	2020-01-12 01:40:31
23	canaan.hourani@datadoghq.com	\N	\N	MonitorMan007	\N	\N	t	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	2020-01-14 01:58:34	2020-01-14 01:58:34
24	DTSERVICEON@GMAIL.COM	\N	\N	edmon	\N	\N	t	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	2020-01-22 09:10:06	2020-01-22 09:10:06
26	cryptosandwich@nodeshare.in	\N	\N	cryptosandwich	\N	\N	t	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	2020-02-19 01:18:34	2020-02-19 01:18:34
28	barre0409@gmail.com	\N	\N	barre0409	\N	\N	t	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	2020-04-20 22:49:44	2020-04-20 22:49:44
29	isaiahflo9@gmail.com	\N	\N	isaiahflo9@gmail.com	\N	\N	t	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	2020-05-02 06:40:28	2020-05-02 06:40:28
31	okrim.info@gmail.com	\N	\N	mirkopop	\N	\N	t	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	2020-05-03 12:57:34	2020-05-03 12:57:34
32	allstar3004@gmail.com	\N	\N	allstar3004	\N	\N	t	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	2020-06-04 23:24:41	2020-06-04 23:24:41
34	alexise.simpson@gmail.com	\N	\N	christos999	\N	\N	t	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	2020-06-19 02:10:38	2020-06-19 02:10:38
38	ikebailey@gmail.com	\N	\N	Ikasiemj	\N	\N	t	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	2020-06-20 22:18:18	2020-06-20 22:18:18
40	carrollmarlin@yahoo.com	\N	\N	cmarlin3	\N	\N	t	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	2020-07-04 14:50:08	2020-07-04 14:50:08
41	Rolandbenjamin735@gmail.com	\N	\N	Smith	\N	\N	t	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	2020-08-01 13:20:33	2020-08-01 13:20:33
44	mz.nikolovski+cwise@gmail.com	\N	\N	mzniko	\N	\N	t	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	2020-09-17 16:03:28	2020-09-17 16:03:28
45	leobessa@gmail.com	\N	\N	leobessa	\N	\N	t	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	2020-09-18 17:12:44	2020-09-18 17:12:44
46	tcaldwe9@vols.utk.edu	\N	\N	DeadliftsAndAnalysis	\N	\N	t	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	2020-09-19 18:11:22	2020-09-19 18:11:22
47	yusefnathanson@me.com	\N	\N	Yusef	\N	\N	t	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	2020-09-21 00:20:13	2020-09-21 00:20:13
49	e@lnz.me	\N	\N	norbu09	\N	\N	t	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	2020-09-22 09:58:29	2020-09-22 09:58:29
50	lovehongkong@yandex.ru	\N	\N	annashui	\N	\N	t	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	2020-09-28 16:10:15	2020-09-28 16:10:15
51	opalaleka@gmail.com	\N	\N	Opal	\N	\N	t	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	2020-10-19 04:15:33	2020-10-19 04:15:33
52	Sander1784@live.nl	\N	\N	Scopes	\N	\N	t	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	2020-11-01 23:51:07	2020-11-01 23:51:07
54	rsrgrz@protonmail.com	\N	\N	tosho	\N	\N	t	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	2020-12-05 13:05:22	2020-12-05 13:05:22
55	relinte20@gmail.com	\N	\N	ternbl	\N	\N	t	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	2021-01-05 19:38:02	2021-01-05 19:38:02
56	laszlo.kocsis120@gmail.com	\N	\N	KocsisL	\N	\N	t	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	2021-01-10 14:19:07	2021-01-10 14:19:07
57	hazim_alsayed@hotmail.com	\N	\N	hazim0001	\N	\N	t	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	2021-01-23 18:45:04	2021-01-23 18:45:04
59	jack@daliavations.com	\N	\N	jbstein	\N	\N	t	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	2021-01-28 06:00:19	2021-01-28 06:00:19
60	xsincerex1990@gmail.com	\N	\N	xsincerex1990	\N	\N	t	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	2021-01-30 19:55:26	2021-01-30 19:55:26
61	deniz703@live.nl	\N	\N	Deniz703	\N	\N	t	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	2021-02-10 19:00:58	2021-02-10 19:00:58
62	rafizadeh.ahmad@gmail.com	\N	\N	rafizadeh	\N	\N	t	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	2021-02-23 08:10:19	2021-02-23 08:10:19
63	rjstritzinger@gmail.com	\N	\N	Awesome1	\N	\N	t	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	2021-03-03 14:06:39	2021-03-03 14:06:39
65	enagicrypt@protonmail.com	\N	\N	Enagicrypt	\N	\N	t	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	2021-03-08 19:58:45	2021-03-08 19:58:45
66	ansrlfwo@gmail.com	\N	\N	rulecc	\N	\N	t	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	2021-03-20 11:11:41	2021-03-20 11:11:41
67	otnieljigoria@ahoo.com	\N	\N	otnieljigoria	\N	\N	t	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	2021-03-20 22:07:22	2021-03-20 22:07:22
68	writetomarwah@gmail.com	\N	\N	maniee	\N	\N	t	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	2021-03-21 10:24:14	2021-03-21 10:24:14
69	nomoreavacado@gmail.com	\N	\N	Saad5987	\N	\N	t	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	2021-03-24 17:32:35	2021-03-24 17:32:35
70	digial@live.nl	\N	\N	digital	\N	\N	t	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	2021-03-29 21:46:09	2021-03-29 21:46:09
71	regineakinbobami@hotmail.com	\N	\N	Reineabby	\N	\N	t	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	2021-04-07 21:47:44	2021-04-07 21:47:44
72	ayalan0909@gmail.com	\N	\N	ay9599	\N	\N	t	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	2021-04-16 08:29:16	2021-04-16 08:29:16
73	steven_adams@btinternet.com	\N	\N	sza1	\N	\N	t	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	2021-04-18 20:35:42	2021-04-18 20:35:42
74	jessynikho@gmail.com	\N	\N	Firelight23	\N	\N	t	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	2021-04-21 03:28:04	2021-04-21 03:28:04
75	kovacmichal809@gmail.com	\N	\N	Kovecka	\N	\N	t	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	2021-05-02 05:11:03	2021-05-02 05:11:03
76	onkar.ad.2016@gmail.com	\N	\N	Kittu	\N	\N	t	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	2021-05-23 00:12:23	2021-05-23 00:12:23
77	john23181010@gmail.com	\N	\N	Mrjohn23 	\N	\N	t	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	2021-06-12 00:25:24	2021-06-12 00:25:24
78	Farshad983@yahoo.xom	\N	\N	Farshad983	\N	\N	t	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	2021-06-30 18:25:04	2021-06-30 18:25:04
79	Booalisadra@gmail.com	\N	\N	Rad	\N	\N	t	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	2021-07-09 20:09:49	2021-07-09 20:09:49
80	transstorytelling@gmail.com	\N	\N	transstorytelling	\N	\N	t	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	2021-07-20 06:47:59	2021-07-20 06:47:59
81	niclk6@gmail.com	\N	\N	Boostx	\N	\N	t	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	2021-08-24 05:28:07	2021-08-24 05:28:07
82	rzorrilla3@gmail.com	\N	\N	ralph115	\N	\N	t	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	2021-08-24 17:56:51	2021-08-24 17:56:51
83	darius.tabatabai@gmail.com	\N	\N	dt1982	\N	\N	t	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	2021-09-01 04:12:32	2021-09-01 04:12:32
84	park-mike@outlook.com	\N	\N	Mike	\N	\N	t	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	2021-09-01 19:39:07	2021-09-01 19:39:07
85	Ricksnipes@outlook.com	\N	\N	Ricx	\N	\N	t	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	2021-09-03 03:51:31	2021-09-03 03:51:31
86	farhan77@hotmail.com	\N	\N	farhan77	\N	\N	t	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	2021-09-04 04:31:31	2021-09-04 04:31:31
87	vasspolka@gmail.com	\N	\N	vasspilka	\N	\N	t	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	2021-09-12 12:57:01	2021-09-12 12:57:01
88	gagansaini2016@gmail.com	\N	\N	Saini	\N	\N	t	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	2021-09-12 22:02:53	2021-09-12 22:02:53
89	michaelconception@gmail.com	\N	\N	Mconcept90 	\N	\N	t	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	2021-09-18 18:18:49	2021-09-18 18:18:49
90	juanyi.loke@mail.utoronto.ca	\N	\N	lokejuan	\N	\N	t	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	2021-09-20 04:04:46	2021-09-20 04:04:46
91	lloydbunnie@hotmail.co.uk	\N	\N	CryptoBunn	\N	\N	t	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	2021-09-29 09:38:28	2021-09-29 09:38:28
92	pokemasterLJ@gmail.com	\N	\N	Cblaze	\N	\N	t	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	2021-10-04 01:19:54	2021-10-04 01:19:54
93	mbachusmart4@gmail.com	\N	\N	habiba  aisha	\N	\N	t	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	2021-10-04 07:26:07	2021-10-04 07:26:07
94	akira.ito0116@gmail.com	\N	\N	akira	\N	\N	t	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	2021-10-06 23:02:49	2021-10-06 23:02:49
96	athmanka9@gmail.com	\N	\N	atman	\N	\N	t	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	2021-10-10 00:52:19	2021-10-10 00:52:19
97	ojumumayowavincent@gmail.com	\N	\N	Vincer2200	\N	\N	t	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	2021-10-21 18:04:47	2021-10-21 18:04:47
98	Kregar1987@gmail.com	\N	\N	Ak187HasHisNice$	\N	\N	t	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	2021-10-27 17:58:03	2021-10-27 17:58:03
99	Liuprpt01@gmail.com	\N	\N	Liuprpt	\N	\N	t	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	2021-11-02 09:49:04	2021-11-02 09:49:04
100	kinghazza3rd@outlook.com	\N	\N	HazzaBombazza	\N	\N	t	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	2021-11-04 16:46:23	2021-11-04 16:46:23
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 100, true);


--
-- Data for Name: users_roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users_roles (id, user_id, role_id, user_profile_id, active, type, status, inserted_at, updated_at) FROM stdin;
1	19	2	2	t	basic	initial	2019-12-12 06:46:37	2019-12-12 06:46:37
2	19	4	2	t	basic	initial	2019-12-12 06:46:50	2019-12-12 06:46:50
4	18	2	1	t	basic	initial	2019-12-22 23:59:12	2019-12-22 23:59:14
5	24	1	7	f	basic	initial	2020-01-22 09:12:23	2020-01-22 09:12:23
6	24	2	7	t	basic	initial	2020-01-22 09:12:27	2020-01-22 09:12:27
7	24	4	7	t	basic	initial	2020-01-22 09:12:29	2020-01-22 09:12:29
8	26	3	8	t	basic	initial	2020-02-19 01:31:35	2020-02-19 01:31:35
3	18	1	1	f	basic	initial	2019-12-16 06:31:07	2020-05-05 03:27:35
9	18	4	1	t	basic	initial	2020-05-05 03:27:39	2020-05-05 03:27:39
10	18	5	1	t	basic	initial	2020-05-05 03:27:42	2020-05-05 03:27:42
11	18	3	1	t	basic	initial	2020-05-05 03:27:45	2020-05-05 03:27:45
12	47	1	20	f	basic	initial	2020-09-21 00:24:25	2020-09-21 00:24:26
13	49	1	21	t	basic	initial	2020-09-22 10:01:02	2020-09-22 10:01:02
15	50	1	22	t	basic	initial	2020-09-28 16:24:32	2020-09-28 16:24:32
14	50	3	22	t	basic	initial	2020-09-28 16:24:30	2020-09-28 16:24:34
16	69	2	38	t	basic	initial	2021-03-24 17:33:08	2021-03-24 17:33:08
17	69	1	38	t	basic	initial	2021-03-24 17:33:14	2021-03-24 17:33:14
18	69	4	38	t	basic	initial	2021-03-24 17:33:20	2021-03-24 17:33:20
19	69	5	38	t	basic	initial	2021-03-24 17:33:22	2021-03-24 17:33:22
20	69	3	38	t	basic	initial	2021-03-24 17:33:24	2021-03-24 17:33:24
21	72	2	41	t	basic	initial	2021-04-16 08:33:25	2021-04-16 08:33:25
23	72	4	41	t	basic	initial	2021-04-16 08:33:31	2021-04-16 08:33:31
24	72	3	41	t	basic	initial	2021-04-16 08:33:36	2021-04-16 08:33:36
22	72	5	41	t	basic	initial	2021-04-16 08:33:29	2021-04-16 08:33:37
25	72	1	41	t	basic	initial	2021-04-16 08:33:38	2021-04-16 08:33:38
26	80	1	49	t	basic	initial	2021-07-20 06:48:22	2021-07-20 06:48:22
27	80	4	49	t	basic	initial	2021-07-20 06:48:26	2021-07-20 06:48:26
28	80	2	49	t	basic	initial	2021-07-20 06:48:29	2021-07-20 06:48:29
29	80	3	49	t	basic	initial	2021-07-20 06:48:30	2021-07-20 06:48:30
30	80	5	49	t	basic	initial	2021-07-20 06:48:32	2021-07-20 06:48:32
31	84	1	53	t	basic	initial	2021-09-01 19:40:29	2021-09-01 19:40:50
32	84	3	53	t	basic	initial	2021-09-01 19:40:51	2021-09-01 19:40:51
33	84	2	53	t	basic	initial	2021-09-01 19:40:53	2021-09-01 19:40:53
34	84	4	53	t	basic	initial	2021-09-01 19:40:55	2021-09-01 19:40:55
35	84	5	53	t	basic	initial	2021-09-01 19:40:56	2021-09-01 19:40:56
\.


--
-- Name: users_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_roles_id_seq', 35, true);


--
-- Data for Name: users_tokens; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users_tokens (id, token_id, user_id, inserted_at, updated_at) FROM stdin;
\.


--
-- Name: users_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_tokens_id_seq', 1, false);


--
-- Data for Name: users_topics; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users_topics (id, topic_id, user_id, inserted_at, updated_at) FROM stdin;
37	17	14	2019-10-31 20:52:50	2019-10-31 20:52:50
38	127	14	2019-10-31 20:52:50	2019-10-31 20:52:50
39	59	14	2019-10-31 20:52:50	2019-10-31 20:52:50
40	4	15	2019-12-11 12:36:36	2019-12-11 12:36:36
41	59	15	2019-12-11 12:36:36	2019-12-11 12:36:36
42	120	15	2019-12-11 12:36:36	2019-12-11 12:36:36
43	15	15	2019-12-11 12:36:36	2019-12-11 12:36:36
44	1	15	2019-12-11 12:36:36	2019-12-11 12:36:36
45	17	15	2019-12-11 12:36:36	2019-12-11 12:36:36
46	20	15	2019-12-11 12:36:36	2019-12-11 12:36:36
47	5	15	2019-12-11 12:36:36	2019-12-11 12:36:36
48	6	15	2019-12-11 12:36:36	2019-12-11 12:36:36
49	71	15	2019-12-11 12:36:36	2019-12-11 12:36:36
50	125	15	2019-12-11 12:36:36	2019-12-11 12:36:36
51	10	15	2019-12-11 12:36:36	2019-12-11 12:36:36
52	112	15	2019-12-11 12:36:36	2019-12-11 12:36:36
53	91	15	2019-12-11 12:36:36	2019-12-11 12:36:36
54	70	15	2019-12-11 12:36:36	2019-12-11 12:36:36
55	69	15	2019-12-11 12:36:36	2019-12-11 12:36:36
56	7	15	2019-12-11 12:36:36	2019-12-11 12:36:36
57	16	15	2019-12-11 12:36:36	2019-12-11 12:36:36
58	131	15	2019-12-11 12:36:36	2019-12-11 12:36:36
59	63	15	2019-12-11 12:36:36	2019-12-11 12:36:36
60	2	15	2019-12-11 12:36:36	2019-12-11 12:36:36
61	147	15	2019-12-11 12:36:36	2019-12-11 12:36:36
62	62	15	2019-12-11 12:36:36	2019-12-11 12:36:36
63	61	15	2019-12-11 12:36:36	2019-12-11 12:36:36
64	128	15	2019-12-11 12:36:36	2019-12-11 12:36:36
65	123	15	2019-12-11 12:36:36	2019-12-11 12:36:36
66	18	15	2019-12-11 12:36:36	2019-12-11 12:36:36
67	124	15	2019-12-11 12:36:36	2019-12-11 12:36:36
68	67	15	2019-12-11 12:36:36	2019-12-11 12:36:36
69	129	15	2019-12-11 12:36:36	2019-12-11 12:36:36
70	60	15	2019-12-11 12:36:36	2019-12-11 12:36:36
71	8	15	2019-12-11 12:36:36	2019-12-11 12:36:36
72	147	18	2019-12-11 17:34:42	2019-12-11 17:34:42
73	123	18	2019-12-11 17:34:42	2019-12-11 17:34:42
74	7	18	2019-12-11 17:34:42	2019-12-11 17:34:42
75	6	18	2019-12-11 17:34:42	2019-12-11 17:34:42
76	130	18	2019-12-11 17:34:42	2019-12-11 17:34:42
77	129	18	2019-12-11 17:34:42	2019-12-11 17:34:42
78	13	18	2019-12-11 17:34:42	2019-12-11 17:34:42
79	5	18	2019-12-11 17:34:42	2019-12-11 17:34:42
80	11	18	2019-12-11 17:34:42	2019-12-11 17:34:42
81	3	18	2019-12-11 17:34:42	2019-12-11 17:34:42
82	149	18	2019-12-11 17:34:42	2019-12-11 17:34:42
83	124	18	2019-12-11 17:34:42	2019-12-11 17:34:42
84	131	18	2019-12-11 17:34:42	2019-12-11 17:34:42
85	112	18	2019-12-11 17:34:42	2019-12-11 17:34:42
86	91	18	2019-12-11 17:34:42	2019-12-11 17:34:42
87	132	18	2019-12-11 17:34:42	2019-12-11 17:34:42
88	90	18	2019-12-11 17:34:42	2019-12-11 17:34:42
89	61	18	2019-12-11 17:34:42	2019-12-11 17:34:42
90	64	18	2019-12-11 17:34:42	2019-12-11 17:34:42
91	72	18	2019-12-11 17:34:42	2019-12-11 17:34:42
92	14	18	2019-12-11 17:34:42	2019-12-11 17:34:42
93	111	18	2019-12-11 17:34:42	2019-12-11 17:34:42
94	63	18	2019-12-11 17:34:42	2019-12-11 17:34:42
95	125	18	2019-12-11 17:34:42	2019-12-11 17:34:42
96	9	18	2019-12-11 17:34:42	2019-12-11 17:34:42
97	20	18	2019-12-11 17:34:42	2019-12-11 17:34:42
98	10	18	2019-12-11 17:34:42	2019-12-11 17:34:42
99	70	18	2019-12-11 17:34:42	2019-12-11 17:34:42
100	8	18	2019-12-11 17:34:42	2019-12-11 17:34:42
101	65	18	2019-12-11 17:34:42	2019-12-11 17:34:42
102	2	18	2019-12-11 17:34:42	2019-12-11 17:34:42
103	127	18	2019-12-11 17:34:42	2019-12-11 17:34:42
104	1	18	2019-12-11 17:34:42	2019-12-11 17:34:42
105	126	18	2019-12-11 17:34:42	2019-12-11 17:34:42
106	79	18	2019-12-11 17:34:42	2019-12-11 17:34:42
107	18	18	2019-12-11 17:34:42	2019-12-11 17:34:42
108	4	18	2019-12-11 17:34:42	2019-12-11 17:34:42
109	66	18	2019-12-11 17:34:42	2019-12-11 17:34:42
110	19	18	2019-12-11 17:34:42	2019-12-11 17:34:42
111	69	18	2019-12-11 17:34:42	2019-12-11 17:34:42
112	68	18	2019-12-11 17:34:42	2019-12-11 17:34:42
113	120	18	2019-12-11 17:34:42	2019-12-11 17:34:42
114	148	18	2019-12-11 17:34:42	2019-12-11 17:34:42
115	58	18	2019-12-11 17:34:42	2019-12-11 17:34:42
116	128	18	2019-12-11 17:34:42	2019-12-11 17:34:42
117	71	18	2019-12-11 17:34:42	2019-12-11 17:34:42
118	62	18	2019-12-11 17:34:42	2019-12-11 17:34:42
119	119	18	2019-12-11 17:34:42	2019-12-11 17:34:42
120	60	18	2019-12-11 17:34:42	2019-12-11 17:34:42
121	17	18	2019-12-11 17:34:42	2019-12-11 17:34:42
122	67	18	2019-12-11 17:34:42	2019-12-11 17:34:42
123	92	18	2019-12-11 17:34:42	2019-12-11 17:34:42
124	15	18	2019-12-11 17:34:42	2019-12-11 17:34:42
125	12	18	2019-12-11 17:34:42	2019-12-11 17:34:42
126	59	18	2019-12-11 17:34:42	2019-12-11 17:34:42
127	16	18	2019-12-11 17:34:42	2019-12-11 17:34:42
128	128	19	2019-12-11 22:34:31	2019-12-11 22:34:31
129	120	19	2019-12-11 22:34:31	2019-12-11 22:34:31
130	14	19	2019-12-11 22:34:31	2019-12-11 22:34:31
131	67	20	2019-12-12 06:52:10	2019-12-12 06:52:10
132	120	20	2019-12-12 06:52:10	2019-12-12 06:52:10
133	130	20	2019-12-12 06:52:10	2019-12-12 06:52:10
134	127	20	2019-12-12 06:52:10	2019-12-12 06:52:10
135	15	20	2019-12-12 06:52:10	2019-12-12 06:52:10
136	123	20	2019-12-12 06:52:10	2019-12-12 06:52:10
137	1	20	2019-12-12 06:52:10	2019-12-12 06:52:10
138	19	20	2019-12-12 06:52:10	2019-12-12 06:52:10
139	149	20	2019-12-12 06:52:10	2019-12-12 06:52:10
140	90	20	2019-12-12 06:52:10	2019-12-12 06:52:10
141	59	20	2019-12-12 06:52:10	2019-12-12 06:52:10
142	91	20	2019-12-12 06:52:10	2019-12-12 06:52:10
143	112	20	2019-12-12 06:52:10	2019-12-12 06:52:10
144	58	20	2019-12-12 06:52:10	2019-12-12 06:52:10
145	132	20	2019-12-12 06:52:10	2019-12-12 06:52:10
146	65	20	2019-12-12 06:52:10	2019-12-12 06:52:10
147	14	20	2019-12-12 06:52:10	2019-12-12 06:52:10
148	8	20	2019-12-12 06:52:10	2019-12-12 06:52:10
149	71	20	2019-12-12 06:52:10	2019-12-12 06:52:10
150	18	20	2019-12-12 06:52:10	2019-12-12 06:52:10
151	2	20	2019-12-12 06:52:10	2019-12-12 06:52:10
152	6	20	2019-12-12 06:52:10	2019-12-12 06:52:10
153	125	20	2019-12-12 06:52:10	2019-12-12 06:52:10
154	68	20	2019-12-12 06:52:10	2019-12-12 06:52:10
155	13	20	2019-12-12 06:52:10	2019-12-12 06:52:10
156	16	20	2019-12-12 06:52:10	2019-12-12 06:52:10
157	9	20	2019-12-12 06:52:10	2019-12-12 06:52:10
158	69	20	2019-12-12 06:52:10	2019-12-12 06:52:10
159	11	20	2019-12-12 06:52:10	2019-12-12 06:52:10
160	63	20	2019-12-12 06:52:10	2019-12-12 06:52:10
161	79	20	2019-12-12 06:52:10	2019-12-12 06:52:10
162	147	20	2019-12-12 06:52:10	2019-12-12 06:52:10
163	70	20	2019-12-12 06:52:10	2019-12-12 06:52:10
164	66	20	2019-12-12 06:52:10	2019-12-12 06:52:10
165	131	20	2019-12-12 06:52:10	2019-12-12 06:52:10
166	128	20	2019-12-12 06:52:10	2019-12-12 06:52:10
167	124	20	2019-12-12 06:52:10	2019-12-12 06:52:10
168	4	20	2019-12-12 06:52:10	2019-12-12 06:52:10
169	119	20	2019-12-12 06:52:10	2019-12-12 06:52:10
170	92	20	2019-12-12 06:52:10	2019-12-12 06:52:10
171	12	20	2019-12-12 06:52:10	2019-12-12 06:52:10
172	17	20	2019-12-12 06:52:10	2019-12-12 06:52:10
173	5	20	2019-12-12 06:52:10	2019-12-12 06:52:10
174	129	20	2019-12-12 06:52:10	2019-12-12 06:52:10
175	3	20	2019-12-12 06:52:10	2019-12-12 06:52:10
176	148	20	2019-12-12 06:52:10	2019-12-12 06:52:10
177	126	20	2019-12-12 06:52:10	2019-12-12 06:52:10
178	61	20	2019-12-12 06:52:10	2019-12-12 06:52:10
179	7	20	2019-12-12 06:52:10	2019-12-12 06:52:10
180	64	20	2019-12-12 06:52:10	2019-12-12 06:52:10
181	62	20	2019-12-12 06:52:10	2019-12-12 06:52:10
182	60	20	2019-12-12 06:52:10	2019-12-12 06:52:10
183	20	20	2019-12-12 06:52:10	2019-12-12 06:52:10
184	10	20	2019-12-12 06:52:10	2019-12-12 06:52:10
185	72	20	2019-12-12 06:52:10	2019-12-12 06:52:10
186	111	20	2019-12-12 06:52:10	2019-12-12 06:52:10
187	8	21	2019-12-31 22:56:59	2019-12-31 22:56:59
188	70	21	2019-12-31 22:56:59	2019-12-31 22:56:59
189	13	21	2019-12-31 22:56:59	2019-12-31 22:56:59
190	15	22	2020-01-12 01:40:32	2020-01-12 01:40:32
191	112	22	2020-01-12 01:40:32	2020-01-12 01:40:32
192	92	22	2020-01-12 01:40:32	2020-01-12 01:40:32
193	2	22	2020-01-12 01:40:32	2020-01-12 01:40:32
194	131	22	2020-01-12 01:40:32	2020-01-12 01:40:32
195	3	23	2020-01-14 01:58:35	2020-01-14 01:58:35
196	148	23	2020-01-14 01:58:35	2020-01-14 01:58:35
197	70	23	2020-01-14 01:58:35	2020-01-14 01:58:35
198	69	24	2020-01-22 09:10:06	2020-01-22 09:10:06
199	64	24	2020-01-22 09:10:06	2020-01-22 09:10:06
200	7	24	2020-01-22 09:10:06	2020-01-22 09:10:06
201	16	26	2020-02-19 01:18:34	2020-02-19 01:18:34
202	128	26	2020-02-19 01:18:34	2020-02-19 01:18:34
203	6	26	2020-02-19 01:18:34	2020-02-19 01:18:34
204	91	28	2020-04-20 22:49:45	2020-04-20 22:49:45
205	59	28	2020-04-20 22:49:45	2020-04-20 22:49:45
206	119	28	2020-04-20 22:49:45	2020-04-20 22:49:45
207	129	28	2020-04-20 22:49:45	2020-04-20 22:49:45
208	1	28	2020-04-20 22:49:45	2020-04-20 22:49:45
209	68	28	2020-04-20 22:49:45	2020-04-20 22:49:45
210	111	28	2020-04-20 22:49:45	2020-04-20 22:49:45
211	130	29	2020-05-02 06:40:29	2020-05-02 06:40:29
212	59	29	2020-05-02 06:40:29	2020-05-02 06:40:29
213	119	29	2020-05-02 06:40:29	2020-05-02 06:40:29
214	16	31	2020-05-03 12:57:35	2020-05-03 12:57:35
215	58	31	2020-05-03 12:57:35	2020-05-03 12:57:35
216	12	31	2020-05-03 12:57:35	2020-05-03 12:57:35
217	129	31	2020-05-03 12:57:35	2020-05-03 12:57:35
218	19	32	2020-06-04 23:24:42	2020-06-04 23:24:42
219	128	32	2020-06-04 23:24:42	2020-06-04 23:24:42
220	16	32	2020-06-04 23:24:42	2020-06-04 23:24:42
221	16	34	2020-06-19 02:10:39	2020-06-19 02:10:39
222	123	34	2020-06-19 02:10:39	2020-06-19 02:10:39
223	14	34	2020-06-19 02:10:39	2020-06-19 02:10:39
224	17	38	2020-06-20 22:18:18	2020-06-20 22:18:18
225	111	38	2020-06-20 22:18:18	2020-06-20 22:18:18
226	59	38	2020-06-20 22:18:18	2020-06-20 22:18:18
227	17	40	2020-07-04 14:50:08	2020-07-04 14:50:08
228	149	40	2020-07-04 14:50:08	2020-07-04 14:50:08
229	132	40	2020-07-04 14:50:08	2020-07-04 14:50:08
230	20	41	2020-08-01 13:20:34	2020-08-01 13:20:34
231	8	41	2020-08-01 13:20:34	2020-08-01 13:20:34
232	126	41	2020-08-01 13:20:34	2020-08-01 13:20:34
233	14	41	2020-08-01 13:20:34	2020-08-01 13:20:34
234	131	44	2020-09-17 16:03:29	2020-09-17 16:03:29
235	68	44	2020-09-17 16:03:29	2020-09-17 16:03:29
236	132	44	2020-09-17 16:03:29	2020-09-17 16:03:29
237	16	45	2020-09-18 17:12:44	2020-09-18 17:12:44
238	3	45	2020-09-18 17:12:44	2020-09-18 17:12:44
239	120	45	2020-09-18 17:12:44	2020-09-18 17:12:44
240	58	45	2020-09-18 17:12:44	2020-09-18 17:12:44
241	17	45	2020-09-18 17:12:44	2020-09-18 17:12:44
242	129	45	2020-09-18 17:12:44	2020-09-18 17:12:44
243	1	45	2020-09-18 17:12:44	2020-09-18 17:12:44
244	59	45	2020-09-18 17:12:44	2020-09-18 17:12:44
245	19	45	2020-09-18 17:12:44	2020-09-18 17:12:44
246	79	45	2020-09-18 17:12:44	2020-09-18 17:12:44
247	92	45	2020-09-18 17:12:44	2020-09-18 17:12:44
248	12	45	2020-09-18 17:12:44	2020-09-18 17:12:44
249	8	45	2020-09-18 17:12:44	2020-09-18 17:12:44
250	119	46	2020-09-19 18:11:23	2020-09-19 18:11:23
251	90	46	2020-09-19 18:11:23	2020-09-19 18:11:23
252	120	46	2020-09-19 18:11:23	2020-09-19 18:11:23
253	3	46	2020-09-19 18:11:23	2020-09-19 18:11:23
254	92	46	2020-09-19 18:11:23	2020-09-19 18:11:23
255	127	47	2020-09-21 00:20:14	2020-09-21 00:20:14
256	9	47	2020-09-21 00:20:14	2020-09-21 00:20:14
257	124	47	2020-09-21 00:20:14	2020-09-21 00:20:14
258	5	47	2020-09-21 00:20:14	2020-09-21 00:20:14
259	17	47	2020-09-21 00:20:14	2020-09-21 00:20:14
260	112	47	2020-09-21 00:20:14	2020-09-21 00:20:14
261	123	47	2020-09-21 00:20:14	2020-09-21 00:20:14
262	2	47	2020-09-21 00:20:14	2020-09-21 00:20:14
263	91	47	2020-09-21 00:20:14	2020-09-21 00:20:14
264	11	47	2020-09-21 00:20:14	2020-09-21 00:20:14
265	10	47	2020-09-21 00:20:14	2020-09-21 00:20:14
266	19	47	2020-09-21 00:20:14	2020-09-21 00:20:14
267	67	47	2020-09-21 00:20:14	2020-09-21 00:20:14
268	61	47	2020-09-21 00:20:14	2020-09-21 00:20:14
269	8	47	2020-09-21 00:20:14	2020-09-21 00:20:14
270	65	47	2020-09-21 00:20:14	2020-09-21 00:20:14
271	92	47	2020-09-21 00:20:14	2020-09-21 00:20:14
272	58	47	2020-09-21 00:20:14	2020-09-21 00:20:14
273	71	47	2020-09-21 00:20:14	2020-09-21 00:20:14
274	7	47	2020-09-21 00:20:14	2020-09-21 00:20:14
275	79	47	2020-09-21 00:20:14	2020-09-21 00:20:14
276	59	47	2020-09-21 00:20:14	2020-09-21 00:20:14
277	119	47	2020-09-21 00:20:14	2020-09-21 00:20:14
278	6	47	2020-09-21 00:20:14	2020-09-21 00:20:14
279	125	47	2020-09-21 00:20:14	2020-09-21 00:20:14
280	62	47	2020-09-21 00:20:14	2020-09-21 00:20:14
281	132	47	2020-09-21 00:20:14	2020-09-21 00:20:14
282	120	47	2020-09-21 00:20:14	2020-09-21 00:20:14
283	69	47	2020-09-21 00:20:14	2020-09-21 00:20:14
284	126	47	2020-09-21 00:20:14	2020-09-21 00:20:14
285	66	47	2020-09-21 00:20:14	2020-09-21 00:20:14
286	70	47	2020-09-21 00:20:14	2020-09-21 00:20:14
287	64	47	2020-09-21 00:20:14	2020-09-21 00:20:14
288	4	47	2020-09-21 00:20:14	2020-09-21 00:20:14
289	129	47	2020-09-21 00:20:14	2020-09-21 00:20:14
290	72	47	2020-09-21 00:20:14	2020-09-21 00:20:14
291	18	47	2020-09-21 00:20:14	2020-09-21 00:20:14
292	16	47	2020-09-21 00:20:14	2020-09-21 00:20:14
293	14	47	2020-09-21 00:20:14	2020-09-21 00:20:14
294	148	47	2020-09-21 00:20:14	2020-09-21 00:20:14
295	128	47	2020-09-21 00:20:14	2020-09-21 00:20:14
296	60	47	2020-09-21 00:20:14	2020-09-21 00:20:14
297	12	47	2020-09-21 00:20:14	2020-09-21 00:20:14
298	63	47	2020-09-21 00:20:14	2020-09-21 00:20:14
299	131	47	2020-09-21 00:20:14	2020-09-21 00:20:14
300	15	47	2020-09-21 00:20:14	2020-09-21 00:20:14
301	149	47	2020-09-21 00:20:14	2020-09-21 00:20:14
302	68	47	2020-09-21 00:20:14	2020-09-21 00:20:14
303	111	47	2020-09-21 00:20:14	2020-09-21 00:20:14
304	147	47	2020-09-21 00:20:14	2020-09-21 00:20:14
305	130	47	2020-09-21 00:20:14	2020-09-21 00:20:14
306	13	47	2020-09-21 00:20:14	2020-09-21 00:20:14
307	90	47	2020-09-21 00:20:14	2020-09-21 00:20:14
308	20	47	2020-09-21 00:20:14	2020-09-21 00:20:14
309	1	47	2020-09-21 00:20:14	2020-09-21 00:20:14
310	3	47	2020-09-21 00:20:14	2020-09-21 00:20:14
311	5	49	2020-09-22 09:58:29	2020-09-22 09:58:29
312	2	49	2020-09-22 09:58:29	2020-09-22 09:58:29
313	59	49	2020-09-22 09:58:29	2020-09-22 09:58:29
314	120	49	2020-09-22 09:58:29	2020-09-22 09:58:29
315	131	49	2020-09-22 09:58:29	2020-09-22 09:58:29
316	19	49	2020-09-22 09:58:29	2020-09-22 09:58:29
317	17	49	2020-09-22 09:58:29	2020-09-22 09:58:29
318	129	49	2020-09-22 09:58:29	2020-09-22 09:58:29
319	132	49	2020-09-22 09:58:29	2020-09-22 09:58:29
320	3	49	2020-09-22 09:58:29	2020-09-22 09:58:29
321	17	50	2020-09-28 16:10:15	2020-09-28 16:10:15
322	59	50	2020-09-28 16:10:15	2020-09-28 16:10:15
323	63	50	2020-09-28 16:10:15	2020-09-28 16:10:15
324	69	51	2020-10-19 04:15:33	2020-10-19 04:15:33
325	7	51	2020-10-19 04:15:33	2020-10-19 04:15:33
326	71	51	2020-10-19 04:15:33	2020-10-19 04:15:33
327	66	51	2020-10-19 04:15:33	2020-10-19 04:15:33
328	123	51	2020-10-19 04:15:33	2020-10-19 04:15:33
329	10	51	2020-10-19 04:15:33	2020-10-19 04:15:33
330	128	51	2020-10-19 04:15:33	2020-10-19 04:15:33
331	58	51	2020-10-19 04:15:33	2020-10-19 04:15:33
332	127	51	2020-10-19 04:15:33	2020-10-19 04:15:33
333	62	51	2020-10-19 04:15:33	2020-10-19 04:15:33
334	59	51	2020-10-19 04:15:33	2020-10-19 04:15:33
335	132	51	2020-10-19 04:15:33	2020-10-19 04:15:33
336	63	51	2020-10-19 04:15:33	2020-10-19 04:15:33
337	147	51	2020-10-19 04:15:33	2020-10-19 04:15:33
338	126	51	2020-10-19 04:15:33	2020-10-19 04:15:33
339	68	51	2020-10-19 04:15:33	2020-10-19 04:15:33
340	125	51	2020-10-19 04:15:33	2020-10-19 04:15:33
341	120	51	2020-10-19 04:15:33	2020-10-19 04:15:33
342	149	51	2020-10-19 04:15:33	2020-10-19 04:15:33
343	64	51	2020-10-19 04:15:33	2020-10-19 04:15:33
344	19	51	2020-10-19 04:15:33	2020-10-19 04:15:33
345	6	51	2020-10-19 04:15:33	2020-10-19 04:15:33
346	5	51	2020-10-19 04:15:33	2020-10-19 04:15:33
347	119	51	2020-10-19 04:15:33	2020-10-19 04:15:33
348	112	51	2020-10-19 04:15:33	2020-10-19 04:15:33
349	148	51	2020-10-19 04:15:33	2020-10-19 04:15:33
350	79	51	2020-10-19 04:15:33	2020-10-19 04:15:33
351	92	51	2020-10-19 04:15:33	2020-10-19 04:15:33
352	61	51	2020-10-19 04:15:33	2020-10-19 04:15:33
353	12	51	2020-10-19 04:15:33	2020-10-19 04:15:33
354	1	51	2020-10-19 04:15:33	2020-10-19 04:15:33
355	131	51	2020-10-19 04:15:33	2020-10-19 04:15:33
356	90	51	2020-10-19 04:15:33	2020-10-19 04:15:33
357	8	51	2020-10-19 04:15:33	2020-10-19 04:15:33
358	60	51	2020-10-19 04:15:33	2020-10-19 04:15:33
359	72	51	2020-10-19 04:15:33	2020-10-19 04:15:33
360	129	51	2020-10-19 04:15:33	2020-10-19 04:15:33
361	18	51	2020-10-19 04:15:33	2020-10-19 04:15:33
362	3	51	2020-10-19 04:15:33	2020-10-19 04:15:33
363	11	51	2020-10-19 04:15:33	2020-10-19 04:15:33
364	9	51	2020-10-19 04:15:33	2020-10-19 04:15:33
365	15	51	2020-10-19 04:15:33	2020-10-19 04:15:33
366	17	51	2020-10-19 04:15:33	2020-10-19 04:15:33
367	20	51	2020-10-19 04:15:33	2020-10-19 04:15:33
368	65	51	2020-10-19 04:15:33	2020-10-19 04:15:33
369	130	51	2020-10-19 04:15:33	2020-10-19 04:15:33
370	67	51	2020-10-19 04:15:33	2020-10-19 04:15:33
371	14	51	2020-10-19 04:15:33	2020-10-19 04:15:33
372	2	51	2020-10-19 04:15:33	2020-10-19 04:15:33
373	124	51	2020-10-19 04:15:33	2020-10-19 04:15:33
374	4	51	2020-10-19 04:15:33	2020-10-19 04:15:33
375	13	51	2020-10-19 04:15:33	2020-10-19 04:15:33
376	68	52	2020-11-01 23:51:08	2020-11-01 23:51:08
377	64	52	2020-11-01 23:51:08	2020-11-01 23:51:08
378	123	52	2020-11-01 23:51:08	2020-11-01 23:51:08
379	123	54	2020-12-05 13:05:23	2020-12-05 13:05:23
380	72	54	2020-12-05 13:05:23	2020-12-05 13:05:23
381	71	54	2020-12-05 13:05:23	2020-12-05 13:05:23
382	1	54	2020-12-05 13:05:23	2020-12-05 13:05:23
383	124	54	2020-12-05 13:05:23	2020-12-05 13:05:23
384	112	54	2020-12-05 13:05:23	2020-12-05 13:05:23
385	70	54	2020-12-05 13:05:23	2020-12-05 13:05:23
386	127	54	2020-12-05 13:05:23	2020-12-05 13:05:23
387	15	54	2020-12-05 13:05:23	2020-12-05 13:05:23
388	129	54	2020-12-05 13:05:23	2020-12-05 13:05:23
389	12	54	2020-12-05 13:05:23	2020-12-05 13:05:23
390	79	54	2020-12-05 13:05:23	2020-12-05 13:05:23
391	111	54	2020-12-05 13:05:23	2020-12-05 13:05:23
392	92	54	2020-12-05 13:05:23	2020-12-05 13:05:23
393	17	54	2020-12-05 13:05:23	2020-12-05 13:05:23
394	59	54	2020-12-05 13:05:23	2020-12-05 13:05:23
395	149	54	2020-12-05 13:05:23	2020-12-05 13:05:23
396	63	54	2020-12-05 13:05:23	2020-12-05 13:05:23
397	5	54	2020-12-05 13:05:23	2020-12-05 13:05:23
398	7	54	2020-12-05 13:05:23	2020-12-05 13:05:23
399	64	54	2020-12-05 13:05:23	2020-12-05 13:05:23
400	58	54	2020-12-05 13:05:23	2020-12-05 13:05:23
401	90	54	2020-12-05 13:05:23	2020-12-05 13:05:23
402	19	54	2020-12-05 13:05:23	2020-12-05 13:05:23
403	6	54	2020-12-05 13:05:23	2020-12-05 13:05:23
404	68	54	2020-12-05 13:05:23	2020-12-05 13:05:23
405	131	54	2020-12-05 13:05:23	2020-12-05 13:05:23
406	16	54	2020-12-05 13:05:23	2020-12-05 13:05:23
407	18	54	2020-12-05 13:05:23	2020-12-05 13:05:23
408	69	54	2020-12-05 13:05:23	2020-12-05 13:05:23
409	3	54	2020-12-05 13:05:23	2020-12-05 13:05:23
410	60	54	2020-12-05 13:05:23	2020-12-05 13:05:23
411	125	54	2020-12-05 13:05:23	2020-12-05 13:05:23
412	20	54	2020-12-05 13:05:23	2020-12-05 13:05:23
413	2	54	2020-12-05 13:05:23	2020-12-05 13:05:23
414	119	54	2020-12-05 13:05:23	2020-12-05 13:05:23
415	63	55	2021-01-05 19:38:03	2021-01-05 19:38:03
416	13	55	2021-01-05 19:38:03	2021-01-05 19:38:03
417	124	55	2021-01-05 19:38:03	2021-01-05 19:38:03
418	123	56	2021-01-10 14:19:07	2021-01-10 14:19:07
419	129	56	2021-01-10 14:19:07	2021-01-10 14:19:07
420	69	56	2021-01-10 14:19:07	2021-01-10 14:19:07
421	123	57	2021-01-23 18:45:05	2021-01-23 18:45:05
422	1	57	2021-01-23 18:45:05	2021-01-23 18:45:05
423	59	57	2021-01-23 18:45:05	2021-01-23 18:45:05
424	68	59	2021-01-28 06:00:20	2021-01-28 06:00:20
425	90	59	2021-01-28 06:00:20	2021-01-28 06:00:20
426	5	59	2021-01-28 06:00:20	2021-01-28 06:00:20
427	91	59	2021-01-28 06:00:20	2021-01-28 06:00:20
428	59	59	2021-01-28 06:00:20	2021-01-28 06:00:20
429	129	59	2021-01-28 06:00:20	2021-01-28 06:00:20
430	58	59	2021-01-28 06:00:20	2021-01-28 06:00:20
431	72	59	2021-01-28 06:00:20	2021-01-28 06:00:20
432	10	59	2021-01-28 06:00:20	2021-01-28 06:00:20
433	65	59	2021-01-28 06:00:20	2021-01-28 06:00:20
434	7	59	2021-01-28 06:00:20	2021-01-28 06:00:20
435	79	59	2021-01-28 06:00:20	2021-01-28 06:00:20
436	112	59	2021-01-28 06:00:20	2021-01-28 06:00:20
437	123	59	2021-01-28 06:00:20	2021-01-28 06:00:20
438	59	60	2021-01-30 19:55:26	2021-01-30 19:55:26
439	111	60	2021-01-30 19:55:26	2021-01-30 19:55:26
440	124	60	2021-01-30 19:55:26	2021-01-30 19:55:26
441	58	60	2021-01-30 19:55:26	2021-01-30 19:55:26
442	68	60	2021-01-30 19:55:26	2021-01-30 19:55:26
443	129	61	2021-02-10 19:00:58	2021-02-10 19:00:58
444	16	61	2021-02-10 19:00:58	2021-02-10 19:00:58
445	69	61	2021-02-10 19:00:58	2021-02-10 19:00:58
446	17	62	2021-02-23 08:10:19	2021-02-23 08:10:19
447	5	62	2021-02-23 08:10:19	2021-02-23 08:10:19
448	15	62	2021-02-23 08:10:19	2021-02-23 08:10:19
449	59	62	2021-02-23 08:10:19	2021-02-23 08:10:19
450	119	62	2021-02-23 08:10:19	2021-02-23 08:10:19
451	123	62	2021-02-23 08:10:19	2021-02-23 08:10:19
452	91	63	2021-03-03 14:06:39	2021-03-03 14:06:39
453	3	63	2021-03-03 14:06:39	2021-03-03 14:06:39
454	69	63	2021-03-03 14:06:39	2021-03-03 14:06:39
455	150	65	2021-03-08 19:58:46	2021-03-08 19:58:46
456	68	65	2021-03-08 19:58:46	2021-03-08 19:58:46
457	19	65	2021-03-08 19:58:46	2021-03-08 19:58:46
458	6	65	2021-03-08 19:58:46	2021-03-08 19:58:46
459	63	65	2021-03-08 19:58:46	2021-03-08 19:58:46
460	124	65	2021-03-08 19:58:46	2021-03-08 19:58:46
461	123	65	2021-03-08 19:58:46	2021-03-08 19:58:46
462	128	65	2021-03-08 19:58:46	2021-03-08 19:58:46
463	69	65	2021-03-08 19:58:46	2021-03-08 19:58:46
464	59	65	2021-03-08 19:58:46	2021-03-08 19:58:46
465	91	65	2021-03-08 19:58:46	2021-03-08 19:58:46
466	5	65	2021-03-08 19:58:46	2021-03-08 19:58:46
467	10	65	2021-03-08 19:58:46	2021-03-08 19:58:46
468	197	65	2021-03-08 19:58:46	2021-03-08 19:58:46
469	71	65	2021-03-08 19:58:46	2021-03-08 19:58:46
470	132	65	2021-03-08 19:58:46	2021-03-08 19:58:46
471	156	65	2021-03-08 19:58:46	2021-03-08 19:58:46
472	207	65	2021-03-08 19:58:46	2021-03-08 19:58:46
473	203	65	2021-03-08 19:58:46	2021-03-08 19:58:46
474	64	65	2021-03-08 19:58:46	2021-03-08 19:58:46
475	16	65	2021-03-08 19:58:46	2021-03-08 19:58:46
476	92	65	2021-03-08 19:58:46	2021-03-08 19:58:46
477	90	65	2021-03-08 19:58:46	2021-03-08 19:58:46
478	59	66	2021-03-20 11:11:41	2021-03-20 11:11:41
479	60	66	2021-03-20 11:11:41	2021-03-20 11:11:41
480	10	66	2021-03-20 11:11:41	2021-03-20 11:11:41
481	5	66	2021-03-20 11:11:41	2021-03-20 11:11:41
482	200	66	2021-03-20 11:11:41	2021-03-20 11:11:41
483	203	66	2021-03-20 11:11:41	2021-03-20 11:11:41
484	1	66	2021-03-20 11:11:41	2021-03-20 11:11:41
485	68	67	2021-03-20 22:07:23	2021-03-20 22:07:23
486	18	67	2021-03-20 22:07:23	2021-03-20 22:07:23
487	112	67	2021-03-20 22:07:23	2021-03-20 22:07:23
488	79	67	2021-03-20 22:07:23	2021-03-20 22:07:23
489	203	67	2021-03-20 22:07:23	2021-03-20 22:07:23
490	156	67	2021-03-20 22:07:23	2021-03-20 22:07:23
491	150	67	2021-03-20 22:07:23	2021-03-20 22:07:23
492	61	68	2021-03-21 10:24:15	2021-03-21 10:24:15
493	3	68	2021-03-21 10:24:15	2021-03-21 10:24:15
494	127	68	2021-03-21 10:24:15	2021-03-21 10:24:15
495	197	68	2021-03-21 10:24:15	2021-03-21 10:24:15
496	60	68	2021-03-21 10:24:15	2021-03-21 10:24:15
497	70	68	2021-03-21 10:24:15	2021-03-21 10:24:15
498	59	68	2021-03-21 10:24:15	2021-03-21 10:24:15
499	153	69	2021-03-24 17:32:36	2021-03-24 17:32:36
500	59	69	2021-03-24 17:32:36	2021-03-24 17:32:36
501	150	69	2021-03-24 17:32:36	2021-03-24 17:32:36
502	152	69	2021-03-24 17:32:36	2021-03-24 17:32:36
503	1	69	2021-03-24 17:32:36	2021-03-24 17:32:36
504	203	69	2021-03-24 17:32:36	2021-03-24 17:32:36
505	200	69	2021-03-24 17:32:36	2021-03-24 17:32:36
506	156	69	2021-03-24 17:32:36	2021-03-24 17:32:36
507	20	69	2021-03-24 17:32:36	2021-03-24 17:32:36
508	151	69	2021-03-24 17:32:36	2021-03-24 17:32:36
509	62	69	2021-03-24 17:32:36	2021-03-24 17:32:36
510	13	69	2021-03-24 17:32:36	2021-03-24 17:32:36
511	71	69	2021-03-24 17:32:36	2021-03-24 17:32:36
512	197	69	2021-03-24 17:32:36	2021-03-24 17:32:36
513	129	69	2021-03-24 17:32:36	2021-03-24 17:32:36
514	129	70	2021-03-29 21:46:09	2021-03-29 21:46:09
515	3	70	2021-03-29 21:46:09	2021-03-29 21:46:09
516	200	70	2021-03-29 21:46:09	2021-03-29 21:46:09
517	128	70	2021-03-29 21:46:09	2021-03-29 21:46:09
518	59	70	2021-03-29 21:46:09	2021-03-29 21:46:09
519	207	70	2021-03-29 21:46:09	2021-03-29 21:46:09
520	195	70	2021-03-29 21:46:09	2021-03-29 21:46:09
521	124	70	2021-03-29 21:46:09	2021-03-29 21:46:09
522	11	70	2021-03-29 21:46:09	2021-03-29 21:46:09
523	203	70	2021-03-29 21:46:09	2021-03-29 21:46:09
524	208	70	2021-03-29 21:46:09	2021-03-29 21:46:09
525	17	70	2021-03-29 21:46:09	2021-03-29 21:46:09
526	178	70	2021-03-29 21:46:09	2021-03-29 21:46:09
527	19	70	2021-03-29 21:46:09	2021-03-29 21:46:09
528	123	70	2021-03-29 21:46:09	2021-03-29 21:46:09
529	15	70	2021-03-29 21:46:09	2021-03-29 21:46:09
530	70	70	2021-03-29 21:46:09	2021-03-29 21:46:09
531	62	70	2021-03-29 21:46:09	2021-03-29 21:46:09
532	131	70	2021-03-29 21:46:09	2021-03-29 21:46:09
533	153	70	2021-03-29 21:46:09	2021-03-29 21:46:09
534	158	70	2021-03-29 21:46:09	2021-03-29 21:46:09
535	72	70	2021-03-29 21:46:09	2021-03-29 21:46:09
536	196	70	2021-03-29 21:46:09	2021-03-29 21:46:09
537	201	70	2021-03-29 21:46:09	2021-03-29 21:46:09
538	58	70	2021-03-29 21:46:09	2021-03-29 21:46:09
539	199	70	2021-03-29 21:46:09	2021-03-29 21:46:09
540	64	70	2021-03-29 21:46:09	2021-03-29 21:46:09
541	16	70	2021-03-29 21:46:09	2021-03-29 21:46:09
542	111	71	2021-04-07 21:47:44	2021-04-07 21:47:44
543	153	71	2021-04-07 21:47:44	2021-04-07 21:47:44
544	150	71	2021-04-07 21:47:44	2021-04-07 21:47:44
545	119	71	2021-04-07 21:47:44	2021-04-07 21:47:44
546	64	71	2021-04-07 21:47:44	2021-04-07 21:47:44
547	150	72	2021-04-16 08:29:17	2021-04-16 08:29:17
548	60	72	2021-04-16 08:29:17	2021-04-16 08:29:17
549	123	72	2021-04-16 08:29:17	2021-04-16 08:29:17
550	127	72	2021-04-16 08:29:17	2021-04-16 08:29:17
551	1	72	2021-04-16 08:29:17	2021-04-16 08:29:17
552	111	72	2021-04-16 08:29:17	2021-04-16 08:29:17
553	124	72	2021-04-16 08:29:17	2021-04-16 08:29:17
554	155	72	2021-04-16 08:29:17	2021-04-16 08:29:17
555	19	72	2021-04-16 08:29:17	2021-04-16 08:29:17
556	130	72	2021-04-16 08:29:17	2021-04-16 08:29:17
557	12	72	2021-04-16 08:29:17	2021-04-16 08:29:17
558	91	72	2021-04-16 08:29:17	2021-04-16 08:29:17
559	154	72	2021-04-16 08:29:17	2021-04-16 08:29:17
560	59	72	2021-04-16 08:29:17	2021-04-16 08:29:17
561	63	72	2021-04-16 08:29:17	2021-04-16 08:29:17
562	153	72	2021-04-16 08:29:17	2021-04-16 08:29:17
563	2	72	2021-04-16 08:29:17	2021-04-16 08:29:17
564	129	72	2021-04-16 08:29:17	2021-04-16 08:29:17
565	156	72	2021-04-16 08:29:17	2021-04-16 08:29:17
566	120	72	2021-04-16 08:29:17	2021-04-16 08:29:17
567	92	73	2021-04-18 20:35:43	2021-04-18 20:35:43
568	147	73	2021-04-18 20:35:43	2021-04-18 20:35:43
569	69	73	2021-04-18 20:35:43	2021-04-18 20:35:43
570	12	74	2021-04-21 03:28:05	2021-04-21 03:28:05
571	59	74	2021-04-21 03:28:05	2021-04-21 03:28:05
572	203	74	2021-04-21 03:28:05	2021-04-21 03:28:05
573	79	75	2021-05-02 05:11:04	2021-05-02 05:11:04
574	203	75	2021-05-02 05:11:04	2021-05-02 05:11:04
575	200	75	2021-05-02 05:11:04	2021-05-02 05:11:04
576	68	75	2021-05-02 05:11:04	2021-05-02 05:11:04
577	155	75	2021-05-02 05:11:04	2021-05-02 05:11:04
578	153	75	2021-05-02 05:11:04	2021-05-02 05:11:04
579	59	75	2021-05-02 05:11:04	2021-05-02 05:11:04
580	152	76	2021-05-23 00:12:24	2021-05-23 00:12:24
581	16	76	2021-05-23 00:12:24	2021-05-23 00:12:24
582	129	76	2021-05-23 00:12:24	2021-05-23 00:12:24
583	11	77	2021-06-12 00:25:24	2021-06-12 00:25:24
584	200	77	2021-06-12 00:25:24	2021-06-12 00:25:24
585	59	77	2021-06-12 00:25:24	2021-06-12 00:25:24
586	15	78	2021-06-30 18:25:04	2021-06-30 18:25:04
587	6	78	2021-06-30 18:25:04	2021-06-30 18:25:04
588	1	78	2021-06-30 18:25:04	2021-06-30 18:25:04
589	59	79	2021-07-09 20:09:49	2021-07-09 20:09:49
590	64	79	2021-07-09 20:09:49	2021-07-09 20:09:49
591	197	79	2021-07-09 20:09:49	2021-07-09 20:09:49
592	200	80	2021-07-20 06:47:59	2021-07-20 06:47:59
593	18	80	2021-07-20 06:47:59	2021-07-20 06:47:59
594	79	80	2021-07-20 06:47:59	2021-07-20 06:47:59
595	150	81	2021-08-24 05:28:08	2021-08-24 05:28:08
596	1	81	2021-08-24 05:28:08	2021-08-24 05:28:08
597	17	81	2021-08-24 05:28:08	2021-08-24 05:28:08
598	66	81	2021-08-24 05:28:08	2021-08-24 05:28:08
599	200	82	2021-08-24 17:56:52	2021-08-24 17:56:52
600	10	82	2021-08-24 17:56:52	2021-08-24 17:56:52
601	154	82	2021-08-24 17:56:52	2021-08-24 17:56:52
602	129	82	2021-08-24 17:56:52	2021-08-24 17:56:52
603	203	82	2021-08-24 17:56:52	2021-08-24 17:56:52
604	207	82	2021-08-24 17:56:52	2021-08-24 17:56:52
605	197	82	2021-08-24 17:56:52	2021-08-24 17:56:52
606	196	82	2021-08-24 17:56:52	2021-08-24 17:56:52
607	59	82	2021-08-24 17:56:52	2021-08-24 17:56:52
608	123	82	2021-08-24 17:56:52	2021-08-24 17:56:52
609	201	82	2021-08-24 17:56:52	2021-08-24 17:56:52
610	151	82	2021-08-24 17:56:52	2021-08-24 17:56:52
611	16	82	2021-08-24 17:56:52	2021-08-24 17:56:52
612	65	83	2021-09-01 04:12:32	2021-09-01 04:12:32
613	147	83	2021-09-01 04:12:32	2021-09-01 04:12:32
614	203	83	2021-09-01 04:12:32	2021-09-01 04:12:32
615	91	83	2021-09-01 04:12:32	2021-09-01 04:12:32
616	4	83	2021-09-01 04:12:32	2021-09-01 04:12:32
617	194	83	2021-09-01 04:12:32	2021-09-01 04:12:32
618	152	83	2021-09-01 04:12:32	2021-09-01 04:12:32
619	153	83	2021-09-01 04:12:32	2021-09-01 04:12:32
620	150	83	2021-09-01 04:12:32	2021-09-01 04:12:32
621	92	83	2021-09-01 04:12:32	2021-09-01 04:12:32
622	111	83	2021-09-01 04:12:32	2021-09-01 04:12:32
623	200	83	2021-09-01 04:12:32	2021-09-01 04:12:32
624	197	83	2021-09-01 04:12:32	2021-09-01 04:12:32
625	157	83	2021-09-01 04:12:32	2021-09-01 04:12:32
626	2	83	2021-09-01 04:12:32	2021-09-01 04:12:32
627	193	83	2021-09-01 04:12:32	2021-09-01 04:12:32
628	12	83	2021-09-01 04:12:32	2021-09-01 04:12:32
629	193	84	2021-09-01 19:39:07	2021-09-01 19:39:07
630	152	84	2021-09-01 19:39:07	2021-09-01 19:39:07
631	153	84	2021-09-01 19:39:07	2021-09-01 19:39:07
632	69	85	2021-09-03 03:51:32	2021-09-03 03:51:32
633	150	85	2021-09-03 03:51:32	2021-09-03 03:51:32
634	153	85	2021-09-03 03:51:32	2021-09-03 03:51:32
635	206	86	2021-09-04 04:31:32	2021-09-04 04:31:32
636	90	86	2021-09-04 04:31:32	2021-09-04 04:31:32
637	59	86	2021-09-04 04:31:32	2021-09-04 04:31:32
638	68	87	2021-09-12 12:57:01	2021-09-12 12:57:01
639	63	87	2021-09-12 12:57:01	2021-09-12 12:57:01
640	152	87	2021-09-12 12:57:01	2021-09-12 12:57:01
641	153	88	2021-09-12 22:02:54	2021-09-12 22:02:54
642	70	88	2021-09-12 22:02:54	2021-09-12 22:02:54
643	200	88	2021-09-12 22:02:54	2021-09-12 22:02:54
644	68	89	2021-09-18 18:18:49	2021-09-18 18:18:49
645	79	89	2021-09-18 18:18:49	2021-09-18 18:18:49
646	203	89	2021-09-18 18:18:49	2021-09-18 18:18:49
647	59	89	2021-09-18 18:18:49	2021-09-18 18:18:49
648	3	89	2021-09-18 18:18:49	2021-09-18 18:18:49
649	151	89	2021-09-18 18:18:49	2021-09-18 18:18:49
650	91	89	2021-09-18 18:18:49	2021-09-18 18:18:49
651	149	89	2021-09-18 18:18:49	2021-09-18 18:18:49
652	152	89	2021-09-18 18:18:49	2021-09-18 18:18:49
653	154	89	2021-09-18 18:18:49	2021-09-18 18:18:49
654	90	89	2021-09-18 18:18:49	2021-09-18 18:18:49
655	153	89	2021-09-18 18:18:49	2021-09-18 18:18:49
656	150	89	2021-09-18 18:18:49	2021-09-18 18:18:49
657	72	89	2021-09-18 18:18:49	2021-09-18 18:18:49
658	200	89	2021-09-18 18:18:49	2021-09-18 18:18:49
659	58	89	2021-09-18 18:18:49	2021-09-18 18:18:49
660	123	89	2021-09-18 18:18:49	2021-09-18 18:18:49
661	1	89	2021-09-18 18:18:49	2021-09-18 18:18:49
662	119	89	2021-09-18 18:18:49	2021-09-18 18:18:49
663	129	89	2021-09-18 18:18:49	2021-09-18 18:18:49
664	69	89	2021-09-18 18:18:49	2021-09-18 18:18:49
665	14	89	2021-09-18 18:18:49	2021-09-18 18:18:49
666	124	89	2021-09-18 18:18:49	2021-09-18 18:18:49
667	17	89	2021-09-18 18:18:49	2021-09-18 18:18:49
668	66	89	2021-09-18 18:18:49	2021-09-18 18:18:49
669	61	89	2021-09-18 18:18:49	2021-09-18 18:18:49
670	2	89	2021-09-18 18:18:49	2021-09-18 18:18:49
671	201	90	2021-09-20 04:04:47	2021-09-20 04:04:47
672	183	90	2021-09-20 04:04:47	2021-09-20 04:04:47
673	90	90	2021-09-20 04:04:47	2021-09-20 04:04:47
674	200	91	2021-09-29 09:38:29	2021-09-29 09:38:29
675	59	91	2021-09-29 09:38:29	2021-09-29 09:38:29
676	203	91	2021-09-29 09:38:29	2021-09-29 09:38:29
677	200	92	2021-10-04 01:19:55	2021-10-04 01:19:55
678	149	92	2021-10-04 01:19:55	2021-10-04 01:19:55
679	3	92	2021-10-04 01:19:55	2021-10-04 01:19:55
680	180	93	2021-10-04 07:26:08	2021-10-04 07:26:08
681	91	93	2021-10-04 07:26:08	2021-10-04 07:26:08
682	14	93	2021-10-04 07:26:08	2021-10-04 07:26:08
683	193	93	2021-10-04 07:26:08	2021-10-04 07:26:08
684	207	93	2021-10-04 07:26:08	2021-10-04 07:26:08
685	150	93	2021-10-04 07:26:08	2021-10-04 07:26:08
686	1	94	2021-10-06 23:02:49	2021-10-06 23:02:49
687	150	94	2021-10-06 23:02:49	2021-10-06 23:02:49
688	60	94	2021-10-06 23:02:49	2021-10-06 23:02:49
689	197	94	2021-10-06 23:02:49	2021-10-06 23:02:49
690	198	94	2021-10-06 23:02:49	2021-10-06 23:02:49
691	200	94	2021-10-06 23:02:49	2021-10-06 23:02:49
692	201	94	2021-10-06 23:02:49	2021-10-06 23:02:49
693	194	94	2021-10-06 23:02:49	2021-10-06 23:02:49
694	12	94	2021-10-06 23:02:49	2021-10-06 23:02:49
695	203	94	2021-10-06 23:02:49	2021-10-06 23:02:49
696	79	94	2021-10-06 23:02:49	2021-10-06 23:02:49
697	201	96	2021-10-10 00:52:20	2021-10-10 00:52:20
698	8	96	2021-10-10 00:52:20	2021-10-10 00:52:20
699	154	96	2021-10-10 00:52:20	2021-10-10 00:52:20
700	69	96	2021-10-10 00:52:20	2021-10-10 00:52:20
701	14	96	2021-10-10 00:52:20	2021-10-10 00:52:20
702	203	96	2021-10-10 00:52:20	2021-10-10 00:52:20
703	17	96	2021-10-10 00:52:20	2021-10-10 00:52:20
704	128	96	2021-10-10 00:52:20	2021-10-10 00:52:20
705	130	96	2021-10-10 00:52:20	2021-10-10 00:52:20
706	64	96	2021-10-10 00:52:20	2021-10-10 00:52:20
707	19	96	2021-10-10 00:52:20	2021-10-10 00:52:20
708	91	96	2021-10-10 00:52:20	2021-10-10 00:52:20
709	151	96	2021-10-10 00:52:20	2021-10-10 00:52:20
710	92	96	2021-10-10 00:52:20	2021-10-10 00:52:20
711	182	97	2021-10-21 18:04:47	2021-10-21 18:04:47
712	129	97	2021-10-21 18:04:47	2021-10-21 18:04:47
713	127	97	2021-10-21 18:04:47	2021-10-21 18:04:47
714	20	98	2021-10-27 17:58:04	2021-10-27 17:58:04
715	150	98	2021-10-27 17:58:04	2021-10-27 17:58:04
716	182	98	2021-10-27 17:58:04	2021-10-27 17:58:04
717	92	98	2021-10-27 17:58:04	2021-10-27 17:58:04
718	1	98	2021-10-27 17:58:04	2021-10-27 17:58:04
719	66	98	2021-10-27 17:58:04	2021-10-27 17:58:04
720	112	98	2021-10-27 17:58:04	2021-10-27 17:58:04
721	208	98	2021-10-27 17:58:04	2021-10-27 17:58:04
722	63	98	2021-10-27 17:58:04	2021-10-27 17:58:04
723	92	99	2021-11-02 09:49:05	2021-11-02 09:49:05
724	68	99	2021-11-02 09:49:05	2021-11-02 09:49:05
725	197	99	2021-11-02 09:49:05	2021-11-02 09:49:05
726	72	99	2021-11-02 09:49:05	2021-11-02 09:49:05
727	17	99	2021-11-02 09:49:05	2021-11-02 09:49:05
728	150	99	2021-11-02 09:49:05	2021-11-02 09:49:05
729	71	99	2021-11-02 09:49:05	2021-11-02 09:49:05
730	156	99	2021-11-02 09:49:05	2021-11-02 09:49:05
731	5	99	2021-11-02 09:49:05	2021-11-02 09:49:05
732	112	99	2021-11-02 09:49:05	2021-11-02 09:49:05
733	200	100	2021-11-04 16:46:24	2021-11-04 16:46:24
734	10	100	2021-11-04 16:46:24	2021-11-04 16:46:24
735	20	100	2021-11-04 16:46:24	2021-11-04 16:46:24
736	123	100	2021-11-04 16:46:24	2021-11-04 16:46:24
\.


--
-- Name: users_topics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_topics_id_seq', 736, true);


--
-- Name: accounts accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);


--
-- Name: credentials credentials_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.credentials
    ADD CONSTRAINT credentials_pkey PRIMARY KEY (id);


--
-- Name: daily_market_history daily_market_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.daily_market_history
    ADD CONSTRAINT daily_market_history_pkey PRIMARY KEY (id);


--
-- Name: groupings groupings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.groupings
    ADD CONSTRAINT groupings_pkey PRIMARY KEY (id);


--
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- Name: leads leads_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.leads
    ADD CONSTRAINT leads_pkey PRIMARY KEY (id);


--
-- Name: ontologies ontologies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ontologies
    ADD CONSTRAINT ontologies_pkey PRIMARY KEY (id);


--
-- Name: portfolios portfolios_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.portfolios
    ADD CONSTRAINT portfolios_pkey PRIMARY KEY (id);


--
-- Name: portfolios_tokens portfolios_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.portfolios_tokens
    ADD CONSTRAINT portfolios_tokens_pkey PRIMARY KEY (id);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: proposals proposals_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.proposals
    ADD CONSTRAINT proposals_pkey PRIMARY KEY (id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: strategies strategies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strategies
    ADD CONSTRAINT strategies_pkey PRIMARY KEY (id);


--
-- Name: systems systems_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.systems
    ADD CONSTRAINT systems_pkey PRIMARY KEY (id);


--
-- Name: taggings taggings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.taggings
    ADD CONSTRAINT taggings_pkey PRIMARY KEY (id);


--
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: threads threads_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.threads
    ADD CONSTRAINT threads_pkey PRIMARY KEY (id);


--
-- Name: tokens tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT tokens_pkey PRIMARY KEY (id);


--
-- Name: tokens_tags tokens_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tokens_tags
    ADD CONSTRAINT tokens_tags_pkey PRIMARY KEY (id);


--
-- Name: topics topics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.topics
    ADD CONSTRAINT topics_pkey PRIMARY KEY (id);


--
-- Name: topics_threads topics_threads_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.topics_threads
    ADD CONSTRAINT topics_threads_pkey PRIMARY KEY (id);


--
-- Name: topics_tokens topics_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.topics_tokens
    ADD CONSTRAINT topics_tokens_pkey PRIMARY KEY (id);


--
-- Name: user_groups user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_groups
    ADD CONSTRAINT user_groups_pkey PRIMARY KEY (id);


--
-- Name: user_portfolios user_portfolios_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_portfolios
    ADD CONSTRAINT user_portfolios_pkey PRIMARY KEY (id);


--
-- Name: user_profiles user_profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_profiles
    ADD CONSTRAINT user_profiles_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users_roles users_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_roles
    ADD CONSTRAINT users_roles_pkey PRIMARY KEY (id);


--
-- Name: users_tokens users_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_tokens
    ADD CONSTRAINT users_tokens_pkey PRIMARY KEY (id);


--
-- Name: users_topics users_topics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_topics
    ADD CONSTRAINT users_topics_pkey PRIMARY KEY (id);


--
-- Name: credentials_source_token_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX credentials_source_token_index ON public.credentials USING btree (source, token);


--
-- Name: credentials_user_id_source_index; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX credentials_user_id_source_index ON public.credentials USING btree (user_id, source);


--
-- Name: daily_market_history_symbol_date_index; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX daily_market_history_symbol_date_index ON public.daily_market_history USING btree (symbol, date);


--
-- Name: daily_market_history_token_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX daily_market_history_token_id_index ON public.daily_market_history USING btree (token_id);


--
-- Name: leads_email_index; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX leads_email_index ON public.leads USING btree (email);


--
-- Name: portfolios_tokens_user_id_portfolio_id_token_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX portfolios_tokens_user_id_portfolio_id_token_id_index ON public.portfolios_tokens USING btree (user_id, portfolio_id, token_id);


--
-- Name: posts_active_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX posts_active_index ON public.posts USING btree (active);


--
-- Name: posts_is_public_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX posts_is_public_index ON public.posts USING btree (is_public);


--
-- Name: posts_parent_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX posts_parent_id_index ON public.posts USING btree (parent_id);


--
-- Name: posts_thread_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX posts_thread_id_index ON public.posts USING btree (thread_id);


--
-- Name: posts_type_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX posts_type_index ON public.posts USING btree (type);


--
-- Name: posts_user_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX posts_user_id_index ON public.posts USING btree (user_id);


--
-- Name: threads_active_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX threads_active_index ON public.threads USING btree (active);


--
-- Name: threads_is_public_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX threads_is_public_index ON public.threads USING btree (is_public);


--
-- Name: threads_topic_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX threads_topic_id_index ON public.threads USING btree (topic_id);


--
-- Name: threads_type_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX threads_type_index ON public.threads USING btree (type);


--
-- Name: threads_user_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX threads_user_id_index ON public.threads USING btree (user_id);


--
-- Name: tokens_tags_tag_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tokens_tags_tag_id_index ON public.tokens_tags USING btree (tag_id);


--
-- Name: tokens_tags_token_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tokens_tags_token_id_index ON public.tokens_tags USING btree (token_id);


--
-- Name: topics_name_index; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX topics_name_index ON public.topics USING btree (name);


--
-- Name: topics_threads_thread_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX topics_threads_thread_id_index ON public.topics_threads USING btree (thread_id);


--
-- Name: topics_threads_topic_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX topics_threads_topic_id_index ON public.topics_threads USING btree (topic_id);


--
-- Name: topics_threads_user_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX topics_threads_user_id_index ON public.topics_threads USING btree (user_id);


--
-- Name: topics_tokens_topic_id_token_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX topics_tokens_topic_id_token_id_index ON public.topics_tokens USING btree (topic_id, token_id);


--
-- Name: user_portfolios_portfolio_id_user_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX user_portfolios_portfolio_id_user_id_index ON public.user_portfolios USING btree (portfolio_id, user_id);


--
-- Name: user_profiles_user_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX user_profiles_user_id_index ON public.user_profiles USING btree (user_id);


--
-- Name: users_email_index; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX users_email_index ON public.users USING btree (email);


--
-- Name: users_last_name_index; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX users_last_name_index ON public.users USING btree (last_name);


--
-- Name: users_nickname_index; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX users_nickname_index ON public.users USING btree (nickname);


--
-- Name: users_roles_user_id_role_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX users_roles_user_id_role_id_index ON public.users_roles USING btree (user_id, role_id);


--
-- Name: users_roles_user_id_role_id_user_profile_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX users_roles_user_id_role_id_user_profile_id_index ON public.users_roles USING btree (user_id, role_id, user_profile_id);


--
-- Name: users_tokens_token_id_user_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX users_tokens_token_id_user_id_index ON public.users_tokens USING btree (token_id, user_id);


--
-- Name: users_topics_topic_id_user_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX users_topics_topic_id_user_id_index ON public.users_topics USING btree (topic_id, user_id);


--
-- Name: accounts accounts_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: credentials credentials_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.credentials
    ADD CONSTRAINT credentials_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: daily_market_history daily_market_history_token_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.daily_market_history
    ADD CONSTRAINT daily_market_history_token_id_fkey FOREIGN KEY (token_id) REFERENCES public.tokens(id);


--
-- Name: portfolios_tokens portfolios_tokens_portfolio_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.portfolios_tokens
    ADD CONSTRAINT portfolios_tokens_portfolio_id_fkey FOREIGN KEY (portfolio_id) REFERENCES public.user_portfolios(id);


--
-- Name: portfolios_tokens portfolios_tokens_token_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.portfolios_tokens
    ADD CONSTRAINT portfolios_tokens_token_id_fkey FOREIGN KEY (token_id) REFERENCES public.tokens(id);


--
-- Name: portfolios_tokens portfolios_tokens_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.portfolios_tokens
    ADD CONSTRAINT portfolios_tokens_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: posts posts_thread_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_thread_id_fkey FOREIGN KEY (thread_id) REFERENCES public.threads(id) ON DELETE CASCADE;


--
-- Name: posts posts_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: proposals proposals_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.proposals
    ADD CONSTRAINT proposals_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: strategies strategies_tagging_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.strategies
    ADD CONSTRAINT strategies_tagging_id_fkey FOREIGN KEY (tagging_id) REFERENCES public.taggings(id);


--
-- Name: threads threads_topic_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.threads
    ADD CONSTRAINT threads_topic_id_fkey FOREIGN KEY (topic_id) REFERENCES public.topics(id) ON DELETE CASCADE;


--
-- Name: threads threads_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.threads
    ADD CONSTRAINT threads_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: tokens_tags tokens_tags_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tokens_tags
    ADD CONSTRAINT tokens_tags_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES public.tags(id);


--
-- Name: tokens_tags tokens_tags_token_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tokens_tags
    ADD CONSTRAINT tokens_tags_token_id_fkey FOREIGN KEY (token_id) REFERENCES public.tokens(id);


--
-- Name: topics_threads topics_threads_thread_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.topics_threads
    ADD CONSTRAINT topics_threads_thread_id_fkey FOREIGN KEY (thread_id) REFERENCES public.threads(id) ON DELETE CASCADE;


--
-- Name: topics_threads topics_threads_topic_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.topics_threads
    ADD CONSTRAINT topics_threads_topic_id_fkey FOREIGN KEY (topic_id) REFERENCES public.topics(id) ON DELETE CASCADE;


--
-- Name: topics_threads topics_threads_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.topics_threads
    ADD CONSTRAINT topics_threads_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: topics_tokens topics_tokens_token_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.topics_tokens
    ADD CONSTRAINT topics_tokens_token_id_fkey FOREIGN KEY (token_id) REFERENCES public.tokens(id);


--
-- Name: topics_tokens topics_tokens_topic_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.topics_tokens
    ADD CONSTRAINT topics_tokens_topic_id_fkey FOREIGN KEY (topic_id) REFERENCES public.topics(id);


--
-- Name: user_portfolios user_portfolios_portfolio_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_portfolios
    ADD CONSTRAINT user_portfolios_portfolio_id_fkey FOREIGN KEY (portfolio_id) REFERENCES public.portfolios(id) ON DELETE CASCADE;


--
-- Name: user_portfolios user_portfolios_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_portfolios
    ADD CONSTRAINT user_portfolios_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: user_profiles user_profiles_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_profiles
    ADD CONSTRAINT user_profiles_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: users_roles users_roles_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_roles
    ADD CONSTRAINT users_roles_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- Name: users_roles users_roles_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_roles
    ADD CONSTRAINT users_roles_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: users_roles users_roles_user_profile_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_roles
    ADD CONSTRAINT users_roles_user_profile_id_fkey FOREIGN KEY (user_profile_id) REFERENCES public.user_profiles(id) ON DELETE CASCADE;


--
-- Name: users_tokens users_tokens_token_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_tokens
    ADD CONSTRAINT users_tokens_token_id_fkey FOREIGN KEY (token_id) REFERENCES public.tokens(id) ON DELETE CASCADE;


--
-- Name: users_tokens users_tokens_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_tokens
    ADD CONSTRAINT users_tokens_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: users_topics users_topics_topic_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_topics
    ADD CONSTRAINT users_topics_topic_id_fkey FOREIGN KEY (topic_id) REFERENCES public.topics(id) ON DELETE CASCADE;


--
-- Name: users_topics users_topics_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_topics
    ADD CONSTRAINT users_topics_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: -
--

REVOKE ALL ON SCHEMA public FROM cloudsqladmin;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO cloudsqlsuperuser;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

