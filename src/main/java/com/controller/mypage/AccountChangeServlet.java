package com.controller.mypage;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Collection;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.dto.AddressDTO;
import com.dto.MemberDTO;
import com.service.AccountService;
import com.service.AddressService;

/**
 * Servlet implementation class AccountChangeServlet
 */

@MultipartConfig(
		maxFileSize = 1024 * 1024 * 50//file 하나 최대 크기 지정 50mb
)
@WebServlet("/AccountChangeServlet")
public class AccountChangeServlet extends HttpServlet {
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("마이페이지 수정 서블릿 실행");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		HttpSession session=request.getSession();
		
		MemberDTO dto=(MemberDTO) session.getAttribute("login");
		//회원 전용
		if (dto != null) {
			//자식창에서 넘어온 데이터 파싱
			String chagnePasswd=request.getParameter("chagnePasswd");
			String userid=request.getParameter("userid");
			System.out.println(chagnePasswd);
			System.out.println(userid);
			
			String email1=request.getParameter("email1");
			String email2=request.getParameter("email2");
			System.out.println(email1);
			System.out.println(email2);
			
			String post=request.getParameter("post");
			String addr1=request.getParameter("addr1");
			String addr2=request.getParameter("addr2");
			System.out.println(post);
			System.out.println(addr1);
			System.out.println(addr2);
			
/*			//String profileImg=request.getParameter("profileImg");
			Collection<Part> parts=request.getParts();
			String originName=null;
			String filePath=null;
			for (Part file : parts) {
				if (!file.getName().equals("profile_img")) continue;//name이 profileImg인 경우에만 실행되도록
				//사용자가 업로드한 파일 이름 알아오기
				originName=file.getSubmittedFileName();
				
				//사용자가 업로드한 파일에 input 스트림 연결
				InputStream fis=file.getInputStream();
				
				//저장할 경로
				String realPath=request.getServletContext().getRealPath("mypage/upload");
				
				//파일 경로
				filePath=realPath + File.separator + originName;
				
				//파일 저장
				FileOutputStream fos=new FileOutputStream(filePath);
				
				byte[] buf=new byte[1024];
				int size=0;
				while ((size=fis.read(buf)) != -1) {
					fos.write(buf, 0, size);
				}
				System.out.println(originName);
				System.out.println(fis);
				System.out.println(realPath);
				System.out.println(filePath);
				System.out.println(fos);
				fis.close();
				fos.close();
			}//end for	*/
			String profile_txt=request.getParameter("profile_txt");
			//System.out.println(profile_img);//null--img 태그 데이터는 어떻게 파싱?
			System.out.println(profile_txt);
			
			if (chagnePasswd != null) {
				//1. 비밀번호 update--userid 데이터도 필요함--현재 changePasswd.jsp에는 userid 값이 없음->hidden으로 설정
				HashMap<String, String> passwdMap=new HashMap<String, String>();
				passwdMap.put("userid", userid);
				passwdMap.put("chagnePasswd", chagnePasswd);
				System.out.println(passwdMap);
				AccountService service=new AccountService();
				int num=service.changePasswd(passwdMap);
				System.out.println("수정된 비밀번호 갯수 : "+num);//--비밀번호 수정 완료
				//기존에 보던 수정 페이지로
				response.sendRedirect("mypage/changePasswd.jsp");
			} else if (email1 != null && email2 != null ) {
				//2. 이메일 update
				HashMap<String, String> emailMap=new HashMap<String, String>();
				emailMap.put("userid", userid);
				emailMap.put("email1", email1);
				emailMap.put("email2", email2);
				System.out.println(emailMap);
				AccountService service=new AccountService();
				int num=service.changeEmail(emailMap);
				System.out.println("수정된 이메일 갯수 : "+num);//--이메일 수정 완료
				//기존에 보던 수정 페이지로
				response.sendRedirect("mypage/changeEmail.jsp");
			} else if (profile_txt != null) {
				//3. 프로필 update
				System.out.println("프로필 수정");
//				request.setAttribute("path", originName);
				
/*				HashMap<String, String> profileMap=new HashMap<String, String>();
				profileMap.put("userid", userid);
				profileMap.put("profile_txt", profile_txt);
				System.out.println(profileMap);
				session.setAttribute("profileMap", profileMap);
				AccountService service=new AccountService();
				int num=service.changeProfile(profileMap);
				System.out.println("수정된 프로필 : "+num);	*/
				
//				request.getRequestDispatcher("mypage/changeProfile.jsp").forward(request, response);//이미지 업로드 실패
				//기존에 보던 수정 페이지로
				response.sendRedirect("mypage/changeProfile.jsp");
			} else if (post != null && addr1 != null) {
				//System.out.println("주소 수정");
				HashMap<String, String> addressMap=new HashMap<String, String>();
				addressMap.put("userid", userid);
				addressMap.put("post", post);
				addressMap.put("addr1", addr1);
				addressMap.put("addr2", addr2);
				System.out.println(addressMap);
				AccountService service=new AccountService();
				int num=service.changeAddress(addressMap);
				System.out.println("수정된 주소 갯수 : "+num);
				//기존에 보던 수정 페이지로
				response.sendRedirect("mypage/changeAddress.jsp");
			} else {
				System.out.println("수정 추가");
			}
		} else {
			//alert로 로그인 후 이용하세요 출력
			String mesg="로그인이 필요합니다.";
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
