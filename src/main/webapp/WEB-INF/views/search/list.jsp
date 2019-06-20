<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
function detail(board_num)
{
	location.href="detail"+board_num;
}
</script>
</head>
<body>
	<div class="container" align="center">
		<br>
		<h3 align="left">Related Users</h3>
		<hr>
		<c:if test="${fn:length(data2)==0 }">
		관련 사용자가 없습니다.
		</c:if>
		<c:forEach var="index" items="${data2 }">
			<img src="${index.user_image }"
				style="width: 50px; height: 50px; border-radius: 50%">
			<a href="userdetail?id=${index.user_id }"><c:out
					value="${index.user_id }" /></a>
			<c:out value="${index.user_name }" />
			<br>

		</c:forEach>
		<hr>
		<br>
		<h3 align="left">Related Contents</h3>
		<hr>
		<c:if test="${fn:length(data)==0 }">
		관련 게시물이 없습니다.
		</c:if>
		<c:forEach var="boardindex" items="${data }">
			<c:if test="${boardindex.board_image != null }">
				<img onclick="detail('${boardindex.board_num}')"
					style="width: 600px; max-width: 100%; height: auto; cursor: pointer; margin: 25px auto;"
					class="img-responsive" src="${boardindex.board_image}" alt="post Image">
			</c:if>
			<c:if test="${boardindex.movielink != null}">
				<div onclick="detail('${boardindex.board_num}')" style="width: 650px;">
					<iframe src="https://www.youtube.com/embed/${boardindex.movielink }"
						frameborder="0"
						style="width: 600px; max-width: 100%; height: 460px;; margin: 25px auto;"></iframe>
				</div>
			</c:if>

			<img src="${boardindex.user_image }" alt="${boardindex.user_id }"
				style="height: 50px; width: 50px; border-radius: 50%;">
			<a href="userdetail?id=<c:out value="${boardindex.user_id }"/>">
				<c:out value="${boardindex.user_id }" />
			</a>
			<%-- <p><c:out value="${boardindex.board_content }" /></p> --%>
			<p>${boardindex.board_content }</p>
			

		</c:forEach>
		<hr>

	</div>
</body>
</html>