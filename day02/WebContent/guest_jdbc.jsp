
<%@page import="dao.GuestVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.GuestDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 전체 목록</title>
</head>
<body>
	<%!
		GuestDAO guestDAO = new GuestDAO();
		GuestVO guestVO = new GuestVO();
		ArrayList<GuestVO> guests = guestDAO.selectAll();
	%>
	

	<form action="db.jsp">
		<input type="text" name="keyword" placeholder="이름을 입력해주세요.">
		<input type="submit" value="결과 확인">
	</form>


	<table border="1"; width=50%; height: 500px;>
		<%
		for(int i = 0; i<guests.size(); i++){ %>
			<tr>
				<td><%=guests.get(i).getGuestNumber() %> </td>	
				<td><%=guests.get(i).getGuestName() %> </td>	
				<td><%=guests.get(i).getGuestBirth() %> </td>	
			</tr>
		<%} %>
	</table>
	
	<form action="orderBy.jsp">
		<input type="submit" value="내림차순 정렬하기">
	</form>

</body>
</html>