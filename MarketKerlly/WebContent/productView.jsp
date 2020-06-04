<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마켓케리 :: 오늘의 장보기, 마켓케리</title>
</head>
<body>
	<%@ include file="header.jsp"%>


	<jsp:useBean id="productDao" class="productInfo.ProductInfoDAO" />
	<c:set var="productDto" value="${productDao.getProduct(param.proId) }" />
	<jsp:useBean id="fileDao" class="file.FileDAO" />
	<c:set var="fileDto" value="${fileDao.getFileById(param.proId) }" />


	<form action="addCart.jsp">
		<table border="1" style="border-collapse: collapse;">


			<tr>
				<td rowspan="5"><img
					src='data:x-image/jpg;base64,${fileDto.img}'></td>
				<td colspan="2">${productDto.proName }</td>

			</tr>
			<tr>
				<td>가격</td>
				<td><fmt:formatNumber value='${productDto.proPrice}' pattern="#,###"/>원</td>
			</tr>
			<tr>
				<td>재고 수량</td>
				<td><fmt:formatNumber value='${productDto.proCount}' pattern="#,###"/>개</td>
			</tr>
			<tr>
				<td colspan="2">구매수량<input type="button" onclick="minus()" value="-">
					<input type="text" name="count" id="count" value="1" maxlength="2"
					readonly="readonly"> <input type="button" onclick="plus()"
					value="+">
				</td>
			</tr>
			<tr>
				<td colspan="2">총 상품 금액 : <font id="price">${productDto.proPrice}</font> 원
				</td>
			</tr>
		</table>
		<input type="hidden" name="proId" value="${productDto.proId}">
		<input type="submit" value="장바구니 담기">
	</form>
	<%@ include file="footer.jsp"%>
	<script type="text/javascript">
		var count = 1;
		var originalPrice = document.getElementById("price").innerHTML
		console.log(originalPrice)
		function minus() {
			if (count != 1) {
				count = count - 1
				document.getElementById("count").value = count
				price = document.getElementById("price").innerHTML
				price = price - originalPrice
				document.getElementById("price").innerHTML = price
			}
		}
		function plus() {
			count = count + 1
			document.getElementById("count").value = count
			price = document.getElementById("price").innerHTML
			price = price * 1 + originalPrice * 1
			document.getElementById("price").innerHTML = price
		}
	</script>
</body>
</html>