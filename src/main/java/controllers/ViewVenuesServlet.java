package controllers;

import models.Venue;
import utils.FileHandler;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/ViewVenuesServlet")
public class ViewVenuesServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Get the list of venues from our universal text file
        List<Venue> venues = FileHandler.getAllVenues();

        // 2. Attach the list to the request so the JSP can see it
        request.setAttribute("venueList", venues);

        // 3. Forward the user to the webpage
        request.getRequestDispatcher("viewVenues.jsp").forward(request, response);
    }
}
