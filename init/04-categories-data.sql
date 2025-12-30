-- =============================================================================
-- GRIMOIRE COLLECTIVE - CATEGORIES DATA
-- =============================================================================
-- Purpose: Content categories for organizing grimoires and magical content
-- Dependencies: Requires 02-schema.sql (categories table definition)
-- =============================================================================

-- NOTE: Categories are pure data - no UI concerns (icons, colors) stored here.
-- Frontend should map category slugs to appropriate icons/colors in its own config.
INSERT INTO categories (name, slug, description) VALUES
    ('Spellwork', 'spellwork', 'All types of magical spells'),
    ('Divination', 'divination', 'Fortune telling and insight practices'),
    ('Herbalism', 'herbalism', 'Magical and medicinal herbs'),
    ('Crystals & Stones', 'crystals-stones', 'Crystal healing and properties'),
    ('Rituals & Ceremonies', 'rituals-ceremonies', 'Ceremonial practices'),
    ('Calendar & Celebrations', 'calendar-celebrations', 'Wheel of the Year, Sabbats, and Esbats'),
    ('Deities & Spirits', 'deities-spirits', 'Working with divine entities'),
    ('Astrology', 'astrology', 'Celestial influences and horoscopes'),
    ('Moon Magic', 'moon-magic', 'Lunar phases and moon rituals'),
    ('Kitchen Witchery', 'kitchen-witchery', 'Culinary magic and recipes'),
    ('Protection Magic', 'protection-magic', 'Warding and protective spells'),
    ('Love & Relationships', 'love-relationships', 'Romance and connection magic'),
    ('Prosperity & Abundance', 'prosperity-abundance', 'Wealth and success magic'),
    ('Healing', 'healing', 'Physical and spiritual healing practices'),
    ('Shadow Work', 'shadow-work', 'Inner work and transformation');
