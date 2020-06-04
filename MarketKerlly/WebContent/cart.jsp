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
	<%@ include file="header.jsp"%>
	<c:choose>
		<c:when test="${not empty idsession }">
			<jsp:useBean id="basketDao" class="buy.BasketDAO" />
			<c:set var="list" value="${basketDao.basketList(idsession)}" />
			<table border="1" style="border-collapse: collapse;">
				<tr>
					<td>이미지</td>
					<td>상품명</td>
					<td>수량</td>
					<td>상품 총 금액</td>
					<td></td>
				</tr>
				<c:forEach var="buyDto" items="${list}">
					<jsp:useBean id="fileDao" class="file.FileDAO" />
					<c:set var="fileDto" value="${fileDao.getFileById(buyDto.pro_id)}" />
					<tr>
						<td><img src='data:x-image/jpg;base64,${fileDto.img}'
							style="width: 100px; height:100px;" onclick="location.href='productView.jsp?proId=${buyDto.pro_id}'"></td>
						<td>${buyDto.pro_name}<br>${buyDto.price}</td>
						<td><input type="button" onclick="minus(${buyDto.pro_id })" value="-">
							<input type="text" readonly id="${buyDto.pro_id }"
							value="${buyDto.pro_count }"> <input type="button"
							onclick="plus(${buyDto.pro_id })" value="+"></td>
						<td id="p${buyDto.pro_id}">${buyDto.pro_count * buyDto.price}</td>
						<td><input type="button" value="x"
							onclick="location.href='cartDelete.jsp?pro_id=${buyDto.pro_id}'"></td>
					</tr>
				</c:forEach>
			</table>
			${empty list ? "없습니다<br>": ""}
			<input type="button" value="구매하기" onclick="location.href='order.jsp'"
				${empty list? 'disabled':''}>
		</c:when>
		<c:otherwise>
			<c:set var="msg" value="<script>alert('먼저 로그인 해주세요')</script>"
				scope="request" />
			<jsp:forward page="login.jsp" />
		</c:otherwise>
	</c:choose>
	<%@ include file="footer.jsp"%>
	<script type="text/javascript">
		function minus(id) {
			count=document.getElementById(id).value
			if(count!=1){
				totalPrice=document.getElementById('p'+id).innerHTML
				originalPrice = totalPrice/count
				count=count*1-1
				document.getElementById(id).value =count
				document.getElementById('p'+id).innerHTML=totalPrice-originalPrice
			}
		}
		function plus(id) {
			count=document.getElementById(id).value
			totalPrice=document.getElementById('p'+id).innerHTML
			originalPrice = totalPrice/count
			count=count*1+1
			document.getElementById(id).value =count
			document.getElementById('p'+id).innerHTML=totalPrice*1+originalPrice*1
		}
	</script>
</body>
</html>