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
BEGIN
    SELECT id INTO admin_user_id FROM users WHERE username = 'admin' LIMIT 1;

    INSERT INTO divination_methods (
        name, slug, alternative_names, method_type, difficulty_level, tradition,
        description, history, how_to_use, interpretation_guide, tools_required,
        best_for, magical_properties, best_moon_phase, associated_elements,
        created_by, is_verified
    ) VALUES
    
    -- Tarot
    (
        'Tarot Reading', 'tarot', ARRAY['Tarot Cards', 'Cartomancy'],
        'cartomancy', 'intermediate', 'European',
        'A system of divination using a deck of 78 cards with symbolic imagery, divided into Major Arcana (22 cards) and Minor Arcana (56 cards). Each card carries specific meanings and together they tell a story.',
        'Tarot originated in 15th century Europe as playing cards. By the 18th century, they were being used for divination. The Rider-Waite deck (1909) became the most popular and influential tarot system.',
        'Shuffle the deck while focusing on your question. Draw cards in your chosen spread pattern. Interpret each card''s meaning in position, considering both upright and reversed meanings. Look at how cards relate to each other.',
        'Major Arcana represent life lessons and spiritual growth. Minor Arcana represent daily life: Wands (Fire/creativity), Cups (Water/emotions), Swords (Air/thoughts), Pentacles (Earth/material). Court cards represent people or personality aspects.',
        ARRAY['78-card tarot deck', 'cloth for reading surface', 'guidebook (for beginners)'],
        ARRAY['complex questions', 'life path guidance', 'spiritual insight', 'relationship advice', 'decision making'],
        ARRAY['intuition', 'psychic development', 'self-reflection', 'spiritual guidance'],
        ARRAY['Full Moon', 'New Moon'],
        ARRAY['All elements represented in deck'],
        admin_user_id, TRUE
    ),
    
    -- Runes
    (
        'Rune Casting', 'runes', ARRAY['Rune Stones', 'Runecasting', 'Runic Divination'],
        'lithomancy', 'beginner', 'Norse',
        'Ancient Norse alphabet used for divination. 24 runes in the Elder Futhark, each with specific meanings. Cast and read runes to gain insight and guidance.',
        'Runes were the alphabet of Germanic peoples, used from 150-1000 CE. Each rune held meaning beyond its letter sound. Vikings used runes for writing, magic, and divination.',
        'Focus on your question. Draw runes from a bag, or cast them onto a cloth. Read the runes that land face-up. The position and proximity to other runes affects meaning.',
        'Each rune has a specific meaning. Reversed runes may have opposite or blocked meanings. Consider the question, the rune''s position, and your intuition.',
        ARRAY['set of 24 rune stones or wooden pieces', 'cloth or leather bag', 'casting cloth'],
        ARRAY['yes/no questions', 'simple guidance', 'quick insights', 'connecting with Norse tradition'],
        ARRAY['ancient wisdom', 'direct answers', 'connection to ancestors', 'protection'],
        ARRAY['Full Moon', 'Dark Moon'],
        ARRAY['Earth', 'Air'],
        admin_user_id, TRUE
    ),
    
    -- Scrying
    (
        'Scrying', 'scrying', ARRAY['Crystal Ball Gazing', 'Mirror Gazing', 'Water Gazing'],
        'scrying', 'advanced', 'Universal',
        'The practice of gazing into a reflective surface to receive visions, messages, or insights. Can be done with crystal balls, black mirrors, water, or other reflective surfaces.',
        'Scrying has been practiced across cultures for thousands of years. Ancient Egyptians used oil lamps, Nostradamus used a bowl of water, John Dee used a black obsidian mirror. Crystal balls became popular in Victorian era.',
        'Set up in dim lighting. Gaze softly at the surface without straining. Let your eyes unfocus slightly. Watch for images, symbols, or impressions that arise. Record what you see immediately after.',
        'Images may be literal or symbolic. Trust your intuition. Visions might appear as clouds, colors, symbols, or full scenes. Some see with their mind''s eye rather than physical eyes.',
        ARRAY['crystal ball, black mirror, or bowl of water', 'candles for dim lighting', 'quiet space', 'journal for recording'],
        ARRAY['future insight', 'spirit communication', 'deep meditation', 'psychic development'],
        ARRAY['psychic vision', 'trance states', 'spirit contact', 'prophecy'],
        ARRAY['Full Moon', 'Dark Moon'],
        ARRAY['Water', 'Spirit'],
        admin_user_id, TRUE
    ),
    
    -- Pendulum
    (
        'Pendulum Dowsing', 'pendulum', ARRAY['Pendulum Divination', 'Dowsing'],
        'divination tool', 'beginner', 'Universal',
        'Using a weighted object on a chain or string to receive yes/no answers and find things. The pendulum swings in different directions to communicate answers.',
        'Dowsing with pendulums dates back thousands of years. Used to find water, minerals, and lost objects. Became popular for divination in the 1900s.',
        'Hold the pendulum chain between thumb and forefinger. Ask it to show you "yes" and "no" (usually circular vs. linear motions). Ask clear yes/no questions. Watch the pendulum''s movement for answers.',
        'Establish your yes/no signals before starting. Ask one question at a time. Be specific. The pendulum responds to your subconscious mind and energy.',
        ARRAY['pendulum (crystal, metal, or wood on chain)', 'pendulum board or mat (optional)'],
        ARRAY['yes/no questions', 'finding lost objects', 'decision making', 'chakra balancing', 'quick answers'],
        ARRAY['clarity', 'direct communication', 'dowsing', 'energy work'],
        ARRAY['any phase works well'],
        ARRAY['All elements'],
        admin_user_id, TRUE
    ),
    
    -- Tea Leaf Reading
    (
        'Tasseography', 'tea-leaves', ARRAY['Tea Leaf Reading', 'Tasseomancy'],
        'interpretation', 'intermediate', 'European/Middle Eastern',
        'Divination by interpreting patterns made by tea leaves (or coffee grounds) left in a cup. The shapes and symbols reveal insights about the future.',
        'Tea leaf reading became popular in 17th century Europe after tea was introduced from China. Romani people became known for this practice. Coffee ground reading (Turkish coffee) is similar.',
        'Drink tea from a light-colored cup, leaving small amount of liquid and leaves. Swirl cup three times counterclockwise. Turn upside down on saucer. Turn right-side up. Read the symbols formed by leaves.',
        'Symbols near the rim represent near future, bottom represents distant future. Handle side is the querent. Opposite side is external influences. Interpret traditional symbols (hearts=love, birds=messages, trees=growth) and trust intuition.',
        ARRAY['loose leaf tea', 'light-colored teacup and saucer', 'hot water', 'guidebook of symbols'],
        ARRAY['general life guidance', 'timing of events', 'relationship insights', 'opportunity recognition'],
        ARRAY['intuition', 'pattern recognition', 'fortune telling', 'domestic magic'],
        ARRAY['any phase'],
        ARRAY['Water', 'Earth'],
        admin_user_id, TRUE
    ),
    
    -- Oracle Cards
    (
        'Oracle Card Reading', 'oracle-cards', ARRAY['Oracle Decks', 'Card Reading'],
        'cartomancy', 'beginner', 'Modern',
        'Using decks of cards with inspirational or divinatory messages. Unlike tarot, oracle decks vary in structure and number of cards. More intuitive and freeform than traditional tarot.',
        'Oracle cards as distinct from tarot emerged in the 1970s-1980s. Each deck is unique with its own theme, imagery, and number of cards. Popular for their accessible, positive approach.',
        'Shuffle while thinking of your question. Draw one or more cards. Read the card meanings from the guidebook or interpret intuitively. Reflect on how the message applies to your situation.',
        'Oracle cards are designed to be intuitive. Trust your first impression. The images and words work together. There are no reversed meanings unless the deck specifies.',
        ARRAY['oracle card deck', 'guidebook included with deck'],
        ARRAY['daily guidance', 'affirmations', 'gentle insight', 'beginners', 'positive messages'],
        ARRAY['encouragement', 'clarity', 'intuitive guidance', 'self-care'],
        ARRAY['any phase'],
        ARRAY['Spirit', 'All elements'],
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

    INSERT INTO ritual_tools (
        name, slug, alternative_names, tool_category, element, tradition,
        description, history, symbolism, magical_uses, how_to_use,
        consecration_methods, traditional_materials, cleansing_methods,
        purposes, created_by, is_verified
    ) VALUES
    
    -- Athame
    (
        'Athame', 'athame', ARRAY['Ritual Knife', 'Black-Handled Knife'],
        'elemental', 'Air', 'Wiccan/Western',
        'A ceremonial double-edged blade used to direct energy, cast circles, and perform ritual work. Traditionally has a black handle and is never used for physical cutting.',
        'The athame became prominent in modern Wicca through Gerald Gardner in the 1950s. Similar ritual knives appear in ceremonial magic traditions like the Key of Solomon. The black handle distinguishes it from the white-handled knife (boline) used for physical cutting.',
        'Represents the element of Air (in some traditions Fire). Symbolizes the masculine principle, will, and directed intention. The blade cuts through negative energy and marks boundaries.',
        'Cast and close magic circles, direct energy during spellwork, invoke elements and deities, cut energetic cords, charge objects, symbolize authority in ritual.',
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
        'elemental', 'Air', 'Universal',
        'A rod used to direct magical energy, invoke deities and elements, and channel will. Often made from wood, but can be crystal, metal, or other materials.',
        'Wands have been used in magic for thousands of years. Ancient Egyptian priests used wands. The ancient Greeks and Romans used wands (caduceus). Medieval grimoires detail wand construction. Each magical tradition has its own wand lore.',
        'Represents Air (or Fire in some traditions). Symbolizes will, power, and authority. The extension of the practitioner''s arm and intention. Channels and directs energy.',
        'Invoke elements and quarters, direct energy in spellwork, channel healing energy, invoke deities, stir potions and brews, trace symbols in the air.',
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
        'elemental', 'Water', 'Universal',
        'A ceremonial cup or goblet representing the element of Water. Used to hold ritual beverages, water, wine, or represent the divine feminine on the altar.',
        'Ritual cups have been sacred for millennia. The Holy Grail of Arthurian legend is a famous magical chalice. Ancient cultures used special vessels for libations to gods. The chalice became central in modern witchcraft and ceremonial magic.',
        'Represents Water element and the womb. Symbolizes the feminine principle, receptivity, intuition, and emotion. The vessel that receives and holds.',
        'Hold ritual beverages for cakes and ale ceremony, contain blessed water, represent Goddess on altar, scrying with water, mixing ritual potions.',
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
        'elemental', 'Earth', 'Western',
        'A disk inscribed with a pentagram (five-pointed star), representing Earth. Used as a working surface for consecrating objects, grounding energy, and altar centerpiece.',
        'The pentagram is one of the oldest magical symbols, used by ancient Greeks and medieval magicians. The pentacle (pentagram within circle) became prominent in ceremonial magic and modern Wicca. Each point represents an element, with Spirit at the top.',
        'Represents Earth element. Symbolizes manifestation, grounding, and protection. The five points represent Earth, Air, Fire, Water, and Spirit. The circle represents wholeness and protection.',
        'Consecrate and charge objects, ground energy, place offerings, charging plate for crystals, protective symbol on altar, focus for Earth energy work.',
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
        'altar', 'Fire', 'Universal',
        'A vessel for burning incense, representing the element of Fire or Air. Used to purify space, create sacred atmosphere, and send prayers and intentions skyward with the smoke.',
        'Incense burners have been used in religious and magical practices worldwide for thousands of years. Ancient Egypt, Greece, Rome, and Asia all had elaborate censers. Churches use thuribles. Burning incense creates sacred space.',
        'Represents Fire (heat and combustion) or Air (rising smoke). The rising smoke carries prayers to the divine. Purifies and sanctifies space. Creates boundary between mundane and sacred.',
        'Burn loose incense or cones, cleanse ritual space, carry around space for purification, burn offerings, create sacred atmosphere, honor deities.',
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
        'altar', 'Water', 'Celtic/Universal',
        'A three-legged pot used for brewing potions, burning offerings, scrying with water, and as a powerful altar tool. Symbol of the Goddess and transformation.',
        'Cauldrons are ancient cooking vessels that became magical symbols. Celtic mythology features magical cauldrons like the Cauldron of Dagda. The witch''s cauldron became iconic in folklore. Represents the womb of the Goddess.',
        'Represents transformation, rebirth, and the womb. The three legs represent the Triple Goddess. Contains and transforms. Where ingredients combine into something new.',
        'Mix and brew potions, burn herbs and offerings, hold water for scrying, simmer ritual brews, burn spell papers safely, fill with water for Goddess ritual.',
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
        'altar', 'Air', 'European',
        'A traditional witch''s broom used to sweep away negative energy and cleanse ritual space. Not used for physical cleaning, but for energetic purification.',
        'Brooms have been magical symbols for centuries. European folklore associates brooms with witches. Jumping the broom is a Celtic handfasting tradition. The besom sweeps away old energy before ritual.',
        'Represents the union of masculine (staff) and feminine (bristles). Sweeps away negative energy and creates clean sacred space. Associated with flight and freedom in folklore.',
        'Sweep ritual space before working, cleanse altar area, sweep away negativity, handfasting ceremonies (jumping the broom), protection when placed by doorway.',
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
        'altar', 'All', 'Wiccan/Modern',
        'A personal journal for recording spells, rituals, correspondences, magical experiences, and wisdom. Your most personal magical tool, containing your unique path and practice.',
        'The term "Book of Shadows" was popularized by Gerald Gardner in the 1950s for Wiccan practice books. Historical grimoires and magical texts served similar purposes for centuries. Each practitioner creates their own.',
        'Represents knowledge, wisdom, and personal power. Contains your magical history and growth. A living document that evolves with your practice.',
        'Record spells and rituals, track moon phases and magical timing, document magical experiments and results, preserve correspondences and recipes, journal spiritual experiences.',
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
