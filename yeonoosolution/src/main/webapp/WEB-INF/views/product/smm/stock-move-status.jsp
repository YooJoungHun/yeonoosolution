<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="container">
	<div class="buttons">
		<button id="searchBtn">조회</button>
		<button id="resetBtn">초기화</button>
	</div>
	<hr>
	<h4>이동현황</h4>
	
	<div class="label-group">
		<label for="searchInput">통합 검색</label>
		<input id="searchInput" type="text" placeholder="">
	</div>
	
	<div class="label-group">
		<label for="searchDateStart">이동 시작일</label>
		<input id="searchDateStart" type="text" placeholder="연도-월-일">
	</div>
	
	<div class="label-group">
		<label for="searchDateEnd">이동 종료일</label>
		<input id="searchDateEnd" type="text" placeholder="연도-월-일">
	</div>
	
	<div class="divTable">
		<table id="stockMove">
			<thead>
				<tr>
					<th class="moveCount">No.</th>
					<th>이동번호</th>
					<th>이동일자</th>
					<th>제품코드</th>
					<th>품명</th>
					<th>재고수량</th>
					<th>출고창고</th>
					<th>입고창고</th>
					<th>이동수량</th>
					<th>상태</th>
					<th>비고</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="move" items="${stockMoveStatus}" varStatus="status">
					<tr>
						<td class="moveCount">${status.count }</td>
						<td class="moveCode">${move.moveCode }</td> <!-- 이동번호 -->
						<td class="moveDate">${move.moveDate }</td> <!-- 이동일자 -->
						<td class="itemCode">${move.itemCode }</td>
						<td class="itemName">${move.itemName }</td>
						<td class="stockQuantity">${move.stockQuantity }</td>
						<td class="whCodeOut">${move.whCodeOut }</td>
						<td class="whCodeIn">${move.whCodeIn}</td>
						<td class="moveQuantity">${move.moveQuantity }</td>
						<td class="moveType">${move.moveType }</td>
						<td class="memo">${move.memo }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>