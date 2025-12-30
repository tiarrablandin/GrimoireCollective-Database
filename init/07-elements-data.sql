-- =============================================================================
-- GRIMOIRE COLLECTIVE - ELEMENTS DATA
-- =============================================================================
-- Purpose: The five elements (Air, Fire, Water, Earth, Spirit) with properties
-- Dependencies: Requires 02-schema.sql (elements table definition)
-- 
-- NOTE: The following data is now linked through junction tables:
-- - zodiac_signs → Link via zodiac_signs table (create element_id FK or use entity relationship)
-- - planets → Link via planets table when created
-- - tarot suits → Link via entity_elements junction to tarot_cards
-- - magical_properties → Link via entity_intentions junction table
-- - tools → Link via entity_ritual_tools junction table
-- =============================================================================

INSERT INTO elements (name, slug, direction, season, time_of_day, qualities, energy_type, polarity, colors, symbols, description, ritual_uses, invocation_methods) VALUES

    -- Classical Elements
    ('Air', 'air', 'East', 'Spring', 'Dawn',
     ARRAY['hot', 'moist', 'light', 'active'],
     'active', 'masculine',
     ARRAY['yellow', 'white', 'pale blue', 'lavender'],
     ARRAY['upward triangle', 'feather', 'birds', 'clouds', 'wind symbols'],
     'Air is the element of the mind, intellect, and communication. It represents thoughts, ideas, knowledge, and the breath of life. Air is associated with new beginnings, dawn, and spring. It governs all mental processes, logic, and reason.',
     'Invoke for mental clarity, communication spells, divination, travel magic, new projects, learning, breaking bad habits, dispelling negativity.',
     'Burn incense, use feathers, ring bells, whistle, breathe deeply, visualize wind, open windows, work outdoors on windy days.'),

    ('Fire', 'fire', 'South', 'Summer', 'Noon',
     ARRAY['hot', 'dry', 'light', 'active'],
     'active', 'masculine',
     ARRAY['red', 'orange', 'gold', 'yellow'],
     ARRAY['upward triangle', 'flame', 'sun', 'lightning', 'salamander'],
     'Fire is the element of transformation, passion, and willpower. It represents energy, courage, desire, and the spark of life. Fire is associated with summer and noon sun. It governs transformation, destruction that leads to rebirth, and all active energies.',
     'Invoke for courage, passion, transformation, energy work, purification, protection, banishing, destroying bad habits, sex magic, success spells.',
     'Light candles, burn herbs, use bonfire or hearth fire, visualize flames, work in sunlight, use solar energy, dance energetically.'),

    ('Water', 'water', 'West', 'Autumn', 'Dusk',
     ARRAY['cold', 'moist', 'heavy', 'passive'],
     'passive', 'feminine',
     ARRAY['blue', 'turquoise', 'silver', 'sea green', 'purple'],
     ARRAY['downward triangle', 'waves', 'chalice', 'crescent moon', 'fish'],
     'Water is the element of emotion, intuition, and the subconscious. It represents feelings, love, healing, and the flow of life. Water is associated with autumn and twilight. It governs all emotional processes, psychic abilities, and the realm of dreams.',
     'Invoke for emotional healing, love spells, psychic work, dream magic, cleansing, intuition, scrying, fertility, friendship, beauty magic.',
     'Use water in bowl or chalice, bathe ritually, work near ocean/river/lake, collect rain/dew, scry in water, brew potions, moon water.'),

    ('Earth', 'earth', 'North', 'Winter', 'Midnight',
     ARRAY['cold', 'dry', 'heavy', 'passive'],
     'passive', 'feminine',
     ARRAY['green', 'brown', 'black', 'gold', 'russet'],
     ARRAY['downward triangle with line', 'square', 'cube', 'mountain', 'trees'],
     'Earth is the element of stability, grounding, and material reality. It represents the physical body, prosperity, growth, and fertility. Earth is associated with winter and midnight. It governs all material matters, physical manifestation, and connection to nature.',
     'Invoke for prosperity, grounding, stability, growth, manifestation, fertility, employment, money magic, home/garden blessings, practical matters.',
     'Use salt, stones, crystals, herbs, bury objects, work in garden, walk barefoot, use plant materials, connect with trees, use pottery.'),

    -- Spirit/Aether
    ('Spirit', 'spirit', 'Center', 'All', 'All',
     ARRAY['divine', 'transcendent', 'unifying', 'eternal'],
     'balanced', 'neutral',
     ARRAY['white', 'violet', 'rainbow', 'gold', 'silver'],
     ARRAY['circle', 'wheel', 'spiral', 'pentagram point', 'infinity'],
     'Spirit (or Aether/Akasha) is the fifth element that unites and transcends the four classical elements. It represents divine consciousness, the spark of life in all things, and the connection between physical and spiritual realms. Spirit is the point at the top of the pentagram.',
     'Invoke for spiritual work, divine connection, transcendence, unity consciousness, working with deities, higher self connection, enlightenment.',
     'Meditation, prayer, silence, visualization of light, connection to divine source, work with all elements together, ceremonial magic.');
