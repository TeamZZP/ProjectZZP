package com.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.dto.ChallengeDTO;
import com.dto.PageDTO;
import com.dto.ProductOrderReviewDTO;
import com.dto.ReviewDTO;
import com.dto.ReviewProductDTO;
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

	public ReviewDTO orderIDreivewCheck(SqlSession session, Map<String, String> map) {
		ReviewDTO dto = session.selectOne("ReviewMapper.orderIDreivewCheck", map);
		return dto;
	}

	public ProductOrderReviewDTO selectOneReview(SqlSession session, Map<String, String> map) {
		ProductOrderReviewDTO dto = session.selectOne("ReviewMapper.selectOneReview", map);
		return dto;
	}

	public int reviewUpdate(SqlSession session, HashMap<String, String> map) {
		int num = session.update("ReviewMapper.reviewUpdate", map);
		return num;
	}

	public int reviewDelete(SqlSession session, Map<String, String> map) {
		int num = session.delete("ReviewMapper.reviewDelete", map);
		return num;
	}

}
