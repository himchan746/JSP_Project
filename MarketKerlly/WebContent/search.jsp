<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#kurlyMain {
	width: 1200px;
	opacity: 1;
	height: ;
	margin: 0 auto;
}

img{
	width: 500px;
	height: 600px;
}

#input{
	background: skyblue;
	border-radius: 10px;
	color: white;
	height: 50px;
	width: 500px;
	font-size: 24pt;
}
</style>

	

</head>
<body>
	<jsp:useBean id="fileDAO" class="file.FileDAO" />

	<!--페이지 작업 -->
	<c:choose>
		<c:when test="${param.start eq null}">
			<c:set var="start" value="1" />
		</c:when>
		<c:otherwise>
			<c:set var="start" value="${param.start }" />
		</c:otherwise>
	</c:choose>
	
	<c:set var="filelist" value="${fileDAO.getSearchFile(param.search , start)}" />
	<c:set var="totalList" value="${fileDAO.getTotalList(param.search)}" />
	<!--페이지 작업 완료 -->
	
	
	<div>
		<%@include file="header.jsp"%>
	</div>
	<div style="height: 50px;">
		
	</div>
	<section>
		<div id="kurlyMain">
			<table style="width: 100%; height: 100%;">
				<tr>
					<td colspan="3">
						<h2 align="center">'${param.search}' 에 대한 검색 결과</h2>
						
						${filelist.size() }개의 상품이 검색되었습니다.
					<hr>
					</td>
				</tr>
				
				<c:choose>
					<c:when test="${filelist.size() ne 0}">
						<c:forEach var="search" items="${filelist}">
							<tr>
								<td style="width: 500px;" rowspan="2">
									<a class="thumba"	href="productView.jsp?proId=${search.pro_id}">
										<img src='data:x-image/jpg;base64,${search.img}' class="thumb" />
									</a>
								</td>
								
								<td style="height: 50px;" align="center" colspan="2">
									<div style="height: 100%; width: 80%;" align="left">
											<font size="20pt">${search.pro_name}</font><br><br>
											<font size="6em"><fmt:formatNumber value="${search.price}" pattern="#,###" /></font>원<br><br>
										<hr style="opacity: 0.3;">
											<br><font size="3em">배송 구분 &nbsp;&nbsp;&nbsp; 퀵 배송 / 택배 배송</font><br><br>
										<hr style="opacity: 0.3;">
											<br><font size="3em">안내 사항 &nbsp;&nbsp;&nbsp; 맛있을꺼임</font><br><br>
										<hr style="opacity: 0.3;">
											<br><font size="3em">재고 수량 &nbsp;&nbsp;&nbsp; ${search.pro_count }개</font><br><br>
										<hr style="opacity: 0.3;">
										<br>
									</div>
									</td>
									
									<tr>
										<th colspan="2" align="center" style="height: 60px;">
											<div style="height: 100%; width: 80%;" align="right">
											<br><br>
											<input type="button" value="상품 상세 보기" id="input" onclick="location.href='productView.jsp?proId=${search.pro_id}'">
											</div>
									</th>
								</tr>
							</tr>
							<tr>
								<th colspan="2">
									<hr>
								</th>
							</tr>
							
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<th>
								<h1 align="center">검색 결과 없습니다</h1>
							</th>
						</tr>
					</c:otherwise>
				</c:choose>

				<tr>
					<th colspan="2">
						<c:choose>
							<c:when test="${start > 1}">
								<button type="button"
									onclick="location.href='search.jsp?start=${start-1}&search=${param.search}'">이전</button>
							</c:when>
							<c:otherwise>
								<button type="button" disabled>이전</button>
							</c:otherwise>
						</c:choose>
						
						<c:forEach begin="1" end="${totalList}" step="1" var="cnt">
							<a href="search.jsp?start=${cnt}&search=${param.search}">[${cnt}]</a>
						</c:forEach>

						<c:choose>
							<c:when test="${start < totalList}">
								<button type="button"
									onclick="location.href='search.jsp?start=${start+1}&search=${param.search}'">다음</button>
							</c:when>
							<c:otherwise>
								<button type="button" disabled>다음</button><br>
							</c:otherwise>
						</c:choose>
						<hr>
						${start} / ${totalList}
					
					</th>
				</tr>

			</table>
		</div>
	</section>
	<div>
		<%@include file="footer.jsp"%>
	</div>
	
	
</body>
</html>