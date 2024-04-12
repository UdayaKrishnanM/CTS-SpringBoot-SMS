package com.sportsmanagement.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sportsmanagement.dao.AdminRepository;
import com.sportsmanagement.model.Admin;

@Controller
public class AdminLoginController {

	@Autowired
	private AdminRepository adminrepo;

	@GetMapping("/")
    public String adminlog() {
        return "admin";
    }

    @PostMapping("/index")
	public String saveadmin(Admin admin) {
    	adminrepo.save(admin);
		return "redirect:/index";	
    }
    
    @GetMapping("/index")
    public String  adminlogger(){
		return "index"; 
    }

    
	@PostMapping("/")
	public String login(Admin admin, RedirectAttributes redirectAttributes, Model model) {
		
		
	    Admin user = adminrepo.getById(admin.getId());

	    if (user.getId().equals(admin.getId()) && user.getPassword().equals(admin.getPassword())) {
	        return "redirect:/index"; // Redirect to the index page
	    } else {
	        if (user == null || !user.getId().equals(admin.getId())) {
	            redirectAttributes.addFlashAttribute("error", "ID not found");
	        } else if (user.getId().equals(admin.getId()) && !user.getPassword().equals(admin.getPassword())) {
	            redirectAttributes.addFlashAttribute("error", "Password wrong");
	        }
	        model.addAttribute("admin", admin); // Add the admin object back to the model
	        return "redirect:/"; // Stay on the same page
	    }
	}

	
//    @PostMapping("/")
//    public String login(Admin admin, RedirectAttributes redirectAttributes) {
//        Admin user = adminrepo.getById(admin.getId());
//
//        if(user.getId().equals(admin.getId()) && user.getPassword().equals(admin.getPassword())) {
//            return "index"; // Redirect to the index page
//        } else {
//        	
//        	if(!user.getId().equals(admin.getId())) {
//                redirectAttributes.addFlashAttribute("error", "ID not found");
//        	} else if(user.getId().equals(admin.getId()) && !user.getPassword().equals(admin.getPassword())) {
//                redirectAttributes.addFlashAttribute("error", "Password wrong");
//        	}
//            return "redirect:/"; 
//        }
//        
//    }



    
//    @PostMapping("/home")
//  	public String login(Admin admin, RedirectAttributes redirectAttributes) {
//  	   Admin user = adminrepo.getById(admin.getId());
////  	    System.out.println(user);
//  	   
//  	   if(user != null && user.getPassword().equals(admin.getPassword())) {
//  	    	return "index";   
//  	    }
//  	    else {
//  	        redirectAttributes.addFlashAttribute("error", "Invalid username or password");
//  	        
//  	        return "redirect:/"; // Redirect back to the login page
//  	    }
//
//  	}
	
}
