<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="userDAO" class="dao.UserDAO"/>
<%

	// userId를 파라미터로 받아 checkId의 매개변수로 사용, boolean 값을 출력한다.
   String userId = request.getParameter("userId");
   out.println(userDAO.checkId(userId));
%>