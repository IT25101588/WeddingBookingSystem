package controllers;

import models.Vendor;
import utils.FileHandler;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/ViewVendorsServlet")
public class ViewVendorsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Get the list of vendors from our text file
        List<Vendor> vendors = FileHandler.getAllVendors();

        // 2. Attach the list to the request so the JSP can see it
        request.setAttribute("vendorList", vendors);

        // 3. Forward the user to the webpage
        request.getRequestDispatcher("viewVendors.jsp").forward(request, response);
    }
}