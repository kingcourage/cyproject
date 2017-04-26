package com.wcy.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wcy.pojo.Category;
import com.wcy.pojo.Product;
import com.wcy.service.CategoryService;
import com.wcy.service.ProductService;

@Controller
public class IndexController{
	@Resource
	private CategoryService categorytService;
	
	@Resource
	private ProductService productService;
	
	@RequestMapping("/")
	public String index(HttpServletResponse response,HttpServletRequest request) throws Exception{
		//获取分类信息
		List<Category> categoryList = categorytService.getCategoryByParentid(0);
		request.setAttribute("categorys",categoryList);
		
		//获取商品信息
		List<Product> productlist = productService.getProducts();
		request.setAttribute("products",productlist);
		return "shop/index";
	}
	
	@RequestMapping("/register")
	public String register(){
		return "shop/register";
	}
	
	@RequestMapping("/login")
	public String login(){
		return "shop/account";
	}
	
	@RequestMapping("/admin/index")
	public String adminIndex(){
		return "system/index";
	}
}	
