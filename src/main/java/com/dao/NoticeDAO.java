package com.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dto.NoticeDTO;

public class NoticeDAO {

	public List<NoticeDTO> pointNotice(SqlSession session) {
		List<NoticeDTO> list = session.selectList("NoticeMapper.pointNotice");
		return list;
	}

	public NoticeDTO noticeOneSelect(SqlSession session, String noticeID) {
		NoticeDTO nDTO = session.selectOne("NoticeMapper.noticeOneSelect", noticeID);
		return nDTO;
	}

	public int noticeUpdate(SqlSession session, NoticeDTO dto) {
		int num = session.update("noticeUpdate", dto);
		return num;
	}

	public int NoticeDelete(SqlSession session, String NOTICE_ID) {
		int num = session.delete("NoticeDelete", NOTICE_ID);
		return num;
	}

}
