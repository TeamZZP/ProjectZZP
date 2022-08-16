package com.dao;

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
	
}
