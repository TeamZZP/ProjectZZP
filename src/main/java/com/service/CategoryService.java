package com.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dao.CategoryDAO;

public class CategoryService {
	
	CategoryDAO dao = new CategoryDAO();

	public List<String> allCategoryId() {
		List<String> list = null;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			list = dao.allCategoryId(session);
		}finally {
			session.close();
		}

		return list;
	}

	

}
