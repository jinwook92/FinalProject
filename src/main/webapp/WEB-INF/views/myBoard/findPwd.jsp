<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style type="text/css">
*[role="form"] {
    max-width: 600px;
    padding: 15px;
    margin: 0 auto;
    background-color: #fff;
    border-radius: 0.3em;
}


</style>
<script>


</script>
</head>
<body>


<form action="/app/sendMail" role="form" id="findForm" method="post">
    <fieldset>
        <legend class="screen_out" style="text-align: center;">비밀번호 찾기</legend>
        <div class="box email">
			<label for="user_id">아이디</label>
            <input type="text" id="user_id" name="uid" autofocus autocomplete="off" required />
            <label for="user_email">이메일</label>
            <input type="text" id="user_email" name="uemail" autofocus autocomplete="off" required />
        </div>
<br>
        <!-- // .box.email -->
        <center>
        <div class="box btn" >

            <button type="submit" class="btn join" id="sendbnt" >

                <i class="fa fa-envelope"></i>

                이메일 전송

            </button>

        </div>
</center>
        <!-- // .box.btn -->

    </fieldset>

</form>
<center>
<c:set var="resultmsg" value="${requestScope.resultMsg}"/>
		<c:if test="${resultmsg!=null}">	
			<c:choose>
				<c:when test="${resultmsg==0}">
					<font id='fail1' color='red' size='2'>! 입력하신 이메일의 회원정보와 가입된 아이디가 일치하지 않습니다.</font>
				</c:when>
				<c:when test="${resultmsg==1}">
					<font id="fail2" color='red' size='2'>! 귀하의 이메일로 가입된 아이디가 존재하지 않습니다.</font>
				</c:when>
			</c:choose>
		</c:if>
</center>
<br>
</body>
</html>