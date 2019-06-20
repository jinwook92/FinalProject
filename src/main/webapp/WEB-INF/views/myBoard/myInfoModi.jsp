<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>프로필 수정</title>
<style type="text/css">

*[role="form"] {
    max-width: 600px;
    padding: 15px;
    margin: 0 auto;
    background-color: #fff;
    border-radius: 0.3em;
}
#femaleRadio, #maleRadio{

}
#profile{
	border-radius: 50%;
	width:90px;
	height:90px;
}
#mage_preview{
display: inline-block;
}
</style>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
	$(document).ready(function() {
		$('#modibnt').click(function(e) {
			if ($.trim($("#uid").val()) == "") {
				alert("아이디를 입력하세요!");
				$("#uid").val("").focus();
				return false;
			}

			if ($("#upwd").val() != $("#upwdCheck").val()) {
				alert("비밀번호가 다릅니다.");
				$("#upwdCheck").val("").focus();
				return false;
			}
			if ($.trim($("#uname").val()) == "") {
				alert("이름을 입력하세요!");
				$("#uname").val("").focus();
				return false;
			}
			if ($.trim($("#uintro").val()) == "") {
				alert("자기소개를 입력하세요!");
				$("#uintro").val("").focus();
				return false;
			}
			if ($("#upwd").val() != $("#upwdCheck").val()) {
				alert("비밀번호가 다릅니다.");
				$("#upwdCheck").val("").focus();
				return false;
			}
			alert("정상적으로 수정되었습니다!");
			$('#modi').submit();
		});
	});
	</script>
</head>
<body>

<form:form modelAttribute="myinfolist" method="post" action="/app/myInfoModiOk" enctype="multipart/form-data" class="form-horizontal" role="form" id="modi">
                <div class="col-lg-12">
                    <hr>
                    <h2 class="intro-text text-center">수정
                        <strong>페이지</strong>
                    </h2>
                    <hr>
                </div>
                <div class="form-group">
                    <form:label path="user_id" for="uid" class="col-sm-3 control-label">아이디</form:label>
                    <div class="col-sm-9">
                        <form:input path="user_id" readonly="true" id="uid" class="form-control" />
                    </div>
                </div>
                <div class="form-group">
                	<form:label path="user_pwd" for="upwd" class="col-sm-3 control-label">비밀번호</form:label>
					<div class="col-sm-9">
						<form:password path="user_pwd" id="upwd" class="col-sm-3 control-label"/>
						<form:errors path="user_pwd"></form:errors>
					</div>
				</div>
				<div class="form-group">
					<form:label path="user_pwd2" for="upwdCheck" class="col-sm-3 control-label">비밀번호 확인</form:label>
					<div class="col-sm-9">
						<form:password path="user_pwd2" id="upwdCheck" class="col-sm-3 control-label"/>
					<form:errors path="user_pwd2" />
					</div>
					</div>
                <div class="form-group">
                    <form:label path="user_name" for="uname" class="col-sm-3 control-label">이름</form:label>
                    <div class="col-sm-9">
                        <form:input path="user_name" id="uname" class="form-control"/><form:errors path="user_name"/>
                    </div>
                </div>
                
                
                <%-- <form:label path="user_gen">성별</form:label>
			<form:radiobutton path="user_gen" value="남자" label="남자" />
			<form:radiobutton path="user_gen" value="여자" label="여자" />
			<form:errors path="user_gen" /><br> --%>
			
                <div class="form-group">
                    <form:label path="user_gen" class="control-label col-sm-3">성별</form:label>
                    <div class="col-sm-6">
                        <div class="row">
                            <div class="radio">
                                <label class="radio-inline">
                                    <form:radiobutton path="user_gen" id="femaleRadio" value="여자" />Female
                                </label>
                            </div>
                            <div class="radio">
                                <label class="radio-inline">
                                    <form:radiobutton path="user_gen"  id="maleRadio" value="남자" />Male
                                </label>
                                <form:errors path="user_gen" />
                            </div>
                        </div>
                    </div>
                </div> <!-- /.form-group -->
                <div class="form-group">
                    <form:label path="user_image" for="img" class="col-sm-3 control-label">이미지</form:label>
                    <div class="col-sm-9">
                        <input type="file" name="UImg" id="user_image" class="form-control" /><form:errors path="user_image"/>
                        <div id="image_preview">
						<img src="${myinfolist.user_image }" alt="default" id="profile" />
					</div>
                    </div>
                    
                </div>
                
                <div class="form-group">
                    <form:label path="user_intro" for="uintro" class="col-sm-3 control-label">소개</form:label>
                    <div class="col-sm-9">
                        <form:input path="user_intro" id="uintro" class="form-control" /><form:errors path="user_intro"/>
                    </div>
                </div>
                <br>
 	<div class="form-group">
                    <div class="col-sm-9 col-sm-offset-3">
                        <button type="submit" class="btn btn-primary btn-block" id="modibnt">수정</button>
                    </div>
                </div>
 </form:form>
 <!-- /.form-group -->
<!-- /form -->
 <!-- ./container -->
 <script type="text/javascript">
		$('#user_image').on('change', function() {
			ext = $(this).val().split('.').pop().toLowerCase(); //확장자
			//배열에 추출한 확장자가 존재하는지 체크
			if ($.inArray(ext, [ 'gif', 'png', 'jpg', 'jpeg' ]) == -1) {
				resetFormElement($(this)); //폼 초기화
				window.alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
			} else {
				file = $('#user_image').prop("files")[0];
				blobURL = window.URL.createObjectURL(file);
				$('#image_preview img').attr('src', blobURL);
				$('#image_preview').slideDown(); //업로드한 이미지 미리보기 
				//$(this).slideUp(); //파일 양식 감춤
			}
		});
		$('#image_preview a').bind('click', function() {
			resetFormElement($('#user_image')); //전달한 양식 초기화
			$('#user_image').slideDown(); //파일 양식 보여줌
			$(this).parent().slideUp(); //미리 보기 영역 감춤
			return false; //기본 이벤트 막음
		});
		function resetFormElement(e) {
			e.wrap('<form>').closest('form').get(0).reset();
			e.unwrap();
		}
	</script>
</body>
</html>