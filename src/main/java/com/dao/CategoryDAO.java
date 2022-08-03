package com.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dto.CategoryDTO;

public class CategoryDAO {

	

	public int getCount(SqlSession session) {
		int count = session.selectOne("getCount");
		return count;
	}

	public String categoryName(SqlSession session, int i) {
		String c_name = session.selectOne("categoryName",i);
		return c_name;
	}

	public List<CategoryDTO> allCategory(SqlSession session) {
		List<CategoryDTO> list = session.selectList("allCategory");
		return list;
	}

}
