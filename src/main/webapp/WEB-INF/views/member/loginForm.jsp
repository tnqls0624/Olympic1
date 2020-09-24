<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title></title>
<meta charset="utf-8">
<link rel="shortcut icon" type="image/x-icon" href="/olympic/resources/images/favicon.png" />
<link rel="stylesheet" href="/olympic/resources/css/ie.css" type="text/css" media="screen">
<link rel="stylesheet" href="/olympic/resources/css/reset.css" type="text/css" media="screen">
<link rel="stylesheet" href="/olympic/resources/css/style.css" type="text/css" media="screen">
<link rel="stylesheet" href="/olympic/resources/css/layout.css" type="text/css" media="screen">
<link rel="stylesheet" href="/olympic/resources/css/bootstrap.css">
<link href="https://fonts.googleapis.com/css?family=Poiret+One&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Dancing+Script|Lobster+Two&display=swap" rel="stylesheet">
<!-- <script type="text/javsascript" src="/olympic/resources/js/jquery-3.4.1.js"></script> -->
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="/olympic/resources/js/bootstrap.js"></script>
<style>
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
.slider{
	display: flex;
	align-items: center;
	justify-content: center;
}
.btn{
	height:48.23px;
	width:223px;
}
td{
	height:50px;
}
.textbox{
	border-radius:5px;
	height:48.23px;
	width:223px;
	border:1px solid black;
}
</style>
<script>
$(function(){
	var userid=$("#userid_2").val();
	var userpw=$("#userpw_2").val();
	$("#btn").click(function(){
		$.ajax({
			data: { userid : $("#userid_2").val(),
					userpw : $("#userpw_2").val()
				  },
			url: "/olympic/member/login",
			type:"POST",
			success: function(data){
				if(data==''){
					alert("間違ったIDや暗証番号です。");
					return false;
				}
				else{
					location.href="/olympic"
				}
			}
		});
	
})
	
	$("#btn2").click(function(){
		location.href="/olympic/member/signupForm";
	})
	
	$("#btn3").click(function(){
		location.href="/olympic/member/findidpwForm";
	})
	
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
					</h1>
					<c:if test="${sessionScope.userid == null }">

						<div align="right">
							<a href="/olympic/member/loginForm"></a>
							&nbsp;&nbsp;
							<a href="/olympic/member/signupForm"></a>
						</div>
					</c:if>
					
					<c:if test="${sessionScope.userid != null }">
					
					<div align="right">
					
							<a href="/olympic/member/mypage">${sessionScope.username}様</a>
							&nbsp;&nbsp; <a href="/olympic/member/logout">ログアウト</a>
						
						</div> 
						</c:if>
					
					
					
				</div>
				<div class="row-2">
					<nav>
						<ul class="menu">
						  <li><a href="/olympic/">Home Page</a></li>
						  <li><a href="/olympic/member/ticketting">Ticketing</a></li>
						  <li><a href="/olympic/member/mypage">Mypage</a></li>
						  <li><a href="/olympic/chatting/chatpage">Broadcasting</a></li>
						  <li class="last-item"><a href="contacts">Contact Us</a></li>
						</ul>
					</nav>
					<nav>
						<ul class="menu">
						  <li><a href="/olympic/">Home Page</a></li>
						  <li><a class="active" href="/olympic/member/ticketting">ticketing</a></li>
						  <li><a href=/olympic/member/mypage>Mypage</a></li>
						  <li><a href="/olympic/chatting/chatpage">Broadcasting</a></li>
						  <li class="last-item"><a href="/contacts">Contact Us</a></li>
						</ul>
					</nav>
					<nav>
						<ul class="menu">
						  <li><a class="active" href="/olympic/">Home Page</a></li>
						  <li><a href="/olympic/member/ticketting">ticketing</a></li>
						  <li><a href="/olympic/member/mypage">Mypage</a></li>
						  <li><a href="/olympic/chatting/chatpage">Broadcasting</a></li>
						  <li class="last-item"><a href="/contacts">Contact Us</a></li>
						</ul>
					</nav>
					<nav>
						<ul class="menu">
						  <li><a class="active" href="/olympic/">Home Page</a></li>
						  <li><a href="/olympic/member/ticketting">ticketing</a></li>
						  <li><a href="/olympic/member/mypage">Mypage</a></li>
						  <li><a href="/olympic/chatting/chatpage">Broadcasting</a></li>
						  <li class="last-item"><a href="/contacts">Contact Us</a></li>
						</ul>
					</nav>
					<nav>
						<ul class="menu">
						  <li><a class="active" href="/olympic/">Home Page</a></li>
						  <li><a href="/olympic/member/ticketting">ticketing</a></li>
						  <li><a href="/olympic/member/mypage">Mypage</a></li>
						  <li><a href="/olympic/chatting/chatpage">Broadcasting</a></li>
						  <li class="last-item"><a href="/olympic/contacts">Contact Us</a></li>
						</ul>
					</nav>
				</div>
				<div class="row-3">
					<div class="slider-wrapper">
						<div class="slider">
							<input type="hidden" value="${sessionScope.userid}" id="userid">
							<input type="hidden" value="${msg}" id="error">
							<div class="loginbox">
							<form action="/olympic/member/login" method="post" id="loginBtn">
							<table>
							<tr><td><input type="text" class="textbox" name="userid" id="userid_2" placeholder="アカウント入力"></td></tr>
							<tr><td><input type="password" class="textbox" name="userpw" id="userpw_2" placeholder="暗証番号入力"></td></tr>
							<tr><td><input type="button" class="btn btn-dark" value="ログイン" id="btn"></td></tr>
							<tr><td><input type="button" class="btn btn-dark" value="会員登録" id="btn2"></td></tr>
							<tr><td><input type="button" class="btn btn-dark" value="アカウント／暗証番号探す" id="btn3"></td></tr>
							<!-- 네이버 로그인 창으로 이동 -->
							<tr><td colspan="2"><div id="naver_id_login" style="text-align:center"><a href="${url}">
							<img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a></div></td></tr>
							</table>
							
							</form>
						 	</div>
							
						</div>
					</div>
				</div>
			</header>
	
</body>
</html>
