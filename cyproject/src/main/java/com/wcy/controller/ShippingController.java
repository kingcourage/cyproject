package com.wcy.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wcy.common.Dict;
import com.wcy.common.Result;
import com.wcy.pojo.Shipping;
import com.wcy.service.ShippingService;

@Controller
@RequestMapping("/shipping")
public class ShippingController extends BaseController{
	
	@Resource
	private  ShippingService shippingService;
	
	@RequestMapping("/add")
	public String addShipping(){
		return "shop/address";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/save")
	@ResponseBody
	public Result<Shipping> save(HttpServletResponse response,HttpServletRequest request,Shipping shipping){
		try {
			int count = shippingService.save(shipping);
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
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/delete")
	@ResponseBody
	public Result<Shipping> delete(HttpServletResponse response,HttpServletRequest request,Integer id){
		try {
			int count = shippingService.delete(id);
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
