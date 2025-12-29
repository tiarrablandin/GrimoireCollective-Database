--
-- PostgreSQL database dump
--

\restrict 1C4mQFp0JvYy3epfUhieppyb1AzIMxeVriehiLUfpMDRaqS12FiWrjPwJoKW6gJ

-- Dumped from database version 16.11
-- Dumped by pg_dump version 16.11

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
-- Name: pg_trgm; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_trgm WITH SCHEMA public;


--
-- Name: EXTENSION pg_trgm; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pg_trgm IS 'text similarity measurement and index searching based on trigrams';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: decrement_tag_usage(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.decrement_tag_usage() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE tags SET usage_count = GREATEST(usage_count - 1, 0) WHERE id = OLD.tag_id;
    RETURN OLD;
END;
$$;


--
-- Name: increment_tag_usage(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.increment_tag_usage() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE tags SET usage_count = usage_count + 1 WHERE id = NEW.tag_id;
    RETURN NEW;
END;
$$;


--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: board_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.board_items (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    board_id uuid NOT NULL,
    grimoire_id uuid NOT NULL,
    notes text,
    sort_order integer DEFAULT 0,
    added_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: candles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.candles (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    color character varying(50) NOT NULL,
    magical_properties text[],
    element character varying(20),
    planet character varying(50),
    chakra character varying(50),
    zodiac_signs text[],
    day_of_week character varying(20),
    moon_phase character varying(30),
    description text NOT NULL,
    magical_uses text,
    ritual_purposes text,
    spell_types text[],
    best_time_to_use text,
    direction_to_face character varying(20),
    pairs_well_with text[],
    herb_combinations text[],
    crystal_combinations text[],
    oil_combinations text[],
    dressing_instructions text,
    burning_instructions text,
    disposal_instructions text,
    history text,
    metadata jsonb,
    primary_image_url text,
    meta_description text,
    created_by uuid,
    verified_by uuid,
    is_verified boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp without time zone,
    CONSTRAINT valid_element CHECK (((element)::text = ANY ((ARRAY['Earth'::character varying, 'Air'::character varying, 'Fire'::character varying, 'Water'::character varying, 'Spirit'::character varying, 'All'::character varying])::text[])))
);


--
-- Name: categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.categories (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description text,
    parent_id uuid,
    icon character varying(50),
    color character varying(7),
    is_active boolean DEFAULT true,
    sort_order integer DEFAULT 0,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: comment_likes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.comment_likes (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    comment_id uuid NOT NULL,
    user_id uuid NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: comments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.comments (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    grimoire_id uuid NOT NULL,
    user_id uuid NOT NULL,
    parent_id uuid,
    content text NOT NULL,
    is_edited boolean DEFAULT false,
    edited_at timestamp without time zone,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp without time zone
);


--
-- Name: content_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.content_types (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(50) NOT NULL,
    slug character varying(50) NOT NULL,
    description text,
    icon character varying(50),
    is_active boolean DEFAULT true,
    sort_order integer DEFAULT 0,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: crystal_candle_pairings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.crystal_candle_pairings (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    crystal_id uuid NOT NULL,
    candle_id uuid NOT NULL,
    purpose text,
    created_by uuid,
    verified boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: crystal_herb_pairings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.crystal_herb_pairings (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    crystal_id uuid NOT NULL,
    herb_id uuid NOT NULL,
    purpose text,
    created_by uuid,
    verified boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: crystal_substitutes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.crystal_substitutes (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    crystal_id uuid NOT NULL,
    substitute_crystal_id uuid NOT NULL,
    reason text,
    effectiveness character varying(20),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT different_crystals CHECK ((crystal_id <> substitute_crystal_id)),
    CONSTRAINT valid_effectiveness CHECK (((effectiveness)::text = ANY ((ARRAY['excellent'::character varying, 'good'::character varying, 'fair'::character varying])::text[])))
);


--
-- Name: crystals; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.crystals (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    alternative_names text[],
    color character varying(50),
    chakra character varying(50),
    zodiac_signs text[],
    element character varying(20),
    planet character varying(50),
    crystal_system character varying(50),
    chemical_composition text,
    magical_properties text[],
    cleansing_methods text[],
    cleansing_notes text,
    charging_methods text[],
    charging_notes text,
    description text NOT NULL,
    uses text,
    affirmations text[],
    meditation_guidance text,
    water_safe boolean DEFAULT true,
    sun_safe boolean DEFAULT true,
    salt_safe boolean DEFAULT true,
    toxicity_warning text,
    rarity character varying(20),
    primary_sources text[],
    ethical_sourcing_notes text,
    history text,
    directions text,
    storage_instructions text,
    safety_warnings text,
    metadata jsonb,
    primary_image_url text,
    meta_description text,
    created_by uuid,
    verified_by uuid,
    is_verified boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp without time zone,
    CONSTRAINT valid_element CHECK (((element)::text = ANY ((ARRAY['Earth'::character varying, 'Air'::character varying, 'Fire'::character varying, 'Water'::character varying, 'Spirit'::character varying, 'All'::character varying])::text[]))),
    CONSTRAINT valid_rarity CHECK (((rarity)::text = ANY ((ARRAY['common'::character varying, 'uncommon'::character varying, 'rare'::character varying, 'very_rare'::character varying])::text[])))
);


--
-- Name: db_health_check; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.db_health_check (
    id integer NOT NULL,
    last_check timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: db_health_check_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.db_health_check_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: db_health_check_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.db_health_check_id_seq OWNED BY public.db_health_check.id;


--
-- Name: deities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.deities (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    culture character varying(100),
    pantheon character varying(100),
    gender character varying(50),
    domains text[],
    symbols text[],
    description text,
    image_url text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: deity_crystals; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.deity_crystals (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    deity_id uuid NOT NULL,
    crystal_id uuid NOT NULL,
    significance text,
    created_by uuid,
    verified boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: deity_herbs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.deity_herbs (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    deity_id uuid NOT NULL,
    herb_id uuid NOT NULL,
    significance text,
    created_by uuid,
    verified boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: entity_categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.entity_categories (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    entity_type character varying(50) NOT NULL,
    entity_id uuid NOT NULL,
    category_id uuid NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT valid_entity_type CHECK (((entity_type)::text = ANY ((ARRAY['crystal'::character varying, 'herb'::character varying, 'candle'::character varying, 'incense'::character varying, 'oil'::character varying, 'salt'::character varying, 'grimoire'::character varying, 'deity'::character varying, 'sabbat'::character varying, 'moon_phase'::character varying, 'zodiac_sign'::character varying])::text[])))
);


--
-- Name: entity_tags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.entity_tags (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    entity_type character varying(50) NOT NULL,
    entity_id uuid NOT NULL,
    tag_id uuid NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT valid_entity_type CHECK (((entity_type)::text = ANY ((ARRAY['crystal'::character varying, 'herb'::character varying, 'candle'::character varying, 'incense'::character varying, 'oil'::character varying, 'salt'::character varying, 'grimoire'::character varying, 'deity'::character varying, 'sabbat'::character varying, 'moon_phase'::character varying, 'zodiac_sign'::character varying])::text[])))
);


--
-- Name: entity_views; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.entity_views (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    entity_type character varying(20) NOT NULL,
    entity_id uuid NOT NULL,
    user_id uuid,
    session_id character varying(255),
    ip_address inet,
    user_agent text,
    referrer text,
    viewed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT valid_entity_type CHECK (((entity_type)::text = ANY ((ARRAY['crystal'::character varying, 'herb'::character varying, 'candle'::character varying, 'incense'::character varying, 'oil'::character varying, 'salt'::character varying, 'deity'::character varying, 'sabbat'::character varying, 'moon_phase'::character varying, 'zodiac_sign'::character varying])::text[])))
);


--
-- Name: grimoire_candles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.grimoire_candles (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    grimoire_id uuid NOT NULL,
    candle_id uuid NOT NULL,
    quantity character varying(50),
    purpose text,
    optional boolean DEFAULT false,
    display_order integer DEFAULT 0,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: grimoire_crystals; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.grimoire_crystals (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    grimoire_id uuid NOT NULL,
    crystal_id uuid NOT NULL,
    quantity character varying(50),
    purpose text,
    optional boolean DEFAULT false,
    display_order integer DEFAULT 0,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: grimoire_deities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.grimoire_deities (
    grimoire_id uuid NOT NULL,
    deity_id uuid NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: grimoire_dislikes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.grimoire_dislikes (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    grimoire_id uuid NOT NULL,
    user_id uuid NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: grimoire_favorites; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.grimoire_favorites (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    grimoire_id uuid NOT NULL,
    user_id uuid NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: grimoire_herbs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.grimoire_herbs (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    grimoire_id uuid NOT NULL,
    herb_id uuid NOT NULL,
    quantity character varying(50),
    preparation character varying(50),
    purpose text,
    optional boolean DEFAULT false,
    display_order integer DEFAULT 0,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: grimoire_incense; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.grimoire_incense (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    grimoire_id uuid NOT NULL,
    incense_id uuid NOT NULL,
    quantity character varying(50),
    purpose text,
    optional boolean DEFAULT false,
    display_order integer DEFAULT 0,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: grimoire_likes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.grimoire_likes (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    grimoire_id uuid NOT NULL,
    user_id uuid NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: grimoire_media; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.grimoire_media (
    grimoire_id uuid NOT NULL,
    media_id uuid NOT NULL,
    display_order integer DEFAULT 0,
    is_primary boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: grimoire_moon_phases; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.grimoire_moon_phases (
    grimoire_id uuid NOT NULL,
    moon_phase_id uuid NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: grimoire_oils; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.grimoire_oils (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    grimoire_id uuid NOT NULL,
    oil_id uuid NOT NULL,
    quantity character varying(50),
    application_method character varying(100),
    purpose text,
    optional boolean DEFAULT false,
    display_order integer DEFAULT 0,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: grimoire_sabbats; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.grimoire_sabbats (
    grimoire_id uuid NOT NULL,
    sabbat_id uuid NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: grimoire_salts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.grimoire_salts (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    grimoire_id uuid NOT NULL,
    salt_id uuid NOT NULL,
    quantity character varying(50),
    application_method character varying(100),
    purpose text,
    optional boolean DEFAULT false,
    display_order integer DEFAULT 0,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: grimoire_views; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.grimoire_views (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    grimoire_id uuid NOT NULL,
    user_id uuid,
    ip_address inet,
    user_agent text,
    referrer text,
    viewed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: grimoires; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.grimoires (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    title character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    content text NOT NULL,
    excerpt text,
    content_type_id uuid NOT NULL,
    author_id uuid NOT NULL,
    status character varying(20) DEFAULT 'draft'::character varying NOT NULL,
    is_public boolean DEFAULT true,
    is_featured boolean DEFAULT false,
    featured_at timestamp without time zone,
    meta_title character varying(255),
    meta_description text,
    meta_keywords text,
    version integer DEFAULT 1,
    previous_version_id uuid,
    metadata jsonb,
    published_at timestamp without time zone,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp without time zone,
    CONSTRAINT valid_status CHECK (((status)::text = ANY ((ARRAY['draft'::character varying, 'pending_review'::character varying, 'published'::character varying, 'archived'::character varying])::text[])))
);


--
-- Name: grimoire_stats; Type: MATERIALIZED VIEW; Schema: public; Owner: -
--

CREATE MATERIALIZED VIEW public.grimoire_stats AS
 SELECT g.id,
    g.title,
    count(DISTINCT gv.id) AS view_count,
    count(DISTINCT gl.id) AS like_count,
    count(DISTINCT gd.id) AS dislike_count,
    count(DISTINCT gf.id) AS favorite_count,
    count(DISTINCT c.id) AS comment_count,
    max(gv.viewed_at) AS last_viewed_at
   FROM (((((public.grimoires g
     LEFT JOIN public.grimoire_views gv ON ((g.id = gv.grimoire_id)))
     LEFT JOIN public.grimoire_likes gl ON ((g.id = gl.grimoire_id)))
     LEFT JOIN public.grimoire_dislikes gd ON ((g.id = gd.grimoire_id)))
     LEFT JOIN public.grimoire_favorites gf ON ((g.id = gf.grimoire_id)))
     LEFT JOIN public.comments c ON (((g.id = c.grimoire_id) AND (c.deleted_at IS NULL))))
  WHERE (g.deleted_at IS NULL)
  GROUP BY g.id, g.title
  WITH NO DATA;


--
-- Name: grimoire_zodiac; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.grimoire_zodiac (
    grimoire_id uuid NOT NULL,
    zodiac_id uuid NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: herb_candle_pairings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.herb_candle_pairings (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    herb_id uuid NOT NULL,
    candle_id uuid NOT NULL,
    purpose text,
    created_by uuid,
    verified boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: herb_substitutes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.herb_substitutes (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    herb_id uuid NOT NULL,
    substitute_herb_id uuid NOT NULL,
    reason text,
    effectiveness character varying(20),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT different_herbs CHECK ((herb_id <> substitute_herb_id)),
    CONSTRAINT valid_effectiveness CHECK (((effectiveness)::text = ANY ((ARRAY['excellent'::character varying, 'good'::character varying, 'fair'::character varying])::text[])))
);


--
-- Name: herbs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.herbs (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    alternative_names text[],
    scientific_name character varying(150),
    plant_family character varying(100),
    plant_type character varying(50),
    growing_zones text[],
    native_regions text[],
    parts_used text[],
    magical_properties text[],
    element character varying(20),
    planet character varying(50),
    zodiac_signs text[],
    deities_associated text[],
    sabbats_associated text[],
    description text NOT NULL,
    magical_uses text,
    ritual_uses text,
    medicinal_uses text,
    preparation_methods text[],
    preparation_notes text,
    best_harvest_time text,
    harvesting_notes text,
    storage_methods text[],
    shelf_life text,
    toxicity_level character varying(20),
    safety_warnings text,
    pregnancy_safe boolean,
    pet_safe boolean,
    contraindications text,
    magical_substitutes text[],
    history text,
    directions text,
    scent_profile text,
    skin_safe boolean,
    metadata jsonb,
    primary_image_url text,
    meta_description text,
    created_by uuid,
    verified_by uuid,
    is_verified boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp without time zone,
    CONSTRAINT valid_element CHECK (((element)::text = ANY ((ARRAY['Earth'::character varying, 'Air'::character varying, 'Fire'::character varying, 'Water'::character varying, 'Spirit'::character varying, 'All'::character varying])::text[]))),
    CONSTRAINT valid_toxicity CHECK (((toxicity_level)::text = ANY ((ARRAY['non_toxic'::character varying, 'mildly_toxic'::character varying, 'toxic'::character varying, 'highly_toxic'::character varying, 'unknown'::character varying])::text[])))
);


--
-- Name: incense; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.incense (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    alternative_names text[],
    incense_type character varying(50),
    scent_profile text,
    ingredients text[],
    magical_properties text[],
    element character varying(20),
    planet character varying(50),
    zodiac_signs text[],
    deities_associated text[],
    description text NOT NULL,
    magical_uses text,
    ritual_uses text,
    meditation_uses text,
    best_used_for text[],
    burn_time text,
    burning_instructions text,
    best_time_to_burn text,
    moon_phase character varying(30),
    blends_well_with text[],
    herb_combinations text[],
    crystal_combinations text[],
    safety_warnings text,
    ventilation_required boolean DEFAULT true,
    history text,
    shelf_life text,
    storage_instructions text,
    pet_safe boolean,
    pregnancy_safe boolean,
    metadata jsonb,
    primary_image_url text,
    meta_description text,
    created_by uuid,
    verified_by uuid,
    is_verified boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp without time zone,
    CONSTRAINT valid_element CHECK (((element)::text = ANY ((ARRAY['Earth'::character varying, 'Air'::character varying, 'Fire'::character varying, 'Water'::character varying, 'Spirit'::character varying, 'All'::character varying])::text[])))
);


--
-- Name: media_files; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.media_files (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    uploader_id uuid NOT NULL,
    file_name character varying(255) NOT NULL,
    original_file_name character varying(255) NOT NULL,
    file_path text NOT NULL,
    file_url text NOT NULL,
    file_type character varying(50) NOT NULL,
    mime_type character varying(100) NOT NULL,
    file_size_bytes bigint NOT NULL,
    width integer,
    height integer,
    duration_seconds integer,
    thumbnail_url text,
    alt_text text,
    caption text,
    metadata jsonb,
    storage_provider character varying(50) DEFAULT 'local'::character varying,
    storage_key text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp without time zone,
    CONSTRAINT valid_file_type CHECK (((file_type)::text = ANY ((ARRAY['image'::character varying, 'video'::character varying, 'audio'::character varying, 'document'::character varying])::text[])))
);


--
-- Name: moon_phases; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.moon_phases (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(50) NOT NULL,
    slug character varying(50) NOT NULL,
    description text,
    magical_properties text[],
    best_for text[],
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: oil_substitutes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.oil_substitutes (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    oil_id uuid NOT NULL,
    substitute_oil_id uuid NOT NULL,
    reason text,
    effectiveness character varying(20),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT different_oils CHECK ((oil_id <> substitute_oil_id)),
    CONSTRAINT valid_effectiveness CHECK (((effectiveness)::text = ANY ((ARRAY['excellent'::character varying, 'good'::character varying, 'fair'::character varying])::text[])))
);


--
-- Name: oils; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.oils (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    alternative_names text[],
    oil_type character varying(50) NOT NULL,
    source_plant character varying(150),
    extraction_method character varying(50),
    color character varying(50),
    consistency character varying(30),
    shelf_life text,
    storage_instructions text,
    magical_properties text[],
    element character varying(20),
    planet character varying(50),
    zodiac_signs text[],
    chakras text[],
    description text NOT NULL,
    magical_uses text,
    ritual_uses text,
    anointing_uses text,
    aromatherapy_uses text,
    application_methods text[],
    dilution_guidelines text,
    blends_well_with text[],
    herb_combinations text[],
    crystal_combinations text[],
    candle_uses text,
    skin_safe boolean DEFAULT false,
    dilution_required boolean DEFAULT true,
    pregnancy_safe boolean,
    pet_safe boolean,
    photosensitive boolean DEFAULT false,
    safety_warnings text,
    contraindications text,
    history text,
    scent_profile text,
    metadata jsonb,
    primary_image_url text,
    meta_description text,
    created_by uuid,
    verified_by uuid,
    is_verified boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp without time zone,
    CONSTRAINT valid_element CHECK (((element)::text = ANY ((ARRAY['Earth'::character varying, 'Air'::character varying, 'Fire'::character varying, 'Water'::character varying, 'Spirit'::character varying, 'All'::character varying])::text[]))),
    CONSTRAINT valid_oil_type CHECK (((oil_type)::text = ANY ((ARRAY['essential'::character varying, 'carrier'::character varying, 'infused'::character varying, 'blend'::character varying, 'magical'::character varying])::text[])))
);


--
-- Name: permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.permissions (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    resource character varying(50) NOT NULL,
    action character varying(50) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: role_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.role_permissions (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.roles (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: sabbats; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sabbats (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    tradition character varying(100),
    date_type character varying(20) NOT NULL,
    fixed_date date,
    description text,
    themes text[],
    colors text[],
    symbols text[],
    image_url text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT valid_date_type CHECK (((date_type)::text = ANY ((ARRAY['fixed'::character varying, 'solar'::character varying, 'lunar'::character varying])::text[])))
);


--
-- Name: salts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.salts (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    alternative_names text[],
    salt_type character varying(50) NOT NULL,
    base_salt character varying(50),
    color character varying(50),
    texture character varying(30),
    magical_properties text[],
    element character varying(20),
    planet character varying(50),
    zodiac_signs text[],
    description text NOT NULL,
    magical_uses text,
    ritual_uses text,
    bath_uses text,
    how_to_use text,
    ingredients text[],
    application_methods text[],
    skin_safe boolean DEFAULT true,
    safe_for_drains boolean DEFAULT true,
    pregnancy_safe boolean,
    pet_safe boolean,
    safety_warnings text,
    storage_instructions text,
    shelf_life text,
    has_recipe boolean DEFAULT false,
    history text,
    metadata jsonb,
    primary_image_url text,
    meta_description text,
    created_by uuid,
    verified_by uuid,
    is_verified boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp without time zone,
    CONSTRAINT valid_element CHECK (((element)::text = ANY ((ARRAY['Earth'::character varying, 'Air'::character varying, 'Fire'::character varying, 'Water'::character varying, 'Spirit'::character varying, 'All'::character varying])::text[])))
);


--
-- Name: subscription_tiers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.subscription_tiers (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    price_monthly numeric(10,2),
    price_yearly numeric(10,2),
    features jsonb,
    max_grimoires integer,
    max_storage_mb integer,
    is_active boolean DEFAULT true,
    sort_order integer DEFAULT 0,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: tags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tags (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(50) NOT NULL,
    slug character varying(50) NOT NULL,
    description text,
    usage_count integer DEFAULT 0,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: user_activity_log; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_activity_log (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    user_id uuid,
    activity_type character varying(50) NOT NULL,
    entity_type character varying(50),
    entity_id uuid,
    ip_address inet,
    user_agent text,
    metadata jsonb,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: user_boards; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_boards (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    user_id uuid NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    is_public boolean DEFAULT true,
    cover_image_url text,
    sort_order integer DEFAULT 0,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp without time zone
);


--
-- Name: user_bookmarks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_bookmarks (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    user_id uuid NOT NULL,
    entity_type character varying(20) NOT NULL,
    entity_id uuid NOT NULL,
    notes text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT valid_entity_type CHECK (((entity_type)::text = ANY ((ARRAY['crystal'::character varying, 'herb'::character varying, 'candle'::character varying, 'incense'::character varying, 'oil'::character varying, 'salt'::character varying, 'deity'::character varying, 'sabbat'::character varying, 'moon_phase'::character varying, 'zodiac_sign'::character varying])::text[])))
);


--
-- Name: user_roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_roles (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL,
    assigned_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    assigned_by uuid
);


--
-- Name: user_settings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_settings (
    user_id uuid NOT NULL,
    theme character varying(20) DEFAULT 'light'::character varying,
    language character varying(10) DEFAULT 'en'::character varying,
    timezone character varying(50) DEFAULT 'UTC'::character varying,
    email_notifications boolean DEFAULT true,
    push_notifications boolean DEFAULT true,
    privacy_profile_public boolean DEFAULT true,
    privacy_show_email boolean DEFAULT false,
    settings_json jsonb,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    username character varying(50) NOT NULL,
    email character varying(255) NOT NULL,
    password_hash character varying(255) NOT NULL,
    display_name character varying(100),
    avatar_url text,
    bio text,
    location character varying(100),
    website_url text,
    is_email_verified boolean DEFAULT false,
    is_active boolean DEFAULT true,
    last_login_at timestamp without time zone,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp without time zone,
    CONSTRAINT email_format CHECK (((email)::text ~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'::text)),
    CONSTRAINT username_min_length CHECK ((char_length((username)::text) >= 3))
);


--
-- Name: user_stats; Type: MATERIALIZED VIEW; Schema: public; Owner: -
--

CREATE MATERIALIZED VIEW public.user_stats AS
 SELECT u.id,
    u.username,
    count(DISTINCT g.id) AS grimoire_count,
    count(DISTINCT gf.id) AS favorite_count,
    count(DISTINCT c.id) AS comment_count,
    count(DISTINCT ub.id) AS board_count
   FROM ((((public.users u
     LEFT JOIN public.grimoires g ON (((u.id = g.author_id) AND (g.deleted_at IS NULL))))
     LEFT JOIN public.grimoire_favorites gf ON ((u.id = gf.user_id)))
     LEFT JOIN public.comments c ON (((u.id = c.user_id) AND (c.deleted_at IS NULL))))
     LEFT JOIN public.user_boards ub ON (((u.id = ub.user_id) AND (ub.deleted_at IS NULL))))
  WHERE (u.deleted_at IS NULL)
  GROUP BY u.id, u.username
  WITH NO DATA;


--
-- Name: user_subscriptions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_subscriptions (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    user_id uuid NOT NULL,
    tier_id uuid NOT NULL,
    status character varying(20) DEFAULT 'active'::character varying NOT NULL,
    started_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    expires_at timestamp without time zone,
    cancelled_at timestamp without time zone,
    payment_provider character varying(50),
    payment_id character varying(255),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT valid_status CHECK (((status)::text = ANY ((ARRAY['active'::character varying, 'cancelled'::character varying, 'expired'::character varying, 'suspended'::character varying])::text[])))
);


--
-- Name: zodiac_signs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.zodiac_signs (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(50) NOT NULL,
    slug character varying(50) NOT NULL,
    symbol character varying(10) NOT NULL,
    element character varying(20) NOT NULL,
    modality character varying(20) NOT NULL,
    ruling_planet character varying(50),
    date_range_start character varying(10),
    date_range_end character varying(10),
    traits text[],
    description text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT valid_element CHECK (((element)::text = ANY ((ARRAY['fire'::character varying, 'earth'::character varying, 'air'::character varying, 'water'::character varying])::text[]))),
    CONSTRAINT valid_modality CHECK (((modality)::text = ANY ((ARRAY['cardinal'::character varying, 'fixed'::character varying, 'mutable'::character varying])::text[])))
);


--
-- Name: db_health_check id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.db_health_check ALTER COLUMN id SET DEFAULT nextval('public.db_health_check_id_seq'::regclass);


--
-- Name: board_items board_items_board_id_grimoire_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.board_items
    ADD CONSTRAINT board_items_board_id_grimoire_id_key UNIQUE (board_id, grimoire_id);


--
-- Name: board_items board_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.board_items
    ADD CONSTRAINT board_items_pkey PRIMARY KEY (id);


--
-- Name: candles candles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.candles
    ADD CONSTRAINT candles_pkey PRIMARY KEY (id);


--
-- Name: candles candles_slug_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.candles
    ADD CONSTRAINT candles_slug_key UNIQUE (slug);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: categories categories_slug_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_slug_key UNIQUE (slug);


--
-- Name: comment_likes comment_likes_comment_id_user_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comment_likes
    ADD CONSTRAINT comment_likes_comment_id_user_id_key UNIQUE (comment_id, user_id);


--
-- Name: comment_likes comment_likes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comment_likes
    ADD CONSTRAINT comment_likes_pkey PRIMARY KEY (id);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: content_types content_types_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.content_types
    ADD CONSTRAINT content_types_name_key UNIQUE (name);


--
-- Name: content_types content_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.content_types
    ADD CONSTRAINT content_types_pkey PRIMARY KEY (id);


--
-- Name: content_types content_types_slug_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.content_types
    ADD CONSTRAINT content_types_slug_key UNIQUE (slug);


--
-- Name: crystal_candle_pairings crystal_candle_pairings_crystal_id_candle_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crystal_candle_pairings
    ADD CONSTRAINT crystal_candle_pairings_crystal_id_candle_id_key UNIQUE (crystal_id, candle_id);


--
-- Name: crystal_candle_pairings crystal_candle_pairings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crystal_candle_pairings
    ADD CONSTRAINT crystal_candle_pairings_pkey PRIMARY KEY (id);


--
-- Name: crystal_herb_pairings crystal_herb_pairings_crystal_id_herb_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crystal_herb_pairings
    ADD CONSTRAINT crystal_herb_pairings_crystal_id_herb_id_key UNIQUE (crystal_id, herb_id);


--
-- Name: crystal_herb_pairings crystal_herb_pairings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crystal_herb_pairings
    ADD CONSTRAINT crystal_herb_pairings_pkey PRIMARY KEY (id);


--
-- Name: crystal_substitutes crystal_substitutes_crystal_id_substitute_crystal_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crystal_substitutes
    ADD CONSTRAINT crystal_substitutes_crystal_id_substitute_crystal_id_key UNIQUE (crystal_id, substitute_crystal_id);


--
-- Name: crystal_substitutes crystal_substitutes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crystal_substitutes
    ADD CONSTRAINT crystal_substitutes_pkey PRIMARY KEY (id);


--
-- Name: crystals crystals_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crystals
    ADD CONSTRAINT crystals_name_key UNIQUE (name);


--
-- Name: crystals crystals_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crystals
    ADD CONSTRAINT crystals_pkey PRIMARY KEY (id);


--
-- Name: crystals crystals_slug_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crystals
    ADD CONSTRAINT crystals_slug_key UNIQUE (slug);


--
-- Name: db_health_check db_health_check_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.db_health_check
    ADD CONSTRAINT db_health_check_pkey PRIMARY KEY (id);


--
-- Name: deities deities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.deities
    ADD CONSTRAINT deities_pkey PRIMARY KEY (id);


--
-- Name: deities deities_slug_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.deities
    ADD CONSTRAINT deities_slug_key UNIQUE (slug);


--
-- Name: deity_crystals deity_crystals_deity_id_crystal_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.deity_crystals
    ADD CONSTRAINT deity_crystals_deity_id_crystal_id_key UNIQUE (deity_id, crystal_id);


--
-- Name: deity_crystals deity_crystals_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.deity_crystals
    ADD CONSTRAINT deity_crystals_pkey PRIMARY KEY (id);


--
-- Name: deity_herbs deity_herbs_deity_id_herb_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.deity_herbs
    ADD CONSTRAINT deity_herbs_deity_id_herb_id_key UNIQUE (deity_id, herb_id);


--
-- Name: deity_herbs deity_herbs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.deity_herbs
    ADD CONSTRAINT deity_herbs_pkey PRIMARY KEY (id);


--
-- Name: entity_categories entity_categories_entity_type_entity_id_category_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.entity_categories
    ADD CONSTRAINT entity_categories_entity_type_entity_id_category_id_key UNIQUE (entity_type, entity_id, category_id);


--
-- Name: entity_categories entity_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.entity_categories
    ADD CONSTRAINT entity_categories_pkey PRIMARY KEY (id);


--
-- Name: entity_tags entity_tags_entity_type_entity_id_tag_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.entity_tags
    ADD CONSTRAINT entity_tags_entity_type_entity_id_tag_id_key UNIQUE (entity_type, entity_id, tag_id);


--
-- Name: entity_tags entity_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.entity_tags
    ADD CONSTRAINT entity_tags_pkey PRIMARY KEY (id);


--
-- Name: entity_views entity_views_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.entity_views
    ADD CONSTRAINT entity_views_pkey PRIMARY KEY (id);


--
-- Name: grimoire_candles grimoire_candles_grimoire_id_candle_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grimoire_candles
    ADD CONSTRAINT grimoire_candles_grimoire_id_candle_id_key UNIQUE (grimoire_id, candle_id);


--
-- Name: grimoire_candles grimoire_candles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grimoire_candles
    ADD CONSTRAINT grimoire_candles_pkey PRIMARY KEY (id);


--
-- Name: grimoire_crystals grimoire_crystals_grimoire_id_crystal_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grimoire_crystals
    ADD CONSTRAINT grimoire_crystals_grimoire_id_crystal_id_key UNIQUE (grimoire_id, crystal_id);


--
-- Name: grimoire_crystals grimoire_crystals_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grimoire_crystals
    ADD CONSTRAINT grimoire_crystals_pkey PRIMARY KEY (id);


--
-- Name: grimoire_deities grimoire_deities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grimoire_deities
    ADD CONSTRAINT grimoire_deities_pkey PRIMARY KEY (grimoire_id, deity_id);


--
-- Name: grimoire_dislikes grimoire_dislikes_grimoire_id_user_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grimoire_dislikes
    ADD CONSTRAINT grimoire_dislikes_grimoire_id_user_id_key UNIQUE (grimoire_id, user_id);


--
-- Name: grimoire_dislikes grimoire_dislikes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grimoire_dislikes
    ADD CONSTRAINT grimoire_dislikes_pkey PRIMARY KEY (id);


--
-- Name: grimoire_favorites grimoire_favorites_grimoire_id_user_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grimoire_favorites
    ADD CONSTRAINT grimoire_favorites_grimoire_id_user_id_key UNIQUE (grimoire_id, user_id);


--
-- Name: grimoire_favorites grimoire_favorites_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grimoire_favorites
    ADD CONSTRAINT grimoire_favorites_pkey PRIMARY KEY (id);


--
-- Name: grimoire_herbs grimoire_herbs_grimoire_id_herb_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grimoire_herbs
    ADD CONSTRAINT grimoire_herbs_grimoire_id_herb_id_key UNIQUE (grimoire_id, herb_id);


--
-- Name: grimoire_herbs grimoire_herbs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grimoire_herbs
    ADD CONSTRAINT grimoire_herbs_pkey PRIMARY KEY (id);


--
-- Name: grimoire_incense grimoire_incense_grimoire_id_incense_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grimoire_incense
    ADD CONSTRAINT grimoire_incense_grimoire_id_incense_id_key UNIQUE (grimoire_id, incense_id);


--
-- Name: grimoire_incense grimoire_incense_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grimoire_incense
    ADD CONSTRAINT grimoire_incense_pkey PRIMARY KEY (id);


--
-- Name: grimoire_likes grimoire_likes_grimoire_id_user_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grimoire_likes
    ADD CONSTRAINT grimoire_likes_grimoire_id_user_id_key UNIQUE (grimoire_id, user_id);


--
-- Name: grimoire_likes grimoire_likes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grimoire_likes
    ADD CONSTRAINT grimoire_likes_pkey PRIMARY KEY (id);


--
-- Name: grimoire_media grimoire_media_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grimoire_media
    ADD CONSTRAINT grimoire_media_pkey PRIMARY KEY (grimoire_id, media_id);


--
-- Name: grimoire_moon_phases grimoire_moon_phases_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grimoire_moon_phases
    ADD CONSTRAINT grimoire_moon_phases_pkey PRIMARY KEY (grimoire_id, moon_phase_id);


--
-- Name: grimoire_oils grimoire_oils_grimoire_id_oil_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grimoire_oils
    ADD CONSTRAINT grimoire_oils_grimoire_id_oil_id_key UNIQUE (grimoire_id, oil_id);


--
-- Name: grimoire_oils grimoire_oils_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grimoire_oils
    ADD CONSTRAINT grimoire_oils_pkey PRIMARY KEY (id);


--
-- Name: grimoire_sabbats grimoire_sabbats_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grimoire_sabbats
    ADD CONSTRAINT grimoire_sabbats_pkey PRIMARY KEY (grimoire_id, sabbat_id);


--
-- Name: grimoire_salts grimoire_salts_grimoire_id_salt_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grimoire_salts
    ADD CONSTRAINT grimoire_salts_grimoire_id_salt_id_key UNIQUE (grimoire_id, salt_id);


--
-- Name: grimoire_salts grimoire_salts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grimoire_salts
    ADD CONSTRAINT grimoire_salts_pkey PRIMARY KEY (id);


--
-- Name: grimoire_views grimoire_views_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grimoire_views
    ADD CONSTRAINT grimoire_views_pkey PRIMARY KEY (id);


--
-- Name: grimoire_zodiac grimoire_zodiac_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grimoire_zodiac
    ADD CONSTRAINT grimoire_zodiac_pkey PRIMARY KEY (grimoire_id, zodiac_id);


--
-- Name: grimoires grimoires_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grimoires
    ADD CONSTRAINT grimoires_pkey PRIMARY KEY (id);


--
-- Name: grimoires grimoires_slug_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grimoires
    ADD CONSTRAINT grimoires_slug_key UNIQUE (slug);


--
-- Name: herb_candle_pairings herb_candle_pairings_herb_id_candle_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.herb_candle_pairings
    ADD CONSTRAINT herb_candle_pairings_herb_id_candle_id_key UNIQUE (herb_id, candle_id);


--
-- Name: herb_candle_pairings herb_candle_pairings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.herb_candle_pairings
    ADD CONSTRAINT herb_candle_pairings_pkey PRIMARY KEY (id);


--
-- Name: herb_substitutes herb_substitutes_herb_id_substitute_herb_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.herb_substitutes
    ADD CONSTRAINT herb_substitutes_herb_id_substitute_herb_id_key UNIQUE (herb_id, substitute_herb_id);


--
-- Name: herb_substitutes herb_substitutes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.herb_substitutes
    ADD CONSTRAINT herb_substitutes_pkey PRIMARY KEY (id);


--
-- Name: herbs herbs_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.herbs
    ADD CONSTRAINT herbs_name_key UNIQUE (name);


--
-- Name: herbs herbs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.herbs
    ADD CONSTRAINT herbs_pkey PRIMARY KEY (id);


--
-- Name: herbs herbs_slug_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.herbs
    ADD CONSTRAINT herbs_slug_key UNIQUE (slug);


--
-- Name: incense incense_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.incense
    ADD CONSTRAINT incense_name_key UNIQUE (name);


--
-- Name: incense incense_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.incense
    ADD CONSTRAINT incense_pkey PRIMARY KEY (id);


--
-- Name: incense incense_slug_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.incense
    ADD CONSTRAINT incense_slug_key UNIQUE (slug);


--
-- Name: media_files media_files_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.media_files
    ADD CONSTRAINT media_files_pkey PRIMARY KEY (id);


--
-- Name: moon_phases moon_phases_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.moon_phases
    ADD CONSTRAINT moon_phases_pkey PRIMARY KEY (id);


--
-- Name: moon_phases moon_phases_slug_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.moon_phases
    ADD CONSTRAINT moon_phases_slug_key UNIQUE (slug);


--
-- Name: oil_substitutes oil_substitutes_oil_id_substitute_oil_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oil_substitutes
    ADD CONSTRAINT oil_substitutes_oil_id_substitute_oil_id_key UNIQUE (oil_id, substitute_oil_id);


--
-- Name: oil_substitutes oil_substitutes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oil_substitutes
    ADD CONSTRAINT oil_substitutes_pkey PRIMARY KEY (id);


--
-- Name: oils oils_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oils
    ADD CONSTRAINT oils_name_key UNIQUE (name);


--
-- Name: oils oils_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oils
    ADD CONSTRAINT oils_pkey PRIMARY KEY (id);


--
-- Name: oils oils_slug_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oils
    ADD CONSTRAINT oils_slug_key UNIQUE (slug);


--
-- Name: permissions permissions_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key UNIQUE (name);


--
-- Name: permissions permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);


--
-- Name: role_permissions role_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.role_permissions
    ADD CONSTRAINT role_permissions_pkey PRIMARY KEY (role_id, permission_id);


--
-- Name: roles roles_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key UNIQUE (name);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: sabbats sabbats_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sabbats
    ADD CONSTRAINT sabbats_pkey PRIMARY KEY (id);


--
-- Name: sabbats sabbats_slug_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sabbats
    ADD CONSTRAINT sabbats_slug_key UNIQUE (slug);


--
-- Name: salts salts_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.salts
    ADD CONSTRAINT salts_name_key UNIQUE (name);


--
-- Name: salts salts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.salts
    ADD CONSTRAINT salts_pkey PRIMARY KEY (id);


--
-- Name: salts salts_slug_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.salts
    ADD CONSTRAINT salts_slug_key UNIQUE (slug);


--
-- Name: subscription_tiers subscription_tiers_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subscription_tiers
    ADD CONSTRAINT subscription_tiers_name_key UNIQUE (name);


--
-- Name: subscription_tiers subscription_tiers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subscription_tiers
    ADD CONSTRAINT subscription_tiers_pkey PRIMARY KEY (id);


--
-- Name: tags tags_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_name_key UNIQUE (name);


--
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: tags tags_slug_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_slug_key UNIQUE (slug);


--
-- Name: user_activity_log user_activity_log_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_activity_log
    ADD CONSTRAINT user_activity_log_pkey PRIMARY KEY (id);


--
-- Name: user_boards user_boards_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_boards
    ADD CONSTRAINT user_boards_pkey PRIMARY KEY (id);


--
-- Name: user_bookmarks user_bookmarks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_bookmarks
    ADD CONSTRAINT user_bookmarks_pkey PRIMARY KEY (id);


--
-- Name: user_bookmarks user_bookmarks_user_id_entity_type_entity_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_bookmarks
    ADD CONSTRAINT user_bookmarks_user_id_entity_type_entity_id_key UNIQUE (user_id, entity_type, entity_id);


--
-- Name: user_roles user_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (user_id, role_id);


--
-- Name: user_settings user_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_settings
    ADD CONSTRAINT user_settings_pkey PRIMARY KEY (user_id);


--
-- Name: user_subscriptions user_subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_subscriptions
    ADD CONSTRAINT user_subscriptions_pkey PRIMARY KEY (id);


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
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: zodiac_signs zodiac_signs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.zodiac_signs
    ADD CONSTRAINT zodiac_signs_pkey PRIMARY KEY (id);


--
-- Name: zodiac_signs zodiac_signs_slug_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.zodiac_signs
    ADD CONSTRAINT zodiac_signs_slug_key UNIQUE (slug);


--
-- Name: idx_activity_log_date; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_activity_log_date ON public.user_activity_log USING btree (created_at);


--
-- Name: idx_activity_log_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_activity_log_type ON public.user_activity_log USING btree (activity_type);


--
-- Name: idx_activity_log_user; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_activity_log_user ON public.user_activity_log USING btree (user_id);


--
-- Name: idx_board_items_board; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_board_items_board ON public.board_items USING btree (board_id);


--
-- Name: idx_board_items_grimoire; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_board_items_grimoire ON public.board_items USING btree (grimoire_id);


--
-- Name: idx_candles_color; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_candles_color ON public.candles USING btree (color) WHERE (deleted_at IS NULL);


--
-- Name: idx_candles_element; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_candles_element ON public.candles USING btree (element) WHERE (deleted_at IS NULL);


--
-- Name: idx_candles_fulltext; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_candles_fulltext ON public.candles USING gin (to_tsvector('english'::regconfig, (((((name)::text || ' '::text) || (color)::text) || ' '::text) || COALESCE(description, ''::text))));


--
-- Name: idx_candles_properties; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_candles_properties ON public.candles USING gin (magical_properties);


--
-- Name: idx_candles_slug; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_candles_slug ON public.candles USING btree (slug) WHERE (deleted_at IS NULL);


--
-- Name: idx_candles_verified; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_candles_verified ON public.candles USING btree (is_verified) WHERE (deleted_at IS NULL);


--
-- Name: idx_categories_parent; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_categories_parent ON public.categories USING btree (parent_id);


--
-- Name: idx_categories_slug; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_categories_slug ON public.categories USING btree (slug);


--
-- Name: idx_comments_grimoire; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_comments_grimoire ON public.comments USING btree (grimoire_id) WHERE (deleted_at IS NULL);


--
-- Name: idx_comments_parent; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_comments_parent ON public.comments USING btree (parent_id) WHERE (deleted_at IS NULL);


--
-- Name: idx_comments_user; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_comments_user ON public.comments USING btree (user_id) WHERE (deleted_at IS NULL);


--
-- Name: idx_crystal_candle_pairings_candle; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_crystal_candle_pairings_candle ON public.crystal_candle_pairings USING btree (candle_id);


--
-- Name: idx_crystal_candle_pairings_crystal; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_crystal_candle_pairings_crystal ON public.crystal_candle_pairings USING btree (crystal_id);


--
-- Name: idx_crystal_herb_pairings_crystal; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_crystal_herb_pairings_crystal ON public.crystal_herb_pairings USING btree (crystal_id);


--
-- Name: idx_crystal_herb_pairings_herb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_crystal_herb_pairings_herb ON public.crystal_herb_pairings USING btree (herb_id);


--
-- Name: idx_crystal_substitutes_crystal; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_crystal_substitutes_crystal ON public.crystal_substitutes USING btree (crystal_id);


--
-- Name: idx_crystal_substitutes_substitute; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_crystal_substitutes_substitute ON public.crystal_substitutes USING btree (substitute_crystal_id);


--
-- Name: idx_crystals_chakra; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_crystals_chakra ON public.crystals USING btree (chakra) WHERE (deleted_at IS NULL);


--
-- Name: idx_crystals_element; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_crystals_element ON public.crystals USING btree (element) WHERE (deleted_at IS NULL);


--
-- Name: idx_crystals_fulltext; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_crystals_fulltext ON public.crystals USING gin (to_tsvector('english'::regconfig, (((name)::text || ' '::text) || COALESCE(description, ''::text))));


--
-- Name: idx_crystals_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_crystals_name ON public.crystals USING btree (name) WHERE (deleted_at IS NULL);


--
-- Name: idx_crystals_properties; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_crystals_properties ON public.crystals USING gin (magical_properties);


--
-- Name: idx_crystals_slug; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_crystals_slug ON public.crystals USING btree (slug) WHERE (deleted_at IS NULL);


--
-- Name: idx_crystals_verified; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_crystals_verified ON public.crystals USING btree (is_verified) WHERE (deleted_at IS NULL);


--
-- Name: idx_deities_pantheon; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_deities_pantheon ON public.deities USING btree (pantheon);


--
-- Name: idx_deities_slug; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_deities_slug ON public.deities USING btree (slug);


--
-- Name: idx_deity_crystals_crystal; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_deity_crystals_crystal ON public.deity_crystals USING btree (crystal_id);


--
-- Name: idx_deity_crystals_deity; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_deity_crystals_deity ON public.deity_crystals USING btree (deity_id);


--
-- Name: idx_deity_herbs_deity; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_deity_herbs_deity ON public.deity_herbs USING btree (deity_id);


--
-- Name: idx_deity_herbs_herb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_deity_herbs_herb ON public.deity_herbs USING btree (herb_id);


--
-- Name: idx_entity_categories_category; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_entity_categories_category ON public.entity_categories USING btree (category_id);


--
-- Name: idx_entity_categories_type_category; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_entity_categories_type_category ON public.entity_categories USING btree (entity_type, category_id);


--
-- Name: idx_entity_categories_type_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_entity_categories_type_id ON public.entity_categories USING btree (entity_type, entity_id);


--
-- Name: idx_entity_tags_tag; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_entity_tags_tag ON public.entity_tags USING btree (tag_id);


--
-- Name: idx_entity_tags_type_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_entity_tags_type_id ON public.entity_tags USING btree (entity_type, entity_id);


--
-- Name: idx_entity_tags_type_tag; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_entity_tags_type_tag ON public.entity_tags USING btree (entity_type, tag_id);


--
-- Name: idx_entity_views_date; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_entity_views_date ON public.entity_views USING btree (viewed_at);


--
-- Name: idx_entity_views_type_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_entity_views_type_id ON public.entity_views USING btree (entity_type, entity_id);


--
-- Name: idx_entity_views_user; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_entity_views_user ON public.entity_views USING btree (user_id);


--
-- Name: idx_grimoire_candles_candle; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_grimoire_candles_candle ON public.grimoire_candles USING btree (candle_id);


--
-- Name: idx_grimoire_candles_grimoire; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_grimoire_candles_grimoire ON public.grimoire_candles USING btree (grimoire_id);


--
-- Name: idx_grimoire_crystals_crystal; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_grimoire_crystals_crystal ON public.grimoire_crystals USING btree (crystal_id);


--
-- Name: idx_grimoire_crystals_grimoire; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_grimoire_crystals_grimoire ON public.grimoire_crystals USING btree (grimoire_id);


--
-- Name: idx_grimoire_dislikes_grimoire; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_grimoire_dislikes_grimoire ON public.grimoire_dislikes USING btree (grimoire_id);


--
-- Name: idx_grimoire_dislikes_user; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_grimoire_dislikes_user ON public.grimoire_dislikes USING btree (user_id);


--
-- Name: idx_grimoire_favorites_grimoire; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_grimoire_favorites_grimoire ON public.grimoire_favorites USING btree (grimoire_id);


--
-- Name: idx_grimoire_favorites_user; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_grimoire_favorites_user ON public.grimoire_favorites USING btree (user_id);


--
-- Name: idx_grimoire_herbs_grimoire; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_grimoire_herbs_grimoire ON public.grimoire_herbs USING btree (grimoire_id);


--
-- Name: idx_grimoire_herbs_herb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_grimoire_herbs_herb ON public.grimoire_herbs USING btree (herb_id);


--
-- Name: idx_grimoire_incense_grimoire; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_grimoire_incense_grimoire ON public.grimoire_incense USING btree (grimoire_id);


--
-- Name: idx_grimoire_incense_incense; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_grimoire_incense_incense ON public.grimoire_incense USING btree (incense_id);


--
-- Name: idx_grimoire_likes_grimoire; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_grimoire_likes_grimoire ON public.grimoire_likes USING btree (grimoire_id);


--
-- Name: idx_grimoire_likes_user; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_grimoire_likes_user ON public.grimoire_likes USING btree (user_id);


--
-- Name: idx_grimoire_media_grimoire; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_grimoire_media_grimoire ON public.grimoire_media USING btree (grimoire_id);


--
-- Name: idx_grimoire_media_primary; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_grimoire_media_primary ON public.grimoire_media USING btree (grimoire_id, is_primary) WHERE (is_primary = true);


--
-- Name: idx_grimoire_oils_grimoire; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_grimoire_oils_grimoire ON public.grimoire_oils USING btree (grimoire_id);


--
-- Name: idx_grimoire_oils_oil; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_grimoire_oils_oil ON public.grimoire_oils USING btree (oil_id);


--
-- Name: idx_grimoire_salts_grimoire; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_grimoire_salts_grimoire ON public.grimoire_salts USING btree (grimoire_id);


--
-- Name: idx_grimoire_salts_salt; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_grimoire_salts_salt ON public.grimoire_salts USING btree (salt_id);


--
-- Name: idx_grimoire_stats_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX idx_grimoire_stats_id ON public.grimoire_stats USING btree (id);


--
-- Name: idx_grimoire_views_date; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_grimoire_views_date ON public.grimoire_views USING btree (viewed_at);


--
-- Name: idx_grimoire_views_grimoire; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_grimoire_views_grimoire ON public.grimoire_views USING btree (grimoire_id);


--
-- Name: idx_grimoire_views_user; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_grimoire_views_user ON public.grimoire_views USING btree (user_id);


--
-- Name: idx_grimoires_author; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_grimoires_author ON public.grimoires USING btree (author_id) WHERE (deleted_at IS NULL);


--
-- Name: idx_grimoires_featured; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_grimoires_featured ON public.grimoires USING btree (is_featured, featured_at DESC) WHERE ((is_featured = true) AND (deleted_at IS NULL));


--
-- Name: idx_grimoires_fulltext; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_grimoires_fulltext ON public.grimoires USING gin (to_tsvector('english'::regconfig, (((title)::text || ' '::text) || content)));


--
-- Name: idx_grimoires_published; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_grimoires_published ON public.grimoires USING btree (published_at DESC) WHERE ((published_at IS NOT NULL) AND (deleted_at IS NULL));


--
-- Name: idx_grimoires_slug; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_grimoires_slug ON public.grimoires USING btree (slug) WHERE (deleted_at IS NULL);


--
-- Name: idx_grimoires_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_grimoires_status ON public.grimoires USING btree (status) WHERE (deleted_at IS NULL);


--
-- Name: idx_grimoires_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_grimoires_type ON public.grimoires USING btree (content_type_id) WHERE (deleted_at IS NULL);


--
-- Name: idx_herb_candle_pairings_candle; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_herb_candle_pairings_candle ON public.herb_candle_pairings USING btree (candle_id);


--
-- Name: idx_herb_candle_pairings_herb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_herb_candle_pairings_herb ON public.herb_candle_pairings USING btree (herb_id);


--
-- Name: idx_herb_substitutes_herb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_herb_substitutes_herb ON public.herb_substitutes USING btree (herb_id);


--
-- Name: idx_herb_substitutes_substitute; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_herb_substitutes_substitute ON public.herb_substitutes USING btree (substitute_herb_id);


--
-- Name: idx_herbs_element; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_herbs_element ON public.herbs USING btree (element) WHERE (deleted_at IS NULL);


--
-- Name: idx_herbs_fulltext; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_herbs_fulltext ON public.herbs USING gin (to_tsvector('english'::regconfig, (((((name)::text || ' '::text) || (COALESCE(scientific_name, ''::character varying))::text) || ' '::text) || COALESCE(description, ''::text))));


--
-- Name: idx_herbs_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_herbs_name ON public.herbs USING btree (name) WHERE (deleted_at IS NULL);


--
-- Name: idx_herbs_properties; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_herbs_properties ON public.herbs USING gin (magical_properties);


--
-- Name: idx_herbs_scientific; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_herbs_scientific ON public.herbs USING btree (scientific_name) WHERE (deleted_at IS NULL);


--
-- Name: idx_herbs_slug; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_herbs_slug ON public.herbs USING btree (slug) WHERE (deleted_at IS NULL);


--
-- Name: idx_herbs_verified; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_herbs_verified ON public.herbs USING btree (is_verified) WHERE (deleted_at IS NULL);


--
-- Name: idx_incense_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_incense_name ON public.incense USING btree (name) WHERE (deleted_at IS NULL);


--
-- Name: idx_incense_properties; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_incense_properties ON public.incense USING gin (magical_properties);


--
-- Name: idx_incense_slug; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_incense_slug ON public.incense USING btree (slug) WHERE (deleted_at IS NULL);


--
-- Name: idx_incense_verified; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_incense_verified ON public.incense USING btree (is_verified) WHERE (deleted_at IS NULL);


--
-- Name: idx_media_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_media_type ON public.media_files USING btree (file_type) WHERE (deleted_at IS NULL);


--
-- Name: idx_media_uploader; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_media_uploader ON public.media_files USING btree (uploader_id) WHERE (deleted_at IS NULL);


--
-- Name: idx_oil_substitutes_oil; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_oil_substitutes_oil ON public.oil_substitutes USING btree (oil_id);


--
-- Name: idx_oil_substitutes_substitute; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_oil_substitutes_substitute ON public.oil_substitutes USING btree (substitute_oil_id);


--
-- Name: idx_oils_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_oils_name ON public.oils USING btree (name) WHERE (deleted_at IS NULL);


--
-- Name: idx_oils_properties; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_oils_properties ON public.oils USING gin (magical_properties);


--
-- Name: idx_oils_slug; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_oils_slug ON public.oils USING btree (slug) WHERE (deleted_at IS NULL);


--
-- Name: idx_oils_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_oils_type ON public.oils USING btree (oil_type) WHERE (deleted_at IS NULL);


--
-- Name: idx_oils_verified; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_oils_verified ON public.oils USING btree (is_verified) WHERE (deleted_at IS NULL);


--
-- Name: idx_sabbats_slug; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_sabbats_slug ON public.sabbats USING btree (slug);


--
-- Name: idx_salts_has_recipe; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_salts_has_recipe ON public.salts USING btree (has_recipe) WHERE ((has_recipe = true) AND (deleted_at IS NULL));


--
-- Name: idx_salts_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_salts_name ON public.salts USING btree (name) WHERE (deleted_at IS NULL);


--
-- Name: idx_salts_properties; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_salts_properties ON public.salts USING gin (magical_properties);


--
-- Name: idx_salts_slug; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_salts_slug ON public.salts USING btree (slug) WHERE (deleted_at IS NULL);


--
-- Name: idx_salts_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_salts_type ON public.salts USING btree (salt_type) WHERE (deleted_at IS NULL);


--
-- Name: idx_salts_verified; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_salts_verified ON public.salts USING btree (is_verified) WHERE (deleted_at IS NULL);


--
-- Name: idx_tags_slug; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tags_slug ON public.tags USING btree (slug);


--
-- Name: idx_tags_usage; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tags_usage ON public.tags USING btree (usage_count DESC);


--
-- Name: idx_user_boards_user; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_user_boards_user ON public.user_boards USING btree (user_id) WHERE (deleted_at IS NULL);


--
-- Name: idx_user_bookmarks_type_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_user_bookmarks_type_id ON public.user_bookmarks USING btree (entity_type, entity_id);


--
-- Name: idx_user_bookmarks_user; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_user_bookmarks_user ON public.user_bookmarks USING btree (user_id);


--
-- Name: idx_user_stats_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX idx_user_stats_id ON public.user_stats USING btree (id);


--
-- Name: idx_user_subscriptions_user_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_user_subscriptions_user_status ON public.user_subscriptions USING btree (user_id, status);


--
-- Name: idx_zodiac_slug; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_zodiac_slug ON public.zodiac_signs USING btree (slug);


--
-- Name: entity_tags decrement_tag_usage_trigger; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER decrement_tag_usage_trigger AFTER DELETE ON public.entity_tags FOR EACH ROW EXECUTE FUNCTION public.decrement_tag_usage();


--
-- Name: entity_tags increment_tag_usage_trigger; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER increment_tag_usage_trigger AFTER INSERT ON public.entity_tags FOR EACH ROW EXECUTE FUNCTION public.increment_tag_usage();


--
-- Name: candles update_candles_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_candles_updated_at BEFORE UPDATE ON public.candles FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: categories update_categories_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_categories_updated_at BEFORE UPDATE ON public.categories FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: comments update_comments_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_comments_updated_at BEFORE UPDATE ON public.comments FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: content_types update_content_types_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_content_types_updated_at BEFORE UPDATE ON public.content_types FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: crystals update_crystals_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_crystals_updated_at BEFORE UPDATE ON public.crystals FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: deities update_deities_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_deities_updated_at BEFORE UPDATE ON public.deities FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: grimoires update_grimoires_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_grimoires_updated_at BEFORE UPDATE ON public.grimoires FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: herbs update_herbs_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_herbs_updated_at BEFORE UPDATE ON public.herbs FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: incense update_incense_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_incense_updated_at BEFORE UPDATE ON public.incense FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: oils update_oils_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_oils_updated_at BEFORE UPDATE ON public.oils FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: sabbats update_sabbats_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_sabbats_updated_at BEFORE UPDATE ON public.sabbats FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: salts update_salts_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_salts_updated_at BEFORE UPDATE ON public.salts FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: tags update_tags_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_tags_updated_at BEFORE UPDATE ON public.tags FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: user_boards update_user_boards_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_user_boards_updated_at BEFORE UPDATE ON public.user_boards FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: user_settings update_user_settings_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_user_settings_updated_at BEFORE UPDATE ON public.user_settings FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: users update_users_updated_at; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_users_updated_at BEFORE UPDATE ON public.users FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();


--
-- Name: board_items board_items_board_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.board_items
    ADD CONSTRAINT board_items_board_id_fkey FOREIGN KEY (board_id) REFERENCES public.user_boards(id) ON DELETE CASCADE;


--
-- Name: board_items board_items_grimoire_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.board_items
    ADD CONSTRAINT board_items_grimoire_id_fkey FOREIGN KEY (grimoire_id) REFERENCES public.grimoires(id) ON DELETE CASCADE;


--
-- Name: candles candles_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.candles
    ADD CONSTRAINT candles_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.users(id);


--
-- Name: candles candles_verified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.candles
    ADD CONSTRAINT candles_verified_by_fkey FOREIGN KEY (verified_by) REFERENCES public.users(id);


--
-- Name: categories categories_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- Name: comment_likes comment_likes_comment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comment_likes
    ADD CONSTRAINT comment_likes_comment_id_fkey FOREIGN KEY (comment_id) REFERENCES public.comments(id) ON DELETE CASCADE;


--
-- Name: comment_likes comment_likes_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comment_likes
    ADD CONSTRAINT comment_likes_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: comments comments_grimoire_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_grimoire_id_fkey FOREIGN KEY (grimoire_id) REFERENCES public.grimoires(id) ON DELETE CASCADE;


--
-- Name: comments comments_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES public.comments(id) ON DELETE CASCADE;


--
-- Name: comments comments_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: crystal_candle_pairings crystal_candle_pairings_candle_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crystal_candle_pairings
    ADD CONSTRAINT crystal_candle_pairings_candle_id_fkey FOREIGN KEY (candle_id) REFERENCES public.candles(id) ON DELETE CASCADE;


--
-- Name: crystal_candle_pairings crystal_candle_pairings_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crystal_candle_pairings
    ADD CONSTRAINT crystal_candle_pairings_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.users(id);


--
-- Name: crystal_candle_pairings crystal_candle_pairings_crystal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crystal_candle_pairings
    ADD CONSTRAINT crystal_candle_pairings_crystal_id_fkey FOREIGN KEY (crystal_id) REFERENCES public.crystals(id) ON DELETE CASCADE;


--
-- Name: crystal_herb_pairings crystal_herb_pairings_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crystal_herb_pairings
    ADD CONSTRAINT crystal_herb_pairings_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.users(id);


--
-- Name: crystal_herb_pairings crystal_herb_pairings_crystal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crystal_herb_pairings
    ADD CONSTRAINT crystal_herb_pairings_crystal_id_fkey FOREIGN KEY (crystal_id) REFERENCES public.crystals(id) ON DELETE CASCADE;


--
-- Name: crystal_herb_pairings crystal_herb_pairings_herb_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crystal_herb_pairings
    ADD CONSTRAINT crystal_herb_pairings_herb_id_fkey FOREIGN KEY (herb_id) REFERENCES public.herbs(id) ON DELETE CASCADE;


--
-- Name: crystal_substitutes crystal_substitutes_crystal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crystal_substitutes
    ADD CONSTRAINT crystal_substitutes_crystal_id_fkey FOREIGN KEY (crystal_id) REFERENCES public.crystals(id) ON DELETE CASCADE;


--
-- Name: crystal_substitutes crystal_substitutes_substitute_crystal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crystal_substitutes
    ADD CONSTRAINT crystal_substitutes_substitute_crystal_id_fkey FOREIGN KEY (substitute_crystal_id) REFERENCES public.crystals(id) ON DELETE CASCADE;


--
-- Name: crystals crystals_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crystals
    ADD CONSTRAINT crystals_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.users(id);


--
-- Name: crystals crystals_verified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.crystals
    ADD CONSTRAINT crystals_verified_by_fkey FOREIGN KEY (verified_by) REFERENCES public.users(id);


--
-- Name: deity_crystals deity_crystals_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.deity_crystals
    ADD CONSTRAINT deity_crystals_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.users(id);


--
-- Name: deity_crystals deity_crystals_crystal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.deity_crystals
    ADD CONSTRAINT deity_crystals_crystal_id_fkey FOREIGN KEY (crystal_id) REFERENCES public.crystals(id) ON DELETE CASCADE;


--
-- Name: deity_crystals deity_crystals_deity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.deity_crystals
    ADD CONSTRAINT deity_crystals_deity_id_fkey FOREIGN KEY (deity_id) REFERENCES public.deities(id) ON DELETE CASCADE;


--
-- Name: deity_herbs deity_herbs_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.deity_herbs
    ADD CONSTRAINT deity_herbs_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.users(id);


--
-- Name: deity_herbs deity_herbs_deity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.deity_herbs
    ADD CONSTRAINT deity_herbs_deity_id_fkey FOREIGN KEY (deity_id) REFERENCES public.deities(id) ON DELETE CASCADE;


--
-- Name: deity_herbs deity_herbs_herb_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.deity_herbs
    ADD CONSTRAINT deity_herbs_herb_id_fkey FOREIGN KEY (herb_id) REFERENCES public.herbs(id) ON DELETE CASCADE;


--
-- Name: entity_categories entity_categories_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.entity_categories
    ADD CONSTRAINT entity_categories_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- Name: entity_tags entity_tags_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.entity_tags
    ADD CONSTRAINT entity_tags_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES public.tags(id) ON DELETE CASCADE;


--
-- Name: entity_views entity_views_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.entity_views
    ADD CONSTRAINT entity_views_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: grimoire_candles grimoire_candles_candle_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grimoire_candles
    ADD CONSTRAINT grimoire_candles_candle_id_fkey FOREIGN KEY (candle_id) REFERENCES public.candles(id) ON DELETE CASCADE;


--
-- Name: grimoire_candles grimoire_candles_grimoire_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grimoire_candles
    ADD CONSTRAINT grimoire_candles_grimoire_id_fkey FOREIGN KEY (grimoire_id) REFERENCES public.grimoires(id) ON DELETE CASCADE;


--
-- Name: grimoire_crystals grimoire_crystals_crystal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grimoire_crystals
    ADD CONSTRAINT grimoire_crystals_crystal_id_fkey FOREIGN KEY (crystal_id) REFERENCES public.crystals(id) ON DELETE CASCADE;


--
-- Name: grimoire_crystals grimoire_crystals_grimoire_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grimoire_crystals
    ADD CONSTRAINT grimoire_crystals_grimoire_id_fkey FOREIGN KEY (grimoire_id) REFERENCES public.grimoires(id) ON DELETE CASCADE;


--
-- Name: grimoire_deities grimoire_deities_deity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grimoire_deities
    ADD CONSTRAINT grimoire_deities_deity_id_fkey FOREIGN KEY (deity_id) REFERENCES public.deities(id) ON DELETE CASCADE;


--
-- Name: grimoire_deities grimoire_deities_grimoire_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grimoire_deities
    ADD CONSTRAINT grimoire_deities_grimoire_id_fkey FOREIGN KEY (grimoire_id) REFERENCES public.grimoires(id) ON DELETE CASCADE;


--
-- Name: grimoire_dislikes grimoire_dislikes_grimoire_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grimoire_dislikes
    ADD CONSTRAINT grimoire_dislikes_grimoire_id_fkey FOREIGN KEY (grimoire_id) REFERENCES public.grimoires(id) ON DELETE CASCADE;


--
-- Name: grimoire_dislikes grimoire_dislikes_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grimoire_dislikes
    ADD CONSTRAINT grimoire_dislikes_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: grimoire_favorites grimoire_favorites_grimoire_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grimoire_favorites
    ADD CONSTRAINT grimoire_favorites_grimoire_id_fkey FOREIGN KEY (grimoire_id) REFERENCES public.grimoires(id) ON DELETE CASCADE;


--
-- Name: grimoire_favorites grimoire_favorites_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grimoire_favorites
    ADD CONSTRAINT grimoire_favorites_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: grimoire_herbs grimoire_herbs_grimoire_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grimoire_herbs
    ADD CONSTRAINT grimoire_herbs_grimoire_id_fkey FOREIGN KEY (grimoire_id) REFERENCES public.grimoires(id) ON DELETE CASCADE;


--
-- Name: grimoire_herbs grimoire_herbs_herb_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grimoire_herbs
    ADD CONSTRAINT grimoire_herbs_herb_id_fkey FOREIGN KEY (herb_id) REFERENCES public.herbs(id) ON DELETE CASCADE;


--
-- Name: grimoire_incense grimoire_incense_grimoire_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grimoire_incense
    ADD CONSTRAINT grimoire_incense_grimoire_id_fkey FOREIGN KEY (grimoire_id) REFERENCES public.grimoires(id) ON DELETE CASCADE;


--
-- Name: grimoire_incense grimoire_incense_incense_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grimoire_incense
    ADD CONSTRAINT grimoire_incense_incense_id_fkey FOREIGN KEY (incense_id) REFERENCES public.incense(id) ON DELETE CASCADE;


--
-- Name: grimoire_likes grimoire_likes_grimoire_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grimoire_likes
    ADD CONSTRAINT grimoire_likes_grimoire_id_fkey FOREIGN KEY (grimoire_id) REFERENCES public.grimoires(id) ON DELETE CASCADE;


--
-- Name: grimoire_likes grimoire_likes_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grimoire_likes
    ADD CONSTRAINT grimoire_likes_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: grimoire_media grimoire_media_grimoire_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grimoire_media
    ADD CONSTRAINT grimoire_media_grimoire_id_fkey FOREIGN KEY (grimoire_id) REFERENCES public.grimoires(id) ON DELETE CASCADE;


--
-- Name: grimoire_media grimoire_media_media_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grimoire_media
    ADD CONSTRAINT grimoire_media_media_id_fkey FOREIGN KEY (media_id) REFERENCES public.media_files(id) ON DELETE CASCADE;


--
-- Name: grimoire_moon_phases grimoire_moon_phases_grimoire_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grimoire_moon_phases
    ADD CONSTRAINT grimoire_moon_phases_grimoire_id_fkey FOREIGN KEY (grimoire_id) REFERENCES public.grimoires(id) ON DELETE CASCADE;


--
-- Name: grimoire_moon_phases grimoire_moon_phases_moon_phase_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grimoire_moon_phases
    ADD CONSTRAINT grimoire_moon_phases_moon_phase_id_fkey FOREIGN KEY (moon_phase_id) REFERENCES public.moon_phases(id) ON DELETE CASCADE;


--
-- Name: grimoire_oils grimoire_oils_grimoire_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grimoire_oils
    ADD CONSTRAINT grimoire_oils_grimoire_id_fkey FOREIGN KEY (grimoire_id) REFERENCES public.grimoires(id) ON DELETE CASCADE;


--
-- Name: grimoire_oils grimoire_oils_oil_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grimoire_oils
    ADD CONSTRAINT grimoire_oils_oil_id_fkey FOREIGN KEY (oil_id) REFERENCES public.oils(id) ON DELETE CASCADE;


--
-- Name: grimoire_sabbats grimoire_sabbats_grimoire_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grimoire_sabbats
    ADD CONSTRAINT grimoire_sabbats_grimoire_id_fkey FOREIGN KEY (grimoire_id) REFERENCES public.grimoires(id) ON DELETE CASCADE;


--
-- Name: grimoire_sabbats grimoire_sabbats_sabbat_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grimoire_sabbats
    ADD CONSTRAINT grimoire_sabbats_sabbat_id_fkey FOREIGN KEY (sabbat_id) REFERENCES public.sabbats(id) ON DELETE CASCADE;


--
-- Name: grimoire_salts grimoire_salts_grimoire_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grimoire_salts
    ADD CONSTRAINT grimoire_salts_grimoire_id_fkey FOREIGN KEY (grimoire_id) REFERENCES public.grimoires(id) ON DELETE CASCADE;


--
-- Name: grimoire_salts grimoire_salts_salt_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grimoire_salts
    ADD CONSTRAINT grimoire_salts_salt_id_fkey FOREIGN KEY (salt_id) REFERENCES public.salts(id) ON DELETE CASCADE;


--
-- Name: grimoire_views grimoire_views_grimoire_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grimoire_views
    ADD CONSTRAINT grimoire_views_grimoire_id_fkey FOREIGN KEY (grimoire_id) REFERENCES public.grimoires(id) ON DELETE CASCADE;


--
-- Name: grimoire_views grimoire_views_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grimoire_views
    ADD CONSTRAINT grimoire_views_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: grimoire_zodiac grimoire_zodiac_grimoire_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grimoire_zodiac
    ADD CONSTRAINT grimoire_zodiac_grimoire_id_fkey FOREIGN KEY (grimoire_id) REFERENCES public.grimoires(id) ON DELETE CASCADE;


--
-- Name: grimoire_zodiac grimoire_zodiac_zodiac_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grimoire_zodiac
    ADD CONSTRAINT grimoire_zodiac_zodiac_id_fkey FOREIGN KEY (zodiac_id) REFERENCES public.zodiac_signs(id) ON DELETE CASCADE;


--
-- Name: grimoires grimoires_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grimoires
    ADD CONSTRAINT grimoires_author_id_fkey FOREIGN KEY (author_id) REFERENCES public.users(id);


--
-- Name: grimoires grimoires_content_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grimoires
    ADD CONSTRAINT grimoires_content_type_id_fkey FOREIGN KEY (content_type_id) REFERENCES public.content_types(id);


--
-- Name: grimoires grimoires_previous_version_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grimoires
    ADD CONSTRAINT grimoires_previous_version_id_fkey FOREIGN KEY (previous_version_id) REFERENCES public.grimoires(id);


--
-- Name: herb_candle_pairings herb_candle_pairings_candle_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.herb_candle_pairings
    ADD CONSTRAINT herb_candle_pairings_candle_id_fkey FOREIGN KEY (candle_id) REFERENCES public.candles(id) ON DELETE CASCADE;


--
-- Name: herb_candle_pairings herb_candle_pairings_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.herb_candle_pairings
    ADD CONSTRAINT herb_candle_pairings_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.users(id);


--
-- Name: herb_candle_pairings herb_candle_pairings_herb_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.herb_candle_pairings
    ADD CONSTRAINT herb_candle_pairings_herb_id_fkey FOREIGN KEY (herb_id) REFERENCES public.herbs(id) ON DELETE CASCADE;


--
-- Name: herb_substitutes herb_substitutes_herb_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.herb_substitutes
    ADD CONSTRAINT herb_substitutes_herb_id_fkey FOREIGN KEY (herb_id) REFERENCES public.herbs(id) ON DELETE CASCADE;


--
-- Name: herb_substitutes herb_substitutes_substitute_herb_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.herb_substitutes
    ADD CONSTRAINT herb_substitutes_substitute_herb_id_fkey FOREIGN KEY (substitute_herb_id) REFERENCES public.herbs(id) ON DELETE CASCADE;


--
-- Name: herbs herbs_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.herbs
    ADD CONSTRAINT herbs_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.users(id);


--
-- Name: herbs herbs_verified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.herbs
    ADD CONSTRAINT herbs_verified_by_fkey FOREIGN KEY (verified_by) REFERENCES public.users(id);


--
-- Name: incense incense_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.incense
    ADD CONSTRAINT incense_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.users(id);


--
-- Name: incense incense_verified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.incense
    ADD CONSTRAINT incense_verified_by_fkey FOREIGN KEY (verified_by) REFERENCES public.users(id);


--
-- Name: media_files media_files_uploader_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.media_files
    ADD CONSTRAINT media_files_uploader_id_fkey FOREIGN KEY (uploader_id) REFERENCES public.users(id);


--
-- Name: oil_substitutes oil_substitutes_oil_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oil_substitutes
    ADD CONSTRAINT oil_substitutes_oil_id_fkey FOREIGN KEY (oil_id) REFERENCES public.oils(id) ON DELETE CASCADE;


--
-- Name: oil_substitutes oil_substitutes_substitute_oil_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oil_substitutes
    ADD CONSTRAINT oil_substitutes_substitute_oil_id_fkey FOREIGN KEY (substitute_oil_id) REFERENCES public.oils(id) ON DELETE CASCADE;


--
-- Name: oils oils_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oils
    ADD CONSTRAINT oils_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.users(id);


--
-- Name: oils oils_verified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oils
    ADD CONSTRAINT oils_verified_by_fkey FOREIGN KEY (verified_by) REFERENCES public.users(id);


--
-- Name: role_permissions role_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.role_permissions
    ADD CONSTRAINT role_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON DELETE CASCADE;


--
-- Name: role_permissions role_permissions_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.role_permissions
    ADD CONSTRAINT role_permissions_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- Name: salts salts_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.salts
    ADD CONSTRAINT salts_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.users(id);


--
-- Name: salts salts_verified_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.salts
    ADD CONSTRAINT salts_verified_by_fkey FOREIGN KEY (verified_by) REFERENCES public.users(id);


--
-- Name: user_activity_log user_activity_log_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_activity_log
    ADD CONSTRAINT user_activity_log_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: user_boards user_boards_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_boards
    ADD CONSTRAINT user_boards_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: user_bookmarks user_bookmarks_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_bookmarks
    ADD CONSTRAINT user_bookmarks_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: user_roles user_roles_assigned_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_assigned_by_fkey FOREIGN KEY (assigned_by) REFERENCES public.users(id);


--
-- Name: user_roles user_roles_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- Name: user_roles user_roles_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: user_settings user_settings_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_settings
    ADD CONSTRAINT user_settings_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: user_subscriptions user_subscriptions_tier_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_subscriptions
    ADD CONSTRAINT user_subscriptions_tier_id_fkey FOREIGN KEY (tier_id) REFERENCES public.subscription_tiers(id);


--
-- Name: user_subscriptions user_subscriptions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_subscriptions
    ADD CONSTRAINT user_subscriptions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict 1C4mQFp0JvYy3epfUhieppyb1AzIMxeVriehiLUfpMDRaqS12FiWrjPwJoKW6gJ

