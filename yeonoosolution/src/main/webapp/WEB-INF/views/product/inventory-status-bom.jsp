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
	.container {
		width: 100%;
		display: flex;
	}
	
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
		height: auto;
	}
	
	.bom-table {
		border-collapse : collapse;
		width: 100%;
		padding: 20px;
		margin: 0 auto;
		white-space: nowrap;
		table-layout: fixed;
	}
	
	.bom-table th, td {
		padding: 10px 20px;
		text-align: center;
		border: 1px solid #b3b3b3;
	}
	
	.content {
		display: inline-block;
		width: 80%;
		margin: 0 auto;
	}
	
	.bom-list {
		width: 100%; 
	    height: 400px; 
	    overflow: auto; 
		border: 1px solid #ddd;
		margin: 0 auto;
		background-color: #f8f8f8;
	}
	
	.low-item-code, .low-item-name {
		background-color: #ffffcc;
	}
	
	.wh-code, .wh-name {
		background-color: #e6f2ff;
	}
	
	.good-quantity, .bad-quantity {
		background-color: #d9d9d9;
	}
	
	#low-item-name, .low-item-name {
		width: 200px !important;
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
	
	.bom-data:hover td {
		background-color: navy;
		color: white;
	}
	
	.input-div {
		display: flex;
		justify-content: space-between;
    	align-items: center;
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
		
		<!-- sales -->
		<a href="/sales/analysis-of-materials">자제소요분석</a><p>
		<a href="/sales/receive-order">수주서 관리</a><p>
		<a href="/sales/order">구매</a><p>
		<a href="/sales/stock-in">구매입고등록</a><p>
		
		<!-- standard -->
		<a href="/standard/login">로그인</a><p>
		<a href="/standard/user-admin">사용자 계정관리</a><p>
		<a href="/standard/imi">품목 관리 및 등록</a><p>
		<a href="/standard/ipi">품목 단가 관리</a><p>
		<a href="/standard/pmi">품목 관리 정보</a><p>
		
		<!-- 로그아웃 -->
	   <c:if test="${sessionScope.member != null}">
	      <form action="/standard/logout" method="POST">
	         <button type="submit">로그아웃</button>
	      </form>
	   </c:if>
	</div>
	
	<div class="content">
		<div class="input-div">
			<h2>BOM별 재고 현황</h2>
			<div>
				<label>하위 품목 구분</label>
					<select class="item-type">
						<option selected disabled>---- 하위 품목의 타입을 선택하세요 ----</option>
						<option>반제품</option>
						<option>원자재</option>
					</select>
		
				<label>상위 품목명</label>
				<input type="text" class="item-name">
				<input class="btn search-btn" type="button" value="조회">	
			</div>
		</div>
		
		<div class="bom-list">
			<table class="bom-table">
				<tr>
					<th>상위 품목 명</th>
					<th>하위 품목 코드</th>
					<th id="low-item-name">하위 품목 명</th>
					<th>창고 코드</th>
					<th>창고 명</th>
					<th>양품 수량</th>
					<th>불량 수량</th>
				</tr>
			</table>
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
	$(".search-btn").on("click", function(){
		let itemName = $(".item-name").val();
		let itemType = $(".item-type").val();
		
		console.log("itemName : " + itemName + ", itemType : " + itemType);
		
		if(itemName === null || itemName == "") {
			alert("상위 품목명을 입력 해주세요");
			$(".item-name").focus();
			return false;
		} else if(itemType === null) {
			alert("하위 품목 구분을 선택 해주세요");
			$(".item-type").focus();
			return false;
		}
		
		$.ajax({
			url : "/product/is/bom/" + itemName,
			method : "GET",
			data : {itemName : itemName, itemType : itemType},
			dataType : "json",
			success : function(bomList) {
				console.log(bomList);
				
				if(bomList.length == 0) {
					alert("검색하신 내용의 데이터가 없습니다.");
					return;
				} else {
					let table = $(".bom-table");
					table.empty();
					
					let headTr = $("<tr>");
					let headHighItemName = $("<th>").text("상위 품목 명");
					let headLowItemCode = $("<th>").text("하위 품목 코드");
					let headLowItemName = $("<th id='low-item-name'>").text("하위 품목 명");
					let headWhCode = $("<th>").text("창고 코드");
					let headWhName = $("<th>").text("창고 명");
					let headGoodQuantity = $("<th>").text("양품 수량");
					let headBadQuantity = $("<th>").text("불량 수량");
					
					headTr.append(headHighItemName).append(headLowItemCode).append(headLowItemName).append(headWhCode)
						  .append(headWhName).append(headGoodQuantity).append(headBadQuantity);
					
					table.append(headTr);
					
					bomList.forEach(function(bom){
						let tr = $("<tr>").addClass("bom-data");
						let highItemName = $("<td>").text(bom.highItemName).addClass("high-item-name");
						let lowItemCode = $("<td>").text(bom.lowItemCode).addClass("low-item-code");
						let lowItemName = $("<td>").text(bom.itemName).addClass("low-item-name");
						let whCode = $("<td>").text(bom.whCode).addClass("wh-code");
						let whName = $("<td>").text(bom.whName).addClass("wh-name");
						let goodQuantity = $("<td>").text(bom.goodQuantity).addClass("good-quantity");
						let badQuantity = $("<td>").text(bom.badQuantity).addClass("bad-quantity");
						
						tr.append(highItemName).append(lowItemCode).append(lowItemName).append(whCode).append(whName)
						  .append(goodQuantity).append(badQuantity);
						
						table.append(tr);
					});
				}
			}
		});
	});
</script>
</html>