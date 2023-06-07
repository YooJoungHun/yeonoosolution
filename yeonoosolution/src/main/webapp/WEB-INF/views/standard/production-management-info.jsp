<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">

.main-content {
	width: 1305px;
	height: auto;
	margin: 0px auto;
	display: flex;
	flex-wrap: wrap;
	margin-top: 8px;
	border: 1px solid #ddd;
}

.btn-group1 {
	width: 280px;
	margin: 3px;
	display: inline-block;
}

.input-info {
	width: 1305px;
	height: 110px;
	margin: 0px auto;
	padding: 16px;
    border-radius: 10px;
    margin-top: 8px;
    background-color: #F8F8F8;
    margin-right: 175px;
    margin-bottom: 7px;
}

.input-info label {
	display: inline-block;
    width: 105px;
    border-radius: 5px;
    border: 1px solid #E8EBF0;
    padding: 0;
    font-size: 14px;
    font-weight: bold;
    text-align: center;
    line-height: 30px;
    background-color: #9BABB8;
    margin-bottom: 10px;
}

.input-info input {
	display: inline-block;
    width: 150px;
    border-radius: 5px;
    border: 1px solid #E8EBF0;
    padding: 0px;
    font-size: 14px;
    text-align: center;
    line-height: 30px;
}

button {
	display: inline-block;
	border: 1px solid #D6DAE2;
    outline: none;
    border-radius: 5px;
    padding: 0 12px;
    height: 30px;
	
}

button:hover {
	background-color: #D6D2C4;
}

.side-bar {
	border: 1px solid #ddd;
	padding: 20px;
	float: left;
	height: 100vh;
}


.product-item-list {
	width: 600px;
	height: 300px;
	overflow: auto;
	border: 1px solid #ddd;
	
}

#product-item-span {
	margin-left: 190px;
}

#bom-tree-span {
	margin-left: 510px;
}

#item-table {
	width: 100%;
	border-collapse: collapse;
	font-size: 15px;
	white-space: nowrap;
}

#item-table th, td {
	padding: 8px;
	text-align: center;
	border: 1px solid #B3B3B3;
	white-space: nowrap;
}

#item-table th {
	background-color: #9BABB8;
	font-weight: bold;
}

#item-table tr {
	height: 24px;
}

#item-table tr:hover {
  	background-color: #f5f5f5;
}

#item-table input[type="checkbox"] {
 	margin: 0;
}	


.semi-product-item-list {
	width: 1305px;
	height: 360px;
	overflow: auto;
}

#item2-table {
	width: 100%;
	border-collapse: collapse;
	white-space: nowrap;
	font-size: 15px;
}

#item2-table th, td {
	padding: 8px;
	text-align: center;
	white-space: nowrap;
	border: 1px solid #B3B3B3;
}

#item2-table th {
	background-color: #9BABB8;
	font-weight: bold;
}

#content-table tr {
	height: 24px;
}

#item2-table tr:hover {
  	background-color: #f5f5f5;
}

#item2-table input[type="checkbox"] {
 	margin: 0;
}


.bom-tree {
	width: 700px;
	height: 300px;
	overflow: auto;
	border: 1px solid #ddd;
}

#item3-table {
	width: 100%;
	border-collapse: collapse;
	font-size: 15px;
}

#item3-table th, td {
	padding: 8px;
	text-align: center;
	border: 1px solid #B3B3B3;
	white-space: nowrap;
}

#item3-table th {
	background-color: #9BABB8;
	font-weight: bold;
}

#content-table tr {
	height: 24px;
}

#item3-table tr:hover {
  	background-color: #f5f5f5;
}

#item3-table input[type="checkbox"] {
 	margin: 0;
}

/* 모달 창 */
.modal {
  display: none;
  position: fixed;
  z-index: 1;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  overflow: auto;
  background-color: rgba(0, 0, 0, 0.5);
}

/* 모달 창 컨텐츠 */
.modal-content {
  background-color: #fff;
  margin: 10% auto;
  padding: 20px;
  border: 1px solid #ccc;
  max-width: 800px;
  max-height: 500px;
  width: 80%;
  border-radius: 5px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
  overflow: auto;
}

/* 모달 창 닫기 버튼 */
.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
	cursor: pointer;
}

.close:hover,
.close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}

.modal-content h2 {
	text-align: center;
	margin: 0px auto;
	margin-bottom: 20px;
}

/* 리스트 아이템 */
#high-item-table th {
	background-color: #9BABB8;
	font-weight: bold;
}

#high-item-table th, #high-item-table td {
	white-space: nowrap;
	padding: 8px;
	text-align: center;
	border: 1px solid #B3B3B3;
}

#high-item-table {
	width: 400px;
	border: 2px solid #ddd;
	border-collapse: collapse;
	white-space: nowrap;
	font-size: 15px;
}

#high-item-table td {
	cursor: pointer; /* 마우스 커서를 포인터로 변경 */
	padding: 5px;
}

#high-item-table tr {
	height: 24px;
}

#high-item-table tr:hover {
	background-color: #f5f5f5; /* 호버 상태 배경색 변경 */
}


#low-item-table th {
	background-color: #9BABB8;
	font-weight: bold;
}

#low-item-table th, #low-item-table td {
	white-space: nowrap;
	padding: 8px;
	text-align: center;
	border: 1px solid #B3B3B3;
}

#low-item-table {
	width: 400px;
	border: 2px solid #ddd;
	border-collapse: collapse;
	white-space: nowrap;
	font-size: 15px;
}

#low-item-table td {
	cursor: pointer; /* 마우스 커서를 포인터로 변경 */
	padding: 5px;
}

#low-item-table tr {
	height: 24px;
}

#low-item-table tr:hover {
	background-color: #f5f5f5; /* 호버 상태 배경색 변경 */
}


@media (max-width: 480px) {
  /* 작은 화면에서 모달 창의 너비 조정 */
  .modal-content {
    width: 90%;
  }
}


</style>
<meta charset="UTF-8">
<title>품목 관리 정보</title>
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
      
      <!-- sales -->
      <a href="/sales/analysis-of-materials">자제소요분석</a><p>
      <a href="/sales/receive-order">수주서 관리</a><p>
      <a href="/sales/order">구매</a><p>
      <a href="/sales/stock-in">구매입고등록</a><p>
      
      <!-- standard -->
      <a href="/standard/login">로그인</a><p>
      <a href="/standard/user-admin">사용자 계정관리</a><p>
      <a href="/standard/imi">품목 관리</a><p>
      <a href="/standard/ipi">품목 단가 관리</a><p>
      <a href="/standard/pmi">BOM 등록</a><p>
      
      <!-- 로그아웃 -->
      <c:if test="${sessionScope.member != null}">
         <form action="/standard/logout" method="POST">
            <button type="submit">로그아웃</button>
         </form>
      </c:if>
   </div>
	
	
	<div class="input-info">
		<span style="font-weight: bold;">BOM 정보 입력</span> 
		<br>
		<br>
		<label>*완제품 코드</label><input placeholder="더블 클릭 하여 선택" id="high-item-code" readonly style="background-color: #FFFFCC">
		<label>*반/원자재 코드</label><input placeholder="더블 클릭 하여 선택" id="low-item-code" readonly style="background-color: #FFFFCC">
		<label>*소요량</label><input placeholder="필수 입력 정보" id="material-quantity" type="number" style="background-color: #E6F2FF">
		<span style="font-size: 11px; color: gray;">(*)입력 필수 </span><br>
		<div class="btn-group1">
			<button id="bom-insert">BOM 등록</button>
			<button id="reset-btn">초기화</button>
		</div>
	</div>
		
	<span id="product-item-span" style="font-weight: bold;">완제품 목록</span> <span id="bom-tree-span" style="font-weight: bold;">Bom Tree</span>
	<button id="semi-product-delete">삭제</button> 
	<div class="main-content">
		<div class="product-item-list">
			<table id="item-table">
				<tr>
					<th> </th>
					<th> </th>
					<th>제품코드</th>
					<th>품명</th>
					<th>구분</th>
					<th>비고</th>
				</tr>
			</table>
		</div>
		
		<div class="bom-tree">
			<table id="item3-table">
			  <thead>
			    <tr>
			      <th> </th>
			      <th> </th>
			      <th>완제품코드</th>
			      <th>재료코드</th>
			      <th>품명</th>
			      <th>소요량</th>
			      <th>구분</th>
			      <th>재고단위</th>
			    </tr>
			  </thead>
			  <tbody></tbody>
			</table>
		</div>
		<span id="semi-product-item-span" style="font-weight: bold;">반제품/원자재 목록</span>
		<div class="semi-product-item-list">
			<table id="item2-table">
				<tr>
					<th> </th>
					<th> </th>
					<th>제품코드</th>
					<th>품명</th>
					<th>구분</th>
					<th>재고단위</th>
					<th>비고</th>
				</tr>
			</table>
		</div> 
	</div>	
	
	
	<!-- 완제품 모달 창 -->
	<div id="high-item-modal" class="modal">
	  	<div class="modal-content">
	    	<span class="close">&times;</span>
	    	<h2>완제품 선택</h2>
	    	<table id="high-item-table">
	      		<thead>
	        		<tr>
	          			<th>제품명</th>
				        <th>제품코드</th>
				        <th>제품구분</th>
				        <th>비고</th>
	        		</tr>
	      		</thead>
	      		<tbody id="high-item-list"></tbody>
	    	</table>
	  </div>
	</div>
	
	
	<!-- 반제품/원자재 모달 창 -->
	<div id="low-item-modal" class="modal">
	  	<div class="modal-content">
	    	<span class="close">&times;</span>
	    	<h2>반제품/원자재 선택</h2>
	    	<table id="low-item-table">
	      		<thead>
	        		<tr>
	          			<th>제품명</th>
				        <th>제품코드</th>
				        <th>제품구분</th>
				        <th>비고</th>
	        		</tr>
	      		</thead>
	      		<tbody id="low-item-list"></tbody>
	    	</table>
	  </div>
	</div>

		
</body>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
	
	$(document).ready(function () {
		productItemList();
		semiProductItemList();
	});

	// 완제품 모달 창 
	$(document).on('dblclick', '#high-item-code', function() {
	  	$('#high-item-modal').show();
	  	
	  	$.ajax({
	  		url : '/standard/pmi/product/items',
	  		type : 'GET',
	  		dataType : 'json',
	  		success : function(productItemList) {
	  			let tbody = $('#high-item-list');
	  	      	tbody.empty();

				for (var i = 0; i < productItemList.length; i++) {
					let item = productItemList[i];
					let row = '<tr>' +
				  	'<td>' + item.itemName + '</td>' +
				  	'<td>' + item.itemCode + '</td>' +
				  	'<td>' + item.itemType + '</td>' +
				  	'<td>' + item.memo + '</td>' +
				  	'</tr>';
					tbody.append(row);
				}
				// 테이블 행 클릭 시 데이터 설정 및 모달 숨김
				$('#high-item-table tbody tr').on('click', function() {
				  	let selectedRow = $(this);
				  	let itemCode = selectedRow.find('td:eq(1)').text();
				  	$('#high-item-code').val(itemCode);
				  	$('#high-item-modal').hide();
				});
	  		},
	  		error: function(xhr, status, error) {
			      console.log('Error:', error);
			}
	  	});
	});
	
	// 모달 창 닫기
	$(document).on('click', '#high-item-modal .close', function() {
	  	$('#high-item-modal').hide();
	});

	
	
	// 반제품/원자재 모달 창 
	$(document).on('dblclick', '#low-item-code', function() {
	  	$('#low-item-modal').show();
	  	
	  	$.ajax({
	  		url : '/standard/pmi/product/semi-items',
	  		type : 'GET',
	  		dataType : 'json',
	  		success : function(semiProductItemList) {
	  			let tbody = $('#low-item-list');
	  	      	tbody.empty();

				for (var i = 0; i < semiProductItemList.length; i++) {
					let item = semiProductItemList[i];
					let row = '<tr>' +
				  	'<td>' + item.itemName + '</td>' +
				  	'<td>' + item.itemCode + '</td>' +
				  	'<td>' + item.itemType + '</td>' +
				  	'<td>' + item.memo + '</td>' +
				  	'</tr>';
					tbody.append(row);
				}
				// 테이블 행 클릭 시 데이터 설정 및 모달 숨김
				$('#low-item-table tbody tr').on('click', function() {
				  	let selectedRow = $(this);
				  	let itemCode = selectedRow.find('td:eq(1)').text();
				  	$('#low-item-code').val(itemCode);
				  	$('#low-item-modal').hide();
				});
	  		},
	  		error: function(xhr, status, error) {
			      console.log('Error:', error);
			}
	  	});
	});
	
	// 모달 창 닫기
	$(document).on('click', '#low-item-modal .close', function() {
	  	$('#low-item-modal').hide();
	});
	
	
	// 완제품 리스트
	function productItemList() {
		$.ajax({
		    url : '/standard/pmi/product/items',
		    type : 'GET',
		    dataType : 'json',
		    success : function(productItemList) {
		      let table = $('#item-table');
	
		      for (var i = 0; i < productItemList.length; i++) {
			      let item = productItemList[i];
			      let row = '<tr>' +
			      '<td>' + (i + 1) + '</td>' +
		          '<td><input type="radio" name="item-radio"></td>' +
		          '<td style="background-color: #FFFFCC">' + item.itemCode + '</td>' +
		          '<td style="background-color: #D9D9D9">' + item.itemName + '</td>' +
		          '<td style="background-color: #E6F2FF">' + item.itemType + '</td>' +
		          '<td>' + item.memo + '</td>' +
		          '</tr>';
		      	  table.append(row);
		      }
		    },
		    error: function(xhr, status, error) {
		      console.log('Error:', error);
		    }
		});
	}
	
	// 완제품 리스트의 클릭 이벤트
	$(document).on('click', '#item-table tr', function () {
	    let radioInput = $(this).find('td:eq(1) input[type="radio"]');
	    radioInput.prop('checked', true);
	    let selectedRow = $(this);
	    let itemCode = selectedRow.find('td:eq(2)').text();
	    $('#high-item-code').val(itemCode);
	});
	
	
	// 반제품 리스트
	function semiProductItemList() {
		$.ajax({
		    url : '/standard/pmi/product/semi-items',
		    type : 'GET',
		    dataType : 'json',
		    success : function(semiProductItemList) {
		      let table = $('#item2-table');
	
		      for (var i = 0; i < semiProductItemList.length; i++) {
			      let item = semiProductItemList[i];
			      let row = '<tr>' +
			      '<td>' + (i + 1) + '</td>' +
		          '<td><input type="radio" name="item-radio"></td>' +
		          '<td style="background-color: #FFFFCC">' + item.itemCode + '</td>' +
		          '<td style="background-color: #D9D9D9">' + item.itemName + '</td>' +
		          '<td style="background-color: #E6F2FF">' + item.itemType + '</td>' +
		          '<td style="background-color: #D9D9D9">' + item.stockUnit + '</td>' +
		          '<td>' + item.memo + '</td>' +
		          '</tr>';
		      	  table.append(row);
		      }
		    },
		    error: function(xhr, status, error) {
		      console.log('Error:', error);
		    }
		});
	}
	
	// 반제품 리스트의 클릭 이벤트
	$(document).on('click', '#item2-table tr', function () {
	    let radioInput = $(this).find('td:eq(1) input[type="radio"]');
	    radioInput.prop('checked', true);
	    let selectedRow = $(this);
	    let itemCode = selectedRow.find('td:eq(2)').text();
	    $('#low-item-code').val(itemCode);
	});
	
	
	// Bom 리스트 이벤트
	$(document).on('click', '#item-table tr', function(event) {
		if (event.target.type !== 'radio') {
			$(this).find('input[type="radio"]').prop('checked', true);
		}
		let selectedRow = $(this);
		let itemCode = selectedRow.find('td:eq(2)').text();
		console.log(itemCode);
		bomList();
		
	});
	
	
	$(document).on('click', '#item3-table tr', function () {
	    let radioInput = $(this).find('td:eq(1) input[type="radio"]');
	    radioInput.prop('checked', true);
	    let selectedRow = $(this);
	    let itemCode = selectedRow.find('td:eq(3)').text();
	    $('#low-item-code').val(itemCode);
	}); 
	
	// Bom Tree 리스트
	function bomList(paramItemCode) {
		let itemCode = $('#item-table tr input[type="radio"]:checked').closest('tr').find('td:eq(2)').text();
		if (paramItemCode === undefined){
			itemCode = itemCode;
		} else {
			itemCode = paramItemCode;
		}
		console.log('bomList -> ' + itemCode);
		console.log('paramItemCodeBomList -> ' + paramItemCode);
		
		$.ajax({
		    url: '/standard/pmi/bom-list/' + itemCode,
		    type: 'GET',
		    dataType: 'json',
		    success: function(bomList) {
		      	let table = $('#item3-table');
		      	let tbody = table.find('tbody');
				if (!tbody.length) {
				  	tbody = $('<tbody></tbody>');
				  	table.append(tbody);
				}
		      	tbody.empty();
		      	for (var i = 0; i < bomList.length; i++) {
		        	let bom = bomList[i];
		        	let row = '<tr>' +
		          	'<td>' + (i + 1) + '</td>' +
		          	'<td><input type="radio" name="item-radio"></td>' +
		          	'<td style="background-color: #D9D9D9">' + bom.highItemCode + '</td>' +
		          	'<td style="background-color: #FFFFCC">' + bom.lowItemCode + '</td>' +
		          	'<td style="background-color: #D9D9D9">' + bom.itemName + '</td>' +
		          	'<td style="background-color: #FFFFCC">' + bom.materialQuantity + '</td>' +
		          	'<td style="background-color: #E6F2FF">' + bom.itemType + '</td>' +
		          	'<td style="background-color: #D9D9D9">' + bom.stockUnit + '</td>' +
		          	'</tr>';
		        	tbody.append(row);
		      	}
		    },
		    error: function(xhr, status, error) {
		      	console.log('Error:', error);
		    }
		});
	}
	
	
	// 초기화 버튼
	$(document).on('click', '#reset-btn', function(){
		$('#high-item-code').val('').attr('placeholder', '더블 클릭 하여 선택').prop('readonly', true);
		$('#low-item-code').val('').attr('placeholder', '더블 클릭 하여 선택').prop('readonly', true);
		$('#material-quantity').val('');
	});
	
	
	// Bom 등록
	$(document).on('click', '#bom-insert', function(){
		if  ($('#high-item-code').val() === "" || $('#low-item-code').val() === "" || $('#material-quantity').val() === "") {
			alert("필수 정보를 입력해주세요.");
		} else {
			$.ajax({
				url : '/standard/pmi/bom',
				type : 'POST',
				dataType : 'json',
				contentType : 'application/json',
				data : JSON.stringify({
					highItemCode		: $('#high-item-code').val(),
					lowItemCode 		: $('#low-item-code').val(),
					materialQuantity	: $('#material-quantity').val()
				}),
				success : function(bomInsert){
					if(bomInsert == 1){
						alert("Bom 등록이 완료되었습니다.");
						bomList($('#high-item-code').val());
					} else if (bomInsert == -1){
						alert("중복 등록은 불가 합니다.");
					} else {
						alert("Bom 등록에 실패하였습니다. 잠시 후 다시 시도해주세요.");
					}
				},
				error: function(xhr, status, error) {
				      console.log('Error:', error);
				}
			});
		}
	});
	
	
	// 반제품/원자재 삭제 버튼
	$(document).on('click', '#semi-product-delete', function(){
		let highItemCode = $('#high-item-code').val();
		let lowItemCode = $('#low-item-code').val();
		console.log(highItemCode);
		console.log(lowItemCode);
		
		if (highItemCode === '' || lowItemCode === ''){
			alert("삭제 할 반제품/원자재를 선택해주세요.");
		} else {
			$.ajax({
				url : '/standard/pmi/bom',
				type : 'DELETE',
				dataType : 'json',
				contentType : 'application/json',
				data : JSON.stringify({
					highItemCode : highItemCode,
					lowItemCode : lowItemCode
				}),
				success : function(bomDelete){
					if(bomDelete == 1){
						alert("삭제가 완료되었습니다.");
						bomList(highItemCode);
					} else {
						alert("삭제 중 문제가 발생 했습니다.다음에 다시 시도해주세요.");
					}
				},
				error: function(xhr, status, error) {
				      console.log('Error:', error);
				}
			});
		}
	});
	 
	
	


</script>
</html>