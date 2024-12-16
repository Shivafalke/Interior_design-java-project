package sample;

public class Vendor1 {
	
	private String name;
	public Vendor1() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public byte[] getProfileimg() {
		return profileimg;
	}
	public void setProfileimg(byte[] profileimg) {
		this.profileimg = profileimg;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	private String category;
	private String city;
	private byte[] profileimg;
	private int id;
	
}
