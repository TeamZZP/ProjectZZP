package com.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dao.OrderDAO;
import com.dto.CategoryProductDTO;
import com.dto.ImagesDTO;
import com.dto.OrderDTO;
import com.dto.PageDTO;

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


	
	
	
	public List<CategoryProductDTO>  getProductList(List<Integer> pIdList) {
		SqlSession session=MySqlSessionFactory.getSqlSession();
		List<CategoryProductDTO> list = null;
        try {
        	list = dao.getProductList(session, pIdList);
        }finally {
        	session.close();
        }
		return list;
	}
	public int addOrder(OrderDTO orderdto) {
		SqlSession session=MySqlSessionFactory.getSqlSession();
		int n = 0;
		try {
			n = dao.addOrder(session, orderdto);
			session.commit();
		}finally {
			session.close();
		}
		return n;
	}
	public int getOrderid() {
		SqlSession session=MySqlSessionFactory.getSqlSession();
        int n = 0;
        try {
        	n = dao.getOrderid(session);
        }finally {
        	session.close();
        }
		return n;
	}
	public PageDTO MyOrderList(int curPage, String userid) {
		SqlSession session = MySqlSessionFactory.getSqlSession();
		PageDTO dto = null;
		try {
			dto = dao.MyOrderList(session, curPage, userid);
		} finally {
			session.close();
		}
		return dto;
	}
	
	
	
}
