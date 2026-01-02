-- =============================================================================
-- GRIMOIRE COLLECTIVE - SEED DATA
-- =============================================================================
-- Purpose: Sample data for development and testing
-- Dependencies: Requires 02-schema.sql (base tables),
--               04-categories-data.sql, 05-tags-data.sql
-- Note: Core reference data (categories, tags, calendars, elements, traditions,
--       pantheons, deities) has been moved to separate files (04-10).
--       This file now contains only sample users, grimoires, and interactions.
-- =============================================================================

-- =============================================================================
-- SAMPLE PERMISSIONS
-- =============================================================================

INSERT INTO permissions (name, description, resource, action) VALUES
    ('manage_users', 'Manage all users', 'users', 'manage'),
    ('delete_any_grimoire', 'Delete any grimoire', 'grimoires', 'delete'),
    ('edit_any_grimoire', 'Edit any grimoire', 'grimoires', 'edit'),
    ('manage_categories', 'Manage categories', 'categories', 'manage'),
    ('manage_tags', 'Manage tags', 'tags', 'manage'),
    ('manage_content_types', 'Manage content types', 'content_types', 'manage'),
    ('view_analytics', 'View analytics dashboard', 'analytics', 'view'),
    ('manage_subscriptions', 'Manage subscription tiers', 'subscriptions', 'manage'),
    ('moderate_comments', 'Moderate comments', 'comments', 'moderate'),
    ('feature_grimoires', 'Feature grimoires on homepage', 'grimoires', 'feature'),
    ('create_grimoire', 'Create grimoire', 'grimoires', 'create'),
    ('edit_own_grimoire', 'Edit own grimoire', 'grimoires', 'edit_own'),
    ('delete_own_grimoire', 'Delete own grimoire', 'grimoires', 'delete_own'),
    ('comment', 'Comment on grimoires', 'comments', 'create'),
    ('like', 'Like grimoires', 'grimoires', 'like'),
    ('favorite', 'Favorite grimoires', 'grimoires', 'favorite');

-- =============================================================================
-- ROLE PERMISSIONS ASSIGNMENTS
-- =============================================================================

-- Super Admin gets all permissions
INSERT INTO role_permissions (role_id, permission_id)
SELECT 
    (SELECT id FROM roles WHERE name = 'super_admin'),
    id
FROM permissions;

-- Admin gets most permissions except user management
INSERT INTO role_permissions (role_id, permission_id)
SELECT 
    (SELECT id FROM roles WHERE name = 'admin'),
    id
FROM permissions
WHERE name IN (
    'delete_any_grimoire',
    'edit_any_grimoire',
    'manage_categories',
    'manage_tags',
    'view_analytics',
    'moderate_comments',
    'feature_grimoires',
    'create_grimoire',
    'comment',
    'like',
    'favorite'
);

-- Regular users get basic permissions
INSERT INTO role_permissions (role_id, permission_id)
SELECT 
    (SELECT id FROM roles WHERE name = 'user'),
    id
FROM permissions
WHERE name IN (
    'create_grimoire',
    'edit_own_grimoire',
    'delete_own_grimoire',
    'comment',
    'like',
    'favorite'
);

-- =============================================================================
-- SAMPLE USERS (Passwords are hashed 'password123')
-- =============================================================================

INSERT INTO users (username, email, password_hash, display_name, bio, is_email_verified) VALUES
    ('admin', 'admin@grimoirecollective.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 
     'Admin User', 'Site administrator', TRUE),
    ('witchyways', 'witchy@example.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy',
     'Witchy Ways', 'Green witch and herbalist. Love connecting with nature.', TRUE),
    ('moonchild', 'moon@example.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy',
     'Moon Child', 'Lunar magic practitioner and tarot reader.', TRUE),
    ('stardust', 'star@example.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy',
     'Cosmic Stardust', 'Astrologer and crystal enthusiast.', TRUE);

-- Assign roles to users
INSERT INTO user_roles (user_id, role_id) 
SELECT 
    u.id, 
    r.id
FROM users u
CROSS JOIN roles r
WHERE (u.username = 'admin' AND r.name = 'super_admin')
   OR (u.username IN ('witchyways', 'moonchild', 'stardust') AND r.name = 'user');

-- Create user settings
INSERT INTO user_settings (user_id)
SELECT id FROM users;

-- =============================================================================
-- SAMPLE GRIMOIRES
-- =============================================================================

INSERT INTO grimoires (
    title, slug, content, excerpt, content_type_id, author_id, 
    status, is_public, published_at
) VALUES
    (
        'Simple Protection Spell for Beginners',
        'simple-protection-spell-beginners',
        E'# Simple Protection Spell for Beginners\n\n## What You''ll Need:\n- White candle\n- Salt\n- Clear intention\n\n## Instructions:\n\n1. Create a circle of salt around your candle\n2. Light the candle and visualize white protective light\n3. Say: "By fire and salt, protection cast, keep me safe, this spell will last"\n4. Let the candle burn for at least 15 minutes\n5. Dispose of salt outside your home\n\n## Notes:\nThis is a simple spell perfect for beginners. Can be done during any moon phase, but particularly powerful during a full moon.',
        'A simple protection spell using basic materials, perfect for beginners.',
        (SELECT id FROM content_types WHERE slug = 'spell'),
        (SELECT id FROM users WHERE username = 'witchyways'),
        'published',
        TRUE,
        CURRENT_TIMESTAMP - INTERVAL '30 days'
    ),
    (
        'Full Moon Manifestation Ritual',
        'full-moon-manifestation-ritual',
        E'# Full Moon Manifestation Ritual\n\nHarness the power of the full moon to manifest your desires.\n\n## Materials:\n- White or silver candle\n- Paper and pen\n- Crystals (clear quartz, moonstone)\n- Moon water (optional)\n\n## Preparation:\nPerform this ritual outdoors if possible, or by a window where you can see the moon.\n\n## Steps:\n\n1. Cleanse your space with sage or incense\n2. Set up your altar with candles and crystals\n3. Write your intentions on paper - be specific!\n4. Hold the paper and visualize your desires manifesting\n5. Say: "By the light of the full moon bright, I manifest my heart''s delight"\n6. Burn the paper safely in the candle flame\n7. Meditate on your intentions for at least 10 minutes\n8. Thank the moon and close your circle\n\n## Timing:\nBest performed when the moon is visible, within 24 hours of peak fullness.',
        'Manifest your desires with this powerful full moon ritual.',
        (SELECT id FROM content_types WHERE slug = 'ritual'),
        (SELECT id FROM users WHERE username = 'moonchild'),
        'published',
        TRUE,
        CURRENT_TIMESTAMP - INTERVAL '15 days'
    ),
    (
        'Rosemary: The Magical Herb',
        'rosemary-magical-herb',
        E'# Rosemary: The Magical Herb\n\n## Botanical Name:\nRosmarinus officinalis\n\n## Magical Properties:\n- Protection\n- Purification\n- Memory enhancement\n- Love\n- Mental clarity\n\n## Elemental Correspondence:\nFire\n\n## Planetary Correspondence:\nSun\n\n## Uses:\n\n### In Spells:\nRosemary is incredibly versatile. Add to protection sachets, burn as incense for purification, or add to love spells.\n\n### In the Kitchen:\nRosemary can be used in cooking to infuse food with protective and loving energy.\n\n### Medicinal:\nRosemary tea can improve memory and concentration.\n\n## Growing Tips:\nRosemary prefers full sun and well-drained soil. Can be grown in pots indoors.\n\n## Harvest:\nBest harvested in the morning after the dew has dried.',
        'Complete guide to the magical properties and uses of rosemary.',
        (SELECT id FROM content_types WHERE slug = 'herb'),
        (SELECT id FROM users WHERE username = 'witchyways'),
        'published',
        TRUE,
        CURRENT_TIMESTAMP - INTERVAL '20 days'
    ),
    (
        'Clear Quartz: The Master Healer',
        'clear-quartz-master-healer',
        E'# Clear Quartz: The Master Healer\n\n## Properties:\nClear quartz is known as the "master healer" and can amplify energy and thought.\n\n## Magical Uses:\n- Amplification of intentions\n- Energy cleansing\n- Meditation\n- Programming for specific purposes\n- Healing work\n\n## Chakra:\nAll chakras, especially Crown\n\n## Element:\nAll elements\n\n## Cleansing:\nClear quartz can be cleansed with:\n- Moonlight (especially full moon)\n- Sunlight (briefly)\n- Salt water\n- Smoke from sage or incense\n- Sound (singing bowls)\n\n## Programming:\nTo program clear quartz:\n1. Cleanse the crystal\n2. Hold it in your hands\n3. Focus on your intention\n4. Visualize white light filling the crystal\n5. State your intention clearly\n6. Thank the crystal\n\n## Care:\nClear quartz is relatively hardy but can be scratched. Store separately from softer stones.',
        'Everything you need to know about clear quartz crystal.',
        (SELECT id FROM content_types WHERE slug = 'crystal'),
        (SELECT id FROM users WHERE username = 'stardust'),
        'published',
        TRUE,
        CURRENT_TIMESTAMP - INTERVAL '10 days'
    );

-- =============================================================================
-- LINK GRIMOIRES TO CATEGORIES, TAGS, ETC.
-- =============================================================================

-- Link grimoires to categories (using new unified entity_categories table)
INSERT INTO entity_categories (entity_type, entity_id, category_id)
SELECT 
    'grimoire' as entity_type,
    g.id,
    c.id
FROM grimoires g
CROSS JOIN categories c
WHERE (g.slug = 'simple-protection-spell-beginners' AND c.slug IN ('spellwork', 'protection-magic'))
   OR (g.slug = 'full-moon-manifestation-ritual' AND c.slug IN ('rituals-ceremonies', 'moon-magic'))
   OR (g.slug = 'rosemary-magical-herb' AND c.slug IN ('herbalism', 'protection-magic'))
   OR (g.slug = 'clear-quartz-master-healer' AND c.slug IN ('crystals-stones', 'healing'));

-- Link grimoires to tags (using new unified entity_tags table)
INSERT INTO entity_tags (entity_type, entity_id, tag_id)
SELECT 
    'grimoire' as entity_type,
    g.id,
    t.id
FROM grimoires g
CROSS JOIN tags t
WHERE (g.slug = 'simple-protection-spell-beginners' AND t.name IN ('beginner-friendly', 'candle-magic', 'quick-spell', 'solitary'))
   OR (g.slug = 'full-moon-manifestation-ritual' AND t.name IN ('full-moon', 'visualization', 'outdoor', 'solitary'))
   OR (g.slug = 'rosemary-magical-herb' AND t.name IN ('beginner-friendly', 'daily-practice'))
   OR (g.slug = 'clear-quartz-master-healer' AND t.name IN ('beginner-friendly', 'meditation'));

-- Link grimoires to moon phases using entity_moon_phases polymorphic table
INSERT INTO entity_moon_phases (entity_type, entity_id, moon_phase_id, effectiveness)
SELECT 
    'grimoire' as entity_type,
    g.id,
    mp.id,
    'optimal' as effectiveness
FROM grimoires g
CROSS JOIN moon_phases mp
WHERE g.slug = 'full-moon-manifestation-ritual' AND mp.slug = 'full-moon';

-- =============================================================================
-- SAMPLE SOCIAL INTERACTIONS
-- =============================================================================

-- Add some likes
INSERT INTO grimoire_interactions (grimoire_id, user_id, interaction_type)
SELECT 
    g.id,
    u.id,
    'like'
FROM grimoires g
CROSS JOIN users u
WHERE g.slug IN ('simple-protection-spell-beginners', 'full-moon-manifestation-ritual')
  AND u.username IN ('moonchild', 'stardust');

-- Add some favorites
INSERT INTO grimoire_interactions (grimoire_id, user_id, interaction_type)
SELECT 
    g.id,
    u.id,
    'favorite'
FROM grimoires g
CROSS JOIN users u
WHERE g.slug = 'simple-protection-spell-beginners'
  AND u.username IN ('moonchild', 'stardust');

-- Add some comments
INSERT INTO comments (grimoire_id, user_id, content)
SELECT 
    g.id,
    u.id,
    'This spell worked wonderfully for me! Thank you for sharing.'
FROM grimoires g
CROSS JOIN users u
WHERE g.slug = 'simple-protection-spell-beginners'
  AND u.username = 'moonchild';

INSERT INTO comments (grimoire_id, user_id, content)
SELECT 
    g.id,
    u.id,
    'Beautiful ritual! I performed this last full moon and felt such powerful energy.'
FROM grimoires g
CROSS JOIN users u
WHERE g.slug = 'full-moon-manifestation-ritual'
  AND u.username = 'stardust';

-- Create sample boards
INSERT INTO user_boards (user_id, name, description, is_public)
SELECT 
    id,
    'My Favorite Spells',
    'Collection of my go-to spells',
    TRUE
FROM users
WHERE username = 'moonchild';

INSERT INTO user_boards (user_id, name, description, is_public)
SELECT 
    id,
    'Beginner Resources',
    'Great resources for those just starting their journey',
    TRUE
FROM users
WHERE username = 'stardust';

-- Add items to boards
INSERT INTO board_items (board_id, grimoire_id, notes)
SELECT 
    ub.id,
    g.id,
    'Perfect for quick protection'
FROM user_boards ub
CROSS JOIN grimoires g
WHERE ub.name = 'My Favorite Spells'
  AND g.slug = 'simple-protection-spell-beginners';

INSERT INTO board_items (board_id, grimoire_id, notes)
SELECT 
    ub.id,
    g.id,
    'Essential reading for beginners'
FROM user_boards ub
CROSS JOIN grimoires g
WHERE ub.name = 'Beginner Resources'
  AND g.slug IN ('simple-protection-spell-beginners', 'rosemary-magical-herb', 'clear-quartz-master-healer');

-- =============================================================================
-- SAMPLE ANALYTICS DATA
-- =============================================================================

-- Add some view tracking (simulating views over time)
INSERT INTO grimoire_views (grimoire_id, user_id, viewed_at)
SELECT 
    g.id,
    u.id,
    CURRENT_TIMESTAMP - (random() * INTERVAL '30 days')
FROM grimoires g
CROSS JOIN users u
CROSS JOIN generate_series(1, 5) -- Each user views each grimoire ~5 times
WHERE g.status = 'published';

-- Refresh materialized views
REFRESH MATERIALIZED VIEW grimoire_stats;
REFRESH MATERIALIZED VIEW user_stats;

-- =============================================================================
-- END OF SEED DATA
-- =============================================================================
