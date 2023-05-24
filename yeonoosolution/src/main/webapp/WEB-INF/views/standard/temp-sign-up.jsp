<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>임시 회원가입</h1>
	<form action="/v1/standard/member" method="POST">
		<input type="text" name="companyCode" value="company1">
		<input type="text" name="memberId" value="adimin@yeonoo.com">
		<input type="password" name="password" value="1">
		<button type="submit">가입</button>
	</form>

</body>
</html>