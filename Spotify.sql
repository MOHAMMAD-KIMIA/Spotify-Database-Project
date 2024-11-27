CREATE DATABASE Spotify;
USE Spotify;

-- Disable safe updates for potential data insertion
SET SQL_SAFE_UPDATES = 0;

-- Users Table
CREATE TABLE Users (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    UserName VARCHAR(250),
    Email VARCHAR(250),
    Passwords VARCHAR(250)
);

-- Profile Table
CREATE TABLE Profile_ (
    ProfileID INT PRIMARY KEY AUTO_INCREMENT,
    Bio TEXT,
    Picture VARCHAR(250),
    UserID INT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Subscription Table
CREATE TABLE Subscription (
    SubscriptionID INT PRIMARY KEY AUTO_INCREMENT,
    StartDate DATE, 
    EndDate DATE,
    ProfileID INT,
    FOREIGN KEY (ProfileID) REFERENCES Profile_(ProfileID)
);

-- Artist Table
CREATE TABLE Artist (
    ArtistID INT PRIMARY KEY AUTO_INCREMENT,
    Bio TEXT,
    ProfileID INT,
    FOREIGN KEY (ProfileID) REFERENCES Profile_(ProfileID)
);

-- Music Table
CREATE TABLE Music (
    MusicID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(250),
    Duration INT,
    Genre VARCHAR(250),
    ArtistID INT,
    FOREIGN KEY (ArtistID) REFERENCES Artist(ArtistID)
);

-- Analytic Table
CREATE TABLE Analytic (
    AnalyticID INT PRIMARY KEY AUTO_INCREMENT,
    Data_ TEXT,
    AnalyticDate DATE,
    MusicID INT,
    FOREIGN KEY (MusicID) REFERENCES Music(MusicID)
);

-- PlaybackHistory Table
CREATE TABLE PlaybackHistory (
    HistoryID INT PRIMARY KEY AUTO_INCREMENT,
    PlayDate DATE,
    Duration INT,
    UserID INT,
    MusicID INT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (MusicID) REFERENCES Music(MusicID)
);

-- Feedback Table
CREATE TABLE Feedback (
    FeedbackID INT PRIMARY KEY AUTO_INCREMENT,
    Comment_ TEXT,
    UserID INT,
    MusicID INT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (MusicID) REFERENCES Music(MusicID)
);

-- Playlist Table
CREATE TABLE Playlist (
    PlaylistID INT PRIMARY KEY AUTO_INCREMENT,
    PlaylistName VARCHAR(250),
    PlaylistDescription TEXT,
    UserID INT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Playlist Content (Associative Table for Many-to-Many Relationship)
CREATE TABLE PlaylistContent (
    PlaylistID INT,
    ContentID INT,
    PRIMARY KEY (PlaylistID, ContentID),
    FOREIGN KEY (PlaylistID) REFERENCES Playlist(PlaylistID),
    FOREIGN KEY (ContentID) REFERENCES Music(MusicID)
);

-- Compliance Table
CREATE TABLE Compliance (
    ComplianceID INT PRIMARY KEY AUTO_INCREMENT,
    ComplianceStatus VARCHAR(250),
    ComplianceDate DATE
);

-- Report Table
CREATE TABLE Report (
    ReportID INT PRIMARY KEY AUTO_INCREMENT,
    ReportType VARCHAR(250),
    GeneratedDate DATE,
    Content TEXT,
    ComplianceID INT,
    FOREIGN KEY (ComplianceID) REFERENCES Compliance(ComplianceID)
);

-- Admin Table
CREATE TABLE Admin (
    AdminID INT PRIMARY KEY AUTO_INCREMENT,
    AdminRole VARCHAR(250),
    AdminName VARCHAR(250),
    ComplianceID INT,
    FOREIGN KEY (ComplianceID) REFERENCES Compliance(ComplianceID)
);

-- Device Table
CREATE TABLE Device (
    DeviceID INT PRIMARY KEY AUTO_INCREMENT,
    Specifications TEXT,
    Firmware VARCHAR(250)
);

-- Streaming Platform Table
CREATE TABLE StreamingPlatform (
    PlatformID INT PRIMARY KEY AUTO_INCREMENT,
    OS VARCHAR(250),
    LastUsedDate DATE,
    DeviceID INT,
    FOREIGN KEY (DeviceID) REFERENCES Device(DeviceID)
);

-- Ad Table
CREATE TABLE Ad (
    AdID INT PRIMARY KEY AUTO_INCREMENT,
    Content TEXT,
    Duration INT,
    DeviceID INT,
    FOREIGN KEY (DeviceID) REFERENCES Device(DeviceID)
);

CREATE TABLE AdminCompliance (
    AdminID INT,
    ComplianceID INT,
    PRIMARY KEY (AdminID, ComplianceID),
    FOREIGN KEY (AdminID) REFERENCES Admin(AdminID),
    FOREIGN KEY (ComplianceID) REFERENCES Compliance(ComplianceID)
);

CREATE TABLE StreamingMusic (
    PlatformID INT,
    MusicID INT,
    PRIMARY KEY (PlatformID, MusicID),
    FOREIGN KEY (PlatformID) REFERENCES StreamingPlatform(PlatformID),
    FOREIGN KEY (MusicID) REFERENCES Music(MusicID)
);