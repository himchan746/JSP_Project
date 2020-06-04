<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마켓케리 :: 오늘의 장보기, 마켓케리</title>
<style type="text/css">
#kurlyMain {
	width: 1140px;
	opacity: 1;
	height:;
	margin: 0 auto;
}

#input{
	background: skyblue;
	border-radius: 10px;
	color: white;
	height: 50px;
	width: 170px;
	font-size: 17pt;
}
</style>

</head>
<body>
	<%@ include file="header.jsp"%>


	<jsp:useBean id="productDao" class="productInfo.ProductInfoDAO" />
	<c:set var="productDto" value="${productDao.getProduct(param.proId) }" />
	<jsp:useBean id="fileDao" class="file.FileDAO" />
	<c:set var="fileDto" value="${fileDao.getFileById(param.proId) }" />
	<div>
		<br>
	</div>
	<div id="kurlyMain">
		<hr>
		<table style="width: 100%; height: 100%;">
			<tr>
				<td style="width: 500px;" rowspan="2">
					<img src='data:x-image/jpg;base64,${fileDto.img}' class="thumb" />
				</td>

				<td style="height: 50px;" align="center" colspan="2">
					<div style="height: 100%; width: 80%;" align="left">
						<font size="20pt">${productDto.proName}</font><br>
						<br> 
							<font size="6em">
							<fmt:formatNumber value="${productDto.proPrice}" pattern="#,###" /></font>원<br>
						<br>
							<hr style="opacity: 0.3;">
						<br>
							<font size="3em">배송 구분 &nbsp;&nbsp;&nbsp; 퀵 배송 / 택배 배송</font><br>
						<br>
							<hr style="opacity: 0.3;">
						<br>
							<font size="3em">안내 사항 &nbsp;&nbsp;&nbsp; 맛있을꺼임</font><br>
						<br>
							<hr style="opacity: 0.3;">
						<br>
							<font size="3em">재고 수량 &nbsp;&nbsp;&nbsp; ${productDto.proCount }개</font><br>
						<br>
							<hr style="opacity: 0.3;">
						<br>
							<font size="3em"> 
							 	구매수량<input type="button"onclick="minus()" value="-">
							 	<input type="text" name="count" id ="count" value="1" maxlength="2" readonly="readonly"> 
							 	<input type="button" onclick="plus()" value="+">
							</font> 
						<br> <br>
						<hr style="opacity: 0.3;">
					</div>
				</td>
				<tr>
					<th colspan="2" align="center" style="height: 60px;">
						<div style="height: 100%; width: 80%;" align="right">
							총 상품 금액 : <font size="6em" id="price">${productDto.proPrice}</font> 원 <br>
							<br>
							<input type="button" value="구매하기" id="input" >
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="button" value="장바구니 넣기" id="input" onclick="addCart(${productDto.proId} , '${productDto.proName}')">
						</div>
					</th>
				</tr>
				<tr>
					<th colspan="2">
						<hr>
					</th>
				</tr>
			</tr>
			</table>
		</div>
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
			function addCart(id , name) {
				console.log(id)
				location.href="addCart.jsp?count="+count+"&proId="+id+"&proName="+name
			}
		</script>
</body>
</html>