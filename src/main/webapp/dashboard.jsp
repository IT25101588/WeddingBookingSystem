<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard | DreamWedding</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            min-height: 100vh;
            background: linear-gradient(rgba(0, 0, 0, 0.8), rgba(0, 0, 0, 0.9)),
            url('https://images.unsplash.com/photo-1519167758481-83f550bb49b3?auto=format&fit=crop&w=1500&q=80') center/cover no-repeat fixed;
            color: white;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .navbar {
            background: rgba(255, 255, 255, 0.05) !important;
            backdrop-filter: blur(10px);
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }

        /* Added color: white !important to guarantee text is readable */
        .dashboard-card {
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(15px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 20px;
            transition: all 0.3s ease;
            height: 100%;
            color: white !important;
        }

        .dashboard-card:hover {
            transform: translateY(-10px);
            background: rgba(255, 255, 255, 0.1);
            border-color: rgba(255, 255, 255, 0.3);
            box-shadow: 0 15px 30px rgba(0,0,0,0.4);
        }

        .btn-action {
            border-radius: 10px;
            font-weight: 600;
            padding: 10px;
            margin-bottom: 8px;
            transition: 0.2s;
        }

        .icon-box {
            font-size: 2.5rem;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark mb-5 px-4">
    <div class="container">
        <a class="navbar-brand fw-bold fs-3" href="dashboard.jsp">💍 DreamWedding Admin</a>
        <div class="d-flex align-items-center">
            <span class="navbar-text me-3 text-light opacity-75">Logged in as: <strong>Admin</strong></span>
            <a href="index.jsp" class="btn btn-outline-light btn-sm rounded-pill px-3">Logout</a>
        </div>
    </div>
</nav>

<div class="container">

    <div class="mb-5 text-white">
        <h1 class="fw-bold">Management Overview</h1>
        <p class="text-light opacity-75">Monitor and organize every detail of the wedding journey.</p>
    </div>

        <% if ("true".equals(request.getParameter("bookingAdded"))) { %>
    <div class="alert alert-success border-0 shadow-lg text-white" style="background: rgba(25, 135, 84, 0.3); backdrop-filter: blur(10px);">
        <strong>✨ Success!</strong> The new booking has been confirmed.
    </div>
        <% } %>

    <!-- 4-Column Layout -->
    <div class="row g-4 justify-content-center">

        <!-- Bookings -->
        <div class="col-md-6 col-lg-3">
            <div class="card dashboard-card text-white p-4">
                <div class="icon-box">📅</div>
                <h3 class="fw-bold text-white">Bookings</h3>
                <p class="text-light opacity-75 small mb-4">Coordinate couple schedules and event confirmations.</p>
                <div class="mt-auto">
                    <a href="addBooking.jsp" class="btn btn-success w-100 btn-action shadow-sm mb-2">Create New Booking</a>
                    <a href="ViewBookingsServlet" class="btn btn-outline-light w-100 btn-action shadow-sm">View All Bookings</a>
                </div>
            </div>
        </div>

        <!-- Venues -->
        <div class="col-md-6 col-lg-3">
            <div class="card dashboard-card text-white p-4">
                <div class="icon-box">🏨</div>
                <h3 class="fw-bold text-white">Venues</h3>
                <p class="text-light opacity-75 small mb-4">Manage banquet halls, hotels, and luxury locations.</p>
                <div class="mt-auto">
                    <a href="addVenue.jsp" class="btn btn-primary w-100 btn-action shadow-sm mb-2">Add New Venue</a>
                    <a href="ViewVenuesServlet" class="btn btn-outline-light w-100 btn-action shadow-sm">View Registered Venues</a>
                </div>
            </div>
        </div>

        <!-- Vendors -->
        <div class="col-md-6 col-lg-3">
            <div class="card dashboard-card text-white p-4">
                <div class="icon-box">📷</div>
                <h3 class="fw-bold text-white">Vendors</h3>
                <p class="text-light opacity-75 small mb-4">Oversee photographers, caterers, and decorators.</p>
                <div class="mt-auto">
                    <a href="addVendor.jsp" class="btn btn-info text-dark w-100 btn-action shadow-sm mb-2">Add New Vendor</a>
                    <a href="ViewVendorsServlet" class="btn btn-outline-light w-100 btn-action shadow-sm">View Vendor List</a>
                </div>
            </div>
        </div>

        <!-- NEW: Moderate Reviews -->
        <div class="col-md-6 col-lg-3">
            <div class="card dashboard-card text-white p-4">
                <div class="icon-box">⭐</div>
                <h3 class="fw-bold text-white">Reviews</h3>
                <p class="text-light opacity-75 small mb-4">Delete inappropriate or spam feedback to maintain quality.</p>
                <div class="mt-auto">
                    <a href="AdminModerationServlet" class="btn btn-danger w-100 btn-action shadow-sm">Moderate Reviews</a>
                </div>
            </div>
        </div>

    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="heart-cursor.js"></script>
</body>
</html>