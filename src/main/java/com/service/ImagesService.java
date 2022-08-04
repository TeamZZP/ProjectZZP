package com.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dao.ImagesDAO;
import com.dto.ImagesDTO;

public class ImagesService {
	
	ImagesDAO dao = new ImagesDAO();

	public List<ImagesDTO> selectImages(int p_id) {
		List<ImagesDTO> list = null;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			list = dao.selectImages(session, p_id);
		}finally {
			session.close();
		}
		return list;
	}

}
