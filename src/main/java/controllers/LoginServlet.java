package controllers;

import utils.FileHandler;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession; // FIX: Added the missing Session import!
import java.io.IOException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // 1. Check if the password is correct using your EXISTING code
        boolean isValid = FileHandler.validateUser(email, password);

       if (isValid) {
            // 2. We know the password is right. Now, are they an Admin or a Couple?
           String role = FileHandler.getUserRole(email);

            // 3. Create a session to remember them
            HttpSession session = request.getSession();
            session.setAttribute("userEmail", email);
            session.setAttribute("userRole", role);

            // 4. Redirect them to the correct dashboard!
            if (role != null && role.equalsIgnoreCase("Admin")) {
                response.sendRedirect("dashboard.jsp");
            } else {
                response.sendRedirect("userDashboard.jsp");
            }
        } else {
            // Wrong password
            response.sendRedirect("login.jsp?error=true");
        }
    }
}
