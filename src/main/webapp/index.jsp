<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>DreamWedding | Plan Your Perfect Day</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* This creates a beautiful full-screen background image with a dark overlay so the text pops */
        .hero-section {
            height: 100vh;
            background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.7)),
            url('https://images.unsplash.com/photo-1519741497674-611481863552?auto=format&fit=crop&w=2000&q=80') center/cover no-repeat fixed;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
        }

        .hero-text {
            animation: fadeIn 1.5s ease-in-out;
        }

        /* A little subtle animation to make it feel premium */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body class="bg-dark">

<nav class="navbar navbar-expand-lg navbar-dark fixed-top px-4" style="background: rgba(0,0,0,0.5); backdrop-filter: blur(5px);">
    <a class="navbar-brand fw-bold fs-4" href="index.jsp">💍 DreamWedding.</a>
    <div class="ms-auto">
        <a href="login.jsp" class="btn btn-outline-light me-2">Admin Login</a>
    </div>
</nav>

<div class="hero-section">
    <div class="container px-4 hero-text">
        <h1 class="display-2 fw-bold mb-4 text-white shadow-sm">Your Dream Wedding Starts Here</h1>
        <p class="lead mb-5 fs-4 text-light fw-light">Seamlessly manage venues, vendors, and event dates all in one professional platform.</p>

        <div class="d-grid gap-3 d-sm-flex justify-content-sm-center mt-2">
            <a href="login.jsp" class="btn btn-primary btn-lg px-5 py-3 fw-bold shadow-lg rounded-pill">Login to Dashboard</a>
            <a href="register.jsp" class="btn btn-outline-light btn-lg px-5 py-3 fw-bold shadow-lg rounded-pill">Register a New Couple</a>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>