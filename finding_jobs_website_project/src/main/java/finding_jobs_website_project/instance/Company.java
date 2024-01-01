package finding_jobs_website_project.instance;

public class Company {
	private int id;
	private String address;
	private String description;
	private String email;
	private byte[] logo;
	private String nameCompany;
	private String phoneNumber;
	private int status;
	private int user_id;
	public Company(int id, String address, String description, String email, byte[] logo, String nameCompany,
			String phoneNumber, int status, int user_id) {
		super();
		this.id = id;
		this.address = address;
		this.description = description;
		this.email = email;
		this.logo = logo;
		this.nameCompany = nameCompany;
		this.phoneNumber = phoneNumber;
		this.status = status;
		this.user_id = user_id;
	}
	public Company(String address, String description, String email, String nameCompany, String phoneNumber,
			int status, int user_id) {
		super();
		this.address = address;
		this.description = description;
		this.email = email;
		this.nameCompany = nameCompany;
		this.phoneNumber = phoneNumber;
		this.status = status;
		this.user_id = user_id;
	}
	
	
	
	public Company(String address, String description, String email, byte[] logo, String nameCompany,
			String phoneNumber, int status, int user_id) {
		super();
		this.address = address;
		this.description = description;
		this.email = email;
		this.logo = logo;
		this.nameCompany = nameCompany;
		this.phoneNumber = phoneNumber;
		this.status = status;
		this.user_id = user_id;
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
	public byte[] getLogo() {
		return logo;
	}
	public void setLogo(byte[] logo) {
		this.logo = logo;
	}
	public String getNameCompany() {
		return nameCompany;
	}
	public void setNameCompany(String nameCompany) {
		this.nameCompany = nameCompany;
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
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	
	
	
	
	
	
}
