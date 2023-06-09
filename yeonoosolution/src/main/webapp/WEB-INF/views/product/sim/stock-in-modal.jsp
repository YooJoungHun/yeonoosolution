<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Stock-In-Modal</title>
</head>
<script type="text/javascript" src="${pageContext.request.contextPath}/JS/product/sim/st-in-modal.js"></script>
<body>

    <!-- Company List Modal -->
    <div class="modal fade" id="companyModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document" style="max-width: 80%; width: auto;">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="companyLabel">거래처 목록</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <!-- DataTable goes here -->
            <table id="modal-company" class="display" style="width:100%">
                <thead class="modal-thead">
                    <tr>
                        <th>회사코드</th>
                        <th>회사명</th>
                        <th>발/수주 구분</th>
                        <th>대표자명</th>
                        <th>연락처</th>
                        <th>주소</th>
                    </tr>
                </thead>
                <tbody class="modal-tbody"></tbody>
            </table>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          </div>
        </div>
      </div>
    </div>
    
    <!-- WareHouse List Modal -->
    <div class="modal fade" id="whModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document" style="max-width: 80%; width: auto;">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="whLabel">창고 목록</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <!-- DataTable goes here -->
            <table id="modal-wh" class="display" style="width:100%">
                <thead class="modal-thead">
                    <tr>
                        <th>창고 코드</th>
                        <th>회사 코드</th>
                        <th>창고명</th>
                        <th>사용여부</th>
                        <th>비고</th>
                    </tr>
                </thead>
                <tbody class="modal-tbody"></tbody>
            </table>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          </div>
        </div>
      </div>
    </div>
    
    <!-- Item List Modal -->
    <div class="modal fade" id="itemModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document" style="max-width: 80%; width: auto;">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="itemLabel">아이템 목록</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <!-- DataTable goes here -->
            <table id="modal-item" class="display" style="width:100%">
                <thead class="modal-thead">
                    <tr>
                        <th>제품 코드</th>
                        <th>창고 코드</th>
                        <th>거래처 코드</th>
                        <th>품명</th>
                        <th>구분</th>
                        <th>매입 단가</th>
                        <th>사용 여부</th>
                        <th>비고</th>
                    </tr>
                </thead>
                <tbody class="modal-tbody"></tbody>
            </table>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          </div>
        </div>
      </div>
    </div>
    
    
    <!-- Item List Modal -->
    <div class="modal fade" id="orderModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document" style="max-width: 80%; width: auto;">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="orderLabel">발주 목록</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <!-- DataTable goes here -->
            <table id="modal-order" class="display" style="width:100%">
                <thead class="modal-thead">
                    <tr>
                        <th>발주 번호</th>
                        <th>거래처 코드</th>
                        <th>발주 유형</th>
                        <th>담당자</th>
                        <th>인도조건</th>
                        <th>상태</th>
                        <th>납기일</th>
                        <th>비고</th>
                    </tr>
                </thead>
                <tbody class="modal-tbody"></tbody>
            </table>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          </div>
        </div>
      </div>
    </div>
    
</body>
</html>