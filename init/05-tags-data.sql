-- =============================================================================
-- GRIMOIRE COLLECTIVE - TAGS DATA
-- =============================================================================
-- Purpose: Content tags for detailed categorization and filtering
-- Dependencies: Requires 02-schema.sql (tags table definition)
-- =============================================================================

INSERT INTO tags (name, slug, description) VALUES
    ('beginner-friendly', 'beginner-friendly', 'Suitable for beginners'),
    ('advanced', 'advanced', 'For experienced practitioners'),
    ('quick-spell', 'quick-spell', 'Can be done quickly'),
    ('full-moon', 'full-moon', 'Best performed during full moon'),
    ('new-moon', 'new-moon', 'Best performed during new moon'),
    ('candle-magic', 'candle-magic', 'Involves candle work'),
    ('meditation', 'meditation', 'Meditative practice'),
    ('visualization', 'visualization', 'Uses visualization techniques'),
    ('tarot', 'tarot', 'Related to tarot cards'),
    ('runes', 'runes', 'Related to rune work'),
    ('pendulum', 'pendulum', 'Uses pendulum divination'),
    ('scrying', 'scrying', 'Scrying techniques'),
    ('solitary', 'solitary', 'Can be done alone'),
    ('group', 'group', 'Best done in a group'),
    ('outdoor', 'outdoor', 'Performed outdoors'),
    ('indoor', 'indoor', 'Performed indoors'),
    ('seasonal', 'seasonal', 'Seasonal practice'),
    ('daily-practice', 'daily-practice', 'Good for daily practice'),
    ('sabbat', 'sabbat', 'Related to sabbat celebrations'),
    ('elemental', 'elemental', 'Works with elements');
