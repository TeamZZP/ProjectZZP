package com.controller.order;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.AddressDTO;
import com.dto.CartDTO;
import com.dto.CategoryProductDTO;
import com.dto.MemberDTO;
import com.service.AddressService;
import com.service.CartService;
import com.service.OrderService;

/**
 * Servlet implementation class OrderServlet
 */
@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("OrderServlet실행됨");
		
		HttpSession session = request.getSession();
		MemberDTO mdto = (MemberDTO)session.getAttribute("login");
		String userid = mdto.getUserid();
		
		
		
		
		
		
		String mesg = "";
		
			if(mdto != null) {
				
				String productid = request.getParameter("p_id");
				System.out.println(productid);
				//배열에 , 기준으로 잘라서 넣음
				String [] pId = productid.split(",");
				
				System.out.println(Arrays.toString(pId)); 
				
				//p_id 리스트
				List<String> p_idList = Arrays.asList(pId);
				CartService cService = new CartService();
				
				
				List<CartDTO> clist = new ArrayList<CartDTO>();
				CartDTO c1 = null;
				
				//p_id, userid에 맞는 장바구니 제품 정보
				HashMap<String, String> map = new HashMap<String, String>();
				map.put("userid", userid);
				for (int i = 0; i < p_idList.size(); i++) {
					 System.out.println(p_idList.get(i));
					map.put("p_id", p_idList.get(i));
					c1 = cService.selectCart(map);
					clist.add(c1);
				}
				System.out.println(">>오더서블릿"+clist);
				
				//총 상품가격 
				CartService Cservice = new CartService();
				int sum_money = Cservice.sum_money(userid); //총금액
				int fee = sum_money >= 50000? 0: 3000; //배송비 계산
				int total = sum_money+fee; //총금액 + 배송비
				
				Map<String,Object> Cmap = new HashMap<>();
			
				Cmap.put("sum_money",sum_money); 
				Cmap.put("fee",fee); 
				Cmap.put("total",total); 
				
				//배송지
				AddressService add_service = new AddressService();
				List<AddressDTO> add_list = add_service.selectAllAddress(mdto.getUserid());
				
				
			
				request.setAttribute("map", Cmap);
				request.setAttribute("list", clist);
				request.setAttribute("add_list", add_list);

			
				
				RequestDispatcher dis = request.getRequestDispatcher("order.jsp");
				dis.forward(request, response);
				
				

				
		}else {
				mesg="회원전용 서비스입니다, 로그인이 필요합니다.";
				session.setAttribute("mesg", mesg);
				session.setMaxInactiveInterval(60*30);
				response.sendRedirect("LoginUIServlet");
		}
		
		
}


	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
