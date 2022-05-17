<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                alert("ajax success")	//������ Ȯ���Ѵ�
                
                }
            }
        })
    }
</script>
</head>
<body>
	<form action="methods" method="get">
        <label for="songinfo">���ǰ˻��ϱ�</label>
        <input type="text" id="songinfo" class="whatToSearch" placeholder="�˻�">
        <button onclick="addMusicList()">�˻�</button>
    </form>
</body>
</html>