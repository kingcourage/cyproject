package com.wcy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wcy.dao.ShippingMapper;
import com.wcy.pojo.Shipping;
import com.wcy.service.ShippingService;

@Service("shippingService")
public class ShippingServiceImpl implements ShippingService {
	@Resource
	private ShippingMapper shippingMapper;
	
	@Override
	public int save(Shipping shipping) throws Exception {
		// TODO Auto-generated method stub
		return shippingMapper.insertSelective(shipping);
	}

	@Override
	public List<Shipping> getShipping(Integer userId) throws Exception {
		// TODO Auto-generated method stub
		return shippingMapper.selectByUserId(userId);
	}

	@Override
	public int delete(Integer id) throws Exception {
		// TODO Auto-generated method stub
		return shippingMapper.deleteByPrimaryKey(id);
	}

}
