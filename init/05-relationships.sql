-- =============================================================================
-- GRIMOIRE COLLECTIVE - RELATIONSHIP TABLES
-- =============================================================================
-- Purpose: Junction tables to link grimoires (spells, rituals) with entities
--          (crystals, herbs, candles, etc.) making everything interconnected
-- Created: 2025-12-28
-- =============================================================================

-- =============================================================================
-- SPELL/RITUAL INGREDIENTS RELATIONSHIPS
-- =============================================================================

-- Link spells/rituals to crystals they use
CREATE TABLE grimoire_crystals (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    grimoire_id UUID NOT NULL REFERENCES grimoires(id) ON DELETE CASCADE,
    crystal_id UUID NOT NULL REFERENCES crystals(id) ON DELETE CASCADE,
    
    -- Usage context
    quantity VARCHAR(50), -- "1 piece", "a handful", "7 stones", etc.
    purpose TEXT, -- Why this crystal is used in this spell
    optional BOOLEAN DEFAULT FALSE,
    display_order INTEGER DEFAULT 0,
    
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    
    UNIQUE(grimoire_id, crystal_id)
);

CREATE INDEX idx_grimoire_crystals_grimoire ON grimoire_crystals(grimoire_id);
CREATE INDEX idx_grimoire_crystals_crystal ON grimoire_crystals(crystal_id);

-- Link spells/rituals to herbs they use
CREATE TABLE grimoire_herbs (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    grimoire_id UUID NOT NULL REFERENCES grimoires(id) ON DELETE CASCADE,
    herb_id UUID NOT NULL REFERENCES herbs(id) ON DELETE CASCADE,
    
    -- Usage context
    quantity VARCHAR(50), -- "1 teaspoon", "3 leaves", "a pinch", etc.
    preparation VARCHAR(50), -- "dried", "fresh", "powdered", "as tea", etc.
    purpose TEXT, -- Why this herb is used in this spell
    optional BOOLEAN DEFAULT FALSE,
    display_order INTEGER DEFAULT 0,
    
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    
    UNIQUE(grimoire_id, herb_id)
);

CREATE INDEX idx_grimoire_herbs_grimoire ON grimoire_herbs(grimoire_id);
CREATE INDEX idx_grimoire_herbs_herb ON grimoire_herbs(herb_id);

-- Link spells/rituals to candles they use
CREATE TABLE grimoire_candles (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    grimoire_id UUID NOT NULL REFERENCES grimoires(id) ON DELETE CASCADE,
    candle_id UUID NOT NULL REFERENCES candles(id) ON DELETE CASCADE,
    
    -- Usage context
    quantity VARCHAR(50), -- "1", "2", "3 in a triangle formation", etc.
    purpose TEXT, -- Why this candle is used in this spell
    optional BOOLEAN DEFAULT FALSE,
    display_order INTEGER DEFAULT 0,
    
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    
    UNIQUE(grimoire_id, candle_id)
);

CREATE INDEX idx_grimoire_candles_grimoire ON grimoire_candles(grimoire_id);
CREATE INDEX idx_grimoire_candles_candle ON grimoire_candles(candle_id);

-- Link spells/rituals to incense they use
CREATE TABLE grimoire_incense (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    grimoire_id UUID NOT NULL REFERENCES grimoires(id) ON DELETE CASCADE,
    incense_id UUID NOT NULL REFERENCES incense(id) ON DELETE CASCADE,
    
    -- Usage context
    quantity VARCHAR(50), -- "1 stick", "a few grains of resin", etc.
    purpose TEXT, -- Why this incense is used in this spell
    optional BOOLEAN DEFAULT FALSE,
    display_order INTEGER DEFAULT 0,
    
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    
    UNIQUE(grimoire_id, incense_id)
);

CREATE INDEX idx_grimoire_incense_grimoire ON grimoire_incense(grimoire_id);
CREATE INDEX idx_grimoire_incense_incense ON grimoire_incense(incense_id);

-- Link spells/rituals to oils they use
CREATE TABLE grimoire_oils (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    grimoire_id UUID NOT NULL REFERENCES grimoires(id) ON DELETE CASCADE,
    oil_id UUID NOT NULL REFERENCES oils(id) ON DELETE CASCADE,
    
    -- Usage context
    quantity VARCHAR(50), -- "3 drops", "enough to anoint", etc.
    application_method VARCHAR(100), -- "anoint candle", "add to bath", "diffuse", etc.
    purpose TEXT, -- Why this oil is used in this spell
    optional BOOLEAN DEFAULT FALSE,
    display_order INTEGER DEFAULT 0,
    
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    
    UNIQUE(grimoire_id, oil_id)
);

CREATE INDEX idx_grimoire_oils_grimoire ON grimoire_oils(grimoire_id);
CREATE INDEX idx_grimoire_oils_oil ON grimoire_oils(oil_id);

-- Link spells/rituals to salts they use
CREATE TABLE grimoire_salts (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    grimoire_id UUID NOT NULL REFERENCES grimoires(id) ON DELETE CASCADE,
    salt_id UUID NOT NULL REFERENCES salts(id) ON DELETE CASCADE,
    
    -- Usage context
    quantity VARCHAR(50), -- "1 cup", "a pinch", "enough to cast circle", etc.
    application_method VARCHAR(100), -- "add to bath", "cast circle", "sprinkle", etc.
    purpose TEXT, -- Why this salt is used in this spell
    optional BOOLEAN DEFAULT FALSE,
    display_order INTEGER DEFAULT 0,
    
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    
    UNIQUE(grimoire_id, salt_id)
);

CREATE INDEX idx_grimoire_salts_grimoire ON grimoire_salts(grimoire_id);
CREATE INDEX idx_grimoire_salts_salt ON grimoire_salts(salt_id);

-- Link spells/rituals to divination methods they use
CREATE TABLE grimoire_divination_methods (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    grimoire_id UUID NOT NULL REFERENCES grimoires(id) ON DELETE CASCADE,
    divination_method_id UUID NOT NULL REFERENCES divination_methods(id) ON DELETE CASCADE,
    
    -- Usage context
    purpose TEXT, -- Why this divination method is used in this spell/ritual
    when_to_use VARCHAR(100), -- "before spell", "after ritual", "during meditation", etc.
    optional BOOLEAN DEFAULT FALSE,
    display_order INTEGER DEFAULT 0,
    
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    
    UNIQUE(grimoire_id, divination_method_id)
);

CREATE INDEX idx_grimoire_divination_methods_grimoire ON grimoire_divination_methods(grimoire_id);
CREATE INDEX idx_grimoire_divination_methods_method ON grimoire_divination_methods(divination_method_id);

-- Link spells/rituals to ritual tools they use
CREATE TABLE grimoire_ritual_tools (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    grimoire_id UUID NOT NULL REFERENCES grimoires(id) ON DELETE CASCADE,
    ritual_tool_id UUID NOT NULL REFERENCES ritual_tools(id) ON DELETE CASCADE,
    
    -- Usage context
    purpose TEXT, -- Why this tool is used in this spell/ritual
    how_to_use TEXT, -- Specific instructions for using this tool in this context
    optional BOOLEAN DEFAULT FALSE,
    display_order INTEGER DEFAULT 0,
    
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    
    UNIQUE(grimoire_id, ritual_tool_id)
);

CREATE INDEX idx_grimoire_ritual_tools_grimoire ON grimoire_ritual_tools(grimoire_id);
CREATE INDEX idx_grimoire_ritual_tools_tool ON grimoire_ritual_tools(ritual_tool_id);

-- =============================================================================
-- DEITY RELATIONSHIPS
-- =============================================================================

-- Note: grimoire_deities, grimoire_calendar, grimoire_moon_phases, and 
-- grimoire_zodiac tables already exist in 02-schema.sql
-- We're only adding the new cross-entity deity relationships here

-- =============================================================================
-- TIMING RELATIONSHIPS
-- =============================================================================

-- Note: Timing relationship tables (grimoire_calendar, grimoire_moon_phases,
-- grimoire_zodiac) already exist in 02-schema.sql

-- =============================================================================
-- CROSS-ENTITY RELATIONSHIPS (UNIFIED)
-- =============================================================================

-- Universal pairings table - any entity can be paired with any other entity
-- Examples: 
--   Entity-to-Entity: "Rose Quartz works well with Lavender", "Hecate is associated with Mugwort"
--   Element-to-Entity: "Fire element associated with Cinnamon", "Air element with Clear Quartz"
--   Element-to-Element: "Fire and Air support each other", "Water and Earth are complementary"
CREATE TABLE entity_pairings (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    
    -- First entity (polymorphic)
    entity_type_a VARCHAR(50) NOT NULL, -- crystal, herb, candle, oil, incense, salt, deity, element, etc.
    entity_id_a UUID NOT NULL,
    
    -- Second entity (polymorphic)
    entity_type_b VARCHAR(50) NOT NULL, -- crystal, herb, candle, oil, incense, salt, deity, element, etc.
    entity_id_b UUID NOT NULL,
    
    -- Pairing details
    pairing_type VARCHAR(50), -- 'complementary', 'deity_association', 'elemental_correspondence', 'opposing', 'synergy', etc.
    purpose TEXT, -- Why they work well together / significance
    strength VARCHAR(20), -- 'strong', 'moderate', 'weak'
    
    -- Metadata
    created_by UUID REFERENCES users(id) ON DELETE SET NULL,
    verified BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    
    UNIQUE(entity_type_a, entity_id_a, entity_type_b, entity_id_b),
    CONSTRAINT valid_entity_type_a CHECK (entity_type_a IN ('crystal', 'herb', 'candle', 'oil', 'incense', 'salt', 'deity', 'divination_method', 'ritual_tool', 'element')),
    CONSTRAINT valid_entity_type_b CHECK (entity_type_b IN ('crystal', 'herb', 'candle', 'oil', 'incense', 'salt', 'deity', 'divination_method', 'ritual_tool', 'element')),
    CONSTRAINT valid_strength CHECK (strength IN ('strong', 'moderate', 'weak'))
);

CREATE INDEX idx_entity_pairings_entity_a ON entity_pairings(entity_type_a, entity_id_a);
CREATE INDEX idx_entity_pairings_entity_b ON entity_pairings(entity_type_b, entity_id_b);
CREATE INDEX idx_entity_pairings_type ON entity_pairings(pairing_type);

-- Universal substitutes table - "Use this instead of that"
-- Examples: "Use Clear Quartz instead of Rose Quartz", "Substitute Sage for Rosemary"
CREATE TABLE entity_substitutes (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    
    -- Original entity (polymorphic)
    entity_type VARCHAR(50) NOT NULL, -- crystal, herb, candle, oil, incense, salt, etc.
    entity_id UUID NOT NULL,
    
    -- Substitute entity (must be same type)
    substitute_entity_id UUID NOT NULL,
    
    -- Substitution details
    reason TEXT, -- Why this is a good substitute
    effectiveness VARCHAR(20), -- 'excellent', 'good', 'fair'
    notes TEXT, -- Any additional information
    
    -- Metadata
    created_by UUID REFERENCES users(id) ON DELETE SET NULL,
    verified BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    
    UNIQUE(entity_type, entity_id, substitute_entity_id),
    CONSTRAINT different_entities CHECK (entity_id != substitute_entity_id),
    CONSTRAINT valid_entity_type CHECK (entity_type IN ('crystal', 'herb', 'candle', 'oil', 'incense', 'salt')),
    CONSTRAINT valid_effectiveness CHECK (effectiveness IN ('excellent', 'good', 'fair'))
);

CREATE INDEX idx_entity_substitutes_entity ON entity_substitutes(entity_type, entity_id);
CREATE INDEX idx_entity_substitutes_substitute ON entity_substitutes(entity_type, substitute_entity_id);
CREATE INDEX idx_entity_substitutes_effectiveness ON entity_substitutes(effectiveness);

-- =============================================================================
-- ENTITY INTENTIONS (UNIFIED)
-- =============================================================================

-- Universal entity-to-intention mapping - links any entity to magical intentions
-- Examples: "Amethyst is for protection", "Rose Quartz for love", "Sage for purification"
-- This replaces the magical_properties TEXT[] arrays in individual entity tables
CREATE TABLE entity_intentions (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    
    -- Entity (polymorphic)
    entity_type VARCHAR(50) NOT NULL,
    entity_id UUID NOT NULL,
    
    -- Intention
    intention_id UUID NOT NULL REFERENCES intentions(id) ON DELETE CASCADE,
    
    -- Relationship details
    strength VARCHAR(20) DEFAULT 'moderate', -- How strongly associated: 'primary', 'strong', 'moderate', 'supportive'
    notes TEXT, -- Additional context about this specific usage
    
    -- Metadata
    created_by UUID REFERENCES users(id) ON DELETE SET NULL,
    verified BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    
    UNIQUE(entity_type, entity_id, intention_id),
    CONSTRAINT valid_entity_type CHECK (entity_type IN (
        'crystal', 'herb', 'candle', 'oil', 'incense', 'salt', 
        'deity', 'divination_method', 'ritual_tool', 'element',
        'moon_phase', 'zodiac_sign', 'calendar'
    )),
    CONSTRAINT valid_strength CHECK (strength IN ('primary', 'strong', 'moderate', 'supportive'))
);

CREATE INDEX idx_entity_intentions_entity ON entity_intentions(entity_type, entity_id);
CREATE INDEX idx_entity_intentions_intention ON entity_intentions(intention_id);
CREATE INDEX idx_entity_intentions_strength ON entity_intentions(strength);
CREATE INDEX idx_entity_intentions_type_intention ON entity_intentions(entity_type, intention_id);

-- Trigger for entity_intentions
CREATE TRIGGER update_entity_intentions_updated_at BEFORE UPDATE ON entity_intentions
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- =============================================================================
-- ENTITY CATEGORIES & TAGS
-- =============================================================================
-- Note: Entity-specific category and tag tables have been removed.
-- The unified entity_categories and entity_tags tables are now defined in
-- 02-schema.sql so they're available before seed data runs.
--
-- Removed tables:
-- - crystal_categories, herb_categories, candle_categories
-- - incense_categories, oil_categories, salt_categories
-- - crystal_tags, herb_tags, candle_tags
-- - incense_tags, oil_tags, salt_tags
--
-- Replaced with:
-- - entity_categories (defined in 02-schema.sql)
-- - entity_tags (defined in 02-schema.sql)

-- =============================================================================
-- ENTITY SOCIAL FEATURES (REMOVED)
-- =============================================================================
-- Note: Social features (likes, favorites, comments) are only for user-generated
-- content (grimoires table). Reference/encyclopedia content (crystals, herbs, 
-- candles, oils, incense) are informational only and don't need social features.
-- 
-- Removed tables:
-- - crystal_likes, crystal_favorites
-- - herb_likes, herb_favorites  
-- - candle_likes, candle_favorites
-- - incense_likes, incense_favorites
-- - oil_likes, oil_favorites
-- - entity_comments
--
-- Social features remain on the grimoires table via:
-- - grimoire_likes, grimoire_dislikes, grimoire_favorites
-- - comments (linked to grimoire_id)

-- =============================================================================
-- ENTITY VIEW TRACKING
-- =============================================================================
-- Track views for analytics (kept for understanding what content users find useful)

CREATE TABLE entity_views (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    entity_type VARCHAR(20) NOT NULL, -- crystal, herb, candle, incense, oil, deity, etc.
    entity_id UUID NOT NULL,
    user_id UUID REFERENCES users(id),
    session_id VARCHAR(255),
    ip_address INET,
    user_agent TEXT,
    referrer TEXT,
    viewed_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT valid_entity_type CHECK (entity_type IN (
        'crystal', 'herb', 'candle', 'incense', 'oil', 'salt',
        'deity', 'sabbat', 'moon_phase', 'zodiac_sign'
    ))
);

CREATE INDEX idx_entity_views_type_id ON entity_views(entity_type, entity_id);
CREATE INDEX idx_entity_views_user ON entity_views(user_id);
CREATE INDEX idx_entity_views_date ON entity_views(viewed_at);

-- =============================================================================
-- USER BOOKMARKS (Optional - for saving reference pages)
-- =============================================================================
-- Instead of "favorites", users can bookmark encyclopedia pages for quick reference
-- This is lighter weight than favorites - just a way to save links for later

CREATE TABLE user_bookmarks (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    entity_type VARCHAR(20) NOT NULL,
    entity_id UUID NOT NULL,
    notes TEXT, -- Optional personal notes about why they bookmarked this
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    
    UNIQUE(user_id, entity_type, entity_id),
    
    CONSTRAINT valid_entity_type CHECK (entity_type IN (
        'crystal', 'herb', 'candle', 'incense', 'oil', 'salt',
        'deity', 'sabbat', 'moon_phase', 'zodiac_sign'
    ))
);

CREATE INDEX idx_user_bookmarks_user ON user_bookmarks(user_id);
CREATE INDEX idx_user_bookmarks_type_id ON user_bookmarks(entity_type, entity_id);
