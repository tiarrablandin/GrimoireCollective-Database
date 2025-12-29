

# Entity-Based Architecture Guide

## Overview

This database uses a **hybrid content model** that combines:
1. **Dedicated entity tables** for structured, encyclopedia-style content (crystals, herbs, candles, etc.)
2. **User-generated content table** (grimoires) for spells, rituals, notes, and articles
3. **Rich relationship tables** to interconnect everything

This approach gives you the **best of both worlds**:
- Structured, queryable data for encyclopedia entries
- Flexibility for user-generated content
- Deep interconnections between all content types

---

## Architecture Principles

### 1. **Dedicated Entity Tables**

Each major component type has its own table with **specialized fields**:

```sql
crystals (
    name, alternative_names, color, chakra, 
    magical_properties[], cleansing_methods[],
    mohs_hardness, chemical_composition, ...
)

herbs (
    name, scientific_name, plant_family,
    magical_properties[], parts_used[],
    toxicity_level, pregnancy_safe, ...
)

candles (
    color, candle_type, magical_properties[],
    element, planet, day_of_week, ...
)

oils (
    oil_type, source_plant, magical_properties[],
    skin_safe, dilution_required, ...
)

incense (
    incense_type, scent_profile, ingredients[],
    magical_properties[], burn_time, ...
)
```

**Why?** 
- Each entity has unique properties (e.g., crystals have hardness, herbs have scientific names)
- Enables precise querying ("show me all herbs that are pregnancy-safe")
- Structured data is easier to display consistently on the front-end
- Better data validation and integrity

### 2. **PostgreSQL Arrays for Multi-Value Properties**

Many properties can have multiple values:

```sql
-- A crystal can have multiple magical properties
magical_properties: ['love', 'healing', 'protection']

-- An herb can be used in multiple ways
parts_used: ['leaves', 'flowers', 'roots']

-- A candle works well with multiple other items
herb_combinations: ['lavender', 'rose', 'chamomile']
```

**Benefits:**
- No junction tables needed for simple lists
- Easy to query: `WHERE 'protection' = ANY(magical_properties)`
- Maintains order (arrays are ordered)
- More efficient than separate rows

### 3. **JSONB for Flexible Metadata**

Each entity has a `metadata` JSONB field for additional, variable data:

```sql
{
  "folklore": "Ancient Greeks believed...",
  "historical_uses": ["Medieval love potions", "Victorian mourning rituals"],
  "deities_associated": ["Aphrodite", "Venus"],
  "cultural_notes": {
    "celtic": "Used in Samhain rituals",
    "norse": "Sacred to Freya"
  }
}
```

**Why JSONB?**
- Accommodates data that varies between entities
- Can be indexed and queried
- Evolves without schema changes
- Perfect for cultural variations, folklore, etc.

---

## How Linking Works

### The Problem You Described

> "I want all of this to be linked. Like on the spells page I want the ingredients (herbs, crystals, candles, etc.) to all be clickable."

### The Solution: Junction/Relationship Tables

We create **junction tables** that connect grimoires (spells) to entities:

```sql
-- Link spells to crystals
grimoire_crystals (
    grimoire_id → links to spell
    crystal_id → links to crystal
    quantity → "1 piece" or "7 stones"
    purpose → "For heart chakra healing"
    optional → true/false
    display_order → 1, 2, 3...
)

-- Link spells to herbs
grimoire_herbs (
    grimoire_id, herb_id, 
    quantity, preparation, purpose, optional, display_order
)

-- And so on for candles, oils, incense...
```

### Example: Self-Love Spell

**Spell Record:**
```sql
grimoires (
    id: '123-abc-...',
    title: 'Self-Love and Confidence Spell',
    content: 'Step by step instructions...'
)
```

**Crystal Ingredients:**
```sql
grimoire_crystals:
  - grimoire_id: '123-abc', crystal_id: 'rose-quartz-id'
    quantity: '1 piece', purpose: 'Heart chakra work'
  - grimoire_id: '123-abc', crystal_id: 'clear-quartz-id'
    quantity: '1 piece', purpose: 'Amplify energy', optional: true
```

**Herb Ingredients:**
```sql
grimoire_herbs:
  - grimoire_id: '123-abc', herb_id: 'lavender-id'
    quantity: 'A handful', preparation: 'dried', purpose: 'Peace and calm'
```

### Frontend Display

When you load the spell page:

```typescript
// 1. Get the spell
const spell = await db.grimoires.findOne({ slug: 'self-love-spell' });

// 2. Get all linked crystals with JOIN
const crystals = await db.query(`
  SELECT c.*, gc.quantity, gc.purpose, gc.optional
  FROM crystals c
  JOIN grimoire_crystals gc ON c.id = gc.crystal_id
  WHERE gc.grimoire_id = $1
  ORDER BY gc.display_order
`, [spell.id]);

// 3. Render with links
crystals.map(crystal => (
  <Link href={`/crystals/${crystal.slug}`}>
    {crystal.name}
  </Link>
  <span>{crystal.quantity} - {crystal.purpose}</span>
));
```

---

## Bi-Directional Relationships

### Show "Used In" on Entity Pages

On a crystal page, show which spells use it:

```sql
-- On Rose Quartz page, show all spells that use it
SELECT g.title, g.slug, gc.purpose
FROM grimoires g
JOIN grimoire_crystals gc ON g.id = gc.grimoire_id
WHERE gc.crystal_id = 'rose-quartz-id'
  AND g.status = 'published'
ORDER BY g.created_at DESC;
```

This creates a **web of interconnected knowledge**:
- Spell pages link to ingredient pages
- Ingredient pages link back to spells that use them
- Everything is discoverable and explorable

---

## Cross-Entity Relationships

Beyond spell ingredients, entities can relate to each other:

### Pairings (What Works Well Together)

```sql
crystal_herb_pairings (
    rose_quartz + lavender → "Both promote love and peace"
    amethyst + mugwort → "Enhance psychic abilities"
)

crystal_candle_pairings (
    citrine + green_candle → "Amplify prosperity work"
)
```

### Deity Associations

```sql
deity_crystals (
    aphrodite + rose_quartz → "Sacred to the goddess of love"
)

deity_herbs (
    artemis + mugwort → "Named after the goddess"
)
```

### Substitutions

```sql
crystal_substitutes (
    crystal_id: rose_quartz
    substitute_id: pink_calcite
    reason: "Similar heart chakra energy"
    effectiveness: "good"
)

herb_substitutes (
    herb_id: rare_expensive_herb
    substitute_id: common_cheap_herb
    effectiveness: "fair"
)
```

---

## Querying Examples

### Find all crystals good for love AND healing

```sql
SELECT * FROM crystals
WHERE magical_properties @> ARRAY['love', 'healing']
  AND deleted_at IS NULL;
```

### Find herbs that are pregnancy-safe and good for sleep

```sql
SELECT * FROM herbs
WHERE pregnancy_safe = true
  AND 'sleep' = ANY(magical_properties)
  AND deleted_at IS NULL;
```

### Find all spells that use lavender

```sql
SELECT g.* 
FROM grimoires g
JOIN grimoire_herbs gh ON g.id = gh.grimoire_id
JOIN herbs h ON gh.herb_id = h.id
WHERE h.slug = 'lavender'
  AND g.status = 'published';
```

### Find candles that work well with rose quartz

```sql
SELECT c.*, ccp.purpose
FROM candles c
JOIN crystal_candle_pairings ccp ON c.id = ccp.candle_id
JOIN crystals cr ON ccp.crystal_id = cr.id
WHERE cr.slug = 'rose-quartz';
```

### Full-text search across all crystals

```sql
SELECT *, 
       ts_rank(to_tsvector('english', name || ' ' || description), 
               plainto_tsquery('english', 'love healing')) as rank
FROM crystals
WHERE to_tsvector('english', name || ' ' || description) 
      @@ plainto_tsquery('english', 'love healing')
ORDER BY rank DESC;
```

---

## Page Structure Recommendations

### Crystal Page (e.g., `/crystals/rose-quartz`)

**Sections:**
1. **Header**
   - Name + alternative names
   - Primary image/carousel
   - Quick stats (color, chakra, element, rarity)

2. **Properties**
   - Magical properties (as tags/badges)
   - Physical properties (hardness, chemical composition)
   - Correspondences (zodiac, planet, element)

3. **Usage Information**
   - Description
   - How to use
   - Cleansing methods
   - Charging methods
   - Affirmations

4. **Care & Safety**
   - Water safe? Sun safe?
   - Toxicity warnings
   - Storage tips

5. **Relationships**
   - Works well with (herbs, candles, oils) → clickable
   - Substitutes → clickable
   - Associated deities → clickable

6. **Used In**
   - List of spells/rituals that use this crystal → clickable
   - "Rose Quartz is used in 47 spells"

7. **Social**
   - Like/favorite buttons
   - Comments section
   - User notes/experiences

### Spell Page (e.g., `/spells/self-love-spell`)

**Sections:**
1. **Header**
   - Title
   - Image
   - Author, published date
   - Tags and categories

2. **Overview**
   - Purpose/intention
   - Difficulty level
   - Time required

3. **Timing**
   - Moon phase → clickable to moon phase page
   - Zodiac sign → clickable
   - Sabbat → clickable
   - Day of week, time of day

4. **Ingredients** (each clickable)
   - **Crystals**: Rose Quartz (1 piece - for heart chakra)
   - **Herbs**: Lavender (dried, handful - for peace)
   - **Candles**: Pink Candle (1 - for self-love)
   - **Oils**: Rose Oil (for anointing)
   - **Incense**: Nag Champa (optional)

5. **Instructions**
   - Step-by-step
   - Numbered/ordered
   - Can include embedded images/videos

6. **Notes & Tips**
   - Additional guidance
   - Common mistakes
   - Variations

7. **Deities & Correspondences**
   - Associated deities → clickable
   - Elements, planets

8. **Social**
   - Like/favorite/share
   - Comments
   - "I tried this" user submissions

---

## Database Benefits

### For Users
✅ **Rich, detailed pages** for every crystal, herb, deity, etc.
✅ **Everything is connected** - easy to explore and learn
✅ **Clickable ingredients** - jump from spell to crystal info
✅ **Discover relationships** - "What works with rose quartz?"
✅ **Find substitutes** - "I don't have this, what can I use?"
✅ **Safety information** - toxicity, pregnancy warnings, etc.

### For Developers
✅ **Type-safe queries** - structured tables with proper types
✅ **Easy to validate** - constraints enforce data quality
✅ **Performant** - proper indexes on all relationships
✅ **Flexible** - JSONB allows evolution without migration
✅ **Full-text search** - built-in PostgreSQL FTS
✅ **Scalable** - can handle millions of relationships

### For Content
✅ **Moderation system** - `is_verified` flags, `created_by` tracking
✅ **Soft deletes** - `deleted_at` preserves data integrity
✅ **Versioning ready** - can track changes over time
✅ **Multi-media** - dedicated media tables with proper linking
✅ **Social features** - likes, favorites, comments on everything

---

## Adding New Entity Types

To add a new entity type (e.g., "Tarot Cards"):

### 1. Create Entity Table

```sql
CREATE TABLE tarot_cards (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(100) UNIQUE NOT NULL,
    slug VARCHAR(100) UNIQUE NOT NULL,
    
    -- Specific to tarot
    suit VARCHAR(20), -- Major Arcana, Cups, Swords, Wands, Pentacles
    number INTEGER, -- 0-21 for major, 1-14 for minor
    upright_meaning TEXT,
    reversed_meaning TEXT,
    symbolism TEXT,
    
    -- Common fields
    magical_properties TEXT[],
    element VARCHAR(20),
    zodiac_signs TEXT[],
    
    description TEXT NOT NULL,
    metadata JSONB,
    primary_image_url TEXT,
    
    created_by UUID REFERENCES users(id),
    is_verified BOOLEAN DEFAULT FALSE,
    
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP
);

-- Indexes
CREATE INDEX idx_tarot_cards_slug ON tarot_cards(slug) WHERE deleted_at IS NULL;
CREATE INDEX idx_tarot_cards_suit ON tarot_cards(suit) WHERE deleted_at IS NULL;
```

### 2. Create Relationship Tables

```sql
-- Link tarot cards to grimoires
CREATE TABLE grimoire_tarot_cards (
    grimoire_id UUID REFERENCES grimoires(id) ON DELETE CASCADE,
    tarot_card_id UUID REFERENCES tarot_cards(id) ON DELETE CASCADE,
    purpose TEXT,
    optional BOOLEAN DEFAULT FALSE,
    display_order INTEGER DEFAULT 0,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (grimoire_id, tarot_card_id)
);

-- Social features
CREATE TABLE tarot_card_likes (
    user_id UUID REFERENCES users(id) ON DELETE CASCADE,
    tarot_card_id UUID REFERENCES tarot_cards(id) ON DELETE CASCADE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id, tarot_card_id)
);

-- Categories and tags
CREATE TABLE tarot_card_categories (
    tarot_card_id UUID REFERENCES tarot_cards(id) ON DELETE CASCADE,
    category_id UUID REFERENCES categories(id) ON DELETE CASCADE,
    PRIMARY KEY (tarot_card_id, category_id)
);
```

### 3. Add to Entity Views Tracking

```sql
-- Already handled! Just use entity_type = 'tarot_card'
INSERT INTO entity_views (entity_type, entity_id, user_id)
VALUES ('tarot_card', 'card-id', 'user-id');
```

### 4. Update Frontend

```typescript
// Add route: /tarot-cards/[slug]
// Add to search
// Add to navigation
// Reuse same component patterns
```

---

## API Endpoints Suggestion

### Entity Endpoints

```
GET  /api/crystals
GET  /api/crystals/:slug
POST /api/crystals (admin)
PUT  /api/crystals/:slug (admin)

GET  /api/herbs
GET  /api/herbs/:slug
POST /api/herbs (admin)

GET  /api/candles
GET  /api/candles/:slug

// Similar for oils, incense, etc.
```

### Relationship Endpoints

```
GET /api/crystals/:slug/spells
  → Returns all spells that use this crystal

GET /api/crystals/:slug/pairings
  → Returns herbs, candles that work well with this crystal

GET /api/crystals/:slug/substitutes
  → Returns substitute crystals

GET /api/spells/:slug/ingredients
  → Returns all ingredients (crystals, herbs, candles, etc.)
```

### Search Endpoint

```
GET /api/search?q=love&types=crystals,herbs,spells
  → Searches across entity types
```

---

## Migration from Current Schema

Your current `grimoires` table with `content_type_id` can coexist with this new structure:

**Option 1: Keep Both**
- User-generated spells/rituals/notes → `grimoires` table
- Encyclopedia entries → dedicated entity tables
- Provides flexibility

**Option 2: Migrate Existing**
- Move existing crystal/herb/deity content from `grimoires` to entity tables
- Keep grimoires for spells/rituals only
- Cleaner separation

**Recommendation**: Start with Option 1, migrate gradually.

---

## Next Steps

1. ✅ **Database Schema** - Already created in `04-entity-tables.sql` and `05-relationships.sql`
2. ✅ **Sample Data** - Created in `06-entity-sample-data.sql`
3. ⏳ **API Endpoints** - Build RESTful API in backend
4. ⏳ **Frontend Components** - Build reusable entity page components
5. ⏳ **Admin Interface** - Create forms for adding/editing entities
6. ⏳ **Search Integration** - Implement full-text search across entities
7. ⏳ **User Contributions** - Allow verified users to suggest edits

---

## Questions?

This architecture gives you:
- ✅ Rich, structured information pages for every crystal, herb, candle, etc.
- ✅ Clickable ingredients on spell pages
- ✅ Bi-directional relationships (spell → crystal, crystal → spells)
- ✅ Cross-entity relationships (crystal → herbs that pair well)
- ✅ Substitutions and alternatives
- ✅ Full social features (likes, favorites, comments)
- ✅ Safety information and warnings
- ✅ Scalable and performant

This is a **professional-grade, production-ready** architecture for your spiritual knowledge platform! 🔮✨
