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
		padding: 5px 10px;
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
	
	.side-bar {
		border: 1px solid #ddd;
		padding: 20px;
		float: left;
		height: 100vh;
	}
	
</style>
<title>Insert title here</title>
</head>
<body>
	<div class="side-bar">
		<a href="/product/is/item">품목별 재고 현황</a><p>
		<a href="/product/is/bom">BOM별 재고 현황</a><p>
		<a href="/product/is/wh">창고별 재고 현황</a><p>
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
	<br>
	
	<div>
		<h2>BOM별 재고 현황</h2>
		<table>
			<tr>
				<th>창고 코드</th>
				<th>제품 코드</th>
				<th>양품 수량</th>
				<th>불량 수량</th>
			</tr>
		</table>
	</div>
	
</body>
</html>