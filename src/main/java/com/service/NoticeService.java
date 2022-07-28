package com.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dao.NoticeDAO;
import com.dto.NoticeDTO;

public class NoticeService {

	NoticeDAO dao;
	
	public NoticeService() {
		dao = new NoticeDAO();
	}
	
	public List<NoticeDTO> pointNotice() {
		SqlSession session = MySqlSessionFactory.getSqlSession();
		List<NoticeDTO> list = null;
		try {
			list = dao.pointNotice(session);
		} finally {
			session.close();
		}
		return list;
	}

	public NoticeDTO noticeOneSelect(String noticeID) {
		SqlSession session = MySqlSessionFactory.getSqlSession();
		NoticeDTO nDTO = null;
		try {
			nDTO = dao.noticeOneSelect(session, noticeID);
		} finally {
			session.close();
		}
		return nDTO;
	}

	public int noticeUpdate(NoticeDTO dto) {
		int num = 0;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			num = dao.noticeUpdate(session, dto);
			session.commit();
		} finally {
			session.close();
		}
		return num;
	}

	public int NoticeDelete(String NOTICE_ID) {
		int num = 0;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			num = dao.NoticeDelete(session, NOTICE_ID);
			session.commit();
		} finally {
			session.close();
		}
		return num;
	}


}
