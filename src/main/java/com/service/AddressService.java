package com.service;

import java.util.HashMap;
import java.util.List;

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

	public int changeAdd(HashMap<String, String> changedAddMap) {
		SqlSession session=MySqlSessionFactory.getSqlSession();
		int num=0;
		try {
			num=dao.changeAdd(session, changedAddMap);
			session.commit();
		} finally {
			session.close();
		}
		return num;
	}

	public List<AddressDTO> selectAllAddress(String userid) {
		SqlSession session=MySqlSessionFactory.getSqlSession();
		List<AddressDTO> addressList=null;
		try {
			addressList=dao.selectAllAddress(session, userid);
		} finally {
			session.close();
		}
		return addressList;
	}



	
	
}
