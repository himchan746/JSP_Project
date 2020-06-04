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
* {
	list-style: none;
}

#mainImageBox {
	height: 400px;
}

#mainImageView {
	width: 100%;
	height: 400px;
	margin: auto;
}

#mainImageView img {
	width: 100%;
	height: 100%;
}

#mainmiddleList1 {
	width: 100%;
	margin: 0 auto;
	background: white;
}

#mainmiddleTitle {
	padding: 79px 0 35px;
	text-align: center;
	color: #333333;
}

#kurlyMain {
	width: 1200px;
	opacity: 1;
	height: 1200px;
	margin: 0 auto;
}

.list {
	width: 100%;
	position: relative;
	transition-duration: 0s;
	transform: translate3d(-15px, 0px, 0px)
}

.list li {
	float: left;
	list-style: none;
	position: relative;
	width: 23%;
	margin-right: 15px;
}

.thumb {
	display: block;
	margin: 0 auto;
	background-position: 50% 50%;
	background-size: cover;
	transform: scale(1);
	transition: all 0.3s ease-in-out;
	width: 249px;
	height: 320px;
}

#name {
	background-color: black;
	overflow: hidden;
	max-height: 50px;
	margin-top: 30px;
	text-overflow: ellipsis;
}

.txt {
	font-size: 16px;
	line-height: 23px;
	color: #333333;
}

.price {
	display: block;
	color: #333333;
	font-weight: 700;
	font-size: 16px;
	line-height: 20px;
}

.info_goods {
	padding-top: 10px;
}

.thumba {
	cursor: pointer;
}
</style>
</head>
<body>
	<jsp:useBean id="fileDAO" class="file.FileDAO" />

	<c:choose>
		<c:when test="${param.start eq null}">
			<c:set var="start" value="1" />
		</c:when>
		<c:otherwise>
			<c:set var="start" value="${param.start }" />
		</c:otherwise>
	</c:choose>

	<div>
		<div>
			<%@include file="header.jsp"%>
		</div>
		<section>
			<!-- section1 -->
			<div id="mainImageBox">
				<div id="mainImageView">
					<img alt="" src="/MarketKerlly/pic/icecream.png">
				</div>
			</div>
			<div>
				<!-- section2 이 상품 어때요? -->
				<div id="mainmiddleList1">

					<div id="mainmiddleTitle">
						<h2>'${param.search}' 에 대한 검색 결과</h2>
					</div>
					<!--  -->
					<div id="kurlyMain">
						<c:set var="filelist" value="${fileDAO.getSearchFile(param.search , start)}" />
						<c:set var="totalList" value="${fileDAO.getTotalList(param.search)}" />
						<c:choose>
							<c:when test="${filelist.size() ne 0}">
							${filelist.size() }개의 상품이 검색되었습니다.
							<hr>
								<ul class="list">
									<c:forEach var="search" items="${filelist}">
										<li><a class="thumba" href="productView.jsp?proId=${search.pro_id}">
										<img src='data:x-image/jpg;base64,${search.img}' class="thumb" />
										</a>
											<div class="info_goods">
												<span class="name"> 
												<a class="txt" href="productView.jsp?proId=${search.pro_id}">${search.pro_name}</a>
												</span> 
												<span class="price"> 
													<fmt:formatNumber value="${search.price}" pattern="#,###" />원
												</span>
											</div>
										</li>
									</c:forEach>
								</ul>
							</c:when>
							<c:otherwise>
									<h1 align="center">검색 결과 없습니다</h1>
							</c:otherwise>
						</c:choose>
					</div>

					<div align="center">
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
					</div>
				</div>
				<div>
					<%@include file="footer.jsp"%>
				</div>
			</div>
		</section>
	</div>
</body>
</html>