<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매 입고 등록</title>
<style type="text/css">
#search-div {
	display: flex;
}
#content {
	display: flow-root;
}
#content > div{
	margin-left: 30px;
}
#search-div div {
	margin: 5px;
}

#btn-div, #search-div, #order-list, #order-detail {
	margin: 10px;
}

#order-list, #order-detail {
	height: 300px;
}

#order-list, #order-detail {
	overflow: auto;
	white-space: nowrap;
}

.tuigrid-header {
	display: flex;
	justify-content: space-between;
	margin-right: 30px;
}

.order-tables td, .order-tables th {
	border: 1px solid #B3B3B3;
	padding: 5px;
	text-align: center;
	white-space: nowrap; /* 셀 내용이 넘칠 경우 줄바꿈 방지 */
	overflow: hidden; /* 셀 내용이 넘칠 경우 가리기 */
	text-overflow: ellipsis; /* 셀 내용이 넘칠 경우 말줄임표(...) 표시 */
}

.order-tables tr, .order-tables td {
	border-top: none;
}
.order-tables {
	border-collapse: collapse;
	white-space: nowrap;
	table-layout: fixed !important;
}
.order-tables-hearder {
	position: sticky;
	top: 0;
	background-color: #f2f2f2;
}
.order-tables tr{
	height: 24px;
}
#order-list-table,
#order-detail-list-table {
	max-height: 280px;
}

.tuigrid-header>* {	
	margin: 5px 5px;
}

.order-radio {
	min-width: 50px;
	max-width: 50px;
}

.order-status {
	min-width: 70px;
	max-width: 70px;
}

.st-in-code {
	min-width: 110px;
	max-width: 110px;
}
.order-code {
	min-width: 100px;
	max-width: 100px;
}

.receive-order-type {
	min-width: 110px;
	max-width: 110px;
}

.order-date {
	min-width: 120px;
	max-width: 120px;
}

.customer-code {
	min-width: 130px;
	max-width: 130px;
}

.customer-name {
	min-width: 220px;
	max-width: 220px;
}

.due-date {
	min-width: 120px;
	max-width: 120px;
}

.order-empid {
	min-width: 80px;
	max-width: 80px;
}

.delivery-plan {
	min-width: 100px;
	max-width: 100px;
}

.reg-date {
	min-width: 170px;
	max-width: 170px;
}

.reg-user {
	min-width: 80px;
	max-width: 80px;
}

.update-date {
	min-width: 170px;
	max-width: 170px;
}

.update-user {
	min-width: 80px;
	max-width: 80px;
}

.order-memo {
	min-width: 200px;
	max-width: 200px;
}

.item-sorder {
	min-width: 60px;
	max-width: 60px;
}

.item-checkbox {
	min-width: 60px;
	max-width: 60px;
}

.item-code {
	min-width: 120px;
	max-width: 120px;
}

.item-name {
	min-width: 300px;
	max-width: 300px;
}

.item-stock-unit {
	min-width: 100px;
	max-width: 100px;
}

.quantity {
	min-width: 100px;
	max-width: 100px;
}

.item-price {
	min-width: 110px;
	max-width: 110px;
}

.amount {
	min-width: 150px;
	max-width: 150px;
}

.order-detail-memo {
	min-width: 200px;
	max-width: 200px;
}

.order-number {
	min-width: 60px;
	max-width: 60px;
}
.wh-code {
	min-width: 90px;
	max-width: 90px;
}
.wh-name {
	min-width: 110px;
	max-width: 110px;
}
.td-hidden {
	visibility: hidden;
}
.side-bar {
	border: 1px solid #ddd;
	padding: 20px;
	float: left;
	height: 100vh;
	min-width: 180px;
}
#btn-div {
	display: inline-block;
}
.non-change {
	background-color: #e6e6e6!important;
}
.non-modal-change {
	background-color: #e6f2ff!important;
}
.modal-change {
    background-color: #ffffcc!important;
}
.modal-body table tr:hover td:not(.hidden) {
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
	background-color: #e6e6e6;
}
.customer-list-tr td{
	padding: 3px 5px;
}
.modal-body table {
	margin: 0 auto;
	display: flex;
    flex-direction: column;
}
#wh-list-table{
	margin: 0 auto !important;
}
.order-tables thead{
	background-color: #F8F8F8!important;
}
.order-btn-cl {
	font-weight: bold;
	border: 1px solid #B3B3B3;
	border-radius: 7px;
	width: 28px;
	align-items: center;
	background-color: white;
}
.order-btn-cl:hover {
	background-color: #ffffcc;
}
</style>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
</head>
<body>
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
	   
		<!-- 로그아웃 -->
		<c:if test="${sessionScope.member != null}">
	      	<form action="/standard/logout" method="POST">
	         	<button type="submit">로그아웃</button>
	      	</form>
		</c:if>
    </div>
	
	<div id="contain">
		<div id="content">
			<div id="btn-div">
				<button id="order-search-btn">조회</button>
				<button id="order-save-btn">저장</button>
				<button class="order-delete-btn order-status-update-btn">삭제</button>
				<button id="order-init-btn">초기화</button>
				<button id="order-confirm-btn" class="order-status-update-btn">입고 확정</button>
				<button id="order-cancel-btn" class="order-status-update-btn">확정 취소</button>
			</div>
			<div id="search-div">
				<div>
					<p>입고 일자</p>
					<input type="date" id="search-order-day">
				</div>
				<div>
					<p>거래처 코드(검색)</p>
					<input type="text" id="search-customer-code" autocomplete="off">
				</div>
				<div>
					<p>거래처명</p>
					<input type="text" id="search-customer-name" readonly>
				</div>
			</div>
			<div class="tuigrid-header">
				<span>구매발주</span>
				<div>
					<button type="button" id="order-add" class="order-btn-cl">+</button>
					<button type="button" class="order-delete-btn order-status-update-btn order-btn-cl">-</button>
				</div>
			</div>
			<div id="order-list">
				<table id="order-list-table-heder"
					class="order-list-table order-tables order-tables-hearder">
					<thead>
						<tr>
							<th class="order-number"></th>
							<th class="order-radio"></th>
							<th class="order-status">상태</th>
							<th class="st-in-code">입고 번호</th><!--  -->
							<th class="order-date">입고일자</th>
							<th class="order-code">발주 번호</th>
							<th class="customer-code">거래처코드</th>
							<th class="customer-name">거래처명</th>
							<th class="order-memo">비고</th>
							<th class="reg-date">등록일자</th>
							<th class="reg-user">등록자</th>
							<th class="update-date">수정일자</th>
							<th class="update-user">수정자</th>
						</tr>
					</thead>
				</table>
				<table id="order-list-table" class="order-list-table order-tables">
					<tbody>
					</tbody>
				</table>
			</div>
			<div class="tuigrid-header">
				<span>세부항목</span>
				<div>
					<button type="button" class="odrer-detail-btn order-btn-cl" id="odrer-detail-add-btn">+</button>
					<button type="button" class="odrer-detail-btn order-btn-cl" id="odrer-detail-del-btn">-</button>
				</div>
			</div>
			<div id="order-detail">
				<table id="order-detail-list-table-heder"
					class="order-detail-list-table order-tables order-tables-hearder">
					<thead>
						<tr>
							<th class="item-sorder"></th>
							<th class="item-checkbox"><input type="checkbox" id="all-check"></th>
							<th class="item-code">ITEM코드</th>
							<th class="item-name">품명</th>
							<th class="wh-code">창고 코드</th><!--  -->
							<th class="wh-name">창고명</th><!--  -->
							<th class="item-stock-unit">재고단위</th>
							<th class="quantity">수량</th>
							<th class="item-price">단가</th>
							<th class="amount">공급가액</th>
							<th class="order-detail-memo">비고</th>
						</tr>
					</thead>
				</table>
				<table id="order-detail-list-table"
					class="order-detail-list-table order-tables">
					<tbody>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="modal-order-delete-status-update">
    	<div class="modal-dialog">
      		<div class="modal-content" id="order-delete-status-update-content">
        		<div class="modal-header">
          			<h5 class="modal-title" >삭제하시겠습니까?</h5>
          			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        		</div>
        		<div class="modal-body">
          			<span>저장하지 않은 입고서 사라집니다.</span>
        		</div>
        		<div class="modal-footer modal-btn-div">
          			<button type="button" class="btn btn-primary modal-confirm-btn" data-bs-dismiss="modal">확인</button>
          			<button type="button" class="btn btn-secondary modal-close-btn" data-bs-dismiss="modal">취소</button>
        		</div>
      		</div>
    	</div>
  	</div>
	<div class="modal fade" id="modal-order-status-update">
    	<div class="modal-dialog">
      		<div class="modal-content" id="order-status-update-content">
        		<div class="modal-header">
          			<h5 class="modal-title" id="modal-order-status-update-title"></h5>
          			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        		</div>
        		<div class="modal-body"><p></p></div>
        		<div class="modal-footer modal-btn-div">
          			<button type="button" class="btn btn-primary modal-confirm-btn" data-bs-dismiss="modal">확인</button>
          			<button type="button" class="btn btn-secondary modal-close-btn" data-bs-dismiss="modal">취소</button>
        		</div>
      		</div>
    	</div>
  	</div>
	<div class="modal fade" id="modal-order-status-update-msg">
    	<div class="modal-dialog">
      		<div class="modal-content" id="order-delete-content">
        		<div class="modal-header">
          			<h5 class="modal-title" id="modal-order-status-update-title-msg"></h5>
          			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        		</div>
        		<div class="modal-body"><p></p></div>
        		<div class="modal-footer modal-btn-div">
          			<button type="button" class="btn btn-primary modal-confirm-btn" data-bs-dismiss="modal">확인</button>
        		</div>
      		</div>
    	</div>
  	</div>
  	<!-- 회사 검색 모달 -->
	<div class="modal fade" id="modal-select-customer-code">
    	<div class="modal-dialog">
      		<div class="modal-content" id="select-customer-code-content">
        		<div class="modal-header">
          			<h5 class="modal-title" id="modal-select-customer-code-title-msg">거래처를 선택해 주세요.</h5>
          			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        		</div>
        		<div class="modal-body">
        		<table id="customer-list-table">
        			<thead>
        				<tr>
        					<th class="customer-code">회사코드</th>
        					<th class="customer-name">회사명</th>
        				</tr>
					</thead>
        			<tbody></tbody>
        		</table>
        		</div>
        		<div class="modal-footer modal-btn-div">
        		</div>
      		</div>
    	</div>
  	</div>
  	<!-- 세부항목 추가 모달 -->
	<div class="modal fade" id="modal-select-item-code">
    	<div class="modal-dialog">
      		<div class="modal-content" id="select-item-code-content">
        		<div class="modal-header">
          			<h5 class="modal-title" id="modal-select-item-code-title-msg">제품을 선택해 주세요.</h5>
          			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        		</div>
        		<div class="modal-body">
        		<table id="item-list-table">
        			<thead>
        				<tr>
        					<th class="item-code">제품코드</th>
        					<th class="item-name">제품명</th>
        					<th></th>
        					<th></th>
        				</tr>
					</thead>
        			<tbody></tbody>
        		</table>
        		</div>
        		<div class="modal-footer modal-btn-div">
        		</div>
      		</div>
    	</div>
  	</div>
  	<!-- 창고 출력모달 -->
	<div class="modal fade" id="modal-select-wh-code">
    	<div class="modal-dialog">
      		<div class="modal-content" id="select-wh-code-content">
        		<div class="modal-header">
          			<h5 class="modal-title" id="modal-select-wh-code-title-msg">창고를 선택해 주세요.</h5>
          			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        		</div>
        		<div class="modal-body">
        		<table id="wh-list-table">
        			<thead>
        				<tr>
        					<th class="wh-code">창고코드</th>
        					<th class="wh-name">창고명</th>
        				</tr>
					</thead>
        			<tbody></tbody>
        		</table>
        		</div>
        		<div class="modal-footer modal-btn-div">
        		</div>
      		</div>
    	</div>
  	</div>
	<!-- contain -->
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script>
	// 클릭한 발주서 라디오 값 저장
	let radioOrderCode = null;
	// 초기화 버튼
	$('#order-init-btn').click(function(){
		 $('#search-div input').val('');
	});
	
	// 저장 // 저장 // 저장 // 저장 // 저장 // 저장 // 저장 // 저장 // 저장 // 저장 // 저장 // 저장 // 저장 // 저장 // 저장 // 저장 // 저장 // 저장 // 저장 // 저장 // 저장 // 저장 // 저장
	$('#order-save-btn').click(function(){
		let saveOrderTr = $('.order-radio input[type="radio"]:checked').closest('tr');
		console.log("saveOrderTr.find('.order-code').text() -> "+ saveOrderTr.find('.order-code').text());
		if(saveOrderTr.find('.st-in-code').text() == '' && confirm("입고서를 저장하시겠습니까?")){

			let ordernullCheck = true;
			saveOrderTr.find('.change-td').each(function() {
			  	let text = $(this).text().trim();
				let hasMemoClass = $(this).hasClass('order-memo');
			  	if (text === '' && !hasMemoClass) {
			  		ordernullCheck = false;
			    	return false;
		  		}
			});
			if (!ordernullCheck) {
			  	alert("선택하신 입고서에 필수 작성 항목이 작성되지 않았습니다. 다시 확인해주세요.");
			  	return;
			}
			let stockIn = {
				orderCode : saveOrderTr.find('.order-code').text(),
				customerCode : saveOrderTr.find('.customer-code').text(),
				inDate : saveOrderTr.find('.order-date').text(),
				memo : saveOrderTr.find('.memo').text()
			};
			console.log(stockIn);
			
			let stInDetails = [];
			$('.order-detail-table-tr-area').each(function(){
				let orderDetailTr = $(this);
				let stInDetail = { 
						sorder : $(this).find('.item-sorder').text(),
						whCode : $(this).find('.wh-code').text(),
						itemCode : $(this).find('.item-code').text(),
						inQuantity : $(this).find('.quantity').text(),
						inPrice : $(this).find('.item-price').text(),
						memo : $(this).find('.memo').text()
				};
				orderDetailTr.find('.change-td').each(function() {
				  	let text = $(this).text().trim();
					let hasMemoClass = $(this).hasClass('order-detail-memo');
				  	if (text === '' && !hasMemoClass) {
				  		ordernullCheck = false;
				    	return false;
			  		}
				});
				if (!ordernullCheck) {
				  	alert("선택하신 입고서 세부항목 필수 작성 항목이 작성되지 않았습니다. 다시 확인해주세요.");
				  	return;
				}
				stInDetails.push(stInDetail);
			});
			console.log(stInDetails);
			
			$.ajax({
				url : "/sales/st-in-add",
				type : "POST",
				dataType : "TEXT",
				contentType: "application/json",
				data: JSON.stringify({
					stockIn : stockIn,
					stInDetails : stInDetails
			    }),
				success : function(mag){
					alert(mag);
					orderList();
				}
			});
		}else if(saveOrderTr.find('.st-in-code').text() != '' && confirm("입고서를 수정하시겠습니까?")){
			let stInCode = saveOrderTr.find('.st-in-code').text();
			let ordernullCheck = true;
			saveOrderTr.find('.change-td').each(function() {
			  	let text = $(this).text().trim();
				let hasMemoClass = $(this).hasClass('order-memo');
			  	if (text === '' && !hasMemoClass) {
			  		ordernullCheck = false;
			    	return false;
		  		}
			});
			if (!ordernullCheck) {
			  	alert("선택하신 발주서에 필수 작성 항목이 작성되지 않았습니다. 다시 확인해주세요.");
			  	return;
			}
			let stockIn = {
				inCode : saveOrderTr.find('.st-in-code').text(),
				orderCode : saveOrderTr.find('.order-code').text(),
				customerCode : saveOrderTr.find('.customer-code').text(),
				inDate : saveOrderTr.find('.order-date').text(),
				memo : saveOrderTr.find('.memo').text()
			};
			console.log(stockIn);
			
			let stInDetails = [];
			$('.order-detail-table-tr-area').each(function(){
				let orderDetailTr = $(this);
				let stInDetail = { 
					inCode : saveOrderTr.find('.st-in-code').text(),
					sorder : $(this).find('.item-sorder').text(),
					whCode : $(this).find('.wh-code').text(),
					itemCode : $(this).find('.item-code').text(),
					inQuantity : $(this).find('.quantity').text(),
					inPrice : $(this).find('.item-price').text(),
					memo : $(this).find('.memo').text(),
				};
				orderDetailTr.find('.change-td').each(function() {
				  	let text = $(this).text().trim();
					let hasMemoClass = $(this).hasClass('order-detail-memo');
				  	if (text === '' && !hasMemoClass) {
				  		ordernullCheck = false;
				    	return false;
			  		}
				});
				if (!ordernullCheck) {
				  	alert("선택하신 발주서 세부항목 필수 작성 항목이 작성되지 않았습니다. 다시 확인해주세요.");
				  	return;
				}
				stInDetails.push(stInDetail);
			});	
			console.log(stInDetails);
			
			$.ajax({
				url : "/sales/st-in-modify",
				type : "POST",
				dataType : "TEXT",
				contentType: "application/json",
				data: JSON.stringify({
					stockIn : stockIn,
					stInDetails : stInDetails
			    }),
				success : function(mag){
					alert(mag);
					orderList();
				}
			});
		}
	});
	
	// 제품 검색 데이터 받기
	function itemSearch(search){
		$.ajax({
			url : "/sales/item-list",
			type : "GET",
			dataType : "JSON",
			data : {search :search.toUpperCase()},
			success : function(itemList){
				let itemListTable = $('#item-list-table tbody');
				itemListTable.empty();
				itemList.forEach(function(item){
					let itemListRow = $('<tr>').addClass('item-list-tr');
					let itemCode = $('<td>').addClass('item-code').text(item.itemCode);
					let itemName = $('<td>').addClass('item-name').text(item.itemName);
					let stockUnit = $('<td>').addClass('item-stock-unit td-hidden').text(item.stockUnit);
					let purchasePrice = $('<td>').addClass('item-price td-hidden').text(item.purchasePrice);
					
					itemListRow.append(itemCode).append(itemName).append(stockUnit).append(purchasePrice);
					itemListTable.append(itemListRow);
				});
				$('#modal-select-item-code').modal('show');
			}
		});
	}
	// 창고 검색 데이터 받기
	function whSearch(){
		$.ajax({
			url : "/sales/wh-list",
			type : "GET",
			dataType : "JSON",
			success : function(whList){
				let whListTable = $('#wh-list-table tbody');
				whListTable.empty();
				whList.forEach(function(wh){
					let whListRow = $('<tr>').addClass('wh-list-tr');
					let whCode = $('<td>').addClass('wh-code').text(wh.whCode);
					let whName = $('<td>').addClass('wh-name').text(wh.whName);
					
					whListRow.append(whCode).append(whName);
					whListTable.append(whListRow);
				});
				$('#modal-select-wh-code').modal('show');
			},
			error: function(xhr, status, error) {
			    console.log(xhr);
			    console.log(status);
			    console.log(error);
			}
		});
	}
	// 회사 검색 데이터 받기
	function companySearch(search){
		$.ajax({
			url : "/sales/customer-list",
			type : "GET",
			dataType : "JSON",
			data : {search :search.toUpperCase()},
			success : function(customerList){
				let customerListTable = $('#customer-list-table tbody');
				customerListTable.empty();
				customerList.forEach(function(customer){
					console.log("customer -> " + customer.companyCode + "   " + customer.companyName);
					let customerListRow = $('<tr>').addClass('customer-list-tr');
					let customerCode = $('<td>').addClass('customer-code').text(customer.companyCode);
					let customerName = $('<td>').addClass('customer-name').text(customer.companyName);
					
					customerListRow.append(customerCode).append(customerName);
					customerListTable.append(customerListRow);
				});
				$('#modal-select-customer-code').modal('show');
			}
		});
	}
	$('#search-customer-code').keydown(function(event){
		let search = $(this).val();
		console.log("search -> " + search);
		if (event.keyCode === 13) {
			companySearch(search);
		};
	});
	
	function orderDetailAdd(orderDetail, rowNumber){
		if(orderDetail.sorder != null){
			rowNumber = orderDetail.sorder;
		}
		let orderDetailRow = $('<tr>').addClass('order-detail-table-tr-area');
		let Sorder = $('<td>').addClass('item-sorder').text(rowNumber);
		let Checkbox = $('<td>').addClass('item-checkbox').append($("<input type='checkbox' class='order-detail-checkbox'>"));
		let itemCode = $('<td>').addClass('item-code change-td modal-change').text(orderDetail.itemCode);
		let itemName = $('<td>').addClass('item-name non-change').text(orderDetail.itemName);
		let whCode = $('<td>').addClass('wh-code change-td modal-change').text(orderDetail.whCode);/*  */
		let whName = $('<td>').addClass('wh-name non-change').text(orderDetail.whName);/*  */
		let itemStockUnit = $('<td>').addClass('item-stock-unit non-change').text(orderDetail.stockUnit);
		let quantity = $('<td>').addClass('quantity change-td non-modal-change').text(orderDetail.inQuantity);
		let price = $('<td>').addClass('item-price change-td non-modal-change').text(orderDetail.inPrice);
		let amount = $('<td>').addClass('amount non-change').text(parseInt(orderDetail.inQuantity)*parseInt(orderDetail.inPrice));
		let memo = $('<td>').addClass('order-detail-memo change-td ').text(orderDetail.memo);
		orderDetailRow.append(Sorder).append(Checkbox).append(itemCode).append(itemName).append(whCode).append(whName)
					  .append(itemStockUnit).append(quantity).append(price).append(amount).append(memo);
		$('#order-detail-list-table tbody').append(orderDetailRow);
	}
	// 입고서 세부항목 불러오기
	function orderDetailList(orderCode){
		if(orderCode == radioOrderCode){
			radioOrderCode = null;
			return;
		}else if(orderCode == 'undefined'){
			$('#order-detail-list-table tbody').empty();
			return;
		}
		$.ajax({
			url: "/sales/stock-in/" + orderCode +"/details",
			type : "GET",
			dataType : "JSON",
			success : function(orderDetailList){
				$('#order-detail-list-table tbody').empty();
				orderDetailList.forEach(function(orderDetail){
					orderDetailAdd(orderDetail);
				});
				radioOrderCode = orderCode;
			}
		})
	}
	$('.odrer-detail-btn').click(function(){
		let btnId = $(this).attr('id');
		// 상세 항목추가 버튼
		if(btnId == 'odrer-detail-add-btn') {
			let rowCount = $("#order-detail-list-table tbody tr").length;
			orderDetailAdd({}, rowCount + 1);
			$('#all-check').prop('checked', false);
		// 삭제 버튼
		}else if(btnId == 'odrer-detail-del-btn'){
			let checkedOrderDetails = $('.order-detail-checkbox:checked').closest('tr').remove();
			let nonCheckedOrderDetails = $('.order-detail-checkbox').closest('tr');
			console.log("nonCheckedOrderDetails -> " + nonCheckedOrderDetails);
			nonCheckedOrderDetails.each(function(index) {
				$(this).find('.item-sorder').text(index + 1);
			});
		}
	});
	
	function orderAdd(order, index){
		let orderRow = $('<tr>').addClass('order-table-tr-area');
		let orderNumber = $('<td>').addClass('order-number').text(index);
		let orderRadio = $('<td>').addClass('order-radio').append($("<input type='radio' class='order-radio-select' value='" + order.inCode +"' name='chk_info'>"));
		let orderStatus = $('<td>').addClass('order-status non-change').text(order.inType);
		let inCode = $('<td>').addClass('st-in-code non-change').text(order.inCode);/*  */
		let orderDate = $('<td>').addClass('order-date change-td non-modal-change').text(order.inDate);
		let orderCode = $('<td>').addClass('order-code change-td modal-change').text(order.orderCode);/*  */
		let customerCode = $('<td>').addClass('customer-code change-td modal-change').text(order.customerCode);
		let customerName = $('<td>').addClass('customer-name non-change').text(order.customerName);
		let regDate = $('<td>').addClass('reg-date non-change').text(order.regDate);
		let regUser = $('<td>').addClass('reg-user non-change').text(order.regUser);
		let updateDate = $('<td>').addClass('update-date non-change').text(order.updateDate);
		let updateUser = $('<td>').addClass('update-user non-change').text(order.updateUser);
		let memo = $('<td>').addClass('order-memo change-td').text(order.memo);
		orderRow.append(orderNumber).append(orderRadio).append(orderStatus).append(inCode).append(orderDate).append(orderCode)
				.append(customerCode).append(customerName).append(memo).append(regDate).append(regUser).append(updateDate).append(updateUser);
		$('#order-list-table tbody').append(orderRow);
		// 발주서 추가시 포커스 이동
		if(order.inCode == null){
			$('.order-number').filter(function() {
				return $(this).text().trim() == index;
			}).closest('tr').find('.order-radio-select').prop('checked', true).focus();
			$('#order-detail-list-table tbody').empty();
		}
	};
	$('#order-add').click(function(){
		let btnId = $(this).attr('id');
		// 발주서 추가 버튼
		if(btnId == 'order-add') {
			let rowCount = $("#order-list-table tbody tr").length;
			orderAdd({}, rowCount + 1);
		}
	});
	// 라디오 버튼이 변경되면 발주번호에 맞는 세부항목 ajax로 불러오기
	$(document).on('change', '.order-radio-select', function(){
			orderDetailList($(this).val());
		});
	// 발주서 행 클릭 시 라디오 버튼 체크표시 및 검색어 추가
	$(document).on('click', '.order-table-tr-area', function(){
		let radioInput = $(this).find('.order-radio input[type="radio"]');
		radioInput.prop('checked', true);
		$('#search-order-day').val($(this).find('.order-date').text());
		$('#search-customer-code').val($(this).find('.customer-code').text());
		$('#search-customer-name').removeAttr('readonly');
		$('#search-customer-name').val($(this).find('.customer-name').text());
		$('#search-customer-name').attr('readonly', 'readonly');
		$('#order-empid').val($(this).find('.order-empid').text());
		orderDetailList(radioInput.val());
		$('#all-check').prop('checked', false);
			
	});
	// 세부항목 행 클릭 시 체크박스 체크표시
	$(document).on('click', '.order-detail-table-tr-area', function(){
		let checkboxInput = $(this).find('.order-detail-checkbox');
		if(checkboxInput.is(':checked')){
			checkboxInput.prop('checked', false);
		}else {
			checkboxInput.prop('checked', true);
		}
		
		let allChecked = true;
		$('.order-detail-checkbox').each(function() {
	    	if (!$(this).is(':checked')) {
	    		console.log("allChecked -> " + allChecked);
	      		allChecked = false;
	      		return false;
	    	}
	  	});
		if(allChecked) {
			$('#all-check').prop('checked', true);
		}else{
			$('#all-check').prop('checked', false);
		}
	});
	let changeItemRow = null;
	let dbTdText = null;
	// 더블 클릭 시 input태그로 변환
	$(document).on('dblclick', '.change-td', function() {
		let elementClass = $(this).attr('class');
		console.log(elementClass);
		let dbclickTd = $(this);
		let value = $(this).text();
		dbTdText = value;
		let tdWidth = $(this).width() - 10;
		dbclickTd.empty();
		if(elementClass.includes('date')){
			dbclickTd.append($('<input type="date">').addClass('change-text-input-td').val(value).css('width', tdWidth+'px'));
			$('.change-text-input-td').focus();
		}else if(elementClass.includes('wh-code')){
			changeItemRow = dbclickTd.closest('tr').find('.item-sorder').text();
			whSearch();
		}else if(elementClass.includes('quantity')){
			dbclickTd.append($('<input type="number">').addClass('change-text-input-td').val(value).css('width', tdWidth+'px'));
		} else {
			if(elementClass.includes('item-code')){
				changeItemRow = dbclickTd.closest('tr').find('.item-sorder').text();
			}
			dbclickTd.append($('<input>').addClass('change-text-input-td').val(value).css('width', tdWidth+'px'));
			$('.change-text-input-td').focus();
		}
		
	});
	// input태그 작성 중 엔터 시 작성된 값을 text로 변환하여 출력
	$(document).on("keydown", '.change-text-input-td', function(event) {
		if (event.keyCode === 13) {
			if($(this).parent().attr('class').includes('customer-code')){
				companySearch($(this).val());		
			}else if($(this).parent().attr('class').includes('item-code')){
				itemSearch($(this).val());		
			}else if($(this).parent().attr('class').includes('quantity')){
				let  amount = parseInt($(this).val())*parseInt($(this).closest('tr').find('.item-price').text());
				$(this).closest('tr').find('.amount').text(amount);
			}else if($(this).parent().attr('class').includes('item-price')){
				let  amount = parseInt($(this).val())*parseInt($(this).closest('tr').find('.quantity').text());
				$(this).closest('tr').find('.amount').text(amount);
			}
			let value = $(this).val();
			let dbEnterTd = $(this).parent();
			dbEnterTd.empty();
			dbEnterTd.text(value);
	    }
	});
	// input태그 작성 중 다른 곳 클릭시 작성된 값을 text로 변환하여 출력
	$(document).on("click", function(event) {
		let target = $(event.target);
		if (!target.closest(".change-text-input-td").length) {
			let dbEnterTd = $('.change-text-input-td').parent();
			let value = $('.change-text-input-td').val();
			dbEnterTd.empty();
			dbEnterTd.text(value);
		}
	});
	
	// 모달창 값 선택
	$(document).on('click', '.customer-list-tr', function() {
		let customerCode = $(this).find('.customer-code').text();
		let customerName = $(this).find('.customer-name').text();
		console.log("customerCode -> " + customerCode + " customerName -> " + customerName);
		$('#search-customer-code').val(customerCode);
		$('#search-customer-name').removeAttr('readonly');
		$('#search-customer-name').val(customerName);
		$('#search-customer-name').attr('readonly', 'readonly');
		
		// 발주서 체크된 놈 값 변경
		let radioChecked = $('.order-radio input[type="radio"]:checked').val();
		console.log("radioChecked -> " + radioChecked);
		$('.order-radio input[type="radio"]:checked').closest('tr').find('.customer-code').text(customerCode);
		$('.order-radio input[type="radio"]:checked').closest('tr').find('.customer-name').removeAttr('readonly');
		$('.order-radio input[type="radio"]:checked').closest('tr').find('.customer-name').text(customerName);
		$('.order-radio input[type="radio"]:checked').closest('tr').find('.customer-name').attr('readonly', 'readonly');
		$('#modal-select-customer-code').modal('hide');
	});
	
	$(document).on('click', '.item-list-tr', function() {
		let itemCode = $(this).find('.item-code').text();
		let itemName = $(this).find('.item-name').text();
		let itemStockUnit = $(this).find('.item-stock-unit').text();
		let itemPrice = $(this).find('.item-price').text();
		
		// 세부항목 클릭된 놈 값 변경
		let changeTr = $('.item-sorder').filter(function() {
			return parseInt($(this).text()) == changeItemRow;
		}).closest('tr');
		changeTr.find('.item-code').text(itemCode);
		changeTr.find('.item-name').removeAttr('readonly');
		changeTr.find('.item-name').text(itemName);
		changeTr.find('.item-name').attr('readonly', 'readonly');
		changeTr.find('.item-stock-unit').removeAttr('readonly');
		changeTr.find('.item-stock-unit').text(itemStockUnit);
		changeTr.find('.item-stock-unit').attr('readonly', 'readonly');
		changeTr.find('.quantity').text('');
		changeTr.find('.item-price').text(itemPrice);
		changeTr.find('.amount').text('');
		$('#modal-select-item-code').modal('hide');
		
	});
	$(document).on('click', '.wh-list-tr', function() {
		let whCode = $(this).find('.wh-code').text();
		let whName = $(this).find('.wh-name').text();
		
		let changeTr = $('.item-sorder').filter(function() {
			return parseInt($(this).text()) == changeItemRow;
		}).closest('tr');
		changeTr.find('.wh-code').text(whCode);
		changeTr.find('.wh-name').removeAttr('readonly');
		changeTr.find('.wh-name').text(whName);
		changeTr.find('.wh-name').attr('readonly', 'readonly');
		$('#modal-select-wh-code').modal('hide');
		
	});
	
	// 입고서 검색기능
	function orderList(){
		let orderDate = $('#search-order-day').val().replaceAll('-', '/');
		let customerCode = $('#search-customer-code').val();
		$.ajax({
			url: "/sales/stock-in-list",
			type : "GET",
			dataType : "JSON",
			data : { 
				orderDate : orderDate,
				customerCode : customerCode
			},
			success : function(orderList){
				$('#order-list-table tbody').empty();
				$('#order-detail-list-table tbody').empty();
				orderList.forEach(function(order, index){
					orderAdd(order, index + 1)
				});
			}
		});
	}
	// 세부항목 전체체크
	$('#all-check').change(function(){
		if($(this).is(':checked')){
			$('.order-detail-checkbox').prop('checked', true);
		}else {
			$('.order-detail-checkbox').prop('checked', false);
		}
	});
	// 검색 클릭 시 검색어를 가져와서 ajax 실행
	$('#order-search-btn').click(function(){
		orderList();
	});
	// 발주서 patch ajax사용 버튼 통합
	$('.order-status-update-btn').click(function(){
		let orderCode = radioOrderCode;
		// 버튼의 아이디 추출
		let btnId = $(this).attr('id');
		let btnClass = $(this).attr('class');
		// 발주서 상태 확인
		let orderStatus = $('input[type="radio"]:checked').closest('tr').find('.order-status').text();
		
		if(btnClass.includes('order-delete-btn')){
			// 발주서 번호가 없는 발주서 삭제
			if(orderCode == null){
				let deleteTr = $('input[type="radio"]:checked').closest('tr');
				let deleteTrNumber = deleteTr.find('.order-number').text();
				console.log("deleteTrNumber -> " + deleteTrNumber);
				let deleteTrNext = deleteTr.nextAll('tr');
				deleteTrNext.each(function(index) {
					let currentTr = $(this);
					let currentOrder = parseInt(deleteTrNumber) + parseInt(index);
					currentTr.find('.order-number').text(currentOrder);
				});
				deleteTr.remove();
			}else{
				$('#modal-order-delete-status-update').modal('show');
			}
		}else if($('input[type="radio"]:checked').val() == 'undefined'){
			alert("발주서번호가 없는 발주서는 먼저 저장을 해주셔야 합니다.");
		}else {
			if(btnId == 'order-confirm-btn' && orderStatus == '저장'){
				$('#modal-order-status-update').find('h5').text('발주 확정 하시겠습니까?');
			}else if(btnId == 'order-cancel-btn'&& orderStatus == '확정'){
				$('#modal-order-status-update').find('h5').text('확정 취소 하시겠습니까?');
			}else {
				alert("발주서상태를 확인해주세요.");
				return;
			}
			$('#modal-order-status-update').modal('show');
		}
	});
	function orderUpdate(column, data){
		let inCode = radioOrderCode;
		$.ajax({
			url: "/sales/st-in/" + inCode,
			type : "PATCH",
			data : {column : column,
					data : data},
			dataType : "TEXT",
			success : function(msg){
				console.log(msg);
				// 상태 변경 후 발주서 전체 출력
				if(msg.includes('마감')){
					$('#search-div input').val('');
				}
				orderList();
				$('#modal-order-status-update-msg').find('h5').text(msg);
				$('#modal-order-status-update-msg').modal('show');
				
			}
		});
	}// 모달 확인 버튼 클릭
	$('.modal-confirm-btn').click(function(){
		
		let modal = $(this).closest('.modal');
		let modalId = modal.attr('id');
		if(modalId.includes("modal-order-delete-status-update")){
			orderUpdate('deleteStatus', 'Y');
		}else if(modalId == ("modal-order-status-update")){
			if($('#modal-order-status-update').find('h5').text().includes('취소')){
				orderUpdate('orderStatus', '저장');
			}else if($('#modal-order-status-update').find('h5').text().includes('마감')){
				orderUpdate('orderStatus', '마감');
			}else{
				orderUpdate('orderStatus', '확정');
			}
		}
	});
	// 페이지 로드 시 전체 발주서 불러오기
	$(function() {
		orderList();
	});
	</script>
</body>
</html>
