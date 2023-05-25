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
		<div class="main-content">
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
							<input id="inCode" placeholder="입고 번호">
						</div>
					</div>
					<div class="stock-in-item">
						<div class="item-title">
							<label for="inCode">수주 번호</label>
						</div>
						<div class="item-content">
							<input id="inCode" placeholder="수주 번호">
						</div>
					</div>
					<div class="stock-in-item">
						<div class="item-title">
							<label for="inDate">입고일</label>
						</div>
						<div class="item-content">
							<input id="inDate" type="date">
						</div>
					</div>
				</div>
				
				<div class="stock-in-list">
					<div class="stock-in-item">
						<div class="item-title">
							<label for="customerCode">거래처 번호</label>
						</div>
						<div class="item-content">
							<input id="customerCode" placeholder="거래처 번호">
						</div>
					</div>
					<div class="stock-in-item">
						<div class="item-title">
							<label for="memo">거래처명</label>
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
							<select id="inType">
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
							<input id="regUser" placeholder="등록자">
						</div>
					</div>
					<div class="stock-in-item">
						<div class="item-title">
							<label for="regDate">등록일</label>
						</div>
						<div class="item-content">
							<input id="regDate" type="date">
						</div>
					</div>
					<div class="stock-in-item">
						<div class="item-title">
							<label for="memo">비고</label>
						</div>
						<div class="item-content">
							<input id="memo" placeholder="비고">
						</div>
					</div>
				</div>
				
			</section>
			<section class="content-body">
				<div class="stock-in-detail-list">
				
					<div class="table-rownum">
						<table>
							<tr>
								<td>
									<div class="item-title">
										<label for="inCode"></label>
									</div>
									<div class="item-title">
										<label for="inCode"><input type="checkbox"></label>
									</div>
								</td>
							</tr>
						</table>
					</div>
					
					<div class="table-content">
						<table>
							<tr>
								<td>
									<div class="item-title">
										<label for="inCode">입고번호</label>
									</div>
								</td>
								<td>
									<div class="item-title">
										<label for="inCode">수주 번호</label>
									</div>
								</td>
								<td>
									<div class="item-title">
										<label for="inDate">입고일</label>
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
										<label for="inType">입고유형</label>
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
										<label for="memo">비고</label>
									</div>
								</td>
							</tr>
						</table>
					</div>
				</div>
				
			</section>
			<section class="content-body">
			
			</section>
		</div>
		
	</main>
	
</body>
</html>