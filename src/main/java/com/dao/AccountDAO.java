package com.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

public class AccountDAO {

	public int changePasswd(SqlSession session, HashMap<String, String> passwdMap) {
		int num=session.update("AccountMapper.changePasswd", passwdMap);
		return num;
	}

	public int changeEmail(SqlSession session, HashMap<String, String> emailMap) {
		int num=session.update("AccountMapper.changeEmail", emailMap);
		return num;
	}
	
}
