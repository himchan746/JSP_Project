<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="css/main.css" rel="stylesheet" type="text/css">
</head>
<body>
   <jsp:useBean id="fileDAO" class="file.FileDAO"/>

	<div id="wrap">
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
						<h2>이 상품 어때요?</h2>
					</div>
					
					<div id="kurlyMain">
						<div>
							<div class="main_type2">
								<div class="product_list">
									<div class="list_goods">
										<div class="bx-wrapper">
											<div class="bx-viewport">
												<ul class="list">
												
													<c:forEach var="Randomlist" items="${fileDAO.getRandomFile()}">
														<li>
															<a class="thumba"href="productView.jsp?proId=${Randomlist.pro_id}"> 
																<img src='data:x-image/jpg;base64,${Randomlist.img}' class="thumb"/>
															</a>
															<div class="info_goods">
																<span class="name">
																	<a class="txt" href="productView.jsp?proId=${Randomlist.pro_id}">${Randomlist.pro_name}</a>
																</span> 
																<span class="price">
																	<fmt:formatNumber value="${Randomlist.price}" pattern="#,###" />원
																</span>
															</div>
														</li>
													</c:forEach>
													
												</ul>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--section3 -->
				<div id="mainmiddleList2">
					<div id="mainmiddleTitle">
						<h2>최근 입고 상품</h2>
					</div>
					
					<div id="kurlyMain">
						<div>
							<div class="main_type2">
								<div class="product_list">
									<div class="list_goods">
										<div class="bx-wrapper">
											<div class="bx-viewport">
												<ul class="list">
												
													<c:forEach var="RecentFile" items="${fileDAO.getRecentFile()}">
														<li>
															<a class="thumba" href="productView.jsp?proId=${RecentFile.pro_id}">
														 		<img src='data:x-image/jpg;base64,${RecentFile.img}' class="thumb"/>
															</a>
															<div class="info_goods">
																<span class="name"> 
																<a class="txt" href="productView.jsp?proId=${RecentFile.pro_id}">${RecentFile.pro_name}</a>
																</span>
																<span class="price">
																	<fmt:formatNumber value="${RecentFile.price}" pattern="#,###"/>원
																</span>
															</div>
														</li>
													</c:forEach>
													
												</ul>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- section4 -->
				<div id="mainmiddleList1">
					<div id="mainmiddleTitle">
						<h2>Hot 상품</h2>
					</div>
					
					<div id="kurlyMain">
						<div>
							<div class="main_type2">
								<div class="product_list">
									<div class="list_goods">
										<div class="bx-wrapper">
											<div class="bx-viewport">
												<ul class="list">
													<c:forEach var="HotFile" items="${fileDAO.getHotFile()}">
														<li>
															<a class="thumba" href="productView.jsp?proId=${HotFile.pro_id}">
														 		<img src='data:x-image/jpg;base64,${HotFile.img}' class="thumb"/>
															</a>
															<div class="info_goods">
																<span class="name"> 
																<a class="txt" href="productView.jsp?proId=${HotFile.pro_id}">${HotFile.pro_name}</a>
																</span>
																<span class="price">
																	<fmt:formatNumber value="${HotFile.price}" pattern="#,###"/>원
																</span>
															</div>
														</li>
													</c:forEach>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
	</div>
	<div>
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>