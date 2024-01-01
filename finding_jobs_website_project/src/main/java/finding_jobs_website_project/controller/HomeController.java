package finding_jobs_website_project.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import finding_jobs_website_project.dao.CategoryDAO;
import finding_jobs_website_project.dao.CompanyDAO;
import finding_jobs_website_project.dao.UserDAO;
import finding_jobs_website_project.instance.ApplyPost;
import finding_jobs_website_project.instance.Category;
import finding_jobs_website_project.instance.Company;
import finding_jobs_website_project.instance.Recruitment;
import finding_jobs_website_project.instance.User;

@Controller
public class HomeController {
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private CompanyDAO companyDAO;
	@Autowired
	private CategoryDAO categoryDAO;
	
	/**
	 * REDIRECT TO HOMEPAGE
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("/")
	public String toHomePage(Model model) {
		List<Integer> topCategoriesId = companyDAO.getTopCategoriesId();
		List<Integer> topRecruitmentsId = companyDAO.getTopRecruitmentsId();
		List<Integer> topCompaniesId = companyDAO.getTopCompaniesId();
		List<Category> categories = new ArrayList<>();
		List<Recruitment> recruitments = new ArrayList<>();
		List<Company> companies = new ArrayList<>();
		
		for (int id : topCategoriesId) {
			Category category = categoryDAO.getCategory(id);
			categories.add(category);
		}
		
		for (int id : topRecruitmentsId) {
			String string_id = String.valueOf(id);
			Recruitment recruitment = companyDAO.getRecruitmentById(string_id);
			recruitments.add(recruitment);
		}
		
		for (int id : topCompaniesId) {
			String string_id = String.valueOf(id);
			Company company = companyDAO.getCompanyById(string_id);
			companies.add(company);
		}
		
		model.addAttribute("recruitments", recruitments);
		model.addAttribute("categories", categories);
		model.addAttribute("companies", companies);
		return "home";
	}
	
	/**
	 * REDIRECT TO LOGIN PAGE
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("/auth/login")
	public String toLoginPage(Model model) {
		
		return "login";
	}
	
	/**
	 * LOGOUT
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("/auth/logout")
	public String logout(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "login";
	}
	
	/**
	 * TO PROFILE PAGE
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("/profile")
	public String toProfile(Model model) {	
		return "profile";
	}

	@RequestMapping("/recruitment/post")
	public String toPostJob(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		List<Category> categories = categoryDAO.getCategories();
		session.setAttribute("categories", categories);
		return "post-job";
	}
	
	/**
	 * TO RECRUITMENTS LIST
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("user/list-post")
	public String toListPost(HttpServletRequest request) {
		HttpSession session = request.getSession();
		int numberPage = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
		int numberOfJobsPerPage = 5;
		
		// The index starting the current page
		int pageOffset = (numberPage - 1) * numberOfJobsPerPage;
		
		
		Company company = (Company)session.getAttribute("company");
		List<Recruitment> recruitments = companyDAO.getRecruitments(String.valueOf(company.getId()));
		List<Recruitment> list  = new ArrayList<>();
		
		int numberOfRecruitments = recruitments.size();
		int numberOfPages = numberOfRecruitments % numberOfJobsPerPage == 0
							? numberOfRecruitments / numberOfJobsPerPage
							: numberOfRecruitments / numberOfJobsPerPage + 1;
		
		for (int i = pageOffset; i < numberOfJobsPerPage + pageOffset; i++) {
			try {
				Recruitment recruitment = recruitments.get(i);
				list.add(recruitment);
			}
			// If i > recuitments.size()
			catch(Exception e) {
				break;
			}
		}
		
		session.setAttribute("list", list);
		session.setAttribute("numberPage", numberPage);
		session.setAttribute("numberOfPages", numberOfPages);
		return "post-list";
	}
	
	/**
	 * EDIT RECRUITMENT
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/recruitment/editpost")
	public String toEditPost(HttpServletRequest request, Model model) {
		String id = request.getParameter("id");
		Recruitment recruitment = companyDAO.getRecruitment(id);
		model.addAttribute("recruitment", recruitment);
		
		List<Category> categories = categoryDAO.getCategories();
		model.addAttribute("categories", categories);
		return "edit-job";
	}
	
	/**
	 * RECRUITMENT DETAILS
	 * 
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/recruitment/detail")
	public String toDetailPost(HttpServletRequest request, Model model) throws Exception {
		try {
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("user");
			String id = request.getParameter("id");
			String company_id = request.getParameter("company_id");
			String company_id1 = request.getParameter("company_id1");
			Company userCompany = companyDAO.getCompany(String.valueOf(user.getId()));
			Boolean isFollowing = userDAO.isFollowing(user.getId(), company_id1);
			
			Recruitment recruitment = companyDAO.getRecruitment(id);
			String recruitment_id = String.valueOf(recruitment.getId());
			List<User> applicants = companyDAO.getApplicants(id);
			List<ApplyPost> applyPosts = companyDAO.getApplyPostByRecruitmentId(recruitment_id);
			
			if (company_id != null && company_id1 == null) {
				Company company = companyDAO.getCompanyById(company_id);
				model.addAttribute("company", company);
			}
			
			if (company_id1 != null) {
				Company company = companyDAO.getCompanyById(company_id1);
				model.addAttribute("company", company);
			}
			
			model.addAttribute("recruitment", recruitment);
			model.addAttribute("applicants", applicants);
			model.addAttribute("applyPosts", applyPosts);
			model.addAttribute("param.following_success", isFollowing);
			request.setAttribute("following_success", isFollowing);
			
			if (userCompany != null) {
				request.setAttribute("unfollowing_success", isFollowing);
				model.addAttribute("userCompanyId", userCompany.getId());
			}
			
			
			return "detail-post";
		} catch (Exception e) {
			return "home";
		}
	}
	
	/**
	 * SIGNUP
	 * 
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/auth/register")
	public String addUser(HttpServletRequest request, Model model) throws Exception {
		String email = request.getParameter("email");
		String fullName = request.getParameter("fullName");
		String password = request.getParameter("password");
		String rePassword = request.getParameter("rePassword");
		String role_id = request.getParameter("role_id");
		
		if (!password.equals(rePassword)) {
			model.addAttribute("msg_register_error", true);
			return "login";
		}
		
		Boolean isSuccess = userDAO.addUser(email, fullName, password, role_id, "1");
		if (isSuccess) {
			model.addAttribute("msg_register_success", true);
		}
		else {
			model.addAttribute("msg_register_error", true);
		}
		
		return "login";
	}
	
	/**
	 * LOGIN
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/auth/login/check")
	public String checkLogin(HttpServletRequest request,HttpServletResponse response, Model model) throws Exception{
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		HttpSession session = request.getSession();
		Boolean isSuccess = userDAO.checkLogin(email, password);
		if (isSuccess) {
			
			session.setMaxInactiveInterval(60*60);
			User user = userDAO.getUser(email);
			
			if (user.getRole_id() == 2) {
				Company company = companyDAO.getCompany(String.valueOf(user.getId()));
				if (company != null) {
					session.setAttribute("company", company);
				}
			}
			
			session.setAttribute("user", user);
			session.setAttribute("msg_register_success", true);
			return toHomePage(model);
		    
		}
		else {
			session.setAttribute("msg_register_error", true);
			return "login";
		}
			
	}
	
	
}
