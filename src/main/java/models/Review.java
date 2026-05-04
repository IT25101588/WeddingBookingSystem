package models;

public class Review {
    private String reviewId;
    private String userEmail; // The couple who wrote the review
    private String targetId;  // The ID of the Vendor or Venue being reviewed
    private int rating;       // 1 to 5 stars
    private String comment;

    // Constructor
    public Review(String reviewId, String userEmail, String targetId, int rating, String comment) {
        this.reviewId = reviewId;
        this.userEmail = userEmail;
        this.targetId = targetId;
        this.rating = rating;

        // Remove any commas from the comment so it doesn't break our CSV text file!
        this.comment = comment.replace(",", " ");
    }

    // Getters and Setters (Encapsulation Requirement)
    public String getReviewId() { return reviewId; }
    public void setReviewId(String reviewId) { this.reviewId = reviewId; }

    public String getUserEmail() { return userEmail; }
    public void setUserEmail(String userEmail) { this.userEmail = userEmail; }

    public String getTargetId() { return targetId; }
    public void setTargetId(String targetId) { this.targetId = targetId; }

    public int getRating() { return rating; }
    public void setRating(int rating) { this.rating = rating; }

    public String getComment() { return comment; }
    public void setComment(String comment) { this.comment = comment.replace(",", " "); }

    // Prepares the data to be safely saved in our text file
    public String toFileString() {
        return reviewId + "," + userEmail + "," + targetId + "," + rating + "," + comment;
    }
}