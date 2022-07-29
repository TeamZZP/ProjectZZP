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
	
}