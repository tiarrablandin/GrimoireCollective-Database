-- =============================================================================
-- GRIMOIRE COLLECTIVE DATABASE SCHEMA
-- =============================================================================
-- Purpose: Core database schema for a comprehensive pagan/spiritual knowledge platform
-- Created: 2025-12-28
-- =============================================================================

-- =============================================================================
-- USERS & AUTHENTICATION
-- =============================================================================

-- Roles table
CREATE TABLE roles (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(50) UNIQUE NOT NULL,
    description TEXT,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Create default roles
INSERT INTO roles (name, description) VALUES
    ('super_admin', 'Super administrator with full system access'),
    ('admin', 'Administrator with elevated privileges'),
    ('user', 'Regular user with standard access');

-- Permissions table
CREATE TABLE permissions (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(100) UNIQUE NOT NULL,
    description TEXT,
    resource VARCHAR(50) NOT NULL,
    action VARCHAR(50) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Role permissions junction table
CREATE TABLE role_permissions (
    role_id UUID NOT NULL REFERENCES roles(id) ON DELETE CASCADE,
    permission_id UUID NOT NULL REFERENCES permissions(id) ON DELETE CASCADE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (role_id, permission_id)
);

-- Users table
CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    display_name VARCHAR(100),
    avatar_url TEXT,
    bio TEXT,
    location VARCHAR(100),
    website_url TEXT,
    is_email_verified BOOLEAN DEFAULT FALSE,
    is_active BOOLEAN DEFAULT TRUE,
    last_login_at TIMESTAMP,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP,
    CONSTRAINT username_min_length CHECK (char_length(username) >= 3),
    CONSTRAINT email_format CHECK (email ~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$')
);

-- User roles junction table
CREATE TABLE user_roles (
    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    role_id UUID NOT NULL REFERENCES roles(id) ON DELETE CASCADE,
    assigned_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    assigned_by UUID REFERENCES users(id),
    PRIMARY KEY (user_id, role_id)
);

-- User settings
CREATE TABLE user_settings (
    user_id UUID PRIMARY KEY REFERENCES users(id) ON DELETE CASCADE,
    theme VARCHAR(20) DEFAULT 'light',
    language VARCHAR(10) DEFAULT 'en',
    timezone VARCHAR(50) DEFAULT 'UTC',
    email_notifications BOOLEAN DEFAULT TRUE,
    push_notifications BOOLEAN DEFAULT TRUE,
    privacy_profile_public BOOLEAN DEFAULT TRUE,
    privacy_show_email BOOLEAN DEFAULT FALSE,
    settings_json JSONB,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- =============================================================================
-- SUBSCRIPTION SYSTEM (Future-ready)
-- =============================================================================

CREATE TABLE subscription_tiers (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(50) UNIQUE NOT NULL,
    description TEXT,
    price_monthly DECIMAL(10, 2),
    price_yearly DECIMAL(10, 2),
    features JSONB,
    max_grimoires INTEGER,
    max_storage_mb INTEGER,
    is_active BOOLEAN DEFAULT TRUE,
    sort_order INTEGER DEFAULT 0,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Insert default free tier
INSERT INTO subscription_tiers (name, description, price_monthly, price_yearly, features, max_grimoires, max_storage_mb) VALUES
    ('free', 'Free tier with basic access', 0.00, 0.00, '{"access": "basic"}', 10, 100);

CREATE TABLE user_subscriptions (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    tier_id UUID NOT NULL REFERENCES subscription_tiers(id),
    status VARCHAR(20) NOT NULL DEFAULT 'active',
    started_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    expires_at TIMESTAMP,
    cancelled_at TIMESTAMP,
    payment_provider VARCHAR(50),
    payment_id VARCHAR(255),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT valid_status CHECK (status IN ('active', 'cancelled', 'expired', 'suspended'))
);

CREATE INDEX idx_user_subscriptions_user_status ON user_subscriptions(user_id, status);

-- =============================================================================
-- CONTENT TYPES & STATUS
-- =============================================================================

CREATE TABLE content_types (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(50) UNIQUE NOT NULL,
    slug VARCHAR(50) UNIQUE NOT NULL,
    description TEXT,
    is_active BOOLEAN DEFAULT TRUE,
    sort_order INTEGER DEFAULT 0,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Insert default content types
INSERT INTO content_types (name, slug, description) VALUES
    ('Spell', 'spell', 'Magical spells and incantations'),
    ('Ritual', 'ritual', 'Ceremonial rituals and practices'),
    ('Recipe', 'recipe', 'Potions, tinctures, and magical recipes'),
    ('Guide', 'guide', 'Instructions and how-to guides (casting circles, grounding, etc.)'),
    ('Herb', 'herb', 'Information about magical herbs'),
    ('Crystal', 'crystal', 'Crystal properties and uses'),
    ('Deity', 'deity', 'Gods, goddesses, and deities'),
    ('Holiday', 'holiday', 'Magical holidays and celebrations (Sabbats, Esbats, etc.)'),
    ('Divination', 'divination', 'Divination methods and techniques'),
    ('Astrology', 'astrology', 'Astrological information and charts'),
    ('Meditation', 'meditation', 'Meditation practices and guides'),
    ('Principles', 'principles', 'Magical laws, redes, ethics, and guidelines'),
    ('Tradition', 'tradition', 'Information about magical traditions and paths'),
    ('Article', 'article', 'General articles and information'),
    ('Note', 'note', 'Personal notes and observations');

-- =============================================================================
-- MAIN CONTENT TABLE (GRIMOIRES)
-- =============================================================================

CREATE TABLE grimoires (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    title VARCHAR(255) NOT NULL,
    slug VARCHAR(255) UNIQUE NOT NULL,
    content TEXT NOT NULL,
    excerpt TEXT,
    content_type_id UUID NOT NULL REFERENCES content_types(id),
    author_id UUID NOT NULL REFERENCES users(id),
    
    -- Status and visibility
    status VARCHAR(20) NOT NULL DEFAULT 'draft',
    is_public BOOLEAN DEFAULT TRUE,
    is_featured BOOLEAN DEFAULT FALSE,
    featured_at TIMESTAMP,
    
    -- SEO and metadata
    meta_title VARCHAR(255),
    meta_description TEXT,
    meta_keywords TEXT,
    
    -- Versioning
    version INTEGER DEFAULT 1,
    previous_version_id UUID REFERENCES grimoires(id),
    
    -- Extended metadata as JSONB for flexibility
    metadata JSONB,
    
    -- Timestamps
    published_at TIMESTAMP,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP,
    
    CONSTRAINT valid_status CHECK (status IN ('draft', 'pending_review', 'published', 'archived'))
);

-- Indexes for grimoires
CREATE INDEX idx_grimoires_author ON grimoires(author_id) WHERE deleted_at IS NULL;
CREATE INDEX idx_grimoires_type ON grimoires(content_type_id) WHERE deleted_at IS NULL;
CREATE INDEX idx_grimoires_status ON grimoires(status) WHERE deleted_at IS NULL;
CREATE INDEX idx_grimoires_slug ON grimoires(slug) WHERE deleted_at IS NULL;
CREATE INDEX idx_grimoires_published ON grimoires(published_at DESC) WHERE published_at IS NOT NULL AND deleted_at IS NULL;
CREATE INDEX idx_grimoires_featured ON grimoires(is_featured, featured_at DESC) WHERE is_featured = TRUE AND deleted_at IS NULL;

-- Full-text search index
CREATE INDEX idx_grimoires_fulltext ON grimoires USING GIN (to_tsvector('english', title || ' ' || content));

-- =============================================================================
-- MEDIA FILES
-- =============================================================================

CREATE TABLE media_files (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    uploader_id UUID NOT NULL REFERENCES users(id),
    file_name VARCHAR(255) NOT NULL,
    original_file_name VARCHAR(255) NOT NULL,
    file_path TEXT NOT NULL,
    file_url TEXT NOT NULL,
    file_type VARCHAR(50) NOT NULL,
    mime_type VARCHAR(100) NOT NULL,
    file_size_bytes BIGINT NOT NULL,
    
    -- Image/Video specific
    width INTEGER,
    height INTEGER,
    duration_seconds INTEGER,
    thumbnail_url TEXT,
    
    -- Metadata
    alt_text TEXT,
    caption TEXT,
    metadata JSONB,
    
    -- Storage info
    storage_provider VARCHAR(50) DEFAULT 'local',
    storage_key TEXT,
    
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP,
    
    CONSTRAINT valid_file_type CHECK (file_type IN ('image', 'video', 'audio', 'document'))
);

CREATE INDEX idx_media_uploader ON media_files(uploader_id) WHERE deleted_at IS NULL;
CREATE INDEX idx_media_type ON media_files(file_type) WHERE deleted_at IS NULL;

-- =============================================================================
-- ENTITY MEDIA - UNIFIED POLYMORPHIC JUNCTION TABLE
-- =============================================================================
-- Links any entity type to media files (images, videos, etc.)
-- Replaces: grimoire_media and primary_image_url fields on entity tables

CREATE TABLE entity_media (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    entity_type VARCHAR(50) NOT NULL,
    entity_id UUID NOT NULL,
    media_id UUID NOT NULL REFERENCES media_files(id) ON DELETE CASCADE,
    display_order INTEGER DEFAULT 0,
    is_primary BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    
    UNIQUE(entity_type, entity_id, media_id),
    
    CONSTRAINT valid_entity_type CHECK (entity_type IN (
        'candle', 'chakra', 'crystal', 'deity', 'divination_method',
        'element', 'grimoire', 'herb', 'incense', 'moon_phase',
        'oil', 'pantheon', 'planet', 'ritual_tool', 'sabbat', 
        'salt', 'spell_ethic', 'spell_method', 'tradition', 
        'user', 'user_board', 'zodiac_sign'
    ))
);

CREATE INDEX idx_entity_media_type_id ON entity_media(entity_type, entity_id);
CREATE INDEX idx_entity_media_media ON entity_media(media_id);
CREATE INDEX idx_entity_media_primary ON entity_media(entity_type, entity_id, is_primary) WHERE is_primary = TRUE;

-- Trigger for entity_media will be created later after update_updated_at_column() function is defined

-- =============================================================================
-- TAXONOMY (CATEGORIES & TAGS)
-- =============================================================================
-- Note: Category and tag junction tables have been moved to 05-relationships.sql
-- as unified polymorphic tables (entity_categories and entity_tags) that work
-- with all entity types including grimoires.

CREATE TABLE categories (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(100) NOT NULL,
    slug VARCHAR(100) UNIQUE NOT NULL,
    description TEXT,
    parent_id UUID REFERENCES categories(id) ON DELETE CASCADE,
    -- NOTE: Removed icon and color columns - these are UI concerns that belong in the frontend
    -- Frontend should map category slugs to icons/colors in its own configuration
    is_active BOOLEAN DEFAULT TRUE,
    sort_order INTEGER DEFAULT 0,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_categories_parent ON categories(parent_id);
CREATE INDEX idx_categories_slug ON categories(slug);

CREATE TABLE tags (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(50) UNIQUE NOT NULL,
    slug VARCHAR(50) UNIQUE NOT NULL,
    description TEXT,
    usage_count INTEGER DEFAULT 0,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_tags_slug ON tags(slug);
CREATE INDEX idx_tags_usage ON tags(usage_count DESC);

-- Tag usage count trigger functions (must be defined before the triggers)
CREATE OR REPLACE FUNCTION increment_tag_usage()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE tags SET usage_count = usage_count + 1 WHERE id = NEW.tag_id;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION decrement_tag_usage()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE tags SET usage_count = GREATEST(usage_count - 1, 0) WHERE id = OLD.tag_id;
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

-- =============================================================================
-- ENTITY CATEGORIES & TAGS - UNIFIED POLYMORPHIC JUNCTION TABLES
-- =============================================================================
-- Note: These tables work with any entity type (crystals, herbs, candles,
-- incense, oils, salts, grimoires, deities, calendar, etc.)

-- Unified entity categories (works for all entity types)
CREATE TABLE entity_categories (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    entity_type VARCHAR(50) NOT NULL,
    entity_id UUID NOT NULL,
    category_id UUID NOT NULL REFERENCES categories(id) ON DELETE CASCADE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    
    UNIQUE(entity_type, entity_id, category_id),
    
    CONSTRAINT valid_entity_type CHECK (entity_type IN (
        'crystal', 'herb', 'candle', 'incense', 'oil', 'salt',
        'grimoire', 'deity', 'sabbat', 'moon_phase', 'zodiac_sign'
    ))
);

CREATE INDEX idx_entity_categories_type_id ON entity_categories(entity_type, entity_id);
CREATE INDEX idx_entity_categories_category ON entity_categories(category_id);
CREATE INDEX idx_entity_categories_type_category ON entity_categories(entity_type, category_id);

-- Unified entity tags (works for all entity types)
CREATE TABLE entity_tags (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    entity_type VARCHAR(50) NOT NULL,
    entity_id UUID NOT NULL,
    tag_id UUID NOT NULL REFERENCES tags(id) ON DELETE CASCADE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    
    UNIQUE(entity_type, entity_id, tag_id),
    
    CONSTRAINT valid_entity_type CHECK (entity_type IN (
        'crystal', 'herb', 'candle', 'incense', 'oil', 'salt',
        'grimoire', 'deity', 'sabbat', 'moon_phase', 'zodiac_sign'
    ))
);

CREATE INDEX idx_entity_tags_type_id ON entity_tags(entity_type, entity_id);
CREATE INDEX idx_entity_tags_tag ON entity_tags(tag_id);
CREATE INDEX idx_entity_tags_type_tag ON entity_tags(entity_type, tag_id);

-- Apply tag usage count triggers to entity_tags table
CREATE TRIGGER increment_tag_usage_trigger AFTER INSERT ON entity_tags
    FOR EACH ROW EXECUTE FUNCTION increment_tag_usage();

CREATE TRIGGER decrement_tag_usage_trigger AFTER DELETE ON entity_tags
    FOR EACH ROW EXECUTE FUNCTION decrement_tag_usage();

-- =============================================================================
-- SOCIAL FEATURES
-- =============================================================================

-- Unified grimoire interactions (likes, dislikes, favorites)
CREATE TABLE grimoire_interactions (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    grimoire_id UUID NOT NULL REFERENCES grimoires(id) ON DELETE CASCADE,
    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    interaction_type VARCHAR(20) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    
    UNIQUE(grimoire_id, user_id, interaction_type),
    
    CONSTRAINT valid_interaction_type CHECK (interaction_type IN ('like', 'dislike', 'favorite'))
);

CREATE INDEX idx_grimoire_interactions_grimoire ON grimoire_interactions(grimoire_id);
CREATE INDEX idx_grimoire_interactions_user ON grimoire_interactions(user_id);
CREATE INDEX idx_grimoire_interactions_type ON grimoire_interactions(grimoire_id, interaction_type);

-- Comments
CREATE TABLE comments (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    grimoire_id UUID NOT NULL REFERENCES grimoires(id) ON DELETE CASCADE,
    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    parent_id UUID REFERENCES comments(id) ON DELETE CASCADE,
    content TEXT NOT NULL,
    is_edited BOOLEAN DEFAULT FALSE,
    edited_at TIMESTAMP,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP
);

CREATE INDEX idx_comments_grimoire ON comments(grimoire_id) WHERE deleted_at IS NULL;
CREATE INDEX idx_comments_user ON comments(user_id) WHERE deleted_at IS NULL;
CREATE INDEX idx_comments_parent ON comments(parent_id) WHERE deleted_at IS NULL;

-- Comment likes
CREATE TABLE comment_likes (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    comment_id UUID NOT NULL REFERENCES comments(id) ON DELETE CASCADE,
    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(comment_id, user_id)
);

-- User Boards (Collections/Lists)
CREATE TABLE user_boards (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    is_public BOOLEAN DEFAULT TRUE,
    sort_order INTEGER DEFAULT 0,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP
);

-- Media: Use entity_media table with entity_type='user_board'

CREATE INDEX idx_user_boards_user ON user_boards(user_id) WHERE deleted_at IS NULL;

-- Board items (grimoires in boards)
CREATE TABLE board_items (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    board_id UUID NOT NULL REFERENCES user_boards(id) ON DELETE CASCADE,
    grimoire_id UUID NOT NULL REFERENCES grimoires(id) ON DELETE CASCADE,
    notes TEXT,
    sort_order INTEGER DEFAULT 0,
    added_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(board_id, grimoire_id)
);

CREATE INDEX idx_board_items_board ON board_items(board_id);
CREATE INDEX idx_board_items_grimoire ON board_items(grimoire_id);

-- =============================================================================
-- SPIRITUAL ENTITIES
-- =============================================================================

-- Deities
-- Pantheons (groups of deities from specific cultures)
CREATE TABLE pantheons (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(100) NOT NULL,
    slug VARCHAR(100) UNIQUE NOT NULL,
    culture VARCHAR(100) NOT NULL,
    region VARCHAR(100),
    time_period VARCHAR(100),
    description TEXT,
    mythology_type VARCHAR(50),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Media: Use entity_media table with entity_type='pantheon'

CREATE INDEX idx_pantheons_slug ON pantheons(slug);
CREATE INDEX idx_pantheons_culture ON pantheons(culture);

-- Deities
CREATE TABLE deities (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(100) NOT NULL,
    slug VARCHAR(100) UNIQUE NOT NULL,
    pantheon_id UUID REFERENCES pantheons(id) ON DELETE SET NULL,
    gender VARCHAR(50),
    domains TEXT[],
    symbols TEXT[],
    description TEXT,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Media: Use entity_media table with entity_type='deity'

CREATE INDEX idx_deities_slug ON deities(slug);
CREATE INDEX idx_deities_pantheon ON deities(pantheon_id);

-- Grimoire deities: Use entity_deities table with entity_type='grimoire'
-- Example: INSERT INTO entity_deities (entity_type, entity_id, deity_id, relationship_type)
--          VALUES ('grimoire', grimoire_id_here, deity_id_here, 'invocation');

-- Calendar (Wheel of the Year: Sabbats, Esbats, and other celebrations)
CREATE TABLE calendar (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(100) NOT NULL,
    slug VARCHAR(100) UNIQUE NOT NULL,
    celebration_type VARCHAR(20) NOT NULL,
    -- NOTE: tradition now linked via grimoire_traditions junction table
    -- NOTE: themes now linked via entity_intentions junction table
    date_type VARCHAR(20) NOT NULL,
    fixed_date DATE,
    description TEXT,
    colors TEXT[],
    symbols TEXT[],
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT valid_celebration_type CHECK (celebration_type IN ('sabbat', 'esbat', 'other')),
    CONSTRAINT valid_date_type CHECK (date_type IN ('fixed', 'solar', 'lunar'))
);

-- Media: Use entity_media table with entity_type='sabbat'

CREATE INDEX idx_calendar_slug ON calendar(slug);
CREATE INDEX idx_calendar_type ON calendar(celebration_type);

-- Grimoire calendar junction
CREATE TABLE grimoire_calendar (
    grimoire_id UUID NOT NULL REFERENCES grimoires(id) ON DELETE CASCADE,
    calendar_id UUID NOT NULL REFERENCES calendar(id) ON DELETE CASCADE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (grimoire_id, calendar_id)
);

-- NOTE: calendar_traditions junction table is defined after traditions table (below)

-- Elements (Classical and Spirit)
CREATE TABLE elements (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(50) NOT NULL UNIQUE,
    slug VARCHAR(50) UNIQUE NOT NULL,
    
    -- Characteristics
    direction VARCHAR(20), -- North, South, East, West, Center
    season VARCHAR(20), -- Spring, Summer, Autumn, Winter, All
    time_of_day VARCHAR(20), -- Dawn, Noon, Dusk, Midnight, All
    
    -- Qualities
    qualities TEXT[], -- hot, cold, dry, moist, etc.
    energy_type VARCHAR(20), -- 'active', 'passive', 'balanced'
    polarity VARCHAR(20), -- 'masculine', 'feminine', 'neutral'
    
    -- Visual associations
    colors TEXT[],
    
    -- Symbolism
    symbols TEXT[], -- triangles, circles, etc.
    description TEXT,
    
    -- Magical usage
    ritual_uses TEXT,
    invocation_methods TEXT,
    
    -- NOTE: zodiac_signs → link via entity relationships or directly to zodiac_signs table
    -- NOTE: planets → link via planet table when created
    -- NOTE: tarot → link via entity_elements junction to tarot_cards
    -- NOTE: magical_properties → link via entity_intentions junction table
    -- NOTE: tools → link via entity_ritual_tools junction table
    
    -- Metadata
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT valid_energy_type CHECK (energy_type IN ('active', 'passive', 'balanced')),
    CONSTRAINT valid_polarity CHECK (polarity IN ('masculine', 'feminine', 'neutral'))
);

-- Media: Use entity_media table with entity_type='element'

CREATE INDEX idx_elements_slug ON elements(slug);

-- =============================================================================
-- MAGICAL INTENTIONS
-- =============================================================================
-- Centralized table for all magical intentions/purposes that can be linked
-- to any entity type (crystals, herbs, candles, oils, deities, etc.)

CREATE TABLE intentions (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(100) NOT NULL UNIQUE,
    slug VARCHAR(100) UNIQUE NOT NULL,
    description TEXT,
    category VARCHAR(50), -- e.g., 'healing', 'protection', 'manifestation', 'spiritual', 'emotional'
    keywords TEXT[], -- Related search terms
    usage_guide TEXT, -- How to work with this intention
    -- NOTE: Related elements are linked via entity_elements junction table (entity_type='intention')
    -- NOTE: Moon phases are linked via entity_moon_phases junction table (entity_type='intention')
    -- NOTE: Colors removed - use UI theming or tag system instead
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_intentions_slug ON intentions(slug);
CREATE INDEX idx_intentions_category ON intentions(category);
CREATE INDEX idx_intentions_keywords ON intentions USING GIN (keywords);

-- =============================================================================
-- MAGICAL TRADITIONS & PRACTICE TYPES
-- =============================================================================
-- Reference table for different types of magical practice and traditions

CREATE TABLE traditions (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(100) NOT NULL UNIQUE,
    slug VARCHAR(100) UNIQUE NOT NULL,
    tradition_type VARCHAR(50) NOT NULL, -- 'practice_style', 'cultural', 'religious', 'modern', 'ancient'
    description TEXT,
    origin TEXT, -- Geographic or cultural origin
    time_period VARCHAR(100), -- When it originated/was practiced
    key_beliefs TEXT[], -- Core beliefs or principles
    common_practices TEXT[], -- Typical practices or rituals
    deities_honored TEXT[], -- Associated deities or pantheons
    related_traditions TEXT[], -- Names of related or similar traditions
    resources TEXT[], -- Books, websites, or other resources
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT valid_tradition_type CHECK (tradition_type IN (
        'practice_style', 'cultural', 'religious', 'modern', 'ancient', 'reconstructionist', 'eclectic'
    ))
);

CREATE INDEX idx_traditions_slug ON traditions(slug);
CREATE INDEX idx_traditions_type ON traditions(tradition_type);

-- =============================================================================
-- SPELL METHODS (The "How")
-- =============================================================================
-- Different techniques/delivery systems for spellwork

CREATE TABLE spell_methods (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(100) NOT NULL UNIQUE,
    slug VARCHAR(100) UNIQUE NOT NULL,
    description TEXT,
    difficulty_level VARCHAR(20), -- 'beginner', 'intermediate', 'advanced'
    typical_duration VARCHAR(100), -- 'Instant', 'Minutes', 'Days', 'Ongoing', etc.
    materials_needed TEXT[], -- Common materials for this method
    instructions_summary TEXT, -- Basic overview of the technique
    tips TEXT, -- Helpful tips for this method
    warnings TEXT, -- Safety or ethical warnings
    related_methods TEXT[], -- Names of similar or related methods
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT valid_difficulty CHECK (difficulty_level IN ('beginner', 'intermediate', 'advanced'))
);

CREATE INDEX idx_spell_methods_slug ON spell_methods(slug);
CREATE INDEX idx_spell_methods_difficulty ON spell_methods(difficulty_level);

-- =============================================================================
-- SPELL ETHICS (The "Vibe")
-- =============================================================================
-- Ethical categorization and intensity of spellwork

-- ============================================================================
-- SPELL ETHICS TABLE
-- ============================================================================
-- Simplified to contain only factual information without imposing specific
-- ethical frameworks or religious perspectives. Users from different traditions
-- can assess the nature of magical work based on factual descriptions.
--
-- REMOVED PRESCRIPTIVE/JUDGMENTAL COLUMNS:
-- - category: Subjective categorization (magick_color, harmful, neutral)
-- - ethical_considerations: Prescriptive ethical guidance
-- - is_controversial: Subjective judgment about debate worthiness
-- - wiccan_rede_compatible: Tradition-specific ethical framework
-- - threefold_law_warning: Tradition-specific karmic warning
-- - when_appropriate: Prescriptive guidance about usage
-- - alternatives: Prescriptive suggestions
-- - color: Non-essential visual metadata
--
-- RETAINED FACTUAL COLUMNS:
-- - name, slug: Identifiers
-- - description: Factual description of the spell type
-- - intensity_level: Objective measure of magical intensity
-- - examples: Factual examples of this type of work
-- ============================================================================

CREATE TABLE spell_ethics (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(100) NOT NULL UNIQUE,
    slug VARCHAR(100) UNIQUE NOT NULL,
    description TEXT,
    intensity_level VARCHAR(20), -- 'minor', 'moderate', 'serious', 'severe'
    examples TEXT, -- Factual examples of this type of magical work
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT valid_intensity CHECK (intensity_level IN ('minor', 'moderate', 'serious', 'severe'))
);

CREATE INDEX idx_spell_ethics_slug ON spell_ethics(slug);
CREATE INDEX idx_spell_ethics_intensity ON spell_ethics(intensity_level);

-- Grimoire traditions: Use entity_traditions table with entity_type='grimoire'
-- Example: INSERT INTO entity_traditions (entity_type, entity_id, tradition_id, is_primary)
--          VALUES ('grimoire', grimoire_id_here, tradition_id_here, TRUE);

-- Calendar to Traditions junction (many-to-many since a holiday can be celebrated by multiple traditions)
-- Calendar traditions: Use entity_traditions table with entity_type='calendar'
-- Example: INSERT INTO entity_traditions (entity_type, entity_id, tradition_id, is_primary)
--          VALUES ('calendar', calendar_id_here, tradition_id_here, TRUE);

-- Zodiac Signs
CREATE TABLE zodiac_signs (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(50) NOT NULL,
    slug VARCHAR(50) UNIQUE NOT NULL,
    symbol VARCHAR(10) NOT NULL,
    element VARCHAR(20) NOT NULL,
    modality VARCHAR(20) NOT NULL,
    ruling_planet VARCHAR(50),
    date_range_start VARCHAR(10),
    date_range_end VARCHAR(10),
    traits TEXT[],
    description TEXT,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT valid_element CHECK (element IN ('fire', 'earth', 'air', 'water')),
    CONSTRAINT valid_modality CHECK (modality IN ('cardinal', 'fixed', 'mutable'))
);

CREATE INDEX idx_zodiac_slug ON zodiac_signs(slug);

-- Grimoire zodiac: Use entity_zodiac_signs table with entity_type='grimoire'
-- Example: INSERT INTO entity_zodiac_signs (entity_type, entity_id, zodiac_id, strength)
--          VALUES ('grimoire', grimoire_id_here, zodiac_id_here, 'strong');

-- Moon Phases
CREATE TABLE moon_phases (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(50) NOT NULL,
    slug VARCHAR(50) UNIQUE NOT NULL,
    description TEXT,
    -- NOTE: Magical properties are linked via entity_intentions junction table
    best_for TEXT[],
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Grimoire moon phases: Use entity_moon_phases table with entity_type='grimoire'
-- Example: INSERT INTO entity_moon_phases (entity_type, entity_id, moon_phase_id, strength)
--          VALUES ('grimoire', grimoire_id_here, moon_phase_id_here, 'primary');

-- =============================================================================
-- ANALYTICS & TRACKING
-- =============================================================================

-- View tracking
CREATE TABLE grimoire_views (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    grimoire_id UUID NOT NULL REFERENCES grimoires(id) ON DELETE CASCADE,
    user_id UUID REFERENCES users(id) ON DELETE SET NULL,
    ip_address INET,
    user_agent TEXT,
    referrer TEXT,
    viewed_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_grimoire_views_grimoire ON grimoire_views(grimoire_id);
CREATE INDEX idx_grimoire_views_user ON grimoire_views(user_id);
CREATE INDEX idx_grimoire_views_date ON grimoire_views(viewed_at);

-- User activity log
CREATE TABLE user_activity_log (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID REFERENCES users(id) ON DELETE SET NULL,
    activity_type VARCHAR(50) NOT NULL,
    entity_type VARCHAR(50),
    entity_id UUID,
    ip_address INET,
    user_agent TEXT,
    metadata JSONB,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_activity_log_user ON user_activity_log(user_id);
CREATE INDEX idx_activity_log_type ON user_activity_log(activity_type);
CREATE INDEX idx_activity_log_date ON user_activity_log(created_at);

-- =============================================================================
-- MATERIALIZED VIEWS FOR PERFORMANCE
-- =============================================================================

-- Grimoire statistics
CREATE MATERIALIZED VIEW grimoire_stats AS
SELECT 
    g.id,
    g.title,
    COUNT(DISTINCT gv.id) as view_count,
    COUNT(DISTINCT CASE WHEN gi.interaction_type = 'like' THEN gi.id END) as like_count,
    COUNT(DISTINCT CASE WHEN gi.interaction_type = 'dislike' THEN gi.id END) as dislike_count,
    COUNT(DISTINCT CASE WHEN gi.interaction_type = 'favorite' THEN gi.id END) as favorite_count,
    COUNT(DISTINCT c.id) as comment_count,
    MAX(gv.viewed_at) as last_viewed_at
FROM grimoires g
LEFT JOIN grimoire_views gv ON g.id = gv.grimoire_id
LEFT JOIN grimoire_interactions gi ON g.id = gi.grimoire_id
LEFT JOIN comments c ON g.id = c.grimoire_id AND c.deleted_at IS NULL
WHERE g.deleted_at IS NULL
GROUP BY g.id, g.title;

CREATE UNIQUE INDEX idx_grimoire_stats_id ON grimoire_stats(id);

-- User statistics
CREATE MATERIALIZED VIEW user_stats AS
SELECT 
    u.id,
    u.username,
    COUNT(DISTINCT g.id) as grimoire_count,
    COUNT(DISTINCT CASE WHEN gi.interaction_type = 'favorite' THEN gi.id END) as favorite_count,
    COUNT(DISTINCT c.id) as comment_count,
    COUNT(DISTINCT ub.id) as board_count
FROM users u
LEFT JOIN grimoires g ON u.id = g.author_id AND g.deleted_at IS NULL
LEFT JOIN grimoire_interactions gi ON u.id = gi.user_id
LEFT JOIN comments c ON u.id = c.user_id AND c.deleted_at IS NULL
LEFT JOIN user_boards ub ON u.id = ub.user_id AND ub.deleted_at IS NULL
WHERE u.deleted_at IS NULL
GROUP BY u.id, u.username;

CREATE UNIQUE INDEX idx_user_stats_id ON user_stats(id);

-- =============================================================================
-- FUNCTIONS & TRIGGERS
-- =============================================================================

-- Function to update updated_at timestamp
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Apply updated_at trigger to relevant tables
CREATE TRIGGER update_users_updated_at BEFORE UPDATE ON users
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_grimoires_updated_at BEFORE UPDATE ON grimoires
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_categories_updated_at BEFORE UPDATE ON categories
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_tags_updated_at BEFORE UPDATE ON tags
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_comments_updated_at BEFORE UPDATE ON comments
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_user_boards_updated_at BEFORE UPDATE ON user_boards
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_content_types_updated_at BEFORE UPDATE ON content_types
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_user_settings_updated_at BEFORE UPDATE ON user_settings
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_pantheons_updated_at BEFORE UPDATE ON pantheons
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_deities_updated_at BEFORE UPDATE ON deities
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_calendar_updated_at BEFORE UPDATE ON calendar
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_elements_updated_at BEFORE UPDATE ON elements
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_intentions_updated_at BEFORE UPDATE ON intentions
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_traditions_updated_at BEFORE UPDATE ON traditions
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_entity_media_updated_at BEFORE UPDATE ON entity_media
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- Note: Tag usage count functions and triggers are defined earlier in this file
-- right after the tags table creation, before entity_tags table.

-- =============================================================================
-- SAMPLE DATA FOR MOON PHASES
-- =============================================================================
-- NOTE: Magical properties are linked via entity_intentions junction table

INSERT INTO moon_phases (name, slug, description, best_for) VALUES
    ('New Moon', 'new-moon', 'The beginning of the lunar cycle', 
     ARRAY['starting new projects', 'goal setting', 'fresh starts']),
    ('Waxing Crescent', 'waxing-crescent', 'Growth and expansion phase',
     ARRAY['building momentum', 'attracting opportunities', 'constructive magic']),
    ('First Quarter', 'first-quarter', 'Time of action and decision',
     ARRAY['making decisions', 'taking action', 'overcoming obstacles']),
    ('Waxing Gibbous', 'waxing-gibbous', 'Refinement and preparation',
     ARRAY['perfecting plans', 'fine-tuning', 'preparation']),
    ('Full Moon', 'full-moon', 'Peak of lunar power',
     ARRAY['powerful spells', 'divination', 'charging tools', 'releasing']),
    ('Waning Gibbous', 'waning-gibbous', 'Sharing and gratitude',
     ARRAY['giving thanks', 'sharing knowledge', 'reflection']),
    ('Last Quarter', 'last-quarter', 'Release and forgiveness',
     ARRAY['banishing', 'letting go', 'breaking bad habits']),
    ('Waning Crescent', 'waning-crescent', 'Rest and restoration',
     ARRAY['introspection', 'rest', 'contemplation', 'divination']);

-- =============================================================================
-- SAMPLE ZODIAC DATA
-- =============================================================================

INSERT INTO zodiac_signs (name, slug, symbol, element, modality, ruling_planet, date_range_start, date_range_end, traits) VALUES
    ('Aries', 'aries', '♈', 'fire', 'cardinal', 'Mars', 'Mar 21', 'Apr 19', 
     ARRAY['courageous', 'determined', 'confident', 'enthusiastic', 'passionate']),
    ('Taurus', 'taurus', '♉', 'earth', 'fixed', 'Venus', 'Apr 20', 'May 20',
     ARRAY['reliable', 'patient', 'practical', 'devoted', 'stable']),
    ('Gemini', 'gemini', '♊', 'air', 'mutable', 'Mercury', 'May 21', 'Jun 20',
     ARRAY['curious', 'adaptable', 'communicative', 'witty', 'versatile']),
    ('Cancer', 'cancer', '♋', 'water', 'cardinal', 'Moon', 'Jun 21', 'Jul 22',
     ARRAY['intuitive', 'emotional', 'protective', 'nurturing', 'loyal']),
    ('Leo', 'leo', '♌', 'fire', 'fixed', 'Sun', 'Jul 23', 'Aug 22',
     ARRAY['creative', 'passionate', 'generous', 'warm-hearted', 'cheerful']),
    ('Virgo', 'virgo', '♍', 'earth', 'mutable', 'Mercury', 'Aug 23', 'Sep 22',
     ARRAY['analytical', 'practical', 'loyal', 'hardworking', 'kind']),
    ('Libra', 'libra', '♎', 'air', 'cardinal', 'Venus', 'Sep 23', 'Oct 22',
     ARRAY['diplomatic', 'fair-minded', 'social', 'gracious', 'cooperative']),
    ('Scorpio', 'scorpio', '♏', 'water', 'fixed', 'Pluto', 'Oct 23', 'Nov 21',
     ARRAY['passionate', 'resourceful', 'brave', 'determined', 'intense']),
    ('Sagittarius', 'sagittarius', '♐', 'fire', 'mutable', 'Jupiter', 'Nov 22', 'Dec 21',
     ARRAY['generous', 'idealistic', 'adventurous', 'philosophical', 'honest']),
    ('Capricorn', 'capricorn', '♑', 'earth', 'cardinal', 'Saturn', 'Dec 22', 'Jan 19',
     ARRAY['responsible', 'disciplined', 'ambitious', 'practical', 'patient']),
    ('Aquarius', 'aquarius', '♒', 'air', 'fixed', 'Uranus', 'Jan 20', 'Feb 18',
     ARRAY['progressive', 'original', 'independent', 'humanitarian', 'intellectual']),
    ('Pisces', 'pisces', '♓', 'water', 'mutable', 'Neptune', 'Feb 19', 'Mar 20',
     ARRAY['compassionate', 'artistic', 'intuitive', 'gentle', 'wise']);

-- =============================================================================
-- CHAKRAS
-- =============================================================================

CREATE TABLE chakras (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(50) NOT NULL,
    slug VARCHAR(50) UNIQUE NOT NULL,
    sanskrit_name VARCHAR(100),
    location VARCHAR(100),
    color VARCHAR(30), -- Traditional chakra color association (part of chakra system knowledge)
    -- NOTE: Removed element column - chakra elements (Earth, Water, Fire, Air, Sound, Light, Thought) 
    -- are not standard elements and should be handled differently if needed
    note VARCHAR(10), -- Musical note for sound healing
    number INTEGER, -- Position 1-7 (root to crown)
    description TEXT,
    associated_with TEXT[], -- Body systems, emotions, etc.
    -- NOTE: Removed keywords column - use entity_intentions junction table instead
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_chakras_slug ON chakras(slug);
CREATE INDEX idx_chakras_number ON chakras(number);

-- Seed chakra data
-- NOTE: Keywords/properties moved to entity_intentions junction table
-- NOTE: Element associations removed (Sound, Light, Thought aren't standard elements)
INSERT INTO chakras (name, slug, sanskrit_name, location, color, note, number, description, associated_with) VALUES
    ('Root', 'root', 'Muladhara', 'Base of spine', 'Red', 'C', 1,
     'The foundation chakra, connecting us to the physical world and our survival instincts.',
     ARRAY['legs', 'feet', 'bones', 'large intestine', 'adrenal glands']),
    ('Sacral', 'sacral', 'Svadhisthana', 'Lower abdomen', 'Orange', 'D', 2,
     'The center of creativity, sexuality, and emotional expression.',
     ARRAY['reproductive organs', 'kidneys', 'bladder', 'circulatory system']),
    ('Solar Plexus', 'solar-plexus', 'Manipura', 'Upper abdomen', 'Yellow', 'E', 3,
     'The power chakra, governing personal power, will, and self-esteem.',
     ARRAY['digestive system', 'liver', 'pancreas', 'stomach', 'metabolism']),
    ('Heart', 'heart', 'Anahata', 'Center of chest', 'Green', 'F', 4,
     'The bridge between physical and spiritual, governing love and compassion.',
     ARRAY['heart', 'lungs', 'circulatory system', 'arms', 'hands']),
    ('Throat', 'throat', 'Vishuddha', 'Throat', 'Blue', 'G', 5,
     'The communication chakra, governing expression and truth.',
     ARRAY['throat', 'thyroid', 'neck', 'mouth', 'teeth', 'ears']),
    ('Third Eye', 'third-eye', 'Ajna', 'Forehead between eyes', 'Indigo', 'A', 6,
     'The intuition chakra, connecting to inner wisdom and psychic abilities.',
     ARRAY['pituitary gland', 'eyes', 'brain', 'nervous system']),
    ('Crown', 'crown', 'Sahasrara', 'Top of head', 'Violet', 'B', 7,
     'The spiritual connection chakra, linking to divine consciousness.',
     ARRAY['pineal gland', 'brain', 'nervous system']);

-- =============================================================================
-- PLANETS
-- =============================================================================

CREATE TABLE planets (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(50) NOT NULL,
    slug VARCHAR(50) UNIQUE NOT NULL,
    -- NOTE: symbol removed - not essential for magical work
    description TEXT,
    -- NOTE: magical_properties → Link via entity_intentions junction table
    day_of_week VARCHAR(20),
    -- NOTE: associated_with removed - use entity relationships (deities, etc.) instead
    -- NOTE: colors removed - not essential for magical work
    -- NOTE: metals removed - not essential for magical work
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_planets_slug ON planets(slug);

-- Seed planet data
-- NOTE: Magical properties linked via entity_intentions junction table
-- NOTE: Associated deities linked via entity_deities junction table
-- NOTE: Colors and metals removed - not essential for magical database
INSERT INTO planets (name, slug, description, day_of_week) VALUES
    ('Sun', 'sun', 'The source of light and life, representing vitality and power.', 'Sunday'),
    ('Moon', 'moon', 'The emotional and intuitive luminary, governing cycles and emotions.', 'Monday'),
    ('Mercury', 'mercury', 'The messenger planet, governing communication and intellect.', 'Wednesday'),
    ('Venus', 'venus', 'The planet of love, beauty, and harmony.', 'Friday'),
    ('Mars', 'mars', 'The warrior planet, representing action and courage.', 'Tuesday'),
    ('Jupiter', 'jupiter', 'The planet of expansion, abundance, and wisdom.', 'Thursday'),
    ('Saturn', 'saturn', 'The teacher planet, representing discipline and structure.', 'Saturday'),
    ('Uranus', 'uranus', 'The planet of change, innovation, and rebellion.', NULL),
    ('Neptune', 'neptune', 'The planet of dreams, intuition, and mysticism.', NULL),
    ('Pluto', 'pluto', 'The planet of transformation, death, and rebirth.', NULL);

-- =============================================================================
-- ENTITY RELATIONSHIP TABLES FOR CHAKRAS, ZODIACS, AND PLANETS
-- =============================================================================

-- Entity to Chakra relationships (polymorphic)
CREATE TABLE entity_chakras (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    entity_type VARCHAR(50) NOT NULL, -- 'crystal', 'herb', 'candle', 'oil', etc.
    entity_id UUID NOT NULL,
    chakra_id UUID NOT NULL REFERENCES chakras(id) ON DELETE CASCADE,
    strength VARCHAR(20) DEFAULT 'moderate', -- 'primary', 'strong', 'moderate', 'supportive'
    notes TEXT,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT valid_entity_type_chakra CHECK (entity_type IN ('crystal', 'herb', 'candle', 'oil', 'incense', 'salt', 'deity', 'ritual_tool')),
    CONSTRAINT valid_strength_chakra CHECK (strength IN ('primary', 'strong', 'moderate', 'supportive')),
    UNIQUE(entity_type, entity_id, chakra_id)
);

CREATE INDEX idx_entity_chakras_entity ON entity_chakras(entity_type, entity_id);
CREATE INDEX idx_entity_chakras_chakra ON entity_chakras(chakra_id);
CREATE INDEX idx_entity_chakras_strength ON entity_chakras(strength);

-- Entity to Zodiac relationships (polymorphic)
CREATE TABLE entity_zodiac_signs (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    entity_type VARCHAR(50) NOT NULL, -- 'crystal', 'herb', 'candle', 'oil', etc.
    entity_id UUID NOT NULL,
    zodiac_id UUID NOT NULL REFERENCES zodiac_signs(id) ON DELETE CASCADE,
    strength VARCHAR(20) DEFAULT 'moderate',
    notes TEXT,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT valid_entity_type_zodiac CHECK (entity_type IN ('crystal', 'herb', 'candle', 'oil', 'incense', 'salt', 'deity', 'ritual_tool', 'calendar', 'moon_phase', 'grimoire')),
    CONSTRAINT valid_strength_zodiac CHECK (strength IN ('primary', 'strong', 'moderate', 'supportive')),
    UNIQUE(entity_type, entity_id, zodiac_id)
);

CREATE INDEX idx_entity_zodiac_entity ON entity_zodiac_signs(entity_type, entity_id);
CREATE INDEX idx_entity_zodiac_zodiac ON entity_zodiac_signs(zodiac_id);
CREATE INDEX idx_entity_zodiac_strength ON entity_zodiac_signs(strength);

-- Entity to Planet relationships (polymorphic)
CREATE TABLE entity_planets (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    entity_type VARCHAR(50) NOT NULL, -- 'crystal', 'herb', 'candle', 'oil', etc.
    entity_id UUID NOT NULL,
    planet_id UUID NOT NULL REFERENCES planets(id) ON DELETE CASCADE,
    strength VARCHAR(20) DEFAULT 'moderate',
    notes TEXT,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT valid_entity_type_planet CHECK (entity_type IN ('crystal', 'herb', 'candle', 'oil', 'incense', 'salt', 'deity', 'ritual_tool', 'calendar', 'moon_phase')),
    CONSTRAINT valid_strength_planet CHECK (strength IN ('primary', 'strong', 'moderate', 'supportive')),
    UNIQUE(entity_type, entity_id, planet_id)
);

CREATE INDEX idx_entity_planets_entity ON entity_planets(entity_type, entity_id);
CREATE INDEX idx_entity_planets_planet ON entity_planets(planet_id);
CREATE INDEX idx_entity_planets_strength ON entity_planets(strength);

-- =============================================================================
-- END OF SCHEMA
-- =============================================================================
