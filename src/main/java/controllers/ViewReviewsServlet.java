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
import java.util.List;


@WebServlet("/ViewReviewsServlet")
public class ViewReviewsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Security: Ensure user is logged in
        HttpSession session = request.getSession();
        if (session.getAttribute("userRole") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // 1. Get the list of all reviews from the text file
        List<Review> allReviews = FileHandler.getAllReviews();

        // 2. Attach the list to the request so the JSP can see it
        request.setAttribute("reviewList", allReviews);

        // 3. Send the user to the view page
        request.getRequestDispatcher("viewReviews.jsp").forward(request, response);
    }
}