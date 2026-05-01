package models;

// Member 2: Demonstrating Inheritance
public class Vendor extends User {
    private String serviceType; // e.g., Photography, Catering, Music
    private double basePrice;

    public Vendor(String id, String name, String email, String password, String serviceType, double basePrice) {
        // 'super' passes common data to the User parent class
        super(id, name, email, password, "VENDOR");
        this.serviceType = serviceType;
        this.basePrice = basePrice;
    }

    // Getters and Setters (Encapsulation)
    public String getServiceType() { return serviceType; }
    public void setServiceType(String serviceType) { this.serviceType = serviceType; }

    public double getBasePrice() { return basePrice; }
    public void setBasePrice(double basePrice) { this.basePrice = basePrice; }

    @Override
    public String toFileString() {
        // Polymorphism: Custom format for Vendor data in the text file
        return getId() + "," + getName() + "," + getEmail() + "," + getPassword() + "," +
                getRole() + "," + serviceType + "," + basePrice;
    }
}