package com.service;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dao.OrderDAO;
import com.dto.OrderDTO;

public class OrderService {
	OrderDAO dao;

	public OrderService() {
		super();
		dao = new OrderDAO();
	}
	public OrderDTO orders(String userid) {
		SqlSession session=MySqlSessionFactory.getSqlSession();
		OrderDTO dto=null;
		try {
			dto=dao.orders(session, userid);
		} finally {
			session.close();
		}
		return dto;
	}

}
