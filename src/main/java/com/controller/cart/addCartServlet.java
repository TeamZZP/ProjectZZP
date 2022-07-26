package com.controller.cart;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.CartDTO;
import com.dto.MemberDTO;
import com.service.CartService;


@WebServlet("/addCartServlet")
public class addCartServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
   
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      System.out.println("addCartServlet===========");
     
      HttpSession session = request.getSession();
      MemberDTO dto = (MemberDTO)session.getAttribute("login");
      System.out.println(dto);
     
      if(dto == null) {
         
         session.setAttribute("mesg", "로그인이 필요합니다");
         session.setMaxInactiveInterval(60*30);
         response.sendRedirect("LoginUIServlet");
         
      }else {
         
         String userid = dto.getUserid();
         int p_id = Integer.parseInt(request.getParameter("p_id"));
         String p_name = request.getParameter("p_name");
         int p_selling_price= Integer.parseInt(request.getParameter("p_selling_price"));
         int p_amount = Integer.parseInt(request.getParameter("p_amount"));
         String p_image = request.getParameter("p_image");
         
         CartDTO cart = new CartDTO();
         cart.setUserid(userid);
         cart.setP_id(p_id);
         cart.setP_amount(p_amount);
         cart.setP_image(p_image);
         cart.setP_name(p_name);
         cart.setP_selling_price(p_selling_price);
         System.out.println(cart);
         
         CartService service = new CartService();
         HashMap<String, Object> map = new HashMap<String, Object>() ;
         map.put("p_id", p_id);
         map.put("userid", userid);
         
		 int count = service.checkCart(map); 
		 System.out.println("동일한상품 확인 "+count);
		 
		 if(count==0) {
			 int num = service.cartAdd(cart);
	         System.out.println("insert갯수======"+num);
	         response.sendRedirect("CartListServlet");
	         
	       }else{
			service.updateCart(cart);
			response.sendRedirect("CartListServlet");
			
		 }
         
        
         
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