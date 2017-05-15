package com.wcy.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wcy.common.Result;
import com.wcy.pojo.Shipping;
import com.wcy.pojo.User;
import com.wcy.service.ShippingService;
import com.wcy.service.UserService;
import com.wcy.util.CurrentUserUtil;

@Controller
@RequestMapping("/user")
public class UserController extends BaseController{
	
	@Resource
	private UserService userService;
	
	@Resource
	private ShippingService shippingService;
	
	/**
	 * 用户注册
	 * @author wcy
	 * @time 2017年4月20日下午8:55:40
	 */
	@RequestMapping(value="/saveUser")
	@ResponseBody
	public Result<User> saveUser(User user,HttpServletRequest request,HttpServletResponse response) throws IOException{
		String username = request.getParameter("username");
		int resultcount = 0;
		try{
			resultcount	 = userService.saveUser(user);
		}catch(Exception e){
			e.printStackTrace();
		}
		if(resultcount>0){
			result.setMsg("success");
		}else{
			result.setMsg("fail");
		}
		return result;
	}
	
	@RequestMapping(value="/login")
	@ResponseBody
	public Result<User> login(String username,String password,HttpServletRequest request,HttpServletResponse response){
		if(StringUtils.isNotBlank(username)&&StringUtils.isNotBlank(password)){
			try {
				User user = userService.login(username, password);
				if(user!=null){
					result.setMsg("success");
					HttpSession session = request.getSession();
					session.setAttribute("CURRENT_USER",user);
					
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else{
			result.setMsg("fail");
		}
		return result;
	}
	
	
	/**
	 * 后台用户管理界面
	 * @return
	 */
	@RequestMapping("/system/index")
	public String userIndex(){
		return "system/user";
	}
	
	@RequestMapping(value="/system/login")
	@ResponseBody
	public Result<User> slogin(String username,String password,HttpServletRequest request,HttpServletResponse response){
		if(StringUtils.isNotBlank(username)&&StringUtils.isNotBlank(password)){
			try {
				User user = userService.login(username, password);
				if(user!=null){
					result.setMsg("success");
					HttpSession session = request.getSession();
					session.setAttribute("CURRENT_USER",user);
					
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else{
			result.setMsg("fail");
		}
		return result;
	}
	
	@RequestMapping("/system/getAllUser")
	@ResponseBody
	public List<User> getAllUser(){
		return userService.getAllUser();
	}
	
	/**
	 * 前台用户信息界面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("/shop/index")
	public String userIndexShop(HttpServletRequest request,HttpServletResponse response) throws Exception{
		User user = CurrentUserUtil.getCurrentUser(request);
		if (user == null) {
			return "shop/account";
		}
		request.setAttribute("user",user);
		List<Shipping> shippings = shippingService.getShipping(user.getId());
		request.setAttribute("shippings",shippings);
		
		return "shop/user";
	}
}
