package com.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dao.ProductDAO;
import com.dto.ProductDTO;

public class ProductService {
	
	ProductDAO dao = new ProductDAO();

	public List<ProductDTO> productList(String p_category) {
		List<ProductDTO> list = null;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			list = dao.productList(session, p_category);
		}finally {
			session.close();
		}
		return list;
	}

	public ProductDTO productRetrieve(String p_category) {
		ProductDTO dto = null;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			dto = dao.productRetrieve(session,p_category);
		} finally {
			session.close();
		}
		return dto;
	}

	public List<ProductDTO> bestProduct() {
		List<ProductDTO> list = null;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			list = dao.bestProduct(session);
		}finally {
			session.close();
		}
		return list;
		
	}

	



}
