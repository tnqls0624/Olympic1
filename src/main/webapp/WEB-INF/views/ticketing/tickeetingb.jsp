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
  position: relative;
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
  background: #FFFF66;
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
  background: #3399FF;
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
							if(p == item.sit && item.sitlevel =="B" && item.play == "BASEBALL"){
							
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
    			"play" : "BASEBALL"
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
		 location.href="/olympic/member/buyticket?sitlevel="+ $('#sitlevel').val() + "&amount=" + pri + "&play=BASEBALL"+"&sit="+items+"&stadium="+"${vo.stadium}"+"&playdate="+"${vo.playdate}";
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
<li class="seat">
<input type="checkbox" name="row1" class="a" value="1A" id="1A"/>
<label for="1A">1A</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class="a" value="1B" id="1B"/>
<label for="1B">1B</label>
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
<li class="seat">
<input type="checkbox" name="row1" value="1I" class="a" id="1I"/>
<label for="1I">1I</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" value="1J" class="a" id="1J"/>
<label for="1J">1J</label>
</li>
</ol>
<li class="row row--2">
<ol class="seats" type="A">
<li class="seat">
<input type="checkbox" name="row1" class="a" value="2A" id="2A" />
<label for="2A">2A</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class="a" value="2B" id="2B" />
<label for="2B">2B</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class = "a" class="a" value="2C" id="2C" />
<label for="2C">2C</label>
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
<li class="seat">
<input type="checkbox" name="row1" class = "a" value="2H" id="2H"/>
<label for="2H">2H</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class = "a" value="2I" id="2I"/>
<label for="2I">2I</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class = "a" value="2J" id="2J"/>
<label for="2J">2J</label>
</li>
</ol>
</li>
<li class="row row--3">
<ol class="seats" type="A">
<li class="seat">
<input type="checkbox" name="row1" class = "a" value="3A" id="3A" />
<label for="3A">3A</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class = "a" value="3B" id="3B" />
<label for="3B">3B</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class = "a" value="3C" id="3C" />
<label for="3C">3C</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class = "a" value="3D" id="3D"/>
<label for="3D">3D</label>
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
<input type="checkbox" name="row1" class = "a" value="3G" id="3G"/>
<label for="3G">3G</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class = "a" value="3H" id="3H"/>
<label for="3H">3H</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class = "a" value="3I" id="3I"/>
<label for="3I">3I</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class = "a" value="3J" id="3J"/>
<label for="3J">3J</label>
</li>
</ol>
</li>
<li class="row row--4">
<ol class="seats" type="A">
<li class="seat">
<input type="checkbox" name="row1" class = "a" value="4A" id="4A"/>
<label for="4A">4A</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class = "a" value="4B" id="4B"/>
<label for="4B">4B</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class = "a" value="4C" id="4C"/>
<label for="4C">4C</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class = "a" value="4D" id="4D"/>
<label for="4D">4D</label>
</li>
<li class="shit">
<img src="/olympic/resources/images/void.png">
<label for="11"></label>
</li><li class="shit">
<img src="/olympic/resources/images/void.png">
<label for="11"></label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class = "a" value="4G" id="4G"/>
<label for="4G">4G</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class = "a" value="4H" id="4H"/>
<label for="4H">4H</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class = "a" value="4I" id="4I"/>
<label for="4I">4I</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class = "a" value="4J" id="4J"/>
<label for="4J">4J</label>
</li>
</ol>
</li>
<li class="row row--5">
<ol class="seats" type="A">
<li class="seat">
<input type="checkbox" name="row1" class = "a" value="5A" id="5A"/>
<label for="5A">5A</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class = "a" value="5B" id="5B"/>
<label for="5B">5B</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class = "a" value="5C" id="5C"/>
<label for="5C">5C</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class = "a" value="5D" id="5D"/>
<label for="5D">5D</label>
</li>
<li class="shit">
<img src="/olympic/resources/images/void.png">
<label for="11"></label>
</li><li class="shit">
<img src="/olympic/resources/images/void.png">
<label for="11"></label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class = "a" value="5G" id="5G"/>
<label for="5G">5G</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class = "a" value="5H" id="5H"/>
<label for="5H">5H</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class = "a" value="5I" id="5I"/>
<label for="5I">5I</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class = "a" value="5J" id="5J"/>
<label for="5J">5J</label>
</li>
</ol>
</li>
<li class="row row--6">
<ol class="seats" type="A">
<li class="seat">
<input type="checkbox" name="row1" class = "a" value="6A" id="6A"/>
<label for="6A">6A</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class = "a" value="6B" id="6B"/>
<label for="6B">6B</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class = "a" value="6C" id="6C"/>
<label for="6C">6C</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class = "a" value="6D" id="6D"/>
<label for="6D">6D</label>
</li>
<li class="shit">
<img src="/olympic/resources/images/void.png">
<label for="11"></label>
</li><li class="shit">
<img src="/olympic/resources/images/void.png">
<label for="11"></label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class = "a" value="6G" id="6G"/>
<label for="6G">6G</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class = "a" value="6H" id="6H"/>
<label for="6H">6H</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class = "a" value="6I" id="6I"/>
<label for="6I">6I</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class = "a" value="6J" id="6J"/>
<label for="6J">6J</label>
</li>
</ol>
</li>
<li class="row row--7">
<ol class="seats" type="A">
<li class="seat">
<input type="checkbox" name="row1" class = "a" value="7A" id="7A"/>
<label for="7A">7A</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class = "a" value="7B" id="7B"/>
<label for="7B">7B</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class = "a" value="7C" id="7C"/>
<label for="7C">7C</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class = "a" value="7D" id="7D"/>
<label for="7D">7D</label>
</li>
<li class="shit">
<img src="/olympic/resources/images/void.png">
<label for="11"></label>
</li><li class="shit">
<img src="/olympic/resources/images/void.png">
<label for="11"></label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class = "a" value="7G" id="7G"/>
<label for="7G">7G</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class = "a" value="7H" id="7H"/>
<label for="7H">7H</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class = "a" value="7I" id="7I"/>
<label for="7I">7I</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class = "a" value="7J" id="7J"/>
<label for="7J">7J</label>
</li>
</ol>
</li>
<li class="row row--8">
<ol class="seats" type="A">
<li class="seat">
<input type="checkbox" name="row1" class = "a" value="8A" id="8A"/>
<label for="8A">8A</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class = "a" value="8B" id="8B"/>
<label for="8B">8B</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class = "a" value="8C" id="8C"/>
<label for="8C">8C</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class = "a" value="8D" id="8D"/>
<label for="8D">8D</label>
</li>
<li class="shit">
<img src="/olympic/resources/images/void.png">
<label for="11"></label>
</li><li class="shit">
<img src="/olympic/resources/images/void.png">
<label for="11"></label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class = "a" value="8G" id="8G"/>
<label for="8G">8G</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class = "a" value="8H" id="8H"/>
<label for="8H">8H</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class = "a" value="8I" id="8I"/>
<label for="8I">8I</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class = "a" value="8J" id="8J"/>
<label for="8J">8J</label>
</li>
</ol>
</li>
<li class="row row--9">
<ol class="seats" type="A">
<li class="seat">
<input type="checkbox" name="row1" class = "a" value="9A" id="9A"/>
<label for="9A">9A</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class = "a" value="9B" id="9B"/>
<label for="9B">9B</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class = "a" value="9C" id="9C"/>
<label for="9C">9C</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class = "a" value="9D" id="9D"/>
<label for="9D">9D</label>
</li>
<li class="shit">
<img src="/olympic/resources/images/void.png">
<label for="11"></label>
</li><li class="shit">
<img src="/olympic/resources/images/void.png">
<label for="11"></label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class = "a" value="9G" id="9G"/>
<label for="9G">9G</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class = "a" value="9H" id="9H"/>
<label for="9H">9H</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class = "a" value="9I" id="9I"/>
<label for="9I">9I</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class = "a" value="9J" id="9J"/>
<label for="9J">9J</label>
</li>
</ol>
</li>
<li class="row row--10">
<ol class="seats" type="A">
<li class="seat">
<input type="checkbox" name="row1" class = "a" value="10A" id="10A"/>
<label for="10A">10A</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class = "a" value="10B" id="10B"/>
<label for="10B">10B</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class = "a" value="10C" id="10C"/>
<label for="10C">10C</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class = "a" value="10D" id="10D"/>
<label for="10D">10D</label>
</li>
<li class="shit">
<img src="/olympic/resources/images/void.png">
<label for="11"></label>
</li><li class="shit">
<img src="/olympic/resources/images/void.png">
<label for="11"></label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class = "a" value="10G" id="10G"/>
<label for="10G">10G</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class = "a" value="10H" id="10H"/>
<label for="10H">10H</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class = "a" value="10I" id="10I"/>
<label for="10I">10I</label>
</li>
<li class="seat">
<input type="checkbox" name="row1" class = "a" value="10J" id="10J"/>
<label for="10J">10J</label>
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