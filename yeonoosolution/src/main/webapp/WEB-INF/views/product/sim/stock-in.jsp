<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입고</title>
</head>

<script type="text/javascript" src="${pageContext.request.contextPath}/JS/product/sim/st-in-register.js"></script>
<!-- DataTables JS -->
<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>

<body>
	<main>
		<section class="content-header">
			<div class="content-btn">
				<button onclick="btnEvent('register')">등록</button>
				<button onclick="btnEvent('reset')">초기화</button>
			</div>
			
			
			<div class="stock-in-list">
				<div class="stock-in-item">

					<div class="item-title"><label for="customerCode">거래처 번호</label></div>
					<div class="item-content"><input id="customerCode" name="customerCode" placeholder="거래처 번호" readonly="readonly" data-toggle="modal" data-target="#myModal"></div>
				</div>
				<div class="stock-in-item">
					<div class="item-title"><label for="companyName">거래처명</label></div>
					<div class="item-content"><input id="companyName" placeholder="거래처명" readonly="readonly"></div>
				</div>
				<div class="stock-in-item">
					<input id="updateDate" name="updateDate" type="date" hidden="1">
					<input id="updateUser" name="updateUser" type="text" hidden="1">
				</div>
			</div>
			
			<div class="stock-in-list">
				<div class="stock-in-item">
					<div class="item-title"><label for="orderType">입고 유형</label></div>
					<div class="item-content"><input type="hidden" name="inType" id="inType">
						<select id="orderType" name="orderType" disabled="disabled">
							<option value="2" selected="selected">기타입고</option>
						</select>
					</div>
				</div>
				<div class="stock-in-item">
					<div class="item-title"><label for="inDate">입고일</label>
					</div><div class="item-content"><input id="inDate" name="inDate" type="date"></div>
				</div>
				<div class="stock-in-item">
					<div class="item-title"><label for="memo">비고</label></div>
					<div class="item-content"><input id="memo" name="memo" placeholder="비고"></div>
				</div>
			</div>
			
		</section>
			
			
			
		<section class="content-body">
			<div class="stock-in-table">
				<table class="table-in table-content">
					<thead>
						<tr>
							<th><div class="item-title"></div></th>
							<th><div class="item-title"><input type="checkbox" class="allCheck" onclick="$('.checkBox').prop('checked', this.checked ? true : false);"></div></th>
							<th><div class="item-title"><label for="inType">입고 상태</label></div></th>
							<th><div class="item-title"><label for="orderType">입고 유형</label></div></th>
							<th><div class="item-title"><label for="         inDate">입고일</label></div></th>
							<th><div class="item-title"><label for="inCode">입고 번호</label></div></th>
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
							<tr class="stInRow" id="row${status.index}">
								<td ${stIn.inType == '확정'? 'style="background-color:rgba(0,0,0, 0.2);"':''}><input type="text" value="${status.index+1}"></td>
								<td ${stIn.inType == '확정'? 'style="background-color:rgba(0,0,0, 0.2);"':''}><input class="checkBox" type="checkbox"></td>
								<td ${stIn.inType == '확정'? 'style="background-color:rgba(0,0,0, 0.2);"':''}><input type="text" disabled="disabled" class="inType" value="${stIn.inType}" readonly="readonly"></td>
								<td ${stIn.inType == '확정'? 'style="background-color:rgba(0,0,0, 0.2);"':''}><input type="text" disabled="disabled" class="orderType" value="${stIn.orderCode != null? '구매입고':'기타입고'}" readonly="readonly"></td>
								<td ${stIn.inType == '확정'? 'style="background-color:rgba(0,0,0, 0.2);"':''}><input type="text" disabled="disabled" class="inDate" value="${stIn.inDate}"></td>
								<td ${stIn.inType == '확정'? 'style="background-color:rgba(0,0,0, 0.2);"':''}><input type="text" disabled="disabled" class="inCode" value="${stIn.inCode}"></td>
								<td ${stIn.inType == '확정'? 'style="background-color:rgba(0,0,0, 0.2);"':''}><input type="text" disabled="disabled" class="customerCode" value="${stIn.customerCode}"></td>
								<td ${stIn.inType == '확정'? 'style="background-color:rgba(0,0,0, 0.2);"':''}><input type="text" disabled="disabled" class="companyName" value="${stIn.companyDto.companyName}"></td>
								<td ${stIn.inType == '확정'? 'style="background-color:rgba(0,0,0, 0.2);"':''}><input type="text" disabled="disabled" class="regUser" value="${stIn.regUser}"></td>
								<td ${stIn.inType == '확정'? 'style="background-color:rgba(0,0,0, 0.2);"':''}><input type="text" disabled="disabled" class="regDate" value=<fmt:formatDate value="${stIn.regDate}" pattern="yyyy/MM/dd"/>></td>
								<td ${stIn.inType == '확정'? 'style="background-color:rgba(0,0,0, 0.2);"':''}><input type="text" disabled="disabled" class="updateUser" value="${stIn.updateUser}"></td>
								<td ${stIn.inType == '확정'? 'style="background-color:rgba(0,0,0, 0.2);"':''}><input type="text" disabled="disabled" class="updateDate" value=<fmt:formatDate value="${stIn.updateDate}" pattern="yyyy/MM/dd"/>></td>
								<td ${stIn.inType == '확정'? 'style="background-color:rgba(0,0,0, 0.2);"':''}><input type="text" disabled="disabled" class="memo" value="${stIn.memo}"></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</section>


		<section>
		
		
			<div class="stock-in-detail-table">
				<table class="table-in-detail table-content">
					<thead>
						<tr>
							<th><div class="item-title">순번</div></th>
							<th><div class="item-title"><input type="checkbox" class="allCheck" onclick="$('.dtCheckBox').prop('checked', this.checked ? true : false);"></div></th>
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
							<tr class="stInDetailRow">
								<td ${stIn.inType == '확정'? 'style="background-color:rgba(0,0,0, 0.2);"':''}><input type="text" disabled="disabled" class="sidSorder" value="${sid.sorder}" readonly="readonly"></td>
								<td ${stIn.inType == '확정'? 'style="background-color:rgba(0,0,0, 0.2);"':''}><input type="checkbox" class="dtCheckBox"></td>
								<td ${stIn.inType == '확정'? 'style="background-color:rgba(0,0,0, 0.2);"':''}><input type="text" disabled="disabled" class="inCode" value="${stIn.inCode}" readonly="readonly"></td>
								<td ${stIn.inType == '확정'? 'style="background-color:rgba(0,0,0, 0.2);"':''}><input type="text" disabled="disabled" class="sidWhCode" value="${sid.whCode}"></td>
								<td ${stIn.inType == '확정'? 'style="background-color:rgba(0,0,0, 0.2);"':''}><input type="text" disabled="disabled" class="sidItemCode" value="${sid.itemCode}"></td>
								<td ${stIn.inType == '확정'? 'style="background-color:rgba(0,0,0, 0.2);"':''}><input type="text" disabled="disabled" class="sidInQuantity" value="${sid.inQuantity}"></td>
								<td ${stIn.inType == '확정'? 'style="background-color:rgba(0,0,0, 0.2);"':''}><input type="text" disabled="disabled" class="sidInPrice" value="${sid.inPrice}"></td>
								<td ${stIn.inType == '확정'? 'style="background-color:rgba(0,0,0, 0.2);"':''}><input type="text" disabled="disabled" class="sidWhDtoWhName" value="${sid.whDto.whName}"></td>
								<td ${stIn.inType == '확정'? 'style="background-color:rgba(0,0,0, 0.2);"':''}><input type="text" disabled="disabled" class="sidMemo" value="${sid.memo}"></td>
							</tr>
						</c:forEach>
						</c:forEach>
					</tbody>
				</table>
				
				<div class="myModal">
					<table id="company-modal" class="display" style="width: 100%">
						<thead>
							<tr><th><th colspan="11">거래처 목록</th><th><button onclick="$('.myModal').css('display', 'none');">X</button></th></tr>
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
						</thead>
						<tbody>
						<c:forEach var="stIn" items="${stInList}" varStatus="status">
						<c:forEach var="sid" items="${stIn.stInDetailDto}">
						<c:forEach var="wsd" items="${sid.whStockDetailDto}">
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
					</c:forEach>
						</c:forEach>
						</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			

    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document" style="max-width: 80%; width: auto;">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="modalLabel">회사 목록</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <!-- DataTable goes here -->
            <table id="modal-company" class="display" style="width:100%">
                <thead>
                    <tr>
                        <th>회사코드</th>
                        <th>회사명</th>
                        <th>발/수주 구분</th>
                        <th>대표자명</th>
                        <th>연락처</th>
                        <th>주소</th>
                    </tr>
                </thead>
            </table>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          </div>
        </div>
      </div>
    </div>
			
		</section>
	</main>
	
</body>
</html>