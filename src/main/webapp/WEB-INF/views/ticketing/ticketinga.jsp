<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="/olympic/resources/images/favicon.png" />
<link rel="stylesheet" href="/olympic/resources/css/seat.css" type="text/css" >
<script type="text/javascript" src="/olympic/resources/js/jquery-1.6.min.js"></script>
<title>ticketing</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js" type="text/javascript"></script>
<meta name="viewport" content="width=device-width">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<style> 
 *, *:before, *:after {
  box-sizing: border-box;
}

html {
  font-size: 16px;
}

.plane {
  margin: 20px auto;
  max-width: 300px;
}

.cockpit {
  height: 250px;
  position: relative;
  overflow: hidden;
  text-align: center;
  border-bottom: 5px solid #d8d8d8;
}
.cockpit:before {
  content: "";
  display: block;
  position: absolute;
  top: 0;
  left: 0;
  height: 500px;
  width: 100%;
  border-radius: 50%;
  border-right: 5px solid #d8d8d8;
  border-left: 5px solid #d8d8d8;
}
.cockpit h1 {
  width: 60%;
  margin: 100px auto 35px auto;
}

.exit {
  position: relative;
  height: 50px;
}
.exit:before, .exit:after {
  content: "EXIT";
  font-size: 14px;
  line-height: 18px;
  padding: 0px 2px;
  font-family: "Arial Narrow", Arial, sans-serif;
  display: block;
  position: absolute;
  background: green;
  color: white;
  top: 50%;
  transform: translate(0, -50%);
}
.exit:before {
  left: 0;
}
.exit:after {
  right: 0;
}

.fuselage {
  border-right: 5px solid #d8d8d8;
  border-left: 5px solid #d8d8d8;
}

ol {
  list-style: none;
  padding: 0;
  margin: 0;
}

.seats {
  display: flex;
  flex-direction: row;
  justify-content: flex-start;
}

.seat {
  display: flex;
  flex: 0 0 14.28571428571429%;
  padding: 5px;
  po
  sition: relative;
}
.seat:nth-child(3) {
  margin-right: 0;
}

.shit {
  display: flex;
  flex: 0 0 14.28571428571429%  ;
  padding: 5px;
  position: relative;
  background: #ffffff;
  text-indent: -9999px;
  overflow: hidden;
  height: 20%;
}

.shit label {
  display: block;
  position: relative;
  width: 100%;
  height: 20%;
  text-align: center;
  font-size: 14px;
  font-weight: bold;
  line-height: 1.5rem;
  padding: 4px 0;
  background: #F42536;
  border-radius: 5px;
  animation-duration: 300ms;
  animation-fill-mode: both;
}

.seat input[type=checkbox] {
  position: absolute;
  opacity: 0;
}
.seat input[type=checkbox]:checked + label {
  background: #bada55;
  -webkit-animation-name: rubberBand;
  animation-name: rubberBand;
  animation-duration: 300ms;
  animation-fill-mode: both;
}
.seat input[type=checkbox]:disabled + label {
  background: #dddddd;
  text-indent: -9999px;
  overflow: hidden;
}
.seat input[type=checkbox]:disabled + label:after {
  content: "X";
  text-indent: 0;
  position: absolute;
  top: 4px;
  left: 50%;
  transform: translate(-50%, 0%);
}
.seat input[type=checkbox]:disabled + label:hover {
  box-shadow: none;
  cursor: not-allowed;
}
.seat label {
  display: block;
  position: relative;
  width: 100%;
  text-align: center;
  font-size: 14px;
  font-weight: bold;
  line-height: 1.5rem;
  padding: 4px 0;
  background: #F42536;
  border-radius: 5px;
  animation-duration: 300ms;
  animation-fill-mode: both;
}
.seat label:before {
  content: "";
  position: absolute;
  width: 75%;
  height: 75%;
  top: 1px;
  left: 50%;
  transform: translate(-50%, 0%);
  background: rgba(255, 255, 255, 0.4);
  border-radius: 3px;
}
.seat label:hover {
  cursor: pointer;
  box-shadow: 0 0 0px 2px #5C6AFF;
}

@-webkit-keyframes rubberBand {
  0% {
    -webkit-transform: scale3d(1, 1, 1);
    transform: scale3d(1, 1, 1);
  }
  30% {
    -webkit-transform: scale3d(1.25, 0.75, 1);
    transform: scale3d(1.25, 0.75, 1);
  }
  40% {
    -webkit-transform: scale3d(0.75, 1.25, 1);
    transform: scale3d(0.75, 1.25, 1);
  }
  50% {
    -webkit-transform: scale3d(1.15, 0.85, 1);
    transform: scale3d(1.15, 0.85, 1);
  }
  65% {
    -webkit-transform: scale3d(0.95, 1.05, 1);
    transform: scale3d(0.95, 1.05, 1);
  }
  75% {
    -webkit-transform: scale3d(1.05, 0.95, 1);
    transform: scale3d(1.05, 0.95, 1);
  }
  100% {
    -webkit-transform: scale3d(1, 1, 1);
    transform: scale3d(1, 1, 1);
  }
}
@keyframes rubberBand {
  0% {
    -webkit-transform: scale3d(1, 1, 1);
    transform: scale3d(1, 1, 1);
  }
  30% {
    -webkit-transform: scale3d(1.25, 0.75, 1);
    transform: scale3d(1.25, 0.75, 1);
  }
  40% {
    -webkit-transform: scale3d(0.75, 1.25, 1);
    transform: scale3d(0.75, 1.25, 1);
  }
  50% {
    -webkit-transform: scale3d(1.15, 0.85, 1);
    transform: scale3d(1.15, 0.85, 1);
  }
  65% {
    -webkit-transform: scale3d(0.95, 1.05, 1);
    transform: scale3d(0.95, 1.05, 1);
  }
  75% {
    -webkit-transform: scale3d(1.05, 0.95, 1);
    transform: scale3d(1.05, 0.95, 1);
  }
  100% {
    -webkit-transform: scale3d(1, 1, 1);
    transform: scale3d(1, 1, 1);
  }
}
.rubberBand {
  -webkit-animation-name: rubberBand;
  animation-name: rubberBand;
}
</style>

<script>
  window.console = window.console || function(t) {};
</script>
<script>
	$(function(){
		var useridd = "<%=session.getAttribute("userid")%>";
		  
		  
		  
		$.ajax({
			url: "/olympic/tiket/searchseat",
			type: "POST",
			success:function(result){
				
				var items = [];
				  $('.a').attr("checked" , false).each(function (){
					  items.push($(this).val());
					  var p = $(this).val();
											  
					  $(result).each(function(index , item){
							if(p == item.sit  && item.sitlevel =="A" && item.play == "BASKETBALL"){
							
								$('#'+p).prop("disabled", true);
							}
				  })
				
					
					
					
				})
				
			}})
		})


  if (document.location.search.match(/type=embed/gi)) {
    window.parent.postMessage("resize", "*");
  }
 
  $(function(){
	  
	var pri = 0
	var items = [];
	  
  })
	
	$(document).ready(function(){
    $(".seat").change(function(){
    	$.ajax({
    		url:"/olympic/tiket/seatinfo",
    		type:"POST",
    		data:{ "sitlevel" : $('#sitlevel').val(),
    			"play" : "BASKETBALL"
    			},
    		success:function(result){
    				var items = [];
    				  $('input:checkbox[type=checkbox]:checked').each(function () {
    			      items.push($(this).val());
    				  });
    				var num = $("input:checkbox[name='row1']:checked").length;
    				
    				$(".info").empty();
    				$(".info").append(
    				'&nbsp;play : '+result.play+'<br>'+	
    				'&nbsp;seat : '+ items  + '<br>'+
    				'&nbsp;price : ' + result.price * num + '<br>')
    				pri = result.price * num 
    				
    		}
    	})
    });
});
  var c;
	 function purchase(){
		 var items = [];
		 
		  $('input:checkbox[type=checkbox]:checked').each(function () {
		      items.push($(this).val());
		  });
		 location.href="/olympic/member/buyticket?sitlevel="+ $('#sitlevel').val() + "&amount=" + pri + "&play=BASKETBALL"+"&sit="+items+"&stadium="+"${vo.stadium}"+"&playdate="+"${vo.playdate}";
	 }
</script>
</head>
<body translate="no">
<div class="plane">
	<div>
<h1>座席選択</h1>
</div>
<div>
</div>
<ol>
<li class="row row--1">
<ol class="seats" type="A">
<li class="shit">
<img src="/olympic/resources/images/void.png">
<label for="11"></label>
</li>
<li class="shit">
<img src="/olympic/resources/images/void.png">
<label for="11"></label>
</li>
<li class="shit">
<img src="/olympic/resources/images/void.png">
<label for="11"></label>
</li>
<li class="shit">
<img src="/olympic/resources/images/void.png">
<label for="11"></label>
</li>
<li class="shit">
<img src="/olympic/resources/images/void.png">
<label for="11"></label>
</li>
<li class="shit">
<img src="/olympic/resources/images/void.png">
<label for="11"></label>
</li>
<li class="shit">
<img src="/olympic/resources/images/void.png">
<label for="11"></label>
</li>
<li class="shit">
<img src="/olympic/resources/images/void.png">
<label for="11"></label>
</li>
<li class="shit">
<img src="/olympic/resources/images/void.png">
<label for="11"></label>
</li>
<li class="shit">
<img src="/olympic/resources/images/void.png">
<label for="11"></label>
</li>
</ol>
<li class="row row--2">
<ol class="seats" type="A">
<li class="seat">
<li class="shit">
<img src="/olympic/resources/images/void.png">
<label for="11"></label>
</li>
<li class="shit">
<img src="/olympic/resources/images/void.png">
<label for="11"></label>
</li>
<li class="shit">
<img src="/olympic/resources/images/void.png">
<label for="11"></label>
</li>
<li class="shit">
<img src="/olympic/resources/images/void.png">
<label for="11"></label>
</li>
<li class="shit">
<img src="/olympic/resources/images/void.png">
<label for="11"></label>
</li>
<li class="shit">
<img src="/olympic/resources/images/void.png">
<label for="11"></label>
</li>
<li class="shit">
<img src="/olympic/resources/images/void.png">
<label for="11"></label>
</li>
<li class="shit">
<img src="/olympic/resources/images/void.png">
<label for="11"></label>
</li>
<li class="shit">
<img src="/olympic/resources/images/void.png">
<label for="11"></label>
</li>
</ol>
</li>
<li class="row row--3">
<ol class="seats" type="A">
<li class="shit">
<img src="/olympic/resources/images/void.png">
<label for="11"></label>
</li>
<li class="shit">
<img src="/olympic/resources/images/void.png">
<label for="11"></label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class="a" value="3C" id="3C"/>
<label for="3C">3C</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class="a" value="3D" id="3D"/>
<label for="3D">3D</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class="a" value="3E" id="3E"/>
<label for="3E">3E</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class="a" value="3F" id="3F"/>
<label for="3F">3F</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class="a" value="3G" id="3G"/>
<label for="3G">3G</label>
</li>
<li class="shit">
<img src="/olympic/resources/images/void.png">
<label for="11"></label>
</li>
<li class="shit">
<img src="/olympic/resources/images/void.png">
<label for="11"></label>
</li>
</ol>
</li>
<li class="row row--4">
<ol class="seats" type="A">
<li class="shit">
<img src="/olympic/resources/images/void.png">
<label for="11"></label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class="a" value="4B" id="4B"/>
<label for="4B">4B</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class="a" value="4C" id="4C"/>
<label for="4C">4C</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class="a" value="4D" id="4D"/>
<label for="4D">4D</label>
</li>
 <li class="seat">
<input type="checkbox" name="row1" class="a" value="4E" id="4E"/>
<label for="4E">4E</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class="a" value="4F" id="4F"/>
<label for="4F">4F</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class="a" value="4G" id="4G"/>
<label for="4G">4G</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class="a" value="4H" id="4H"/>
<label for="4H">4H</label>
</li>
<li class="shit">
<img src="/olympic/resources/images/void.png">
<label for="11"></label>
</li>
</ol>
</li>
<li class="row row--5">
<ol class="seats" type="A">
<li class="shit">
<img src="/olympic/resources/images/void.png">
<label for="11"></label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class="a" value="5B" id="5B"/>
<label for="5B">5B</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class="a" value="5C" id="5C"/>
<label for="5C">5C</label>
</li>
<li class="shit">
<img src="/olympic/resources/images/void.png">
<label for="11"></label>
</li>
<li class="shit">
<img src="/olympic/resources/images/void.png">
<label for="11"></label>
</li>
<li class="shit">
<img src="/olympic/resources/images/void.png">
<label for="11"></label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class="a" value="5G" id="5G"/>
<label for="5G">5G</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class="a" value="5H" id="5H"/>
<label for="5H">5H</label>
</li>
<li class="shit">
<img src="/olympic/resources/images/void.png">
<label for="11"></label>
</li>
</ol>
</li>
<li class="row row--6">
<ol class="seats" type="A">
<li class="shit">
<img src="/olympic/resources/images/void.png">
<label for="11"></label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class="a" value="6B" id="6B"/>
<label for="6B">6B</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class="a" value="6C" id="6C"/>
<label for="6C">6C</label>
</li>
<li class="shit">
<img src="/olympic/resources/images/void.png">
<label for="11"></label>
</li>
<li class="shit">
<img src="/olympic/resources/images/void.png">
<label for="11"></label>
</li>
<li class="shit">
<img src="/olympic/resources/images/void.png">
<label for="11"></label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class="a" value="6G" id="6G"/>
<label for="6G">6G</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class="a" value="6H" id="6H"/>
<label for="6H">6H</label>
</li>
<li class="shit">
<img src="/olympic/resources/images/void.png">
<label for="11"></label>
</li>
</ol>
</li>
<li class="row row--7">
<ol class="seats" type="A">
<li class="shit">
<img src="/olympic/resources/images/void.png">
<label for="11"></label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class="a" value="7B" id="7B"/>
<label for="7B">7B</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class="a" value="7C" id="7C"/>
<label for="7C">7C</label>
</li>
<li class="shit">
<img src="/olympic/resources/images/void.png">
<label for="11"></label>
</li>
<li class="shit">
<img src="/olympic/resources/images/void.png">
<label for="11"></label>
</li>
<li class="shit">
<img src="/olympic/resources/images/void.png">
<label for="11"></label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class="a" value="7G" id="7G"/>
<label for="7G">7G</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class="a" value="7H" id="7H"/>
<label for="7H">7H</label>
</li>
<li class="shit">
<img src="/olympic/resources/images/void.png">
<label for="11"></label>
</li>
</ol>
</li>
<li class="row row--8">
<ol class="seats" type="A">
<li class="shit">
<img src="/olympic/resources/images/void.png">
<label for="11"></label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class="a" value="8B" id="8B"/>
<label for="8B">8B</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class="a" value="8C" id="8C"/>
<label for="8C">8C</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class="a" value="8D" id="8D"/>
<label for="8D">8D</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class="a" value="8E" id="8E"/>
<label for="8E">8E</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class="a" value="8F" id="8F"/>
<label for="8F">8F</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class="a" value="8G" id="8G"/>
<label for="8G">8G</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class="a" value="8H" id="8H"/>
<label for="8H">8H</label>
</li>
<li class="shit">
<img src="/olympic/resources/images/void.png">
<label for="11"></label>
</li>
</ol>
</li>
<li class="row row--9">
<ol class="seats" type="A">
<li class="shit">
<img src="/olympic/resources/images/void.png">
<label for="11"></label>
</li>
<li class="shit">
<img src="/olympic/resources/images/void.png">
<label for="11"></label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class="a" value="9C" id="9C"/>
<label for="9C">9C</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class="a" value="9D" id="9D"/>
<label for="9D">9D</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class="a" value="9E" id="9E"/>
<label for="9E">9E</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class="a" value="9F" id="9F"/>
<label for="9F">9F</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class="a" value="9G" id="9G"/>
<label for="9G">9G</label>
</li>
<li class="shit">
<img src="/olympic/resources/images/void.png">
<label for="11"></label>
</li>
<li class="shit">
<img src="/olympic/resources/images/void.png">
<label for="11"></label>
</li>
</ol>
</li>
<li class="row row--10">
<ol class="seats" type="A">
<li class="shit">
<img src="/olympic/resources/images/void.png">
<label for="11"></label>
</li>
<li class="shit">
<img src="/olympic/resources/images/void.png">
<label for="11"></label>
</li>
<li class="shit">
<img src="/olympic/resources/images/void.png">
<label for="11"></label>
</li>
<li class="shit">
<img src="/olympic/resources/images/void.png">
<label for="11"></label>
</li>
<li class="shit">
<img src="/olympic/resources/images/void.png">
<label for="11"></label>
</li>
<li class="shit">
<img src="/olympic/resources/images/void.png">
<label for="11"></label>
</li>
<li class="shit">
<img src="/olympic/resources/images/void.png">
<label for="11"></label>
</li>
<li class="shit">
<img src="/olympic/resources/images/void.png">
<label for="11"></label>
</li>
<li class="shit">
<img src="/olympic/resources/images/void.png">
<label for="11"></label>
</li>
</ol>
</li>
</ol>
<div>
</div>
<br/>
<div class="info">

</div>
<input type="button" value="購入" onclick="purchase()">
</div>
<input type="hidden" id="sitlevel" value="${vo.sitlevel }">
<script src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
</body>
</html>