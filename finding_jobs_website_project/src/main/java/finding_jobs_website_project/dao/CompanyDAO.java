package finding_jobs_website_project.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import finding_jobs_website_project.instance.ApplyPost;
import finding_jobs_website_project.instance.Category;
import finding_jobs_website_project.instance.Company;
import finding_jobs_website_project.instance.Recruitment;
import finding_jobs_website_project.instance.User;

@Repository
public class CompanyDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	private UserDAO userDAO;

	/**
	 * UPDATE COMPANY
	 * 
	 * @param email
	 * @param nameCompany
	 * @param logo
	 * @param address
	 * @param phoneNumber
	 * @param description
	 * @param user_id
	 * @return
	 */
	public boolean updateCompany(String email, String nameCompany, MultipartFile logo, String address, String phoneNumber,
			String description, String user_id) {
		String countQuery = "select count(*) from companies where user_id = ?;";
		Integer count = -1;
		try {
			count = jdbcTemplate.queryForObject(countQuery, new Object[] {user_id}, Integer.class);
		} catch (Exception e) {
			count = 0;
		}
		
		try {
			byte[] logoBytes = logo.getBytes();
			if (count == 0) {
				String query = "insert into companies (email, nameCompany, logo, address, phoneNumber, description, user_id, status) "
								+ "values (?, ?, ?, ?, ?, ?, ?, 1);";
				jdbcTemplate.update(query, email, nameCompany, logoBytes, address, phoneNumber, description, user_id);
				return true;
			}
			else {
				String query = "update companies set email=?, nameCompany=?, logo=?, address=?, phoneNumber=?, description=? "
								+ "where user_id = " + user_id + ";";
				jdbcTemplate.update(query, email, nameCompany, logoBytes, address, phoneNumber, description);
				return true;
			}
		} catch (Exception e) {
			return false;
		}		
	}
	
	/**
	 * GET COMPANY OF A PERSON
	 * 
	 * @param user_id
	 * @return
	 */
	public Company getCompany(String user_id) {
        String query = "SELECT * FROM companies WHERE user_id = ?";
        int int_user_id = -1;
        if (user_id != null) {
        	int_user_id = Integer.parseInt(user_id);
        }
        
        
        try {
        	return jdbcTemplate.queryForObject(query, new Object[] {int_user_id}, new RowMapper<Company>() {
                @Override
                public Company mapRow(ResultSet rs, int rowNum) throws SQLException {
                	int id = rs.getInt("id");
                	String address = rs.getString("address");
                	String description = rs.getString("description");
                	String email = rs.getString("email");
                	String nameCompany = rs.getString("nameCompany");
                	byte[] logo = rs.getBytes("logo");
                	String phoneNumber = rs.getString("phoneNumber");
                	int status = rs.getInt("status");
                	int user_id = rs.getInt("user_id");
                	
                    Company company = new Company(id, address, description, email, logo, nameCompany, phoneNumber, status, user_id);

                    return company;
                }
            });
        } catch(Exception e) {
        	return null;
        }
	}
	
	/**
	 * GET COMPANY BY ID
	 * 
	 * @param id
	 * @return
	 */
	public Company getCompanyById(String id) {
        String query = "SELECT * FROM companies WHERE id = ?";
        int int_id = Integer.parseInt(id);
        
        
        try {
        	return jdbcTemplate.queryForObject(query, new Object[] {int_id}, new RowMapper<Company>() {
                @Override
                public Company mapRow(ResultSet rs, int rowNum) throws SQLException {
                	int id = rs.getInt("id");
                	String address = rs.getString("address");
                	String description = rs.getString("description");
                	String email = rs.getString("email");
                	String nameCompany = rs.getString("nameCompany");
                	byte[] logo = rs.getBytes("logo");
                	String phoneNumber = rs.getString("phoneNumber");
                	int status = rs.getInt("status");
                	int user_id = rs.getInt("user_id");
                	
                    Company company = new Company(id, address, description, email, logo, nameCompany, phoneNumber, status, user_id);

                    return company;
                }
            });
        } catch(Exception e) {
        	return null;
        }
	}
	
	/**
	 * GET RECRUITMENT BY ID
	 * 
	 * @param id
	 * @return
	 */
	public Recruitment getRecruitmentById(String id) {
        String query = "SELECT * FROM recruitments WHERE id = ?";
        int int_id = Integer.parseInt(id);
        
        
        try {
        	return jdbcTemplate.queryForObject(query, new Object[] {int_id}, new RowMapper<Recruitment>() {
                @Override
                public Recruitment mapRow(ResultSet rs, int rowNum) throws SQLException {
                	Recruitment recruitment = new Recruitment();
                    recruitment.setId(rs.getInt("id"));
                    recruitment.setAddress(rs.getString("address"));
                    recruitment.setCreated_at(rs.getString("created_at"));
                    recruitment.setDescription(rs.getString("description"));
                    recruitment.setExperience(rs.getString("experience"));
                    recruitment.setQuantity(rs.getInt("quantity"));
                    recruitment.setRank(rs.getString("rankString"));
                    recruitment.setSalary(rs.getString("salary"));
                    recruitment.setStatus(rs.getInt("status"));
                    recruitment.setTitle(rs.getString("title"));
                    recruitment.setType(rs.getString("type"));
                    recruitment.setCategory_id(rs.getInt("category_id"));
                    recruitment.setCompany_id(rs.getInt("company_id"));
                    recruitment.setDeadline(rs.getString("deadline"));

                    return recruitment;
                }
            });
        } catch(Exception e) {
        	return null;
        }
	}
	
	/**
	 * GET ALL RECRUITMENTS OF A COMPANY
	 * 
	 * @param company_id
	 * @return
	 */
	public List<Recruitment> getRecruitments(String company_id) {
		String sql = "SELECT * FROM recruitments WHERE company_id = " + company_id + ";";
        
        List<Recruitment> recruitments = jdbcTemplate.query(sql, new RowMapper<Recruitment>() {
            @Override
            public Recruitment mapRow(ResultSet rs, int rowNum) throws SQLException {
            	Recruitment recruitment = new Recruitment();
                recruitment.setId(rs.getInt("id"));
                recruitment.setAddress(rs.getString("address"));
                recruitment.setCreated_at(rs.getString("created_at"));
                recruitment.setDescription(rs.getString("description"));
                recruitment.setExperience(rs.getString("experience"));
                recruitment.setQuantity(rs.getInt("quantity"));
                recruitment.setRank(rs.getString("rankString"));
                recruitment.setSalary(rs.getString("salary"));
                recruitment.setStatus(rs.getInt("status"));
                recruitment.setTitle(rs.getString("title"));
                recruitment.setType(rs.getString("type"));
                recruitment.setCategory_id(rs.getInt("category_id"));
                recruitment.setCompany_id(rs.getInt("company_id"));
                recruitment.setDeadline(rs.getString("deadline"));
                
                return recruitment;
            }
        });
        
        return recruitments;	
	}
	
	
	/**
	 * GET RECRUITMENT BY ID
	 * 
	 * @param id
	 * @return
	 */
	public Recruitment getRecruitment(String id) {
        String query = "SELECT * FROM recruitments WHERE id = ?";
        int int_id = Integer.parseInt(id);
        
        try {
        	return jdbcTemplate.queryForObject(query, new Object[] {int_id}, new RowMapper<Recruitment>() {
                @Override
                public Recruitment mapRow(ResultSet rs, int rowNum) throws SQLException {
                	Recruitment recruitment = new Recruitment();
                    recruitment.setId(rs.getInt("id"));
                    recruitment.setAddress(rs.getString("address"));
                    recruitment.setCreated_at(rs.getString("created_at"));
                    recruitment.setDescription(rs.getString("description"));
                    recruitment.setExperience(rs.getString("experience"));
                    recruitment.setQuantity(rs.getInt("quantity"));
                    recruitment.setRank(rs.getString("rankString"));
                    recruitment.setSalary(rs.getString("salary"));
                    recruitment.setStatus(rs.getInt("status"));
                    recruitment.setTitle(rs.getString("title"));
                    recruitment.setType(rs.getString("type"));
                    recruitment.setCategory_id(rs.getInt("category_id"));
                    recruitment.setCompany_id(rs.getInt("company_id"));
                    recruitment.setDeadline(rs.getString("deadline"));
                    
                    return recruitment;
                }
            });
        } catch(Exception e) {
        	return null;
        }
	}

	/**
	 * UPDATE RECRUITMENT
	 * 
	 * @param id
	 * @param created_at
	 * @param title
	 * @param description
	 * @param experience
	 * @param quantity
	 * @param address
	 * @param deadline
	 * @param salary
	 * @param type
	 * @param category_id
	 * @return
	 */
	public Boolean updateRecruitment(String id, String created_at, String title, String description, String experience, String quantity,
			String address, String deadline, String salary, String type, String category_id) {
		try {
			
			String query = "update recruitments set created_at = curdate(), title = ?, description = ?, experience = ?, quantity = ?, address = ?, deadline = ?, salary = ?, type = ?, category_id = ? "
								+ "where id = " + id + ";";
			jdbcTemplate.update(query, title, description, experience, quantity, address, deadline, salary, type, category_id);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	/**
	 * DELETE RECRUITMENT
	 * 
	 * @param id
	 * @return
	 */
	public Boolean deleteRecruitment(String id) {
		try {
			
			String query = "delete from recruitments where id = " + id + ";";
			jdbcTemplate.update(query);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	
	/**
	 * ADD RECRUITMENT
	 * 
	 * @param title
	 * @param description
	 * @param experience
	 * @param quantity
	 * @param address
	 * @param deadline
	 * @param salary
	 * @param type
	 * @param category_id
	 * @param company_id
	 * @return
	 */
	public Boolean addRecruitment(String title, String description, String experience, String quantity, String address,
			String deadline, String salary, String type, String category_id, String company_id) {
		
		try {
			String query = "insert into recruitments (title, description, experience, quantity, address, deadline, salary, type, category_id, created_at, status, company_id) "
					+ "values (?, ?, ?, ?, ?, ?, ?, ?, ?, current_date(), 1, ?);";
			jdbcTemplate.update(query, title, description, experience, quantity, address, deadline, salary, type, category_id, company_id);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	/**
	 * SEARCH RECRUITMENTS BY TITLE
	 * 
	 * @param keySearch
	 * @return
	 */
	public List<Recruitment> searchRecruitments(String keySearch) {
		String query = "SELECT * FROM recruitments WHERE title like '%"+ keySearch +"%';";
        
        try {
        	List<Recruitment> recruitments = jdbcTemplate.query(query, new RowMapper<Recruitment>() {
                @Override
                public Recruitment mapRow(ResultSet rs, int rowNum) throws SQLException {
                	Recruitment recruitment = new Recruitment();
                    recruitment.setId(rs.getInt("id"));
                    recruitment.setAddress(rs.getString("address"));
                    recruitment.setCreated_at(rs.getString("created_at"));
                    recruitment.setDescription(rs.getString("description"));
                    recruitment.setExperience(rs.getString("experience"));
                    recruitment.setQuantity(rs.getInt("quantity"));
                    recruitment.setRank(rs.getString("rankString"));
                    recruitment.setSalary(rs.getString("salary"));
                    recruitment.setStatus(rs.getInt("status"));
                    recruitment.setTitle(rs.getString("title"));
                    recruitment.setType(rs.getString("type"));
                    recruitment.setCategory_id(rs.getInt("category_id"));
                    recruitment.setCompany_id(rs.getInt("company_id"));
                    recruitment.setDeadline(rs.getString("deadline"));
                    
                    return recruitment;
                }
            });
            
            return recruitments;
        } catch(Exception e) {
        	return null;
        }
	}

	
	/**
	 * SEARCH RECRUITMENTS BY COMPANY
	 * 
	 * @param keySearch
	 * @return
	 */
	public List<Recruitment> searchRecruitmentsByCompany(String keySearch) {
		String queryCompany = "SELECT id FROM companies WHERE nameCompany like '%"+ keySearch +"%';";
		
		int company_id = 0; 
				
		try {
			company_id = jdbcTemplate.queryForObject(queryCompany, Integer.class);
			String string_id = String.valueOf(company_id);
	        return getRecruitments(string_id);
        } catch(Exception e) {
        	return null;
        }
	}

	/**
	 * SEARCH RECRUITMENTS BY ADDRESS
	 * 
	 * @param keySearch
	 * @return
	 */
	public List<Recruitment> searchRecruitmentsByAddress(String keySearch) {
		String query = "SELECT * FROM recruitments WHERE address like '%"+ keySearch +"%';";
        
        try {
        	List<Recruitment> recruitments = jdbcTemplate.query(query, new RowMapper<Recruitment>() {
                @Override
                public Recruitment mapRow(ResultSet rs, int rowNum) throws SQLException {
                	Recruitment recruitment = new Recruitment();
                    recruitment.setId(rs.getInt("id"));
                    recruitment.setAddress(rs.getString("address"));
                    recruitment.setCreated_at(rs.getString("created_at"));
                    recruitment.setDescription(rs.getString("description"));
                    recruitment.setExperience(rs.getString("experience"));
                    recruitment.setQuantity(rs.getInt("quantity"));
                    recruitment.setRank(rs.getString("rankString"));
                    recruitment.setSalary(rs.getString("salary"));
                    recruitment.setStatus(rs.getInt("status"));
                    recruitment.setTitle(rs.getString("title"));
                    recruitment.setType(rs.getString("type"));
                    recruitment.setCategory_id(rs.getInt("category_id"));
                    recruitment.setCompany_id(rs.getInt("company_id"));
                    recruitment.setDeadline(rs.getString("deadline"));
                    
                    return recruitment;
                }
            });
            
            return recruitments;
        } catch(Exception e) {
        	return null;
        }
	}
	
	/**
	 * SUBMIT CV
	 * 
	 * @param bytesCV
	 * @param recruitment_id
	 * @param user_id
	 * @param text
	 * @return
	 */
	public Boolean sendCV(byte[] bytesCV, String recruitment_id, String user_id, String text) {
		try {
			String query = "insert into applyposts (created_at, status, recruitment_id, user_id, text) "
							+ "values (curdate(), 0, ?, ?, ?);";
			jdbcTemplate.update(query, recruitment_id, user_id, text);
			return true;
		}
		catch (Exception e) {
			return false;
		}
	}

	/**
	 * GET TOP CATEGORIES ID
	 * 
	 * @return
	 */
	public List<Integer> getTopCategoriesId() {
		String query = "SELECT category_id FROM recruitments GROUP BY category_id ORDER BY COUNT(*) DESC LIMIT 4;";
		
		
        return jdbcTemplate.query(query, new RowMapper<Integer>() {
                @Override
                public Integer mapRow(ResultSet rs, int rowNum) throws SQLException {
                	return rs.getInt("category_id");
                }
            });
	}
	
	/**
	 * GET TOP RECRUITMENT IDS
	 * 
	 * @return
	 */
	public List<Integer> getTopRecruitmentsId() {
		String query = "SELECT recruitment_id FROM applyposts GROUP BY recruitment_id ORDER BY COUNT(*) DESC LIMIT 4;";
		
		
        return jdbcTemplate.query(query, new RowMapper<Integer>() {
                @Override
                public Integer mapRow(ResultSet rs, int rowNum) throws SQLException {
                	return rs.getInt("recruitment_id");
                }
            });
	}
	
	/**
	 * GET TOP COMPANY ID
	 * 
	 * @return
	 */
	public List<Integer> getTopCompaniesId() {
		String query = "SELECT company_id FROM recruitments GROUP BY company_id ORDER BY COUNT(*) DESC LIMIT 4;";
		
		
        return jdbcTemplate.query(query, new RowMapper<Integer>() {
                @Override
                public Integer mapRow(ResultSet rs, int rowNum) throws SQLException {
                	return rs.getInt("company_id");
                }
            });
	}

	/**
	 * GET APPLICANT_ID BY RECUITMENT_ID
	 * 
	 * @param recruitment_id
	 * @return
	 */
	public List<Integer> getApplicantsId(String recruitment_id) {
		String query = "SELECT user_id FROM applyposts where recruitment_id = "+ recruitment_id +" GROUP BY user_id;";
		
		
        return jdbcTemplate.query(query, new RowMapper<Integer>() {
                @Override
                public Integer mapRow(ResultSet rs, int rowNum) throws SQLException {
                	return rs.getInt("user_id");
                }
            });
	}
	
	/**
	 * GET APPLICANTS BY RECRUITMENT_ID
	 * 
	 * @param recruitment_id
	 * @return
	 * @throws Exception
	 */
	public List<User> getApplicants(String recruitment_id) throws Exception {
		List<User> users = new ArrayList<>();
		
		for (int id : getApplicantsId(recruitment_id)) {
			String string_id = String.valueOf(id);
			users.add(userDAO.getUserById(string_id));
		}
		
		return users;
	}
	
	/**
	 * GET APPLYPOSTS BY RECRUITMENT_ID
	 * 
	 * @param recruitment_id
	 * @return
	 */
	public List<ApplyPost> getApplyPostByRecruitmentId(String recruitment_id) {
		
		String query = "SELECT * FROM applyposts where recruitment_id = "+ recruitment_id +" order by created_at;";
		
		
        return jdbcTemplate.query(query, new RowMapper<ApplyPost>() {
                @Override
                public ApplyPost mapRow(ResultSet rs, int rowNum) throws SQLException {
                	ApplyPost applyPost = new ApplyPost();
                	applyPost.setId(rs.getInt("id"));
                	applyPost.setCreated_at(rs.getString("created_at"));
                	applyPost.setStatus(rs.getInt("status"));
                	applyPost.setRecruitment_id(rs.getInt("recruitment_id"));
                	applyPost.setUser_id(rs.getInt("user_id"));
                	applyPost.setName_cv(rs.getString("name_cv"));
                	applyPost.setText(rs.getString("text"));
                	
                	return applyPost;
                }
            });
	}

	/**
	 * APPROVE CV
	 * 
	 * @param applypost_id
	 */
	public void approveCV(String applypost_id) {
		String query = "update applyposts set status = 1 where id = " + applypost_id + ";";
		jdbcTemplate.update(query);
		
	}
}
