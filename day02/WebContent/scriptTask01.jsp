<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스크립트 태그 실습1</title>
</head>
<body>
	<!-- 3행 5열 표를 for문으로 제작하기(tr3번, td 5번) -->
	<!-- 열 안에 내용은 몇 행 몇 열인지를 작성 -->
	
	<h2>표 만들기</h2>
	<table  border="1"; width="50%"; height="200";>
	<%
		for(int i=0;i<3;i++){
			%>
			<tr></tr>
			<%
			for(int j=0;j<5;j++){
				%>
				<td style="text-align: center;"> <%=i+1%>행 <%=j+1%>열 </td>
				<%
			}
		}
		
	%>
	</table>
	
</body>
</html>