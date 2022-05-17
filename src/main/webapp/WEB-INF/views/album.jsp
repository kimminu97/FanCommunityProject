<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script>
    function addMusicList() {
        $.ajax({
            type: 'GET',
            url: 'http://ws.audioscrobbler.com/2.0/?method=track.search&track=the&api_key=4d58a00e1240e546f669ef2b989d9a64&format=json',
            success: function (response) {
                alert("ajax success")	//연결을 확인한다
                
                }
            }
        })
    }
</script>
</head>
<body>
	<form action="methods" method="get">
        <label for="songinfo">음악검색하기</label>
        <input type="text" id="songinfo" class="whatToSearch" placeholder="검색">
        <button onclick="addMusicList()">검색</button>
    </form>
</body>
</html>