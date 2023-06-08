<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<div class="input-info">
		<span style="font-weight: bold;">BOM 정보 입력</span> 
		<br>
		<br>
		<label>*완제품 코드</label><input placeholder="더블 클릭 하여 선택" id="high-item-code" readonly style="background-color: #FFFFCC">
		<label>*반/원자재 코드</label><input placeholder="더블 클릭 하여 선택" id="low-item-code" readonly style="background-color: #FFFFCC">
		<label>*소요량</label><input placeholder="필수 입력 정보" id="material-quantity" type="number" style="background-color: #E6F2FF">
		<span style="font-size: 11px; color: gray;">(*)입력 필수 </span><br>
		<div class="btn-group1">
			<button class="btn-group2" id="bom-insert">BOM 등록</button>
			<button class="btn-group2" id="reset-btn">초기화</button>
		</div>
	</div>
		
	<span id="product-item-span" style="font-weight: bold;">완제품 목록</span> 
	<span id="bom-tree-span" style="font-weight: bold;">Bom Tree</span>
	<button class="btn-group2" id="semi-product-delete">삭제</button> 
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
		
		<br>
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