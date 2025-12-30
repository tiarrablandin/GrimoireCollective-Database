-- =============================================================================
-- GRIMOIRE COLLECTIVE - ELEMENTS DATA
-- =============================================================================
-- Purpose: The five elements (Air, Fire, Water, Earth, Spirit) with properties
-- Dependencies: Requires 02-schema.sql (elements table definition)
-- =============================================================================

INSERT INTO elements (name, slug, element_type, direction, season, time_of_day, qualities, energy_type, polarity, colors, zodiac_signs, planets, tarot_suit, magical_properties, ritual_uses, invocation_methods, symbols, tools, description) VALUES

    -- Classical Elements
    ('Air', 'air', 'classical', 'East', 'Spring', 'Dawn',
     ARRAY['hot', 'moist', 'light', 'active'],
     'active', 'masculine',
     ARRAY['yellow', 'white', 'pale blue', 'lavender'],
     ARRAY['Gemini', 'Libra', 'Aquarius'],
     ARRAY['Mercury', 'Venus', 'Uranus'],
     'Swords',
     ARRAY['intellect', 'communication', 'travel', 'knowledge', 'new beginnings', 'clarity', 'freedom'],
     'Invoke for mental clarity, communication spells, divination, travel magic, new projects, learning, breaking bad habits, dispelling negativity.',
     'Burn incense, use feathers, ring bells, whistle, breathe deeply, visualize wind, open windows, work outdoors on windy days.',
     ARRAY['upward triangle', 'feather', 'birds', 'clouds', 'wind symbols'],
     ARRAY['athame', 'sword', 'wand (some traditions)', 'incense', 'feathers', 'bells'],
     'Air is the element of the mind, intellect, and communication. It represents thoughts, ideas, knowledge, and the breath of life. Air is associated with new beginnings, dawn, and spring. It governs all mental processes, logic, and reason.'),

    ('Fire', 'fire', 'classical', 'South', 'Summer', 'Noon',
     ARRAY['hot', 'dry', 'light', 'active'],
     'active', 'masculine',
     ARRAY['red', 'orange', 'gold', 'yellow'],
     ARRAY['Aries', 'Leo', 'Sagittarius'],
     ARRAY['Sun', 'Mars', 'Jupiter'],
     'Wands',
     ARRAY['passion', 'energy', 'transformation', 'courage', 'strength', 'willpower', 'purification'],
     'Invoke for courage, passion, transformation, energy work, purification, protection, banishing, destroying bad habits, sex magic, success spells.',
     'Light candles, burn herbs, use bonfire or hearth fire, visualize flames, work in sunlight, use solar energy, dance energetically.',
     ARRAY['upward triangle', 'flame', 'sun', 'lightning', 'salamander'],
     ARRAY['wand', 'athame (some traditions)', 'candles', 'cauldron', 'censer'],
     'Fire is the element of transformation, passion, and willpower. It represents energy, courage, desire, and the spark of life. Fire is associated with summer and noon sun. It governs transformation, destruction that leads to rebirth, and all active energies.'),

    ('Water', 'water', 'classical', 'West', 'Autumn', 'Dusk',
     ARRAY['cold', 'moist', 'heavy', 'passive'],
     'passive', 'feminine',
     ARRAY['blue', 'turquoise', 'silver', 'sea green', 'purple'],
     ARRAY['Cancer', 'Scorpio', 'Pisces'],
     ARRAY['Moon', 'Venus', 'Neptune'],
     'Cups',
     ARRAY['emotion', 'intuition', 'love', 'healing', 'purification', 'dreams', 'psychic abilities'],
     'Invoke for emotional healing, love spells, psychic work, dream magic, cleansing, intuition, scrying, fertility, friendship, beauty magic.',
     'Use water in bowl or chalice, bathe ritually, work near ocean/river/lake, collect rain/dew, scry in water, brew potions, moon water.',
     ARRAY['downward triangle', 'waves', 'chalice', 'crescent moon', 'fish'],
     ARRAY['chalice', 'cauldron', 'bowl', 'shells', 'mirrors'],
     'Water is the element of emotion, intuition, and the subconscious. It represents feelings, love, healing, and the flow of life. Water is associated with autumn and twilight. It governs all emotional processes, psychic abilities, and the realm of dreams.'),

    ('Earth', 'earth', 'classical', 'North', 'Winter', 'Midnight',
     ARRAY['cold', 'dry', 'heavy', 'passive'],
     'passive', 'feminine',
     ARRAY['green', 'brown', 'black', 'gold', 'russet'],
     ARRAY['Taurus', 'Virgo', 'Capricorn'],
     ARRAY['Venus', 'Saturn'],
     'Pentacles',
     ARRAY['grounding', 'stability', 'prosperity', 'growth', 'fertility', 'manifestation', 'abundance'],
     'Invoke for prosperity, grounding, stability, growth, manifestation, fertility, employment, money magic, home/garden blessings, practical matters.',
     'Use salt, stones, crystals, herbs, bury objects, work in garden, walk barefoot, use plant materials, connect with trees, use pottery.',
     ARRAY['downward triangle with line', 'square', 'cube', 'mountain', 'trees'],
     ARRAY['pentacle', 'salt', 'stones', 'crystals', 'plants', 'coins'],
     'Earth is the element of stability, grounding, and material reality. It represents the physical body, prosperity, growth, and fertility. Earth is associated with winter and midnight. It governs all material matters, physical manifestation, and connection to nature.'),

    -- Spirit/Aether
    ('Spirit', 'spirit', 'spirit', 'Center', 'All', 'All',
     ARRAY['divine', 'transcendent', 'unifying', 'eternal'],
     'balanced', 'neutral',
     ARRAY['white', 'violet', 'rainbow', 'gold', 'silver'],
     ARRAY['All signs'],
     ARRAY['All planets', 'Universe'],
     'Major Arcana',
     ARRAY['divinity', 'transcendence', 'unity', 'akasha', 'higher consciousness', 'enlightenment', 'source'],
     'Invoke for spiritual work, divine connection, transcendence, unity consciousness, working with deities, higher self connection, enlightenment.',
     'Meditation, prayer, silence, visualization of light, connection to divine source, work with all elements together, ceremonial magic.',
     ARRAY['circle', 'wheel', 'spiral', 'pentagram point', 'infinity'],
     ARRAY['all tools unified', 'prayer beads', 'meditation cushion', 'altar itself'],
     'Spirit (or Aether/Akasha) is the fifth element that unites and transcends the four classical elements. It represents divine consciousness, the spark of life in all things, and the connection between physical and spiritual realms. Spirit is the point at the top of the pentagram.');
