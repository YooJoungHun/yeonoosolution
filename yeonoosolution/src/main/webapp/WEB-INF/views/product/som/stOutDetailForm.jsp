<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>

	#stOutDetailTable2 {
   		border-collapse: collapse;
		background-color: #F8F8F8;
		padding: 20px;
		width: 100%;
		text-align: center;
	}
	
	.itemCodeTd,
	.itemNameTd,
	.whCodeStTd {
		background-color: #d9d9d9;
	}
	.outQuantityTd,
	.memoStTd {
		background-color: #ffffcc;
	}
	
</style>

<table id="stOutDetailTable2" border="1">
	<tr>
		<th>순번</th>
		<th>제품코드</th>
		<th>제품명</th>
		<th>창고코드</th>
		<th>출고수량</th>
		<th>비고</th>
	</tr>
	<c:forEach var="stOutDetail" items="${stOutDetailList }" varStatus="status">
		<tr>
			<td>${stOutDetail.sorder }</td>
			<td class="itemCodeTd">${stOutDetail.itemCode }</td>
			<td class="itemNameTd">${stOutDetail.itemName }</td>
			<td class="whCodeStTd">${stOutDetail.whCode }</td>				
			<td class="outQuantityTd">${stOutDetail.outQuantity }</td>				
			<td class="memoStTd">${stOutDetail.memo}</td>				
		</tr>
	</c:forEach>
</table>
