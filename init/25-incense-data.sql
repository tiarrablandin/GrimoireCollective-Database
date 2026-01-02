-- =============================================================================
-- GRIMOIRE COLLECTIVE - INCENSE DATA
-- =============================================================================
-- Purpose: Comprehensive incense data for magical workings
-- Note: This is permanent data, not sample data
--
-- NOTE: The following data is now linked through junction tables:
-- - magical_properties → Link via entity_intentions junction table
-- - element → Link via entity_elements junction table
-- - planet → Link via planets table when created
-- - zodiac_signs → Link via entity_zodiac_signs junction table
-- - deities_associated → Link via entity_deities junction table
-- - moon_phase → Link via entity_moon_phases junction table
-- - blends_well_with → Link via incense combinations table or entity_substitutes
-- - herb_combinations → Link via junction table to herbs
-- - crystal_combinations → Link via junction table to crystals
-- =============================================================================

DO $$
DECLARE
    admin_user_id UUID;
BEGIN
    SELECT id INTO admin_user_id FROM users WHERE username = 'admin' LIMIT 1;

INSERT INTO incense (
    name, slug, incense_type, ingredients,
    magical_uses, description, burning_instructions, created_by, is_verified,
    history, shelf_life, storage_instructions, pet_safe, pregnancy_safe
) VALUES
(
    'Frankincense',
    'frankincense',
    'resin',
    ARRAY['frankincense resin (Boswellia)'],
    
    'Burn for meditation, ritual purification, blessing sacred space, consecrating tools, connecting with divine.',
    'Frankincense is one of the most sacred incenses, used for thousands of years in religious and magical ceremonies. It purifies space, consecrates objects, and elevates spiritual consciousness.',
    'Burn on charcoal disc in fire-safe holder. Ensure good ventilation. Use in ritual or meditation space.',
    admin_user_id,
    true,
    'Frankincense is one of the oldest recorded incenses, used for over 5,000 years. Ancient Egyptians used it in kyphi incense and to fumigate temples. It was burned in ancient Mesopotamia, offered to gods across cultures. The ancient frankincense trade routes shaped civilizations. In biblical texts, it was offered to baby Jesus, burned in temples, and used in holy anointing oil. Ancient Greeks and Romans burned it in religious ceremonies. Arabian cultures controlled its trade for centuries. Catholic Church has used frankincense in Mass for 2,000 years. It has been more valuable than gold at various points in history. Every major religious and spiritual tradition has used frankincense.',
    '2-5 years stored properly',
    'Store frankincense resin in airtight container away from direct sunlight and heat. Keep in cool, dry place. Properly stored resin lasts many years - becomes harder and darker with age but remains usable. Can be stored in glass jar or tin. Keep away from moisture. The resin tears are ready to use as-is, no preparation needed. Resin is stable and doesn''t go "bad" like herbs.',
    false,
    false
),
(
    'Myrrh',
    'myrrh',
    'resin',
    ARRAY['myrrh resin (Commiphora)'],
    
    'Burn for protection, healing work, purification, banishing negativity, and connecting with ancient wisdom.',
    'Myrrh is an ancient protective and healing incense. Used in funeral rites, healing ceremonies, and protection magic. Its energy is deep, mysterious, and powerfully protective.',
    'Burn on charcoal disc in fire-safe holder. Ensure good ventilation. Use in ritual or meditation space.',
    admin_user_id,
    true,
    'Myrrh has been used for over 4,000 years in spiritual and medicinal practices. Ancient Egyptians used myrrh extensively in mummification and funeral rites. It was a key ingredient in kyphi, the sacred Egyptian incense. Myrrh was offered to the baby Jesus alongside frankincense and gold. Ancient Greeks used myrrh in healing and protection. It was burned in temples and used in anointing oils. The Greek word "myrrh" means "bitter." Roman soldiers carried myrrh for wound healing. In Jewish tradition, myrrh was used in holy anointing oil and beauty treatments (Queen Esther). It has been traded along ancient routes and valued as highly as frankincense throughout history.',
    '2-5 years stored properly',
    'Store myrrh resin in airtight container in cool, dark, dry place. Keep away from moisture and direct sunlight. Properly stored myrrh lasts many years - becomes harder and darker with age. Glass or tin containers work well. Myrrh tears are ready to use as-is. Very stable - doesn''t deteriorate if kept dry. Keep separate from strongly scented herbs as myrrh has distinctive scent.',
    false,
    false
),
(
    'Dragon''s Blood',
    'dragons-blood',
    'resin',
    ARRAY['dragon''s blood resin (Daemonorops draco)'],
    
    'Burn for powerful protection, amplifying spells, love magic, and adding power to any working.',
    'Dragon''s Blood is a powerful resin that amplifies magic and provides strong protection. It adds potency to spells and is used extensively in love and protection magic.',
    'Burn on charcoal disc in fire-safe holder. Ensure good ventilation. Use in ritual or meditation space.',
    admin_user_id,
    true,
    'Dragon''s Blood resin comes from several palm species and has been used in magic for over 2,000 years. Despite the mystical name, it''s named for its deep red color. Ancient Romans used it as dye and medicine. Greek and Roman civilizations documented its use. Arabian traders brought it along spice routes. Medieval grimoires mention dragon''s blood extensively in spell work. It was used to seal pacts, add power to spells, and provide protection. The name inspired legendary associations with dragon magic. In hoodoo and folk magic, dragon''s blood became essential for love magic, protection, and empowering spells. It was historically expensive and valued, associated with power and potency.',
    '2-5 years stored properly',
    'Store dragon''s blood resin in airtight container away from light and heat. Keep in cool, dry place. Store in glass or tin. Properly stored, lasts many years. Resin may stick together - this is normal. Keep dry. The distinctive red color may deepen with age. No preparation needed - use resin chunks as-is on charcoal.',
    false,
    false
),
(
    'Sandalwood',
    'sandalwood',
    'wood',
    ARRAY['sandalwood powder (Santalum)'],
    
    'Burn for meditation, spiritual work, healing rituals, granting wishes, and creating sacred space.',
    'Sandalwood is sacred wood used in meditation and spiritual practices. It calms the mind, opens spiritual awareness, and is believed to carry prayers to the divine.',
    'Burn on charcoal disc in fire-safe holder. Ensure good ventilation. Use in ritual or meditation space.',
    admin_user_id,
    true,
    'Sandalwood has been sacred in Eastern religions for over 4,000 years. In Hinduism, sandalwood paste is used in puja (worship) and applied to foreheads. Buddhist temples burn sandalwood during meditation. Ancient Egyptians imported sandalwood for use in ceremonies and embalming. Chinese medicine uses sandalwood. Japanese Buddhist temples have burned sandalwood for centuries. In Ayurveda, sandalwood treats various conditions. The wood is carved into sacred images and prayer beads. Sandalwood has been a major trade commodity. True sandalwood (Santalum album) is endangered, making it extremely expensive - most "sandalwood" incense uses related species. Write wishes on sandalwood chips and burn them - the smoke carries them to divine.',
    '1-2 years for powder',
    'Store sandalwood powder in airtight glass container away from light, heat, and moisture. Keep in cool, dry place. Powder loses scent potency over time - use within 1-2 years for best aroma. Can be stored longer but will be less fragrant. Keep away from strong-smelling herbs. Sandalwood chips/sticks last longer than powder. True sandalwood is expensive - ensure you''re getting quality product.',
    false,
    true
),
(
    'Sage',
    'sage',
    'herb',
    ARRAY['white sage (Salvia apiana) or garden sage (Salvia officinalis)'],
    
    'Burn to cleanse spaces, remove negative energy, purify before rituals, and promote wisdom.',
    'Sage is one of the most popular cleansing herbs. Burning sage (smudging) clears negative energy, purifies spaces, and promotes wisdom. Essential for space clearing.',
    'Burn on charcoal disc in fire-safe holder. Ensure good ventilation. Use in ritual or meditation space.',
    admin_user_id,
    true,
    'Sage burning has been practiced for thousands of years. Native American tribes, particularly Plains tribes, have burned white sage (Salvia apiana) in sacred ceremonies for centuries - this is the origin of "smudging." European traditions burned garden sage (Salvia officinalis) for cleansing and wisdom. The name comes from Latin "salvere" meaning "to heal" or "to save." Medieval Europeans burned sage to ward off evil and plague. Romans considered it sacred. Greek and Roman physicians used it medicinally. Modern Western witchcraft adopted sage burning, combining Native American white sage practices with European sage traditions. Note: White sage is sacred to Native peoples and has been over-harvested - many now recommend garden sage or other sustainable alternatives.',
    '1-2 years for dried sage',
    'Store dried sage bundles or loose sage in dry place away from moisture. Can hang bundles in dry area. Keep loose sage in airtight container. Lasts 1-2 years if kept dry - may lose some scent potency but remains usable. Protect from humidity. Store away from heat sources. Dried sage is flammable - store safely. White sage bundles should be kept in paper or breathable material, not plastic.',
    false,
    false
),
(
    'Copal',
    'copal',
    'resin',
    ARRAY['copal resin (various Protium and Bursera species)'],
    
    'Burn for purification, spiritual ceremonies, offerings to spirits/deities, clearing energy, love magic.',
    'Copal is sacred resin used for thousands of years in Mesoamerican spiritual practices. It purifies, protects, and connects to spiritual realms. The "frankincense of the Americas."',
    'Burn on charcoal disc in fire-safe holder. Ensure good ventilation. Use in ritual or meditation space.',
    admin_user_id,
    true,
    'Copal has been sacred to Mesoamerican cultures for over 2,500 years. Aztec, Mayan, and other Mesoamerican civilizations burned copal in temples and ceremonies. It was offered to gods, particularly sun deities and Quetzalcoatl. Mayan priests burned copal to communicate with gods. Used in Day of the Dead (Día de los Muertos) celebrations. Spanish conquistadors called it "sacred incense." Different varieties exist - white copal (oro), black copal (negro), golden copal. Still burned in Mexico and Central America in churches and spiritual practices. Copal bridges Catholic and indigenous practices in Latin America. Called "the frankincense of the New World" due to similar spiritual use.',
    '2-5 years stored properly',
    'Store copal resin in airtight container away from heat, light, and moisture. Keep in cool, dry place. Glass or tin containers work well. Properly stored copal lasts many years. Different varieties (white, black, gold) should be stored separately if you have multiple types. Keep dry - copal is stable when protected from moisture. No preparation needed - use chunks directly on charcoal.',
    false,
    false
),
(
    'Lavender',
    'lavender',
    'herb',
    ARRAY['lavender flowers (Lavandula)'],
    
    'Burn for peace, love magic, promoting sleep, gentle purification, happiness, and healing.',
    'Lavender incense creates peaceful, loving energy. Used for calming, sleep magic, gentle purification, love work, and healing. One of the most versatile and gentle herbs.',
    'Burn on charcoal disc in fire-safe holder. Ensure good ventilation. Use in ritual or meditation space.',
    admin_user_id,
    true,
    'Lavender has been used in sacred smoke for over 2,500 years. Ancient Egyptians used lavender in incense and perfume. Romans burned it in bathhouses and homes for cleansing and peace. The name comes from Latin "lavare" (to wash). Medieval and Renaissance Europeans burned lavender to purify sickrooms and repel plague. It was strewn on floors and burned to cleanse and scent spaces. Lavender has been used in love magic across cultures - burned to attract love or ensure fidelity. Folk medicine burned lavender to promote healing and peaceful sleep. Victorian era used lavender extensively. Modern aromatherapy recognizes lavender''s calming properties, validating traditional magical use.',
    '1-2 years for dried flowers',
    'Store dried lavender flowers in airtight glass container away from light and moisture. Keep in cool, dark place. Lasts 1-2 years but loses some scent over time - still usable but less fragrant. Protect from humidity. Can also be kept in paper bags in dry area. Lavender retains color and form well when dried. Store away from pungent herbs that might overwhelm its gentle scent.',
    true,
    true
),
(
    'Cinnamon',
    'cinnamon',
    'spice',
    ARRAY['cinnamon bark powder (Cinnamomum)'],
    
    'Burn for prosperity, fast success, protection, passionate love, and empowering spells.',
    'Cinnamon incense brings fast success, prosperity, and power. It speeds up manifestation, attracts money, and adds heat to love magic. Warming and empowering.',
    'Burn on charcoal disc in fire-safe holder. Ensure good ventilation. Use in ritual or meditation space.',
    admin_user_id,
    true,
    'Cinnamon has been valued for 4,000+ years as one of the most expensive spices in history. Ancient Egyptians used it in embalming and religious ceremonies. It was mentioned in Hebrew Bible as ingredient in holy anointing oil. Medieval Europeans believed it came from phoenix nests. Arab traders kept its source secret for centuries to maintain monopoly. Romans burned it at funerals - Nero burned a year''s supply at his wife''s funeral. It has been used in love potions, prosperity magic, and protection spells throughout history. The intense value of cinnamon made it associated with wealth and success. Chinese medicine uses cinnamon as warming, energizing herb.',
    '1-2 years for powder',
    'Store cinnamon powder in airtight glass container away from light, heat, and moisture. Keep in cool, dry place. Ground cinnamon loses potency within 1-2 years - use fresher cinnamon for best results. Can store cinnamon sticks longer and grind as needed. Keep away from moisture as cinnamon powder can clump. Store separately from mild herbs as cinnamon scent is strong.',
    false,
    false
),
(
    'Patchouli',
    'patchouli',
    'herb',
    ARRAY['patchouli leaves (Pogostemon cablin)'],
    
    'Burn for money drawing, grounding, passionate love, fertility, and earth magic.',
    'Patchouli is earthy, grounding incense used for money magic, passionate love, fertility, and grounding work. Its rich, distinctive scent attracts prosperity and physical love.',
    'Burn on charcoal disc in fire-safe holder. Ensure good ventilation. Use in ritual or meditation space.',
    admin_user_id,
    true,
    'Patchouli has been used in Asian medicine and incense for centuries. Native to tropical Asia, particularly India and Philippines. In 19th century, patchouli leaves were used to protect valuable fabrics from moths - becoming associated with expensive textiles and thus wealth. Indian shawls carried patchouli scent, which became fashionable in Europe. The 1960s-70s counterculture adopted patchouli extensively, giving it "hippie" association. In magical practice, patchouli became primary money-drawing herb and was used in love and lust magic. Hoodoo tradition uses patchouli in prosperity and attraction work. Its association with earth element makes it grounding and practical.',
    '1-2 years for dried leaves',
    'Store dried patchouli leaves in airtight container away from light and moisture. Keep in cool, dry place. Lasts 1-2 years. Patchouli scent intensifies and improves with age - aged patchouli is actually preferred. Store away from delicate herbs as patchouli scent is strong and can permeate. Glass containers with tight lids work best. Keep dry.',
    true,
    true
);

END $$;
