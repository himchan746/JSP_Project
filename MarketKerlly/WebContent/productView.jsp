<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마켓케리 :: 오늘의 장보기, 마켓케리</title>
</head>
<body>
<%@ include file="header.jsp" %>


	<jsp:useBean id="pdao" class="productInfo.ProductInfoDAO" />
	<c:set var="pdto" value="${pdao.getProduct(param.proId) }" />


	<form action="addCart.jsp">
		<table border="1" style="border-collapse: collapse;">
			<caption>${pdto.proName }</caption>

			<tr>
				<td rowspan="4">img</td>
				<td>가격</td>
				<td>${pdto.proPrice }원</td>
			</tr>
			<tr>
				<td>재고 수량</td>
				<td>${pdto.proCount }개</td>
			</tr>
			<tr>
				<td>구매수량<input type="button" onclick="minus()" value="-">
				<input type="text" name="count" id="count" value="1" maxlength="2" readonly="readonly">
				<input type="button" onclick="plus()" value="+">
				</td>
				<td></td>
			</tr>
			<tr>
				<td colspan="2">총 상품 금액 : <input type="text" readonly id="price" value="${pdto.proPrice}"> 원</td>
			</tr>
		</table>
		<input type="hidden" name="proId" value="${pdto.proId}">
		<input type="submit" value="장바구니 담기">
	</form>
	<%@ include file="footer.jsp" %>
	<script type="text/javascript">
var count=1;
var originalPrice = document.getElementById("price").value
function minus() {
	if(count!=1){
	count=count-1
	document.getElementById("count").value=count
	price = document.getElementById("price").value
	price = price-originalPrice
	document.getElementById("price").value=price
	}
}
function plus() {
	count=count+1
	document.getElementById("count").value=count
	price = document.getElementById("price").value
	price = price*1+originalPrice*1
	document.getElementById("price").value=price
}
</script>
</body>
</html>