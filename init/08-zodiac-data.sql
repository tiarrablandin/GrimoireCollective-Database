-- =============================================================================
-- ZODIAC SIGNS DATA
-- =============================================================================
-- This file populates zodiac signs with proper element associations.
-- Must run AFTER 07-elements-data.sql to ensure elements table is populated.
-- =============================================================================

INSERT INTO zodiac_signs (name, slug, element_id, modality, date_range_start, date_range_end, traits) 
SELECT 'Aries', 'aries', e.id, 'cardinal', 'Mar 21', 'Apr 19', ARRAY['courageous', 'determined', 'confident', 'enthusiastic', 'passionate'] FROM elements e WHERE e.slug = 'fire'
UNION ALL SELECT 'Taurus', 'taurus', e.id, 'fixed', 'Apr 20', 'May 20', ARRAY['reliable', 'patient', 'practical', 'devoted', 'stable'] FROM elements e WHERE e.slug = 'earth'
UNION ALL SELECT 'Gemini', 'gemini', e.id, 'mutable', 'May 21', 'Jun 20', ARRAY['curious', 'adaptable', 'communicative', 'witty', 'versatile'] FROM elements e WHERE e.slug = 'air'
UNION ALL SELECT 'Cancer', 'cancer', e.id, 'cardinal', 'Jun 21', 'Jul 22', ARRAY['intuitive', 'emotional', 'protective', 'nurturing', 'loyal'] FROM elements e WHERE e.slug = 'water'
UNION ALL SELECT 'Leo', 'leo', e.id, 'fixed', 'Jul 23', 'Aug 22', ARRAY['creative', 'passionate', 'generous', 'warm-hearted', 'cheerful'] FROM elements e WHERE e.slug = 'fire'
UNION ALL SELECT 'Virgo', 'virgo', e.id, 'mutable', 'Aug 23', 'Sep 22', ARRAY['analytical', 'practical', 'loyal', 'hardworking', 'kind'] FROM elements e WHERE e.slug = 'earth'
UNION ALL SELECT 'Libra', 'libra', e.id, 'cardinal', 'Sep 23', 'Oct 22', ARRAY['diplomatic', 'fair-minded', 'social', 'gracious', 'cooperative'] FROM elements e WHERE e.slug = 'air'
UNION ALL SELECT 'Scorpio', 'scorpio', e.id, 'fixed', 'Oct 23', 'Nov 21', ARRAY['passionate', 'resourceful', 'brave', 'determined', 'intense'] FROM elements e WHERE e.slug = 'water'
UNION ALL SELECT 'Sagittarius', 'sagittarius', e.id, 'mutable', 'Nov 22', 'Dec 21', ARRAY['generous', 'idealistic', 'adventurous', 'philosophical', 'honest'] FROM elements e WHERE e.slug = 'fire'
UNION ALL SELECT 'Capricorn', 'capricorn', e.id, 'cardinal', 'Dec 22', 'Jan 19', ARRAY['responsible', 'disciplined', 'ambitious', 'practical', 'patient'] FROM elements e WHERE e.slug = 'earth'
UNION ALL SELECT 'Aquarius', 'aquarius', e.id, 'fixed', 'Jan 20', 'Feb 18', ARRAY['progressive', 'original', 'independent', 'humanitarian', 'intellectual'] FROM elements e WHERE e.slug = 'air'
UNION ALL SELECT 'Pisces', 'pisces', e.id, 'mutable', 'Feb 19', 'Mar 20', ARRAY['compassionate', 'artistic', 'intuitive', 'gentle', 'wise'] FROM elements e WHERE e.slug = 'water';

-- Notification for zodiac signs
DO $$ 
BEGIN 
    RAISE NOTICE '✓ 12 zodiac signs inserted with element associations';
END $$;

-- =============================================================================
-- ZODIAC RULING PLANETS (using entity_planets)
-- =============================================================================

-- Insert primary ruling planets (9 signs with classical planets)
INSERT INTO entity_planets (entity_type, entity_id, planet_id, strength, notes)
SELECT 'zodiac_sign', z.id, p.id, 'primary', 'Modern ruler'
FROM zodiac_signs z, planets p 
WHERE (z.slug = 'aries' AND p.slug = 'mars')
   OR (z.slug = 'taurus' AND p.slug = 'venus')
   OR (z.slug = 'gemini' AND p.slug = 'mercury')
   OR (z.slug = 'cancer' AND p.slug = 'moon')
   OR (z.slug = 'leo' AND p.slug = 'sun')
   OR (z.slug = 'virgo' AND p.slug = 'mercury')
   OR (z.slug = 'libra' AND p.slug = 'venus')
   OR (z.slug = 'sagittarius' AND p.slug = 'jupiter')
   OR (z.slug = 'capricorn' AND p.slug = 'saturn');

-- Insert modern rulers for outer planet signs (discovered after 1781)
INSERT INTO entity_planets (entity_type, entity_id, planet_id, strength, notes)
SELECT 'zodiac_sign', z.id, p.id, 'modern', 'Modern ruler (discovered after 1781)'
FROM zodiac_signs z, planets p 
WHERE (z.slug = 'scorpio' AND p.slug = 'pluto')
   OR (z.slug = 'aquarius' AND p.slug = 'uranus')
   OR (z.slug = 'pisces' AND p.slug = 'neptune');

-- Add traditional rulers for modern signs (co-rulers in classical astrology)
INSERT INTO entity_planets (entity_type, entity_id, planet_id, strength, notes)
SELECT 'zodiac_sign', z.id, p.id, 'traditional', 'Traditional ruler in classical astrology (pre-1781)'
FROM zodiac_signs z, planets p 
WHERE (z.slug = 'scorpio' AND p.slug = 'mars')  -- Traditional ruler before Pluto discovered
   OR (z.slug = 'aquarius' AND p.slug = 'saturn')  -- Traditional ruler before Uranus discovered
   OR (z.slug = 'pisces' AND p.slug = 'jupiter');  -- Traditional ruler before Neptune discovered

-- Notification for ruling planets
DO $$ 
BEGIN 
    RAISE NOTICE '✓ 15 zodiac-planet relationships inserted (9 primary + 3 modern + 3 traditional)';
END $$;
