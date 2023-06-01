<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
</head>
<body>

<div class="analysis-of-materails-container">
	
	<div class="analysis-of-materails-container-btn">
	
		<button type="button" id="search-btn" value="조회">조회</button>
		<button type="button" id="receive-order-btn" value="수주서 관리" onclick="location.href='/sales/receive-order'">수주서 관리</button>
		
	</div>
	
	<div class="receive-order-table-container">
	
		<table id="table-order-content" border="1">
			<caption>수주목록</caption>
			<thead>
				<tr>
					<td></td>
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
	
		<table id="table-semi-manufactures-content" border="1">
				<caption>반제품 소요분석</caption>
				<thead>
					<tr>
						<td></td>
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
					
					//row.append('<td><input type="radio" name="selectRow" value = '+ order.orderCode +'></td>');
					row.append($('<td>').append(radio));
					row.append('<td>' + order.orderCode + '</td>');
					row.append('<td>' + order.itemCode + '</td>');
					row.append('<td>' + order.itemName + '</td>');
					row.append('<td>' + order.itemType + '</td>');
					row.append('<td>' + order.quantity + '</td>');
					row.append('<td>' + order.receiveOrderType + '</td>');
					row.append('<td>' + order.orderDate.substring(0, 10) + '</td>');
					row.append('<td>' + order.orderEmpid + '</td>');
					row.append('<td>' + order.orderStatus + '</td>');
					
					table.append(row);
					
					console.log('receiveOrderList checked radio -> ' + checkedRowId)
				});
			},
			error: function(){
				console.log("receive-order-list Error");
			}
		});
		
	}	/* /loadReceiveOrderList() */
	
	
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
						row.append('<td><input type="radio" name="selectItemCodeRow" value = '+ order.itemCode +'></td>');
						/* row.append('<td>' + order.itemCode + '</td>'); */
						row.append('<td>' + order.lowItemCode + '</td>');
						row.append('<td>' + order.itemName + '</td>');
						row.append('<td>' + order.itemType + '</td>');
						row.append('<td>' + order.stockUnit + '</td>');
						row.append('<td>' + order.goodQuantity + '</td>');
						row.append('<td>' + order.workOrderQuantity + '</td>');
						
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