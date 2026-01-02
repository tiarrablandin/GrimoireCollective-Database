-- =============================================================================
-- GRIMOIRE COLLECTIVE - CANDLE DATA
-- =============================================================================
-- Purpose: Comprehensive candle color data for magical workings
-- Note: This is permanent data, not sample data
-- =============================================================================

-- First, normalize the candles table structure by removing redundant columns
-- These columns are replaced by entity junction tables:
-- - moon_phase → entity_moon_phases
-- - magical_uses → entity_intentions (handled in 21-candle-relationships.sql)
ALTER TABLE candles 
DROP COLUMN IF EXISTS moon_phase,
DROP COLUMN IF EXISTS magical_uses;

-- Expand direction_to_face to accommodate detailed directional instructions
ALTER TABLE candles
ALTER COLUMN direction_to_face TYPE VARCHAR(200);

COMMENT ON TABLE candles IS 'Candle colors and their magical properties. Moon phases linked via entity_moon_phases, magical uses linked via entity_intentions';

DO $$
DECLARE
    admin_user_id UUID;
BEGIN
    SELECT id INTO admin_user_id FROM users WHERE username = 'admin' LIMIT 1;

    RAISE NOTICE '✓ Normalized candles table structure';

-- NOTE: Removed hardcoded fields that now use junction tables:
-- - magical_properties → entity_intentions (see 21-candle-relationships.sql)
-- - element, planet, chakra → entity_planets, entity_chakras (see 21-candle-relationships.sql)
-- - zodiac_signs → entity_zodiac_signs
-- - spell_types → linked via grimoires
-- - pairs_well_with, herb/crystal/oil_combinations → entity_pairings

INSERT INTO candles (
    name, slug, color, day_of_week,
    description, ritual_purposes,
    best_time_to_use, direction_to_face,
    dressing_instructions, burning_instructions, disposal_instructions,
    history, meta_description,
    created_by, is_verified
) VALUES
(
    'White Candle',
    'white-candle',
    'White',
    'Monday',
    'White candles are the most versatile candles in magical practice. They can substitute for any other color and represent purity, truth, and spiritual enlightenment. White is the color of the divine and contains all colors within it.',
    'Perfect for new beginnings, baby blessings, handfastings, peace work, and working with lunar energy.',
    'Full moon, new moon, Monday mornings, or anytime when you need versatile energy. Can be used as substitute for any other candle color.',
    'East for new beginnings, or any direction as white works with all directions',
    'Dress from center outward for drawing energy, or from ends to center for banishing. Anoint with blessing oil, protection oil, or leave plain for purity.',
    'Always burn in a fire-safe holder. Never leave unattended. Allow to burn completely if possible, or pinch out (don''t blow out) to preserve the energy.',
    'Bury candle remains in your garden for blessings, or dispose in running water for purification. For banishing work, dispose away from your property.',
    'White candles have been used since ancient times to represent purity and divine light. In many religious traditions, white symbolizes the sacred and holy. Ancient Romans used white candles in ceremonies honoring Vesta, goddess of hearth and home. Christianity adopted white candles for baptisms, communions, and representing Christ''s purity. In magical practice, white has always been considered the universal color containing all others, making it the most versatile candle color. White candles were traditionally made from beeswax, considered the purest form.',
    'White candles for purity, protection, healing, and meditation. Versatile substitute for any color. Essential for moon magic and spiritual work.',
    admin_user_id,
    true
),
(
    'Black Candle',
    'black-candle',
    'Black',
    'Saturday',
    'Black candles are powerful for protection and banishing work. They absorb negative energy and are used in binding spells. Contrary to popular belief, black candles are not "evil" - they are protective and used to remove obstacles.',
    'Ideal for Samhain, dark moon rituals, banishing ceremonies, and working with Crone goddesses.',
    'Dark moon, Saturday nights, midnight hours, or during waning moon for banishing work.',
    'North for grounding and stability, West for emotional banishing',
    'Dress from ends to center to draw out negativity, or carve symbols of what you want to banish. Anoint with protection oils.',
    'Always burn with clear intention. Visualize negativity being absorbed into the flame. Dispose of remains away from your home after banishing work.',
    'After banishing or binding work, dispose of remains at a crossroads or in running water away from home. Never keep remains of black candle banishing work.',
    'Black candles have been used in protection magic throughout history. In folk magic traditions, black was used to absorb illness and misfortune. European folk witches used black candles to bind harmful people and break curses. Saturn, the ruling planet of black, was invoked for protection and justice. In hoodoo tradition, black candles are used to reverse hexes and return negative energy to its sender. The misconception that black candles are "evil" comes from Hollywood and has no basis in actual magical practice. Black represents the void from which all creation comes and the rest between cycles.',
    'Black candles for protection, banishing negativity, binding, and breaking hexes. Powerful Saturn energy for justice and obstacle removal.',
    admin_user_id,
    true
),
(
    'Red Candle',
    'red-candle',
    'Red',
    'Tuesday',
    'Red candles are used for passion, courage, and vital energy. They represent the life force and are powerful for love magic, especially passionate love. Red brings strength and motivation.',
    'Perfect for Beltane, working with fire energy, love magic, and energizing any spell.',
    'Tuesdays, sunrise, during waxing moon for drawing love, full moon for passion, or when Mars is prominent.',
    'South for fire energy and passion, East for new passionate beginnings',
    'Dress away from you for sending passionate energy outward, toward you for drawing love in. Anoint with rose oil, cinnamon, or dragon''s blood.',
    'Red candles burn hot and fast. Use fire-safe holders. Excellent for quick, powerful spells. The faster it burns, the faster results manifest.',
    'Bury remains in earth near your home for lasting love. For passion spells, scatter to the winds. Red wax can be kept as a love talisman.',
    'Red candles have been used in love and passion magic since ancient times. Romans burned red candles in ceremonies honoring Venus and Mars. In ancient Greece, red was sacred to Aphrodite and Ares. Red has always represented life force, blood, and vital energy across cultures. In Chinese tradition, red symbolizes good fortune, joy, and celebration. Medieval love magic heavily featured red candles for drawing passionate love. Mars, the ruling planet, lends red candles warrior energy for courage and strength. Red candles have been central to Beltane fire festivals celebrating fertility and life force.',
    'Red candles for passionate love, courage, strength, and vitality. Mars energy for power and motivation. Essential for Beltane and fire magic.',
    admin_user_id,
    true
),
(
    'Pink Candle',
    'pink-candle',
    'Pink',
    'Friday',
    'Pink candles represent gentle love, compassion, and emotional healing. They are used for romantic love, self-love work, friendship, and healing emotional wounds. Pink is softer than red, perfect for tender matters of the heart.',
    'Ideal for love spells, self-care rituals, healing broken hearts, and attracting gentle romance.',
    'Fridays, during waxing moon for attracting love, Venus hours, or anytime for self-love work.',
    'East for new love, West for emotional healing',
    'Dress toward you to draw love, away from you to send loving energy to others. Anoint with rose oil or self-love blends.',
    'Pink candles create gentle, nurturing energy. Allow them to burn in a calm, peaceful setting. Perfect for bath rituals and self-care.',
    'Keep pink candle remains near your heart chakra area or in your bedroom. Can be buried in a rose garden for ongoing love energy.',
    'Pink candles emerged as a gentler alternative to red for love magic. While red represents passionate, sexual love, pink embodies romantic, tender affection and emotional connection. Victorian era popularized pink for expressing gentle romantic feelings. Venus, ruling planet of pink, governs love, beauty, and harmony. In color magic, pink was developed for working specifically with the heart chakra and emotional healing. Modern Wicca and witchcraft extensively use pink for self-love and self-care work, recognizing that loving oneself is foundational to all other love. Pink candles have become essential in healing trauma and emotional wounds.',
    'Pink candles for gentle love, self-love, emotional healing, and compassion. Venus energy for romance and friendship.',
    admin_user_id,
    true
),
(
    'Green Candle',
    'green-candle',
    'Green',
    'Friday',
    'Green candles are used for prosperity, abundance, and growth. They attract money, promote healing, and represent the fertile Earth. Green brings luck and success in financial matters.',
    'Perfect for prosperity rituals, business blessing, garden magic, and healing work.',
    'Fridays, Thursdays for business, during waxing moon, or when planting/harvesting.',
    'North for Earth energy and stability',
    'Dress toward you to draw money and abundance in. Anoint with prosperity oils, cinnamon, basil, or mint.',
    'Green candles work well with coins, dollar bills, or bay leaves carved with dollar amounts. Burn during waxing moon for growth.',
    'Bury green candle remains in your garden or near your home for lasting prosperity. Can place near cash register or business entrance.',
    'Green candles have long been associated with Earth''s fertility and abundance. Ancient agricultural societies recognized green as the color of growth and harvest. In folk magic, green was used to ensure good crops and financial success. During the Renaissance, green became associated with merchant success and trade prosperity. In American hoodoo and conjure traditions, green candles dressed with specific oils became central to money-drawing work. The association of green with money is particularly strong in America due to green currency. Green also represents the heart chakra, connecting prosperity consciousness with heart-centered abundance.',
    'Green candles for prosperity, abundance, money, growth, fertility, and luck. Venus and Earth energy for financial success.',
    admin_user_id,
    true
),
(
    'Blue Candle',
    'blue-candle',
    'Blue',
    'Monday',
    'Blue candles bring peace, healing, and truth. They enhance communication, promote wisdom, and provide gentle protection. Blue is calming and associated with water and sky.',
    'Ideal for healing ceremonies, peaceful meditation, truth-seeking work, and communication enhancement.',
    'Mondays, during waning moon for peace, full moon for healing, or anytime for truth work.',
    'West for water energy and emotional healing',
    'Dress from center outward for spreading peace, toward you for healing. Anoint with lavender, chamomile, or peace blend oils.',
    'Blue candles create peaceful, calming energy. Perfect for meditation spaces. Burn for healing work or when seeking truth and clarity.',
    'Return blue candle remains to water (ocean, river, or flush with intention). Can save wax for future healing work.',
    'Blue candles have been used for healing and peace since ancient times. In ancient Egypt, blue was the color of the sky goddess Nut and the Nile''s life-giving water. Ancient Greeks associated blue with Zeus and the heavens. Blue lapis lazuli was prized for spiritual work and communication with divine. In Christian tradition, blue represents Virgin Mary and heavenly grace. Folk magic used blue for healing and protection, particularly for children. Blue candles became associated with throat chakra work for truthful communication. In magical practice, blue is considered gentle yet powerful for healing, protection, and finding truth.',
    'Blue candles for peace, healing, truth, communication, and wisdom. Moon energy for gentle protection and clarity.',
    admin_user_id,
    true
),
(
    'Purple Candle',
    'purple-candle',
    'Purple',
    'Thursday',
    'Purple candles are used for spiritual work, psychic development, and connecting with the divine. They represent wisdom, power, and higher consciousness. Purple is the color of royalty and spiritual authority.',
    'Perfect for full moon rituals, psychic work, divination sessions, and honoring deity.',
    'Thursdays, full moon, during meditation, or when Jupiter is prominent.',
    'East for spiritual awakening, or center for balanced energy',
    'Dress from bottom to top for raising consciousness, or from center outward for expanding spiritual awareness. Anoint with frankincense, myrrh, or psychic development oils.',
    'Purple candles are powerful for spiritual work. Use during meditation or divination. Combine with crystals like amethyst for enhanced psychic work.',
    'Keep purple candle remains on your altar or in your meditation space. Can be buried at a crossroads for spiritual power.',
    'Purple has been the color of royalty and spiritual power throughout history. In ancient times, purple dye was extremely expensive, made from thousands of murex snails, making it available only to royalty and priests. Roman emperors wore purple togas. Purple became associated with spiritual authority and divine power. In magical practice, purple connects to Jupiter''s expansive wisdom and spiritual growth. The color purple naturally stimulates the third eye chakra, making purple candles essential for psychic development. Modern witchcraft uses purple extensively for divination, meditation, and connecting with higher realms. Purple represents the bridge between physical and spiritual worlds.',
    'Purple candles for spirituality, psychic development, wisdom, and divine connection. Jupiter energy for spiritual expansion.',
    admin_user_id,
    true
),
(
    'Yellow Candle',
    'yellow-candle',
    'Yellow',
    'Sunday',
    'Yellow candles represent the sun, success, and mental clarity. They bring confidence, creativity, and joy. Yellow enhances communication and learning, bringing optimism and positive energy.',
    'Ideal for solar magic, success rituals, exam preparation, and creative projects.',
    'Sundays, sunrise, noon (solar noon), or during waxing moon for growth and success.',
    'East for new success, South for peak power',
    'Dress toward you for drawing success, away from you for sending clear communication. Anoint with lemon oil, cinnamon, or rosemary.',
    'Yellow candles bring bright, positive energy. Perfect for morning rituals and solar work. Burn when you need mental clarity or confidence boost.',
    'Scatter yellow candle remains to the winds for spreading success energy. Can keep wax as a confidence charm.',
    'Yellow candles have been associated with the sun and solar deities throughout history. Ancient sun worship across cultures recognized yellow/gold as the color of solar power. Egyptian sun god Ra was represented by gold. In Greek and Roman traditions, Apollo''s golden light brought clarity and prophecy. Yellow has always been associated with gold, wealth, and success. In color magic, yellow stimulates the solar plexus chakra, the center of personal power and confidence. Yellow candles are used in folk magic for success in business, passing exams, and gaining confidence. The bright, cheerful energy of yellow makes it perfect for joy and optimism work.',
    'Yellow candles for success, confidence, creativity, mental clarity, and joy. Sun energy for optimism and achievement.',
    admin_user_id,
    true
),
(
    'Orange Candle',
    'orange-candle',
    'Orange',
    'Sunday',
    'Orange candles combine the energy of red with the joy of yellow. They bring creativity, enthusiasm, and attraction. Orange encourages success, ambition, and adaptability.',
    'Perfect for creative projects, career success, attracting positive opportunities, and sacral chakra work.',
    'Sundays, sunrise, during waxing moon, or when starting new creative projects.',
    'East for new opportunities, South for creative fire',
    'Dress toward you to attract success and opportunities. Anoint with orange oil, cinnamon, or creativity-boosting oils.',
    'Orange candles burn with enthusiastic energy. Perfect for project launches and new ventures. Creates vibrant, attractive energy.',
    'Scatter orange candle remains in directions you want opportunities to come from. Can keep for sacral chakra work.',
    'Orange candles in magical practice emerged as practitioners recognized the unique blend of red''s passion and yellow''s mental energy. In color theory, orange combines physical energy with mental clarity. Ancient cultures associated orange with harvest abundance - the color of ripe fruits and autumn plenty. In Eastern traditions, orange represents sacred knowledge and spiritual transformation (Buddhist monk robes). In Western magic, orange became associated with mercury and quick success. Orange candles are used for attracting opportunities, as orange is highly visible and attractive. The sacral chakra''s orange color connects these candles to creativity, pleasure, and manifestation of desires.',
    'Orange candles for creativity, enthusiasm, success, attraction, and adaptability. Sun and Mercury energy for opportunity.',
    admin_user_id,
    true
),
(
    'Brown Candle',
    'brown-candle',
    'Brown',
    'Saturday',
    'Brown candles are grounding and stabilizing. They represent the Earth, home, and material security. Brown is used for working with animals, grounding energy, and practical matters.',
    'Ideal for home blessing, pet protection, financial stability, and grounding work.',
    'Saturdays, during waning moon for grounding, or anytime you feel ungrounded.',
    'North for Earth energy and grounding',
    'Dress from bottom to top for stability and grounding. Anoint with earthy oils like patchouli or cedarwood.',
    'Brown candles create solid, stable energy. Perfect for home and hearth work. Use when you need to feel grounded and secure.',
    'Bury brown candle remains in your backyard or at property corners for home protection. Can keep for grounding work.',
    'Brown candles represent the most fundamental element - Earth itself. In folk magic traditions, brown has always been associated with soil, harvest, and material abundance. Brown is the color of tree trunks that provide shelter, of fertile soil that grows food, and of the stable Earth beneath our feet. In hoodoo and conjure, brown candles are used for court cases and legal matters, representing solid, stable outcomes. Brown candles are particularly important in animal magic and working with animal spirits. The practical, no-nonsense energy of brown makes it essential for manifesting tangible, material results. Saturn''s influence brings structure and discipline to brown candle work.',
    'Brown candles for grounding, stability, home protection, and animal magic. Saturn and Earth energy for material security.',
    admin_user_id,
    true
),
(
    'Silver Candle',
    'silver-candle',
    'Silver',
    'Monday',
    'Silver candles represent lunar energy, intuition, and the divine feminine. They are used for psychic work, removing negative influences, and working with moon magic. Silver reflects energy back to its source.',
    'Perfect for moon rituals, psychic development, astral projection, dream work, and working with goddess energy.',
    'Mondays, full moon (especially powerful), new moon for new psychic work, or during lunar hours.',
    'West for lunar energy, or face the moon if visible',
    'Dress from center outward for drawing lunar energy, toward you for intuition work. Anoint with jasmine, moonflower, or lunar blend oils.',
    'Silver candles are powerful during the full moon. Use for scrying, divination, or any work requiring heightened intuition. Combines well with white or purple candles.',
    'Keep silver candle remains on your altar during moon work. Can be buried under moonlight for continuing lunar connection.',
    'Silver has been associated with the moon and feminine divine power throughout history. Ancient lunar worship used silver objects and candles to honor moon goddesses like Diana, Selene, and Artemis. Silver mirrors were used for scrying and divination. In alchemy, silver represented the soul and lunar principle. Silver''s reflective quality makes it protective, bouncing negative energy back to sender. Silver candles became essential in modern Wicca for Esbat celebrations and full moon rituals. The metal silver has natural antimicrobial properties, symbolically cleansing and purifying.',
    'Silver candles for lunar magic, psychic abilities, intuition, and divine feminine energy. Moon power for reflection and protection.',
    admin_user_id,
    true
),
(
    'Gold Candle',
    'gold-candle',
    'Gold',
    'Sunday',
    'Gold candles represent solar energy, success, and abundance. They attract wealth, honor, and masculine divine power. Gold is used for prosperity magic and manifesting goals.',
    'Ideal for success rituals, wealth manifestation, honor and recognition, solar magic, and attracting abundance.',
    'Sundays, solar noon, summer solstice, or when seeking recognition and success.',
    'South for solar power and success',
    'Dress toward you to draw wealth and success. Anoint with cinnamon, frankincense, or prosperity oils.',
    'Gold candles work powerfully on Sundays and during solar hours. Burn when you need recognition, financial success, or to connect with solar deities.',
    'Keep gold candle remains in your wallet or cash box. Can place near awards or success symbols for continued abundance.',
    'Gold has represented wealth, power, and divine energy across all civilizations. Ancient Egypt associated gold with the sun god Ra and used it in sacred rituals. Gold was considered the flesh of the gods. Kings and emperors wore gold as symbols of divine right. In alchemy, gold represented perfection and spiritual enlightenment. Gold candles are used in ceremonial magic for success, abundance, and connecting with solar/masculine divine energy. The incorruptible nature of gold (it doesn''t tarnish) makes it symbolize eternal truth and divine permanence.',
    'Gold candles for success, wealth, abundance, power, and solar magic. Sun energy for recognition and achievement.',
    admin_user_id,
    true
),
(
    'Gray Candle',
    'gray-candle',
    'Gray',
    'Wednesday',
    'Gray candles are used for neutrality, balance, and neutralizing negative situations. They help in contemplation, complex situations requiring no emotional attachment, and canceling harmful magic.',
    'Perfect for neutralizing negativity, finding balance, contemplation, canceling spells, and working through ambiguous situations.',
    'Wednesdays, during waning moon for neutralizing, or anytime for balance and contemplation.',
    'Center/no specific direction - gray is neutral',
    'Dress from ends to center for neutralizing, or from center outward for creating balance. Anoint with lavender or sage oils.',
    'Gray candles create neutral space. Use when you need emotional detachment, are working with justice matters, or need to cancel previous magical work.',
    'Dispose gray candle remains at a crossroads for neutrality, or bury for completing the cancellation work.',
    'Gray candles represent the space between black and white, light and dark. In color magic, gray is used for neutrality and balance when neither extreme is appropriate. Gray became important in folk magic for legal matters, where impartial justice is needed. Gray is used in cancellation magic to undo previous spells without adding new energy. The neutral nature of gray makes it perfect for contemplation and meditation when emotional detachment is needed. Gray candles help see all sides of complex situations without bias.',
    'Gray candles for neutrality, balance, canceling spells, and contemplation. Saturn energy for impartial justice.',
    admin_user_id,
    true
),
(
    'Copper Candle',
    'copper-candle',
    'Copper',
    'Friday',
    'Copper candles enhance energy flow and attract love, money, and luck. Associated with Venus, they are used for passion, business success, and healing energy blockages.',
    'Ideal for love magic, business success, energy work, attracting good fortune, and healing chakra blockages.',
    'Fridays, during waxing moon, or when doing energy healing and prosperity work.',
    'North-East combining Earth and Air energy',
    'Dress toward you to attract love and prosperity. Anoint with rose, vanilla, or prosperity oils.',
    'Copper candles conduct and amplify energy. Excellent for charging other magical tools or for money-drawing work. Pairs well with green or pink candles.',
    'Keep copper candle remains near your workspace for business success, or in your love altar for relationship energy.',
    'Copper has been valued since ancient times for its conductive properties and connection to Venus. Ancient Cypriots mined copper extensively (Cyprus is named after copper). Copper was sacred to Aphrodite/Venus and used in love magic. Copper''s ability to conduct energy makes it important in healing work and energy manipulation. In folk medicine and magic, copper bracelets were worn for healing. Copper candles combine Venus'' love and prosperity influences with the metal''s energy-conducting properties.',
    'Copper candles for love, prosperity, energy flow, luck, and healing. Venus energy enhanced by copper''s conductive properties.',
    admin_user_id,
    true
),
(
    'Lavender Candle',
    'lavender-candle',
    'Lavender',
    'Wednesday',
    'Lavender candles promote spiritual healing, intuition, and peace. They are calming yet spiritually elevating, perfect for meditation, spiritual growth, and gentle psychic work.',
    'Perfect for spiritual healing, meditation, developing intuition, peaceful sleep, and gentle spiritual work.',
    'Wednesdays, twilight hours, before sleep for dreams, or during gentle spiritual work.',
    'East for spiritual dawn, or the direction of rising moon',
    'Dress from bottom to top for spiritual elevation, toward you for peace and healing. Anoint with lavender essential oil.',
    'Lavender candles create serene, spiritually uplifting energy. Burn before bed for peaceful sleep and prophetic dreams, or during meditation for spiritual insights.',
    'Keep lavender candle remains in your bedroom or meditation space. Can be placed in dream pillows for peaceful sleep.',
    'Lavender combines the spiritual power of purple with the gentleness of pink or white. The herb lavender has been used for centuries for peace, protection, and spiritual cleansing. Roman baths included lavender for purification. In medieval times, lavender was strewn on floors for protection and pleasant scent. Lavender color in candles emerged as practitioners recognized the unique blend of spiritual elevation and emotional healing. Lavender candles are used extensively in modern practice for meditation, spiritual development, and creating sacred space.',
    'Lavender candles for spiritual healing, gentle psychic work, peace, and meditation. Moon energy for spiritual elevation.',
    admin_user_id,
    true
),
(
    'Indigo Candle',
    'indigo-candle',
    'Indigo',
    'Thursday',
    'Indigo candles are powerful for deep meditation, accessing ancient wisdom, and third eye work. They facilitate deep spiritual journeys and connection to higher knowledge.',
    'Ideal for deep meditation, past life work, accessing akashic records, serious psychic development, and karmic healing.',
    'Thursdays, new moon, midnight hours, or during serious spiritual initiations and deep work.',
    'East for spiritual enlightenment, North for ancient wisdom',
    'Dress from bottom to top for spiritual ascension, or from center outward for opening third eye. Anoint with frankincense or sandalwood.',
    'Indigo candles are intensely spiritual. Use during new moon or when doing deep inner work. Not for casual use - indigo opens deep spiritual channels.',
    'Keep indigo candle remains on your altar. This is powerful wax - use sparingly and respectfully in future deep work.',
    'Indigo represents the deepest levels of intuition and spiritual wisdom. Deeper than blue, darker than purple, indigo has been associated with night skies and deep mysteries since ancient times. Indigo dye was rare and precious, creating intense deep blue-purple shades. In chakra work, indigo corresponds to the third eye, the seat of intuition and inner vision. Indigo candles are used for serious spiritual work, accessing past lives, and connecting with deep ancestral wisdom. The color''s intensity makes it powerful for transformative spiritual work.',
    'Indigo candles for deep meditation, ancient wisdom, third eye opening, and accessing akashic records. Intense spiritual power.',
    admin_user_id,
    true
),
(
    'Teal Candle',
    'teal-candle',
    'Teal',
    'Wednesday',
    'Teal candles combine emotional healing with clear communication. They help speak truth with compassion and heal communication wounds. Perfect for throat chakra work.',
    'Perfect for healing communication, speaking truth with compassion, artistic expression, emotional balance, and throat chakra healing.',
    'Wednesdays for communication, during waxing moon for healing, or before important conversations.',
    'East for clear expression, West for emotional flow',
    'Dress toward you for healing communication wounds, away from you for clear self-expression. Anoint with eucalyptus or peppermint oils.',
    'Teal candles create balanced communication energy. Use before difficult conversations, for writers and artists, or when healing from harsh words.',
    'Return teal candle remains to water or bury in garden. Can keep for future throat chakra healing work.',
    'Teal combines blue''s peace and truth with green''s healing and growth. This color emerged in candle magic as practitioners recognized the need for healing communication - not just speaking truth, but doing so with emotional intelligence. Teal corresponds to balanced throat chakra energy, where communication flows from heart wisdom. In color psychology, teal promotes emotional balance and creative expression. Teal candles are particularly useful in modern times for healing digital communication wounds and promoting authentic self-expression.',
    'Teal candles for healing communication, emotional balance, artistic expression, and throat chakra work.',
    admin_user_id,
    true
),
(
    'Burgundy Candle',
    'burgundy-candle',
    'Burgundy',
    'Tuesday',
    'Burgundy candles represent mature power, controlled passion, and deep transformation. Darker than red, they are used for serious power work, business success, and overcoming major obstacles.',
    'Ideal for business success, controlled power magic, overcoming obstacles, mature love relationships, and serious transformation work.',
    'Tuesdays for power, during waxing moon for growth, or when undertaking serious long-term goals.',
    'South for controlled power, North for stable ambition',
    'Dress toward you for drawing power and success, away from you for removing major obstacles. Anoint with dragon''s blood or commanding oils.',
    'Burgundy candles bring controlled, mature energy. Use for serious goal achievement, business advancement, or when red seems too aggressive and black too harsh.',
    'Keep burgundy candle remains in your office or workspace. Can place near business goals for sustained power.',
    'Burgundy combines red''s power with brown''s stability and maturity. In color symbolism, burgundy represents controlled passion, sophisticated power, and deep transformation. Medieval royalty favored burgundy for its association with wealth and power. In magic, burgundy emerged for practitioners needing red''s energy but with more control and maturity. Burgundy is particularly effective for business magic, career advancement, and working with mature expressions of power. The color''s depth makes it suitable for serious, long-term magical work.',
    'Burgundy candles for mature power, business success, controlled passion, and overcoming major obstacles. Sophisticated Mars energy.',
    admin_user_id,
    true
),
(
    'Peach Candle',
    'peach-candle',
    'Peach',
    'Friday',
    'Peach candles promote gentle strength, nurturing love, and emotional restoration. Softer than orange but warmer than pink, they heal while empowering.',
    'Perfect for healing relationships, restoring confidence gently, nurturing self and others, gentle empowerment, and emotional restoration.',
    'Fridays, sunrise for gentle new beginnings, or during emotional healing work.',
    'East for new empowered beginnings, South-East for gentle warmth',
    'Dress toward you for self-nurturing and healing, away from you for sending gentle loving energy to others. Anoint with peach, apricot, or sweet orange oils.',
    'Peach candles create warm, nurturing yet empowering energy. Use for healing from relationships, building gentle confidence, or nurturing projects and relationships.',
    'Keep peach candle remains for self-love work. Can place near photos of inner child for ongoing healing.',
    'Peach combines pink''s gentle love with orange''s warmth and energy, creating a color of nurturing strength. In color psychology, peach is warm, approachable, and healing. Peach candles emerged in candle magic for situations requiring both healing and gentle empowerment - healing that doesn''t leave one depleted, but instead restores strength. Peach is particularly effective for healing inner child wounds, recovering from harsh experiences, and learning to be gentle with oneself while still maintaining strength.',
    'Peach candles for gentle strength, nurturing love, emotional restoration, and self-empowerment. Venus energy with healing warmth.',
    admin_user_id,
    true
),
(
    'Turquoise Candle',
    'turquoise-candle',
    'Turquoise',
    'Wednesday',
    'Turquoise candles represent spiritual protection, clear communication, and emotional healing. They combine water''s emotional wisdom with air''s mental clarity.',
    'Ideal for spiritual protection, healing communication, emotional wisdom, clear thinking with emotional intelligence, and protecting against psychic attack.',
    'Wednesdays for protection, during waxing moon, or before speaking difficult truths.',
    'East for clear communication, or the four directions for full protection',
    'Dress from center outward for protection, toward you for healing and clarity. Anoint with sage, lavender, or protective oils.',
    'Turquoise candles create protected, clear space. Use when you need to speak difficult truths, process emotions clearly, or shield yourself spiritually.',
    'Keep turquoise candle remains for ongoing protection. Can place at entrances or in communication spaces.',
    'Turquoise stone has been valued across cultures for spiritual protection and communication. Ancient Egyptians, Native Americans, and Tibetans all prized turquoise for its protective and healing properties. The stone was believed to change color to warn of danger. Turquoise candles embody the stone''s properties - protection, clear communication, and spiritual connection. The color balances water and air elements, emotions and intellect. Turquoise is particularly powerful in modern times for protecting against digital negativity while maintaining clear, authentic communication.',
    'Turquoise candles for spiritual protection, clear communication, emotional wisdom, and shielding from negativity.',
    admin_user_id,
    true
);

END $$;
