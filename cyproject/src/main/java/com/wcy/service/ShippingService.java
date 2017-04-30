package com.wcy.service;

import java.util.List;

import com.wcy.pojo.Shipping;

public interface ShippingService {
	/**
	 * 保存收货地址信息
	 * @param shipping
	 * @return
	 * @throws Exception
	 */
	public int save(Shipping shipping) throws Exception;
	
	/**
	 * 得到用户的收货地址信息
	 * @author wcy
	 * @time 2017年4月30日下午3:06:23
	 */
	public List<Shipping> getShipping(Integer userId) throws Exception;
	
	/**
	 * 通过id删除收货地址信息
	 * @author wcy
	 * @time 2017年4月30日下午3:07:53
	 */
	public int delete(Integer id) throws Exception;
}
