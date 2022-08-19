package com.controller.Question;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

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

import com.dto.MemberDTO;
import com.service.ChallengeService;
import com.service.QuestionService;

/**
 * Servlet implementation class UploadServlet
 */
@WebServlet("/QuestionUploadServlet")
public class QuestionUploadServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//회원전용처리
		HttpSession session = request.getSession();
		MemberDTO mDTO = (MemberDTO) session.getAttribute("login");
		String USERID = request.getParameter("USERID");
		System.out.println("유저 "+ USERID);
		
		if (mDTO!=null && mDTO.getUserid().equals(USERID)) {
			
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
						if(item.isFormField()) {
							//type="file"이 아닌 것의 처리
							String name = item.getFieldName();
							String value= item.getString("utf-8");
								System.out.println(name+"\t"+ value);
							map.put(name, value);
							
						} else {
							//type="file"의 처리 
							fileName= item.getName();
							if (fileName.length() != 0) {
								fieldName= item.getFieldName();
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
									item.write(new File(dir, saveName));
									map.put("question_img", saveName);
									
								}catch (Exception e) {
									e.printStackTrace();
								}
							} else {
								fieldName= item.getFieldName();
								contentType= item.getContentType();
								isInMemory=item.isInMemory();
								sizeInBytes= item.getSize();
								saveName = getTodayString() + "-" + fileName;
								
								String oldFile = map.get("oldFile");
								
									System.out.println("fieldName====" + fieldName);					
									System.out.println("fileName====" + fileName);					
									System.out.println("contentType====" + contentType);					
									System.out.println("isInMemory====" + isInMemory);					
									System.out.println("sizeInBytes====" + sizeInBytes);		
									System.out.println("savedName====" + saveName);	
									System.out.println("oldFile====" + oldFile);
								
								try {
									if (oldFile.length() != 0 || oldFile != null ) {
										map.put("question_img", oldFile);
									} else {
										map.put("question_img", fileName);
									} 
										
									
								}catch (Exception e) {
									e.printStackTrace();
								}
							}
							
						}//end else
					}//end while
					
					
				} catch (FileUploadException e) {
					e.printStackTrace();
				}
				
				QuestionService service = new QuestionService();
				String operate = request.getParameter("operate");
				System.out.println("상태 "+ operate);
				
				if ("upload".equals(operate)) {
					int n = service.questionInsert(map);
					System.out.println(n+"개의 레코드 추가");
					
					if (n != 0) {
						session.setAttribute("mesg", "게시물이 등록되었습니다.");
						response.sendRedirect("QuestionListServlet");
					} else {
						session.setAttribute("mesg", "게시물이 등록 실패하였습니다. 다시 시도하세요.");
						response.sendRedirect("QuestionListServlet");
					}
					
				} else if ("update".equals(operate)) {
					int n = service.questionUpdate(map);
					System.out.println(n+"개의 레코드 업데이트");
					
					if (n != 0) {
						session.setAttribute("mesg", "게시물이 업데이트 되었습니다.");
						response.sendRedirect("QuestionListServlet");
					} else {
						session.setAttribute("mesg", "게시물 업데이트를 실패하였습니다. 다시 시도하세요.");
						response.sendRedirect("QuestionListServlet");
					}
				}
			}
		} else {
			session.setAttribute("mesg", "로그인이 필요합니다.");
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
