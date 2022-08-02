package com.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.dto.NoticeDTO;
import com.dto.PageDTO;
import com.dto.ProductDTO;
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

	public PageDTO page(SqlSession session, int curPage) {
		PageDTO pDTO = new PageDTO();
		pDTO.setPerPage(10);
		int perPage = pDTO.getPerPage();
		int offset = (curPage - 1) * perPage;
		
		List<NoticeDTO> list = session.selectList("QuestionMapper.questionList", null, new RowBounds(offset, perPage));
		
		pDTO.setCurPage(curPage);
		pDTO.setList(list);
		pDTO.setTotalCount(totalCount(session));
		
		return pDTO;
	}
	private int totalCount(SqlSession session) {
		return session.selectOne("QuestionMapper.totalCount");
	}

	public List<ProductDTO> prodSelect(SqlSession session, Map<String, String> map) {
		List<ProductDTO> list = session.selectList("QuestionMapper.prodSelect", map);
		return list;
	}

	public int count(SqlSession session, Map<String, String> map) {
		int num = session.selectOne("QuestionMapper.count", map);
		return num;
	}

}
