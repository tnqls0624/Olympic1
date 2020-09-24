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
					class="wr_idcheck" /> <input type="submit" value="�ߺ�Ȯ��"
					onclick="check()"> <input type="button" id="btn" value="���"
					> <input type="button"
					value="�ݱ�" onclick="closeFunc()">
			</p>
		</form>

	</c:if>

	<div class="popwrap">
		<c:if test="${result == false }">
			<h2>ID�ߺ�Ȯ��</h2>
			<div style="display:;">
				[<span>${custid }</span>] ���̵�� ��밡���մϴ�.
				<p class="list_btn">
					<a href="#" onclick="submitid('${custid}')">����</a>
				</p>
			</div>
		</c:if>


		<div style="display:;">
			<c:if test="${result == true }">
					[<span>${custid }</span>] ���̵�� �̹� ������Դϴ�.
						<form>
					<p class="list_btn">
						<input type="text" name="custid" id="custid" value="${custid}"
							class="wr_idcheck" /> <input type="submit" value="�ߺ�Ȯ��">
						<input type="button" id="btn" value="���" onclick="submitid()"
							disabled="disabled"> <input type="button" value="�ݱ�"
							onclick="closeFunc()">
					</p>
				</form>
			</c:if>

		</div>

	</div>


</body>

</html>