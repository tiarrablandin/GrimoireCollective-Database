-- =============================================================================
-- GRIMOIRE COLLECTIVE - CRYSTAL ENTITY RELATIONSHIPS
-- =============================================================================
-- Purpose: Entity relationships for crystals (planets, chakras)
-- Dependencies: Requires 18-crystal-data.sql
-- =============================================================================

DO $$
DECLARE
    -- Crystal IDs
    clear_quartz_id UUID;
    rose_quartz_id UUID;
    amethyst_id UUID;
    black_tourmaline_id UUID;
    carnelian_id UUID;
    moonstone_id UUID;
    obsidian_id UUID;
    aventurine_id UUID;
    citrine_id UUID;
    fluorite_id UUID;
    hematite_id UUID;
    jade_id UUID;
    labradorite_id UUID;
    lapis_lazuli_id UUID;
    malachite_id UUID;
    pyrite_id UUID;
    selenite_id UUID;
    smoky_quartz_id UUID;
    sodalite_id UUID;
    tigers_eye_id UUID;
    aquamarine_id UUID;
    
    -- New Crystal IDs (added in expansion)
    red_jasper_id UUID;
    amazonite_id UUID;
    rhodonite_id UUID;
    lepidolite_id UUID;
    bloodstone_id UUID;
    turquoise_id UUID;
    garnet_id UUID;
    peridot_id UUID;
    kyanite_id UUID;
    sunstone_id UUID;
    shungite_id UUID;
    moldavite_id UUID;
    larimar_id UUID;
    apache_tear_id UUID;
    chrysocolla_id UUID;
    celestite_id UUID;
    unakite_id UUID;
    iolite_id UUID;
    azurite_id UUID;
    chrysoprase_id UUID;
    prehnite_id UUID;
    kunzite_id UUID;
    charoite_id UUID;
    howlite_id UUID;
    jet_id UUID;
    calcite_id UUID;
    angelite_id UUID;
    rhodochrosite_id UUID;
    opal_id UUID;
    rutilated_quartz_id UUID;
    emerald_id UUID;
    topaz_id UUID;
    
    -- Additional Crystal IDs (second expansion)
    amber_id UUID;
    obsidian_black_id UUID;
    carnelian_red_id UUID;
    selenite_white_id UUID;
    sodalite_blue_id UUID;
    moonstone_rainbow_id UUID;
    fluorite_purple_id UUID;
    
    -- Third expansion
    ametrine_id UUID;
    apatite_blue_id UUID;
    bronzite_id UUID;
    chrysanthemum_stone_id UUID;
    danburite_id UUID;
    desert_rose_id UUID;
    morganite_id UUID;
    merlinite_id UUID;
    pietersite_id UUID;
    scolecite_id UUID;
    
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
    root_id UUID;
    sacral_id UUID;
    solar_plexus_id UUID;
    heart_id UUID;
    throat_id UUID;
    third_eye_id UUID;
    crown_id UUID;
    
BEGIN
    -- Get Crystal IDs
    SELECT id INTO clear_quartz_id FROM crystals WHERE slug = 'clear-quartz';
    SELECT id INTO rose_quartz_id FROM crystals WHERE slug = 'rose-quartz';
    SELECT id INTO amethyst_id FROM crystals WHERE slug = 'amethyst';
    SELECT id INTO black_tourmaline_id FROM crystals WHERE slug = 'black-tourmaline';
    SELECT id INTO carnelian_id FROM crystals WHERE slug = 'carnelian';
    SELECT id INTO moonstone_id FROM crystals WHERE slug = 'moonstone';
    SELECT id INTO obsidian_id FROM crystals WHERE slug = 'obsidian';
    SELECT id INTO aventurine_id FROM crystals WHERE slug = 'aventurine';
    SELECT id INTO citrine_id FROM crystals WHERE slug = 'citrine';
    SELECT id INTO fluorite_id FROM crystals WHERE slug = 'fluorite';
    SELECT id INTO hematite_id FROM crystals WHERE slug = 'hematite';
    SELECT id INTO jade_id FROM crystals WHERE slug = 'jade';
    SELECT id INTO labradorite_id FROM crystals WHERE slug = 'labradorite';
    SELECT id INTO lapis_lazuli_id FROM crystals WHERE slug = 'lapis-lazuli';
    SELECT id INTO malachite_id FROM crystals WHERE slug = 'malachite';
    SELECT id INTO pyrite_id FROM crystals WHERE slug = 'pyrite';
    SELECT id INTO selenite_id FROM crystals WHERE slug = 'selenite';
    SELECT id INTO smoky_quartz_id FROM crystals WHERE slug = 'smoky-quartz';
    SELECT id INTO sodalite_id FROM crystals WHERE slug = 'sodalite';
    SELECT id INTO tigers_eye_id FROM crystals WHERE slug = 'tigers-eye';
    SELECT id INTO aquamarine_id FROM crystals WHERE slug = 'aquamarine';
    
    -- Get New Crystal IDs
    SELECT id INTO red_jasper_id FROM crystals WHERE slug = 'red-jasper';
    SELECT id INTO amazonite_id FROM crystals WHERE slug = 'amazonite';
    SELECT id INTO rhodonite_id FROM crystals WHERE slug = 'rhodonite';
    SELECT id INTO lepidolite_id FROM crystals WHERE slug = 'lepidolite';
    SELECT id INTO bloodstone_id FROM crystals WHERE slug = 'bloodstone';
    SELECT id INTO turquoise_id FROM crystals WHERE slug = 'turquoise';
    SELECT id INTO garnet_id FROM crystals WHERE slug = 'garnet';
    SELECT id INTO peridot_id FROM crystals WHERE slug = 'peridot';
    SELECT id INTO kyanite_id FROM crystals WHERE slug = 'kyanite';
    SELECT id INTO sunstone_id FROM crystals WHERE slug = 'sunstone';
    SELECT id INTO shungite_id FROM crystals WHERE slug = 'shungite';
    SELECT id INTO moldavite_id FROM crystals WHERE slug = 'moldavite';
    SELECT id INTO larimar_id FROM crystals WHERE slug = 'larimar';
    SELECT id INTO apache_tear_id FROM crystals WHERE slug = 'apache-tear';
    SELECT id INTO chrysocolla_id FROM crystals WHERE slug = 'chrysocolla';
    SELECT id INTO celestite_id FROM crystals WHERE slug = 'celestite';
    SELECT id INTO unakite_id FROM crystals WHERE slug = 'unakite';
    SELECT id INTO iolite_id FROM crystals WHERE slug = 'iolite';
    SELECT id INTO azurite_id FROM crystals WHERE slug = 'azurite';
    SELECT id INTO chrysoprase_id FROM crystals WHERE slug = 'chrysoprase';
    SELECT id INTO prehnite_id FROM crystals WHERE slug = 'prehnite';
    SELECT id INTO kunzite_id FROM crystals WHERE slug = 'kunzite';
    SELECT id INTO charoite_id FROM crystals WHERE slug = 'charoite';
    SELECT id INTO howlite_id FROM crystals WHERE slug = 'howlite';
    SELECT id INTO jet_id FROM crystals WHERE slug = 'jet';
    SELECT id INTO calcite_id FROM crystals WHERE slug = 'calcite';
    SELECT id INTO angelite_id FROM crystals WHERE slug = 'angelite';
    SELECT id INTO rhodochrosite_id FROM crystals WHERE slug = 'rhodochrosite';
    SELECT id INTO opal_id FROM crystals WHERE slug = 'opal';
    SELECT id INTO rutilated_quartz_id FROM crystals WHERE slug = 'rutilated-quartz';
    SELECT id INTO emerald_id FROM crystals WHERE slug = 'emerald';
    SELECT id INTO topaz_id FROM crystals WHERE slug = 'topaz';
    
    -- Get Additional Crystal IDs
    SELECT id INTO amber_id FROM crystals WHERE slug = 'amber';
    SELECT id INTO obsidian_black_id FROM crystals WHERE slug = 'obsidian-black';
    SELECT id INTO carnelian_red_id FROM crystals WHERE slug = 'carnelian-red';
    SELECT id INTO selenite_white_id FROM crystals WHERE slug = 'selenite-white';
    SELECT id INTO sodalite_blue_id FROM crystals WHERE slug = 'sodalite-blue';
    SELECT id INTO moonstone_rainbow_id FROM crystals WHERE slug = 'moonstone-rainbow';
    SELECT id INTO fluorite_purple_id FROM crystals WHERE slug = 'fluorite-purple';
    
    -- Get Third Expansion Crystal IDs
    SELECT id INTO ametrine_id FROM crystals WHERE slug = 'ametrine';
    SELECT id INTO apatite_blue_id FROM crystals WHERE slug = 'apatite-blue';
    SELECT id INTO bronzite_id FROM crystals WHERE slug = 'bronzite';
    SELECT id INTO chrysanthemum_stone_id FROM crystals WHERE slug = 'chrysanthemum-stone';
    SELECT id INTO danburite_id FROM crystals WHERE slug = 'danburite';
    SELECT id INTO desert_rose_id FROM crystals WHERE slug = 'desert-rose';
    SELECT id INTO morganite_id FROM crystals WHERE slug = 'morganite';
    SELECT id INTO merlinite_id FROM crystals WHERE slug = 'merlinite';
    SELECT id INTO pietersite_id FROM crystals WHERE slug = 'pietersite';
    SELECT id INTO scolecite_id FROM crystals WHERE slug = 'scolecite';
    
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
    SELECT id INTO root_id FROM chakras WHERE slug = 'root';
    SELECT id INTO sacral_id FROM chakras WHERE slug = 'sacral';
    SELECT id INTO solar_plexus_id FROM chakras WHERE slug = 'solar-plexus';
    SELECT id INTO heart_id FROM chakras WHERE slug = 'heart';
    SELECT id INTO throat_id FROM chakras WHERE slug = 'throat';
    SELECT id INTO third_eye_id FROM chakras WHERE slug = 'third-eye';
    SELECT id INTO crown_id FROM chakras WHERE slug = 'crown';
    
    -- ===========================================================================
    -- CRYSTAL-PLANET RELATIONSHIPS
    -- ===========================================================================
    
    INSERT INTO entity_planets (entity_type, entity_id, planet_id, strength, notes) VALUES
        ('crystal', clear_quartz_id, sun_id, 'primary', 'Clear Quartz amplifies all planetary energies, primarily aligned with the Sun'),
        ('crystal', rose_quartz_id, venus_id, 'primary', 'Rose Quartz embodies Venus energy of love and beauty'),
        ('crystal', amethyst_id, jupiter_id, 'primary', 'Amethyst resonates with Jupiter for spiritual wisdom and expansion'),
        ('crystal', black_tourmaline_id, saturn_id, 'primary', 'Black Tourmaline carries Saturn''s protective and grounding energy'),
        ('crystal', carnelian_id, mars_id, 'primary', 'Carnelian channels Mars energy for courage and motivation'),
        ('crystal', moonstone_id, moon_id, 'primary', 'Moonstone is the quintessential Moon stone for intuition and cycles'),
        ('crystal', obsidian_id, saturn_id, 'primary', 'Obsidian embodies Saturn''s transformative and protective power'),
        ('crystal', aventurine_id, venus_id, 'primary', 'Aventurine carries Venus energy for luck and prosperity'),
        ('crystal', citrine_id, sun_id, 'primary', 'Citrine radiates Sun energy for abundance and vitality'),
        ('crystal', fluorite_id, mercury_id, 'primary', 'Fluorite aligns with Mercury for mental clarity and communication'),
        ('crystal', hematite_id, mars_id, 'primary', 'Hematite grounds Mars energy for strength and courage'),
        ('crystal', jade_id, venus_id, 'primary', 'Jade embodies Venus energy of harmony and prosperity'),
        ('crystal', labradorite_id, moon_id, 'primary', 'Labradorite reflects Moon energy for magic and transformation'),
        ('crystal', lapis_lazuli_id, jupiter_id, 'primary', 'Lapis Lazuli channels Jupiter energy for wisdom and truth'),
        ('crystal', malachite_id, venus_id, 'primary', 'Malachite carries Venus energy for transformation and healing'),
        ('crystal', pyrite_id, mars_id, 'primary', 'Pyrite embodies Mars energy for manifestation and action'),
        ('crystal', selenite_id, moon_id, 'primary', 'Selenite connects to Moon energy for spiritual cleansing'),
        ('crystal', smoky_quartz_id, saturn_id, 'primary', 'Smoky Quartz grounds Saturn energy for protection and transmutation'),
        ('crystal', sodalite_id, mercury_id, 'primary', 'Sodalite aligns with Mercury for communication and logic'),
        ('crystal', tigers_eye_id, sun_id, 'primary', 'Tiger''s Eye channels Sun energy for confidence and courage'),
        ('crystal', aquamarine_id, moon_id, 'primary', 'Aquamarine flows with Moon energy for emotional healing'),
        
        -- New Crystal-Planet Relationships
        ('crystal', red_jasper_id, mars_id, 'primary', 'Red Jasper channels Mars energy for endurance and vitality'),
        ('crystal', amazonite_id, venus_id, 'primary', 'Amazonite carries Venus energy for calming and balance'),
        ('crystal', rhodonite_id, venus_id, 'primary', 'Rhodonite embodies Venus energy for emotional healing and love'),
        ('crystal', lepidolite_id, jupiter_id, 'primary', 'Lepidolite aligns with Jupiter for transition and peace'),
        ('crystal', bloodstone_id, mars_id, 'primary', 'Bloodstone channels Mars energy for courage and healing'),
        ('crystal', turquoise_id, venus_id, 'primary', 'Turquoise carries Venus and Jupiter energy for protection and wisdom'),
        ('crystal', garnet_id, mars_id, 'primary', 'Garnet embodies Mars energy for passion and commitment'),
        ('crystal', peridot_id, venus_id, 'primary', 'Peridot flows with Venus energy for heart healing and prosperity'),
        ('crystal', kyanite_id, mercury_id, 'primary', 'Kyanite aligns with Mercury for truth and alignment'),
        ('crystal', sunstone_id, sun_id, 'primary', 'Sunstone radiates pure Sun energy for joy and vitality'),
        ('crystal', shungite_id, saturn_id, 'primary', 'Shungite grounds Saturn energy for protection and purification'),
        ('crystal', moldavite_id, moon_id, 'primary', 'Moldavite channels cosmic energy for rapid transformation'),
        ('crystal', larimar_id, moon_id, 'primary', 'Larimar flows with Moon energy for divine feminine and calming'),
        ('crystal', apache_tear_id, saturn_id, 'primary', 'Apache Tear carries Saturn energy for gentle grief work'),
        ('crystal', chrysocolla_id, venus_id, 'primary', 'Chrysocolla embodies Venus energy for communication and peace'),
        ('crystal', celestite_id, moon_id, 'primary', 'Celestite connects to Moon and higher realms for angelic energy'),
        ('crystal', unakite_id, venus_id, 'primary', 'Unakite balances Venus energy for emotional and spiritual growth'),
        ('crystal', iolite_id, jupiter_id, 'primary', 'Iolite aligns with Jupiter for vision and spiritual journey'),
        ('crystal', azurite_id, jupiter_id, 'primary', 'Azurite channels Jupiter energy for psychic development and insight'),
        ('crystal', chrysoprase_id, venus_id, 'primary', 'Chrysoprase embodies Venus energy for joy and heart healing'),
        ('crystal', prehnite_id, venus_id, 'primary', 'Prehnite carries Venus energy for healing and precognition'),
        ('crystal', kunzite_id, venus_id, 'primary', 'Kunzite flows with Venus energy for self-love and emotional balance'),
        ('crystal', charoite_id, saturn_id, 'primary', 'Charoite channels Saturn energy for transformation and courage'),
        ('crystal', howlite_id, moon_id, 'primary', 'Howlite aligns with Moon energy for calming and sleep'),
        ('crystal', jet_id, saturn_id, 'primary', 'Jet embodies Saturn energy for protection and grounding'),
        ('crystal', calcite_id, sun_id, 'primary', 'Calcite amplifies Sun energy for cleansing and energizing'),
        ('crystal', angelite_id, moon_id, 'primary', 'Angelite connects to Moon and angelic realms for communication'),
        ('crystal', rhodochrosite_id, venus_id, 'primary', 'Rhodochrosite radiates Venus energy for self-love and compassion'),
        ('crystal', opal_id, moon_id, 'primary', 'Opal channels Moon energy for passion and emotional intensity'),
        ('crystal', rutilated_quartz_id, sun_id, 'primary', 'Rutilated Quartz amplifies Sun energy with golden light for manifestation'),
        ('crystal', emerald_id, venus_id, 'primary', 'Emerald embodies pure Venus energy for love and loyalty'),
        ('crystal', topaz_id, sun_id, 'primary', 'Topaz radiates Sun energy for truth and personal power'),
        
        -- Additional Crystal-Planet Relationships
        ('crystal', amber_id, sun_id, 'primary', 'Amber carries ancient Sun energy for healing and protection'),
        ('crystal', obsidian_black_id, saturn_id, 'primary', 'Black Obsidian grounds Saturn energy for protection and truth'),
        ('crystal', carnelian_red_id, mars_id, 'primary', 'Carnelian radiates Mars energy for courage and vitality'),
        ('crystal', selenite_white_id, moon_id, 'primary', 'Selenite connects pure Moon energy for spiritual cleansing'),
        ('crystal', sodalite_blue_id, mercury_id, 'primary', 'Sodalite aligns with Mercury for logic and communication'),
        ('crystal', moonstone_rainbow_id, moon_id, 'primary', 'Moonstone embodies Moon energy for intuition and new beginnings'),
        ('crystal', fluorite_purple_id, mercury_id, 'primary', 'Fluorite channels Mercury energy for mental clarity and focus'),
        
        -- Third Expansion Crystal-Planet Relationships
        ('crystal', ametrine_id, jupiter_id, 'primary', 'Ametrine combines Jupiter expansion with Sun manifestation energy'),
        ('crystal', apatite_blue_id, mercury_id, 'primary', 'Blue Apatite carries Mercury energy for manifestation and communication'),
        ('crystal', bronzite_id, mars_id, 'primary', 'Bronzite grounds Mars energy for courage and protection'),
        ('crystal', chrysanthemum_stone_id, saturn_id, 'primary', 'Chrysanthemum Stone embodies Saturn energy for harmony, structure, and purpose'),
        ('crystal', danburite_id, venus_id, 'primary', 'Danburite channels Venus energy for angelic connection and serenity'),
        ('crystal', desert_rose_id, saturn_id, 'primary', 'Desert Rose carries Saturn energy for grounding and structure'),
        ('crystal', morganite_id, venus_id, 'primary', 'Morganite flows with Venus energy for divine love and compassion'),
        ('crystal', merlinite_id, pluto_id, 'primary', 'Merlinite channels Pluto transformation energy for magic and shadow work'),
        ('crystal', pietersite_id, uranus_id, 'primary', 'Pietersite embodies Uranus storm energy for change and truth'),
        ('crystal', scolecite_id, moon_id, 'primary', 'Scolecite flows with Moon energy for dreams and inner peace');
    
    -- ===========================================================================
    -- CRYSTAL-CHAKRA RELATIONSHIPS
    -- ===========================================================================
    
    INSERT INTO entity_chakras (entity_type, entity_id, chakra_id, strength, notes) VALUES
        ('crystal', clear_quartz_id, crown_id, 'primary', 'Clear Quartz opens and amplifies all chakras, especially Crown'),
        ('crystal', rose_quartz_id, heart_id, 'primary', 'Rose Quartz is the heart chakra stone for love and compassion'),
        ('crystal', amethyst_id, third_eye_id, 'primary', 'Amethyst activates the third eye for intuition and spiritual sight'),
        ('crystal', black_tourmaline_id, root_id, 'primary', 'Black Tourmaline grounds and protects the root chakra'),
        ('crystal', carnelian_id, sacral_id, 'primary', 'Carnelian energizes the sacral chakra for creativity and passion'),
        ('crystal', moonstone_id, third_eye_id, 'primary', 'Moonstone opens the third eye for intuition and inner knowing'),
        ('crystal', obsidian_id, root_id, 'primary', 'Obsidian deeply grounds and heals the root chakra'),
        ('crystal', aventurine_id, heart_id, 'primary', 'Aventurine opens the heart chakra for compassion and prosperity'),
        ('crystal', citrine_id, solar_plexus_id, 'primary', 'Citrine activates the solar plexus for personal power and confidence'),
        ('crystal', fluorite_id, throat_id, 'primary', 'Fluorite clears the throat chakra for clear communication'),
        ('crystal', hematite_id, root_id, 'primary', 'Hematite strongly grounds and stabilizes the root chakra'),
        ('crystal', jade_id, heart_id, 'primary', 'Jade harmonizes the heart chakra for balance and prosperity'),
        ('crystal', labradorite_id, third_eye_id, 'primary', 'Labradorite awakens the third eye for psychic abilities'),
        ('crystal', lapis_lazuli_id, throat_id, 'primary', 'Lapis Lazuli opens the throat chakra for truth and expression'),
        ('crystal', malachite_id, heart_id, 'primary', 'Malachite transforms and heals the heart chakra'),
        ('crystal', pyrite_id, solar_plexus_id, 'primary', 'Pyrite empowers the solar plexus for manifestation and will'),
        ('crystal', selenite_id, crown_id, 'primary', 'Selenite connects to the crown chakra for spiritual connection'),
        ('crystal', smoky_quartz_id, root_id, 'primary', 'Smoky Quartz grounds and protects the root chakra'),
        ('crystal', sodalite_id, throat_id, 'primary', 'Sodalite balances the throat chakra for authentic communication'),
        ('crystal', tigers_eye_id, solar_plexus_id, 'primary', 'Tiger''s Eye strengthens the solar plexus for courage and confidence'),
        ('crystal', aquamarine_id, throat_id, 'primary', 'Aquamarine soothes the throat chakra for compassionate communication'),
        
        -- New Crystal-Chakra Relationships
        ('crystal', red_jasper_id, root_id, 'primary', 'Red Jasper energizes the root chakra for physical stamina'),
        ('crystal', amazonite_id, throat_id, 'primary', 'Amazonite calms the throat chakra for clear communication'),
        ('crystal', rhodonite_id, heart_id, 'primary', 'Rhodonite heals the heart chakra for forgiveness and compassion'),
        ('crystal', lepidolite_id, crown_id, 'primary', 'Lepidolite soothes the crown chakra for peace and transition'),
        ('crystal', bloodstone_id, root_id, 'primary', 'Bloodstone strengthens the root chakra for courage and vitality'),
        ('crystal', turquoise_id, throat_id, 'primary', 'Turquoise opens the throat chakra for spiritual communication'),
        ('crystal', garnet_id, root_id, 'primary', 'Garnet activates the root chakra for passion and energy'),
        ('crystal', peridot_id, heart_id, 'primary', 'Peridot cleanses the heart chakra for prosperity and joy'),
        ('crystal', kyanite_id, throat_id, 'primary', 'Kyanite aligns all chakras instantly, especially throat for truth'),
        ('crystal', sunstone_id, sacral_id, 'primary', 'Sunstone energizes the sacral and solar plexus for joy and confidence'),
        ('crystal', shungite_id, root_id, 'primary', 'Shungite grounds the root chakra with protective energy'),
        ('crystal', moldavite_id, heart_id, 'primary', 'Moldavite activates heart and third eye for rapid spiritual transformation'),
        ('crystal', larimar_id, throat_id, 'primary', 'Larimar soothes the throat chakra for divine communication'),
        ('crystal', apache_tear_id, root_id, 'primary', 'Apache Tear gently grounds root chakra during grief'),
        ('crystal', chrysocolla_id, throat_id, 'primary', 'Chrysocolla opens throat chakra for teaching and expression'),
        ('crystal', celestite_id, crown_id, 'primary', 'Celestite connects crown and third eye to angelic realms'),
        ('crystal', unakite_id, heart_id, 'primary', 'Unakite balances heart and third eye for spiritual growth'),
        ('crystal', iolite_id, third_eye_id, 'primary', 'Iolite activates the third eye for vision and intuition'),
        ('crystal', azurite_id, third_eye_id, 'primary', 'Azurite opens the third eye for psychic development'),
        ('crystal', chrysoprase_id, heart_id, 'primary', 'Chrysoprase heals the heart chakra for joy and optimism'),
        ('crystal', prehnite_id, heart_id, 'primary', 'Prehnite connects heart and solar plexus for healing energy'),
        ('crystal', kunzite_id, heart_id, 'primary', 'Kunzite opens the heart chakra for self-love and emotional healing'),
        ('crystal', charoite_id, crown_id, 'primary', 'Charoite activates the crown chakra for transformation'),
        ('crystal', howlite_id, crown_id, 'primary', 'Howlite calms the crown chakra for peaceful sleep'),
        ('crystal', jet_id, root_id, 'primary', 'Jet grounds the root chakra for protection'),
        ('crystal', calcite_id, crown_id, 'primary', 'Calcite energizes all chakras, especially crown for clarity'),
        ('crystal', angelite_id, throat_id, 'primary', 'Angelite opens throat and crown for angelic communication'),
        ('crystal', rhodochrosite_id, heart_id, 'primary', 'Rhodochrosite nurtures the heart chakra for self-love'),
        ('crystal', opal_id, heart_id, 'primary', 'Opal amplifies heart and sacral chakras for passion'),
        ('crystal', rutilated_quartz_id, solar_plexus_id, 'primary', 'Rutilated Quartz energizes solar plexus for manifestation'),
        ('crystal', emerald_id, heart_id, 'primary', 'Emerald opens the heart chakra for unconditional love'),
        ('crystal', topaz_id, solar_plexus_id, 'primary', 'Topaz activates solar plexus for personal power and truth'),
        
        -- Additional Crystal-Chakra Relationships
        ('crystal', amber_id, solar_plexus_id, 'primary', 'Amber energizes solar plexus for healing and vitality'),
        ('crystal', obsidian_black_id, root_id, 'primary', 'Black Obsidian deeply grounds root chakra for protection'),
        ('crystal', carnelian_red_id, sacral_id, 'primary', 'Carnelian activates sacral chakra for creativity and passion'),
        ('crystal', selenite_white_id, crown_id, 'primary', 'Selenite connects crown chakra to divine and angelic realms'),
        ('crystal', sodalite_blue_id, throat_id, 'primary', 'Sodalite opens throat chakra for rational communication'),
        ('crystal', moonstone_rainbow_id, crown_id, 'primary', 'Moonstone connects crown and third eye for intuition'),
        ('crystal', fluorite_purple_id, third_eye_id, 'primary', 'Fluorite activates third eye for mental clarity and focus'),
        
        -- Third Expansion Crystal-Chakra Relationships
        ('crystal', ametrine_id, solar_plexus_id, 'primary', 'Ametrine balances solar plexus and crown for harmonious manifestation'),
        ('crystal', apatite_blue_id, throat_id, 'primary', 'Blue Apatite activates throat chakra for clear manifestation and expression'),
        ('crystal', bronzite_id, solar_plexus_id, 'primary', 'Bronzite strengthens solar plexus for courage and decisive action'),
        ('crystal', chrysanthemum_stone_id, root_id, 'primary', 'Chrysanthemum Stone grounds root while opening crown for balance'),
        ('crystal', danburite_id, crown_id, 'primary', 'Danburite activates crown for angelic connection and spiritual peace'),
        ('crystal', desert_rose_id, root_id, 'primary', 'Desert Rose powerfully grounds root chakra while enhancing intuition'),
        ('crystal', morganite_id, heart_id, 'primary', 'Morganite opens heart for divine love, compassion, and healing'),
        ('crystal', merlinite_id, third_eye_id, 'primary', 'Merlinite activates third eye for magic, psychic abilities, and shamanic work'),
        ('crystal', pietersite_id, third_eye_id, 'primary', 'Pietersite stimulates third eye for truth-seeing and transformation'),
        ('crystal', scolecite_id, heart_id, 'primary', 'Scolecite opens heart for deep peace and spiritual connection');
    
    RAISE NOTICE '✓ Crystal entity relationships created successfully';
    RAISE NOTICE '   - 70 crystal-planet relationships';
    RAISE NOTICE '   - 70 crystal-chakra relationships';


END $$;
