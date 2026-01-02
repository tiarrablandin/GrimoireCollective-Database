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
     'The complex pantheon of Hindu deities, including the Trimurti and many avatars and aspects.'),
    
    ('Mesopotamian Pantheon', 'mesopotamian', 'Sumerian/Babylonian/Akkadian', 'Middle East', 'Ancient Mesopotamia (4000 BCE - 500 BCE)', 'Polytheistic',
     'The gods and goddesses of ancient Mesopotamia, including Sumerian, Akkadian, and Babylonian deities.'),
    
    ('Japanese Pantheon', 'japanese', 'Japanese', 'Japan', 'Ancient - Present', 'Polytheistic (Shinto)',
     'The kami of Shinto and Buddhist deities of Japan, including nature spirits and divine ancestors.'),
    
    ('Chinese Pantheon', 'chinese', 'Chinese', 'East Asia', 'Ancient - Present', 'Polytheistic (Folk Religion)',
     'The diverse deities of Chinese folk religion, Taoism, and Buddhism, including celestial bureaucracy.'),
    
    ('Aztec Pantheon', 'aztec', 'Aztec/Mexica', 'Mesoamerica', 'Aztec Empire (1300 - 1521 CE)', 'Polytheistic',
     'The gods and goddesses of the Aztec civilization, associated with sun, war, agriculture, and death.'),
    
    ('Maya Pantheon', 'maya', 'Maya', 'Mesoamerica', 'Ancient Maya (2000 BCE - Present)', 'Polytheistic',
     'The complex pantheon of Maya deities, associated with natural forces, time, and the underworld.'),
    
    ('Yoruba Pantheon', 'yoruba', 'Yoruba', 'West Africa', 'Ancient - Present', 'Polytheistic',
     'The Orisha of Yoruba religion, powerful spirits representing natural forces and human qualities.'),
    
    ('Vodou Pantheon', 'vodou', 'Haitian Vodou', 'Caribbean', '17th Century - Present', 'Syncretic',
     'The Lwa of Haitian Vodou, spirits serving as intermediaries between Bondye and humanity.'),
    
    ('Slavic Pantheon', 'slavic', 'Slavic', 'Eastern Europe', 'Pre-Christian Slavic (6th - 12th Century)', 'Polytheistic',
     'The gods and goddesses of pre-Christian Slavic peoples, associated with nature, war, and agriculture.'),
    
    ('Native American Pantheon', 'native-american', 'Various Native American', 'North America', 'Ancient - Present', 'Varied',
     'The diverse spiritual beings and deities from various Native American traditions and tribes.'),
    
    ('Buddhist Pantheon', 'buddhist', 'Buddhist', 'Asia', 'Ancient - Present', 'Non-theistic/Varied',
     'The Buddhas, Bodhisattvas, and deities within various Buddhist traditions.'),
    
    ('Canaanite Pantheon', 'canaanite', 'Canaanite/Phoenician', 'Levant', 'Ancient Canaan (3000 - 300 BCE)', 'Polytheistic',
     'The gods and goddesses of ancient Canaan and Phoenicia, including El, Baal, and Astarte.'),
    
    ('Persian Pantheon', 'persian', 'Persian/Zoroastrian', 'Persia/Iran', 'Ancient Persia (1500 BCE - Present)', 'Dualistic',
     'The divine beings of ancient Persian religion and Zoroastrianism, led by Ahura Mazda.'),
    
    ('Inuit Pantheon', 'inuit', 'Inuit', 'Arctic', 'Ancient - Present', 'Animistic',
     'The spirits and deities of Inuit mythology, associated with nature, hunting, and survival.'),
    
    ('Australian Aboriginal Pantheon', 'aboriginal', 'Aboriginal Australian', 'Australia', 'Ancient - Present', 'Animistic',
     'The ancestral beings and spirits of Aboriginal Australian Dreamtime mythology.'),
    
    ('Baltic Pantheon', 'baltic', 'Baltic (Lithuanian/Latvian)', 'Baltic Region', 'Pre-Christian Baltic (1000 BCE - 1400 CE)', 'Polytheistic',
     'The gods and goddesses of pre-Christian Baltic peoples, including Lithuanian and Latvian traditions.'),
    
    ('Etruscan Pantheon', 'etruscan', 'Etruscan', 'Ancient Italy', 'Etruscan Civilization (900 - 100 BCE)', 'Polytheistic',
     'The deities of ancient Etruria, predecessor to Roman religion.'),
    
    ('Inca Pantheon', 'inca', 'Inca', 'South America', 'Inca Empire (1400 - 1533 CE)', 'Polytheistic',
     'The gods of the Inca Empire, centered on sun worship and natural forces.'),
    
    ('Polynesian Pantheon', 'polynesian', 'Polynesian', 'Pacific Islands', 'Ancient - Present', 'Polytheistic',
     'The gods and goddesses of Polynesian peoples, including Hawaiian, Maori, and other Pacific island traditions.'),
    
    ('Finnish Pantheon', 'finnish', 'Finnish', 'Finland', 'Ancient Finnish (1000 BCE - 1200 CE)', 'Polytheistic',
     'The deities of ancient Finnish mythology, preserved in the Kalevala epic.'),
    
    ('Armenian Pantheon', 'armenian', 'Armenian', 'Caucasus', 'Ancient Armenia (2000 BCE - 300 CE)', 'Polytheistic',
     'The pre-Christian gods and goddesses of ancient Armenia.'),
    
    ('Hittite Pantheon', 'hittite', 'Hittite', 'Anatolia', 'Hittite Empire (1600 - 1178 BCE)', 'Polytheistic',
     'The thousand gods of the Hittite Empire, blending Anatolian and Mesopotamian traditions.'),
    
    ('Korean Pantheon', 'korean', 'Korean', 'East Asia', 'Ancient - Present', 'Polytheistic/Shamanistic',
     'The spirits and deities of Korean shamanism and folk religion.'),
    
    ('Tibetan Pantheon', 'tibetan', 'Tibetan Buddhist', 'Tibet', 'Ancient - Present', 'Syncretic Buddhist',
     'The deities, Buddhas, and protectors of Tibetan Buddhism.'),
    
    ('Germanic Pantheon', 'germanic', 'Germanic', 'Northern Europe', 'Pre-Christian Germanic (100 BCE - 1000 CE)', 'Polytheistic',
     'The gods and goddesses of pre-Christian Germanic peoples, related to Norse mythology.'),
    
    ('Thracian Pantheon', 'thracian', 'Thracian', 'Balkans', 'Ancient Thrace (1000 BCE - 100 CE)', 'Polytheistic',
     'The deities of ancient Thracian civilization.'),
    
    ('Minoan-Mycenaean Pantheon', 'minoan', 'Minoan/Mycenaean', 'Greece/Crete', 'Bronze Age Greece (3000 - 1100 BCE)', 'Polytheistic',
     'The pre-Olympian deities of Minoan Crete and Mycenaean Greece.'),
    
    ('Māori Pantheon', 'maori', 'Māori', 'New Zealand', 'Ancient - Present', 'Polytheistic',
     'The atua (gods) of Māori mythology and cosmology.'),
    
    ('Akan Pantheon', 'akan', 'Akan', 'West Africa', 'Ancient - Present', 'Polytheistic',
     'The Abosom and other deities of the Akan people of Ghana.'),
    
    ('Igbo Pantheon', 'igbo', 'Igbo', 'West Africa', 'Ancient - Present', 'Polytheistic',
     'The Alusi and deities of the Igbo people of Nigeria.'),
    
    ('Voodoo Pantheon', 'voodoo', 'Louisiana Voodoo', 'North America', '18th Century - Present', 'Syncretic',
     'The spirits and deities of Louisiana Voodoo, distinct from Haitian Vodou.'),
    
    ('Scythian Pantheon', 'scythian', 'Scythian', 'Eurasian Steppe', 'Ancient Scythia (800 BCE - 300 CE)', 'Polytheistic',
     'The deities of the nomadic Scythian peoples.'),
    
    ('Gaulish Pantheon', 'gaulish', 'Gaulish Celtic', 'Ancient Gaul', 'Iron Age Gaul (500 BCE - 500 CE)', 'Polytheistic',
     'The gods and goddesses of ancient Gaul (modern France).'),
    
    ('Lusitanian Pantheon', 'lusitanian', 'Lusitanian', 'Iberian Peninsula', 'Ancient Lusitania (1000 BCE - 100 CE)', 'Polytheistic',
     'The deities of pre-Roman Iberian Peninsula peoples.'),
    
    ('Nabataean Pantheon', 'nabataean', 'Nabataean', 'Arabia', 'Nabataean Kingdom (400 BCE - 106 CE)', 'Polytheistic',
     'The deities of the Nabataean civilization of Petra.'),
    
    ('Sami Pantheon', 'sami', 'Sami', 'Northern Scandinavia', 'Ancient - Present', 'Animistic/Shamanistic',
     'The spirits and deities of indigenous Sami people of Northern Europe.'),
    
    ('Shinto Pantheon', 'shinto', 'Shinto', 'Japan', 'Ancient - Present', 'Polytheistic/Animistic',
     'The comprehensive kami (spirits) of pure Shinto tradition.'),
    
    ('Taoist Pantheon', 'taoist', 'Taoist', 'China', 'Ancient - Present', 'Philosophical/Religious',
     'The immortals, celestial beings, and deified figures of Taoism.'),
    
    ('Jain Pantheon', 'jain', 'Jain', 'India', 'Ancient - Present', 'Non-theistic',
     'The Tirthankaras and revered beings of Jainism.'),
    
    ('Sikh Pantheon', 'sikh', 'Sikh', 'Punjab', '15th Century - Present', 'Monotheistic',
     'The One God and revered figures in Sikhism.'),
    
    ('Berber Pantheon', 'berber', 'Berber/Amazigh', 'North Africa', 'Ancient - Present', 'Polytheistic',
     'The pre-Islamic deities of Berber peoples of North Africa.'),
    
    ('Olmec Pantheon', 'olmec', 'Olmec', 'Mesoamerica', 'Olmec Civilization (1500 - 400 BCE)', 'Polytheistic',
     'The deities of the ancient Olmec civilization, precursor to Mesoamerican religions.'),
    
    ('Toltec Pantheon', 'toltec', 'Toltec', 'Mesoamerica', 'Toltec Civilization (900 - 1150 CE)', 'Polytheistic',
     'The gods of the Toltec civilization, influential on later Mesoamerican cultures.'),
    
    ('Mapuche Pantheon', 'mapuche', 'Mapuche', 'South America', 'Ancient - Present', 'Polytheistic',
     'The spirits and deities of the Mapuche people of Chile and Argentina.'),
    
    ('Guarani Pantheon', 'guarani', 'Guarani', 'South America', 'Ancient - Present', 'Polytheistic',
     'The deities of Guarani peoples of Paraguay, Brazil, and surrounding regions.'),
    
    ('Caribbean Pantheon', 'caribbean', 'Taíno/Arawak', 'Caribbean', 'Pre-Columbian - 1500s', 'Polytheistic',
     'The zemis and deities of indigenous Caribbean peoples.'),
    
    ('Lakota Pantheon', 'lakota', 'Lakota Sioux', 'North America', 'Ancient - Present', 'Animistic',
     'The sacred spirits and beings of Lakota spirituality.'),
    
    ('Navajo Pantheon', 'navajo', 'Navajo/Diné', 'North America', 'Ancient - Present', 'Animistic',
     'The Holy People and sacred beings of Navajo tradition.'),
    
    ('Cherokee Pantheon', 'cherokee', 'Cherokee', 'North America', 'Ancient - Present', 'Animistic',
     'The spirits and principal beings of Cherokee spirituality.'),
    
    ('Hopi Pantheon', 'hopi', 'Hopi', 'North America', 'Ancient - Present', 'Animistic',
     'The kachinas and sacred beings of Hopi tradition.'),
    
    ('Iroquois Pantheon', 'iroquois', 'Iroquois/Haudenosaunee', 'North America', 'Ancient - Present', 'Animistic',
     'The spirits and beings of Iroquois Confederacy spirituality.');

