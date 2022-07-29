package com.dao;

import org.apache.ibatis.session.SqlSession;

import com.dto.AddressDTO;

public class AddressDAO {

	public AddressDTO address(SqlSession session, String userid) {
		AddressDTO address=session.selectOne("address", userid);
		return address;
	}

	

}
