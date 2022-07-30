package com.challenge.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.CommentsDTO;
import com.dto.MemberDTO;
import com.service.ChallengeService;

/**
 * Servlet implementation class CommentsAddServlet
 */
@WebServlet("/CommentsAddServlet")
public class CommentsAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentsAddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//회원전용처리
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO) session.getAttribute("login");
		
		if (member != null) {
			String chall_id = request.getParameter("chall_id");
			String comment_content = request.getParameter("comment_content");
			String userid = request.getParameter("userid");
			
			CommentsDTO dto = new CommentsDTO();
			dto.setChall_id(Integer.parseInt(chall_id));
			dto.setComment_content(comment_content);
			dto.setUserid(userid);
			
			ChallengeService service = new ChallengeService();
			int n = service.insertComment(dto);
			
			System.out.println(n+"개의 레코드 추가");
			
			List<CommentsDTO> commentsList = service.selectAllComments(chall_id);
			
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			String result = "";
			
			for (int i = 0; i < commentsList.size(); i++) {
				CommentsDTO c = commentsList.get(i);
				result += "<tr>";
				result += "<td>"+c.getUserid()+"</td>";
				result += "<td>"+c.getComment_content()+"</td><td>";
				if (c.getUserid()!=null && c.getUserid().equals(userid)) {
					result += "<a href='CommentsDeleteServlet?chall_id="+chall_id;
					result += "&comment_id="+c.getComment_id()+"&userid="+c.getUserid()+"' class='commentDelBtn'>삭제</a>";
				} else {
					result += "<a href=''>신고</a>";
				}
				result += "</td></tr>";
			}
			out.print(result);
			
		} else {
			session.setAttribute("mesg", "잘못된 접근입니다.");
			response.sendRedirect("LoginUIServlet");
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
