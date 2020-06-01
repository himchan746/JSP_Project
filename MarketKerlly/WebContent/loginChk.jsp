<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<fmt:requestEncoding value="utf-8" />
	<jsp:useBean id="dao" class="exam.memberDAO" />
	<c:set var="dto" value="${dao.getById(param.id)}"></c:set>
	<c:choose>
		<c:when test="${param.id ne dto.id }">
			<script type="text/javascript">
				alert("해당하는 ID가 없습니다.");
 				location.href = "login.jsp";
			</script>
		</c:when>
		<c:otherwise>
			<c:choose>
				<c:when test="${dto.pwd != param.pwd }">
					<script type="text/javascript">
						alert("비밀번호가 틀립니다.");
						location.href = "login.jsp";
					</script>
				</c:when>
				<c:otherwise>
					<c:set var = "idsession" scope="session" value="${dto.id }"/>
					<script type="text/javascript">
						alert("로그인 성공입니다.");
						location.href = "main.jsp";
					</script>
				</c:otherwise>
			</c:choose>
		</c:otherwise>
	</c:choose>
</body>
</html>