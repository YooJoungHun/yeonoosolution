<%@ page language="java" contentType="text/html; charset=UTF-8"
<<<<<<< HEAD
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
=======
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
>>>>>>> refs/remotes/origin/dev
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<<<<<<< HEAD
<title>구매입고등록</title>
<style type="text/css">
#content {
	border: 1px solid;
	height: 1000px;
	margin-top: 30px;
}

#search-div {
	display: flex;
}

#search-div div {
	margin: 5px;
}

#btn-div, #search-div, #order-list, #order-detail {
	border: 1px solid;
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
}

.order-tables td, .order-tables th {
	border: 1px solid;
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
}

.order-status {
	min-width: 70px;
}

.stoci-in-code {
	min-width: 110px;
}
.order-code {
	min-width: 100px;
}

.receive-order-type {
	min-width: 110px;
}

.order-date {
	min-width: 120px;
}

.customer-code {
	min-width: 130px;
}

.customer-name {
	min-width: 220px;
}

.due-date {
	min-width: 120px;
}

.order-empid {
	min-width: 80px;
}

.delivery-plan {
	min-width: 100px;
}

.reg-date {
	min-width: 170px;
}

.reg-user {
	min-width: 80px;
}

.update-date {
	min-width: 170px;
}

.update-user {
	min-width: 80px;
}

.order-memo {
	min-width: 200px;
}

.item-sorder {
	min-width: 60px;
}

.item-checkbox {
	min-width: 60px;
}

.item-code {
	min-width: 120px;
}

.item-name {
	min-width: 300px;
}

.item-stock-unit {
	min-width: 100px;
}

.quantity {
	min-width: 100px;
}

.item-price {
	min-width: 110px;
}

.amount {
	min-width: 150px;
}

.order-detail-memo {
	min-width: 200px;
}

.order-number {
	min-width: 60px;
}
.wh-code {
	min-width: 70px;
}
.wh-name {
	min-width: 110px;
}
#customer-list-table{
	board : 1px solid;
	border-collapse: collapse;
}
.td-hidden {
	visibility: hidden;
}
</style>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
=======
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<style type="text/css">
	.table-content {
		overflow: auto;
		white-space: nowrap;
	}
</style>
>>>>>>> refs/remotes/origin/dev
</head>
<body>
<<<<<<< HEAD
	<div id="contain">
			<input type="button" value="구매 발주" onclick="location.href='/pm/order'">
			<input type="button" value="구매 입고 등록" onclick="location.href='/pm/stock-in'">
			<input type="button" value="구매 내역조회">
		<div id="content">
			<div id="btn-div">
				<button id="order-search-btn">조회</button>
				<button id="order-save-btn">저장</button>
				<button class="order-delete-btn order-status-update-btn">삭제</button>
				<button id="order-init-btn">초기화</button>
				<button id="order-confirm-btn" class="order-status-update-btn">입고 확정</button>
				<button id="order-cancel-btn" class="order-status-update-btn">확정 취소</button>
				<button id="order-stock_in-btn">입고</button>
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
				<div>
					<p>담당자명</p>
					<input type="text" id="order-empid">
				</div>
			</div>
			<div class="tuigrid-header">
				<span>구매발주</span>
				<button type="button" id="order-add">+</button>
				<button type="button" class="order-delete-btn order-status-update-btn">-</button>
			</div>
			<div id="order-list">
				<table id="order-list-table-heder"
					class="order-list-table order-tables order-tables-hearder">
					<thead>
						<tr>
							<th class="order-number"></th>
							<th class="order-radio"></th>
							<th class="order-status">상태</th>
							<th class="stoci-in-code">입고 번호</th><!--  -->
							<th class="order-date">입고일자</th>
							<th class="order-code">발주 번호</th>
							<th class="customer-code">거래처코드</th>
							<th class="customer-name">거래처명</th>
							<th class="reg-date">등록일자</th>
							<th class="reg-user">등록자</th>
							<th class="update-date">수정일자</th>
							<th class="update-user">수정자</th>
							<th class="order-memo">비고</th>
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
				<button type="button" class="odrer-detail-btn" id="odrer-detail-add-btn">+</button>
				<button type="button" class="odrer-detail-btn" id="odrer-detail-del-btn">-</button>
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
							<th class="wh-name">재고단위</th><!--  -->
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
          			<h5 class="modal-title" id="modal-select-customer-code-title-msg"></h5>
          			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        		</div>
        		<div class="modal-body">
        		<table id="customer-list-table">
        			<thead>
        				<tr>
        					<th>회사코드</th>
        					<th>회사명</th>
        				</tr>
					</thead>
        			<tbody></tbody>
        		</table>
        		</div>
        		<div class="modal-footer modal-btn-div">
          			<button type="button" class="btn btn-primary modal-confirm-btn" data-bs-dismiss="modal">확인</button>
        		</div>
      		</div>
    	</div>
  	</div>
  	<!-- 세부항목 추가 모달 -->
	<div class="modal fade" id="modal-select-item-code">
    	<div class="modal-dialog">
      		<div class="modal-content" id="select-item-code-content">
        		<div class="modal-header">
          			<h5 class="modal-title" id="modal-select-item-code-title-msg"></h5>
          			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        		</div>
        		<div class="modal-body">
        		<table id="item-list-table">
        			<thead>
        				<tr>
        					<th>제품코드</th>
        					<th>제품명</th>
        				</tr>
					</thead>
        			<tbody></tbody>
        		</table>
        		</div>
        		<div class="modal-footer modal-btn-div">
          			<button type="button" class="btn btn-primary modal-confirm-btn" data-bs-dismiss="modal">확인</button>
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
		if(saveOrderTr.find('.order-code').text() == '' && confirm("발주서를 저장하시겠습니까?")){
=======
	
<div class="receive-order-container">

	<div class="receive-order-btn">
		
		<button type="button" id="search-btn" value="조회">조회</button>
		<button type="button" id="save-btn" value="저장">저장</button>
		<button type="button" id="delete-btn" value="삭제">삭제</button>
		<button type="button" id="reset-btn" value="초기화">초기화</button>
		<button type="button" id="order-confirmation-btn" value="수주 확정">수주 확정</button>
		<button type="button" id="confirmation-cancel-btn" value="확정 취소">확정 취소</button>
		<button type="button" id="stock-out-reg-btn" value="출하 등록">출하 등록</button>
		<button type="button" id="work-order-reg-btn" value="작업 지시 등록">작업 지시 등록</button>
		<button type="button" id="analysis-bom-btn" value="작업 지시 등록">자재 요소 분석</button>
		
	</div>

	<div class="receive-order-top-content">
	
		<div >
		
			<span>수주번호</span>
			<input type="text" id="order-code" name="orderCode">
			<span>수주유형</span>
			<select id="receive-order-type" name="receiveOrderType">
				<option value="자체생산">자체생산</option>
				<option value="OEM">OEM</option>
				<option value="ODM">ODM</option>
			</select>
			<span>거래처 코드</span>
			<input type="text" id="customer-code" name="customerCode">
			<span>거래처명</span>
			<input type="text" id="company-name" name="companyName">
			<span>수주일</span>
			<input type="date" id="order-date" name="orderDate"> 
			<span>수주담당자</span>
			<input type="text" id="order-empid" name="orderEmpid">
			<span>납기일</span>
			<input type="date" id="due-date" name="dueDate">
			
		</div>
	
	</div>	<!-- /class="receive-order-top-content" -->
	
	<div class="receive-order-table-content">
	
		<table id="table-content" border="1">
			<caption>수주서</caption>
			<thead>
				<tr>
					<td></td>
					<th>상태</th>
					<th>수주번호</th>
					<th>거래처코드</th>
					<th>수주유형</th>
					<th>거래처명</th>
					<th>수주일</th>
					<th>수주담당자</th>
					<th>인도조건</th>
					<th>납기일</th>
					<th>등록일자</th>
					<th>등록자</th>
					<th>수정일자</th>
					<th>수정자</th>
				</tr>
			</thead>
			
			<tbody id="table-content-body">
			</tbody>
			
		</table>
		
		
			
	
	</div>	<!-- /class="receive-order-table-content" -->
	
	
	<div class="insert-receive-order">
		<table id="table-insert-receive">
			<tr>
				<th>거래처코드</th>
				<td><input type="text" name="customerCode" required="required">
			</tr>
			<tr>
				<th>수주유형</th>
				<td>
					<select name="receiveOrderType" required="required">
						<option value="자체생산">자체생산</option>
						<option value="ODM">ODM</option>
						<option value="OEM">OEM</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>거래처명</th>
				<td><input type="text" name="companyName">
				</td>
			</tr>
			<tr>
				<th>수주일</th>
				<td><input type="date" name="orderDate" ></td>
			</tr>
			<tr>
				<th>수주담당자</th>
				<td><input type="text" name="orderEmpid" ></td>
			</tr>	
			<tr>
				<th>인도조건</th>
				<td>
				<select name="deliveryPlan">
					<option value="">없음</option>
					<option value="DDM">DDM</option>
				</select>
				</td>
			</tr>
			<tr>
				<th>납기일</th>
				<td><input type="date" name="dueDate" ></td>
			</tr>
			<tr>
				<th>등록일자</th>
				<td><input type="date" name="regDate" ></td>
				</tr>
			<tr>
				<th>등록자</th>
				<td><input type="text" name=regUser ></td>
			</tr>
			<tr>
				<th>수정일자</th>
				<td><input type="date" name="updateDate" ></td>
			</tr>
			<tr>
				<th>수정자</th><td><input type="text" name="updateUser" ></td>
			</tr>
									
			<tr>
				<td colspan="2">
				<button id="insert-receive-order-btn">확인</button>
			</tr>
		</table>
		
	</div> <!-- /class="insert-receive-order" -->
		
		
		
	<div class="receive-order-detail-content">
	
		<table id="table-detail-content" border="1">
			<caption>수주서 세부항목</caption>
			<thead>
				<tr>
					<td></td>
					<th>제품코드</th>
					<th>품명</th>
					<th>수량</th>
					<th>단가</th>
					<th>금액</th>
					<th>재고단위</th>
					<th>비고</th>
					<th>마감여부</th>
				</tr>
			</thead>
			
			<tbody id="table-detaili-content-body">
			</tbody>
			
		</table>
	
	</div>	<!-- /class="receive-order-detail-content" -->

</div>	<!-- /class="receive-order-container" -->
>>>>>>> refs/remotes/origin/dev

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
			let order = {
				companyCode : "COMPANY1",
				customerCode : saveOrderTr.find('.customer-code').text(),
				receiveOrderType : saveOrderTr.find('.receive-order-type').text(),
				orderDate : saveOrderTr.find('.order-date').text(),
				orderEmpid : "bsm",
				deliveryPlan : saveOrderTr.find('.delivery-plan').text(),
				dueDate : saveOrderTr.find('.due-date').text(),
				memo : saveOrderTr.find('.memo').text(),
				regUser : "bsm",
				updateUser : "bsm"
			};
			console.log(order);
			
			let orderDetails = [];
			$('.order-detail-table-tr-area').each(function(){
				let orderDetailTr = $(this);
				let orderDetail = { 
						sorder : $(this).find('.item-sorder').text(),
						itemCode : $(this).find('.item-code').text(),
						quantity : $(this).find('.quantity').text(),
						price : $(this).find('.item-price').text(),
						amount : $(this).find('.amount').text(),
						memo : $(this).find('.memo').text(),
						itemStockUnit : $(this).find('.item-stock-unit').text()
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
				orderDetails.push(orderDetail);
			});
			console.log(orderDetails);
			
			$.ajax({
				url : "/pm/order-add",
				type : "POST",
				dataType : "TEXT",
				contentType: "application/json",
				data: JSON.stringify({
			        order: order,
			        orderDetails: orderDetails
			    }),
				success : function(mag){
					alert(mag);
					orderList();
				}
			});
		}else if(saveOrderTr.find('.order-code').text() != '' && confirm("발주서를 수정하시겠습니까?")){
			let orderCode = saveOrderTr.find('.order-code').text();
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
			let order = {
				orderCode : saveOrderTr.find('.order-code').text(),
				companyCode : "COMPANY1",
				customerCode : saveOrderTr.find('.customer-code').text(),
				receiveOrderType : saveOrderTr.find('.receive-order-type').text(),
				orderDate : saveOrderTr.find('.order-date').text(),
				orderEmpid : "bsm",
				deliveryPlan : saveOrderTr.find('.delivery-plan').text(),
				dueDate : saveOrderTr.find('.due-date').text(),
				memo : saveOrderTr.find('.memo').text(),
				regUser : "bsm",
				updateUser : "bsm"
			};
			console.log(order);
			
			let orderDetails = [];
			$('.order-detail-table-tr-area').each(function(){
				let orderDetailTr = $(this);
				let orderDetail = { 
					orderDetailCode : orderCode,
					sorder : $(this).find('.item-sorder').text(),
					itemCode : $(this).find('.item-code').text(),
					quantity : $(this).find('.quantity').text(),
					price : $(this).find('.item-price').text(),
					amount : $(this).find('.amount').text(),
					memo : $(this).find('.memo').text(),
					itemStockUnit : $(this).find('.item-stock-unit').text()
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
				orderDetails.push(orderDetail);
			});	
			console.log(orderDetails);
			
			$.ajax({
				url : "/pm/order-modify",
				type : "POST",
				dataType : "TEXT",
				contentType: "application/json",
				data: JSON.stringify({
			        order: order,
			        orderDetails: orderDetails
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
			url : "pm/item-list",
			type : "GET",
			dataType : "JSON",
			data : {search :search.toUpperCase()},
			success : function(itemList){
				let itemListTable = $('#item-list-table tbody');
				itemListTable.empty();
				itemList.forEach(function(item){
					let itemListRow = $('<tr>').addClass('item-list-tr');
					let checkBox = $('<td>').addClass('item-radio').append($("<input type='radio' class='item-radio' name='customer-radio'>"));
					let itemCode = $('<td>').addClass('item-code').text(item.itemCode);
					let itemName = $('<td>').addClass('item-name').text(item.itemName);
					let stockUnit = $('<td>').addClass('item-stock-unit td-hidden').text(item.stockUnit);
					let purchasePrice = $('<td>').addClass('item-price td-hidden').text(item.purchasePrice);
					
					itemListRow.append(checkBox).append(itemCode).append(itemName).append(stockUnit).append(purchasePrice);
					itemListTable.append(itemListRow);
				});
				$('#modal-select-item-code').modal('show');
			}
		});
	}
	// 회사 검색 데이터 받기
	function companySearch(search){
		$.ajax({
			url : "pm/customer-list",
			type : "GET",
			dataType : "JSON",
			data : {search :search.toUpperCase()},
			success : function(customerList){
				let customerListTable = $('#customer-list-table tbody');
				customerListTable.empty();
				customerList.forEach(function(customer){
					console.log("customer -> " + customer.companyCode + "   " + customer.companyName);
					let customerListRow = $('<tr>').addClass('customer-list-tr');
					let radio = $('<td>').addClass('customer-radio').append($("<input type='radio' class='customer-radio' name='customer-radio'>"));
					let customerCode = $('<td>').addClass('customer-code').text(customer.companyCode);
					let customerName = $('<td>').addClass('customer-name').text(customer.companyName);
					
					customerListRow.append(radio).append(customerCode).append(customerName);
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
		let itemCode = $('<td>').addClass('item-code change-td').text(orderDetail.itemCode);
		let itemName = $('<td>').addClass('item-name').text(orderDetail.itemName);
		let whCode = $('<td>').addClass('wh-code').text(orderDetail.whCode);/*  */
		let whName = $('<td>').addClass('wh-name').text(orderDetail.whName);/*  */
		let itemStockUnit = $('<td>').addClass('item-stock-unit').text(orderDetail.itemStockUnit);
		let quantity = $('<td>').addClass('quantity change-td').text(orderDetail.inQuantity);
		let price = $('<td>').addClass('item-price change-td').text(orderDetail.inPrice);
		let amount = $('<td>').addClass('amount').text(parseInt(orderDetail.inQuantity)*parseInt(orderDetail.inPrice));
		let memo = $('<td>').addClass('order-detail-memo change-td').text(orderDetail.memo);
		orderDetailRow.append(Sorder).append(Checkbox).append(itemCode).append(itemName).append(whCode).append(whName)
					  .append(itemStockUnit).append(quantity).append(price).append(amount).append(memo);
		$('#order-detail-list-table tbody').append(orderDetailRow);
	}
	// 발주서 세부항목 불러오기
	function orderDetailList(orderCode){
		console.log("function orderDetailList(orderCode){ -> " + orderCode);
		if(orderCode == radioOrderCode){
			radioOrderCode = null;
			return;
		}else if(orderCode == 'undefined'){
			$('#order-detail-list-table tbody').empty();
			return;
		}
		$.ajax({
			url: "/pm/stock-in/" + orderCode +"/details",
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
		let orderStatus = $('<td>').addClass('order-status').text(order.inType);
		let inCode = $('<td>').addClass('order-code').text(order.inCode);/*  */
		let orderDate = $('<td>').addClass('order-date change-td').text(order.inDate);
		let orderCode = $('<td>').addClass('order-code').text(order.orderCode);/*  */
		let customerCode = $('<td>').addClass('customer-code change-td').text(order.customerCode);
		let customerName = $('<td>').addClass('customer-name').text(order.customerName);
		let regDate = $('<td>').addClass('reg-date').text(order.regDate);
		let regUser = $('<td>').addClass('reg-user').text(order.regUser);
		let updateDate = $('<td>').addClass('update-date').text(order.updateDate);
		let updateUser = $('<td>').addClass('update-user').text(order.updateUser);
		let memo = $('<td>').addClass('order-memo change-td').text(order.memo);
		orderRow.append(orderNumber).append(orderRadio).append(orderStatus).append(inCode).append(orderDate).append(orderCode)
				.append(customerCode).append(customerName).append(regDate).append(regUser).append(updateDate).append(updateUser).append(memo);
		$('#order-list-table tbody').append(orderRow);
		// 발주서 추가시 포커스 이동
		if(order.orderCode == null){
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
		console.log(radioInput.val());
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
	// 발주서 검색기능
	function orderList(){
		let orderDate = $('#search-order-day').val();
		let customerCode = $('#search-customer-code').val();
		let orderEmpid = $('#order-empid').val();
		$.ajax({
			url: "/pm/order-list",
			type : "GET",
			dataType : "JSON",
			data : { 
				orderDate : orderDate,
				customerCode : customerCode,
				orderEmpid : orderEmpid
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
		let orderCode = radioOrderCode;
		$.ajax({
			url: "pm/order/" + orderCode,
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
		}else if(modalId.includes('modal-select-customer-code')){
			let customer = modal.find('input[type="radio"]:checked');
			console.log("customer" + customer.attr('class'));
			let customerCode = customer.parent().siblings().filter('.customer-code').text();
			let customerName = customer.parent().siblings().filter('.customer-name').text();
			console.log("customerCode -> " + customerCode + " customerName -> " + customerName);
			$('#search-customer-code').val(customerCode);
			$('#search-customer-name').removeAttr('readonly');
			$('#search-customer-name').val(customerName);
			$('#search-customer-name').attr('readonly', 'readonly');
			
			let radioChecked = $('.order-radio input[type="radio"]:checked').val();
			console.log("radioChecked -> " + radioChecked);
			$('.order-radio input[type="radio"]:checked').closest('tr').find('.customer-code').text(customerCode);
			$('.order-radio input[type="radio"]:checked').closest('tr').find('.customer-name').removeAttr('readonly');
			$('.order-radio input[type="radio"]:checked').closest('tr').find('.customer-name').text(customerName);
			$('.order-radio input[type="radio"]:checked').closest('tr').find('.customer-name').attr('readonly', 'readonly');
		}else if(modalId.includes('modal-select-item-code')){
			let item = modal.find('input[type="radio"]:checked');
			let changeTr = $('.item-sorder').filter(function() {
				return parseInt($(this).text()) == changeItemRow;
			}).closest('tr');
			changeTr.find('.item-code').text(item.parent().siblings().filter('.item-code').text());
			changeTr.find('.item-name').removeAttr('readonly');
			changeTr.find('.item-name').text(item.parent().siblings().filter('.item-name').text());
			changeTr.find('.item-name').attr('readonly', 'readonly');
			changeTr.find('.item-stock-unit').removeAttr('readonly');
			changeTr.find('.item-stock-unit').text(item.parent().siblings().filter('.item-stock-unit').text());
			changeTr.find('.item-stock-unit').attr('readonly', 'readonly');
			changeTr.find('.quantity').text('');
			changeTr.find('.item-price').text(item.parent().siblings().filter('.item-price').text());
			changeTr.find('.amount').text('');
			
			console.log("item.parent().siblings().filter('.item-stock-unit td-hidden').text() -> " + item.parent().siblings().filter('.item-stock-unit').text());
			console.log("item.parent().siblings().filter('.item-price td-hidden').text() -> " + item.parent().siblings().filter('.item-price').text());
		}
	});
	// 페이지 로드 시 전체 발주서 불러오기
	$(function() {
		orderList();
	});
	</script>
</body>
<<<<<<< HEAD
</html>
=======

<script type="text/javascript">

	// 테이블 행 추가
	function addRowContent(){
		// 테이블 찾기
		const table = document.getElementById('table-content');
		// 행 추가
		const newRow = table.insertRow();
		
		// 새 행에 Cell 추가
		const newCell1 = newRow.insertCell(0);
		const newCell2 = newRow.insertCell(1);
		const newCell3 = newRow.insertCell(2);
		const newCell4 = newRow.insertCell(3);
		const newCell5 = newRow.insertCell(4);
		const newCell6 = newRow.insertCell(5);
		const newCell7 = newRow.insertCell(6);
		const newCell8 = newRow.insertCell(7);
		const newCell9 = newRow.insertCell(8);
		const newCell10 = newRow.insertCell(9);
		const newCell11 = newRow.insertCell(10);
		const newCell12 = newRow.insertCell(11);
		const newCell13 = newRow.insertCell(12);
		const newCell14 = newRow.insertCell(13);
		
		// 빈 칸 및 라디오 버튼 추가
		newCell1.innerHTML = '<input type="radio" name="selectRow">';
		newCell2.innerHTML = '';
		newCell3.innerHTML = '';
		newCell4.innerHTML = '';
		newCell5.innerHTML = '';
		newCell6.innerHTML = '';
		newCell7.innerHTML = '';
		newCell8.innerHTML = '';
		newCell9.innerHTML = '';
		newCell10.innerHTML = '';
		newCell11.innerHTML = '';
		newCell12.innerHTML = '';
		newCell13.innerHTML = '';
		
		// 추가된 행의 셀에 이벤트 리스너 등록
		//newRow.addEventListener('dblclick', handleCellDoubleClick);
	}
	
	// 테이블 행 삭제
	function deleteRowContent(rownum){
		// 테이블 찾기
		const table = document.getElementById('table-content');
		// 행 추가
		const newRow = table.deleteRow(rownum);
		
	}
	
	
	// .receive-order-table-content 출력
	function loadPlaceOrderList(){ 	
		$.ajax({
			url: "/sales/receive-order/place-order-list",
			type: "GET",
			dataType: "json",
			success: function(placeOrderList){
				const table = $("#table-content tbody");
				const checkedRowId = $('input[name="selectRow"]:checked').val(); // 이전에 체크된 radio의 값
				
				table.empty();
				placeOrderList.forEach(function(order){  
					const row =$("<tr>");
					const radio = $('<input type="radio" name="selectRow">').val(order.orderCode);
					
					if(order.orderCode === checkedRowId){
						radio.prop("checked", true); // 이전에 체크된 radio 선택
					}
					
					//row.append('<td><input type="radio" name="selectRow" value = '+ order.orderCode +'></td>');
					row.append($('<td>').append(radio));
					row.append('<td>' + order.orderStatus + '</td>');
					row.append('<td>' + order.orderCode + '</td>');
					row.append('<td>' + order.customerCode + '</td>');
					row.append('<td>' + order.receiveOrderType + '</td>');
					row.append('<td>' + order.companyName + '</td>');
					row.append('<td>' + order.orderDate + '</td>');
					row.append('<td>' + order.orderEmpid + '</td>');
					row.append('<td>' + order.deliveryPlan + '</td>');
					row.append('<td>' + order.dueDate + '</td>');
					row.append('<td>' + order.regDate + '</td>');
					row.append('<td>' + order.regUser + '</td>');
					row.append('<td>' + order.updateDate + '</td>');
					row.append('<td>' + order.updateUser + '</td>');
					
					
					table.append(row);
				});
			},
			error: function(){
				console.log("place-order-list Error");
			}
		});
		
	}
	
	//수주상태 변경 
	$(function(){
		
		$('#order-confirmation-btn').click(function(){
			let orderCode = $("input[name='selectRow']:checked").val();
			
			//console.log("orderCode" + orderCode);
			$.ajax({
				url: "/sales/receive-order/" + orderCode + "/confirm",
				type: "PATCH",
				success: function(data){
					console.log("수주상태 확정" +data);
					loadPlaceOrderList();
				},
				error: function(){
					console.log("confirm Error");
				}
			});
			
		});
		
		$('#confirmation-cancel-btn').click(function(){
			let orderCode = $("input[name='selectRow']:checked").val();
			//console.log("orderCode" + orderCode);
			$.ajax({
				url: "/sales/receive-order/" + orderCode + "/cancel",
				type: "PATCH",
				success: function(data){
					console.log("수주상태 저장" +data);
					loadPlaceOrderList();
				},
				error: function(){
					console.log("confirm Error");
				}
			});
			
		});
		
		
		// 수주유형
		$('#receive-order-type').change(function(){
			let selectedType = $(this).val();
			let orderCode = $("input[name='selectRow']:checked").val();
			console.log("receive-order-type => " + selectedType);
			
			$.ajax({
				url: "/sales/receive-order/" + orderCode + "/modify-type",
				type: "PATCH",
				//data: JSON.stringify({ receiveOrderType : selectedType }),
				data: { receiveOrderType : selectedType },
				// contentType: 'application/JSON',
				dataType: "text",
				success: function(orderType){
					console.log("수주유형 변경 성공" + orderType);
					loadPlaceOrderList();
				},
				error: function(){
					console.log("수주유형 변경 Error");
				}
			});
			
		});
		
		
	});
	
	
	
	
	  $(document).ready(function() {
	    $('#insert-receive-order-btn').click(function(e) {
	      e.preventDefault();
	      
	      var form = {
	        customerCode: $('input[name="customerCode"]').val(),
	        receiveOrderType: $('select[name="receiveOrderType"]').val(),
	        companyName: $('input[name="companyName"]').val(),
	        orderDate: $('input[name="orderDate"]').val(),
	        orderEmpid: $('input[name="orderEmpid"]').val(),
	        deliveryPlan: $('select[name="deliveryPlan"]').val(),
	        dueDate: $('input[name="dueDate"]').val(),
	        regDate: $('input[name="regDate"]').val(),
	        regUser: $('input[name="regUser"]').val(),
	        updateDate: $('input[name="updateDate"]').val(),
	        updateUser: $('input[name="updateUser"]').val()
	      };

	      $.ajax({
	        type: "POST",
	        url: "/sales/om/insert-receive-order",
	        data: JSON.stringify(form),
	        contentType: "application/json; charset=utf-8",
	        dataType: "json",
	        success: function(response) {
	          // 성공적으로 처리된 경우에 대한 동작
	          console.log(response);
	          // 여기서 필요한 후속 처리를 수행할 수 있습니다.
	        },
	        error: function(error) {
	          // 처리 중 오류가 발생한 경우에 대한 동작
	          console.log(error);
	          // 오류 처리에 대한 후속 동작을 수행할 수 있습니다.
	        }
	      });
	    });
	  });

	
	
	
	
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	// 테이블 행 추가
	function addRowContentDetail(){
		// 테이블 찾기
		const table = document.getElementById('table-detail-content');
		// 행 추가
		const newRow = table.insertRow();
		
		// 새 행에 Cell 추가
		const newCell1 = newRow.insertCell(0);
		const newCell2 = newRow.insertCell(1);
		const newCell3 = newRow.insertCell(2);
		const newCell4 = newRow.insertCell(3);
		const newCell5 = newRow.insertCell(4);
		const newCell6 = newRow.insertCell(5);
		const newCell7 = newRow.insertCell(6);
		const newCell8 = newRow.insertCell(7);
		const newCell9 = newRow.insertCell(8);
		
		// 빈 칸 및 라디오 버튼 추가
		newCell1.innerHTML = '<input type="radio" name="selectRow">';
		newCell2.innerHTML = '';
		newCell3.innerHTML = '';
		newCell4.innerHTML = '';
		newCell5.innerHTML = '';
		newCell6.innerHTML = '';
		newCell7.innerHTML = '';
		newCell8.innerHTML = '';
		newCell9.innerHTML = '';

	}
	
	// 테이블 행 삭제
	function deleteRowContentDetail(rownum){
		// 테이블 찾기
		const table = document.getElementById('table-detail-content');
		// 행 추가
		const newRow = table.deleteRow(rownum);
		
	}
	
	// .receive-order-detail-content 출력
	function loadPlaceOrderDetailList(){ 	
		
		let orderCode = $("input[name='selectRow']:checked").val();
		console.log("orderCode");
		
		if(orderCode){
			
			$.ajax({
				url: "/sales/receive-order/place-order-detail-list?orderCode=" + orderCode,
				type: "GET",
				dataType: "json",
				success: function(placeOrderDetailList){
					const table = $("#table-detail-content tbody");
					table.empty();
					placeOrderDetailList.forEach(function(order){  
						const row =$("<tr>");
						row.append('<td><input type="radio" name="selectDetailRow" value = '+ order.orderDetailCode +'></td>');
						row.append('<td>' + order.itemCode + '</td>');
						row.append('<td>' + order.itemName + '</td>');
						row.append('<td>' + order.quantity + '</td>');
						row.append('<td>' + order.price + '</td>');
						row.append('<td>' + order.amount + '</td>');
						row.append('<td>' + order.itemStockUnit + '</td>');
						row.append('<td>' + order.memo + '</td>');
						row.append('<td>' + order.endYn + '</td>');
						
						table.append(row);
					});
				},
				error: function(){
					console.log("place-order-detail-list Error");
				}
			});
			
		} else {
			const table = $("#table-detail-content tbody");
			table.empty();
		}
		
	}
	
	
	
	
	
	
	//document ready
	$(function() {
		
		// 조회 클릭 이벤트리스너
		$('#search-btn').click(function() {
			loadPlaceOrderList();
		});
		
		// radio 변경시 checked value 변경
		$(document).on('change', "input[name='selectRow']", function(){
			//console.log("change");
			loadPlaceOrderDetailList();
		});
		
		loadPlaceOrderList();
	});

</script>
</html>
>>>>>>> refs/remotes/origin/dev
