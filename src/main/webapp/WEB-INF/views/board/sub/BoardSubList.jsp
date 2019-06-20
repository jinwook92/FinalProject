<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script>
	function subdeldata(reply_num, board_num) {
		var msg = confirm("정말 삭제하시겠습니까?");
		if (msg == true) { // 확인을 누를경우
			location.href = "subdelete/" + reply_num + "&" + board_num;
		} else {
			return false; // 삭제취소
		}

	}
</script>
</head>
<body>
		<c:forEach var="data" items="${list }">
			<input type="hidden" value="${data.reply_num }">
			<img style="width: 30px; height: 30px; border-radius: 50%;"
				src="${data.user_image }" alt="Author Image">
			<a href="userdetail?id=${data.user_id }"><c:out value="${data.user_id}" /></a>
			<c:out value="${data.reply_content}" />
			<c:if test="${data.user_id==sessionScope.session_id }">
				<img
					onclick='subdeldata("${data.reply_num}","${data.board_num }")'
					style="width: 10px; cursor: pointer;"
					src="resources/images/delete.png" alt="post Image">
			</c:if>
			<br>
		</c:forEach>
</body>
</html>




