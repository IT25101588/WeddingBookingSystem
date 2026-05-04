package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.Review;
import utils.FileHandler;
import java.io.IOException;

@WebServlet("/SubmitReviewServlet")
public class SubmitReviewServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Check who is logged in
        HttpSession session = request.getSession();
        String userEmail = (String) session.getAttribute("userEmail"); // Assuming you save email in session on login

        // Security check: If they somehow got here without logging in, kick them out
        if (userEmail == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // 2. Gather data from the form
        String reviewId = "REV" + System.currentTimeMillis();
        String targetId = request.getParameter("targetId");
        int rating = Integer.parseInt(request.getParameter("rating"));
        String comment = request.getParameter("comment");

        // 3. Create the Review Object (Instantiating our Encapsulated Model)
        Review newReview = new Review(reviewId, userEmail, targetId, rating, comment);

        // 4. Save it using FileHandler
        if (FileHandler.saveReview(newReview)) {
            // Success! Send them back to their dashboard with a success flag
            response.sendRedirect("userDashboard.jsp?reviewAdded=true");
        } else {
            // Failed. Send them back to the form with an error flag
            response.sendRedirect("submitReview.jsp?error=true");
        }
    }
}