package com.controller.mypage;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.dto.AddressDTO;
import com.dto.MemberDTO;
import com.dto.ProfileDTO;
import com.service.AddressService;
import com.service.MemberService;

/**
 * Servlet implementation class MypageServlet
 */
@WebServlet("/ProfileChangeServlet")
public class ProfileChangeServlet extends HttpServlet {
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//데이터 베이스에서 회원 정보 가져옴
		System.out.println("프로필 수정 서블릿 실행");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		HttpSession session=request.getSession();
		PrintWriter out=response.getWriter();
		
		MemberDTO dto=(MemberDTO) session.getAttribute("login");
		
		//회원 전용
		if (dto != null) {
			//multipart 여부 검사
			boolean isMultipart= ServletFileUpload.isMultipartContent(request);
			if (isMultipart) {
				DiskFileItemFactory factory= new DiskFileItemFactory();
				
				ServletContext servletContext= this.getServletConfig().getServletContext();
				File repository= (File) servletContext.getAttribute("javax.servlet.context.tempdir");
				factory.setRepository(repository);
				factory.setSizeThreshold(1024*1024*10);
				
				ServletFileUpload upload= new ServletFileUpload(factory);
				upload.setFileSizeMax(1024*1024*10); //10M
				String fieldName=null;
				String fileName= null;
				String contentType= null;
				boolean isInMemory= false;
				long sizeInBytes=0;
				String saveName= null;
				
				HashMap<String, String> map = new HashMap<String, String>();
				
				try {
					List<FileItem> items= upload.parseRequest(request);
					Iterator<FileItem> iter= items.iterator();
					
					while (iter.hasNext()) {
						FileItem item= iter.next();
						if (item.isFormField()) {
							//type="file"이 아닌 것의 처리
							String name = item.getFieldName();
							String value= item.getString("utf-8");
								System.out.println(name+"\t"+ value);
							map.put(name, value);
							
						} else {
							//type="file"의 처리 
							fieldName= item.getFieldName();
							fileName= item.getName();
							contentType= item.getContentType();
							isInMemory=item.isInMemory();
							sizeInBytes= item.getSize();
							saveName = getTodayString() + "-" + fileName;
							
								System.out.println("fieldName====" + fieldName);					
								System.out.println("fileName====" + fileName);					
								System.out.println("contentType====" + contentType);					
								System.out.println("isInMemory====" + isInMemory);					
								System.out.println("sizeInBytes====" + sizeInBytes);		
								System.out.println("savedName====" + saveName);		
							
							File dir = new File("C:\\eclipse\\upload");
							if (!dir.exists()) {
								dir.mkdirs();
							}
							
							try {
								String old_file = map.get("old_file");
								
								if (old_file==null || old_file.length()==0) {
									item.write(new File(dir, saveName));
									map.put("profile_img", saveName);
								} else {
									map.put("profile_img", old_file);
									System.out.println("올드파일저장");
								}
								
								System.out.println(map);
								
							}catch (Exception e) {
								e.printStackTrace();
							}
						}//end else
					}//end while
					
				} catch (FileUploadException e) {
					e.printStackTrace();
				}
			}			
			
			String userid=dto.getUserid();
			//회원 프로필
			MemberService service=new MemberService();
			HashMap<String, String> map=new HashMap<String, String>();
			
			String profile_img=request.getParameter("profile_img");
			String profile_txt=request.getParameter("profile_txt");
			map.put("userid", userid);
			
			String data=null;
			if (profile_img != null) {//이미지가 변경됐을 때
				map.put("profile_img", profile_img);
				System.out.println("이미지 변경-----"+map);
				int num=service.changeProfile(map);
				System.out.println("프로필 이미지 수정 : "+num);
				ProfileDTO profile=service.selectProfile(userid);
				data=profile.getProfile_img();
			}
			if (profile_txt != null) {//텍스트가 변경됐을 때
				map.put("profile_txt", profile_txt);
				System.out.println("메세지 변경-----"+map);
				int num=service.changeProfile(map);
				System.out.println("프로필 메세지 수정 : "+num);
				ProfileDTO profile=service.selectProfile(userid);
				data=profile.getProfile_txt();
			}
			out.print(data);
			
		} else {
			//alert로 로그인 후 이용하세요 출력
			String mesg="로그인이 필요합니다.";
			session.setAttribute("mesg", mesg);
			session.setMaxInactiveInterval(60*30);
			
			response.sendRedirect("LoginUIServlet");
		}
	}
	private String getTodayString() {
		return new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss").format(System.currentTimeMillis());
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
