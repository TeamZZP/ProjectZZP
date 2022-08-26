package com.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.dto.NoticeDTO;
import com.dto.PageDTO;

public class NoticeDAO {

	public List<NoticeDTO> pointNotice(SqlSession session) {
		List<NoticeDTO> list = session.selectList("NoticeMapper.pointNotice");
		return list;
	}
	public List<NoticeDTO> noticeList(SqlSession session) {
		List<NoticeDTO> list = session.selectList("NoticeMapper.noticeList");
		return list;
	}
	
	public NoticeDTO noticeOneSelect(SqlSession session, int noticeID) {
		NoticeDTO nDTO = session.selectOne("NoticeMapper.noticeOneSelect", noticeID);
		return nDTO;
	}

	public int noticeUpdate(SqlSession session, NoticeDTO dto) {
		int num = session.update("NoticeMapper.noticeUpdate", dto);
		return num;
	}

	public int NoticeDelete(SqlSession session, String NOTICE_ID) {
		int num = session.delete("NoticeMapper.NoticeDelete", NOTICE_ID);
		return num;
	}
	public int noticeHite(SqlSession session, Map<String, Integer> map) {
		int num = session.update("NoticeMapper.noticeHite", map);
		return num;
	}
	public PageDTO page(SqlSession session, int curPage) {
		PageDTO pDTO = new PageDTO();
		pDTO.setPerPage(10);
		int perPage = pDTO.getPerPage();
		int offset = (curPage - 1) * perPage;
		
		List<NoticeDTO> list = session.selectList("NoticeMapper.noticeList", null, new RowBounds(offset, perPage));
		
		pDTO.setCurPage(curPage);
		pDTO.setList(list);
		pDTO.setTotalCount(totalCount(session));
		
		return pDTO;
	}
	private int totalCount(SqlSession session) {
		return session.selectOne("NoticeMapper.totalCount");
	}
	public int NoticeInsert(SqlSession session, NoticeDTO nDTO) {
		int num = session.insert("NoticeMapper.NoticeInsert", nDTO);
		return num;
	}
	public int nextNoticeID(SqlSession session, Map<String, String> map) {
		int num = session.selectOne("NoticeMapper.nextNoticeID", map);
		return num;
	}
	
}
