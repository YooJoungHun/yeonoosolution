<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="analysis-of-materials-body-container">
	
	<div class="analysis-of-materials-container">
		
		<div class="analysis-of-materials-container-btn">
		
			<button type="button" id="search-btn" value="조회" style="margin-left: 20px;">조회</button>
			<button type="button" id="receive-order-btn" value="수주서 관리" onclick="location.href='/sales/receive-order'">수주서 관리</button>
			
		</div>
		
		<div class="receive-order-table-container">
		
			<h4 style="margin-left: 30px;">수주목록</h4>
			<table id="table-order-content" border="1">
				<thead>
					<tr>
						<th></th>
						<th>수주번호</th>
						<th>제품코드</th>
						<th>품명</th>
						<th>구분</th>
						<th>수주수량</th>
						<th>수주유형</th>
						<th>수주일</th>
						<th>수주담당자</th>
						<th>상태</th>
					</tr>
				</thead>
				
				<tbody id="table-order-content-body">
				</tbody>
				
			</table>
			
		</div>	<!-- /class="receive-order-table-container" -->
		
		<div class="semi-manufactures-container">
		
			<h4 style="margin-left: 30px;">반제품 요소분석</h4>
			<table id="table-semi-manufactures-content" border="1">
					<thead>
						<tr>
							<th>제품코드</th>
							<th>품명</th>
							<th>구분</th>	<!-- 반제품 -->
							<th>재고단위</th>
							<th>재고수량</th>
							<th>작업지시수량</th>	<!-- 생산계획세부 -->
						</tr>
					</thead>
					
					<tbody id="table-semi-manufactures-content-body">
					</tbody>
					
				</table>
		
		</div>	<!-- /class="semi-manufactures-container" -->
		
		
	
	</div>
</div>	<!-- /id="analysis-of-materials-body-container" -->