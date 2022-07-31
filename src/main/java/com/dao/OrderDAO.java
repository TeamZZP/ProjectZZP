package com.dao;

import org.apache.ibatis.session.SqlSession;

import com.dto.OrderDTO;

public class OrderDAO {

	public OrderDTO selectOrders(SqlSession session, String userid) {
		OrderDTO dto=session.selectOne("OrderMapper.selectOrders", userid);
		System.out.println(dto);
		return dto;
	}

}
