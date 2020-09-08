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

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>


<script>
	function submitModifyPrivateForm(form) {
		form.loginPw.value = form.loginPw.value.trim();

		if (form.loginPw.value.length == 0) {
			return;
		}

		if (form.loginPw.value != form.loginPwConfirm.value ){
			alert('비밀번호와 비밀번호 확인이 일치하지 않습니다.');
			return;
		}

		form.loginPwReal.value = sha256(form.loginPw.value);
		form.loginPw.value = '';

		form.submit();
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
.submit {
	background: none;
	border: 1px solid #f50057;
	color: #fff;
	font-size: 13px;
	padding: 10px;
	cursor: pointer;
}

.formBox {
	display:flex;
	flex-direction:column;
	max-width:940px;
	align-items:center;
	margin:0 auto;
	margin-top:100px;
	box-shadow:rgba(0, 0, 0, 0.1) 0px 1px 20px 0px;
}
.form {
	display:flex;
	flex-direction:column;
}
.rel {
	position:relative;
}
.fa-undo-alt {
	font-size:5rem;
}
.fa-lock {
	position:absolute;
	font-size:2rem;
	left:50%;
	top:50%;
	transform:translate(-50%,-50%);
}
.row {
	display:flex;
	align-items:center;
}
.red {
	color:#d32f2f;
}
.silver {
	color:#757575;
}
.marginl {
	margin-left:15px;
}
.rem2 {
	font-size:1.5rem;
}
.margintop {
	margin-top:20px;
}
.marginbo {
	margin-bottom:50px;
}
.inputItem {
	width: 320px;
    height: 32px;
    border: 1px solid #bdbdbd;
    border-radius: 3px;
    padding: 10px;
    outline: none;
    margin-bottom: 20px;
}
.w50 {
	width:50%;
	border-radius:3px;
}
.logo {
	font-family: 'Courgette', cursive;
	color:#d81b60;
	font-weight:normal;
}
.redback {
	background:#d32f2f;
}
.next {
	border:1px solid #bdbdbd;
	background:#fff;
	color:black;
	box-sizing:border-box;
	font-weight:bold;
	margin-left:10px;
}
.bold {
	font-weight:bold;
}
</style>

<nav class="formBox">
<i class="fas fa-undo-alt rel margintop"><i class="fas fa-lock"></i></i>

<div class="row rem2 margintop">
<h2 class="logo">Meet In here</h2><span class="marginl">개인정보보호 캠페인</span>
</div>
<span class="red rem2">비밀번호 변경</span>

<p class="silver margintop">고객님께서는 3개월 이상 비밀번호를 변경하지 않으셨습니다.</p>
<p class="silver">동일한 비밀번호를 장기간 사용 할 경우</p>
<p class="silver">개인정보 도용 및 유출 등의 위험이 있습니다.</p>
<p class="silver margintop">연속적인 숫자,생일,전화번호, 아이디와 비슷한 설정을 제외하여</p>
<p class="silver">비밀번호를 변경해주세요.</p>

<p class="red margintop">[ 안전한 비밀번호 설정방법 ]</p>
<p>영문,숫자,특수문자 조합하여 10~16자</p>

<form action="doChangePassword" method="POST" class="form margintop marginbo" onsubmit="submitModifyPrivateForm(this); return false;">
<input type="hidden" name="id" value="${loginedMemberId}" />
<input type="hidden" name="loginPwReal" />
<input type="hidden" name="redirectUri" value="../home/main" />
<input type="password"  class="inputItem" name="loginPw" autofocus placeholder="신규 비밀번호"  />
<input type="password"  class="inputItem"  name="loginPwConfirm" placeholder ="신규 비밀번호 확인" />
<div class="row">
<input type="submit" value="변경하기" class="submit  bold redback w50"/>
<button class="submit w50 next" onclick="location.href = '../home/main' ">다음에 변경하기</button>
</div>
</form>


</nav>



<%@ include file="../part/foot.jspf"%>