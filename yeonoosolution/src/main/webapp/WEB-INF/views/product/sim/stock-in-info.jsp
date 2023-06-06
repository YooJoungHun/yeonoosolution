<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입고</title>
</head>
<body>
	<main>
		<section class="content-header">
			<div class="content-btn">
				<button onclick="btnEvent('find')" class="btn custom-btn custom-btn-primary btn-white">조회</button>
				<button onclick="btnEvent('save')" class="btn custom-btn custom-btn-primary btn-white">저장</button>
				<button onclick="resetEvent()" class="btn custom-btn custom-btn-secondary btn-white">초기화</button>
			</div>

			
			<div class="stock-in-list">
				<div class="stock-in-item">
					<input id="updateDate" name="updateDate" type="date" hidden="1">
					<input id="updateUser" name="updateUser" type="text" hidden="1">
					<div class="item-title"><label for="inCode">입고 번호</label></div>
					<div class="item-content"><input id="inCode" name="inCode" placeholder="입고 번호" class="form-control"></div>
				</div>
				<div class="stock-in-item">
					<div class="item-title"><label for="orderCode">수주 번호</label></div>
					<div class="item-content"><input id="orderCode" name="orderCode" placeholder="수주 번호" class="form-control"></div>
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
				<button onclick="btnEvent('save')">저장</button>
				<button onclick="btnEvent('delete')">삭제</button>
				<button onclick="btnEvent('fix')">확정</button>
				<button onclick="btnEvent('cancel')">확정 취소</button>
			</div>
			<div class="stock-in-table">
				<table class="table-in table-content">
					<thead>
						<tr>
							<th><div class="item-title"></div></th>
							<th><div class="item-title"><input type="checkbox" class="allCheck" onclick="$('.checkBox').prop('checked', this.checked ? true : false);"></div></th>
							<th><div class="item-title"><label for="inType">입고 상태</label></div></th>
							<th><div class="item-title"><label for="orderType">입고 유형</label></div></th>
							<th><div class="item-title"><label for="inDate">입고일</label></div></th>
							<th><div class="item-title"><label for="inCode">입고 번호</label></div></th>
							<th><div class="item-title"><label for="inCode">수주 번호</label></div></th>
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
							<tr class="stInRow" class="row${status.index}" ${stIn.inType == '확정'? 'style="background-color:rgba(0,0,0, 0.2);"':''}>
								<td><input type="text" value="${status.index+1}"></td>
								<td><input class="checkBox" type="checkbox"></td>
								<td><input type="text" disabled="disabled" class="inType" value="${stIn.inType}" readonly="readonly"></td>
								<td><input type="text" disabled="disabled" class="orderType" value="${stIn.orderCode != null? '구매입고':'기타입고'}" readonly="readonly"></td>
								<td><input type="text" disabled="disabled" class="inDate" value="${stIn.inDate}"></td>
								<td><input type="text" disabled="disabled" class="inCode" value="${stIn.inCode}"></td>
								<td><input type="text" disabled="disabled" class="orderCode" value="${stIn.orderCode}"></td>
								<td><input type="text" disabled="disabled" class="customerCode" value="${stIn.customerCode}"></td>
								<td><input type="text" disabled="disabled" class="companyName" value="${stIn.companyDto.companyName}"></td>
								<td><input type="text" disabled="disabled" class="regUser" value="${stIn.regUser}"></td>
								<td><input type="text" disabled="disabled" class="regDate" value=<fmt:formatDate value="${stIn.regDate}" pattern="yyyy/MM/dd"/>></td>
								<td><input type="text" disabled="disabled" class="updateUser" value="${stIn.updateUser}"></td>
								<td><input type="text" disabled="disabled" class="updateDate" value=<fmt:formatDate value="${stIn.updateDate}" pattern="yyyy/MM/dd"/>></td>
								<td><input type="text" disabled="disabled" class="memo" value="${stIn.memo}"></td>
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
							<tr class="stInDetailRow" ${stIn.inType == '확정'? 'style="background-color:rgba(0,0,0, 0.2);"':''}>
								<td><input type="text" disabled="disabled" class="sidSorder" value="${sid.sorder}" readonly="readonly"></td>
								<td><input type="checkbox" class="sidCheckBox"></td>
								<td><input type="text" disabled="disabled" class="inCode" value="${stIn.inCode}" readonly="readonly"></td>
								<td><input type="text" disabled="disabled" class="sidWhCode" value="${sid.whCode}"></td>
								<td><input type="text" disabled="disabled" class="sidItemCode" value="${sid.itemCode}"></td>
								<td><input type="number" disabled="disabled" class="sidInQuantity" value="${sid.inQuantity}"></td>
								<td><input type="text" disabled="disabled" class="sidInPrice" value="${sid.inPrice}"></td>
								<td><input type="text" disabled="disabled" class="sidWhDtoWhName" value="${sid.whDto.whName}"></td>
								<td><input type="text" disabled="disabled" class="sidMemo" value="${sid.memo}"></td>
							</tr>
						</c:forEach>
						</c:forEach>
					</tbody>
				</table>
				
				
				<table class="myModal">
					<c:forEach var="stIn" items="${stInList}" varStatus="status">
					<c:forEach var="sid" items="${stIn.stInDetailDto}">
					<c:forEach var="wsd" items="${sid.whStockDetailDto}">
						<tbody class="myModal-window">
							<tr><th><th colspan="11">아이템 상세</th><th><button onclick="$('.myModal').css('display', 'none');">X</button></th></tr>
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
						</tbody>
					</c:forEach>
					</c:forEach>
					</c:forEach>
				</table>
				
			</div>
		</section>
	</main>
	
</body>
</html>