<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../part/head.jspf"%>

<link
	href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.9/css/select2.min.css"
	rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.9/js/select2.min.js"></script>
	
<!--  toast 메시지 라이브러리 -->
<link rel="stylesheet" type="text/css" href="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" />
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
	

<script>

$(document).ready(function(){
	$('.form-control').select2({
		placeholder: '선택하여 주십시오.',
		minimumInputLength: 1,
		ajax: {
			type: "GET",
			url: "../member/registory",
			dataType: 'json',
			delay: 300,
			catch: true,
			// 검색 쿼리
			data: function (params) {
				return {
					searchKeyword:params.term
					};
				},
				 processResults: function (data) {
				        return {
				            results: data.itmes
				        };
				    },
			}
	});
});
</script>

<style>
h2 {
	margin-top: 300px;
}

.margin {
	margin-top: 300px;
}

.form-control {
	width: 300px;
}


body{
font-family:arial;
}
.wrap{
border:0px solid;
width:40%;
margin:10px auto;
}
.input-label{
    background-color:#009688;
    color:#fff;
    padding:5px 15px;
}
</style>



<div class="margin center" style="margin-left: 10px;">
	<!-- 속성에 multiple를 추가합시다. -->
	<select class="form-control" multiple="multiple">
	</select>
</div>






<%@ include file="../part/foot.jspf"%>