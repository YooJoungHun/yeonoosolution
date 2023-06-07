<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container">
	<div class="content">
		<div class="saveBtn">
			<button id="companyInfoSaveBtn" onclick="companyInfoSave()">저장</button>
			<span class="highLight">"*"</span> <span id="saveInfo">표시는 필수
				입력 값 입니다.</span>
		</div>
		<c:forEach var="companyList" items="${companyDtoList}">
			<table class="companyInfoTable">
				<tr>
					<th class="tableTitle">회사코드</th>
					<td><input type="text" id="companyCode" name="companyCode"
						value="${companyList.companyCode }" disabled="disabled"></td>
				</tr>
				<tr>
					<th class="tableTitle">구분<span class="highLight">*</span></th>
					<td><select id="businessType" name="businessType">
							<option value="--"
								${companyList.businessType == null ? 'selected = selected' : '' }>--

							
							<option value="개인"
								${companyList.businessType == '개인' ? 'selected = selected' : '' }>개인사업자

							
							<option value="법인"
								${companyList.businessType == '법인' ? 'selected = selected' : '' }>법인사업자

							
					</select></td>
				</tr>
				<tr>
					<th class="tableTitle">회사명<span class="highLight">*</span></th>
					<td><input type="text" id="companyName"
						value="${companyList.companyName }"></td>
				</tr>
				<tr>
					<th class="tableTitle">사업자등록번호<span class="highLight">*</span></th>
					<td><input type="text" id="businessCode"
						value="${companyList.businessCode }"></td>
				</tr>
				<tr>
					<th class="tableTitle">대표자 성명<span class="highLight">*</span></th>
					<td><input type="text" id="ownerName"
						value="${companyList.ownerName }"></td>
				</tr>
				<tr>
					<th class="tableTitle">전화번호<span class="highLight">*</span></th>
					<td><input type="text" id="tel" value="${companyList.tel }"></td>
				</tr>
				<tr>
					<th class="tableTitle">주소<span class="highLight">*</span></th>
					<td><input type="text" id="address"
						value="${companyList.address }"></td>
				</tr>
				<tr>
					<th class="tableTitle">회사로고</th>
					<td><input type="file" id="companyLogo"></td>
				</tr>
				<tr>
					<th class="tableTitle">회사로고사진</th>
					<td><img alt="UpLoad Image" id="companyLogoImg"
						src="${companyList.companyLogo}"></td>

				</tr>
			</table>
		</c:forEach>
	</div>
</div>
