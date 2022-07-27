package com.service;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dao.MemberDAO;
import com.dto.MemberDTO;

public class MemberService {
	
	MemberDAO dao;

	public MemberService() {
		super();
		dao = new MemberDAO();
	}

	public int addMember(MemberDTO dto) {
		SqlSession session = MySqlSessionFactory.getSqlSession();
		int num = 0;
		try {
			num = dao.addMember(session, dto);
			session.commit();
		} finally {
			session.close();
		}
		return num;
	}

	public int checkId(String userid) {
		SqlSession session = MySqlSessionFactory.getSqlSession();
		int num = 0;
		try {
			num = dao.checkId(session, userid);
		} finally {
			session.close();
		}
		return num;
	}

}
