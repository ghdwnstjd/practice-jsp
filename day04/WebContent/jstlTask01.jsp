<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>첫 번째 실습</title>
</head>
<body>
<!-- 
   사용자에게 이름을 입력받고 확인 버튼을 눌렀을 때
   admin일 경우 "관리자", member일 경우 "일반 회원", 그 외에는 "비회원"을 출력한다.
   
   ※ 다른 페이지 없이 현재 페이지에서만 처리하고, 
      결과가 출력될 때에는 input태그와 submit버튼이 나오게 해서는 안된다.
   ※ form태그의 속성은 action을 생략하면 현재 페이지로 이동이 된다.
   ※ EL과 JSTL만 사용한다(JS는 사용하지 않는다).
 -->

 
  <c:choose>
       <c:when test="${empty param.input}">
          <form>
             <label>
                이름 <input type="text" name="input">
             </label>
             <input type="submit" value="전송">
          </form>
       </c:when>
       <c:otherwise>
          <c:choose>
             <c:when test="${param.input == 'admin'}">
                <h3>관리자</h3>
             </c:when>
             <c:when test="${param.input == 'member'}">
                <h3>일반 회원</h3>
             </c:when>
            <c:otherwise>
                <h3>비회원</h3>
            </c:otherwise>
          </c:choose>
       </c:otherwise>
    </c:choose>
</body>
</html>
