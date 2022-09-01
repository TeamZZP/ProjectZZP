package com.dao;

import java.util.HashMap;
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
		System.out.println(list);
		return list;
	}

	public int likeCheck(SqlSession session, HashMap<String, String> map) {
		return session.selectOne("likeCheck",map);
		 
	}

}
