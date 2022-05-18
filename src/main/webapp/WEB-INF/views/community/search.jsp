<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색</title>
<script type="text/javascript">
	function insert(){
	    if(${admin == null}){
	    	alert('공지사항은 관리자만 등록할 수 있습니다.')
	    }else{
	    	location.href='insert?pageNo=${page.pageNo }&action=1';
	    }
	}
	
</script>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/freeboard.css" />
</head>
<body>
	<nav>
		<ul class="mainMenu">
			<li><a href="home">G-IDLE</a></li>
			<li><a href="community">Dashboard</a></li>
			<li><a href="profile">Profile</a></li>
			<li><a href="albumList">Album</a></li>
			<li><c:choose>
					<c:when test="${admin==null }">
						<a href="update.do">My Info</a>
					</c:when>
					<c:when test="${users==null }">
						<a href="list.do">Admin</a>
					</c:when>
				</c:choose></li>
		</ul>
	</nav>
	<nav class="shadow">
		<ul class="menu">
			<li><a href="list?action=1">공지사항</a></li>
			<li><a href="list?action=2">자유게시판</a></li>
			<li><a href="list?action=3">아이들에게 편지</a></li>
			<li><a href="list?action=4">등업요청</a></li>
		</ul>
	</nav>
	<div class="subHeader">
		<c:if test="${board_cat == 1}">
			<h1>공지사항</h1>
		</c:if>
		<c:if test="${board_cat == 2 }">
			<h1>자유게시판</h1>
		</c:if>
		<c:if test="${board_cat == 3 }">
			<h1>아이들에게 편지</h1>
		</c:if>
		<c:if test="${board_cat == 3 }">
			<h1>등업요청</h1>
		</c:if>
		<!-- js사용해서 카테고리 이름 가져오기 가능? -->
	</div>
	<div class="container">
		<div style="display: flex">
			<div>
				<form action="search" name="search" class="srchArea" method="get">
					<select name="cat">
						<option value="title" selected>제목</option>
						<option value="writer">작성자</option>
					</select> <input name="keyword" type="text" placeholder="검색어를 입력하세요">
					<input type="hidden" name="action" value="${board_cat }"> <input
						id="search" type="submit" value="검색">
				</form>
			</div>
			<div class="writeBtn">
				<!-- 등급에 따라 숨김 -->
				<a class="button" href="javascript:insert()">글쓰기</a>
			</div>
		</div>

		<table class="list">
			<tr>
				<th width="10%">번호</th>
				<th width="45%">글 제목</th>
				<th width="15%">작성자</th>
				<th width="10%">조회수</th>
				<th width="20%">작성일</th>
			</tr>

			<!-- 글 데이터 가져오기 -->
			<c:forEach var="vo" items="${list }">
				<tr>
					<td>${vo.board_idx }</td>
					<td><a
						href="detail?board_idx=${vo.board_idx }&pageNo=${page.pageNo}&action=${board_cat }&userId=${users.user_id}"
						class="title">${vo.board_sub }</a><span
						style="color: orange; font-size: 80%;"></span> <c:if
							test="${vo.like_cnt > 5}">
							<i class="fa-solid fa-heart"></i>
						</c:if></td>
					<td>${vo.board_name }</td>
					<td>${vo.view_cnt }</td>
					<!-- wdate 타입을 클래스에서 LocalDateTime 으로 했을때 날짜시간을 문자열 yyyy-MM-dd'T'HH:mm 형식이다.
 			 wdate필드값을 pattern으로 파싱(형식을 맞춤)-->
					<%-- 	<fmt:parseDate pattern="yyyy-MM-dd'T'HH:mm" value="${vo.wdate }" var="wdate"/> --%>
					<td><fmt:formatDate value="${vo.wdate }" pattern="yyyy-MM-dd" />
						<!-- 출력패턴 --></td>
				</tr>
			</c:forEach>
		</table>
		
		<br> <a
			href="${pageContext.request.contextPath }/community/community"
			id="homebtn">메인으로</a>

	</div>
</body>
</html>