-- =============================================================================
-- GRIMOIRE COLLECTIVE - DIVINATION METHODS & RITUAL TOOLS SEED DATA
-- =============================================================================
-- Purpose: Sample data for divination methods and ritual tools
-- Created: 2025-12-29
-- Note: This file runs after entity tables are created (04-entity-tables.sql)
-- =============================================================================

-- =============================================================================
-- SAMPLE DIVINATION METHODS
-- =============================================================================

DO $$
DECLARE
    admin_user_id UUID;
    tarot_id UUID;
    runes_id UUID;
    scrying_id UUID;
    pendulum_id UUID;
BEGIN
    SELECT id INTO admin_user_id FROM users WHERE username = 'admin' LIMIT 1;

    -- Insert divination methods (without the removed columns)
    INSERT INTO divination_methods (
        name, slug, alternative_names, method_type, difficulty_level,
        description, history, how_to_use, interpretation_guide,
        best_for,
        created_by, is_verified
    ) VALUES
    
    -- Tarot
    (
        'Tarot Reading', 'tarot', ARRAY['Tarot Cards', 'Cartomancy'],
        'cartomancy', 'intermediate',
        'A system of divination using a deck of 78 cards with symbolic imagery, divided into Major Arcana (22 cards) and Minor Arcana (56 cards). Each card carries specific meanings and together they tell a story.',
        'Tarot originated in 15th century Europe as playing cards. By the 18th century, they were being used for divination. The Rider-Waite deck (1909) became the most popular and influential tarot system.',
        'Shuffle the deck while focusing on your question. Draw cards in your chosen spread pattern. Interpret each card''s meaning in position, considering both upright and reversed meanings. Look at how cards relate to each other.',
        'Major Arcana represent life lessons and spiritual growth. Minor Arcana represent daily life: Wands (Fire/creativity), Cups (Water/emotions), Swords (Air/thoughts), Pentacles (Earth/material). Court cards represent people or personality aspects.',
        ARRAY['complex questions', 'life path guidance', 'spiritual insight', 'relationship advice', 'decision making'],
        admin_user_id, TRUE
    )
    RETURNING id INTO tarot_id;
    
    INSERT INTO divination_methods (
        name, slug, alternative_names, method_type, difficulty_level,
        description, history, how_to_use, interpretation_guide,
        best_for,
        created_by, is_verified
    ) VALUES
    
    -- Runes
    (
        'Rune Casting', 'runes', ARRAY['Rune Stones', 'Runecasting', 'Runic Divination'],
        'lithomancy', 'beginner',
        'Ancient Norse alphabet used for divination. 24 runes in the Elder Futhark, each with specific meanings. Cast and read runes to gain insight and guidance.',
        'Runes were the alphabet of Germanic peoples, used from 150-1000 CE. Each rune held meaning beyond its letter sound. Vikings used runes for writing, magic, and divination.',
        'Focus on your question. Draw runes from a bag, or cast them onto a cloth. Read the runes that land face-up. The position and proximity to other runes affects meaning.',
        'Each rune has a specific meaning. Reversed runes may have opposite or blocked meanings. Consider the question, the rune''s position, and your intuition.',
        ARRAY['yes/no questions', 'simple guidance', 'quick insights', 'connecting with Norse tradition'],
        admin_user_id, TRUE
    )
    RETURNING id INTO runes_id;
    
    INSERT INTO divination_methods (
        name, slug, alternative_names, method_type, difficulty_level,
        description, history, how_to_use, interpretation_guide,
        best_for,
        created_by, is_verified
    ) VALUES
    
    -- Scrying
    (
        'Scrying', 'scrying', ARRAY['Crystal Ball Gazing', 'Mirror Gazing', 'Water Gazing'],
        'scrying', 'advanced',
        'The practice of gazing into a reflective surface to receive visions, messages, or insights. Can be done with crystal balls, black mirrors, water, or other reflective surfaces.',
        'Scrying has been practiced across cultures for thousands of years. Ancient Egyptians used oil lamps, Nostradamus used a bowl of water, John Dee used a black obsidian mirror. Crystal balls became popular in Victorian era.',
        'Set up in dim lighting. Gaze softly at the surface without straining. Let your eyes unfocus slightly. Watch for images, symbols, or impressions that arise. Record what you see immediately after.',
        'Images may be literal or symbolic. Trust your intuition. Visions might appear as clouds, colors, symbols, or full scenes. Some see with their mind''s eye rather than physical eyes.',
        ARRAY['future insight', 'spirit communication', 'deep meditation', 'psychic development'],
        admin_user_id, TRUE
    )
    RETURNING id INTO scrying_id;
    
    INSERT INTO divination_methods (
        name, slug, alternative_names, method_type, difficulty_level,
        description, history, how_to_use, interpretation_guide,
        best_for,
        created_by, is_verified
    ) VALUES
    
    -- Pendulum
    (
        'Pendulum Dowsing', 'pendulum', ARRAY['Pendulum Divination', 'Dowsing'],
        'divination tool', 'beginner',
        'Using a weighted object on a chain or string to receive yes/no answers and find things. The pendulum swings in different directions to communicate answers.',
        'Dowsing with pendulums dates back thousands of years. Used to find water, minerals, and lost objects. Became popular for divination in the 1900s.',
        'Hold the pendulum chain between thumb and forefinger. Ask it to show you "yes" and "no" (usually circular vs. linear motions). Ask clear yes/no questions. Watch the pendulum''s movement for answers.',
        'Program your pendulum first by asking it to show yes/no/maybe. Clear your mind before asking. Questions must be specific and yes/no format. Can also be used over maps or charts.',
        ARRAY['yes/no questions', 'finding lost objects', 'quick answers', 'energy detection'],
        admin_user_id, TRUE
    )
    RETURNING id INTO pendulum_id;
    
    -- Insert common tarot spreads
    INSERT INTO divination_spreads (
        name, slug, divination_method_id, description, position_count,
        positions, layout_diagram, difficulty_level, best_for, interpretation_tips,
        created_by, is_verified
    ) VALUES
    (
        'Three Card Spread', 'three-card', tarot_id,
        'Simple three card layout representing past, present, and future, or situation, action, outcome.',
        3,
        '[
            {"position": 1, "name": "Past/Situation", "meaning": "What led to this moment or the current situation"},
            {"position": 2, "name": "Present/Action", "meaning": "Current energies or recommended action"},
            {"position": 3, "name": "Future/Outcome", "meaning": "Likely outcome or future influence"}
        ]'::jsonb,
        'Card 1  Card 2  Card 3',
        'beginner',
        ARRAY['quick readings', 'simple questions', 'daily guidance', 'learning tarot'],
        'Read cards left to right. Consider how they flow together as a story. Can be adapted for many question types.',
        admin_user_id, TRUE
    ),
    (
        'Celtic Cross', 'celtic-cross', tarot_id,
        'Classic 10-card spread providing comprehensive insight into a situation.',
        10,
        '[
            {"position": 1, "name": "Present", "meaning": "Current situation or heart of the matter"},
            {"position": 2, "name": "Challenge", "meaning": "Obstacle or opposing force"},
            {"position": 3, "name": "Past", "meaning": "Foundation or past influences"},
            {"position": 4, "name": "Future", "meaning": "What is approaching"},
            {"position": 5, "name": "Above", "meaning": "Conscious goals or best outcome"},
            {"position": 6, "name": "Below", "meaning": "Unconscious influences or hidden factors"},
            {"position": 7, "name": "Advice", "meaning": "Your role or suggested approach"},
            {"position": 8, "name": "External", "meaning": "External influences or others'' perspectives"},
            {"position": 9, "name": "Hopes/Fears", "meaning": "Inner hopes and fears"},
            {"position": 10, "name": "Outcome", "meaning": "Final outcome"}
        ]'::jsonb,
        E'      5\n      |\n  3-1-2-4\n      |\n      6\n\n  7 8 9 10',
        'intermediate',
        ARRAY['complex situations', 'life decisions', 'deep insight', 'comprehensive readings'],
        'Card 1 and 2 form the cross at center. Cards 3-6 form the circle around them. Cards 7-10 form the staff on the right. Read in sequence but also look for patterns.',
        admin_user_id, TRUE
    );
    
    -- Insert sample rune spread
    INSERT INTO divination_spreads (
        name, slug, divination_method_id, description, position_count,
        positions, layout_diagram, difficulty_level, best_for, interpretation_tips,
        created_by, is_verified
    ) VALUES
    (
        'Three Rune Spread', 'three-rune', runes_id,
        'Simple three rune layout for past, present, future or situation, action, outcome.',
        3,
        '[
            {"position": 1, "name": "Past/Overview", "meaning": "What has led to this situation"},
            {"position": 2, "name": "Present/Challenge", "meaning": "Current situation or main challenge"},
            {"position": 3, "name": "Future/Action", "meaning": "Outcome or recommended action"}
        ]'::jsonb,
        'Rune 1  Rune 2  Rune 3',
        'beginner',
        ARRAY['quick guidance', 'daily readings', 'simple questions', 'rune practice'],
        'Draw three runes or cast and read the first three that land face-up. Read in order but also consider their interaction.',
        admin_user_id, TRUE
    );

END $$;

-- =============================================================================
-- SAMPLE RITUAL TOOLS
-- =============================================================================

DO $$
DECLARE
    admin_user_id UUID;
BEGIN
    SELECT id INTO admin_user_id FROM users WHERE username = 'admin' LIMIT 1;

    -- Ritual Tools Seed Data
    -- NOTE: Additional relationships are managed via polymorphic junction tables:
    --   - Element associations: entity_elements (entity_type='ritual_tool')
    --   - Tradition associations: entity_traditions (entity_type='ritual_tool')
    --   - Magical properties/uses: entity_intentions (entity_type='ritual_tool')
    --   - Deity associations: entity_deities (entity_type='ritual_tool')
    --   - Zodiac associations: entity_zodiac_signs (entity_type='ritual_tool')
    --   - Sabbat associations: entity_ritual_tools (entity_type='sabbat', ritual_tool_id=tool_id)
    INSERT INTO ritual_tools (
        name, slug, alternative_names, tool_category,
        description, history, symbolism, how_to_use,
        consecration_methods, traditional_materials, cleansing_methods,
        purposes, created_by, is_verified
    ) VALUES
    
    -- Athame
    (
        'Athame', 'athame', ARRAY['Ritual Knife', 'Black-Handled Knife'],
        'elemental',
        'A ceremonial double-edged blade used to direct energy, cast circles, and perform ritual work. Traditionally has a black handle and is never used for physical cutting.',
        'The athame became prominent in modern Wicca through Gerald Gardner in the 1950s. Similar ritual knives appear in ceremonial magic traditions like the Key of Solomon. The black handle distinguishes it from the white-handled knife (boline) used for physical cutting.',
        'Represents the element of Air (in some traditions Fire). Symbolizes the masculine principle, will, and directed intention. The blade cuts through negative energy and marks boundaries.',
        'Hold with intention, point to direct energy. Draw a circle by pointing and walking clockwise. Use to "cut" doorways in the circle for entering/exiting. Never use for physical cutting in ritual context.',
        'Pass through incense smoke, anoint with oil, charge under full moon, consecrate with salt and water, perform dedicatory ritual.',
        ARRAY['steel blade', 'black handle (wood, bone, or resin)', 'traditionally double-edged'],
        ARRAY['sage smoke', 'salt water', 'moonlight', 'sound (bells/singing bowl)'],
        ARRAY['directing energy', 'casting circle', 'cutting cords', 'invoking elements'],
        admin_user_id, TRUE
    ),
    
    -- Wand
    (
        'Wand', 'wand', ARRAY['Magic Wand', 'Ritual Wand'],
        'elemental',
        'A rod used to direct magical energy, invoke deities and elements, and channel will. Often made from wood, but can be crystal, metal, or other materials.',
        'Wands have been used in magic for thousands of years. Ancient Egyptian priests used wands. The ancient Greeks and Romans used wands (caduceus). Medieval grimoires detail wand construction. Each magical tradition has its own wand lore.',
        'Represents Air (or Fire in some traditions). Symbolizes will, power, and authority. The extension of the practitioner''s arm and intention. Channels and directs energy.',
        'Hold and point to direct energy. Use flowing motions rather than sharp gestures. Can trace pentacles, spirals, or other symbols. Use to gently invoke rather than command.',
        'Carve or paint with symbols, anoint with oil, bury in earth for three days, charge with your intention, consecrate in ritual.',
        ARRAY['wood (oak, willow, hazel, elder)', 'crystal wand', 'copper or other metal', 'often decorated with crystals/stones'],
        ARRAY['moonlight', 'smoke cleansing', 'earth burial', 'sound'],
        ARRAY['directing energy', 'invocation', 'channeling', 'stirring', 'drawing symbols'],
        admin_user_id, TRUE
    ),
    
    -- Chalice
    (
        'Chalice', 'chalice', ARRAY['Ritual Cup', 'Goblet'],
        'elemental',
        'A ceremonial cup or goblet representing the element of Water. Used to hold ritual beverages, water, wine, or represent the divine feminine on the altar.',
        'Ritual cups have been sacred for millennia. The Holy Grail of Arthurian legend is a famous magical chalice. Ancient cultures used special vessels for libations to gods. The chalice became central in modern witchcraft and ceremonial magic.',
        'Represents Water element and the womb. Symbolizes the feminine principle, receptivity, intuition, and emotion. The vessel that receives and holds.',
        'Fill with water, wine, or ritual beverage. Bless and consecrate contents. Drink mindfully during ritual. Can also contain water for scrying or blessing tools.',
        'Fill with salt water and let sit under full moon, anoint with oil, consecrate with all four elements, dedicate to deity.',
        ARRAY['silver', 'glass', 'ceramic', 'pewter', 'copper', 'brass'],
        ARRAY['water rinse', 'moonlight', 'salt water soak', 'smoke'],
        ARRAY['holding ritual drinks', 'water scrying', 'altar representation', 'libations'],
        admin_user_id, TRUE
    ),
    
    -- Pentacle
    (
        'Pentacle', 'pentacle', ARRAY['Altar Pentacle', 'Paten'],
        'elemental',
        'A disk inscribed with a pentagram (five-pointed star), representing Earth. Used as a working surface for consecrating objects, grounding energy, and altar centerpiece.',
        'The pentagram is one of the oldest magical symbols, used by ancient Greeks and medieval magicians. The pentacle (pentagram within circle) became prominent in ceremonial magic and modern Wicca. Each point represents an element, with Spirit at the top.',
        'Represents Earth element. Symbolizes manifestation, grounding, and protection. The five points represent Earth, Air, Fire, Water, and Spirit. The circle represents wholeness and protection.',
        'Place items on pentacle to charge or consecrate them. Use as working surface during spellwork. Can trace pentagram shape in the air for protection or invocation.',
        'Bury in earth overnight, sprinkle with salt, anoint with oil, charge with elemental energies, consecrate in ritual.',
        ARRAY['wood', 'metal (brass, copper, silver)', 'ceramic', 'stone', 'clay'],
        ARRAY['salt', 'earth burial', 'smoke', 'moonlight'],
        ARRAY['consecrating objects', 'grounding', 'protection', 'manifestation work', 'altar piece'],
        admin_user_id, TRUE
    ),
    
    -- Censer
    (
        'Censer', 'censer', ARRAY['Incense Burner', 'Thurible'],
        'altar',
        'A vessel for burning incense, representing the element of Fire or Air. Used to purify space, create sacred atmosphere, and send prayers and intentions skyward with the smoke.',
        'Incense burners have been used in religious and magical practices worldwide for thousands of years. Ancient Egypt, Greece, Rome, and Asia all had elaborate censers. Churches use thuribles. Burning incense creates sacred space.',
        'Represents Fire (heat and combustion) or Air (rising smoke). The rising smoke carries prayers to the divine. Purifies and sanctifies space. Creates boundary between mundane and sacred.',
        'Add charcoal disk and light it. Once glowing, sprinkle incense on top. For stick incense, simply light and place in holder. Walk around space to cleanse, or let burn on altar.',
        'Clean thoroughly, fill with salt overnight, pass through elements, charge with intention.',
        ARRAY['metal (brass, copper, cast iron)', 'ceramic', 'stone', 'abalone shell', 'heat-proof container'],
        ARRAY['empty and clean ashes', 'salt', 'air dry'],
        ARRAY['burning incense', 'purification', 'creating atmosphere', 'honoring deities', 'smoke cleansing'],
        admin_user_id, TRUE
    ),
    
    -- Cauldron
    (
        'Cauldron', 'cauldron', ARRAY['Witch''s Cauldron', 'Ritual Pot'],
        'altar',
        'A three-legged pot used for brewing potions, burning offerings, scrying with water, and as a powerful altar tool. Symbol of the Goddess and transformation.',
        'Cauldrons are ancient cooking vessels that became magical symbols. Celtic mythology features magical cauldrons like the Cauldron of Dagda. The witch''s cauldron became iconic in folklore. Represents the womb of the Goddess.',
        'Represents transformation, rebirth, and the womb. The three legs represent the Triple Goddess. Contains and transforms. Where ingredients combine into something new.',
        'Use on heat-safe surface. Can place over fire for brewing. Fill with water, herbs, or oils. Burn small items inside. Scry with water-filled cauldron.',
        'Fill with salt water under full moon, smoke cleanse, bury in earth, pass through all elements.',
        ARRAY['cast iron (traditional)', 'copper', 'brass', 'ceramic'],
        ARRAY['scrub with salt', 'water rinse', 'fire cleansing', 're-season if cast iron'],
        ARRAY['brewing potions', 'burning offerings', 'water scrying', 'transformation magic', 'Goddess work'],
        admin_user_id, TRUE
    ),
    
    -- Besom
    (
        'Besom', 'besom', ARRAY['Witch''s Broom', 'Ritual Broom'],
        'altar',
        'A traditional witch''s broom used to sweep away negative energy and cleanse ritual space. Not used for physical cleaning, but for energetic purification.',
        'Brooms have been magical symbols for centuries. European folklore associates brooms with witches. Jumping the broom is a Celtic handfasting tradition. The besom sweeps away old energy before ritual.',
        'Represents the union of masculine (staff) and feminine (bristles). Sweeps away negative energy and creates clean sacred space. Associated with flight and freedom in folklore.',
        'Sweep just above the ground without touching, moving counterclockwise to banish or clockwise to invoke. Visualize negative energy being swept away. Never let bristles touch the ground in ritual.',
        'Pass through smoke, sprinkle with salt water, charge under full moon, bind with intention.',
        ARRAY['natural bristles (straw, twigs)', 'wooden handle', 'natural fiber binding'],
        ARRAY['smoke cleansing', 'moonlight', 'sound'],
        ARRAY['energetic cleansing', 'space clearing', 'protection', 'handfasting', 'threshold guardian'],
        admin_user_id, TRUE
    ),
    
    -- Book of Shadows
    (
        'Book of Shadows', 'book-of-shadows', ARRAY['Grimoire', 'Magical Journal', 'BOS'],
        'altar',
        'A personal journal for recording spells, rituals, correspondences, magical experiences, and wisdom. Your most personal magical tool, containing your unique path and practice.',
        'The term "Book of Shadows" was popularized by Gerald Gardner in the 1950s for Wiccan practice books. Historical grimoires and magical texts served similar purposes for centuries. Each practitioner creates their own.',
        'Represents knowledge, wisdom, and personal power. Contains your magical history and growth. A living document that evolves with your practice.',
        'Write by hand for personal connection. Date entries. Include what worked and what didn''t. Add drawings, pressed herbs, or other meaningful items. Organize in a way that makes sense to you.',
        'Dedicate in ritual, bless with all elements, place crystals on it to charge, write intention on first page.',
        ARRAY['blank book or journal', 'binder for flexibility', 'handmade book', 'digital (modern option)'],
        ARRAY['keep in sacred space', 'store with protective crystals', 'keep private'],
        ARRAY['recording spells', 'tracking practice', 'preserving knowledge', 'magical journal', 'wisdom keeping'],
        admin_user_id, TRUE
    );
END $$;

-- =============================================================================
-- END OF DIVINATION & RITUAL TOOLS SEED DATA
-- =============================================================================
