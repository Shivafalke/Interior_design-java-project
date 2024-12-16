package sample;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

public class Vendor {
	private byte[] profileimg;
	private String email;
	private String password;
    private String phone;
    private String address;
    private String city;
	
	public Vendor() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Vendor(byte[] profileimg, String profileImageText, String email, String password, String phone,
			String address,String city) {
		super();
		this.profileimg = profileimg;
		this.profileImageText = profileImageText;
		this.email = email;
		this.password = password;
		this.phone = phone;
		this.address = address;
		this.city = city;
	}

	public byte[] getProfileimg() throws IOException {
		if(profileimg != null) {
			return profileimg;
		}
		else {
			return getDefaultProfileImage();
		}
	}
	
	private byte[] getDefaultProfileImage() throws IOException {
	    // Replace the following line with your logic to retrieve the default image
	    // and convert it to a byte array
	    // For example:
		System.out.println("getDefaultProfileImage");
	     FileInputStream fis = null;
		try {
			
			
			fis = new FileInputStream("blank-profile-picture-973460_640.png");
			byte[] defaultImage = fis.readAllBytes();
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	     
			
		
			// TODO Auto-generated catch block
		
	    
	    // Return the default image byte array
	    // return defaultImage;
	    
	    // If you don't have a default image, you can return null
	    return null;
	}
	
	public void setProfileimg(byte[] profileImageBytes) {
		this.profileimg = profileImageBytes;
	}
    private String profileImageText;
	public String getProfileImageText() {
		return profileImageText;
	}
	public void setProfileImageText(String profileImageText) {
		this.profileImageText = profileImageText;
	}
	
    public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
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
