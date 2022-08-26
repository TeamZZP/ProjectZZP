package com.service;

import java.util.HashMap;
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

	public int insertImage(HashMap<String, String> map) {
		int num = 0;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			num = dao.insertImage(session, map);
			session.commit();
		} finally {
			session.close();
		}
		return num;
	}

}
