package com.movieapp.model;

public class Movie {
    private int id;
    private String title;
    private String language; // Telugu, Hindi, Tamil
    private String genre;
    private double rating;
    private String imageUrl;
    private String theater;
    private String timings;

    public Movie(int id, String title, String language, String genre, double rating, String imageUrl, String theater, String timings) {
        this.id = id;
        this.title = title;
        this.language = language;
        this.genre = genre;
        this.rating = rating;
        this.imageUrl = imageUrl;
        this.theater = theater;
        this.timings = timings;
    }

    public int getId() { return id; }
    public String getTitle() { return title; }
    public String getLanguage() { return language; }
    public String getGenre() { return genre; }
    public double getRating() { return rating; }
    public String getImageUrl() { return imageUrl; }
    public String getTheater() { return theater; }
    public String getTimings() { return timings; }
}