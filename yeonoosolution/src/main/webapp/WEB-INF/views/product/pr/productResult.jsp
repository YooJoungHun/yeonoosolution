<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="container">
	<div class="wo-header">
		<div class="wo-header-actions">
			<button type="button" class="select-item">조회</button>
			<button type="button" class="reset-search">초기화</button>
			<button type="button" class="start-item">작업시작</button>
			<button type="button" class="end-item">작업종료</button>
			<button type="button" class="good-item" data-good="Y">양품등록</button>
			<button type="button" class="bad-item" data-good="N">불량등록</button>
			<button type="button" class="loss-item" data-good="L">LOSS등록</button>
			<button type="button" class="cancel-item">실적 취소</button>
		</div>
		<div class="wo-values-container">
			<div class="wo-header-value">
				<div class="wo-header-item-group">
					<label for="workOrderCode">
						지시번호
					</label>
					<input type="text" name="workOrderCode">
				</div>
				<div class="wo-header-item-group">
					<label for="startDate">
						시작시간
						<button class="reset-input" type="button">
							<svg viewBox="0 0 512 512">
								<path/>
							</svg>
						</button>
					</label>
					<input type="datetime-local" name="startDate">
				</div>
				<div class="wo-header-item-group">
					<label for="endDate">
						종료시간
						<button class="reset-input" type="button">
							<svg viewBox="0 0 512 512">
								<path/>
							</svg>
						</button>
					</label>
					<input type="datetime-local" name="endDate">
				</div>
				<div class="wo-header-item-group">
					<label for="worker.memberUid">작업자코드</label>
					<input type="text" name="worker.memberUid" list="memberUidList">
					<datalist id="memberUidList">
						<c:forEach var="member" items="${memberList }">
							<option value="${member.memberUid }">
								${member.memberName } ${member.memberRole }
							</option>
						</c:forEach>
					</datalist>
				</div>
				<div class="wo-header-item-group">
					<label for="worker.memberName">작업자명</label>
					<input type="text" name="worker.memberName" disabled>
				</div>
				<div class="wo-header-item-group">
					<label for="workOrderQuantity">작업수량</label>
					<input type="number" name="workOrderQuantity" min="1">
				</div>
			</div>
		</div>
	</div>
	<div class="wo-content">
		<div class="wo-list-header">
			<div class="wo-list-header-left">
				작업지시목록
			</div>
			<div class="wo-list-header-right">
				<!-- <input type="number" class="add-quantity" value="1" min="1">
				<button type="button" class="add-item">추가</button>
				<button type="button" class="remove-item">제거</button> -->
				<!-- <button type="button" class="setting">설정</button> -->
			</div>
		</div>
		<div class="wo-list-content">
			<table class="data-table" role="wo-list">
				<colgroup>
					<col style="width: 50px;">
					<col style="width: 50px;">
				</colgroup>
				<tbody>
				<c:forEach var="wo" items="${woList }" varStatus="status">
					<tr>
						<th class="numbering"><div>${status.count }</div></th>
						<th class="radio"><div></div></th>
						<td class="readonly" role="workOrderDate"><fmt:formatDate value="${wo.workOrderDate }" pattern="yyyy-MM-dd"/></td>
						<td class="readonly" role="workOrderCode">${wo.workOrderCode }</td>
						<td class="readonly" role="item.itemCode">${wo.item.itemCode }</td>
						<td class="readonly" role="item.itemName">${wo.item.itemName }</td>
						<td class="readonly" role="itemQuantity">${wo.itemQuantity }</td>
						<td class="editable" role="startDate"><input type="date" name="startDate" value="<fmt:formatDate value="${wo.startDate }" pattern="yyyy-MM-dd"/>"></td>
						<td class="editable" role="endDate"><input type="date" name="endDate" value="<fmt:formatDate value="${wo.endDate }" pattern="yyyy-MM-dd"/>"></td>
						<td class="readonly" role="goodQuantity">${wo.goodQuantity }</td>
						<td class="readonly" role="badQuantity">${wo.badQuantity }</td>
						<td class="readonly" role="wh.whName">${wo.wh.whName }</td>
					</tr>
				</c:forEach>
				</tbody>
				<thead>
					<tr>
						<th><div></div></th>
						<th><div></div></th>
						<td><div>지시일</div></td>
						<td><div>지시번호</div></td>
						<td><div>ITEM코드</div></td>
						<td><div>품명</div></td>
						<td><div>지시수량</div></td>
						<td><div>시작시간</div></td>
						<td><div>종료시간</div></td>
						<td><div>양품실적</div></td>
						<td><div>불량실적</div></td>
						<td><div>입고창고</div></td>
					</tr>
				</thead>
			</table>
		</div>
		<div class="wo-list-header">
			<div class="wo-list-header-left">
				작업지시상세
			</div>
			<div class="wo-list-header-right">
				<!-- <input type="number" class="add-quantity" value="1" min="1">
				<button type="button" class="add-item">추가</button>
				<button type="button" class="remove-item">제거</button> -->
				<!-- <button type="button" class="setting">설정</button> -->
			</div>
		</div>
		<div class="wo-list-content">
			<table class="data-table" role="wo-detail">
				<colgroup>
					<col style="width: 50px;">
					<col style="width: 50px;">
					<col style="width: 60px;">
					<col style="width: 100px;">
					<col style="width: 120px;">
					<col style="width: 60px;">
				</colgroup>
				<tbody>
					
				</tbody>
				<thead>
					<tr>
						<th><div></div></th>
						<th>
							<div>
								<input type="checkbox">
							</div>
						</th>
						<td><div>작업순번</div></td>
						<td><div>수량</div></td>
						<td><div>작업자</div></td>
						<td><div>양품여부</div></td>
					</tr>
				</thead>
			</table>
		</div>
		<div class="wo-list-header">
			<div class="wo-list-header-left">
				투입내역
			</div>
			<div class="wo-list-header-right">
				<!-- <input type="number" class="add-quantity" value="1" min="1">
				<button type="button" class="add-item">추가</button>
				<button type="button" class="remove-item">제거</button> -->
				<!-- <button type="button" class="setting">설정</button> -->
			</div>
		</div>
		<div class="wo-list-content">
			<table class="data-table" role="wo-bom">
				<colgroup>
					<col style="width: 50px;">
					<col style="width: 50px;">
					<col style="width: 140px;">
					<col style="width: 290px;">
					<col style="width: 140px;">
					<col style="width: 110px;">
				</colgroup>
				<tbody>
					
				</tbody>
				<thead>
					<tr>
						<th><div></div></th>
						<th>
							<div>
								<input type="checkbox">
							</div>
						</th>
						<td><div>ITEM코드</div></td>
						<td><div>품명</div></td>
						<td><div>자재창고</div></td>
						<td><div>수량</div></td>
					</tr>
				</thead>
			</table>
		</div>
	</div>
</div>