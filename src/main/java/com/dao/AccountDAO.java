package com.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

public class AccountDAO {

	public int changePasswd(SqlSession session, HashMap<String, String> passwdmap) {
		int num=session.update("AccountMapper.changePasswd", passwdmap);
		return num;
	}

	public int changeEmail(SqlSession session, HashMap<String, String> emailmap) {
		int num=session.update("AccountMapper.changeEmail", emailmap);
		return num;
	}
	
}
