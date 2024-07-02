# ✂️ snipIt

snipIt is the ultimate tool for transforming those long, clunky URLs into short, snazzy links that are super easy to share. no more struggling with endless web addresses – just snip, snap, and share the url!

<br />

## Table of Contents

- [User Interfaces](#user-interfaces)
- [Features](#features)
- [Installation](#installation)
  - [Prerequisites](#prerequisites)
  - [Setup](#setup)
- [Usage](#usage)
  - [Run the application](#run-the-application)
  - [Run the tests](#run-the-tests)
- [Diagrams](#diagrams)
  - [Arhictecture Diagram](#architecture-diagram)
  - [Entity Relationship Diagram](#entity-relationship-diagram)
  - [Low Fidelity Wireframes](#low-fidelity-wireframes)

<br />

## Technologies Used

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

## User Interfaces

Homepage
<img src=""/>

<br />

About Page
<img src=""/>

<br />

## Features

- Homepage
  - Convert long URL into short URL
  - Short URL can publicly shared and accessed
  - A Short URL path can be in any URI pattern, but should not exceed a maximum of 15 characters
  - Multiple Short URLs can share the same Target URL
  - Can get usage report for the application such as the number of clicks, originating geolocation and timestamp of each visit to a Short URL
- About page

<br />

## Installation

### Prerequisites

Before starting, make sure you have the following installed:

- Docker
- Docker Compose v2
- Make

<br />

### Setup

Clone the repository

```bash
git clone https://github.com/ariessa/snipIt.git

cd snipIt
```

## Usage

### Run the application

Build and run the containers

```bash
make up
```

Open your web browser and navigate to `https://localhost:3000`.

<br />

### Run the tests

```bash

```

<br />

Sample output

<img src=""/>

<br />

### Stop the application

```bash
make down
```

## Diagrams

<br />

### Architecture Diagram

<img src="/diagrams/architecture_diagram.png"/>

<br />

### Entity Relationship Diagram

<img src=""/>

<br />

### Low Fidelity Wireframes

<img src=""/>
