package controllers;

import models.Couple;
import utils.FileHandler;

// You MUST import these specific Jakarta classes, not the old 'javax' ones,
// because you are using Tomcat 11.
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

// This annotation maps the URL from the frontend form to this specific Java class
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Generate a simple unique ID
        String id = "CPL" + System.currentTimeMillis();

        // 2. Retrieve the data submitted by the user in the HTML form
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String partner1 = request.getParameter("partner1");
        String partner2 = request.getParameter("partner2");
        String date = request.getParameter("weddingDate");

        // Combine names for the base User 'name' field
        String combinedName = partner1 + " & " + partner2;

        // 3. Create the Couple object (Applying OOP)
        Couple newCouple = new Couple(id, combinedName, email, password, partner1, partner2, date);

        // 4. Save to the text file using our FileHandler (The Create Operation)
        boolean isSaved = FileHandler.saveUser(newCouple);

        // 5. Redirect the user based on success or failure
        if (isSaved) {
            // Redirect to a success page or login page
            response.sendRedirect("login.jsp?status=success");
        } else {
            // Redirect back to registration with an error message
            response.sendRedirect("register.jsp?error=true");
        }
    }
}
