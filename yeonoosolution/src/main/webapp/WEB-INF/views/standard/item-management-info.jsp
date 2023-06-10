<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
										</select><br>
		<label>단위</label><input id="stock-unit" style="background-color: #E6F2FF">
		<label>비고</label><input id="memo">
		<label>*시작일</label><input id="start-date" type="date" style="background-color: #FFFFCC">
		<label>*종료일</label><input id="end-date" type="date" style="background-color: #FFFFCC">
		<label>*등록/수정자</label><input id="reg-user" placeholder="필수 입력 정보" style="background-color: #E6F2FF">
		<label>등록/수정일자</label><input id="reg-date" readonly style="background-color: #D9D9D9"> <span style="font-size: 11px; color: gray;">(*)입력 필수 </span>
		<br>
		<div class="btn-group1">
			<input type="text" id="search-input" placeholder="제품명 검색"><button id="search-btn">검색</button>
			<button id="item-insert">제품 등록</button>
			<button id="item-update" data-action="update">수정 완료</button>
			<button id="item-delete" data-action="delete">삭제</button> 
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
			</thead>
			<tbody></tbody>			
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