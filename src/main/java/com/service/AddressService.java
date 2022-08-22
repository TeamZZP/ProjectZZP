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

	public AddressDTO selectDefaultAddress(String userid) {
		SqlSession session=MySqlSessionFactory.getSqlSession();
		AddressDTO address=null;
		try {
			address=dao.selectDefaultAddress(session, userid);
		} finally {
			session.close();
		}
		return address;
	}

	public int changeAddress(HashMap<String, String> changedAddMap) {
		SqlSession session=MySqlSessionFactory.getSqlSession();
		int num=0;
		try {
			num=dao.changeAddress(session, changedAddMap);
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

	public int deleteAddress(int address_id) {
		SqlSession session=MySqlSessionFactory.getSqlSession();
		int num=0;
		try {
			num=dao.deleteAddress(session, address_id);
			session.commit();
		} finally {
			session.close();
		}
		return num;
	}

	public int addAddress(AddressDTO address) {
		SqlSession session=MySqlSessionFactory.getSqlSession();
		int num=0;
		try {
			num=dao.addAddress(session, address);
			session.commit();
		} finally {
			session.close();
		}
		return num;
	}

	public AddressDTO selectAddressId(String address_id) {
		SqlSession session=MySqlSessionFactory.getSqlSession();
		AddressDTO address=null;
		try {
			address=dao.selectAddressId(session, address_id);
		} finally {
			session.close();
		}
		return address;
	}

	public int changeNotDefaultAddress(String userid) {
		SqlSession session=MySqlSessionFactory.getSqlSession();
		int num=0;
		try {
			num=dao.changeNotDefaultAddress(session, userid);
			session.commit();
		} catch (Exception e) {
			session.close();
		}
		return num;
	}

}
