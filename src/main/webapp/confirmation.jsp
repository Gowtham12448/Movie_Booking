<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Booking Confirmed!</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #0f172a; color: white; }
        .ticket-card { background-color: #1e293b; border-radius: 15px; border: 2px dashed #38bdf8; }
    </style>
</head>
<body class="d-flex align-items-center justify-content-center min-vh-100">
    <div class="card ticket-card p-4 shadow-lg" style="max-width: 500px; width: 100%;">
        <div class="text-center mb-3">
            <span class="badge bg-success fs-6">Booking Confirmed! 🎉</span>
            <h2 class="mt-2 text-warning fw-bold">${movieTitle}</h2>
            <p class="text-secondary">Booking Ref: <strong>${bookingId}</strong></p>
        </div>
        <hr class="border-secondary">
        <div class="mb-2"><strong>Audience Name:</strong> ${userName}</div>
        <div class="mb-2"><strong>Theater:</strong> ${theater}</div>
        <div class="mb-2"><strong>Show Time:</strong> ${timing}</div>
        <div class="mb-2"><strong>Seat Numbers:</strong> <span class="badge bg-info text-dark">${seats}</span></div>
        <div class="mb-3"><strong>Total Amount Paid:</strong> ₹${totalAmount}</div>
        <hr class="border-secondary">
        <a href="movies" class="btn btn-outline-warning w-100">Book Another Movie</a>
    </div>
</body>
</html>