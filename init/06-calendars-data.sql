-- =============================================================================
-- GRIMOIRE COLLECTIVE - CALENDARS DATA
-- =============================================================================
-- Purpose: Sabbats, Esbats, and magical celebration dates
-- Dependencies: Requires 02-schema.sql (calendar table definition)
-- =============================================================================

INSERT INTO calendar (name, slug, celebration_type, date_type, description, colors, symbols) VALUES
    -- The 8 Sabbats (Wheel of the Year)
    ('Samhain', 'samhain', 'sabbat', 'fixed', 
     'Celtic new year and festival of the dead. The veil between worlds is thinnest.',
     ARRAY['black', 'orange', 'purple', 'silver'],
     ARRAY['pumpkins', 'skulls', 'candles', 'apples', 'photographs']),
    
    ('Yule', 'yule', 'sabbat', 'solar',
     'Winter Solstice. Celebration of the return of the sun.',
     ARRAY['red', 'green', 'gold', 'white'],
     ARRAY['evergreens', 'candles', 'yule log', 'holly', 'mistletoe']),
    
    ('Imbolc', 'imbolc', 'sabbat', 'fixed',
     'Festival of the hearth and home. Honoring Brigid.',
     ARRAY['white', 'green', 'light blue'],
     ARRAY['candles', 'snowdrops', 'brigid cross', 'seeds']),
    
    ('Ostara', 'ostara', 'sabbat', 'solar',
     'Spring Equinox. Balance of light and dark.',
     ARRAY['pastel colors', 'green', 'yellow', 'pink'],
     ARRAY['eggs', 'rabbits', 'flowers', 'seeds']),
    
    ('Beltane', 'beltane', 'sabbat', 'fixed',
     'May Day celebration of fertility and union.',
     ARRAY['green', 'red', 'white', 'pink'],
     ARRAY['maypole', 'flowers', 'fire', 'ribbons']),
    
    ('Litha', 'litha', 'sabbat', 'solar',
     'Summer Solstice. Longest day of the year.',
     ARRAY['gold', 'yellow', 'orange', 'green'],
     ARRAY['sun wheels', 'flowers', 'oak', 'herbs']),
    
    ('Lammas', 'lammas', 'sabbat', 'fixed',
     'First harvest festival. Grain harvest.',
     ARRAY['gold', 'orange', 'yellow', 'brown'],
     ARRAY['wheat', 'corn', 'bread', 'scythe']),
    
    ('Mabon', 'mabon', 'sabbat', 'solar',
     'Autumn Equinox. Second harvest.',
     ARRAY['red', 'orange', 'brown', 'gold'],
     ARRAY['apples', 'vines', 'cornucopia', 'leaves']),
    
    -- Esbats (Monthly Lunar Celebrations)
    ('Full Moon Esbat', 'full-moon-esbat', 'esbat', 'lunar',
     'Monthly celebration of the Full Moon. Time for manifestation and gratitude.',
     ARRAY['silver', 'white', 'blue'],
     ARRAY['moon', 'water', 'crystals', 'candles']),
    
    ('New Moon Esbat', 'new-moon-esbat', 'esbat', 'lunar',
     'Monthly celebration of the New Moon. Time for new beginnings and intention setting.',
     ARRAY['black', 'dark blue', 'silver'],
     ARRAY['moon', 'seeds', 'journal', 'candles']);
