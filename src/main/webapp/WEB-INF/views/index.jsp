<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title></title>
<meta charset="utf-8">

<link rel="stylesheet" href="/olympic/resources/css/reset.css"
	type="text/css" media="screen">
<link rel="stylesheet" href="/olympic/resources/css/style.css"
	type="text/css" media="screen">
<link rel="stylesheet" href="/olympic/resources/css/layout.css"
	type="text/css" media="screen">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link href="https://fonts.googleapis.com/css?family=Poiret+One&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Dancing+Script|Lobster+Two&display=swap" rel="stylesheet">
	
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

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
.imgs {
	height: 450px;
}

img {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
}
</style>
<script>
	$(document).ready(function() {
		$('.slider').bxSlider({
			auto : true, // 자동으로 애니메이션 시작
			speed : 500, // 애니메이션 속도
			pause : 5000, // 애니메이션 유지 시간 (1000은 1초)
			mode : 'horizontal', // 슬라이드 모드 ('fade', 'horizontal', 'vertical' 이 있음)
			autoControls : true, // 시작 및 중지버튼 보여짐
			pager : true, // 페이지 표시 보여짐
			captions : true, // 이미지 위에 텍스트를 넣을 수 있음
		});
	});
</script>
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
							<li><a class="active" href="/olympic/">Home Page</a></li>
							<li><a href="/olympic/member/ticketting">Ticketing</a></li>
							<li><a href="/olympic/member/mypage">Mypage</a></li>
							<li><a href="/olympic/chatting/chatpage">Broadcasting</a></li>
							<li class="last-item"><a href="contacts">Contact Us</a></li>
						</ul>
					</nav>
				</div>
				<div class="row-3">
					<div class="slider-wrapper">
						<div class="slider">

							<div class="imgs">
								<img src="/olympic/resources/images/bg.png"
									title="Tokyo Olympic Ticketing Siteへようこそ。" />
							</div>
							<div class="imgs">
								<img src="/olympic/resources/images/baseballpic.png"
									title="Clive Roseが野球をやっている。" />
							</div>
							<div class="imgs">
								<img src="/olympic/resources/images/swimmingpic.png"
									title="Michael Phelpsが水泳をしている。" />
							</div>
							<div class="imgs">
								<img src="/olympic/resources/images/karate.png" title="Karate" />
							</div>
							<div class="imgs">
								<img src="/olympic/resources/images/tokyoolympic1.png"
									title="See you in Tokyo Olympic" />
							</div>


						</div>
					</div>
				</div>
			</header>
			<!-- content -->
			<div class="ic">More Website Templates at TemplateMonster.com!</div>


			<!-- footer -->
			<footer>
				<div class="row-top-main">
					<div class="row-padding">
						<div class="wrapper">
							<div class="col-1">
								<h4>Daily News</h4>
								<dl class="NEWS">
									<td><span></td>
									<td><a href="https://tokyo2020.org/en/" class="ch"><2019.10.3> 東京オリンピック公式ウェブサイト</a></td>
									<br>
									<td><a
										href="https://www.cnet.com/news/2020-summer-olympic-games-everything-you-need-to-know-about-tokyo-2020/" class="ch"><2019.10.2>
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