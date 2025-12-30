-- =============================================================================
-- GRIMOIRE COLLECTIVE - ENTITY TABLES
-- =============================================================================
-- Purpose: Structured encyclopedia-style tables for crystals, herbs, candles, 
--          incense, oils, and other magical components
-- Created: 2025-12-28
-- =============================================================================

-- =============================================================================
-- CRYSTALS
-- =============================================================================

CREATE TABLE crystals (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    
    -- Basic Information
    name VARCHAR(100) UNIQUE NOT NULL,
    slug VARCHAR(100) UNIQUE NOT NULL,
    alternative_names TEXT[], -- Array for multiple alternative names
    
    -- Crystal Properties (visual/physical only)
    color VARCHAR(50),
    
    -- NOTE: chakra, zodiac_signs, element, and planet are now in junction tables:
    -- entity_chakras, entity_zodiac_signs, entity_pairings (for elements), entity_planets
    
    -- NOTE: magical_properties now tracked via entity_intentions junction table
    
    -- Cleansing Methods (as array)
    cleansing_methods TEXT[], -- e.g., ['full_moon', 'sun', 'running_water', 'salt', 'smoke', 'sound']
    cleansing_notes TEXT, -- Additional details about cleansing
    
    -- Charging Methods
    charging_methods TEXT[], -- e.g., ['moonlight', 'sunlight', 'earth', 'crystal_cluster']
    charging_notes TEXT,
    
    -- Usage Information
    description TEXT NOT NULL, -- Main description
    uses TEXT, -- How to use this crystal
    affirmations TEXT[], -- Affirmations to use with this crystal
    
    -- Care & Safety
    water_safe BOOLEAN DEFAULT TRUE,
    sun_safe BOOLEAN DEFAULT TRUE,
    salt_safe BOOLEAN DEFAULT TRUE,
    toxicity_warning TEXT, -- Important safety information
    
    -- Rarity & Sourcing
    rarity VARCHAR(20), -- common, uncommon, rare, very_rare
    primary_sources TEXT[], -- Countries/regions where found
    ethical_sourcing_notes TEXT,
    
    -- Additional Fields
    history TEXT,
    directions TEXT,
    storage_instructions TEXT,
    safety_warnings TEXT,
    
    -- Extended metadata as JSONB for flexibility
    metadata JSONB, -- Can include: folklore, historical_uses, crystal_system, chemical_composition, etc.
    
    -- Media: Use entity_media table to link to media_files
    
    -- SEO
    meta_description TEXT,
    
    -- Moderation
    created_by UUID REFERENCES users(id),
    verified_by UUID REFERENCES users(id),
    is_verified BOOLEAN DEFAULT FALSE,
    
    -- Timestamps
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP,
    
    CONSTRAINT valid_rarity CHECK (rarity IN ('common', 'uncommon', 'rare', 'very_rare'))
);

-- Indexes for crystals
CREATE INDEX idx_crystals_slug ON crystals(slug) WHERE deleted_at IS NULL;
CREATE INDEX idx_crystals_name ON crystals(name) WHERE deleted_at IS NULL;
CREATE INDEX idx_crystals_verified ON crystals(is_verified) WHERE deleted_at IS NULL;

-- Full-text search for crystals
CREATE INDEX idx_crystals_fulltext ON crystals USING GIN (to_tsvector('english', name || ' ' || COALESCE(description, '')));

-- =============================================================================
-- HERBS
-- =============================================================================

CREATE TABLE herbs (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    
    -- Basic Information
    name VARCHAR(100) UNIQUE NOT NULL,
    slug VARCHAR(100) UNIQUE NOT NULL,
    alternative_names TEXT[], -- Common names, folk names
    scientific_name VARCHAR(150), -- Latin botanical name
    
    -- Plant Information
    plant_family VARCHAR(100),
    plant_type VARCHAR(50), -- annual, perennial, biennial, shrub, tree
    growing_zones TEXT[], -- USDA zones
    native_regions TEXT[],
    
    -- Parts Used
    parts_used TEXT[], -- leaves, flowers, roots, bark, seeds, whole_plant
    
    -- Magical Properties
    magical_properties TEXT[], -- e.g., ['love', 'prosperity', 'protection', 'healing']
    element VARCHAR(20),
    planet VARCHAR(50),
    zodiac_signs TEXT[],
    deities_associated TEXT[],
    sabbats_associated TEXT[], -- Calendar event names (Sabbats/Esbats) this herb is associated with
    
    -- Usage Information
    description TEXT NOT NULL,
    magical_uses TEXT,
    ritual_uses TEXT,
    medicinal_uses TEXT, -- Traditional/historical only, not medical advice
    
    -- Preparation Methods
    preparation_methods TEXT[], -- tea, tincture, oil, sachet, incense, fresh, dried
    preparation_notes TEXT,
    
    -- Harvesting
    best_harvest_time TEXT,
    harvesting_notes TEXT,
    
    -- Storage & Preservation
    storage_methods TEXT[],
    shelf_life TEXT,
    
    -- Safety
    toxicity_level VARCHAR(20), -- non_toxic, mildly_toxic, toxic, highly_toxic
    safety_warnings TEXT,
    pregnancy_safe BOOLEAN DEFAULT NULL, -- NULL means unknown/uncatalogued
    pet_safe BOOLEAN DEFAULT NULL,
    contraindications TEXT, -- Medical interactions/warnings
    
    -- Substitutions
    magical_substitutes TEXT[], -- Other herbs with similar properties
    
    -- Additional Fields
    history TEXT,
    directions TEXT,
    scent_profile TEXT,
    skin_safe BOOLEAN DEFAULT NULL,
    
    -- Extended metadata
    metadata JSONB, -- folklore, history, correspondences, etc.
    
    -- Media: Use entity_media table to link to media_files
    
    -- SEO
    meta_description TEXT,
    
    -- Moderation
    created_by UUID REFERENCES users(id),
    verified_by UUID REFERENCES users(id),
    is_verified BOOLEAN DEFAULT FALSE,
    
    -- Timestamps
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP,
    
    CONSTRAINT valid_element CHECK (element IN ('Earth', 'Air', 'Fire', 'Water', 'Spirit', 'All')),
    CONSTRAINT valid_toxicity CHECK (toxicity_level IN ('non_toxic', 'mildly_toxic', 'toxic', 'highly_toxic', 'unknown'))
);

-- Indexes for herbs
CREATE INDEX idx_herbs_slug ON herbs(slug) WHERE deleted_at IS NULL;
CREATE INDEX idx_herbs_name ON herbs(name) WHERE deleted_at IS NULL;
CREATE INDEX idx_herbs_scientific ON herbs(scientific_name) WHERE deleted_at IS NULL;
CREATE INDEX idx_herbs_properties ON herbs USING GIN (magical_properties);
CREATE INDEX idx_herbs_element ON herbs(element) WHERE deleted_at IS NULL;
CREATE INDEX idx_herbs_verified ON herbs(is_verified) WHERE deleted_at IS NULL;

-- Full-text search for herbs
CREATE INDEX idx_herbs_fulltext ON herbs USING GIN (to_tsvector('english', name || ' ' || COALESCE(scientific_name, '') || ' ' || COALESCE(description, '')));

-- =============================================================================
-- CANDLES
-- =============================================================================

CREATE TABLE candles (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    
    -- Basic Information
    name VARCHAR(100) NOT NULL, -- e.g., "Red Candle", "White Taper Candle"
    slug VARCHAR(100) UNIQUE NOT NULL,
    
    -- Physical Properties
    color VARCHAR(50) NOT NULL,
    
    -- NOTE: Magical properties now linked via entity_intentions junction table
    -- NOTE: Elements now linked via entity_elements junction table (if needed, or stored as single element reference)
    -- NOTE: Planets now linked via entity_planets junction table
    -- NOTE: Chakras now linked via entity_chakras junction table
    -- NOTE: Zodiac signs now linked via entity_zodiac_signs junction table
    -- NOTE: Spell types now linked via grimoire_spell_methods/grimoire_spell_ethics tables
    -- NOTE: Pairings now linked via entity_pairings junction table
    
    -- Core Attributes (non-relational)
    day_of_week VARCHAR(20), -- Best day to use (could be linked to planets via day correspondences)
    moon_phase VARCHAR(30), -- Best moon phase to use (could link to moon_phases table if needed)
    
    -- Usage Information
    description TEXT NOT NULL,
    magical_uses TEXT, -- General description of magical uses
    ritual_purposes TEXT,
    
    -- Timing & Direction
    best_time_to_use TEXT, -- Dawn, noon, dusk, midnight, etc.
    direction_to_face VARCHAR(20), -- North, East, South, West
    
    -- Instructions
    dressing_instructions TEXT, -- How to dress/anoint the candle
    burning_instructions TEXT, -- How to safely burn
    disposal_instructions TEXT, -- How to dispose of candle remains
    
    -- Additional Fields
    history TEXT,
    
    -- Extended metadata
    metadata JSONB, -- symbolism, deities, additional correspondences, etc.
    
    -- Media: Use entity_media table to link to media_files
    
    -- SEO
    meta_description TEXT,
    
    -- Moderation
    created_by UUID REFERENCES users(id),
    verified_by UUID REFERENCES users(id),
    is_verified BOOLEAN DEFAULT FALSE,
    
    -- Timestamps
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP
);

-- Indexes for candles
CREATE INDEX idx_candles_slug ON candles(slug) WHERE deleted_at IS NULL;
CREATE INDEX idx_candles_color ON candles(color) WHERE deleted_at IS NULL;
CREATE INDEX idx_candles_verified ON candles(is_verified) WHERE deleted_at IS NULL;

-- Full-text search for candles
CREATE INDEX idx_candles_fulltext ON candles USING GIN (to_tsvector('english', name || ' ' || color || ' ' || COALESCE(description, '')));

-- =============================================================================
-- INCENSE
-- =============================================================================

CREATE TABLE incense (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    
    -- Basic Information
    name VARCHAR(100) UNIQUE NOT NULL,
    slug VARCHAR(100) UNIQUE NOT NULL,
    alternative_names TEXT[],
    
    -- Physical Properties
    incense_type VARCHAR(50), -- stick, cone, resin, powder, loose, coil
    scent_profile TEXT, -- Sweet, earthy, woody, floral, spicy, etc.
    ingredients TEXT[], -- Main ingredients
    
    -- Magical Properties
    magical_properties TEXT[], -- e.g., ['purification', 'meditation', 'prosperity']
    element VARCHAR(20),
    planet VARCHAR(50),
    zodiac_signs TEXT[],
    deities_associated TEXT[],
    
    -- Usage Information
    description TEXT NOT NULL,
    magical_uses TEXT,
    ritual_uses TEXT,
    meditation_uses TEXT,
    best_used_for TEXT[],
    
    -- Burning Information
    burn_time TEXT, -- Approximate burn time
    burning_instructions TEXT,
    best_time_to_burn TEXT,
    moon_phase VARCHAR(30),
    
    -- Combinations
    blends_well_with TEXT[], -- Other incense that pair well
    herb_combinations TEXT[],
    crystal_combinations TEXT[],
    
    -- Safety
    safety_warnings TEXT,
    ventilation_required BOOLEAN DEFAULT TRUE,
    
    -- Additional Fields
    history TEXT,
    shelf_life TEXT,
    storage_instructions TEXT,
    pet_safe BOOLEAN DEFAULT NULL,
    pregnancy_safe BOOLEAN DEFAULT NULL,
    
    -- Extended metadata
    metadata JSONB,
    
    -- Media: Use entity_media table to link to media_files
    
    -- SEO
    meta_description TEXT,
    
    -- Moderation
    created_by UUID REFERENCES users(id),
    verified_by UUID REFERENCES users(id),
    is_verified BOOLEAN DEFAULT FALSE,
    
    -- Timestamps
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP,
    
    CONSTRAINT valid_element CHECK (element IN ('Earth', 'Air', 'Fire', 'Water', 'Spirit', 'All'))
);

-- Indexes for incense
CREATE INDEX idx_incense_slug ON incense(slug) WHERE deleted_at IS NULL;
CREATE INDEX idx_incense_name ON incense(name) WHERE deleted_at IS NULL;
CREATE INDEX idx_incense_properties ON incense USING GIN (magical_properties);
CREATE INDEX idx_incense_verified ON incense(is_verified) WHERE deleted_at IS NULL;

-- =============================================================================
-- OILS (Essential, Carrier, Magical)
-- =============================================================================

CREATE TABLE oils (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    
    -- Basic Information
    name VARCHAR(100) UNIQUE NOT NULL,
    slug VARCHAR(100) UNIQUE NOT NULL,
    alternative_names TEXT[],
    oil_type VARCHAR(50) NOT NULL, -- essential, carrier, infused, blend, magical
    
    -- Source Information
    source_plant VARCHAR(150), -- What plant it comes from
    extraction_method VARCHAR(50), -- cold_press, steam_distillation, solvent, etc.
    
    -- Physical Properties
    color VARCHAR(50),
    consistency VARCHAR(30), -- thin, medium, thick
    shelf_life TEXT,
    storage_instructions TEXT,
    
    -- Magical Properties
    magical_properties TEXT[],
    element VARCHAR(20),
    planet VARCHAR(50),
    zodiac_signs TEXT[],
    chakras TEXT[],
    
    -- Usage Information
    description TEXT NOT NULL,
    magical_uses TEXT,
    ritual_uses TEXT,
    anointing_uses TEXT,
    aromatherapy_uses TEXT,
    
    -- Application Methods
    application_methods TEXT[], -- topical, diffusion, bath, anointing, ritual
    dilution_guidelines TEXT,
    
    -- Combinations
    blends_well_with TEXT[], -- Other oils that pair well
    herb_combinations TEXT[],
    crystal_combinations TEXT[],
    candle_uses TEXT, -- How to use with candles
    
    -- Safety
    skin_safe BOOLEAN DEFAULT FALSE,
    dilution_required BOOLEAN DEFAULT TRUE,
    pregnancy_safe BOOLEAN DEFAULT NULL,
    pet_safe BOOLEAN DEFAULT NULL,
    photosensitive BOOLEAN DEFAULT FALSE, -- Causes sun sensitivity
    safety_warnings TEXT,
    contraindications TEXT,
    
    -- Additional Fields
    history TEXT,
    scent_profile TEXT,
    
    -- Extended metadata
    metadata JSONB,
    
    -- Media: Use entity_media table to link to media_files
    
    -- SEO
    meta_description TEXT,
    
    -- Moderation
    created_by UUID REFERENCES users(id),
    verified_by UUID REFERENCES users(id),
    is_verified BOOLEAN DEFAULT FALSE,
    
    -- Timestamps
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP,
    
    CONSTRAINT valid_oil_type CHECK (oil_type IN ('essential', 'carrier', 'infused', 'blend', 'magical')),
    CONSTRAINT valid_element CHECK (element IN ('Earth', 'Air', 'Fire', 'Water', 'Spirit', 'All'))
);

-- Indexes for oils
CREATE INDEX idx_oils_slug ON oils(slug) WHERE deleted_at IS NULL;
CREATE INDEX idx_oils_name ON oils(name) WHERE deleted_at IS NULL;
CREATE INDEX idx_oils_type ON oils(oil_type) WHERE deleted_at IS NULL;
CREATE INDEX idx_oils_properties ON oils USING GIN (magical_properties);
CREATE INDEX idx_oils_verified ON oils(is_verified) WHERE deleted_at IS NULL;

-- =============================================================================
-- SALTS (Bath Salts, Ritual Salts, Spell Salts)
-- =============================================================================

CREATE TABLE salts (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    
    -- Basic Information
    name VARCHAR(100) UNIQUE NOT NULL,
    slug VARCHAR(100) UNIQUE NOT NULL,
    alternative_names TEXT[],
    salt_type VARCHAR(50) NOT NULL, -- bath, ritual, spell, protection, cleansing, etc.
    
    -- Base Salt Type
    base_salt VARCHAR(50), -- sea_salt, epsom_salt, himalayan_salt, black_salt, etc.
    
    -- Physical Properties
    color VARCHAR(50),
    texture VARCHAR(30), -- fine, coarse, chunky
    
    -- Magical Properties
    magical_properties TEXT[],
    element VARCHAR(20),
    planet VARCHAR(50),
    zodiac_signs TEXT[],
    
    -- Usage Information
    description TEXT NOT NULL,
    magical_uses TEXT,
    ritual_uses TEXT,
    bath_uses TEXT,
    how_to_use TEXT,
    
    -- Ingredients (if a blend)
    ingredients TEXT[], -- Array of ingredient names for display
    
    -- Application Methods
    application_methods TEXT[], -- bath, sprinkle, circle_casting, jar_spell, etc.
    
    -- Safety
    skin_safe BOOLEAN DEFAULT TRUE,
    safe_for_drains BOOLEAN DEFAULT TRUE,
    pregnancy_safe BOOLEAN DEFAULT NULL,
    pet_safe BOOLEAN DEFAULT NULL,
    safety_warnings TEXT,
    
    -- Storage
    storage_instructions TEXT,
    shelf_life TEXT,
    
    -- Recipe Information (if this salt can be made)
    has_recipe BOOLEAN DEFAULT FALSE, -- If true, there's a recipe in grimoires
    
    -- Additional Fields
    history TEXT,
    
    -- Extended metadata
    metadata JSONB,
    
    -- Media: Use entity_media table to link to media_files
    
    -- SEO
    meta_description TEXT,
    
    -- Moderation
    created_by UUID REFERENCES users(id),
    verified_by UUID REFERENCES users(id),
    is_verified BOOLEAN DEFAULT FALSE,
    
    -- Timestamps
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP,
    
    CONSTRAINT valid_element CHECK (element IN ('Earth', 'Air', 'Fire', 'Water', 'Spirit', 'All'))
);

-- Indexes for salts
CREATE INDEX idx_salts_slug ON salts(slug) WHERE deleted_at IS NULL;
CREATE INDEX idx_salts_name ON salts(name) WHERE deleted_at IS NULL;
CREATE INDEX idx_salts_type ON salts(salt_type) WHERE deleted_at IS NULL;
CREATE INDEX idx_salts_properties ON salts USING GIN (magical_properties);
CREATE INDEX idx_salts_verified ON salts(is_verified) WHERE deleted_at IS NULL;
CREATE INDEX idx_salts_has_recipe ON salts(has_recipe) WHERE has_recipe = true AND deleted_at IS NULL;

-- =============================================================================
-- ENTITY MEDIA
-- =============================================================================
-- Note: Entity media is now handled by the unified entity_media table in 02-schema.sql
-- which links any entity type to media_files.
-- 
-- Removed fields:
-- - primary_image_url from all entity tables
--
-- Removed tables:
-- - grimoire_media (replaced by entity_media)
-- - crystal_media, herb_media, candle_media, incense_media, oil_media, salt_media
--
-- All entities now use: entity_media -> media_files

-- =============================================================================
-- DIVINATION METHODS
-- =============================================================================

CREATE TABLE divination_methods (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    
    -- Basic Info
    name VARCHAR(255) NOT NULL,
    slug VARCHAR(255) UNIQUE NOT NULL,
    alternative_names TEXT[],
    
    -- Classification
    method_type VARCHAR(100), -- e.g., 'cartomancy', 'lithomancy', 'scrying', 'geomancy'
    difficulty_level VARCHAR(20), -- beginner, intermediate, advanced
    tradition VARCHAR(100), -- e.g., 'European', 'Celtic', 'Norse', 'Romani'
    
    -- Description
    description TEXT NOT NULL,
    history TEXT,
    
    -- How to Practice
    how_to_use TEXT,
    interpretation_guide TEXT,
    common_spreads TEXT[], -- For card-based systems
    
    -- Tools & Materials Needed
    tools_required TEXT[],
    materials_needed TEXT,
    
    -- Best Uses
    best_for TEXT[], -- e.g., ['yes/no questions', 'future insight', 'decision making']
    magical_properties TEXT[],
    
    -- Timing & Associations
    best_moon_phase TEXT[],
    associated_elements TEXT[],
    deities_associated TEXT[],
    
    -- Metadata
    is_verified BOOLEAN DEFAULT FALSE,
    created_by UUID REFERENCES users(id) ON DELETE SET NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP,
    
    CONSTRAINT valid_difficulty CHECK (difficulty_level IN ('beginner', 'intermediate', 'advanced', 'expert'))
);

-- Media: Use entity_media table with entity_type='divination_method'
-- Categories: Use entity_categories table with entity_type='divination_method'
-- Tags: Use entity_tags table with entity_type='divination_method'

CREATE INDEX idx_divination_methods_slug ON divination_methods(slug);
CREATE INDEX idx_divination_methods_type ON divination_methods(method_type);
CREATE INDEX idx_divination_methods_difficulty ON divination_methods(difficulty_level);

-- =============================================================================
-- RITUAL TOOLS
-- =============================================================================

CREATE TABLE ritual_tools (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    
    -- Basic Info
    name VARCHAR(255) NOT NULL,
    slug VARCHAR(255) UNIQUE NOT NULL,
    alternative_names TEXT[],
    
    -- Classification
    tool_category VARCHAR(100), -- e.g., 'elemental', 'altar', 'energy_direction', 'divination'
    element VARCHAR(20), -- Air, Fire, Water, Earth, Spirit
    tradition VARCHAR(100),
    
    -- Description
    description TEXT NOT NULL,
    history TEXT,
    symbolism TEXT,
    
    -- Usage
    magical_uses TEXT,
    how_to_use TEXT,
    consecration_methods TEXT,
    charging_methods TEXT,
    
    -- Magical Properties
    magical_properties TEXT[],
    purposes TEXT[], -- e.g., ['directing energy', 'casting circle', 'divination']
    
    -- Materials & Creation
    traditional_materials TEXT[], -- e.g., ['wood', 'metal', 'crystal']
    how_to_make TEXT,
    where_to_acquire TEXT,
    
    -- Care & Maintenance
    cleansing_methods TEXT[],
    storage_recommendations TEXT,
    
    -- Associations
    associated_deities TEXT[],
    zodiac_signs TEXT[],
    sabbats_associated TEXT[],
    
    -- Metadata
    is_verified BOOLEAN DEFAULT FALSE,
    created_by UUID REFERENCES users(id) ON DELETE SET NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP,
    
    CONSTRAINT valid_element CHECK (element IN ('Air', 'Fire', 'Water', 'Earth', 'Spirit', 'All'))
);

-- Media: Use entity_media table with entity_type='ritual_tool'
-- Categories: Use entity_categories table with entity_type='ritual_tool'
-- Tags: Use entity_tags table with entity_type='ritual_tool'

CREATE INDEX idx_ritual_tools_slug ON ritual_tools(slug);
CREATE INDEX idx_ritual_tools_category ON ritual_tools(tool_category);
CREATE INDEX idx_ritual_tools_element ON ritual_tools(element);

-- =============================================================================
-- TRIGGERS FOR UPDATED_AT
-- =============================================================================

-- Note: update_updated_at_column() function is defined in 02-schema.sql

-- Apply triggers to all entity tables
CREATE TRIGGER update_crystals_updated_at BEFORE UPDATE ON crystals
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_herbs_updated_at BEFORE UPDATE ON herbs
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_candles_updated_at BEFORE UPDATE ON candles
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_incense_updated_at BEFORE UPDATE ON incense
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_oils_updated_at BEFORE UPDATE ON oils
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_salts_updated_at BEFORE UPDATE ON salts
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_divination_methods_updated_at BEFORE UPDATE ON divination_methods
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_ritual_tools_updated_at BEFORE UPDATE ON ritual_tools
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- Media junction table triggers removed (tables no longer exist)

