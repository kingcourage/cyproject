package com.wcy.pojo;

import java.util.List;

public class OrderModel extends Order {
	
	public List<OrderItem> getOrderItemList() {
		return orderItemList;
	}

	public void setOrderItemList(List<OrderItem> orderItemList) {
		this.orderItemList = orderItemList;
	}

	private  List<OrderItem> orderItemList;
}
