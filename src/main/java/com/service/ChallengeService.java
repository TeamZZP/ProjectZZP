package com.service;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dao.ChallengeDAO;
import com.dto.ChallengeDTO;
import com.dto.PageDTO;

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

	public PageDTO selectAllChallenge(String searchName, String searchValue, int curPage) {
		PageDTO pDTO = null;
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("searchName", searchName);
		map.put("searchValue", searchValue);
	//	map.put("sortBy", sortBy);
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			pDTO = dao.selectAllChallenge(session, map, curPage);
			System.out.println("service>>"+pDTO.getList());
		} finally {
			session.close();
		}
		return pDTO;
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
