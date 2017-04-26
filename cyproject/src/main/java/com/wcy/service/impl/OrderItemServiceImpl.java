package com.wcy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wcy.dao.OrderItemMapper;
import com.wcy.pojo.OrderItem;
import com.wcy.service.OrderItemService;

@Service("orderItemService")
public class OrderItemServiceImpl  implements OrderItemService{
	
	@Resource
	private OrderItemMapper orderItemMapper;
	
	@Override
	public int addOrderItem(OrderItem orderItem) throws Exception {
		// TODO Auto-generated method stub
		return orderItemMapper.insertSelective(orderItem);
	}

	@Override
	public List<OrderItem> orderItemList(Long orderNo) throws Exception {
		// TODO Auto-generated method stub
		return orderItemMapper.getByOrderNo(orderNo);
	}

	
}
