package com.controller.Question;

import java.io.IOException;
import java.io.PrintWriter;
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

import com.dto.PageDTO;
import com.dto.ProductDTO;
import com.service.QuestionService;

/**
 * Servlet implementation class QuestionProdSelet
 */
@WebServlet("/QuestionProdSelet")
public class QuestionProdSelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public QuestionProdSelet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String category = request.getParameter("category");
		String searchValue = request.getParameter("searchValue");
		System.out.println("검색 내용 " + category + searchValue);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("category", category);
		map.put("searchValue", searchValue); //map에 파씽한 검색내용 저장
		
		String prodNum = request.getParameter("prodNum");
		System.out.println("보여질 상품 갯수 "+ prodNum);
		
		QuestionService service = new QuestionService();
		String curPage = request.getParameter("curPage");
		if (curPage == null) {
			curPage = "1";
		}
		
		PageDTO page = service.prodSelect(map, Integer.parseInt(curPage), Integer.parseInt(prodNum));
		System.out.println(page);
		
		//List<ProductDTO> list = service.prodSelect(map);
		//System.out.println("검색한내용 " + list);
		int num = service.count(map);
		System.out.println("검색된 갯수 " + num);

		request.setAttribute("category", category);
		request.setAttribute("searchValue", searchValue);
		request.setAttribute("SelectList", page);
		request.setAttribute("SelectNum", num);
		request.setAttribute("perPage", prodNum); //검색갯수
		
		RequestDispatcher dis = request.getRequestDispatcher("questionproductSelect.jsp");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
