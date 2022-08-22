package com.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.dto.ImagesDTO;
import com.dto.PageDTO;
import com.dto.ProductDTO;
import com.dto.QuestionDTO;
import com.dto.QuestionProductDTO;

public class QuestionDAO {

	public List<QuestionDTO> questionList(SqlSession session) {
		List<QuestionDTO> list = session.selectList("QuestionMapper.questionList");
		return list;
	}

	public QuestionProductDTO questionOneSelect(SqlSession session, String qID) {
		QuestionProductDTO dto = session.selectOne("QuestionMapper.questionOneSelect", qID);
		return dto;
	}

	public int questionInsert(SqlSession session, HashMap<String, String> map) {
		int num = session.insert("QuestionMapper.questionInsert", map);
		return num;
	}

	public int questionUpdate(SqlSession session, HashMap<String, String> map) {
		int num = session.update("QuestionMapper.questionUpdate", map);
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
		
		List<QuestionProductDTO> list = session.selectList("QuestionMapper.questionList", null, new RowBounds(offset, perPage));
		
		pDTO.setCurPage(curPage);
		pDTO.setList(list);
		pDTO.setTotalCount(totalCount(session));
		
		return pDTO;
	}
	private int totalCount(SqlSession session) {
		return session.selectOne("QuestionMapper.totalCount");
	}

	public PageDTO prodSelect(SqlSession session, Map<String, String> map, int curPage, int prodNum) {
		PageDTO pDTO = new PageDTO();
		pDTO.setPerPage(prodNum);
		int perPage = pDTO.getPerPage();
		int offset = (curPage - 1) * perPage;
		
		List<ProductDTO> list = session.selectList("QuestionMapper.prodSelect", map, new RowBounds(offset,perPage));
		
		pDTO.setCurPage(curPage);
		pDTO.setList(list);
		pDTO.setTotalCount(totalCount2(session, map));
		
		return pDTO;
	}

	private int totalCount2(SqlSession session, Map<String, String> map) {
		return session.selectOne("QuestionMapper.totalCount2", map);
	}

	public int count(SqlSession session, Map<String, String> map) {
		int num = session.selectOne("QuestionMapper.count", map);
		return num;
	}

	public List<ImagesDTO> ProdImg(SqlSession session, List<String> p) {
		List<ImagesDTO> list = session.selectList("QuestionMapper.ProdImg", p);
		return list;
	}

	public List<QuestionDTO> prodQuestion(SqlSession session, String p_ID) {
		List<QuestionDTO> list = session.selectList("QuestionMapper.prodQuestion", p_ID);
		return list;
	}

	public int ImgUpdate(SqlSession session, String img) {
		int num = session.update("QuestionMapper.ImgUpdate", img);
		return num;
	}

	public PageDTO MyQeustionList(SqlSession session, int curPage, String userid) {
		PageDTO pDTO = new PageDTO();
		pDTO.setPerPage(10);
		int perPage = pDTO.getPerPage();
		int offset = (curPage - 1) * perPage;
		
		List<QuestionProductDTO> list = session.selectList("QuestionMapper.MyQeustionList", userid, new RowBounds(offset, perPage));
		
		pDTO.setCurPage(curPage);
		pDTO.setList(list);
		pDTO.setTotalCount(myQuestionNum(session, userid));
		
		return pDTO;
	}

	private int myQuestionNum(SqlSession session, String userid) {
		return session.selectOne("QuestionMapper.myQuestionNum", userid);
	}

}
