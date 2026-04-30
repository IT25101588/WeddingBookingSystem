package utils;

import models.Booking;
import models.Review;
import models.User;
import models.Vendor;
import models.Venue;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class FileHandler {

    // ==========================================
    // SYSTEM FILE PATHS
    // ==========================================
    private static final String BASE_PATH = "C:\\WeddingData\\";
    private static final String USER_FILE = BASE_PATH + "users.txt";
    private static final String VENDOR_FILE = BASE_PATH + "vendors.txt";
    private static final String VENUE_FILE = BASE_PATH + "venues.txt";
    private static final String BOOKING_FILE = BASE_PATH + "bookings.txt";
    private static final String REVIEW_FILE = BASE_PATH + "reviews.txt";

    // ==========================================
    // 1. USER AUTHENTICATION & MANAGEMENT
    // ==========================================

    /** Saves any User object (Couple/Admin) to the text file. */
    public static boolean saveUser(User user) {
        try (FileWriter fw = new FileWriter(USER_FILE, true);
             PrintWriter pw = new PrintWriter(fw)) {
            pw.println(user.toFileString());
            return true;
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
    }

    /** Validates login credentials from the text file. */
    public static boolean validateUser(String email, String password) {
        File file = new File(USER_FILE);
        if (!file.exists()) return false;

        try (BufferedReader br = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] data = line.split(",");
                if (data.length >= 4 && data[2].equalsIgnoreCase(email) && data[3].equals(password)) {
                    return true;
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return false;
    }

    /** Retrieves the role (Admin/Couple) based on the email. */
    public static String getUserRole(String email) {
        try (BufferedReader br = new BufferedReader(new FileReader(USER_FILE))) {
            String line;
            while ((line = br.readLine()) != null) {
                if (line.contains(email)) {
                    if (line.toLowerCase().contains("admin")) return "Admin";
                    else return "Couple";
                }
            }
        } catch (Exception e) {
            System.out.println("Error finding role: " + e.getMessage());
        }
        return "Couple";
    }

    // ==========================================
    // 2. VENDOR MANAGEMENT (Member 2)
    // ==========================================

    public static boolean saveVendor(Vendor vendor) {
        try (FileWriter fw = new FileWriter(VENDOR_FILE, true);
             PrintWriter pw = new PrintWriter(fw)) {
            pw.println(vendor.toFileString());
            return true;
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static List<Vendor> getAllVendors() {
        List<Vendor> vendorList = new ArrayList<>();
        File file = new File(VENDOR_FILE);
        if (!file.exists()) return vendorList;

        try (BufferedReader br = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] data = line.split(",");
                if (data.length >= 7) {
                    Vendor v = new Vendor(data[0], data[1], data[2], data[3], data[5], Double.parseDouble(data[6]));
                    vendorList.add(v);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return vendorList;
    }

    public static boolean updateVendor(Vendor updatedVendor) {
        List<Vendor> vendors = getAllVendors();
        boolean isUpdated = false;
        try (PrintWriter pw = new PrintWriter(new FileWriter(VENDOR_FILE, false))) {
            for (Vendor v : vendors) {
                if (v.getId().equals(updatedVendor.getId())) {
                    pw.println(updatedVendor.toFileString());
                    isUpdated = true;
                } else {
                    pw.println(v.toFileString());
                }
            }
            return isUpdated;
        } catch (IOException e) { return false; }
    }

    public static boolean deleteVendor(String vendorId) {
        List<Vendor> vendors = getAllVendors();
        boolean isDeleted = false;
        try (PrintWriter pw = new PrintWriter(new FileWriter(VENDOR_FILE, false))) {
            for (Vendor v : vendors) {
                if (v.getId().equals(vendorId)) isDeleted = true;
                else pw.println(v.toFileString());
            }
            return isDeleted;
        } catch (IOException e) { return false; }
    }

    // ==========================================
    // 3. VENUE MANAGEMENT (Member 3)
    // ==========================================

    public static boolean saveVenue(Venue venue) {
        try (FileWriter fw = new FileWriter(VENUE_FILE, true);
             PrintWriter pw = new PrintWriter(fw)) {
            pw.println(venue.toFileString());
            return true;
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static List<Venue> getAllVenues() {
        List<Venue> venueList = new ArrayList<>();
        File file = new File(VENUE_FILE);
        if (!file.exists()) return venueList;

        try (BufferedReader br = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] data = line.split(",");
                if (data.length >= 5) {
                    Venue v = new Venue(data[0], data[1], data[2], Integer.parseInt(data[3]), Double.parseDouble(data[4]));
                    venueList.add(v);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return venueList;
    }

    public static boolean updateVenue(Venue updatedVenue) {
        List<Venue> venues = getAllVenues();
        boolean isUpdated = false;
        try (PrintWriter pw = new PrintWriter(new FileWriter(VENUE_FILE, false))) {
            for (Venue v : venues) {
                if (v.getVenueId().equals(updatedVenue.getVenueId())) {
                    pw.println(updatedVenue.toFileString());
                    isUpdated = true;
                } else {
                    pw.println(v.toFileString());
                }
            }
            return isUpdated;
        } catch (IOException e) { return false; }
    }

    public static boolean deleteVenue(String venueId) {
        List<Venue> venues = getAllVenues();
        boolean isDeleted = false;
        try (PrintWriter pw = new PrintWriter(new FileWriter(VENUE_FILE, false))) {
            for (Venue v : venues) {
                if (v.getVenueId().equals(venueId)) isDeleted = true;
                else pw.println(v.toFileString());
            }
            return isDeleted;
        } catch (IOException e) { return false; }
    }

    // ==========================================
    // 4. BOOKING MANAGEMENT (Member 4)
    // ==========================================

    public static boolean saveBooking(Booking booking) {
        try (FileWriter fw = new FileWriter(BOOKING_FILE, true);
             PrintWriter pw = new PrintWriter(fw)) {
            pw.println(booking.toFileString());
            return true;
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static List<Booking> getAllBookings() {
        List<Booking> bookingList = new ArrayList<>();
        File file = new File(BOOKING_FILE);
        if (!file.exists()) return bookingList;

        try (BufferedReader br = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] data = line.split(",");
                if (data.length >= 6) {
                    Booking b = new Booking(data[0], data[1], data[2], data[3], data[4], data[5]);
                    bookingList.add(b);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return bookingList;
    }

    // ==========================================
    // 5. REVIEW & MODERATION (Member 6)
    // ==========================================

    public static boolean saveReview(Review review) {
        try (FileWriter fw = new FileWriter(REVIEW_FILE, true);
             PrintWriter pw = new PrintWriter(fw)) {
            pw.println(review.toFileString());
            return true;
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static List<Review> getAllReviews() {
        List<Review> reviews = new ArrayList<>();
        try (BufferedReader br = new BufferedReader(new FileReader(REVIEW_FILE))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] data = line.split(",");
                if (data.length == 5) {
                    Review review = new Review(data[0], data[1], data[2], Integer.parseInt(data[3]), data[4]);
                    reviews.add(review);
                }
            }
        } catch (IOException e) {
            System.out.println("No reviews file found yet. Returning empty list.");
        }
        return reviews;
    }

    public static boolean deleteReview(String reviewId) {
        List<Review> reviews = getAllReviews();
        boolean isDeleted = false;
        try (FileWriter fw = new FileWriter(REVIEW_FILE, false);
             PrintWriter pw = new PrintWriter(fw)) {

            for (Review r : reviews) {
                if (r.getReviewId().equals(reviewId)) {
                    isDeleted = true; // Skip writing this one
                } else {
                    pw.println(r.toFileString());
                }
            }
            return isDeleted;
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
    }
}