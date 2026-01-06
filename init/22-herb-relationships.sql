-- =============================================================================
-- GRIMOIRE COLLECTIVE - HERB ENTITY RELATIONSHIPS
-- =============================================================================
-- Purpose: Entity relationships for herbs (intentions, elements, deities, traditions, etc.)
-- Dependencies: Requires 20-herb-data.sql
-- Note: All 54 herbs with complete magical correspondences
-- =============================================================================

DO $$
DECLARE
    -- Herb IDs (All 54)
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
    damiana_id UUID;
    dandelion_id UUID;
    dill_id UUID;
    dragons_blood_id UUID;
    elecampane_id UUID;
    eucalyptus_id UUID;
    fennel_id UUID;
    frankincense_id UUID;
    galangal_id UUID;
    ginger_id UUID;
    high_john_id UUID;
    hyssop_id UUID;
    jasmine_id UUID;
    lavender_id UUID;
    lemon_balm_id UUID;
    mandrake_id UUID;
    marjoram_id UUID;
    meadowsweet_id UUID;
    mugwort_id UUID;
    mullein_id UUID;
    myrrh_id UUID;
    nettle_id UUID;
    oregano_id UUID;
    patchouli_id UUID;
    peppermint_id UUID;
    rose_id UUID;
    rosemary_id UUID;
    rue_id UUID;
    sage_id UUID;
    sandalwood_id UUID;
    skullcap_id UUID;
    slippery_elm_id UUID;
    st_johns_wort_id UUID;
    thyme_id UUID;
    valerian_id UUID;
    vervain_id UUID;
    witch_hazel_id UUID;
    wormwood_id UUID;
    yarrow_id UUID;
    
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
    SELECT id INTO damiana_id FROM herbs WHERE slug = 'damiana';
    SELECT id INTO dandelion_id FROM herbs WHERE slug = 'dandelion';
    SELECT id INTO dill_id FROM herbs WHERE slug = 'dill';
    SELECT id INTO dragons_blood_id FROM herbs WHERE slug = 'dragons-blood';
    SELECT id INTO elecampane_id FROM herbs WHERE slug = 'elecampane';
    SELECT id INTO eucalyptus_id FROM herbs WHERE slug = 'eucalyptus';
    SELECT id INTO fennel_id FROM herbs WHERE slug = 'fennel';
    SELECT id INTO frankincense_id FROM herbs WHERE slug = 'frankincense';
    SELECT id INTO galangal_id FROM herbs WHERE slug = 'galangal';
    SELECT id INTO ginger_id FROM herbs WHERE slug = 'ginger';
    SELECT id INTO high_john_id FROM herbs WHERE slug = 'high-john-the-conqueror';
    SELECT id INTO hyssop_id FROM herbs WHERE slug = 'hyssop';
    SELECT id INTO jasmine_id FROM herbs WHERE slug = 'jasmine';
    SELECT id INTO lavender_id FROM herbs WHERE slug = 'lavender';
    SELECT id INTO lemon_balm_id FROM herbs WHERE slug = 'lemon-balm';
    SELECT id INTO mandrake_id FROM herbs WHERE slug = 'mandrake';
    SELECT id INTO marjoram_id FROM herbs WHERE slug = 'marjoram';
    SELECT id INTO meadowsweet_id FROM herbs WHERE slug = 'meadowsweet';
    SELECT id INTO mugwort_id FROM herbs WHERE slug = 'mugwort';
    SELECT id INTO mullein_id FROM herbs WHERE slug = 'mullein';
    SELECT id INTO myrrh_id FROM herbs WHERE slug = 'myrrh';
    SELECT id INTO nettle_id FROM herbs WHERE slug = 'nettle';
    SELECT id INTO oregano_id FROM herbs WHERE slug = 'oregano';
    SELECT id INTO patchouli_id FROM herbs WHERE slug = 'patchouli';
    SELECT id INTO peppermint_id FROM herbs WHERE slug = 'peppermint';
    SELECT id INTO rose_id FROM herbs WHERE slug = 'rose';
    SELECT id INTO rosemary_id FROM herbs WHERE slug = 'rosemary';
    SELECT id INTO rue_id FROM herbs WHERE slug = 'rue';
    SELECT id INTO sage_id FROM herbs WHERE slug = 'sage';
    SELECT id INTO sandalwood_id FROM herbs WHERE slug = 'sandalwood';
    SELECT id INTO skullcap_id FROM herbs WHERE slug = 'skullcap';
    SELECT id INTO slippery_elm_id FROM herbs WHERE slug = 'slippery-elm';
    SELECT id INTO st_johns_wort_id FROM herbs WHERE slug = 'st-johns-wort';
    SELECT id INTO thyme_id FROM herbs WHERE slug = 'thyme';
    SELECT id INTO valerian_id FROM herbs WHERE slug = 'valerian';
    SELECT id INTO vervain_id FROM herbs WHERE slug = 'vervain';
    SELECT id INTO witch_hazel_id FROM herbs WHERE slug = 'witch-hazel';
    SELECT id INTO wormwood_id FROM herbs WHERE slug = 'wormwood';
    SELECT id INTO yarrow_id FROM herbs WHERE slug = 'yarrow';
    
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
    
    -- =============================================================================
    -- DAMIANA - Love, beauty, divination
    -- =============================================================================
    
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength, notes)
    VALUES 
        ('herb', damiana_id, love_id, 'primary', 'Powerful aphrodisiac and love attractor'),
        ('herb', damiana_id, divination_id, 'strong', 'Enhances psychic visions'),
        ('herb', damiana_id, psychic_id, 'strong', 'Opens spiritual sight'),
        ('herb', damiana_id, beauty_id, 'moderate', 'Enhances attractiveness');
    
    INSERT INTO entity_elements (entity_type, entity_id, element_id, is_primary, strength)
    VALUES 
        ('herb', damiana_id, fire_id, true, 'primary'),
        ('herb', damiana_id, water_id, false, 'moderate');
    
    -- =============================================================================
    -- DANDELION - Divination, prosperity, wishes
    -- =============================================================================
    
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength, notes)
    VALUES 
        ('herb', dandelion_id, divination_id, 'primary', 'Messages from the spirit world'),
        ('herb', dandelion_id, psychic_id, 'strong', 'Enhances psychic abilities'),
        ('herb', dandelion_id, prosperity_id, 'moderate', 'Brings abundance'),
        ('herb', dandelion_id, healing_id, 'moderate', 'Detoxifying and cleansing');
    
    INSERT INTO entity_elements (entity_type, entity_id, element_id, is_primary, strength)
    VALUES 
        ('herb', dandelion_id, air_id, true, 'primary'),
        ('herb', dandelion_id, fire_id, false, 'moderate');
    
    -- =============================================================================
    -- DILL - Protection, prosperity, love
    -- =============================================================================
    
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength, notes)
    VALUES 
        ('herb', dill_id, protection_id, 'primary', 'Protects against negative magic'),
        ('herb', dill_id, prosperity_id, 'strong', 'Attracts money'),
        ('herb', dill_id, love_id, 'moderate', 'Promotes desire');
    
    INSERT INTO entity_elements (entity_type, entity_id, element_id, is_primary, strength)
    VALUES 
        ('herb', dill_id, fire_id, true, 'primary');
    
    -- =============================================================================
    -- DRAGON'S BLOOD - Power, protection, energy
    -- =============================================================================
    
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength, notes)
    VALUES 
        ('herb', dragons_blood_id, energy_id, 'primary', 'Amplifies all magical workings'),
        ('herb', dragons_blood_id, protection_id, 'primary', 'Powerful protective barrier'),
        ('herb', dragons_blood_id, strength_id, 'strong', 'Increases magical power'),
        ('herb', dragons_blood_id, courage_id, 'strong', 'Dragon courage and strength');
    
    INSERT INTO entity_elements (entity_type, entity_id, element_id, is_primary, strength)
    VALUES 
        ('herb', dragons_blood_id, fire_id, true, 'primary');
    
    -- =============================================================================
    -- ELECAMPANE - Love, protection, psychic
    -- =============================================================================
    
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength, notes)
    VALUES 
        ('herb', elecampane_id, love_id, 'primary', 'Attracts love and affection'),
        ('herb', elecampane_id, protection_id, 'strong', 'Guards against negativity'),
        ('herb', elecampane_id, psychic_id, 'moderate', 'Enhances spiritual abilities');
    
    INSERT INTO entity_elements (entity_type, entity_id, element_id, is_primary, strength)
    VALUES 
        ('herb', elecampane_id, water_id, true, 'primary');
    
    -- =============================================================================
    -- EUCALYPTUS - Healing, protection, purification
    -- =============================================================================
    
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength, notes)
    VALUES 
        ('herb', eucalyptus_id, healing_id, 'primary', 'Powerful respiratory healing'),
        ('herb', eucalyptus_id, protection_id, 'strong', 'Wards off illness and negativity'),
        ('herb', eucalyptus_id, purification_id, 'strong', 'Cleanses spaces and auras');
    
    INSERT INTO entity_elements (entity_type, entity_id, element_id, is_primary, strength)
    VALUES 
        ('herb', eucalyptus_id, air_id, true, 'primary'),
        ('herb', eucalyptus_id, water_id, false, 'moderate');
    
    -- =============================================================================
    -- FENNEL - Protection, courage, purification
    -- =============================================================================
    
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength, notes)
    VALUES 
        ('herb', fennel_id, protection_id, 'primary', 'Hung to ward off evil spirits'),
        ('herb', fennel_id, courage_id, 'strong', 'Strengthens resolve'),
        ('herb', fennel_id, purification_id, 'moderate', 'Cleanses negativity');
    
    INSERT INTO entity_elements (entity_type, entity_id, element_id, is_primary, strength)
    VALUES 
        ('herb', fennel_id, fire_id, true, 'primary');
    
    -- =============================================================================
    -- FRANKINCENSE - Purification, protection, spirituality
    -- =============================================================================
    
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength, notes)
    VALUES 
        ('herb', frankincense_id, purification_id, 'primary', 'Sacred cleansing smoke'),
        ('herb', frankincense_id, protection_id, 'primary', 'Powerful spiritual protection'),
        ('herb', frankincense_id, psychic_id, 'strong', 'Elevates consciousness'),
        ('herb', frankincense_id, wisdom_id, 'moderate', 'Opens spiritual wisdom');
    
    INSERT INTO entity_elements (entity_type, entity_id, element_id, is_primary, strength)
    VALUES 
        ('herb', frankincense_id, fire_id, true, 'primary'),
        ('herb', frankincense_id, air_id, false, 'strong');
    
    -- =============================================================================
    -- GALANGAL - Success, power, prosperity
    -- =============================================================================
    
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength, notes)
    VALUES 
        ('herb', galangal_id, success_id, 'primary', 'Ensures victory in court cases'),
        ('herb', galangal_id, prosperity_id, 'strong', 'Attracts money'),
        ('herb', galangal_id, strength_id, 'strong', 'Increases personal power'),
        ('herb', galangal_id, protection_id, 'moderate', 'Breaks hexes');
    
    INSERT INTO entity_elements (entity_type, entity_id, element_id, is_primary, strength)
    VALUES 
        ('herb', galangal_id, fire_id, true, 'primary');
    
    -- =============================================================================
    -- GINGER - Success, prosperity, energy
    -- =============================================================================
    
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength, notes)
    VALUES 
        ('herb', ginger_id, success_id, 'primary', 'Speeds success in all endeavors'),
        ('herb', ginger_id, prosperity_id, 'primary', 'Fast money attraction'),
        ('herb', ginger_id, energy_id, 'strong', 'Increases vitality and power'),
        ('herb', ginger_id, love_id, 'moderate', 'Adds passion');
    
    INSERT INTO entity_elements (entity_type, entity_id, element_id, is_primary, strength)
    VALUES 
        ('herb', ginger_id, fire_id, true, 'primary');
    
    -- =============================================================================
    -- HIGH JOHN THE CONQUEROR - Success, power, prosperity
    -- =============================================================================
    
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength, notes)
    VALUES 
        ('herb', high_john_id, success_id, 'primary', 'Conquers all obstacles'),
        ('herb', high_john_id, strength_id, 'primary', 'Masculine power and virility'),
        ('herb', high_john_id, prosperity_id, 'strong', 'Attracts money and luck'),
        ('herb', high_john_id, protection_id, 'strong', 'Overcomes enemies');
    
    INSERT INTO entity_elements (entity_type, entity_id, element_id, is_primary, strength)
    VALUES 
        ('herb', high_john_id, fire_id, true, 'primary'),
        ('herb', high_john_id, earth_id, false, 'moderate');
    
    -- =============================================================================
    -- HYSSOP - Purification, protection, healing
    -- =============================================================================
    
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength, notes)
    VALUES 
        ('herb', hyssop_id, purification_id, 'primary', 'Biblical cleansing herb'),
        ('herb', hyssop_id, protection_id, 'strong', 'Protects from evil'),
        ('herb', hyssop_id, healing_id, 'moderate', 'Spiritual healing');
    
    INSERT INTO entity_elements (entity_type, entity_id, element_id, is_primary, strength)
    VALUES 
        ('herb', hyssop_id, fire_id, true, 'primary');
    
    -- =============================================================================
    -- JASMINE - Love, beauty, prosperity
    -- =============================================================================
    
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength, notes)
    VALUES 
        ('herb', jasmine_id, love_id, 'primary', 'Attracts spiritual love'),
        ('herb', jasmine_id, beauty_id, 'strong', 'Enhances attractiveness'),
        ('herb', jasmine_id, prosperity_id, 'moderate', 'Brings abundance'),
        ('herb', jasmine_id, psychic_id, 'moderate', 'Enhances prophetic dreams');
    
    INSERT INTO entity_elements (entity_type, entity_id, element_id, is_primary, strength)
    VALUES 
        ('herb', jasmine_id, water_id, true, 'primary'),
        ('herb', jasmine_id, earth_id, false, 'moderate');
    
    -- =============================================================================
    -- LAVENDER - Peace, sleep, love, purification
    -- =============================================================================
    
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength, notes)
    VALUES 
        ('herb', lavender_id, peace_id, 'primary', 'Brings calm and tranquility'),
        ('herb', lavender_id, sleep_id, 'primary', 'Promotes restful sleep'),
        ('herb', lavender_id, love_id, 'strong', 'Gentle love and devotion'),
        ('herb', lavender_id, purification_id, 'strong', 'Cleanses energy'),
        ('herb', lavender_id, protection_id, 'moderate', 'Gentle protection');
    
    INSERT INTO entity_elements (entity_type, entity_id, element_id, is_primary, strength)
    VALUES 
        ('herb', lavender_id, air_id, true, 'primary'),
        ('herb', lavender_id, water_id, false, 'moderate');
    
    -- =============================================================================
    -- LEMON BALM - Love, healing, peace
    -- =============================================================================
    
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength, notes)
    VALUES 
        ('herb', lemon_balm_id, love_id, 'primary', 'Attracts love and friendship'),
        ('herb', lemon_balm_id, healing_id, 'strong', 'Emotional healing'),
        ('herb', lemon_balm_id, peace_id, 'strong', 'Calms anxiety'),
        ('herb', lemon_balm_id, success_id, 'moderate', 'Brings success');
    
    INSERT INTO entity_elements (entity_type, entity_id, element_id, is_primary, strength)
    VALUES 
        ('herb', lemon_balm_id, water_id, true, 'primary');
    
    -- =============================================================================
    -- MANDRAKE - Protection, power, prosperity
    -- =============================================================================
    
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength, notes)
    VALUES 
        ('herb', mandrake_id, protection_id, 'primary', 'Legendary protective power'),
        ('herb', mandrake_id, prosperity_id, 'primary', 'Attracts wealth'),
        ('herb', mandrake_id, strength_id, 'strong', 'Increases magical power'),
        ('herb', mandrake_id, love_id, 'moderate', 'Love and fertility');
    
    INSERT INTO entity_elements (entity_type, entity_id, element_id, is_primary, strength)
    VALUES 
        ('herb', mandrake_id, earth_id, true, 'primary'),
        ('herb', mandrake_id, fire_id, false, 'strong');
    
    -- =============================================================================
    -- MARJORAM - Love, peace, protection
    -- =============================================================================
    
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength, notes)
    VALUES 
        ('herb', marjoram_id, love_id, 'primary', 'Promotes marital happiness'),
        ('herb', marjoram_id, peace_id, 'strong', 'Brings tranquility'),
        ('herb', marjoram_id, protection_id, 'moderate', 'Guards home and family'),
        ('herb', marjoram_id, healing_id, 'moderate', 'Eases grief');
    
    INSERT INTO entity_elements (entity_type, entity_id, element_id, is_primary, strength)
    VALUES 
        ('herb', marjoram_id, air_id, true, 'primary');
    
    -- =============================================================================
    -- MEADOWSWEET - Love, peace, divination
    -- =============================================================================
    
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength, notes)
    VALUES 
        ('herb', meadowsweet_id, love_id, 'primary', 'Attracts love'),
        ('herb', meadowsweet_id, peace_id, 'strong', 'Brings harmony'),
        ('herb', meadowsweet_id, divination_id, 'moderate', 'Aids scrying');
    
    INSERT INTO entity_elements (entity_type, entity_id, element_id, is_primary, strength)
    VALUES 
        ('herb', meadowsweet_id, air_id, true, 'primary'),
        ('herb', meadowsweet_id, water_id, false, 'moderate');
    
    -- =============================================================================
    -- MUGWORT - Divination, psychic abilities, protection
    -- =============================================================================
    
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength, notes)
    VALUES 
        ('herb', mugwort_id, divination_id, 'primary', 'Powerful divination aid'),
        ('herb', mugwort_id, psychic_id, 'primary', 'Opens third eye'),
        ('herb', mugwort_id, protection_id, 'strong', 'Protects during astral travel'),
        ('herb', mugwort_id, clarity_id, 'moderate', 'Enhances lucid dreaming');
    
    INSERT INTO entity_elements (entity_type, entity_id, element_id, is_primary, strength)
    VALUES 
        ('herb', mugwort_id, air_id, true, 'primary'),
        ('herb', mugwort_id, earth_id, false, 'moderate');
    
    -- =============================================================================
    -- MULLEIN - Courage, protection, divination
    -- =============================================================================
    
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength, notes)
    VALUES 
        ('herb', mullein_id, courage_id, 'primary', 'Provides bravery'),
        ('herb', mullein_id, protection_id, 'strong', 'Guards against evil'),
        ('herb', mullein_id, divination_id, 'moderate', 'Used in spirit work');
    
    INSERT INTO entity_elements (entity_type, entity_id, element_id, is_primary, strength)
    VALUES 
        ('herb', mullein_id, fire_id, true, 'primary');
    
    -- =============================================================================
    -- MYRRH - Purification, protection, healing
    -- =============================================================================
    
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength, notes)
    VALUES 
        ('herb', myrrh_id, purification_id, 'primary', 'Sacred cleansing resin'),
        ('herb', myrrh_id, protection_id, 'primary', 'Powerful protection'),
        ('herb', myrrh_id, healing_id, 'strong', 'Spiritual and physical healing'),
        ('herb', myrrh_id, wisdom_id, 'moderate', 'Ancient wisdom');
    
    INSERT INTO entity_elements (entity_type, entity_id, element_id, is_primary, strength)
    VALUES 
        ('herb', myrrh_id, water_id, true, 'primary'),
        ('herb', myrrh_id, earth_id, false, 'moderate');
    
    -- =============================================================================
    -- NETTLE - Protection, healing, banishing
    -- =============================================================================
    
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength, notes)
    VALUES 
        ('herb', nettle_id, protection_id, 'primary', 'Fierce protective warrior herb'),
        ('herb', nettle_id, banishing_id, 'strong', 'Removes curses and hexes'),
        ('herb', nettle_id, healing_id, 'strong', 'Nourishing and restorative'),
        ('herb', nettle_id, courage_id, 'moderate', 'Strengthens resolve');
    
    INSERT INTO entity_elements (entity_type, entity_id, element_id, is_primary, strength)
    VALUES 
        ('herb', nettle_id, fire_id, true, 'primary'),
        ('herb', nettle_id, air_id, false, 'moderate');
    
    -- =============================================================================
    -- OREGANO - Protection, prosperity, love
    -- =============================================================================
    
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength, notes)
    VALUES 
        ('herb', oregano_id, protection_id, 'primary', 'Protects against negativity'),
        ('herb', oregano_id, prosperity_id, 'moderate', 'Attracts abundance'),
        ('herb', oregano_id, love_id, 'moderate', 'Promotes joy in relationships');
    
    INSERT INTO entity_elements (entity_type, entity_id, element_id, is_primary, strength)
    VALUES 
        ('herb', oregano_id, air_id, true, 'primary');
    
    -- =============================================================================
    -- PATCHOULI - Prosperity, love, grounding
    -- =============================================================================
    
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength, notes)
    VALUES 
        ('herb', patchouli_id, prosperity_id, 'primary', 'Powerful money attractor'),
        ('herb', patchouli_id, love_id, 'strong', 'Sensual and passionate love'),
        ('herb', patchouli_id, grounding_id, 'strong', 'Earthy grounding energy');
    
    INSERT INTO entity_elements (entity_type, entity_id, element_id, is_primary, strength)
    VALUES 
        ('herb', patchouli_id, earth_id, true, 'primary');
    
    -- =============================================================================
    -- PEPPERMINT - Healing, purification, prosperity
    -- =============================================================================
    
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength, notes)
    VALUES 
        ('herb', peppermint_id, healing_id, 'primary', 'Healing and vitality'),
        ('herb', peppermint_id, purification_id, 'strong', 'Cleansing energy'),
        ('herb', peppermint_id, prosperity_id, 'moderate', 'Attracts abundance'),
        ('herb', peppermint_id, psychic_id, 'moderate', 'Stimulates psychic awareness');
    
    INSERT INTO entity_elements (entity_type, entity_id, element_id, is_primary, strength)
    VALUES 
        ('herb', peppermint_id, air_id, true, 'primary'),
        ('herb', peppermint_id, fire_id, false, 'moderate');
    
    -- =============================================================================
    -- ROSE - Love, beauty, divination
    -- =============================================================================
    
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength, notes)
    VALUES 
        ('herb', rose_id, love_id, 'primary', 'Queen of love magic'),
        ('herb', rose_id, beauty_id, 'strong', 'Enhances beauty and grace'),
        ('herb', rose_id, divination_id, 'moderate', 'Prophetic dreams'),
        ('herb', rose_id, healing_id, 'moderate', 'Emotional healing');
    
    INSERT INTO entity_elements (entity_type, entity_id, element_id, is_primary, strength)
    VALUES 
        ('herb', rose_id, water_id, true, 'primary'),
        ('herb', rose_id, earth_id, false, 'moderate');
    
    -- =============================================================================
    -- ROSEMARY - Protection, purification, memory
    -- =============================================================================
    
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength, notes)
    VALUES 
        ('herb', rosemary_id, protection_id, 'primary', 'Guards against evil'),
        ('herb', rosemary_id, purification_id, 'strong', 'Cleanses all negativity'),
        ('herb', rosemary_id, healing_id, 'strong', 'Physical and mental healing'),
        ('herb', rosemary_id, love_id, 'moderate', 'Fidelity and remembrance');
    
    INSERT INTO entity_elements (entity_type, entity_id, element_id, is_primary, strength)
    VALUES 
        ('herb', rosemary_id, fire_id, true, 'primary');
    
    -- =============================================================================
    -- RUE - Protection, banishing, healing
    -- =============================================================================
    
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength, notes)
    VALUES 
        ('herb', rue_id, protection_id, 'primary', 'Powerful hex breaker'),
        ('herb', rue_id, banishing_id, 'primary', 'Removes curses and evil eye'),
        ('herb', rue_id, healing_id, 'moderate', 'Protective healing');
    
    INSERT INTO entity_elements (entity_type, entity_id, element_id, is_primary, strength)
    VALUES 
        ('herb', rue_id, fire_id, true, 'primary'),
        ('herb', rue_id, air_id, false, 'moderate');
    
    -- =============================================================================
    -- SAGE - Purification, wisdom, protection
    -- =============================================================================
    
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength, notes)
    VALUES 
        ('herb', sage_id, purification_id, 'primary', 'Sacred cleansing smoke'),
        ('herb', sage_id, wisdom_id, 'primary', 'Ancient wisdom and knowledge'),
        ('herb', sage_id, protection_id, 'strong', 'Clears negative energy'),
        ('herb', sage_id, healing_id, 'moderate', 'Spiritual healing');
    
    INSERT INTO entity_elements (entity_type, entity_id, element_id, is_primary, strength)
    VALUES 
        ('herb', sage_id, air_id, true, 'primary'),
        ('herb', sage_id, earth_id, false, 'moderate');
    
    -- =============================================================================
    -- SANDALWOOD - Purification, protection, spirituality
    -- =============================================================================
    
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength, notes)
    VALUES 
        ('herb', sandalwood_id, purification_id, 'primary', 'Sacred purification'),
        ('herb', sandalwood_id, protection_id, 'strong', 'Spiritual protection'),
        ('herb', sandalwood_id, psychic_id, 'strong', 'Raises spiritual awareness'),
        ('herb', sandalwood_id, healing_id, 'moderate', 'Spiritual healing');
    
    INSERT INTO entity_elements (entity_type, entity_id, element_id, is_primary, strength)
    VALUES 
        ('herb', sandalwood_id, air_id, true, 'primary'),
        ('herb', sandalwood_id, water_id, false, 'moderate');
    
    -- =============================================================================
    -- SKULLCAP - Peace, healing, protection
    -- =============================================================================
    
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength, notes)
    VALUES 
        ('herb', skullcap_id, peace_id, 'primary', 'Calms nervous system'),
        ('herb', skullcap_id, healing_id, 'strong', 'Mental and emotional healing'),
        ('herb', skullcap_id, protection_id, 'moderate', 'Protects against stress');
    
    INSERT INTO entity_elements (entity_type, entity_id, element_id, is_primary, strength)
    VALUES 
        ('herb', skullcap_id, water_id, true, 'primary');
    
    -- =============================================================================
    -- SLIPPERY ELM - Communication, healing, protection
    -- =============================================================================
    
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength, notes)
    VALUES 
        ('herb', slippery_elm_id, communication_id, 'primary', 'Stops gossip and slander'),
        ('herb', slippery_elm_id, healing_id, 'strong', 'Soothes and heals'),
        ('herb', slippery_elm_id, protection_id, 'moderate', 'Protects reputation');
    
    INSERT INTO entity_elements (entity_type, entity_id, element_id, is_primary, strength)
    VALUES 
        ('herb', slippery_elm_id, air_id, true, 'primary'),
        ('herb', slippery_elm_id, water_id, false, 'moderate');
    
    -- =============================================================================
    -- ST. JOHN'S WORT - Protection, healing, strength
    -- =============================================================================
    
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength, notes)
    VALUES 
        ('herb', st_johns_wort_id, protection_id, 'primary', 'Banishes evil spirits'),
        ('herb', st_johns_wort_id, healing_id, 'primary', 'Powerful antidepressant'),
        ('herb', st_johns_wort_id, strength_id, 'strong', 'Provides courage'),
        ('herb', st_johns_wort_id, purification_id, 'moderate', 'Cleanses negativity');
    
    INSERT INTO entity_elements (entity_type, entity_id, element_id, is_primary, strength)
    VALUES 
        ('herb', st_johns_wort_id, fire_id, true, 'primary');
    
    -- =============================================================================
    -- THYME - Purification, courage, healing
    -- =============================================================================
    
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength, notes)
    VALUES 
        ('herb', thyme_id, purification_id, 'primary', 'Cleanses and purifies'),
        ('herb', thyme_id, courage_id, 'strong', 'Provides bravery'),
        ('herb', thyme_id, healing_id, 'strong', 'Physical and spiritual healing'),
        ('herb', thyme_id, protection_id, 'moderate', 'Guards against nightmares');
    
    INSERT INTO entity_elements (entity_type, entity_id, element_id, is_primary, strength)
    VALUES 
        ('herb', thyme_id, water_id, true, 'primary'),
        ('herb', thyme_id, air_id, false, 'moderate');
    
    -- =============================================================================
    -- VALERIAN - Love, sleep, peace
    -- =============================================================================
    
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength, notes)
    VALUES 
        ('herb', valerian_id, sleep_id, 'primary', 'Powerful sleep aid'),
        ('herb', valerian_id, peace_id, 'strong', 'Calms and soothes'),
        ('herb', valerian_id, love_id, 'moderate', 'Reconciliation in love'),
        ('herb', valerian_id, protection_id, 'moderate', 'Protective during sleep');
    
    INSERT INTO entity_elements (entity_type, entity_id, element_id, is_primary, strength)
    VALUES 
        ('herb', valerian_id, water_id, true, 'primary'),
        ('herb', valerian_id, earth_id, false, 'moderate');
    
    -- =============================================================================
    -- VERVAIN - Protection, purification, love
    -- =============================================================================
    
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength, notes)
    VALUES 
        ('herb', vervain_id, protection_id, 'primary', 'Sacred protective herb'),
        ('herb', vervain_id, purification_id, 'primary', 'Altar purification'),
        ('herb', vervain_id, love_id, 'moderate', 'Love and chastity'),
        ('herb', vervain_id, prosperity_id, 'moderate', 'Attracts wealth');
    
    INSERT INTO entity_elements (entity_type, entity_id, element_id, is_primary, strength)
    VALUES 
        ('herb', vervain_id, earth_id, true, 'primary'),
        ('herb', vervain_id, air_id, false, 'moderate');
    
    -- =============================================================================
    -- WITCH HAZEL - Protection, healing, chastity
    -- =============================================================================
    
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength, notes)
    VALUES 
        ('herb', witch_hazel_id, protection_id, 'primary', 'Wards off evil'),
        ('herb', witch_hazel_id, healing_id, 'primary', 'Powerful healing properties'),
        ('herb', witch_hazel_id, banishing_id, 'moderate', 'Breaks unwanted bonds');
    
    INSERT INTO entity_elements (entity_type, entity_id, element_id, is_primary, strength)
    VALUES 
        ('herb', witch_hazel_id, water_id, true, 'primary'),
        ('herb', witch_hazel_id, fire_id, false, 'moderate');
    
    -- =============================================================================
    -- WORMWOOD - Divination, psychic abilities, protection
    -- =============================================================================
    
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength, notes)
    VALUES 
        ('herb', wormwood_id, psychic_id, 'primary', 'Powerful psychic opener'),
        ('herb', wormwood_id, divination_id, 'primary', 'Spirit communication'),
        ('herb', wormwood_id, protection_id, 'strong', 'Protects against evil'),
        ('herb', wormwood_id, banishing_id, 'moderate', 'Banishes negative entities');
    
    INSERT INTO entity_elements (entity_type, entity_id, element_id, is_primary, strength)
    VALUES 
        ('herb', wormwood_id, fire_id, true, 'primary'),
        ('herb', wormwood_id, air_id, false, 'moderate');
    
    -- =============================================================================
    -- YARROW - Divination, courage, love
    -- =============================================================================
    
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength, notes)
    VALUES 
        ('herb', yarrow_id, divination_id, 'primary', 'Used in I Ching divination'),
        ('herb', yarrow_id, courage_id, 'strong', 'Warrior herb of bravery'),
        ('herb', yarrow_id, love_id, 'moderate', 'Attracts love'),
        ('herb', yarrow_id, healing_id, 'moderate', 'Wound healing');
    
    INSERT INTO entity_elements (entity_type, entity_id, element_id, is_primary, strength)
    VALUES 
        ('herb', yarrow_id, water_id, true, 'primary'),
        ('herb', yarrow_id, air_id, false, 'moderate');
    
END $$;
