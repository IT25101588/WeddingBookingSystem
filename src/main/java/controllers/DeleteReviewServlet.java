package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/DeleteReviewServlet")
public class DeleteReviewServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // SECURITY: Admins Only
        String role = (String) request.getSession().getAttribute("userRole");
        if (role != null && role.equalsIgnoreCase("Admin")) {
            String reviewId = request.getParameter("reviewId");
            utils.FileHandler.deleteReview(reviewId);
        }
        // Send them right back to the moderation page to see the updated list
        response.sendRedirect("AdminModerationServlet?deleted=true");
    }
}