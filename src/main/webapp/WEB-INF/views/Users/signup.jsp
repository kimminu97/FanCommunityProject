<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여자아이들 회원가입 </title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/signup.css">
	
<script type="text/javascript">
	function validForm(){
		var frm = document.frmUser;
		var i;
		
		//a.
		if(frm.id.value=="") {
			alert("아이디 입력은 필수입니다.");
			frm.name.focus();
			return false;
		}
		
		//b.
		if(frm.pwd.value.length < 8) {
			alert("패스워드는 8글자 이상입니다.");
			frm.pwd.focus();
			return false;
		}
	}
	
	function validId() {
		var email = document.frmUser.id.value;
		if(id==""){
			alert("아이디를 입력해 주세요.!");
			document.frmUser.id.focus();
			return;   /* 함수 종료 */
		}
		//이동할 url , 윈도제목, 옵션 순서
		var url="./idCheck.do?email="+email;
		window.open(url,"아이디 중복체크","width=300,height=150,left=900");
	}

</script>
<!-- http://localhost:8085/idev/ 에 해당하는 부분은 contextPath 프로퍼티로 가져옵니다. -->
</head>
<body>
<div class="bg">
		
	<form name="frmUser" method="post" action="./join.do">
	<div class="wrap">
			<!-- 아이디 -->
			<div>
				<div class="signup">
					<h2>회원가입</h2>
						<div class="signup_id">
							<h3>아이디</h3>
							<div style="display: inline-block">
								<input type="text" name="user_id" id="userid">
							</div>
							<div class="idcheck" style="display: inline-block">
								<input type="button" name="id_check" id="idcheck" value="중복확인">
							</div>
						</div>
						<div class="signup_pw">
							<h3> <label>비밀번호</label> </h3>
							<input type="text" name="user_pw" id="userpw">
						</div>
						<div class="signup_pw1">
							<h3> <label>비밀번호 재확인</label> </h3>
							<input type="text" name="user_pw1" id="userpw1">
						</div>
						<div class="signup_name">
							<h3> <label>팬닉</label> </h3>
							<div style="display: inline-block">
								<input type="text" name="user_name" id="username" placeholder="예)여자아이들짱">
							</div>
							<div class="idcheck" style="display: inline-block">
								<input type="button" name="id_check" id="idcheck" value="중복확인">
							</div>
						</div>
						<div class="signup_email">
							<h3> <label>이메일</label> </h3>
							<input type="text" name="user_email" id="usereamil" placeholder="예)....@naver.com">
	                	</div>
						<div class="signup_submit">
							<input type="submit" value="가입하기" onclick="location.href=''">
	 					</div>
 				</div>
 			</div>
 		</div>
		</form>
	</div>
</body>
</html>