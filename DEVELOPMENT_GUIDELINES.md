# Database Development Guidelines

## Overview
This repository contains PostgreSQL database configuration and initialization scripts for Grimoire Collective.

## Technology Stack
- **Database**: PostgreSQL 16-alpine
- **Container**: Docker/Docker Compose
- **Migrations**: Flyway (managed in backend repository)

## Project Structure
```
database/
├── docker-compose.yml         # PostgreSQL container configuration
├── init/                      # SQL initialization scripts
│   ├── 01-init.sql           # Extensions and basic setup
│   ├── 02-schema.sql         # Complete database schema
│   └── 03-seed-data.sql      # Sample/development data
├── docs/                      # 📚 All documentation goes here
│   ├── README.md             # Documentation index
│   ├── QUICKSTART.md         # Getting started guide
│   ├── SCHEMA.md             # Schema reference
│   ├── QUERIES.md            # SQL query examples
│   ├── ARCHITECTURE.md       # Design patterns
│   ├── BUILD_COMPLETE.md     # Build summary
│   └── TESTING.md            # Testing checklist
├── .env.example              # Environment variables template
├── README.md                 # Main entry point
└── DEVELOPMENT_GUIDELINES.md # This file
```

### Documentation Standards

**All documentation must be placed in the `docs/` directory.**

- **Technical documentation**: Place in `docs/` (e.g., schema docs, architecture)
- **API references**: Place in `docs/`
- **User guides**: Place in `docs/`
- **Development notes**: Place in `docs/`

**Root-level files** should only include:
- `README.md` - Main entry point and overview
- `DEVELOPMENT_GUIDELINES.md` - This file
- Configuration files (`.env.example`, `docker-compose.yml`)
- Essential operational files

**Creating new documentation:**
1. Place the file in `docs/`
2. Add an entry to `docs/README.md` index
3. Link from main `README.md` if appropriate
4. Use consistent markdown formatting
5. Include examples where helpful

## Core Principles

### DRY (Don't Repeat Yourself)
**All code must follow DRY principles:**
- Avoid duplicating SQL logic or data definitions
- Use views, functions, or CTEs to encapsulate reusable queries
- Define constraints and defaults once, reference everywhere
- Extract common patterns into reusable components
- If you find yourself copying code, refactor it

### Data File Management
**Never create separate "update" files for existing data:**
- Add new data directly to the existing entity data files
- If modifying existing data, update it in place within the original file
- Keep all data for an entity type in its dedicated file (e.g., all crystals in `06-crystal-data.sql`)
- This maintains a single source of truth and prevents fragmentation

## Database Design Principles

### Schema Design
- Use meaningful table and column names
- Follow PostgreSQL naming conventions (lowercase, underscores)
- Always include `id`, `created_at`, `updated_at` columns
- Use appropriate data types
- Implement proper constraints (PRIMARY KEY, FOREIGN KEY, NOT NULL, UNIQUE)

### Naming Conventions
- **Tables**: plural, lowercase with underscores (e.g., `users`, `book_categories`)
- **Columns**: lowercase with underscores (e.g., `user_id`, `created_at`)
- **Indexes**: `idx_{table}_{columns}` (e.g., `idx_users_email`)
- **Foreign Keys**: `fk_{table}_{referenced_table}` (e.g., `fk_books_users`)
- **Unique Constraints**: `uq_{table}_{columns}` (e.g., `uq_users_email`)

### Standard Columns
Every table should have:
```sql
CREATE TABLE example_table (
    id BIGSERIAL PRIMARY KEY,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    -- other columns
);
```

### Indexing Strategy
- Index foreign keys
- Index frequently queried columns
- Index columns used in WHERE, JOIN, ORDER BY clauses
- Avoid over-indexing (impacts write performance)
- Use partial indexes for filtered queries

## Migration Guidelines

### Flyway Migrations (Backend)
- Migrations are stored in `backend/src/main/resources/db/migration/`
- Version format: `V{version}__{description}.sql`
- Example: `V1__create_users_table.sql`

### Migration Best Practices
1. **Never modify existing migrations** once applied to production
2. **Test migrations locally first**
3. **Make migrations reversible** (keep separate DOWN migrations if needed)
4. **Keep migrations small and focused** (one logical change per migration)
5. **Add comments** explaining complex logic

### Migration Template
```sql
-- V{version}__{description}.sql
-- Purpose: Brief description of what this migration does
-- Author: Your Name
-- Date: YYYY-MM-DD

-- Up Migration
CREATE TABLE users (
    id BIGSERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL UNIQUE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_users_email ON users(email);

-- Add comments to tables/columns
COMMENT ON TABLE users IS 'User account information';
COMMENT ON COLUMN users.username IS 'Unique username for login';
```

## Data Types

### Common Types
- **Text**: `VARCHAR(n)` for limited strings, `TEXT` for unlimited
- **Numbers**: `BIGINT` for IDs, `INTEGER` for counts, `NUMERIC` for money
- **Dates**: `TIMESTAMP` for date+time, `DATE` for date only
- **Boolean**: `BOOLEAN` not `BIT` or `TINYINT`
- **JSON**: `JSONB` (better performance than `JSON`)
- **UUID**: `UUID` for distributed systems

### When to Use What
- Use `BIGSERIAL` for auto-incrementing IDs
- Use `TIMESTAMP WITH TIME ZONE` for timestamps
- Use `VARCHAR(255)` for emails, usernames
- Use `TEXT` for descriptions, content
- Use `NUMERIC(10,2)` for money (avoid FLOAT/REAL)

## Initialization Scripts

### Purpose
- Create database schema on first run
- Set up initial data (if needed)
- Configure database settings

### Location
- `init/01-init.sql` - Main initialization script
- Number scripts to control execution order

### Example
```sql
-- init/01-init.sql
CREATE DATABASE grimoire_collective;

\c grimoire_collective;

-- Create extensions if needed
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Initial setup
-- (Actual tables created via Flyway in backend)
```

## Environment Variables

Required variables (set in `.env`):
```bash
POSTGRES_DB=grimoire_collective
POSTGRES_USER=postgres
POSTGRES_PASSWORD=your_secure_password
POSTGRES_HOST=localhost
POSTGRES_PORT=5432
```

**Security**: Never commit `.env` files with real passwords!

## Local Development

### Start Database
```bash
docker-compose up -d
```

### Stop Database
```bash
docker-compose down
```

### View Logs
```bash
docker-compose logs -f postgres
```

### Connect to Database
```bash
docker exec -it database-postgres-1 psql -U postgres -d grimoire_collective
```

### Backup Database
```bash
docker exec database-postgres-1 pg_dump -U postgres grimoire_collective > backup.sql
```

### Restore Database
```bash
docker exec -i database-postgres-1 psql -U postgres grimoire_collective < backup.sql
```

## Query Guidelines

### Performance
- Use `EXPLAIN ANALYZE` to understand query performance
- Avoid `SELECT *` - specify columns needed
- Use appropriate JOINs (INNER vs LEFT)
- Limit result sets with `LIMIT`
- Use pagination for large datasets

### Security
- Never use string concatenation for queries (SQL injection risk)
- Use parameterized queries (handled by backend ORM)
- Implement proper access controls
- Audit sensitive data access

## Maintenance

### Regular Tasks
- Monitor database size and growth
- Review and optimize slow queries
- Update statistics: `ANALYZE`
- Vacuum database: `VACUUM`
- Check for unused indexes

### Monitoring
- Monitor connection count
- Track query performance
- Set up alerts for disk space
- Monitor replication lag (if applicable)

## Testing

### Test Data
- Use seed scripts for test data
- Keep test data separate from migrations
- Reset test data between test runs

### Integration Tests
- Test database constraints
- Test foreign key relationships
- Test indexes improve query performance
- Test concurrent access scenarios

## Documentation

### Schema Documentation
- Document table purposes
- Document column meanings
- Document relationships
- Keep ER diagrams updated

### Comments in SQL
```sql
COMMENT ON TABLE users IS 'Application user accounts';
COMMENT ON COLUMN users.email IS 'Unique user email address';
```

## Common Patterns

### Soft Deletes
```sql
ALTER TABLE users ADD COLUMN deleted_at TIMESTAMP;
CREATE INDEX idx_users_deleted_at ON users(deleted_at) WHERE deleted_at IS NULL;
```

### Audit Trail
```sql
CREATE TABLE audit_log (
    id BIGSERIAL PRIMARY KEY,
    table_name VARCHAR(255) NOT NULL,
    record_id BIGINT NOT NULL,
    action VARCHAR(50) NOT NULL,
    old_values JSONB,
    new_values JSONB,
    user_id BIGINT,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
```

### Timestamps Auto-Update
```sql
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ language 'plpgsql';

CREATE TRIGGER update_users_updated_at 
    BEFORE UPDATE ON users 
    FOR EACH ROW 
    EXECUTE FUNCTION update_updated_at_column();
```

## Git Workflow
- Document schema changes in commit messages
- Review schema changes carefully
- Test migrations before committing
- Keep `.env.example` updated

## Code Review Checklist
- [ ] Schema changes are documented
- [ ] Migrations follow naming convention
- [ ] Indexes are added for foreign keys
- [ ] Constraints are properly defined
- [ ] No sensitive data in scripts
- [ ] `.env.example` is updated
- [ ] Migration tested locally

## Questions?
Refer to:
- [PostgreSQL Documentation](https://www.postgresql.org/docs/)
- [Docker Documentation](https://docs.docker.com/)
- [Flyway Documentation](https://flywaydb.org/documentation/)
- Project's `COPILOT_INSTRUCTIONS.md` in root directory

---
**Last Updated**: December 28, 2025
