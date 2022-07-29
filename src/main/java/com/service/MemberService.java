package com.service;

import java.util.HashMap;

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

	public int addMember(HashMap<String, String> map) {
		SqlSession session = MySqlSessionFactory.getSqlSession();
		int num = 0;
		try {
			num = dao.addMember(session, map);
			session.commit();
		} finally {
			session.close();
		}
		return num;
	}

	public MemberDTO loginMember(HashMap<String, String> map) {
		SqlSession session = MySqlSessionFactory.getSqlSession();
		MemberDTO dto = null;
		try {
			dto = dao.loginMember(session, map);
		} finally {
			session.close();
		}
		return dto;
	}

	public MemberDTO mypage(String userid) {
		SqlSession session=MySqlSessionFactory.getSqlSession();
		MemberDTO member=null;
		try {
			member=dao.mypage(session, userid);
		} finally {
			session.close();
		}
		return member;
	}

}
