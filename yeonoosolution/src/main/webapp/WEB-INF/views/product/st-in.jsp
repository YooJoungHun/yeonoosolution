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
				<button onclick="btnEvent(this, 'find')">조회</button>
				<button onclick="btnEvent(this, 'save')">저장</button>
				<button onclick="btnEvent(this, 'delete')">삭제</button>
				<button onclick="btnEvent(this, 'fix')">확정</button>
				<button onclick="btnEvent(this, 'cancel')">확정 취소</button>
			</div>
			
			<form action="${pageContext.request.contextPath}/find">
			<button type="submit">ㄱㄱ</button>
				<div class="stock-in-list">
					<div class="stock-in-item">
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
							<input id="inDate" name="inDate" type="date" pattern="yyyy/MM/dd">
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
							<label for="inType">입고 유형</label>
						</div>
						<div class="item-content">
							<select id="inType" name="inType" onchange="inTypeEvent(this)">
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
							<input id="regDate" name="regDate" type="date" pattern="yyyy/MM/dd">
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
			</form>
		</section>
			
			
			
			
		<section class="content-body">
			<div class="stock-in-detail-list">
				<div class="list-left">
					<div class="left-table">
						<table>
							<tr>
								<th>
									<div class="item-title"></div>
								</th>
								<th>
									<label for="box-check">
										<div class="item-title">
											<input id="box-allCheck" type="checkbox">
										</div>
									</label>
								</th>
							</tr>
						</table>
						
						<div class="table-left table-row">
							<table>
								<c:forEach var="stIn" items="${stInList}" varStatus="status">
									<tr>
										<td>
											<div>${status.index+1}</div>
										</td>
										<td>
											<div><input type="checkbox"></div>
										</td>
									</tr>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
				
				<div class="list-right">
					<div class="table-right">
						<table>
							<tr>
								<th>
									<div class="item-title">
										<label for="inType">입고 상태</label>
									</div>
								</th>
								<th>
									<div class="item-title">
										<label for="inType">입고유형</label>
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
						</table>
					</div>
					<div class="table-right table-row">
						<table>
							<c:forEach var="stIn" items="${stInList}" varStatus="status">
								<tr class="stInRow">
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
									<tr style="display: none;" class="row${status.index}">
										<th>순번</th>
										<th>창고코드</th>
										<th>아이템코드</th>
										<th>수량</th>
										<th>가격</th>
										<th>창고이름</th>
									</tr>
									<c:forEach var="sid" items="${stIn.stInDetailDto}">
										<tr style="display: none;" class="row${status.index}">
											<td>${sid.sorder}</td>
											<td>${sid.whCode}</td>
											<td>${sid.itemCode}</td>
											<td>${sid.inQuantity}</td>
											<td>${sid.inPrice}</td>
											<td>${sid.whDto.whName}</td>
										</tr>
									</c:forEach>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</section>
		
		<section class="content-body">
		
		</section>
	</main>
	
</body>
</html>