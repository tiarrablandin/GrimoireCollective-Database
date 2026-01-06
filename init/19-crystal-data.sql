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
    meta_description, toxicity_warning, ethical_sourcing_notes,
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
        'Clear Quartz crystal for amplification, healing, and manifestation. Master healer stone for all chakras.',
    NULL,
    'Widely available from Brazil, Arkansas, Madagascar. Choose ethically sourced from reputable dealers.',
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
        'Rose Quartz crystal for unconditional love, self-love, and emotional healing. Heart chakra stone.',
    NULL,
    'Commonly from Brazil, Madagascar, South Dakota. Choose fair-trade and ethically sourced.',
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
        'Amethyst crystal for spiritual protection, intuition, and peaceful sleep. Third eye chakra stone.',
    NULL,
    'From Brazil, Uruguay, Zambia. Brazilian is lighter, Uruguayan deeper purple. Choose ethically mined.',
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
        'Black Tourmaline crystal for grounding, protection, and EMF shielding. Root chakra stone.',
    NULL,
    'From Brazil, Africa, Pakistan, USA. Widely available and generally ethically sourced.',
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
        'Citrine crystal for abundance, manifestation, and joy. Solar plexus chakra stone for prosperity.',
    NULL,
    'Natural citrine is rare. Most is heat-treated amethyst from Brazil. Both have same properties.',
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
        'Labradorite crystal for transformation, magic, and psychic protection. Third eye stone.',
    NULL,
    'From Canada (Labrador), Madagascar, Finland. Choose stones with strong flash/labradorescence.',
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
        'Selenite crystal for spiritual cleansing, angelic communication, and charging crystals. Crown chakra.',
    'NEVER put in water - selenite dissolves. Keep in dry environments only.',
    'From Morocco, Mexico, USA. Mexican Cave of Crystals contains massive formations. Choose sustainable.',
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
        'Carnelian crystal for motivation, courage, and creativity. Sacral chakra stone for passion.',
    NULL,
    'From India, Brazil, Uruguay. Avoid artificially heat-treated agate sold as carnelian.',
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
        'Moonstone crystal for intuition, new beginnings, and divine feminine energy. Third eye stone.',
    NULL,
    'From Sri Lanka, India, Madagascar, Myanmar. Sri Lankan (blue sheen) is finest quality.',
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
        'Obsidian crystal for protection, grounding, and shadow work. Root chakra scrying stone.',
    'Sharp edges - handle carefully. Emotionally intense - not for beginners.',
    'Forms near volcanoes. From Mexico, USA, Iceland, Japan. Naturally abundant volcanic glass.',
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
        'Aventurine crystal for luck, opportunity, and prosperity. Heart chakra stone of good fortune.',
    NULL,
    'From India, Brazil, Russia. Widely available. Green aventurine is most common variety.',
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
        'Fluorite crystal for mental clarity, focus, and organization. Third eye and crown chakra stone.',
    NULL,
    'From China, Mexico, UK, USA. Rainbow fluorite is most popular. Widely available.',
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
        'Malachite crystal for transformation, protection, and emotional healing. Heart chakra stone.',
    'Toxic in raw form - do not ingest dust. Use polished only. Wash hands after handling raw.',
    'From Congo, Zambia, Russia. High-quality banded malachite from Congo. Ensure conflict-free sourcing.',
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
        'Lapis Lazuli crystal for truth, wisdom, and spiritual insight. Throat and third eye stone.',
    NULL,
    'From Afghanistan (finest quality), Chile, Russia. Ensure ethical sourcing, especially from Afghanistan.',
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
        'Hematite crystal for grounding, strength, and protection. Root chakra stone for stability.',
    NULL,
    'From Brazil, UK, Australia, USA. Very common. Note: many "hematite" beads are synthetic/magnetic.',
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
        'Jade crystal for harmony, prosperity, and good fortune. Heart chakra stone of abundance.',
    NULL,
    'Nephrite from China, New Zealand. Jadeite from Myanmar (most valuable). Ensure ethical sourcing.',
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
        'Pyrite crystal for manifestation, confidence, and action. Solar plexus stone for willpower.',
    'Can tarnish and create sulfur smell when wet. Not water safe. Wash hands after handling.',
    'From Spain, Peru, USA. Widely available. Fools Gold - iron sulfide mineral.',
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
        'Sodalite crystal for logic, communication, and emotional balance. Throat chakra stone.',
    NULL,
    'From Canada, Brazil, Namibia. Canadian sodalite is known as Princess Blue. Common and affordable.',
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
    'Tigers Eye crystal for courage, protection, and prosperity. Solar plexus stone for confidence.',
    NULL,
    'From South Africa, Australia, India. Golden brown is most common. Blue and red varieties exist.',
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
        'Smoky Quartz crystal for grounding, protection, and stress relief. Root chakra stone.',
    NULL,
    'From Brazil, Madagascar, Switzerland, USA. Natural color from earth radiation. Very common.',
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
        'Aquamarine crystal for courage, calm, and clear communication. Throat chakra stone.',
    NULL,
    'From Brazil, Pakistan, Madagascar, Nigeria. Blue Brazilian is prized. Choose ethically sourced.',
    admin_user_id,
    true
),
(
    'Red Jasper',
    'red-jasper',
    ARRAY['Red Stone', 'Bloodstone of Courage'],
    'Red with patterns',
    ARRAY['running_water', 'smoke', 'earth'],
    ARRAY['sunlight', 'earth'],
    'Red Jasper is a stone of endurance and stamina. It gently stimulates energy and enhances physical strength. Red Jasper brings problems to light and provides insights into difficult situations.',
    'Carry Red Jasper for physical energy and stamina, use in root chakra work, place in workspace for endurance, use for grounding during energy work.',
    true,
    true,
    true,
    'common',
    'Red Jasper has been used since prehistoric times. Ancient Egyptian pharaohs wore red jasper scarabs for protection in the afterlife. Warriors throughout history carried it for courage and protection in battle. The name jasper comes from Greek meaning "spotted stone." It was known as the "rain bringer" in ancient cultures. Medieval Europeans believed it could staunch bleeding and protect against venom.',
    'Carry for physical energy and endurance. Place on root chakra for grounding. Keep in workspace for stamina during long projects. Use in courage and protection rituals. Wear during physical activities. Hold during energy work to stay grounded.',
    'Store anywhere safely. Very durable. Can be stored with other grounding stones.',
    'Red Jasper is safe to handle. Water safe. Sun safe. Salt safe. Non-toxic. Very grounding and stabilizing.',
    'Red Jasper crystal for endurance, stamina, and grounding. Root chakra stone for physical energy.',
    NULL,
    'From India, Brazil, USA, Madagascar. Very common and widely available.',
    admin_user_id,
    true
),
(
    'Amazonite',
    'amazonite',
    ARRAY['Amazon Stone', 'Hope Stone'],
    'Turquoise green',
    ARRAY['running_water', 'smoke', 'sound'],
    ARRAY['moonlight'],
    'Amazonite is a soothing stone that calms the brain and nervous system. It helps you see both sides of a problem and soothes emotional trauma. Amazonite balances masculine and feminine energies.',
    'Use Amazonite for calming anxiety, place on throat for communication, carry for emotional balance, use in truth-seeking work, meditate with for inner peace.',
    true,
    false,
    true,
    'common',
    'Amazonite was named after the Amazon River, though ironically no deposits have been found there. Ancient Egyptians carved scarabs from amazonite. It adorned the gold mask of Tutankhamun. Pre-Columbian South Americans used it in jewelry and religious objects. Ethiopian warriors believed it made them invincible. Ancient texts describe it as a stone of courage and truth.',
    'Hold during meditation for calming. Place on throat chakra for honest communication. Carry when you need emotional balance. Use in stress relief work. Place in bedroom for peaceful sleep. Wear during difficult conversations. Keep near electronics to filter EMF.',
    'Store away from prolonged bright light as color may fade slightly. Keep in soft cloth with other calming stones.',
    'Amazonite is safe to handle. Water safe briefly. NOT sun safe (may fade). Salt safe. Non-toxic. Very calming energy.',
    'Amazonite crystal for calming, communication, and emotional balance. Throat and heart chakra stone.',
    NULL,
    'From Colorado, Russia, Brazil, Madagascar. Colorado produces high-quality amazonite.',
    admin_user_id,
    true
),
(
    'Rhodonite',
    'rhodonite',
    ARRAY['Pink Stone', 'Heart Healer'],
    'Pink with black manganese veining',
    ARRAY['running_water', 'smoke'],
    ARRAY['moonlight'],
    'Rhodonite is an emotional balancer that nurtures love and encourages brotherhood. It stimulates, clears, and activates the heart. Rhodonite helps you achieve your highest potential and heals emotional wounds.',
    'Use Rhodonite for emotional healing, place on heart chakra, carry for self-love work, use in forgiveness rituals, meditate with for inner growth.',
    true,
    true,
    true,
    'common',
    'Rhodonite was first discovered in the Ural Mountains of Russia in the 1790s. The name comes from Greek "rhodon" meaning rose. Russian nobility used it extensively in jewelry and decorative objects. It became Russia''''s national stone. Ancient healers used it for emotional wounds. It has been called the "rescue stone" for its ability to heal emotional trauma.',
    'Place on heart chakra for emotional healing. Carry during times of emotional stress. Use in forgiveness work and releasing resentment. Meditate with for self-love. Wear to heal past wounds. Keep near bed for emotional processing during sleep.',
    'Store with other heart chakra stones. Keep in soft cloth. Can store anywhere safely.',
    'Rhodonite is safe to handle. Water safe. Sun safe. Salt safe. Non-toxic. Gentle, nurturing energy.',
    'Rhodonite crystal for emotional healing, forgiveness, and self-love. Heart chakra stone for compassion.',
    NULL,
    'From Russia (finest), Australia, Brazil, Sweden, USA. Russian rhodonite has deepest pink color.',
    admin_user_id,
    true
),
(
    'Lepidolite',
    'lepidolite',
    ARRAY['Peace Stone', 'Transition Stone'],
    'Purple/lavender with mica shimmer',
    ARRAY['smoke', 'sound'],
    ARRAY['moonlight'],
    'Lepidolite is the stone of transition, containing lithium which is used in anxiety medication. It brings deep emotional healing and reduces stress. Lepidolite aids in overcoming dependencies and encourages independence.',
    'Use Lepidolite for anxiety relief, place under pillow for peaceful sleep, carry during times of change, meditate with for emotional balance, use for addiction recovery support.',
    true,
    false,
    true,
    'common',
    'Lepidolite was discovered in the 18th century. The name comes from Greek "lepidos" meaning scale, referring to its scaly appearance. It contains high amounts of lithium, the same element used in mood-stabilizing medications. Modern crystal healers discovered its calming properties align with its lithium content. It has become essential for anxiety and stress relief work.',
    'Place under pillow for peaceful sleep and to prevent nightmares. Hold during panic attacks or anxiety. Carry during times of transition or change. Use in addiction recovery support work. Meditate with for emotional balance. Keep in stressful environments.',
    'Store away from prolonged sun as it may fade slightly. Keep with other calming stones.',
    'Lepidolite is safe to handle. Water safe briefly. NOT sun safe (may fade). Salt safe. Non-toxic. Extremely calming.',
    'Lepidolite crystal for anxiety relief, stress reduction, and emotional balance. Crown chakra stone.',
    NULL,
    'From Brazil, Madagascar, USA, Russia. Contains natural lithium. Widely available.',
    admin_user_id,
    true
),
(
    'Bloodstone',
    'bloodstone',
    ARRAY['Heliotrope', 'Blood Jasper'],
    'Dark green with red spots',
    ARRAY['running_water', 'smoke'],
    ARRAY['earth'],
    'Bloodstone is an intense healing stone used to cleanse and realign the lower chakras. It grounds and protects, and is said to draw off negative energy. Bloodstone stimulates courage, strength, and vitality.',
    'Carry Bloodstone for courage and strength, use in healing rituals, place on lower chakras, use for grounding, carry for protection during difficult times.',
    true,
    true,
    true,
    'common',
    'Bloodstone has been revered since ancient times. Babylonians used it for amulets and seals. Ancient Egyptians believed it could open doors and break bonds. Christian legend says the red spots are drops of Christ''''s blood that fell on green jasper at the crucifixion. Medieval soldiers carried it to staunch bleeding in battle. It was called the "martyr''''s stone." Roman athletes wore it for physical strength.',
    'Carry for courage and strength. Place on root or sacral chakra for grounding and vitality. Use in healing rituals. Hold during difficult times for resilience. Wear during physical activities. Use in protection magic. Place in first aid kit.',
    'Store with other grounding stones. Very durable. Can store anywhere.',
    'Bloodstone is safe to handle. Water safe. Sun safe. Salt safe. Non-toxic. Strong grounding energy.',
    'Bloodstone crystal for courage, strength, and vitality. Root chakra stone for healing and protection.',
    NULL,
    'From India, Brazil, Australia, USA. Indian bloodstone is considered finest quality.',
    admin_user_id,
    true
),
(
    'Turquoise',
    'turquoise',
    ARRAY['Sky Stone', 'Master Healer Stone'],
    'Blue-green',
    ARRAY['smoke', 'sound'],
    ARRAY['moonlight'],
    'Turquoise is a purification stone that dispels negative energy and clears electromagnetic smog. It promotes self-realization and creative problem solving. Turquoise is a stone of communication and spiritual expansion.',
    'Wear Turquoise for protection, use in throat chakra work, carry for communication, place on altar for spiritual connection, use in Native American inspired ceremonies.',
    false,
    false,
    false,
    'uncommon',
    'Turquoise has been mined for over 6,000 years, making it one of the oldest gemstones. Ancient Egyptians used it as early as 3000 BCE. The name comes from French "pierre turquoise" meaning "Turkish stone." Native Americans have used it for centuries in jewelry and ceremonies. Aztecs and Mayans used turquoise in masks and ritual items. Persian turquoise was traded along the Silk Road. It was believed to change color to warn of danger.',
    'Wear as jewelry for protection and communication. Place on throat chakra for clear expression. Use in spiritual rituals. Carry for safe travel. Place on altar for spiritual connection. Hold during public speaking. Give as gift for protection.',
    'Store away from chemicals, oils, and perfumes. Keep dry. Never use water, salt, or sun. Store separately wrapped.',
    'Turquoise is porous - NOT water safe, NOT sun safe, NOT salt safe. Oils and chemicals can damage it. Very delicate. Safe to wear but handle with care.',
    'Turquoise crystal for protection, communication, and spiritual connection. Throat chakra master healer.',
    'Porous stone - keep away from water, oils, chemicals, salt, and prolonged sun exposure.',
    'From USA (Arizona, New Mexico), Iran (Persian turquoise - finest), China, Mexico. Ensure authentic - many fakes exist.',
    admin_user_id,
    true
),
(
    'Garnet',
    'garnet',
    ARRAY['Pomegranate Stone', 'Warriors Stone'],
    'Deep red',
    ARRAY['running_water', 'smoke'],
    ARRAY['sunlight', 'moonlight'],
    'Garnet is a stone of commitment, revitalizing energy and passion. It balances sex drive and alleviates emotional disharmony. Garnet activates and strengthens survival instinct and brings courage.',
    'Carry Garnet for passion and energy, use in root chakra work, wear for commitment energy, use in sex magic, place under pillow to kindle passion.',
    true,
    true,
    true,
    'common',
    'Garnet has been used since the Bronze Age. Ancient Egyptians used it as inlays in jewelry. The name comes from Latin "granatum" meaning pomegranate seed. Roman soldiers wore garnet amulets for protection in battle. Biblical legend says Noah used a garnet lantern to light the Ark. Medieval travelers carried it as protection against accidents. Ancient Saxons used garnet in jewelry.',
    'Carry for passion, energy, and vitality. Place on root chakra for grounding and energy. Wear to attract or strengthen romantic commitment. Use in sex magic and passion work. Hold during manifesting. Keep in bedroom for passionate energy.',
    'Store with other energizing stones. Very durable. Can store anywhere safely.',
    'Garnet is safe to handle. Water safe. Sun safe. Salt safe. Non-toxic. Energizing but grounding.',
    'Garnet crystal for passion, commitment, and vitality. Root and heart chakra stone for energy.',
    NULL,
    'From India, Sri Lanka, Africa, USA, Brazil. Widely available in various types and colors.',
    admin_user_id,
    true
),
(
    'Peridot',
    'peridot',
    ARRAY['Olivine', 'Evening Emerald'],
    'Olive green',
    ARRAY['running_water', 'smoke'],
    ARRAY['sunlight'],
    'Peridot is a powerful cleanser that releases and neutralizes toxins on all levels. It opens and cleanses the heart chakra. Peridot shows you how to forgive yourself and facilitates looking back to the past without guilt.',
    'Use Peridot for heart healing, carry for prosperity, place on heart chakra, use in forgiveness work, wear to attract abundance and reduce stress.',
    true,
    true,
    true,
    'common',
    'Peridot has been mined for 3,500 years on an island in the Red Sea. Ancient Egyptians called it the "gem of the sun" and believed it became invisible at night. Cleopatra''''s famous emeralds may have been peridots. Crusaders brought it to Europe. Some historians believe peridot adorned the breastplate of Aaron. Hawaiian legends say peridot is the tears of Pele, the volcano goddess.',
    'Place on heart chakra for emotional healing. Carry for prosperity and abundance. Wear to reduce stress and jealousy. Use in forgiveness rituals. Hold during meditation for clarity. Keep in home for protective energy.',
    'Store in sunlight to recharge. Keep with prosperity stones. Can store anywhere safely.',
    'Peridot is safe to handle. Water safe. Sun safe. Salt safe. Non-toxic. Gentle, cleansing energy.',
    'Peridot crystal for healing, prosperity, and forgiveness. Heart chakra stone for abundance.',
    NULL,
    'From Egypt, Myanmar, Pakistan, USA (Arizona). Egyptian peridot is historically significant.',
    admin_user_id,
    true
),
(
    'Kyanite',
    'kyanite',
    ARRAY['Blue Kyanite', 'Alignment Stone'],
    'Blue with white striations',
    ARRAY['self_cleansing'],
    ARRAY['self_cleansing'],
    'Kyanite is excellent for attunement and meditation. It never retains negative energy and never needs cleansing. Kyanite aligns all chakras instantly and provides balance. It encourages speaking one''''s truth.',
    'Use Kyanite for chakra alignment, place on any chakra, use in meditation, carry for clear communication, hold during truth-speaking work.',
    true,
    true,
    true,
    'uncommon',
    'Kyanite was named from Greek "kuanos" meaning deep blue. It has been used in high-temperature ceramics since ancient times. Modern metaphysical use emerged in the late 20th century. Its unique property of never needing cleansing makes it special. It has different hardness depending on direction of the crystal structure.',
    'Use for instant chakra alignment - sweep along body. Never needs cleansing. Place on any chakra. Use in meditation for deep states. Carry for clear communication. Hold during important conversations. Use in grid centers.',
    'Never needs cleansing! Store anywhere. Very unique crystal. Handle with some care as it can be brittle.',
    'Kyanite is safe to handle. Water safe. Sun safe. Salt safe but not needed. Non-toxic. Self-cleansing.',
    'Kyanite crystal for chakra alignment, meditation, and truth. All chakras - never needs cleansing.',
    NULL,
    'From Brazil, Nepal, Switzerland, USA. Blue is most common. Black and orange varieties exist.',
    admin_user_id,
    true
),
(
    'Sunstone',
    'sunstone',
    ARRAY['Heliolite', 'Joy Stone'],
    'Orange/red with metallic sparkle',
    ARRAY['running_water', 'smoke'],
    ARRAY['sunlight'],
    'Sunstone is a joyful stone that instills good nature and heightens intuition. It dissipates fearfulness and alleviates stress. Sunstone increases self-worth, confidence, and optimism. It brings light and energy.',
    'Carry Sunstone for joy and optimism, use in solar magic, place on sacral or solar plexus chakra, wear for confidence, use in depression relief work.',
    true,
    true,
    true,
    'uncommon',
    'Sunstone was used by ancient Greeks as a protective amulet and to bring prosperity. Vikings used it for navigation. Native Americans used it in medicine wheels and ceremonies, associating it with the sun and abundance. Norwegian mythology mentions it as a powerful talisman. Oregon sunstone is the state gemstone of Oregon.',
    'Carry for joy, optimism, and confidence. Place on solar plexus for personal power. Use in seasonal affective disorder relief. Wear during depression. Hold during solar rituals. Keep in sunny spaces. Use in leadership work.',
    'Loves sunlight! Recharge in sun regularly. Store with other solar stones.',
    'Sunstone is safe to handle. Water safe. Sun safe (loves sun!). Salt safe. Non-toxic. Joyful energy.',
    'Sunstone crystal for joy, confidence, and optimism. Sacral and solar plexus stone for vitality.',
    NULL,
    'From Oregon USA (finest), Norway, India, Canada. Oregon sunstone has copper inclusions.',
    admin_user_id,
    true
),
(
    'Shungite',
    'shungite',
    ARRAY['Miracle Stone', 'Stone of Life'],
    'Black with metallic luster',
    ARRAY['running_water'],
    ARRAY['earth'],
    'Shungite is a rare carbon-based stone that shields from electromagnetic frequencies (EMF). It purifies water and detoxifies the body. Shungite grounds spiritual energy and clears negative energy rapidly.',
    'Place Shungite near electronics for EMF protection, use in water purification, carry for grounding, place in corners of room, use for protection from negative energy.',
    true,
    true,
    true,
    'rare',
    'Shungite is found only in Karelia, Russia, and is nearly 2 billion years old. The name comes from the village Shunga where it was discovered. Peter the Great established Russia''''s first spa using shungite water. Scientists discovered shungite contains fullerenes, a unique molecular carbon form. It was used in Russia for water purification for centuries.',
    'Place near computers, phones, WiFi routers for EMF protection. Put in water for purification (noble shungite only). Carry for grounding. Place in four corners of room for protection. Use in grids. Wear for shielding.',
    'Clean frequently under running water as it absorbs negative energy. Very durable. Store anywhere.',
    'Shungite is safe to handle. Water safe (use for water purification!). Sun safe. Salt safe. Non-toxic. Strong protective energy.',
    'Shungite crystal for EMF protection, grounding, and purification. Root chakra stone. Only found in Russia.',
    NULL,
    'ONLY from Karelia, Russia. No other source exists worldwide. Ensure authentic - many fakes. Elite (noble) shungite is 98% carbon.',
    admin_user_id,
    true
),
(
    'Moldavite',
    'moldavite',
    ARRAY['Tektite', 'Star Born Stone'],
    'Deep green glass',
    ARRAY['smoke', 'sound'],
    ARRAY['moonlight'],
    'Moldavite is a powerful tektite formed from a meteorite impact. It accelerates spiritual evolution and aids in rapid transformation. Moldavite can overwhelm sensitive individuals with its intense energy.',
    'Use Moldavite for transformation work, hold during meditation (briefly at first), wear for accelerated spiritual growth, place on third eye or heart, use when ready for major life changes.',
    true,
    false,
    true,
    'rare',
    'Moldavite was formed about 15 million years ago when a meteorite struck the Czech Republic. The name comes from the Moldau River. Ancient people shaped it into tools and ritual objects. It was considered sacred and used as a talisman for fertility and good fortune. Modern discovery of its extraterrestrial origin intensified its metaphysical reputation. It often causes the "moldavite flush" - a warming sensation.',
    'Start slowly with moldavite - it''''s intense! Hold briefly during meditation. Wear for accelerated spiritual growth (be prepared for changes). Place on third eye or heart chakra. Use when you''''re ready for transformation. Pair with grounding stones. Only use when ready for rapid change.',
    'Store wrapped separately - very powerful energy. Keep with grounding stones. Handle with care as it can chip.',
    'Moldavite is safe to handle. Water safe. NOT sun safe (may degrade). Salt safe. Non-toxic but VERY intense energy - start slowly!',
    'Moldavite tektite for transformation, spiritual evolution, and rapid change. Very intense heart and third eye stone.',
    'Extremely intense energy - not for beginners. Can cause "moldavite flush." Use with grounding stones.',
    'ONLY from Czech Republic. Rare and increasingly expensive. Many fakes - ensure authenticity. Limited supply.',
    admin_user_id,
    true
),
(
    'Larimar',
    'larimar',
    ARRAY['Atlantis Stone', 'Dolphin Stone'],
    'Sky blue with white patterns',
    ARRAY['running_water', 'smoke'],
    ARRAY['moonlight'],
    'Larimar is a rare blue stone that radiates tranquility and calms tempers. It cools hot emotions and dissolves energy blockages. Larimar connects to the divine feminine and goddess energy.',
    'Use Larimar for emotional healing, place on throat for clear communication, carry for stress relief, meditate with for connection to divine feminine, use in water magic.',
    true,
    false,
    true,
    'rare',
    'Larimar was discovered in 1916 but wasn''''t recognized until 1974 in the Dominican Republic. The name combines "Larissa" (discoverer''''s daughter) and "mar" (sea in Spanish). It''''s also called the Atlantis Stone, as Edgar Cayce predicted a blue stone with healing powers would be found in the Caribbean. Found only in one small mountain region. Formed by volcanic activity.',
    'Hold for immediate calming. Place on throat chakra for clear communication. Carry during stressful times. Meditate with for connection to divine feminine and water element. Use in throat chakra work. Keep in bedroom for peaceful energy.',
    'Store away from prolonged sun. Keep in soft cloth. Relatively delicate - handle with care.',
    'Larimar is safe to handle. Water safe briefly. NOT sun safe (may fade). Salt safe. Non-toxic. Very calming energy.',
    'Larimar crystal for calming, communication, and divine feminine connection. Throat chakra rare stone from Dominican Republic.',
    NULL,
    'ONLY from Dominican Republic. Very rare. Increasingly expensive. Ensure authentic - many fakes exist.',
    admin_user_id,
    true
),
(
    'Apache Tear',
    'apache-tear',
    ARRAY['Smoky Obsidian', 'Grief Stone'],
    'Black translucent obsidian',
    ARRAY['running_water', 'smoke'],
    ARRAY['earth'],
    'Apache Tear is a form of obsidian that gently grounds and protects while supporting grief work. It absorbs negative energy and provides comfort during difficult times. Apache Tear helps release emotional wounds.',
    'Carry Apache Tear during grief, hold during emotional healing, place on root chakra, use for gentle grounding, carry during difficult transitions.',
    true,
    true,
    true,
    'common',
    'Legend says Apache Tear formed from the tears of Apache women mourning warriors who rode off a cliff rather than be captured by the U.S. Cavalry. The legend states those who possess Apache Tear will never grieve again. Geologically, they are volcanic glass formed from lava. Native Americans have used them in ceremonies and as protective amulets for centuries.',
    'Carry during grief and loss. Hold during emotional healing. Place on root chakra for gentle grounding. Use in grief rituals. Keep during difficult life transitions. Gentler than black obsidian while still protective.',
    'Store with other grounding stones. Very durable. Can store anywhere.',
    'Apache Tear is safe to handle. Water safe. Sun safe. Salt safe. Non-toxic. Gentle protective energy, softer than obsidian.',
    'Apache Tear obsidian for grief, emotional healing, and gentle protection. Root chakra comfort stone.',
    NULL,
    'From Arizona and New Mexico, USA. Formed from volcanic glass. Readily available.',
    admin_user_id,
    true
),
(
    'Chrysocolla',
    'chrysocolla',
    ARRAY['Teaching Stone', 'Goddess Stone'],
    'Blue-green with copper',
    ARRAY['smoke', 'sound'],
    ARRAY['moonlight'],
    'Chrysocolla is a tranquil stone that invokes inner strength. It supports clear communication and enhances personal power. Chrysocolla helps with emotional balance and releasing negative emotions.',
    'Use Chrysocolla for throat chakra work, carry for communication, hold during expression work, use in goddess worship, meditate with for emotional balance.',
    false,
    false,
    false,
    'common',
    'Chrysocolla was called the "wise stone" by ancient cultures. Cleopatra carried it everywhere. Ancient Egyptians used it as paint pigment. Roman Emperor Nero used powdered chrysocolla to cover circus floors. The name comes from Greek "chrysos" (gold) and "kolla" (glue), as it was used in soldering gold. It has been used in jewelry for thousands of years.',
    'Place on throat for communication. Wear for expressing truth. Hold during difficult conversations. Use in teaching and speaking work. Meditate with for emotional calming. Keep near computers for EMF filtering. Use in goddess rituals.',
    'Very delicate! Store carefully wrapped. Keep away from water, chemicals, and harsh conditions.',
    'Chrysocolla is delicate - NOT water safe, NOT sun safe, NOT salt safe. Can be damaged by heat and chemicals. Safe to wear but handle with care.',
    'Chrysocolla crystal for communication, teaching, and emotional balance. Delicate throat chakra stone.',
    'Very soft and fragile - keep away from water, prolonged sun, salt, heat, and chemicals. Handle with care.',
    'From Peru, Chile, Congo, USA (Arizona). Often found with copper. Varies in quality - gem grade is rare.',
    admin_user_id,
    true
),
(
    'Celestite',
    'celestite',
    ARRAY['Celestine', 'Angel Stone'],
    'Pale blue',
    ARRAY['sound', 'smoke'],
    ARRAY['moonlight'],
    'Celestite is a high-vibration stone that connects to angelic realms. It brings deep peace and facilitates dream recall. Celestite helps with clear speech and artistic expression.',
    'Place Celestite on altar for angelic connection, use in bedroom for dream work, meditate with for peace, place on throat or third eye, use in prayer and spiritual work.',
    false,
    false,
    false,
    'common',
    'Celestite was discovered in the 1790s. The name comes from Latin "caelestis" meaning celestial or heavenly, referring to its sky-blue color. It has been used in fireworks to produce red flames. Metaphysical properties were discovered more recently. It''''s often found in geode formations. Ancient texts don''''t mention it due to late discovery.',
    'Place on altar or meditation space for angelic energy. Keep in bedroom for dream recall. Hold during prayer or spiritual work. Place on third eye for intuition. Use in artistic inspiration work. Keep in peaceful spaces - very fragile.',
    'VERY fragile! Store carefully. Keep away from sun, water, and heat. Color will fade in sunlight. Can crumble if dropped.',
    'Celestite is extremely delicate - NOT water safe, NOT sun safe (will fade), NOT salt safe. Can dissolve in water. Very fragile - handle with extreme care.',
    'Celestite crystal for angelic connection, peace, and dreams. Very fragile throat and third eye stone.',
    'Extremely fragile and delicate. Will fade in sunlight. NOT water safe - can dissolve. Handle with great care.',
    'From Madagascar (finest), USA, Mexico, Poland. Often found in geodes. Handle very carefully.',
    admin_user_id,
    true
),
(
    'Unakite',
    'unakite',
    ARRAY['Epidote Granite', 'Vision Stone'],
    'Green and pink mottled',
    ARRAY['running_water', 'smoke'],
    ARRAY['earth'],
    'Unakite gently releases conditions that inhibit spiritual and psychological growth. It balances emotions with spirituality and provides grounded vision. Unakite supports recovery from illness.',
    'Use Unakite for emotional balance, place on heart chakra, carry during recovery, hold during vision work, use in third eye development while staying grounded.',
    true,
    true,
    true,
    'common',
    'Unakite was discovered in the Unaka Mountains of North Carolina, giving it its name. It formed from granite that underwent metamorphosis. It''''s a relatively modern discovery in crystal healing, gaining popularity in the late 20th century. Despite recent metaphysical use, the stone itself is ancient, formed millions of years ago. Native to the U.S. Appalachian region.',
    'Place on heart chakra for emotional and spiritual balance. Carry during illness recovery. Hold during vision work or scrying. Use in third eye development while staying grounded. Meditate with for balanced growth. Keep during pregnancy.',
    'Store anywhere safely. Very durable. Can store with heart stones.',
    'Unakite is safe to handle. Water safe. Sun safe. Salt safe. Non-toxic. Gentle, balanced energy.',
    'Unakite crystal for balance, vision, and recovery. Heart and third eye stone for grounded growth.',
    NULL,
    'From USA (North Carolina, Virginia), South Africa, Brazil, China. Readily available.',
    admin_user_id,
    true
),
(
    'Iolite',
    'iolite',
    ARRAY['Water Sapphire', 'Vikings Compass'],
    'Violet-blue',
    ARRAY['running_water', 'smoke'],
    ARRAY['moonlight', 'starlight'],
    'Iolite activates the third eye and facilitates visualization and intuitive insight. It aids in understanding and releasing causes of addiction. Iolite helps you express your true self.',
    'Use Iolite for third eye activation, carry for intuition, hold during shamanic journey work, wear for vision quests, meditate with for inner vision.',
    true,
    false,
    true,
    'uncommon',
    'Iolite was used by Viking navigators as a polarizing filter to locate the sun on cloudy days, hence "Vikings Compass." The name comes from Greek "ios" meaning violet. Ancient seafarers used it to determine direction. It exhibits strong pleochroism - different colors from different angles. Modern metaphysical use emerged in recent decades.',
    'Hold during meditation for third eye activation. Wear for enhanced intuition. Use in shamanic journey work. Carry during vision quests. Place on third eye during sleep for dream work. Use for finding direction in life.',
    'Store away from prolonged sun. Keep in soft cloth. Relatively durable.',
    'Iolite is safe to handle. Water safe. NOT sun safe (may fade slightly). Salt safe. Non-toxic. Activating energy.',
    'Iolite crystal for intuition, vision, and inner guidance. Third eye stone for shamanic work.',
    NULL,
    'From India, Sri Lanka, Brazil, Madagascar. Also called cordierite. Ensure quality - can be pale.',
    admin_user_id,
    true
),
(
    'Azurite',
    'azurite',
    ARRAY['Stone of Heaven', 'Blue Copper'],
    'Deep azure blue',
    ARRAY['smoke', 'sound'],
    ARRAY['moonlight'],
    'Azurite is a powerful healing stone that facilitates psychic development and spiritual awareness. It cleanses and stimulates the third eye. Azurite helps dissolve mental and emotional blockages.',
    'Use Azurite for third eye work, hold during psychic development, place on brow, use in meditation for insight, carry for mental clarity.',
    false,
    false,
    false,
    'uncommon',
    'Azurite has been mined for thousands of years. Ancient Egyptians used it as a sacred stone and eye makeup. It was called "Stone of Heaven" by Chinese ancients. Renaissance painters ground it for blue pigment. Native Americans used it in ceremonies for spiritual vision. The name comes from Persian "lazhward" meaning blue. It slowly transforms into malachite over time.',
    'Place on third eye for psychic development. Hold during meditation for insight. Use in journeying and vision work. Carry for mental clarity. Keep in sacred space. Use in divination work. Brief use only - intense.',
    'VERY delicate! Store carefully away from heat and moisture. Will slowly turn to malachite. Keep dry and cool.',
    'Azurite is fragile - NOT water safe (can dissolve), NOT sun safe, NOT salt safe. Contains copper. Non-toxic to touch but do not ingest. Very delicate.',
    'Azurite crystal for psychic development, insight, and third eye activation. Delicate and powerful.',
    'Contains copper. NOT water safe - can dissolve. Extremely delicate. Slowly transforms into malachite.',
    'From Morocco, Australia, USA, Chile. Often with malachite. Increasingly rare. Handle with extreme care.',
    admin_user_id,
    true
),
(
    'Chrysoprase',
    'chrysoprase',
    ARRAY['Green Chalcedony', 'Stone of Venus'],
    'Apple green',
    ARRAY['running_water', 'smoke'],
    ARRAY['moonlight'],
    'Chrysoprase promotes love of truth and hope. It induces deep meditation and brings joy. Chrysoprase heals the heart chakra and helps overcome compulsive thoughts and actions.',
    'Use Chrysoprase for heart healing, carry for optimism, place on heart chakra, use in meditation, wear to attract new love, hold during forgiveness work.',
    true,
    false,
    true,
    'uncommon',
    'Chrysoprase was prized by ancient Greeks and Romans. Alexander the Great wore it into battle. Romans used it extensively in jewelry. The name comes from Greek "chrysos" (gold) and "prason" (leek), referring to its golden-green color. It was rediscovered in medieval times. Queen Anne of England owned chrysoprase. It''''s been called the stone of Venus.',
    'Place on heart chakra for deep healing. Carry for joy and optimism. Wear to attract new love. Hold during forgiveness and letting go work. Use in meditation for peace. Keep in bedroom for gentle heart energy.',
    'Store away from prolonged sunlight as color can fade. Keep in soft cloth.',
    'Chrysoprase is safe to handle. Water safe briefly. NOT sun safe (color fades). Salt safe. Non-toxic. Gentle heart energy.',
    'Chrysoprase crystal for joy, heart healing, and optimism. Heart chakra stone of Venus.',
    NULL,
    'From Australia (finest), Poland, Russia, Brazil. Australian is brightest green. Ensure natural color.',
    admin_user_id,
    true
),
(
    'Prehnite',
    'prehnite',
    ARRAY['Grape Jade', 'Healers Stone'],
    'Pale green/yellow',
    ARRAY['running_water', 'smoke'],
    ARRAY['moonlight'],
    'Prehnite enhances precognition and inner knowing. It seals the auric field and calms the environment. Prehnite is protective and connects you to universal energies.',
    'Use Prehnite for lucid dreaming, place in meditation space, carry for protection, hold during energy healing work, use to connect with angels and spirit guides.',
    true,
    false,
    true,
    'uncommon',
    'Prehnite was the first mineral to be named after a person - Colonel Hendrik von Prehn who discovered it in South Africa in 1788. It''''s been called the "healer''''s stone" in modern crystal healing. Ancient use is not documented due to late discovery. It often forms in grape-like clusters. It''''s popular with energy healers and Reiki practitioners.',
    'Keep in meditation space for calming energy. Place under pillow for lucid dreaming and precognition. Hold during energy healing sessions. Carry for auric protection. Use in angel communication. Keep in healing room.',
    'Store anywhere safely. Relatively durable. Keep with other healing stones.',
    'Prehnite is safe to handle. Water safe. NOT sun safe (may fade slightly). Salt safe. Non-toxic. Gentle, protective energy.',
    'Prehnite crystal for precognition, healing, and angelic connection. Heart and solar plexus stone.',
    NULL,
    'From Australia, South Africa, China, Scotland, USA. Readily available. Gem quality is rare.',
    admin_user_id,
    true
),
(
    'Kunzite',
    'kunzite',
    ARRAY['Spodumene', 'Evening Stone'],
    'Pink to lilac',
    ARRAY['running_water', 'smoke'],
    ARRAY['moonlight'],
    'Kunzite is a stone of emotion, connecting the heart to the mind. It encourages self-expression and free creativity. Kunzite clears emotional debris and strengthens love.',
    'Use Kunzite for heart healing, carry for emotional balance, place on heart chakra, use in meditation, wear for self-love work, hold during emotional release.',
    true,
    false,
    true,
    'uncommon',
    'Kunzite was discovered in 1902 in California and named after gemologist George Frederick Kunz. It''''s a relatively modern discovery with no ancient history. Its metaphysical properties align with its gentle pink color. It can fade in sunlight. Best viewed in evening light, hence "evening stone." Popular in Art Deco jewelry.',
    'Place on heart chakra for emotional healing. Hold during meditation for calming. Wear for self-love and emotional balance. Use in anxiety relief. Carry during stressful times. Keep away from sunlight to preserve color.',
    'Store away from sunlight! Color will fade. Keep wrapped in dark cloth. Relatively delicate.',
    'Kunzite is safe to handle. Water safe briefly. NOT sun safe (will fade rapidly!). Salt safe. Non-toxic. Very gentle energy.',
    'Kunzite crystal for heart healing, self-love, and emotional balance. Heart chakra stone - keep from sun.',
    'Color fades rapidly in sunlight - store in darkness. Keep away from prolonged sun exposure.',
    'From Afghanistan (finest), Brazil, USA, Madagascar. Ensure color hasn''''t faded. Naturally pale to medium pink.',
    admin_user_id,
    true
),
(
    'Charoite',
    'charoite',
    ARRAY['Lilac Stone', 'Soul Stone'],
    'Purple with swirling patterns',
    ARRAY['running_water', 'smoke'],
    ARRAY['moonlight'],
    'Charoite is a stone of transformation that overcomes fear. It stimulates inner vision and spiritual insight. Charoite helps release deep-seated fears and provides courage.',
    'Use Charoite for transformation work, place on third eye or crown, carry during major life changes, hold during shadow work, meditate with for deep insight.',
    true,
    false,
    true,
    'rare',
    'Charoite was discovered in 1978 in Siberia, making it one of the newest minerals. It''''s found only near the Chara River in Russia, giving it its name. Due to recent discovery, there is no ancient history. Its striking purple color immediately attracted metaphysical practitioners. The deposit is the only known source in the world. It often contains inclusions of other minerals.',
    'Place on third eye or crown for spiritual vision. Carry during transformation and major life changes. Hold during shadow work and facing fears. Use in meditation for deep insight. Wear for courage. Keep during difficult times.',
    'Store away from prolonged sun. Keep in soft cloth. Can store anywhere safely.',
    'Charoite is safe to handle. Water safe. NOT sun safe (may fade slightly). Salt safe. Non-toxic. Transformative energy.',
    'Charoite crystal for transformation, courage, and overcoming fear. Crown and third eye stone - only from Russia.',
    NULL,
    'ONLY from Sakha Republic, Russia near Chara River. No other source worldwide. Rare and unique.',
    admin_user_id,
    true
),
(
    'Howlite',
    'howlite',
    ARRAY['White Turquoise', 'Calming Stone'],
    'White with grey veining',
    ARRAY['running_water', 'smoke'],
    ARRAY['moonlight'],
    'Howlite is an extremely calming stone. It stills the mind and is excellent for sleep or meditation. Howlite helps formulate ambitions and aids patience.',
    'Place Howlite under pillow for sleep, hold during meditation, carry for patience, use in anger management, meditate with for calming racing thoughts.',
    true,
    false,
    true,
    'common',
    'Howlite was discovered in Nova Scotia in 1868 by Henry How, a Canadian chemist. It''''s a relatively modern discovery with no ancient history. Often dyed to imitate turquoise due to its porous nature. Authentic white howlite has become popular in recent decades for its calming properties. It forms in nodules that resemble cauliflower.',
    'Place under pillow for peaceful, dreamless sleep. Hold during meditation to quiet the mind. Carry for patience and calming anger. Use during insomnia. Keep in stressful environments. Wear to absorb negative energy.',
    'Store anywhere safely. Very durable. Often dyed - ensure you have natural white howlite.',
    'Howlite is safe to handle. Water safe. NOT sun safe if dyed. Salt safe. Non-toxic. Very calming, gentle energy.',
    'Howlite crystal for calming, sleep, and patience. Crown chakra stone for quieting the mind.',
    NULL,
    'From Canada, USA, Germany, Russia. Often dyed to fake turquoise - ensure natural white howlite.',
    admin_user_id,
    true
),
(
    'Jet',
    'jet',
    ARRAY['Black Amber', 'Witches Amber'],
    'Deep black',
    ARRAY['running_water', 'smoke'],
    ARRAY['earth'],
    'Jet is fossilized wood that provides powerful protection. It dispels fearful thoughts and draws out negative energy. Jet is grounding and aids psychic protection.',
    'Carry Jet for protection, use in rituals, wear for psychic shielding, place in corners of home, use in banishing work, traditional mourning stone.',
    true,
    true,
    true,
    'uncommon',
    'Jet has been used since prehistoric times. Roman Britain had a thriving jet industry. Ancient Greeks believed it was compressed water. Jet jewelry was popular in Victorian mourning attire. Ancient amulets were carved from jet for protection. It can be polished to a high shine. Technically not a crystal but fossilized wood from 180 million years ago.',
    'Carry or wear for protection and grounding. Use in protection rituals and spells. Place in corners of home for shielding. Traditional mourning stone - helps process grief. Use in banishing work. Wear for psychic protection.',
    'Store carefully - can be brittle. Keep with protective stones. Warm to touch unlike similar stones.',
    'Jet is safe to handle. Water safe. Sun safe. Salt safe. Non-toxic. Warm to touch. Protective but gentle energy.',
    'Jet (fossilized wood) for protection, grounding, and psychic shielding. Root chakra Victorian mourning stone.',
    NULL,
    'From England (Whitby jet is finest), Spain, USA, Poland. Whitby jet is historical and prized.',
    admin_user_id,
    true
),
(
    'Calcite',
    'calcite',
    ARRAY['Optical Calcite', 'Iceland Spar'],
    'Clear, orange, green, blue, or honey',
    ARRAY['running_water', 'smoke'],
    ARRAY['sunlight', 'moonlight'],
    'Calcite is a powerful amplifier and cleanser of energy. It connects emotions with intellect and enhances memory. Different colors have specific properties but all calcite energizes.',
    'Use Calcite for energy cleansing, place in any room, hold during study, place on chakras (color appropriate), use in grids as amplifier.',
    true,
    true,
    true,
    'common',
    'Calcite has been used throughout history. Viking navigators used Iceland Spar (clear calcite) for navigation due to its optical properties. Ancient Egyptians carved statues from calcite. It shows double refraction - objects appear doubled when viewed through it. The name comes from Latin "calx" meaning lime. One of the most common minerals on Earth.',
    'Place in any space for energy cleansing. Hold during study for memory. Use color-appropriate calcite on corresponding chakras. Place in grids as amplifier. Use orange calcite for creativity, green for heart, blue for communication, honey for confidence.',
    'Store anywhere safely. Very common. Softer stone - can scratch. Dissolves in acidic solutions.',
    'Calcite is safe to handle. Water safe briefly but will eventually dissolve. Sun safe. NOT salt safe. Non-toxic. Energizing.',
    'Calcite crystal for energy amplification, cleansing, and memory. All chakras depending on color.',
    NULL,
    'Worldwide. Very common in many colors. Iceland Spar (clear) from Iceland. Orange from Mexico.',
    admin_user_id,
    true
),
(
    'Angelite',
    'angelite',
    ARRAY['Anhydrite', 'Angel Stone'],
    'Pale blue',
    ARRAY['smoke', 'sound'],
    ARRAY['moonlight'],
    'Angelite facilitates conscious contact with angels. It enhances telepathic communication and psychic awareness. Angelite creates deep peace and tranquility.',
    'Use Angelite for angel communication, place on altar, hold during prayer, place on throat or third eye, use in astral travel, meditate with for peace.',
    false,
    false,
    false,
    'uncommon',
    'Angelite is formed from celestite that has been compressed over millions of years. It was discovered in Peru in 1987 during the Harmonic Convergence, a global meditation event. Modern crystal with no ancient history. The synchronicity of its discovery during a spiritual event added to its mystical reputation. Also called anhydrite geologically.',
    'Place on altar for angelic communication. Hold during prayer and meditation. Place on throat for channeling. Use on third eye for psychic development. Keep in sacred space. Use in astral travel work. Very calming energy.',
    'NEVER use water! Will dissolve and crumble. Store dry and wrapped. Relatively soft and fragile.',
    'Angelite is safe to handle but delicate - absolutely NOT water safe (will dissolve!), NOT sun safe, NOT salt safe. Very fragile. Handle carefully.',
    'Angelite crystal for angelic connection, communication, and peace. Very delicate throat and third eye stone.',
    'Absolutely NOT water safe - will dissolve and be destroyed. Keep completely dry. Very fragile.',
    'From Peru primarily, also Mexico, Germany, UK. Ensure authentic - can crumble easily.',
    admin_user_id,
    true
),
(
    'Rhodochrosite',
    'rhodochrosite',
    ARRAY['Inca Rose', 'Rose of the Inca'],
    'Pink with white banding',
    ARRAY['running_water', 'smoke'],
    ARRAY['moonlight'],
    'Rhodochrosite represents selfless love and compassion. It expands consciousness and integrates new information. Rhodochrosite helps heal emotional wounds and attracts soulmate.',
    'Use Rhodochrosite for heart healing, place on heart chakra, carry for self-love, meditate with for compassion, use in soulmate attraction work.',
    true,
    false,
    true,
    'uncommon',
    'Rhodochrosite was mined by Incas who believed it was the blood of their former rulers turned to stone. The name comes from Greek "rhodon" (rose) and "chroma" (color). Argentina claims it as their national stone. Found in ancient Inca silver mines. Medieval times associated it with love and balance. It forms in distinctive banding patterns.',
    'Place on heart chakra for deep emotional healing. Carry for self-love and self-worth. Meditate with for compassion. Use in soulmate attraction work. Hold during inner child healing. Keep in bedroom for loving energy.',
    'Store away from prolonged sun. Handle with care - can be soft. Keep in soft cloth.',
    'Rhodochrosite is safe to handle. Water safe briefly. NOT sun safe (may fade). Salt safe. Non-toxic. Gentle, loving energy.',
    'Rhodochrosite crystal for self-love, compassion, and soulmate attraction. Heart chakra Inca Rose stone.',
    NULL,
    'From Argentina (finest banded), Peru, USA, South Africa. Argentine rhodochrosite is prized.',
    admin_user_id,
    true
),
(
    'Opal',
    'opal',
    ARRAY['Rainbow Stone', 'Eye Stone'],
    'Iridescent multi-color',
    ARRAY['smoke', 'sound'],
    ARRAY['moonlight'],
    'Opal enhances cosmic consciousness and induces psychic visions. It is absorbent and reflective. Opal amplifies traits and brings characteristics to the surface. Associated with love, passion, and emotional intensity.',
    'Use Opal for emotional healing, wear for passion, place on heart or third eye, use in creativity work, meditate with for visions, carry for joy.',
    false,
    false,
    false,
    'uncommon',
    'Opal has been treasured for thousands of years. Romans called it "opalus" meaning precious stone. Ancient Greeks believed it gave powers of prophecy. Aboriginal legend says opal formed where the rainbow touched earth. Mark Antony desired it, risking banishment to obtain opal for Cleopatra. Shakespeare called it the "queen of gems." Ancient Arabs believed it fell from heaven.',
    'Wear opal for passion and emotional intensity (but know it amplifies all emotions). Place on heart or third eye. Use in creativity and artistic work. Meditate with for psychic visions. Carry for joy and optimism. Use with caution - very powerful emotionally.',
    'Store carefully away from heat and dryness - can crack. Keep slightly moist. Very delicate. Wrap separately.',
    'Opal is very delicate - NOT water safe (can crack), NOT sun safe (can dry and crack), NOT salt safe. Store in slightly humid conditions. Safe to wear but handle very carefully.',
    'Opal crystal for passion, visions, and emotional intensity. Amplifies all emotions - very delicate.',
    'Very delicate - can crack if too dry or if temperature changes rapidly. Store carefully with slight moisture.',
    'From Australia (finest black opal), Ethiopia, Mexico, Brazil. Ensure proper care - very fragile.',
    admin_user_id,
    true
),
(
    'Rutilated Quartz',
    'rutilated-quartz',
    ARRAY['Angel Hair Quartz', 'Venus Hair Stone'],
    'Clear quartz with golden rutile',
    ARRAY['running_water', 'smoke', 'sound'],
    ARRAY['sunlight', 'moonlight'],
    'Rutilated Quartz is an illuminator for the soul. It cleanses and energizes the aura. Rutilated Quartz promotes spiritual growth and helps reach the root of problems.',
    'Use Rutilated Quartz for manifestation, carry for energy boost, place on any chakra, use in grid work, meditate with for insight, hold during problem-solving.',
    true,
    true,
    true,
    'uncommon',
    'Rutilated Quartz has been called "Venus Hair" in ancient times, referencing the Roman goddess. The golden threads are titanium dioxide (rutile) inclusions. Medieval alchemists believed the rutile threads trapped and held divine light. Ancient cultures thought the golden threads were actual angel hair. Each piece is completely unique in its internal pattern.',
    'Carry for energy and vitality. Use in manifestation work - the rutile acts as antenna. Place on any chakra for energizing. Use in crystal grids for amplification. Meditate with for clarity and problem-solving. Wear for protection and energy.',
    'Store anywhere safely. Very durable like regular quartz. Can store with other quartz.',
    'Rutilated Quartz is safe to handle. Water safe. Sun safe. Salt safe. Non-toxic. Energizing and protective.',
    'Rutilated Quartz for manifestation, energy, and spiritual growth. All chakras with golden light within.',
    NULL,
    'From Brazil (finest), Madagascar, Australia, USA. Each piece is unique. Widely available.',
    admin_user_id,
    true
),
(
    'Emerald',
    'emerald',
    ARRAY['Green Beryl', 'Stone of Successful Love'],
    'Deep green',
    ARRAY['running_water', 'smoke'],
    ARRAY['earth', 'moonlight'],
    'Emerald brings loyalty and domestic bliss. It enhances unconditional love and partnership. Emerald opens and nurtures the heart chakra while bringing mental clarity.',
    'Use Emerald for heart healing, wear for love and loyalty, place on heart chakra, use in partnership work, meditate with for heart opening, traditional gift for lovers.',
    true,
    false,
    true,
    'rare',
    'Emerald has been mined for over 4,000 years. Cleopatra passionately collected emeralds. Ancient Egyptians associated them with fertility and rebirth. The name comes from Greek "smaragdos" meaning green stone. Incas worshipped it. Roman emperor Nero viewed gladiator fights through emerald. Emerald tablets were said to contain ancient wisdom. Hermes Trismegistus supposedly inscribed secrets on emerald.',
    'Wear emerald for love, loyalty, and partnership. Place on heart chakra for deep heart healing. Use in relationship work. Traditional stone for engagement and love. Meditate with for opening heart. Keep for successful love energy.',
    'Store carefully wrapped separately. Can be brittle. Keep away from harsh chemicals and ultrasonic cleaners.',
    'Emerald is safe to handle. Water safe briefly. NOT sun safe (prolonged exposure can fade). Salt safe. Non-toxic but expensive - handle carefully.',
    'Emerald crystal for love, loyalty, and successful partnerships. Precious heart chakra beryl stone.',
    NULL,
    'From Colombia (finest), Brazil, Zambia, Afghanistan. Expensive and precious. Ensure authenticity.',
    admin_user_id,
    true
),
(
    'Topaz',
    'topaz',
    ARRAY['Golden Topaz', 'Imperial Topaz'],
    'Golden, blue, or clear',
    ARRAY['running_water', 'smoke'],
    ARRAY['sunlight', 'moonlight'],
    'Topaz promotes truth and forgiveness. It brings joy, generosity, and good health. Topaz aids problem-solving and assists with clarity of intention.',
    'Use Topaz for manifestation (golden), communication (blue), crown work (clear), carry for confidence, place on solar plexus, wear for personal power.',
    true,
    true,
    true,
    'uncommon',
    'Topaz has been known for thousands of years. Ancient Egyptians believed it was colored by Ra, the sun god. The name possibly comes from Sanskrit "tapas" meaning fire. Ancient Greeks believed it gave strength. Romans associated it with Jupiter. Medieval Europeans thought it could dispel enchantments. Imperial topaz (golden) was named for Russian royalty.',
    'Carry golden topaz for manifestation and confidence. Use blue topaz for communication (throat chakra). Wear for personal power and generosity. Place on solar plexus for self-worth. Use in truth-seeking work. Meditate with for clarity.',
    'Store away from prolonged sun as color can fade. Keep wrapped separately. Relatively hard but can chip.',
    'Topaz is safe to handle. Water safe. NOT sun safe (especially pink/golden - will fade). Salt safe. Non-toxic. Energizing.',
    'Topaz crystal for manifestation, truth, and personal power. Solar plexus and throat stone depending on color.',
    NULL,
    'From Brazil, Pakistan, Russia, USA, Nigeria. Imperial topaz from Brazil. Blue topaz is often treated.',
    admin_user_id,
    true
),
(
    'Amber',
    'amber',
    ARRAY['Baltic Amber', 'Fossilized Resin'],
    'Golden yellow to orange',
    ARRAY['smoke', 'sound'],
    ARRAY['sunlight'],
    'Amber is fossilized tree resin, millions of years old. It is a powerful healer and cleanser that draws disease from the body. Amber absorbs negative energy and transmutes it into positive forces that stimulate self-healing.',
    'Wear Amber for protection and healing, use in pain relief work, carry for grounding ancient wisdom, place on solar plexus, use in memory and past life work.',
    false,
    true,
    true,
    'uncommon',
    'Amber has been treasured for over 10,000 years. Ancient Greeks called it "electron" and discovered static electricity through it. Romans believed it protected children. Baltic tribes used it as currency. It was burned as incense in ancient Egypt. Medieval Europeans believed it could cure everything from headaches to heart disease. Amber trade routes existed across Europe. It often contains prehistoric insects and plant matter.',
    'Wear as jewelry for continuous healing energy. Place on areas of pain. Use in past life regression work. Carry for memory enhancement. Keep for connecting to ancient wisdom. Use in protection magic. Burn amber incense for cleansing.',
    'Warm to touch unlike glass or plastic imitations. Store carefully - can be scratched. Keep away from harsh chemicals and perfumes.',
    'Amber is safe to handle. NOT water safe (prolonged exposure damages it). Sun safe. NOT salt safe. Non-toxic. Warm, healing energy.',
    'Amber fossilized resin for healing, protection, and ancient wisdom. Solar plexus stone of the sun.',
    'Not technically a crystal but fossilized resin. Keep away from water and salt. Can be damaged by chemicals.',
    'From Baltic region (finest), Dominican Republic, Mexico, Myanmar. Ensure authentic - many plastics sold as amber.',
    admin_user_id,
    true
),
(
    'Obsidian Black',
    'obsidian-black',
    ARRAY['Volcanic Glass', 'Apache Tear'],
    'Deep black',
    ARRAY['running_water', 'smoke', 'earth'],
    ARRAY['earth', 'moonlight'],
    'Black Obsidian is a powerful protective stone that shields against negativity. It grounds you to earth and brings hidden emotions to the surface for healing. Obsidian is a stone of truth that reveals flaws and weaknesses.',
    'Use Black Obsidian for protection, place at home entry, carry for grounding, use in shadow work, meditate with for truth, scrying tool.',
    true,
    true,
    true,
    'common',
    'Obsidian forms when lava cools rapidly without crystallizing. Ancient cultures worldwide used it for tools, weapons, and mirrors. Aztecs crafted ceremonial knives and mirrors from obsidian. Ancient Egyptians used it for scarabs. Mayans believed obsidian mirrors could reveal the future. It was used for surgical scalpels due to extremely sharp edges.',
    'Place by front door for protection. Carry for grounding and shielding. Use polished obsidian as scrying mirror. Meditate with for shadow work. Cleanse frequently as it absorbs negativity. Handle carefully - can have sharp edges.',
    'Very durable volcanic glass. Store anywhere safely. Cleanse frequently.',
    'Obsidian is safe but can have sharp edges. Water safe. Sun safe. Salt safe. Non-toxic. Strong protective energy.',
    'Black Obsidian volcanic glass for protection, grounding, and truth. Root chakra scrying stone.',
    'Sharp edges possible - handle carefully. Very intense energy for shadow work.',
    'From USA, Mexico, Iceland, Japan. Forms near volcanoes. Widely available.',
    admin_user_id,
    true
),
(
    'Carnelian Red',
    'carnelian-red',
    ARRAY['Sard', 'Cornelian'],
    'Red-orange',
    ARRAY['running_water', 'smoke'],
    ARRAY['sunlight'],
    'Carnelian is a stone of motivation, endurance, and courage. It stimulates creativity and dispels apathy. Carnelian restores vitality and increases fertility. It protects against envy, rage, and resentment.',
    'Carry Carnelian for courage and motivation, place on sacral chakra, use in creativity work, wear for performance confidence, use in fertility magic.',
    true,
    true,
    true,
    'common',
    'Carnelian has been used since ancient times. Egyptians called it "the setting sun" and associated it with Isis. It was one of the stones in the High Priest''s breastplate. Ancient Warriors wore carnelian for courage and physical power. Romans carved signet rings from carnelian. Napoleon discovered a carnelian scarab during his Egyptian campaign. Islamic tradition says Mohammed wore a carnelian ring.',
    'Carry for courage and motivation. Place on sacral chakra for creativity and passion. Wear during performances or public speaking. Use in fertility and sex magic. Keep in workspace for productivity. Hold during manifestation.',
    'Very durable. Can fade in prolonged direct sun. Store with energizing stones.',
    'Carnelian is safe to handle. Water safe. Sun safe (some fading possible). Salt safe. Non-toxic. Energizing, motivating.',
    'Carnelian crystal for motivation, courage, and creativity. Sacral chakra stone for vitality.',
    NULL,
    'From India, Brazil, Uruguay, Madagascar. Indian carnelian is historically prized.',
    admin_user_id,
    true
),
(
    'Selenite White',
    'selenite-white',
    ARRAY['Satin Spar', 'Gypsum'],
    'White translucent',
    ARRAY['self_cleansing', 'sound', 'moonlight'],
    ARRAY['moonlight', 'self_cleansing'],
    'Selenite is a high vibration stone that brings clarity of mind and deep peace. It never needs cleansing and cleanses other crystals. Selenite connects to the divine and angelic realms. It is excellent for meditation and spiritual work.',
    'Use Selenite to cleanse other crystals, place on windowsill, create crystal grids, meditate with for clarity, place under bed for peaceful sleep, use in spiritual connection work.',
    false,
    false,
    false,
    'common',
    'Selenite is named after Selene, Greek goddess of the moon. Ancient Greeks believed it waxed and waned with the moon. Desert roses (selenite formations) were considered sacred. It forms in clay and forms transparent crystals. Used historically for window panes before glass. Self-cleansing property makes it unique.',
    'Place in corners of room for peace. Use to cleanse other crystals by placing them on selenite. Meditate with for spiritual connection. Create grids with selenite wands. Place under pillow for astral travel. Never use water - will dissolve!',
    'Keep completely away from water! Store in dry place. Very soft and brittle. Handle gently.',
    'Selenite is delicate. NOT water safe (will dissolve!). NOT sun safe (can crack). NOT salt safe. Non-toxic. Very high vibration.',
    'Selenite crystal for cleansing, clarity, and spiritual connection. Crown chakra self-cleansing stone.',
    'Will dissolve in water! Very soft and fragile. Never use water or salt for cleansing.',
    'From Morocco, Mexico, USA, Australia. Very abundant. Ensure quality as it can be fibrous.',
    admin_user_id,
    true
),
(
    'Sodalite Blue',
    'sodalite-blue',
    ARRAY['Blue Stone', 'Logic Stone'],
    'Deep blue with white',
    ARRAY['running_water', 'smoke'],
    ARRAY['moonlight'],
    'Sodalite brings order and calmness to the mind. It encourages rational thought, objectivity, and truth. Sodalite enhances self-esteem and self-acceptance. It is excellent for communication and creative expression.',
    'Use Sodalite for throat chakra work, carry for clear communication, meditate with for mental clarity, place on third eye, use in logic and study work.',
    true,
    true,
    true,
    'common',
    'Sodalite was discovered in Greenland in 1811 but became popular after large deposits were found in Canada in 1891. Princess Patricia of Connaught loved sodalite, leading to its use in Canadian architecture. The name comes from its sodium content. Often confused with lapis lazuli. It has been used for ornamental purposes and carvings.',
    'Carry for rational thinking and communication. Place on throat chakra for clear expression. Use during study and mental work. Meditate with for calming the mind. Keep in workspace for objectivity. Wear for self-acceptance.',
    'Durable and easy to care for. Store anywhere safely.',
    'Sodalite is safe to handle. Water safe. Sun safe. Salt safe. Non-toxic. Calming, rational energy.',
    'Sodalite crystal for logic, communication, and mental clarity. Throat and third eye stone.',
    NULL,
    'From Brazil, Canada, India, Namibia. Canadian sodalite is rich blue.',
    admin_user_id,
    true
),
(
    'Moonstone Rainbow',
    'moonstone-rainbow',
    ARRAY['Hecatolite', 'Travelers Stone'],
    'White with rainbow flash',
    ARRAY['smoke', 'sound'],
    ARRAY['moonlight', 'full_moon'],
    'Moonstone is the stone of new beginnings and inner growth. It soothes emotional instability and stress. Moonstone enhances intuition and promotes inspiration. It is strongly connected to the moon and feminine energy.',
    'Use Moonstone during full moon rituals, place under pillow for dreams, carry for travel protection, use in divine feminine work, wear for emotional balance.',
    true,
    false,
    true,
    'common',
    'Moonstone has been revered for millennia. Romans believed it was formed from moonbeams. In India, it is considered sacred and displays the god/goddess within. Ancient cultures used it as a travelers protection stone. Art Nouveau jewelry featured moonstone prominently. It shows adularescence - a floating light effect. Associated with moon goddesses across cultures.',
    'Charge under full moon. Place under pillow for prophetic dreams. Wear for emotional balance. Carry during travel for protection. Use in new moon intention setting. Meditate with during moon phases. Keep for divine feminine connection.',
    'Relatively soft - store carefully. Avoid harsh chemicals. Can fade in prolonged sun.',
    'Moonstone is safe to handle. Water safe briefly. NOT sun safe (may fade). Salt safe. Non-toxic. Gentle lunar energy.',
    'Moonstone crystal for intuition, new beginnings, and divine feminine. Crown and third eye stone.',
    NULL,
    'From India (rainbow), Sri Lanka (blue), Madagascar. Indian moonstone shows strongest flash.',
    admin_user_id,
    true
),
(
    'Fluorite Purple',
    'fluorite-purple',
    ARRAY['Genius Stone', 'Rainbow Fluorite'],
    'Purple with banding',
    ARRAY['running_water', 'smoke', 'sound'],
    ARRAY['moonlight', 'sunlight'],
    'Fluorite is highly protective, especially on a psychic level. It helps you discern when outside influences are at work. Fluorite increases concentration and helps absorb new information. It is excellent for learning and mental clarity.',
    'Use Fluorite for studying, place on desk, carry for mental clarity, use in psychic protection, meditate with for focus, cleanse aura with fluorite.',
    true,
    false,
    true,
    'common',
    'Fluorite has been used since ancient times. Egyptians carved scarabs from fluorite. Romans believed fluorite vessels prevented intoxication. The name comes from Latin "fluere" meaning to flow, as it melts easily. Used in steel industry as flux. Some fluorite glows under UV light - fluorescence is named after this property. Ancient Chinese carved fluorite decorative objects.',
    'Keep on study desk for focus and learning. Hold during meditation for mental clarity. Place in workspace for organization. Use in psychic protection work. Carry when learning new skills. Cleanse electronics with fluorite.',
    'Can fade in strong sun. Store away from heat. Relatively soft - protect from scratches.',
    'Fluorite is safe to handle. Water safe. NOT sun safe (may fade). Salt safe. Non-toxic. Clarifying mental energy.',
    'Fluorite crystal for mental clarity, focus, and psychic protection. Third eye stone for learning.',
    NULL,
    'From China, Mexico, UK, USA. Rainbow fluorite shows multiple colors. Very common.',
    admin_user_id,
    true
),
(
    'Ametrine',
    'ametrine',
    ARRAY['Bolivianite', 'Trystine'],
    'Purple and yellow zones',
    ARRAY['running_water', 'smoke'],
    ARRAY['sunlight', 'moonlight'],
    'Ametrine is a rare natural combination of Amethyst and Citrine in one stone. It harmonizes masculine and feminine energies, intellect and intuition. Ametrine enhances creativity and mental clarity while maintaining spiritual connection. It disperses negativity and tension.',
    'Use Ametrine for balancing work, place on solar plexus or crown, carry for creativity and mental focus, meditate with for spiritual insight, use in manifestation rituals.',
    true,
    true,
    true,
    'rare',
    'Ametrine occurs naturally only in the Anahi Mine in Bolivia. Legend says it was discovered by a Spanish conquistador who received the mine as dowry. The unique geological conditions create zones of amethyst and citrine in one crystal. It combines properties of both stones naturally.',
    'Place on solar plexus for personal power and creativity. Hold during meditation for balanced insight. Carry for mental clarity and spiritual connection. Use in manifestation work. Wear for creativity and decision-making.',
    'Very durable. Store anywhere safely. Sunlight and moonlight both beneficial.',
    'Ametrine is safe to handle. Water safe. Sun safe. Salt safe. Non-toxic. Balanced, harmonious energy.',
    'Ametrine crystal for balance, creativity, and manifestation. Solar plexus and crown chakra stone.',
    NULL,
    'From Bolivia (Anahi Mine - only natural source). Very rare. Most ametrine is natural, unlike citrine.',
    admin_user_id,
    true
),
(
    'Apatite Blue',
    'apatite-blue',
    ARRAY['Neon Blue Apatite', 'Caribbean Apatite'],
    'Neon blue to teal',
    ARRAY['running_water', 'smoke'],
    ARRAY['moonlight'],
    'Blue Apatite is a stone of manifestation and inspiration. It expands knowledge and truth, easing sorrow and apathy. Apatite stimulates intellect and clears confusion. It is excellent for weight loss and suppressing hunger while encouraging healthy eating.',
    'Use Blue Apatite for manifestation, place on throat chakra, carry for motivation, use in weight loss programs, meditate with for clarity and insight.',
    true,
    false,
    true,
    'uncommon',
    'Apatite is named from Greek apatein meaning to deceive because it was often confused with other minerals. It is the defining mineral for 5 on the Mohs scale. Apatite is found in bones and teeth. Ancient cultures used it for tools. Blue apatite from Madagascar is highly prized for its neon color.',
    'Place on throat chakra for clear expression. Carry for motivation and inspiration. Use in manifestation work. Meditate with for insight and clarity. Support for healthy eating habits.',
    'Keep away from prolonged sun which can fade color. Store carefully as relatively soft (5 hardness).',
    'Apatite is safe to handle. Water safe briefly. NOT sun safe (can fade). Salt safe. Non-toxic. Motivating, inspiring energy.',
    'Blue Apatite crystal for manifestation, motivation, and communication. Throat chakra stone.',
    NULL,
    'From Madagascar (finest neon blue), Brazil, Mexico, Myanmar. Madagascar produces the most vibrant blue.',
    admin_user_id,
    true
),
(
    'Bronzite',
    'bronzite',
    ARRAY['Bronze Stone', 'Warrior Stone'],
    'Bronze metallic brown',
    ARRAY['running_water', 'smoke'],
    ARRAY['earth'],
    'Bronzite is a stone of courtesy, protection, and grounding. It repels negative energy and sends it back to sender. Bronzite promotes decisiveness and certainty. It helps overcome indecision and doubt, instilling the courage to take action.',
    'Carry Bronzite for protection and grounding, place in home for shielding, use during decision-making, wear for courage and action, meditate with for certainty.',
    true,
    true,
    true,
    'uncommon',
    'Bronzite is a member of the pyroxene mineral group. It contains iron which creates its metallic bronze sheen. Ancient Romans used bronzite as a protective amulet. Warriors carried it for courage and protection in battle. The name comes from its bronze-like appearance.',
    'Carry for protection and grounding. Hold during decision-making for clarity. Wear for courage and action. Place in home for energy shielding. Use to deflect negativity. Meditate with for certainty.',
    'Very durable. Store anywhere safely. Can store with protection stones.',
    'Bronzite is safe to handle. Water safe. Sun safe. Salt safe. Non-toxic. Protective, grounding energy.',
    'Bronzite crystal for protection, courage, and grounding. Solar plexus and root chakra stone.',
    NULL,
    'From India, USA, South Africa, Austria. Indian bronzite has finest bronze sheen. Common.',
    admin_user_id,
    true
),
(
    'Chrysanthemum Stone',
    'chrysanthemum-stone',
    ARRAY['Flower Stone', 'Stone Chrysanthemum'],
    'Black with white flower patterns',
    ARRAY['running_water', 'smoke'],
    ARRAY['earth', 'moonlight'],
    'Chrysanthemum Stone brings harmony and balance. It inspires and energizes, helping to find joy in life. This stone shows that all things have purpose and that challenges bloom into opportunities. It promotes maturity and helps overcome ignorance and self-centeredness.',
    'Use Chrysanthemum Stone for perspective, display for harmony, meditate with for life purpose, carry for joy and optimism, use in home for balanced energy.',
    true,
    true,
    true,
    'rare',
    'Chrysanthemum Stone formed over 270 million years ago in the Permian Period. The white chrysanthemum patterns are celestite or calcite crystals that formed within black limestone or dolomite. Found primarily in China and Japan where the chrysanthemum is the national flower, symbolizing longevity and perfection. Highly valued in Asian cultures.',
    'Display in home for harmony and balance. Meditate with for understanding life purpose. Carry for joy and perspective. Use when feeling stuck. Contemplate patterns for insight. Excellent for mindfulness practice.',
    'Handle with care. Store away from acids. Relatively delicate as it contains limestone.',
    'Chrysanthemum Stone is safe to handle. Water safe briefly. Sun safe. NOT salt safe (limestone content). Non-toxic. Harmonious energy.',
    'Chrysanthemum Stone for harmony, purpose, and joy. Crown and root chakra stone of balance.',
    NULL,
    'From China, Japan, Canada, USA. Chinese stones have most distinct chrysanthemum patterns. Rare.',
    admin_user_id,
    true
),
(
    'Danburite',
    'danburite',
    ARRAY['Angel Stone', 'Light Crystal'],
    'Clear to pink',
    ARRAY['running_water', 'smoke', 'sound'],
    ARRAY['moonlight', 'crystal_cluster'],
    'Danburite is a highly spiritual stone carrying a very pure vibration. It activates intellect and higher consciousness, connecting to angelic realms. Danburite promotes lucid dreaming and helps achieve deep meditative states. It brings serenity and peace, releasing worry and anxiety.',
    'Use Danburite for meditation, place under pillow for dreams, carry for anxiety relief, hold during spiritual work, use for angelic connection.',
    true,
    false,
    true,
    'uncommon',
    'Danburite was first discovered in Danbury, Connecticut in 1839 and named after the city. It forms in high-temperature environments. Often confused with topaz or quartz due to similar appearance. Metaphysically discovered more recently but highly prized by crystal healers for angelic connections.',
    'Hold during deep meditation for spiritual connection. Place under pillow for lucid dreams. Carry for serenity and anxiety relief. Use for angelic communication. Excellent for spiritual development. Keep in meditation space.',
    'Keep away from prolonged sun. Handle carefully as can be brittle. Store wrapped.',
    'Danburite is safe to handle. Water safe. NOT sun safe (can fade). Salt safe. Non-toxic. High vibrational, peaceful energy.',
    'Danburite crystal for spiritual connection, peace, and angelic communication. Crown and heart chakra stone.',
    NULL,
    'From Mexico, Japan, Myanmar, USA, Russia. Mexican and Japanese danburite are finest quality. Pink from Mexico is rare.',
    admin_user_id,
    true
),
(
    'Desert Rose',
    'desert-rose',
    ARRAY['Sand Rose', 'Selenite Rose', 'Gypsum Rose'],
    'Tan to brown rose formations',
    ARRAY['smoke', 'moonlight'],
    ARRAY['moonlight'],
    'Desert Rose is formed from selenite and sand over thousands of years. It anchors and grounds while helping to access past lives. Desert Rose dissolves limiting programs from childhood and strengthens affirmations of purpose. It enhances mental clarity and intuition.',
    'Use Desert Rose for grounding, place in home for stabilizing energy, meditate with for past life access, carry for mental clarity, use in manifestation work.',
    false,
    false,
    false,
    'uncommon',
    'Desert Rose forms in arid desert environments over thousands to millions of years when water evaporates and gypsum crystallizes with sand grains. Found in desert regions worldwide. Sacred to indigenous peoples of the Sahara. Each formation is unique. Also called sand rose or rose rock.',
    'Display in home for grounding energy. Meditate with for past life exploration. Use for mental clarity and intuition. Hold during affirmation work. Do not get wet - will dissolve. Appreciate as natural art.',
    'Keep completely away from water - will dissolve. Keep away from sun (selenite can crack). Handle gently as fragile. Do not use salt.',
    'Desert Rose is safe to handle when dry. NOT water safe (dissolves). NOT sun safe (cracks). NOT salt safe. Non-toxic. Grounding, stabilizing energy.',
    'Desert Rose for grounding, intuition, and past life access. Root and crown chakra stone.',
    'Keep away from water, sun, and salt. Very delicate - selenite and sand formation.',
    'From Tunisia, Algeria, Mexico, USA (Oklahoma). Saharan desert roses are most prized. Each is unique.',
    admin_user_id,
    true
),
(
    'Morganite',
    'morganite',
    ARRAY['Pink Beryl', 'Rose Beryl'],
    'Pink to peach',
    ARRAY['running_water', 'smoke'],
    ARRAY['moonlight'],
    'Morganite is a stone of divine love and compassion. It brings healing, assurance, and promise. Morganite attracts love into your life and helps maintain it. It activates and cleanses the heart chakra, connecting to divine love. It assists in loving yourself and recognizing unfulfilled emotional needs.',
    'Use Morganite for heart healing, meditate with for self-love, carry to attract love, wear for compassion, place under pillow for emotional healing.',
    true,
    false,
    true,
    'uncommon',
    'Morganite was discovered in Madagascar in 1910 and named after banker J.P. Morgan who was a gem collector. It is the pink variety of beryl, related to emerald and aquamarine. The pink color comes from manganese. Tiffany & Co. gemologist George Kunz named it. Highly prized for engagement rings.',
    'Wear for attracting and maintaining love. Meditate with for heart chakra healing. Carry for self-love and compassion. Place under pillow for emotional healing. Use to connect with divine love. Excellent for relationship work.',
    'Keep away from prolonged sun which can fade color. Store carefully. Generally durable.',
    'Morganite is safe to handle. Water safe. NOT sun safe (can fade). Salt safe. Non-toxic. Loving, compassionate energy.',
    'Morganite crystal for divine love, compassion, and heart healing. Heart chakra stone.',
    NULL,
    'From Brazil, Madagascar, Mozambique, Namibia, USA. Madagascar and Brazil produce finest quality. Can fade in sun.',
    admin_user_id,
    true
),
(
    'Merlinite',
    'merlinite',
    ARRAY['Dendritic Opal', 'Mystic Merlinite'],
    'Black and white swirls',
    ARRAY['smoke', 'sound'],
    ARRAY['moonlight', 'earth'],
    'Merlinite is a stone of duality that attracts magic and good luck. It balances light and dark, conscious and unconscious, masculine and feminine. Merlinite enhances psychic abilities and past life recall. It helps access the spiritual and shamanic realms for transformation.',
    'Use Merlinite for magic work, meditate with for shamanic journeying, carry for luck and psychic development, place in sacred space, use for shadow work.',
    true,
    false,
    true,
    'rare',
    'Merlinite is named after the wizard Merlin due to its magical properties. It is actually a form of dendritic opal or psilomelane. The black and white patterns represent duality and balance. Used by shamans and mystics for accessing other realms. Each stone is unique with different patterns.',
    'Use in magic and ritual work. Meditate with for shamanic journeying. Carry for enhanced psychic abilities. Excellent for shadow work and integration. Place in sacred space. Support for past life exploration. Handle with respect.',
    'Store carefully. Keep away from prolonged sun. Energetically powerful - cleanse regularly.',
    'Merlinite is safe to handle. Water safe briefly. NOT sun safe. Salt safe. Non-toxic. Powerful, magical energy. Use with intention.',
    'Merlinite crystal for magic, psychic abilities, and shamanic work. Third eye and root chakra balance stone.',
    NULL,
    'From New Mexico USA. Rare. Each stone unique. Ensure authentic - many fakes exist.',
    admin_user_id,
    true
),
(
    'Pietersite',
    'pietersite',
    ARRAY['Tempest Stone', 'Eagle''s Eye'],
    'Swirling blue, gold, brown',
    ARRAY['running_water', 'smoke'],
    ARRAY['storm', 'sunlight'],
    'Pietersite is known as the Tempest Stone for its stormy appearance and connection to storm element. It stimulates the third eye and pineal gland, enhancing intuition and spiritual vision. Pietersite dispels illusions, removes beliefs and conditioning imposed by others. It promotes speaking one''s truth with confidence.',
    'Use Pietersite for truth-speaking, meditate with for spiritual insight, carry during transitions, hold for accessing intuition, use in transformation work.',
    true,
    true,
    true,
    'rare',
    'Pietersite was discovered in Namibia in 1962 by Sid Pieters. It is a form of brecciated tiger''s eye with swirling colors. Later found in China. The chaotic, swirling patterns represent the storm element and transformation. Named after its discoverer. Highly prized for metaphysical properties.',
    'Meditate with for third eye activation and visions. Carry during major life transitions. Hold for courage to speak truth. Use for releasing old patterns. Excellent for transformation work. Connect with during storms for power.',
    'Very durable. Store anywhere safely. Storm charging especially powerful.',
    'Pietersite is safe to handle. Water safe. Sun safe. Salt safe. Non-toxic. Powerful, transformative storm energy.',
    'Pietersite crystal for truth, transformation, and spiritual vision. Third eye and solar plexus Tempest Stone.',
    NULL,
    'From Namibia (original), China. Namibian pietersite is rarer and more valuable. Each stone unique. Limited sources.',
    admin_user_id,
    true
),
(
    'Scolecite',
    'scolecite',
    ARRAY['Stone of Peace', 'Inner Peace Stone'],
    'White to clear',
    ARRAY['sound', 'smoke'],
    ARRAY['moonlight'],
    'Scolecite is a stone of deep inner peace and spiritual transformation. It enhances dreams and facilitates lucid dreaming. Scolecite opens and activates the heart chakra, allowing for interdimensional travel during sleep. It awakens the heart and brings deep relaxation.',
    'Use Scolecite for meditation, place under pillow for enhanced dreams, hold for relaxation, use in spiritual work, carry for peace and calm.',
    false,
    false,
    false,
    'uncommon',
    'Scolecite is a zeolite mineral that forms delicate needle-like crystals. The name comes from Greek skolec meaning worm, referring to its tendency to curl when heated. Found in volcanic rock cavities. Recently popular in crystal healing for its high vibration and peaceful energy. Very delicate structure.',
    'Place under pillow for enhanced dreams and lucid dreaming. Hold during meditation for deep peace. Use for spiritual connection. Excellent for insomnia. Keep in bedroom for restful sleep. Handle very gently - extremely fragile.',
    'Extremely fragile - handle with great care. Do not get wet. Keep away from sun. Store wrapped and protected. Very delicate.',
    'Scolecite is safe to handle gently. NOT water safe. NOT sun safe. NOT salt safe. Extremely fragile. High vibrational, peaceful energy.',
    'Scolecite crystal for peace, dreams, and spiritual connection. Heart and crown chakra stone.',
    'Extremely delicate crystal - handle with care. Do not use water, sun, or salt.',
    'From India (finest quality), Iceland, Brazil. Indian scolecite has longest needles. Very fragile - ensure well-protected.',
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
