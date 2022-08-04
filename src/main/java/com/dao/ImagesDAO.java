package com.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dto.ImagesDTO;

public class ImagesDAO {

	public List<ImagesDTO> selectImages(SqlSession session, int p_id) {
		List<ImagesDTO> list = session.selectList("selectImages", p_id);
		return list;
	}

}
