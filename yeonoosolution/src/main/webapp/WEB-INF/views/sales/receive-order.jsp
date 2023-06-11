<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="receive-order-body-container">
		
	<div class="receive-order-container">
			
		
		<div class="receive-order-btn">
			
			<button type="button" id="search-btn" value="조회" style="margin-left: 15px;">조회</button>
			<button type="button" id="delete-btn" value="삭제">삭제</button>
			<button type="button" id="order-confirmation-btn" value="수주 확정">수주 확정</button>
			<button type="button" id="confirmation-cancel-btn" value="확정 취소">확정 취소</button>
			<button type="button" id="stock-out-reg-btn" value="출하 등록">출고 등록</button>
			<button type="button" id="work-order-reg-btn" value="작업 지시 등록">작업 지시 등록</button>
			<button type="button" id="analysis-bom-btn" value="자재 요소 분석" onclick="location.href='/sales/analysis-of-materials'">자재 요소 분석</button>
			<button id="insert-receive-form-button">새 수주서 작성</button>
			<button id="insert-receive-detail-form-button">세부항목 작성</button>
			
		</div>
	
		<div class="receive-order-top-content">
			<div >
				<span style="margin-left: 15px;">수주유형</span>
				<select id="receive-order-type" name="receiveOrderType">
					<option value="자체생산">자체생산</option>
					<option value="OEM">OEM</option>
					<option value="ODM">ODM</option>
				</select>
				<span>수주일</span>
				<input type="date" id="order-date" name="orderDate"> 
				<span>수주담당자</span>
				<input type="text" id="order-empid" name="orderEmpid" width="50px;">
				<button type="button" id="modify-order-empid-btn" value="수정">수정</button>
				<span>납기일</span>
				<input type="date" id="due-date" name="dueDate">
			</div>
		</div>	<!-- /class="receive-order-top-content" -->
		
		<div class="receive-order-table-content">
			
			<div id="table-insert-receive-form-container" style="display: none;">
				<form id="table-insert-receive-form" method="post" action="/sales/om/insert-receive-order" name="frm">
					<h5>수주서 작성하기</h5>
					<table id="table-insert-receive">
						<tr>
							<th>거래처코드</th>
							<td>
								<input type="text" id="customer-code" name="customerCode" required="required" readonly placeholder="조회를 클릭해주세요">
								<button id="customer-code-modal-btn" data-bs-toggle="modal" data-bs-target="#customer-code-modal" value="조회">조회</button>
							</td>
						</tr>
						<tr>
							<th>수주유형</th>
							<td>
								<select name="receiveOrderType" required="required">
									<option value="자체생산">자체생산</option>
									<option value="ODM">ODM</option>
									<option value="OEM">OEM</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>거래처명</th>
							<td>
								<input type="text" id="company-name-modal" name="companyName" required="required" readonly="readonly">
							</td>
						</tr>
						<tr>
							<th>수주일</th>
							<td><input type="date" name="orderDate" required="required"></td>
						</tr>
						<tr>
							<th>수주담당자</th>
							<td><input type="text" name="orderEmpid" required="required"></td>
						</tr>	
						<tr>
							<th>인도조건</th>
							<td>
							<select name="deliveryPlan">
								<option value="">없음</option>
								<option value="DDM">DDM</option>
							</select>
							</td>
						</tr>
						<tr>
							<th>납기일</th>
							<td><input type="date" name="dueDate" required="required" ></td>
						</tr>
						<tr>
							<td colspan="2">
							<input type="submit" value="확인" style="background-color: white;"></td>
						</tr>
					</table>
				</form>	<!-- /action="/sales/om/insert-receive-order" -->
			</div>	<!-- /id="table-insert-receive-form-container" -->
			
			<div id="table-content-div">
				<h4>수주서</h4>
				<table id="table-content">
					
					<thead>
						<tr>
							<th></th>
							<th>상태</th>
							<th>수주번호</th>
							<th>거래처코드</th>
							<th>수주유형</th>
							<th>거래처명</th>
							<th>수주일</th>
							<th>수주담당자</th>
							<th>인도조건</th>
							<th>납기일</th>
							<th>등록일자</th>
							<th>등록자</th>
							<th>수정일자</th>
							<th>수정자</th>
						</tr>
					</thead>
		
					<tbody id="table-content-body">
					</tbody>
					
				</table>
			</div>	<!-- /id="table-content-div" -->
			
			
			
			<!-- 회사코드 모달 창 -->
			<div class="modal fade" id="customer-code-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">거래처 선택</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div id="customer-code-list"></div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
						<button type="button" class="btn btn-primary">확인</button>
					</div>
					</div>
				</div>
			</div>
		
		</div>	<!-- /class="receive-order-table-content" -->
		
		
		<div class="receive-order-detail-top-content">
		
			<div >
			
				<span style="margin-left: 15px;">제품코드</span>
				<!-- <td> -->
					<input type="text" id="modify-item-code" name="itemCode" required="required" readonly="readonly">
				<!-- </td> -->
				<span>품명</span>
				<!-- <td> -->
					<input type="text" id="modify-item-name" name="itemName" required="required" readonly="readonly">
					<button type="button" id="modify-item-code-modal-btn" data-bs-toggle="modal" data-bs-target="#modify-item-code-modal" value="제품조회">제품조회</button>
					<button type="button" id="modify-item-btn" value="제품수정">제품수정</button>
				<!-- </td> -->
				<span>수량</span>
				<input type="number" id="modify-quantity" name="modifyQuantity" value="0">
				<span>단가</span>
				<input type="number" id="modify-price" name="modifyPrice" value="0"> 
				<span>금액</span>
				<input type="number" id="modify-amount" name="modifyAmount" value="0" readonly="readonly"> 
				<button type="button" id="modify-amount-btn" value="금액수정">금액수정</button><br>
				<span style="margin-left: 15px;">재고단위</span>
				<select id="item-stock-unit" name="itemStockUnit">
					<option value="EA">EA</option>
					<option value="KG">KG</option>
				</select>
				<span>비고</span>
				<input type="text" id="modify-memo" name="modifyMemo">
				<button type="button" id="modify-memo-btn" value="수정">수정</button>
				<span>마감여부</span>
				<select id="end-yn" name="endYn">
					<option value="N">N</option>
					<option value="Y">Y</option>
				</select>
				
			</div>
			
			<!-- 제품코드 수정 모달 창 -->
			<div class="modal fade" id="modify-item-code-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">제품 선택</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div id="modify-item-code-list"></div>
					</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
							<button type="button" class="btn btn-primary">확인</button>
						</div>
					</div>
				</div>
			</div>
			
		</div>	<!-- /class="receive-order-detail-top-content" -->
		
		<div class="receive-order-detail-content">
		
			<div id="table-insert-receive-detail-form-container" style="display: none;">
				<form id="table-insert-receive-detail-form" method="post" action="/sales/om/insert-receive-order-detail" name="frm-detail">
					<h5>세부항목 작성하기</h5>
					<table id="table-insert-receive-detail">
					
						<tr>
							<th>제품코드</th>
							<td>
								<input type="text" id="item-code" name="itemCode" required="required" readonly="readonly" placeholder="조회를 클릭해주세요">
								<button type="button" id="item-code-modal-btn" data-bs-toggle="modal" data-bs-target="#item-code-modal" value="제품조회">제품조회</button>
							</td>
						</tr>
						<tr>
							<th>품명</th>
							<td>
								<input type="text" id="item-name-modal" name="itemName" required="required" readonly="readonly">
							</td>
						</tr>
						<tr>
							<th>수량</th>
							<td><input type="number" id="quantity" name="quantity" value="0">
							</td>
						</tr>
						<tr>
							<th>단가</th>
							<td><input type="number" id="price" name="price" value="0"></td>
						</tr>
						<tr>
							<th>금액</th>
							<td><input type="number" id="amount" name="amount" value="0" readonly="readonly" ></td>
						</tr>	
						<tr>
							<th>재고단위</th>
							<td>
							<select name="itemStockUnit">
								<option value="EA">EA</option>
								<option value="KG">KG</option>
							</select>
							</td>
						</tr>
						<tr>
							<th>비고</th>
							<td><input type="text" name="memo" ></td>
						</tr>
						<tr>
							<th>마감여부</th>
							<td>
							<select name="endYn">
								<option value="N">N</option>
								<option value="Y">Y</option>
							</select>
							</td>
						</tr>
												
						<tr>
							<td colspan="2">
							<input type="submit" value="확인" style="background-color: white;"></td>
						</tr>
					</table>
		 			<!-- <input type="hidden" name="orderCodeHidden" id="order-code-hidden" value=""> --> 
					<input type="hidden" name="orderDetailCode" id="order-detail-code" value=""> 
					<input type="hidden" name="sorder" id="sorder" value=""> 
					
				</form>	<!-- /action="/sales/om/insert-receive-order-detail" -->
			</div>	<!-- /id="table-insert-receive-detail-form-container" -->
		
			<div id="table-detail-content-div">
				<h4>수주서 세부항목</h4>
				<table id="table-detail-content">
					<thead>
						<tr>
							<th></th>
							<th>제품코드</th>
							<th>품명</th>
							<th>수량</th>
							<th>단가</th>
							<th>금액</th>
							<th>재고단위</th>
							<th>비고</th>
							<th>마감여부</th>
						</tr>
					</thead>
					
					<tbody id="table-detaili-content-body">
					</tbody>
					
				</table>
			</div>	<!-- /id="table-detail-content-div" -->
			
			
			
			<!-- 제품코드 모달 창 -->
			<div class="modal fade" id="item-code-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">제품 선택</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div id="item-code-list"></div>
					</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
							<button type="button" class="btn btn-primary">확인</button>
						</div>
					</div>
				</div>
			</div>
		</div>	<!-- /class="receive-order-detail-content" -->
	</div>	<!-- /class="receive-order-container" -->
</div>	<!-- /class="receive-order-body-container" -->
