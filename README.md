# Asset Exchange

> **Track the value of everything.**

Asset Exchange is a universal market intelligence platform designed to track, organize, compare, and value assets across the global economy — from publicly traded securities and cryptocurrencies to real estate, private companies, collectibles, digital assets, and other alternative markets.

Instead of requiring a different platform for every asset class, Asset Exchange is built around a single idea:

**Every asset should be searchable, understandable, comparable, and trackable from one interface.**

---

## The Universal Asset Terminal

Traditional financial platforms are excellent at tracking assets that trade continuously on organized markets.

The world's asset universe is much larger.

A portfolio can contain:

* Stocks
* ETFs
* Bonds
* Options
* Futures
* Foreign currencies
* Commodities
* Cryptocurrencies
* Real estate
* Land
* Private companies
* Startups
* Private credit
* Watches
* Cars
* Art
* Trading cards
* Sneakers
* Wine
* Jewelry
* Coins
* Domain names
* Websites
* Apps
* Intellectual property
* Royalties
* Carbon credits
* Other alternative assets

Asset Exchange is designed to bring these markets into a common data and valuation framework.

---

# Core Principle

## Price what trades. Estimate what doesn't.

Asset Exchange distinguishes between two fundamentally different forms of value.

### Market Price

For sufficiently liquid assets, Asset Exchange can consume licensed market feeds containing observable prices.

Examples include:

`AAPL`
`BTC`
`EUR/USD`
`Gold`

These observations can contain:

* Price
* Timestamp
* Source
* Currency
* Trading venue
* Volume
* Market capitalization
* Historical observations

### AE Estimated Value

Many assets do not have a continuously observable market price.

Examples include:

* Houses
* Private businesses
* Watches
* Artwork
* Domain names
* Rare vehicles
* Intellectual property
* Collectibles

Asset Exchange is designed to support an **AE Estimated Value** for these assets.

A valuation model may incorporate:

* Verified transactions
* Comparable sales
* Marketplace activity
* Fundamentals
* Asset condition
* Scarcity
* Geography
* Liquidity
* Historical appreciation
* Market momentum
* Time since last transaction
* Asset-specific characteristics

Every modeled valuation can carry a **confidence score** and **methodology version**.

An estimated value should never be presented as though it were an executable market quote.

---

# What Asset Exchange Includes

The current application provides the foundation for a full cross-asset intelligence platform.

### Universal Search

Search across completely different markets using one interface.

Examples:

```text
AAPL
Bitcoin
Gold
Manhattan Residential
Rolex Daytona
Premium Domains
Private SaaS
EUR/USD
```

The search architecture can eventually support millions of canonical asset records.

---

### Universal Asset Pages

Every asset can use the same fundamental page architecture.

An asset profile can contain:

* Asset name
* Symbol
* Asset Exchange ID
* Asset class
* Category
* Current price or estimated value
* Percentage change
* Historical chart
* Market capitalization
* Liquidity score
* Valuation confidence
* Description
* Valuation methodology
* Comparable assets
* Data-source information

This creates a common research experience across markets that normally have completely different data structures.

---

### Markets

Browse the Asset Exchange universe by asset class.

Current architecture supports categories including:

* Equities
* Crypto
* Real Estate
* Commodities
* Collectibles
* Private Markets
* Foreign Exchange
* Fixed Income
* Digital Assets

Additional markets can be added without redesigning the entire application.

---

### Cross-Asset Screener

The screener is designed to query assets regardless of their underlying market.

Current filtering demonstrates:

* Asset class
* Valuation confidence

The architecture can be expanded to include:

```text
Market capitalization
Price
Valuation
24-hour change
7-day change
30-day change
Volatility
Liquidity
Confidence
Country
Industry
Category
Scarcity
Transaction volume
Revenue
Growth
Yield
Risk
```

---

### Universal Portfolio

Asset Exchange is designed around a portfolio concept broader than a traditional brokerage account.

A future portfolio could contain:

```text
12 AAPL shares
0.18 BTC
1 rental property
1 Rolex Daytona
3 domain names
Private-company equity
Artwork
Cash
Bonds
Collectibles
```

All of these assets can ultimately contribute to a unified view of total asset value.

---

### Watchlists

Users can monitor assets across completely different markets inside the same watchlist.

The included database architecture supports authenticated, user-specific watchlists with PostgreSQL Row Level Security.

---

# Asset Exchange IDs

Provider symbols are not sufficient for a universal asset database.

Different providers may:

* Use different symbols
* Rename instruments
* Represent the same asset differently
* Remove assets
* Reuse identifiers
* Use incompatible schemas

Asset Exchange therefore uses its own canonical identifiers.

Example:

```text
ae_eq_aapl
ae_cr_btc
ae_co_gold
ae_re_nyc
ae_col_rolex
```

External provider identifiers can map back to the canonical Asset Exchange asset.

Conceptually:

```text
Provider A ─┐
Provider B ─┼──> AE Asset ID ──> Universal Asset Record
Provider C ─┘
```

This abstraction allows data providers to be replaced without changing the identity of the underlying asset.

---

# Architecture

Asset Exchange uses a modular architecture intended to separate the product interface from the underlying data infrastructure.

```text
                    ┌──────────────────────┐
                    │      User / API      │
                    └──────────┬───────────┘
                               │
                               ▼
                    ┌──────────────────────┐
                    │       Next.js        │
                    │    Asset Exchange    │
                    └──────────┬───────────┘
                               │
             ┌─────────────────┼─────────────────┐
             │                 │                 │
             ▼                 ▼                 ▼
      ┌────────────┐    ┌────────────┐    ┌────────────┐
      │ PostgreSQL │    │ Valuation  │    │ Market Data│
      │ / Supabase │    │   Engine   │    │ Providers  │
      └─────┬──────┘    └────────────┘    └──────┬─────┘
            │                                      │
            ▼                                      ▼
      Asset Metadata                        External Markets
      Price History                         Exchanges
      Portfolios                            Marketplaces
      Watchlists                            Data Vendors
      Valuations                            Alternative Data
```

The website is intentionally separated from individual data providers.

That prevents the entire platform from becoming dependent on one vendor.

---

# Technology Stack

### Application

* Next.js
* React
* TypeScript
* Next.js App Router

### Interface

* Responsive custom CSS
* Lucide React
* Recharts

### Database

* PostgreSQL
* Supabase

### Authentication Architecture

* Supabase Auth
* Row Level Security

### Deployment

* Vercel

### Data Layer

* Provider adapter architecture
* Scheduled ingestion endpoint
* Vercel Cron support
* Demo-data fallback

---

# Repository Structure

```text
asset-exchange/
│
├── app/
│   ├── api/
│   │   ├── assets/
│   │   └── cron/
│   │
│   ├── asset/
│   ├── markets/
│   ├── methodology/
│   ├── portfolio/
│   ├── screener/
│   ├── watchlist/
│   │
│   ├── globals.css
│   ├── layout.tsx
│   ├── loading.tsx
│   ├── error.tsx
│   ├── not-found.tsx
│   ├── robots.ts
│   ├── sitemap.ts
│   └── page.tsx
│
├── components/
│   ├── AssetTable.tsx
│   ├── Chart.tsx
│   ├── Header.tsx
│   └── Search.tsx
│
├── lib/
│   ├── providers/
│   ├── data.ts
│   ├── format.ts
│   ├── supabase.ts
│   └── types.ts
│
├── public/
│   └── logo.svg
│
├── supabase/
│   ├── schema.sql
│   └── seed.sql
│
├── .env.example
├── .gitignore
├── LICENSE
├── next.config.mjs
├── package.json
├── tsconfig.json
└── vercel.json
```

---

# Running Locally

## 1. Clone the repository

```bash
git clone <your-repository-url>
cd asset-exchange
```

## 2. Install dependencies

```bash
npm install
```

## 3. Create your environment file

```bash
cp .env.example .env.local
```

## 4. Start the development server

```bash
npm run dev
```

Open:

```text
http://localhost:3000
```

Asset Exchange includes demo data, so the interface can run before external market-data providers are configured.

---

# Environment Variables

The project includes the following environment configuration:

```env
NEXT_PUBLIC_SITE_URL=http://localhost:3000

NEXT_PUBLIC_SUPABASE_URL=
NEXT_PUBLIC_SUPABASE_ANON_KEY=

SUPABASE_SERVICE_ROLE_KEY=

MARKET_DATA_API_KEY=
CRON_SECRET=
```

A market-data provider can additionally expose a server-side base URL such as:

```env
MARKET_DATA_BASE_URL=
```

## Security

Never expose privileged credentials using a `NEXT_PUBLIC_*` variable.

In particular, these must remain server-side:

```text
SUPABASE_SERVICE_ROLE_KEY
MARKET_DATA_API_KEY
CRON_SECRET
```

Only variables intentionally required by browser code should use the `NEXT_PUBLIC_` prefix.

---

# Database Setup

Asset Exchange includes a PostgreSQL schema designed for the universal asset model.

Create a Supabase project and run:

```text
supabase/schema.sql
```

Then run:

```text
supabase/seed.sql
```

The schema includes tables for:

```text
assets
price_observations
valuations
watchlists
watchlist_items
portfolios
holdings
```

Indexes and Row Level Security policies are included.

---

# Core Data Model

## Assets

The `assets` table stores the canonical identity of an asset.

Important fields include:

```text
id
slug
symbol
name
asset_class
category
currency
description
metadata
created_at
updated_at
```

The `metadata` JSONB field allows individual asset classes to retain specialized attributes without destroying the universal schema.

For example, real estate could contain:

```json
{
  "bedrooms": 4,
  "bathrooms": 3,
  "square_feet": 2800
}
```

A watch could contain:

```json
{
  "reference": "116500LN",
  "year": 2020,
  "condition": "excellent"
}
```

A company could contain:

```json
{
  "sector": "technology",
  "employees": 120000,
  "country": "US"
}
```

All remain Asset Exchange assets.

---

# Price Observations

Historical market observations are separated from canonical asset records.

A price observation contains:

```text
asset_id
price
currency
observed_at
source
metadata
```

This makes it possible to retain an auditable historical record rather than continuously overwriting a single price field.

---

# Valuations

Modeled valuations are stored independently from direct market observations.

A valuation can contain:

```text
asset_id
estimated_value
confidence
methodology_version
inputs
valued_at
```

This separation is deliberate.

```text
Market Price ≠ Estimated Value
```

Asset Exchange should preserve that distinction throughout the platform.

---

# Market Data Provider Architecture

The repository contains a provider abstraction layer under:

```text
lib/providers/
```

The goal is to avoid coupling Asset Exchange to any single external market-data company.

The platform can ultimately use different providers for different markets.

Example architecture:

```text
Equities ──────────── Provider A
Crypto ────────────── Provider B
FX ────────────────── Provider C
Real Estate ───────── Provider D
Collectibles ──────── Provider E
Private Markets ───── Provider F
                           │
                           ▼
                    Provider Adapters
                           │
                           ▼
                    Asset Exchange
                    Canonical Schema
```

Each provider can normalize its response into the internal Asset Exchange format.

---

# Scheduled Data Refresh

The project includes:

```text
/api/cron/refresh
```

Vercel Cron can call this endpoint periodically.

The included `vercel.json` contains the scheduled-job configuration.

In production, the refresh system can:

1. Request observations from configured providers.
2. Normalize provider identifiers.
3. Resolve the canonical Asset Exchange ID.
4. Validate incoming values.
5. Store observations.
6. Update derived metrics.
7. Trigger valuation recalculations when necessary.

As the platform grows, high-volume ingestion should move to dedicated workers and queues rather than relying exclusively on serverless web functions.

---

# API

The application exposes an initial JSON API.

## Asset Universe

```http
GET /api/assets
```

Returns the currently available asset universe.

## Individual Asset

```http
GET /api/assets/{slug}
```

Example:

```http
GET /api/assets/bitcoin
```

The API architecture can later expand into:

```text
/api/v1/assets
/api/v1/assets/{id}
/api/v1/assets/{id}/history
/api/v1/assets/{id}/valuation
/api/v1/search
/api/v1/markets
/api/v1/quotes
/api/v1/portfolios
/api/v1/watchlists
/api/v1/comparables
```

---

# Deploying to Vercel

Asset Exchange is structured for Vercel deployment.

## 1. Push to GitHub

Create a repository and push the project.

```bash
git init
git add .
git commit -m "Initial Asset Exchange release"
git branch -M main
git remote add origin <your-repository-url>
git push -u origin main
```

## 2. Import into Vercel

Create a new Vercel project and import the GitHub repository.

Vercel should automatically recognize the application as Next.js.

## 3. Configure Environment Variables

Add the required production environment variables through the Vercel project settings.

## 4. Deploy

Trigger the production deployment.

The application can operate using the bundled demonstration dataset while production data infrastructure is being configured.

---

# Production Scaling

The current architecture is optimized for straightforward development and deployment.

At significant scale, Asset Exchange can evolve toward:

```text
                        Vercel
                           │
                    Next.js / Edge
                           │
              ┌────────────┼────────────┐
              │            │            │
           Redis       PostgreSQL    Search
              │            │            │
              └────────────┼────────────┘
                           │
                      Event Queue
                           │
             ┌─────────────┼─────────────┐
             │             │             │
          Worker         Worker        Worker
          Stocks         Crypto      Alternatives
             │             │             │
             └─────────────┼─────────────┘
                           │
                     Data Providers
```

Potential infrastructure additions include:

* Redis caching
* Dedicated ingestion workers
* Message queues
* Object storage
* Analytical databases
* Full-text/search infrastructure
* Time-series storage
* CDN caching
* Streaming updates
* WebSockets
* Observability
* Data-quality monitoring
* Provider failover

---

# Future Asset Universe

The architecture is intended to support substantially more than the initial demonstration assets.

## Public Markets

```text
Stocks
ETFs
Mutual funds
Bonds
Options
Futures
Indices
Commodities
FX
Treasuries
```

## Digital Markets

```text
Cryptocurrencies
Tokens
NFTs
Domain names
Websites
Apps
Digital businesses
Virtual assets
```

## Real Assets

```text
Residential real estate
Commercial real estate
Land
Farmland
Timber
Infrastructure
Energy assets
Mineral rights
```

## Private Markets

```text
Startups
Private companies
Private equity
Venture funds
Private credit
Small businesses
```

## Collectibles

```text
Watches
Cars
Artwork
Trading cards
Sports memorabilia
Sneakers
Wine
Jewelry
Coins
Antiques
Rare books
```

## Intellectual Property

```text
Patents
Trademarks
Copyrights
Music catalogs
Film rights
Licensing rights
Royalties
```

## Environmental & Specialty Assets

```text
Carbon credits
Renewable-energy certificates
Agricultural assets
Specialty commodities
Other emerging asset markets
```

---

# Long-Term Product Vision

Asset Exchange can ultimately become more than a market dashboard.

The underlying infrastructure creates the foundation for several products.

### Asset Exchange Terminal

Cross-asset research, analytics, charts, screening, comparisons, alerts, and discovery.

### Asset Exchange Portfolio

A unified balance sheet spanning liquid and illiquid assets.

### Asset Exchange Valuation

Automated valuation infrastructure for assets without continuous market prices.

### Asset Exchange Data

Normalized historical datasets covering traditional and alternative markets.

### Asset Exchange API

Programmatic access to canonical assets, prices, valuations, classifications, and market intelligence.

### Asset Exchange Pro

Advanced analytics, alerts, portfolio intelligence, exports, valuation tools, and professional research functionality.

### Asset Exchange Institutional

Data infrastructure, APIs, bulk datasets, valuation systems, and enterprise integrations.

---

# Design Philosophy

Asset Exchange should remain:

**Universal** — different asset classes belong in one system.

**Transparent** — sources, timestamps, confidence, and methodology should be visible.

**Comparable** — users should be able to evaluate fundamentally different assets without losing their underlying differences.

**Provider-independent** — Asset Exchange IDs should remain stable even when external data providers change.

**Data-first** — the long-term asset is not simply the interface; it is the normalized asset graph, transaction history, valuation infrastructure, and derived intelligence underneath it.

**Honest about uncertainty** — modeled values should communicate confidence instead of presenting false precision.

---

# Data Integrity

A universal asset platform is only as useful as its underlying information.

Production implementations should preserve:

```text
Source
Timestamp
Provider
Currency
Venue
Observation type
Methodology
Confidence
Data lineage
```

for every value whenever applicable.

Data from different sources should not be silently combined without normalization and provenance.

---

# Important Production Considerations

Before using Asset Exchange with real customers, production operators should evaluate:

* Market-data licensing
* Exchange redistribution rights
* API provider terms
* Real-estate data licensing
* Marketplace terms
* Intellectual-property rights
* Privacy requirements
* Authentication security
* Rate limiting
* Input validation
* Database backups
* Provider redundancy
* Monitoring
* Logging
* Error reporting
* Financial-data disclosures
* Applicable regulatory requirements

A technically accessible API does not automatically grant the right to redistribute its data.

---

# Disclaimer

Asset Exchange is market-intelligence and software infrastructure.

The demonstration values included in this repository are **illustrative** and should not be interpreted as current market quotations.

AE Estimated Values are estimates and may differ materially from actual transaction prices.

Nothing presented by Asset Exchange should be interpreted as:

* Financial advice
* Investment advice
* A recommendation to buy or sell an asset
* A certified appraisal
* An offer
* A bid
* A guarantee of value

Users are responsible for independently evaluating financial and asset-related decisions.

---

# License

This repository includes an MIT License.

Review licensing requirements for all third-party datasets, APIs, libraries, trademarks, imagery, and market-data feeds separately.

---

<div align="center">

## Asset Exchange

### Track the value of everything.

**One asset universe. One intelligence layer.**

</div>
