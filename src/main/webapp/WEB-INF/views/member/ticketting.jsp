<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title></title>
<meta charset="utf-8">
<link rel="shortcut icon" type="image/x-icon" href="/olympic/resources/images/favicon.png" />
<link rel="stylesheet" href="/olympic/resources/css/reset.css"
	type="text/css" media="screen">
<link rel="stylesheet" href="/olympic/resources/css/style.css"
	type="text/css" media="screen">
<link rel="stylesheet" href="/olympic/resources/css/layout.css"
	type="text/css" media="screen">
<link href=
	"https://fonts.googleapis.com/css?family=Poiret+One&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Dancing+Script|Lobster+Two&display=swap" rel="stylesheet">

<!-- <script type="text/javascript" src="/olympic/resources/js/jquery-1.6.min.js"></script> -->
<!-- <script src=" http://code.jquery.com/jquery-latest.min.js"></script> -->

<!-- <script src="/olympic/resources/js/cufon-yui.js" type="text/javascript"></script>
<script src="/olympic/resources/js/cufon-replace.js" type="text/javascript"></script>
<script src="/olympic/resources/js/Open_Sans_400.font.js" type="text/javascript"></script>
<script src="/olympic/resources/js/Open_Sans_Light_300.font.js" type="text/javascript"></script> 
<script src="/olympic/resources/js/Open_Sans_Semibold_600.font.js" type="text/javascript"></script>  
<script type="text/javascript" src="/olympic/resources/js/tms-0.3.js"></script>
<script type="text/javascript" src="/olympic/resources/js/tms_presets.js"></script> 
<script type="text/javascript" src="/olympic/resources/js/jquery.easing.1.3.js"></script> 
<script src="/olympic/resources/js/FF-cash.js" type="text/javascript"></script> -->

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link href="https://fonts.googleapis.com/css?family=Ranchers&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Poiret+One&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Knewave&display=swap" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<script>


$(function(){
	
	$.ajax({
		url: "/olympic/member/playinffo",
		type: "POST",
		success:function(result){
			$(result).each(function(index,item){
				$("#playlist").append(
					'<tr><td width="200"><img src="'+item.image+'" style="margin-top: 10px; margin-left: 40px"></td>'+	
					'<td rowspan="2" width="500" style="color: black;"> <h3 id="p1">競技情報</h3> <br> <b style="font-size: 20px">場所：'+item.location+ 
					'</b><a id="mouseover" href="'+item.locationmap+'" style="font-size: 20px;  padding-left: 15px; color: #000">地図</a><br> <br> <b style="font-size: 20px">日付：'+
					item.datee+'</b></td><td align="center" width="200"><button id="btn" onclick="btn1('+item.playnum+')">予約する</button></td></tr><tr><td></td><td></td></tr>'
			)
		})
	}})
	
})


function btn1(num){
	if(num==1){
	location.href="/olympic/member/stadium" + num + "?stadium=横浜スタジアム&playdate=2020年8月8日";
		}
	if(num==2){
	location.href="/olympic/member/stadium" + num + "?stadium=青海アーバンスポーツパーク&playdate=2020年7月25日";
	}
}


</script>
<style type="text/css">
a:link {
	color: red;
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
	color: 		#191970;
	text-decoration: none;
}

a1:visited {
	color: 		#191970;
	text-decoration: none;
}

a1:hover {
	color: 		#191970;
	text-decoration: none;	
}
</style>
<style>
#playlist {
	border: 1px solid #444444;
	width: 950px;
}
#btn {
	margin-top: 170px;
}

#p1 {
	font-size: 35px;
	font-weight: bold;
	color: black;
	padding-top: 45px;
}

#p2 {
	font-size: 15px;
	font-weight: normal;
	color: black;
	border: 1px solid #444444;
}
</style>

</head>
<body id="page1" >
	<!-- header -->
	<div class="bg">
		<div class="main">
			<header>
				<div class="row-1">
					<h1>
						<a1 class="logo" href="/olympic/">Tokyo Olympic Ticketing Site</a>
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
						  <li><a  href="/olympic/">Home Page</a></li>
						  <li><a class="active" href="/olympic/member/ticketting">Ticketing</a></li>
						  <li><a href="/olympic/member/mypage">Mypage</a></li>
						  <li><a href="/olympic/chatting/chatpage">Broadcasting</a></li>
						  <li class="last-item"><a href="/olympic/contacts">Contact Us</a></li>
						</ul>
					</nav>
				</div>
				<div class="row-3">
					<div class="slider-wrapper">

						<div class="slider" style="height: 430px">

							<table id=playlist>
								
							</table>

						</div>
					</div>
				</div>
			</header>
			<!-- content -->
			<div class="ic">More Website Templates at TemplateMonster.com!</div>


			<!-- footer -->
			<footer>
				<div class="row-top-ticketing">
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
