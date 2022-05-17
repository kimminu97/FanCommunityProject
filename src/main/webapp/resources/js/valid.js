function validForm() {
	var frm = document.frmUser;
	var i;

	//a.
	if (frm.name.value == "") {
		alert("이름은 필수 입력입니다.");
		frm.name.focus();
		return false;
	}

	//b.
	if (frm.pwd.value.length < 8) {
		alert("패스워드는 8글자 이상입니다.");
		frm.pwd.focus();
		return false;
	}

	//c.
	if (frm.age.value < 20 || frm.age.value > 70) {
		alert("나이는 20세 이상 70세 미만으로만 가능합니다.");
		frm.age.focus();
		return false;
	}

	//d.
	for (i = 0; i < frm.hobby.length; i++) {  /* frm.hobby 는 배열. 배열의 크기만큼 반복  */
		//alert(frm.hobby.length);
		if (frm.hobby[i].checked) {  //체크선택된 취미이면 바로 submit 되도록 return true;
			//alert(frm.hobby[i].value);
			return true;
		}
	}
	if (i == frm.hobby.length) {
		alert("취미 선택을 안하셨군요!취미 하나 선택해주세요.!");
		//document.getElementById('hobby1').focus();
		frm.hobby[0].focus();
		return false;
	}

}

function validEmail() {
	var email = document.frmUser.email.value;
	if (email == "") {
		alert("이메일(아이디)를 입력해 주세요.!");
		document.frmUser.email.focus();
		return;   /* 함수 종료 */
	}
	//이동할 url , 윈도제목, 옵션 순서
	var url = "./idCheck.do?email=" + email;
	window.open(url, "아이디 중복체크", "width=300,height=150,left=900");
}