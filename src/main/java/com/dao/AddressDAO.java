package com.dao;

import org.apache.ibatis.session.SqlSession;

import com.dto.AddressDTO;

public class AddressDAO {

	public AddressDTO selectAddress(SqlSession session, String userid) {
		AddressDTO address=session.selectOne("selectAddress", userid);
		return address;
	}

	

}
