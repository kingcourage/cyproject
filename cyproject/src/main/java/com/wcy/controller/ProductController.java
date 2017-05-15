package com.wcy.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.wcy.common.Dict;
import com.wcy.common.Result;
import com.wcy.pojo.Product;
import com.wcy.service.ProductService;

@Controller
@RequestMapping("product")
public class ProductController extends BaseController{
	
	@Resource
	private ProductService productService;
	
	@RequestMapping("/system/productList")
	public String ProductList(HttpServletRequest request) throws Exception{
		//获取商品信息
		List<Product> productlist = productService.getProducts();
		request.setAttribute("products",productlist);
		return "/system/productIndex";
	}
	
	@RequestMapping("/getAllProducts")
	@ResponseBody
	public List<Product> getAllProduct(HttpServletRequest request) throws Exception{
		List<Product> productlist = productService.getProducts();
		return productlist;
	}
	
	@RequestMapping("/system/getProducts")
	@ResponseBody
	public List<Product> getProducts(HttpServletRequest request,Integer categoryId) throws Exception{
		//获取商品信息
		List<Integer> categoryIdList = new ArrayList<Integer>();
		if(categoryId!=null){
			categoryIdList.add(categoryId);
		}
		List<Product> productlist = productService.getByNameAndCategoryIds(null, categoryIdList);
		return productlist;
	}
	
	@RequestMapping("/system/saveProduct")
	@ResponseBody
	public Result<Product> saveProduct(Product product,@RequestParam("image") CommonsMultipartFile file,HttpServletRequest request,HttpServletResponse response){
		try {
			String basepath = "H:/Users/wcy/git/cyproject/cyproject/WebContent/";
			//String basepath = request.getSession().getServletContext().getRealPath("/");
			System.out.println(basepath);
			String path="upload/"+new Date().getTime()+file.getOriginalFilename();
			File newFile=new File(basepath+path);
			//通过CommonsMultipartFile的方法直接写文件（注意这个时候）
			file.transferTo(newFile);
			product.setMainImage(path);
			int count = productService.saveProduct(product);
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
	
	
	@RequestMapping("/system/editProduct")
	@ResponseBody
	public Result<Product> editProduct(Product product,HttpServletRequest request,HttpServletResponse response){
		try {
			int count = productService.editProduct(product);
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
	
	@RequestMapping("/system/deleteProduct")
	@ResponseBody
	public Result<Product> deleteProduct(Product product,HttpServletRequest request,HttpServletResponse response){
		try {
			int count = productService.deleteProduct(product);
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
	
	@RequestMapping("/detail")
	public String detail(Integer id,HttpServletRequest request,HttpServletResponse response){
		try {
			Product product = new Product();
			product.setId(id);
			product = productService.getProductById(product);
			if(product!=null){
				request.setAttribute("product",product);
				result.setCode(Dict.ReturnCode.SUCCESS);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			result.setCode(Dict.ReturnCode.FAIL);
			e.printStackTrace();
		}
		return "shop/single";
	}
}
