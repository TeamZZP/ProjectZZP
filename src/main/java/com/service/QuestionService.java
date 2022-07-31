package com.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dao.QuestionDAO;
import com.dto.QuestionDTO;

public class QuestionService {
	
	QuestionDAO dao;
	
	public QuestionService() {
		super();
		dao = new QuestionDAO();
	}

	public List<QuestionDTO> questionList() {
		List<QuestionDTO> list = null;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			list = dao.questionList(session);
		} finally {
			session.close();
		}
		return list;
	}

	public QuestionDTO questionOneSelect(String qID) {
		QuestionDTO dto = null;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			dto = dao.questionOneSelect(session, qID);
		} finally {
			session.close();
		}
		return dto;
	}

	public int questionInsert(QuestionDTO qDTO) {
		int num = 0;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			num = dao.questionInsert(session, qDTO);
			session.commit();
		} finally {
			session.close();
		}
		return num;
	}

}
