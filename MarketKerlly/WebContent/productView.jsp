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
<script type="text/javascript">
var count=1;
function minus() {
	if(count!=1){
	count=count-1
	document.getElementById("count").value=count
	}
}
function plus() {
	count=count+1
	document.getElementById("count").value=count
}
</script>

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
				<td>구매수량<input type="button" onclick="minus()"><input type="text" name="count" id="count" value="1" maxlength="2" readonly="readonly"><input type="button" onclick="plus()"></td>
				<td></td>
			</tr>
			<tr>
				<td colspan="2">총 상품 금액 : ${pdto.proPrice * count} 원</td>
			</tr>
		</table>
		<input type="button" value="장바구니 담기" onclick="addCart()">
	</form>
</body>
</html>