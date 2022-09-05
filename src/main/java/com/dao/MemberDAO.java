package com.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.dto.AddressDTO;
import com.dto.CategoryProductDTO;
import com.dto.MemberDTO;
import com.dto.PageDTO;

public class MemberDAO {

	public int checkId(SqlSession session, String userid) {
		return session.selectOne("checkId", userid);
	}

	public int addMember(SqlSession session, HashMap<String, String> map) throws Exception {
		return session.insert("addMember", map);
	}

	public MemberDTO loginMember(SqlSession session, HashMap<String, String> map) {
		return session.selectOne("loginMember", map);
	}

	public MemberDTO selectMember(SqlSession session, String userid) {
		MemberDTO member=session.selectOne("MemberMapper.selectMember", userid);
		return member;
	}

	public int changePw(SqlSession session, HashMap<String, String> changedPwMap) {
		int num=session.update("MemberMapper.changePw", changedPwMap);
		return num;
	}
	
	public int changeEmail(SqlSession session, HashMap<String, String> changedEmailMap) {
		int num=session.update("MemberMapper.changeEmail", changedEmailMap);
		return num;
	}

	public int deleteMember(SqlSession session, String userid) {
		int num=session.update("MemberMapper.deleteMember", userid);
		return num;
	}

	public MemberDTO findId(SqlSession session, HashMap<String, String> map) {
		return session.selectOne("findId", map);
	}
	
	public MemberDTO findPw(SqlSession session, HashMap<String, String> map) {
		return session.selectOne("findPw", map);
	}

	public MemberDTO checkPw(SqlSession session, String userid) {
		return session.selectOne("checkPw", userid);
	}

	public PageDTO selectAllMember(SqlSession sessioin, HashMap<String, String> map, int curPage) {
		PageDTO pDTO=new PageDTO();
		pDTO.setCurPage(curPage);
		pDTO.setPerPage(5);//한 페이지에 5개 출력
		int perPage=pDTO.getPerPage();//한 페이지에 출력 갯수
		int offset=(curPage-1)*perPage;//페이지 시작 idx
		
		//map에 검색 조건, 검색어, 정렬 저장된 상태
		List<AddressDTO> list=sessioin.selectList("MemberMapper.selectAllMember", map, new RowBounds(offset, perPage));
		
		pDTO.setList(list);//현재 페이지에 해당하는 데이터 리스트
		pDTO.setTotalCount(totalCount(sessioin, map));//전체 레코드 갯수
		return pDTO;
	}
	private int totalCount(SqlSession session, HashMap<String, String> map) {
		return session.selectOne("MemberMapper.totalCount", map);
	}

	public MemberDTO selectMemberBySocial(SqlSession session, HashMap<String, String> map) {
		return session.selectOne("selectMemberBySocial", map);
	}

	public int changeMember(SqlSession session, HashMap<String, String> changeMemberMap) {
		int num=session.update("MemberMapper.changeMember", changeMemberMap);
		return num;
	}

	public MemberDTO checkPasswd(SqlSession session, HashMap<String, String> map) {
		return session.selectOne("checkPasswd", map);
	}

}