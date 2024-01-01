package finding_jobs_website_project.instance;

public class ApplyPost {
	private int id;
	private String created_at;
	private int recruitment_id;
	private int user_id;
	private String name_cv;
	private int status;
	private String text;
	
	public ApplyPost() {
		super();
	}
	
	public ApplyPost(int id, String created_at, int recruitment_id, int user_id, String name_cv, int status,
			String text) {
		super();
		this.id = id;
		this.created_at = created_at;
		this.recruitment_id = recruitment_id;
		this.user_id = user_id;
		this.name_cv = name_cv;
		this.status = status;
		this.text = text;
	}

	public ApplyPost(String created_at, int recruitment_id, int user_id, String name_cv, int status, String text) {
		super();
		this.created_at = created_at;
		this.recruitment_id = recruitment_id;
		this.user_id = user_id;
		this.name_cv = name_cv;
		this.status = status;
		this.text = text;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCreated_at() {
		return created_at;
	}

	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}

	public int getRecruitment_id() {
		return recruitment_id;
	}

	public void setRecruitment_id(int recruitment_id) {
		this.recruitment_id = recruitment_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getName_cv() {
		return name_cv;
	}

	public void setName_cv(String name_cv) {
		this.name_cv = name_cv;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}
	
	
	
}
