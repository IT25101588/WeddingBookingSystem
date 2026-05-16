<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="utils.FileHandler" %>
<%@ page import="models.Venue" %>
<%@ page import="models.Vendor" %>
<!DOCTYPE html>
<html>
<head>
    <title>Make a Booking | DreamWedding</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            min-height: 100vh;
            background: linear-gradient(rgba(0, 0, 0, 0.75), rgba(0, 0, 0, 0.85)),
            url('https://images.unsplash.com/photo-1606800052052-a08af7148866?auto=format&fit=crop&w=1500&q=80') center/cover no-repeat fixed;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            padding: 20px;
        }

        .booking-card {
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(15px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 20px;
            padding: 40px;
            width: 100%;
            max-width: 650px;
            box-shadow: 0 25px 50px rgba(0,0,0,0.5);
            color: white;
        }

        .form-control, .form-select {
            background: rgba(255, 255, 255, 0.08);
            border: 1px solid rgba(255, 255, 255, 0.2);
            color: white;
            border-radius: 10px;
            padding: 12px;
        }

        .form-control:focus, .form-select:focus {
            background: rgba(255, 255, 255, 0.15);
            color: white;
            border-color: #198754; /* Success Green */
            box-shadow: 0 0 0 0.25rem rgba(25, 135, 84, 0.25);
        }

        .form-control::placeholder {
            color: rgba(255, 255, 255, 0.4);
        }

        /* Makes the dropdown options readable */
        option { background: #222; color: white; }

        /* Magic trick to make the Date Picker calendar icon white */
        ::-webkit-calendar-picker-indicator {
            filter: invert(1);
            opacity: 0.7;
            cursor: pointer;
        }

        .btn-success {
            border-radius: 10px;
            padding: 12px;
            font-weight: bold;
            letter-spacing: 0.5px;
            transition: 0.3s;
        }

        .btn-success:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(25, 135, 84, 0.3);
        }

        .btn-outline-light { border-radius: 10px; }
    </style>
</head>
<body>

<div class="booking-card">
    <div class="text-center mb-4">
        <h2 class="fw-bold text-success">Reserve Wedding Details</h2>
        <p class="text-light opacity-75">Connect couples with their dream venues and vendors.</p>
    </div>

    <% if ("true".equals(request.getParameter("error"))) { %>
    <div class="alert alert-danger py-2 small border-0 text-center" style="background: rgba(220, 53, 69, 0.2); color: #ff8e98;">
        Failed to create booking. Please try again.
    </div>
    <% } %>

    <form action="AddBookingServlet" method="POST">

        <div class="mb-4">
            <label class="form-label small ms-1 fw-bold text-light opacity-75">Couple's Email</label>
            <input type="email" name="userEmail" class="form-control" placeholder="Enter registered couple email" required>
        </div>

        <div class="row g-3 mb-4">
            <div class="col-md-6">
                <label class="form-label small ms-1 fw-bold text-light opacity-75">Select Venue</label>
                <select name="venueId" class="form-select" required>
                    <option value="" disabled selected>-- Choose a Venue --</option>
                    <%
                        List<Venue> venues = FileHandler.getAllVenues();
                        for(Venue v : venues) {
                    %>
                    <option value="<%= v.getVenueId() %>"><%= v.getName() %> (<%= v.getLocation() %>)</option>
                    <% } %>
                </select>
            </div>

            <div class="col-md-6">
                <label class="form-label small ms-1 fw-bold text-light opacity-75">Primary Vendor</label>
                <select name="vendorId" class="form-select" required>
                    <option value="" disabled selected>-- Choose a Service --</option>
                    <%
                        List<Vendor> vendors = FileHandler.getAllVendors();
                        for(Vendor vnd : vendors) {
                    %>
                    <option value="<%= vnd.getId() %>"><%= vnd.getName() %> [<%= vnd.getServiceType() %>]</option>
                    <% } %>
                </select>
            </div>
        </div>

        <div class="mb-5">
            <label class="form-label small ms-1 fw-bold text-light opacity-75">Wedding Date</label>
            <input type="date" name="eventDate" class="form-control" required>
        </div>

        <button type="submit" class="btn btn-success w-100 mb-3">Confirm Reservation</button>
        <%
            // Check who is currently looking at the form
            String currentRole = (String) session.getAttribute("userRole");
            String cancelUrl = (currentRole != null && currentRole.equalsIgnoreCase("Admin")) ? "dashboard.jsp" : "userDashboard.jsp";
        %>
        <a href="<%= cancelUrl %>" class="btn btn-outline-light w-100 py-2">Cancel & Return</a>
    </form>
</div>
<script src="heart-cursor.js"></script>
</body>
</html>
