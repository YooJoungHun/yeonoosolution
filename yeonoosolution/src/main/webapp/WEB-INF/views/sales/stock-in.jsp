<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="contain">
	<div id="content">
		<div id="btn-div">
			<button id="order-search-btn">조회</button>
			<button id="order-save-btn">저장</button>
			<button class="order-delete-btn order-status-update-btn">삭제</button>
			<button id="order-init-btn">초기화</button>
			<button id="order-confirm-btn" class="order-status-update-btn">입고 확정</button>
			<button id="order-cancel-btn" class="order-status-update-btn">확정 취소</button>
		</div>
		<hr>
		<div id="search-div">
			<div>
				<label>입고 일자</label>
				<input type="date" id="search-order-day">
			</div>
			<div>
				<label>거래처 코드(검색)</label>
				<input type="text" id="search-customer-code" autocomplete="off">
			</div>
			<div>
				<label>거래처명</label>
				<input type="text" id="search-customer-name" readonly>
			</div>
		</div>
		<hr>
		<div class="tuigrid-header">
			<span>구매입고</span>
			<div>
				<button type="button" id="order-add" class="order-btn-cl">추가</button>
				<button type="button" class="order-delete-btn order-status-update-btn order-btn-cl">삭제</button>
			</div>
		</div>
		<div id="order-list" class="table-div">
			<table id="order-list-table-heder"
				class="order-list-table order-tables order-tables-hearder">
				<thead>
					<tr>
						<th class="order-number"></th>
						<th class="order-radio"></th>
						<th class="order-status">상태</th>
						<th class="st-in-code">입고 번호</th><!--  -->
						<th class="order-date">입고일자</th>
						<th class="order-code">발주 번호</th>
						<th class="customer-code">거래처코드</th>
						<th class="customer-name">거래처명</th>
						<th class="order-memo">비고</th>
						<th class="reg-date">등록일자</th>
						<th class="reg-user">등록자</th>
						<th class="update-date">수정일자</th>
						<th class="update-user">수정자</th>
					</tr>
				</thead>
			</table>
			<table id="order-list-table" class="order-list-table order-tables">
				<tbody>
				</tbody>
			</table>
		</div>
		<div class="tuigrid-header">
			<span>세부항목</span>
			<div>
				<button type="button" class="odrer-detail-btn order-btn-cl" id="odrer-detail-add-btn">추가</button>
				<button type="button" class="odrer-detail-btn order-btn-cl" id="odrer-detail-del-btn">삭제</button>
			</div>
		</div>
		<div id="order-detail" class="table-div">
			<table id="order-detail-list-table-heder"
				class="order-detail-list-table order-tables order-tables-hearder">
				<thead>
					<tr>
						<th class="item-sorder"></th>
						<th class="item-checkbox"><input type="checkbox" id="all-check"></th>
						<th class="item-code">ITEM코드</th>
						<th class="item-name">품명</th>
						<th class="wh-code">창고 코드</th><!--  -->
						<th class="wh-name">창고명</th><!--  -->
						<th class="item-stock-unit">재고단위</th>
						<th class="quantity">수량</th>
						<th class="item-price">단가</th>
						<th class="amount">공급가액</th>
						<th class="order-detail-memo">비고</th>
					</tr>
				</thead>
			</table>
			<table id="order-detail-list-table"
				class="order-detail-list-table order-tables">
				<tbody>
				</tbody>
			</table>
		</div>
	</div>
<!-- Modal -->
<div class="modal fade" id="modal-order-delete-status-update">
   	<div class="modal-dialog">
     		<div class="modal-content" id="order-delete-status-update-content">
       		<div class="modal-header">
         			<h5 class="modal-title" >삭제하시겠습니까?</h5>
         			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
       		</div>
       		<div class="modal-body">
         			<span>저장하지 않은 입고서 사라집니다.</span>
       		</div>
       		<div class="modal-footer modal-btn-div">
         			<button type="button" class="btn btn-primary modal-confirm-btn" data-bs-dismiss="modal">확인</button>
         			<button type="button" class="btn btn-secondary modal-close-btn" data-bs-dismiss="modal">취소</button>
       		</div>
     		</div>
   	</div>
 	</div>
<div class="modal fade" id="modal-order-status-update">
   	<div class="modal-dialog">
     		<div class="modal-content" id="order-status-update-content">
       		<div class="modal-header">
         			<h5 class="modal-title" id="modal-order-status-update-title"></h5>
         			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
       		</div>
       		<div class="modal-body"><p></p></div>
       		<div class="modal-footer modal-btn-div">
         			<button type="button" class="btn btn-primary modal-confirm-btn" data-bs-dismiss="modal">확인</button>
         			<button type="button" class="btn btn-secondary modal-close-btn" data-bs-dismiss="modal">취소</button>
       		</div>
     		</div>
   	</div>
 	</div>
<div class="modal fade" id="modal-order-status-update-msg">
   	<div class="modal-dialog">
     		<div class="modal-content" id="order-delete-content">
       		<div class="modal-header">
         			<h5 class="modal-title" id="modal-order-status-update-title-msg"></h5>
         			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
       		</div>
       		<div class="modal-body"><p></p></div>
       		<div class="modal-footer modal-btn-div">
         			<button type="button" class="btn btn-primary modal-confirm-btn" data-bs-dismiss="modal">확인</button>
       		</div>
     		</div>
   	</div>
 	</div>
 	<!-- 회사 검색 모달 -->
<div class="modal fade" id="modal-select-customer-code">
   	<div class="modal-dialog">
     		<div class="modal-content" id="select-customer-code-content">
       		<div class="modal-header">
         			<h5 class="modal-title" id="modal-select-customer-code-title-msg">거래처를 선택해 주세요.</h5>
         			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
       		</div>
       		<div class="modal-body">
       		<table id="customer-list-table">
       			<thead>
       				<tr>
       					<th class="customer-code">회사코드</th>
       					<th class="customer-name">회사명</th>
       				</tr>
				</thead>
       			<tbody></tbody>
       		</table>
       		</div>
       		<div class="modal-footer modal-btn-div">
       		</div>
     		</div>
   	</div>
 	</div>
 	<!-- 세부항목 추가 모달 -->
<div class="modal fade" id="modal-select-item-code">
   	<div class="modal-dialog">
     		<div class="modal-content" id="select-item-code-content">
       		<div class="modal-header">
         			<h5 class="modal-title" id="modal-select-item-code-title-msg">제품을 선택해 주세요.</h5>
         			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
       		</div>
       		<div class="modal-body">
       		<table id="item-list-table">
       			<thead>
       				<tr>
       					<th class="item-code">제품코드</th>
       					<th class="item-name">제품명</th>
       					<th></th>
       					<th></th>
       				</tr>
				</thead>
       			<tbody></tbody>
       		</table>
       		</div>
       		<div class="modal-footer modal-btn-div">
       		</div>
     		</div>
   	</div>
 	</div>
 	<!-- 창고 출력모달 -->
<div class="modal fade" id="modal-select-wh-code">
   	<div class="modal-dialog">
     		<div class="modal-content" id="select-wh-code-content">
       		<div class="modal-header">
         			<h5 class="modal-title" id="modal-select-wh-code-title-msg">창고를 선택해 주세요.</h5>
         			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
       		</div>
       		<div class="modal-body">
       		<table id="wh-list-table">
       			<thead>
       				<tr>
       					<th class="wh-code">창고코드</th>
       					<th class="wh-name">창고명</th>
       				</tr>
				</thead>
       			<tbody></tbody>
       		</table>
       		</div>
       		<div class="modal-footer modal-btn-div">
       		</div>
     		</div>
   	</div>
</div>
</div>
