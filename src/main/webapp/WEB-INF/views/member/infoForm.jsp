<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<link rel="shortcut icon" type="image/x-icon" href="resources/images/favicon.png" />
<link href="https://fonts.googleapis.com/css?family=Ranchers&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Poiret+One&display=swap" rel="stylesheet">
<script src="http://code.jquery.com/jquery-1.8.3.min.js "></script>
<script>
$(function(){
	var fom = $("#fom");
	$("#btn").click(function(){
		
		fom.submit();
		
		
		
	})
})


</script>


<body>
<h1>アカウント修正</h1>
<form action="/olympic/member/info" id="fom" method="post">
<table>
<tr>
	<td>アカウント</td>
	<td><input type="text"  value="${sessionScope.userid}" disabled="disabled"></td>
</tr>

<tr>
	<td>暗証番号</td>
	<td><input type="password" name="userpw" id="userpw"></td>
</tr>
<tr>
	<td>暗証番号確認</td>
	<td><input type="password2" id="userpw2"></td>
</tr>

<tr>
	<td>名前</td>
	<td><input type="text" name="username" id="username" value="${sessionScope.username}"></td>
</tr>

<tr>
	<td>メール</td>
	<td><input type="email" name="email" id="email" value="${sessionScope.email}"></td>
</tr>

<tr>
	<td>電話番号</td>
	<td><input type="number" name="tel" id="tel" value="${sessionScope.tel}"></td>
</tr>
</table>
<input type="hidden" value="${sessionScope.userid}" name="userid">
<input type="button" id="btn" value="修正する">
</form>
</body>
</html>