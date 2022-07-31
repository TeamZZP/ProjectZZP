package com.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dto.QuestionDTO;

public class QuestionDAO {

	public List<QuestionDTO> questionList(SqlSession session) {
		List<QuestionDTO> list = session.selectList("QuestionMapper.questionList");
		return list;
	}

	public QuestionDTO questionOneSelect(SqlSession session, String qID) {
		QuestionDTO dto = session.selectOne("QuestionMapper.questionOneSelect", qID);
		return dto;
	}

	public int questionInsert(SqlSession session, QuestionDTO qDTO) {
		int num = session.insert("QuestionMapper.questionInsert", qDTO);
		return num;
	}

	public int questionUpdate(SqlSession session, QuestionDTO qDTO) {
		int num = session.update("QuestionMapper.questionUpdate", qDTO);
		return num;
	}

	public int questionDelete(SqlSession session, String qID) {
		int num = session.delete("QuestionMapper.questionDelete", qID);
		return num;
	}

}
