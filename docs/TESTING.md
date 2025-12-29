# Database Testing Checklist

Use this checklist to verify the database is working correctly.

## ✅ Setup Verification

### Database Running
- [ ] Container is running: `docker ps | grep grimoire-postgres`
- [ ] Can connect via psql: `docker exec -it grimoire-postgres psql -U grimoire_user -d grimoire_collective`
- [ ] Database size is reasonable: `SELECT pg_size_pretty(pg_database_size('grimoire_collective'));`

### Tables Created
- [ ] All 34 tables exist: `\dt` (should show 34 tables)
- [ ] Materialized views exist: `\dm` (should show 2 views)
- [ ] Extensions loaded: `\dx` (should show uuid-ossp and pg_trgm)

## ✅ Sample Data Verification

### Users
```sql
-- Should return 4 users
SELECT username, email, is_active FROM users WHERE deleted_at IS NULL;
```
- [ ] admin user exists
- [ ] 3 regular users exist
- [ ] All users are active

### Roles & Permissions
```sql
-- Should show 3 roles with different permission counts
SELECT r.name, COUNT(p.id) as permissions
FROM roles r
LEFT JOIN role_permissions rp ON r.id = rp.role_id
LEFT JOIN permissions p ON rp.permission_id = p.id
GROUP BY r.id, r.name;
```
- [ ] super_admin has 16 permissions
- [ ] admin has 11 permissions
- [ ] user has 6 permissions

### Content
```sql
-- Should return 4 grimoires
SELECT title, status FROM grimoires WHERE deleted_at IS NULL;
```
- [ ] 4 grimoires exist
- [ ] All are published
- [ ] Different content types represented

### Categories & Tags
```sql
SELECT COUNT(*) FROM categories;
SELECT COUNT(*) FROM tags;
```
- [ ] 15 categories exist
- [ ] 20 tags exist

### Spiritual Entities
```sql
SELECT COUNT(*) FROM deities;
SELECT COUNT(*) FROM sabbats;
SELECT COUNT(*) FROM moon_phases;
SELECT COUNT(*) FROM zodiac_signs;
```
- [ ] 8 deities exist
- [ ] 8 sabbats exist
- [ ] 8 moon phases exist
- [ ] 12 zodiac signs exist

## ✅ Relationships Verification

### Grimoires with Full Data
```sql
SELECT 
    g.title,
    ct.name as type,
    u.username as author,
    COUNT(DISTINCT gc.category_id) as categories,
    COUNT(DISTINCT gt.tag_id) as tags
FROM grimoires g
JOIN content_types ct ON g.content_type_id = ct.id
JOIN users u ON g.author_id = u.id
LEFT JOIN grimoire_categories gc ON g.id = gc.grimoire_id
LEFT JOIN grimoire_tags gt ON g.id = gt.grimoire_id
WHERE g.deleted_at IS NULL
GROUP BY g.id, g.title, ct.name, u.username;
```
- [ ] All grimoires have content types
- [ ] All grimoires have authors
- [ ] Grimoires have categories
- [ ] Grimoires have tags

### Social Features
```sql
SELECT COUNT(*) FROM grimoire_likes;
SELECT COUNT(*) FROM grimoire_favorites;
SELECT COUNT(*) FROM comments WHERE deleted_at IS NULL;
SELECT COUNT(*) FROM user_boards WHERE deleted_at IS NULL;
```
- [ ] Some likes exist
- [ ] Some favorites exist
- [ ] Some comments exist
- [ ] Some boards exist

## ✅ Analytics Verification

### Materialized Views
```sql
SELECT COUNT(*) FROM grimoire_stats;
SELECT COUNT(*) FROM user_stats;
```
- [ ] grimoire_stats has data
- [ ] user_stats has data

### View Tracking
```sql
SELECT COUNT(*) FROM grimoire_views;
```
- [ ] Views have been logged

### Stats Data
```sql
SELECT 
    title,
    view_count,
    like_count,
    favorite_count,
    comment_count
FROM grimoire_stats
LIMIT 5;
```
- [ ] Stats show counts > 0
- [ ] View counts exist
- [ ] Like counts exist for some

## ✅ Constraints & Triggers

### Unique Constraints
```sql
-- Should fail (duplicate username)
INSERT INTO users (username, email, password_hash)
VALUES ('admin', 'test@example.com', 'hash');
```
- [ ] Duplicate username rejected

```sql
-- Should fail (duplicate email)
INSERT INTO users (username, email, password_hash)
VALUES ('testuser', 'admin@grimoirecollective.com', 'hash');
```
- [ ] Duplicate email rejected

### Timestamp Triggers
```sql
-- Get initial updated_at
SELECT updated_at FROM users WHERE username = 'admin';

-- Update user
UPDATE users SET display_name = 'Test Update' WHERE username = 'admin';

-- Check updated_at changed
SELECT updated_at FROM users WHERE username = 'admin';
```
- [ ] updated_at timestamp changes on update

### Tag Usage Counter
```sql
-- Check initial usage
SELECT name, usage_count FROM tags WHERE slug = 'beginner-friendly';

-- Add new grimoire with this tag (would require full insert)
-- Usage count should increment automatically

-- Remove tag from grimoire (would require delete)
-- Usage count should decrement automatically
```
- [ ] Tag usage count updates automatically

## ✅ Search Functionality

### Full-Text Search
```sql
SELECT 
    title,
    ts_rank(
        to_tsvector('english', title || ' ' || content),
        plainto_tsquery('english', 'protection')
    ) as rank
FROM grimoires
WHERE to_tsvector('english', title || ' ' || content) 
    @@ plainto_tsquery('english', 'protection')
ORDER BY rank DESC;
```
- [ ] Full-text search returns results
- [ ] Results are ranked

### Simple Search
```sql
SELECT title FROM grimoires 
WHERE title ILIKE '%moon%' 
AND deleted_at IS NULL;
```
- [ ] ILIKE search works

## ✅ Performance Tests

### Index Usage
```sql
EXPLAIN ANALYZE
SELECT * FROM grimoires 
WHERE status = 'published' 
AND deleted_at IS NULL 
LIMIT 10;
```
- [ ] Query uses index scan (not seq scan)
- [ ] Query completes in < 1ms

### Materialized View Query
```sql
EXPLAIN ANALYZE
SELECT * FROM grimoire_stats
LIMIT 10;
```
- [ ] Query is fast (materialized)
- [ ] No joins needed

## ✅ Data Integrity

### Foreign Key Constraints
```sql
-- Should fail (invalid content_type_id)
INSERT INTO grimoires (title, slug, content, content_type_id, author_id, status)
VALUES ('Test', 'test', 'content', '00000000-0000-0000-0000-000000000000', 
        (SELECT id FROM users LIMIT 1), 'draft');
```
- [ ] Invalid foreign key rejected

### Check Constraints
```sql
-- Should fail (username too short)
INSERT INTO users (username, email, password_hash)
VALUES ('ab', 'test@example.com', 'hash');
```
- [ ] Username length constraint enforced

```sql
-- Should fail (invalid status)
INSERT INTO grimoires (title, slug, content, content_type_id, author_id, status)
VALUES ('Test', 'test2', 'content', 
        (SELECT id FROM content_types LIMIT 1),
        (SELECT id FROM users LIMIT 1), 
        'invalid_status');
```
- [ ] Status check constraint enforced

## ✅ Soft Delete Verification

### Soft Delete User
```sql
-- Soft delete a user
UPDATE users SET deleted_at = CURRENT_TIMESTAMP WHERE username = 'stardust';

-- Query active users (should not include deleted)
SELECT COUNT(*) FROM users WHERE deleted_at IS NULL;
```
- [ ] Soft delete sets deleted_at
- [ ] Filtered queries exclude deleted records

### Restore
```sql
-- Restore the user
UPDATE users SET deleted_at = NULL WHERE username = 'stardust';
```
- [ ] Can restore soft-deleted records

## ✅ Advanced Queries

### Threaded Comments
```sql
WITH RECURSIVE comment_tree AS (
    SELECT c.*, 0 as depth
    FROM comments c
    WHERE c.parent_id IS NULL
    AND c.deleted_at IS NULL
    LIMIT 1
    
    UNION ALL
    
    SELECT c.*, ct.depth + 1
    FROM comments c
    JOIN comment_tree ct ON c.parent_id = ct.id
    WHERE c.deleted_at IS NULL
)
SELECT * FROM comment_tree;
```
- [ ] Recursive CTE works for threaded comments

### Complex Join
```sql
SELECT 
    g.title,
    json_build_object(
        'author', u.username,
        'type', ct.name,
        'categories', ARRAY_AGG(DISTINCT c.name),
        'tags', ARRAY_AGG(DISTINCT t.name)
    ) as details
FROM grimoires g
JOIN users u ON g.author_id = u.id
JOIN content_types ct ON g.content_type_id = ct.id
LEFT JOIN grimoire_categories gc ON g.id = gc.grimoire_id
LEFT JOIN categories c ON gc.category_id = c.id
LEFT JOIN grimoire_tags gt ON g.id = gt.grimoire_id
LEFT JOIN tags t ON gt.tag_id = t.id
WHERE g.deleted_at IS NULL
GROUP BY g.id, g.title, u.username, ct.name
LIMIT 1;
```
- [ ] Complex join with JSON aggregation works

## ✅ Cleanup Tests

### Orphaned Media Check
```sql
SELECT COUNT(*) FROM media_files mf
LEFT JOIN grimoire_media gm ON mf.id = gm.media_id
WHERE gm.media_id IS NULL;
```
- [ ] Query runs successfully
- [ ] Can identify orphaned media

### Old Data Cleanup
```sql
-- Check for old views (simulation)
SELECT COUNT(*) FROM grimoire_views
WHERE viewed_at < CURRENT_TIMESTAMP - INTERVAL '1 year';
```
- [ ] Date-based filtering works
- [ ] Ready for cleanup procedures

## ✅ Backup & Restore

### Backup
```bash
docker exec -t grimoire-postgres pg_dump -U grimoire_user grimoire_collective > test_backup.sql
```
- [ ] Backup file created
- [ ] File size is reasonable (> 50KB)

### Test Restore (Optional - Destructive!)
```bash
# Create test database
docker exec -t grimoire-postgres psql -U grimoire_user -c "CREATE DATABASE test_restore;"

# Restore
docker exec -i grimoire-postgres psql -U grimoire_user test_restore < test_backup.sql

# Verify
docker exec -t grimoire-postgres psql -U grimoire_user test_restore -c "\dt"

# Cleanup
docker exec -t grimoire-postgres psql -U grimoire_user -c "DROP DATABASE test_restore;"
```
- [ ] Database can be backed up
- [ ] Backup can be restored
- [ ] All tables present after restore

## ✅ Documentation

- [ ] README.md is clear and helpful
- [ ] SCHEMA.md documents all tables
- [ ] QUERIES.md has useful examples
- [ ] QUICKSTART.md helps beginners
- [ ] ARCHITECTURE.md explains design

## 📊 Test Summary

Date: ___________

Total Tests: 50+
Passed: ___________
Failed: ___________

### Issues Found
1. 
2. 
3. 

### Notes


---

## Automated Test Script

Save this as `test_database.sh`:

```bash
#!/bin/bash

echo "Testing Grimoire Collective Database..."

# Test 1: Container running
if docker ps | grep -q grimoire-postgres; then
    echo "✅ Container is running"
else
    echo "❌ Container is not running"
    exit 1
fi

# Test 2: Table count
TABLE_COUNT=$(docker exec grimoire-postgres psql -U grimoire_user -d grimoire_collective -t -c "SELECT COUNT(*) FROM information_schema.tables WHERE table_schema='public' AND table_type='BASE TABLE';")
if [ "$TABLE_COUNT" -eq 34 ]; then
    echo "✅ All 34 tables exist"
else
    echo "❌ Expected 34 tables, found $TABLE_COUNT"
fi

# Test 3: User count
USER_COUNT=$(docker exec grimoire-postgres psql -U grimoire_user -d grimoire_collective -t -c "SELECT COUNT(*) FROM users WHERE deleted_at IS NULL;")
if [ "$USER_COUNT" -eq 4 ]; then
    echo "✅ All 4 users exist"
else
    echo "❌ Expected 4 users, found $USER_COUNT"
fi

# Test 4: Grimoire count
GRIMOIRE_COUNT=$(docker exec grimoire-postgres psql -U grimoire_user -d grimoire_collective -t -c "SELECT COUNT(*) FROM grimoires WHERE deleted_at IS NULL;")
if [ "$GRIMOIRE_COUNT" -eq 4 ]; then
    echo "✅ All 4 grimoires exist"
else
    echo "❌ Expected 4 grimoires, found $GRIMOIRE_COUNT"
fi

# Test 5: Materialized views
VIEW_COUNT=$(docker exec grimoire-postgres psql -U grimoire_user -d grimoire_collective -t -c "SELECT COUNT(*) FROM pg_matviews WHERE schemaname='public';")
if [ "$VIEW_COUNT" -eq 2 ]; then
    echo "✅ Materialized views exist"
else
    echo "❌ Expected 2 materialized views, found $VIEW_COUNT"
fi

echo ""
echo "Basic tests complete!"
```

Make executable: `chmod +x test_database.sh`

Run: `./test_database.sh`
