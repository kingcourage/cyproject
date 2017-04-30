package com.wcy.service;

import java.util.List;

import com.wcy.pojo.Order;
import com.wcy.pojo.OrderModel;

public interface OrderService {
	
	public List<Order> orderList(Integer userId) throws Exception;
	
	public int addOrder(Order order) throws Exception;
	
	public Order selectById(Integer id) throws Exception;
	
	public Order selectByUserIdAndOrderNo(Integer userId,Long orderNo);
	
	/**
	 * 返回所有的订单信息
	 * @return
	 */
	public List<Order> getAllOrder();
	
	/**
	 * 更新订单信息
	 * @author wcy
	 * @time 2017年4月30日下午6:01:46
	 */
	int update(Order order) throws Exception ;
}
