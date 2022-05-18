<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글작성</title>
<!-- contextPath : 현재 프로젝트의 url -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/freeboard.css?v=3">
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
	<h1>글작성</h1>
	<hr width="900px">
	<form name="frm1" method="post" action="insert">
		<input type="hidden" name="board_cat" value="${board_cat}"> <input
			type="hidden" name="user_id" value="${users.user_id}">
		<c:if test="${ users==null}">
			<input type="hidden" name="board_name" size="70" class="input1"
				value="${admin.adm_name }">
		</c:if>
		<c:if test="${admin==null }">
			<input type="hidden" name="board_name" size="70" class="input1"
				value="${users.user_name}">
		</c:if>
		<table
			style="width: 900px; margin: auto; background-color: #c5c5c9; padding: 5px; border-radius: 5px;">
			<tr>
				<td class="left"
					style="border-bottom: 1px solid gray; padding: 5px 0;"><input
					type="text" name="board_sub" class="input1" required="required"
					placeholder="제목을 입력하세요" style="height: 50px; font-size: 35px;">
				</td>
			</tr>

			<tr>
				<!-- textarea 의 크기 : rows="20" cols="80" -->
				<td class="left"
					style="border-bottom: 1px solid gray; padding: 5px 0;"><textarea
						name="board_con" class="input1" required="required"
						placeholder="내용을 입력하세요" style="height: 350px; font-size: 25px;"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center" style="padding: 5px 0;"><input
					type="submit" value="저장" class="btn"> <!-- <a class="button" href="javascript:post_data();">저장</a> -->
					<input type="reset" value="다시쓰기" class="btn"> <input
					type="button" value="목록"
					onclick="location.href='list?pageNo=${page}&action=${board_cat }'"
					class="btn"> <!-- 글쓰기 오기전에 보고있던 페이지 번호로 돌아가기 --> <!-- 	<a class="button" href="#">목록</a>  -->
				</td>
			</tr>
		</table>
	</form>
</body>
</html>