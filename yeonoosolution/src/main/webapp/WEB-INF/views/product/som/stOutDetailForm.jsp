<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<table id="stOutDetailTable" border="1">
	<tr>
		<td>순번</td>
		<td>제품코드</td>
		<td>제품명</td>
		<td>창고코드</td>
		<td>출고수량</td>
		<td>비고</td>
	</tr>
	<c:forEach var="stOutDetail" items="${stOutDetailList }" varStatus="status">
		<tr>
			<td>${stOutDetail.sorder }</td>
			<td>${stOutDetail.itemCode }</td>
			<td>${stOutDetail.itemName }</td>
			<td>${stOutDetail.whCode }</td>				
			<td>${stOutDetail.outQuantity }</td>				
			<td>${stOutDetail.memo}</td>				
		</tr>
	</c:forEach>
</table>
