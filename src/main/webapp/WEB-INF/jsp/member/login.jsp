<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../part/head.jspf"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>

<script>
	var 
	MemberLoginForm__submitDone = false;
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
.total-wrap {
	background:#fafafa;
	width:100%;
	height:100%;
	padding-top:50px;
}
</style>

<div class="total-wrap">
<div class="login-form-box">
	<form action="doLogin" class="login-form"
		onsubmit="MemberLoginForm__submit(this); return false;">
		<input type="hidden" name="redirectUri" value="../home/main" /> <input
			type="hidden" name="loginPwReal" /> <input type="email"
			name="email" class="login-input-box" placeholder="이메일" /> <input
			type="password" name="loginPw" class="login-input-box"
			placeholder="비밀번호" />
			<p class="left">자동 로그인</p><input type="checkBox" class="checkBox" name="loginChk"/>

			 <input type="submit" class="submit" value="Go" onclick="loginNotify()" />
	</form>

	<div class="join-box">
		<p>가입하실래요?</p>
		<a href="./join"><div class="join-item">가입</div></a>
	</div>
	<div class="join-box">
		<p>아디 잊어버렸나요?</p>
		<a href="findLoginId"><div class="join-item">아디찾기</div></a>
	</div>
	<div class="join-box">
		<p>혹시 비밀번호도?</p>
		<a href="findLoginPw"><div class="join-item">비번찾기</div></a>
	</div>
</div>
</div>

<%@ include file="../part/foot.jspf"%>