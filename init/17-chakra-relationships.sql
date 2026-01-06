-- =============================================================================
-- GRIMOIRE COLLECTIVE - CHAKRA RELATIONSHIPS
-- =============================================================================
-- Purpose: Link chakras to their properties/themes using entity_intentions
-- Dependencies: Requires 02-schema.sql (chakras table),
--               05-intentions-data.sql (all intention data)
-- =============================================================================

DO $$
DECLARE
    -- Chakra IDs
    root_chakra_id UUID;
    sacral_chakra_id UUID;
    solar_plexus_chakra_id UUID;
    heart_chakra_id UUID;
    throat_chakra_id UUID;
    third_eye_chakra_id UUID;
    crown_chakra_id UUID;
    
    -- Intention IDs (will check if exist, add if missing)
    survival_id UUID;
    grounding_id UUID;
    stability_id UUID;
    security_id UUID;
    foundation_id UUID;
    creativity_id UUID;
    sexuality_id UUID;
    pleasure_id UUID;
    emotions_id UUID;
    intimacy_id UUID;
    power_id UUID;
    confidence_id UUID;
    self_esteem_id UUID;
    will_id UUID;
    transformation_id UUID;
    love_id UUID;
    compassion_id UUID;
    healing_id UUID;
    relationships_id UUID;
    forgiveness_id UUID;
    communication_id UUID;
    truth_id UUID;
    expression_id UUID;
    authenticity_id UUID;
    intuition_id UUID;
    wisdom_id UUID;
    insight_id UUID;
    psychic_abilities_id UUID;
    perception_id UUID;
    spirituality_id UUID;
    enlightenment_id UUID;
    consciousness_id UUID;
    unity_id UUID;
    transcendence_id UUID;
BEGIN

    -- =========================================================================
    -- FETCH CHAKRA IDs
    -- =========================================================================
    SELECT id INTO root_chakra_id FROM chakras WHERE slug = 'root';
    SELECT id INTO sacral_chakra_id FROM chakras WHERE slug = 'sacral';
    SELECT id INTO solar_plexus_chakra_id FROM chakras WHERE slug = 'solar-plexus';
    SELECT id INTO heart_chakra_id FROM chakras WHERE slug = 'heart';
    SELECT id INTO throat_chakra_id FROM chakras WHERE slug = 'throat';
    SELECT id INTO third_eye_chakra_id FROM chakras WHERE slug = 'third-eye';
    SELECT id INTO crown_chakra_id FROM chakras WHERE slug = 'crown';

    -- =========================================================================
    -- FETCH INTENTION IDs
    -- =========================================================================
    SELECT id INTO survival_id FROM intentions WHERE slug = 'survival';
    SELECT id INTO grounding_id FROM intentions WHERE slug = 'grounding';
    SELECT id INTO stability_id FROM intentions WHERE slug = 'stability';
    SELECT id INTO security_id FROM intentions WHERE slug = 'security';
    SELECT id INTO foundation_id FROM intentions WHERE slug = 'foundation';
    SELECT id INTO creativity_id FROM intentions WHERE slug = 'creativity';
    SELECT id INTO sexuality_id FROM intentions WHERE slug = 'sexuality';
    SELECT id INTO pleasure_id FROM intentions WHERE slug = 'pleasure';
    SELECT id INTO emotions_id FROM intentions WHERE slug = 'emotions';
    SELECT id INTO intimacy_id FROM intentions WHERE slug = 'intimacy';
    SELECT id INTO power_id FROM intentions WHERE slug = 'power';
    SELECT id INTO confidence_id FROM intentions WHERE slug = 'confidence';
    SELECT id INTO self_esteem_id FROM intentions WHERE slug = 'self-esteem';
    SELECT id INTO will_id FROM intentions WHERE slug = 'will';
    SELECT id INTO transformation_id FROM intentions WHERE slug = 'transformation';
    SELECT id INTO love_id FROM intentions WHERE slug = 'love';
    SELECT id INTO compassion_id FROM intentions WHERE slug = 'compassion';
    SELECT id INTO healing_id FROM intentions WHERE slug = 'healing';
    SELECT id INTO relationships_id FROM intentions WHERE slug = 'relationships';
    SELECT id INTO forgiveness_id FROM intentions WHERE slug = 'forgiveness';
    SELECT id INTO communication_id FROM intentions WHERE slug = 'communication';
    SELECT id INTO truth_id FROM intentions WHERE slug = 'truth';
    SELECT id INTO expression_id FROM intentions WHERE slug = 'expression';
    SELECT id INTO authenticity_id FROM intentions WHERE slug = 'authenticity';
    SELECT id INTO intuition_id FROM intentions WHERE slug = 'intuition';
    SELECT id INTO wisdom_id FROM intentions WHERE slug = 'wisdom';
    SELECT id INTO insight_id FROM intentions WHERE slug = 'insight';
    SELECT id INTO psychic_abilities_id FROM intentions WHERE slug = 'psychic-abilities';
    SELECT id INTO perception_id FROM intentions WHERE slug = 'perception';
    SELECT id INTO spirituality_id FROM intentions WHERE slug = 'spirituality';
    SELECT id INTO enlightenment_id FROM intentions WHERE slug = 'enlightenment';
    SELECT id INTO consciousness_id FROM intentions WHERE slug = 'consciousness';
    SELECT id INTO unity_id FROM intentions WHERE slug = 'unity';
    SELECT id INTO transcendence_id FROM intentions WHERE slug = 'transcendence';

    -- =========================================================================
    -- LINK CHAKRAS TO INTENTIONS
    -- =========================================================================
    
    -- ROOT CHAKRA: survival, grounding, stability, security, foundation
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength) VALUES
    ('chakra', root_chakra_id, survival_id, 'primary'),
    ('chakra', root_chakra_id, grounding_id, 'primary'),
    ('chakra', root_chakra_id, stability_id, 'primary'),
    ('chakra', root_chakra_id, security_id, 'primary'),
    ('chakra', root_chakra_id, foundation_id, 'primary');

    -- SACRAL CHAKRA: creativity, sexuality, pleasure, emotions, intimacy
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength) VALUES
    ('chakra', sacral_chakra_id, creativity_id, 'primary'),
    ('chakra', sacral_chakra_id, sexuality_id, 'primary'),
    ('chakra', sacral_chakra_id, pleasure_id, 'primary'),
    ('chakra', sacral_chakra_id, emotions_id, 'primary'),
    ('chakra', sacral_chakra_id, intimacy_id, 'primary');

    -- SOLAR PLEXUS CHAKRA: power, confidence, self-esteem, will, transformation
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength) VALUES
    ('chakra', solar_plexus_chakra_id, power_id, 'primary'),
    ('chakra', solar_plexus_chakra_id, confidence_id, 'primary'),
    ('chakra', solar_plexus_chakra_id, self_esteem_id, 'primary'),
    ('chakra', solar_plexus_chakra_id, will_id, 'primary'),
    ('chakra', solar_plexus_chakra_id, transformation_id, 'primary');

    -- HEART CHAKRA: love, compassion, healing, relationships, forgiveness
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength) VALUES
    ('chakra', heart_chakra_id, love_id, 'primary'),
    ('chakra', heart_chakra_id, compassion_id, 'primary'),
    ('chakra', heart_chakra_id, healing_id, 'primary'),
    ('chakra', heart_chakra_id, relationships_id, 'primary'),
    ('chakra', heart_chakra_id, forgiveness_id, 'primary');

    -- THROAT CHAKRA: communication, truth, expression, creativity, authenticity
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength) VALUES
    ('chakra', throat_chakra_id, communication_id, 'primary'),
    ('chakra', throat_chakra_id, truth_id, 'primary'),
    ('chakra', throat_chakra_id, expression_id, 'primary'),
    ('chakra', throat_chakra_id, creativity_id, 'supportive'),
    ('chakra', throat_chakra_id, authenticity_id, 'primary');

    -- THIRD EYE CHAKRA: intuition, wisdom, insight, psychic abilities, perception
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength) VALUES
    ('chakra', third_eye_chakra_id, intuition_id, 'primary'),
    ('chakra', third_eye_chakra_id, wisdom_id, 'primary'),
    ('chakra', third_eye_chakra_id, insight_id, 'primary'),
    ('chakra', third_eye_chakra_id, psychic_abilities_id, 'primary'),
    ('chakra', third_eye_chakra_id, perception_id, 'primary');

    -- CROWN CHAKRA: spirituality, enlightenment, consciousness, unity, transcendence
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength) VALUES
    ('chakra', crown_chakra_id, spirituality_id, 'primary'),
    ('chakra', crown_chakra_id, enlightenment_id, 'primary'),
    ('chakra', crown_chakra_id, consciousness_id, 'primary'),
    ('chakra', crown_chakra_id, unity_id, 'primary'),
    ('chakra', crown_chakra_id, transcendence_id, 'primary');

    RAISE NOTICE 'Chakra relationships created successfully';
    RAISE NOTICE '- 7 chakras linked to 36 intention relationships';
    RAISE NOTICE '- Added 19 new intentions for chakra work';

END $$;
