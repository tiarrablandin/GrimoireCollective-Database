-- =============================================================================
-- GRIMOIRE COLLECTIVE - SEED DATA
-- =============================================================================
-- Purpose: Sample data for development and testing
-- Created: 2025-12-28
-- =============================================================================

-- =============================================================================
-- SAMPLE PERMISSIONS
-- =============================================================================

INSERT INTO permissions (name, description, resource, action) VALUES
    ('manage_users', 'Manage all users', 'users', 'manage'),
    ('delete_any_grimoire', 'Delete any grimoire', 'grimoires', 'delete'),
    ('edit_any_grimoire', 'Edit any grimoire', 'grimoires', 'edit'),
    ('manage_categories', 'Manage categories', 'categories', 'manage'),
    ('manage_tags', 'Manage tags', 'tags', 'manage'),
    ('manage_content_types', 'Manage content types', 'content_types', 'manage'),
    ('view_analytics', 'View analytics dashboard', 'analytics', 'view'),
    ('manage_subscriptions', 'Manage subscription tiers', 'subscriptions', 'manage'),
    ('moderate_comments', 'Moderate comments', 'comments', 'moderate'),
    ('feature_grimoires', 'Feature grimoires on homepage', 'grimoires', 'feature'),
    ('create_grimoire', 'Create grimoire', 'grimoires', 'create'),
    ('edit_own_grimoire', 'Edit own grimoire', 'grimoires', 'edit_own'),
    ('delete_own_grimoire', 'Delete own grimoire', 'grimoires', 'delete_own'),
    ('comment', 'Comment on grimoires', 'comments', 'create'),
    ('like', 'Like grimoires', 'grimoires', 'like'),
    ('favorite', 'Favorite grimoires', 'grimoires', 'favorite');

-- =============================================================================
-- ROLE PERMISSIONS ASSIGNMENTS
-- =============================================================================

-- Super Admin gets all permissions
INSERT INTO role_permissions (role_id, permission_id)
SELECT 
    (SELECT id FROM roles WHERE name = 'super_admin'),
    id
FROM permissions;

-- Admin gets most permissions except user management
INSERT INTO role_permissions (role_id, permission_id)
SELECT 
    (SELECT id FROM roles WHERE name = 'admin'),
    id
FROM permissions
WHERE name IN (
    'delete_any_grimoire',
    'edit_any_grimoire',
    'manage_categories',
    'manage_tags',
    'view_analytics',
    'moderate_comments',
    'feature_grimoires',
    'create_grimoire',
    'comment',
    'like',
    'favorite'
);

-- Regular users get basic permissions
INSERT INTO role_permissions (role_id, permission_id)
SELECT 
    (SELECT id FROM roles WHERE name = 'user'),
    id
FROM permissions
WHERE name IN (
    'create_grimoire',
    'edit_own_grimoire',
    'delete_own_grimoire',
    'comment',
    'like',
    'favorite'
);

-- =============================================================================
-- SAMPLE CATEGORIES
-- =============================================================================

INSERT INTO categories (name, slug, description, icon, color) VALUES
    ('Spellwork', 'spellwork', 'All types of magical spells', 'sparkles', '#9333EA'),
    ('Divination', 'divination', 'Fortune telling and insight practices', 'crystal-ball', '#EC4899'),
    ('Herbalism', 'herbalism', 'Magical and medicinal herbs', 'leaf', '#10B981'),
    ('Crystals & Stones', 'crystals-stones', 'Crystal healing and properties', 'gem', '#3B82F6'),
    ('Rituals & Ceremonies', 'rituals-ceremonies', 'Ceremonial practices', 'candles', '#F59E0B'),
    ('Calendar & Celebrations', 'calendar-celebrations', 'Wheel of the Year, Sabbats, and Esbats', 'calendar', '#EF4444'),
    ('Deities & Spirits', 'deities-spirits', 'Working with divine entities', 'crown', '#8B5CF6'),
    ('Astrology', 'astrology', 'Celestial influences and horoscopes', 'stars', '#06B6D4'),
    ('Moon Magic', 'moon-magic', 'Lunar phases and moon rituals', 'moon', '#6366F1'),
    ('Kitchen Witchery', 'kitchen-witchery', 'Culinary magic and recipes', 'cooking', '#F97316'),
    ('Protection Magic', 'protection-magic', 'Warding and protective spells', 'shield', '#14B8A6'),
    ('Love & Relationships', 'love-relationships', 'Romance and connection magic', 'heart', '#F43F5E'),
    ('Prosperity & Abundance', 'prosperity-abundance', 'Wealth and success magic', 'coins', '#84CC16'),
    ('Healing', 'healing', 'Physical and spiritual healing practices', 'medical', '#22C55E'),
    ('Shadow Work', 'shadow-work', 'Inner work and transformation', 'shadow', '#6B7280');

-- =============================================================================
-- SAMPLE TAGS
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

-- =============================================================================
-- SAMPLE CALENDAR EVENTS (Sabbats & Esbats)
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

-- =============================================================================
-- ELEMENTS (Classical + Spirit)
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

-- =============================================================================
-- MAGICAL INTENTIONS
-- =============================================================================

INSERT INTO intentions (name, slug, description, category, keywords, usage_guide, related_elements, moon_phases, icon, color) VALUES
    -- Protection & Safety
    ('Protection', 'protection', 'Shielding from negative energy, harm, or unwanted influences', 'protection',
     ARRAY['shield', 'ward', 'defense', 'safety', 'boundaries'],
     'Use for creating protective barriers, warding spaces, deflecting negativity, and maintaining energetic boundaries. Works well with visualization and intention-setting.',
     ARRAY['Fire', 'Earth'],
     ARRAY['Full Moon', 'Waning Moon'],
     'shield', '#14B8A6'),
    
    ('Banishing', 'banishing', 'Removing negative energy, habits, or influences from your life', 'protection',
     ARRAY['removal', 'clearing', 'release', 'expel'],
     'Work during waning moon phases to release what no longer serves. Combine with cleansing for maximum effect.',
     ARRAY['Fire', 'Air'],
     ARRAY['Waning Gibbous', 'Last Quarter', 'Waning Crescent'],
     'x-circle', '#EF4444'),
    
    ('Cleansing', 'cleansing', 'Purifying energy, spaces, or objects', 'protection',
     ARRAY['purification', 'clearing', 'sanctification', 'renewal'],
     'Essential before and after magical work. Use smoke, water, sound, or visualization to cleanse spaces and tools.',
     ARRAY['Air', 'Water', 'Fire'],
     ARRAY['New Moon', 'Waning Crescent'],
     'sparkles', '#06B6D4'),
    
    -- Love & Relationships
    ('Love', 'love', 'Attracting or strengthening romantic love', 'relationships',
     ARRAY['romance', 'passion', 'attraction', 'partnership'],
     'Focus on self-love first. For attracting love, work during waxing moon. For strengthening existing relationships, use full moon energy.',
     ARRAY['Water', 'Fire'],
     ARRAY['Waxing Moon', 'Full Moon', 'Friday'],
     'heart', '#F43F5E'),
    
    ('Self-Love', 'self-love', 'Cultivating love, acceptance, and compassion for yourself', 'relationships',
     ARRAY['self-care', 'acceptance', 'confidence', 'worth'],
     'The foundation of all other love work. Practice daily affirmations, mirror work, and gentle self-care rituals.',
     ARRAY['Water', 'Spirit'],
     ARRAY['New Moon', 'Full Moon'],
     'heart-circle', '#EC4899'),
    
    ('Friendship', 'friendship', 'Attracting or strengthening platonic relationships', 'relationships',
     ARRAY['companionship', 'connection', 'community', 'bonds'],
     'Focus on authentic connection and mutual support. Good for building community and strengthening existing friendships.',
     ARRAY['Air', 'Fire'],
     ARRAY['Waxing Moon', 'Full Moon'],
     'users', '#F59E0B'),
    
    -- Prosperity & Success
    ('Prosperity', 'prosperity', 'Attracting wealth, abundance, and financial success', 'abundance',
     ARRAY['wealth', 'money', 'riches', 'financial'],
     'Combine with practical action. Work during waxing moon to draw prosperity in. Focus on gratitude for current abundance.',
     ARRAY['Earth', 'Fire'],
     ARRAY['Waxing Moon', 'Full Moon', 'Thursday'],
     'coins', '#84CC16'),
    
    ('Abundance', 'abundance', 'Attracting plenty in all areas of life', 'abundance',
     ARRAY['plenty', 'overflow', 'blessings', 'wealth'],
     'Broader than just money - includes love, health, opportunities, joy. Cultivate abundance mindset through gratitude.',
     ARRAY['Earth', 'Water'],
     ARRAY['Waxing Moon', 'Full Moon'],
     'gift', '#10B981'),
    
    ('Success', 'success', 'Achieving goals and ambitions', 'abundance',
     ARRAY['achievement', 'victory', 'accomplishment', 'goals'],
     'Set clear intentions and back magic with action. Use for job interviews, tests, competitions, or personal goals.',
     ARRAY['Fire', 'Air'],
     ARRAY['Waxing Moon', 'Full Moon', 'Sunday'],
     'trophy', '#F59E0B'),
    
    ('Employment', 'employment', 'Finding or maintaining work', 'abundance',
     ARRAY['job', 'career', 'work', 'vocation'],
     'Prepare resume and applications first, then enhance with magical work. Focus on right opportunity, not just any job.',
     ARRAY['Earth', 'Air'],
     ARRAY['Waxing Moon', 'New Moon'],
     'briefcase', '#6366F1'),
    
    -- Healing & Health
    ('Healing', 'healing', 'Physical, emotional, or spiritual healing', 'healing',
     ARRAY['recovery', 'wellness', 'health', 'wholeness'],
     'Never replace medical care with magic. Use to support healing process and maintain positive mindset. Consult healthcare providers.',
     ARRAY['Water', 'Earth'],
     ARRAY['Waxing Moon', 'Full Moon'],
     'medical', '#22C55E'),
    
    ('Peace', 'peace', 'Bringing calm, tranquility, and inner peace', 'healing',
     ARRAY['calm', 'tranquility', 'serenity', 'stillness'],
     'Essential for mental health and spiritual growth. Practice meditation and create peaceful spaces.',
     ARRAY['Water', 'Air'],
     ARRAY['Waning Moon', 'Full Moon'],
     'dove', '#3B82F6'),
    
    ('Balance', 'balance', 'Achieving harmony and equilibrium', 'healing',
     ARRAY['harmony', 'equilibrium', 'stability', 'centeredness'],
     'Work with all elements equally. Focus on balancing aspects of life - work/rest, giving/receiving, physical/spiritual.',
     ARRAY['Spirit', 'Earth'],
     ARRAY['Full Moon', 'Equinoxes'],
     'scales', '#8B5CF6'),
    
    ('Sleep', 'sleep', 'Promoting restful sleep and dreams', 'healing',
     ARRAY['rest', 'dreams', 'insomnia', 'relaxation'],
     'Create bedtime rituals, use calming herbs, keep sleep space peaceful. Good for dream work and astral travel.',
     ARRAY['Water', 'Spirit'],
     ARRAY['Waning Moon', 'Dark Moon'],
     'moon', '#6366F1'),
    
    -- Spiritual & Psychic
    ('Intuition', 'intuition', 'Enhancing psychic abilities and inner knowing', 'spiritual',
     ARRAY['psychic', 'inner wisdom', 'sixth sense', 'gut feeling'],
     'Trust your first impressions. Practice daily with divination tools. Keep dream journal. Meditate regularly.',
     ARRAY['Water', 'Spirit'],
     ARRAY['Full Moon', 'Dark Moon'],
     'eye', '#8B5CF6'),
    
    ('Divination', 'divination', 'Seeking knowledge through magical means', 'spiritual',
     ARRAY['fortune telling', 'prophecy', 'scrying', 'oracle'],
     'Use tarot, runes, pendulum, or other tools. Full moon is most powerful. Clear and charge tools regularly.',
     ARRAY['Air', 'Water', 'Spirit'],
     ARRAY['Full Moon', 'Dark Moon'],
     'crystal-ball', '#6366F1'),
    
    ('Meditation', 'meditation', 'Deepening meditative practice and spiritual connection', 'spiritual',
     ARRAY['contemplation', 'mindfulness', 'spiritual practice'],
     'Daily practice is key. Create dedicated space. Start with just 5-10 minutes. Use tools that help you focus.',
     ARRAY['Spirit', 'Air'],
     ARRAY['All phases', 'especially Full Moon'],
     'om', '#8B5CF6'),
    
    ('Psychic Abilities', 'psychic-abilities', 'Developing extrasensory perception', 'spiritual',
     ARRAY['ESP', 'clairvoyance', 'telepathy', 'precognition'],
     'Practice exercises daily. Trust your abilities. Protect yourself before psychic work. Ground after sessions.',
     ARRAY['Water', 'Spirit', 'Air'],
     ARRAY['Full Moon', 'Dark Moon'],
     'third-eye', '#8B5CF6'),
    
    ('Spirit Communication', 'spirit-communication', 'Connecting with spirits, ancestors, or guides', 'spiritual',
     ARRAY['mediumship', 'channeling', 'ancestors', 'guides'],
     'Practice proper protection. Set clear boundaries. Honor ancestors. Work respectfully. Ground thoroughly after.',
     ARRAY['Spirit', 'Air'],
     ARRAY['Samhain', 'Dark Moon', 'Waning Moon'],
     'ghost', '#6B7280'),
    
    ('Astral Projection', 'astral-projection', 'Conscious out-of-body experiences', 'spiritual',
     ARRAY['astral travel', 'OBE', 'soul travel', 'journeying'],
     'Advanced practice. Ensure safety of physical body. Use protective measures. Start with guided meditations.',
     ARRAY['Air', 'Spirit'],
     ARRAY['Dark Moon', 'liminal times'],
     'plane', '#06B6D4'),
    
    -- Transformation & Growth
    ('Transformation', 'transformation', 'Major life changes and personal evolution', 'growth',
     ARRAY['change', 'rebirth', 'metamorphosis', 'evolution'],
     'Embrace change as natural. Release old patterns. Work during transitions like Samhain or personal birthdays.',
     ARRAY['Fire', 'Spirit'],
     ARRAY['Dark Moon', 'New Moon', 'Eclipse'],
     'butterfly', '#EC4899'),
    
    ('Growth', 'growth', 'Personal development and expansion', 'growth',
     ARRAY['development', 'learning', 'expansion', 'maturity'],
     'Set intentions for areas you want to develop. Combine magical work with practical learning and practice.',
     ARRAY['Air', 'Earth'],
     ARRAY['Waxing Moon', 'Spring'],
     'seedling', '#22C55E'),
    
    ('Wisdom', 'wisdom', 'Gaining knowledge and understanding', 'growth',
     ARRAY['knowledge', 'understanding', 'insight', 'enlightenment'],
     'Study, meditate, learn from elders. Combine book learning with experiential wisdom. Keep journals.',
     ARRAY['Air', 'Spirit'],
     ARRAY['Full Moon', 'Waning Moon'],
     'book', '#6366F1'),
    
    ('Courage', 'courage', 'Building bravery and facing fears', 'growth',
     ARRAY['bravery', 'strength', 'valor', 'boldness'],
     'Start small. Face fears gradually. Use before challenging situations. Combine with grounding for balance.',
     ARRAY['Fire', 'Earth'],
     ARRAY['Waxing Moon', 'Tuesday'],
     'fire', '#EF4444'),
    
    ('Confidence', 'confidence', 'Building self-assurance and self-esteem', 'growth',
     ARRAY['self-esteem', 'assurance', 'self-belief', 'empowerment'],
     'Practice affirmations. Work on solar plexus chakra. Stand in power poses. Celebrate small victories.',
     ARRAY['Fire', 'Sun'],
     ARRAY['Waxing Moon', 'Sunday'],
     'sun', '#F59E0B'),
    
    -- Creativity & Expression
    ('Creativity', 'creativity', 'Enhancing creative abilities and inspiration', 'expression',
     ARRAY['inspiration', 'artistry', 'innovation', 'imagination'],
     'Keep supplies ready. Create sacred creative space. Honor the muse. Regular practice is key.',
     ARRAY['Fire', 'Air'],
     ARRAY['Waxing Moon', 'Full Moon'],
     'palette', '#F59E0B'),
    
    ('Communication', 'communication', 'Improving expression and connection', 'expression',
     ARRAY['speech', 'expression', 'clarity', 'articulation'],
     'Work on throat chakra. Practice clear intention. Use before important conversations or presentations.',
     ARRAY['Air', 'Mercury'],
     ARRAY['Waxing Moon', 'Wednesday'],
     'message', '#06B6D4'),
    
    ('Inspiration', 'inspiration', 'Invoking creative and spiritual inspiration', 'expression',
     ARRAY['muse', 'divine inspiration', 'creativity', 'vision'],
     'Create space for inspiration to arrive. Don''t force it. Be open to messages from unexpected sources.',
     ARRAY['Air', 'Fire', 'Spirit'],
     ARRAY['Full Moon', 'dawn'],
     'lightbulb', '#F59E0B'),
    
    -- Miscellaneous
    ('Luck', 'luck', 'Attracting good fortune', 'abundance',
     ARRAY['fortune', 'serendipity', 'chance', 'blessing'],
     'Combine with gratitude and positive mindset. Use before gambling, competitions, or risky ventures.',
     ARRAY['Air', 'Jupiter'],
     ARRAY['Waxing Moon', 'Thursday'],
     'clover', '#22C55E'),
    
    ('Fertility', 'fertility', 'Encouraging fertility and new beginnings', 'abundance',
     ARRAY['conception', 'pregnancy', 'creation', 'new life'],
     'Can be literal (pregnancy) or symbolic (new projects). Honor the cycle of creation. Work with Earth energy.',
     ARRAY['Earth', 'Water'],
     ARRAY['Waxing Moon', 'Full Moon', 'Spring'],
     'egg', '#EC4899'),
    
    ('Beauty', 'beauty', 'Enhancing physical beauty and attractiveness', 'expression',
     ARRAY['glamour', 'attractiveness', 'charm', 'radiance'],
     'Inner beauty reflects outward. Combine with self-care. Focus on confidence and self-acceptance.',
     ARRAY['Water', 'Venus'],
     ARRAY['Waxing Moon', 'Friday'],
     'flower', '#EC4899'),
    
    ('Justice', 'justice', 'Seeking fairness and legal success', 'protection',
     ARRAY['legal', 'fairness', 'truth', 'court'],
     'Use for legal matters, court cases, or seeking truth. Combine with truth-speaking and clarity work.',
     ARRAY['Air', 'Fire'],
     ARRAY['Full Moon', 'Sunday'],
     'gavel', '#6366F1'),
    
    ('Binding', 'binding', 'Restricting harmful actions or people', 'protection',
     ARRAY['restriction', 'limitation', 'prevention', 'stop'],
     'Ethical consideration required. Use only to prevent harm. Consider consequences carefully. Not for manipulation.',
     ARRAY['Earth', 'Saturn'],
     ARRAY['Waning Moon', 'Dark Moon', 'Saturday'],
     'chain', '#6B7280'),
    
    ('Grounding', 'grounding', 'Connecting to earth energy and staying present', 'healing',
     ARRAY['centering', 'earthing', 'stability', 'presence'],
     'Essential after magical work. Walk barefoot, use stones, eat root vegetables. Return to physical awareness.',
     ARRAY['Earth'],
     ARRAY['All phases'],
     'anchor', '#78716C'),
    
    ('Energy', 'energy', 'Increasing vitality and life force', 'healing',
     ARRAY['vitality', 'stamina', 'vigor', 'life force'],
     'Use for physical energy and magical power. Combine with proper rest, nutrition, and exercise.',
     ARRAY['Fire', 'Sun'],
     ARRAY['Waxing Moon', 'Noon', 'Sunday'],
     'lightning', '#F59E0B'),
    
    ('Focus', 'focus', 'Improving concentration and mental clarity', 'growth',
     ARRAY['concentration', 'attention', 'clarity', 'mindfulness'],
     'Use before study, work, or ritual. Eliminate distractions. Work with Air element for mental clarity.',
     ARRAY['Air', 'Mercury'],
     ARRAY['Waxing Moon', 'Wednesday'],
     'target', '#06B6D4'),
    
    ('Clarity', 'clarity', 'Gaining clear vision and understanding', 'growth',
     ARRAY['clear vision', 'understanding', 'mental clarity', 'truth', 'insight'],
     'Use when seeking truth or understanding. Helps see through illusions and confusion. Excellent for decision-making.',
     ARRAY['Air', 'Spirit'],
     ARRAY['Full Moon', 'New Moon'],
     'eye-open', '#3B82F6'),
    
    ('Dreams', 'dreams', 'Enhancing dream recall and lucid dreaming', 'spiritual',
     ARRAY['lucid dreaming', 'dream recall', 'oneiromancy', 'sleep magic'],
     'Keep dream journal by bed. Set intention before sleep. Use herbs under pillow. Record dreams immediately upon waking.',
     ARRAY['Water', 'Moon'],
     ARRAY['Full Moon', 'Waning Moon'],
     'cloud', '#8B5CF6'),
    
    ('Travel', 'travel', 'Safe and successful journeys', 'protection',
     ARRAY['journey', 'safe passage', 'adventure', 'protection'],
     'Use before trips for safety and smooth travel. Carry protective items. Set intentions for good experiences.',
     ARRAY['Air', 'Mercury'],
     ARRAY['Waxing Moon', 'Wednesday'],
     'compass', '#06B6D4'),
    
    ('Home', 'home', 'Blessing and protecting the home', 'protection',
     ARRAY['household', 'domestic', 'hearth', 'sanctuary'],
     'Create sacred space. Regular cleansing. Set wards. Make home a sanctuary. Use threshold magic.',
     ARRAY['Earth', 'Fire'],
     ARRAY['New Moon', 'Full Moon'],
     'home', '#78716C'),
    
    ('Hex Breaking', 'hex-breaking', 'Removing curses or negative magic', 'protection',
     ARRAY['curse removal', 'jinx breaking', 'uncrossing', 'reversal'],
     'Serious work requiring protection. Cleanse thoroughly before and after. May need repeated workings.',
     ARRAY['Fire', 'Spirit'],
     ARRAY['Waning Moon', 'Dark Moon'],
     'shield-cross', '#EF4444'),
    
    -- Sabbat & Life Cycle Themes
    ('Death', 'death', 'Honoring endings, the cycle of life, and mortality', 'spiritual',
     ARRAY['endings', 'mortality', 'transition', 'afterlife', 'letting go'],
     'Honor the natural cycle of life and death. Work during Samhain. Face mortality with reverence. Release what must end.',
     ARRAY['Spirit', 'Earth'],
     ARRAY['Waning Moon', 'Dark Moon', 'Samhain'],
     'skull', '#6B7280'),
    
    ('Ancestors', 'ancestors', 'Honoring and connecting with ancestral spirits', 'spiritual',
     ARRAY['lineage', 'family spirits', 'ancestral veneration', 'heritage'],
     'Build ancestor altar. Leave offerings. Learn family history. Honor those who came before. Work especially during Samhain.',
     ARRAY['Spirit', 'Earth'],
     ARRAY['Samhain', 'Dark Moon'],
     'tree', '#78716C'),
    
    ('Reflection', 'reflection', 'Looking inward and contemplating life', 'spiritual',
     ARRAY['introspection', 'contemplation', 'self-examination', 'review'],
     'Set aside quiet time. Journal. Review past actions and choices. Prepare for new cycles. Work during waning moon.',
     ARRAY['Water', 'Spirit'],
     ARRAY['Waning Moon', 'Dark Moon'],
     'mirror', '#6366F1'),
    
    ('New Beginnings', 'new-beginnings', 'Starting fresh and embracing new starts', 'growth',
     ARRAY['fresh start', 'new chapter', 'initiation', 'dawn'],
     'Release the old to make space for the new. Set intentions. Work during new moon or Imbolc. Plant seeds for the future.',
     ARRAY['Air', 'Fire'],
     ARRAY['New Moon', 'Imbolc'],
     'sunrise', '#F59E0B'),
    
    ('Rebirth', 'rebirth', 'Renewal and starting anew after endings', 'growth',
     ARRAY['renewal', 'resurrection', 'revival', 'second chance'],
     'Work after major endings or during Yule/Ostara. Focus on emerging stronger. Phoenix energy.',
     ARRAY['Fire', 'Spirit'],
     ARRAY['Yule', 'Ostara', 'New Moon'],
     'phoenix', '#EF4444'),
    
    ('Purification', 'purification', 'Deep cleansing and making pure', 'protection',
     ARRAY['cleansing', 'sanctification', 'purging', 'baptism'],
     'Stronger than regular cleansing. Work during Imbolc. Use water, fire, or smoke. Prepare for sacred work.',
     ARRAY['Water', 'Fire'],
     ARRAY['Imbolc', 'New Moon'],
     'droplet', '#06B6D4'),
    
    ('Renewal', 'renewal', 'Refreshing and revitalizing energy', 'healing',
     ARRAY['refresh', 'revitalize', 'restore', 'rejuvenate'],
     'Rest and restore. Take breaks. Reconnect with source. Work during spring or after intense periods.',
     ARRAY['Water', 'Earth'],
     ARRAY['Ostara', 'Waxing Moon'],
     'refresh', '#22C55E'),
    
    ('Passion', 'passion', 'Igniting intense emotion and desire', 'relationships',
     ARRAY['desire', 'fire', 'intensity', 'enthusiasm'],
     'Work during Beltane or waxing moon. Use fire element. Be clear about intentions. Ethical considerations apply.',
     ARRAY['Fire'],
     ARRAY['Beltane', 'Full Moon'],
     'flame', '#EF4444'),
    
    ('Vitality', 'vitality', 'Life force and vibrant energy', 'healing',
     ARRAY['life force', 'vigor', 'zest', 'aliveness'],
     'Cultivate energy and enthusiasm for life. Work during summer or waxing moon. Connect with sun energy.',
     ARRAY['Fire', 'Sun'],
     ARRAY['Litha', 'Waxing Moon'],
     'bolt', '#F59E0B'),
    
    ('Union', 'union', 'Bringing together and sacred joining', 'relationships',
     ARRAY['joining', 'handfasting', 'partnership', 'merger'],
     'Work for partnerships, handfasting, or bringing elements together. Beltane energy. Balance and harmony.',
     ARRAY['Water', 'Fire'],
     ARRAY['Beltane', 'Full Moon'],
     'infinity', '#EC4899'),
    
    ('Power', 'power', 'Personal power and magical energy', 'growth',
     ARRAY['strength', 'force', 'potency', 'authority'],
     'Claim your personal power. Work during full moon or Litha. Use solar energy. Stand in your truth.',
     ARRAY['Fire', 'Sun'],
     ARRAY['Full Moon', 'Litha', 'Noon'],
     'lightning-bolt', '#F59E0B'),
    
    ('Strength', 'strength', 'Inner fortitude and resilience', 'growth',
     ARRAY['fortitude', 'resilience', 'endurance', 'perseverance'],
     'Build inner strength. Face challenges. Work with Earth element. Develop staying power.',
     ARRAY['Earth', 'Fire'],
     ARRAY['Waxing Moon'],
     'dumbbell', '#78716C'),
    
    ('Harvest', 'harvest', 'Reaping rewards and gathering abundance', 'abundance',
     ARRAY['reaping', 'gathering', 'rewards', 'culmination'],
     'Celebrate achievements. Gather what you''ve sown. Work during Lammas/Mabon. Give thanks for abundance.',
     ARRAY['Earth', 'Fire'],
     ARRAY['Lammas', 'Mabon', 'Full Moon'],
     'wheat', '#F59E0B'),
    
    ('Gratitude', 'gratitude', 'Giving thanks and appreciation', 'healing',
     ARRAY['thankfulness', 'appreciation', 'blessing', 'recognition'],
     'Essential practice. Daily gratitude journaling. Work during harvest season. Amplifies all other work.',
     ARRAY['Spirit', 'All Elements'],
     ARRAY['Mabon', 'Full Moon'],
     'heart-hands', '#22C55E'),
    
    ('Manifestation', 'manifestation', 'Bringing intentions into physical reality', 'abundance',
     ARRAY['creation', 'materialization', 'bringing forth', 'actualization'],
     'Combine visualization with action. Work during waxing/full moon. Be specific. Back magic with practical steps.',
     ARRAY['Earth', 'Fire', 'Spirit'],
     ARRAY['Waxing Moon', 'Full Moon'],
     'star', '#8B5CF6'),
    
    ('Intention Setting', 'intention-setting', 'Clarifying and declaring goals', 'growth',
     ARRAY['goal setting', 'declaration', 'aim', 'purpose'],
     'Set clear, specific intentions. Write them down. Work during new moon. Review regularly.',
     ARRAY['Air', 'Spirit'],
     ARRAY['New Moon'],
     'target-arrow', '#3B82F6'),
    
    ('Planning', 'planning', 'Organizing and preparing for the future', 'growth',
     ARRAY['preparation', 'strategy', 'organization', 'foresight'],
     'Think ahead. Make plans. Use Air element for mental clarity. Work during waxing moon or new moon.',
     ARRAY['Air', 'Mercury'],
     ARRAY['New Moon', 'Waxing Moon'],
     'calendar', '#6366F1'),
    
    ('Rest', 'rest', 'Restoration through stillness and retreat', 'healing',
     ARRAY['stillness', 'retreat', 'restoration', 'pause'],
     'Honor the need for rest. Work during waning/dark moon. Create restorative spaces. Necessary for growth.',
     ARRAY['Water', 'Earth'],
     ARRAY['Waning Moon', 'Dark Moon'],
     'bed', '#6B7280');

-- =============================================================================
-- MAGICAL TRADITIONS & PRACTICE TYPES
-- =============================================================================

INSERT INTO traditions (name, slug, tradition_type, description, origin, time_period, key_beliefs, common_practices, related_traditions) VALUES
    -- Practice Styles
    ('Solitary Practice', 'solitary', 'practice_style',
     'Practicing magic alone, without a formal group or coven structure. Allows for complete personal freedom and flexibility in practice.',
     'Universal', 'Ancient - Present',
     ARRAY['personal autonomy', 'self-directed learning', 'individual spiritual authority', 'flexibility in practice'],
     ARRAY['personal rituals', 'self-initiation', 'eclectic research', 'solo celebrations', 'private altar work'],
     ARRAY['Eclectic', 'Kitchen Witch', 'Green Witch']),
    
    ('Coven Practice', 'coven', 'practice_style',
     'Practicing in a formal group led by a High Priest and/or High Priestess. Emphasizes community, tradition, and shared learning.',
     'Universal', 'Ancient - Present',
     ARRAY['community support', 'shared energy', 'traditional training', 'hierarchical structure', 'group accountability'],
     ARRAY['group rituals', 'degree system', 'formal initiations', 'regular meetings', 'sabbat celebrations', 'esbat work'],
     ARRAY['Wicca', 'Traditional Witchcraft']),
    
    ('Eclectic Practice', 'eclectic', 'eclectic',
     'Drawing from multiple traditions to create a personalized spiritual path. Not bound to any single tradition or system.',
     'Modern (primarily 20th century)', '1960s - Present',
     ARRAY['personal truth', 'freedom of belief', 'syncretism', 'what works is valid', 'self-directed path'],
     ARRAY['mixing traditions', 'personal experimentation', 'intuitive practice', 'selective adoption', 'DIY rituals'],
     ARRAY['Solitary Practice', 'Kitchen Witch', 'Hedge Witch']),
    
    ('Hereditary Practice', 'hereditary', 'practice_style',
     'Magical practices passed down through family generations, often including family-specific traditions, spells, and lore.',
     'Universal', 'Ancient - Present',
     ARRAY['ancestral wisdom', 'family lineage', 'inherited gifts', 'oral tradition', 'blood connection'],
     ARRAY['family grimoires', 'passed-down recipes', 'inherited tools', 'ancestral veneration', 'traditional lore'],
     ARRAY['Traditional Witchcraft', 'Folk Magic']),
    
    -- Wiccan Traditions
    ('Wicca', 'wicca', 'religious',
     'A modern pagan religion founded in the mid-20th century, emphasizing nature reverence, the God and Goddess, and the Wheel of the Year.',
     'England', '1950s (Gerald Gardner)',
     ARRAY['harm none', 'Law of Threefold Return', 'God and Goddess', 'Wheel of the Year', 'magic as prayer'],
     ARRAY['casting circles', 'calling quarters', 'Drawing Down the Moon', 'cakes and ale', 'Great Rite', 'sabbat celebrations'],
     ARRAY['Gardnerian', 'Alexandrian', 'Dianic', 'Seax Wica']),
    
    ('Gardnerian Wicca', 'gardnerian', 'religious',
     'The original form of Wicca founded by Gerald Gardner. Emphasizes initiation, degree system, and traditional Book of Shadows.',
     'England', '1950s',
     ARRAY['oathbound practices', 'skyclad ritual', 'degree system', 'initiation required', 'traditional liturgy'],
     ARRAY['formal initiations', 'three-degree system', 'coven structure', 'Book of Shadows copying', 'traditional tools'],
     ARRAY['Wicca', 'Alexandrian']),
    
    ('Alexandrian Wicca', 'alexandrian', 'religious',
     'Founded by Alex Sanders, similar to Gardnerian but with more ceremonial magic influence and Qabalah.',
     'England', '1960s',
     ARRAY['ceremonial magic', 'Qabalistic influence', 'deity work', 'formality', 'initiation lineage'],
     ARRAY['ceremonial rituals', 'angelic work', 'pathworking', 'elaborate ceremonies', 'High Magic integration'],
     ARRAY['Wicca', 'Gardnerian', 'Ceremonial Magic']),
    
    ('Dianic Wicca', 'dianic', 'religious',
     'Feminist tradition focusing on the Goddess (particularly Diana/Artemis), often women-only circles.',
     'United States', '1970s',
     ARRAY['feminist spirituality', 'Goddess-centered', 'women''s mysteries', 'female empowerment', 'matriarchal'],
     ARRAY['women''s circles', 'Goddess rituals', 'menstrual mysteries', 'maiden-mother-crone', 'consciousness raising'],
     ARRAY['Wicca', 'Goddess Spirituality']),
    
    -- Witchcraft Traditions
    ('Traditional Witchcraft', 'traditional-witchcraft', 'cultural',
     'Pre-Wiccan witchcraft practices, often regional and family-based. Less religious, more folkloric and practical.',
     'Various European regions', 'Pre-modern - Present',
     ARRAY['folklore basis', 'land spirits', 'ancestral practices', 'practical magic', 'non-Wiccan'],
     ARRAY['hedge riding', 'spirit work', 'folk charms', 'cunning craft', 'local lore', 'traditional herbs'],
     ARRAY['Hedge Witch', 'Cunning Folk', 'Folk Magic']),
    
    ('Kitchen Witch', 'kitchen-witch', 'modern',
     'Hearth-focused practice using cooking, home care, and domestic arts as magical acts. Practical, everyday magic.',
     'Universal', 'Ancient - Present',
     ARRAY['hearth magic', 'domestic spirituality', 'practical enchantment', 'food as magic', 'home as temple'],
     ARRAY['cooking with intent', 'herbal remedies', 'house blessings', 'recipe magic', 'garden work', 'cleaning rituals'],
     ARRAY['Green Witch', 'Cottage Witch', 'Hearth Witch']),
    
    ('Green Witch', 'green-witch', 'modern',
     'Nature-based practice focusing on herbs, plants, and natural magic. Strong connection to the earth and growing things.',
     'Universal', 'Ancient - Present',
     ARRAY['nature reverence', 'plant magic', 'herbalism', 'seasonal living', 'wildcrafting'],
     ARRAY['herbalism', 'garden witchery', 'forest bathing', 'wildcrafting', 'plant communication', 'nature walks'],
     ARRAY['Kitchen Witch', 'Hedge Witch', 'Cottage Witch']),
    
    ('Hedge Witch', 'hedge-witch', 'cultural',
     'Solitary practice emphasizing spirit work, hedge riding (trance/astral travel), and working between worlds.',
     'European', 'Medieval - Present',
     ARRAY['between worlds', 'spirit flight', 'liminality', 'solitary path', 'shamanic elements'],
     ARRAY['hedge riding', 'trance work', 'spirit communication', 'astral travel', 'crossroads magic', 'baneful herbs'],
     ARRAY['Traditional Witchcraft', 'Green Witch']),
    
    ('Cottage Witch', 'cottage-witch', 'modern',
     'Similar to Kitchen Witch but emphasizing home comfort, coziness, and creating a magical home sanctuary.',
     'Universal', 'Modern',
     ARRAY['home sanctuary', 'comfort magic', 'hygge spirituality', 'domestic peace', 'hearth and home'],
     ARRAY['home blessing', 'comfort spells', 'cozy magic', 'threshold protection', 'tea magic', 'candle work'],
     ARRAY['Kitchen Witch', 'Hearth Witch', 'Green Witch']),
    
    ('Cosmic Witch', 'cosmic-witch', 'modern',
     'Practice focused on astrology, astronomy, celestial events, and cosmic energies.',
     'Universal', 'Modern (20th-21st century)',
     ARRAY['cosmic connection', 'astrology', 'celestial timing', 'planetary magic', 'star wisdom'],
     ARRAY['astrology', 'moon phases', 'planetary hours', 'retrograde work', 'eclipse magic', 'star gazing'],
     ARRAY['Astrology', 'Ceremonial Magic']),
    
    -- Reconstructionist Paths
    ('Hellenism', 'hellenism', 'reconstructionist',
     'Modern revival of ancient Greek religion, honoring the Theoi (Greek gods) and practicing ancient Greek religious customs.',
     'Ancient Greece', 'Ancient (revival: 1990s+)',
     ARRAY['kharis (reciprocity)', 'xenia (hospitality)', 'honoring Theoi', 'household worship', 'miasma concepts'],
     ARRAY['household altars', 'libations', 'hymns to gods', 'festival observances', 'divination', 'prayer rituals'],
     ARRAY['Greek Pantheon', 'Paganism']),
    
    ('Heathenry', 'heathenry', 'reconstructionist',
     'Modern revival of pre-Christian Germanic/Norse religion, honoring the Æsir and Vanir.',
     'Northern Europe (Germanic regions)', 'Ancient (revival: 1970s+)',
     ARRAY['frith (peace)', 'honor', 'hospitality', 'ancestor veneration', 'wyrd (fate)', 'gifting cycle'],
     ARRAY['blót (sacrifice)', 'symbel (ritual toasting)', 'rune work', 'ancestor veneration', 'landvaettir offerings'],
     ARRAY['Norse Pantheon', 'Ásatrú', 'Anglo-Saxon Heathenry']),
    
    ('Kemeticism', 'kemeticism', 'reconstructionist',
     'Modern revival of ancient Egyptian religion, honoring the Netjeru (Egyptian gods).',
     'Ancient Egypt', 'Ancient (revival: 1970s+)',
     ARRAY['ma''at (truth/order)', 'isfet (chaos)', 'ka/ba/akh (soul parts)', 'cyclical time', 'divine kingship'],
     ARRAY['shrine worship', 'daily offerings', 'purification rituals', 'festival observances', 'Kemetic calendar', 'state rituals'],
     ARRAY['Egyptian Pantheon', 'Paganism']),
    
    ('Celtic Reconstructionism', 'celtic-reconstructionist', 'reconstructionist',
     'Historically-based revival of ancient Celtic religious practices, emphasizing scholarship and authenticity.',
     'Celtic regions (Ireland, Scotland, Wales, Brittany)', 'Ancient (revival: 1980s+)',
     ARRAY['land spirits', 'ancestor veneration', 'tribal identity', 'sovereignty', 'sacred landscape'],
     ARRAY['fire festivals', 'offerings to land spirits', 'ancestor veneration', 'divination', 'Celtic calendar'],
     ARRAY['Celtic Pantheon', 'Druidry']),
    
    -- Other Modern Paths
    ('Druidry', 'druidry', 'modern',
     'Modern spiritual path inspired by ancient Celtic druids, emphasizing nature, poetry, and bardic arts.',
     'Celtic regions', 'Ancient philosophy, Modern practice (revival: 18th century+)',
     ARRAY['nature reverence', 'three realms', 'bardic arts', 'wisdom seeking', 'seasonal celebrations'],
     ARRAY['tree lore', 'bardic training', 'ritual groves', 'seasonal rites', 'meditation', 'eisteddfod'],
     ARRAY['Celtic traditions', 'Celtic Reconstructionism']),
    
    ('Ceremonial Magic', 'ceremonial-magic', 'modern',
     'Formal Western occultism using complex rituals, Qabalah, angelic work, and elaborate symbolism.',
     'Europe/Middle East', 'Medieval - Present',
     ARRAY['as above so below', 'knowledge and conversation', 'Great Work', 'hierarchical cosmos', 'Will'],
     ARRAY['circle casting', 'planetary work', 'angelic evocation', 'Qabalistic pathworking', 'ritual tools', 'formal robes'],
     ARRAY['Golden Dawn', 'Thelema', 'Rosicrucianism']),
    
    ('Chaos Magic', 'chaos-magic', 'modern',
     'Postmodern magical practice emphasizing experimentation, results, and belief as a tool.',
     'England', '1970s-1980s',
     ARRAY['belief as tool', 'gnosis focus', 'paradigm shifting', 'results-oriented', 'nothing is true everything is permitted'],
     ARRAY['sigil magic', 'servitor creation', 'gnosis techniques', 'paradigm shifting', 'experimentation', 'meta-belief'],
     ARRAY['Modern Witchcraft', 'Eclectic Practice']),
    
    ('Folk Magic', 'folk-magic', 'cultural',
     'Regional magical practices based on local customs, superstitions, and practical needs. Often Christian-influenced.',
     'Various regions worldwide', 'Ancient - Present',
     ARRAY['practical focus', 'local spirits', 'community practices', 'handed-down lore', 'vernacular religion'],
     ARRAY['charms', 'folk remedies', 'protection magic', 'agricultural rites', 'healing practices', 'divination'],
     ARRAY['Traditional Witchcraft', 'Hoodoo', 'Brujería']);

-- =============================================================================
-- SAMPLE PANTHEONS
-- =============================================================================

INSERT INTO pantheons (name, slug, culture, region, time_period, mythology_type, description) VALUES
    ('Greek Pantheon', 'greek', 'Greek', 'Mediterranean', 'Ancient Greece (800 BCE - 400 CE)', 'Polytheistic',
     'The pantheon of ancient Greek gods and goddesses, including the Olympians and other divine beings.'),
    
    ('Norse Pantheon', 'norse', 'Norse', 'Scandinavia', 'Viking Age (700 - 1100 CE)', 'Polytheistic',
     'The gods and goddesses of Norse mythology, including the Aesir and Vanir.'),
    
    ('Egyptian Pantheon', 'egyptian', 'Egyptian', 'North Africa', 'Ancient Egypt (3100 BCE - 30 BCE)', 'Polytheistic',
     'The deities of ancient Egypt, including gods of the sun, death, and the afterlife.'),
    
    ('Celtic Pantheon', 'celtic', 'Celtic', 'British Isles & Continental Europe', 'Iron Age - Medieval (500 BCE - 1000 CE)', 'Polytheistic',
     'The diverse gods and goddesses of Celtic peoples across Europe, including Irish, Welsh, and Gaulish traditions.'),
    
    ('Roman Pantheon', 'roman', 'Roman', 'Mediterranean', 'Ancient Rome (750 BCE - 400 CE)', 'Polytheistic',
     'The pantheon of ancient Roman gods and goddesses, many adapted from Greek mythology.'),
    
    ('Hindu Pantheon', 'hindu', 'Hindu', 'Indian Subcontinent', 'Ancient - Present', 'Polytheistic/Henotheistic',
     'The complex pantheon of Hindu deities, including the Trimurti and many avatars and aspects.');

-- =============================================================================
-- SAMPLE DEITIES
-- =============================================================================

-- First, get the pantheon IDs
DO $$
DECLARE
    greek_pantheon_id UUID;
    norse_pantheon_id UUID;
    egyptian_pantheon_id UUID;
    celtic_pantheon_id UUID;
BEGIN
    SELECT id INTO greek_pantheon_id FROM pantheons WHERE slug = 'greek';
    SELECT id INTO norse_pantheon_id FROM pantheons WHERE slug = 'norse';
    SELECT id INTO egyptian_pantheon_id FROM pantheons WHERE slug = 'egyptian';
    SELECT id INTO celtic_pantheon_id FROM pantheons WHERE slug = 'celtic';

    INSERT INTO deities (name, slug, culture, pantheon_id, gender, domains, symbols, description) VALUES
        ('Brigid', 'brigid', 'Celtic', celtic_pantheon_id, 'feminine',
         ARRAY['fire', 'poetry', 'healing', 'smithcraft'],
         ARRAY['fire', 'sacred flame', 'wells', 'cross'],
         'Irish goddess of fire, poetry, healing, and smithcraft. Associated with Imbolc.'),
        
        ('Hecate', 'hecate', 'Greek', greek_pantheon_id, 'feminine',
         ARRAY['magic', 'crossroads', 'moon', 'necromancy'],
         ARRAY['torch', 'key', 'dagger', 'dog'],
         'Greek goddess of magic, crossroads, and the moon. Guardian of thresholds.'),
        
        ('Cernunnos', 'cernunnos', 'Celtic', celtic_pantheon_id, 'masculine',
         ARRAY['nature', 'fertility', 'animals', 'wild'],
         ARRAY['antlers', 'torque', 'serpent', 'stag'],
         'Celtic horned god of nature, fertility, and animals.'),
        
        ('Thoth', 'thoth', 'Egyptian', egyptian_pantheon_id, 'masculine',
         ARRAY['wisdom', 'writing', 'magic', 'moon'],
         ARRAY['ibis', 'moon', 'papyrus', 'scales'],
         'Egyptian god of wisdom, writing, and magic.'),
        
        ('Freyja', 'freyja', 'Norse', norse_pantheon_id, 'feminine',
         ARRAY['love', 'beauty', 'war', 'seidr'],
         ARRAY['falcon', 'cats', 'amber', 'boar'],
         'Norse goddess of love, beauty, war, and seidr magic.'),
        
        ('Artemis', 'artemis', 'Greek', greek_pantheon_id, 'feminine',
         ARRAY['hunt', 'wilderness', 'moon', 'childbirth'],
         ARRAY['bow', 'arrow', 'deer', 'moon'],
         'Greek goddess of the hunt, wilderness, and moon.'),
        
        ('Anubis', 'anubis', 'Egyptian', egyptian_pantheon_id, 'masculine',
         ARRAY['death', 'mummification', 'afterlife', 'protection'],
         ARRAY['jackal', 'scales', 'crook', 'flail'],
         'Egyptian god of death, mummification, and the afterlife.'),
        
        ('Morrigan', 'morrigan', 'Celtic', celtic_pantheon_id, 'feminine',
         ARRAY['war', 'fate', 'death', 'sovereignty'],
         ARRAY['crow', 'raven', 'wolf', 'sword'],
         'Irish goddess of war, fate, and sovereignty. Often appears as a crow.');
END $$;

-- =============================================================================
-- SAMPLE USERS (Passwords are hashed 'password123')
-- =============================================================================

INSERT INTO users (username, email, password_hash, display_name, bio, is_email_verified) VALUES
    ('admin', 'admin@grimoirecollective.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 
     'Admin User', 'Site administrator', TRUE),
    ('witchyways', 'witchy@example.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy',
     'Witchy Ways', 'Green witch and herbalist. Love connecting with nature.', TRUE),
    ('moonchild', 'moon@example.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy',
     'Moon Child', 'Lunar magic practitioner and tarot reader.', TRUE),
    ('stardust', 'star@example.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy',
     'Cosmic Stardust', 'Astrologer and crystal enthusiast.', TRUE);

-- Assign roles to users
INSERT INTO user_roles (user_id, role_id) 
SELECT 
    u.id, 
    r.id
FROM users u
CROSS JOIN roles r
WHERE (u.username = 'admin' AND r.name = 'super_admin')
   OR (u.username IN ('witchyways', 'moonchild', 'stardust') AND r.name = 'user');

-- Create user settings
INSERT INTO user_settings (user_id)
SELECT id FROM users;

-- =============================================================================
-- SAMPLE GRIMOIRES
-- =============================================================================

INSERT INTO grimoires (
    title, slug, content, excerpt, content_type_id, author_id, 
    status, is_public, published_at
) VALUES
    (
        'Simple Protection Spell for Beginners',
        'simple-protection-spell-beginners',
        E'# Simple Protection Spell for Beginners\n\n## What You''ll Need:\n- White candle\n- Salt\n- Clear intention\n\n## Instructions:\n\n1. Create a circle of salt around your candle\n2. Light the candle and visualize white protective light\n3. Say: "By fire and salt, protection cast, keep me safe, this spell will last"\n4. Let the candle burn for at least 15 minutes\n5. Dispose of salt outside your home\n\n## Notes:\nThis is a simple spell perfect for beginners. Can be done during any moon phase, but particularly powerful during a full moon.',
        'A simple protection spell using basic materials, perfect for beginners.',
        (SELECT id FROM content_types WHERE slug = 'spell'),
        (SELECT id FROM users WHERE username = 'witchyways'),
        'published',
        TRUE,
        CURRENT_TIMESTAMP - INTERVAL '30 days'
    ),
    (
        'Full Moon Manifestation Ritual',
        'full-moon-manifestation-ritual',
        E'# Full Moon Manifestation Ritual\n\nHarness the power of the full moon to manifest your desires.\n\n## Materials:\n- White or silver candle\n- Paper and pen\n- Crystals (clear quartz, moonstone)\n- Moon water (optional)\n\n## Preparation:\nPerform this ritual outdoors if possible, or by a window where you can see the moon.\n\n## Steps:\n\n1. Cleanse your space with sage or incense\n2. Set up your altar with candles and crystals\n3. Write your intentions on paper - be specific!\n4. Hold the paper and visualize your desires manifesting\n5. Say: "By the light of the full moon bright, I manifest my heart''s delight"\n6. Burn the paper safely in the candle flame\n7. Meditate on your intentions for at least 10 minutes\n8. Thank the moon and close your circle\n\n## Timing:\nBest performed when the moon is visible, within 24 hours of peak fullness.',
        'Manifest your desires with this powerful full moon ritual.',
        (SELECT id FROM content_types WHERE slug = 'ritual'),
        (SELECT id FROM users WHERE username = 'moonchild'),
        'published',
        TRUE,
        CURRENT_TIMESTAMP - INTERVAL '15 days'
    ),
    (
        'Rosemary: The Magical Herb',
        'rosemary-magical-herb',
        E'# Rosemary: The Magical Herb\n\n## Botanical Name:\nRosmarinus officinalis\n\n## Magical Properties:\n- Protection\n- Purification\n- Memory enhancement\n- Love\n- Mental clarity\n\n## Elemental Correspondence:\nFire\n\n## Planetary Correspondence:\nSun\n\n## Uses:\n\n### In Spells:\nRosemary is incredibly versatile. Add to protection sachets, burn as incense for purification, or add to love spells.\n\n### In the Kitchen:\nRosemary can be used in cooking to infuse food with protective and loving energy.\n\n### Medicinal:\nRosemary tea can improve memory and concentration.\n\n## Growing Tips:\nRosemary prefers full sun and well-drained soil. Can be grown in pots indoors.\n\n## Harvest:\nBest harvested in the morning after the dew has dried.',
        'Complete guide to the magical properties and uses of rosemary.',
        (SELECT id FROM content_types WHERE slug = 'herb'),
        (SELECT id FROM users WHERE username = 'witchyways'),
        'published',
        TRUE,
        CURRENT_TIMESTAMP - INTERVAL '20 days'
    ),
    (
        'Clear Quartz: The Master Healer',
        'clear-quartz-master-healer',
        E'# Clear Quartz: The Master Healer\n\n## Properties:\nClear quartz is known as the "master healer" and can amplify energy and thought.\n\n## Magical Uses:\n- Amplification of intentions\n- Energy cleansing\n- Meditation\n- Programming for specific purposes\n- Healing work\n\n## Chakra:\nAll chakras, especially Crown\n\n## Element:\nAll elements\n\n## Cleansing:\nClear quartz can be cleansed with:\n- Moonlight (especially full moon)\n- Sunlight (briefly)\n- Salt water\n- Smoke from sage or incense\n- Sound (singing bowls)\n\n## Programming:\nTo program clear quartz:\n1. Cleanse the crystal\n2. Hold it in your hands\n3. Focus on your intention\n4. Visualize white light filling the crystal\n5. State your intention clearly\n6. Thank the crystal\n\n## Care:\nClear quartz is relatively hardy but can be scratched. Store separately from softer stones.',
        'Everything you need to know about clear quartz crystal.',
        (SELECT id FROM content_types WHERE slug = 'crystal'),
        (SELECT id FROM users WHERE username = 'stardust'),
        'published',
        TRUE,
        CURRENT_TIMESTAMP - INTERVAL '10 days'
    );

-- =============================================================================
-- LINK GRIMOIRES TO CATEGORIES, TAGS, ETC.
-- =============================================================================

-- Link grimoires to categories (using new unified entity_categories table)
INSERT INTO entity_categories (entity_type, entity_id, category_id)
SELECT 
    'grimoire' as entity_type,
    g.id,
    c.id
FROM grimoires g
CROSS JOIN categories c
WHERE (g.slug = 'simple-protection-spell-beginners' AND c.slug IN ('spellwork', 'protection-magic'))
   OR (g.slug = 'full-moon-manifestation-ritual' AND c.slug IN ('rituals-ceremonies', 'moon-magic'))
   OR (g.slug = 'rosemary-magical-herb' AND c.slug IN ('herbalism', 'protection-magic'))
   OR (g.slug = 'clear-quartz-master-healer' AND c.slug IN ('crystals-stones', 'healing'));

-- Link grimoires to tags (using new unified entity_tags table)
INSERT INTO entity_tags (entity_type, entity_id, tag_id)
SELECT 
    'grimoire' as entity_type,
    g.id,
    t.id
FROM grimoires g
CROSS JOIN tags t
WHERE (g.slug = 'simple-protection-spell-beginners' AND t.slug IN ('beginner-friendly', 'candle-magic', 'quick-spell', 'solitary'))
   OR (g.slug = 'full-moon-manifestation-ritual' AND t.slug IN ('full-moon', 'visualization', 'outdoor', 'solitary'))
   OR (g.slug = 'rosemary-magical-herb' AND t.slug IN ('beginner-friendly', 'daily-practice'))
   OR (g.slug = 'clear-quartz-master-healer' AND t.slug IN ('beginner-friendly', 'meditation'));

-- Link grimoires to moon phases
INSERT INTO grimoire_moon_phases (grimoire_id, moon_phase_id)
SELECT 
    g.id,
    mp.id
FROM grimoires g
CROSS JOIN moon_phases mp
WHERE g.slug = 'full-moon-manifestation-ritual' AND mp.slug = 'full-moon';

-- =============================================================================
-- SAMPLE SOCIAL INTERACTIONS
-- =============================================================================

-- Add some likes
INSERT INTO grimoire_interactions (grimoire_id, user_id, interaction_type)
SELECT 
    g.id,
    u.id,
    'like'
FROM grimoires g
CROSS JOIN users u
WHERE g.slug IN ('simple-protection-spell-beginners', 'full-moon-manifestation-ritual')
  AND u.username IN ('moonchild', 'stardust');

-- Add some favorites
INSERT INTO grimoire_interactions (grimoire_id, user_id, interaction_type)
SELECT 
    g.id,
    u.id,
    'favorite'
FROM grimoires g
CROSS JOIN users u
WHERE g.slug = 'simple-protection-spell-beginners'
  AND u.username IN ('moonchild', 'stardust');

-- Add some comments
INSERT INTO comments (grimoire_id, user_id, content)
SELECT 
    g.id,
    u.id,
    'This spell worked wonderfully for me! Thank you for sharing.'
FROM grimoires g
CROSS JOIN users u
WHERE g.slug = 'simple-protection-spell-beginners'
  AND u.username = 'moonchild';

INSERT INTO comments (grimoire_id, user_id, content)
SELECT 
    g.id,
    u.id,
    'Beautiful ritual! I performed this last full moon and felt such powerful energy.'
FROM grimoires g
CROSS JOIN users u
WHERE g.slug = 'full-moon-manifestation-ritual'
  AND u.username = 'stardust';

-- Create sample boards
INSERT INTO user_boards (user_id, name, description, is_public)
SELECT 
    id,
    'My Favorite Spells',
    'Collection of my go-to spells',
    TRUE
FROM users
WHERE username = 'moonchild';

INSERT INTO user_boards (user_id, name, description, is_public)
SELECT 
    id,
    'Beginner Resources',
    'Great resources for those just starting their journey',
    TRUE
FROM users
WHERE username = 'stardust';

-- Add items to boards
INSERT INTO board_items (board_id, grimoire_id, notes)
SELECT 
    ub.id,
    g.id,
    'Perfect for quick protection'
FROM user_boards ub
CROSS JOIN grimoires g
WHERE ub.name = 'My Favorite Spells'
  AND g.slug = 'simple-protection-spell-beginners';

INSERT INTO board_items (board_id, grimoire_id, notes)
SELECT 
    ub.id,
    g.id,
    'Essential reading for beginners'
FROM user_boards ub
CROSS JOIN grimoires g
WHERE ub.name = 'Beginner Resources'
  AND g.slug IN ('simple-protection-spell-beginners', 'rosemary-magical-herb', 'clear-quartz-master-healer');

-- =============================================================================
-- SAMPLE ANALYTICS DATA
-- =============================================================================

-- Add some view tracking (simulating views over time)
INSERT INTO grimoire_views (grimoire_id, user_id, viewed_at)
SELECT 
    g.id,
    u.id,
    CURRENT_TIMESTAMP - (random() * INTERVAL '30 days')
FROM grimoires g
CROSS JOIN users u
CROSS JOIN generate_series(1, 5) -- Each user views each grimoire ~5 times
WHERE g.status = 'published';

-- Refresh materialized views
REFRESH MATERIALIZED VIEW grimoire_stats;
REFRESH MATERIALIZED VIEW user_stats;

-- =============================================================================
-- END OF SEED DATA
-- =============================================================================
