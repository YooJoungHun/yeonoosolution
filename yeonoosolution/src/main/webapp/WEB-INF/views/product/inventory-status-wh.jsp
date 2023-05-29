<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
					<span>창고 구분</span> 
					<select>
						<option selected disabled>---- 창고를 선택하세요 ----</option>
					<c:forEach var="wh" items="${whDtoWhList}">
						<option value="${wh.whCode}">${wh.whName}</option>
					</c:forEach>
					</select> 
				</td>
				<td>
					<input type="button" value="조회">
				</td>
			</tr>
		</table>
	</div>
	<br>
	
	<div>
		<h2>창고별 재고 현황</h2>
		<table>
			<tr>
				<th>창고 코드</th>
				<th>창고 명</th>
				<th>회사 명</th>
				<th>제품 코드</th>
				<th>제품 명</th>
				<th>입고 근무자</th>
				<th>입고 일자</th>
			</tr>
			
			<c:forEach var="whMap" items="${whDtoMap.whDtoList}">
			<tr>
				<td>${whMap.wdCode}</td>
				<td>${whMap.whName}</td>
				<td>${whMap.companyCode}</td>
				<td>${whMap.itemCode}</td>
				<td>${whMap.itemName}</td>
				<td>${whMap.memberName}</td>
				<td>${whMap.updateDate}</td>
			</tr>
			</c:forEach>
		</table>
		<c:if test=""></c:if>
		<c:forEach var="i" begin="${whDtoMap.pagination.startNum}" end="${whDtoMap.pagination.lastNum}">
			<a class="pagination" href="#">${i}</a>
		</c:forEach>
	</div>
</body>
<script type="text/javascript">
</script>
</html>