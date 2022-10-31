<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 페이지</title>
</head>
<body>
	<h1>JSP로 만든 페이지</h1>
	<!-- method="get"일때는 생략이 가능하기 때문에 적지 않아도 된다. -->
	<form action="Hello">
		이름 <input type="text" name="userName">
		<p>서블릿으로 이동</p>
		<button>이동</button>
	</form>
</body>
</html>