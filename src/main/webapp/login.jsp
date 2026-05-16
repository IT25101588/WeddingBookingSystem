<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login | DreamWedding</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            height: 100vh;
            background: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.8)),
            url('https://images.unsplash.com/photo-1511795409834-ef04bbd61622?auto=format&fit=crop&w=1500&q=80') center/cover no-repeat;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        /* The Glass-morphism effect */
        .login-card {
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(15px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 20px;
            padding: 40px;
            width: 100%;
            max-width: 400px;
            box-shadow: 0 25px 50px rgba(0,0,0,0.5);
            color: white;
        }

        .form-control {
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            color: white;
            border-radius: 10px;
            padding: 12px;
        }

        .form-control:focus {
            background: rgba(255, 255, 255, 0.15);
            color: white;
            border-color: #0d6efd;
            box-shadow: 0 0 0 0.25 mil rem rgba(13, 110, 253, 0.25);
        }

        .form-control::placeholder {
            color: rgba(255, 255, 255, 0.5);
        }

        .btn-primary {
            border-radius: 10px;
            padding: 12px;
            font-weight: 600;
            letter-spacing: 1px;
            text-transform: uppercase;
            margin-top: 10px;
        }
    </style>
</head>
<body>

<div class="login-card text-center">
    <h2 class="mb-2 fw-bold">Welcome Back</h2>
    <p class="text-light opacity-75 mb-4">Login to manage the magic 💍</p>

    <% if ("true".equals(request.getParameter("error"))) { %>
    <div class="alert alert-danger py-2 small border-0" style="background: rgba(220, 53, 69, 0.2); color: #ff8e98;">
        Invalid email or password.
    </div>
    <% } %>

    <form action="LoginServlet" method="POST">
        <div class="mb-3 text-start">
            <label class="form-label small ms-1">Email Address</label>
            <input type="email" name="email" class="form-control" placeholder="admin@dreamwedding.com" required>
        </div>

        <div class="mb-4 text-start">
            <label class="form-label small ms-1">Password</label>
            <input type="password" name="password" class="form-control" placeholder="••••••••" required>
        </div>

        <button type="submit" class="btn btn-primary w-100 shadow">Sign In</button>
    </form>

    <div class="mt-4 small">
        <p class="mb-0 text-light opacity-50">Don't have an account?</p>
        <a href="register.jsp" class="text-white text-decoration-none fw-bold">Register a Couple</a>
    </div>

    <div class="mt-3">
        <a href="index.jsp" class="text-light opacity-50 text-decoration-none small">← Back to Home</a>
    </div>
</div>
<script src="heart-cursor.js"></script>
</body>
</html>