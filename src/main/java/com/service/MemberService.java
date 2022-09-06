package com.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dao.MemberDAO;
import com.dto.MemberDTO;
import com.dto.PageDTO;
import com.dto.ProfileDTO;

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

	public int addMember(HashMap<String, String> map) throws Exception {
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

	public MemberDTO selectMember(String userid) {
		SqlSession session=MySqlSessionFactory.getSqlSession();
		MemberDTO member=null;
		try {
			member=dao.selectMember(session, userid);
		} finally {
			session.close();
		}
		return member;
	}

	public int changePw(HashMap<String, String> changedPwMap) {
		SqlSession session=MySqlSessionFactory.getSqlSession();
		int num=0;
		try {
			num=dao.changePw(session, changedPwMap);
			session.commit();
		} finally {
			session.close();
		}
		return num;
	}
	
	public int changeEmail(HashMap<String, String> changedEmailMap) {
		SqlSession session=MySqlSessionFactory.getSqlSession();
		int num=0;
		try {
			num=dao.changeEmail(session, changedEmailMap);
			session.commit();
		} finally {
			session.close();
		}
		return num;
	}

	public int deleteMember(String userid) {
		SqlSession session=MySqlSessionFactory.getSqlSession();
		int num=0;
		try {
			num=dao.deleteMember(session, userid);
			session.commit();
		} finally {
			session.close();
		}
		return num;
	}

	public MemberDTO findId(HashMap<String, String> map) {
		SqlSession session = MySqlSessionFactory.getSqlSession();
		MemberDTO dto = null;
		try {
			dto = dao.findId(session, map);
		} finally {
			session.close();
		}
		return dto;
	}
	
	public MemberDTO findPw(HashMap<String, String> map) {
		SqlSession session = MySqlSessionFactory.getSqlSession();
		MemberDTO dto = null;
		try {
			dto = dao.findPw(session, map);
		} finally {
			session.close();
		}
		return dto;
	}

	public MemberDTO checkPw(String userid) {
		SqlSession session = MySqlSessionFactory.getSqlSession();
		MemberDTO dto = null;
		try {
			dto = dao.checkPw(session, userid);
		} finally {
			session.close();
		}
		return dto;
	}
	public PageDTO selectAllMember(HashMap<String, String> map, int curPage) {
		SqlSession sessioin=MySqlSessionFactory.getSqlSession();
		PageDTO dto=null;
		try {
			dto=dao.selectAllMember(sessioin, map, curPage);
		} finally {
			sessioin.close();
		}
		return dto;
	}

	public MemberDTO selectMemberBySocial(HashMap<String, String> map) {
		SqlSession session=MySqlSessionFactory.getSqlSession();
		MemberDTO dto = null;
		try {
			dto = dao.selectMemberBySocial(session,map);
		} finally {
			session.close();
		}
		return dto;
	}

	public int changeMember(HashMap<String, String> changeMemberMap) {
		SqlSession session=MySqlSessionFactory.getSqlSession();
		int num=0;
		try {
			num=dao.changeMember(session, changeMemberMap);
			session.commit();
		} finally {
			session.close();
		}
		return num;
	}

	public MemberDTO checkPasswd(HashMap<String, String> map) {
		SqlSession session = MySqlSessionFactory.getSqlSession();
		MemberDTO dto = null;
		try {
			dto = dao.checkPasswd(session, map);
		} finally {
			session.close();
		}
		return dto;
	}

	public ProfileDTO selectProfile(String userid) {
		SqlSession session = MySqlSessionFactory.getSqlSession();
		ProfileDTO dto=null;
		try {
			dto=dao.selectProfile(session, userid);
		} finally {
			session.close();
		}
		return dto;
	}

	public int changeProfile(HashMap<String, String> map) {
		SqlSession session=MySqlSessionFactory.getSqlSession();
		int num=0;
		try {
			num=dao.changeProfile(session, map);
			session.commit();
		} finally {
			session.close();
		}
		return num;
	}

}