<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../part/head.jspf"%>

<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@400;700;800&display=swap"
	rel="stylesheet">

<script>
	function imagepreview(input) {
		if (input.files && input.files[0]) {
			var filerd = new FileReader();
			filerd.onload = function(e) {
				$('#imgpreview' + $(input).attr('id').slice(-1)).attr('src',
						e.target.result);
			};
			filerd.readAsDataURL(input.files[0]);
		}
	}

	var ArticleWriteForm__submitDone = false;
	function ArticleWriteForm__submit(form) {
		if (ArticleWriteForm__submitDone) {
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
			if (form.file__article__0__common__attachment__1.files[0].size > maxSize) {
				alert(maxSizeMb + "MB 이하의 파일을 업로드 해주세요.");
				return;
			}
		}

		if (form.file__article__0__common__attachment__2.value) {
			if (form.file__article__0__common__attachment__2.files[0].size > maxSize) {
				alert(maxSizeMb + "MB 이하의 파일을 업로드 해주세요.");
				return;
			}
		}

		if (form.file__article__0__common__attachment__3.value) {
			if (form.file__article__0__common__attachment__3.files[0].size > maxSize) {
				alert(maxSizeMb + "MB 이하의 파일을 업로드 해주세요.");
				return;
			}
		}

		if (form.file__article__0__common__attachment__4.value) {
			if (form.file__article__0__common__attachment__4.files[0].size > maxSize) {
				alert(maxSizeMb + "MB 이하의 파일을 업로드 해주세요.");
				return;
			}
		}

		if (form.file__article__0__common__attachment__5.value) {
			if (form.file__article__0__common__attachment__5.files[0].size > maxSize) {
				alert(maxSizeMb + "MB 이하의 파일을 업로드 해주세요.");
				return;
			}
		}

		var startUploadFiles = function(onSuccess) {
			if (form.file__article__0__common__attachment__1.value.length == 0
					&& form.file__article__0__common__attachment__2.value.length == 0
					&& form.file__article__0__common__attachment__3.value.length == 0
					&& form.file__article__0__common__attachment__4.value.length == 0
					&& form.file__article__0__common__attachment__5.value.length == 0) {
				onSuccess();
				return;
			}

			var fileUploadFormData = new FormData(form);

			$.ajax({
				url : './../file/doUploadAjax',
				data : fileUploadFormData,
				processData : false,
				contentType : false,
				dataType : "json",
				type : 'POST',
				success : onSuccess
			});
		}

		ArticleWriteForm__submitDone = true;
		startUploadFiles(function(data) {
			var fileIdsStr = '';

			if (data && data.body && data.body.fileIdsStr) {
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
	width: 100%;
	height: 100vh;
	background: #fafafa;
}

.submit {
	background: none;
	border: 1px solid #f50057;
	color: #f50057;
	font-size: 13px;
	padding: 10px;
	cursor: pointer;
	width: 100px;
	border-radius: 15px;
	outline: none;
	margin: 0 auto;
	margin-bottom: 10px;
}

.write-wrap {
	display: flex;
	justify-content: center;
	align-items: center;
	margin: 100px auto;
	box-sizing: border-box;
	max-width: 940px;
	position: relative;
	box-shadow: rgba(0, 0, 0, 0.1) 0px 1px 20px 0px;
}

.logined-wrap {
	display: flex;
	align-items: center;
	margin: 100px auto;
	box-sizing: border-box;
	max-width: 940px;
	padding:8px;
	position: relative;
	box-shadow: rgba(0, 0, 0, 0.1) 0px 1px 20px 0px;
}

.form-box {
	display: flex;
	flex-direction: column;
	width: 100%;
}

.font3 {
	font-family: 'Nanum Myeongjo', serif;
}

textarea {
	background: none;
	padding: 10px;
	font-size: 1.3rem;
	border: none;
	outline: none;
}

.input-img {
	display: flex;
	justify-content: space-between;
	width: 100%;
}

.board-item {
	display: flex;
	margin-bottom: 20px;
	align-items: center;
	jusitfy-content: center;
	text-align: center;
}

.board-item>a {
	width: 100%;
}

.wrapping {
	display: flex;
}

.file-upload {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.file-con {
	width: 500px;
	height: 500px;
	overflow: hidden;
	margin: 0 auto;
}

.none {
	display: none;
}

input[type="file"] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	magin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

.textarea-box {
	display: flex;
	flex-direction: column;
	width: 50%;
	justify-content: space-between;
}

.img-logo {
	border-radius: 50%;
	font-size: 1.3rem;
	padding: 13px;
	position: absolute;
	top: 0;
	right: -70px;
	box-shadow: 0 10px 10px -12px rgba(0, 0, 0, 0.56), 0 4px 10px 0px
		rgba(0, 0, 0, 0.12), 0 8px 10px -10px rgba(0, 0, 0, 0.2);
}

.label-1, .label-2, .label-3 {
	width: 1px;
}

.login-box {
	width: 100px;
	height: 100px;
	overflow: hidden;
}

.login-profile {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.login-reco {
	display:flex;
	flex-direction:column;
	margin-left:20px;
}
.small-font {
	font-size:18px;
	color:#bdbdbd;
	line-height:35px;
}
</style>

<div class="total-wrap">

	<div class="logined-wrap">
		<div class="login-box">
			<img class="login-profile"
				src="/file/showImg?id=${loginedMember.extra.file__common__attachment['1'].id}&updateDate=${loginedMember.extra.file__common__attachment['1'].updateDate}" />
		</div>
		<div class="login-reco">
		<h2 class="font3">${loginedMember.nickname}님의 ${articleIdCount+1}번째 글입니다 .</h2>
		<h2 class="font3 small-font"> 이전 게시글에서 팔로우가 ${beforeFollowCount}명 늘었습니다 .</h2>
		</div>
	</div>

	<div class="write-wrap">
		<form class="form-box" method="POST"
			onsubmit="ArticleWriteForm__submit(this); return false;"
			action="doWriteArticle">
			<input type="hidden" name="memberId" value="${loginedMemberId}" /> <input
				type="hidden" name="redirectUri" value="detail?id=#id" /> <input
				type="hidden" name="fileIdsStr"> <input type="hidden"
				name="title" placeholder="제목" value="1" />
			<div class="wrapping">
				<input type="hidden" name="tag" />
				<div class="input-img">
					<label for="video"></label> <input type="file" accept="video/*"
						name="file__article__0__common__attachment__1" /> <input
						type="hidden" accept="video/*"
						name="file__article__0__common__attachment__2" />

					<div class="file-con">
						<img
							src="https://data.photo-ac.com/data/thumbnails/7a/7acf9df1e8b0588d23c8b36530540aa0_t.jpeg"
							id="imgpreview1" class="file-upload" />
					</div>

					<div class="file-con none">
						<label for="idupload-2"> <img
							src="https://scontent-cph2-1.cdninstagram.com/v/t51.2885-19/44884218_345707102882519_2446069589734326272_n.jpg?_nc_ht=scontent-cph2-1.cdninstagram.com&_nc_ohc=7xEzH-b7neEAX8-u4aK&oh=03aa0383a46332fd1b76eaa62a308799&oe=5F72988F&ig_cache_key=YW5vbnltb3VzX3Byb2ZpbGVfcGlj.2"
							id="imgpreview2" class="file-upload" />
						</label>
					</div>

					<div class="file-con none">
						<label for="idupload-3"> <img id="imgpreview3"
							class="file-upload"
							src="https://scontent-cph2-1.cdninstagram.com/v/t51.2885-19/44884218_345707102882519_2446069589734326272_n.jpg?_nc_ht=scontent-cph2-1.cdninstagram.com&_nc_ohc=7xEzH-b7neEAX8-u4aK&oh=03aa0383a46332fd1b76eaa62a308799&oe=5F72988F&ig_cache_key=YW5vbnltb3VzX3Byb2ZpbGVfcGlj.2" />
						</label>
					</div>
					<input type="file" accept="image/*" id="idupload-1"
						onchange="imagepreview(this);"
						name="file__article__0__common__attachment__3"> <input
						type="file" accept="image/*" id="idupload-2"
						onchange="imagepreview(this);"
						name="file__article__0__common__attachment__4"> <input
						type="file" accept="image/*" id="idupload-3"
						onchange="imagepreview(this);"
						name="file__article__0__common__attachment__5">

					<div class="textarea-box">
						<textarea name="body" class="font3" cols="30" rows="10"
							placeholder="내용을 입력해주세요." autofocus></textarea>
						<input type="submit" class="submit" value="저장"
							onclick="articleWriteNotify()" />
					</div>

					<label for="idupload-1" class="label-1"> <span
						class="img-logo"> <i class="fas fa-image"></i>
					</span>
					</label>
				</div>
			</div>
		</form>
	</div>
</div>
<%@ include file="../part/foot.jspf"%>

