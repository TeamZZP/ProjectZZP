package com.config;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MySqlSessionFactory {
	
	static SqlSessionFactory sqlSessionFactory;
	
	static {
		String resource = "com/config/Configuration.xml"; 
		InputStream inputStream = null;
		try {
			inputStream = Resources.getResourceAsStream(resource);
			System.out.println("Configuration.xml 로딩 성공");
		} catch (IOException e) {
			e.printStackTrace();
		}
		sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
	}
	public static SqlSession getSqlSession() {
		SqlSession session = sqlSessionFactory.openSession();
		return session;
	}
	

}
