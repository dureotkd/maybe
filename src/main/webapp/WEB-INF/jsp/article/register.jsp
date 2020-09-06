<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../part/head.jspf"%>

<script>
var ArticleWriteForm__submitDone = false;
function ArticleWriteForm__submit(form) {
	if ( ArticleWriteForm__submitDone ) {
		alert('처리중입니다.');
		return;
	}
	form.title.value = form.title.value.trim();

	if (form.title.value.length == 0) {
		form.title.focus();
		alert('제목을 입력해주세요.');

		return;
	}

	form.body.value = form.body.value.trim();

	if (form.body.value.length == 0) {
		form.body.focus();
		alert('내용을 입력해주세요.');

		return;
	}

	var maxSizeMb = 50;
	var maxSize = maxSizeMb * 1024 * 1024 //50MB
	
	if (form.file__article__0__common__attachment__1.value) {
		if ( form.file__article__0__common__attachment__1.files[0].size > maxSize ) {
			alert(maxSizeMb + "MB 이하의 파일을 업로드 해주세요.");
			return;
		} 
	}

	if (form.file__article__0__common__attachment__2.value) {
		if ( form.file__article__0__common__attachment__2.files[0].size > maxSize ) {
			alert(maxSizeMb + "MB 이하의 파일을 업로드 해주세요.");
			return;
		} 
	}

	if (form.file__article__0__common__attachment__3.value) {
		if ( form.file__article__0__common__attachment__3.files[0].size > maxSize ) {
			alert(maxSizeMb + "MB 이하의 파일을 업로드 해주세요.");
			return;
		} 
	}

	if (form.file__article__0__common__attachment__4.value) {
		if ( form.file__article__0__common__attachment__4.files[0].size > maxSize ) {
			alert(maxSizeMb + "MB 이하의 파일을 업로드 해주세요.");
			return;
		} 
	}

	if (form.file__article__0__common__attachment__5.value) {
		if ( form.file__article__0__common__attachment__5.files[0].size > maxSize ) {
			alert(maxSizeMb + "MB 이하의 파일을 업로드 해주세요.");
			return;
		} 
	}


	var startUploadFiles = function(onSuccess) {
		if ( form.file__article__0__common__attachment__1.value.length == 0
			&& form.file__article__0__common__attachment__2.value.length == 0 && form.file__article__0__common__attachment__3.value.length == 0
			&&  form.file__article__0__common__attachment__4.value.length == 0 && form.file__article__0__common__attachment__5.value.length == 0
			) {
			onSuccess();
			return;
		}

		var fileUploadFormData = new FormData(form); 

		$.ajax({
			url : './../file/doUploadAjax',
			data : fileUploadFormData,
			processData : false,
			contentType : false,
			dataType:"json",
			type : 'POST',
			success : onSuccess
		});
	}

	ArticleWriteForm__submitDone = true;
	startUploadFiles(function(data) {
		var fileIdsStr = '';

		if ( data && data.body && data.body.fileIdsStr ) {
			fileIdsStr = data.body.fileIdsStr;
		}

		form.fileIdsStr.value = fileIdsStr;
		form.file__article__0__common__attachment__1.value = '';
		form.file__article__0__common__attachment__2.value = '';
		form.file__article__0__common__attachment__3.value = '';
		form.file__article__0__common__attachment__4.vlaue = '';
		form.file__article__0__common__attachment__5.value = '';
		form.submit();
	});
}
</script>

<style>

.total-wrap {
	width:100%;
	height:100vh;
	background:#fafafa;
	padding-top:50px;
	over-flow:hidden;
}
.write-wrap {
	display:flex;
	justify-content:center;
	align-items:center;
	max-width:940px;
	border:1px solid #bdbdbd;
}
.form-box {
	display:flex;
	flex-direction:column;
}
textarea {
	background:none;
	padding:10px;
	font-size:1.3rem;
	
}
.input-img {
	display:flex;
	flex-direction:column;
	justify-content:space-between;
	margin-left:15px;
}

.board-item {
	display:flex;
	margin-bottom:20px;
	align-items:center;
	jusitfy-content:center;
	text-align:center;
}
.board-item > a{
	width:100%;
}

.wrapping {
	display:flex;
}

</style>

<div class="total-wrap">
<div class="write-wrap">
<form class="form-box" method="POST" onsubmit="ArticleWriteForm__submit(this); return false;" action="registered">
<input type="hidden" name="redirectUri" value="detail?id=#id" />
<input type="hidden" name="fileIdsStr">
<input type="hidden" name="title" placeholder="제목" value="1"/>
<div class="board-item">
<a href="#">Photo</a>
<a href="#">Video</a>
<a href="#">Article</a>
</div>

<div class="wrapping">
<textarea name="body"  id="" cols="30" rows="10" placeholder="지금 무슨일이 일어나고 있나요?" autofocus ></textarea>
<input type="hidden" name="memberId"  value="${loginedMemberId}"/>
<input type="text" name="tag"  />
<div class="input-img">
<label for="">Video</label>
<input type="file" accept="video/*"  name="file__article__0__common__attachment__1" />
<input type="hidden" accept="video/*"  name="file__article__0__common__attachment__2" />


<label for="">Image</label>
<input type="file" accept="image/*" name="file__article__0__common__attachment__3">
<input type="file" accept="image/*" name="file__article__0__common__attachment__4">
<input type="file" accept="image/*" name="file__article__0__common__attachment__5">
<input type="submit" class="submit" onclick="articleWriteNotify()" />
</div>
</div>
</form>
</div>
</div>
<%@ include file="../part/foot.jspf"%>

