<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>403 Error</title>
</head>
<body>
	<h1>해당페이지의 권한이 없습니다</h1>
	<button type="button" onclick="location.href='${sessionScope.prevUrl}'">이전 페이지로</button>
</body>
</html>