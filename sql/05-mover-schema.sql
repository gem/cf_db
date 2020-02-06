--
-- PostgreSQL database dump
--

-- Dumped from database version 11.6 (Debian 11.6-1.pgdg100+1)
-- Dumped by pg_dump version 11.6 (Debian 11.6-1.pgdg100+1)

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
-- Name: mover; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA mover;


--
-- Name: an_analysis_type_enum; Type: TYPE; Schema: mover; Owner: -
--

CREATE TYPE mover.an_analysis_type_enum AS ENUM (
    'Advanced',
    'Simplified',
    'N/a'
);


--
-- Name: damage_states_all_enum; Type: TYPE; Schema: mover; Owner: -
--

CREATE TYPE mover.damage_states_all_enum AS ENUM (
    'No damage',
    'Light damage',
    'Moderate damage',
    'Heavy damage',
    'Collapse',
    'Minor damage',
    'Major damage',
    'Complete damage',
    'Collapsed',
    'Washed away',
    'None',
    'Light',
    'Negligible to Slight',
    'Moderate',
    'Substantial to Heavy',
    'Very Heavy',
    'Destruction',
    'None to Slight',
    'Extensive',
    'Complete',
    'Slight',
    'Partial collapse',
    'Heavy',
    'Severe',
    'Operational',
    'Immediate Occupancy',
    'Life safety',
    'Collapse prevention',
    'Fully Operational',
    'Near Collapse',
    'Production loss',
    'Not applicable'
);


--
-- Name: dm_scale_ty_enum; Type: TYPE; Schema: mover; Owner: -
--

CREATE TYPE mover.dm_scale_ty_enum AS ENUM (
    'Existing',
    'Bespoke',
    'Unknown'
);


--
-- Name: em_analysis_type_enum; Type: TYPE; Schema: mover; Owner: -
--

CREATE TYPE mover.em_analysis_type_enum AS ENUM (
    'Least squares',
    'GLM',
    'GAM',
    'N/a'
);


--
-- Name: f_math_enum; Type: TYPE; Schema: mover; Owner: -
--

CREATE TYPE mover.f_math_enum AS ENUM (
    'Parametric',
    'Bespoke',
    'N/a'
);


--
-- Name: f_mathtype_enum; Type: TYPE; Schema: mover; Owner: -
--

CREATE TYPE mover.f_mathtype_enum AS ENUM (
    'Cumulative Lognormal',
    'Cumulative Normal',
    'Exponential',
    'Bespoke',
    'DtL - Beta PDF',
    'DtL - Normal PDF',
    'DtL - Lognormal PDF',
    'DtL - Uniform PDF',
    'DtL - Bespoke PDF',
    'N/a'
);


--
-- Name: f_relationship_enum; Type: TYPE; Schema: mover; Owner: -
--

CREATE TYPE mover.f_relationship_enum AS ENUM (
    'Mathematical',
    'Discrete'
);


--
-- Name: f_subtype_enum; Type: TYPE; Schema: mover; Owner: -
--

CREATE TYPE mover.f_subtype_enum AS ENUM (
    'Empirical',
    'Analytical',
    'Judgement',
    'Hybrid - Analytical/Empirical',
    'Hybrid - Analytical/Judgement',
    'Hybrid - Empirical/Judgement',
    'Hybrid - Analytical HF/LF',
    'Code - based'
);


--
-- Name: fit_ref_enum; Type: TYPE; Schema: mover; Owner: -
--

CREATE TYPE mover.fit_ref_enum AS ENUM (
    'AIC',
    'BIC',
    'Kolmogorov-Smirnov'
);


--
-- Name: function_type_enum; Type: TYPE; Schema: mover; Owner: -
--

CREATE TYPE mover.function_type_enum AS ENUM (
    'Fragility',
    'Vulnerability',
    'Damage-to-Loss'
);


--
-- Name: geographic_relevance_score_enum; Type: TYPE; Schema: mover; Owner: -
--

CREATE TYPE mover.geographic_relevance_score_enum AS ENUM (
    'Excellent',
    'Good',
    'Needs improvement',
    'Unusable'
);


--
-- Name: im_method_enum; Type: TYPE; Schema: mover; Owner: -
--

CREATE TYPE mover.im_method_enum AS ENUM (
    'Recorded',
    'Surveyed',
    'Simulated',
    'Unknown'
);


--
-- Name: jd_analysis_type_enum; Type: TYPE; Schema: mover; Owner: -
--

CREATE TYPE mover.jd_analysis_type_enum AS ENUM (
    'Delphi',
    'Cookes',
    'N/a'
);


--
-- Name: nonsampling_err_enum; Type: TYPE; Schema: mover; Owner: -
--

CREATE TYPE mover.nonsampling_err_enum AS ENUM (
    'Yes',
    'No',
    'Unknown'
);


--
-- Name: sample_enum; Type: TYPE; Schema: mover; Owner: -
--

CREATE TYPE mover.sample_enum AS ENUM (
    'Single-asset class',
    'Multi-assets classes',
    'Single-asset'
);


--
-- Name: scale_app_enum; Type: TYPE; Schema: mover; Owner: -
--

CREATE TYPE mover.scale_app_enum AS ENUM (
    'Country (Level 0)',
    'Sub-country (Level 1)',
    'Local (Level 2)',
    'Asset (Level 3)'
);


--
-- Name: sim_method_enum; Type: TYPE; Schema: mover; Owner: -
--

CREATE TYPE mover.sim_method_enum AS ENUM (
    'Physics-based',
    'IMPE'
);


--
-- Name: type_nonsampling_err_enum; Type: TYPE; Schema: mover; Owner: -
--

CREATE TYPE mover.type_nonsampling_err_enum AS ENUM (
    'Under coverage',
    'Incomplete data',
    'Measurement error',
    'Unknown'
);


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: damage_scale; Type: TABLE; Schema: mover; Owner: -
--

CREATE TABLE mover.damage_scale (
    dm_scale_reference character varying,
    asset_notes character varying,
    n_dm_states character(1) NOT NULL,
    dm_states_id character varying NOT NULL,
    dm_states_name character varying NOT NULL,
    is_edp_thre boolean NOT NULL,
    is_dm_factor boolean NOT NULL,
    is_casualties boolean NOT NULL,
    is_downtime boolean NOT NULL,
    id integer NOT NULL,
    damage_scale_name character varying,
    damage_scale_code character varying,
    damage_scale_type mover.dm_scale_ty_enum,
    occupancy cf_common.occupancy_enum,
    taxonomy_source character varying,
    taxonomy character varying,
    asset_type character varying,
    hazard_type character varying,
    process_type character varying
);


--
-- Name: damage_scale_id_seq; Type: SEQUENCE; Schema: mover; Owner: -
--

CREATE SEQUENCE mover.damage_scale_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: damage_scale_id_seq; Type: SEQUENCE OWNED BY; Schema: mover; Owner: -
--

ALTER SEQUENCE mover.damage_scale_id_seq OWNED BY mover.damage_scale.id;


--
-- Name: edp_table; Type: TABLE; Schema: mover; Owner: -
--

CREATE TABLE mover.edp_table (
    description character varying NOT NULL,
    units character varying,
    edp_name character varying,
    edp_code character varying NOT NULL
);


--
-- Name: f_additional; Type: TABLE; Schema: mover; Owner: -
--

CREATE TABLE mover.f_additional (
    f_additional_id integer NOT NULL,
    nonsampling_err mover.nonsampling_err_enum NOT NULL,
    type_nonsampling_err mover.type_nonsampling_err_enum,
    is_fix_nonsamp_err boolean,
    is_data_aggregated boolean,
    n_data_points_aggr integer,
    is_data_disaggr boolean,
    n_data_points_disaggr integer,
    an_analysis_type mover.an_analysis_type_enum,
    em_analysis_type mover.em_analysis_type_enum,
    jd_analysis_type mover.jd_analysis_type_enum,
    is_fit_good boolean,
    fit_ref mover.fit_ref_enum,
    val_data_source character varying,
    val_study_reference character varying,
    sample mover.sample_enum
);


--
-- Name: f_additional_f_additional_id_seq; Type: SEQUENCE; Schema: mover; Owner: -
--

CREATE SEQUENCE mover.f_additional_f_additional_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: f_additional_f_additional_id_seq; Type: SEQUENCE OWNED BY; Schema: mover; Owner: -
--

ALTER SEQUENCE mover.f_additional_f_additional_id_seq OWNED BY mover.f_additional.f_additional_id;


--
-- Name: f_core; Type: TABLE; Schema: mover; Owner: -
--

CREATE TABLE mover.f_core (
    id integer NOT NULL,
    hazard_type_primary character varying NOT NULL,
    hazard_type_secondary character varying,
    process_type_primary character varying NOT NULL,
    process_type_secondary character varying,
    occupancy cf_common.occupancy_enum NOT NULL,
    taxonomy_source character varying,
    taxonomy character varying,
    asset_type character varying NOT NULL,
    asset_notes character varying,
    country_iso character varying NOT NULL,
    applicability_notes character varying,
    scale_applicability mover.scale_app_enum NOT NULL,
    function_type mover.function_type_enum NOT NULL,
    approach mover.f_subtype_enum NOT NULL,
    f_relationship mover.f_relationship_enum NOT NULL,
    f_math mover.f_math_enum,
    f_math_model mover.f_mathtype_enum,
    bespoke_model_ref character varying,
    f_reference character varying NOT NULL,
    licence_code character varying NOT NULL,
    licence_reference character varying,
    created_at timestamp with time zone DEFAULT now()
);


--
-- Name: f_core_id_seq; Type: SEQUENCE; Schema: mover; Owner: -
--

CREATE SEQUENCE mover.f_core_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: f_core_id_seq; Type: SEQUENCE OWNED BY; Schema: mover; Owner: -
--

ALTER SEQUENCE mover.f_core_id_seq OWNED BY mover.f_core.id;


--
-- Name: f_scoring; Type: TABLE; Schema: mover; Owner: -
--

CREATE TABLE mover.f_scoring (
    id integer NOT NULL,
    geo_applicability character varying,
    f_core_id integer NOT NULL,
    geographic_relevance_score mover.geographic_relevance_score_enum
);


--
-- Name: f_scoring_f_core_id_seq; Type: SEQUENCE; Schema: mover; Owner: -
--

CREATE SEQUENCE mover.f_scoring_f_core_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: f_scoring_f_core_id_seq; Type: SEQUENCE OWNED BY; Schema: mover; Owner: -
--

ALTER SEQUENCE mover.f_scoring_f_core_id_seq OWNED BY mover.f_scoring.f_core_id;


--
-- Name: f_scoring_id_seq; Type: SEQUENCE; Schema: mover; Owner: -
--

CREATE SEQUENCE mover.f_scoring_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: f_scoring_id_seq; Type: SEQUENCE OWNED BY; Schema: mover; Owner: -
--

ALTER SEQUENCE mover.f_scoring_id_seq OWNED BY mover.f_scoring.id;


--
-- Name: f_specifics; Type: TABLE; Schema: mover; Owner: -
--

CREATE TABLE mover.f_specifics (
    f_specifics_id integer NOT NULL,
    par_names character varying,
    ub_par_value character varying,
    ub_par_perc character varying,
    med_par_value character varying,
    lb_par_value character varying,
    lb_par_perc character varying,
    damage_scale_code character varying,
    dm_state_name mover.damage_states_all_enum,
    n_dm_states character(1),
    f_disc_im character varying,
    f_disc_ep character varying,
    lp_code character varying,
    lp_loss_value character varying,
    edp_code character varying,
    edp_name character varying,
    edp_dmstate_thre character varying,
    im_code character varying,
    im_name character varying,
    im_range character varying,
    im_units character varying,
    im_method mover.im_method_enum,
    im_sim_type mover.sim_method_enum,
    impe_reference character varying,
    data_countries character varying,
    im_data_source character varying,
    n_events integer,
    n_assets integer
);


--
-- Name: f_specifics_f_specifics_id_seq; Type: SEQUENCE; Schema: mover; Owner: -
--

CREATE SEQUENCE mover.f_specifics_f_specifics_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: f_specifics_f_specifics_id_seq; Type: SEQUENCE OWNED BY; Schema: mover; Owner: -
--

ALTER SEQUENCE mover.f_specifics_f_specifics_id_seq OWNED BY mover.f_specifics.f_specifics_id;


--
-- Name: lp_table; Type: TABLE; Schema: mover; Owner: -
--

CREATE TABLE mover.lp_table (
    description character varying NOT NULL,
    units character varying,
    lp_name character varying,
    lp_code character varying NOT NULL
);


--
-- Name: reference_table; Type: TABLE; Schema: mover; Owner: -
--

CREATE TABLE mover.reference_table (
    author_year character varying NOT NULL,
    title character varying NOT NULL,
    issn character varying,
    doi character varying
);


--
-- Name: damage_scale id; Type: DEFAULT; Schema: mover; Owner: -
--

ALTER TABLE ONLY mover.damage_scale ALTER COLUMN id SET DEFAULT nextval('mover.damage_scale_id_seq'::regclass);


--
-- Name: f_additional f_additional_id; Type: DEFAULT; Schema: mover; Owner: -
--

ALTER TABLE ONLY mover.f_additional ALTER COLUMN f_additional_id SET DEFAULT nextval('mover.f_additional_f_additional_id_seq'::regclass);


--
-- Name: f_core id; Type: DEFAULT; Schema: mover; Owner: -
--

ALTER TABLE ONLY mover.f_core ALTER COLUMN id SET DEFAULT nextval('mover.f_core_id_seq'::regclass);


--
-- Name: f_scoring id; Type: DEFAULT; Schema: mover; Owner: -
--

ALTER TABLE ONLY mover.f_scoring ALTER COLUMN id SET DEFAULT nextval('mover.f_scoring_id_seq'::regclass);


--
-- Name: f_scoring f_core_id; Type: DEFAULT; Schema: mover; Owner: -
--

ALTER TABLE ONLY mover.f_scoring ALTER COLUMN f_core_id SET DEFAULT nextval('mover.f_scoring_f_core_id_seq'::regclass);


--
-- Name: f_specifics f_specifics_id; Type: DEFAULT; Schema: mover; Owner: -
--

ALTER TABLE ONLY mover.f_specifics ALTER COLUMN f_specifics_id SET DEFAULT nextval('mover.f_specifics_f_specifics_id_seq'::regclass);


--
-- Name: reference_table author_year_pk; Type: CONSTRAINT; Schema: mover; Owner: -
--

ALTER TABLE ONLY mover.reference_table
    ADD CONSTRAINT author_year_pk PRIMARY KEY (author_year);


--
-- Name: damage_scale damage_scale_damage_scale_code_key; Type: CONSTRAINT; Schema: mover; Owner: -
--

ALTER TABLE ONLY mover.damage_scale
    ADD CONSTRAINT damage_scale_damage_scale_code_key UNIQUE (damage_scale_code);


--
-- Name: damage_scale damage_scale_pkey; Type: CONSTRAINT; Schema: mover; Owner: -
--

ALTER TABLE ONLY mover.damage_scale
    ADD CONSTRAINT damage_scale_pkey PRIMARY KEY (id);


--
-- Name: edp_table edp_table_edp_name_key; Type: CONSTRAINT; Schema: mover; Owner: -
--

ALTER TABLE ONLY mover.edp_table
    ADD CONSTRAINT edp_table_edp_name_key UNIQUE (edp_name);


--
-- Name: edp_table edp_table_pkey; Type: CONSTRAINT; Schema: mover; Owner: -
--

ALTER TABLE ONLY mover.edp_table
    ADD CONSTRAINT edp_table_pkey PRIMARY KEY (edp_code);


--
-- Name: f_additional f_additional_pkey; Type: CONSTRAINT; Schema: mover; Owner: -
--

ALTER TABLE ONLY mover.f_additional
    ADD CONSTRAINT f_additional_pkey PRIMARY KEY (f_additional_id);


--
-- Name: f_core f_core_pkey; Type: CONSTRAINT; Schema: mover; Owner: -
--

ALTER TABLE ONLY mover.f_core
    ADD CONSTRAINT f_core_pkey PRIMARY KEY (id);


--
-- Name: f_scoring f_scoring_pkey; Type: CONSTRAINT; Schema: mover; Owner: -
--

ALTER TABLE ONLY mover.f_scoring
    ADD CONSTRAINT f_scoring_pkey PRIMARY KEY (id);


--
-- Name: f_specifics f_specifics_pkey; Type: CONSTRAINT; Schema: mover; Owner: -
--

ALTER TABLE ONLY mover.f_specifics
    ADD CONSTRAINT f_specifics_pkey PRIMARY KEY (f_specifics_id);


--
-- Name: lp_table lp_table_lp_name_key; Type: CONSTRAINT; Schema: mover; Owner: -
--

ALTER TABLE ONLY mover.lp_table
    ADD CONSTRAINT lp_table_lp_name_key UNIQUE (lp_name);


--
-- Name: lp_table lp_table_pkey; Type: CONSTRAINT; Schema: mover; Owner: -
--

ALTER TABLE ONLY mover.lp_table
    ADD CONSTRAINT lp_table_pkey PRIMARY KEY (lp_code);


--
-- Name: f_core bespoke_model_ref; Type: FK CONSTRAINT; Schema: mover; Owner: -
--

ALTER TABLE ONLY mover.f_core
    ADD CONSTRAINT bespoke_model_ref FOREIGN KEY (bespoke_model_ref) REFERENCES mover.reference_table(author_year);


--
-- Name: damage_scale damage_scale_hazard_type_fkey; Type: FK CONSTRAINT; Schema: mover; Owner: -
--

ALTER TABLE ONLY mover.damage_scale
    ADD CONSTRAINT damage_scale_hazard_type_fkey FOREIGN KEY (hazard_type) REFERENCES cf_common.hazard_type(code);


--
-- Name: damage_scale damage_scale_process_type_fkey; Type: FK CONSTRAINT; Schema: mover; Owner: -
--

ALTER TABLE ONLY mover.damage_scale
    ADD CONSTRAINT damage_scale_process_type_fkey FOREIGN KEY (process_type) REFERENCES cf_common.process_type(code);


--
-- Name: f_specifics dm_scale_fkey; Type: FK CONSTRAINT; Schema: mover; Owner: -
--

ALTER TABLE ONLY mover.f_specifics
    ADD CONSTRAINT dm_scale_fkey FOREIGN KEY (damage_scale_code) REFERENCES mover.damage_scale(damage_scale_code) ON DELETE CASCADE;


--
-- Name: f_specifics edp_fkey; Type: FK CONSTRAINT; Schema: mover; Owner: -
--

ALTER TABLE ONLY mover.f_specifics
    ADD CONSTRAINT edp_fkey FOREIGN KEY (edp_code) REFERENCES mover.edp_table(edp_code) ON DELETE CASCADE;


--
-- Name: f_specifics f_core_fkey; Type: FK CONSTRAINT; Schema: mover; Owner: -
--

ALTER TABLE ONLY mover.f_specifics
    ADD CONSTRAINT f_core_fkey FOREIGN KEY (f_specifics_id) REFERENCES mover.f_core(id);


--
-- Name: f_core f_ref; Type: FK CONSTRAINT; Schema: mover; Owner: -
--

ALTER TABLE ONLY mover.f_core
    ADD CONSTRAINT f_ref FOREIGN KEY (f_reference) REFERENCES mover.reference_table(author_year);


--
-- Name: f_scoring f_scoring_f_core_id_fkey; Type: FK CONSTRAINT; Schema: mover; Owner: -
--

ALTER TABLE ONLY mover.f_scoring
    ADD CONSTRAINT f_scoring_f_core_id_fkey FOREIGN KEY (f_core_id) REFERENCES mover.f_core(id);


--
-- Name: f_additional f_specifics_ref; Type: FK CONSTRAINT; Schema: mover; Owner: -
--

ALTER TABLE ONLY mover.f_additional
    ADD CONSTRAINT f_specifics_ref FOREIGN KEY (f_additional_id) REFERENCES mover.f_specifics(f_specifics_id);


--
-- Name: f_core hazard_typep_ref; Type: FK CONSTRAINT; Schema: mover; Owner: -
--

ALTER TABLE ONLY mover.f_core
    ADD CONSTRAINT hazard_typep_ref FOREIGN KEY (hazard_type_primary) REFERENCES cf_common.hazard_type(code);


--
-- Name: f_core hazard_types_ref; Type: FK CONSTRAINT; Schema: mover; Owner: -
--

ALTER TABLE ONLY mover.f_core
    ADD CONSTRAINT hazard_types_ref FOREIGN KEY (hazard_type_secondary) REFERENCES cf_common.hazard_type(code);


--
-- Name: f_specifics im_data_source_ref; Type: FK CONSTRAINT; Schema: mover; Owner: -
--

ALTER TABLE ONLY mover.f_specifics
    ADD CONSTRAINT im_data_source_ref FOREIGN KEY (im_data_source) REFERENCES mover.reference_table(author_year);


--
-- Name: f_specifics im_fkey; Type: FK CONSTRAINT; Schema: mover; Owner: -
--

ALTER TABLE ONLY mover.f_specifics
    ADD CONSTRAINT im_fkey FOREIGN KEY (im_code) REFERENCES cf_common.imt(im_code) ON DELETE CASCADE;


--
-- Name: f_specifics impe_ref; Type: FK CONSTRAINT; Schema: mover; Owner: -
--

ALTER TABLE ONLY mover.f_specifics
    ADD CONSTRAINT impe_ref FOREIGN KEY (impe_reference) REFERENCES mover.reference_table(author_year);


--
-- Name: f_core licence_fkey; Type: FK CONSTRAINT; Schema: mover; Owner: -
--

ALTER TABLE ONLY mover.f_core
    ADD CONSTRAINT licence_fkey FOREIGN KEY (licence_code) REFERENCES cf_common.license(code);


--
-- Name: f_core licence_ref; Type: FK CONSTRAINT; Schema: mover; Owner: -
--

ALTER TABLE ONLY mover.f_core
    ADD CONSTRAINT licence_ref FOREIGN KEY (licence_reference) REFERENCES mover.reference_table(author_year);


--
-- Name: f_specifics lp_fkey; Type: FK CONSTRAINT; Schema: mover; Owner: -
--

ALTER TABLE ONLY mover.f_specifics
    ADD CONSTRAINT lp_fkey FOREIGN KEY (lp_code) REFERENCES mover.lp_table(lp_code);


--
-- Name: f_core process_typep_ref; Type: FK CONSTRAINT; Schema: mover; Owner: -
--

ALTER TABLE ONLY mover.f_core
    ADD CONSTRAINT process_typep_ref FOREIGN KEY (process_type_primary) REFERENCES cf_common.process_type(code);


--
-- Name: f_core process_types_ref; Type: FK CONSTRAINT; Schema: mover; Owner: -
--

ALTER TABLE ONLY mover.f_core
    ADD CONSTRAINT process_types_ref FOREIGN KEY (process_type_secondary) REFERENCES cf_common.process_type(code);


--
-- Name: f_additional valstudy_ref; Type: FK CONSTRAINT; Schema: mover; Owner: -
--

ALTER TABLE ONLY mover.f_additional
    ADD CONSTRAINT valstudy_ref FOREIGN KEY (val_study_reference) REFERENCES mover.reference_table(author_year);


--
-- PostgreSQL database dump complete
--

