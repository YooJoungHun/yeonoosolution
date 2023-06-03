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
	input {
		height: 1.6rem;
	}
	
	select {
		height: 1.9rem;
	}
	
	label {
		border: 1px solid #ddd;
		border-radius: 5px;
		padding: 5px;
	}
	
	.side-bar {
		border: 1px solid #ddd;
		padding: 20px;
		float: left;
		height: 100vh;
	}
	
	.container {
		width: 100%;
		display: flex;
	}
	
	.wh-data {
		border-collapse : collapse;
		width: 100%;
		padding: 20px;
		margin: 0 auto;
		white-space: nowrap;
		table-layout: fixed;
	}
	
	.content {
		display: inline-block;
		width: 80%;
		margin: 0 auto;
	}
	
	.wh-list {
		width: 100%; 
	    height: 400px; 
	    overflow: auto; 
		border: 1px solid #ddd;
		margin: 0 auto;
		background-color: #f8f8f8;
	}
	
	.input-div {
		display: flex;
		justify-content: space-between;
    	align-items: center;
	}
	
	.wh-data th, td {
		padding: 10px 20px;
		text-align: center;
		border: 1px solid #b3b3b3;
	}
	
	#item-name, #update-date {
		width: 200px;
	}
	
	.btn {
		background-color: white;
		border-radius: 5px;
		height: 30px;
		border: 1px solid navy;
		padding: 0 15px;
	}
	
	.btn:hover {
		background-color: navy;
		color: white;
		font-weight: bold;
	}
	
	.company-code, .member-name, .update-date {
		background-color: #d9d9d9;
	}
	
	.item-code, .item-name {
		background-color: #ffffcc;
	}
	
	.wh-code, .wh-name {
		background-color: #e6f2ff;
	}
	
	.pagination {
		text-align: center;
		padding: 20px 0;
	}
	
	a {
		text-decoration: none;
	}
</style>
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<div class="side-bar">
		<!-- product/ds -->
		<a href="/product/status/defect">불량현황</a><p>
		<!-- product/ps -->
		<a href="/product/status/production">생산현황 검색</a><p>
		<!-- product/pr -->
		<!-- product -->
		<a href="/product/is/item">품목별 재고 현황</a><p>
		<a href="/product/is/bom">BOM별 재고 현황</a><p>
		<a href="/product/is/wh">창고별 재고 현황</a><p>
		<a href="/product/is/wh/">창고별 재고 현황 상세</a><p>
		<a href="/item/search">제품 검색</a><p>
		<a href="/product/sim">입고</a><p>
		<a href="/wo">제품 생산 지시</a><p>
		
		<!-- product/smm -->
		<a href="/product/stockMoveRegistration">재고 이동등록</a><p>
		<a href="/product/stockMoveStatus">재고 이동현황</a><p>
		
		<!-- sales -->
		<a href="/sales/receive-order">수주서 관리</a><p>
		<a href="/sales/analysis-of-materials">자제요소분석</a><p>
		<a href="/sales/order">구매</a><p>
		<a href="/sales/stock-in">구매입고등록</a><p>
		
		<!-- standard -->
		<a href="/standard/login">로그인</a><p>
		<a href="/standard/user-admin">사용자 계정관리</a><p>
		<a href="/standard/imi">품목 관리 및 등록</a><p>
		<a href="/standard/ipi">품목 단가 관리</a><p>
		<a href="/standard/pmi">품목 관리 정보</a><p>
		
		<!-- standard bi -->
		기본정보<p>
		<a href="/standard/companyInfo/">회사정보</a><p>
		<a href="/standard/customerInfo/">거래처정보</a><p>
		<!-- standard um -->
		사용자관리<p>
		<a href="/standard/myPage/">개인정보수정</a><p>
		<a href="/standard/dept/">부서등록 및 확인</a><p>
		<a href="/standard/job/">직급등록 및 확인</a><p>
	</div>
	
	<div class="content">
		<div class="input-div">
		<h2>창고별 재고 현황</h2>
			<div>
			<label>창고 구분</label> 
				<select id="wh-name">
					<option selected disabled style="text-align: center;">검색할 창고를 선택하세요</option>
				<c:forEach var="wh" items="${whDtoWhList}">
				<c:choose>
				<c:when test="${wh.useYn eq 'N'}">
					<option disabled="disabled">${wh.whName} * 해당창고는 현재 사용할 수 없습니다</option>
				</c:when>
				<c:otherwise>
					<option value="${wh.whCode}">${wh.whName}</option>
				</c:otherwise>
				</c:choose>
				</c:forEach>
				</select> 
				<input class="btn search-btn" type="button" value="조회">
			</div>
		</div>
		
	<div class="wh-list">
		<table class="wh-data">
			<tr>
				<th>창고 코드</th>
				<th>창고 명</th>
				<th>회사 명</th>
				<th>제품 코드</th>
				<th id="item-name">제품 명</th>
				<th>입고 근무자</th>
				<th id="update-date">입고 일자</th>
			</tr>
			
			<c:forEach var="whMap" items="${whDtoMap.whDtoList}">
			<tr class="for-data">
				<td class="wh-code">${whMap.wdCode}</td>
				<td class="wh-name">${whMap.whName}</td>
				<td class="company-code">${whMap.companyCode}</td>
				<td class="item-code">${whMap.itemCode}</td>
				<td class="item-name">${whMap.itemName}</td>
				<td class="member-name">${whMap.memberName}</td>
				<td class="update-date">${whMap.updateDate}</td>
			</tr>
			</c:forEach>
		</table>
	</div>
		<div class="pagination">	
			<a class="btn" href="/product/is/wh?currentPage=${whDtoMap.pagination.currentPage > 1 ? whDtoMap.pagination.currentPage - 1 : 1}">&lt;</a>
		<c:forEach var="i" begin="${whDtoMap.pagination.startNum}" end="${whDtoMap.pagination.lastNum}">
			<a class="btn" href="/product/is/wh?currentPage=${i}">${i}</a>
		</c:forEach>
			<a class="btn" href="/product/is/wh?currentPage=${whDtoMap.pagination.currentPage < whDtoMap.pagination.lastNum ? whDtoMap.pagination.currentPage + 1 : whDtoMap.pagination.lastNum}">&gt;</a>
		</div>	
	</div>	
</div>
</body>
<script type="text/javascript">
	$(".search-btn").on("click", function(){
		let whCode = $("#wh-name").val();
		console.log(whCode);
		if(whCode == null) {
			alert("조회하실 창고 이름을 선택해주세요");
			$("#wh-name").focus();
		} else {
			location.href="/product/is/wh/" + whCode;
		}
	});
</script>
</html>