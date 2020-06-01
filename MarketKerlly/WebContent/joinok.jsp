<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문제지</title>
</head>
<body>
	<fmt:requestEncoding value="utf-8" />
	<jsp:useBean id="dao" class="exam.memberDAO" />
	<c:set var="get" value="${dao.getById(param.id) }" />
	<c:choose>
		<c:when test="${param.id == ''}">
			<script type="text/javascript">
				alert('아이디를 입력해주세요');
				location.href="join.jsp";
			</script>
		</c:when>		
		<c:when test="${param.pwd == ''}">
			<script type="text/javascript">
				alert('패스워드를 입력해주세요');
				location.href="join.jsp";
			</script>
		</c:when>
		<c:when test="${get.id == param.id}">
			<script type="text/javascript">
				alert('아이디가 중복입니다.');
				location.href="join.jsp";
			</script>
		</c:when>
		<c:otherwise>
			<c:set var = "result" value="${dao.join(param.id , param.pwd, param.name, param.depart, param.rank)}"/>
			<script type="text/javascript">
				alert("회원가입 성공입니다.");
				location.href="login.jsp";
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>