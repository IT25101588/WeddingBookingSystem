<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // SECURITY CHECK: Only let logged-in users (Couples) see this page
    String role = (String) session.getAttribute("userRole");
    if (role == null || role.equalsIgnoreCase("Admin")) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Submit a Review | DreamWedding</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            min-height: 100vh;
            background: linear-gradient(rgba(0, 0, 0, 0.75), rgba(0, 0, 0, 0.85)),
            url('https://images.unsplash.com/photo-1519225421980-715cb0215aed?auto=format&fit=crop&w=1500&q=80') center/cover no-repeat fixed;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            padding: 20px;
        }
        .review-card { background: rgba(255, 255, 255, 0.05); backdrop-filter: blur(15px); border: 1px solid rgba(255, 255, 255, 0.1); border-radius: 20px; padding: 40px; width: 100%; max-width: 600px; box-shadow: 0 25px 50px rgba(0,0,0,0.5); color: white; }
        .form-control, .form-select { background: rgba(255, 255, 255, 0.08); border: 1px solid rgba(255, 255, 255, 0.2); color: white; border-radius: 10px; padding: 12px; }
        .form-control:focus, .form-select:focus { background: rgba(255, 255, 255, 0.15); color: white; border-color: #ffc107; box-shadow: 0 0 0 0.25rem rgba(255, 193, 7, 0.25); }
        option { background: #222; color: white; }
        .btn-warning { font-weight: bold; padding: 12px; border-radius: 10px; transition: 0.3s; }
        .btn-warning:hover { transform: translateY(-2px); box-shadow: 0 10px 20px rgba(255, 193, 7, 0.3); }
    </style>
</head>
<body>
<div class="review-card">
    <div class="text-center mb-4">
        <h2 class="fw-bold text-warning">Share Your Experience</h2>
        <p class="text-light opacity-75">Rate a vendor or venue to help other couples plan their perfect day.</p>
    </div>

    <!-- Error Message if submission fails -->
    <% if ("true".equals(request.getParameter("error"))) { %>
    <div class="alert alert-danger border-0 shadow-sm" style="background: rgba(220, 53, 69, 0.8); color: white;">
        Failed to save review. Please try again.
    </div>
    <% } %>

    <form action="SubmitReviewServlet" method="POST">

        <div class="mb-3">
            <label class="form-label small ms-1 fw-bold text-light opacity-75">Vendor or Venue ID</label>
            <input type="text" name="targetId" class="form-control" placeholder="e.g., VND12345 or LOC98765" required>
            <div class="form-text text-light opacity-50 small ms-1">You can find this ID on your Bookings page.</div>
        </div>

        <div class="mb-3">
            <label class="form-label small ms-1 fw-bold text-light opacity-75">Rating</label>
            <select name="rating" class="form-select" required>
                <option value="" disabled selected>-- Select Stars --</option>
                <option value="5">⭐⭐⭐⭐⭐ (5) - Perfect</option>
                <option value="4">⭐⭐⭐⭐ (4) - Great</option>
                <option value="3">⭐⭐⭐ (3) - Average</option>
                <option value="2">⭐⭐ (2) - Poor</option>
                <option value="1">⭐ (1) - Terrible</option>
            </select>
        </div>

        <div class="mb-4">
            <label class="form-label small ms-1 fw-bold text-light opacity-75">Your Comment</label>
            <textarea name="comment" class="form-control" rows="4" placeholder="Tell us about your experience..." required></textarea>
        </div>

        <button type="submit" class="btn btn-warning w-100 mb-3 shadow">Submit Review</button>
        <a href="userDashboard.jsp" class="btn btn-outline-light w-100 py-2">Cancel</a>
    </form>
</div>
<script src="heart-cursor.js"></script>
</body>
</html>