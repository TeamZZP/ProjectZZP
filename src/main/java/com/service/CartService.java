package com.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dao.CartDAO;
import com.dto.CartDTO;

public class CartService {
	
	CartDAO dao;

	public CartService() {
		dao = new CartDAO();
	}

	public int cartAdd(CartDTO cart) {
		int num = 0;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			num = dao.cartAdd(session,cart);
			session.commit();
		} finally {
			session.close();
		}
		return num;
	}

	public List<CartDTO> cartList(String userid) {
		List<CartDTO> list = null;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			list = dao.cartList(session,userid);
		} finally {
			session.close();
		}
		return list;
	}

	public int cartDel(int cart_id) {
		int num = 0;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			num = dao.cartDel(session,cart_id);
			session.commit();
		} finally {
			session.close();
		}
		return num;
	}

	public int cartUpdate(HashMap<String, Object> map) {
		int num = 0;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			num = dao.cartUpdate(session,map);
			session.commit();
		} finally {
			session.close();
		}
		return num;
	}

	public int cartCount(String userid) {
		int num = 0;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			num = dao.cartCount(session,userid);
		} finally {
			session.close();
		}
		return num;
	}
	
	
}
