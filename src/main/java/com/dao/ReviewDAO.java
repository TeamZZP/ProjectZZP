package com.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.dto.ChallengeDTO;
import com.dto.PageDTO;
import com.dto.ReviewDTO;
import com.dto.ReviewProfileDTO;

public class ReviewDAO {

	public List<ReviewProfileDTO> review(SqlSession session, String p_ID) {
		List<ReviewProfileDTO> list =session.selectList("ReviewMapper.review", p_ID);
		return list;
	}

	public PageDTO selectUserReview(SqlSession session, HashMap<String, String> map, int curPage, int perPage) {
		PageDTO pDTO = new PageDTO();
		pDTO.setPerPage(perPage);
		int offset = (curPage - 1)*perPage;
		
		List<ReviewDTO> list = session.selectList("ReviewMapper.selectUserReview", map, new RowBounds(offset, perPage));
		
		pDTO.setCurPage(curPage);
		pDTO.setList(list);
		pDTO.setTotalCount(countTotalUserReview(session, map));
		
		return pDTO;
	}

	public int countTotalUserReview(SqlSession session, HashMap<String, String> map) {
		return session.selectOne("ReviewMapper.countTotalUserReview", map);
	}

	public HashMap<String, String> selectOneProduct(SqlSession session, int p_ID) {
		return session.selectOne("ReviewMapper.selectOneProduct", p_ID);
	}

	public int reviewInsert(SqlSession session, HashMap<String, String> map) {
		int num = session.insert("ReviewMapper.reviewInsert", map);
		return num;
	}

	public int orderIDreivewCheck(SqlSession session, int ORDER_ID) {
		int num = session.selectOne("ReviewMapper.orderIDreivewCheck", ORDER_ID);
		return num;
	}

}
