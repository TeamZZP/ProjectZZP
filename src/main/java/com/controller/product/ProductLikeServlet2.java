
package com.controller.product;

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
import com.service.ProductService;

/**
 * Servlet implementation class ProductLikeServlet
 */
@WebServlet("/ProductLikeServlet2")
public class ProductLikeServlet2 extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	System.out.println("ProductLikeServlet 실행됨"+ request.getParameter("p_id"));
	request.setCharacterEncoding("utf-8");
	PrintWriter out = response.getWriter();
	HttpSession session = request.getSession();
	MemberDTO dto = (MemberDTO)session.getAttribute("login");
	String p_id = request.getParameter("p_id");
	String userid = request.getParameter("userid");
	System.out.println(p_id+userid);
	if(dto != null) {
		
		HashMap<String,String> map = new HashMap<String, String>();
		map.put("p_id", p_id);
		map.put("userid", userid);
		
		ProductService service = new ProductService();
		//찜 갯수 확인 
		int likecheck = service.likeCheck(map);
		
		//찜 추가
		if(likecheck== 0) {
			int n = service.addLike(map);
			System.out.println(n+"찜 추가");
		if(n==1) {
			//찜 수 올리기
			int result = service.upProdcutLiked(p_id);
			System.out.println(result+"찜 수 업데이트");
			//찜 누적 수 
			int likedNum = service.p_likedNum(p_id);
			out.print("<img src='images/liked.png' width='30' height='30' class='liked'>"+likedNum);
			 }
		
		  }else if(likecheck == 1) {
			  int n = service.deleteLike(map);
			  System.out.println("찜삭제"+n);
			  if(n==1) {
				  int result = service.downProductLiked(p_id);
					System.out.println(result+"찜 수 업데이트");
					
					int likedNum = service.p_likedNum(p_id);
					out.print("<img src='images/like.png' width='30' height='30' class='liked'>"+likedNum);	
					
			  }
		  }
		request.setAttribute("likecheck", likecheck);
	}else {
		session.setAttribute("mesg", "로그인이 필요합니다.");
		response.sendRedirect("LoginUIServlet");
	}
	
	
	
}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}


