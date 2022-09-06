package com.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.dto.CategoryProductDTO;
import com.dto.ImagesOrderDTO;
import com.dto.OrderDTO;
import com.dto.PageDTO;
import com.dto.ProductOrderReviewImagesDTO;

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



	public PageDTO MyOrderList(SqlSession session, int curPage, String userid) {
		PageDTO pDTO = new PageDTO();
		pDTO.setPerPage(5);
		int perPage = pDTO.getPerPage();
		int offset = (curPage - 1) * perPage;
		
		List<ProductOrderReviewImagesDTO> list = session.selectList("OrderMapper.MyOrderList", userid, new RowBounds(offset, perPage));
		
		pDTO.setCurPage(curPage);
		pDTO.setList(list);
		pDTO.setTotalCount(myOrderNum(session, userid));
		
		return pDTO;
	}

	private int myOrderNum(SqlSession session, String userid) {
		return session.selectOne("QuestionMapper.myQuestionNum", userid);
	}



	public List<ImagesOrderDTO> ProdImg(SqlSession session, String userid) {
		List<ImagesOrderDTO> list = session.selectList("OrderMapper.ProdImg", userid);
		return list;
	}
}
