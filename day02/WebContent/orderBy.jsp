<%@page import="dao.GuestVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.GuestDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>순서 변경</title>
</head>
<body>
	<%
	    GuestDAO guestDAO = new GuestDAO();
	    ArrayList<GuestVO> guests = guestDAO.selectAll();
	    
	%>
	<form action="db.jsp">
		<input type="text" name="keyword" placeholder="이름을 입력해주세요.">
		<input type="submit" value="결과 확인">
	</form>
	
	<table border="1"; width=50%; height: 500px;>
      <%for(int i=guests.size()-1; i>=0; i--){ %>
         <tr>
            <td><%=guests.get(i).getGuestNumber()%></td>
            <td><%=guests.get(i).getGuestName()%></td>
            <td><%=guests.get(i).getGuestBirth()%></td>
         </tr>
      <%} %>
   </table>
   
	<form action="guest_jdbc.jsp">
		<input type="submit" value="오름차순 정렬하기" id="test" class="on" onclick="orderChange()">
	</form>
   
</body>
<script type="text/javascript">
	const orderBy = document.querySelector(".on");
	var $tr = document.querySelectorAll("tr");
	orderBy.addEventListener("click", function(){
		if(document.getElementById('test').className == "on"){
			document.getElementById('test').className = "off";
			document.getElementById('test').value = "내림차순 정렬하기";
		} else{
			document.getElementById('test').className = "on";
			document.getElementById('test').value = "오름차순 정렬하기";
		}
	})
	
	
</script>
</html>