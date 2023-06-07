<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
#search-div {
	padding: 10px 0px;
}
#content > div{
	margin-left: 30px;
}
.main-container {
	overflow: auto!important;
}
.search-div {
	display: flex;
}
#search-div div {
	display: flex;
	margin: 5px 30px 5px 0px;
}
#search-div label{
	line-height: 30px;
	border: 1px solid #B3B3B3;
    border-radius: 5px;
    padding: 0 5px;
    background-color: #F8F8F8;
}
.table-div { 
	border: 1px solid #B3B3B3;
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
	min-width: 500px;
	max-width: 500px;
}

.order-number {
	min-width: 60px;
	max-width: 60px;
}
.td-hidden {
	visibility: hidden;
}

.side-bar {
	border: 1px solid #ddd;
	padding: 20px;
	float: left;
	height: 100vh;
	min-width: 200px;
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
	border: 1px solid #B3B3B3;
	border-radius: 7px;
	align-items: center;
	background-color: #F8F8F8;
	font-size: 14px;
    padding: 5px 10px;
}
.order-btn-cl:hover {
	background-color: #ffffcc;
}
#btn-div button {
	border: 1px solid #B3B3B3;
    border-radius: 7px;
    align-items: center;
    background-color: #F8F8F8;
    padding: 5px 10px;
}
#btn-div button:hover {
	background-color: #ffffcc;
}
.tuigrid-header span {
	line-height: 32.33px;
}
hr {
	margin-left: 30px!important;
}
</style>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script>
	$(function(){
		
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

			let ordernullCheck = true;
			saveOrderTr.find('.change-td').each(function() {
			  	let text = $(this).text().trim();
				let hasMemoClass = $(this).hasClass('order-memo');
			  	if ((text === '' && !hasMemoClass) || (text === '' && !$(this).hasClass('delivery-plan'))) {
			  		ordernullCheck = false;
			    	return false;
		  		}
			});
			if (!ordernullCheck) {
			  	alert("선택하신 발주서에 필수 작성 항목이 작성되지 않았습니다. 다시 확인해주세요.");
			  	return;
			}
			let order = {
				customerCode : saveOrderTr.find('.customer-code').text(),
				receiveOrderType : saveOrderTr.find('.receive-order-type').text(),
				orderDate : saveOrderTr.find('.order-date').text(),
				orderEmpid : saveOrderTr.find('.order-empid').text(),
				deliveryPlan : saveOrderTr.find('.delivery-plan').text(),
				dueDate : saveOrderTr.find('.due-date').text(),
				memo : saveOrderTr.find('.memo').text()
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
						memo : $(this).find('.order-memo').text(),
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
				url : "/sales/order-add",
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
				let nullable = $(this).hasClass('nullable');
			  	if (text === '' && !nullable) {
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
				customerCode : saveOrderTr.find('.customer-code').text(),
				receiveOrderType : saveOrderTr.find('.receive-order-type').text(),
				orderDate : saveOrderTr.find('.order-date').text(),
				orderEmpid : saveOrderTr.find('.order-empid').text(),
				deliveryPlan : saveOrderTr.find('.delivery-plan').text(),
				dueDate : saveOrderTr.find('.due-date').text(),
				memo : saveOrderTr.find('.order-memo').text()
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
					let nullable = $(this).hasClass('nullable');
				  	if (text === '' && !nullable) {
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
				url : "/sales/order-modify",
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
		let itemStockUnit = $('<td>').addClass('item-stock-unit non-change').text(orderDetail.itemStockUnit);
		let quantity = $('<td>').addClass('quantity change-td non-modal-change').text(orderDetail.quantity);
		let price = $('<td>').addClass('item-price change-td non-modal-change').text(orderDetail.price);
		let amount = $('<td>').addClass('amount non-change').text(orderDetail.amount);
		let memo = $('<td>').addClass('order-detail-memo change-td nullable').text(orderDetail.memo);
		orderDetailRow.append(Sorder).append(Checkbox).append(itemCode).append(itemName).append(itemStockUnit).append(quantity)
				.append(price).append(amount).append(memo);
		$('#order-detail-list-table tbody').append(orderDetailRow);
	};
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
			url: "/sales/order/" + orderCode +"/details",
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
		let orderRadio = $('<td>').addClass('order-radio').append($("<input type='radio' class='order-radio-select' value='" + order.orderCode +"' name='chk_info'>"));
		let orderStatus = $('<td>').addClass('order-status non-change').text(order.orderStatus);
		let orderCode = $('<td>').addClass('order-code non-change').text(order.orderCode);
		let receiveOrderType = $('<td>').addClass('receive-order-type change-td non-modal-change').text(order.receiveOrderType);
		let orderDate = $('<td>').addClass('order-date change-td non-modal-change').text(order.orderDate);
		let customerCode = $('<td>').addClass('customer-code change-td modal-change').text(order.customerCode);
		let customerName = $('<td>').addClass('customer-name non-change').text(order.customerName);
		let dueDate = $('<td>').addClass('due-date change-td non-modal-change').text(order.dueDate);
		let orderEmpid = $('<td>').addClass('order-empid').text(order.orderEmpid);
		let deliveryPlan = $('<td>').addClass('delivery-plan change-td nullable').text(order.deliveryPlan);
		let regDate = $('<td>').addClass('reg-date non-change').text(order.regDate);
		let regUser = $('<td>').addClass('reg-user non-change').text(order.regUser);
		let updateDate = $('<td>').addClass('update-date non-change').text(order.updateDate);
		let updateUser = $('<td>').addClass('update-user non-change').text(order.updateUser);
		let memo = $('<td>').addClass('order-memo change-td nullable').text(order.memo);
		orderRow.append(orderNumber).append(orderRadio).append(orderStatus).append(orderCode).append(receiveOrderType).append(orderDate)
				.append(customerCode).append(customerName).append(dueDate).append(orderEmpid).append(deliveryPlan).append(memo)
				.append(regDate).append(regUser).append(updateDate).append(updateUser);
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
		}else if(elementClass.includes('quantity')){
			dbclickTd.append($('<input type="number">').addClass('change-text-input-td').val(value).css('width', tdWidth+'px'));
		} else if(elementClass.includes('receive-order-type')) {
			dbclickTd.append($('<select>').addClass('change-text-input-td').val(value).css('width', tdWidth+'px')
					 .append($("<option>").val('일반구매').text('일반구매'))
					 .append($("<option>").val('특별구매').text('특별구매'))
					 .append($("<option>").val('외주구매').text('외주구매'))
			);
				
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
		let startDate = $('#search-start-day').val();
		let endDate = $('#search-end-day').val();
		let orderDate = $('#search-order-day').val();
		let customerCode = $('#search-customer-code').val();
		let orderEmpid = $('#order-empid').val();
		$.ajax({
			url: "/sales/order-list",
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
					orderAdd(order, index + 1);
				});
				radioOrderCode = null;
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
			}else if(btnId == 'order-close-btn'){
				$('#modal-order-status-update').find('h5').text('발주 마감 하시겠습니까?');
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
			url: "/sales/order/" + orderCode,
			type : "PATCH",
			data : {
				orderCode : orderCode,
				column : column,
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
	}
	
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
	
	// 모달 확인 버튼 클릭
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
		orderList();
	});
	</script>
