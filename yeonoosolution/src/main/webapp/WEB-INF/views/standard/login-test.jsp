<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <c:set var="member" value="${sessionScope.member}" />
	<h1>success</h1>
	<h1>Member Info</h1>
	<h3>아이디 : ${member.memberId}</h3>
	<h3>회사코드 : ${member.companyCode}</h3>
	<h3>이름 : ${member.memberName}</h3>
	<h3>권한 : ${member.memberRole}</h3>
	<form action="/v1/standard/logout" method="POST">
		<button type="submit">로그아웃</button>
	</form>
	
</body>
</html>