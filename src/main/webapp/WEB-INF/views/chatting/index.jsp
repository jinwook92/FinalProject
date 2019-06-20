<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    
<!DOCTYPE html>
<html >
<head>
<meta charset="utf-8" />
<!-- <meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<meta name="description" content="" />
<meta name="author" content="" />
 -->
<!--[if IE]>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <![endif]-->
<title>BOOTSTRAP CHAT EXAMPLE</title>
<!-- BOOTSTRAP CORE STYLE CSS -->
  <link href="resources/assets2/css/bootstrap.css" rel="stylesheet" />

 <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>



<!-- <script type="text/javascript" src="/SocketTest/resources/assets/js/sockjs-1.0.3.min.js"></script>  -->
<!--서버용 :  이것은 폴더 확인해서 직접 잡아 주어야한다. -->


<script type="text/javascript" src="resources/assets2/js/sockjs-1.0.3.min.js"></script> 


<script>
var userId = '<c:out value="${myinfolist.user_id }"/>';
var withId = '<c:out value="${friendvo.user_id }"/>';

var userImage = '${myinfolist.user_image }';
var withImage = '${friendvo.user_image }';
jQuery.noConflict();
var id = '${sessionScope.id}';


$(document)
		.ready(

				function() {
					
					
					var Test1 = $('#inputText').val();

					
					//console.log(sock);

					
					var user_id = '0';
					var check;
					/* sock.onmessage = function(evt) {
						var Now = new Date();
						var NowTime = Now.getFullYear();

						NowTime += '-' + Now.getMonth() + 1;

						NowTime += '-' + Now.getDate();

						NowTime += ' ' + Now.getHours();

						NowTime += '시' + Now.getMinutes();

						NowTime += '분' + Now.getSeconds();

						NowTime += '초';
						
						var data = evt.data.split(",");
						if (user_id == '0') {
							user_id = data[1];
						} else {

						}

						if (data[1] == user_id) {
							check = 1;
						} else {
							check = 0;
						}
						var ddd = data[0];
						console.log(data[0]);
						//console.log(data[1]);

						if (check == 0) {
							$("#chatMessage")
									.append(
											 " <li class='media' id='append'><div class='media-body'><div class='media'><a class='pull-left' href='#'><img src='"+withImage+"' alt='user_image' style='width: 60px; height: 60px; border-radius: 50%;'> </a><div class='media-body' >"
											  
													+ data[0]
													+ "<br /><small class='text-muted'>"
													+ withId
													+ "|"
													+ NowTime
													+ "</small><hr/></div></div></div></li> ");

						}
						if (check == 1) {
							$("#chatMessage")
									.append(
											"  <li class='media' id='append'><div class='media-body'><div class='media'><a class='pull-left' href='#'><img src='"+userImage+"' alt='user_image' style='width: 60px; height: 60px; border-radius: 50%;'> </a><div class='media-body' >"
													+ data[0]
													+ "<br /><small class='text-muted'>"
													+ userId
													+ "|"
													+ NowTime
													+ "</small><hr/></div></div></div></li> ");

						}

						$("#chatMessage").scrollTop(
								$("#chatMessage")[0].scrollHeight);

						$.ajax({

							url : "./InsertDB/" + userId + "/" + withId
									+ "/" + ddd,
							//data : data[0] ,

							dataType : "text",
							success : function(data) {
								console.log(data);

							},
							error : function(e) {
								console.log(e);
							}
						});

					}
					sock.onclose = function() {
						sock.send("10.225.152.165 퇴장");
						$('#chatMessage').append("퇴장하셨습니다." + "<br/>");
					} */

					/* $("#sendMessage").click(function() {

						if ($('#inputText').val() != "") {

							//sock.send($('#inputText').val());
							
							$("#inputText").val("");

						}

					});
 */
					$('#sendMessage').click(
							function() {
								//alert("dd");
								var messages = $('#inputText').val();
								//console.log(Test1);
								var str = $("#inputText").html();
								var regex = /<br\s*[\/]?>/gi;
								var Test2 = $("#inputText").html(
										str.replace(regex, "\n"));

								var Now = new Date();

								var NowTime = Now.getFullYear();

								NowTime += '-' + (Now.getMonth()+1);

								NowTime += '-' + Now.getDate();

								NowTime += ' ' + Now.getHours();

								NowTime += ':' + Now.getMinutes();

								NowTime += ':' + Now.getSeconds();

								/* console.log(Test1);
								console.log(Now); */
								$("#chatMessage")
								.append(
										"  <li class='media' id='append'><div class='media-body'><div class='media'><a class='pull-left' href='#'><img src='"+userImage+"' alt='user_image' style='width: 60px; height: 60px; border-radius: 50%;'> </a><div class='media-body' >"
												+ messages
												+ "<br /><small class='text-muted'>"
												+ userId
												+ "|"
												+ NowTime
												+ "</small><hr/></div></div></div></li> ");

								$("#chatMessage").scrollTop(
										$("#chatMessage")[0].scrollHeight);

								$("#inputText").prop("value", "");
								//alert("userId:" + userId + ", withId:"+ withId);
								
								var Text1 = $('#inputText').val();
								console.log(messages);
								$.ajax({

									url : "./simsimi/"/* +messages */ ,
									data : "messages="+messages,
									type : "post",
									dataType : "json",
									success : function(data) {
										console.log("데이타:"+data.response);
										$("#chatMessage")
										.append(
												"  <li class='media' id='append'><div class='media-body'><div class='media'><a class='pull-left' href='#'><img src='resources/images/simsimi.png' alt='user_image' style='width: 60px; height: 60px; border-radius: 50%;'> </a><div class='media-body' >"
														+ data.response
														+ "<br /><small class='text-muted'>"
														+ "심심이"
														+ "|"
														+ NowTime
														+ "</small><hr/></div></div></div></li> ");
										$("#chatMessage").scrollTop(
												$("#chatMessage")[0].scrollHeight);

									},
									error : function(e) {
										console.log("에러:"+e);
									}
								});

							});
					$("#inputText").keyup(function(key) {

						if (key.keyCode == 13 && !key.shiftKey) {

							// alert("enterê° ëë¬ì¡ìµëë¤.");
							//alert($('#inputText').val());
							$('#sendMessage').trigger("click");

						}

						// Enter was pressed without shift key
						if (key.keyCode == 13 && key.shiftKey) {

							// prevent default behavior

							// $("input[name=inputText]").append("\n");

						}

					});

				});
				function Simsimi(){
					location.href="Simsimi";
				}
</script>
<style type="text/css">

._g5pg0 {
	display:block;
    height: 100%;
    left: 0;
    position: absolute;
    top: 0;
    width: 100%;
}

</style>
</head>
<body style="font-family: Verdana">

	<%-- <c:forEach items="${UserList }" var="index">
	${index }
		</c:forEach>
	 --%>
	<hr>
	<%-- <c:forEach items="${mydualfollower}" var ="data">
	
				<img src="${data.user_image}" alt="user_image" style="width: 50px; height: 50px; border-radius: 50%;">
				<a href="userdetail?id=<c:out value="${data.user_id}"/>"><c:out value="${data.user_id}"/></a>
				<br>
				</c:forEach>
	 --%>
	<div class="container">
		<div class="row " style="padding-top: 40px;">
			<h3 class="text-center"><c:out value="${myinfolist.user_id }"/>채팅방</h3>
			<br />
			<br />
			<div class="col-md-8">
				<div class="panel panel-info">
					<div class="panel-heading">심심이와 대화해요</div>
					<div class="panel-body" id="chatMessage"
						style="overflow: scroll; height: 500px; padding: 10px;">
						<ul class="media-list">

						

							
							
						</ul>
					</div>
					<div class="panel-footer">
						<div class="input-group">
							<!--<input type="text" class="form-control" placeholder="Enter Message" name="inputText" style="overflow:scroll;   padding:10px; "/>-->
							
							<textarea id="inputText" class="form-control"
								placeholder="Enter Message" name="inputText"
								style="overflow: auto;"></textarea>

							<span class="input-group-btn">
								<button class="btn btn-info" type="button" id="sendMessage">SEND</button>
							</span>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="panel panel-primary">
					<div class="panel-heading">ONLINE USERS</div>
					<div class="panel-body">
						<ul class="media-list">
						<c:forEach items="${mydualfollower}" var ="data">
							<li class="media">

								<div class="media-body">

									<div class="media">
										<a class="pull-left" href="userdetail?id=<c:out value="${data.user_id}"/>"> <img src="${data.user_image}" alt="user_image" style="width: 50px; height: 50px; border-radius: 50%;">
										</a>
										<div class="media-body">
											<h5><a href="chatWith?id=<c:out value="${data.user_id}"/>"><c:out value="${data.user_id}"/></a>| User</h5>

											<small class="text-muted">채팅가능</small>
										</div>
									</div>

								</div>
							</li>
						</c:forEach>
							
						</ul>
					</div>
				</div>

			</div>
		
		
		
		</div>
		
	<!-- 	
		<h4>chatting page</h4>
	<input type="text" id="message" />
	<input type="button" id="sendMessage" value="전송" />
	<div class="dfdsa" id="chatMessage" style="overFlow: auto; max-height: 500px; background-color:aqua;" >dfdsf</div>
	</div>
 -->
	
</body>
</html>
