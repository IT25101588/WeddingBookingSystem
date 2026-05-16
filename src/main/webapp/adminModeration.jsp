<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="models.Review" %>
<%
    String role = (String) session.getAttribute("userRole");
    if (role == null || !role.equalsIgnoreCase("Admin")) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Moderate Reviews | DreamWedding Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background: linear-gradient(rgba(0, 0, 0, 0.8), rgba(0, 0, 0, 0.9)), url('https://images.unsplash.com/photo-1519225421980-715cb0215aed?auto=format&fit=crop&w=2000&q=80') center/cover fixed; color: white; padding: 40px 20px; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; }
        .table-container { background: rgba(255, 255, 255, 0.05); backdrop-filter: blur(15px); border: 1px solid rgba(255, 255, 255, 0.1); border-radius: 20px; padding: 30px; margin: 0 auto; max-width: 1100px; box-shadow: 0 25px 50px rgba(0,0,0,0.5); }
        .table { color: white; margin-bottom: 0; }
        .table thead th { border-bottom: 2px solid rgba(220, 53, 69, 0.5); background: rgba(220, 53, 69, 0.1); color: #ff6b6b; padding: 15px; }
        .table tbody td { border-bottom: 1px solid rgba(255, 255, 255, 0.1); padding: 15px; vertical-align: middle; }
    </style>
</head>
<body>
<div class="table-container">
    <h2 class="fw-bold mb-1 text-danger">Moderate Reviews</h2>
    <p class="text-light opacity-50 small mb-4">Delete inappropriate or spam reviews to maintain platform quality.</p>

    <% if ("true".equals(request.getParameter("deleted"))) { %>
    <div class="alert alert-danger border-0 shadow-sm" style="background: rgba(220, 53, 69, 0.8); color: white;">
        Review successfully deleted.
    </div>
    <% } %>

    <div class="table-responsive">
        <table class="table">
            <thead>
            <tr>
                <th>ID</th>
                <th>User Email</th>
                <th>Target ID</th>
                <th>Rating</th>
                <th style="width: 35%;">Comment</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <%
                List<Review> reviewList = (List<Review>) request.getAttribute("reviewList");
                if (reviewList != null && !reviewList.isEmpty()) {
                    for (Review r : reviewList) {
            %>
            <tr>
                <td class="small opacity-50"><%= r.getReviewId() %></td>
                <td><%= r.getUserEmail() %></td>
                <td><span class="badge bg-secondary"><%= r.getTargetId() %></span></td>
                <td class="text-warning fw-bold"><%= r.getRating() %> / 5</td>
                <td class="small opacity-75">"<%= r.getComment() %>"</td>
                <td>
                    <form action="DeleteReviewServlet" method="POST" style="margin: 0;">
                        <input type="hidden" name="reviewId" value="<%= r.getReviewId() %>">
                        <button type="submit" class="btn btn-sm btn-outline-danger" onclick="return confirm('Delete this review permanently?');">Delete</button>
                    </form>
                </td>
            </tr>
            <%      }
            } else {
            %>
            <tr><td colspan="6" class="text-center py-4 opacity-50">No reviews found in the system.</td></tr>
            <%  } %>
            </tbody>
        </table>
    </div>

    <div class="mt-4 pt-3 border-top border-secondary border-opacity-25">
        <a href="dashboard.jsp" class="btn btn-outline-light px-4">← Back to Dashboard</a>
    </div>
</div>
<script src="heart-cursor.js"></script>
</body>
</html>