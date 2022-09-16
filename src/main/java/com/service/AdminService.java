package com.service;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dao.AdminDAO;
import com.dto.PageDTO;

public class AdminService {
	
	AdminDAO dao = new AdminDAO();

	public PageDTO selectAllOrders(HashMap<String, String> map, int curPage) {
		PageDTO pDTO = null;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			pDTO = dao.selectAllOrders(session, map, curPage);
		} finally {
			session.close();
		}
		return pDTO;
	}

	public int updateOrder(HashMap<String, String> map) {
		int n = 0; 
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			n = dao.updateOrder(session, map);
			session.commit();
		} finally {
			session.close();
		}
		return n;
	}

}
