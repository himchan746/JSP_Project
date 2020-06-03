<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마켓케리 :: 내일의 장보기 , 마켓케리</title>
</head>
<body>
	<c:choose>
		<c:when test="${not empty idsession }">
				<jsp:useBean id="basketDao" class="buy.BasketDAO"/>
				<c:set var="list" value="${basketDao.basketList(idsession)}"/>
		</c:when>
		<c:otherwise>
			<c:set var="msg" value="<script>alert('먼저 로그인 해주세요')</script>"
				scope="request" />
			<jsp:forward page="login.jsp" />
		</c:otherwise>
	</c:choose>
</body>
</html>