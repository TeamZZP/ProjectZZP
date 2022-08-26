package com.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dao.ReviewDAO;
import com.dto.ReviewDTO;
import com.dto.ReviewProfileDTO;

public class ReviewService {
	
	ReviewDAO dao;
	
	
	public ReviewService() {
		dao = new ReviewDAO();
	}



	public List<ReviewProfileDTO> review(String p_ID) {
		List<ReviewProfileDTO> list =null;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			list = dao.review(session, p_ID);
		} finally {
			session.close();
		}
		return list;
	}

}
