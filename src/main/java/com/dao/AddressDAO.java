package com.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.dto.AddressDTO;

public class AddressDAO {

	public AddressDTO selectAddress(SqlSession session, String userid) {
		AddressDTO address=session.selectOne("AddressMapper.selectAddress", userid);
		return address;
	}

	public int changeAdd(SqlSession session, HashMap<String, String> changedAddMap) {
		int num=session.update("AddressMapper.changeAdd", changedAddMap);
		return num;
	}

	

}
