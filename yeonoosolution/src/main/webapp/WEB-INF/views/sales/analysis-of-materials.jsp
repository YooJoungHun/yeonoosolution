<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자재요소분석</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<style type="text/css">
	.analysis-of-materials-body-container {
	display: flex;
	}
	
	.side-bar {
		/* flex: 1; */
		flex: 0 0 210px; /* 사이드바의 너비를 고정값으로 설정 */
		border: 1px solid #ddd;
		padding: 20px;
		float: left;
		height: 100vh;
		background-color: #D9D9D9;
	}
	
	.analysis-of-materials-container {
		/* flex: 9; */
		/* flex: 0 0 calc(100% - 240px);  *//* 사이드바의 너비를 고려하여 남은 공간을 할당 */
		border: 1px solid;
		margin: 30px;
		padding: 20px;
	}
	
	.semi-manufactures-container {
		width: 1000px;
	}
	
	/* 상위 버튼 */
	.analysis-of-materials-container-btn {
		margin: 10px;
		border: 1px solid;
		width: 800px;
	}
	
	.receive-order-table-container {
		height: 320px;
		overflow: auto;
	}
	
	.semi-manufactures-container {
		height: 470px;
		overflow: auto;
	}
	
	
	/* 테이블  */
	#table-order-content {
		border:3px solid;
		padding: 5px;
		text-align: center;
		white-space: nowrap;		/* 셀 내용이 넘칠 경우 줄바꿈 방지 */
		overflow: hidden; 			/* 셀 내용이 넘칠 경우 가리기 */
		text-overflow: ellipsis;	/* 셀 내용이 넘칠 경우 말줄임표(...) 표시 */
		margin: 30px;
	}
	
	#table-semi-manufactures-content {
		border:3px solid;
		padding: 5px;
		text-align: center;
		white-space: nowrap;		/* 셀 내용이 넘칠 경우 줄바꿈 방지 */
		overflow: hidden; 			/* 셀 내용이 넘칠 경우 가리기 */
		text-overflow: ellipsis;	/* 셀 내용이 넘칠 경우 말줄임표(...) 표시 */
		margin: 30px;
	}
	
	#table-order-content tr:hover td {
		background-color: #8C8C8C;
	}
	
	#table-semi-manufactures-content tr:hover td {
		background-color: #8C8C8C;
	}
	
	.bg-gray {
		background-color: #D9D9D9;
	}
	
	.bg-orange {
		background-color: #FFFFCC;
	}
	
	#table-order-content th {
		border: 1px solid;			/* 각 셀에 테두리 추가 */
	}
	
	#table-order-content td {
		width: 100px; 
		border: 1px solid;			/* 각 셀에 테두리 추가 */
	}
	
	#table-order-content th:first-child {
		width: 30px;
		height: 30px;
	}
	
	#table-order-content th:nth-child(2),
	#table-order-content th:nth-child(3),
	#table-order-content th:nth-child(4),
	#table-order-content th:nth-child(5),
	#table-order-content th:nth-child(6),
	#table-order-content th:nth-child(7),
	#table-order-content th:nth-child(8),
	#table-order-content th:nth-child(9),
	#table-order-content th:nth-child(10) {
		width: 100px;
		height: 30px;
	}
	
	#table-order-content td:first-child {
		width: 30px; 
	}
	
	#table-semi-manufactures-content th {
		border: 1px solid;			/* 각 셀에 테두리 추가 */
	}
	
	#table-semi-manufactures-content td {
		width: 100px; 
		border: 1px solid;			/* 각 셀에 테두리 추가 */
	}
	
	#table-semi-manufactures-content th:first-child {
		width: 30px;
		height: 30px;
	}
	#table-semi-manufactures-content th:nth-child(1),
	#table-semi-manufactures-content th:nth-child(2),
	#table-semi-manufactures-content th:nth-child(3),
	#table-semi-manufactures-content th:nth-child(4),
	#table-semi-manufactures-content th:nth-child(5),
	#table-semi-manufactures-content th:nth-child(6),
	#table-semi-manufactures-content th:nth-child(7) {
		width: 170px;
		height: 30px;
	}
	
	
</style>
</head>
<body>
<div class="analysis-of-materials-body-container">
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
		
		<!-- 로그아웃 -->
		<c:if test="${sessionScope.member != null}">
			<form action="/standard/logout" method="POST">
				<button type="submit">로그아웃</button>
			</form>
		</c:if>
	      
	</div>
	
	<div class="analysis-of-materials-container">
		
		<div class="analysis-of-materials-container-btn">
		
			<button type="button" id="search-btn" value="조회">조회</button>
			<button type="button" id="receive-order-btn" value="수주서 관리" onclick="location.href='/sales/receive-order'">수주서 관리</button>
			
		</div>
		
		<div class="receive-order-table-container">
		
			<h4>수주목록</h4>
			<table id="table-order-content" border="1">
				<thead>
					<tr>
						<th></th>
						<th>수주번호</th>
						<th>제품코드</th>
						<th>품명</th>
						<th>구분</th>
						<th>수주수량</th>
						<th>수주유형</th>
						<th>수주일</th>
						<th>수주담당자</th>
						<th>상태</th>
					</tr>
				</thead>
				
				<tbody id="table-order-content-body">
				</tbody>
				
			</table>
			
		</div>	<!-- /class="receive-order-table-container" -->
		
		<div class="semi-manufactures-container">
		
			<h4>반제품 소요분석</h4>
			<table id="table-semi-manufactures-content" border="1">
					<thead>
						<tr>
							<th>제품코드</th>
							<th>품명</th>
							<th>구분</th>	<!-- 반제품 -->
							<th>재고단위</th>
							<th>재고수량</th>
							<th>작업지시수량</th>	<!-- 생산계획세부 -->
						</tr>
					</thead>
					
					<tbody id="table-semi-manufactures-content-body">
					</tbody>
					
				</table>
		
		</div>	<!-- /class="semi-manufactures-container" -->
		
		
	
	</div>
</div>	<!-- /id="analysis-of-materials-body-container" -->
</body>
<script type="text/javascript">
	
	//.receive-order-table-content 출력
	function loadReceiveOrderList(){ 	
		$.ajax({
			url: "/sales/analysis-of-materials/receive-order-list",
			type: "GET",
			dataType: "json",
			success: function(receiveOrderList){
				const table = $("#table-order-content tbody");
				const checkedRowId = $('input[name="selectRow"]:checked').val(); // 이전에 체크된 radio의 값
				
				table.empty();
				receiveOrderList.forEach(function(order){ 
					
					const row =$("<tr>");
					const radio = $('<input type="radio" name="selectRow">').val(order.orderCode);
					
					if(order.orderCode === checkedRowId){
						radio.prop("checked", true); // 이전에 체크된 radio 선택
					}
					
					row.append($('<td>').append(radio));
					row.append('<td class="bg-gray">' + order.orderCode + '</td>');
					row.append('<td class="bg-gray">' + order.itemCode + '</td>');
					row.append('<td class="bg-orange">' + order.itemName + '</td>');
					row.append('<td class="bg-gray">' + order.itemType + '</td>');
					row.append('<td class="bg-orange">' + order.quantity + '</td>');
					row.append('<td class="bg-orange">' + order.receiveOrderType + '</td>');
					row.append('<td class="bg-gray">' + order.orderDate.substring(0, 10) + '</td>');
					row.append('<td class="bg-gray">' + order.orderEmpid + '</td>');
					row.append('<td class="bg-gray">' + order.orderStatus + '</td>');
					
					table.append(row);
					
					console.log('receiveOrderList checked radio -> ' + checkedRowId)
				});
			},
			error: function(){
				console.log("receive-order-list Error");
			}
		});
		
	}	/* /loadReceiveOrderList() */
	
	$(document).on("click", "#table-order-content tbody tr", function() {
		const radio = $(this).find("input[name='selectRow']");
		radio.prop("checked", true).trigger("change");
	});
	
	// .semi-manufactures-container 출력
	function loadSemiManufacturesList(){ 	
		
		let orderCode = $("input[name='selectRow']:checked").val();
		console.log("semi-manufactures-orderCode -> " + orderCode);
		
		if(orderCode){
			
			$.ajax({
				url: "/sales/analysis-of-materials/semi-manufactures-list?orderCode=" + orderCode,
				type: "GET",
				dataType: "json",
				success: function(semiManufacturesList){
					const table = $("#table-semi-manufactures-content tbody");
					
					table.empty();
					semiManufacturesList.forEach(function(order){  
						const row =$("<tr>");
						/* row.append('<td><input type="radio" name="selectItemCodeRow" value = '+ order.itemCode +'></td>'); */
						/* row.append('<td>' + order.itemCode + '</td>'); */
						row.append('<td class="bg-gray">' + order.lowItemCode + '</td>');
						row.append('<td class="bg-gray">' + order.itemName + '</td>');
						row.append('<td class="bg-gray">' + order.itemType + '</td>');
						row.append('<td class="bg-orange">' + order.stockUnit + '</td>');
						row.append('<td class="bg-orange">' + order.goodQuantity + '</td>');
						row.append('<td class="bg-orange">' + order.workOrderQuantity + '</td>');
						
						table.append(row);
						
					});
				},
				error: function(){
					console.log("semi-manufactures-list Error");
				}
			});
			
		} else {
			const table = $("#table-semi-manufactures-content tbody");
			table.empty();
		}
		
	}	
	
	//document ready
	$(function() {
		
		// 조회 클릭 이벤트리스너
		$('#search-btn').click(function() {
			loadReceiveOrderList();
		});
		
		// radio 변경시 checked value 변경
		$(document).on('change', "input[name='selectRow']", function(){
			console.log("change radio");
			loadSemiManufacturesList();
		});
		
		loadReceiveOrderList();
		
	});
</script>
</html>