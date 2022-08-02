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



	public List<ReviewDTO> reviewAll() {
		List<ReviewDTO> list =null;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			list = dao.reviewAll(session);
		} finally {
			session.close();
		}
		return list;
	}

}