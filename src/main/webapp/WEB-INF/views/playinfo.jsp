<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title></title>
<meta charset="utf-8">
<script type="text/javascript" src="resources/js/html5.js"></script>
<link rel="shortcut icon" type="image/x-icon"
	href="resources/images/favicon.png" />
<link rel="stylesheet" href="resources/css/ie.css" type="text/css"
	media="screen">

<link rel="stylesheet" href="resources/css/reset.css" type="text/css"
	media="screen">
<link rel="stylesheet" href="resources/css/style.css" type="text/css"
	media="screen">
<link rel="stylesheet" href="resources/css/layout.css" type="text/css"
	media="screen">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
  <link rel="stylesheet" href="resources/css/theme.css" type="text/css">
<script type="text/javsascript" src="resources/js/jquery-1.6.min.js"></script>
<script type="text/javsascript" src="resources/js/jquery-3.4.1.js"></script>
<script src="resources/js/cufon-yui.js" type="text/javascript"></script>
<script src="resources/js/cufon-replace.js" type="text/javascript"></script>
<script src="resources/js/Open_Sans_400.font.js" type="text/javascript"></script>
<script src="resources/js/Open_Sans_Light_300.font.js"
	type="text/javascript"></script>
<script src="resources/js/Open_Sans_Semibold_600.font.js"
	type="text/javascript"></script>
<script type="text/javascript" src="resources/js/tms-0.3.js"></script>
<script type="text/javascript" src="resources/js/tms_presets.js"></script>
<script type="text/javascript" src="resources/js/jquery.easing.1.3.js"></script>
<script src="resources/js/FF-cash.js" type="text/javascript"></script>
<link href="https://fonts.googleapis.com/css?family=Ranchers&display=swap" rel="stylesheet">

<style type="text/css">
.font1 
</style>
</head>
<body id="page1">
	<!-- header -->
	<div class="bg">
		<div class="main">
			<header>
				<div class="row-1">
					<h1>
						<a class="logo" href="/olympic/">Tokyo Olympic Ticketing Site</a>
					</h1>
					<c:if test="${sessionScope.userid == null }">

						<div align="right">
							<a href="/olympic/member/loginForm">로그인</a> &nbsp;&nbsp; <a
								href="/olympic/member/signupForm">회원등록</a>
						</div>
					</c:if>

					<c:if test="${sessionScope.userid != null }">

						<div align="right">

							<a href="/olympic/mypage">${sessionScope.username}님</a>
							&nbsp;&nbsp; <a href="/olympic/member/logout">로그아웃</a>

						</div>
					</c:if>



				</div>
				<div class="row-2">
					<nav>
						<ul class="menu">
						  <li><a class="active" href="/olympic/">Home Page</a></li>
						  <li><a href="/olympic/member/ticketting">Ticketing</a></li>
						  <li><a href="/olympic/mypage">Mypage</a></li>
						  <li><a href="/olympic/chatting/chatpage">Broadcasting</a></li>
						  <li class="last-item"><a href="/contacts">Contact Us</a></li>
						</ul>
					</nav>
				</div>
				<div class="py-5">
					<div class="container">
						<div class="row">
							<div class="col-md-4" style="margin-bottom: 10px;">
								<img src="resources/images/Baseball.png">
							</div>
							<hr>
							<div class="col-md-4" align="left" style="font-size: 30px; color: #0f0f0f; ">野球</div>
							<div class="col-md-4"></div>
							
							
							<div class="col-md-4">
								<img src="resources/images/Basketball.png">
							</div>
							<div class="col-md-4" align="left" style="font-size: 30px; color: #0f0f0f; ">バスケット</div>
							<div class="col-md-4"></div>
							<div class="col-md-4"></div>
							<div class="col-md-4"></div>
							<div class="col-md-4"></div>
						</div>
					</div>
				</div>

				<hr>
				<div class="box-bg">
					<div class="wrapper">

						<div class="box first">

							<h1>보유 티켓</h1>
						</div>



					</div>
					<hr>
					<table>
						<tr>
							<td width="100">티켓번호</td>
							<td width="100">경기종목</td>
							<td width="100">경기날짜</td>
						</tr>

					</table>
					<br>
					<table id="myticket">
					</table>
				</div>
		</div>
	</div>
	</div>

	<!-- content -->
	<div class="ic">More Website Templates at TemplateMonster.com!</div>


	<!-- footer -->
	<footer>
		<div class="row-top">
			<div class="row-padding">
				<div class="wrapper">
					<div class="col-1">
						<h4>Daily News</h4>
						<dl class="NEWS">
							<dt>
								<span>
							</dt>
							<dd>
								<span>
							</dd>
							<dd>
								<span>
							</dd>
							<dd>
								<span>
							</dd>
						</dl>
					</div>
					<div class="col-4">
						<div class="indent3">
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row-bot">
			<div class="aligncenter">
				<p class="p0">
					<a rel="nofollow" href="http://www.templatemonster.com/"
						target="_blank">Website Template</a> by TemplateMonster.com | <a
						rel="nofollow" href="http://www.html5xcss3.com/" target="_blank">html5xcss3.com</a>
				</p>
				<a href="http://www.templates.com/product/3d-models/"
					target="_blank">3D Models</a> provided by Templates.com<br>
				<!-- {%FOOTER_LINK} -->
			</div>
		</div>
	</footer>
	</div>
	</div>
	<script type="text/javascript">
		Cufon.now();
	</script>
</body>
</html>
