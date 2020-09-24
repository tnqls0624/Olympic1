<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="shortcut icon" type="image/x-icon" href="resources/images/favicon.png" />
<link rel="stylesheet" href="resources/css/chatcss.css">
<link href="https://fonts.googleapis.com/css?family=Ranchers&display=swap" rel="stylesheet">

<script src="resources/js/jquery-3.4.1.js"></script>
<script>
$(function(){
	loadtable();
})

function loadtable() {
	$.ajax({
		url:'loadtable',
		type:'get',
		data:{'day' : $('#day1').text()},
		dataType:'json',
		success:function(result){
			$(result).each(function(index, item){
				
			});
		},
		error:function(){alert("error")}
	});
}

</script>
</head>
<body>
<div>
	<div>
		<ul>
			<li><a href="gamepage">メイン</a></li>
			<li>競技</li>
			<li>チャット</li>
		</ul>
	</div>
	<div>
		<ul>
			<li>ログイン</li>	
			<li>会員登録</li>	
		</ul>
	</div>
</div>
<div>
	<table id="timetable" border="1">
		<tr><th id="day1">Day 1</th></tr>
	</table>
</div>
</body>
</html>