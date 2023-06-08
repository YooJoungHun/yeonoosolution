<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="container">
	<div class="buttons">
		<button id="saveBtn">저장</button>
		<button id="resetBtn">초기화</button>
		<button id="moveConfirmationBtn">이동 확정</button>
	</div>
	<hr>
	<h5>재고이동 등록</h5>
	<div id="registrationBtns">
		<button class="plus"><i class="xi-plus"></i></button>
		<button class="minus"><i class="xi-minus"></i></button>
	</div>
	<div class="divTable">
		<table class="stockMoveRegistrationTable">
			<thead>
				<tr>
					<th class="moveCount">No.</th>
					<th><input type="checkbox" class="checkAll"></th>
					<th>이동번호</th>
					<th>이동일자</th>
					<th>이동상태</th>
					<th>등록일자</th>
					<th>등록자</th>
					<th>수정일자</th>
					<th>수정자</th>
					<th>비고</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="move" items="${stockMoveRegistration}" varStatus="status">
					<tr>
						<td class="moveCount">${status.count }</td>
						<td><input type="checkbox" class="checkItem"></td>
						<td class="moveCode">${move.moveCode }</td> <!-- 이동번호 -->
						<td class="moveDate">${move.moveDate }</td> <!-- 이동일자 -->
						<td class="moveType">${move.moveType }</td>
						<td class="moveRegDate">${move.regDate }</td>
						<td class="moveRegUser">${move.regUser }</td>
						<td class="moveUpdateDate">${move.updateDate }</td>
						<td class="moveUpdateUser">${move.updateUser}</td>
						<td class="moveMemo">${move.memo }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<hr>
	<h5>세부내역</h5>
	<div id="detailBtns">
		<button class="plus"><i class="xi-plus"></i></button>
		<button class="minus"><i class="xi-minus"></i></button>
	</div>
	<div class="divTable">
		<table class="stockMoveDetailTable">
			<thead>
				<tr>
					<th class="moveCount">No.</th>
					<th><input type="checkbox" class="checkAll"></th>
					<th>제품코드</th>
					<th>품명</th>
					<th>재고수량</th>
					<th>출고창고</th>
					<th>입고창고</th>
					<th>이동수량</th>
					<th>비고</th>
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
	</div>
</div>

<!-- itemCodeTable 모달 -->
<div class="modal fade" id="itemCodeModal" tabindex="-1" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">제품 리스트</h5>
			</div>
			<div class="modal-body">
				<div id="itemCodeTableContainer">
					<table id="itemCodeTable">
						<thead>
							<tr>
								<th>제품코드</th>
								<th>제품명</th>
								<th>창고코드</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- whCodeInTable 모달 -->
<div class="modal fade" id="whCodeModal" tabindex="-1" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">창고 리스트</h5>
			</div>
			<div class="modal-body">
				<div id="whCodeInTableContainer">
					<table id="whCodeInTable">
						<thead>
							<tr>
								<th>입고창고</th>
								<th>입고창고 코드</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>