-- =============================================================================
-- GRIMOIRE COLLECTIVE - CANDLE RELATIONSHIPS
-- =============================================================================
-- Purpose: Link candles to their magical properties (intentions), planets, 
--          chakras, and elements using junction tables
-- Dependencies: Requires 09-candle-data.sql to populate candles first
-- =============================================================================

DO $$
DECLARE
    -- Candle IDs
    white_candle_id UUID;
    black_candle_id UUID;
    red_candle_id UUID;
    pink_candle_id UUID;
    green_candle_id UUID;
    blue_candle_id UUID;
    purple_candle_id UUID;
    yellow_candle_id UUID;
    orange_candle_id UUID;
    brown_candle_id UUID;
    
    -- Planet IDs
    moon_planet_id UUID;
    saturn_planet_id UUID;
    mars_planet_id UUID;
    venus_planet_id UUID;
    jupiter_planet_id UUID;
    sun_planet_id UUID;
    
    -- Chakra IDs
    crown_chakra_id UUID;
    root_chakra_id UUID;
    heart_chakra_id UUID;
    throat_chakra_id UUID;
    third_eye_chakra_id UUID;
    solar_plexus_chakra_id UUID;
    sacral_chakra_id UUID;
    
    -- Element IDs (for "All" element reference)
    all_element_id UUID;
    earth_element_id UUID;
    fire_element_id UUID;
    water_element_id UUID;
    air_element_id UUID;
    spirit_element_id UUID;
    
    -- Intention IDs
    purity_id UUID;
    protection_id UUID;
    peace_id UUID;
    truth_id UUID;
    cleansing_id UUID;
    healing_id UUID;
    banishing_id UUID;
    binding_id UUID;
    absorbing_negativity_id UUID;
    hex_breaking_id UUID;
    passion_id UUID;
    love_id UUID;
    courage_id UUID;
    strength_id UUID;
    vitality_id UUID;
    power_id UUID;
    friendship_id UUID;
    compassion_id UUID;
    emotional_healing_id UUID;
    self_love_id UUID;
    romance_id UUID;
    prosperity_id UUID;
    abundance_id UUID;
    money_id UUID;
    growth_id UUID;
    fertility_id UUID;
    luck_id UUID;
    wisdom_id UUID;
    communication_id UUID;
    spirituality_id UUID;
    psychic_abilities_id UUID;
    divination_id UUID;
    connection_to_divine_id UUID;
    success_id UUID;
    confidence_id UUID;
    creativity_id UUID;
    mental_clarity_id UUID;
    joy_id UUID;
    enthusiasm_id UUID;
    attraction_id UUID;
    energy_id UUID;
    ambition_id UUID;
    grounding_id UUID;
    stability_id UUID;
    home_id UUID;
    animals_id UUID;
    material_matters_id UUID;
    endurance_id UUID;
BEGIN

    -- =========================================================================
    -- ADD MISSING INTENTIONS (if they don't already exist)
    -- =========================================================================
    INSERT INTO intentions (name, slug, description, category, keywords, usage_guide)
    VALUES
    -- Protection & Spiritual Purity
    ('Purity', 'purity', 'Spiritual cleanliness and innocence', 'spiritual',
     ARRAY['cleanliness', 'innocence', 'virginity', 'untainted'],
     'Use white candles and clear quartz. Focus on releasing impurities.'),
    ('Truth', 'truth', 'Seeking and speaking honesty', 'spiritual',
     ARRAY['honesty', 'authenticity', 'reality', 'veracity'],
     'Work with blue energy and throat chakra. Speak your truth with clarity.'),
    ('Absorbing Negativity', 'absorbing-negativity', 'Drawing in and neutralizing negative energy', 'protection', 
     ARRAY['absorb', 'neutralize', 'shield', 'negative energy'], 
     'Use with black candles and grounding stones. Visualize negativity being absorbed and transmuted.'),
    -- Healing
    ('Emotional Healing', 'emotional-healing', 'Healing emotional wounds and trauma', 'healing',
     ARRAY['emotional', 'wounds', 'trauma', 'heart healing'],
     'Work gently with heart-centered practices. Combine with self-love and compassion work.'),
    -- Love & Relationships
    ('Romance', 'romance', 'Romantic love and intimate relationships', 'love',
     ARRAY['romantic', 'intimate', 'dating', 'partnership'],
     'Focus on attracting or enhancing romantic connections. Use with Venus energy and rose quartz.'),
    ('Compassion', 'compassion', 'Cultivating empathy and kindness', 'love',
     ARRAY['empathy', 'kindness', 'understanding', 'mercy'],
     'Open your heart to others. Practice loving-kindness meditation.'),
    -- Prosperity
    ('Money', 'money', 'Attracting financial abundance and currency', 'prosperity',
     ARRAY['cash', 'currency', 'dollars', 'financial flow'],
     'Use green candles and citrine. Focus on specific monetary amounts or steady flow.'),
    -- Mental & Growth
    ('Mental Clarity', 'mental-clarity', 'Clear thinking and mental focus', 'growth',
     ARRAY['clarity', 'mental', 'focus', 'clear mind'],
     'Use before important decisions or study. Combine with air element and yellow/blue colors.'),
    ('Joy', 'joy', 'Experiencing happiness and delight', 'emotional',
     ARRAY['happiness', 'delight', 'pleasure', 'celebration'],
     'Celebrate life. Work with sun energy and yellow/orange colors.'),
    ('Enthusiasm', 'enthusiasm', 'Energetic excitement and passion for life', 'emotional',
     ARRAY['excitement', 'passion', 'zest', 'vigor'],
     'Embrace your passions. Channel fire energy for motivation.'),
    ('Attraction', 'attraction', 'Drawing desired people, opportunities, or circumstances', 'manifestation',
     ARRAY['magnetism', 'drawing', 'allure', 'pull'],
     'Focus on what you want to attract. Use visualization and positive energy.'),
    ('Ambition', 'ambition', 'Drive to achieve goals and succeed', 'growth',
     ARRAY['drive', 'determination', 'aspiration', 'goals'],
     'Set clear goals. Use with Mars energy and red/orange candles.'),
    -- Spiritual
    ('Spirituality', 'spirituality', 'Connection to spiritual practice and growth', 'spiritual',
     ARRAY['spiritual practice', 'devotion', 'faith', 'sacred'],
     'Dedicate regular time to spiritual work. Create sacred space.'),
    ('Connection to Divine', 'connection-to-divine', 'Connecting with higher power or deity', 'spiritual',
     ARRAY['divine', 'deity', 'higher power', 'sacred connection'],
     'Create sacred space. Use during meditation or prayer. Work with devotional practices.'),
    -- Prosperity & Material
    ('Material Matters', 'material-matters', 'Physical world concerns and practical needs', 'prosperity',
     ARRAY['practical', 'physical', 'material', 'tangible'],
     'Ground your work in earth energy. Focus on specific, tangible goals.'),
    ('Stability', 'stability', 'Creating lasting foundations and security', 'grounding',
     ARRAY['foundation', 'security', 'steady', 'reliable'],
     'Work with earth element and Saturn energy. Build slowly and steadily.'),
    ('Endurance', 'endurance', 'Stamina and persistence', 'growth',
     ARRAY['stamina', 'persistence', 'lasting', 'durability'],
     'Work with earth energy for lasting results. Practice patience.'),
    -- Home & Nature
    ('Animals', 'animals', 'Working with and honoring animals', 'nature',
     ARRAY['pets', 'animal spirits', 'familiars', 'wildlife'],
     'Honor animal companions. Work with animal spirit guides.')
    ON CONFLICT (slug) DO NOTHING;

    -- =========================================================================
    -- FETCH CANDLE IDs
    -- =========================================================================
    SELECT id INTO white_candle_id FROM candles WHERE slug = 'white-candle';
    SELECT id INTO black_candle_id FROM candles WHERE slug = 'black-candle';
    SELECT id INTO red_candle_id FROM candles WHERE slug = 'red-candle';
    SELECT id INTO pink_candle_id FROM candles WHERE slug = 'pink-candle';
    SELECT id INTO green_candle_id FROM candles WHERE slug = 'green-candle';
    SELECT id INTO blue_candle_id FROM candles WHERE slug = 'blue-candle';
    SELECT id INTO purple_candle_id FROM candles WHERE slug = 'purple-candle';
    SELECT id INTO yellow_candle_id FROM candles WHERE slug = 'yellow-candle';
    SELECT id INTO orange_candle_id FROM candles WHERE slug = 'orange-candle';
    SELECT id INTO brown_candle_id FROM candles WHERE slug = 'brown-candle';

    -- =========================================================================
    -- FETCH PLANET IDs
    -- =========================================================================
    SELECT id INTO moon_planet_id FROM planets WHERE slug = 'moon';
    SELECT id INTO saturn_planet_id FROM planets WHERE slug = 'saturn';
    SELECT id INTO mars_planet_id FROM planets WHERE slug = 'mars';
    SELECT id INTO venus_planet_id FROM planets WHERE slug = 'venus';
    SELECT id INTO jupiter_planet_id FROM planets WHERE slug = 'jupiter';
    SELECT id INTO sun_planet_id FROM planets WHERE slug = 'sun';

    -- =========================================================================
    -- FETCH CHAKRA IDs
    -- =========================================================================
    SELECT id INTO crown_chakra_id FROM chakras WHERE slug = 'crown';
    SELECT id INTO root_chakra_id FROM chakras WHERE slug = 'root';
    SELECT id INTO heart_chakra_id FROM chakras WHERE slug = 'heart';
    SELECT id INTO throat_chakra_id FROM chakras WHERE slug = 'throat';
    SELECT id INTO third_eye_chakra_id FROM chakras WHERE slug = 'third-eye';
    SELECT id INTO solar_plexus_chakra_id FROM chakras WHERE slug = 'solar-plexus';
    SELECT id INTO sacral_chakra_id FROM chakras WHERE slug = 'sacral';

    -- =========================================================================
    -- FETCH ELEMENT IDs
    -- =========================================================================
    SELECT id INTO earth_element_id FROM elements WHERE slug = 'earth';
    SELECT id INTO fire_element_id FROM elements WHERE slug = 'fire';
    SELECT id INTO water_element_id FROM elements WHERE slug = 'water';
    SELECT id INTO air_element_id FROM elements WHERE slug = 'air';
    SELECT id INTO spirit_element_id FROM elements WHERE slug = 'spirit';

    -- =========================================================================
    -- FETCH INTENTION IDs
    -- =========================================================================
    SELECT id INTO purity_id FROM intentions WHERE slug = 'purity';
    SELECT id INTO protection_id FROM intentions WHERE slug = 'protection';
    SELECT id INTO peace_id FROM intentions WHERE slug = 'peace';
    SELECT id INTO truth_id FROM intentions WHERE slug = 'truth';
    SELECT id INTO cleansing_id FROM intentions WHERE slug = 'cleansing';
    SELECT id INTO healing_id FROM intentions WHERE slug = 'healing';
    SELECT id INTO banishing_id FROM intentions WHERE slug = 'banishing';
    SELECT id INTO binding_id FROM intentions WHERE slug = 'binding';
    SELECT id INTO absorbing_negativity_id FROM intentions WHERE slug = 'absorbing-negativity';
    SELECT id INTO hex_breaking_id FROM intentions WHERE slug = 'hex-breaking';
    SELECT id INTO passion_id FROM intentions WHERE slug = 'passion';
    SELECT id INTO love_id FROM intentions WHERE slug = 'love';
    SELECT id INTO courage_id FROM intentions WHERE slug = 'courage';
    SELECT id INTO strength_id FROM intentions WHERE slug = 'strength';
    SELECT id INTO vitality_id FROM intentions WHERE slug = 'vitality';
    SELECT id INTO power_id FROM intentions WHERE slug = 'power';
    SELECT id INTO friendship_id FROM intentions WHERE slug = 'friendship';
    SELECT id INTO compassion_id FROM intentions WHERE slug = 'compassion';
    SELECT id INTO emotional_healing_id FROM intentions WHERE slug = 'emotional-healing';
    SELECT id INTO self_love_id FROM intentions WHERE slug = 'self-love';
    SELECT id INTO romance_id FROM intentions WHERE slug = 'romance';
    SELECT id INTO prosperity_id FROM intentions WHERE slug = 'prosperity';
    SELECT id INTO abundance_id FROM intentions WHERE slug = 'abundance';
    SELECT id INTO money_id FROM intentions WHERE slug = 'money';
    SELECT id INTO growth_id FROM intentions WHERE slug = 'growth';
    SELECT id INTO fertility_id FROM intentions WHERE slug = 'fertility';
    SELECT id INTO luck_id FROM intentions WHERE slug = 'luck';
    SELECT id INTO wisdom_id FROM intentions WHERE slug = 'wisdom';
    SELECT id INTO communication_id FROM intentions WHERE slug = 'communication';
    SELECT id INTO spirituality_id FROM intentions WHERE slug = 'spirituality';
    SELECT id INTO psychic_abilities_id FROM intentions WHERE slug = 'psychic-abilities';
    SELECT id INTO divination_id FROM intentions WHERE slug = 'divination';
    SELECT id INTO connection_to_divine_id FROM intentions WHERE slug = 'connection-to-divine';
    SELECT id INTO success_id FROM intentions WHERE slug = 'success';
    SELECT id INTO confidence_id FROM intentions WHERE slug = 'confidence';
    SELECT id INTO creativity_id FROM intentions WHERE slug = 'creativity';
    SELECT id INTO mental_clarity_id FROM intentions WHERE slug = 'mental-clarity';
    SELECT id INTO joy_id FROM intentions WHERE slug = 'joy';
    SELECT id INTO enthusiasm_id FROM intentions WHERE slug = 'enthusiasm';
    SELECT id INTO attraction_id FROM intentions WHERE slug = 'attraction';
    SELECT id INTO energy_id FROM intentions WHERE slug = 'energy';
    SELECT id INTO ambition_id FROM intentions WHERE slug = 'ambition';
    SELECT id INTO grounding_id FROM intentions WHERE slug = 'grounding';
    SELECT id INTO stability_id FROM intentions WHERE slug = 'stability';
    SELECT id INTO home_id FROM intentions WHERE slug = 'home';
    SELECT id INTO animals_id FROM intentions WHERE slug = 'animals';
    SELECT id INTO material_matters_id FROM intentions WHERE slug = 'material-matters';
    SELECT id INTO endurance_id FROM intentions WHERE slug = 'endurance';

    -- =========================================================================
    -- LINK CANDLES TO PLANETS
    -- =========================================================================
    INSERT INTO entity_planets (entity_type, entity_id, planet_id, notes) VALUES
    ('candle', white_candle_id, moon_planet_id, 'Moon energy brings purity and divine feminine power'),
    ('candle', black_candle_id, saturn_planet_id, 'Saturn provides grounding and binding energy'),
    ('candle', red_candle_id, mars_planet_id, 'Mars energy brings courage and passionate strength'),
    ('candle', pink_candle_id, venus_planet_id, 'Venus governs love, beauty, and emotional harmony'),
    ('candle', green_candle_id, venus_planet_id, 'Venus also rules prosperity and abundance'),
    ('candle', blue_candle_id, moon_planet_id, 'Moon energy brings healing and peace'),
    ('candle', purple_candle_id, jupiter_planet_id, 'Jupiter expands wisdom and spiritual power'),
    ('candle', yellow_candle_id, sun_planet_id, 'Sun energy brings success and mental clarity'),
    ('candle', orange_candle_id, sun_planet_id, 'Sun energy brings enthusiasm and creative power'),
    ('candle', brown_candle_id, saturn_planet_id, 'Saturn brings stability and grounding');

    -- =========================================================================
    -- LINK CANDLES TO CHAKRAS
    -- =========================================================================
    INSERT INTO entity_chakras (entity_type, entity_id, chakra_id, strength) VALUES
    ('candle', white_candle_id, crown_chakra_id, 'primary'),
    ('candle', black_candle_id, root_chakra_id, 'primary'),
    ('candle', red_candle_id, root_chakra_id, 'primary'),
    ('candle', pink_candle_id, heart_chakra_id, 'primary'),
    ('candle', green_candle_id, heart_chakra_id, 'primary'),
    ('candle', blue_candle_id, throat_chakra_id, 'primary'),
    ('candle', purple_candle_id, third_eye_chakra_id, 'primary'),
    ('candle', yellow_candle_id, solar_plexus_chakra_id, 'primary'),
    ('candle', orange_candle_id, sacral_chakra_id, 'primary'),
    ('candle', brown_candle_id, root_chakra_id, 'primary');

    -- =========================================================================
    -- LINK CANDLES TO ELEMENTS (using entity_pairings for element associations)
    -- =========================================================================
    -- White candle: All elements
    INSERT INTO entity_pairings (entity_type_a, entity_id_a, entity_type_b, entity_id_b, pairing_type, strength, purpose) VALUES
    ('candle', white_candle_id, 'element', earth_element_id, 'works-with', 'strong', 'White works with all elements'),
    ('candle', white_candle_id, 'element', fire_element_id, 'works-with', 'strong', 'White works with all elements'),
    ('candle', white_candle_id, 'element', water_element_id, 'works-with', 'strong', 'White works with all elements'),
    ('candle', white_candle_id, 'element', air_element_id, 'works-with', 'strong', 'White works with all elements'),
    ('candle', white_candle_id, 'element', spirit_element_id, 'works-with', 'strong', 'White works with all elements');
    
    -- Black candle: Earth
    INSERT INTO entity_pairings (entity_type_a, entity_id_a, entity_type_b, entity_id_b, pairing_type, strength, purpose) VALUES
    ('candle', black_candle_id, 'element', earth_element_id, 'works-with', 'strong', 'Earth grounds and absorbs');
    
    -- Red candle: Fire
    INSERT INTO entity_pairings (entity_type_a, entity_id_a, entity_type_b, entity_id_b, pairing_type, strength, purpose) VALUES
    ('candle', red_candle_id, 'element', fire_element_id, 'works-with', 'strong', 'Fire brings passion and power');
    
    -- Pink candle: Water
    INSERT INTO entity_pairings (entity_type_a, entity_id_a, entity_type_b, entity_id_b, pairing_type, strength, purpose) VALUES
    ('candle', pink_candle_id, 'element', water_element_id, 'works-with', 'strong', 'Water flows with emotions');
    
    -- Green candle: Earth
    INSERT INTO entity_pairings (entity_type_a, entity_id_a, entity_type_b, entity_id_b, pairing_type, strength, purpose) VALUES
    ('candle', green_candle_id, 'element', earth_element_id, 'works-with', 'strong', 'Earth brings prosperity and growth');
    
    -- Blue candle: Water
    INSERT INTO entity_pairings (entity_type_a, entity_id_a, entity_type_b, entity_id_b, pairing_type, strength, purpose) VALUES
    ('candle', blue_candle_id, 'element', water_element_id, 'works-with', 'strong', 'Water brings peace and healing');
    
    -- Purple candle: Spirit
    INSERT INTO entity_pairings (entity_type_a, entity_id_a, entity_type_b, entity_id_b, pairing_type, strength, purpose) VALUES
    ('candle', purple_candle_id, 'element', spirit_element_id, 'works-with', 'strong', 'Spirit connects to higher realms');
    
    -- Yellow candle: Air
    INSERT INTO entity_pairings (entity_type_a, entity_id_a, entity_type_b, entity_id_b, pairing_type, strength, purpose) VALUES
    ('candle', yellow_candle_id, 'element', air_element_id, 'works-with', 'strong', 'Air brings mental clarity');
    
    -- Orange candle: Fire
    INSERT INTO entity_pairings (entity_type_a, entity_id_a, entity_type_b, entity_id_b, pairing_type, strength, purpose) VALUES
    ('candle', orange_candle_id, 'element', fire_element_id, 'works-with', 'strong', 'Fire brings creative energy');
    
    -- Brown candle: Earth
    INSERT INTO entity_pairings (entity_type_a, entity_id_a, entity_type_b, entity_id_b, pairing_type, strength, purpose) VALUES
    ('candle', brown_candle_id, 'element', earth_element_id, 'works-with', 'strong', 'Earth provides grounding');

    -- =========================================================================
    -- LINK CANDLES TO INTENTIONS (Magical Properties)
    -- =========================================================================
    
    -- WHITE CANDLE: purity, protection, peace, truth, cleansing, healing
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength) VALUES
    ('candle', white_candle_id, purity_id, 'primary'),
    ('candle', white_candle_id, protection_id, 'primary'),
    ('candle', white_candle_id, peace_id, 'primary'),
    ('candle', white_candle_id, truth_id, 'primary'),
    ('candle', white_candle_id, cleansing_id, 'primary'),
    ('candle', white_candle_id, healing_id, 'primary');

    -- BLACK CANDLE: protection, banishing, binding, absorbing_negativity, hex_breaking
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength) VALUES
    ('candle', black_candle_id, protection_id, 'primary'),
    ('candle', black_candle_id, banishing_id, 'primary'),
    ('candle', black_candle_id, binding_id, 'primary'),
    ('candle', black_candle_id, absorbing_negativity_id, 'primary'),
    ('candle', black_candle_id, hex_breaking_id, 'primary');

    -- RED CANDLE: passion, love, courage, strength, vitality, power
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength) VALUES
    ('candle', red_candle_id, passion_id, 'primary'),
    ('candle', red_candle_id, love_id, 'primary'),
    ('candle', red_candle_id, courage_id, 'primary'),
    ('candle', red_candle_id, strength_id, 'primary'),
    ('candle', red_candle_id, vitality_id, 'primary'),
    ('candle', red_candle_id, power_id, 'primary');

    -- PINK CANDLE: love, friendship, compassion, emotional_healing, self_love, romance
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength) VALUES
    ('candle', pink_candle_id, love_id, 'primary'),
    ('candle', pink_candle_id, friendship_id, 'primary'),
    ('candle', pink_candle_id, compassion_id, 'primary'),
    ('candle', pink_candle_id, emotional_healing_id, 'primary'),
    ('candle', pink_candle_id, self_love_id, 'primary'),
    ('candle', pink_candle_id, romance_id, 'primary');

    -- GREEN CANDLE: prosperity, abundance, money, growth, fertility, luck
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength) VALUES
    ('candle', green_candle_id, prosperity_id, 'primary'),
    ('candle', green_candle_id, abundance_id, 'primary'),
    ('candle', green_candle_id, money_id, 'primary'),
    ('candle', green_candle_id, growth_id, 'primary'),
    ('candle', green_candle_id, fertility_id, 'primary'),
    ('candle', green_candle_id, luck_id, 'primary');

    -- BLUE CANDLE: peace, healing, truth, wisdom, protection, communication
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength) VALUES
    ('candle', blue_candle_id, peace_id, 'primary'),
    ('candle', blue_candle_id, healing_id, 'primary'),
    ('candle', blue_candle_id, truth_id, 'primary'),
    ('candle', blue_candle_id, wisdom_id, 'primary'),
    ('candle', blue_candle_id, protection_id, 'primary'),
    ('candle', blue_candle_id, communication_id, 'primary');

    -- PURPLE CANDLE: spirituality, psychic_abilities, wisdom, power, divination, connection_to_divine
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength) VALUES
    ('candle', purple_candle_id, spirituality_id, 'primary'),
    ('candle', purple_candle_id, psychic_abilities_id, 'primary'),
    ('candle', purple_candle_id, wisdom_id, 'primary'),
    ('candle', purple_candle_id, power_id, 'primary'),
    ('candle', purple_candle_id, divination_id, 'primary'),
    ('candle', purple_candle_id, connection_to_divine_id, 'primary');

    -- YELLOW CANDLE: success, confidence, creativity, mental_clarity, communication, joy
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength) VALUES
    ('candle', yellow_candle_id, success_id, 'primary'),
    ('candle', yellow_candle_id, confidence_id, 'primary'),
    ('candle', yellow_candle_id, creativity_id, 'primary'),
    ('candle', yellow_candle_id, mental_clarity_id, 'primary'),
    ('candle', yellow_candle_id, communication_id, 'primary'),
    ('candle', yellow_candle_id, joy_id, 'primary');

    -- ORANGE CANDLE: creativity, enthusiasm, attraction, success, energy, ambition
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength) VALUES
    ('candle', orange_candle_id, creativity_id, 'primary'),
    ('candle', orange_candle_id, enthusiasm_id, 'primary'),
    ('candle', orange_candle_id, attraction_id, 'primary'),
    ('candle', orange_candle_id, success_id, 'primary'),
    ('candle', orange_candle_id, energy_id, 'primary'),
    ('candle', orange_candle_id, ambition_id, 'primary');

    -- BROWN CANDLE: grounding, stability, home, animals, material_matters, endurance
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength) VALUES
    ('candle', brown_candle_id, grounding_id, 'primary'),
    ('candle', brown_candle_id, stability_id, 'primary'),
    ('candle', brown_candle_id, home_id, 'primary'),
    ('candle', brown_candle_id, animals_id, 'primary'),
    ('candle', brown_candle_id, material_matters_id, 'primary'),
    ('candle', brown_candle_id, endurance_id, 'primary');

    RAISE NOTICE 'Candle relationships created successfully';
    RAISE NOTICE '- 10 candles linked to planets';
    RAISE NOTICE '- 10 candles linked to chakras';
    RAISE NOTICE '- 10 candles linked to elements (14 total element associations)';
    RAISE NOTICE '- 10 candles linked to 59 intention relationships';

END $$;
