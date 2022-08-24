package com.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dto.CategoryProductDTO;
import com.dto.ImagesDTO;
import com.dto.ProductDTO;
import com.dto.product_likedDTO;

public class ProductDAO {

	public List<CategoryProductDTO> productList(SqlSession session, int c_id) {
		
		List<CategoryProductDTO> list = session.selectList("ProductMapper.productList", c_id);
		return list;
	}
	
	public List<CategoryProductDTO> bestProductList(SqlSession session) {
		List<CategoryProductDTO> list = session.selectList("ProductMapper.bestProductList");
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

	public int likeCheck(SqlSession session, HashMap<String, String> map) {
		return session.selectOne("likeCheck",map);
		 
	}

	public List<CategoryProductDTO> ProductList(SqlSession session) {
		List<CategoryProductDTO> list = session.selectList("ProductMapper.ProductList");
		return list;
	}

	public List<Integer> selectLikeProduct(SqlSession session, String userid) {
		List<Integer> list = session.selectList("selectLikeProduct", userid);
		return list;
	}

	public int updateProduct(SqlSession session, ProductDTO dto) {
		return session.update("updateProduct", dto);
	}

	public int deleteProduct(SqlSession session, int p_id) {
		return session.delete("deleteProduct", p_id);
	}

	public int likeCount(SqlSession session, String userid) {
		int n = session.selectOne("likeCount",userid);
		return n;
	}

	public List<product_likedDTO> likeList(SqlSession session, String userid) {
		List<product_likedDTO> list = session.selectList("ProductMapper.likeList",userid);
		return list;
	}
}
