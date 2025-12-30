-- =============================================================================
-- GRIMOIRE COLLECTIVE - DEITIES DATA
-- =============================================================================
-- Purpose: Deity entities with their associations and pantheon relationships
-- Dependencies: Requires 02-schema.sql (deities table definition),
--               09-pantheons-data.sql (pantheon data must be loaded first)
-- =============================================================================

DO $$
DECLARE
    greek_pantheon_id UUID;
    norse_pantheon_id UUID;
    egyptian_pantheon_id UUID;
    celtic_pantheon_id UUID;
BEGIN
    SELECT id INTO greek_pantheon_id FROM pantheons WHERE slug = 'greek';
    SELECT id INTO norse_pantheon_id FROM pantheons WHERE slug = 'norse';
    SELECT id INTO egyptian_pantheon_id FROM pantheons WHERE slug = 'egyptian';
    SELECT id INTO celtic_pantheon_id FROM pantheons WHERE slug = 'celtic';

    INSERT INTO deities (name, slug, culture, pantheon_id, gender, domains, symbols, description) VALUES
        ('Brigid', 'brigid', 'Celtic', celtic_pantheon_id, 'feminine',
         ARRAY['fire', 'poetry', 'healing', 'smithcraft'],
         ARRAY['fire', 'sacred flame', 'wells', 'cross'],
         'Irish goddess of fire, poetry, healing, and smithcraft. Associated with Imbolc.'),
        
        ('Hecate', 'hecate', 'Greek', greek_pantheon_id, 'feminine',
         ARRAY['magic', 'crossroads', 'moon', 'necromancy'],
         ARRAY['torch', 'key', 'dagger', 'dog'],
         'Greek goddess of magic, crossroads, and the moon. Guardian of thresholds.'),
        
        ('Cernunnos', 'cernunnos', 'Celtic', celtic_pantheon_id, 'masculine',
         ARRAY['nature', 'fertility', 'animals', 'wild'],
         ARRAY['antlers', 'torque', 'serpent', 'stag'],
         'Celtic horned god of nature, fertility, and animals.'),
        
        ('Thoth', 'thoth', 'Egyptian', egyptian_pantheon_id, 'masculine',
         ARRAY['wisdom', 'writing', 'magic', 'moon'],
         ARRAY['ibis', 'moon', 'papyrus', 'scales'],
         'Egyptian god of wisdom, writing, and magic.'),
        
        ('Freyja', 'freyja', 'Norse', norse_pantheon_id, 'feminine',
         ARRAY['love', 'beauty', 'war', 'seidr'],
         ARRAY['falcon', 'cats', 'amber', 'boar'],
         'Norse goddess of love, beauty, war, and seidr magic.'),
        
        ('Artemis', 'artemis', 'Greek', greek_pantheon_id, 'feminine',
         ARRAY['hunt', 'wilderness', 'moon', 'childbirth'],
         ARRAY['bow', 'arrow', 'deer', 'moon'],
         'Greek goddess of the hunt, wilderness, and moon.'),
        
        ('Anubis', 'anubis', 'Egyptian', egyptian_pantheon_id, 'masculine',
         ARRAY['death', 'mummification', 'afterlife', 'protection'],
         ARRAY['jackal', 'scales', 'crook', 'flail'],
         'Egyptian god of death, mummification, and the afterlife.'),
        
        ('Morrigan', 'morrigan', 'Celtic', celtic_pantheon_id, 'feminine',
         ARRAY['war', 'fate', 'death', 'sovereignty'],
         ARRAY['crow', 'raven', 'wolf', 'sword'],
         'Irish goddess of war, fate, and sovereignty. Often appears as a crow.');
END $$;
