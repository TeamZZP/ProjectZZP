package com.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dto.ReviewDTO;

public class ReviewDAO {

	public List<ReviewDTO> reviewAll(SqlSession session) {
		List<ReviewDTO> list =session.selectList("reviewAll");
		return list;
	}

}
