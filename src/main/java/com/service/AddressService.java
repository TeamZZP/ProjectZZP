package com.service;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.config.MySqlSessionFactory;
import com.dao.AddressDAO;
import com.dto.AddressDTO;

public class AddressService {
	AddressDAO dao;

	public AddressService() {
		super();
		dao = new AddressDAO();
	}

	public AddressDTO selectAddress(String userid) {
		SqlSession session=MySqlSessionFactory.getSqlSession();
		AddressDTO address=null;
		try {
			address=dao.selectAddress(session, userid);
		} finally {
			session.close();
		}
		return address;
	}



	
	
}
