<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table>
	<thead>
		<tr>
			<th><h3>팔로우</h3></th>
		</tr>
	</thead>
	<tbody >
		<tr>
				<td>
				<c:forEach var="data" items="${getfollowdata}">
				<img src="${data.user_image}" alt="user_image" style="width: 50px; height: 50px; border-radius: 50%;">
				<a href="userdetail?id=<c:out value="${data.user_id}"/>"><c:out value="${data.user_id}"/></a>
				<br>
				</c:forEach>
				</td>
		</tr>
	</tbody>
</table>
<button class="btn btn-sm btn-danger pull-right" data-dismiss="modal"
	id="btnClose">
	<i class="ace-icon fa fa-times"></i>닫기
</button>
<br>
<br>