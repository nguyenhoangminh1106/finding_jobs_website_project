package finding_jobs_website_project.instance;

public class Category {
	private int id;
	private String name;
	private int number_choose;
	
	
	
	public Category() {
		super();
	}
	public Category(int id, String name, int number_choose) {
		super();
		this.id = id;
		this.name = name;
		this.number_choose = number_choose;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getNumber_choose() {
		return number_choose;
	}
	public void setNumber_choose(int number_choose) {
		this.number_choose = number_choose;
	}
	
	
}
