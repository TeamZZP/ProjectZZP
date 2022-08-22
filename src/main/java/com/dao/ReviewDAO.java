package com.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dto.ReviewDTO;

public class ReviewDAO {

	public List<ReviewDTO> review(SqlSession session, String p_ID) {
		List<ReviewDTO> list =session.selectList("ReviewMapper.review", p_ID);
		return list;
	}

}
