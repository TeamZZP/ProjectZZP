package com.controller.profile;

import java.io.IOException;
import java.util.ArrayList;
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
import com.dto.ReviewDTO;
import com.dto.StampDTO;
import com.service.ChallengeService;
import com.service.ReviewService;

/**
 * Servlet implementation class ProfileCategoryServlet
 */
@WebServlet("/ProfileCategoryServlet")
public class ProfileCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfileCategoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userid = request.getParameter("userid");
		String category = request.getParameter("category");
		System.out.println(userid+" "+category);
		
		ChallengeService service = new ChallengeService();
		
		//페이징 처리
		String curPage = request.getParameter("curPage"); //현재페이지
		if (curPage == null) { curPage = "1"; } //시작 시 1페이지로 시작
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("userid", userid);
		
		String url = null;
		
		if (category.contains("review")) {
			
			//회원의 리뷰 가져오기
			ReviewService reviewService = new ReviewService();
			PageDTO reviewPageDTO = reviewService.selectUserReview(map, Integer.parseInt(curPage), 5);
			
			//리뷰에 해당하는 상품 정보 가져오기
			List<ReviewDTO> reviewList = reviewPageDTO.getList();
			HashMap<Integer, HashMap<String, String>> prodMap = new HashMap<Integer, HashMap<String,String>>();
			for (ReviewDTO r : reviewList) {
				prodMap.put(r.getP_ID(), reviewService.selectOneProduct(r.getP_ID()));
			}
			
			request.setAttribute("reviewPageDTO", reviewPageDTO);
			request.setAttribute("prodMap", prodMap);
			
			url = "profile/profileReview.jsp";
			
			if (category.equals("myreview")) {
				url = "myReview.jsp";
			} else if (category.equals("scrollreview")) {
				url = "profile/scrollreview.jsp";
			}
			
			
		} else if (category.contains("challenge")) {
			
			//회원의 챌린지 목록 가져오기
			PageDTO pDTO = service.selectChallengeByUserid(map, Integer.parseInt(curPage), 6);
			List<ChallengeDTO> challengeList = pDTO.getList();
			
			//각 게시글마다 도장 가져오기
			HashMap<String, String> stampListMap = new HashMap<String, String>();
			for (ChallengeDTO c : challengeList) {
				HashMap<String, String> stampMap = service.selectMemberStamp(c.getChall_id());
				if (stampMap != null) {
					stampListMap.put(String.valueOf(stampMap.get("CHALL_ID")), stampMap.get("STAMP_IMG"));
				}
			}
			//회원의 프로필 이미지 가져오기
			String profile_img = service.selectProfileImg(userid);
			
			request.setAttribute("profile_img", profile_img);
			request.setAttribute("stampListMap", stampListMap);
			request.setAttribute("pDTO", pDTO);
			
			url = "profile/profileChallenge.jsp";
			
			if (category.equals("mychallenge")) {
				url = "myChallenge.jsp";
			} else if (category.equals("scrollchallenge")) {
				url = "profile/scrollchallenge.jsp";
			}
			
			
		} else if (category.contains("stamp")) {
			
			//회원의 도장 목록 가져오기
			PageDTO pDTO = service.selectMemberStampByUserid(map, Integer.parseInt(curPage), 6);
			
			request.setAttribute("pDTO", pDTO);

			url = "profile/profileStamp.jsp";
			
			if (category.equals("mystamp")) {
				url = "myStamp.jsp";
			} else if (category.equals("scrollstamp")) {
				url = "profile/scrollstamp.jsp";
			}
			
		}

		RequestDispatcher dis = request.getRequestDispatcher(url);
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
