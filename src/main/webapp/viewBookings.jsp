<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="models.Booking" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Bookings | DreamWedding Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            min-height: 100vh;
            background: linear-gradient(rgba(0, 0, 0, 0.8), rgba(0, 0, 0, 0.9)),
            url('https://images.unsplash.com/photo-1519225421980-715cb0215aed?auto=format&fit=crop&w=1500&q=80') center/cover no-repeat fixed;
            color: white;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            padding: 40px 0;
        }

        .glass-container {
            background: rgba(255, 255, 255, 0.03);
            backdrop-filter: blur(15px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 20px;
            padding: 30px;
            box-shadow: 0 25px 50px rgba(0,0,0,0.5);
        }

        /* Customizing the table to look like glass */
        .glass-table {
            color: white;
            margin-bottom: 0;
        }

        .glass-table thead th {
            background: rgba(25, 135, 84, 0.2); /* Subtle green tint for the header */
            color: #fff;
            border-bottom: 2px solid rgba(25, 135, 84, 0.5);
            font-weight: 600;
            letter-spacing: 0.5px;
            padding: 15px;
        }

        .glass-table tbody td {
            background: rgba(255, 255, 255, 0.02);
            border-bottom: 1px solid rgba(255, 255, 255, 0.05);
            color: #e0e0e0;
            vertical-align: middle;
            padding: 15px;
        }

        /* Hover effect for table rows */
        .glass-table tbody tr:hover td {
            background: rgba(255, 255, 255, 0.08);
            color: white;
            cursor: pointer;
        }

        /* Glass-style badges */
        .glass-badge-secondary {
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            color: white;
        }

        .glass-badge-success {
            background: rgba(25, 135, 84, 0.2);
            border: 1px solid rgba(25, 135, 84, 0.5);
            color: #75b798;
        }

        .btn-custom { border-radius: 10px; font-weight: bold; }
    </style>
</head>
<body>

<div class="container">
    <div class="glass-container">

        <div class="d-flex justify-content-between align-items-center mb-4">
            <div>
                <h2 class="fw-bold mb-0 text-success">Confirmed Bookings</h2>
                <p class="text-light opacity-50 small mb-0">Overview of all active wedding reservations.</p>
            </div>
            <a href="addBooking.jsp" class="btn btn-success shadow btn-custom">+ Create New Booking</a>
        </div>

        <div class="table-responsive" style="border-radius: 10px; overflow: hidden;">
            <table class="table glass-table table-borderless">
                <thead>
                <tr>
                    <th>Booking ID</th>
                    <th>Couple Email</th>
                    <th>Venue ID</th>
                    <th>Vendor ID</th>
                    <th>Event Date</th>
                    <th>Status</th>
                </tr>
                </thead>
                <tbody>
                <%
                    List<Booking> bookings = (List<Booking>) request.getAttribute("bookingList");
                    if (bookings != null && !bookings.isEmpty()) {
                        for (Booking b : bookings) {
                %>
                <tr>
                    <td><span class="badge glass-badge-secondary rounded-pill px-3 py-2"><%= b.getBookingId() %></span></td>
                    <td class="fw-bold"><%= b.getUserEmail() %></td>
                    <td class="opacity-75 small"><%= b.getVenueId() %></td>
                    <td class="opacity-75 small"><%= b.getVendorId() %></td>
                    <td class="text-success fw-bold"><%= b.getEventDate() %></td>
                    <td><span class="badge glass-badge-success rounded-pill px-3 py-2"><%= b.getStatus() %></span></td>
                </tr>
                <%
                    }
                } else {
                %>
                <tr>
                    <td colspan="6" class="text-center text-light opacity-50 py-5">
                        <div class="fs-1 mb-2">📂</div>
                        No reservations found. Time to book some weddings!
                    </td>
                </tr>
                <%
                    }
                %>
                </tbody>
            </table>
        </div>

        <div class="mt-4 pt-3 border-top border-secondary border-opacity-25">
            <%
                // Check who is currently looking at the page
                String currentRole = (String) session.getAttribute("userRole");
                String returnPage = (currentRole != null && currentRole.equalsIgnoreCase("Admin")) ? "dashboard.jsp" : "userDashboard.jsp";
            %>
            <a href="<%= returnPage %>" class="btn btn-outline-light btn-custom px-4">← Back to Dashboard</a>
        </div>
    </div>
</div>

</body>
</html>
