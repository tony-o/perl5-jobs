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
-- Name: jobs; Type: SCHEMA; Schema: -; Owner: tony
--

CREATE SCHEMA jobs;


ALTER SCHEMA jobs OWNER TO tony;

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
-- Name: aroles; Type: TABLE; Schema: public; Owner: tony; Tablespace: 
--

CREATE TABLE aroles (
    id integer NOT NULL,
    rid integer,
    uid integer
);


ALTER TABLE public.aroles OWNER TO tony;

--
-- Name: aroles_id_seq; Type: SEQUENCE; Schema: public; Owner: tony
--

CREATE SEQUENCE aroles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.aroles_id_seq OWNER TO tony;

--
-- Name: aroles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tony
--

ALTER SEQUENCE aroles_id_seq OWNED BY aroles.id;


--
-- Name: bioanswers; Type: TABLE; Schema: public; Owner: tony; Tablespace: 
--

CREATE TABLE bioanswers (
    id integer NOT NULL,
    uid integer,
    qid integer,
    val text
);


ALTER TABLE public.bioanswers OWNER TO tony;

--
-- Name: bioanswers_id_seq; Type: SEQUENCE; Schema: public; Owner: tony
--

CREATE SEQUENCE bioanswers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bioanswers_id_seq OWNER TO tony;

--
-- Name: bioanswers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tony
--

ALTER SEQUENCE bioanswers_id_seq OWNED BY bioanswers.id;


--
-- Name: bioquestions; Type: TABLE; Schema: public; Owner: tony; Tablespace: 
--

CREATE TABLE bioquestions (
    id integer NOT NULL,
    question character varying(40),
    weight integer,
    coltype character varying(1) DEFAULT 'T'::character varying,
    linkedinmeta text
);


ALTER TABLE public.bioquestions OWNER TO tony;

--
-- Name: bioquestions_id_seq; Type: SEQUENCE; Schema: public; Owner: tony
--

CREATE SEQUENCE bioquestions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bioquestions_id_seq OWNER TO tony;

--
-- Name: bioquestions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tony
--

ALTER SEQUENCE bioquestions_id_seq OWNED BY bioquestions.id;


--
-- Name: degreetypes; Type: TABLE; Schema: public; Owner: tony; Tablespace: 
--

CREATE TABLE degreetypes (
    did integer NOT NULL,
    name character varying(40),
    weighting integer
);


ALTER TABLE public.degreetypes OWNER TO tony;

--
-- Name: degreetypes_did_seq; Type: SEQUENCE; Schema: public; Owner: tony
--

CREATE SEQUENCE degreetypes_did_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.degreetypes_did_seq OWNER TO tony;

--
-- Name: degreetypes_did_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tony
--

ALTER SEQUENCE degreetypes_did_seq OWNED BY degreetypes.did;


--
-- Name: education; Type: TABLE; Schema: public; Owner: tony; Tablespace: 
--

CREATE TABLE education (
    eid integer NOT NULL,
    uid integer,
    institution character varying(120),
    address1 character varying(128),
    address2 character varying(128),
    city character varying(45),
    state integer,
    postalcode character varying(11),
    phone character varying(10),
    degreetype integer,
    degree character varying(128),
    degdt timestamp without time zone DEFAULT now(),
    linkedinid character varying(20)
);


ALTER TABLE public.education OWNER TO tony;

--
-- Name: education_eid_seq; Type: SEQUENCE; Schema: public; Owner: tony
--

CREATE SEQUENCE education_eid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.education_eid_seq OWNER TO tony;

--
-- Name: education_eid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tony
--

ALTER SEQUENCE education_eid_seq OWNED BY education.eid;


--
-- Name: employers; Type: TABLE; Schema: public; Owner: tony; Tablespace: 
--

CREATE TABLE employers (
    eid integer NOT NULL,
    uid integer,
    employer character varying(80),
    jobtitle character varying(80),
    city character varying(45),
    state integer,
    jobclass integer,
    startdt date,
    enddt date,
    contactok boolean DEFAULT false,
    phonenumber character varying(20),
    linkedinid character varying(20)
);


ALTER TABLE public.employers OWNER TO tony;

--
-- Name: employers_eid_seq; Type: SEQUENCE; Schema: public; Owner: tony
--

CREATE SEQUENCE employers_eid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employers_eid_seq OWNER TO tony;

--
-- Name: employers_eid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tony
--

ALTER SEQUENCE employers_eid_seq OWNED BY employers.eid;


--
-- Name: job_reqs; Type: TABLE; Schema: public; Owner: tony; Tablespace: 
--

CREATE TABLE job_reqs (
    id integer NOT NULL,
    jmtid integer,
    jobid integer,
    value double precision,
    version integer DEFAULT 1
);


ALTER TABLE public.job_reqs OWNER TO tony;

--
-- Name: job_reqs_id_seq; Type: SEQUENCE; Schema: public; Owner: tony
--

CREATE SEQUENCE job_reqs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.job_reqs_id_seq OWNER TO tony;

--
-- Name: job_reqs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tony
--

ALTER SEQUENCE job_reqs_id_seq OWNED BY job_reqs.id;


--
-- Name: job_reqs_precanned; Type: TABLE; Schema: public; Owner: tony; Tablespace: 
--

CREATE TABLE job_reqs_precanned (
    id integer NOT NULL,
    jmtid integer,
    jid integer,
    value double precision,
    version integer DEFAULT 1
);


ALTER TABLE public.job_reqs_precanned OWNER TO tony;

--
-- Name: job_reqs_precanned_id_seq; Type: SEQUENCE; Schema: public; Owner: tony
--

CREATE SEQUENCE job_reqs_precanned_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.job_reqs_precanned_id_seq OWNER TO tony;

--
-- Name: job_reqs_precanned_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tony
--

ALTER SEQUENCE job_reqs_precanned_id_seq OWNED BY job_reqs_precanned.id;


--
-- Name: jobclasses; Type: TABLE; Schema: public; Owner: tony; Tablespace: 
--

CREATE TABLE jobclasses (
    jid integer NOT NULL,
    name character varying(60),
    isheader boolean DEFAULT false
);


ALTER TABLE public.jobclasses OWNER TO tony;

--
-- Name: jobclasses_jid_seq; Type: SEQUENCE; Schema: public; Owner: tony
--

CREATE SEQUENCE jobclasses_jid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jobclasses_jid_seq OWNER TO tony;

--
-- Name: jobclasses_jid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tony
--

ALTER SEQUENCE jobclasses_jid_seq OWNED BY jobclasses.jid;


--
-- Name: jobmatches; Type: TABLE; Schema: public; Owner: tony; Tablespace: 
--

CREATE TABLE jobmatches (
    id integer NOT NULL,
    uid integer,
    jid integer,
    fval double precision,
    cval text,
    version character varying(10)
);


ALTER TABLE public.jobmatches OWNER TO tony;

--
-- Name: jobmatches_id_seq; Type: SEQUENCE; Schema: public; Owner: tony
--

CREATE SEQUENCE jobmatches_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jobmatches_id_seq OWNER TO tony;

--
-- Name: jobmatches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tony
--

ALTER SEQUENCE jobmatches_id_seq OWNED BY jobmatches.id;


--
-- Name: jobmatchtraits; Type: TABLE; Schema: public; Owner: tony; Tablespace: 
--

CREATE TABLE jobmatchtraits (
    id integer NOT NULL,
    name character varying(40),
    flags character varying(20)
);


ALTER TABLE public.jobmatchtraits OWNER TO tony;

--
-- Name: jobmatchtraits_id_seq; Type: SEQUENCE; Schema: public; Owner: tony
--

CREATE SEQUENCE jobmatchtraits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jobmatchtraits_id_seq OWNER TO tony;

--
-- Name: jobmatchtraits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tony
--

ALTER SEQUENCE jobmatchtraits_id_seq OWNED BY jobmatchtraits.id;


--
-- Name: jobs; Type: TABLE; Schema: public; Owner: tony; Tablespace: 
--

CREATE TABLE jobs (
    jid integer NOT NULL,
    domain character varying(128),
    title character varying(128),
    description text,
    dateposted timestamp without time zone DEFAULT now(),
    jobclass integer,
    degreereq integer,
    expreq numeric
);


ALTER TABLE public.jobs OWNER TO tony;

--
-- Name: jobs_jid_seq; Type: SEQUENCE; Schema: public; Owner: tony
--

CREATE SEQUENCE jobs_jid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jobs_jid_seq OWNER TO tony;

--
-- Name: jobs_jid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tony
--

ALTER SEQUENCE jobs_jid_seq OWNED BY jobs.jid;


--
-- Name: personalityquestions; Type: TABLE; Schema: public; Owner: tony; Tablespace: 
--

CREATE TABLE personalityquestions (
    id integer NOT NULL,
    question character varying(128),
    weight integer,
    testname character varying(20),
    flags character varying(20),
    set integer
);


ALTER TABLE public.personalityquestions OWNER TO tony;

--
-- Name: personalityquestions_id_seq; Type: SEQUENCE; Schema: public; Owner: tony
--

CREATE SEQUENCE personalityquestions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personalityquestions_id_seq OWNER TO tony;

--
-- Name: personalityquestions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tony
--

ALTER SEQUENCE personalityquestions_id_seq OWNED BY personalityquestions.id;


--
-- Name: personalityresponses; Type: TABLE; Schema: public; Owner: tony; Tablespace: 
--

CREATE TABLE personalityresponses (
    id integer NOT NULL,
    response character varying(128),
    weight integer,
    testname character varying(20),
    set integer,
    fval double precision
);


ALTER TABLE public.personalityresponses OWNER TO tony;

--
-- Name: personalityresponses_id_seq; Type: SEQUENCE; Schema: public; Owner: tony
--

CREATE SEQUENCE personalityresponses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personalityresponses_id_seq OWNER TO tony;

--
-- Name: personalityresponses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tony
--

ALTER SEQUENCE personalityresponses_id_seq OWNED BY personalityresponses.id;


--
-- Name: personalitytraits; Type: TABLE; Schema: public; Owner: tony; Tablespace: 
--

CREATE TABLE personalitytraits (
    id integer NOT NULL,
    uid integer,
    qid integer,
    rid integer
);


ALTER TABLE public.personalitytraits OWNER TO tony;

--
-- Name: personalitytraits_id_seq; Type: SEQUENCE; Schema: public; Owner: tony
--

CREATE SEQUENCE personalitytraits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personalitytraits_id_seq OWNER TO tony;

--
-- Name: personalitytraits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tony
--

ALTER SEQUENCE personalitytraits_id_seq OWNED BY personalitytraits.id;


--
-- Name: profiles; Type: TABLE; Schema: public; Owner: tony; Tablespace: 
--

CREATE TABLE profiles (
    pid integer NOT NULL,
    uid integer,
    firstname character varying(45),
    lastname character varying(45),
    address1 character varying(128),
    address2 character varying(128),
    city character varying(45),
    state integer,
    postalcode character varying(11),
    phone character varying(10),
    relocateok boolean,
    salarylow integer,
    salaryhigh integer
);


ALTER TABLE public.profiles OWNER TO tony;

--
-- Name: profiles_pid_seq; Type: SEQUENCE; Schema: public; Owner: tony
--

CREATE SEQUENCE profiles_pid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.profiles_pid_seq OWNER TO tony;

--
-- Name: profiles_pid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tony
--

ALTER SEQUENCE profiles_pid_seq OWNED BY profiles.pid;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: tony; Tablespace: 
--

CREATE TABLE roles (
    id integer NOT NULL,
    name character varying(60)
);


ALTER TABLE public.roles OWNER TO tony;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: tony
--

CREATE SEQUENCE roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO tony;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tony
--

ALTER SEQUENCE roles_id_seq OWNED BY roles.id;


--
-- Name: skillslist; Type: TABLE; Schema: public; Owner: tony; Tablespace: 
--

CREATE TABLE skillslist (
    id integer NOT NULL,
    skill character varying(40)
);


ALTER TABLE public.skillslist OWNER TO tony;

--
-- Name: skillslist_id_seq; Type: SEQUENCE; Schema: public; Owner: tony
--

CREATE SEQUENCE skillslist_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.skillslist_id_seq OWNER TO tony;

--
-- Name: skillslist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tony
--

ALTER SEQUENCE skillslist_id_seq OWNED BY skillslist.id;


--
-- Name: skillsuser; Type: TABLE; Schema: public; Owner: tony; Tablespace: 
--

CREATE TABLE skillsuser (
    id integer NOT NULL,
    sid integer,
    uid integer,
    linkedinid character varying(16)
);


ALTER TABLE public.skillsuser OWNER TO tony;

--
-- Name: skillsuser_id_seq; Type: SEQUENCE; Schema: public; Owner: tony
--

CREATE SEQUENCE skillsuser_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.skillsuser_id_seq OWNER TO tony;

--
-- Name: skillsuser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tony
--

ALTER SEQUENCE skillsuser_id_seq OWNED BY skillsuser.id;


--
-- Name: states; Type: TABLE; Schema: public; Owner: tony; Tablespace: 
--

CREATE TABLE states (
    id integer NOT NULL,
    name character varying(60)
);


ALTER TABLE public.states OWNER TO tony;

--
-- Name: states_id_seq; Type: SEQUENCE; Schema: public; Owner: tony
--

CREATE SEQUENCE states_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.states_id_seq OWNER TO tony;

--
-- Name: states_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tony
--

ALTER SEQUENCE states_id_seq OWNED BY states.id;


--
-- Name: static_content; Type: TABLE; Schema: public; Owner: tony; Tablespace: 
--

CREATE TABLE static_content (
    spath character varying(40) NOT NULL,
    scontent text
);


ALTER TABLE public.static_content OWNER TO tony;

--
-- Name: trait_results; Type: TABLE; Schema: public; Owner: tony; Tablespace: 
--

CREATE TABLE trait_results (
    id integer NOT NULL,
    uid integer,
    jmtid integer,
    value double precision
);


ALTER TABLE public.trait_results OWNER TO tony;

--
-- Name: trait_results_id_seq; Type: SEQUENCE; Schema: public; Owner: tony
--

CREATE SEQUENCE trait_results_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trait_results_id_seq OWNER TO tony;

--
-- Name: trait_results_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tony
--

ALTER SEQUENCE trait_results_id_seq OWNED BY trait_results.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: tony; Tablespace: 
--

CREATE TABLE users (
    uid integer NOT NULL,
    domain character varying(128),
    username character varying(128),
    pass character varying(130),
    usertype character varying(2) DEFAULT 'JS'::character varying,
    datecreated timestamp without time zone DEFAULT now(),
    oauth text
);


ALTER TABLE public.users OWNER TO tony;

--
-- Name: users_uid_seq; Type: SEQUENCE; Schema: public; Owner: tony
--

CREATE SEQUENCE users_uid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_uid_seq OWNER TO tony;

--
-- Name: users_uid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tony
--

ALTER SEQUENCE users_uid_seq OWNED BY users.uid;


--
-- Name: videorequests; Type: TABLE; Schema: public; Owner: tony; Tablespace: 
--

CREATE TABLE videorequests (
    id integer NOT NULL,
    uid integer,
    jid integer,
    rid character varying(64),
    vidpath character varying(512)
);


ALTER TABLE public.videorequests OWNER TO tony;

--
-- Name: videorequests_id_seq; Type: SEQUENCE; Schema: public; Owner: tony
--

CREATE SEQUENCE videorequests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.videorequests_id_seq OWNER TO tony;

--
-- Name: videorequests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tony
--

ALTER SEQUENCE videorequests_id_seq OWNED BY videorequests.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tony
--

ALTER TABLE ONLY aroles ALTER COLUMN id SET DEFAULT nextval('aroles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tony
--

ALTER TABLE ONLY bioanswers ALTER COLUMN id SET DEFAULT nextval('bioanswers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tony
--

ALTER TABLE ONLY bioquestions ALTER COLUMN id SET DEFAULT nextval('bioquestions_id_seq'::regclass);


--
-- Name: did; Type: DEFAULT; Schema: public; Owner: tony
--

ALTER TABLE ONLY degreetypes ALTER COLUMN did SET DEFAULT nextval('degreetypes_did_seq'::regclass);


--
-- Name: eid; Type: DEFAULT; Schema: public; Owner: tony
--

ALTER TABLE ONLY education ALTER COLUMN eid SET DEFAULT nextval('education_eid_seq'::regclass);


--
-- Name: eid; Type: DEFAULT; Schema: public; Owner: tony
--

ALTER TABLE ONLY employers ALTER COLUMN eid SET DEFAULT nextval('employers_eid_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tony
--

ALTER TABLE ONLY job_reqs ALTER COLUMN id SET DEFAULT nextval('job_reqs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tony
--

ALTER TABLE ONLY job_reqs_precanned ALTER COLUMN id SET DEFAULT nextval('job_reqs_precanned_id_seq'::regclass);


--
-- Name: jid; Type: DEFAULT; Schema: public; Owner: tony
--

ALTER TABLE ONLY jobclasses ALTER COLUMN jid SET DEFAULT nextval('jobclasses_jid_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tony
--

ALTER TABLE ONLY jobmatches ALTER COLUMN id SET DEFAULT nextval('jobmatches_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tony
--

ALTER TABLE ONLY jobmatchtraits ALTER COLUMN id SET DEFAULT nextval('jobmatchtraits_id_seq'::regclass);


--
-- Name: jid; Type: DEFAULT; Schema: public; Owner: tony
--

ALTER TABLE ONLY jobs ALTER COLUMN jid SET DEFAULT nextval('jobs_jid_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tony
--

ALTER TABLE ONLY personalityquestions ALTER COLUMN id SET DEFAULT nextval('personalityquestions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tony
--

ALTER TABLE ONLY personalityresponses ALTER COLUMN id SET DEFAULT nextval('personalityresponses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tony
--

ALTER TABLE ONLY personalitytraits ALTER COLUMN id SET DEFAULT nextval('personalitytraits_id_seq'::regclass);


--
-- Name: pid; Type: DEFAULT; Schema: public; Owner: tony
--

ALTER TABLE ONLY profiles ALTER COLUMN pid SET DEFAULT nextval('profiles_pid_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tony
--

ALTER TABLE ONLY roles ALTER COLUMN id SET DEFAULT nextval('roles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tony
--

ALTER TABLE ONLY skillslist ALTER COLUMN id SET DEFAULT nextval('skillslist_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tony
--

ALTER TABLE ONLY skillsuser ALTER COLUMN id SET DEFAULT nextval('skillsuser_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tony
--

ALTER TABLE ONLY states ALTER COLUMN id SET DEFAULT nextval('states_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tony
--

ALTER TABLE ONLY trait_results ALTER COLUMN id SET DEFAULT nextval('trait_results_id_seq'::regclass);


--
-- Name: uid; Type: DEFAULT; Schema: public; Owner: tony
--

ALTER TABLE ONLY users ALTER COLUMN uid SET DEFAULT nextval('users_uid_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tony
--

ALTER TABLE ONLY videorequests ALTER COLUMN id SET DEFAULT nextval('videorequests_id_seq'::regclass);


--
-- Name: jobmatches_uid_jid_version_key; Type: CONSTRAINT; Schema: public; Owner: tony; Tablespace: 
--

ALTER TABLE ONLY jobmatches
    ADD CONSTRAINT jobmatches_uid_jid_version_key UNIQUE (uid, jid, version);


--
-- Name: p_aroles; Type: CONSTRAINT; Schema: public; Owner: tony; Tablespace: 
--

ALTER TABLE ONLY aroles
    ADD CONSTRAINT p_aroles PRIMARY KEY (id);


--
-- Name: p_aroles_rid_uid; Type: CONSTRAINT; Schema: public; Owner: tony; Tablespace: 
--

ALTER TABLE ONLY aroles
    ADD CONSTRAINT p_aroles_rid_uid UNIQUE (rid, uid);


--
-- Name: p_bioanswers; Type: CONSTRAINT; Schema: public; Owner: tony; Tablespace: 
--

ALTER TABLE ONLY bioanswers
    ADD CONSTRAINT p_bioanswers PRIMARY KEY (id);


--
-- Name: p_bioanswers_uid_qid; Type: CONSTRAINT; Schema: public; Owner: tony; Tablespace: 
--

ALTER TABLE ONLY bioanswers
    ADD CONSTRAINT p_bioanswers_uid_qid UNIQUE (uid, qid);


--
-- Name: p_bioquestions; Type: CONSTRAINT; Schema: public; Owner: tony; Tablespace: 
--

ALTER TABLE ONLY bioquestions
    ADD CONSTRAINT p_bioquestions PRIMARY KEY (id);


--
-- Name: p_degreetypes; Type: CONSTRAINT; Schema: public; Owner: tony; Tablespace: 
--

ALTER TABLE ONLY degreetypes
    ADD CONSTRAINT p_degreetypes PRIMARY KEY (did);


--
-- Name: p_education; Type: CONSTRAINT; Schema: public; Owner: tony; Tablespace: 
--

ALTER TABLE ONLY education
    ADD CONSTRAINT p_education PRIMARY KEY (eid);


--
-- Name: p_education_linkedinid; Type: CONSTRAINT; Schema: public; Owner: tony; Tablespace: 
--

ALTER TABLE ONLY education
    ADD CONSTRAINT p_education_linkedinid UNIQUE (linkedinid);


--
-- Name: p_employers; Type: CONSTRAINT; Schema: public; Owner: tony; Tablespace: 
--

ALTER TABLE ONLY employers
    ADD CONSTRAINT p_employers PRIMARY KEY (eid);


--
-- Name: p_employers_linkedinid; Type: CONSTRAINT; Schema: public; Owner: tony; Tablespace: 
--

ALTER TABLE ONLY employers
    ADD CONSTRAINT p_employers_linkedinid UNIQUE (linkedinid);


--
-- Name: p_job_reqs; Type: CONSTRAINT; Schema: public; Owner: tony; Tablespace: 
--

ALTER TABLE ONLY job_reqs
    ADD CONSTRAINT p_job_reqs PRIMARY KEY (id);


--
-- Name: p_job_reqs_precanned; Type: CONSTRAINT; Schema: public; Owner: tony; Tablespace: 
--

ALTER TABLE ONLY job_reqs_precanned
    ADD CONSTRAINT p_job_reqs_precanned PRIMARY KEY (id);


--
-- Name: p_jobclasses; Type: CONSTRAINT; Schema: public; Owner: tony; Tablespace: 
--

ALTER TABLE ONLY jobclasses
    ADD CONSTRAINT p_jobclasses PRIMARY KEY (jid);


--
-- Name: p_jobmatches; Type: CONSTRAINT; Schema: public; Owner: tony; Tablespace: 
--

ALTER TABLE ONLY jobmatches
    ADD CONSTRAINT p_jobmatches PRIMARY KEY (id);


--
-- Name: p_jobmatchtraits; Type: CONSTRAINT; Schema: public; Owner: tony; Tablespace: 
--

ALTER TABLE ONLY jobmatchtraits
    ADD CONSTRAINT p_jobmatchtraits PRIMARY KEY (id);


--
-- Name: p_jobs; Type: CONSTRAINT; Schema: public; Owner: tony; Tablespace: 
--

ALTER TABLE ONLY jobs
    ADD CONSTRAINT p_jobs PRIMARY KEY (jid);


--
-- Name: p_personalityquestions; Type: CONSTRAINT; Schema: public; Owner: tony; Tablespace: 
--

ALTER TABLE ONLY personalityquestions
    ADD CONSTRAINT p_personalityquestions PRIMARY KEY (id);


--
-- Name: p_personalityresponses; Type: CONSTRAINT; Schema: public; Owner: tony; Tablespace: 
--

ALTER TABLE ONLY personalityresponses
    ADD CONSTRAINT p_personalityresponses PRIMARY KEY (id);


--
-- Name: p_personalitytraits; Type: CONSTRAINT; Schema: public; Owner: tony; Tablespace: 
--

ALTER TABLE ONLY personalitytraits
    ADD CONSTRAINT p_personalitytraits PRIMARY KEY (id);


--
-- Name: p_personalitytraits_uid_qid; Type: CONSTRAINT; Schema: public; Owner: tony; Tablespace: 
--

ALTER TABLE ONLY personalitytraits
    ADD CONSTRAINT p_personalitytraits_uid_qid UNIQUE (uid, qid);


--
-- Name: p_profiles; Type: CONSTRAINT; Schema: public; Owner: tony; Tablespace: 
--

ALTER TABLE ONLY profiles
    ADD CONSTRAINT p_profiles PRIMARY KEY (pid);


--
-- Name: p_roles; Type: CONSTRAINT; Schema: public; Owner: tony; Tablespace: 
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT p_roles PRIMARY KEY (id);


--
-- Name: p_skillslist; Type: CONSTRAINT; Schema: public; Owner: tony; Tablespace: 
--

ALTER TABLE ONLY skillslist
    ADD CONSTRAINT p_skillslist PRIMARY KEY (id);


--
-- Name: p_skillsuser; Type: CONSTRAINT; Schema: public; Owner: tony; Tablespace: 
--

ALTER TABLE ONLY skillsuser
    ADD CONSTRAINT p_skillsuser PRIMARY KEY (id);


--
-- Name: p_states; Type: CONSTRAINT; Schema: public; Owner: tony; Tablespace: 
--

ALTER TABLE ONLY states
    ADD CONSTRAINT p_states PRIMARY KEY (id);


--
-- Name: p_trait_results; Type: CONSTRAINT; Schema: public; Owner: tony; Tablespace: 
--

ALTER TABLE ONLY trait_results
    ADD CONSTRAINT p_trait_results PRIMARY KEY (id);


--
-- Name: p_trait_results_uid_jmtid; Type: CONSTRAINT; Schema: public; Owner: tony; Tablespace: 
--

ALTER TABLE ONLY trait_results
    ADD CONSTRAINT p_trait_results_uid_jmtid UNIQUE (uid, jmtid);


--
-- Name: p_users; Type: CONSTRAINT; Schema: public; Owner: tony; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT p_users PRIMARY KEY (uid);


--
-- Name: p_users_username; Type: CONSTRAINT; Schema: public; Owner: tony; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT p_users_username UNIQUE (username);


--
-- Name: p_videorequests; Type: CONSTRAINT; Schema: public; Owner: tony; Tablespace: 
--

ALTER TABLE ONLY videorequests
    ADD CONSTRAINT p_videorequests PRIMARY KEY (id);


--
-- Name: p_videorequests_uid_jid; Type: CONSTRAINT; Schema: public; Owner: tony; Tablespace: 
--

ALTER TABLE ONLY videorequests
    ADD CONSTRAINT p_videorequests_uid_jid UNIQUE (jid, uid);


--
-- Name: profiles_uid_key; Type: CONSTRAINT; Schema: public; Owner: tony; Tablespace: 
--

ALTER TABLE ONLY profiles
    ADD CONSTRAINT profiles_uid_key UNIQUE (uid);


--
-- Name: skillsuser_linkedinid_key; Type: CONSTRAINT; Schema: public; Owner: tony; Tablespace: 
--

ALTER TABLE ONLY skillsuser
    ADD CONSTRAINT skillsuser_linkedinid_key UNIQUE (linkedinid);


--
-- Name: static_content_spath_key; Type: CONSTRAINT; Schema: public; Owner: tony; Tablespace: 
--

ALTER TABLE ONLY static_content
    ADD CONSTRAINT static_content_spath_key UNIQUE (spath);


--
-- Name: aroles_rid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tony
--

ALTER TABLE ONLY aroles
    ADD CONSTRAINT aroles_rid_fkey FOREIGN KEY (rid) REFERENCES roles(id);


--
-- Name: aroles_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tony
--

ALTER TABLE ONLY aroles
    ADD CONSTRAINT aroles_uid_fkey FOREIGN KEY (uid) REFERENCES users(uid);


--
-- Name: bioanswers_qid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tony
--

ALTER TABLE ONLY bioanswers
    ADD CONSTRAINT bioanswers_qid_fkey FOREIGN KEY (qid) REFERENCES bioquestions(id);


--
-- Name: bioanswers_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tony
--

ALTER TABLE ONLY bioanswers
    ADD CONSTRAINT bioanswers_uid_fkey FOREIGN KEY (uid) REFERENCES users(uid);


--
-- Name: education_degreetype_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tony
--

ALTER TABLE ONLY education
    ADD CONSTRAINT education_degreetype_fkey FOREIGN KEY (degreetype) REFERENCES degreetypes(did);


--
-- Name: education_state_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tony
--

ALTER TABLE ONLY education
    ADD CONSTRAINT education_state_fkey FOREIGN KEY (state) REFERENCES states(id);


--
-- Name: education_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tony
--

ALTER TABLE ONLY education
    ADD CONSTRAINT education_uid_fkey FOREIGN KEY (uid) REFERENCES users(uid);


--
-- Name: employers_jobclass_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tony
--

ALTER TABLE ONLY employers
    ADD CONSTRAINT employers_jobclass_fkey FOREIGN KEY (jobclass) REFERENCES jobclasses(jid);


--
-- Name: employers_state_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tony
--

ALTER TABLE ONLY employers
    ADD CONSTRAINT employers_state_fkey FOREIGN KEY (state) REFERENCES states(id);


--
-- Name: employers_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tony
--

ALTER TABLE ONLY employers
    ADD CONSTRAINT employers_uid_fkey FOREIGN KEY (uid) REFERENCES users(uid);


--
-- Name: job_reqs_jmtid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tony
--

ALTER TABLE ONLY job_reqs
    ADD CONSTRAINT job_reqs_jmtid_fkey FOREIGN KEY (jmtid) REFERENCES jobmatchtraits(id);


--
-- Name: job_reqs_jobid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tony
--

ALTER TABLE ONLY job_reqs
    ADD CONSTRAINT job_reqs_jobid_fkey FOREIGN KEY (jobid) REFERENCES jobs(jid);


--
-- Name: job_reqs_precanned_jid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tony
--

ALTER TABLE ONLY job_reqs_precanned
    ADD CONSTRAINT job_reqs_precanned_jid_fkey FOREIGN KEY (jid) REFERENCES jobclasses(jid);


--
-- Name: job_reqs_precanned_jmtid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tony
--

ALTER TABLE ONLY job_reqs_precanned
    ADD CONSTRAINT job_reqs_precanned_jmtid_fkey FOREIGN KEY (jmtid) REFERENCES jobmatchtraits(id);


--
-- Name: jobmatches_jid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tony
--

ALTER TABLE ONLY jobmatches
    ADD CONSTRAINT jobmatches_jid_fkey FOREIGN KEY (jid) REFERENCES jobs(jid);


--
-- Name: jobmatches_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tony
--

ALTER TABLE ONLY jobmatches
    ADD CONSTRAINT jobmatches_uid_fkey FOREIGN KEY (uid) REFERENCES users(uid);


--
-- Name: jobs_degreereq_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tony
--

ALTER TABLE ONLY jobs
    ADD CONSTRAINT jobs_degreereq_fkey FOREIGN KEY (degreereq) REFERENCES degreetypes(did);


--
-- Name: jobs_jobclass_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tony
--

ALTER TABLE ONLY jobs
    ADD CONSTRAINT jobs_jobclass_fkey FOREIGN KEY (jobclass) REFERENCES jobclasses(jid);


--
-- Name: personalitytraits_qid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tony
--

ALTER TABLE ONLY personalitytraits
    ADD CONSTRAINT personalitytraits_qid_fkey FOREIGN KEY (qid) REFERENCES personalityquestions(id);


--
-- Name: personalitytraits_rid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tony
--

ALTER TABLE ONLY personalitytraits
    ADD CONSTRAINT personalitytraits_rid_fkey FOREIGN KEY (rid) REFERENCES personalityresponses(id);


--
-- Name: personalitytraits_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tony
--

ALTER TABLE ONLY personalitytraits
    ADD CONSTRAINT personalitytraits_uid_fkey FOREIGN KEY (uid) REFERENCES users(uid);


--
-- Name: profiles_state_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tony
--

ALTER TABLE ONLY profiles
    ADD CONSTRAINT profiles_state_fkey FOREIGN KEY (state) REFERENCES states(id);


--
-- Name: profiles_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tony
--

ALTER TABLE ONLY profiles
    ADD CONSTRAINT profiles_uid_fkey FOREIGN KEY (uid) REFERENCES users(uid);


--
-- Name: skillsuser_sid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tony
--

ALTER TABLE ONLY skillsuser
    ADD CONSTRAINT skillsuser_sid_fkey FOREIGN KEY (sid) REFERENCES skillslist(id);


--
-- Name: skillsuser_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tony
--

ALTER TABLE ONLY skillsuser
    ADD CONSTRAINT skillsuser_uid_fkey FOREIGN KEY (uid) REFERENCES users(uid);


--
-- Name: trait_results_jmtid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tony
--

ALTER TABLE ONLY trait_results
    ADD CONSTRAINT trait_results_jmtid_fkey FOREIGN KEY (jmtid) REFERENCES jobmatchtraits(id);


--
-- Name: trait_results_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tony
--

ALTER TABLE ONLY trait_results
    ADD CONSTRAINT trait_results_uid_fkey FOREIGN KEY (uid) REFERENCES users(uid);


--
-- Name: videorequests_jid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tony
--

ALTER TABLE ONLY videorequests
    ADD CONSTRAINT videorequests_jid_fkey FOREIGN KEY (jid) REFERENCES jobs(jid);


--
-- Name: videorequests_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tony
--

ALTER TABLE ONLY videorequests
    ADD CONSTRAINT videorequests_uid_fkey FOREIGN KEY (uid) REFERENCES users(uid);


--
-- PostgreSQL database dump complete
--

