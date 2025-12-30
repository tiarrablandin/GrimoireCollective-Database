-- =============================================================================
-- GRIMOIRE COLLECTIVE - PANTHEONS DATA
-- =============================================================================
-- Purpose: Cultural pantheons and mythological systems
-- Dependencies: Requires 02-schema.sql (pantheons table definition)
-- =============================================================================

INSERT INTO pantheons (name, slug, culture, region, time_period, mythology_type, description) VALUES
    ('Greek Pantheon', 'greek', 'Greek', 'Mediterranean', 'Ancient Greece (800 BCE - 400 CE)', 'Polytheistic',
     'The pantheon of ancient Greek gods and goddesses, including the Olympians and other divine beings.'),
    
    ('Norse Pantheon', 'norse', 'Norse', 'Scandinavia', 'Viking Age (700 - 1100 CE)', 'Polytheistic',
     'The gods and goddesses of Norse mythology, including the Aesir and Vanir.'),
    
    ('Egyptian Pantheon', 'egyptian', 'Egyptian', 'North Africa', 'Ancient Egypt (3100 BCE - 30 BCE)', 'Polytheistic',
     'The deities of ancient Egypt, including gods of the sun, death, and the afterlife.'),
    
    ('Celtic Pantheon', 'celtic', 'Celtic', 'British Isles & Continental Europe', 'Iron Age - Medieval (500 BCE - 1000 CE)', 'Polytheistic',
     'The diverse gods and goddesses of Celtic peoples across Europe, including Irish, Welsh, and Gaulish traditions.'),
    
    ('Roman Pantheon', 'roman', 'Roman', 'Mediterranean', 'Ancient Rome (750 BCE - 400 CE)', 'Polytheistic',
     'The pantheon of ancient Roman gods and goddesses, many adapted from Greek mythology.'),
    
    ('Hindu Pantheon', 'hindu', 'Hindu', 'Indian Subcontinent', 'Ancient - Present', 'Polytheistic/Henotheistic',
     'The complex pantheon of Hindu deities, including the Trimurti and many avatars and aspects.');
