package com.movieapp.servlet;

import com.movieapp.dao.MovieRepository;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/movies")
public class MovieServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String lang = request.getParameter("lang");
        request.setAttribute("movies", MovieRepository.getMoviesByLanguage(lang));
        request.setAttribute("selectedLang", (lang == null ? "All" : lang));
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}