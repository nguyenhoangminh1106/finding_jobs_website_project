package finding_jobs_website_project.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import finding_jobs_website_project.instance.Recruitment;
import finding_jobs_website_project.instance.User;

@Repository
public class UserDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	
	/**
	 * ADD A USER TO THE DATABASE
	 * 
	 * @param email
	 * @param fullName
	 * @param password
	 * @param role_id
	 * @param status
	 * @return
	 * @throws Exception
	 */
	public boolean addUser(String email, String fullName, String password, String role_id, String status) throws Exception{
		try {
			String query = "INSERT INTO users (email, full_name, password, role_id, status) VALUES (?, ?, ?, ?, ?)";
			jdbcTemplate.update(query, email, fullName, password, role_id, status);
			return true;
		} catch (Exception e) {
			return false;
		}
	}


	/**
	 * CHECK LOGIN INFO
	 * 
	 * @param email
	 * @param password
	 * @return
	 */
	public Boolean checkLogin(String email, String password) {
		try {
			String query = "select count(*) as count from users where email = ? and password = ? and status = 1;";
			
			// Return a single row
			Integer count = jdbcTemplate.queryForObject(query, new Object[] {email, password}, Integer.class);
			
			if (count == 1) {
				return true;
			}
			else {
				return false;
			}
		} catch (Exception e) {
			return false;
		}
	}
	
	/**
	 * GET USER BY EMAIL
	 * 
	 * @param email
	 * @return
	 * @throws Exception
	 */
	public User getUser(String email) throws Exception{
        String query = "SELECT * FROM users WHERE email = ?";
        return jdbcTemplate.queryForObject(query, new Object[] {email}, new RowMapper<User>() {
            @Override
            public User mapRow(ResultSet rs, int rowNum) throws SQLException {
            	int id = rs.getInt("id");
            	String address = rs.getString("address");
            	String description = rs.getString("description");
            	String email = rs.getString("email");
            	String fullName = rs.getString("full_name");
            	byte[] image = rs.getBytes("image");
            	String password = rs.getString("password");
            	String phoneNumber = rs.getString("phone_number");
            	int status = rs.getInt("status");
            	int role_id = rs.getInt("role_id");
            	byte[] cv = rs.getBytes("cv");
            	
                User user = new User(id, address, description, email, fullName, image, password, phoneNumber, status, role_id, cv);

                return user;
            }
        });
    }
	
	/**
	 * GET USER BY ID
	 * 
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public User getUserById(String id) throws Exception{
        String query = "SELECT * FROM users WHERE id = ?";
        return jdbcTemplate.queryForObject(query, new Object[] {id}, new RowMapper<User>() {
            @Override
            public User mapRow(ResultSet rs, int rowNum) throws SQLException {
            	int id = rs.getInt("id");
            	String address = rs.getString("address");
            	String description = rs.getString("description");
            	String email = rs.getString("email");
            	String fullName = rs.getString("full_name");
            	byte[] image = rs.getBytes("image");
            	String password = rs.getString("password");
            	String phoneNumber = rs.getString("phone_number");
            	int status = rs.getInt("status");
            	int role_id = rs.getInt("role_id");
            	byte[] cv = rs.getBytes("cv");
            	
                User user = new User(id, address, description, email, fullName, image, password, phoneNumber, status, role_id, cv);

                return user;
            }
        });
    }


	/**
	 * UPDATE USER
	 * 
	 * @param email
	 * @param image
	 * @param fullName
	 * @param address
	 * @param phoneNumber
	 * @param description
	 * @return
	 */
	public Boolean updateUser(String email, MultipartFile image, String fullName, String address, String phoneNumber, String description) {
		try {
			if (image.getSize() > 0) {
				byte[] imageBytes = image.getBytes();
				String query = "update users set image = ?, full_name = ?, address = ?, phone_number = ?, description = ? "
									+ "where email = '" + email + "';";
				jdbcTemplate.update(query, imageBytes, fullName, address, phoneNumber, description);
			}
			else {
				String query = "update users set full_name = ?, address = ?, phone_number = ?, description = ? "
						+ "where email = '" + email + "';";
				jdbcTemplate.update(query, fullName, address, phoneNumber, description);
			}
			return true;
		} catch (Exception e) {
			return false;
		}	
		
	}


	/**
	 * UPDATE CV
	 * 
	 * @param email
	 * @param file
	 * @return
	 */
	public boolean updateCV(String email, MultipartFile file) {
		try {
			if (file.getSize() > 0) {
				byte[] fileBytes = file.getBytes();
				String query = "update users set cv = ? "
									+ "where email = '" + email + "';";
				jdbcTemplate.update(query, fileBytes);
			}
			return true;
		} catch (Exception e) {
			return false;
		}	
		
	}

	/**
	 * FOLLOW A COMPANY
	 * 
	 * @param user_id
	 * @param company_id
	 * @return
	 */
	public Boolean followCompany(String user_id, String company_id) {
		try {
			String query = "insert into follow_companies (user_id, company_id) values "
					+ "(" + user_id + ", " + company_id + ");";
			jdbcTemplate.update(query);
			return true;
		} catch(Exception e) {
			return false;
		}
	}
	
	/**
	 * UNFOLLOW COMPANY 
	 * 
	 * @param user_id
	 * @param company_id
	 * @return
	 */
	public Boolean unfollowCompany(String user_id, String company_id) {
		try {
			String query = "delete from follow_companies where "
					+ "user_id = " + user_id + " and company_id = " + company_id + ";";
			jdbcTemplate.update(query);
			return true;
		} catch(Exception e) {
			return false;
		}
	}

	/**
	 * CHECK WHETHER A USER IS FOLLOWING A COMPANY
	 * 
	 * @param user_id
	 * @param company_id
	 * @return
	 */
	public Boolean isFollowing(int user_id, String company_id) {
		String sql = "SELECT COUNT(*) FROM follow_companies WHERE user_id = ? AND company_id = ?";
        int count = jdbcTemplate.queryForObject(sql, new Object[] {user_id, company_id}, Integer.class);
        	return count > 0;

	}

	/**
	 * SAVE A JOB
	 * 
	 * @param user_id
	 * @param recruitment_id
	 * @return
	 */
	public Boolean saveJob(String user_id, String recruitment_id) {
		try {
			String query = "insert into save_jobs (user_id, recruitment_id) values "
					+ "(" + user_id + ", " + recruitment_id + ");";
			jdbcTemplate.update(query);
			return true;
		} catch(Exception e) {
			return false;
		}
	}


	/**
	 * UNSAVE A JOB
	 * 
	 * @param user_id
	 * @param recruitment_id
	 * @return
	 */
	public Boolean unsaveJob(String user_id, String recruitment_id) {
		try {
			String query = "delete from save_jobs where "
					+ "user_id = " + user_id + " and recruitment_id = " + recruitment_id + ";";
			jdbcTemplate.update(query);
			return true;
		} catch(Exception e) {
			return false;
		}
	}
	
	/**
	 * CHECK WHETHER A USER IS SAVING A JOB
	 * 
	 * @param user_id
	 * @param recruitment_id
	 * @return
	 */
	public Boolean isSave(String user_id, int recruitment_id) {
		String sql = "SELECT COUNT(*) FROM save_jobs WHERE user_id = ? AND recruitment_id = ?;";
        int count = jdbcTemplate.queryForObject(sql, new Object[] {user_id, recruitment_id}, Integer.class);
        return count > 0;

	}


	/**
	 * GET SAVE JOB ID LIST
	 * 
	 * @param user_id
	 * @return
	 */
	public List<Integer> getSaveJobListId(int user_id) {
		String query = "SELECT recruitment_id FROM save_jobs WHERE user_id = "+ user_id +" GROUP BY recruitment_id;";
		
		
        return jdbcTemplate.query(query, new RowMapper<Integer>() {
                @Override
                public Integer mapRow(ResultSet rs, int rowNum) throws SQLException {
                	return rs.getInt("recruitment_id");
                }
            });
	}


	/**
	 * GET FOLLOW COMPANY ID LIST
	 * 
	 * @param user_id
	 * @return
	 */
	public List<Integer> getFollowCompanyListId(int user_id) {
		String query = "SELECT company_id FROM follow_companies WHERE user_id = "+ user_id +" GROUP BY company_id;";
		
		
        return jdbcTemplate.query(query, new RowMapper<Integer>() {
                @Override
                public Integer mapRow(ResultSet rs, int rowNum) throws SQLException {
                	return rs.getInt("company_id");
                }
            });
	}

	/**
	 * GET APPLY JOB LIST BY ID
	 * 
	 * @param user_id
	 * @return
	 */
	public List<Integer> getApplyJobListId(int user_id) {
		String query = "SELECT recruitment_id FROM applyposts WHERE user_id = "+ user_id +" GROUP BY recruitment_id;";
		
		
        return jdbcTemplate.query(query, new RowMapper<Integer>() {
                @Override
                public Integer mapRow(ResultSet rs, int rowNum) throws SQLException {
                	return rs.getInt("recruitment_id");
                }
            });
	}

	/**
	 * GET APPROVE STATUS LIST
	 * 
	 * @param user_id
	 * @return
	 */
	public List<Boolean> getApproveStatusList(int user_id) {
		String query = "SELECT status FROM applyposts WHERE user_id = "+ user_id +";";
		
		
        return jdbcTemplate.query(query, new RowMapper<Boolean>() {
                @Override
                public Boolean mapRow(ResultSet rs, int rowNum) throws SQLException {
                	return rs.getBoolean("status");
                }
            });
	}
	
	
}
