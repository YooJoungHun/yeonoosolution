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
	

</style>
<meta charset="UTF-8">
<title>품목 단가 관리</title>
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
		<span style="font-weight: bold;">제품 단가 입력</span> <br>
		<br>
		<span style="font-size: 11px; color: gray;">(*)입력 필수 </span><br>
		<label>거래처 코드</label><input id="company-code" readonly style="background-color: #D9D9D9">
		<label>제품 코드</label><input id="item-code" readonly style="background-color: #D9D9D9">
		<label>품명</label><input id="item-name" readonly style="background-color: #D9D9D9">
		<label>*매입 단가</label><input id="purchase-price" type="number"placeholder="숫자만 입력" style="background-color: #E6F2FF">
		<label>*매출 단가</label><input id="sales-price" type="number" placeholder="숫자만 입력" style="background-color: #E6F2FF"><br>
		<label>시작일</label><input id="start-date" type="date" style="background-color: #FFFFCC">
		<label>종료일</label><input id="end-date" type="date" style="background-color: #FFFFCC">
		<label>비고</label><input id="memo">
		<label>*등록/수정자</label><input id="reg-user" placeholder="필수 입력 정보" style="background-color: #E6F2FF">
		<label>등록/수정일자</label><input id="reg-date" readonly style="background-color: #D9D9D9"><br>
		<br>
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

	// 숫자 형식 변환
	function formatNumber(number) {
		return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	// 원래 숫자 형식으로 되돌리기
	function defaultNumber(numberString) {
		  return numberString.replace(/,/g, '');
	}

	
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
		          '<td style="background-color: #D9D9D9">' + item.whCode	 + '</td>' +
		          '<td style="background-color: #D9D9D9">' + item.companyCode	 + '</td>' +
		          '<td style="background-color: #D9D9D9">' + item.itemType + '</td>' +
		          '<td style="background-color: #D9D9D9">' + item.itemCode + '</td>' +
		          '<td style="background-color: #D9D9D9">' + item.itemName + '</td>' +
		          '<td style="background-color: #E6F2FF">' + formatNumber(item.purchasePrice) + '</td>' +
		          '<td style="background-color: #E6F2FF">' + formatNumber(item.salesPrice) + '</td>' +
		          '<td style="background-color: #FFFFCC">' + item.startDate.substring(0, 10) + '</td>' +
		          '<td style="background-color: #FFFFCC">' + item.endDate.substring(0, 10) + '</td>' +
		          '<td style="background-color: #D9D9D9">' + item.stockUnit + '</td>' +
		          '<td>' + item.memo + '</td>' +
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
		$('#purchase-price').val(defaultNumber(purchasePrice));
		$('#sales-price').val(defaultNumber(salesPrice));
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