<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title></title>
<meta charset="utf-8">
<link rel="shortcut icon" type="image/x-icon"
	href="resources/images/favicon.png" />
<link rel="stylesheet" href="/olympic/resources/css/ie.css"
	type="text/css" media="screen">
<link rel="stylesheet" href="/olympic/resources/css/reset.css"
	type="text/css" media="screen">
<link rel="stylesheet" href="/olympic/resources/css/style.css"
	type="text/css" media="screen">
<link rel="stylesheet" href="/olympic/resources/css/layout.css"
	type="text/css" media="screen">
<link
	href="https://fonts.googleapis.com/css?family=Ranchers&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Poiret+One&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Dancing+Script|Lobster+Two&display=swap"
	rel="stylesheet">
<script type="text/javascript" src="/olympic/resources/js/html5.js"></script>



<script type="text/javascript"
	src="/olympic/resources/js/jquery-1.6.min.js"></script>
<!-- *** -->

<script src="/olympic/resources/js/Open_Sans_400.font.js"
	type="text/javascript"></script>
<script src="/olympic/resources/js/Open_Sans_Light_300.font.js"
	type="text/javascript"></script>
<script src="/olympic/resources/js/Open_Sans_Semibold_600.font.js"
	type="text/javascript"></script>
<script type="text/javascript" src="/olympic/resources/js/tms-0.3.js"></script>
<script type="text/javascript"
	src="/olympic/resources/js/tms_presets.js"></script>
<script type="text/javascript"
	src="/olympic/resources/js/jquery.easing.1.3.js"></script>
<script src="/olympic/resources/js/FF-cash.js" type="text/javascript"></script>

<!--[if lt IE 7]>
	<div style=' clear: both; text-align:center; position: relative;'>
		<a href="http://www.microsoft.com/windows/internet-explorer/default.aspx?ocid=ie6_countdown_bannercode"><img src="http://www.theie6countdown.com/images/upgrade.jpg" border="0"  alt="" /></a>
	</div>
<![endif]-->
<!--[if lt IE 9]>
	<script type="text/javascript" src="js/html5.js"></script>
	<link rel="stylesheet" href="css/ie.css" type="text/css" media="screen">
<![endif]-->


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
#playtable {
	border-top: 1px solid #444444;
	border-collapse: collapse;
	text-align: center;
	padding: 10px;
	color: black;
}

.box-bgg {
	background-color: highlight;
}

#good {
	font-size: large;
	color: black;
	font-weight: bold;
}

#myticket {
	text-align: center;
}

#playtable th, td {
	border-bottom: 1px solid #444444;
	padding: 10px;
}

#text1 {
	font-size: 27px;
	font-weight: 1000;
	color: black;
}

#text2 {
	font-size: 23px;
	font-weight: 1000;
	color: black;
	text-align: left;
}

.a1 {
	background-color: highlight;
	width: 100%;
	overflow: hidden;
}

a1:link {
	color: #191970;
	text-decoration: none;
}

a1:visited {
	color: #191970;
	text-decoration: none;
}

a1:hover {
	color: #191970;
	text-decoration: none;
}
</style>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>




<script>

$(function(){
	var fom = $("#fom");
	var useridd = "<%=session.getAttribute("userid")%>";
	var amount = "${amount}";
	var play = "${play}";
	var sit = "${sit}";
	var sitlevel = "${sitlevel}";
	
		$.ajax({
			url:"/olympic/member/information",
			type:"POST",
			data:{"userid":useridd},
			success:function(result){ 
				$(result).each(function(index,item){
					$("#myinfo").append(
					'&nbsp;アカウント : '+item.userid+'<br>'+	
					'&nbsp;名前 : '+item.username+'<br>'+
					'&nbsp;メール :'+item.email+'<br>'+
					'&nbsp;オリンピックペイ : '+item.pay)
	
				})
			}
		})
		
		$.ajax({
			url:"/olympic/member/myticket" ,
			type:"Post" ,
			data: {"userid" :useridd },
			success: function(result){
				$(result).each(function(index,item){
					$("#myticket").append(
							'<tr><td width="95">'+item.ticketnum+'</td>'+	
							'<td width="40">'+item.play+'</td>'+	
							'<td width="120">'+item.playdate+'</td>'+
							'<td width="100">'+item.stadium+'</td>'+
							'<td width="95">'+item.sitlevel+'</td>'+
							'<td width="100">'+item.sit+'</td>'+
							'<td width="80">'+item.reservationdate+'</td>'+
							'<td width="100">'+item.amount+'</td></tr>'
					)

				})	
			}
		})
	$("#btn").click(function(){
		buy1();				
				})	
				
	$("#btn2").click(function(){
		
		
		tiketbuy();
		
	})
	$("#btn3").click(function(){
		buy3();				
				})
});


		function home1(){
			location.href="/olympic/"
			
			
		}

	function tiketbuy(){
		var useridd = "<%=session.getAttribute("userid")%>";
		var amount = "${amount}";
		var play = "${play}";
		var sit = "${sit}";
		var sitlevel = "${sitlevel}";
		var pay = "${pay}";
		var stadium = "${stadium}";
		var playdate = "${playdate}"
		var result = confirm("ほんとに購入いたしますか？");
	if(result== true){
		if(pay - amount > 0){
	
			$.ajax({
		url:"/olympic/member/tiket" ,
		type:"post",
		data:{"userid":useridd , "amount":amount , "play":play , "sit":sit , "sitlevel":sitlevel , "stadium":stadium , "playdate":playdate},
		success:function(){ alert("購入成功しました。") 
		$('#btn2').hide();
		$('#btn3').hide();
		$('#good').show();
		$('#home').append(
		'<button class="button-2" onclick="home1()">ホームに戻る'+'</button>'		
		)
			}
	})
		}else{
			alert("オリンピックペイがないです。")	
		}
	}else{
		alert("キャンセルしました。")
	}
}
		
	
	
	
	function buy1(){
		
	var paymethod = $(':radio[name="method"]:checked').val();	
 	var pay=$(':radio[name="buypay"]:checked').val(); 
	var username = "<%=session.getAttribute("username")%>";
	var email = "<%=session.getAttribute("email")%>";
	var tel = "<%=session.getAttribute("tel")%>";
	var userid = "<%=session.getAttribute("userid")%>";

		var IMP = window.IMP; // 省略可能
		IMP.init('imp54818213');
		// "識別コード"
		IMP.request_pay({
			pg : 'inicis', 
			pay_method : paymethod,
			/* 
			    'samsung':サムスンペイ, 
			    'card':カード, 
			    'phone':携帯決済 
			 */
			merchant_uid : 'merchant_' + new Date().getTime(),
			/* 
			    merchant_uid　購買番号
			 */
			name : "オリンピックペイ",
			//商品名
			amount : pay,
			//価額
			buyer_email : email,
			buyer_name : username,
			buyer_tel : tel,

		}, function(rsp) {
			console.log(rsp);
			if (rsp.success) {
				var msg = '決済が完了しました。.';
				msg += '固有ID : ' + rsp.imp_uid;
				msg += '商店 取引ID : ' + rsp.merchant_uid;
				msg += '決済 金額 : ' + rsp.paid_amount;
				msg += 'カード 承認番号 : ' + rsp.apply_num;
				$.ajax({
					url : "/olympic/member/amount",
					data : {
						"pay" : pay,
						"userid" : userid
					},
					type : "POST"
				})

				$.ajax({
					url : "/olympic/tiket/refund",
					data : {
						"imp_uid" : rsp.imp_uid,
						"merchant_uid" : rsp.merchant_uid,
						"paid_amount" : rsp.paid_amount,
						"applynum" : rsp.apply_num
					},
					type : "post"
				})

			} else {
				var msg = '決済に 失敗しました。.';
				msg += 'エラー内容 : ' + rsp.error_msg;
			}
			alert(msg);

		})
	}
	
	function buy3(){
		
		var paymethod = $(':radio[name="method"]:checked').val();	
		var username = "<%=session.getAttribute("username")%>";
		var amount = "${amount}";
		var email = "<%=session.getAttribute("email")%>";
		var tel = "<%=session.getAttribute("tel")%>";
		var userid = "<%=session.getAttribute("userid")%>";
		var sit = "${sit}";
		var play = "${play}";
		var sit = "${sit}";
		var sitlevel = "${sitlevel}";
		var playdate = "${playdate}"
		var IMP = window.IMP; // 생략가능
		IMP.init('imp54818213');
		// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드

		IMP.request_pay({
			pg : 'inicis', // version 1.1.0부터 지원.
			/* 
			    'kakao':카카오페이, 
			    html5_inicis':이니시스(웹표준결제)
			        'nice':나이스페이
			        'jtnet':제이티넷
			        'uplus':LG유플러스
			        'danal':다날
			        'payco':페이코
			        'syrup':시럽페이
			        'paypal':페이팔
			 */
			pay_method : paymethod,
			/* 
			    'samsung':삼성페이, 
			    'card':신용카드, 
			    'trans':실시간계좌이체,
			    'vbank':가상계좌,
			    'phone':휴대폰소액결제 
			 */
			merchant_uid : 'merchant_' + new Date().getTime(),
			/* 
			
			    merchant_uid에 경우 
			    https://docs.iamport.kr/implementation/payment
			    위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
			    참고하세요. 
			    나중에 포스팅 해볼게요.
			 */

			name : play + "  " + sitlevel + "  " + sit,
			//결제창에서 보여질 이름
			amount : amount,
			//가격 
			buyer_email : email,
			buyer_name : username,
			buyer_tel : tel,

			m_redirect_url : 'https://www.yourdomain.com/payments/complete'
		/*  
		    모바일 결제시,
		    결제가 끝나고 랜딩되는 URL을 지정 
		    (카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐) 
		 */
		}, function(rsp) {
			console.log(rsp);
			if (rsp.success) {
				var msg = '決済が完了しました。.';
				msg += '固有ID : ' + rsp.imp_uid;
				msg += '商店 取引ID : ' + rsp.merchant_uid;
				msg += '決済 金額 : ' + rsp.paid_amount;
				msg += 'カード 承認番号 : ' + rsp.apply_num;
				$.ajax({
					url : "/olympic/tiket/refund",
					data : {
						"imp_uid" : rsp.imp_uid,
						"merchant_uid" : rsp.merchant_uid,
						"paid_amount" : rsp.paid_amount,
						"applynum" : rsp.apply_num
					},
					type : "post"
				})

				$.ajax({
					url : "/olympic/member/tiket",
					type : "post",
					data : {
						"userid" : useridd,
						"amount" : amount,
						"play" : play,
						"sit" : sit,
						"sitlevel" : sitlevel,
						"stadium" : stadium,
						"playdate" : playdate
					},
					success : function() {
						$('#btn2').hide();
						$('#btn3').hide();
						$('#good').show();
						$('#home').append(
								'<button class="button-2" onclick="home1()">ホームに戻る'
										+ '</button>')
					}
				})

			} else {
				var msg = '決済に失敗しました。';
				msg += 'エラー内容 : ' + rsp.error_msg;
			}
			alert(msg);

		})
	}
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
							<a href="/olympic/loginForm">ログイン</a> &nbsp;&nbsp; <a
								href="/olympic/member/signupForm">会員登録</a>
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
							<li><a href="/olympic/member/mypage">Mypage</a></li>
							<li><a href="/olympic/chatting/chatpage">Broadcasting</a></li>
							<li class="last-item"><a href="/contacts">Contact Us</a></li>
						</ul>
					</nav>
				</div>
			</header>
			<!-- content -->
			<div class="ic">More Website Templates at TemplateMonster.com!</div>
			<section id="content">
				<div class="padding">
					<div class="wrapper p4">
						<div class="col-3">
							<div class="indent">
								<h2>Ticket</h2>
								<table id="playtable">

									<tr id="playtable">
										<td id="playtable" width="100">競技項目</td>
										<td id="playtable" width="100">座席レベル</td>
										<td id="playtable" width="100">座席</td>
										<td id="playtable" width="100">価額</td>
									</tr>

								</table>
								<table id="ticketinfo">


								</table>

								<br>
								<form action="/olympic/payment/buy" method="post">
									<div align="center">
										<input type="radio" name="method" value="card"
											checked="checked">カード <input type="radio"
											name="method" value="samsung">サムソンペイ <input
											type="radio" name="method" value="trans">実時間 口座振り込み <input
											type="radio" name="method" value="vbank">仮想口座 <input
											type="radio" name="method" value="phone">携帯決済
									</div>

									<br> <br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<input
										type="button" class="button-2" value="オリンピックペイで決済" id="btn2">
									<input type="button" class="button-2" value="決済" id="btn3">
									<br> <br> <br> <br>
								</form>
								<p id="good" hidden="">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;購入されました</p>
								<p id="home">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;</p>


								<hr />
								<br>
								<div id="text1">充電する</div>
								<br> <br>
								<form>
									<div align="center">
										<input type="radio" value="50000" name="buypay" id="tiket"
											checked="checked">50000ウォン <input type="radio"
											value="100000" name="buypay" id="tiket">100000ウォン <input
											type="radio" value="300000" name="buypay" id="tiket">300000ウォン
										<input type="radio" value="500000" name="buypay" id="tiket">500000ウォン
										<input type="radio" value="1000000" name="buypay" id="tiket">1000000ウォン
									</div>
								</form>
								<br> <br>

								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input align="center" type="button" value="オリンピックペイ充電" id="btn"
									class="button-2">
							</div>
						</div>
						<div class="col-4">
							<div class="block-news">
								<h3 class="color-4 p2"></h3>
								<div id="myinfo"></div>
								<a class="button-2" href="/olympic/member/infoForm">Update
									Information</a>
							</div>
						</div>
					</div>
					<div class="box-bgg">
						<div class="a1">

							<div class="box first">

								<h1 id="text2">保有チャット</h1>
							</div>



						</div>
						<hr>
						<table border="0">
							<tr>
								<td width="100">チャット番号</td>
								<td width="100">競技種目</td>
								<td width="100">競技日付</td>
								<td width="100">競技場</td>
								<td width="100">座席レベル</td>
								<td width="100">座席番号</td>
								<td width="100">予約日</td>
								<td width="100">価額</td>
							</tr>

						</table>
						<br>
						<table id="myticket">
						</table>
					</div>
				</div>
			</section>

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



		<!-- footer -->
		<footer>
			<div class="row-top">
				<div class="row-padding">
					<div class="wrapper">

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





</body>
</html>