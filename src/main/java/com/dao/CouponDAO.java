package com.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.dto.CouponDTO;
import com.dto.PageDTO;

public class CouponDAO {

	public PageDTO selectCoupon(SqlSession session, HashMap<String, String> map, int curPage) {
		PageDTO pDTO = new PageDTO();
		pDTO.setPerPage(10);
		int perPage = pDTO.getPerPage();
		int offset = (curPage - 1)*perPage;
		
		List<CouponDTO> list = session.selectList("CouponMapper.selectCoupon", map, new RowBounds(offset, perPage));
		
		pDTO.setCurPage(curPage);
		pDTO.setList(list);
		pDTO.setTotalCount(countCoupon(session, map));
		
		return pDTO;
	}

	private int countCoupon(SqlSession session, HashMap<String, String> map) {
		int num = session.selectOne("CouponMapper.countCoupon", map);
		return num;
	}

	public int couponInsert(SqlSession session, CouponDTO cDTO) {
		int num = session.insert("CouponMapper.couponInsert", cDTO);
		return num;
	}

}
