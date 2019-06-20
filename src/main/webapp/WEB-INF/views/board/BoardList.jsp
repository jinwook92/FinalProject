<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style type="text/css">
#bcontent{
 margin-top: -30px;
}
body{
	background-image: ;
}
</style>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>


$(document).ready(function(){
	 var a = document.getElementsByClassName('entry-title');
	   for(var i  = 0 ; i < a.length;i++){
	      var c = a[i].innerHTML.split(' ');   
	      var cc = c[0];
	      var aa = '';
	      
	       for(var j=0; j<c.length; j++) 
	       {       
	             if(c[j].indexOf('#') ==0)
	             {
	               var d = c[j].substring(1);
	                aa += '<a href="search?s='+d+'">'+c[j]+'</a>';
	                
	             }  
	       }
	   if(cc.indexOf('#')==0){$(a[i]).html(aa)};
	   }
	
	
});

function detail(board_num)
{
	location.href="detail"+board_num;
}
/* function like(board_num,user_id)
{
	location.href="like/"+board_num+"/"+user_id;	
} */
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

function textareaHeightOnload()
{
// var textarea = document.forms[0].elements['memo'];
 var textarea = document.getElementsByTagName("textarea");

for(var i = 0; i < textarea.length; i++)
 {
  var newHeight = textarea[i].scrollHeight;

 if(newHeight <= 100)
   newHeight = 100;

 textarea[i].style.height = newHeight + 5;
 }
}




</script>
</head>




<body>
<c:if test="${fn:length(list)==0 }">
<div style="margin:10 auto; text-align:center; width:680px; height:300px;" id="main-content">
<a href="insert"><img style="width:200px; height:auto; opacity:0.5; margin:0 auto;" src="resources/images/picture.png" alt="post Image"></a>
<p>사진이나 동영상을 입력하세요</p>
</div>
</c:if>
<c:forEach var="list" items="${list}" varStatus="status">
                  
		<c:if test="${status.count==3 || status.count==6}">
			<div style="margin:0 auto; text-align:center; width:680px;" id="main-content" class="blog-post-singgle-page thumbnail" >
	        <div class="container" style="background-color:white;width:615px;">
	          <div class="row">
	            <div class="col-sm">		
					<div class="post-meta">					
					     <p class="text-left" style="font-size: 17px;"><strong>Recommend Friends </strong><br>
					     <ul>
					     <c:forEach var="index" items="${frlist}" step="1" begin="0" end="4">
					   		<li style="width:110px;/* margin-right: 20px; */">
					   		<img src="${index.user_image }" style="width:35px;height:35px;border-radius:50%;">
							 <a href="userdetail?id=${index.user_id}"><strong><span style="font-size: 15px;">${index.user_id}</span></strong></a>
							 </li>
						</c:forEach>
						</ul>
					</div>
				</div></div></div></div>
		</c:if>

<div style="margin:10 auto; text-align:center; width:680px;" id="main-content" class="main-content blog-post-singgle-page thumbnail" >
 
        <div class="container" style="background-color:white;width:615px;">
          <div class="row">
            <div class="col-sm">
              <div id="blog-post-content" class="blog-post-content">
                <article class="post type-post">
                  <div class="post-top ">
                    <c:if test="${list.board_image != null }">
                     <img style="width:600px; height:auto; margin:0 auto;" class="img-responsive" 
                     src="${list.board_image}" alt="post Image">
                    </c:if>
                    <c:if test="${list.movielink != null}">
                     <div style="width:600px; margin:0 auto; text-align:center;">     
                    <iframe src="https://www.youtube.com/embed/${list.movielink }" frameborder="0" style="width:600px; max-width:100%; height:460px; " ></iframe>
                    </div>
                    </c:if>
                    <div class="post-meta" align="center">
                      <div class="entry-meta">
                        <div>
                          <img style="width:40px; height:40px; border-radius:50%; margin:0 auto;" src="${list.user_image }" alt="Author Image">
							&nbsp;&nbsp;
                       		<span class="author-name">
                            <a href="userdetail?id=${list.user_id }"><strong>${list.user_id }</strong></a>&nbsp;
                          	</span>
                       		&nbsp; 
                          <span class="entry-date">
                            <time datetime="2015-01-15">${list.board_date }</time>&nbsp;
                          </span>
                          <span> &nbsp;<img onclick="detail('${list.board_num}')" style="cursor:pointer" width="35px" height="35px" src="resources/images/comment/KakaoTalk_20170424_173126186.png" alt="comment Image">&nbsp;${list.board_repcount}&nbsp;</span>
                          	&nbsp;
                          <c:if test="${list.like_on ==0 }">
                          	<img class="addlike" name="${list.board_num}" style="cursor:pointer" width="30px" height="30px" src="resources/images/noheart.png">
                          </c:if> 
                          <c:if test="${list.like_on ==1 }">
                          	<img class="addlike" name="${list.board_num}" style="cursor:pointer" width="30px" height="30px" src="resources/images/heart.png">
                          </c:if>                           
                          <label>${list.like_count}</label>
                           <c:if test="${list.loc !=null }">
                          <br><a style="align:center;" target="_blank" href="https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query=${list.loc}"><img src="resources/images/placeholder.png" style="display:inline-block;"> ${list.loc }</a>
                         </c:if>
                      
                       <div class="post-content" style=" width: 500px;" id="bcontent" align="left">

                   <p style="font-size: 16px; color: black;">${list.board_content_tag}</p>
            

                  </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  
                </article>
              </div>
            </div>
            </div>
            </div>
          </div><br>  
</c:forEach>
</body>
</html>