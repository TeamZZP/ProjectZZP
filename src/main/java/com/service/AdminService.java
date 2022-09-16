package com.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dao.AdminDAO;
import com.dto.MemberDTO;
import com.dto.PageDTO;
import com.dto.ProductOrderDTO;
import com.dto.QuestionDTO;

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

	public List<ProductOrderDTO> selectNewOrders(HashMap<String, String> map) {
		List<ProductOrderDTO> list = null;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			list = dao.selectNewOrders(session, map);
		} finally {
			session.close();
		}
		return list;
	}

	public List<MemberDTO> selectNewMembers(HashMap<String, String> map) {
		List<MemberDTO> list = null;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			list = dao.selectNewMembers(session, map);
		} finally {
			session.close();
		}
		return list;
	}

	public List<QuestionDTO> selectNewQuestion() {
		List<QuestionDTO> list = null;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			list = dao.selectNewQuestion(session);
		} finally {
			session.close();
		}
		return list;
	}

}
