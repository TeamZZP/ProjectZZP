package com.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

public class AccountDAO {

	public int changePasswd(SqlSession session, HashMap<String, String> map) {
		int num=session.update("AccountMapper.changePasswd", map);
		return num;
	}
	
}
