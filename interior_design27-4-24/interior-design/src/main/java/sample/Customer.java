package sample;

public class Customer {
	private byte[] profileimg;
	private String email;
	private String password;
    private String phone;
    private String address;
    private String profileImageText;
	public String getProfileImageText() {
		return profileImageText;
	}
	public void setProfileImageText(String profileImageText) {
		this.profileImageText = profileImageText;
	}
    public Customer() {
		super();
	}
	public Customer(byte[] profileimg, String email, String password, String phone, String address) {
		super();
		this.profileimg = profileimg;
		this.email = email;
		this.password = password;
		this.phone = phone;
		this.address = address;
	}
    
	public byte[] getProfileimg() {
		return profileimg;
	}
	public void setProfileimg(byte[] profileimg) {
		this.profileimg = profileimg;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}

}
