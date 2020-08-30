<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../part/head.jspf"%>

<style>
.temp {
	margin-top:100px;
}
</style>

<h1 class="temp">프로필 편집</h1>

<form action="doMyInfoEdit" method="POST" onsubmit="">
<input type="hidden" name="redirectUri" value="myInfoEdit" />
<input type="hidden" name="id" value="${loginedMember.id}" />
<input type="email"  name="email" value="${loginedMember.email}"/>
<input type="text"  name="name" value="${loginedMember.name}"/>
<input type="text" name="nickname"  value="${loginedMember.nickname}" />
<input type="text" name="introduce" id="" cols="30" rows="10" name="introduce"  value="${loginedMember.introduce}">
<input type="submit" class="submit"  />
</form>

<%@ include file="../part/foot.jspf"%>