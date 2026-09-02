<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Book - ${movie.title}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #0f172a; color: #fff; }
        .seat { width: 38px; height: 38px; margin: 4px; background-color: #334155; border-radius: 6px; cursor: pointer; text-align: center; line-height: 38px; font-size: 0.8rem; user-select: none; }
        .seat.selected { background-color: #22c55e !important; color: white; font-weight: bold; }
        .seat:hover { background-color: #475569; }
        .screen { background: #64748b; height: 8px; width: 80%; margin: 20px auto; border-radius: 4px; box-shadow: 0 4px 10px rgba(255,255,255,0.3); }
    </style>
</head>
<body>
    <div class="container py-5">
        <a href="movies" class="btn btn-outline-light mb-4">&larr; Back to Movies</a>
        <div class="row">
            <div class="col-lg-7">
                <div class="card bg-dark border-secondary p-4 text-center">
                    <h5 class="text-secondary mb-3">Select Your Seats (Screen This Way)</h5>
                    <div class="screen"></div>
                    <p class="small text-muted mb-4">All eyes this way</p>
                    
                    <div id="seatContainer" class="d-flex flex-column align-items-center mb-4">
                        </div>
                </div>
            </div>

            <div class="col-lg-5">
                <div class="card bg-dark border-secondary p-4">
                    <h3 class="fw-bold text-warning">${movie.title}</h3>
                    <p class="text-muted">${movie.language} | ${movie.genre}</p>
                    <hr class="border-secondary">

                    <form action="book" method="POST">
                        <input type="hidden" name="movieTitle" value="${movie.title}">
                        <input type="hidden" name="theater" value="${movie.theater}">

                        <div class="mb-3">
                            <label class="form-label">Select Show Time</label>
                            <select name="timing" class="form-select bg-secondary text-white" required>
                                <option value="10:30 AM">10:30 AM</option>
                                <option value="02:15 PM">02:15 PM</option>
                                <option value="06:45 PM">06:45 PM</option>
                                <option value="10:00 PM">10:00 PM</option>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Selected Seats</label>
                            <input type="text" id="seatInput" name="seats" class="form-control bg-secondary text-white" readonly required placeholder="Click seats on the left">
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Your Name</label>
                            <input type="text" name="userName" class="form-control bg-secondary text-white" placeholder="John Doe" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Phone Number</label>
                            <input type="tel" name="userPhone" class="form-control bg-secondary text-white" placeholder="9876543210" required>
                        </div>

                        <button type="submit" class="btn btn-warning w-100 fw-bold py-2">Confirm & Book Ticket</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script>
        const container = document.getElementById('seatContainer');
        const seatInput = document.getElementById('seatInput');
        const rows = ['A', 'B', 'C', 'D', 'E'];
        let selected = [];

        rows.forEach(r => {
            const rowDiv = document.createElement('div');
            rowDiv.className = 'd-flex';
            for (let i = 1; i <= 8; i++) {
                const seatId = r + i;
                const seat = document.createElement('div');
                seat.className = 'seat';
                seat.innerText = seatId;
                seat.onclick = () => {
                    if (seat.classList.contains('selected')) {
                        seat.classList.remove('selected');
                        selected = selected.filter(s => s !== seatId);
                    } else {
                        seat.classList.add('selected');
                        selected.push(seatId);
                    }
                    seatInput.value = selected.join(', ');
                };
                rowDiv.appendChild(seat);
            }
            container.appendChild(rowDiv);
        });
    </script>
</body>
</html>