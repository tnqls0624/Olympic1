<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title></title>
<meta charset="utf-8">
<link rel="stylesheet" href="/olympic/resources/css/bootstrap.css"
	type="text/css" media="screen">
<link rel="stylesheet" href="/olympic/resources/css/reset.css"
	type="text/css" media="screen">
<link rel="stylesheet" href="/olympic/resources/css/style.css"
	type="text/css" media="screen">
<link rel="stylesheet" href="/olympic/resources/css/layout.css"
	type="text/css" media="screen">
<link href="https://fonts.googleapis.com/css?family=Poiret+One&display=swap" 
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Dancing+Script|Lobster+Two&display=swap" rel="stylesheet">
<script src="/olympic/resources/js/jquery-3.4.1.js "></script>
<script src="/olympic/resources/js/bootstrap.js "></script>
</head>

<style type="text/css">
a:link {
	color: #fff;
	text-decoration: none;
}

a:visited {
	color: white;
	text-decoration: none;
}

a:hover {
	color: white;
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
.slider {
	color: black;
	overflow: auto;
	text-align: center;
}

.content {
	display: inline-block;
}

.ticketimage {
	/*border:1px solid black;*/
	margin: auto;
	padding: 10px;
}

table {
	margin: auto;
	border: 1px solid black;
	width: 75%;

}

img {
	margin: 10px;
}

span {
	color: blue;
}

.ch{
	font-size:100%;
	font-family:Arial, Helvetica, sans-serif;
	font-weight: bold;
}
h5{color:black}
</style>
<script>
	$(function() {
		loaduserinfo();
	})

	function loaduserinfo() {

		var userid = $('#sessionid').val();

		$
				.ajax({
					url : "/olympic/member/loaduserinfo",
					type : "post",
					data : {
						"userid" : userid
					},
					dataType : "json",
					success : function(result) {
						$('.content')
								.append(
										'<ul><br>'
												+ '<li>ID '
												+ result.userid
												+ '</li><br><br>'
												+ '<li>名前 '
												+ result.username
												+ '</li><br><br>'
												+ '<li>ポイント '
												+ result.pay
												+ '</li><br>'
												+ '<li><button class="ticketinfo btn btn-dark" onclick="ticket()">チケット情報</button>'
												+ '</ul>');
					},
					error : function() {
						alert("error")
					}
				});

	}

	function ticket() {

		var userid = $('#sessionid').val();

		$('.ticketinfo').text('閉める');
		$('.ticketinfo').attr('onclick', 'closebtn()');
		$('.ticketinfo').attr('class', 'closebtn btn btn-dark');

		$.ajax({
				url : "/olympic/member/ticketinfo",
				type : "post",
				data : {"userid" : userid},
				dataType : "json",
				success : function(result) {
					$(result).each(function(index, item) {
						$('.ticket').append(
								'<div class="ticketimage">'
								+ '<table>'
								+ '<tr><td width="15%">NO. '
								+ item.ticketnum
								+ '</td><td width="18%"></td><td width="50%"></td><td width="18%"></td></tr>'
								+ '<tr><td><img src="/olympic/resources/images/mypage/emblem.png" width="100%" /></td>'
								+ '<td><img src="/olympic/resources/images/'
								+ item.play
										.toLowerCase()
								+ 'b.png" /></td>'
								+ '<td>'
								+ '<div style="text-align:left;"><h5>場所： '
								+ item.stadium
								+ '</h5><h5>日付：'
								+ item.playdate
								+ '</h5><h5>座席 : '
								+ item.sitlevel
								+ ' / '
								+ item.sit
								+ '</h5></div>'
								+ '</td><td><img src="/olympic/resources/qrcode/' + item.ticketnum + '.png"></td></tr>'
								+ '<tr><td></td><td></td><td></td><td></td></tr>'
								+ '</table>'
								+ '</div>'

						);
					})
				},
				error : function() {alert("error")}
		});
	}

	function closebtn() {
		$('.ticket').empty();
		$('.closebtn').text('チケット情報');
		$('.closebtn').attr('onclick', 'ticket()');
		$('.closebtn').attr('class', 'ticketinfo btn btn-dark');
	}

	function ticketprint(ticketnum) {

		html2canvas($('#1')[0]).then(function(canvas) {
			var myImage = canvas.toDataURL();
			downloadURI(myImage, "test.png");
		});
	}

	function downloadURI(uri, name) {
		var link = document.createElement("a");
		link.download = name;
		link.href = uri;
		document.body.appendChild(link);
		link.click();
	}
</script>
<body id="page1">
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
							<li><a href="/olympic/">Home Page</a></li>
							<li><a href="/olympic/member/ticketting">Ticketing</a></li>
							<li><a class="active" href="/olympic/member/mypage">Mypage</a></li>
							<li><a href="/olympic/chatting/chatpage">Broadcasting</a></li>
							<li class="last-item"><a href="/olympic/contacts">Contact
									Us</a></li>
						</ul>
					</nav>
				</div>

				<div class="row-3">
					<div class="slider-wrapper">
						<div class="slider">
							<input type="hidden" id="sessionid"
								value="${sessionScope.userid }">
							<div class="content"></div>
							<div class="ticket"></div>
						</div>
					</div>
				</div>
			</header>


			<!-- footer -->
			<footer>
				<div class="row-top-mypage">
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
