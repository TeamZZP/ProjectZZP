package com.service;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dao.CouponDAO;
import com.dto.PageDTO;

public class CouponService {
	
	CouponDAO dao;
	
	public CouponService() {
		super();
		dao = new CouponDAO();
	}

	public PageDTO selectCoupon(HashMap<String, String> map, int curPage) {
		SqlSession session = MySqlSessionFactory.getSqlSession();
		PageDTO dto = null;
		try {
			dto = dao.selectCoupon(session, map, curPage);
		} finally {
			session.close();
		}
		return dto;
	}

}
