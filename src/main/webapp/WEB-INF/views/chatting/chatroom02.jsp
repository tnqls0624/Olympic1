<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title></title>
<meta charset="utf-8">
<link rel="stylesheet" href="/olympic/resources/css/ie.css" type="text/css" media="screen">
<link rel="stylesheet" href="/olympic/resources/css/bootstrap.css">
<link rel="stylesheet" href="/olympic/resources/css/reset.css" type="text/css" media="screen">
<link rel="stylesheet" href="/olympic/resources/css/style.css" type="text/css" media="screen">
<link rel="stylesheet" href="/olympic/resources/css/layout.css" type="text/css" media="screen">
<link href="https://fonts.googleapis.com/css?family=Poiret+One&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Dancing+Script|Lobster+Two&display=swap" rel="stylesheet">


<script src="/olympic/resources/js/jquery-3.4.1.js"></script>
<script type="text/javascript" src="<c:url value="/resources/js/bootstrap.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/sockjs-0.3.4.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/youtube.js"/>"></script>

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


div.content{
	/* border:2px solid red; */
}
#data{
	overflow-y:scroll; 
	width:300px; 
	height:350px; 
	padding:4px; 
	border:1 solid #000000;
	background-color:#abdfff;
	/* margin:auto; */
}
#data::-webkit-scrollbar{
	width: 16px;
	background-color: #fff;
}
#data::-webkit-scrollbar-track
{
	 /* -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
	 border-radius: 10px; */
	 background-color: #fff;
}
#data::-webkit-scrollbar-track:hover {
    background-color:#f4f4f4
}
#data::-webkit-scrollbar-thumb
{
	 background-color:#babac0;
     border-radius:16px;
     border:5px solid #fff
}
#data::-webkit-scrollbar-thumb:hover {
    background-color:#a0a0a5;
    border:4px solid #f4f4f4
}

#youtube{
	width:480px;
	margin:auto; 
}
.entrancechat{
	background-color:#c9c9c9;
	color:black;
	float:center;
	text-align:center;
	margin:auto;
}
</style>
<!-- 팝업 css  -->
<style type="text/css">
 #pop{
	  width:300px; height:300px; background:#000000; color:#fff; 
	  position:absolute; top:10px; left:100px; text-align:center; 
	  border:2px solid #000;
   }
 #profiletable{
 	margin:auto;
 } 
 #photo{
	 width:100px;
	 height:100px;
	 object-fit: cover;
	 object-position: top;
	 border-radius: 50%;	
 } 
 .slider{
 	overflow:auto;
 }
</style>
<script type="text/javascript">
    $(document).ready(function() {
        $("#sendBtn").click(function() {
            sendMessage();
        });
        var playnum = "${play}";
        loadath(playnum);
    });
    var selector = "${play}"; //1야구 2농구
    
    var sock;
    //웸소켓을 지정한 url로 연결한다.
    sock = new SockJS("<c:url value="/echo1"/>");
    /* sock = new SockJS("http://218.146.39.132:8080/olympic/echo/"); */

    //자바스크립트 안에 function을 집어넣을 수 있음.
    //데이터가 나한테 전달되읐을 때 자동으로 실행되는 function
    sock.onmessage = onMessage;

    //데이터를 끊고싶을때 실행하는 메소드
    sock.onclose = onClose;

    sock.onopen = function(evt){
    	var conncheck = "8abdc9e7-674e-4161-b1ef-d3c3d6844da3";
        sock.send(conncheck);
    };
    
    function sendMessage() {
    	
        /*소켓으로 보내겠다.  */
        var message = $("#message").val();
        var id = $('#sessionid').val();
        if(message.length == 0) {
        	return;
        }
        //자기 화면 출력 메시지
        $('#data').append('<div style="color:black; float:right; background-color:#fdffcf; border-radius:10px 10px 10px 10px;">' + id + " : " + message + '</div></br>');
        sock.send(message);
    }
    //evt 파라미터는 웹소켓을 보내준 데이터다.(자동으로 들어옴)
    function onMessage(evt) {
        var data = evt.data;
        var userid = $("#sessionid").val();
        
        //메세지 출력
        var idsplit = data.split(' : ');
        if(idsplit[0] == userid){
        } else {
        	/* $("#data").append(data + "<br/>"); */
        	$("#data").append('<div style="color:black; float:left; background-color:#fff4e8; border-radius:10px 10px 10px 10px;">' + data + '</div><br/>');
        }
        //sock.close();
        
        //스크롤 자동 내리기
        $("#data").scrollTop($("#data")[0].scrollHeight);
        
        //메시지란 내용 삭제
        $("#message").val("");
    }

    function onClose(evt) {
    	var conncheck = "3aa12a98-9ea1-4434-8a6f-fd475552d5ef";
        sock.send(conncheck);
        
        $("#data").append("エラー");
    }
    
	function enterkey() {
		if(window.event.keyCode == 13) {
			 sendMessage();
		}
	}
	
	function addlist() {
		$.ajax({
			url : "addlist",
			type : "post",
			dataType : "json",
			success : function(list){
				$(list).each(function(index, item){
					$("#list").append("<b>" + item.userid + "</b><br>");
				});
			},
			error : function(){alert("エラー")}
		})
	}
	
	function loadath(playnum) {
		$.ajax({
			url:"loadath",
			type:"post",
			dataType:"json",
			data:{"playnum":playnum},
			success:function(list){
				$('#list').append('<h2 style="color:black">選手項目</h2>');
				$(list).each(function(index, item){
					$('#list').append('<a href="#" onclick="loadinfo(\'' + item.athlete + '\',\'' + playnum + '\')">' + item.athlete +'</a></br>');
				});
			},
			error : function(){alert("エラー")}
		})
	}
	
	function popclose() {
		$('#pop').remove();
	}
	
</script>
<script type="text/javascript">
    $(document).ready(function() {
      $('#close').click(function() {
        $('#pop').hide();
      });
    });
    function loadinfo(bname, selector) {
    	popclose();
    	$.ajax({
    		url:"loadsite",
    		type:"post",
    		data:{"bname" : bname, "playnum" : selector},
    		dataType:"json",
    		success:function(result){
    			$('#popathlete').append(
    				'<div id="pop">'
    					+ '<h4>' + bname + '</h4>'
	    					+ '<img src=' + result.img + ' id="photo" />'
	    					+ '<div style="height:20px"></div>'
	    					+ '<table border="1" id="profiletable">'
	    					+ '<tr><td align="left" style="width:80px">Sport</td><td align="left">' + result.sport + '</td><tr>'
	    					+ '<tr><td align="left">Country</td><td align="left">' + result.country + '</td><tr>'
	    					+ '<tr><td align="left">Born</td><td align="left">' + result.born + '</td><tr>'
    					+ '</table>'
    					+ '<div style="height:20px;"></div>'
    					+ '<button id="popclosebtn" class="btn btn-outline-light" onclick="popclose()">Close</button>' 
    				+ '</div>'	
    			)
    		},
    		error:function(){alert("エラー")}
    	});
    	
    }
 </script>
<![endif]-->
</head>
<body id="page1">
<!-- header -->
	<div class="bg">
		<div class="main">
			<header>
				<div class="row-1">
						<a1 class="logo" href="/olympic/">Tokyo Olympic Ticketing Site</a>
					<!-- 	<strong class="slog">Welcome to Our Site!</strong> -->
					</h1>
					<c:if test="${sessionScope.userid == null }">

						<div align="right">
							<a href="/olympic/member/loginForm">ログイン</a> &nbsp;&nbsp; <a
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
						  <li><a href="/olympic/member/ticketting">Ticketing</a></li>
						  <li><a href="/olympic/mypage">Mypage</a></li>
						  <li><a class="active" href="/olympic/chatting/chatpage">Broadcasting</a></li>
						  <li class="last-item"><a href="/olympic/contacts">Contact Us</a></li>
						</ul>
					</nav>
				</div>
				<div class="row-3">
					<input type="hidden" id="sessionid" value="${sessionScope.userid }" >
					<div class="slider-wrapper">
						<div class="slider">
							<div style="float:left;">
								<div class="content" id="list" style="float:left; width:150px"></div>
							</div>
							<div style="float:left;">
								<!-- <iframe width="430" height="400" src="https://www.youtube.com/embed/U_sYIKWhJvk" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe> -->
								<div id="player"></div>
							</div>
							<div style="float:right;">
								<table id="table" border="1">
									<tr><td colspan="2">
								    	<div id="data"></div>
								    </td></tr>
							    	<tr>
								    	<td>
									    	<input type="text" id="message" onkeyup="enterkey()" style="height:35px; width:243px" />
									    </td>
									    <td>
								    		<input type="button" id="sendBtn" class="btn btn-dark" value="転送" />
								   		</td>
								    </tr>
								  </table>
							</div>
						</div>
							
					    <div id="popathlete">
					    </div>
					</div>
				</div>
			</header>
<!-- content --><div class="ic"></div>
			

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
											東京オリンピックで知っておくべきこと</a></td>
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
