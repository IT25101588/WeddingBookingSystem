<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="models.Venue" %>
<%@ page import="utils.FileHandler" %>
<%
    // SECURITY: Admins Only
    String role = (String) session.getAttribute("userRole");
    if (role == null || !role.equalsIgnoreCase("Admin")) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Grab the ID from the URL (e.g., editVenue.jsp?id=LOC123...)
    String venueId = request.getParameter("id");
    Venue venueToEdit = null;

    if (venueId != null) {
        List<Venue> venues = FileHandler.getAllVenues();
        for (Venue v : venues) {
            if (v.getVenueId().equals(venueId)) {
                venueToEdit = v;
                break;
            }
        }
    }

    // If the ID is invalid or missing, bounce them back to the list
    if (venueToEdit == null) {
        response.sendRedirect("ViewVenuesServlet");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Venue | DreamWedding Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            min-height: 100vh;
            background: linear-gradient(rgba(0, 0, 0, 0.8), rgba(0, 0, 0, 0.9)),
            url('https://images.unsplash.com/photo-1464366400600-7168b8af9bc3?auto=format&fit=crop&w=1500&q=80') center/cover fixed;
            color: white; padding: 40px 20px; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .form-container {
            background: rgba(255, 255, 255, 0.05); backdrop-filter: blur(15px);
            border: 1px solid rgba(255, 255, 255, 0.1); border-radius: 20px;
            padding: 40px; max-width: 600px; margin: 0 auto; box-shadow: 0 25px 50px rgba(0,0,0,0.5);
        }
        .form-control {
            background: rgba(255, 255, 255, 0.1); border: 1px solid rgba(255, 255, 255, 0.2);
            color: white; border-radius: 10px;
        }
        .form-control:focus { background: rgba(255, 255, 255, 0.15); color: white; border-color: #0d6efd; box-shadow: none; }
    </style>
</head>
<body>

<div class="form-container">
    <h2 class="fw-bold text-warning mb-4">Edit Venue Details</h2>

    <form action="UpdateVenueServlet" method="POST">
        <%-- HIDDEN FIELD: We need this to tell the Servlet exactly WHICH venue to update! --%>
        <input type="hidden" name="venueId" value="<%= venueToEdit.getVenueId() %>">

        <div class="mb-3">
            <label class="form-label text-light opacity-75">Venue Name</label>
            <input type="text" name="name" class="form-control" value="<%= venueToEdit.getName() %>" required>
        </div>

        <div class="mb-3">
            <label class="form-label text-light opacity-75">Location</label>
            <input type="text" name="location" class="form-control" value="<%= venueToEdit.getLocation() %>" required>
        </div>

        <div class="mb-3">
            <label class="form-label text-light opacity-75">Max Capacity (Guests)</label>
            <input type="number" name="maxCapacity" class="form-control" value="<%= venueToEdit.getMaxCapacity() %>" required>
        </div>

        <div class="mb-4">
            <label class="form-label text-light opacity-75">Price Per Day (LKR)</label>
            <input type="number" step="0.01" name="pricePerDay" class="form-control" value="<%= venueToEdit.getPricePerDay() %>" required>
        </div>

        <button type="submit" class="btn btn-warning w-100 fw-bold mb-2">Save Changes</button>
        <a href="ViewVenuesServlet" class="btn btn-outline-light w-100">Cancel</a>
    </form>
</div>

</body>
</html>