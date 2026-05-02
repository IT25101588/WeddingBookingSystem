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