# Spotify Database Project

Welcome to the **Spotify Database Project**, a university project that involves designing and implementing a relational database for managing a simplified version of Spotify. This repository contains the SQL scripts, Entity-Relationship Diagram (ERD), and project documentation.

## Table of Contents

- [Project Overview](#project-overview)
- [Features](#features)
- [Database Design](#database-design)
- [Setup Instructions](#setup-instructions)
- [Usage](#usage)
- [Project Files](#project-files)
- [License](#license)

---

## Project Overview

The **Spotify Database Project** aims to simulate the backend of a music streaming service. This project is designed to provide hands-on experience with database design and SQL, covering key functionalities such as managing user accounts, artists, albums, songs, and user activity. The database supports a variety of queries, enabling detailed analysis of user behavior and music trends.

By working on this project, students gain practical experience in:

- Designing a relational database with an optimized schema.
- Implementing relationships between entities using SQL.
- Writing queries to extract meaningful insights from data.
- Populating the database with realistic sample data.

---

## Features

- **User Account Management**:  
  Store user details like usernames, subscription plans, and playlist associations.
  
- **Artist and Album Management**:  
  Organize artists and their discography, including album and song details.

- **Playlist Management**:  
  Allow users to create and manage playlists with multiple songs.

- **Stream Tracking**:  
  Record user interactions with songs, including play history and timestamps.

- **Data Analysis**:  
  Execute advanced SQL queries for insights, such as most streamed songs, popular genres, or user activity summaries.

---

## Database Design

### Entity-Relationship Diagram (ERD)

The ERD illustrates the relationships and data structures used in this project. You can find the ERD in the repository as `Spotify ERD.jpg`:

![ERD Preview](Spotify%20ERD.jpg)

### Key Entities

- **Users**: Contains user details such as `user_id`, `username`, and subscription type.
- **Artists**: Stores artist information including `artist_id` and name.
- **Albums**: Represents albums with attributes like `album_id`, title, and release date.
- **Songs**: Includes song details such as `song_id`, title, duration, and associated `album_id`.
- **Playlists**: Tracks user-created playlists with `playlist_id` and associated songs.
- **Streams**: Records user interactions with songs, including `stream_id`, `user_id`, `song_id`, and timestamp.

---

## Setup Instructions

1. **Clone the Repository**
   ```bash
   git clone https://github.com/MOHAMMAD-KIMIA/Spotify-Database-Project.git
   cd Spotify-Database-Project
