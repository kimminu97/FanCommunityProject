<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberV3 로그인 (login.jsp)</title>
<style type="text/css">
div {
	width: 200px;
	height: 200px;
	border : 1px solid gray;
	padding: 50px;
	margin: 100px auto;
}
input{ 	padding: 7px; }
input[type=text],input[type=password]{
	border-radius: 4px; border: 2px solid #ccc;
}
input[type=submit], input[type=button] {
	padding: 7px 15px;
	margin: 7px 10px;
	background: #c69;
	color: white;
	border: none;
	cursor: pointer;
	width:35%;
}
</style>
<script type="text/javascript">
	function goHome() {
		location.href='./';		/* 요청 url 변경 */
	}
</script>
</head>
<body>
<c:if test="${success=='n' }">
	<script type="text/javascript">
		alert("로그인 정보가 틀립니다.!다시하세요.");
		location.href="./login.do"
	</script>
</c:if>
<c:if test="${re=='y' }">
	<script type="text/javascript">
		alert("패스워드 수정완료!다시로그인 하세요.");
	</script>
</c:if>
<div>
	<!-- action :입력을 처리할 페이지, 
		 method : query string(GET) or form data(POST) -->
	<form action="login.do" method="post" >
		<label for="userid">아이디</label><br>
		<input type="text" name="user_id" id="userid" placeholder="이메일"><br><br>
		<label for="pwd">패스워드</label><br>
		<input type="password" name="USER_PASSWORD" id="pwd" placeholder="패스워드"><br><br>
		<input type="submit" value="로그인">
		<input type="button" value="홈" onclick="goHome()">
	</form>
</div>
</body>
</html>