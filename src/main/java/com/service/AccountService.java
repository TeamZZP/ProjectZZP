package com.service;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dao.AccountDAO;

public class AccountService {
	AccountDAO dao;
	
	public AccountService() {
		dao=new AccountDAO();
	}

	public int changePasswd(HashMap<String, String> map) {
		SqlSession session=MySqlSessionFactory.getSqlSession();
		int num=0;
		try {
			num=dao.changePasswd(session, map);
			session.commit();
		} finally {
			session.close();
		}
		return num;
	}
}
