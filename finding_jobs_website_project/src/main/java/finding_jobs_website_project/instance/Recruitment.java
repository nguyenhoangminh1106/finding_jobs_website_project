package finding_jobs_website_project.instance;

public class Recruitment {
	private int id;
	private String address;
	private String created_at;
	private String description;
	private String experience;
	private int quantity;
	private String rank;
	private String salary;
	private int status;
	private String title;
	private String type;
	private int view;
	private int category_id;
	private int company_id;
	private String deadline;
	
	
	
	public Recruitment() {
		super();
	}
	public Recruitment(int id, String address, String created_at, String description, String experience, int quantity,
			String rank, String salary, int status, String title, String type, int view, int category_id,
			int company_id, String deadline) {
		super();
		this.id = id;
		this.address = address;
		this.created_at = created_at;
		this.description = description;
		this.experience = experience;
		this.quantity = quantity;
		this.rank = rank;
		this.salary = salary;
		this.status = status;
		this.title = title;
		this.type = type;
		this.view = view;
		this.category_id = category_id;
		this.company_id = company_id;
		this.deadline = deadline;
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
	public String getCreated_at() {
		return created_at;
	}
	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getExperience() {
		return experience;
	}
	public void setExperience(String experience) {
		this.experience = experience;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getRank() {
		return rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}
	public String getSalary() {
		return salary;
	}
	public void setSalary(String salary) {
		this.salary = salary;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getView() {
		return view;
	}
	public void setView(int view) {
		this.view = view;
	}
	public int getCategory_id() {
		return category_id;
	}
	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}
	public int getCompany_id() {
		return company_id;
	}
	public void setCompany_id(int company_id) {
		this.company_id = company_id;
	}
	public String getDeadline() {
		return deadline;
	}
	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}
	
	
}
