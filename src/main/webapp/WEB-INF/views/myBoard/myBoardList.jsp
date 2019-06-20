<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>내 사진첩</title>
<script>

function detail(board_num)
{
   console.log(board_num);
   location.href="detail"+board_num;
}

</script>
    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/thumbnail-gallery.css" rel="stylesheet">

    <style>

    </style>
</head>

<body>

    <!-- Page Content -->
    <div class="container">
        <div class="row">
            <div class="col-lg-12"> 
     <!-- 프로필 -->       
      <div class="span3 well">
        <center>

        <a href="#aboutModal" data-toggle="modal" data-target="#myModal"><img src="${myinfolist.user_image }" name="aboutme" 
         class="img-circle" style="width: 200px; height: 200px; border-radius: 50%;"></a>
        <h3>${myinfolist.user_id }</h3>
        <em>click my face for more</em>
      </center>
      </div>

    <!-- Modal -->
    
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                    <h4 class="modal-title" id="myModalLabel">More About ${myinfolist.user_id }</h4>
                    </div>
                <div class="modal-body">
                    <center>

                    <img src="${myinfolist.user_image }" name="aboutme"  border="0" class="img-circle" style="width: 180px; height: 180px; border-radius: 50%;"></a>
                    <h3 class="media-heading">${myinfolist.user_id } <small>${myinfolist.user_name }</small>
                  <%-- <c:set var="gen" value="${myinfolist.user_gen }"></c:set> --%>
           
                    <c:if test="${myinfolist.user_gen == '남자' }"><img src="resources/images/man.png" alt="gender" style="width: 15px; height: 15px;"></c:if>
                    <c:if test="${myinfolist.user_gen == '여자' }"><img src="resources/images/woman.png" alt="gender" style="width: 15px; height: 15px;"></c:if>
                 </h3>
                    <h2 class="media-heading">팔로워 :<a href = "follower?id=<c:out value="${myinfolist.user_id }"/>" data-toggle="modal" data-target="#modal-testNew"><c:out value="${follower }"></c:out></a>명
                         팔로우 :<a href = "follow?id=<c:out value="${myinfolist.user_id }"/>" data-toggle="modal" data-target="#modal-testNew2"><c:out value="${follow }"></c:out></a>명<br></h2>
                    <!-- <span><strong>Interests: </strong></span>
                        <span class="label label-warning">HTML5/CSS</span>
                        <span class="label label-info">Adobe CS 5.5</span>
                        <span class="label label-info">Microsoft Office</span>
                        <span class="label label-success">Windows XP, Vista, 7</span> -->
                    </center>
                    <hr>
                    <center>
                    <p class="text-left"><strong>Introduce: </strong><br>
                        ${myinfolist.user_intro }</p>
                    <br> 
                    </center>
                    <div>
                       <p class="text-left"><strong>Recommend Friends : </strong><br>
		               <c:forEach var="index" items="${frlist}" step="1" begin="0" end="4">
		               		<img src="${index.user_image }" style="width:25px;height:25px;border-radius:50%;">
							 <a href="userdetail?id=${index.user_id }"><c:out value="${index.user_id}"></c:out></a>
							 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</c:forEach>
					</div>
                </div>	
                <div class="modal-footer">
                    <center>
                     <a href="/app/myInfoModi"><button class="btn btn-default">프로필 편집</button></a>
                     <a href="/app/myInfoDel"><button class="btn btn-default">회원탈퇴</button></a>
                    <button type="button" class="btn btn-default" data-dismiss="modal">I've heard enough about ${myinfolist.user_id }</button>
                    </center>
                </div>
            </div>
        </div>
    </div>

            
            <%-- <div class="_8gpiy _r43r5">
            <button class="_jzgri" title="프로필 사진 바꾸기">
            <img alt="프로필 사진 바꾸기" class="_g5pg0" src="${myinfolist.user_image }"></button>
            </div>   
            <div id="profile">             
            사용자 아이디 :<c:out value="${myinfolist.user_id }"/><br>
            사용자 이름 :<c:out value="${myinfolist.user_name }"/><br>
            사용자 성별 :<c:out value="${myinfolist.user_gen }"/><br> 
            사용자 소개 :<c:out value="${myinfolist.user_intro }"/><br>
            팔로워 :<a href = "follower?id=<c:out value="${myinfolist.user_id }"/>" data-toggle="modal" data-target="#modal-testNew"><c:out value="${follower }"></c:out></a>명
            팔로우 :<a href = "follow?id=<c:out value="${myinfolist.user_id }"/>" data-toggle="modal" data-target="#modal-testNew2"><c:out value="${follow }"></c:out></a>명<br>
            <a href="/app/myInfoModi"><button id="modibnt">프로필 편집</button></a>
            </div> --%>
            </div>
            
<div id="modal-testNew" class="modal fade" tabindex="50" role="dialog" aria-labelledby="테스트정보 등록" aria-describedby="테스트 모달">
    <div class="modal-dialog" style="width:500px;height:700px">
        <div class="modal-content">
        </div>
    </div>
</div>
<div id="modal-testNew2" class="modal fade" tabindex="50" role="dialog" aria-labelledby="테스트정보 등록" aria-describedby="테스트 모달">
    <div class="modal-dialog" style="width:500px;height:700px">
        <div class="modal-content">
        </div>
    </div>
</div>
         <c:forEach var="index" items="${myboardlist }">
            <div class="col-lg-3 col-md-4 col-xs-6 thumb">
            <div onclick="detail('${index.board_num}')" style="position:relative; padding-top:100%; overflow:hidden; margin:10px 0;">
                <div style="position: absolute; top: 0; left: 0; right: 0; bottom: 0;  
                -webkit-transform: translate(50%,50%); -ms-transform: translate(50%,50%); transform: translate(50%,50%);">
                
                      <c:if test="${index.board_image != null }">
                    <img style="position:absolute; top:0; left:0;max-width:100%;  height:auto; cursor:pointer; -webkit-transform: translate(-50%,-50%); -ms-transform: translate(-50%,-50%); transform: translate(-50%,-50%);" class="img-responsive"  src="${index.board_image}" alt="post Image">
                       </c:if>
                       <c:if test="${index.movielink != null}">
                    <iframe src="https://www.youtube.com/embed/${index.movielink }" frameborder="0" style="position:absolute; top:0; left:0; max-width:100%; height:auto; -webkit-transform: translate(-50%,-50%); -ms-transform: translate(-50%,-50%); transform: translate(-50%,-50%)"></iframe>
                    </c:if>
                </div>
                </div>
               </div>
         </c:forEach>
        </div>
        <hr>
</div>
</body>


</html>