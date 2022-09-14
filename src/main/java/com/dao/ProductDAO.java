package com.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.dto.AddressDTO;
import com.dto.CategoryProductDTO;
import com.dto.ImagesDTO;
import com.dto.PageDTO;
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
		System.out.println(list);
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

	public int updateProduct(SqlSession session, HashMap<String, Object> map) {
		return session.update("updateProduct", map);
	}

	public int deleteProduct(SqlSession session, List<String> ids) {
		return session.delete("deleteProduct", ids);
	}

	public int likeCount(SqlSession session, String userid) {
		int n = session.selectOne("likeCount",userid);
		return n;
	}

	public List<product_likedDTO> likeList(SqlSession session, String userid) {
		List<product_likedDTO> list = session.selectList("ProductMapper.likeList",userid);
		return list;
	}

	public PageDTO selectProduct(SqlSession session, HashMap<String, String> map, int curPage) {
	      PageDTO pDTO = new PageDTO();
	      pDTO.setPerPage(10);//한 페이지 당 10개 씩
	      int perPage = pDTO.getPerPage(); //10
	      int offset = (curPage-1)*perPage; //페이지 시작 idx
	      
	      List<CategoryProductDTO> list = session.selectList("ProductMapper.selectProd", map, new RowBounds(offset, perPage));
	      
	      pDTO.setCurPage(curPage);
	      pDTO.setList(list); //현재 페이지에 해당하는 데이터
	      pDTO.setTotalCount(totalCount(session,map)); //전체 레코드 갯수
	      
	      return pDTO;
	   }
	      private int totalCount(SqlSession session, HashMap<String, String> map) {
	      return session.selectOne("ProductMapper.totalCount", map);

	   }
	   //스토어페이징
	      public PageDTO selectAllProduct(SqlSession session, HashMap<String, String> map, int curPage) {
	         PageDTO pDTO=new PageDTO();
	         pDTO.setCurPage(curPage);
	         pDTO.setPerPage(12);//한 페이지에 12개 출력
	         int perPage=pDTO.getPerPage();//한 페이지에 출력 갯수
	         int offset=(curPage-1)*perPage;//페이지 시작 idx
	         
	         //map에 검색 조건, 검색어, 정렬 저장된 상태
	         List<CategoryProductDTO> list=session.selectList("ProductMapper.selectAllProduct", map, new RowBounds(offset, perPage));
	         
	         pDTO.setList(list);//현재 페이지에 해당하는 데이터 리스트
	         pDTO.setTotalCount(totalCount(session, map));//전체 레코드 갯수
	         return pDTO;
	      }
	  
	
	
	public PageDTO selectC_Product(SqlSession session, HashMap<String, String> p_map, int curPage) {
		
		PageDTO pDTO=new PageDTO();
		pDTO.setCurPage(curPage);
		pDTO.setPerPage(12);//한 페이지에 12개 출력
		int perPage=pDTO.getPerPage();//한 페이지에 출력 갯수
		int offset=(curPage-1)*perPage;//페이지 시작 idx
		
		//map에 검색 조건, 검색어, 정렬 저장된 상태
		List<CategoryProductDTO> list=session.selectList("ProductMapper.selectC_Product", p_map, new RowBounds(offset, perPage));
		
		pDTO.setList(list);//현재 페이지에 해당하는 데이터 리스트
		pDTO.setTotalCount(countByC_id(session, p_map));//전체 레코드 갯수
		return pDTO;
	}
	
	private int countByC_id(SqlSession session, HashMap<String, String> map) {
	      return session.selectOne("ProductMapper.countByC_id", map);

	   }
	
	private int bestProdCount(SqlSession session) {
		return session.selectOne("ProductMapper.BestProdCount");

	}
	
	public PageDTO selectBestProductListPaging(SqlSession session, HashMap<String, String> p_map, int curPage) {
		System.out.println("ProductDAO.selectBestProductListPaging");
		PageDTO pDTO=new PageDTO();
		pDTO.setCurPage(curPage);
		pDTO.setPerPage(12);//한 페이지에 12개 출력
		int perPage=pDTO.getPerPage();//한 페이지에 출력 갯수
		int offset=(curPage-1)*perPage;//페이지 시작 idx
		
		//map에 검색 조건, 검색어, 정렬 저장된 상태
		List<CategoryProductDTO> list=session.selectList("ProductMapper.bestProductListPaging", p_map, new RowBounds(offset, perPage));
		
		pDTO.setList(list);//현재 페이지에 해당하는 데이터 리스트
		pDTO.setTotalCount(bestProdCount(session));//전체 레코드 갯수
		return pDTO;
	}
	

	

	public int upProdcutLiked(SqlSession session, String p_id) {
		int n = session.update("upProdcutLiked",p_id);
		return n;
	}

	public int p_likedNum(SqlSession session, String p_id) {
		int n = session.selectOne("ProductMapper.p_likedNum", p_id);
		return n;
	}

	public int deleteLike(SqlSession session, HashMap<String, String> map) {
		int n = session.delete("ProductMapper.deleteLike",map);
		return n;
	}

	public int downProductLiked(SqlSession session, String p_id) {
		int n = session.update("downProductLiked",p_id);
		return n;
	}

	public int insertProduct(SqlSession session, HashMap<String, Object> map) {
		return session.insert("insertProduct", map);
	}

	public int updateProduct(SqlSession session, ProductDTO dto) {
		return session.update("updateProduct2", dto);
	}

	public int insertProduct(SqlSession session, ProductDTO dto) {
		return  session.insert("insertProduct2", dto);
	}

	

	
	
	
}
