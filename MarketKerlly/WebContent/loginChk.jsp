<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<fmt:requestEncoding value="utf-8" />
	<jsp:useBean id="dao" class="customer.CustomerDAO" />
	<c:set var="dto" value="${dao.getById(param.id)}" />

	<c:choose>
		<c:when test="${empty dto.id }">
			<c:set var="msg" value="<script>alert('등록된 아이디가 아닙니다.')</script>" scope="request" />
			<jsp:forward page="login.jsp" />
		</c:when>
		<c:otherwise>
			<c:choose>
				<c:when test="${dto.pwd eq param.pwd }">
					<c:set var="idsession" value="${dto.id}" scope="session"/>
					<c:redirect url="main.jsp" />
				</c:when>
				<c:otherwise>
					<c:set var="msg" value="<script>alert('비밀번호가 일치하지 않습니다.')</script>" scope="request" />
					<c:set var="id" value="${dto.id}" scope="request" />
					<jsp:forward page="login.jsp" />
				</c:otherwise>
			</c:choose>
		</c:otherwise>
	</c:choose>


</body>
</html>