<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="dao" class="customer.CustomerDAO" />
	<jsp:useBean id="dto" class="customer.CustomerDTO" />
	<jsp:setProperty property="*" name="dto" />
	<c:set value="${dao.modify(dto) }" var="result" />
	<c:choose>
		<c:when test="${result ne 1}">
			<c:set var="msg" value="<script>alert('개인정보 수정 실패!')</script>"
				scope="request" />
			<jsp:forward page="form.jsp?method=modify&id=${idsession}" />
		</c:when>
		<c:otherwise>
			<c:set var="msg" value="<script>alert('개인정보 수정 완료!')</script>"
				scope="request" />
			<jsp:forward page="view.jsp?id=${idsession }" />
		</c:otherwise>
	</c:choose>
</body>
</html>