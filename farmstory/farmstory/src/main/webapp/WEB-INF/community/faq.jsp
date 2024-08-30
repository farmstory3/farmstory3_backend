<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>자주묻는질문</title>
</head>
<link rel="stylesheet" href="../css/header.css" />
<link rel="stylesheet" href="../css/community.css" />
<link rel="stylesheet" href="../css/style.css" />
<link rel="stylesheet" href="../css/footer.css" />
<link rel="stylesheet" href="/farmstory/css/write_style.css">
<body>
	<jsp:include page="/layout/_header.jsp" />
	<div class="main-wrapper">
		<div class="sidebar-box">
			<div class="sidebar-logo-box">
				<div class="sidebar-logo"></div>
			</div>
			<div class="sidebar-bg-box">
				<a href="/farmstory/article/list.do?group=community&cate=notice"/>
					<div class="sidebar-item _01"></div>
				</a> <a href="/farmstory/article/list.do?group=community&cate=menu"/>
					<div class="sidebar-item _02"></div>
				</a> <a href="/farmstory/article/list.do?group=community&cate=chef"/>
					<div class="sidebar-item _03"></div>
				</a> <a href="/farmstory/article/list.do?group=community&cate=qna"/>
					<div class="sidebar-item _04"></div>
				</a> <a href="/farmstory/article/list.do?group=community&cate=faq"/>
					<div class="sidebar-item _05 _ov"></div>
				</a>
			</div>
		</div>
		<div class="sidebar-gubun-box"></div>

		<div class="main-box">
			<div class="main-title-box">
				<div class="main-title _05"></div>
				<div class="main-nav-box">
					<div class="nav-icon-box">
						<div class="nav-icon"></div>
					</div>
					<div class="nav-tit-1">Home</div>
					<div class="nav-latest-icon">></div>
					<div class="nav-tit-2">커뮤니티</div>
					<div class="nav-latest-icon">></div>
					<div class="nav-tit-3">자주묻는질문</div>
				</div>
			</div>
			<div class="main-gubun-box"></div>
			<c:if test="${!write.equals(write) }" >
			<section class="list">
				<h3>글목록</h3>
				<article>
					<table border="0">
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>글쓴이</th>
							<th>날짜</th>
							<th>조회</th>
						</tr>
						<c:forEach var="article" items="${articles}">
							<tr>
								<td>${pageStartNum}</td>
								<td><a href="/jboard/article/view.do?no=${article.no}">${article.title}</a>&nbsp;[${article.comment}]</td>
								<td>${article.nick}</td>
								<td>${article.rdate}</td>
								<td>${article.hit}</td>
							</tr>
							<!-- 한번 반복할때마다 pageStartNum을 1씩 차감 -->
							<c:set var="pageStartNum" value="${pageStartNum-1}" />
						</c:forEach>
					</table>
				</article>

				<!-- 페이지 네비게이션 -->
				<div class="paging">
                    <c:if test="${pageGroup.start > 1}">
                    	<a href="/jboard/article/list.do?pg=${pageGroup.start - 1}" class="prev">이전</a>
	                </c:if>
	                <c:choose>
		                <c:when test="${pageGroup.end > pageLastNum}">
		                	<c:forEach var="i" begin="${pageGroup.start}" end="${pageLastNum}">
		                    	<a href="/jboard/article/list.do?pg=${i}" class="num ${currentPageNum == i ? 'current':'off'}">${i}</a>                
		                    </c:forEach>
		                </c:when>
		                <c:otherwise>
			                 <c:forEach var="i" begin="${pageGroup.start}" end="${pageGroup.end}">
		                    	<a href="/jboard/article/list.do?pg=${i}" class="num ${currentPageNum == i ? 'current':'off'}">${i}</a>                
		                    </c:forEach>
		                	 <a href="/jboard/article/list.do?pg=${pageGroup.end + 1}" class="next">다음</a>
		                </c:otherwise>
	               </c:choose>
                </div>

				<!-- 글쓰기 버튼 -->
				<a href="/farmstory/article/write.do?write=write&group=community&cate=faq" class="btnWrite">글쓰기</a>
				</c:if>
				<c:if test="${write.equals(write) }" >
				<main>
					<section class="write">
						<h3>글쓰기</h3>
						<article>
							<!-- 
                		multipart/form-data로 데이터 및 파일 전송을 위해 톰캣 설정해야됨 안하면 getParameter 수신 안됨
                		 - 톰캣 context.xml > Context 태그에 allowCasualMultipartParsing="true" 설정
						 - 톰캣 server.xml > Connector 태그에 maxPostSize="10485760" (1024 x 1024 x 10 = 10MB) 설정                		
                	-->
							<form
								action="/farmstory/article/write.do?write=write&group=community&cate=faq"
								method="post" enctype="multipart/form-data">
								<input type="hidden" id="writer" name="writer"
									value="${sessUser.uid}">
								<table>
									<tr>
										<td>제목</td>
										<td><input type="text" id="title" name="title"
											placeholder="제목을 입력하세요." /></td>
									</tr>
									<tr>
										<td>내용</td>
										<td><textarea id="content" name="content"></textarea></td>
									</tr>
									<tr>
										<td>첨부</td>
										<td>
											<p style="margin-bottom: 6px;"></p> <input type="file"
											id="file" name="file" />
										</td>
									</tr>
								</table>
								<div class="form-buttons">

									<!-- 취소 버튼 -->
									<a href="/farmstory/article/list.do?group=community&cate=faq"
										class="btnWrite">취소</a>

									<!-- 작성완료 버튼 -->
									<button type="submit" class="submit-btn">작성완료</button>

								</div>

							</form>
						</article>
					</section>
				</main>
				</c:if>
			</section>
		</div>
	</div>
	 <jsp:include page="/layout/_footer.jsp" />	
</body>
</html>