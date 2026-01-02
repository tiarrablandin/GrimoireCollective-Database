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
    
    INSERT INTO divination_methods (
        name, slug, alternative_names, method_type, difficulty_level,
        description, history, how_to_use, interpretation_guide,
        best_for,
        created_by, is_verified
    ) VALUES
    
    -- Astrology
    (
        'Astrology', 'astrology', ARRAY['Natal Chart Reading', 'Horoscopes', 'Astrological Divination'],
        'celestial divination', 'advanced',
        'The study of celestial bodies and their influence on human affairs and natural phenomena. Uses birth charts, planetary transits, and zodiac signs to gain insight.',
        'Astrology dates back to ancient Babylon (2nd millennium BCE). Developed independently in various cultures including Greek, Vedic, Chinese, and Mayan. Modern Western astrology is based on Hellenistic traditions.',
        'Create a natal chart using exact birth time, date, and location. Study the positions of planets in signs and houses. Examine aspects (angles) between planets. Consider current transits and progressions for timing.',
        'The 12 zodiac signs represent archetypes. The 12 houses represent life areas. Planets represent different energies and drives. Aspects show how planetary energies interact. Transits show current influences.',
        ARRAY['personality insight', 'timing decisions', 'relationship compatibility', 'life path guidance', 'understanding patterns'],
        admin_user_id, TRUE
    ),
    
    -- I Ching
    (
        'I Ching', 'i-ching', ARRAY['Book of Changes', 'Yi Jing', 'Chinese Oracle'],
        'bibliomancy', 'intermediate',
        'Ancient Chinese divination text using 64 hexagrams. Cast coins or yarrow stalks to generate a hexagram, then read its wisdom and guidance.',
        'The I Ching originated in ancient China over 3,000 years ago. Used by Confucius and generations of scholars. One of the oldest systems of divination still in use today.',
        'Focus on your question. Toss three coins six times (or use yarrow stalks) to build a hexagram from bottom up. Note any changing lines. Look up the hexagram number and read its text. Changing lines transform to a second hexagram showing future development.',
        'Each hexagram has a name, judgment, and image. The six lines can be yin (broken) or yang (solid). Changing lines indicate transformation. Read primary hexagram for present, secondary for future. The text speaks in metaphor and symbolism.',
        ARRAY['philosophical guidance', 'decision making', 'understanding change', 'spiritual wisdom', 'complex situations'],
        admin_user_id, TRUE
    ),
    
    -- Numerology
    (
        'Numerology', 'numerology', ARRAY['Number Divination', 'Pythagorean Numerology'],
        'numeric divination', 'beginner',
        'The study of numbers and their mystical significance. Uses birth dates and names converted to numbers to reveal personality traits, life path, and destiny.',
        'Numerology has roots in ancient Greece (Pythagoras), Hebrew Kabbalah, and other mystical traditions. Modern numerology was popularized in the early 20th century.',
        'Convert letters to numbers using A=1, B=2, etc. Add digits until you get a single digit (1-9) or master number (11, 22, 33). Calculate Life Path (birth date), Expression (full name), Soul Urge (vowels), and Personality (consonants) numbers.',
        'Each number 1-9 has specific meanings: 1=leader, 2=diplomat, 3=creative, 4=builder, 5=freedom, 6=nurturer, 7=seeker, 8=power, 9=humanitarian. Master numbers (11, 22, 33) are not reduced and carry special spiritual significance.',
        ARRAY['personality analysis', 'life purpose', 'name meanings', 'compatibility', 'understanding cycles'],
        admin_user_id, TRUE
    ),
    
    -- Palmistry
    (
        'Palmistry', 'palmistry', ARRAY['Palm Reading', 'Chiromancy', 'Hand Analysis'],
        'body divination', 'intermediate',
        'Reading the lines, mounts, and shapes of the palm to gain insight into personality, potential, and life events. Each hand tells a different story.',
        'Palmistry has been practiced for thousands of years in India, China, Tibet, and Persia. Spread to Europe during the Middle Ages. Gained popularity in Victorian era.',
        'Examine both hands - the non-dominant shows potential, dominant shows current reality. Study the major lines (heart, head, life, fate). Examine mounts (raised areas under fingers). Note hand shape, finger length, and flexibility.',
        'Heart line shows emotions and relationships. Head line shows thinking and intellect. Life line shows vitality and life changes (not length of life). Fate line shows career and life direction. Mounts relate to planets and show strengths.',
        ARRAY['personality insight', 'relationship patterns', 'career guidance', 'health indicators', 'life path'],
        admin_user_id, TRUE
    ),
    
    -- Tea Leaf Reading
    (
        'Tea Leaf Reading', 'tasseography', ARRAY['Tasseomancy', 'Tea Leaf Divination', 'Tasseography'],
        'divination tool', 'beginner',
        'Reading symbols and patterns formed by tea leaves in a cup. The arrangement of leaves reveals messages about past, present, and future.',
        'Tea leaf reading became popular in Europe and America in the 19th century after tea became widely available. Has roots in ancient Chinese tea culture and fortune telling traditions.',
        'Brew loose leaf tea and drink, leaving a small amount of liquid with the leaves. Swirl the cup three times clockwise, then turn it upside down on a saucer. Turn it back up and read the patterns formed by the leaves.',
        'Symbols near the rim represent the near future, bottom represents distant future or past. Handle area represents the querent and home. Look for recognizable shapes, symbols, letters, or numbers. Trust your intuition.',
        ARRAY['casual divination', 'quick insights', 'social readings', 'intuitive practice', 'daily guidance'],
        admin_user_id, TRUE
    ),
    
    -- Oracle Cards
    (
        'Oracle Cards', 'oracle-cards', ARRAY['Oracle Deck Reading', 'Angel Cards', 'Affirmation Cards'],
        'cartomancy', 'beginner',
        'Similar to tarot but with more freedom and variety. Oracle decks have their own themes and number of cards. Each deck comes with its own guidebook and meanings.',
        'Oracle cards emerged in the late 20th century as a more accessible alternative to tarot. Decks can focus on angels, goddesses, animals, affirmations, or any theme.',
        'Shuffle the deck while focusing on your question. Draw one or more cards intuitively. Read the card meanings from the guidebook or trust your intuition. Some decks work well with tarot spreads.',
        'Unlike tarot, there is no standard structure. Each deck is unique. Cards typically have uplifting, direct messages. Focus on the imagery and your intuitive response. Consult the guidebook for additional insight.',
        ARRAY['daily guidance', 'affirmations', 'gentle messages', 'specific themes', 'beginner-friendly'],
        admin_user_id, TRUE
    ),
    
    -- Bibliomancy
    (
        'Bibliomancy', 'bibliomancy', ARRAY['Book Divination', 'Stichomancy', 'Bible Dipping'],
        'bibliomancy', 'beginner',
        'Opening a book at random and reading the passage as guidance. Can be done with any meaningful text - religious texts, poetry, novels, or oracle books.',
        'Bibliomancy has been practiced since ancient times with sacred texts. The Sortes Virgilianae (using Virgil''s works) was popular in Rome. Bible divination was common in Christian traditions.',
        'Hold your question in mind. Close your eyes and open the book randomly. Point to a passage or read the first thing your eyes fall on. Read that passage as your message.',
        'The passage may be literal or metaphorical. Consider how it relates to your question. What stands out to you? What emotions does it evoke? Trust synchronicity and meaningful coincidence.',
        ARRAY['spiritual guidance', 'synchronicity', 'simple answers', 'working with sacred texts', 'daily inspiration'],
        admin_user_id, TRUE
    ),
    
    -- Bone Casting
    (
        'Bone Casting', 'bone-casting', ARRAY['Osteomancy', 'Bone Reading', 'Throwing the Bones'],
        'lithomancy', 'advanced',
        'Casting bones, shells, stones, and other objects onto a surface and reading their patterns. Each object has specific meanings and their relationships tell a story.',
        'Bone casting is one of the oldest forms of divination, practiced in African, Indigenous, and ancient cultures worldwide. Traditional healers and shamans used bones from animals, along with shells, stones, and other sacred objects.',
        'Create or obtain a bone set with meaningful objects. Cast them onto a cloth or in a circle. Read based on position (near/far, direction), which bones touch, which land face up, and overall pattern.',
        'Each bone or object has assigned meanings (e.g., love, money, health, danger). Proximity shows connection. Direction shows movement or influence. Pattern shapes (triangle, line, cluster) add meaning. Intuition is key.',
        ARRAY['ancestral wisdom', 'complex questions', 'traditional practices', 'shamanic work', 'deep insight'],
        admin_user_id, TRUE
    ),
    
    -- Crystal Ball Gazing
    (
        'Crystal Ball Gazing', 'crystal-ball', ARRAY['Crystal Scrying', 'Crystallomancy', 'Spheromancy'],
        'scrying', 'advanced',
        'A specific form of scrying using a crystal sphere. Gaze into the clear or cloudy crystal to receive visions, symbols, and messages.',
        'Crystal balls have been used for divination for millennia. Associated with Druids, medieval seers, and Romani fortune tellers. John Dee famously used one in Elizabethan England.',
        'Set up in dim light. Gaze into the crystal ball without staring hard. Let your vision soften. Watch for clouds, colors, symbols, or images that form within or appear to your mind''s eye.',
        'Images may appear physically in the crystal or in your mind. Clouds forming indicate activity. Colors have meaning (white=good, black=challenges, etc.). Symbols and scenes should be interpreted intuitively.',
        ARRAY['psychic development', 'future sight', 'spirit communication', 'meditation', 'mystical practice'],
        admin_user_id, TRUE
    ),
    
    -- Cartomancy (Playing Cards)
    (
        'Cartomancy', 'cartomancy-playing', ARRAY['Playing Card Reading', 'Card Divination'],
        'cartomancy', 'beginner',
        'Divination using regular playing cards. Each suit and number has specific meanings. Can be read similarly to tarot with spreads and combinations.',
        'Playing card divination predates tarot and has been used across Europe for centuries. Each suit corresponds to elements and life areas similar to tarot.',
        'Use a standard 52-card deck. Assign meanings to suits (Hearts=love, Clubs=work, Diamonds=money, Spades=challenges). Shuffle and draw cards in spreads. Read combinations and patterns.',
        'Hearts relate to emotions and relationships. Clubs to career and growth. Diamonds to finances and material matters. Spades to challenges and endings. Numbers 1-10 and face cards each have meanings.',
        ARRAY['accessible divination', 'no special tools needed', 'quick readings', 'traditional practice'],
        admin_user_id, TRUE
    ),
    
    -- Pendulum Charts
    (
        'Pendulum Charts', 'pendulum-charts', ARRAY['Chart Dowsing', 'Pendulum Boards'],
        'divination tool', 'beginner',
        'Using a pendulum over charts, wheels, or boards to get more detailed answers beyond yes/no. Charts can show letters, numbers, options, or complex information.',
        'Developed as an extension of simple pendulum dowsing to get more detailed information. Became popular in mid-20th century with various chart designs.',
        'Hold pendulum over the center of a chart. Ask your question. Watch which direction the pendulum swings toward. It will point to or circle around the answer on the chart.',
        'Start with simple charts before complex ones. Common types include: percentage wheels, letter boards for messages, chakra charts, body charts for healing, direction/map charts.',
        ARRAY['detailed answers', 'multiple choice questions', 'healing work', 'receiving messages', 'chart work'],
        admin_user_id, TRUE
    ),
    
    -- Automatic Writing
    (
        'Automatic Writing', 'automatic-writing', ARRAY['Spirit Writing', 'Psychography', 'Channeled Writing'],
        'mediumship', 'intermediate',
        'Writing that comes through you without conscious thought. The pen moves automatically, channeling messages from your higher self, spirit guides, or subconscious.',
        'Automatic writing gained popularity in the Spiritualist movement of the 19th century. Mediums would enter trance states to receive messages. Now used for personal guidance and creativity.',
        'Sit quietly with paper and pen (or keyboard). Set an intention or ask a question. Clear your mind and let your hand write without thinking. Don''t edit or analyze while writing. Read the message afterward.',
        'Handwriting may look different from normal. Messages may be cryptic or metaphorical. Don''t force it - let it flow naturally. With practice, clarity improves. Can be used for guidance, creativity, or spirit communication.',
        ARRAY['channeling messages', 'creative inspiration', 'subconscious access', 'spirit communication', 'personal guidance'],
        admin_user_id, TRUE
    );
    
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
    
    -- Add more spreads for other divination methods
    DECLARE
        astrology_id UUID;
        iching_id UUID;
        oracle_id UUID;
        cartomancy_id UUID;
        palmistry_id UUID;
    BEGIN
        SELECT id INTO astrology_id FROM divination_methods WHERE slug = 'astrology';
        SELECT id INTO iching_id FROM divination_methods WHERE slug = 'i-ching';
        SELECT id INTO oracle_id FROM divination_methods WHERE slug = 'oracle-cards';
        SELECT id INTO cartomancy_id FROM divination_methods WHERE slug = 'cartomancy-playing';
        SELECT id INTO palmistry_id FROM divination_methods WHERE slug = 'palmistry';
        
        -- Oracle card spreads
        INSERT INTO divination_spreads (
            name, slug, divination_method_id, description, position_count,
            positions, layout_diagram, difficulty_level, best_for, interpretation_tips,
            created_by, is_verified
        ) VALUES
        (
            'Single Card Pull', 'single-oracle', oracle_id,
            'Draw one oracle card for daily guidance or a quick answer to a question.',
            1,
            '[
                {"position": 1, "name": "Message", "meaning": "The guidance or message for your question"}
            ]'::jsonb,
            'Card 1',
            'beginner',
            ARRAY['daily guidance', 'quick answers', 'affirmations', 'beginner practice'],
            'Focus on your question or intention. Trust your first impression of the card. Read the guidebook message but also notice your intuitive response.',
            admin_user_id, TRUE
        ),
        (
            'Mind Body Spirit Spread', 'mind-body-spirit', oracle_id,
            'Three card spread examining mental, physical, and spiritual aspects.',
            3,
            '[
                {"position": 1, "name": "Mind", "meaning": "Mental state, thoughts, or intellectual guidance"},
                {"position": 2, "name": "Body", "meaning": "Physical health, material matters, or grounding"},
                {"position": 3, "name": "Spirit", "meaning": "Spiritual guidance, higher self, or soul purpose"}
            ]'::jsonb,
            'Mind  Body  Spirit',
            'beginner',
            ARRAY['holistic guidance', 'self-care', 'balance check', 'wellness readings'],
            'Consider how all three areas interact. Look for imbalances or where attention is needed.',
            admin_user_id, TRUE
        ),
        
        -- Playing card spreads
        (
            'Five Card Horseshoe', 'five-card-horseshoe', cartomancy_id,
            'Versatile five card spread shaped like a horseshoe, reading influences from past to future.',
            5,
            '[
                {"position": 1, "name": "Past", "meaning": "Past influences affecting the situation"},
                {"position": 2, "name": "Present", "meaning": "Current situation"},
                {"position": 3, "name": "Hidden Influences", "meaning": "Unknown factors at play"},
                {"position": 4, "name": "Advice", "meaning": "Recommended approach or action"},
                {"position": 5, "name": "Outcome", "meaning": "Likely result"}
            ]'::jsonb,
            E'    5\n   / \\\n  4   1\n  3   2',
            'intermediate',
            ARRAY['life questions', 'decision making', 'understanding situations', 'general readings'],
            'Red cards (Hearts/Diamonds) are generally positive. Black cards (Spades/Clubs) indicate challenges or changes. Face cards can represent people.',
            admin_user_id, TRUE
        ),
        (
            'Seven Card Week Ahead', 'week-ahead-playing', cartomancy_id,
            'Draw seven cards to see the energy of each day of the upcoming week.',
            7,
            '[
                {"position": 1, "name": "Monday", "meaning": "Monday energy and guidance"},
                {"position": 2, "name": "Tuesday", "meaning": "Tuesday energy and guidance"},
                {"position": 3, "name": "Wednesday", "meaning": "Wednesday energy and guidance"},
                {"position": 4, "name": "Thursday", "meaning": "Thursday energy and guidance"},
                {"position": 5, "name": "Friday", "meaning": "Friday energy and guidance"},
                {"position": 6, "name": "Saturday", "meaning": "Saturday energy and guidance"},
                {"position": 7, "name": "Sunday", "meaning": "Sunday energy and guidance"}
            ]'::jsonb,
            'Mon Tue Wed Thu Fri Sat Sun',
            'beginner',
            ARRAY['weekly planning', 'time-based readings', 'daily guidance', 'scheduling'],
            'Look for patterns across the week. Note which days have multiple positive or challenging cards.',
            admin_user_id, TRUE
        ),
        
        -- Tarot spreads - add more
        (
            'Relationship Spread', 'relationship-tarot', tarot_id,
            'Seven card spread examining the dynamics of a relationship.',
            7,
            '[
                {"position": 1, "name": "You", "meaning": "Your position and feelings"},
                {"position": 2, "name": "The Other", "meaning": "Their position and feelings"},
                {"position": 3, "name": "Connection", "meaning": "The energy between you"},
                {"position": 4, "name": "Challenges", "meaning": "What stands in the way"},
                {"position": 5, "name": "Advice for You", "meaning": "What you need to understand"},
                {"position": 6, "name": "Advice for Them", "meaning": "What they need to understand"},
                {"position": 7, "name": "Outcome", "meaning": "Where the relationship is heading"}
            ]'::jsonb,
            E'      3\n     / \\\n    1   2\n    |   |\n    5   6\n       4\n       7',
            'intermediate',
            ARRAY['relationships', 'partnerships', 'connection insight', 'love readings'],
            'Pay attention to how cards 1 and 2 relate. Card 3 shows the dynamic between you. Cards 5 and 6 show individual work needed.',
            admin_user_id, TRUE
        ),
        (
            'Year Ahead Spread', 'year-ahead-tarot', tarot_id,
            'Thirteen card spread showing the themes for the year ahead - one card per month plus an overall theme.',
            13,
            '[
                {"position": 1, "name": "Overall Theme", "meaning": "The overarching energy of the year"},
                {"position": 2, "name": "Month 1", "meaning": "First month energy"},
                {"position": 3, "name": "Month 2", "meaning": "Second month energy"},
                {"position": 4, "name": "Month 3", "meaning": "Third month energy"},
                {"position": 5, "name": "Month 4", "meaning": "Fourth month energy"},
                {"position": 6, "name": "Month 5", "meaning": "Fifth month energy"},
                {"position": 7, "name": "Month 6", "meaning": "Sixth month energy"},
                {"position": 8, "name": "Month 7", "meaning": "Seventh month energy"},
                {"position": 9, "name": "Month 8", "meaning": "Eighth month energy"},
                {"position": 10, "name": "Month 9", "meaning": "Ninth month energy"},
                {"position": 11, "name": "Month 10", "meaning": "Tenth month energy"},
                {"position": 12, "name": "Month 11", "meaning": "Eleventh month energy"},
                {"position": 13, "name": "Month 12", "meaning": "Twelfth month energy"}
            ]'::jsonb,
            E'        1\n   2 3 4 5 6 7\n   8 9 10 11 12 13',
            'advanced',
            ARRAY['annual planning', 'birthday readings', 'yearly forecast', 'big picture insight'],
            'Card 1 is the theme that weaves through the whole year. Look for patterns in the monthly cards - which suits or numbers repeat?',
            admin_user_id, TRUE
        ),
        (
            'Career Path Spread', 'career-path-tarot', tarot_id,
            'Five card spread for career guidance and professional direction.',
            5,
            '[
                {"position": 1, "name": "Current Situation", "meaning": "Your current career position"},
                {"position": 2, "name": "Challenges", "meaning": "Obstacles or difficulties"},
                {"position": 3, "name": "Strengths", "meaning": "Your skills and advantages"},
                {"position": 4, "name": "Advice", "meaning": "Recommended action or focus"},
                {"position": 5, "name": "Outcome", "meaning": "Where this path leads"}
            ]'::jsonb,
            E'    3\n  2 1 4\n    5',
            'intermediate',
            ARRAY['career questions', 'professional development', 'job decisions', 'business guidance'],
            'Pentacles show financial success, Wands show growth and creativity, Swords show challenges or communication, Cups show fulfillment.',
            admin_user_id, TRUE
        );
        
    END;

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
