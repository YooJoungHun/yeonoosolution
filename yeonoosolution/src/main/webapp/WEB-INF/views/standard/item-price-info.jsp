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

.input-info {
	width: 1305px;
	height: 110px;
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
	

</style>
<meta charset="UTF-8">
<title>품목 단가 관리</title>
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
		제품 단가 입력<br>
		<span>거래처 코드</span><input id="company-code" readonly>
		<span>제품 코드</span><input id="item-code" readonly>
		<span>품명</span><input id="item-name" readonly>
		<span>*매입 단가</span><input id="purchase-price">
		<span>*매출 단가</span><input id="sales-price"><br>
		<span>시작일</span><input id="start-date" type="date">
		<span>종료일</span><input id="end-date" type="date">
		<span>비고</span><input id="memo">
		<span>*등록/수정자</span><input id="reg-user" placeholder="필수 입력 정보">
		<span>등록/수정일자</span><input id="reg-date" readonly>
		
		<div class="btn-group1">
			<button id="item-update">단가 등록/수정</button>
			<button id="reset-btn">초기화</button>
		</div>
	</div>
	
	
	<div class="main-content">
		<table id="content-table">
			<tr>
				<th> </th>
				<th> </th>
				<th>창고</th>
				<th>거래처코드</th>
				<th>구분</th>
				<th>제품코드</th>
				<th>품명</th>
				<th>매입단가</th>
				<th>매출단가</th>
				<th>시작일</th>
				<th>종료일</th>
				<th>재고단위</th>
				<th>비고</th>
				<th>등록자</th>
				<th>등록일자</th>
				<th>수정자</th>
				<th>수정일자</th>
			</tr>
		</table>
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
	
	
	// 열 클릭시 라디오 박스 체크
	$(document).on('click', '#content-table tbody tr', function() {
		$(this).toggleClass('checked-row');
	});

	
	// 제품 단가 수정(업데이트)
	$(document).on('click', '#item-update', function() {
		if (!$('input[type="radio"]:checked').val()) {
		    alert("제품을 먼저 선택해주세요.");
		    return;
		}
		if ($('#reg-user').val() === "") {
			alert("필수 정보를 입력해주세요.")
		} else {
			let itemCode = $('#item-code').val();
			console.log(itemCode);
			
			$.ajax({
				url : '/standard/ipi/' + itemCode,
				type : 'PUT',
				dataType : 'json',
				contentType : 'application/json',
				data : JSON.stringify({
					itemCode    	: itemCode,
					purchasePrice 	: $('#purchase-price').val(),
					salesPrice		: $('#sales-price').val(),
					memo 			: $('#memo').val(),
					startDate 		: $('#start-date').val(),
					endDate 		: $('#end-date').val(),
					updateUser  	: $('#reg-user').val(),
					updateDate  	: $('#reg-date').val(),
				}),
				success : function(updateResult){
					if (updateResult === 1) {
						alert("단가 등록 완료.");
					} else {
						alert("단가 등록 실패.");
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
		    url : '/standard/ipi/items',
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
		          '<td>' + item.companyCode	 + '</td>' +
		          '<td>' + item.itemType + '</td>' +
		          '<td>' + item.itemCode + '</td>' +
		          '<td>' + item.itemName + '</td>' +
		          '<td>' + item.purchasePrice + '</td>' +
		          '<td>' + item.salesPrice + '</td>' +
		          '<td>' + item.startDate.substring(0, 10) + '</td>' +
		          '<td>' + item.endDate.substring(0, 10) + '</td>' +
		          '<td>' + item.stockUnit + '</td>' +
		          '<td>' + item.memo + '</td>' +
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
		let companyCode = selectedRow.find('td:eq(3)').text();
		let itemCode = selectedRow.find('td:eq(5)').text();
		let itemName = selectedRow.find('td:eq(6)').text();
		let purchasePrice = selectedRow.find('td:eq(7)').text();
		let salesPrice = selectedRow.find('td:eq(8)').text();
		let startDate = selectedRow.find('td:eq(9)').text();
		let endDate = selectedRow.find('td:eq(10)').text();
		let stockUnit = selectedRow.find('td:eq(11)').text();
		let memo = selectedRow.find('td:eq(12)').text();
		let regUser = selectedRow.find('td:eq(13)').text();
		
		$('#company-code').val(companyCode);
		$('#item-code').val(itemCode);
		$('#item-name').val(itemName);
		$('#purchase-price').val(purchasePrice);
		$('#sales-price').val(salesPrice);
		$('#start-date').val(startDate);
		$('#end-date').val(endDate);
		$('#stock-unit').val(stockUnit);
		$('#memo').val(memo);
		$('#reg-user').val(regUser);
		
		let radioInput = selectedRow.find('td:eq(1) input[type="radio"]');
		radioInput.prop('checked', true);
		
	}

	$(document).on('click', '#content-table input[type="radio"]', function () {
	  	let selectedRow = $(this).closest('tr');
	  	updateInputFields(selectedRow);
	});
	
	$(document).on('input', '#company-code', function () {
	  	let selectedRow = $('#content-table tr input[type="radio"]:checked').closest('tr');
	  	selectedRow.find('td:eq(3)').text($(this).val());
	});
	
	$(document).on('input', '#item-code', function () {
	  	let selectedRow = $('#content-table tr input[type="radio"]:checked').closest('tr');
	  	selectedRow.find('td:eq(5)').text($(this).val());
	});
	
	$(document).on('input', '#item-name', function () {
	  	let selectedRow = $('#content-table tr input[type="radio"]:checked').closest('tr');
	  	selectedRow.find('td:eq(6)').text($(this).val());
	});
	
	$(document).on('input', '#purchase-price', function () {
	  	let selectedRow = $('#content-table tr input[type="radio"]:checked').closest('tr');
	  	selectedRow.find('td:eq(7)').text($(this).val());
	});
	
	$(document).on('input', '#sales-price', function () {
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
	
	$(document).on('input', '#memo', function () {
	  	let selectedRow = $('#content-table tr input[type="radio"]:checked').closest('tr');
	  	selectedRow.find('td:eq(12)').text($(this).val());
	});
	
	$(document).on('input', '#reg-user', function () {
	  	let selectedRow = $('#content-table tr input[type="radio"]:checked').closest('tr');
	  	selectedRow.find('td:eq(13)').text($(this).val());
	});
	
	
	$(document).on('click', '#content-table tr', function () {
		let radioInput = $(this).find('td:eq(1) input[type="radio"]');
		radioInput.prop('checked', true);
		let selectedRow = $(this);
		updateInputFields(selectedRow);
	});

	
	// 초기화 버튼
	$(document).on('click', '#reset-btn', function(){
		$('#company-code').val('');
		$('#item-code').val('');
		$('#item-name').val('');
		$('#purchase-price').val('');
		$('#sales-price').val('');
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