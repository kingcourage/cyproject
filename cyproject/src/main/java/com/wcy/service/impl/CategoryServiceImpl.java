package com.wcy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wcy.dao.CategoryMapper;
import com.wcy.pojo.Category;
import com.wcy.service.CategoryService;

@Service("categoryService")
public class CategoryServiceImpl implements CategoryService {
	
	@Resource
	private CategoryMapper categoryMapper;
	
	@Override
	public List<Category> getCategoryByParentid(Integer parentId) {
		// TODO Auto-generated method stub
		return categoryMapper.selectCategoryChildrenByParentId(parentId);
	}

	@Override
	public List<Category> getAllCategory() throws Exception {
		// TODO Auto-generated method stub
		return categoryMapper.selectAllCategory();
	}

	@Override
	public int deleteCategory(Category category) throws Exception {
		// TODO Auto-generated method stub
		return categoryMapper.deleteByPrimaryKey(category.getId());
	}

	@Override
	public int saveCategory(Category category) throws Exception {
		// TODO Auto-generated method stub
		return categoryMapper.insertSelective(category);
	}

	@Override
	public int editCategory(Category category) throws Exception {
		// TODO Auto-generated method stub
		return categoryMapper.updateByPrimaryKeySelective(category);
	}

}
