package com.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dao.ChallengeDAO;
import com.dto.ChallengeDTO;
import com.dto.CommentsDTO;
import com.dto.PageDTO;

public class ChallengeService {
	
	ChallengeDAO dao = new ChallengeDAO();

	public int insertChallenge(HashMap<String, String> map) {
		int n = 0;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			n = dao.insertChallenge(session, map);
			session.commit();
		} finally {
			session.close();
		}
		return n;
	}

	public PageDTO selectAllChallenge(HashMap<String, String> map, int curPage) {
		PageDTO pDTO = null;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			pDTO = dao.selectAllChallenge(session, map, curPage);
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
	
	public int insertComment(CommentsDTO dto) {
		int n = 0;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			n = dao.insertComment(session, dto);
			session.commit();
		} finally {
			session.close();
		}
		return n;
	}

	public List<CommentsDTO> selectAllComments(String chall_id) {
		List<CommentsDTO> list = null;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			list = dao.selectAllComments(session, chall_id);
		} finally {
			session.close();
		}
		return list;
	}

	public int deleteComment(String comment_id) {
		int n = 0;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			n = dao.deleteComment(session, comment_id);
			session.commit();
		} finally {
			session.close();
		}
		return n;
	}

	public void updateChall_hits(String chall_id) {
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			dao.updateChall_hits(session, chall_id);
			session.commit();
		} finally {
			session.close();
		}
	}

	public int countComments(int chall_id) {
		int n = 0;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			n = dao.countComments(session, chall_id);
		} finally {
			session.close();
		}
		return n;
	}

	public HashMap<String, String> selectProfile(String userid) {
		HashMap<String, String> map = null;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			map = dao.selectProfile(session, userid);
		} finally {
			session.close();
		}
		return map;
	}

	public List<String> selectAllLikedUserid(String chall_id) {
		List<String> list = null;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			list = dao.selectAllLikedUserid(session, chall_id);
		} finally {
			session.close();
		}
		return list;
	}



}
