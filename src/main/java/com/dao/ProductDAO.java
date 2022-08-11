package com.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dto.CategoryProductDTO;
import com.dto.ImagesDTO;
import com.dto.ProductDTO;

public class ProductDAO {

	public List<CategoryProductDTO> productList(SqlSession session, int c_id) {
		
		List<CategoryProductDTO> list = session.selectList("ProductMapper.productList", c_id);
		return list;
	}

	public ProductDTO productRetrieve(SqlSession session, int p_id) {
		ProductDTO dto = session.selectOne("ProductMapper.productRetrieve",p_id);
		return dto;
	}


	public List<CategoryProductDTO> searchProduct(SqlSession session, String searchValue) {
		List<CategoryProductDTO> list = session.selectList("ProductMapper.searchProduct",searchValue);
		return list;
	}

	public List<ImagesDTO> ImagesRetrieve(SqlSession session, int p_id) {
		List<ImagesDTO> ilist = session.selectList("ImagesRetrieve",p_id);
		return ilist;
	}

	public int addLike(SqlSession session, HashMap<String, String> map) {
		int n = session.insert("addLike",map);
		return n;
	}



}
