package com.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dto.ChallengeDTO;

public class ChallengeDAO {

	public int insertChallenge(SqlSession session, ChallengeDTO dto) {
		int n = session.insert("insertChallenge", dto);
		return n;
	}

	public List<ChallengeDTO> selectAllChallenge(SqlSession session) {
		List<ChallengeDTO> list = session.selectList("selectAllChallenge");
		return list;
	}

	public ChallengeDTO selectOneChallenge(SqlSession session, int chall_id) {
		ChallengeDTO dto = session.selectOne("selectOneChallenge", chall_id);
		return dto;
	}

	public int updateChallenge(SqlSession session, HashMap<String, String> map) {
		int n = session.update("updateChallenge", map);
		return n;
	}



}
