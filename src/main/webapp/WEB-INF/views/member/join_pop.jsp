<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>SESbank</title>
<link rel="stylesheet" type="text/css"
	href="/bank/resources/css/style.css" />
<script>
function closeFunc() {
	close();
}
function submitid(custid){
	opener.document.getElementById("custid").value= custid;
	close();

}

</script>
</head>

<body>
	<c:if test="${result == null }">
		<form action="/bank/member/checkid">
			<p class="list_btn">
				<input type="text" name="custid" id="custid" value="${custid}"
					class="wr_idcheck" /> <input type="submit" value="중복확인"
					onclick="check()"> <input type="button" id="btn" value="사용"
					> <input type="button"
					value="닫기" onclick="closeFunc()">
			</p>
		</form>

	</c:if>

	<div class="popwrap">
		<c:if test="${result == false }">
			<h2>ID중복확인</h2>
			<div style="display:;">
				[<span>${custid }</span>] 아이디는 사용가능합니다.
				<p class="list_btn">
					<a href="#" onclick="submitid('${custid}')">적용</a>
				</p>
			</div>
		</c:if>


		<div style="display:;">
			<c:if test="${result == true }">
					[<span>${custid }</span>] 아이디는 이미 사용중입니다.
						<form>
					<p class="list_btn">
						<input type="text" name="custid" id="custid" value="${custid}"
							class="wr_idcheck" /> <input type="submit" value="중복확인">
						<input type="button" id="btn" value="사용" onclick="submitid()"
							disabled="disabled"> <input type="button" value="닫기"
							onclick="closeFunc()">
					</p>
				</form>
			</c:if>

		</div>

	</div>


</body>

</html>