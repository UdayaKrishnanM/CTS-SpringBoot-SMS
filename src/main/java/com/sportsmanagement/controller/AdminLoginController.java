package com.sportsmanagement.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sportsmanagement.dao.AdminRepository;
import com.sportsmanagement.model.Admin;

@Controller
public class AdminLoginController {

	private AdminRepository adminrepo;

	@GetMapping("/")
    public String adminlog() {
        return "admin";
    }

//    @PostMapping("/index")
//	public String saveadmin(Admin admin) {
//    	adminrepo.save(admin);
//		return "redirect:/index";	
//    }
    
    @GetMapping("/index")
    public String  adminlogger(){
		return "index"; 
    }

    
	@PostMapping("/")
	public String login(Admin admin, RedirectAttributes redirectAttributes) {
	    Admin user = adminrepo.getById(admin.getId());
	    if (user.getId().equals(admin.getId()) && user.getPassword().equals(admin.getPassword())) {
	    	return "redirect:/index";
	    } else {
	    	if (user.getId().equals(admin.getId()) && !user.getPassword().equals(admin.getPassword())) {
	            redirectAttributes.addFlashAttribute("message", "Password wrong");
		        return "redirect:/"; 
	        }  else if(!user.getId().equals(admin.getId())){
	            redirectAttributes.addFlashAttribute("message", "ID not found");
		        return "redirect:/"; 
	        } else {
	        	return "redirect:/";
	        }
	    }
	}
}