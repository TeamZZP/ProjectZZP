package com.controller.challenge;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.MemberDTO;
import com.service.ChallengeService;

/**
 * Servlet implementation class LikeServlet
 */
@WebServlet("/LikeServlet")
public class LikeServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
request.setCharacterEncoding("utf-8");
		
		//회원전용처리
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO) session.getAttribute("login");
		
		if (member != null) {
			String chall_id = request.getParameter("chall_id");
			String userid = request.getParameter("userid");
			
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("chall_id", chall_id);
			map.put("userid", userid);
			
			ChallengeService service = new ChallengeService();
			PrintWriter out = response.getWriter();
			
			//해당 게시글에 현재 회원이 좋아요를 눌렀는지 확인
			int likedIt = service.countLikedByMap(map);
			 
			int n = 0;
			String img = null;
			
			//좋아요 추가
			if (likedIt == 0) {
				n = service.insertLike(map);
				System.out.println(n+"개의 레코드 좋아요 추가");
				img = "images/liked.png";
			
			//좋아요 삭제
			} else if (likedIt == 1) {
				n = service.deleteLike(map);
				System.out.println(n+"개의 레코드 좋아요 삭제");
				img = "images/like.png";
			}
			
			if (n == 1) {
				//해당 게시글의 좋아요 수 변경
				int result = service.updateChallLiked(chall_id);
				System.out.println(result+"개의 레코드 좋아요수 업데이트");
				
				out.print(img);
			}
			
		} else {
			session.setAttribute("mesg", "잘못된 접근입니다.");
			response.sendRedirect("LoginUIServlet");
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
