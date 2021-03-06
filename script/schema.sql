--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: account; Type: TABLE; Schema: public; Owner: ekologia; Tablespace: 
--

CREATE TABLE account (
    id integer NOT NULL,
    email character varying,
    password character varying,
    phone_number character varying,
    addressstreet character varying(255),
    addresszipcode character varying(255),
    addresscity character varying(255),
    country character varying(255),
    avatar character varying(255),
    description text,
    roles character varying(255),
    salt character varying(255),
    discriminator character varying(255),
    firstname character varying(255),
    lastname character varying(255),
    birthday timestamp without time zone,
    orgname character varying(255),
    activity character varying(255),
    type character varying(255)
);


ALTER TABLE public.account OWNER TO ekologia;

--
-- Name: account_id_seq; Type: SEQUENCE; Schema: public; Owner: ekologia
--

CREATE SEQUENCE account_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_id_seq OWNER TO ekologia;

--
-- Name: account_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ekologia
--

ALTER SEQUENCE account_id_seq OWNED BY account.id;


--
-- Name: group; Type: TABLE; Schema: public; Owner: ekologia; Tablespace: 
--

CREATE TABLE "group" (
    id integer NOT NULL,
    name character varying(255),
    canonical character varying(255),
    description text,
    icon character varying(512)
);


ALTER TABLE public."group" OWNER TO ekologia;

--
-- Name: group_id_seq; Type: SEQUENCE; Schema: public; Owner: ekologia
--

CREATE SEQUENCE group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.group_id_seq OWNER TO ekologia;

--
-- Name: group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ekologia
--

ALTER SEQUENCE group_id_seq OWNED BY "group".id;


--
-- Name: menu; Type: TABLE; Schema: public; Owner: ekologia; Tablespace: 
--

CREATE TABLE menu (
    id integer NOT NULL,
    lang character varying(10) NOT NULL,
    role character varying(255) NOT NULL,
    json text NOT NULL
);


ALTER TABLE public.menu OWNER TO ekologia;

--
-- Name: menu_id_seq; Type: SEQUENCE; Schema: public; Owner: ekologia
--

CREATE SEQUENCE menu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menu_id_seq OWNER TO ekologia;

--
-- Name: menu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ekologia
--

ALTER SEQUENCE menu_id_seq OWNED BY menu.id;


--
-- Name: page; Type: TABLE; Schema: public; Owner: ekologia; Tablespace: 
--

CREATE TABLE page (
    id integer NOT NULL,
    url character varying(10000),
    javascript character varying(10000),
    html character varying(10000),
    css character varying(10000)
);


ALTER TABLE public.page OWNER TO ekologia;

--
-- Name: page_id_seq; Type: SEQUENCE; Schema: public; Owner: ekologia
--

CREATE SEQUENCE page_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.page_id_seq OWNER TO ekologia;

--
-- Name: page_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ekologia
--

ALTER SEQUENCE page_id_seq OWNED BY page.id;


--
-- Name: role_user; Type: TABLE; Schema: public; Owner: ekologia; Tablespace: 
--

CREATE TABLE role_user (
    id integer NOT NULL,
    code character varying(10)
);


ALTER TABLE public.role_user OWNER TO ekologia;

--
-- Name: role_user_group; Type: TABLE; Schema: public; Owner: ekologia; Tablespace: 
--

CREATE TABLE role_user_group (
    id integer NOT NULL,
    code character varying(10)
);


ALTER TABLE public.role_user_group OWNER TO ekologia;

--
-- Name: role_user_group_id_seq; Type: SEQUENCE; Schema: public; Owner: ekologia
--

CREATE SEQUENCE role_user_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.role_user_group_id_seq OWNER TO ekologia;

--
-- Name: role_user_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ekologia
--

ALTER SEQUENCE role_user_group_id_seq OWNED BY role_user_group.id;


--
-- Name: role_user_group_lang; Type: TABLE; Schema: public; Owner: ekologia; Tablespace: 
--

CREATE TABLE role_user_group_lang (
    id integer NOT NULL,
    description character varying(255),
    langue character varying(2),
    role_user_group_id integer NOT NULL
);


ALTER TABLE public.role_user_group_lang OWNER TO ekologia;

--
-- Name: role_user_group_lang_id_seq; Type: SEQUENCE; Schema: public; Owner: ekologia
--

CREATE SEQUENCE role_user_group_lang_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.role_user_group_lang_id_seq OWNER TO ekologia;

--
-- Name: role_user_group_lang_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ekologia
--

ALTER SEQUENCE role_user_group_lang_id_seq OWNED BY role_user_group_lang.id;


--
-- Name: role_user_id_seq; Type: SEQUENCE; Schema: public; Owner: ekologia
--

CREATE SEQUENCE role_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.role_user_id_seq OWNER TO ekologia;

--
-- Name: role_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ekologia
--

ALTER SEQUENCE role_user_id_seq OWNED BY role_user.id;


--
-- Name: role_user_lang; Type: TABLE; Schema: public; Owner: ekologia; Tablespace: 
--

CREATE TABLE role_user_lang (
    id integer NOT NULL,
    description character varying(255),
    langue character varying(2),
    role_user_id integer NOT NULL
);


ALTER TABLE public.role_user_lang OWNER TO ekologia;

--
-- Name: role_user_lang_id_seq; Type: SEQUENCE; Schema: public; Owner: ekologia
--

CREATE SEQUENCE role_user_lang_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.role_user_lang_id_seq OWNER TO ekologia;

--
-- Name: role_user_lang_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ekologia
--

ALTER SEQUENCE role_user_lang_id_seq OWNED BY role_user_lang.id;


--
-- Name: security; Type: TABLE; Schema: public; Owner: ekologia; Tablespace: 
--

CREATE TABLE security (
    id integer NOT NULL,
    url character varying(512),
    diseable boolean
);


ALTER TABLE public.security OWNER TO ekologia;

--
-- Name: security_id_seq; Type: SEQUENCE; Schema: public; Owner: ekologia
--

CREATE SEQUENCE security_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.security_id_seq OWNER TO ekologia;

--
-- Name: security_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ekologia
--

ALTER SEQUENCE security_id_seq OWNED BY security.id;


--
-- Name: statut; Type: TABLE; Schema: public; Owner: ekologia; Tablespace: 
--

CREATE TABLE statut (
    id integer NOT NULL,
    code character varying(10)
);


ALTER TABLE public.statut OWNER TO ekologia;

--
-- Name: statut_id_seq; Type: SEQUENCE; Schema: public; Owner: ekologia
--

CREATE SEQUENCE statut_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.statut_id_seq OWNER TO ekologia;

--
-- Name: statut_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ekologia
--

ALTER SEQUENCE statut_id_seq OWNED BY statut.id;


--
-- Name: statut_lang; Type: TABLE; Schema: public; Owner: ekologia; Tablespace: 
--

CREATE TABLE statut_lang (
    id integer NOT NULL,
    description character varying(255),
    langue character varying(2),
    statut_id integer NOT NULL
);


ALTER TABLE public.statut_lang OWNER TO ekologia;

--
-- Name: statut_lang_id_seq; Type: SEQUENCE; Schema: public; Owner: ekologia
--

CREATE SEQUENCE statut_lang_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.statut_lang_id_seq OWNER TO ekologia;

--
-- Name: statut_lang_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ekologia
--

ALTER SEQUENCE statut_lang_id_seq OWNED BY statut_lang.id;


--
-- Name: user_group; Type: TABLE; Schema: public; Owner: ekologia; Tablespace: 
--

CREATE TABLE user_group (
    user_id integer NOT NULL,
    group_id integer NOT NULL,
    requested date,
    accepted date,
    roles character varying(255)
);


ALTER TABLE public.user_group OWNER TO ekologia;

--
-- Name: user_group_role_user_group; Type: TABLE; Schema: public; Owner: ekologia; Tablespace: 
--

CREATE TABLE user_group_role_user_group (
    user_group_user_id integer NOT NULL,
    user_group_group_id integer NOT NULL,
    role_user_group_id integer NOT NULL
);


ALTER TABLE public.user_group_role_user_group OWNER TO ekologia;

--
-- Name: user_role_user; Type: TABLE; Schema: public; Owner: ekologia; Tablespace: 
--

CREATE TABLE user_role_user (
    user_id integer NOT NULL,
    role_user_id integer NOT NULL
);


ALTER TABLE public.user_role_user OWNER TO ekologia;

--
-- Name: user_statut; Type: TABLE; Schema: public; Owner: ekologia; Tablespace: 
--

CREATE TABLE user_statut (
    user_id integer NOT NULL,
    statut_id integer NOT NULL
);


ALTER TABLE public.user_statut OWNER TO ekologia;

--
-- Name: wiki; Type: TABLE; Schema: public; Owner: ekologia; Tablespace: 
--

CREATE TABLE wiki (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    language character varying(10) NOT NULL,
    canonical character varying(255) NOT NULL,
    editable boolean NOT NULL,
    visible boolean NOT NULL,
    group_id integer,
    parent_id integer
);


ALTER TABLE public.wiki OWNER TO ekologia;

--
-- Name: wiki_id_seq; Type: SEQUENCE; Schema: public; Owner: ekologia
--

CREATE SEQUENCE wiki_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wiki_id_seq OWNER TO ekologia;

--
-- Name: wiki_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ekologia
--

ALTER SEQUENCE wiki_id_seq OWNED BY wiki.id;


--
-- Name: wikicomment; Type: TABLE; Schema: public; Owner: ekologia; Tablespace: 
--

CREATE TABLE wikicomment (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    content text NOT NULL,
    date date DEFAULT now() NOT NULL,
    wiki_id integer,
    parent_id integer,
    user_id integer
);


ALTER TABLE public.wikicomment OWNER TO ekologia;

--
-- Name: wikicomment_id_seq; Type: SEQUENCE; Schema: public; Owner: ekologia
--

CREATE SEQUENCE wikicomment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wikicomment_id_seq OWNER TO ekologia;

--
-- Name: wikicomment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ekologia
--

ALTER SEQUENCE wikicomment_id_seq OWNED BY wikicomment.id;


--
-- Name: wikiversion; Type: TABLE; Schema: public; Owner: ekologia; Tablespace: 
--

CREATE TABLE wikiversion (
    id integer NOT NULL,
    date date DEFAULT now() NOT NULL,
    content text NOT NULL,
    active boolean NOT NULL,
    wiki_id integer NOT NULL,
    user_id integer,
    image character varying(255)
);


ALTER TABLE public.wikiversion OWNER TO ekologia;

--
-- Name: wikiversion_id_seq; Type: SEQUENCE; Schema: public; Owner: ekologia
--

CREATE SEQUENCE wikiversion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wikiversion_id_seq OWNER TO ekologia;

--
-- Name: wikiversion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ekologia
--

ALTER SEQUENCE wikiversion_id_seq OWNED BY wikiversion.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ekologia
--

ALTER TABLE ONLY account ALTER COLUMN id SET DEFAULT nextval('account_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ekologia
--

ALTER TABLE ONLY "group" ALTER COLUMN id SET DEFAULT nextval('group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ekologia
--

ALTER TABLE ONLY menu ALTER COLUMN id SET DEFAULT nextval('menu_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ekologia
--

ALTER TABLE ONLY page ALTER COLUMN id SET DEFAULT nextval('page_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ekologia
--

ALTER TABLE ONLY role_user ALTER COLUMN id SET DEFAULT nextval('role_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ekologia
--

ALTER TABLE ONLY role_user_group ALTER COLUMN id SET DEFAULT nextval('role_user_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ekologia
--

ALTER TABLE ONLY role_user_group_lang ALTER COLUMN id SET DEFAULT nextval('role_user_group_lang_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ekologia
--

ALTER TABLE ONLY role_user_lang ALTER COLUMN id SET DEFAULT nextval('role_user_lang_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ekologia
--

ALTER TABLE ONLY security ALTER COLUMN id SET DEFAULT nextval('security_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ekologia
--

ALTER TABLE ONLY statut ALTER COLUMN id SET DEFAULT nextval('statut_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ekologia
--

ALTER TABLE ONLY statut_lang ALTER COLUMN id SET DEFAULT nextval('statut_lang_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ekologia
--

ALTER TABLE ONLY wiki ALTER COLUMN id SET DEFAULT nextval('wiki_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ekologia
--

ALTER TABLE ONLY wikicomment ALTER COLUMN id SET DEFAULT nextval('wikicomment_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ekologia
--

ALTER TABLE ONLY wikiversion ALTER COLUMN id SET DEFAULT nextval('wikiversion_id_seq'::regclass);


--
-- Name: menu_pkey; Type: CONSTRAINT; Schema: public; Owner: ekologia; Tablespace: 
--

ALTER TABLE ONLY menu
    ADD CONSTRAINT menu_pkey PRIMARY KEY (id);


--
-- Name: pages_pkey; Type: CONSTRAINT; Schema: public; Owner: ekologia; Tablespace: 
--

ALTER TABLE ONLY page
    ADD CONSTRAINT pages_pkey PRIMARY KEY (id);


--
-- Name: pk_group; Type: CONSTRAINT; Schema: public; Owner: ekologia; Tablespace: 
--

ALTER TABLE ONLY "group"
    ADD CONSTRAINT pk_group PRIMARY KEY (id);


--
-- Name: pk_user_group; Type: CONSTRAINT; Schema: public; Owner: ekologia; Tablespace: 
--

ALTER TABLE ONLY user_group
    ADD CONSTRAINT pk_user_group PRIMARY KEY (user_id, group_id);


--
-- Name: pk_user_group_role_user_group; Type: CONSTRAINT; Schema: public; Owner: ekologia; Tablespace: 
--

ALTER TABLE ONLY user_group_role_user_group
    ADD CONSTRAINT pk_user_group_role_user_group PRIMARY KEY (user_group_user_id, user_group_group_id, role_user_group_id);


--
-- Name: pk_user_role_user; Type: CONSTRAINT; Schema: public; Owner: ekologia; Tablespace: 
--

ALTER TABLE ONLY user_role_user
    ADD CONSTRAINT pk_user_role_user PRIMARY KEY (user_id, role_user_id);


--
-- Name: pk_user_statut; Type: CONSTRAINT; Schema: public; Owner: ekologia; Tablespace: 
--

ALTER TABLE ONLY user_statut
    ADD CONSTRAINT pk_user_statut PRIMARY KEY (user_id, statut_id);


--
-- Name: role_user_group_lang_pkey; Type: CONSTRAINT; Schema: public; Owner: ekologia; Tablespace: 
--

ALTER TABLE ONLY role_user_group_lang
    ADD CONSTRAINT role_user_group_lang_pkey PRIMARY KEY (id);


--
-- Name: role_user_group_pkey; Type: CONSTRAINT; Schema: public; Owner: ekologia; Tablespace: 
--

ALTER TABLE ONLY role_user_group
    ADD CONSTRAINT role_user_group_pkey PRIMARY KEY (id);


--
-- Name: role_user_lang_pkey; Type: CONSTRAINT; Schema: public; Owner: ekologia; Tablespace: 
--

ALTER TABLE ONLY role_user_lang
    ADD CONSTRAINT role_user_lang_pkey PRIMARY KEY (id);


--
-- Name: role_user_pkey; Type: CONSTRAINT; Schema: public; Owner: ekologia; Tablespace: 
--

ALTER TABLE ONLY role_user
    ADD CONSTRAINT role_user_pkey PRIMARY KEY (id);


--
-- Name: security_pkey; Type: CONSTRAINT; Schema: public; Owner: ekologia; Tablespace: 
--

ALTER TABLE ONLY security
    ADD CONSTRAINT security_pkey PRIMARY KEY (id);


--
-- Name: statut_lang_pkey; Type: CONSTRAINT; Schema: public; Owner: ekologia; Tablespace: 
--

ALTER TABLE ONLY statut_lang
    ADD CONSTRAINT statut_lang_pkey PRIMARY KEY (id);


--
-- Name: statut_pkey; Type: CONSTRAINT; Schema: public; Owner: ekologia; Tablespace: 
--

ALTER TABLE ONLY statut
    ADD CONSTRAINT statut_pkey PRIMARY KEY (id);


--
-- Name: u_group_canonical; Type: CONSTRAINT; Schema: public; Owner: ekologia; Tablespace: 
--

ALTER TABLE ONLY "group"
    ADD CONSTRAINT u_group_canonical UNIQUE (canonical);


--
-- Name: u_lang_role; Type: CONSTRAINT; Schema: public; Owner: ekologia; Tablespace: 
--

ALTER TABLE ONLY menu
    ADD CONSTRAINT u_lang_role UNIQUE (lang, role);


--
-- Name: user_pkey; Type: CONSTRAINT; Schema: public; Owner: ekologia; Tablespace: 
--

ALTER TABLE ONLY account
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: wiki_canonical_key; Type: CONSTRAINT; Schema: public; Owner: ekologia; Tablespace: 
--

ALTER TABLE ONLY wiki
    ADD CONSTRAINT wiki_canonical_key UNIQUE (canonical);


--
-- Name: wiki_pkey; Type: CONSTRAINT; Schema: public; Owner: ekologia; Tablespace: 
--

ALTER TABLE ONLY wiki
    ADD CONSTRAINT wiki_pkey PRIMARY KEY (id);


--
-- Name: wikicomment_pkey; Type: CONSTRAINT; Schema: public; Owner: ekologia; Tablespace: 
--

ALTER TABLE ONLY wikicomment
    ADD CONSTRAINT wikicomment_pkey PRIMARY KEY (id);


--
-- Name: wikiversion_pkey; Type: CONSTRAINT; Schema: public; Owner: ekologia; Tablespace: 
--

ALTER TABLE ONLY wikiversion
    ADD CONSTRAINT wikiversion_pkey PRIMARY KEY (id);


--
-- Name: fk_role_user_group_id; Type: FK CONSTRAINT; Schema: public; Owner: ekologia
--

ALTER TABLE ONLY role_user_group_lang
    ADD CONSTRAINT fk_role_user_group_id FOREIGN KEY (role_user_group_id) REFERENCES role_user_group(id);


--
-- Name: fk_role_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ekologia
--

ALTER TABLE ONLY role_user_lang
    ADD CONSTRAINT fk_role_user_id FOREIGN KEY (role_user_id) REFERENCES role_user(id);


--
-- Name: fk_statut_lang_statut_id; Type: FK CONSTRAINT; Schema: public; Owner: ekologia
--

ALTER TABLE ONLY statut_lang
    ADD CONSTRAINT fk_statut_lang_statut_id FOREIGN KEY (statut_id) REFERENCES statut(id);


--
-- Name: fk_user_group_group_id; Type: FK CONSTRAINT; Schema: public; Owner: ekologia
--

ALTER TABLE ONLY user_group
    ADD CONSTRAINT fk_user_group_group_id FOREIGN KEY (group_id) REFERENCES "group"(id);


--
-- Name: fk_user_group_role_user_group_role_user_group_id; Type: FK CONSTRAINT; Schema: public; Owner: ekologia
--

ALTER TABLE ONLY user_group_role_user_group
    ADD CONSTRAINT fk_user_group_role_user_group_role_user_group_id FOREIGN KEY (role_user_group_id) REFERENCES role_user_group(id);


--
-- Name: fk_user_group_role_user_group_user_group_id; Type: FK CONSTRAINT; Schema: public; Owner: ekologia
--

ALTER TABLE ONLY user_group_role_user_group
    ADD CONSTRAINT fk_user_group_role_user_group_user_group_id FOREIGN KEY (user_group_user_id, user_group_group_id) REFERENCES user_group(user_id, group_id);


--
-- Name: fk_user_role_user_role_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ekologia
--

ALTER TABLE ONLY user_role_user
    ADD CONSTRAINT fk_user_role_user_role_user_id FOREIGN KEY (role_user_id) REFERENCES role_user(id);


--
-- Name: fk_user_role_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ekologia
--

ALTER TABLE ONLY user_role_user
    ADD CONSTRAINT fk_user_role_user_user_id FOREIGN KEY (user_id) REFERENCES account(id);


--
-- Name: fk_user_statut_statut_id; Type: FK CONSTRAINT; Schema: public; Owner: ekologia
--

ALTER TABLE ONLY user_statut
    ADD CONSTRAINT fk_user_statut_statut_id FOREIGN KEY (statut_id) REFERENCES statut(id);


--
-- Name: fk_user_statut_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ekologia
--

ALTER TABLE ONLY user_statut
    ADD CONSTRAINT fk_user_statut_user_id FOREIGN KEY (user_id) REFERENCES account(id);


--
-- Name: fk_wiki_group_id; Type: FK CONSTRAINT; Schema: public; Owner: ekologia
--

ALTER TABLE ONLY wiki
    ADD CONSTRAINT fk_wiki_group_id FOREIGN KEY (group_id) REFERENCES "group"(id);


--
-- Name: fk_wiki_parent_id; Type: FK CONSTRAINT; Schema: public; Owner: ekologia
--

ALTER TABLE ONLY wiki
    ADD CONSTRAINT fk_wiki_parent_id FOREIGN KEY (parent_id) REFERENCES wiki(id);


--
-- Name: wikicomment_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ekologia
--

ALTER TABLE ONLY wikicomment
    ADD CONSTRAINT wikicomment_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES wikicomment(id);


--
-- Name: wikicomment_wiki_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ekologia
--

ALTER TABLE ONLY wikicomment
    ADD CONSTRAINT wikicomment_wiki_id_fkey FOREIGN KEY (wiki_id) REFERENCES wiki(id);


--
-- Name: wikiversion_wiki_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ekologia
--

ALTER TABLE ONLY wikiversion
    ADD CONSTRAINT wikiversion_wiki_id_fkey FOREIGN KEY (wiki_id) REFERENCES wiki(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

