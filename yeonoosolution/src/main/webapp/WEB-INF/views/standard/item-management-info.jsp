<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">

	table {
	  width: 100%;
	  border-collapse: collapse;
	}
	
	th, td {
	  padding: 8px;
	  text-align: left;
	  border-bottom: 1px solid #ddd;
	}
	
	th {
	  background-color: #f2f2f2;
	  font-weight: bold;
	}
	
	tr:hover {
	  background-color: #f5f5f5;
	}
	
	input[type="checkbox"] {
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
	
	
	<div class="btn-group1">
		<button id="search-btn">조회</button> 
		<button id="save-btn">저장</button> 
		<button id="delete-btn">삭제</button> 
		<button id="reset-btn">초기화</button>
	</div>
	
	ipi
	<div>제품 등록<br>
		<span id="item-code">제품 코드</span><input>
		<span id="item-name">품명</span><input>
		<span id="wh-code">창고 코드</span><input>
		<span id="company-code">거래처 코드</span><input>
		<span id="item-type">구분</span><select class="item-type-select">
											<option>완제품</option>
											<option>반제품</option>
											<option>원자재</option>
										</select>
		<span id="stock-unit">재고 단위</span><input>
		<span id="memo">비고</span><input><br>
		<span id="start-date">시작일</span><input type="date">
		<span id="end-date">종료일</span><input type="date">
		<span id="reg-user">등록자</span><input>
		<span id="reg-date">등록일자</span><input type="date">
	</div>
	
	
	<div class="btn-group2">
		<button onclick="addColumn()">+</button>
		<button onclick="deleteColumn()">-</button>
	</div>
	
	
	<div>
		<table id="content-table">
			<tr>
				<th> </th>
				<th> </th>
				<th>제품코드</th>
				<th>품명</th>
				<th>창고코드</th>
				<th>거래처코드</th>
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
<script>

	let table = document.getElementById("content-table");
	function addColumn() {
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
	
	    for (var i = 0; i < 13; i++) {
	      	let cell = document.createElement("td");
	      	row.appendChild(cell);
	    }
	    table.appendChild(row);
	  }
	
	function deleteColumn() {
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
	 }
	
	function updateRowNumbers() {
	    let rows = table.getElementsByTagName("tr");
	    for (var i = 1; i < rows.length; i++) {
	      	let row = rows[i];
	      	let numberCell = row.cells[0];
	      	numberCell.textContent = i;
	    }
	}

</script>
</html>