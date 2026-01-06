-- =============================================================================
-- GRIMOIRE COLLECTIVE - HERB ENTITY RELATIONSHIPS (PART 1)
-- =============================================================================
-- Purpose: Entity relationships for herbs (intentions and elements)
-- Dependencies: Requires 20-herb-data.sql
-- Part 1: First 15 herbs (Agrimony through Clove)
-- =============================================================================

DO $$
DECLARE
    -- Herb IDs (First 15)
    agrimony_id UUID;
    angelica_id UUID;
    basil_id UUID;
    bay_laurel_id UUID;
    bergamot_id UUID;
    blackberry_id UUID;
    blessed_thistle_id UUID;
    calendula_id UUID;
    catnip_id UUID;
    cedar_id UUID;
    chamomile_id UUID;
    cinnamon_id UUID;
    clove_id UUID;
    coltsfoot_id UUID;
    comfrey_id UUID;
    
    -- Intention IDs
    love_id UUID;
    protection_id UUID;
    healing_id UUID;
    prosperity_id UUID;
    purification_id UUID;
    sleep_id UUID;
    peace_id UUID;
    divination_id UUID;
    courage_id UUID;
    clarity_id UUID;
    abundance_id UUID;
    grounding_id UUID;
    communication_id UUID;
    success_id UUID;
    strength_id UUID;
    wisdom_id UUID;
    banishing_id UUID;
    beauty_id UUID;
    creativity_id UUID;
    energy_id UUID;
    psychic_id UUID;
    
    -- Element IDs
    fire_id UUID;
    water_id UUID;
    earth_id UUID;
    air_id UUID;
    spirit_id UUID;
    
BEGIN
    -- Get Herb IDs
    SELECT id INTO agrimony_id FROM herbs WHERE slug = 'agrimony';
    SELECT id INTO angelica_id FROM herbs WHERE slug = 'angelica';
    SELECT id INTO basil_id FROM herbs WHERE slug = 'basil';
    SELECT id INTO bay_laurel_id FROM herbs WHERE slug = 'bay-laurel';
    SELECT id INTO bergamot_id FROM herbs WHERE slug = 'bergamot';
    SELECT id INTO blackberry_id FROM herbs WHERE slug = 'blackberry';
    SELECT id INTO blessed_thistle_id FROM herbs WHERE slug = 'blessed-thistle';
    SELECT id INTO calendula_id FROM herbs WHERE slug = 'calendula';
    SELECT id INTO catnip_id FROM herbs WHERE slug = 'catnip';
    SELECT id INTO cedar_id FROM herbs WHERE slug = 'cedar';
    SELECT id INTO chamomile_id FROM herbs WHERE slug = 'chamomile';
    SELECT id INTO cinnamon_id FROM herbs WHERE slug = 'cinnamon';
    SELECT id INTO clove_id FROM herbs WHERE slug = 'clove';
    SELECT id INTO coltsfoot_id FROM herbs WHERE slug = 'coltsfoot';
    SELECT id INTO comfrey_id FROM herbs WHERE slug = 'comfrey';
    
    -- Get Intention IDs
    SELECT id INTO love_id FROM intentions WHERE name = 'Love';
    SELECT id INTO protection_id FROM intentions WHERE name = 'Protection';
    SELECT id INTO healing_id FROM intentions WHERE name = 'Healing';
    SELECT id INTO prosperity_id FROM intentions WHERE name = 'Prosperity';
    SELECT id INTO purification_id FROM intentions WHERE name = 'Purification';
    SELECT id INTO sleep_id FROM intentions WHERE name = 'Sleep';
    SELECT id INTO peace_id FROM intentions WHERE name = 'Peace';
    SELECT id INTO divination_id FROM intentions WHERE name = 'Divination';
    SELECT id INTO courage_id FROM intentions WHERE name = 'Courage';
    SELECT id INTO clarity_id FROM intentions WHERE name = 'Clarity';
    SELECT id INTO abundance_id FROM intentions WHERE name = 'Abundance';
    SELECT id INTO grounding_id FROM intentions WHERE name = 'Grounding';
    SELECT id INTO communication_id FROM intentions WHERE name = 'Communication';
    SELECT id INTO success_id FROM intentions WHERE name = 'Success';
    SELECT id INTO strength_id FROM intentions WHERE name = 'Strength';
    SELECT id INTO wisdom_id FROM intentions WHERE name = 'Wisdom';
    SELECT id INTO banishing_id FROM intentions WHERE name = 'Banishing';
    SELECT id INTO beauty_id FROM intentions WHERE name = 'Beauty';
    SELECT id INTO creativity_id FROM intentions WHERE name = 'Creativity';
    SELECT id INTO energy_id FROM intentions WHERE name = 'Energy';
    SELECT id INTO psychic_id FROM intentions WHERE name = 'Psychic Abilities';
    
    -- Get Element IDs
    SELECT id INTO fire_id FROM elements WHERE name = 'Fire';
    SELECT id INTO water_id FROM elements WHERE name = 'Water';
    SELECT id INTO earth_id FROM elements WHERE name = 'Earth';
    SELECT id INTO air_id FROM elements WHERE name = 'Air';
    SELECT id INTO spirit_id FROM elements WHERE name = 'Spirit';
    
    -- =============================================================================
    -- AGRIMONY - Protection, banishing, healing
    -- =============================================================================
    
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength, notes)
    VALUES 
        ('herb', agrimony_id, protection_id, 'primary', 'Returns negative energy to sender'),
        ('herb', agrimony_id, banishing_id, 'strong', 'Breaks hexes and curses'),
        ('herb', agrimony_id, healing_id, 'moderate', 'Supports sleep and emotional healing');
    
    INSERT INTO entity_elements (entity_type, entity_id, element_id, is_primary, strength)
    VALUES 
        ('herb', agrimony_id, air_id, true, 'primary'),
        ('herb', agrimony_id, earth_id, false, 'moderate');
    
    -- =============================================================================
    -- ANGELICA - Protection, purification, healing
    -- =============================================================================
    
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength, notes)
    VALUES 
        ('herb', angelica_id, protection_id, 'primary', 'Powerful protective guardian herb'),
        ('herb', angelica_id, purification_id, 'strong', 'Cleanses spaces and energy'),
        ('herb', angelica_id, healing_id, 'strong', 'Associated with angelic healing'),
        ('herb', angelica_id, courage_id, 'moderate', 'Provides spiritual courage');
    
    INSERT INTO entity_elements (entity_type, entity_id, element_id, is_primary, strength)
    VALUES 
        ('herb', angelica_id, fire_id, true, 'primary'),
        ('herb', angelica_id, air_id, false, 'moderate');
    
    -- =============================================================================
    -- BASIL - Love, prosperity, protection
    -- =============================================================================
    
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength, notes)
    VALUES 
        ('herb', basil_id, prosperity_id, 'primary', 'Attracts wealth and success'),
        ('herb', basil_id, love_id, 'strong', 'Promotes fidelity and passion'),
        ('herb', basil_id, protection_id, 'strong', 'Guards against negative energy'),
        ('herb', basil_id, purification_id, 'moderate', 'Cleanses ritual spaces');
    
    INSERT INTO entity_elements (entity_type, entity_id, element_id, is_primary, strength)
    VALUES 
        ('herb', basil_id, fire_id, true, 'primary');
    
    -- =============================================================================
    -- BAY LAUREL - Success, wisdom, divination
    -- =============================================================================
    
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength, notes)
    VALUES 
        ('herb', bay_laurel_id, success_id, 'primary', 'Crown of victory and achievement'),
        ('herb', bay_laurel_id, wisdom_id, 'strong', 'Apollo''s herb of prophecy'),
        ('herb', bay_laurel_id, divination_id, 'strong', 'Enhances psychic visions'),
        ('herb', bay_laurel_id, protection_id, 'moderate', 'Wards against lightning and evil'),
        ('herb', bay_laurel_id, psychic_id, 'strong', 'Strengthens prophetic dreams');
    
    INSERT INTO entity_elements (entity_type, entity_id, element_id, is_primary, strength)
    VALUES 
        ('herb', bay_laurel_id, fire_id, true, 'primary'),
        ('herb', bay_laurel_id, air_id, false, 'moderate');
    
    -- =============================================================================
    -- BERGAMOT - Prosperity, success, clarity
    -- =============================================================================
    
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength, notes)
    VALUES 
        ('herb', bergamot_id, prosperity_id, 'primary', 'Attracts money and opportunities'),
        ('herb', bergamot_id, success_id, 'strong', 'Ensures success in endeavors'),
        ('herb', bergamot_id, clarity_id, 'moderate', 'Clears mental fog'),
        ('herb', bergamot_id, abundance_id, 'strong', 'Opens doors to abundance');
    
    INSERT INTO entity_elements (entity_type, entity_id, element_id, is_primary, strength)
    VALUES 
        ('herb', bergamot_id, fire_id, true, 'primary'),
        ('herb', bergamot_id, air_id, false, 'moderate');
    
    -- =============================================================================
    -- BLACKBERRY - Prosperity, protection, abundance
    -- =============================================================================
    
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength, notes)
    VALUES 
        ('herb', blackberry_id, prosperity_id, 'primary', 'Sacred to harvest and abundance'),
        ('herb', blackberry_id, protection_id, 'strong', 'Thorns ward off negativity'),
        ('herb', blackberry_id, abundance_id, 'primary', 'Represents nature''s bounty'),
        ('herb', blackberry_id, healing_id, 'moderate', 'Used in folk healing');
    
    INSERT INTO entity_elements (entity_type, entity_id, element_id, is_primary, strength)
    VALUES 
        ('herb', blackberry_id, earth_id, true, 'primary'),
        ('herb', blackberry_id, water_id, false, 'moderate');
    
    -- =============================================================================
    -- BLESSED THISTLE - Protection, purification, strength
    -- =============================================================================
    
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength, notes)
    VALUES 
        ('herb', blessed_thistle_id, protection_id, 'primary', 'Blessed for sacred protection'),
        ('herb', blessed_thistle_id, purification_id, 'strong', 'Consecrates sacred spaces'),
        ('herb', blessed_thistle_id, strength_id, 'strong', 'Provides spiritual fortitude'),
        ('herb', blessed_thistle_id, courage_id, 'moderate', 'Strengthens resolve');
    
    INSERT INTO entity_elements (entity_type, entity_id, element_id, is_primary, strength)
    VALUES 
        ('herb', blessed_thistle_id, fire_id, true, 'primary'),
        ('herb', blessed_thistle_id, earth_id, false, 'moderate');
    
    -- =============================================================================
    -- CALENDULA - Healing, protection, success
    -- =============================================================================
    
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength, notes)
    VALUES 
        ('herb', calendula_id, healing_id, 'primary', 'Powerful healing for skin and spirit'),
        ('herb', calendula_id, protection_id, 'strong', 'Guards against negative energy'),
        ('herb', calendula_id, success_id, 'moderate', 'Brings success in legal matters'),
        ('herb', calendula_id, psychic_id, 'moderate', 'Enhances prophetic dreams');
    
    INSERT INTO entity_elements (entity_type, entity_id, element_id, is_primary, strength)
    VALUES 
        ('herb', calendula_id, fire_id, true, 'primary');
    
    -- =============================================================================
    -- CATNIP - Love, beauty, peace
    -- =============================================================================
    
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength, notes)
    VALUES 
        ('herb', catnip_id, love_id, 'primary', 'Attracts love and affection'),
        ('herb', catnip_id, beauty_id, 'strong', 'Enhances attractiveness'),
        ('herb', catnip_id, peace_id, 'moderate', 'Calming and soothing'),
        ('herb', catnip_id, sleep_id, 'moderate', 'Promotes restful sleep');
    
    INSERT INTO entity_elements (entity_type, entity_id, element_id, is_primary, strength)
    VALUES 
        ('herb', catnip_id, water_id, true, 'primary'),
        ('herb', catnip_id, earth_id, false, 'moderate');
    
    -- =============================================================================
    -- CEDAR - Protection, purification, strength
    -- =============================================================================
    
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength, notes)
    VALUES 
        ('herb', cedar_id, protection_id, 'primary', 'Sacred tree of protection'),
        ('herb', cedar_id, purification_id, 'primary', 'Cleanses spaces and auras'),
        ('herb', cedar_id, strength_id, 'strong', 'Provides spiritual strength'),
        ('herb', cedar_id, healing_id, 'moderate', 'Healing through smoke');
    
    INSERT INTO entity_elements (entity_type, entity_id, element_id, is_primary, strength)
    VALUES 
        ('herb', cedar_id, earth_id, true, 'primary'),
        ('herb', cedar_id, fire_id, false, 'moderate');
    
    -- =============================================================================
    -- CHAMOMILE - Peace, sleep, healing
    -- =============================================================================
    
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength, notes)
    VALUES 
        ('herb', chamomile_id, peace_id, 'primary', 'Soothes anxiety and stress'),
        ('herb', chamomile_id, sleep_id, 'primary', 'Promotes restful sleep'),
        ('herb', chamomile_id, healing_id, 'strong', 'Gentle healing herb'),
        ('herb', chamomile_id, prosperity_id, 'moderate', 'Attracts money when washed with');
    
    INSERT INTO entity_elements (entity_type, entity_id, element_id, is_primary, strength)
    VALUES 
        ('herb', chamomile_id, water_id, true, 'primary');
    
    -- =============================================================================
    -- CINNAMON - Prosperity, success, energy
    -- =============================================================================
    
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength, notes)
    VALUES 
        ('herb', cinnamon_id, prosperity_id, 'primary', 'Fast money drawing'),
        ('herb', cinnamon_id, success_id, 'primary', 'Speeds up manifestation'),
        ('herb', cinnamon_id, energy_id, 'strong', 'Raises power and vibration'),
        ('herb', cinnamon_id, love_id, 'moderate', 'Passionate love spells'),
        ('herb', cinnamon_id, psychic_id, 'moderate', 'Enhances spiritual abilities');
    
    INSERT INTO entity_elements (entity_type, entity_id, element_id, is_primary, strength)
    VALUES 
        ('herb', cinnamon_id, fire_id, true, 'primary');
    
    -- =============================================================================
    -- CLOVE - Protection, prosperity, banishing
    -- =============================================================================
    
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength, notes)
    VALUES 
        ('herb', clove_id, protection_id, 'primary', 'Powerful protective ward'),
        ('herb', clove_id, prosperity_id, 'strong', 'Attracts wealth'),
        ('herb', clove_id, banishing_id, 'strong', 'Stops gossip and negativity'),
        ('herb', clove_id, energy_id, 'moderate', 'Raises spiritual power');
    
    INSERT INTO entity_elements (entity_type, entity_id, element_id, is_primary, strength)
    VALUES 
        ('herb', clove_id, fire_id, true, 'primary');
    
    -- =============================================================================
    -- COLTSFOOT - Healing, peace, divination
    -- =============================================================================
    
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength, notes)
    VALUES 
        ('herb', coltsfoot_id, healing_id, 'primary', 'Traditional respiratory healing'),
        ('herb', coltsfoot_id, peace_id, 'strong', 'Calming and soothing'),
        ('herb', coltsfoot_id, divination_id, 'moderate', 'Used in vision work'),
        ('herb', coltsfoot_id, psychic_id, 'moderate', 'Enhances psychic connection');
    
    INSERT INTO entity_elements (entity_type, entity_id, element_id, is_primary, strength)
    VALUES 
        ('herb', coltsfoot_id, water_id, true, 'primary'),
        ('herb', coltsfoot_id, earth_id, false, 'moderate');
    
    -- =============================================================================
    -- COMFREY - Healing, protection, prosperity
    -- =============================================================================
    
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength, notes)
    VALUES 
        ('herb', comfrey_id, healing_id, 'primary', 'Knits bones and wounds'),
        ('herb', comfrey_id, protection_id, 'strong', 'Protects travelers'),
        ('herb', comfrey_id, prosperity_id, 'moderate', 'Carried for money luck');
    
    INSERT INTO entity_elements (entity_type, entity_id, element_id, is_primary, strength)
    VALUES 
        ('herb', comfrey_id, water_id, true, 'primary'),
        ('herb', comfrey_id, earth_id, false, 'strong');
    
END $$;
