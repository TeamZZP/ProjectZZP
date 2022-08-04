package com.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dto.ProductDTO;

public class ProductDAO {

	public List<ProductDTO> productList(SqlSession session, int c_id) {
		
		List<ProductDTO> list = session.selectList("ProductMapper.productList", c_id);
		return list;
	}

	public ProductDTO productRetrieve(SqlSession session, String p_id) {
		ProductDTO dto = session.selectOne("productRetrieve",p_id);
		return dto;
	}

	public List<ProductDTO> bestProduct(SqlSession session) {
		List<ProductDTO> list = session.selectList("ProductMapper.bestProduct");
		return list;
	}

	public List<ProductDTO> searchProduct(SqlSession session, String searchValue) {
		List<ProductDTO> list = session.selectList("ProductMapper.searchProduct",searchValue);
		return list;
	}



}
