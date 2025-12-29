# Database - Grimoire Collective

PostgreSQL database for a comprehensive pagan and spiritual knowledge platform.

## Overview

This database supports a rich content management system for spiritual practices, including spells, rituals, herbs, crystals, deities, sabbats, and more. It features a robust social system, user management with RBAC, analytics tracking, and is designed for scalability and performance.

## Structure

```text
database/
├── init/                      # Initialization scripts (run on first start)
│   ├── 01-init.sql           # Extensions and basic setup
│   ├── 02-schema.sql         # Complete database schema
│   └── 03-seed-data.sql      # Sample/development data
├── migrations/               # Manual migration scripts (if needed)
├── docker-compose.yml        # Standalone database setup
└── README.md                 # This file
```

## Running Locally

### Using Docker Compose (Recommended)

From the database directory:

```bash
docker-compose up -d
```

Or from the root directory to run all services:

```bash
cd ..
docker-compose up
```

### Connection Details

- **Host**: localhost
- **Port**: 5432
- **Database**: grimoire_collective
- **Username**: grimoire_user
- **Password**: grimoire_password
- **Connection String**: `postgresql://grimoire_user:grimoire_password@localhost:5432/grimoire_collective`

## Documentation

Comprehensive documentation is available in the `docs/` directory:

- **[docs/QUICKSTART.md](docs/QUICKSTART.md)** - Quick setup and getting started guide
- **[docs/SCHEMA.md](docs/SCHEMA.md)** - Detailed schema documentation for all tables
- **[docs/QUERIES.md](docs/QUERIES.md)** - Common SQL query examples
- **[docs/ARCHITECTURE.md](docs/ARCHITECTURE.md)** - Database architecture and design patterns
- **[docs/BUILD_COMPLETE.md](docs/BUILD_COMPLETE.md)** - Build summary and features overview
- **[docs/TESTING.md](docs/TESTING.md)** - Testing checklist and verification

## Database Schema Overview

### Core Entities

#### 1. Users & Authentication
- **users** - User accounts with profile information
- **roles** - Role definitions (super_admin, admin, user)
- **permissions** - Granular permissions system
- **role_permissions** - Role-permission assignments
- **user_roles** - User-role assignments
- **user_settings** - User preferences and settings
- **subscription_tiers** - Subscription levels (future-ready)
- **user_subscriptions** - User subscription tracking

#### 2. Content Management
- **grimoires** - Main content table (spells, rituals, articles, etc.)
- **content_types** - Types of content (spell, ritual, herb, crystal, etc.)
- **media_files** - Images, videos, and other media
- **grimoire_media** - Links media to grimoires

#### 3. Taxonomy & Organization
- **categories** - Hierarchical categories
- **tags** - Flexible tagging system
- **grimoire_categories** - Grimoire-category associations
- **grimoire_tags** - Grimoire-tag associations

#### 4. Spiritual Entities
- **deities** - Gods, goddesses, and divine entities
- **sabbats** - Pagan holidays and celebrations
- **zodiac_signs** - Astrological signs
- **moon_phases** - Lunar phases with magical properties
- Junction tables for linking grimoires to spiritual entities

#### 5. Social Features
- **grimoire_likes** - Like system
- **grimoire_dislikes** - Dislike system
- **grimoire_favorites** - User favorites
- **comments** - Threaded comments with replies
- **comment_likes** - Comment likes
- **user_boards** - User-created collections/lists
- **board_items** - Items in user boards

#### 6. Analytics & Tracking
- **grimoire_views** - View tracking with user and IP data
- **user_activity_log** - General activity logging
- **grimoire_stats** (Materialized View) - Aggregated grimoire statistics
- **user_stats** (Materialized View) - Aggregated user statistics

### Key Features

#### UUID Primary Keys
All tables use UUIDs for security and distributed system compatibility.

#### Soft Deletes
Most user-generated content supports soft deletion via `deleted_at` timestamp.

#### Timestamps
All tables have `created_at` and most have `updated_at` columns with automatic triggers.

#### Full-Text Search
PostgreSQL full-text search indices on grimoire content (can work alongside ElasticSearch).

#### JSONB Metadata
Flexible `metadata` and `settings_json` columns for extensibility.

#### Materialized Views
Pre-computed statistics for performance on frequently accessed metrics.

## Sample Data

The `03-seed-data.sql` file includes:

- Default roles and permissions
- Sample categories and tags
- Sample users (password: `password123`)
  - admin@grimoirecollective.com (super_admin)
  - witchy@example.com (user)
  - moon@example.com (user)
  - star@example.com (user)
- Sample grimoires (spells, rituals, herbs, crystals)
- All zodiac signs
- All moon phases
- Major pagan sabbats
- Sample deities
- Social interactions (likes, comments, boards)

## Database Maintenance

### Refresh Materialized Views

Materialized views should be refreshed periodically:

```sql
REFRESH MATERIALIZED VIEW grimoire_stats;
REFRESH MATERIALIZED VIEW user_stats;
```

Consider setting up a cron job or scheduled task to refresh these views.

### Backup

Create a backup:

```bash
docker exec -t grimoire-postgres pg_dump -U grimoire_user grimoire_collective > backup.sql
```

Backup with custom format (recommended for large databases):

```bash
docker exec -t grimoire-postgres pg_dump -U grimoire_user -Fc grimoire_collective > backup.dump
```

### Restore

```bash
docker exec -i grimoire-postgres psql -U grimoire_user grimoire_collective < backup.sql
```

## Accessing PostgreSQL

### Using psql

```bash
docker exec -it grimoire-postgres psql -U grimoire_user -d grimoire_collective
```

### Using a GUI Client

You can connect to the database using tools like:
- pgAdmin
- DBeaver
- TablePlus

Use the connection details listed above.
