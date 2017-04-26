package com.wcy.service;

import java.util.List;

import com.wcy.pojo.OrderItem;

public interface OrderItemService {
	/**
	 * 添加订单详情
	 * @author wcy
	 * @time 2017年4月25日下午5:57:42
	 */
	public int addOrderItem(OrderItem orderItem) throws Exception;
	
	/**
	 * 查看订单详情列表
	 * @author wcy
	 * @time 2017年4月25日下午5:58:51
	 */
	public List<OrderItem> orderItemList(Long orderNo) throws Exception;
}
