# Database - Grimoire Collective

PostgreSQL database configuration for Grimoire Collective.

## Structure

```
database/
├── init/              # Initialization scripts
├── migrations/        # Manual migration scripts (if needed)
└── docker-compose.yml # Standalone database setup
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

## Database Schema

The database schema is managed through Flyway migrations in the backend application.

Migration files are located in: `backend/src/main/resources/db/migration/`

## Backup and Restore

### Backup

```bash
docker exec -t grimoire-postgres pg_dump -U grimoire_user grimoire_collective > backup.sql
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
