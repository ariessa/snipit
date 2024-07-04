# ✂️ Snipit

Snipit (stylised as snipIt) is the ultimate tool for transforming those long, clunky URLs into short, snazzy links that are super easy to share. no more struggling with endless web addresses – just snip, snap, and share the url!

<br />

## Table of Contents

- [User Interfaces](#user-interfaces)
- [Tools and Technologies Used](#tools-and-technologies-used)
- [Features](#features)
- [Installation](#installation)
  - [Prerequisites for production](#prerequisites-for-production)
  - [Setup](#setup)
    - [Development](#development)
    - [Production](#production)
- [Usage](#usage)
  - [Run the application](#run-the-application)
    - [Development](#development-1)
    - [Production](#production-1)
  - [Run the tests](#run-the-tests)
    - [Development](#development-2)
    - [Production](#production-2)
  - [Stop the application](#stop-the-application)
    - [Development](#development-3)
    - [Production](#production-3)
- [Diagrams](#diagrams)
  - [Architecture Diagram](#architecture-diagram)
  - [Entity Relationship Diagram](#entity-relationship-diagram)

<br />

## User Interfaces

<img src="/screenshots/home_page.png"/>

<img src="/screenshots/home_page_with_short_urls.png"/>

<img src="/screenshots/link_page_details.png"/>

<img src="/screenshots/link_page_all_views.png"/>

<img src="/screenshots/about_page.png"/>

<img src="/screenshots/stats_page.png"/>

<br />

## Tools and Technologies Used

- Ruby
- Rails
- Bundler
- Nginx
- Certbot
- Docker
- Docker Compose
- Hostinger
- Excalidraw
- Draw.io
- Heroicons
- TailwindCSS
- Make

## Features

- Convert a target URL into a short URL that can be publicly shared and accessed
- Provide a usage report for the application such as the number of clicks, originating geolocation and timestamp of each visit to a short URL

<br />

## Installation

### Prerequisites for production

Before starting, make sure you have the following installed:

- Docker
- Docker Compose v2
- Make

<br />

### Setup

Clone the repository

```bash
git clone https://github.com/ariessa/snipit.git

cd snipit
```

<br />

#### Development

Create file `.env` based on file `.env.example` and populate values accordingly

```bash
cp .env.example .env
```

<br />

#### Production

Create file `.env.prod` based on file `.env.example` and populate values accordingly

```bash
cp .env.example .env.prod
```

<br />

## Usage

### Run the application

#### Development

Create and migrate server

```bash
rails db:prepare
```

<br />

Start the server

```bash
bin/dev
```

<br />

#### Production

Build and run the containers

```bash
make up
```

<br />

Open your web browser and navigate to `https://localhost:3000`.

<br />

### Run the tests

#### Development

```bash
rails test
```

<br />

#### Production

```bash
make tests
```

<br />

### Stop the application

#### Development

Hit `Ctrl + C`

<br />

#### Production

```bash
make down
```

<br />

## Diagrams

### Architecture Diagram

<img src="/diagrams/architecture_diagram.png"/>

<br />

### Entity Relationship Diagram

<img src="/diagrams/entity_relationship_diagram.png"/>
