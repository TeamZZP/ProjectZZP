package com.dao;

import org.apache.ibatis.session.SqlSession;

public class UtilDAO {

	public int countVisitToday(SqlSession session) {
		return session.selectOne("UtilMapper.countVisitToday");
	}

	public int addVisit(SqlSession session) {
		return session.insert("UtilMapper.addVisit");
	}

}
