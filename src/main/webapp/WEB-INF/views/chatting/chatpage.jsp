<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title></title>
<meta charset="utf-8">

<link rel="stylesheet" href="/olympic/resources/css/reset.css" type="text/css" media="screen">
<link rel="stylesheet" href="/olympic/resources/css/style.css"	type="text/css" media="screen">
<link rel="stylesheet" href="/olympic/resources/css/layout.css"	type="text/css" media="screen">
<link href="https://fonts.googleapis.com/css?family=Poiret+One&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Dancing+Script|Lobster+Two&display=swap" rel="stylesheet">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<style type="text/css">
a:link {
	color: #fff;
	text-decoration: none;
}

a:visited {
	color: #fff;
	text-decoration: none;
}

a:hover {
	color: #fff;
	text-decoration: underline;
}

a1:link {
	color: 		#000080;
	text-decoration: none;
}

a1:visited {
	color: 		#000080;
	text-decoration: none;
}

a1:hover {
	color: 		#000080;
	text-decoration: none;
}

</style>

<style>
.slider{
	overflow:auto;
}
.room{
	border:1px solid black;
	margin:8px;
	padding:10px;
}
.btn-light{
	width:150px;
	height:220px;
	background-color:#450f1f;
	color:white;
}
.ch{
	font-size:100%;
	font-family:Arial, Helvetica, sans-serif;
	font-weight: bold;
}
</style>
</head>
<body id="page1">
	<!-- header -->
	<div class="bg">
		<div class="main">
			<header>
				<div class="row-1">
					<h1>
						<a1 class="logo" href="/olympic/">Tokyo Olympic Ticketing Site</a>
					<!-- 	<strong class="slog">Welcome to Our Site!</strong> -->
					</h1>
					<c:if test="${sessionScope.userid == null }">
						<div align="right">
							<center>
								<div style="width: 1200px;">
									<div class="container">
										<div class="button1">
											<div class="button1-content">
												<a href="/olympic/loginForm">こんにちは</a>
											</div>
										</div>
									</div>

									<div class="container">
										<div class="button2">
											<div class="button2-content">
												<a href="/olympic/member/signupForm">こんにちは</a>
											</div>
										</div>
									</div>
								</div>
							</center>
							<a href="/olympic/loginForm"></a> &nbsp;&nbsp; <a
								href="/olympic/member/signupForm"></a>
						</div>
					</c:if>

					<c:if test="${sessionScope.userid != null }">

						<div align="right">
							<center>
								<div style="width: 1200px;">
									<div class="container">
										<div class="button3">
											<div class="button3-content:before">
												<a href="/olympic/mypage">${sessionScope.username}様</a>
											</div>
										</div>
									</div>

									<div class="container">
										<div class="button4">
											<div class="button4-content">
												<a href="/olympic/member/logout">ログアウト</a>
											</div>
										</div>
									</div>
								</div>
							</center>
						</div>
					</c:if>



				</div>
				<div class="row-2">
					<nav>
						<ul class="menu">
							<li><a href="/olympic/">Home Page</a></li>
							<li><a href="/olympic/member/ticketting">Ticketing</a></li>
							<li><a href="/olympic/member/mypage">Mypage</a></li>
							<li><a class="active" href="/olympic/chatting/chatpage">Broadcasting</a></li>
							<li class="last-item"><a href="/olympic/contacts">Contact Us</a></li>
						</ul>
					</nav>
				</div>
				<div class="row-3">
					<div class="slider-wrapper">
						<div class="slider">

							<c:if test="${flag == false }">	
								<c:forEach items="${list }" var="item">
									<div class="room">
									<table border="1">
										<tr>
											<c:set var="string" value="${item.play}" />
											<c:set var="play" value="${fn:toLowerCase(string)}" />
											<td width="200"><img src="/olympic/resources/images/${play}b.png" style="margin-top: 10px; margin-left: 40px"></td>
											<td rowspan="2" width="500" style="color: black;"><h3 id="p1">競技情報</h3> <br> <b style="font-size: 20px">場所：${item.stadium}</b>
												<a href="/olympic/member/map1" style="font-size: 20px; padding-left: 15px">地図</a><br><br>
												<b style="font-size: 20px">
												日付： ${item.playdate }
													<%-- <fmt:parseDate value="${item.playdate}" var="parseRegdate" pattern="yyyy-MM-dd HH:mm:ss" />
													<fmt:formatDate value="${parseRegdate}" pattern="yyyy年MM月dd日" /> --%>
												</b></td>
											<td align="center" width="200">
												<c:if test="${item.play eq 'BASEBALL' }" >
													<a href="/olympic/chatting/chatroom01?playnum=${item.play }"><button class="btn btn-light">入場</button></a>
												</c:if>
												<c:if test="${item.play eq 'BASKETBALL' }" >
													<a href="/olympic/chatting/chatroom02?playnum=${item.play }"><button class="btn btn-light">入場</button></a>
												</c:if>
											</td>
										</tr>
									</table>
									</div>
								</c:forEach>
							</c:if>
							<c:if test="${flag == true }">
								<div style="text-align:center;margin:150px;"><h2 style="color:black">チケットがありません。</h2></div>
							</c:if>

						</div>
					</div>
				</div>
			</header>
			<!-- content -->
			<div class="ic">More Website Templates at TemplateMonster.com!</div>


			<!-- footer -->
			<footer>
				<div class="row-top-broadcasting">
					<div class="row-padding">
						<div class="wrapper">
							<div class="col-1">
								<h4>Daily News</h4>
								<dl class="NEWS">
									<td><span></td>
									<td><a href="https://tokyo2020.org/en/"><2019.10.3> 東京オリンピック公式ウェブサイト</a></td>
									<br>
									<td><a
										href="https://www.cnet.com/news/2020-summer-olympic-games-everything-you-need-to-know-about-tokyo-2020/"><2019.10.2>
											東京オリンピックで知っておくべきこと。</a></td>
									<br>
									<td><span></td>
									<td><span></td>
									<br>
									<td><span></td>
									<td><span></td>
									<td><span></td>
									<td><span></td>
									<td><span></td>
								</dl>
							</div>
						</div>
					</div>
				</div>

			</footer>
</body>
</html>