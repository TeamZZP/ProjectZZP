package com.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dao.ReviewDAO;
import com.dto.PageDTO;
import com.dto.ProductOrderReviewDTO;
import com.dto.ReviewDTO;
import com.dto.ReviewProductDTO;
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

	public PageDTO selectUserReview(HashMap<String, String> map, int curPage, int perPage) {
		PageDTO pDTO = null;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			pDTO = dao.selectUserReview(session, map, curPage, perPage);
		} finally {
			session.close();
		}
		return pDTO;
	}

	public int countTotalUserReview(HashMap<String, String> map) {
		int n = 0;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			n = dao.countTotalUserReview(session, map);
		} finally {
			session.close();
		}
		return n;
	}

	public HashMap<String, String> selectOneProduct(int p_ID) {
		HashMap<String, String> map = null;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			map = dao.selectOneProduct(session, p_ID);
		} finally {
			session.close();
		}
		return map;
	}



	public int reviewInsert(HashMap<String, String> map) {
		int num = 0;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			num = dao.reviewInsert(session, map);
			session.commit();
		} finally {
			session.close();
		}
		return num;
	}



	public ReviewDTO orderIDreivewCheck(Map<String, String> map) {
		SqlSession session = MySqlSessionFactory.getSqlSession();
		ReviewDTO dto = null;
		try {
			dto = dao.orderIDreivewCheck(session, map);
		} finally {
			session.close();
		}
		return dto;
	}



	public ProductOrderReviewDTO selectOneReview(Map<String, String> map) {
		SqlSession session = MySqlSessionFactory.getSqlSession();
		ProductOrderReviewDTO dto = null;
		try {
			dto = dao.selectOneReview(session, map);
		} finally {
			session.close();
		}
		return dto;
	}



	public int reviewUpdate(HashMap<String, String> map) {
		SqlSession session = MySqlSessionFactory.getSqlSession();
		int num = 0;
		try {
			num = dao.reviewUpdate(session, map);
			session.commit();
		} finally {
			session.close();
		}
		return num;
	}



	public int reviewDelete(Map<String, String> map) {
		int num = 0;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			num = dao.reviewDelete(session, map);
			session.commit();
		} finally {
			session.close();
		}
		return num;
	}

}
