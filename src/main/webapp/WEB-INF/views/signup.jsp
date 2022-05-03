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
								&nbsp;&nbsp;&nbsp;<span id="checkmsg" style="color:red"></span>
						</div>
						<div class="signup_pw">
							<h3> 비밀번호 </h3>
							<input type="password" name="user_password" id="userpw">
						</div>
						<div class="signup_pw1">
							<h3> 비밀번호 재확인 </h3>
							<input type="password" name="user_password1" id="userpw1" class="test">
						</div>
						<div class="signup_name">
							<h3>팬닉</h3>
							<div style="display: inline-block">
								<input type="text" name="user_name" id="username" placeholder="예)여자아이들짱">
							</div>
							<div class="namecheck" style="display: inline-block">
								<input type="button" name="name_check" id="namecheck" value="중복확인">
							</div>
						</div>
						&nbsp;&nbsp;&nbsp;<span id="checkmsg1" style="color:red"></span>
						<div class="signup_email">
							<h3>이메일</h3>
							<input type="text" name="user_email" id="usereamil" placeholder="예)....@naver.com">
	                	</div>
						<div class="signup_submit">
							<input type="submit" value="가입하기" onclick="valid_check()">
	 					</div>
 				</div>
 			</div>
 		</div>
		</form>
	</div>
	
	<script type="text/javascript">
	 
	var id_check = false;
	var name_check = false;
	
	 function valid_check(){
         const frm = document.forms[0];
         const user_id = frm.user_id;  
         const user_pw = frm.user_password;
         const user_pw1 = frm.user_password1;
         const user_name = frm.user_name;
         const user_email = frm.usere_mail;
         var isValid = true;
				
     if(user_id.value == ""){
         alert('아이디 입력은 필수입니다.')
         user_id.focus();
         isValid=false;
     } else if(user_name.value=="" ){
         alert('팬닉 입력은 필수입니다.')
         user_name.focus();
         isValid=false;
     }else if(user_pw==""){
         alert('비밀번호 입력은 필수입니다.')
		 user_pw.focus();
         isValid=false;
     }else if(user_pw1 ==""){
    	 alert('비밀번호 재확인을 입력해주세요.')
    	 user_pw1.focus();
    	 isValid=false;
     }else if(user_email ==""){
    	 alert('이메일을 입력해 주세요.')
    	 user_email.foucs();
    	 isValid=false;
     }else if(id_check==false){
    	 alert('아이디가 중복됩니다. 다른 아이디를 입력해 주세요.')
    	 isValid=false;
     }else if(name_check==false) {
    	 alert('팬닉 이름이 중복됩니다. 다른 이름을 입력해 주세요')
    	 isValid=false;
     }
     
     if(isValid){
         alert(user_name+'님 환영합니다!!!')
         frm.submit();
     }
 }  //fucn 끝

 	//비동기 통신
     document.querySelector("#idcheck").addEventListener('click',function(){
     	const frm = document.forms[0];
        const user_id = frm.user_id.value;  
     	const xhr = new XMLHttpRequest();
     	
     	if(user_id==""){
       	  	alert('아이디 입력은 필수입니다.')
            user_id.focus();
       	  	return;
         }
         xhr.open('GET','${pageContext.request.contextPath}/asyncUser_id/'+user_id);
         xhr.send();
         xhr.onload = function() {
             if(xhr.status ==200) {
                 console.log(xhr.response);
                 const cnt = JSON.parse(xhr.response).cnt;
                 console.log(cnt)
                 if (cnt==0) {
                 	document.querySelector('#checkmsg').innerHTML='사용 가능한 아이디입니다.';
                 	id_check=true;
                 }	
                 else
                 	document.querySelector('#checkmsg').innerHTML='중복된 아이디입니다.';
             }else {
                 console.error('Error',xhr.status,xhr.statusText);
             }
         };
    });
     
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
                  }	
                  else
                  	document.querySelector('#checkmsg1').innerHTML='중복된 닉네임입니다.';
              }else {
                  console.error('Error',xhr.status,xhr.statusText);
              }
          };
     });

</script>
</body>
</html>