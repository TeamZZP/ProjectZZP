package com.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dao.CouponDAO;
import com.dto.CouponDTO;
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

	public int couponInsert(CouponDTO cDTO) {
		SqlSession session = MySqlSessionFactory.getSqlSession();
		int num = 0;
		try {
			num = dao.couponInsert(session, cDTO);
			session.commit();
		} finally {
			session.close();
		}
		return num;
	}

	public int couponDelete(String coupon_id) {
		SqlSession session = MySqlSessionFactory.getSqlSession();
		int num = 0;
		try {
			num = dao.couponDelete(session, coupon_id);
			session.commit();
		} finally {
			session.close();
		}
		return num;
	}

	public int couponAllDel(List<String> couponList) {
		SqlSession session = MySqlSessionFactory.getSqlSession();
		int num = 0;
		try {
			num = dao.couponAllDel(session, couponList);
			session.commit();
		} finally {
			session.close();
		}
		return num;
	}

	public CouponDTO selectOneCoupon(String coupon_id) {
		SqlSession session = MySqlSessionFactory.getSqlSession();
		CouponDTO cDTO = null;
		try {
			cDTO = dao.selectOneCoupon(session, coupon_id);
			session.commit();
		} finally {
			session.close();
		}
		return cDTO;
	}

	public int couponUpdate(CouponDTO dto) {
		SqlSession session = MySqlSessionFactory.getSqlSession();
		int num = 0;
		try {
			num = dao.couponUpdate(session, dto);
			session.commit();
		} finally {
			session.close();
		}
		return num;
	}

	public PageDTO myCouponList(int curPage, String userid) {
		SqlSession session = MySqlSessionFactory.getSqlSession();
		PageDTO dto = null;
		try {
			dto = dao.myCouponList(session, userid, curPage);
			session.commit();
		} finally {
			session.close();
		}
		return dto;
	}

	public PageDTO MyCouponSearchList(int curPage, Map<String, String> map) {
		SqlSession session = MySqlSessionFactory.getSqlSession();
		PageDTO dto = null;
		try {
			dto = dao.MyCouponSearchList(session, map, curPage);
			session.commit();
		} finally {
			session.close();
		}
		return dto;
	}

}
