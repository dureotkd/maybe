<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="UTF-8">
<head>
<meta charset="UTF-8" />
<title>Meet In here</title>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 모바일에서 사이트가 PC에서의 픽셀크기 기준으로 작동하게 하기(반응형 하려면 필요) -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- 폰트어썸 불러오기 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css">

<!--  구글 폰트 로고  -->
<link href="https://fonts.googleapis.com/css2?family=Courgette&display=swap" rel="stylesheet">

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>

<!-- 제이쿼리 불러오기 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- 구글 폰트 불러오기 -->
<!-- rotobo(400/700/900), notosanskr(400/600/900) -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700;900&family=Roboto:wght@400;700;900&display=swap" rel="stylesheet">


<script>
var MemberLoginForm__submitDone = false;
function MemberLoginForm__submit(form) {

	if (MemberLoginForm__submitDone) {
		alert('처리중입니다.');
		return;
	}

	if (form.email.value.length == 0) {
		form.email.focus();
		alert('이메일을 입력해주세요.');

		return;
	}

	form.loginPw.value = form.loginPw.value.trim();

	if (form.loginPw.value.length == 0) {
		form.loginPw.focus();
		alert('비밀번호를 입력해주세요.');

		return;
	}

	form.loginPwReal.value = sha256(form.loginPw.value);
	form.loginPw.value = '';

	form.submit();
	MemberLoginForm__submitDone = true;
}
</script>

<style>
* {
	padding: 0px;
	margin: 0px;
	text-decoration: none;
	color:inherit;	
}
html {
  /* 영문이면 roboto가 적용되고, 한글이면 Noto Sans KR가 적용되도록 아래와 같은 순서로 배치 */
  font-family: "Roboto", "Noto Sans KR", sans-serif;
}
html, body {
    margin: 0;
    height: 100%;
}

ul, li {
	list-style: none;
}
.total-wrap {
	background: #fafafa;
	width: 100%;
	display:flex;
	height: 100%;
	align-items:center;
	justify-content:center;
}
.login-form-box {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	border: 1px solid #ccc;
	height: 400px;
	width: 400px;
	box-shadow: 3px 3px 3px #ccc;
}

.login-input-box {
	width: 220px;
	margin-bottom: 15px;
	color: #262626;
	border: 1px solid #ccc;
	font-size: 13px;
	padding: 10px;
	outline: none;
}

.submit {
	background: none;
	border: 1px solid #f50057;
	color: #f50057;
	font-size: 13px;
	padding: 10px;
	cursor: pointer;
}

.login-form {
	display: flex;
	flex-direction: column;
}

.find-box {
	display: flex;
	padding: 10px;
	width: 60%;
	align-items: center;
	justify-content: space-between;
}

.find-box>p{
	color: #1a237e;
	font-size: 13px;
}
.join-box {
	width:60%;
	border-top:1px solid #ccc;
	padding-top:15px;
	text-align:center;
}
.join-box > a {
	color: #1a237e;
	font-size:16px;

}


.join-item {
	font-size: 13px;
	color: #1a237e;
}

.checkBox {
	width:20px;
	height:20px;
	margin-top:10px;
	margin-bottom:10px;
}
.logo {
	font-family: 'Courgette', cursive;
	color:#d81b60;
	margin-top:10px;
}
.articleImg {
	height:326px;
}
.best-img-box {
	display:flex;
	flex-direction:column;
	align-items:center;
	margin-right:50px;
}
@media ( max-width:800px ) {
	.visible-none {
		display:none;
	}
}
</style>

</head>
<body>
	<div class="total-wrap">
	<div class="best-img-box visible-none">
	<img class="articleImg" src="/file/showImg?id=${article.extra.file__common__attachment['3'].id}&updateDate=${article.extra.file__common__attachment['3'].updateDate}" alt="" />
	<h1 class="logo">Meet In here</h1>
	<p>사진,동영상 SNS 사이트</p>
	</div>
		<div class="login-form-box">
			<form action="doLogin" class="login-form"
				onsubmit="MemberLoginForm__submit(this); return false;">
				<input type="hidden" name="redirectUri" value="../home/main" /> <input
					type="hidden" name="loginPwReal" /> <input type="email"
					name="email" class="login-input-box" placeholder="이메일" /> <input
					type="password" name="loginPw" class="login-input-box"
					placeholder="비밀번호" />
				<p class="left">자동 로그인</p>
				<input type="checkBox" class="checkBox" name="loginChk" /> <input
					type="submit" class="submit" value="로그인" onclick="loginNotify()" />
			</form>

			<div class="find-box">
				<a href="findLoginId" class="join-item">아이디를 잊으셨나요?</a>
			</div>
			
			<div class="join-box">
				<a href="./join">새 계정 만들기</a>
			</div>
		</div>
	</div>

</body>
</html>