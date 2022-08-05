package com.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dao.ProductDAO;
import com.dto.CategoryProductDTO;
import com.dto.ImagesDTO;
import com.dto.ProductDTO;

public class ProductService {
	
	ProductDAO dao = new ProductDAO();

	public List<CategoryProductDTO> productList(int c_id) {
		List<CategoryProductDTO> list = null;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			list = dao.productList(session, c_id);
		}finally {
			session.close();
		}
		return list;
	}

	public ProductDTO productRetrieve(int p_id) {
		ProductDTO dto = null;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			dto = dao.productRetrieve(session,p_id);
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

	public List<ProductDTO> searchProduct(String searchValue) {
		List<ProductDTO> list = null;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			list = dao.searchProduct(session,searchValue);
		}finally {
			session.close();
		}
		return list;
	}

	public List<ImagesDTO> ImagesRetrieve(int p_id) {
		List<ImagesDTO> ilist = null;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			ilist = dao.ImagesRetrieve(session, p_id);
		}finally {
			session.close();
		}
		return ilist;
	}


	



}
