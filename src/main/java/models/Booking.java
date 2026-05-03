package models;

public class Booking {
    private String bookingId;
    private String userEmail;  // Links to the Couple
    private String venueId;    // Links to the Venue
    private String vendorId;   // Links to the Vendor
    private String eventDate;
    private String status;     // e.g., "Pending", "Confirmed"

    public Booking(String bookingId, String userEmail, String venueId, String vendorId, String eventDate, String status) {
        this.bookingId = bookingId;
        this.userEmail = userEmail;
        this.venueId = venueId;
        this.vendorId = vendorId;
        this.eventDate = eventDate;
        this.status = status;
    }

    // Getters and Setters (Encapsulation)
    public String getBookingId() { return bookingId; }
    public String getUserEmail() { return userEmail; }
    public String getVenueId() { return venueId; }
    public String getVendorId() { return vendorId; }
    public String getEventDate() { return eventDate; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    // Format for text file storage
    public String toFileString() {
        return bookingId + "," + userEmail + "," + venueId + "," + vendorId + "," + eventDate + "," + status;
    }
}
