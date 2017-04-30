package com.wcy.service;

import java.util.List;

import com.wcy.pojo.Cart;

public interface CartService {
	/**
	 * 添加购物车
	 * @author wcy
	 * @time 2017年4月30日下午4:38:25
	 */
	int add(Cart cart) throws Exception;
	
	/**
	 * 删除购物车
	 * @author wcy
	 * @time 2017年4月30日下午4:38:37
	 */
	int delete(Integer id) throws Exception;
	
	/**
	 * 显示购物车列表
	 * @author wcy
	 * @time 2017年4月30日下午4:38:49
	 */
	List<Cart> cartList(Integer userId) throws Exception;
}
