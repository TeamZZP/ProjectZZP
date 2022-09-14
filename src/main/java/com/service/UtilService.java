package com.service;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dao.UtilDAO;

public class UtilService {
	
	UtilDAO dao = new UtilDAO();

	public int countVisitToday() {
		int n = 0;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			n = dao.countVisitToday(session);
		} finally {
			session.close();
		}
		return n;
	}

	public int addVisit() {
		int n = 0;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			n = dao.addVisit(session);
			session.commit();
		} finally {
			session.close();
		}
		return n;
	}

	public int updateVisit() {
		int n = 0;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			n = dao.updateVisit(session);
			session.commit();
		} finally {
			session.close();
		}
		return n;
	}

	public int countVisitYesterday() {
		int n = 0;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			n = dao.countVisitYesterday(session);
		} finally {
			session.close();
		}
		return n;
	}


}
