<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>패스워드 변경</title>
<script type="text/javascript">
	function validPassw() {
		var new1=document.frmPass.newpass.value;
		var new2=document.frmPass.newpass2.value;
		var old=document.frmPass.oldpass.value;
		var result=true;
		
		if(old=="") {
			/* span 태그에 내용과 스타일 수정 */
			document.getElementById("oldpass").innerHTML="현재 비밀번호 입력 필수입니다.";
			document.getElementById("oldpass").style.color="red";
			document.frmPass.oldpass.focus();
			result=false;
		}else{
			document.getElementById("oldpass").innerHTML="";
		}
		
		//입력 여부 확인
		if(new1=="") {
			/* span 태그에 내용과 스타일 수정 */
			document.getElementById("newpass").innerHTML="새로운 비밀번호 입력 필수입니다.";
			document.getElementById("newpass").style.color="red";
			document.frmPass.newpass.focus();  /* input 태그 */
			result=false;
		}else{
			document.getElementById("newpass").innerHTML="";
		}
		if(new2=="") {
			/* span 태그에 내용과 스타일 수정 */
			document.getElementById("newpass2").innerHTML="새로운 비밀번호 확인 입력 필수입니다.";
			document.getElementById("newpass2").style.color="red";
			document.frmPass.newpass2.focus();  /* input 태그 */
			result=false;
		}else{
			document.getElementById("newpass2").innerHTML="";
		}
		
		if(new1!="" && new1.length<8) {
			document.getElementById("newpass").innerHTML="새로운 비밀번호는 8글자 이상입니다.";
			document.getElementById("newpass").style.color="green";
			document.frmPass.newpass.focus();
			result =false;
		}else {
			document.getElementById("newpass").innerHTML="";
		}
		
		if(new1!="" && new2!="" && new1!=new2){
			document.getElementById("newpass2").innerHTML="새로운 비밀번호 확인이 일치하지 않습니다.";
			document.getElementById("newpass2").style.color="green";
			result=false;
		}
		
		return result;
	}
	
</script>
</head>
<body>
<%@ include file="../sessionCheck.jsp" %>
<c:if test="${fail=='y' }">
	<script>
		alert("현재 비밀번호가 올바르지 않습니다.!");
	</script>
</c:if>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<form action="${contextPath}/member/passw.do" method="post" 
    name="frmPass" onsubmit="return validPassw()">
<input type="hidden" name="email" value="${member.email}">  <!-- session 애트리뷰트에 저장된 이메일 파라미터로 전달 -->
<div>
<input type="password" name="oldpass" placeholder="현재  비밀번호">
<span id="oldpass"></span>  <!-- 유효성 검사 오류시 출력할 내용 표시 -->
</div>

<div>
<input type="password" name="newpass" placeholder="새로운 비밀번호">
<span id="newpass">새로운 비밀번호는 8글자 이상입니다.</span>  <!-- 유효성 검사 오류시 출력할 내용 표시 -->
</div>

<div>
<input type="password" name="newpass2" placeholder="새로운 비밀번호 확인">
<span id="newpass2">새로운 비밀번호 확인 입력입니다.</span>  <!-- 유효성 검사 오류시 출력할 내용 표시 -->
</div>
<div>
<input type="submit" value="패스워드 변경"><input type="button" value="취소" onclick="history.back();">
</div>
</form>
</body>
</html>