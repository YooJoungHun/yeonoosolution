<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
<title>로그인</title>
<link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/sign-in/">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
	html, body {
		height: 100%;
	}
	
	body {
		display: flex;
		align-items: center;
		padding-top: 40px;
		padding-bottom: 40px;
		background-color: #f5f5f5;
	}
	
	.form-signin {
		width: 100%;
		max-width: 330px;
		padding: 15px;
		margin: auto;
	}
	
	.form-signin .checkbox {
		font-weight: 400;
	}
	
	.form-signin .form-floating:focus-within {
		z-index: 2;
	}
	
	.form-signin input[type="email"] {
		margin-bottom: -1px;
		border-bottom-right-radius: 0;
		border-bottom-left-radius: 0;
	}
	
	.form-signin input[type="password"] {
		margin-bottom: 10px;
		border-top-left-radius: 0;
		border-top-right-radius: 0;
	}
	
	.bd-placeholder-img {
		font-size: 1.125rem;
		text-anchor: middle;
		-webkit-user-select: none;
		-moz-user-select: none;
		user-select: none;
	}
	
	@media ( min-width : 768px) {
		.bd-placeholder-img-lg {
			font-size: 3.5rem;
		}
	}
</style>
</head>
<body class="text-center">
	<main class="form-signin">
		<form action="/standard/login" method="POST">
			<img class="mb-4" src="${pageContext.request.contextPath}/images/logo.png" alt="" width="120" height="60">
			<h1 class="h3 mb-3 fw-normal">로그인</h1>
	
			<div class="form-floating">
				<input type="email" class="form-control" id="memberId" name="memberId"> <label for="memberId">아이디</label>
			</div>
			<div class="form-floating">
				<input type="password" class="form-control" id="password" name="password"> <label for="password">비밀번호</label>
			</div>
	
			<!-- 로그인 실패 메세지 출력 -->
			<c:if test="${param.error != null}">
				<div class="mb-3" style="color: red;" id="error-message"></div>
			</c:if>
			
 			<div class="checkbox mb-3">
				<label>
					<input type="checkbox" name="remember"> 자동 로그인
				</label>
			</div> 
			
			<button class="w-100 btn btn-lg btn-primary" type="submit">로그인</button>
			<p class="mt-5 mb-3 text-muted">&copy; 2023</p>
		</form>
	</main>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
	$(function() {
	    let errorCode= "${param.error}";
	    let errorMessage = "";
	    console.log("errorCode : " + errorCode);
	    switch(errorCode){
	    	case '400':
	    		errorMessage = '아이디 혹은 비밀번호를 확인해주세요';
	    		break;
	    	case '401':
	    		errorMessage = '로그인이 필요한 페이지입니다';
	    		break;
	    	default:
	    		errorMessage = '잠시 후 다시 시도해주세요';
	    		break;
	    }
	    
	    $('#error-message').text(errorMessage);
	    	
	});
</script>
</body>
</html>
