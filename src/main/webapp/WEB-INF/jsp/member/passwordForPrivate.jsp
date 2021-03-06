<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../part/head.jspf"%>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>

<script>
	function submitUnlockForm(form) {
		form.loginPw.value = form.loginPw.value.trim();

		if (form.loginPw.value.length == 0) {
			alert('비밀번호를 입력해주세요.');
			form.loginPw.focus();
			return;
		}

		form.loginPwReal.value = sha256(form.loginPw.value);
		form.loginPw.value = '';

		form.submit();
	}
</script>



<h1>비밀번호 확인</h1>


<form action="unlockPasswordForPrivate" method="POST" class="table-form" onsubmit="submitUnlockForm(this); return false;">
<input type="hidden" name="loginPwReal" />
<input type="hidden" name="redirectUri"  />
<input type="password"  name="loginPw" autofocus  />
<input type="submit" />

</form>



<%@ include file="../part/foot.jspf"%>