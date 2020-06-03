<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="order" class="buy.OrderDAO" />
	<div>
		<%@include file="header.jsp"%>
	</div>
	<c:set var="id" value="${idsession}"/>
	<div>
		<table border="1">
			<tr>
				<td>고객ID</td>
				<td>상품ID</td>
				<td>수량</td>
				<td>가격</td>
			</tr>
			<c:forEach var="list" items="${order.OrderList('seungjo')}">
				<tr>
					<td>${list.cus_id}</td>
					<td>${list.pro_id}</td>
					<td>${list.pro_count}</td>
					<td>${list.price}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div>
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>