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

	public int couponDelete(SqlSession session, String coupon_id) {
		int num = session.delete("CouponMapper.couponDelete", coupon_id);
		return num;
	}

	public int couponAllDel(SqlSession session, List<String> couponList) {
		int num = session.delete("CouponMapper.couponAllDel", couponList);
		return num;
	}

	public CouponDTO selectOneCoupon(SqlSession session, String coupon_id) {
		CouponDTO cDTO = session.selectOne("CouponMapper.selectOneCoupon", coupon_id); 
		return cDTO;
	}

	public int couponUpdate(SqlSession session, CouponDTO dto) {
		int num = session.update("CouponMapper.couponUpdate", dto);
		return num;
	}

}
