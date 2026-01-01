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
    
    -- Usage Information
    description TEXT NOT NULL,
    magical_uses TEXT,
    ritual_uses TEXT,
    
    -- NOTE: Magical properties → link via entity_intentions junction table
    -- NOTE: Element → link via entity_elements junction table
    -- NOTE: Planet → link via planets table when created
    -- NOTE: Zodiac signs → link via entity_zodiac_signs junction table
    -- NOTE: Deities → link via entity_deities junction table
    -- NOTE: Sabbats → link via calendar table (sabbats_associated removed)
    -- NOTE: Substitutes → link via entity_substitutes junction table
    
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
    
    CONSTRAINT valid_toxicity CHECK (toxicity_level IN ('non_toxic', 'mildly_toxic', 'toxic', 'highly_toxic', 'unknown'))
);

-- Indexes for herbs
CREATE INDEX idx_herbs_slug ON herbs(slug) WHERE deleted_at IS NULL;
CREATE INDEX idx_herbs_name ON herbs(name) WHERE deleted_at IS NULL;
CREATE INDEX idx_herbs_scientific ON herbs(scientific_name) WHERE deleted_at IS NULL;
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
    
    -- Usage Information
    description TEXT NOT NULL,
    magical_uses TEXT,
    ritual_uses TEXT,
    meditation_uses TEXT,
    best_used_for TEXT[],
    
    -- NOTE: Magical properties → link via entity_intentions junction table
    -- NOTE: Element → link via entity_elements junction table
    -- NOTE: Planet → link via planets table when created
    -- NOTE: Zodiac signs → link via entity_zodiac_signs junction table
    -- NOTE: Deities → link via entity_deities junction table
    -- NOTE: Moon phase → link via entity_moon_phases junction table
    -- NOTE: Blends well with → link via entity_substitutes or new incense_combinations table
    -- NOTE: Herb combinations → link via junction table to herbs
    -- NOTE: Crystal combinations → link via junction table to crystals
    
    -- Burning Information
    burn_time TEXT, -- Approximate burn time
    burning_instructions TEXT,
    best_time_to_burn TEXT,
    
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
    deleted_at TIMESTAMP
);

-- Indexes for incense
CREATE INDEX idx_incense_slug ON incense(slug) WHERE deleted_at IS NULL;
CREATE INDEX idx_incense_name ON incense(name) WHERE deleted_at IS NULL;
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
    -- NOTE: color removed - not essential for magical work
    -- NOTE: consistency removed - not essential for magical work
    shelf_life TEXT,
    storage_instructions TEXT,
    
    -- Magical Properties
    -- NOTE: magical_properties → Link via entity_intentions junction table
    -- NOTE: element → Link via entity_elements junction table
    -- NOTE: planet → Link via planets table when created
    -- NOTE: zodiac_signs → Link via entity_zodiac_signs junction table
    -- NOTE: chakras → Link via entity_chakras junction table
    
    -- Usage Information
    description TEXT NOT NULL,
    magical_uses TEXT,
    ritual_uses TEXT,
    anointing_uses TEXT,
    -- NOTE: aromatherapy_uses removed - out of scope for magical database
    
    -- Application Methods
    application_methods TEXT[], -- topical, diffusion, bath, anointing, ritual
    dilution_guidelines TEXT,
    
    -- Combinations
    -- NOTE: blends_well_with → Link via oils combinations table or entity_substitutes
    -- NOTE: herb_combinations → Link via junction table to herbs
    -- NOTE: crystal_combinations → Link via junction table to crystals
    -- NOTE: candle_uses removed - use grimoire recipes instead
    
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
    
    CONSTRAINT valid_oil_type CHECK (oil_type IN ('essential', 'carrier', 'infused', 'blend', 'magical'))
);

-- Indexes for oils
CREATE INDEX idx_oils_slug ON oils(slug) WHERE deleted_at IS NULL;
CREATE INDEX idx_oils_name ON oils(name) WHERE deleted_at IS NULL;
CREATE INDEX idx_oils_type ON oils(oil_type) WHERE deleted_at IS NULL;
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
    -- NOTE: salt_type removed - use entity_intentions junction table (entity_type='salt') to link to intention types
    
    -- Base Salt Type
    base_salt VARCHAR(50), -- sea_salt, epsom_salt, himalayan_salt, black_salt, etc.
    
    -- Physical Properties
    color VARCHAR(50),
    texture VARCHAR(30), -- fine, coarse, chunky
    
    -- Magical Properties
    -- NOTE: Magical properties linked via entity_intentions junction table (entity_type='salt')
    -- NOTE: Element associations linked via entity_elements junction table (entity_type='salt')
    -- NOTE: Planet associations linked via entity_planets junction table (entity_type='salt')
    -- NOTE: Zodiac associations linked via entity_zodiac_signs junction table (entity_type='salt')
    
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
    deleted_at TIMESTAMP
);

-- Indexes for salts
CREATE INDEX idx_salts_slug ON salts(slug) WHERE deleted_at IS NULL;
CREATE INDEX idx_salts_name ON salts(name) WHERE deleted_at IS NULL;
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
    -- NOTE: Traditions should be linked via entity_traditions junction table (needs creation)
    
    -- Description
    description TEXT NOT NULL,
    history TEXT,
    
    -- How to Practice
    how_to_use TEXT,
    interpretation_guide TEXT,
    
    -- NOTE: Spreads are now in divination_spreads table (for card/rune systems)
    -- NOTE: Tools should be linked via entity_ritual_tools junction table (needs creation)
    -- NOTE: Materials/ingredients should be linked via entity ingredients junction tables
    
    -- Best Uses
    best_for TEXT[], -- e.g., ['yes/no questions', 'future insight', 'decision making']
    
    -- NOTE: Magical properties should be linked via entity_intentions junction table
    -- NOTE: Moon phases should be linked via entity_moon_phases junction table
    -- NOTE: Elements should be linked via entity_elements junction table
    -- NOTE: Deities should be linked via entity_deities junction table
    
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
-- DIVINATION SPREADS (for card and rune systems)
-- =============================================================================

CREATE TABLE divination_spreads (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(255) NOT NULL,
    slug VARCHAR(255) UNIQUE NOT NULL,
    
    -- Which systems use this spread
    divination_method_id UUID REFERENCES divination_methods(id) ON DELETE CASCADE,
    
    -- Spread details
    description TEXT NOT NULL,
    position_count INTEGER NOT NULL, -- How many cards/runes in this spread
    positions JSONB, -- Array of position meanings: [{"position": 1, "name": "Past", "meaning": "..."}]
    layout_diagram TEXT, -- ASCII or description of physical layout
    difficulty_level VARCHAR(20),
    
    -- Usage
    best_for TEXT[], -- What questions/situations this spread is good for
    interpretation_tips TEXT,
    
    -- Metadata
    is_verified BOOLEAN DEFAULT FALSE,
    created_by UUID REFERENCES users(id) ON DELETE SET NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT valid_spread_difficulty CHECK (difficulty_level IN ('beginner', 'intermediate', 'advanced'))
);

CREATE INDEX idx_divination_spreads_slug ON divination_spreads(slug);
CREATE INDEX idx_divination_spreads_method ON divination_spreads(divination_method_id);
CREATE INDEX idx_divination_spreads_positions ON divination_spreads(position_count);

-- =============================================================================
-- TAROT CARDS
-- =============================================================================

CREATE TABLE tarot_cards (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(255) NOT NULL,
    slug VARCHAR(255) UNIQUE NOT NULL,
    
    -- Card classification
    card_type VARCHAR(20) NOT NULL, -- 'major' or 'minor'
    suit VARCHAR(20), -- 'wands', 'cups', 'swords', 'pentacles' (NULL for Major Arcana)
    number INTEGER, -- 0-21 for Major Arcana, 1-10 for pips, NULL for court cards
    court_rank VARCHAR(20), -- 'page', 'knight', 'queen', 'king' (NULL for non-court cards)
    arcana_number INTEGER, -- Position in deck (0-77)
    
    -- Meanings
    keywords TEXT[],
    upright_meaning TEXT NOT NULL,
    reversed_meaning TEXT,
    
    -- Deeper interpretation
    description TEXT,
    symbolism TEXT, -- Description of imagery and symbols
    elemental_association VARCHAR(20), -- Fire, Water, Air, Earth, Spirit
    astrological_association VARCHAR(100), -- Zodiac sign or planet
    numerological_meaning TEXT,
    
    -- Journey and lessons
    archetype VARCHAR(255), -- e.g., 'The Fool', 'The Magician', 'The High Priestess'
    life_lesson TEXT,
    spiritual_message TEXT,
    shadow_work TEXT, -- What this card reveals about shadow aspects
    
    -- Practical guidance
    advice TEXT,
    questions_to_ask TEXT[], -- Reflective questions for this card
    affirmation TEXT,
    
    -- In readings
    love_career_health JSONB, -- {"love": "...", "career": "...", "health": "..."}
    timing VARCHAR(100), -- When this might manifest
    yes_no VARCHAR(20), -- 'yes', 'no', 'maybe', 'unclear'
    
    -- Metadata
    is_verified BOOLEAN DEFAULT FALSE,
    created_by UUID REFERENCES users(id) ON DELETE SET NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT valid_card_type CHECK (card_type IN ('major', 'minor')),
    CONSTRAINT valid_suit CHECK (suit IS NULL OR suit IN ('wands', 'cups', 'swords', 'pentacles')),
    CONSTRAINT valid_court_rank CHECK (court_rank IS NULL OR court_rank IN ('page', 'knight', 'queen', 'king')),
    CONSTRAINT valid_yes_no CHECK (yes_no IS NULL OR yes_no IN ('yes', 'no', 'maybe', 'unclear'))
);

CREATE INDEX idx_tarot_cards_slug ON tarot_cards(slug);
CREATE INDEX idx_tarot_cards_type ON tarot_cards(card_type);
CREATE INDEX idx_tarot_cards_suit ON tarot_cards(suit);
CREATE INDEX idx_tarot_cards_arcana ON tarot_cards(arcana_number);

-- =============================================================================
-- RUNES (Elder Futhark)
-- =============================================================================

CREATE TABLE runes (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(255) NOT NULL, -- e.g., 'Fehu', 'Uruz', 'Thurisaz'
    slug VARCHAR(255) UNIQUE NOT NULL,
    
    -- Rune identity
    -- NOTE: Symbol removed - can be stored as alternative representation
    pronunciation VARCHAR(50),
    letter_equivalent VARCHAR(10), -- Latin alphabet equivalent
    position_in_futhark INTEGER, -- 1-24 for Elder Futhark
    aett VARCHAR(50), -- Which aett (group of 8): 'freyja', 'heimdall', 'tyr'
    
    -- Meanings
    keywords TEXT[],
    upright_meaning TEXT NOT NULL,
    reversed_meaning TEXT, -- Some traditions don't use reversed
    merkstave_meaning TEXT, -- Alternative term for reversed
    
    -- Deeper interpretation
    description TEXT,
    -- NOTE: Element associations linked via entity_elements junction table (entity_type='rune')
    -- NOTE: Deity associations linked via entity_deities junction table (entity_type='rune')
    tree_association VARCHAR(100), -- Tree in Norse tradition
    
    -- Symbolic meaning
    literal_meaning VARCHAR(255), -- e.g., Fehu = 'cattle', 'wealth'
    esoteric_meaning TEXT,
    divinatory_meaning TEXT,
    -- NOTE: Magical uses linked via entity_intentions junction table (entity_type='rune')
    
    -- In readings
    advice TEXT,
    challenge TEXT, -- What challenge this rune presents
    gift TEXT, -- What gift/strength this rune offers
    
    -- Practical applications
    in_love TEXT,
    in_work TEXT,
    in_health TEXT,
    spiritual_lesson TEXT,
    
    -- Rune magic
    galdr TEXT, -- Rune chant/incantation
    stances TEXT, -- Body positions for this rune (stadha)
    -- NOTE: Colors removed - can be stored in metadata or as tags if needed
    
    -- Metadata
    is_verified BOOLEAN DEFAULT FALSE,
    created_by UUID REFERENCES users(id) ON DELETE SET NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT valid_rune_aett CHECK (aett IN ('freyja', 'heimdall', 'tyr')),
    CONSTRAINT valid_position CHECK (position_in_futhark BETWEEN 1 AND 24)
);

CREATE INDEX idx_runes_slug ON runes(slug);
CREATE INDEX idx_runes_aett ON runes(aett);
CREATE INDEX idx_runes_position ON runes(position_in_futhark);

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
    -- NOTE: Element associations linked via entity_elements junction table (entity_type='ritual_tool')
    -- NOTE: Tradition linked via entity_traditions junction table (entity_type='ritual_tool')
    
    -- Description
    description TEXT NOT NULL,
    history TEXT,
    symbolism TEXT,
    
    -- Usage
    -- NOTE: Magical uses/properties linked via entity_intentions junction table (entity_type='ritual_tool')
    how_to_use TEXT,
    consecration_methods TEXT,
    charging_methods TEXT,
    
    -- Magical Properties
    -- NOTE: Magical properties linked via entity_intentions junction table (entity_type='ritual_tool')
    purposes TEXT[], -- e.g., ['directing energy', 'casting circle', 'divination']
    
    -- Materials & Creation
    traditional_materials TEXT[], -- e.g., ['wood', 'metal', 'crystal']
    how_to_make TEXT,
    where_to_acquire TEXT,
    
    -- Care & Maintenance
    cleansing_methods TEXT[],
    storage_recommendations TEXT,
    
    -- Associations
    -- NOTE: Deity associations linked via entity_deities junction table (entity_type='ritual_tool')
    -- NOTE: Zodiac associations linked via entity_zodiac_signs junction table (entity_type='ritual_tool')
    -- NOTE: Sabbat associations linked via entity_ritual_tools junction table (entity_type='sabbat', ritual_tool_id=this)
    
    -- Metadata
    is_verified BOOLEAN DEFAULT FALSE,
    created_by UUID REFERENCES users(id) ON DELETE SET NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP
);

-- Media: Use entity_media table with entity_type='ritual_tool'
-- Categories: Use entity_categories table with entity_type='ritual_tool'
-- Tags: Use entity_tags table with entity_type='ritual_tool'

CREATE INDEX idx_ritual_tools_slug ON ritual_tools(slug);
CREATE INDEX idx_ritual_tools_category ON ritual_tools(tool_category);

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

