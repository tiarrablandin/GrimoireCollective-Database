# Database Schema Documentation

## Entity Relationship Overview

This document provides detailed information about the database schema for Grimoire Collective.

## Table of Contents

1. [Users & Authentication](#users--authentication)
2. [Content Management](#content-management)
3. [Taxonomy](#taxonomy)
4. [Spiritual Entities](#spiritual-entities)
5. [Social Features](#social-features)
6. [Analytics](#analytics)
7. [Subscriptions](#subscriptions)
8. [Indexes & Performance](#indexes--performance)

---

## Users & Authentication

### users

Primary table for user accounts.

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | UUID | PRIMARY KEY | Unique user identifier |
| username | VARCHAR(50) | UNIQUE, NOT NULL | User's login name |
| email | VARCHAR(255) | UNIQUE, NOT NULL | User's email address |
| password_hash | VARCHAR(255) | NOT NULL | Bcrypt hashed password |
| display_name | VARCHAR(100) | | Public display name |
| avatar_url | TEXT | | URL to avatar image |
| bio | TEXT | | User biography |
| location | VARCHAR(100) | | User location |
| website_url | TEXT | | Personal website |
| is_email_verified | BOOLEAN | DEFAULT FALSE | Email verification status |
| is_active | BOOLEAN | DEFAULT TRUE | Account active status |
| last_login_at | TIMESTAMP | | Last login timestamp |
| created_at | TIMESTAMP | NOT NULL | Account creation time |
| updated_at | TIMESTAMP | NOT NULL | Last update time |
| deleted_at | TIMESTAMP | | Soft delete timestamp |

**Constraints:**
- Username minimum 3 characters
- Email format validation

**Indexes:**
- `username` (unique)
- `email` (unique)

### roles

System roles for RBAC.

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | UUID | PRIMARY KEY | Role identifier |
| name | VARCHAR(50) | UNIQUE, NOT NULL | Role name |
| description | TEXT | | Role description |
| created_at | TIMESTAMP | NOT NULL | Creation time |
| updated_at | TIMESTAMP | NOT NULL | Update time |

**Default Roles:**
- `super_admin` - Full system access
- `admin` - Elevated privileges
- `user` - Standard access

### permissions

Granular permissions system.

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | UUID | PRIMARY KEY | Permission identifier |
| name | VARCHAR(100) | UNIQUE, NOT NULL | Permission name |
| description | TEXT | | Permission description |
| resource | VARCHAR(50) | NOT NULL | Resource type |
| action | VARCHAR(50) | NOT NULL | Action type |
| created_at | TIMESTAMP | NOT NULL | Creation time |

### role_permissions

Junction table linking roles to permissions.

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| role_id | UUID | FK → roles(id) | Role reference |
| permission_id | UUID | FK → permissions(id) | Permission reference |
| created_at | TIMESTAMP | NOT NULL | Assignment time |

**Primary Key:** (role_id, permission_id)

### user_roles

Junction table assigning roles to users.

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| user_id | UUID | FK → users(id) | User reference |
| role_id | UUID | FK → roles(id) | Role reference |
| assigned_at | TIMESTAMP | NOT NULL | Assignment time |
| assigned_by | UUID | FK → users(id) | Admin who assigned |

**Primary Key:** (user_id, role_id)

### user_settings

User preferences and settings.

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| user_id | UUID | PRIMARY KEY, FK → users(id) | User reference |
| theme | VARCHAR(20) | DEFAULT 'light' | UI theme |
| language | VARCHAR(10) | DEFAULT 'en' | Interface language |
| timezone | VARCHAR(50) | DEFAULT 'UTC' | User timezone |
| email_notifications | BOOLEAN | DEFAULT TRUE | Email notification preference |
| push_notifications | BOOLEAN | DEFAULT TRUE | Push notification preference |
| privacy_profile_public | BOOLEAN | DEFAULT TRUE | Profile visibility |
| privacy_show_email | BOOLEAN | DEFAULT FALSE | Email visibility |
| settings_json | JSONB | | Additional settings |
| created_at | TIMESTAMP | NOT NULL | Creation time |
| updated_at | TIMESTAMP | NOT NULL | Update time |

---

## Content Management

### content_types

Types of content that can be created.

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | UUID | PRIMARY KEY | Type identifier |
| name | VARCHAR(50) | UNIQUE, NOT NULL | Display name |
| slug | VARCHAR(50) | UNIQUE, NOT NULL | URL-safe identifier |
| description | TEXT | | Type description |
| icon | VARCHAR(50) | | Icon name/identifier |
| is_active | BOOLEAN | DEFAULT TRUE | Active status |
| sort_order | INTEGER | DEFAULT 0 | Display order |
| created_at | TIMESTAMP | NOT NULL | Creation time |
| updated_at | TIMESTAMP | NOT NULL | Update time |

**Default Types:** Spell, Ritual, Recipe, Herb, Crystal, Deity, Sabbat, Divination, Astrology, Meditation, Article, Note

### grimoires

Main content table.

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | UUID | PRIMARY KEY | Content identifier |
| title | VARCHAR(255) | NOT NULL | Content title |
| slug | VARCHAR(255) | UNIQUE, NOT NULL | URL-safe identifier |
| content | TEXT | NOT NULL | Main content (Markdown) |
| excerpt | TEXT | | Short description |
| content_type_id | UUID | FK → content_types(id) | Content type |
| author_id | UUID | FK → users(id) | Content author |
| status | VARCHAR(20) | NOT NULL | Publication status |
| is_public | BOOLEAN | DEFAULT TRUE | Visibility |
| is_featured | BOOLEAN | DEFAULT FALSE | Featured status |
| featured_at | TIMESTAMP | | Featured timestamp |
| meta_title | VARCHAR(255) | | SEO title |
| meta_description | TEXT | | SEO description |
| meta_keywords | TEXT | | SEO keywords |
| version | INTEGER | DEFAULT 1 | Version number |
| previous_version_id | UUID | FK → grimoires(id) | Previous version |
| metadata | JSONB | | Extended metadata |
| published_at | TIMESTAMP | | Publication time |
| created_at | TIMESTAMP | NOT NULL | Creation time |
| updated_at | TIMESTAMP | NOT NULL | Update time |
| deleted_at | TIMESTAMP | | Soft delete time |

**Status Values:** draft, pending_review, published, archived

**Indexes:**
- `author_id` (filtered by deleted_at IS NULL)
- `content_type_id` (filtered)
- `status` (filtered)
- `slug` (filtered)
- `published_at` DESC (filtered)
- `is_featured, featured_at` DESC (filtered)
- Full-text search on `title` and `content`

### media_files

Uploaded media (images, videos).

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | UUID | PRIMARY KEY | Media identifier |
| uploader_id | UUID | FK → users(id) | User who uploaded |
| file_name | VARCHAR(255) | NOT NULL | Stored filename |
| original_file_name | VARCHAR(255) | NOT NULL | Original filename |
| file_path | TEXT | NOT NULL | Storage path |
| file_url | TEXT | NOT NULL | Access URL |
| file_type | VARCHAR(50) | NOT NULL | Type: image/video/audio/document |
| mime_type | VARCHAR(100) | NOT NULL | MIME type |
| file_size_bytes | BIGINT | NOT NULL | File size |
| width | INTEGER | | Image/video width |
| height | INTEGER | | Image/video height |
| duration_seconds | INTEGER | | Video/audio duration |
| thumbnail_url | TEXT | | Thumbnail URL |
| alt_text | TEXT | | Alternative text |
| caption | TEXT | | Media caption |
| metadata | JSONB | | Additional metadata |
| storage_provider | VARCHAR(50) | DEFAULT 'local' | Storage backend |
| storage_key | TEXT | | Provider-specific key |
| created_at | TIMESTAMP | NOT NULL | Upload time |
| updated_at | TIMESTAMP | NOT NULL | Update time |
| deleted_at | TIMESTAMP | | Soft delete time |

**File Types:** image, video, audio, document

### grimoire_media

Links media to grimoires.

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| grimoire_id | UUID | FK → grimoires(id) | Grimoire reference |
| media_id | UUID | FK → media_files(id) | Media reference |
| display_order | INTEGER | DEFAULT 0 | Display order |
| is_primary | BOOLEAN | DEFAULT FALSE | Primary image flag |
| created_at | TIMESTAMP | NOT NULL | Link creation time |

**Primary Key:** (grimoire_id, media_id)

---

## Taxonomy

### categories

Hierarchical categorization system.

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | UUID | PRIMARY KEY | Category identifier |
| name | VARCHAR(100) | NOT NULL | Category name |
| slug | VARCHAR(100) | UNIQUE, NOT NULL | URL-safe identifier |
| description | TEXT | | Category description |
| parent_id | UUID | FK → categories(id) | Parent category |
| icon | VARCHAR(50) | | Icon identifier |
| color | VARCHAR(7) | | Hex color code |
| is_active | BOOLEAN | DEFAULT TRUE | Active status |
| sort_order | INTEGER | DEFAULT 0 | Display order |
| created_at | TIMESTAMP | NOT NULL | Creation time |
| updated_at | TIMESTAMP | NOT NULL | Update time |

**Indexes:**
- `parent_id`
- `slug`

### grimoire_categories

Links grimoires to categories.

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| grimoire_id | UUID | FK → grimoires(id) | Grimoire reference |
| category_id | UUID | FK → categories(id) | Category reference |
| created_at | TIMESTAMP | NOT NULL | Link creation time |

**Primary Key:** (grimoire_id, category_id)

### tags

Flexible tagging system.

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | UUID | PRIMARY KEY | Tag identifier |
| name | VARCHAR(50) | UNIQUE, NOT NULL | Tag name |
| slug | VARCHAR(50) | UNIQUE, NOT NULL | URL-safe identifier |
| description | TEXT | | Tag description |
| usage_count | INTEGER | DEFAULT 0 | Number of uses |
| created_at | TIMESTAMP | NOT NULL | Creation time |
| updated_at | TIMESTAMP | NOT NULL | Update time |

**Indexes:**
- `slug`
- `usage_count` DESC

**Note:** Usage count is automatically maintained via triggers.

### grimoire_tags

Links grimoires to tags.

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| grimoire_id | UUID | FK → grimoires(id) | Grimoire reference |
| tag_id | UUID | FK → tags(id) | Tag reference |
| created_at | TIMESTAMP | NOT NULL | Link creation time |

**Primary Key:** (grimoire_id, tag_id)

---

## Spiritual Entities

### deities

Gods, goddesses, and divine entities.

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | UUID | PRIMARY KEY | Deity identifier |
| name | VARCHAR(100) | NOT NULL | Deity name |
| slug | VARCHAR(100) | UNIQUE, NOT NULL | URL-safe identifier |
| culture | VARCHAR(100) | | Cultural origin |
| pantheon | VARCHAR(100) | | Pantheon affiliation |
| gender | VARCHAR(50) | | Gender presentation |
| domains | TEXT[] | | Areas of influence |
| symbols | TEXT[] | | Associated symbols |
| description | TEXT | | Detailed description |
| image_url | TEXT | | Reference image |
| created_at | TIMESTAMP | NOT NULL | Creation time |
| updated_at | TIMESTAMP | NOT NULL | Update time |

**Indexes:**
- `slug`
- `pantheon`

### grimoire_deities

Links grimoires to deities.

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| grimoire_id | UUID | FK → grimoires(id) | Grimoire reference |
| deity_id | UUID | FK → deities(id) | Deity reference |
| created_at | TIMESTAMP | NOT NULL | Link creation time |

**Primary Key:** (grimoire_id, deity_id)

### sabbats

Pagan holidays and celebrations.

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | UUID | PRIMARY KEY | Sabbat identifier |
| name | VARCHAR(100) | NOT NULL | Sabbat name |
| slug | VARCHAR(100) | UNIQUE, NOT NULL | URL-safe identifier |
| tradition | VARCHAR(100) | | Tradition origin |
| date_type | VARCHAR(20) | NOT NULL | fixed/solar/lunar |
| fixed_date | DATE | | Date (if fixed) |
| description | TEXT | | Sabbat description |
| themes | TEXT[] | | Associated themes |
| colors | TEXT[] | | Traditional colors |
| symbols | TEXT[] | | Associated symbols |
| image_url | TEXT | | Reference image |
| created_at | TIMESTAMP | NOT NULL | Creation time |
| updated_at | TIMESTAMP | NOT NULL | Update time |

**Date Types:** fixed, solar, lunar

### grimoire_sabbats

Links grimoires to sabbats.

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| grimoire_id | UUID | FK → grimoires(id) | Grimoire reference |
| sabbat_id | UUID | FK → sabbats(id) | Sabbat reference |
| created_at | TIMESTAMP | NOT NULL | Link creation time |

**Primary Key:** (grimoire_id, sabbat_id)

### zodiac_signs

Astrological zodiac signs.

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | UUID | PRIMARY KEY | Sign identifier |
| name | VARCHAR(50) | NOT NULL | Sign name |
| slug | VARCHAR(50) | UNIQUE, NOT NULL | URL-safe identifier |
| symbol | VARCHAR(10) | NOT NULL | Zodiac symbol |
| element | VARCHAR(20) | NOT NULL | fire/earth/air/water |
| modality | VARCHAR(20) | NOT NULL | cardinal/fixed/mutable |
| ruling_planet | VARCHAR(50) | | Ruling planet |
| date_range_start | VARCHAR(10) | | Start date (e.g., "Mar 21") |
| date_range_end | VARCHAR(10) | | End date (e.g., "Apr 19") |
| traits | TEXT[] | | Personality traits |
| description | TEXT | | Sign description |
| created_at | TIMESTAMP | NOT NULL | Creation time |

**Elements:** fire, earth, air, water  
**Modalities:** cardinal, fixed, mutable

### grimoire_zodiac

Links grimoires to zodiac signs.

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| grimoire_id | UUID | FK → grimoires(id) | Grimoire reference |
| zodiac_id | UUID | FK → zodiac_signs(id) | Zodiac reference |
| created_at | TIMESTAMP | NOT NULL | Link creation time |

**Primary Key:** (grimoire_id, zodiac_id)

### moon_phases

Lunar phases with magical properties.

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | UUID | PRIMARY KEY | Phase identifier |
| name | VARCHAR(50) | NOT NULL | Phase name |
| slug | VARCHAR(50) | UNIQUE, NOT NULL | URL-safe identifier |
| description | TEXT | | Phase description |
| magical_properties | TEXT[] | | Magical associations |
| best_for | TEXT[] | | Recommended activities |
| created_at | TIMESTAMP | NOT NULL | Creation time |

**Phases:** New Moon, Waxing Crescent, First Quarter, Waxing Gibbous, Full Moon, Waning Gibbous, Last Quarter, Waning Crescent

### grimoire_moon_phases

Links grimoires to moon phases.

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| grimoire_id | UUID | FK → grimoires(id) | Grimoire reference |
| moon_phase_id | UUID | FK → moon_phases(id) | Moon phase reference |
| created_at | TIMESTAMP | NOT NULL | Link creation time |

**Primary Key:** (grimoire_id, moon_phase_id)

---

## Social Features

### grimoire_likes

User likes on grimoires.

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | UUID | PRIMARY KEY | Like identifier |
| grimoire_id | UUID | FK → grimoires(id) | Grimoire reference |
| user_id | UUID | FK → users(id) | User reference |
| created_at | TIMESTAMP | NOT NULL | Like time |

**Unique:** (grimoire_id, user_id)

### grimoire_dislikes

User dislikes on grimoires.

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | UUID | PRIMARY KEY | Dislike identifier |
| grimoire_id | UUID | FK → grimoires(id) | Grimoire reference |
| user_id | UUID | FK → users(id) | User reference |
| created_at | TIMESTAMP | NOT NULL | Dislike time |

**Unique:** (grimoire_id, user_id)

### grimoire_favorites

User favorites.

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | UUID | PRIMARY KEY | Favorite identifier |
| grimoire_id | UUID | FK → grimoires(id) | Grimoire reference |
| user_id | UUID | FK → users(id) | User reference |
| created_at | TIMESTAMP | NOT NULL | Favorite time |

**Unique:** (grimoire_id, user_id)

### comments

Threaded comments on grimoires.

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | UUID | PRIMARY KEY | Comment identifier |
| grimoire_id | UUID | FK → grimoires(id) | Grimoire reference |
| user_id | UUID | FK → users(id) | Commenter reference |
| parent_id | UUID | FK → comments(id) | Parent comment (for replies) |
| content | TEXT | NOT NULL | Comment content |
| is_edited | BOOLEAN | DEFAULT FALSE | Edit flag |
| edited_at | TIMESTAMP | | Edit timestamp |
| created_at | TIMESTAMP | NOT NULL | Comment time |
| updated_at | TIMESTAMP | NOT NULL | Update time |
| deleted_at | TIMESTAMP | | Soft delete time |

**Indexes:**
- `grimoire_id` (filtered by deleted_at IS NULL)
- `user_id` (filtered)
- `parent_id` (filtered)

### comment_likes

Likes on comments.

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | UUID | PRIMARY KEY | Like identifier |
| comment_id | UUID | FK → comments(id) | Comment reference |
| user_id | UUID | FK → users(id) | User reference |
| created_at | TIMESTAMP | NOT NULL | Like time |

**Unique:** (comment_id, user_id)

### user_boards

User-created collections/lists.

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | UUID | PRIMARY KEY | Board identifier |
| user_id | UUID | FK → users(id) | Board owner |
| name | VARCHAR(100) | NOT NULL | Board name |
| description | TEXT | | Board description |
| is_public | BOOLEAN | DEFAULT TRUE | Visibility |
| cover_image_url | TEXT | | Cover image |
| sort_order | INTEGER | DEFAULT 0 | Display order |
| created_at | TIMESTAMP | NOT NULL | Creation time |
| updated_at | TIMESTAMP | NOT NULL | Update time |
| deleted_at | TIMESTAMP | | Soft delete time |

### board_items

Items (grimoires) in user boards.

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | UUID | PRIMARY KEY | Item identifier |
| board_id | UUID | FK → user_boards(id) | Board reference |
| grimoire_id | UUID | FK → grimoires(id) | Grimoire reference |
| notes | TEXT | | User notes |
| sort_order | INTEGER | DEFAULT 0 | Display order |
| added_at | TIMESTAMP | NOT NULL | Add time |

**Unique:** (board_id, grimoire_id)

---

## Analytics

### grimoire_views

View tracking for grimoires.

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | UUID | PRIMARY KEY | View identifier |
| grimoire_id | UUID | FK → grimoires(id) | Grimoire reference |
| user_id | UUID | FK → users(id) | User (if logged in) |
| ip_address | INET | | Viewer IP address |
| user_agent | TEXT | | Browser user agent |
| referrer | TEXT | | Referrer URL |
| viewed_at | TIMESTAMP | NOT NULL | View timestamp |

**Indexes:**
- `grimoire_id`
- `user_id`
- `viewed_at`

### user_activity_log

General activity logging.

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | UUID | PRIMARY KEY | Log identifier |
| user_id | UUID | FK → users(id) | User reference |
| activity_type | VARCHAR(50) | NOT NULL | Activity type |
| entity_type | VARCHAR(50) | | Entity type |
| entity_id | UUID | | Entity identifier |
| ip_address | INET | | User IP address |
| user_agent | TEXT | | Browser user agent |
| metadata | JSONB | | Additional data |
| created_at | TIMESTAMP | NOT NULL | Activity time |

**Indexes:**
- `user_id`
- `activity_type`
- `created_at`

### grimoire_stats (Materialized View)

Pre-computed statistics per grimoire.

| Column | Type | Description |
|--------|------|-------------|
| id | UUID | Grimoire ID |
| title | VARCHAR(255) | Grimoire title |
| view_count | BIGINT | Total views |
| like_count | BIGINT | Total likes |
| dislike_count | BIGINT | Total dislikes |
| favorite_count | BIGINT | Total favorites |
| comment_count | BIGINT | Total comments |
| last_viewed_at | TIMESTAMP | Most recent view |

**Refresh:** Should be refreshed periodically (hourly/daily)

### user_stats (Materialized View)

Pre-computed statistics per user.

| Column | Type | Description |
|--------|------|-------------|
| id | UUID | User ID |
| username | VARCHAR(50) | Username |
| grimoire_count | BIGINT | Grimoires created |
| favorite_count | BIGINT | Items favorited |
| comment_count | BIGINT | Comments made |
| board_count | BIGINT | Boards created |

**Refresh:** Should be refreshed periodically

---

## Subscriptions

### subscription_tiers

Available subscription levels.

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | UUID | PRIMARY KEY | Tier identifier |
| name | VARCHAR(50) | UNIQUE, NOT NULL | Tier name |
| description | TEXT | | Tier description |
| price_monthly | DECIMAL(10, 2) | | Monthly price |
| price_yearly | DECIMAL(10, 2) | | Yearly price |
| features | JSONB | | Feature list |
| max_grimoires | INTEGER | | Max grimoires allowed |
| max_storage_mb | INTEGER | | Max storage in MB |
| is_active | BOOLEAN | DEFAULT TRUE | Active status |
| sort_order | INTEGER | DEFAULT 0 | Display order |
| created_at | TIMESTAMP | NOT NULL | Creation time |
| updated_at | TIMESTAMP | NOT NULL | Update time |

### user_subscriptions

User subscription tracking.

| Column | Type | Constraints | Description |
|--------|------|-------------|-------------|
| id | UUID | PRIMARY KEY | Subscription identifier |
| user_id | UUID | FK → users(id) | User reference |
| tier_id | UUID | FK → subscription_tiers(id) | Tier reference |
| status | VARCHAR(20) | NOT NULL | Subscription status |
| started_at | TIMESTAMP | NOT NULL | Start time |
| expires_at | TIMESTAMP | | Expiration time |
| cancelled_at | TIMESTAMP | | Cancellation time |
| payment_provider | VARCHAR(50) | | Payment provider |
| payment_id | VARCHAR(255) | | Provider payment ID |
| created_at | TIMESTAMP | NOT NULL | Creation time |
| updated_at | TIMESTAMP | NOT NULL | Update time |

**Status Values:** active, cancelled, expired, suspended

---

## Indexes & Performance

### Primary Indexes

All tables have UUID primary keys with automatic indexes.

### Foreign Key Indexes

All foreign key columns have indexes for join performance.

### Special Indexes

- **Full-text search** on `grimoires(title, content)` using GIN
- **Filtered indexes** on `grimoires` excluding soft-deleted records
- **Composite indexes** for common query patterns (e.g., featured grimoires)

### Materialized Views

Two materialized views pre-compute expensive aggregations:
- `grimoire_stats` - Aggregated statistics per grimoire
- `user_stats` - Aggregated statistics per user

These should be refreshed periodically (recommended: hourly or daily depending on traffic).

```sql
REFRESH MATERIALIZED VIEW grimoire_stats;
REFRESH MATERIALIZED VIEW user_stats;
```

---

## Triggers

### Automatic Triggers

- **updated_at triggers**: Automatically update `updated_at` timestamp on relevant tables
- **Tag usage triggers**: Automatically maintain `tags.usage_count`

### Trigger Functions

- `update_updated_at_column()` - Updates timestamp on row modification
- `increment_tag_usage()` - Increments tag count when tag is used
- `decrement_tag_usage()` - Decrements tag count when tag is removed

---

## Notes for Developers

### UUID Generation

All UUIDs are generated using PostgreSQL's `uuid_generate_v4()` function from the `uuid-ossp` extension.

### Soft Deletes

Most user-generated content uses soft deletes via `deleted_at` timestamp. Always filter by `deleted_at IS NULL` in queries.

### JSONB Fields

Several tables have JSONB columns for flexibility:
- `grimoires.metadata` - Extended metadata
- `user_settings.settings_json` - Additional settings
- `media_files.metadata` - Media metadata
- `user_activity_log.metadata` - Activity details

### Full-Text Search

PostgreSQL's full-text search is available on grimoires. For production, consider:
1. Using PostgreSQL for simple searches
2. Syncing to ElasticSearch for advanced search features
3. Implementing hybrid approach

### Performance Considerations

1. Refresh materialized views during off-peak hours
2. Consider partitioning `grimoire_views` and `user_activity_log` for large datasets
3. Archive old activity logs periodically
4. Monitor query performance and add indexes as needed

---

## Migration Strategy

This schema can be deployed via:
1. **Docker init scripts** - For development (current setup)
2. **Flyway migrations** - For backend-managed migrations
3. **Manual migrations** - For complex schema changes

When moving to production, consider migrating to Flyway-based migrations in the Spring Boot backend for better version control and deployment management.
