package com.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.omg.PortableServer.REQUEST_PROCESSING_POLICY_ID;

import com.config.MySqlSessionFactory;
import com.dao.QuestionDAO;
import com.dto.ImagesDTO;
import com.dto.PageDTO;
import com.dto.ProductDTO;
import com.dto.QuestionDTO;

public class QuestionService {
	
	QuestionDAO dao;
	
	public QuestionService() {
		super();
		dao = new QuestionDAO();
	}

	public List<QuestionDTO> questionList() {
		List<QuestionDTO> list = null;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			list = dao.questionList(session);
		} finally {
			session.close();
		}
		return list;
	}

	public QuestionDTO questionOneSelect(String qID) {
		QuestionDTO dto = null;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			dto = dao.questionOneSelect(session, qID);
		} finally {
			session.close();
		}
		return dto;
	}

	public int questionInsert(HashMap<String, String> map) {
		int num = 0;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			num = dao.questionInsert(session, map);
			session.commit();
		} finally {
			session.close();
		}
		return num;
	}

	public int questionUpdate(HashMap<String, String> map) {
		int num = 0;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			num = dao.questionUpdate(session, map);
			session.commit();
		} finally {
			session.close();
		}
		return num;
	}

	public int questionDelete(String qID) {
		int num = 0;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			num = dao.questionDelete(session, qID);
			session.commit();
		} finally {
			session.close();
		}
		return num;
	}

	public PageDTO page(int curPage) {
		PageDTO pDTO = null;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			pDTO = dao.page(session, curPage);
		} finally {
			session.close();
		}
		return pDTO;
	}

	public PageDTO prodSelect(Map<String, String> map, int curPage, int prodNum) {
		PageDTO list = null;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			list = dao.prodSelect(session, map, curPage, prodNum);
		} finally {
			session.close();
		}
		return list;
	}

	public int count(Map<String, String> map) {
		int num = 0;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			num = dao.count(session, map);
		} finally {
			session.close();
		}
		return num;
	}

	public List<ImagesDTO> ProdImg(List<String> p) {
		List<ImagesDTO> list = null;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			list = dao.ProdImg(session, p);
		} finally {
			session.close();
		}
		return list;
	}

	public List<QuestionDTO> prodQuestion(int pID) {
		List<QuestionDTO> list = null;
		SqlSession session = MySqlSessionFactory.getSqlSession();
		try {
			list = dao.prodQuestion(session, pID);
		} finally {
			session.close();
		}
		return list;
	}


}
