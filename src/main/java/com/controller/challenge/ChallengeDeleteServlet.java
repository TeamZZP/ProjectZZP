package com.controller.challenge;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.ChallengeDTO;
import com.dto.MemberDTO;
import com.service.ChallengeService;

/**
 * Servlet implementation class ChallengeDeleteServlet
 */
@WebServlet("/ChallengeDeleteServlet")
public class ChallengeDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChallengeDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userid = request.getParameter("userid");
		
		//회원전용처리
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO) session.getAttribute("login");
		
		if (member!=null && member.getUserid().equals(userid)) {
			String chall_id = request.getParameter("chall_id");
			ChallengeService service = new ChallengeService();
			
			//현재 진행중인 이달의 챌린지 여부 검사
			ChallengeDTO dto = service.selectOneChallenge(chall_id);
			if (dto.getChall_this_month() == 1) {
				
				//관리자가 작성한 이달의 챌린지 개수 가져오기
				HashMap<String, String> map = new HashMap<String, String>();
				map.put("userid", "admin1");
				int challNum = service.countTotalUserChallenge(map);
				
				//유일한 이달의 챌린지 게시글인 경우 삭제 불가
				if (challNum == 1) {
					session.setAttribute("mesg", "다른 챌린지 게시글을 작성한 후 삭제 가능합니다.");
					
				} else {
					int n = service.deleteChallenge(chall_id);
					System.out.println(n+"개의 레코드 삭제");
					
					//해당 게시글을 제외하고 가장 마지막에 작성한 게시글의 chall_this_month 값 1로 설정 
					HashMap<String, Integer> updateMap = new HashMap<String, Integer>();
					updateMap.put("before", 0);
					updateMap.put("after", 1);
					int updateNum = service.updateChallThisMonth(updateMap);
					System.out.println(updateNum+"개의 이달의 챌린지 레코드 상태 변경");
					
				}
				response.sendRedirect("AdminCategoryServlet?category=challenge");
				
			} else {
				int n = service.deleteChallenge(chall_id);
				System.out.println(n+"개의 레코드 삭제");
				
				response.sendRedirect("ChallengeListServlet");
				
			}
			
			
		} else {
			session.setAttribute("mesg", "잘못된 접근입니다.");
			response.sendRedirect("ChallengeListServlet");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
