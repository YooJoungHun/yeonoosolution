<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="container">
	<div class="wo-header">
		<div class="wo-header-actions">
			<button type="button" class="select-item">조회</button>
			<button type="button" class="update-item">저장</button>
			<button type="button" class="remove-item">삭제</button>
			<button type="button" class="reset-search">초기화</button>
			<button type="button" class="confirm-item">작업지시 확정</button>
			<button type="button" class="cancel-item">확정 취소</button>
		</div>
		<div class="wo-values-container">
			<div class="wo-header-value">
				<div class="wo-header-item-group">
					<label for="productType">유형</label>
					<select name="productType">
						<option value="">--</option>
						<option value="일반">일반</option>
						<option value="재작업">재작업</option>
						<option value="개발품(시제품)">개발품(시제품)</option>
					</select>
				</div>
				<div class="wo-header-item-group">
					<label for="workOrderDate">
						지시일
						<button class="reset-input" type="button">
							<svg viewBox="0 0 512 512">
								<path/>
							</svg>
						</button>
					</label>
					<input type="date" name="workOrderDate">
				</div>
			</div>
			<hr/>
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
					<label for="workOrderCode">작업지시번호조회</label>
					<input type="text" name="workOrderCode">
				</div>
				<div class="wo-header-item-group">
					<label for="wh.whCode">창고</label>
					<input type="text" name="wh.whCode">
				</div>
				<div class="wo-header-item-group">
					<label for="whName">창고명</label>
					<input type="text" name="wh.whName">
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
				<input type="number" class="add-quantity" value="1" min="1">
				<button type="button" class="add-item">추가</button>
				<button type="button" class="remove-item">제거</button>
				<!-- <button type="button" class="setting">설정</button> -->
			</div>
		</div>
		<div class="wo-list-content">
			<table class="data-table">
				<colgroup>
					<col style="width: 50px;">
					<col style="width: 50px;">
					<col style="width: 80.77778px;">
					<col style="width: 49.77778px;">
					<col style="width: 60.77778px;">
					<col style="width: 109.77778px;">
					<col style="width: 104.77778px;">
					<col style="width: 154.77778px;">
					<col style="width: 121px;">
					<col style="width: 305.77778px;">
					<col style="width: 49.77778px;">
					<col style="width: 92.77778px;">
					<col style="width: 91.77778px;">
					<col style="width: 110.77778px;">
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
						<td class="readonly" role="workOrderCode">${wo.workOrderCode }</td>
						<td class="readonly" role="workStatus">${wo.workStatus }</td>
						<td class="required" role="productType">
							<select name="productType" style="width: 60px;">
								<option value="" ${wo.productType == null ? 'selected' : '' }>--</option>
								<option value="일반" ${wo.productType == '일반' ? 'selected' : '' }>일반</option>
								<option value="재작업" ${wo.productType == '재작업' ? 'selected' : '' }>재작업</option>
								<option value="개발품(시제품)" ${wo.productType == '개발품(시제품)' ? 'selected' : '' }>개발품(시제품)</option>
							</select>
						</td>
						<td class="editable" role="workOrderDate"><input type="date" name="workOrderDate" value="<fmt:formatDate value="${wo.workOrderDate }" pattern="yyyy-MM-dd"/>"></td>
						<td class="editable" role="finishDate"><input type="date" name="finishDate" value="<fmt:formatDate value="${wo.finishDate }" pattern="yyyy-MM-dd"/>"></td>
						<td class="editable" role="item.itemCode"><input type="text" name="item.itemCode" value="${wo.item.itemCode }"></td>
						<td class="readonly" role="item.itemType">${wo.item.itemType }</td>
						<td class="readonly" role="item.itemName">${wo.item.itemName }</td>
						<td class="required" role="itemQuantity"><input type="number" name="itemQuantity" value="${wo.itemQuantity }" min="1"></td>
						<td class="editable" role="wh.whCode"><input type="text" name="wh.whCode" value="${wo.wh.whCode }"></td>
						<td class="readonly" role="wh.whName">${wo.wh.whName }</td>
						<td class="readonly" role="workOrderType">${wo.workOrderType }</td>
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
						<td><div>지시번호</div></td>
						<td><div>상태</div></td>
						<td><div>유형</div></td>
						<td><div>지시일</div></td>
						<td><div>완료일</div></td>
						<td><div>ITEM코드</div></td>
						<td><div>품목유형</div></td>
						<td><div>품명</div></td>
						<td><div>수량</div></td>
						<td><div>창고</div></td>
						<td><div>창고명</div></td>
						<td><div>작업지시유형</div></td>
					</tr>
				</thead>
			</table>
		</div>
	</div>
</div>