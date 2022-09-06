<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<td>
				<b>내 첨부파일</b>
			</td>
			<td></td>
		</tr>
		<tr>
			<td colspan="2">
				<img alt="첨부파일" src="<%=request.getParameter("img") %>" id="upload" width="380px" height="500px" title="첨부파일">
			</td>
		</tr>
	</table>
</body>
</html>