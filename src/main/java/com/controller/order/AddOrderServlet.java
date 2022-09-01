package com.controller.order;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.MemberDTO;
import com.dto.OrderDTO;
import com.dto.ProductDTO;
import com.service.OrderService;
import com.service.ProductService;

/**
 * Servlet implementation class AddOrderServlet
 */
@WebServlet("/AddOrderServlet")
public class AddOrderServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		MemberDTO mdto = (MemberDTO)session.getAttribute("login");
		
		String AddressName = (String)request.getAttribute("AddressName");
		
		
		String[] pIdListString = request.getParameterValues("p_id");
		System.out.println("사이즈 1: " + pIdListString.length);
		String[] pAmountListString = request.getParameterValues("p_amount");
		String[] pPriceListString = request.getParameterValues("p_price");
		
		System.out.println("사이즈 2: " + pAmountListString.length);
		System.out.println("사이즈 3: " + pPriceListString.length);
		
		List<ProductDTO> productList= new ArrayList<ProductDTO>();
		OrderService service = new OrderService();
		ProductService product_service = new ProductService();

		//서비스 호출 ( 주문 시퀀스 얻어오는 메서드)
		int order_id = service.getOrderid();
		List<OrderDTO> orderList = new ArrayList<OrderDTO>();
		
		int n =0;
		for ( int  i = 0 ; i < pIdListString.length ; i++) {
			
			OrderDTO orderdto = new OrderDTO();
			ProductDTO pdto = new ProductDTO();
			
			orderdto.setOrder_id(order_id);
			orderdto.setUserid(mdto.getUserid());
			orderdto.setP_id(Integer.parseInt(pIdListString[i]));
			orderdto.setOrder_quantity(Integer.parseInt(pAmountListString[i]));
			orderdto.setTotal_price(Integer.parseInt(pPriceListString[i]));
			orderdto.setDelivery_address((String)request.getParameter("delivery_address"));
			orderdto.setDelivery_loc((String)request.getParameter("delivery_loc"));
			orderdto.setDelivery_req((String)request.getParameter("delivery_req"));
			
			System.out.println("<" + (i+1) + "> = " + orderdto.toString());
			 n += service.addOrder(orderdto);
			 orderList.add(orderdto);
			 int p_id = Integer.parseInt(pIdListString[i]);
			 pdto = product_service.productRetrieve(p_id);
			 productList.add(pdto);
		}
		

		System.out.println(n + "주문 전송 성공");
		
		request.setAttribute("orderList", orderList);
		request.setAttribute("productList", productList);
		RequestDispatcher dis = request.getRequestDispatcher("orderSheet.jsp");
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
