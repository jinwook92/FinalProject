<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<div style="width:700px; margin:0 auto;" align="center">
	<form:form modelAttribute="data" method="post" action="/app/modifyok">
		<input type="hidden" value="${data.board_num }" name="board_num">
		<c:if test="${data.board_image != null }">
				<img onclick="detail('${data.board_num}')"
					style="width: 600px; height: auto; margin: 25px auto;"
					class="img-responsive" src="${data.board_image}" alt="post Image">
			</c:if>
			<c:if test="${data.movielink != null}">
				<iframe src="https://www.youtube.com/embed/${data.movielink }"
					frameborder="0"	style="width: 600px; max-width: 100%; height: 460px; margin: 25px auto;"></iframe>
			</c:if>
			<br>
		<form:label path="board_content">내용</form:label>
		<form:textarea path="board_content" cols="20" rows="4"/>
		<br>
		<button name="submit" class="submit-btn" type="submit" id="submit">
				<span class="ti-shift-right"></span>확인
			</button>
	</form:form>
	</div>
</body>
</html>