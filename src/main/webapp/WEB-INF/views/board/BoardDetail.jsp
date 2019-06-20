<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style>
</style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script> 
   jQuery.noConflict();
   var num = ${data.board_num};
   jQuery(document).ready(function($) {
      $.ajax({
         url : "/app/replylist/" + num,
         dataType : "html",
         success : function(e) {
            $('#result').html(e);
         },
         error : function(e) {
            console.log("error" + e);
         }
      });
   	  $('#btn').click(function(e) {
   			if ($.trim($("#content").val()) == "") {
   				alert("댓글을 입력하세요!");
   				$("#content").val("").focus();
   				return false;
   			}
    		
    		
    	});
      

      $("#repform").on("submit", function(event) {

         event.preventDefault();
         var senddata = $(this).serialize();
         console.log(senddata);
          console.log('tttt  success');
         $.ajax({
            url : "/app/reply/" + num,
            data : senddata,
            dataType : "html",
            success : function(e) {
               $.ajax({
                  url : "/app/replylist/" + num,
                  dataType : "html",
                  success : function(e) {
                     $('#result').html(e);
                  },
                  error : function(e) {
                     console.log("error" + e);
                  }
               });
               $('#content').val("");
            },
            error : function(e) {
               console.log("error" + e);
            }
         });
      });         
   });

   jQuery.noConflict();
   jQuery(document).ready(function() {
      var id='${sessionScope.session_id}';   
      //var boardnum=$('#boardnum').val();
      $('.addlike').click(function() {   
         var boardnum=$(this).prop('name');
         var loc=$(this);
         jQuery.ajax({
            url : "./like/" + id+"/"+boardnum,
            type : "post",
            dataType : "text",
            success : function(data) {
                  console.log(data);
                  var result=data;
                  var dup=result.split(',');      
                  if(dup[0]==0){
                     loc.attr('src', 'resources/images/heart.png');
                     loc.next().text(dup[1]);                  
                  }else if(dup[0]==1){
                     loc.next().text(dup[1]);
                     loc.attr('src', 'resources/images/noheart.png');
                  }
            },
            error : function(error) {
               console.log(error);
               alert(error.statusText);
            }
         });
      });
   });
   
   function deldata(board_num) {
	      var msg = confirm("정말 삭제하시겠습니까?");
	      if (msg == true) { // 확인을 누를경우
	         location.href = "delete/board_num=" + board_num;
	      } else {
	         return false; // 삭제취소
	      }

	   }
	   function modidata(board_num) {
	      var msg = confirm("정말 수정하시겠습니까?");
	      if (msg == true) { // 확인을 누를경우
	         location.href = "modify" + board_num;
	      } else {
	         return false; // 삭제취소
	      }

	   }
</script>

</head>
<body>

   <div style="margin:0 auto; width:650px;background-color:white;">      
      <c:if test="${data.board_image != null }">
                    <img onclick="detail('${data.board_num}')" style="width:600px; max-width:100%; height:auto; cursor:pointer; margin:25px auto;" class="img-responsive"  src="${data.board_image}" alt="post Image">
                       </c:if>
                       <c:if test="${data.movielink != null}">
                    <iframe src="https://www.youtube.com/embed/${data.movielink }" frameborder="0" style="width:600px; max-width:100%; height:460px; margin:25px 25px;"  ></iframe>
                    </c:if>
                    <br>
      <input type="hidden" value="${data.board_num }">

      <%-- <c:out value="${data.board_num }" /><br> —--%>

      <span style="position:absolute; left:39%;" >
      <img style="width: 50px; height: 50px; border-radius: 50%;" src="${data.user_image }" alt="Author Image">
      <a href="userdetail?id=${data.user_id }"><c:out value="${data.user_id }" /></a>&nbsp;
        <c:if test="${data.like_on ==0 }">
                 <img class="addlike" name="${data.board_num}" style="cursor:pointer" width="30px" height="30px" src="resources/images/noheart.png">
        </c:if> 
        <c:if test="${data.like_on ==1 }">
                  <img class="addlike" name="${data.board_num}" style="cursor:pointer" width="30px" height="30px" src="resources/images/heart.png">
        </c:if>                           
               <label>${data.like_count}</label>&nbsp;&nbsp;&nbsp;&nbsp;
         <c:if test="${sessionScope.session_id == data.user_id }">
         <button onclick='deldata("${data.board_num}")' class="submit-btn bleft">
            <span class="ti-shift-right"></span>Delete
         </button>
         <button onclick='modidata("${data.board_num}")' class="submit-btn bleft">
            <span class="ti-shift-right"></span>modify
         </button>
      </c:if></span>
               <br><br>

      <div style="margin:10px; text-align:center; font-size:20px;"><p>${data.board_content_tag}</p><br></span></div>
		<div style="margin-left:40px;">

      <form action="/app/reply/${data.board_num}" method="post" id="repform">
         <input type="hidden" name="repid" value="${sessionScope.session_id }">
         <input type="text" name="content" size="600" maxlength="30"
            id="content" style="width: 400px;"> &nbsp;&nbsp;
            <input type="submit" value="댓글달기" id="btn" class="submit-btn" style="width: 100px;">
      </form>
		</div>
      <div id="result" style="margin-left:45px;"></div>
   </div><br>

</body>
</html>