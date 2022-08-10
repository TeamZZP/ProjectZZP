package com.service;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dao.AnswerDAO;
import com.dto.AnswerDTO;

public class AnswerService {

	AnswerDAO dao;
	
	public AnswerService() {
		super();
		dao = new AnswerDAO();
	}

	public int answerInsert(AnswerDTO aDTO) {
		int num = 0;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			num = dao.answerInsert(session, aDTO);
			session.commit();
		} finally {
			session.close();
		}
		return num;
	}

	public AnswerDTO selectAnswer(String qID) {
		AnswerDTO aDTO = null;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			aDTO = dao.selectAnswer(session, qID);
		} finally {
			session.close();
		}
		return aDTO;
	}

	public int answerUpdate(AnswerDTO aDTO) {
		int num = 0;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			num = dao.answerUpdate(session, aDTO);
			session.commit();
		} finally {
			session.close();
		}
		return num;
	}

	public int questionStatus(String q_ID) {
		int num = 0;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			num = dao.questionStatus(session, q_ID);
			session.commit();
		} finally {
			session.close();
		}
		return num;
	}


}
