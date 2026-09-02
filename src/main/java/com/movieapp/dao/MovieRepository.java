package com.movieapp.dao;

import com.movieapp.model.Movie;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class MovieRepository {
    private static final List<Movie> movies = new ArrayList<>();

    static {
        // Telugu Movies
        movies.add(new Movie(1, "Vishwanath and Sons", "Telugu", "Family / Drama", 8.9, 
            "https://images.unsplash.com/photo-1489599849927-2ee91cede3ba?w=500", "AMB Cinemas, Hyderabad", "10:30 AM, 02:15 PM, 06:45 PM"));
        movies.add(new Movie(2, "Hi", "Telugu", "Romantic Drama", 8.4, 
            "https://images.unsplash.com/photo-1517604931442-7e0c8ed2963c?w=500", "Prasads Multiplex, Hyderabad", "11:15 AM, 04:00 PM, 09:30 PM"));
        movies.add(new Movie(3, "Game Changer", "Telugu", "Political Action", 8.7, 
            "https://images.unsplash.com/photo-1536440136628-849c177e76a1?w=500", "PVR Forum Mall, Hyderabad", "01:00 PM, 07:15 PM, 10:45 PM"));

        // Tamil Movies
        movies.add(new Movie(4, "Irumudi", "Tamil", "Devotional / Action", 8.8, 
            "https://images.unsplash.com/photo-1509198397868-475647b2a1e5?w=500", "Sathyam Cinemas, Chennai", "09:30 AM, 01:45 PM, 06:30 PM"));
        movies.add(new Movie(5, "Coolie", "Tamil", "Action Thriller", 9.1, 
            "https://images.unsplash.com/photo-1478720568477-152d9b164e26?w=500", "PVR VR Chennai", "11:00 AM, 03:30 PM, 08:00 PM"));
        movies.add(new Movie(6, "Vettaiyan", "Tamil", "Investigative Drama", 8.5, 
            "https://images.unsplash.com/photo-1440404653325-ab127d49abc1?w=500", "Rohini Silver Screens, Chennai", "10:00 AM, 02:00 PM, 07:00 PM"));

        // Hindi & Pan-India Movies
        movies.add(new Movie(7, "Toxic", "Hindi", "Dark Action Drama", 9.3, 
            "https://images.unsplash.com/photo-1518676590629-3dcbd9c5a5c9?w=500", "PVR ICON Infinity, Mumbai", "12:00 PM, 05:30 PM, 10:15 PM"));
        movies.add(new Movie(8, "War 2", "Hindi", "Spy Action", 8.6, 
            "https://images.unsplash.com/photo-1460881680858-30d870d7bffe?w=500", "INOX Megaplex, Mumbai", "11:45 AM, 03:15 PM, 08:45 PM"));
        movies.add(new Movie(9, "Stree 2", "Hindi", "Horror / Comedy", 8.9, 
            "https://images.unsplash.com/photo-1594909122845-11baa439b7bf?w=500", "Cinepolis, Delhi NCR", "01:30 PM, 06:00 PM, 09:45 PM"));
    }

    public static List<Movie> getAllMovies() {
        return movies;
    }

    public static List<Movie> getMoviesByLanguage(String lang) {
        if (lang == null || lang.equalsIgnoreCase("All")) {
            return movies;
        }
        return movies.stream()
                .filter(m -> m.getLanguage().equalsIgnoreCase(lang))
                .collect(Collectors.toList());
    }

    public static Movie getMovieById(int id) {
        return movies.stream().filter(m -> m.getId() == id).findFirst().orElse(null);
    }
}