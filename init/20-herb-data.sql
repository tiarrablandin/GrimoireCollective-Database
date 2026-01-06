-- =============================================================================
-- GRIMOIRE COLLECTIVE - HERB DATA
-- =============================================================================
-- Purpose: Comprehensive herb data for the knowledge base
-- Note: This is permanent data, not sample data
--
-- NOTE: The following data is now linked through junction tables:
-- - magical_properties → Link via entity_intentions junction table
-- - element → Link via entity_elements junction table
-- - planet → Link via planets table when created
-- - zodiac_signs → Link via entity_zodiac_signs junction table
-- - deities_associated → Link via entity_deities junction table
-- - sabbats_associated → Link via calendar table
-- - magical_substitutes → Link via entity_substitutes junction table
-- =============================================================================

DO $$
DECLARE
    admin_user_id UUID;
BEGIN
    SELECT id INTO admin_user_id FROM users WHERE username = 'admin' LIMIT 1;

    INSERT INTO herbs (
        name, slug, alternative_names,
        parts_used, preparation_methods, description, magical_uses, contraindications,
        scientific_name, safety_warnings, pregnancy_safe,
        toxicity_level, history, directions, scent_profile,
        skin_safe, plant_family, plant_type, growing_zones, native_regions,
        best_harvest_time, harvesting_notes, storage_methods, shelf_life,
        ritual_uses, preparation_notes, pet_safe, meta_description,
        created_by, is_verified
    ) VALUES

    -- Lavender
    (
        'Lavender', 'lavender', ARRAY['English Lavender', 'French Lavender'],
        ARRAY['flowers', 'leaves'], ARRAY['infusion', 'sachet', 'essential oil'],
        'A beloved aromatic herb known for its calming and protective properties. Lavender is one of the most versatile magical herbs.',
        'Use in sleep pillows for peaceful dreams, add to purification baths, burn for cleansing, incorporate in love spells, place under pillow for restful sleep',
        'Generally safe. May cause drowsiness when combined with sedatives.',
        'Lavandula angustifolia',
        'Safe for most uses. Avoid ingesting essential oil undiluted.', true, 'non_toxic',
        'Lavender has been cherished since ancient times, with evidence of its use found in Egyptian tombs and Roman baths. The Romans introduced lavender to Britain, where it became a staple in Tudor gardens. Medieval herbalists used it to ward off plague and evil spirits. The name derives from the Latin "lavare" meaning "to wash," reflecting its long use in bathing rituals. In Victorian times, lavender was used in smelling salts and to revive fainting ladies. Folk traditions across Europe associated lavender with love divination and protection magic.',
        'For sleep magic: Place dried lavender flowers in a small sachet and tuck under your pillow or inside pillowcase. For purification: Add 1-2 handfuls of dried flowers to bathwater. For love spells: Burn dried lavender on charcoal while focusing on your intention. For protection: Hang bundles above doorways or windows. Steep flowers in hot water for 10-15 minutes for a magical tea to promote calm and clarity.',
        'Sweet, floral, slightly herbaceous with calming undertones', true,
        'Lamiaceae', 'Perennial herb', ARRAY['5-9'], ARRAY['Mediterranean'],
        'Mid-summer when flowers are in full bloom but before they fully open', 
        'Harvest in morning after dew has dried. Cut stems 6-8 inches long. Best harvested in the first year of blooming for strongest scent.',
        ARRAY['dried bundles', 'airtight containers', 'away from light'], '1-2 years when properly dried and stored',
        'Burn dried flowers for purification and peace. Add to ritual baths for cleansing. Scatter flowers in sacred circles. Use in love and fidelity spells. Incorporate in sleep and dream magic.',
        'Dry by hanging bundles upside down in dark, well-ventilated area for 1-2 weeks. Store dried flowers in airtight jars away from sunlight. For tea, use 1-2 teaspoons per cup, steep 5-10 minutes.',
        true, 'Lavender: Calming herb for peace, love, purification, and restful sleep. Used in magical practice for centuries.',
        admin_user_id, true
    ),

    -- Rosemary
    (
        'Rosemary', 'rosemary', ARRAY['Compass Weed', 'Dew of the Sea'],
        ARRAY['leaves', 'stems'], ARRAY['infusion', 'essential oil', 'smudging'],
        'A powerful protective herb associated with memory, clarity, and purification. Rosemary has been used in magical practice for thousands of years.',
        'Burn for cleansing and protection, carry for memory enhancement, add to love sachets, use in purification baths, place under pillow for prophetic dreams',
        'Safe for most uses. Avoid large amounts during pregnancy. May interact with blood thinners.',
        'Rosmarinus officinalis',
        'Generally safe. Avoid essential oil during pregnancy. May cause skin irritation in sensitive individuals.', false, 'mildly_toxic',
        'Rosemary''s history stretches back to ancient Greece and Rome, where students wore garlands of rosemary to improve memory during examinations. The herb was considered sacred to remembrance and fidelity - it was woven into bridal wreaths and funeral arrangements alike. In medieval times, rosemary was believed to ward off evil spirits and plague. Shakespeare referenced it in Hamlet ("There''s rosemary, that''s for remembrance"). During the Middle Ages, it was burned in sickrooms and courts to purify the air. The Virgin Mary was said to have spread her blue cloak over a white-flowered rosemary bush, turning its flowers blue forever.',
        'For protection: Hang sprigs above doorways or burn as smudge. For memory: Make a tea and drink before studying or important mental tasks. For purification: Add fresh or dried rosemary to ritual baths. For love: Create sachets with rosemary and rose petals. Steep 1 teaspoon dried leaves in hot water for 5-7 minutes for magical tea to enhance mental clarity and focus.',
        'Pine-like, sharp, camphoraceous with woody undertones', true,
        'Lamiaceae', 'Perennial shrub', ARRAY['7-10'], ARRAY['Mediterranean'],
        'Spring through fall, best before flowering', 
        'Harvest sprigs in morning after dew dries. Cut 4-6 inch sprigs from growing tips. Avoid harvesting more than one-third of plant at once.',
        ARRAY['dried bundles', 'refrigerated fresh', 'airtight containers'], '2-3 years dried, 2 weeks fresh refrigerated',
        'Burn as smudge for protection and cleansing. Add to ritual baths for purification. Place sprigs at thresholds for protection. Use in remembrance rituals. Incorporate in fidelity and love spells.',
        'Strip leaves from stems if desired. Dry by hanging bundles in dark, dry place for 1-2 weeks. Store whole or crushed in airtight containers. For tea, use 1 teaspoon per cup, steep 5-7 minutes.',
        false, 'Rosemary: Powerful protective herb for memory, purification, and fidelity. Sacred to remembrance.',
        admin_user_id, true
    ),

    -- Mugwort
    (
        'Mugwort', 'mugwort', ARRAY['Artemisia', 'Cronewort', 'Old Man'],
        ARRAY['leaves', 'flowers'], ARRAY['infusion', 'smoking', 'dream pillow'],
        'A powerful herb for divination and psychic work. Mugwort is especially associated with dreams, visions, and lunar magic.',
        'Use in dream pillows for vivid dreams, burn before divination, carry for protection during astral travel, make tea for psychic enhancement, place under pillow for prophetic visions',
        'Avoid during pregnancy and breastfeeding. May cause allergic reactions in those sensitive to Asteraceae family. Not for long-term internal use.',
        'Artemisia vulgaris',
        'Avoid during pregnancy and breastfeeding. Can cause allergic reactions. May interact with medications. Do not use long-term.', false, 'mildly_toxic',
        'Named after the Greek goddess Artemis, mugwort has been used for millennia across cultures. In ancient Rome, travelers placed mugwort in their shoes to prevent fatigue on long journeys. Anglo-Saxons considered it one of the nine sacred herbs. In Chinese medicine, it''s used in moxibustion. European folklore held that mugwort protected against evil spirits and wild beasts. The herb was traditionally gathered on St. John''s Eve and worn as a belt during summer solstice celebrations. It was also sewn into pillows to induce prophetic dreams and astral projection.',
        'For prophetic dreams: Place dried mugwort in a small pillow or sachet under your regular pillow. For divination: Burn dried leaves before scrying or tarot reading to enhance psychic abilities. For astral travel: Drink a weak tea 30 minutes before meditation (1/2 teaspoon in 1 cup hot water, steep 5 minutes). For protection: Hang above doorways or carry in a charm bag. Cleanse divination tools by passing them through mugwort smoke.',
        'Bitter, earthy, slightly sweet with sage-like notes', false,
        'Asteraceae', 'Perennial herb', ARRAY['4-9'], ARRAY['Europe', 'Asia', 'North America'],
        'Late summer before flowering or during early flowering', 
        'Harvest aerial parts in late summer. Cut stems 6-10 inches from top. Best harvested during full moon for magical work. Wear gloves if skin-sensitive.',
        ARRAY['dried bundles', 'airtight containers', 'dark storage'], '1 year dried',
        'Burn before divination and scrying. Place in dream pillows for lucid dreaming. Use in lunar magic and full moon rituals. Add to astral projection incense. Scatter at thresholds for protection.',
        'Dry by hanging in bundles in dark, dry place. Crumble when fully dry. Use sparingly - very potent. For dream work, use small amount (1-2 tablespoons in pillow). Do not use in large quantities internally.',
        false, 'Mugwort: Sacred herb for dreams, divination, and psychic enhancement. Associated with lunar magic.',
        admin_user_id, true
    ),

    -- Bay Laurel
    (
        'Bay Laurel', 'bay-laurel', ARRAY['Bay Leaf', 'Sweet Bay', 'Laurel'],
        ARRAY['leaves'], ARRAY['burning', 'infusion', 'charm bags'],
        'A sacred herb of victory and prophecy, bay laurel has been used in divination and success magic for millennia. The laurel wreath symbolizes achievement and honor.',
        'Write wishes on leaves and burn for manifestation, burn for purification and protection, add to success spells, place under pillow for prophetic dreams, use in divination rituals',
        'Safe for most uses. Avoid large amounts during pregnancy. May cause dermatitis in sensitive individuals.',
        'Laurus nobilis',
        'Generally safe. May cause contact dermatitis. Avoid large amounts during pregnancy.', true, 'non_toxic',
        'Sacred to Apollo, god of prophecy, bay laurel has a rich mythological history. The Greeks believed the tree originated when the nymph Daphne transformed into a laurel tree to escape Apollo''s pursuit. The Oracle of Delphi chewed bay leaves to induce prophetic visions. Roman emperors wore laurel crowns as symbols of triumph and protection. The tradition of crowning victorious athletes and scholars with laurel wreaths continued through ancient Rome. Medieval witches used bay in divination and love spells. The term "poet laureate" comes from the practice of crowning accomplished poets with laurel.',
        'For wish magic: Write your wish on a dried bay leaf with pencil or pen, then burn it completely in a fireproof dish while visualizing your desire manifesting. For prophetic dreams: Place 3 bay leaves under your pillow before sleep. For success: Carry a bay leaf in your wallet or place in business corners. For purification: Burn leaves as incense or add to ritual baths. For protection: Hang bay wreaths above doorways.',
        'Eucalyptus-like, slightly minty with herbal bitterness', true,
        'Lauraceae', 'Evergreen tree', ARRAY['8-10'], ARRAY['Mediterranean'],
        'Summer months, leaves can be harvested year-round from established plants', 
        'Pick mature, unblemished leaves. Can harvest throughout year from healthy plants. Fresh leaves have stronger scent but dried are traditional for magic.',
        ARRAY['dried whole leaves', 'airtight containers'], '1-2 years whole, 6 months crushed',
        'Write wishes on leaves and burn for manifestation. Use in victory and success rituals. Place in corners for protection. Burn for prophetic visions. Add to divination incense.',
        'Dry leaves flat on screens or in single layers. Store whole leaves in airtight jars. Leaves become more aromatic after drying. For wish magic, ensure leaf is completely dry before writing on it.',
        true, 'Bay Laurel: Sacred herb of victory, prophecy, and success. Associated with Apollo and divination.',
        admin_user_id, true
    ),

    -- Sage
    (
        'Sage', 'sage', ARRAY['Garden Sage', 'Common Sage', 'Salvia'],
        ARRAY['leaves'], ARRAY['smudging', 'infusion', 'burning'],
        'A powerful cleansing and purification herb, sage is perhaps the most widely used herb for smoke cleansing in modern practice.',
        'Burn for cleansing spaces and objects, use in purification rituals, add to wisdom spells, carry for protection, burn to break hexes and clear negative energy',
        'Safe for most uses. Avoid large amounts during pregnancy and breastfeeding. May affect blood sugar levels.',
        'Salvia officinalis',
        'Generally safe for cleansing. Avoid burning in poorly ventilated areas. Pregnant and breastfeeding women should avoid large amounts. May affect blood sugar.', false, 'mildly_toxic',
        'Sage''s name comes from the Latin "salvere" meaning "to save" or "to heal." The Romans considered it sacred and harvested it with special rituals. A medieval saying claimed "Why should a man die whilst sage grows in his garden?" In ancient times, sage was believed to grant wisdom and longevity. Greek and Roman physicians used it for numerous ailments. Indigenous peoples of the Americas used white sage (Salvia apiana) for ceremonial cleansing for thousands of years. The practice of burning sage for purification spread globally, though cultural appropriation concerns have led to more mindful use.',
        'For space cleansing: Light dried sage bundle, let flame catch then blow out. Walk through space while wafting smoke with feather or hand, focusing on corners and doorways. For object cleansing: Pass objects through sage smoke several times. For protection: Burn sage while visualizing white protective light filling your space. For wisdom: Drink sage tea before study or divination. Always extinguish completely after use and never leave burning sage unattended.',
        'Herbal, slightly peppery, earthy with camphor notes', true,
        'Lamiaceae', 'Perennial shrub', ARRAY['5-9'], ARRAY['Mediterranean'],
        'Before flowering in late spring/early summer, or throughout growing season', 
        'Harvest in morning after dew dries. Cut sprigs 4-6 inches long. First harvest after plant is established (usually second year). Don''t harvest more than one-third at once.',
        ARRAY['dried bundles', 'airtight containers'], '1-2 years dried',
        'Burn for space and object cleansing. Use in purification and protection rituals. Add to wisdom and longevity spells. Burn to break hexes. Include in blessing ceremonies.',
        'Bundle fresh sage stems and tie with cotton string. Hang to dry in dark, dry place for 1-2 weeks. Can also dry loose leaves on screens. Store dried bundles in paper bags or loose leaves in jars.',
        false, 'Sage: Powerful cleansing herb for purification, wisdom, and protection. Sacred purification plant.',
        admin_user_id, true
    ),

    -- Cinnamon
    (
        'Cinnamon', 'cinnamon', ARRAY['Cassia', 'Sweet Wood'],
        ARRAY['bark'], ARRAY['powder', 'stick', 'infusion', 'oil'],
        'A warming, energizing spice used for prosperity, success, and love magic. Cinnamon raises vibrations and speeds manifestation.',
        'Add to prosperity spells, burn for success, use in love magic, add to healing incenses, sprinkle in wallet for money attraction, use in fast-acting spells',
        'Safe in culinary amounts. May cause irritation if used undiluted on skin. Avoid large amounts during pregnancy.',
        'Cinnamomum verum',
        'Safe in small amounts. Can irritate skin and mucous membranes in large amounts. Avoid essential oil during pregnancy. May interact with blood thinners.', false, 'mildly_toxic',
        'Cinnamon was once more valuable than gold, sought after by ancient traders from Egypt to China. It was mentioned in the Old Testament and was used in Egyptian embalming. Arab traders kept the source of cinnamon secret for centuries to maintain their monopoly. In ancient Rome, Emperor Nero burned a year''s supply of cinnamon at his wife''s funeral as a sign of grief. Medieval physicians used it in healing potions and believed it could cure everything from colds to poisoning. Cinnamon was so prized that wars were fought over its trade routes.',
        'For prosperity: Sprinkle cinnamon powder in corners of home or business. Add a pinch to money-drawing sachets. For success: Light a green candle rolled in cinnamon powder while focusing on your goal. For love: Add ground cinnamon to love sachets or sprinkle on love-drawing candles. For fast-acting spells: Add cinnamon to any spell to speed up results. For healing: Make cinnamon tea and visualize healing energy while drinking. Warning: Cinnamon essential oil is very potent - use sparingly and always dilute.',
        'Sweet, warm, spicy with woody undertones', false,
        'Lauraceae', 'Evergreen tree', ARRAY['10-12'], ARRAY['Sri Lanka', 'India', 'Southeast Asia'],
        'Bark harvested from branches 2-3 years old', 
        'Bark is stripped from young branches after rainy season. Inner bark curls into quills as it dries. Commercial harvesting requires specialized knowledge.',
        ARRAY['ground powder in airtight containers', 'whole sticks', 'dark storage'], '2-3 years for sticks, 6 months for powder',
        'Add to prosperity and success spells. Burn for energy raising. Use in love and passion magic. Add to healing incense. Incorporate in fast-working spells. Use in solar magic.',
        'Buy pre-ground for convenience or grind sticks as needed. Store away from light and heat. Ground cinnamon loses potency faster than sticks. Use small amounts - very potent magically.',
        false, 'Cinnamon: Warming spice for prosperity, success, love, and fast-acting magic. Raises spiritual vibrations.',
        admin_user_id, true
    ),

    -- Basil
    (
        'Basil', 'basil', ARRAY['Sweet Basil', 'St. Joseph''s Wort'],
        ARRAY['leaves'], ARRAY['infusion', 'fresh', 'essential oil'],
        'A versatile herb for love, prosperity, and protection. Basil brings harmony to the home and attracts positive energy.',
        'Place in corners for prosperity, use in love spells, carry for protection, add to purification baths, grow near entrance for positive energy, sprinkle around home for harmony',
        'Generally safe. Avoid large amounts during pregnancy. May cause allergic reactions in some individuals.',
        'Ocimum basilicum',
        'Generally safe. Avoid large amounts during pregnancy. May cause allergic reactions. Essential oil should be diluted before skin contact.', false, 'non_toxic',
        'Basil holds sacred status in many cultures. In India, holy basil (tulsi) is worshipped as an incarnation of the goddess Tulsi. Ancient Greeks and Romans believed basil could generate wealth and ease childbirth. In medieval Europe, basil was associated with both love and hatred - it was said that a woman could win a man''s love by feeding him basil, yet it was also believed scorpions were born beneath basil pots. Italian tradition holds that a pot of basil on a balcony signals a woman''s availability for love. African American hoodoo traditions use basil to attract money and customers to businesses.',
        'For prosperity: Place fresh basil leaves in cash register or wallet. Sprinkle dried basil in corners of home. For love: Carry basil leaves to attract love or give basil to a potential partner. For protection: Place basil leaves at corners of your home or above doorways. For harmony: Grow basil plant near your front door or in kitchen. For purification: Add fresh basil to ritual baths. For business success: Sprinkle basil around your business threshold or desk.',
        'Sweet, slightly peppery, anise-like with clove notes', true,
        'Lamiaceae', 'Annual herb', ARRAY['10-11'], ARRAY['Tropical Asia', 'India'],
        'Throughout growing season, best before flowering', 
        'Harvest leaves in morning after dew dries. Pinch off top sets of leaves regularly to encourage bushiness. Best flavor and scent before flowering.',
        ARRAY['dried leaves', 'fresh in water', 'frozen', 'airtight containers'], 'Few days fresh, 1 year dried',
        'Place in corners for prosperity. Use in love and fidelity spells. Add to protection charms. Include in harmony and peace rituals. Use in business success magic.',
        'Dry by hanging or on screens in dark, dry place. Freezing preserves flavor better than drying. Use fresh when possible for strongest magical properties. Store dried leaves whole for longer shelf life.',
        true, 'Basil: Versatile herb for love, prosperity, protection, and harmony. Attracts positive energy.',
        admin_user_id, true
    ),

    -- Peppermint
    (
        'Peppermint', 'peppermint', ARRAY['Mint', 'Brandy Mint'],
        ARRAY['leaves'], ARRAY['infusion', 'essential oil', 'fresh'],
        'A refreshing herb for mental clarity, prosperity, and purification. Peppermint stimulates the mind and attracts positive energy.',
        'Add to prosperity spells, use in healing magic, burn for purification, place under pillow for prophetic dreams, rub fresh leaves on furniture to purify, use in spells requiring mental clarity',
        'Safe for most uses. May cause heartburn. Avoid giving to infants. May interact with certain medications.',
        'Mentha piperita',
        'Generally safe. Avoid giving to infants or young children. May cause heartburn. Can interact with certain medications. Essential oil should be diluted.', false, 'non_toxic',
        'Peppermint is a hybrid of watermint and spearmint, first cultivated in England in the 17th century. The ancient Greeks and Romans crowned themselves with peppermint at feasts and used it to scent their bathwater. Pliny the Elder noted that the scent of peppermint stirs up the mind and appetite. In medieval times, peppermint was used to whiten teeth and freshen breath. Folk magic traditions use peppermint to attract money and prosperity - rubbing peppermint oil on furniture and doorways was believed to cleanse a space and invite abundance. Modern herbalism recognizes peppermint''s ability to enhance mental clarity and focus.',
        'For prosperity: Place dried peppermint in wallet or cash register. Wash hands with peppermint tea before handling money. For mental clarity: Drink peppermint tea before studying or important mental work. Anoint temples with diluted peppermint oil. For purification: Add peppermint to cleansing baths or floor washes. For healing: Drink peppermint tea while visualizing healing energy. For prophetic dreams: Place dried peppermint under your pillow. Rub fresh leaves to release scent and inhale for quick mental boost.',
        'Cool, fresh, intensely minty with slight sweetness', true,
        'Lamiaceae', 'Perennial herb', ARRAY['3-9'], ARRAY['Europe', 'Middle East'],
        'Just before flowering for best flavor and potency', 
        'Harvest in morning after dew dries. Cut stems 4-6 inches from top. Can harvest multiple times per season. Most potent just before flowering.',
        ARRAY['dried leaves', 'fresh refrigerated', 'airtight containers'], '1-2 weeks fresh, 1 year dried',
        'Use in prosperity and money magic. Add to purification and cleansing spells. Include in mental clarity rituals. Use in healing work. Add to travel protection charms.',
        'Dry by hanging bundles or spreading on screens. Dries quickly. Strip leaves from stems when dry. Store in airtight jars. Fresh leaves can be stored in water like flowers for a few days.',
        true, 'Peppermint: Refreshing herb for prosperity, mental clarity, and purification. Attracts abundance.',
        admin_user_id, true
    ),

    -- Chamomile
    (
        'Chamomile', 'chamomile', ARRAY['German Chamomile', 'Roman Chamomile'],
        ARRAY['flowers'], ARRAY['infusion', 'essential oil', 'sachets'],
        'A gentle, soothing herb for peace, calm, and prosperity. Chamomile attracts money and promotes restful sleep.',
        'Use in sleep magic, add to prosperity spells, include in meditation blends, use in purification baths, sprinkle around property for protection, wash hands with chamomile tea before gambling',
        'Safe for most uses. May cause allergic reactions in those sensitive to Asteraceae family. Avoid during pregnancy.',
        'Matricaria chamomilla',
        'Generally safe. May cause allergic reactions in those sensitive to ragweed. Avoid during pregnancy. May interact with blood thinners.', true, 'non_toxic',
        'Chamomile''s history spans thousands of years. Ancient Egyptians dedicated chamomile to the sun god Ra and used it in embalming. The name comes from Greek "chamaimelon" meaning "ground apple" due to its apple-like scent. Romans used chamomile to flavor beverages and as incense. Medieval monks cultivated chamomile in monastery gardens for medicine and magic. In the Victorian language of flowers, chamomile meant "energy in adversity." English folklore held that chamomile was one of the nine sacred herbs given to the world by the god Woden. Folk magic traditions use chamomile to attract money and ensure success in gambling.',
        'For sleep and dreams: Drink chamomile tea before bed or place dried flowers in dream pillow. For prosperity: Sprinkle dried chamomile around property or wash hands with chamomile tea before handling money. For peace: Add chamomile to ritual baths or burn as gentle incense. For meditation: Drink chamomile tea before meditation to promote calm focus. For protection: Sprinkle around home perimeter. For luck in gambling: Wash hands in chamomile tea before playing games of chance. Steep flowers for 5-10 minutes for magical tea.',
        'Sweet, apple-like, honey notes with slight hay undertones', true,
        'Asteraceae', 'Annual herb', ARRAY['2-9'], ARRAY['Europe', 'Western Asia'],
        'When flowers are fully open', 
        'Harvest flowers in morning after dew dries. Pick when fully open but before browning. Flowers close at night and open in morning - harvest after opening.',
        ARRAY['dried flowers', 'airtight containers', 'dark storage'], '1 year dried',
        'Use in peace and calm spells. Add to prosperity magic. Include in sleep and dream work. Use in meditation rituals. Add to purification baths. Include in luck and gambling charms.',
        'Dry flowers on screens or in paper bags in dark, dry place. Flowers dry quickly. Store whole flowers for best preservation. They become more apple-scented as they dry.',
        true, 'Chamomile: Gentle herb for peace, prosperity, and restful sleep. Attracts calm and abundance.',
        admin_user_id, true
    ),

    -- Yarrow
    (
        'Yarrow', 'yarrow', ARRAY['Soldier''s Woundwort', 'Thousand Leaf'],
        ARRAY['flowers', 'leaves'], ARRAY['infusion', 'fresh', 'dried in sachets'],
        'A powerful herb for courage, divination, and love magic. Yarrow has strong protective and healing properties.',
        'Use in love divination, carry for courage, add to healing spells, use in protection charms, hold during divination for clarity, hang above bed for lasting love',
        'Safe for most uses. May cause allergic reactions in those sensitive to Asteraceae family. Avoid during pregnancy.',
        'Achillea millefolium',
        'Generally safe. May cause allergic reactions or skin sensitivity. Avoid during pregnancy. May interact with blood thinning medications.', false, 'mildly_toxic',
        'Yarrow''s Latin name Achillea honors the Greek hero Achilles, who according to legend used yarrow to heal his soldiers'' wounds during the Trojan War. The plant has been found in Neanderthal burial sites, suggesting its use dates back over 60,000 years. Ancient Chinese texts describe yarrow stalks used in I Ching divination. In medieval Europe, yarrow was sewn into pillows to bring dreams of future lovers. Scottish highlanders made ointment from yarrow for wounds. Anglo-Saxons called it one of the nine sacred herbs. Folk traditions across Europe used yarrow in love divination - a yarrow plant placed under a pillow was said to bring dreams of a future spouse.',
        'For love divination: Place yarrow under pillow before sleep and recite "Thou pretty herb of Venus'' tree, thy true name it is yarrow. Now who my true love must be, pray tell thou me tomorrow." For courage: Carry yarrow in a charm bag before facing challenges. For healing: Make yarrow tea and visualize healing while drinking (avoid if taking blood thinners). For protection: Hang dried yarrow above doorways or carry for protection during travel. For psychic powers: Hold yarrow during divination to enhance clarity. Steep 1-2 teaspoons in hot water for 10 minutes for magical tea.',
        'Slightly bitter, earthy, camphoraceous with sweet undertones', false,
        'Asteraceae', 'Perennial herb', ARRAY['3-9'], ARRAY['Europe', 'Asia', 'North America'],
        'Summer when flowers are in full bloom', 
        'Harvest flowers and leaves in summer when in full bloom. Cut stems 6-12 inches long. Best harvested on sunny mornings after dew dries.',
        ARRAY['dried bundles', 'airtight containers'], '1 year dried',
        'Use in love divination and attraction spells. Carry for courage and protection. Add to healing magic. Use in psychic development work. Include in wedding and handfasting rituals.',
        'Dry by hanging small bundles upside down in dark, dry place. Can also dry flat on screens. Flowers and leaves both useful. Store dried herb in airtight jars away from light.',
        false, 'Yarrow: Powerful herb for courage, divination, love, and protection. Sacred to Achilles and Venus.',
        admin_user_id, true
    ),

    -- Thyme
    (
        'Thyme', 'thyme', ARRAY['Garden Thyme', 'Common Thyme'],
        ARRAY['leaves'], ARRAY['infusion', 'burning', 'sachets'],
        'An herb of courage, purification, and healing. Thyme is associated with fairies and was believed to enable one to see the fae.',
        'Burn for purification, use in healing spells, carry for courage, place under pillow to prevent nightmares, burn to cleanse ritual spaces, wear to see fairies',
        'Generally safe. May cause allergic reactions in some individuals. Avoid large amounts during pregnancy.',
        'Thymus vulgaris',
        'Generally safe. May cause digestive upset in large amounts. Avoid essential oil during pregnancy. Can interact with blood thinners.', false, 'non_toxic',
        'Thyme has been used since ancient times for its medicinal and magical properties. Ancient Egyptians used thyme in embalming. Greeks burned thyme as incense in temples and used it in ritual baths for courage. Romans believed eating thyme before or during meals would protect against poison. Medieval ladies embroidered bees hovering over thyme sprigs on tokens for knights going into battle, as thyme symbolized courage. Scottish highlanders drank wild thyme tea for strength and to prevent nightmares. The ancient Greeks believed thyme was a source of courage, and Roman soldiers would bathe in thyme water before battle.',
        'For courage: Carry dried thyme in a charm bag or drink thyme tea before challenging situations. For purification: Burn dried thyme to cleanse spaces or add to purification baths. For healing: Add to healing sachets or burn during healing rituals. For sleep: Place under pillow to prevent nightmares. For fairy magic: Wear thyme or place in gardens to attract fae. For psychic powers: Burn before divination or wear during psychic work. Steep 1 teaspoon in hot water for 5-7 minutes.',
        'Herbal, earthy, slightly minty with woody undertones', true,
        'Lamiaceae', 'Perennial herb', ARRAY['5-9'], ARRAY['Mediterranean'],
        'Before flowering in early summer for best flavor', 
        'Harvest in morning after dew dries. Cut stems 4-6 inches from growing tips. Can harvest throughout growing season but most potent before flowering.',
        ARRAY['dried sprigs', 'airtight containers'], '1-2 years dried',
        'Burn for purification and cleansing. Use in courage and strength spells. Add to healing incense. Place in spaces to attract fairies. Include in sleep and dream magic to prevent nightmares.',
        'Tie small bundles with cotton string and hang to dry in dark, well-ventilated area. Strip leaves from stems when dry. Store in airtight jars away from light. Retains scent well when dried.',
        true, 'Thyme: Herb of courage, purification, and fairy magic. Used for strength and healing.',
        admin_user_id, true
    ),

    -- Nettle
    (
        'Nettle', 'nettle', ARRAY['Stinging Nettle', 'Common Nettle'],
        ARRAY['leaves'], ARRAY['infusion', 'charm bags', 'dried'],
        'A powerful protective herb that reverses hexes and removes curses. Nettle is used for courage, protection, and breaking through obstacles.',
        'Carry for protection, sprinkle around home to break hexes, add to reversing spells, use in courage magic, burn to remove curses, stuff poppets for protection',
        'Can cause skin irritation when fresh. Wear gloves when handling. Safe when dried or cooked. Avoid during pregnancy.',
        'Urtica dioica',
        'Fresh plant causes stinging and skin irritation. Wear gloves when harvesting. Safe once dried or cooked. Avoid during pregnancy. May interact with blood pressure medications.', false, 'mildly_toxic',
        'Nettle has a long history in protection and curse-breaking magic. Anglo-Saxons used nettle to break curses and protect against evil. In Norse mythology, nettle was sacred to Thor and used for protection during storms. Medieval Europeans believed nettle could protect against lightning strikes. The Brothers Grimm fairy tale features nettle as the only thing that could break an enchantment. Folk magic traditions across Europe used nettle to reverse hexes and return evil to its sender. Despite its sting, nettle has been valued as food and medicine for millennia, and its fierce nature makes it powerful in protective magic.',
        'For protection: Carry dried nettle in a red flannel bag. For hex breaking: Sprinkle dried nettle around your home while visualizing negative energy being broken and scattered. For reversing spells: Add nettle to poppets or written spells to reverse curses back to sender. For courage: Carry nettle when facing fears or obstacles. For removal: Burn nettle to remove obstacles and clear the path forward. Always handle fresh nettle with gloves; the sting disappears when dried.',
        'Green, herbaceous, earthy with a slight hay-like scent', true,
        'Urticaceae', 'Perennial herb', ARRAY['3-10'], ARRAY['Europe', 'Asia', 'North America', 'North Africa'],
        'Spring when young leaves are tender, before flowering', 
        'Wear gloves! Harvest young leaves in spring before flowering. Cut top 4-6 inches of growth. Older leaves become bitter and gritty. Handle with gloves until dried.',
        ARRAY['dried leaves', 'airtight containers'], '1 year dried',
        'Use in protection magic and warding. Add to hex-breaking and curse-removal spells. Include in courage and strength work. Use in reversal magic to return negativity to sender. Add to obstacle-removal rituals.',
        'Wear heavy gloves when harvesting and handling fresh nettle. Dry by spreading leaves on screens or hanging in bundles. Once completely dry, the sting is neutralized. Store in paper bags or glass jars.',
        false, 'Nettle: Protective herb for hex breaking, courage, and curse reversal. Powerful defensive magic.',
        admin_user_id, true
    ),

    -- Rose
    (
        'Rose', 'rose', ARRAY['Garden Rose', 'Wild Rose'],
        ARRAY['petals', 'buds', 'hips'], ARRAY['infusion', 'sachets', 'bath'],
        'The herb of love, beauty, and divination. Rose is sacred to Venus and is used in all matters of the heart and emotional healing.',
        'Use in love spells, add to beauty magic, include in divination, use for emotional healing, add to self-love rituals, burn for peace',
        'Generally safe. Some people may have allergic reactions. Ensure roses are pesticide-free if using internally.',
        'Rosa spp.',
        'Generally safe. Avoid roses treated with pesticides. May cause allergic reactions in sensitive individuals. Rose hips are high in vitamin C and safe for most uses.', true, 'non_toxic',
        'Rose has been sacred to love goddesses across cultures for thousands of years. In ancient Greece and Rome, roses were sacred to Aphrodite and Venus. The Romans scattered rose petals at feasts and used rose water in baths. In ancient Persia, rose water was used in religious ceremonies. Medieval alchemists used roses in their work. The rose is central to Rosicrucian mysticism. In Christianity, the rose became associated with the Virgin Mary. The practice of counting prayers on rose-scented rosaries gave us the word "rosary." Roses have been used in love magic, divination, and healing across virtually every magical tradition.',
        'For love: Add dried rose petals to love sachets or sprinkle on altar during love spells. For self-love: Take a bath with floating rose petals while speaking affirmations. For divination: Drink rose hip tea before divination. For emotional healing: Hold a rose quartz and dried roses during meditation. For beauty: Wash face with rose water. For peace: Burn dried rose petals for calming energy. Different colors have different uses - red for passion, pink for gentle love, white for purity.',
        'Floral, sweet, romantic with subtle honey notes (varies by variety)', true,
        'Rosaceae', 'Perennial shrub', ARRAY['3-11'], ARRAY['Asia', 'Europe', 'North America', 'North Africa'],
        'Morning after dew dries, when flowers are partially open', 
        'Harvest flowers in early morning after dew dries but before full heat of day. Pick when blooms are just opening. For hips, harvest in fall after first frost. Ensure roses are organic and pesticide-free.',
        ARRAY['dried petals in airtight containers', 'dark storage'], '6-12 months for petals, 1-2 years for hips',
        'Use in all love magic - romantic love, self-love, platonic love. Add to beauty and glamour spells. Include in emotional healing work. Use in divination and psychic work. Add to peace and harmony rituals.',
        'Dry petals on screens in single layers in dark, dry place. Can also hang whole flowers upside down. Petals dry quickly. Store away from light to preserve color. Rose hips should be halved and seeds removed before drying.',
        true, 'Rose: Sacred flower of love, beauty, and emotional healing. Used for all matters of the heart.',
        admin_user_id, true
    ),

    -- Dandelion
    (
        'Dandelion', 'dandelion', ARRAY['Lion''s Tooth', 'Blowball'],
        ARRAY['leaves', 'roots', 'flowers'], ARRAY['infusion', 'burning', 'wishes'],
        'A herb of wishes, divination, and spirit communication. Dandelion calls spirits and carries messages between worlds.',
        'Blow seeds to make wishes, use root for spirit communication, drink tea for divination, bury for wishes to come true, use in calling spirits',
        'Generally safe. May cause allergic reactions in those sensitive to Asteraceae family. Avoid if allergic to ragweed.',
        'Taraxacum officinale',
        'Generally safe. May cause allergic reactions in those sensitive to Asteraceae family. Can interact with certain medications. Leaves are edible and nutritious.', true, 'non_toxic',
        'Despite being called a weed, dandelion has powerful magical and medicinal properties. The name comes from French "dent de lion" (lion''s tooth) referring to its jagged leaves. Every part of the dandelion is useful. In medieval times, dandelion was called "priest''s crown" and was associated with sun gods. The tradition of blowing dandelion seeds to make wishes is ancient - it''s said that if you blow all the seeds off in one breath, your wish will come true. In folk magic, dandelion is used to call spirits, particularly of the deceased. The number of seeds left after blowing tells the time or answers yes/no questions.',
        'For wishes: Blow dandelion seeds while making a wish. If all seeds blow away in one breath, the wish will come true. For divination: Blow seeds and count those remaining for answers (odd=yes, even=no). Drink dandelion tea before divination to enhance psychic abilities. For spirit communication: Leave dried dandelion root on altar when calling ancestors. For messages: Write messages on dandelion fluff and release to send to spirits or the universe. Bury dried dandelion to make wishes manifest. The root is especially powerful in spirit work.',
        'Leaves are slightly bitter and green; roots are earthy; flowers are mildly sweet', true,
        'Asteraceae', 'Perennial herb', ARRAY['3-10'], ARRAY['Europe', 'Asia', 'North America'],
        'Spring for leaves, fall for roots, early summer for flowers', 
        'Harvest young leaves in spring before flowers appear. Dig roots in fall when energy returns to underground parts. Pick flowers in morning when fully open. Ensure area is pesticide-free.',
        ARRAY['dried leaves', 'dried roots', 'dried flowers', 'airtight containers'], '1 year dried',
        'Use for wish magic and manifestation. Add to divination rituals and spirit communication. Include in ancestor work. Use in psychic development. Add to prosperity spells (dandelion seeds represent abundance).',
        'Dry leaves and flowers on screens in single layers. Roots should be cleaned, chopped, and dried thoroughly - can take several weeks. Store all parts in airtight containers. Roots can be roasted for stronger magical properties.',
        true, 'Dandelion: Wish-granting herb for divination, spirit communication, and manifestation. Every part is useful.',
        admin_user_id, true
    ),

    -- Jasmine
    (
        'Jasmine', 'jasmine', ARRAY['Common Jasmine', 'Poet''s Jasmine'],
        ARRAY['flowers'], ARRAY['infusion', 'sachets', 'essential oil'],
        'A powerful herb for love, prosperity, and prophetic dreams. Jasmine attracts spiritual love and enhances psychic dreams.',
        'Use in love spells, attract prosperity, place under pillow for prophetic dreams, use in moon magic, add to money drawing, burn for spiritual love',
        'Generally safe. May cause allergic reactions. Ensure flowers are pesticide-free if using internally.',
        'Jasminum officinale',
        'Generally safe. May cause headaches in some people due to strong scent. Avoid essential oil during pregnancy. Ensure flowers are organic if using in teas.', true, 'non_toxic',
        'Jasmine has been treasured for its intoxicating scent for over 1,000 years. In India, jasmine is sacred and used in religious ceremonies and weddings. The flower is associated with the moon and moon goddesses across many cultures. In China, jasmine tea has been popular since the Song Dynasty. In Arabic and Persian love poetry, jasmine represents beauty and love. Jasmine is one of the most expensive essential oils due to the labor-intensive harvest - flowers must be picked at night when their scent is strongest. In magical traditions, jasmine is used to attract spiritual love, prophetic dreams, and prosperity.',
        'For love: Add dried jasmine flowers to love sachets or spell bags. Burn jasmine incense during love rituals. For prophetic dreams: Place jasmine flowers under pillow before sleep, especially during full moon. For prosperity: Add jasmine to money-drawing sachets or sprinkle around business. For moon magic: Use jasmine in lunar rituals and full moon ceremonies. For spiritual love: Burn jasmine while meditating on attracting a spiritually compatible partner. The scent alone is powerful - simply smelling jasmine flowers can raise vibrations and attract positive energy.',
        'Intensely sweet, floral, exotic, intoxicating', true,
        'Oleaceae', 'Perennial vine', ARRAY['7-10'], ARRAY['South Asia', 'Southeast Asia'],
        'Night time when flowers are most fragrant', 
        'Harvest flowers at night or early morning when scent is strongest. Pick when blooms are just opening. Handle gently as petals bruise easily. Best picked under full moon for magical purposes.',
        ARRAY['dried flowers', 'airtight containers', 'dark storage'], '6 months dried (scent fades over time)',
        'Use in love magic for spiritual and romantic love. Add to prosperity and money spells. Include in moon magic and lunar rituals. Place under pillow for prophetic dreams. Use in psychic development work.',
        'Dry flowers on screens in single layers in dark, dry place. Flowers dry quickly but lose scent over time. Store in airtight glass jars away from light. For best scent preservation, store in freezer. Use within 6 months for strongest magical properties.',
        true, 'Jasmine: Exotic flower for love, prosperity, and prophetic dreams. Sacred to the moon.',
        admin_user_id, true
    ),

    -- Calendula
    (
        'Calendula', 'calendula', ARRAY['Marigold', 'Pot Marigold'],
        ARRAY['flowers', 'petals'], ARRAY['infusion', 'oil infusion', 'sachets'],
        'A solar herb of protection, legal matters, and psychic powers. Calendula enhances clairvoyance and offers protection.',
        'Use in legal matters, add to protection spells, strengthen psychic powers, use in dream work, add to healing rituals, place under pillow for prophetic dreams',
        'Generally safe. May cause allergic reactions in those sensitive to Asteraceae family.',
        'Calendula officinalis',
        'Generally safe for most uses. May cause allergic reactions in those sensitive to Asteraceae family. Safe for skin application and internal use as tea.', true, 'non_toxic',
        'Calendula has been used for centuries in healing and magic. The Aztecs used calendula for spiritual and medicinal purposes. In medieval times, calendula was called "Mary''s Gold" and associated with the Virgin Mary. The flowers were used to summon visions and protect against evil. Hindu tradition uses calendula garlands in religious ceremonies and weddings. In the Victorian language of flowers, calendula meant "grief" or "despair," but in magical traditions it''s associated with the sun''s life-giving power. Calendula was believed to strengthen sight - both physical and psychic. The flowers open with the sun and close at night, making them solar symbols.',
        'For legal matters: Carry calendula petals in your pocket when going to court or legal proceedings. Place under your mattress to ensure favorable outcomes. For psychic powers: Add calendula to divination incenses or drink calendula tea before psychic work. For protection: Scatter petals around your home or add to protection sachets. For prophetic dreams: Place dried flowers under pillow. For sun magic: Use in solar rituals and summer celebrations. For respect: Add to spells to gain respect and admiration. Steep 1-2 teaspoons flowers in hot water for 10 minutes.',
        'Lightly spicy, slightly bitter with earthy undertones', true,
        'Asteraceae', 'Annual herb', ARRAY['2-11'], ARRAY['Southern Europe', 'Mediterranean'],
        'Throughout summer when flowers are fully open', 
        'Harvest flowers in mid-morning after dew dries, when fully open. Pick regularly to encourage more blooms. For magical use, harvest on sunny days when solar energy is strongest.',
        ARRAY['dried whole flowers', 'dried petals', 'airtight containers'], '1 year dried',
        'Use in legal matters and court case spells. Add to protection and warding magic. Include in psychic development and clairvoyance work. Use in sun magic and solar rituals. Add to healing incense and dream work.',
        'Dry flowers whole on screens or pull petals and dry separately. Dries quickly. Store away from light to preserve bright color. Flowers can be frozen for longer storage. Use yellow/orange petals for strongest solar magical properties.',
        true, 'Calendula: Solar flower for protection, legal matters, and psychic enhancement. Strengthens clairvoyance.',
        admin_user_id, true
    ),

    -- Frankincense
    (
        'Frankincense', 'frankincense', ARRAY['Olibanum', 'Boswellia'],
        ARRAY['resin'], ARRAY['burning', 'incense'],
        'Sacred resin for purification, protection, and spiritual connection. Frankincense raises vibrations and connects to the divine.',
        'Burn for purification, use in exorcism, enhance meditation, use in blessing rituals, burn for spiritual protection, add to solar magic',
        'Generally safe for burning. Not for internal use unless specifically prepared. May cause skin irritation for some.',
        'Boswellia sacra',
        'Generally safe for burning as incense. Do not ingest raw resin. May cause respiratory irritation in poorly ventilated areas. Resin tears are for external use only.', true, 'non_toxic',
        'Frankincense is one of the oldest and most sacred incenses, used for over 5,000 years. It was one of the gifts brought to baby Jesus by the Magi, symbolizing divinity. Ancient Egyptians used frankincense in temple rituals and offerings to Ra, the sun god. It was burned in ancient Greek and Roman temples. The trade in frankincense was so valuable it was literally worth its weight in gold. Arabian traders controlled frankincense routes for centuries. In the Old Testament, God commanded Moses to use frankincense in holy incense. Frankincense was used in religious ceremonies across ancient civilizations from Egypt to China.',
        'For purification: Burn frankincense resin on charcoal to cleanse spaces, objects, or people. For meditation: Burn before and during meditation to enhance spiritual connection. For protection: Burn frankincense while visualizing white protective light. For blessing: Use in blessing rituals for homes, tools, or people. For exorcism: Burn with myrrh to cleanse negative entities. For consecration: Pass ritual tools through frankincense smoke. For solar magic: Burn during daylight hours or solar celebrations. Use 1-2 small pieces of resin on lit charcoal.',
        'Sweet, resinous, woody, balsamic with citrus notes', false,
        'Burseraceae', 'Small tree', ARRAY['10-12'], ARRAY['Somalia', 'Oman', 'Yemen', 'Arabia'],
        'Harvested by tapping trees multiple times per year', 
        'Resin is harvested by making incisions in tree bark. Sap oozes out and hardens into "tears." Trees can be tapped multiple times. Sustainable harvesting is important as over-harvesting threatens wild populations.',
        ARRAY['airtight containers', 'cool dry place'], '2-3 years (indefinitely if stored properly)',
        'Burn for purification and space cleansing. Use in protection and warding. Add to meditation and spiritual work. Include in blessing and consecration rituals. Use in solar magic and divine connection work.',
        'Use resin tears on charcoal discs. Place small piece (pea-sized) on lit charcoal. Breaks into smaller pieces with knife if needed. Store in airtight jars away from heat. Can be ground into powder for incense blends.',
        false, 'Frankincense: Sacred resin for purification, protection, and divine connection. Ancient and powerful.',
        admin_user_id, true
    ),

    -- Myrrh
    (
        'Myrrh', 'myrrh', ARRAY['Gum Myrrh', 'Myrrha'],
        ARRAY['resin'], ARRAY['burning', 'incense'],
        'Ancient resin for protection, healing, and spiritual work. Myrrh is used in exorcism, purification, and connecting with the dead.',
        'Burn for protection, use in healing rituals, add to exorcism, use in funeral rites, enhance meditation, burn with frankincense for purification',
        'Generally safe for burning. Not for internal use unless specifically prepared. May cause skin irritation.',
        'Commiphora myrrha',
        'Generally safe for burning as incense. Do not ingest raw resin. May cause respiratory irritation in poorly ventilated areas. Can be toxic in large internal doses.', false, 'mildly_toxic',
        'Myrrh is one of the oldest known aromatic substances, used for over 5,000 years. Ancient Egyptians used myrrh in embalming and in rituals for the sun god Ra. It was one of the gifts given to Jesus by the Magi, symbolizing mortality and suffering. In ancient Greece, myrrh was sacred to Aphrodite. The name comes from the Arabic "murr" meaning bitter. According to Greek mythology, Myrrha was transformed into the myrrh tree. Ancient traders valued myrrh as highly as frankincense, and it was used extensively in temple incenses. In the Old Testament, myrrh was an ingredient in holy anointing oil. Across ancient cultures, myrrh was used in healing, purification, and funeral rites.',
        'For protection: Burn myrrh resin to create powerful protective barriers. For healing: Burn during healing rituals to enhance healing energy. For purification: Combine with frankincense and burn for deep spiritual cleansing. For exorcism: Burn to drive out negative entities and energies. For ancestor work: Burn when communicating with the deceased or during funeral rites. For meditation: Burn to deepen meditation and spiritual awareness. For consecration: Pass ritual tools through myrrh smoke. Use 1-2 small pieces on charcoal.',
        'Warm, earthy, slightly bitter, balsamic with smoky notes', false,
        'Burseraceae', 'Small tree', ARRAY['10-12'], ARRAY['Somalia', 'Ethiopia', 'Arabia', 'Yemen'],
        'Harvested by tapping trees in dry season', 
        'Resin is harvested by making cuts in tree bark during dry season. Sap oozes out and hardens into reddish-brown tears. Trees are tapped multiple times. Wild populations are threatened by over-harvesting.',
        ARRAY['airtight containers', 'cool dry place'], '2-3 years (can last indefinitely)',
        'Burn for protection and warding. Use in healing rituals and magic. Add to exorcism and banishing work. Include in funeral rites and ancestor communication. Use in purification with frankincense. Add to consecration rituals.',
        'Use resin tears on charcoal discs. Myrrh produces more smoke than frankincense. Use small pieces (pea-sized) on lit charcoal. Can be ground into powder for incense blends. Store in airtight containers away from heat and light.',
        false, 'Myrrh: Ancient resin for protection, healing, and spiritual work. Sacred purification tool.',
        admin_user_id, true
    ),

    -- Clove
    (
        'Clove', 'clove', ARRAY['Clove Bud'],
        ARRAY['buds'], ARRAY['burning', 'sachets', 'infusion'],
        'A fiery spice for protection, banishing, and attracting prosperity. Clove stops gossip and draws positive energy.',
        'Burn to stop gossip, use in protection spells, add to prosperity magic, use for banishing, carry for courage, use to attract good luck',
        'Safe in culinary amounts. Essential oil is very potent and can cause skin irritation. Avoid large amounts during pregnancy.',
        'Syzygium aromaticum',
        'Safe in culinary amounts. Essential oil is highly concentrated and can burn skin. Avoid large amounts during pregnancy. May interact with blood thinners.', false, 'mildly_toxic',
        'Cloves have been prized for thousands of years, originating in the Maluku Islands of Indonesia. In ancient China, those approaching the emperor had to chew cloves to sweeten their breath. The spice was so valuable that wars were fought over clove-producing islands. In medieval Europe, cloves were worth more than gold by weight. Pomanders made of oranges studded with cloves were carried to ward off plague. In magical traditions, cloves are associated with Jupiter and the element of fire. Cloves are known for their ability to stop gossip - biting a clove when someone is gossiping is said to stop them. The spice has been used in protection, prosperity, and banishing magic across many cultures.',
        'For stopping gossip: Burn cloves when you know people are talking about you, or carry cloves to stop gossip. Bite a clove to stop someone gossiping. For protection: Carry cloves in a red bag for protection. String cloves to create protective garlands. For prosperity: Place in wallet or cash register. Add to money-drawing sachets. For banishing: Burn cloves to drive away negative energy and influences. For courage: Carry whole cloves when facing challenging situations. For good luck: Carry or burn cloves to attract positive opportunities. Cloves work fast - good for spells needing quick results.',
        'Warm, spicy, sweet with numbing quality', false,
        'Myrtaceae', 'Evergreen tree', ARRAY['10-12'], ARRAY['Indonesia', 'Maluku Islands'],
        'Flower buds harvested before opening', 
        'Clove buds are harvested from trees when flower buds are pink but before they open. Buds are picked by hand and dried in sun until they turn dark brown. Commercial cloves are dried buds.',
        ARRAY['whole buds in airtight containers', 'cool dry place'], '3-4 years whole, 1 year ground',
        'Use in protection magic and warding. Add to prosperity and money spells. Burn to stop gossip and slander. Use in banishing and removal work. Carry for courage and strength. Add to good luck charms.',
        'Use whole cloves for strongest magical properties. Can be burned on charcoal, added to sachets, or carried whole. To grind, use mortar and pestle. Store whole cloves in airtight jars away from light. Retains potency for years when stored properly.',
        false, 'Clove: Fiery spice for protection, prosperity, and banishing. Stops gossip and attracts luck.',
        admin_user_id, true
    ),

    -- Cedar
    (
        'Cedar', 'cedar', ARRAY['Red Cedar', 'Western Red Cedar'],
        ARRAY['wood', 'leaves', 'bark'], ARRAY['burning', 'smudging'],
        'Sacred wood for purification, protection, and grounding. Cedar is used in cleansing rituals and to invite positive spirits.',
        'Burn for purification, use in protection magic, burn to invite positive spirits, use for grounding, add to prosperity spells, use in healing rituals',
        'Generally safe for burning. Avoid during pregnancy. May cause respiratory irritation in some individuals.',
        'Thuja plicata',
        'Generally safe for burning. Avoid burning near pregnant women. Can cause respiratory irritation in poorly ventilated spaces. Essential oil is toxic if ingested.', false, 'mildly_toxic',
        'Cedar has been sacred to indigenous peoples of North America for thousands of years and is one of the four sacred medicines in many Native traditions. In ancient Sumeria, cedar was used in purification rites. The ancient Egyptians used cedar oil in mummification. King Solomon''s temple was built with cedar wood. In Native American traditions, cedar is burned to purify spaces before ceremonies, to cleanse people and objects, and to invite positive spirits while warding off negative energies. Cedar is associated with longevity, strength, and protection. Its smoke is said to carry prayers to the Creator.',
        'For purification: Burn cedar to cleanse spaces before rituals or when moving into a new home. For protection: Burn cedar around your property or carry cedar chips in a protection sachet. For inviting positive spirits: Burn cedar to call in helpful ancestors and spirit guides. For grounding: Hold cedar wood during meditation to connect with earth energy. For healing: Burn during healing rituals to clear stagnant energy. For prosperity: Add cedar chips to money-drawing sachets. For nightmares: Place cedar under pillow to prevent bad dreams. Always burn with respect and proper ventilation.',
        'Woody, resinous, sweet, fresh, slightly spicy', false,
        'Cupressaceae', 'Evergreen tree', ARRAY['5-9'], ARRAY['North America', 'West Coast'],
        'Can be harvested year-round; best in late summer', 
        'Harvest needles, small branches, and bark sustainably from live trees. Never strip bark completely around a tree as this kills it. Thank the tree when harvesting. Commercial cedar products available.',
        ARRAY['dried wood chips', 'dried needles', 'airtight or breathable bags'], '2-3 years dried',
        'Burn for purification and space cleansing. Use in protection and warding magic. Add to grounding and centering work. Burn to invite positive spirits and ancestors. Include in healing rituals and prosperity spells.',
        'Dry needles and small branches by spreading on screens or hanging bundles. Wood can be shaved into chips or small pieces. Store in paper bags or wooden boxes. Burns well on charcoal or as smudge bundles. Produces sweet aromatic smoke.',
        false, 'Cedar: Sacred wood for purification, protection, and spiritual connection. Invites positive spirits.',
        admin_user_id, true
    ),

    -- Eucalyptus
    (
        'Eucalyptus', 'eucalyptus', ARRAY['Blue Gum', 'Silver Dollar'],
        ARRAY['leaves'], ARRAY['burning', 'infusion', 'sachets'],
        'A powerful healing and protective herb that clears negativity and promotes health. Eucalyptus purifies and protects.',
        'Use in healing magic, burn for purification, carry for protection, use in exorcism, hang for health, place around sickroom',
        'Safe for burning. Essential oil should not be ingested. May cause skin irritation if applied undiluted.',
        'Eucalyptus globulus',
        'Safe for burning and external use. Essential oil is toxic if ingested. Can cause skin irritation. Keep away from children and pets. May trigger breathing issues in sensitive individuals.', false, 'mildly_toxic',
        'Eucalyptus is native to Australia where Aboriginal peoples have used it medicinally and spiritually for thousands of years. The tree was introduced to other parts of the world in the 19th century. The name comes from Greek "eu" (well) and "kalyptos" (covered), referring to the flower bud cap. Eucalyptus is known for its healing properties and is associated with the moon and the element of water despite being a tree. In magical practice, eucalyptus is used for healing, protection, and purification. Its strong scent is believed to ward off illness and negative spirits. Eucalyptus is often placed around sickrooms or hung over beds for healing.',
        'For healing: Burn eucalyptus during healing rituals or hang fresh branches in sickroom. For protection: Carry dried eucalyptus leaves in a green sachet for ongoing protection. For purification: Burn or add to purification baths to clear negative energy. For exorcism: Burn eucalyptus with other protective herbs to drive out unwanted entities. For health: Hang eucalyptus in your home, especially near beds, to promote health and prevent illness. For clarity: Burn to clear mental fog and promote mental healing. Eucalyptus smoke is purifying and invigorating.',
        'Fresh, camphoraceous, menthol-like, clean, medicinal', false,
        'Myrtaceae', 'Evergreen tree', ARRAY['8-11'], ARRAY['Australia'],
        'Year-round in warm climates', 
        'Harvest mature leaves year-round in appropriate climates. Cut branch tips with sharp clean shears. Fresh leaves are most potent. Trees grow quickly and can handle regular harvesting.',
        ARRAY['dried leaves', 'hung bundles', 'airtight containers'], '1-2 years dried',
        'Use in healing magic and health spells. Burn for purification and cleansing. Add to protection charms. Use in exorcism and banishing work. Include in moon magic. Hang in home for ongoing health protection.',
        'Hang branches upside down to dry in bundles or strip leaves and dry on screens. Leaves dry relatively quickly. Store dried leaves in airtight jars. Fresh branches can be hung in shower for aromatic steam. Both fresh and dried are magically potent.',
        false, 'Eucalyptus: Healing tree for purification, protection, and health. Clears negativity.',
        admin_user_id, true
    ),

    -- Lemon Balm
    (
        'Lemon Balm', 'lemon-balm', ARRAY['Melissa', 'Bee Balm'],
        ARRAY['leaves'], ARRAY['infusion', 'sachets', 'fresh'],
        'A gentle herb for love, healing, and success. Lemon balm attracts love and brings emotional healing.',
        'Use in love spells, promote healing, attract success, use for emotional balance, add to solar magic, use in renewal rituals',
        'Generally safe. May cause drowsiness. Avoid large amounts during pregnancy.',
        'Melissa officinalis',
        'Generally safe. May cause drowsiness when combined with sedatives. Avoid large amounts during pregnancy. Safe for most topical and internal uses.', true, 'non_toxic',
        'Lemon balm has been cultivated for over 2,000 years. Its genus name Melissa comes from the Greek word for honeybee, as the plant is beloved by bees. Ancient Greeks dedicated lemon balm to the goddess Diana. In medieval times, lemon balm was used to reduce stress and anxiety, help with sleep, and lift spirits. Paracelsus called lemon balm the "elixir of life." In the Victorian language of flowers, lemon balm meant sympathy. The herb was used in love potions and to attract romantic partners. Its sunny energy and lemon scent make it associated with joy, renewal, and success. It''s been used in magic to heal broken hearts and attract new love.',
        'For love: Add lemon balm to love sachets or drink as tea to attract love. Carry to attract a romantic partner. For healing: Drink lemon balm tea for emotional healing, especially from heartbreak. For success: Add to success spells and career magic. Carry when seeking new opportunities. For happiness: Drink tea or carry leaves to promote emotional balance and joy. For renewal: Use in rituals about new beginnings and fresh starts. For solar magic: Use in sun-related rituals as lemon balm is associated with solar energy. Fresh leaves are most potent but dried also work well.',
        'Lemon-scented, fresh, slightly sweet, herbaceous', true,
        'Lamiaceae', 'Perennial herb', ARRAY['4-9'], ARRAY['Mediterranean', 'Southern Europe'],
        'Before flowering in early summer for best flavor', 
        'Harvest leaves before flowering for sweetest flavor. Cut stems 4-6 inches from growing tips in morning after dew dries. Can harvest multiple times per season. Plant spreads readily.',
        ARRAY['dried leaves', 'airtight containers'], '6-12 months (loses scent over time)',
        'Use in love magic to attract romantic partners. Add to emotional healing work and heartbreak spells. Include in success and prosperity magic. Use for emotional balance and happiness. Add to solar rituals and summer celebrations.',
        'Dry leaves on screens or by hanging small bundles. Dries relatively quickly but loses scent faster than many herbs. Store in airtight jars in dark place. Best used within 6 months. Fresh leaves have stronger scent and can be used in many ways.',
        true, 'Lemon Balm: Gentle herb for love, healing, and success. Brings emotional balance and joy.',
        admin_user_id, true
    ),

    -- Wormwood
    (
        'Wormwood', 'wormwood', ARRAY['Artemisia', 'Absinthe'],
        ARRAY['leaves'], ARRAY['burning', 'infusion', 'sachets'],
        'A powerful herb for psychic powers, spirit communication, and protection. Wormwood enhances divination and astral travel.',
        'Burn before divination, use in spirit work, carry for protection, use in astral travel, add to psychic development, burn to enhance clairvoyance',
        'Toxic if taken internally in large amounts. Use with caution. Not for internal use. Avoid during pregnancy.',
        'Artemisia absinthium',
        'Toxic in large doses due to thujone content. Do NOT ingest. Safe for burning in small amounts. Avoid skin contact. Avoid during pregnancy. Can cause seizures in high doses.', false, 'toxic',
        'Wormwood has a long history in magic and medicine. Named after Artemis, Greek goddess of the hunt and moon, wormwood has been used for thousands of years. In ancient Egypt, wormwood was used in funerary rites. The Bible mentions wormwood multiple times, often symbolizing bitterness and sorrow. In medieval times, wormwood was used to protect against evil spirits and poisoning. It''s a key ingredient in absinthe, the infamous "green fairy" drink associated with artists and mystics. In magical practice, wormwood is powerful for spirit communication, divination, and psychic enhancement. It''s said to help one see spirits and travel between worlds. Handle with great respect.',
        'For divination: Burn small amounts of dried wormwood before tarot reading, scrying, or other divination to enhance psychic abilities. For spirit communication: Burn during séances or when calling ancestors (use sparingly in well-ventilated area). For protection: Carry small amount in a protection sachet, especially during spirit work. For astral travel: Burn very small amount during astral projection work. For psychic development: Add tiny amounts to psychic enhancement incenses. IMPORTANT: Use sparingly, burn in well-ventilated areas, never ingest, and treat with respect. Wormwood is powerful and potentially dangerous.',
        'Intensely bitter, herbaceous, slightly woody, pungent', false,
        'Asteraceae', 'Perennial herb', ARRAY['4-9'], ARRAY['Europe', 'Asia', 'North Africa'],
        'Before flowering in mid-summer', 
        'Harvest leaves and flowering tops before full flowering. Cut in morning after dew dries. Wear gloves as some people have skin sensitivity. Handle with care and respect for this potent plant.',
        ARRAY['dried leaves', 'airtight containers', 'labeled clearly'], '1-2 years dried',
        'Burn for psychic enhancement and divination. Use in spirit communication and ancestor work. Add to astral travel and dreamwork. Include in protection magic, especially for psychic protection. Use in scrying and clairvoyance work.',
        'Dry by hanging small bundles in dark, well-ventilated area away from food and other herbs. Store in clearly labeled containers away from children and pets. Use very small amounts when burning. Never ingest. Treat as a powerful, potentially dangerous ally.',
        false, 'Wormwood: Powerful herb for psychic work, spirit communication, and divination. Use with caution - toxic.',
        admin_user_id, true
    ),

    -- Vervain
    (
        'Vervain', 'vervain', ARRAY['Verbena', 'Herb of Grace'],
        ARRAY['leaves', 'flowers'], ARRAY['infusion', 'burning', 'sachets'],
        'A sacred herb of purification, protection, and divination. Vervain is used in consecration, love magic, and spiritual work.',
        'Use in purification baths, consecrate ritual tools, use in love spells, enhance divination, use for protection, add to peace magic',
        'Generally safe. May cause skin irritation in sensitive individuals. Avoid during pregnancy.',
        'Verbena officinalis',
        'Generally safe for most uses. May cause skin sensitivity in some people. Avoid during pregnancy as it may stimulate uterus. Can interact with blood pressure medications.', true, 'non_toxic',
        'Vervain is one of the most sacred herbs in European magical traditions. Ancient Druids considered vervain sacred and used it in ritual purification. Romans called it "herba sacra" (sacred herb) and used it to purify temple altars. In ancient Greece, vervain was used to clean Jupiter''s altar. Medieval Christians called it "herb of the cross" believing it staunched Jesus''s wounds. Vervain was used in ancient love potions and peace negotiations. It''s one of the seven sacred herbs of the Druids. In the Victorian language of flowers, vervain symbolized enchantment. Vervain is powerful in purification, protection, consecration, love, peace, and spiritual work.',
        'For purification: Add vervain to ritual baths for deep spiritual cleansing. For consecration: Make vervain water to consecrate altar tools and ritual items. For love: Add to love sachets and potions. Wear to attract love. For divination: Burn before divination or anoint third eye with vervain oil. For protection: Carry vervain for protection, especially psychic protection. For peace: Use in peace and anti-anxiety magic. Steep dried herb in water, strain, and use the water to anoint tools, self, or ritual space. Vervain gathered at Midsummer is especially powerful.',
        'Green, slightly bitter, herbaceous with mild sweet notes', true,
        'Verbenaceae', 'Perennial herb', ARRAY['4-8'], ARRAY['Europe', 'Asia'],
        'Summer when in full flower', 
        'Harvest aerial parts (leaves and flowers) when plant is in full bloom. Cut stems 6-8 inches from top. Traditionally harvested at Midsummer for strongest magical properties. Harvest in morning after dew dries.',
        ARRAY['dried leaves and flowers', 'airtight containers'], '1 year dried',
        'Use in purification and cleansing rituals. Consecrate ritual tools and sacred spaces. Add to love magic and attraction spells. Include in divination and psychic work. Use for protection and warding. Add to peace and harmony spells.',
        'Tie stems in small bundles and hang to dry in dark, well-ventilated space. Can also dry leaves and flowers on screens. Store in airtight jars away from light. Make vervain water by steeping dried herb in water for ritual use.',
        true, 'Vervain: Sacred herb for purification, protection, and divination. Used in consecration and love magic.',
        admin_user_id, true
    ),

    -- St. John's Wort
    (
        'St. John''s Wort', 'st-johns-wort', ARRAY['Hypericum', 'Goatweed'],
        ARRAY['flowers', 'leaves'], ARRAY['oil infusion', 'burning', 'sachets'],
        'A solar herb for protection, exorcism, and happiness. St. John''s Wort banishes negativity and brings light into darkness.',
        'Use for protection, burn to banish negativity, use in exorcism, promote happiness, use in solar magic, enhance courage',
        'Safe for external use. Can cause sun sensitivity. Interacts with many medications. Avoid during pregnancy.',
        'Hypericum perforatum',
        'Safe for external use but causes photosensitivity - avoid sun exposure after use. Interacts with many medications including antidepressants, birth control. Do not take internally without medical guidance. Avoid during pregnancy.', false, 'mildly_toxic',
        'St. John''s Wort has been used for over 2,000 years. Named after St. John the Baptist as it blooms around his feast day (June 24), though its use predates Christianity. Ancient Greeks used it to ward off evil spirits. In medieval times, people hung St. John''s Wort over doors on Midsummer Eve to protect against evil, witchcraft, and storms. The red "juice" from crushed flowers was said to represent the blood of St. John. Burning the herb was believed to banish negative entities. In magical practice, St. John''s Wort is strongly associated with the sun, protection, and banishing darkness both literal and metaphorical. It''s particularly powerful when gathered at Midsummer.',
        'For protection: Hang above doors and windows to protect home. Carry for personal protection. For banishing: Burn to drive away negative energy, depression, and evil spirits. For exorcism: Burn with other protective herbs to cleanse spaces of negative entities. For happiness: Carry or burn to lift spirits and bring joy. For courage: Carry when facing fears or challenges. For solar magic: Use in Midsummer celebrations and solar rituals. Most powerful when harvested at Summer Solstice or St. John''s Day (June 24). The flowers produce red oil - use in protection oils.',
        'Herbaceous, slightly sweet, hay-like with lemon notes', true,
        'Hypericaceae', 'Perennial herb', ARRAY['5-9'], ARRAY['Europe', 'Asia'],
        'Midsummer (around June 24) for maximum magical potency', 
        'Harvest flowers and tops when in full bloom, traditionally on St. John''s Day (June 24) or around Summer Solstice. Pick in morning after dew dries. Fresh flowers can be infused in oil; dried flowers for burning.',
        ARRAY['dried flowers', 'oil-infused flowers', 'airtight containers'], '1 year dried, 6 months for oil',
        'Use in protection magic and warding. Burn for banishing and exorcism. Add to happiness and anti-depression spells. Include in solar magic and Midsummer rituals. Use for courage and strength. Add to house blessing rituals.',
        'Dry flowers and leaves on screens or hang small bundles. To make red oil: pack fresh flowers in jar, cover with olive oil, leave in sun for 2-4 weeks until oil turns red. Store dried herb in airtight jars. Both dried herb and red oil are powerful in magic.',
        false, 'St. John''s Wort: Solar herb for protection, banishing, and happiness. Drives away darkness and negativity.',
        admin_user_id, true
    ),

    -- Catnip
    (
        'Catnip', 'catnip', ARRAY['Catmint', 'Nepeta'],
        ARRAY['leaves', 'flowers'], ARRAY['infusion', 'sachets', 'toys'],
        'An herb of love, beauty, and happiness. Catnip attracts good spirits and creates bonds between humans and cats. Used in attraction magic.',
        'Use in love spells, attract a familiar, create happiness, use in beauty magic, give to cats as offering, use in friendship magic',
        'Generally safe. Safe for cats in moderation. May cause drowsiness in humans.',
        'Nepeta cataria',
        'Generally safe for humans and cats. May cause mild sedation in humans. Cats can safely enjoy catnip - it''s non-addictive and harmless. Avoid large amounts during pregnancy.', true, 'non_toxic',
        'Catnip has been used medicinally and magically for centuries. Ancient Egyptians revered cats and likely used catnip. Romans used catnip before the introduction of tea from China. In medieval herb gardens, catnip was grown for medicinal teas. The famous euphoric effect on cats was noted in European texts as early as the 1600s. In magical practice, catnip is associated with cat goddesses like Bastet and Freyja. It''s used to attract a cat familiar, create bonds with cats, and in spells involving love and happiness. The herb creates a euphoric state in many cats due to nepetalactone, which mimics feline pheromones.',
        'For attracting a familiar: Grow catnip in your garden or place dried catnip in corners of your home to attract a cat companion. For love: Add to love sachets or spells to attract a gentle, playful partner. For happiness: Make catnip tea to promote joy and relaxation. For beauty: Use in glamour magic and beauty spells. For cat magic: Offer catnip to your cat before magical work to honor them as your familiar. For friendship: Include in friendship spells and charms. For bonding: Share catnip with your cat during ritual work to deepen your magical bond.',
        'Minty, slightly lemony, herbaceous', true,
        'Lamiaceae', 'Perennial herb', ARRAY['3-9'], ARRAY['Europe', 'Asia'],
        'Summer when flowering for strongest potency', 
        'Harvest leaves and flowers in summer when in bloom. Cut stems 4-6 inches from top. Best harvested in morning after dew dries. Plant attracts cats so protect while growing if needed.',
        ARRAY['dried leaves', 'dried flowers', 'airtight containers'], '1-2 years dried',
        'Use in love and attraction spells. Add to beauty and glamour magic. Include in happiness and joy spells. Use to attract or honor cat familiars. Add to friendship and bonding magic.',
        'Dry by spreading on screens or hanging bundles. Dries quickly. Store in airtight containers away from curious cats until ready to use. Can also freeze fresh catnip. Keeps potency well when dried properly.',
        true, 'Catnip: Herb of love, happiness, and cat magic. Used to attract familiars and create bonds.',
        admin_user_id, true
    ),

    -- Dill
    (
        'Dill', 'dill', ARRAY['Dill Weed', 'Dill Seed'],
        ARRAY['leaves', 'seeds'], ARRAY['infusion', 'sachets', 'charm bags'],
        'A protective herb for luck, money, and love. Dill protects children, attracts love, and breaks hexes.',
        'Hang over cradles for protection, use in money spells, add to love magic, break hexes, carry for luck, use in lust magic',
        'Generally safe. Safe in culinary amounts. May cause skin sensitivity in some individuals.',
        'Anethum graveolens',
        'Generally safe. Safe in culinary amounts. May cause skin photosensitivity in sensitive individuals. Avoid large amounts during pregnancy. Safe for most external and internal uses.', true, 'non_toxic',
        'Dill has been used for thousands of years in magic and medicine. Ancient Egyptians used dill medicinally. Romans gave dill to gladiators for strength and courage. In medieval Europe, dill was used to protect against witchcraft - hanging dill over doorways and cradles was believed to ward off evil. The name comes from Old Norse "dilla" meaning to lull or soothe, as dill was used to calm babies. In magical traditions, dill has long been used for protection, love, money, and luck. Brides carried dill in their bouquets, and dill was placed in cradles to protect infants. It''s also been used to break curses and hexes.',
        'For protection: Hang dill over doors and windows, especially over children''s rooms and cradles. For money: Add dill seeds to money-drawing sachets or place in wallet. For love: Include dill in love spells and carry to attract a partner. For lust: Add to passion and desire magic. For hex breaking: Burn dill to break curses or add to reversal spell bags. For luck: Carry dill seeds for good fortune. For blessings: Add to bath water for cleansing and blessing. Dill seeds are more potent for magic than leaves.',
        'Fresh, tangy, slightly sweet with anise notes', true,
        'Apiaceae', 'Annual herb', ARRAY['2-11'], ARRAY['Mediterranean', 'Southern Russia'],
        'Leaves before flowering, seeds after flowering', 
        'Harvest leaves (dill weed) before plant flowers for best flavor. After flowering, allow seed heads to mature and turn brown, then harvest seeds. Cut whole seed heads and dry in paper bags.',
        ARRAY['dried leaves', 'dried seeds', 'airtight containers'], '1 year for leaves, 2-3 years for seeds',
        'Hang over doorways and cradles for protection. Add to money and prosperity spells. Use in love and lust magic. Include in hex-breaking and curse-removal work. Carry for luck and good fortune.',
        'Dry leaves by hanging or spreading on screens. For seeds, cut seed heads when turning brown, place in paper bags to finish drying. Seeds will drop from heads. Store leaves and seeds separately in airtight jars.',
        true, 'Dill: Protective herb for luck, money, and love. Guards children and breaks hexes.',
        admin_user_id, true
    ),

    -- Ginger
    (
        'Ginger', 'ginger', ARRAY['Ginger Root'],
        ARRAY['root'], ARRAY['powder', 'fresh', 'infusion'],
        'A fiery root for power, success, and love. Ginger speeds manifestation and adds power to any spell.',
        'Add to power spells, use for success, speed up spells, use in love magic, add to prosperity, use in healing magic',
        'Safe in culinary amounts. May cause heartburn. May interact with blood thinners.',
        'Zingiber officinale',
        'Safe in culinary amounts. May cause heartburn or stomach upset in large amounts. Can interact with blood thinners. Generally safe for most uses. Avoid large amounts during pregnancy.', true, 'non_toxic',
        'Ginger has been cultivated for over 5,000 years, originating in Southeast Asia. Ancient Chinese and Indian cultures used ginger extensively in medicine. Romans imported ginger from Asia and it became extremely valuable. In medieval Europe, ginger was second only to pepper in popularity. Ginger was used in gingerbread and preserved ginger. In magical practice, ginger is associated with fire and Mars. It''s known for adding power and speed to any magical working. Ginger "heats up" spells and manifests results quickly. Eating ginger before performing magic was believed to increase personal power.',
        'For power: Add ground ginger to any spell to increase its power and effectiveness. For success: Carry fresh ginger root or sprinkle ground ginger where you need success. For love: Add to love spells to heat up passion and desire. For prosperity: Plant ginger root in a pot with coins buried beneath it for growing wealth. For healing: Use in healing magic to speed recovery. For courage: Eat candied ginger or drink ginger tea before challenging situations. For manifestation: Add ginger to spells that need to work quickly. Ginger is especially powerful in fire magic and solar rituals.',
        'Spicy, warm, pungent, slightly sweet', false,
        'Zingiberaceae', 'Perennial herb', ARRAY['9-12'], ARRAY['Southeast Asia', 'India', 'China'],
        'Fall when leaves die back (8-10 months after planting)', 
        'Ginger root is harvested 8-10 months after planting when leaves die back. Dig up rhizomes carefully. Young ginger is milder; mature ginger is more pungent. Save some rhizomes for replanting.',
        ARRAY['fresh refrigerated', 'dried/ground', 'frozen', 'airtight containers'], '3 weeks fresh refrigerated, 2-3 years ground',
        'Add to spells for power and effectiveness. Use in success and achievement magic. Include in love and passion work. Add to prosperity and wealth spells. Use in healing magic. Include in fire and solar rituals.',
        'Fresh ginger can be refrigerated or frozen. To dry: slice thinly and dry on screens or in dehydrator. Grind dried ginger in spice grinder. Ground ginger loses potency faster than fresh. Store ground ginger in airtight jars away from light.',
        false, 'Ginger: Fiery root for power, success, and love. Speeds manifestation and strengthens spells.',
        admin_user_id, true
    ),

    -- Hyssop
    (
        'Hyssop', 'hyssop', ARRAY['Holy Herb'],
        ARRAY['leaves', 'flowers'], ARRAY['infusion', 'burning', 'bath'],
        'A powerful purification herb for cleansing, protection, and sacred work. Hyssop removes negativity and blesses sacred spaces.',
        'Use in purification baths, cleanse sacred spaces, remove hexes, use in blessing rituals, add to protection magic, cleanse ritual tools',
        'Generally safe. May cause skin irritation in sensitive individuals. Avoid essential oil during pregnancy.',
        'Hyssopus officinalis',
        'Generally safe for most uses. May cause skin irritation in some people. Essential oil should be avoided during pregnancy and by those with epilepsy. Safe in moderate amounts for tea and bathing.', true, 'non_toxic',
        'Hyssop is one of the most ancient sacred herbs, mentioned numerous times in the Bible. In Psalms 51:7, "Purge me with hyssop, and I shall be clean." Ancient Hebrews used hyssop in purification rituals and to mark doorways during Passover. Greeks used hyssop for respiratory ailments and cleansing temples. Medieval monks grew hyssop in monastery gardens for medicinal and spiritual use. In magical practice, hyssop is one of the most powerful herbs for purification and removing negativity. It''s used to cleanse people, spaces, objects, and to break hexes. Hyssop water is sacred and used in blessing rituals across many traditions.',
        'For purification: Add hyssop to ritual baths for deep spiritual cleansing. Make hyssop tea or infusion and use to wash floors, walls, and doorways. For blessing: Make hyssop water (steep herb in water) and sprinkle around home or sacred space. For hex removal: Add hyssop to uncrossing baths and rituals. For consecration: Use hyssop water to bless and consecrate ritual tools, altars, and sacred objects. For protection: Hang dried hyssop over doorways or add to protection sachets. For cleansing: Add to floor washes and spiritual baths before ritual work. Very powerful for all purification work.',
        'Minty, slightly bitter, camphoraceous with sweet undertones', true,
        'Lamiaceae', 'Perennial herb', ARRAY['4-9'], ARRAY['Southern Europe', 'Middle East'],
        'Summer when flowering for maximum potency', 
        'Harvest leaves and flowers in summer when in full bloom. Cut stems 4-6 inches from growing tips. Best harvested on sunny mornings after dew dries. Can harvest multiple times per season.',
        ARRAY['dried leaves and flowers', 'airtight containers'], '1 year dried',
        'Use in purification and cleansing rituals. Add to blessing and consecration work. Include in hex-breaking and curse-removal. Use for protection and warding. Add to sacred space cleansing.',
        'Tie stems in small bundles and hang to dry in dark, well-ventilated area. Can also strip leaves and flowers and dry on screens. Store in airtight jars. Make hyssop water by steeping dried herb in hot water and straining.',
        true, 'Hyssop: Sacred herb for purification, protection, and blessing. Powerful cleanser of negativity.',
        admin_user_id, true
    ),

    -- Fennel
    (
        'Fennel', 'fennel', ARRAY['Sweet Fennel'],
        ARRAY['seeds', 'leaves'], ARRAY['infusion', 'sachets', 'burning'],
        'An herb of protection, healing, and purification. Fennel wards off evil spirits and provides courage.',
        'Hang for protection, carry for courage, use in healing spells, ward off evil spirits, use in purification, add to weight loss magic',
        'Generally safe in culinary amounts. May cause allergic reactions. Avoid large amounts during pregnancy.',
        'Foeniculum vulgare',
        'Generally safe in culinary amounts. May cause allergic reactions in those sensitive to Apiaceae family. Avoid large medicinal amounts during pregnancy. Seeds are safe for most uses.', true, 'non_toxic',
        'Fennel has been used since ancient times. Greeks called it "marathon" after the battle site where fennel grew abundantly. Romans used fennel for courage - gladiators consumed fennel before fights. Pliny listed it for treating 22 ailments. In medieval times, fennel was hung over doors on Midsummer Eve to protect against evil spirits and witchcraft. Anglo-Saxons considered it one of the nine sacred herbs. Fennel seeds were traditionally eaten during fasting to suppress hunger. In magical traditions, fennel provides protection, healing, and purification. It was believed that serpents rubbed against fennel to restore their sight, making it associated with vision and clarity.',
        'For protection: Hang fennel over doorways and windows to ward off evil spirits. Carry fennel seeds in a protection sachet. For courage: Eat fennel seeds or carry them before facing fears or challenges. For healing: Add fennel to healing spells and incenses. For purification: Burn fennel seeds to purify and consecrate spaces. For psychic protection: Hang fennel in your home to protect against psychic attack. For strength: Carry fennel to increase physical and spiritual strength. For vision: Use in spells for clarity and seeing truth. Traditionally gathered at Midsummer for strongest protection.',
        'Sweet, licorice-like, aromatic', true,
        'Apiaceae', 'Perennial herb', ARRAY['5-10'], ARRAY['Mediterranean'],
        'Seeds in late summer/fall, leaves throughout season', 
        'Harvest leaves throughout growing season. Allow flowers to mature into seed heads. Harvest seeds when seed heads turn brown. Cut seed heads and dry in paper bags. Seeds will drop when fully dry.',
        ARRAY['dried seeds', 'dried leaves', 'airtight containers'], '2-3 years for seeds, 1 year for leaves',
        'Hang over doorways for protection. Use in healing magic and health spells. Add to purification rituals. Carry for courage and strength. Include in psychic protection work. Use in vision and clarity spells.',
        'For seeds: cut seed heads when turning brown, place in paper bags to finish drying. Store dried seeds in airtight jars. For leaves: dry on screens or hang in bundles. Both keep well when stored properly.',
        true, 'Fennel: Protective herb for courage, healing, and warding. Guards against evil spirits.',
        admin_user_id, true
    ),

    -- Valerian
    (
        'Valerian', 'valerian', ARRAY['Garden Heliotrope', 'All-Heal'],
        ARRAY['root'], ARRAY['infusion', 'sachets', 'tincture'],
        'A powerful herb for love, sleep, and purification. Valerian is used to compel love, bring peace, and in cat magic.',
        'Use in love spells, promote restful sleep, purify spaces, use in cat magic, calm arguments, force love or cooperation',
        'Safe for most uses but has strong odor. May cause drowsiness. Avoid with sedatives. Not for long-term use.',
        'Valeriana officinalis',
        'Safe in moderate amounts but causes drowsiness. Do not combine with sedatives or alcohol. Not for long-term continuous use. Has strong, unpleasant odor that cats love. May cause headaches in some people.', true, 'non_toxic',
        'Valerian has been used medicinally for over 2,000 years. Ancient Greeks and Romans used it for sleep and calming. The name may derive from Latin "valere" meaning to be strong and healthy. In medieval times, valerian was used to treat plague and epilepsy. During WWI and WWII, it was used to treat shell shock. In magical traditions, valerian root is powerful in love magic - particularly to compel love or force cooperation. The root''s strong smell attracts cats (similar to catnip) and it''s used in cat magic. Despite its unpleasant smell to humans, valerian is powerful for sleep, peace, and purification. It''s sometimes called "Pied Piper herb" for its use in rat and pest spells.',
        'For love: Add valerian root to love spells, particularly those meant to compel or draw a specific person (use ethically). For sleep: Place dried root under pillow for deep, restful sleep. For peace: Add to spells to calm arguments and bring peace to troubled relationships or situations. For purification: Burn or add to purification sachets despite strong odor. For cat magic: Offer to cat familiars or use to attract cats. For protection: Hang in home for protection while sleeping. For cooperation: Use in spells to make people more cooperative (again, ethics matter). Strong but effective.',
        'Strong, earthy, musty, unpleasant to humans (attractive to cats)', false,
        'Caprifoliaceae', 'Perennial herb', ARRAY['4-8'], ARRAY['Europe', 'Asia'],
        'Fall of second year when roots are most potent', 
        'Roots are harvested in fall of plant''s second year. Dig carefully and wash thoroughly. Roots have strongest medicinal and magical properties. Fresh roots smell even stronger than dried.',
        ARRAY['dried roots', 'airtight containers', 'separate storage'], '2-3 years dried',
        'Use in love magic and attraction spells. Add to sleep and dream work. Include in peace and harmony spells. Use in cat magic and familiar work. Add to purification despite strong scent.',
        'Wash roots thoroughly and chop into small pieces. Dry in well-ventilated area - smell is very strong. Store in airtight jars away from other herbs due to odor. Label clearly. Despite smell, magically very powerful.',
        false, 'Valerian: Powerful root for love, sleep, and cat magic. Strong-smelling but effective.',
        admin_user_id, true
    ),

    -- Angelica
    (
        'Angelica', 'angelica', ARRAY['Archangel', 'Holy Ghost Root'],
        ARRAY['root', 'seeds', 'leaves'], ARRAY['infusion', 'sachets', 'charm bags'],
        'A powerful protective herb associated with angels and divine protection. Angelica breaks curses and provides guardian blessing.',
        'Use for protection, break hexes, ward off evil, invoke angels, use in exorcism, protect children, bless homes',
        'Safe in moderate amounts. May cause skin photosensitivity. Avoid during pregnancy.',
        'Angelica archangelica',
        'Safe in moderate amounts. Can cause photosensitivity - avoid sun exposure after use. Avoid during pregnancy. May interact with blood thinners. Root is most commonly used part.', false, 'mildly_toxic',
        'Angelica is named for the Archangel Michael and has been considered a gift from angels. Legend says an angel revealed angelica to a monk as a cure for plague. It was so highly regarded for protection against disease that it was called the "Root of the Holy Ghost." In medieval times, angelica was one of the most important magical herbs, used to ward off evil spirits, break curses, and provide divine protection. Vikings carried angelica root as protection during travels. In Nordic countries, angelica is still woven into garlands and worn for protection. The plant is associated with the element of fire and the sun, despite growing in cool climates. It''s particularly powerful for calling on angelic protection.',
        'For protection: Carry angelica root in a white or purple sachet for divine protection. For exorcism: Burn angelica root to drive out negative spirits and entities. For hex breaking: Add to uncrossing baths and curse-removal spells. For angelic invocation: Burn angelica when calling upon angels or archangels for assistance. For blessings: Add to house blessing rituals and protection of children. For purification: Add to purification incenses and spiritual baths. For visions: Use in rituals seeking divine guidance. Root is most powerful part. Especially effective when blessed or consecrated.',
        'Sweet, musky, earthy with licorice notes', false,
        'Apiaceae', 'Biennial/Perennial', ARRAY['4-9'], ARRAY['Northern Europe', 'Russia', 'Iceland'],
        'Seeds in late summer, roots in fall of second year', 
        'Seeds ripen in late summer - harvest when seed heads turn brown. Roots are harvested in fall of plant''s second year before winter. Leaves can be harvested in first year. Handle with care as plant can cause skin sensitivity.',
        ARRAY['dried roots', 'dried seeds', 'airtight containers'], '2-3 years for roots and seeds',
        'Use in protection magic and warding. Add to exorcism and banishing rituals. Include in hex-breaking and curse-removal. Use to invoke angels and divine protection. Add to blessing ceremonies. Use in purification work.',
        'Roots should be washed, chopped, and dried thoroughly. Seeds can be dried in paper bags. Store separately in airtight jars. Label clearly. Handle with care during harvest as plant can cause photosensitivity.',
        false, 'Angelica: Divine herb for protection, exorcism, and angelic invocation. Breaks curses.',
        admin_user_id, true
    ),

    -- Oregano
    (
        'Oregano', 'oregano', ARRAY['Wild Marjoram', 'Pot Marjoram'],
        ARRAY['leaves'], ARRAY['infusion', 'burning', 'cooking'],
        'An herb of joy, peace, and letting go. Oregano releases the past, brings happiness, and eases transitions.',
        'Use for letting go, ease grief, promote joy, use in transition rituals, bring peace, use in legal matters',
        'Generally safe. Safe in culinary amounts. May cause allergic reactions in sensitive individuals.',
        'Origanum vulgare',
        'Generally safe. Safe in culinary amounts. May cause allergic reactions in those sensitive to Lamiaceae family. Essential oil should be diluted. Generally safe for most uses.', true, 'non_toxic',
        'Oregano''s name comes from Greek "oros" (mountain) and "ganos" (joy), literally meaning "joy of the mountain." Ancient Greeks believed that Aphrodite created oregano as a symbol of happiness. If oregano grew on a grave, it was a sign that the deceased''s spirit was happy in the afterlife. Romans crowned newlyweds with oregano for joy and prosperity. In medieval times, oregano was used in love magic. In folk magic, oregano is particularly powerful for letting go - of relationships, grief, the past, and anything that no longer serves. It brings joy, eases transitions, and helps in legal matters. Oregano growing on a grave means peace for the departed.',
        'For letting go: Burn oregano to release old patterns, relationships, or grief. Write what you need to release on paper, wrap with oregano, and burn. For joy: Carry oregano to attract happiness and lift spirits. For peace: Add oregano to peace spells and calming magic. For grief: Use oregano in rituals to ease grief and help with healing after loss. For transitions: Include in spells about life changes, moving, new beginnings. For legal matters: Carry oregano when dealing with legal issues, especially divorce or separations. For the deceased: Place oregano on graves or altars to bring peace to departed spirits. Oregano helps with endings and new beginnings.',
        'Warm, aromatic, slightly bitter, camphoraceous', true,
        'Lamiaceae', 'Perennial herb', ARRAY['5-10'], ARRAY['Mediterranean', 'Western Asia'],
        'Before flowering for best flavor, throughout summer', 
        'Harvest leaves throughout summer, most potent just before flowering. Cut stems 4-6 inches from top. Can harvest multiple times per season. Leaves are most flavorful when dried.',
        ARRAY['dried leaves', 'airtight containers'], '1-2 years dried',
        'Use in letting go and release spells. Add to grief healing work. Include in joy and happiness magic. Use in transition and new beginning rituals. Add to peace and calm spells. Include in legal matter work.',
        'Hang in small bundles or strip leaves and dry on screens. Dries quickly. Store in airtight jars away from light. Dried oregano is more flavorful and magically potent than fresh.',
        true, 'Oregano: Herb of joy and letting go. Eases transitions and brings peace.',
        admin_user_id, true
    ),

    -- Marjoram
    (
        'Marjoram', 'marjoram', ARRAY['Sweet Marjoram', 'Knotted Marjoram'],
        ARRAY['leaves'], ARRAY['infusion', 'sachets', 'cooking'],
        'An herb of love, happiness, and protection. Marjoram brings comfort, eases grief, and attracts love.',
        'Use in love spells, ease grief, promote happiness, protect loved ones, bring comfort, use in marriage magic',
        'Generally safe. Safe in culinary amounts. Avoid large amounts during pregnancy.',
        'Origanum majorana',
        'Generally safe. Safe in culinary amounts. Avoid large medicinal amounts during pregnancy. May cause drowsiness. Generally safe for most external and culinary uses.', true, 'non_toxic',
        'Marjoram was sacred to Aphrodite and Venus in ancient Greece and Rome. Greeks believed marjoram was created by Aphrodite as a symbol of happiness. Newlyweds were crowned with marjoram garlands to ensure happy marriages. Romans used marjoram in funeral rites, as placing it on graves was thought to bring peace to the departed. In medieval times, marjoram was strewn on floors and used in "strewing herbs" to freshen homes. It was believed that if marjoram grew on a grave, the deceased was happy in the afterlife. In magical traditions, marjoram is used for love, protection of loved ones, happiness, and grief work. It''s gentler than oregano and particularly good for matters of the heart.',
        'For love: Add marjoram to love spells and sachets to attract gentle, lasting love. For marriage: Include in wedding and handfasting rituals for happiness and fidelity. For comfort: Make marjoram tea or carry the herb to bring comfort during difficult times. For grief: Use marjoram to ease grief and bring peace after loss of a loved one. For protection: Place marjoram in children''s rooms or around home to protect loved ones. For happiness: Carry marjoram to promote joy and contentment. For the deceased: Place on graves or altars to honor departed and bring them peace. Marjoram is gentle, loving, and comforting.',
        'Sweet, mild, slightly floral, delicate', true,
        'Lamiaceae', 'Perennial herb (annual in cold climates)', ARRAY['6-10'], ARRAY['Mediterranean', 'Turkey'],
        'Throughout summer before flowering', 
        'Harvest leaves throughout summer, best just before flowering. Cut stems 4-6 inches from growing tips. Can harvest multiple times. Handle gently as leaves bruise easily.',
        ARRAY['dried leaves', 'airtight containers'], '1-2 years dried',
        'Use in love magic and attraction spells. Add to marriage and commitment rituals. Include in grief healing and comfort work. Use to protect loved ones. Add to happiness and contentment spells.',
        'Hang in small bundles or strip leaves and dry on screens. Dries quickly. Handle gently to preserve delicate leaves. Store in airtight jars away from light. Retains sweet scent well when dried.',
        true, 'Marjoram: Gentle herb of love, happiness, and comfort. Sacred to Aphrodite.',
        admin_user_id, true
    ),

    -- Mullein
    (
        'Mullein', 'mullein', ARRAY['Hag''s Taper', 'Witch''s Candle'],
        ARRAY['leaves', 'flowers'], ARRAY['burning', 'charm bags', 'infusion'],
        'A protective herb for courage, divination, and spirit work. Mullein wards off nightmares and negative entities.',
        'Ward off nightmares, use in courage magic, protect against evil, use in divination, summon spirits, use in exorcism',
        'Generally safe. May cause skin irritation. Fine hairs can irritate lungs if not properly prepared.',
        'Verbascum thapsus',
        'Generally safe for most uses. Fuzzy leaves can cause skin irritation in sensitive individuals. Seeds may be toxic. Use leaves and flowers, avoid seeds. Fine hairs should be strained from tea.', false, 'mildly_toxic',
        'Mullein has been used in magic and medicine for thousands of years. Romans dipped dried mullein stalks in tallow and used them as torches, giving it names like "Hag''s Taper." In medieval times, witches were said to use mullein in their lamps, and it was believed to protect against evil magic. Ancient Greeks used mullein to ward off evil spirits. The plant''s tall flowering stalk was seen as a connection between earth and sky. In folk magic, mullein is used for courage, protection, exorcism, and spirit communication. Carrying mullein provides courage and protects against wild animals and evil spirits. Its soft leaves were used in pillows to prevent nightmares.',
        'For courage: Carry mullein leaves in a red bag for bravery when facing fears. For protection: Place mullein leaves under pillows to prevent nightmares and protect during sleep. Hang dried stalks over doors for protection. For divination: Burn mullein and use the smoke for scrying and spirit communication. For exorcism: Burn mullein with other protective herbs to drive out negative entities. For spirit work: Use mullein in rituals to safely communicate with spirits. For banishing: Burn to drive away negative influences. The tall flower stalk can be dried and used as a "witch''s candle" when dipped in wax.',
        'Mild, slightly sweet, earthy', true,
        'Scrophulariaceae', 'Biennial herb', ARRAY['3-9'], ARRAY['Europe', 'Asia', 'North Africa'],
        'Summer of second year when flowers bloom', 
        'First year: plant produces rosette of leaves. Second year: tall flower stalk appears. Harvest leaves from first year rosette or second year before flowering. Harvest flowers from stalk as they bloom. Dry stalks can be saved for "witch candles."',
        ARRAY['dried leaves', 'dried flowers', 'dried stalks', 'airtight containers'], '1-2 years dried',
        'Use in courage and bravery spells. Add to protection magic and warding. Include in exorcism and banishing rituals. Use in divination and spirit communication. Place under pillows for nightmare protection.',
        'Dry leaves on screens or hang. Dry flowers separately. Whole stalks can be hung to dry for use as "witch candles" (dip in wax to burn). Store dried parts in paper bags or jars. Fuzzy leaves shed hairs - handle accordingly.',
        true, 'Mullein: Protective herb for courage, divination, and spirit work. Wards nightmares.',
        admin_user_id, true
    ),

    -- Rue
    (
        'Rue', 'rue', ARRAY['Herb of Grace', 'Ruta'],
        ARRAY['leaves'], ARRAY['burning', 'sachets', 'charm bags'],
        'A powerful protective herb for breaking hexes, exorcism, and psychic protection. Rue removes curses and evil eye.',
        'Break hexes, remove evil eye, use in exorcism, provide psychic protection, bless with holy water, ward off negativity',
        'Can cause severe skin irritation and photosensitivity. Toxic if ingested. Avoid during pregnancy. Handle with gloves.',
        'Ruta graveolens',
        'TOXIC. Can cause severe skin blistering and photosensitivity. Do not ingest - can cause serious poisoning. Avoid during pregnancy as it can cause miscarriage. Always wear gloves when handling. Only for external magical use.', false, 'toxic',
        'Rue is one of the oldest and most powerful protective herbs. Ancient Romans used rue against evil magic and the evil eye. It was sacred to the goddess Diana. In the Middle Ages, rue was used to ward off plague and evil spirits. Michelangelo and Leonardo da Vinci reportedly ate rue to improve eyesight and creativity. Catholic priests used rue to sprinkle holy water (hence "herb of grace"). In Italian magic, rue is the primary defense against malocchio (evil eye). Despite its toxicity, rue has been one of the most valued protective herbs in European magic for millennia. It''s particularly powerful for breaking curses, removing hexes, and providing psychic protection.',
        'For evil eye removal: Wear or carry rue to protect against evil eye. Use rue in rituals to remove curses of evil eye. For hex breaking: Add rue to uncrossing baths and spell bags (do not let touch skin). For exorcism: Burn rue to drive out negative entities and evil spirits. For psychic protection: Carry rue in a red flannel bag for protection against psychic attack. For blessing: Traditionally used to sprinkle holy water in blessing rituals. For purification: Burn rue to clear heavy negative energy. ALWAYS use with extreme caution - wear gloves, do not ingest, avoid skin contact. Very powerful but very dangerous.',
        'Strong, bitter, pungent, unpleasant', false,
        'Rutaceae', 'Perennial herb', ARRAY['4-9'], ARRAY['Southern Europe', 'Balkans'],
        'Summer before flowering', 
        'Harvest leaves in summer before flowering. ALWAYS wear gloves and long sleeves when handling. Plant causes severe skin reactions. Avoid harvesting in full sun as oils are strongest and most irritating then.',
        ARRAY['dried leaves', 'airtight containers', 'labeled clearly'], '1 year dried',
        'Use in hex-breaking and curse-removal. Add to evil eye removal work. Include in exorcism and banishing. Use for psychic protection. Add to heavy-duty protection magic. Use in consecrating holy water.',
        'Dry carefully while wearing gloves. Hang small bundles in well-ventilated area away from other herbs. Store in clearly labeled containers away from children and pets. Always handle with extreme caution. Never ingest.',
        false, 'Rue: Powerful protective herb for breaking hexes and removing evil eye. TOXIC - use with extreme caution.',
        admin_user_id, true
    ),

    -- Blackberry
    (
        'Blackberry', 'blackberry', ARRAY['Bramble'],
        ARRAY['leaves', 'berries'], ARRAY['infusion', 'fresh berries', 'dried leaves'],
        'A protective plant for prosperity, healing, and sacred work. Blackberry offers protection and connects to the Goddess.',
        'Use for prosperity, provide protection, use in healing magic, honor the Goddess, create sacred space, use in Lughnasadh rituals',
        'Generally safe. Thorns can cause injury. Berries are safe to eat. Leaves safe for tea.',
        'Rubus fruticosus',
        'Generally safe. Berries are edible and nutritious. Leaves safe for tea. Watch for thorns which can cause scratches and injury. Some people may have allergic reactions to berries.', true, 'non_toxic',
        'Blackberry has deep roots in Celtic and British magical traditions. Blackberry brambles growing in an arch were considered fairy gateways - passing through was said to allow communication with the fae or cure ailments. In Celtic traditions, blackberries harvested before Michaelmas (September 29) are sacred, but after that date, the devil claims them. The bramble''s protective thorns and generous fruits make it associated with both the Goddess''s bounty and her protection. Blackberry is sacred to Brigid and is used in Lughnasadh celebrations. The plant embodies the cycle of life - beautiful flowers, delicious fruit, and fierce thorns for protection. It''s used for prosperity, protection, and sacred feminine magic.',
        'For prosperity: Carry dried blackberry leaves or eat blackberries while focusing on abundance to attract prosperity. For protection: Plant blackberry bushes around property for natural protective barrier. Weave brambles into wreaths for protection. For healing: Make blackberry leaf tea for magical healing work. For Goddess work: Offer blackberries on altar to honor the Goddess, especially Brigid. For sacred space: Create a blackberry arch or circle for fairy magic and sacred rituals. For Lughnasadh: Include blackberries in first harvest celebrations. For abundance: The generous fruit represents nature''s bounty - use in gratitude and abundance magic. Respect the thorns as the Goddess''s protection.',
        'Leaves: mild, slightly astringent; Berries: sweet-tart, juicy', true,
        'Rosaceae', 'Perennial shrub', ARRAY['5-10'], ARRAY['Europe', 'North America', 'Asia'],
        'Berries in late summer; leaves throughout growing season', 
        'Harvest berries when fully ripe (black and sweet). Wear thick gloves and long sleeves to protect from thorns. Harvest leaves from healthy canes throughout season. Traditionally, berries should be picked before Michaelmas (Sept 29).',
        ARRAY['dried leaves', 'frozen berries', 'airtight containers'], '1 year for leaves, 6-12 months for frozen berries',
        'Use in prosperity and abundance magic. Add to protection spells and warding. Include in healing rituals. Use in Goddess worship and feminine magic. Add to Lughnasadh and harvest celebrations. Use in fairy magic.',
        'Dry leaves on screens or in small bundles. Berries can be eaten fresh, frozen, or made into jam. Store dried leaves in airtight jars. Bramble canes can be woven into protective wreaths or crosses.',
        true, 'Blackberry: Sacred plant for prosperity, protection, and Goddess magic. Generous and protective.',
        admin_user_id, true
    ),

    -- Mandrake
    (
        'Mandrake', 'mandrake', ARRAY['Mandragora', 'Witches'' Root'],
        ARRAY['root'], ARRAY['amulet', 'poppet', 'charm'],
        'A legendary magical root for protection, prosperity, and love. Mandrake is one of the most powerful magical plants.',
        'Use for protection, attract love, increase prosperity, enhance fertility, use in poppets, amplify magic power',
        'HIGHLY TOXIC. Only for external magical use. Never ingest. Avoid during pregnancy. Rare and endangered.',
        'Mandragora officinarum',
        'HIGHLY TOXIC. Contains tropane alkaloids that can cause hallucinations, delirium, and death. Never ingest any part. Only for external use in amulets and charms. Avoid during pregnancy. Many species are endangered - use substitutes when possible.', false, 'toxic',
        'Mandrake is perhaps the most legendary plant in magical history. Ancient civilizations from Egypt to Rome prized mandrake for its powerful magical properties. The root often grows in a roughly human shape, leading to beliefs that it could substitute for a person in magic. Medieval legends claimed mandrake screamed when pulled from the ground, killing anyone who heard it. Mandrake was used in love potions, fertility rites, and as the most powerful protective amulet. It was so valuable that fake mandrakes were carved and sold. True mandrake is rare and endangered. In modern practice, other plants are often substituted (American mandrake/mayapple, bryony root) for conservation. Mandrake is sacred, powerful, and dangerous.',
        'For protection: Carry a whole mandrake root (if legally and ethically obtained) as the most powerful protective amulet. For prosperity: Place mandrake root on altar or in home to attract wealth. Traditionally, placing money near the root multiplies it. For love: Use in love magic (with ethical consideration). For fertility: Historically used in fertility rites. For poppets: The humanoid root shape makes it powerful in poppet magic. For power: Mandrake amplifies magical workings. NEVER ingest. Due to rarity and toxicity, consider substitutes: American mandrake, bryony, or ginseng. If using true mandrake, treat with utmost respect and caution.',
        'Earthy, bitter, slightly narcotic (when fresh)', false,
        'Solanaceae', 'Perennial herb', ARRAY['8-10'], ARRAY['Mediterranean', 'Middle East'],
        'Fall when leaves die back', 
        'Extremely rare and endangered in wild. If growing legally: harvest root in fall. Wear gloves. Traditional lore says to tie dog to plant and use dog to pull root to avoid hearing "scream." Modern practice: dig carefully with respect and thanks.',
        ARRAY['whole root', 'cool dry place', 'wrapped in cloth'], 'Several years if stored properly',
        'Use as powerful protective amulet. Add to prosperity magic. Include in love spells (ethically). Use in fertility magic. Employ in poppet work. Use to amplify magical power. Always substitute when possible due to rarity.',
        'Whole root is most powerful. Can be wrapped in red cloth and kept on altar. Some traditions "feed" the root with wine or milk. Due to toxicity and rarity, many practitioners use substitutes or avoid entirely.',
        false, 'Mandrake: Legendary magical root for protection, love, and prosperity. HIGHLY TOXIC and rare.',
        admin_user_id, true
    ),

    -- Patchouli
    (
        'Patchouli', 'patchouli', ARRAY['Pogostemon'],
        ARRAY['leaves'], ARRAY['burning', 'oil', 'sachets'],
        'A earthy herb for prosperity, love, and grounding. Patchouli attracts money, passion, and physical connection.',
        'Use in money spells, attract love and lust, ground energy, increase fertility, protect possessions, use in earth magic',
        'Generally safe for external use. Essential oil should be diluted. May cause skin sensitivity.',
        'Pogostemon cablin',
        'Generally safe for external use. Essential oil is very strong and should always be diluted before skin contact. May cause skin sensitivity in some individuals. Safe for burning and in magical work.', true, 'non_toxic',
        'Patchouli is native to tropical Asia and has been used for centuries. In Asian traditions, patchouli leaves were placed among stored fabrics to repel insects. The scent became associated with fine cashmere shawls imported to Europe. In the 1960s-70s, patchouli became iconic in Western counterculture, used to scent bodies and mask other odors. In magical traditions, patchouli is powerfully associated with earth element, prosperity, and physical love. The earthy, musky scent is grounding and attracts money. It''s used in love magic focused on physical passion rather than emotional love. Patchouli connects us to earth energy and material abundance.',
        'For prosperity: Add dried patchouli to money-drawing sachets or place in wallet. Anoint money with diluted patchouli oil. For love/lust: Use in passion and attraction spells. Wear patchouli oil (diluted) to attract physical partners. For grounding: Burn patchouli or wear oil when needing earth connection and grounding. For fertility: Include in fertility magic and earth-based rituals. For protection: Place patchouli around possessions to protect from theft. For earth magic: Use in rituals honoring earth element. Patchouli is particularly powerful in business success and attracting customers.',
        'Earthy, musky, sweet, woody, exotic', false,
        'Lamiaceae', 'Perennial herb', ARRAY['11-12'], ARRAY['Tropical Asia', 'Indonesia', 'Philippines'],
        'Year-round in tropical climates', 
        'Harvest leaves year-round in appropriate tropical climates. Leaves are picked and dried. Dried leaves can be distilled for essential oil. Most patchouli used in magic is imported dried leaves or essential oil.',
        ARRAY['dried leaves', 'essential oil', 'airtight containers'], '2-3 years dried, oil lasts several years',
        'Use in money and prosperity magic. Add to love and lust spells. Include in grounding and earth work. Use in fertility rituals. Add to protection of possessions. Include in business success spells.',
        'Dried leaves can be burned, added to sachets, or used in charm bags. Essential oil is most common form - very concentrated, always dilute before skin contact. Store leaves in airtight containers. Oil should be in dark glass bottles.',
        false, 'Patchouli: Earthy herb for prosperity, passion, and grounding. Attracts money and physical love.',
        admin_user_id, true
    ),

    -- High John the Conqueror
    (
        'High John the Conqueror', 'high-john-the-conqueror', ARRAY['John the Conqueror Root', 'Jalap Root'],
        ARRAY['root'], ARRAY['charm bags', 'oil', 'amulet'],
        'A powerful root for success, power, and overcoming obstacles. High John brings victory and conquers all challenges.',
        'Use for success, increase personal power, overcome obstacles, win legal matters, attract luck, dominate situations',
        'Do not ingest - toxic. Only for external magical use. Can cause skin irritation.',
        'Ipomoea jalapa',
        'Do not ingest - causes severe digestive distress and is toxic. Only for external use in magical work. Can cause skin irritation - handle with care. Keep away from children and pets.', false, 'toxic',
        'High John the Conqueror root is deeply rooted in African American hoodoo tradition. The root is named after the legendary African prince "High John de Conquer," a trickster hero who could not be defeated even in slavery. High John would help enslaved people by giving them strength, cunning, and hope. His spirit was said to reside in the jalap root, making it the most powerful root in hoodoo for success, strength, and overcoming obstacles. The root represents the unconquerable spirit and is used when you need to be victorious against all odds. It''s particularly powerful for legal matters, money, love, and gaining power in difficult situations.',
        'For success: Carry High John root in pocket or red flannel bag to ensure success in all endeavors. For power: Anoint root with oil and carry for personal power and dominance. For obstacles: Use when facing seemingly insurmountable challenges - High John cannot be conquered. For legal matters: Carry to court for favorable outcomes. For money: Place in wallet or cash register to attract money. For love: Use to make yourself irresistible and powerful in attraction. For luck: Carry for exceptional luck in all matters. Anoint with Crown of Success oil or Fiery Wall of Protection oil for added power. High John is the conqueror - when you need to win, call on High John.',
        'Earthy, slightly sweet, resinous', false,
        'Convolvulaceae', 'Perennial vine', ARRAY['9-11'], ARRAY['Mexico', 'Central America'],
        'Roots harvested when mature', 
        'Roots are harvested from mature plants. Most High John roots in commerce are wildcrafted or cultivated in Central America. Due to demand, sustainable sourcing is important. Root should be firm, not soft or moldy.',
        ARRAY['whole root', 'root pieces', 'cool dry place'], 'Several years if kept dry',
        'Use in success and victory magic. Add to power and domination work. Include in obstacle-removal spells. Use in legal matter magic. Add to money and prosperity spells. Include in attraction and love work.',
        'Whole root is most powerful - can be carried, placed on altar, or anointed with oils. Can be carved or marked with symbols. Some traditions "feed" the root with whiskey. Never ingest. Wrap in red flannel or keep in mojo bag.',
        false, 'High John the Conqueror: Powerful root for victory, success, and conquering all obstacles.',
        admin_user_id, true
    );

END $$;
