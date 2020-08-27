<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../part/head.jspf"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>

<style>
h1 {
	text-align: center;
}
</style>

<script>
	var doFindLoginPwForm__submitDone = false;
	function doFindLoginPwForm__submit(form) {

		if (doFindLoginPwForm__submitDone){
			alert('처리중입니다.');
			return;
		}

		if (form.email.value.length == 0){
			form.email.focus();
			alert('가입 당시 이메일을 입력해주세요');
			return;
		}

		form.submit();
		doFindLoginPwForm__submitDone = false;
	}
</script>

<div class="login-form-box">
	<form action="doFindLoginPw" methofd="POST" class="login-form"
		onsubmit="doFindLoginPwForm__submit(this); return false;">
		<input type="hidden" name="redirectUri" value="login" />
	<input type="email" name="email" class="login-input-box" placeholder="이메일" /> 
	<input type="submit" class="submit" value="찾자" />
	</form>




	<%@ include file="../part/foot.jspf"%>