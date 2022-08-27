package com.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.omg.PortableServer.REQUEST_PROCESSING_POLICY_ID;

import com.config.MySqlSessionFactory;
import com.dao.NoticeDAO;
import com.dto.NoticeDTO;
import com.dto.PageDTO;

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
	
	public List<NoticeDTO> noticeList() {
		SqlSession session = MySqlSessionFactory.getSqlSession();
		List<NoticeDTO> list = null;
		try {
			list = dao.noticeList(session);
		} finally {
			session.close();
		}
		return list;
	}

	public NoticeDTO noticeOneSelect(int noticeID) {
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

	public int noticeHite(Map<String, Integer> map) {
		int num = 0;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			num = dao.noticeHite(session, map);
			session.commit();
		} finally {
			session.close();
		}
		return num;
	}

	public PageDTO page(int curPage) {
		PageDTO pDTO = null;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			pDTO = dao.page(session, curPage);
		} finally {
			session.close();
		}
		return pDTO;
	}

	public int NoticeInsert(NoticeDTO nDTO) {
		int num = 0;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			num = dao.NoticeInsert(session, nDTO);
			session.commit();
		} finally {
			session.close();
		}
		return num;
	}

	public int nextNoticeID(Map<String, String> map) {
		int num = 0;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			num = dao.nextNoticeID(session, map);
		} finally {
			session.close();
		}
		return num;
	}


}
