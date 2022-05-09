<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>우리동네 커뮤니티</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/freeboard.css">
<script type="text/javascript">
	if(${message!=null}) 
		alert('${message}');
</script>
</head>
<body>
<h3>자유게시판</h3>
<hr>
<div style="margin:auto;">
 <table>
 	<tr><th width="10%">번호</th>
 		<th width="45%">제목</th>
 		<th width="15%">작성자</th>
 		<th width="10%">조회수</th>
 		<th width="20%">작성일</th>
 	</tr>
 	<c:forEach var="vo" items="${list}">
	<tr>
		<td>${vo.board_idx }</td> 	
 		<td><a href="detail?board_idx=${vo.board_idx}&pageNo=${page.pageNo}&action=2" class="title">${vo.board_sub }</a>
 		...<span style="color:orange;font-size: 80%;">(${vo.com_cnt})
 		</span></td>
 		<td>${vo.board_name }</td>
 		<td>${vo.view_cnt }</td>
 		<td>
 		<!-- wdate 타입을 클래스에서 LocalDateTime 으로 했을때 날짜시간을 문자열 yyyy-MM-dd'T'HH:mm 형식이다.
 			 wdate필드값을 pattern으로 파싱(형식을 맞춤)-->
 	<%-- 	<fmt:parseDate pattern="yyyy-MM-dd'T'HH:mm" value="${vo.wdate }" var="wdate"/> --%>
 		<fmt:formatDate value="${vo.wdate }" pattern="yyyy-MM-dd"/>  <!-- 출력패턴 -->
 		</td>
 	</tr>
 	</c:forEach>
 	<tr><td colspan="4">Go!
 	<!-- a태그 url요청 get 메소드 -->
 	<a class="button" href="insert?pageNo=${page.pageNo }&action=2">글쓰기</a>
 	<a class="button" href="${pageContext.request.contextPath }/community/community">홈</a></td>
 	<td>작성글 총 개수 : ${page.totalCount}</td>
 	</tr>
 </table>
</div>
 <!-- 페이지 이동 :전체보기 -->
 
 <div style="text-align: center;">
 <!-- 가장 첫페이지로 이동 -->
	<a class="pagenum" href="?pageNo=1&action=2">&lt;&lt;</a>   <!-- 요청url은 동일하고 파라미터만 변경됩니다. -->
	<a class="${page.startPage>1? 'pagenum':'none'}" href="?pageNo=${page.startPage-1 }&action=1">&lt;</a>  
	
	<c:forEach var="i" begin="${page.startPage }" end="${page.endPage}">  <!-- 페이지목록의 범위  -->
		<a class="pagenum" href="?pageNo=${i}&action=2">${i}</a>     <!-- 현재페이지 i값으로 변경  -->
	</c:forEach>
	
	<a class="${page.endPage!=page.totalPage? 'pagenum':'none'}" href="?pageNo=${page.endPage+1 }&action=2">&gt;</a> 
	<a class="pagenum" href="?pageNo=${page.totalPage }&action=2">&gt;&gt;</a> <!-- 맨 마지막 페이지 -->
</div>


</body>
</html>


 





