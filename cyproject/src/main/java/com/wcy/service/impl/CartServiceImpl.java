package com.wcy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wcy.dao.CartMapper;
import com.wcy.pojo.Cart;
import com.wcy.service.CartService;

@Service("cartService")
public class CartServiceImpl implements CartService {
	
	@Resource
	private CartMapper cartMapper;
	
	@Override
	public int add(Cart cart){
		return cartMapper.insertSelective(cart);
	}
	@Override
	public int delete(Integer id){
		return cartMapper.deleteByPrimaryKey(id);
	}
	@Override
	public List<Cart> cartList(Integer userId){
		return cartMapper.selectCartByUserId(userId);
	}
	
}
