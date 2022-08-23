package com.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dao.OrderDAO;
import com.dto.CategoryProductDTO;
import com.dto.OrderDTO;

public class OrderService {
	OrderDAO dao;

	public OrderService() {
		super();
		dao = new OrderDAO();
	}
	public OrderDTO selectOrders(String userid) {
		SqlSession session=MySqlSessionFactory.getSqlSession();
		OrderDTO dto=null;
		try {
			dto=dao.selectOrders(session, userid);
		} finally {
			session.close();
		}
		System.out.println(dto);
		return dto;
	}
	public List<CategoryProductDTO> getProduct(int p_id) {
		SqlSession session=MySqlSessionFactory.getSqlSession();
        List<CategoryProductDTO> list = null;
        try {
        	list = dao.getProduct(session, p_id);
        }finally {
        	session.close();
        }
		return list;
	}

}
