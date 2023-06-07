<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="container">
	<h4>이동현황</h4>
	<div class="buttons">
		<button id="searchBtn">조회</button>
		<button id="resetBtn">초기화</button>
	</div>
	<input id="searchDateStart" type="text" placeholder="시작일">
	<input id="searchDateEnd" type="text" placeholder="종료일">
	<input id="searchInput" type="text" placeholder="통합 검색">
	<table id="stockMove">
		<thead>
			<tr>
				<th>No.</th>
				<th>이동번호</th>
				<th>이동일자</th>
				<th>제품코드</th>
				<th>품명</th>
				<th>재고수량</th>
				<th>출고창고</th>
				<th>입고창고</th>
				<th>이동수량</th>
				<th>상태</th>
				<th>비고</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="move" items="${stockMoveStatus}" varStatus="status">
				<tr>
					<td>${status.count }</td>
					<td>${move.moveCode }</td> <!-- 이동번호 -->
					<td>${move.moveDate }</td> <!-- 이동일자 -->
					<td>${move.itemCode }</td>
					<td>${move.itemName }</td>
					<td>${move.stockQuantity }</td>
					<td>${move.whCodeOut }</td>
					<td>${move.whCodeIn}</td>
					<td>${move.moveQuantity }</td>
					<td>${move.moveType }</td>
					<td>${move.memo }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<script type="text/javascript">
	$(document).ready(function() {
		$("#searchDateStart").datepicker({
			dateFormat: "yy-mm-dd",
			onClose: function(selectedDate) {
				$("#searchDateEnd").datepicker("option", "minDate", selectedDate);
			}
		}).attr("readonly", "readonly");
		
		$("#searchDateEnd").datepicker({
			dateFormat: "yy-mm-dd",
			onClose: function(selectedDate) {
				$("#searchDateStart").datepicker("option", "maxDate", selectedDate);
			}
		}).attr("readonly", "readonly");
	});
	
	$('#searchBtn').click(function() {
		let keyword = $('#searchInput').val().toLowerCase().trim();
		
		let startDate = $('#searchDateStart').val();
		let endDate = $('#searchDateEnd').val();
		
		$.ajax({
			url: '/product/stockMoveSearch/',
			method: 'GET',
			data: {
				keyword: keyword,
				startDate: startDate,
				endDate: endDate
				},
			success: function(data) {
                $("#stockMove tbody").empty();
                /* tbody append */
                $.each(data, function(index, item) {
                    var row = $("<tr>");
                    row.append($("<td>").text(index + 1));
                    row.append($("<td>").text(item.moveCode));
                    row.append($("<td>").text(item.moveDate));
                    row.append($("<td>").text(item.itemCode));
                    row.append($("<td>").text(item.itemName));
                    row.append($("<td>").text(item.stockQuantity));
                    row.append($("<td>").text(item.whCodeOut));
                    row.append($("<td>").text(item.whCodeIn));
                    row.append($("<td>").text(item.moveQuantity));
                    row.append($("<td>").text(item.moveType));
                    row.append($("<td>").text(item.memo));
                    row.append($("</tr>"));

                    $("#stockMove tbody").append(row);
                });
            }
		});
	});
	
	$('#resetBtn').click(function (){
		$('#searchInput').val('');
		$('#searchDateStart').val('');
		$('#searchDateEnd').val('')
		//날짜 초기화
		$("#searchDateStart").datepicker("option", "maxDate", null);
		$("#searchDateEnd").datepicker("option", "minDate", null);
	});
</script>