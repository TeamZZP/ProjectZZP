package com.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.dto.MemberDTO;

public class MemberDAO {

	public int checkId(SqlSession session, String userid) {
		return session.selectOne("checkId", userid);
	}

	public int addMember(SqlSession session, HashMap<String, String> map) {
		return session.insert("addMember", map);
	}

	public MemberDTO loginMember(SqlSession session, HashMap<String, String> map) {
		return session.selectOne("loginMember", map);
	}

	public MemberDTO selectMember(SqlSession session, String userid) {
		MemberDTO member=session.selectOne("MemberMapper.selectMember", userid);
		return member;
	}

	public int changePw(SqlSession session, HashMap<String, String> changedPwMap) {
		int num=session.update("MemberMapper.changePw", changedPwMap);
		return num;
	}
	
	public int changeEmail(SqlSession session, HashMap<String, String> changedEmailMap) {
		int num=session.update("MemberMapper.changeEmail", changedEmailMap);
		return num;
	}

	public int deleteMember(SqlSession session, String userid) {
		int num=session.update("MemberMapper.deleteMember", userid);
		return num;
	}
	
}