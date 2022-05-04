<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GIDLE 로그인</title>
<style type="text/css">
</style>
<script type="text/javascript">
	function goHome() {
		location.href = './'; /* 요청 url 변경 */
	}
</script>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/53a8c415f1.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/login.css">
</head>
<body>
	<c:if test="${success=='n' }">
		<script type="text/javascript">
			alert("로그인 정보가 틀립니다.!다시하세요.");
			location.href = "./login.do"
		</script>
	</c:if>
	<c:if test="${re=='y' }">
		<script type="text/javascript">
			alert("패스워드 수정완료!다시로그인 하세요.");
		</script>
	</c:if>
	<div class="bg">
		<a href="home">
		<img id="logo" alt="logo" src="./resources/image/logo.png" />
		</a>

		<form action="login.do" method="post">
			<div class="wrap">
				<div class="login">
					<h2>Log-in</h2>
					<div class="login_sns">
						<li><a href=""><i class="fab fa-instagram"></i></a></li>
						<li><a href=""><i class="fab fa-facebook-f"></i></a></li>
						<li><a href=""><i class="fab fa-twitter"></i></a></li>
					</div>
					<div class="login_id">
						<h4>E-mail</h4>
						<input type="text" name="user_id" id="userid" placeholder="id">
					</div>
					<div class="login_pw">
						<h4>Password</h4>
						<input type="password" name="USER_PASSWORD" id="pwd"
							placeholder="Password">
					</div>
					<div class="login_etc">
						<div class="checkbox">
							<input type="checkbox" name="" id=""> Remember Me?
						</div>
						<div class="forgot_pw">
							<a href="">Forgot Password?</a>
						</div>
					</div>
					<div class="submit">
						<input type="submit" value="로그인"> <input type="button"
							value="회원가입" onclick="location.href='join.do'">
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>