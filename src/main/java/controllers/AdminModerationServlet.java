package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/AdminModerationServlet")
public class AdminModerationServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // SECURITY: Admins Only
        String role = (String) request.getSession().getAttribute("userRole");
        if (role == null || !role.equalsIgnoreCase("Admin")) {
            response.sendRedirect("login.jsp");
            return;
        }

        request.setAttribute("reviewList", utils.FileHandler.getAllReviews());
        request.getRequestDispatcher("adminModeration.jsp").forward(request, response);
    }
}