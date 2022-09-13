package com.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dto.CartDTO;

public class CartDAO {

	public int cartAdd(SqlSession session, CartDTO cart) {
		int num = session.insert("CartMapper.cartAdd", cart);
		return num;
	}

	public List<CartDTO> cartList(SqlSession session, String userid) {
		List<CartDTO> list = session.selectList("cartList", userid);
		return list;
	}

	public int cartDel(SqlSession session, int cart_id) {
		int num = session.delete("cartDel",cart_id);
		return num;
	}

	public int cartUpdate(SqlSession session, HashMap<String, Object> map) {
		int num  = session.update("cartUpdate",map);
		return num;
	}

	public int cartCount(SqlSession session, String userid) {
		int num = session.selectOne("cartCount",userid);
		return num;
	}

	public int sum_money(SqlSession session, String userid) {
		int sum = session.selectOne("sum_money",userid);
		return sum;
	}

	public int cartAllDel(SqlSession session, List<String> list) {
		int n = session.delete("CartMapper.cartAllDel",list);
		return n;
	}


	public int updateCart(SqlSession session, int p_id) {
		int n = session.update("updateCart",p_id);
		return n;
	}
	
	public int checkCart(SqlSession session, HashMap<String, Object> map) {
		int count = session.selectOne("checkCart",map);
		return count;
	}

	public void updateCart(SqlSession session, CartDTO cart) {
		session.update("updateCart",cart);
		
	}

	//선택한 상품 주문하기
	public CartDTO selectCart(SqlSession session, HashMap<String, String> map) {
		CartDTO dto = session.selectOne("selectCart",map);
		return dto;
	}
	
}
