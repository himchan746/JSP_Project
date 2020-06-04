<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:choose>
		<c:when test="${not empty idsession}">
			<jsp:useBean id="proDao" class="productInfo.ProductInfoDAO" />
			<c:set var="price" value="${proDao.getProductPrice(param.proId)}" />
			<jsp:useBean id="basketDao" class="buy.BasketDAO" />
			${basketDao.inBasket(idsession,param.proId*1,param.count*1,price*1)}
			<script type="text/javascript">
			var msg=confirm("장바구니에 추가되었습니다.\n장바구니로 이동하시겠습니까?")
			if(msg){
				location.href="cart.jsp"
			}else{
				location.href="productView.jsp?proId=${param.proId}"
			}
			</script>
</c:when>
		<c:otherwise>
			<c:set var="msg" value="<script>alert('먼저 로그인 해주세요')</script>"
				scope="request" />
			<jsp:forward page="login.jsp" />
		</c:otherwise>
	</c:choose>
</body>
</html>