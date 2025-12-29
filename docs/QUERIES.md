# Common SQL Queries - Grimoire Collective

This document contains frequently used SQL queries for the Grimoire Collective database.

## Table of Contents

1. [User Queries](#user-queries)
2. [Content Queries](#content-queries)
3. [Social Feature Queries](#social-feature-queries)
4. [Analytics Queries](#analytics-queries)
5. [Search Queries](#search-queries)
6. [Maintenance Queries](#maintenance-queries)

---

## User Queries

### Get User with Roles

```sql
SELECT 
    u.*,
    ARRAY_AGG(DISTINCT r.name) as roles
FROM users u
LEFT JOIN user_roles ur ON u.id = ur.user_id
LEFT JOIN roles r ON ur.role_id = r.id
WHERE u.id = 'USER_ID_HERE'
AND u.deleted_at IS NULL
GROUP BY u.id;
```

### Get User Permissions

```sql
SELECT DISTINCT p.*
FROM users u
JOIN user_roles ur ON u.id = ur.user_id
JOIN roles r ON ur.role_id = r.id
JOIN role_permissions rp ON r.id = rp.role_id
JOIN permissions p ON rp.permission_id = p.id
WHERE u.id = 'USER_ID_HERE';
```

### Check if User Has Permission

```sql
SELECT EXISTS (
    SELECT 1
    FROM users u
    JOIN user_roles ur ON u.id = ur.user_id
    JOIN roles r ON ur.role_id = r.id
    JOIN role_permissions rp ON r.id = rp.role_id
    JOIN permissions p ON rp.permission_id = p.id
    WHERE u.id = 'USER_ID_HERE'
    AND p.name = 'PERMISSION_NAME'
) as has_permission;
```

### Get Active Users Count

```sql
SELECT COUNT(*) as active_users
FROM users
WHERE is_active = TRUE
AND deleted_at IS NULL;
```

---

## Content Queries

### Get Published Grimoires with Full Details

```sql
SELECT 
    g.*,
    ct.name as content_type_name,
    ct.slug as content_type_slug,
    u.username as author_username,
    u.display_name as author_display_name,
    ARRAY_AGG(DISTINCT c.name) FILTER (WHERE c.id IS NOT NULL) as categories,
    ARRAY_AGG(DISTINCT t.name) FILTER (WHERE t.id IS NOT NULL) as tags,
    gs.view_count,
    gs.like_count,
    gs.favorite_count,
    gs.comment_count
FROM grimoires g
JOIN content_types ct ON g.content_type_id = ct.id
JOIN users u ON g.author_id = u.id
LEFT JOIN grimoire_categories gc ON g.id = gc.grimoire_id
LEFT JOIN categories c ON gc.category_id = c.id
LEFT JOIN grimoire_tags gt ON g.id = gt.grimoire_id
LEFT JOIN tags t ON gt.tag_id = t.id
LEFT JOIN grimoire_stats gs ON g.id = gs.id
WHERE g.status = 'published'
AND g.is_public = TRUE
AND g.deleted_at IS NULL
GROUP BY g.id, ct.id, u.id, gs.view_count, gs.like_count, gs.favorite_count, gs.comment_count
ORDER BY g.published_at DESC
LIMIT 20;
```

### Get Grimoire by Slug

```sql
SELECT 
    g.*,
    ct.name as content_type_name,
    u.username as author_username,
    u.display_name as author_display_name,
    u.avatar_url as author_avatar
FROM grimoires g
JOIN content_types ct ON g.content_type_id = ct.id
JOIN users u ON g.author_id = u.id
WHERE g.slug = 'GRIMOIRE_SLUG_HERE'
AND g.deleted_at IS NULL;
```

### Get Grimoire with All Associations

```sql
SELECT 
    g.*,
    json_build_object(
        'id', ct.id,
        'name', ct.name,
        'slug', ct.slug
    ) as content_type,
    json_build_object(
        'id', u.id,
        'username', u.username,
        'display_name', u.display_name,
        'avatar_url', u.avatar_url
    ) as author,
    COALESCE(
        json_agg(DISTINCT jsonb_build_object(
            'id', c.id,
            'name', c.name,
            'slug', c.slug
        )) FILTER (WHERE c.id IS NOT NULL),
        '[]'
    ) as categories,
    COALESCE(
        json_agg(DISTINCT jsonb_build_object(
            'id', t.id,
            'name', t.name,
            'slug', t.slug
        )) FILTER (WHERE t.id IS NOT NULL),
        '[]'
    ) as tags,
    COALESCE(
        json_agg(DISTINCT jsonb_build_object(
            'id', mf.id,
            'file_url', mf.file_url,
            'thumbnail_url', mf.thumbnail_url,
            'alt_text', mf.alt_text,
            'is_primary', gm.is_primary
        ) ORDER BY gm.display_order) FILTER (WHERE mf.id IS NOT NULL),
        '[]'
    ) as media
FROM grimoires g
JOIN content_types ct ON g.content_type_id = ct.id
JOIN users u ON g.author_id = u.id
LEFT JOIN grimoire_categories gc ON g.id = gc.grimoire_id
LEFT JOIN categories c ON gc.category_id = c.id
LEFT JOIN grimoire_tags gt ON g.id = gt.grimoire_id
LEFT JOIN tags t ON gt.tag_id = t.id
LEFT JOIN grimoire_media gm ON g.id = gm.grimoire_id
LEFT JOIN media_files mf ON gm.media_id = mf.id
WHERE g.id = 'GRIMOIRE_ID_HERE'
AND g.deleted_at IS NULL
GROUP BY g.id, ct.id, u.id;
```

### Get Featured Grimoires

```sql
SELECT 
    g.*,
    ct.name as content_type_name,
    u.display_name as author_name,
    gs.view_count,
    gs.like_count
FROM grimoires g
JOIN content_types ct ON g.content_type_id = ct.id
JOIN users u ON g.author_id = u.id
LEFT JOIN grimoire_stats gs ON g.id = gs.id
WHERE g.is_featured = TRUE
AND g.status = 'published'
AND g.deleted_at IS NULL
ORDER BY g.featured_at DESC
LIMIT 10;
```

### Get User's Grimoires

```sql
SELECT 
    g.*,
    ct.name as content_type_name,
    gs.view_count,
    gs.like_count,
    gs.comment_count
FROM grimoires g
JOIN content_types ct ON g.content_type_id = ct.id
LEFT JOIN grimoire_stats gs ON g.id = gs.id
WHERE g.author_id = 'USER_ID_HERE'
AND g.deleted_at IS NULL
ORDER BY g.created_at DESC;
```

### Get Grimoires by Category

```sql
SELECT 
    g.*,
    u.username as author_username,
    gs.view_count,
    gs.like_count
FROM grimoires g
JOIN grimoire_categories gc ON g.id = gc.grimoire_id
JOIN categories c ON gc.category_id = c.id
JOIN users u ON g.author_id = u.id
LEFT JOIN grimoire_stats gs ON g.id = gs.id
WHERE c.slug = 'CATEGORY_SLUG_HERE'
AND g.status = 'published'
AND g.is_public = TRUE
AND g.deleted_at IS NULL
ORDER BY g.published_at DESC
LIMIT 20;
```

### Get Grimoires by Tag

```sql
SELECT 
    g.*,
    u.username as author_username,
    gs.view_count,
    gs.like_count
FROM grimoires g
JOIN grimoire_tags gt ON g.id = gt.grimoire_id
JOIN tags t ON gt.tag_id = t.id
JOIN users u ON g.author_id = u.id
LEFT JOIN grimoire_stats gs ON g.id = gs.id
WHERE t.slug = 'TAG_SLUG_HERE'
AND g.status = 'published'
AND g.is_public = TRUE
AND g.deleted_at IS NULL
ORDER BY g.published_at DESC
LIMIT 20;
```

---

## Social Feature Queries

### Get User's Liked Grimoires

```sql
SELECT 
    g.*,
    u.username as author_username,
    gl.created_at as liked_at
FROM grimoire_likes gl
JOIN grimoires g ON gl.grimoire_id = g.id
JOIN users u ON g.author_id = u.id
WHERE gl.user_id = 'USER_ID_HERE'
AND g.deleted_at IS NULL
ORDER BY gl.created_at DESC;
```

### Get User's Favorite Grimoires

```sql
SELECT 
    g.*,
    u.username as author_username,
    gf.created_at as favorited_at
FROM grimoire_favorites gf
JOIN grimoires g ON gf.grimoire_id = g.id
JOIN users u ON g.author_id = u.id
WHERE gf.user_id = 'USER_ID_HERE'
AND g.deleted_at IS NULL
ORDER BY gf.created_at DESC;
```

### Get Grimoire with User Interactions

```sql
SELECT 
    g.*,
    EXISTS(
        SELECT 1 FROM grimoire_likes 
        WHERE grimoire_id = g.id AND user_id = 'USER_ID_HERE'
    ) as user_has_liked,
    EXISTS(
        SELECT 1 FROM grimoire_dislikes 
        WHERE grimoire_id = g.id AND user_id = 'USER_ID_HERE'
    ) as user_has_disliked,
    EXISTS(
        SELECT 1 FROM grimoire_favorites 
        WHERE grimoire_id = g.id AND user_id = 'USER_ID_HERE'
    ) as user_has_favorited
FROM grimoires g
WHERE g.id = 'GRIMOIRE_ID_HERE'
AND g.deleted_at IS NULL;
```

### Get Comments for Grimoire (Threaded)

```sql
WITH RECURSIVE comment_tree AS (
    -- Root comments
    SELECT 
        c.*,
        u.username,
        u.display_name,
        u.avatar_url,
        0 as depth,
        ARRAY[c.created_at] as path
    FROM comments c
    JOIN users u ON c.user_id = u.id
    WHERE c.grimoire_id = 'GRIMOIRE_ID_HERE'
    AND c.parent_id IS NULL
    AND c.deleted_at IS NULL
    
    UNION ALL
    
    -- Replies
    SELECT 
        c.*,
        u.username,
        u.display_name,
        u.avatar_url,
        ct.depth + 1,
        ct.path || c.created_at
    FROM comments c
    JOIN users u ON c.user_id = u.id
    JOIN comment_tree ct ON c.parent_id = ct.id
    WHERE c.deleted_at IS NULL
)
SELECT * FROM comment_tree
ORDER BY path;
```

### Get User's Boards with Item Count

```sql
SELECT 
    ub.*,
    COUNT(bi.id) as item_count
FROM user_boards ub
LEFT JOIN board_items bi ON ub.id = bi.board_id
WHERE ub.user_id = 'USER_ID_HERE'
AND ub.deleted_at IS NULL
GROUP BY ub.id
ORDER BY ub.created_at DESC;
```

### Get Board with Items

```sql
SELECT 
    ub.*,
    json_agg(
        json_build_object(
            'grimoire_id', g.id,
            'title', g.title,
            'slug', g.slug,
            'excerpt', g.excerpt,
            'author_username', u.username,
            'notes', bi.notes,
            'added_at', bi.added_at
        ) ORDER BY bi.sort_order
    ) FILTER (WHERE g.id IS NOT NULL) as items
FROM user_boards ub
LEFT JOIN board_items bi ON ub.id = bi.board_id
LEFT JOIN grimoires g ON bi.grimoire_id = g.id AND g.deleted_at IS NULL
LEFT JOIN users u ON g.author_id = u.id
WHERE ub.id = 'BOARD_ID_HERE'
AND ub.deleted_at IS NULL
GROUP BY ub.id;
```

---

## Analytics Queries

### Get Most Viewed Grimoires (Last 30 Days)

```sql
SELECT 
    g.id,
    g.title,
    g.slug,
    u.username as author_username,
    COUNT(gv.id) as view_count
FROM grimoires g
JOIN users u ON g.author_id = u.id
JOIN grimoire_views gv ON g.id = gv.grimoire_id
WHERE gv.viewed_at >= CURRENT_TIMESTAMP - INTERVAL '30 days'
AND g.deleted_at IS NULL
GROUP BY g.id, g.title, g.slug, u.username
ORDER BY view_count DESC
LIMIT 20;
```

### Get Most Liked Grimoires

```sql
SELECT 
    g.id,
    g.title,
    g.slug,
    u.username as author_username,
    COUNT(gl.id) as like_count
FROM grimoires g
JOIN users u ON g.author_id = u.id
LEFT JOIN grimoire_likes gl ON g.id = gl.grimoire_id
WHERE g.status = 'published'
AND g.deleted_at IS NULL
GROUP BY g.id, g.title, g.slug, u.username
ORDER BY like_count DESC
LIMIT 20;
```

### Get Trending Grimoires (Views + Likes, Last 7 Days)

```sql
SELECT 
    g.id,
    g.title,
    g.slug,
    u.username as author_username,
    COUNT(DISTINCT gv.id) as recent_views,
    COUNT(DISTINCT gl.id) FILTER (WHERE gl.created_at >= CURRENT_TIMESTAMP - INTERVAL '7 days') as recent_likes,
    (COUNT(DISTINCT gv.id) + COUNT(DISTINCT gl.id) * 3) as trending_score
FROM grimoires g
JOIN users u ON g.author_id = u.id
LEFT JOIN grimoire_views gv ON g.id = gv.grimoire_id 
    AND gv.viewed_at >= CURRENT_TIMESTAMP - INTERVAL '7 days'
LEFT JOIN grimoire_likes gl ON g.id = gl.grimoire_id
WHERE g.status = 'published'
AND g.deleted_at IS NULL
GROUP BY g.id, g.title, g.slug, u.username
HAVING COUNT(DISTINCT gv.id) > 0 OR COUNT(DISTINCT gl.id) > 0
ORDER BY trending_score DESC
LIMIT 20;
```

### Get User Activity Summary

```sql
SELECT 
    COUNT(DISTINCT CASE WHEN activity_type = 'view_grimoire' THEN entity_id END) as grimoires_viewed,
    COUNT(DISTINCT CASE WHEN activity_type = 'create_grimoire' THEN entity_id END) as grimoires_created,
    COUNT(DISTINCT CASE WHEN activity_type = 'like_grimoire' THEN entity_id END) as grimoires_liked,
    COUNT(DISTINCT CASE WHEN activity_type = 'comment' THEN entity_id END) as comments_made,
    MAX(created_at) as last_activity
FROM user_activity_log
WHERE user_id = 'USER_ID_HERE'
AND created_at >= CURRENT_TIMESTAMP - INTERVAL '30 days';
```

### Get Top Contributors (by Grimoire Count)

```sql
SELECT 
    u.id,
    u.username,
    u.display_name,
    COUNT(g.id) as grimoire_count,
    SUM(gs.view_count) as total_views,
    SUM(gs.like_count) as total_likes
FROM users u
LEFT JOIN grimoires g ON u.id = g.author_id AND g.deleted_at IS NULL AND g.status = 'published'
LEFT JOIN grimoire_stats gs ON g.id = gs.id
WHERE u.deleted_at IS NULL
GROUP BY u.id, u.username, u.display_name
HAVING COUNT(g.id) > 0
ORDER BY grimoire_count DESC
LIMIT 20;
```

---

## Search Queries

### Full-Text Search on Grimoires

```sql
SELECT 
    g.*,
    u.username as author_username,
    ts_rank(
        to_tsvector('english', g.title || ' ' || g.content),
        plainto_tsquery('english', 'SEARCH_QUERY_HERE')
    ) as rank
FROM grimoires g
JOIN users u ON g.author_id = u.id
WHERE to_tsvector('english', g.title || ' ' || g.content) @@ plainto_tsquery('english', 'SEARCH_QUERY_HERE')
AND g.status = 'published'
AND g.is_public = TRUE
AND g.deleted_at IS NULL
ORDER BY rank DESC
LIMIT 20;
```

### Search with Filters

```sql
SELECT DISTINCT
    g.*,
    u.username as author_username,
    ts_rank(
        to_tsvector('english', g.title || ' ' || g.content),
        plainto_tsquery('english', 'SEARCH_QUERY_HERE')
    ) as rank
FROM grimoires g
JOIN users u ON g.author_id = u.id
JOIN content_types ct ON g.content_type_id = ct.id
LEFT JOIN grimoire_tags gt ON g.id = gt.grimoire_id
LEFT JOIN tags t ON gt.tag_id = t.id
LEFT JOIN grimoire_categories gc ON g.id = gc.grimoire_id
LEFT JOIN categories c ON gc.category_id = c.id
WHERE to_tsvector('english', g.title || ' ' || g.content) @@ plainto_tsquery('english', 'SEARCH_QUERY_HERE')
AND g.status = 'published'
AND g.is_public = TRUE
AND g.deleted_at IS NULL
-- Optional filters (uncomment as needed)
-- AND ct.slug = 'CONTENT_TYPE_SLUG'
-- AND t.slug IN ('TAG1', 'TAG2')
-- AND c.slug = 'CATEGORY_SLUG'
ORDER BY rank DESC
LIMIT 20;
```

### Search Tags

```sql
SELECT *
FROM tags
WHERE name ILIKE '%SEARCH_TERM%'
ORDER BY usage_count DESC
LIMIT 10;
```

### Search Users

```sql
SELECT 
    u.id,
    u.username,
    u.display_name,
    u.avatar_url,
    us.grimoire_count
FROM users u
LEFT JOIN user_stats us ON u.id = us.id
WHERE (
    u.username ILIKE '%SEARCH_TERM%'
    OR u.display_name ILIKE '%SEARCH_TERM%'
)
AND u.deleted_at IS NULL
AND u.is_active = TRUE
ORDER BY us.grimoire_count DESC NULLS LAST
LIMIT 20;
```

---

## Maintenance Queries

### Refresh Materialized Views

```sql
REFRESH MATERIALIZED VIEW grimoire_stats;
REFRESH MATERIALIZED VIEW user_stats;
```

### Clean Up Old View Tracking (Older than 1 Year)

```sql
DELETE FROM grimoire_views
WHERE viewed_at < CURRENT_TIMESTAMP - INTERVAL '1 year';
```

### Clean Up Old Activity Logs (Older than 90 Days)

```sql
DELETE FROM user_activity_log
WHERE created_at < CURRENT_TIMESTAMP - INTERVAL '90 days';
```

### Find Orphaned Media Files

```sql
SELECT mf.*
FROM media_files mf
LEFT JOIN grimoire_media gm ON mf.id = gm.media_id
WHERE gm.media_id IS NULL
AND mf.created_at < CURRENT_TIMESTAMP - INTERVAL '7 days'
AND mf.deleted_at IS NULL;
```

### Get Database Size Information

```sql
SELECT 
    schemaname,
    tablename,
    pg_size_pretty(pg_total_relation_size(schemaname||'.'||tablename)) AS size
FROM pg_tables
WHERE schemaname = 'public'
ORDER BY pg_total_relation_size(schemaname||'.'||tablename) DESC;
```

### Get Row Counts for All Tables

```sql
SELECT 
    schemaname,
    tablename,
    n_tup_ins - n_tup_del as row_count
FROM pg_stat_user_tables
WHERE schemaname = 'public'
ORDER BY n_tup_ins - n_tup_del DESC;
```

### Find Unused Indexes

```sql
SELECT 
    schemaname,
    tablename,
    indexname,
    idx_scan,
    pg_size_pretty(pg_relation_size(indexrelid)) as index_size
FROM pg_stat_user_indexes
WHERE idx_scan = 0
AND indexname NOT LIKE '%_pkey'
ORDER BY pg_relation_size(indexrelid) DESC;
```

### Analyze Query Performance

```sql
-- Enable query timing
\timing on

-- Analyze a specific query
EXPLAIN ANALYZE
SELECT * FROM grimoires
WHERE status = 'published'
AND deleted_at IS NULL
LIMIT 10;
```

---

## Notes

- Replace placeholder values (e.g., `USER_ID_HERE`, `GRIMOIRE_ID_HERE`) with actual values
- Always include `deleted_at IS NULL` filter for soft-deleted content
- Use LIMIT clauses to prevent overwhelming results
- Consider adding pagination (OFFSET/LIMIT) for production queries
- Monitor query performance and add indexes as needed
- Refresh materialized views during off-peak hours
