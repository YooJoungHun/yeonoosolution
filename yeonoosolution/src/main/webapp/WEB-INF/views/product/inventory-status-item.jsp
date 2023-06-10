<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="container">
	<div class="content">
		<div class="input-div">
			<h2>품목별 재고 현황</h2>
			<div>
				<label>품목 구분</label>
					<select class="itemType">
						<option selected disabled>---- 품목을 선택하세요 ----</option>
						<option>완제품</option>
						<option>반제품</option>
						<option>원자재</option>
					</select>

					<label>품명</label>
					<input class="itemName" type="text">
					<input type="button" class="btn btn-search" value="조회">
			</div>
		</div>
		
		<div class="wh-stock-detail-list">
			<table class="whStockDetail">
				<tr>
					<th>품명</th>
					<th>제품 코드</th>
					<th>창고 코드</th>
					<th>양품 수량</th>
					<th>불량 수량</th>
					<th>저장 단위</th>
					<th>입고 근무자</th>
					<th id="memo">비고</th>
				</tr>
			</table>
		</div>	
	</div>
	<br>
</div>