package com.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

public class CategoryDAO {

	public List<String> allCategoryId(SqlSession session) {
		List<String> list = session.selectList("allCategoryId");
		return list;
	}

}
