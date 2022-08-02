package com.service;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dao.AccountDAO;
import com.dto.ProfileDTO;

public class AccountService {
	AccountDAO dao;
	
	public AccountService() {
		dao=new AccountDAO();
	}

	public int changePasswd(HashMap<String, String> passwdMap) {
		SqlSession session=MySqlSessionFactory.getSqlSession();
		int num=0;
		try {
			num=dao.changePasswd(session, passwdMap);
			session.commit();
		} finally {
			session.close();
		}
		return num;
	}

	public int changeEmail(HashMap<String, String> emailMap) {
		SqlSession session=MySqlSessionFactory.getSqlSession();
		int num=0;
		try {
			num=dao.changeEmail(session, emailMap);
			session.commit();
		} finally {
			session.close();
		}
		return num;
	}

	public int changeProfile(HashMap<String, String> profileMap) {
		SqlSession session=MySqlSessionFactory.getSqlSession();
		int num=0;
		try {
			num=dao.changeProfile(session, profileMap);
			session.commit();
		} finally {
			session.close();
		}
		return num;
	}

	public ProfileDTO selectProfile(String userid) {
		SqlSession session=MySqlSessionFactory.getSqlSession();
		ProfileDTO profile=null;
		try {
			profile=dao.selectProfile(session, userid);
		} finally {
			session.close();
		}
		return profile;
	}
}
