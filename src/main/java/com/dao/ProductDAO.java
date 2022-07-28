package com.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dto.ProductDTO;

public class ProductDAO {

	public List<ProductDTO> productList(SqlSession session, String p_category) {
		//List<ProductDTO> list = session.selectList("ProductMapper.productList",p_category);
		
		List<ProductDTO> list = session.selectList("ProductMapper.productList", p_category);
		return list;
	}

}
