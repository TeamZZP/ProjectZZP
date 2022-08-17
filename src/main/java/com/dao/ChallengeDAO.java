package com.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.dto.ChallengeDTO;
import com.dto.CommentsDTO;
import com.dto.PageDTO;

public class ChallengeDAO {

	public int insertChallenge(SqlSession session, HashMap<String, String> map) {
		int n = session.insert("ChallengeMapper.insertChallenge", map);
		return n;
	}

	public PageDTO selectAllChallenge(SqlSession session, HashMap<String, String> map, int curPage) {
		PageDTO pDTO = new PageDTO();
		pDTO.setPerPage(8);
		int perPage = pDTO.getPerPage();
		int offset = (curPage - 1)*perPage;
		
		List<ChallengeDTO> list = session.selectList("ChallengeMapper.selectAllChallenge", map, new RowBounds(offset, perPage));
		
		pDTO.setCurPage(curPage);
		pDTO.setList(list);
		pDTO.setTotalCount(countTotal(session, map));
		
		return pDTO;
	}

	private int countTotal(SqlSession session, HashMap<String, String> map) {
		int n = session.selectOne("ChallengeMapper.countTotal", map);
		return n;
	}

	public ChallengeDTO selectOneChallenge(SqlSession session, String chall_id) {
		ChallengeDTO dto = session.selectOne("ChallengeMapper.selectOneChallenge", chall_id);
		return dto;
	}

	public int updateChallenge(SqlSession session, HashMap<String, String> map) {
		int n = session.update("ChallengeMapper.updateChallenge", map);
		return n;
	}

	public int deleteChallenge(SqlSession session, String chall_id) {
		int n = session.delete("ChallengeMapper.deleteChallenge", chall_id);
		return n;
	}
	
	public int insertComment(SqlSession session, CommentsDTO dto) {
		int n = session.insert("ChallengeMapper.insertComment", dto);
		return n;
	}

	public List<CommentsDTO> selectAllComments(SqlSession session, String chall_id) {
		List<CommentsDTO> list = session.selectList("ChallengeMapper.selectAllComments", chall_id);
		return list;
	}

	public void updateChallHits(SqlSession session, String chall_id) {
		session.update("ChallengeMapper.updateChallHits", chall_id);
	}

	public int countComments(SqlSession session, int chall_id) {
		int n = session.selectOne("ChallengeMapper.countComments", chall_id);
		return n;
	}

	public HashMap<String, String> selectProfile(SqlSession session, String userid) {
		HashMap<String, String> map = session.selectOne("ChallengeMapper.selectProfile", userid);
		return map;
	}

	public List<String> selectAllLikedUserid(SqlSession session, String chall_id) {
		List<String> list = session.selectList("ChallengeMapper.selectAllLikedUserid", chall_id);
		return list;
	}
	
	public List<ChallengeDTO> selectNewChallenge(SqlSession session) {
		return session.selectList("ChallengeMapper.selectNewChallenge");
	}

	public int insertLike(SqlSession session, HashMap<String, String> map) {
		int n = session.insert("ChallengeMapper.insertLike", map);
		return n;
	}

	public int upChallLiked(SqlSession session, String chall_id) {
		int n = session.update("ChallengeMapper.upChallLiked", chall_id);
		return n;
	}

	public int countLiked(SqlSession session, String chall_id) {
		int n = session.selectOne("ChallengeMapper.countLiked", chall_id);
		return n;
	}

	public int deleteLike(SqlSession session, HashMap<String, String> map) {
		int n = session.delete("ChallengeMapper.deleteLike", map);
		return n;
	}

	public int downChallLiked(SqlSession session, String chall_id) {
		int n = session.update("ChallengeMapper.downChallLiked", chall_id);
		return n;
	}

	public int countLikedByMap(SqlSession session, HashMap<String, String> map) {
		int n = session.selectOne("ChallengeMapper.countLikedByMap", map);
		return n;
	}

	public int upChallComments(SqlSession session, String chall_id) {
		int n = session.update("ChallengeMapper.upChallComments", chall_id);
		return n;
	}

	public int downChallComments(SqlSession session, HashMap<String, String> map) {
		int n = session.update("ChallengeMapper.downChallComments", map);
		return n;
	}

	public String selectProfileImg(SqlSession session, String userid) {
		String profile_img = session.selectOne("ChallengeMapper.selectProfileImg", userid);
		return profile_img;
	}


	public List<ChallengeDTO> selectChallengeByUserid(SqlSession session, String userid) {
		List<ChallengeDTO> list = session.selectList("ChallengeMapper.selectChallengeByUserid", userid);
		return list;
	}

	public int insertReply(SqlSession session, CommentsDTO dto) {
		int n = session.insert("ChallengeMapper.insertReply", dto);
		return n;
	}

	public int deleteAllComments(SqlSession session, String comment_id) {
		int n = session.delete("ChallengeMapper.deleteAllComments", comment_id);
		return n;
	}



}
