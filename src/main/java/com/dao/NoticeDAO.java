package com.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.dto.NoticeDTO;

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

}
