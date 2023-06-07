<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="container">
	<c:forEach var="main" items="${mainPageMap.mainPageDtoList}">
		<input type="hidden" class="product-type" value="${main.productType}">
		<input type="hidden" class="work-order-count" value="${main.workOrderCount}">
	</c:forEach>
	
	<c:forEach var="orders" items="${mainPageMap.orders}">
		<input type="hidden" class="receive-or-place" value="${orders.receiveOrPlace}">
		<input type="hidden" class="orders-count" value="${orders.orderCount}">
	</c:forEach>
	
	<div class="content">
		<h2>안녕하세요 ${mainPageMap.memberDto.memberName}님! 좋은 하루 되세요!</h2>
		<div class="info">
			<div class="loss-table-div">
			<h3>LOSS 물품 현황</h3>
			<table class="loss-table">
				<tr>
					<th>작업 지시 코드 </th>
					<th>등록 순번 </th>
					<th>물품 코드 </th>
					<th>LOSS 수량 </th>
					<th>판별 일자 </th>
					<th>등록 근무자</th>
					<th>등록 일</th>
				</tr>
				<c:forEach var="loss" items="${mainPageMap.loss}">
				<tr class="loss-list">
					<td class="work-order-code">${loss.workOrderCode}</td>
					<td class="sorder">${loss.sorder}</td>
					<td class="item-code">${loss.itemCode}</td>
					<td class="defective-loss-quantity">${loss.defectiveLossQuantity}</td>
					<td class="defective-loss-date">${loss.defectiveLossDate}</td>
					<td class="reg-user">${loss.regUser}</td>
					<td class="reg-date">${loss.regDate}</td>
				</tr>
				</c:forEach>
			</table>
			</div>
		</div>
		<div class="chart-area">
		
			<div id="chartContainer" style="width: 40%; height: 50%; display: block; margin: 0 auto;">
			<h4>금일 작업 지시 현황</h4>
				<!--차트가 그려질 부분-->
				<canvas id="myChart" style="display: block; margin: 0 auto;"></canvas>
			</div>
			
			<div id="bar-chart-container" style="width: 40%; min-height: 50%; display: block; margin: 0 auto;">
			<h4>금일 수발주 건 수</h4>
				<canvas id="my-bar-chart" style=" display: block; margin: 0 auto;"></canvas>
			</div>
		</div>
	</div>
</div>