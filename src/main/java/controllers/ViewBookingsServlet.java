package controllers;

import models.Booking;
import utils.FileHandler;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/ViewBookingsServlet")
public class ViewBookingsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Get the list of all reservations
        List<Booking> bookings = FileHandler.getAllBookings();

        // 2. Attach the list to the request
        request.setAttribute("bookingList", bookings);

        // 3. Forward the user to the webpage
        request.getRequestDispatcher("viewBookings.jsp").forward(request, response);
    }
}