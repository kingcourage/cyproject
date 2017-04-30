package com.wcy.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wcy.common.Dict;
import com.wcy.common.Result;
import com.wcy.pojo.Cart;
import com.wcy.pojo.CartModel;
import com.wcy.pojo.Product;
import com.wcy.pojo.User;
import com.wcy.service.CartService;
import com.wcy.service.ProductService;
import com.wcy.util.CurrentUserUtil;

@Controller
@RequestMapping("/cart")
public class CartController extends BaseController {
	
	@Resource
	private CartService cartService;
	
	@Resource
	private ProductService productService;
	
	@RequestMapping("/index")
	public String index(HttpServletRequest request) throws Exception{
		User user = CurrentUserUtil.getCurrentUser(request);
		if (user == null) {
			return "shop/account";
		}
		List<Cart> carts =  cartService.cartList(user.getId());
		List<CartModel> cartModels = new ArrayList();
		for(Cart cart : carts){
			Product product = new Product();
			product.setId(cart.getProductId());
			product = productService.getProductById(product);
			CartModel cartModel = new CartModel();
			BeanUtils.copyProperties(cart, cartModel);
			cartModel.setProductName(product.getName());
			cartModel.setProductImage(product.getMainImage());
			cartModel.setProductPrice(product.getPrice());
			cartModels.add(cartModel);
		}
		request.setAttribute("cartModels",cartModels);
		return "shop/cart";
	}
	
	@RequestMapping("add/{productId}")
	public String add(HttpServletRequest request,HttpServletResponse response,@PathVariable Integer productId) throws Exception{
		User user = CurrentUserUtil.getCurrentUser(request);
		if (user == null) {
			return "shop/account";
		}
		Cart cart = new Cart();
		cart.setProductId(productId);
		cart.setUserId(user.getId());
		cartService.add(cart);
		return "redirect:/cart/index";
	}
	
	@RequestMapping("/delete")
	public Result<Cart> delete(Integer id){
		try {
			int count = cartService.delete(id);
			if(count >0){
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
