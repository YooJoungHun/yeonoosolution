<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<style type="text/css">

	.analysis-of-materials-body-container {
		display: flex;
  	 	overflow: auto;
	}
	
	.analysis-of-materials-container {
		width: 1500px;
		height: 100vh;
		padding: 20px;
		overflow: auto;
	}
	
	/* 상위 버튼 */
	.analysis-of-materials-container-btn {
		margin: 10px;
		width: 200px;
		background-color: #F0F0F0;
		border-radius: 5px;
	}
	
	.analysis-of-materials-container-btn button {
		background-color: white;
		border-radius: 5px;
		font-family: Arial, sans-serif; 
		font-size: 16px; 
		outline: none;
		margin: 5px;
		border: 1px solid #D6DAE2;
		
	}
	
	.receive-order-table-container {
		height: 320px;
		overflow: auto;
		width: 1100px;
	}
	
	.semi-manufactures-container {
		height: 350px;
		overflow: auto;
		width: 1100px;
		margin-top: 40px;
		margin-bottom: 40px;
	}
	
	/* 테이블  */
	#table-order-content {
		border:1px solid;
		padding: 5px;
		text-align: center;
		white-space: nowrap;		/* 셀 내용이 넘칠 경우 줄바꿈 방지 */
		overflow: hidden; 			/* 셀 내용이 넘칠 경우 가리기 */
		text-overflow: ellipsis;	/* 셀 내용이 넘칠 경우 말줄임표(...) 표시 */
		margin: 30px;
	}
	
	#table-semi-manufactures-content {
		border:1px solid;
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
		border: 1px solid #B3B3B3;			/* 각 셀에 테두리 추가 */
		
	}
	
	#table-order-content td {
		width: 100px; 
		border: 1px solid #B3B3B3;			/* 각 셀에 테두리 추가 */
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
		height: 40px;
	}
	
	#table-order-content td:first-child {
		width: 50px; 
		height: 40px;
	}
	
	#table-semi-manufactures-content th {
		border: 1px solid #B3B3B3;			/* 각 셀에 테두리 추가 */
	}
	
	#table-semi-manufactures-content td {
		width: 100px; 
		border: 1px solid #B3B3B3;			/* 각 셀에 테두리 추가 */
		
	}
	
	#table-semi-manufactures-content th:first-child {
		width: 30px;
		height: 40px;
		
	}
	#table-semi-manufactures-content th:nth-child(1),
	#table-semi-manufactures-content th:nth-child(2),
	#table-semi-manufactures-content th:nth-child(3),
	#table-semi-manufactures-content th:nth-child(4),
	#table-semi-manufactures-content th:nth-child(5),
	#table-semi-manufactures-content th:nth-child(6),
	#table-semi-manufactures-content th:nth-child(7) {
		width: 170px;
		height: 40px;
	}
	
	#table-semi-manufactures-content td {
		height: 40px;
		
	}
	
	
</style>
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
					row.append('<td class="bg-gray">' + (order.receiveOrderType ? order.receiveOrderType : '') + '</td>');
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
			loadSemiManufacturesList();
		});
		
		loadReceiveOrderList();
		
	});
</script>