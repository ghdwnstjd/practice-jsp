<%@page import="vo.GuestVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.GuestDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 전체 목록</title>
<style>
   p {
       margin-left: 120px;
   }
</style>
</head>
<body>
   <%
   	  request.setCharacterEncoding("UTF-8"); //POST 방식을 사용하기 때문에 선언부에 UTF-8 인코딩을 무조건 기재해주어야 한다.
      GuestDAO guestDAO = new GuestDAO();
      ArrayList<GuestVO> guests = guestDAO.selectAll(false);
   %>
   <main>
      <form action="search_result.jsp" method="post">
         <input type="text" placeholder="이름을 입력하세요." name="keyword">
      </form>
      <p><a href="javascript:send(true);">정렬 ↑</a></p>
   </main>
   <table border="1">
      <%for(int i=0; i<guests.size(); i++){ %>
         <tr>
            <td><%=guests.get(i).getGuestNumber()%></td>
            <td><%=guests.get(i).getGuestName()%></td>
            <td><%=guests.get(i).getGuestBirth()%></td>
         </tr>
      <%} %>
   </table>
</body>
<script src="order.js"></script>
</html>















