package com.controller.order;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

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
@WebServlet("/OrderServlet2")
public class OrderServlet_uj extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("OrderServlet실행됨");
		
		HttpSession session = request.getSession();
		MemberDTO mdto = (MemberDTO)session.getAttribute("login");
		String userid = mdto.getUserid();
		
		String productid = request.getParameter("p_id");
		System.out.println(productid);
		//배열에 , 기준으로 잘라서 넣음
		String [] pId = productid.split(",");
		
		System.out.println(Arrays.toString(pId)); //주소 대신 배열
		
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
		System.out.println(clist);
		
		for (int i = 0; i < clist.size(); i++) {
			int p_id = clist.get(i).getP_id();
			int p_amount = clist.get(i).getP_amount();
			System.out.println(p_id+" "+p_amount);
		}
		
		
		String mesg = "";
		int p_amount = 0;
		
		
			if(mdto != null) {
				String[] pIdListString = request.getParameterValues("p_id");  //String []로 데이터 파싱해옴
				String[] pAmountListString = request.getParameterValues("p_amount");
				
						
				
				List<Integer> pIdList = new ArrayList<Integer>();
				
				for (int i = 0; i < pIdListString.length; i++) {             //int[] 형태로 형변환
					 System.out.println("상품 : "+ pIdListString[i]);
					 System.out.println("수량 : "+ pAmountListString[i]);
					 pIdList.add(Integer.parseInt(pIdListString[i]));
					 System.out.println("Int"+pIdList.get(i));
					
					 
			    }
					OrderService service = new OrderService();
					List<CategoryProductDTO> list = new ArrayList<CategoryProductDTO>();
				
					list = service.getProductList(pIdList); //p_id List로 상품List<상품DTO> 저장
					
					
				for (int i = 0; i < pIdList.size(); i++) {
					System.out.println(list.get(i));
				}
				
				
				ArrayList<HashMap<String, String>> PList = new ArrayList<HashMap<String, String>>();

				for ( int i = 0; i < pIdListString.length; i++ ) {
					
					HashMap<String, String> p = new HashMap<String, String>();
					p.put("p_id", pIdListString[i] );
					if(pAmountListString[i].equals("0")||pAmountListString[i]==null) {
						p.put("p_amount", "1" );

					}else {
						p.put("p_amount", pAmountListString[i] );
					}
					
					
					PList.add(p);
					
				}

				
				
			//배송지
			AddressService add_service = new AddressService();
			List<AddressDTO> add_list = add_service.selectAllAddress(mdto.getUserid());
			
			
		
			
			request.setAttribute("list", list);
			request.setAttribute("add_list", add_list);
			request.setAttribute("pAmountListString", pAmountListString);
			request.setAttribute("PList", PList);
			
		
			
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
