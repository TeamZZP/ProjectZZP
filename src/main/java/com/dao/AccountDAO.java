package com.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.dto.ProfileDTO;

public class AccountDAO {

	public int changePasswd(SqlSession session, HashMap<String, String> passwdMap) {
		int num=session.update("AccountMapper.changePasswd", passwdMap);
		return num;
	}

	public int changeEmail(SqlSession session, HashMap<String, String> emailMap) {
		int num=session.update("AccountMapper.changeEmail", emailMap);
		return num;
	}

	public int changeProfile(SqlSession session, HashMap<String, String> profileMap) {
		int num=session.update("AccountMapper.changeProfile", profileMap);
		return num;
	}

	public ProfileDTO selectProfile(SqlSession session, String userid) {
		ProfileDTO profile=session.selectOne("AccountMapper.selectProfile", userid);
		return profile;
	}
	
}
