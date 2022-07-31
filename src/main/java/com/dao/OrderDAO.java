package com.dao;

import org.apache.ibatis.session.SqlSession;

import com.dto.OrderDTO;

public class OrderDAO {

	public OrderDTO orders(SqlSession session, String userid) {
		OrderDTO dto=session.selectOne("OrderMapper.orders", userid);
		return dto;
	}

}
