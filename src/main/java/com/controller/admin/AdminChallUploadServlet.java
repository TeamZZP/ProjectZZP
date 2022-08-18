package com.controller.admin;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
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

/**
 * Servlet implementation class AdminChallUploadServlet
 */
@WebServlet("/AdminChallUploadServlet")
public class AdminChallUploadServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); 
		
		//회원전용처리
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO) session.getAttribute("login"); 
		String userid = request.getParameter("userid");
		System.out.println(userid);
		
		if (member!=null && member.getUserid().equals(userid)) {
			
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
								
							if ("chall_img".equals(fieldName)) {
								
								try {
									String old_file = map.get("old_file");
									
									if (old_file==null || old_file.length()==0) {
										item.write(new File(dir, saveName));
										map.put("chall_img", saveName);
									} else {
										map.put("chall_img", old_file);
									}
									
								}catch (Exception e) {
									e.printStackTrace();
								}
							}
							
							if ("stamp_img".equals(fieldName)) {
								
								try {
									String old_stamp = map.get("old_stamp");
									
									if (old_stamp==null || old_stamp.length()==0) {
										item.write(new File(dir, saveName));
										map.put("stamp_img", saveName);
									} else {
										map.put("stamp_img", old_stamp);
									}
									System.out.println(map);
								}catch (Exception e) {
									e.printStackTrace();
								}
							}
							
						}//end else
					}//end while
					
					
				} catch (FileUploadException e) {
					e.printStackTrace();
				}
				
				
				ChallengeService service = new ChallengeService();
				String operate = request.getParameter("operate");
				
				//어떤 동작을 요청받았는지에 따라 다른 작업 처리하기
				//챌린지 게시글 업로드
				if ("upload".equals(operate)) {
					int n = service.insertChallenge(map);
					System.out.println(n+"개의 챌린지 레코드 추가");
					
					int n2 = service.insertStamp(map);
					System.out.println(n2+"개의 도장 레코드 추가");
					
					response.sendRedirect("AdminMainServlet");
					
				//챌린지 게시글 업데이트
				} else if ("update".equals(operate)) {
					int n = service.updateChallenge(map);
					System.out.println(n+"개의 챌린지 레코드 업데이트");
					
					response.sendRedirect("ChallengeDetailServlet?chall_id="+map.get("chall_id"));
					
					
				}
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	public byte[] imageToByteArray (String filePath) {
		byte[] returnValue = null;
		
		ByteArrayOutputStream baos = null;
		FileInputStream fis = null;
		
		try {
			baos = new ByteArrayOutputStream();
			fis = new FileInputStream(filePath);
			
			byte[] buf = new byte[1024];
			int read = 0;
			
			while ((read=fis.read(buf, 0, buf.length)) != -1) {
				baos.write(buf, 0, read);
			}
			
			returnValue = baos.toByteArray();
			
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			try {
				if (baos != null) {
					baos.close();
				}
				if (fis != null) {
					fis.close();
				}
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		
		return returnValue;
	}
	
	private String getTodayString() {
		return new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss").format(System.currentTimeMillis());
	}

}
