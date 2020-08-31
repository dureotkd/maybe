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
<link
	href="https://fonts.googleapis.com/css2?family=Courgette&display=swap"
	rel="stylesheet">

<!-- 구글 폰트 불러오기 -->
<!-- rotobo(400/700/900), notosanskr(400/600/900) -->
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700;900&family=Roboto:wght@400;700;900&display=swap"
	rel="stylesheet">

<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@400;700&display=swap"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>



<script>
	var sel_file;

	$(document).ready(function() {
		$("#ex_file").on("change", handleImgFileSelect);
	});

	function handleImgFileSelect(e) {
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);

		filesArr.forEach(function(f) {
			if (!f.type.match("image.*")) {
				alert("확장자는 이미지 확장자만 가능합니다.");
				return;
			}
			sel_file = f;

			var reader = new FileReader();

			reader.onload = function(e) {
				$("#img").attr("src", e.target.result);
			}
			reader.readAsDataURL(f);
		});
	}

	var MemberJoinForm__submitDone = false;
	function MemberJoinForm__submit(form) {
		if (MemberJoinForm__submitDone) {
			alert('처리중입니다.');
			return;
		}

		form.email.value = form.email.value.trim();

		if (form.email.value.length == 0) {
			form.email.focus();
			alert('이메일을 입력해주세요.');
			return;
		}

		form.name.value = form.name.value.trim();

		if (form.name.value.length == 0) {
			form.name.focus();
			alert('이름을 입력해주세요.');
			return;
		}

		form.nickname.value = form.nickname.value.trim();

		if (form.nickname.value.length == 0) {
			form.nickname.focus();
			alert('활동명을 입력해주세요.');
			return;
		}

		form.loginPw.value = form.loginPw.value.trim();

		if (form.loginPw.value.length == 0) {
			form.loginPw.focus();
			alert('비밀번호를 입력해주세요.');
			return;
		}

		var maxSizeMb = 50;
		var maxSize = maxSizeMb * 1024 * 1024 //50MB

		if (form.file__member__0__common__attachment__1.value) {
			if (form.file__member__0__common__attachment__1.files[0].size > maxSize) {
				alert(maxSizeMb + "MB 이하의 파일을 업로드 해주세요.");
				return;
			}
		}

		var startUploadFiles = function(onSuccess) {
			if (form.file__member__0__common__attachment__1.value.length == 0) {
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

		form.loginPwReal.value = sha256(form.loginPw.value);
		form.loginPw.value = '';

		MemberJoinForm__submitDone = true;
		startUploadFiles(function(data) {
			var fileIdsStr = '';

			if (data && data.body && data.body.fileIdsStr) {
				fileIdsStr = data.body.fileIdsStr;
			}

			form.fileIdsStr.value = fileIdsStr;
			form.file__member__0__common__attachment__1.value = '';
			form.submit();

		});
	}

	function JoinForm__checkEmailDup(input) {

		var form = input.form;
		form.email.value = form.email.value.trim();

		if (form.email.value.length == 0) {
			return;
		}

		$.get('getEmailDup', {
			email : form.email.value
		}, function(data) {
			var $message = $(form.email).next();

			if (data.resultCode.substr(0, 2) == 'S-') {
				$message.empty().append(
						'<div style="color:green;">' + data.msg + '</div>');
				JoinForm__validEmail = data.email;
			} else {
				$message.empty().append(
						'<div style="color:red;">' + data.msg + '</div>');
				JoinForm__validEmail = '';
			}
		}, 'json');
	}

	function JoinForm__checkNicknameDup(input) {

		var form = input.form;

		form.nickname.value = form.nickname.value.trim();

		if (form.nickname.value.length == 0) {
			return;
		}
		$.get('getNicknameDup', {
			nickname : form.nickname.value
		}, function(data) {
			var $message = $(form.nickname).next();

			if (data.resultCode.substr(0, 2) == 'S-') {
				$message.empty().append(
						'<div style="color:green;">' + data.msg + '</div>');
				JoinForm__validNickname = data.nickname;
			} else {
				$message.empty().append(
						'<div style="color:red;">' + data.msg + '</div>');
				JoinForm__validNickname = '';
			}
		}, 'json');
	}

	var JoinForm__checkNicknameDup__debounce = _.debounce(
			JoinForm__checkNicknameDup, 1000);
	var JoinForm__checkEmailDup__debounce = _.debounce(JoinForm__checkEmailDup,
			1000);
</script>

<script>
	$(document).ready(function() {
		$('.slider').bxSlider({
			auto : true,
			speed : 500,
			pause : 4000,
			mode : 'fade',
		});
	});
</script>

<style>
* {
	padding: 0px;
	margin: 0px;
	text-decoration: none;
	color: inherit;
}

html {
	/* 영문이면 roboto가 적용되고, 한글이면 Noto Sans KR가 적용되도록 아래와 같은 순서로 배치 */
	font-family: "Roboto", "Noto Sans KR", sans-serif;
}

html, body {
	margin: 0;
	height: 100%;
}

ul, li {
	list-style: none;
}

.total-wrap {
	background: #fafafa;
	width: 100%;
	height: 100%;
	display: flex;
	align-items: center;
	justify-content: center;
}

.file-con {
	width: 100px;
	height: 100px;
	overflow: hidden;
	margin: 0 auto;
	margin-bottom: 20px;
}

.login-form label {
	cursor: pointer;
	text-align: center;
}

.login-form input[type="file"] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	magin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

.file-upload {
	width: 100%;
	height: 100%;
	object-fit: cover;
	border-radius: 50%;
}

.center-box {
	display: flex;
	justify-content: center;
}

.center-box>img {
	width: 200px;
}

.login-form-box {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	border: 1px solid #ccc;
	height: 500px;
	width: 400px;
	box-shadow: 3px 3px 3px #ccc;
}

.login-form {
	display: flex;
	flex-direction: column;
}

.login-input-box {
	width: 220px;
	margin-bottom: 15px;
	color: #262626;
	border: 1px solid #ccc;
	font-size: 13px;
	padding: 10px;
	outline: none;
}

.submit {
	background: none;
	background: #f50057;;
	border: 1px solid #ccc;
	color: #fff;
	font-size: 13px;
	padding: 10px;
	cursor: pointer;
}

.join-box {
	display: flex;
	padding: 10px;
	width: 60%;
	align-items: center;
	justify-content: space-between;
}

.join-box>p {
	color: #1a237e;
	font-size: 13px;
}

.join-item {
	font-size: 13px;
	color: #1a237e;
	padding: 10px;
	border: 1px solid #1a237e;
}

.left-text-box {
	display: flex;
	flex-direction: column;
	align-items: center;
	margin-right: 50px;
}

.img-slide {
	width: 350px;
}

.bx-wrapper .bx-pager.bx-default-pager a {
	display: none;
}

.bx-wrapper .bx-controls-direction a {
	display: none;
}

.bx-wrapper {
	margin-bottom: 0px;
	height: 400px;
	width: 350px;
}

.img-slide {
	width: 350px;
}

.bx-viewport {
	max-height: 400px;
}

.logo {
	font-family: 'Courgette', cursive;
	color: #d81b60;
	margin-bottom: 30px;
	font-size: 50px;
}

@media ( max-width :800px ) {
	.visible-none {
		display: none;
	}
}
</style>
<body>
	<div class="total-wrap">
		<div class="left-text-box visible-none">
			<h1 class="logo">Meet In here</h1>
			<div class="slider">
				<c:forEach items="${articles}" var="article">
					<div>
						<img class="img-slide" src="${article.extra.articleImgUrl}" alt="" />
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="login-form-box">
			<form action="doJoin" method="POST" class="login-form"
				onsubmit="MemberJoinForm__submit(this); return false;">
				<input type="hidden" name="redirectUri" value="login" /> <input
					type="hidden" name="fileIdsStr"> <input type="hidden"
					name="loginPwReal" />
				<div class="file-con">
					<label for="ex_file"><img id="img" class="file-upload"
						src="https://scontent-cph2-1.cdninstagram.com/v/t51.2885-19/44884218_345707102882519_2446069589734326272_n.jpg?_nc_ht=scontent-cph2-1.cdninstagram.com&_nc_ohc=7xEzH-b7neEAX8-u4aK&oh=03aa0383a46332fd1b76eaa62a308799&oe=5F72988F&ig_cache_key=YW5vbnltb3VzX3Byb2ZpbGVfcGlj.2"
						alt="" /></label>
				</div>
				<input type="file" id="ex_file" class="login-input-box"
					placeholder="프로필" accept="image/*"
					name="file__member__0__common__attachment__1"> <input
					onkeyup="JoinForm__checkEmailDup__debounce(this);" type="text"
					name="email" class="login-input-box" placeholder="이메일" />
				<div class="message-msg"></div>
				<input type="text" name="name" class="login-input-box"
					placeholder="성명" /> <input
					onkeyup="JoinForm__checkNicknameDup__debounce(this);" type="text"
					name="nickname" class="login-input-box" placeholder="활동명" />
				<div class="message-msg"></div>
				<input type="password" name="loginPw" class="login-input-box"
					placeholder="비밀번호" /> <input type="submit" class="submit"
					value="가입" />
			</form>
		</div>
	</div>
</body>

</head>

</html>
