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


