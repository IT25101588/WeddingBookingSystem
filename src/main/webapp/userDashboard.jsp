<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>My Wedding | DreamWedding</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            min-height: 100vh;
            background: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.8)),
            url('https://images.unsplash.com/photo-1519741497674-611481863552?auto=format&fit=crop&w=2000&q=80') center/cover no-repeat fixed;
            color: white;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .navbar {
            background: rgba(255, 255, 255, 0.05) !important;
            backdrop-filter: blur(10px);
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }

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

        .btn-action { border-radius: 10px; font-weight: 600; padding: 10px; transition: 0.2s; }
        .icon-box { font-size: 2.5rem; margin-bottom: 15px; }
    </style>
</head>
<body>

<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark mb-5 px-4">
    <div class="container">
        <a class="navbar-brand fw-bold fs-3" href="userDashboard.jsp">💍 DreamWedding.</a>
        <div class="d-flex align-items-center">
            <span class="navbar-text me-3 text-light opacity-75">Welcome, <strong>Happy Couple</strong></span>
            <a href="index.jsp" class="btn btn-outline-light btn-sm rounded-pill px-3">Logout</a>
        </div>
    </div>
</nav>

<div class="container">

    <div class="mb-5 text-white text-center">
        <h1 class="fw-bold display-5">Plan Your Perfect Day</h1>
        <p class="text-light opacity-75 fs-5">Browse top-tier vendors, luxury venues, and manage your reservations.</p>
    </div>

    <!-- Success Alerts -->
    <% if ("true".equals(request.getParameter("bookingAdded"))) { %>
    <div class="alert alert-success border-0 shadow-lg text-white mb-4" style="background: rgba(25, 135, 84, 0.3); backdrop-filter: blur(10px);">
        <strong>✨ Success!</strong> Your wedding booking has been confirmed.
    </div>
    <% } %>

    <% if ("true".equals(request.getParameter("reviewAdded"))) { %>
    <div class="alert alert-warning border-0 shadow-lg mb-4 text-dark" style="background: rgba(255, 193, 7, 0.9); backdrop-filter: blur(10px);">
        <strong>⭐ Thank You!</strong> Your review has been successfully published.
    </div>
    <% } %>

    <!-- 4-Column Layout -->
    <div class="row g-4 justify-content-center pb-5">

        <!-- My Bookings -->
        <div class="col-md-6 col-lg-3">
            <div class="card dashboard-card text-center p-4">
                <div class="icon-box">📅</div>
                <h3 class="fw-bold text-white">My Bookings</h3>
                <p class="text-light opacity-75 small mb-4">View your confirmed event schedules and vendor reservations.</p>
                <div class="mt-auto">
                    <a href="ViewBookingsServlet" class="btn btn-success w-100 btn-action shadow-sm">View My Bookings</a>
                </div>
            </div>
        </div>

        <!-- Explore Venues -->
        <div class="col-md-6 col-lg-3">
            <div class="card dashboard-card text-center p-4">
                <div class="icon-box">🏨</div>
                <h3 class="fw-bold text-white">Explore Venues</h3>
                <p class="text-light opacity-75 small mb-4">Discover the perfect location for your ceremony and reception.</p>
                <div class="mt-auto">
                    <a href="ViewVenuesServlet" class="btn btn-primary w-100 btn-action shadow-sm">Browse Locations</a>
                </div>
            </div>
        </div>

        <!-- Find Vendors -->
        <div class="col-md-6 col-lg-3">
            <div class="card dashboard-card text-center p-4">
                <div class="icon-box">📷</div>
                <h3 class="fw-bold text-white">Find Vendors</h3>
                <p class="text-light opacity-75 small mb-4">Connect with elite photographers, caterers, and decorators.</p>
                <div class="mt-auto">
                    <a href="ViewVendorsServlet" class="btn btn-info text-dark w-100 btn-action shadow-sm">Browse Services</a>
                </div>
            </div>
        </div>

        <!-- NEW: Community Reviews -->
        <div class="col-md-6 col-lg-3">
            <div class="card dashboard-card text-center p-4">
                <div class="icon-box">⭐</div>
                <h3 class="fw-bold text-white">Reviews</h3>
                <p class="text-light opacity-75 small mb-4">Read feedback from other couples or share your own experience.</p>
                <div class="mt-auto">
                    <a href="ViewReviewsServlet" class="btn btn-warning text-dark w-100 btn-action shadow-sm fw-bold">Community Reviews</a>
                </div>
            </div>
        </div>

    </div>
</div>

</body>
</html>