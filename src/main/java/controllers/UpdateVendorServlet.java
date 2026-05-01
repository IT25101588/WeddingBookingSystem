package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import models.Vendor;
import utils.FileHandler;

@WebServlet("/UpdateVendorServlet")
public class UpdateVendorServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Security: Admin Only
        String role = (String) request.getSession().getAttribute("userRole");
        if (role == null || !role.equalsIgnoreCase("Admin")) {
            response.sendRedirect("login.jsp");
            return;
        }

        // 1. Grab the updated data from the form
        String id = request.getParameter("vendorId");
        String name = request.getParameter("name");
        String serviceType = request.getParameter("serviceType");
        double basePrice = Double.parseDouble(request.getParameter("basePrice"));

        // 2. Find the original vendor
        List<Vendor> allVendors = FileHandler.getAllVendors();
        Vendor vendorToUpdate = null;

        for (Vendor v : allVendors) {
            if (v.getId().equals(id)) {
                vendorToUpdate = v;
                break;
            }
        }

        // 3. Update the fields and save it back to the text file!
        if (vendorToUpdate != null) {
            vendorToUpdate.setName(name); // *See Pro-Tip below!
            vendorToUpdate.setServiceType(serviceType);
            vendorToUpdate.setBasePrice(basePrice);

            FileHandler.updateVendor(vendorToUpdate);
        }

        // 4. Send them back to the table page to see their edits
        response.sendRedirect("ViewVendorsServlet");
    }
}