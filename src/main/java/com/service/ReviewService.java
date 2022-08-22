package com.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dao.ReviewDAO;
import com.dto.ReviewDTO;

public class ReviewService {
	
	ReviewDAO dao;
	
	
	public ReviewService() {
		dao = new ReviewDAO();
	}



	public List<ReviewDTO> review(String p_ID) {
		List<ReviewDTO> list =null;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			list = dao.review(session, p_ID);
		} finally {
			session.close();
		}
		return list;
	}

}
