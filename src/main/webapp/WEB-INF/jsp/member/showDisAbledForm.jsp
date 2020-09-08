<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../part/head.jspf"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>

<script>
var disAbledAccountForm__submitDone = false;

function disAbleAccountForm__submit(form){

	if ( disAbledAccountForm__submitDone ){
		alert('처리중입니다.');
		return;
		}
	if (form.loginPw.value.length == 0){
		form.loginPw.focus();
		alert('비밀번호를 입력해주세요.');
		return;
		}

	form.loginPwReal.value = sha256(form.loginPw.value);
	form.loginPw.value = '';

	form.submit();
	disAbledAccountForm__submitDone = true;
}

</script>

<style>
.temp {
	margin-top:100px;
}
.imgBox {
	overflow:hidden;
	width:100px;
	height:100px;
	border-radius:50%;
	margin-top:20px;
	margin-bottom:20px;
}
.profile {
	width:100%;
	height:100%;
	object-fit:cover;
}
.menu {
	width:300px;
	border-right:1px solid #e0e0e0;
}
.column {
	display:flex;
	flex-direction:column;
	justify-content:space-around;
}
.wrap {
	margin:0px auto;
	margin-top:100px;
	max-width:940px;
	background:#fff;
	display:flex;
	border:1px solid  #e0e0e0;
}
.padding25{
	padding:25px;
}
.silver {
	color:#262626;
	margin-bottom:15px;
}
.w100 {
	width:100%;
	display:flex;
	flex-direction:column;
	align-items:center;
}
.inputItem {
	width:320px;
	height:20px;
	border:1px solid #bdbdbd;
	border-radius:3px;
	padding:10px;
	outline:none;
	margin-bottom:20px;
}
.Big {
	height:70px;
}
.row {
	display:flex;
}
label {
	font-size:14px;
	color:#757575;
	margin-bottom:10px;
}
.margin-bottom30 {
	margin-bottom:30px;
}
.w100px {
	width:100px;
}
.sp-b {
	justify-content:space-between;
}
.blue {
	color:#0095f6;
}
.size {
	font-size:14px;
}
.submit {
	border-radius:3px;
	background:#0095f6;
}
.column > p {
	padding:15px;
}
.column > h2 {
	padding:15px;
}
.padding15S {
	padding:15px;
}
.margin15 {
	margin:15px;
}
.silverLine {
	border-bottom:1px solid #e0e0e0;
	margin-bottom:30px;
}
</style>

<div class="wrap margin-bottom30">
<ul class="menu column">
	<li><a href="#" class="padding25 silver">프로필 편집</a></li>
	<li><a href="#" class="padding25 silver">비밀번호 변경</a></li>
	<li><a href="#" class="padding25 silver">공개 범위 및 보안</a></li>
	<li><a href="#" class="padding25 silver">푸시 알림</a></li>
	<li><a href="#" class="padding25 silver">계정 삭제</a></li>
</ul>
<form action="disAbledAccount" method="POST"  onsubmit="disAbleAccountForm__submit(this); return false;" class="w100">
<input type="hidden" name="loginPwReal"  />
<input type="hidden" name="id" value="${loginedMemberId}" />
<div class="column">
<h2>계정 비활성화</h2>
<p>${loginedMember.nickname}님, 안녕하세요. 벌써 함께한 시간이 ${loginedMember.regDateFormat}이나 되었네요.</p>
<p>계정은 삭제하지 않아도 비활성화를 통해 <span class="red">게시글,활동내역</span>이 숨겨집니다.</p>
<p>언제든지 재로그인 하여 계정을 재활성화 하실 수 있습니다. </p>
<p class="silverLine">또한, 계정은 일주일에 한 번만 비활성화 할 수 있어요.</p>
<div class="row">
<span class="silver padding15S ">계속 하려면 비밀번호를 입력해주세요</span>
<input type="password" class="inputItem" name="loginPw" placeholder="비밀번호" />
</div>
<div class="row sp-b">
<input type="submit" class="submit margin-bottom30 w100px margin15" value="계정 비활성화 " />
</div>
</div>
</form>
</div>

<%@ include file="../part/foot.jspf"%>