package com.controller.admin;

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
import com.service.ImagesService;
import com.service.ProductService;
import com.service.QuestionService;

@WebServlet("/AdminProdAddServlet")
public class AdminProdAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@SuppressWarnings("unused")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//관리자전용처리
		HttpSession session = request.getSession();
		MemberDTO mDTO = (MemberDTO) session.getAttribute("login");
		if (mDTO!=null && mDTO.getRole()==1) {
			
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
								
							if ("image_route_1".equals(fieldName)) {
								try {
									String old_file = map.get("old_file");
									if (old_file==null || old_file.length()==0) {
										item.write(new File(dir, saveName));
										map.put("image_route_1", saveName);
										map.put("image_rnk2", "1");
									} else {
										map.put("image_route_1", old_file);
										map.put("image_rnk1", "1");
									}
									System.out.println(map);
								}catch (Exception e) {
									e.printStackTrace();
								}
							}
							
							if ("image_route_2".equals(fieldName)) {
								try {
									String old_stamp = map.get("old_stamp");
									
									if (old_stamp==null || old_stamp.length()==0) {
										item.write(new File(dir, saveName));
										map.put("image_route_2", saveName);
										map.put("image_rnk2", "2");
									} else {
										map.put("image_route_2", old_stamp);
										map.put("image_rnk2", "2");
									}
									System.out.println(map);
								}catch (Exception e) {
									e.printStackTrace();
								}
							}
							
							if ("image_route_3".equals(fieldName)) {
								try {
									String old_stamp = map.get("old_stamp");
									
									if (old_stamp==null || old_stamp.length()==0) {
										item.write(new File(dir, saveName));
										map.put("image_route_3", saveName);
										map.put("image_rnk3", "3");
									} else {
										map.put("image_route_3", old_stamp);
										map.put("image_rnk3", "3");
									}
									System.out.println(map);
								}catch (Exception e) {
									e.printStackTrace();
								}
							}
							
							if ("image_route_4".equals(fieldName)) {
								try {
									String old_stamp = map.get("old_stamp");
									
									if (old_stamp==null || old_stamp.length()==0) {
										item.write(new File(dir, saveName));
										map.put("image_route_4", saveName);
										map.put("image_rnk4", "4");
									} else {
										map.put("image_route_4", old_stamp);
										map.put("image_rnk4", "4");
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
				//product 추가
				ProductService p_service = new ProductService();
				int p_num = p_service.insertProduct(map);
				System.out.println("product : "+p_num+"개의 레코드 추가");
				//image 추가
				ImagesService i_service = new ImagesService();
				int i_num = i_service.insertImage(map);
				System.out.println("image : "+i_num+"개의 레코드 추가");
				
				
				response.sendRedirect("AdminCategoryServlet?category=product");
				
				/*
				 * if ("upload".equals(operate)) { int n = service.insertProduct(map);
				 * System.out.println("product : "+n+"개의 레코드 추가"); int n2 =
				 * service2.insertImage(map); System.out.println("product : "+n2+"개의 레코드 추가");
				 * 
				 * if (n != 0) { session.setAttribute("mesg", "상품이 등록되었습니다.");
				 * response.sendRedirect("AdminCategoryServlet?category=product"); } else {
				 * session.setAttribute("mesg", "상품이 등록되지 않았습니다. 다시 시도하세요.");
				 * response.sendRedirect("AdminCategoryServlet?category=product"); }
				 * 
				 * } else if ("update".equals(operate)) { int n = service.updateProduct(map);
				 * System.out.println(n+"개의 레코드 업데이트");
				 * 
				 * if (n != 0) { session.setAttribute("mesg", "상품이 수정되었습니다.");
				 * response.sendRedirect("AdminCategoryServlet?category=product"); } else {
				 * session.setAttribute("mesg", "상품 수정에 실패하였습니다. 다시 시도하세요.");
				 * response.sendRedirect("AdminCategoryServlet?category=product"); } }
				 */
			}
		} else { //로그인 아닐 경우
			session.setAttribute("mesg", "로그인이 필요합니다.");
			response.sendRedirect("LoginUIServlet");
		}
	}
	
	private String getTodayString() {
		return new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss").format(System.currentTimeMillis());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}