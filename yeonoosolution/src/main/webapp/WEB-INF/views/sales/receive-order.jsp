<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<style type="text/css">
	.table-content {
		overflow: auto;
		white-space: nowrap;
	}
	

	
	
</style>
</head>
<body>
	
<div class="receive-order-container">

	<div class="receive-order-btn">
		
		<button type="button" id="search-btn" value="조회">조회</button>
		<button type="button" id="delete-btn" value="삭제">삭제</button>
		<button type="button" id="order-confirmation-btn" value="수주 확정">수주 확정</button>
		<button type="button" id="confirmation-cancel-btn" value="확정 취소">확정 취소</button>
		<button type="button" id="stock-out-reg-btn" value="출하 등록">출하 등록</button>
		<button type="button" id="work-order-reg-btn" value="작업 지시 등록">작업 지시 등록</button>
		<button type="button" id="analysis-bom-btn" value="작업 지시 등록" onclick="location.href='/sales/analysis-of-materials'">자재 요소 분석</button>
		
	</div>

	<div class="receive-order-top-content">
	
		<div >
		
			<!-- <span>수주번호</span>
			<input type="text" id="order-code" name="orderCode"> -->
			<span>수주유형</span>
			<select id="receive-order-type" name="receiveOrderType">
				<option value="자체생산">자체생산</option>
				<option value="OEM">OEM</option>
				<option value="ODM">ODM</option>
			</select>
			<span>수주일</span>
			<input type="date" id="order-date" name="orderDate"> 
			<span>수주담당자</span>
			<input type="text" id="order-empid" name="orderEmpid">
			<button type="button" id="modify-order-empid-btn" value="수정">수정</button>
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
		
		<form method="post" action="/sales/om/insert-receive-order" name="frm">
			<table id="table-insert-receive">
				<tr>
					<th>거래처코드</th>
					<td>
						<input type="text" id="customer-code" name="customerCode" required="required" readonly="readonly">
						<button id="customer-code-modal-btn" data-bs-toggle="modal" data-bs-target="#customer-code-modal" value="조회">조회</button>
					</td>
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
					<td>
						<input type="text" id="company-name-modal" name="companyName" required="required" readonly="readonly">
					</td>
				</tr>
				<tr>
					<th>수주일</th>
					<td><input type="date" name="orderDate" required="required"></td>
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
					<td><input type="date" name="dueDate" required="required" ></td>
				</tr>
				<tr>
					<th>등록자</th>
					<td><input type="text" name=regUser ></td>
				</tr>
				<tr>
					<th>수정자</th><td><input type="text" name="updateUser" ></td>
				</tr>
										
				<tr>
					<td colspan="2">
					<input type="submit" value="확인"></td>
				</tr>
			</table>
		</form>	<!-- /action="/sales/om/insert-receive-order" -->
		
		<!-- 회사코드 모달 창 -->
		<div class="modal fade" id="customer-code-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">거래처 선택</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div id="customer-code-list"></div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
				</div>
			</div>
		</div>
					
	
	</div>	<!-- /class="receive-order-table-content" -->
	
	
	<div class="receive-order-detail-top-content">
	
		<div >
		
			<span>제품코드</span>
			<!-- <td> -->
				<input type="text" id="modify-item-code" name="itemCode" required="required" readonly="readonly">
			<!-- </td> -->
			<span>품명</span>
			<!-- <td> -->
				<input type="text" id="modify-item-name" name="itemName" required="required" readonly="readonly">
				<button type="button" id="modify-item-code-modal-btn" data-bs-toggle="modal" data-bs-target="#modify-item-code-modal" value="제품조회">제품조회</button>
				<button type="button" id="modify-item-btn" value="제품수정">제품수정</button>
			<!-- </td> -->
			<span>수량</span>
			<input type="number" id="modify-quantity" name="modifyQuantity" value="0">
			<span>단가</span>
			<input type="number" id="modify-price" name="modifyPrice" value="0"> 
			<span>금액</span>
			<input type="number" id="modify-amount" name="modifyAmount" value="0" readonly="readonly"> 
			<button type="button" id="modify-amount-btn" value="금액수정">금액수정</button>
			<span>재고단위</span>
			<select id="item-stock-unit" name="itemStockUnit">
				<option value="EA">EA</option>
				<option value="KG">KG</option>
			</select>
			<span>비고</span>
			<input type="text" id="modify-memo" name="modifyMemo">
			<button type="button" id="modify-memo-btn" value="수정">수정</button>
			<span>마감여부</span>
			<select id="end-yn" name="endYn">
				<option value="N">N</option>
				<option value="Y">Y</option>
			</select>
		</div>
		
		<!-- 제품코드 수정 모달 창 -->
		<div class="modal fade" id="modify-item-code-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">제품 선택</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div id="modify-item-code-list"></div>
				</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary">Save changes</button>
					</div>
				</div>
			</div>
		</div>
		
	</div>	<!-- /class="receive-order-detail-top-content" -->
	
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
	
		<form method="post" action="/sales/om/insert-receive-order-detail" name="frm-detail">
			
			<table id="table-insert-receive-detail">
			
				<tr>
					<th>제품코드</th>
					<td>
						<input type="text" id="item-code" name="itemCode" required="required" readonly="readonly">
						<button type="button" id="item-code-modal-btn" data-bs-toggle="modal" data-bs-target="#item-code-modal" value="제품조회">제품조회</button>
					</td>
				</tr>
				<tr>
					<th>품명</th>
					<td>
						<input type="text" id="item-name-modal" name="itemName" required="required" readonly="readonly">
					</td>
				</tr>
				<tr>
					<th>수량</th>
					<td><input type="number" id="quantity" name="quantity" value="0">
					</td>
				</tr>
				<tr>
					<th>단가</th>
					<td><input type="number" id="price" name="price" value="0"></td>
				</tr>
				<tr>
					<th>금액</th>
					<td><input type="number" id="amount" name="amount" value="0" readonly="readonly" ></td>
				</tr>	
				<tr>
					<th>재고단위</th>
					<td>
					<select name="itemStockUnit">
						<option value="EA">EA</option>
						<option value="KG">KG</option>
					</select>
					</td>
				</tr>
				<tr>
					<th>비고</th>
					<td><input type="text" name="memo" ></td>
				</tr>
				<tr>
					<th>마감여부</th>
					<td>
					<select name="endYn">
						<option value="N">N</option>
						<option value="Y">Y</option>
					</select>
					</td>
				</tr>
										
				<tr>
					<td colspan="2">
					<input type="submit" value="확인"></td>
				</tr>
			</table>
 			<!-- <input type="hidden" name="orderCodeHidden" id="order-code-hidden" value=""> --> 
			<input type="hidden" name="orderDetailCode" id="order-detail-code" value=""> 
			
		</form>	<!-- /action="/sales/om/insert-receive-order-detail" -->
		
		<!-- 제품코드 모달 창 -->
		<div class="modal fade" id="item-code-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">제품 선택</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div id="item-code-list"></div>
				</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary">Save changes</button>
					</div>
				</div>
			</div>
		</div>
		
	</div>	<!-- /class="receive-order-detail-content" -->

</div>	<!-- /class="receive-order-container" -->

</body>

<script type="text/javascript">

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
					row.append('<td>' + order.orderDate.substring(0, 10) + '</td>');
					row.append('<td>' + order.orderEmpid + '</td>');
					//row.append('<td>' + order.deliveryPlan + '</td>');
					row.append('<td>' + (order.deliveryPlan ? order.deliveryPlan : '') + '</td>');
					row.append('<td>' + order.dueDate.substring(0, 10) + '</td>');
					row.append('<td>' + order.regDate.substring(0, 10) + '</td>');
					row.append('<td>' + order.regUser + '</td>');
					row.append('<td>' + order.updateDate.substring(0, 10) + '</td>');
					//row.append('<td>' + order.updateUser + '</td>');
					row.append('<td>' + (order.updateUser ? order.updateUser : '') + '</td>');
					
					table.append(row);
					 
				});
			},
			error: function(){
				console.log("place-order-list Error");
			}
		});
		
	}
	
	//receive-order CRUD 변경 , 삭제
	$(function(){
		
		$('#order-confirmation-btn').click(function(){
			let orderCode = $("input[name='selectRow']:checked").val();
			
			if (!orderCode) {
				alert("항목을 선택해주세요."); 
				return; 
			}
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
			
			if (!orderCode) {
				alert("항목을 선택해주세요."); 
				return; 
			}
			
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
			
			if (!orderCode) {
				alert("항목을 선택해주세요."); 
				return; 
			}
			
			$.ajax({
				url: "/sales/receive-order/" + orderCode + "/modify-type",
				type: "PATCH",
				data: { receiveOrderType : selectedType },
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
		
		//삭제
		$('#delete-btn').click(function(){
			let orderCode = $("input[name='selectRow']:checked").val();
			console.log("delete-btn orderCode => " + orderCode);
			
			if (!orderCode) {
				alert("항목을 선택해주세요."); 
				return; 
			}
			
			$.ajax({
				url: "/sales/receive-order/" + orderCode + "/delete",
				type: "DELETE",
				success: function(){
					console.log("삭제되었습니다");
					loadPlaceOrderList();
				},
				error: function(){
					console.log("DELETE Error");
				}
			});
			
		});
		
		
		// 수주일 변경
		$('#order-date').change(function(){
			let selectedDate = $(this).val();
			let orderCode = $("input[name='selectRow']:checked").val();
			console.log("order-date => " + selectedDate);
			
			if (!orderCode) {
				alert("항목을 선택해주세요."); 
				return; 
			}
			
			$.ajax({
				url: "/sales/receive-order/" + orderCode + "/change-order-date",
				type: "PATCH",
				data: { orderDate : selectedDate },
				dataType: "text",
				success: function(orderDate){
					console.log("수주일 변경 성공" + orderDate);
					loadPlaceOrderList();
				},
				error: function(){
					console.log("수주일 변경 성공 Error");
				}
			});
			
		});
		
		
		// 납기일 변경
		$('#due-date').change(function(){
			let selectedDate = $(this).val();
			let orderCode = $("input[name='selectRow']:checked").val();
			console.log("due-date => " + selectedDate);
			
			if (!orderCode) {
				alert("항목을 선택해주세요."); 
				return; 
			}
			
			$.ajax({
				url: "/sales/receive-order/" + orderCode + "/change-due-date",
				type: "PATCH",
				data: { dueDate : selectedDate },
				dataType: "text",
				success: function(dueDate){
					console.log("납기일 변경 성공" + dueDate);
					loadPlaceOrderList();
				},
				error: function(){
					console.log("납기일 변경 성공 Error");
				}
			});
			
		});
		
		// 수주담당자 변경
		$('#modify-order-empid-btn').click(function(){
			let orderCode = $("input[name='selectRow']:checked").val();
			let orderEmpid = $("#order-empid").val();
			
			if (!orderCode) {
				alert("항목을 선택해주세요."); 
				return; 
			}
			
			if (orderEmpid == '') {
				alert("이름을 작성해주세요."); 
				return; 
			}
			
			console.log("수주담당자 수정 orderCode -> " + orderCode);
			console.log("수주담당자 수정 orderCode -> " + orderEmpid);
			
			$.ajax({
				url: "/sales/receive-order/" + orderCode + "/modify-empid",
				type: "PATCH",
				data: JSON.stringify({
					orderEmpid : orderEmpid
				}),
				contentType: 'application/JSON',						
				dataType: "json",
				success: function(data){
					console.log("담당자 수정 성공" + data);
					loadPlaceOrderList();
				},
				error: function(){
					console.log("modify-empid Error");
				}
			});
			
		});
		
	});	//receive-order CRUD
	
	
	// 회사코드 모달 창 
	$(function() {
	  	console.log('모달 콘솔')
	  	
	  	$.ajax({
	  		url : '/sales/receive-order/customer-code-list',
	  		type : 'GET',
	  		dataType : 'json',
	  		success : function(data) {
	  			let ul = $('#customer-code-list');
	  			ul.empty();
	  			for (var i = 0; i < data.length; i++) {
	  				let item = data[i];
	                let radio = $('<input type="radio" name="customer" value="' + item.companyCode + '">');
	                let label = $('<label>' + item.companyCode + ' - ' + item.companyName + '</label>');
					let span = $('<span></span></br>').append(radio).append(label);
	                ul.append(span);
	                
	  			}
	  		},
	  		error: function(xhr, status, error) {
			      console.log('Error:', error);
			}
	  	});
	  	
	  	$('#customer-code-modal .btn-primary').click(function(){
	  		let selectedCustomer = $('input[name="customer"]:checked');
	  		
	  		if(selectedCustomer.length > 0){
	  			let companyCode = selectedCustomer.val();
	  			let companyName = selectedCustomer.next('label').text().split(' - ')[1];
	  			$('#customer-code').val(companyCode);
	  			$('#company-name-modal').val(companyName);
	  			console.log('selectedCustomer -> ' + companyCode);
		  		console.log('selectedCustomer -> ' + companyName);
	  		}
	  		
	  		$('#customer-code-modal').modal('hide');
	  		
	  	});
	});
	
	
	
	
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	
	
	// .receive-order-detail-content 출력
	function loadPlaceOrderDetailList(){ 	
		
		let orderCode = $("input[name='selectRow']:checked").val();
		//console.log("orderCode");
		
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
						//row.append('<td>' + order.memo + '</td>'); 
						row.append('<td>' + (order.memo ? order.memo : '') + '</td>');
						row.append('<td>' + order.endYn + '</td>');
						
						table.append(row);
						
					});
				},
				error: function(){
					console.log("place-order-detail-list Error");
				}
			});
			
			//
			
			/*
			$.ajax({
				url: "/sales/receive-order/place-order-detail-list?orderCode=" + orderCode,
				type: "GET",
				dataType: "json",
				success: function(placeOrderDetailList){
					const table = $("#table-detail-content tbody");
					const checkedRowId = $('input[name="selectDetailRow"]:checked').val(); // 이전에 체크된 radio의 값
					
					table.empty();
					placeOrderDetailList.forEach(function(order){ 
						
						const row =$("<tr>");
						const radio = $('<input type="radio" name="selectDetailRow">').val(order.sorder);
						
						if(order.orderDetailCode === checkedRowId){
							radio.prop("checked", true); // 이전에 체크된 radio 선택
						}
						
						row.append($('<td>').append(radio));
						row.append('<td>' + order.itemCode + '</td>');
						row.append('<td>' + order.itemName + '</td>');
						row.append('<td>' + order.quantity + '</td>');
						row.append('<td>' + order.price + '</td>');
						row.append('<td>' + order.amount + '</td>');
						row.append('<td>' + order.itemStockUnit + '</td>');
						row.append('<td>' + order.memo + '</td>');
						row.append('<td>' + order.endYn + '</td>');
						
						table.append(row);
						console.log('detail radio -> '+ order.sorder) ;
					});
				},
				error: function(){
					console.log("place-order-detail-list Error");
				}
			});
			*/
			//
			
		} else {
			const table = $("#table-detail-content tbody");
			table.empty();
		}
		
	}
	
	//receive-order-detail CRUD 변경 , 삭제
	$(function(){
		
		// 금액 update
		$('#modify-amount-btn').click(function(){
			let orderDetailCode = $("#order-detail-code").val();
			let quantity = $('#modify-quantity').val();
			let price = $('#modify-price').val();
			let amount = $('#modify-amount').val();
			
			console.log("금액수정 orderDetailCode " + orderDetailCode);
			$.ajax({
				url: "/sales/receive-order/" + orderDetailCode + "/modify-amount",
				type: "PATCH",
				data: JSON.stringify({
					orderDetailCode	  : orderDetailCode,
					quantity : quantity,
					price : price,
					amount  : amount
				}),
				contentType: 'application/JSON',						
				dataType: "json",
				success: function(data){
					console.log("금액수정성공" + data);
					loadPlaceOrderDetailList();
				},
				error: function(){
					console.log("modify-amount Error");
				}
			});
			
		});
				
		
		// 재고단위 update
		$('#item-stock-unit').change(function(){
			let selectedType = $(this).val();
			let orderDetailCode = $("#order-detail-code").val();
			console.log("item-stock-unit => " + selectedType);
			
			$.ajax({
				url: "/sales/receive-order/" + orderDetailCode + "/modify-item-stock-unit",
				type: "PATCH",
				data: { itemStockUnit : selectedType },
				dataType: "text",
				success: function(data){
					console.log("재고단위 변경 성공" + data);
					loadPlaceOrderDetailList();
				},
				error: function(){
					console.log("재고단위 변경 Error");
				}
			});
			
		});
		
		
		// 마감여부 update
		$('#end-yn').change(function(){
			let selectedType = $(this).val();
			let orderDetailCode = $("#order-detail-code").val();
			console.log("end-yn => " + selectedType);
			
			$.ajax({
				url: "/sales/receive-order/" + orderDetailCode + "/modify-end-yn",
				type: "PATCH",
				data: { endYn : selectedType },
				dataType: "text",
				success: function(data){
					console.log("마감여부 변경 성공" + data);
					loadPlaceOrderDetailList();
				},
				error: function(){
					console.log("마감여부 변경 Error");
				}
			});
			
		});
		
		// 제품 update
		$('#modify-item-btn').click(function(){
			let orderDetailCode = $("#order-detail-code").val();
			let itemCode = $('#modify-item-code').val();
			let itemName = $('#modify-item-name').val();
			
			console.log("제품수정 orderDetailCode -> " + orderDetailCode);
			console.log("제품수정 itemCode -> " + itemCode);
			console.log("제품수정 itemName -> " + itemName);
			
			$.ajax({
				url: "/sales/receive-order/" + orderDetailCode + "/modify-item",
				type: "PATCH",
				data: JSON.stringify({
					//orderDetailCode	  : orderDetailCode,
					itemCode : itemCode,
					itemName : itemName
				}),
				contentType: 'application/JSON',						
				dataType: "json",
				success: function(data){
					console.log("제품수정성공" + data);
					loadPlaceOrderDetailList();
				},
				error: function(){
					console.log("modify-item Error");
				}
			});
			
		});
		
		// 비고 변경
		$('#modify-memo-btn').click(function(){
			let orderDetailCode = $("#order-detail-code").val();
			let modifyMemo = $("#modify-memo").val();
			
			if (!orderDetailCode) {
				alert("항목을 선택해주세요."); 
				return; 
			}
			
			if (modifyMemo == '') {
				alert("내용을 작성해주세요."); 
				return; 
			}
			
			console.log("비고 수정 orderDetailCode -> " + orderDetailCode);
			console.log("비고 수정 modifyMemo -> " + modifyMemo);
			
			$.ajax({
				url: "/sales/receive-order/" + orderDetailCode + "/modify-memo",
				type: "PATCH",
				data: JSON.stringify({
					memo : modifyMemo
				}),
				contentType: 'application/JSON',						
				dataType: "json",
				success: function(data){
					console.log("담당자 수정 성공" + data);
					loadPlaceOrderDetailList();
				},
				error: function(){
					console.log("modify-memo Error");
				}
			});
			
		});
		
	});	// receive-order-detail CRUD
	
	// 제품코드 수정 모달 창 
	$(function() {
	  	console.log('모달 콘솔')
	  	
	  	$.ajax({
	  		url : '/sales/receive-order/item-code-list',
	  		type : 'GET',
	  		dataType : 'json',
	  		success : function(data) {
	  			let ul = $('#modify-item-code-list');
	  			ul.empty();
	  			for (var i = 0; i < data.length; i++) {
	  				let item = data[i];
	                let radio = $('<input type="radio" name="item" value="' + item.itemCode + '">');
	                let label = $('<label>' + item.itemCode + ' - ' + item.itemName + '</label>');
					let span = $('<span></span></br>').append(radio).append(label);
	                ul.append(span);
	                
	  			}
	  		},
	  		error: function(xhr, status, error) {
			      console.log('Error:', error);
			}
	  	});
	  	
	  	$('#modify-item-code-modal .btn-primary').click(function(){
	  		let selectedItem = $('input[name="item"]:checked');
	  		
	  		if(selectedItem.length > 0){
	  			let itemCode = selectedItem.val();
	  			let itemName = selectedItem.next('label').text().split(' - ')[1];
	  			$('#modify-item-code').val(itemCode);
	  			$('#modify-item-name').val(itemName);
	  			console.log('selectedItemCode -> ' + itemCode);
		  		console.log('selectedItemName -> ' + itemName);
	  		}
	  		
	  		$('#modify-item-code-modal').modal('hide');
	  		
	  	});
	});
	
	// 제품코드 삽입 모달 창 
	$(function() {
	  	console.log('모달 콘솔')
	  	
	  	$.ajax({
	  		url : '/sales/receive-order/item-code-list',
	  		type : 'GET',
	  		dataType : 'json',
	  		success : function(data) {
	  			let ul = $('#item-code-list');
	  			ul.empty();
	  			for (var i = 0; i < data.length; i++) {
	  				let item = data[i];
	                let radio = $('<input type="radio" name="item" value="' + item.itemCode + '">');
	                let label = $('<label>' + item.itemCode + ' - ' + item.itemName + '</label>');
					let span = $('<span></span></br>').append(radio).append(label);
	                ul.append(span);
	                
	  			}
	  		},
	  		error: function(xhr, status, error) {
			      console.log('Error:', error);
			}
	  	});
	  	
	  	$('#item-code-modal .btn-primary').click(function(){
	  		let selectedItem = $('input[name="item"]:checked');
	  		
	  		if(selectedItem.length > 0){
	  			let itemCode = selectedItem.val();
	  			let itemName = selectedItem.next('label').text().split(' - ')[1];
	  			$('#item-code').val(itemCode);
	  			$('#item-name-modal').val(itemName);
	  			console.log('selectedItemCode -> ' + itemCode);
		  		console.log('selectedItemName -> ' + itemName);
	  		}
	  		
	  		$('#item-code-modal').modal('hide');
	  		
	  	});
	});
	
	
	// receive-order에서 선택된 radio의 orderCode를 detail의 hidden에 저장하는 함수 실행
	$(document).on('change', "input[name='selectRow']", function(){
		//console.log("change");
		assignOrderCodeToHiddenInput();
		console.log('radio실행');
	});
	
	
	// 선택된 radio 버튼의 값을 hidden input에 할당하는 함수
	function assignOrderCodeToHiddenInput() {
	    const selectedOrderCode = $("input[name='selectRow']:checked").val();
	    $("#order-detail-code").val(selectedOrderCode);
	    console.log("order-detail-code value -> " + $("#order-detail-code").val());

	}
	
	function calculateAmount() {
		let quantity = $('#quantity').val();
		let price = $('#price').val();
		let amount = quantity * price;
		
		$('#amount').val(amount);
	}
	
	function calculateModifyAmount() {
		let quantity = $('#modify-quantity').val();
		let price = $('#modify-price').val();
		let amount = quantity * price;
		
		$('#modify-amount').val(amount);
	}
	
	
	// 출하등록 작업지시등록
	$(function(){
		
		
		$('#stock-out-reg-btn').click(function(){
		    let orderCode = $("input[name='selectRow']:checked").val();
		    console.log('stock-out-reg-btn orderCode -> ' + orderCode);
		    
		    // 주문 상태 확인 Ajax 호출
		    $.ajax({
		        url: "/sales/receive-order/" + orderCode + "/order-status",
		        type: "GET",
		        dataType: "text",
		        success: function(orderStatus){
		            console.log('in success orderStatus' + orderStatus);
		            
		            // '확정'인 경우에만 insert Ajax 호출
		            if (orderStatus === '확정') {
		            	console.log('in if orderStatus' + orderStatus);
		                $.ajax({
		                    url: "/sales/receive-order/" + orderCode + "/stock-out-reg",
		                    type: "POST",
		                    dataType: "text",
		                    success: function(data){
		                        console.log("출하등록 성공" + data);
		                        loadPlaceOrderDetailList();
		                    },
		                    error: function(){
		                        console.log("출하등록 변경 Error");
		                    }
		                });
		            } else {
		                alert("주문 상태가 '확정'이 아닙니다.");
		            }
		        },
		        error: function(){
		            console.log("주문 상태 조회 Error");
		        }
		    });
		});
		
		// 작업지시등록
		$('#work-order-reg-btn').click(function(){
		    let orderCode = $("input[name='selectRow']:checked").val();
		    console.log('work-order-reg-btn orderCode -> ' + orderCode);
		    
		    // 주문 상태 확인 Ajax 호출
		    $.ajax({
		        url: "/sales/receive-order/" + orderCode + "/order-status",
		        type: "GET",
		        dataType: "text",
		        success: function(orderStatus){
		            console.log('in success orderStatus' + orderStatus);
		            
		            // '확정'인 경우에만 insert Ajax 호출
		            if (orderStatus === '확정') {
		            	console.log('in if orderStatus' + orderStatus);
		            	$.ajax({
		    				url: "/sales/receive-order/" + orderCode + "/work-order-reg",
		    				type: "POST",
		    				dataType: "text",
		    				success: function(data){
		    					console.log("작업지시등록 성공" + data);
		    					loadPlaceOrderDetailList();
		    				},
		    				error: function(){
		    					console.log("작업지시등록 변경 Error");
		    				}
		    			});
		            } else {
		                alert("주문 상태가 '확정'이 아닙니다.");
		            }
		        },
		        error: function(){
		            console.log("주문 상태 조회 Error");
		        }
		    });
		});
		
	});
		
	///////////////////////////////////////////////
	///////////////////////////////////////////////
	
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
		
		
		$('#quantity').on('input', calculateAmount);
		$('#price').on('input', calculateAmount);
		$('#modify-quantity').on('input', calculateModifyAmount);
		$('#modify-price').on('input', calculateModifyAmount);
		
	});
	
	

</script>
</html>