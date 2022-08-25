package com.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dao.ProductDAO;
import com.dto.CategoryProductDTO;
import com.dto.ImagesDTO;
import com.dto.PageDTO;
import com.dto.ProductDTO;
import com.dto.product_likedDTO;

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
	
	public List<CategoryProductDTO> bestProductList() {
		List<CategoryProductDTO> list = null;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			list = dao.bestProductList(session);
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


	public List<CategoryProductDTO> searchProduct(String searchValue) {
		List<CategoryProductDTO> list = null;
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

	public int addLike(HashMap<String, String> map) {		
		int n = 0;
		SqlSession session = MySqlSessionFactory.getSqlSession();
        try {
        	n = dao.addLike(session, map);
        	session.commit();
        }finally {
        	session.close();
        }
		
		return n;
	}

	public int likeCheck(HashMap<String, String> map) {		
		int n = 0;
		SqlSession session = MySqlSessionFactory.getSqlSession();
        try {
        	n = dao.likeCheck(session, map);
        	session.commit();
        }finally {
        	session.close();
        }
		
		return n;
	}

	public List<CategoryProductDTO> ProductList() {
		List<CategoryProductDTO> list = null;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			list = dao.ProductList(session);
		}finally {
			session.close();
		}
		return list;
	}

	public List<Integer> selectLikeProduct(String userid) {
		List<Integer> list = null;
		SqlSession session = MySqlSessionFactory.getSqlSession();
        try {
        	list = dao.selectLikeProduct(session, userid);
        }finally {
        	session.close();
        }
		return list;
	}

	public int updateProduct(ProductDTO dto) {
		int num = 0;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			num = dao.updateProduct(session, dto);
        	session.commit();
        }finally {
        	session.close();
        }
		return num;
	}

	public int deleteProduct(int p_id) {
		int num = 0;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			num = dao.deleteProduct(session, p_id);
        	session.commit();
        }finally {
        	session.close();
        }
		return num;
	}

	public int likeCount(String userid) {
		int n = 0;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			n = dao.likeCount(session,userid);
		} finally {
			session.close();
		}
		return n;
	}

	public List<product_likedDTO> likeList(String userid) {
		List<product_likedDTO> list = null;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			list = dao.likeList(session,userid);
		} finally {
			session.close();
		}
		return list;
	}

	public PageDTO selectProduct(HashMap<String, String> map, int curPage) {
		PageDTO pDTO = null;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			pDTO = dao.selectProduct(session, map, curPage);
		} finally {
			session.close();
		}
		return pDTO;

	}

	public int insertProduct(ProductDTO dto) {
		int num = 0;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			num = dao.insertProduct(session, dto);
			session.commit();
		} finally {
			session.close();
		}
		return num;
	}



}
