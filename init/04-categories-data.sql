-- =============================================================================
-- GRIMOIRE COLLECTIVE - CATEGORIES DATA
-- =============================================================================
-- Purpose: Content categories for organizing grimoires and magical content
-- Dependencies: Requires 02-schema.sql (categories table definition)
-- =============================================================================

-- NOTE: Categories are pure data - no UI concerns (icons, colors) stored here.
-- Frontend should map category slugs to appropriate icons/colors in its own config.
INSERT INTO categories (name, slug, description) VALUES
    -- Core Practices
    ('Spellwork', 'spellwork', 'All types of magical spells and spell crafting techniques'),
    ('Divination', 'divination', 'Fortune telling, scrying, tarot, runes, and insight practices'),
    ('Herbalism', 'herbalism', 'Magical and medicinal herbs, botanical magic, and plant allies'),
    ('Crystals & Stones', 'crystals-stones', 'Crystal healing, gemstone properties, and mineral magic'),
    ('Rituals & Ceremonies', 'rituals-ceremonies', 'Ceremonial practices, rites of passage, and sacred rituals'),
    ('Calendar & Celebrations', 'calendar-celebrations', 'Wheel of the Year, Sabbats, Esbats, and seasonal celebrations'),
    ('Deities & Spirits', 'deities-spirits', 'Working with divine entities, ancestors, and spirit guides'),
    
    -- Celestial & Natural Magic
    ('Astrology', 'astrology', 'Celestial influences, natal charts, horoscopes, and planetary magic'),
    ('Moon Magic', 'moon-magic', 'Lunar phases, moon rituals, and lunar correspondences'),
    ('Sun Magic', 'sun-magic', 'Solar energy, sun rituals, and daytime magic'),
    ('Elemental Magic', 'elemental-magic', 'Working with Earth, Air, Fire, Water, and Spirit'),
    ('Weather Magic', 'weather-magic', 'Storm magic, rain calling, and working with atmospheric energies'),
    ('Nature Magic', 'nature-magic', 'Green witchcraft, forest magic, and connecting with natural world'),
    
    -- Specialized Practices
    ('Kitchen Witchery', 'kitchen-witchery', 'Culinary magic, recipes, food spells, and hearth magic'),
    ('Candle Magic', 'candle-magic', 'Candle spells, color magic, and flame work'),
    ('Cord & Knot Magic', 'cord-knot-magic', 'String magic, binding spells, and knot work'),
    ('Sigil Magic', 'sigil-magic', 'Symbol creation, sigil activation, and glyph magic'),
    ('Chaos Magic', 'chaos-magic', 'Reality manipulation, belief systems, and paradigm shifting'),
    ('Sex Magic', 'sex-magic', 'Sacred sexuality, tantric practices, and intimate energy work'),
    ('Dream Magic', 'dream-magic', 'Dream work, lucid dreaming, and oneiromancy'),
    ('Hedge Witchery', 'hedge-witchery', 'Spirit flight, hedge riding, and liminal magic'),
    ('Folk Magic', 'folk-magic', 'Traditional folk practices, cunning craft, and regional magic'),
    ('Ceremonial Magic', 'ceremonial-magic', 'High magic, Golden Dawn practices, and ritual magic'),
    ('Chaos Magick', 'chaos-magick', 'Paradigm shifting, servitor creation, and postmodern magic'),
    
    -- Intent-Based Categories
    ('Protection Magic', 'protection-magic', 'Warding, banishing, shielding, and protective spells'),
    ('Love & Relationships', 'love-relationships', 'Romance, connection, friendship, and relationship magic'),
    ('Prosperity & Abundance', 'prosperity-abundance', 'Wealth, success, money magic, and abundance work'),
    ('Healing', 'healing', 'Physical, emotional, spiritual healing, and wellness practices'),
    ('Shadow Work', 'shadow-work', 'Inner work, trauma healing, and psychological transformation'),
    ('Banishing & Binding', 'banishing-binding', 'Removal spells, binding harmful people, and banishing negativity'),
    ('Cleansing & Purification', 'cleansing-purification', 'Spiritual cleansing, purification, and removing negative energy'),
    ('Psychic Development', 'psychic-development', 'Developing intuition, psychic abilities, and extrasensory perception'),
    ('Manifestation', 'manifestation', 'Law of attraction, reality creation, and bringing desires into being'),
    ('Transformation', 'transformation', 'Personal change, metamorphosis, and deep magical transformation'),
    ('Glamour Magic', 'glamour-magic', 'Beauty spells, confidence magic, and altering perception'),
    ('Truth & Justice', 'truth-justice', 'Justice spells, truth work, and legal magic'),
    
    -- Tools & Techniques
    ('Altar Work', 'altar-work', 'Sacred space creation, altar setup, and devotional practices'),
    ('Meditation & Trance', 'meditation-trance', 'Meditation techniques, trance work, and altered states'),
    ('Energy Work', 'energy-work', 'Chakra work, aura cleansing, and energy manipulation'),
    ('Spirit Communication', 'spirit-communication', 'Mediumship, channeling, and communicating with spirits'),
    ('Astral Projection', 'astral-projection', 'Out-of-body experiences, astral travel, and soul flight'),
    ('Necromancy', 'necromancy', 'Working with the dead, ancestor veneration, and death magic'),
    ('Sacred Geometry', 'sacred-geometry', 'Geometric patterns, mathematical magic, and sacred shapes'),
    ('Color Magic', 'color-magic', 'Color correspondences, chromotherapy, and color spells'),
    ('Sound & Music Magic', 'sound-music-magic', 'Chanting, singing bowls, music spells, and sound healing'),
    ('Aromatherapy', 'aromatherapy', 'Essential oils, incense, and scent magic'),
    
    -- Cultural & Traditional Paths
    ('Wicca', 'wicca', 'Wiccan practices, traditions, and beliefs'),
    ('Hoodoo', 'hoodoo', 'African American folk magic and conjure traditions'),
    ('Brujeria', 'brujeria', 'Latin American witchcraft and magical practices'),
    ('Nordic & Norse', 'nordic-norse', 'Norse paganism, runes, and northern European traditions'),
    ('Celtic Practices', 'celtic-practices', 'Celtic traditions, druidry, and Irish/Scottish magic'),
    ('Egyptian Magic', 'egyptian-magic', 'Ancient Egyptian practices, gods, and magical traditions'),
    ('Greek Magic', 'greek-magic', 'Hellenic practices, Greek gods, and classical magic'),
    ('Shamanism', 'shamanism', 'Shamanic journeying, soul retrieval, and indigenous practices'),
    ('Vodou', 'vodou', 'Haitian Vodou, lwa, and Afro-Caribbean practices'),
    ('Santeria', 'santeria', 'Afro-Cuban religion, orishas, and syncretized practices'),
    ('Buddhism & Magic', 'buddhism-magic', 'Buddhist practices, mantras, and Eastern spirituality'),
    
    -- Life & Practical Magic
    ('Home & Hearth', 'home-hearth', 'House blessings, domestic magic, and creating sacred home'),
    ('Garden Magic', 'garden-magic', 'Magical gardening, plant communication, and growing practices'),
    ('Travel Magic', 'travel-magic', 'Safe travel spells, journey magic, and wanderlust work'),
    ('Career & Success', 'career-success', 'Job magic, career advancement, and professional success'),
    ('Creativity & Arts', 'creativity-arts', 'Artistic inspiration, creative magic, and muse work'),
    ('Study & Learning', 'study-learning', 'Memory enhancement, exam success, and knowledge spells'),
    ('Technology Magic', 'technology-magic', 'Digital magic, cyber witchcraft, and tech enchantments'),
    ('Urban Magic', 'urban-magic', 'City witchcraft, concrete jungle magic, and modern practices'),
    ('War & Conflict', 'war-conflict', 'Warrior magic, conflict resolution, and battle spells'),
    ('Animal Magic', 'animal-magic', 'Working with animal spirits, familiars, and animal allies'),
    
    -- Advanced & Esoteric
    ('Alchemy', 'alchemy', 'Alchemical practices, transmutation, and the Great Work'),
    ('Kabbalah', 'kabbalah', 'Jewish mysticism, Tree of Life, and kabbalistic magic'),
    ('Enochian Magic', 'enochian-magic', 'Angelic language, Enochian keys, and Dee magic'),
    ('Goetia', 'goetia', 'Demonic magic, grimoire work, and spirit evocation'),
    ('Theurgy', 'theurgy', 'Divine magic, god-forms, and working with higher powers'),
    ('Sympathetic Magic', 'sympathetic-magic', 'Like attracts like, poppets, and correspondence magic'),
    ('Sex & Fertility', 'sex-fertility', 'Fertility magic, conception spells, and reproductive magic'),
    ('Weather Working', 'weather-working', 'Controlling weather, rain magic, and atmospheric work');
