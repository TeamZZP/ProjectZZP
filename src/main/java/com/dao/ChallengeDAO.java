package com.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.dto.ChallengeDTO;
import com.dto.CommentsDTO;
import com.dto.PageDTO;

public class ChallengeDAO {

	public int insertChallenge(SqlSession session, ChallengeDTO dto) {
		int n = session.insert("insertChallenge", dto);
		return n;
	}

	public PageDTO selectAllChallenge(SqlSession session, HashMap<String, String> map, int curPage) {
		PageDTO pDTO = new PageDTO();
		pDTO.setPerPage(8);
		int perPage = pDTO.getPerPage();
		int offset = (curPage - 1)*perPage;
		
		List<ChallengeDTO> list = session.selectList("selectAllChallenge", map, new RowBounds(offset, perPage));
		
		pDTO.setCurPage(curPage);
		pDTO.setList(list);
		pDTO.setTotalCount(countTotal(session, map));
		
		return pDTO;
	}

	private int countTotal(SqlSession session, HashMap<String, String> map) {
		int n = session.selectOne("countTotal", map);
		return n;
	}

	public ChallengeDTO selectOneChallenge(SqlSession session, String chall_id) {
		ChallengeDTO dto = session.selectOne("selectOneChallenge", chall_id);
		return dto;
	}

	public int updateChallenge(SqlSession session, HashMap<String, String> map) {
		int n = session.update("updateChallenge", map);
		return n;
	}

	public int deleteChallenge(SqlSession session, String chall_id) {
		int n = session.delete("deleteChallenge", chall_id);
		return n;
	}
	
	public int insertComment(SqlSession session, CommentsDTO dto) {
		int n = session.insert("insertComment", dto);
		return n;
	}

	public List<CommentsDTO> selectAllComments(SqlSession session, String chall_id) {
		List<CommentsDTO> list = session.selectList("selectAllComments", chall_id);
		return list;
	}

	public int deleteComment(SqlSession session, String comment_id) {
		int n = session.delete("deleteComment", comment_id);
		return n;
	}

	public void updateChall_hits(SqlSession session, String chall_id) {
		session.update("updateChall_hits", chall_id);
	}

	public int countComments(SqlSession session, int chall_id) {
		int n = session.selectOne("countComments", chall_id);
		return n;
	}



}
