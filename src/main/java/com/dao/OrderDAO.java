package com.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dto.CategoryProductDTO;
import com.dto.OrderDTO;

public class OrderDAO {

	public OrderDTO selectOrders(SqlSession session, String userid) {
		OrderDTO dto=session.selectOne("OrderMapper.selectOrders", userid);
		System.out.println(dto);
		return dto;
	}

	public List<CategoryProductDTO> getProduct(SqlSession session, int p_id) {
		List<CategoryProductDTO> list = session.selectList("OrderMapper.getProduct", p_id);
		return list;
	}

}
