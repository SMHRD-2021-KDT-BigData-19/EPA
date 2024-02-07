<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 만약에 jstl을 몰랐을 시절
	 response.sendRedirect("boardList.do");
 -->
 <!-- jstl은 따로 지정해주지 않아도 현재의 프로젝트내에서만 찾을 수 있게 실행 -->
 <c:redirect url="board.do" />
</body>
</html>