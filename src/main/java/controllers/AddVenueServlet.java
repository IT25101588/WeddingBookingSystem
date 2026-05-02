package controllers;

import models.Venue;
import utils.FileHandler;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/AddVenueServlet")
public class AddVenueServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Gather data from the form
        String id = "LOC" + System.currentTimeMillis();
        String name = request.getParameter("vName");
        String location = request.getParameter("vLocation");
        int capacity = Integer.parseInt(request.getParameter("vCapacity"));
        double price = Double.parseDouble(request.getParameter("vPrice"));

        // 2. Create the Venue object
        Venue newVenue = new Venue(id, name, location, capacity, price);

        // 3. Save it to the text file
        if (FileHandler.saveVenue(newVenue)) {
            // Success! Send them to the View Venues table to see it
            response.sendRedirect("ViewVenuesServlet");
        } else {
            // Failed. Send them back to the form with an error.
            response.sendRedirect("addVenue.jsp?error=true");
        }
    }
}