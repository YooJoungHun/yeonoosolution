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
	height: 615px;
	margin: 0px auto;
	overflow: auto;
	border: 1px solid #ddd;
	margin-top: 8px;
	
}

.btn-group1 {
	width: 320px;
	margin: 3px;
}


.input-info {
	width: 1305px;
	height: 210px;
	margin: 0px auto;
	padding: 16px;
    border-radius: 10px;
    margin-top: 8px;
    background-color: #F8F8F8;
    margin-right: 175px;
	
}

.input-info label {
	display: inline-block;
    width: 100px;
    border-radius: 5px;
    border: 1px solid #E8EBF0;
    padding: 0;
    font-size: 14px;
    font-weight: bold;
    text-align: center;
    line-height: 30px;
    background-color: #9BABB8;
    margin-bottom: 15px;
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

.input-info select {
	display: inline-block;
    width: 100px;
    height: 30px;
    border-radius: 5px;
    border: 1px solid #E8EBF0;
    padding: 0px;
    font-size: 14px;
    line-height: 30px;
}

.btn-group1 button {
	display: inline-block;
	border: 1px solid #D6DAE2;
    outline: none;
    border-radius: 5px;
    padding: 0 12px;
    height: 30px;
	
}

.input-info button:hover {
	background-color: #D6D2C4;
}

.side-bar {
	border: 1px solid #ddd;
	padding: 20px;
	float: left;
	height: 100vh;
}


#content-table th {
	background-color: #9BABB8;
	font-weight: bold;
}

#content-table th, #content-table td {
	white-space: nowrap;
	padding: 8px;
	text-align: center;
	border: 1px solid #B3B3B3;
}


#content-table tr {
	height: 24px;
}

#content-table {
	width: 1305px;
	border-collapse: collapse;
	white-space: nowrap;
	font-size: 15px;
}


#content-table tr:hover {
  	background-color: #f5f5f5;
}


#content-table input[type="checkbox"] {
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
  max-width: 400px;
  width: 80%;
  border-radius: 5px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
}

/* 모달 창 닫기 버튼 */
.close {
  color: #aaa;
  float: right;
  font-size: 20px;
  font-weight: bold;
  cursor: pointer;
}

.close:hover,
.close:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}

/* 리스트 아이템 */

.modal-content h2 {
	text-align: center;
	margin: 0px auto;
	margin-bottom: 20px;
}

#wh-table th {
	background-color: #9BABB8;
	font-weight: bold;
}

#wh-table th, #wh-table td {
	white-space: nowrap;
	padding: 8px;
	text-align: center;
	border: 1px solid #B3B3B3;
}

#wh-table {
	width: 400px;
	border: 2px solid #ddd;
	border-collapse: collapse;
	white-space: nowrap;
	font-size: 15px;
}


#wh-list td {
	cursor: pointer; 
	padding: 5px;
}


#wh-list tr {
	height: 24px;
}

#wh-list tr:hover {
	background-color: #f5f5f5; /* 호버 상태 배경색 변경 */
}



#company-table th {
	background-color: #9BABB8;
	font-weight: bold;
}

#company-table th, #company-table td {
	white-space: nowrap;
	padding: 8px;
	text-align: center;
	border: 1px solid #B3B3B3;
}

#company-table {
	width: 400px;
	border: 2px solid #ddd;
	border-collapse: collapse;
	white-space: nowrap;
	font-size: 15px;
}


#company-list td {
	cursor: pointer; /* 마우스 커서를 포인터로 변경 */
	padding: 5px;
}


#company-list tr {
	height: 24px;
}

#company-list tr:hover {
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
		<span style="font-weight: bold;">제품 정보 입력</span> 
		<br>
		<br>
		<label>창고</label><input id="wh-code" placeholder="더블 클릭하여 선택" readonly style="background-color: #FFFFCC">
		<label>*거래처 코드</label><input id="company-code" placeholder="더블 클릭하여 선택" readonly style="background-color: #FFFFCC">
		<label>제품 코드</label><input placeholder="자동 생성" id="item-code" readonly style="background-color: #D9D9D9">
		<label>*품명</label><input id="item-name" style="background-color: #E6F2FF">
		<label>구분</label><select id="item-type" class="item-type-select">
											<option value="완제품">완제품</option>
											<option value="반제품">반제품</option>
											<option value="원자재">원자재</option>
										</select>
		<label>단위</label><input id="stock-unit" style="background-color: #E6F2FF">
		<label>비고</label><input id="memo">
		<label>*시작일</label><input id="start-date" type="date" style="background-color: #FFFFCC">
		<label>*종료일</label><input id="end-date" type="date" style="background-color: #FFFFCC"><br>
		<label>*등록/수정자</label><input id="reg-user" placeholder="필수 입력 정보" style="background-color: #E6F2FF">
		<label>등록/수정일자</label><input id="reg-date" readonly style="background-color: #D9D9D9"> <span style="font-size: 11px; color: gray;">(*)입력 필수 </span>
		<br>
		<div class="btn-group1">
			<button id="item-insert">제품 등록</button>
			<button id="item-update" data-action="update">수정 완료</button>
			<button id="item-delete" data-action="delete">삭제</button> 
			<button id="reset-btn">초기화</button>
		</div>
	</div>
	
	
	<div class="main-content">
		<table id="content-table">
			<tr>
				<th class="content-table-num"> </th>
				<th class="content-table-radio"> </th>
				<th class="content-table-wh">창고</th>
				<th class="content-table-company">거래처코드</th>
				<th class="content-table-item-code">제품코드</th>
				<th class="content-table-item-name">품명</th>
				<th class="content-table-item-type">구분</th>
				<th class="content-table-item-type">재고단위</th>
				<th class="content-table-memo">비고</th>
				<th class="content-table-start-date">시작일</th>
				<th class="content-table-end-date">종료일</th>
				<th class="content-table-reg-user">등록자</th>
				<th class="content-table-reg-date">등록일자</th>
				<th class="content-table-update-user">수정자</th>
				<th class="content-table-update-date">수정일자</th>
			</tr>
		</table>
	</div>
	
	
	<!-- 창고 모달 창 -->
	<div id="wh-modal" class="modal">
	  	<div class="modal-content">
	    	<span class="close">&times;</span>
	    	<h2>창고 선택</h2>
	    	<table id="wh-table">
	      		<thead>
	        		<tr>
	          			<th>창고코드</th>
				        <th>창고명</th>
	        		</tr>
	      		</thead>
	      		<tbody id="wh-list"></tbody>
	    	</table>
	  </div>
	</div>
	
	
	<!-- 거래처 모달 창 -->
	<div id="company-modal" class="modal">
	  	<div class="modal-content">
	    	<span class="close">&times;</span>
	    	<h2>거래처 선택</h2>
	    	<table id="company-table">
	      		<thead>
	        		<tr>
	          			<th>거래처코드</th>
				        <th>거래처구분</th>
				        <th>거래처명</th>
	        		</tr>
	      		</thead>
	      		<tbody id="company-list"></tbody>
	    	</table>
	  </div>
	</div>


</body>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
	
	$(document).ready(function () {
		defaultItemList();
		getNow();
	});
	
	
	// 현재 날짜 가져오기
	function getNow() {
		let today = new Date();
		// 날짜를 yyyy/mm/dd 형식으로 변환
		let year = today.getFullYear();
		let month = String(today.getMonth() + 1).padStart(2, '0');
		let day = String(today.getDate()).padStart(2, '0');
		// 등록/수정일자 input에 오늘 날짜 설정
		$('#reg-date').val(year + '/' + month + '/' + day);
	};
	
	
	// 창고 모달 창 
	$(document).on('dblclick', '#wh-code', function() {
	  	$('#wh-modal').show();
	  	
	  	$.ajax({
	  		url : '/standard/imi/wh',
	  		type : 'GET',
	  		dataType : 'json',
	  		success : function(whList) {
	  			let tbody = $('#wh-list');
	  	      	tbody.empty();

				for (var i = 0; i < whList.length; i++) {
					let wh = whList[i];
					let row = '<tr>' +
				  	'<td>' + wh.whCode2 + '</td>' +
				  	'<td>' + wh.whName + '</td>' +
				  	'</tr>';
					tbody.append(row);
				}
				// 테이블 행 클릭 시 데이터 설정 및 모달 숨김
				$('#wh-table tbody tr').on('click', function() {
				  	let selectedRow = $(this);
				  	let whCode = selectedRow.find('td:eq(1)').text();
				  	$('#wh-code').val(whCode);
                    $('#wh-modal').hide();
				});
	  		},
	  		error: function(xhr, status, error) {
			      console.log('Error:', error);
			}
	  	});
	});

	
	// 창고 모달 창 닫기
	$(document).on('click', '#wh-modal .close', function() {
	  	$('#wh-modal').hide();
	});
	
	
	// 거래처 모달 창 
	$(document).on('dblclick', '#company-code', function() {
	  	$('#company-modal').show();
	  	
	  	$.ajax({
	  		url : '/standard/imi/companys',
	  		type : 'GET',
	  		dataType : 'json',
	  		success : function(companyList) {
	  			let tbody = $('#company-list');
	  	      	tbody.empty();

				for (var i = 0; i < companyList.length; i++) {
					let company = companyList[i];
					let row = '<tr>' +
				  	'<td>' + company.companyCode + '</td>' +
				  	'<td>' + company.orderType + '</td>' +
				  	'<td>' + company.companyName + '</td>' +
				  	'</tr>';
					tbody.append(row);
				}
				// 테이블 행 클릭 시 데이터 설정 및 모달 숨김
				$('#company-table tbody tr').on('click', function() {
				  	let selectedRow = $(this);
				  	let companyCode = selectedRow.find('td:eq(1)').text();
				  	$('#company-code').val(companyCode);
                    $('#company-modal').hide();
				});
	  		},
	  		error: function(xhr, status, error) {
			      console.log('Error:', error);
			}
	  	});
	});
	
	// 거래처 모달 창 닫기
	$(document).on('click', '#company-modal .close', function() {
	  	$('#company-modal').hide();
	});
	
	
	// 제품 등록
	$(document).on('click', '#item-insert', function(){
		if  ($('#reg-user').val() === "" || $('#company-code').val() === "" || $('#start-date').val() === "" || $('#end-date').val() === "") {
			alert("필수 정보를 입력해주세요.");
		} else {
			$.ajax({
				url : '/standard/imi/item',
				type : 'POST',
				dataType : 'json',
				contentType : 'application/json',
				data : JSON.stringify({
					whCode 		: $('#wh-code').val(),
					companyCode : $('#company-code').val(),
					itemName 	: $('#item-name').val(),
					itemType 	: $('#item-type').val(),
					stockUnit 	: $('#stock-unit').val(),
					memo 		: $('#memo').val(),
					startDate 	: $('#start-date').val(),
					endDate 	: $('#end-date').val(),
					regUser 	: $('#reg-user').val(),
					regDate 	: $('#reg-date').val(),
					updateUser  : $('#reg-user').val(),
					updateDate  : $('#reg-date').val()
				}),
				success : function(itemInsert){
					if(itemInsert == 1){
						alert("제품 등록 완료.");
					} else {
						alert("제품 등록 실패.");
					}
					location.reload();
				},
				error: function(xhr, status, error) {
				      console.log('Error:', error);
				}
			});
		}
	});
	
	
	// 열 클릭시 라디오 박스 체크
	$(document).on('click', '#content-table tbody tr', function() {
		$(this).toggleClass('checked-row');
	});

	
	// 제품 삭제 및 수정(업데이트)
	$(document).on('click', '#item-delete, #item-update', function() {
		let itemCode = $('#item-code').val();
		let action = $(this).data('action');
		
		if(itemCode === "") {
			alert("제품을 먼저 선택 해주세요.");
		} else {
			console.log(action);
			console.log(itemCode);
			
			$.ajax({
				url : '/standard/imi/' + itemCode,
				type : 'PUT',
				dataType : 'json',
				contentType : 'application/json',
				headers: {
				    'action': action
				},
				data : JSON.stringify({
					whCode 		: $('#wh-code').val(),
					companyCode : $('#company-code').val(),
					itemCode    : itemCode,
					itemName 	: $('#item-name').val(),
					itemType 	: $('#item-type').val(),
					stockUnit 	: $('#stock-unit').val(),
					memo 		: $('#memo').val(),
					startDate 	: $('#start-date').val(),
					endDate 	: $('#end-date').val(),
					updateUser  : $('#reg-user').val(),
					updateDate  : $('#reg-date').val(),
				}),
				success : function(resultMap){
					if (action === 'delete') {
						if (resultMap.itemRemove === 1) {
							alert("삭제가 완료되었습니다.");
						} else {
							alert("에러가 발생하였습니다. 잠시 후 다시 시도해주세요.");
						}
					} else if (action === 'update') {
						if (resultMap.itemUpdate === 1) {
							alert("수정이 완료되었습니다.");
						} else {
							alert("에러가 발생하였습니다. 잠시 후 다시 시도해주세요.");
						}
					}
					location.reload();
				},
				error: function(xhr, status, error) {
				      console.log('Error:', error);
				}
			});
		}
	});

	
	// 제품 디폴트 리스트
	function defaultItemList() {
		$.ajax({
		    url : '/standard/imi/items',
		    type : 'GET',
		    dataType : 'json',
		    success : function(itemList) {
		      let table = $('#content-table');
	
		      for (var i = 0; i < itemList.length; i++) {
			      let item = itemList[i];
			      let row = '<tr>' +
			      '<td>' + (i + 1) + '</td>' +
		          '<td><input type="radio" name="item-radio"></td>' +
		          '<td style="background-color: #FFFFCC">' + item.whCode	 + '</td>' +
		          '<td style="background-color: #FFFFCC">' + item.companyCode + '</td>' +
		          '<td style="background-color: #D9D9D9">' + item.itemCode + '</td>' +
		          '<td style="background-color: #E6F2FF">' + item.itemName + '</td>' +
		          '<td style="background-color: #E6F2FF">' + item.itemType + '</td>' +
		          '<td style="background-color: #E6F2FF">' + item.stockUnit + '</td>' +
		          '<td>' + item.memo + '</td>' +
		          '<td style="background-color: #FFFFCC">' + item.startDate.substring(0, 10) + '</td>' +
		          '<td style="background-color: #FFFFCC">' + item.endDate.substring(0, 10) + '</td>' +
		          '<td style="background-color: #E6F2FF">' + item.regUser + '</td>' +
		          '<td style="background-color: #D9D9D9">' + item.regDate.substring(0, 10) + '</td>' +
		          '<td style="background-color: #E6F2FF">' + item.updateUser + '</td>' +
		          '<td style="background-color: #D9D9D9">' + item.updateDate.substring(0, 10) + '</td>' +
		          '</tr>';
		      	  table.append(row);
		      }
		    },
		    error: function(xhr, status, error) {
		      console.log('Error:', error);
		    }
		});
	}
	
	
	// 체크 된 아이템 정보 가져오기
	function updateInputFields(selectedRow) {
		let whCode = selectedRow.find('td:eq(2)').text();
		let companyCode = selectedRow.find('td:eq(3)').text();
		let itemCode = selectedRow.find('td:eq(4)').text();
		let itemName = selectedRow.find('td:eq(5)').text();
		let itemType = selectedRow.find('td:eq(6) select').val();
		let stockUnit = selectedRow.find('td:eq(7)').text();
		let memo = selectedRow.find('td:eq(8)').text();
		let startDate = selectedRow.find('td:eq(9)').text();
		let endDate = selectedRow.find('td:eq(10)').text();
		let regUser = selectedRow.find('td:eq(11)').text();
		
		$('#wh-code').val(whCode);
		$('#company-code').val(companyCode);
		$('#item-code').val(itemCode);
		$('#item-name').val(itemName);
		$('#item-type-select').val(itemType).trigger('change');
		$('#stock-unit').val(stockUnit);
		$('#memo').val(memo);
		$('#start-date').val(startDate);
		$('#end-date').val(endDate);
		$('#reg-user').val(regUser);
		
		let radioInput = selectedRow.find('td:eq(1) input[type="radio"]');
		radioInput.prop('checked', true);
		
		let selectedItemType = selectedRow.find('td:eq(6) select').val();
		$('#item-type > select').val(selectedItemType).trigger('change');
	}

	$(document).on('click', '#content-table input[type="radio"]', function () {
	  	let selectedRow = $(this).closest('tr');
	  	updateInputFields(selectedRow);
	});
	
	$(document).on('input', '#wh-code', function () {
	  	let selectedRow = $('#content-table tr input[type="radio"]:checked').closest('tr');
	  	selectedRow.find('td:eq(2)').text($(this).val());
	});
	
	$(document).on('input', '#company-code', function () {
	  	let selectedRow = $('#content-table tr input[type="radio"]:checked').closest('tr');
	  	selectedRow.find('td:eq(3)').text($(this).val());
	});
	
	$(document).on('input', '#item-code', function () {
	  	let selectedRow = $('#content-table tr input[type="radio"]:checked').closest('tr');
	  	selectedRow.find('td:eq(4)').text($(this).val());
	});
	
	$(document).on('input', '#item-name', function () {
	  	let selectedRow = $('#content-table tr input[type="radio"]:checked').closest('tr');
	  	selectedRow.find('td:eq(5)').text($(this).val());
	});
	
	$(document).on('change', '#item-type + select', function () {
		let selectedRow = $('#content-table tr input[type="radio"]:checked').closest('tr');
		let itemType = $(this).val();
		selectedRow.find('td:eq(6) select').val(itemType);
		$('#item-type > select').val(itemType).trigger('change');
	});
	
	$(document).on('input', '#stock-unit', function () {
	  	let selectedRow = $('#content-table tr input[type="radio"]:checked').closest('tr');
	  	selectedRow.find('td:eq(7)').text($(this).val());
	});
	
	$(document).on('input', '#memo', function () {
	  	let selectedRow = $('#content-table tr input[type="radio"]:checked').closest('tr');
	  	selectedRow.find('td:eq(8)').text($(this).val());
	});
	
	$(document).on('input', '#start-date', function () {
	  	let selectedRow = $('#content-table tr input[type="radio"]:checked').closest('tr');
	  	selectedRow.find('td:eq(9)').text($(this).val());
	});
	
	$(document).on('input', '#end-date', function () {
	  	let selectedRow = $('#content-table tr input[type="radio"]:checked').closest('tr');
	  	selectedRow.find('td:eq(10)').text($(this).val());
	});
	
	$(document).on('input', '#reg-user', function () {
	  	let selectedRow = $('#content-table tr input[type="radio"]:checked').closest('tr');
	  	selectedRow.find('td:eq(11)').text($(this).val());
	});
	
	
	$(document).on('click', '#content-table tr', function () {
		let radioInput = $(this).find('td:eq(1) input[type="radio"]');
		radioInput.prop('checked', true);
		let selectedRow = $(this);
		updateInputFields(selectedRow);
	});

	
	// 초기화 버튼
	$(document).on('click', '#reset-btn', function(){
		$('#wh-code').val('').attr('placeholder', '더블 클릭하여 창고 선택').prop('readonly', true);
		$('#company-code').val('').attr('placeholder', '더블 클릭하여 거래처 선택').prop('readonly', true);
		$('#item-code').val('').attr('placeholder', '자동 생성').prop('readonly', true);
		$('#item-name').val('');
		$('#item-type').val('완제품');
		$('#stock-unit').val('');
		$('#memo').val('');
		$('#start-date').val('').prop('required', true);
		$('#end-date').val('').prop('required', true);
		$('#reg-user').val('');
		$('#content-table tr input[type="radio"]:checked').prop('checked', false);
		$('#content-table tr.checked-row').removeClass('checked-row');
	});


</script>
</html>