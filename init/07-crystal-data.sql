-- =============================================================================
-- GRIMOIRE COLLECTIVE - CRYSTAL DATA
-- =============================================================================
-- Purpose: Comprehensive crystal/stone data for the knowledge base
-- Note: This is permanent data, not sample data
-- =============================================================================

DO $$
DECLARE
    admin_user_id UUID;
BEGIN
    SELECT id INTO admin_user_id FROM users WHERE username = 'admin' LIMIT 1;

INSERT INTO crystals (
    name, slug, alternative_names, color,
    cleansing_methods, charging_methods,
    description, uses, water_safe, sun_safe, salt_safe, rarity,
    history, directions, storage_instructions, safety_warnings,
    created_by, is_verified
) VALUES
(
    'Clear Quartz',
    'clear-quartz',
    ARRAY['Rock Crystal', 'Crystal Quartz'],
    'Clear/White',
    ARRAY['full_moon', 'running_water', 'smoke', 'sound'],
    ARRAY['moonlight', 'sunlight', 'crystal_cluster'],
    'Clear Quartz is known as the "Master Healer" and "Universal Crystal". It is the most versatile healing stone among all crystals. It has the ability to amplify energy and thought, as well as the effect of other crystals.',
    'Use Clear Quartz in meditation to amplify intentions, place on any chakra for healing, program it for specific purposes, use in crystal grids as a central stone or amplifier.',
    true,
    true,
    true,
    'common',
    'Clear Quartz has been revered since ancient times across nearly every culture. The name "quartz" comes from the Greek word "krystallos" meaning ice, as ancient Greeks believed it was water frozen so solid it would never thaw. Ancient Roman, Egyptian, and Greek civilizations used clear quartz in jewelry and carvings. In Asia, crystal balls made from clear quartz were used for divination. Native Americans used it in sacred ceremonies. The Japanese called it "the perfect jewel" believing it symbolized infinite space, purity, and perseverance. It has been used in healing and spiritual practices for over 6,000 years.',
    'To use Clear Quartz: Hold in your hand or place on body during meditation. Program by holding and focusing your intention into the stone. Use in crystal grids as a master stone or amplifier. Place on altar to amplify magical workings. Wear as jewelry for constant energetic support. Place in corners of room for space clearing. Combine with other stones to amplify their properties. Cleanse regularly as it absorbs energy easily.',
    'Store in soft cloth or padded box to prevent scratches. Can be stored with other stones. Keep away from harsh chemicals and extreme temperature changes. Safe to store in sunlight and moonlight.',
    'Clear Quartz is safe to handle and wear. Water safe. Sun safe. Salt safe. Non-toxic. Points can be sharp - handle carefully to avoid cuts.',
    admin_user_id,
    true
),
(
    'Rose Quartz',
    'rose-quartz',
    ARRAY['Pink Quartz', 'Love Stone'],
    'Pink',
    ARRAY['full_moon', 'running_water', 'smoke'],
    ARRAY['moonlight', 'earth'],
    'Rose Quartz is the stone of universal love. It restores trust and harmony in relationships, encouraging unconditional love. Rose Quartz purifies and opens the heart at all levels to promote love, self-love, friendship, deep inner healing and feelings of peace.',
    'Place Rose Quartz in your bedroom to attract love, hold during meditation for self-love work, wear as jewelry near your heart, use in love spells and attraction rituals.',
    true,
    false,
    true,
    'common',
    'Rose Quartz has been used as a love token since 600 B.C. Ancient Assyrians and Romans were among the first to use rose quartz in jewelry and amulets. In Egyptian and Roman mythology, rose quartz was believed to be a gift from Cupid and Eros to inspire love among people. It was also used in facial masks by Egyptian and Roman women to beautify their complexion. Ancient Tibetan and Chinese cultures carved healing amulets from rose quartz. Greek mythology says Aphrodite''s blood stained clear quartz pink when she tried to save Adonis, creating rose quartz.',
    'To use Rose Quartz: Place over heart chakra during meditation for self-love and healing. Keep near bed to attract love and promote peaceful sleep. Carry in pocket or wear as jewelry to stay open to love throughout the day. Create a love altar with rose quartz as the centerpiece. Use in bath water for self-love rituals (water safe). Place in relationship corner of home (far right corner from entrance) for feng shui love energy. Give as gifts to loved ones.',
    'Store away from direct sunlight as prolonged sun exposure may fade the pink color. Keep in soft cloth to prevent scratches. Can be stored with other gentle stones. Room temperature storage is ideal.',
    'Rose Quartz is safe to handle and wear. Water safe. Salt safe. NOT sun safe - will fade in direct sunlight over time. Non-toxic. Generally gentle energy suitable for everyone including children.',
    admin_user_id,
    true
),
(
    'Amethyst',
    'amethyst',
    ARRAY['Purple Quartz', 'Bishop Stone'],
    'Purple',
    ARRAY['full_moon', 'smoke', 'sound'],
    ARRAY['moonlight', 'crystal_cluster'],
    'Amethyst is a powerful and protective stone. It guards against psychic attack, transmuting the energy into love and protecting the wearer from all types of harm. Amethyst is a natural tranquilizer, it relieves stress and strain, soothes irritability, balances mood swings, and dispels anger, rage, fear and anxiety.',
    'Place Amethyst on your third eye during meditation, keep by bedside to prevent nightmares, use in divination and psychic work, carry for protection, place in your home to maintain peaceful energy.',
    true,
    false,
    true,
    'common',
    'Amethyst''s name comes from the Greek "amethystos" meaning "not intoxicated," as ancient Greeks believed it protected against drunkenness. They carved drinking vessels from amethyst to prevent intoxication. Leonardo da Vinci wrote that amethyst could dissipate evil thoughts and quicken intelligence. In medieval times, European soldiers wore amethyst amulets for protection in battle. It has been a stone of royalty, adorning the British Crown Jewels and worn by Catholic bishops. Ancient Egyptians used it in amulets and jewelry. Tibetan Buddhists make prayer beads from amethyst.',
    'To use Amethyst: Place on third eye chakra during meditation to enhance intuition. Keep by bedside or under pillow to prevent nightmares and promote restful sleep. Hold during meditation to connect with higher consciousness. Place in workspace to enhance mental clarity and creativity. Create a meditation grid with amethyst at center. Wear as jewelry for spiritual protection throughout the day. Place in home to maintain peaceful, protective energy. Use in moon rituals and spiritual ceremonies.',
    'Store away from direct sunlight as amethyst will fade to pale lavender or clear if exposed to strong sun for prolonged periods. Keep in padded box or soft cloth. Room temperature storage is best.',
    'Amethyst is safe to handle and wear. Water safe. Salt safe. NOT sun safe - will fade in sunlight. Non-toxic. Safe for all ages. The calming energy makes it excellent for beginners and children.',
    admin_user_id,
    true
),
(
    'Black Tourmaline',
    'black-tourmaline',
    ARRAY['Schorl', 'Black Schorl'],
    'Black',
    ARRAY['full_moon', 'running_water', 'smoke', 'sound', 'earth'],
    ARRAY['moonlight', 'sunlight', 'earth'],
    'Black Tourmaline is a powerful grounding stone, providing a connection between Earth and the human spirit. It provides protection from negative energies and electromagnetic radiation. Black Tourmaline also helps to balance and align the chakras.',
    'Place Black Tourmaline at the four corners of your home for protection, carry it for personal shielding, place near electronics to absorb EMF, use in grounding meditation, keep by the front door.',
    true,
    true,
    true,
    'common',
    'Black Tourmaline has been used for protection since ancient times. Dutch traders in the 1700s brought it to Europe from Sri Lanka, where they observed its pyroelectric properties (becomes electrically charged when heated). Ancient magicians relied upon Black Tourmaline to protect them from earth demons. The name tourmaline comes from the Sinhalese word "turamali" meaning "stone with mixed colors," though black tourmaline (schorl) is the most common variety. Indigenous peoples used it in shamanic practices. In the 1800s, it was used in scientific instruments due to its electrical properties.',
    'To use Black Tourmaline: Place at the four corners of your home for protection. Keep by front door to prevent negative energy from entering. Place near computer or electronic devices to absorb electromagnetic frequencies (EMF). Carry in pocket or wear as jewelry for personal protection throughout the day. Place under pillow to protect against nightmares. Use in grounding meditation by holding or placing at feet. Create protective grids with black tourmaline. Place in car for travel protection.',
    'Store in any container. Black Tourmaline is very hardy. Can be stored with other protective stones. Safe in sunlight, moonlight, water, and salt. Cleanse frequently as it absorbs negative energy.',
    'Black Tourmaline is safe to handle and wear. Water safe. Sun safe. Salt safe. Non-toxic. Extremely safe and grounding. One of the safest protection stones for everyone including children and pets nearby.',
    admin_user_id,
    true
),
(
    'Citrine',
    'citrine',
    ARRAY['Success Stone', 'Merchant Stone'],
    'Yellow to Golden',
    ARRAY['running_water', 'smoke', 'sound'],
    ARRAY['sunlight', 'crystal_cluster'],
    'Citrine is a stone of abundance and manifestation. It carries the power of the sun and is energizing and life-giving. It never needs cleansing as it does not hold negative energy. Citrine attracts wealth, prosperity, and success.',
    'Place Citrine in your cash register or wallet, use in manifestation rituals, keep in the wealth corner of your home (far left from entrance), carry for confidence and personal power.',
    true,
    true,
    true,
    'common',
    'Citrine''s name comes from the French word "citron" meaning lemon. Natural citrine is rare; most citrine available today is heat-treated amethyst or smoky quartz. The ancient Greeks carved citrine into rock crystal as early as 300 B.C. Roman priests wore citrine rings. Citrine was popular in Art Deco jewelry in the 1930s. Ancient cultures believed citrine carried the power of the sun. Merchants carried citrine in their cash boxes or registers to attract wealth and prosperity, earning it the nickname "merchant''s stone." Scottish warriors used citrine on weapon handles for protection.',
    'To use Citrine: Place in cash register, wallet, or wealth corner of home (far left from entrance) to attract abundance. Hold during manifestation meditations focusing on goals and prosperity. Wear as jewelry to maintain positive, abundant energy throughout the day. Place on solar plexus chakra to boost confidence and personal power. Keep in workspace to attract success and maintain motivation. Use in sun rituals and prosperity spells. Create abundance grids with citrine as focal point. Never needs cleansing as it doesn''t hold negative energy.',
    'Store in a sunny window if desired - citrine loves sunlight. Can be stored anywhere safely. Does not need protective cloth as it''s quite hard. Can be stored with other stones. Does not need frequent cleansing as it is self-cleansing.',
    'Citrine is safe to handle and wear. Water safe. Sun safe (will not fade). Salt safe. Non-toxic. Very safe stone with positive, uplifting energy. Suitable for everyone. Note: Most citrine is heat-treated amethyst, not natural citrine, but properties remain the same.',
    admin_user_id,
    true
),
(
    'Labradorite',
    'labradorite',
    ARRAY['Spectrolite', 'Rainbow Moonstone (misnamed)'],
    'Gray with iridescent flashes',
    ARRAY['full_moon', 'smoke', 'sound'],
    ARRAY['moonlight', 'crystal_cluster'],
    'Labradorite is a stone of transformation and magic. It enhances intuition, psychic abilities, and connection to the spiritual realm. Labradorite creates a protective shield around the aura, preventing energy leakage and protecting against negative energies.',
    'Use Labradorite in meditation to enhance psychic abilities, carry for protection from negative energy, use during transformation work, place on third eye chakra during spiritual work.',
    true,
    false,
    false,
    'uncommon',
    'Labradorite was first discovered in Labrador, Canada in 1770, though Inuit peoples have known of it for centuries and have legends about it. According to Inuit legend, the Northern Lights were once trapped in rocks along the coast of Labrador. A warrior struck the rocks with his spear, freeing most of the lights into the sky, but some remained trapped in the stone - this became labradorite. It has been used by shamans and mystics throughout history for its protective and mystical properties. Finnish folklore speaks of similar stone with mystical light.',
    'To use Labradorite: Hold during meditation to access higher realms and enhance psychic abilities. Place on third eye chakra to awaken intuition and inner sight. Carry when you need protection from negative energies and energy vampires. Wear as jewelry to maintain auric shield throughout the day. Use in transformation and shadow work rituals. Place in workspace to protect against negative workplace energies. Keep near electronics to reduce EMF exposure. Use during dark moon rituals and magic work.',
    'Store away from direct sunlight to preserve its flash (labradorescence). Keep in soft cloth or padded box as it has perfect cleavage and can break along those planes if dropped. Store with other mystical stones if desired. Room temperature storage recommended.',
    'Labradorite is safe to handle and wear. Water safe (but don''t submerge for extended periods). NOT sun safe - prolonged sun exposure may reduce the flash/iridescence. Not ideal for salt cleansing due to cleavage planes. Non-toxic. Can be delicate due to perfect cleavage - handle with care to avoid dropping.',
    admin_user_id,
    true
),
(
    'Selenite',
    'selenite',
    ARRAY['Satin Spar', 'Gypsum'],
    'White/Clear',
    ARRAY['sound', 'smoke', 'moonlight'],
    ARRAY['moonlight', 'self_cleansing'],
    'Selenite is a calming stone that instills deep peace and is excellent for meditation or spiritual work. It has the unique property of being able to cleanse and charge other crystals. Selenite connects to higher consciousness and facilitates angelic communication.',
    'Use Selenite to cleanse other crystals, place in corners of home for high vibration, use wands to cleanse your aura, meditate with selenite for spiritual connection, place on crown chakra.',
    false,
    true,
    false,
    'common',
    'Selenite is named after Selene, the Greek goddess of the moon, because of its moon-like glow. Ancient Greeks believed it increased and decreased with the moon. Large selenite crystals have been found in the Cave of Crystals in Naica, Mexico - some of the largest crystals ever discovered. Mesopotamians used selenite in their architecture and decoration. It has been used for thousands of years in spiritual practices. Ancient civilizations carved selenite into windows and decorative pieces. It was believed to bring mental clarity and clear thinking.',
    'To use Selenite: Use to cleanse and charge other crystals - place them on a selenite charging plate or wand. Hold during meditation for mental clarity and connection to higher consciousness. Place in corners of room to maintain high vibration and clear energy. Use wands to sweep aura clean. Place on crown chakra to open spiritual connection. Create crystal grids with selenite as the connecting energy. Keep by bedside for peaceful sleep and angelic connection. Use to cleanse sacred space before ritual or ceremony.',
    'NEVER store in water or humid environments as selenite is water-soluble and will deteriorate. Store in dry location in soft cloth or box. Keep away from moisture and humidity. Do not store in bathroom or other damp areas. Handle gently as it is soft and can scratch easily.',
    'Selenite is safe to handle. NOT water safe - will dissolve in water. Sun safe. NOT salt safe. Non-toxic but do not ingest. Very soft (2 on Mohs scale) and can flake - be gentle. Wands can have sharp edges. Never cleanse in water - use smoke, sound, or moonlight only. Keep away from moisture and humidity. Can be brittle and break if dropped.',
    admin_user_id,
    true
),
(
    'Carnelian',
    'carnelian',
    ARRAY['Cornelian', 'Red Chalcedony'],
    'Orange to Red',
    ARRAY['full_moon', 'running_water', 'smoke', 'sound'],
    ARRAY['sunlight', 'moonlight'],
    'Carnelian is a stone of motivation, endurance, and courage. It stimulates creativity and promotes positive life choices. Carnelian restores vitality and motivation, and stimulates creativity. It gives courage, promotes positive life choices, and dispels apathy.',
    'Carry Carnelian for courage and motivation, place on sacral chakra during meditation, use in creativity rituals, wear as jewelry for confidence, place in creative workspace.',
    true,
    true,
    true,
    'common',
    'Carnelian has been used since ancient times, dating back over 4,000 years. Ancient Egyptians called carnelian "the setting sun" and associated it with the goddess Isis. It was worn by Egyptian nobility and used to protect the dead on their journey to the afterlife. The Egyptians also buried carnelian scarabs with mummies. The prophet Muhammad wore a carnelian ring. Ancient Romans used carnelian for signet rings as hot wax wouldn''t stick to it. Warriors wore carnelian for courage and physical power. Napoleon found a carnelian scarab in Egypt and wore it throughout his life.',
    'To use Carnelian: Place on sacral chakra during meditation to boost creativity and passion. Carry when you need motivation, courage, or confidence. Wear as jewelry to maintain vitality and positive energy throughout the day. Place in creative workspace to overcome creative blocks. Use in passion and creativity rituals. Hold during manifestation work to add energy and motivation to intentions. Place near front door to invite abundance and positive energy into home. Use in fire magic and rituals.',
    'Store in any safe container. Carnelian is quite hardy. Can be stored with other energizing stones. Safe in sunlight (may actually benefit from sun energy). Can be stored in soft cloth or with other tumbled stones.',
    'Carnelian is safe to handle and wear. Water safe. Sun safe. Salt safe. Non-toxic. Very safe and stabilizing stone. Suitable for everyone. Energizing but not overwhelming - good for beginners.',
    admin_user_id,
    true
),
(
    'Moonstone',
    'moonstone',
    ARRAY['Selenite (historical)', 'Hecatolite'],
    'White/Cream with blue sheen',
    ARRAY['full_moon', 'running_water', 'smoke'],
    ARRAY['moonlight'],
    'Moonstone is a stone of new beginnings and is strongly connected to the moon and intuition. It enhances psychic abilities and develops clairvoyance. Moonstone calms emotional instability and stress, and stabilizes the emotions, providing calmness.',
    'Use Moonstone in moon rituals, place under pillow for prophetic dreams, wear during full moon, use in fertility magic, carry for emotional balance, meditate with during moon phases.',
    true,
    false,
    true,
    'common',
    'Moonstone has been used in jewelry for millennia, including ancient civilizations of Rome, Greece, and India. Romans believed it was formed from solidified moonlight. In India, moonstone is considered sacred and is believed to bring good fortune. Ancient Rome and Greece associated it with their lunar deities. Art Nouveau jewelers made moonstone very popular in the early 1900s. In India, it was traditional to give moonstone as a wedding gift. Many cultures believed moonstone would bring love and that wearing it would allow you to see your future. Ancient mariners carried it for safe travel.',
    'To use Moonstone: Wear during the full moon to enhance intuition and psychic abilities. Place under pillow to promote prophetic dreams and restful sleep. Hold during meditation to connect with feminine divine energy and inner goddess. Use in moon rituals and esbat celebrations. Place on third eye or crown chakra for spiritual connection. Carry during times of change and new beginnings for emotional support. Wear as jewelry for emotional balance and intuition. Use in fertility and pregnancy rituals. Place in moon water to charge.',
    'Store in moonlight to recharge - especially effective during full moon. Keep in soft cloth to protect from scratches. Can be stored with other moon-associated stones. Avoid prolonged direct sunlight. Room temperature storage is best.',
    'Moonstone is safe to handle and wear. Water safe for short periods. NOT sun safe - can fade in prolonged sunlight. Salt safe but gentle cleansing preferred. Non-toxic. Relatively delicate due to its layered structure - handle with care. Safe energy for everyone including children and pregnancy.',
    admin_user_id,
    true
),
(
    'Obsidian',
    'obsidian',
    ARRAY['Volcanic Glass', 'Nature''s Glass'],
    'Black',
    ARRAY['full_moon', 'running_water', 'smoke', 'sound', 'earth'],
    ARRAY['moonlight', 'earth'],
    'Obsidian is a highly protective stone that forms a shield against negativity. It is a stone of truth, bringing hidden issues to the surface. Obsidian is powerful for grounding and shadow work. It provides deep soul healing and removes energetic blockages.',
    'Use Obsidian in shadow work and deep healing meditation, carry for protection and grounding, use as a scrying mirror, place on root chakra, use in rituals for cutting cords and releasing the past.',
    true,
    true,
    true,
    'common',
    'Obsidian has been used since prehistoric times, dating back to the Stone Age. The name comes from Obsius, a Roman who discovered a similar stone in Ethiopia according to Pliny the Elder. Ancient cultures around the world used obsidian to make cutting tools, arrowheads, and spear points due to its sharp edges when fractured. Ancient Mesoamerican cultures (Aztec, Mayan) used it for mirrors, tools, and ceremonial knives. It was used in ancient surgery due to its incredibly sharp edge - sharper than modern surgical steel. Black mirrors made from obsidian were used for scrying and divination. Ancient shamans worldwide used it for spiritual work.',
    'To use Obsidian: Use in shadow work and deep emotional healing meditation. Hold or place on body to draw out negative emotions and energy. Use as a scrying mirror (polished obsidian) for divination. Carry for protection and grounding. Place at root chakra for deep grounding work. Use in rituals for cutting energetic cords and releasing the past. Keep in workspace for protection from negative energy. Use in shamanic journeying. Place in home for protection. Use with intention and respect as it is a powerful stone.',
    'Store wrapped or in padded box as it can have very sharp edges if chipped. Can be stored with other grounding, protective stones. Safe in sunlight and moonlight. Store at room temperature.',
    'Obsidian is safe to handle but can have VERY SHARP EDGES if chipped or broken - handle carefully. Water safe. Sun safe. Salt safe. Non-toxic. Can be emotionally intense - work slowly with obsidian. Not recommended for beginners or those who are emotionally fragile. Use grounding stones alongside obsidian. Not suitable for children due to sharp edges and intense energy.',
    admin_user_id,
    true
),
(
    'Aventurine',
    'aventurine',
    ARRAY['Green Aventurine', 'Indian Jade'],
    'Green',
    ARRAY['running_water', 'smoke', 'sound'],
    ARRAY['moonlight', 'earth'],
    'Aventurine is known as the "Stone of Opportunity" and is thought to be the luckiest of all crystals. It promotes prosperity, leadership qualities, and decisiveness. Aventurine releases old patterns and habits, allowing for new growth.',
    'Carry Aventurine when gambling or trying your luck, place in your wallet for prosperity, wear during job interviews, use in manifestation rituals for new opportunities.',
    true,
    true,
    true,
    'common',
    'The name Aventurine derives from the Italian "a ventura" meaning "by chance," an apt name for this good luck stone. It was discovered in the 1700s when Venetian glass makers accidentally dropped copper filings into molten glass, creating a sparkling effect they called "aventurine glass." The stone was then named for this glass. Ancient Tibetans used aventurine to decorate statues, believing it would increase their protective powers. Chinese cultures carved figures from aventurine.',
    'Carry in your left pocket to attract wealth and opportunity. Place in your wallet or cash register. Wear during job interviews or important business meetings. Use in prosperity rituals and manifestation work. Place in the wealth corner of your home (far left from entrance). Hold during meditation to release old patterns. Garden with aventurine to encourage plant growth.',
    'Store with other prosperity stones. Can be stored anywhere safely. Aventurine is quite durable.',
    'Aventurine is safe to handle and wear. Water safe. Sun safe. Salt safe. Non-toxic. Very gentle, optimistic energy suitable for everyone including children.',
    admin_user_id,
    true
),
(
    'Fluorite',
    'fluorite',
    ARRAY['Rainbow Fluorite', 'Genius Stone'],
    'Purple/Green/Clear (rainbow)',
    ARRAY['running_water', 'smoke', 'sound'],
    ARRAY['moonlight'],
    'Fluorite is a highly protective stone that helps organize and process information. It increases concentration and helps in decision-making. Fluorite absorbs and neutralizes negative energy and stress. It cleanses and stabilizes the aura.',
    'Keep Fluorite on your desk while studying or working, hold when you need mental clarity, use to cleanse your aura, place in your workspace to maintain organization and focus.',
    true,
    false,
    false,
    'common',
    'Fluorite has been used since ancient times. The ancient Egyptians used fluorite to carve statues and scarabs. The Romans believed drinking from fluorite vessels would prevent drunkenness. In the 18th century, fluorite was powdered for use in water treatment. Its name comes from the Latin "fluere" meaning "to flow" because it melts easily. Ancient Chinese carved fluorite into decorative objects. It was used in the steel industry as flux. Some fluorite glows under UV light (fluorescence is named after fluorite).',
    'Place on desk during study or work for focus and concentration. Hold when making important decisions. Use to cleanse aura by passing the stone through your energy field. Keep in workspace to reduce chaos and increase organization. Use during meditation to enhance mental clarity. Place near computers to reduce electromagnetic stress. Carry when studying for exams or taking tests.',
    'Store away from direct sunlight as some fluorite can fade. Keep in soft cloth as it scratches easily (softer than quartz). NOT water safe for long periods. NOT salt safe. Handle gently.',
    'Fluorite is safe to handle. NOT fully water safe - brief contact okay but don''t submerge. NOT sun safe - will fade. NOT salt safe. Non-toxic but do not make elixirs. Relatively soft and can break - handle carefully.',
    admin_user_id,
    true
),
(
    'Malachite',
    'malachite',
    ARRAY['Green Copper Carbonate'],
    'Green with banding',
    ARRAY['smoke', 'sound'],
    ARRAY['earth'],
    'Malachite is a powerful stone for transformation and protection. It absorbs negative energies and pollutants from the atmosphere and body. Malachite amplifies energies and brings hidden emotions to the surface for transformation and healing.',
    'Use Malachite for deep emotional healing, place on heart chakra, use in transformation rituals, wear for protection (especially for travelers), place in home to absorb negativity.',
    false,
    false,
    false,
    'uncommon',
    'Malachite has been mined for over 4,000 years. Ancient Egyptians used it as early as 3000 BCE, grinding it into powder for eye makeup and paint. Egyptian pharaohs lined their headdresses with malachite believing it helped them rule wisely. The ancient Greeks and Romans wore malachite amulets for protection, especially for children. It was believed to protect against the "evil eye." In the Middle Ages, malachite was worn to protect from black magic and sorcery. Russian czars used malachite extensively in palace decorations.',
    'IMPORTANT: Use tumbled/polished malachite only. Wear as jewelry for protection. Place on heart chakra during emotional healing work (over clothing, not directly on skin for extended periods). Use in transformation rituals during life changes. Place by front door to protect home. Hold during shadow work but work slowly. NOT for elixirs - toxic if ingested. Work with malachite intentionally and with respect.',
    'Store wrapped separately from other stones. Keep dry always. Handle polished pieces only. Store away from children and pets.',
    'CAUTION: Malachite is TOXIC. Use only tumbled/polished pieces. Do NOT use raw malachite. NOT water safe - toxic copper can leach out. NOT for elixirs. Do not ingest dust or particles. Wash hands after handling. Do not use on broken skin. Keep away from children and pets. Pregnant women should avoid. Only use polished pieces for brief periods on body.',
    admin_user_id,
    true
),
(
    'Lapis Lazuli',
    'lapis-lazuli',
    ARRAY['Lapis', 'Blue Stone'],
    'Deep Blue with gold flecks',
    ARRAY['running_water', 'smoke'],
    ARRAY['moonlight'],
    'Lapis Lazuli is a stone of truth, wisdom, and spiritual insight. It encourages self-awareness, self-expression, and reveals inner truth. Lapis stimulates the desire for knowledge and enhances intellectual ability. It has been prized since ancient times.',
    'Wear Lapis Lazuli for truthful communication, place on third eye during meditation, use in wisdom and knowledge work, carry when speaking publicly, use in divination.',
    true,
    false,
    false,
    'uncommon',
    'Lapis Lazuli is one of the oldest spiritual stones known to humanity, used for over 6,000 years. Ancient Sumerians believed lapis contained the souls of deities. In ancient Egypt, lapis was ground into powder for Cleopatra''s eye shadow. It was used in King Tut''s funeral mask and burial ornaments. The stone was worth more than gold in ancient times. Michelangelo ground lapis into powder to create blue paint for his frescoes. In ancient Mesopotamia, lapis was carved into cylinder seals. Buddhist texts describe lapis as precious.',
    'Wear as jewelry near throat or third eye for communication and intuition. Place on third eye chakra during meditation to enhance spiritual insight. Carry when you need to speak truth or important conversations. Use in rituals for wisdom and knowledge. Keep in study area or library. Hold during divination work. Place under pillow for prophetic dreams.',
    'Store away from direct sunlight to preserve deep blue color. Keep in soft cloth. Can be stored with other high-vibration stones.',
    'Lapis Lazuli is safe to handle. Water safe for brief periods (do not soak). NOT sun safe - will fade in prolonged sunlight. NOT salt safe. Contains pyrite (gold flecks) and calcite (white). Non-toxic but do not make direct elixirs. Generally safe for everyone.',
    admin_user_id,
    true
),
(
    'Hematite',
    'hematite',
    ARRAY['Black Diamond', 'Bloodstone (historical)'],
    'Metallic Grey/Black',
    ARRAY['running_water', 'smoke', 'sound', 'earth'],
    ARRAY['sunlight', 'earth'],
    'Hematite is a powerful grounding and protective stone. It strengthens our connection to the earth and provides a feeling of safety and security. Hematite absorbs negative energy and dissolves it. It enhances focus, concentration, and willpower.',
    'Carry Hematite for grounding and protection, hold during meditation to stay present, wear to enhance focus and concentration, place at the four corners of your home for protection.',
    true,
    true,
    true,
    'common',
    'The name comes from the Greek word "haima" meaning blood, because when cut or polished with water, the stone produces a red liquid. Ancient warriors rubbed their bodies with hematite believing it made them invincible in battle. Ancient Romans associated it with Mars, god of war. It was used as a mirror in ancient Turkey around 6000 BCE. Native Americans used hematite as war paint. Ancient Egyptians used it to calm hysteria and anxiety. In crystal healing, it''s said to have been used by ancient civilizations to treat blood disorders.',
    'Carry in pocket or wear as jewelry for grounding throughout the day. Hold during meditation to stay present and focused. Place at the four corners of your home for protection. Keep in workspace to enhance focus and productivity. Use before and after energy work to ground. Hold after anxiety or stress. Place by computer to reduce electromagnetic stress. Use in root chakra work.',
    'Store anywhere safely - hematite is very durable. Can rust if left in water too long, so dry completely if wet. Safe in sun and salt. Store with other grounding stones.',
    'Hematite is safe to handle and wear. Water safe but dry thoroughly (can rust). Sun safe. Salt safe. Non-toxic. Very grounding and safe. Magnetic hematite is man-made and different from natural hematite. People with pacemakers should avoid magnetic hematite.',
    admin_user_id,
    true
),
(
    'Jade',
    'jade',
    ARRAY['Jadeite', 'Nephrite', 'Imperial Jade'],
    'Green (various shades)',
    ARRAY['running_water', 'smoke'],
    ARRAY['moonlight'],
    'Jade is known as the "Dream Stone" and the "Stone of Eternity." It attracts good luck and friendship. Jade stabilizes personality and promotes self-sufficiency. It brings prosperity and helps you to see past self-imposed limitations.',
    'Wear Jade for luck and prosperity, place in wealth corner, carry for wisdom, use in harmony rituals, give as a gift to show friendship, use in dream work.',
    true,
    true,
    true,
    'uncommon',
    'Jade has been treasured for over 7,000 years. Ancient Chinese culture revered jade above all other stones, considering it the "Stone of Heaven." Chinese emperors were buried in jade armor. In ancient China, jade was more valuable than gold. Confucius wrote about jade''s virtues. Maori people of New Zealand prized jade (they call it pounamu or greenstone) and carved it into sacred objects. Ancient Mesoamerican cultures (Maya, Aztec, Olmec) valued jade above all other materials. It was traditionally given to children to protect them.',
    'Wear jade jewelry for luck and protection (traditionally jade bangles or pendants). Place in wealth corner of home. Gift jade to friends to strengthen the relationship. Hold during meditation for wisdom and peace. Place under pillow for insightful dreams. Use in prosperity rituals. Rub jade on third eye for wisdom. Keep in garden to bless plants. Pass down as heirloom.',
    'Store carefully - jade can chip if dropped. Keep in soft cloth. Can be stored with other heart chakra stones. Safe in water briefly. Keep at moderate temperatures.',
    'Jade is safe to handle and wear. Water safe. Sun safe (though prolonged exposure may slightly alter color over time). Salt safe. Non-toxic. Very safe and beneficial stone. Suitable for everyone including children. Jade is cool to the touch.',
    admin_user_id,
    true
),
(
    'Pyrite',
    'pyrite',
    ARRAY['Fool''s Gold', 'Iron Pyrite'],
    'Metallic Gold',
    ARRAY['smoke', 'sound'],
    ARRAY['sunlight'],
    'Pyrite is a powerful protection stone that shields from negative energy. It stimulates the flow of ideas and enhances memory. Pyrite assists in seeing behind facades to what is real. It promotes confidence, assertiveness, and willpower.',
    'Place Pyrite on your desk for focus and confidence, use in manifestation work, carry for protection, place in business or workspace to attract abundance, use to boost willpower.',
    false,
    true,
    false,
    'common',
    'Pyrite''s name comes from the Greek word "pyr" meaning fire because it creates sparks when struck against steel. In ancient Rome, this property made pyrite popular for starting fires. During the California Gold Rush, pyrite fooled many prospectors, earning its nickname "Fool''s Gold." Native Americans used pyrite in amulets and mirrors for shamanic ceremonies. Ancient Greeks used pyrite in jewelry. Victorians used it extensively in jewelry. Ancient Incas polished large slabs of pyrite to make mirrors for divination.',
    'Place on desk or workspace for focus, confidence, and manifesting career goals. Carry for protection and to boost self-confidence. Use in abundance and prosperity rituals. Hold during meditation for willpower and action. Place near front door to protect home. Use in solar plexus chakra work. Keep with important documents or business papers to attract success.',
    'NEVER put in water - pyrite contains sulfur and can create sulfuric acid when wet, which is toxic. Store completely dry in closed container separately from other stones. Keep away from moisture and humidity.',
    'Pyrite is safe to handle when dry. NEVER put in water - creates sulfuric acid and rust which are toxic. NOT water safe. Sun safe. NOT salt safe. Can oxidize and rust in moisture. Keep completely dry. Wash hands after handling. Do not make elixirs. Can have sharp edges.',
    admin_user_id,
    true
),
(
    'Sodalite',
    'sodalite',
    ARRAY['Logic Stone', 'Blue Sodalite'],
    'Blue with white veining',
    ARRAY['running_water', 'smoke'],
    ARRAY['moonlight'],
    'Sodalite brings order and calmness to the mind. It encourages rational thought, objectivity, truth, and intuitive perception. Sodalite helps to verbalize feelings and enhances self-esteem and self-acceptance. It balances logic with intuition.',
    'Use Sodalite when studying or working with logic, wear for clear communication, place on throat chakra, carry during debates or difficult conversations, use to balance emotions with reason.',
    true,
    false,
    true,
    'common',
    'Sodalite was first discovered in Greenland in 1811 but didn''t become popular until large deposits were found in Ontario, Canada in 1891 during a visit by Princess Patricia of Connaught. The princess fell in love with the stone and had it extensively used in decorating Marlborough House in England, earning sodalite the nickname "Princess Blue." It has been used in massive amounts in architecture, particularly in Canada. Ancient cultures likely used sodalite but mistook it for lapis lazuli.',
    'Place on throat or third eye chakra to enhance communication and logic. Wear as jewelry when you need clear communication. Keep on desk during study or work requiring logic and analysis. Hold during difficult conversations. Use in throat chakra work. Carry when you need to balance emotion with reason. Place in meeting rooms or studios.',
    'Store away from prolonged sunlight (can fade slightly). Keep in soft cloth. Can be stored with other communication stones. Keep dry.',
    'Sodalite is safe to handle. Water safe briefly. NOT recommended for prolonged sun exposure (may fade). Salt safe. Non-toxic. Gentle, calming energy suitable for everyone including children.',
    admin_user_id,
    true
),
(
    'Tiger''s Eye',
    'tigers-eye',
    ARRAY['Tiger Eye', 'Gold Tiger''s Eye'],
    'Golden Brown with chatoyancy',
    ARRAY['running_water', 'smoke'],
    ARRAY['sunlight'],
    'Tiger''s Eye is a stone of protection, grounding, and enhancing integrity. It brings good luck and prosperity. Tiger''s Eye helps to accomplish goals, recognizing inner resources and promoting clarity of intention. It balances yin-yang energy.',
    'Carry Tiger''s Eye for courage and protection, wear during important events, use in prosperity magic, place in workspace for focus, use for grounding, hold when making important decisions.',
    true,
    true,
    true,
    'common',
    'Tiger''s Eye has been used as a talisman against curses and ill-wishing since ancient times. Roman soldiers wore tiger''s eye to protect them in battle and to deflect weapons. Ancient Egyptians used it to convey the power of Ra, the sun god. The chatoyancy (cat''s eye effect) resembles a tiger''s eye, hence the name. In Chinese culture, it was believed to bring wealth and protection. Medieval European soldiers carried it for bravery. Some cultures believed it could see all, even through closed doors.',
    'Carry in pocket for protection and courage throughout the day. Wear as jewelry during important meetings or events. Place in business or workspace to attract prosperity and maintain focus. Hold when making important decisions for clarity. Use for solar plexus chakra work to build confidence. Place in car for safe travel. Keep near cash register or wallet for prosperity. Use in grounding meditation.',
    'Store in sunlight occasionally to recharge (loves sun energy). Keep with other protective stones. Can be stored anywhere safely. Very durable.',
    'Tiger''s Eye is safe to handle and wear. Water safe. Sun safe (actually benefits from sun). Salt safe. Non-toxic. Very protective and grounding. Suitable for everyone. The chatoyant (shimmering) effect is natural and beautiful.',
    admin_user_id,
    true
),
(
    'Smoky Quartz',
    'smoky-quartz',
    ARRAY['Smokey Quartz', 'Cairngorm'],
    'Brown to Black transparent',
    ARRAY['running_water', 'smoke', 'sound'],
    ARRAY['moonlight', 'earth'],
    'Smoky Quartz is one of the most efficient grounding and anchoring stones. It gently neutralizes negative vibrations and detoxifies on all levels. Smoky Quartz relieves stress, fear, and brings emotional calmness. It helps to let go of the past.',
    'Use Smoky Quartz for deep grounding, carry to absorb negative energy, place in corners of home for protection, hold after emotional trauma, use in letting go rituals, meditate with for stress relief.',
    true,
    true,
    true,
    'common',
    'Smoky Quartz has been known since ancient times. The ancient Druids considered it sacred and associated it with Hecate, the Greek goddess of magic and the underworld. It was the national gem of Scotland and has been used there since ancient times, particularly in Scottish jewelry and as badges for the Highland clans. The Celts believed smoky quartz had a strong connection to the earth. Ancient Romans used it for signet rings. Its brown color is caused by natural radiation from the earth.',
    'Hold or place at feet for deep grounding after energy work. Carry to absorb negative energy throughout the day. Place in corners of rooms for protection and to absorb negativity. Hold after emotional stress or trauma. Use in root chakra healing. Meditate with for stress relief and anxiety. Use in letting go and release rituals. Place by electronics to absorb electromagnetic stress. Keep bedside for nightmares.',
    'Store in earth occasionally to recharge. Keep with other grounding stones. Very durable and can be stored anywhere. Safe in sunlight (color is stable).',
    'Smoky Quartz is safe to handle. Water safe. Sun safe. Salt safe. Non-toxic. Excellent for beginners - very gentle, grounding energy. Safe for everyone including children. One of the gentlest black/dark stones.',
    admin_user_id,
    true
),
(
    'Aquamarine',
    'aquamarine',
    ARRAY['Beryl'],
    'Light blue to blue-green',
    ARRAY['running_water', 'smoke'],
    ARRAY['moonlight', 'sea_water'],
    'Aquamarine is a stone of courage and calming. It reduces stress and quiets the mind. Aquamarine helps with clear communication and self-expression. It shields the aura and aligns the chakras. Its energy is gentle but powerful like the ocean.',
    'Wear Aquamarine for clear communication, use in throat chakra work, meditate with for calming, carry for courage, use in water magic, place in bath for cleansing.',
    true,
    true,
    true,
    'uncommon',
    'Aquamarine''s name comes from Latin "aqua marina" meaning "water of the sea." Ancient Romans believed it protected sailors and guaranteed safe voyage. The stone was sacred to Neptune/Poseidon. Ancient Greeks and Romans believed aquamarine came from mermaid treasure chests. In medieval times, it was thought to reawaken love in married couples. Aquamarine was believed to counteract the forces of darkness and bring protection. Ancient healers used it for throat and lung ailments. It was a symbol of beauty, honesty, and loyalty.',
    'Wear near throat for communication and self-expression. Hold during meditation for calming energy. Carry when you need courage or calm nerves. Use in throat chakra healing. Place in bath water for cleansing ritual. Use in water magic and moon rituals. Keep near water in home. Give as gift for new beginnings. Place under pillow for peaceful dreams. Hold during public speaking.',
    'Store in moonlight to recharge (loves moon energy). Keep with other water element stones. Can be stored anywhere safely. Relatively hard and durable.',
    'Aquamarine is safe to handle. Water safe (loves water!). Sun safe. Salt safe. Non-toxic. Very gentle, calming energy. Suitable for everyone including children. Pregnancy safe.',
    admin_user_id,
    true
);

END $$;

-- =============================================================================
-- CRYSTAL TO INTENTION RELATIONSHIPS
-- =============================================================================
-- Link crystals to their magical intentions

DO $$
DECLARE
    clear_quartz_id UUID;
    rose_quartz_id UUID;
    amethyst_id UUID;
    black_tourmaline_id UUID;
    citrine_id UUID;
    labradorite_id UUID;
    selenite_id UUID;
    carnelian_id UUID;
    moonstone_id UUID;
    obsidian_id UUID;
    aventurine_id UUID;
    fluorite_id UUID;
    malachite_id UUID;
    lapis_id UUID;
    hematite_id UUID;
    jade_id UUID;
    pyrite_id UUID;
    sodalite_id UUID;
    tigers_eye_id UUID;
    smoky_quartz_id UUID;
    aquamarine_id UUID;
    
    -- Intention IDs
    protection_id UUID;
    love_id UUID;
    healing_id UUID;
    intuition_id UUID;
    prosperity_id UUID;
    cleansing_id UUID;
    grounding_id UUID;
    meditation_id UUID;
    transformation_id UUID;
    courage_id UUID;
    clarity_id UUID;
    psychic_abilities_id UUID;
    self_love_id UUID;
    peace_id UUID;
    confidence_id UUID;
    creativity_id UUID;
    success_id UUID;
    energy_id UUID;
    divination_id UUID;
    banishing_id UUID;
    wisdom_id UUID;
    focus_id UUID;
    dreams_id UUID;
    balance_id UUID;
    growth_id UUID;
    luck_id UUID;
    communication_id UUID;
    
BEGIN
    -- Get crystal IDs
    SELECT id INTO clear_quartz_id FROM crystals WHERE slug = 'clear-quartz';
    SELECT id INTO rose_quartz_id FROM crystals WHERE slug = 'rose-quartz';
    SELECT id INTO amethyst_id FROM crystals WHERE slug = 'amethyst';
    SELECT id INTO black_tourmaline_id FROM crystals WHERE slug = 'black-tourmaline';
    SELECT id INTO citrine_id FROM crystals WHERE slug = 'citrine';
    SELECT id INTO labradorite_id FROM crystals WHERE slug = 'labradorite';
    SELECT id INTO selenite_id FROM crystals WHERE slug = 'selenite';
    SELECT id INTO carnelian_id FROM crystals WHERE slug = 'carnelian';
    SELECT id INTO moonstone_id FROM crystals WHERE slug = 'moonstone';
    SELECT id INTO obsidian_id FROM crystals WHERE slug = 'obsidian';
    
    -- Get intention IDs
    SELECT id INTO protection_id FROM intentions WHERE slug = 'protection';
    SELECT id INTO love_id FROM intentions WHERE slug = 'love';
    SELECT id INTO healing_id FROM intentions WHERE slug = 'healing';
    SELECT id INTO intuition_id FROM intentions WHERE slug = 'intuition';
    SELECT id INTO prosperity_id FROM intentions WHERE slug = 'prosperity';
    SELECT id INTO cleansing_id FROM intentions WHERE slug = 'cleansing';
    SELECT id INTO grounding_id FROM intentions WHERE slug = 'grounding';
    SELECT id INTO meditation_id FROM intentions WHERE slug = 'meditation';
    SELECT id INTO transformation_id FROM intentions WHERE slug = 'transformation';
    SELECT id INTO courage_id FROM intentions WHERE slug = 'courage';
    SELECT id INTO psychic_abilities_id FROM intentions WHERE slug = 'psychic-abilities';
    SELECT id INTO self_love_id FROM intentions WHERE slug = 'self-love';
    SELECT id INTO peace_id FROM intentions WHERE slug = 'peace';
    SELECT id INTO confidence_id FROM intentions WHERE slug = 'confidence';
    SELECT id INTO creativity_id FROM intentions WHERE slug = 'creativity';
    SELECT id INTO success_id FROM intentions WHERE slug = 'success';
    SELECT id INTO energy_id FROM intentions WHERE slug = 'energy';
    SELECT id INTO divination_id FROM intentions WHERE slug = 'divination';
    SELECT id INTO banishing_id FROM intentions WHERE slug = 'banishing';
    SELECT id INTO wisdom_id FROM intentions WHERE slug = 'wisdom';
    SELECT id INTO focus_id FROM intentions WHERE slug = 'focus';
    SELECT id INTO clarity_id FROM intentions WHERE slug = 'clarity';
    SELECT id INTO dreams_id FROM intentions WHERE slug = 'dreams';
    SELECT id INTO balance_id FROM intentions WHERE slug = 'balance';
    SELECT id INTO growth_id FROM intentions WHERE slug = 'growth';
    SELECT id INTO luck_id FROM intentions WHERE slug = 'luck';
    SELECT id INTO communication_id FROM intentions WHERE slug = 'communication';
    
    -- Clear Quartz - Master Healer (works with ALL intentions as amplifier)
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength, notes) VALUES
        ('crystal', clear_quartz_id, healing_id, 'primary', 'Master healer, amplifies all healing work'),
        ('crystal', clear_quartz_id, meditation_id, 'strong', 'Enhances meditation and spiritual connection'),
        ('crystal', clear_quartz_id, clarity_id, 'strong', 'Brings mental clarity and understanding'),
        ('crystal', clear_quartz_id, energy_id, 'strong', 'Amplifies all energy and intentions');
    
    -- Rose Quartz - Love and Heart Healing
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength, notes) VALUES
        ('crystal', rose_quartz_id, love_id, 'primary', 'The ultimate love stone for romantic love'),
        ('crystal', rose_quartz_id, self_love_id, 'primary', 'Essential for self-love and self-acceptance'),
        ('crystal', rose_quartz_id, healing_id, 'strong', 'Heals emotional wounds and heart chakra'),
        ('crystal', rose_quartz_id, peace_id, 'strong', 'Brings peace and calming energy'),
        ('crystal', rose_quartz_id, balance_id, 'moderate', 'Balances emotions');
    
    -- Amethyst - Spirituality and Protection
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength, notes) VALUES
        ('crystal', amethyst_id, intuition_id, 'primary', 'Opens third eye and enhances intuition'),
        ('crystal', amethyst_id, protection_id, 'primary', 'Powerful psychic protection'),
        ('crystal', amethyst_id, meditation_id, 'strong', 'Excellent for deep meditation'),
        ('crystal', amethyst_id, psychic_abilities_id, 'strong', 'Enhances psychic gifts'),
        ('crystal', amethyst_id, wisdom_id, 'strong', 'Brings spiritual wisdom'),
        ('crystal', amethyst_id, cleansing_id, 'moderate', 'Purifies energy'),
        ('crystal', amethyst_id, peace_id, 'moderate', 'Calms the mind');
    
    -- Black Tourmaline - Protection and Grounding
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength, notes) VALUES
        ('crystal', black_tourmaline_id, protection_id, 'primary', 'The most powerful protection stone'),
        ('crystal', black_tourmaline_id, grounding_id, 'primary', 'Grounds to earth energy'),
        ('crystal', black_tourmaline_id, cleansing_id, 'strong', 'Clears negative energy'),
        ('crystal', black_tourmaline_id, banishing_id, 'strong', 'Banishes negativity');
    
    -- Citrine - Abundance and Success
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength, notes) VALUES
        ('crystal', citrine_id, prosperity_id, 'primary', 'The merchant stone for wealth'),
        ('crystal', citrine_id, success_id, 'primary', 'Attracts success in all endeavors'),
        ('crystal', citrine_id, confidence_id, 'strong', 'Boosts self-confidence and personal power'),
        ('crystal', citrine_id, energy_id, 'strong', 'Solar energy and vitality'),
        ('crystal', citrine_id, creativity_id, 'moderate', 'Sparks creativity');
    
    -- Labradorite - Magic and Transformation
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength, notes) VALUES
        ('crystal', labradorite_id, transformation_id, 'primary', 'Stone of transformation and change'),
        ('crystal', labradorite_id, psychic_abilities_id, 'primary', 'Awakens psychic gifts'),
        ('crystal', labradorite_id, intuition_id, 'strong', 'Enhances intuition and inner knowing'),
        ('crystal', labradorite_id, protection_id, 'strong', 'Creates auric shield');
    
    -- Selenite - Cleansing and Higher Consciousness
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength, notes) VALUES
        ('crystal', selenite_id, cleansing_id, 'primary', 'Cleanses spaces and other crystals'),
        ('crystal', selenite_id, meditation_id, 'strong', 'Accesses higher consciousness'),
        ('crystal', selenite_id, peace_id, 'strong', 'Brings deep peace and tranquility'),
        ('crystal', selenite_id, clarity_id, 'moderate', 'Mental clarity and clear vision');
    
    -- Carnelian - Courage and Creativity
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength, notes) VALUES
        ('crystal', carnelian_id, courage_id, 'primary', 'Instills courage and confidence'),
        ('crystal', carnelian_id, creativity_id, 'primary', 'Unlocks creative potential'),
        ('crystal', carnelian_id, confidence_id, 'strong', 'Boosts self-esteem'),
        ('crystal', carnelian_id, energy_id, 'strong', 'Restores vitality');
    
    -- Moonstone - Intuition and New Beginnings
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength, notes) VALUES
        ('crystal', moonstone_id, intuition_id, 'primary', 'Enhances intuition and inner knowing'),
        ('crystal', moonstone_id, dreams_id, 'strong', 'Promotes prophetic dreams'),
        ('crystal', moonstone_id, balance_id, 'strong', 'Balances emotions'),
        ('crystal', moonstone_id, divination_id, 'moderate', 'Aids divination work');
    
    -- Obsidian - Shadow Work and Truth
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength, notes) VALUES
        ('crystal', obsidian_id, protection_id, 'primary', 'Shields against negativity'),
        ('crystal', obsidian_id, grounding_id, 'primary', 'Deep grounding to earth'),
        ('crystal', obsidian_id, transformation_id, 'strong', 'Supports shadow work and deep healing'),
        ('crystal', obsidian_id, cleansing_id, 'strong', 'Removes energetic blockages');
    
    -- Now add relationships for the new crystals
    -- Get new crystal IDs
    SELECT id INTO aventurine_id FROM crystals WHERE slug = 'aventurine';
    SELECT id INTO fluorite_id FROM crystals WHERE slug = 'fluorite';
    SELECT id INTO malachite_id FROM crystals WHERE slug = 'malachite';
    SELECT id INTO lapis_id FROM crystals WHERE slug = 'lapis-lazuli';
    SELECT id INTO hematite_id FROM crystals WHERE slug = 'hematite';
    SELECT id INTO jade_id FROM crystals WHERE slug = 'jade';
    SELECT id INTO pyrite_id FROM crystals WHERE slug = 'pyrite';
    SELECT id INTO sodalite_id FROM crystals WHERE slug = 'sodalite';
    SELECT id INTO tigers_eye_id FROM crystals WHERE slug = 'tigers-eye';
    SELECT id INTO smoky_quartz_id FROM crystals WHERE slug = 'smoky-quartz';
    SELECT id INTO aquamarine_id FROM crystals WHERE slug = 'aquamarine';
    
    -- Aventurine - Luck and Opportunity
    INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength, notes) VALUES
        ('crystal', aventurine_id, luck_id, 'primary', 'The stone of opportunity and good luck'),
        ('crystal', aventurine_id, prosperity_id, 'strong', 'Attracts wealth and abundance'),
        ('crystal', aventurine_id, confidence_id, 'strong', 'Builds self-confidence'),
        ('crystal', aventurine_id, growth_id, 'moderate', 'Encourages personal growth');
        
        -- Fluorite - Focus and Mental Clarity
        INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength, notes) VALUES
            ('crystal', fluorite_id, focus_id, 'primary', 'Excellent for concentration and learning'),
            ('crystal', fluorite_id, clarity_id, 'primary', 'Brings mental clarity'),
            ('crystal', fluorite_id, cleansing_id, 'strong', 'Cleanses aura and energy field'),
            ('crystal', fluorite_id, wisdom_id, 'moderate', 'Aids in processing information');
        
        -- Malachite - Transformation and Healing
        INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength, notes) VALUES
            ('crystal', malachite_id, transformation_id, 'primary', 'Powerful stone for transformation'),
            ('crystal', malachite_id, protection_id, 'strong', 'Absorbs negative energies'),
            ('crystal', malachite_id, healing_id, 'strong', 'Deep emotional healing'),
            ('crystal', malachite_id, courage_id, 'moderate', 'Supports facing fears');
        
        -- Lapis Lazuli - Wisdom and Truth
        INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength, notes) VALUES
            ('crystal', lapis_id, wisdom_id, 'primary', 'Ancient stone of wisdom and knowledge'),
            ('crystal', lapis_id, communication_id, 'strong', 'Enhances truthful communication'),
            ('crystal', lapis_id, intuition_id, 'strong', 'Opens third eye'),
            ('crystal', lapis_id, clarity_id, 'moderate', 'Reveals inner truth');
        
        -- Hematite - Grounding and Strength
        INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength, notes) VALUES
            ('crystal', hematite_id, grounding_id, 'primary', 'One of the most powerful grounding stones'),
            ('crystal', hematite_id, protection_id, 'strong', 'Shields and deflects negativity'),
            ('crystal', hematite_id, courage_id, 'strong', 'Warrior stone for strength'),
            ('crystal', hematite_id, focus_id, 'strong', 'Enhances concentration');
        
        -- Jade - Luck and Harmony
        INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength, notes) VALUES
            ('crystal', jade_id, luck_id, 'primary', 'Traditional good luck stone'),
            ('crystal', jade_id, prosperity_id, 'strong', 'Attracts wealth'),
            ('crystal', jade_id, wisdom_id, 'strong', 'Stone of wisdom and peace'),
            ('crystal', jade_id, balance_id, 'moderate', 'Brings harmony');
        
        -- Pyrite - Manifestation and Confidence
        INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength, notes) VALUES
            ('crystal', pyrite_id, prosperity_id, 'primary', 'Attracts wealth and abundance'),
            ('crystal', pyrite_id, confidence_id, 'primary', 'Boosts willpower and confidence'),
            ('crystal', pyrite_id, protection_id, 'strong', 'Shields from negative energy'),
            ('crystal', pyrite_id, energy_id, 'moderate', 'Stimulates action');
        
        -- Sodalite - Logic and Communication
        INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength, notes) VALUES
            ('crystal', sodalite_id, communication_id, 'primary', 'Enhances clear communication'),
            ('crystal', sodalite_id, clarity_id, 'strong', 'Brings logic and rational thought'),
            ('crystal', sodalite_id, intuition_id, 'moderate', 'Balances logic with intuition'),
            ('crystal', sodalite_id, peace_id, 'moderate', 'Calms the mind');
        
        -- Tiger's Eye - Courage and Protection
        INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength, notes) VALUES
            ('crystal', tigers_eye_id, courage_id, 'primary', 'Ancient warrior stone for bravery'),
            ('crystal', tigers_eye_id, protection_id, 'primary', 'Deflects negative energy'),
            ('crystal', tigers_eye_id, confidence_id, 'strong', 'Builds self-confidence'),
            ('crystal', tigers_eye_id, prosperity_id, 'moderate', 'Attracts abundance');
        
        -- Smoky Quartz - Grounding and Release
        INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength, notes) VALUES
            ('crystal', smoky_quartz_id, grounding_id, 'primary', 'Gentle yet powerful grounding'),
            ('crystal', smoky_quartz_id, protection_id, 'strong', 'Neutralizes negative vibrations'),
            ('crystal', smoky_quartz_id, cleansing_id, 'strong', 'Detoxifies on all levels'),
            ('crystal', smoky_quartz_id, peace_id, 'moderate', 'Relieves stress and fear');
        
        -- Aquamarine - Courage and Calming
        INSERT INTO entity_intentions (entity_type, entity_id, intention_id, strength, notes) VALUES
            ('crystal', aquamarine_id, courage_id, 'primary', 'Stone of courage like the sea'),
            ('crystal', aquamarine_id, communication_id, 'strong', 'Clears throat chakra'),
            ('crystal', aquamarine_id, peace_id, 'strong', 'Calms and soothes'),
            ('crystal', aquamarine_id, clarity_id, 'moderate', 'Clears confusion');

END $$;

-- =============================================================================
-- CRYSTAL TO ELEMENT RELATIONSHIPS
-- =============================================================================
-- Link crystals to their associated elements

DO $$
DECLARE
    clear_quartz_id UUID;
    rose_quartz_id UUID;
    amethyst_id UUID;
    black_tourmaline_id UUID;
    citrine_id UUID;
    labradorite_id UUID;
    selenite_id UUID;
    carnelian_id UUID;
    moonstone_id UUID;
    obsidian_id UUID;
    aventurine_id UUID;
    fluorite_id UUID;
    malachite_id UUID;
    lapis_id UUID;
    hematite_id UUID;
    jade_id UUID;
    pyrite_id UUID;
    sodalite_id UUID;
    tigers_eye_id UUID;
    smoky_quartz_id UUID;
    aquamarine_id UUID;
    
    air_id UUID;
    fire_id UUID;
    water_id UUID;
    earth_id UUID;
    spirit_id UUID;
    
BEGIN
    -- Get crystal IDs
    SELECT id INTO clear_quartz_id FROM crystals WHERE slug = 'clear-quartz';
    SELECT id INTO rose_quartz_id FROM crystals WHERE slug = 'rose-quartz';
    SELECT id INTO amethyst_id FROM crystals WHERE slug = 'amethyst';
    SELECT id INTO black_tourmaline_id FROM crystals WHERE slug = 'black-tourmaline';
    SELECT id INTO citrine_id FROM crystals WHERE slug = 'citrine';
    SELECT id INTO labradorite_id FROM crystals WHERE slug = 'labradorite';
    SELECT id INTO selenite_id FROM crystals WHERE slug = 'selenite';
    SELECT id INTO carnelian_id FROM crystals WHERE slug = 'carnelian';
    SELECT id INTO moonstone_id FROM crystals WHERE slug = 'moonstone';
    SELECT id INTO obsidian_id FROM crystals WHERE slug = 'obsidian';
    SELECT id INTO aventurine_id FROM crystals WHERE slug = 'aventurine';
    SELECT id INTO fluorite_id FROM crystals WHERE slug = 'fluorite';
    SELECT id INTO malachite_id FROM crystals WHERE slug = 'malachite';
    SELECT id INTO lapis_id FROM crystals WHERE slug = 'lapis-lazuli';
    SELECT id INTO hematite_id FROM crystals WHERE slug = 'hematite';
    SELECT id INTO jade_id FROM crystals WHERE slug = 'jade';
    SELECT id INTO pyrite_id FROM crystals WHERE slug = 'pyrite';
    SELECT id INTO sodalite_id FROM crystals WHERE slug = 'sodalite';
    SELECT id INTO tigers_eye_id FROM crystals WHERE slug = 'tigers-eye';
    SELECT id INTO smoky_quartz_id FROM crystals WHERE slug = 'smoky-quartz';
    SELECT id INTO aquamarine_id FROM crystals WHERE slug = 'aquamarine';
    
    -- Get element IDs
    SELECT id INTO air_id FROM elements WHERE slug = 'air';
    SELECT id INTO fire_id FROM elements WHERE slug = 'fire';
    SELECT id INTO water_id FROM elements WHERE slug = 'water';
    SELECT id INTO earth_id FROM elements WHERE slug = 'earth';
    SELECT id INTO spirit_id FROM elements WHERE slug = 'spirit';
    
    -- Link crystals to elements
    INSERT INTO entity_pairings (entity_type_a, entity_id_a, entity_type_b, entity_id_b, pairing_type, purpose, strength) VALUES
        ('crystal', clear_quartz_id, 'element', spirit_id, 'elemental_correspondence', 'Clear Quartz works with all elements, especially Spirit', 'strong'),
        ('crystal', rose_quartz_id, 'element', water_id, 'elemental_correspondence', 'Rose Quartz carries Water energy of emotions and love', 'strong'),
        ('crystal', amethyst_id, 'element', air_id, 'elemental_correspondence', 'Amethyst aligns with Air for mental clarity and spirituality', 'strong'),
        ('crystal', black_tourmaline_id, 'element', earth_id, 'elemental_correspondence', 'Black Tourmaline is deeply grounding Earth energy', 'strong'),
        ('crystal', citrine_id, 'element', fire_id, 'elemental_correspondence', 'Citrine carries Fire energy of the sun', 'strong'),
        ('crystal', labradorite_id, 'element', water_id, 'elemental_correspondence', 'Labradorite flows with Water element and intuition', 'strong'),
        ('crystal', selenite_id, 'element', spirit_id, 'elemental_correspondence', 'Selenite connects to Spirit and higher consciousness', 'strong'),
        ('crystal', carnelian_id, 'element', fire_id, 'elemental_correspondence', 'Carnelian burns with Fire energy and passion', 'strong'),
        ('crystal', moonstone_id, 'element', water_id, 'elemental_correspondence', 'Moonstone flows with Water and lunar tides', 'strong'),
        ('crystal', obsidian_id, 'element', earth_id, 'elemental_correspondence', 'Obsidian grounds with Earth energy', 'strong'),
        -- Add element relationships for new crystals
        ('crystal', aventurine_id, 'element', earth_id, 'elemental_correspondence', 'Aventurine connects to Earth for growth and prosperity', 'strong'),
        ('crystal', fluorite_id, 'element', air_id, 'elemental_correspondence', 'Fluorite aligns with Air for mental clarity', 'strong'),
        ('crystal', malachite_id, 'element', earth_id, 'elemental_correspondence', 'Malachite carries Earth energy and transformation', 'strong'),
        ('crystal', lapis_id, 'element', air_id, 'elemental_correspondence', 'Lapis Lazuli connects to Air and wisdom', 'strong'),
        ('crystal', hematite_id, 'element', earth_id, 'elemental_correspondence', 'Hematite is deeply grounding Earth energy', 'strong'),
        ('crystal', jade_id, 'element', earth_id, 'elemental_correspondence', 'Jade carries Earth energy of harmony and luck', 'strong'),
        ('crystal', pyrite_id, 'element', fire_id, 'elemental_correspondence', 'Pyrite burns with Fire energy and action', 'strong'),
        ('crystal', sodalite_id, 'element', air_id, 'elemental_correspondence', 'Sodalite aligns with Air for communication', 'strong'),
        ('crystal', tigers_eye_id, 'element', fire_id, 'elemental_correspondence', 'Tiger''s Eye carries Fire energy and courage', 'strong'),
        ('crystal', smoky_quartz_id, 'element', earth_id, 'elemental_correspondence', 'Smoky Quartz deeply grounds with Earth', 'strong'),
        ('crystal', aquamarine_id, 'element', water_id, 'elemental_correspondence', 'Aquamarine flows with Water like the ocean', 'strong');

END $$;

-- =============================================================================
-- CRYSTAL PAIRINGS
-- =============================================================================
-- Crystals that work well together

DO $$
DECLARE
    clear_quartz_id UUID;
    rose_quartz_id UUID;
    amethyst_id UUID;
    citrine_id UUID;
    black_tourmaline_id UUID;
    selenite_id UUID;
    
BEGIN
    -- Get crystal IDs
    SELECT id INTO clear_quartz_id FROM crystals WHERE slug = 'clear-quartz';
    SELECT id INTO rose_quartz_id FROM crystals WHERE slug = 'rose-quartz';
    SELECT id INTO amethyst_id FROM crystals WHERE slug = 'amethyst';
    SELECT id INTO citrine_id FROM crystals WHERE slug = 'citrine';
    SELECT id INTO black_tourmaline_id FROM crystals WHERE slug = 'black-tourmaline';
    SELECT id INTO selenite_id FROM crystals WHERE slug = 'selenite';
    
    -- Popular crystal combinations
    INSERT INTO entity_pairings (entity_type_a, entity_id_a, entity_type_b, entity_id_b, pairing_type, purpose, strength) VALUES
        ('crystal', rose_quartz_id, 'crystal', amethyst_id, 'complementary', 'Rose Quartz and Amethyst together for emotional healing and spiritual love', 'strong'),
        ('crystal', citrine_id, 'crystal', clear_quartz_id, 'synergy', 'Citrine with Clear Quartz amplifies manifestation and abundance', 'strong'),
        ('crystal', black_tourmaline_id, 'crystal', clear_quartz_id, 'complementary', 'Black Tourmaline for protection, Clear Quartz to amplify', 'strong'),
        ('crystal', amethyst_id, 'crystal', clear_quartz_id, 'synergy', 'Amethyst and Clear Quartz for enhanced spiritual work', 'strong'),
        ('crystal', selenite_id, 'crystal', black_tourmaline_id, 'complementary', 'Selenite cleanses, Black Tourmaline protects', 'moderate');

END $$;
