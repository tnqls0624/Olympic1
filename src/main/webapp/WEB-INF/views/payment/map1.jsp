<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title></title>
<meta charset="utf-8">
 <meta http-equiv="X-UA-Compatible" content="IE=edge"> 
 <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"> 
 <link rel="shortcut icon" type="image/x-icon" href="../resources/images/favicon.png" />
<link rel="stylesheet" href="/olympic/resources/css/reset.css" type="text/css" media="screen">
<link rel="stylesheet" href="/olympic/resources/css/style.css" type="text/css" media="screen">
<link rel="stylesheet" href="/olympic/resources/css/layout.css" type="text/css" media="screen">
<link href="https://fonts.googleapis.com/css?family=Poiret+One&display=swap" rel="stylesheet">
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

<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>



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
.imgs{
	height:450px;
}
img{
	position: absolute; top:0; left:0;
	width:100%;
	height:100%;
	  /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
       }
      #map {
         height: 400px;  /* The height is 400 pixels */

        width: 100%;  /* The width is the width of the web page */
      }
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
					</h1>
					<c:if test="${sessionScope.userid == null }">

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
						  <li class="last-item"><a href="/contacts">Contact Us</a></li>
						</ul>
					</nav>
				</div>
				<div class="row-3">
					<div class="slider-wrapper">
						<div class="slider" >
						 <div id="map"></div>
						
						 
						  
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
						</div>
					</div>
				</div>
				
			</footer>
 <script>
   

    	var map;
        function initMap() {
        	  var uluru = {lat: 35.623515, lng: 139.776979};

        	  // The map, centered at Uluru

        	  var map = new google.maps.Map(

        	      document.getElementById('map'), {zoom: 15, center: uluru});

        	  // The marker, positioned at Uluru

        	  var marker = new google.maps.Marker({position: uluru, map: map});
        }
    	
    	
</script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBw5k8KHqOMUPkRHtavLN8ahgfVyfjya18&callback=initMap"
  type="text/javascript"></script>
	<script type="text/javascript"> Cufon.now(); </script>
	<script type="text/javascript">
		$(function(){
			$('.slider')._TMS({
				prevBu:'.prev',
				nextBu:'.next',
				playBu:'.play',
				duration:800,
				easing:'easeOutQuad',
				preset:'simpleFade',
				pagination:false,
				slideshow:3000,
				numStatus:false,
				pauseOnHover:true,
				banners:true,
				waitBannerAnimation:false,
				bannerShow:function(banner){
					banner
						.hide()
						.fadeIn(500)
				},
				bannerHide:function(banner){
					banner
						.show()
						.fadeOut(500)
				}
			});
		})
	</script>
</body>
</html>
