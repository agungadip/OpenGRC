--
-- PostgreSQL database dump
--

\restrict U2q2Jq5D6iC3i8NifVbAmfEjRqa4CgEgQsVJvgInkCdjtWTxXaJMOMexk17jIvJ

-- Dumped from database version 18.0 (Debian 18.0-1.pgdg13+3)
-- Dumped by pg_dump version 18.0 (Debian 18.0-1.pgdg13+3)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: activity_log; Type: TABLE; Schema: public; Owner: opengrc
--

CREATE TABLE public.activity_log (
    id bigint NOT NULL,
    log_name character varying(255),
    description text NOT NULL,
    subject_type character varying(255),
    subject_id bigint,
    causer_type character varying(255),
    causer_id bigint,
    properties json,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    event character varying(255),
    batch_uuid uuid
);


ALTER TABLE public.activity_log OWNER TO opengrc;

--
-- Name: activity_log_id_seq; Type: SEQUENCE; Schema: public; Owner: opengrc
--

CREATE SEQUENCE public.activity_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.activity_log_id_seq OWNER TO opengrc;

--
-- Name: activity_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: opengrc
--

ALTER SEQUENCE public.activity_log_id_seq OWNED BY public.activity_log.id;


--
-- Name: applications; Type: TABLE; Schema: public; Owner: opengrc
--

CREATE TABLE public.applications (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    logo character varying(512),
    owner_id bigint NOT NULL,
    type character varying(255) DEFAULT 'Other'::character varying NOT NULL,
    description text,
    status character varying(255) DEFAULT 'Approved'::character varying NOT NULL,
    url character varying(512),
    notes text,
    vendor_id bigint NOT NULL,
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT applications_status_check CHECK (((status)::text = ANY ((ARRAY['Approved'::character varying, 'Rejected'::character varying, 'Limited'::character varying, 'Expired'::character varying])::text[]))),
    CONSTRAINT applications_type_check CHECK (((type)::text = ANY ((ARRAY['SaaS'::character varying, 'Desktop'::character varying, 'Server'::character varying, 'Appliance'::character varying, 'Other'::character varying])::text[])))
);


ALTER TABLE public.applications OWNER TO opengrc;

--
-- Name: applications_id_seq; Type: SEQUENCE; Schema: public; Owner: opengrc
--

CREATE SEQUENCE public.applications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.applications_id_seq OWNER TO opengrc;

--
-- Name: applications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: opengrc
--

ALTER SEQUENCE public.applications_id_seq OWNED BY public.applications.id;


--
-- Name: asset_implementation; Type: TABLE; Schema: public; Owner: opengrc
--

CREATE TABLE public.asset_implementation (
    id bigint NOT NULL,
    asset_id bigint NOT NULL,
    implementation_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.asset_implementation OWNER TO opengrc;

--
-- Name: asset_implementation_id_seq; Type: SEQUENCE; Schema: public; Owner: opengrc
--

CREATE SEQUENCE public.asset_implementation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.asset_implementation_id_seq OWNER TO opengrc;

--
-- Name: asset_implementation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: opengrc
--

ALTER SEQUENCE public.asset_implementation_id_seq OWNED BY public.asset_implementation.id;


--
-- Name: assets; Type: TABLE; Schema: public; Owner: opengrc
--

CREATE TABLE public.assets (
    id bigint NOT NULL,
    asset_tag character varying(255) NOT NULL,
    serial_number character varying(255),
    name character varying(255) NOT NULL,
    asset_type_id bigint,
    category_id bigint,
    status_id bigint,
    manufacturer character varying(255),
    model character varying(255),
    processor character varying(255),
    ram_gb integer,
    storage_type character varying(255),
    storage_capacity_gb integer,
    graphics_card character varying(255),
    screen_size numeric(4,2),
    mac_address character varying(255),
    ip_address character varying(255),
    hostname character varying(255),
    operating_system character varying(255),
    os_version character varying(255),
    assigned_to_user_id bigint,
    assigned_at timestamp(0) without time zone,
    location_id bigint,
    building character varying(255),
    floor character varying(255),
    room character varying(255),
    department_id bigint,
    purchase_date date,
    purchase_price numeric(10,2),
    purchase_order_number character varying(255),
    supplier_id bigint,
    invoice_number character varying(255),
    depreciation_method character varying(255),
    depreciation_rate numeric(5,2),
    current_value numeric(10,2),
    residual_value numeric(10,2),
    warranty_start_date date,
    warranty_end_date date,
    warranty_type character varying(255),
    warranty_provider character varying(255),
    support_contract_number character varying(255),
    support_expiry_date date,
    received_date date,
    deployment_date date,
    last_audit_date date,
    next_audit_date date,
    retirement_date date,
    disposal_date date,
    disposal_method character varying(255),
    expected_life_years integer,
    last_maintenance_date timestamp(0) without time zone,
    next_maintenance_date timestamp(0) without time zone,
    maintenance_notes text,
    condition_id bigint,
    license_key text,
    license_type character varying(255),
    license_seats integer,
    license_expiry_date date,
    encryption_enabled boolean DEFAULT false NOT NULL,
    antivirus_installed boolean DEFAULT false NOT NULL,
    last_security_scan timestamp(0) without time zone,
    compliance_status_id bigint,
    data_classification_id bigint,
    parent_asset_id bigint,
    notes text,
    custom_fields json,
    tags json,
    image_url character varying(255),
    qr_code character varying(255),
    is_active boolean DEFAULT true NOT NULL,
    created_by bigint,
    updated_by bigint,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.assets OWNER TO opengrc;

--
-- Name: assets_id_seq; Type: SEQUENCE; Schema: public; Owner: opengrc
--

CREATE SEQUENCE public.assets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.assets_id_seq OWNER TO opengrc;

--
-- Name: assets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: opengrc
--

ALTER SEQUENCE public.assets_id_seq OWNED BY public.assets.id;


--
-- Name: audit_item_data_request; Type: TABLE; Schema: public; Owner: opengrc
--

CREATE TABLE public.audit_item_data_request (
    id bigint NOT NULL,
    audit_item_id bigint NOT NULL,
    data_request_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.audit_item_data_request OWNER TO opengrc;

--
-- Name: audit_item_data_request_id_seq; Type: SEQUENCE; Schema: public; Owner: opengrc
--

CREATE SEQUENCE public.audit_item_data_request_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.audit_item_data_request_id_seq OWNER TO opengrc;

--
-- Name: audit_item_data_request_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: opengrc
--

ALTER SEQUENCE public.audit_item_data_request_id_seq OWNED BY public.audit_item_data_request.id;


--
-- Name: audit_items; Type: TABLE; Schema: public; Owner: opengrc
--

CREATE TABLE public.audit_items (
    id bigint NOT NULL,
    audit_id bigint,
    user_id bigint,
    auditable_id bigint,
    auditable_type character varying(255),
    auditor_notes text,
    status character varying(255) DEFAULT 'Not Tested'::character varying NOT NULL,
    effectiveness character varying(255) DEFAULT 'Unknown'::character varying NOT NULL,
    applicability character varying(255) DEFAULT 'Unknown'::character varying NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.audit_items OWNER TO opengrc;

--
-- Name: audit_items_id_seq; Type: SEQUENCE; Schema: public; Owner: opengrc
--

CREATE SEQUENCE public.audit_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.audit_items_id_seq OWNER TO opengrc;

--
-- Name: audit_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: opengrc
--

ALTER SEQUENCE public.audit_items_id_seq OWNED BY public.audit_items.id;


--
-- Name: audit_user; Type: TABLE; Schema: public; Owner: opengrc
--

CREATE TABLE public.audit_user (
    audit_id bigint NOT NULL,
    user_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.audit_user OWNER TO opengrc;

--
-- Name: audits; Type: TABLE; Schema: public; Owner: opengrc
--

CREATE TABLE public.audits (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    description text,
    status character varying(255) DEFAULT 'Not Started'::character varying NOT NULL,
    audit_type character varying(255) NOT NULL,
    sid character varying(255),
    controls text,
    start_date date NOT NULL,
    end_date date NOT NULL,
    manager_id bigint,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    program_id bigint
);


ALTER TABLE public.audits OWNER TO opengrc;

--
-- Name: audits_id_seq; Type: SEQUENCE; Schema: public; Owner: opengrc
--

CREATE SEQUENCE public.audits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.audits_id_seq OWNER TO opengrc;

--
-- Name: audits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: opengrc
--

ALTER SEQUENCE public.audits_id_seq OWNED BY public.audits.id;


--
-- Name: breezy_sessions; Type: TABLE; Schema: public; Owner: opengrc
--

CREATE TABLE public.breezy_sessions (
    id bigint NOT NULL,
    authenticatable_type character varying(255) NOT NULL,
    authenticatable_id bigint NOT NULL,
    panel_id character varying(255),
    guard character varying(255),
    ip_address character varying(45),
    user_agent text,
    expires_at timestamp(0) without time zone,
    two_factor_secret text,
    two_factor_recovery_codes text,
    two_factor_confirmed_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.breezy_sessions OWNER TO opengrc;

--
-- Name: breezy_sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: opengrc
--

CREATE SEQUENCE public.breezy_sessions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.breezy_sessions_id_seq OWNER TO opengrc;

--
-- Name: breezy_sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: opengrc
--

ALTER SEQUENCE public.breezy_sessions_id_seq OWNED BY public.breezy_sessions.id;


--
-- Name: bundles; Type: TABLE; Schema: public; Owner: opengrc
--

CREATE TABLE public.bundles (
    id bigint NOT NULL,
    code character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    version character varying(255) NOT NULL,
    description text NOT NULL,
    authority character varying(255) NOT NULL,
    source_url character varying(255),
    image character varying(255),
    repo_url character varying(255) NOT NULL,
    status character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    type character varying(255) DEFAULT 'Standard'::character varying NOT NULL
);


ALTER TABLE public.bundles OWNER TO opengrc;

--
-- Name: bundles_id_seq; Type: SEQUENCE; Schema: public; Owner: opengrc
--

CREATE SEQUENCE public.bundles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bundles_id_seq OWNER TO opengrc;

--
-- Name: bundles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: opengrc
--

ALTER SEQUENCE public.bundles_id_seq OWNED BY public.bundles.id;


--
-- Name: cache; Type: TABLE; Schema: public; Owner: opengrc
--

CREATE TABLE public.cache (
    key character varying(255) NOT NULL,
    value text NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache OWNER TO opengrc;

--
-- Name: cache_locks; Type: TABLE; Schema: public; Owner: opengrc
--

CREATE TABLE public.cache_locks (
    key character varying(255) NOT NULL,
    owner character varying(255) NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache_locks OWNER TO opengrc;

--
-- Name: control_implementation; Type: TABLE; Schema: public; Owner: opengrc
--

CREATE TABLE public.control_implementation (
    control_id bigint NOT NULL,
    implementation_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.control_implementation OWNER TO opengrc;

--
-- Name: control_program; Type: TABLE; Schema: public; Owner: opengrc
--

CREATE TABLE public.control_program (
    id bigint NOT NULL,
    program_id bigint NOT NULL,
    control_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.control_program OWNER TO opengrc;

--
-- Name: control_program_id_seq; Type: SEQUENCE; Schema: public; Owner: opengrc
--

CREATE SEQUENCE public.control_program_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.control_program_id_seq OWNER TO opengrc;

--
-- Name: control_program_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: opengrc
--

ALTER SEQUENCE public.control_program_id_seq OWNED BY public.control_program.id;


--
-- Name: controls; Type: TABLE; Schema: public; Owner: opengrc
--

CREATE TABLE public.controls (
    id bigint NOT NULL,
    standard_id bigint NOT NULL,
    title character varying(1024) NOT NULL,
    code character varying(255) NOT NULL,
    description text NOT NULL,
    discussion text,
    test text,
    type character varying(255) DEFAULT 'Other'::character varying NOT NULL,
    category character varying(255) DEFAULT 'Other'::character varying NOT NULL,
    enforcement character varying(255) DEFAULT 'Mandatory'::character varying NOT NULL,
    effectiveness character varying(255) DEFAULT 'Not Assessed'::character varying NOT NULL,
    applicability character varying(255) DEFAULT 'Unknown'::character varying NOT NULL,
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    control_owner_id bigint
);


ALTER TABLE public.controls OWNER TO opengrc;

--
-- Name: controls_id_seq; Type: SEQUENCE; Schema: public; Owner: opengrc
--

CREATE SEQUENCE public.controls_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.controls_id_seq OWNER TO opengrc;

--
-- Name: controls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: opengrc
--

ALTER SEQUENCE public.controls_id_seq OWNED BY public.controls.id;


--
-- Name: data_request_responses; Type: TABLE; Schema: public; Owner: opengrc
--

CREATE TABLE public.data_request_responses (
    id bigint NOT NULL,
    data_request_id bigint NOT NULL,
    requester_id bigint NOT NULL,
    requestee_id bigint NOT NULL,
    status character varying(255) DEFAULT 'Pending'::character varying NOT NULL,
    response text,
    due_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT data_request_responses_status_check CHECK (((status)::text = ANY ((ARRAY['Pending'::character varying, 'Responded'::character varying, 'Rejected'::character varying, 'Accepted'::character varying])::text[])))
);


ALTER TABLE public.data_request_responses OWNER TO opengrc;

--
-- Name: data_request_responses_id_seq; Type: SEQUENCE; Schema: public; Owner: opengrc
--

CREATE SEQUENCE public.data_request_responses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.data_request_responses_id_seq OWNER TO opengrc;

--
-- Name: data_request_responses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: opengrc
--

ALTER SEQUENCE public.data_request_responses_id_seq OWNED BY public.data_request_responses.id;


--
-- Name: data_requests; Type: TABLE; Schema: public; Owner: opengrc
--

CREATE TABLE public.data_requests (
    id bigint NOT NULL,
    created_by_id bigint NOT NULL,
    assigned_to_id bigint NOT NULL,
    audit_item_id bigint,
    audit_id bigint NOT NULL,
    status character varying(255) DEFAULT 'Pending'::character varying NOT NULL,
    details text,
    response text,
    files text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    code character varying(255)
);


ALTER TABLE public.data_requests OWNER TO opengrc;

--
-- Name: data_requests_id_seq; Type: SEQUENCE; Schema: public; Owner: opengrc
--

CREATE SEQUENCE public.data_requests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.data_requests_id_seq OWNER TO opengrc;

--
-- Name: data_requests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: opengrc
--

ALTER SEQUENCE public.data_requests_id_seq OWNED BY public.data_requests.id;


--
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: opengrc
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


ALTER TABLE public.failed_jobs OWNER TO opengrc;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: opengrc
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.failed_jobs_id_seq OWNER TO opengrc;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: opengrc
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- Name: file_attachments; Type: TABLE; Schema: public; Owner: opengrc
--

CREATE TABLE public.file_attachments (
    id bigint NOT NULL,
    data_request_response_id bigint,
    audit_id bigint NOT NULL,
    file_name character varying(255),
    file_path character varying(255) NOT NULL,
    file_size character varying(255),
    description text NOT NULL,
    uploaded_by integer,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.file_attachments OWNER TO opengrc;

--
-- Name: file_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: opengrc
--

CREATE SEQUENCE public.file_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.file_attachments_id_seq OWNER TO opengrc;

--
-- Name: file_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: opengrc
--

ALTER SEQUENCE public.file_attachments_id_seq OWNED BY public.file_attachments.id;


--
-- Name: general_settings; Type: TABLE; Schema: public; Owner: opengrc
--

CREATE TABLE public.general_settings (
    id bigint NOT NULL,
    site_name character varying(255),
    site_description text,
    site_logo character varying(255),
    site_favicon character varying(255),
    theme_color character varying(255),
    support_email character varying(255),
    support_phone character varying(255),
    google_analytics_id character varying(255),
    posthog_html_snippet character varying(255),
    seo_title character varying(255),
    seo_keywords character varying(255),
    seo_metadata json,
    email_settings json,
    email_from_address character varying(255),
    email_from_name character varying(255),
    social_network json,
    more_configs json,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.general_settings OWNER TO opengrc;

--
-- Name: general_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: opengrc
--

CREATE SEQUENCE public.general_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.general_settings_id_seq OWNER TO opengrc;

--
-- Name: general_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: opengrc
--

ALTER SEQUENCE public.general_settings_id_seq OWNED BY public.general_settings.id;


--
-- Name: implementation_risk; Type: TABLE; Schema: public; Owner: opengrc
--

CREATE TABLE public.implementation_risk (
    id bigint NOT NULL,
    implementation_id bigint NOT NULL,
    risk_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.implementation_risk OWNER TO opengrc;

--
-- Name: implementation_risk_id_seq; Type: SEQUENCE; Schema: public; Owner: opengrc
--

CREATE SEQUENCE public.implementation_risk_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.implementation_risk_id_seq OWNER TO opengrc;

--
-- Name: implementation_risk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: opengrc
--

ALTER SEQUENCE public.implementation_risk_id_seq OWNED BY public.implementation_risk.id;


--
-- Name: implementations; Type: TABLE; Schema: public; Owner: opengrc
--

CREATE TABLE public.implementations (
    id bigint NOT NULL,
    code character varying(255),
    title character varying(255) NOT NULL,
    details text,
    status character varying(255) DEFAULT 'Unknown'::character varying NOT NULL,
    effectiveness character varying(255) DEFAULT 'Not Assessed'::character varying NOT NULL,
    notes text,
    test_procedure text,
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    implementation_owner_id bigint,
    test_plan text
);


ALTER TABLE public.implementations OWNER TO opengrc;

--
-- Name: implementations_id_seq; Type: SEQUENCE; Schema: public; Owner: opengrc
--

CREATE SEQUENCE public.implementations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.implementations_id_seq OWNER TO opengrc;

--
-- Name: implementations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: opengrc
--

ALTER SEQUENCE public.implementations_id_seq OWNED BY public.implementations.id;


--
-- Name: jobs; Type: TABLE; Schema: public; Owner: opengrc
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


ALTER TABLE public.jobs OWNER TO opengrc;

--
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: opengrc
--

CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.jobs_id_seq OWNER TO opengrc;

--
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: opengrc
--

ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: opengrc
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO opengrc;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: opengrc
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.migrations_id_seq OWNER TO opengrc;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: opengrc
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: model_has_permissions; Type: TABLE; Schema: public; Owner: opengrc
--

CREATE TABLE public.model_has_permissions (
    permission_id bigint NOT NULL,
    model_type character varying(255) NOT NULL,
    model_id bigint NOT NULL
);


ALTER TABLE public.model_has_permissions OWNER TO opengrc;

--
-- Name: model_has_roles; Type: TABLE; Schema: public; Owner: opengrc
--

CREATE TABLE public.model_has_roles (
    role_id bigint NOT NULL,
    model_type character varying(255) NOT NULL,
    model_id bigint NOT NULL
);


ALTER TABLE public.model_has_roles OWNER TO opengrc;

--
-- Name: notifications; Type: TABLE; Schema: public; Owner: opengrc
--

CREATE TABLE public.notifications (
    id uuid NOT NULL,
    type character varying(255) NOT NULL,
    notifiable_type character varying(255) NOT NULL,
    notifiable_id bigint NOT NULL,
    data text NOT NULL,
    read_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.notifications OWNER TO opengrc;

--
-- Name: password_reset_tokens; Type: TABLE; Schema: public; Owner: opengrc
--

CREATE TABLE public.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_reset_tokens OWNER TO opengrc;

--
-- Name: permissions; Type: TABLE; Schema: public; Owner: opengrc
--

CREATE TABLE public.permissions (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    guard_name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    category character varying(255)
);


ALTER TABLE public.permissions OWNER TO opengrc;

--
-- Name: permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: opengrc
--

CREATE SEQUENCE public.permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.permissions_id_seq OWNER TO opengrc;

--
-- Name: permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: opengrc
--

ALTER SEQUENCE public.permissions_id_seq OWNED BY public.permissions.id;


--
-- Name: personal_access_tokens; Type: TABLE; Schema: public; Owner: opengrc
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


ALTER TABLE public.personal_access_tokens OWNER TO opengrc;

--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: opengrc
--

CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.personal_access_tokens_id_seq OWNER TO opengrc;

--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: opengrc
--

ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;


--
-- Name: program_risk; Type: TABLE; Schema: public; Owner: opengrc
--

CREATE TABLE public.program_risk (
    id bigint NOT NULL,
    program_id bigint NOT NULL,
    risk_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.program_risk OWNER TO opengrc;

--
-- Name: program_risk_id_seq; Type: SEQUENCE; Schema: public; Owner: opengrc
--

CREATE SEQUENCE public.program_risk_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.program_risk_id_seq OWNER TO opengrc;

--
-- Name: program_risk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: opengrc
--

ALTER SEQUENCE public.program_risk_id_seq OWNED BY public.program_risk.id;


--
-- Name: program_standard; Type: TABLE; Schema: public; Owner: opengrc
--

CREATE TABLE public.program_standard (
    id bigint NOT NULL,
    program_id bigint NOT NULL,
    standard_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.program_standard OWNER TO opengrc;

--
-- Name: program_standard_id_seq; Type: SEQUENCE; Schema: public; Owner: opengrc
--

CREATE SEQUENCE public.program_standard_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.program_standard_id_seq OWNER TO opengrc;

--
-- Name: program_standard_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: opengrc
--

ALTER SEQUENCE public.program_standard_id_seq OWNED BY public.program_standard.id;


--
-- Name: programs; Type: TABLE; Schema: public; Owner: opengrc
--

CREATE TABLE public.programs (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    program_manager_id bigint,
    last_audit_date date,
    scope_status character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.programs OWNER TO opengrc;

--
-- Name: programs_id_seq; Type: SEQUENCE; Schema: public; Owner: opengrc
--

CREATE SEQUENCE public.programs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.programs_id_seq OWNER TO opengrc;

--
-- Name: programs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: opengrc
--

ALTER SEQUENCE public.programs_id_seq OWNED BY public.programs.id;


--
-- Name: risks; Type: TABLE; Schema: public; Owner: opengrc
--

CREATE TABLE public.risks (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    code character varying(255) NOT NULL,
    description text,
    status character varying(255) DEFAULT 'Not Assessed'::character varying NOT NULL,
    inherent_likelihood smallint DEFAULT '3'::smallint NOT NULL,
    inherent_impact smallint DEFAULT '3'::smallint NOT NULL,
    residual_likelihood smallint DEFAULT '3'::smallint NOT NULL,
    residual_impact smallint DEFAULT '3'::smallint NOT NULL,
    inherent_risk double precision DEFAULT '0'::double precision NOT NULL,
    residual_risk double precision DEFAULT '0'::double precision NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.risks OWNER TO opengrc;

--
-- Name: risks_id_seq; Type: SEQUENCE; Schema: public; Owner: opengrc
--

CREATE SEQUENCE public.risks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.risks_id_seq OWNER TO opengrc;

--
-- Name: risks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: opengrc
--

ALTER SEQUENCE public.risks_id_seq OWNED BY public.risks.id;


--
-- Name: role_has_permissions; Type: TABLE; Schema: public; Owner: opengrc
--

CREATE TABLE public.role_has_permissions (
    permission_id bigint NOT NULL,
    role_id bigint NOT NULL
);


ALTER TABLE public.role_has_permissions OWNER TO opengrc;

--
-- Name: roles; Type: TABLE; Schema: public; Owner: opengrc
--

CREATE TABLE public.roles (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    guard_name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    description character varying(255)
);


ALTER TABLE public.roles OWNER TO opengrc;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: opengrc
--

CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.roles_id_seq OWNER TO opengrc;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: opengrc
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: settings; Type: TABLE; Schema: public; Owner: opengrc
--

CREATE TABLE public.settings (
    id bigint NOT NULL,
    key character varying(255) NOT NULL,
    value json,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.settings OWNER TO opengrc;

--
-- Name: settings_id_seq; Type: SEQUENCE; Schema: public; Owner: opengrc
--

CREATE SEQUENCE public.settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.settings_id_seq OWNER TO opengrc;

--
-- Name: settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: opengrc
--

ALTER SEQUENCE public.settings_id_seq OWNED BY public.settings.id;


--
-- Name: socialite_users; Type: TABLE; Schema: public; Owner: opengrc
--

CREATE TABLE public.socialite_users (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    provider character varying(255) NOT NULL,
    provider_id character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.socialite_users OWNER TO opengrc;

--
-- Name: socialite_users_id_seq; Type: SEQUENCE; Schema: public; Owner: opengrc
--

CREATE SEQUENCE public.socialite_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.socialite_users_id_seq OWNER TO opengrc;

--
-- Name: socialite_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: opengrc
--

ALTER SEQUENCE public.socialite_users_id_seq OWNED BY public.socialite_users.id;


--
-- Name: standards; Type: TABLE; Schema: public; Owner: opengrc
--

CREATE TABLE public.standards (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    description text NOT NULL,
    code character varying(255) NOT NULL,
    authority character varying(255) NOT NULL,
    reference_url character varying(512),
    status character varying(255) DEFAULT 'Draft'::character varying NOT NULL,
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT standards_status_check CHECK (((status)::text = ANY ((ARRAY['Draft'::character varying, 'Not in Scope'::character varying, 'In Scope'::character varying])::text[])))
);


ALTER TABLE public.standards OWNER TO opengrc;

--
-- Name: standards_id_seq; Type: SEQUENCE; Schema: public; Owner: opengrc
--

CREATE SEQUENCE public.standards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.standards_id_seq OWNER TO opengrc;

--
-- Name: standards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: opengrc
--

ALTER SEQUENCE public.standards_id_seq OWNED BY public.standards.id;


--
-- Name: taxonomables; Type: TABLE; Schema: public; Owner: opengrc
--

CREATE TABLE public.taxonomables (
    id bigint NOT NULL,
    taxonomy_id bigint NOT NULL,
    taxonomable_type character varying(255) NOT NULL,
    taxonomable_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.taxonomables OWNER TO opengrc;

--
-- Name: taxonomables_id_seq; Type: SEQUENCE; Schema: public; Owner: opengrc
--

CREATE SEQUENCE public.taxonomables_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.taxonomables_id_seq OWNER TO opengrc;

--
-- Name: taxonomables_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: opengrc
--

ALTER SEQUENCE public.taxonomables_id_seq OWNED BY public.taxonomables.id;


--
-- Name: taxonomies; Type: TABLE; Schema: public; Owner: opengrc
--

CREATE TABLE public.taxonomies (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    description text,
    parent_id bigint,
    sort_order integer DEFAULT 0 NOT NULL,
    lft integer,
    rgt integer,
    depth integer,
    meta json,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.taxonomies OWNER TO opengrc;

--
-- Name: taxonomies_id_seq; Type: SEQUENCE; Schema: public; Owner: opengrc
--

CREATE SEQUENCE public.taxonomies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.taxonomies_id_seq OWNER TO opengrc;

--
-- Name: taxonomies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: opengrc
--

ALTER SEQUENCE public.taxonomies_id_seq OWNED BY public.taxonomies.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: opengrc
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    password_reset_required boolean DEFAULT true NOT NULL,
    remember_token character varying(100),
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    last_activity timestamp(0) without time zone
);


ALTER TABLE public.users OWNER TO opengrc;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: opengrc
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO opengrc;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: opengrc
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: vendors; Type: TABLE; Schema: public; Owner: opengrc
--

CREATE TABLE public.vendors (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    url character varying(512),
    logo character varying(512),
    vendor_manager_id bigint NOT NULL,
    status character varying(255) DEFAULT 'Pending'::character varying NOT NULL,
    risk_rating character varying(255) DEFAULT 'Medium'::character varying NOT NULL,
    notes text,
    deleted_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT vendors_risk_rating_check CHECK (((risk_rating)::text = ANY ((ARRAY['Very Low'::character varying, 'Low'::character varying, 'Medium'::character varying, 'High'::character varying, 'Critical'::character varying])::text[]))),
    CONSTRAINT vendors_status_check CHECK (((status)::text = ANY ((ARRAY['Pending'::character varying, 'Accepted'::character varying, 'Rejected'::character varying, 'Expired'::character varying, 'Terminated'::character varying])::text[])))
);


ALTER TABLE public.vendors OWNER TO opengrc;

--
-- Name: vendors_id_seq; Type: SEQUENCE; Schema: public; Owner: opengrc
--

CREATE SEQUENCE public.vendors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vendors_id_seq OWNER TO opengrc;

--
-- Name: vendors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: opengrc
--

ALTER SEQUENCE public.vendors_id_seq OWNED BY public.vendors.id;


--
-- Name: activity_log id; Type: DEFAULT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.activity_log ALTER COLUMN id SET DEFAULT nextval('public.activity_log_id_seq'::regclass);


--
-- Name: applications id; Type: DEFAULT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.applications ALTER COLUMN id SET DEFAULT nextval('public.applications_id_seq'::regclass);


--
-- Name: asset_implementation id; Type: DEFAULT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.asset_implementation ALTER COLUMN id SET DEFAULT nextval('public.asset_implementation_id_seq'::regclass);


--
-- Name: assets id; Type: DEFAULT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.assets ALTER COLUMN id SET DEFAULT nextval('public.assets_id_seq'::regclass);


--
-- Name: audit_item_data_request id; Type: DEFAULT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.audit_item_data_request ALTER COLUMN id SET DEFAULT nextval('public.audit_item_data_request_id_seq'::regclass);


--
-- Name: audit_items id; Type: DEFAULT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.audit_items ALTER COLUMN id SET DEFAULT nextval('public.audit_items_id_seq'::regclass);


--
-- Name: audits id; Type: DEFAULT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.audits ALTER COLUMN id SET DEFAULT nextval('public.audits_id_seq'::regclass);


--
-- Name: breezy_sessions id; Type: DEFAULT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.breezy_sessions ALTER COLUMN id SET DEFAULT nextval('public.breezy_sessions_id_seq'::regclass);


--
-- Name: bundles id; Type: DEFAULT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.bundles ALTER COLUMN id SET DEFAULT nextval('public.bundles_id_seq'::regclass);


--
-- Name: control_program id; Type: DEFAULT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.control_program ALTER COLUMN id SET DEFAULT nextval('public.control_program_id_seq'::regclass);


--
-- Name: controls id; Type: DEFAULT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.controls ALTER COLUMN id SET DEFAULT nextval('public.controls_id_seq'::regclass);


--
-- Name: data_request_responses id; Type: DEFAULT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.data_request_responses ALTER COLUMN id SET DEFAULT nextval('public.data_request_responses_id_seq'::regclass);


--
-- Name: data_requests id; Type: DEFAULT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.data_requests ALTER COLUMN id SET DEFAULT nextval('public.data_requests_id_seq'::regclass);


--
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- Name: file_attachments id; Type: DEFAULT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.file_attachments ALTER COLUMN id SET DEFAULT nextval('public.file_attachments_id_seq'::regclass);


--
-- Name: general_settings id; Type: DEFAULT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.general_settings ALTER COLUMN id SET DEFAULT nextval('public.general_settings_id_seq'::regclass);


--
-- Name: implementation_risk id; Type: DEFAULT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.implementation_risk ALTER COLUMN id SET DEFAULT nextval('public.implementation_risk_id_seq'::regclass);


--
-- Name: implementations id; Type: DEFAULT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.implementations ALTER COLUMN id SET DEFAULT nextval('public.implementations_id_seq'::regclass);


--
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: permissions id; Type: DEFAULT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.permissions ALTER COLUMN id SET DEFAULT nextval('public.permissions_id_seq'::regclass);


--
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);


--
-- Name: program_risk id; Type: DEFAULT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.program_risk ALTER COLUMN id SET DEFAULT nextval('public.program_risk_id_seq'::regclass);


--
-- Name: program_standard id; Type: DEFAULT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.program_standard ALTER COLUMN id SET DEFAULT nextval('public.program_standard_id_seq'::regclass);


--
-- Name: programs id; Type: DEFAULT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.programs ALTER COLUMN id SET DEFAULT nextval('public.programs_id_seq'::regclass);


--
-- Name: risks id; Type: DEFAULT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.risks ALTER COLUMN id SET DEFAULT nextval('public.risks_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: settings id; Type: DEFAULT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.settings ALTER COLUMN id SET DEFAULT nextval('public.settings_id_seq'::regclass);


--
-- Name: socialite_users id; Type: DEFAULT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.socialite_users ALTER COLUMN id SET DEFAULT nextval('public.socialite_users_id_seq'::regclass);


--
-- Name: standards id; Type: DEFAULT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.standards ALTER COLUMN id SET DEFAULT nextval('public.standards_id_seq'::regclass);


--
-- Name: taxonomables id; Type: DEFAULT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.taxonomables ALTER COLUMN id SET DEFAULT nextval('public.taxonomables_id_seq'::regclass);


--
-- Name: taxonomies id; Type: DEFAULT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.taxonomies ALTER COLUMN id SET DEFAULT nextval('public.taxonomies_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: vendors id; Type: DEFAULT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.vendors ALTER COLUMN id SET DEFAULT nextval('public.vendors_id_seq'::regclass);


--
-- Data for Name: activity_log; Type: TABLE DATA; Schema: public; Owner: opengrc
--

COPY public.activity_log (id, log_name, description, subject_type, subject_id, causer_type, causer_id, properties, created_at, updated_at, event, batch_uuid) FROM stdin;
1	default	created	App\\Models\\User	1	\N	\N	{"attributes":{"name":"admin@panarub.co.id","email":"admin@panarub.co.id"}}	2025-10-27 07:44:14	2025-10-27 07:44:14	created	\N
\.


--
-- Data for Name: applications; Type: TABLE DATA; Schema: public; Owner: opengrc
--

COPY public.applications (id, name, logo, owner_id, type, description, status, url, notes, vendor_id, deleted_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: asset_implementation; Type: TABLE DATA; Schema: public; Owner: opengrc
--

COPY public.asset_implementation (id, asset_id, implementation_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: assets; Type: TABLE DATA; Schema: public; Owner: opengrc
--

COPY public.assets (id, asset_tag, serial_number, name, asset_type_id, category_id, status_id, manufacturer, model, processor, ram_gb, storage_type, storage_capacity_gb, graphics_card, screen_size, mac_address, ip_address, hostname, operating_system, os_version, assigned_to_user_id, assigned_at, location_id, building, floor, room, department_id, purchase_date, purchase_price, purchase_order_number, supplier_id, invoice_number, depreciation_method, depreciation_rate, current_value, residual_value, warranty_start_date, warranty_end_date, warranty_type, warranty_provider, support_contract_number, support_expiry_date, received_date, deployment_date, last_audit_date, next_audit_date, retirement_date, disposal_date, disposal_method, expected_life_years, last_maintenance_date, next_maintenance_date, maintenance_notes, condition_id, license_key, license_type, license_seats, license_expiry_date, encryption_enabled, antivirus_installed, last_security_scan, compliance_status_id, data_classification_id, parent_asset_id, notes, custom_fields, tags, image_url, qr_code, is_active, created_by, updated_by, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: audit_item_data_request; Type: TABLE DATA; Schema: public; Owner: opengrc
--

COPY public.audit_item_data_request (id, audit_item_id, data_request_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: audit_items; Type: TABLE DATA; Schema: public; Owner: opengrc
--

COPY public.audit_items (id, audit_id, user_id, auditable_id, auditable_type, auditor_notes, status, effectiveness, applicability, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: audit_user; Type: TABLE DATA; Schema: public; Owner: opengrc
--

COPY public.audit_user (audit_id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: audits; Type: TABLE DATA; Schema: public; Owner: opengrc
--

COPY public.audits (id, title, description, status, audit_type, sid, controls, start_date, end_date, manager_id, created_at, updated_at, program_id) FROM stdin;
\.


--
-- Data for Name: breezy_sessions; Type: TABLE DATA; Schema: public; Owner: opengrc
--

COPY public.breezy_sessions (id, authenticatable_type, authenticatable_id, panel_id, guard, ip_address, user_agent, expires_at, two_factor_secret, two_factor_recovery_codes, two_factor_confirmed_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: bundles; Type: TABLE DATA; Schema: public; Owner: opengrc
--

COPY public.bundles (id, code, name, version, description, authority, source_url, image, repo_url, status, created_at, updated_at, type) FROM stdin;
\.


--
-- Data for Name: cache; Type: TABLE DATA; Schema: public; Owner: opengrc
--

COPY public.cache (key, value, expiration) FROM stdin;
\.


--
-- Data for Name: cache_locks; Type: TABLE DATA; Schema: public; Owner: opengrc
--

COPY public.cache_locks (key, owner, expiration) FROM stdin;
\.


--
-- Data for Name: control_implementation; Type: TABLE DATA; Schema: public; Owner: opengrc
--

COPY public.control_implementation (control_id, implementation_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: control_program; Type: TABLE DATA; Schema: public; Owner: opengrc
--

COPY public.control_program (id, program_id, control_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: controls; Type: TABLE DATA; Schema: public; Owner: opengrc
--

COPY public.controls (id, standard_id, title, code, description, discussion, test, type, category, enforcement, effectiveness, applicability, deleted_at, created_at, updated_at, control_owner_id) FROM stdin;
\.


--
-- Data for Name: data_request_responses; Type: TABLE DATA; Schema: public; Owner: opengrc
--

COPY public.data_request_responses (id, data_request_id, requester_id, requestee_id, status, response, due_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: data_requests; Type: TABLE DATA; Schema: public; Owner: opengrc
--

COPY public.data_requests (id, created_by_id, assigned_to_id, audit_item_id, audit_id, status, details, response, files, created_at, updated_at, code) FROM stdin;
\.


--
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: opengrc
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- Data for Name: file_attachments; Type: TABLE DATA; Schema: public; Owner: opengrc
--

COPY public.file_attachments (id, data_request_response_id, audit_id, file_name, file_path, file_size, description, uploaded_by, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: general_settings; Type: TABLE DATA; Schema: public; Owner: opengrc
--

COPY public.general_settings (id, site_name, site_description, site_logo, site_favicon, theme_color, support_email, support_phone, google_analytics_id, posthog_html_snippet, seo_title, seo_keywords, seo_metadata, email_settings, email_from_address, email_from_name, social_network, more_configs, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: implementation_risk; Type: TABLE DATA; Schema: public; Owner: opengrc
--

COPY public.implementation_risk (id, implementation_id, risk_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: implementations; Type: TABLE DATA; Schema: public; Owner: opengrc
--

COPY public.implementations (id, code, title, details, status, effectiveness, notes, test_procedure, deleted_at, created_at, updated_at, implementation_owner_id, test_plan) FROM stdin;
\.


--
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: opengrc
--

COPY public.jobs (id, queue, payload, attempts, reserved_at, available_at, created_at) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: opengrc
--

COPY public.migrations (id, migration, batch) FROM stdin;
1	2014_10_12_000000_create_users_table	1
2	2014_10_12_100000_create_password_reset_tokens_table	1
3	2019_08_19_000000_create_failed_jobs_table	1
4	2019_12_14_000001_create_personal_access_tokens_table	1
5	2024_01_24_203232_create_socialite_users_table	1
6	2024_01_25_224335_create_standards_table	1
7	2024_01_25_235552_create_controls_table	1
8	2024_01_26_003409_create_implementations_table	1
9	2024_01_26_011657_create_audits_table	1
10	2024_01_26_011706_create_audit_items_table	1
11	2024_01_26_050400_create_control_implementation_table	1
12	2024_01_26_202400_create_breezy_sessions_table	1
13	2024_02_04_015645_create_permission_tables	1
14	2024_02_04_023453_add_category_to_permissions_table	1
15	2024_02_04_041400_create_data_requests_table	1
16	2024_03_21_000000_create_risks_table	1
17	2024_03_21_000001_create_programs_table	1
18	2024_09_05_141604_create_general-settings_table	1
19	2024_09_15_173645_create_file_attachments_table	1
20	2024_09_24_175821_create_data_request_responses_table	1
21	2024_10_27_170857_create_settings_table	1
22	2024_11_24_232113_create_audit_member_table	1
23	2024_12_22_003114_create_bundles_table	1
24	2025_01_02_030728_add_description_to_roles	1
25	2025_04_18_000001_update_audits_table_add_program_id	1
26	2025_04_19_015310_add_type_to_bundles	1
27	2025_04_27_151137_create_cache_table	1
28	2025_05_30_000000_create_taxonomies_tables	1
29	2025_06_03_000001_create_vendors_table	1
30	2025_06_03_000002_create_applications_table	1
31	2025_06_04_121331_add_owner_columns_to_controls_and_implementations_table	1
32	2025_06_04_204157_add_test_plan_to_implementations	1
33	2025_06_10_000001_make_data_request_response_id_nullable_on_file_attachments_table	1
34	2025_06_11_195243_update_audit_related_tables_for_cascade_and_remove_softdeletes	1
35	2025_06_19_193729_add_vendor_application_permissions	1
36	2025_06_23_221807_create_jobs_table	1
37	2025_07_21_000000_add_code_to_data_requests_table	1
38	2025_09_02_184316_ensure_all_permissions_exist_and_assign_to_roles	1
39	2025_09_02_231928_add_taxonomy_permissions	1
40	2025_09_11_025409_add_cascade_delete_to_audit_user_table	1
41	2025_09_25_011941_create_activity_log_table	1
42	2025_09_25_011942_add_event_column_to_activity_log_table	1
43	2025_09_25_011943_add_batch_uuid_column_to_activity_log_table	1
44	2025_10_09_203827_create_audit_item_data_request_table	1
45	2025_10_10_003112_create_notifications_table	1
46	2025_10_14_151628_change_programs_description_to_longtext	1
47	2025_10_23_202858_create_assets_table	1
48	2025_10_23_204212_create_asset_implementation_table	1
\.


--
-- Data for Name: model_has_permissions; Type: TABLE DATA; Schema: public; Owner: opengrc
--

COPY public.model_has_permissions (permission_id, model_type, model_id) FROM stdin;
\.


--
-- Data for Name: model_has_roles; Type: TABLE DATA; Schema: public; Owner: opengrc
--

COPY public.model_has_roles (role_id, model_type, model_id) FROM stdin;
3	App\\Models\\User	1
\.


--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: opengrc
--

COPY public.notifications (id, type, notifiable_type, notifiable_id, data, read_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: password_reset_tokens; Type: TABLE DATA; Schema: public; Owner: opengrc
--

COPY public.password_reset_tokens (email, token, created_at) FROM stdin;
\.


--
-- Data for Name: permissions; Type: TABLE DATA; Schema: public; Owner: opengrc
--

COPY public.permissions (id, name, guard_name, created_at, updated_at, category) FROM stdin;
1	List Vendors	web	2025-10-27 07:44:13	2025-10-27 07:44:13	Vendors
2	Create Vendors	web	2025-10-27 07:44:13	2025-10-27 07:44:13	Vendors
3	Read Vendors	web	2025-10-27 07:44:13	2025-10-27 07:44:13	Vendors
4	Update Vendors	web	2025-10-27 07:44:13	2025-10-27 07:44:13	Vendors
5	Delete Vendors	web	2025-10-27 07:44:13	2025-10-27 07:44:13	Vendors
6	List Applications	web	2025-10-27 07:44:13	2025-10-27 07:44:13	Applications
7	Create Applications	web	2025-10-27 07:44:13	2025-10-27 07:44:13	Applications
8	Read Applications	web	2025-10-27 07:44:13	2025-10-27 07:44:13	Applications
9	Update Applications	web	2025-10-27 07:44:13	2025-10-27 07:44:13	Applications
10	Delete Applications	web	2025-10-27 07:44:13	2025-10-27 07:44:13	Applications
11	List Standards	web	2025-10-27 07:44:13	2025-10-27 07:44:13	Standards
12	Create Standards	web	2025-10-27 07:44:13	2025-10-27 07:44:13	Standards
13	Read Standards	web	2025-10-27 07:44:13	2025-10-27 07:44:13	Standards
14	Update Standards	web	2025-10-27 07:44:13	2025-10-27 07:44:13	Standards
15	Delete Standards	web	2025-10-27 07:44:13	2025-10-27 07:44:13	Standards
16	List Controls	web	2025-10-27 07:44:13	2025-10-27 07:44:13	Controls
17	Create Controls	web	2025-10-27 07:44:13	2025-10-27 07:44:13	Controls
18	Read Controls	web	2025-10-27 07:44:13	2025-10-27 07:44:13	Controls
19	Update Controls	web	2025-10-27 07:44:13	2025-10-27 07:44:13	Controls
20	Delete Controls	web	2025-10-27 07:44:13	2025-10-27 07:44:13	Controls
21	List Implementations	web	2025-10-27 07:44:13	2025-10-27 07:44:13	Implementations
22	Create Implementations	web	2025-10-27 07:44:13	2025-10-27 07:44:13	Implementations
23	Read Implementations	web	2025-10-27 07:44:13	2025-10-27 07:44:13	Implementations
24	Update Implementations	web	2025-10-27 07:44:13	2025-10-27 07:44:13	Implementations
25	Delete Implementations	web	2025-10-27 07:44:13	2025-10-27 07:44:13	Implementations
26	List Audits	web	2025-10-27 07:44:13	2025-10-27 07:44:13	Audits
27	Create Audits	web	2025-10-27 07:44:13	2025-10-27 07:44:13	Audits
28	Read Audits	web	2025-10-27 07:44:13	2025-10-27 07:44:13	Audits
29	Update Audits	web	2025-10-27 07:44:13	2025-10-27 07:44:13	Audits
30	Delete Audits	web	2025-10-27 07:44:13	2025-10-27 07:44:13	Audits
31	List AuditItems	web	2025-10-27 07:44:13	2025-10-27 07:44:13	AuditItems
32	Create AuditItems	web	2025-10-27 07:44:13	2025-10-27 07:44:13	AuditItems
33	Read AuditItems	web	2025-10-27 07:44:13	2025-10-27 07:44:13	AuditItems
34	Update AuditItems	web	2025-10-27 07:44:13	2025-10-27 07:44:13	AuditItems
35	Delete AuditItems	web	2025-10-27 07:44:13	2025-10-27 07:44:13	AuditItems
36	List Programs	web	2025-10-27 07:44:13	2025-10-27 07:44:13	Programs
37	Create Programs	web	2025-10-27 07:44:13	2025-10-27 07:44:13	Programs
38	Read Programs	web	2025-10-27 07:44:13	2025-10-27 07:44:13	Programs
39	Update Programs	web	2025-10-27 07:44:13	2025-10-27 07:44:13	Programs
40	Delete Programs	web	2025-10-27 07:44:13	2025-10-27 07:44:13	Programs
41	List Risks	web	2025-10-27 07:44:13	2025-10-27 07:44:13	Risks
42	Create Risks	web	2025-10-27 07:44:13	2025-10-27 07:44:13	Risks
43	Read Risks	web	2025-10-27 07:44:13	2025-10-27 07:44:13	Risks
44	Update Risks	web	2025-10-27 07:44:13	2025-10-27 07:44:13	Risks
45	Delete Risks	web	2025-10-27 07:44:13	2025-10-27 07:44:13	Risks
46	List DataRequests	web	2025-10-27 07:44:13	2025-10-27 07:44:13	DataRequests
47	Create DataRequests	web	2025-10-27 07:44:13	2025-10-27 07:44:13	DataRequests
48	Read DataRequests	web	2025-10-27 07:44:13	2025-10-27 07:44:13	DataRequests
49	Update DataRequests	web	2025-10-27 07:44:13	2025-10-27 07:44:13	DataRequests
50	Delete DataRequests	web	2025-10-27 07:44:13	2025-10-27 07:44:13	DataRequests
51	List DataRequestResponses	web	2025-10-27 07:44:13	2025-10-27 07:44:13	DataRequestResponses
52	Create DataRequestResponses	web	2025-10-27 07:44:13	2025-10-27 07:44:13	DataRequestResponses
53	Read DataRequestResponses	web	2025-10-27 07:44:13	2025-10-27 07:44:13	DataRequestResponses
54	Update DataRequestResponses	web	2025-10-27 07:44:13	2025-10-27 07:44:13	DataRequestResponses
55	Delete DataRequestResponses	web	2025-10-27 07:44:13	2025-10-27 07:44:13	DataRequestResponses
56	List FileAttachments	web	2025-10-27 07:44:13	2025-10-27 07:44:13	FileAttachments
57	Create FileAttachments	web	2025-10-27 07:44:13	2025-10-27 07:44:13	FileAttachments
58	Read FileAttachments	web	2025-10-27 07:44:13	2025-10-27 07:44:13	FileAttachments
59	Update FileAttachments	web	2025-10-27 07:44:13	2025-10-27 07:44:13	FileAttachments
60	Delete FileAttachments	web	2025-10-27 07:44:13	2025-10-27 07:44:13	FileAttachments
61	Configure Authentication	web	2025-10-27 07:44:13	2025-10-27 07:44:13	other
62	Manage Users	web	2025-10-27 07:44:13	2025-10-27 07:44:13	other
63	View Audit Log	web	2025-10-27 07:44:13	2025-10-27 07:44:13	other
64	Manage Preferences	web	2025-10-27 07:44:13	2025-10-27 07:44:13	other
65	Manage Bundles	web	2025-10-27 07:44:13	2025-10-27 07:44:13	Bundles
66	View Bundles	web	2025-10-27 07:44:13	2025-10-27 07:44:13	Bundles
67	List Taxonomy	web	2025-10-27 07:44:13	2025-10-27 07:44:13	Taxonomy
68	Create Taxonomy	web	2025-10-27 07:44:13	2025-10-27 07:44:13	Taxonomy
69	Read Taxonomy	web	2025-10-27 07:44:13	2025-10-27 07:44:13	Taxonomy
70	Update Taxonomy	web	2025-10-27 07:44:13	2025-10-27 07:44:13	Taxonomy
71	Delete Taxonomy	web	2025-10-27 07:44:13	2025-10-27 07:44:13	Taxonomy
\.


--
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: public; Owner: opengrc
--

COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: program_risk; Type: TABLE DATA; Schema: public; Owner: opengrc
--

COPY public.program_risk (id, program_id, risk_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: program_standard; Type: TABLE DATA; Schema: public; Owner: opengrc
--

COPY public.program_standard (id, program_id, standard_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: programs; Type: TABLE DATA; Schema: public; Owner: opengrc
--

COPY public.programs (id, name, description, program_manager_id, last_audit_date, scope_status, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: risks; Type: TABLE DATA; Schema: public; Owner: opengrc
--

COPY public.risks (id, name, code, description, status, inherent_likelihood, inherent_impact, residual_likelihood, residual_impact, inherent_risk, residual_risk, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: role_has_permissions; Type: TABLE DATA; Schema: public; Owner: opengrc
--

COPY public.role_has_permissions (permission_id, role_id) FROM stdin;
1	3
2	3
3	3
4	3
5	3
6	3
7	3
8	3
9	3
10	3
11	3
12	3
13	3
14	3
15	3
16	3
17	3
18	3
19	3
20	3
21	3
22	3
23	3
24	3
25	3
26	3
27	3
28	3
29	3
30	3
31	3
32	3
33	3
34	3
35	3
36	3
37	3
38	3
39	3
40	3
41	3
42	3
43	3
44	3
45	3
46	3
47	3
48	3
49	3
50	3
51	3
52	3
53	3
54	3
55	3
56	3
57	3
58	3
59	3
60	3
61	3
62	3
63	3
64	3
65	3
66	3
67	3
68	3
69	3
70	3
71	3
11	2
13	2
16	2
18	2
21	2
23	2
26	2
28	2
31	2
33	2
36	2
38	2
1	2
3	2
6	2
8	2
41	2
43	2
46	2
48	2
51	2
53	2
56	2
58	2
11	4
12	4
13	4
14	4
16	4
17	4
18	4
19	4
21	4
22	4
23	4
24	4
26	4
27	4
28	4
29	4
31	4
32	4
33	4
34	4
36	4
37	4
38	4
39	4
1	4
2	4
3	4
4	4
6	4
7	4
8	4
9	4
41	4
42	4
43	4
44	4
46	4
47	4
48	4
49	4
51	4
52	4
53	4
54	4
56	4
57	4
58	4
59	4
64	4
66	4
26	5
28	5
11	5
13	5
16	5
18	5
21	5
23	5
36	5
38	5
27	5
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: opengrc
--

COPY public.roles (id, name, guard_name, created_at, updated_at, description) FROM stdin;
1	None	web	2025-10-27 07:44:14	2025-10-27 07:44:14	\N
2	Regular User	web	2025-10-27 07:44:14	2025-10-27 07:44:14	Read-Only-Responder User
3	Super Admin	web	2025-10-27 07:44:14	2025-10-27 07:44:14	Super User with all permissions
4	Security Admin	web	2025-10-27 07:44:14	2025-10-27 07:44:14	Able to Edit all data and run Audits but not manage users
5	Internal Auditor	web	2025-10-27 07:44:14	2025-10-27 07:44:14	Able to run Audits but not edit other foundational data
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: opengrc
--

COPY public.settings (id, key, value, created_at, updated_at) FROM stdin;
1	general.name	"OpenGRC"	\N	\N
3	general.repo	"https:\\/\\/repo.opengrc.com"	\N	\N
4	mail.host	"smtp.mailtrap.io"	\N	\N
5	mail.username	"username"	\N	\N
6	mail.password	"password"	\N	\N
7	mail.encryption	"tls"	\N	\N
8	mail.port	"2525"	\N	\N
9	mail.from	"no-reply@opengrc.com"	\N	\N
10	mail.templates.password_reset_subject	"OpenGRC Password Reset"	\N	\N
11	mail.templates.password_reset_body	"<!DOCTYPE html>\\n<html>\\n<head>\\n    <title>Account Created<\\/title>\\n<\\/head>\\n<body>\\n<h1>OpenGRC Password Reset<\\/h1>\\n<p>Hello, {{ $name }}!<\\/p>\\n<p>An administrator has performed a password reset on your account. <\\/p>\\n<p>Your temporary login details are:<\\/p>\\n<ul>\\n    <li><strong>URL:<\\/strong> {{ $url }}<\\/li>\\n    <li><strong>Email:<\\/strong> {{ $email }}<\\/li>\\n    <li><strong>Password:<\\/strong> {{ $password }}<\\/li>\\n<\\/ul>\\n<p>After logging in you will be prompted to change your password. You will then be asked to re-login with your new secret password before continuing.<\\/p>\\n<\\/body>\\n<\\/html>"	\N	\N
12	mail.templates.new_account_subject	"OpenGRC Account Created"	\N	\N
13	mail.templates.new_account_body	"<!DOCTYPE html>\\n<html>\\n<head>\\n    <title>Account Created<\\/title>\\n<\\/head>\\n<body>\\n<h1>OpenGRC Account Created<\\/h1>\\n<p>Hello, {{ $name }}!<\\/p>\\n<p>An OpenGRC account has been created for you. You may your account using the credentials provided below. <\\/p>\\n<p>Your login details are:<\\/p>\\n<ul>\\n    <li><strong>URL:<\\/strong> {{ $url }}<\\/li>\\n    <li><strong>Email:<\\/strong> {{ $email }}<\\/li>\\n    <li><strong>Password:<\\/strong> {{ $password }}<\\/li>\\n<\\/ul>\\n<p>After logging in you will be prompted to change your password. You will then be asked to re-login with your new secret password before continuing.<\\/p>\\n<\\/body>\\n<\\/html>"	\N	\N
14	mail.templates.evidence_request_subject	"OpenGRC Evidence Request"	\N	\N
15	mail.templates.evidence_request_body	"<h1>OpenGRC Evidence Requested<\\/h1><p>Hello, {{ $name }}!<\\/p><p>An auditor has requested evidence from you. Please login to OpenGRC to view the request and provide the necessary evidence.<\\/p><p><strong>URL:<\\/strong> {{ $url }}<\\/p><p>Thank you for your cooperation.<\\/p><p><br><\\/p><p><br><\\/p>"	\N	\N
16	security.session_timeout	"15"	\N	\N
2	general.url	"http:\\/\\/localhost:8080"	\N	2025-10-27 07:44:16
17	storage.driver	"private"	2025-10-27 07:44:16	2025-10-27 07:44:16
\.


--
-- Data for Name: socialite_users; Type: TABLE DATA; Schema: public; Owner: opengrc
--

COPY public.socialite_users (id, user_id, provider, provider_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: standards; Type: TABLE DATA; Schema: public; Owner: opengrc
--

COPY public.standards (id, name, description, code, authority, reference_url, status, deleted_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: taxonomables; Type: TABLE DATA; Schema: public; Owner: opengrc
--

COPY public.taxonomables (id, taxonomy_id, taxonomable_type, taxonomable_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: taxonomies; Type: TABLE DATA; Schema: public; Owner: opengrc
--

COPY public.taxonomies (id, name, slug, type, description, parent_id, sort_order, lft, rgt, depth, meta, created_at, updated_at, deleted_at) FROM stdin;
1	Scope	scope	scope	Organizational scope categories	\N	0	1	4	0	\N	2025-10-27 07:44:13	2025-10-27 07:44:13	\N
2	Global	global	scope	Global scope	1	0	2	3	1	\N	2025-10-27 07:44:13	2025-10-27 07:44:13	\N
3	Department	department	department	Organizational departments	\N	0	1	4	0	\N	2025-10-27 07:44:13	2025-10-27 07:44:13	\N
4	Security	security	department	Security department	3	0	2	3	1	\N	2025-10-27 07:44:13	2025-10-27 07:44:13	\N
6	Laptop	laptop	asset	Portable laptop computer	5	1	2	3	1	\N	2025-10-27 07:44:13	2025-10-27 07:44:13	\N
7	Desktop	desktop	asset	Desktop computer workstation	5	2	4	5	1	\N	2025-10-27 07:44:13	2025-10-27 07:44:13	\N
8	Server	server	asset	Server hardware	5	3	6	7	1	\N	2025-10-27 07:44:13	2025-10-27 07:44:13	\N
9	Monitor	monitor	asset	Display monitor	5	4	8	9	1	\N	2025-10-27 07:44:13	2025-10-27 07:44:13	\N
10	Phone	phone	asset	Mobile phone or desk phone	5	5	10	11	1	\N	2025-10-27 07:44:13	2025-10-27 07:44:13	\N
11	Tablet	tablet	asset	Tablet device	5	6	12	13	1	\N	2025-10-27 07:44:13	2025-10-27 07:44:13	\N
12	Network Equipment	network-equipment	asset	Routers, switches, access points	5	7	14	15	1	\N	2025-10-27 07:44:13	2025-10-27 07:44:13	\N
13	Peripheral	peripheral	asset	Keyboard, mouse, printer, etc.	5	8	16	17	1	\N	2025-10-27 07:44:13	2025-10-27 07:44:13	\N
14	Software License	software-license	asset	Software licensing asset	5	9	18	19	1	\N	2025-10-27 07:44:14	2025-10-27 07:44:14	\N
5	Asset Type	asset-type	asset	Categories of IT assets	\N	1	1	22	0	\N	2025-10-27 07:44:13	2025-10-27 07:44:14	\N
15	Other	other	asset	Other IT asset type	5	10	20	21	1	\N	2025-10-27 07:44:14	2025-10-27 07:44:14	\N
17	Available	available	asset	Asset is available for assignment	16	1	24	25	1	\N	2025-10-27 07:44:14	2025-10-27 07:44:14	\N
18	In Use	in-use	asset	Asset is currently assigned and in use	16	2	26	27	1	\N	2025-10-27 07:44:14	2025-10-27 07:44:14	\N
19	In Repair	in-repair	asset	Asset is being repaired	16	3	28	29	1	\N	2025-10-27 07:44:14	2025-10-27 07:44:14	\N
20	Retired	retired	asset	Asset has been retired from service	16	4	30	31	1	\N	2025-10-27 07:44:14	2025-10-27 07:44:14	\N
21	Lost	lost	asset	Asset has been lost	16	5	32	33	1	\N	2025-10-27 07:44:14	2025-10-27 07:44:14	\N
22	Stolen	stolen	asset	Asset has been stolen	16	6	34	35	1	\N	2025-10-27 07:44:14	2025-10-27 07:44:14	\N
16	Asset Status	asset-status	asset	Current status of assets	\N	2	23	38	0	\N	2025-10-27 07:44:14	2025-10-27 07:44:14	\N
23	Disposed	disposed	asset	Asset has been disposed of	16	7	36	37	1	\N	2025-10-27 07:44:14	2025-10-27 07:44:14	\N
25	Excellent	excellent	asset	Asset is in excellent condition	24	1	40	41	1	\N	2025-10-27 07:44:14	2025-10-27 07:44:14	\N
26	Good	good	asset	Asset is in good condition	24	2	42	43	1	\N	2025-10-27 07:44:14	2025-10-27 07:44:14	\N
27	Fair	fair	asset	Asset is in fair condition with minor wear	24	3	44	45	1	\N	2025-10-27 07:44:14	2025-10-27 07:44:14	\N
28	Poor	poor	asset	Asset is in poor condition	24	4	46	47	1	\N	2025-10-27 07:44:14	2025-10-27 07:44:14	\N
24	Asset Condition	asset-condition	asset	Physical condition of assets	\N	3	39	50	0	\N	2025-10-27 07:44:14	2025-10-27 07:44:14	\N
29	Damaged	damaged	asset	Asset is damaged	24	5	48	49	1	\N	2025-10-27 07:44:14	2025-10-27 07:44:14	\N
31	Compliant	compliant	asset	Asset meets all compliance requirements	30	1	52	53	1	\N	2025-10-27 07:44:14	2025-10-27 07:44:14	\N
32	Non-Compliant	non-compliant	asset	Asset does not meet compliance requirements	30	2	54	55	1	\N	2025-10-27 07:44:14	2025-10-27 07:44:14	\N
33	Exempt	exempt	asset	Asset is exempt from compliance requirements	30	3	56	57	1	\N	2025-10-27 07:44:14	2025-10-27 07:44:14	\N
30	Compliance Status	compliance-status	asset	Compliance status of assets	\N	4	51	60	0	\N	2025-10-27 07:44:14	2025-10-27 07:44:14	\N
34	Pending	pending	asset	Compliance status is being reviewed	30	4	58	59	1	\N	2025-10-27 07:44:14	2025-10-27 07:44:14	\N
36	Public	public	asset	Information intended for public disclosure	35	1	62	63	1	\N	2025-10-27 07:44:14	2025-10-27 07:44:14	\N
37	Internal	internal	asset	Information for internal use only	35	2	64	65	1	\N	2025-10-27 07:44:14	2025-10-27 07:44:14	\N
38	Confidential	confidential	asset	Sensitive business information	35	3	66	67	1	\N	2025-10-27 07:44:14	2025-10-27 07:44:14	\N
35	Data Classification	data-classification	asset	Data sensitivity classification levels	\N	5	61	70	0	\N	2025-10-27 07:44:14	2025-10-27 07:44:14	\N
39	Restricted	restricted	asset	Highly sensitive, regulated information	35	4	68	69	1	\N	2025-10-27 07:44:14	2025-10-27 07:44:14	\N
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: opengrc
--

COPY public.users (id, name, email, email_verified_at, password, password_reset_required, remember_token, deleted_at, created_at, updated_at, last_activity) FROM stdin;
1	admin@panarub.co.id	admin@panarub.co.id	\N	$2y$12$q..LFgQ0/s69hgbnWae6au1n1QYwmch89bq/x9Xb7UZ/XUhFeRV/O	f	\N	\N	2025-10-27 07:44:14	2025-10-27 07:44:14	\N
\.


--
-- Data for Name: vendors; Type: TABLE DATA; Schema: public; Owner: opengrc
--

COPY public.vendors (id, name, description, url, logo, vendor_manager_id, status, risk_rating, notes, deleted_at, created_at, updated_at) FROM stdin;
\.


--
-- Name: activity_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: opengrc
--

SELECT pg_catalog.setval('public.activity_log_id_seq', 1, true);


--
-- Name: applications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: opengrc
--

SELECT pg_catalog.setval('public.applications_id_seq', 1, false);


--
-- Name: asset_implementation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: opengrc
--

SELECT pg_catalog.setval('public.asset_implementation_id_seq', 1, false);


--
-- Name: assets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: opengrc
--

SELECT pg_catalog.setval('public.assets_id_seq', 1, false);


--
-- Name: audit_item_data_request_id_seq; Type: SEQUENCE SET; Schema: public; Owner: opengrc
--

SELECT pg_catalog.setval('public.audit_item_data_request_id_seq', 1, false);


--
-- Name: audit_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: opengrc
--

SELECT pg_catalog.setval('public.audit_items_id_seq', 1, false);


--
-- Name: audits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: opengrc
--

SELECT pg_catalog.setval('public.audits_id_seq', 1, false);


--
-- Name: breezy_sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: opengrc
--

SELECT pg_catalog.setval('public.breezy_sessions_id_seq', 1, false);


--
-- Name: bundles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: opengrc
--

SELECT pg_catalog.setval('public.bundles_id_seq', 1, false);


--
-- Name: control_program_id_seq; Type: SEQUENCE SET; Schema: public; Owner: opengrc
--

SELECT pg_catalog.setval('public.control_program_id_seq', 1, false);


--
-- Name: controls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: opengrc
--

SELECT pg_catalog.setval('public.controls_id_seq', 1, false);


--
-- Name: data_request_responses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: opengrc
--

SELECT pg_catalog.setval('public.data_request_responses_id_seq', 1, false);


--
-- Name: data_requests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: opengrc
--

SELECT pg_catalog.setval('public.data_requests_id_seq', 1, false);


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: opengrc
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- Name: file_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: opengrc
--

SELECT pg_catalog.setval('public.file_attachments_id_seq', 1, false);


--
-- Name: general_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: opengrc
--

SELECT pg_catalog.setval('public.general_settings_id_seq', 1, false);


--
-- Name: implementation_risk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: opengrc
--

SELECT pg_catalog.setval('public.implementation_risk_id_seq', 1, false);


--
-- Name: implementations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: opengrc
--

SELECT pg_catalog.setval('public.implementations_id_seq', 1, false);


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: opengrc
--

SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: opengrc
--

SELECT pg_catalog.setval('public.migrations_id_seq', 48, true);


--
-- Name: permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: opengrc
--

SELECT pg_catalog.setval('public.permissions_id_seq', 71, true);


--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: opengrc
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 1, false);


--
-- Name: program_risk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: opengrc
--

SELECT pg_catalog.setval('public.program_risk_id_seq', 1, false);


--
-- Name: program_standard_id_seq; Type: SEQUENCE SET; Schema: public; Owner: opengrc
--

SELECT pg_catalog.setval('public.program_standard_id_seq', 1, false);


--
-- Name: programs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: opengrc
--

SELECT pg_catalog.setval('public.programs_id_seq', 1, false);


--
-- Name: risks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: opengrc
--

SELECT pg_catalog.setval('public.risks_id_seq', 1, false);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: opengrc
--

SELECT pg_catalog.setval('public.roles_id_seq', 5, true);


--
-- Name: settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: opengrc
--

SELECT pg_catalog.setval('public.settings_id_seq', 17, true);


--
-- Name: socialite_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: opengrc
--

SELECT pg_catalog.setval('public.socialite_users_id_seq', 1, false);


--
-- Name: standards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: opengrc
--

SELECT pg_catalog.setval('public.standards_id_seq', 1, false);


--
-- Name: taxonomables_id_seq; Type: SEQUENCE SET; Schema: public; Owner: opengrc
--

SELECT pg_catalog.setval('public.taxonomables_id_seq', 1, false);


--
-- Name: taxonomies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: opengrc
--

SELECT pg_catalog.setval('public.taxonomies_id_seq', 39, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: opengrc
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- Name: vendors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: opengrc
--

SELECT pg_catalog.setval('public.vendors_id_seq', 1, false);


--
-- Name: activity_log activity_log_pkey; Type: CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.activity_log
    ADD CONSTRAINT activity_log_pkey PRIMARY KEY (id);


--
-- Name: applications applications_pkey; Type: CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_pkey PRIMARY KEY (id);


--
-- Name: asset_implementation asset_implementation_asset_id_implementation_id_unique; Type: CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.asset_implementation
    ADD CONSTRAINT asset_implementation_asset_id_implementation_id_unique UNIQUE (asset_id, implementation_id);


--
-- Name: asset_implementation asset_implementation_pkey; Type: CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.asset_implementation
    ADD CONSTRAINT asset_implementation_pkey PRIMARY KEY (id);


--
-- Name: assets assets_asset_tag_unique; Type: CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.assets
    ADD CONSTRAINT assets_asset_tag_unique UNIQUE (asset_tag);


--
-- Name: assets assets_pkey; Type: CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.assets
    ADD CONSTRAINT assets_pkey PRIMARY KEY (id);


--
-- Name: audit_item_data_request audit_item_data_request_audit_item_id_data_request_id_unique; Type: CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.audit_item_data_request
    ADD CONSTRAINT audit_item_data_request_audit_item_id_data_request_id_unique UNIQUE (audit_item_id, data_request_id);


--
-- Name: audit_item_data_request audit_item_data_request_pkey; Type: CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.audit_item_data_request
    ADD CONSTRAINT audit_item_data_request_pkey PRIMARY KEY (id);


--
-- Name: audit_items audit_items_pkey; Type: CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.audit_items
    ADD CONSTRAINT audit_items_pkey PRIMARY KEY (id);


--
-- Name: audit_user audit_user_pkey; Type: CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.audit_user
    ADD CONSTRAINT audit_user_pkey PRIMARY KEY (audit_id, user_id);


--
-- Name: audits audits_pkey; Type: CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.audits
    ADD CONSTRAINT audits_pkey PRIMARY KEY (id);


--
-- Name: breezy_sessions breezy_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.breezy_sessions
    ADD CONSTRAINT breezy_sessions_pkey PRIMARY KEY (id);


--
-- Name: bundles bundles_code_unique; Type: CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.bundles
    ADD CONSTRAINT bundles_code_unique UNIQUE (code);


--
-- Name: bundles bundles_pkey; Type: CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.bundles
    ADD CONSTRAINT bundles_pkey PRIMARY KEY (id);


--
-- Name: cache_locks cache_locks_pkey; Type: CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.cache_locks
    ADD CONSTRAINT cache_locks_pkey PRIMARY KEY (key);


--
-- Name: cache cache_pkey; Type: CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.cache
    ADD CONSTRAINT cache_pkey PRIMARY KEY (key);


--
-- Name: control_implementation control_implementation_pkey; Type: CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.control_implementation
    ADD CONSTRAINT control_implementation_pkey PRIMARY KEY (control_id, implementation_id);


--
-- Name: control_program control_program_pkey; Type: CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.control_program
    ADD CONSTRAINT control_program_pkey PRIMARY KEY (id);


--
-- Name: controls controls_pkey; Type: CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.controls
    ADD CONSTRAINT controls_pkey PRIMARY KEY (id);


--
-- Name: data_request_responses data_request_responses_pkey; Type: CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.data_request_responses
    ADD CONSTRAINT data_request_responses_pkey PRIMARY KEY (id);


--
-- Name: data_requests data_requests_pkey; Type: CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.data_requests
    ADD CONSTRAINT data_requests_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- Name: file_attachments file_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.file_attachments
    ADD CONSTRAINT file_attachments_pkey PRIMARY KEY (id);


--
-- Name: general_settings general_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.general_settings
    ADD CONSTRAINT general_settings_pkey PRIMARY KEY (id);


--
-- Name: implementation_risk implementation_risk_pkey; Type: CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.implementation_risk
    ADD CONSTRAINT implementation_risk_pkey PRIMARY KEY (id);


--
-- Name: implementations implementations_pkey; Type: CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.implementations
    ADD CONSTRAINT implementations_pkey PRIMARY KEY (id);


--
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: model_has_permissions model_has_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.model_has_permissions
    ADD CONSTRAINT model_has_permissions_pkey PRIMARY KEY (permission_id, model_id, model_type);


--
-- Name: model_has_roles model_has_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.model_has_roles
    ADD CONSTRAINT model_has_roles_pkey PRIMARY KEY (role_id, model_id, model_type);


--
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- Name: password_reset_tokens password_reset_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);


--
-- Name: permissions permissions_name_guard_name_unique; Type: CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_guard_name_unique UNIQUE (name, guard_name);


--
-- Name: permissions permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);


--
-- Name: personal_access_tokens personal_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);


--
-- Name: personal_access_tokens personal_access_tokens_token_unique; Type: CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);


--
-- Name: program_risk program_risk_pkey; Type: CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.program_risk
    ADD CONSTRAINT program_risk_pkey PRIMARY KEY (id);


--
-- Name: program_standard program_standard_pkey; Type: CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.program_standard
    ADD CONSTRAINT program_standard_pkey PRIMARY KEY (id);


--
-- Name: programs programs_pkey; Type: CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.programs
    ADD CONSTRAINT programs_pkey PRIMARY KEY (id);


--
-- Name: risks risks_code_unique; Type: CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.risks
    ADD CONSTRAINT risks_code_unique UNIQUE (code);


--
-- Name: risks risks_pkey; Type: CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.risks
    ADD CONSTRAINT risks_pkey PRIMARY KEY (id);


--
-- Name: role_has_permissions role_has_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_pkey PRIMARY KEY (permission_id, role_id);


--
-- Name: roles roles_name_guard_name_unique; Type: CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_guard_name_unique UNIQUE (name, guard_name);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: settings settings_key_unique; Type: CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_key_unique UNIQUE (key);


--
-- Name: settings settings_pkey; Type: CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (id);


--
-- Name: socialite_users socialite_users_pkey; Type: CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.socialite_users
    ADD CONSTRAINT socialite_users_pkey PRIMARY KEY (id);


--
-- Name: socialite_users socialite_users_provider_provider_id_unique; Type: CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.socialite_users
    ADD CONSTRAINT socialite_users_provider_provider_id_unique UNIQUE (provider, provider_id);


--
-- Name: standards standards_pkey; Type: CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.standards
    ADD CONSTRAINT standards_pkey PRIMARY KEY (id);


--
-- Name: taxonomables taxonomables_pkey; Type: CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.taxonomables
    ADD CONSTRAINT taxonomables_pkey PRIMARY KEY (id);


--
-- Name: taxonomies taxonomies_pkey; Type: CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.taxonomies
    ADD CONSTRAINT taxonomies_pkey PRIMARY KEY (id);


--
-- Name: taxonomies taxonomies_slug_type_unique; Type: CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.taxonomies
    ADD CONSTRAINT taxonomies_slug_type_unique UNIQUE (slug, type);


--
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: vendors vendors_pkey; Type: CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.vendors
    ADD CONSTRAINT vendors_pkey PRIMARY KEY (id);


--
-- Name: activity_log_log_name_index; Type: INDEX; Schema: public; Owner: opengrc
--

CREATE INDEX activity_log_log_name_index ON public.activity_log USING btree (log_name);


--
-- Name: assets_hostname_index; Type: INDEX; Schema: public; Owner: opengrc
--

CREATE INDEX assets_hostname_index ON public.assets USING btree (hostname);


--
-- Name: assets_ip_address_index; Type: INDEX; Schema: public; Owner: opengrc
--

CREATE INDEX assets_ip_address_index ON public.assets USING btree (ip_address);


--
-- Name: assets_mac_address_index; Type: INDEX; Schema: public; Owner: opengrc
--

CREATE INDEX assets_mac_address_index ON public.assets USING btree (mac_address);


--
-- Name: assets_serial_number_index; Type: INDEX; Schema: public; Owner: opengrc
--

CREATE INDEX assets_serial_number_index ON public.assets USING btree (serial_number);


--
-- Name: breezy_sessions_authenticatable_type_authenticatable_id_index; Type: INDEX; Schema: public; Owner: opengrc
--

CREATE INDEX breezy_sessions_authenticatable_type_authenticatable_id_index ON public.breezy_sessions USING btree (authenticatable_type, authenticatable_id);


--
-- Name: causer; Type: INDEX; Schema: public; Owner: opengrc
--

CREATE INDEX causer ON public.activity_log USING btree (causer_type, causer_id);


--
-- Name: jobs_queue_index; Type: INDEX; Schema: public; Owner: opengrc
--

CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);


--
-- Name: model_has_permissions_model_id_model_type_index; Type: INDEX; Schema: public; Owner: opengrc
--

CREATE INDEX model_has_permissions_model_id_model_type_index ON public.model_has_permissions USING btree (model_id, model_type);


--
-- Name: model_has_roles_model_id_model_type_index; Type: INDEX; Schema: public; Owner: opengrc
--

CREATE INDEX model_has_roles_model_id_model_type_index ON public.model_has_roles USING btree (model_id, model_type);


--
-- Name: notifications_notifiable_type_notifiable_id_index; Type: INDEX; Schema: public; Owner: opengrc
--

CREATE INDEX notifications_notifiable_type_notifiable_id_index ON public.notifications USING btree (notifiable_type, notifiable_id);


--
-- Name: personal_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: public; Owner: opengrc
--

CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);


--
-- Name: subject; Type: INDEX; Schema: public; Owner: opengrc
--

CREATE INDEX subject ON public.activity_log USING btree (subject_type, subject_id);


--
-- Name: taxonomables_taxonomable_type_taxonomable_id_index; Type: INDEX; Schema: public; Owner: opengrc
--

CREATE INDEX taxonomables_taxonomable_type_taxonomable_id_index ON public.taxonomables USING btree (taxonomable_type, taxonomable_id);


--
-- Name: taxonomies_depth_index; Type: INDEX; Schema: public; Owner: opengrc
--

CREATE INDEX taxonomies_depth_index ON public.taxonomies USING btree (depth);


--
-- Name: taxonomies_lft_index; Type: INDEX; Schema: public; Owner: opengrc
--

CREATE INDEX taxonomies_lft_index ON public.taxonomies USING btree (lft);


--
-- Name: taxonomies_rgt_index; Type: INDEX; Schema: public; Owner: opengrc
--

CREATE INDEX taxonomies_rgt_index ON public.taxonomies USING btree (rgt);


--
-- Name: taxonomies_type_index; Type: INDEX; Schema: public; Owner: opengrc
--

CREATE INDEX taxonomies_type_index ON public.taxonomies USING btree (type);


--
-- Name: taxonomies_type_lft_rgt_index; Type: INDEX; Schema: public; Owner: opengrc
--

CREATE INDEX taxonomies_type_lft_rgt_index ON public.taxonomies USING btree (type, lft, rgt);


--
-- Name: applications applications_owner_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_owner_id_foreign FOREIGN KEY (owner_id) REFERENCES public.users(id);


--
-- Name: applications applications_vendor_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_vendor_id_foreign FOREIGN KEY (vendor_id) REFERENCES public.vendors(id);


--
-- Name: asset_implementation asset_implementation_asset_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.asset_implementation
    ADD CONSTRAINT asset_implementation_asset_id_foreign FOREIGN KEY (asset_id) REFERENCES public.assets(id) ON DELETE CASCADE;


--
-- Name: asset_implementation asset_implementation_implementation_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.asset_implementation
    ADD CONSTRAINT asset_implementation_implementation_id_foreign FOREIGN KEY (implementation_id) REFERENCES public.implementations(id) ON DELETE CASCADE;


--
-- Name: assets assets_asset_type_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.assets
    ADD CONSTRAINT assets_asset_type_id_foreign FOREIGN KEY (asset_type_id) REFERENCES public.taxonomies(id) ON DELETE CASCADE;


--
-- Name: assets assets_assigned_to_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.assets
    ADD CONSTRAINT assets_assigned_to_user_id_foreign FOREIGN KEY (assigned_to_user_id) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: assets assets_compliance_status_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.assets
    ADD CONSTRAINT assets_compliance_status_id_foreign FOREIGN KEY (compliance_status_id) REFERENCES public.taxonomies(id) ON DELETE CASCADE;


--
-- Name: assets assets_condition_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.assets
    ADD CONSTRAINT assets_condition_id_foreign FOREIGN KEY (condition_id) REFERENCES public.taxonomies(id) ON DELETE CASCADE;


--
-- Name: assets assets_created_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.assets
    ADD CONSTRAINT assets_created_by_foreign FOREIGN KEY (created_by) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: assets assets_data_classification_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.assets
    ADD CONSTRAINT assets_data_classification_id_foreign FOREIGN KEY (data_classification_id) REFERENCES public.taxonomies(id) ON DELETE CASCADE;


--
-- Name: assets assets_parent_asset_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.assets
    ADD CONSTRAINT assets_parent_asset_id_foreign FOREIGN KEY (parent_asset_id) REFERENCES public.assets(id) ON DELETE SET NULL;


--
-- Name: assets assets_status_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.assets
    ADD CONSTRAINT assets_status_id_foreign FOREIGN KEY (status_id) REFERENCES public.taxonomies(id) ON DELETE CASCADE;


--
-- Name: assets assets_updated_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.assets
    ADD CONSTRAINT assets_updated_by_foreign FOREIGN KEY (updated_by) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: audit_item_data_request audit_item_data_request_audit_item_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.audit_item_data_request
    ADD CONSTRAINT audit_item_data_request_audit_item_id_foreign FOREIGN KEY (audit_item_id) REFERENCES public.audit_items(id) ON DELETE CASCADE;


--
-- Name: audit_item_data_request audit_item_data_request_data_request_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.audit_item_data_request
    ADD CONSTRAINT audit_item_data_request_data_request_id_foreign FOREIGN KEY (data_request_id) REFERENCES public.data_requests(id) ON DELETE CASCADE;


--
-- Name: audit_items audit_items_audit_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.audit_items
    ADD CONSTRAINT audit_items_audit_id_foreign FOREIGN KEY (audit_id) REFERENCES public.audits(id) ON DELETE CASCADE;


--
-- Name: audit_items audit_items_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.audit_items
    ADD CONSTRAINT audit_items_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: audit_user audit_user_audit_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.audit_user
    ADD CONSTRAINT audit_user_audit_id_foreign FOREIGN KEY (audit_id) REFERENCES public.audits(id) ON DELETE CASCADE;


--
-- Name: audit_user audit_user_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.audit_user
    ADD CONSTRAINT audit_user_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: audits audits_manager_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.audits
    ADD CONSTRAINT audits_manager_id_foreign FOREIGN KEY (manager_id) REFERENCES public.users(id);


--
-- Name: audits audits_program_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.audits
    ADD CONSTRAINT audits_program_id_foreign FOREIGN KEY (program_id) REFERENCES public.programs(id) ON DELETE SET NULL;


--
-- Name: control_implementation control_implementation_control_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.control_implementation
    ADD CONSTRAINT control_implementation_control_id_foreign FOREIGN KEY (control_id) REFERENCES public.controls(id) ON DELETE CASCADE;


--
-- Name: control_implementation control_implementation_implementation_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.control_implementation
    ADD CONSTRAINT control_implementation_implementation_id_foreign FOREIGN KEY (implementation_id) REFERENCES public.implementations(id) ON DELETE CASCADE;


--
-- Name: control_program control_program_control_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.control_program
    ADD CONSTRAINT control_program_control_id_foreign FOREIGN KEY (control_id) REFERENCES public.controls(id) ON DELETE CASCADE;


--
-- Name: control_program control_program_program_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.control_program
    ADD CONSTRAINT control_program_program_id_foreign FOREIGN KEY (program_id) REFERENCES public.programs(id) ON DELETE CASCADE;


--
-- Name: controls controls_control_owner_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.controls
    ADD CONSTRAINT controls_control_owner_id_foreign FOREIGN KEY (control_owner_id) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: controls controls_standard_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.controls
    ADD CONSTRAINT controls_standard_id_foreign FOREIGN KEY (standard_id) REFERENCES public.standards(id) ON DELETE CASCADE;


--
-- Name: data_request_responses data_request_responses_data_request_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.data_request_responses
    ADD CONSTRAINT data_request_responses_data_request_id_foreign FOREIGN KEY (data_request_id) REFERENCES public.data_requests(id) ON DELETE CASCADE;


--
-- Name: data_request_responses data_request_responses_requestee_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.data_request_responses
    ADD CONSTRAINT data_request_responses_requestee_id_foreign FOREIGN KEY (requestee_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: data_request_responses data_request_responses_requester_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.data_request_responses
    ADD CONSTRAINT data_request_responses_requester_id_foreign FOREIGN KEY (requester_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: data_requests data_requests_assigned_to_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.data_requests
    ADD CONSTRAINT data_requests_assigned_to_id_foreign FOREIGN KEY (assigned_to_id) REFERENCES public.users(id);


--
-- Name: data_requests data_requests_audit_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.data_requests
    ADD CONSTRAINT data_requests_audit_id_foreign FOREIGN KEY (audit_id) REFERENCES public.audits(id) ON DELETE CASCADE;


--
-- Name: data_requests data_requests_audit_item_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.data_requests
    ADD CONSTRAINT data_requests_audit_item_id_foreign FOREIGN KEY (audit_item_id) REFERENCES public.audit_items(id) ON DELETE CASCADE;


--
-- Name: data_requests data_requests_created_by_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.data_requests
    ADD CONSTRAINT data_requests_created_by_id_foreign FOREIGN KEY (created_by_id) REFERENCES public.users(id);


--
-- Name: file_attachments file_attachments_audit_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.file_attachments
    ADD CONSTRAINT file_attachments_audit_id_foreign FOREIGN KEY (audit_id) REFERENCES public.audits(id) ON DELETE CASCADE;


--
-- Name: implementation_risk implementation_risk_implementation_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.implementation_risk
    ADD CONSTRAINT implementation_risk_implementation_id_foreign FOREIGN KEY (implementation_id) REFERENCES public.implementations(id);


--
-- Name: implementation_risk implementation_risk_risk_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.implementation_risk
    ADD CONSTRAINT implementation_risk_risk_id_foreign FOREIGN KEY (risk_id) REFERENCES public.risks(id);


--
-- Name: implementations implementations_implementation_owner_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.implementations
    ADD CONSTRAINT implementations_implementation_owner_id_foreign FOREIGN KEY (implementation_owner_id) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: model_has_permissions model_has_permissions_permission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.model_has_permissions
    ADD CONSTRAINT model_has_permissions_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON DELETE CASCADE;


--
-- Name: model_has_roles model_has_roles_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.model_has_roles
    ADD CONSTRAINT model_has_roles_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- Name: program_risk program_risk_program_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.program_risk
    ADD CONSTRAINT program_risk_program_id_foreign FOREIGN KEY (program_id) REFERENCES public.programs(id) ON DELETE CASCADE;


--
-- Name: program_risk program_risk_risk_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.program_risk
    ADD CONSTRAINT program_risk_risk_id_foreign FOREIGN KEY (risk_id) REFERENCES public.risks(id) ON DELETE CASCADE;


--
-- Name: program_standard program_standard_program_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.program_standard
    ADD CONSTRAINT program_standard_program_id_foreign FOREIGN KEY (program_id) REFERENCES public.programs(id) ON DELETE CASCADE;


--
-- Name: program_standard program_standard_standard_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.program_standard
    ADD CONSTRAINT program_standard_standard_id_foreign FOREIGN KEY (standard_id) REFERENCES public.standards(id) ON DELETE CASCADE;


--
-- Name: programs programs_program_manager_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.programs
    ADD CONSTRAINT programs_program_manager_id_foreign FOREIGN KEY (program_manager_id) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: role_has_permissions role_has_permissions_permission_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON DELETE CASCADE;


--
-- Name: role_has_permissions role_has_permissions_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- Name: taxonomables taxonomables_taxonomy_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.taxonomables
    ADD CONSTRAINT taxonomables_taxonomy_id_foreign FOREIGN KEY (taxonomy_id) REFERENCES public.taxonomies(id) ON DELETE CASCADE;


--
-- Name: taxonomies taxonomies_parent_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.taxonomies
    ADD CONSTRAINT taxonomies_parent_id_foreign FOREIGN KEY (parent_id) REFERENCES public.taxonomies(id);


--
-- Name: vendors vendors_vendor_manager_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: opengrc
--

ALTER TABLE ONLY public.vendors
    ADD CONSTRAINT vendors_vendor_manager_id_foreign FOREIGN KEY (vendor_manager_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

\unrestrict U2q2Jq5D6iC3i8NifVbAmfEjRqa4CgEgQsVJvgInkCdjtWTxXaJMOMexk17jIvJ

