-- =============================================================================
-- GRIMOIRE COLLECTIVE - OIL DATA
-- =============================================================================
-- Purpose: Comprehensive magical and essential oil data
-- Note: This is permanent data, not sample data
--
-- NOTE: The following data is now linked through junction tables:
-- - magical_properties → Link via entity_intentions junction table
-- - element → Link via entity_elements junction table
-- - planet → Link via planets table when created
-- - zodiac_signs → Link via entity_zodiac_signs junction table
-- - chakras → Link via entity_chakras junction table
-- - blends_well_with → Link via oils combinations table or entity_substitutes
-- - herb_combinations → Link via junction table to herbs
-- - crystal_combinations → Link via junction table to crystals
-- - candle_uses removed - use grimoire recipes instead
-- - color removed - not essential for magical work
-- - consistency removed - not essential for magical work
-- - aromatherapy_uses removed - out of scope for magical database
-- =============================================================================

DO $$
DECLARE
    admin_user_id UUID;
BEGIN
    SELECT id INTO admin_user_id FROM users WHERE username = 'admin' LIMIT 1;

INSERT INTO oils (
    name, slug, oil_type,
    magical_uses, description, safety_warnings, shelf_life,
    history, scent_profile,
    created_by, is_verified
) VALUES
(
    'Protection Oil',
    'protection-oil',
    'blend',
    'Anoint candles, doors, windows, yourself for protection. Use in shielding rituals.',
    'Protection Oil creates a powerful shield against negative energy. Used to anoint the body, candles, objects, and spaces for protection from harm, negativity, and psychic attack.',
    'For external use only. Contains frankincense and myrrh. Patch test before use. Avoid during pregnancy. May cause skin irritation in sensitive individuals.',
    '6-12 months',
    'Protection oils have been used since ancient times. Ancient Egyptians anointed themselves with protective oils before entering temples or tombs. Roman soldiers used oils infused with protective herbs before battle. Medieval grimoires contain numerous recipes for protection oils used to defend against evil spirits and curses. Hoodoo and conjure traditions developed complex protection oil blends. The practice of anointing doorways and windows with protective oil is found across cultures. Frankincense and myrrh, two of the most ancient protective resins, form the base of most traditional protection oil recipes.',
    'Resinous, warm, slightly spicy, herbaceous, protective, strong, mystical, ancient, grounding',
    admin_user_id,
    true
),
(
    'Love Oil',
    'love-oil',
    'blend',
    'Anoint candles for love spells, wear for attraction, use in romance rituals.',
    'Love Oil attracts romantic love, enhances passion, and promotes self-love. Blend of aphrodisiac and heart-opening oils to draw love and deepen romantic connections.',
    'For external use only. Contains rose and jasmine. Patch test required. Some oils may stain clothing. Avoid during pregnancy.',
    '6-12 months',
    'Love oils have been created for thousands of years across every culture. Ancient Egyptians used perfumes and oils in seduction and love magic. Cleopatra famously used exotic oils to enchant lovers. Greek and Roman love goddesses Aphrodite and Venus were honored with sweet-smelling oils. Medieval love potions often included oils infused with attraction herbs. Victorian era "language of flowers" extended to scented oils for attracting suitors. Hoodoo tradition created powerful love oil blends like "Come to Me" and "Love Me" oils. Rose has been the primary love oil ingredient across all cultures and time periods.',
    'Floral, sweet, romantic, sensual, rosy, exotic, warm, inviting, beautiful, soft',
    admin_user_id,
    true
),
(
    'Prosperity Oil',
    'prosperity-oil',
    'blend',
    'Anoint candles for money spells, wallet, cash register, business tools.',
    'Prosperity Oil attracts wealth, abundance, and financial success. Used to draw money, bless businesses, and create prosperity consciousness.',
    'For external use only. Contains cinnamon which can be a skin irritant. Always dilute. Patch test required. Do not apply to broken skin.',
    '6-12 months',
    'Prosperity oils have been central to folk magic worldwide. Ancient merchants anointed their goods and shops with oils to attract customers and ensure fair prices. Chinese shop owners used specific oil blends at thresholds to invite prosperity. European folk magic included numerous recipes for "money drawing" oils. In American hoodoo, prosperity oils became highly developed with specific blends for different financial situations. Cinnamon, one of the most expensive spices in history, became associated with wealth attraction. Patchouli gained popularity in 1960s-70s for attracting money. Traditional recipes often included actual coins or gold dust.',
    'Warm, spicy, sweet, earthy, rich, cinnamon-forward, uplifting, prosperous, abundant',
    admin_user_id,
    true
),
(
    'Anointing Oil',
    'anointing-oil',
    'blend',
    'Consecrate ritual tools, anoint yourself before ritual, bless candles and objects.',
    'Anointing Oil is used for consecration and blessing. A sacred oil for anointing yourself, ritual tools, candles, and spaces before magical or spiritual work.',
    'For external use only. Generally safe blend. Patch test recommended. Contains tree resins which may cause sensitivity in some individuals.',
    '12-24 months',
    'Anointing oils are among the most ancient spiritual practices. Ancient Egyptians anointed pharaohs, priests, and sacred objects. The Hebrew Bible documents holy anointing oil used to consecrate priests, prophets, and kings (Exodus 30:22-33). Christian traditions continued anointing for baptism, confirmation, and healing. Islamic tradition uses attar oils. Hindu practice uses tilak and sacred oils. Every major religious and spiritual tradition includes anointing. Frankincense and myrrh, mentioned throughout ancient texts, remain primary anointing ingredients. The practice of anointing marks something or someone as sacred and set apart.',
    'Sacred, resinous, woody, spiritual, purifying, ancient, mystical, grounding, holy',
    admin_user_id,
    true
),
(
    'Psychic Oil',
    'psychic-oil',
    'blend',
    'Anoint third eye before divination, use with tarot cards, enhance psychic work.',
    'Psychic Oil enhances intuition, psychic abilities, and divination work. Opens the third eye and strengthens connection to subtle energies and spiritual guidance.',
    'For external use only. Contains mugwort. Avoid during pregnancy and breastfeeding. Patch test required.',
    '6-12 months',
    'Psychic development oils emerged from ancient practices of preparing seers and oracles. The Oracle of Delphi prepared with sacred oils and herbs before prophesying. Ancient temple priests anointed themselves before divination rituals. Medieval grimoires contained recipes for oils to "open the sight." European cunning folk created oil blends for scrying and spirit communication. Mugwort has been used across cultures for psychic visions. The practice of anointing the third eye before psychic work appears in numerous traditions. Modern ceremonial magic developed specific oil blends for different types of psychic work.',
    'Clear, ethereal, lavender-forward, bright, clarifying, mystical, opening, light, uplifting',
    admin_user_id,
    true
),
(
    'Healing Oil',
    'healing-oil',
    'blend',
    'Anoint blue candles for healing, apply to body with intention, use in healing rituals.',
    'Healing Oil promotes physical and emotional healing. Used to support recovery, enhance vitality, and focus healing intention. Combines medicinal and magical properties.',
    'For external use only. Contains eucalyptus. Keep away from eyes and mucous membranes. Not for internal use. Patch test required.',
    '6-12 months',
    'Healing oils are ancient medicine and magic combined. Every ancient culture created healing oil blends - Egyptian kyphi, Greek and Roman medicinal oils, Ayurvedic herbal oils, Chinese medicine oils. Temple healers anointed the sick. Jesus'' healing ministry included anointing with oil. Medieval herbalists created salves and oils for every ailment. Cunning folk and wise women were known for their healing oil recipes. The boundary between magical and medicinal use of healing oils has always been fluid. Many essential oils used magically do have proven medicinal properties. Modern energy healing continues the practice of anointing with healing intention.',
    'Clean, medicinal, fresh, clearing, soothing, eucalyptus-forward, healing, cooling, therapeutic',
    admin_user_id,
    true
),
(
    'Banishing Oil',
    'banishing-oil',
    'blend',
    'Anoint black candles, use in banishing rituals, remove negativity and obstacles.',
    'Banishing Oil removes unwanted influences, breaks negative patterns, and helps end situations that no longer serve. Powerful for removing obstacles and clearing away the old.',
    'For external use only. Can be skin irritant. Contains black pepper and clove. Patch test required. Keep away from eyes.',
    '6-12 months',
    'Banishing oils evolved from ancient practices of spiritual cleansing and exorcism. Ancient cultures created oil blends to drive away evil spirits, illness, and misfortune. Temple priests performed banishing rites with specific oils. Medieval grimoires contained recipes for "oils of dismissal" used in exorcism. European folk magic developed oils for removing curses and breaking hexes. Hoodoo tradition created specific banishing oils like "Go Away" and "Break Up" oils for different situations. The use of sharp, hot ingredients like pepper and clove in banishing comes from the magical principle of using uncomfortable elements to drive unwanted influences away.',
    'Sharp, spicy, peppery, strong, pungent, hot, powerful, clearing, intense, protective',
    admin_user_id,
    true
),
(
    'Dream Oil',
    'dream-oil',
    'blend',
    'Anoint pillow, temples, feet before sleep for dreams. Enhance dream recall and prophetic dreams.',
    'Dream Oil promotes restful sleep, enhances dream recall, and facilitates prophetic dreams. Used to prepare for dream work, astral travel, and receiving messages through dreams.',
    'For external use only. Safe and gentle blend. Patch test recommended. Relaxing - avoid using before driving or operating machinery.',
    '6-12 months',
    'Dream oils have been used since ancient times to facilitate divine dreams and visions. Ancient Egyptians slept in temples seeking healing dreams after ritual preparation with oils. Greek dream incubation practices included anointing before sleep. Biblical figures anointed themselves before receiving divine dreams. Oracle traditions worldwide prepared with specific herbs and oils for prophetic dreams. Mugwort has been used across cultures for dream enhancement. Medieval grimoires included recipes for "dream pillows" and oils. Victorian spiritualists used oils to enhance dream communication with spirits. Modern dream work continues these ancient practices with careful oil blending.',
    'Gentle, floral, calming, soothing, lavender-chamomile, peaceful, dreamy, soft, relaxing',
    admin_user_id,
    true
);

END $$;
