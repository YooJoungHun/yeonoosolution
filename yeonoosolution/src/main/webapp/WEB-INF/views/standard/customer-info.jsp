<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="customerInfoContainer">

	<div class="content">

		<div class="crudBtn">
			<button id="searchBtn" onclick="searchCompanyInfo()">조회</button>
			<button id="insertBtn" type="button" data-bs-toggle="modal"
				data-bs-target="#staticBackdrop">등록</button>
			<button id="saveBtn" onclick="modifyCompanyInfoBtn('1')">저장</button>
			<button id="deleteBtn" onclick="modifyCompanyInfoBtn('2')">삭제</button>
			<button id="resetBtn" onclick="resetCompanyInfo()">초기화</button>
		</div>

		<!-- Modal -->
		<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
			data-bs-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-scrollable">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="staticBackdropLabel">신규 거래처
							입력</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<form action="">
							<div class="mb-3">
								<label for="recipient-name" class="col-form-label">거래처명:</label>
								<input type="text" class="form-control" id="modalCompanyName"
									name="companyName" required="required">
							</div>
							<div class="mb-3">
								<label for="recipient-name" class="col-form-label">사업자등록번호:</label>
								<input type="text" id="modalBusinessCode" class="form-control"
									name="businessCode" required="required"
									placeholder="###-##-#####">
							</div>
							<div class="mb-3">
								<label for="recipient-name" class="col-form-label">대표명:</label>
								<input type="text" id="modalOwnerName" class="form-control"
									name="ownerName" required="required">
							</div>
							<div class="mb-3">
								<label for="recipient-name" class="col-form-label">사업자구분:</label>
								<select id="modalBusinessType" name="businessType"
									required="required">
									<option value="--" selected="selected">--
									<option value="개인">개인사업자
									<option value="법인">법인사업자
								</select>
							</div>
							<div class="mb-3">
								<label for="recipient-name" class="col-form-label">거래처주소:</label>
								<input type="text" id="modalAddress" name="address"
									class="form-control" required="required">
							</div>
							<div class="mb-3">
								<label for="recipient-name" class="col-form-label">수/발주:</label>
								<select id="modalOrderType" name="orderType">
									<option value="--" selected="selected">--
									<option value="수주">수주
									<option value="발주">발주
								</select>
							</div>
							<div class="mb-3">
								<label for="recipient-name" class="col-form-label">전화번호:</label>
								<input type="text" id="modalTel" class="form-control" name="tel"
									required="required" placeholder="##-####-#### or ###-####-####">
							</div>
							<button type="reset" class="btn btn-primary">초기화</button>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">닫기</button>
						<button type="button" class="btn btn-primary"
							onclick="insertCompanyInfo()">등록</button>
					</div>
				</div>
			</div>
		</div>


		<div class="filter">

			<div class="form-data">거래처명</div>

			<div class="form-content">
				<input type="text" name="companyName" id="filterCompanyName">
			</div>

			<div class="form-data">수/발주</div>

			<div class="form-content">
				<select id="filterOrderType" name="orderType">
					<option value="--" selected="selected">--
					<option value="수주">수주
					<option value="발주">발주
				</select>
			</div>

		</div>



		<div class="tableHeader">
			<div class="tableTitle">거래처목록</div>
		</div>

		<div class="customerInfo">
			<table id="customerInfoTable">
				<tr>
					<th class="rowCount"></th>
					<th><input type="checkbox" id="allCheck"
						onclick="checkBoxAllCheck()"></th>
					<th>회사코드</th>
					<th>거래처명</th>
					<th>사업자구분</th>
					<th>거래처주소</th>
					<th>수/발주</th>
					<th>사업자등록번호</th>
					<th>전화번호</th>
					<th>대표</th>
					<th>사용여부</th>
				</tr>
				<tbody id="customerInfoTbody">
					<c:forEach var="customerList" items="${customerLists}"
						varStatus="status">
						<tr>
							<td class="rowCount"><input type="text" class="rowCount"
								value="${status.count }"></td>
							<td><input type="checkbox" name="tableCheckBox"
								id="tableCheckBox${status.index }"></td>
							<td class="bg-gray"><input type="text" name="companyCode"
								id="companyCode${status.index }"
								value="${customerList.companyCode }" disabled="disabled">
							</td>
							<td class="bg-yellow"><input class="bg-yellow" type="text"
								name="companyName" id="companyName${status.index }"
								value="${customerList.companyName }" required="required">
							</td>
							<td class="bg-yellow"><select class="bg-yellow"
								id="businessType${status.index }" name="businessType"
								required="required">
									<option value=""
										${customerList.businessType == null ? 'selected = selected' : '' }>--
									
									<option value="개인"
										${customerList.businessType == '개인' ? 'selected = selected' : '' }>개인사업자
									
									<option value="법인"
										${customerList.businessType == '법인' ? 'selected = selected' : '' }>법인사업자
									
							</select></td>
							<td class="bg-yellow"><input class="bg-yellow" type="text"
								name="address" id="address${status.index }"
								value="${customerList.address }" required="required"></td>
							<td class="bg-yellow"><select class="bg-yellow"
								id="orderType${status.index }" name="orderType"
								required="required">
									<option value=""
										${customerList.orderType == null ? 'selected = selected' : '' }>--
									
									<option value="수주"
										${customerList.orderType == '수주' ? 'selected = selected' : '' }>수주
									
									<option value="발주"
										${customerList.orderType == '발주' ? 'selected = selected' : '' }>발주
									
							</select></td>
							<td class="bg-yellow"><input class="bg-yellow" type="text"
								name="businessCode" id="businessCode${status.index }"
								value="${customerList.businessCode }" required="required">
							</td>
							<td class="bg-yellow"><input class="bg-yellow" type="text"
								name="tel" id="tel${status.index }" value="${customerList.tel }"
								required="required"></td>
							<td class="bg-yellow"><input class="bg-yellow" type="text"
								name="ownerName" id="ownerName${status.index }"
								value="${customerList.ownerName }" required="required">
							</td>
							<td class="bg-gray"><input type="text" name="useYn"
								id="useYn${status.index }" value="${customerList.useYn }"
								disabled="disabled" required="required"></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>

