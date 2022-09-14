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

	public int updateProduct(HashMap<String, Object> map) {
		int num = 0;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			num = dao.updateProduct(session, map);
        	session.commit();
        }finally {
        	session.close();
        }
		return num;
	}

	public int deleteProduct(List<String> ids) {
		int num = 0;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			num = dao.deleteProduct(session, ids);
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


	public int upProdcutLiked(String p_id) {
		int n = 0;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			n = dao.upProdcutLiked(session, p_id);
			session.commit();
		}finally {
			session.close();
		}return n;
	}

	public int insertProduct(HashMap<String, Object> map) {
		int num = 0;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			num = dao.insertProduct(session, map);
			session.commit();
		} finally {
			session.close();
		}
		return num;
	}

	public int p_likedNum(String p_id) {
		int n = 0;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			n = dao.p_likedNum(session, p_id);
		} finally {
			session.close();
		}
		return n;
	}

	public int deleteLike(HashMap<String, String> map) {
		int n = 0;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			n = dao.deleteLike(session,map);
			session.commit();
		} finally {
			session.close();
		}
		return n;
	}

	public int downProductLiked(String p_id) {
		int n = 0;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			n = dao.downProductLiked(session,p_id);
			session.commit();
		} finally {
			session.close();
		}
		return n;
	}

	public PageDTO selectAllProduct(HashMap<String, String> map, int curPage) {
		SqlSession session=MySqlSessionFactory.getSqlSession();
		PageDTO dto=null;
		try {
			dto=dao.selectAllProduct(session, map, curPage);
		} finally {
			session.close();
		}
		return dto;
	}

	public PageDTO selectC_Product(HashMap<String, String> p_map, int curPage) {
		SqlSession session=MySqlSessionFactory.getSqlSession();
		PageDTO dto=null;
		try {
			dto=dao.selectC_Product(session, p_map, curPage);
		} finally {
			session.close();
		}
		return dto;
	}
	
	public PageDTO selectBestProductListPaging(HashMap<String, String> p_map, int curPage) {
		System.out.println("ProductService.selectBestProductListPaging");
		SqlSession session=MySqlSessionFactory.getSqlSession();
		PageDTO dto=null;
		try {
			dto=dao.selectBestProductListPaging(session, p_map, curPage);
		} finally {
			session.close();
		}
		return dto;
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
