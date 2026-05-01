package controllers;

import models.Vendor;
import utils.FileHandler;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/AddVendorServlet")
public class AddVendorServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Gather data from the addVendor.jsp form
        String id = "VND" + System.currentTimeMillis();
        String name = request.getParameter("vName");
        String type = request.getParameter("vType");
        double price = Double.parseDouble(request.getParameter("vPrice"));
        String email = request.getParameter("vEmail");

        // 2. Create the Vendor object (OOP Concept: Instantiation)
        Vendor newVendor = new Vendor(id, name, email, "vendor123", type, price);

        // 3. Save it to the text file
        if (FileHandler.saveVendor(newVendor)) {
            // Success! Send them to the View Servlet to see the updated table
            response.sendRedirect("ViewVendorsServlet");
        } else {
            // Failed. Send them back to the form with an error.
            response.sendRedirect("addVendor.jsp?error=true");
        }
    }
}