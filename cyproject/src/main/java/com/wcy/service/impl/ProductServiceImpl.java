package com.wcy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wcy.dao.ProductMapper;
import com.wcy.pojo.Product;
import com.wcy.service.ProductService;

@Service("productService")
public class ProductServiceImpl implements ProductService{
	
	@Resource
	private ProductMapper productMapper;
	
	@Override
	public List<Product> getProducts() throws Exception {
		// TODO Auto-generated method stub
		return productMapper.selectList();
	}
	
	@Override
	public List<Product> getByNameAndProductId(String productName, Integer productId) throws Exception {
		// TODO Auto-generated method stub
		return productMapper.selectByNameAndProductId(productName, productId);
	}
	
	
	@Override
	public List<Product> getByNameAndCategoryIds(String productName, List<Integer> categoryIdList) throws Exception {
		// TODO Auto-generated method stub
		return productMapper.selectByNameAndCategoryIds(productName, categoryIdList);
	}

	@Override
	public int saveProduct(Product product) throws Exception {
		// TODO Auto-generated method stub
		return productMapper.insertSelective(product);
	}
	
	@Override
	public int editProduct(Product product) throws Exception {
		// TODO Auto-generated method stub
		return productMapper.updateByPrimaryKey(product);
	}

	@Override
	public int deleteProduct(Product product) throws Exception {
		// TODO Auto-generated method stub
		return productMapper.deleteByPrimaryKey(product.getId());
	}

	@Override
	public Product getProductById(Product product) throws Exception {
		// TODO Auto-generated method stub
		return productMapper.selectByPrimaryKey(product.getId());
	}
}
