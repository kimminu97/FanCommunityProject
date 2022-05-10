<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여자아이들 회원 정보 수정(관리자) </title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/userupdate.css">
	
</head>
<body>
<div class="bg">
<a href="home"><img class="logo" alt="logo"
			src="./resources/image/logo.png" /></a> <br>
	<form name="frmUser" method="post" action="./adminsave.do">
	<div class="wrap">
			<div> 
				<div class="adminupdate">
					<h2>회원 정보 수정(관리자)</h2>
						<div class="update_id">
							<h3>아이디</h3>
							<div style="display: inline-block">
								<input type="text" name="user_id" id="userid" value="${users.user_id }">
							</div>
						</div>
						<div class="update_pw">
							<h3> 비밀번호 </h3>
							<input type="text" name="user_password" id="userpw" class="pw" value="${users.user_password }">
						</div>
						<div class="update_pw1">
							<h3> 비밀번호 재확인 </h3>
							<input type="text" name="user_password1" id="userpw1" class="pw" value="${users.user_password }">
						</div>
							&nbsp;&nbsp;&nbsp;<span id="checkpw" style="color:red" class="text-left"></span>
						<div class="update_name">
							<h3>팬닉</h3>
							<div style="display: inline-block">
								<input type="text" name="user_name" id="username" placeholder="예)여자아이들짱" 
								value="${users.user_name }">
							</div>
							<div class="namecheck" style="display: inline-block">
								<input type="button" name="name_check" id="namecheck" value="중복확인">
							</div>
						</div>
							&nbsp;&nbsp;&nbsp;<span id="checkmsg1" style="color:red" class="text-left"></span>
						<div class="update_email">
							<h3>이메일</h3>
							<input type="text" name="user_email" id="usereamil" placeholder="예)....@naver.com"
							value="${users.user_email }">
	                	</div>
						<div class="update_joindate">
							<h3>가입날짜</h3>
								<input type="text" readonly name="user_joindate" id="userjoindate" value="${users.joindate }">
						</div>
						<div class="update_grade">
							<h3>등급</h3>
							<select name="user_grade" id="usergrade" class="grade">
								<!-- value 속성은 서버에 전달시킬 값 -->
								<option value="user_grade" class="grade1">${users.user_grade }</option>
								<option value="후크선장">후크선장</option>
								<option value="웬디" >웬디</option>
								<option value="팅커벨">팅커벨</option>
								<option value="피터팬">피터팬</option>
							</select>
						</div>
						<div class="update_replynum">
							<h3>댓글 개수</h3>
								<input type="text" readonly name="user_replynum" id="userreplynum" value="${users.user_replynum }">
						</div>
						<div class="update_articlenum">
							<h3>게시글 개수</h3>
								<input type="text" readonly name="user_articlenum" id="userarticlenum" value="${users.user_articlenum }">
						</div>
						
						<div class="update_submit">
							<input type="button" value="수정하기" onclick="valid_check()">
	 					</div>
	 					
 				</div>
 			</div>
 		</div>
		</form>
	</div>
	
	<script type="text/javascript">
	
	var name_check = false;
	var pw_check = false;
	
	
	 function valid_check(){
         const frm = document.forms[0];
         const user_id = frm.user_id;  
         const user_pw = frm.user_password;
         const user_pw1 = frm.user_password1;
         const user_name = frm.user_name;
         const user_email = frm.user_email;
         
         var regEmail =/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
         var new_data;
         var Data = "A/ s~pecial! .char\acter@";
         var isValid = true;
				
         if(user_id.value == ""){
             alert('아이디 입력은 필수입니다.')
             user_id.focus();
             isValid=false;
         }else if(user_id.value.length < 4) {
        	 alert('아이디는 최소 4글자 이상으로 해주세요.')
        	 user_id.focus();
        	 isValid=false;
         }else if(user_name.value=="" ){
             alert('팬닉 입력은 필수입니다.')
             user_name.focus();
             isValid=false;
         }else if(user_pw.value==""){
             alert('비밀번호 입력은 필수입니다.')
    		 user_pw.focus();
             isValid=false;
         }else if(user_pw.value.length < 8){
        	 alert('비밀번호는 최소 8글자 이상으로 해주세요.')
        	 user_pw.focus();
        	 isValid=false;
         }else if(user_pw1.value ==""){
        	 alert('비밀번호 재확인을 입력해주세요.')
        	 user_pw1.focus();
        	 isValid=false;
         }else if(user_pw1.value != user_pw.value){
        	 alert('비밀번호가 일치하지 않습니다.')
        	 user_pw1.focus();
        	 isValid=false;
         }else if(user_email.value ==""){
        	 alert('이메일을 입력해 주세요.')
        	 user_email.foucs();
        	 isValid=false;
         }else if(!regEmail.test(user_email.value)){
        	 alert('이메일 형식이 올바르지 않습니다.')
        	 user_email.focus();
        	 isValid=false;
         }
         if(isValid){
             alert('수정완료되었습니다.')
             frm.submit();
         }
     
 }  //fucn 끝

 	//비동기 통신
 	document.querySelector("#namecheck").addEventListener('click',function(){
      	const frm = document.forms[0];
        const user_name = frm.user_name.value;  
      	const xhr = new XMLHttpRequest();
          
      	if(user_name==""){
        	alert('닉네임 입력은 필수입니다.')
            user_name.focus();
        	return;
          }
          xhr.open('GET','${pageContext.request.contextPath}/asyncUser_name/'+user_name);
          xhr.send();
          xhr.onload = function() {
              if(xhr.status ==200) {
                  console.log(xhr.response);
                  const cnt = JSON.parse(xhr.response).cnt;
                  console.log(cnt)
                  if (cnt==0) {
                  	document.querySelector('#checkmsg1').innerHTML='사용 가능한 닉네임입니다.';
                  	name_check=true;
                  	document.querySelector('#checkmsg1').style.color='green';
                  }	
                  else
                  	document.querySelector('#checkmsg1').innerHTML='중복된 닉네임입니다.';
              }else {
                  console.error('Error',xhr.status,xhr.statusText);
              }
          };
     });
 	
 	//패스워드 비교
 	document.querySelector("#userpw1").addEventListener('keyup',function(){
 		const userpw = document.forms[0].userpw.value;
 		const userpw1 = document.forms[0].userpw1.value;
 		
 		if(userpw == userpw1){
 			document.querySelector('#checkpw').innerHTML='비밀번호가 일치합니다.';
 			pw_check=true;
 			document.querySelector('#checkpw').style.color='green';
 		}else 
 			document.querySelector('#checkpw').innerHTML='비밀번호가 일치하지 않습니다.';
 	});

</script>
</body>
</html>