package com.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.dto.ChallengeDTO;
import com.dto.CommentsDTO;
import com.dto.PageDTO;
import com.dto.ReportDTO;
import com.dto.StampDTO;

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
	
	public int updateChallComments(SqlSession session, String chall_id) {
		int n = session.update("ChallengeMapper.updateChallComments", chall_id);
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
	
	public int updateChallLiked(SqlSession session, String chall_id) {
		int n = session.update("ChallengeMapper.updateChallLiked", chall_id);
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

	public int countLikedByMap(SqlSession session, HashMap<String, String> map) {
		int n = session.selectOne("ChallengeMapper.countLikedByMap", map);
		return n;
	}

	public String selectProfileImg(SqlSession session, String userid) {
		String profile_img = session.selectOne("ChallengeMapper.selectProfileImg", userid);
		return profile_img;
	}
	
	public PageDTO selectChallengeByUserid(SqlSession session, HashMap<String, String> map, int curPage, int perPage) {
		PageDTO pDTO = new PageDTO();
		pDTO.setPerPage(perPage);
		int offset = (curPage - 1)*perPage;
		
		List<ChallengeDTO> list = session.selectList("ChallengeMapper.selectChallengeByUserid", map, new RowBounds(offset, perPage));
		
		pDTO.setCurPage(curPage);
		pDTO.setList(list);
		pDTO.setTotalCount(countTotalUserChallenge(session, map));
		
		return pDTO;
	}
	
	public int countTotalUserChallenge(SqlSession session, HashMap<String, String> map) {
		return session.selectOne("ChallengeMapper.countTotalUserChallenge", map);
	}

	public int insertReply(SqlSession session, CommentsDTO dto) {
		int n = session.insert("ChallengeMapper.insertReply", dto);
		return n;
	}

	public int deleteAllComments(SqlSession session, String comment_id) {
		int n = session.delete("ChallengeMapper.deleteAllComments", comment_id);
		return n;
	}
	
	public int updateComment(SqlSession session, CommentsDTO dto) {
		int n = session.update("ChallengeMapper.updateComment", dto);
		return n;
	}

	public StampDTO selectOneStamp(SqlSession session, String chall_id) {
		StampDTO dto = session.selectOne("ChallengeMapper.selectOneStamp", chall_id);
		return dto;
	}

	public int updateChallThisMonth(SqlSession session, HashMap<String, Integer> map) {
		int n = session.update("ChallengeMapper.updateChallThisMonth", map);
		return n;
	}

	public int insertAdminChallenge(SqlSession session, HashMap<String, String> map) {
		int n = session.insert("ChallengeMapper.insertAdminChallenge", map);
		return n;
	}

	public ChallengeDTO selectChallThisMonth(SqlSession session) {
		ChallengeDTO dto = session.selectOne("ChallengeMapper.selectChallThisMonth");
		return dto;
	}

	public HashMap<String, String> selectMemberStamp(SqlSession session, int chall_id) {
		HashMap<String, String> map = session.selectOne("ChallengeMapper.selectMemberStamp", chall_id);
		return map;
	}
	
	public PageDTO selectMemberStampByUserid(SqlSession session, HashMap<String, String> map, int curPage,
			int perPage) {
		PageDTO pDTO = new PageDTO();
		pDTO.setPerPage(perPage);
		int offset = (curPage - 1)*perPage;
		
		List<StampDTO> list = session.selectList("ChallengeMapper.selectMemberStampByUserid", map, new RowBounds(offset, perPage));
		
		pDTO.setCurPage(curPage);
		pDTO.setList(list);
		pDTO.setTotalCount(countTotalStamp(session, map));
		
		return pDTO;
	}

	private int countTotalStamp(SqlSession session, HashMap<String, String> map) {
		return session.selectOne("ChallengeMapper.countTotalStamp", map);
	}

	public String selectStampImg(SqlSession session, String stampId) {
		String stampImg = session.selectOne("ChallengeMapper.selectStampImg", stampId);
		return stampImg;
	}

	public int updateStamp(SqlSession session, HashMap<String, String> map) {
		int n = session.update("ChallengeMapper.updateStamp", map);
		return n;
	}

	public int insertReport(SqlSession session, HashMap<String, String> map) {
		int n = session.insert("ChallengeMapper.insertReport", map);
		return n;
	}
	
	public int checkReportExist(SqlSession session, HashMap<String, String> map) {
		return session.selectOne("ChallengeMapper.checkReportExist", map);
	}

	public PageDTO selectAllReport(SqlSession session, HashMap<String, String> map, int curPage) {
		PageDTO pDTO = new PageDTO();
		pDTO.setPerPage(10);
		int perPage = pDTO.getPerPage();
		int offset = (curPage - 1)*perPage;
		
		List<ReportDTO> list = session.selectList("ChallengeMapper.selectAllReport", map, new RowBounds(offset, perPage));
		
		pDTO.setCurPage(curPage);
		pDTO.setList(list);
		pDTO.setTotalCount(countTotalReport(session, map));
		
		return pDTO;
	}

	private int countTotalReport(SqlSession session, HashMap<String, String> map) {
		return session.selectOne("ChallengeMapper.countTotalReport", map);
	}

	public int deleteReport(SqlSession session, List<String> ids) {
		return session.delete("ChallengeMapper.deleteReport", ids);
	}

	public ReportDTO selectOneReport(SqlSession session, String report_id) {
		return session.selectOne("ChallengeMapper.selectOneReport", report_id);
	}

	public int selectChallIdFromComment(SqlSession session, int comment_id) {
		return session.selectOne("ChallengeMapper.selectChallIdFromComment", comment_id);
	}

	public int updateReport(SqlSession session, HashMap<String, String> map) {
		return session.update("ChallengeMapper.updateReport", map);
	}

	
	
	////////////////
	public double getTotalSales(SqlSession session) {
		return session.selectOne("getTotalSales");
	}

	public double getTodaySales(SqlSession session) {
		return session.selectOne("getTodaySales");
	}

	public int getTotalMember(SqlSession session) {
		return session.selectOne("getTotalMember");
	}

	public int getTodayMember(SqlSession session) {
		return session.selectOne("getTodayMember");
	}

	


	
	



}
