<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/product/preset.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입고</title>
<link rel="stylesheet" type="text/css" href="/CSS/st-in.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/JS/st-in.js"></script>
	

</head>
<body>
	<main>
		<section class="content-header">
			<div class="content-btn">
				<button onclick="btnEvent('find')">조회</button>
				<button onclick="btnEvent('save')">저장</button>
				<button onclick="btnEvent('delete')">삭제</button>
				<button onclick="btnEvent('fix')">확정</button>
				<button onclick="btnEvent('cancel')">확정 취소</button>
			</div>
			
			<div class="stock-in-list">
				<div class="stock-in-item">
					<input id="updateDate" name="updateDate" type="date" hidden="1">
					<input id="updateUser" name="updateUser" type="text" hidden="1">
					<div class="item-title">
						<label for="inCode">입고번호</label>
					</div>
					<div class="item-content">
						<input id="inCode" name="inCode" placeholder="입고 번호">
					</div>
				</div>
				<div class="stock-in-item">
					<div class="item-title">
						<label for="orderCode">수주 번호</label>
					</div>
					<div class="item-content">
						<input id="orderCode" name="orderCode" placeholder="수주 번호">
					</div>
				</div>
				<div class="stock-in-item">
					<div class="item-title">
						<label for="inDate">입고일</label>
					</div>
					<div class="item-content">
						<input id="inDate" name="inDate" type="date">
					</div>
				</div>
			</div>
			
			<div class="stock-in-list">
				<div class="stock-in-item">
					<div class="item-title">
						<label for="customerCode">거래처 번호</label>
					</div>
					<div class="item-content">
						<input id="customerCode" name="customerCode" placeholder="거래처 번호">
					</div>
				</div>
				<div class="stock-in-item">
					<div class="item-title">
						<label for="companyName">거래처명</label>
					</div>
					<div class="item-content">
						<input id="companyName" placeholder="거래처명">
					</div>
				</div>
				<div class="stock-in-item">
					<div class="item-title">
						<label for="orderType">입고 유형</label>
					</div>
					<div class="item-content">
						<input type="hidden" name="inType" id="inType">
						<select id="orderType" name="orderType" onchange="orderTypeEvent(this)">
							<option value="">선택</option>
							<option value="1">구매입고</option>
							<option value="0">기타입고</option>
						</select>
					</div>
				</div>
			</div>
			
			<div class="stock-in-list">
				<div class="stock-in-item">
					<div class="item-title">
						<label for="regUser">등록자</label>
					</div>
					<div class="item-content">
						<input id="regUser" name="regUser" placeholder="등록자">
					</div>
				</div>
				<div class="stock-in-item">
					<div class="item-title">
						<label for="regDate">등록일</label>
					</div>
					<div class="item-content">
						<input id="regDate" name="regDate" type="date">
					</div>
				</div>
				<div class="stock-in-item">
					<div class="item-title">
						<label for="memo">비고</label>
					</div>
					<div class="item-content">
						<input id="memo" name="memo" placeholder="비고">
					</div>
				</div>
			</div>
		</section>
			
		<section class="content-body">
			<div class="stock-in-detail-list">
				
				<table class="list-table">
					<thead>
						<tr>
							<th>
								<div class="item-title">순번</div>
							</th>
							<th>
								<div class="item-title">
									<input class="checkBox" type="checkbox" onclick="$('.checkBox').prop('checked', (_, checked)=> {return !checked;});">
								</div>
							</th>
							<th>
								<div class="item-title">
									<label for="inType">입고 상태</label>
								</div>
							</th>
							<th>
								<div class="item-title">
									<label for="orderType">입고유형</label>
								</div>
							</th>
							<th>
								<div class="item-title">
									<label for="inDate">입고일</label>
								</div>
							</th>
							<th>
								<div class="item-title">
									<label for="inCode">입고 번호</label>
								</div>
							</th>
							<th>
								<div class="item-title">
									<label for="inCode">수주 번호</label>
								</div>
							</th>
							<th>
								<div class="item-title">
									<label for="customerCode">거래처 번호</label>
								</div>
							</th>
							<th>
								<div class="item-title">
									<label for="companyName">거래처명</label>
								</div>
							</th>
							<th>
								<div class="item-title">
									<label for="regUser">등록자</label>
								</div>
							</th>
							<th>
								<div class="item-title">
									<label for="regDate">등록일</label>
								</div>
							</th>
							<th>
								<div class="item-title">
									<label for="updateUser">수정자</label>
								</div>
							</th>
							<th>
								<div class="item-title">
									<label for="updateDate">수정일</label>
								</div>
							</th>
							<th>
								<div class="item-title">
									<label for="memo">비고</label>
								</div>
							</th>
						</tr>
					</thead>
					
					<tbody>
						<c:forEach var="stIn" items="${stInList}" varStatus="status">
							<tr class="stInRow">
								<td><div>${status.index+1}</div></td>
								<td><input class="checkBox" type="checkbox"></td>
								<td class="inType">${stIn.inType}</td>
								<td class="orderType">${stIn.orderCode != null? '구매입고':'기타입고'}</td>
								<td class="inDate">${stIn.inDate}</td>
								<td class="inCode">${stIn.inCode}</td>
								<td class="orderCode">${stIn.orderCode}</td>
								<td class="customerCode">${stIn.customerCode}</td>
								<td class="companyName">${stIn.companyDto.companyName}</td>
								<td class="regUser">${stIn.regUser}</td>
								<td class="regDate"><fmt:formatDate value="${stIn.regDate}" pattern="yyyy/MM/dd"/></td>
								<td class="updateUser">${stIn.updateUser}</td>
								<td class="updateDate"><fmt:formatDate value="${stIn.updateDate}" pattern="yyyy/MM/dd"/></td>
								<td class="memo">${stIn.memo}</td>
							</tr>
							<tr style="display: none;" class="row${status.index}">
								<td colspan="14">
									<table style="margin: 30px 0px;">
										<caption>입고 상세</caption>
										<tr>
											<th></th>
											<th>순번</th>
											<th>창고코드</th>
											<th>아이템코드</th>
											<th>수량</th>
											<th>가격</th>
											<th>창고이름</th>
											<th>비고</th>
										</tr>

										<c:forEach var="sid" items="${stIn.stInDetailDto}">
											<tr class="stInDetailRow">
												<td><input type="checkbox"></td>
												<td>${sid.sorder}</td>
												<td>${sid.whCode}</td>
												<td>${sid.itemCode}</td>
												<td>${sid.inQuantity}</td>
												<td>${sid.inPrice}</td>
												<td>${sid.whDto.whName}</td>
												<td>${sid.memo}</td>
											</tr>
											<tr>
												<td class="myModal">
					<table class="myModal-window">
						<c:forEach var="wsd" items="${sid.whStockDetailDto}">
							<tbody>
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
					</table>
												</td>
											</tr>
												
										</c:forEach>
									</table>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
			</div>
		</section>
		
		<section class="content-body">
		
		</section>
	</main>
	
</body>
</html>