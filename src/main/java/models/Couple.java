package models;

public class Couple extends User {
    private String partner1Name;
    private String partner2Name;
    private String weddingDate;

    public Couple(String id, String name, String email, String password,
                  String partner1Name, String partner2Name, String weddingDate) {
        // The 'super' keyword calls the parent User class constructor
        super(id, name, email, password, "COUPLE");
        this.partner1Name = partner1Name;
        this.partner2Name = partner2Name;
        this.weddingDate = weddingDate;
    }

    // Getters
    public String getPartner1Name() { return partner1Name; }
    public String getPartner2Name() { return partner2Name; }
    public String getWeddingDate() { return weddingDate; }

    // Setters
    public void setPartner1Name(String partner1Name) { this.partner1Name = partner1Name; }
    public void setPartner2Name(String partner2Name) { this.partner2Name = partner2Name; }
    public void setWeddingDate(String weddingDate) { this.weddingDate = weddingDate; }

    // Implementing the abstract method for File I/O
    @Override
    public String toFileString() {
        // Comma-separated format for easy reading/writing to users.txt
        return getId() + "," + getName() + "," + getEmail() + "," + getPassword() + "," +
                getRole() + "," + partner1Name + "," + partner2Name + "," + weddingDate;
    }
}
