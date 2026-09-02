<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>BookMyShow - Movie Ticket Booking</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #0f172a; color: #f8fafc; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; }
        .card { background-color: #1e293b; border: 1px solid #334155; border-radius: 12px; transition: transform 0.2s; }
        .card:hover { transform: translateY(-5px); }
        .badge-lang { font-size: 0.85rem; padding: 5px 10px; border-radius: 6px; }
        .btn-custom { background: linear-gradient(135deg, #ef4444, #f97316); border: none; font-weight: 600; color: white; }
        .btn-custom:hover { background: linear-gradient(135deg, #dc2626, #ea580c); color: white; }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark py-3 border-bottom border-secondary">
        <div class="container">
            <a class="navbar-brand fw-bold fs-3 text-warning" href="movies">🎬 CineShow</a>
            <div class="d-flex gap-2">
                <a href="movies?lang=All" class="btn btn-sm btn-outline-light">All</a>
                <a href="movies?lang=Telugu" class="btn btn-sm btn-outline-warning">Telugu</a>
                <a href="movies?lang=Tamil" class="btn btn-sm btn-outline-info">Tamil</a>
                <a href="movies?lang=Hindi" class="btn btn-sm btn-outline-danger">Hindi</a>
            </div>
        </div>
    </nav>

    <div class="container my-5">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2 class="fw-bold">Now Showing in Theaters</h2>
            <span class="text-secondary">Language: <strong>${selectedLang != null ? selectedLang : 'All'}</strong></span>
        </div>

        <div class="row g-4">
            <c:forEach var="movie" items="${movies}">
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="card h-100 shadow">
                        <img src="${movie.imageUrl}" class="card-img-top" style="height: 240px; object-fit: cover;" alt="${movie.title}">
                        <div class="card-body d-flex flex-column">
                            <div class="d-flex justify-content-between align-items-center mb-2">
                                <span class="badge bg-danger badge-lang">${movie.language}</span>
                                <span class="text-warning fw-bold">⭐ ${movie.rating}/10</span>
                            </div>
                            <h4 class="card-title text-white fw-bold">${movie.title}</h4>
                            <p class="card-text text-secondary mb-1"><strong>Genre:</strong> ${movie.genre}</p>
                            <p class="card-text text-secondary mb-1"><strong>Theater:</strong> ${movie.theater}</p>
                            <p class="card-text text-light mb-3"><strong>Timings:</strong> ${movie.timings}</p>
                            <div class="mt-auto">
                                <a href="book?id=${movie.id}" class="btn btn-custom w-100 py-2">Book Tickets</a>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</body>
</html>
