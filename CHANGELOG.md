# Database Changelog

## 2025-12-29 - Schema Simplification

### Removed Tables

#### Media Junction Tables (Redundant)
All entity-specific media junction tables have been removed since each entity already has a `primary_image_url` field:
- ❌ `crystal_media`
- ❌ `herb_media`
- ❌ `candle_media`
- ❌ `incense_media`
- ❌ `oil_media`
- ❌ `salt_media`

**Rationale**: Each entity table already has a `primary_image_url TEXT` field that supports a single nullable image. The complex junction table system was over-engineered for the current requirements.

**If multiple images are needed in the future**: Consider adding a `JSONB` array field or creating a single polymorphic `entity_media` table.

---

#### Category Junction Tables (Consolidated)
All entity-specific category junction tables have been removed:
- ❌ `crystal_categories`
- ❌ `herb_categories`
- ❌ `candle_categories`
- ❌ `incense_categories`
- ❌ `oil_categories`
- ❌ `salt_categories`
- ❌ `grimoire_categories`

**Replaced with**: ✅ `entity_categories` (polymorphic table)

---

#### Tag Junction Tables (Consolidated)
All entity-specific tag junction tables have been removed:
- ❌ `crystal_tags`
- ❌ `herb_tags`
- ❌ `candle_tags`
- ❌ `incense_tags`
- ❌ `oil_tags`
- ❌ `salt_tags`
- ❌ `grimoire_tags`

**Replaced with**: ✅ `entity_tags` (polymorphic table)

---

### New Unified Tables

#### `entity_categories`
A polymorphic junction table that links any entity type to categories.

```sql
CREATE TABLE entity_categories (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    entity_type VARCHAR(50) NOT NULL,  -- 'crystal', 'herb', 'candle', etc.
    entity_id UUID NOT NULL,
    category_id UUID NOT NULL REFERENCES categories(id) ON DELETE CASCADE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    
    UNIQUE(entity_type, entity_id, category_id),
    
    CONSTRAINT valid_entity_type CHECK (entity_type IN (
        'crystal', 'herb', 'candle', 'incense', 'oil', 'salt',
        'grimoire', 'deity', 'sabbat', 'moon_phase', 'zodiac_sign'
    ))
);
```

**Benefits**:
- Single table for all entity categorization
- Easy to add new entity types
- Consistent querying across all entities
- Reduced database complexity

**Example Usage**:
```sql
-- Add a category to a candle
INSERT INTO entity_categories (entity_type, entity_id, category_id)
VALUES ('candle', 'uuid-of-red-candle', 'uuid-of-fire-category');

-- Query all candles in a category
SELECT c.* FROM candles c
JOIN entity_categories ec ON ec.entity_id = c.id
WHERE ec.entity_type = 'candle' AND ec.category_id = 'uuid-of-fire-category';

-- Query all categories for a specific candle
SELECT cat.* FROM categories cat
JOIN entity_categories ec ON ec.category_id = cat.id
WHERE ec.entity_type = 'candle' AND ec.entity_id = 'uuid-of-red-candle';
```

---

#### `entity_tags`
A polymorphic junction table that links any entity type to tags.

```sql
CREATE TABLE entity_tags (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    entity_type VARCHAR(50) NOT NULL,  -- 'crystal', 'herb', 'candle', etc.
    entity_id UUID NOT NULL,
    tag_id UUID NOT NULL REFERENCES tags(id) ON DELETE CASCADE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    
    UNIQUE(entity_type, entity_id, tag_id),
    
    CONSTRAINT valid_entity_type CHECK (entity_type IN (
        'crystal', 'herb', 'candle', 'incense', 'oil', 'salt',
        'grimoire', 'deity', 'sabbat', 'moon_phase', 'zodiac_sign'
    ))
);
```

**Benefits**:
- Single unified tagging system
- Consistent tag management across all content
- Simplified queries
- Easier to implement tag-based search

**Example Usage**:
```sql
-- Tag a candle
INSERT INTO entity_tags (entity_type, entity_id, tag_id)
VALUES ('candle', 'uuid-of-red-candle', 'uuid-of-love-tag');

-- Find all entities with a specific tag
SELECT entity_type, entity_id FROM entity_tags
WHERE tag_id = 'uuid-of-love-tag';

-- Query all tags for a grimoire
SELECT t.* FROM tags t
JOIN entity_tags et ON et.tag_id = t.id
WHERE et.entity_type = 'grimoire' AND et.entity_id = 'uuid-of-spell';
```

---

### Migration Notes

**Database Rebuild Required**: Since these are structural changes to junction tables, the database will need to be rebuilt from the init scripts.

**Steps to Rebuild**:

1. **Backup any existing data** (if applicable)
2. **Stop the database container**:
   ```bash
   cd database
   docker-compose down -v
   ```
3. **Restart the database** (will run init scripts):
   ```bash
   docker-compose up -d
   ```

**No data migration scripts needed** since this is early development and the init scripts now create the correct structure.

---

### Files Modified

- ✏️ `database/init/02-schema.sql` - Removed `grimoire_categories` and `grimoire_tags` tables
- ✏️ `database/init/04-entity-tables.sql` - Removed all `*_media` junction tables
- ✏️ `database/init/05-relationships.sql` - Removed all entity-specific category and tag tables, added `entity_categories` and `entity_tags`

---

### Impact on Application Code

**Backend Changes Required**:
- Update repository/DAO classes to use `entity_categories` instead of specific tables
- Update repository/DAO classes to use `entity_tags` instead of specific tables
- Media queries can be simplified to use `primary_image_url` directly

**Example Backend Query Pattern**:
```kotlin
// Old way (entity-specific)
SELECT * FROM candle_categories WHERE candle_id = ?

// New way (unified)
SELECT * FROM entity_categories 
WHERE entity_type = 'candle' AND entity_id = ?
```

---

### Schema Statistics

**Tables Removed**: 20
- 6 media tables
- 7 category junction tables
- 7 tag junction tables

**Tables Added**: 2
- `entity_categories`
- `entity_tags`

**Net Result**: -18 tables 🎉

**Complexity Reduction**: Significant improvement in maintainability and consistency.
