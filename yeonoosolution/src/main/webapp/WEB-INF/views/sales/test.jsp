<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="contain">
			<input type="button" value="구매 발주">
			<input type="button" value="구매 입고 등록">
			<input type="button" value="구매 내역조회">
		<div id="content">
			<div id="btn-div">
				<button id="order-search-btn">조회</button>
				<button id="order-save-btn">저장</button>
				<button class="order-delete-btn order-status-update-btn">삭제</button>
				<button id="order-init-btn">초기화</button>
				<button id="order-confirm-btn" class="order-status-update-btn">발주 확정</button>
				<button id="order-cancel-btn" class="order-status-update-btn">확정 취소</button>
				<button id="order-stock_in-btn">입고</button>
				<button id="order-close-btn" class="order-status-update-btn">발주 마감</button>
			</div>
			<div id="search-div">
				<div>
					<p>조회 시작일</p>
					<input type="date" id="search-start-day">
				</div>
				<div>
					<p>조회 종료일</p>
					<input type="date" id="search-end-day">
				</div>
				<div>
					<p>발주 일자</p>
					<input type="date" id="search-order-day">
				</div>
				<div>
					<p>거래처 코드(검색)</p>
					<input type="text" id="search-customer-code">
				</div>
				<div>
					<p>거래처명</p>
					<input type="text" id="search-customer-name" readonly>
				</div>
				<div>
					<p>담당자명</p>
					<input type="text" id="order-empid">
				</div>
			</div>
			<div class="tuigrid-header">
				<span>구매발주</span>
				<button type="button" id="order-add">+</button>
				<button type="button" class="order-delete-btn order-status-update-btn">-</button>
			</div>
			<div id="order-list">
				<table id="order-list-table-heder"
					class="order-list-table order-tables order-tables-hearder">
					<thead>
						<tr>
							<th class="order-number"></th>
							<th class="order-radio"></th>
							<th class="order-status">상태</th>
							<th class="order-code">발주서 번호</th>
							<th class="receive-order-type">구매유형</th>
							<th class="order-date">발주일자</th>
							<th class="customer-code">거래처코드</th>
							<th class="customer-name">거래처명</th>
							<th class="due-date">납기일자</th>
							<th class="order-empid">담당자명</th>
							<th class="delivery-plan">인도장소</th>
							<th class="reg-date">등록일자</th>
							<th class="reg-user">등록자</th>
							<th class="update-date">수정일자</th>
							<th class="update-user">수정자</th>
							<th class="order-memo">비고</th>
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
				<button type="button" class="odrer-detail-btn" id="odrer-detail-add-btn">+</button>
				<button type="button" class="odrer-detail-btn" id="odrer-detail-del-btn">-</button>
			</div>
			<div id="order-detail">
				<table id="order-detail-list-table-heder"
					class="order-detail-list-table order-tables order-tables-hearder">
					<thead>
						<tr>
							<th class="item-sorder"></th>
							<th class="item-checkbox"><input type="checkbox" id="all-check"></th>
							<th class="item-code">ITEM코드</th>
							<th class="item-name">품명</th>
							<th class="item-stock-unit">재고단위</th>
							<th class="quantity">발주수량</th>
							<th class="item-price">단가</th>
							<th class="amount">공급가액</th>
							<th class="order-detail-memo">비고</th>
						</tr>
					</thead>
				</table>
				<table id="order-detail-list-table" class="order-detail-list-table order-tables">
					<tbody>
					</tbody>
				</table>
			</div>
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
          			<span>저장하지 않은 발주서는 사라집니다.</span>
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
	<!-- contain -->
</body>
</html>