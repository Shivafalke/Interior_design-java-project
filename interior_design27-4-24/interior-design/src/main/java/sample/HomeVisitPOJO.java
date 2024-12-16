package sample;

public class HomeVisitPOJO {
	
	private String name;
    private String address;
    private String email;
    private String contact;
    private String interest;

    public HomeVisitPOJO(String name, String address, String email, String contact, String interest) {
        this.name = name;
        this.address = address;
        this.email = email;
        this.contact = contact;
        this.interest = interest;
    }

    public String getName() {
        return name;
    }

    public String getAddress() {
        return address;
    }

    public String getEmail() {
        return email;
    }

    public String getContact() {
        return contact;
    }

    public String getInterest() {
        return interest;
    }

}
