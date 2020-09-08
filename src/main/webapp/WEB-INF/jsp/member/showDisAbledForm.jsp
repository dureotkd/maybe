<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../part/head.jspf"%>

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
span {
	padding:15px;
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
<form action="doMyInfoEdit" method="POST" onsubmit="" class="w100">

<div class="column">
<h2>계정 비활성화</h2>
<p>${loginedMember.nickname}님, 안녕하세요</p>
<p>계정을 삭제하지 않고 비활성화할 수 있습니다. 비활성화하면 다시 로그인하여 재활성화할 때까지 계정이 숨겨집니다.
</p>
<span>계정은 일주일에 한 번만 비활성화할 수 있습니다.</span>
<div class="row">
<span class="silver ">계속 하려면 비밀번호를 입력해주세요</span>
<input type="text" class="inputItem" placeholder="비밀번호" />
</div>
<div class="row sp-b">
<input type="submit" class="submit margin-bottom30 w100px " value="계정 비활성화 " />
</div>
</div>
</form>
</div>

<%@ include file="../part/foot.jspf"%>