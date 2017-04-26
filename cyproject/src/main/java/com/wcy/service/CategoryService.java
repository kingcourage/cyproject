package com.wcy.service;

import java.util.List;

import com.wcy.pojo.Category;

public interface CategoryService {
	
	/**
	 * 根据父级节点id获取其下面的所有节点
	 * @author wcy
	 * @time 2017年4月20日下午9:31:33
	 */
	public List<Category> getCategoryByParentid(Integer parentId) throws Exception;
	
	public List<Category> getAllCategory() throws Exception;
	
	public int deleteCategory(Category category) throws Exception;
	
	public int saveCategory(Category category) throws Exception;
	
	public int editCategory(Category category) throws Exception;
}
