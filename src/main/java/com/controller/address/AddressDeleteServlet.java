package com.controller.address;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.AddressDTO;
import com.dto.MemberDTO;
import com.service.AddressService;

/**
 * Servlet implementation class AddressAddServlet222
 */
@WebServlet("/AddressDeleteServlet")
public class AddressDeleteServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("회원 배송지 삭제 서블릿 실행");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		HttpSession session=request.getSession();
		
		MemberDTO dto=(MemberDTO) session.getAttribute("login");
		int address_id=Integer.parseInt(request.getParameter("address_id"));
		System.out.println(address_id);
		
		String mesg="";
		//회원 전용
		if (dto != null) {
			String result="";
			String userid=dto.getUserid();
			System.out.println(userid);
			AddressService a_service=new AddressService();
			
			//회원의 주소 목록 가져오기
			List<AddressDTO> addressList=a_service.selectAllAddress(userid);
			System.out.println(addressList.size());
			if (addressList.size() == 1) {//회원의 주소가 1개 남았을 때는 삭제 불가
				result="배송지는 최소 1개 이상이어야 합니다.";
			} else {
				//address_id로 해당 dto 삭제
				int num=a_service.deleteAddress(address_id);
				System.out.println("삭제 배송지 갯수 : "+num);
				//삭제 후 회원 배송지 리스트 출력
				addressList=a_service.selectAllAddress(userid);
				for (int i = 0; i < addressList.size(); i++) {
					AddressDTO a=addressList.get(i);
					result += "	<tr id=\"list\">\r\n"
							+ "		<td style=\"padding:5 0 0 10px;\">\r\n"
							+ "			<span>"+a.getAddress_name()+"</span><br>\r\n"
							+ "			<span>"+a.getReceiver_name()+"</span><br>\r\n"
							+ "			<span>"+a.getDefault_chk()+"</span>\r\n"
							+ "		</td>\r\n"
							+ "		<td>\r\n"
							+ "			<span style=\"font-size: 14px\"><%= post_num %></span><br>\r\n"
							+ "			<%=  addr1+ \"<br>\" + addr2 %>\r\n"
							+ "		</td>\r\n"
							+ "		<td style=\"text-align: center;\">\r\n"
							+ "			<span><%= phone %></span>\r\n"
							+ "		</td>\r\n"
							+ "		<td style=\"text-align: center;\">\r\n"
							+ "			<!-- Modal -->\r\n"
							+ "			<div class=\"modal fade\" id=\"deleteAddress\" data-bs-backdrop=\"static\" data-bs-keyboard=\"false\" tabindex=\"-1\" aria-labelledby=\"staticBackdropLabel\" aria-hidden=\"true\">\r\n"
							+ "			  <div class=\"modal-dialog\">\r\n"
							+ "			    <div class=\"modal-content\">\r\n"
							+ "			      <div class=\"modal-header\">\r\n"
							+ "			        <h5 class=\"modal-title\" id=\"staticBackdropLabel\">배송지 삭제</h5>\r\n"
							+ "			        <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"modal\" aria-label=\"Close\"></button>\r\n"
							+ "			      </div>\r\n"
							+ "			      <div class=\"modal-body\">\r\n"
							+ "			        선택한 배송지를 삭제하시겠습니까?\r\n"
							+ "			      </div>\r\n"
							+ "			      <div class=\"modal-footer\">\r\n"
							+ "			        <button type=\"button\" id=\"delete<%= address_id %>\" class=\"btn btn-success\">삭제</button>\r\n"
							+ "			        <button type=\"button\" class=\"btn btn-secondary\" data-bs-dismiss=\"modal\">취소</button>\r\n"
							+ "			      </div>\r\n"
							+ "			    </div>\r\n"
							+ "			  </div>\r\n"
							+ "			</div>\r\n"
							+ "			<div class=\"btns\" style=\"display: inline-block\">\r\n"
							+ "			<!-- Button trigger modal -->\r\n"
							+ "			<button type=\"button\" id=\"change<%= address_id %>\" data-edit=\"<%= address_id %>\" class=\"btn btn-light btn-sm\">수정</button>\r\n"
							+ "			<button type=\"button\" id=\"checkDelete<%= address_id %>\" data-id=\"<%= address_id %>\" class=\"btn btn-light btn-sm\" data-bs-toggle=\"modal\" data-bs-target=\"#deleteAddress\">\r\n"
							+ "				삭제\r\n"
							+ "			</button><!-- open modal -->\r\n"
							+ "			</div>\r\n"
							+ "		</td>\r\n"
							+ "<%\r\n"
							+ "		}\r\n"
							+ "	}\r\n"
							+ "%>\r\n"
							+ "	</tr>";
				}
			}
			out.print(result);
			//ajax--redirectX
		} else {
			//alert로 로그인 후 이용하세요 출력
			mesg="로그인이 필요합니다.";
			session.setAttribute("mesg", mesg);
			session.setMaxInactiveInterval(60*30);
			
			response.sendRedirect("LoginUIServlet");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
