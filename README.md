# myFitTracker Infrastructure (infra-v1)

This directory contains the infrastructure setup for the **myFitTracker** project, including PostgreSQL, backend, and frontend containers, managed with Docker Compose.

## Directory Structure

```
infra-v1/
├── docker-compose.yml # Main Docker Compose file
├── env/ # Environment variable files
│ ├── back.env
│ ├── back.env.example
│ ├── db.env
│ ├── db.env.example
│ ├── front.env
│ └── front.env.example
├── scripts/ # Helper scripts
│ ├── build-backend.sh
│ ├── build-frontend.sh
│ └── up.sh
└── README.md
```

## Prerequisites

- Docker >= 24.x
- Docker Compose
- Node.js >= 20 (for building frontend locally, if needed)
- Rust and Cargo (for backend local build, if needed)

## Environment Variables

All required environment variables are stored in the `env/` folder.  

- Copy the `.env.example` files to `.env` before running locally.
- Do **not** commit actual `.env` files to the repository.
  
Example:
```bash
cp env/back.env.example env/back.env
cp env/front.env.example env/front.env
cp env/db.env.example env/db.env
```

## Variable Overview

- BACKEND_VERSION – version tag for the backend Docker image
- RONTEND_VERSION – version tag for the frontend Docker image
- Database connection variables are defined in db.env

## Scripts

- scripts/build-backend.sh – builds the backend Docker image with the version defined in .env.
- scripts/build-frontend.sh – builds the frontend Docker image with the version defined in .env.
- scripts/up.sh – brings up the full infrastructure using Docker Compose.

## Docker Compose Services

### db

- Image: postgres:15
- Exposes port 5433
- Uses a named volume for data persistence
- Healthcheck enabled

### backend

- Image: myfittracker-backend:<BACKEND_VERSION>
- Exposes port 3000
- Depends on db service being healthy
- Can run migrations using the migration service

### frontend

- Image: myfittracker-frontend:<FRONTEND_VERSION>
- Exposes port 8080
- Depends on backend service

### migration

- Used for applying database migrations
- Only runs when the migrate profile is enabled


## Usage

### Build images manually
```bash
# Build backend image
./scripts/build-backend.sh

# Build frontend image
./scripts/build-frontend.sh
```

### Start infrastructure
```bash
./scripts/up.sh
```

### Stop infrastructure

```bash
./scripts/down.sh
```

## Notes

- The infrastructure is designed to be independent of the CI/CD pipeline.

- Images are versioned to allow CI to rebuild only when necessary.

- `.env` files should never be committed; only the `.env.example` files are included for reference.

## Volumes

- `postgres_data` – stores PostgreSQL data persistently across container restarts.

