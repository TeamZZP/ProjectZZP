<%@page import="com.dto.ChallengeDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
List<ChallengeDTO> challList = (List<ChallengeDTO>) request.getAttribute("challList");
System.out.println("challList"+challList);
%>