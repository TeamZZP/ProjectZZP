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

	public int sum_money(String userid) {
		int sum = 0;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			sum = dao.sum_money(session,userid);
		} finally {
			session.close();
		}
		return sum;
	}

	public int cartAllDel(List<String> list) {
		 int n = 0;
		 SqlSession session = MySqlSessionFactory.getSqlSession();
		 try {
			n = dao.cartAllDel(session,list);
			session.commit();
		} finally {
			session.close();
		}
		return n;
	}



	public int checkCart(HashMap<String, Object> map) {
		int count = 0;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		 try {
			 count = dao.checkCart(session,map);
		} finally {
			session.close();
		}
		return count;
	}

	public void updateCart(CartDTO cart) {
		SqlSession session = MySqlSessionFactory.getSqlSession();
		 try {
			dao.updateCart(session,cart);
			session.commit();
		} finally {
			session.close();
		}
	
		
	}

	//장바구니 선택한 상품 List에 담기
	public CartDTO selectCart(HashMap<String, String> map) {
		CartDTO dto = null;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		 try {
			 dto = dao.selectCart(session,map);
		} finally {
			session.close();
		}
		 return dto;
	}

	
	
}
