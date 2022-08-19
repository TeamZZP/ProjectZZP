package com.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dto.AddressDTO;

public class AddressDAO {

	public AddressDTO selectAddress(SqlSession session, String userid) {
		AddressDTO address=session.selectOne("AddressMapper.selectAddress", userid);
		return address;
	}

	public int changeAddress(SqlSession session, HashMap<String, String> changedAddMap) {
		int num=session.update("AddressMapper.changeAddress", changedAddMap);
		return num;
	}

	public List<AddressDTO> selectAllAddress(SqlSession session, String userid) {
		List<AddressDTO> addressList=session.selectList("AddressMapper.selectAllAddress", userid);
		return addressList;
	}

	public int deleteAddress(SqlSession session, int address_id) {
		int num=session.update("AddressMapper.deleteAddress", address_id);
		return num;
	}

	public int addAddress(SqlSession session, AddressDTO address) {
		int num=session.insert("AddressMapper.addAddress", address);
		return num;
	}

	public AddressDTO selectAddressId(SqlSession session, String address_id) {
		AddressDTO address=session.selectOne("AddressMapper.selectAddressId", address_id);
		return address;
	}

	

}
