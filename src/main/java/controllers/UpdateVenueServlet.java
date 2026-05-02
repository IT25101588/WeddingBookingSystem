package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import models.Venue;
import utils.FileHandler;

@WebServlet("/UpdateVenueServlet")
public class UpdateVenueServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Security: Admin Only
        String role = (String) request.getSession().getAttribute("userRole");
        if (role == null || !role.equalsIgnoreCase("Admin")) {
            response.sendRedirect("login.jsp");
            return;
        }

        // 1. Grab the updated data from the form
        String id = request.getParameter("venueId");
        String name = request.getParameter("name");
        String location = request.getParameter("location");
        int maxCapacity = Integer.parseInt(request.getParameter("maxCapacity"));
        double pricePerDay = Double.parseDouble(request.getParameter("pricePerDay"));

        // 2. Find the original venue in our database
        List<Venue> allVenues = FileHandler.getAllVenues();
        Venue venueToUpdate = null;

        for (Venue v : allVenues) {
            if (v.getVenueId().equals(id)) { // CHANGED THIS LINE
                venueToUpdate = v;
                break;
            }
        }

        // 3. Update the fields and save it back to the text file!
        if (venueToUpdate != null) {
            // Using the setters to update the information safely
            venueToUpdate.setName(name); // From the inherited User class
            venueToUpdate.setLocation(location);
            venueToUpdate.setMaxCapacity(maxCapacity);
            venueToUpdate.setPricePerDay(pricePerDay);

            FileHandler.updateVenue(venueToUpdate);
        }

        // 4. Send them back to the table page to see their edits
        response.sendRedirect("ViewVenuesServlet");
    }
}