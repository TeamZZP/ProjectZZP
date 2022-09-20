package com.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.dto.MemberDTO;
import com.dto.PageDTO;
import com.dto.ProductOrderDTO;
import com.dto.QuestionDTO;

public class AdminDAO {

	public PageDTO selectAllOrders(SqlSession session, HashMap<String, String> map, int curPage) {
		PageDTO pDTO = new PageDTO();
		pDTO.setPerPage(10);
		int perPage = pDTO.getPerPage();
		int offset = (curPage - 1)*perPage;
		
		List<ProductOrderDTO> list = session.selectList("AdminMapper.selectAllOrders", map, new RowBounds(offset, perPage));
		
		pDTO.setCurPage(curPage);
		pDTO.setList(list);
		pDTO.setTotalCount(countTotalOrders(session, map));
		
		return pDTO;
	}

	private int countTotalOrders(SqlSession session, HashMap<String, String> map) {
		return session.selectOne("AdminMapper.countTotalOrders", map);
	}

	public int updateOrder(SqlSession session, HashMap<String, String> map) {
		return session.update("AdminMapper.updateOrder", map);
	}

	public List<ProductOrderDTO> selectNewOrders(SqlSession session, HashMap<String, String> map) {
		return session.selectList("AdminMapper.selectNewOrders", map);
	}

	public List<MemberDTO> selectNewMembers(SqlSession session, HashMap<String, String> map) {
		return session.selectList("AdminMapper.selectNewMembers", map);
	}

	public List<QuestionDTO> selectNewQuestion(SqlSession session) {
		return session.selectList("AdminMapper.selectNewQuestion");
	}

	

}
