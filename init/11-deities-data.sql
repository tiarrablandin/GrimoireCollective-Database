-- =============================================================================
-- GRIMOIRE COLLECTIVE - DEITIES DATA
-- =============================================================================
-- Purpose: Deity entities with their associations and pantheon relationships
-- Dependencies: Requires 02-schema.sql (deities table definition),
--               10-pantheons-data.sql (pantheon data must be loaded first)
-- =============================================================================

DO $$
DECLARE
    aboriginal_pantheon_id UUID;
    akan_pantheon_id UUID;
    armenian_pantheon_id UUID;
    aztec_pantheon_id UUID;
    baltic_pantheon_id UUID;
    berber_pantheon_id UUID;
    buddhist_pantheon_id UUID;
    canaanite_pantheon_id UUID;
    caribbean_pantheon_id UUID;
    celtic_pantheon_id UUID;
    cherokee_pantheon_id UUID;
    chinese_pantheon_id UUID;
    egyptian_pantheon_id UUID;
    etruscan_pantheon_id UUID;
    finnish_pantheon_id UUID;
    gaulish_pantheon_id UUID;
    germanic_pantheon_id UUID;
    greek_pantheon_id UUID;
    guarani_pantheon_id UUID;
    hindu_pantheon_id UUID;
    hittite_pantheon_id UUID;
    hopi_pantheon_id UUID;
    igbo_pantheon_id UUID;
    inca_pantheon_id UUID;
    inuit_pantheon_id UUID;
    iroquois_pantheon_id UUID;
    jain_pantheon_id UUID;
    japanese_pantheon_id UUID;
    korean_pantheon_id UUID;
    lakota_pantheon_id UUID;
    lusitanian_pantheon_id UUID;
    maori_pantheon_id UUID;
    mapuche_pantheon_id UUID;
    maya_pantheon_id UUID;
    mesopotamian_pantheon_id UUID;
    minoan_pantheon_id UUID;
    nabataean_pantheon_id UUID;
    native_american_pantheon_id UUID;
    navajo_pantheon_id UUID;
    norse_pantheon_id UUID;
    olmec_pantheon_id UUID;
    persian_pantheon_id UUID;
    polynesian_pantheon_id UUID;
    roman_pantheon_id UUID;
    sami_pantheon_id UUID;
    scythian_pantheon_id UUID;
    shinto_pantheon_id UUID;
    sikh_pantheon_id UUID;
    slavic_pantheon_id UUID;
    taoist_pantheon_id UUID;
    thracian_pantheon_id UUID;
    tibetan_pantheon_id UUID;
    toltec_pantheon_id UUID;
    vodou_pantheon_id UUID;
    voodoo_pantheon_id UUID;
    yoruba_pantheon_id UUID;
BEGIN
    SELECT id INTO aboriginal_pantheon_id FROM pantheons WHERE slug = 'aboriginal';
    SELECT id INTO akan_pantheon_id FROM pantheons WHERE slug = 'akan';
    SELECT id INTO armenian_pantheon_id FROM pantheons WHERE slug = 'armenian';
    SELECT id INTO aztec_pantheon_id FROM pantheons WHERE slug = 'aztec';
    SELECT id INTO baltic_pantheon_id FROM pantheons WHERE slug = 'baltic';
    SELECT id INTO berber_pantheon_id FROM pantheons WHERE slug = 'berber';
    SELECT id INTO buddhist_pantheon_id FROM pantheons WHERE slug = 'buddhist';
    SELECT id INTO canaanite_pantheon_id FROM pantheons WHERE slug = 'canaanite';
    SELECT id INTO caribbean_pantheon_id FROM pantheons WHERE slug = 'caribbean';
    SELECT id INTO celtic_pantheon_id FROM pantheons WHERE slug = 'celtic';
    SELECT id INTO cherokee_pantheon_id FROM pantheons WHERE slug = 'cherokee';
    SELECT id INTO chinese_pantheon_id FROM pantheons WHERE slug = 'chinese';
    SELECT id INTO egyptian_pantheon_id FROM pantheons WHERE slug = 'egyptian';
    SELECT id INTO etruscan_pantheon_id FROM pantheons WHERE slug = 'etruscan';
    SELECT id INTO finnish_pantheon_id FROM pantheons WHERE slug = 'finnish';
    SELECT id INTO gaulish_pantheon_id FROM pantheons WHERE slug = 'gaulish';
    SELECT id INTO germanic_pantheon_id FROM pantheons WHERE slug = 'germanic';
    SELECT id INTO greek_pantheon_id FROM pantheons WHERE slug = 'greek';
    SELECT id INTO guarani_pantheon_id FROM pantheons WHERE slug = 'guarani';
    SELECT id INTO hindu_pantheon_id FROM pantheons WHERE slug = 'hindu';
    SELECT id INTO hittite_pantheon_id FROM pantheons WHERE slug = 'hittite';
    SELECT id INTO hopi_pantheon_id FROM pantheons WHERE slug = 'hopi';
    SELECT id INTO igbo_pantheon_id FROM pantheons WHERE slug = 'igbo';
    SELECT id INTO inca_pantheon_id FROM pantheons WHERE slug = 'inca';
    SELECT id INTO inuit_pantheon_id FROM pantheons WHERE slug = 'inuit';
    SELECT id INTO iroquois_pantheon_id FROM pantheons WHERE slug = 'iroquois';
    SELECT id INTO jain_pantheon_id FROM pantheons WHERE slug = 'jain';
    SELECT id INTO japanese_pantheon_id FROM pantheons WHERE slug = 'japanese';
    SELECT id INTO korean_pantheon_id FROM pantheons WHERE slug = 'korean';
    SELECT id INTO lakota_pantheon_id FROM pantheons WHERE slug = 'lakota';
    SELECT id INTO lusitanian_pantheon_id FROM pantheons WHERE slug = 'lusitanian';
    SELECT id INTO maori_pantheon_id FROM pantheons WHERE slug = 'maori';
    SELECT id INTO mapuche_pantheon_id FROM pantheons WHERE slug = 'mapuche';
    SELECT id INTO maya_pantheon_id FROM pantheons WHERE slug = 'maya';
    SELECT id INTO mesopotamian_pantheon_id FROM pantheons WHERE slug = 'mesopotamian';
    SELECT id INTO minoan_pantheon_id FROM pantheons WHERE slug = 'minoan';
    SELECT id INTO nabataean_pantheon_id FROM pantheons WHERE slug = 'nabataean';
    SELECT id INTO native_american_pantheon_id FROM pantheons WHERE slug = 'native-american';
    SELECT id INTO navajo_pantheon_id FROM pantheons WHERE slug = 'navajo';
    SELECT id INTO norse_pantheon_id FROM pantheons WHERE slug = 'norse';
    SELECT id INTO olmec_pantheon_id FROM pantheons WHERE slug = 'olmec';
    SELECT id INTO persian_pantheon_id FROM pantheons WHERE slug = 'persian';
    SELECT id INTO polynesian_pantheon_id FROM pantheons WHERE slug = 'polynesian';
    SELECT id INTO roman_pantheon_id FROM pantheons WHERE slug = 'roman';
    SELECT id INTO sami_pantheon_id FROM pantheons WHERE slug = 'sami';
    SELECT id INTO scythian_pantheon_id FROM pantheons WHERE slug = 'scythian';
    SELECT id INTO shinto_pantheon_id FROM pantheons WHERE slug = 'shinto';
    SELECT id INTO sikh_pantheon_id FROM pantheons WHERE slug = 'sikh';
    SELECT id INTO slavic_pantheon_id FROM pantheons WHERE slug = 'slavic';
    SELECT id INTO taoist_pantheon_id FROM pantheons WHERE slug = 'taoist';
    SELECT id INTO thracian_pantheon_id FROM pantheons WHERE slug = 'thracian';
    SELECT id INTO tibetan_pantheon_id FROM pantheons WHERE slug = 'tibetan';
    SELECT id INTO toltec_pantheon_id FROM pantheons WHERE slug = 'toltec';
    SELECT id INTO vodou_pantheon_id FROM pantheons WHERE slug = 'vodou';
    SELECT id INTO voodoo_pantheon_id FROM pantheons WHERE slug = 'voodoo';
    SELECT id INTO yoruba_pantheon_id FROM pantheons WHERE slug = 'yoruba';

    INSERT INTO deities (name, slug, pantheon_id, gender, domains, symbols, description, pronunciation) VALUES
        ('Adi Shakti', 'adi-shakti-sikh', sikh_pantheon_id, 'feminine',
         ARRAY['primordial power', 'creation', 'divine feminine'],
         ARRAY['circle', 'light'],
         'Primordial divine feminine energy in Sikh philosophy.',
         'AH-dee SHAHK-tee'),

        ('Agni', 'agni', hindu_pantheon_id, 'masculine',
         ARRAY['fire', 'sacrifice', 'purification'],
         ARRAY['flames', 'ram', 'spear'],
         'God of fire and sacrifice.',
         'AG-nee'),

        ('Agwu', 'agwu', igbo_pantheon_id, 'masculine',
         ARRAY['divination', 'healing', 'herbalism'],
         ARRAY['staff', 'herbs'],
         'Deity of divination and traditional healing.',
         'AH-gwoo'),

        ('Ah Puch', 'ah-puch', maya_pantheon_id, 'masculine',
         ARRAY['death', 'underworld', 'darkness'],
         ARRAY['skeleton', 'owl', 'bells'],
         'God of death and king of Xibalba, the underworld.',
         'ah POOCH'),

        ('Ahura Mazda', 'ahura-mazda', persian_pantheon_id, 'masculine',
         ARRAY['light', 'wisdom', 'creation', 'goodness'],
         ARRAY['fire', 'winged disk', 'light'],
         'Supreme god of Zoroastrianism, god of light and wisdom.',
         'ah-HOO-rah MAHZ-dah'),

        ('Al-Uzza', 'al-uzza', nabataean_pantheon_id, 'feminine',
         ARRAY['protection', 'war', 'morning star'],
         ARRAY['acacia tree', 'stone', 'star'],
         'Powerful goddess of protection and war.',
         'ahl-OOZ-zah'),

        ('Ala', 'ala', igbo_pantheon_id, 'feminine',
         ARRAY['earth', 'fertility', 'morality', 'death'],
         ARRAY['earth', 'yam', 'python'],
         'Earth goddess and goddess of morality and fertility.',
         'AH-lah'),

        ('Allat', 'allat', nabataean_pantheon_id, 'feminine',
         ARRAY['sky', 'protection', 'mother'],
         ARRAY['lion', 'camel'],
         'Mother goddess and protector.',
         'ah-LAHT'),

        ('Amadioha', 'amadioha', igbo_pantheon_id, 'masculine',
         ARRAY['thunder', 'lightning', 'justice'],
         ARRAY['ram', 'thunder', 'red'],
         'God of thunder, lightning, and justice.',
         'ah-mah-DEE-oh-hah'),

        ('Amaterasu', 'amaterasu', japanese_pantheon_id, 'feminine',
         ARRAY['sun', 'light', 'universe', 'fertility'],
         ARRAY['mirror', 'jewel', 'sun'],
         'Shinto sun goddess, ancestor of the imperial family.',
         'ah-mah-teh-RAH-soo'),

        ('Ame-no-Uzume', 'ame-no-uzume', shinto_pantheon_id, 'feminine',
         ARRAY['dawn', 'mirth', 'dance', 'meditation'],
         ARRAY['dance', 'mirror', 'bells'],
         'Goddess of dawn, mirth, and the arts.',
         'ah-meh-noh-oo-ZOO-meh'),

        ('Amun', 'amun-berber', berber_pantheon_id, 'masculine',
         ARRAY['sun', 'creation', 'sky'],
         ARRAY['ram', 'sun disk'],
         'Berber sun god and creator (distinct from Egyptian Amun).',
         'ah-MOON'),

        ('Anahit', 'anahit', armenian_pantheon_id, 'feminine',
         ARRAY['fertility', 'water', 'healing', 'wisdom'],
         ARRAY['rose', 'dove', 'water'],
         'Great Mother goddess of fertility and healing.',
         'ah-nah-HEET'),

        ('Anahita', 'anahita', persian_pantheon_id, 'feminine',
         ARRAY['water', 'fertility', 'wisdom', 'healing'],
         ARRAY['water', 'lotus', 'dove'],
         'Persian goddess of water, fertility, and wisdom.',
         'ah-NAH-hee-tah'),

        ('Anansi', 'anansi', akan_pantheon_id, 'masculine',
         ARRAY['trickery', 'stories', 'wisdom'],
         ARRAY['spider', 'web'],
         'Trickster spider god, keeper of all stories.',
         'ah-NAHN-see'),

        ('Angra Mainyu', 'angra-mainyu', persian_pantheon_id, 'masculine',
         ARRAY['darkness', 'destruction', 'evil'],
         ARRAY['darkness', 'serpent'],
         'Spirit of darkness and destruction in Zoroastrianism.',
         'AHN-grah MY-nyoo'),

        ('Anhangá', 'anhanga', guarani_pantheon_id, 'nonbinary',
         ARRAY['forest', 'animals', 'protection'],
         ARRAY['deer', 'forest'],
         'Forest spirit protector of animals.',
         'ahn-hahn-GAH'),

        ('Annapurna', 'annapurna', hindu_pantheon_id, 'feminine',
         ARRAY['food', 'nourishment', 'abundance'],
         ARRAY['ladle', 'pot', 'grain'],
         'Goddess of food and nourishment.',
         'ah-nah-POOR-nah'),

        ('Anu', 'anu', mesopotamian_pantheon_id, 'masculine',
         ARRAY['sky', 'kingship', 'authority'],
         ARRAY['crown', 'scepter', 'bull'],
         'Sumerian god of the sky, father of the gods.',
         'AN-oo'),

        ('Anubis', 'anubis', egyptian_pantheon_id, 'masculine',
         ARRAY['death', 'mummification', 'afterlife', 'protection'],
         ARRAY['jackal', 'scales', 'crook', 'flail'],
         'Egyptian god of death, mummification, and the afterlife.',
         'ah-NOO-bis'),

        ('Aphrodite', 'aphrodite', greek_pantheon_id, 'feminine',
         ARRAY['love', 'beauty', 'desire', 'sexuality'],
         ARRAY['dove', 'rose', 'myrtle', 'swan'],
         'Goddess of love, beauty, and desire.',
         'af-roh-DY-tee'),

        ('Api', 'api', scythian_pantheon_id, 'feminine',
         ARRAY['earth', 'fertility'],
         ARRAY['earth', 'grain'],
         'Earth mother goddess.',
         'AH-pee'),

        ('Apollo', 'apollo', greek_pantheon_id, 'masculine',
         ARRAY['sun', 'music', 'prophecy', 'healing', 'archery'],
         ARRAY['lyre', 'sun', 'laurel', 'bow'],
         'God of the sun, music, prophecy, and healing.',
         'ah-PAHL-oh'),

        ('Aramazd', 'aramazd', armenian_pantheon_id, 'masculine',
         ARRAY['creation', 'sky', 'wisdom', 'fertility'],
         ARRAY['sun', 'moon', 'stars'],
         'Supreme god of the Armenian pantheon, creator of heaven and earth.',
         'ah-rah-MAHZD'),

        ('Ares', 'ares', greek_pantheon_id, 'masculine',
         ARRAY['war', 'courage', 'violence'],
         ARRAY['spear', 'helmet', 'dog', 'vulture'],
         'God of war, violence, and bloodlust.',
         'AIR-eez'),

        ('Arinniti', 'arinniti', hittite_pantheon_id, 'feminine',
         ARRAY['sun', 'earth', 'queenship'],
         ARRAY['sun disk', 'lion'],
         'Sun goddess of Arinna, queen of the gods.',
         'ah-rin-NEE-tee'),

        ('Artemis', 'artemis', greek_pantheon_id, 'feminine',
         ARRAY['hunt', 'wilderness', 'moon', 'childbirth'],
         ARRAY['bow', 'arrow', 'deer', 'moon'],
         'Greek goddess of the hunt, wilderness, and moon.',
         'AHR-teh-mis'),

        ('Asase Yaa', 'asase-yaa', akan_pantheon_id, 'feminine',
         ARRAY['earth', 'fertility', 'truth'],
         ARRAY['earth', 'crops'],
         'Earth goddess and mother of the Akan people.',
         'ah-SAH-say YAH'),

        ('Astarte', 'astarte', canaanite_pantheon_id, 'feminine',
         ARRAY['love', 'war', 'fertility'],
         ARRAY['lion', 'star', 'sphinx'],
         'Canaanite goddess of love and war.',
         'ah-STAHR-tay'),

        ('Astghik', 'astghik', armenian_pantheon_id, 'feminine',
         ARRAY['love', 'beauty', 'water', 'springs'],
         ARRAY['rose', 'dove'],
         'Goddess of love, beauty, and water.',
         'ahst-GEEK'),

        ('Atabey', 'atabey', caribbean_pantheon_id, 'feminine',
         ARRAY['earth', 'water', 'fertility', 'moon'],
         ARRAY['frog', 'moon', 'water'],
         'Mother goddess of fresh water and fertility.',
         'ah-tah-BAY'),

        ('Ataegina', 'ataegina', lusitanian_pantheon_id, 'feminine',
         ARRAY['spring', 'rebirth', 'nature', 'underworld'],
         ARRAY['goat', 'spring', 'moon'],
         'Goddess of spring, nature, and rebirth.',
         'AH-teh-GAE-nah'),

        ('Atahensic', 'atahensic', iroquois_pantheon_id, 'feminine',
         ARRAY['sky', 'grandmother', 'moon'],
         ARRAY['moon', 'sky'],
         'Grandmother Moon, one of the first beings.',
         'at-ah-HEN-sik'),

        ('Athena', 'athena', greek_pantheon_id, 'feminine',
         ARRAY['wisdom', 'warfare', 'crafts', 'strategy'],
         ARRAY['owl', 'olive tree', 'shield', 'spear'],
         'Goddess of wisdom, strategic warfare, and crafts.',
         'ah-THEE-nah'),

        ('Avalokiteshvara', 'avalokiteshvara', buddhist_pantheon_id, 'masculine',
         ARRAY['compassion', 'mercy'],
         ARRAY['lotus', 'willow'],
         'Bodhisattva of infinite compassion.',
         'ah-vah-loh-kee-TESH-vah-rah'),

        ('Ayida-Weddo', 'ayida-weddo', vodou_pantheon_id, 'feminine',
         ARRAY['rainbow', 'fertility', 'serpents'],
         ARRAY['rainbow', 'serpent'],
         'Rainbow serpent Lwa, wife of Damballah.',
         'ah-YEE-dah WEH-doh'),

        ('Baal', 'baal', canaanite_pantheon_id, 'masculine',
         ARRAY['storms', 'fertility', 'rain'],
         ARRAY['bull', 'lightning', 'club'],
         'Canaanite god of storms and fertility.',
         'BAH-ahl'),

        ('Bacchus', 'bacchus', roman_pantheon_id, 'masculine',
         ARRAY['wine', 'festivity', 'madness', 'ecstasy'],
         ARRAY['grapevine', 'thyrsus', 'ivy'],
         'God of wine and ecstatic ritual.',
         'BAK-us'),

        ('Baldur', 'baldur', norse_pantheon_id, 'masculine',
         ARRAY['light', 'purity', 'beauty', 'joy'],
         ARRAY['mistletoe', 'light', 'ship'],
         'God of light, purity, and beauty.',
         'BAL-dur'),

        ('Baron La Croix', 'baron-la-croix', voodoo_pantheon_id, 'masculine',
         ARRAY['death', 'crossroads', 'magic'],
         ARRAY['cross', 'shovel', 'top hat'],
         'Death loa of the crossroads and magic.',
         'bahn-YAY lah KWAH'),

        ('Baron Samedi', 'baron-samedi', vodou_pantheon_id, 'masculine',
         ARRAY['death', 'resurrection', 'sexuality', 'healing'],
         ARRAY['top hat', 'skull', 'cigar', 'rum'],
         'Lwa of death and resurrection.',
         'bahn-YAY sah-meh-DEE'),

        ('Bastet', 'bastet', egyptian_pantheon_id, 'feminine',
         ARRAY['cats', 'protection', 'fertility', 'joy'],
         ARRAY['cat', 'lioness', 'sistrum', 'aegis'],
         'Goddess of cats, protection, and joy.',
         'BAHST'),

        ('Beaivi', 'beaivi', sami_pantheon_id, 'feminine',
         ARRAY['sun', 'mother', 'life', 'vegetation'],
         ARRAY['sun', 'reindeer', 'plants'],
         'Sun goddess and mother of all life.',
         'BEH-ay-vee'),

        ('Belenos', 'belenos', gaulish_pantheon_id, 'masculine',
         ARRAY['sun', 'healing', 'springs'],
         ARRAY['sun', 'horse', 'wheel'],
         'Sun god and god of healing.',
         'beh-LEH-nohs'),

        ('Bendis', 'bendis', thracian_pantheon_id, 'feminine',
         ARRAY['hunting', 'moon', 'mountains'],
         ARRAY['spear', 'fox-skin cap', 'boots'],
         'Huntress and moon goddess.',
         'BEN-dis'),

        ('Benzaiten', 'benzaiten', japanese_pantheon_id, 'feminine',
         ARRAY['music', 'arts', 'wisdom', 'water'],
         ARRAY['biwa', 'white snake', 'jewel'],
         'Buddhist-Shinto goddess of music, arts, and wisdom.',
         'ben-ZAI-ten'),

        ('Bird Monster', 'bird-monster', olmec_pantheon_id, 'masculine',
         ARRAY['sky', 'rain', 'maize'],
         ARRAY['bird', 'serpent features'],
         'Sky deity associated with rain and agriculture.',
         'BURD MON-stur'),

        ('Bragi', 'bragi', norse_pantheon_id, 'masculine',
         ARRAY['poetry', 'music', 'eloquence'],
         ARRAY['harp', 'runes'],
         'God of poetry and eloquence.',
         'BRAH-gee'),

        ('Brahma', 'brahma', hindu_pantheon_id, 'masculine',
         ARRAY['creation', 'knowledge', 'universe'],
         ARRAY['lotus', 'vedas', 'swan', 'prayer beads'],
         'Creator god, part of the Hindu Trimurti.',
         'BRAH-mah'),

        ('Brigid', 'brigid', celtic_pantheon_id, 'feminine',
         ARRAY['fire', 'poetry', 'healing', 'smithcraft'],
         ARRAY['fire', 'sacred flame', 'wells', 'cross'],
         'Irish goddess of fire, poetry, healing, and smithcraft. Associated with Imbolc.',
         'BREE-jid'),

        ('Buddha', 'buddha', buddhist_pantheon_id, 'masculine',
         ARRAY['enlightenment', 'wisdom', 'compassion', 'peace'],
         ARRAY['lotus', 'dharma wheel', 'bodhi tree'],
         'The enlightened one, founder of Buddhism.',
         'BOOD-ah'),

        ('Cai Shen', 'cai-shen', chinese_pantheon_id, 'masculine',
         ARRAY['wealth', 'prosperity', 'fortune'],
         ARRAY['gold', 'ingots', 'tiger'],
         'God of wealth and prosperity.',
         'TSY SHEN'),

        ('Ceres', 'ceres', roman_pantheon_id, 'feminine',
         ARRAY['agriculture', 'grain', 'fertility'],
         ARRAY['wheat', 'cornucopia', 'torch'],
         'Goddess of agriculture and grain.',
         'SEE-reez'),

        ('Cernunnos', 'cernunnos', celtic_pantheon_id, 'masculine',
         ARRAY['nature', 'fertility', 'animals', 'wild'],
         ARRAY['antlers', 'torque', 'serpent', 'stag'],
         'Celtic horned god of nature, fertility, and animals.',
         'ker-NOON-ohs'),

        ('Chaac', 'chaac', maya_pantheon_id, 'masculine',
         ARRAY['rain', 'thunder', 'lightning', 'agriculture'],
         ARRAY['lightning axe', 'serpent', 'frog'],
         'God of rain and thunder.',
         'CHAHK'),

        ('Chalchiuhtlicue', 'chalchiuhtlicue', aztec_pantheon_id, 'feminine',
         ARRAY['water', 'rivers', 'lakes', 'childbirth'],
         ARRAY['jade skirt', 'water', 'streams'],
         'Goddess of water, rivers, and childbirth.',
         'chal-chee-oot-LEE-kway'),

        ('Chalchiuhtlicue', 'chalchiuhtlicue-toltec', toltec_pantheon_id, 'feminine',
         ARRAY['water', 'rivers', 'lakes', 'storms'],
         ARRAY['jade', 'water', 'river'],
         'Goddess of rivers, lakes, and water.',
         'chal-chee-oot-LEE-kway'),

        ('Chandra', 'chandra', hindu_pantheon_id, 'masculine',
         ARRAY['moon', 'plants', 'vegetation'],
         ARRAY['moon', 'lotus', 'rabbit'],
         'God of the moon and plants.',
         'CHAHN-drah'),

        ('Changing Woman', 'changing-woman', navajo_pantheon_id, 'feminine',
         ARRAY['seasons', 'fertility', 'creation'],
         ARRAY['turquoise', 'corn', 'seasons'],
         'Benevolent goddess of the seasons and life cycles.',
         'CHAYN-jing WOO-man'),

        ('Chukwu', 'chukwu', igbo_pantheon_id, 'nonbinary',
         ARRAY['creation', 'supreme being', 'chi'],
         ARRAY['sky', 'sun'],
         'Supreme creator deity of the Igbo people.',
         'CHOO-kwoo'),

        ('Coatlicue', 'coatlicue', aztec_pantheon_id, 'feminine',
         ARRAY['earth', 'fertility', 'life', 'death'],
         ARRAY['serpent skirt', 'skull', 'hearts'],
         'Earth mother goddess of life and death.',
         'koh-aht-lee-KWAY'),

        ('Coyote', 'coyote', navajo_pantheon_id, 'masculine',
         ARRAY['trickery', 'chaos', 'transformation'],
         ARRAY['coyote'],
         'Trickster figure who brings both trouble and wisdom.',
         'KOY-oh-tee'),

        ('Coyote Spirit', 'coyote-spirit', native_american_pantheon_id, 'masculine',
         ARRAY['trickster', 'teaching', 'transformation'],
         ARRAY['coyote'],
         'Trickster and cultural transformer found across tribes.',
         'ky-OH-tee SPEER-it'),

        ('Dagda', 'dagda', celtic_pantheon_id, 'masculine',
         ARRAY['fertility', 'agriculture', 'strength', 'magic'],
         ARRAY['club', 'cauldron', 'harp'],
         'Irish father god, leader of the Tuatha Dé Danann.',
         'DAH-dah'),

        ('Damballah', 'damballah', vodou_pantheon_id, 'masculine',
         ARRAY['creation', 'serpents', 'wisdom', 'fertility'],
         ARRAY['serpent', 'white', 'egg'],
         'Primordial serpent Lwa of creation and wisdom.',
         'dahm-bah-LAH'),

        ('Dangun', 'dangun', korean_pantheon_id, 'masculine',
         ARRAY['nation', 'founding', 'mountains'],
         ARRAY['bear', 'mugwort', 'garlic'],
         'Legendary founder of the first Korean kingdom.',
         'dahn-GOON'),

        ('Danu', 'danu', celtic_pantheon_id, 'feminine',
         ARRAY['water', 'wisdom', 'prosperity', 'earth'],
         ARRAY['river', 'earth', 'abundance'],
         'Irish mother goddess, ancestor of the Tuatha Dé Danann.',
         'DAHN-oo'),

        ('Dazhbog', 'dazhbog', slavic_pantheon_id, 'masculine',
         ARRAY['sun', 'warmth', 'prosperity'],
         ARRAY['sun', 'fire', 'horse'],
         'God of the sun and prosperity.',
         'DAHZH-bahg'),

        ('Demeter', 'demeter', greek_pantheon_id, 'feminine',
         ARRAY['agriculture', 'harvest', 'grain', 'fertility'],
         ARRAY['wheat', 'cornucopia', 'torch', 'pig'],
         'Goddess of agriculture, harvest, and grain.',
         'deh-MEE-tur'),

        ('Diana', 'diana', roman_pantheon_id, 'feminine',
         ARRAY['hunt', 'moon', 'wilderness', 'childbirth'],
         ARRAY['bow', 'deer', 'moon', 'cypress'],
         'Goddess of the hunt and the moon.',
         'dy-AN-ah'),

        ('Diktynna', 'diktynna', minoan_pantheon_id, 'feminine',
         ARRAY['mountains', 'hunting', 'nets'],
         ARRAY['net', 'mountains'],
         'Mountain goddess and huntress.',
         'dik-TIN-nah'),

        ('Dionysus', 'dionysus', greek_pantheon_id, 'masculine',
         ARRAY['wine', 'festivity', 'madness', 'theatre'],
         ARRAY['grapevine', 'thyrsus', 'ivy', 'leopard'],
         'God of wine, festivity, and ecstatic ritual.',
         'dy-oh-NY-suhs'),

        ('Donar', 'donar', germanic_pantheon_id, 'masculine',
         ARRAY['thunder', 'protection', 'strength'],
         ARRAY['hammer', 'oak', 'lightning'],
         'Germanic equivalent of Thor, thunder god.',
         'DOH-nar'),

        ('Dragon King', 'dragon-king', chinese_pantheon_id, 'masculine',
         ARRAY['water', 'weather', 'oceans'],
         ARRAY['dragon', 'pearl', 'waves'],
         'Deity of the seas and weather.',
         'DRAG-un KING'),

        ('Durga', 'durga', hindu_pantheon_id, 'feminine',
         ARRAY['war', 'protection', 'strength', 'motherhood'],
         ARRAY['lion', 'tiger', 'weapons', 'lotus'],
         'Warrior goddess who protects against evil.',
         'DOOR-gah'),

        ('Dushara', 'dushara', nabataean_pantheon_id, 'masculine',
         ARRAY['mountains', 'wine', 'fertility', 'kingship'],
         ARRAY['block stone', 'vine', 'eagle'],
         'Supreme god of the Nabataeans, lord of the mountain.',
         'DOO-shah-rah'),

        ('Ebisu', 'ebisu', japanese_pantheon_id, 'masculine',
         ARRAY['fishing', 'commerce', 'fortune'],
         ARRAY['fishing rod', 'tai fish'],
         'God of fishermen, luck, and commerce.',
         'eh-BEE-soo'),

        ('Eight Immortals', 'eight-immortals', taoist_pantheon_id, 'nonbinary',
         ARRAY['longevity', 'immortality', 'wisdom'],
         ARRAY['various magical implements'],
         'Group of legendary Taoist immortals with divine powers.',
         'AYT ih-MOR-tulz'),

        ('Eileithyia', 'eileithyia', minoan_pantheon_id, 'feminine',
         ARRAY['childbirth', 'labor', 'midwifery'],
         ARRAY['torch', 'cave'],
         'Goddess of childbirth and labor pains.',
         'eye-lay-THY-ah'),

        ('Eir', 'eir', norse_pantheon_id, 'feminine',
         ARRAY['healing', 'medicine', 'mercy'],
         ARRAY['healing herbs', 'medical instruments'],
         'Goddess of healing and medicine.',
         'AYR'),

        ('Ek Chuah', 'ek-chuah', maya_pantheon_id, 'masculine',
         ARRAY['merchants', 'cacao', 'war'],
         ARRAY['bundle', 'cacao', 'spear'],
         'God of merchants, cacao, and warriors.',
         'ek CHOO-ah'),

        ('El', 'el', canaanite_pantheon_id, 'masculine',
         ARRAY['creation', 'wisdom', 'authority'],
         ARRAY['bull', 'throne'],
         'Supreme creator god of the Canaanite pantheon.',
         'EL'),

        ('Endovelicus', 'endovelicus', lusitanian_pantheon_id, 'masculine',
         ARRAY['health', 'safety', 'underworld', 'rebirth'],
         ARRAY['rooster', 'pig', 'knife'],
         'Chthonic god of health and the underworld.',
         'en-DOH-veh-lee-kohs'),

        ('Enki', 'enki', mesopotamian_pantheon_id, 'masculine',
         ARRAY['water', 'wisdom', 'magic', 'crafts'],
         ARRAY['flowing water', 'fish', 'goat'],
         'Sumerian god of water, wisdom, and magic.',
         'EN-kee'),

        ('Enlil', 'enlil', mesopotamian_pantheon_id, 'masculine',
         ARRAY['wind', 'storms', 'earth', 'authority'],
         ARRAY['tablet of destinies', 'wind', 'mountain'],
         'Sumerian god of wind and storms, king of the gods.',
         'EN-lil'),

        ('Epona', 'epona', celtic_pantheon_id, 'feminine',
         ARRAY['horses', 'fertility', 'abundance'],
         ARRAY['mare', 'cornucopia', 'dog'],
         'Gaulish goddess of horses, widely worshipped in Celtic lands.',
         'eh-POHN-ah'),

        ('Erebus', 'erebus', greek_pantheon_id, 'masculine',
         ARRAY['darkness', 'shadow', 'underworld'],
         ARRAY['darkness', 'mist'],
         'Primordial god of darkness.',
         'AIR-eh-bus'),

        ('Ereshkigal', 'ereshkigal', mesopotamian_pantheon_id, 'feminine',
         ARRAY['underworld', 'death', 'darkness'],
         ARRAY['darkness', 'underworld'],
         'Sumerian goddess of the underworld.',
         'eh-resh-KEE-gahl'),

        ('Erlang Shen', 'erlang-shen', chinese_pantheon_id, 'masculine',
         ARRAY['engineering', 'hunting', 'war'],
         ARRAY['three-pointed spear', 'third eye', 'dog'],
         'God of engineering and demon-hunting warrior.',
         'ur-LAHNG SHEN'),

        ('Eros', 'eros', greek_pantheon_id, 'masculine',
         ARRAY['love', 'desire', 'attraction'],
         ARRAY['bow and arrow', 'torch', 'wings'],
         'God of love and sexual desire.',
         'AIR-ohs'),

        ('Erzulie Freda', 'erzulie-freda', vodou_pantheon_id, 'feminine',
         ARRAY['love', 'beauty', 'luxury', 'femininity'],
         ARRAY['mirror', 'jewelry', 'perfume', 'pink'],
         'Lwa of love, beauty, and luxury.',
         'AIR-zoo-lee FRAY-dah'),

        ('Eshu', 'eshu', yoruba_pantheon_id, 'masculine',
         ARRAY['trickery', 'crossroads', 'communication', 'choice'],
         ARRAY['crossroads', 'colors', 'cowrie shells'],
         'Trickster Orisha of crossroads and choice.',
         'eh-SHOO'),

        ('Esus', 'esus', gaulish_pantheon_id, 'masculine',
         ARRAY['woodlands', 'trade', 'journeys'],
         ARRAY['axe', 'tree', 'crane'],
         'God of woodlands and commerce.',
         'EH-soos'),

        ('Feathered Serpent', 'feathered-serpent-olmec', olmec_pantheon_id, 'nonbinary',
         ARRAY['creation', 'wind', 'knowledge'],
         ARRAY['serpent', 'feathers', 'maize'],
         'Early form of the feathered serpent deity.',
         'FAY-thurd SUR-pent'),

        ('Forseti', 'forseti', norse_pantheon_id, 'masculine',
         ARRAY['justice', 'mediation', 'reconciliation'],
         ARRAY['axe', 'scales'],
         'God of justice and reconciliation.',
         'FOR-see-tee'),

        ('Freyja', 'freyja', norse_pantheon_id, 'feminine',
         ARRAY['love', 'beauty', 'war', 'seidr'],
         ARRAY['falcon', 'cats', 'amber', 'boar'],
         'Norse goddess of love, beauty, war, and seidr magic.',
         'FRAY-ah'),

        ('Freyr', 'freyr', norse_pantheon_id, 'masculine',
         ARRAY['fertility', 'prosperity', 'peace', 'sunshine'],
         ARRAY['boar', 'ship', 'antler'],
         'God of fertility, prosperity, and fair weather.',
         'FRAYR'),

        ('Frigg', 'frigg', norse_pantheon_id, 'feminine',
         ARRAY['marriage', 'motherhood', 'prophecy', 'wisdom'],
         ARRAY['spinning wheel', 'keys', 'mistletoe'],
         'Queen of Asgard, goddess of marriage and motherhood.',
         'FRIG-ah'),

        ('Frija', 'frija', germanic_pantheon_id, 'feminine',
         ARRAY['love', 'marriage', 'fertility'],
         ARRAY['keys', 'distaff'],
         'Germanic goddess of love and marriage.',
         'FRYE-ah'),

        ('Fujin', 'fujin', japanese_pantheon_id, 'masculine',
         ARRAY['wind', 'storms'],
         ARRAY['wind bag', 'whirlwind'],
         'Shinto god of wind.',
         'foo-JIN'),

        ('Gaia', 'gaia', greek_pantheon_id, 'feminine',
         ARRAY['earth', 'nature', 'motherhood'],
         ARRAY['earth', 'fruits', 'flowers'],
         'Primordial mother goddess of the Earth.',
         'GAY-ah'),

        ('Ganesha', 'ganesha', hindu_pantheon_id, 'masculine',
         ARRAY['wisdom', 'beginnings', 'obstacles', 'success'],
         ARRAY['elephant head', 'mouse', 'axe', 'modak'],
         'Elephant-headed god of wisdom and remover of obstacles.',
         'gah-NEH-shah'),

        ('Geb', 'geb', egyptian_pantheon_id, 'masculine',
         ARRAY['earth', 'fertility', 'vegetation'],
         ARRAY['goose', 'earth'],
         'God of the earth.',
         'GEB'),

        ('Gilgamesh', 'gilgamesh', mesopotamian_pantheon_id, 'masculine',
         ARRAY['heroism', 'strength', 'kingship'],
         ARRAY['bull', 'axe'],
         'Deified hero-king of Uruk, seeker of immortality.',
         'GIL-gah-mesh'),

        ('Goitosyros', 'goitosyros', scythian_pantheon_id, 'masculine',
         ARRAY['sun', 'war', 'oaths'],
         ARRAY['sword', 'sun'],
         'God of the sun and sacred oaths.',
         'goy-TOH-seer-ohs'),

        ('Great Spirit', 'great-spirit', native_american_pantheon_id, 'nonbinary',
         ARRAY['creation', 'life', 'universe'],
         ARRAY['circle', 'eagle feather'],
         'Universal life force and creator (concept across many tribes).',
         'GRAYT SPEER-it'),

        ('Green Tara', 'green-tara', tibetan_pantheon_id, 'feminine',
         ARRAY['action', 'protection', 'compassion'],
         ARRAY['green lotus', 'blue utpala flower'],
         'Mother of liberation, active compassion personified.',
         'GREEN TAH-rah'),

        ('Guabancex', 'guabancex', caribbean_pantheon_id, 'feminine',
         ARRAY['hurricanes', 'storms', 'wind'],
         ARRAY['wind', 'storm', 'destruction'],
         'Goddess of hurricanes and storms.',
         'gwah-KAR'),

        ('Guan Yin', 'guan-yin', chinese_pantheon_id, 'feminine',
         ARRAY['compassion', 'mercy', 'kindness'],
         ARRAY['lotus', 'willow', 'vase'],
         'Bodhisattva of compassion and mercy.',
         'gwahn YIN'),

        ('Guru Gobind Singh', 'guru-gobind-singh', sikh_pantheon_id, 'masculine',
         ARRAY['courage', 'justice', 'warrior', 'poet'],
         ARRAY['sword', 'falcon', 'double-edged sword'],
         'Tenth Guru, established the Khalsa warrior community.',
         'GOO-roo goh-BIND SING'),

        ('Guru Nanak', 'guru-nanak', sikh_pantheon_id, 'masculine',
         ARRAY['teaching', 'equality', 'truth', 'compassion'],
         ARRAY['book', 'light', 'lotus'],
         'First Guru and founder of Sikhism, divine teacher.',
         'GOO-roo NAH-nuk'),

        ('Gurzil', 'gurzil', berber_pantheon_id, 'masculine',
         ARRAY['war', 'sun', 'bulls'],
         ARRAY['bull', 'sun', 'spear'],
         'Berber war god represented as a bull.',
         'goor-ZEEL'),

        ('Hachiman', 'hachiman', japanese_pantheon_id, 'masculine',
         ARRAY['war', 'archery', 'protection'],
         ARRAY['bow', 'dove'],
         'Syncretic god of war and divine protector of Japan.',
         'HA-chee-mahn'),

        ('Hades', 'hades', greek_pantheon_id, 'masculine',
         ARRAY['underworld', 'death', 'wealth', 'minerals'],
         ARRAY['helm of darkness', 'cerberus', 'narcissus', 'cypress'],
         'God of the underworld and the dead.',
         'HAY-deez'),

        ('Hanuman', 'hanuman', hindu_pantheon_id, 'masculine',
         ARRAY['strength', 'courage', 'devotion', 'service'],
         ARRAY['mace', 'mountain', 'tail'],
         'Monkey god of strength, courage, and devotion.',
         'HAH-noo-mahn'),

        ('Hathor', 'hathor', egyptian_pantheon_id, 'feminine',
         ARRAY['love', 'beauty', 'music', 'motherhood'],
         ARRAY['cow', 'sistrum', 'mirror', 'menat'],
         'Goddess of love, beauty, and music.',
         'HAH-thor'),

        ('Haumea', 'haumea', polynesian_pantheon_id, 'feminine',
         ARRAY['fertility', 'childbirth', 'nature'],
         ARRAY['sacred tree', 'childbirth'],
         'Hawaiian goddess of fertility and childbirth.',
         'HAH-oo-mee-ah'),

        ('Hecate', 'hecate', greek_pantheon_id, 'feminine',
         ARRAY['magic', 'crossroads', 'moon', 'necromancy'],
         ARRAY['torch', 'key', 'dagger', 'dog'],
         'Greek goddess of magic, crossroads, and the moon. Guardian of thresholds.',
         'HEK-ah-tee'),

        ('Heimdall', 'heimdall', norse_pantheon_id, 'masculine',
         ARRAY['guardianship', 'vigilance', 'sight', 'hearing'],
         ARRAY['horn', 'sword', 'rainbow bridge'],
         'Guardian of the rainbow bridge Bifrost.',
         'HEY-muhdal'),

        ('Hel', 'hel', norse_pantheon_id, 'feminine',
         ARRAY['death', 'underworld', 'dishonored dead'],
         ARRAY['half-corpse', 'darkness'],
         'Goddess of the underworld and the dishonored dead.',
         'HEL'),

        ('Helios', 'helios', greek_pantheon_id, 'masculine',
         ARRAY['sun', 'sight', 'oaths'],
         ARRAY['sun chariot', 'crown of rays'],
         'Titan god of the sun.',
         'HEE-lee-ohs'),

        ('Hephaestus', 'hephaestus', greek_pantheon_id, 'masculine',
         ARRAY['fire', 'forge', 'craftsmanship', 'metallurgy'],
         ARRAY['hammer', 'anvil', 'tongs', 'volcano'],
         'God of fire, metalworking, and craftsmanship.',
         'heh-FY-stuhs'),

        ('Hera', 'hera', greek_pantheon_id, 'feminine',
         ARRAY['marriage', 'family', 'childbirth', 'queenship'],
         ARRAY['peacock', 'cow', 'crown', 'pomegranate'],
         'Queen of the gods, goddess of marriage and family.',
         'HEH-rah'),

        ('Hermes', 'hermes', greek_pantheon_id, 'masculine',
         ARRAY['travelers', 'thieves', 'commerce', 'messages'],
         ARRAY['caduceus', 'winged sandals', 'tortoise', 'rooster'],
         'Messenger of the gods, patron of travelers and thieves.',
         'HUR-meez'),

        ('Hestia', 'hestia', greek_pantheon_id, 'feminine',
         ARRAY['hearth', 'home', 'family', 'domesticity'],
         ARRAY['hearth', 'flame', 'kettle'],
         'Goddess of the hearth, home, and family.',
         'HES-tee-ah'),

        ('Hine-nui-te-po', 'hine-nui-te-po', maori_pantheon_id, 'feminine',
         ARRAY['death', 'underworld', 'night'],
         ARRAY['darkness', 'obsidian'],
         'Goddess of death and the underworld.',
         'HEE-neh NOO-ee teh POH'),

        ('Hino', 'hino', iroquois_pantheon_id, 'masculine',
         ARRAY['thunder', 'guardian', 'war'],
         ARRAY['thunder', 'lightning', 'bow'],
         'Thunder spirit and guardian of the sky.',
         'HEE-noh'),

        ('Horagalles', 'horagalles', sami_pantheon_id, 'masculine',
         ARRAY['thunder', 'lightning', 'weather'],
         ARRAY['hammer', 'boat', 'lightning'],
         'Thunder god (similar to Thor).',
         'hoh-rah-GAH-lees'),

        ('Horus', 'horus', egyptian_pantheon_id, 'masculine',
         ARRAY['sky', 'kingship', 'protection', 'war'],
         ARRAY['falcon', 'eye of Horus', 'double crown'],
         'God of the sky and divine kingship.',
         'HOR-us'),

        ('Huitzilopochtli', 'huitzilopochtli', aztec_pantheon_id, 'masculine',
         ARRAY['sun', 'war', 'sacrifice', 'will'],
         ARRAY['hummingbird', 'fire serpent', 'atlatl'],
         'Aztec god of sun, war, and human sacrifice.',
         'wee-tsee-loh-POHCH-tlee'),

        ('Hwanung', 'hwanung', korean_pantheon_id, 'masculine',
         ARRAY['civilization', 'culture', 'humanity'],
         ARRAY['sword', 'mirror', 'drum'],
         'Divine being who descended to earth and founded Korean civilization.',
         'HWAN-oong'),

        ('Idun', 'idun', norse_pantheon_id, 'feminine',
         ARRAY['youth', 'rejuvenation', 'immortality'],
         ARRAY['golden apples', 'spring'],
         'Goddess of youth, keeper of the golden apples.',
         'ID-oon'),

        ('Ikenga', 'ikenga', igbo_pantheon_id, 'masculine',
         ARRAY['achievement', 'success', 'strength'],
         ARRAY['horns', 'knife', 'head'],
         'Personal god of human endeavor and achievement.',
         'ee-KENG-gah'),

        ('Iktomi', 'iktomi', lakota_pantheon_id, 'masculine',
         ARRAY['trickery', 'wisdom', 'spiders'],
         ARRAY['spider', 'web'],
         'Trickster spider spirit who teaches through mischief.',
         'ik-TOH-mee'),

        ('Illapa', 'illapa', inca_pantheon_id, 'masculine',
         ARRAY['thunder', 'lightning', 'rain', 'war'],
         ARRAY['sling', 'lightning'],
         'Weather god of thunder and lightning.',
         'ee-YAH-pah'),

        ('Inanna', 'inanna', mesopotamian_pantheon_id, 'feminine',
         ARRAY['love', 'war', 'fertility', 'sexuality'],
         ARRAY['eight-pointed star', 'lion', 'owl', 'rosette'],
         'Sumerian goddess of love, war, and fertility.',
         'in-AH-nah'),

        ('Inari', 'inari', japanese_pantheon_id, 'nonbinary',
         ARRAY['rice', 'fertility', 'foxes', 'prosperity'],
         ARRAY['fox', 'rice', 'jewel', 'key'],
         'Shinto deity of rice, fertility, and prosperity.',
         'in-AH-ree'),

        ('Indra', 'indra', hindu_pantheon_id, 'masculine',
         ARRAY['rain', 'thunder', 'war', 'heaven'],
         ARRAY['vajra', 'elephant', 'rainbow'],
         'King of the gods, god of rain and thunder.',
         'IN-drah'),

        ('Inti', 'inti', inca_pantheon_id, 'masculine',
         ARRAY['sun', 'agriculture', 'divine right'],
         ARRAY['sun disk', 'gold'],
         'Inca sun god and divine ancestor of emperors.',
         'IN-tee'),

        ('Inyan', 'inyan', lakota_pantheon_id, 'masculine',
         ARRAY['stone', 'earth', 'primordial'],
         ARRAY['stone', 'rock'],
         'Primordial stone, first of all creation.',
         'in-YAH-kah-GAH-pee'),

        ('Ishtar', 'ishtar', mesopotamian_pantheon_id, 'feminine',
         ARRAY['love', 'war', 'fertility', 'sexuality'],
         ARRAY['star', 'lion', 'dove'],
         'Babylonian goddess of love and war (equivalent to Inanna).',
         'ISH-tar'),

        ('Isis', 'isis', egyptian_pantheon_id, 'feminine',
         ARRAY['magic', 'motherhood', 'healing', 'protection'],
         ARRAY['throne', 'ankh', 'sistrum', 'knot'],
         'Goddess of magic, motherhood, and healing.',
         'EYE-sis'),

        ('Itzamna', 'itzamna', maya_pantheon_id, 'masculine',
         ARRAY['creation', 'writing', 'wisdom', 'sky'],
         ARRAY['serpent', 'book', 'sky'],
         'Maya creator god and god of the sky.',
         'ee-tsahm-NAH'),

        ('Ix Chel', 'ix-chel', maya_pantheon_id, 'feminine',
         ARRAY['moon', 'medicine', 'weaving', 'childbirth'],
         ARRAY['moon', 'snake', 'spindle'],
         'Goddess of the moon, medicine, and childbirth.',
         'eesh CHEL'),

        ('Izanagi', 'izanagi', japanese_pantheon_id, 'masculine',
         ARRAY['creation', 'life', 'sky'],
         ARRAY['jeweled spear'],
         'Creator god who formed the islands of Japan.',
         'ee-zah-NAH-ghee'),

        ('Izanami', 'izanami', japanese_pantheon_id, 'feminine',
         ARRAY['creation', 'death', 'underworld'],
         ARRAY['underworld', 'death'],
         'Creator goddess and goddess of death and the underworld.',
         'ee-zah-NAH-mee'),

        ('Jacheongbi', 'jacheongbi', korean_pantheon_id, 'feminine',
         ARRAY['agriculture', 'grain', 'farming'],
         ARRAY['grain', 'seeds'],
         'Goddess of agriculture and grain.',
         'jah-CHUNG-bee'),

        ('Jacy', 'jacy', guarani_pantheon_id, 'feminine',
         ARRAY['moon', 'plants', 'reproduction'],
         ARRAY['moon', 'jaguar'],
         'Moon goddess who governs plant life.',
         'YAH-see'),

        ('Jade Emperor', 'jade-emperor', chinese_pantheon_id, 'masculine',
         ARRAY['heaven', 'authority', 'justice'],
         ARRAY['jade', 'dragon', 'heaven'],
         'Supreme ruler of heaven in Chinese folk religion.',
         'JAYD EM-pur-ur'),

        ('Janus', 'janus', roman_pantheon_id, 'masculine',
         ARRAY['beginnings', 'endings', 'doorways', 'transitions'],
         ARRAY['two faces', 'key', 'staff'],
         'God of beginnings, endings, and doorways.',
         'YAY-nuhs'),

        ('Juno', 'juno', roman_pantheon_id, 'feminine',
         ARRAY['marriage', 'childbirth', 'family'],
         ARRAY['peacock', 'cow', 'crown'],
         'Queen of the gods, protector of marriage.',
         'JOO-noh'),

        ('Jupiter', 'jupiter', roman_pantheon_id, 'masculine',
         ARRAY['sky', 'thunder', 'justice', 'kingship'],
         ARRAY['lightning bolt', 'eagle', 'oak', 'scepter'],
         'King of the Roman gods, equivalent to Greek Zeus.',
         'JOO-pih-tur'),

        ('Juracán', 'juracan', caribbean_pantheon_id, 'masculine',
         ARRAY['chaos', 'hurricanes', 'destruction'],
         ARRAY['spiral', 'wind'],
         'God of chaos and hurricanes (origin of "hurricane").',
         'hoo-rah-KAHN'),

        ('Kagutsuchi', 'kagutsuchi', shinto_pantheon_id, 'masculine',
         ARRAY['fire', 'volcanoes', 'destruction'],
         ARRAY['fire', 'flames'],
         'God of fire and volcanoes.',
         'kah-goo-TSOO-chee'),

        ('Kali', 'kali', hindu_pantheon_id, 'feminine',
         ARRAY['time', 'death', 'destruction', 'transformation'],
         ARRAY['sword', 'skull', 'tongue', 'third eye'],
         'Fierce goddess of time, death, and transformation.',
         'KAH-lee'),

        ('Kali Ma', 'kali-ma', hindu_pantheon_id, 'feminine',
         ARRAY['destruction', 'motherhood', 'time', 'change'],
         ARRAY['sword', 'skull necklace', 'tongue'],
         'Dark mother goddess of time and change.',
         'KAH-lee MAH'),

        ('Kamrusepa', 'kamrusepa', hittite_pantheon_id, 'feminine',
         ARRAY['magic', 'healing', 'medicine'],
         ARRAY['herbs', 'eagle'],
         'Goddess of magic and healing.',
         'kahm-roo-SEH-pah'),

        ('Kanaloa', 'kanaloa', polynesian_pantheon_id, 'masculine',
         ARRAY['ocean', 'healing', 'magic'],
         ARRAY['octopus', 'squid', 'ocean'],
         'Hawaiian god of the ocean and magic.',
         'kah-nah-LOH-ah'),

        ('Kanati', 'kanati', cherokee_pantheon_id, 'masculine',
         ARRAY['hunting', 'animals', 'game'],
         ARRAY['bow', 'deer'],
         'The Lucky Hunter, first man and keeper of the animals.',
         'KAH-nah-tee'),

        ('Kane', 'kane', polynesian_pantheon_id, 'masculine',
         ARRAY['creation', 'life', 'forests', 'fresh water'],
         ARRAY['sunlight', 'forest'],
         'Hawaiian creator god of forests and fresh water.',
         'KAH-neh'),

        ('Kartikeya', 'kartikeya', hindu_pantheon_id, 'masculine',
         ARRAY['war', 'victory', 'wisdom', 'love'],
         ARRAY['spear', 'rooster', 'peacock'],
         'God of war, son of Shiva and Parvati.',
         'kar-tee-KAY-ah'),

        ('Khepri', 'khepri', egyptian_pantheon_id, 'masculine',
         ARRAY['rebirth', 'transformation', 'morning sun'],
         ARRAY['scarab beetle', 'sun disk'],
         'God of rebirth, morning sun, and transformation.',
         'KEH-pree'),

        ('Khnum', 'khnum', egyptian_pantheon_id, 'masculine',
         ARRAY['creation', 'water', 'fertility'],
         ARRAY['potter''s wheel', 'ram', 'ankh'],
         'Ram-headed god who created humans on his potter''s wheel.',
         'k-NOOM'),

        ('Kitchen God', 'kitchen-god', chinese_pantheon_id, 'masculine',
         ARRAY['family', 'household', 'cooking'],
         ARRAY['hearth', 'scroll'],
         'Household deity who reports to the Jade Emperor.',
         'KIH-chen GOD'),

        ('Kokopelli', 'kokopelli', hopi_pantheon_id, 'masculine',
         ARRAY['fertility', 'music', 'mischief'],
         ARRAY['flute', 'hump'],
         'Fertility deity and trickster known for playing the flute.',
         'koh-koh-PEL-lee'),

        ('Kotys', 'kotys', thracian_pantheon_id, 'feminine',
         ARRAY['war', 'ecstasy', 'wilderness'],
         ARRAY['sword', 'drum'],
         'Goddess of war and ecstatic rites.',
         'KOH-tees'),

        ('Krishna', 'krishna', hindu_pantheon_id, 'masculine',
         ARRAY['love', 'compassion', 'tenderness', 'protection'],
         ARRAY['flute', 'peacock feather', 'cow', 'butter'],
         'Avatar of Vishnu, god of love and compassion.',
         'KRISH-nah'),

        ('Kronos', 'kronos', greek_pantheon_id, 'masculine',
         ARRAY['time', 'harvest', 'ages'],
         ARRAY['sickle', 'scythe'],
         'Titan of time, father of Zeus, Hades, and Poseidon.',
         'KROH-nohs'),

        ('Kuarahy', 'kuarahy', guarani_pantheon_id, 'masculine',
         ARRAY['sun', 'light', 'day'],
         ARRAY['sun', 'light'],
         'Sun god and bringer of light.',
         'kwah-rah-HEE'),

        ('Kukulkan', 'kukulkan', maya_pantheon_id, 'masculine',
         ARRAY['wind', 'rain', 'wisdom'],
         ARRAY['feathered serpent', 'wind'],
         'Feathered Serpent god (Maya equivalent of Quetzalcoatl).',
         'koo-kool-KAHN'),

        ('Lakshmi', 'lakshmi', hindu_pantheon_id, 'feminine',
         ARRAY['wealth', 'prosperity', 'fortune', 'beauty'],
         ARRAY['lotus', 'gold coins', 'owl', 'elephant'],
         'Goddess of wealth, prosperity, and fortune.',
         'LAK-shmee'),

        ('Laozi', 'laozi', taoist_pantheon_id, 'masculine',
         ARRAY['wisdom', 'tao', 'philosophy'],
         ARRAY['scroll', 'buffalo'],
         'Deified founder of Taoism, author of Tao Te Ching.',
         'LAO-dzuh'),

        ('Loki', 'loki', norse_pantheon_id, 'masculine',
         ARRAY['trickery', 'chaos', 'fire', 'shapeshifting'],
         ARRAY['serpent', 'flames', 'net'],
         'Trickster god associated with chaos and change.',
         'LOH-kee'),

        ('Lono', 'lono', polynesian_pantheon_id, 'masculine',
         ARRAY['fertility', 'agriculture', 'rain', 'music'],
         ARRAY['sweet potato', 'rain', 'peace'],
         'Hawaiian god of fertility and peace.',
         'LOH-noh'),

        ('Lugh', 'lugh', celtic_pantheon_id, 'masculine',
         ARRAY['light', 'arts', 'crafts', 'warriors'],
         ARRAY['spear', 'harp', 'raven', 'sun'],
         'Irish god of light, arts, and crafts. Master of all skills.',
         'LOOG'),

        ('Ma''at', 'maat', egyptian_pantheon_id, 'feminine',
         ARRAY['truth', 'justice', 'order', 'balance'],
         ARRAY['feather', 'scales', 'ankh'],
         'Goddess of truth, justice, and cosmic order.',
         'MAH-aht'),

        ('Machi', 'machi-spirit', mapuche_pantheon_id, 'feminine',
         ARRAY['healing', 'shamanism', 'medicine'],
         ARRAY['drum', 'herbs', 'tree'],
         'Sacred shamanic healer spirit.',
         'MAH-chee SPEER-it'),

        ('Mago', 'mago', korean_pantheon_id, 'feminine',
         ARRAY['creation', 'earth', 'life'],
         ARRAY['earth', 'jars'],
         'Primordial mother goddess who created the world.',
         'MAH-goh'),

        ('Mahakala', 'mahakala', tibetan_pantheon_id, 'masculine',
         ARRAY['protection', 'time', 'destruction of obstacles'],
         ARRAY['skull garland', 'trident', 'flames'],
         'Fierce protector deity, wrathful form of Avalokiteshvara.',
         'mah-hah-KAH-lah'),

        ('Mahavira', 'mahavira', jain_pantheon_id, 'masculine',
         ARRAY['enlightenment', 'non-violence', 'liberation'],
         ARRAY['lion', 'swastika'],
         '24th and last Tirthankara, founder of modern Jainism.',
         'mah-hah-VEE-rah'),

        ('Maize God', 'maize-god-olmec', olmec_pantheon_id, 'masculine',
         ARRAY['agriculture', 'maize', 'fertility', 'rebirth'],
         ARRAY['maize', 'young man'],
         'Youthful deity of maize and agricultural abundance.',
         'MAYZ GOD'),

        ('Mama Cocha', 'mama-cocha', inca_pantheon_id, 'feminine',
         ARRAY['sea', 'lakes', 'fish'],
         ARRAY['water', 'fish'],
         'Sea and water goddess.',
         'MAH-mah KOH-chah'),

        ('Mama Quilla', 'mama-quilla', inca_pantheon_id, 'feminine',
         ARRAY['moon', 'calendar', 'marriage', 'festivals'],
         ARRAY['moon', 'silver'],
         'Moon goddess, wife of Inti, regulator of festivals.',
         'MAH-mah KEE-yah'),

        ('Maman Brigitte', 'maman-brigitte', vodou_pantheon_id, 'feminine',
         ARRAY['death', 'cemeteries', 'justice', 'healing'],
         ARRAY['purple', 'rooster', 'fire'],
         'Lwa of cemeteries and wife of Baron Samedi.',
         'mah-MAHN bree-ZHEET'),

        ('Manannán mac Lir', 'manannan-mac-lir', celtic_pantheon_id, 'masculine',
         ARRAY['sea', 'storms', 'navigation', 'afterlife'],
         ARRAY['wave', 'crane', 'mist'],
         'Irish god of the sea and guardian of the Otherworld.',
         'MAN-an-awn mak LEER'),

        ('Manat', 'manat', nabataean_pantheon_id, 'feminine',
         ARRAY['fate', 'destiny', 'time'],
         ARRAY['stone', 'crescent'],
         'Goddess of fate and destiny.',
         'mah-NAHT'),

        ('Manjushri', 'manjushri', tibetan_pantheon_id, 'masculine',
         ARRAY['wisdom', 'knowledge', 'learning'],
         ARRAY['flaming sword', 'book'],
         'Bodhisattva of transcendent wisdom.',
         'mahn-joo-SHREE'),

        ('Marduk', 'marduk', mesopotamian_pantheon_id, 'masculine',
         ARRAY['creation', 'water', 'vegetation', 'judgment'],
         ARRAY['dragon', 'spade', 'lightning'],
         'Babylonian creator god and patron deity of Babylon.',
         'MAR-dook'),

        ('Marie Laveau', 'marie-laveau', voodoo_pantheon_id, 'feminine',
         ARRAY['magic', 'healing', 'justice', 'ancestors'],
         ARRAY['snake', 'candles', 'gris-gris'],
         'Legendary Voodoo Queen of New Orleans, deified practitioner.',
         'MAH-ree lah-VOH'),

        ('Marinette', 'marinette', voodoo_pantheon_id, 'feminine',
         ARRAY['power', 'violence', 'freedom', 'justice'],
         ARRAY['screech owl', 'flames'],
         'Fierce loa of power, violence, and freedom.',
         'mah-ree-NET'),

        ('Mars', 'mars', roman_pantheon_id, 'masculine',
         ARRAY['war', 'agriculture', 'fertility'],
         ARRAY['spear', 'shield', 'wolf', 'woodpecker'],
         'God of war and agriculture, father of Rome.',
         'MARZ'),

        ('Masau''u', 'masauu', hopi_pantheon_id, 'masculine',
         ARRAY['death', 'earth', 'underworld'],
         ARRAY['fire', 'planting stick'],
         'Deity of the earth, death, and the underworld.',
         'mah-SOW-oo'),

        ('Maui', 'maui', polynesian_pantheon_id, 'masculine',
         ARRAY['trickery', 'culture hero', 'fishing'],
         ARRAY['fishhook', 'sun'],
         'Polynesian trickster and culture hero.',
         'MAH-oo-ee'),

        ('Mazu', 'mazu', chinese_pantheon_id, 'feminine',
         ARRAY['sea', 'sailors', 'protection'],
         ARRAY['lantern', 'boat', 'mace'],
         'Goddess of the sea and protector of sailors.',
         'MAH-dzoo'),

        ('Menrva', 'menrva', etruscan_pantheon_id, 'feminine',
         ARRAY['wisdom', 'war', 'art', 'trade'],
         ARRAY['owl', 'spear', 'helmet'],
         'Goddess of wisdom, war, art, and commerce.',
         'men-UR-vah'),

        ('Mercury', 'mercury', roman_pantheon_id, 'masculine',
         ARRAY['commerce', 'travel', 'messages', 'thievery'],
         ARRAY['caduceus', 'winged sandals', 'rooster'],
         'Messenger god and patron of commerce.',
         'MUR-kyoo-ree'),

        ('Mictlantecuhtli', 'mictlantecuhtli', aztec_pantheon_id, 'masculine',
         ARRAY['death', 'underworld', 'darkness'],
         ARRAY['skeleton', 'owl', 'spider'],
         'Lord of Mictlan, the Aztec underworld.',
         'meek-tlahn-teh-KOO-tlee'),

        ('Minerva', 'minerva', roman_pantheon_id, 'feminine',
         ARRAY['wisdom', 'war', 'crafts', 'strategy'],
         ARRAY['owl', 'olive', 'shield'],
         'Goddess of wisdom and strategic warfare.',
         'mih-NUR-vah'),

        ('Mithra', 'mithra', persian_pantheon_id, 'masculine',
         ARRAY['covenant', 'light', 'contracts'],
         ARRAY['bull', 'sun'],
         'God of covenant, light, and contracts in Persian tradition.',
         'mih-THRAH'),

        ('Mokosh', 'mokosh', slavic_pantheon_id, 'feminine',
         ARRAY['earth', 'fertility', 'moisture', 'weaving'],
         ARRAY['spinning', 'earth', 'moisture'],
         'Mother Earth goddess and protector of women.',
         'MAH-kosh'),

        ('Morana', 'morana', slavic_pantheon_id, 'feminine',
         ARRAY['winter', 'death', 'rebirth'],
         ARRAY['straw effigy', 'winter'],
         'Goddess of winter, death, and rebirth.',
         'moh-RAH-nah'),

        ('Morpheus', 'morpheus', greek_pantheon_id, 'masculine',
         ARRAY['dreams', 'sleep', 'visions'],
         ARRAY['poppy', 'wings'],
         'God of dreams and sleep.',
         'MOR-fee-uhs'),

        ('Morrigan', 'morrigan', celtic_pantheon_id, 'feminine',
         ARRAY['war', 'fate', 'death', 'sovereignty'],
         ARRAY['crow', 'raven', 'wolf', 'sword'],
         'Irish goddess of war, fate, and sovereignty. Often appears as a crow.',
         'MOR-ih-gan'),

        ('Mother Earth', 'mother-earth-native', native_american_pantheon_id, 'feminine',
         ARRAY['earth', 'fertility', 'sustenance'],
         ARRAY['corn', 'earth', 'turtle'],
         'Earth mother who sustains all life.',
         'MUH-thur URTH'),

        ('Neith', 'neith', egyptian_pantheon_id, 'feminine',
         ARRAY['war', 'hunting', 'weaving', 'wisdom'],
         ARRAY['bow and arrows', 'shield', 'loom'],
         'Ancient goddess of war, hunting, and wisdom.',
         'NAYTH'),

        ('Nemesis', 'nemesis', greek_pantheon_id, 'feminine',
         ARRAY['revenge', 'balance', 'retribution'],
         ARRAY['sword', 'scales', 'whip'],
         'Goddess of revenge and divine retribution.',
         'NEM-eh-sis'),

        ('Neminatha', 'neminatha', jain_pantheon_id, 'masculine',
         ARRAY['compassion', 'non-violence', 'animals'],
         ARRAY['conch', 'blue'],
         '22nd Tirthankara, known for extreme compassion.',
         'neh-mee-NAH-thah'),

        ('Nephthys', 'nephthys', egyptian_pantheon_id, 'feminine',
         ARRAY['mourning', 'death', 'night', 'protection'],
         ARRAY['house symbol', 'basket', 'mummy'],
         'Goddess of mourning, death, and protection.',
         'NEF-thees'),

        ('Neptune', 'neptune', roman_pantheon_id, 'masculine',
         ARRAY['sea', 'earthquakes', 'horses'],
         ARRAY['trident', 'dolphin', 'horse'],
         'God of the sea and earthquakes.',
         'NEP-toon'),

        ('Nerthus', 'nerthus', germanic_pantheon_id, 'feminine',
         ARRAY['earth', 'fertility', 'peace'],
         ARRAY['wagon', 'earth', 'grove'],
         'Germanic earth mother goddess.',
         'nairths'),

        ('Nezha', 'nezha', chinese_pantheon_id, 'masculine',
         ARRAY['protection', 'youth', 'triumph'],
         ARRAY['fire wheels', 'spear', 'ring'],
         'Child deity and protection god.',
         'NEH-zhah'),

        ('Ngen-ko', 'ngen-ko', mapuche_pantheon_id, 'nonbinary',
         ARRAY['water', 'rivers', 'springs'],
         ARRAY['water', 'fish'],
         'Spirit owner of water and aquatic life.',
         'NGEN KOH'),

        ('Ngen-mapu', 'ngen-mapu', mapuche_pantheon_id, 'nonbinary',
         ARRAY['earth', 'land', 'territory'],
         ARRAY['earth', 'mountains'],
         'Spirit owner of the land and territory.',
         'NGEN MAH-poo'),

        ('Ngenechen', 'ngenechen', mapuche_pantheon_id, 'masculine',
         ARRAY['creation', 'order', 'sky', 'dominant'],
         ARRAY['condor', 'sun'],
         'Supreme god of creation and cosmic order.',
         'NGEN-eh-CHEN'),

        ('Nike', 'nike', greek_pantheon_id, 'feminine',
         ARRAY['victory', 'success', 'speed'],
         ARRAY['wings', 'wreath', 'palm branch'],
         'Goddess of victory in war and competition.',
         'NEE-kee'),

        ('Njord', 'njord', norse_pantheon_id, 'masculine',
         ARRAY['sea', 'wind', 'fishing', 'wealth'],
         ARRAY['ship', 'seabird'],
         'Vanir god of the sea, wind, and prosperity.',
         'NYORD'),

        ('Nunnehi', 'nunnehi', cherokee_pantheon_id, 'nonbinary',
         ARRAY['protection', 'mountains', 'spirits'],
         ARRAY['mountains', 'mist'],
         'Immortal spirit people who live in mountains.',
         'noo-NEH-hee'),

        ('Nut', 'nut', egyptian_pantheon_id, 'feminine',
         ARRAY['sky', 'cosmos', 'stars'],
         ARRAY['sky', 'stars', 'cow'],
         'Goddess of the sky and heavens.',
         'NOOT'),

        ('Nyame', 'nyame', akan_pantheon_id, 'masculine',
         ARRAY['sky', 'creation', 'supreme being'],
         ARRAY['sky', 'sun'],
         'Supreme creator god of the Akan people.',
         'NYAH-may'),

        ('Nyx', 'nyx', greek_pantheon_id, 'feminine',
         ARRAY['night', 'darkness', 'shadows'],
         ARRAY['stars', 'darkness', 'mist'],
         'Primordial goddess of the night.',
         'NYX'),

        ('Obatala', 'obatala', yoruba_pantheon_id, 'masculine',
         ARRAY['creation', 'wisdom', 'peace', 'purity'],
         ARRAY['white cloth', 'silver', 'elephant'],
         'Orisha of creation, wisdom, and purity.',
         'oh-BAH-tah-lah'),

        ('Odin', 'odin', norse_pantheon_id, 'masculine',
         ARRAY['wisdom', 'war', 'death', 'magic', 'poetry'],
         ARRAY['ravens', 'spear', 'wolves', 'runes'],
         'All-Father of the Norse gods, god of wisdom, war, and magic.',
         'OH-din'),

        ('Ogun', 'ogun', yoruba_pantheon_id, 'masculine',
         ARRAY['iron', 'war', 'labor', 'technology'],
         ARRAY['machete', 'iron', 'palm fronds'],
         'Orisha of iron, war, and labor.',
         'oh-GOON'),

        ('Olmec Dragon', 'olmec-dragon', olmec_pantheon_id, 'masculine',
         ARRAY['earth', 'fire', 'maize', 'water'],
         ARRAY['dragon', 'fangs', 'claws'],
         'Dragon deity associated with earth, fire, and maize.',
         'OHL-mek DRAG-un'),

        ('Olodumare', 'olodumare', yoruba_pantheon_id, 'nonbinary',
         ARRAY['creation', 'supreme being', 'destiny'],
         ARRAY['sky', 'universe'],
         'Supreme creator deity in Yoruba religion.',
         'oh-loh-DOO-mah-ray'),

        ('Orenda', 'orenda', iroquois_pantheon_id, 'nonbinary',
         ARRAY['spiritual power', 'life force', 'magic'],
         ARRAY['energy', 'spirit'],
         'The spiritual power inherent in all things.',
         'oh-REN-dah'),

        ('Oshun', 'oshun', yoruba_pantheon_id, 'feminine',
         ARRAY['rivers', 'love', 'beauty', 'fertility'],
         ARRAY['river', 'mirror', 'honey', 'peacock'],
         'Orisha of rivers, love, and beauty.',
         'oh-SHOON'),

        ('Osiris', 'osiris', egyptian_pantheon_id, 'masculine',
         ARRAY['afterlife', 'death', 'resurrection', 'agriculture'],
         ARRAY['crook', 'flail', 'atef crown', 'djed'],
         'God of the afterlife, death, and resurrection.',
         'OH-sy-ris'),

        ('Oya', 'oya', yoruba_pantheon_id, 'feminine',
         ARRAY['winds', 'storms', 'transformation', 'death'],
         ARRAY['whirlwind', 'lightning', 'buffalo'],
         'Orisha of winds, storms, and transformation.',
         'OH-yah'),

        ('Pachamama', 'pachamama', inca_pantheon_id, 'feminine',
         ARRAY['earth', 'fertility', 'agriculture', 'nature'],
         ARRAY['mountains', 'fertility'],
         'Inca earth mother goddess.',
         'pah-chah-MAH-mah'),

        ('Padmasambhava', 'padmasambhava', tibetan_pantheon_id, 'masculine',
         ARRAY['tantra', 'magic', 'enlightenment'],
         ARRAY['vajra', 'skull cup', 'staff'],
         'Guru Rinpoche, the Lotus-Born master who brought Buddhism to Tibet.',
         'pahd-mah-sahm-BAH-vah'),

        ('Palden Lhamo', 'palden-lhamo', tibetan_pantheon_id, 'feminine',
         ARRAY['protection', 'wisdom', 'fierceness'],
         ARRAY['mule', 'dice', 'skull cup'],
         'Fierce protectress of Tibet and Dharma.',
         'PAL-den LHA-moh'),

        ('Pan', 'pan', greek_pantheon_id, 'masculine',
         ARRAY['nature', 'shepherds', 'flocks', 'wild'],
         ARRAY['pan flute', 'pine', 'goat'],
         'God of the wild, shepherds, and rustic music.',
         'PAN'),

        ('Pangu', 'pangu', chinese_pantheon_id, 'masculine',
         ARRAY['creation', 'cosmos', 'separation'],
         ARRAY['axe', 'chisel'],
         'Primordial creator who separated heaven and earth.',
         'PAHN-goo'),

        ('Papa Legba', 'papa-legba', vodou_pantheon_id, 'masculine',
         ARRAY['crossroads', 'communication', 'gateway'],
         ARRAY['cane', 'straw hat', 'pipe', 'dog'],
         'Lwa of crossroads and communication with spirits.',
         'PAHP-ah LEG-bah'),

        ('Papa Legba', 'papa-legba-voodoo', voodoo_pantheon_id, 'masculine',
         ARRAY['crossroads', 'communication', 'gatekeeper'],
         ARRAY['cane', 'straw hat', 'dog'],
         'Gatekeeper between worlds and opener of the way.',
         'PAH-pah LEG-bah'),

        ('Papaios', 'papaios', scythian_pantheon_id, 'masculine',
         ARRAY['sky', 'thunder', 'father'],
         ARRAY['sky', 'horse'],
         'Sky father and supreme god.',
         'pah-PAY-ohs'),

        ('Papatuanuku', 'papatuanuku', maori_pantheon_id, 'feminine',
         ARRAY['earth', 'motherhood', 'land'],
         ARRAY['earth', 'land'],
         'Earth mother in Māori mythology.',
         'PAH-pah-too-ah-NOO-koo'),

        ('Parshvanatha', 'parshvanatha', jain_pantheon_id, 'masculine',
         ARRAY['enlightenment', 'asceticism', 'meditation'],
         ARRAY['serpent', 'hood'],
         '23rd Tirthankara, protected by serpent king.',
         'parsh-vah-NAH-thah'),

        ('Parvati', 'parvati', hindu_pantheon_id, 'feminine',
         ARRAY['love', 'devotion', 'fertility', 'power'],
         ARRAY['lotus', 'tiger', 'trishula'],
         'Goddess of love, fertility, and devotion. Consort of Shiva.',
         'PAR-vah-tee'),

        ('Pele', 'pele', polynesian_pantheon_id, 'feminine',
         ARRAY['volcanoes', 'fire', 'creation', 'destruction'],
         ARRAY['lava', 'fire', 'volcano'],
         'Hawaiian goddess of volcanoes and fire.',
         'PEH-leh'),

        ('Perkūnas', 'perkunas', baltic_pantheon_id, 'masculine',
         ARRAY['thunder', 'lightning', 'rain', 'oak'],
         ARRAY['oak', 'axe', 'fire'],
         'Lithuanian god of thunder and lightning.',
         'per-KOO-nahs'),

        ('Persephone', 'persephone', greek_pantheon_id, 'feminine',
         ARRAY['spring', 'underworld', 'death', 'rebirth'],
         ARRAY['pomegranate', 'torch', 'grain', 'flowers'],
         'Queen of the underworld, goddess of spring and rebirth.',
         'per-SEH-foh-nee'),

        ('Perun', 'perun', slavic_pantheon_id, 'masculine',
         ARRAY['thunder', 'lightning', 'war', 'sky'],
         ARRAY['lightning bolt', 'axe', 'oak', 'eagle'],
         'Supreme god of thunder and lightning.',
         'peh-ROON'),

        ('Pluto', 'pluto', roman_pantheon_id, 'masculine',
         ARRAY['underworld', 'wealth', 'death'],
         ARRAY['helm of darkness', 'cerberus', 'cypress'],
         'God of the underworld and mineral wealth.',
         'PLOO-toh'),

        ('Poseidon', 'poseidon', greek_pantheon_id, 'masculine',
         ARRAY['sea', 'earthquakes', 'horses', 'storms'],
         ARRAY['trident', 'dolphin', 'horse', 'bull'],
         'God of the sea, earthquakes, and horses.',
         'poh-SY-duhn'),

        ('Potnia', 'potnia', minoan_pantheon_id, 'feminine',
         ARRAY['nature', 'animals', 'sovereignty'],
         ARRAY['snake', 'dove', 'double axe'],
         'Great Mistress, supreme goddess of the Minoans.',
         'poh-tee-NEE-ah'),

        ('Prometheus', 'prometheus', greek_pantheon_id, 'masculine',
         ARRAY['forethought', 'fire', 'craftsmanship'],
         ARRAY['torch', 'fennel stalk'],
         'Titan who gave fire to humanity.',
         'proh-MEE-thee-uhs'),

        ('Ptah', 'ptah', egyptian_pantheon_id, 'masculine',
         ARRAY['creation', 'craftsmanship', 'artisans'],
         ARRAY['was scepter', 'djed', 'ankh'],
         'Creator god and patron of craftsmen.',
         'PTAH'),

        ('Quetzalcoatl', 'quetzalcoatl', aztec_pantheon_id, 'masculine',
         ARRAY['wind', 'wisdom', 'life', 'knowledge'],
         ARRAY['feathered serpent', 'wind', 'venus'],
         'Feathered Serpent god of wind and wisdom.',
         'ket-sahl-KOH-aht-ul'),

        ('Quetzalcoatl', 'quetzalcoatl-toltec', toltec_pantheon_id, 'masculine',
         ARRAY['wind', 'wisdom', 'arts', 'knowledge'],
         ARRAY['feathered serpent', 'wind', 'conch shell'],
         'Feathered serpent god of wind and learning.',
         'ket-sahl-KOH-aht-ul'),

        ('Ra', 'ra', egyptian_pantheon_id, 'masculine',
         ARRAY['sun', 'creation', 'kingship', 'order'],
         ARRAY['sun disk', 'falcon', 'serpent', 'ankh'],
         'Supreme sun god and creator deity.',
         'RAH'),

        ('Radien-akka', 'radien-akka', sami_pantheon_id, 'feminine',
         ARRAY['creation', 'souls', 'birth'],
         ARRAY['spindle', 'cradle'],
         'Mother goddess who shapes unborn souls.',
         'RAH-dee-en AH-kah'),

        ('Radien-attje', 'radien-attje', sami_pantheon_id, 'masculine',
         ARRAY['creation', 'supreme being', 'souls'],
         ARRAY['staff', 'light'],
         'Supreme creator god and ruler.',
         'RAH-dee-en AH-tyeh'),

        ('Raijin', 'raijin', japanese_pantheon_id, 'masculine',
         ARRAY['thunder', 'lightning', 'storms'],
         ARRAY['drums', 'thunder', 'tomoe'],
         'Shinto god of thunder and lightning.',
         'rai-JIN'),

        ('Rainbow Serpent', 'rainbow-serpent', aboriginal_pantheon_id, 'nonbinary',
         ARRAY['creation', 'water', 'life', 'fertility'],
         ARRAY['rainbow', 'serpent', 'water'],
         'Aboriginal Australian creator being associated with water and life.',
         'RAIN-boh SUR-pent'),

        ('Rama', 'rama', hindu_pantheon_id, 'masculine',
         ARRAY['righteousness', 'virtue', 'courage'],
         ARRAY['bow', 'arrow', 'lotus'],
         'Avatar of Vishnu, ideal king and warrior.',
         'RAH-mah'),

        ('Ran', 'ran', norse_pantheon_id, 'feminine',
         ARRAY['sea', 'drowning', 'storms'],
         ARRAY['net', 'sea'],
         'Goddess of the sea who drags sailors to her watery realm.',
         'RAN'),

        ('Ranginui', 'ranginui', maori_pantheon_id, 'masculine',
         ARRAY['sky', 'fatherhood', 'heaven'],
         ARRAY['sky'],
         'Sky father in Māori mythology.',
         'RAHNG-ee-noo-ee'),

        ('Rhea', 'rhea', greek_pantheon_id, 'feminine',
         ARRAY['fertility', 'motherhood', 'generation'],
         ARRAY['lion', 'chariot', 'crown'],
         'Titan mother of the Olympian gods.',
         'REE-ah'),

        ('Rhiannon', 'rhiannon', celtic_pantheon_id, 'feminine',
         ARRAY['horses', 'fertility', 'underworld'],
         ARRAY['white horse', 'birds'],
         'Welsh goddess associated with horses and sovereignty.',
         'ree-AH-non'),

        ('Rishabhanatha', 'rishabhanatha', jain_pantheon_id, 'masculine',
         ARRAY['civilization', 'knowledge', 'first teacher'],
         ARRAY['bull', 'banyan tree'],
         'First Tirthankara, bringer of civilization.',
         'rish-ah-bah-NAH-thah'),

        ('Runesocesius', 'runesocesius', lusitanian_pantheon_id, 'masculine',
         ARRAY['darts', 'war', 'protection'],
         ARRAY['javelin', 'spear'],
         'God of javelins and warfare.',
         'roo-neh-soh-SEH-see-us'),

        ('Ryujin', 'ryujin', shinto_pantheon_id, 'masculine',
         ARRAY['sea', 'dragons', 'tides'],
         ARRAY['dragon', 'jewels', 'tide'],
         'Dragon god of the sea and tides.',
         'ry-JIN'),

        ('Sabazios', 'sabazios', thracian_pantheon_id, 'masculine',
         ARRAY['sky', 'fertility', 'vegetation', 'beer'],
         ARRAY['hand', 'snake', 'pine cone'],
         'Sky and fertility god, often shown as a hand.',
         'sah-BAH-zee-ohs'),

        ('Samsin Halmoni', 'samsin-halmoni', korean_pantheon_id, 'feminine',
         ARRAY['childbirth', 'children', 'fertility'],
         ARRAY['children', 'birth'],
         'Grandmother goddess of childbirth and children.',
         'SAHM-sin hahl-MOH-nee'),

        ('Saraswati', 'saraswati', hindu_pantheon_id, 'feminine',
         ARRAY['knowledge', 'music', 'arts', 'wisdom'],
         ARRAY['veena', 'book', 'swan', 'lotus'],
         'Goddess of knowledge, music, and arts.',
         'sah-rah-SVAH-tee'),

        ('Sarutahiko', 'sarutahiko', shinto_pantheon_id, 'masculine',
         ARRAY['earth', 'guidance', 'crossroads'],
         ARRAY['staff', 'nose'],
         'Deity of earth and guidance, leader of earthly kami.',
         'sah-roo-tah-HEE-koh'),

        ('Saturn', 'saturn', roman_pantheon_id, 'masculine',
         ARRAY['time', 'agriculture', 'wealth', 'renewal'],
         ARRAY['sickle', 'grain', 'abundance'],
         'God of time, agriculture, and renewal.',
         'SAT-urn'),

        ('Sedna', 'sedna', inuit_pantheon_id, 'feminine',
         ARRAY['sea', 'marine animals', 'food'],
         ARRAY['sea creatures', 'ocean'],
         'Inuit goddess of the sea and marine animals.',
         'SEH-dnah'),

        ('Sekhmet', 'sekhmet', egyptian_pantheon_id, 'feminine',
         ARRAY['war', 'healing', 'vengeance', 'fire'],
         ARRAY['lioness', 'sun disk', 'red linen'],
         'Warrior goddess of healing and vengeance.',
         'SEK-met'),

        ('Selene', 'selene', greek_pantheon_id, 'feminine',
         ARRAY['moon', 'night', 'enchantment'],
         ARRAY['crescent moon', 'torch', 'chariot'],
         'Titaness and personification of the moon.',
         'seh-LEE-nee'),

        ('Selu', 'selu', cherokee_pantheon_id, 'feminine',
         ARRAY['corn', 'agriculture', 'fertility'],
         ARRAY['corn', 'grain'],
         'Corn Mother goddess who gave corn to humanity.',
         'SEH-loo'),

        ('Set', 'set', egyptian_pantheon_id, 'masculine',
         ARRAY['chaos', 'storms', 'desert', 'foreigners'],
         ARRAY['was scepter', 'red crown', 'animals of desert'],
         'God of chaos, storms, and the desert.',
         'SET'),

        ('Shamash', 'shamash', mesopotamian_pantheon_id, 'masculine',
         ARRAY['sun', 'justice', 'divination'],
         ARRAY['sun disk', 'rays', 'saw'],
         'Babylonian sun god and god of justice.',
         'SHA-mash'),

        ('Shango', 'shango', yoruba_pantheon_id, 'masculine',
         ARRAY['thunder', 'lightning', 'fire', 'justice'],
         ARRAY['double axe', 'thunder', 'ram'],
         'Orisha of thunder, lightning, and justice.',
         'SHAHN-goh'),

        ('Shiva', 'shiva', hindu_pantheon_id, 'masculine',
         ARRAY['destruction', 'transformation', 'meditation', 'yoga'],
         ARRAY['trident', 'crescent moon', 'serpent', 'drum'],
         'Destroyer and transformer, part of the Hindu Trimurti.',
         'SHEE-vah'),

        ('Sif', 'sif', norse_pantheon_id, 'feminine',
         ARRAY['harvest', 'fertility', 'family'],
         ARRAY['golden hair', 'grain'],
         'Goddess of the harvest, wife of Thor.',
         'SIF'),

        ('Sin', 'sin', mesopotamian_pantheon_id, 'masculine',
         ARRAY['moon', 'wisdom', 'time'],
         ARRAY['crescent moon', 'bull', 'tripod'],
         'Mesopotamian moon god.',
         'SIN'),

        ('Sirona', 'sirona', gaulish_pantheon_id, 'feminine',
         ARRAY['healing', 'springs', 'stars'],
         ARRAY['serpent', 'grain', 'eggs'],
         'Goddess of healing and sacred springs.',
         'sih-ROH-nah'),

        ('Skadi', 'skadi', norse_pantheon_id, 'feminine',
         ARRAY['winter', 'hunting', 'mountains', 'skiing'],
         ARRAY['bow', 'skis', 'wolf'],
         'Goddess of winter, hunting, and mountains.',
         'SKAH-dee'),

        ('Sky Woman', 'sky-woman', iroquois_pantheon_id, 'feminine',
         ARRAY['creation', 'earth', 'sky'],
         ARRAY['turtle', 'earth'],
         'Progenitor who fell from the sky and created the earth.',
         'SKY WOO-man'),

        ('Sobek', 'sobek', egyptian_pantheon_id, 'masculine',
         ARRAY['crocodiles', 'rivers', 'fertility', 'military'],
         ARRAY['crocodile', 'ankh', 'was scepter'],
         'Crocodile god of the Nile and military prowess.',
         'SOHB-ek'),

        ('Spider Woman', 'spider-woman-hopi', hopi_pantheon_id, 'feminine',
         ARRAY['creation', 'weaving', 'wisdom'],
         ARRAY['spider', 'web'],
         'Creator goddess who helped form humans.',
         'SPY-dur WOO-man'),

        ('Spider Woman', 'spider-woman', navajo_pantheon_id, 'feminine',
         ARRAY['weaving', 'creation', 'wisdom'],
         ARRAY['spider', 'loom', 'web'],
         'Creator deity who taught humans to weave.',
         'SPYE-dur WOO-man'),

        ('Sun Bearer', 'sun-bearer', navajo_pantheon_id, 'masculine',
         ARRAY['sun', 'war', 'hunting'],
         ARRAY['sun', 'turquoise', 'eagle feathers'],
         'Deity who carries the sun across the sky.',
         'SUN BAIR-ur'),

        ('Sun Wukong', 'sun-wukong', chinese_pantheon_id, 'masculine',
         ARRAY['trickery', 'transformation', 'protection'],
         ARRAY['staff', 'cloud', 'peach'],
         'Monkey King, trickster hero who achieved Buddhahood.',
         'SUN woo-KONG'),

        ('Surya', 'surya', hindu_pantheon_id, 'masculine',
         ARRAY['sun', 'light', 'health'],
         ARRAY['chariot', 'lotus', 'sun disk'],
         'Solar deity, source of light and life.',
         'SOOR-yah'),

        ('Susanoo', 'susanoo', japanese_pantheon_id, 'masculine',
         ARRAY['storms', 'sea', 'underworld'],
         ARRAY['sword', 'storm', 'serpent'],
         'Shinto god of storms and the sea.',
         'soo-sah-NOH-oh'),

        ('Svarog', 'svarog', slavic_pantheon_id, 'masculine',
         ARRAY['fire', 'smithing', 'sky'],
         ARRAY['hammer', 'anvil', 'fire'],
         'God of fire and blacksmithing, father of gods.',
         'SVAH-rohg'),

        ('Tabiti', 'tabiti', scythian_pantheon_id, 'feminine',
         ARRAY['fire', 'hearth', 'sovereignty'],
         ARRAY['flame', 'mirror'],
         'Supreme goddess of the hearth and fire.',
         'tah-BEE-tee'),

        ('Tane Mahuta', 'tane-mahuta', maori_pantheon_id, 'masculine',
         ARRAY['forests', 'birds', 'trees', 'humans'],
         ARRAY['trees', 'forest'],
         'God of forests and birds, creator of humans.',
         'TAH-nay MAH-hoo-tah'),

        ('Tangaroa', 'tangaroa', polynesian_pantheon_id, 'masculine',
         ARRAY['ocean', 'fish', 'reptiles'],
         ARRAY['ocean', 'fish', 'waves'],
         'Polynesian god of the ocean.',
         'TAHNG-gah-ROH-ah'),

        ('Tanit', 'tanit', berber_pantheon_id, 'feminine',
         ARRAY['moon', 'fertility', 'war'],
         ARRAY['crescent moon', 'pomegranate', 'lion'],
         'Carthaginian/Berber goddess of the moon and fertility.',
         'TAH-nit'),

        ('Tano', 'tano', akan_pantheon_id, 'masculine',
         ARRAY['rivers', 'warfare', 'fertility'],
         ARRAY['river', 'sword'],
         'River god and warrior deity.',
         'TAH-noh'),

        ('Tara', 'tara', buddhist_pantheon_id, 'feminine',
         ARRAY['compassion', 'protection', 'liberation'],
         ARRAY['lotus', 'stars'],
         'Buddhist goddess of compassion and protection.',
         'TAH-rah'),

        ('Taranis', 'taranis', gaulish_pantheon_id, 'masculine',
         ARRAY['thunder', 'sky', 'storms'],
         ARRAY['wheel', 'lightning bolt', 'eagle'],
         'Gaulish god of thunder and the sky.',
         'TAH-rah-nis'),

        ('Tarhunt', 'tarhunt', hittite_pantheon_id, 'masculine',
         ARRAY['storms', 'thunder', 'weather', 'war'],
         ARRAY['bull', 'lightning', 'axe'],
         'King of the Hittite gods, storm god.',
         'TAR-hoont'),

        ('Tawa', 'tawa', hopi_pantheon_id, 'masculine',
         ARRAY['sun', 'creator', 'life'],
         ARRAY['sun', 'light'],
         'The Sun Spirit, creator of the First World.',
         'TAH-wah'),

        ('Tawhirimatea', 'tawhirimatea', maori_pantheon_id, 'masculine',
         ARRAY['weather', 'storms', 'wind'],
         ARRAY['storm clouds', 'wind'],
         'God of weather and storms.',
         'tah-FEER-ee-mah-TAY-ah'),

        ('Telipinu', 'telipinu', hittite_pantheon_id, 'masculine',
         ARRAY['agriculture', 'fertility', 'seasons'],
         ARRAY['plow', 'grain'],
         'God of agriculture and fertility.',
         'teh-LEE-pee-noo'),

        ('Teutates', 'teutates', gaulish_pantheon_id, 'masculine',
         ARRAY['tribe', 'war', 'protection'],
         ARRAY['spear', 'ram'],
         'God of the tribe, war, and protection.',
         'too-TAH-tays'),

        ('Tezcatlipoca', 'tezcatlipoca', aztec_pantheon_id, 'masculine',
         ARRAY['night', 'sorcery', 'destiny', 'war'],
         ARRAY['smoking mirror', 'jaguar', 'obsidian'],
         'God of night, sorcery, and destiny.',
         'tes-kaht-lee-POH-kah'),

        ('Tezcatlipoca', 'tezcatlipoca-toltec', toltec_pantheon_id, 'masculine',
         ARRAY['night', 'sorcery', 'destiny', 'jaguars'],
         ARRAY['smoking mirror', 'jaguar', 'obsidian'],
         'God of night, sorcery, and destiny.',
         'tes-kaht-lee-POH-kah'),

        ('Thor', 'thor', norse_pantheon_id, 'masculine',
         ARRAY['thunder', 'strength', 'protection', 'storms'],
         ARRAY['hammer', 'lightning', 'goats', 'oak'],
         'God of thunder and strength, protector of mankind.',
         'THOR'),

        ('Thoth', 'thoth', egyptian_pantheon_id, 'masculine',
         ARRAY['wisdom', 'writing', 'magic', 'moon'],
         ARRAY['ibis', 'moon', 'papyrus', 'scales'],
         'Egyptian god of wisdom, writing, and magic.',
         'THOTH'),

        ('Thunderbird', 'thunderbird', native_american_pantheon_id, 'masculine',
         ARRAY['thunder', 'lightning', 'storms', 'power'],
         ARRAY['lightning', 'eagle', 'clouds'],
         'Powerful bird spirit that creates thunder.',
         'THUN-dur-bird'),

        ('Tiamat', 'tiamat', mesopotamian_pantheon_id, 'feminine',
         ARRAY['chaos', 'primordial ocean', 'creation'],
         ARRAY['dragon', 'serpent', 'ocean'],
         'Primordial goddess of the salt sea and chaos.',
         'tee-AH-maht'),

        ('Tin Hinan', 'tin-hinan', berber_pantheon_id, 'feminine',
         ARRAY['ancestors', 'leadership', 'desert'],
         ARRAY['veil', 'tent'],
         'Legendary ancestral queen of the Tuareg.',
         'tin hee-NAHN'),

        ('Tinia', 'tinia', etruscan_pantheon_id, 'masculine',
         ARRAY['sky', 'thunder', 'lightning'],
         ARRAY['lightning bolt', 'eagle'],
         'King of the Etruscan gods, god of the sky.',
         'TIN-ee-ah'),

        ('Tlaloc', 'tlaloc-toltec', toltec_pantheon_id, 'masculine',
         ARRAY['rain', 'fertility', 'water'],
         ARRAY['lightning', 'goggles', 'fangs'],
         'Rain god essential for agriculture.',
         'TLAH-lok'),

        ('Tlaloc', 'tlaloc', aztec_pantheon_id, 'masculine',
         ARRAY['rain', 'water', 'fertility', 'lightning'],
         ARRAY['lightning bolt', 'frog', 'heron'],
         'God of rain and fertility.',
         'tlah-LOK'),

        ('Trebaruna', 'trebaruna', lusitanian_pantheon_id, 'feminine',
         ARRAY['home', 'hearth', 'family'],
         ARRAY['hearth', 'moon'],
         'Goddess of home and domestic life.',
         'treh-bah-ROO-nah'),

        ('Tsukuyomi', 'tsukuyomi', japanese_pantheon_id, 'masculine',
         ARRAY['moon', 'night', 'time'],
         ARRAY['moon', 'calendar'],
         'Shinto god of the moon and night.',
         'tsoo-koo-YOH-mee'),

        ('Tumatauenga', 'tumatauenga', maori_pantheon_id, 'masculine',
         ARRAY['war', 'humans', 'hunting'],
         ARRAY['weapons', 'red'],
         'God of war and humans.',
         'too-mah-TAH-oo-ENG-ah'),

        ('Tupã', 'tupa', guarani_pantheon_id, 'masculine',
         ARRAY['thunder', 'lightning', 'creation'],
         ARRAY['lightning', 'thunder', 'rain'],
         'Supreme god of thunder and creation.',
         'too-PAH'),

        ('Turan', 'turan', etruscan_pantheon_id, 'feminine',
         ARRAY['love', 'beauty', 'vitality'],
         ARRAY['dove', 'swan', 'flower'],
         'Goddess of love and beauty.',
         'TOO-rahn'),

        ('Tyche', 'tyche', greek_pantheon_id, 'feminine',
         ARRAY['fortune', 'chance', 'fate', 'prosperity'],
         ARRAY['wheel', 'cornucopia', 'rudder'],
         'Goddess of fortune and prosperity.',
         'TY-kee'),

        ('Tyr', 'tyr', norse_pantheon_id, 'masculine',
         ARRAY['war', 'justice', 'law', 'courage'],
         ARRAY['sword', 'spear', 'runes'],
         'God of war, justice, and heroic glory.',
         'TEER'),

        ('Ukko', 'ukko', finnish_pantheon_id, 'masculine',
         ARRAY['sky', 'weather', 'thunder', 'harvest'],
         ARRAY['hammer', 'oak', 'thunder'],
         'Finnish god of sky, weather, and harvest.',
         'OO-koh'),

        ('Unetlanvhi', 'unetlanvhi', cherokee_pantheon_id, 'nonbinary',
         ARRAY['creator', 'supreme being', 'life'],
         ARRAY['sky', 'earth'],
         'The Creator, supreme being in Cherokee spirituality.',
         'oo-neh-tlan-VEE'),

        ('Uni', 'uni', etruscan_pantheon_id, 'feminine',
         ARRAY['marriage', 'birth', 'sovereignty'],
         ARRAY['peacock', 'pomegranate'],
         'Supreme goddess, protector of the state.',
         'OO-nee'),

        ('Uranus', 'uranus', greek_pantheon_id, 'masculine',
         ARRAY['sky', 'heaven', 'cosmos'],
         ARRAY['sky', 'stars'],
         'Primordial god of the sky.',
         'yoo-RAY-nuhs'),

        ('Vahagn', 'vahagn', armenian_pantheon_id, 'masculine',
         ARRAY['war', 'thunder', 'fire', 'dragons'],
         ARRAY['lightning', 'sword', 'dragon'],
         'Dragon-slayer god of war and thunder.',
         'VAH-hag-n'),

        ('Varuna', 'varuna', hindu_pantheon_id, 'masculine',
         ARRAY['water', 'oceans', 'law', 'order'],
         ARRAY['noose', 'water'],
         'God of the oceans, water, and cosmic order.',
         'VAH-roo-nah'),

        ('Vayu', 'vayu', hindu_pantheon_id, 'masculine',
         ARRAY['wind', 'breath', 'life force'],
         ARRAY['flag', 'wind'],
         'God of wind and the life-giving breath.',
         'VAH-yoo'),

        ('Velchanos', 'velchanos', minoan_pantheon_id, 'masculine',
         ARRAY['vegetation', 'dying-and-rising', 'youth'],
         ARRAY['rooster', 'tree'],
         'Youthful god of vegetation and renewal.',
         'vel-KAH-nohs'),

        ('Veles', 'veles', slavic_pantheon_id, 'masculine',
         ARRAY['earth', 'waters', 'underworld', 'cattle', 'magic'],
         ARRAY['serpent', 'dragon', 'cattle'],
         'God of earth, waters, and the underworld.',
         'VEH-les'),

        ('Venus', 'venus', roman_pantheon_id, 'feminine',
         ARRAY['love', 'beauty', 'desire', 'fertility'],
         ARRAY['dove', 'rose', 'shell', 'myrtle'],
         'Goddess of love and beauty.',
         'VEE-nus'),

        ('Vesta', 'vesta', roman_pantheon_id, 'feminine',
         ARRAY['hearth', 'home', 'family'],
         ARRAY['sacred fire', 'hearth', 'donkey'],
         'Goddess of the hearth and home.',
         'VES-tah'),

        ('Vidar', 'vidar', norse_pantheon_id, 'masculine',
         ARRAY['silence', 'revenge', 'forests'],
         ARRAY['thick boot', 'sword'],
         'Silent god who will avenge Odin at Ragnarok.',
         'VEE-dar'),

        ('Viracocha', 'viracocha', inca_pantheon_id, 'masculine',
         ARRAY['creation', 'civilization', 'teaching'],
         ARRAY['staff', 'tears'],
         'Creator god and bringer of civilization to the Inca.',
         'vee-rah-KOH-chah'),

        ('Vishnu', 'vishnu', hindu_pantheon_id, 'masculine',
         ARRAY['preservation', 'order', 'righteousness'],
         ARRAY['conch', 'discus', 'lotus', 'mace'],
         'Preserver god, part of the Hindu Trimurti.',
         'VISH-noo'),

        ('Vulcan', 'vulcan', roman_pantheon_id, 'masculine',
         ARRAY['fire', 'forge', 'metalwork', 'volcanoes'],
         ARRAY['hammer', 'anvil', 'tongs'],
         'God of fire and metalworking.',
         'vul-KAY-nuhs'),

        ('Väinämöinen', 'vainamoinen', finnish_pantheon_id, 'masculine',
         ARRAY['magic', 'music', 'wisdom', 'creation'],
         ARRAY['kantele', 'boat', 'singing'],
         'Finnish god of magic, music, and wisdom from the Kalevala.',
         'VY-nuh-MOY-nen'),

        ('Wadjet', 'wadjet', egyptian_pantheon_id, 'feminine',
         ARRAY['protection', 'Lower Egypt', 'royalty'],
         ARRAY['cobra', 'uraeus', 'papyrus'],
         'Cobra goddess, protector of Lower Egypt and pharaohs.',
         'WAH-djet'),

        ('Waheguru', 'waheguru', sikh_pantheon_id, 'nonbinary',
         ARRAY['supreme reality', 'creator', 'sustainer'],
         ARRAY['Ik Onkar symbol', 'light'],
         'The Supreme Being in Sikhism, formless divine reality.',
         'WAH-hay-GOO-roo'),

        ('Wakan Tanka', 'wakan-tanka', lakota_pantheon_id, 'nonbinary',
         ARRAY['great mystery', 'sacred', 'universe'],
         ARRAY['pipe', 'circle'],
         'The Great Mystery, supreme sacred power of the Lakota.',
         'wah-KAHN TAHN-kah'),

        ('White Buffalo Calf Woman', 'white-buffalo-calf-woman', lakota_pantheon_id, 'feminine',
         ARRAY['sacred pipe', 'ceremony', 'prophecy'],
         ARRAY['white buffalo', 'sacred pipe', 'sage'],
         'Sacred woman who brought the ceremonial pipe to the Lakota.',
         'WHYT BUF-ah-loh KAF WOO-man'),

        ('White Tara', 'white-tara', tibetan_pantheon_id, 'feminine',
         ARRAY['compassion', 'longevity', 'healing'],
         ARRAY['white lotus', 'seven eyes'],
         'Goddess of compassion, longevity, and healing.',
         'WHYT TAH-rah'),

        ('Wodan', 'wodan', germanic_pantheon_id, 'masculine',
         ARRAY['wisdom', 'war', 'death', 'magic'],
         ARRAY['spear', 'ravens', 'wolves'],
         'Germanic equivalent of Odin, All-Father.',
         'VOH-dahn'),

        ('Xi Wangmu', 'xi-wangmu', taoist_pantheon_id, 'feminine',
         ARRAY['immortality', 'paradise', 'peaches'],
         ARRAY['peaches of immortality', 'phoenix', 'tiger'],
         'Queen Mother of the West, keeper of the peaches of immortality.',
         'shee WAHNG-moo'),

        ('Xipe Totec', 'xipe-totec', aztec_pantheon_id, 'masculine',
         ARRAY['agriculture', 'rebirth', 'spring', 'goldsmiths'],
         ARRAY['flayed skin', 'maize', 'red and gold'],
         'God of agriculture, rebirth, and spring.',
         'SHEE-peh TOH-tek'),

        ('Xochipilli', 'xochipilli', aztec_pantheon_id, 'masculine',
         ARRAY['flowers', 'beauty', 'song', 'dance', 'games'],
         ARRAY['flowers', 'butterflies', 'hummingbirds'],
         'Aztec god of art, games, beauty, dance, and flowers.',
         'sho-chee-PEE-yee'),

        ('Xochiquetzal', 'xochiquetzal', aztec_pantheon_id, 'feminine',
         ARRAY['flowers', 'beauty', 'love', 'arts'],
         ARRAY['flowers', 'butterflies', 'birds'],
         'Goddess of beauty, flowers, and arts.',
         'shoh-chee-KET-sahl'),

        ('Yama', 'yama', hindu_pantheon_id, 'masculine',
         ARRAY['death', 'justice', 'dharma'],
         ARRAY['buffalo', 'noose', 'mace'],
         'God of death and judge of the dead.',
         'YAH-mah'),

        ('Yemoja', 'yemoja', yoruba_pantheon_id, 'feminine',
         ARRAY['ocean', 'motherhood', 'children', 'protection'],
         ARRAY['ocean', 'cowrie shells', 'fish'],
         'Mother of all Orisha, goddess of the ocean.',
         'yeh-moh-YAH'),

        ('Yuanshi Tianzun', 'yuanshi-tianzun', taoist_pantheon_id, 'masculine',
         ARRAY['primordial', 'creation', 'heaven'],
         ARRAY['pearl', 'fan'],
         'Primordial Lord of Heaven, highest deity in Taoism.',
         'yoo-AHN-shee tee-AHN-dzoon'),

        ('Yúcahu', 'yucahu', caribbean_pantheon_id, 'masculine',
         ARRAY['cassava', 'sea', 'supreme being'],
         ARRAY['cassava', 'water', 'sky'],
         'Supreme creator god and lord of cassava and the sea.',
         'YOO-kah-hoo'),

        ('Zalmoxis', 'zalmoxis', thracian_pantheon_id, 'masculine',
         ARRAY['immortality', 'sky', 'underworld'],
         ARRAY['lightning', 'cave'],
         'God of immortality who ascended to the sky.',
         'zahl-MOX-is'),

        ('Zeus', 'zeus', greek_pantheon_id, 'masculine',
         ARRAY['sky', 'thunder', 'justice', 'kingship'],
         ARRAY['lightning bolt', 'eagle', 'oak', 'bull'],
         'King of the Olympian gods, ruler of the sky and thunder.',
         'ZOO-s'),

        ('Zhongli Quan', 'zhongli-quan', taoist_pantheon_id, 'masculine',
         ARRAY['alchemy', 'medicine', 'immortality'],
         ARRAY['fan', 'peach'],
         'One of the Eight Immortals, master of alchemy.',
         'jong-LEE CHWAHN');

    RAISE NOTICE 'Successfully loaded % deities', (SELECT COUNT(*) FROM deities);
END $$;
