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
public class CompanyController {
	@Autowired
	private CompanyDAO companyDAO;
	
	@Autowired
	private UserDAO userDAO;
	
	/**
	 * UPDATE COMPANY INFO
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/user/update-company", method = RequestMethod.POST)
	public String updateCompany(@RequestParam("logo") MultipartFile logo, HttpServletRequest request) {
		String email = request.getParameter("email");
		String nameCompany = request.getParameter("nameCompany");
		String address = request.getParameter("address");
		String phoneNumber = request.getParameter("phoneNumber");
		String description = request.getParameter("description");
		String user_id = request.getParameter("user_id");
		
		companyDAO.updateCompany(email, nameCompany, logo, address, phoneNumber, description, user_id);
		HttpSession session = request.getSession();
		Company company = companyDAO.getCompany(String.valueOf(user_id));
		session.setAttribute("company", company);
		return "home";
		
	}
	
	/**
	 * ADD JOB RECRUITMENT
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/recruitment/add")
	public String addRecruitment(HttpServletRequest request, Model model) {
		String title = request.getParameter("title");
		String description = request.getParameter("description");
		String experience = request.getParameter("experience");
		String quantity = request.getParameter("quantity");
		String address = request.getParameter("address");
		String deadline = request.getParameter("deadline");
		String salary = request.getParameter("salary");
		String type = request.getParameter("type");
		String category_id = request.getParameter("category_id");
		String company_id = request.getParameter("company_id");
		
		Boolean isSuccess = companyDAO.addRecruitment(title, description, experience, quantity, address, deadline, salary, type, category_id, company_id);
		
		if (isSuccess) {
			model.addAttribute("postJob_success", true);
		}
		else {
			model.addAttribute("postJob_error", true);
		}
		
		
		return "post-job";
	}
	
	/**
	 * UPDATE RECRUITMENT
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/recruitment/edit")
	public String updateRecruitment(HttpServletRequest request, Model model) {
		String id = request.getParameter("id");
		String created_at = request.getParameter("created_at");
		String title = request.getParameter("title");
		String description = request.getParameter("description");
		String experience = request.getParameter("experience");
		String quantity = request.getParameter("quantity");
		String address = request.getParameter("address");
		String deadline = request.getParameter("deadline");
		String salary = request.getParameter("salary");
		String type = request.getParameter("type");
		String category_id = request.getParameter("category_id");
		
		Boolean success = companyDAO.updateRecruitment(id, created_at, title, description, experience, quantity, address, deadline, salary, type, category_id);
	
		if (success) {
			model.addAttribute("success", true);
		}
		else {
			model.addAttribute("error", true);
		}
		
		return "post-list";
		
	}
	
	/**
	 * DELETE RECRUITMENT
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/recruitment/delete")
	public void deleteRecruitment(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception{
		String id = request.getParameter("id");
		String page = request.getParameter("page");
		
		if (page.equals("")) {
			page = "1";
		}
		
		companyDAO.deleteRecruitment(id);

		response.sendRedirect(request.getContextPath() + "/user/list-post?page=" + page);
	}
	
	/**
	 * SEARCH RECRUITMENT BY TITLE
	 * 
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/recruitment/search")
	public String searchRecruitments(HttpServletRequest request, Model model) throws Exception{
		String keySearch = request.getParameter("keySearch");
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		
		int numberPage = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
		int numberOfJobsPerPage = 5;
		
		// The index starting the current page
		int pageOffset = (numberPage - 1) * numberOfJobsPerPage;
		
		List<Recruitment> recruitments = companyDAO.searchRecruitments(keySearch);
		List<Recruitment> list  = new ArrayList<>();
		List<Boolean> isSaveList = new ArrayList<>();
		
		String user_id = String.valueOf(user.getId());
		
		
		int numberOfRecruitments = recruitments.size();
		int numberOfPages = numberOfRecruitments % numberOfJobsPerPage == 0
							? numberOfRecruitments / numberOfJobsPerPage
							: numberOfRecruitments / numberOfJobsPerPage + 1;
		
		for (int i = pageOffset; i < numberOfJobsPerPage + pageOffset; i++) {
			try {
				Recruitment recruitment = recruitments.get(i);
				int recruitment_id = recruitment.getId();
				Boolean isSave = userDAO.isSave(user_id, recruitment_id);
				
				isSaveList.add(isSave);
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
		model.addAttribute("keySearch", keySearch);
		model.addAttribute("requestMapping", "/recruitment/search");
		model.addAttribute("isSaveList", isSaveList);
		
		return "result-search";
		
		
	}
	
	
	
	/**
	 * SEARCH RECRUITMENTS BY COMPANY
	 * 
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/user/search")
	public String searchRecruitmentsByCompany(HttpServletRequest request, Model model) throws Exception{
		try {
			String keySearch = request.getParameter("keySearch");
			
			HttpSession session = request.getSession();
			User user = (User)session.getAttribute("user");
			
			int numberPage = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
			int numberOfJobsPerPage = 5;
			
			// The index starting the current page
			int pageOffset = (numberPage - 1) * numberOfJobsPerPage;
			
			List<Recruitment> recruitments = companyDAO.searchRecruitmentsByCompany(keySearch);
			List<Recruitment> list  = new ArrayList<>();
			List<Boolean> isSaveList = new ArrayList<>();
			
			String user_id = String.valueOf(user.getId());
			
			int numberOfRecruitments = recruitments.size();
			int numberOfPages = numberOfRecruitments % numberOfJobsPerPage == 0
								? numberOfRecruitments / numberOfJobsPerPage
								: numberOfRecruitments / numberOfJobsPerPage + 1;
			
			for (int i = pageOffset; i < numberOfJobsPerPage + pageOffset; i++) {
				try {
					Recruitment recruitment = recruitments.get(i);
					int recruitment_id = recruitment.getId();
					Boolean isSave = userDAO.isSave(user_id, recruitment_id);
					
					isSaveList.add(isSave);
					
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
			model.addAttribute("keySearch", keySearch);
			model.addAttribute("requestMapping", "/user/search");
			model.addAttribute("isSaveList", isSaveList);
			
			return "result-search";
		}catch (Exception e) {
			return "result-search";
		}
		
		
	}
	
	@RequestMapping("/recruitment/searchaddress")
	public String searchRecruitmentsByAddress(HttpServletRequest request, Model model) throws Exception{
		String keySearch = request.getParameter("keySearch");
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		
		int numberPage = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
		int numberOfJobsPerPage = 5;
		
		// The index starting the current page
		int pageOffset = (numberPage - 1) * numberOfJobsPerPage;
		
		List<Recruitment> recruitments = companyDAO.searchRecruitmentsByAddress(keySearch);
		List<Recruitment> list  = new ArrayList<>();
		List<Boolean> isSaveList = new ArrayList<>();
		
		String user_id = String.valueOf(user.getId());
		
		int numberOfRecruitments = recruitments.size();
		int numberOfPages = numberOfRecruitments % numberOfJobsPerPage == 0
							? numberOfRecruitments / numberOfJobsPerPage
							: numberOfRecruitments / numberOfJobsPerPage + 1;
		
		for (int i = pageOffset; i < numberOfJobsPerPage + pageOffset; i++) {
			try {
				Recruitment recruitment = recruitments.get(i);
				int recruitment_id = recruitment.getId();
				Boolean isSave = userDAO.isSave(user_id, recruitment_id);
				
				isSaveList.add(isSave);
				
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
		model.addAttribute("keySearch", keySearch);
		model.addAttribute("requestMapping", "/recruitment/searchaddress");
		model.addAttribute("isSaveList", isSaveList);
		
		return "result-search";
		
		
	}
	
	/**
	 * DISPLAY COMPANY LOGO
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/company/image")
    public void showCompanyImage(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		Company company = (Company)session.getAttribute("company");
		String company_id = request.getParameter("company_id");
		String company_id1 = request.getParameter("company_id1");
		
		
		if (company == null && company_id != null && company_id1 == null) {
			company = companyDAO.getCompanyById(company_id);
		}
		
		if (company_id1 != null) {
			company = companyDAO.getCompanyById(company_id1);
		}
		
        response.setContentType("image/jpeg");
        byte[] buffer = company.getLogo();
        
        if (buffer != null) {
        	InputStream in = new ByteArrayInputStream(buffer);
            IOUtils.copy(in, response.getOutputStream());
        }
    }
	
	/**
	 * COMPANY DETAILS
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/company_detail")
	public String toDetailCompany(HttpServletRequest request, Model model) {
		String company_id = request.getParameter("company_id");
		Company company = companyDAO.getCompanyById(company_id);
		model.addAttribute(company);
		
		return "detail-company";
	}
	
	/**
	 * SUBMIT CV
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/user/apply-job")
	public String sendCV (HttpServletRequest request, Model model) {
		String send_cv_option = request.getParameter("send_cv_option");
		String text = request.getParameter("intro_cv");
		String recruitment_id = request.getParameter("recruitment_id");
		String user_id = request.getParameter("user_id");
		Boolean apply_status = false;
		
		if (send_cv_option.equals("1")) {
			HttpSession session = request.getSession();
			User user = (User)session.getAttribute("user");
			byte[] bytesCV = user.getCv();
			apply_status = companyDAO.sendCV(bytesCV, recruitment_id, user_id, text);
			
		}
		else if (send_cv_option.equals("2")) {
			byte[] bytesCV = request.getParameter("file").getBytes();
			apply_status = companyDAO.sendCV(bytesCV, recruitment_id, user_id, text);
		}
		
		if (apply_status) {
			model.addAttribute("apply_success", true);
		}
		else {
			model.addAttribute("apply_error", true);
		}
		
		return "result-search";
		
	}
	
	/**
	 * APPROVE CV
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/user/approve")
	public void approveCV(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String applypost_id = request.getParameter("applypost_id");
		companyDAO.approveCV(applypost_id);
		String currentURL = request.getParameter("currentURL");
		response.sendRedirect(currentURL);
	}
	
	
	
}
