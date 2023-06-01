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
}

.btn-group1 {
	width: 280px;
	margin: 3px;
}

.btn-group2 {
	width: 160px;
	margin: 3px;
}

.input-info {
	width: 1305px;
	height: 130px;
	margin: 0px auto;
	
}

#content-table table {
	width: 100%;
	border-collapse: collapse;
	border: 1px solid #ddd;
}

#content-table th, td {
	padding: 8px;
	text-align: center;
	border: 1px solid #ddd;
	white-space: nowrap;
}

#content-table th {
	background-color: #ddd;
	font-weight: bold;
}

#content-table tr:hover {
  	background-color: #f5f5f5;
}

#content-table input[type="checkbox"] {
 	margin: 0;
}
	
/* 모달 창 */
.modal {
  display: none; /* 기본적으로 숨김 처리 */
  position: fixed;
  z-index: 1;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  overflow: auto;
  background-color: rgba(0, 0, 0, 0.5); /* 배경색과 투명도 조정 */
}

/* 모달 창 컨텐츠 */
.modal-content {
  background-color: #fefefe;
  margin: 10% auto;
  padding: 20px;
  border: 1px solid #888;
  max-width: 400px; /* 최대 너비 설정 */
  width: 80%;
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

/* 리스트 아이템 */
#wh-list li {
  cursor: pointer; /* 마우스 커서를 포인터로 변경 */
  padding: 5px;
}

#wh-list li:hover {
  background-color: #f5f5f5; /* 호버 상태 배경색 변경 */
}

#company-list li {
  cursor: pointer; /* 마우스 커서를 포인터로 변경 */
  padding: 5px;
}

#company-list li:hover {
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
		<ul class="side-bar">
		    <li class="category">
		        <a href="#" class="category-link">
		            기준 정보
		        </a>
		        <ul class="categories">
		            <li><a href="#">사용자 관리</a></li>
		            <li><a href="/standard/imi">품목 관리 및 등록</a></li>
		            <li><a href="/standard/ipi">품목 단가 관리</a></li>
		            <li><a href="#">창고 관리 정보</a></li>
		            <li><a href="/standard/pmi">생산 관리 BOM 등록</a></li>
		        </ul>
		    </li>
		</ul>
	</div>
	
	
	<div class="input-info">
		<div class="btn-group1">
			<button id="item-insert">제품 등록</button>
			<button id="item-update" data-action="update">수정 완료</button>
			<button id="item-delete" data-action="delete">삭제</button> 
			<button id="reset-btn">초기화</button>
		</div>
		
		제품 정보 입력<br>
		<span>창고</span><input id="wh-code" placeholder="더블 클릭하여 창고 선택" readonly>
		<span>*거래처 코드</span><input id="company-code" placeholder="더블 클릭하여 거래처 선택" readonly>
		<span>*제품 코드</span><input placeholder="자동 생성" id="item-code" readonly>
		<span>품명</span><input id="item-name">
		<span>구분</span><select id="item-type" class="item-type-select">
											<option value="완제품">완제품</option>
											<option value="반제품">반제품</option>
											<option value="원자재">원자재</option>
										</select>
		<span>단위</span><input id="stock-unit"><br>
		<span>비고</span><input id="memo">
		<span>*시작일</span><input id="start-date" type="date">
		<span>*종료일</span><input id="end-date" type="date">
		<span>*등록/수정자</span><input id="reg-user" placeholder="필수 입력 정보">
		<span>등록/수정일자</span><input id="reg-date" readonly>
	</div>
	
	
	<div class="main-content">
		<table id="content-table">
			<tr>
				<th> </th>
				<th> </th>
				<th>창고</th>
				<th>거래처코드</th>
				<th>제품코드</th>
				<th>품명</th>
				<th>구분</th>
				<th>재고단위</th>
				<th>비고</th>
				<th>시작일</th>
				<th>종료일</th>
				<th>등록자</th>
				<th>등록일자</th>
				<th>수정자</th>
				<th>수정일자</th>
			</tr>
		</table>
	</div>
	
	<!-- 창고 모달 창 -->
	<div id="wh-modal" class="modal">
	  <div class="modal-content">
	    <span class="close">&times;</span>
	    <h2>창고 선택</h2>
	    <ul id="wh-list"></ul>
	  </div>
	</div>
	
	
	<!-- 거래처 모달 창 -->
	<div id="company-modal" class="modal">
	  <div class="modal-content">
	    <span class="close">&times;</span>
	    <h2>거래처 선택</h2>
	    <ul id="company-list"></ul>
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
	  			let ul = $('#wh-list');
	  			$('#wh-list').empty();
	  			for (var i = 0; i < whList.length; i++) {
	                let wh = whList[i];
	                let li = $('<li>' + wh.whCode2 + ' - ' + wh.whName + '</li>');
	                li.on('click', function() {
	                    $('#wh-code').val(wh.whCode2);
	                    $('#wh-modal').hide();
	                });
	                ul.append(li);
	  			}
	  		},
	  		error: function(xhr, status, error) {
			      console.log('Error:', error);
			}
	  	});
	});

	
	// 모달 창 닫기
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
	  			let ul = $('#company-list');
	  			$('#company-list').empty();
	  			for (var i = 0; i < companyList.length; i++) {
	                let company = companyList[i];
	                let li = $('<li>' + company.companyCode + ' - ' + company.orderType + ' - ' + company.companyName + '</li>');
	                li.on('click', function() {
	                    $('#company-code').val(company.companyCode);
	                    $('#company-modal').hide();
	                });
	                ul.append(li);
	  			}
	  		},
	  		error: function(xhr, status, error) {
			      console.log('Error:', error);
			}
	  	});
	});

	
	// 모달 창 닫기
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
		          '<td>' + item.whCode	 + '</td>' +
		          '<td>' + item.companyCode + '</td>' +
		          '<td>' + item.itemCode + '</td>' +
		          '<td>' + item.itemName + '</td>' +
		          '<td>' + item.itemType + '</td>' +
		          '<td>' + item.stockUnit + '</td>' +
		          '<td>' + item.memo + '</td>' +
		          '<td>' + item.startDate.substring(0, 10) + '</td>' +
		          '<td>' + item.endDate.substring(0, 10) + '</td>' +
		          '<td>' + item.regUser + '</td>' +
		          '<td>' + item.regDate.substring(0, 10) + '</td>' +
		          '<td>' + item.updateUser + '</td>' +
		          '<td>' + item.updateDate.substring(0, 10) + '</td>' +
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