<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="resources/css/community.css" />
</head>
<body>
	<nav>
		<ul class="mainMenu">
			<li><a href="home">G-IDLE</a></li>
			<li><a href="community">Dashboard</a></li>
			<li><a href="profile">Profile</a></li>
			<li><a href="albumList">Album</a></li>
			<li><a href="#">My Info</a></li>
		</ul>
	</nav>
	<nav class="shadow">
		<ul class="menu">
			<li><a href="announce">공지사항</a></li>
			<li><a href="freeboard">자유게시판</a></li>
			<li><a href="letter">아이들에게 편지</a></li>
			<li><a href="levelrequest">등업요청</a></li>
		</ul>
	</nav>
	<div class="subHeader">
		<h1>공지사항</h1>
		<!-- js사용해서 카테고리 이름 가져오기 가능? -->
	</div>
	<div class="container">
		<div style="display: flex">
			<div class="srchArea">
				<select>
					<option value="" selected>제목</option>
					<option value="">제목+내용</option>
					<option value="">작성자</option>
				</select> <input type="text" placeholder="검색어를 입력하세요">
				<button type="button">검색</button>
			</div>
			<div class="writeBtn">
				<!-- 등급에 따라 숨김 -->
				<a href="">글쓰기</a>
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
			<!-- c:forEach -->
			<tr>
				<td>인덱스</td>
				<td><a href="#">굴제목(댓글수)</a></td>
				<td>글쓴이</td>
				<td>조회수</td>
				<td>작성일</td>
			</tr>
			<tr>
				<td>인덱스</td>
				<td><a href="#">굴제목(댓글수)</a></td>
				<td>글쓴이</td>
				<td>조회수</td>
				<td>작성일</td>
			</tr>
			<tr>
				<td>인덱스</td>
				<td><a href="#">굴제목(댓글수)</a></td>
				<td>글쓴이</td>
				<td>조회수</td>
				<td>작성일</td>
			</tr>
			<tr>
				<td>인덱스</td>
				<td><a href="#">굴제목(댓글수)</a></td>
				<td>글쓴이</td>
				<td>조회수</td>
				<td>작성일</td>
			</tr>
			<tr>
				<td>인덱스</td>
				<td><a href="#">굴제목(댓글수)</a></td>
				<td>글쓴이</td>
				<td>조회수</td>
				<td>작성일</td>
			</tr>
			<tr>
				<td>인덱스</td>
				<td><a href="#">굴제목(댓글수)</a></td>
				<td>글쓴이</td>
				<td>조회수</td>
				<td>작성일</td>
			</tr>
			<tr>
				<td>인덱스</td>
				<td><a href="#">굴제목(댓글수)</a></td>
				<td>글쓴이</td>
				<td>조회수</td>
				<td>작성일</td>
			</tr>
			<tr>
				<td>인덱스</td>
				<td><a href="#">굴제목(댓글수)</a></td>
				<td>글쓴이</td>
				<td>조회수</td>
				<td>작성일</td>
			</tr>
			<tr>
				<td>인덱스</td>
				<td><a href="#">굴제목(댓글수)</a></td>
				<td>글쓴이</td>
				<td>조회수</td>
				<td>작성일</td>
			</tr>
			<tr>
				<td>인덱스</td>
				<td><a href="#">굴제목(댓글수)</a></td>
				<td>글쓴이</td>
				<td>조회수</td>
				<td>작성일</td>
			</tr>

		</table>

		<div class="pageNum">
			<a href="#">&lt;&lt;</a> <a href="#">&lt;</a>

			<!-- c:forEach -->
			<a href="#">pageNum</a> <a href="#">&gt;</a> <a href="#">&gt;&gt;</a>
		</div>
		
		<a href="community" id="homebtn">메인으로</a>
	</div>
</body>
</html>