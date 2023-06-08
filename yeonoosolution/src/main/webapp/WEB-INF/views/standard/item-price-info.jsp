<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<div class="input-info">
		<span style="font-weight: bold;">제품 단가 입력</span> <br>
		<br>
		<label>거래처 코드</label><input id="company-code" readonly style="background-color: #D9D9D9">
		<label>제품 코드</label><input id="item-code" readonly style="background-color: #D9D9D9">
		<label>품명</label><input id="item-name" readonly style="background-color: #D9D9D9">
		<label>*매입 단가</label><input id="purchase-price" type="number"placeholder="숫자만 입력" style="background-color: #E6F2FF">
		<label>*매출 단가</label><input id="sales-price" type="number" placeholder="숫자만 입력" style="background-color: #E6F2FF"><br>
		<label>시작일</label><input id="start-date" type="date" style="background-color: #FFFFCC">
		<label>종료일</label><input id="end-date" type="date" style="background-color: #FFFFCC">
		<label>비고</label><input id="memo">
		<label>*등록/수정자</label><input id="reg-user" placeholder="필수 입력 정보" style="background-color: #E6F2FF">
		<label>등록/수정일자</label><input id="reg-date" readonly style="background-color: #D9D9D9">
		<span style="font-size: 11px; color: gray;">(*)입력 필수 </span><br>
		<div class="btn-group1">
			<input type="text" id="search-input" placeholder="제품명 검색"><button id="search-btn">검색</button>
			<button id="item-update">단가 등록/수정</button>
			<button id="reset-btn">초기화</button>
		</div>
	</div>
	
	
	<div class="main-content">
		<table id="content-table">
			<thead>
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
			</thead>
			<tbody></tbody>		
		</table>
	</div>