<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="container">
	<div class="content">
		<div class="input-div">
		<h2>창고별 재고 현황</h2>
			<div>
				<label>창고 구분</label> 
				<select id="wh-name">
					<option selected disabled style="text-align: center;">검색할 창고를 선택하세요</option>
				<c:forEach var="wh" items="${whDtoWhList}">
				<c:choose>
				<c:when test="${wh.useYn eq 'N'}">
					<option disabled="disabled">${wh.whName} * 해당창고는 현재 사용할 수 없습니다</option>
				</c:when>
				<c:otherwise>
					<option value="${wh.whCode}">${wh.whName}</option>
				</c:otherwise>
				</c:choose>
				</c:forEach>
				</select> 
				<input class="btn search-btn" type="button" value="조회">
			</div>
		</div>
		
		<div class="wh-list">
			<table class="wh-data">
				<tr>
					<th>창고 코드</th>
					<th>창고 명</th>
					<th>회사 명</th>
					<th>제품 코드</th>
					<th>제품 명</th>
					<th>양품 수량</th>
					<th>불량 수량</th>
					<th>입고 근무자</th>
					<th>입고 일자</th>
				</tr>
				
				<c:forEach var="whMap" items="${whDtoMap.whDtoList}">
				<tr class="for-data">
					<td class="wd-code">${whMap.wdCode}</td>
					<td class="wh-name">${whMap.whName}</td>
					<td class="company-code">${whMap.companyCode}</td>
					<td class="item-code">${whMap.itemCode}</td>
					<td class="item-name">${whMap.itemName}</td>
					<td class="good-quantity">${whMap.goodQuantity}</td>
					<td class="bad-quantity">${whMap.badQuantity}</td>
					<td class="member-name">${whMap.memberName}</td>
					<td class="update-date">${whMap.updateDate}</td>
				</tr>
				</c:forEach>
			</table>
		</div>
		<div class="pagination">	
			<a class="btn" href="/product/is/wh/${whCode}?currentPage=${whDtoMap.pagination.currentPage > 1 ? whDtoMap.pagination.currentPage - 1 : 1}">&lt;</a>
		<c:forEach var="i" begin="${whDtoMap.pagination.startNum}" end="${whDtoMap.pagination.lastNum}">
			<a class="btn" href="/product/is/wh/${whCode}?currentPage=${i}">${i}</a>
		</c:forEach>
			<a class="btn" href="/product/is/wh/${whCode}?currentPage=${whDtoMap.pagination.currentPage < whDtoMap.pagination.lastNum ? whDtoMap.pagination.currentPage + 1 : whDtoMap.pagination.lastNum}">&gt;</a>
		</div>
	</div>
</div>