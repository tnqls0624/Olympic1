<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title></title>
<meta charset="utf-8">
<link rel="stylesheet" href="../resources/css/reset.css" type="text/css" media="screen">
<link rel="stylesheet" href="../resources/css/style.css" type="text/css" media="screen">
<link rel="stylesheet" href="../resources/css/layout.css" type="text/css" media="screen">
<link href="https://fonts.googleapis.com/css?family=Ranchers&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Poiret+One&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Dancing+Script|Lobster+Two&display=swap" rel="stylesheet">
<script type="text/javsascript" src="../resources/js/jquery-3.4.1.js"></script>
<script src="/olympic/resources/js/jquery-1.8.3.min.js "></script>
</head>
<style>
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
input{
	border-radius:5px;
	height:48.23px;
	width:223px;
	border:1px solid black;
}
table{text-align:center;}
.slider{
	display: flex;
	align-items: center;
	justify-content: center;
}
</style>
<script>
$(function(){
	$("#btn").click(function(){
			if($('#userid').val() == "") {
				alert("ブランクがあります。") 
				return;
			}
			if($('#userpw').val() == "") {
				alert("ブランクがあります。") 
				return;
			}
			if($('#userpw2').val() == "") {
				alert("ブランクがあります。") 
				return;
			}
			if($('#username').val() == "") {
				alert("ブランクがあります。") 
				return;
			}
			if($('#email').val() == "") {
				alert("ブランクがあります。") 
				return;
			}
			if($('#tel').val() == "") {
				alert("ブランクがあります。") 
				return;
			}
			if($('#userpw').val() != $('#userpw2').val()){
				alert("暗証番号の確認");
				$('#userpw').focus();
				return;
			}
		
		$('#fom').submit();
	})
})

function duplicate() {
	
	var userid = $('#userid').val();
	if(userid == "") return;
	
	$.ajax({
		url:"duplicate",
		type:"get",
		data:{"userid":userid},
		success:function(result){
			if(result == true) {
				alert("アカウントがあります");
				$('#userid').attr("style", "border:3px solid red");
				$('#userid').val("");
				$('#userid').attr("placeholder", "アカウントがあります");
				
				$('#userpw').attr("disabled", true);
				$('#userpw2').attr("disabled", true);
				$('#username').attr("disabled", true);
				$('#email').attr("disabled", true);
				$('#tel').attr("disabled", true);
				$('#btn').attr("disabled", true);
			}
			else {
				alert("可能なアカウント");
				$('#userid').attr("style", "border:3px solid green");
				
				$('#userpw').attr("disabled", false);
				$('#userpw2').attr("disabled", false);
				$('#username').attr("disabled", false);
				$('#email').attr("disabled", false);
				$('#tel').attr("disabled", false);
				$('#btn').attr("disabled", false);
			}
		},
		error:function(){alert("실패")}
	});
	
}

function passwordcheck() {
	var pw1 = $('#userpw').val();
	var pw2 = $('#userpw2').val();
	if(pw1 == pw2) {
		alert("正しいです。");
		return;
	}else{
		alert("正しくないです");
		$('#userpw').val("");
		$('#userpw2').val("");
		$('#userpw').focus();
	}
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
							<a href="/olympic/member/loginForm"></a>
							&nbsp;&nbsp;
							<a href="/olympic/member/signupForm"></a>
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
						  <li><a href="/olympic/member/mypage">Mypage</a></li>
						  <li><a href="/olympic/chatting/chatpage">Broadcasting</a></li>
						  <li class="last-item"><a href="/olympic/contacts">Contact Us</a></li>
						</ul>
					</nav>
				</div>
				<div class="row-3">
					<div class="slider-wrapper">
						<div class="slider">
						  
						 
							<form action="/olympic/member/signup" id="fom" method="post">
							<table class="table">
							<tr><th>会員登録</th></tr>
							<tr>
								<td><input type="text" name="userid" id="userid" placeholder="アカウント" onblur="duplicate()"></td>
							</tr>
							
							<tr>
								<td><input type="password" name="userpw" id="userpw" placeholder="暗証番号"></td>
							</tr>
							<tr>
								<td><input type="password" id="userpw2" placeholder="暗証番号確認" onblur="passwordcheck()"></td>
							</tr>
							
							<tr>
								<td><input type="text" name="username" id="username" placeholder="名前"></td>
							</tr>
							
							<tr>
								<td><input type="email" name="email" id="email" placeholder="メール"></td>
							</tr>
							<tr>
								<td><input type="tel" name="tel" id="tel" placeholder="電話番後"></td>
							</tr>
							<tr><td><input type="button" id="btn" value="登録する"></td></tr>
							</table>
							</form>
						  
						</div>
					</div>
				</div>
			</header>
<!-- content --><div class="ic">More Website Templates  at TemplateMonster.com!</div>
			

<!-- footer -->
			<footer>
				<div class="row-top">
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
								</dl>
							</div>
							<div class="col-4">

							</div>
						</div>
					</div>
				</div>
				<div class="row-bot">
					
				</div>
			</footer>
		</div>
	</div>
	
</body>
</html>
