<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/product/preset.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입고</title>
<link rel="stylesheet" type="text/css" href="/CSS/st-in.css">



</head>
<body>
	<main>
		<section class="content-header">
			<div class="content-btn">
				<button>조회</button>
				<button>저장</button>
				<button>삭제</button>
				<button>확정</button>
				<button>확정 취소</button>
			</div>
			
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
						<label for="inType">입고 유형</label>
					</div>
					<div class="item-content">
						<select id="inType" name="inType">
							<option>멍</option>
							<option>멍멍</option>
							<option>멍멍멍</option>
							<option>멍멍멍멍</option>
							<option>멍멍멍멍멍</option>
							<option>멍멍멍멍멍</option>
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
			
				<div class="table-rownum table-detail">
					<table class="table-left">
						<tr>
							<td>
								<div class="item-title">
									<label for="inCode"></label>
								</div>
							</td>
							<td>
								<div class="item-title">
									<label for="inCode"><input type="checkbox"></label>
								</div>
							</td>
						</tr>
						
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
				
				<div class="table-content table-detail">
					<table class="table-right">
						<tr>
							<td>
								<div class="item-title">
									<label for="inType">입고 상태</label>
								</div>
							</td>
							<td>
								<div class="item-title">
									<label for="inType">입고유형</label>
								</div>
							</td>
							<td>
								<div class="item-title">
									<label for="inDate">입고일</label>
								</div>
							</td>
							<td>
								<div class="item-title">
									<label for="inCode">입고 번호</label>
								</div>
							</td>
							<td>
								<div class="item-title">
									<label for="inCode">수주 번호</label>
								</div>
							</td>
							<td>
								<div class="item-title">
									<label for="customerCode">거래처 번호</label>
								</div>
							</td>
							<td>
								<div class="item-title">
									<label for="companyName">거래처명</label>
								</div>
							</td>
							<td>
								<div class="item-title">
									<label for="regUser">등록자</label>
								</div>
							</td>
							<td>
								<div class="item-title">
									<label for="regDate">등록일</label>
								</div>
							</td>
							<td>
								<div class="item-title">
									<label for="updateUser">수정자</label>
								</div>
							</td>
							<td>
								<div class="item-title">
									<label for="updateDate">수정일</label>
								</div>
							</td>
							<td>
								<div class="item-title">
									<label for="memo">비고</label>
								</div>
							</td>
						</tr>
						<c:forEach var="stIn" items="${stInList}">
							<tr>
								<td>${stIn.inType}</td>
								<td>${stIn.orderCode != null? '구매입고':'기타입고'}</td>
								<td>${stIn.inDate}</td>
								<td>${stIn.inCode}</td>
								<td>${stIn.orderCode}</td>
								<td>${stIn.customerCode}</td>
								<td>${stIn.companyDto.companyName}</td>
								<td>${stIn.regUser}</td>
								<td><fmt:formatDate value="${stIn.regDate}" pattern="yyyy/MM/dd"/></td>
								<td>${stIn.updateUser}</td>
								<td><fmt:formatDate value="${stIn.updateDate}" pattern="yyyy/MM/dd"/></td>
								<td>${stIn.memo}</td>
								<c:forEach var="sid" items="${stIn.stInDetailDto}">
									<tr style="display: none;">
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
		</section>
		
		<section class="content-body">
		
		</section>
	</main>
	
</body>
</html>