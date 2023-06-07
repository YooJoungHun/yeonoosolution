<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="container">
	<div class="wo-header">
		<div class="wo-header-actions">
			<button type="button" class="select-item">조회</button>
			<button type="button" class="reset-search">초기화</button>
			<button type="button" class="confirm-item">작업지시 마감</button>
		</div>
		<div class="wo-values-container">
			<div class="wo-header-search">
				<div class="wo-header-item-group">
					<label for="startDate">
						조회시작일
						<button class="reset-input" type="button">
							<svg viewBox="0 0 512 512">
								<path/>
							</svg>
						</button>
					</label>
					<input type="date" name="startDate">
				</div>
				<div class="wo-header-item-group">
					<label for="endDate">
						조회종료일
						<button class="reset-input" type="button">
							<svg viewBox="0 0 512 512">
								<path/>
							</svg>
						</button>
					</label>
					<input type="date" name="endDate">
				</div>
				<div class="wo-header-item-group">
					<label for="workOrderCode">작업지시번호</label>
					<input type="text" name="workOrderCode">
				</div>
				<div class="wo-header-item-group">
					<label for="item.itemName">생산품명</label>
					<input type="text" name="item.itemName">
				</div>
			</div>
		</div>
	</div>
	<div class="wo-content">
		<div class="wo-list-header">
			<div class="wo-list-header-left">
				작업지시현황
			</div>
			<div class="wo-list-header-right">
				<!-- <button type="button" class="setting">설정</button> -->
			</div>
		</div>
		<div class="wo-list-content">
			<table class="data-table">
				<colgroup>
					<col style="width: 50px;">
					<col style="width: 50px;">
					<col style="width: 64px;">
					<col style="width: 98px;">
					<col style="width: 121px;">
					<col style="width: 305px;">
					<col style="width: 165px;">
					<col style="width: 95px;">
					<col style="width: 94px;">
					<col style="width: 142px;">
					<col style="width: 145px;">
				</colgroup>
				<tbody>
				<c:forEach var="wo" items="${woList }" varStatus="status">
					<tr>
						<th class="numbering">
							<div>
								${status.count }
							</div>
						</th>
						<th class="checkbox">
							<div>
								<input type="checkbox">
							</div>
						</th>
						<td class="readonly" role="workStatus">${wo.workStatus }</td>
						<td class="readonly" role="workOrderDate"><fmt:formatDate value="${wo.workOrderDate }" pattern="yyyy-MM-dd"/></td>
						<td class="readonly" role="workOrderCode">${wo.workOrderCode }</td>
						<td class="readonly" role="item.itemName">${wo.item.itemName }</td>
						<td class="readonly" role="item.itemCode">${wo.item.itemCode }</td>
						<td class="readonly" role="itemQuantity">${wo.itemQuantity }</td>
						<td class="readonly" role="workedQuantity">${wo.workedQuantity }</td>
						<td class="readonly" role="startDate"><fmt:formatDate value="${wo.startDate }" pattern="yyyy-MM-dd HH:mm"/></td>
						<td class="readonly" role="endDate"><fmt:formatDate value="${wo.endDate }" pattern="yyyy-MM-dd HH:mm"/></td>
					</tr>
				</c:forEach>
				</tbody>
				<thead>
					<tr>
						<th><div></div></th>
						<th>
							<div>
								<input type="checkbox">
							</div>
						</th>
						<td><div>상태</div></td>
						<td><div>지시일</div></td>
						<td><div>지시번호</div></td>
						<td><div>생산품명</div></td>
						<td><div>생산품목코드</div></td>
						<td><div>지시수량</div></td>
						<td><div>생산수량</div></td>
						<td><div>작업시작</div></td>
						<td><div>작업종료</div></td>
					</tr>
				</thead>
			</table>
		</div>
	</div>
</div>