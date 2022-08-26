package com.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dto.ReviewDTO;
import com.dto.ReviewProfileDTO;

public class ReviewDAO {

	public List<ReviewProfileDTO> review(SqlSession session, String p_ID) {
		List<ReviewProfileDTO> list =session.selectList("ReviewMapper.review", p_ID);
		return list;
	}

}
