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
				<option value="oem">oem</option>
				<option value="odm">odm</option>
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
	
		<button id="add-btn" onclick="addRowContent()">추가</button>
		<button id="delete-btn" onclick="deleteRowContent(-1)">삭제</button>
		<button id="insert-btn">삽입</button>
	
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
		
		<form action="insert-receive-order">
		
			<table id="table-insert-receive">
				<tr>
					<th>거래처코드</th>
					<td><input type="text" name="customerCode" required="required">
					<input type="button" value="중복확인:미구현" onclick="chk()"> </td>
				</tr>
				<tr>
					<th>수주유형</th>
					<td>
						<select name="receiveOrderType" required="required">
							<option value="자체생산">자체생산</option>
							<option value="odm">odm</option>
							<option value="oem">oem</option>
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
					<td><input type="text" name="orderDate" ></td>
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
						<option value="ddm">ddm</option>
					</select>
					</td>
				</tr>
				<tr>
					<th>납기일</th>
					<td><input type="text" name="dueDate" ></td>
				</tr>
				<tr>
					<th>등록일자</th>
					<td><input type="text" name="regDate" ></td>
					</tr>
				<tr>
					<th>등록자</th>
					<td><input type="text" name=regUser ></td>
				</tr>
				<tr>
					<th>수정일자</th>
					<td><input type="text" name="updateDate" ></td>
				</tr>
				<tr>
					<th>수정자</th><td><input type="text" name="updateUser" ></td>
				</tr>
										
				<tr>
					<td colspan="2">
					<input type="submit" value="확인"></td>
				</tr>
			</table>
		
		</form>
			
	
	</div>	<!-- /class="receive-order-table-content" -->
	
	<div class="receive-order-detail-content">
	
		<button id="add-btn" onclick="addRowContentDetail()">추가</button>
		<button id="delete-btn" onclick="deleteRowContentDetail(-1)">삭제</button>
	
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

</body>

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
		
		
		// json이 이상하게 전달
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