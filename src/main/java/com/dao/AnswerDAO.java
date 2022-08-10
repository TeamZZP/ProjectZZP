package com.dao;

import org.apache.ibatis.session.SqlSession;

import com.dto.AnswerDTO;

public class AnswerDAO {

	public int answerInsert(SqlSession session, AnswerDTO aDTO) {
		int num = session.insert("AnswerMapper.answerInsert", aDTO);
		return num;
	}

	public AnswerDTO selectAnswer(SqlSession session, String qID) {
		AnswerDTO aDTO = session.selectOne("AnswerMapper.selectAnswer", qID);
		return aDTO;
	}

	public int answerUpdate(SqlSession session, AnswerDTO aDTO) {
		int num = session.insert("AnswerMapper.answerUpdate", aDTO);
		return num;
	}

	public int questionStatus(SqlSession session, String q_ID) {
		int num = session.update("questionStatus", q_ID);
		return num;
	}

}
