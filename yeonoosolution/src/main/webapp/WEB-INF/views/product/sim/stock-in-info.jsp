<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/product/sim/preset.jsp" %>

<section class="content-header">
	<div class="stock-in-list">
		<div class="stock-in-item">
			<input id="updateDate" name="updateDate" type="date" hidden="1">
			<input id="updateUser" name="updateUser" type="text" hidden="1">
			<div class="item-title"><label for="inCode">입고 번호</label></div>
			<div class="item-content"><input id="inCode" name="inCode" placeholder="입고 번호" class="form-control"></div>
		</div>
		<div class="stock-in-item">
			<div class="item-title"><label for="orderCode">발주 번호</label></div>
			<div class="item-content"><input id="orderCode" name="orderCode" placeholder="발주 번호" class="form-control"></div>
		</div>
		<div class="stock-in-item">
			<div class="item-title"><label for="inDate">입고일</label></div>
			<div class="item-content"><input id="inDate" name="inDate" type="date" class="form-control"></div>
		</div>
	</div>

	<div class="stock-in-list">
		<div class="stock-in-item">
			<div class="item-title"><label for="customerCode">거래처 번호</label></div>
			<div class="item-content"><input id="customerCode" name="customerCode" placeholder="거래처 번호" class="form-control"></div>
		</div>
		<div class="stock-in-item">
			<div class="item-title"><label for="companyName">거래처명</label></div>
			<div class="item-content"><input id="companyName" placeholder="거래처명" class="form-control"></div>
		</div>
		<div class="stock-in-item">
			<div class="item-title"><label for="orderType">입고 유형</label></div>
			<div class="item-content">
				<input type="hidden" name="inType" id="inType">
				<select id="orderType" name="orderType" onchange="orderTypeEvent(this)" class="form-control">
					<option value="">선택</option>
					<option value="1">구매입고</option>
					<option value="2">기타입고</option>
				</select>
			</div>
		</div>
	</div>

	<div class="stock-in-list">
		<div class="stock-in-item">
			<div class="item-title"><label for="regUser">등록자</label></div>
			<div class="item-content"><input id="regUser" name="regUser" placeholder="등록자" class="form-control"></div>
		</div>
		<div class="stock-in-item">
			<div class="item-title"><label for="regDate">등록일</label></div>
			<div class="item-content"><input id="regDate" name="regDate" type="date" class="form-control"></div>
		</div>
		<div class="stock-in-item">
			<div class="item-title"><label for="memo">비고</label></div>
			<div class="item-content"><input id="memo" name="memo" placeholder="비고" class="form-control"></div>
		</div>
	</div>
	
</section>
	
	
	
	
<section class="content-body">
	<div class="content-btn">
		<button onclick="btnEvent('find')">조회</button>
		<button onclick="btnEvent('update')">저장</button>
		<button onclick="btnEvent('delete')">삭제</button>
		<button onclick="btnEvent('fix')">확정</button>
		<button onclick="btnEvent('cancel')">확정 취소</button>
		<button onclick="resetEvent()">초기화</button>
	</div>
	<div class="stock-in-table">
		<table class="table-in table-content">
			<thead>
				<tr>
					<th><div class="item-title">No.</div></th>
					<th><div class="item-title"><input type="checkbox" class="allCheck" onclick="$('.checkBox').prop('checked', this.checked ? true : false);"></div></th>
					<th><div class="item-title"><label for="inType">입고 상태</label></div></th>
					<th><div class="item-title"><label for="orderType">입고 유형</label></div></th>
					<th><div class="item-title"><label for="inDate">입고일</label></div></th>
					<th><div class="item-title"><label for="inCode">입고 번호</label></div></th>
					<th><div class="item-title"><label for="inCode">발주 번호</label></div></th>
					<th><div class="item-title"><label for="customerCode">거래처 번호</label></div></th>
					<th><div class="item-title"><label for="companyName">거래처명</label></div></th>
					<th><div class="item-title"><label for="regUser">등록자</label></div></th>
					<th><div class="item-title"><label for="regDate">등록일</label></div></th>
					<th><div class="item-title"><label for="updateUser">수정자</label></div></th>
					<th><div class="item-title"><label for="updateDate">수정일</label></div></th>
					<th><div class="item-title"><label for="memo">비고</label></div></th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach var="stIn" items="${stInList}" varStatus="status">
					<tr class="stInRow row${status.index} ${stIn.inType == '확정'? 'selected' : ''}">
						<td><input type="text" value="${status.index+1}"></td>
						<td><input class="checkBox" type="checkbox"></td>
						<td class="read"><input type="text" disabled="disabled" class="inType" value="${stIn.inType}" readonly="readonly"></td>
						<td class="read"><input type="text" disabled="disabled" class="orderType" value="${stIn.orderCode != null? '구매입고':'기타입고'}" readonly="readonly"></td>
						<td class="edit"><input type="text" disabled="disabled" class="inDate" value="${stIn.inDate}"></td>
						<td class="requ"><input type="text" disabled="disabled" class="inCode" value="${stIn.inCode}"></td>
						<td class="read"><input type="text" disabled="disabled" class="orderCode" value="${stIn.orderCode}"></td>
						<td class="edit"><input type="text" disabled="disabled" class="customerCode" value="${stIn.customerCode}"></td>
						<td class="edit"><input type="text" disabled="disabled" class="companyName" value="${stIn.companyDto.companyName}"></td>
						<td class="read"><input type="text" disabled="disabled" class="regUser" value="${stIn.regUser}"></td>
						<td class="read"><input type="text" disabled="disabled" class="regDate" value=<fmt:formatDate value="${stIn.regDate}" pattern="yyyy/MM/dd"/>></td>
						<td class="read"><input type="text" disabled="disabled" class="updateUser" value="${stIn.updateUser}"></td>
						<td class="read"><input type="text" disabled="disabled" class="updateDate" value=<fmt:formatDate value="${stIn.updateDate}" pattern="yyyy/MM/dd"/>></td>
						<td class="edit"><input type="text" disabled="disabled" class="memo" value="${stIn.memo}"></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</section>




<section class="content-footer">
	<div class="stock-in-detail-table">
		<table class="table-in-detail table-content">
			<thead>
				<tr>
					<th><div class="item-title">순번</div></th>
					<th><div class="item-title"><input type="checkbox" class="allCheck" onclick="$('.sidCheckBox').prop('checked', this.checked ? true : false);"></div></th>
					<th><div class="item-title">입고 번호</div></th>
					<th><div class="item-title">창고 코드</div></th>
					<th><div class="item-title">아이템 코드</div></th>
					<th><div class="item-title">수량</div></th>
					<th><div class="item-title">가격</div></th>
					<th><div class="item-title">창고이름</div></th>
					<th><div class="item-title">비고</div></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="stIn" items="${stInList}" varStatus="status">
				<c:forEach var="sid" items="${stIn.stInDetailDto}">
					<tr class="stInDetailRow ${stIn.inType == '확정'? 'selected' : ''}">
						<td><input type="text" disabled="disabled" class="sidSorder" name="sorder" value="${sid.sorder}" readonly="readonly"></td>
						<td><input type="checkbox" class="sidCheckBox"></td>
						<td class="requ"><input type="text" disabled="disabled" class="inCode" name="inCode" value="${stIn.inCode}" readonly="readonly"></td>
						<td class="read"><input type="text" disabled="disabled" class="sidWhCode" name="whCode" value="${sid.whCode}"></td>
						<td class="read"><input type="text" disabled="disabled" class="sidItemCode" name="itemCode" value="${sid.itemCode}"></td>
						<td class="read"><input type="number" disabled="disabled" class="sidInQuantity" name="inQuantity" value="${sid.inQuantity}" min="1"></td>
						<td class="read"><input type="text" disabled="disabled" class="sidInPrice" name="inPrice" value="${sid.inPrice}"></td>
						<td class="read"><input type="text" disabled="disabled" class="sidWhDtoWhName" name="whName" value="${sid.whDto.whName}"></td>
						<td class="edit"><input type="text" disabled="disabled" class="sidMemo" name="memo" value="${sid.memo}"></td>
					</tr>
				</c:forEach>
				</c:forEach>
			</tbody>
		</table>
		
	</div>
</section>