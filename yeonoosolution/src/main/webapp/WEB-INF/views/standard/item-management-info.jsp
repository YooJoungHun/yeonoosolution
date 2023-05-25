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
		            <li><a href="#">품목 관리 및 등록</a></li>
		            <li><a href="#">품목 단가 관리</a></li>
		            <li><a href="#">창고 관리 정보</a></li>
		            <li><a href="#">생산 관리 BOM 등록</a></li>
		        </ul>
		    </li>
		</ul>
	</div>
	
	
	<div class="input-info">
		<div class="btn-group1">
			<button id="search-btn">조회</button> 
			<button id="save-btn">저장</button> 
			<button id="delete-btn">삭제</button> 
			<button id="reset-btn">초기화</button>
		</div>
		
		필수 입력 정보 <br>
		<span id="item-code">제품 코드</span><input value="자동 생성" readonly>
		<span id="item-name">품명</span><input>
		<span id="item-type">구분</span><select class="item-type-select">
											<option value="완제품">완제품</option>
											<option value="반제품">반제품</option>
											<option value="원자재">원자재</option>
										</select>
		<span id="stock-unit">재고 단위</span><input><br>
		<span id="reg-user">등록/수정자</span><input>
		<span id="reg-date">등록/수정일자</span><input readonly>
		
		
		<div class="btn-group2">
			<span>제품 등록</span>
			<button id="addColumn">+</button>
			<button id="deleteColumn">-</button>
		</div>
		
	</div>
	
	
	
	<div class="main-content">
		<table id="content-table">
			<tr>
				<th> </th>
				<th> </th>
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

</body>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>

	 $(document).ready(function () {
		defaultItemList();
		getNow();
		$(document).on('dblclick', '#content-table input[type="text"], #content-table input[type="date"], #content-table select', function () {
			$(this).prop('disabled', false); // 수정 가능하도록 설정
		});
	});
	
	
	// 현재 날짜를 가져오기
	function getNow() {
		let today = new Date();
		// 날짜를 yyyy/mm/dd 형식으로 변환
		let year = today.getFullYear();
		let month = String(today.getMonth() + 1).padStart(2, '0');
		let day = String(today.getDate()).padStart(2, '0');
		// 등록/수정일자 input에 오늘 날짜 설정
		$('#reg-date + input').val(year + '/' + month + '/' + day);
	};
	

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
		          '<td><input type="text" value="' + item.itemCode + '" disabled readonly></td>' +
		          '<td><input type="text" value="' + item.itemName + '" disabled></td>' +
		          '<td><select class="item-type-select" disabled>' +
		          '<option value="완제품" ' + (item.itemType === '완제품' ? 'selected' : '') + '>완제품</option>' +
		          '<option value="반제품" ' + (item.itemType === '반제품' ? 'selected' : '') + '>반제품</option>' +
		          '<option value="원자재" ' + (item.itemType === '원자재' ? 'selected' : '') + '>원자재</option>' +
		          '</select></td>' + 
		          '<td><input type="text" value="' + item.stockUnit + '" disabled></td>' +
		          '<td><input type="text" value="' + item.memo + '" disabled></td>' +
		          '<td><input type="date" value="' + item.startDate.substring(0, 10) + '" disabled></td>' +
		          '<td><input type="date" value="' + item.endDate.substring(0, 10) + '" disabled></td>' +
		          '<td><input type="text" value="' + item.regUser + '" disabled readonly></td>' +
		          '<td><input type="date" value="' + item.regDate.substring(0, 10) + '" disabled readonly></td>' +
		          '<td><input type="text" value="' + item.updateUser + '" disabled readonly></td>' +
		          '<td><input type="date" value="' + item.updateDate.substring(0, 10) + '" disabled readonly></td>' +
		          '</tr>';
		        table.append(row);
		      }
		    },
		    error: function(xhr, status, error) {
		      console.log('Error:', error);
		    }
		});
	}
	
	
	function updateInputFields(selectedRow) {
		let itemCode = selectedRow.find('td:eq(2) input').val();
		let itemName = selectedRow.find('td:eq(3) input').val();
		let itemType = selectedRow.find('td:eq(4) select').val();
		let stockUnit = selectedRow.find('td:eq(5) input').val();
		let regUser = selectedRow.find('td:eq(9) input').val();

		$('#item-code + input').val(itemCode);
		$('#item-name + input').val(itemName);
		$('#item-type-select').val(itemType);
		$('#stock-unit + input').val(stockUnit);
		$('#reg-user + input').val(regUser);
		
		let radioInput = selectedRow.find('td:eq(1) input[type="radio"]');
		radioInput.prop('checked', true);
	}
	
	
	$(document).on('click', '#content-table input[type="radio"]', function () {
		let selectedRow = $(this).closest('tr');
		updateInputFields(selectedRow);
	});
	
	$(document).on('input', '#item-code + input', function () {
		let selectedRow = $('#content-table tr input[type="radio"]:checked').closest('tr');
		selectedRow.find('td:eq(2) input').val($(this).val());
	});

	$(document).on('input', '#item-name + input', function () {
		let selectedRow = $('#content-table tr input[type="radio"]:checked').closest('tr');
		selectedRow.find('td:eq(3) input').val($(this).val());
	});
	
	$(document).on('change', '#item-type-select', function () {
		let selectedRow = $('#content-table tr input[type="radio"]:checked').closest('tr');
		selectedRow.find('td:eq(4) select').val($(this).val());
		
		let itemType = $(this).val();
		$('#item-type-select').val(itemType);
	});
	
	$(document).on('input', '#stock-unit + input', function () {
		let selectedRow = $('#content-table tr input[type="radio"]:checked').closest('tr');
		selectedRow.find('td:eq(5) input').val($(this).val());
	});
	
	$(document).on('input', '#reg-user + input', function () {
		let selectedRow = $('#content-table tr input[type="radio"]:checked').closest('tr');
		selectedRow.find('td:eq(9) input').val($(this).val());
	});

	
	
	$(document).on('click', '#addColumn', function(){
  		let table = document.getElementById("content-table");
	    let rowCount = table.rows.length;
	    let row = document.createElement("tr");
	
	    let cellNumber = document.createElement("td");
	    let cellText = document.createTextNode(rowCount);
	    cellNumber.appendChild(cellText);
	    row.appendChild(cellNumber);
	    
	    let cellRadio = document.createElement("td");
	    let radioInput = document.createElement("input");
	    radioInput.type = "radio";
	    radioInput.name = "row";
	    cellRadio.appendChild(radioInput);
	    row.appendChild(cellRadio);
	
	 // 칼럼 수 만큼 input 추가
	    let columnCount = 11;
	    for (var i = 0; i < columnCount; i++) {
	      let cell = document.createElement("td");
	      let cellText = document.createTextNode("");
	      cell.appendChild(cellText);
	      row.appendChild(cell);
	    }
	    table.appendChild(row);
	 });
	
	
	$(document).on('click', '#deleteColumn', function(){
		let rowCount = table.rows.length;
	    if (rowCount > 1) {
	    	let selectedRadio = document.querySelector('input[name="row"]:checked'); 
	    	if (selectedRadio){
	    		let selectedRow = selectedRadio.parentNode.parentNode;
	    		table.removeChild(selectedRow);
	    	} else {
	      		table.deleteRow(rowCount - 1);
	    	}
	    } 
	    updateRowNumbers()
	});
	
	
	$(document).on('click', '#search-btn', function(){
			
	});
	
	
	function updateRowNumbers(){
	    let rows = table.getElementsByTagName("tr");
	    for (var i = 1; i < rows.length; i++) {
	      	let row = rows[i];
	      	let numberCell = row.cells[0];
	      	numberCell.textContent = i;
	    }
	}  
	

</script>
</html>