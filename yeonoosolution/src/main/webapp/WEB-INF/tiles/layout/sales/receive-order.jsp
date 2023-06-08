<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<style type="text/css">

	.receive-order-body-container{
		display: flex;
		overflow: auto;
	}
	
	.receive-order-container {
		width: 1500px;
		height: 100vh;
		margin: 30px;
		padding: 20px;
	}
	
	.receive-order-table-content {
		width: 1400px;
	}
	
	/* 상위 버튼 */
	.receive-order-btn {
		margin: 10px;
		width: 1000px;
		background-color: #F0F0F0;
		border-radius: 5px;
	}
	
	.receive-order-btn button {
		background-color: white;
		border-radius: 5px;
		font-family: Arial, sans-serif; 
		font-size: 16px; 
		outline: none;
		margin: 5px;
		border: 1px solid #D6DAE2;
	}
	
	.receive-order-top-content{
		margin: 10px;
		width: 1000px;
		background-color: #F0F0F0; 
		border-radius: 5px;
	}
	
	.receive-order-top-content span {
		background-color: #F0F0F0; 
		
		padding: 5px;
		font-family: Arial, sans-serif; 
		font-size: 16px; 
		border: 1px solid #D6DAE2;
		border-radius: 5px;
	}
	
	.receive-order-top-content button {
		background-color: white; 
		padding: 5px;
		font-family: Arial, sans-serif; 
		font-size: 16px; 
		border: 1px solid #D6DAE2;
		border-radius: 5px;
	}
	
	.receive-order-top-content input {
		border-radius: 5px;
		border: 1px solid #D6DAE2;
	}

	/* 테이블  */
	#table-content {
		border:1px solid;
		padding: 5px;
		text-align: center;
	}
	
	#table-content tr:hover td {
		background-color: #8C8C8C;
	}
	
	#table-content-div, #table-detail-content-div {
		height: 300px;
		width: 1340px;
		margin: 30px;
		overflow: auto;
	}
	
	#table-content {
		height: 450px;
		white-space: nowrap;
		
	}
	
	#table-content th {
		border: 1px solid #B3B3B3;			/* 각 셀에 테두리 추가 */
	}
	
	#table-content td {
		border: 1px solid #B3B3B3;			/* 각 셀에 테두리 추가 */
	}
	
	#table-content td:first-child {
		width: 50px; 
	}
	
	#table-content td:nth-child(2) {
		width: 70px; 
	}
	
	#table-detail-content th:first-child {
		width: 30px;
		height: 30px;
	}
	
	#table-content th:nth-child(3)
	#table-content th:nth-child(4),
	#table-content th:nth-child(5),
	#table-content th:nth-child(6),
	#table-content th:nth-child(7),
	#table-content th:nth-child(8),
	#table-content th:nth-child(9),
	#table-content th:nth-child(10),
	#table-content th:nth-child(11),
	#table-content th:nth-child(12),
	#table-content th:nth-child(13),
	#table-content th:nth-child(14) {
		width: 100px;
		height: 30px;
	}
	
	.bg-gray {
		background-color: #D9D9D9;
	}
	
	.bg-orange {
		background-color: #FFFFCC;
	}
	
	.bg-blue {
		background-color: #E6F2FF;
	}
	
	.receive-order-detail-top-content{
		margin: 10px;
		width: 1000px;
		background-color: #F0F0F0;
		border-radius: 5px; 
	}
	
	.receive-order-detail-top-content span {
		padding: 5px;
		font-family: Arial, sans-serif; 
		font-size: 16px; 
		border-radius: 5px;
	} 
	
	.receive-order-detail-top-content button {
		padding: 5px;
		font-family: Arial, sans-serif; 
		font-size: 16px; 
		border: 1px solid #D6DAE2;
		border-radius: 5px;
	}
	
	.receive-order-detail-top-content input {
		border: 1px solid #D6DAE2;
		border-radius: 5px;
	}
	
	#table-detail-content {
		border:1px solid #B3B3B3;
		padding: 5px;
		text-align: center;
		white-space: nowrap; 
		overflow: hidden; 
		text-overflow: ellipsis; 
		overflow: auto;
		white-space: nowrap;
	}
	
	#table-detail-content th {
		border: 1px solid #B3B3B3;			/* 각 셀에 테두리 추가 */
	}
	
	#table-detail-content td {
		border: 1px solid #B3B3B3;			/* 각 셀에 테두리 추가 */
	}
	
	#table-detail-content tr:hover td {
		background-color: #8C8C8C;
	}
	
	#table-detail-content th:first-child {
		width: 30px;
		height: 30px;
	}
	
	#table-detail-content th:nth-child(2),
	#table-detail-content th:nth-child(3),
	#table-detail-content th:nth-child(4),
	#table-detail-content th:nth-child(5),
	#table-detail-content th:nth-child(6),
	#table-detail-content th:nth-child(7),
	#table-detail-content th:nth-child(8),
	#table-detail-content th:nth-child(9) {
		width: 100px;
		height: 30px;
	}
	
	#table-detail-content td:first-child {
		width: 30px; 
	}

	#order-empid,
	#modify-item-code,
	#modify-quantity,
	#modify-price {
		width: 80px;
	}
	
	#modify-item-name,
	#modify-amount,
	#modify-memo {
		width: 100px;
	}
	
	#table-insert-receive-form-container {
		margin: 30px;
		width: 500px;
		border: 1px solid #ddd;
		background-color: #EAEAEA; 
		border-radius: 5px;
	}
	
	#table-insert-receive-form {
		margin: 15px;
		margin-left: 25px;
	}
	
	#table-insert-receive-form button {
		background-color: white; 
		padding: 5px;
		font-family: Arial, sans-serif; 
		font-size: 16px; 
		border: 1px solid #D6DAE2;
		border-radius: 5px;
	}
	
	#table-insert-receive-form input {
		border-radius: 5px;
		border: 1px solid #D6DAE2;
	}
	
	#table-insert-receive-form-container th {
		background-color: #F0F0F0; 
		padding: 5px;
		font-family: Arial, sans-serif; 
		font-size: 16px; 
		border: 1px solid #D6DAE2;
		border-radius: 5px;
	} 
	
	#table-insert-receive-detail-form-container {
		margin: 30px;
		width: 500px;
		border: 1px solid #ddd;
		background-color: #EAEAEA; 
		border-radius: 5px;
	}
	
	#table-insert-receive-detail-form-container th {
		background-color: #F0F0F0; 
		padding: 5px;
		font-family: Arial, sans-serif; 
		font-size: 16px; 
		border: 1px solid #D6DAE2;
		border-radius: 5px;
	}
	
	#table-insert-receive-detail-form {
		margin: 15px;
		margin-left: 25px;
	}
	
	#table-insert-receive-detail-form button {
		background-color: white; 
		padding: 5px;
		font-family: Arial, sans-serif; 
		font-size: 16px; 
		border: 1px solid #D6DAE2;
		border-radius: 5px;
	}
	
	#table-insert-receive-detail-form input,
	#table-insert-receive-detail-form select {
		border-radius: 5px;
		border: 1px solid #D6DAE2;
	}
	
	#customer-code-list input[type="radio"]:checked + label {
		box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
		background-color: #e6e6e6;
	}
	#customer-code-list span:hover {
		box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
		background-color: #e6e6e6;
	}

	
</style>
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
					
					row.append($('<td>').append(radio));
					row.append($('<td>').addClass('bg-gray').text(order.orderStatus));
					row.append($('<td>').addClass('bg-gray').text(order.orderCode));
					row.append($('<td>').addClass('bg-gray').text(order.customerCode));
					row.append($('<td>').addClass('bg-orange').text(order.receiveOrderType));
					row.append($('<td>').addClass('bg-gray').text(order.companyName));
					row.append($('<td>').addClass('bg-blue').text(order.orderDate ? order.orderDate.substring(0, 10) : ''));
					row.append($('<td>').addClass('bg-blue').text(order.orderEmpid ? order.orderEmpid : ''));
					row.append($('<td>').addClass('bg-orange').text(order.deliveryPlan ? order.deliveryPlan : ''));
					row.append($('<td>').addClass('bg-blue').text(order.dueDate ? order.dueDate.substring(0, 10) : ''));
					row.append($('<td>').addClass('bg-blue').text(order.regDate ? order.regDate.substring(0, 10) : ''));
					row.append($('<td>').addClass('bg-gray').text(order.regUser ? order.regUser : ''));
					row.append($('<td>').addClass('bg-gray').text(order.updateDate ? order.updateDate.substring(0, 10) : ''));
					row.append($('<td>').addClass('bg-gray').text(order.updateUser ? order.updateUser : ''));

					table.append(row);
					 
				});
			},
			error: function(){
				console.log("place-order-list Error");
			}
		});
		
	}
	
	$(document).on("click", "#table-content tbody tr", function() {
		const radio = $(this).find("input[name='selectRow']");
		radio.prop("checked", true).trigger("change");
	});
	
	
	//receive-order CRUD 변경 , 삭제
	$(function(){
		
		$('#order-confirmation-btn').click(function(){
			let orderCode = $("input[name='selectRow']:checked").val();
			
			if (!orderCode) {
				alert("항목을 선택해주세요."); 
				return; 
			}
			if (confirm("수주를 확정하시겠습니까?")) {
				$.ajax({
					url: "/sales/receive-order/" + orderCode + "/confirm",
					type: "PATCH",
					success: function(data){
						loadPlaceOrderList();
					},
					error: function(){
						console.log("confirm Error");
					}
				});
			}
		});
		
		$('#confirmation-cancel-btn').click(function(){
			let orderCode = $("input[name='selectRow']:checked").val();
			
			if (!orderCode) {
				alert("항목을 선택해주세요."); 
				return; 
			}
			
			if (confirm("수주 확정을 취소하시겠습니까?")) {
				$.ajax({
					url: "/sales/receive-order/" + orderCode + "/cancel",
					type: "PATCH",
					success: function(data){
						loadPlaceOrderList();
					},
					error: function(){
						console.log("confirm Error");
					}
				});
			}
		});
		
		
		// 수주유형
		$('#receive-order-type').change(function(){
			let selectedType = $(this).val();
			let orderCode = $("input[name='selectRow']:checked").val();
			
			if (!orderCode) {
				alert("항목을 선택해주세요."); 
				return; 
			}
			if (confirm("수주유형을 변경하시겠습니까?")) {
				$.ajax({
					url: "/sales/receive-order/" + orderCode + "/modify-type",
					type: "PATCH",
					data: { receiveOrderType : selectedType },
					dataType: "text",
					success: function(orderType){
						alert("수주유형이 변경되었습니다."); 
						loadPlaceOrderList();
					},
					error: function(){
						console.log("수주유형 변경 Error");
					}
				});
			}
		});
		
		//삭제
		$('#delete-btn').click(function(){
			let orderCode = $("input[name='selectRow']:checked").val();
			
			if (!orderCode) {
				alert("항목을 선택해주세요."); 
				return; 
			}
			
			if (confirm("해당 수주서를 삭제하시겠습니까?")) {
				$.ajax({
					url: "/sales/receive-order/" + orderCode + "/delete",
					type: "DELETE",
					success: function(){
						alert("삭제되었습니다."); 
						loadPlaceOrderList();
					},
					error: function(){
						console.log("DELETE Error");
					}
				});
			}
		});
		
		
		// 수주일 변경
		$('#order-date').change(function(){
			let selectedDate = $(this).val();
			let orderCode = $("input[name='selectRow']:checked").val();
			
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
					alert("수주일이 변경되었습니다.");
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
					alert("납기일이 변경되었습니다.");
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
			
			$.ajax({
				url: "/sales/receive-order/" + orderCode + "/modify-empid",
				type: "PATCH",
				data: JSON.stringify({
					orderEmpid : orderEmpid
				}),
				contentType: 'application/JSON',						
				dataType: "json",
				success: function(data){
					alert("담당자가 변경되었습니다.");
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
		  $.ajax({
		    url: '/sales/receive-order/customer-code-list',
		    type: 'GET',
		    dataType: 'json',
		    success: function(data) {
		      let ul = $('#customer-code-list');
		      ul.empty();
		      for (var i = 0; i < data.length; i++) {
		        let item = data[i];
		        let radio = $('<input type="radio" name="customer" value="' + item.companyCode + '">');
		        let label = $('<label>' + item.companyCode + ' - ' + item.companyName + '</label>');
		        let span = $('<span></span></br>').append(radio).append(label);
		        
		        // 클릭 이벤트를 추가하여 라디오 버튼 선택
		        span.on('click', function() {
		          $(this).find('input[name="customer"]').prop('checked', true);
		        });
		        
		        ul.append(span);
		      }
		    },
		    error: function(xhr, status, error) {
		      console.log('Error:', error);
		    }
		  });

		  $('#customer-code-modal .btn-primary').click(function() {
		    let selectedCustomer = $('input[name="customer"]:checked');

		    if (selectedCustomer.length > 0) {
		      let companyCode = selectedCustomer.val();
		      let companyName = selectedCustomer.next('label').text().split(' - ')[1];
		      $('#customer-code').val(companyCode);
		      $('#company-name-modal').val(companyName);
		    }

		    $('#customer-code-modal').modal('hide');
		  });
		});

	
	
	
	
	
	// .receive-order-detail-content 출력
	function loadPlaceOrderDetailList(){ 	
		
		let orderCode = $("input[name='selectRow']:checked").val();
		
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
						row.append('<td class="bg-orange">' + order.itemCode + '</td>');
						row.append('<td class="bg-orange">' + order.itemName + '</td>');
						row.append('<td class="bg-orange">' + order.quantity + '</td>');
						row.append('<td class="bg-orange">' + order.price + '</td>');
						row.append('<td class="bg-blue">' + order.amount + '</td>');
						row.append('<td class="bg-blue">' + order.itemStockUnit + '</td>');
						row.append('<td class="bg-orange">' + (order.memo ? order.memo : '') + '</td>');
						row.append('<td class="bg-blue">' + order.endYn + '</td>');
						
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
	
	$(document).on("click", "#table-detail-content tbody tr", function() {
		const radio = $(this).find("input[name='selectDetailRow']");
		radio.prop("checked", true);
	});
	
	//receive-order-detail CRUD 변경 , 삭제
	$(function(){
		
		// 금액 update
		$('#modify-amount-btn').click(function(){
			let orderDetailCode = $("#order-detail-code").val();
			let quantity = $('#modify-quantity').val();
			let price = $('#modify-price').val();
			let amount = $('#modify-amount').val();
			
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
					alert("금액이 변경되었습니다.");
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
			
			$.ajax({
				url: "/sales/receive-order/" + orderDetailCode + "/modify-item-stock-unit",
				type: "PATCH",
				data: { itemStockUnit : selectedType },
				dataType: "text",
				success: function(data){
					alert("재고단위가 변경되었습니다.");
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
			
			$.ajax({
				url: "/sales/receive-order/" + orderDetailCode + "/modify-end-yn",
				type: "PATCH",
				data: { endYn : selectedType },
				dataType: "text",
				success: function(data){
					alert("마감여부가 변경되었습니다.");
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
			
			$.ajax({
				url: "/sales/receive-order/" + orderDetailCode + "/modify-item",
				type: "PATCH",
				data: JSON.stringify({
					itemCode : itemCode,
					itemName : itemName
				}),
				contentType: 'application/JSON',						
				dataType: "json",
				success: function(data){
					alert("제품이 변경되었습니다.");
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
			
			$.ajax({
				url: "/sales/receive-order/" + orderDetailCode + "/modify-memo",
				type: "PATCH",
				data: JSON.stringify({
					memo : modifyMemo
				}),
				contentType: 'application/JSON',						
				dataType: "json",
				success: function(data){
					alert("비고가 변경되었습니다.");
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
	  		}
	  		
	  		$('#modify-item-code-modal').modal('hide');
	  		
	  	});
	});
	
	// 제품코드 삽입 모달 창 
	$(function() {
	  	
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
	  		}
	  		
	  		$('#item-code-modal').modal('hide');
	  		
	  	});
	});
	
	
	// receive-order에서 선택된 radio의 orderCode를 detail의 hidden에 저장하는 함수 실행
	$(document).on('change', "input[name='selectRow']", function(){
		assignOrderCodeToHiddenInput();
	});
	
	
	// 선택된 radio 버튼의 값을 hidden input에 할당하는 함수
	function assignOrderCodeToHiddenInput() {
	    const selectedOrderCode = $("input[name='selectRow']:checked").val();
	    $("#order-detail-code").val(selectedOrderCode);

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
		    
		    // 주문 상태 확인 Ajax 호출
		    $.ajax({
		        url: "/sales/receive-order/" + orderCode + "/order-status",
		        type: "GET",
		        dataType: "text",
		        success: function(orderStatus){
		            
		            // '확정'인 경우에만 insert Ajax 호출
		            if (orderStatus === '확정') {
		            	
		            	if (confirm("출하등록을 하시겠습니까?")) {		
			                $.ajax({
			                    url: "/sales/receive-order/" + orderCode + "/stock-out-reg",
			                    type: "POST",
			                    dataType: "text",
			                    success: function(data){
			                        location.replace("/sales/stock/"); 	
			                    },
			                    error: function(){
			                        console.log("출하등록 변경 Error");
			                    }
			                });
		            	}    
		                
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
		    
		    // 주문 상태 확인 Ajax 호출
		    $.ajax({
		        url: "/sales/receive-order/" + orderCode + "/order-status",
		        type: "GET",
		        dataType: "text",
		        success: function(orderStatus){
		            
		            // '확정'인 경우에만 insert Ajax 호출
		            if (orderStatus === '확정') {
		            	if (confirm("작업 지시 등록을 하시겠습니까?")) {
			            	$.ajax({
			    				url: "/sales/receive-order/" + orderCode + "/work-order-reg",
			    				type: "POST",
			    				dataType: "text",
			    				success: function(data){
			    					location.replace("/product/wo"); 
			    				},
			    				error: function(){
			    					console.log("작업지시등록 변경 Error");
			    				}
			    			});
		            	}	
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
		

	$(document).ready(function() {
	    // '수주서 작성' 버튼 클릭 시 폼 보이기
	    $("#insert-receive-form-button").click(function() {
	        $("#table-insert-receive-form-container").show();
	    });

	    // 폼 제출 시 폼 숨기기
	    $("#table-insert-receive-form").submit(function() {
	        $("#table-insert-receive-form-container").hide();
	    });

	    // '수주서 상세 작성' 버튼 클릭 시 폼 보이기
	    $("#insert-receive-detail-form-button").click(function() {
	        let orderCode = $("input[name='selectRow']:checked").val();

	        if (!orderCode) {
	            alert("항목을 선택해주세요.");
	            return;
	        }

	        $("#table-insert-receive-detail-form-container").show();
	    });

	    // 폼 제출 시 폼 숨기기
	    $("#table-insert-receive-detail-form").submit(function() {
	        $("#table-insert-receive-detail-form-container").hide();
	    });
	});
	
	//document ready
	$(function() {
		
		// 조회 클릭 이벤트리스너
		$('#search-btn').click(function() {
			loadPlaceOrderList();
		});
		
		// radio 변경시 checked value 변경
		$(document).on('change', "input[name='selectRow']", function(){
			loadPlaceOrderDetailList();
		});
		
		loadPlaceOrderList();
		
		$('#quantity').on('input', calculateAmount);
		$('#price').on('input', calculateAmount);
		$('#modify-quantity').on('input', calculateModifyAmount);
		$('#modify-price').on('input', calculateModifyAmount);
		
	});

</script>
