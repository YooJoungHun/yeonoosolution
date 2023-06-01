<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>403 Error</title>
<link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/sign-in/">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
@import url('https://fonts.googleapis.com/css?family=Lato');

* {
	position: relative;
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Lato', sans-serif;
}

body {
	height: 100vh;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	background: linear-gradient(to bottom right, #EEE, #AAA);
}

h1 {
	margin: 40px 0 20px;
}

p {
    text-align: center;
}

</style>
</head>
<body>
<div class="message">
	<h1>요청에 대한 권한이 없습니다</h1>
	<p></p>
	<p>
		<button class="btn btn-dark" type="button" onclick="location.href='${sessionScope.prevUrl}'">이전 페이지로</button>
	</p>
</div>

</body>
</html>