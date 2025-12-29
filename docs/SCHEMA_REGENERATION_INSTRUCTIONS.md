# Schema Regeneration Instructions

## Overview

The `schema.sql` file is a **PostgreSQL dump** (generated via `pg_dump`) and is now **out of sync** with the init scripts after the recent schema simplification changes.

## Current Status

✅ **Init scripts are up to date** with the new unified tables:
- `database/init/02-schema.sql`
- `database/init/04-entity-tables.sql`
- `database/init/05-relationships.sql`

❌ **schema.sql is outdated** and still contains old tables:
- `candle_media`, `crystal_media`, etc.
- `candle_categories`, `crystal_categories`, etc.
- `candle_tags`, `crystal_tags`, etc.

## How to Regenerate schema.sql

### Step 1: Rebuild the Database

Stop and remove the existing database container (this will destroy all data):

```bash
cd database
docker-compose down -v
```

Start the database (this will run all init scripts in order):

```bash
docker-compose up -d
```

Wait for the database to be fully initialized (~10-30 seconds):

```bash
# Check logs to ensure initialization is complete
docker-compose logs -f postgres
```

Look for: `database system is ready to accept connections`

### Step 2: Generate New schema.sql

Run `pg_dump` to create a fresh schema dump:

```bash
docker-compose exec postgres pg_dump \
  -U grimoire_user \
  -d grimoire_collective \
  --schema-only \
  --no-owner \
  --no-privileges \
  > schema.sql
```

### Step 3: Verify the Changes

Check that the old tables are gone and new tables exist:

```bash
# Should return 0 results (tables removed)
grep -c "CREATE TABLE.*candle_media" schema.sql
grep -c "CREATE TABLE.*candle_categories" schema.sql
grep -c "CREATE TABLE.*candle_tags" schema.sql

# Should return 1 result each (new unified tables)
grep -c "CREATE TABLE.*entity_categories" schema.sql
grep -c "CREATE TABLE.*entity_tags" schema.sql
```

## Alternative: Delete schema.sql

If `schema.sql` is not actively being used, you can simply **delete it** and rely on the init scripts as the source of truth:

```bash
rm database/schema.sql
```

The init scripts in `database/init/` are more maintainable and are what actually create the database schema on startup.

## Recommendation

**Use init scripts as the source of truth** and only regenerate `schema.sql` when:
- You need to share the full schema with someone
- You need to document the complete database structure
- You're preparing for production deployment

Otherwise, the init scripts are sufficient and easier to maintain.
