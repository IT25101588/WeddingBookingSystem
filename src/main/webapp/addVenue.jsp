<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // SECURITY CHECK: Only let Admins load this page
    String role = (String) session.getAttribute("userRole");
    if (role == null || !role.equalsIgnoreCase("Admin")) {
        // Kick them back to the user dashboard
        response.sendRedirect("userDashboard.jsp");
        return; // This stops the rest of the HTML from loading!
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Venue | DreamWedding</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            min-height: 100vh;
            background: linear-gradient(rgba(0, 0, 0, 0.75), rgba(0, 0, 0, 0.85)),
            url('https://images.unsplash.com/photo-1519167758481-83f550bb49b3?auto=format&fit=crop&w=1500&q=80') center/cover no-repeat fixed;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            padding: 20px;
        }

        .venue-card {
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(15px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 20px;
            padding: 40px;
            width: 100%;
            max-width: 600px;
            box-shadow: 0 25px 50px rgba(0,0,0,0.5);
            color: white;
        }

        .form-control {
            background: rgba(255, 255, 255, 0.08);
            border: 1px solid rgba(255, 255, 255, 0.2);
            color: white;
            border-radius: 10px;
            padding: 12px;
        }

        .form-control:focus {
            background: rgba(255, 255, 255, 0.15);
            color: white;
            border-color: #0d6efd; /* Primary Blue for Venues */
            box-shadow: 0 0 0 0.25rem rgba(13, 110, 253, 0.25);
        }

        .form-control::placeholder {
            color: rgba(255, 255, 255, 0.4);
        }

        .btn-primary {
            border-radius: 10px;
            padding: 12px;
            font-weight: bold;
            letter-spacing: 0.5px;
            transition: 0.3s;
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(13, 110, 253, 0.3);
        }
    </style>
</head>
<body>

<div class="venue-card">
    <div class="text-center mb-4">
        <h2 class="fw-bold text-primary">Register New Venue</h2>
        <p class="text-light opacity-75">Add a luxury hotel, banquet hall, or destination.</p>
    </div>

    <% if ("true".equals(request.getParameter("error"))) { %>
    <div class="alert alert-danger py-2 small border-0 text-center" style="background: rgba(220, 53, 69, 0.2); color: #ff8e98;">
        Failed to save venue. Please try again.
    </div>
    <% } %>

    <form action="AddVenueServlet" method="POST">
        <div class="mb-3">
            <label class="form-label small ms-1 fw-bold text-light opacity-75">Venue Name (Hotel/Hall)</label>
            <input type="text" name="vName" class="form-control" placeholder="e.g., Cinnamon Grand" required>
        </div>

        <div class="mb-4">
            <label class="form-label small ms-1 fw-bold text-light opacity-75">Location / City</label>
            <input type="text" name="vLocation" class="form-control" placeholder="e.g., Colombo 03" required>
        </div>

        <div class="row g-3 mb-5">
            <div class="col-md-6">
                <label class="form-label small ms-1 fw-bold text-light opacity-75">Max Guest Capacity</label>
                <input type="number" name="vCapacity" class="form-control" placeholder="e.g., 500" required>
            </div>
            <div class="col-md-6">
                <label class="form-label small ms-1 fw-bold text-light opacity-75">Price Per Day (LKR)</label>
                <input type="number" name="vPrice" class="form-control" placeholder="e.g., 250000" required>
            </div>
        </div>

        <button type="submit" class="btn btn-primary w-100 mb-3 shadow">Save Venue Configuration</button>
        <a href="dashboard.jsp" class="btn btn-outline-light w-100 py-2">Cancel & Return</a>
    </form>
</div>
<script src="heart-cursor.js"></script>
</body>
</html>