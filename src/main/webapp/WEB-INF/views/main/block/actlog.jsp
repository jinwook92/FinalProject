<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
</script>

</head>
<body>

	<div >
	<div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                    <h4 class="modal-title" id="myModalLabel">Actlog for ${sessionScope.session_id }</h4>
                    </div>
                <div class="modal-body" style="overflow-y:scroll;  height:300px;">
                    
                    <c:forEach var="data" items="${actlist }">
                    <img src="${data.act_image }" style="width:30px; height:30px; border-radius:50%;">
                    <c:out value="${data.act_id }"/>님이 회원님<c:out value="${data.actlog_content }"/>
                    
                    <c:if test="${data.actlog_minute lt 60}">
                    <c:out value="${data.actlog_minute }"/>분 전<br>
                    </c:if>
                    <c:if test="${data.actlog_minute gt 60 && data.actlog_minute lt 1440 }">
                    <fmt:parseNumber var="hour" integerOnly="true" value="${data.actlog_minute/60 }"/>
                    <c:out value="${hour}" />시간 전<br>
                    
                  	</c:if>
                  	<c:if test="${data.actlog_minute gt 1440 }">
                    <fmt:parseNumber var="day" integerOnly="true" value="${data.actlog_minute/1440 }"/>
                    <c:out value="${day}" />일 전<br>
                  	</c:if>
                  	<hr style="border: dotted 1px #e9e9e9;">
                    </c:forEach>
                    
                    
                    <p class="text-left"><strong></strong><br>
                        </p>
                    <br>
                    
                </div>
                <div class="modal-footer">

			<button class="btn btn-sm btn-danger pull-right" data-dismiss="modal"
				id="btnClose">
				<i class="ace-icon fa fa-times"></i>닫기
			</button>

		</div>
                </div>
</body>
</html>