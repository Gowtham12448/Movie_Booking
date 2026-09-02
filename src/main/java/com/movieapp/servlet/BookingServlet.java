package com.movieapp.servlet;

import com.movieapp.dao.MovieRepository;
import com.movieapp.model.Movie;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.UUID;

@WebServlet("/book")
public class BookingServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        int movieId = Integer.parseInt(request.getParameter("id"));
        Movie movie = MovieRepository.getMovieById(movieId);
        request.setAttribute("movie", movie);
        request.getRequestDispatcher("booking.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String movieTitle = request.getParameter("movieTitle");
        String theater = request.getParameter("theater");
        String time = request.getParameter("timing");
        String seats = request.getParameter("seats");
        String userName = request.getParameter("userName");
        String userPhone = request.getParameter("userPhone");

        int seatCount = seats != null && !seats.isEmpty() ? seats.split(",").length : 1;
        int totalAmount = seatCount * 250; // ₹250 per ticket
        String bookingId = "BK-" + UUID.randomUUID().toString().substring(0, 8).toUpperCase();

        request.setAttribute("bookingId", bookingId);
        request.setAttribute("movieTitle", movieTitle);
        request.setAttribute("theater", theater);
        request.setAttribute("timing", time);
        request.setAttribute("seats", seats);
        request.setAttribute("userName", userName);
        request.setAttribute("totalAmount", totalAmount);

        request.getRequestDispatcher("confirmation.jsp").forward(request, response);
    }
}