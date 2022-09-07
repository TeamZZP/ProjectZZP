package com.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dao.ChallengeDAO;
import com.dto.ChallengeDTO;
import com.dto.CommentsDTO;
import com.dto.PageDTO;
import com.dto.ReportDTO;
import com.dto.StampDTO;

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

	public void updateChallHits(String chall_id) {
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			dao.updateChallHits(session, chall_id);
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
			
	public List<ChallengeDTO> selectNewChallenge() {
		List<ChallengeDTO> list = null;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			list = dao.selectNewChallenge(session);
		} finally {
			session.close();
		}
		return list;
	}

	public int insertLike(HashMap<String, String> map) {
		int n = 0;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			n = dao.insertLike(session, map);
			session.commit();
		} finally {
			session.close();
		}
		return n;
	}
	
	public int updateChallLiked(String chall_id) {
		int n = 0;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			n = dao.updateChallLiked(session, chall_id);
			session.commit();
		} finally {
			session.close();
		}
		return n;
	}

	public int countLiked(String chall_id) {
		int n = 0;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			n = dao.countLiked(session, chall_id);
		} finally {
			session.close();
		}
		return n;
	}

	public int deleteLike(HashMap<String, String> map) {
		int n = 0;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			n = dao.deleteLike(session, map);
			session.commit();
		} finally {
			session.close();
		}
		return n;
	}

	public int countLikedByMap(HashMap<String, String> map) {
		int n = 0;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			n = dao.countLikedByMap(session, map);
		} finally {
			session.close();
		}
		return n;
	}
	
	public int updateChallComments(String chall_id) {
		int n = 0;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			n = dao.updateChallComments(session, chall_id);
			session.commit();
		} finally {
			session.close();
		}
		return n;
	}	

	public String selectProfileImg(String userid) {
		String profile_img = null;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			profile_img = dao.selectProfileImg(session, userid);
		} finally {
			session.close();
		}
		return profile_img;
	}
	
	public PageDTO selectChallengeByUserid(HashMap<String, String> map, int curPage, int perPage) {
		PageDTO pDTO = null;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			pDTO = dao.selectChallengeByUserid(session, map, curPage, perPage);
		} finally {
			session.close();
		}
		return pDTO;
	}
	
	public int countTotalUserChallenge(HashMap<String, String> map) {
		int n = 0;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			n = dao.countTotalUserChallenge(session, map);
		} finally {
			session.close();
		}
		return n;
	}

	public int insertReply(CommentsDTO dto) {
		int n = 0;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			n = dao.insertReply(session, dto);
			session.commit();
		} finally {
			session.close();
		}
		return n;
	}

	public int deleteAllComments(String comment_id) {
		int n = 0;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			n = dao.deleteAllComments(session, comment_id);
			session.commit();
		} finally {
			session.close();
		}
		return n;
	}
	
	public int updateComment(CommentsDTO dto) {
		int n = 0;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			n = dao.updateComment(session, dto);
			session.commit();
		} finally {
			session.close();
		}
		return n;
	}

	public StampDTO selectOneStamp(String chall_id) {
		StampDTO dto = null;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			dto = dao.selectOneStamp(session, chall_id);
		} finally {
			session.close();
		}
		return dto;
	}

	public int updateChallThisMonth(HashMap<String, Integer> map) {
		int n = 0;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			n = dao.updateChallThisMonth(session, map);
			session.commit();
		} finally {
			session.close();
		}
		return n;
	}

	public int insertAdminChallenge(HashMap<String, String> map) {
		int n = 0;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			n = dao.insertAdminChallenge(session, map);
			session.commit();
		} finally {
			session.close();
		}
		return n;
	}

	public ChallengeDTO selectChallThisMonth() {
		ChallengeDTO dto = null;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			dto = dao.selectChallThisMonth(session);
		} finally {
			session.close();
		}
		return dto;
	}

	public HashMap<String, String> selectMemberStamp(int chall_id) {
		HashMap<String, String> map = null;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			map = dao.selectMemberStamp(session, chall_id);
		} finally {
			session.close();
		}
		return map;
	}

	public PageDTO selectMemberStampByUserid(HashMap<String, String> map, int curPage, int perPage) {
		PageDTO dto = null;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			dto = dao.selectMemberStampByUserid(session, map, curPage, perPage);
		} finally {
			session.close();
		}
		return dto;
	}

	public String selectStampImg(String stampId) {
		String stampImg = null;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			stampImg = dao.selectStampImg(session, stampId);
		} finally {
			session.close();
		}
		return stampImg;
	}

	public int updateStamp(HashMap<String, String> map) {
		int n = 0;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			n = dao.updateStamp(session, map);
			session.commit();
		} finally {
			session.close();
		}
		return n;
	}

	public int insertReport(HashMap<String, String> map) {
		int n = 0;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			n = dao.insertReport(session, map);
			session.commit();
		} finally {
			session.close();
		}
		return n;
	}
	
	public int checkReportExist(HashMap<String, String> map) {
		int n = 0;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			n = dao.checkReportExist(session, map);
		} finally {
			session.close();
		}
		return n;
	}

	public PageDTO selectAllReport(HashMap<String, String> map, int curPage) {
		PageDTO pDTO = null;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			pDTO = dao.selectAllReport(session, map, curPage);
		} finally {
			session.close();
		}
		return pDTO;
	}

	public int deleteReport(List<String> ids) {
		int n = 0;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			n = dao.deleteReport(session, ids);
			session.commit();
		} finally {
			session.close();
		}
		return n;
	}

	public ReportDTO selectOneReport(String report_id) {
		ReportDTO dto = null;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			dto = dao.selectOneReport(session, report_id);
		} finally {
			session.close();
		}
		return dto;
	}

	public int selectChallIdFromComment(int comment_id) {
		int n = 0;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			n = dao.selectChallIdFromComment(session, comment_id);
		} finally {
			session.close();
		}
		return n;
	}

	public int updateReport(HashMap<String, String> map) {
		int n = 0;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			n = dao.updateReport(session, map);
			session.commit();
		} finally {
			session.close();
		}
		return n;
	}
	
	
	
	
	/////////////////

	public double getTotalSales() {
		double n = 0;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			n = dao.getTotalSales(session);
		} finally {
			session.close();
		}
		return n;
	}

	public double getTodaySales() {
		double n = 0;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			n = dao.getTodaySales(session);
		} finally {
			session.close();
		}
		return n;
	}


	
	


}
