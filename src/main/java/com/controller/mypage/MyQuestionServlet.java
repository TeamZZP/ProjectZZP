package com.controller.mypage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.MemberDTO;
import com.dto.PageDTO;
import com.dto.QuestionProductDTO;
import com.service.QuestionService;

@WebServlet("/MyQuestionServlet")
public class MyQuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MyQuestionServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberDTO mDTO = (MemberDTO) session.getAttribute("login");
		if (mDTO != null) {
			PageDTO pDTO = new PageDTO();
			String curPage = request.getParameter("curPage"); //현재 페이지
			if (curPage == null) {
				curPage = "1";
			}
			String userid = mDTO.getUserid();
			
			QuestionService service = new QuestionService();
			pDTO = service.MyQeustionList(Integer.parseInt(curPage), userid);
			System.out.println("pDTO " + pDTO);
			
			//List<QuestionProductDTO> myList = service.MyQeustionList(userid);
			//System.out.println(myList);
			
			session.setAttribute("myList", pDTO);		
			response.sendRedirect("myQuestion.jsp");
			
		} else {
			session.setAttribute("mesg", "로그인이 필요합니다");
			response.sendRedirect("LoginUIServlet");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
