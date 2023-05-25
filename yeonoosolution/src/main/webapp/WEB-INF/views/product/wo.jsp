<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/product/wo/wo.css"/>
</head>
<body>
	<div class="side-bar">
	<a href="#"></a>
	</div>
	<div class="container">
		<div class="wo-header">
			<div class="wo-header-actions">
				<button type="button">조회</button>
				<button type="button">저장</button>
				<button type="button">삭제</button>
				<button type="button">초기화</button>
				<button type="button">작업지시 확정</button>
				<button type="button">확정 취소</button>
			</div>
			<div class="wo-header-value">
				<div class="wo-header-item-group">
					<label for="workOrderType">유형</label>
					<select name="workOrderType">
						<option>--</option>
						<option>일반</option>
						<option>재작업</option>
						<option>개발품(시제품)</option>
					</select>
				</div>
				<div class="wo-header-item-group">
					<label for="workOrderDate">지시일</label>
					<input type="date" name="workOrderDate">
				</div>
			</div>
			<hr/>
			<div class="wo-header-search">
				<div class="wo-header-item-group">
					<label for="startDate">조회시작일</label>
					<input type="date" name="startDate">
				</div>
				<div class="wo-header-item-group">
					<label for="endDate">조회종료일</label>
					<input type="date" name="endDate">
				</div>
				<div class="wo-header-item-group">
					<label for="workOrderCode">작업지시번호조회</label>
					<input type="text" name="workOrderCode">
				</div>
				<div class="wo-header-item-group">
					<label for="whCode">창고</label>
					<input type="text" name="whCode">
				</div>
				<div class="wo-header-item-group">
					<label for="whName">창고명</label>
					<input type="text" name="whName">
				</div>
			</div>
		</div>
		<div class="wo-content">
			<div class="wo-list-header">
				<div class="wo-list-header-left">
					작업지시목록
				</div>
				<div class="wo-list-header-right">
					<input type="number">
					<button type="button">추가</button>
					<button type="button">제거</button>
					<button type="button">설정</button>
				</div>
			</div>
			<div class="wo-list-content">
				<table>
					<colgroup>
						<col style="width: 50px;">
						<col style="width: 50px;">
						<col style="width: 80.77778px;">
						<col style="width: 49.77778px;">
						<col style="width: 60.77778px;">
						<col style="width: 109.77778px;">
						<col style="width: 104.77778px;">
						<col style="width: 154.77778px;">
						<col style="width: 121px;">
						<col style="width: 305.77778px;">
						<col style="width: 49.77778px;">
						<col style="width: 92.77778px;">
						<col style="width: 91.77778px;">
						<col style="width: 110.77778px;">
					</colgroup>
					<thead>
						<tr>
							<th></th>
							<th><input type="checkbox"></th>
							<td>지시번호</td>
							<td>상태</td>
							<td>유형</td>
							<td>지시일</td>
							<td>완료일</td>
							<td>ITEM코드</td>
							<td>품목유형</td>
							<td>품명</td>
							<td>수량</td>
							<td>창고</td>
							<td>창고명</td>
							<td>작업지시유형</td>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="wo" items="${woList }" varStatus="status">
						<tr>
							<th>${status.count }</th>
							<th><input type="checkbox"></th>
							<td>${wo.workOrderCode }</td>
							<td>${wo.workOrderStatus }</td>
							<td>
								<select style="width: 60px;">
									<option>일반</option>
									<option>재작업</option>
									<option>개발품(시제품)</option>
								</select>
							</td>
							<td><fmt:formatDate value="${wo.workOrderDate }" pattern="yyyy-MM-dd"/></td>
							<td><fmt:formatDate value="${wo.finishDate }" pattern="yyyy-MM-dd"/></td>
							<td>${wo.itemCode }</td>
							<td><!-- itemType --></td>
							<td><!-- itemName --></td>
							<td>${wo.itemQuantity }</td>
							<td>${wo.whCode }</td>
							<td><!-- whName --></td>
							<td>${wo.workOrderType }</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>