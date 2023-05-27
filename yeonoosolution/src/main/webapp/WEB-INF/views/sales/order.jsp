<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매</title>
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

.order-code {
	min-width: 100px;
}

.receive-order-type {
	min-width: 80px;
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
	min-width: 130px;
}

.order-detail-memo {
	min-width: 200px;
}

.order-number {
	min-width: 60px;
}
</style>
</head>
<body>
	<div id="contain">
		<input type="button" value="구매 발주" onclick=""> <input
			type="button" value="구매 입고 등록" onclick=""> <input
			type="button" value="구매 내역초회" onclick="">
		<div id="content">
			<div id="btn-div">
				<button id="search">조회</button>
				<button id="save">저장</button>
				<button id="delete">삭제</button>
				<button id="init">초기화</button>
				<button id="order-confirm">발주 확정</button>
				<button id="order-cancel">확정 취소</button>
				<button id="stock_in">입고</button>
				<button id="order-close">발주 마감</button>
			</div>
			<div id="search-div">
				<div>
					<p>조회 시작일</p>
					<input type="date" id="search-start-day">
				</div>
				<div>
					<p>조회 종료일</p>
					<input type="date" id="search-end-day">
				</div>
				<div>
					<p>발주 일자</p>
					<input type="date" id="search-order-day">
				</div>
				<div>
					<p>거래처 코드(검색)</p>
					<input type="text" id="search-customer-code">
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
				<button type="button" class="table-btn" id="order-add">+</button>
				<button type="button" class="table-btn" id="order-del">-</button>
			</div>
			<div id="order-list">
				<table id="order-list-table-heder"
					class="order-list-table order-tables order-tables-hearder">
					<thead>
						<tr>
							<th class="order-number"></th>
							<th class="order-radio"></th>
							<th class="order-status">상태</th>
							<th class="order-code">발주서 번호</th>
							<th class="receive-order-type">구매유형</th>
							<th class="order-date">발주일자</th>
							<th class="customer-code">거래처코드</th>
							<th class="customer-name">거래처명</th>
							<th class="due-date">납기일자</th>
							<th class="order-empid">담당자명</th>
							<th class="delivery-plan">인도장소</th>
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
				<button type="button">+</button>
				<button type="button">-</button>
			</div>
			<div id="order-detail">
				<table id="order-detail-list-table-heder"
					class="order-detail-list-table order-tables order-tables-hearder">
					<thead>
						<tr>
							<th class="item-sorder"></th>
							<th class="item-checkbox"><input type="checkbox"
								id="all-check"></th>
							<th class="item-code">ITEM코드</th>
							<th class="item-name">품명</th>
							<th class="item-stock-unit">재고단위</th>
							<th class="quantity">발주수량</th>
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
	<!-- contain -->
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script>
	// 초기화 버튼
	$('#init').click(function(){
		 $('#search-div input').val('');
	});
	// 거래처 코드 검색 시 모달창 나오도록 대기
	/* $('#search-customer-code').on('input', function(){
		console.log($('.order-radio-select:checked').parent().siblings('.customer-code').text($(this).val()));
	}); */
	
	// 클릭한 발주 라디오 값 저장
	let radioCheck = null;
	// 발주서 세부항목 불러오기
	function orderDetailList(orderCode){
		if(orderCode == radioCheck){
			return;
		}
		$.ajax({
			url: "/pm/order/" + orderCode +"/details",
			type : "GET",
			dataType : "JSON",
			success : function(OrdersDetailList){
				$('#order-detail-list-table tbody').empty();
				OrdersDetailList.forEach(function(OrdersDetail){
					let orderDetailRow = $('<tr>');
					let Sorder = $('<td>').addClass('item-sorder').text(OrdersDetail.sorder);
					let Checkbox = $('<td>').addClass('item-checkbox').append($("<input type='checkbox' class='order-detail-checkbox'>"));
					let itemCode = $('<td>').addClass('item-code').text(OrdersDetail.itemCode);
					let itemName = $('<td>').addClass('item-name').text(OrdersDetail.itemName);
					let itemStockUnit = $('<td>').addClass('item-stock-unit').text(OrdersDetail.itemStockUnit);
					let quantity = $('<td>').addClass('quantity').text(OrdersDetail.quantity);
					let price = $('<td>').addClass('item-price').text(OrdersDetail.price);
					let amount = $('<td>').addClass('amount').text(OrdersDetail.amount);
					let memo = $('<td>').addClass('order-detail-memo').text(OrdersDetail.memo);
					orderDetailRow.append(Sorder).append(Checkbox).append(itemCode).append(itemName).append(itemStockUnit).append(quantity)
							.append(price).append(amount).append(memo);
					$('#order-detail-list-table tbody').append(orderDetailRow);
					
					radioCheck = orderCode;
				});
			}
		})
	}
	function orderAdd(order, index){
		let orderRow = $('<tr>').addClass('order-table-tr-area');
		let orderNumber = $('<td>').addClass('order-number').text(index);
		let orderRadio = $('<td>').addClass('order-radio').append($("<input type='radio' class='order-radio-select' value='" + order.orderCode +"' name='chk_info'>"));
		let orderStatus = $('<td>').addClass('order-status').text(order.orderStatus);
		let orderCode = $('<td>').addClass('order-code').text(order.orderCode);
		let receiveOrderType = $('<td>').addClass('receive-order-type change-td').text(order.receiveOrderType);
		let orderDate = $('<td>').addClass('order-date change-td').text(order.orderDate);
		let customerCode = $('<td>').addClass('customer-code').text(order.customerCode);
		let customerName = $('<td>').addClass('customer-name').text(order.customerName);
		let dueDate = $('<td>').addClass('due-date change-td').text(order.dueDate);
		let orderEmpid = $('<td>').addClass('order-empid').text(order.orderEmpid);
		let deliveryPlan = $('<td>').addClass('delivery-plan change-td').text(order.deliveryPlan);
		let regDate = $('<td>').addClass('reg-date').text(order.regDate);
		let regUser = $('<td>').addClass('reg-user').text(order.regUser);
		let updateDate = $('<td>').addClass('update-date').text(order.updateDate);
		let updateUser = $('<td>').addClass('update-user').text(order.updateUser);
		let memo = $('<td>').addClass('order-memo change-td').text(order.memo);
		orderRow.append(orderNumber).append(orderRadio).append(orderStatus).append(orderCode).append(receiveOrderType).append(orderDate)
				.append(customerCode).append(customerName).append(dueDate).append(orderEmpid).append(deliveryPlan).append(regDate)
				.append(regUser).append(updateDate).append(updateUser).append(memo);
		$('#order-list-table tbody').append(orderRow);
	};
	$('.table-btn').click(function(){
		let btnId = $(this).attr('id');
		// 발주서 추가버튼
		if(btnId == 'order-add') {
			let rowCount = $("#order-list-table tbody tr").length;
			 orderAdd({}, rowCount + 1);
		}
	});
	// 라디오 버튼이 변경되면 발주번호에 맞는 세부항목 ajax로 불러오기
	$(document).on('change', '.order-radio-select', function(){
			orderDetailList($(this).val());
		});
	// 테이블 행 클릭 시 라디오 버튼 체크표시
	$(document).on('click', 'td', function(){
			let radioInput = $(this).siblings('.order-radio').find('input[type="radio"]');
			radioInput.prop('checked', true);
			let orderTableTr = $(this).parent();
			$('#search-order-day').val(orderTableTr.find('.order-date').text());
			$('#search-customer-code').val(orderTableTr.find('.customer-code').text());
			$('#search-customer-name').removeAttr('readonly');
			$('#search-customer-name').val(orderTableTr.find('.customer-name').text());
			$('#search-customer-name').attr('readonly', 'readonly');
			$('#order-empid').val(orderTableTr.find('.order-empid').text());
			orderDetailList(radioInput.val());
			$('#all-check').prop('checked', false);
			
	});
	// 더블 클릭 시 input태그로 변환
	$(document).on('dblclick', '.change-td', function() {
			let elementClass = $(this).attr('class');
			console.log(elementClass);
			let dbclickTd = $(this);
			let value = $(this).text();
			let tdWidth = $(this).width() - 10;
			dbclickTd.empty();
			if(elementClass.includes('date')){
				dbclickTd.append($('<input type="date">').addClass('change-text-input-td').val(value).css('width', tdWidth+'px'));
				$('.change-text-input-td').focus();
			} else if(elementClass.includes('receive-order-type')) {
				dbclickTd.append($('<select>').addClass('change-text-input-td').val(value).css('width', tdWidth+'px')
						.append($("<option>").val('일반구매').text('일반구매'))
						.append($("<option>").val('특별구매').text('특별구매'))
						.append($("<option>").val('외주구매').text('외주구매'))
				);
					
				$('.change-text-input-td').focus();
			} else {
				dbclickTd.append($('<input>').addClass('change-text-input-td').val(value).css('width', tdWidth+'px'));
				$('.change-text-input-td').focus();
			}
			// input태그 작성 중 엔터 시 작성된 값을 text로 변환하여 출력
			$(document).on("keydown", '.change-text-input-td', function(event) {
				if (event.keyCode === 13) {
					let dbEnterTd = $(this).parent();
					let value1 = $(this).val();
					dbEnterTd.empty();
					dbEnterTd.text(value1);
			    }
			});
			// input태그 작성 중 다른 곳 클릭시 작성된 값을 text로 변환하여 출력
			$(document).on("click", function(event) {
				let target = $(event.target);
				if (!target.closest(".change-text-input-td").length) {
					let dbEnterTd = $('.change-text-input-td').parent();
					let value1 = $('.change-text-input-td').val();
					dbEnterTd.empty();
					dbEnterTd.text(value1);
				  }
			});
	});
	// 발주서 검색기능
	function orderList(){
		let startDate = $('#search-start-day').val();
		let endDate = $('#search-end-day').val();
		let orderDate = $('#search-order-day').val();
		let customerCode = $('#search-customer-code').val();
		let orderEmpid = $('#order-empid').val();
		$.ajax({
			url: "/pm/order-list",
			type : "GET",
			dataType : "JSON",
			data : { startDate : startDate,
					 endDate : endDate,
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
	$('#search').click(function(){
		orderList();
	});
	
	// 페이지 로드 시 전체 발주서 불러오기
	$(function() {
		orderList();
	});
	</script>
</body>
</html>
