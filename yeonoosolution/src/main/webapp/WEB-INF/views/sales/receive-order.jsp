<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
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
		
		<form method="post" action="/sales/om/insert-receive-order" name="frm">
			<table id="table-insert-receive">
				<tr>
					<th>거래처코드</th>
					<td><input type="text" name="customerCode" required="required"></td>
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
			
	
	</div>	<!-- /class="receive-order-table-content" -->
	
	
	<div class="receive-order-detail-top-content">
	
		<div >
		
			<span>제품코드</span>
			<input type="text" id="item-code" name="itemCode">
			<span>품명</span>
			<input type="text" id="item-name" name="itemName">
			<span>수량</span>
			<input type="number" id="modify-quantity" name="modifyQuantity" value="0">
			<span>단가</span>
			<input type="number" id="modify-price" name="modifyPrice" value="0"> 
			<span>금액</span>
			<input type="number" id="modify-amount" name="modifyPrice" value="0" readonly="readonly"> 
			<button type="button" id="modify-amount-btn" value="금액수정">금액수정</button>
			<span>재고단위</span>
			<select id="item-stock-unit" name="itemStockUnit">
				<option value="EA">EA</option>
				<option value="KG">KG</option>
			</select>
			<span>비고</span>
			<input type="text" id="memo" name="dueDate">
			<span>마감여부</span>
			<select id="end-yn" name="endYn">
				<option value="N">N</option>
				<option value="Y">Y</option>
			</select>
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
						<input type="text" name="itemCode" required="required">
					</td>
				</tr>
				<tr>
					<th>품명</th>
					<td>
						<input type="text" name="itemName">
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
					row.append('<td>' + order.updateUser + '</td>');
					
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
		
		
	});	//receive-order CRUD
	
	
	
	
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
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
						row.append('<td>' + order.memo + '</td>');
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
						const radio = $('<input type="radio" name="selectDetailRow">').val(order.orderDetailCode);
						
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
						console.log('radio -> '+ radio) ;
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
		
	});	// receive-order-detail CRUD
	
	
	
	
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
		//let quantity = parseFloat(document.getElementsByName('quantity')[0].value);
		let quantity = $('#quantity').val();
		//let price = parseFloat(document.getElementsByName('price')[0].value);
		let price = $('#price').val();
		let amount = quantity * price;
		
		$('#amount').val(amount);
		//document.getElementsByName('amount')[0].value = amount;
	}
	
	function calculateModifyAmount() {
		//let quantity = parseFloat(document.getElementsByName('quantity')[0].value);
		let quantity = $('#modify-quantity').val();
		//let price = parseFloat(document.getElementsByName('price')[0].value);
		let price = $('#modify-price').val();
		let amount = quantity * price;
		
		$('#modify-amount').val(amount);
		//document.getElementsByName('amount')[0].value = amount;
	}
	
	
	// 출하등록 작업지시등록
	$(function(){
		
		// 출하등록
		$('#stock-out-reg-btn').click(function(){
			let orderCode = $("input[name='selectRow']:checked").val();
			console.log('stock-out-reg-btn orderCode -> ' + orderCode);
			
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
			
		});
		
		// 작업지시등록
		$('#work-order-reg-btn').click(function(){
			let orderCode = $("input[name='selectRow']:checked").val();
			console.log('work-order-reg-btn orderCode -> ' + orderCode);
			
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