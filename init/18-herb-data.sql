-- =============================================================================
-- GRIMOIRE COLLECTIVE - HERB DATA
-- =============================================================================
-- Purpose: Comprehensive herb data for the knowledge base
-- Note: This is permanent data, not sample data
-- =============================================================================

DO $$
DECLARE
    admin_user_id UUID;
BEGIN
    SELECT id INTO admin_user_id FROM users WHERE username = 'admin' LIMIT 1;

    INSERT INTO herbs (
        name, slug, alternative_names, magical_properties, element, planet, zodiac_signs,
        parts_used, preparation_methods, description, magical_uses, contraindications,
        deities_associated, sabbats_associated, scientific_name, safety_warnings, pregnancy_safe,
        toxicity_level, history, directions, scent_profile,
        skin_safe, created_by, is_verified
    ) VALUES

    -- Lavender
    (
        'Lavender', 'lavender', ARRAY['English Lavender', 'French Lavender'],
        ARRAY['peace', 'love', 'purification', 'sleep', 'protection'], 'Air', 'Mercury', ARRAY['Gemini', 'Virgo'],
        ARRAY['flowers', 'leaves'], ARRAY['infusion', 'sachet', 'essential oil'],
        'A beloved aromatic herb known for its calming and protective properties. Lavender is one of the most versatile magical herbs.',
        'Use in sleep pillows for peaceful dreams, add to purification baths, burn for cleansing, incorporate in love spells, place under pillow for restful sleep',
        'Generally safe. May cause drowsiness when combined with sedatives.',
        ARRAY['Hecate', 'Mercury'], ARRAY['Litha', 'Lughnasadh'], 'Lavandula angustifolia',
        'Safe for most uses. Avoid ingesting essential oil undiluted.', true, 'non_toxic',
        'Lavender has been cherished since ancient times, with evidence of its use found in Egyptian tombs and Roman baths. The Romans introduced lavender to Britain, where it became a staple in Tudor gardens. Medieval herbalists used it to ward off plague and evil spirits. The name derives from the Latin "lavare" meaning "to wash," reflecting its long use in bathing rituals. In Victorian times, lavender was used in smelling salts and to revive fainting ladies. Folk traditions across Europe associated lavender with love divination and protection magic.',
        'For sleep magic: Place dried lavender flowers in a small sachet and tuck under your pillow or inside pillowcase. For purification: Add 1-2 handfuls of dried flowers to bathwater. For love spells: Burn dried lavender on charcoal while focusing on your intention. For protection: Hang bundles above doorways or windows. Steep flowers in hot water for 10-15 minutes for a magical tea to promote calm and clarity.',
        'Sweet, floral, slightly herbaceous with calming undertones', true, admin_user_id, true
    ),

    -- Rosemary
    (
        'Rosemary', 'rosemary', ARRAY['Compass Weed', 'Dew of the Sea'],
        ARRAY['protection', 'memory', 'purification', 'love', 'mental clarity'], 'Fire', 'Sun', ARRAY['Aries', 'Leo'],
        ARRAY['leaves', 'stems'], ARRAY['infusion', 'essential oil', 'smudging'],
        'A powerful protective herb associated with memory, clarity, and purification. Rosemary has been used in magical practice for thousands of years.',
        'Burn for cleansing and protection, carry for memory enhancement, add to love sachets, use in purification baths, place under pillow for prophetic dreams',
        'Safe for most uses. Avoid large amounts during pregnancy. May interact with blood thinners.',
        ARRAY['Aphrodite', 'Virgin Mary'], ARRAY['Yule', 'Beltane'], 'Rosmarinus officinalis',
        'Generally safe. Avoid essential oil during pregnancy. May cause skin irritation in sensitive individuals.', false, 'mildly_toxic',
        'Rosemary''s history stretches back to ancient Greece and Rome, where students wore garlands of rosemary to improve memory during examinations. The herb was considered sacred to remembrance and fidelity - it was woven into bridal wreaths and funeral arrangements alike. In medieval times, rosemary was believed to ward off evil spirits and plague. Shakespeare referenced it in Hamlet ("There''s rosemary, that''s for remembrance"). During the Middle Ages, it was burned in sickrooms and courts to purify the air. The Virgin Mary was said to have spread her blue cloak over a white-flowered rosemary bush, turning its flowers blue forever.',
        'For protection: Hang sprigs above doorways or burn as smudge. For memory: Make a tea and drink before studying or important mental tasks. For purification: Add fresh or dried rosemary to ritual baths. For love: Create sachets with rosemary and rose petals. Steep 1 teaspoon dried leaves in hot water for 5-7 minutes for magical tea to enhance mental clarity and focus.',
        'Pine-like, sharp, camphoraceous with woody undertones', true, admin_user_id, true
    ),

    -- Mugwort
    (
        'Mugwort', 'mugwort', ARRAY['Artemisia', 'Cronewort', 'Old Man'],
        ARRAY['psychic ability', 'prophetic dreams', 'protection', 'divination', 'astral projection'], 'Earth', 'Moon', ARRAY['Cancer', 'Scorpio'],
        ARRAY['leaves', 'flowers'], ARRAY['infusion', 'smoking', 'dream pillow'],
        'A powerful herb for divination and psychic work. Mugwort is especially associated with dreams, visions, and lunar magic.',
        'Use in dream pillows for vivid dreams, burn before divination, carry for protection during astral travel, make tea for psychic enhancement, place under pillow for prophetic visions',
        'Avoid during pregnancy and breastfeeding. May cause allergic reactions in those sensitive to Asteraceae family. Not for long-term internal use.',
        ARRAY['Artemis', 'Diana'], ARRAY['Litha', 'Samhain'], 'Artemisia vulgaris',
        'Avoid during pregnancy and breastfeeding. Can cause allergic reactions. May interact with medications. Do not use long-term.', false, 'mildly_toxic',
        'Named after the Greek goddess Artemis, mugwort has been used for millennia across cultures. In ancient Rome, travelers placed mugwort in their shoes to prevent fatigue on long journeys. Anglo-Saxons considered it one of the nine sacred herbs. In Chinese medicine, it''s used in moxibustion. European folklore held that mugwort protected against evil spirits and wild beasts. The herb was traditionally gathered on St. John''s Eve and worn as a belt during summer solstice celebrations. It was also sewn into pillows to induce prophetic dreams and astral projection.',
        'For prophetic dreams: Place dried mugwort in a small pillow or sachet under your regular pillow. For divination: Burn dried leaves before scrying or tarot reading to enhance psychic abilities. For astral travel: Drink a weak tea 30 minutes before meditation (1/2 teaspoon in 1 cup hot water, steep 5 minutes). For protection: Hang above doorways or carry in a charm bag. Cleanse divination tools by passing them through mugwort smoke.',
        'Bitter, earthy, slightly sweet with sage-like notes', false, admin_user_id, true
    ),

    -- Bay Laurel
    (
        'Bay Laurel', 'bay-laurel', ARRAY['Bay Leaf', 'Sweet Bay', 'Laurel'],
        ARRAY['protection', 'purification', 'success', 'wisdom', 'prophetic dreams'], 'Fire', 'Sun', ARRAY['Leo', 'Sagittarius'],
        ARRAY['leaves'], ARRAY['burning', 'infusion', 'charm bags'],
        'A sacred herb of victory and prophecy, bay laurel has been used in divination and success magic for millennia. The laurel wreath symbolizes achievement and honor.',
        'Write wishes on leaves and burn for manifestation, burn for purification and protection, add to success spells, place under pillow for prophetic dreams, use in divination rituals',
        'Safe for most uses. Avoid large amounts during pregnancy. May cause dermatitis in sensitive individuals.',
        ARRAY['Apollo', 'Aesculapius'], ARRAY['Litha', 'Lughnasadh'], 'Laurus nobilis',
        'Generally safe. May cause contact dermatitis. Avoid large amounts during pregnancy.', true, 'non_toxic',
        'Sacred to Apollo, god of prophecy, bay laurel has a rich mythological history. The Greeks believed the tree originated when the nymph Daphne transformed into a laurel tree to escape Apollo''s pursuit. The Oracle of Delphi chewed bay leaves to induce prophetic visions. Roman emperors wore laurel crowns as symbols of triumph and protection. The tradition of crowning victorious athletes and scholars with laurel wreaths continued through ancient Rome. Medieval witches used bay in divination and love spells. The term "poet laureate" comes from the practice of crowning accomplished poets with laurel.',
        'For wish magic: Write your wish on a dried bay leaf with pencil or pen, then burn it completely in a fireproof dish while visualizing your desire manifesting. For prophetic dreams: Place 3 bay leaves under your pillow before sleep. For success: Carry a bay leaf in your wallet or place in business corners. For purification: Burn leaves as incense or add to ritual baths. For protection: Hang bay wreaths above doorways.',
        'Eucalyptus-like, slightly minty with herbal bitterness', true, admin_user_id, true
    ),

    -- Sage
    (
        'Sage', 'sage', ARRAY['Garden Sage', 'Common Sage', 'Salvia'],
        ARRAY['wisdom', 'purification', 'protection', 'longevity', 'cleansing'], 'Air', 'Jupiter', ARRAY['Sagittarius', 'Pisces'],
        ARRAY['leaves'], ARRAY['smudging', 'infusion', 'burning'],
        'A powerful cleansing and purification herb, sage is perhaps the most widely used herb for smoke cleansing in modern practice.',
        'Burn for cleansing spaces and objects, use in purification rituals, add to wisdom spells, carry for protection, burn to break hexes and clear negative energy',
        'Safe for most uses. Avoid large amounts during pregnancy and breastfeeding. May affect blood sugar levels.',
        ARRAY['Zeus', 'Consus'], ARRAY['Mabon', 'Samhain'], 'Salvia officinalis',
        'Generally safe for cleansing. Avoid burning in poorly ventilated areas. Pregnant and breastfeeding women should avoid large amounts. May affect blood sugar.', false, 'mildly_toxic',
        'Sage''s name comes from the Latin "salvere" meaning "to save" or "to heal." The Romans considered it sacred and harvested it with special rituals. A medieval saying claimed "Why should a man die whilst sage grows in his garden?" In ancient times, sage was believed to grant wisdom and longevity. Greek and Roman physicians used it for numerous ailments. Indigenous peoples of the Americas used white sage (Salvia apiana) for ceremonial cleansing for thousands of years. The practice of burning sage for purification spread globally, though cultural appropriation concerns have led to more mindful use.',
        'For space cleansing: Light dried sage bundle, let flame catch then blow out. Walk through space while wafting smoke with feather or hand, focusing on corners and doorways. For object cleansing: Pass objects through sage smoke several times. For protection: Burn sage while visualizing white protective light filling your space. For wisdom: Drink sage tea before study or divination. Always extinguish completely after use and never leave burning sage unattended.',
        'Herbal, slightly peppery, earthy with camphor notes', true, admin_user_id, true
    ),

    -- Cinnamon
    (
        'Cinnamon', 'cinnamon', ARRAY['Cassia', 'Sweet Wood'],
        ARRAY['prosperity', 'success', 'healing', 'love', 'protection', 'psychic powers'], 'Fire', 'Sun', ARRAY['Aries', 'Leo'],
        ARRAY['bark'], ARRAY['powder', 'stick', 'infusion', 'oil'],
        'A warming, energizing spice used for prosperity, success, and love magic. Cinnamon raises vibrations and speeds manifestation.',
        'Add to prosperity spells, burn for success, use in love magic, add to healing incenses, sprinkle in wallet for money attraction, use in fast-acting spells',
        'Safe in culinary amounts. May cause irritation if used undiluted on skin. Avoid large amounts during pregnancy.',
        ARRAY['Aphrodite', 'Venus'], ARRAY['Yule', 'Imbolc'], 'Cinnamomum verum',
        'Safe in small amounts. Can irritate skin and mucous membranes in large amounts. Avoid essential oil during pregnancy. May interact with blood thinners.', false, 'mildly_toxic',
        'Cinnamon was once more valuable than gold, sought after by ancient traders from Egypt to China. It was mentioned in the Old Testament and was used in Egyptian embalming. Arab traders kept the source of cinnamon secret for centuries to maintain their monopoly. In ancient Rome, Emperor Nero burned a year''s supply of cinnamon at his wife''s funeral as a sign of grief. Medieval physicians used it in healing potions and believed it could cure everything from colds to poisoning. Cinnamon was so prized that wars were fought over its trade routes.',
        'For prosperity: Sprinkle cinnamon powder in corners of home or business. Add a pinch to money-drawing sachets. For success: Light a green candle rolled in cinnamon powder while focusing on your goal. For love: Add ground cinnamon to love sachets or sprinkle on love-drawing candles. For fast-acting spells: Add cinnamon to any spell to speed up results. For healing: Make cinnamon tea and visualize healing energy while drinking. Warning: Cinnamon essential oil is very potent - use sparingly and always dilute.',
        'Sweet, warm, spicy with woody undertones', false, admin_user_id, true
    ),

    -- Basil
    (
        'Basil', 'basil', ARRAY['Sweet Basil', 'St. Joseph''s Wort'],
        ARRAY['prosperity', 'love', 'protection', 'purification', 'harmony'], 'Fire', 'Mars', ARRAY['Aries', 'Scorpio'],
        ARRAY['leaves'], ARRAY['infusion', 'fresh', 'essential oil'],
        'A versatile herb for love, prosperity, and protection. Basil brings harmony to the home and attracts positive energy.',
        'Place in corners for prosperity, use in love spells, carry for protection, add to purification baths, grow near entrance for positive energy, sprinkle around home for harmony',
        'Generally safe. Avoid large amounts during pregnancy. May cause allergic reactions in some individuals.',
        ARRAY['Krishna', 'Vishnu'], ARRAY['Litha', 'Lughnasadh'], 'Ocimum basilicum',
        'Generally safe. Avoid large amounts during pregnancy. May cause allergic reactions. Essential oil should be diluted before skin contact.', false, 'non_toxic',
        'Basil holds sacred status in many cultures. In India, holy basil (tulsi) is worshipped as an incarnation of the goddess Tulsi. Ancient Greeks and Romans believed basil could generate wealth and ease childbirth. In medieval Europe, basil was associated with both love and hatred - it was said that a woman could win a man''s love by feeding him basil, yet it was also believed scorpions were born beneath basil pots. Italian tradition holds that a pot of basil on a balcony signals a woman''s availability for love. African American hoodoo traditions use basil to attract money and customers to businesses.',
        'For prosperity: Place fresh basil leaves in cash register or wallet. Sprinkle dried basil in corners of home. For love: Carry basil leaves to attract love or give basil to a potential partner. For protection: Place basil leaves at corners of your home or above doorways. For harmony: Grow basil plant near your front door or in kitchen. For purification: Add fresh basil to ritual baths. For business success: Sprinkle basil around your business threshold or desk.',
        'Sweet, slightly peppery, anise-like with clove notes', true, admin_user_id, true
    ),

    -- Peppermint
    (
        'Peppermint', 'peppermint', ARRAY['Mint', 'Brandy Mint'],
        ARRAY['prosperity', 'purification', 'healing', 'mental clarity', 'psychic awareness'], 'Air', 'Mercury', ARRAY['Gemini', 'Virgo'],
        ARRAY['leaves'], ARRAY['infusion', 'essential oil', 'fresh'],
        'A refreshing herb for mental clarity, prosperity, and purification. Peppermint stimulates the mind and attracts positive energy.',
        'Add to prosperity spells, use in healing magic, burn for purification, place under pillow for prophetic dreams, rub fresh leaves on furniture to purify, use in spells requiring mental clarity',
        'Safe for most uses. May cause heartburn. Avoid giving to infants. May interact with certain medications.',
        ARRAY['Pluto', 'Hecate'], ARRAY['Litha', 'Mabon'], 'Mentha piperita',
        'Generally safe. Avoid giving to infants or young children. May cause heartburn. Can interact with certain medications. Essential oil should be diluted.', false, 'non_toxic',
        'Peppermint is a hybrid of watermint and spearmint, first cultivated in England in the 17th century. The ancient Greeks and Romans crowned themselves with peppermint at feasts and used it to scent their bathwater. Pliny the Elder noted that the scent of peppermint stirs up the mind and appetite. In medieval times, peppermint was used to whiten teeth and freshen breath. Folk magic traditions use peppermint to attract money and prosperity - rubbing peppermint oil on furniture and doorways was believed to cleanse a space and invite abundance. Modern herbalism recognizes peppermint''s ability to enhance mental clarity and focus.',
        'For prosperity: Place dried peppermint in wallet or cash register. Wash hands with peppermint tea before handling money. For mental clarity: Drink peppermint tea before studying or important mental work. Anoint temples with diluted peppermint oil. For purification: Add peppermint to cleansing baths or floor washes. For healing: Drink peppermint tea while visualizing healing energy. For prophetic dreams: Place dried peppermint under your pillow. Rub fresh leaves to release scent and inhale for quick mental boost.',
        'Cool, fresh, intensely minty with slight sweetness', true, admin_user_id, true
    ),

    -- Chamomile
    (
        'Chamomile', 'chamomile', ARRAY['German Chamomile', 'Roman Chamomile'],
        ARRAY['peace', 'sleep', 'prosperity', 'purification', 'meditation'], 'Water', 'Sun', ARRAY['Leo', 'Virgo'],
        ARRAY['flowers'], ARRAY['infusion', 'essential oil', 'sachets'],
        'A gentle, soothing herb for peace, calm, and prosperity. Chamomile attracts money and promotes restful sleep.',
        'Use in sleep magic, add to prosperity spells, include in meditation blends, use in purification baths, sprinkle around property for protection, wash hands with chamomile tea before gambling',
        'Safe for most uses. May cause allergic reactions in those sensitive to Asteraceae family. Avoid during pregnancy.',
        ARRAY['Ra', 'Cernunnos'], ARRAY['Litha', 'Lughnasadh'], 'Matricaria chamomilla',
        'Generally safe. May cause allergic reactions in those sensitive to ragweed. Avoid during pregnancy. May interact with blood thinners.', true, 'non_toxic',
        'Chamomile''s history spans thousands of years. Ancient Egyptians dedicated chamomile to the sun god Ra and used it in embalming. The name comes from Greek "chamaimelon" meaning "ground apple" due to its apple-like scent. Romans used chamomile to flavor beverages and as incense. Medieval monks cultivated chamomile in monastery gardens for medicine and magic. In the Victorian language of flowers, chamomile meant "energy in adversity." English folklore held that chamomile was one of the nine sacred herbs given to the world by the god Woden. Folk magic traditions use chamomile to attract money and ensure success in gambling.',
        'For sleep and dreams: Drink chamomile tea before bed or place dried flowers in dream pillow. For prosperity: Sprinkle dried chamomile around property or wash hands with chamomile tea before handling money. For peace: Add chamomile to ritual baths or burn as gentle incense. For meditation: Drink chamomile tea before meditation to promote calm focus. For protection: Sprinkle around home perimeter. For luck in gambling: Wash hands in chamomile tea before playing games of chance. Steep flowers for 5-10 minutes for magical tea.',
        'Sweet, apple-like, honey notes with slight hay undertones', true, admin_user_id, true
    ),

    -- Yarrow
    (
        'Yarrow', 'yarrow', ARRAY['Soldier''s Woundwort', 'Thousand Leaf'],
        ARRAY['courage', 'love', 'psychic powers', 'healing', 'protection', 'divination'], 'Water', 'Venus', ARRAY['Aries', 'Scorpio'],
        ARRAY['flowers', 'leaves'], ARRAY['infusion', 'fresh', 'dried in sachets'],
        'A powerful herb for courage, divination, and love magic. Yarrow has strong protective and healing properties.',
        'Use in love divination, carry for courage, add to healing spells, use in protection charms, hold during divination for clarity, hang above bed for lasting love',
        'Safe for most uses. May cause allergic reactions in those sensitive to Asteraceae family. Avoid during pregnancy.',
        ARRAY['Aphrodite', 'Achilles'], ARRAY['Litha', 'Lughnasadh'], 'Achillea millefolium',
        'Generally safe. May cause allergic reactions or skin sensitivity. Avoid during pregnancy. May interact with blood thinning medications.', false, 'mildly_toxic',
        'Yarrow''s Latin name Achillea honors the Greek hero Achilles, who according to legend used yarrow to heal his soldiers'' wounds during the Trojan War. The plant has been found in Neanderthal burial sites, suggesting its use dates back over 60,000 years. Ancient Chinese texts describe yarrow stalks used in I Ching divination. In medieval Europe, yarrow was sewn into pillows to bring dreams of future lovers. Scottish highlanders made ointment from yarrow for wounds. Anglo-Saxons called it one of the nine sacred herbs. Folk traditions across Europe used yarrow in love divination - a yarrow plant placed under a pillow was said to bring dreams of a future spouse.',
        'For love divination: Place yarrow under pillow before sleep and recite "Thou pretty herb of Venus'' tree, thy true name it is yarrow. Now who my true love must be, pray tell thou me tomorrow." For courage: Carry yarrow in a charm bag before facing challenges. For healing: Make yarrow tea and visualize healing while drinking (avoid if taking blood thinners). For protection: Hang dried yarrow above doorways or carry for protection during travel. For psychic powers: Hold yarrow during divination to enhance clarity. Steep 1-2 teaspoons in hot water for 10 minutes for magical tea.',
        'Slightly bitter, earthy, camphoraceous with sweet undertones', false, admin_user_id, true
    );

END $$;
