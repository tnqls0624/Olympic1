<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title></title>
<meta charset="utf-8">
<script type="text/javascript" src="/olympic/resources/js/html5.js"></script>
<link rel="shortcut icon" type="image/x-icon" href="/olympic/resources/images/favicon.png" />
<link rel="stylesheet" href="/olympic/resources/css/ie.css" type="text/css" media="screen">

<link rel="stylesheet" href="/olympic/resources/css/reset.css" type="text/css" media="screen">
<link rel="stylesheet" href="/olympic/resources/css/style.css" type="text/css" media="screen">
<link rel="stylesheet" href="/olympic/resources/css/layout.css" type="text/css" media="screen">
<link href="https://fonts.googleapis.com/css?family=Ranchers&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Poiret+One&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Dancing+Script|Lobster+Two&display=swap" rel="stylesheet">

<script src="/olympic/resources/js/jquery-3.4.1.js"></script>
<script src="/olympic/resources/js/Open_Sans_400.font.js" type="text/javascript"></script>
<script src="/olympic/resources/js/Open_Sans_Light_300.font.js" type="text/javascript"></script> 
<script src="/olympic/resources/js/Open_Sans_Semibold_600.font.js" type="text/javascript"></script>  
<script type="text/javascript" src="/olympic/resources/js/tms-0.3.js"></script>
<script type="text/javascript" src="/olympic/resources/js/tms_presets.js"></script> 
<script type="text/javascript" src="/olympic/resources/js/jquery.easing.1.3.js"></script> 
<script src="/olympic/resources/js/FF-cash.js" type="text/javascript"></script>
<script type="text/javascript">


function getseatprice(){
	if($('#seat').val()==""){
		$('#seat_pr').empty();
		document.getElementById("selectseat").getAttribute("disabled");
		return;
	}
	$.ajax({
		type : 'POST',
		url : '/olympic/tiket/seatprice',
		data : { 
			"sitlevel" : $('#seat').val(),
			"play" : "BASEBALL"
			},
		success : function(result){
			$('#seat_pr').empty();
			$('#seat_pr').append(result.price+'ウォン');
			document.getElementById("selectseat").removeAttribute("disabled");
		}
	})
	}

function selectseat(){
	location.href="/olympic/tiket/selectseat?play=BASEBALL&stadium="+"${stadium}"+"&playdate="+"${playdate}"+"&sitlevel="+ $('#seat').val();
}

</script>
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
select {
	width: 200px;
	padding: .8em .5em;
	border: 1px solid #999;
	font-family: inherit;
	background: url('/olympic/resources/images/arrow.jpg') no-repeat 95% 50%;
	border-radius: 0px;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	}
#roww{
idth:100%;min-height:417px;position:relative;z-index:2;background-color: white;
}
#rowww{
margin-left: 130px;
padding-bottom: 40px;
}
select::-ms-expand {
    display: none;
}
div#select_box label{
 position: absolute;
  font-size: 14px;
  color: #fff;
  top: 7px;
  left: 12px;
  letter-spacing: 1px;
}
#seat_pr{
font-size: 32px;
}
	
</style>
<!--[endif]-->
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
					${sessionScope.userid}
						<div align="right">
							<a href="/olympic/loginForm">ログイン</a>
							&nbsp;&nbsp;
							<a href="/olympic/member/signupForm">会員登録</a>
						</div>
					</c:if>
					
					<c:if test="${sessionScope.userid != null }">
					
					<div align="right">
							<a href="/olympic/mypage">${sessionScope.username}様</a>
							&nbsp;&nbsp; <a href="/olympic/member/logout">ログアウト</a>
						
						</div> 
						</c:if>

						
					
				</div>
				<div class="row-2">
					<nav>
						<ul class="menu">
						  <li><a href="/olympic/">Home Page</a></li>
						  <li><a class="active" href="/olympic/member/ticketting">Ticketing</a></li>
						  <li><a href="/olympic/mypage">Mypage</a></li>
						  <li><a href="/olympic/chatting/chatpage">Broadcasting</a></li>
						  <li class="last-item"><a href="/olympic/contacts">Contact Us</a></li>
						</ul>
					</nav>
				</div>
				<div id="roww">
					<img src="/olympic/resources/images/babs.png"><br />
					<!-- <label for="color">color</label> -->
					<div id="rowww">
					<label style="font-size: 32px;">座席の選択:</label>
						<select name="seat" id="seat" onchange="getseatprice(this.value);">
							<option value="">---</option>
							<option value="A">A席</option>
							<option value="B">B席</option>
							<option value="C">C席</option>
							<option value="D">D席</option>
						</select><br />
						<div id="select_box"></div>
						<div id="seat_pr"></div>
						<br/>
						<button type="button" onclick="selectseat()" id="selectseat"
							disabled="disabled">座席選択</button>
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
								<div class="indent3">
								</div>
							</div>
						</div>
					</div>
				</div>
				
			</footer>
		</div>
	</div>
</body>
</html>
