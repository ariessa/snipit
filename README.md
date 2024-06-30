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

## TODO: Technologies Used

- Ruby
- Rails
- Bundler
- Nginx
- Certbot
- Docker
- Vultr
- Excalidraw
- Draw.io
- Heroicons

## TODO: User Interfaces

Homepage
<img src=""/>

<br />

About Page
<img src=""/>

<br />

## Features

TODO: Simplify app, use only a single page

- Homepage
    - Convert long URL into short URL (done)
    - Short URL can publicly shared and accessed (done)
    - A Short URL path can be in any URI pattern, but should not exceed a maximum of 15 characters (done)
    - Multiple Short URLs can share the same Target URL (done)
    - TODO: Can get usage report for the application such as the number of clicks, originating geolocation and timestamp of each visit to a Short URL
- About page

<br />

## Installation

### Prerequisites

Before starting, make sure you have the following installed:

- Ruby 3.1+
- Rails 7.0+
- Bundler (`gem install bundler`)
- PostgreSQL

<br />

### Setup

1. Clone the repository

   ```bash
   git clone https://github.com/ariessa/snipIt.git

   cd snipIt
   ```

2. Install dependencies

    ```bash
    bundle install
    ```
3. Set up the database

    ```bash
    rails db:create db:migrate
    ```

<br />

### Usage

#### Run the application

1. Start the Rails server

    ```bash
    rails server
    ```

2. Open your web browser and navigate to `http://localhost:3000`.

<br />

#### Run the tests

```bash

```

<br />

Sample output

<img src=""/>

<br />

### Diagrams

<br />

#### Architecture Diagram

<img src=""/>

<br />

#### Entity Relationship Diagram

<img src=""/>

<br />

#### Low Fidelity Wireframes

<img src=""/>
