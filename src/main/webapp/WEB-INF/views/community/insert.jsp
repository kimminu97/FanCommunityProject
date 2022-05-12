<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>우리동네 커뮤니티</title>
<!-- contextPath : 현재 프로젝트의 url -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/freeboard.css?v=3">
</head>
<body>
<h3>우리동네 커뮤니티</h3>
<hr>
<form name="frm1" method="post" action="insert">
 <input type="hidden" name="board_cat" value="${board_cat}"> 
 <input type="hidden" name="user_id" value="${users.user_id}"> 
 <table style="width:80%;">
 	<tr><td width="30%" class="td1">제목</td>
 		<td class="left"><input type="text" name="board_sub" size="70" class="input1" 
 			required="required"></td>
 	</tr>
 	<tr><td class="td1">작성자</td>
 		<td class="left">${users.user_name }${admin.adm_name }
 		<input type="hidden" name="board_name" size="70" class="input1" value="${users.user_name}" >
 		</td>
 	</tr>
 	
 	
 	<tr><td class="td1">내용</td>  <!-- textarea 의 크기 : rows="20" cols="80" -->
 		<td class="left"><textarea  rows="20" cols="80" name="board_con" class="input1" 
 									required="required"></textarea></td>
 	</tr>
 	<tr><td colspan="2" align="center">
 	<input type="submit" value="저장" class="btn" >
 	<!-- <a class="button" href="javascript:post_data();">저장</a> -->
 	<input type="reset"  value="다시쓰기" class="btn">
 	<input type="button" value="목록" 
 			onclick="location.href='list?pageNo=${page}&action=${board_cat }'" class="btn">
 			<!-- 글쓰기 오기전에 보고있던 페이지 번호로 돌아가기 -->
 <!-- 	<a class="button" href="#">목록</a>  -->
 	</td></tr>
 </table>
 </form>
</body>
</html>