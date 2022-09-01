package com.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dto.CategoryProductDTO;
import com.dto.ImagesDTO;
import com.dto.OrderDTO;

public class OrderDAO {

	public OrderDTO selectOrders(SqlSession session, String userid) {
		OrderDTO dto=session.selectOne("OrderMapper.selectOrders", userid);
		System.out.println(dto);
		return dto;
	}

	
	
	public List<CategoryProductDTO> getProductList(SqlSession session,  List<Integer> pIdList) {
		List<CategoryProductDTO> list = session.selectList("OrderMapper.getProductList", pIdList);
		return list;
	}



	public int addOrder(SqlSession session, OrderDTO orderdto) {
		int n = session.insert("OrderMapper.addOrder",orderdto);
		return n;
	}



	public int getOrderid(SqlSession session) {
		int n = session.selectOne("OrderMapper.getOrderid");
		return n;
	}
}
