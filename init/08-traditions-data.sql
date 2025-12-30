-- =============================================================================
-- GRIMOIRE COLLECTIVE - TRADITIONS DATA
-- =============================================================================
-- Purpose: Magical traditions and practice types
-- Dependencies: Requires 02-schema.sql (traditions table definition)
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
