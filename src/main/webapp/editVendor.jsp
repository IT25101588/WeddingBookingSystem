<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="models.Vendor" %>
<%@ page import="utils.FileHandler" %>
<%
    // SECURITY: Admins Only
    String role = (String) session.getAttribute("userRole");
    if (role == null || !role.equalsIgnoreCase("Admin")) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Grab the ID from the URL (e.g., editVendor.jsp?id=VND123...)
    String vendorId = request.getParameter("id");
    Vendor vendorToEdit = null;

    if (vendorId != null) {
        List<Vendor> vendors = FileHandler.getAllVendors();
        for (Vendor v : vendors) {
            // Because Vendor inherits from User, we use getId() here!
            if (v.getId().equals(vendorId)) {
                vendorToEdit = v;
                break;
            }
        }
    }

    // If the ID is invalid or missing, bounce them back to the list
    if (vendorToEdit == null) {
        response.sendRedirect("ViewVendorsServlet");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Vendor | DreamWedding Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            min-height: 100vh;
            background: linear-gradient(rgba(0, 0, 0, 0.8), rgba(0, 0, 0, 0.9)),
            url('https://images.unsplash.com/photo-1519225421980-715cb0215aed?auto=format&fit=crop&w=2000&q=80') center/cover fixed;
            color: white; padding: 40px 20px; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .form-container {
            background: rgba(255, 255, 255, 0.05); backdrop-filter: blur(15px);
            border: 1px solid rgba(255, 255, 255, 0.1); border-radius: 20px;
            padding: 40px; max-width: 600px; margin: 0 auto; box-shadow: 0 25px 50px rgba(0,0,0,0.5);
        }
        .form-control, .form-select {
            background: rgba(255, 255, 255, 0.1); border: 1px solid rgba(255, 255, 255, 0.2);
            color: white; border-radius: 10px;
        }
        .form-control:focus, .form-select:focus { background: rgba(255, 255, 255, 0.15); color: white; border-color: #0d6efd; box-shadow: none; }
        .form-select option { color: black; }
    </style>
</head>
<body>

<div class="form-container">
    <h2 class="fw-bold text-info mb-4">Edit Vendor Details</h2>

    <form action="UpdateVendorServlet" method="POST">
        <%-- HIDDEN FIELD: Tells the Servlet WHICH vendor to update --%>
        <input type="hidden" name="vendorId" value="<%= vendorToEdit.getId() %>">

        <div class="mb-3">
            <label class="form-label text-light opacity-75">Vendor / Business Name</label>
            <input type="text" name="name" class="form-control" value="<%= vendorToEdit.getName() %>" required>
        </div>

        <div class="mb-3">
            <label class="form-label text-light opacity-75">Service Category</label>
            <select name="serviceType" class="form-select" required>
                <option value="Photography" <%= vendorToEdit.getServiceType().equals("Photography") ? "selected" : "" %>>Photography</option>
                <option value="Catering" <%= vendorToEdit.getServiceType().equals("Catering") ? "selected" : "" %>>Catering</option>
                <option value="Decoration" <%= vendorToEdit.getServiceType().equals("Decoration") ? "selected" : "" %>>Decoration</option>
                <option value="Music/DJ" <%= vendorToEdit.getServiceType().equals("Music/DJ") ? "selected" : "" %>>Music/DJ</option>
            </select>
        </div>

        <div class="mb-4">
            <label class="form-label text-light opacity-75">Base Rate (LKR)</label>
            <input type="number" step="0.01" name="basePrice" class="form-control" value="<%= vendorToEdit.getBasePrice() %>" required>
        </div>

        <button type="submit" class="btn btn-info w-100 fw-bold mb-2">Save Vendor Changes</button>
        <a href="ViewVendorsServlet" class="btn btn-outline-light w-100">Cancel</a>
    </form>
</div>

</body>
</html>