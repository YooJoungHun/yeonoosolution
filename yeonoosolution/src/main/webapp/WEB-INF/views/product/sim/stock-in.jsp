<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/product/sim/preset.jsp" %>

<section class="content-header">
	<div class="stock-in-list">
		<div class="stock-in-item">

			<div class="item-title"><label for="customerCode">거래처 번호</label></div>
			<div class="item-content"><input id="customerCode" name="customerCode" placeholder="거래처 번호" readonly="readonly"></div>
		</div>
		<div class="stock-in-item">
			<div class="item-title"><label for="companyName">거래처명</label></div>
			<div class="item-content"><input id="companyName" placeholder="거래처명" readonly="readonly"></div>
		</div>
		<div class="stock-in-item">
			<input id="updateDate" name="updateDate" type="date" hidden="1">
			<input id="updateUser" name="updateUser" type="text" hidden="1">
		</div>
	</div>
	
	<div class="stock-in-list">
		<div class="stock-in-item">
			<div class="item-title"><label for="orderType">입고 유형</label></div>
			<div class="item-content"><input type="hidden" name="inType" id="inType">
				<select disabled="disabled">
					<option value="2" selected="selected">기타입고</option>
				</select>
			</div>
		</div>
		<div class="stock-in-item">
			<div class="item-title"><label for="inDate">입고일</label>
			</div><div class="item-content"><input id="inDate" name="inDate" type="date"></div>
		</div>
		<div class="stock-in-item">
			<div class="item-title"><label for="memo">비고</label></div>
			<div class="item-content"><input id="memo" name="memo" placeholder="비고"></div>
		</div>
	</div>
	
</section>
	
	
	
<section class="content-body">
	<div class="content-btn">
		<button onclick="$('input[type=checkbox]').is(':checked')? alert('체크박스 클릭시 등록 불가'):btnEvent('register')">등록</button>
		<button onclick="btnEvent('reset')">초기화</button>
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
					<tr class="stInRow ${stIn.inType == '확정'? 'selected' : ''}" id="row${status.index}">
						<td><input type="text" value="${status.index+1}"></td>
						<td><input class="checkBox" type="checkbox"></td>
						<td class="read"><input type="text" disabled="disabled" class="inType" value="${stIn.inType}" readonly="readonly"></td>
						<td class="read"><input type="text" disabled="disabled" class="orderType" value="${stIn.orderCode != null? '구매입고':'기타입고'}" readonly="readonly"></td>
						<td class="edit"><input type="text" disabled="disabled" class="inDate" value="${stIn.inDate}"></td>
						<td class="requ"><input type="text" disabled="disabled" class="inCode" value="${stIn.inCode}"></td>
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
	<div class="content-btn">
		<button onclick="btnEvent('addDetail')">추가</button>
		<button onclick="btnEvent('removeDetail')">제거</button>
		<button onclick="btnEvent('saveDetail')">저장</button>
		<button onclick="btnEvent('reset')">초기화</button>
	</div>
	
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
						<td class="edit"><input type="text" disabled="disabled" class="sidWhCode" name="whCode" value="${sid.whCode}"></td>
						<td class="edit"><input type="text" disabled="disabled" class="sidItemCode" name="itemCode" value="${sid.itemCode}"></td>
						<td class="edit"><input type="number" disabled="disabled" class="sidInQuantity" name="inQuantity" value="${sid.inQuantity}" min="1"></td>
						<td class="read"><input type="text" disabled="disabled" class="sidInPrice" name="inPrice" value="${sid.inPrice}"></td>
						<td class="edit"><input type="text" disabled="disabled" class="sidWhDtoWhName" name="whName" value="${sid.whDto.whName}"></td>
						<td class="edit"><input type="text" disabled="disabled" class="sidMemo" name="memo" value="${sid.memo}"></td>
					</tr>
				</c:forEach>
				</c:forEach>
			</tbody>
		</table>
	</div>
</section>
			
<%-- 		<section>
			<div class="myModal">
				<table id="company-modal" class="display" style="width: 100%">
					<thead>
						<tr><th><th colspan="11">거래처 목록</th><th><button onclick="$('.myModal').css('display', 'none');">X</button></th></tr>
						<tr>
							<th>코드</th>
							<th>이름</th>
							<th>타입</th>
							<th>단위</th>
							<th>단가</th>
							<th>판매가</th>
							<th>시작일</th>
							<th>마감일</th>
							<th>등록자</th>
							<th>등록일</th>
							<th>수정자</th>
							<th>수정일</th>
							<th>메모</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="stIn" items="${stInList}" varStatus="status">
					<c:forEach var="sid" items="${stIn.stInDetailDto}">
					<c:forEach var="wsd" items="${sid.whStockDetailDto}">
						<tr>
							<td>${wsd.itemDto.itemCode}</td>
							<td>${wsd.itemDto.itemName}</td>
							<td>${wsd.itemDto.itemType}</td>
							<td>${wsd.itemDto.stockUnit}</td>
							<td>${wsd.itemDto.purchasePrice}</td>
							<td>${wsd.itemDto.salesPrice}</td>
							<td>${wsd.itemDto.startDate}</td>
							<td>${wsd.itemDto.endDate}</td>
							<td>${wsd.itemDto.regUser}</td>
							<td>${wsd.itemDto.regDate}</td>
							<td>${wsd.itemDto.updateUser}</td>
							<td>${wsd.itemDto.updateDate}</td>
							<td>${wsd.itemDto.memo}</td>
						</tr>
				</c:forEach>
					</c:forEach>
					</c:forEach>
					</tbody>
				</table>
			</div>


			
		</section> --%>