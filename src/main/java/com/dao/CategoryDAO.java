package com.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

public class CategoryDAO {

	

	public int getCount(SqlSession session) {
		int count = session.selectOne("getCount");
		return count;
	}

	public String categoryName(SqlSession session, int i) {
		String c_name = session.selectOne("categoryName",i);
		return c_name;
	}

}
