<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register | DreamWedding</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            min-height: 100vh;
            background: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.8)),
            url('https://images.unsplash.com/photo-1519225421980-715cb0215aed?auto=format&fit=crop&w=1500&q=80') center/cover no-repeat fixed;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            padding: 20px;
        }

        .register-card {
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(15px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 20px;
            padding: 40px;
            width: 100%;
            max-width: 500px;
            box-shadow: 0 25px 50px rgba(0,0,0,0.5);
            color: white;
        }

        .form-control, .form-select {
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            color: white;
            border-radius: 10px;
            padding: 10px;
        }

        .form-control:focus, .form-select:focus {
            background: rgba(255, 255, 255, 0.15);
            color: white;
            border-color: #0d6efd;
            box-shadow: none;
        }

        /* Styling the dropdown options for dark mode */
        option { background: #333; color: white; }

        .form-control::placeholder {
            color: rgba(255, 255, 255, 0.4);
        }

        .btn-primary {
            border-radius: 10px;
            padding: 12px;
            font-weight: 600;
            margin-top: 15px;
            transition: 0.3s;
        }

        .btn-primary:hover {
            transform: scale(1.02);
        }
    </style>
</head>
<body>

<div class="register-card">
    <div class="text-center mb-4">
        <h2 class="fw-bold">Join the Magic</h2>
        <p class="text-light opacity-75">Start planning your forever today 💍</p>
    </div>

    <form action="RegisterServlet" method="POST">
        <div class="row">
            <div class="col-md-12 mb-3">
                <label class="form-label small">Full Name</label>
                <input type="text" name="name" class="form-control" placeholder="John & Jane Doe" required>
            </div>
        </div>

        <div class="mb-3">
            <label class="form-label small">Email Address</label>
            <input type="email" name="email" class="form-control" placeholder="couple@example.com" required>
        </div>

        <div class="mb-3">
            <label class="form-label small">Password</label>
            <input type="password" name="password" class="form-control" placeholder="Create a password" required>
        </div>

        <div class="mb-4">
            <label class="form-label small">Account Type</label>
            <select name="role" class="form-select" required>
                <option value="Couple">Couple (User)</option>
                <option value="Admin">Administrator</option>
            </select>
        </div>

        <button type="submit" class="btn btn-primary w-100 shadow-lg">Create Account</button>
    </form>

    <div class="mt-4 text-center small">
        <p class="mb-0 text-light opacity-50">Already have an account?</p>
        <a href="login.jsp" class="text-white text-decoration-none fw-bold">Sign In Here</a>
    </div>

    <div class="mt-3 text-center">
        <a href="index.jsp" class="text-light opacity-50 text-decoration-none small">← Back to Home</a>
    </div>
</div>
<script src="heart-cursor.js"></script>
</body>
</html>