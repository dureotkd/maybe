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
}
.w100 {
	width:100%;
	display:flex;
	flex-direction:column;
	align-items:center;
}
.inputItem {
	width:320px;
	height:32px;
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
.label{
	font-size:14px;
	color:#757575;
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
.mini {
	font-size:13px;
	margin-bottom:10px;
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
<div class="imgBox">
<img class="profile" src="/file/showImg?id=${loginedMember.extra.file__common__attachment['1'].id}&updateDate=${loginedMember.extra.file__common__attachment['1'].updateDate}" />
</div>

<div class="column">
<input class="inputItem" type="hidden" name="redirectUri" value="myInfoEdit" />
<input class="inputItem" type="hidden" name="id" value="${loginedMember.id}" />
<label for="">이메일</label>
<input class="inputItem" type="email"  name="email" value="${loginedMember.email}"/>
<label for="">이름</label>
<input class="inputItem" type="text"  name="name" value="${loginedMember.name}"/>
<label for="" class="label">사용자 이름</label>
<span class="mini red">*사용자 이름은 14일 안에 두 번만 변경할 수 있습니다.</span>
<input class="inputItem" type="text" name="nickname"  value="${loginedMember.nickname}" />
<label for="">소개</label>
<textarea class="inputItem Big" type="text" name="introduce" id="" cols="30" rows="10" name="introduce">${loginedMember.introduce}</textarea>
<div class="row sp-b">
<input type="submit" class="submit margin-bottom30 w100px " value="저장" />
<a href="./showDisAbledForm" class="blue size14 size" onclick="">계정을 일시적으로 비활성화</a>
</div>
</div>
</form>
</div>

<%@ include file="../part/foot.jspf"%>