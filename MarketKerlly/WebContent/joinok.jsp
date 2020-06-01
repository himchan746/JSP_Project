<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
</head>
<body>
	<fmt:requestEncoding value="utf-8" />
	<jsp:useBean id="dao" class="customer.CustomerDAO" />
	<jsp:useBean id="dto" class="customer.CustomerDTO" />
	<jsp:setProperty property="*" name="dto"/>
	<c:set var="result" value="${dao.join(dto) }" />
	
	<c:choose>
		<c:when test="${ result ne 1}">
			<c:set var="msg"  value="<script>alert('이미 사용중인 아이디 입니다.')</script> "/>
		</c:when>
		<c:otherwise>
		
		</c:otherwise>
	</c:choose>
	
</body>
</html>