package com.wcy.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wcy.dao.OrderMapper;
import com.wcy.pojo.Order;
import com.wcy.pojo.OrderModel;
import com.wcy.service.OrderService;

@Service("orderService")
public class OrderServiceImpl implements OrderService{
	
	@Resource
	private OrderMapper orderMapper;	
	
	@Override
	public List<Order> orderList(Integer userId) throws Exception {
		// TODO Auto-generated method stub
		return orderMapper.selectByUserId(userId);
	}

	@Override
	public int addOrder(Order order) throws Exception {
		// TODO Auto-generated method stub
		Long nowLong = Long.parseLong(new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date()));
		order.setOrderNo(nowLong);
		return orderMapper.insertSelective(order);
	}

	@Override
	public Order selectById(Integer id) throws Exception {
		// TODO Auto-generated method stub
		return orderMapper.selectByPrimaryKey(id);
	}

	@Override
	public Order selectByUserIdAndOrderNo(Integer userId, Long orderNo) {
		// TODO Auto-generated method stub
		return orderMapper.selectByUserIdAndOrderNo(userId, orderNo);
	}

	@Override
	public List<Order> getAllOrder() {
		// TODO Auto-generated method stub
		return orderMapper.selectAllOrder();
	}

}
