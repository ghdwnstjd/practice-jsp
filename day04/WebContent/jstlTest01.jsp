<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>JSTL TEST(변수)</h2>
	<c:set var="name" value="홍길동" scope="page"/>
	<h3>${name}</h3>
	<h3><c:out value="${name}"/></h3>
	<h4>\${name}</h4>
	<h4>&dollar;{name}</h4>
	<c:set var="nation" value="미국" scope="session"/>
	<c:remove var="nation" scope="session"/>
	<h4><c:out value="${nation}" default="한국"/></h4>
	<h4>${10+20}</h4>
</body>
</html>