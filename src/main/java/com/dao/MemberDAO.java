package com.dao;

import org.apache.ibatis.session.SqlSession;

import com.dto.MemberDTO;

public class MemberDAO {

	public int addMember(SqlSession session, MemberDTO dto) {
		return session.insert("addMember", dto);
	}

	public int checkId(SqlSession session, String userid) {
		return session.selectOne("checkId", userid);
	}
	
}
