--
-- PostgreSQL database dump
--

-- Dumped from database version 13.0
-- Dumped by pg_dump version 13.0

-- Started on 2021-06-02 19:14:57

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
-- TOC entry 222 (class 1255 OID 44418)
-- Name: author_null(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.author_null() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
	IF NEW.nama is null THEN
		DELETE FROM author
		WHERE nama is null;
	END IF;

	RETURN NEW;
END;
$$;


ALTER FUNCTION public.author_null() OWNER TO postgres;

--
-- TOC entry 220 (class 1255 OID 42192)
-- Name: penelitian_null(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.penelitian_null() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
	IF NEW.skim_penelitian is null THEN
		DELETE FROM penelitian
		WHERE skim_penelitian is null
		OR nama_ketua_penelitian is null
		OR jurusan is null
		OR judul is null;
	END IF;
	
	RETURN NEW;
END;
$$;


ALTER FUNCTION public.penelitian_null() OWNER TO postgres;

--
-- TOC entry 221 (class 1255 OID 42193)
-- Name: pengabdian_null(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.pengabdian_null() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
	IF NEW.skim_pengabdian is null THEN
		DELETE FROM pengabdian
		WHERE skim_pengabdian is null
		OR nama_ketua_pengabdian is null
		OR jurusan is null
		OR judul is null;
	END IF;
	
	RETURN NEW;
END;
$$;


ALTER FUNCTION public.pengabdian_null() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 210 (class 1259 OID 47199)
-- Name: author; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.author (
    id integer NOT NULL,
    nidn character(20),
    nama character varying(191) NOT NULL,
    gelar_depan character varying(50),
    gelar_belakang character varying(50),
    avatar character varying(191),
    jurusan character varying(50) NOT NULL,
    id_prodi integer,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.author OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 47197)
-- Name: author_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.author_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.author_id_seq OWNER TO postgres;

--
-- TOC entry 3127 (class 0 OID 0)
-- Dependencies: 209
-- Name: author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.author_id_seq OWNED BY public.author.id;


--
-- TOC entry 206 (class 1259 OID 47171)
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(191) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 47169)
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.failed_jobs_id_seq OWNER TO postgres;

--
-- TOC entry 3128 (class 0 OID 0)
-- Dependencies: 205
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- TOC entry 214 (class 1259 OID 47225)
-- Name: jurusan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jurusan (
    id integer NOT NULL,
    nama_jurusan character varying(50) NOT NULL,
    logo character varying(191),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.jurusan OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 47223)
-- Name: jurusan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jurusan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jurusan_id_seq OWNER TO postgres;

--
-- TOC entry 3129 (class 0 OID 0)
-- Dependencies: 213
-- Name: jurusan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.jurusan_id_seq OWNED BY public.jurusan.id;


--
-- TOC entry 201 (class 1259 OID 47143)
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(191) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 47141)
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migrations_id_seq OWNER TO postgres;

--
-- TOC entry 3130 (class 0 OID 0)
-- Dependencies: 200
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- TOC entry 204 (class 1259 OID 47165)
-- Name: password_resets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.password_resets (
    email character varying(191) NOT NULL,
    token character varying(191) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_resets OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 47255)
-- Name: penelitian; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.penelitian (
    id integer NOT NULL,
    skim_penelitian character varying(191),
    nama_ketua_penelitian character varying(191),
    jurusan character varying(50) NOT NULL,
    judul text NOT NULL,
    abstrak text,
    besar_dana double precision,
    tahun character(4) NOT NULL,
    kategori character varying(255) NOT NULL,
    nama_anggota character varying(191),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT penelitian_kategori_check CHECK (((kategori)::text = ANY ((ARRAY['Internal'::character varying, 'DIKTI'::character varying])::text[])))
);


ALTER TABLE public.penelitian OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 47253)
-- Name: penelitian_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.penelitian_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.penelitian_id_seq OWNER TO postgres;

--
-- TOC entry 3131 (class 0 OID 0)
-- Dependencies: 216
-- Name: penelitian_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.penelitian_id_seq OWNED BY public.penelitian.id;


--
-- TOC entry 219 (class 1259 OID 47277)
-- Name: pengabdian; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pengabdian (
    id integer NOT NULL,
    skim_pengabdian character varying(191),
    nama_ketua_pengabdian character varying(191),
    jurusan character varying(50) NOT NULL,
    judul text NOT NULL,
    abstrak text,
    besar_dana double precision,
    tahun character(4) NOT NULL,
    kategori character varying(255) NOT NULL,
    nama_anggota character varying(191),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT pengabdian_kategori_check CHECK (((kategori)::text = ANY ((ARRAY['Internal'::character varying, 'DIKTI'::character varying])::text[])))
);


ALTER TABLE public.pengabdian OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 47275)
-- Name: pengabdian_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pengabdian_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pengabdian_id_seq OWNER TO postgres;

--
-- TOC entry 3132 (class 0 OID 0)
-- Dependencies: 218
-- Name: pengabdian_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pengabdian_id_seq OWNED BY public.pengabdian.id;


--
-- TOC entry 208 (class 1259 OID 47185)
-- Name: personal_access_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personal_access_tokens (
    id bigint NOT NULL,
    tokenable_type character varying(191) NOT NULL,
    tokenable_id bigint NOT NULL,
    name character varying(191) NOT NULL,
    token character varying(64) NOT NULL,
    abilities text,
    last_used_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.personal_access_tokens OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 47183)
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personal_access_tokens_id_seq OWNER TO postgres;

--
-- TOC entry 3133 (class 0 OID 0)
-- Dependencies: 207
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;


--
-- TOC entry 212 (class 1259 OID 47212)
-- Name: prodi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prodi (
    id integer NOT NULL,
    nama_prodi character varying(50) NOT NULL,
    jenjang character(2) NOT NULL,
    id_jurusan integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.prodi OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 47210)
-- Name: prodi_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.prodi_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prodi_id_seq OWNER TO postgres;

--
-- TOC entry 3134 (class 0 OID 0)
-- Dependencies: 211
-- Name: prodi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.prodi_id_seq OWNED BY public.prodi.id;


--
-- TOC entry 215 (class 1259 OID 47243)
-- Name: sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sessions (
    id character varying(191) NOT NULL,
    user_id bigint,
    ip_address character varying(45),
    user_agent text,
    payload text NOT NULL,
    last_activity integer NOT NULL
);


ALTER TABLE public.sessions OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 47151)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    nidn character(20) NOT NULL,
    nama character varying(50) NOT NULL,
    email character varying(191) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(191) NOT NULL,
    "isAdmin" smallint DEFAULT '0'::smallint NOT NULL,
    remember_token character varying(100),
    current_team_id bigint,
    profile_photo_path text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    two_factor_secret text,
    two_factor_recovery_codes text
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 47149)
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
-- TOC entry 3135 (class 0 OID 0)
-- Dependencies: 202
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 2922 (class 2604 OID 47202)
-- Name: author id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.author ALTER COLUMN id SET DEFAULT nextval('public.author_id_seq'::regclass);


--
-- TOC entry 2919 (class 2604 OID 47174)
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- TOC entry 2924 (class 2604 OID 47228)
-- Name: jurusan id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jurusan ALTER COLUMN id SET DEFAULT nextval('public.jurusan_id_seq'::regclass);


--
-- TOC entry 2916 (class 2604 OID 47146)
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- TOC entry 2925 (class 2604 OID 47258)
-- Name: penelitian id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.penelitian ALTER COLUMN id SET DEFAULT nextval('public.penelitian_id_seq'::regclass);


--
-- TOC entry 2927 (class 2604 OID 47280)
-- Name: pengabdian id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pengabdian ALTER COLUMN id SET DEFAULT nextval('public.pengabdian_id_seq'::regclass);


--
-- TOC entry 2921 (class 2604 OID 47188)
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);


--
-- TOC entry 2923 (class 2604 OID 47215)
-- Name: prodi id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prodi ALTER COLUMN id SET DEFAULT nextval('public.prodi_id_seq'::regclass);


--
-- TOC entry 2917 (class 2604 OID 47154)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3112 (class 0 OID 47199)
-- Dependencies: 210
-- Data for Name: author; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.author (id, nidn, nama, gelar_depan, gelar_belakang, avatar, jurusan, id_prodi, created_at, updated_at) FROM stdin;
3	\N	Nuhung Sulaeman	\N	\N	\N	teknik elektro	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
6	\N	Fuad Zaenuri	\N	\N	\N	teknik mesin	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
7	\N	Yenniwarti Rafsyam	\N	\N	\N	teknik elektro	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
10	\N	Hibertus Rudi Kusumantoro	\N	\N	\N	teknik grafika dan penerbitan	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
13	\N	Mohammad Zaenal Abidin Eko	\N	\N	\N	teknik grafika dan penerbitan	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
15	\N	Wisnu Hendri Mulyadi	\N	\N	\N	teknik elektro	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
20	\N	Heri Setyawan	\N	S.E., M.Si.	\N	administrasi niaga	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
24	\N	Fatimah	\N	S.E., M.M.	\N	akuntansi	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
25	\N	Ida Syafrida	\N	S.E., M.Si.	\N	akuntansi	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
27	\N	Sri Lestari K	\N	S.T., M.T.	\N	teknik elektro	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
29	\N	Zulmaita	\N	S.E., M.M.	\N	akuntansi	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
30	\N	A Rudi Hermawan	\N	S.T., M.T.	\N	teknik sipil	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
31	\N	Dewin Purnama	\N	S.T., M.T.	\N	teknik mesin	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
33	\N	Sri Danaryani	Ir.	M.T.	\N	teknik elektro	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
37	\N	Yogi Widiawati	Dra.	M.Hum.	\N	teknik elektro	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
38	\N	Eva Azhra Latifa	\N	S.T., M.T.	\N	teknik sipil	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
39	\N	Gun Gun Ramdlan Gunadi	\N	M.T.	\N	teknik mesin	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
40	\N	Hidjan	Dr.	M.T.	\N	teknik sipil	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
42	\N	Hata Maulana	\N	S.Si., M.TI.	\N	teknik informatika dan komputer	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
43	\N	R. Agus Murdiyoto	Drs.	S.T., M.Si.	\N	teknik sipil	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
47	\N	Belyamin	Dr.	M.Sc.Eng., B.Eng(Hons)	\N	teknik mesin	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
51	\N	Supriatnoko	Dr.,Drs.	M.Hum.	\N	akuntansi	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
52	\N	Ismujianto	\N	S.T., M.T.	\N	teknik elektro	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
53	\N	Sudarno	\N	\N	\N	administrasi niaga	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
54	\N	Anicetus Damar Aji	\N	S.T., M.Kom.	\N	teknik elektro	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
55	\N	Anni Susilowati	\N	S.T., M.Eng.	\N	teknik sipil	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
57	\N	Atyanto Mahatmyo	\N	S.E., M.M., Akt	\N	akuntansi	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
59	\N	Titik Purwinarti	\N	S.Sos., M.Pd.	\N	administrasi niaga	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
60	\N	Sila Wardono	\N	S.T., M.Si.	\N	teknik elektro	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
62	\N	Prihatin Oktivasari	\N	S.Si., M.Si.	\N	teknik informatika dan komputer	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
63	\N	Fauzi Mubarak	\N	S.ST., M.T.	\N	administrasi niaga	\N	2021-06-02 09:34:09	2021-06-02 10:02:11
65	\N	Nuralam	\N	S.T., M.T.	\N	teknik elektro	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
69	\N	Anita Hidayati	Dr.	S.Kom., M.Kom.	\N	teknik informatika dan komputer	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
71	\N	Fajar Susilowati	\N	S.T., M.T.	\N	teknik sipil	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
73	\N	Iwan Sonjaya	\N	S.T., M.T.	\N	teknik informatika dan komputer	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
75	\N	Seto Tjahyono	\N	S.T., M.T.	\N	teknik mesin	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
76	\N	Mauldy Laya	\N	S.Kom., M.Kom.	\N	teknik informatika dan komputer	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
77	\N	Darul Nurjanah	Dra.	M.Si.	\N	teknik sipil	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
79	\N	MRR Tiyas Maheni DK	\N	S.H., M.H.	\N	teknik grafika dan penerbitan	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
78	\N	Andikanoza Pradiptya	\N	S.T., M.Eng.	\N	teknik sipil	\N	2021-06-02 09:34:09	2021-06-02 09:37:26
35	\N	Isdawimah	Dr.	S.T., M.T.	\N	teknik elektro	\N	2021-06-02 09:34:09	2021-06-02 09:37:26
14	\N	Ach Bakhrul Muchtasib	\N	S.E.I., M.Si.	\N	akuntansi	\N	2021-06-02 09:34:09	2021-06-02 09:34:49
9	\N	Sutanto	Ir.	M.T.	\N	teknik elektro	\N	2021-06-02 09:34:09	2021-06-02 09:37:04
12	\N	Ahmad Maksum	\N	S.T., M.T.	\N	teknik mesin	\N	2021-06-02 09:34:09	2021-06-02 09:37:04
44	\N	Paulus Sukusno	Ir.	A.Md., M.T.	\N	teknik mesin	\N	2021-06-02 09:34:09	2021-06-02 09:37:04
36	\N	Muryeti	\N	S.Si., M.Si.	\N	teknik grafika dan penerbitan	\N	2021-06-02 09:34:09	2021-06-02 10:02:11
5	\N	Bambang Waluyo	\N	S.E.	\N	akuntansi	\N	2021-06-02 09:34:09	2021-06-02 10:02:11
49	\N	Nur Hasyim	Dr.,Drs.	M.Si., M.Hum.	\N	akuntansi	\N	2021-06-02 09:34:09	2021-06-02 10:00:12
46	\N	Nining Latianingsih	Dr.	S.H., M.H.	\N	administrasi niaga	\N	2021-06-02 09:34:09	2021-06-02 10:00:12
61	\N	Cathryna Rumondang Bulan Simangunsong	\N	S.E., M.Kom.	\N	akuntansi	\N	2021-06-02 09:34:09	2021-06-02 10:00:12
19	\N	Aminuddin Debataraja	Dr.,Drs.	S.T., M.Si.	\N	teknik elektro	\N	2021-06-02 09:34:09	2021-06-02 10:00:12
32	\N	Ade Sukma Mulya	Dr.	 S.S., M.Hum.	\N	akuntansi	\N	2021-06-02 09:34:09	2021-06-02 10:00:12
50	\N	Ina Sukaesih	Dra.	M.M., M.Hum.	\N	akuntansi	\N	2021-06-02 09:34:09	2021-06-02 10:00:12
70	\N	Rosidi	\N	\N	\N	teknik mesin	\N	2021-06-02 09:34:09	2021-06-02 10:00:12
81	\N	Syamsu Rizal	\N	S.E., M.M.	\N	administrasi niaga	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
82	\N	Anwar Said	\N	S.ST., M.Kom.	\N	administrasi niaga	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
83	\N	Dewi Akbar	\N	S.E., M.M.	\N	administrasi niaga	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
85	\N	Eriya	\N	S.Kom., M.T.	\N	teknik informatika dan komputer	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
88	\N	Vika Rizkia	Dr.	S.T., M.T.	\N	teknik mesin	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
91	\N	Bernadeta Siti Rahayu Purwanti	Dra.	M.Si.	\N	teknik elektro	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
92	\N	Imam Halimi	\N	S.T., M.Si.	\N	teknik elektro	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
93	\N	Darwin	\N	S.T., M.Kom.	\N	teknik elektro	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
94	\N	Agus Setiawan	Drs.	M.Kom.	\N	teknik informatika dan komputer	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
95	\N	Indri Neforawati	\N	S.T., M.T.	\N	teknik informatika dan komputer	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
96	\N	Ali Masjono	\N	S.E., MBIT	\N	akuntansi	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
97	\N	Asep Apriana	\N	S.T., M.Kom.	\N	teknik mesin	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
99	\N	Achmad Nadjam	\N	S.T., M.T.	\N	teknik sipil	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
100	\N	Mochammad Sholeh	Drs.	S.T., M.T.	\N	teknik mesin	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
101	\N	Frianto	\N	S.E., M.M.	\N	akuntansi	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
102	\N	Benny Nixon	\N	S.T., M.T.	\N	teknik elektro	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
16	\N	Abdul Aziz Abdillah	Drs.	M.Si.	\N	teknik informatika dan komputer	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
103	\N	Asri Wulandari	\N	S.T., M.T.	\N	teknik elektro	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
106	\N	Eko Wiyono	Drs.	S.T., M.Eng.	\N	teknik sipil	\N	2021-06-02 09:34:10	2021-06-02 09:34:10
108	\N	Fatahula	\N	S.T., M.Kom.	\N	teknik elektro	\N	2021-06-02 09:34:10	2021-06-02 09:34:10
111	\N	Rika Novita Wardhani	\N	S.T., M.T.	\N	teknik elektro	\N	2021-06-02 09:34:10	2021-06-02 09:34:10
112	\N	Ade Haryani	\N	S.E., M.M.	\N	teknik grafika dan penerbitan	\N	2021-06-02 09:34:10	2021-06-02 09:34:10
115	\N	Tuti Hartati	Dra.	\N	\N	administrasi niaga	\N	2021-06-02 09:34:10	2021-06-02 09:34:10
116	\N	Putera Agung Maha Agung	\N	S.T., M.T., Ph.D.	\N	teknik sipil	\N	2021-06-02 09:34:10	2021-06-02 09:34:10
117	\N	Wartiyati	Dra.	M.Si.	\N	teknik elektro	\N	2021-06-02 09:34:10	2021-06-02 09:34:10
118	\N	Asrizal Tatang	Drs.	S.T.	\N	teknik mesin	\N	2021-06-02 09:34:10	2021-06-02 09:34:10
120	\N	Muhammad Thamrin	Ir.	M.Si.	\N	teknik elektro	\N	2021-06-02 09:34:10	2021-06-02 09:34:10
121	\N	Latif Mawardi	Drs.	S.T., M. Kom.	\N	teknik elektro	\N	2021-06-02 09:34:10	2021-06-02 09:34:10
122	\N	Muhtarom Riyadi	Drs.	S.ST., M.Eng.	\N	teknik sipil	\N	2021-06-02 09:34:10	2021-06-02 09:34:10
84	\N	Suyitno Gatot	Drs.	M.Kom	\N	teknik mesin	\N	2021-06-02 09:34:09	2021-06-02 09:37:26
123	\N	Mohammad Fathurahman	\N	S.T., M.T.	\N	teknik elektro	\N	2021-06-02 09:34:10	2021-06-02 09:34:10
124	\N	Ikhsan Kamil	Ir.	M.Kom.	\N	teknik elektro	\N	2021-06-02 09:34:10	2021-06-02 09:34:10
125	\N	Rahmat	\N	S.ST., M.T.	\N	teknik elektro	\N	2021-06-02 09:34:10	2021-06-02 09:34:10
126	\N	Rudi Edial	Drs.	M.T.	\N	teknik mesin	\N	2021-06-02 09:34:10	2021-06-02 09:34:10
127	\N	Ardina Askum HR	Dra.	M. Hum.	\N	teknik elektro	\N	2021-06-02 09:34:10	2021-06-02 09:34:10
128	\N	Tardi	\N	S.T., M.Kom.	\N	teknik elektro	\N	2021-06-02 09:34:10	2021-06-02 09:34:10
129	\N	Kusnadi	Drs.	S.T., M.Si.	\N	teknik elektro	\N	2021-06-02 09:34:10	2021-06-02 09:34:10
131	\N	Syaprudin	\N	S.T., M.Kom.	\N	teknik elektro	\N	2021-06-02 09:34:10	2021-06-02 09:34:10
114	\N	Jauhari Ali	Drs.	S.T., M.T.	\N	teknik mesin	\N	2021-06-02 09:34:10	2021-06-02 09:34:10
87	\N	Tri Widjatmaka	Drs.	S.E., M.M.	\N	teknik mesin	\N	2021-06-02 09:34:09	2021-06-02 09:34:10
132	\N	Iwan Supriyadi	\N	B.Sc., M.T.	\N	teknik sipil	\N	2021-06-02 09:34:10	2021-06-02 09:34:10
134	\N	Ade Sumpena	\N	\N	\N	teknik mesin	\N	2021-06-02 09:34:49	2021-06-02 09:34:49
48	\N	Ahmad Tossin Alamsyah	Dr.	S.T., M.T.	\N	teknik elektro	\N	2021-06-02 09:34:09	2021-06-02 09:34:49
135	\N	Riza Hadikusuma	\N	M.Ag.	\N	administrasi niaga	\N	2021-06-02 09:34:49	2021-06-02 09:34:49
136	\N	Immanuel Pratomojati	Drs.	\N	\N	teknik sipil	\N	2021-06-02 09:34:49	2021-06-02 09:34:49
137	\N	Risna Sari	\N	S.Kom., M.TI.	\N	teknik informatika dan komputer	\N	2021-06-02 09:34:49	2021-06-02 09:34:49
138	\N	I Ketut Sucita	\N	S.T., M.T.	\N	p3m	\N	2021-06-02 09:34:49	2021-06-02 09:34:49
139	\N	Masnadi	Dr.	\N	\N	teknik informatika dan komputer	\N	2021-06-02 09:34:49	2021-06-02 09:34:49
140	\N	Indriyani Rebet	\N	\N	\N	teknik mesin	\N	2021-06-02 09:34:49	2021-06-02 09:34:49
141	\N	Budi Prianto	\N	S.T.	\N	teknik mesin	\N	2021-06-02 09:34:49	2021-06-02 09:34:49
104	\N	Anik Tjandra Setiati	\N	S.T., M.M.	\N	teknik elektro	\N	2021-06-02 09:34:10	2021-06-02 09:34:49
146	\N	M Jamal Al-Bakri	\N	S.Psi., M.M.	\N	administrasi niaga	\N	2021-06-02 09:34:49	2021-06-02 09:34:49
66	\N	Novi Purnama Sari	\N	\N	\N	teknik grafika dan penerbitan	\N	2021-06-02 09:34:09	2021-06-02 09:34:49
147	\N	Sari Puspita Dewi	\N	M.Pd.	\N	teknik grafika dan penerbitan	\N	2021-06-02 09:34:49	2021-06-02 09:34:49
149	\N	Endah Wartiningsih	\N	S.E., M.M.	\N	administrasi niaga	\N	2021-06-02 09:34:49	2021-06-02 09:34:49
150	\N	Tuty Herawati	Dra.	\N	\N	administrasi niaga	\N	2021-06-02 09:34:49	2021-06-02 09:34:49
45	\N	Iis Mariam	Dr.,Dra.	M.Si.	\N	administrasi niaga	\N	2021-06-02 09:34:09	2021-06-02 09:34:49
151	\N	Lia Ekowati	\N	S.Sos., M.P.A.	\N	akuntansi	\N	2021-06-02 09:34:49	2021-06-02 09:34:49
153	\N	Novitasari	\N	S.Pd., M.Ak.	\N	akuntansi	\N	2021-06-02 09:34:49	2021-06-02 09:34:49
119	\N	Fachruddin	\N	S.T., M.T.	\N	teknik mesin	\N	2021-06-02 09:34:10	2021-06-02 09:37:04
145	\N	Efriyanto	\N	\N	\N	akuntansi	\N	2021-06-02 09:34:49	2021-06-02 09:37:04
98	\N	Indra Z	Drs.	S.ST., M.Kom	\N	teknik elektro	\N	2021-06-02 09:34:09	2021-06-02 09:37:26
90	\N	Sidiq Ruswanto	Drs.	S.T., M.Si.	\N	teknik mesin	\N	2021-06-02 09:34:09	2021-06-02 09:37:26
109	\N	Syafrizal Syarief	Drs.	S.T., M.T.	\N	teknik elektro	\N	2021-06-02 09:34:10	2021-06-02 09:37:26
110	\N	Agus Sukandi	Ir.	M.T.	\N	teknik mesin	\N	2021-06-02 09:34:10	2021-06-02 09:37:26
89	\N	Riandini	\N	S.T., M.Sc.	\N	teknik elektro	\N	2021-06-02 09:34:09	2021-06-02 10:00:12
80	\N	Cecep Gunawan	Drs.	M.Si.	\N	teknik grafika dan penerbitan	\N	2021-06-02 09:34:09	2021-06-02 10:00:12
148	\N	Endang Yuniarti	\N	S.T., M.T.	\N	teknik grafika dan penerbitan	\N	2021-06-02 09:34:49	2021-06-02 10:00:12
113	\N	Fitri Wijayanti	\N	S.Si., M.Eng.	\N	teknik mesin	\N	2021-06-02 09:34:10	2021-06-02 10:00:12
133	\N	Azwardi	Drs.	S.T., M.Kom.	\N	teknik mesin	\N	2021-06-02 09:34:10	2021-06-02 10:00:12
143	\N	Andi Ulfiana	Ir.	M.Si.	\N	teknik mesin	\N	2021-06-02 09:34:49	2021-06-02 10:00:12
154	\N	Denny Yatmadi	\N	\N	\N	teknik sipil	\N	2021-06-02 09:34:49	2021-06-02 09:34:49
155	\N	Kusumo Drajad Sutjahjo	\N	S.T., M.Si.	\N	teknik sipil	\N	2021-06-02 09:34:49	2021-06-02 09:34:49
156	\N	Sarito	Drs.	S.T., M.Eng.	\N	teknik sipil	\N	2021-06-02 09:34:49	2021-06-02 09:34:49
158	\N	Nanang Rohadi	Dr.	S.T., M.T.	\N	teknik elektro	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
4	\N	Rimsky Kartika Judisseno	\N	S.E., M.M.	\N	administrasi niaga	\N	2021-06-02 09:34:09	2021-06-02 09:37:04
159	\N	Nedsal Sixpria	\N	S.E., M.M., Ak., CA	\N	akuntansi	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
160	\N	Kadunci	\N	S.E., M.Si.	\N	administrasi niaga	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
161	\N	Narulita Syarweni	\N	S.E., M.E.	\N	administrasi niaga	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
162	\N	Sulistyowati	\N	S.E., M.Si.	\N	administrasi niaga	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
163	\N	Zulhelman	\N	S.T., M.T.	\N	teknik elektro	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
164	\N	Andi Indianto	Drs.	S.T., M.T.	\N	teknik sipil	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
165	\N	Setiyadi	Drs.	S.T., M.T.	\N	teknik sipil	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
166	\N	Murtiningsih	\N	S.E., M.M.	\N	akuntansi	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
130	\N	Anwar Mustofa	Drs.	M.Hum.	\N	administrasi niaga	\N	2021-06-02 09:34:10	2021-06-02 09:37:04
168	\N	Azwar	\N	S.E., M.M.	\N	administrasi niaga	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
170	\N	Entis Sutisna	\N	S.T., M.T.	\N	teknik elektro	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
171	\N	Mohammad Fauzy	Drs.	M.Psi.	\N	teknik grafika dan penerbitan	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
74	\N	Agus Kusumaramdhani	\N	S.Si., M.Si.	\N	akuntansi	\N	2021-06-02 09:34:09	2021-06-02 09:37:04
172	\N	Rahmanita Vidyasari	\N	S.T., M.T.	\N	akuntansi	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
173	\N	Yosi Erfinda	\N	S.ST., M.Par.	\N	akuntansi	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
174	\N	Anita Rahmawati	\N	S.Kom., M.M.	\N	akuntansi	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
175	\N	Maria Nino Istia	\N	S.S., M.Si.	\N	administrasi niaga	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
11	\N	Husnil Barry	\N	S.E., M.S.M.	\N	administrasi niaga	\N	2021-06-02 09:34:09	2021-06-02 09:37:04
176	\N	Imam Syafganti	\N	S.Sos., M.Si.	\N	administrasi niaga	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
68	\N	Wahyudi Utomo	\N	S.Sos., M.Si.	\N	administrasi niaga	\N	2021-06-02 09:34:09	2021-06-02 09:37:04
177	\N	Anggi Anggarini	\N	M.Ds.	\N	teknik grafika dan penerbitan	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
72	\N	Emmidia Djonaedi	\N	S.T., M.T., M.B.A.	\N	teknik grafika dan penerbitan	\N	2021-06-02 09:34:09	2021-06-02 09:37:04
178	\N	Dini Handayani	\N	M.A., TESOL&ICT	\N	teknik grafika dan penerbitan	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
67	\N	Djony Herfan	\N	M.I.Kom.	\N	teknik grafika dan penerbitan	\N	2021-06-02 09:34:09	2021-06-02 09:37:04
179	\N	Budi Santoso	Ir.	M.T.	\N	teknik mesin	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
180	\N	Candra Damis Widiawaty	\N	S.TP., M.T.	\N	teknik mesin	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
181	\N	Imam Wahyudi	\N	\N	\N	teknik mesin	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
142	\N	Cecep Slamet Abadi	\N	S.T., M.T.	\N	teknik mesin	\N	2021-06-02 09:34:49	2021-06-02 09:37:04
182	\N	Herbirowo Nugroho	\N	S.E., M.Si.	\N	akuntansi	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
152	\N	Hayati Fatimah	\N	S.E., M.Ak., Ak., CA	\N	akuntansi	\N	2021-06-02 09:34:49	2021-06-02 09:37:04
183	\N	Heri Abrianto	\N	S.E., M.M.	\N	akuntansi	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
184	\N	Ni Made Widhi Sugianingsih	Dra.	M.M.	\N	administrasi niaga	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
105	\N	Kendi Moro Nitisasmita	\N	A.md., S.ST., M.Kom.	\N	teknik elektro	\N	2021-06-02 09:34:10	2021-06-02 09:37:04
56	\N	Minto Rahayu	\N	S.S., M.Si.	\N	teknik mesin	\N	2021-06-02 09:34:09	2021-06-02 09:37:04
186	\N	R Sugeng Mulyono	\N	M.Kom.	\N	teknik mesin	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
187	\N	Siti Aisiyah	Dra.	M.Hum.	\N	teknik sipil	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
23	\N	Christina Lipuring Rudatin	Dr.	S.E., M.Si.	\N	administrasi niaga	\N	2021-06-02 09:34:09	2021-06-02 09:37:04
22	\N	Titi Suhartati	Dr.	S.E, M.M., M.Ak, Ak., CA	\N	akuntansi	\N	2021-06-02 09:34:09	2021-06-02 09:37:04
188	\N	Sylvia Rozza	Dr.	\N	\N	akuntansi	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
189	\N	Petrus Hari Kuncoro Seno	\N	S.E., M.B.A.	\N	akuntansi	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
190	\N	Utami Puji Lestari	\N	S.E., Ak., M.Ak., Ph.D., CA	\N	akuntansi	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
26	\N	Amirudin	\N	S.E., M.M.	\N	administrasi niaga	\N	2021-06-02 09:34:09	2021-06-02 09:37:04
18	\N	Etty Khongrat	\N	S.E., M.Si.	\N	administrasi niaga	\N	2021-06-02 09:34:09	2021-06-02 09:37:04
191	\N	Eva Zulfa Nailufar	Dr.	\N	\N	administrasi niaga	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
8	\N	Murie Dwiyaniti	\N	S.T., M.T.	\N	teknik elektro	\N	2021-06-02 09:34:09	2021-06-02 09:37:04
2	\N	Toto Supriyanto	\N	S.T., M.T.	\N	teknik elektro	\N	2021-06-02 09:34:09	2021-06-02 09:37:04
58	\N	Yoyok Sabar Waluyo	\N	S.S., M.Hum.	\N	teknik informatika dan komputer	\N	2021-06-02 09:34:09	2021-06-02 09:37:04
192	\N	Emir Ridwan	Ir.	M.T.	\N	teknik mesin	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
193	\N	Adi Syuriadi	\N	M.T.	\N	teknik mesin	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
194	\N	Andrias Rudi Hermawan	\N	S.T., M.T.	\N	teknik sipil	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
17	\N	Tatun Hayatun Nufus	\N	S.Si, M.Si.	\N	teknik mesin	\N	2021-06-02 09:34:09	2021-06-02 09:37:04
195	\N	Iwan Susanto	\N	Ph.D.	\N	teknik mesin	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
196	\N	Eri Ester Khairas	Dr.,Dra.	M.Hum.	\N	teknik sipil	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
1	\N	Agus Edy Pramono	Prof.,Dr.,Drs.	S.T., M.T.	\N	teknik mesin	\N	2021-06-02 09:34:09	2021-06-02 10:00:12
197	\N	Dwi Agnes Natalia Bangun	\N	S.Ds., M.Ds.	\N	teknik grafika dan penerbitan	\N	2021-06-02 09:37:26	2021-06-02 09:37:26
198	\N	Afifah Muharikah	\N	S.S., M.Hum.	\N	teknik informatika dan komputer	\N	2021-06-02 09:37:26	2021-06-02 09:37:26
199	\N	Agus Supriyadi	\N	\N	\N	akuntansi	\N	2021-06-02 09:37:26	2021-06-02 09:37:26
185	\N	Azhmy Fawzi My	\N	M.I.Kom.	\N	teknik grafika dan penerbitan	\N	2021-06-02 09:37:04	2021-06-02 09:37:26
200	\N	Defiana Arnaldy	\N	S.TP., M.Si.	\N	teknik informatika dan komputer	\N	2021-06-02 09:37:26	2021-06-02 09:37:26
201	\N	Dewi Winarni Susyanti	\N	S.E., M.Si.	\N	administrasi niaga	\N	2021-06-02 09:37:26	2021-06-02 09:37:26
202	\N	Eka Sasmita Mulya	\N	\N	\N	teknik sipil	\N	2021-06-02 09:37:26	2021-06-02 09:37:26
41	\N	Yelvi	\N	S.T., M.T.	\N	teknik sipil	\N	2021-06-02 09:34:09	2021-06-02 10:00:12
64	\N	Rina Ningtyas	\N	S.Si, M.Si.	\N	teknik grafika dan penerbitan	\N	2021-06-02 09:34:09	2021-06-02 10:00:12
167	\N	Taufikul Ichsan	\N	S.E., Ak., M.M.	\N	akuntansi	\N	2021-06-02 09:37:04	2021-06-02 10:00:12
157	\N	Agus Wagyana	\N	S.T., M.T.	\N	teknik elektro	\N	2021-06-02 09:37:04	2021-06-02 10:02:11
169	\N	Ernita Siambaton	\N	S.E., M.Hum.	\N	administrasi niaga	\N	2021-06-02 09:37:04	2021-06-02 09:37:26
204	\N	Irpan Saripudin	\N	M.Ds.	\N	teknik grafika dan penerbitan	\N	2021-06-02 09:37:26	2021-06-02 09:37:26
205	\N	Sujarwo	\N	S.E., M.Si.	\N	akuntansi	\N	2021-06-02 09:37:26	2021-06-02 09:37:26
209	\N	Abdillah	\N	S.E., M.Si.	\N	akuntansi	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
210	\N	Aminah	\N	S.E., M.M.	\N	akuntansi	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
211	\N	Almahdi	Drs.	M.T.	\N	teknik mesin	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
212	\N	Indra Silanegara	\N	S.T., M.TI.	\N	teknik mesin	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
213	\N	R Elly Mirati	\N	S.E., M.M.	\N	akuntansi	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
214	\N	Rodiana Listiawati	\N	\N	\N	akuntansi	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
215	\N	Darna	\N	S.E., M.Si.	\N	akuntansi	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
216	\N	Dianta Mustofa Kamal	Dr.	M.T.	\N	teknik mesin	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
217	\N	Ariek Sulistyowati	Dra.	M.Kom.	\N	teknik mesin	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
218	\N	B. S. Rahayu Purwanti	Dra.	M.Si.	\N	teknik elektro	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
219	\N	Wiwi Prastiwinarti	Dra.	M.M.	\N	teknik grafika dan penerbitan	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
220	\N	Nugroho Eko Setijogiarto	Drs.	Dipl.Ing, M.T.	\N	teknik mesin	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
221	\N	Idrus Assagaf	\N	SST, M.T.	\N	teknik mesin	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
203	\N	Fauzri Fahimuddin	Ir.	M.Sc.Eng., Dr.Eng.	\N	teknik sipil	\N	2021-06-02 09:37:26	2021-06-02 10:00:12
107	\N	Suripto	\N	S.T., M.Eng.	\N	teknik sipil	\N	2021-06-02 09:34:10	2021-06-02 10:00:12
222	\N	Sutikno	\N	S.T., M.T.	\N	teknik sipil	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
223	\N	Euis Oktavianti	\N	S.Si., M.TI.	\N	teknik informatika dan komputer	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
224	\N	Firman Syah	\N	S.Sos.I, M.M.	\N	administrasi niaga	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
225	\N	Maryono	\N	S.H.I., M.A.	\N	teknik mesin	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
226	\N	Rahma Nur Praptiwi	\N	S.Si., M.M.	\N	administrasi niaga	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
227	\N	Saeful Imam	\N	S.T., M.T.	\N	teknik grafika dan penerbitan	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
228	\N	Shinta Oktaviana R	\N	S.Kom., M.Kom.	\N	teknik informatika dan komputer	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
229	\N	Taufik Akbar	\N	S.E., M.S.M.	\N	administrasi niaga	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
230	\N	Annisa Wardhani	\N	\N	\N	administrasi niaga	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
231	\N	Elisabeth Yanshe Metekohy	\N	S.E., M.Si.	\N	akuntansi	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
86	\N	Sri Wahyono	\N	M.Si.	\N	akuntansi	\N	2021-06-02 09:34:09	2021-06-02 10:00:12
232	\N	Haidir Juna	\N	\N	\N	teknik mesin	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
233	\N	Bambang Sutejo	\N	\N	\N	teknik elektro	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
234	\N	Irfan Choiri	\N	\N	\N	teknik mesin	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
235	\N	Memed Sumanto	\N	\N	\N	teknik mesin	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
236	\N	Mochamad Soleh	\N	\N	\N	teknik informatika dan komputer	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
237	\N	Khafidun	\N	A.Md., S.Sos.	\N	teknik elektro	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
238	\N	Muslimin	Dr.Eng.	S.T., M.T.	\N	teknik mesin	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
239	\N	Rahmat Subarkah	\N	M.T.	\N	teknik mesin	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
28	\N	Anis Rosyidah	\N	S.T., M.T.	\N	teknik sipil	\N	2021-06-02 09:34:09	2021-06-02 10:00:12
34	\N	Amalia	\N	S.Pd., SST, M.T.	\N	teknik sipil	\N	2021-06-02 09:34:09	2021-06-02 10:00:12
241	\N	Pribadi Mumpuni Adhi	Dr.Eng.	\N	\N	teknik mesin	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
21	\N	Ida Nurhayati	Dr.	S.H., M.H.	\N	akuntansi	\N	2021-06-02 09:34:09	2021-06-02 10:00:12
144	\N	Sabar Warsini	Dr.	M.M.	\N	akuntansi	\N	2021-06-02 09:34:49	2021-06-02 10:00:12
242	\N	Tetty Rimenda	Dr.	S.E., M.Si.	\N	akuntansi	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
243	\N	Imam Hariadi Sasongko	\N	S.T., M.M.	\N	teknik sipil	\N	2021-06-02 10:02:11	2021-06-02 10:02:11
244	\N	Widiyatmoko	\N	S.Si., M.Eng.	\N	teknik mesin	\N	2021-06-02 10:02:11	2021-06-02 10:02:11
245	\N	Nurul Intan Pratiwi	\N	\N	\N	teknik grafika dan penerbitan	\N	2021-06-02 10:02:11	2021-06-02 10:02:11
246	\N	Haolia Rahman	\N	Ph.D.	\N	teknik mesin	\N	2021-06-02 10:02:11	2021-06-02 10:02:11
247	\N	Mawarta Onida Sinaga	Dra.	M.Si.	\N	administrasi niaga	\N	2021-06-02 10:02:11	2021-06-02 10:02:11
248	\N	Ahmad Abror	\N	\N	\N	akuntansi	\N	2021-06-02 10:02:11	2021-06-02 10:02:11
249	\N	Handi Sudardja	\N	S.T., M.Eng.	\N	teknik sipil	\N	2021-06-02 10:02:11	2021-06-02 10:02:11
250	\N	Susilawati	\N	M.Si.	\N	teknik grafika dan penerbitan	\N	2021-06-02 10:02:11	2021-06-02 10:02:11
251	\N	Dewi Kurniawati	\N	S.S., M.Pd.	\N	teknik informatika dan komputer	\N	2021-06-02 10:02:11	2021-06-02 10:02:11
252	\N	Ayres Pradiptyas	\N	S.ST., M.M.	\N	teknik informatika dan komputer	\N	2021-06-02 10:02:11	2021-06-02 10:02:11
253	\N	Fitria Nugrahani	\N	\N	\N	teknik informatika dan komputer	\N	2021-06-02 10:02:11	2021-06-02 10:02:11
254	\N	Iftita Rahmi	\N	M.Psi.	\N	administrasi niaga	\N	2021-06-02 10:02:11	2021-06-02 10:02:11
240	\N	Titi Suharti	Dr.	S.E., M.M., M.Ak,, Ak., CA	\N	akuntansi	\N	2021-06-02 10:00:12	2021-06-02 10:02:11
255	\N	Budi Damianto	Ir.	M.T.	\N	teknik sipil	\N	2021-06-02 10:02:11	2021-06-02 10:02:11
\.


--
-- TOC entry 3108 (class 0 OID 47171)
-- Dependencies: 206
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- TOC entry 3116 (class 0 OID 47225)
-- Dependencies: 214
-- Data for Name: jurusan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jurusan (id, nama_jurusan, logo, created_at, updated_at) FROM stdin;
1	administrasi niaga	\N	2021-06-02 09:30:48	\N
2	akuntansi	\N	2021-06-02 09:30:48	\N
3	teknik elektro	\N	2021-06-02 09:30:48	\N
4	teknik grafika dan penerbitan	\N	2021-06-02 09:30:48	\N
5	teknik informatika dan komputer	\N	2021-06-02 09:30:48	\N
6	teknik mesin	\N	2021-06-02 09:30:48	\N
7	teknik sipil	\N	2021-06-02 09:30:48	\N
8	p3m	\N	2021-06-02 09:30:48	\N
\.


--
-- TOC entry 3103 (class 0 OID 47143)
-- Dependencies: 201
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migrations (id, migration, batch) FROM stdin;
1	2014_10_12_000000_create_users_table	1
2	2014_10_12_100000_create_password_resets_table	1
3	2014_10_12_200000_add_two_factor_columns_to_users_table	1
4	2019_08_19_000000_create_failed_jobs_table	1
5	2019_12_14_000001_create_personal_access_tokens_table	1
6	2021_03_29_075520_create_author_table	1
7	2021_03_29_075618_create_prodi_table	1
8	2021_03_29_075619_create_jurusan_table	1
9	2021_04_06_015708_create_sessions_table	1
10	2021_04_19_073835_create_penelitian_table	1
11	2021_04_19_073901_create_pengabdian_table	1
\.


--
-- TOC entry 3106 (class 0 OID 47165)
-- Dependencies: 204
-- Data for Name: password_resets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.password_resets (email, token, created_at) FROM stdin;
\.


--
-- TOC entry 3119 (class 0 OID 47255)
-- Dependencies: 217
-- Data for Name: penelitian; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.penelitian (id, skim_penelitian, nama_ketua_penelitian, jurusan, judul, abstrak, besar_dana, tahun, kategori, nama_anggota, created_at, updated_at) FROM stdin;
1	Penelitian Hibah Kompetensi	Agus Edy Pramono	teknik mesin	REKAYASA MATERIAL KOMPOSIT KARBON BERSIFAT KONDUKTIF ELEKTRIK BERBASIS LIMBAH SABUT KELAPA DALAM MATRIKS TANAH LIAT	\N	\N	2017	DIKTI	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
2	Penelitian Produk Terapan	Toto Supriyanto	teknik elektro	Pengembangan Wideband RF Receiver untuk Aplikasi RF Spektrum Analyzer dan RF Signal Surveyor (Solusi Untuk Penataan Alokasi Spektrum Frekuensi Radio)	\N	\N	2017	DIKTI	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
3	Penelitian Produk Terapan	Nuhung Sulaeman	teknik elektro	Pengembangan Sea Fish Finder berbasis Sea Surface Temperature pada NOAA Frekuensi 137,9 MHz untuk meningkatkan Explorasi Potensi Maritim	\N	\N	2017	DIKTI	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
4	Penelitian Produk Terapan	Rimsky Kartika Judisseno	administrasi niaga	MODEL PENGEMBANGAN DESTINASI PARIWISATA BERBASIS KULINER DI PERKEBUNAN: STUDI KASUS DI MALANG DAN JEMBER 	\N	\N	2017	DIKTI	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
5	Penelitian Produk Terapan	Bambang Waluyo	akuntansi	Pembuatan Model Edukasi Berbasis Sosok dan Segmentasi Konsumen Untuk Membangun Minat Mayarakat Pada Perbankan Syariah	\N	\N	2017	DIKTI	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
6	Penelitian Produk Terapan	Fuad Zaenuri	teknik mesin	Simulasi Analisa dan Perancangan Transmisi Synchromesh Pada Unjuk Kerja Kendaraan Listrik	\N	\N	2017	DIKTI	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
7	Penelitian Produk Terapan	Yenniwarti Rafsyam	teknik elektro	Pengembangan Identifikasi Awan Comulonimbus (Cb) menggunakan Data Sensor Satelit NOAA Frekuensi 137 MHz untuk Mendukung Keselamatan Transportasi	\N	\N	2017	DIKTI	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
8	Penelitian Produk Terapan	Murie Dwiyaniti	teknik elektro	Prototype Remote Terminal Unit (RTU) Berbasis ARM Cortex 32 Bit Pada Sistem SCADA Proses Kontrol Distribusi Air	\N	\N	2017	DIKTI	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
9	Penelitian Unggulan Perguruan Tinggi	Sutanto	teknik elektro	MODEL ALAT STERILISASI TERPADU ELEKTROKOAGULASI DAN ADSORPSI PADA PENGOLAHAN AIR LIMBAH MENJADI AIR MINUM 	\N	\N	2017	DIKTI	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
10	Penelitian Dosen Pemula	Hibertus Rudi Kusumantoro	teknik grafika dan penerbitan	Pembuatan Mesin Cetak Digital untuk Bahan Karton Terkalibrasi	\N	\N	2017	DIKTI	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
11	Penelitian Dosen Pemula	Husnil Barry	akuntansi	Analisis Volatilitas Indeks Pada Bursa Efek Indonesia	\N	\N	2017	DIKTI	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
12	Penelitian Dosen Pemula	Ahmad Maksum	teknik mesin	Efektifitas Iradiasi Gelombang Mikro Pada Proses Ekstraksi Silika Amorf dari Sekam Padi terhadap Tingkat Kemurnian Produk yang Dihasilkan	\N	\N	2017	DIKTI	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
13	Penelitian Dosen Pemula	Mohammad Zaenal Abidin Eko	teknik grafika dan penerbitan	Potret Saluran (Channel) Komunikasi Pada Kelompok Tarekat	\N	\N	2017	DIKTI	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
14	Penelitian Dosen Pemula	Ach Bakhrul Muchtasib	akuntansi	REPRESENTASI MODEL ORGANISASI PENGELOLA ZAKAT DI INDONESIA: Analisis Pasca Penerapan UU No. 23 Tahun 2011 Tentang Pengelolaan Zakat	\N	\N	2017	DIKTI	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
15	Penelitian Dosen Pemula	Wisnu Hendri Mulyadi	teknik elektro	OPTIMALIASI PENYERAPAN ENERGI MATAHARI SISTEM HYBRID PANEL SOLAR CELL DAN SOLAR THERMAL MENGIKUTI PERGERAKAN MATAHARI DENGAN TEKNOLOGI PENGENDALIAN BERBASIS PLC-SCADA	\N	\N	2017	DIKTI	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
16	Penelitian Dosen Pemula	Abdul Aziz Abdillah	teknik informatika dan komputer	Deteksi Penyakit Diabetes Menggunakan Principal Component Analysis dan Support Vector Machine	\N	\N	2017	DIKTI	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
17	Penelitian Desertasi Doktor	Tatun Hayatun Nufus	teknik mesin	KAJIAN ELEKTROMAGNETISASI BIODIESEL TERHADAP PENGHEMATAN BAHAN BAKAR PADA MESIN DIESEL	\N	\N	2017	DIKTI	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
18	Penelitian Desertasi Doktor	Etty Khongrat	administrasi niaga	PENINGKATAN KINERJA DESTINASI WISATA MICE DENGAN CITRA DESTINASI, VALUE DAN KEBIJAKAN PUBLIK (studi pada destinasi MICE Jakarta)	\N	\N	2017	DIKTI	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
19	Penelitian Desertasi Doktor	Aminuddin Debataraja	teknik elektro	SINTESIS NANOKOMPOSIT SnO2-GRAPHENE-Pd UNTUK APLIKASI SENSOR GAS KARBON MONOKSIDA SENSITIVITAS TINGGI	\N	\N	2017	DIKTI	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
20	Penelitian Produk Terapan	Heri Setyawan	administrasi niaga	PENGEMBANGAN PAMERAN SEBAGAI UNGGULAN DESTINASI MICE	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
21	Penelitian Produk Terapan	Ida Nurhayati	akuntansi	Eksistensi Kode Etik Bankir Sebagai Wujud Penerapan Prinsip Good Coorporate Governance Bagi Bank Umum di Indonesia	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
22	Penelitian Produk Terapan	Titi Suhartati	akuntansi	Implementasi Model Pembelajaran Soft Skill yang Terintegrasi dengan Mata Kuliah Akuntansi pada Pendidikan Vokasi	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
23	Penelitian Produk Terapan	Christina Lipuring Rudatin	administrasi niaga	MODEL STRATEGI PEMASARAN TARGET PASAR MICE DI BALI	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
24	Penelitian Produk Terapan	Fatimah	akuntansi	STRATEGY USAHA MIKRO DAN KECIL UNTUK BERTAHAN DAN BERKEMBANG DALAM ERA PERSAINGAN YANG SEMAKIN TAJAM	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
25	Penelitian Produk Terapan	Ida Syafrida	akuntansi	Model Strategi Peningkatan Sumber Pendanaan Bank Umum Syariah dengan Pertimbangan Manfaat, Peluang, Biaya dan Risiko	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
26	Penelitian Produk Terapan	Amirudin	administrasi niaga	MODEL KOMITMEN PENGUATAN PEMASARAN DESTINASI MEETING INCENTIVE CONFERENCE EXHIBITION (MICE) DALANG RANGKA MENINGKATAN DAYA SAING DI PULAU SUMBAWA DAN PULAU MOYO PROVINSI NUSA TENGGARA BARAT	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
27	Penelitian Produk Terapan	Sri Lestari K	teknik elektro	ALAT PENGKONDISI BAHAN BAKAR MINYAK BERBASIS ELEKTROMAGNET TERHADAP UNJUK KERJA MESIN BERBAHAN BAKAR NON FOSIL (BIOFUEL)	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
28	Penelitian Produk Terapan	Anis Rosyidah	teknik sipil	PENGEMBANGAN MODEL LEKATAN TULANGAN DENGAN BETON DITINJAU DARI BENTUK PERMUKAAN TULANGAN ULIR	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
29	Penelitian Produk Terapan	Zulmaita	akuntansi	Penerapan Pengelolaan Data Keuangan dan Filing dalam Meningkatkan Kualitas Laporan Keuangan Koperasi Karyawan Sejahtera Politeknik Negeri Jakarta	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
30	Penelitian Produk Terapan	A Rudi Hermawan	teknik sipil	SAMBUNGAN BALOK PRECAST TIPE PIN WELDED PLAT PADA MOMEN MAKSIMUM	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
31	Penelitian Produk Terapan	Dewin Purnama	teknik mesin	PENINGKATAN SIFAT MEKANIK DISSIMILAR METAL WELD ANTARA STAINLESS STEEL 304L DAN BAJA KARBON A36 MELALUI KOMBINASI KAWAT LAS DAN GAS PELINDUNG 	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
32	Penelitian Produk Terapan	Ade Sukma Mulya	akuntansi	Desain Pengukuran Kualitas Terjemahan Kelompok Nomina	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
33	Penelitian Produk Terapan	Sri Danaryani	teknik elektro	Model Blended Learning untuk Uji Skema Teknisi Instalasi Fiber optik	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
34	Penelitian Produk Terapan	Amalia	teknik sipil	BETON SELF COMPACTING CONCRETE (SCC) TAILING UNTUK STRUKTUR DI LAUT	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
35	Penelitian Produk Terapan	Isdawimah	teknik elektro	PENINGKATAN KUALITAS DAYA LISTRIK MELALUI MONITORING DATA SECARA ONLINE 	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
36	Penelitian Produk Terapan	Muryeti	teknik grafika dan penerbitan	Modifikasi Kitosan Sebagai Adsorben dalam Proses Pengawatintaan	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
37	Penelitian Produk Terapan	Yogi Widiawati	teknik elektro	Pengembangan Alat Bantu Pengajaran Bahasa Inggris Teknik Dengan Menggunakan CALL (Computer Assigned Language Learning) untuk Politeknik	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
38	Penelitian Produk Terapan	Eva Azhra Latifa	teknik sipil	Pengembangan  Analisis Meningkatnya Beban Lalulintas Terhadap Estimasi Pemeliharaan Jalan Arteri	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
39	Penelitian Produk Terapan	Gun Gun Ramdlan Gunadi	teknik mesin	Pengembangan Pembangkit Listrik Tenaga Mikro Hidro Type Turbin Aksial Head Rendah	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
40	Penelitian Produk Terapan	Hidjan	teknik sipil	SINTESIS KOMPOSIT  DARI  ZEOLIT DAN LIMBAH KERTAS UNTUK  PEREDAM  SUARA  YANG RAMAH LINGKUNGAN\n\n	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
41	Penelitian Produk Terapan	Yelvi	teknik sipil	Pemanfaatan Ijuk sebagai Perkuatan pada Tanah Pasir untuk Mengurangi Dampak Likuifaksi Akibat Gempa	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
42	Penelitian Produk Terapan	Hata Maulana	teknik informatika dan komputer	Rancang Bangun Virtual Map Politeknik Negeri Jakarta dengan Teknologi Augmented Reality berbasis Markerless 	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
43	Penelitian Produk Terapan	R. Agus Murdiyoto	teknik sipil	Pemanfaatan Cangkang Kerang Darah sebagai Agregat Halus Pembuatan Bata Beton Ringan	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
44	Penelitian Produk Terapan	Paulus Sukusno	teknik mesin	Pengembangan Sistem PLTMH Head Rendah Berbagai Tipe Turbin dan Memanfaatkan Air yang Terbuang 	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
45	Penelitian Unggulan Perguruan Tinggi	Iis Mariam	administrasi niaga	Kajian Collaborative Knowledge Creation melalui konsep Quadruple Helix dalam membangun kemitraan dan kelembagaan organisasi politeknik yang berdaya saing tinggi	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
46	Penelitian Unggulan Perguruan Tinggi	Nining Latianingsih	administrasi niaga	MODEL PENERAPAN KEBIJAKAN  PENGELOLAAN SAMPAH DAERAH DALAM  MENINGKATKAN KUALITAS LINGKUNGAN DAN PARTISIPASI MASYARAKAT KREINOVA \n	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
47	Penelitian Unggulan Perguruan Tinggi	Belyamin	teknik mesin	PENGERINGAN BEKU ATMOSFERIK LIDAH BUAYA	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
48	Penelitian Unggulan Perguruan Tinggi	Ahmad Tossin Alamsyah	teknik elektro	Rekayasa Silicon Sand menjadi paduan Silicon Oxida (SiO2) sebagai material bahan dasar dari Sensor Gas.	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
49	Penelitian Unggulan Perguruan Tinggi	Nur Hasyim	akuntansi	Pengembangan Model Penyusunan Skripsi Sarjana Terapan Berbasis Genre	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
50	Penelitian Kerjasama Antar Perguruan Tinggi	Ina Sukaesih	akuntansi	PENELUSURAN IDENTITAS BUDAYA NUSANTARA DALAM TEKS BERBAHASA INGGRIS: Analisis Terjemahan Karya Sastra Indonesia	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
51	Penelitian Unggulan Program Studi	Supriatnoko	akuntansi	Peningkatan Kemahiran Berbicara Bahasa Inggris Mahasiswa Politeknik Negeri Jakarta Melalui Magic Five Fingers Method'	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
52	Penelitian Unggulan Program Studi	Ismujianto	teknik elektro	Optimasi Galat Pada Akuisisi Data Kualitas Daya Listrik	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
53	Penelitian Unggulan Program Studi	Sudarno	administrasi niaga	Model Menakar Pemanfaatan Perpustakaan Pnj Atas Peningkatan Indeks Prestasi Mahasiswa Jurusan Administrasi Niaga Pnj	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
54	Penelitian Unggulan Program Studi	Anicetus Damar Aji	teknik elektro	Model Alat Pengendali Beban Listrik  Otomatis Pada Bengkel Listrik Pnj Secara Real Time Untuk Penghematan Energi	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
55	Penelitian Unggulan Program Studi	Anni Susilowati	teknik sipil	Variasi Suhu Pemadatan Pada Campuran Beton Aspal  Menggunakan Bahan Tambah Anti Stipping	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
56	Penelitian Unggulan Program Studi	Minto Rahayu	teknik mesin	Mutu Staf Pengajar Dalam Mencapai Kompetensi Program Studi Teknik Alat Berat.	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
57	Penelitian Unggulan Program Studi	Atyanto Mahatmyo	akuntansi	Model Penerapan Siklus Akuntansi Pada  Perusahaan Kecil Dan Menengah  Di Kabupaten Purwakarta	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
58	Penelitian Unggulan Program Studi	Yoyok Sabar Waluyo	teknik informatika dan komputer	Perancangan Sistem Informasi Pembelajaran Berbasis Web Pada Jurusan Teknik Informatika Dan Komputer	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
59	Penelitian Unggulan Program Studi	Titik Purwinarti	administrasi niaga	Fungsi Dan Model Peran Wirausaha Dalam Konteks Global	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
60	Penelitian Unggulan Program Studi	Sila Wardono	teknik elektro	Rekayasa Penggerak Otomatis Sistem Hybrid Panel Solar Cell Dan Solar Thermal Mengikuti Pola Pergerakan Matahari Berbasis Plc-Scada .	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
61	Penelitian Unggulan Program Studi	Cathryna Rumondang Bulan Simangunsong	akuntansi	Pemodelan Olimpiade Akuntansi Nasional Di Jurusan Akuntansi - Politeknik Negeri Jakarta (Tahap Ke Dua)	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
62	Penelitian Unggulan Program Studi	Prihatin Oktivasari	teknik informatika dan komputer	Membangun Sistem Informasi Penerimaan Proposal Penelitian Internal Pnj	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
63	Penelitian Unggulan Program Studi	Ida Nurhayati	akuntansi	Perlindungan Hukum Nasabah Bank Dalam Perspektif Undang-Undang Perlindungan Konsumen	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
64	Penelitian Unggulan Program Studi	Anis Rosyidah	teknik sipil	Pemodelan Lekatan Tulangan Dengan Beton Ditinjau Dari Bentuk Sirip Ulir	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
65	Penelitian Dosen Pemula	Fauzi Mubarak	administrasi niaga	Analisis Kondisi Standar Existing Venue Mice Di Kota Jakarta Selatan	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
66	Penelitian Dosen Pemula	Rina Ningtyas	teknik grafika dan penerbitan	Optimasi Konsentasi Bahan Pembuat Edible Film Pure Jambu Biji dan Aplikasinya Pada Buah Potong	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
67	Penelitian Dosen Pemula	Nuralam	teknik elektro	Rancangbangun Intellegent Sensor Ph Dan Temperatur Untuk Monitoring Kualitas Air Berbasis Labview	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
68	Penelitian Dosen Pemula	Novi Purnama Sari	teknik grafika dan penerbitan	Pengembangan Desain Kemasan Pada Produk UKM dengan Menggunakan Pendekatan Kansei Engineering	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
69	Penelitian Dosen Pemula	Djony Herfan	teknik grafika dan penerbitan	Peliputan Investigasi Di Tv One Dalam Perspektif Standar Kompetensi Wartawan	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
70	Penelitian Dosen Pemula	Wahyudi Utomo	administrasi niaga	Model Pembelajaran Praktik Berbasis Kompetensi (Studi Kasus Kegiatan An Expo)	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
71	Penelitian Dosen Pemula	Anita Hidayati	teknik informatika dan komputer	Analisa Perilaku Dosen Dalam Memanfaatkan E-Learning di Lingkungan PNJ Menggunakan Tam (Technology Acceptance Model)	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
72	Penelitian Dosen Pemula	Rosidi	teknik mesin	Analisa Pengaruh Kuat Arus Antara Elektroda Merek X dan Merek Y Terhadap Karakteristik Sambungan Las Pelat Lembaran Baja Untuk Tabung Gas 3 Kg	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
73	Penelitian Dosen Pemula	Fajar Susilowati	teknik sipil	Loyalitas Kerja yang ditimbulkan oleh Kepuasan Kerja Pada Karyawan Perusahaan Konstruksi	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
74	Penelitian Dosen Pemula	Emmidia Djonaedi	teknik grafika dan penerbitan	Pembuatan Bioplastik Dari Kulit Jagung Dengan Variasi Penggunaan Chitosan	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
75	Penelitian Dosen Pemula	Iwan Sonjaya	teknik informatika dan komputer	Pengembangan Game Untuk Menstimulasi Kecerdasan  Musik / Irama Dan Kinestik  Dalam  Kecerdasan Jamak (Multiple Intelligence) Pada Anak Usia Dini  	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
76	Penelitian Dosen Pemula	Agus Kusumaramdhani	akuntansi	Model Strategi Pemasaran UMKM dalam menghadapi daya saing	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
77	Penelitian Dosen Pemula	Seto Tjahyono	teknik mesin	Pembuatan Simulator Rotating Equipment Untuk Balancing Satu Bidang	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
78	Penelitian Dosen Pemula	Mauldy Laya	teknik informatika dan komputer	Peningkatan Performa Aplikasi Pendeteksi Mengantuk Saat Berkendara Menggunakan Teknologi Computer Vision	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
79	Penelitian Dosen Pemula	Darul Nurjanah	teknik sipil	Uji Coba Model Pembelajaran Pendidikan Agama Islam Berbasis Sentuhan Psikologis Sebagai Upaya Menciptakan  Mahasiswa Yang Berakhlakul Karimah	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
80	Penelitian Dosen Pemula	Andikanoza Pradiptya	teknik sipil	Uji Tahanan Tarik Model Fondasi Tiang Dalam Tanah Pasir 	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
81	Penelitian Dosen Pemula	Nining Latianingsih	administrasi niaga	Model Penerapan Bentuk Usaha pada UMKM di Depok	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
82	Penelitian Bidang Ilmu dan Pengembangan Institusi	MRR Tiyas Maheni DK	teknik grafika dan penerbitan	Plagiarisme dalam Pembuatan Tugas Gestalt oleh Mahasiswa Program Studi Desain Grafis Jurusan Teknik Grafika dan Penerbitan Politeknik Negeri Jakarta	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
83	Penelitian Bidang Ilmu dan Pengembangan Institusi	Cecep Gunawan	teknik grafika dan penerbitan	Penyajian Foto pada Desain Halaman Muka Suratkabar harian Ibukota\n(Studi Kasus Halaman Muka Suratkabar harian Sindo)	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
84	Penelitian Bidang Ilmu dan Pengembangan Institusi	Syamsu Rizal	administrasi niaga	Simulasi Model Portofolio Saham	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
85	Penelitian Bidang Ilmu dan Pengembangan Institusi	Anwar Said	administrasi niaga	OPTIMALISASI KINERJA SISTEM PLTS MODEL DIRECT DAN INDIRECT LOAD	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
86	Penelitian Bidang Ilmu dan Pengembangan Institusi	Dewi Akbar	administrasi niaga	Pemasaran Yang Dilakukan Oleh Penyandang Disabilitas Lulusan Program Studi Manajemen Pemasaran Untuk Warga Negara Berkebutuhan Khusus di Politeknik Negeri Jakarta	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
87	Penelitian Bidang Ilmu dan Pengembangan Institusi	Suyitno Gatot	teknik mesin	Sistem Informasi Tugas Akhir Mahasiswa Berbasis WEB Jurusan Teknik Mesin Politeknik Negeri Jakarta	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
88	Penelitian Bidang Ilmu dan Pengembangan Institusi	Eriya	teknik informatika dan komputer	PERANCANGAN KNOWLEDGE BASE PROGRAM STUDI BERBASIS ONTOLOGI UNTUK SISTEM PENDUKUNG KEPUTUSAN PENENTUAN DOSEN PEMBIMBING SKRIPSI	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
89	Penelitian Bidang Ilmu dan Pengembangan Institusi	Sri Wahyono	teknik informatika dan komputer	Analisis Tema Pada Teks Terjemahan Surat Al Qoriah dan Surat Al Qodr	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
90	Penelitian Bidang Ilmu dan Pengembangan Institusi	Tri Widjatmaka	teknik mesin	Analisis terhadap Keberadaan Standar Operating Procedure (SOP) dan Pengaruhnya terhadap Kepuasan Pelanggan: Studi kasus pada Unit Kerja di Lingkungan Kantor Direktorat Politeknik Negeri Jakarta	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
91	Riset Grant	Vika Rizkia	teknik mesin	Penumbuhan Lapisan Alumina Berpori Guna Meningkatkan Daya Serap Zat Warna Pada Aluminium Murni Untuk Aplikasi Konstruksi.	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
92	Riset Grant	Riandini	teknik elektro	Rancang Bangun Sistem Pengisian Baterai Otomatis Pada Automated Guided Vehicle Berbasis Arduino Mega 2560	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
93	Riset Grant	Sidiq Ruswanto	teknik mesin	Rancang Bangun Mesin Ampelas Dan Poles Spesimen Uji Metalografi Laboratorium Mesin	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
94	Riset Grant	Bernadeta Siti Rahayu Purwanti	teknik elektro	Model Uji Kecepatan Putar Motor Dideteksi Oleh Rotary Encoder Dipengaruhi Beban Listrik	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
95	Riset Grant	Imam Halimi	teknik elektro	Simulator Pengatur Level Zat Cair Otomatis Pada Industri Berbasis PLC Dan Menggunakan SCADA Sebagai Kontrol Jarak Jauh	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
96	Riset Grant	Darwin	teknik elektro	Kontrol Dan Monitoring Infus Menggunakan Sistem Embedded Berbasis Labview	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
97	Riset Grant	Agus Setiawan	teknik informatika dan komputer	Rancang Bangun Sistem Pakar Diagnosa Penyakit Tropis Berbasis Web Dan Android	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
98	Riset Grant	Indri Neforawati	teknik informatika dan komputer	Rancang Bangun Trash Quiz Dengan Atmega2560 Dan Notifikasi Berbasis Android	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
99	Riset Grant	Ali Masjono	akuntansi	Menabung Saham Sebuah Alternatip Investasi	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
100	Riset Grant	Prihatin Oktivasari	teknik informatika dan komputer	Rancang Bangun Smart Bottle Berbasis Raspberry Pi Dan Android	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
101	Riset Grant	Asep Apriana	teknik mesin	Meningkatkan Contamination Control Pada Workshop Teknik Alat Berat Politeknik Negeri Jakarta Sesuai Dengan Standar Caterpillar	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
102	Riset Grant	Indra Z	teknik elektro	“Smartklung” Angklung Otomatis Berbasis Komputer Yang Terkoneksi Pada Smartphone	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
103	Riset Grant	Achmad Nadjam	teknik sipil	Efektifitas Dan Kepuasan Pengguna Terhadap Jembatan Penyeberangan Orang (JPO) Di Pasar Induk Kramat Jati	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
104	Riset Grant	Mochammad Sholeh	teknik mesin	Rancang Bangun Meja Kalibrasi 3 DOF Dengan Pengaturan Sudut Sebagai Penunjang Perangkat 3D Scanner Di Lab Mesin Politeknik Negeri Jakarta	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
105	Riset Grant	Frianto	akuntansi	Pengaruh Perencanaan Strategi Dan Penggunaan Sistem E-Commerce Terhadap Peningkatan Jumlah Konsumen Pada PT. Adira Dinamika Multifinance, Tbk	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
106	Riset Grant	Benny Nixon	teknik elektro	Rancang Bangun Antena Hexaquad Omnidirectional 5.8ghz, Antena Helix 10 Lilitan 5.8ghz Dan Antena Yagi Biquad 342.5-600mhz Untuk Sistem Pemantauan Kegiatan PNJ Di Luar Ruangan Secara Live Dengan Menggunakan Drone	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
107	Riset Grant	Abdul Aziz Abdillah	teknik informatika dan komputer	Rancang Bangun Robot Pembantu Pekerjaan Sekretaris Dengan Perintah Suara Menggunakan Raspberry Pi	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
108	Riset Grant	Asri Wulandari	teknik elektro	Rancang Bangun Antena Mikrostrip MIMO Untuk WIFI Frekuensi 2,4 Ghz Di Laboratorium Telekomunikasi PNJ	\N	\N	2017	Internal	\N	2021-06-02 09:34:09	2021-06-02 09:34:09
109	Riset Grant	Anik Tjandra Setiati	teknik elektro	Rancang Bangun Antena Microstrip Yagi Biquad Dan Antena Quadlifiliar Sebagai Sistem Diversity Ruang Pada Penerima Komunikasi Data UAV	\N	\N	2017	Internal	\N	2021-06-02 09:34:10	2021-06-02 09:34:10
110	Riset Grant	Kendi Moro Nitisasmita	teknik elektro	Analisa Dan Pengembangan PLC Sebagai Pengendali Proses Sekuensial Berbantuan HMI	\N	\N	2017	Internal	\N	2021-06-02 09:34:10	2021-06-02 09:34:10
111	Riset Grant	Eko Wiyono	teknik sipil	Analisis Hubungan Geometrik Jalan Tol Dengan Tingkat Kecelakaan (Studi Kasus: Jalan Tol Purbaleunyi)	\N	\N	2017	Internal	\N	2021-06-02 09:34:10	2021-06-02 09:34:10
112	Riset Grant	Suripto	teknik sipil	Perbandingan Biaya Pemakaian Lampu Led Dan Hps Di Jl. H.R. Rasuna Said Dan Jl. Mayjen Sutoyo Jakarta	\N	\N	2017	Internal	\N	2021-06-02 09:34:10	2021-06-02 09:34:10
113	Riset Grant	Fatahula	teknik elektro	Pengaplikasian Sistem Plts Menggunakan Information Board Sebagai Beban	\N	\N	2017	Internal	\N	2021-06-02 09:34:10	2021-06-02 09:34:10
114	Riset Grant	Syafrizal Syarief	teknik elektro	Penelitian Dan Pengaplikasian Serta Monitoring Sensor LDR Dan Sensor Hujan Pada Miniatur Rumah 	\N	\N	2017	Internal	\N	2021-06-02 09:34:10	2021-06-02 09:34:10
115	Riset Grant	Agus Sukandi	teknik elektro	Rancang Bangun Simulator Desalination Plant Jenis Single Stage Untuk Media Pembelajaran Di Laboratorium Konversi Energi Politeknik Negeri Jakarta	\N	\N	2017	Internal	\N	2021-06-02 09:34:10	2021-06-02 09:34:10
116	Riset Grant	Rika Novita Wardhani	teknik elektro	Rancang Bangun Portable Smart Green Building	\N	\N	2017	Internal	\N	2021-06-02 09:34:10	2021-06-02 09:34:10
117	Riset Grant	Ade Haryani	teknik grafika dan penerbitan	Penyuntingan Naskah Ilmiah  Studi Kasus Mempopulerkan Istilah Ilmiah Melalui Proses Penyuntingan Artikel  Di Rubrik Kesehatan Ummi Online	\N	\N	2017	Internal	\N	2021-06-02 09:34:10	2021-06-02 09:34:10
118	Riset Grant	Fitri Wijayanti	teknik mesin	Optimalisasi Sistem Pendingin Pada Engine Caterpillar 3406e Milik Politeknik Negeri Jakarta 	\N	\N	2017	Internal	\N	2021-06-02 09:34:10	2021-06-02 09:34:10
119	Riset Grant	Jauhari Ali	teknik mesin	Rancang Bangun Mesin Pengering Papan Partikel Kayu	\N	\N	2017	Internal	\N	2021-06-02 09:34:10	2021-06-02 09:34:10
120	Riset Grant	Tuti Hartati	administrasi niaga	Tanggapan Industri Terhadap Kompetensi Mahasiswa Job Training Jurusan Administrasi Niaga Politeknik Negeri Jakarta	\N	\N	2017	Internal	\N	2021-06-02 09:34:10	2021-06-02 09:34:10
121	Riset Grant	Putera Agung Maha Agung	teknik sipil	Perancangan Struktur Dinding Penahan Tanah Pada Proyek Pembangunan Pesona Square Depok	\N	\N	2017	Internal	\N	2021-06-02 09:34:10	2021-06-02 09:34:10
122	Riset Grant	Wartiyati	teknik elektro	Prototype Pengatur Sudut Pointing Antena Parabola Menggunakan Radio Frequency	\N	\N	2017	Internal	\N	2021-06-02 09:34:10	2021-06-02 09:34:10
123	Riset Grant	Asrizal Tatang	teknik mesin	Pengembangan Dan Implementasi Plc Hot Standby, Hmi Dan Scada Pada Miniatur Alat Pemindah Barang (Crane)	\N	\N	2017	Internal	\N	2021-06-02 09:34:10	2021-06-02 09:34:10
124	Riset Grant	Fachruddin	teknik mesin	Rancang Bangun Simulator Sistem Pendingin Engine Untuk Mata Kuliah Sistem Engine 	\N	\N	2017	Internal	\N	2021-06-02 09:34:10	2021-06-02 09:34:10
125	Riset Grant	Muhammad Thamrin	teknik elektro	Miniatur Simulasi Pengendalian Level Ketinggian Air Berbasis PLC Dengan Monitoring SCADA	\N	\N	2017	Internal	\N	2021-06-02 09:34:10	2021-06-02 09:34:10
126	Riset Grant	Latif Mawardi	teknik elektro	Monitoring Laju Aliran Akibat Perubahan Level Zat Cair Dalam Tangki Tertutup	\N	\N	2017	Internal	\N	2021-06-02 09:34:10	2021-06-02 09:34:10
127	Riset Grant	Muhtarom Riyadi	teknik sipil	Pemanfaatan Limbah Plastik Sebagai Bahan Pengganti Sebagian Agregat Halus Pada Beton Normal	\N	\N	2017	Internal	\N	2021-06-02 09:34:10	2021-06-02 09:34:10
128	Riset Grant	Suripto	teknik sipil	Pengembangan Metode Pengolahan Limbah Air Lindi  Di Tempat Pembuangan Akhir Sampah (TPAS) Cipayung Kota Depok	\N	\N	2017	Internal	\N	2021-06-02 09:34:10	2021-06-02 09:34:10
129	Riset Grant	Mohammad Fathurahman	teknik elektro	Lorawan Network Untuk Jaringan Internet Of Things	\N	\N	2017	Internal	\N	2021-06-02 09:34:10	2021-06-02 09:34:10
130	Riset Grant	Ikhsan Kamil	teknik elektro	Power Monitoring Pada Panel Daya Bengkel Listrik Dengan Power Meter  PM5350 Berbasis SCADA Dan Perbandingan Data Dengan Power Analyzer	\N	\N	2017	Internal	\N	2021-06-02 09:34:10	2021-06-02 09:34:10
131	Riset Grant	Rahmat	teknik elektro	Prototipe Sistem Radio Penunjuk Arah Sinyal Pemancar Uhf	\N	\N	2017	Internal	\N	2021-06-02 09:34:10	2021-06-02 09:34:10
132	Riset Grant	Rudi Edial	teknik mesin	Rancang Bangun Mesin Press Serbuk Kayu Untuk Pembuatan Papan Partikel	\N	\N	2017	Internal	\N	2021-06-02 09:34:10	2021-06-02 09:34:10
133	Riset Grant	Ardina Askum HR	teknik elektro	Modul Latih Transceiver 11 Meter	\N	\N	2017	Internal	\N	2021-06-02 09:34:10	2021-06-02 09:34:10
134	Riset Grant	Tardi	teknik elektro	Alat Pengendali Ketinggian Level Air Otomatis Dengan Monitoring Supervisory Control And Data Acquisition (SCADA)	\N	\N	2017	Internal	\N	2021-06-02 09:34:10	2021-06-02 09:34:10
135	Riset Grant	Kusnadi	teknik elektro	Pemanas Air (Water Heater) Berbasis Pengendalian PID (Proportional Integral Derivatif)	\N	\N	2017	Internal	\N	2021-06-02 09:34:10	2021-06-02 09:34:10
136	Riset Grant	Ahmad Tossin Alamsyah	teknik elektro	Peningkatan Kualitas Reviewer Dengan Sertifikasi Reviewer	\N	\N	2017	Internal	\N	2021-06-02 09:34:10	2021-06-02 09:34:10
137	Penelitian Mandiri	Anwar Mustofa	administrasi niaga	Pengelolaan Arsip Kepegawaian di 3 Perusahaan BUMN	\N	\N	2017	Internal	\N	2021-06-02 09:34:10	2021-06-02 09:34:10
138	Penelitian Mandiri	Anik Tjandra Setiati	teknik elektro	Pemanfaatan Program Corporate Social Responsibility (CSR)  di Perusahaan Alumni Politeknik Negeri Jakarta)	\N	\N	2017	Internal	\N	2021-06-02 09:34:10	2021-06-02 09:34:10
139	Penelitian Mandiri	Seto Tjahyono	teknik mesin	Analisis Pengaruh Gas Campuran Argon - 5% Hidrogen terhadap Morfologi dan Kekuatan Tarik pada Pengelasan Baja Tahan Karat SUS 304 Tebal 6 MM	\N	\N	2017	Internal	\N	2021-06-02 09:34:10	2021-06-02 09:34:10
140	Penelitian Mandiri	Syaprudin	teknik elektro	Sensor Thermokopel Sebagai Pendeteksi Panas Tungku Pembakaran Keramik Berbasis PLC	\N	\N	2017	Internal	\N	2021-06-02 09:34:10	2021-06-02 09:34:10
141	Penelitian Mandiri	Jauhari Ali	teknik mesin	Rancang Bangun Mesin Peningkat Kualitas Asap Cair untuk Mengawetkan Ikan	\N	\N	2017	Internal	\N	2021-06-02 09:34:10	2021-06-02 09:34:10
142	Penelitian Mandiri	Tri Widjatmaka	teknik mesin	Perbandingan waktu standar penggunaan setrika uap dengan setrika listrik pada proses produksi usaha jasa laundry	\N	\N	2017	Internal	\N	2021-06-02 09:34:10	2021-06-02 09:34:10
143	Penelitian Mandiri	Iwan Sonjaya	teknik informatika dan komputer	Rancang Bangun Game untuk Menstimulasi Kecerdasan Jamak (Multiple Intelligence) pada Anak Usia Dini (Kasus Kecerdasan Spasial-Visual dan Kecerdasan Logis Matematis)	\N	\N	2017	Internal	\N	2021-06-02 09:34:10	2021-06-02 09:34:10
144	Penelitian Mandiri	Iwan Supriyadi	teknik sipil	Pengaruh Beban Lebih dan Tingkat Kerusakan terhadap Umur Sisa Jembatan	\N	\N	2017	Internal	\N	2021-06-02 09:34:10	2021-06-02 09:34:10
145	Penelitian Mandiri	Azwardi	teknik mesin	Rancang Bangun Sistem Informasi  Database Jurusan Teknik Mesin PNJ	\N	\N	2017	Internal	\N	2021-06-02 09:34:10	2021-06-02 09:34:10
146	Penelitian Terapan Unggulan Perguruan Tinggi	Agus Wagyana	teknik elektro	Prototipe Sistem Pengendali Smart Building Berbasis Internet of Things (IoT)	\N	\N	2018	DIKTI	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
147	Penelitian Terapan Unggulan Perguruan Tinggi	Isdawimah	teknik elektro	Peningkatan Kualitas Daya Listrik Melalui Optimasi Galat pada Monitoring Data Secara Online	\N	\N	2018	DIKTI	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
148	Penelitian Terapan Unggulan Perguruan Tinggi	Riandini	teknik elektro	\nRANCANG BANGUN WIRELESS STETOSKOP ELEKTRONIK \nBERBASIS ANDROID\n	\N	\N	2018	DIKTI	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
149	Penelitian Terapan Unggulan Perguruan Tinggi	Sutanto	teknik elektro	MODEL ALAT STERILISASI TERPADU ELEKTROKOAGULASI DAN ADSORPSI  PADA PENGOLAHAN AIR LIMBAH MENJADI AIR MINUM	\N	\N	2018	DIKTI	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
150	Penelitian Dasar Unggulan Perguruan Tinggi	Muryeti	teknik grafika dan penerbitan	Pemanfaatan Limbah Kulit Udang Pada Pembuatan Kertas Anti Rayap 	\N	\N	2018	DIKTI	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
151	Penelitian Dasar Unggulan Perguruan Tinggi	Nanang Rohadi	teknik elektro	SINTESIS KOMPOSIT  DARI  BERBAGAI JENIS ZEOLIT ALAM INDONESIA DAN LIMBAH BATANG PISANG UNTUK  PEREDAM  SUARA  YANG RAMAH LINGKUNGAN\n\n	\N	\N	2018	DIKTI	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
152	Penelitian Disertasi Doktor	Ahmad Maksum	teknik mesin	Benefisiasi Limonite Melalui Metode Reduksi Langsung Menggunakan Gas yang terbuang pada Proses Ekstraksi Silika Sekam Padi	\N	\N	2018	DIKTI	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
153	Penelitian Disertasi Doktor	Paulus Sukusno	teknik mesin	Analisis Eksergi dan Energi pada Proses Pembekuan Air-Es dan Daging Sapi Segar Dengan Variasi Tripel Katup Ekspansi	\N	\N	2018	DIKTI	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
154	Penelitian Strategis Nasional Institusi	Bambang Waluyo	administrasi niaga	Pembuatan Model Edukasi Berbasis Sosok dan Segmentasi Konsumen Untuk Membangun Minat Masyarakat Pada Perbankan Syariah 	\N	\N	2018	DIKTI	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
155	Penelitian Strategis Nasional Institusi	Fachruddin	teknik mesin	Simulasi Analisa dan Perancangan Transmisi Synchromesh pada Unjuk Kerja kendaraan listrik	\N	\N	2018	DIKTI	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
156	Penelitian Strategis Nasional Institusi	Nining Latianingsih	administrasi niaga	MODEL PENERAPAN KEBIJAKAN  PADA PENGELOLAAN PEMBANGUNAN DESA WISATA  HIJAU  BERBASIS MASYARAKAT KREINOVA	\N	\N	2018	DIKTI	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
157	Penelitian Strategis Nasional Institusi	Nur Hasyim	akuntansi	Pengembangan Model Penulisan Tesis (Magister Terapan) Berbasis Genre	\N	\N	2018	DIKTI	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
158	Penelitian Strategis Nasional Institusi	Rimsky Kartika Judisseno	administrasi niaga	MODEL PENGEMBANGAN DESTINASI PARIWISATA BERBASIS KULINER DI PERKEBUNAN: STUDI KASUS DI MALANG DAN JEMBER	\N	\N	2018	DIKTI	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
159	Penelitian Strategis Nasional Institusi	Yenniwarti Rafsyam	teknik elektro	Pengembangan Identifikasi Awan Cumulonimbus (Cb) menggunakan Data Sensor Satelit NOAA Frekuensi 137 MHz untuk mendukung Keselamatan Transportasi	\N	\N	2018	DIKTI	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
160	Penelitian Berbasis Kompetensi	Agus Edy Pramono	teknik mesin	REKAYASA MATERIAL KOMPOSIT KARBON BERSIFAT KONDUKTIF ELEKTRIK BERBASIS LIMBAH SABUT KELAPA DALAM MATRIKS TANAH LIAT	\N	\N	2018	DIKTI	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
161	Penelitian berbasis Penugasan	Nedsal Sixpria	akuntansi	Pengembangan Instrumen Audit Mutu Unit Kerja pada Satuan Kerja Politeknik Negeri Jakarta	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
162	Penelitian berbasis Penugasan	Efriyanto	akuntansi	ANALISIS  IMPLEMENTASI  KURIKULUM BERBASIS  KKNI DI  POLITEKNIK  NEGERI JAKARTA	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
163	Penelitian berbasis Penugasan	Kadunci	administrasi niaga	Strategi Pengembangan Produk Batik Ciwaringin Kabupaten Cirebon	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
164	Penelitian berbasis Penugasan	Narulita Syarweni	administrasi niaga	PEMBUKUAN  UNTUK  USAHA  KECIL	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
165	Penelitian berbasis Penugasan	Sulistyowati	administrasi niaga	Analisis Faktor-Faktor Motivasi Pelaku UMKM untuk menjadi Halalpreneurs Studi Kasus Jabodetabek	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
166	Penelitian berbasis Penugasan	Zulhelman	teknik elektro	EVALUASI PERFORMANSI STREAMING VIDEO MELALUI  JARINGAN  IP/MPLS	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
167	Penelitian berbasis Penugasan	Andi Indianto	teknik sipil	PROTOTYPE JEMBATAN TYPE PLATE GIRDER U (PGU) DENGAN LANTAI  ORTOTROPIK KOMPOSIT	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
168	Penelitian berbasis Penugasan	Setiyadi	teknik sipil	PENGEMBANGAN ALAT BANTU PEMASANGAN   UBIN KERAMIK DINDING  BANGUNAN GEDUNG	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
169	Penelitian berbasis Penugasan	Achmad Nadjam	teknik sipil	Monitoring dan Evaluasi Jalan Raya Rawan Longsor di Kelurahan Tanah Baru Kecamatan Beji Depok dan Upaya Penanganannya	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
170	Penelitian berbasis Penugasan	Benny Nixon	teknik elektro	DATA LOGGER TERMODIFIKASI MEMPERCEPAT INFORMASI DETEKSI SUHU-PH AIR MEMANFAATKAN INTERNET OF THINGS	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
171	Penelitian Bidang Ilmu dan Pengembangan Institusi	Murtiningsih	akuntansi	EVALUASI TINGKAT KUALITAS PELAYANAN  BIDANG KEMAHASISWAAN MENGGUNAKAN SERVEQUAL  DI POLITEKNIK NEGERI JAKARTA	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
172	Penelitian Bidang Ilmu dan Pengembangan Institusi	Taufikul Ichsan	akuntansi	Pengembangan Model Pencatatan Persediaan Dalam Bentuk Kartu Persediaan  (Kasus: Pendidikan Vokasi/Politeknik)	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
173	Penelitian Bidang Ilmu dan Pengembangan Institusi	Anwar Mustofa	administrasi niaga	ANALISIS KESALAHAN PADA TEKS EKSPOSITORI BAHASA INGGRIS HASIL UJIAN MATA KULIAH ENGLISH 1 MAHASISWA JURUSAN ADMINISTRASI NIAGA	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
174	Penelitian Bidang Ilmu dan Pengembangan Institusi	Azwar	administrasi niaga	KANTIN POLITEKNIK DILIHAT DARI PERILAKU MAHASISWA ADMINISTRASI NIAGA SEBAGAI KOMSUMEN (Studi Kasus Pada Mahasiswa Administrasi Niaga Politeknik Negeri Jakarta)	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
175	Penelitian Bidang Ilmu dan Pengembangan Institusi	Ernita Siambaton	administrasi niaga	Analisis pemanfaatan aplikasi  layanan pesan antar online oleh pelaku UMKM bidang kuliner di Depok	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
176	Penelitian Bidang Ilmu dan Pengembangan Institusi	Entis Sutisna	teknik elektro	PROTOTIPE SIMULATOR POWER GENERATOR SEBAGAI MEDIA INTERAKTIF UNTUK MEINGKATKAN PEMBELAJARAN DI PNJ	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
177	Penelitian Bidang Ilmu dan Pengembangan Institusi	Anik Tjandra Setiati	teknik elektro	PERANAN PEREMPUAN BIDANG REKAYASA di DUNIA INDUSTRI	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
178	Penelitian Bidang Ilmu dan Pengembangan Institusi	Mohammad Fauzy	teknik grafika dan penerbitan	Hubungan Pilihan Bidang Studi dengan Kecerdasan Mahasiswa Jurusan Teknik Grafika dan Penerbitan, Politeknik Negeri Jakarta.	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
179	Penelitian Bidang Ilmu dan Pengembangan Institusi	Agus Setiawan	teknik informatika dan komputer	PERANAN KEGIATAN KEMAHASISWAAN MEMBERI KONTRIBUSI TERHADAP PRESTASI AKADEMIK MAHASISWA DI POLITEKNIK NEGERI JAKARTA	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
180	Penelitian Dosen Pemula	Ach Bakhrul Muchtasib	akuntansi	Optimalisasi Pengelolaan Zakat di Indonesia (Analisis Perbandingan Efisiensi Pengelolaan Zakat antara BAZ dan LAZ dengan Metode Data Envelopment Analysis)	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
181	Penelitian Dosen Pemula	Agus Kusumaramdhani	akuntansi	IMPLEMENTASI KEBIJAKAN PEMERINTAH DALAM PEMBINAAN USAHA MIKRO, KECIL, DAN MENENGAH DI KABUPATEN PURWAKARTA	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
182	Penelitian Dosen Pemula	Rahmanita Vidyasari	akuntansi	PERANCANGAN SISTEM INFORMASI AKUNTANSI PADA USAHA KECIL DAN MENENGAH  APOTEK ALAM SEHAT	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
183	Penelitian Dosen Pemula	Yosi Erfinda	akuntansi	PROPOSAL PENELITIAN DOSEN PEMULA SKEMA PEREKRUTAN MAHASISWA SEBAGAI TENAGA KERJA OUTSOURCING DALAM SEBUAH EVENT MICE (Studi Kasus Mahasiswa Program Studi MICE Politeknik Negeri Jakarta)	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
184	Penelitian Dosen Pemula	Anita Rahmawati	akuntansi	Faktor-faktor Yang Mempengaruhi Engagement Tenaga Pendidik Dalam Proses Belajar Peserta Didik Berkebutuhan Khusus di Kota Depok	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
185	Penelitian Dosen Pemula	Maria Nino Istia	administrasi niaga	Representasi Sosial Mahasiswa Manajemen Pemasaran untuk Warga Negara Berkebutuhan Khusus di Lingkungan Politeknik Negeri Jakarta	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
186	Penelitian Dosen Pemula	Fauzi Mubarak	administrasi niaga	USULAN PENELITIAN DOSEN PEMULA PETA DAYA SAING KOTA DEPOK DAN KOTA BOGOR MELALUI KONDISI STANDAR EXISTING VENUE MICE	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
187	Penelitian Dosen Pemula	Husnil Barry	administrasi niaga	Prediksi Model Financial Distress Pada Perusahaan Ritel Bursa Efek Indonesia Periode 2012-2016	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
188	Penelitian Dosen Pemula	Imam Syafganti	administrasi niaga	Perbandingan Evaluasi Website Resmi Pariwisata (Official Tourism Website) Negara-Negara di Kawasan Asia Tenggara	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
189	Penelitian Dosen Pemula	Wahyudi Utomo	administrasi niaga	ANALISIS EFEKTIFITAS CBET (COMPETENCY BASE EDUCATION AND TRAINING) SEBAGAI UPAYA PENINGKATAN SOFT SKILLS, TANGGUNG JAWAB DAN DISIPLIN TERINTEGRASI  (STUDI PROGRAM MAGANG MAHASISWA JURUSAN ADMINISTRSI NIAGA POLITEKNIK NEGERI JAKARTA)	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
190	Penelitian Dosen Pemula	Rika Novita Wardhani	teknik elektro	Antenna Tracking LabVIEW Control System	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
191	Penelitian Dosen Pemula	Asri Wulandari	teknik elektro	PERANCANGAN DAN ANALISA IMPLEMENTASI    LTE   HOME  PADA JARINGAN 4G LTE DI FREKUENSI 2300 MHz	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
192	Penelitian Dosen Pemula	Nuralam	teknik elektro	PROTOTYPE SMART SENSOR SEBAGAI PENDETEKSI KUALITAS TELUR BEBEK BERDASARKAN NORMAL DAN ABNORMAL BERBASIS LABVIEW VISION	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
193	Penelitian Dosen Pemula	Mohammad Fathurahman	teknik elektro	Rancang Bangun Sistem Akuisisi dan Pengolahan Citra Satelit Menggunakan SDR-GNU Radio	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
194	Penelitian Dosen Pemula	Sari Puspita Dewi	teknik grafika dan penerbitan	Persepsi Dosen terhadap Penggunaan ICT  dalam Pembelajaran Bahasa Inggris	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
195	Penelitian Dosen Pemula	Anggi Anggarini	teknik grafika dan penerbitan	 Efektivitas Penggunaan Moodboard Sebagai Media Berpikir Kreatif Pada Pembuatan Desain Media Publikasi	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
196	Penelitian Dosen Pemula	Emmidia Djonaedi	teknik grafika dan penerbitan	PENGARUH PENAMBAHAN POLIVINIL ALKOHOL TERHADAP KEKUATAN FISIK BIOPLASTIK DARI KULIT JAGUNG	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
197	Penelitian Dosen Pemula	Dini Handayani	teknik grafika dan penerbitan	Maintaining Language Using Online Language Platform: A Case of Darmasiswa International Students Politeknik Negeri Jakarta	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
198	Penelitian Dosen Pemula	Rina Ningtyas	teknik grafika dan penerbitan	Kemampuan Antibakteri Edible film Pure Jambu Biji Menggunakan Casein	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
199	Penelitian Dosen Pemula	Novi Purnama Sari	teknik grafika dan penerbitan	ANALISIS KELAYAKAN EKONOMI DAN FUNGSIONAL DALAM APLIKASI DESAIN KEMASAN MAKANAN RINGAN	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
200	Penelitian Dosen Pemula	Djony Herfan	teknik grafika dan penerbitan	KONVERGENSI MEDIA MEMPENGARUHI KONTEN HARIAN KOMPAS DAN KORAN TEMPO DALAM PEMBERITAAN (PERSPEKTIF STANDAR KOMPETENSI WARTAWAN)	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
201	Penelitian Dosen Pemula	Iwan Sonjaya	teknik informatika dan komputer	PENGEMBANGAN  GAME UNTUK MENSTIMULASI  KECERDASAN INTERPERSONAL-INTRAPERSONAL  DAN NATURALIS DALAM KECERDASAN JAMAK  (MULTIPLE INTELLIGENCE) PADA ANAK USIA DINI	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
202	Penelitian Dosen Pemula	Budi Santoso	teknik mesin	pembuatan saybolt tube viscometer untuk mengamati pengaruh temperatur terhadap perubahan viscositas pelumas otomotif	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
203	Penelitian Dosen Pemula	Candra Damis Widiawaty	teknik mesin	REKAYASA PROTO TIPE SHELL AND TUBE HEAT EXCHANGER BERBASIS CFD DAN SISTEM KONTROL	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
204	Penelitian Dosen Pemula	Imam Wahyudi	teknik mesin	KAJIAN EKSPERIMENTAL MAGNETISASI BAHAN BAKAR TERHADAP KINERJA EKSCAVATOR	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
205	Penelitian Dosen Pemula	Cecep Slamet Abadi	teknik mesin	Analisa Kekuatan Hasil Pengelasan Dari Reparasi Cetakan Produk Plastik Pada Baja AISI 420 Dengan Metoda GMAW	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
206	Penelitian Dosen Pemula	Iwan Supriyadi	teknik sipil	Prioritas Penanganan Kendala Pelaksanaan Proyek Konstruksi	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
207	Penelitian Unggulan berbasis Program Studi	Herbirowo Nugroho	akuntansi	Keputusan Penerbitan Sukuk Korporasi Bank Umum Syariah: Pengalaman Emiten	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
208	Penelitian Unggulan berbasis Program Studi	Lia Ekowati	akuntansi	Model Pembelajaran Problem Based Learning Mata Kuliah Perpajakan Untuk Mahasiswa Program Studi Manajemen Keuangan Politeknik Negeri Jakarta	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
209	Penelitian Unggulan berbasis Program Studi	Hayati Fatimah	akuntansi	OPTIMALISASI AUDIT DALAM PENGENDALIAN INTERNAL PERGURUAN TINGGI NEGERI Studi Kasus Politeknik Negeri Jakarta	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
210	Penelitian Unggulan berbasis Program Studi	Heri Abrianto	akuntansi	ANALISIS FAKTOR INTERNAL DAN EKSTERNAL TERHADAP EFISIENSI PERBANKAN DI INDONESIA PERIODE 2013-2017 (Dalam Rangka Implementasi Asean Banking Integration)	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
211	Penelitian Unggulan berbasis Program Studi	Ni Made Widhi Sugianingsih	administrasi niaga	ANALISIS PERMASALAHAN PELAKSANAAN PRAKTIK     KERJA LAPANGAN MAHASISWA PROGRAM STUDI D3 ADMINISTRASI BISNIS JURUSAN ADMINISTRASI NIAGA POLITEKNIK NEGERI JAKARTA.	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
212	Penelitian Unggulan berbasis Program Studi	Sila Wardono	teknik elektro	RANCANG BANGUN DAN OPTIMASI SISTEM HYBRID PANEL SOLAR CELL DAN SOLAR THERMAL BERBASIS PLC UNTUK EFISIENSI TENAGA LISTRIK	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
213	Penelitian Unggulan berbasis Program Studi	Kendi Moro Nitisasmita	teknik elektro	PENGENDALI SUHU PADA TAMBAK BUDIDAYA UDANG VANNAMEI  BERBASIS TEKNOLOGI INTERNET OF THINGS (IoT)	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
214	Penelitian Unggulan berbasis Program Studi	MRR Tiyas Maheni DK	teknik grafika dan penerbitan	PENERAPAN STRATEGI PENCEGAHAN PLAGIARISME  MENGGUNAKAN METODE BERPIKIR LATERAL DALAM PEMBUATAN GAMBAR GESTALT PADA MAHASISWA DESAIN GRAFIS TGP-PNJ	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
215	Penelitian Unggulan berbasis Program Studi	Azhmy Fawzi My	teknik grafika dan penerbitan	Menyiapkan Mahasiswa Jurnalistik sebagai Jurnalis Radio dan Televisi dalam Menghadapi Perubahan Jurnalisme melalui Konvergensi Media	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
216	Penelitian Unggulan berbasis Program Studi	Minto Rahayu	teknik mesin	KESADARAN BELA NEGARA PADA MAHASISWA	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
217	Penelitian Unggulan berbasis Program Studi	R Sugeng Mulyono	teknik mesin	Pengembangan Kontrol Mesin Vacuum Forming Otomatis untuk Aneka Bentuk Kemasan Makanan pada Industri Makanan Kecil Menengah	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
218	Penelitian Unggulan berbasis Program Studi	Suripto	teknik sipil	Kebutuhan Air Irigasi Untuk Tanaman Padi Berumur Panjang	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
219	Penelitian Unggulan berbasis Program Studi	Eko Wiyono	teknik sipil	Variasi Kadar Filler Pada Campuran Beton Aspal  Menggunakan Bahan Tambah Anti Stipping	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
220	Penelitian Unggulan berbasis Program Studi	Siti Aisiyah	teknik sipil	ANALISIS KEAKURATAN MAKNA TERJEMAHAN  ISTILAH INGGRIS DI BIDANG MANAJEMEN KONSTRUKSI  DALAM BAHASA INDONESIA	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
221	Penelitian Berbasis Penugasan	Sri Wahyono	administrasi niaga	Uji Coba Prototipe Model Penulisan Skripsi Sarjana Terapan Berbasis Genre	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
222	Penelitian Berbasis Penugasan	Christina Lipuring Rudatin	administrasi niaga	Pengaruh Atribut Venue Terhadap Intense Event Organizer dalam Memilih Tempat  Pelaksanaan Event	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
223	Penelitian Produk Terapan	Titi Suhartati	akuntansi	Model Implementasi dan Evaluasi Pembelajaran Soft Skill yang Terintegrasi dengan Mata Kuliah Akuntansi pada Pendidikan Vokasi	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
224	Penelitian Produk Terapan	Fatimah	akuntansi	STRATEGI  POSITIONING PRODUK UKM  DENGAN MENGGUNAKAN PETA PERSEPSI UNTUK MEMENANGKAN PERSAINGAN	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
225	Penelitian Produk Terapan	Sylvia Rozza	akuntansi	PENYUSUNAN SKEMA RESTRUKTURISASI UMKM	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
226	Penelitian Produk Terapan	Petrus Hari Kuncoro Seno	akuntansi	Analisa Faktor Faktor yang Mempengaruhi Penerimaan Pelanggan atas  Layanan  Tansportasi Umum Berbasis aplikasi On lLne  dengan Menggunakan TECHNOLOGY ACCEPTANCE MODEL (TAM)	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
227	Penelitian Produk Terapan	Utami Puji Lestari	akuntansi	Model Ukuran Kinerja yang Terintegrasi dengan Kejelasan Peran, Kepercayaan terhadap Atasan dan Rasa Keadilan Prosedural  untuk Meningkatkan Komitmen Terhadap Organisasi di Sektor Jasa	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
228	Penelitian Produk Terapan	Ida Syafrida	akuntansi	Model Strategi Peningkatan Sumber Pendanaan Bank Umum Syariah Melalui Penerbitan Efek  Saham  Publik	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
229	Penelitian Produk Terapan	Amirudin	administrasi niaga	MODEL KOMUNIKASI E_PEMASARAN   DESTINASI MICE ATAS PEMBUKAAN BANDARA KERTAJATI	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
230	Penelitian Produk Terapan	Etty Khongrat	administrasi niaga	PENGEMBANGAN PASAR INSENTIF TRAVEL SEBAGAI UNGGULAN DESTINASI MICE LOMBOK	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
231	Penelitian Produk Terapan	Tuty Herawati	administrasi niaga	Model Bisnis UMKM Fashion dalam Meningkatkan Daya Saing Global	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
232	Penelitian Produk Terapan	Eva Zulfa Nailufar	administrasi niaga	KAJIAN KONSEP UPAH MINIMUM BERDASARKAN SYARIAT ISLAM  DI PROPINSI DKI JAKARTA SELATAN SELATAN	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
233	Penelitian Produk Terapan	Murie Dwiyaniti	teknik elektro	PROTOTIPE  INDUSTRIAL INTERNET OF THINGS (IIoT)  PADA SCADA MANAJEMEN  PENERANGAN  JALAN UMUM CERDAS	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
234	Penelitian Produk Terapan	Ismujianto	teknik elektro	PENGENDALIAN KUALITAS GROUNDING SYSTEM MENGGUNAKAN INFRARED TOPOGRAPHY	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
235	Penelitian Produk Terapan	Toto Supriyanto	teknik elektro	Pengembangan Sistem Real_Time Monitoring Kandang Anak Ayam Broiler (Ayam Ras Pedaging) Berbasis Wireless Sensor Network untuk Mendukung Ketahanan Pangan	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
236	Penelitian Produk Terapan	Yoyok Sabar Waluyo	teknik informatika dan komputer	KUALITAS TERJEMAHAN ISTILAH JARINGAN NIRKABEL DALAM BUKU  WIRELESS NETWORKS FIRST_STEP:  Analisis Studi Kasus pada Buku Rujukan Mata Kuliah di Program Studi Teknik Komputer dan Jaringan	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
237	Penelitian Produk Terapan	Emir Ridwan	teknik mesin	Pengembangan Sistem Synchromesh untuk Peningkatan Efisiensi pada Kendaraan Listrik	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
238	Penelitian Produk Terapan	Adi Syuriadi	teknik mesin	OPTIMASI PEMBANGKIT LISTRIK TENAGA MIKRO HIDRO  TYPE KINCIR BREASTSHOT DENGAN HEAD RENDAH  DI KAWASAN DANAU UI	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
239	Penelitian Produk Terapan	Eva Azhra Latifa	teknik sipil	Pengembangan Formula Manajemen Pemeliharaan Jalan Melalui Sistem Manajemen Perkerasan	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
240	Penelitian Produk Terapan	Amalia	teknik sipil	PEMANFAATAN ABU SEKAM PADI SEBAGAI SUBSTITUSI SEMEN DAN LIMBAH SCRAP BAJA PADA BETON SELF COMPACTING CONCRETE (SCC)	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
241	Penelitian Produk Terapan	Anis Rosyidah	teknik sipil	PENGEMBANGAN MODEL LEKATAN TULANGAN PADA SAMBUNGAN LEWATAN (LAP SPLICES)	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
242	Penelitian Produk Terapan	Andrias Rudi Hermawan	teknik sipil	SAMBUNGAN BALOK PRECAST TIPE WET AND DRY JOINT PADA MOMEN MAKSIMUM	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
243	Penelitian Produk Terapan	R. Agus Murdiyoto	teknik sipil	Rancang Bangun Alat Penumbuk  Cangkang Kerang Darah (Anadara Granosa) dengan motor penggerak listrik	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
244	Penelitian Produk Terapan	Yelvi	teknik sipil	Studi Eksperimen Evaluasi Tingkat Kerapatan Relatif dan Percepatan Maksimum Gempa pada Tanah Potensi Likuifaksi yang Diperkuat Ijuk	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
245	Penelitian Unggulan Perguruan Tinggi	Tatun Hayatun Nufus	teknik mesin	KARAKTERISTIK  KINERJA DAN EMISI GAS BUANG  PADA MESIN DIESEL BERBAHAN BAKAR CAMPURAN SOLAR DAN BIODIESEL (MINYAK JELANTAH) YANG DIMAGNETISASI	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
246	Penelitian Unggulan Perguruan Tinggi	Iwan Susanto	teknik mesin	STUDI LAPISAN FILM TIPIS KELOMPOK III_NITRIDA MENGGUNAKAN TEKNIK PLASMA ASSISTED MOLECULAR BEAM EPITAXY	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
247	Penelitian Unggulan Perguruan Tinggi	Ahmad Tossin Alamsyah	teknik elektro	REKAYASA CAMPURAN PASIR SILICA DAN MATERIAL LAINNYA  SEBAGAI   MATERIAL SUBSTRAT   PADA    SENSOR  GAS	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
248	Penelitian Unggulan Perguruan Tinggi	Ida Nurhayati	akuntansi	Budaya Dan Kepedulian Anti Fraud Pada Perbankan Indonesia	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
249	Penelitian Unggulan Perguruan Tinggi	Iis Mariam	administrasi niaga	KONSEP COLLABORATIVE KNOWLEDGE CREATION  DAN QUADRUPLE HELIX DALAM MENINGKATKAN DAYA SAING ORGANISASI POLITEKNIK MELALUI MODEL PEMBELAJARAN BERBASIS TERAPAN YANG KREATIF DAN INOVATIF	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
250	Penelitian Unggulan Perguruan Tinggi	Ali Masjono	akuntansi	Pengaruh Customer Value, Kualitas Pelayanan, dan Kepuasan Nasabah terhadap Kepercayaan serta Implikasinya terhadap Loyalitas Nasabah	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
251	Penelitian Unggulan Perguruan Tinggi	Sabar Warsini	akuntansi	Pengaruh Promosi melalui Electronic Word of Mouse (e_WOM) Terhadap Minat Mahasiswa Dalam Membeli Saham : Studi Berkelanjutan Pada Kampus yang Mendirikan Galeri Investasi	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
252	Penelitian Unggulan Perguruan Tinggi	Eri Ester Khairas	teknik sipil	Konstruksi Korpus dengan Aplikasi Software AntConc 3.4 untuk Merancang Model Pembelajaran Bahasa Inggris Vokasi Bidang Rekayasa	\N	\N	2018	Internal	\N	2021-06-02 09:37:04	2021-06-02 09:37:04
286	Penelitian Dasar Unggulan Perguruan Tinggi	Muryeti	teknik grafika dan penerbitan	Pemanfaatan Limbah Kulit Udang Pada Pembuatan Kertas Anti Rayap	\N	\N	2019	DIKTI	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
287	Penelitian Terapan	Ahmad Tossin Alamsyah	teknik elektro	Ekstraksi Material Hasil Pertambangan Lokal khususnya pasir silikat (sillicond sand) sebagai material   subtrat pada Sensor Gas dan turunannya	\N	\N	2019	DIKTI	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
288	Penelitian Terapan	Rimsky Kartika Judisseno	administrasi niaga	MODEL PENGEMBANGAN DESTINASI PARIWISATA BERBASIS KULINER DI PERKEBUNAN: STUDI KASUS DI MALANG DAN JEMBER\nBERBASIS ANDROID\n	\N	\N	2019	DIKTI	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
289	Penelitian Terapan	Nur Hasyim	akuntansi	Pengembangan Model Penulisan Tesis (Magister Terapan) Berbasis Genre	\N	\N	2019	DIKTI	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
290	Penelitian Terapan	Yenniwarti Rafsyam	teknik elektro	Pengembangan Identifikasi Awan Cumulonimbus (Cb) menggunakan Data Sensor Satelit NOAA Frekuensi 137 MHz untuk mendukung Keselamatan Transportasi 	\N	\N	2019	DIKTI	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
291	Penelitian Terapan	Nining Latianingsih	administrasi niaga	MODEL PENERAPAN KEBIJAKAN  PADA PENGELOLAAN PEMBANGUNAN DESA WISATA  HIJAU  BERBASIS MASYARAKAT KREINOVA	\N	\N	2019	DIKTI	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
292	Penelitian Terapan Unggulan Perguruan Tinggi	Ida Syafrida	akuntansi	Strategi Peningkatan Dana Murah Bank Umum Syariah Dengan Optimalisasi Penghimpunan Sumber Dana Haji dan Filantropi Islam	\N	\N	2019	DIKTI	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
293	Penelitian Terapan Unggulan Perguruan Tinggi	Isdawimah	teknik elektro	Peningkatan Kualitas Daya Listrik Melalui Optimasi Galat pada Monitoring Data Secara Online	\N	\N	2019	DIKTI	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
294	Penelitian Terapan Unggulan Perguruan Tinggi	Tatun Hayatun Nufus	teknik mesin	PERANGKAT ELEKTROMAGNETISASI BAHAN BAKAR CAMPURAN BIOETANOL DAN BENSIN PADA MOTOR BENSIN	\N	\N	2019	DIKTI	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
295	Penelitian Terapan Unggulan Perguruan Tinggi	Riandini	teknik elektro	 RANCANG BANGUN WIRELESS STETOSKOP ELEKTRONIK  BERBASIS ANDROID 	\N	\N	2019	DIKTI	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
296	Penelitian Terapan Unggulan Perguruan Tinggi	Sutanto	teknik elektro	MODEL ALAT STERILISASI TERPADU ELEKTROKOAGULASI DAN ADSORPSI  PADA PENGOLAHAN AIR LIMBAH MENJADI AIR MINUM	\N	\N	2019	DIKTI	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
297	Penelitian Unggulan berbasis Program Studi	Abdillah	akuntansi	FORMULASI MASALAH PENGEMBANGAN BMT/KSPPS DI DEPOK DENGAN METODE ANALISIS SWOT DAN ANALYTIC NETWORK PROCESS (ANP)	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
298	Penelitian Unggulan berbasis Program Studi	Adi Syuriadi	teknik mesin	OPTIMASI PEMBANGKIT LISTRIK TENAGA MIKRO HIDRO  TYPE KINCIR BREASTSHOT DI KAWASAN DANAU UI	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
299	Penelitian Unggulan berbasis Program Studi	Aminah	akuntansi	Preferensi Nasabah Milenial dalam Menggunakan Jasa Perbankan Syariah	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
300	Penelitian Unggulan berbasis Program Studi	Anicetus Damar Aji	teknik elektro	Gangguan Harmonisa terhadap Mutu Daya listrik Jaringan Tegangan 220V/50Hz  Di  Politeknik Negeri Jakarta	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
301	Penelitian Unggulan berbasis Program Studi	Anni Susilowati	teknik sipil	VARIASI WAKTU PERENDAMAN PADA CAMPURAN BETON ASPAL  MENGGUNAKAN BAHAN TAMBAH ANTI STRIPPING TERHADAP  PROPERTIES MARSHALL	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
302	Penelitian Unggulan berbasis Program Studi	Cathryna Rumondang Bulan Simangunsong	akuntansi	ANALISIS EFEKTIFITAS PENGENDALIAN INTERNAL PADA SISTEM PENGGAJIAN AKADEMISI PADA POLITEKNIK NEGERI JAKARTA	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
303	Penelitian Unggulan berbasis Program Studi	Defiana Arnaldy	teknik informatika dan komputer	PENINGKATAN EFISIENSI INFRASTRUKTUR JARINGAN SOHO (SMALL OFFICE HOME OFFICE) DENGAN PEMANFAATAN VIRTUAL MACHINE	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
304	Penelitian Unggulan berbasis Program Studi	Christina Lipuring Rudatin	administrasi niaga	PEMETAAN POTENSI BIDDING UNTUK PERTEMUAN ASOSIASI PROFESI TINGKAT DUNIA SEBAGAI UPAYA MENINGKATKAN JUMLAH EVENT MICE INTERNASIONAL DI  DKI JAKARTA	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
305	Penelitian Unggulan berbasis Program Studi	Aminuddin Debataraja	teknik elektro	Investigasi Sensor Gas Berstruktur Nanokomposit Graphene-Tin Oksida Kinerja Tinggi	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
306	Penelitian Unggulan berbasis Program Studi	Siti Aisiyah	teknik sipil	ANALISIS KEAKURATAN MAKNA TERJEMAHAN  ISTILAH INGGRIS DI BIDANG GEOTEKNIK  DALAM BAHASA INDONESIA	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
307	Penelitian Unggulan berbasis Program Studi	Almahdi	teknik mesin	KAJIAN PENYEBAB PENYIMPANGAN UKURAN PADA PROSES PENEKUKAN  PLAT DENGAN METODA PAIRED SAMPLE T-TEST	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
308	Penelitian Unggulan berbasis Program Studi	Cecep Gunawan	teknik grafika dan penerbitan	Penggunaan Media Sosial Untuk Mendukung Situ Sebagai Tujuan Wisata dan Pelestarian Lingkungan Di Depok, Jawa Barat	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
309	Penelitian Unggulan berbasis Program Studi	Mochammad Sholeh	teknik mesin	Pengembangan Pembacaan Gerak Sumbu Mesin Milling Dengan Sensor Linear (Linear Encoder) Pada Bengkel Mekanik Jurusan Teknik Mesin PNJ	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
310	Penelitian Unggulan berbasis Program Studi	Eriya	teknik informatika dan komputer	SYSTEM DATA BASE TERPADU UNTUK MENDUKUNG SISTEM MONITORING PERKULIAHAN MAHASISWA	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
311	Penelitian Unggulan berbasis Program Studi	Etty Khongrat	administrasi niaga	Attribute destinasi MICE , Citra Destinasi dan pengaruhnya terhadap  Seleksi Destinasi  Event MICE.	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
312	Penelitian Unggulan berbasis Program Studi	Eva Azhra Latifa	teknik sipil	PENYUSUNAN APLIKASI PEMELIHARAAN DAN BIAYA JALAN BERDASARKAN INDEKS KONDISI PERKERASAN (PCI)	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
313	Penelitian Unggulan berbasis Program Studi	Hayati Fatimah	akuntansi	PENGEMBANGAN BAHAN AJAR AKUNTANSI KEUANGAN BERBASIS PSAK KONVERGENSI  IFRS DI PROGRAM STUDI AKUNTANSI PNJ	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
314	Penelitian Unggulan berbasis Program Studi	Indra Silanegara	teknik mesin	Menggabungkan Data Hasil Uji Lab Mesin Fan Test dengan Hasil Pemodelan CAD-nya Menggunakan Program CAE	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
315	Penelitian Unggulan berbasis Program Studi	Lia Ekowati	akuntansi	Model Kepatuhan Perpajakan Dengan Menerapkan E-SPT dan E-Filing Untuk Wajib Pajak UKM Di Kota Depok	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
316	Penelitian Unggulan berbasis Program Studi	Minto Rahayu	teknik mesin	BELA NEGARA DALAM KETAHANAN NASIONAL PADA MAHASISWA	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
317	Penelitian Unggulan berbasis Program Studi	MRR Tiyas Maheni DK	teknik grafika dan penerbitan	Analisis Reverse Search Website sebagai Aplikasi Pendeteksi Plagiarisme Desain Grafis	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
318	Penelitian Unggulan berbasis Program Studi	Nedsal Sixpria	akuntansi	Evaluasi Implementasi Pedoman Akuntansi Pesantren pada Pondok Pesantren di Kota Depok	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
319	Penelitian Unggulan berbasis Program Studi	R Elly Mirati	akuntansi	Denominasi Mata Uang Sebagai Pemicu Konsumen Untuk Membelanjakan Uangnya.	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
320	Penelitian Unggulan berbasis Program Studi	Rodiana Listiawati	akuntansi	ANALISA PENGARUH DAYA TARIK PROMOSI, PERSEPSI KEMUDAHAN, PERSEPSI MANFAAT, PERSEPSI KEAMANAN TERHADAP MINAT PENGGUNAAN E-WALLET  (STUDI KASUS PRODUK OVO, GOPAY DAN LINK AJA PADA MASYARAKAT PENGGUNA DI WILAYAH JABODETABEK)	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
321	Penelitian Unggulan berbasis Program Studi	Sujarwo	akuntansi	EFISIENSI DAN DAYA SAING PERBANKAN INDONESIA  MENGHADAPI ASEAN BANKING INTEGRATION	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
322	Penelitian Unggulan berbasis Program Studi	Suripto	teknik sipil	Study Pemanfaatan Waduk di DAS Ciliwung sebagai Upaya Pemulihan Banjir di Wilayah Tengah Jakarta	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
323	Penelitian Unggulan berbasis Program Studi	Agus Wagyana	teknik elektro	Rancang Bangun Modul Praktik Berbasis ESP32 untuk Pengembangan Aplikasi Internet of Things (IoT)	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
324	Penelitian Unggulan berbasis Program Studi	Andrias Rudi Hermawan	teknik sipil	SAMBUNGAN BALOK PRECAST TIPE WELDED REINFORCE JOINT PADA MOMEN MAKSIMUM	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
325	Penelitian Unggulan berbasis Program Studi	Bambang Waluyo	akuntansi	MODEL UNTUK MEMINIMALISASI MASALAH  DALAM PEMBIAYAAN SALAM DI BANK SYARIAH	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
326	Penelitian Unggulan berbasis Program Studi	Darna	akuntansi	Faktor Penghambat Usaha Mikro dan Kecil (UKM) dalam Legalitas Usaha dan Pengembangan Kegiatan Usahanya Untuk Naik Kelas	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
327	Penelitian Unggulan berbasis Program Studi	Ade Sukma Mulya	akuntansi	TEKNIK PENERJEMAHAN KELOMPOK NOMINA	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
328	Penelitian Unggulan berbasis Program Studi	Dianta Mustofa Kamal	teknik mesin	KARAKTERISASI BAHAN KATODA UNTUK ELEMEN SEL BAHAN BAKAR OKSIDA PADAT SEBAGAI ALTERNATIF ENERGI BARU TERBARUKAN	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
329	Penelitian Unggulan berbasis Program Studi	Iis Mariam	administrasi niaga	PEMETAAN KURIKULUM DAN KOMPETENSI ADMINISTRASI BISNIS BERBASIS KONSEP COLLABORATIVE KNOWLEDGE CREATION  DAN QUADRUPLE HELIX DALAM ERA DISRUPSI	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
330	Penelitian Unggulan berbasis Program Studi	Ariek Sulistyowati	teknik mesin	ANALISIS NILAI KALOR BAHAN BAKAR FOSIL, BIOFUEL DAN CAMPURANNYA DENGAN ALAT  CALORIMETER SEDERHANA	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
331	Penelitian Unggulan berbasis Program Studi	B. S. Rahayu Purwanti	teknik elektro	PENGEMBANGAN PURWARUPA DATALOGGER TIGA PORT_G2 INSTRUMEN MULTI FUNGSI PENGUKUR PENYIMPAN PENAMPIL DATA	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
332	Penelitian Unggulan berbasis Program Studi	Ina Sukaesih	akuntansi	Analisis Nilai Kesantunan Dalam Perspektif Ke-Indonesiaan Pada Aktifitas Tindak Tutur Teks Terjemahan Karya Sastra Bahasa Sunda Dalam Bahasa Inggris	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
333	Penelitian Unggulan berbasis Program Studi	Tuty Herawati	administrasi niaga	MENINGKATKAN MOTIVASI MASYARAKAT  DALAM MELESTARIKAN BUDAYA BATIK DI CIREBON DAN PEKALONGAN  SEBAGAI DAYA TARIK DESTINASI WISATA	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
334	Penelitian Unggulan berbasis Program Studi	Wiwi Prastiwinarti	teknik grafika dan penerbitan	PERANCANGAN  ICC PROFILE COLOR MANAGEMENT SYSTEM PADA REPRODUKSI  WARNA DENGAN PENDEKATAN WARNA KERTAS	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
335	Penelitian Unggulan berbasis Program Studi	Abdul Aziz Abdillah	teknik informatika dan komputer	Ontologi Kualitas Pelayanan (QoS) Untuk Investigasi dan Analisis Protokol Jaringan Ad hoc	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
336	Penelitian Unggulan berbasis Program Studi	Anwar Mustofa	administrasi niaga	EVALUASI KOMPETENSI KETERAMPILAN MEMBACA MAHASISWA SEMESTER 2 JURUSAN ADMINISTRASI NIAGA PADA PENGAJARANBAHASA INGGRIS	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
337	Penelitian Unggulan berbasis Program Studi	Nugroho Eko Setijogiarto	teknik mesin	REKAYASA KATALIS MAGNETIK DARI TITANIUM OKSIDA (TiO2) YANG DIPADU DENGAN CERIUM UNTUK PENGOLAHAN LIMBAH CAIR PEWARNA TEKSTIL	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
338	Penelitian Unggulan berbasis Program Studi	Tri Widjatmaka	teknik mesin	Evaluasi terhadap Implementasi Sistem Penjaminan Mutu Internal (SPMI) Gugus Mutu Jurusan Teknik Mesin Politeknik Negeri Jakarta	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
339	Penelitian Unggulan berbasis Program Studi	Efriyanto	akuntansi	Pengaruh Kemajuan Financial Technology ( Fintech) Terhadap Bisnis     Bank Konvensional di Jabodetabek	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
340	Penelitian Unggulan berbasis Program Studi	Fatimah	akuntansi	Evaluasi Komunikasi Pemasaran Produk UKM Kota Depok Dalam Upaya Memenangkan Persaingan Usaha	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
341	Penelitian Unggulan berbasis Program Studi	Idrus Assagaf	teknik mesin	Kontrol Pengereman kendaraan Berbasis System Cerdas dengan Kamera	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
342	Penelitian Unggulan berbasis Program Studi	Fauzri Fahimuddin	teknik sipil	Pengaruh Sambungan Las Berkampuh dan Tanpa  Kampuh pada Baja Sm-570 dalam Perancangan Jembatan dengan Pendekatan Fatik	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
343	Penelitian Unggulan berbasis Program Studi	Sri Danaryani	teknik elektro	Pembelajaran Bahasa Inggris Teknik di Program Studi Elektronika Industri PNJ Menggunakan  metode Blended Learning	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
344	Penelitian Unggulan berbasis Program Studi	Iwan Susanto	teknik mesin	STUDI LAPISAN NANO FILM GALLIUM NITRIDA YANG TERBENTUK DI ATAS PERMUKAAN MOLIBDENUM DISULFIDA DENGAN TEKNIK PLASMA ASSISTED MOLECULAR BEAM EPITAXY	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
345	Penelitian Unggulan berbasis Program Studi	Mauldy Laya	teknik informatika dan komputer	ANALISA DAN PERANCANGAN SISTEM INFORMASI MANAJEMEN JURUSAN TEKNIK INFORMATIKA DAN KOMPUTER	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
346	Penelitian Unggulan berbasis Program Studi	Petrus Hari Kuncoro Seno	akuntansi	Analisa Faktor faktor yang Berpengaruh terhadap  Kinerja Perusahaan yang terdaftar di Bursa Efek Indonesia	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
347	Penelitian Unggulan berbasis Program Studi	Agus Edy Pramono	teknik mesin	Pengaruh ukuran partikel karbon pada sifat mekanik laju aus dan konduktivitas elektrik dari komposit keramik karbon direkayasa dari limbah organic dan organoclay	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
348	Penelitian Unggulan berbasis Program Studi	Suripto	teknik sipil	Identifikasi Zona Bidang Gelincir dengan Metode Geolistrik Resistivitas dan Geoteknik terhadap Bahaya Longsor di Desa Sukaresmi Kabupaten Sukabumi	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
349	Penelitian Unggulan berbasis Program Studi	Sutikno	teknik sipil	Studi Daya Dukung  Tanah Ekspansif yang Dipadatkan Diatas Kadar Air Optimum Untuk Tanah Dasar Konstruksi Jalan	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
350	Penelitian Unggulan berbasis Program Studi	Syamsu Rizal	administrasi niaga	Volatilitas Pasar Modal Indonesia Pada Saat Pemilihan Umum (Pemilu) 2009-2019	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
351	Penelitian Unggulan berbasis Program Studi	Titik Purwinarti	administrasi niaga	Model Pengembangan Karakter dalam Meningkatkan Jiwa Wirausaha  UMKM	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
352	Penelitian Unggulan berbasis Program Studi	Yelvi	teknik sipil	Pengaruh Penambahan Kadar Butir Halus pada Tanah Reklamasi terhadap Ketahanan Likuifkasi	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
353	Penelitian Dosen Pemula	Ade Haryani	teknik grafika dan penerbitan	STUDI EKSPLORATIF JARINGAN RADIO KOMERSIAL	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
354	Penelitian Dosen Pemula	Andikanoza Pradiptya	teknik sipil	PENGARUH DIAMETER FONDASI TIANG TERHADAP TAHANAN GESEK DALAM TANAH LEMPUNG	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
355	Penelitian Dosen Pemula	Anggi Anggarini	teknik grafika dan penerbitan	Penggunaan Mood Board Sebagai Media Berpikir Kreatif untuk Pengembangan Konsep Visual	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
356	Penelitian Dosen Pemula	Asep Apriana	teknik mesin	Nama NIDN Instansi Asal Bidang Studi Alokasi Waktu Uraian Tugas  Asep Apriana ST,.M.Kom 0010116211  PNJ/ Teknik Alat Berat dan Teknik Mesin Teknik Alat Berat /Teknik Mesin dan ilmu komputer 8 jam/ minggu Menelusuri data internet Memantau pengumpulan data  Wawancara responden Mengolah data Menyusun laporan Minto Rahayu, S.S. M.Si. 0019075804 PNJ/ Teknik Mesin Ilmu bahasa Indonesia dan Ketahanan Nasional   8 jam/ minggu Membuat mengkonsep penelitian Mencari referensi Menelusuri data internet Memantau pengumpu	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
357	Penelitian Dosen Pemula	Djony Herfan	teknik grafika dan penerbitan	JURNALISME ONLINE MEMPENGARUHI KONTEN PEMBERITAAN KOMPAS.COM SERTA KUMPARAN.COM DAN INDOSPORT.COM BERDASARKAN STANDAR KOMPETENSI WARTAWAN	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
358	Penelitian Dosen Pemula	Endang Yuniarti	teknik grafika dan penerbitan	Optimalisasi Waktu dan Biaya Produksi Buku dengan Pendekatan PERT/CPM dan Diagram Matriks	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
359	Penelitian Dosen Pemula	Euis Oktavianti	teknik informatika dan komputer	Implementasi Algoritma Naive Bayes Untuk Klasifikasi Status Gizi Bayi Dan Balita	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
360	Penelitian Dosen Pemula	Fauzi Mubarak	administrasi niaga	PETA DAYA SAING VENUE MICE KOTA DEPOK DAN KOTA BOGOR BERDASARKAN STANDAR MICE ASEAN	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
361	Penelitian Dosen Pemula	Firman Syah	administrasi niaga	Pemetaan Potensi Destinasi Wisata MICE di Tegal	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
362	Penelitian Dosen Pemula	Fitri Wijayanti	teknik mesin	PENINGKATAN KEMAMPUAN KOGNITIF DAN MINAT BELAJAR MAHASISWA TEKNIK KONVERSI ENERGI MELALUI PERKULIAHAN FISIKA TERAPAN BERBASIS PROJECT BASED LEARNING	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
363	Penelitian Dosen Pemula	Husnil Barry	administrasi niaga	Pengujian Kestabilan Pasar Modal Indonesia Periode 2016-2018	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
364	Penelitian Dosen Pemula	Imam Syafganti	administrasi niaga	Perbandingan Evaluasi Interaktifitas Akun Instagram Resmi Pariwisata Indonesia dan Malaysia	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
365	Penelitian Dosen Pemula	Iwan Supriyadi	teknik sipil	Pengaruh Penerapan Manajemen SDM Terhadap Peningkatan Kinerja Bidang Konstruksi di Indonesia	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
366	Penelitian Dosen Pemula	Maria Nino Istia	administrasi niaga	PENGEMBANGAN KETERAMPILAN SOSIAL SEBAGAI UPAYA PENINGKATAN INTERAKSI SOSIAL MAHASISWA MP-WNBK DI LINGKUNGAN PNJ	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
367	Penelitian Dosen Pemula	Maryono	teknik mesin	Analisa dan Pengembangan Kemampuan Membaca Surah Al Fatikhah Pada Mahasiswa PNJ Studi pada Tartil Tilawah al-Qur’an	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
368	Penelitian Dosen Pemula	Novi Purnama Sari	teknik grafika dan penerbitan	Aplikasi Kansei Engineering dan Fuzzy Analytical Hierarchical Process dalam Pengembangan Desain Kemasan	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
369	Penelitian Dosen Pemula	Novitasari	akuntansi	Analisis Faktor-faktor Yang Berpengaruh Terhadap Minat beli Konsumen Online Di Marketplace ( Studi Kasus pada Mahasiswa Jurusan Akuntansi Politeknik Negeri Jakarta dan Masyarakat Pengguna Aktif Media Sosial)	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
370	Penelitian Dosen Pemula	Nuralam	teknik elektro	Perancangan Machine Vision untuk Pemilah Kualitas Telur Berbasis Image Processing	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
371	Penelitian Dosen Pemula	Rahma Nur Praptiwi	administrasi niaga	ANALISIS FAKTOR-FAKTOR YANG MEMPENGARUHI KEPUTUSAN PEMBELIAN PADA MAHASISWA PROGRAM STUDI PEMASARAN UNTUK WARGA NEGARA BERKEBUTUHAN KHUSUS POLITEKNIK NEGERI JAKARTA	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
404	Penelitian Produk Terapan	Anis Rosyidah	teknik sipil	MODEL SAMBUNGAN BETON PRACETAK MENGGUNAKAN COUPLER	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
372	Penelitian Dosen Pemula	Rina Ningtyas	teknik grafika dan penerbitan	APLIKASI EDIBLE FILM PURE JAMBU BIJI DAN PATI SINGKONG PADA PRODUK PERMEN DAN OLAHAN COKLAT	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
373	Penelitian Dosen Pemula	Rosidi	teknik mesin	Analisa Kekuatan Mekanik Hasil  Dari Repair Welding Cetakan Produk Plastik Pada Baja AISI 420 Dengan Metoda Las Laser  Tipe CIWM –Z200	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
374	Penelitian Dosen Pemula	Saeful Imam	teknik grafika dan penerbitan	Analisis Tingkat Kecacatan Produk  Cetak Kemasan Karton Lipat Dengan Pendekatan Dmaic Six Sigma	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
375	Penelitian Dosen Pemula	Shinta Oktaviana R	teknik informatika dan komputer	Analisa Ketertarikan Minat Masyarakat terhadap PNJ Melalui Akun Jejaring Sosial Menggunakan Metode SVM	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
376	Penelitian Dosen Pemula	Taufik Akbar	administrasi niaga	ANALISA RESPON KONSUMEN DALAM PENAWARAN CAUSE RELATED MARKETING DI INDUSTRI PARIWISATA	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
377	Penelitian Dosen Pemula	Wahyudi Utomo	administrasi niaga	Tingkat Penguasaan dan Perbedaan Self Regulated Learning  Skills Pada Mahasiswa Yang Mengikuti Organisasi Kemahasiswaan Dan Mahasiswa Yang Tidak Mengikuti Organisasi Kemahasiswaan(Studi Mahasiswa Administrasi Niaga)	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
378	Penelitian Dosen Pemula	Annisa Wardhani	administrasi niaga	Persepsi Apresiasi Pekerja Magang  di Perusahaan Industri MICE terhadap Minat untuk Bekerja Kembali di Perusahaan Industri MICE (Studi Kasus Mahasiswa Program Studi MICE Politeknik Negeri Jakarta)	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
379	Penelitian Bidang Ilmu dan Pengembangan Institusi	Anik Tjandra Setiati	teknik elektro	Tantangan dan Hambatan Perempuan Lulusan Bidang Rekayasa Politeknik Negeri Jakarta yang Berkarir di Industri	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
380	Penelitian Bidang Ilmu dan Pengembangan Institusi	Azwardi	teknik mesin	DETEKSI PENYAKIT DIABETES MENGGUNAKAN  LINEAR DISCRIMINANT ANALYSIS DAN  SUPPORT VECTOR MACHINE	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
381	Penelitian Bidang Ilmu dan Pengembangan Institusi	Mohammad Fauzy	teknik grafika dan penerbitan	Hubungan Prestasi Belajar dengan Kecerdasan Mahasiswa Jurusan Teknik Grafika dan Penerbitan, Politeknik Negeri Jakarta.	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
382	Penelitian Bidang Ilmu dan Pengembangan Institusi	Elisabeth Yanshe Metekohy	akuntansi	TINGKAT PENGETAHUAN DAN PERSEPSI MASYARAKAT  TERHADAP  POLITEKNIK NEGERI JAKARTA	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
383	Penelitian Bidang Ilmu dan Pengembangan Institusi	Ernita Siambaton	administrasi niaga	MOTIVASI KEWIRAUSAHAAN WIRAUSAHA PEREMPUAN (WOMENPRENEUR)	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
384	Penelitian Bidang Ilmu dan Pengembangan Institusi	Andi Ulfiana	teknik mesin	Simulator Pengoperasian Pembangkit Listrik Tenaga Gas Bebasis Labview Di Laboratorium Teknik Konversi Energi PNJ	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
385	Penelitian Bidang Ilmu dan Pengembangan Institusi	Riza Hadikusuma	administrasi niaga	MOTIVASI PEMAKAIAN JILBAB DAN PERILAKU SOSIAL KEAGAMAAN MAHASISWI BERJILBAB POLITEKNIK NEGERI JAKARTA	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
386	Penelitian Bidang Ilmu dan Pengembangan Institusi	Sarito	teknik sipil	Pengembangan Profil Program Studi D3 Konstruksi Gedung Untuk Meningkatkan Akreditasi	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
387	Penelitian Bidang Ilmu dan Pengembangan Institusi	Taufikul Ichsan	akuntansi	Penyusunan Harga Pokok Penjualan dan Pelaporan Keuangan pada Budidaya Ikan Air Tawar	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
388	Penelitian Berbasis Penugasan	Putera Agung Maha Agung	teknik sipil	CACAT DAN GAGAL PARAMETER KOHESI (c)  LAPISAN LEMPUNG (CLAY) DAN ALTERNATIF PENANGGULANGAN/PERBAIKAN UNTUK BADAN JALAN (LANJUTAN-TAHUN KE-2)	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
389	Penelitian Berbasis Penugasan	Frianto	akuntansi	ANALISIS KEBUTUHAN HARD SKILL KOMPUTER UNTUK KEBUTUHAN LULUSAN PROGRAM STUDI SARJANA TERAPAN KEUANGAN DAN PERBANKAN  DI JURUSAN AKUNTANSI PNJ	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
390	Penelitian Berbasis Penugasan	Sri Wahyono	akuntansi	ANALISIS KOHESI LEKSIKAL PADA ARTIKEL JURNAL TERINDEKS SCOPUS “A NEW CONTROL METHOD FOR POWER BASED  ON DYNAMIC EVOLUTION CONTROL “	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
391	Penelitian Berbasis Penugasan	Kadunci	administrasi niaga	ANALISIS PENGARUH KUALITAS PRODUK dan IKLAN TERHADAP KEPUTUSAN PEMBELIAN PRODUK BATIK CIWARINGIN  KABUPATEN CIREBON	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
392	Penelitian Berbasis Penugasan	Achmad Nadjam	teknik sipil	Analisis Kemacetan Lalu Lintas Di Ruas Jalan Raya Tanah Baru Depok  dan Upaya Penanganannya	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
393	Penelitian Berbasis Penugasan	Setiyadi	teknik sipil	PENGEMBANGAN ALAT BANTU PEMASANGAN  UBIN KERAMIK DINDING  BANGUNAN GEDUNG ( lanjutan )	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
394	Penelitian Berbasis Penugasan	Kusumo Drajad Sutjahjo	teknik sipil	ANALISIS PENERAPAN SMK3 PP 50 TAHUN 2012 PADA PERUSAHAAN JASA KONSTRUKSI	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
395	Penelitian Hibah Tenaga Kependidikan	Haidir Juna	teknik mesin	MODIFIKASI ENGINE PERKIN P13.5-4 UNTUK MENUNJANG PEMBELAJARAN TEORI MESIN DIESEL	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
396	Penelitian Hibah Tenaga Kependidikan	Bambang Sutejo	teknik elektro	INVENTORI KABEL LISTRIK DI BENGKEL TEKNIK ELEKTRO POLITEKNIK NEGERI JAKARTA	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
397	Penelitian Hibah Tenaga Kependidikan	Irfan Choiri	teknik mesin	MODIFIKASI RANCANG BANGUN MODUL PRAKTIKUM KONTROL ELEKTRO MEKANIS DI LABORATORIUM TEKNIK KONVERSI ENERGI	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
398	Penelitian Hibah Tenaga Kependidikan	Memed Sumanto	teknik mesin	Pengujian Performansi charging dan discharging  ACCU	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
399	Penelitian Hibah Tenaga Kependidikan	Mochamad Soleh	teknik informatika dan komputer	Penerapan Sistem Informasi Kearsipan Dinamis di Jurusan Teknik Informatika dan Komputer Politeknik Negeri Jakarta	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
400	Penelitian Hibah Tenaga Kependidikan	Khafidun	teknik elektro	PENGUJIAN MOTOR INDUKSI TIGA PHASA DI BENGKEL LISTRIK POLITEKNIK NEGERI JAKARTA	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
401	Penelitian Produk Terapan	Utami Puji Lestari	akuntansi	Ukuran Kinerja yang terpadu dengan kesenjangan Informasi, Pengawasan yang suportif dan Kualitas Komunikasi untuk meningkatkan Keterlibatan dalam Pekerjaan: Suatu Usulan Model di industri Jasa	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
402	Penelitian Produk Terapan	Muslimin	teknik mesin	Studi Pengaruh Parameter-parameter Pemesinan EDM (Electrical Discharge Machining) pada Tingkat Kehalusan Permukaan dan Perubahan Struktur Mikro Dies and Punch untuk Produk Makanan dengan Material AISI 316	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
403	Penelitian Produk Terapan	Rahmat Subarkah	teknik mesin	Investigasi Performa Photovoltaic/Thermal (PV/T) Sebagai Sumber Energi Baru Untuk Memenuhi Kebutuhan Energi Rumah Tangga	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
405	Penelitian Produk Terapan	Titi Suharti	akuntansi	Evaluasi Atas Implementasi Pengelolaan Dana Desa Dalam Mewujudkan Akuntabilitas Publik	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
406	Penelitian Produk Terapan	Murie Dwiyaniti	teknik elektro	PENGENDALI KUALITAS AIR PADA PERIKANAN BUDIDAYA  BERBASIS TEKNOLOGI INTERNET OF THINGS (IoT)	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
407	Penelitian Produk Terapan	Toto Supriyanto	teknik elektro	Pengembangan sistem real-time X-band speed detector berbasis doppler effect sesuai standar SNI 09-2764-1992 untuk meningkatkan keselamatan berkendara	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
408	Penelitian Produk Terapan	Yoyok Sabar Waluyo	teknik informatika dan komputer	Media Pembelajaran Interaktif Bahasa Indonesia bagi Penutur Asing	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
409	Penelitian Produk Terapan	Ismujianto	teknik elektro	Kendali mutu  Grounding System Berbasis Infrared Topography Monitoring	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
410	Penelitian Produk Terapan	Gun Gun Ramdlan Gunadi	teknik mesin	Pengembangan Pembangkit Listrik Tenaga Mikro Hidro Type Turbin Cross Flow Head Rendah	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
411	Penelitian Produk Terapan	Amalia	teknik sipil	Model Tegangan Regangan, Modulus Elastisitas, dan Kuat Lentur Beton Self Compacting Concrete (Scc) Dengan Bahan Tambah Limbah Scrap Baja dan Abu Sekam Padi	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
412	Penelitian Produk Terapan	Dewin Purnama	teknik mesin	Pengaruh Magnesium Terhadap Struktur Mikro dan Kualitas Lasan Baja AH-36 dalam Pengelasan Bawah Air dengan Metode SMAW	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
413	Penelitian Produk Terapan	Amirudin	administrasi niaga	MODEL INTEGRASI BANDARA KERTAJATI  SEBAGAI STRATEGI ONE STOP SHOPPING DESTINASI BISNIS DAN LEISURE	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
414	Penelitian Unggulan Perguruan Tinggi	Pribadi Mumpuni Adhi	teknik mesin	Optimasi Rancang Bangun Mesin Vacuum Forming Otomatis untuk Aneka Bentuk Kemasan Makanan pada Industri  Kecil Menengah	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
415	Penelitian Unggulan Perguruan Tinggi	Ida Nurhayati	akuntansi	Credit Fraud : Salah Satu Dimensi Kejahatan Perbankan Dalam Perspektif White Collar-Crime	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
416	Penelitian Unggulan Perguruan Tinggi	Sabar Warsini	akuntansi	Dampak Kebijakan Tax Amnesty terhadap Faktor Determinan Perilaku Penghindaran Pajak pada Perusahaan Publik yang Dikontrol Keluarga	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
417	Penelitian Unggulan Perguruan Tinggi	Supriatnoko	akuntansi	Analisis Kualitas Terjemahan Kata Serapan dari Bahasa Inggris ke dalam Bahasa Indonesia pada Kamus Besar Bahasa Indonesia (KBBI)	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
418	Penelitian Unggulan Perguruan Tinggi	Tetty Rimenda	akuntansi	PERAN HARGA PATOKAN (ANCHOR PRICE)  TERHADAP KEPUTUSAN UNTUK MEMBELI SAHAM	\N	\N	2019	Internal	\N	2021-06-02 10:00:12	2021-06-02 10:00:12
\.


--
-- TOC entry 3121 (class 0 OID 47277)
-- Dependencies: 219
-- Data for Name: pengabdian; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pengabdian (id, skim_pengabdian, nama_ketua_pengabdian, jurusan, judul, abstrak, besar_dana, tahun, kategori, nama_anggota, created_at, updated_at) FROM stdin;
1	IbM	Prihatin Oktivasari	teknik informatika dan komputer	lbM Teknologi Monitoring Sampah Menggunakan Tempat Sampah Pintar Berbasis Android	\N	\N	2017	DIKTI	\N	2021-06-02 09:34:49	2021-06-02 09:34:49
2	IbKIK	Ade Sumpena	teknik mesin	lbKIK Jasa Produksi Mesin/Pusat Produksi Permesinan	\N	\N	2017	DIKTI	\N	2021-06-02 09:34:49	2021-06-02 09:34:49
3	Program Diseminasi	Ahmad Tossin Alamsyah	teknik elektro	Penerapan Teknologi Pengolahan Sampah Organik Dalam Upaya Pemberdayaan Ekonomi Produktif Bagi Masyarakat Desa Cileungsi Kidul Kabupaten Bogor	\N	\N	2017	DIKTI	\N	2021-06-02 09:34:49	2021-06-02 09:34:49
4	Program Diseminasi	Sri Danaryani	teknik elektro	Diseminasi Teknologi Pengolahan Sampah terpadu dalam upaya menuju kampung sehat dan hijau didesa citamiang kecamatan kadudampit kabupaten Sukabumi	\N	\N	2017	DIKTI	\N	2021-06-02 09:34:49	2021-06-02 09:34:49
5	Pengabdian Kepada Masyarakat Berbasis Jurusan	Azwardi	teknik mesin	Perbaikan Sistem Pengelolaan Sampah Rumah Tangga menjadi pupuk kompos organik di Rt 04 dan 05/Rw 05 Kelurahan Beji Timur Kecamatan Beji Kota Depok	\N	\N	2017	Internal	\N	2021-06-02 09:34:49	2021-06-02 09:34:49
6	Pengabdian Kepada Masyarakat Berbasis Jurusan	Riza Hadikusuma	administrasi niaga	Penerapan Manajemen dan Teknologi Berkelanjutan Sebagai Wujud Pemberdayaan Ekonomi Produktif bagi Masyarakat Desa Adat Kampung Urug Kabupaten Bogor	\N	\N	2017	Internal	\N	2021-06-02 09:34:49	2021-06-02 09:34:49
7	Pengabdian Kepada Masyarakat Berbasis Jurusan	Sri Danaryani	teknik elektro	Perbaikan Ruang Kelas Pesantren Hidayatul Falah, Desa Urug Kecamatan Sukajaya	\N	\N	2017	Internal	\N	2021-06-02 09:34:49	2021-06-02 09:34:49
8	Pengabdian Kepada Masyarakat Berbasis Jurusan	Ali Masjono	akuntansi	IPTEKS Bagi Masyarakat Peningkatan Pemahaman masyarakat Untuk Berinvestasi yang baik dan benar sesuai Syariah	\N	\N	2017	Internal	\N	2021-06-02 09:34:49	2021-06-02 09:34:49
9	Pengabdian Kepada Masyarakat Berbasis Jurusan	Immanuel Pratomojati	teknik sipil	Pembangunan Tempat Produksi Batik Desa Urug, Kevcamatan Sukajaya Kab Bogor	\N	\N	2017	Internal	\N	2021-06-02 09:34:49	2021-06-02 09:34:49
10	Pengabdian Kepada Masyarakat Berbasis Jurusan	Risna Sari	teknik informatika dan komputer	Pembuatan Sistem Kota Pintar dan Pelatihan Penggunaannya pada Pemerintah Kota Depok	\N	\N	2017	Internal	\N	2021-06-02 09:34:49	2021-06-02 09:34:49
11	Pengabdian Kepada Masyarakat Berbasis Jurusan	MRR Tiyas Maheni DK	teknik grafika dan penerbitan	Pembuatan Hiasan Dinding dengan teknik Hand Lettering  Menggunakan Teknik Produksi Screen Printing di LPKA Kelas 2 (dua) Bandung	\N	\N	2017	Internal	\N	2021-06-02 09:34:49	2021-06-02 09:34:49
12	Pengabdian Kepada Masyarakat Berbasis Jurusan	Nining Latianingsih	p3m	Pelatihan dan Sosialisasi Pembuatan Batik Bagi Perempuan Warga Desa Adat Kampung Urug, Kabupaten Bogor	\N	\N	2017	Internal	\N	2021-06-02 09:34:49	2021-06-02 09:34:49
13	Pengabdian Kepada Masyarakat Berbasis Jurusan	I Ketut Sucita	p3m	Pengembangan Studio di Desa Urug dengan melengkapi Peralatan Batik	\N	\N	2017	Internal	\N	2021-06-02 09:34:49	2021-06-02 09:34:49
14	Pengabdian Kepada Masyarakat Berbasis Prodi	Masnadi	teknik informatika dan komputer	IbM Pengembangan Aplikasi e-profile Sekolah Berbasis Web Untuk Mendukung Program Cyber School pada SMAN 6 dan  MSPN 5  DEPOK	\N	\N	2017	Internal	\N	2021-06-02 09:34:49	2021-06-02 09:34:49
15	Pengabdian Kepada Masyarakat Berbasis Prodi	Hata Maulana	teknik informatika dan komputer	IbM Pelatihan Pembuatan Modul Ajar Multimedia Interaktif untuk Guru SMK N I TAPOs	\N	\N	2017	Internal	\N	2021-06-02 09:34:49	2021-06-02 09:34:49
16	Pengabdian Kepada Masyarakat Berbasis Prodi	Yoyok Sabar Waluyo	teknik informatika dan komputer	IbM Pelatihan Pembelajaran Bahasa Inggris Mudah dan Menyenangkan  untuk GURU SMP 5 KOTA DEPOK	\N	\N	2017	Internal	\N	2021-06-02 09:34:49	2021-06-02 09:34:49
17	Pengabdian Kepada Masyarakat Berbasis Prodi	Indri Neforawati	teknik informatika dan komputer	Pelatihan dan Pembuatan buku Pedoman Internet sehat pada  SMP Negeri 5 dan SMA Negeri 6  DEPOK	\N	\N	2017	Internal	\N	2021-06-02 09:34:49	2021-06-02 09:34:49
18	Pengabdian Kepada Masyarakat Berbasis Prodi	Prihatin Oktivasari	teknik informatika dan komputer	IbM Pelatihan Pengembangan Internet of Things ( LOT ) enggunakan Arduino untuk GURU SMKN 1 dan SMAN 7  DEPOK	\N	\N	2017	Internal	\N	2021-06-02 09:34:49	2021-06-02 09:34:49
19	Pengabdian Kepada Masyarakat Berbasis Prodi	Mochammad Sholeh	teknik mesin	Peningkatan Kompetensi Pengelasan dan Menggambar Menggunakan Bantuan  Sofware Bagi Siswa SMK di DEPOK	\N	\N	2017	Internal	\N	2021-06-02 09:34:49	2021-06-02 09:34:49
20	Pengabdian Kepada Masyarakat Berbasis Prodi	Indriyani Rebet	teknik mesin	Pemanfaatan Limbah Serbuk Gergaji Kayu Menjadi Papan Partikel Di Wilayah Bekasi	\N	\N	2017	Internal	\N	2021-06-02 09:34:49	2021-06-02 09:34:49
21	Pengabdian Kepada Masyarakat Berbasis Prodi	Budi Prianto	teknik mesin	Pelatihan Alat Berat untuk Masyarakat Desa Cipayung Depok	\N	\N	2017	Internal	\N	2021-06-02 09:34:49	2021-06-02 09:34:49
22	Pengabdian Kepada Masyarakat Berbasis Prodi	Cecep Slamet Abadi	teknik mesin	Perbaikan  Jalan  di RT.02/02 KELURAHAN BEJI TIMUR  Kecamatan Beji Timur	\N	\N	2017	Internal	\N	2021-06-02 09:34:49	2021-06-02 09:34:49
23	Pengabdian Kepada Masyarakat Berbasis Prodi	Andi Ulfiana	teknik mesin	Perbaikan Instalasi Listrik dan Konstruksi Bangunan Musholla di RT.02/02 Kel.Beji Timur  Kecamatan Beji Kota Depok	\N	\N	2017	Internal	\N	2021-06-02 09:34:49	2021-06-02 09:34:49
24	Pengabdian Kepada Masyarakat Berbasis Prodi	Syafrizal Syarief	teknik elektro	Pelatihan Sistem Integrasi PLC Pada SMK N 4 DEPOK Jurusan Teknik Elektronika Industri	\N	\N	2017	Internal	\N	2021-06-02 09:34:49	2021-06-02 09:34:49
25	Pengabdian Kepada Masyarakat Berbasis Prodi	Sila Wardono	teknik elektro	Pelatihan Instalasi Listrik dan Perbaikan  Sarana Prasarana Belajar Mengajar  di Madrasah  IBTIDAIYAH MIFTAHUL ULUM Desa Leuwikaret . Kecamatan Klapanunggal Kabupaten BOGOR	\N	\N	2017	Internal	\N	2021-06-02 09:34:49	2021-06-02 09:34:49
26	Pengabdian Kepada Masyarakat Berbasis Prodi	Isdawimah	teknik elektro	Pemasangan dan Pelatihan Instalasi Listrik di PAUD AL FALAH Gedung BUNDER 1 Kecamatan PAMIJAHAN  Kabupaten BOGOR	\N	\N	2017	Internal	\N	2021-06-02 09:34:49	2021-06-02 09:34:49
27	Pengabdian Kepada Masyarakat Berbasis Prodi	Ahmad Tossin Alamsyah	teknik elektro	Mengangkat Potensi Minat Baca Siswa Melalui Pembenahan Perpustakaan di Sekolah dasar Dilingkungan Desa  Cilembeur/Ciasihan	\N	\N	2017	Internal	\N	2021-06-02 09:34:49	2021-06-02 09:34:49
28	Pengabdian Kepada Masyarakat Berbasis Prodi	Anik Tjandra Setiati	teknik elektro	IbM Pelatihan Komputer dan Internet untuk GURU PAUD Kecamatan Pancoran Mas KOTA Depok	\N	\N	2017	Internal	\N	2021-06-02 09:34:49	2021-06-02 09:34:49
29	Pengabdian Kepada Masyarakat Berbasis Prodi	Mohammad Fathurahman	teknik elektro	Pemasangan Jaringan Internet Broadband dan Pelatihan Penggunaan Media Sosial untuk Memulai ( STAR UP ) Bisnis ONLINE Sebagai Penunjang Kompetensi Siswa dan Guru  Jurusan  Pemasaran SMK Negeri 3  DEPOK	\N	\N	2017	Internal	\N	2021-06-02 09:34:49	2021-06-02 09:34:49
30	Pengabdian Kepada Masyarakat Berbasis Prodi	Ade Haryani	teknik grafika dan penerbitan	Penguatan Media Publikasi SMA dan SMK Pembuatan dan Pengelolaan Media Publikasi Sekolah Berbasis Web Kota Sukabumi  Jawa Barat	\N	\N	2017	Internal	\N	2021-06-02 09:34:49	2021-06-02 09:34:49
31	Pengabdian Kepada Masyarakat Berbasis Prodi	Ach Bakhrul Muchtasib	akuntansi	Pendampingan Pendirian Koperasi Simpan Pinjam dan Pembiayaan Syariah pada Yayasan Bina Mujtama' Bojong Gede	\N	\N	2017	Internal	\N	2021-06-02 09:34:49	2021-06-02 09:34:49
32	Pengabdian Kepada Masyarakat Berbasis Prodi	Sabar Warsini	akuntansi	IbM Kelompok Wanita Usia Produktif Kel. Beji Timur KOTA DEPOK “INVESTASI SAHAM SEBAGAI SARANA PERENCANAAN KEUANGAN KELUARGA	\N	\N	2017	Internal	\N	2021-06-02 09:34:49	2021-06-02 09:34:49
33	Pengabdian Kepada Masyarakat Berbasis Prodi	Efriyanto	akuntansi	Melalui Program Community development Optimalisasi Peran Lembaga Keuangan Mikro ( LKM ) Sebagai Wadah Pengembangan Usaha Kecil di Kotamadya  DEPOK	\N	\N	2017	Internal	\N	2021-06-02 09:34:49	2021-06-02 09:34:49
34	Pengabdian Kepada Masyarakat Berbasis Prodi	M Jamal Al-Bakri	administrasi niaga	IbM Pelatihan Manajemen Tantrum Bagi Orang Tua yang mempunyai Anak  Penyandang Disabilitas  Terutama Penyandang Autisme Yang Terkumpul\nDi PNJ dan Masyarakat di Luar PNJ	\N	\N	2017	Internal	\N	2021-06-02 09:34:49	2021-06-02 09:34:49
35	Pengabdian Kepada Masyarakat Berbasis Prodi	Novi Purnama Sari	teknik grafika dan penerbitan	Pembuatan Alat Cutting Hand Press Pada Kemasan  Makanan Ringan Produk UKM di KOTA Serang	\N	\N	2017	Internal	\N	2021-06-02 09:34:49	2021-06-02 09:34:49
36	Pengabdian Kepada Masyarakat Berbasis Prodi	Sari Puspita Dewi	teknik grafika dan penerbitan	Pembuatan Environmental Graphic Design (EGD) di Pos Paud Mawar 15	\N	\N	2017	Internal	\N	2021-06-02 09:34:49	2021-06-02 09:34:49
37	Pengabdian Kepada Masyarakat Berbasis Prodi	Endang Yuniarti	teknik grafika dan penerbitan	Perancangan dan Pembuatan Mesin Cetak Label Kemasan Dengan Tinta Dey untuk Tipe Kertas Coated pada UKM Makanan Ringan di Kota Serang-Banten	\N	\N	2017	Internal	\N	2021-06-02 09:34:49	2021-06-02 09:34:49
38	Pengabdian Kepada Masyarakat Berbasis Prodi	Endah Wartiningsih	administrasi niaga	Penerapan Aspek Budaya Kewirausahaan Masyarakat dan Pembuatan WEB untuk Meningkatkan Kinerja  Organisasi di Pemerintahan Desa Kabupaten BOGOR 	\N	\N	2017	Internal	\N	2021-06-02 09:34:49	2021-06-02 09:34:49
39	Pengabdian Kepada Masyarakat Berbasis Prodi	Tuty Herawati	administrasi niaga	Peningkatan Pengetahuan dan Ketrampilan Pengelolaan  HOMESTAY Di Desa SENTUL  Kec. Babakan Madang  KABUPATEN BOGOR	\N	\N	2017	Internal	\N	2021-06-02 09:34:49	2021-06-02 09:34:49
40	Pengabdian Kepada Masyarakat Berbasis Prodi	Iis Mariam	administrasi niaga	Penerapan Management Bisnis dan Pembuatan Badan Hukum Koperasi bagi Masyarakat Desa Cilember Kabupaten BOGOR	\N	\N	2017	Internal	\N	2021-06-02 09:34:49	2021-06-02 09:34:49
41	Pengabdian Kepada Masyarakat Berbasis Prodi	Lia Ekowati	akuntansi	IbM Sosialisasi Aspek Perpajakan Bagi Usaha Mikro Kecil dan Menengah di Politeknik Negeri Jakarta	\N	\N	2017	Internal	\N	2021-06-02 09:34:49	2021-06-02 09:34:49
42	Pengabdian Kepada Masyarakat Berbasis Prodi	Hayati Fatimah	akuntansi	Peningkatan Pengelolaan Keuangan Melalui Pengenalan Akuntansi Berbasis SAK EMKM Bagi Usaha Mikro di Lingkungan Kampus PNJ	\N	\N	2017	Internal	\N	2021-06-02 09:34:49	2021-06-02 09:34:49
43	Pengabdian Kepada Masyarakat Berbasis Prodi	Novitasari	akuntansi	Pelatihan Penyusunan Proposal Kredit yang BENKABEL DAN FEASIBLE  Bagi  Para Pelaku Usaha Kecil di KOTA MADYA DEPOK	\N	\N	2017	Internal	\N	2021-06-02 09:34:49	2021-06-02 09:34:49
44	Pengabdian Kepada Masyarakat Berbasis Prodi	Denny Yatmadi	teknik sipil	Pengecoran Jalan STA  95 – STA 190 Kampung Ceringin Poncol RT 01 RW. 11 Desa Raga Jaya . Kec. Bojong Gede Kabupaten BOGOR	\N	\N	2017	Internal	\N	2021-06-02 09:34:49	2021-06-02 09:34:49
45	Pengabdian Kepada Masyarakat Berbasis Prodi	Eko Wiyono	teknik sipil	Pengecoran Jalan STA 0+00 - 0 + 95 Kampung Ceringin Poncol Desa Raga Jaya . Kec. Bojong Gede Kabupaten BOGOR	\N	\N	2017	Internal	\N	2021-06-02 09:34:49	2021-06-02 09:34:49
46	Pengabdian Kepada Masyarakat Berbasis Prodi	Kusumo Drajad Sutjahjo	teknik sipil	Pembangunan Kamar Toilet Dan Atap Pos Ronda Kampung Ceringin Poncol Desa Raga Jaya . Kec. Bojong Gede Kabupaten BOGOR	\N	\N	2017	Internal	\N	2021-06-02 09:34:49	2021-06-02 09:34:49
47	Pengabdian Kepada Masyarakat Berbasis Prodi	Sarito	teknik sipil	Pembangunan Pondasi Dan Dinding  Pos Ronda Kampung Ceringin Poncol Desa Raga Jaya . Kec. Bojong Gede Kabupaten BOGOR	\N	\N	2017	Internal	\N	2021-06-02 09:34:49	2021-06-02 09:34:49
48	Pengabdian Kepada Masyarakat Berbasis Prodi	Anis Rosyidah	p3m	Pemberdayaan Masyarakat melalui upaya Peningkatan Penghasilan bidang pengelolaan dan pengolahan sampah organic di Desa Pasir Angin, Kecamatan Megamendung, Kabupaten Bogor	\N	\N	2017	Internal	\N	2021-06-02 09:34:49	2021-06-02 09:34:49
49	Pengabdian Kepada Masyarakat Berbasis Prodi	Ida Nurhayati	p3m	Pembangunan struktur atap Bangunan Tempat Membatik di Kampung Urug, Kabupaten Bogor	\N	\N	2017	Internal	\N	2021-06-02 09:34:49	2021-06-02 09:34:49
50	Program Kemitraan Masyarakat	Sutanto	teknik elektro	PEMBERDAYAAN BANK SAMPAH  DI WILAYAH  DESA DUREN MEKAR	\N	\N	2018	DIKTI	\N	2021-06-02 09:37:26	2021-06-02 09:37:26
51	Diseminasi Produk Teknologi ke Masyarakat	Ida Nurhayati	akuntansi	DISEMINASI TEKNOLOGI PADA PENGEMBANGAN UKM PRODUK BERBASIS UNGGULAN DAERAH DALAM UPAYA PEMBERDAYAAN MASYARAKAT DI KELURAHAN CIBINONG KECAMATAN CIBINONG KABUPATEN BOGOR	\N	\N	2018	DIKTI	\N	2021-06-02 09:37:26	2021-06-02 09:37:26
52	Diseminasi Produk Teknologi ke Masyarakat	Iis Mariam	administrasi niaga	Pengolahan Sampah Terpadu dalam Upaya Meningkatkan Kualitas Lingkungan dan Partisipasi Masyarakat Desa Ciampea Kabupaten Bogor	\N	\N	2018	DIKTI	\N	2021-06-02 09:37:26	2021-06-02 09:37:26
53	Penerapan Produk Teknologi Tepat Guna kepada Masyarakat	Ahmad Tossin Alamsyah	teknik elektro	Peningkatan Kemapuan Enterpreneurship Masyarakat Berbasis Teknologi Tepat Guna di Kelurahan Kemiri Muka Kecamatan Beji Depok	\N	\N	2018	DIKTI	\N	2021-06-02 09:37:26	2021-06-02 09:37:26
54	Penerapan Produk Teknologi Tepat Guna kepada Masyarakat	Nining Latianingsih	administrasi niaga	Pemberdayaan Masyarakat melalui pemanfaatan teknologi Tepat guna ( TTG ) dalam pengelolaan dan pengolahan sampah terpadu 	\N	\N	2018	DIKTI	\N	2021-06-02 09:37:26	2021-06-02 09:37:26
55	Pengabdian Kepada Masyarakat Berbasis Jurusan	Ach Bakhrul Muchtasib	akuntansi	Pemberdayaan Perempuan Desa Urug Kabupaten Bogor Dalam Meningkatkan Ekonomi Rumah Tangga	\N	\N	2018	Internal	\N	2021-06-02 09:37:26	2021-06-02 09:37:26
56	Pengabdian Kepada Masyarakat Berbasis Jurusan	Andikanoza Pradiptya	teknik sipil	Pembangunan MCK Umum di Desa Urug Kecamatan Sukajaya - Kabupaten Bogor	\N	\N	2018	Internal	\N	2021-06-02 09:37:26	2021-06-02 09:37:26
57	Pengabdian Kepada Masyarakat Berbasis Jurusan	Dwi Agnes Natalia Bangun	teknik grafika dan penerbitan	Pebuatan Buku Profil Sebagai Promosi Kampung Wisata Adat Urug Bogor	\N	\N	2018	Internal	\N	2021-06-02 09:37:26	2021-06-02 09:37:26
58	Pengabdian Kepada Masyarakat Berbasis Jurusan	Indri Neforawati	teknik informatika dan komputer	Sosialisasi Internet Sehat dan Pembuatan Buku Pedoman Internet Sehat Untuk Kader Posyandu dan Puskesmas Kelurahan Kalimulya Kecamatan Cilodong Kota Depk	\N	\N	2018	Internal	\N	2021-06-02 09:37:26	2021-06-02 09:37:26
59	Pengabdian Kepada Masyarakat Berbasis Jurusan	Sri Danaryani	teknik elektro	Renovasi Masjid Jami Al-Ikhlas Kampung Urug Lebak Desa Uruh, Kecamatan Sukajaya	\N	\N	2018	Internal	\N	2021-06-02 09:37:26	2021-06-02 09:37:26
60	Pengabdian Kepada Masyarakat Berbasis Jurusan	Riza Hadikusuma	administrasi niaga	Penerapan manajemen dan teknologi berkelanjutan  sebagai wujud  pemberdayaan ekonomi produktif  bagi masyarakat  desa adat Kampung  Urug Kecamatan Sukajaya Kabupaten Bogor	\N	\N	2018	Internal	\N	2021-06-02 09:37:26	2021-06-02 09:37:26
61	Pengabdian Kepada Masyarakat Berbasis Jurusan	Suyitno Gatot	teknik mesin	Revitalisasi Sarana Asrama Pesantren Putri di Kampung Adat Urug, Desa Urug, Kecamatan Sukajaya, Kabupaten Bogor	\N	\N	2018	Internal	\N	2021-06-02 09:37:26	2021-06-02 09:37:26
62	Pengabdian Kepada Masyarakat Berbasis Program Studi	Ahmad Tossin Alamsyah	teknik elektro	Revitalisasi Sarana MCK Masyarakat di Desa Adat Kampung Urug Leuwiliang Bogor	\N	\N	2018	Internal	\N	2021-06-02 09:37:26	2021-06-02 09:37:26
63	Pengabdian Kepada Masyarakat Berbasis Program Studi	Afifah Muharikah	teknik informatika dan komputer	IbM Pelatihan Pembelajaran Bahasa Inggris Untuk Keahlian Mendengar-Berbicara-Membaca- Menulis Memalalui Film Pendek dan Mesin Penerjemah Google  untuk Guru dan Siswa SMP dan SMK Muhamadiyah Beji	\N	\N	2018	Internal	\N	2021-06-02 09:37:26	2021-06-02 09:37:26
64	Pengabdian Kepada Masyarakat Berbasis Program Studi	Agus Supriyadi	akuntansi	Pelatihan Penyusunan Laporan Keuangan dalam Menunjang Proposal Kredit yang Bankable dan Feasible untuk Para Pemula Usaha 	\N	\N	2018	Internal	\N	2021-06-02 09:37:26	2021-06-02 09:37:26
65	Pengabdian Kepada Masyarakat Berbasis Program Studi	Ali Masjono	akuntansi	Iptek bagi Masyarakat: Peningkatan Pemahaman  Masyarakat Kota Depok Terhadap program Pemerintah  “YUK Nabung Saham”.	\N	\N	2018	Internal	\N	2021-06-02 09:37:26	2021-06-02 09:37:26
66	Pengabdian Kepada Masyarakat Berbasis Program Studi	Azhmy Fawzi My	teknik grafika dan penerbitan	Penguatan Media Publikasi di SMK 1 Sukabumi Pembuatan dan Pengelolaan Media Publikasi Sekolah Berbasis Web Kota Sukabumi, Jawa Barat 	\N	\N	2018	Internal	\N	2021-06-02 09:37:26	2021-06-02 09:37:26
67	Pengabdian Kepada Masyarakat Berbasis Program Studi	Darwin	teknik elektro	Pelatihan Pemograman PLC pada SMKN di Cileungsi	\N	\N	2018	Internal	\N	2021-06-02 09:37:26	2021-06-02 09:37:26
68	Pengabdian Kepada Masyarakat Berbasis Program Studi	Defiana Arnaldy	teknik informatika dan komputer	Pengadaan Server Basis Data Warga dan Peningkatan Keterampilan Sistem Informasi Bagi Kader Posyandu dan Poswindu 	\N	\N	2018	Internal	\N	2021-06-02 09:37:26	2021-06-02 09:37:26
69	Pengabdian Kepada Masyarakat Berbasis Program Studi	Dewi Winarni Susyanti	administrasi niaga	Peran Karang Taruna Desa Babakanmadang Dalam Peningkatan Potensi Pariwisata Sentul di Kabupaten Bogor	\N	\N	2018	Internal	\N	2021-06-02 09:37:26	2021-06-02 09:37:26
70	Pengabdian Kepada Masyarakat Berbasis Program Studi	Iis Mariam	administrasi niaga	Implementasi  Management Bisnis  dan Pembuatan Laporan Keuangan Koperasi UMKM  di Desa Cilember Kabupaten Bogor	\N	\N	2018	Internal	\N	2021-06-02 09:37:26	2021-06-02 09:37:26
71	Pengabdian Kepada Masyarakat Berbasis Program Studi	Sylvia Rozza	akuntansi	Pendampingan Pendirian Koperasi Simpan Pinjam dan Pembiayaan Syariah di Pesantren Luhur Sabilussalam - Ciputat Timur - Tanggerang Selatan	\N	\N	2018	Internal	\N	2021-06-02 09:37:26	2021-06-02 09:37:26
72	Pengabdian Kepada Masyarakat Berbasis Program Studi	Isdawimah	teknik elektro	Perbaikan Instalasi Listrik dan Sarana Belajar di Madrasah Ibtidaiyah Miftahul Ulum Desa Leuwikaret Kecamatan Klapanunggal Kabupaten Bogor	\N	\N	2018	Internal	\N	2021-06-02 09:37:26	2021-06-02 09:37:26
73	Pengabdian Kepada Masyarakat Berbasis Program Studi	Agus Setiawan	teknik informatika dan komputer	Pemanfaatan Lahan dan Pelestarian Budaya untuk Membangung Karakter Anak dan Remaja denan Pelatihan Manajemen Lingkungan	\N	\N	2018	Internal	\N	2021-06-02 09:37:26	2021-06-02 09:37:26
74	Pengabdian Kepada Masyarakat Berbasis Program Studi	Indra Z	teknik elektro	PERBAIKAN SARANA PRASARANA BELAJAR MENGAJAR di MADRASAH IBTIDAIYAH MIFTAHUL ULUM  DESA LEUWIKARET, KECAMATAN KLAPANUNGGAL KABUPATEN BOGOR	\N	\N	2018	Internal	\N	2021-06-02 09:37:26	2021-06-02 09:37:26
75	Pengabdian Kepada Masyarakat Berbasis Program Studi	Mochammad Sholeh	teknik mesin	Peningkatan Komptensi Menggambar Teknik Menggunakan Bantuan Software Bagi Siswa SMK di Depok (Program Lanjutan)	\N	\N	2018	Internal	\N	2021-06-02 09:37:26	2021-06-02 09:37:26
76	Pengabdian Kepada Masyarakat Berbasis Program Studi	Sarito	teknik sipil	Perbaikan Atap Toilet Plester Dinding Pasang Keramik dan Pintu Musholah Al-Hidayah, Kampung Pondok Manggis RT 3 RW 4 Desa Bojong Baru Kecamatan Bojong Gede Kabupaten Bogor	\N	\N	2018	Internal	\N	2021-06-02 09:37:26	2021-06-02 09:37:26
77	Pengabdian Kepada Masyarakat Berbasis Program Studi	Sidiq Ruswanto	teknik mesin	Peningkatan Media Pembelajaran dan Evaluasi Nilai dengan Memanfaatkan Aplikasi Komputer Bagi Guru Sekolah Dasar di Beji Depok	\N	\N	2018	Internal	\N	2021-06-02 09:37:26	2021-06-02 09:37:26
78	Pengabdian Kepada Masyarakat Berbasis Program Studi	Syafrizal Syarief	teknik elektro	PELATIHAN SISTEM PENGATURAN SEKUENSIAL  DI SMK NEGERI 1 CILEUNGSI	\N	\N	2018	Internal	\N	2021-06-02 09:37:26	2021-06-02 09:37:26
79	Pengabdian Kepada Masyarakat Berbasis Program Studi	Eka Sasmita Mulya	teknik sipil	PERLUASAN RUANG DAN PERAPIHAN DINDING PENAHAN TANAH MUSHOLLA PONDOK MANGGIS RT 03/ RW 04,  BOJONG BARU   KECAMATAN BOJONG GEDE, BOGOR	\N	\N	2018	Internal	\N	2021-06-02 09:37:26	2021-06-02 09:37:26
80	Pengabdian Kepada Masyarakat Berbasis Program Studi	Emmidia Djonaedi	teknik grafika dan penerbitan	Pengembangan Produksi Marchendising Desa Wisata Adat Kampung Urug Kabupaten Bogor - Jawa Barat	\N	\N	2018	Internal	\N	2021-06-02 09:37:26	2021-06-02 09:37:26
81	Pengabdian Kepada Masyarakat Berbasis Program Studi	Ernita Siambaton	administrasi niaga	Peningkatan Kemampuan Kewirausahaan Masyarakat Desa,  Dengan Pelatihan Pemasaran Digital dan Keuangan Bagi Para Pelaku UMK  Desa Cilember Kabupaten Bogor	\N	\N	2018	Internal	\N	2021-06-02 09:37:26	2021-06-02 09:37:26
82	Pengabdian Kepada Masyarakat Berbasis Program Studi	Fauzri Fahimuddin	teknik sipil	Pembangunan Jembatan Penyebrangan Orang Rt 03 Rw 04 Kampung Pondok Manggis, Kelurahan Bojong Baru, Kecamtan Bojonggede Kabupatem Bogor 	\N	\N	2018	Internal	\N	2021-06-02 09:37:26	2021-06-02 09:37:26
83	Pengabdian Kepada Masyarakat Berbasis Program Studi	Hata Maulana	teknik informatika dan komputer	Pembuatan System Bank Sampah Online pada Kelurahan Serua Kecamatan Bojong Sari Depok	\N	\N	2018	Internal	\N	2021-06-02 09:37:26	2021-06-02 09:37:26
84	Pengabdian Kepada Masyarakat Berbasis Program Studi	Agus Sukandi	teknik mesin	PERBAIKAN SANITASI AIR DAN TEMPAT WUDHU MASJID RIYADUS SOLIHIN DI KAMPUNG KEBON DUREN RT 03/04 KELURAHAN KALIMULYA KECAMATAN CILODONG KOTA DEPOK	\N	\N	2018	Internal	\N	2021-06-02 09:37:26	2021-06-02 09:37:26
85	Pengabdian Kepada Masyarakat Berbasis Program Studi	Anik Tjandra Setiati	teknik elektro	Pelatihan Komputasi Menggunakan Spredsheet untuk Guru PAUD Kecamatan Pancoran Mas Kota Depok	\N	\N	2018	Internal	\N	2021-06-02 09:37:26	2021-06-02 09:37:26
86	Pengabdian Kepada Masyarakat Berbasis Program Studi	Emir Ridwan	teknik mesin	PERBAIKAN ATAP DAN DINDING   MASJID RIYADUS SOLIHIN DI KAMPUNG KEBON DUREN RT 03/04 KELURAHAN KALIMULYA KECAMATAN CILODONG KOTA DEPOK	\N	\N	2018	Internal	\N	2021-06-02 09:37:26	2021-06-02 09:37:26
87	Pengabdian Kepada Masyarakat Berbasis Program Studi	Irpan Saripudin	teknik grafika dan penerbitan	Pembuatan Sign System di Kawasan Wisata Kampung Urug, Bogor - Jawa Barat	\N	\N	2018	Internal	\N	2021-06-02 09:37:26	2021-06-02 09:37:26
88	Pengabdian Kepada Masyarakat Berbasis Program Studi	Iwan Sonjaya	teknik informatika dan komputer	IbM  Pembuatan Media Digital Interaktif Untuk Penyluhan Informasi Kesehatan Pada Posyandu di Keluarahan Kalimulya Kecamatan Cilodong Kota Depok	\N	\N	2018	Internal	\N	2021-06-02 09:37:26	2021-06-02 09:37:26
89	Pengabdian Kepada Masyarakat Berbasis Program Studi	M Jamal Al-Bakri	administrasi niaga	Pendidikan dan Pelatihan Vokasional Bagi Individu Dengan Hambatan Intelektual	\N	\N	2018	Internal	\N	2021-06-02 09:37:26	2021-06-02 09:37:26
90	Pengabdian Kepada Masyarakat Berbasis Program Studi	Minto Rahayu	teknik mesin	PELATIHAN DASAR PREVENTIF MAINTENANCE  1 UNTUK  MASYARAKAT   CIPAYUNG -DEPOK, JAWA BARAT.	\N	\N	2018	Internal	\N	2021-06-02 09:37:26	2021-06-02 09:37:26
91	Pengabdian Kepada Masyarakat Berbasis Program Studi	Mohammad Fathurahman	teknik elektro	Pelatihan Rancang bangunan Jaringan Lokal Menggunakan Mikrotik Sebagai Penunjang Kompetensi Siswa Program Keahlian Teknik Komputer dan Jaringan SMK Negeri 3 Depok	\N	\N	2018	Internal	\N	2021-06-02 09:37:26	2021-06-02 09:37:26
92	Pengabdian Kepada Masyarakat Berbasis Program Studi	Muryeti	teknik grafika dan penerbitan	Pembuatan Produk Kreatif Dengan Teknologi Digital Screen Printing Dalam Rangka Pemberdayaan Masyarakat Desa Urug Bogor	\N	\N	2018	Internal	\N	2021-06-02 09:37:26	2021-06-02 09:37:26
93	Pengabdian Kepada Masyarakat Berbasis Program Studi	Sujarwo	akuntansi	Pelatihan Anggota dan Pengembangan Bisnis Koperasi di Lingkungan Politeknik Negeri jakarta	\N	\N	2018	Internal	\N	2021-06-02 09:37:26	2021-06-02 09:37:26
94	Pengabdian Kepada Masyarakat Berbasis Program Studi	Suripto	teknik sipil	Pengecoran Jalan Warga STA 1 - STA 150 Pondok Manggis RT 3 RW 4 Bojong Baru Kecamatan Bojong Gede Bogor	\N	\N	2018	Internal	\N	2021-06-02 09:37:26	2021-06-02 09:37:26
95	Pengabdian Kepada Masyarakat Berbasis Program Studi	Sarito	teknik sipil	Pembangunan Pondasi Dan Dinding  Pos Ronda Kampung Ceringin Poncol Desa Raga Jaya . Kec. Bojong Gede Kabupaten BOGOR	\N	\N	2018	Internal	\N	2021-06-02 09:37:26	2021-06-02 09:37:26
96	Pengabdian Kepada Masyarakat Berbasis Program Studi	Anis Rosyidah	p3m	Pemberdayaan Masyarakat melalui upaya Peningkatan Penghasilan bidang pengelolaan dan pengolahan sampah organic di Desa Pasir Angin, Kecamatan Megamendung, Kabupaten Bogor	\N	\N	2018	Internal	\N	2021-06-02 09:37:26	2021-06-02 09:37:26
97	Pengabdian Kepada Masyarakat Berbasis Program Studi	Ida Nurhayati	p3m	Pembangunan struktur atap Bangunan Tempat Membatik di Kampung Urug, Kabupaten Bogor	\N	\N	2018	Internal	\N	2021-06-02 09:37:26	2021-06-02 09:37:26
98	Program Kemitraan Masyarakat	Murie Dwiyaniti	teknik elektro	Pemanfaatan Solar sel dan budidaya perikanan sebagai upaya menuju kemandirian financial Sekolah	\N	\N	2019	DIKTI	\N	2021-06-02 10:02:11	2021-06-02 10:02:11
99	Program Kemitraan Masyarakat	Yelvi	teknik sipil	UPAYA PENANGGULANGAN BANJIR DENGAN MENERAPKAN BETON NON PASIR UNTUK SUMUR RESAPAN DI RT. 04/RW. 02 KELURAHAN BEJI TIMUR DEPOK	\N	\N	2019	DIKTI	\N	2021-06-02 10:02:11	2021-06-02 10:02:11
100	Pengabdian Berbasis Jurusan	Anik Tjandra Setiati	teknik elektro	Pemberdayaan Pemuda Putus Sekolah Pulo Geulis Melalui Peningkatan Pengetahuan Pemasangan Instalasi Listrik	\N	\N	2019	Internal	\N	2021-06-02 10:02:11	2021-06-02 10:02:11
101	Pengabdian Berbasis Jurusan	Mohammad Fauzy	teknik grafika dan penerbitan	Pembuatan Buku Infografik Potensi Wisata Kampung Pulo Geulis, Bogor, Sebagai Media Promosi	\N	\N	2019	Internal	\N	2021-06-02 10:02:11	2021-06-02 10:02:11
102	Pengabdian Berbasis Jurusan	Imam Hariadi Sasongko	teknik sipil	PENYEDIAAN SARANA KEBERSIHAN BERUPA TEMPAT PEMBUANGAN SAMPAH KOMUNAL  DI RW 01 PULO GEULIS KOTA BOGO	\N	\N	2019	Internal	\N	2021-06-02 10:02:11	2021-06-02 10:02:11
103	Pengabdian Berbasis Jurusan	Elisabeth Yanshe Metekohy	akuntansi	KELOMPOK USAHA MIKRO PULO GEULIS  BABAKAN PASAR KOTA BOGOR (PEMBERDAYAAN MASYARAKAT MELALUI  PEMBENTUKAN UNIT USAHA SIMPAN PINJAM)	\N	\N	2019	Internal	\N	2021-06-02 10:02:11	2021-06-02 10:02:11
104	Pengabdian Berbasis Jurusan	Mauldy Laya	teknik informatika dan komputer	Pelatihan Keterampilan Komputer bagi Pemuda Putus Sekolah	\N	\N	2019	Internal	\N	2021-06-02 10:02:11	2021-06-02 10:02:11
105	Pengabdian Berbasis Jurusan	Fauzi Mubarak	administrasi niaga	PENINGKATAN KESEJAHTERAAN MASYARAKAT  KAMPUNG MURAL PULO GEULIS  MELALUI KEGIATAN KOPERASI WARGA  UNTUK MENUMBUHKAN ENTREPRENEUR MASYARAKAT  DI KOTA BOGOR	\N	\N	2019	Internal	\N	2021-06-02 10:02:11	2021-06-02 10:02:11
106	Pengabdian Berbasis Jurusan	Muslimin	teknik mesin	ALIH TEKNOLOGI PERAWATAN OTOMOTIF UNTUK MENINGKATKAN LIFE SKILL MEKANIK SEPEDA MOTOR DI KAMPUNG PULO GEULIS, KELURAHAN BABAKAN PASAR, KECAMATAN BOGOR TENGAH, KOTA BOGOR	\N	\N	2019	Internal	\N	2021-06-02 10:02:11	2021-06-02 10:02:11
107	Pengabdian Berbasis Prodi	Widiyatmoko	teknik mesin	PELATIHAN DASAR PREVENTIF MAINTENANCE 1 UNTUK MASYARAKAT, KELURAHAN PETOJO SELATAN, KECAMATAN GAMBIR, JAKARTA PUSAT	\N	\N	2019	Internal	\N	2021-06-02 10:02:11	2021-06-02 10:02:11
108	Pengabdian Berbasis Prodi	Sarito	teknik sipil	Perbaikan  Tempat Wudhu dan Toilet Musholla Alkhoiriyah RT 05/RW 09, Kampung Lio, Kelurahan Bojong Pondok Terong,  Kec.  Cipayung,  Kota Depok	\N	\N	2019	Internal	\N	2021-06-02 10:02:11	2021-06-02 10:02:11
109	Pengabdian Berbasis Prodi	Nurul Intan Pratiwi	teknik grafika dan penerbitan	Penguatan Media Publikasi di Pondok Pesantren Al Ikhwaniyah Pembuatan dan Pengelolaan Media Publikasi Sekolah Berbasis Web  Tangerang, Banten	\N	\N	2019	Internal	\N	2021-06-02 10:02:11	2021-06-02 10:02:11
110	Pengabdian Berbasis Prodi	Agus Sukandi	teknik mesin	INSTALASI LISTRIK DAN KONSTRUKSI ATAP POSYANDU DI KAMPUNG KEBON DUREN RT 03/04  KELURAHAN KALIMULYA  KECAMATAN CILODONG  KOTA DEPOK	\N	\N	2019	Internal	\N	2021-06-02 10:02:11	2021-06-02 10:02:11
111	Pengabdian Berbasis Prodi	Haolia Rahman	teknik mesin	ALIH TEKNOLOGI TROUBLE SHOOTING KOMPUTER UNTUK IKATAN PEMUDA MUHAMMADIYAH BEJI DEPOK	\N	\N	2019	Internal	\N	2021-06-02 10:02:11	2021-06-02 10:02:11
112	Pengabdian Berbasis Prodi	Euis Oktavianti	teknik informatika dan komputer	Aplikasi Monitoring Kesehatan Bayi dan Balita bagi Kader Posyandu	\N	\N	2019	Internal	\N	2021-06-02 10:02:11	2021-06-02 10:02:11
113	Pengabdian Berbasis Prodi	Mawarta Onida Sinaga	administrasi niaga	Peningkatan Pendapatan dan Kesejahteraan Masyarakat melalui peningkatan kompetensi pengelolaan BUMDES Sukamana Kabupaten Bogor	\N	\N	2019	Internal	\N	2021-06-02 10:02:11	2021-06-02 10:02:11
114	Pengabdian Berbasis Prodi	Ahmad Abror	akuntansi	PENYULUHAN “TANGGAP KREDIT” UNTUK MEMOTIVASI KELOMPOK USAHA MIKRO DAN KECIL KP. PULO GEULIS DALAM MENGEMBANGKAN USAHANYA	\N	\N	2019	Internal	\N	2021-06-02 10:02:11	2021-06-02 10:02:11
115	Pengabdian Berbasis Prodi	Emmidia Djonaedi	teknik grafika dan penerbitan	PENGEMBANGAN DESA WISATA DENGAN PENGEMBANGAN MECHANDISING DI KAMPUNG PULO GEULIS	\N	\N	2019	Internal	\N	2021-06-02 10:02:11	2021-06-02 10:02:11
116	Pengabdian Berbasis Prodi	Handi Sudardja	teknik sipil	Pembangunan Jembatan Penyeberangan Orang Kampung Lio, RT. 05 / RW. 09, Kelurahan Bojong Pondok Terong, Kecamatan Cipayung, Depok.	\N	\N	2019	Internal	\N	2021-06-02 10:02:11	2021-06-02 10:02:11
117	Pengabdian Berbasis Prodi	Susilawati	teknik grafika dan penerbitan	Pembuatan Desain Kemasan yang Mampu Bersaing di Era Pemasaran Digital pada Produk UKM di Komunitas Sahabat UMKM	\N	\N	2019	Internal	\N	2021-06-02 10:02:11	2021-06-02 10:02:11
118	Pengabdian Berbasis Prodi	Dewi Kurniawati	teknik informatika dan komputer	PELATIHAN TEKNIK COPY WRITING  DALAM BAHASA INGGRIS MENGGUNAKAN APPLIKASI CANVA  UNTUK PENGUSAHA MICRO YANG TERGABUNG DALAM WOOBIZ	\N	\N	2019	Internal	\N	2021-06-02 10:02:11	2021-06-02 10:02:11
119	Pengabdian Berbasis Prodi	Ayres Pradiptyas	teknik informatika dan komputer	Pembuatan E-Marketing Tools Untuk Meningkatkan Pemasaran Produk bagi Pelaku Usaha Mikro	\N	\N	2019	Internal	\N	2021-06-02 10:02:11	2021-06-02 10:02:11
120	Pengabdian Berbasis Prodi	Fitria Nugrahani	teknik informatika dan komputer	Pembuatan Media Visual untuk Iklan Pemasaran Produk UMKM Komunitas Istri Driver Go-jek	\N	\N	2019	Internal	\N	2021-06-02 10:02:11	2021-06-02 10:02:11
121	Pengabdian Berbasis Prodi	Iis Mariam	administrasi niaga	Social Media Marketing  Dan Pembuatan Laporan Keuangan Koperasi Kampung Bunga Kayu Cilember Mekar Di Desa Cilember Kabupaten Bogor	\N	\N	2019	Internal	\N	2021-06-02 10:02:11	2021-06-02 10:02:11
122	Pengabdian Berbasis Prodi	Dewi Winarni Susyanti	administrasi niaga	PERAN KELOMPOK IBU PENGGERAK PKK  DESA BABAKAN MADANG  DALAM PENINGKATAN POTENSI PARIWISATA SENTUL  DI KABUPATEN BOGOR	\N	\N	2019	Internal	\N	2021-06-02 10:02:11	2021-06-02 10:02:11
123	Pengabdian Berbasis Prodi	Riandini	teknik elektro	Pendampingan Peningkatan Ketrampilan TIK Sebagai Bekal Wirausaha Di Pondok Pesantren Riyadhul Huda Desa Ciangsana Kecamatan Gunung Putri Kabupaten Bogor	\N	\N	2019	Internal	\N	2021-06-02 10:02:11	2021-06-02 10:02:11
124	Pengabdian Berbasis Prodi	Sidiq Ruswanto	teknik mesin	PENINGKATAN EKONOMI MANDIRI MELALUI ALIH TEKNOLOGI HIDROPONIK UNTUK PKK RT 02 RW 17 BEJI DEPOK	\N	\N	2019	Internal	\N	2021-06-02 10:02:11	2021-06-02 10:02:11
125	Pengabdian Berbasis Prodi	Entis Sutisna	teknik elektro	Pelatihan Pemeliharaan Instalasi Listrik Dasar dan Perbaikan sarana dan prasarana Belajar Mengajar di Madrasah Ibtidaiyah Miftahul Ulum, Desa Leuwi karet, Kecamatan Klapa Nunggal Kabupaten Bogor	\N	\N	2019	Internal	\N	2021-06-02 10:02:11	2021-06-02 10:02:11
126	Pengabdian Berbasis Prodi	Minto Rahayu	teknik mesin	PELATIHAN PENGGUNAN TOOL DAN HIBAH TOOL UNTUK PREVENTIF MAINTENANCE PADA  MASYARAKAT   KECAMATAN SAWANGAN, DEPOK	\N	\N	2019	Internal	\N	2021-06-02 10:02:11	2021-06-02 10:02:11
127	Pengabdian Berbasis Prodi	Iftita Rahmi	administrasi niaga	Seminar ‘Promoting Empathy in Inclusive Society’ Sebuah Pendekatan untuk Menciptakan Lingkungan Masyarakat yang Ramah terhadap Individu Berkebutuhan Khusus	\N	\N	2019	Internal	\N	2021-06-02 10:02:11	2021-06-02 10:02:11
128	Pengabdian Berbasis Prodi	Murie Dwiyaniti	teknik elektro	PENERAPAN SOLAR SEL SEBAGAI SUMBER LISTRIK PENERANGAN RUANG KELAS DI MADRASAH IBTIDAIYAH MIFTAHUL ULUM DESA LEUWIKARET KECAMATAN KLAPANUNGGAL KABUPATEN BOGOR	\N	\N	2019	Internal	\N	2021-06-02 10:02:11	2021-06-02 10:02:11
129	Pengabdian Berbasis Prodi	Muryeti	teknik grafika dan penerbitan	PENGEMBANGAN KEMASAN PRODUK UMKM GIPANG KHAS SERANG	\N	\N	2019	Internal	\N	2021-06-02 10:02:11	2021-06-02 10:02:11
130	Pengabdian Berbasis Prodi	Sri Lestari K	teknik elektro	Peningkatan Ketrampilan Remaja Putus Sekolah dalam upaya Mengembangkan Usaha Souvenir Gelas Bersablon di Kampung Pulo Geulis Bogor	\N	\N	2019	Internal	\N	2021-06-02 10:02:11	2021-06-02 10:02:11
131	Pengabdian Berbasis Prodi	Mochammad Sholeh	teknik mesin	PELATIHAN PEMBUATAN GANTUNGAN KUNCI BERBAHAN RESIN DALAM UPAYA PENINGKATAN KEMANDIRIAN EKONOMI UNTUK KARANG TARUNA DESA SUKAKARYA, KEC. MEGAMENDUNG,  KAB. BOGOR	\N	\N	2019	Internal	\N	2021-06-02 10:02:11	2021-06-02 10:02:11
132	Pengabdian Berbasis Prodi	Hayati Fatimah	akuntansi	Peningkatan Ekonomi Masyarakat melalui Budidaya Aquaponik di Desa Cijayanti Babakan Madang Sentul Bogor	\N	\N	2019	Internal	\N	2021-06-02 10:02:11	2021-06-02 10:02:11
133	Pengabdian Berbasis Prodi	Ina Sukaesih	akuntansi	Pemberdayaan Masyarakat Melalui Pelatihan Penulisan Surat Bisnis Bahasa Inggris Untuk Remaja FKPPI Cijantung	\N	\N	2019	Internal	\N	2021-06-02 10:02:11	2021-06-02 10:02:11
134	Pengabdian Berbasis Prodi	Agus Wagyana	teknik elektro	Pemberdayaan UMKM Desa Citeureup Kabupaten Bogor Jawa Barat dalam Rangka Mewujudkan Kemandirian Ekonomi Desa	\N	\N	2019	Internal	\N	2021-06-02 10:02:11	2021-06-02 10:02:11
135	Pengabdian Berbasis Prodi	Bambang Waluyo	akuntansi	Pendampingan Pendirian Koperasi Simpan Pinjam dan Pembiayaan Syariah  Di Pesantren Luhur Sabilussalam Ciputat Tangerang Selatan	\N	\N	2019	Internal	\N	2021-06-02 10:02:11	2021-06-02 10:02:11
136	Pengabdian Berbasis Prodi	Titi Suharti	akuntansi	PELATIHAN PEMBUKUAN DAN LAPORAN KEUANGAN UNTUK USAHA MIKRO DAN KECIL DI WILAYAH KAMPUNG PULO GEULIS  BOGOR	\N	\N	2019	Internal	\N	2021-06-02 10:02:11	2021-06-02 10:02:11
137	Pengabdian Berbasis Prodi	Sabar Warsini	akuntansi	Pemberdayaan Masyarakat Melalui Sosialisasi Pasar Modal Syariah pada Pengurus Masjid Kota Depok	\N	\N	2019	Internal	\N	2021-06-02 10:02:11	2021-06-02 10:02:11
138	Pengabdian Berbasis Prodi	Budi Damianto	teknik sipil	Pengecoran Jalan Rt 05/Rw 09, Kp. Lio, Kelurahan Bojong Pondok Terong, Kecamatan Cipayung Jaya, Depok	\N	\N	2019	Internal	\N	2021-06-02 10:02:11	2021-06-02 10:02:11
139	Pengabdian Berbasis Prodi	Andikanoza Pradiptya	teknik sipil	Perbaikan Atap Musholla Rt.05/Rw.09, Kp.Lio, Kelurahan Bojong Pondok Terong, Kecamatan Cipayung Jaya, Depok	\N	\N	2019	Internal	\N	2021-06-02 10:02:11	2021-06-02 10:02:11
140	Pengabdian Berbasis Prodi	Heri Abrianto	akuntansi	Peningkatan Gizi dan Pendapatan Keluarga (dengan pelatihan pembuatan susu kedelai, sari kacang hijau dan brownies) Di RW 02 Keluarahan Kalimulya, Kecamatan Cilodong Depok	\N	\N	2019	Internal	\N	2021-06-02 10:02:11	2021-06-02 10:02:11
141	Pengabdian Berbasis Prodi	B. S. Rahayu Purwanti	teknik elektro	Penanganan Limbah Cair Disirkulasi agara Layak Buang dengan Memberdayakan Remaja BTP Citeureup	\N	\N	2019	Internal	\N	2021-06-02 10:02:11	2021-06-02 10:02:11
142	Pengabdian Berbasis Prodi	Ahmad Tossin Alamsyah	teknik elektro	Revitalisasi Sarana Penerangan dan Fasilitas Sendang/Mata Air Milik Masyarakat di Desa Citeureup Kabupaten Bogor	\N	\N	2019	Internal	\N	2021-06-02 10:02:11	2021-06-02 10:02:11
\.


--
-- TOC entry 3110 (class 0 OID 47185)
-- Dependencies: 208
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 3114 (class 0 OID 47212)
-- Dependencies: 212
-- Data for Name: prodi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prodi (id, nama_prodi, jenjang, id_jurusan, created_at, updated_at) FROM stdin;
1	Adminsitrasi Bisnis	D3	1	2021-06-02 09:30:48	\N
2	MICE	D4	1	2021-06-02 09:30:48	\N
3	Manajemen Pemasaran (WNBK)	D3	1	2021-06-02 09:30:48	\N
4	BISPRO	D4	1	2021-06-02 09:30:48	\N
5	Adminstrasi Bisnis Terapan	D4	1	2021-06-02 09:30:48	\N
6	Akuntansi	D3	2	2021-06-02 09:30:48	\N
7	Keuangan dan Perbankan	D3	2	2021-06-02 09:30:48	\N
8	Akuntansi Keuangan	D4	2	2021-06-02 09:30:48	\N
9	Keuangan dan Perbankan Syariah	D4	2	2021-06-02 09:30:48	\N
10	Keuangan dan Perbankan	D4	2	2021-06-02 09:30:48	\N
11	Manajemen Keuangan	D4	2	2021-06-02 09:30:48	\N
12	Teknik Elektronika Industri	D3	3	2021-06-02 09:30:48	\N
13	Teknik Listrik	D3	3	2021-06-02 09:30:48	\N
14	Telekomunikasi	D3	3	2021-06-02 09:30:48	\N
15	Instrumentasi dan Kontrol Industri	D4	3	2021-06-02 09:30:48	\N
16	Broadband Multimedia	D4	3	2021-06-02 09:30:48	\N
17	Teknik Otomatisasi Listrik Industri	D4	3	2021-06-02 09:30:48	\N
18	Magister Teknik Elektro	S2	3	2021-06-02 09:30:48	\N
19	Teknik Grafika	D3	4	2021-06-02 09:30:48	\N
20	Penerbitan / Jurnalistik	D3	4	2021-06-02 09:30:48	\N
21	Teknologi Industri Cetak Kemasan	D4	4	2021-06-02 09:30:48	\N
22	Desain Grafis	D4	4	2021-06-02 09:30:48	\N
23	Teknik Informatika	D4	5	2021-06-02 09:30:48	\N
24	Teknik Multimedia dan Jaringan	D4	5	2021-06-02 09:30:48	\N
25	Teknik Multimedia Digital	D4	5	2021-06-02 09:30:48	\N
26	Teknik Komputer dan Jaringan	D1	5	2021-06-02 09:30:48	\N
27	Penerjemahan Bahasa Inggris	D1	5	2021-06-02 09:30:48	\N
28	Teknik Mesin	D3	6	2021-06-02 09:30:48	\N
29	Teknik Konversi Energi	D3	6	2021-06-02 09:30:48	\N
30	Alat Berat	D3	6	2021-06-02 09:30:48	\N
31	Teknik Manufaktur	D4	6	2021-06-02 09:30:48	\N
32	Pembangkit Tenaga Listrik	D4	6	2021-06-02 09:30:48	\N
33	Magister Rekayasa Teknologi Manufaktur	S2	6	2021-06-02 09:30:48	\N
34	Konstruksi Gedung	D3	7	2021-06-02 09:30:48	\N
35	Konstruksi Sipil	D3	7	2021-06-02 09:30:48	\N
36	Perancangan Jalan dan Jembatan	D4	7	2021-06-02 09:30:48	\N
37	PJJ Konsentrasi Jalan Tol	D4	7	2021-06-02 09:30:48	\N
38	Teknik Konstruksi Gedung	D4	7	2021-06-02 09:30:48	\N
\.


--
-- TOC entry 3117 (class 0 OID 47243)
-- Dependencies: 215
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sessions (id, user_id, ip_address, user_agent, payload, last_activity) FROM stdin;
ECn65GyA9YMlNJeEtBtot8LyIKSdAjiNJmasuuZh	1	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0	YTo3OntzOjY6Il90b2tlbiI7czo0MDoibEhmZ2ZEOVdraDZzQUc5NDZzd0EwMktpSTNVRDByZ2xwNUgxV3JnSSI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjMyOiJodHRwOi8vbG9jYWxob3N0OjgwMDAvcGVuZ2FiZGlhbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCREMXRobFlHUU9kbURqcnJjTVBEejNlLzJMay5Qa0VxWFh3amVSMmhTdXRVUi5Ydk1icDZXYSI7czoyMToicGFzc3dvcmRfaGFzaF9zYW5jdHVtIjtzOjYwOiIkMnkkMTAkRDF0aGxZR1FPZG1EanJyY01QRHozZS8yTGsuUGtFcVhYd2plUjJoU3V0VVIuWHZNYnA2V2EiO30=	1622628158
\.


--
-- TOC entry 3105 (class 0 OID 47151)
-- Dependencies: 203
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, nidn, nama, email, email_verified_at, password, "isAdmin", remember_token, current_team_id, profile_photo_path, created_at, updated_at, two_factor_secret, two_factor_recovery_codes) FROM stdin;
1	1234567890          	Admin	admin@mail.com	\N	$2y$10$D1thlYGQOdmDjrrcMPDz3e/2Lk.PkEqXXwjeR2hSutUR.XvMbp6Wa	1	\N	\N	\N	2021-06-02 09:30:48	2021-06-02 09:30:48	\N	\N
\.


--
-- TOC entry 3136 (class 0 OID 0)
-- Dependencies: 209
-- Name: author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.author_id_seq', 255, true);


--
-- TOC entry 3137 (class 0 OID 0)
-- Dependencies: 205
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- TOC entry 3138 (class 0 OID 0)
-- Dependencies: 213
-- Name: jurusan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jurusan_id_seq', 8, true);


--
-- TOC entry 3139 (class 0 OID 0)
-- Dependencies: 200
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 11, true);


--
-- TOC entry 3140 (class 0 OID 0)
-- Dependencies: 216
-- Name: penelitian_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.penelitian_id_seq', 418, true);


--
-- TOC entry 3141 (class 0 OID 0)
-- Dependencies: 218
-- Name: pengabdian_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pengabdian_id_seq', 142, true);


--
-- TOC entry 3142 (class 0 OID 0)
-- Dependencies: 207
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 1, false);


--
-- TOC entry 3143 (class 0 OID 0)
-- Dependencies: 211
-- Name: prodi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.prodi_id_seq', 38, true);


--
-- TOC entry 3144 (class 0 OID 0)
-- Dependencies: 202
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- TOC entry 2948 (class 2606 OID 47209)
-- Name: author author_nama_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.author
    ADD CONSTRAINT author_nama_unique UNIQUE (nama);


--
-- TOC entry 2950 (class 2606 OID 47207)
-- Name: author author_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.author
    ADD CONSTRAINT author_pkey PRIMARY KEY (id);


--
-- TOC entry 2939 (class 2606 OID 47180)
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- TOC entry 2941 (class 2606 OID 47182)
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- TOC entry 2954 (class 2606 OID 47232)
-- Name: jurusan jurusan_nama_jurusan_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jurusan
    ADD CONSTRAINT jurusan_nama_jurusan_unique UNIQUE (nama_jurusan);


--
-- TOC entry 2956 (class 2606 OID 47230)
-- Name: jurusan jurusan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jurusan
    ADD CONSTRAINT jurusan_pkey PRIMARY KEY (id);


--
-- TOC entry 2930 (class 2606 OID 47148)
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 2962 (class 2606 OID 47264)
-- Name: penelitian penelitian_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.penelitian
    ADD CONSTRAINT penelitian_pkey PRIMARY KEY (id);


--
-- TOC entry 2964 (class 2606 OID 47286)
-- Name: pengabdian pengabdian_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pengabdian
    ADD CONSTRAINT pengabdian_pkey PRIMARY KEY (id);


--
-- TOC entry 2943 (class 2606 OID 47193)
-- Name: personal_access_tokens personal_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 2945 (class 2606 OID 47196)
-- Name: personal_access_tokens personal_access_tokens_token_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);


--
-- TOC entry 2952 (class 2606 OID 47217)
-- Name: prodi prodi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prodi
    ADD CONSTRAINT prodi_pkey PRIMARY KEY (id);


--
-- TOC entry 2959 (class 2606 OID 47250)
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- TOC entry 2932 (class 2606 OID 47164)
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- TOC entry 2934 (class 2606 OID 47162)
-- Name: users users_nidn_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_nidn_unique UNIQUE (nidn);


--
-- TOC entry 2936 (class 2606 OID 47160)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2937 (class 1259 OID 47168)
-- Name: password_resets_email_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX password_resets_email_index ON public.password_resets USING btree (email);


--
-- TOC entry 2946 (class 1259 OID 47194)
-- Name: personal_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);


--
-- TOC entry 2957 (class 1259 OID 47252)
-- Name: sessions_last_activity_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sessions_last_activity_index ON public.sessions USING btree (last_activity);


--
-- TOC entry 2960 (class 1259 OID 47251)
-- Name: sessions_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sessions_user_id_index ON public.sessions USING btree (user_id);


--
-- TOC entry 2965 (class 2606 OID 47218)
-- Name: author author_id_prodi_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.author
    ADD CONSTRAINT author_id_prodi_foreign FOREIGN KEY (id_prodi) REFERENCES public.prodi(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2966 (class 2606 OID 47233)
-- Name: author author_jurusan_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.author
    ADD CONSTRAINT author_jurusan_foreign FOREIGN KEY (jurusan) REFERENCES public.jurusan(nama_jurusan) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2968 (class 2606 OID 47265)
-- Name: penelitian penelitian_jurusan_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.penelitian
    ADD CONSTRAINT penelitian_jurusan_foreign FOREIGN KEY (jurusan) REFERENCES public.jurusan(nama_jurusan) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2969 (class 2606 OID 47270)
-- Name: penelitian penelitian_nama_ketua_penelitian_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.penelitian
    ADD CONSTRAINT penelitian_nama_ketua_penelitian_foreign FOREIGN KEY (nama_ketua_penelitian) REFERENCES public.author(nama) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2970 (class 2606 OID 47287)
-- Name: pengabdian pengabdian_jurusan_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pengabdian
    ADD CONSTRAINT pengabdian_jurusan_foreign FOREIGN KEY (jurusan) REFERENCES public.jurusan(nama_jurusan) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2971 (class 2606 OID 47292)
-- Name: pengabdian pengabdian_nama_ketua_pengabdian_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pengabdian
    ADD CONSTRAINT pengabdian_nama_ketua_pengabdian_foreign FOREIGN KEY (nama_ketua_pengabdian) REFERENCES public.author(nama) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2967 (class 2606 OID 47238)
-- Name: prodi prodi_id_jurusan_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prodi
    ADD CONSTRAINT prodi_id_jurusan_foreign FOREIGN KEY (id_jurusan) REFERENCES public.jurusan(id) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2021-06-02 19:14:58

--
-- PostgreSQL database dump complete
--

