<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 상세보기</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/freeboard.css">
<!--  jsp파일이 자바클래스(서블릿)으로 변환되고
	그 후 script태그의 src로 설정된 파일을 삽입하여 처리되므로
	js 파일로 외부에 있으면 el을 사용하여 값을 가져올수 없습니다.
	-> detail.jsp에 스크립트를 옮겨 넣어주세요.
	-->
	<script src="https://kit.fontawesome.com/0269ed496a.js"
	crossorigin="anonymous"></script>
<script type="text/javascript">
var count = 1; 
var num = 1; 
function heart(){
	if (${checkHrt} == 0) {
		document.forms[1].action='heart';
		document.forms[1].submit();
		} else if (${checkHrt} == 1) {
		document.forms[1].action='removehrt';
		document.forms[1].submit();
		}
	}
function timeForToday(value) {
    const today = new Date();
    const timeValue = new Date(value);

    const betweenTime = Math.floor((today.getTime() - timeValue.getTime()) / 1000 / 60);
    if (betweenTime < 1) return '방금전';
    if (betweenTime < 60) {
        return `${betweenTime}분전`;
    }

    const betweenTimeHour = Math.floor(betweenTime / 60);
    if (betweenTimeHour < 24) {
        return `${betweenTimeHour}시간전`;
    }

    const betweenTimeDay = Math.floor(betweenTime / 60 / 24);
    if (betweenTimeDay < 365) {
        return `${betweenTimeDay}일전`;
    }

    return `${Math.floor(betweenTimeDay / 365)}년전`;
}
	
function addBox (x) {
	 document.getElementById('reply').innerHTML=`
		 <form action="recomment" method="post" name="reply">
		 <input type="hidden" name="comment_board" value="${bean.board_idx}">
			<input type="hidden" name="comment_boardcat" value="${bean.board_cat}">
			<!-- 메인글의 idx -->
			 <input
				type="hidden" name="pageNo" value="${page }">
		 <table style="width: 60%; margin: auto;">
		 <tr>
			<td width="25%">${users.user_name }${admin.adm_name }</td>
			<td width="25%">
			<c:if test="${ users==null}">
			<input type="hidden" name="comment_mname" size="70" class="input1" value="${admin.adm_name }" >
			</c:if>
			<c:if test="${admin==null }">
			<input type="hidden" name="comment_mname" size="70" class="input1" value="${users.user_name}" >
			</c:if>
			<input type="hidden" name="user_id" class="input1" value="${users.user_id}">
			</td>
		</tr>
		<tr>
			<td colspan="3">
				<!-- 크기조절불가 : style="resize: none;" --> <textarea rows="5"
					cols="80" name="comment_content" style="resize: none;"
					placeholder="답글을 작성하세요." class="input1"></textarea>
			</td>
			<td width="15%" style="text-align: left;">
			<input type="submit" value="저장" class="btn-small">
			<input type="button"  onclick="window.location.reload()" value="취소" class="btn-small"></td>
		</tr>
		<tr>
		 </table>
	 </form>`
}

	function update(){
	    document.getElementById('cont').innerHTML=`
	    <form method="post">
	                <input type="hidden" name="board_idx" value="${bean.board_idx}">
	                <input type="hidden" name="pageNo" value="${page}">
		             <input type="hidden" name="board_cat" value="${bean.board_cat}">
	                <textarea  rows="20" name="board_con" class="input1" 
	                style="border:1px solid gray;width:90%" required="required">${bean.board_con}</textarea>
	    </form>
	    `;

	    document.getElementById('func').innerHTML=`
	        <a class="button" onclick="javascript:save()">저장</a>
	        <a class="button" onclick="javascript:reset()">취소</a>
	    `;
	}
	function reset(){
	    document.getElementById('cont').innerHTML=`
	        <pre>${bean.board_con }</pre>
	    `;

	    document.getElementById('func').innerHTML=`
	        <a class="button" onclick="javascript:update()">수정</a>
	        <a class="button" onclick="javascript:deleteOk();">삭제</a>
	    `;

	}

	function save(){
	    document.forms[0].action='update';
	    document.forms[0].submit();
	}
	function deleteOk(){
		if(confirm('${bean.board_idx}번 글을 삭제하시겠습니까?')==true){
			document.forms[0].action='delete';
		    document.forms[0].submit();
		}
	}

	</script>
</head>
<body>
	<h3>글 상세보기</h3>
	<hr>
	<table style="width: 750px; margin: auto;">
		<tr>
			<td width="20%" class="td1">제목</td>
			<td width="40%" class="input1">${bean.board_sub}</td>
			<td width="20%" class="td1">조회수</td>
			<td class="input1">${bean.view_cnt}</td>
		</tr>
		<tr>
			<td class="td1">작성자</td>
			<td class="input1">${bean.board_name}</td>
			<td class="td1">작성날짜</td>
			<td class="input1">
				<%-- <fmt:parseDate pattern="yyyy-MM-dd'T'HH:mm" value="${bean.wdate }" var="wdate"/> --%>
				<fmt:formatDate value="${bean.wdate }" pattern="yyyy-MM-dd" />
			</td>
		</tr>
		<tr>
			<td colspan="3" class="input1" style="text-align: left;">
				<div style="height: 300px; box-sizing: border-box;" id="cont">
					<pre style="margin-left:50px">${bean.board_con }</pre>
				</div>
			</td>
			<!-- 엔터,탭,기호 등 텍스트 그대로 출력할 때 사용 -->
		</tr>
		<tr>
			<td colspan="4"><span id="func"> 
			<!-- freeboard 테이블에 작성자 또는 다른 컬럼이 member테이블의 유니크 컬럼값중 하나를
			참조하는 외래키가 잇어야 합니다. 작성자와 로그인 사용자가 같을 때만
			수정,삭제 버튼이 view에 보이게 합니다. -->
			<c:choose>
			<c:when test="${users.user_id == bean.user_id || admin != null}">
			<a class="button" href="javascript:update()">수정</a> 
					<a class="button" href="javascript:deleteOk()">삭제</a>
			</span> <a class="button" href="list?pageNo=${page }&action=${bean.board_cat}">목록</a></td>
			</c:when>
			<c:otherwise>
			</span> <a class="button" href="list?pageNo=${page }&action=${bean.board_cat}">목록</a></td>
			</c:otherwise>
			</c:choose>
			
			<form action="" method="post">
				 <input type="hidden" name="idx" value="${bean.board_idx}">
	             <input type="hidden" name="pageNo" value="${page}">
	             <input type="hidden" name="user_name" value="${users.user_name}">
	             <input type="hidden" name="board_cat" value="${bean.board_cat}">

			</form>
		</tr>
	</table>
	<!-- 메인글 상세보기 끝 -->
	
	<!-- 좋아요 버튼 -->
	<form action="" method="post">
		<input type="hidden" name="heart_memid" value="'${users.user_id }'">
		<input type="hidden" name="heart_boardid" value="${bean.board_idx }">
		<input type="hidden" name="heart_boardcat" value="${bean.board_cat }">
		<input type="hidden" name="checkHrt" value="${checkHrt }"> 
		<input type="hidden" name="pageNo" value="${page }">
	</form>
	<div class="button-container" id="button-container">
		<c:choose>
			<c:when test="${checkHrt eq '0' or empty checkHrt}">
				<!-- likecheck가 0이면 빨간하트에 하얀배경-->
				<a class="feed-icon-btn" href="javascript:heart()"
					style="background-color: white;"> <i class="fa-solid fa-heart"
					style="color: #FF5454"></i> ${heart_num }
				</a>
			</c:when>
			<c:when test ="${checkHrt eq '1'}">
				<!-- likecheck가 1이면 하얀하트에 빨간배경 -->
				<a class="feed-icon-btn" href="javascript:heart()"
					style="background-color: #FF5454; color: white"> <i
					class="fa-solid fa-heart" style="color: white"></i> ${heart_num }
				</a>
			</c:when>
		</c:choose>
	</div>
	<!-- 댓글 시작 -->
	<form action="comment" method="post" name="frmCmt">
		<input type="hidden" name="comment_board" value="${bean.board_idx}">
		<input type="hidden" name="comment_boardcat" value="${bean.board_cat}">
		<!-- 메인글의 idx -->
		 <input
			type="hidden" name="pageNo" value="${page }">
		<table style="width: 60%; margin: auto;">
			<tr>
				<td colspan="4">댓글 갯수 : ${bean.com_cnt } <input
					type="button" onclick="window.location.reload()" value="새로고침"
					class="btn-small">
				</td>
			</tr>
			<tr>
				<td colspan="4"><hr></td>
			</tr>
			<!-- 댓글 입력 -->
			<tr>
				<td width="25%">${users.user_name }${admin.adm_name }</td>
				<td width="25%">
				<c:if test="${ users==null}">
 				<input type="hidden" name="comment_mname" size="70" class="input1" value="${admin.adm_name }" >
 				</c:if>
 				<c:if test="${admin==null }">
 				<input type="hidden" name="comment_mname" size="70" class="input1" value="${users.user_name}" >
 				</c:if>
				<input type="hidden" name="user_id" class="input1" value="${users.user_id}">
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<!-- 크기조절불가 : style="resize: none;" --> <textarea rows="5"
						cols="80" name="comment_content" style="resize: none;"
						placeholder="댓글을 작성하세요." class="input1"></textarea>
				</td>
				<td width="15%" style="text-align: left;">
				<input type="submit" value="저장" class="btn-small">
				<input type="reset" value="취소" class="btn-small"></td>
			</tr>
			<tr>
				<td colspan="4"><hr></td>
			</tr>
			<!-- 댓글 목록 -->
			<c:set var="image" value="${pageContext.request.contextPath}/resources/image"/>
	 <c:forEach var="cmt"  items="${cmtlist }">
	 	<tr>
	 		<td colspan="4">
	 			<div id="comment" style="margin-left:<c:out value='${20*cmt.comment_depth}'/>" >
		 			<div>
			 			<span class="name" style="float: left;">${cmt.comment_mname }</span>
			 			<span class="now">
			 				<fmt:formatDate value="javascript:timeForToday(${cmt.comment_wdate })" 
			 				pattern="yyyy-MM-dd a hh:mm"/>
			 			</span>
			 			<span style="float: right;">
			 			<a href="javascript:addBox(reply)">답글</a>
			 			<c:if test="${users.user_name == cmt.comment_mname || admin != null}">
			 			<a href="javascript:delete_cmt('${cmt.comment_idx }')">
			 			<img alt="삭제" src="${image }/delete.png" style="width:20px;">
			 			</a>
			 			</c:if>
			 			</span>
		 			</div>
		 			<div style="padding-top: 10px">
		 				<pre style="text-align: left">${cmt.comment_content }</pre>
		 			</div>
	 			</div>
	 		</td>
	 	</tr>
	 
	 </c:forEach>	
	
		</table>
			<div id="reply">
	 	
	</div>
	 	<script type="text/javascript">
			function delete_cmt(idx){
				if(confirm(idx+'번 선택한 댓글 삭제하시겠습니까?') == true)
					location.href=`comment?idx=`+idx+`&pageNo=${page}&mref=${bean.board_idx}&action=${bean.board_cat}
					&user_name=${users.user_name}`;
			}
</script>
<script type="text/javascript">
	if(${message!=null}) alert('${message}');
</script>
	</form>
	
</body>
</html>