<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	span	 {
		border: 1px solid #E8EBF0;
		border-radius: 5px;
		padding: 5px 30px;
		font-weight: bold;
		text-align: center;
	}
	
	table {
		background-color: #F8F8F8;
		padding: 20px;
	}
	
	input {
		height: 1.6rem;
	}
	
	select {
		height: 1.9rem;
	}
	
</style>
<title>Insert title here</title>
</head>
<body>
	<div class="side-bar">
		<a href="#">품목별 재고 현황</a><p>
		<a href="#">BOM별 재고 현황</a><p>
		<a href="#">창고별 재고 현황</a><p>
	</div>
	
	<div class="content">
		<table>
			<tr>
				<td>
					<span>품목 구분</span> 
					<select>
						<option selected disabled>---- 품목을 선택하세요 ----</option>
						<option>완제품</option>
						<option>반제품</option>
						<option>원자재</option>
					</select> 
				</td>
				<td>
					<span>ITEM 코드</span>
					<input type="text">
				</td>
				<td>
					<span>품명</span>
				 	<input type="text">
				</td>
				<td>
					<span>품목 코드</span>
					<input type="text">
				</td>
				<td>
					<input type="button" value="조회">
				</td>
			</tr>
		</table>
	</div>
	
	<div>
		<table>
			<tr></tr>
		</table>
	</div>
	
</body>
</html>