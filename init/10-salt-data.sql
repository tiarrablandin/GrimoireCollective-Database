-- =============================================================================
-- GRIMOIRE COLLECTIVE - SALT DATA
-- =============================================================================
-- Purpose: Comprehensive magical salt data
-- Note: This is permanent data, not sample data
-- =============================================================================

DO $$
DECLARE
    admin_user_id UUID;
BEGIN
    SELECT id INTO admin_user_id FROM users WHERE username = 'admin' LIMIT 1;

INSERT INTO salts (
    name, slug, salt_type, color, ingredients, magical_properties,
    magical_uses,
    description, history,
    created_by, is_verified
) VALUES
(
    'Black Salt',
    'black-salt',
    'protective',
    'Black',
    ARRAY['sea salt', 'charcoal', 'black pepper', 'ashes'],
    ARRAY['protection', 'banishing', 'grounding', 'absorbing_negativity', 'hex_breaking'],
    'Sprinkle at doorways, windows, property lines for protection. Use in banishing rituals.',
    'Black Salt is a powerful protective salt used to absorb negativity, banish harmful energy, and create protective barriers. Made with salt, ash, and protective herbs or charcoal.',
    'Black Salt (also called Witches'' Salt) has roots in European folk magic and hoodoo tradition. European practitioners created it by mixing salt with fireplace ashes from protective herb burning. The ashes of protection herbs combined with salt''s purifying properties created a powerful protective barrier. In Italian folk magic (stregheria), black salt protected against malocchio (evil eye). Hoodoo tradition developed black salt extensively, sometimes adding iron filings or graveyard dirt for specific purposes. The black color represents absorbing and neutralizing negativity. Traditional black salt was made from cooking salt in cast iron until black, or mixing with ash from sacred fires. It''s placed at doorways, windows, and property boundaries to create protective barriers.',
    admin_user_id,
    true
),
(
    'Protection Salt',
    'protection-salt',
    'protective',
    'White with herbs',
    ARRAY['sea salt', 'rosemary', 'sage', 'lavender', 'basil'],
    ARRAY['protection', 'purification', 'blessing', 'cleansing', 'peace'],
    'Use in baths, floor washes, protection circles, blessing spaces, cleansing rituals.',
    'Protection Salt is a white salt blend infused with protective herbs for purification, blessing, and cleansing. Used in baths, floor washes, and protective circles.',
    'Protection salt blends emerged from ancient practices of combining salt''s purifying properties with protective herbs. Salt has been considered sacred and protective across virtually every culture - Romans paid soldiers in salt (origin of "salary"), Jewish tradition uses salt covenant, Shinto religion purifies with salt. The addition of protective herbs like rosemary, sage, and basil amplifies salt''s natural protective qualities. European folk magic used herb-infused salt in house blessings and space clearing. Celtic traditions blessed homes with salt and herb blends. Unlike black salt (absorptive), protection salt actively blesses and purifies with bright protective energy. It''s used in baptisms, blessings, and consecration across many spiritual traditions.',
    admin_user_id,
    true
),
(
    'Rose Salt',
    'rose-salt',
    'attraction',
    'Pink',
    ARRAY['sea salt', 'rose petals', 'rose oil', 'hibiscus'],
    ARRAY['love', 'self_love', 'beauty', 'attraction', 'emotional_healing', 'compassion'],
    'Add to baths for love and self-love, use in beauty magic, love spell work, emotional healing.',
    'Rose Salt is a beautiful pink salt infused with rose petals for love, self-love, romance, and emotional healing. Used in ritual baths and love magic.',
    'Rose salt emerges from ancient beauty and love magic traditions. Cleopatra bathed in milk, honey, and rose-infused salt from the Dead Sea. Roman bath houses used rose-scented salts. Turkish hammam traditions include rose salt scrubs. Victorian ladies used rose bath salts for beauty and to attract suitors. The combination of salt (purifying, releasing) with rose (love, beauty) creates perfect blend for self-love and attraction work. Roses have been associated with love goddesses Venus and Aphrodite since ancient times. Pink salt specifically became popular for love magic in modern practice. Rose salt bridges physical beauty care with magical self-love work.',
    admin_user_id,
    true
),
(
    'Money Salt',
    'money-salt',
    'prosperity',
    'Green',
    ARRAY['sea salt', 'basil', 'cinnamon', 'mint', 'pyrite chips'],
    ARRAY['prosperity', 'abundance', 'money_drawing', 'success', 'luck'],
    'Add to prosperity baths, sprinkle in wallet or cash register, use in money spells.',
    'Money Salt is a prosperity-drawing salt blend for attracting wealth, abundance, and financial success. Used in money magic and business blessings.',
    'Money salt blends are rooted in folk magic traditions of attracting prosperity. European and American folk magic used herb and salt combinations to "draw" money - the salt pulls it in like salt draws moisture. Merchants sprinkled prosperity salts at thresholds to draw customers. Hoodoo tradition developed complex money-drawing salts with specific herbs, oils, and minerals. Green became associated with money in America (green currency) and was added to prosperity salts via herbs or coloring. The practice of putting prosperity salt in wallets and cash registers is widespread in folk magic. Chinese shop owners use salt and prosperity blends at their doors. Pyrite (fool''s gold) has long been added to money magic.',
    admin_user_id,
    true
),
(
    'Cleansing Salt',
    'cleansing-salt',
    'purification',
    'White',
    ARRAY['sea salt', 'lemon peel', 'eucalyptus', 'peppermint', 'sage'],
    ARRAY['cleansing', 'purification', 'removing_negativity', 'freshness', 'clarity'],
    'Use in cleansing baths, floor washes, space clearing, purification rituals.',
    'Cleansing Salt is a purifying salt blend for removing negative energy, cleansing spaces, and spiritual purification. Used in ritual baths and space clearing.',
    'Cleansing salt combines salt''s ancient purifying properties with clarifying herbs. Salt has been used for spiritual cleansing across all cultures and religions - Jewish kashering, Islamic wudu areas, Shinto purification, Christian baptism fonts. The addition of bright, fresh herbs like lemon, eucalyptus, and mint creates a powerful energetic cleanser. Greek and Roman bath houses used salt scrubs with herbs. Japanese tradition places salt at entrances for purification. European spring cleaning traditions included salt and herb floor washes. The sharp, fresh scent itself shifts energy. Cleansing salt is used after illness, conflict, bad events, or anytime space needs energetic refresh.',
    admin_user_id,
    true
);

END $$;
