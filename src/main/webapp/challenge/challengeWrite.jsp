<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<form action="ChallengeAddServlet" method="post">
<table border="1">
	<tr>
	  <td>
		<select name="chall_category">
		  <option value="" selected disabled hidden>분류 선택하기</option>
	 	  <option>이 달의 챌린지</option>
	 	  <option>쓰레기 줄이기</option>
	 	  <option>소비 줄이기</option>
	 	  <option>아껴쓰기</option>
	 	  <option>기부하기</option>
		</select>
	  </td>
	  <td>
		제목: <input type="text" name="chall_title">
	  </td>
	</tr>
	<tr>
	  <td colspan="2">사진 올리기<input type="text" name="chall_img"></td>
	</tr>
	<tr>
	  <td colspan="2">본문 작성<input type="text" name="chall_content"></td>
	</tr>
	<tr>
	  <td><a>취소</a></td>
	  <td><input type="submit" value="글쓰기"></td>
	</tr>
</table>
</form>