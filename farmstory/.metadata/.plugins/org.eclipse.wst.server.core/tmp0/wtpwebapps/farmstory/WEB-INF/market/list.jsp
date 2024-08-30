<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>장보기</title>
</head>
<link rel="stylesheet" href="../css/header.css">
<link rel="stylesheet" href="../css/list.css">
<link rel="stylesheet" href="../css/footer.css">
<link rel="stylesheet" href="../css/marketstyle.css">
<body>
	<jsp:include page="/layout/_header.jsp" />

    <div class="main-wrapper">
        <div class="sidebar-box">
            <div class="sidebar-logo-box">
                <div class="sidebar-logo"></div>
            </div>
            <div class="sidebar-bg-box">
                <div class="sidebar-item-1"></div>
                <div class="sidebar-item-2"></div>
            </div>
        </div>
        <div class="sidebar-gubun-box"></div>

        <div class="main-box">
            <div class="main-title-box">
                <div class="main-title"></div>
                <div class="main-nav-box">
                    <div class="nav-icon-box">
                        <div class="nav-icon"></div>
                    </div>
                    <div class="nav-tit-1">Home</div>
                    <div class="nav-latest-icon">></div>
                    <div class="nav-tit-2">장보기</div>
                    <div class="nav-latest-icon">></div>
                    <div class="nav-tit-3">장보기</div>
                </div>
            </div>
            <div class="main-gubun-box"></div>
 
                <main>
				<span class="frame20-text008">
                      <span class="frame20-text009"><a href="/farmstory//market/list.do">전체${countAll}</a> |</span>
                      
                      
				<c:forEach var="type" items="${types}">
                      <span class="frame20-text011"><a href="/farmstory//market/list.do?type=${type}">
                      ${type}
                      <c:if test="${type.equals('과일') }">
                      	${countFruit}
                      </c:if>
                      <c:if test="${type.equals('야채') }">
                      	${countVege}
                      </c:if>
                       |
                      </a></span>
                </c:forEach>
                 
                    </span>
				<section class="list">	 
					<article>
						<table border="0">
							<tr>
								<th>이미지</th>
								<th>종류</th>
								<th>상품명</th>
								<th>할인</th>
								<th>포인트</th>
								<th>판매가격</th>
							</tr>
							<c:forEach var="product" items="${products}">
								<tr onclick="redirectToProduct(${product.prod_idx})">
									<td><img class="img-size" src=${product.path}${product.url}></td>
									<td>${product.type}</td>	
									<td>${product.prod_name}</td>
									<td>${product.discount}%</td>
									<td>${product.point}</td>
									<td>${product.price}</td>
								</tr>
								
								<!-- 한번 반복할때마다 pageStartNum을 1씩 차감 -->
								<c:set var="pageStartNum" value="${pageStartNum-1}" />
							</c:forEach>
						</table>
					</article>

					<!-- 페이지 네비게이션 -->
					<div class="paging">
                    <c:if test="${pageGroup.start > 1}">
                    	<a href="/jboard/article/list.do?pg=${pageGroup.start - 1}" class="prev">&lt;</a>
	                </c:if>
	                <c:choose>
		                <c:when test="${pageGroup.end > pageLastNum}">
		                	<c:forEach var="i" begin="${pageGroup.start}" end="${pageLastNum}">
		                    	<a href="/jboard/article/list.do?pg=${i}" class="num ${currentPageNum == i ? 'current':'off'}">[${i}]</a>                
		                    </c:forEach>
		                </c:when>
		                <c:otherwise>
			                 <c:forEach var="i" begin="${pageGroup.start}" end="${pageGroup.end}">
		                    	<a href="/jboard/article/list.do?pg=${i}" class="num ${currentPageNum == i ? 'current':'off'}">${i}</a>                
		                    </c:forEach>
		                	 <a href="/jboard/article/list.do?pg=${pageGroup.end + 1}" class="next">&gt;</a>
		                </c:otherwise>
	               </c:choose>
                </div>
				</section>
			</main>
                    <span class="frame20-text093">
                      <span class="frame20-text094">&lt;</span>
                      <span class="frame20-text095"></span>
                      <span class="frame20-text096">[1]</span>
                      <span class="frame20-text097"></span>
                      <span class="frame20-text098">[2]</span>
                      <span class="frame20-text099"></span>
                      <span class="frame20-text100">[3]</span>
                      <span class="frame20-text101"></span>
                      <span class="frame20-text102">[4]</span>
                      <span class="frame20-text103"></span>
                      <span class="frame20-text104">[5]</span>
                      <span class="frame20-text105">&gt;</span>
                    </span>
                        <span class="frame20-text106">
                        </span>
                    </div>
                  </div>
                </div>
   <jsp:include page="/layout/_footer.jsp" />
   
<script>
function redirectToProduct(prodIdx) {
    var url = '/farmstory/market/view.do?prod_idx=' + prodIdx;
    window.location.href = url;
}
</script>	
</body>
</html>