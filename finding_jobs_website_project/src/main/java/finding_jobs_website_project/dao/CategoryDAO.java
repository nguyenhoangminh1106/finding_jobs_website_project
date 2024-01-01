package finding_jobs_website_project.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import finding_jobs_website_project.instance.Category;

@Repository
public class CategoryDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	/**
	 * GET ALL CATEGORIES
	 * 
	 * @return
	 */
	public List<Category> getCategories() {
		String sql = "SELECT * FROM categories";
        
        List<Category> categories = jdbcTemplate.query(sql, new RowMapper<Category>() {
            @Override
            public Category mapRow(ResultSet rs, int rowNum) throws SQLException {
                Category category = new Category();
                category.setId(rs.getInt("id"));
                category.setName(rs.getString("name"));
                return category;
            }
        });
        
        return categories;	
	}
	
	/**
	 * GET CATEGORY BY ID
	 * 
	 * @param id
	 * @return
	 */
	public Category getCategory(int id) {
        String sql = "SELECT * FROM categories WHERE id = ?";

        return jdbcTemplate.queryForObject(sql, new Object[]{id}, new RowMapper<Category>() {
            @Override
            public Category mapRow(ResultSet rs, int rowNum) throws SQLException {
                Category category = new Category();
                category.setId(rs.getInt("id"));
                category.setName(rs.getString("name"));
                return category;
            }
        });
    }
	
	/**
	 * GET CATEGORY_ID BY NAME
	 * 
	 * @param name
	 * @return
	 */
	public String getCategory_id(String name) {
		String query = "select id from categories where name = '" + name + "';";
		int id = jdbcTemplate.queryForObject(query, new Object[] {name}, Integer.class);
		
		return String.valueOf(id);
	}
}
