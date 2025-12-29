# Database Architecture Summary

## Grimoire Collective - PostgreSQL Database

### Overview

A comprehensive database for a spiritual knowledge platform featuring user-generated content, social interactions, and rich metadata.

---

## Statistics

- **Total Tables**: 34
- **Materialized Views**: 2
- **Total Indexes**: 40+
- **Extensions**: uuid-ossp, pg_trgm
- **Primary Key Type**: UUID (v4)

---

## Architecture Layers

```
┌─────────────────────────────────────────────────────────────┐
│                     PRESENTATION LAYER                       │
│                    (Backend API / Frontend)                  │
└─────────────────────────────────────────────────────────────┘
                            ▼
┌─────────────────────────────────────────────────────────────┐
│                      DATABASE LAYER                          │
│                      PostgreSQL 16                           │
└─────────────────────────────────────────────────────────────┘
                            ▼
┌─────────────────┬─────────────────┬──────────────────────────┐
│  CORE ENTITIES  │  SOCIAL LAYER   │   ANALYTICS LAYER        │
├─────────────────┼─────────────────┼──────────────────────────┤
│ • Users         │ • Likes         │ • View Tracking          │
│ • Grimoires     │ • Favorites     │ • Activity Logs          │
│ • Media Files   │ • Comments      │ • Materialized Views     │
│ • Categories    │ • User Boards   │   - grimoire_stats       │
│ • Tags          │                 │   - user_stats           │
└─────────────────┴─────────────────┴──────────────────────────┘
                            ▼
┌─────────────────────────────────────────────────────────────┐
│                  SPIRITUAL ENTITIES LAYER                    │
│  • Deities  • Sabbats  • Zodiac  • Moon Phases              │
└─────────────────────────────────────────────────────────────┘
```

---

## Core Entity Relationships

### User Management

```
roles (3 default)
  ├─► role_permissions
  │     └─► permissions (16 types)
  └─► user_roles
        └─► users
              ├─► user_settings
              ├─► user_subscriptions ─► subscription_tiers
              └─► grimoires (author)
```

### Content Structure

```
grimoires (main content)
  ├─► content_types (12 types: spell, ritual, herb, etc.)
  ├─► users (author)
  ├─► grimoire_media ─► media_files
  ├─► grimoire_categories ─► categories (hierarchical)
  ├─► grimoire_tags ─► tags (auto-count)
  ├─► grimoire_deities ─► deities
  ├─► grimoire_sabbats ─► sabbats
  ├─► grimoire_zodiac ─► zodiac_signs
  └─► grimoire_moon_phases ─► moon_phases
```

### Social Interactions

```
grimoires
  ├─► grimoire_likes ─► users
  ├─► grimoire_dislikes ─► users
  ├─► grimoire_favorites ─► users
  ├─► comments (threaded via parent_id)
  │     ├─► users (commenter)
  │     └─► comment_likes ─► users
  └─► board_items ─► user_boards ─► users
```

### Analytics

```
grimoires
  ├─► grimoire_views (ip, user_agent, referrer)
  └─► grimoire_stats (materialized view)
        ├── view_count
        ├── like_count
        ├── favorite_count
        └── comment_count

users
  ├─► user_activity_log (activity_type, metadata)
  └─► user_stats (materialized view)
        ├── grimoire_count
        ├── favorite_count
        ├── comment_count
        └── board_count
```

---

## Data Flow Examples

### Creating a Grimoire

```
1. User authenticated → users table
2. Content created → grimoires table
3. Type selected → content_types (FK)
4. Categories chosen → grimoire_categories (junction)
5. Tags added → grimoire_tags (junction, increment usage_count)
6. Media uploaded → media_files, grimoire_media
7. Spiritual entities linked → grimoire_deities, grimoire_sabbats, etc.
```

### User Interaction Flow

```
1. User views grimoire → grimoire_views (tracking)
2. User likes grimoire → grimoire_likes (unique constraint)
3. User comments → comments (with threading via parent_id)
4. User favorites → grimoire_favorites
5. User adds to board → board_items → user_boards
6. All actions logged → user_activity_log
```

### Analytics Refresh

```
Periodic Job (hourly/daily)
  └─► REFRESH MATERIALIZED VIEW grimoire_stats
  └─► REFRESH MATERIALIZED VIEW user_stats
```

---

## Key Design Patterns

### 1. Soft Deletes

Tables with `deleted_at` column:
- users
- grimoires
- comments
- user_boards
- media_files

**Always filter**: `WHERE deleted_at IS NULL`

### 2. Timestamps

All tables have:
- `created_at` (automatic)
- `updated_at` (automatic via trigger)

### 3. JSONB for Flexibility

- `grimoires.metadata` - Extended content metadata
- `user_settings.settings_json` - Additional user preferences
- `media_files.metadata` - Media-specific data
- `user_activity_log.metadata` - Activity details

### 4. Array Columns

PostgreSQL array types for multi-value attributes:
- `deities.domains` - TEXT[]
- `deities.symbols` - TEXT[]
- `sabbats.themes` - TEXT[]
- `zodiac_signs.traits` - TEXT[]
- `moon_phases.magical_properties` - TEXT[]

### 5. Full-Text Search

GIN index on grimoires:
```sql
to_tsvector('english', title || ' ' || content)
```

Can be used standalone or synced to ElasticSearch.

### 6. Automatic Triggers

- **updated_at**: Auto-updates on row modification
- **tag usage**: Auto-increments/decrements on tag add/remove

---

## Performance Optimizations

### Indexes

1. **Primary Keys**: UUID with automatic index
2. **Foreign Keys**: All FK columns indexed
3. **Filtered Indexes**: Exclude soft-deleted records
4. **Composite Indexes**: Featured grimoires, published content
5. **Full-Text**: GIN index on grimoires content
6. **Partial Indexes**: Status-specific queries

### Materialized Views

Pre-computed aggregations for expensive queries:

**grimoire_stats**:
- Aggregates views, likes, favorites, comments
- Join-heavy query pre-computed
- Refresh: hourly/daily

**user_stats**:
- Aggregates user contributions
- Used in profiles and leaderboards
- Refresh: hourly/daily

### Query Patterns

- Use `EXISTS` for boolean checks (faster than COUNT)
- Filter by indexes (status, deleted_at)
- Use CTEs for complex hierarchical queries (comments)
- Leverage JSONB aggregation for nested data

---

## Security Features

### Password Storage

- Bcrypt hashed (`password_hash` column)
- Never store plain text passwords

### RBAC (Role-Based Access Control)

```
Super Admin → All Permissions
     ↓
   Admin → Most Permissions
     ↓
   User → Basic Permissions
```

### Soft Deletes

- Content never truly deleted (audit trail)
- Can be restored if needed
- Filtered from normal queries

### Activity Logging

- All user actions logged
- IP address and user agent tracked
- Metadata stored as JSONB

---

## Scalability Considerations

### Current Setup (Development)

- Single PostgreSQL instance
- Docker-based deployment
- Init scripts for schema

### Production Recommendations

1. **Migration Tool**: Flyway or Liquibase
2. **Connection Pooling**: PgBouncer or HikariCP
3. **Read Replicas**: For analytics queries
4. **Partitioning**: For `grimoire_views` and `user_activity_log`
5. **Search**: ElasticSearch for advanced full-text search
6. **Caching**: Redis for materialized view data
7. **CDN**: For media_files storage
8. **Backup**: Automated daily backups with point-in-time recovery

### Table Partitioning Candidates

- `grimoire_views` - Partition by viewed_at (monthly)
- `user_activity_log` - Partition by created_at (monthly)
- `grimoires` - Consider if > 10M records (by created_at)

---

## Extension Possibilities

### Phase 1 (Current)
✅ User management with RBAC
✅ Content management (grimoires)
✅ Social features (likes, comments, boards)
✅ Spiritual entities (deities, sabbats, etc.)
✅ Basic analytics

### Phase 2 (Future)
- Subscription system activation
- Multi-language content support
- Advanced search (ElasticSearch integration)
- Real-time notifications
- User-to-user messaging
- Community features (groups, forums)

### Phase 3 (Advanced)
- Machine learning recommendations
- Content moderation queue
- API rate limiting (in database)
- Audit logs with versioning
- Advanced analytics dashboard
- Content recommendation engine

---

## Maintenance Schedule

### Daily
- Monitor active connections
- Check slow query log
- Review disk space

### Weekly
- Analyze query performance
- Check for missing indexes
- Review error logs

### Monthly
- Archive old activity logs (> 90 days)
- Clean up orphaned media
- Vacuum analyze tables
- Review and update indexes

### Quarterly
- Database backup testing
- Performance benchmarking
- Schema optimization review
- Security audit

---

## File Organization

```
database/
├── init/
│   ├── 01-init.sql           # Extensions, basic setup
│   ├── 02-schema.sql         # Complete schema (800+ lines)
│   └── 03-seed-data.sql      # Sample data (600+ lines)
├── docker-compose.yml        # Docker configuration
├── README.md                 # General documentation
├── SCHEMA.md                 # Detailed schema docs (1000+ lines)
├── QUERIES.md                # Common SQL queries (500+ lines)
└── QUICKSTART.md             # Getting started guide
```

---

## Database Metrics (Sample Data)

```
Tables:           34
Views:            2 (materialized)
Indexes:          40+
Functions:        3
Triggers:         11
Extensions:       2

Sample Data Counts:
------------------
Users:            4 (1 admin, 3 regular)
Grimoires:        4 (published)
Categories:       15
Tags:             20
Moon Phases:      8
Zodiac Signs:     12
Sabbats:          8
Deities:          8
Comments:         2
Likes:            4
Favorites:        2
Boards:           2
Views:            80 (simulated)
```

---

## Technology Stack

- **Database**: PostgreSQL 16
- **Extensions**: uuid-ossp, pg_trgm
- **Container**: Docker with docker-compose
- **Init Method**: SQL scripts (development)
- **Future**: Flyway migrations (production)

---

## Quick Reference

### Connection String
```
postgresql://grimoire_user:grimoire_password@localhost:5432/grimoire_collective
```

### Docker Commands
```bash
# Start
docker-compose up -d

# Stop
docker-compose down

# Reset (WARNING: deletes data)
docker-compose down -v && docker-compose up -d

# Logs
docker logs grimoire-postgres

# Connect
docker exec -it grimoire-postgres psql -U grimoire_user -d grimoire_collective
```

### Key Queries
```sql
-- Refresh stats
REFRESH MATERIALIZED VIEW grimoire_stats;
REFRESH MATERIALIZED VIEW user_stats;

-- Check database size
SELECT pg_size_pretty(pg_database_size('grimoire_collective'));

-- List all tables
\dt

-- Table details
\d+ grimoires
```

---

## Summary

This database provides a solid foundation for a comprehensive spiritual knowledge platform with:

✅ **Robust User Management** - RBAC, settings, subscriptions  
✅ **Flexible Content System** - 12 content types, rich metadata  
✅ **Rich Taxonomy** - Categories, tags, spiritual entities  
✅ **Social Features** - Likes, comments, boards  
✅ **Analytics** - Tracking, logging, materialized views  
✅ **Performance** - Indexes, materialized views, partitioning-ready  
✅ **Scalability** - UUID keys, JSONB flexibility, soft deletes  
✅ **Security** - RBAC, password hashing, activity logging  

The schema is production-ready and designed to scale with your application's growth.
