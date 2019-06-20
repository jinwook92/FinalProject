<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style type="text/css">
body {
    background-color: #eee;
}

*[role="form"] {
    max-width: 600px;
    padding: 15px;
    margin: 0 auto;
    background-color: #fff;
    border-radius: 0.3em;
}
.container{
padding-bottom: 20px;
}
#delbnt{
 
}
</style>
<script>
		// 비밀번호 미입력시 경고창
		function checkValue(){
			if(!document.deleteform.userpwd.value){
				alert("비밀번호를 입력하지 않았습니다.");
				return false;
			}
			else{
				var msg = confirm("정말 삭제하시겠습니까?");

		      if (msg == true) { // 확인을 누를경우
		    	  alert("Bye Bye~");
		         location.href = "/app/myInfoDelOk";
		      } else {
		         return false; // 삭제취소
		      }
			}
		}
	</script>
	</head>
<body>
		<div class="container">
		<form name="deleteform" method="post" action="/app/myInfoDelOk"
			onsubmit="return checkValue()" role="form">
		<div class="col-lg-12">
                    <hr>
                    <h2 class="intro-text text-center">회원탈퇴
                        <strong>페이지</strong>
                    </h2>
                    <hr>
                </div>
		<div class="form-group">
					<label for="upwd" class="col-sm-3 control-label">비밀번호</label>
					<div class="col-sm-9">
					<input type="password" name="userpwd" id="upwd" class="form-control"/>
					</div>
					</div>
					<br>
					<br>
		<div class="form-group">	
		<div class="col-sm-9 col-sm-offset-3">
			
			<button type="submit" class="btn btn-primary btn-block" id="delbnt">탈퇴</button>
		</div>
		</div>
		</form>
		</div>
</body>
</html>