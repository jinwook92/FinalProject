<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style>
.pr {
	display: table-cell;
	text-align: left;
	vertical-align: top;
}

.loginform {
	display: table-cell;
	text-align: left;
	vertical-align: top;
	width: 450px;
	text-align: center;
}
.loginform input {
	margin-top: 8px;
}
.fileInput {
	position: relative;
	width: 100%;
	overflow: hidden;
}
.fileInputHidden {
	width: 100%;
	position: absolute;
	opacity: 0;
}
#profile {
	border-radius: 50%;
	width: 90px;
	height: 90px;
}
@import url(http://fonts.googleapis.com/earlyaccess/nanumpenscript.css);
#introduce{	
	font-family: 'Nanum Pen Script', serif;
	font-size:40px;
}
</style>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
   $(document).ready(function() {
      $('#joinbtn').click(function(e) {
         if ($.trim($("#uid").val()) == "") {
            alert("아이디를 입력하세요!");
            $("#uid").val("").focus();
            return false;
         }
         if ($.trim($("#upwd").val()) == "") {
            alert("비밀번호를 입력하세요!");
            $("#upwd").val("").focus();
            return false;
         }
         if ($.trim($("#upwdCheck").val()) == "") {
            alert("비밀번호확인을 입력하세요!");
            $("#upwdCheck").val("").focus();
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
         if ($.trim($("#umail").val()) == "") {
             alert("이메일을 입력하세요!");
             $("#umail").val("").focus();
             return false;
         }
         if ($.trim($("#uintro").val()) == "") {
            alert("자기소개를 입력하세요!");
            $("#uintro").val("").focus();
            return false;
         }
         if(ok==0){
        	 alert("다른 아이디를 입력하세요.");
        	 $("#uid").val("").focus();
             return false;
         }
         alert("Welcome to MarcheLine!");
         $('#join').submit();
      });
	  var ok=0;
      $("#dupliID").click(function() {
         $.ajax({
            url : "./dupliID/" + $("#uid").val(),
            type : "post",
            dataType : "text",
            success : function(data) {
               if (data == "") {
                  alert('해당 ID를 사용하셔도 됩니다.');
                  $('#idok').attr('src', 'resources/images/success.png');
                  ok=1;
               } else {
                  alert('해당 ID는 존재합니다.');
                  $('#idok').attr('src', 'resources/images/fail.png');
               }
            },
            error : function(error) {
               console.log(error);
               alert(error.statusText);
            }
         });
         return false;
      });
   });
</script>
</head>
<body>
<div align="center">
	<div class="loginform" id="introduce" style="display:inline-block;margin-top:10%;">
		<span>Marcheline을 통해 대한민국에 있는<br> 모든 사람과 함께 이야기를 나누세요.</span>
		<img src="resources/images/worldwide.png" alt="worldwide" style="width:300px;margin-top:50px; ">
	</div>
	<div align="center" class="loginform" style="display:inline-block">
		<form:form commandName="userVO" method="post" action="loginOK">
			<fieldset style="margin: 50px 10px;">
				<legend>로그인</legend>
				<form:input path="user_id"
					cssStyle="width:240px; margin-bottom:7px;" placeholder="아이디" />
				<form:errors path="user_id" />
				<br>
				<form:password path="user_pwd" cssStyle="width:240px"
					placeholder="패스워드" />
				<!-- <img src="resources/images/pwd2.png" alt="pwd"> -->
				<form:errors path="user_pwd" />
				<hr>
				<input class="submit-btn" type="submit" value="로그인">
			</fieldset>
		</form:form>
		<a href="/app/findPwd" style="display: inline-block;"><button
				class="btn btn-default">아이디찾기</button></a> <a href="/app/findPwd"
			style="display: inline-block;"><button class="btn btn-default">비밀번호찾기</button></a>


		<form:form commandName="userVO" method="post" action="joinOK"
			id="join" enctype="multipart/form-data">
			<fieldset style="margin: 50px 10px;">
				<legend>회원가입</legend>
				<div class="pr" align="center">
					<form:label path="user_image"
						cssStyle="cursor:pointer;width:120px;">Select Photo
               <img alt="searchImg" src="resources/images/photos.png"
							style="cursor: pointer;">
					</form:label>
					<div class="fileInput">
						<input type="file" name="UImg" id="user_image"
							class="fileInputHidden">
						<form:errors path="user_image" />
					</div>
					<div id="image_preview" align="center">
						<img src="resources/images/user.png" alt="default" id="profile" />
					</div>
				</div>
				<div class="pr" align="center">
					<form:input path="user_id" id="uid" cssStyle="width:260px;"
						placeholder="아이디" />
					<form:errors path="user_id" />
					<a id="dupliID" style="cursor: pointer;"><img alt="checkid"
						id="idok" src="resources/images/check.png"></a> <br>
					<form:password path="user_pwd" id="upwd" cssStyle="width:260px"
						placeholder="패스워드" />
					<img src="resources/images/pwd1.png" alt="pwd">
					<form:errors path="user_pwd" />
					<br>
					<form:password path="user_pwd2" id="upwdCheck"
						cssStyle="width:260px" placeholder="패스워드" />
					<img src="resources/images/pwd2.png" alt="pwdcheck">
					<form:errors path="user_pwd2" />
					<br>
					<form:input path="user_name" id="uname" cssStyle="width:260px"
						placeholder="이름" />
					<form:errors path="user_name" />
					<br>
					<form:radiobutton path="user_gen" value="남자" label="남자"
						checked="checked" cssStyle="width:90px;" />
					<form:radiobutton path="user_gen" value="여자" label="여자"
						cssStyle="width:90px;" />
					<form:errors path="user_gen" />
					<br>
					<form:input path="mail1" id="umail" cssStyle="width:135px"
						placeholder="이메일" />
					@
					<form:select path="mail2">
						<option>naver.com</option>
						<option>hanmail.net</option>
						<option>gmail.com</option>
						<option>nate.com</option>
					</form:select>
					<form:input path="user_intro" id="uintro" cssStyle="width:260px"
						placeholder="자기소개" />
					<form:errors path="user_intro" />
					<br>
				</div>

				<hr>
				<input class="submit-btn" type="submit" value="가입하기" id="joinbtn">
			</fieldset>
		</form:form>
		<br> <br>
	</div>
</div>
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
            $(this).slideUp(); //파일 양식 감춤
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