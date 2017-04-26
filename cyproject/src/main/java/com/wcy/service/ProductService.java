package com.wcy.service;

import java.util.List;

import com.wcy.pojo.Product;

public interface ProductService {
	
	/**
	 * 获取商品列表
	 * @author wcy
	 * @time 2017年4月20日下午11:45:31
	 */
	public List<Product> getProducts() throws Exception;
	
	
	/**
	 * 保存商品信息
	 * @author wcy
	 * @time 2017年4月21日下午12:32:35
	 */
	public int saveProduct(Product product) throws Exception;
	
	/**
	 * 更新商品信息
	 * @author wcy
	 * @time 2017年4月21日下午12:42:44
	 */
	public int editProduct(Product product) throws Exception;

	
	/**
	 * 删除商品信息
	 * @author wcy
	 * @time 2017年4月21日下午1:05:02
	 */
	public int deleteProduct(Product product) throws Exception;

	
	/**
	 * 通过商品名称和商品id获取
	 * @author wcy
	 * @time 2017年4月21日下午2:14:41
	 */
	List<Product> getByNameAndProductId(String productName, Integer productId)throws Exception;

	
	/**
	 * 通过分类id获取
	 * @author wcy
	 * @time 2017年4月21日下午5:42:59
	 */
	List<Product> getByNameAndCategoryIds(String productName, List<Integer> categoryIdList) throws Exception;


	Product getProductById(Product product) throws Exception;
}
