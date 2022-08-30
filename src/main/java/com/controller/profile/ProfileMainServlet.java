package com.controller.profile;

import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.ChallengeDTO;
import com.dto.PageDTO;
import com.dto.ProductDTO;
import com.dto.ReviewDTO;
import com.dto.StampDTO;
import com.service.ChallengeService;
import com.service.ReviewService;

/**
 * Servlet implementation class ProfileMainServlet
 */
@WebServlet("/ProfileMainServlet")
public class ProfileMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfileMainServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String userid = request.getParameter("userid");
		
		ChallengeService service = new ChallengeService();
		
		//회원의 프로필 가져오기
		HashMap<String, String> profileMap = service.selectProfile(userid);
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("userid", userid);
		
		//회원의 리뷰 가져오기
		ReviewService reviewService = new ReviewService();
		PageDTO reviewPageDTO = reviewService.selectUserReview(map, 1, 4);
		//리뷰에 해당하는 상품 정보 가져오기
		List<ReviewDTO> reviewList = reviewPageDTO.getList();
		HashMap<Integer, HashMap<String, String>> prodMap = new HashMap<Integer, HashMap<String,String>>();
		for (ReviewDTO r : reviewList) {
			prodMap.put(r.getP_ID(), reviewService.selectOneProduct(r.getP_ID()));
		}
		//회원의 리뷰 개수 가져오기
		int reviewNum = reviewService.countTotalUserReview(map);
		
		//회원의 챌린지 목록 가져오기
		PageDTO pDTO = service.selectChallengeByUserid(map, 1, 4);
		//회원의 챌린지 개수 가져오기
		int challNum = service.countTotalUserChallenge(map);
		
		//회원의 도장 목록 가져오기
		List<StampDTO> stampList = service.selectMemberStampByUserid(userid);
		//이미지와 함께 hashmap에 담기 (중복 stamp_id 제거 위해 LinkedHashMap 사용)
		LinkedHashMap<Integer, StampDTO> stampMap = new LinkedHashMap<Integer, StampDTO>();
		for (StampDTO dto : stampList) {
			stampMap.put(dto.getStamp_id(), dto);
		}
		
		request.setAttribute("reviewPageDTO", reviewPageDTO);
		request.setAttribute("prodMap", prodMap);
		request.setAttribute("reviewNum", reviewNum);
		request.setAttribute("pDTO", pDTO);
		request.setAttribute("challNum", challNum);
		request.setAttribute("profileMap", profileMap);
		request.setAttribute("stampMap", stampMap);
		
		RequestDispatcher dis = request.getRequestDispatcher("profileMain.jsp");
		dis.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
