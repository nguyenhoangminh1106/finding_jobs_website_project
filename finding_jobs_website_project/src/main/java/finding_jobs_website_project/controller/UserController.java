package finding_jobs_website_project.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import finding_jobs_website_project.dao.CompanyDAO;
import finding_jobs_website_project.dao.UserDAO;
import finding_jobs_website_project.instance.Company;
import finding_jobs_website_project.instance.Recruitment;
import finding_jobs_website_project.instance.User;

@Controller
public class UserController {
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private CompanyDAO companyDAO;
	
	/**
	 * UPDATE USER
	 * 
	 * @param image
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/user/update-profile", method = RequestMethod.POST)
	public String updateUser(@RequestParam("image") MultipartFile image, HttpServletRequest request) throws Exception {
		String email = request.getParameter("email");
		String fullName = request.getParameter("fullName");
		String address = request.getParameter("address");
		String phoneNumber = request.getParameter("phoneNumber");
		String description = request.getParameter("description");
		
		userDAO.updateUser(email, image, fullName, address, phoneNumber, description);
		HttpSession session = request.getSession();
		User user = userDAO.getUser(email);
		session.setAttribute("user", user);
		return "home";
		
	}
	
	/**
	 * UPDATE CV
	 * 
	 * @param file
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/user/update-cv", method = RequestMethod.POST)
	public String updateCV(@RequestParam("file") MultipartFile file, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		User tempUser = (User)session.getAttribute("user");
		String email = tempUser.getEmail();
		userDAO.updateCV(email, file);
		User user = userDAO.getUser(email);
		session.setAttribute("user", user);
		return "home";
		
	}
	
	/**
	 * FOLLOW A COMPANY
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/user/follow_company")
	public void followCompany(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String currentURL = request.getParameter("currentURL");
		String user_id = request.getParameter("user_id");
		String company_id = request.getParameter("company_id");
		Boolean status = userDAO.followCompany(user_id, company_id);
		String message = "";
		if (status) {
			message = "&following_success=true";
		}
		else {
			message = "&following_error=true";
		}
		response.sendRedirect(currentURL + message);
	}
	
	/**
	 * UNFOLLOW A COMPANY
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/user/unfollow_company")
	public void unfollowCompany(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String currentURL = request.getParameter("currentURL");
		String user_id = request.getParameter("user_id");
		String company_id = request.getParameter("company_id");
		Boolean status = userDAO.unfollowCompany(user_id, company_id);
		String message = "";
		if (status) {
			message = "&unfollowing_success=true";
		}
		else {
			message = "&unfollowing_error=true";
		}
		response.sendRedirect(currentURL + message);
	}
	
	
	/**
	 * SAVE A JOB
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @throws IOException
	 */
	@RequestMapping("/user/saveJob")
	public void saveJob(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
		String user_id = request.getParameter("user_id");
		String recruitment_id = request.getParameter("recruitment_id");
		Boolean status = userDAO.saveJob(user_id, recruitment_id);
		String message = status ? "?save_success=true": "?save_success=false"; 
				
		response.sendRedirect(request.getContextPath() + message);
	}
	
	/**
	 * UNSAVE A JOB
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @throws IOException
	 */
	@RequestMapping("/user/unsaveJob")
	public void unsaveJob(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
		String user_id = request.getParameter("user_id");
		String recruitment_id = request.getParameter("recruitment_id");
		Boolean status = userDAO.unsaveJob(user_id, recruitment_id);
		model.addAttribute("unsave_success", status);
		String message = status ? "?unsave_success=true": "?unsave_success=false"; 

		
		response.sendRedirect(request.getContextPath() + message);
	}
	
	/**
	 * GET SAVE JOB LIST
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/save-job/get-list")
	public String getSaveJobList(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		int user_id = user.getId();
		
		List<Integer> saveJobListId = userDAO.getSaveJobListId(user_id);
		
		List<Recruitment> saveJobList = new ArrayList<>();
		
		for (int id : saveJobListId) {
			String string_id = String.valueOf(id);
			Recruitment recruiment = companyDAO.getRecruitmentById(string_id);
			saveJobList.add(recruiment);
		}
		
		model.addAttribute("saveJobList", saveJobList);
		model.addAttribute("user", user);
		return "list-save-job";
	}
	
	/**
	 * GET FOLLOW COMPANY LIST
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/user/get-list-company")
	public String getFollowCompanyList(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		int user_id = user.getId();
		
		List<Integer> followCompanyListId = userDAO.getFollowCompanyListId(user_id);
		
		List<Company> followCompanyList = new ArrayList<>();
		
		for (int id : followCompanyListId) {
			String string_id = String.valueOf(id);
			Company company = companyDAO.getCompanyById(string_id);
			followCompanyList.add(company);
		}
		
		model.addAttribute("followCompanyList", followCompanyList);
		return "list-follow-company";
	}
	
	/**
	 * GET JOBS THAT APPLIED
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/user/get-list-apply")
	public String getApplyJob(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		int user_id = user.getId();
		
		List<Integer> applyJobListId = userDAO.getApplyJobListId(user_id);
		List<Boolean> approveStatusList = userDAO.getApproveStatusList(user_id);
		List<Recruitment> applyJobList = new ArrayList<>();
		List<Company> applyCompanyList = new ArrayList<>();
		
		for (int id : applyJobListId) {
			String string_id = String.valueOf(id);
			Recruitment recruitment = companyDAO.getRecruitmentById(string_id);
			applyJobList.add(recruitment);
			
			String string_company_id = String.valueOf(recruitment.getCompany_id());
			Company company = companyDAO.getCompanyById(string_company_id);
			applyCompanyList.add(company);
		}
		
		model.addAttribute("applyJobList", applyJobList);
		model.addAttribute("applyCompanyList", applyCompanyList);
		model.addAttribute("approveStatusList", approveStatusList);
		return "list-apply-job";
	}
	
	
	/**
	 * TO JOBS LIST
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("user/list-job")
	public String toListJob(HttpServletRequest request, Model model) {
		String company_id = request.getParameter("company_id");
		Company company = companyDAO.getCompanyById(company_id);
		
		List<Recruitment> list = companyDAO.getRecruitments(String.valueOf(company.getId()));
		
		model.addAttribute("list", list);
		model.addAttribute("company_id", company.getId());
		return "listJob";
	}
	
	/**
	 * SHOW USER PROFILE IMAGE
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/user/image")
    public void showUserImage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		String user_id1 = request.getParameter("user_id1");
		
        response.setContentType("image/jpeg");
        byte[] buffer;
        if (user_id1 == null) {
        	buffer = user.getImage();
        }
        else {
        	User user1 = userDAO.getUserById(user_id1);
        	buffer = user1.getImage();
        }
        
        
        if (buffer != null) {
        	InputStream in = new ByteArrayInputStream(buffer);
            try {
            	IOUtils.copy(in, response.getOutputStream());
            } catch (Exception e) {
            	return;
            }
        }
    }
	
	/**
	 * OPEN USER CV
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/user/cv")
    public void showUserCV(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String user_id = request.getParameter("user_id");
		
		User user = (User)session.getAttribute("user");
        response.setContentType("application/pdf");
        byte[] buffer;
        
        if (user_id == null) {
        	buffer = user.getCv();
        }
        else {
        	User user1 = userDAO.getUserById(user_id);
        	buffer = user1.getCv();
        }
        
        InputStream in = new ByteArrayInputStream(buffer);
        IOUtils.copy(in, response.getOutputStream());
    }
}
