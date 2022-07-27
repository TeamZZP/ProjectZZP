package com.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dao.ChallengeDAO;
import com.dto.ChallengeDTO;

public class ChallengeService {
	
	ChallengeDAO dao = new ChallengeDAO();

	public int insertChallenge(ChallengeDTO dto) {
		int n = 0;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			n = dao.insertChallenge(session, dto);
			session.commit();
		} finally {
			session.close();
		}
		return n;
	}

	public List<ChallengeDTO> selectAllChallenge() {
		List<ChallengeDTO> list = null;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			list = dao.selectAllChallenge(session);
		} finally {
			session.close();
		}
		return list;
	}

	public ChallengeDTO selectOneChallenge(String chall_id) {
		ChallengeDTO dto = null;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			dto = dao.selectOneChallenge(session, chall_id);
		} finally {
			session.close();
		}
		return dto;
	}

	public int updateChallenge(HashMap<String, String> map) {
		int n = 0;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			n = dao.updateChallenge(session, map);
			session.commit();
		} finally {
			session.close();
		}
		return n;
	}

	public int deleteChallenge(String chall_id) {
		int n = 0;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			n = dao.deleteChallenge(session, chall_id);
			session.commit();
		} finally {
			session.close();
		}
		return n;
	}



}
