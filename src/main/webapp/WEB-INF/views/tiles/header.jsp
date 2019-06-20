<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MarcheLine by MarcheLine</title>
<style>
/* .gnb{
	text-align:center;
	width:85px;
	height:75px;
}
.gnb img{
	border:none;
	outline: none;
} */
#main {position:relative;}
#main .m_image,
#main .m_text {transition: opacity 0.3s ease-in-out;}
#main .m_text {position:absolute; top:0; left:0; opacity:0;}
#main:hover .m_image {opacity:0;}
#main:hover .m_text {opacity:1;}

#mypage {position:relative;}
#mypage .p_image,
#mypage .p_text {transition: opacity 0.3s ease-in-out;}
#mypage .p_text {position:absolute; top:0; left:0; opacity:0;}
#mypage:hover .p_image {opacity:0;}
#mypage:hover .p_text {opacity:1;}

#write {position:relative;}
#write .w_image,
#write .w_text {transition: opacity 0.3s ease-in-out;}
#write .w_text {position:absolute; top:0; left:0; opacity:0;}
#write:hover .w_image {opacity:0;}
#write:hover .w_text {opacity:1;}

#chat {position:relative;}
#chat .c_image,
#chat .c_text {transition: opacity 0.3s ease-in-out;}
#chat .c_text {position:absolute; top:0; left:0; opacity:0;}
#chat:hover .c_image {opacity:0;}
#chat:hover .c_text {opacity:1;}

#actlog {position:relative;}
#actlog .a_image,
#actlog .a_text {transition: opacity 0.3s ease-in-out;}
#actlog .a_text {position:absolute; top:0; left:0; opacity:0;}
#actlog:hover .a_image {opacity:0;}
#actlog:hover .a_text {opacity:1;}

#logout {position:relative;}
#logout .l_image,
#logout .l_text {transition: opacity 0.3s ease-in-out;}
#logout .l_text {position:absolute; top:0; left:0; opacity:0;}
#logout:hover .l_image {opacity:0;}
#logout:hover .l_text {opacity:1;}

#login {position:relative;}
#login .l_image,
#login .l_text {transition: opacity 0.3s ease-in-out;}
#login .l_text {position:absolute; top:0; left:0; opacity:0;}
#login:hover .l_image {opacity:0;}
#login:hover .l_text {opacity:1;}
</style>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
	
</script>
</head>
<body class="header-fixed-top">
	<div id="page-top" class="page-top"></div>
	<!-- /.page-top -->
	<section id="site-banner" class="site-banner text-center">
		<div class="container">
			<div class="site-logo">
				<a href="./list"><img src="resources/images/logo.png"
					alt="Site Logo"></a>
			</div>
			<!-- /.site-logo -->
		</div>
		<!-- /.container -->
	</section>
	<!-- /#site-banner -->
	<header id="main-menu" class="main-menu">
		<div class="container" >
			<div class="row" style="border:1px 0 solid silver;">
				<div class="col-sm-7">
					<nav id="menu" class="navbar-nav" >
						<ul id="headernavigation" class="navbar-nav">
							<c:if test="${sessionScope.session_id!=null }">
							<li id="main"><a href="list"><img style="width:28px;" src="resources/images/home.png" alt="Main" class="m_image"/><span class="m_text">main</span></a></li>
							<li id="mypage"><a href="myBoardList"><img style="width:28px;" src="resources/images/myuser.png" alt="My page" class="p_image"><span class="p_text">my page</span></a></li>
							<li id="write" ><a href="insert"><img style="width:28px;" src="resources/images/write.png" alt="Write" class="w_image"><span class="w_text">write</span></a></li>
							<li id="chat"><a href="chatList"><img style="width:28px;" src="resources/images/chat.png" alt="Chat" class="c_image"><span class="c_text">chat</span></a></li>
							<li id="actlog"><a href="actlist" data-toggle="modal" data-target="#myModal2"><img style="width:28px;" src="resources/images/history.png" alt="Actlog" class="a_image"><span class="a_text">actlog</span></a></li>
							<li id="logout"><a href="logout"><img style="width:28px;" src="resources/images/logout.png" alt="logout" class="l_image"><span class="l_text">logout</span></a></li>
							</c:if>
							<c:if test="${sessionScope.session_id==null }">
							<li id="login"><a href="login"><img style="width:28px;" src="resources/images/logout.png" alt="login" class="l_image"><span class="l_text">login</span></a></li>
							</c:if>							
						</ul>
						<!-- /.menu-list -->
					</nav>
					<!-- /.menu-list -->
				</div>
				<div class="col-sm-5">
					<div class="menu-search pull-right">
						<form role="search" class="search-form" action="search" method="get">
							<input class="search-field" type="text" name="s" id="s"
								placeholder="Search Here" required>
							<button class="btn search-btn" type="submit">
								<i class="fa fa-search"></i>
							</button>
						</form>
						<!-- /.search-form -->
					</div>
					<!-- /.menu-search -->
				
				</div>
				
				
			<!-- /.row -->
		</div></div>
		<!-- /.container -->
	</header>
	<!-- /#main-menu -->
	
	 <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
    

            </div>
        </div>
    </div>
</body>
</html>