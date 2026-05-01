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
    <title>Add Vendor | DreamWedding</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            min-height: 100vh;
            background: linear-gradient(rgba(0, 0, 0, 0.75), rgba(0, 0, 0, 0.85)),
            url('https://images.unsplash.com/photo-1511285560929-80b456fea0bc?auto=format&fit=crop&w=1500&q=80') center/cover no-repeat fixed;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            padding: 20px;
        }
        .vendor-card { background: rgba(255, 255, 255, 0.05); backdrop-filter: blur(15px); border: 1px solid rgba(255, 255, 255, 0.1); border-radius: 20px; padding: 40px; width: 100%; max-width: 600px; box-shadow: 0 25px 50px rgba(0,0,0,0.5); color: white; }
        .form-control, .form-select { background: rgba(255, 255, 255, 0.08); border: 1px solid rgba(255, 255, 255, 0.2); color: white; border-radius: 10px; padding: 12px; }
        .form-control:focus, .form-select:focus { background: rgba(255, 255, 255, 0.15); color: white; border-color: #0dcaf0; box-shadow: 0 0 0 0.25rem rgba(13, 202, 240, 0.25); }
        .form-control::placeholder { color: rgba(255, 255, 255, 0.4); }
        option { background: #222; color: white; }
        .btn-info { background-color: #0dcaf0; border: none; color: #000; border-radius: 10px; padding: 12px; font-weight: bold; transition: 0.3s; }
        .btn-info:hover { background-color: #31d2f2; transform: translateY(-2px); box-shadow: 0 10px 20px rgba(13, 202, 240, 0.3); color: #000; }
    </style>
</head>
<body>
<div class="vendor-card">
    <div class="text-center mb-4">
        <h2 class="fw-bold text-info">Register Service Provider</h2>
        <p class="text-light opacity-75">Add a new photographer, caterer, or decorator.</p>
    </div>
    <form action="AddVendorServlet" method="POST">

        <div class="mb-3">
            <label class="form-label small ms-1 fw-bold text-light opacity-75">Vendor / Business Name</label>
            <input type="text" name="vName" class="form-control" placeholder="e.g., Studio Max Photography" required>
        </div>

        <div class="mb-3">
            <label class="form-label small ms-1 fw-bold text-light opacity-75">Vendor Email</label>
            <input type="email" name="vEmail" class="form-control" placeholder="contact@vendor.com" required>
        </div>

        <div class="mb-3">
            <label class="form-label small ms-1 fw-bold text-light opacity-75">Service Category</label>
            <select name="vType" class="form-select" required>
                <option value="" disabled selected>-- Select a Service --</option>
                <option value="Photography">Photography & Videography</option>
                <option value="Catering">Catering & Food</option>
                <option value="Decoration">Floral & Decoration</option>
                <option value="Music">Music & Entertainment</option>
            </select>
        </div>

        <div class="mb-5">
            <label class="form-label small ms-1 fw-bold text-light opacity-75">Base Rate (LKR)</label>
            <input type="number" name="vPrice" class="form-control" placeholder="e.g., 150000" required>
        </div>

        <button type="submit" class="btn btn-info w-100 mb-3 shadow">Save Vendor Details</button>
        <a href="dashboard.jsp" class="btn btn-outline-light w-100 py-2">Cancel & Return</a>
    </form>
</div>
</body>
</html>