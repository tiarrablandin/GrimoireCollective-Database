-- =============================================================================
-- GRIMOIRE COLLECTIVE - CALENDAR DATA (CONSOLIDATED)
-- =============================================================================
-- Purpose: All sabbats, esbats, and pagan holidays in one file
-- Dependencies: Requires 02-schema.sql (calendar table definition)
-- =============================================================================

-- Add when_observed column to calendar table
ALTER TABLE calendar 
ADD COLUMN IF NOT EXISTS when_observed TEXT;

COMMENT ON COLUMN calendar.when_observed IS 'Describes when this event is observed - can be a date range (e.g., "February 1-2"), astronomical event (e.g., "Spring Equinox"), or lunar calculation (e.g., "First full moon after spring equinox")';

-- =============================================================================
-- THE 8 WHEEL OF THE YEAR SABBATS
-- =============================================================================

INSERT INTO calendar (name, slug, celebration_type, date_type, when_observed, description, colors, symbols) VALUES
('Samhain', 'samhain', 'sabbat', 'fixed', 'October 31 - November 1',
 'Celtic new year and festival of the dead. The veil between worlds is thinnest.',
 ARRAY['black', 'orange', 'purple', 'silver'],
 ARRAY['pumpkins', 'skulls', 'candles', 'apples', 'photographs']),

('Yule', 'yule', 'sabbat', 'solar', 'Winter Solstice (December 20-23)',
 'Winter Solstice. Celebration of the return of the sun.',
 ARRAY['red', 'green', 'gold', 'white'],
 ARRAY['evergreens', 'candles', 'yule log', 'holly', 'mistletoe']),

('Imbolc', 'imbolc', 'sabbat', 'fixed', 'February 1-2',
 'Festival of the hearth and home. Honoring Brigid.',
 ARRAY['white', 'green', 'light blue'],
 ARRAY['candles', 'snowdrops', 'brigid cross', 'seeds']),

('Ostara', 'ostara', 'sabbat', 'solar', 'Spring Equinox (March 19-22)',
 'Spring Equinox. Balance of light and dark.',
 ARRAY['pastel colors', 'green', 'yellow', 'pink'],
 ARRAY['eggs', 'rabbits', 'flowers', 'seeds']),

('Beltane', 'beltane', 'sabbat', 'fixed', 'April 30 - May 1',
 'May Day celebration of fertility and union.',
 ARRAY['green', 'red', 'white', 'pink'],
 ARRAY['maypole', 'flowers', 'fire', 'ribbons']),

('Litha', 'litha', 'sabbat', 'solar', 'Summer Solstice (June 19-23)',
 'Summer Solstice. Longest day of the year.',
 ARRAY['gold', 'yellow', 'orange', 'green'],
 ARRAY['sun wheels', 'flowers', 'oak', 'herbs']),

('Lammas', 'lammas', 'sabbat', 'fixed', 'August 1-2',
 'First harvest festival. Grain harvest.',
 ARRAY['gold', 'orange', 'yellow', 'brown'],
 ARRAY['wheat', 'corn', 'bread', 'scythe']),

('Mabon', 'mabon', 'sabbat', 'solar', 'Autumn Equinox (September 21-24)',
 'Autumn Equinox. Second harvest.',
 ARRAY['red', 'orange', 'brown', 'gold'],
 ARRAY['apples', 'vines', 'cornucopia', 'leaves']),

-- =============================================================================
-- ESBATS (LUNAR CELEBRATIONS)
-- =============================================================================

('Full Moon Esbat', 'full-moon-esbat', 'esbat', 'lunar', 'Every Full Moon',
 'Monthly celebration of the Full Moon. Time for manifestation and gratitude.',
 ARRAY['silver', 'white', 'blue'],
 ARRAY['moon', 'water', 'crystals', 'candles']),

('New Moon Esbat', 'new-moon-esbat', 'esbat', 'lunar', 'Every New Moon',
 'Monthly celebration of the New Moon. Time for new beginnings and intention setting.',
 ARRAY['black', 'dark blue', 'silver'],
 ARRAY['moon', 'seeds', 'journal', 'candles']),

-- =============================================================================
-- NORSE/HEATHEN CELEBRATIONS
-- =============================================================================

('Thorrablót', 'thorrablot', 'other', 'fixed', 'Mid-January to mid-February (typically January 19-20)',
 'Icelandic midwinter feast dedicated to Thor. Traditional foods and celebration of surviving winter.',
 ARRAY['red', 'silver', 'white'],
 ARRAY['hammer', 'traditional foods', 'mead horn']),

('Disting', 'disting', 'other', 'lunar', 'First new moon after Winter Solstice or early February', 
 'Ancient Norse celebration honoring the Disir (female ancestors and spirits). A time for honoring female ancestors, making offerings, and celebrating women''s strength.',
 ARRAY['white', 'silver', 'red'],
 ARRAY['distaff', 'spinning wheel', 'ancestral items', 'candles']),

('Walpurgis Night', 'walpurgis-night', 'other', 'fixed', 'April 30 (eve of May Day)',
 'Germanic celebration on the eve of May Day. Night of bonfires, dancing, and protection against witchcraft. Also called Hexennacht.',
 ARRAY['red', 'orange', 'black'],
 ARRAY['bonfires', 'birch branches', 'may flowers']),

('Freyfaxi', 'freyfaxi', 'other', 'fixed', 'Late July to early August (typically July 31 or August 1)',
 'Norse festival celebrating the first harvest, dedicated to Freyr. Blessing of horses and giving thanks for abundance.',
 ARRAY['gold', 'brown', 'green'],
 ARRAY['grain', 'horses', 'bread', 'harvest tools']),

('Haustblót', 'haustblot', 'other', 'solar', 'Autumn Equinox (September 21-24)',
 'Norse autumn sacrifice and feast. Celebration of the harvest and preparation for winter.',
 ARRAY['orange', 'brown', 'gold'],
 ARRAY['harvest foods', 'apples', 'grains', 'mead']),

('Winter Nights', 'winter-nights', 'other', 'fixed', 'Mid-October (typically October 14)',
 'Norse festival marking the beginning of winter. Three-day celebration honoring the Disir and welcoming winter.',
 ARRAY['white', 'silver', 'blue', 'black'],
 ARRAY['ancestor items', 'winter foods', 'candles']),

-- =============================================================================
-- CELTIC FIRE FESTIVALS
-- =============================================================================

('Brighid''s Day', 'brighids-day', 'sabbat', 'fixed', 'February 1-2',
 'Celtic celebration of Brighid, goddess of fire, poetry, and healing. Also called Imbolc or Candlemas.',
 ARRAY['white', 'red', 'orange'],
 ARRAY['candles', 'Brighid''s cross', 'fire', 'snowdrops']),

('Lughnasadh', 'lughnasadh', 'sabbat', 'fixed', 'August 1-2',
 'Celtic celebration of the first harvest, honoring the god Lugh. Time of games, contests, and giving thanks. Also called Lammas.',
 ARRAY['gold', 'yellow', 'orange', 'green'],
 ARRAY['grain', 'bread', 'corn dollies', 'sun symbols']),

-- =============================================================================
-- GRECO-ROMAN CELEBRATIONS
-- =============================================================================

('Anthesteria', 'anthesteria', 'other', 'fixed', 'February 11-13 (three-day festival)',
 'Ancient Greek festival honoring Dionysus and the new wine. A three-day celebration of spring, wine, and the dead.',
 ARRAY['purple', 'green', 'wine red'],
 ARRAY['wine', 'ivy', 'grapes', 'masks']),

('Lupercalia', 'lupercalia', 'other', 'fixed', 'February 13-15',
 'Ancient Roman fertility festival. Celebration of love, fertility, and purification.',
 ARRAY['red', 'pink', 'white'],
 ARRAY['wolf symbols', 'hearts', 'flowers', 'fertility symbols']),

('Dionysia', 'dionysia', 'other', 'fixed', 'Late March (City Dionysia) or December-January (Rural Dionysia)',
 'Ancient Greek festival honoring Dionysus. Celebration of wine, theater, and ecstatic experience.',
 ARRAY['purple', 'green', 'gold'],
 ARRAY['grapes', 'ivy', 'thyrsus', 'masks', 'wine']),

('Liberalia', 'liberalia', 'other', 'fixed', 'March 17',
 'Roman festival honoring Liber and Libera (wine and fertility deities). Celebration of coming of age.',
 ARRAY['purple', 'gold', 'green'],
 ARRAY['wine', 'honey cakes', 'ivy', 'grapes']),

('Festival of Bastet', 'festival-of-bastet', 'other', 'fixed', 'April 21 or late April',
 'Ancient Egyptian festival honoring Bastet, goddess of cats, joy, and protection. Time of music and celebration.',
 ARRAY['gold', 'green', 'red'],
 ARRAY['cats', 'sistrum', 'perfume', 'music']),

('Floralia', 'floralia', 'other', 'fixed', 'April 28 - May 3 (six-day festival)',
 'Roman festival honoring Flora, goddess of flowers and spring. Six-day celebration of renewal and pleasure.',
 ARRAY['all bright colors', 'pink', 'yellow', 'white'],
 ARRAY['flowers', 'butterflies', 'spring blooms']),

('Vestalia', 'vestalia', 'other', 'fixed', 'June 7-15',
 'Roman festival honoring Vesta, goddess of hearth and home. Sacred to women and the sacred flame.',
 ARRAY['white', 'red', 'orange'],
 ARRAY['flames', 'hearth', 'bread', 'sacred fire']),

('Aphrodisia', 'aphrodisia', 'other', 'fixed', 'July (dates vary by region)',
 'Ancient Greek festival celebrating Aphrodite, goddess of love and beauty.',
 ARRAY['pink', 'red', 'white', 'gold'],
 ARRAY['roses', 'doves', 'shells', 'mirrors']),

('Hecate Night', 'hecate-night', 'other', 'lunar', 'August 13 or Dark Moon in August',
 'Modern celebration honoring Hecate, goddess of witchcraft and crossroads. Night of the Dark Moon.',
 ARRAY['black', 'red', 'silver', 'purple'],
 ARRAY['keys', 'torches', 'crossroads', 'garlic', 'dark moon']),

('Saturnalia', 'saturnalia', 'other', 'fixed', 'December 17-23 (week-long festival)',
 'Ancient Roman festival honoring Saturn. Week-long celebration of role reversal, gift-giving, and merriment.',
 ARRAY['gold', 'red', 'green'],
 ARRAY['candles', 'evergreens', 'gifts', 'feast foods']),

-- =============================================================================
-- EGYPTIAN CELEBRATIONS
-- =============================================================================

('Opet Festival', 'opet-festival', 'other', 'lunar', 'Second month of Akhet (flood season), typically July-August',
 'Ancient Egyptian festival celebrating the fertility of Amun-Ra. Procession and celebration of divine power.',
 ARRAY['gold', 'blue', 'white', 'red'],
 ARRAY['barque', 'lotus', 'papyrus', 'ankh']),

('Wep Ronpet', 'wep-ronpet', 'other', 'solar', 'Heliacal rising of Sirius (mid-July to early August)',
 'Ancient Egyptian New Year, marking the heliacal rising of Sirius. Celebration of renewal and the Nile flood.',
 ARRAY['gold', 'blue', 'white'],
 ARRAY['star', 'water', 'lotus', 'ankh']),

-- =============================================================================
-- SLAVIC CELEBRATIONS
-- =============================================================================

('Koliada', 'koliada', 'other', 'solar', 'Winter Solstice through January 6-7',
 'Slavic midwinter festival. Celebration of the sun''s return with caroling, costumes, and ritual.',
 ARRAY['white', 'red', 'gold'],
 ARRAY['sun symbols', 'sheaf of grain', 'star', 'candles']),

('Maslenitsa', 'maslenitsa', 'other', 'lunar', 'Week before Lent (late February to early March)',
 'Slavic celebration of the end of winter. Week-long festival of pancakes, fire, and farewell to winter.',
 ARRAY['yellow', 'red', 'white'],
 ARRAY['sun wheel', 'pancakes', 'straw effigy', 'fire']),

('Kupala Night', 'kupala-night', 'other', 'solar', 'Summer Solstice or July 6-7',
 'Slavic midsummer celebration honoring Kupala. Night of fire, water, love magic, and herbs.',
 ARRAY['white', 'blue', 'red', 'green'],
 ARRAY['flower wreaths', 'bonfires', 'water', 'fern flower']),

-- =============================================================================
-- MODERN WICCAN/PAGAN CELEBRATIONS
-- =============================================================================

('Day of Freya', 'day-of-freya', 'other', 'fixed', 'First Friday of May or May 2',
 'Modern celebration honoring Freya, Norse goddess of love, fertility, magic, and war.',
 ARRAY['gold', 'red', 'green'],
 ARRAY['cats', 'amber', 'falcon feathers', 'strawberries']),

('Hecate''s Night', 'hecates-night', 'other', 'lunar', 'August 13 or Dark Moon nearest to August 13',
 'Modern celebration of Hecate as goddess of witchcraft, magic, and liminal spaces. Night of honoring the Dark Goddess.',
 ARRAY['black', 'red', 'silver'],
 ARRAY['keys', 'daggers', 'torches', 'crossroads', 'garlic']),

('Persephone''s Descent', 'persephones-descent', 'other', 'solar', 'Autumn Equinox (September 21-24)',
 'Modern celebration marking Persephone''s return to the underworld and the beginning of autumn.',
 ARRAY['purple', 'black', 'pomegranate red'],
 ARRAY['pomegranates', 'flowers', 'underworld symbols']),

('Mischief Night', 'mischief-night', 'other', 'fixed', 'October 30 (night before Samhain)',
 'Night of pranks, trickster energy, and playful chaos before Samhain.',
 ARRAY['orange', 'black', 'purple'],
 ARRAY['masks', 'jokes', 'tricks', 'laughter']),

('Ceridwen''s Cauldron', 'ceridwens-cauldron', 'other', 'fixed', 'October 31 or Samhain',
 'Modern celebration honoring Ceridwen, Celtic goddess of transformation and inspiration.',
 ARRAY['black', 'silver', 'purple', 'deep blue'],
 ARRAY['cauldron', 'grain', 'pigs', 'waning moon']),

('Feast of the Dead', 'feast-of-the-dead', 'other', 'fixed', 'November 1-2 (after Samhain)',
 'Modern pagan celebration honoring ancestors and the dead. Also called Ancestor Night or Nos Galan Gaeaf.',
 ARRAY['black', 'orange', 'purple', 'white'],
 ARRAY['skulls', 'photos of ancestors', 'offerings', 'candles']),

('Night of the Wild Hunt', 'night-of-wild-hunt', 'other', 'solar', 'Winter Solstice (December 20-23)',
 'Celebration of the Wild Hunt mythology. The longest night when the spirits ride across the sky.',
 ARRAY['black', 'silver', 'white', 'red'],
 ARRAY['antlers', 'hunting symbols', 'storm symbols', 'spirit offerings']),

-- =============================================================================
-- SEASONAL/AGRICULTURAL FESTIVALS
-- =============================================================================

('Seed Blessing', 'seed-blessing', 'other', 'lunar', 'New Moon in late March or early April',
 'Modern pagan ritual for blessing seeds before spring planting. Celebrated at new moon in spring.',
 ARRAY['green', 'brown', 'white'],
 ARRAY['seeds', 'soil', 'garden tools', 'sprouts']),

('First Fruits', 'first-fruits', 'other', 'fixed', 'Late May to early June',
 'Celebration and offering of the first harvest. Honoring the abundance of early summer.',
 ARRAY['green', 'yellow', 'red'],
 ARRAY['first harvest produce', 'flowers', 'grain']),

('Faery Day', 'faery-day', 'other', 'solar', 'Midsummer (Summer Solstice) or June 24',
 'Modern celebration of the Fae folk. Time to honor and leave offerings for faeries.',
 ARRAY['green', 'silver', 'pastel colors'],
 ARRAY['flowers', 'bells', 'honey', 'shiny objects']),

('Harvest Home', 'harvest-home', 'other', 'lunar', 'Full Moon nearest to Autumn Equinox',
 'Final harvest celebration. Giving thanks for abundance and preparing for winter.',
 ARRAY['orange', 'brown', 'gold', 'red'],
 ARRAY['harvest foods', 'corn dollies', 'autumn leaves', 'gourds']),

('Apple Harvest', 'apple-harvest', 'other', 'fixed', 'Mid-October (around October 15)',
 'Celebration of apple harvest and cider making. Sacred to many traditions.',
 ARRAY['red', 'green', 'gold'],
 ARRAY['apples', 'cider', 'apple blossoms', 'pentagram']),

-- =============================================================================
-- NAMED FULL MOONS (ESBATS)
-- =============================================================================

('Wolf Moon', 'wolf-moon', 'esbat', 'lunar', 'Full Moon in January',
 'January Full Moon. Named for howling wolves in deep winter.',
 ARRAY['white', 'silver', 'blue'],
 ARRAY['wolves', 'snow', 'ice', 'winter symbols']),

('Snow Moon', 'snow-moon', 'esbat', 'lunar', 'Full Moon in February',
 'February Full Moon. Named for heavy snows of late winter.',
 ARRAY['white', 'silver', 'pale blue'],
 ARRAY['snowflakes', 'ice crystals', 'winter herbs']),

('Worm Moon', 'worm-moon', 'esbat', 'lunar', 'Full Moon in March',
 'March Full Moon. Named for earthworms appearing as soil thaws.',
 ARRAY['brown', 'green', 'silver'],
 ARRAY['earth', 'worms', 'early spring', 'soil']),

('Pink Moon', 'pink-moon', 'esbat', 'lunar', 'Full Moon in April',
 'April Full Moon. Named for pink wildflowers of spring.',
 ARRAY['pink', 'silver', 'green'],
 ARRAY['pink flowers', 'spring blooms', 'new growth']),

('Flower Moon', 'flower-moon', 'esbat', 'lunar', 'Full Moon in May',
 'May Full Moon. Named for abundant flowers of spring.',
 ARRAY['rainbow colors', 'silver', 'white'],
 ARRAY['flowers', 'blossoms', 'gardens', 'bees']),

('Strawberry Moon', 'strawberry-moon', 'esbat', 'lunar', 'Full Moon in June',
 'June Full Moon. Named for strawberry harvest season.',
 ARRAY['red', 'pink', 'silver'],
 ARRAY['strawberries', 'summer fruits', 'abundance']),

('Buck Moon', 'buck-moon', 'esbat', 'lunar', 'Full Moon in July',
 'July Full Moon. Named for new antlers on buck deer.',
 ARRAY['brown', 'gold', 'silver'],
 ARRAY['antlers', 'deer', 'summer', 'strength']),

('Sturgeon Moon', 'sturgeon-moon', 'esbat', 'lunar', 'Full Moon in August',
 'August Full Moon. Named for abundant sturgeon in lakes.',
 ARRAY['silver', 'blue', 'green'],
 ARRAY['fish', 'water', 'abundance', 'harvest']),

('Corn Moon', 'corn-moon', 'esbat', 'lunar', 'Full Moon in September',
 'September Full Moon. Also called Harvest Moon when closest to autumn equinox.',
 ARRAY['orange', 'gold', 'silver'],
 ARRAY['corn', 'grain', 'harvest tools', 'abundance']),

('Hunter''s Moon', 'hunters-moon', 'esbat', 'lunar', 'Full Moon in October (first after Harvest Moon)',
 'October Full Moon. Time for hunting and preparing for winter.',
 ARRAY['orange', 'red', 'silver'],
 ARRAY['hunting tools', 'preservation', 'autumn leaves']),

('Beaver Moon', 'beaver-moon', 'esbat', 'lunar', 'Full Moon in November',
 'November Full Moon. Named for beaver trapping season and dam building.',
 ARRAY['brown', 'silver', 'white'],
 ARRAY['beavers', 'water', 'preparation', 'wood']),

('Cold Moon', 'cold-moon', 'esbat', 'lunar', 'Full Moon in December',
 'December Full Moon. Named for cold of deep winter.',
 ARRAY['white', 'silver', 'ice blue'],
 ARRAY['ice', 'snow', 'winter', 'introspection']),

-- =============================================================================
-- SPECIAL LUNAR CELEBRATIONS
-- =============================================================================

('Dark Moon Ritual', 'dark-moon-ritual', 'esbat', 'lunar', 'Three days before each New Moon',
 'Ritual for the Dark Moon (3 days before new moon). Time of rest, shadow work, and release.',
 ARRAY['black', 'deep purple', 'indigo'],
 ARRAY['obsidian', 'shadow work', 'rest', 'void']),

('Blue Moon Ritual', 'blue-moon-ritual', 'esbat', 'lunar', 'Second Full Moon in a calendar month (rare)',
 'Special ritual for the rare Blue Moon (second full moon in a calendar month). Extra powerful time for magic.',
 ARRAY['blue', 'silver', 'white'],
 ARRAY['moon symbols', 'water', 'crystals']),

('Black Moon Ritual', 'black-moon-ritual', 'esbat', 'lunar', 'Second New Moon in a calendar month (rare)',
 'Special ritual for the Black Moon (second new moon in a calendar month). Powerful time for shadow work.',
 ARRAY['black', 'deep purple', 'silver'],
 ARRAY['dark crystals', 'new beginnings', 'shadow work']);

-- Notification
DO $$ 
BEGIN 
    RAISE NOTICE '✓ Complete calendar data loaded';
    RAISE NOTICE '  - 8 Wheel of the Year Sabbats';
    RAISE NOTICE '  - 2 General Esbats (Full/New Moon)';
    RAISE NOTICE '  - 6 Norse/Heathen celebrations';
    RAISE NOTICE '  - 2 Celtic fire festivals';
    RAISE NOTICE '  - 10 Greco-Roman festivals';
    RAISE NOTICE '  - 2 Egyptian celebrations';
    RAISE NOTICE '  - 3 Slavic festivals';
    RAISE NOTICE '  - 7 Modern Wiccan/Pagan celebrations';
    RAISE NOTICE '  - 5 Agricultural festivals';
    RAISE NOTICE '  - 12 Named Full Moons';
    RAISE NOTICE '  - 3 Special lunar celebrations';
    RAISE NOTICE '  = 60 total calendar entries';
END $$;
