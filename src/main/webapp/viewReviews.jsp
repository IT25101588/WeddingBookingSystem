<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="models.Review" %>
<%
    // Bounce anyone who isn't logged in
    String role = (String) session.getAttribute("userRole");
    if (role == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Community Reviews | DreamWedding</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            min-height: 100vh;
            background: linear-gradient(rgba(0, 0, 0, 0.8), rgba(0, 0, 0, 0.9)),
            url('https://images.unsplash.com/photo-1519225421980-715cb0215aed?auto=format&fit=crop&w=2000&q=80') center/cover fixed;
            color: white;
            padding: 40px 20px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .table-container {
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(15px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 20px;
            padding: 30px;
            box-shadow: 0 25px 50px rgba(0,0,0,0.5);
            margin: 0 auto;
            max-width: 1000px;
        }
        .table { color: white; margin-bottom: 0; }
        .table thead th { border-bottom: 2px solid rgba(255, 193, 7, 0.5); background: rgba(255, 193, 7, 0.1); color: #ffc107; padding: 15px; font-weight: 600; }
        .table tbody td { border-bottom: 1px solid rgba(255, 255, 255, 0.1); padding: 15px; vertical-align: middle; }
        .table tbody tr:hover { background: rgba(255, 255, 255, 0.05); }
        .star-rating { color: #ffc107; font-size: 1.2rem; }
    </style>
</head>
<body>

<div class="table-container">

    <div class="d-flex justify-content-between align-items-center mb-4">
        <div>
            <h2 class="fw-bold mb-0 text-warning">Community Reviews</h2>
            <p class="text-light opacity-50 small mb-0">See what couples are saying about our vendors and venues.</p>
        </div>

        <%-- Only show "Write a Review" to Couples --%>
        <% if ("Couple".equalsIgnoreCase(role)) { %>
        <a href="submitReview.jsp" class="btn btn-warning shadow fw-bold">+ Write a Review</a>
        <% } %>
    </div>

    <div class="table-responsive">
        <table class="table">
            <thead>
            <tr>
                <th>User Email</th>
                <th>Vendor/Venue ID</th>
                <th>Rating</th>
                <th style="width: 40%;">Comment</th>
            </tr>
            </thead>
            <tbody>
            <%
                List<Review> reviewList = (List<Review>) request.getAttribute("reviewList");
                if (reviewList != null && !reviewList.isEmpty()) {
                    for (Review r : reviewList) {
                        // Create the star visual
                        String stars = "";
                        for(int i=0; i<r.getRating(); i++) stars += "★";
                        for(int i=r.getRating(); i<5; i++) stars += "☆";
            %>
            <tr>
                <td class="opacity-75"><%= r.getUserEmail() %></td>
                <td><span class="badge bg-secondary"><%= r.getTargetId() %></span></td>
                <td class="star-rating"><%= stars %></td>
                <td class="small opacity-75"><em>"<%= r.getComment() %>"</em></td>
            </tr>
            <%      }
            } else {
            %>
            <tr>
                <td colspan="4" class="text-center py-4 opacity-50">No reviews have been posted yet. Be the first!</td>
            </tr>
            <%  } %>
            </tbody>
        </table>
    </div>

    <!-- Smart Footer that returns to the correct dashboard -->
    <div class="mt-4 pt-3 border-top border-secondary border-opacity-25">
        <% String returnPage = ("Admin".equalsIgnoreCase(role)) ? "dashboard.jsp" : "userDashboard.jsp"; %>
        <a href="<%= returnPage %>" class="btn btn-outline-light px-4">← Back to Dashboard</a>
    </div>

</div>
<script src="heart-cursor.js"></script>
</body>
</html>