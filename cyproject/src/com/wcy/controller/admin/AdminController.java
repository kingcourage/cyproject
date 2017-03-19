package com.wcy.controller.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.wcy.pojo.Admin;
import com.wcy.service.admin.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Resource
	private AdminService adminService;
	
	@RequestMapping("/login")
	public void Login(Admin admin,HttpServletRequest request,Model model,HttpServletResponse response){
		try {
			PrintWriter out = response.getWriter();
			Admin ad = adminService.login(admin);
			if(ad!=null){
				request.setAttribute("admin", ad);
				HttpSession session = request.getSession();
				session.setAttribute("admin",ad);
				model.addAttribute("ad", ad);
			}else{
				out.print(0);
			}
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	@RequestMapping("/index")
	public String index(Admin admin,HttpServletRequest request,Model model){		
		return "index";
	}
	
	@RequestMapping("/register")
	public ModelAndView Register(Admin admin,HttpServletRequest request){
		Admin ad = adminService.register(admin);
		request.setAttribute("admin", ad);
		return new ModelAndView("index","admin",ad);
	}
	
	@RequestMapping("/deleteAdmin")
	public void deleteAdmin(Admin admin,HttpServletRequest request,HttpServletResponse response){
		String id  = request.getParameter("id");
		if(id!=null&&!"".equals(id)){
			admin.setId(Integer.parseInt(id));
		}
		try {
			PrintWriter out = response.getWriter();
			int a = adminService.deleteAdmin(admin);
			if(a>0){
				out.print("success");
			}else{
				out.print("fail");
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
	}

	@RequestMapping("/manageusers")
	public String Manageusers(Admin admin,HttpServletRequest request){
		return "system/menu";
	}
	
	@ResponseBody
	@RequestMapping("/getAllUsers")
	public List<Admin> getAllUsers(){
		
		return adminService.getAllUsers();
	}
	
	
	@RequestMapping("/visualization")
	public String visualization(Admin admin,HttpServletRequest request){
		
		return "visualization";
	}
	
	@RequestMapping("/maps")
	public String maps(Admin admin,HttpServletRequest request){
	
		return "maps";
	}
	
	@RequestMapping("/preferences")
	public String preferences(Admin admin,HttpServletRequest request){
		
		return "preferences";
	}
}
