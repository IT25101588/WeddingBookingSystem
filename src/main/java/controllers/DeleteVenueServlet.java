package controllers;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/DeleteVenueServlet")
public class DeleteVenueServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Security: Admin Only
        String role = (String) request.getSession().getAttribute("userRole");
        if (role != null && role.equalsIgnoreCase("Admin")) {
            utils.FileHandler.deleteVenue(request.getParameter("venueId"));
        }
        response.sendRedirect("ViewVenuesServlet?deleted=true");
    }
}