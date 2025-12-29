-- =============================================================================
-- GRIMOIRE COLLECTIVE - CALENDAR RELATIONSHIPS
-- =============================================================================
-- Purpose: Link calendar events (sabbats, esbats) to traditions and intentions
-- Created: 2025-12-29
-- Note: This file runs after 05-relationships.sql so entity_intentions table exists
-- =============================================================================

-- =============================================================================
-- CALENDAR RELATIONSHIPS
-- =============================================================================

-- Link calendar events to traditions and intentions (themes)
DO $$
DECLARE
    samhain_id UUID;
    yule_id UUID;
    imbolc_id UUID;
    ostara_id UUID;
    beltane_id UUID;
    litha_id UUID;
    lammas_id UUID;
    mabon_id UUID;
    full_moon_id UUID;
    new_moon_id UUID;
    
    celtic_id UUID;
    germanic_id UUID;
    wicca_id UUID;
    
    death_id UUID;
    ancestors_id UUID;
    divination_id UUID;
    reflection_id UUID;
    new_beginnings_id UUID;
    rebirth_id UUID;
    purification_id UUID;
    growth_id UUID;
    inspiration_id UUID;
    healing_id UUID;
    balance_id UUID;
    fertility_id UUID;
    renewal_id UUID;
    passion_id UUID;
    vitality_id UUID;
    union_id UUID;
    abundance_id UUID;
    power_id UUID;
    strength_id UUID;
    protection_id UUID;
    harvest_id UUID;
    gratitude_id UUID;
    transformation_id UUID;
    manifestation_id UUID;
    intention_id UUID;
    planning_id UUID;
    rest_id UUID;
    
BEGIN
    -- Get calendar IDs
    SELECT id INTO samhain_id FROM calendar WHERE slug = 'samhain';
    SELECT id INTO yule_id FROM calendar WHERE slug = 'yule';
    SELECT id INTO imbolc_id FROM calendar WHERE slug = 'imbolc';
    SELECT id INTO ostara_id FROM calendar WHERE slug = 'ostara';
    SELECT id INTO beltane_id FROM calendar WHERE slug = 'beltane';
    SELECT id INTO litha_id FROM calendar WHERE slug = 'litha';
    SELECT id INTO lammas_id FROM calendar WHERE slug = 'lammas';
    SELECT id INTO mabon_id FROM calendar WHERE slug = 'mabon';
    SELECT id INTO full_moon_id FROM calendar WHERE slug = 'full-moon-esbat';
    SELECT id INTO new_moon_id FROM calendar WHERE slug = 'new-moon-esbat';
    
    -- Get tradition IDs
    SELECT id INTO celtic_id FROM traditions WHERE slug = 'celtic-reconstructionist';
    SELECT id INTO germanic_id FROM traditions WHERE slug = 'heathenry';
    SELECT id INTO wicca_id FROM traditions WHERE slug = 'wicca';
    
    -- Get intention IDs
    SELECT id INTO death_id FROM intentions WHERE slug = 'death';
    SELECT id INTO ancestors_id FROM intentions WHERE slug = 'ancestors';
    SELECT id INTO divination_id FROM intentions WHERE slug = 'divination';
    SELECT id INTO reflection_id FROM intentions WHERE slug = 'reflection';
    SELECT id INTO new_beginnings_id FROM intentions WHERE slug = 'new-beginnings';
    SELECT id INTO rebirth_id FROM intentions WHERE slug = 'rebirth';
    SELECT id INTO purification_id FROM intentions WHERE slug = 'purification';
    SELECT id INTO growth_id FROM intentions WHERE slug = 'growth';
    SELECT id INTO inspiration_id FROM intentions WHERE slug = 'inspiration';
    SELECT id INTO healing_id FROM intentions WHERE slug = 'healing';
    SELECT id INTO balance_id FROM intentions WHERE slug = 'balance';
    SELECT id INTO fertility_id FROM intentions WHERE slug = 'fertility';
    SELECT id INTO renewal_id FROM intentions WHERE slug = 'renewal';
    SELECT id INTO passion_id FROM intentions WHERE slug = 'passion';
    SELECT id INTO vitality_id FROM intentions WHERE slug = 'vitality';
    SELECT id INTO union_id FROM intentions WHERE slug = 'union';
    SELECT id INTO abundance_id FROM intentions WHERE slug = 'abundance';
    SELECT id INTO power_id FROM intentions WHERE slug = 'power';
    SELECT id INTO strength_id FROM intentions WHERE slug = 'strength';
    SELECT id INTO protection_id FROM intentions WHERE slug = 'protection';
    SELECT id INTO harvest_id FROM intentions WHERE slug = 'harvest';
    SELECT id INTO gratitude_id FROM intentions WHERE slug = 'gratitude';
    SELECT id INTO transformation_id FROM intentions WHERE slug = 'transformation';
    SELECT id INTO manifestation_id FROM intentions WHERE slug = 'manifestation';
    SELECT id INTO intention_id FROM intentions WHERE slug = 'intention-setting';
    SELECT id INTO planning_id FROM intentions WHERE slug = 'planning';
    SELECT id INTO rest_id FROM intentions WHERE slug = 'rest';
    
    -- Link calendars to traditions
    INSERT INTO calendar_traditions (calendar_id, tradition_id, is_primary) VALUES
        (samhain_id, celtic_id, true),
        (samhain_id, wicca_id, false),
        (yule_id, germanic_id, true),
        (yule_id, wicca_id, false),
        (imbolc_id, celtic_id, true),
        (imbolc_id, wicca_id, false),
        (ostara_id, germanic_id, true),
        (ostara_id, wicca_id, false),
        (beltane_id, celtic_id, true),
        (beltane_id, wicca_id, false),
        (litha_id, germanic_id, true),
        (litha_id, wicca_id, false),
        (lammas_id, celtic_id, true),
        (lammas_id, wicca_id, false),
        (mabon_id, germanic_id, true),
        (mabon_id, wicca_id, false),
        (full_moon_id, wicca_id, true),
        (new_moon_id, wicca_id, true);
    
    -- Link calendars to intentions (themes)
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength) VALUES
        -- Samhain: death, ancestors, divination, reflection, new beginnings
        ('calendar', samhain_id, death_id, 'primary'),
        ('calendar', samhain_id, ancestors_id, 'primary'),
        ('calendar', samhain_id, divination_id, 'strong'),
        ('calendar', samhain_id, reflection_id, 'strong'),
        ('calendar', samhain_id, new_beginnings_id, 'moderate'),
        
        -- Yule: rebirth, hope (light), reflection, new beginnings
        ('calendar', yule_id, rebirth_id, 'primary'),
        ('calendar', yule_id, new_beginnings_id, 'strong'),
        ('calendar', yule_id, reflection_id, 'moderate'),
        
        -- Imbolc: purification, growth, inspiration, healing
        ('calendar', imbolc_id, purification_id, 'primary'),
        ('calendar', imbolc_id, growth_id, 'strong'),
        ('calendar', imbolc_id, inspiration_id, 'strong'),
        ('calendar', imbolc_id, healing_id, 'moderate'),
        
        -- Ostara: balance, fertility, growth, renewal
        ('calendar', ostara_id, balance_id, 'primary'),
        ('calendar', ostara_id, fertility_id, 'strong'),
        ('calendar', ostara_id, growth_id, 'strong'),
        ('calendar', ostara_id, renewal_id, 'moderate'),
        
        -- Beltane: fertility, passion, vitality, union
        ('calendar', beltane_id, fertility_id, 'primary'),
        ('calendar', beltane_id, passion_id, 'strong'),
        ('calendar', beltane_id, vitality_id, 'strong'),
        ('calendar', beltane_id, union_id, 'moderate'),
        
        -- Litha: abundance, power, strength, protection
        ('calendar', litha_id, abundance_id, 'primary'),
        ('calendar', litha_id, power_id, 'strong'),
        ('calendar', litha_id, strength_id, 'strong'),
        ('calendar', litha_id, protection_id, 'moderate'),
        
        -- Lammas: harvest, gratitude, transformation
        ('calendar', lammas_id, harvest_id, 'primary'),
        ('calendar', lammas_id, gratitude_id, 'strong'),
        ('calendar', lammas_id, transformation_id, 'moderate'),
        
        -- Mabon: balance, gratitude, reflection
        ('calendar', mabon_id, balance_id, 'primary'),
        ('calendar', mabon_id, gratitude_id, 'strong'),
        ('calendar', mabon_id, reflection_id, 'moderate'),
        
        -- Full Moon: manifestation, power, gratitude, divination
        ('calendar', full_moon_id, manifestation_id, 'primary'),
        ('calendar', full_moon_id, power_id, 'strong'),
        ('calendar', full_moon_id, gratitude_id, 'strong'),
        ('calendar', full_moon_id, divination_id, 'moderate'),
        
        -- New Moon: new beginnings, intention setting, planning, rest, reflection
        ('calendar', new_moon_id, new_beginnings_id, 'primary'),
        ('calendar', new_moon_id, intention_id, 'primary'),
        ('calendar', new_moon_id, planning_id, 'moderate'),
        ('calendar', new_moon_id, rest_id, 'moderate'),
        ('calendar', new_moon_id, reflection_id, 'moderate');
        
END $$;
