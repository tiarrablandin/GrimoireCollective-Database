# Database Quick Start Guide

Welcome to the Grimoire Collective database! This guide will help you get up and running quickly.

## Prerequisites

- Docker and Docker Compose installed
- Basic PostgreSQL knowledge

## Quick Setup

### 1. Start the Database

From the database directory:

```bash
cd database
docker-compose up -d
```

Or from the project root:

```bash
cd ..
docker-compose up
```

### 2. Verify the Database is Running

```bash
docker ps | grep grimoire-postgres
```

You should see the container running on port 5432.

### 3. Connect to the Database

**Using psql:**

```bash
docker exec -it grimoire-postgres psql -U grimoire_user -d grimoire_collective
```

**Using a GUI client:**

- Host: `localhost`
- Port: `5432`
- Database: `grimoire_collective`
- Username: `grimoire_user`
- Password: `grimoire_password`

## Sample Data

The database comes pre-loaded with:

- ✅ 4 sample users (including 1 admin)
- ✅ 4 sample grimoires (spell, ritual, herb, crystal)
- ✅ 15 categories
- ✅ 20 tags
- ✅ 8 moon phases
- ✅ 12 zodiac signs
- ✅ 8 sabbats
- ✅ 8 deities
- ✅ Sample social interactions (likes, comments, boards)

### Sample User Credentials

All sample users have the password: `password123`

- **admin@grimoirecollective.com** - Super Admin
- **witchy@example.com** - Regular User
- **moon@example.com** - Regular User
- **star@example.com** - Regular User

## Quick Queries to Test

### List All Tables

```sql
\dt
```

### View Sample Grimoires

```sql
SELECT 
    g.title,
    ct.name as type,
    u.username as author,
    g.status
FROM grimoires g
JOIN content_types ct ON g.content_type_id = ct.id
JOIN users u ON g.author_id = u.id;
```

### View Grimoire Stats

```sql
SELECT 
    title,
    view_count,
    like_count,
    comment_count
FROM grimoire_stats;
```

### View All Categories

```sql
SELECT name, slug, description FROM categories ORDER BY sort_order;
```

### View User Roles

```sql
SELECT 
    u.username,
    r.name as role
FROM users u
JOIN user_roles ur ON u.id = ur.user_id
JOIN roles r ON ur.role_id = r.id;
```

## Common Tasks

### Refresh Statistics

The database uses materialized views for performance. Refresh them periodically:

```sql
REFRESH MATERIALIZED VIEW grimoire_stats;
REFRESH MATERIALIZED VIEW user_stats;
```

### Check Database Size

```sql
SELECT pg_size_pretty(pg_database_size('grimoire_collective')) as database_size;
```

### View Recent Activity

```sql
SELECT 
    activity_type,
    COUNT(*) as count
FROM user_activity_log
WHERE created_at >= CURRENT_TIMESTAMP - INTERVAL '7 days'
GROUP BY activity_type;
```

## Schema Overview

### Core Tables

- **users** - User accounts and profiles
- **grimoires** - Main content (spells, rituals, etc.)
- **content_types** - Types of content
- **categories** - Hierarchical categories
- **tags** - Flexible tagging
- **media_files** - Images and videos

### Spiritual Entities

- **deities** - Gods and goddesses
- **sabbats** - Pagan holidays
- **zodiac_signs** - Astrological signs
- **moon_phases** - Lunar phases

### Social Features

- **grimoire_likes** - Like system
- **grimoire_favorites** - Favorites
- **comments** - Comment system
- **user_boards** - User collections

### Analytics

- **grimoire_views** - View tracking
- **user_activity_log** - Activity logging
- **grimoire_stats** - Aggregated stats (materialized view)

## Troubleshooting

### Container Won't Start

```bash
# Check logs
docker logs grimoire-postgres

# Remove and recreate
docker-compose down -v
docker-compose up -d
```

### Connection Refused

Make sure the container is fully started. Check logs:

```bash
docker logs grimoire-postgres
```

Look for: `database system is ready to accept connections`

### Reset Database

**Warning: This will delete all data!**

```bash
docker-compose down -v
docker-compose up -d
```

### Backup Database

```bash
docker exec -t grimoire-postgres pg_dump -U grimoire_user grimoire_collective > backup_$(date +%Y%m%d_%H%M%S).sql
```

### Restore Database

```bash
docker exec -i grimoire-postgres psql -U grimoire_user grimoire_collective < backup.sql
```

## Next Steps

1. **Explore the Schema**: See [SCHEMA.md](./SCHEMA.md) for detailed table documentation
2. **Learn Queries**: Check [QUERIES.md](./QUERIES.md) for common SQL queries
3. **Integrate Backend**: Connect your Spring Boot application using Flyway migrations
4. **Add ElasticSearch**: Set up ElasticSearch for advanced search features

## Development Tips

### Enable Query Timing in psql

```sql
\timing on
```

### Explain Query Plans

```sql
EXPLAIN ANALYZE
SELECT * FROM grimoires WHERE status = 'published' LIMIT 10;
```

### Watch for Long Queries

```sql
SELECT 
    pid,
    now() - pg_stat_activity.query_start AS duration,
    query
FROM pg_stat_activity
WHERE state = 'active'
AND now() - pg_stat_activity.query_start > interval '5 seconds'
ORDER BY duration DESC;
```

## Configuration

### Environment Variables

Edit `docker-compose.yml` to change:

- `POSTGRES_USER` - Database username
- `POSTGRES_PASSWORD` - Database password
- `POSTGRES_DB` - Database name

### Ports

Default port is `5432`. To change, edit the ports mapping in `docker-compose.yml`:

```yaml
ports:
  - "5433:5432"  # Use port 5433 instead
```

## Database Migrations

Currently using init scripts. For production:

1. **Flyway** (recommended) - Integrated with Spring Boot
2. **Liquibase** - Alternative migration tool
3. **Manual migrations** - Use the `migrations/` directory

## Performance Monitoring

### Check Index Usage

```sql
SELECT 
    schemaname,
    tablename,
    indexname,
    idx_scan,
    idx_tup_read,
    idx_tup_fetch
FROM pg_stat_user_indexes
ORDER BY idx_scan DESC;
```

### Find Missing Indexes

```sql
SELECT 
    schemaname,
    tablename,
    seq_scan,
    seq_tup_read,
    seq_scan - idx_scan as too_much_seq,
    CASE 
        WHEN seq_scan - coalesce(idx_scan, 0) > 0 
        THEN 'Missing Index?' 
        ELSE 'OK' 
    END as recommendation
FROM pg_stat_user_tables
WHERE seq_scan > 0
ORDER BY too_much_seq DESC;
```

## Resources

- [PostgreSQL Documentation](https://www.postgresql.org/docs/)
- [Database Schema](./SCHEMA.md) - Detailed schema documentation
- [Common Queries](./QUERIES.md) - SQL query examples
- [Docker PostgreSQL Hub](https://hub.docker.com/_/postgres)

## Support

For issues or questions:

1. Check the logs: `docker logs grimoire-postgres`
2. Review [SCHEMA.md](./SCHEMA.md) for table structure
3. See [QUERIES.md](./QUERIES.md) for query examples
4. Open an issue in the repository

---

**Happy querying! 🔮✨**
