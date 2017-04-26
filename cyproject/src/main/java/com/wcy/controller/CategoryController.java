package com.wcy.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wcy.common.Dict;
import com.wcy.common.Result;
import com.wcy.pojo.Category;
import com.wcy.service.CategoryService;

@Controller
@RequestMapping("/category")
public class CategoryController extends BaseController{
	
	@Resource
	private CategoryService categoryService;
	
	
	@RequestMapping("/index")
	public String index(Integer parentId,HttpServletRequest request,HttpServletResponse response){
		return "system/categoryIndex";
	}
	
	@RequestMapping("/category")
	public String category(Integer parentId,HttpServletRequest request,HttpServletResponse response){
		return "system/category";
	}
	
	
	@RequestMapping("/getAllCategory")
	@ResponseBody
	public List<Category> getAllCategory(Integer parentId,HttpServletRequest request,HttpServletResponse response){
		List<Category> categorys = new ArrayList<Category>();;
		try {
			categorys = categoryService.getAllCategory();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return categorys;
	}
	
	@RequestMapping("/getCategory")
	@ResponseBody
	public List<Category> getCategory(Integer parentId,HttpServletRequest request,HttpServletResponse response){
		List<Category> categorys = new ArrayList<Category>();;
		try {
			categorys = categoryService.getCategoryByParentid(parentId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return categorys;
	}
	

	@RequestMapping("/saveCategory")
	@ResponseBody
	public Result<Category> saveCategory(Category category,HttpServletRequest request,HttpServletResponse response){
		try {
			int count = categoryService.saveCategory(category);
			if(count>0){
				result.setCode(Dict.ReturnCode.SUCCESS);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			result.setCode(Dict.ReturnCode.FAIL);
			e.printStackTrace();
		}
		return result;
	}
	
	@RequestMapping("/editCategory")
	@ResponseBody
	public Result<Category> editCategory(Category category,HttpServletRequest request,HttpServletResponse response){
		try {
			int count = categoryService.editCategory(category);
			if(count>0){
				result.setCode(Dict.ReturnCode.SUCCESS);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			result.setCode(Dict.ReturnCode.FAIL);
			e.printStackTrace();
		}
		return result;
	}
	
	@RequestMapping("/deleteCategory")
	@ResponseBody
	public Result<Category> deleteCategory(Category category,HttpServletRequest request,HttpServletResponse response){
		try {
			int count = categoryService.deleteCategory(category);
			if(count>0){
				result.setCode(Dict.ReturnCode.SUCCESS);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			result.setCode(Dict.ReturnCode.FAIL);
			e.printStackTrace();
		}
		return result;
	}
}
