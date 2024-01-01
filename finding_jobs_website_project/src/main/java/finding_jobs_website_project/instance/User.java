package finding_jobs_website_project.instance;

import java.util.Arrays;

public class User {
	private int id;
	private String address;
	private String description;
	private String email;
	private String fullName;
	private byte[] image;
	private String password;
	private String phoneNumber;
	private int status;
	private int role_id;
	private byte[] cv;
	public User(int id, String address, String description, String email, String fullName, byte[] image,
			String password, String phoneNumber, int status, int role_id, byte[] cv) {
		super();
		this.id = id;
		this.address = address;
		this.description = description;
		this.email = email;
		this.fullName = fullName;
		if (image != null) {
			this.image = Arrays.copyOf(image, image.length);

		}
		this.password = password;
		this.phoneNumber = phoneNumber;
		this.status = status;
		this.role_id = role_id;
		this.cv = cv;
	}
	public User(String email, String fullName, String password, int status, int role_id) {
		super();
		this.email = email;
		this.fullName = fullName;
		this.password = password;
		this.status = status;
		this.role_id = role_id;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public byte[] getImage() {
		return image;
	}
	public void setImage(byte[] image) {
		this.image = image;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getRole_id() {
		return role_id;
	}
	public void setRole_id(int role_id) {
		this.role_id = role_id;
	}
	public byte[] getCv() {
		return cv;
	}
	public void setCv(byte[] cv) {
		this.cv = cv;
	}
	
	
	
	
}
