package com.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dao.CategoryDAO;

public class CategoryService {
	
	CategoryDAO dao = new CategoryDAO();

	

	public int getCount() {
		int count =0;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			count = dao.getCount(session);
		}finally {
			session.close();
		}

		return count;
	}



	public String categoryName(int i) {
		String c_name = null;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			c_name = dao.categoryName(session, i);
		}finally {
			session.close();
		}

		return c_name;
	}

	

}
