package controllers;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/DeleteVendorServlet")
public class DeleteVendorServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Security: Admin Only
        String role = (String) request.getSession().getAttribute("userRole");
        if (role != null && role.equalsIgnoreCase("Admin")) {
            utils.FileHandler.deleteVendor(request.getParameter("vendorId"));
        }
        response.sendRedirect("ViewVendorsServlet?deleted=true");
    }
}