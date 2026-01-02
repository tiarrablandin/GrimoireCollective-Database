-- ============================================================================
-- DEITY RELATIONSHIPS
-- ============================================================================
-- Links deities to planets and chakras based on their domains and symbolism
-- File: 12-deity-relationships.sql
-- ============================================================================

DO $$
DECLARE
    -- Planet IDs
    sun_id UUID;
    moon_id UUID;
    mercury_id UUID;
    venus_id UUID;
    mars_id UUID;
    jupiter_id UUID;
    saturn_id UUID;
    uranus_id UUID;
    neptune_id UUID;
    pluto_id UUID;
    
    -- Chakra IDs
    root_chakra_id UUID;
    sacral_chakra_id UUID;
    solar_plexus_chakra_id UUID;
    heart_chakra_id UUID;
    throat_chakra_id UUID;
    third_eye_chakra_id UUID;
    crown_chakra_id UUID;

BEGIN
    -- Get Planet IDs
    SELECT id INTO sun_id FROM planets WHERE slug = 'sun';
    SELECT id INTO moon_id FROM planets WHERE slug = 'moon';
    SELECT id INTO mercury_id FROM planets WHERE slug = 'mercury';
    SELECT id INTO venus_id FROM planets WHERE slug = 'venus';
    SELECT id INTO mars_id FROM planets WHERE slug = 'mars';
    SELECT id INTO jupiter_id FROM planets WHERE slug = 'jupiter';
    SELECT id INTO saturn_id FROM planets WHERE slug = 'saturn';
    SELECT id INTO uranus_id FROM planets WHERE slug = 'uranus';
    SELECT id INTO neptune_id FROM planets WHERE slug = 'neptune';
    SELECT id INTO pluto_id FROM planets WHERE slug = 'pluto';
    
    -- Get Chakra IDs
    SELECT id INTO root_chakra_id FROM chakras WHERE slug = 'root';
    SELECT id INTO sacral_chakra_id FROM chakras WHERE slug = 'sacral';
    SELECT id INTO solar_plexus_chakra_id FROM chakras WHERE slug = 'solar-plexus';
    SELECT id INTO heart_chakra_id FROM chakras WHERE slug = 'heart';
    SELECT id INTO throat_chakra_id FROM chakras WHERE slug = 'throat';
    SELECT id INTO third_eye_chakra_id FROM chakras WHERE slug = 'third-eye';
    SELECT id INTO crown_chakra_id FROM chakras WHERE slug = 'crown';

    -- =========================================================================
    -- DEITY-PLANET RELATIONSHIPS
    -- =========================================================================
    -- Links deities to planets based on their domains
    -- Sun: Solar deities, kings, vitality, light, leadership
    -- Moon: Lunar deities, goddesses, emotions, cycles, intuition
    -- Mercury: Communication, wisdom, magic, tricksters, messengers
    -- Venus: Love, beauty, fertility, harmony, pleasure
    -- Mars: War, warriors, courage, conflict, strength
    -- Jupiter: Kings, expansion, abundance, justice, wisdom
    -- Saturn: Time, death, agriculture, discipline, karma
    -- Uranus: Change, revolution, innovation, lightning
    -- Neptune: Ocean, dreams, mysticism, illusion
    -- Pluto: Underworld, transformation, death/rebirth, hidden power
    -- =========================================================================
    
    INSERT INTO entity_planets (entity_type, entity_id, planet_id, strength, notes) VALUES
        -- SUN DEITIES
        ('deity', (SELECT id FROM deities WHERE slug = 'ra'), sun_id, 'primary', 'Egyptian sun god'),
        ('deity', (SELECT id FROM deities WHERE slug = 'apollo'), sun_id, 'primary', 'Greek god of sun and light'),
        ('deity', (SELECT id FROM deities WHERE slug = 'helios'), sun_id, 'primary', 'Greek titan of the sun'),
        ('deity', (SELECT id FROM deities WHERE slug = 'amaterasu'), sun_id, 'primary', 'Japanese sun goddess'),
        ('deity', (SELECT id FROM deities WHERE slug = 'surya'), sun_id, 'primary', 'Hindu sun god'),
        ('deity', (SELECT id FROM deities WHERE slug = 'inti'), sun_id, 'primary', 'Inca sun god'),
        ('deity', (SELECT id FROM deities WHERE slug = 'belenos'), sun_id, 'primary', 'Gaulish sun god'),
        ('deity', (SELECT id FROM deities WHERE slug = 'shamash'), sun_id, 'primary', 'Mesopotamian sun god'),
        ('deity', (SELECT id FROM deities WHERE slug = 'tawa'), sun_id, 'primary', 'Hopi sun spirit'),
        ('deity', (SELECT id FROM deities WHERE slug = 'beaivi'), sun_id, 'primary', 'Sami sun goddess'),
        ('deity', (SELECT id FROM deities WHERE slug = 'amun-berber'), sun_id, 'primary', 'Berber sun god'),
        ('deity', (SELECT id FROM deities WHERE slug = 'kuarahy'), sun_id, 'primary', 'Guarani sun god'),
        ('deity', (SELECT id FROM deities WHERE slug = 'sun-bearer'), sun_id, 'primary', 'Navajo sun carrier'),
        
        -- Leadership/Kings (Sun)
        ('deity', (SELECT id FROM deities WHERE slug = 'zeus'), sun_id, 'strong', 'King of gods'),
        ('deity', (SELECT id FROM deities WHERE slug = 'jupiter'), sun_id, 'strong', 'Roman king of gods'),
        ('deity', (SELECT id FROM deities WHERE slug = 'odin'), sun_id, 'strong', 'All-father, ruler'),
        ('deity', (SELECT id FROM deities WHERE slug = 'horus'), sun_id, 'strong', 'Divine pharaoh'),
        ('deity', (SELECT id FROM deities WHERE slug = 'vishnu'), sun_id, 'strong', 'Preserver god'),
        
        -- MOON DEITIES
        ('deity', (SELECT id FROM deities WHERE slug = 'selene'), moon_id, 'primary', 'Greek moon goddess'),
        ('deity', (SELECT id FROM deities WHERE slug = 'artemis'), moon_id, 'primary', 'Greek moon and hunt goddess'),
        ('deity', (SELECT id FROM deities WHERE slug = 'diana'), moon_id, 'primary', 'Roman moon goddess'),
        ('deity', (SELECT id FROM deities WHERE slug = 'ix-chel'), moon_id, 'primary', 'Maya moon goddess'),
        ('deity', (SELECT id FROM deities WHERE slug = 'chandra'), moon_id, 'primary', 'Hindu moon god'),
        ('deity', (SELECT id FROM deities WHERE slug = 'tsukuyomi'), moon_id, 'primary', 'Japanese moon god'),
        ('deity', (SELECT id FROM deities WHERE slug = 'sin'), moon_id, 'primary', 'Mesopotamian moon god'),
        ('deity', (SELECT id FROM deities WHERE slug = 'mama-quilla'), moon_id, 'primary', 'Inca moon goddess'),
        ('deity', (SELECT id FROM deities WHERE slug = 'jacy'), moon_id, 'primary', 'Guarani moon goddess'),
        ('deity', (SELECT id FROM deities WHERE slug = 'tanit'), moon_id, 'strong', 'Berber moon goddess'),
        ('deity', (SELECT id FROM deities WHERE slug = 'bendis'), moon_id, 'strong', 'Thracian moon goddess'),
        ('deity', (SELECT id FROM deities WHERE slug = 'atahensic'), moon_id, 'strong', 'Iroquois grandmother moon'),
        
        -- Emotional/Feminine (Moon)
        ('deity', (SELECT id FROM deities WHERE slug = 'hecate'), moon_id, 'strong', 'Triple moon goddess'),
        ('deity', (SELECT id FROM deities WHERE slug = 'isis'), moon_id, 'strong', 'Divine mother'),
        ('deity', (SELECT id FROM deities WHERE slug = 'yemoja'), moon_id, 'strong', 'Mother of waters'),
        ('deity', (SELECT id FROM deities WHERE slug = 'tara'), moon_id, 'strong', 'Compassionate mother'),
        
        -- MERCURY DEITIES (Communication, Magic, Wisdom)
        ('deity', (SELECT id FROM deities WHERE slug = 'hermes'), mercury_id, 'primary', 'Greek messenger god'),
        ('deity', (SELECT id FROM deities WHERE slug = 'mercury'), mercury_id, 'primary', 'Roman messenger god'),
        ('deity', (SELECT id FROM deities WHERE slug = 'thoth'), mercury_id, 'primary', 'Egyptian god of wisdom and magic'),
        ('deity', (SELECT id FROM deities WHERE slug = 'odin'), mercury_id, 'strong', 'God of wisdom and magic'),
        ('deity', (SELECT id FROM deities WHERE slug = 'athena'), mercury_id, 'strong', 'Goddess of wisdom'),
        ('deity', (SELECT id FROM deities WHERE slug = 'minerva'), mercury_id, 'strong', 'Roman wisdom goddess'),
        ('deity', (SELECT id FROM deities WHERE slug = 'loki'), mercury_id, 'strong', 'Trickster and shapeshifter'),
        ('deity', (SELECT id FROM deities WHERE slug = 'anansi'), mercury_id, 'primary', 'Spider trickster, stories'),
        ('deity', (SELECT id FROM deities WHERE slug = 'eshu'), mercury_id, 'primary', 'Trickster messenger'),
        ('deity', (SELECT id FROM deities WHERE slug = 'saraswati'), mercury_id, 'primary', 'Goddess of knowledge'),
        ('deity', (SELECT id FROM deities WHERE slug = 'enki'), mercury_id, 'strong', 'God of wisdom and magic'),
        ('deity', (SELECT id FROM deities WHERE slug = 'ganesha'), mercury_id, 'strong', 'Remover of obstacles, wisdom'),
        ('deity', (SELECT id FROM deities WHERE slug = 'coyote'), mercury_id, 'strong', 'Navajo trickster'),
        ('deity', (SELECT id FROM deities WHERE slug = 'iktomi'), mercury_id, 'strong', 'Lakota spider trickster'),
        ('deity', (SELECT id FROM deities WHERE slug = 'manjushri'), mercury_id, 'strong', 'Bodhisattva of wisdom'),
        ('deity', (SELECT id FROM deities WHERE slug = 'menrva'), mercury_id, 'strong', 'Etruscan wisdom goddess'),
        
        -- VENUS DEITIES (Love, Beauty, Fertility)
        ('deity', (SELECT id FROM deities WHERE slug = 'aphrodite'), venus_id, 'primary', 'Greek goddess of love'),
        ('deity', (SELECT id FROM deities WHERE slug = 'venus'), venus_id, 'primary', 'Roman goddess of love'),
        ('deity', (SELECT id FROM deities WHERE slug = 'freyja'), venus_id, 'primary', 'Norse love and beauty goddess'),
        ('deity', (SELECT id FROM deities WHERE slug = 'hathor'), venus_id, 'primary', 'Egyptian love goddess'),
        ('deity', (SELECT id FROM deities WHERE slug = 'oshun'), venus_id, 'primary', 'Yoruba love goddess'),
        ('deity', (SELECT id FROM deities WHERE slug = 'erzulie-freda'), venus_id, 'primary', 'Vodou love goddess'),
        ('deity', (SELECT id FROM deities WHERE slug = 'lakshmi'), venus_id, 'primary', 'Hindu beauty and abundance'),
        ('deity', (SELECT id FROM deities WHERE slug = 'inanna'), venus_id, 'primary', 'Mesopotamian love goddess'),
        ('deity', (SELECT id FROM deities WHERE slug = 'ishtar'), venus_id, 'primary', 'Mesopotamian love goddess'),
        ('deity', (SELECT id FROM deities WHERE slug = 'xochiquetzal'), venus_id, 'primary', 'Aztec love goddess'),
        ('deity', (SELECT id FROM deities WHERE slug = 'turan'), venus_id, 'primary', 'Etruscan love goddess'),
        ('deity', (SELECT id FROM deities WHERE slug = 'astghik'), venus_id, 'primary', 'Armenian love goddess'),
        ('deity', (SELECT id FROM deities WHERE slug = 'brigid'), venus_id, 'strong', 'Goddess of hearth and fertility'),
        ('deity', (SELECT id FROM deities WHERE slug = 'parvati'), venus_id, 'strong', 'Divine consort'),
        ('deity', (SELECT id FROM deities WHERE slug = 'changing-woman'), venus_id, 'strong', 'Navajo fertility goddess'),
        
        -- MARS DEITIES (War, Strength, Courage)
        ('deity', (SELECT id FROM deities WHERE slug = 'ares'), mars_id, 'primary', 'Greek god of war'),
        ('deity', (SELECT id FROM deities WHERE slug = 'mars'), mars_id, 'primary', 'Roman god of war'),
        ('deity', (SELECT id FROM deities WHERE slug = 'thor'), mars_id, 'primary', 'Norse thunder warrior'),
        ('deity', (SELECT id FROM deities WHERE slug = 'tyr'), mars_id, 'primary', 'Norse war god'),
        ('deity', (SELECT id FROM deities WHERE slug = 'huitzilopochtli'), mars_id, 'primary', 'Aztec war god'),
        ('deity', (SELECT id FROM deities WHERE slug = 'morrigan'), mars_id, 'primary', 'Celtic war goddess'),
        ('deity', (SELECT id FROM deities WHERE slug = 'sekhmet'), mars_id, 'primary', 'Egyptian war goddess'),
        ('deity', (SELECT id FROM deities WHERE slug = 'ogun'), mars_id, 'primary', 'Yoruba war god'),
        ('deity', (SELECT id FROM deities WHERE slug = 'shango'), mars_id, 'strong', 'Yoruba thunder warrior'),
        ('deity', (SELECT id FROM deities WHERE slug = 'durga'), mars_id, 'strong', 'Hindu warrior goddess'),
        ('deity', (SELECT id FROM deities WHERE slug = 'kartikeya'), mars_id, 'strong', 'Hindu war god'),
        ('deity', (SELECT id FROM deities WHERE slug = 'hachiman'), mars_id, 'strong', 'Japanese war god'),
        ('deity', (SELECT id FROM deities WHERE slug = 'set'), mars_id, 'strong', 'Egyptian chaos and war'),
        ('deity', (SELECT id FROM deities WHERE slug = 'tezcatlipoca-toltec'), mars_id, 'strong', 'Toltec war deity'),
        ('deity', (SELECT id FROM deities WHERE slug = 'vahagn'), mars_id, 'strong', 'Armenian war god'),
        ('deity', (SELECT id FROM deities WHERE slug = 'gurzil'), mars_id, 'strong', 'Berber war god'),
        ('deity', (SELECT id FROM deities WHERE slug = 'tumatauenga'), mars_id, 'strong', 'Māori war god'),
        ('deity', (SELECT id FROM deities WHERE slug = 'amadioha'), mars_id, 'strong', 'Igbo war and justice'),
        
        -- JUPITER DEITIES (Kings, Expansion, Abundance, Justice)
        ('deity', (SELECT id FROM deities WHERE slug = 'zeus'), jupiter_id, 'primary', 'King of gods, justice'),
        ('deity', (SELECT id FROM deities WHERE slug = 'jupiter'), jupiter_id, 'primary', 'Roman king of gods'),
        ('deity', (SELECT id FROM deities WHERE slug = 'odin'), jupiter_id, 'strong', 'All-father'),
        ('deity', (SELECT id FROM deities WHERE slug = 'brahma'), jupiter_id, 'strong', 'Creator god'),
        ('deity', (SELECT id FROM deities WHERE slug = 'vishnu'), jupiter_id, 'strong', 'Preserver, cosmic order'),
        ('deity', (SELECT id FROM deities WHERE slug = 'marduk'), jupiter_id, 'strong', 'Mesopotamian king of gods'),
        ('deity', (SELECT id FROM deities WHERE slug = 'indra'), jupiter_id, 'strong', 'King of gods'),
        ('deity', (SELECT id FROM deities WHERE slug = 'dagda'), jupiter_id, 'strong', 'Celtic father god'),
        ('deity', (SELECT id FROM deities WHERE slug = 'perun'), jupiter_id, 'strong', 'Slavic supreme god'),
        ('deity', (SELECT id FROM deities WHERE slug = 'tinia'), jupiter_id, 'strong', 'Etruscan king of gods'),
        ('deity', (SELECT id FROM deities WHERE slug = 'aramazd'), jupiter_id, 'strong', 'Armenian supreme god'),
        ('deity', (SELECT id FROM deities WHERE slug = 'jade-emperor'), jupiter_id, 'strong', 'Chinese supreme ruler'),
        ('deity', (SELECT id FROM deities WHERE slug = 'tarhunt'), jupiter_id, 'strong', 'Hittite king of gods'),
        
        -- SATURN DEITIES (Time, Death, Agriculture, Discipline, Karma)
        ('deity', (SELECT id FROM deities WHERE slug = 'kronos'), saturn_id, 'primary', 'Titan of time'),
        ('deity', (SELECT id FROM deities WHERE slug = 'saturn'), saturn_id, 'primary', 'Roman god of time and agriculture'),
        ('deity', (SELECT id FROM deities WHERE slug = 'yama'), saturn_id, 'primary', 'Hindu god of death and dharma'),
        ('deity', (SELECT id FROM deities WHERE slug = 'hades'), saturn_id, 'strong', 'Greek god of underworld'),
        ('deity', (SELECT id FROM deities WHERE slug = 'pluto'), saturn_id, 'strong', 'Roman god of underworld'),
        ('deity', (SELECT id FROM deities WHERE slug = 'osiris'), saturn_id, 'strong', 'Egyptian god of afterlife'),
        ('deity', (SELECT id FROM deities WHERE slug = 'anubis'), saturn_id, 'strong', 'Egyptian god of death'),
        ('deity', (SELECT id FROM deities WHERE slug = 'baron-samedi'), saturn_id, 'primary', 'Vodou death loa'),
        ('deity', (SELECT id FROM deities WHERE slug = 'baron-la-croix'), saturn_id, 'strong', 'Voodoo death loa'),
        ('deity', (SELECT id FROM deities WHERE slug = 'hel'), saturn_id, 'strong', 'Norse goddess of death'),
        ('deity', (SELECT id FROM deities WHERE slug = 'ereshkigal'), saturn_id, 'strong', 'Mesopotamian underworld queen'),
        ('deity', (SELECT id FROM deities WHERE slug = 'mictlantecuhtli'), saturn_id, 'primary', 'Aztec death god'),
        ('deity', (SELECT id FROM deities WHERE slug = 'ah-puch'), saturn_id, 'strong', 'Maya death god'),
        ('deity', (SELECT id FROM deities WHERE slug = 'hine-nui-te-po'), saturn_id, 'strong', 'Māori death goddess'),
        ('deity', (SELECT id FROM deities WHERE slug = 'masauu'), saturn_id, 'strong', 'Hopi death god'),
        ('deity', (SELECT id FROM deities WHERE slug = 'shiva'), saturn_id, 'strong', 'Hindu destroyer/transformer'),
        ('deity', (SELECT id FROM deities WHERE slug = 'kali-ma'), saturn_id, 'strong', 'Time and destruction'),
        
        -- URANUS DEITIES (Change, Revolution, Lightning, Innovation)
        ('deity', (SELECT id FROM deities WHERE slug = 'uranus'), uranus_id, 'primary', 'Greek primordial sky'),
        ('deity', (SELECT id FROM deities WHERE slug = 'prometheus'), uranus_id, 'primary', 'Bringer of change'),
        ('deity', (SELECT id FROM deities WHERE slug = 'loki'), uranus_id, 'primary', 'Agent of chaos and change'),
        ('deity', (SELECT id FROM deities WHERE slug = 'thor'), uranus_id, 'strong', 'Lightning god'),
        ('deity', (SELECT id FROM deities WHERE slug = 'raijin'), uranus_id, 'strong', 'Thunder and lightning'),
        ('deity', (SELECT id FROM deities WHERE slug = 'perun'), uranus_id, 'strong', 'Lightning god'),
        ('deity', (SELECT id FROM deities WHERE slug = 'indra'), uranus_id, 'strong', 'Lightning thunderbolt'),
        ('deity', (SELECT id FROM deities WHERE slug = 'taranis'), uranus_id, 'strong', 'Gaulish thunder god'),
        ('deity', (SELECT id FROM deities WHERE slug = 'donar'), uranus_id, 'strong', 'Germanic thunder'),
        ('deity', (SELECT id FROM deities WHERE slug = 'horagalles'), uranus_id, 'strong', 'Sami thunder god'),
        ('deity', (SELECT id FROM deities WHERE slug = 'thunderbird'), uranus_id, 'strong', 'Native American thunder spirit'),
        
        -- NEPTUNE DEITIES (Ocean, Dreams, Mysticism, Illusion)
        ('deity', (SELECT id FROM deities WHERE slug = 'poseidon'), neptune_id, 'primary', 'Greek god of sea'),
        ('deity', (SELECT id FROM deities WHERE slug = 'neptune'), neptune_id, 'primary', 'Roman god of sea'),
        ('deity', (SELECT id FROM deities WHERE slug = 'yemoja'), neptune_id, 'primary', 'Yoruba ocean mother'),
        ('deity', (SELECT id FROM deities WHERE slug = 'manannan-mac-lir'), neptune_id, 'primary', 'Celtic sea god'),
        ('deity', (SELECT id FROM deities WHERE slug = 'njord'), neptune_id, 'primary', 'Norse sea god'),
        ('deity', (SELECT id FROM deities WHERE slug = 'varuna'), neptune_id, 'primary', 'Hindu water and cosmic law'),
        ('deity', (SELECT id FROM deities WHERE slug = 'tangaroa'), neptune_id, 'primary', 'Polynesian ocean god'),
        ('deity', (SELECT id FROM deities WHERE slug = 'kanaloa'), neptune_id, 'primary', 'Hawaiian ocean god'),
        ('deity', (SELECT id FROM deities WHERE slug = 'ryujin'), neptune_id, 'strong', 'Japanese dragon sea god'),
        ('deity', (SELECT id FROM deities WHERE slug = 'ran'), neptune_id, 'strong', 'Norse sea goddess'),
        ('deity', (SELECT id FROM deities WHERE slug = 'mama-cocha'), neptune_id, 'strong', 'Inca sea goddess'),
        ('deity', (SELECT id FROM deities WHERE slug = 'morpheus'), neptune_id, 'strong', 'Greek god of dreams'),
        ('deity', (SELECT id FROM deities WHERE slug = 'damballah'), neptune_id, 'strong', 'Vodou serpent, mysticism'),
        
        -- PLUTO DEITIES (Underworld, Transformation, Death/Rebirth, Hidden Power)
        ('deity', (SELECT id FROM deities WHERE slug = 'hades'), pluto_id, 'primary', 'Greek underworld king'),
        ('deity', (SELECT id FROM deities WHERE slug = 'pluto'), pluto_id, 'primary', 'Roman underworld god'),
        ('deity', (SELECT id FROM deities WHERE slug = 'persephone'), pluto_id, 'primary', 'Queen of underworld'),
        ('deity', (SELECT id FROM deities WHERE slug = 'osiris'), pluto_id, 'primary', 'Egyptian resurrection'),
        ('deity', (SELECT id FROM deities WHERE slug = 'hecate'), pluto_id, 'primary', 'Goddess of magic and crossroads'),
        ('deity', (SELECT id FROM deities WHERE slug = 'morrigan'), pluto_id, 'strong', 'Death and transformation'),
        ('deity', (SELECT id FROM deities WHERE slug = 'kali'), pluto_id, 'primary', 'Destruction and rebirth'),
        ('deity', (SELECT id FROM deities WHERE slug = 'shiva'), pluto_id, 'primary', 'Destroyer and transformer'),
        ('deity', (SELECT id FROM deities WHERE slug = 'ereshkigal'), pluto_id, 'primary', 'Mesopotamian underworld'),
        ('deity', (SELECT id FROM deities WHERE slug = 'hel'), pluto_id, 'primary', 'Norse death realm'),
        ('deity', (SELECT id FROM deities WHERE slug = 'anubis'), pluto_id, 'strong', 'Egyptian psychopomp'),
        ('deity', (SELECT id FROM deities WHERE slug = 'baron-samedi'), pluto_id, 'strong', 'Death and resurrection'),
        ('deity', (SELECT id FROM deities WHERE slug = 'xipe-totec'), pluto_id, 'strong', 'Aztec renewal through death'),
        ('deity', (SELECT id FROM deities WHERE slug = 'mahakala'), pluto_id, 'strong', 'Tibetan fierce protector');

    -- =========================================================================
    -- DEITY-CHAKRA RELATIONSHIPS
    -- =========================================================================
    -- Links deities to chakras based on their energy and domains
    -- Root: Earth, grounding, survival, ancestors, material
    -- Sacral: Creativity, sexuality, pleasure, water, emotions
    -- Solar Plexus: Power, confidence, fire, will, identity
    -- Heart: Love, compassion, healing, air, connection
    -- Throat: Communication, truth, expression, sound
    -- Third Eye: Intuition, wisdom, vision, psychic abilities
    -- Crown: Divine connection, enlightenment, cosmic consciousness
    -- =========================================================================
    
    INSERT INTO entity_chakras (entity_type, entity_id, chakra_id, strength, notes) VALUES
        -- ROOT CHAKRA (Earth, Grounding, Survival, Ancestors)
        ('deity', (SELECT id FROM deities WHERE slug = 'gaia'), root_chakra_id, 'primary', 'Primordial earth goddess'),
        ('deity', (SELECT id FROM deities WHERE slug = 'geb'), root_chakra_id, 'primary', 'Egyptian earth god'),
        ('deity', (SELECT id FROM deities WHERE slug = 'cernunnos'), root_chakra_id, 'primary', 'Horned earth god'),
        ('deity', (SELECT id FROM deities WHERE slug = 'demeter'), root_chakra_id, 'strong', 'Earth and harvest'),
        ('deity', (SELECT id FROM deities WHERE slug = 'ceres'), root_chakra_id, 'strong', 'Roman earth goddess'),
        ('deity', (SELECT id FROM deities WHERE slug = 'pachamama'), root_chakra_id, 'primary', 'Inca earth mother'),
        ('deity', (SELECT id FROM deities WHERE slug = 'papatuanuku'), root_chakra_id, 'primary', 'Māori earth mother'),
        ('deity', (SELECT id FROM deities WHERE slug = 'nerthus'), root_chakra_id, 'primary', 'Germanic earth mother'),
        ('deity', (SELECT id FROM deities WHERE slug = 'api'), root_chakra_id, 'primary', 'Scythian earth goddess'),
        ('deity', (SELECT id FROM deities WHERE slug = 'ala'), root_chakra_id, 'primary', 'Igbo earth goddess'),
        ('deity', (SELECT id FROM deities WHERE slug = 'asase-yaa'), root_chakra_id, 'primary', 'Akan earth goddess'),
        ('deity', (SELECT id FROM deities WHERE slug = 'mother-earth-native'), root_chakra_id, 'primary', 'Native American earth mother'),
        ('deity', (SELECT id FROM deities WHERE slug = 'selu'), root_chakra_id, 'strong', 'Cherokee corn mother'),
        ('deity', (SELECT id FROM deities WHERE slug = 'atabey'), root_chakra_id, 'strong', 'Taíno earth mother'),
        ('deity', (SELECT id FROM deities WHERE slug = 'ngen-mapu'), root_chakra_id, 'primary', 'Mapuche land spirit'),
        
        -- SACRAL CHAKRA (Creativity, Sexuality, Pleasure, Water, Emotions)
        ('deity', (SELECT id FROM deities WHERE slug = 'aphrodite'), sacral_chakra_id, 'primary', 'Love and pleasure'),
        ('deity', (SELECT id FROM deities WHERE slug = 'venus'), sacral_chakra_id, 'primary', 'Roman love goddess'),
        ('deity', (SELECT id FROM deities WHERE slug = 'freyja'), sacral_chakra_id, 'primary', 'Norse love goddess'),
        ('deity', (SELECT id FROM deities WHERE slug = 'oshun'), sacral_chakra_id, 'primary', 'Yoruba love and rivers'),
        ('deity', (SELECT id FROM deities WHERE slug = 'hathor'), sacral_chakra_id, 'primary', 'Egyptian joy and love'),
        ('deity', (SELECT id FROM deities WHERE slug = 'erzulie-freda'), sacral_chakra_id, 'primary', 'Vodou love'),
        ('deity', (SELECT id FROM deities WHERE slug = 'eros'), sacral_chakra_id, 'primary', 'Primordial desire'),
        ('deity', (SELECT id FROM deities WHERE slug = 'dionysus'), sacral_chakra_id, 'strong', 'Ecstasy and pleasure'),
        ('deity', (SELECT id FROM deities WHERE slug = 'bacchus'), sacral_chakra_id, 'strong', 'Roman pleasure'),
        ('deity', (SELECT id FROM deities WHERE slug = 'xochiquetzal'), sacral_chakra_id, 'strong', 'Aztec beauty'),
        ('deity', (SELECT id FROM deities WHERE slug = 'kokopelli'), sacral_chakra_id, 'strong', 'Hopi fertility'),
        ('deity', (SELECT id FROM deities WHERE slug = 'yemoja'), sacral_chakra_id, 'strong', 'Waters and motherhood'),
        ('deity', (SELECT id FROM deities WHERE slug = 'parvati'), sacral_chakra_id, 'strong', 'Divine feminine'),
        
        -- SOLAR PLEXUS CHAKRA (Power, Confidence, Fire, Will)
        ('deity', (SELECT id FROM deities WHERE slug = 'ra'), solar_plexus_chakra_id, 'primary', 'Sun power'),
        ('deity', (SELECT id FROM deities WHERE slug = 'apollo'), solar_plexus_chakra_id, 'primary', 'Light and power'),
        ('deity', (SELECT id FROM deities WHERE slug = 'sekhmet'), solar_plexus_chakra_id, 'primary', 'Fierce power'),
        ('deity', (SELECT id FROM deities WHERE slug = 'durga'), solar_plexus_chakra_id, 'primary', 'Warrior strength'),
        ('deity', (SELECT id FROM deities WHERE slug = 'agni'), solar_plexus_chakra_id, 'primary', 'Fire and transformation'),
        ('deity', (SELECT id FROM deities WHERE slug = 'pele'), solar_plexus_chakra_id, 'primary', 'Volcanic power'),
        ('deity', (SELECT id FROM deities WHERE slug = 'thor'), solar_plexus_chakra_id, 'strong', 'Thunder power'),
        ('deity', (SELECT id FROM deities WHERE slug = 'ares'), solar_plexus_chakra_id, 'strong', 'Warrior will'),
        ('deity', (SELECT id FROM deities WHERE slug = 'huitzilopochtli'), solar_plexus_chakra_id, 'strong', 'Aztec warrior'),
        ('deity', (SELECT id FROM deities WHERE slug = 'morrigan'), solar_plexus_chakra_id, 'strong', 'Battle sovereignty'),
        ('deity', (SELECT id FROM deities WHERE slug = 'amaterasu'), solar_plexus_chakra_id, 'strong', 'Solar power'),
        ('deity', (SELECT id FROM deities WHERE slug = 'brigid'), solar_plexus_chakra_id, 'strong', 'Fire of hearth'),
        
        -- HEART CHAKRA (Love, Compassion, Healing, Connection)
        ('deity', (SELECT id FROM deities WHERE slug = 'guan-yin'), heart_chakra_id, 'primary', 'Infinite compassion'),
        ('deity', (SELECT id FROM deities WHERE slug = 'tara'), heart_chakra_id, 'primary', 'Buddhist compassion'),
        ('deity', (SELECT id FROM deities WHERE slug = 'green-tara'), heart_chakra_id, 'primary', 'Active compassion'),
        ('deity', (SELECT id FROM deities WHERE slug = 'white-tara'), heart_chakra_id, 'primary', 'Healing compassion'),
        ('deity', (SELECT id FROM deities WHERE slug = 'avalokiteshvara'), heart_chakra_id, 'primary', 'Compassion bodhisattva'),
        ('deity', (SELECT id FROM deities WHERE slug = 'isis'), heart_chakra_id, 'strong', 'Divine mother love'),
        ('deity', (SELECT id FROM deities WHERE slug = 'aphrodite'), heart_chakra_id, 'strong', 'Love goddess'),
        ('deity', (SELECT id FROM deities WHERE slug = 'brigid'), heart_chakra_id, 'strong', 'Healing goddess'),
        ('deity', (SELECT id FROM deities WHERE slug = 'eir'), heart_chakra_id, 'strong', 'Norse healing'),
        ('deity', (SELECT id FROM deities WHERE slug = 'yemoja'), heart_chakra_id, 'strong', 'Nurturing mother'),
        ('deity', (SELECT id FROM deities WHERE slug = 'kamrusepa'), heart_chakra_id, 'strong', 'Hittite healing'),
        
        -- THROAT CHAKRA (Communication, Truth, Expression)
        ('deity', (SELECT id FROM deities WHERE slug = 'hermes'), throat_chakra_id, 'primary', 'Divine messenger'),
        ('deity', (SELECT id FROM deities WHERE slug = 'mercury'), throat_chakra_id, 'primary', 'Roman communication'),
        ('deity', (SELECT id FROM deities WHERE slug = 'thoth'), throat_chakra_id, 'primary', 'Sacred words'),
        ('deity', (SELECT id FROM deities WHERE slug = 'saraswati'), throat_chakra_id, 'primary', 'Speech and arts'),
        ('deity', (SELECT id FROM deities WHERE slug = 'bragi'), throat_chakra_id, 'primary', 'Norse poetry'),
        ('deity', (SELECT id FROM deities WHERE slug = 'odin'), throat_chakra_id, 'strong', 'Runes and poetry'),
        ('deity', (SELECT id FROM deities WHERE slug = 'apollo'), throat_chakra_id, 'strong', 'Music and prophecy'),
        ('deity', (SELECT id FROM deities WHERE slug = 'benzaiten'), throat_chakra_id, 'strong', 'Japanese eloquence'),
        ('deity', (SELECT id FROM deities WHERE slug = 'anansi'), throat_chakra_id, 'strong', 'Keeper of stories'),
        
        -- THIRD EYE CHAKRA (Intuition, Wisdom, Vision, Psychic)
        ('deity', (SELECT id FROM deities WHERE slug = 'hecate'), third_eye_chakra_id, 'primary', 'Magic and crossroads'),
        ('deity', (SELECT id FROM deities WHERE slug = 'thoth'), third_eye_chakra_id, 'primary', 'Divine wisdom'),
        ('deity', (SELECT id FROM deities WHERE slug = 'odin'), third_eye_chakra_id, 'primary', 'All-seeing wisdom'),
        ('deity', (SELECT id FROM deities WHERE slug = 'athena'), third_eye_chakra_id, 'primary', 'Strategic wisdom'),
        ('deity', (SELECT id FROM deities WHERE slug = 'ganesha'), third_eye_chakra_id, 'strong', 'Wisdom and insight'),
        ('deity', (SELECT id FROM deities WHERE slug = 'morrigan'), third_eye_chakra_id, 'strong', 'Prophecy and sight'),
        ('deity', (SELECT id FROM deities WHERE slug = 'artemis'), third_eye_chakra_id, 'strong', 'Moon wisdom'),
        ('deity', (SELECT id FROM deities WHERE slug = 'isis'), third_eye_chakra_id, 'strong', 'Great of magic'),
        ('deity', (SELECT id FROM deities WHERE slug = 'enki'), third_eye_chakra_id, 'strong', 'Deep wisdom'),
        ('deity', (SELECT id FROM deities WHERE slug = 'manjushri'), third_eye_chakra_id, 'primary', 'Wisdom bodhisattva'),
        ('deity', (SELECT id FROM deities WHERE slug = 'ix-chel'), third_eye_chakra_id, 'strong', 'Mayan divination'),
        
        -- CROWN CHAKRA (Divine Connection, Enlightenment, Cosmic)
        ('deity', (SELECT id FROM deities WHERE slug = 'buddha'), crown_chakra_id, 'primary', 'Enlightened one'),
        ('deity', (SELECT id FROM deities WHERE slug = 'brahma'), crown_chakra_id, 'primary', 'Cosmic creator'),
        ('deity', (SELECT id FROM deities WHERE slug = 'shiva'), crown_chakra_id, 'primary', 'Divine consciousness'),
        ('deity', (SELECT id FROM deities WHERE slug = 'vishnu'), crown_chakra_id, 'primary', 'Cosmic preserver'),
        ('deity', (SELECT id FROM deities WHERE slug = 'zeus'), crown_chakra_id, 'strong', 'King of gods'),
        ('deity', (SELECT id FROM deities WHERE slug = 'odin'), crown_chakra_id, 'strong', 'All-father'),
        ('deity', (SELECT id FROM deities WHERE slug = 'ra'), crown_chakra_id, 'strong', 'Sun supreme'),
        ('deity', (SELECT id FROM deities WHERE slug = 'amaterasu'), crown_chakra_id, 'strong', 'Celestial ancestor'),
        ('deity', (SELECT id FROM deities WHERE slug = 'anu'), crown_chakra_id, 'strong', 'Sky supreme'),
        ('deity', (SELECT id FROM deities WHERE slug = 'ahura-mazda'), crown_chakra_id, 'primary', 'Supreme wisdom'),
        ('deity', (SELECT id FROM deities WHERE slug = 'avalokiteshvara'), crown_chakra_id, 'strong', 'Enlightened compassion'),
        ('deity', (SELECT id FROM deities WHERE slug = 'wakan-tanka'), crown_chakra_id, 'primary', 'Great mystery'),
        ('deity', (SELECT id FROM deities WHERE slug = 'waheguru'), crown_chakra_id, 'primary', 'Supreme reality'),
        ('deity', (SELECT id FROM deities WHERE slug = 'great-spirit'), crown_chakra_id, 'primary', 'Universal life force'),
        ('deity', (SELECT id FROM deities WHERE slug = 'jade-emperor'), crown_chakra_id, 'strong', 'Celestial emperor'),
        ('deity', (SELECT id FROM deities WHERE slug = 'olodumare'), crown_chakra_id, 'primary', 'Yoruba supreme'),
        ('deity', (SELECT id FROM deities WHERE slug = 'chukwu'), crown_chakra_id, 'primary', 'Igbo supreme creator'),
        ('deity', (SELECT id FROM deities WHERE slug = 'nyame'), crown_chakra_id, 'primary', 'Akan supreme creator');

END $$;
