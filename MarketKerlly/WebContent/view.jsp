<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
#viewsection {
	height : 600px;
}

#viewtable {
	margin: auto;
	width: 400px;
	height : 300px;
	text-align: center;
	color: #FF3366;
}
#nametitle{
	background: #FF3366;
	color: white;

}
#viewbackbt{
	background: #FF3366;
	width: 250px;
	height: 30px;
	border-radius: 10px;
	color: white;	
}
</style>


</head>
<body>
	<c:choose>
		<c:when test="${sessionScope.idsession != param.id }">
			<script type="text/javascript">
				alert("회원이 아니면 볼수가 없습니다.");
				location.href = "main.jsp";
			</script>
		</c:when>
		<c:otherwise>
			<jsp:useBean id="dao" class="exam.memberDAO" />
			<c:set var="dto" value="${dao.getById(param.id) }" />
			<%@ include file="header.jsp"%>
			<section id="viewsection">
				<table id="viewtable" border="1">
					<tr>
						<td colspan="2" id = "nametitle"><h2>${dto.name }님 개인정보입니다.</h2></td>
					</tr>
					<tr>
						<td>아이디</td>
						<td>${dto.id }</td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td>${dto.pwd }</td>
					</tr>
					<tr>
						<td>이름</td>
						<td>${dto.name }</td>
					</tr>
					<tr>
						<td>부서</td>
						<td>${dto.depart }</td>
					</tr>
					<tr>
						<td>직급</td>
						<td>${dto.rank }</td>
					</tr>
					<tr>
						<td colspan="2"><input id="viewbackbt" type="button" value = "돌아가기" onclick="location.href='main.jsp'"></td>
					</tr>
				</table>
			</section>
			<%@ include file="footer.jsp"%>
		</c:otherwise>
	</c:choose>
</body>
</html>